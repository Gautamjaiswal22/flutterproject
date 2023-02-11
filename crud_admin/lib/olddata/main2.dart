import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter crud',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Flutter crud demo'),
      home: const MainPage(),
    );
  }
}

// ----------------------read data----------------------
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("all users"),
        ),
        body: StreamBuilder<List<User>>(
            stream: readUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("Something went Wrong ${snapshot.error}");
              } else if (snapshot.hasData) {
                final users = snapshot.data!;
                return ListView(children: users.map(buildUser).toList());
                return Text("data found");
              } else {
                return Text(" data not found");
                // return Center(child: CircularProgressIndicator());
              }
            }),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => UserPage()));
          },
        ),
      );

  Widget buildUser(User user) => ListTile(
        leading: CircleAvatar(child: Text('${user.age}')),
        title: Text(user.name),
      );

  Stream<List<User>> readUsers() => FirebaseFirestore.instance
      .collection("user")
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
}

//--------------------------------------------------

//-----------------write data------------------------
class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final controllerName = TextEditingController();
  final controllerAge = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Add User'),
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: <Widget>[
            TextField(
              controller: controllerName,
              decoration: InputDecoration(
                helperText: 'NAME',
                hintText: 'NAME',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: controllerAge,
              decoration: InputDecoration(
                hintText: 'AGE',
                helperText: 'AGE',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              child: Text('create'),
              onPressed: () {
                final user = User(
                  name: controllerName.text,
                  age: int.parse(controllerAge.text),
                );
                print(user);
                createUser(user);
                // Navigator.pop(context);
              },
            )
          ],
        ),
      );

  Future createUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection("user").doc();
    // final json1 = {'name': name, 'age': 21, 'birthday': DateTime(2002, 5, 22)};

    user.id = docUser.id;
    final json = user.toJson();
    await docUser.set(json);
  }
}

class User {
  String id;
  final String name;
  final int age;

  User({
    this.id = '',
    required this.name,
    required this.age,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'age': age,
      };

  static User fromJson(Map<String, dynamic> json) =>
      User(id: json['id'], name: json['name'], age: json['age']);
}

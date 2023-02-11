import 'package:firebase_database/firebase_database.dart';

Future<void> main(List<String> args) async {
  FirebaseDatabase database = FirebaseDatabase.instance;
// DatabaseReference ref = FirebaseDatabase.instance.ref();
  DatabaseReference ref = FirebaseDatabase.instance.ref("medicines");
  await ref.set({
    "name": "John",
    "age": 18,
    "address": {"line1": "100 Mountain View"}
  });

  // DatabaseReference ref = FirebaseDatabase.instance.ref("users/123");

// Only update the name, leave the age and address!
  await ref.update({
    "age": 19,
  });
}

// class Need {
//   final String? id;
//   final String? imageUrl;
//   final String? caption;
//   final String? title;

//   Need({
//     this.id,
//     this.imageUrl,
//     this.caption,
//     this.title,
//   });

//   Need.fromSnapshot(DataSnapshot snapshot)
//       : id = snapshot.key,
//         imageUrl = snapshot.value["imageUrl"],
//         caption = snapshot.value["caption"],
//         title = snapshot.value["postTitle"];

//   toJson() {
//     return {
//       "imageUrl": imageUrl,
//       "caption": caption,
//       "title": title,
//     };
//   }
// }

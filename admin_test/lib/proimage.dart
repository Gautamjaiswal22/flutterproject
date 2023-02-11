// main.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class imagePage extends StatefulWidget {
  const imagePage({Key? key}) : super(key: key);

  @override
  _imagePageState createState() => _imagePageState();
}

class _imagePageState extends State<imagePage> {
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseFirestore imageins = FirebaseFirestore.instance;
  // DocumentReference documentStream = FirebaseFirestore.instance.collection('users').doc('ABC123').snapshots();

  // Select and image from the gallery or take a picture with the camera
  // Then upload to Firebase Storage
  // Future<void> _upload(String inputSource) async {
  //   final picker = ImagePicker();
  //   XFile? pickedImage;
  //   try {
  //     pickedImage = await picker.pickImage(
  //         source: inputSource == 'camera'
  //             ? ImageSource.camera
  //             : ImageSource.gallery,
  //         maxWidth: 1920);

  //     final String fileName = path.basename(pickedImage!.path);
  //     File imageFile = File(pickedImage.path);

  //     try {
  //       // Uploading the selected image with some custom meta data
  //       await storage.ref(fileName).putFile(
  //           imageFile,
  //           SettableMetadata(customMetadata: {
  //             'uploaded_by': 'A bad guy',
  //             'description': 'Some description...'
  //           }));

  //       // Refresh the UI
  //       setState(() {});
  //     } on FirebaseException catch (error) {
  //       if (kDebugMode) {
  //         print(error);
  //       }
  //     }
  //   } catch (err) {
  //     if (kDebugMode) {
  //       print(err);
  //     }
  //   }
  // }

  // Retriew the uploaded images
  // This function is called when the app launches for the first time or when an image is uploaded or deleted
  Future<List<Map<String, dynamic>>> _loadImages() async {
    List<Map<String, dynamic>> files = [];

    final ListResult result = await storage.ref().list();
    final List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      final String fileUrl = await file.getDownloadURL();
      final FullMetadata fileMeta = await file.getMetadata();
      files.add({
        "url": fileUrl,
        "path": file.fullPath,
        "uploaded_by": fileMeta.customMetadata?['uploaded_by'] ?? 'Nobody',
        "description":
            fileMeta.customMetadata?['description'] ?? 'No description'
      });
    });
    print(files[0]['url']);
    print(files[1]);

    return files;
  }

  // Delete the selected image
  // This function is called when a trash icon is pressed
  // Future<void> _delete(String ref) async {
  //   await storage.ref(ref).delete();
  //   // Rebuild the UI
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JAISWAL'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 250.0,
        //   Padding(
        // padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: _loadImages(),
                builder: (context,
                    AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      // itemCount: 1,
                      scrollDirection: Axis.horizontal,

                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        // return
                        //           Container(
                        // height: 200,
                        // margin: EdgeInsets.all(20),
                        // decoration: BoxDecoration(
                        //     boxShadow: [BoxShadow(blurRadius: 3, color: Colors.black26)],
                        //     borderRadius: BorderRadius.circular(100),
                        //     color: Colors.green),

                        final Map<String, dynamic> image =
                            snapshot.data![index];
                        return Card(
                          elevation: 5,
                          margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                    child: Container(
                                  padding: EdgeInsets.only(bottom: 8),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 8, right: 8),
                                          child: Image.network(image['url'])),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: 8, right: 8),
                                        child: Text("MRP : ₹ ",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: 8, right: 8),
                                        child: Text("RATE : ₹ ",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          ),
                          // );

                          // Card(
                          //   margin: const EdgeInsets.symmetric(vertical: 10),
                          //   child: ListTile(
                          //     dense: false,
                          //     leading: Image.network(image['url']),
                          //   ),
                          // );
                        );
                      },
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

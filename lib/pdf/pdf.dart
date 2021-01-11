
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'Modal.dart';
import 'secondPage.dart';



class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  List<Modal> itemList=List();
  final mainReference = FirebaseDatabase.instance.reference().child('Database');
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: itemList.length==0?Text("LOADING. . . . . "):ListView.builder(
        itemCount:itemList.length,
        itemBuilder: (context,index){
          return Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: GestureDetector(
                onTap: (){
                  String passData=itemList[index].link;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context)=>ViewPdf(),
                          settings: RouteSettings(
                            arguments: passData,
                          )
                      )
                  );
                },

                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/bgImage.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 140,
                        child: Card(
                          margin: EdgeInsets.all(18),
                          elevation: 7.0,
                          child: Center(
                            child: Text(itemList[index].name+" "+(index+1).toString()),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getPdfAndUpload();
        },
        child: Icon(Icons.add,color: Colors.white,),
        backgroundColor: Colors.red,
      ),
    );
  }
  Future getPdfAndUpload()async{
    var rng = new Random();
    String randomName="";
    for (var i = 0; i < 20; i++) {
      print(rng.nextInt(100));
      randomName += rng.nextInt(100).toString();
    }
    File file = await FilePicker.getFile(type: FileType.custom);
    String fileName = '$randomName.pdf';
    savePdf(file.readAsBytesSync(), fileName);
    //function call
  }
  savePdf(List<int> asset, String name) async {
    StorageReference reference = FirebaseStorage.instance.ref().child(name);
    StorageUploadTask uploadTask = reference.putData(asset);
    String url = await (await uploadTask.onComplete).ref.getDownloadURL();
    documentFileUpload(url);



    //
    //
    // StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(name);
    // StorageUploadTask uploadTask = firebaseStorageRef.putData(asset);
    // StorageTaskSnapshot taskSnapshot;
    // await uploadTask.onComplete.then((value) {
    //   if (value.error == null)
    //   {
    //     taskSnapshot = value;
    //     taskSnapshot.ref.getDownloadURL().then((downloadUrl) {
    //       pdfUrl = downloadUrl;
    //       FirebaseFirestore.instance.collection('pdf').doc(name).set({
    //         'pdfUrl': pdfUrl
    //
    //       });
    //       documentFileUpload(pdfUrl);
    //     });
    //
    //   }else{
    //     return  setState(() {
    //       print("sorry");
    //       Scaffold.of(context).showSnackBar(SnackBar(content: Text('sorry')));
    //     });
    //   }
    // });
    // setState(() {
    //   print("pdf file uploaded");
    //   Scaffold.of(context).showSnackBar(SnackBar(content: Text('pdf file uploaded')));
    // });
    //
    //
    //
    //
    //
    //














    //function call
  }
  String CreateCryptoRandomString([int length = 32]) {
    final Random _random = Random.secure();
    var values = List<int>.generate(length, (i) => _random.nextInt(256));
    return base64Url.encode(values);
  }
  void documentFileUpload(String str) {
    var data = {
      "pdf": str,
      "FileName": "Assignment",
    };
    mainReference.child(CreateCryptoRandomString()).set(data).then((v) {
      print("Store Successfully");
    });
  }

  @override
  void initState() {
    mainReference.once().then((DataSnapshot snap){
      print(snap);
      var data=snap.value;
      print(data);
      // ignore: unnecessary_statements
      itemList.clear;
      data.forEach((key,value){
        Modal m=new Modal(value['pdf'], value['FileName']);
        itemList.add(m);

      });
      setState(() {
        // print ("Value is");
        // print (itemList.length);
      });
    });
  }


}

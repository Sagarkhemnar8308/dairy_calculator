import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dairy_calculator/services/database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:random_string/random_string.dart';

class CowDateTable extends StatefulWidget {
  const CowDateTable({super.key});

  @override
  State<CowDateTable> createState() => _CowDateTableState();
}

class _CowDateTableState extends State<CowDateTable> {
  final _namecontroller = TextEditingController();
  final _ageController = TextEditingController();
  final _locationController = TextEditingController();
  Stream? employeeStream;

  getontheload() async {
    employeeStream = await ContactMethod().getEmployeeDetails();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getontheload();
  }

  Widget allEmployeeDetails() {
    return StreamBuilder(
        stream: employeeStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey)),
                          height: 110,
                          width: double.infinity,
                          child: Row(
                            children: [
                              ds["ImgUrl"] != null
                                  ? InkWell(
                                      onTap: () {
                                        showDialogHero(context, ds["ImgUrl"]);
                                      },
                                      child: CircleAvatar(
                                        radius: 30,
                                        backgroundImage:
                                            NetworkImage(ds["ImgUrl"]),
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        showDialogHero(context, ds["ImgUrl"]);
                                      },
                                      child: const CircleAvatar(
                                        radius: 30,
                                        backgroundImage:
                                            AssetImage('asset/download.png'),
                                      ),
                                    ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: 245,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      // ignore: prefer_interpolation_to_compose_strings
                                      "CowName : " + ds["Name"],
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                    Text(
                                      // ignore: prefer_interpolation_to_compose_strings
                                      "Date : " + ds["Date"],
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                    Text(
                                      // ignore: prefer_interpolation_to_compose_strings
                                      "Flag No : " + ds['FlagNo'],
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            _namecontroller.text = ds['Name'];
                                            _ageController.text = ds["Date"];
                                            _locationController.text =
                                                ds["FlagNo"];
                                            editEmployeeData(ds["Id"]);
                                          },
                                          child: const Icon(Icons.edit)),
                                      InkWell(
                                          onTap: () async {
                                            await ContactMethod()
                                                .deleteEmployeeDetails(
                                                    ds["Id"]);
                                          },
                                          child: const Icon(Icons.delete)),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  },
                )
              : const SizedBox();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 50,
        width: 180,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FormPage(),
                  ));
            },
            child: const Text(
              " + Cow Details ",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Cow Details",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(child: allEmployeeDetails()),
          ],
        ),
      ),
    );
  }

  Future editEmployeeData(String id) => showDialog(
        context: context,
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green,
              title: const Text("Edit user ..............."),
            ),
            body: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 150,
                    ),
                    TextFormField(
                      controller: _namecontroller,
                      decoration: const InputDecoration(
                          hintText: "Name", border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _ageController,
                      decoration: const InputDecoration(
                          hintText: "date", border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _locationController,
                      decoration: const InputDecoration(
                          hintText: "Flag Number",
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          onPressed: () {
                            Map<String, dynamic> updateInfo = {
                              "Name": _namecontroller.text,
                              "Date": _ageController.text,
                              "FlagNo": _locationController.text,
                              "Id": id
                            };
                            ContactMethod()
                                .updateEmployeeDetails(id, updateInfo)
                                .then((value) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const CowDateTable(),
                                  ));
                            });
                          },
                          child: const Text(
                            "Edit data",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                    )
                  ],
                )),
          );
        },
      );
}

class FormPage extends StatefulWidget {
  const FormPage({super.key});
  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  Uint8List? image;
  File? selectedIamge;
  @override
  Widget build(BuildContext context) {
    final namecontroller = TextEditingController();
    final mobilecontroller = TextEditingController();
    final emailcontroller = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  image != null
                      ? CircleAvatar(
                          radius: 100,
                          backgroundImage: MemoryImage(image!),
                        )
                      : const CircleAvatar(
                          radius: 100,
                          backgroundImage: AssetImage('asset/download.png'),
                        ),
                  Positioned(
                    bottom: 0.0,
                    right: 20,
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(25)),
                      child: InkWell(
                        onTap: () async{
                         File? selectedIamge = await getImageFromGallery(context);
                         print("$selectedIamge");
                         if(selectedIamge != null){
                       bool success= await uploadFileForUser(selectedIamge);
                       print("success $success");
                         }
                         print(selectedIamge);
                        },
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          size: 40.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: namecontroller,
                decoration: const InputDecoration(
                    hintText: "Cow Name *", border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                onTap: () {
                  _datePick(mobilecontroller, context);
                },
                readOnly: true,
                controller: mobilecontroller,
                decoration: const InputDecoration(
                    hintText: "Date *", border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: emailcontroller,
                decoration: const InputDecoration(
                    hintText: "Bill No *", border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () async {
                      String id = randomAlphaNumeric(30);
                     
                      Map<String, dynamic> employeeInfoMap = {
                        "Name": namecontroller.text,
                        "Date": mobilecontroller.text,
                        "FlagNo": emailcontroller.text,
                        "Id": id,
                        "ImgUrl": null,
                      };
                      await ContactMethod()
                          .addEmployeeDetails(employeeInfoMap, id)
                          .then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            backgroundColor: Colors.green,
                            content: Text(
                                "Cow Added Successfull y..........................")));

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CowDateTable(),
                            ));
                      });
                    },
                    child: const Text(
                      "Add New Cow",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              )
            ],
          ),
        )),
      ),
    );
  }

  void showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  child: SizedBox(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                           // pickImageFromGallery();
                          },
                          child: const Icon(
                            Icons.image,
                            size: 50,
                          ),
                        ),
                        const Text("Gallery",
                            style:
                                TextStyle(color: Colors.black, fontSize: 13)),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                 //   pickImageFromCamera();
                  },
                  child: const SizedBox(
                    child: Column(
                      children: [
                        InkWell(
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: 50,
                          ),
                        ),
                        Text(
                          "Camera",
                          style: TextStyle(color: Colors.black, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

// //gallery
//   Future pickImageFromGallery() async {
//     final returnimage =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (returnimage == null) {
//       return "error to pick jfp";
//     }
//     setState(() {
//       selectedIamge = File(returnimage.path);
//       image = File(returnimage.path).readAsBytesSync();
//     });
//   }

// //camera
//   Future pickImageFromCamera() async {
//     final returnimage =
//         await ImagePicker().pickImage(source: ImageSource.camera);
//     if (returnimage == null) return;
//     setState(() {
//       selectedIamge = File(returnimage.path);
//       image = File(returnimage.path).readAsBytesSync();
//     });
//   }
}

_datePick(TextEditingController controller, BuildContext context) async {
  DateTime currentDate = DateTime.now();

  DateTime? selectedDate = await showDatePicker(
    context: context,
    firstDate: currentDate,
    lastDate: DateTime(2030),
    initialDate: currentDate,
  );

  if (selectedDate != null) {
    String formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate);
    controller.text = formattedDate;
  }
}

void showDialogHero(BuildContext context, DocumentSnapshot ds) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: ds["ImgUrl"] != null
            ? CircleAvatar(
                radius: 200,
                backgroundImage: MemoryImage(ds["ImgUrl"]),
              )
            : const CircleAvatar(
                radius: 200,
                backgroundImage: AssetImage('asset/download.png'),
              ),
      );
    },
  );
}



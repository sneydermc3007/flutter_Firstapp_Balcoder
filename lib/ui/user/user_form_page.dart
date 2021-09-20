import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_app_balcoder/utils/custom_container.dart';
import 'package:flutter_first_app_balcoder/utils/custom_textform.dart';

class UserFormPage extends StatefulWidget {
  const UserFormPage({Key? key}) : super(key: key);

  @override
  _UserFormPageState createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  late TextEditingController controllerName;
  late TextEditingController controllerEmail;

    bool isLoading = false;

    @override
  void initState() {
    super.initState();

    controllerName = new TextEditingController(text: "");
    controllerEmail = new TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height * 0.05;
    double _width = MediaQuery.of(context).size.width * 0.65;

return Scaffold(
      body: Container(
        child: Center(
            child: !isLoading ? Column(
          children: [
            Spacer(),
            Container(
              child: CustomTextForm(
                name: "nombre usuario", NameVariable: controllerName,
              ),
            ),
            Container(
              child: CustomTextForm(
                name: "correo", NameVariable: controllerEmail,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isLoading = true;
                });
                print("User Name + " + controllerName.text);
                print("User Email" + controllerEmail.text);

                FirebaseFirestore.instance.collection("userCollection").add({
                              "userName": controllerName.text,
                              "userEmail": controllerEmail.text
                            },
                            ).then((value) { print("user Added");

                controllerName.text = "";
                controllerEmail.text = "";
                setState(() {
                isLoading = false;
                          });
                });
              },
              child: CustomContainer(
                titleText: "Add User",
                sizeHeight: _height * 1,
                sizeWidth: _width * 0.65,
                color: Colors.green,
              ),
            ),
            Spacer(),
          ],
        ): CircularProgressIndicator()),
      ),
    );
  }
}
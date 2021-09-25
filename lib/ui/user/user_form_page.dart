import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_app_balcoder/utils/custom_container.dart';
import 'package:flutter_first_app_balcoder/utils/custom_textform.dart';
import 'model/user_model.dart';

class UserFormPage extends StatefulWidget {
  UserFormPage({Key? key, required this.userModel}) : super(key: key);

  UserModel userModel;

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

    print(widget.userModel.userName);
    print(widget.userModel.userEmail);

    if (widget.userModel.key != null) {
      controllerName= new TextEditingController(text: widget.userModel.userName);
      controllerEmail = new TextEditingController(text: widget.userModel.userEmail);
    }else {
      controllerName = new TextEditingController(text: "");
      controllerEmail = new TextEditingController(text: "");
    }

    controllerName = new TextEditingController(text: "");
    controllerEmail = new TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height * 0.05;
    double _width = MediaQuery.of(context).size.width * 0.65;

return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("User Form Page"),
        ),
      ),
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

                    if(widget.userModel.key != null){
                      print("User Name + " + controllerName.text);
                      print("User Email" + controllerEmail.text);

                      FirebaseFirestore.instance.collection("userCollection").doc(widget.userModel.key)
                        .update({
                        "userName": controllerName.text,
                        "userEmail": controllerEmail.text
                      },
                      ).then((value) { print("user Updated");

                      controllerName.text = "";
                      controllerEmail.text = "";
                      setState(() {
                        isLoading = false;
                      });
                      });
                    }else{
                      print("User Name + " + controllerName.text);
                      print("User Email" + controllerEmail.text);

                      FirebaseFirestore.instance.collection("userCollection").add({
                        "userName": controllerName.text,
                        "userEmail": controllerEmail.text,
                        "isDeleted": false
                      },
                      ).then((value) { print("user Added");

                      controllerName.text = "";
                      controllerEmail.text = "";
                      setState(() {
                        isLoading = false;
                        Navigator.pop(context);
                      });
                      });
                    }
                  },
                  child: CustomContainer(
                    titleText: widget.userModel.key != null ? "Update user":
                        "Add User",
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
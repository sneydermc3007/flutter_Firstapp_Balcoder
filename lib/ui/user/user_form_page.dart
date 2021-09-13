import 'package:flutter/material.dart';
import 'package:flutter_first_app_balcoder/utils/custom_container.dart';

class UserFormPage extends StatefulWidget {
  const UserFormPage({Key? key}) : super(key: key);

  @override
  _UserFormPageState createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height * 0.05;
    double _width = MediaQuery.of(context).size.width * 0.65;

return Scaffold(
      body: Container(
        child: Center(
            child: Column(
          children: [
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextFormField(
                decoration: InputDecoration(hintText: "User Name"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 36),
              child: TextFormField(
                decoration: InputDecoration(hintText: "User Mail"),
              ),
            ),
            GestureDetector(
              onTap: () {
                print("User Name");
                print("User Email");
              },
              child: CustomContainer(
                titleText: "Add User",
                sizeHeight: _height,
                sizeWidth: _width,
                color: Colors.green,
              ),
            ),
            Spacer(),
          ],
        )),
      ),
    );
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_app_balcoder/ui/user/user_form_page.dart';
import 'model/user_model.dart';

class UserListPage extends StatefulWidget {
  UserListPage({Key? key}) : super(key: key);

  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {

  // List<UserModel> userList = [
  //   new UserModel(key: "1", userName: "Usuario 1", userEmail: "EMAIL TEST"),
  //   new UserModel(key: "2", userName: "Usuario 2", userEmail: "EMAIL TEST 2"),
  //   new UserModel(key: "3", userName: "Usuario 3", userEmail: "EMAIL TEST 3")
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("User List Page"),
        ),
      ),
      body: Container(child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("userCollection")
                  .where("isDeleted", isEqualTo: false)
                  .snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

              List<UserModel> _userList = [];
              UserModel userModel;

              switch (snapshot.connectionState){
                case ConnectionState.waiting:
                  return Center(child: new CircularProgressIndicator(),
                  );
                default:
                  snapshot.data?.docs.forEach((doc) {
                    print(doc.data());
                    userModel = new UserModel.fromSnapshot(data: doc.data(), id: doc.id);
                    print(userModel.isDeleted);
                    _userList.add(userModel);
                  });
              }
             return Container(
               child: ListView.builder(
                 itemCount: _userList.length ,
                 itemBuilder: (BuildContext context, int index) {
                   return Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: GestureDetector(
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context){
                           return UserFormPage(
                             userModel: _userList[index],
                           );
                         }));
                       },
                       child: ListTile(
                         title: Text(_userList[index].userName),
                         subtitle: Text(_userList[index].userEmail),
                         leading: Container(height: 40, width: 40, color: Colors.blueGrey,
                         ),
                         trailing: GestureDetector(onTap: (){
                           print("Eliminar");
                           FirebaseFirestore.instance.collection("userCollection").doc(_userList[index].key)
                               .update({
                             "isDeleted": true,
                           },
                           ).then((value) {

                           });
                         },child: Icon(Icons.delete)),
                       ),
                     ));
                 },
               ),
             );
          },
      ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () { 
          print("TEST");

          Navigator.push(context, MaterialPageRoute(builder: (context){
            return UserFormPage(userModel: new UserModel(userName: '', userEmail: '', isDeleted: false),
            );
          }));
        },
      ),
    );
  }
}
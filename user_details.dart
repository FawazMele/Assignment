import 'package:flutter/material.dart';
import '../models/user.dart';

class UserDetail extends StatelessWidget {
  final User userModel;
  //making the constructor requires the provider userModel's index to show the details
  const UserDetail({required this.userModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // the appBar takes the user's name
        appBar: AppBar(title: Text(userModel.name!),),
        body: Column(
          children: [
          SizedBox(
          height: 10,
        ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 12, 12, 12),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x34090F13),
                      offset: Offset(0, 1),
                    )
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),

                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(6, 6, 6, 6),

                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      // showing the user's details

                      Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child:
                        Text( "Phone number :  " +userModel.phone,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child:
                         Text( "Username : " +userModel.username,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),

                      ),Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child:
                         Text( "Email : " +userModel.email,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),

                      ),Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child:
                         Text( "Website : " +userModel.website,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),

                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}
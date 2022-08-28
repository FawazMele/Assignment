import 'package:assignment/ui/user_details.dart';
import 'package:flutter/material.dart';
import 'package:assignment/views_model/user_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Of Users for Napt'),
      ),
      body: ChangeNotifierProvider(
        //body will be changeNotifierProvider
        create: (context) => UserModel(),
        child: Builder(builder: (context) {
          late final  model = Provider.of<UserModel>(context);
          if (model.homeState == HomeState.Loading) {
            // create loading icon if data still not fetched
            return Center(child: CircularProgressIndicator());
          }
          // show an error if occurred
          if (model.homeState == HomeState.Error) {
            return Center(child: Text('An Error Occurred ${model.message}'));
          }

          //initialize the users by the model provider
          late final users = model!.users;

          return ListView.builder(
            //list length will be based on users number
            itemCount: users!.length,
            itemBuilder: (context, index) {
              late final user = users![index];
              return ListTile(
                //every listTile will hold a user
                title: Text(user!.name! , style: TextStyle(fontWeight: FontWeight.normal,fontSize: 18)),
                tileColor: Colors.white,
                subtitle: Text(user!.website!),
                leading: Icon(Icons.account_circle),
                onTap: (){
                  // navigating to the user's details screen while passing the index of the user along with it
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserDetail(userModel: users[index],)));
                },
              );
            },
          );
        }),
      ),
    );
  }
}

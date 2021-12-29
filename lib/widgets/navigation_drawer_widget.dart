// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:mobile/category/afiichecat.dart';
import 'package:mobile/transaction/affichetrans.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  NavigationDrawerWidget createState() => NavigationDrawerWidget();
}
class NavigationDrawerWidget extends State<NavigationDrawer> {

  @override
  Widget build(BuildContext context) {

    return Drawer(
      
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          Builder(
            builder: (context) {
              return UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                   color: Colors.deepPurple,
               ), accountEmail: null,
                accountName: null,
               
              );
            }
          ),
           ListTile(
            leading: Icon(Icons.home),
            title: Text('category'),
             onTap: () 
               {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                    
                                     AfficheCat(title: 'category',)));
                            },),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('transactions'),
             onTap: ()  {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                     Affichetrans(title: 'transactions',)));
                            },
          ),
         
          Divider(),
          ListTile(
            leading: Icon(Icons.person_rounded),
            title: Text('utilisateur'),
           onTap: ()  {
             Navigator.push(
                 context,
                 MaterialPageRoute(
                     builder: (context) =>
                         AfficheUtili(title: 'utilisateur',)));
           },
                            ),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text('options'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            title: Text('logout'),
            leading: Icon(Icons.exit_to_app),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
 
}

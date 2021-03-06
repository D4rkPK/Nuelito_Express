import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuelitoexpress/bloc.navigation_bloc/naviation_bloc.dart';
import 'sidebar.dart';

class SideBarLayout extends StatelessWidget {
  const SideBarLayout({Key key, this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(user),
        child: Stack(
          children: <Widget>[
            BlocBuilder<NavigationBloc, NavigationStates>(
              builder: (context, navigationState) {
                return navigationState as Widget;
              },
            ),
            SideBar(user: user),
          ],
        ),
      ),
    );
  }
}

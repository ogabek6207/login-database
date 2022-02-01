import 'package:flutter/material.dart';
import 'package:login/bloc/user_bloc.dart';
import 'package:login/model/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFirst = true;

  @override
  void initState() {
    userBloc.getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: userBloc.fetchUser,
        builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
          if (snapshot.hasData) {
            List<UserModel> result = snapshot.data!;
            return Container(
              color: Colors.orange,
              child: ListView.builder(
                itemCount: result.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      children: [
                        Text(
                          result[index].name,
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:links_app/bloc/user_bloc/user_bloc.dart';

class SubscriptionStatusPage extends StatefulWidget {
  const SubscriptionStatusPage({Key? key}) : super(key: key);

  @override
  _SubscriptionStatusPageState createState() => _SubscriptionStatusPageState();
}

class _SubscriptionStatusPageState extends State<SubscriptionStatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subscription Status'),
        backgroundColor: Color(0xfff7892b),
      ),
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoadedState) {
              return transactionSent(context: context);
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget transactionSent({required BuildContext context}) {
    return Center(
      child: Padding(
          padding: EdgeInsets.fromLTRB(8, 40, 8, 8),
          child: Column(
            children: <Widget>[
              Text('kkkkkk'),
              SizedBox(height: 15),
              InkWell(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.grey.shade200,
                            offset: Offset(2, 4),
                            blurRadius: 5,
                            spreadRadius: 2)
                      ],
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xfffbb448), Color(0xfff7892b)])),
                  child: Text(
                    'Check Payment',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              )
            ],
          )),
    );
  }
}

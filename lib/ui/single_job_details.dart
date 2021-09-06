import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:links_app/bloc/user_bloc/user_bloc.dart';
import 'package:links_app/models/jobs_model/jobs_model.dart';
import 'package:links_app/ui/payments/make_subscription.dart';
import 'package:links_app/ui/payments/update_subscription.dart';

class SingleJobDetails extends StatefulWidget {
  final Job job;
  const SingleJobDetails(this.job) : super();

  @override
  _SingleJobDetailsState createState() => _SingleJobDetailsState();
}

class _SingleJobDetailsState extends State<SingleJobDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoadedState) {
            if (state.userModel.data!.subscription == null) {
              //user does not have subscription
              return SubscriptionPage();
            } else {
              //check validity
              var expiresAt = DateTime.parse(state
                  .userModel.data!.subscription!.expiresAt!
                  .toIso8601String());
              var currentDate = DateTime.now();
              if (expiresAt.isBefore(currentDate)) {
                // the subscription is expired
                return UpdateSubscriptionPage();
              } else {
                return Center(
                  child: Text('user is subscribed '),
                );
              }
            }
          }
          return Scaffold(
            appBar: AppBar(
              title: Text('${widget.job.name}'),
              backgroundColor: Color(0xfff7892b),
            ),
            floatingActionButton: FloatingActionButton.extended(
              label: const Text('Apply'),
              icon: const Icon(Icons.thumb_up),
              onPressed: () {
                print('attempting to apply');
              },
              backgroundColor: Colors.amber,
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            body: Center(
              child: Text('Single Job details'),
            ),
          );
        },
      ),
    );
  }
}

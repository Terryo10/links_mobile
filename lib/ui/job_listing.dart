import 'package:flutter/material.dart';

class JobsPage extends StatefulWidget {
  JobsPage({Key? key}) : super(key: key);

  @override
  _JobsPageState createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Center(
        child: Text('Jobs List')
       ),
    );
  }
}
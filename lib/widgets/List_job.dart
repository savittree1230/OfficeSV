import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:officesv/model/job_model.dart';
import 'package:officesv/widgets/show_button.dart';
import 'package:officesv/widgets/show_progress.date.dart';
import 'package:officesv/widgets/show_text.dart';

class ListJob extends StatefulWidget {
  const ListJob({
    Key? key,
  }) : super(key: key);

  @override
  State<ListJob> createState() => _ListJobState();
}

class _ListJobState extends State<ListJob> {
  bool load = true;
  var jobModels = <JobModel>[];
  @override
  void initState() {
    super.initState();
    readAllJob();
  }

  Future<void> readAllJob() async {
    String path = 'https://www.androidthai.in.th/sv/getAllJobFine.php';
    await Dio().get(path).then((value) {
      for (var item in json.decode(value.data)) {
        JobModel jobModel = JobModel.fromMap(item);
        jobModels.add(jobModel);
      }

      setState(() {
        load = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: load
          ? const ShowProgress()
          : ListView.builder(itemCount: jobModels.length,
              itemBuilder: (context, index) =>
                  ShowText(label: jobModels[index].jobName),
            ),
      floatingActionButton: ShowButton(
          label: 'Add JOb',
          pressFunc: () => Navigator.pushNamed(context, '/addJob')),
    );
  }
}

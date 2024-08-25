import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/firebase_utils.dart';
import 'package:todo_app/models/task_model.dart';

import '../../core/setting_provider.dart';

class TaskEditPage extends StatefulWidget {
  const TaskEditPage({super.key});

  static const String routename = "taskEdit";

  @override
  State<TaskEditPage> createState() => _TaskEditPageState();
}

class _TaskEditPageState extends State<TaskEditPage> {
/*  TextEditingController title1Controller = TextEditingController();
  TextEditingController desc1Controller = TextEditingController();*/
  DateTime selectedDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)!.settings.arguments as TaskModel;
    var provider = Provider.of<SettingProvider>(context);
    return Scaffold(
      backgroundColor:
          provider.isDark() ? Color(0xFF060e1e) : Color(0xFFDFECDB),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        title: Text(
          'To Do List',
          style:
              TextStyle(color: provider.isDark() ? Colors.black : Colors.white),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 352,
            height: 617,
            decoration: BoxDecoration(
              color: provider.isDark() ? Color(0xFF141922) : Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.blueAccent),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    'Edit Task',
                    style: TextStyle(
                      color: provider.isDark() ? Colors.white : Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    initialValue: model.taskName,
                    onChanged: (value) {
                      model.taskName = value;
                    },
                    /*controller: title1Controller,*/
                    style: TextStyle(
                      color: provider.isDark() ? Colors.white : Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      label: Text("Title"),
                      labelStyle: TextStyle(
                        color: provider.isDark() ? Colors.white : Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    initialValue: model.description,
                    onChanged: (value) {
                      model.description = value;
                    },
                    /*controller: desc1Controller,*/
                    style: TextStyle(
                      color: provider.isDark() ? Colors.white : Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      label: Text("Task Details"),
                      labelStyle: TextStyle(
                        color: provider.isDark() ? Colors.white : Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    textAlign: TextAlign.left,
                    "Select Date",
                    style: TextStyle(
                      fontSize: 18,
                      color: provider.isDark() ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () async {
                      DateTime? newDate = await chooseYourDate();
                      if (newDate != null) {
                        model.selectedDate = newDate.millisecondsSinceEpoch;
                        setState(() {});
                      }
                    },
                    child: Text(
                      textAlign: TextAlign.center,
                      DateFormat.yMd().format(
                        DateUtils.dateOnly(
                          DateTime.fromMillisecondsSinceEpoch(
                              model.selectedDate ?? 0),
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: provider.isDark() ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () async {
                        await FirebaseUtils.updateTask(model);
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Update",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  chooseYourDate() async {
    DateTime? chosenDate = await showDatePicker(
      context: context,
      initialDate: selectedDateTime,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(
          days: 265,
        ),
      ),
    );
    if (chosenDate != null) {
      selectedDateTime = chosenDate;
      setState(() {});
    }
    return chosenDate ;
  }
}

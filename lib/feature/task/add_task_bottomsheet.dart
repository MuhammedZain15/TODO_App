import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/firebase_utils.dart';
import 'package:todo_app/core/setting_provider.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddTaskBottomsheet extends StatefulWidget {
  AddTaskBottomsheet({super.key});


  @override
  State<AddTaskBottomsheet> createState() => _AddTaskBottomsheetState();
}

class _AddTaskBottomsheetState extends State<AddTaskBottomsheet> {
  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();
  DateTime selectedDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var lang  = AppLocalizations.of(context)!;
    var provider = Provider.of<SettingProvider>(context);
    return Container(
      color:provider.isDark()? Color(0xFF141922):Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Text(
            textAlign: TextAlign.center,
            lang.addnewtask,
            style: TextStyle(
              fontSize: 22,
              color: provider.isDark()? Colors.white:Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            style:  TextStyle(
              color: provider.isDark()? Colors.white:Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            controller: titleController,
            decoration:  InputDecoration(
                label: Text(lang.title),
                labelStyle: TextStyle(
                  fontSize: 18,
                  color: provider.isDark()? Colors.white:Colors.black,
                )),
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            style:  TextStyle(
              color: provider.isDark()? Colors.white:Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            controller: desController,
            decoration:  InputDecoration(
                label: Text(lang.description),
                labelStyle: TextStyle(
                  fontSize: 18,
                  color: provider.isDark()? Colors.white:Colors.black,
                )),
          ),
          const SizedBox(
            height: 20,
          ),
           Text(
            textAlign: TextAlign.left,
            lang.selecteddate,
            style: TextStyle(
              fontSize: 18,
              color: provider.isDark()? Colors.white:Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              chooseYourDate();
            },
            child: Text(
              textAlign: TextAlign.center,
              selectedDateTime.toString().substring(0, 10),
              style:  TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: provider.isDark()? Colors.white:Colors.black,
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
              onPressed: () {
                TaskModel taskModel = TaskModel(
                  taskName: titleController.text,
                  description: desController.text,
                  selectedDate: DateUtils.dateOnly(selectedDateTime)
                      .millisecondsSinceEpoch,
                );
                EasyLoading.show();
                FirebaseUtils.addTaskModel(taskModel).then(
                  (value){
                    Navigator.pop(context);
                    EasyLoading.dismiss();
                  }
                );
              },
              child:  Text(
                lang.add,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
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
  }
}

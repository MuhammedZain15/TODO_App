import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/firebase_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/feature/task/edit_view.dart';
import 'package:todo_app/models/task_model.dart';

import '../../../core/setting_provider.dart';

class TaskItemWidget extends StatelessWidget {
   TaskModel model;

  TaskItemWidget({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    var theme = Theme.of(context);
    var lang = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: provider.isDark() ? Color(0xFF141922) : Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                FirebaseUtils.deleteTask(model.id);
              },
              backgroundColor: Colors.red,
              icon: Icons.delete,
              label: lang.delete,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(18),
                topLeft: Radius.circular(18),
              ),
            ),
            SlidableAction(
              onPressed: (context) {
                Navigator.pushNamed(
                  context,
                  TaskEditPage.routename,
                  arguments: model,
                );
                print(model.id);
                print(model.description);
                print(model.taskName);
              },
              backgroundColor: Colors.cyanAccent,
              icon: Icons.edit,
              label: lang.edit,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 90,
              width: 3,
              color: model.isDone ? Colors.green : theme.primaryColor,
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.taskName,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: model.isDone ? Colors.green : theme.primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    model.description,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            model.isDone
                ? Text(
                    lang.done,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 22,
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      model.isDone = true;
                      FirebaseUtils.updateTask(model);
                    },
                    padding: EdgeInsets.zero,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primaryColor,
                      minimumSize: const Size(80, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    icon: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 30,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}

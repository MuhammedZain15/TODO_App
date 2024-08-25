import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/firebase_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/core/setting_provider.dart';
import 'widget/task_item_widget.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  final EasyInfiniteDateTimelineController _controller =
      EasyInfiniteDateTimelineController();
  var _focusDate = DateTime.now();

  @override
  Widget build(BuildContext context) {

    var theme = Theme.of(context);
    var lang  = AppLocalizations.of(context)!;
    var mediaQuery = MediaQuery.of(context);
    var provider = Provider.of<SettingProvider>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: mediaQuery.size.height * 0.22,
                width: mediaQuery.size.width,
                color: theme.primaryColor,
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 60,
                ),
                child: Text(
                  lang.todolist,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: provider.isDark()? Colors.black:Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 135,
                child: SizedBox(
                  width: mediaQuery.size.width,
                  child: EasyInfiniteDateTimeLine(
                    controller: _controller,
                    firstDate: DateTime(2024),
                    focusDate: _focusDate,
                    lastDate: DateTime(2025, 12, 31),
                    onDateChange: (selectedDate) {
                      setState(
                        () {
                          _focusDate = selectedDate;
                        },
                      );
                    },
                    dayProps: EasyDayProps(
                      todayStyle: DayStyle(
                        decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(10)),
                        dayStrStyle:  TextStyle(
                          fontFamily: "Poppins",
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        monthStrStyle: const TextStyle(
                          fontFamily: "Poppins",
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        dayNumStyle: const TextStyle(
                          fontFamily: "Poppins",
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      activeDayStyle: DayStyle(
                        decoration: BoxDecoration(
                          color: provider.isDark()? Colors.black:Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        dayStrStyle: TextStyle(
                          fontFamily: "Poppins",
                          color: theme.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        monthStrStyle: TextStyle(
                          fontFamily: "Poppins",
                          color: theme.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        dayNumStyle: TextStyle(
                          fontFamily: "Poppins",
                          color: theme.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      inactiveDayStyle: DayStyle(
                        decoration: BoxDecoration(
                          color: provider.isDark()? Colors.black.withOpacity(0.80):Colors.white.withOpacity(0.80),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        dayStrStyle:  TextStyle(
                          fontFamily: "Poppins",
                          color: provider.isDark()? Colors.white:Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        monthStrStyle:  TextStyle(
                          fontFamily: "Poppins",
                          color: provider.isDark()? Colors.white:Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        dayNumStyle:  TextStyle(
                          fontFamily: "Poppins",
                          color: provider.isDark()? Colors.white:Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    showTimelineHeader: false,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: StreamBuilder(
            stream: FirebaseUtils.getTask(_focusDate),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Column(
                  children: [
                    const Text("Something went wrong"),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Try Again"),
                    )
                  ],
                );
              }
              var tasks = snapshot.data?.docs.map((e) => e.data()).toList();
              if (tasks?.isEmpty ?? true) {
                return  Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(lang.notasks),
                );
              }
              return ListView.builder(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => TaskItemWidget(
                  model: tasks[index],

                ),

                itemCount: tasks!.length,
              );
            },
          ),
        )
      ],
    );
  }
}

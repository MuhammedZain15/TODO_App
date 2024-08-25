import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/setting_provider.dart';
import 'package:todo_app/feature/setting/setting_view.dart';
import 'package:todo_app/feature/task/add_task_bottomsheet.dart';
import 'package:todo_app/feature/task/task_view.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});
  static const String routename = "layout";
  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int currentIndex = 0;

  List<Widget> screens = [
    const TaskView(),
    const SettingView(),
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    var provider = Provider.of<SettingProvider>(context);
    return Scaffold(

      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 2,
        backgroundColor: provider.isDark() ?Color(0xFF253159) : Colors.white,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return Padding(

                padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskBottomsheet(),
              );
            },
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        child: CircleAvatar(
          radius: 25,
          backgroundColor: theme.primaryColor,
          child: const Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 93,
color: provider.isDark()? Color(0xFF141922):Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 15,
        child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            currentIndex: currentIndex,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/images/icon_list.png"),
                  ),
                  label: "Tasks"),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/images/icon_settings.png"),
                  ),
                  label: "Settings"),
            ]),
      ),
      body: screens[currentIndex],
    );
  }
}

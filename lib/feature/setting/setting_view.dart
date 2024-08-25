import 'package:flutter/material.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/setting_provider.dart';
import 'package:todo_app/models/task_model.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  var languagesList = ["English", "عربي"];
  var themeList = ["Light", "Dark"];

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);
    var provider = Provider.of<SettingProvider>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: Column(
            children: [
              Container(
                height: mediaQuery.size.height * 0.21,
                width: mediaQuery.size.width,
                color: theme.primaryColor,
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 60,
                ),
                child: Text(
                  lang.setting,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: provider.isDark()? Colors.black:Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      lang.lang,
                      style: provider.isDark()
                          ? TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)
                          : TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomDropdown<String>(
                      items: languagesList,
                      initialItem: provider.currentLanguageCode == "en"
                          ? languagesList[0]
                          : languagesList[1],
                      onChanged: (value) {
                        if (value == "English") {
                          provider.changeLanguageCode("en");
                        }
                        if (value == "عربي") {
                          provider.changeLanguageCode("ar");
                        }
                      },
                      decoration: CustomDropdownDecoration(
                        expandedBorder: Border.all(color: theme.primaryColor),
                        closedBorder: Border.all(color: theme.primaryColor),
                        closedFillColor: provider.isDark()
                            ? Color(0xFF060e1e)
                            : Colors.white,
                        expandedFillColor: provider.isDark()
                            ? Color(0xFF060e1e)
                            : Colors.white,
                        headerStyle: TextStyle(color: theme.primaryColor),
                        listItemStyle: TextStyle(
                          color: theme.primaryColor,
                        ),
                        closedSuffixIcon: Icon(Icons.arrow_drop_down,
                            color: theme.primaryColor),
                        expandedSuffixIcon: Icon(Icons.arrow_drop_up,
                            color: theme.primaryColor),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      lang.theme,
                      style: provider.isDark()
                          ? TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)
                          : TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomDropdown<String>(
                      hintText: 'Select job role',
                      items: themeList,
                      initialItem: provider.currentThemeMode == ThemeMode.light
                          ? themeList[0]
                          : themeList[1],
                      onChanged: (value) {
                        if (value == "Light") {
                          provider.changeThemeMode(ThemeMode.light);
                        }
                        if (value == "Dark") {
                          provider.changeThemeMode(ThemeMode.dark);
                        }
                      },
                      decoration: CustomDropdownDecoration(
                          expandedBorder: Border.all(color: theme.primaryColor),
                          closedBorder: Border.all(color: theme.primaryColor),
                          closedFillColor: provider.isDark()
                              ? Color(0xFF060e1e)
                              : Colors.white,
                          expandedFillColor: provider.isDark()
                              ? Color(0xFF060e1e)
                              : Colors.white,
                          headerStyle: TextStyle(
                            color: theme.primaryColor,
                          ),
                          listItemStyle: TextStyle(
                            color: theme.primaryColor,
                          ),
                          closedSuffixIcon: Icon(Icons.arrow_drop_down,
                              color: theme.primaryColor),
                          expandedSuffixIcon: Icon(Icons.arrow_drop_up,
                              color: theme.primaryColor)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_list_pro_project/data/models/goal_model.dart';
import 'package:to_do_list_pro_project/data/models/task_model.dart';
import 'package:to_do_list_pro_project/resources/resources.dart';
import 'package:to_do_list_pro_project/theme/color_theme.dart';
import 'package:to_do_list_pro_project/theme/text_theme.dart';
import 'package:to_do_list_pro_project/utils/global_state.dart' as global;

class EditGoalBottomsheet extends StatefulWidget {
  final GoalModel goal;

  EditGoalBottomsheet({required this.goal});

  @override
  _EditGoalBottomsheetState createState() => _EditGoalBottomsheetState();
}

class _EditGoalBottomsheetState extends State<EditGoalBottomsheet> {
  // TextEditingController subtask1 = TextEditingController();
  // TextEditingController subtask2 = TextEditingController();
  TextEditingController remindPeriod = TextEditingController();

  // List<SubTask> subtasks = [];

  bool isNotEmpty1 = false;
  bool isNotEmpty2 = false;
  bool isSwitched = false;

  List dates = [
    'Среда, 12 мая 2021',
    'Четверг, 13 мая 2021',
    'Пятница, 14 мая 2021',
  ];

  List periods = [
    'Дней',
    'Недель',
    'Месяцев',
  ];

  List<String> categories = [
    'Без категории',
    'Семья',
    'Дом',
    'Работа',
    'Хобби',
    'Покупки',
    'Подарки',
    'Оплата',
  ];

  late String dateChoose;
  late String periodChoose;
  late String category;

  @override
  void initState() {
    dateChoose = dates[0];
    periodChoose = periods[0];
    category = widget.goal.category!;
    // if () {
    //   // subtask1.text = widget.task.subtasks.first.title;
    //   // subtask2.text = widget.task.subtasks.last.title;
    // }
    remindPeriod.text = widget.goal.toString();
    isSwitched = widget.goal.isRemind as bool;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 13, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Подзадачи',
            style: TextStyles.dateStyle.copyWith(color: ColorPalette.grey3),
          ),
          // Row(
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     Expanded(
          //       child: TextField(
          //         onTap: () {
          //           setState(() {});
          //         },
          //         onChanged: (value) {
          //           if (value != '') {
          //             setState(() {
          //               isNotEmpty1 = true;
          //             });
          //             global.store.set('subtask1', value);
          //           } else {
          //             setState(() {
          //               isNotEmpty1 = false;
          //             });
          //           }
          //         },
          //         controller: subtask1,
          //         decoration: InputDecoration(
          //             enabledBorder: UnderlineInputBorder(
          //               borderSide: BorderSide(color: ColorPalette.grey6),
          //             ),
          //             isDense: true,
          //             hintText: 'Подзадача 1',
          //             hintStyle: TextStyles.subtitle5.copyWith(
          //                 color: ColorPalette.grey4,
          //                 fontWeight: FontWeight.w600)),
          //         style: TextStyles.subtitle5.copyWith(
          //           color: ColorPalette.black1,
          //           fontWeight: FontWeight.w600,
          //         ),
          //         minLines: 1,
          //         maxLines: 1,
          //       ),
          //     ),
          //     const SizedBox(width: 20),
          //     isNotEmpty1
          //         ? GestureDetector(
          //         onTap: () {
          //           subtask1.clear();
          //           setState(() {
          //             isNotEmpty1 = false;
          //           });
          //         },
          //         child: SvgPicture.asset(MainIcons.cleanText))
          //         : const SizedBox(
          //       width: 17,
          //     ),
          //   ],
          // ),
          // const SizedBox(height: 20),
          // Row(
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     Expanded(
          //       child: TextField(
          //         onChanged: (value) {
          //           if (value != '') {
          //             setState(() {
          //               isNotEmpty2 = true;
          //             });
          //             global.store.set('subtask2', subtask2.text);
          //           } else {
          //             setState(() {
          //               isNotEmpty2 = false;
          //             });
          //           }
          //         },
          //         controller: subtask2,
          //         decoration: InputDecoration(
          //             enabledBorder: UnderlineInputBorder(
          //               borderSide: BorderSide(color: ColorPalette.grey6),
          //             ),
          //             isDense: true,
          //             hintText: 'Подзадача 2',
          //             hintStyle: TextStyles.subtitle5.copyWith(
          //                 color: ColorPalette.grey4,
          //                 fontWeight: FontWeight.w600)),
          //         style: TextStyles.subtitle5.copyWith(
          //           color: ColorPalette.black1,
          //           fontWeight: FontWeight.w600,
          //         ),
          //         minLines: 1,
          //         maxLines: 1,
          //       ),
          //     ),
          //     const SizedBox(width: 20),
          //     isNotEmpty2
          //         ? GestureDetector(
          //         onTap: () {
          //           subtask2.clear();
          //           setState(() {
          //             isNotEmpty2 = false;
          //           });
          //         },
          //         child: SvgPicture.asset(MainIcons.cleanText))
          //         : const SizedBox(
          //       width: 17,
          //     ),
          //   ],
          // ),
          const SizedBox(height: 20),
          Text(
            'Дата',
            style: TextStyles.dateStyle.copyWith(color: ColorPalette.grey3),
          ),
          const SizedBox(height: 4),
          Container(
            padding: EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1.0,
                  color: ColorPalette.grey6,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Среда, 12 мая 2021',
                  style: TextStyles.subtitle5.copyWith(
                    color: ColorPalette.black1,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(MainIcons.calendar),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Повтор каждые',
            style: TextStyles.dateStyle.copyWith(color: ColorPalette.grey3),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1.0,
                        color: ColorPalette.grey6,
                      ),
                    ),
                  ),
                  child: TextField(
                    controller: remindPeriod,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isCollapsed: true,
                      isDense: true,
                    ),
                    onChanged: (value) {
                      global.store.set(remindPeriod, value);
                    },
                  ),
                ),
              ),
              const SizedBox(width: 40),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1.0,
                        color: ColorPalette.grey6,
                      ),
                    ),
                  ),
                  child: DropdownButton(
                    underline: Offstage(),
                    icon: SvgPicture.asset(MainIcons.dropdown),
                    iconEnabledColor: ColorPalette.purple1,
                    isExpanded: true,
                    isDense: true,
                    value: periodChoose,
                    onChanged: (value) {
                      global.store.set('periodChoose', periodChoose);
                      setState(() {
                        periodChoose = value.toString();
                      });
                    },
                    items: periods.map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Категория',
            style: TextStyles.dateStyle.copyWith(color: ColorPalette.grey3),
          ),
          DropdownButton(
            icon: SvgPicture.asset(MainIcons.dropdown),
            iconEnabledColor: ColorPalette.purple1,
            isExpanded: true,
            value: category,
            underline: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1.0,
                    color: ColorPalette.grey6,
                  ),
                ),
              ),
            ),
            onChanged: (value) {
              global.store.set('category', value);
              setState(() {
                category = value.toString();
              });
            },
            items: categories.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(e),
              );
            }).toList(),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Напомнить мне',
                style: TextStyles.dateStyle.copyWith(
                  color: ColorPalette.grey3,
                ),
              ),
              const SizedBox(width: 30),
              Switch(
                value: isSwitched,
                onChanged: (bool) {
                  setState(() {
                    isSwitched = bool;
                  });
                  global.store.set('isReminded', isSwitched);
                },
                inactiveThumbColor: ColorPalette.grey5,
                inactiveTrackColor: ColorPalette.grey6,
                activeColor: ColorPalette.purple1,
                activeTrackColor: ColorPalette.purple3,
              ),
            ],
          )
        ],
      ),
    );
  }
}
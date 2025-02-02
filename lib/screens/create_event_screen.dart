import 'package:evently/firebase_service.dart';
import 'package:evently/modals/event.dart';
import 'package:evently/providers/event_provider.dart';
import 'package:evently/providers/settings_provider.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:evently/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../modals/catgories.dart';
import '../tabs/home/tab_item.dart';
import '../utils/app_theme.dart';
import '../widgets/default_text_form_field.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  static const String routeName = '/create';

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  int currentIndex = 0;
  Catgories selectedCategory = Catgories.categories.first;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime? selectedDate;

  DateFormat dateFormat = DateFormat('dd/MM/yyyy');
  TimeOfDay? selectedTime;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    TextTheme textTheme = Theme
        .of(context)
        .textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Event'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/${selectedCategory.imageName}.png',
                  height: MediaQuery
                      .sizeOf(context)
                      .height * .25,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            DefaultTabController(
              length: Catgories.categories.length,
              child: TabBar(
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
                tabAlignment: TabAlignment.start,
                labelPadding: EdgeInsets.symmetric(horizontal: 10),
                isScrollable: true,
                padding: EdgeInsets.only(left: 6),
                onTap: (index) {
                  if (currentIndex == index) return;
                  currentIndex = index;
                  selectedCategory = Catgories.categories[currentIndex];
                  setState(() {});
                },
                tabs: Catgories.categories
                    .map(
                      (category) =>
                      TabItem(
                        label: category.name,
                        isSelected: currentIndex ==
                            Catgories.categories.indexOf(category),
                        selectedBackgroundColor: AppTheme.primary,
                        selectedForegroundColor: settingsProvider.isDark?AppTheme.backGroundDark: AppTheme.white,
                        unselectedForegroundColor: AppTheme.primary,
                        icon: category.icon,
                      ),
                )
                    .toList(),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title',
                      style: textTheme.bodyLarge,
                    ),
                    SizedBox(height: 8),
                    DefaultTextFormField(
                      hintText: 'Event Title',
                      controller: titleController,
                      prefixIconImage: 'edit',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "title can't be empty";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Description',
                      style: textTheme.bodyLarge,
                    ),
                    SizedBox(height: 8),
                    DefaultTextFormField(
                      hintText: 'Event Description',
                      controller: descriptionController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "description can't be empty";
                        }
                        return null;
                      },
                      maxLine: 4,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/date.svg',
                          width: 24,
                          height: 24,
                          fit: BoxFit.scaleDown,
                          colorFilter: ColorFilter
                              .mode(settingsProvider.isDark? AppTheme.white: AppTheme.black, BlendMode.srcIn),

                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Event Date',
                          style: textTheme.bodyLarge,
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () async {
                            DateTime? date = await showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(Duration(days: 365)),
                              initialDate: selectedDate,
                              initialEntryMode:
                              DatePickerEntryMode.calendarOnly,
                            );
                            if (date != null) {
                              selectedDate = date;
                              setState(() {});
                            }
                          },
                          child: Text(
                            selectedDate == null
                                ? 'Chose Date'
                                : dateFormat.format(selectedDate!),
                            style: textTheme.bodyLarge!
                                .copyWith(color: AppTheme.primary),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/time.svg',
                          width: 24,
                          height: 24,
                          fit: BoxFit.scaleDown,
                          colorFilter: ColorFilter
                              .mode(settingsProvider.isDark? AppTheme.white: AppTheme.black, BlendMode.srcIn),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Event Time',
                          style: textTheme.bodyLarge,
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () async {
                            TimeOfDay? time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (time != null) {
                              selectedTime = time;
                              setState(() {});
                            }
                          },
                          child: Text(
                            selectedTime == null
                                ? 'Chose Time'
                                : selectedTime!.format(context),
                            style: textTheme.bodyLarge!
                                .copyWith(color: AppTheme.primary),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    DefaultButton(onPressed: createEvent, label: 'Add Event')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> createEvent() async {
    if (formKey.currentState!.validate() &&
        selectedTime != null &&
        selectedDate != null) {
      DateTime dateTime = DateTime(
        selectedDate!.year,
        selectedDate!.month,
        selectedDate!.day,
        selectedTime!.hour,
        selectedTime!.minute,
      );
      print('created');
      Event event = Event(
        userId: Provider
            .of<UserProvider>(context, listen: false)
            .currentUser!
            .id,
        title: titleController.text,
        category: selectedCategory,
        description: descriptionController.text,
        dateTime: dateTime!,
      );
      await FirebaseService.addEventToFireStore(event).then((_) {
        Provider.of<EventsProvider>(context, listen: false).getEvents();
        Navigator.of(context).pop();
        Fluttertoast.showToast(
            msg: "Event created",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: AppTheme.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }).catchError((_) {
        Fluttertoast.showToast(
            msg: "failed to create event ",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: AppTheme.red,
            textColor: Colors.black,
            fontSize: 16.0
        );
      });
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:pmc_main/Utils/app_colors.dart';
import 'package:pmc_main/widgets/custom_text_input.dart';
import 'package:table_calendar/table_calendar.dart';

class RequestTourView extends ConsumerStatefulWidget {
  const RequestTourView({super.key});

  @override
  ConsumerState<RequestTourView> createState() => _RequestTourViewState();
}

class _RequestTourViewState extends ConsumerState<RequestTourView> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  final TextEditingController _timeController = TextEditingController();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        _timeController.text = _selectedTime.format(context);
      });
    }
  }

  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.defaultColor,
        title: const Text(
          'Request a tour',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Stepper(
        type: StepperType.vertical,
        currentStep: _currentStep,
        onStepContinue: () {
          setState(() {
            if (_currentStep < 1) {
              _currentStep += 1;
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if (_currentStep > 0) {
              _currentStep -= 1;
            }
          });
        },
        steps: <Step>[
          Step(
            title: const Text('Date and time'),
            subtitle: const Text("lorem ipsum text describing this process"),
            isActive: _currentStep == 0,
            content: Column(
              children: [
                TableCalendar(
                  firstDay: DateTime.now(),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: _selectedDate,
                  selectedDayPredicate: (DateTime date) {
                    return isSameDay(date, _selectedDate);
                  },
                  availableCalendarFormats: const {
                    CalendarFormat.month: 'Month',
                  },
                  onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                    setState(() {
                      _selectedDate = focusedDay;
                    });
                    debugPrint(focusedDay.toString());
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _timeController,
                  decoration: InputDecoration(
                    hintText: 'Select Time',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.access_time),
                      onPressed: () => _selectTime(context),
                    ),
                  ),
                  readOnly: true,
                  onTap: () => _selectTime(context),
                ),
              ],
            ),
          ),
          Step(
              title: const Text("Personal Information"),
              subtitle: const Text("lorem ipsum text describing this process"),
              isActive: _currentStep == 1,
              content: const Column(
                children: [
                  Text(
                    "Kindly Provide contact details to confirm tour",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextInput(
                    hint: "enter name",
                    label: "Name",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextInput(
                    hint: "enter email",
                    label: "Email",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextInput(
                    hint: "enter phone",
                    label: "Phone",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextInput(
                    hint: "enter message",
                    label: "Message",
                    minLines: 4,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

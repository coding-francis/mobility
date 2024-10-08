import 'package:flutter/material.dart';
import 'package:pmc_main/widgets/custom_filled_button.dart';
import 'package:pmc_main/widgets/custom_text_input.dart';

class PropertyDetailWidgets {
  void showSendMessageForm(
    BuildContext context,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SingleChildScrollView(
              reverse: true,
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "Send Message",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomTextInput(
                        hint: "Name",
                        radius: 15,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomTextInput(
                        keyboard: TextInputType.emailAddress,
                        hint: "Email",
                        radius: 15,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomTextInput(
                        hint: "Message...",
                        minLines: 4,
                        radius: 15,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomFilledButton(
                          radius: 15,
                          onPressed: () {},
                          child: const Text(
                            "Send message",
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

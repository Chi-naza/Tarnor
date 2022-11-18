import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:tanor/app_constants/app_dimensions.dart';
import 'package:tanor/custom_widgets/buttons/main_button.dart';
import 'package:tanor/custom_widgets/header/header_widget.dart';
import 'package:tanor/custom_widgets/inputs/input_field_plus_text.dart';
import 'package:tanor/custom_widgets/texts/text_n_divider_header.dart';
import 'package:tanor/utilities/feedback.dart';

class AddNewStaffScreen extends StatefulWidget {
  const AddNewStaffScreen({Key? key}) : super(key: key);

  @override
  State<AddNewStaffScreen> createState() => _AddNewStaffScreenState();
}

class _AddNewStaffScreenState extends State<AddNewStaffScreen> {

  // input controllers
  TextEditingController firstNameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  // IMAGE UPLOAD
  PlatformFile? pickedImage;


  // function which prompts the user to select an image file
  Future<void> pickImage() async{
    final result = await FilePicker.platform.pickFiles();
    if(result == null) return;

    setState(() {
      pickedImage = result.files.first;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderWidget(),
            const TextnDividerHeader(text: 'My Staff'),
            // Form Section
            Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.size5, vertical: Dimensions.size20),
              margin: EdgeInsets.symmetric(vertical: Dimensions.size30),
              child: Form(
                child: Column(
                  children: [                    
                    Row(
                      children: [
                        // first Name
                        Expanded(
                          child: InputFieldPlusTextWidget(text: 'First Name', textController: firstNameController),
                        ),
                        // surname
                        Expanded(
                          child: InputFieldPlusTextWidget(text: 'Surname', textController: surnameController),
                        ),
                      ],
                    ),
                    // Email
                    Row(
                      children: [
                        Expanded(
                          child: InputFieldPlusTextWidget(text: 'Email', textController: emailController),
                        ),
                      ],
                    ),
                    // Password & Confirm Password
                    Row(
                      children: [
                        Expanded(
                          child: InputFieldPlusTextWidget(text: 'Password', textController: passwordController),
                        ),
                        Expanded(
                          child: InputFieldPlusTextWidget(text: 'Re-Enter Password', textController: confirmPasswordController),
                        ),
                      ],
                    ),
                    // Phone Number
                    Row(
                      children: [
                        Expanded(
                          child: InputFieldPlusTextWidget(text: 'Phone Number', textController: phoneNumberController),
                        ),
                      ],
                    ),
                    // Position & Upload Image
                    Row(
                      children: [
                        Expanded(
                          child: InputFieldPlusTextWidget(text: 'Position', textController: positionController),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: pickImage,
                            child: AbsorbPointer(
                              child: InputFieldPlusTextWidget(text: 'Upload Image', textController: imageController)
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    if(pickedImage == null)
                      SizedBox(height: Dimensions.size30),
                    // Widget Showing The Name of the Image picked: shown if file has been picked
                    if(pickedImage != null)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: Dimensions.size20, vertical: Dimensions.size30),
                        child: Container(
                          color: Colors.green.withOpacity(0.8),
                          padding: EdgeInsets.symmetric(horizontal: Dimensions.size20, vertical: Dimensions.size10),
                          child: Text(
                            pickedImage!.name,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    // The Create Button
                    MainButton(
                      onPressed: () => UserFeedBack.showSuccess('Successfully created a new staff, try to be cheerful now'),
                      text: 'Create',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
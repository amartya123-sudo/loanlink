import 'package:flutter/material.dart';
import 'package:loanlink/model/user_model.dart';
import 'package:loanlink/pages/dashboard.dart';
import 'package:loanlink/provider/authentication.dart';
import 'package:loanlink/r_widgets/r_widgets.dart';
import 'package:loanlink/utils/util.dart';
import 'package:provider/provider.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({super.key});

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  TextEditingController aadharController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final addressController = TextEditingController();
  final panController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    addressController.dispose();
    aadharController.dispose();
    panController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: false).isLoading;
    return Scaffold(
      body: SafeArea(
        child: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.purple,
                ),
              )
            : SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(vertical: 25.0, horizontal: 5.0),
                child: Center(
                  child: Column(
                    children: [
                      const Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        margin: const EdgeInsets.only(top: 20.0),
                        child: Column(
                          children: [
                            textfield(
                              hintText: "Name",
                              icon: Icons.account_circle_rounded,
                              inputType: TextInputType.name,
                              maxLines: 1,
                              capitalization: TextCapitalization.none,
                              controller: nameController,
                            ),
                            textfield(
                              hintText: "Email",
                              icon: Icons.email_rounded,
                              inputType: TextInputType.emailAddress,
                              maxLines: 1,
                              capitalization: TextCapitalization.none,
                              controller: emailController,
                            ),
                            textfield(
                              hintText: "Phone Number",
                              icon: Icons.phone_rounded,
                              inputType: TextInputType.phone,
                              maxLines: 1,
                              capitalization: TextCapitalization.none,
                              controller: phoneNumberController,
                            ),
                            textfield(
                              hintText: "Address",
                              icon: Icons.home_rounded,
                              inputType: TextInputType.streetAddress,
                              maxLines: 1,
                              capitalization: TextCapitalization.none,
                              controller: addressController,
                            ),
                            textfield(
                              hintText: "Aadhar Number",
                              icon: Icons.perm_identity_rounded,
                              inputType: TextInputType.number,
                              maxLines: 1,
                              capitalization: TextCapitalization.none,
                              controller: aadharController,
                            ),
                            textfield(
                              hintText: "PAN",
                              icon: Icons.perm_identity_rounded,
                              inputType: TextInputType.text,
                              maxLines: 1,
                              capitalization: TextCapitalization.characters,
                              controller: panController,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.90,
                        child: CustomButton(
                          text: "Continue",
                          onPressed: () {
                            storeData();
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Dashboard()),
                                (route) => false);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  void storeData() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    UserModel userModel = UserModel(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      phoneNumber: "",
      address: addressController.text.trim(),
      aadhar: aadharController.text.trim(),
      pan: panController.text.trim(),
      createdAt: "",
      uid: "",
    );
    if (aadharController.text.isNotEmpty) {
      ap.saveUserData(
        context: context,
        userModel: userModel,
        aadhar: aadharController,
        onSuccess: () {
          ap.saveUserDataSP().then((value) => ap.setSignIn());
        },
      );
    } else {
      showSnackBar(context, "Please Enter Aadhar Number");
    }
  }
}

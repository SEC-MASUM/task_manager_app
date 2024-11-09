import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/controllers/auth_controller.dart';
import 'package:task_manager_app/ui/widgets/tm_app_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _setUserData();
  }

  void _setUserData() {
    _emailTEController.text = AuthController.userData?.email ?? "";
    _firstNameTEController.text = AuthController.userData?.firstName ?? "";
    _lastNameTEController.text = AuthController.userData?.lastName ?? "";
    _phoneTEController.text = AuthController.userData?.mobile ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TMAppBar(isProfileScreenOpen: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 48),
                Text(
                  "Update Profile",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 32),
                _buildPhotoPicker(),
                const SizedBox(height: 8),
                TextFormField(
                  enabled: false,
                  controller: _emailTEController,
                  decoration: const InputDecoration(hintText: "Email"),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _firstNameTEController,
                  decoration: const InputDecoration(hintText: "First Name"),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _lastNameTEController,
                  decoration: const InputDecoration(hintText: "Last Name"),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _phoneTEController,
                  decoration: const InputDecoration(hintText: "Phone"),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _passwordTEController,
                  decoration: const InputDecoration(hintText: "Password"),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  child: const Icon(Icons.arrow_circle_right_outlined),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoPicker() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 50,
            decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8))),
            alignment: Alignment.center,
            child: const Text(
              "Photo",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
          ),
          const SizedBox(width: 8),
          const Text("Selected Photo"),
        ],
      ),
    );
  }
}

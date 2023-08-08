import 'package:flutter/material.dart';

import '../api/user_service.dart';
import '../helpers/utils.dart';

class AddSomeThing extends StatefulWidget {
  const AddSomeThing({Key? key}) : super(key: key);

  @override
  _AddSomeThingState createState() => _AddSomeThingState();
}

class _AddSomeThingState extends State<AddSomeThing> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _name = TextEditingController();
  String _role = "Directeur Usine";
  int _roleConverted = 4;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: const Text("Add New User"),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Name",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _name,
                decoration: const InputDecoration(
                  hintText: "Enter your name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Email",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _email,
                decoration: const InputDecoration(
                  hintText: "Enter your email",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Password",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _password,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Enter your password",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Role",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              DropdownButtonFormField<String>(
                value: _role,
                decoration: const InputDecoration(
                  hintText: "Select a role",
                  border: OutlineInputBorder(),
                ),
                items: const <String>[
                  'Directeur Usine',
                  'Directeur DAV',
                  'Directeur Financier'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  _roleConverted = newValue == "Directeur_Usine"
                      ? 2
                      : newValue == "Directeur_DAV"
                          ? 3
                          : 4;
                  setState(() {
                    _role = newValue!;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          child: const Text("Cancel"),
          onPressed: () => Navigator.pop(context),
        ),
        ElevatedButton(
          child: const Text("Submit"),
          onPressed: () async {
            Utils.startLoading(context);
            var response = await UserService.create(
                _email.text, _password.text, _name.text, _roleConverted);
            if (response) {
              print("done");
              Navigator.pop(context);
            } else {
              print("wrong");
            }

            Utils.stopLoading(context);
          },
        ),
      ],
    );
  }
}

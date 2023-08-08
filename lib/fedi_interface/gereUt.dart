import 'package:flutter/material.dart';
import 'package:last/api/user_service.dart';
import 'package:last/fedi_interface/contaiaddsupup.dart';


import '../helpers/utils.dart';

class GereUt extends StatefulWidget {
  const GereUt({Key? key}) : super(key: key);

  @override
  State<GereUt> createState() => _GereUtState();
}

class _GereUtState extends State<GereUt> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context, builder: (BuildContext context) => addUser());
            },
            backgroundColor: const Color(0xFFFF5400),
            tooltip: 'Capture Picture',
            elevation: 5,
            splashColor: Colors.grey,
            child: const Icon(
              Icons.person_add,
              color: Colors.white,
              size: 29,
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          body: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Gerer(title: "Liste d'utilisateurs"),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  addUser() {
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();
    final TextEditingController name = TextEditingController();
    String role = "Directeur Usine";
    int roleConverted = 4;
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
                controller: name,
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
                controller: email,
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
                controller: password,
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
                value: role,
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
                  roleConverted = newValue == "Directeur_Usine"
                      ? 2
                      : newValue == "Directeur_DAV"
                          ? 3
                          : 4;
                  setState(() {
                    role = newValue!;
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
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}

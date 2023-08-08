import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:last/api/user_service.dart';
import 'package:http/http.dart' as http;
import 'package:last/helpers/utils.dart';
import '../models/User.dart';

class ContList extends StatefulWidget {
  const ContList({
    Key? key,
  }) : super(key: key);

  @override
  State<ContList> createState() => _ContListState();
}

class _ContListState extends State<ContList> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _name = TextEditingController();
  late TextEditingController _mail = TextEditingController();
  bool isLoading = false;
  List<User>? listOfUsers = [];

  getUsers() async {
    setState(() {
      isLoading = true;
    });
    listOfUsers = await UserService.getAll();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : listOfUsers == null || listOfUsers!.isEmpty
            ? const Text('Pas de données')
            : Expanded(
                child: ListView.builder(
                  itemCount: listOfUsers!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        title: Row(children: [
                          const Icon(CupertinoIcons.person),
                          Text(listOfUsers![index].name!),
                        ]),
                        trailing: SizedBox(
                          width: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _delete(context, listOfUsers![index]);
                                },
                                child: const Icon(Icons.delete),
                              ),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          alertModify(listOfUsers![index]));
                                },
                                child: const Icon(Icons.edit),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
  }

  alertModify(user) {
    var selectedRole = "Directeur_Usine";
    var roleConverted = 4;
    var name = user.name;
    var email = user.email;
    return AlertDialog(
        scrollable: true,
        title: const Text("Modify User"),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _name,
                  decoration: InputDecoration(
                    labelText: ' ${user.name}',
                    icon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },

                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _mail,
                  decoration: InputDecoration(
                    labelText: ' ${user.email}',
                    icon: Icon(Icons.mail),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },

                ),
                DropdownButtonFormField<String>(
                  value: selectedRole,
                  decoration: const InputDecoration(
                    labelText: 'Role',
                    icon: Icon(Icons.settings),
                  ),
                  items: <String>[
                    'Directeur_Usine', //1
                    'Directeur_DAV', //2
                    'Directeur_Financier' //3
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
                      selectedRole = newValue!;
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
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          ElevatedButton(
              child: const Text("Save"),
              onPressed: () async {

                if (_formKey.currentState!.validate()) {
                  await UserService.update(user, _name.text, _mail.text,roleConverted,)
                      .then((v) => {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              backgroundColor: Colors.green,
                              behavior: SnackBarBehavior.floating,
                              content: Text('Utilisateur mis a jour!'),
                            ))
                          });

                }
              }),
        ]);
  }

  void _delete(BuildContext context, User user) {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext ctx) {
          return CupertinoAlertDialog(
            title: const Text('Veuillez confirmer'),
            content: Text(
                "Vous étes sure de supprimer l'utilisateur : ${user.name} ?"),
            actions: [
              // The "Yes" button
              CupertinoDialogAction(
                onPressed: () {
                  UserService.delete(user.id!.toString()).then((v) {
                    if (v) {
                      getUsers();
                    }
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.orange,
                      behavior: SnackBarBehavior.floating,
                      content: Text('Utilisateur a été supprimé'),
                    ));
                  });
                  Navigator.of(context).pop();
                },
                isDefaultAction: true,
                isDestructiveAction: true,
                child: const Text('Oui'),
              ),
              // The "No" button
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                isDefaultAction: false,
                isDestructiveAction: false,
                child: const Text('Non'),
              )
            ],
          );
        });
  }
}

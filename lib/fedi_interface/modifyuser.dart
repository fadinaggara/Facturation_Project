// import 'package:flutter/material.dart';
//
// import '../api/user_service.dart';
// import '../models/User.dart';
//
// class Modify extends StatefulWidget {
//   const Modify({Key? key, required this.user}) : super(key: key);
//
//   final User user;
//
//   @override
//   _ModifyState createState() => _ModifyState();
// }
//
// class _ModifyState extends State<Modify> {
//   final _formKey = GlobalKey<FormState>();
//   late  TextEditingController _email;
//   late TextEditingController _password;
//   late TextEditingController _name;
//   late String _selectedRole;
//   int _roleConverted = 2;
//
//   @override
//   void initState() {
//     super.initState();
//     print("--------- ${widget.user.toJson()}");
//     _email = TextEditingController(text: widget.user.email);
//     _password = TextEditingController();
//     _name = TextEditingController(text: widget.user.name);
//     _selectedRole =
//         widget.user.roles!.isEmpty || widget.user.roles![0].name! == "admin"
//             ? "Directeur_Usine"
//             : widget.user.roles![0].name!;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       scrollable: true,
//       title: const Text("Modify User"),
//       content: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(children: [
//                 const Icon(
//                   Icons.person,
//                   color: Colors.grey,
//                 ),
//                 const SizedBox(
//                   width: 12,
//                 ),
//                 Text('Name : ${widget.user.name}'),
//               ]),
//               SizedBox(
//                 height: 12,
//               ),
//               Row(children: [
//                 const Icon(
//                   Icons.mail,
//                   color: Colors.grey,
//                 ),
//                 const SizedBox(
//                   width: 12,
//                 ),
//                 Text('Email : ${widget.user.email}'),
//               ]),
//               // TextFormField(
//               //   controller: _name,
//               //   decoration: const InputDecoration(
//               //     labelText: "Name",
//               //     icon: Icon(Icons.account_box),
//               //   ),
//               //   validator: (value) {
//               //     if (value == null || value.isEmpty) {
//               //       return 'Please enter a name';
//               //     }
//               //     return null;
//               //   },
//               // ),
//               // TextFormField(
//               //   controller: _password,
//               //   obscureText: true,
//               //   decoration: const InputDecoration(
//               //     labelText: "Password",
//               //     icon: Icon(Icons.lock),
//               //   ),
//               //   validator: (value) {
//               //     if (value != null && value.isNotEmpty && value.length < 6) {
//               //       return 'Password must be at least 6 characters';
//               //     }
//               //     return null;
//               //   },
//               // ),
//               // TextFormField(
//               //   controller: _email,
//               //   decoration: const InputDecoration(
//               //     labelText: "Email",
//               //     icon: Icon(Icons.mail),
//               //   ),
//               //   validator: (value) {
//               //     if (value == null || value.isEmpty) {
//               //       return 'Please enter an email address';
//               //     } else if (!RegExp(
//               //             r"^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
//               //         .hasMatch(value)) {
//               //       return 'Please enter a valid email address';
//               //     }
//               //     return null;
//               //   },
//               // ),
//               DropdownButtonFormField<String>(
//                 value: _selectedRole,
//                 decoration: const InputDecoration(
//                   labelText: 'Role',
//                   icon: Icon(Icons.settings),
//                 ),
//                 items: <String>[
//                   'Directeur_Usine', //1
//                   'Directeur_DAV', //2
//                   'Directeur_Financier' //3
//                 ].map((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//                 onChanged: (newValue) {
//                   _roleConverted = newValue == "Directeur_Usine"
//                       ? 2
//                       : newValue == "Directeur_DAV"
//                           ? 3
//                           : 4;
//                   setState(() {
//                     _selectedRole = newValue!;
//                   });
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       actions: [
//         TextButton(
//           child: const Text("Cancel"),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         ElevatedButton(
//           child: const Text("Save"),
//           onPressed: () async{
//             if (_formKey.currentState!.validate()) {
//               await UserService.update(widget.user, _roleConverted,_name as String,_email as String);
//             }
//           },
//         ),
//       ],
//     );
//   }
// }

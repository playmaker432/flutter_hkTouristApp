import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    final drawer = buildDrawer(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SafeArea(
          child: Center(
        child: Column(children: [
          Text(
            'Hello Again!',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Welcome back, you\'ve been missed !',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(height: 20),

          // Email textfield
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            decoration: BoxDecoration(
                color: Color(0xfff0f0f0),
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12)),
            child: TextField(),
          )
        ]),
      )),
      drawer: drawer,
    );
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    } catch (error) {
      print(error);
    }
  }
}

// Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Login',
//                 style: TextStyle(
//                   fontSize: MediaQuery.of(context).size.width * 0.1,
//                 ),
//               ),
//               SizedBox(height: 25),
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Account',
//                 ),
//               ),
//               TextField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                 ),
//               ),
//               SizedBox(height: 75),
//               ElevatedButton.icon(
//                 onPressed: signInWithGoogle,
//                 icon: Icon(Icons.g_mobiledata),
//                 label: Text('Login with Google'),
//               ),
//             ],
//           ),
//         ),
//       ),
//

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  // Text editing controllers
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Sign user in method
  void signUserIn() {
    // Implement your sign-in logic here
  }

  @override
  Widget build(BuildContext context) {
    final drawer = buildDrawer(context);

    return Scaffold(
      drawer: drawer,
      appBar: AppBar(
        title: Text('Login'),
      ),
      backgroundColor: Colors.grey[60],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0), // Added padding
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Lock Icon
                Icon(
                  Icons.lock,
                  size: 75, // Adjusted size
                  color: Colors.blue, // Added color
                ),

                SizedBox(height: 30), // Added spacing

                // Welcome Text
                Text(
                  'Welcome back, you\'ve been missed!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                SizedBox(height: 15), // Added spacing

                // Username TextField
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintText: 'Username', // Added hintText
                  ),
                ),

                SizedBox(height: 10),

                // Password TextField
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password', // Added hintText
                  ),
                ),

                SizedBox(height: 10),

                // Forgot Password Text
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      // Handle forgot password
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                ),

                SizedBox(height: 25),

                // Sign In Button
                ElevatedButton(
                  onPressed: signUserIn,
                  child: Text('Sign In'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                ),

                SizedBox(height: 30),

                // Or continue with Text
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30),

                // Google and Apple Sign In Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Google Button
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white, // Button color
                      ),
                      child: IconButton(
                        icon: Icon(FontAwesomeIcons.google), // Image path
                        onPressed: () {
                          // Handle Google sign-in
                        },
                      ),
                    ),

                    SizedBox(width: 25),

                    // Apple Button
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white, // Button color
                      ),
                      child: IconButton(
                        icon: Icon(FontAwesomeIcons.apple), // Image path
                        onPressed: () {
                          // Handle Apple sign-in
                        },
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30),

                // Not a member? Register now Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class _LoginPageState extends State<LoginPage> {
//   final GoogleSignIn googleSignIn = GoogleSignIn();

//   @override
//   Widget build(BuildContext context) {
//     final drawer = buildDrawer(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login'),
//       ),
//       body: SafeArea(
//           child: Center(
//         child: Column(children: [
//           Text(
//             'Hello Again!',
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 10),
//           Text(
//             'Welcome back, you\'ve been missed !',
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//           ),
//           SizedBox(height: 20),

//           // Email textfield
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 25.0),
//             decoration: BoxDecoration(
//                 color: Color(0xfff0f0f0),
//                 border: Border.all(color: Colors.white),
//                 borderRadius: BorderRadius.circular(12)),
//             child: TextField(),
//           )
//         ]),
//       )),
//       drawer: drawer,
//     );
//   }

//   Future<void> signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//     } catch (error) {
//       print(error);
//     }
//   }
// }

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

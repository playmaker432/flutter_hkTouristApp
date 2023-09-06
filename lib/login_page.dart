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

                const SizedBox(height: 10), // Adjusted spacing

                // Welcome Text
                Text(
                  'Welcome back, you\'ve been missed!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 15), // Adjusted spacing

                // Username TextField
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintText: 'Username', // Added hintText
                  ),
                ),

                const SizedBox(height: 10),

                // Password TextField
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password', // Added hintText
                  ),
                ),

                const SizedBox(height: 10),

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

                const SizedBox(height: 25),

                // Sign In Button
                ElevatedButton(
                  onPressed: signUserIn,
                  child: Text('Sign In'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                ),

                const SizedBox(height: 30), // Adjusted spacing

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

                const SizedBox(height: 30), // Adjusted spacing

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
                        icon: Icon(FontAwesomeIcons.google), // Icon
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
                        icon: Icon(FontAwesomeIcons.apple), // Icon
                        onPressed: () {
                          // Handle Apple sign-in
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30), // Adjusted spacing

                // Not a member? Register now Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        // Navigate to the Register Page when tapped
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
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

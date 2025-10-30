import 'package:andrei_303/screens/login_screen.dart';
import 'package:andrei_303/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // ... (const MyApp)

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'eCommerce App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      // 1. Change this line
      home: const SignUpScreen(), // 2. Set LoginScreen as the home
    );
  }
}

// 1. Create a StatefulWidget
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

// 2. This is the State class
class _SignUpScreenState extends State<SignUpScreen> {

  // 3. Create a GlobalKey for the Form
  final _formKey = GlobalKey<FormState>();

  // 4. Create TextEditingControllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // 5. Clean up controllers when the widget is removed
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 1. A Scaffold provides the basic screen structure
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'), // CHANGE 1
      ),
      // 2. SingleChildScrollView prevents the keyboard from
      //    causing a "pixel overflow" error
      body: SingleChildScrollView(
        child: Padding(
          // 3. Add padding around the form
          padding: const EdgeInsets.all(16.0),
          // 4. The Form widget acts as a container for our fields
          child: Form(
            key: _formKey, // 5. Assign our key to the Form
            // 6. A Column arranges its children vertically
            child: Column(
              // 7. Center the contents of the column
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                // 2. The Email Text Field
                TextFormField(
                  controller: _emailController,
                  // 3. Link the controller
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(), // 4. Nice border
                  ),
                  keyboardType: TextInputType.emailAddress,
                  // 5. Show '@' on keyboard
                  // 6. Validator function
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null; // 'null' means the input is valid
                  },
                ),

                // 7. A spacer
                const SizedBox(height: 16),

                // 8. The Password Text Field
                TextFormField(
                  controller: _passwordController, // 9. Link the controller
                  obscureText: true, // 10. This hides the password
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  // 11. Validator function
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                // ... (after the Password field)

                // 1. A spacer
                const SizedBox(height: 20),

                // 2. The Login Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50), // 3. Make it wide
                  ),
                  // 4. onPressed is the click handler
                  onPressed: () {
                    // 5. This checks all validators
                    if (_formKey.currentState!.validate()) {
                      // Logic for login will go here in the next module
                      print('Sign Up Valid!');
                    }
                  },
                  child: const Text('Sign Up'), // CHANGE 2
                ),

                // 6. A spacer
                const SizedBox(height: 10),

                // 7. The "Sign Up" toggle button
                TextButton(
                  onPressed: () {
                    // 3. Navigate BACK to the Login screen
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  // CHANGE 4
                  child: const Text("Already have an account? Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'custom_scaffold.dart';
//
// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   final _formSignupKey = GlobalKey<FormState>();
//   bool agreePersonalData = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomScaffold(
//       child: Column(
//         children: [
//           const Expanded(
//             flex: 1,
//             child: SizedBox(
//               height: 10,
//             ),
//           ),
//           Expanded(
//             flex: 7,
//             child: Container(
//               padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(40.0),
//                   topRight: Radius.circular(40.0),
//                 ),
//               ),
//               child: SingleChildScrollView(
//                 child: Form(
//                   key: _formSignupKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Get Started',
//                         style: TextStyle(
//                           fontSize: 30.0,
//                           fontWeight: FontWeight.w900,
//                           color: Theme.of(context).primaryColor,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 40.0,
//                       ),
//                       TextFormField(
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter Full name';
//                           }
//                           return null;
//                         },
//                         decoration: InputDecoration(
//                           label: const Text('Full Name'),
//                           hintText: 'Enter Full Name',
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 25.0,
//                       ),
//                       TextFormField(
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter Email';
//                           }
//                           return null;
//                         },
//                         decoration: InputDecoration(
//                           label: const Text('Email'),
//                           hintText: 'Enter Email',
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 25.0,
//                       ),
//                       TextFormField(
//                         obscureText: true,
//                         obscuringCharacter: '*',
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter Password';
//                           }
//                           return null;
//                         },
//                         decoration: InputDecoration(
//                           label: const Text('Password'),
//                           hintText: 'Enter Password',
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 25.0,
//                       ),
//                       TextFormField(
//                         keyboardType: TextInputType.phone,
//                         decoration: InputDecoration(
//                           labelText: 'Mobile Number',
//                           hintText: 'Enter Mobile Number',
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 25.0,
//                       ),
//                       Row(
//                         children: [
//                           Checkbox(
//                             value: agreePersonalData,
//                             onChanged: (bool? value) {
//                               setState(() {
//                                 agreePersonalData = value!;
//                               });
//                             },
//                           ),
//                           const Text(
//                             'I agree to the processing of ',
//                           ),
//                           Text(
//                             'Personal data',
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 25.0,
//                       ),
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             if (_formSignupKey.currentState!.validate() &&
//                                 agreePersonalData) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content: Text('Processing Data'),
//                                 ),
//                               );
//                             } else if (!agreePersonalData) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content: Text(
//                                       'Please agree to the processing of personal data'),
//                                 ),
//                               );
//                             }
//                           },
//                           child: const Text('Sign up'),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 30.0,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Text(
//                             'Already have an account? ',
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               // Navigate to sign-in screen
//                             },
//                             child: Text(
//                               'Sign in',
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 20.0,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:cyber_awareness_app/sign_in%20page/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../additional page/custom_scaffold.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formSignupKey = GlobalKey<FormState>();
  bool agreePersonalData = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  signUp() async {
    if (_formSignupKey.currentState!.validate() &&
        agreePersonalData) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        // Sign up successful, navigate to the next screen
        // Here you can also handle any additional user data storage or processing
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignInScreen()),
        );
      } catch (e) {
        // Handle sign-up errors
        print("Sign-up error: $e");
        String errorMessage = "An error occurred during sign-up.";
        if (e is FirebaseAuthException) {
          switch (e.code) {
            case 'email-already-in-use':
              errorMessage = "The email address is already in use.";
              break;
            case 'weak-password':
              errorMessage = "The password is too weak.";
              break;
          // Handle other error codes as needed
          }
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
          ),
        );
      }
    } else if (!agreePersonalData) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Please agree to the processing of personal data'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(
              height: 10,
            ),
          ),


          Expanded(
            flex: 7,
            child: Container(
              //width: 360,
              padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formSignupKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Full name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Full Name'),
                          hintText: 'Enter Full Name',
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Email'),
                          hintText: 'Enter Email',
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      TextFormField(
                        controller:_passwordController,
                        obscureText: true,
                        obscuringCharacter: '*',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Password'),
                          hintText: 'Enter Password',
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Mobile numbers';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Mobile Number'),
                          hintText: 'Enter Mobile Number',

                        ),

                      ),
                      const SizedBox(
                        height: 28.0,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: agreePersonalData,
                            onChanged: (bool? value) {
                              setState(() {
                                agreePersonalData = value!;
                              });
                            },
                          ),
                          Text(
                            'I agree to the processing of Personal data',
                            style: TextStyle(fontSize: 13,),
                          ),
                          // Text(
                          //   'Personal data',
                          // ),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // if (_formSignupKey.currentState!.validate() &&
                            //     agreePersonalData) {
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //     const SnackBar(
                            //       content: Text('Processing Data'),
                            //     ),
                            //   );
                            // } else if (!agreePersonalData) {
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //     const SnackBar(
                            //       content: Text(
                            //           'Please agree to the processing of personal data'),
                            //     ),
                            //   );
                           // },
                                signUp();

                          },
                          child: const Text('Sign up'),
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account? ',
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigate to sign-in screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (e) => const SignInScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Sign in',style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

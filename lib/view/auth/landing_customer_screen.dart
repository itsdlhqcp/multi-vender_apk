import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multivender_app/controllers/auth_controller.dart';
import 'package:multivender_app/controllers/snack_bar_controller.dart';
import 'package:multivender_app/view/auth/customer_login_screen.dart';
import 'package:multivender_app/view/auth/customer_login_screen1.dart';

class LandingCustomerScreeen extends StatefulWidget {
  static const String routeName = 'LandingCustomerScreen';
  @override
  State<LandingCustomerScreeen> createState() => _LandingCustomerScreeenState();
}

class _LandingCustomerScreeenState extends State<LandingCustomerScreeen> {
  final AuthController _authController = AuthController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool passwordVisable = true;
  bool isLoading = false;

  bool _isVisible = false;
  bool _isPasswordEightCharacters = false;
  bool _hasPasswordOneNumber = false;

  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');

    setState(() {
      _isPasswordEightCharacters = false;
      if (password.length >= 8) _isPasswordEightCharacters = true;

      _hasPasswordOneNumber = false;
      if (numericRegex.hasMatch(password)) _hasPasswordOneNumber = true;
    });
  }

  Uint8List? _image;
  pickImageFromGallery() async {
    Uint8List im = await _authController.pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  pickImageFromCamera() async {
    Uint8List im = await _authController.pickImage(ImageSource.camera);
    setState(() {
      _image = im;
    });
  }

  signUp() async {
    setState(() {
      isLoading = true;
    });
    String res = await _authController.signUpUsers(_fullNameController.text,
        _emailController.text, _passwordController.text, _image);
    setState(() {
      isLoading = false;
    });

    if (res != 'success') {
      return snackBar(res, context);
    } else {
      return Navigator.of(context)
          .push(MaterialPageRoute(builder: (BuildContext context) {
        return CustomerLoginScreen1();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       'Welcome to ',
                //       style: TextStyle(
                //           fontSize: 35,
                //           fontWeight: FontWeight.w500,
                //           fontStyle: FontStyle.italic),
                //     ),
                //     TextButton(
                //       onPressed: () {},
                //       child: Text(
                //         'E-BAY',
                //         style: TextStyle(
                //             fontSize: 28,
                //             fontWeight: FontWeight.w600,
                //             fontStyle: FontStyle.italic),
                //       ),
                //     ),
                //     SizedBox(
                //       width: 55,
                //     )
                //   ],
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create Customer's Account",
                      style: TextStyle(
                        fontSize: 21.5,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Brand-Roboto",
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.people,
                        size: 26,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 28,
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 9,
                    ),
                    _image != null
                        ? CircleAvatar(
                            radius: 60,
                            backgroundImage: MemoryImage(_image!),
                          )
                        : CircleAvatar(
                            radius: 60,
                            // backgroundColor: Color.fromARGB(255, 122, 200, 200),
                            backgroundColor: Color.fromARGB(157, 96, 125, 139),
                            child: Text(
                              '''Pick profile photo''',
                              style: TextStyle(
                                fontSize: 13.6,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {
                              pickImageFromCamera();
                            },
                            icon: Icon(
                              Icons.camera_alt,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {
                              pickImageFromGallery();
                            },
                            icon: Icon(
                              Icons.photo,
                              color: Color.fromARGB(255, 240, 236, 236),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter your name";
                        }
                        return null;
                      },
                      controller: _fullNameController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                        ),
                        labelText: 'Full Name',
                        hintText: 'Enter your name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                        ),
                        labelText: 'Email',
                        hintText: 'Enter your Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // TextFormField(
                    //   controller: _emailController,
                    //   decoration: InputDecoration(
                    //     prefixIcon: Icon(
                    //       Icons.phone,
                    //     ),
                    //     labelText: 'Phone Number',
                    //     hintText: 'Enter your contact number',
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(
                    //         12,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // TextFormField(
                    //   controller: _passwordController,
                    //   obscureText: passwordVisable,
                    //   decoration: InputDecoration(
                    //     prefixIcon: Icon(
                    //       Icons.password_outlined,
                    //     ),
                    //     suffixIcon: IconButton(
                    //       onPressed: () {
                    //         setState(() {
                    //           passwordVisable = !passwordVisable;
                    //         });
                    //       },
                    //       icon: passwordVisable
                    //           ? Icon(
                    //               Icons.visibility,
                    //             )
                    //           : Icon(
                    //               Icons.visibility_off,
                    //             ),
                    //     ),
                    //     labelText: 'Password',
                    //     hintText: 'Enter your password',
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(
                    //         12,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    TextField(
                      onChanged: (password) => onPasswordChanged(password),
                      obscureText: !_isVisible,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isVisible = !_isVisible;
                            });
                          },
                          icon: _isVisible
                              ? Icon(
                                  Icons.visibility,
                                  color: Colors.black,
                                )
                              : Icon(
                                  Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black)),
                        hintText: "Password",
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.password,
                          color: Color.fromARGB(255, 104, 103, 103),
                        ),
                        hintText: 'Confirm password to signup',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                              color: _isPasswordEightCharacters
                                  ? Colors.green
                                  : Colors.transparent,
                              border: _isPasswordEightCharacters
                                  ? Border.all(color: Colors.transparent)
                                  : Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Contains at least 8 characters",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                              color: _hasPasswordOneNumber
                                  ? Colors.green
                                  : Colors.transparent,
                              border: _hasPasswordOneNumber
                                  ? Border.all(color: Colors.transparent)
                                  : Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Contains at least 1 number",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    GestureDetector(
                      onTap: () {
                        signUp();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 40,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Center(
                            child: isLoading
                                ? CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text(
                                    'Sign Up',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold),
                                  )),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account ?',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
                              return CustomerLoginScreen();
                            }));
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 15.5, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.black12,
                      thickness: 1.2,
                      indent: 20,
                      endIndent: 20,
                      height: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Creates a sellers account ?',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 15.5, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "E-Cart",
                          style: TextStyle(
                              fontSize: 12,
                              // color: Color.fromARGB(255, 32, 124, 7),
                              color: Color.fromARGB(255, 0, 108, 122)),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.shopping_bag,
                          size: 15,
                          color: Colors.brown,
                        ),
                      ],
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

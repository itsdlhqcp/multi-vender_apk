import 'package:flutter/material.dart';

import 'package:multivender_app/controllers/auth_controller.dart';
import 'package:multivender_app/controllers/snack_bar_controller.dart';
import 'package:multivender_app/view/auth/landing_customer_screen.dart';
import 'package:multivender_app/view/customer_home_screen.dart';

class CustomerLoginScreen extends StatefulWidget {
  @override
  State<CustomerLoginScreen> createState() => _CustomerLoginScreenState();
}

class _CustomerLoginScreenState extends State<CustomerLoginScreen> {
  final AuthController _authController = AuthController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool passwordVisable = true;
  bool isLoading = false;
  bool _isVisible = false;

  loginUsers() async {
    setState(() {
      isLoading = true;
    });
    String res = await _authController.loginUsers(
        _emailController.text, _passwordController.text);
    setState(() {
      isLoading = false;
    });
    if (res != 'success') {
      return snackBar(res, context);
    } else {
      return Navigator.of(context)
          .push(MaterialPageRoute(builder: (BuildContext context) {
        return CustomerHomeScreen();
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
                SizedBox(
                  height: 144,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Let's LogIn to E-cart",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.cyan,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Brand-Roboto",
                      ),
                    ),
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: Icon(
                    //     Icons.people,
                    //     size: 26,
                    //     color: Colors.grey,
                    //   ),
                    // ),
                    SizedBox(
                      width: 122,
                    ),
                  ],
                ),
                SizedBox(
                  height: 0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "SignIn to Customer's Account",
                      style: TextStyle(
                        fontSize: 18,
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
                      width: 80,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.black54,
                          ),
                          hintText: 'Enter your Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _passwordController,
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
                    SizedBox(
                      height: 12,
                    ),
                    GestureDetector(
                      onTap: () {
                        loginUsers();
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
                                    'Login',
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
                          "Need an account ?",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
                              return LandingCustomerScreeen();
                            }));
                          },
                          child: Text(
                            'Sign Up',
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
                    SizedBox(
                      height: 132,
                    )
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

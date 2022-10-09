import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    CollectionReference customer =
        FirebaseFirestore.instance.collection('users');
    return FutureBuilder(
      future: customer.doc(_auth.currentUser!.uid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('something went wrong');
        }
        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text('Document does not exist');
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Scaffold(
            backgroundColor: Colors.grey.shade300,
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  backgroundColor: Colors.white,
                  expandedHeight: 110,
                  flexibleSpace: LayoutBuilder(builder: (context, constraints) {
                    return FlexibleSpaceBar(
                      title: AnimatedOpacity(
                        opacity: constraints.biggest.height <= 120 ? 1 : 0,
                        duration: Duration(
                          milliseconds: 300,
                        ),
                      ),
                      background: Container(
                        decoration: BoxDecoration(
                          color: Colors.cyan,
                          gradient: LinearGradient(
                            colors: [
                              Colors.cyan,
                              Colors.black26,
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 38,
                                backgroundImage: NetworkImage('${data['image']}'),
                              ),
                              SizedBox(
                                width: 18,
                              ),
                              Text(
                                '${data['fullName']}',
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            50,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                        25,
                                      ),
                                      bottomLeft: Radius.circular(
                                        25,
                                      ))),
                              child: TextButton(
                                onPressed: () {},
                                child: SizedBox(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: Center(
                                    child: Text(
                                      "Cart",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.cyan,
                              ),
                              child: TextButton(
                                onPressed: () {},
                                child: SizedBox(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: Center(
                                    child: Text(
                                      "Order",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(
                                        25,
                                      ),
                                      bottomRight: Radius.circular(
                                        25,
                                      ))),
                              child: TextButton(
                                onPressed: () {},
                                child: SizedBox(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.24,
                                  child: Center(
                                    child: Text(
                                      "WishList",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RepeatedDivider(
                        title: 'Account Info',
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 280,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text('Email Address :'),
                                subtitle: Text('${data['email']}'),
                                leading: Icon(
                                  Icons.email,
                                  size: 22,
                                  color: Colors.cyan,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Divider(
                                  color: Colors.cyan,
                                  thickness: 1,
                                ),
                              ),
                              ListTile(
                                title: Text('Phone No :'),
                                subtitle: Text('78463853654'),
                                leading: Icon(
                                  Icons.phone,
                                  size: 22,
                                  color: Colors.cyan,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Divider(
                                  color: Colors.cyan,
                                  thickness: 1,
                                ),
                              ),
                              ListTile(
                                title: Text('Email Address :'),
                                subtitle: Text('name@gmail.com'),
                                leading: Icon(
                                  Icons.location_pin,
                                  size: 22,
                                  color: Colors.cyan,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      RepeatedDivider(
                        title: 'Account Settings',
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 280,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text('Edit Profile'),
                                leading: Icon(
                                  Icons.edit,
                                  size: 22,
                                  color: Colors.cyan,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Divider(
                                  color: Colors.cyan,
                                  thickness: 1,
                                ),
                              ),
                              ListTile(
                                title: Text('Change password'),
                                leading: Icon(
                                  Icons.lock,
                                  size: 22,
                                  color: Colors.cyan,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Divider(
                                  color: Colors.cyan,
                                  thickness: 1,
                                ),
                              ),
                              ListTile(
                                title: Text('Logout'),
                                leading: Icon(
                                  Icons.logout,
                                  size: 22,
                                  color: Colors.cyan,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(
            color: Colors.cyan,
          ),
        );
      },
    );
  }
}

class RepeatedDivider extends StatelessWidget {
  final String title;
  const RepeatedDivider({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 40,
          width: 84,
          child: Divider(
            color: Colors.grey,
            thickness: 1,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.grey,
          ),
        ),
        SizedBox(
          height: 40,
          width: 50,
          child: Divider(
            color: Colors.grey,
            thickness: 1,
          ),
        )
      ],
    );
  }
}

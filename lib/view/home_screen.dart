import 'package:flutter/material.dart';
import 'package:multivender_app/view/inner_screen/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return SearchScreen();
              }));
            },
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.6,
                  color: Colors.cyan,
                ),
                borderRadius: BorderRadius.circular(
                  25,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(1.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 30,
                    ),
                    Text(
                      'What are you looking for',
                      style: TextStyle(color: Colors.grey, fontSize: 19),
                    ),
                    Container(
                      height: 33,
                      width: 74,
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(
                          25,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Search',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          elevation: 0,
          bottom: TabBar(
            tabs: [
              RepeatedTap(
                title: 'Men',
              ),
              RepeatedTap(
                title: 'Women',
              ),
              RepeatedTap(
                title: 'Kids',
              ),
              RepeatedTap(
                title: 'Shoes',
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          Center(
            child: Text(
              'Men Category',
            ),
          ),
          Center(
            child: Text(
              'Women Category',
            ),
          ),
          Center(
            child: Text(
              'Kids Category',
            ),
          ),
          Center(
            child: Text(
              'Shoes Category',
            ),
          ),
        ]),
      ),
    );
  }
}

class RepeatedTap extends StatelessWidget {
  final String title;
  const RepeatedTap({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        title,
        style: TextStyle(
          color: Colors.grey.shade600,
        ),
      ),
    );
  }
}

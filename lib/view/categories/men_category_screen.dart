import 'package:flutter/material.dart';

class MenCategoryScreen extends StatelessWidget {
  List<String> men = [
    'Shirt',
    'T-Shirt',
    'Jacket',
    'Suit',
    'Jeans'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Text(
            'Men',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.68,
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 15,
            mainAxisSpacing: 70,
            children: List.generate(
              5,
              (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: Image.asset(
                          'lib/assets/images/mens/men$index.png',
                        ),
                      ),
                      Text(
                        men[index],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}

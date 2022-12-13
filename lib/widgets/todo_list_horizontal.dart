import 'package:flutter/material.dart';


class TodoListHorizontal extends StatefulWidget {
  const TodoListHorizontal({Key? key}) : super(key: key);

  @override
  State<TodoListHorizontal> createState() => _TodoListHorizontalState();
}

class _TodoListHorizontalState extends State<TodoListHorizontal> {
  final PageController _pageController = PageController(
    viewportFraction: 0.8,

  );
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: 10,
        controller: _pageController,
        itemBuilder: (context, index)
    {
      return Container(
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 10,),
        padding: const EdgeInsets.all(20.0,),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Design UI ToDo APP',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                    Text(
                      'Friday, 08 July 2022',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Container(
                  height: 50.0,
                  width: 50.0,
                  decoration:  BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/person_1.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.deepOrange,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white),
                  ),
                ),
              ],
            ),
            const Divider(
              height: 25.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                 Text(
                  'Description: ',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            const Text(
              'Design a simple home pages with clean \n'
                  'layout and color based on the guidelines..',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13.0,
              ),
            ),
            const SizedBox(height: 50,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Teams:', style: TextStyle(color: Colors.grey),),
                    Text('Progress:', style: TextStyle(color: Colors.grey),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 20.0,
                          width: 20.0,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/images/person_2.jpg',
                              ),
                              fit: BoxFit.cover,
                            ),
                            color: Colors.blueAccent,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Container(
                            height: 20.0,
                            width: 20.0,
                            decoration:  BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage(
                                  'assets/images/person_1.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                              color: Colors.deepOrange,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: Container(
                            height: 20.0,
                            width: 20.0,
                            decoration:  BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage(
                                  'assets/images/person_2.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                              color: Colors.deepOrange,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 36.0),
                          child: Container(
                            height: 20.0,
                            width: 20.0,
                            decoration:  BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage(
                                  'assets/images/person_1.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                              color: Colors.deepOrange,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white),
                            ),
                          ),
                        ),


                      ],
                    ),
                    SizedBox(width: 140,),
                    Icon(Icons.incomplete_circle_outlined),
                    Text('78%'),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    }
    );
  }
}

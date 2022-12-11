import 'package:flutter/material.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
                    'Meeting with Client',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
                  ),
                  Text(
                    'Redesign Motion Graphics',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              const Icon(
                Icons.check_circle,
                color: Colors.blue,
              ),
            ],
          ),
          const Divider(
            height: 25.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Today  11:12 PM',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.0,
                ),
              ),
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
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

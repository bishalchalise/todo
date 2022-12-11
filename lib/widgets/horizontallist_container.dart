import 'package:flutter/cupertino.dart';
import 'package:todoapp/widgets/todo_horizontal_list_item.dart';
// import 'package:todoapp/widgets/todo_list_horizontal.dart';

import 'completed_viewmore.dart';

class HorizontalContainer extends StatelessWidget {
  const HorizontalContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        HorizontalTodoListItem(),
        CompletedViewMore(
          firstText: 'On Progress  (12)',
          lastText: 'View More',
        ),


      ],
    );

  }
}

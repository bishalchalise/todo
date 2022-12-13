import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  final Function(String ) onCategorySelect;
  const CategorySelector({Key? key,
    required this.onCategorySelect,
  }) : super(key: key);

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  String activeCategory = "personal";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        10.0,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(

            child: _itemBuilder(
              onPressed: () {
              setState(() {
                activeCategory = 'personal';
              });
              widget.onCategorySelect('personal');
              },
              value: 'Personal',
              icon:  Icon(
                Icons.person_outline,
                color: activeCategory!= 'personal' ? Colors.grey : Colors.white,
              ),
              isActive: activeCategory == 'personal',

            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: _itemBuilder(
              onPressed: () {
              setState(() {
                activeCategory = 'teams';
              },

              );
              widget.onCategorySelect('teams');
              },
              value: 'Teams',
              icon:  Icon(
                Icons.people_outline,
                color: activeCategory!= 'teams' ? Colors.grey : Colors.white,
              ),
              isActive: activeCategory == 'teams',

            ),
          )
        ],
      ),
    );
  }

  Widget _itemBuilder({
    required final String value,
    required final Icon icon,
    required final Function()? onPressed,
    required final bool isActive,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 12.0,
        ),
        decoration: BoxDecoration(
          color: isActive ? Colors.blue : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            icon,
            const SizedBox(
              width: 10.0,
            ),
            Text(
              value,
              style:  TextStyle(
                color: !isActive ? Colors.grey : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

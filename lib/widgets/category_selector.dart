import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  final String? initialCategory;
  final Function(String) onCategorySelect;
  const CategorySelector({
    Key? key,
    required this.onCategorySelect,
    this.initialCategory,
  }) : super(key: key);

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  String _activeCategory = "personal";

  @override
  void initState() {
    super.initState();
    if (widget.initialCategory != null) {
      _activeCategory = widget.initialCategory!;
    }
  }

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
                  _activeCategory = 'personal';
                });
                widget.onCategorySelect('personal');
              },
              value: 'Personal',
              icon: Icon(
                Icons.person_outline,
                color:
                    _activeCategory != 'personal' ? Colors.grey : Colors.white,
              ),
              isActive: _activeCategory == 'personal',
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: _itemBuilder(
              onPressed: () {
                setState(
                  () {
                    _activeCategory = 'teams';
                  },
                );
                widget.onCategorySelect('teams');
              },
              value: 'Teams',
              icon: Icon(
                Icons.people_outline,
                color: _activeCategory != 'teams' ? Colors.grey : Colors.white,
              ),
              isActive: _activeCategory == 'teams',
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
              style: TextStyle(
                color: !isActive ? Colors.grey : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PostButton extends StatelessWidget {
  final void Function()? onTap;
  const PostButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(left: 5),
        child: const Center(
          child: Icon(Icons.done),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class FilterSwitch extends StatelessWidget {
  const FilterSwitch(
      {super.key,
      required this.title,
      this.subtitle,
      required this.value,
      required this.onChange});

  final String title;
  final String? subtitle;
  final bool value;
  final void Function(bool newValue) onChange;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            )
          : null,
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
      value: value,
      onChanged: (newValue) => onChange(newValue),
    );
  }
}

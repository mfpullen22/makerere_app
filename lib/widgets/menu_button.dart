import "package:flutter/material.dart";

class MenuButton extends StatelessWidget {
  const MenuButton(
      {required this.title, required this.onSelectMenu, super.key});

  final String title;
  final void Function() onSelectMenu;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectMenu,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              Theme.of(context)
                  .colorScheme
                  .secondaryContainer
                  .withValues(alpha: 0.55),
              Theme.of(context)
                  .colorScheme
                  .tertiaryContainer
                  .withValues(alpha: 0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
        ),
      ),
    );
  }
}

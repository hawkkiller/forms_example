import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// {@template submit_form_screen}
/// SubmitFormScreen is a screen that manages a form.
/// {@endtemplate}
class SubmitFormScreen extends StatelessWidget {
  /// {@macro submit_form_screen}
  const SubmitFormScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: const Text('Submit Form'),
              floating: true,
              snap: true,
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_rounded),
                onPressed: () => GoRouter.of(context).pop(),
              ),
            ),
          ],
        ),
      );
}

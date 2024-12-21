import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizzle_starter/src/feature/form/model/form_submission_data.dart';

class PersonalDetailsFormPart extends StatefulWidget {
  const PersonalDetailsFormPart({
    required this.personalDetailsFormData,
    required this.onFormDataChanged,
    required this.onNextPressed,
    super.key,
  });

  final PersonalDetailsFormData? personalDetailsFormData;
  final ValueChanged<PersonalDetailsFormData> onFormDataChanged;
  final VoidCallback? onNextPressed;

  @override
  State<PersonalDetailsFormPart> createState() => _PersonalDetailsFormPartState();
}

class _PersonalDetailsFormPartState extends State<PersonalDetailsFormPart> {
  late final TextEditingController nameController;
  late final TextEditingController lastNameController;
  late final Listenable _formListenable;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(
      text: widget.personalDetailsFormData?.firstName,
    );
    lastNameController = TextEditingController(
      text: widget.personalDetailsFormData?.lastName,
    );
    _formListenable = Listenable.merge([
      nameController,
      lastNameController,
    ]);

    _formListenable.addListener(_onFormChanged);
  }

  @override
  void dispose() {
    nameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  void _onFormChanged() {
    widget.onFormDataChanged(
      (widget.personalDetailsFormData ?? PersonalDetailsFormData()).copyWith(
        firstName: nameController.text,
        lastName: lastNameController.text,
      ),
    );
  }

  void _onNextPressed() {
    widget.onNextPressed?.call();
  }

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Card.outlined(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Personal Details',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'First Name'),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: lastNameController,
                    decoration: const InputDecoration(labelText: 'Last Name'),
                  ),
                  const SizedBox(height: 16),
                  ListenableBuilder(
                    listenable: _formListenable,
                    builder: (context, _) {
                      final isFormValid =
                          nameController.text.isNotEmpty && lastNameController.text.isNotEmpty;
                      return FilledButton.icon(
                        label: const Text('Next'),
                        onPressed: isFormValid ? _onNextPressed : null,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

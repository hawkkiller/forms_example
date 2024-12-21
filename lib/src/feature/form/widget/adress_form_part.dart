import 'package:flutter/material.dart';
import 'package:sizzle_starter/src/feature/form/model/form_submission_data.dart';

class AddressFormPart extends StatefulWidget {
  const AddressFormPart({
    required this.addressFormData,
    required this.onFormDataChanged,
    required this.onNextPressed,
    super.key,
  });

  final AddressFormData? addressFormData;
  final ValueChanged<AddressFormData> onFormDataChanged;
  final VoidCallback? onNextPressed;

  @override
  State<AddressFormPart> createState() => _AddressFormPartState();
}

class _AddressFormPartState extends State<AddressFormPart> {
  late final TextEditingController streetController;
  late final TextEditingController cityController;
  late final TextEditingController stateController;
  late final TextEditingController zipCodeController;
  late final Listenable _formListenable;

  @override
  void initState() {
    super.initState();
    streetController = TextEditingController(
      text: widget.addressFormData?.street,
    );
    cityController = TextEditingController(
      text: widget.addressFormData?.city,
    );
    stateController = TextEditingController(
      text: widget.addressFormData?.state,
    );
    zipCodeController = TextEditingController(
      text: widget.addressFormData?.zipCode,
    );
    _formListenable = Listenable.merge([
      streetController,
      cityController,
      stateController,
      zipCodeController,
    ]);

    _formListenable.addListener(_onFormChanged);
  }

  @override
  void dispose() {
    streetController.dispose();
    cityController.dispose();
    stateController.dispose();
    zipCodeController.dispose();
    super.dispose();
  }

  void _onFormChanged() {
    widget.onFormDataChanged(
      (widget.addressFormData ?? AddressFormData()).copyWith(
        street: streetController.text,
        city: cityController.text,
        state: stateController.text,
        zipCode: zipCodeController.text,
      ),
    );
  }

  void _onNextPressed() {}

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
                  TextField(
                    controller: streetController,
                    decoration: const InputDecoration(labelText: 'Street'),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: cityController,
                    decoration: const InputDecoration(labelText: 'City'),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: stateController,
                    decoration: const InputDecoration(labelText: 'State'),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: zipCodeController,
                    decoration: const InputDecoration(labelText: 'Zip Code'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: widget.onNextPressed,
                    child: const Text('Next'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

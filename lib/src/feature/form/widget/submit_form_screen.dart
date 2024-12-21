import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizzle_starter/src/feature/form/model/form_submission_data.dart';
import 'package:sizzle_starter/src/feature/form/widget/adress_form_part.dart';
import 'package:sizzle_starter/src/feature/form/widget/personal_details_form_part.dart';

/// {@template submit_form_screen}
/// SubmitFormScreen is a screen that manages a form.
/// {@endtemplate}
class SubmitFormScreen extends StatefulWidget {
  /// {@macro submit_form_screen}
  const SubmitFormScreen({super.key});

  @override
  State<SubmitFormScreen> createState() => _SubmitFormScreenState();
}

class _SubmitFormScreenState extends State<SubmitFormScreen> {
  FormSubmissionStep currentStep = FormSubmissionStep.personalDetails;
  var formSubmissionData = const FormSubmissionData();

  void _onPersonalDetailsChanged(PersonalDetailsFormData personalDetails) {
    setState(() {
      formSubmissionData = formSubmissionData.copyWith(
        personalDetails: personalDetails,
      );
    });
  }

  void _onAddressChanged(AddressFormData address) {
    setState(() {
      formSubmissionData = formSubmissionData.copyWith(
        address: address,
      );
    });
  }

  void _goToStep(FormSubmissionStep step) => setState(() => currentStep = step);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => GoRouter.of(context).pop(),
            ),
          ],
        ),
        body: switch (currentStep) {
          FormSubmissionStep.personalDetails => PersonalDetailsFormPart(
              personalDetailsFormData: formSubmissionData.personalDetails,
              onFormDataChanged: _onPersonalDetailsChanged,
              onNextPressed: () => _goToStep(FormSubmissionStep.address),
            ),
          FormSubmissionStep.address => AddressFormPart(
              addressFormData: formSubmissionData.address,
              onFormDataChanged: _onAddressChanged,
              onNextPressed: () => _goToStep(FormSubmissionStep.contactDetails),
            ),
          FormSubmissionStep.contactDetails => throw UnimplementedError(),
          FormSubmissionStep.employmentDetails => throw UnimplementedError(),
        },
      );
}

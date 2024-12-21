/// Enum representing the different steps in a multi-step form submission process
enum FormSubmissionStep {
  personalDetails,
  address,
  contactDetails,
  employmentDetails,
}

/// Represents the complete form submission data across multiple steps
class FormSubmissionData {
  /// Constructor for creating a new form submission data instance
  const FormSubmissionData({
    this.personalDetails,
    this.address,
    this.contactDetails,
    this.employmentDetails,
  });

  final PersonalDetailsFormData? personalDetails;
  final AddressFormData? address;
  final ContactDetailsFormData? contactDetails;
  final EmploymentDetailsFormData? employmentDetails;

  /// Creates a copy of the current instance with optional parameter overrides
  /// Allows explicitly setting values to null
  FormSubmissionData copyWith({
    PersonalDetailsFormData? personalDetails,
    AddressFormData? address,
    ContactDetailsFormData? contactDetails,
    EmploymentDetailsFormData? employmentDetails,
    bool clearPersonalDetails = false,
    bool clearAddress = false,
    bool clearContactDetails = false,
    bool clearEmploymentDetails = false,
  }) =>
      FormSubmissionData(
        personalDetails: clearPersonalDetails ? null : personalDetails ?? this.personalDetails,
        address: clearAddress ? null : address ?? this.address,
        contactDetails: clearContactDetails ? null : contactDetails ?? this.contactDetails,
        employmentDetails:
            clearEmploymentDetails ? null : employmentDetails ?? this.employmentDetails,
      );

  FormSubmissionStep get currentStep {
    if (personalDetails == null) {
      return FormSubmissionStep.personalDetails;
    } else if (address == null) {
      return FormSubmissionStep.address;
    } else if (contactDetails == null) {
      return FormSubmissionStep.contactDetails;
    } else if (employmentDetails == null) {
      return FormSubmissionStep.employmentDetails;
    } else {
      return FormSubmissionStep.personalDetails;
    }
  }
}

/// Represents personal details in the form submission
class PersonalDetailsFormData {
  PersonalDetailsFormData({
    this.firstName,
    this.lastName,
  });

  final String? firstName;
  final String? lastName;

  /// Creates a copy of the current instance with optional parameter overrides
  /// Allows explicitly setting values to null
  PersonalDetailsFormData copyWith({
    String? firstName,
    String? lastName,
    bool clearFirstName = false,
    bool clearLastName = false,
  }) =>
      PersonalDetailsFormData(
        firstName: clearFirstName ? null : firstName ?? this.firstName,
        lastName: clearLastName ? null : lastName ?? this.lastName,
      );
}

/// Represents address details in the form submission
class AddressFormData {
  AddressFormData({
    this.street,
    this.city,
    this.state,
    this.zipCode,
  });

  final String? street;
  final String? city;
  final String? state;
  final String? zipCode;

  /// Creates a copy of the current instance with optional parameter overrides
  /// Allows explicitly setting values to null
  AddressFormData copyWith({
    String? street,
    String? city,
    String? state,
    String? zipCode,
    bool clearStreet = false,
    bool clearCity = false,
    bool clearState = false,
    bool clearZipCode = false,
  }) =>
      AddressFormData(
        street: clearStreet ? null : street ?? this.street,
        city: clearCity ? null : city ?? this.city,
        state: clearState ? null : state ?? this.state,
        zipCode: clearZipCode ? null : zipCode ?? this.zipCode,
      );
}

/// Represents contact details in the form submission
class ContactDetailsFormData {
  ContactDetailsFormData({
    required this.email,
    required this.phoneNumber,
  });

  final String? email;
  final String? phoneNumber;

  /// Creates a copy of the current instance with optional parameter overrides
  /// Allows explicitly setting values to null
  ContactDetailsFormData copyWith({
    String? email,
    String? phoneNumber,
    bool clearEmail = false,
    bool clearPhoneNumber = false,
  }) =>
      ContactDetailsFormData(
        email: clearEmail ? null : email ?? this.email,
        phoneNumber: clearPhoneNumber ? null : phoneNumber ?? this.phoneNumber,
      );
}

/// Represents employment details in the form submission
class EmploymentDetailsFormData {
  EmploymentDetailsFormData({
    required this.employer,
    required this.jobTitle,
    required this.startDate,
    required this.endDate,
  });

  final String? employer;
  final String? jobTitle;
  final DateTime? startDate;
  final DateTime? endDate;

  /// Creates a copy of the current instance with optional parameter overrides
  /// Allows explicitly setting values to null
  EmploymentDetailsFormData copyWith({
    String? employer,
    String? jobTitle,
    DateTime? startDate,
    DateTime? endDate,
    bool clearEmployer = false,
    bool clearJobTitle = false,
    bool clearStartDate = false,
    bool clearEndDate = false,
  }) =>
      EmploymentDetailsFormData(
        employer: clearEmployer ? null : employer ?? this.employer,
        jobTitle: clearJobTitle ? null : jobTitle ?? this.jobTitle,
        startDate: clearStartDate ? null : startDate ?? this.startDate,
        endDate: clearEndDate ? null : endDate ?? this.endDate,
      );
}

# Stepper Implementation Guide

## Overview
This project implements a reusable stepper component with Vietnamese localization, clean architecture pattern, and custom styling. The stepper is designed to be used across different screens with different ViewModels for easy maintenance.

## Architecture

### 1. Base Stepper ViewModel (`stepper_view_model.dart`)
- Extends `AppViewModel` with `ChangeNotifier`
- Manages step navigation and validation
- Provides loading states and error handling
- Can be extended for specific use cases

```dart
@injectable
class StepperViewModel extends AppViewModel with ChangeNotifier {
  // Core properties
  int get currentStep => _currentStep;
  bool get isLoading => _isLoading;
  bool get canGoNext => currentStep < screens.length - 1;
  bool get canGoBack => currentStep > 0;
  bool get isLastStep => currentStep == screens.length - 1;
  
  // Virtual methods for validation - override in subclasses
  bool validateStep1() => true;
  bool validateStep2() => true;
  bool validateStep3() => true;
  bool validateStep4() => true;
}
```

### 2. Authorize Stepper Component (`authorize_stepper.dart`)
- Reusable UI component for displaying stepper
- Custom step icons with color coding:
  - **Green**: Completed steps
  - **Blue**: Current step  
  - **Gray**: Future/inactive steps
- Accepts optional `StepperViewModel` parameter

```dart
AuthorizeStepper(
  viewModel: yourViewModel, // Optional - will inject default if not provided
  activeColor: Colors.blue,
  completedColor: Colors.green,
  inactiveColor: Colors.grey,
  height: 100.h,
  showContent: false, // Set to true to show step content
)
```

### 3. Stepper Control Buttons (`stepper_control_buttons.dart`)
- Reusable button component that works with any `StepperViewModel`
- Automatically shows/hides back button based on current step
- Changes button text for last step ("Tiếp theo" → "Hoàn thành")
- Handles loading states with spinner

```dart
StepperControlButtons(
  viewModel: viewModel,
  onCompleted: () => _handleCompletion(), // Optional custom completion handler
  padding: EdgeInsets.all(20.w), // Optional custom padding
)
```

## Usage Examples

### Example 1: Basic Usage with Default ViewModel

```dart
class MyStepperScreen extends StatefulWidget {
  @override
  State<MyStepperScreen> createState() => _MyStepperScreenState();
}

class _MyStepperScreenState extends ViewState<MyStepperScreen, StepperViewModel> {
  @override
  createViewModel() => injector<StepperViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Step indicators
          AuthorizeStepper(viewModel: viewModel),
          
          // Current step content
          Expanded(child: _buildCurrentStepContent()),
          
          // Navigation buttons
          StepperControlButtons(viewModel: viewModel),
        ],
      ),
    );
  }
}
```

### Example 2: Custom ViewModel with Validation

```dart
@injectable
class AuthorizeStepperViewModel extends StepperViewModel {
  @override
  bool validateStep1() {
    // Custom validation for CCCD front image
    return hasValidFrontIdImage();
  }

  @override
  bool validateStep2() {
    // Custom validation for CCCD back image
    return hasValidBackIdImage();
  }

  @override
  void onCompletionSuccess() {
    // Navigate to success screen
    NavigationService.pushReplacementNamed('/success');
  }

  @override
  void onCompletionError(String error) {
    // Show error dialog
    DialogService.showError('Có lỗi xảy ra: $error');
  }
}
```

## Localization

### Vietnamese Language Support
All text is localized using EasyLocalization. Key files:

- `resources/languages/vi.json` - Vietnamese translations
- `lib/generated/locale_keys.g.dart` - Generated key constants

### Available Keys
```dart
LocaleKeys.button_next.tr()        // "Tiếp theo"
LocaleKeys.button_previous.tr()    // "Quay lại"  
LocaleKeys.button_complete.tr()    // "Hoàn thành"
LocaleKeys.authorizeStep_step1.tr() // "Mặt trước CCCD"
LocaleKeys.authorizeStep_step2.tr() // "Mặt sau CCCD"
LocaleKeys.authorizeStep_step3.tr() // "Chụp ảnh chân dung"
```

## Step Data Structure

```dart
class StepData {
  final String title;
  final Widget Function() screenBuilder;
  final bool isRequired;
  final IconData? icon;
}
```

## Color Customization

The stepper supports custom colors for different states:

```dart
AuthorizeStepper(
  activeColor: Colors.blue,      // Current step
  completedColor: Colors.green,  // Completed steps
  inactiveColor: Colors.grey,    // Future steps
)
```

## Dependency Injection

All ViewModels are registered with Injectable:

```dart
@injectable
class StepperViewModel extends AppViewModel with ChangeNotifier {
  // Implementation
}

// Usage
final viewModel = injector<StepperViewModel>();
```

## Best Practices

1. **Separation of Concerns**: Keep stepper UI separate from business logic
2. **Validation**: Override validation methods in specific ViewModels
3. **Error Handling**: Use the built-in error handling callbacks
4. **Loading States**: Leverage the built-in loading management
5. **Localization**: Always use LocaleKeys for text content

## Integration Steps

1. Import required files
2. Create or use existing ViewModel
3. Add stepper component to your screen
4. Add control buttons
5. Implement step content rendering
6. Handle completion callback

## Files Structure

```
lib/
├── core/ui/general_widget/stf_widget/
│   ├── authorize_stepper.dart          # Main stepper component
│   └── stepper_control_buttons.dart    # Navigation buttons
├── module/startup/authorizeCitizenID/
│   ├── app/viewModel/
│   │   ├── stepper_view_model.dart           # Base ViewModel
│   │   └── authorize_stepper_view_model.dart # Specific implementation
│   ├── app/ui/AuthorizeStepperScreen/
│   │   └── screen/authorize_stepper_screen.dart # Example usage
│   └── data/
│       └── step.dart                         # Step data model
└── resources/languages/
    └── vi.json                              # Vietnamese translations
```

This implementation provides a flexible, maintainable stepper system that can be easily reused across different parts of the application while maintaining clean architecture principles.

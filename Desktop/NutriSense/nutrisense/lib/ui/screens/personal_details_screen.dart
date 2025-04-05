import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({super.key});

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _dateOfBirth;
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  final _targetWeightController = TextEditingController();
  String? _selectedGender;
  String? _selectedActivityLevel;

  final List<String> _genders = [
    'Male',
    'Female',
    'Other',
    'Prefer not to say',
  ];
  final List<String> _activityLevels = [
    'Sedentary (little or no exercise)',
    'Light (exercise 1-3 times/week)',
    'Moderate (exercise 3-5 times/week)',
    'Active (exercise 6-7 times/week)',
    'Very Active (intense exercise 6-7 times/week)',
  ];

  @override
  void dispose() {
    _weightController.dispose();
    _heightController.dispose();
    _targetWeightController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate:
          _dateOfBirth ??
          DateTime.now().subtract(const Duration(days: 365 * 20)),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _dateOfBirth) {
      setState(() {
        _dateOfBirth = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personal Details')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Let us get to know you better',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),

                // Date of Birth
                const Text(
                  'Date of Birth',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                InkWell(
                  onTap: () => _selectDate(context),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _dateOfBirth == null
                              ? 'Select Date'
                              : DateFormat(
                                'MMMM d, yyyy',
                              ).format(_dateOfBirth!),
                          style: TextStyle(
                            color:
                                _dateOfBirth == null
                                    ? Colors.grey
                                    : Colors.black,
                          ),
                        ),
                        const Icon(Icons.calendar_today),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Current Weight
                TextFormField(
                  controller: _weightController,
                  decoration: const InputDecoration(
                    labelText: 'Current Weight (kg)',
                    border: OutlineInputBorder(),
                    suffixText: 'kg',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your weight';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Height
                TextFormField(
                  controller: _heightController,
                  decoration: const InputDecoration(
                    labelText: 'Height (cm)',
                    border: OutlineInputBorder(),
                    suffixText: 'cm',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your height';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Gender Dropdown
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(),
                  ),
                  value: _selectedGender,
                  items:
                      _genders.map((gender) {
                        return DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        );
                      }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your gender';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Target Weight
                TextFormField(
                  controller: _targetWeightController,
                  decoration: const InputDecoration(
                    labelText: 'Target Weight (kg)',
                    border: OutlineInputBorder(),
                    suffixText: 'kg',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your target weight';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Activity Level Dropdown
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Activity Level',
                    border: OutlineInputBorder(),
                  ),
                  value: _selectedActivityLevel,
                  items:
                      _activityLevels.map((level) {
                        return DropdownMenuItem(
                          value: level,
                          child: Text(level),
                        );
                      }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedActivityLevel = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your activity level';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),

                // Save Progress Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate() &&
                          _dateOfBirth != null) {
                        // In a real app, you would save the user's personal details here
                        // For now, proceed to the next screen
                        Navigator.pushNamed(context, '/health-info');
                      } else if (_dateOfBirth == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select your date of birth'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text(
                      'Save & Continue',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HealthInfoScreen extends StatefulWidget {
  const HealthInfoScreen({super.key});

  @override
  State<HealthInfoScreen> createState() => _HealthInfoScreenState();
}

class _HealthInfoScreenState extends State<HealthInfoScreen> {
  final _formKey = GlobalKey<FormState>();

  // Allergies
  bool _hasPeanutAllergy = false;
  bool _hasGlutenAllergy = false;
  bool _hasDairyAllergy = false;
  final _otherAllergyController = TextEditingController();

  // Dietary Restrictions
  bool _isVegetarian = false;
  bool _isVegan = false;
  bool _isHalal = false;
  bool _isKeto = false;
  final _otherDietaryRestrictionController = TextEditingController();

  // Medical Conditions
  bool _hasDiabetes = false;
  bool _hasPCOS = false;
  bool _hasLactoseIntolerance = false;
  bool _hasHighCholesterol = false;
  bool _hasIBS = false;
  final _otherMedicalConditionController = TextEditingController();

  @override
  void dispose() {
    _otherAllergyController.dispose();
    _otherDietaryRestrictionController.dispose();
    _otherMedicalConditionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Health Information')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Health and Medical Information',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),

                // Allergies Section
                const Text(
                  'Do you have any of the following allergies?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 16),

                CheckboxListTile(
                  title: const Text('Peanuts'),
                  value: _hasPeanutAllergy,
                  onChanged: (value) {
                    setState(() {
                      _hasPeanutAllergy = value!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  title: const Text('Gluten'),
                  value: _hasGlutenAllergy,
                  onChanged: (value) {
                    setState(() {
                      _hasGlutenAllergy = value!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  title: const Text('Dairy'),
                  value: _hasDairyAllergy,
                  onChanged: (value) {
                    setState(() {
                      _hasDairyAllergy = value!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),

                // Other Allergies
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller: _otherAllergyController,
                    decoration: const InputDecoration(
                      labelText: 'Other Allergies (if any)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Dietary Restrictions Section
                const Text(
                  'Do you have any of the following dietary restrictions?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 16),

                CheckboxListTile(
                  title: const Text('Vegetarian'),
                  value: _isVegetarian,
                  onChanged: (value) {
                    setState(() {
                      _isVegetarian = value!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  title: const Text('Vegan'),
                  value: _isVegan,
                  onChanged: (value) {
                    setState(() {
                      _isVegan = value!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  title: const Text('Halal'),
                  value: _isHalal,
                  onChanged: (value) {
                    setState(() {
                      _isHalal = value!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  title: const Text('Keto'),
                  value: _isKeto,
                  onChanged: (value) {
                    setState(() {
                      _isKeto = value!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),

                // Other Dietary Restrictions
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller: _otherDietaryRestrictionController,
                    decoration: const InputDecoration(
                      labelText: 'Other Dietary Restrictions (if any)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Medical Conditions Section
                const Text(
                  'Do you have any of the following medical conditions?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 16),

                CheckboxListTile(
                  title: const Text('Diabetes'),
                  value: _hasDiabetes,
                  onChanged: (value) {
                    setState(() {
                      _hasDiabetes = value!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  title: const Text('PCOS'),
                  value: _hasPCOS,
                  onChanged: (value) {
                    setState(() {
                      _hasPCOS = value!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  title: const Text('Lactose Intolerance'),
                  value: _hasLactoseIntolerance,
                  onChanged: (value) {
                    setState(() {
                      _hasLactoseIntolerance = value!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  title: const Text('High Cholesterol'),
                  value: _hasHighCholesterol,
                  onChanged: (value) {
                    setState(() {
                      _hasHighCholesterol = value!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  title: const Text('IBS (Irritable Bowel Syndrome)'),
                  value: _hasIBS,
                  onChanged: (value) {
                    setState(() {
                      _hasIBS = value!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),

                // Other Medical Conditions
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller: _otherMedicalConditionController,
                    decoration: const InputDecoration(
                      labelText: 'Other Medical Conditions (if any)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Save Progress Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // In a real app, you would save the user's health information here
                      // For now, proceed to the next screen
                      Navigator.pushNamed(context, '/goals-preferences');
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

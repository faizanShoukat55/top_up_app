import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/beneficiary.dart';
import '../../../blocs/beneficiary/beneficiary_cubit.dart';

class AddBeneficiaryBottomSheet extends StatefulWidget {
  const AddBeneficiaryBottomSheet({super.key,});



  @override
  State<AddBeneficiaryBottomSheet> createState() => _AddBeneficiaryBottomSheetState();
}

class _AddBeneficiaryBottomSheetState extends State<AddBeneficiaryBottomSheet> {
  final _formKey = GlobalKey<FormState>();
   final TextEditingController _phoneController=TextEditingController();
   final TextEditingController _nicknameController=TextEditingController();


  @override
  void dispose() {
    _phoneController.dispose();
    _nicknameController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final beneficiary = Beneficiary(
        id: "1",
        phoneNumber: "+971${_phoneController.text}",
        nickname: _nicknameController.text,
        createdAt: DateTime.now().toIso8601String(),
      );

      context.read<BeneficiaryCubit>().addBeneficiary(beneficiary);
      Navigator.of(context).pop();
    }
  }

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number is required";
    }
    if (value.length != 9) {
      return "Phone number must be 9 digits";
    }
    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return "Phone number must be numeric";
    }
    return null;
  }

  String? _validateNickname(String? value) {
    if (value == null || value.isEmpty) {
      return "Nickname is required";
    }
    if (value.length > 20) {
      return "Nickname cannot exceed 20 characters";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Add Beneficiary",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Phone Number Field
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.number,
              maxLength: 9,
              validator: _validatePhoneNumber,
              decoration: InputDecoration(
                prefixText: "+971 ",
                labelText: "Phone Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                counterText: "",
              ),
            ),
            const SizedBox(height: 16),

            // Nickname Field
            TextFormField(
              controller: _nicknameController,
              maxLength: 20,
              validator: _validateNickname,
              decoration: InputDecoration(
                labelText: "Nickname",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                counterText: "",
              ),
            ),
            const SizedBox(height: 20),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Cancel"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _submit,
                  child: const Text("Add"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

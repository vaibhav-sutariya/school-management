import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/extensions/responsive_extensions.dart';
import '../../../../core/utils/show_snackbar.dart';
import '../../../../core/widgets/app_app_bar.dart';
import '../../../../core/widgets/app_date_picker.dart';
import '../../../../core/widgets/app_dropdown_field.dart';
import '../../../../core/widgets/app_outlined_button.dart';
import '../../../../core/widgets/app_primary_button.dart';
import '../../../../core/widgets/app_text_field.dart';

/// Leave type enum
enum LeaveType {
  sickLeave('SICK LEAVE(SL)'),
  social('SOCIAL(SL)'),
  otherLeave('OTHER LEAVE(OL)');

  final String label;
  const LeaveType(this.label);
}

/// Add leave page with form validation
/// Features:
/// - Leave type dropdown
/// - From/To date pickers
/// - Reason text field
/// - Form validation
/// - High performance with minimal rebuilds
@RoutePage()
class AddLeavePage extends StatefulWidget {
  const AddLeavePage({super.key});

  @override
  State<AddLeavePage> createState() => _AddLeavePageState();
}

class _AddLeavePageState extends State<AddLeavePage> {
  final _formKey = GlobalKey<FormState>();
  final _reasonController = TextEditingController();

  LeaveType? _selectedLeaveType;
  DateTime? _fromDate;
  DateTime? _toDate;

  // Error messages for date pickers
  String? _fromDateError;
  String? _toDateError;

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: const AppAppBar(title: 'Apply Leave'),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(context.scale(16)),
          children: [
            // Leave Type Dropdown
            AppDropdownField<LeaveType>(
              label: 'Leave Type',
              value: _selectedLeaveType,
              items: LeaveType.values,
              itemLabel: (type) => type.label,
              hint: 'Select Leave Type',
              onChanged: (value) {
                setState(() {
                  _selectedLeaveType = value;
                });
              },
              validator: (value) {
                if (value == null) {
                  return 'Please select leave type';
                }
                return null;
              },
            ),

            SizedBox(height: context.scaleHeight(20)),

            // From Date
            AppDatePickerField(
              label: 'From',
              selectedDate: _fromDate,
              onDateSelected: (date) {
                setState(() {
                  _fromDate = date;
                  _fromDateError = null; // Clear error on selection
                  // Reset to date if it's before from date
                  if (_toDate != null &&
                      date != null &&
                      _toDate!.isBefore(date)) {
                    _toDate = null;
                  }
                });
              },
              firstDate: DateTime.now(),
              errorText: _fromDateError,
            ),

            SizedBox(height: context.scaleHeight(20)),

            // To Date
            AppDatePickerField(
              label: 'To',
              selectedDate: _toDate,
              onDateSelected: (date) {
                setState(() {
                  _toDate = date;
                  _toDateError = null; // Clear error on selection
                });
              },
              firstDate: _fromDate ?? DateTime.now(),
              errorText: _toDateError,
            ),

            SizedBox(height: context.scaleHeight(20)),

            // Reason Field
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: context.scaleHeight(8)),
                  child: RichText(
                    text: TextSpan(
                      text: 'Reason',
                      style: TextStyle(
                        fontSize: context.scaleFont(14),
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                      children: const [
                        TextSpan(
                          text: ' *',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ),
                AppTextField(
                  controller: _reasonController,
                  hintText: 'Write your comment',
                  maxLines: 5,
                  minLines: 5,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter reason for leave';
                    }
                    if (value.trim().length < 10) {
                      return 'Reason must be at least 10 characters';
                    }
                    return null;
                  },
                ),
              ],
            ),

            SizedBox(height: context.scaleHeight(24)),

            // Apply Button
            AppPrimaryButton(
              text: 'Apply Leave',
              onPressed: _handleApplyLeave,
              height: 50,
              borderRadius: 16,
            ),

            SizedBox(height: context.scaleHeight(12)),

            // Cancel Button
            AppOutlinedButton(
              text: 'Cancel Request',
              onPressed: () {
                context.router.pop();
              },
              height: 50,
              borderRadius: 16,
            ),

            SizedBox(height: context.scaleHeight(16)),
          ],
        ),
      ),
    );
  }

  void _handleApplyLeave() {
    // Clear previous errors
    setState(() {
      _fromDateError = null;
      _toDateError = null;
    });

    // Validate date picker fields manually
    bool hasDateErrors = false;

    if (_fromDate == null) {
      setState(() {
        _fromDateError = 'Please select from date';
      });
      hasDateErrors = true;
    }

    if (_toDate == null) {
      setState(() {
        _toDateError = 'Please select to date';
      });
      hasDateErrors = true;
    } else if (_fromDate != null && _toDate!.isBefore(_fromDate!)) {
      setState(() {
        _toDateError = 'To date must be after from date';
      });
      hasDateErrors = true;
    }

    // Validate form
    final isFormValid = _formKey.currentState?.validate() ?? false;

    if (hasDateErrors || !isFormValid) {
      return;
    }
    context.router.pop();

    // Calculate number of days
    final days = _toDate!.difference(_fromDate!).inDays + 1;

    // Show success message using flushbar
    showFlushbar(
      context: context,
      message: 'Leave application submitted for $days day(s)',
      isError: false,
    );
  }
}

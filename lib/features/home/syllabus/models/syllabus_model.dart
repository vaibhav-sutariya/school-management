import 'package:flutter/material.dart';

class SyllabusModel {
  final String id;
  final DateTime date;
  final String subject;
  final String type;
  final Color color;

  const SyllabusModel({
    required this.id,
    required this.date,
    required this.subject,
    required this.type,
    required this.color,
  });

  // Mock data generator
  static List<SyllabusModel> getMockData() {
    return [
      SyllabusModel(
        id: '1',
        date: DateTime(2025, 12, 24),
        subject: 'All Subjects',
        type: 'PT-2 SYLLABUS & PAPER STYLE',
        color: const Color(0xFF26C6DA),
      ),
      SyllabusModel(
        id: '2',
        date: DateTime(2025, 9, 30),
        subject: 'All Subjects',
        type: 'TERM - 1 SYLLABUS & DRAFT STYLE',
        color: const Color(0xFF5C6BC0),
      ),
      SyllabusModel(
        id: '3',
        date: DateTime(2025, 7, 1),
        subject: 'Science Olympiad',
        type: 'NSO QUESTION & PAPER STYLE',
        color: const Color(0xFF26A69A),
      ),
      SyllabusModel(
        id: '4',
        date: DateTime(2025, 6, 21),
        subject: 'Academic Plan',
        type: 'YEARLY SPLIT SYLLABUS',
        color: const Color(0xFFFF9800),
      ),
      SyllabusModel(
        id: '5',
        date: DateTime(2025, 5, 15),
        subject: 'Pre-Session',
        type: 'FOUNDATION SYLLABUS',
        color: const Color(0xFFEC407A),
      ),
    ];
  }
}

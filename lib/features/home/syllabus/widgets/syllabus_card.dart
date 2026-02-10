import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/helpers/extensions/responsive_extensions.dart';
import '../../../../core/routes/app_router.gr.dart';
import '../models/syllabus_model.dart';

class SyllabusCard extends StatelessWidget {
  final SyllabusModel syllabus;

  const SyllabusCard({super.key, required this.syllabus});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(
          SyllabusPdfViewerRoute(pdfUrl: syllabus.pdfUrl, title: syllabus.type),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: context.scaleHeight(12)),
        padding: EdgeInsets.all(context.scale(16)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(context.scale(16)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Colored Icon
            Container(
              width: context.scale(45),
              height: context.scale(45),
              decoration: BoxDecoration(
                color: syllabus.color,
                borderRadius: BorderRadius.circular(context.scale(12)),
              ),
              child: Icon(
                Icons.description_outlined,
                color: Colors.white,
                size: context.scale(24),
              ),
            ),

            SizedBox(width: context.scale(16)),

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date
                  Text(
                    DateFormat('dd/MMM/yyyy').format(syllabus.date),
                    style: TextStyle(
                      fontSize: context.scaleFont(14),
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),

                  SizedBox(height: context.scaleHeight(2)),

                  // Subject
                  Text(
                    'Subject : ${syllabus.subject}',
                    style: TextStyle(
                      fontSize: context.scaleFont(12),
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),

                  SizedBox(height: context.scaleHeight(2)),

                  // Type
                  Text(
                    'Type : ${syllabus.type}',
                    style: TextStyle(
                      fontSize: context.scaleFont(12),
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/extensions/responsive_extensions.dart';
import '../cubit/home_search_cubit.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.scale(20)),
      child: Container(
        height: context.scaleHeight(35), // Reduced from 50
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(
            0.15,
          ), // Slightly more visible for clarity
          borderRadius: BorderRadius.circular(
            context.scale(12),
          ), // Reduced radius
          border: Border.all(color: Colors.white.withOpacity(0.15), width: 1),
        ),
        child: Row(
          children: [
            SizedBox(width: context.scale(16)),
            Expanded(
              child: TextField(
                onChanged: (value) {
                  context.read<HomeSearchCubit>().search(value);
                },
                style: TextStyle(
                  color: Colors.white,
                  fontSize: context.scaleFont(14),
                  letterSpacing: 0.3,
                ),
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  hintText: 'Search here...',
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: context.scaleFont(13),
                    letterSpacing: 0.3,
                  ),
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  // Explicitly remove all borders to override theme
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
                cursorColor: Colors.white,
              ),
            ),
            Container(
              margin: EdgeInsets.all(context.scale(6)),
              padding: EdgeInsets.all(context.scale(6)), // Reduced padding
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(context.scale(8)),
              ),
              child: Icon(
                Icons.search,
                color: Colors.white,
                size: context.scale(18), // Reduced size
              ),
            ),
          ],
        ),
      ),
    );
  }
}

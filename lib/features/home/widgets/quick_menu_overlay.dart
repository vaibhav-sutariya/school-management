import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/extensions/responsive_extensions.dart';
import '../cubit/home_search_cubit.dart';
import '../cubit/home_search_state.dart';
import 'menu_section_card.dart';

class QuickMenuOverlay extends StatelessWidget {
  const QuickMenuOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeSearchCubit, HomeSearchState>(
      // Only rebuild when filteredSections or isSearching actually changes
      buildWhen: (previous, current) =>
          previous.filteredSections != current.filteredSections ||
          previous.isSearching != current.isSearching,
      builder: (context, state) {
        final sections = state.filteredSections;

        if (state.isSearching && sections.isEmpty) {
          return Center(
            child: Text(
              'No items found',
              style: TextStyle(
                color: Colors.grey,
                fontSize: context.scaleFont(14),
              ),
            ),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16),
          physics: const BouncingScrollPhysics(),
          // Add bottom padding for better scroll experience
          itemCount: sections.length + 1,
          itemBuilder: (context, index) {
            // Last item is just spacing
            if (index == sections.length) {
              return SizedBox(height: context.scaleHeight(100));
            }

            final section = sections[index];
            return Padding(
              padding: EdgeInsets.only(bottom: context.scaleHeight(5)),
              child: MenuSectionCard(
                key: ValueKey('${section.title}_${section.items.length}'),
                title: section.title,
                items: section.items,
              ),
            );
          },
        );
      },
    );
  }
}

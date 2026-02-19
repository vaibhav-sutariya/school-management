import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/extensions/responsive_extensions.dart';
import '../../../core/routes/app_router.gr.dart';
import '../../../core/widgets/app_loader.dart';
import '../../../cubit/theme_cubit.dart';
import '../../home/home_screen/widgets/home_header.dart';
import 'bloc/profile_bloc.dart';
import 'widgets/profile_menu_item.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(),
      child: Scaffold(
        body: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is LogoutSuccess) {
              // Navigate to login or initial route
              // context.router.replace(const LoginRoute());
            }
            if (state is ProfileError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                // Blue Header Background with Bottom Radius
                Container(
                  height: context.scaleHeight(185),
                  decoration: BoxDecoration(
                    color: context.colors.primary,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(context.scale(20)),
                      bottomRight: Radius.circular(context.scale(20)),
                    ),
                  ),
                ),

                // Content
                SafeArea(
                  bottom: false,
                  child: Column(
                    children: [
                      SizedBox(height: context.scaleHeight(5)),
                      // Header
                      const HomeHeader(),
                      SizedBox(height: context.scaleHeight(20)),

                      // Menu Items
                      Expanded(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.only(
                            bottom: context.scaleHeight(20),
                            left: context.scale(20),
                            right: context.scale(20),
                          ),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: context.colors.surface,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: context.colors.surface300
                                          .withValues(alpha: 0.3),
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    ProfileMenuItem(
                                      icon: Icons.person_outline_rounded,
                                      text: 'About Me',
                                      onTap: () {
                                        context.router.push(
                                          const StudentProfileRoute(),
                                        );
                                      },
                                    ),
                                    _buildDivider(context),
                                    ProfileMenuItem(
                                      icon: Icons.calendar_today_rounded,
                                      text: 'Select Academic Year',
                                      onTap: () {},
                                    ),
                                    _buildDivider(context),
                                    ProfileMenuItem(
                                      icon: Icons.lock_outline_rounded,
                                      text: 'Reset Password',
                                      onTap: () {},
                                    ),
                                    _buildDivider(context),
                                    ProfileMenuItem(
                                      icon: Icons.star_outline_rounded,
                                      text: 'Rate our App',
                                      onTap: () {},
                                    ),
                                    _buildDivider(context),
                                    ProfileMenuItem(
                                      icon: Icons.share_outlined,
                                      text: 'Share',
                                      onTap: () {},
                                    ),
                                    _buildDivider(context),
                                    ProfileMenuItem(
                                      icon: Icons.info_outline_rounded,
                                      text: 'About App',
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: context.scaleHeight(16)),
                              Container(
                                decoration: BoxDecoration(
                                  color: context.colors.surface,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: context.colors.surface300
                                          .withValues(alpha: 0.3),
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: ProfileMenuItem(
                                  icon: Icons.logout_rounded,
                                  text: 'Logout',
                                  isDestructive: true,
                                  onTap: () {
                                    context.read<ProfileBloc>().add(
                                      LogoutRequested(),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: context.scaleHeight(24)),
                              Text(
                                'App Version : 2.0.28',
                                style: context.textTheme.bodyMedium?.copyWith(
                                  color: context.colors.surface500,
                                ),
                              ),
                              SizedBox(height: context.scaleHeight(40)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                if (state is ProfileLoading)
                  Container(
                    color: Colors.black.withValues(alpha: 0.3),
                    child: const Center(child: AppLoader()),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      color: context.colors.surface300.withValues(alpha: 0.3),
      indent: context.scale(52), // Align with text start (icon size + padding)
      endIndent: context.scale(16),
    );
  }
}

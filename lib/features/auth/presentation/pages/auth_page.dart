import 'package:charity_app/core/presentation/widgets/default_button_widget.dart';
import 'package:charity_app/features/auth/presentation/bloc/user_bloc.dart';
import 'package:charity_app/features/auth/presentation/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  static const String path = '/auth';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<UserBloc, UserState>(
            listener: (context, state) {
              if (state.status == UserStatus.error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message ?? 'An error occurred')),
                );
              }
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Text(
                            'Charity',
                            style: Theme.of(
                              context,
                            ).textTheme.displayLarge?.copyWith(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(height: 40),
                          Text(
                            '''Small steps, big impact. Let's make a difference together! ''',
                            style: Theme.of(
                              context,
                            ).textTheme.headlineMedium?.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Expanded(
                            child: SvgPicture.asset('assets/images/hand.svg'),
                          ),
                          SizedBox(height: 40),
                          Text(
                            '''Be a hero in someone's story. Join now''',
                            style: Theme.of(context).textTheme.headlineSmall,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    DefaultButtonWidget(
                      text: 'Sign In with Google',
                      onPressed: () {},
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

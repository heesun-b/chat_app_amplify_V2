import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:chat/constants.dart';
import 'package:chat/providers/user_provider.dart';
import 'package:chat/screens/auth/signin_or_signup_screen.dart';
import 'package:chat/screens/messages/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),
            Image.asset("assets/images/welcome_image.png"),
            const Spacer(flex: 3),
            Text(
              "Welcome to our freedom \nmessaging app",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text(
              "Freedom talk any person of your \nmother language.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .color!
                    .withOpacity(0.64),
              ),
            ),
            const Spacer(flex: 3),
            FutureBuilder<AuthUser?>(
              // future : 비동기 작업을 나타내는 Future 객체
              future: context.read<UserProvider>().checkedLogedInUser(),
              // snapshot : future의 결과
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.data != null) {
                    Future.delayed(
                      const Duration(seconds: 1),
                      () {
                        // WidgetsBinding : 애플리케이션의 생명주기와 관련된 이벤트를 관리하고, 위젯 트리의 레이아웃과 렌더링을 조정하는 클래스
                        // addPostFrameCallback : 위젯 트리의 빌드와 렌더링이 완료된 후에 작업을 수행
                        // (_) : 콜백 함수는 인자를 필요로하지 않는다는 의미
                        WidgetsBinding.instance.addPostFrameCallback(
                          (_) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MessagesScreen(),
                              ),
                              (route) => false,
                            );
                          },
                        );
                      },
                    );
                  } else {
                    return const SkipButton();
                  }
                }
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: TextButton(
          onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SigninOrSignupScreen(),
                ),
              ),
          child: Row(
            children: [
              Text(
                "Skip",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .color!
                          .withOpacity(0.8),
                    ),
              ),
              const SizedBox(width: defaultPadding / 4),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .color!
                    .withOpacity(0.8),
              )
            ],
          )),
    );
  }
}

import 'package:be_my_valentine/core/constants/strings/image.dart';
import 'package:be_my_valentine/extension/date.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final ThemeData theme = Theme.of(context);
    final String month = DateTime.now().toMonth();


    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // const HeroSection(),
            const SizedBox(height: 12.0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Months",
                      style: theme.textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 8.0),
                            width: 125,
                            child: Stack(
                              children: [
                                Center(
                                  child: Text(month,
                                    style: theme.textTheme.labelLarge!.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: 0.3,
                                  child: Image.asset(PngImages.janCover,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

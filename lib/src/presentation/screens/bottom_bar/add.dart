import 'package:be_my_valentine/core/constants/strings/image.dart';
import 'package:be_my_valentine/src/presentation/widgets/buttons/primary_button.dart';
import 'package:be_my_valentine/src/presentation/widgets/fields/text_field.dart';
import 'package:flutter/material.dart';

class AddPhotoScreen extends StatelessWidget {
  static String route = "/addPhoto";
  const AddPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController title = TextEditingController();
    final TextEditingController description = TextEditingController();
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildPhotoDetails(title, description, size),
              PrimaryButton(
                label: "Add",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoDetails(TextEditingController title,
      TextEditingController description, Size size) {

    return Column(
      children: [
        Container(
          color: Colors.green,
          height: size.height * 0.5,
        ),
        // Image.asset(PngImages.janCover),
        PrimaryTextField(
          controller: title,
          label: "Title",
        ),
        const SizedBox(height: 12.0),
        PrimaryTextField(
          controller: description,
          label: "Description",
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_chat/view/common_widget/custom_text.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewWidget extends StatelessWidget {
  const ImageViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Image Preview"),
      ),
      body: Center(
        child: PhotoView(
            enableRotation: true,
            wantKeepAlive: true,
            errorBuilder: (context, object, stackTrace) {
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.broken_image_outlined,
                    color: Colors.white,
                    size: 100,
                  ),
                  SizedBox(height: 50),
                  CustomTextWidget(text: "Error Image", fontColor: Colors.white, fontSize: 20)
                ],
              );
            },
            imageProvider: const NetworkImage("https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg")),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:images_app/store/images_store.dart';

final imageStore = ImagesStore();

class ImagesGridView extends StatelessWidget {
  const ImagesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pixabay Images",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: imageStore.keyContrl,
              textInputAction: TextInputAction.search,
              decoration: const InputDecoration(
                hintText: "Search Photos",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onFieldSubmitted: (value) => imageStore.getImages(keyword: value),
            ),
            const SizedBox(
              height: 32,
            ),
            Observer(
              builder: (_) => imageStore.dataLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : imageStore.keyContrl.text.isEmpty
                      ? const Center(
                          child: Text("Search your images"),
                        )
                      : imageStore.images.isEmpty
                          ? const Center(
                              child: Text("No Images Found"),
                            )
                          : Expanded(
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                ),
                                itemCount: imageStore.images.length,
                                itemBuilder: (context, index) {
                                  final img = imageStore.images[index];
                                  return GestureDetector(
                                    onTap: () => imageStore.viewImage(
                                      url: img.largeImageURL!,
                                      context: context,
                                    ),
                                    child: Card(
                                      child: Image.network(
                                        img.previewURL!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
            ),
          ],
        ),
      ),
    );
  }
}

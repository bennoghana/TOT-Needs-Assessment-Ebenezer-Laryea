import 'package:flutter/material.dart';
import 'package:recipe_app/controller/bookmark_controller.dart';
import 'package:recipe_app/model/recipe_model.dart';
import 'package:recipe_app/service/bookmark_recipe.dart';

//TODO: GET ALL BOOKMARKED RECIPES
//TODO: DELETE RECIPE

class BookmarkView extends StatefulWidget {
  BookmarkView({Key? key}) : super(key: key);

  @override
  State<BookmarkView> createState() => _BookmarkViewState();
}

class _BookmarkViewState extends State<BookmarkView> {
  final BookmarkController bookmarkController = BookmarkController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmark'),
      ),
      body: FutureBuilder(
        future: bookmarkController.getBookmarkRecipes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting &&
              snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          }

          List<RecipeModel> recipeModels = snapshot.data as List<RecipeModel>;
          return ListView.builder(
              itemCount: recipeModels.length,
              itemBuilder: (BuildContext context, int index) {
                RecipeModel recipeModel = recipeModels[index];

                return ListTile(
                  leading: Image.network(
                    recipeModel.image,
                    width: 150,
                    height: 150,
                  ),
                  title: Text(recipeModel.title),
                  subtitle: Text(recipeModel.category),
                  trailing: Icon(Icons.delete),
                  onTap: () {
                    setState(() {
                      bookmarkController.removeBookmark(recipeModel.id!);
                    });
                  },
                );
              });
        },
      ),
    );
  }
}

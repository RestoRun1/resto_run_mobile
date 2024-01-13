import 'package:flutter/material.dart';
import 'package:resto_run_mobile/Color/AppColors.dart';

class HomeSearchBar extends StatefulWidget {
  const HomeSearchBar({super.key});

  // ignore: empty_constructor_bodies
  @override
  State<HomeSearchBar> createState() => _HomeSearchBar();
}

class _HomeSearchBar extends State<HomeSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SearchAnchor(
        

        builder: (BuildContext context, SearchController controller) {
          return SearchBar(
            controller: controller,
            padding: const MaterialStatePropertyAll<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 16.0)),
            onTap: () {
              controller.openView();
            },
            onChanged: (_) {
              controller.openView();
            },
            leading: const Icon(Icons.search, color: AppColors.white,),
            backgroundColor: MaterialStateColor.resolveWith(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return AppColors.searchBarGrey;
                  }
                  // Default color
                  return AppColors.searchBarGrey;
                },
             ),

            trailing: [Icon(Icons.filter, color: AppColors.lightRed,)],

          );
        },
        suggestionsBuilder:
            (BuildContext context, SearchController controller) {
          return List<ListTile>.generate(5, (int index) {
            final String item = 'item $index';
            return ListTile(
              title: Text(item),
              onTap: () {
                setState(() {
                  controller.closeView(item);
                });
              },
            );
          });
        },
      ),
    );
  } //build
}

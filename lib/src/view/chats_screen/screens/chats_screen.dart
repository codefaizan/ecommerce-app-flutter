import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:turtle/src/utils/base/widget_utils.dart';
import 'package:turtle/src/view/chats_screen/providers/chats_provider.dart';
import 'package:turtle/src/view/chats_screen/widgets/chat_tile_widget.dart';
import '../../../utils/base/resizer/fetch_pixels.dart';
import '../../../utils/base/resources/resources.dart';
import '../../../utils/base/resources/text_style.dart';
import '../../../utils/routing/route_names.dart';

class ChatsScreen extends StatelessWidget {
  final TextEditingController searchbarController = TextEditingController();
  ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isSearching = false;
    return Consumer<ChatsProvider>(
      builder: (context, provider, child) {
        return Scaffold(

          appBar: AppBar(
            title: Text(R.texts.chat, style: AppFontStyles.styleRegularPoppins22.copyWith(fontWeight: FontWeight.bold),),
            actions: [InkWell(onTap: ()=>Navigator.pushNamed(context, RouteNames.notificationsScreen),child: getAssetImage(R.images.notificationIcon)),],
          ),

          body: Column(
            children: [
              SearchBar(
                hintText: R.texts.search,
                leading: const Icon(Icons.search),
                elevation: const MaterialStatePropertyAll(0.3),
                backgroundColor: MaterialStatePropertyAll(R.color.bgColor),
                side: MaterialStatePropertyAll(
                  BorderSide(color: R.color.blackColor),
                ),
                onChanged: (searchText) {
                  isSearching = searchText.isNotEmpty ? true : false;
                  provider.search(searchText);
                },
              ),
              getVerSpace(FetchPixels.getPixelHeight(10),),
              Expanded(
                child: ListView.separated(
                  itemCount: (!isSearching)
                      ? provider.allUsers.length
                      : provider.filteredUsers.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                      endActionPane: ActionPane(
                          extentRatio: 0.2,
                          motion: const BehindMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) => provider.deleteChat(index),
                              foregroundColor: R.color.blackColor,
                              icon: Icons.delete_outline_outlined,
                              label: 'Delete',
                            )
                          ]),
                      child: ChatTileWidget(
                          chat: (provider.filteredUsers.isEmpty)
                              ? provider.allUsers[index]
                              : provider.filteredUsers[index]),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: FetchPixels.getPixelHeight(5));
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

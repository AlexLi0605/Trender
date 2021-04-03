import 'package:flutter/material.dart';

import 'package:trender/assets/image_constants.dart';
import 'package:trender/assets/page_constants.dart';
import 'package:trender/data/model/menu.dart';

class GetMenuItemsUseCase {
  List<Menu> call() {
    return <Menu>[
      Menu(title: google, icon: Icons.person, image: profileImage),
      Menu(title: youtube, icon: Icons.shopping_cart, image: shoppingImage),
      Menu(title: twitter, icon: Icons.send, image: loginImage),
      Menu(title: instagram, icon: Icons.timeline, image: timelineImage),
    ];
  }
}

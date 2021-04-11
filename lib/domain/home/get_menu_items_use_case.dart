import 'package:trender/assets/image_constants.dart';
import 'package:trender/assets/page_constants.dart';
import 'package:trender/data/model/menu.dart';

class GetMenuItemsUseCase {
  List<Menu> call() {
    return <Menu>[
      Menu(title: google, iconPath: icGoogle, image: profileImage),
      Menu(title: youtube, iconPath: icYoutube, image: shoppingImage),
      Menu(title: twitter, iconPath: icTwitter, image: loginImage),
      Menu(title: instagram, iconPath: icInstagram, image: timelineImage),
    ];
  }
}

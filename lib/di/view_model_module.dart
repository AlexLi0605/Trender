import 'package:trender/navigation_manager.dart';
import 'package:trender/ui/home/home_view_model.dart';

class ViewModelModule {
  final NavigationManager _navigationManager;

  const ViewModelModule(
    this._navigationManager,
  );

  HomeViewModel provideHomeViewModel() => HomeViewModel(
        _navigationManager,
      );
}

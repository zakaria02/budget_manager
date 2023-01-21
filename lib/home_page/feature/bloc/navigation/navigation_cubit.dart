import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_state.dart';

class HomePageNavCubit extends Cubit<HomePageNavState> {
  HomePageNavCubit() : super(const HomePageNavState(NavbarItem.summary, 0));

  void setPage(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.summary:
        emit(const HomePageNavState(NavbarItem.summary, 0));
        break;
      case NavbarItem.details:
        emit(const HomePageNavState(NavbarItem.details, 1));
        break;
    }
  }
}

enum NavbarItem { summary, details }

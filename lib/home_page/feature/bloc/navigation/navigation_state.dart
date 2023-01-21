part of 'navigation_cubit.dart';

class HomePageNavState extends Equatable {
  final NavbarItem navbarItem;
  final int index;

  const HomePageNavState(this.navbarItem, this.index);

  @override
  List<Object> get props => [navbarItem, index];
}

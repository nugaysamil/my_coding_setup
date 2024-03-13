part of '../main_tab_view.dart';

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    final userPhotoUrl = context.read<UserContext>().userState.user.photo;
    return AppBar(
      title: const Text('Coding Setup'),
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        CircleAvatar(
          backgroundImage: userPhotoUrl.ext.isNotNullOrNoEmpty
              ? NetworkImage(userPhotoUrl!)
              : null,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _BottomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _BottomAppBar();

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: context.general.colorScheme.onBackground,
      notchMargin: 10,
      clipBehavior: Clip.antiAlias,
      elevation: AppConstants.kZero,
      shape: const CircularNotchedRectangle(),
      child: const TabBar(
        tabs: MainTabViewMixin.tabItems,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kBottomNavigationBarHeight);
}

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:project_fullstack/routes/app_routes.dart';
import 'package:project_fullstack/widgets/filter/widget_filter_bar_v1.dart';
import 'package:project_fullstack/widgets/admin/user_item_card.dart';

class AdminUserListPage extends StatelessWidget {
  const AdminUserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final users = [
      {
        "name": "Black, Marvin",
        "phone": "+61488827086",
        "email": "johndoe@gmail.com",
        "image": "https://placehold.co/40x40",
      },
      {
        "name": "Jane Doe",
        "phone": "+62123456789",
        "email": "janedoe@email.com",
        "image": "https://placehold.co/40x40",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Manajemen User"),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(
              PhosphorIconsRegular.magnifyingGlass,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.userAdd);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const WidgetFilterBar(),
          Expanded(
            child: ListView.separated(
              itemCount: users.length,
              separatorBuilder: (context, index) => const SizedBox(height: 1),
              itemBuilder: (context, index) {
                final user = users[index];
                return UserItemCard(
                  name: user["name"]!,
                  phone: user["phone"]!,
                  email: user["email"]!,
                  imageUrl: user["image"]!,
                  onTapMenu: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (_) => Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: const Icon(Icons.person),
                              title: const Text('View Profile'),
                              onTap: () {},
                            ),
                            ListTile(
                              leading: const Icon(Icons.delete_outline),
                              title: const Text('Delete User'),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

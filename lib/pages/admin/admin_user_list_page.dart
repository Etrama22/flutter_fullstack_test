import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:project_fullstack/routes/app_routes.dart';
import 'package:project_fullstack/widgets/filter/widget_filter_bar_v1.dart';
import 'package:project_fullstack/widgets/admin/users/user_item_card.dart';
import 'package:project_fullstack/controllers/user_controller.dart';
import 'package:project_fullstack/config/app_config.dart';

class AdminUserListPage extends StatefulWidget {
  const AdminUserListPage({super.key});

  @override
  State<AdminUserListPage> createState() => _AdminUserListPageState();
}

class _AdminUserListPageState extends State<AdminUserListPage> {
  final UserController _controller = UserController();
  List<Map<String, dynamic>> users = [];
  bool isLoading = true;
  int page = 1;
  int limit = 20;

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    setState(() => isLoading = true);
    try {
      final result = await _controller.getUsers(page: page, limit: limit);
      setState(() => users = result);
    } catch (e) {
      // ignore: avoid_print
      print('Failed load users: $e');
      setState(() => users = []);
    } finally {
      setState(() => isLoading = false);
    }
  }

  String _resolveImageUrl(String? imagePath) {
    if (imagePath == null || imagePath.isEmpty) return '';
    if (imagePath.startsWith('http')) return imagePath;
    final apiBase = AppConfig.apiBase.replaceAll(RegExp(r'/$'), '');
    String hostBase = apiBase;
    final apiIndex = apiBase.indexOf('/api');
    if (apiIndex != -1) hostBase = apiBase.substring(0, apiIndex);
    final normalized = imagePath.replaceAll(RegExp(r'^/'), '');
    final useHost = imagePath.startsWith('/uploads');
    return useHost ? '$hostBase/$normalized' : '$apiBase/$normalized';
  }

  @override
  Widget build(BuildContext context) {
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
          const WidgetFilterBarV1(),
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : users.isEmpty
                ? RefreshIndicator(
                    onRefresh: _loadUsers,
                    child: ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: const [
                        SizedBox(height: 200),
                        Center(child: Text('Tidak ada user')),
                      ],
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: _loadUsers,
                    child: ListView.separated(
                      itemCount: users.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 1),
                      itemBuilder: (context, index) {
                        final user = users[index];
                        final imageRaw = user['photo_profile'] as String? ?? '';
                        final imageUrl = _resolveImageUrl(imageRaw);
                        return UserItemCard(
                          name: user['username'] ?? '-',
                          phone: user['phone'] ?? '-',
                          email: user['email'] ?? '-',
                          imageUrl: imageUrl.isNotEmpty
                              ? imageUrl
                              : 'https://placehold.co/40x40',
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
                                      onTap: () {
                                        Navigator.pop(context);
                                        // add navigation to profile if needed
                                      },
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.delete_outline),
                                      title: const Text('Delete User'),
                                      onTap: () {
                                        Navigator.pop(context);
                                        // add delete handling
                                      },
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
          ),
        ],
      ),
    );
  }
}

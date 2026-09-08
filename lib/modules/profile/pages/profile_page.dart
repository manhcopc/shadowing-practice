import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../echo_foundation/echo_progress_repository.dart';
import '../../echo_foundation/echo_theme.dart';
import '../../echo_foundation/widgets.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = const EchoProgressRepository().getProfile();
    return EchoScaffold(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Profile', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: EchoColors.darkText)),
          const SizedBox(height: 18),
          EchoCard(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 38,
                  backgroundColor: EchoColors.primaryBlue,
                  child: Icon(Icons.person_rounded, color: Colors.white, size: 38),
                ),
                const SizedBox(height: 14),
                Text(profile.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: EchoColors.darkText)),
                const SizedBox(height: 6),
                Text('${profile.targetLanguage} · ${profile.level} · ${profile.weeklyGoalMinutes} min/week', style: const TextStyle(color: EchoColors.secondaryText)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ...[
            ('Edit profile', Icons.edit_rounded),
            ('Learning preferences', Icons.tune_rounded),
            ('Audio settings', Icons.volume_up_rounded),
            ('Privacy', Icons.lock_rounded),
            ('About', Icons.info_rounded),
            ('Delete account', Icons.delete_outline_rounded),
            ('Sign out', Icons.logout_rounded),
          ].map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ListTile(
                  tileColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                    side: const BorderSide(color: EchoColors.border),
                  ),
                  leading: Icon(item.$2, color: EchoColors.primaryBlue),
                  title: Text(item.$1),
                  subtitle: item.$1 == 'Delete account' ? const Text('TODO for authenticated Ver1+') : null,
                  trailing: const Icon(Icons.chevron_right_rounded),
                ),
              )),
        ],
      ),
    );
  }
}

import 'package:e_learning_app/src/features/message/presentation/message_screen/message_screen.dart';
import 'package:e_learning_app/src/features/parents/model/ParentScreenRiverPodModel.dart';
import 'package:e_learning_app/src/features/profile/profile_screen.dart';
import 'package:e_learning_app/src/features/schedule/riverpod/schedule_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../schedule/presentation/schedule_screen.dart';
import '../../search/presentation/serach_screen.dart';

class ParentsScreenProvider extends StateNotifier<ParentScreenRiverPodModel> {
  ParentsScreenProvider() : super(const ParentScreenRiverPodModel());

  final List<Widget> _pageList = [
    SearchScreen(),
    ScheduleScreen(),
    MessageScreen(),
    ProfileScreen(),
  ];

  List<Widget> get pageList => _pageList;

  void onSelectedIndex(int index, WidgetRef ref) {
    debugPrint("Selected Page index : $index");
    state = state.copyWith(selectedIndex: index);
    
    // Refresh schedule data when navigating to schedule tab (index 1)
    if (index == 1) {
      ref.read(scheduleProvider.notifier).refreshMeetings();
    }
  }
}

final parentsScreenProvider =
    StateNotifierProvider<ParentsScreenProvider, ParentScreenRiverPodModel>((
      ref,
    ) {
      return ParentsScreenProvider();
    });

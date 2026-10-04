import 'package:flutter/material.dart';
import 'package:flutter_auto_revision/core/notification_service.dart';  
import 'package:flutter_auto_revision/features/note/note_list_screen.dart';
import 'package:timezone/data/latest_10y.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initialize();
  await NotificationService.requestPermission();

  // Initialize timezone database
  tzdata.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Asia/Kolkata'),);

  // await NotificationService.checkExactAlarmPermission();
  // await NotificationService.requestPermission();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: AddNoteScreen(),
      home: NoteListScreen(),
    );
  }


}

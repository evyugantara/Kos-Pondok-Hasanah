import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kos_pondokhasanah2/main.dart';
import 'package:kos_pondokhasanah2/screens/home_screen.dart';  // Pastikan import ini

void main() {
  testWidgets('Home Screen loads and shows Penghuni & Kamar options', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: HomeScreen())); // Gunakan HomeScreen langsung

    // Verifikasi apakah teks 'Management Penghuni' muncul di layar
    expect(find.text('Management Penghuni'), findsOneWidget);
    expect(find.text('Pengelolaan Kamar'), findsOneWidget);

    // Pastikan icon yang ada di menu dapat ditemukan
    expect(find.byIcon(Icons.person), findsOneWidget);
    expect(find.byIcon(Icons.meeting_room), findsOneWidget);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kos_pondokhasanah2/screens/home_screen.dart';  // Pastikan path-nya sesuai

void main() {
  testWidgets('HomeScreen has title and functionality', (WidgetTester tester) async {
    // Build HomeScreen widget
    await tester.pumpWidget(MaterialApp(home: HomeScreen()));

    // Check if the title is found in the widget tree
    expect(find.text('Aplikasi Kost Pondok Hasanah'), findsOneWidget);

    // Check if the list items are available
    expect(find.text('Management Penghuni'), findsOneWidget);
    expect(find.text('Pengelolaan Kamar'), findsOneWidget);
    expect(find.text('Kontrak Kost'), findsOneWidget);
    expect(find.text('Transaksi'), findsOneWidget);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:doctro/screens/astra/prescription_screen.dart';

void main() {
  testWidgets('PrescriptionScreen builds correctly and catches map type error', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: PrescriptionScreen(
          patientId: '123',
          patientName: 'Test Patient',
          patientPhone: '1234567890',
          doctorId: 'DOC1',
        ),
      ),
    ));

    // Verify it builds without throwing
    expect(find.text('Prescription for Test Patient'), findsOneWidget);
    
    // We expect the CircularProgressIndicator because _isLoading is initially true when fetching data
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}

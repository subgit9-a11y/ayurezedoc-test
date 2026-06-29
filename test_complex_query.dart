import 'dart:io';
import 'package:dio/dio.dart';

void main() async {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://astra.ayureze.in',
    connectTimeout: Duration(seconds: 45),
    receiveTimeout: Duration(seconds: 90),
  ));

  print('Starting complex AI query test...');
  print('Query: "Compare Ashwagandha and Shatavari for hormonal balance in women. Provide a detailed analysis based on Ayurvedic principles."');
  
  try {
    final startTime = DateTime.now();
    final response = await dio.post('/api/v1/brain/chat', data: {
      'q': 'Compare Ashwagandha and Shatavari for hormonal balance in women. Provide a detailed analysis based on Ayurvedic principles.',
      'user_id': 'test-doctor-123',
      'user_metadata': {'role': 'doctor'}
    });
    
    final duration = DateTime.now().difference(startTime);
    
    print('\nSuccess!');
    print('Time taken: ${duration.inSeconds} seconds');
    print('\nResponse Keys: ${response.data.keys}');
    
    dynamic data = response.data;
    if (data is Map && data.containsKey('data')) {
       data = data['data'];
       print('Unwrapped "data" keys: ${data.keys}');
    }

    String? text = data['response'] ?? data['message'] ?? data['answer'] ?? data['text'];
    
    print('\nResponse Preview:');
    print(text != null ? (text.length > 500 ? text.substring(0, 500) + '...' : text) : 'No text found in expected keys');
    
  } on DioException catch (e) {
    if (e.type == DioExceptionType.receiveTimeout) {
      print('\nFAILED: Timeout after ${e.requestOptions.receiveTimeout?.inSeconds}s. This is what we increased the limit for.');
    } else {
      print('\nFAILED: ${e.message}');
      print('Status: ${e.response?.statusCode}');
      print('Error Body: ${e.response?.data}');
    }
  } catch (e) {
    print('\nUnexpected Error: $e');
  }
}

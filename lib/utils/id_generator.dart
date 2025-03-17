import 'dart:math';

class IdGenerator {
  static String generateId() {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final randomString = List.generate(8, (index) => chars[random.nextInt(chars.length)]).join('');
    
    return '$timestamp-$randomString';
  }
} 
import 'package:flutter_test/flutter_test.dart';
import 'package:crypto_hmac/crypto_hmac.dart'; // Buradan fonksiyonları alıyoruz

void main() {
  group('Crypto token tests', () {
    const String testKey = 'MY_SECRET_KEY';
    const String testBody = 'Merhaba Dünya!';

    test('createCryptoToken returns non-empty HMAC + AES token', () {
      final token = createCryptoToken(testBody, testKey);
      expect(token, isNotEmpty);
      expect(token.length, greaterThan(testBody.length));
    });

    test('decryptCryptoToken correctly decrypts the token', () {
      final token = createCryptoToken(testBody, testKey);
      final result = decryptCryptoToken(token, secretKey: testKey);
      expect(result, equals(testBody));
    });

    test('decryptCryptoToken throws when input is malformed', () {
      expect(() => decryptCryptoToken('invalid_data', secretKey: testKey),
          throwsException);
    });
  });
}

import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'aes_encrption_helper.dart';

String createCryptoToken(String body, String secretKey) {
  var encrypted = encryptAESCryptoJS(body, secretKey);
  var aesList = utf8.encode(encrypted);
  var listKey = utf8.encode(secretKey);
  Hmac hmac = Hmac(sha256, listKey);
  Digest digest = hmac.convert(aesList);
  var finalBody = digest.toString() + encrypted.toString();
  return finalBody;
}

String decryptCryptoToken(String body, {String secretKey = 'YOUR_SECRET_KEY'}) {
  // Veriyi ayırma
  int hmacLength = 64; // SHA-256 için 32 byte HMAC değeri ve 32 byte şifrelenmiş veri;
  String encryptedData = body.substring(hmacLength);

  // Gelen şifrelenmiş veriyi doğrudan çözümleme
  String decrypted =
      decryptAESCryptoJS(Uri.decodeFull(encryptedData), secretKey);
  return decrypted;
}

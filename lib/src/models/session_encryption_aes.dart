import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';

class SessionEncryptionAes {
  IV? iv;
  /// Key encoded in base16.
  String? key;

  SessionEncryptionAes({
    this.iv,
    this.key,
  });

  IV _constructIV () {
    if (iv == null) {
      return IV.allZerosOfLength(16);
    }
    else {
      return IV.fromBase16(md5.convert(iv!.bytes).toString());
    }
  }

  Key _constructKey () {
    return Key.fromBase16(
      md5.convert(
        Key.fromBase16(key ?? "").bytes
      ).toString()
    );
  }

  String encrypt (String data) {
    final key = _constructKey();
    final iv = _constructIV();

    final cipher = Encrypter(AES(key, mode: AESMode.cbc, padding: "PKCS7"));
    return cipher.encrypt(data, iv: iv).base16;
  }

  String decrypt (String data) {
    final key = _constructKey();
    final iv = _constructIV();

    final cipher = Encrypter(AES(key, mode: AESMode.cbc, padding: "PKCS7"));
    return cipher.decrypt(Encrypted.fromBase16(data), iv: iv);
  }
}
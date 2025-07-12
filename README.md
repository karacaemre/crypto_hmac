# crypto_hmac

`crypto_hmac` is a Dart package for generating and verifying secure tokens using **AES encryption** combined with **HMAC SHA-256 hashing**.

This is useful for scenarios like securely transferring short payloads, such as IDs, encrypted JSON strings, or sensitive parameters.

---

## ✨ Features

- 🔐 AES encryption/decryption (compatible with CryptoJS)
- 🔒 HMAC-SHA256 signature generation
- ✅ Token integrity validation on decryption
- 🔄 Stateless: just encrypt and decrypt with the same secret key

---

## 🚀 Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  crypto_hmac: ^1.0.0

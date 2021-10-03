# Key Strengthener - Hardcore key derivation
### This algorithm uses SHA256 hashing, string concatenation and a lot of resources (CPU and Memory) to create a expensive key derivation, difficulting brute force / wordlist attacks to discover the password that was strengthened here.
#
* You will need to have Dart lang installed

* Inside bin/key_strengthener.dart you can change X and Y values to set the amount of rounds or the string size

```bash
cd key_strengthener
```

```bash
dart pub add crypto
```
* To run:
```bash
dart run
```
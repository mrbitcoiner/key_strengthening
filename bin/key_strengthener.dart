import 'package:crypto/crypto.dart';
import 'dart:io';
import 'dart:convert';

void main() {
  print ("Please insert the key: ");
  String? input = stdin.readLineSync();
  
  // You can change X and Y value to increase or decrease rounds (x) or increase string size (y)
  // X = 100 ; Y = 12 -> ~1.6 MB string
  // X = 100 ; Y = 13 -> ~3,2 MB string
  // X = 100 ; Y = 15 -> ~12,8 MB string
  // X = 23 ; Y = 22 -> ~1.6 GB string
  int x = 100;
  int y = 12;

  if (input != null) {
    Digest shasum = doHash(input);
    String data = "$shasum";
    var cont = 0;
    
    for (var i = 0 ; i<=x ; i++){
      shasum = doHash(data);
      data = "$data $shasum";  
      print (shasum);
      if (cont <= y){ 
        data = "$data $data";
        cont++;
      }
      print ("Round $i");
      
    }
    Digest finalRound = doHash(data);
    print ("\nStrengthened key is: $finalRound");

  }

}
Digest doHash ( String data ) {
  var bytes = utf8.encode(data);

  var digest = sha256.convert(bytes);
  return digest;
}
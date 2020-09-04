import 'dart:convert';

void prettyPrint(String input) {
  const JsonDecoder decoder = JsonDecoder();
  const JsonEncoder encoder = JsonEncoder.withIndent('  ');
  final dynamic object = decoder.convert(input);
  final dynamic prettyString = encoder.convert(object);
  prettyString.split('\n').forEach((dynamic element) => print(element));
}

String outputPrettyPrint(String input) {
  List outputResult = [];
  const JsonDecoder decoder = JsonDecoder();
  const JsonEncoder encoder = JsonEncoder.withIndent('  ');
  final dynamic object = decoder.convert(input);
  final dynamic prettyString = encoder.convert(object);
  prettyString.split('\n').forEach((dynamic element) {
      outputResult.add(element);
  });
  String stringOutput = outputResult.join('\n');
  return stringOutput;
}
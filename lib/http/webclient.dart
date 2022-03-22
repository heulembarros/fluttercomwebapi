import 'package:bytebank3/http/interceptors/logging_interceptor.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';


Client client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);
const String baseUrl = 'http://192.168.0.102:8080/transactions';


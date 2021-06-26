import 'package:meta/meta.dart';
class StripeCustomResponse{

  final bool ok;
  final String msg;
  final String id;

  StripeCustomResponse({@required this.ok,this.msg,this.id});

}

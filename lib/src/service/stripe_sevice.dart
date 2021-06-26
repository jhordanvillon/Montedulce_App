import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:montedulce_integrador/src/models/payment_intent_method.dart';
import 'package:montedulce_integrador/src/models/stripe_custom_response_model.dart';
import 'package:stripe_payment/stripe_payment.dart';

class StripeService{
  StripeService._privateConstructor();
  static final StripeService _instance = StripeService._privateConstructor();
  factory StripeService() => _instance;

  String _paymentApiUrl = 'https://api.stripe.com/v1/payment_intents';
  String _secretKey = 'sk_test_51J6VMjD5X8pdWHCbqriTnqjqMHSEvXS2ZE7mDtBss75yKqQDDuyoBbzycWuBku4IjlfifUUxYLwAcBNZ3F3yWkcJ00kVCqyY3E';
  String _apiKey ='pk_test_51J6VMjD5X8pdWHCbLaehbsfJTZ5UZZixoeYGTaPjOe9FEMq8oguidtTWxFRVKCKCIiqTUL3IBiKTnEs1ms6ZAkYb00a8AyKv9x';
  void init(){
    StripePayment.setOptions(
      StripeOptions(
        publishableKey: this._apiKey,
        androidPayMode: 'test',
        merchantId: 'test'
      )
    );
  }

  Future payToCardExist({
    @required String amount,
    @required String currency,
    @required CreditCard card,
  }) async{

  }

  Future<StripeCustomResponse> payToCart({
    @required String amount,
    @required String currency,
  }) async{
    try{
      final paymentMethod = await StripePayment.paymentRequestWithCardForm(
        CardFormPaymentRequest()
      );
      final resp = await this._payRealize(
        amount: amount, 
        currency: currency, 
        paymentMethod: paymentMethod,

      );
      
      return resp;
    }
    catch(e){
      return StripeCustomResponse(
        ok:false,
        msg:e.toString()
      );
    }
  }

  Future<StripeCustomResponse> payToGooglePlay({
    @required String amount,
    @required String currency,
  }) async{
    try {

      final newAmount = double.parse(amount)/100;

      final token = await StripePayment.paymentRequestWithNativePay(
        androidPayOptions: AndroidPayPaymentRequest(
          totalPrice: amount,
          currencyCode: currency
        ), 
        applePayOptions: ApplePayPaymentOptions(
          countryCode: 'US',
          currencyCode: currency,
          items: [
            ApplePayItem(
              label: 'Suscription',
              amount: '$newAmount'
            )
          ]
        )
      );

      final paymentMethod = await StripePayment.createPaymentMethod(
        PaymentMethodRequest(
          card: CreditCard(
            token: token.tokenId
          )
        )
      );

      final resp = await this._payRealize(
        amount: amount, 
        currency: currency, 
        paymentMethod: paymentMethod
      );

      StripePayment.completeNativePayRequest();

      return resp;

    } catch (e) {
      return StripeCustomResponse(
        ok: false,
        msg: 'error'
      );
    }
  }

  Future<PaymentIntentResponse> _createPaymentIntent({
    @required String amount,
    @required String currency,
  }) async{
    try{
      final dio = new Dio();
      final data={
        'amount':amount,
        'currency':currency
      };

      final resp = await dio.post(
        _paymentApiUrl,
        data: data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers:{
            'Authorization':'Bearer $_secretKey'
          }
        )
      );
      return PaymentIntentResponse.fromJson(resp.data);
    }
    catch(e){
      print('Error intent : ${e.toString()}');
      return PaymentIntentResponse(status: '400');
    }
  }

  Future<StripeCustomResponse> _payRealize({
    @required String amount,
    @required String currency,
    @required PaymentMethod paymentMethod
  }) async{
    try {
      final paymentIntent = await this._createPaymentIntent(amount: amount, currency: currency);

      final paymentResult = await StripePayment.confirmPaymentIntent(
        PaymentIntent(
          clientSecret: paymentIntent.clientSecret,
          paymentMethodId: paymentMethod.id
        ));

        if(paymentResult.status == 'succeeded'){
          return StripeCustomResponse(ok: true,id: paymentResult.paymentIntentId);
        }
        else{
          return StripeCustomResponse(
            ok:false,
            msg:'Error +${paymentResult.status}'
          );
        }

    } catch (e) {
      return StripeCustomResponse(
        ok: false,
        msg: 'error'
      );
    }
    
  }
}
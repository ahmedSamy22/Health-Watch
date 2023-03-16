abstract class PaymentCubitStates {}

class PaymentInitialState extends PaymentCubitStates {}

class PaymentAuthLoadingState extends PaymentCubitStates {}

class PaymentAuthSuccessState extends PaymentCubitStates {}

class PaymentAuthErrorState extends PaymentCubitStates {}

class PaymentGetOrderIdLoadingState extends PaymentCubitStates {}

class PaymentGetOrderIdSuccessState extends PaymentCubitStates {}

class PaymentGetOrderIdErrorState extends PaymentCubitStates {}

class PaymentGetPaymentRequestLoadingState extends PaymentCubitStates {}

class PaymentGetPaymentRequestSuccessState extends PaymentCubitStates {}

class PaymentGetPaymentRequestErrorState extends PaymentCubitStates {}

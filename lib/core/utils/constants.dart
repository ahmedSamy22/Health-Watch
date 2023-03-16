dynamic uId = '';

class ApiContest {
  static const String baseUrl = 'https://accept.paymob.com/api/';
  static const String getAuthToken = 'auth/tokens';
  static const String paymentApiKey =
      'ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SnVZVzFsSWpvaWFXNXBkR2xoYkNJc0ltTnNZWE56SWpvaVRXVnlZMmhoYm5RaUxDSndjbTltYVd4bFgzQnJJam8zTVRrMk5EQjkuZUFFaVphc1RpcXVWTWZMcUN4Yll1OThsWXZxNlFZYjh2WHpaMmZ0VDJSNTVrRE5rRVp4Y2RYVVRwYXdCQVNxZTRHWE55ekVYNEprSXRQVWozbnQ0bVE=';
  static const String getOrderId = 'ecommerce/orders';
  static const String getPaymentId = 'acceptance/payment_keys';
  static const String getKioskPaymentId = 'acceptance/payments/pay';
  static String paymentFirstToken = '';
  static int paymentOrderId = 0;
  static String finalToken = '';
  static String integrationIdCard = '3531361';
}

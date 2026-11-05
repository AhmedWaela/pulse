import 'package:googleapis_auth/auth_io.dart';

class ServerKey {
  static Future<String> getServerKey() async {
    List<String> scopes = const [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging",
    ];

    final client = await clientViaServiceAccount(
      ServiceAccountCredentials.fromJson({
        "type": "service_account",
        "project_id": "pulse-9a153",
        "private_key_id": "23c246070e2a58cc023aa7421e19106872f6be49",
        "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDDGNMAbuEOUZGi\naM9cAkuD7bAjeRg0HnFXeqrpuZJwc2RiGVQJs1e/gZsQY5sqUUMAHoyB9+SyG5s2\ni/ECFVScABjDZSh92WuXPeYaMD+13d6EsSZN3TfYL2CJAPLyAdTRtnJDc3Y0xsfE\nNcJD1lTQgMLidFPWixU+JkZJ7lmqHUliA0kOqwTnB3RmKy406DKu26pXuwiofj5g\nAOqUSxBGUgRwTfEfi1I5+cXhcB5hqggvpuvRNupM/hwDbFdClsujtJP8K1rrPKLG\noqM5kenUmjctFUKTmshTxXfPdUjf6UU5MGw7Hl/ap32MMjdHzbFkdFotRu96CXNx\n8Qkw009RAgMBAAECggEADrlG41d64KvDQ/CJBbaeoFxF2MeAzh4mC6YUVANPS/FJ\neCXVM843JxrO6xO5WB494jpr/DsLJW3z7s/s5m1Zr1RKiiSOQ8Eu34EqZnuRs1YF\nPxpne6TgXA5nSK+rphwBRbpxMSn7l8wQs3wjJx970yiEjLaexShF+CTHVTkJx07A\nfR5wqZn9GsHZE0cLiLRFCJwzs7qFSlWIA+zAtaZ6Nk5oZEZIH2vsOlE+AeFys+Z5\nyY6J9n+Bbv6+M1Rl8r2lN4UOj0+MPzuXAPZIGIq84NqJdV8dSrzFd+fitL8TI1c4\nBT1gyLn5GxiG5C4KZGkDYHpRPS+NzA5TqDdGAY4kiQKBgQD/P2Ywq//t2UJvFA19\nTkCvJEpGPzwO4gK4/4dNH2pU1cSxWAAOZx+1XhX3fizFzFAEUxNw7ZjLKfM6/AVv\neC1u4vzeFDter1Bvc3nbUFuLQgmbyLpEOnyXyeXeEWDr+LuEu3DnWdIF7r8ExFy0\nI3stKewgCs1OuBuMi6ujBiSFPwKBgQDDrAmX6t1CfiQPGMLCnZSv56uQnK1Mi6RJ\n/FVZ1qQT6C/PzH6Evc0Kk1nnRwflgU/IcMwGlbI1KQmTLfuyuwIoNXjEe6bsqn0C\nig+SPvxTaemdxxT7JZAMerCSXCmxjyuB8U4qZmIZRV3co43zpIIlVDht61zMkNr5\nFy/bGWM3bwKBgQDUauKUZs+aFVBgOIPxYAoct0rIox9ME3LImn7zA83tw+jo3Z9O\nXSvaN+54BR0ljx6YOrrXJCQgD01ILSwo1A6bVXOzLYsrBSMfXS5wAbPtdIuiha3d\n0f6WI4OVB0ltl5YWpBcVsX5DSajWQsQTdeOwdk73a4XomPb0Q9gW16nU6QKBgHwy\nsIwq2XIhGsYyUzywRPY6OF279QvG/uqvLYWuhcrU77QX+p5K0uDJkqEIJuz33So+\n3mG3lrvDZn5zC3Xw2XeoKRWd3uANfvejpiqPrB1N9qjc+mZG+13Qak8cDKLVWypJ\nffHPtqiPrPolHi7t1mXXRVIPuIFn2HWO0CNjw+QlAoGBANhLZpY295HZvgWq3oWP\nxC/y/5WwnoX5J2EXYgLtV9xJDJmHWJIz+FcJW766SnRumCd3WqtSze4fPBvydhZk\nOpl7vwrqsiVs+lPN6mhILam3FapM+NWJ5NUXztUA9zeHGcTqbBHInivBKIE4l+3s\nMjAzDPIYAtF7wg0I/vuBVtgT\n-----END PRIVATE KEY-----\n",
        "client_email":
            "firebase-adminsdk-fbsvc@pulse-9a153.iam.gserviceaccount.com",
        "client_id": "108563776848736386199",
        "auth_uri": "https://accounts.google.com/o/oauth2/auth",
        "token_uri": "https://oauth2.googleapis.com/token",
        "auth_provider_x509_cert_url":
            "https://www.googleapis.com/oauth2/v1/certs",
        "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-fbsvc%40pulse-9a153.iam.gserviceaccount.com",
        "universe_domain": "googleapis.com",
      }),
      scopes,
    );
    return client.credentials.accessToken.data;
  }
}

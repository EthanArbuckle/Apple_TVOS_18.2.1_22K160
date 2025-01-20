@interface PDPeerPaymentTransactionAcceptedUserNotification
- (id)_messageString;
- (unint64_t)notificationType;
@end

@implementation PDPeerPaymentTransactionAcceptedUserNotification

- (unint64_t)notificationType
{
  return 9LL;
}

- (id)_messageString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PDPeerPaymentTransactionUserNotification paymentTransaction](self, "paymentTransaction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 subtotalCurrencyAmount]);
  v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue([v2 currencyAmount]);
  }
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 minimalFormattedStringValue]);
  uint64_t v8 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_TRANSACTION_ACCEPTED_NOTIFICATION_TITLE");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@\n%@", v9, v7));

  return v10;
}

@end
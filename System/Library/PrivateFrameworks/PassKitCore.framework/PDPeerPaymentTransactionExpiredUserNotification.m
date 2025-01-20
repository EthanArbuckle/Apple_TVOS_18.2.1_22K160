@interface PDPeerPaymentTransactionExpiredUserNotification
- (id)_messageString;
- (unint64_t)notificationType;
@end

@implementation PDPeerPaymentTransactionExpiredUserNotification

- (unint64_t)notificationType
{
  return 10LL;
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
  uint64_t v8 = PKLocalizedPaymentString(@"AMOUNT_FORMAT_REIMBURSEMENT", @"%@", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  uint64_t v10 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_TRANSACTION_EXPIRED_NOTIFICATION_TITLE");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@\n%@", v11, v9));

  return v12;
}

@end
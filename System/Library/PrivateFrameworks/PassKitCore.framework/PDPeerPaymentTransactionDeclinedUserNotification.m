@interface PDPeerPaymentTransactionDeclinedUserNotification
- (id)_messageString;
- (id)_titleString;
- (unint64_t)notificationType;
@end

@implementation PDPeerPaymentTransactionDeclinedUserNotification

- (unint64_t)notificationType
{
  return 13LL;
}

- (id)_titleString
{
  return (id)PKLocalizedPeerPaymentString(@"PEER_PAYMENT_TRANSACTION_DECLINED_NOTIFICATION_TITLE");
}

- (id)_messageString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PDPeerPaymentTransactionUserNotification paymentTransaction](self, "paymentTransaction"));
  unint64_t v3 = (unint64_t)[v2 transactionDeclinedReason] - 1;
  if (v3 > 2) {
    v4 = @"PEER_PAYMENT_TRANSACTION_DECLINED_GENERIC_NOTIFICATION_MESSAGE";
  }
  else {
    v4 = off_10064D520[v3];
  }
  uint64_t v5 = PKLocalizedPeerPaymentString(&v4->isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

@end
@interface PDPeerPaymentTransactionRejectedReceiveUserNotification
- (id)_messageString;
- (unint64_t)notificationType;
@end

@implementation PDPeerPaymentTransactionRejectedReceiveUserNotification

- (unint64_t)notificationType
{
  return 35LL;
}

- (id)_messageString
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDPeerPaymentTransactionUserNotification familyMember](self, "familyMember"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDPeerPaymentTransactionUserNotification paymentTransaction](self, "paymentTransaction"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 subtotalCurrencyAmount]);
  v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)objc_claimAutoreleasedReturnValue([v4 currencyAmount]);
  }
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 minimalFormattedStringValue]);
  if (v3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v3 firstName]);
    uint64_t v11 = PKLocalizedPeerPaymentLexingtonString( @"PEER_PAYMENT_TRANSACTION_NOTIFICATION_FAMILY_MEMBER_P2P_RECEIVE_REJECTED",  @"%@",  v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    uint64_t v13 = PKLocalizedPaymentString(@"AMOUNT_FORMAT_REIMBURSEMENT", @"%@", v9);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);

    v9 = (void *)v14;
  }

  else
  {
    uint64_t v15 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_TRANSACTION_REJECTED_NOTIFICATION_TITLE");
    v12 = (void *)objc_claimAutoreleasedReturnValue(v15);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@\n%@", v12, v9));

  return v16;
}

@end
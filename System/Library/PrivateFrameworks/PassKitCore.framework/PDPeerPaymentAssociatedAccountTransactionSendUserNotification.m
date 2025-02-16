@interface PDPeerPaymentAssociatedAccountTransactionSendUserNotification
- (id)_messageString;
- (unint64_t)notificationType;
@end

@implementation PDPeerPaymentAssociatedAccountTransactionSendUserNotification

- (unint64_t)notificationType
{
  return 34LL;
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

  unsigned int v9 = [v4 isRecurring];
  v10 = @"PEER_PAYMENT_TRANSACTION_NOTIFICATION_FAMILY_MEMBER_P2P_SEND";
  if (v9) {
    v10 = @"PEER_PAYMENT_TRANSACTION_NOTIFICATION_FAMILY_MEMBER_P2P_SEND_RECURRING";
  }
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue([v3 firstName]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v8 minimalFormattedStringValue]);
  v14 = (void *)objc_claimAutoreleasedReturnValue( -[PDPeerPaymentTransactionUserNotification _formattedCounterpartName]( self,  "_formattedCounterpartName"));
  uint64_t v15 = PKLocalizedPeerPaymentLexingtonString(v11, @"%@%@%@", v12, v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  return v16;
}

@end
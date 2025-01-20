@interface PDPeerPaymentAssociatedAccountTransactionReceivedUserNotification
- (id)_messageString;
- (unint64_t)notificationType;
@end

@implementation PDPeerPaymentAssociatedAccountTransactionReceivedUserNotification

- (unint64_t)notificationType
{
  return 31LL;
}

- (id)_messageString
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDPeerPaymentTransactionUserNotification familyMember](self, "familyMember"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDPeerPaymentTransactionUserNotification paymentTransaction](self, "paymentTransaction"));
  unsigned int v5 = [v4 isRecurring];
  v6 = @"PEER_PAYMENT_TRANSACTION_NOTIFICATION_FAMILY_MEMBER_P2P_RECEIVE";
  if (v5) {
    v6 = @"PEER_PAYMENT_TRANSACTION_NOTIFICATION_FAMILY_MEMBER_P2P_RECEIVE_RECURRING";
  }
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 firstName]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 formattedBalanceAdjustmentAmount]);
  v10 = (void *)objc_claimAutoreleasedReturnValue( -[PDPeerPaymentTransactionUserNotification _formattedCounterpartName]( self,  "_formattedCounterpartName"));
  uint64_t v11 = PKLocalizedPeerPaymentLexingtonString(v7, @"%@%@%@", v8, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  return v12;
}

@end
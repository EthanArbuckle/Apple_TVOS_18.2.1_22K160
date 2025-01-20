@interface PDTransactionNotificationControllerConfiguration
- (BOOL)shouldReceiveNotificationsForPeerPaymentNotificationType:(unint64_t)a3;
- (NSString)transactionSourceIdentifier;
- (PKAccountUser)accountUser;
- (PKFamilyMember)currentUser;
- (PKFamilyMember)familyMember;
- (PKPaymentApplication)paymentApplication;
- (PKPaymentOfferInstallmentCriteria)installmentCriteria;
- (PKPaymentPass)paymentPass;
- (PKPeerPaymentAccount)associatedPeerPaymentAccount;
- (PKPeerPaymentAccount)peerPaymentAccount;
- (PKPeerPaymentPreferences)preferences;
- (id)description;
- (id)passUniqueIdentifier;
- (unint64_t)transactionSourceType;
- (void)setAccountUser:(id)a3;
- (void)setAssociatedPeerPaymentAccount:(id)a3;
- (void)setCurrentUser:(id)a3;
- (void)setFamilyMember:(id)a3;
- (void)setInstallmentCriteria:(id)a3;
- (void)setPaymentApplication:(id)a3;
- (void)setPaymentPass:(id)a3;
- (void)setPeerPaymentAccount:(id)a3;
- (void)setPreferences:(id)a3;
- (void)setTransactionSourceIdentifier:(id)a3;
- (void)setTransactionSourceType:(unint64_t)a3;
@end

@implementation PDTransactionNotificationControllerConfiguration

- (id)passUniqueIdentifier
{
  return -[PKPaymentPass uniqueID](self->_paymentPass, "uniqueID");
}

- (BOOL)shouldReceiveNotificationsForPeerPaymentNotificationType:(unint64_t)a3
{
  if (self->_transactionSourceType != 1) {
    return 1;
  }
  preferences = self->_preferences;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount altDSID](self->_associatedPeerPaymentAccount, "altDSID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[PKPeerPaymentPreferences notificationWithType:altDSID:]( preferences,  "notificationWithType:altDSID:",  a3,  v5));

  LOBYTE(preferences) = [v6 value];
  return (char)preferences;
}

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p; ",
         objc_opt_class(self, a2),
         self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v4 appendFormat:@"transactionSourceIdentifier: '%@'; ", self->_transactionSourceIdentifier];
  uint64_t v5 = PKTransactionSourceTypeToString(self->_transactionSourceType);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v4 appendFormat:@"transactionSourceType: '%@'; ", v6];

  [v4 appendFormat:@"paymentApplication: '%@'; ", self->_paymentApplication];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDTransactionNotificationControllerConfiguration passUniqueIdentifier](self, "passUniqueIdentifier"));
  [v4 appendFormat:@"paymentPass: '%@'; ", v7];

  [v4 appendFormat:@"familyMember: '%@'; ", self->_familyMember];
  [v4 appendFormat:@"currentUser: '%@'; ", self->_currentUser];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount identifier](self->_associatedPeerPaymentAccount, "identifier"));
  [v4 appendFormat:@"associatedPeerPaymentAccount identifier: '%@'; ", v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount altDSID](self->_associatedPeerPaymentAccount, "altDSID"));
  [v4 appendFormat:@"associatedPeerPaymentAccount altDSID: '%@'; ", v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount identifier](self->_peerPaymentAccount, "identifier"));
  [v4 appendFormat:@"peerPaymentAccount: '%@'; ", v10];

  [v4 appendFormat:@"preferences: '%@'; ", self->_preferences];
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccountUser altDSID](self->_accountUser, "altDSID"));
  [v4 appendFormat:@"accountUser altDSID: '%@'; ", v11];

  id v12 = [v4 copy];
  return v12;
}

- (NSString)transactionSourceIdentifier
{
  return self->_transactionSourceIdentifier;
}

- (void)setTransactionSourceIdentifier:(id)a3
{
}

- (unint64_t)transactionSourceType
{
  return self->_transactionSourceType;
}

- (void)setTransactionSourceType:(unint64_t)a3
{
  self->_transactionSourceType = a3;
}

- (PKPeerPaymentAccount)associatedPeerPaymentAccount
{
  return self->_associatedPeerPaymentAccount;
}

- (void)setAssociatedPeerPaymentAccount:(id)a3
{
}

- (PKPeerPaymentAccount)peerPaymentAccount
{
  return self->_peerPaymentAccount;
}

- (void)setPeerPaymentAccount:(id)a3
{
}

- (PKPeerPaymentPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (PKPaymentApplication)paymentApplication
{
  return self->_paymentApplication;
}

- (void)setPaymentApplication:(id)a3
{
}

- (PKPaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (void)setPaymentPass:(id)a3
{
}

- (PKFamilyMember)familyMember
{
  return self->_familyMember;
}

- (void)setFamilyMember:(id)a3
{
}

- (PKFamilyMember)currentUser
{
  return self->_currentUser;
}

- (void)setCurrentUser:(id)a3
{
}

- (PKAccountUser)accountUser
{
  return self->_accountUser;
}

- (void)setAccountUser:(id)a3
{
}

- (PKPaymentOfferInstallmentCriteria)installmentCriteria
{
  return self->_installmentCriteria;
}

- (void)setInstallmentCriteria:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
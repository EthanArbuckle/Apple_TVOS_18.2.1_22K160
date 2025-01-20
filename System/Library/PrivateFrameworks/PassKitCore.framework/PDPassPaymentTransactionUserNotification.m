@interface PDPassPaymentTransactionUserNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForPaymentTransaction:(id)a3;
- (BOOL)isValid;
- (PDPassPaymentTransactionUserNotification)initWithCoder:(id)a3;
- (PDPassPaymentTransactionUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5 familyMember:(id)a6 accountUser:(id)a7 installmentCriteria:(id)a8;
- (PKAccountUser)accountUser;
- (PKFamilyMember)familyMember;
- (PKPaymentOfferInstallmentCriteria)installmentCriteria;
- (PKPaymentTransaction)paymentTransaction;
- (id)_absoluteAmountString;
- (id)_amountString;
- (id)_amountsString;
- (id)_awardsString;
- (id)_locationString;
- (id)_personContact;
- (id)_statusString;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)familyNotificationType;
- (unint64_t)notificationType;
- (void)_populateNotificationContent:(id)a3 withDataSource:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPassPaymentTransactionUserNotification

+ (id)notificationIdentifierForPaymentTransaction:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 serviceIdentifier]);
  v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)objc_claimAutoreleasedReturnValue([v3 identifier]);
  }
  v7 = v6;

  return v7;
}

- (PDPassPaymentTransactionUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5 familyMember:(id)a6 accountUser:(id)a7 installmentCriteria:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v38 = a7;
  id v19 = a8;
  if (v15)
  {
    id v36 = v19;
    id v37 = v18;
    id v21 = objc_msgSend((id)objc_opt_class(self, v20), "notificationIdentifierForPaymentTransaction:", v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v39.receiver = self;
    v39.super_class = (Class)&OBJC_CLASS___PDPassPaymentTransactionUserNotification;
    v23 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v39,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v22,  v16);
    v24 = v23;
    if (v23)
    {
      p_paymentTransaction = (id *)&v23->_paymentTransaction;
      objc_storeStrong((id *)&v23->_paymentTransaction, a3);
      objc_storeStrong((id *)&v24->_familyMember, a6);
      objc_storeStrong((id *)&v24->_accountUser, a7);
      objc_storeStrong((id *)&v24->_installmentCriteria, a8);
      v26 = (void *)objc_claimAutoreleasedReturnValue([*p_paymentTransaction transactionDate]);
      -[PDUserNotification setDate:](v24, "setDate:", v26);

      v27 = (void *)objc_claimAutoreleasedReturnValue([*p_paymentTransaction accountIdentifier]);
      -[PDUserNotification setAccountIdentifier:](v24, "setAccountIdentifier:", v27);

      if (([v17 supportsTransit] & 1) == 0)
      {
        -[PDUserNotification setCustomActionRoute:]( v24,  "setCustomActionRoute:",  PKUserNotificationActionRouteViewTransaction);
        v28 = (void *)objc_claimAutoreleasedReturnValue([*p_paymentTransaction identifier]);
        v29 = (void *)objc_claimAutoreleasedReturnValue([*p_paymentTransaction transactionSourceIdentifier]);
        v30 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        if ([v28 length]) {
          -[NSMutableDictionary setObject:forKey:]( v30,  "setObject:forKey:",  v28,  PKUserNotificationActionQueryItemTransactionIdentifier);
        }
        if ([v29 length]) {
          -[NSMutableDictionary setObject:forKey:]( v30,  "setObject:forKey:",  v29,  PKUserNotificationActionQueryItemTransactionSourceIdentifier);
        }
        id v31 = -[NSMutableDictionary copy](v30, "copy");
        -[PDUserNotification setCustomActionQueryParameters:](v24, "setCustomActionQueryParameters:", v31);
      }
    }

    id v18 = v37;
    v32 = v38;
    v33 = v36;
  }

  else
  {
    id v34 = v19;

    v33 = v34;
    v24 = 0LL;
    v32 = v38;
  }

  return v24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPassPaymentTransactionUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___PDPassPaymentTransactionUserNotification;
  id v6 = -[PDUserNotification initWithCoder:](&v23, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKPaymentTransaction, v5),  @"paymentTransaction");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    paymentTransaction = v6->_paymentTransaction;
    v6->_paymentTransaction = (PKPaymentTransaction *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKFamilyMember, v10),  @"familyMember");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    familyMember = v6->_familyMember;
    v6->_familyMember = (PKFamilyMember *)v12;

    id v15 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKAccountUser, v14),  @"accountUser");
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    accountUser = v6->_accountUser;
    v6->_accountUser = (PKAccountUser *)v16;

    id v19 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKPaymentOfferInstallmentCriteria, v18),  @"installmentCriteria");
    uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
    installmentCriteria = v6->_installmentCriteria;
    v6->_installmentCriteria = (PKPaymentOfferInstallmentCriteria *)v20;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDPassPaymentTransactionUserNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeObject:forKey:",  self->_paymentTransaction,  @"paymentTransaction",  v5.receiver,  v5.super_class);
  [v4 encodeObject:self->_familyMember forKey:@"familyMember"];
  [v4 encodeObject:self->_accountUser forKey:@"accountUser"];
  [v4 encodeObject:self->_installmentCriteria forKey:@"installmentCriteria"];
}

- (unint64_t)familyNotificationType
{
  if (self->_accountUser) {
    return 2LL;
  }
  else {
    return self->_familyMember != 0LL;
  }
}

- (unint64_t)notificationType
{
  return 4LL;
}

- (BOOL)isValid
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction transactionDate](self->_paymentTransaction, "transactionDate"));
  [v3 timeIntervalSinceNow];
  double v5 = v4;

  unsigned int v6 = -[PKPaymentTransaction hasNotificationServiceData]( self->_paymentTransaction,  "hasNotificationServiceData");
  if (v6)
  {
    LOBYTE(v6) = -[PKPaymentTransaction hasAssociatedPaymentApplication]( self->_paymentTransaction,  "hasAssociatedPaymentApplication");
    if (fabs(v5) <= 43200.0) {
      LOBYTE(v6) = 1;
    }
  }

  return v6;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___PDPassPaymentTransactionUserNotification;
  id v4 = a3;
  id v5 = -[PDUserNotification notificationContentWithDataSource:](&v19, "notificationContentWithDataSource:", v4);
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[PDPassPaymentTransactionUserNotification _populateNotificationContent:withDataSource:]( self,  "_populateNotificationContent:withDataSource:",  v6,  v4,  v19.receiver,  v19.super_class);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKFamilyMember altDSID](self->_familyMember, "altDSID"));
  if (!v7)
  {
    accountUser = self->_accountUser;
    if (accountUser) {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccountUser altDSID](accountUser, "altDSID"));
    }
    else {
      id v7 = 0LL;
    }
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
  id v10 = [v9 mutableCopy];
  id v11 = v10;
  if (v10) {
    uint64_t v12 = (NSMutableDictionary *)v10;
  }
  else {
    uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  v13 = v12;

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction identifier](self->_paymentTransaction, "identifier"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  v14,  PKUserNotificationTransactionIdentifierContextKey);

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification passUniqueIdentifier](self, "passUniqueIdentifier"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  v15,  PKUserNotificationPassUniqueIdentifierContextKey);

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  v7,  PKUserNotificationAltDSIDKey);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction accountIdentifier](self->_paymentTransaction, "accountIdentifier"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  v16,  PKUserNotificationAccountIdentifier);

  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[PKPaymentTransaction accountType](self->_paymentTransaction, "accountType")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  v17,  PKUserNotificationAccountType);

  [v6 setUserInfo:v13];
  return v6;
}

- (void)_populateNotificationContent:(id)a3 withDataSource:(id)a4
{
  id v96 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification passUniqueIdentifier](self, "passUniqueIdentifier"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 passWithUniqueIdentifier:v7]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 paymentPass]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassPaymentTransactionUserNotification _personContact](self, "_personContact"));
  v95 = (void *)objc_claimAutoreleasedReturnValue([v10 givenName]);

  unsigned int v11 = [v9 hasAssociatedPeerPaymentAccount];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 associatedAccountServiceAccountIdentifier]);

  id v13 = -[PKPaymentTransaction featureIdentifier](self->_paymentTransaction, "featureIdentifier");
  id v14 = [v9 associatedAccountFeatureIdentifier];
  id v15 = 0LL;
  id v16 = 0LL;
  switch((unint64_t)-[PKPaymentTransaction transactionType](self->_paymentTransaction, "transactionType"))
  {
    case 0uLL:
      if (-[PKPaymentTransaction transactionStatus](self->_paymentTransaction, "transactionStatus") == (id)2) {
        goto LABEL_26;
      }
      goto LABEL_2;
    case 1uLL:
      id v16 = (id)objc_claimAutoreleasedReturnValue(-[PDPassPaymentTransactionUserNotification _locationString](self, "_locationString"));
      if (v95)
      {
        uint64_t v23 = PKLocalizedPeerPaymentLexingtonString( @"PEER_PAYMENT_TRANSACTION_NOTIFICATION_FAMILY_MEMBER_REFUNDED",  @"%@",  v95);
LABEL_23:
        uint64_t v32 = objc_claimAutoreleasedReturnValue(v23);
      }

      else
      {
        uint64_t v67 = PKLocalizedPaymentString(@"PAYMENT_TRANSACTION_REFUND");
        uint64_t v32 = objc_claimAutoreleasedReturnValue(v67);
      }

      goto LABEL_44;
    case 2uLL:
      goto LABEL_55;
    case 3uLL:
    case 9uLL:
    case 0xCuLL:
    case 0xEuLL:
      goto LABEL_2;
    case 4uLL:
      v24 = @"TRANSACTION_TYPE_FEE";
      goto LABEL_41;
    case 5uLL:
      if (v11)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue( -[PKPaymentTransaction secondaryFundingSourceDescription]( self->_paymentTransaction,  "secondaryFundingSourceDescription"));
        uint64_t v18 = v25;
        if (v95)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassPaymentTransactionUserNotification _amountString](self, "_amountString"));
          uint64_t v27 = PKLocalizedPeerPaymentLexingtonString( @"PEER_PAYMENT_TRANSACTION_FAMILY_MEMBER_BANK_TRANSFER_BY_MESSAGE",  @"%@%@%@",  v95,  v26,  v18);
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v27);

          v22 = 0LL;
          id v16 = 0LL;
          goto LABEL_7;
        }

        id v16 = v25;
        uint64_t v77 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_TRANSACTION_BANK_TRANSFER_NOTIFICATION_TITLE");
        id v19 = (id)objc_claimAutoreleasedReturnValue(v77);
        goto LABEL_4;
      }

      if (v13 != (id)5) {
        goto LABEL_64;
      }
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction transfers](self->_paymentTransaction, "transfers"));
      v49 = (void *)objc_claimAutoreleasedReturnValue([v48 firstObject]);

      v50 = (void *)objc_claimAutoreleasedReturnValue([v49 externalAccount]);
      v51 = (void *)objc_claimAutoreleasedReturnValue([v50 fundingDetails]);

      uint64_t v53 = objc_opt_class(&OBJC_CLASS___PKAccountPaymentFundingDetailsBankAccount, v52);
      if ((objc_opt_isKindOfClass(v51, v53) & 1) != 0)
      {
        v54 = (void *)objc_claimAutoreleasedReturnValue([v51 name]);
        v55 = v54;
        if (v54)
        {
          id v56 = v54;
        }

        else
        {
          uint64_t v79 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_BANK_ACCOUNT_DEFAULT_NAME", 2LL);
          id v56 = (id)objc_claimAutoreleasedReturnValue(v79);
        }

        v75 = v56;
      }

      else
      {
        v75 = 0LL;
      }

      uint64_t v80 = PKLocalizedFeatureString(@"TRANSACTION_ACCOUNT_NAME", 5LL);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(v80);
      uint64_t v81 = PKLocalizedFeatureString(@"TRANSACTION_NOTIFICATION_WITHDRAWAL", 5LL);
      id v16 = (id)objc_claimAutoreleasedReturnValue(v81);
      if ([v75 length])
      {
        v82 = @"TRANSACTION_NOTIFICATION_WITHDRAWAL_MESSAGE";
        goto LABEL_78;
      }

      v83 = @"TRANSACTION_NOTIFICATION_WITHDRAWAL_MESSAGE_NO_BANK";
      goto LABEL_80;
    case 6uLL:
      if (v11)
      {
        id v15 = v95;
        if (!v95)
        {
          uint64_t v78 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_TRANSACTION_TOP_UP_NOTIFICATION_MESSAGE");
          id v16 = (id)objc_claimAutoreleasedReturnValue(v78);
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassPaymentTransactionUserNotification _amountString](self, "_amountString"));
          uint64_t v20 = 0LL;
          goto LABEL_46;
        }

        v28 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassPaymentTransactionUserNotification _amountString](self, "_amountString"));
        uint64_t v29 = PKLocalizedPeerPaymentLexingtonString( @"PEER_PAYMENT_TRANSACTION_FAMILY_MEMBER_TOP_UP_NOTIFICATION_MESSAGE",  @"%@%@",  v95,  v28);
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v29);

        v22 = 0LL;
        id v16 = 0LL;
        id v15 = 0LL;
        if (v20) {
          goto LABEL_52;
        }
        goto LABEL_55;
      }

      if (v13 == (id)5)
      {
        v57 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction transfers](self->_paymentTransaction, "transfers"));
        v49 = (void *)objc_claimAutoreleasedReturnValue([v57 firstObject]);

        v58 = (void *)objc_claimAutoreleasedReturnValue([v49 externalAccount]);
        v51 = (void *)objc_claimAutoreleasedReturnValue([v58 fundingDetails]);

        uint64_t v60 = objc_opt_class(&OBJC_CLASS___PKAccountPaymentFundingDetailsBankAccount, v59);
        if ((objc_opt_isKindOfClass(v51, v60) & 1) != 0)
        {
          v61 = (void *)objc_claimAutoreleasedReturnValue([v51 name]);
          v62 = v61;
          if (v61)
          {
            id v63 = v61;
          }

          else
          {
            uint64_t v84 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_BANK_ACCOUNT_DEFAULT_NAME", 2LL);
            id v63 = (id)objc_claimAutoreleasedReturnValue(v84);
          }

          v75 = v63;
        }

        else
        {
          v75 = 0LL;
        }

        uint64_t v85 = PKLocalizedFeatureString(@"TRANSACTION_ACCOUNT_NAME", 5LL);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(v85);
        uint64_t v86 = PKLocalizedFeatureString(@"TRANSACTION_NOTIFICATION_TOP_UP", 5LL);
        id v16 = (id)objc_claimAutoreleasedReturnValue(v86);
        if ([v75 length])
        {
          v82 = @"TRANSACTION_NOTIFICATION_TOP_UP_MESSAGE";
LABEL_78:
          v90 = v75;
          uint64_t v87 = PKLocalizedFeatureString(v82, 5LL, @"%@");
          uint64_t v88 = objc_claimAutoreleasedReturnValue(v87);
        }

        else
        {
          v83 = @"TRANSACTION_NOTIFICATION_TOP_UP_MESSAGE_NO_BANK";
LABEL_80:
          uint64_t v89 = PKLocalizedFeatureString(v83, 5LL);
          uint64_t v88 = objc_claimAutoreleasedReturnValue(v89);
        }

        uint64_t v20 = (void *)v88;
        goto LABEL_82;
      }

      if (v14 != (id)4)
      {
LABEL_64:
        id v15 = 0LL;
        id v16 = 0LL;
        goto LABEL_55;
      }

      uint64_t v76 = PKLocalizedPaymentString(@"TRANSACTION_TYPE_TOP_UP");
      id v16 = (id)objc_claimAutoreleasedReturnValue(v76);
LABEL_63:
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassPaymentTransactionUserNotification _amountString](self, "_amountString"));
      id v15 = 0LL;
      goto LABEL_84;
    case 7uLL:
      uint64_t v30 = PKLocalizedTitleForTransactionWithAdjustment(self->_paymentTransaction);
      uint64_t v31 = objc_claimAutoreleasedReturnValue(v30);
      goto LABEL_42;
    case 8uLL:
      id v16 = (id)objc_claimAutoreleasedReturnValue(-[PDPassPaymentTransactionUserNotification _locationString](self, "_locationString"));
      if (!v95) {
        goto LABEL_63;
      }
      uint64_t v23 = PKLocalizedPeerPaymentLexingtonString( @"PEER_PAYMENT_TRANSACTION_NOTIFICATION_FAMILY_MEMBER_DISBURSED",  @"%@",  v95);
      goto LABEL_23;
    case 0xAuLL:
      if (v12 && -[PKPaymentTransaction transactionStatus](self->_paymentTransaction, "transactionStatus") == (id)4) {
LABEL_26:
      }
        [v96 setInterruptionLevel:2];
LABEL_2:
      id v16 = (id)objc_claimAutoreleasedReturnValue(-[PDPassPaymentTransactionUserNotification _locationString](self, "_locationString"));
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassPaymentTransactionUserNotification _statusString](self, "_statusString"));
      uint64_t v18 = v17;
      if (v17)
      {
        id v19 = v17;
LABEL_4:
        uint64_t v20 = v19;
        uint64_t v21 = objc_claimAutoreleasedReturnValue(-[PDPassPaymentTransactionUserNotification _amountString](self, "_amountString"));
      }

      else
      {
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassPaymentTransactionUserNotification _amountString](self, "_amountString"));
        uint64_t v21 = objc_claimAutoreleasedReturnValue(-[PDPassPaymentTransactionUserNotification _awardsString](self, "_awardsString"));
      }

      v22 = (void *)v21;
LABEL_7:

      goto LABEL_45;
    case 0xBuLL:
      if (v13 == (id)5)
      {
        uint64_t v33 = PKLocalizedFeatureString(@"TRANSACTION_ACCOUNT_NAME", 5LL);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(v33);
        uint64_t v34 = PKLocalizedFeatureString(@"TRANSACTION_TYPE_INTEREST_PAID", 5LL);
        id v16 = (id)objc_claimAutoreleasedReturnValue(v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction transactionDate](self->_paymentTransaction, "transactionDate"));
        uint64_t v36 = PKStartOfMonth(v35);
        id v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
        uint64_t v38 = PKEndOfMonth(v35);
        objc_super v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
        uint64_t v40 = PKDatesMidpoint(v37, v39);
        uint64_t v41 = objc_claimAutoreleasedReturnValue(v40);

        v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSCalendar calendarWithIdentifier:]( &OBJC_CLASS___NSCalendar,  "calendarWithIdentifier:",  NSCalendarIdentifierGregorian));
        v43 = (void *)objc_claimAutoreleasedReturnValue([v42 components:16 fromDate:v35]);
        id v91 = [v43 day];

        v94 = v42;
        v92 = (void *)v41;
        v44 = (void *)objc_claimAutoreleasedReturnValue([v42 components:16 fromDate:v41]);
        id v45 = [v44 day];

        v93 = v35;
        if ((uint64_t)v91 <= (uint64_t)v45)
        {
          uint64_t Month = PKStartOfLastMonth(v35);
          id v46 = (id)objc_claimAutoreleasedReturnValue(Month);
        }

        else
        {
          id v46 = v35;
        }

        v69 = v46;
        v70 = (void *)objc_claimAutoreleasedReturnValue([v94 components:8 fromDate:v46]);
        id v71 = [v70 month];

        uint64_t v72 = PKGregorianMonthSpecificLocalizedStringKeyForKey(@"TRANSACTION_INTEREST", v71);
        v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
        v90 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassPaymentTransactionUserNotification _absoluteAmountString](self, "_absoluteAmountString"));
        uint64_t v74 = PKLocalizedFeatureString(v73, 5LL, @"%@");
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v74);

        v75 = v94;
        v51 = v92;
        v49 = v93;
LABEL_82:

        if (v15) {
          [v96 setTitle:v15];
        }
LABEL_84:
        v22 = 0LL;
      }

      else
      {
        v24 = @"TRANSACTION_TYPE_INTEREST_CHARGE";
LABEL_41:
        uint64_t v64 = PKLocalizedPaymentString(&v24->isa);
        uint64_t v31 = objc_claimAutoreleasedReturnValue(v64);
LABEL_42:
        id v16 = (id)v31;
LABEL_43:
        uint64_t v32 = objc_claimAutoreleasedReturnValue(-[PDPassPaymentTransactionUserNotification _statusString](self, "_statusString"));
LABEL_44:
        uint64_t v20 = (void *)v32;
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassPaymentTransactionUserNotification _amountString](self, "_amountString"));
LABEL_45:
        id v15 = 0LL;
      }

- (id)_locationString
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction merchant](self->_paymentTransaction, "merchant"));
  if (v3
    || (id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction displayLocation](self->_paymentTransaction, "displayLocation")),
        v4,
        v4))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction merchant](self->_paymentTransaction, "merchant"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 displayName]);
    [v5 safelyAddObject:v7];

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction displayLocation](self->_paymentTransaction, "displayLocation"));
    [v5 safelyAddObject:v8];

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:NSLocaleGroupingSeparator]);
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ ", v10));

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 componentsJoinedByString:v11]);
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  return v12;
}

- (id)_statusString
{
  paymentTransaction = self->_paymentTransaction;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassPaymentTransactionUserNotification _personContact](self, "_personContact"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[PKPaymentTransaction transactionNotificationStatusStringForTransaction:personContact:]( &OBJC_CLASS___PKPaymentTransaction,  "transactionNotificationStatusStringForTransaction:personContact:",  paymentTransaction,  v3));

  return v4;
}

- (id)_amountString
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction amount](self->_paymentTransaction, "amount"));
  if (v3)
  {
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction amounts](self->_paymentTransaction, "amounts"));

    if (!v4) {
      return v4;
    }
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction amount](self->_paymentTransaction, "amount"));

  if (v5) {
    uint64_t v6 = objc_claimAutoreleasedReturnValue( -[PKPaymentTransaction formattedBalanceAdjustmentAmount]( self->_paymentTransaction,  "formattedBalanceAdjustmentAmount"));
  }
  else {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(-[PDPassPaymentTransactionUserNotification _amountsString](self, "_amountsString"));
  }
  id v4 = (void *)v6;
  if (!-[PKPaymentTransaction transactionType](self->_paymentTransaction, "transactionType")
    && -[PKPaymentTransaction isIssuerInstallmentTransaction]( self->_paymentTransaction,  "isIssuerInstallmentTransaction"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentOfferInstallmentCriteria programName](self->_installmentCriteria, "programName"));
    uint64_t v8 = v7;
    if (self->_installmentCriteria && v7)
    {
      id v9 = v7;
    }

    else
    {
      uint64_t v10 = PKLocalizedPaymentOffersString(@"TRANSACTION_NOTIFICATION_PAY_LATER_PURCHASE");
      id v9 = (id)objc_claimAutoreleasedReturnValue(v10);
    }

    id v11 = v9;

    id v4 = v11;
  }

  return v4;
}

- (id)_absoluteAmountString
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction currencyAmount](self->_paymentTransaction, "currencyAmount"));
  if (v3)
  {
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction amounts](self->_paymentTransaction, "amounts"));

    if (!v4)
    {
      id v7 = 0LL;
      return v7;
    }
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction currencyAmount](self->_paymentTransaction, "currencyAmount"));

  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction currencyAmount](self->_paymentTransaction, "currencyAmount"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 formattedStringValue]);
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassPaymentTransactionUserNotification _amountsString](self, "_amountsString"));
  }

  return v7;
}

- (id)_amountsString
{
  id v3 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction amounts](self->_paymentTransaction, "amounts", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      uint64_t v8 = 0LL;
      id v9 = v3;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v20 + 1) + 8 * (void)v8) amount]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 amount]);

        id v3 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue(-[NSDecimalNumber decimalNumberByAdding:](v9, "decimalNumberByAdding:", v11));
        uint64_t v8 = (char *)v8 + 1;
        id v9 = v3;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v6);
  }

  uint64_t v12 = (NSString *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction currencyCode](self->_paymentTransaction, "currencyCode"));
  if (!v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction amounts](self->_paymentTransaction, "amounts"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 amount]);
    uint64_t v12 = (NSString *)objc_claimAutoreleasedReturnValue([v15 currency]);
  }

  id v16 = 0LL;
  if (v3 && v12)
  {
    uint64_t v17 = PKCurrencyAmountCreate(v3, v12, 0LL);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v18 formattedStringValue]);
  }

  return v16;
}

- (id)_awardsString
{
  return -[PKPaymentTransaction formattedAwards](self->_paymentTransaction, "formattedAwards");
}

- (id)_personContact
{
  familyMember = self->_familyMember;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccountUser nameComponents](self->_accountUser, "nameComponents"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[PKContactResolver contactForFamilyMember:nameComponents:imageData:]( &OBJC_CLASS___PKContactResolver,  "contactForFamilyMember:nameComponents:imageData:",  familyMember,  v3,  0LL));

  return v4;
}

- (PKPaymentTransaction)paymentTransaction
{
  return self->_paymentTransaction;
}

- (PKFamilyMember)familyMember
{
  return self->_familyMember;
}

- (PKAccountUser)accountUser
{
  return self->_accountUser;
}

- (PKPaymentOfferInstallmentCriteria)installmentCriteria
{
  return self->_installmentCriteria;
}

- (void).cxx_destruct
{
}

@end
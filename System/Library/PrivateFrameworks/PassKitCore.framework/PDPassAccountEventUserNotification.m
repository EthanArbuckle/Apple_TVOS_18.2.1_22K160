@interface PDPassAccountEventUserNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)_hasSummaryTile;
- (BOOL)isValid;
- (BOOL)requiresDebtCollectionNotices;
- (BOOL)shouldShowNotification;
- (NSString)transactionSourceIdentifier;
- (PDPassAccountEventUserNotification)initWithCoder:(id)a3;
- (PDPassAccountEventUserNotification)initWithPassUniqueIdentifier:(id)a3 transactionSourceIdentifier:(id)a4 accountEvent:(id)a5 featureIdentifier:(unint64_t)a6 requiresDebtCollectionNotices:(BOOL)a7;
- (PKAccountEvent)accountEvent;
- (id)_accountEventApplicationMessageContentWithTitleText:(id)a3 messageText:(id)a4;
- (id)_accountEventApplicationMessageGroupDescriptor;
- (id)_messageString;
- (id)_subtitleString;
- (id)applicationMessageContent;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)featureIdentifier;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPassAccountEventUserNotification

- (PDPassAccountEventUserNotification)initWithPassUniqueIdentifier:(id)a3 transactionSourceIdentifier:(id)a4 accountEvent:(id)a5 featureIdentifier:(unint64_t)a6 requiresDebtCollectionNotices:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = v14;
  if (v12 && v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
    v33.receiver = self;
    v33.super_class = (Class)&OBJC_CLASS___PDPassAccountEventUserNotification;
    v17 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v33,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v16,  v12);

    if (v17)
    {
      p_accountEvent = (id *)&v17->_accountEvent;
      objc_storeStrong((id *)&v17->_accountEvent, a5);
      v17->_featureIdentifier = a6;
      v17->_requiresDebtCollectionNotices = a7;
      p_transactionSourceIdentifier = (id *)&v17->_transactionSourceIdentifier;
      objc_storeStrong((id *)&v17->_transactionSourceIdentifier, a4);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccountEvent date](v17->_accountEvent, "date"));
      -[PDUserNotification setDate:](v17, "setDate:", v20);

      if (-[PKAccountEvent type](v17->_accountEvent, "type") == (id)4)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue([*p_accountEvent items]);
        v22 = (void *)objc_claimAutoreleasedReturnValue([v21 anyObject]);

        v23 = (void *)objc_claimAutoreleasedReturnValue([v22 activityIdentifier]);
        v24 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        if ([v23 length])
        {
          -[PDUserNotification setCustomActionRoute:]( v17,  "setCustomActionRoute:",  PKUserNotificationActionRouteViewTransaction);
          -[NSMutableDictionary setObject:forKey:]( v24,  "setObject:forKey:",  v23,  PKUserNotificationActionQueryItemTransactionIdentifier);
          if ([*p_transactionSourceIdentifier length]) {
            -[NSMutableDictionary setObject:forKey:]( v24,  "setObject:forKey:",  *p_transactionSourceIdentifier,  PKUserNotificationActionQueryItemTransactionSourceIdentifier);
          }
          v25 = (os_log_s *)-[NSMutableDictionary copy](v24, "copy");
          -[PDUserNotification setCustomActionQueryParameters:](v17, "setCustomActionQueryParameters:", v25);
        }

        else
        {
          uint64_t Object = PKLogFacilityTypeGetObject(14LL);
          v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v22;
            _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Missing activity identifier in dispute %@",  buf,  0xCu);
          }
        }
      }

      if ([*p_accountEvent type] == (id)13)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue([*p_accountEvent items]);
        v28 = (void *)objc_claimAutoreleasedReturnValue([v27 anyObject]);

        uint64_t v30 = objc_opt_class(&OBJC_CLASS___PKAccountVirtualCardStatusUpdate, v29);
        if ((objc_opt_isKindOfClass(v28, v30) & 1) != 0 && [v28 reason] == (id)1)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"https://%@/%@/%@/%@",  PKWalletUniversalLinkHostName,  PKURLActionRouteAppleCardPaymentPass,  PKURLActionRouteCreditPaymentPass,  PKURLActionRouteCreditPaymentPassNumbers));
          -[PDUserNotification setCustomActionURLString:](v17, "setCustomActionURLString:", v31);
        }
      }
    }
  }

  else
  {

    v17 = 0LL;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPassAccountEventUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PDPassAccountEventUserNotification;
  v6 = -[PDUserNotification initWithCoder:](&v15, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKAccountEvent, v5),  @"accountEvent");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    accountEvent = v6->_accountEvent;
    v6->_accountEvent = (PKAccountEvent *)v8;

    v6->_featureIdentifier = (unint64_t)[v4 decodeIntegerForKey:@"accountFeatureIdentifier"];
    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v10),  @"transactionSourceIdentifier");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    transactionSourceIdentifier = v6->_transactionSourceIdentifier;
    v6->_transactionSourceIdentifier = (NSString *)v12;

    v6->_requiresDebtCollectionNotices = [v4 decodeBoolForKey:@"debtCollectionNotices"];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDPassAccountEventUserNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeObject:forKey:",  self->_transactionSourceIdentifier,  @"transactionSourceIdentifier",  v5.receiver,  v5.super_class);
  [v4 encodeObject:self->_accountEvent forKey:@"accountEvent"];
  [v4 encodeInteger:self->_featureIdentifier forKey:@"accountFeatureIdentifier"];
  [v4 encodeBool:self->_requiresDebtCollectionNotices forKey:@"debtCollectionNotices"];
}

- (unint64_t)notificationType
{
  return 17LL;
}

- (BOOL)isValid
{
  if (-[PDPassAccountEventUserNotification shouldShowNotification](self, "shouldShowNotification"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccountEvent expirationDate](self->_accountEvent, "expirationDate"));
    if (v4
      && (v2 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccountEvent expirationDate](self->_accountEvent, "expirationDate")),
          [v2 timeIntervalSinceNow],
          v5 <= 0.0))
    {
      BOOL v6 = 0;
    }

    else
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccountEvent date](self->_accountEvent, "date"));
      [v7 timeIntervalSinceNow];
      BOOL v6 = fabs(v8) <= 43200.0;

      if (!v4)
      {
LABEL_8:

        return v6;
      }
    }

    goto LABEL_8;
  }

  return 0;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PDPassAccountEventUserNotification;
  id v4 = -[PDUserNotification notificationContentWithDataSource:](&v10, "notificationContentWithDataSource:", a3);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (-[PKAccountEvent type](self->_accountEvent, "type") == (id)17) {
    [v5 setInterruptionLevel:2];
  }
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassAccountEventUserNotification _subtitleString](self, "_subtitleString"));
  [v5 setSubtitle:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassAccountEventUserNotification _messageString](self, "_messageString"));
  [v5 setBody:v7];

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccountEvent date](self->_accountEvent, "date"));
  [v5 setDate:v8];

  return v5;
}

- (id)applicationMessageContent
{
  if (-[PDPassAccountEventUserNotification _hasSummaryTile](self, "_hasSummaryTile"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassAccountEventUserNotification _subtitleString](self, "_subtitleString"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassAccountEventUserNotification _messageString](self, "_messageString"));
    double v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDPassAccountEventUserNotification _accountEventApplicationMessageContentWithTitleText:messageText:]( self,  "_accountEventApplicationMessageContentWithTitleText:messageText:",  v3,  v4));
  }

  else
  {
    double v5 = 0LL;
  }

  return v5;
}

- (BOOL)_hasSummaryTile
{
  if (-[PKAccountEvent type](self->_accountEvent, "type") != (id)12) {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccountEvent items](self->_accountEvent, "items"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 anyObject]);

  unint64_t v5 = (unint64_t)[v4 shippingStatus];
  BOOL v7 = v5 < 5 && (v5 & 0x1F) == 3;

  return v7;
}

- (id)_accountEventApplicationMessageGroupDescriptor
{
  uint64_t v2 = PKLocalizedFeatureString(@"APPLICATION_MESSAGE_SUMMARY", 2LL);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = +[PKApplicationMessageGroupDescriptor createForIdentifier:withSingularSummary:pluralSummary:]( &OBJC_CLASS___PKApplicationMessageGroupDescriptor,  "createForIdentifier:withSingularSummary:pluralSummary:",  @"PDPassAccountEventApplicationMessageGroupIdentifier",  v3,  v3);

  return v4;
}

- (id)_accountEventApplicationMessageContentWithTitleText:(id)a3 messageText:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDPassAccountEventUserNotification _accountEventApplicationMessageGroupDescriptor]( self,  "_accountEventApplicationMessageGroupDescriptor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification actionURL](self, "actionURL"));
  id v10 = +[PKApplicationMessageActionURL createWithURL:]( &OBJC_CLASS___PKApplicationMessageActionURL,  "createWithURL:",  v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[PDUserNotification applicationMessageIconForFeature:]( &OBJC_CLASS___PDUserNotification,  "applicationMessageIconForFeature:",  2LL));
  id v12 = +[PKApplicationMessageContentDefault createWithGroup:action:icon:title:body:]( &OBJC_CLASS___PKApplicationMessageContentDefault,  "createWithGroup:action:icon:title:body:",  v8,  v10,  v11,  v7,  v6);

  return v12;
}

- (BOOL)shouldShowNotification
{
  unsigned int v3 = -[PKAccountEvent blockNotification](self->_accountEvent, "blockNotification");
  if ((v3 & 1) != 0
    || -[PKAccountEvent updateReasonIsInitialDownload]( self->_accountEvent,  "updateReasonIsInitialDownload"))
  {
    uint64_t Object = PKLogFacilityTypeGetObject(14LL);
    unint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (v3) {
        id v6 = @"YES";
      }
      else {
        id v6 = @"NO";
      }
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccountEvent updateReasonsDescription](self->_accountEvent, "updateReasonsDescription"));
      int v21 = 138412546;
      v22 = v6;
      __int16 v23 = 2112;
      v24 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Preventing event notification, block: %@, update reasons %@",  (uint8_t *)&v21,  0x16u);
    }

    goto LABEL_9;
  }

  LOBYTE(v8) = 1;
  switch((unint64_t)-[PKAccountEvent type](self->_accountEvent, "type"))
  {
    case 1uLL:
    case 2uLL:
    case 5uLL:
    case 8uLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccountEvent items](self->_accountEvent, "items"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 anyObject]);

      uint64_t v13 = objc_opt_class(&OBJC_CLASS___PKAccountVirtualCardStatusUpdate, v12);
      if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0 && [v11 reason] == (id)1) {
        goto LABEL_14;
      }
      goto LABEL_29;
    case 4uLL:
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccountEvent items](self->_accountEvent, "items"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v14 anyObject]);

      if (!v11)
      {
        LOBYTE(v8) = 0;
        goto LABEL_27;
      }

      double v8 = (void *)objc_claimAutoreleasedReturnValue([v11 activityIdentifier]);

      if (!v8) {
        goto LABEL_27;
      }
      if ((char *)[v11 status] - 3 <= (char *)2
        && ((unint64_t)[v11 activityType] | 4) == 5)
      {
        LOBYTE(v8) = 1;
LABEL_27:

        return (char)v8;
      }

- (id)_subtitleString
{
  unsigned int v3 = 0LL;
  switch((unint64_t)-[PKAccountEvent type](self->_accountEvent, "type"))
  {
    case 1uLL:
    case 5uLL:
    case 8uLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
      id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccountEvent items](self->_accountEvent, "items"));
      unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 anyObject]);

      uint64_t v7 = objc_opt_class(&OBJC_CLASS___PKAccountVirtualCardStatusUpdate, v6);
      if ((objc_opt_isKindOfClass(v5, v7) & 1) == 0 || [v5 reason] != (id)1) {
        goto LABEL_20;
      }
      unint64_t featureIdentifier = self->_featureIdentifier;
      v9 = @"ACCOUNT_SERVICE_VIRTUAL_CARD_EXPIRED_REISSUED_NOTIFICATION_TITLE";
      goto LABEL_17;
    case 4uLL:
      unint64_t v10 = self->_featureIdentifier;
      id v11 = @"ACCOUNT_NOTIFICATION_DISPUTE_UPDATE_TITLE";
      goto LABEL_9;
    case 6uLL:
      unint64_t v10 = self->_featureIdentifier;
      id v11 = @"ACCOUNT_NOTIFICATION_PAYMENT_POSTED_TITLE";
      goto LABEL_9;
    case 7uLL:
      unint64_t v10 = self->_featureIdentifier;
      id v11 = @"ACCOUNT_SERVICE_PAYMENT_GENERIC_ACCOUNT_STATUS_NOTIFICATION_TITLE";
      goto LABEL_9;
    case 0xBuLL:
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccountEvent items](self->_accountEvent, "items"));
      unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v13 anyObject]);

      if ([v5 reason] != (id)7) {
        goto LABEL_20;
      }
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 updatedPhysicalCards]);
      objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v14 firstObject]);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 latestOrderActivity]);

      if (!v16) {
        goto LABEL_19;
      }
      id v17 = [v16 activity];
      if (v17 == (id)3)
      {
        v18 = @"ACCOUNT_SERVICE_PHYSICAL_CARD_FIX_ADDRESS_EVENT";
      }

      else
      {
        if (v17 != (id)4)
        {
LABEL_19:

LABEL_20:
          unsigned int v3 = 0LL;
          return v3;
        }

        v18 = @"ACCOUNT_SERVICE_PHYSICAL_CARD_ERROR_EVENT";
      }

      uint64_t v23 = PKLocalizedFeatureString(v18, self->_featureIdentifier);
      unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(v23);

LABEL_18:
      return v3;
    case 0xCuLL:
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccountEvent items](self->_accountEvent, "items"));
      unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v19 anyObject]);

      v20 = (char *)[v5 shippingStatus];
      v9 = off_10064D580[(void)(v20 - 1)];
      unint64_t featureIdentifier = self->_featureIdentifier;
LABEL_17:
      uint64_t v21 = PKLocalizedFeatureString(v9, featureIdentifier);
      unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(v21);
      goto LABEL_18;
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
      unint64_t v10 = self->_featureIdentifier;
      id v11 = @"ACCOUNT_NOTIFICATION_IMPORTANT_UPDATE_SUBTITLE";
LABEL_9:
      uint64_t v12 = PKLocalizedFeatureString(v11, v10);
      unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(v12);
      return v3;
    default:
      return v3;
  }

- (id)_messageString
{
  id v4 = 0LL;
  switch((unint64_t)-[PKAccountEvent type](self->_accountEvent, "type"))
  {
    case 1uLL:
    case 5uLL:
    case 8uLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
      unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccountEvent items](self->_accountEvent, "items"));
      uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue([v5 anyObject]);

      uint64_t v8 = objc_opt_class(&OBJC_CLASS___PKAccountVirtualCardStatusUpdate, v7);
      if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0 || -[__CFString reason](v6, "reason") != (id)1) {
        goto LABEL_23;
      }
      unint64_t featureIdentifier = self->_featureIdentifier;
      unint64_t v10 = @"ACCOUNT_SERVICE_VIRTUAL_CARD_EXPIRED_REISSUED_NOTIFICATION_BODY";
      goto LABEL_12;
    case 4uLL:
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccountEvent items](self->_accountEvent, "items"));
      uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue([v12 anyObject]);

      uint64_t v13 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
      -[NSDateFormatter setDateStyle:](v13, "setDateStyle:", 2LL);
      unint64_t v14 = self->_featureIdentifier;
      objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString openDate](v6, "openDate"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v13, "stringFromDate:", v15));
      id v17 = @"ACCOUNT_NOTIFICATION_DISPUTE_UPDATE_MESSAGE";
      goto LABEL_9;
    case 6uLL:
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccountEvent items](self->_accountEvent, "items"));
      uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue([v18 anyObject]);

      uint64_t v13 = (NSDateFormatter *)objc_claimAutoreleasedReturnValue(-[__CFString currencyAmount](v6, "currencyAmount"));
      unint64_t v14 = self->_featureIdentifier;
      if (!v13)
      {
        v26 = @"ACCOUNT_NOTIFICATION_PAYMENT_POSTED_MESSAGE_NO_AMOUNT";
        unint64_t v32 = v14;
        goto LABEL_29;
      }

      objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString currencyAmount](v6, "currencyAmount"));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 minimalFormattedStringValue]);
      id v17 = @"ACCOUNT_NOTIFICATION_PAYMENT_POSTED_MESSAGE";
LABEL_9:
      uint64_t v19 = PKLocalizedFeatureString(v17, v14, @"%@");
      id v4 = (void *)objc_claimAutoreleasedReturnValue(v19);

      goto LABEL_31;
    case 7uLL:
      id v11 = @"ACCOUNT_SERVICE_PAYMENT_GENERIC_ACCOUNT_STATUS_NOTIFICATION_BODY";
      goto LABEL_11;
    case 0xBuLL:
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccountEvent items](self->_accountEvent, "items"));
      uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue([v22 anyObject]);

      if (-[__CFString reason](v6, "reason") != (id)7) {
        goto LABEL_23;
      }
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString updatedPhysicalCards](v6, "updatedPhysicalCards"));
      v24 = (void *)objc_claimAutoreleasedReturnValue([v23 firstObject]);
      uint64_t v13 = (NSDateFormatter *)objc_claimAutoreleasedReturnValue([v24 latestOrderActivity]);

      if (!v13) {
        goto LABEL_22;
      }
      id v25 = -[NSDateFormatter activity](v13, "activity");
      if (v25 == (id)3)
      {
        v26 = @"ACCOUNT_SERVICE_PHYSICAL_CARD_FIX_ADDRESS_EVENT_DETAIL";
      }

      else
      {
        if (v25 != (id)4)
        {
LABEL_22:

LABEL_23:
          id v4 = 0LL;
          goto LABEL_32;
        }

        v26 = @"ACCOUNT_SERVICE_PHYSICAL_CARD_GENERIC_ERROR_DETAIL";
      }

      unint64_t v32 = self->_featureIdentifier;
LABEL_29:
      uint64_t v33 = PKLocalizedFeatureString(v26, v32);
      uint64_t v31 = objc_claimAutoreleasedReturnValue(v33);
LABEL_30:
      id v4 = (void *)v31;
LABEL_31:

LABEL_32:
      return v4;
    case 0xCuLL:
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccountEvent items](self->_accountEvent, "items"));
      uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue([v27 anyObject]);

      switch((unint64_t)-[__CFString shippingStatus](v6, "shippingStatus"))
      {
        case 1uLL:
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString estimatedDeliveryDate](v6, "estimatedDeliveryDate"));

          unint64_t v29 = self->_featureIdentifier;
          if (v28)
          {
            uint64_t v13 = (NSDateFormatter *)objc_claimAutoreleasedReturnValue( -[__CFString formattedEstimatedDeliveryDate]( v6,  "formattedEstimatedDeliveryDate"));
            uint64_t v30 = PKLocalizedFeatureString( @"ACCOUNT_SERVICE_PHYSICAL_CARD_SHIPPED_EVENT_DETAIL",  v29,  @"%@");
            uint64_t v31 = objc_claimAutoreleasedReturnValue(v30);
            goto LABEL_30;
          }

          unint64_t v10 = @"ACCOUNT_SERVICE_PHYSICAL_CARD_SHIPPED_EVENT_DETAIL_NO_DATE";
          unint64_t featureIdentifier = v29;
          break;
        case 2uLL:
          unint64_t featureIdentifier = self->_featureIdentifier;
          unint64_t v10 = @"ACCOUNT_SERVICE_PHYSICAL_CARD_OUT_FOR_DELIVERY_EVENT_DETAIL";
          goto LABEL_12;
        case 3uLL:
          unint64_t featureIdentifier = self->_featureIdentifier;
          unint64_t v10 = @"ACCOUNT_SERVICE_PHYSICAL_CARD_DELIVERED_EVENT_DETAIL";
          goto LABEL_12;
        case 4uLL:
          unint64_t featureIdentifier = self->_featureIdentifier;
          unint64_t v10 = @"ACCOUNT_SERVICE_PHYSICAL_CARD_DELIVERY_EXCEPTION_EVENT_DETAIL";
          goto LABEL_12;
        default:
          goto LABEL_23;
      }

      goto LABEL_12;
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
      id v11 = @"ACCOUNT_NOTIFICATION_IMPORTANT_UPDATE_MESSAGE";
LABEL_11:
      uint64_t v20 = PDDeviceSpecificLocalizedStringKeyForKey(v11, v3);
      unint64_t v10 = (const __CFString *)objc_claimAutoreleasedReturnValue(v20);
      uint64_t v6 = (__CFString *)v10;
      unint64_t featureIdentifier = self->_featureIdentifier;
LABEL_12:
      uint64_t v21 = PKLocalizedFeatureString(v10, featureIdentifier);
      id v4 = (void *)objc_claimAutoreleasedReturnValue(v21);
      goto LABEL_32;
    default:
      return v4;
  }

- (PKAccountEvent)accountEvent
{
  return self->_accountEvent;
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (BOOL)requiresDebtCollectionNotices
{
  return self->_requiresDebtCollectionNotices;
}

- (NSString)transactionSourceIdentifier
{
  return self->_transactionSourceIdentifier;
}

- (void).cxx_destruct
{
}

@end
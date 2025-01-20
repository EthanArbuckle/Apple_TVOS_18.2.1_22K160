@interface PDAccountPaymentDueUserNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isTimeSensitive;
- (BOOL)isValid;
- (BOOL)useGenericMessaging;
- (NSString)messageString;
- (PDAccountPaymentDueUserNotification)initWithAccount:(id)a3 estimatedRemainingMinimumPayment:(id)a4 reminderOffset:(unint64_t)a5;
- (PDAccountPaymentDueUserNotification)initWithCoder:(id)a3;
- (id)_messageString;
- (id)_messageStringForAccount:(id)a3 amount:(id)a4 reminderOffset:(unint64_t)a5 fireDate:(id)a6;
- (id)_paymentDueApplicationMessageContentWithTitleText:(id)a3 messageText:(id)a4;
- (id)_paymentDueApplicationMessageGroupDescriptor;
- (id)_titleString;
- (id)applicationMessageContent;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)featureIdentifier;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
- (void)setIsTimeSensitive:(BOOL)a3;
@end

@implementation PDAccountPaymentDueUserNotification

- (PDAccountPaymentDueUserNotification)initWithAccount:(id)a3 estimatedRemainingMinimumPayment:(id)a4 reminderOffset:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v8 creditDetails]);
    v11 = (PDAccountPaymentDueUserNotification *)objc_claimAutoreleasedReturnValue([v10 accountSummary]);

    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PDAccountPaymentDueUserNotification currentStatement](v11, "currentStatement"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountPaymentDueUserNotification paymentDueDate](v11, "paymentDueDate"));
    v14 = v13;
    if (!v13)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(14LL);
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v54 = 0LL;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Ignoring evaluation of payment due notification with paymentDueDate: %@",  buf,  0xCu);
      }

      v28 = 0LL;
      goto LABEL_48;
    }

    v50 = v12;
    id v51 = v9;
    v15 = (void *)objc_claimAutoreleasedReturnValue([v8 creditDetails]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 createdDate]);
    v49 = v14;
    id v17 = v14;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 components:28 fromDate:v17]);
    [v19 setHour:8];
    v20 = (void *)objc_claimAutoreleasedReturnValue([v18 dateFromComponents:v19]);
    [v17 timeIntervalSinceDate:v20];
    double v22 = v21;

    v48 = self;
    if (a5)
    {
      if (a5 == 2) {
        uint64_t v23 = -7LL;
      }
      else {
        uint64_t v23 = -1LL;
      }
      [v19 setHour:18];
      if (a5 == 1 && v22 < 35997.0) {
        [v19 setHour:8];
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue([v18 dateFromComponents:v19]);
      v25 = v18;
      uint64_t v26 = v23;
    }

    else
    {
      if (v22 >= 35997.0)
      {
LABEL_22:
        [v16 timeIntervalSince1970];
        self = (PDAccountPaymentDueUserNotification *)objc_claimAutoreleasedReturnValue( [v20 dateByAddingTimeInterval:(double)(18000 * ((uint64_t)v32 / 18000) - (uint64_t)v32)]);

        v14 = v49;
        if (self)
        {
          v12 = v50;
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s identifier](v50, "identifier"));
          id v9 = v51;
          if (a5 > 2) {
            v34 = 0LL;
          }
          else {
            v34 = off_10064D538[a5];
          }
          v30 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"PaymentDue-%@-%@",  v34,  v33));

          v36 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 associatedPassUniqueID]);
          v52.receiver = v48;
          v52.super_class = (Class)&OBJC_CLASS___PDAccountPaymentDueUserNotification;
          v28 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v52,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v30,  v36);
          if (v28)
          {
            v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
            if ([v37 compare:v51] == (id)-1) {
              v38 = v51;
            }
            else {
              v38 = 0LL;
            }
            id v39 = v38;

            v40 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountPaymentDueUserNotification pastDueAmount](v11, "pastDueAmount"));
            v28->_featureIdentifier = (unint64_t)[v8 feature];
            unsigned __int8 v41 = -[PDAccountPaymentDueUserNotification requiresDebtCollectionNotices]( v11,  "requiresDebtCollectionNotices");
            if ((v41 & 1) != 0 || !v40)
            {
              v28->_useGenericMessaging = v41;
            }

            else
            {
              v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
              v28->_useGenericMessaging = [v42 compare:v40] == (id)-1;
            }

            uint64_t v43 = objc_claimAutoreleasedReturnValue( -[PDAccountPaymentDueUserNotification _messageStringForAccount:amount:reminderOffset:fireDate:]( v28,  "_messageStringForAccount:amount:reminderOffset:fireDate:",  v8,  v39,  a5,  self));
            messageString = v28->_messageString;
            v28->_messageString = (NSString *)v43;

            if (a5) {
              BOOL v45 = 1;
            }
            else {
              BOOL v45 = v39 == 0LL;
            }
            uint64_t v46 = !v45;
            -[PDUserNotification setPreventAutomaticDismissal:](v28, "setPreventAutomaticDismissal:", v46);
            if (v28->_messageString)
            {
              -[PDUserNotification setDate:](v28, "setDate:", self);
              -[PDUserNotification setCustomActionRoute:]( v28,  "setCustomActionRoute:",  PKUserNotificationActionRouteAccountServiceSchedulePayment);
            }

            else
            {

              v28 = 0LL;
            }

            v14 = v49;

            v12 = v50;
            id v9 = v51;
          }
        }

        else
        {
          uint64_t v35 = PKLogFacilityTypeGetObject(14LL);
          v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
          v12 = v50;
          id v9 = v51;
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Ignoring evaluation of payment due notification with nil fireDate",  buf,  2u);
          }

          v28 = 0LL;
          v30 = (os_log_s *)v48;
        }

LABEL_48:
        goto LABEL_49;
      }

      [v19 setHour:18];
      v24 = (void *)objc_claimAutoreleasedReturnValue([v18 dateFromComponents:v19]);
      v25 = v18;
      uint64_t v26 = -1LL;
    }

    uint64_t v31 = objc_claimAutoreleasedReturnValue([v25 dateByAddingUnit:16 value:v26 toDate:v24 options:0]);

    v20 = (void *)v31;
    goto LABEL_22;
  }

  uint64_t v27 = PKLogFacilityTypeGetObject(14LL);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Ignoring evaluation of payment due notification with nil account",  buf,  2u);
  }

  v28 = 0LL;
  v11 = self;
LABEL_49:

  return v28;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDAccountPaymentDueUserNotification)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PDAccountPaymentDueUserNotification;
  id v3 = a3;
  v4 = -[PDUserNotification initWithCoder:](&v10, "initWithCoder:", v3);
  v4->_featureIdentifier = (unint64_t)objc_msgSend( v3,  "decodeIntegerForKey:",  @"accountFeatureIdentifier",  v10.receiver,  v10.super_class);
  v4->_useGenericMessaging = [v3 decodeBoolForKey:@"useGenericMessaging"];
  id v6 = objc_msgSend( v3,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v5),  @"messageString");
  uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);

  messageString = v4->_messageString;
  v4->_messageString = (NSString *)v7;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDAccountPaymentDueUserNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeInteger:forKey:",  self->_featureIdentifier,  @"accountFeatureIdentifier",  v5.receiver,  v5.super_class);
  [v4 encodeBool:self->_useGenericMessaging forKey:@"useGenericMessaging"];
  [v4 encodeObject:self->_messageString forKey:@"messageString"];
}

- (id)_titleString
{
  unint64_t featureIdentifier = self->_featureIdentifier;
  if (self->_useGenericMessaging) {
    id v3 = @"ACCOUNT_SERVICE_PAYMENT_GENERIC_ACCOUNT_STATUS_NOTIFICATION_TITLE";
  }
  else {
    id v3 = @"ACCOUNT_SERVICE_PAYMENT_REMINDER_NOTIFICATION_TITLE";
  }
  uint64_t v4 = PKLocalizedFeatureString(v3, featureIdentifier);
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)_messageStringForAccount:(id)a3 amount:(id)a4 reminderOffset:(unint64_t)a5 fireDate:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue([a3 creditDetails]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 accountSummary]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 paymentDueDate]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v12 currencyCode]);
  unsigned int v16 = [v13 inGrace];
  if (qword_100707AA0 == -1)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_30:
    if (a5 == 2)
    {
      v56 = @"ACCOUNT_SERVICE_PAYMENT_REMINDER_NOTIFICATION_STATEMENT_BALANCE_7_DAYS_BODY_REVOLVER_FORMAT";
      if (v16) {
        v56 = @"ACCOUNT_SERVICE_PAYMENT_REMINDER_NOTIFICATION_STATEMENT_BALANCE_7_DAYS_BODY_TRANSACTOR_FORMAT";
      }
      id v57 = v11;
      unint64_t featureIdentifier = self->_featureIdentifier;
      uint64_t v26 = v56;
      uint64_t v59 = PKLocalizedFeatureString(v26, featureIdentifier);
      id v18 = (id)objc_claimAutoreleasedReturnValue(v59);
      v72 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100707A98 stringFromDate:v14]);
      uint64_t v60 = PKStringWithValidatedFormat(v18, @"%@");
      v29 = (void *)objc_claimAutoreleasedReturnValue(v60);

      id v11 = v57;
      goto LABEL_26;
    }

    if (a5 == 1)
    {
      v61 = @"ACCOUNT_SERVICE_PAYMENT_REMINDER_NOTIFICATION_STATEMENT_BALANCE_1_DAY_BODY_REVOLVER_TEXT";
      if (v16) {
        v61 = @"ACCOUNT_SERVICE_PAYMENT_REMINDER_NOTIFICATION_STATEMENT_BALANCE_1_DAY_BODY_TRANSACTOR_TEXT";
      }
      id v62 = v10;
      v63 = v14;
      v64 = v15;
      id v65 = v11;
      unint64_t v66 = self->_featureIdentifier;
      v67 = v61;
      unint64_t v68 = v66;
      id v11 = v65;
      v15 = v64;
      v14 = v63;
      id v10 = v62;
      id v18 = v67;
      uint64_t v69 = PKLocalizedFeatureString(v67, v68);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v69);
    }

    else
    {
      if (a5)
      {
        v29 = 0LL;
        goto LABEL_28;
      }

      id v75 = v11;
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
      unsigned int v50 = [v49 isDate:v14 inSameDayAsDate:v75];

      id v51 = @"ACCOUNT_SERVICE_PAYMENT_REMINDER_NOTIFICATION_STATEMENT_BALANCE_TOMORROW_BODY_REVOLVER_FORMAT";
      if (v16) {
        id v51 = @"ACCOUNT_SERVICE_PAYMENT_REMINDER_NOTIFICATION_STATEMENT_BALANCE_TOMORROW_BODY_TRANSACTOR_FORMAT";
      }
      objc_super v52 = @"ACCOUNT_SERVICE_PAYMENT_REMINDER_NOTIFICATION_STATEMENT_BALANCE_TODAY_BODY_TRANSACTOR_FORMAT";
      if (!v16) {
        objc_super v52 = @"ACCOUNT_SERVICE_PAYMENT_REMINDER_NOTIFICATION_STATEMENT_BALANCE_TODAY_BODY_REVOLVER_FORMAT";
      }
      if (v50) {
        id v51 = (__CFString *)v52;
      }
      v53 = v51;
      uint64_t v54 = PKLocalizedFeatureString(v53, self->_featureIdentifier);
      id v18 = (id)objc_claimAutoreleasedReturnValue(v54);
      v71 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100707A90 stringFromDate:v14]);
      uint64_t v55 = PKStringWithValidatedFormat(v18, @"%@");
      v29 = (void *)objc_claimAutoreleasedReturnValue(v55);

      id v11 = v75;
    }

    goto LABEL_27;
  }

  dispatch_once(&qword_100707AA0, &stru_10064D4E8);
  if (!v10) {
    goto LABEL_30;
  }
LABEL_3:
  uint64_t v17 = objc_claimAutoreleasedReturnValue([v13 remainingStatementBalance]);
  id v18 = (id)v17;
  switch(a5)
  {
    case 2uLL:
      uint64_t v30 = PKFormattedCurrencyStringFromNumber(v17, v15);
      uint64_t v26 = (__CFString *)objc_claimAutoreleasedReturnValue(v30);
      if (v16) {
        uint64_t v31 = @"ACCOUNT_SERVICE_PAYMENT_REMINDER_NOTIFICATION_MINIMUM_PAYMENT_7_DAYS_BODY_TRANSACTOR_FORMAT";
      }
      else {
        uint64_t v31 = @"ACCOUNT_SERVICE_PAYMENT_REMINDER_NOTIFICATION_MINIMUM_PAYMENT_7_DAYS_BODY_REVOLVER_FORMAT";
      }
      uint64_t v32 = PKLocalizedFeatureString(v31, self->_featureIdentifier);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v32);
      uint64_t v33 = objc_claimAutoreleasedReturnValue([(id)qword_100707A98 stringFromDate:v14]);
      id v74 = v18;
      id v34 = v10;
      uint64_t v35 = v14;
      v36 = v15;
      id v37 = v11;
      v38 = (void *)v33;
      uint64_t v39 = PKStringWithValidatedFormat(v27, @"%@%@");
      v29 = (void *)objc_claimAutoreleasedReturnValue(v39);

      id v11 = v37;
      v15 = v36;
      v14 = v35;
      id v10 = v34;
      id v18 = v74;
      goto LABEL_25;
    case 1uLL:
      uint64_t v40 = PKFormattedCurrencyStringFromNumber(v17, v15);
      uint64_t v26 = (__CFString *)objc_claimAutoreleasedReturnValue(v40);
      if (v16) {
        unsigned __int8 v41 = @"ACCOUNT_SERVICE_PAYMENT_REMINDER_NOTIFICATION_MINIMUM_PAYMENT_1_DAY_BODY_TRANSACTOR_FORMAT";
      }
      else {
        unsigned __int8 v41 = @"ACCOUNT_SERVICE_PAYMENT_REMINDER_NOTIFICATION_MINIMUM_PAYMENT_1_DAY_BODY_REVOLVER_FORMAT";
      }
      uint64_t v42 = PKLocalizedFeatureString(v41, self->_featureIdentifier);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v42);
      uint64_t v43 = PKStringWithValidatedFormat(v27, @"%@");
      v29 = (void *)objc_claimAutoreleasedReturnValue(v43);
LABEL_25:

LABEL_26:
      goto LABEL_27;
    case 0uLL:
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
      id v20 = v11;
      double v21 = v19;
      v73 = v20;
      unsigned int v22 = objc_msgSend(v19, "isDate:inSameDayAsDate:", v14);

      unint64_t v23 = self->_featureIdentifier;
      if (v16)
      {
        if (v22) {
          v24 = @"ACCOUNT_SERVICE_PAYMENT_REMINDER_NOTIFICATION_MINIMUM_PAYMENT_TODAY_BODY_TRANSACTOR_FORMAT";
        }
        else {
          v24 = @"ACCOUNT_SERVICE_PAYMENT_REMINDER_NOTIFICATION_MINIMUM_PAYMENT_TOMORROW_BODY_TRANSACTOR_FORMAT";
        }
        uint64_t v25 = PKLocalizedFeatureString(v24, v23);
        uint64_t v26 = (__CFString *)objc_claimAutoreleasedReturnValue(v25);
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100707A90 stringFromDate:v14]);
        uint64_t v28 = PKStringWithValidatedFormat(v26, @"%@");
        v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      }

      else
      {
        if (v22) {
          v44 = @"ACCOUNT_SERVICE_PAYMENT_REMINDER_NOTIFICATION_MINIMUM_PAYMENT_TODAY_BODY_REVOLVER_FORMAT";
        }
        else {
          v44 = @"ACCOUNT_SERVICE_PAYMENT_REMINDER_NOTIFICATION_MINIMUM_PAYMENT_TOMORROW_BODY_REVOLVER_FORMAT";
        }
        uint64_t v45 = PKLocalizedFeatureString(v44, v23);
        uint64_t v26 = (__CFString *)objc_claimAutoreleasedReturnValue(v45);
        uint64_t v46 = PKFormattedCurrencyStringFromNumber(v10, v15);
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v46);
        v70 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100707A90 stringFromDate:v14]);
        uint64_t v47 = PKStringWithValidatedFormat(v26, @"%@%@");
        v29 = (void *)objc_claimAutoreleasedReturnValue(v47);
      }

      id v11 = v73;
      goto LABEL_25;
  }

  v29 = 0LL;
LABEL_27:

LABEL_28:
  return v29;
}

- (id)_messageString
{
  uint64_t v4 = self->_messageString;
  if (self->_useGenericMessaging)
  {
    uint64_t v5 = PDDeviceSpecificLocalizedStringKeyForKey( @"ACCOUNT_SERVICE_PAYMENT_GENERIC_ACCOUNT_STATUS_NOTIFICATION_BODY",  v3);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    uint64_t v7 = PKLocalizedFeatureString(v6, self->_featureIdentifier);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);

    uint64_t v4 = (NSString *)v8;
  }

  return v4;
}

- (id)applicationMessageContent
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountPaymentDueUserNotification _titleString](self, "_titleString"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[PDAccountPaymentDueUserNotification _paymentDueApplicationMessageContentWithTitleText:messageText:]( self,  "_paymentDueApplicationMessageContentWithTitleText:messageText:",  v3,  self->_messageString));

  return v4;
}

- (id)_paymentDueApplicationMessageGroupDescriptor
{
  uint64_t v2 = PKLocalizedFeatureString(@"APPLICATION_MESSAGE_SUMMARY", 2LL);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = +[PKApplicationMessageGroupDescriptor createForIdentifier:withSingularSummary:pluralSummary:]( &OBJC_CLASS___PKApplicationMessageGroupDescriptor,  "createForIdentifier:withSingularSummary:pluralSummary:",  @"PDPassAccountEventApplicationMessageGroupIdentifier",  v3,  v3);

  return v4;
}

- (id)_paymentDueApplicationMessageContentWithTitleText:(id)a3 messageText:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDAccountPaymentDueUserNotification _paymentDueApplicationMessageGroupDescriptor]( self,  "_paymentDueApplicationMessageGroupDescriptor"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification actionURL](self, "actionURL"));
  id v10 = +[PKApplicationMessageActionURL createWithURL:]( &OBJC_CLASS___PKApplicationMessageActionURL,  "createWithURL:",  v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[PDUserNotification applicationMessageIconForFeature:]( &OBJC_CLASS___PDUserNotification,  "applicationMessageIconForFeature:",  2LL));
  id v12 = +[PKApplicationMessageContentDefault createWithGroup:action:icon:title:body:]( &OBJC_CLASS___PKApplicationMessageContentDefault,  "createWithGroup:action:icon:title:body:",  v8,  v10,  v11,  v7,  v6);

  return v12;
}

- (BOOL)isValid
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountPaymentDueUserNotification _titleString](self, "_titleString"));
  if ([v3 length]) {
    BOOL v4 = -[NSString length](self->_messageString, "length") != 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PDAccountPaymentDueUserNotification;
  id v4 = -[PDUserNotification notificationContentWithDataSource:](&v10, "notificationContentWithDataSource:", a3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountPaymentDueUserNotification _titleString](self, "_titleString"));
  [v5 setSubtitle:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountPaymentDueUserNotification _messageString](self, "_messageString"));
  [v5 setBody:v7];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification date](self, "date"));
  [v5 setDate:v8];

  if (self->_isTimeSensitive) {
    [v5 setInterruptionLevel:2];
  }
  return v5;
}

- (unint64_t)notificationType
{
  return 22LL;
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (BOOL)useGenericMessaging
{
  return self->_useGenericMessaging;
}

- (NSString)messageString
{
  return self->_messageString;
}

- (BOOL)isTimeSensitive
{
  return self->_isTimeSensitive;
}

- (void)setIsTimeSensitive:(BOOL)a3
{
  self->_isTimeSensitive = a3;
}

- (void).cxx_destruct
{
}

@end
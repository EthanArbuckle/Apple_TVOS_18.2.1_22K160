@interface PDAccountPaymentScheduledUserNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (NSString)messageString;
- (PDAccountPaymentScheduledUserNotification)initWithAccount:(id)a3 payment:(id)a4 reminderOffset:(unint64_t)a5;
- (PDAccountPaymentScheduledUserNotification)initWithCoder:(id)a3;
- (id)_messageStringForPayment:(id)a3 account:(id)a4 reminderOffset:(unint64_t)a5;
- (id)_titleString;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)featureIdentifier;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDAccountPaymentScheduledUserNotification

- (PDAccountPaymentScheduledUserNotification)initWithAccount:(id)a3 payment:(id)a4 reminderOffset:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8 && v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v9 paymentDate]);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v11 dateByAddingTimeInterval:21600.0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v12 components:28 fromDate:v13]);
    [v14 setHour:18];
    v15 = (void *)objc_claimAutoreleasedReturnValue([v12 dateFromComponents:v14]);
    v16 = v15;
    uint64_t v17 = 7LL;
    if (a5 != 1) {
      uint64_t v17 = 1LL;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue([v15 dateByAddingTimeInterval:(double)v17 * -86400.0]);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v20 = v19;
    if (v18 && [v19 compare:v18] == (id)1)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(14LL);
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Ignoring evaluation of 'Upcoming Scheduled Payment' notification with fireDate: %@",  buf,  0xCu);
      }

      v23 = self;
    }

    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue([v10 referenceIdentifier]);
      v25 = @"7-Days-Before";
      if (a5 != 1) {
        v25 = 0LL;
      }
      if (!a5) {
        v25 = @"1-Day-Before";
      }
      v23 = (PDAccountPaymentScheduledUserNotification *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"PaymentScheduled-%@-%@",  v25,  v24));

      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 associatedPassUniqueID]);
      v32.receiver = self;
      v32.super_class = (Class)&OBJC_CLASS___PDAccountPaymentScheduledUserNotification;
      self = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v32,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v23,  v22);
      if (!self) {
        goto LABEL_21;
      }
      self->_featureIdentifier = (unint64_t)[v8 feature];
      v26 = (NSString *)objc_claimAutoreleasedReturnValue( -[PDAccountPaymentScheduledUserNotification _messageStringForPayment:account:reminderOffset:]( self,  "_messageStringForPayment:account:reminderOffset:",  v10,  v8,  a5));
      messageString = self->_messageString;
      self->_messageString = v26;

      if (self->_messageString)
      {
        -[PDUserNotification setDate:](self, "setDate:", v18);
        -[PDUserNotification setCustomActionRoute:]( self,  "setCustomActionRoute:",  PKUserNotificationActionRouteAccountServicePaymentDetails);
        uint64_t v28 = objc_claimAutoreleasedReturnValue([v10 referenceIdentifier]);
        v29 = (void *)v28;
        if (v28)
        {
          uint64_t v33 = PKUserNotificationActionQueryItemPaymentReferenceIdentifier;
          uint64_t v34 = v28;
          v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
          -[PDUserNotification setCustomActionQueryParameters:](self, "setCustomActionQueryParameters:", v30);
        }

        goto LABEL_21;
      }
    }

    self = 0LL;
LABEL_21:
  }

  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDAccountPaymentScheduledUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDAccountPaymentScheduledUserNotification;
  v5 = -[PDUserNotification initWithCoder:](&v11, "initWithCoder:", v4);
  if (v5)
  {
    v5->_featureIdentifier = (unint64_t)[v4 decodeIntegerForKey:@"accountFeatureIdentifier"];
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v6),  @"messageString");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    messageString = v5->_messageString;
    v5->_messageString = (NSString *)v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDAccountPaymentScheduledUserNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeInteger:forKey:",  self->_featureIdentifier,  @"accountFeatureIdentifier",  v5.receiver,  v5.super_class);
  [v4 encodeObject:self->_messageString forKey:@"messageString"];
}

- (id)_titleString
{
  return (id)PKLocalizedFeatureString( @"ACCOUNT_SERVICE_PAYMENT_SCHEDULED_NOTIFICATION_TITLE",  self->_featureIdentifier);
}

- (id)_messageStringForPayment:(id)a3 account:(id)a4 reminderOffset:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 paymentDate]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 dateByAddingTimeInterval:21600.0]);

  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v7 creditDetails]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 accountSummary]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 currencyCode]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v12 currentStatement]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v8 scheduleDetails]);
  id v16 = [v15 preset];

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v8 currencyAmount]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 amount]);

  if (qword_100707A88 != -1) {
    dispatch_once(&qword_100707A88, &stru_10064D4C8);
  }
  if (v16 == (id)3)
  {
    v67 = v10;
    id v19 = (id)objc_claimAutoreleasedReturnValue([v12 remainingStatementBalance]);
    uint64_t v26 = objc_claimAutoreleasedReturnValue([v14 statementBalance]);
    v21 = (void *)v26;
    if (v26) {
      v27 = (void *)v26;
    }
    else {
      v27 = v19;
    }
    id v23 = v27;
    if (v21 && v19 && [v19 compare:v21] == (id)-1)
    {
      v62 = self;
      v64 = v14;
      v25 = v13;
      id v41 = v19;

      BOOL v24 = 1;
      id v23 = v41;
    }

    else
    {
      BOOL v24 = v23 == v19;
      if (!v23) {
        goto LABEL_24;
      }
      v62 = self;
      v64 = v14;
      v25 = v13;
    }

    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
    id v43 = [v42 compare:v23];

    if (v43 == (id)-1LL)
    {
      v13 = v25;
      if (a5 != 1)
      {
        v38 = v62;
        if (!a5)
        {
          v39 = @"ACCOUNT_SERVICE_PAYMENT_SCHEDULED_NOTIFICATION_STATEMENT_BALANCE_TOMORROW_BODY_FORMAT";
          v40 = @"ACCOUNT_SERVICE_PAYMENT_SCHEDULED_NOTIFICATION_REMAINING_STATEMENT_BALANCE_TOMORROW_BODY_FORMAT";
          goto LABEL_40;
        }

        goto LABEL_44;
      }

      v50 = @"ACCOUNT_SERVICE_PAYMENT_SCHEDULED_NOTIFICATION_STATEMENT_BALANCE_7_DAYS_BODY_FORMAT";
      v51 = @"ACCOUNT_SERVICE_PAYMENT_SCHEDULED_NOTIFICATION_REMAINING_STATEMENT_BALANCE_7_DAYS_BODY_FORMAT";
LABEL_47:
      if (v24) {
        v52 = v51;
      }
      else {
        v52 = v50;
      }
      uint64_t v53 = PKLocalizedFeatureString(v52, v62->_featureIdentifier);
      uint64_t v54 = objc_claimAutoreleasedReturnValue(v53);
      uint64_t v55 = PKFormattedCurrencyStringFromNumber(v23, v13);
      v48 = (void *)objc_claimAutoreleasedReturnValue(v55);
      v10 = v67;
      v63 = v13;
      v56 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100707A80 stringFromDate:v67]);
      v66 = (void *)v54;
      uint64_t v57 = PKStringWithValidatedFormat(v54, @"%@%@");
      v31 = (void *)objc_claimAutoreleasedReturnValue(v57);

      v13 = v63;
      goto LABEL_51;
    }

- (BOOL)isValid
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountPaymentScheduledUserNotification _titleString](self, "_titleString"));
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
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PDAccountPaymentScheduledUserNotification;
  id v4 = -[PDUserNotification notificationContentWithDataSource:](&v9, "notificationContentWithDataSource:", a3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountPaymentScheduledUserNotification _titleString](self, "_titleString"));
  [v5 setSubtitle:v6];

  [v5 setBody:self->_messageString];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification date](self, "date"));
  [v5 setDate:v7];

  return v5;
}

- (unint64_t)notificationType
{
  return 21LL;
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (NSString)messageString
{
  return self->_messageString;
}

- (void).cxx_destruct
{
}

@end
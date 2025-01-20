@interface PDAccountFundingSourceVerificationReminderUserNotification
+ (BOOL)supportsSecureCoding;
+ (id)_fireDateForVerificationAttempt:(id)a3 withStyle:(unint64_t)a4;
+ (id)identifierForAccountIdentifier:(id)a3 fundingSources:(id)a4 style:(unint64_t)a5;
- (BOOL)isValid;
- (NSArray)fundingSources;
- (PDAccountFundingSourceVerificationReminderUserNotification)initWithAccount:(id)a3 fundingSources:(id)a4 style:(unint64_t)a5;
- (PDAccountFundingSourceVerificationReminderUserNotification)initWithCoder:(id)a3;
- (PKAccount)account;
- (id)_expiryDate;
- (id)applicationMessageContent;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (unint64_t)style;
- (void)_refreshActionURL;
- (void)encodeWithCoder:(id)a3;
- (void)setFundingSources:(id)a3;
@end

@implementation PDAccountFundingSourceVerificationReminderUserNotification

+ (id)identifierForAccountIdentifier:(id)a3 fundingSources:(id)a4 style:(unint64_t)a5
{
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "firstObject", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 fundingDetails]);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___PKAccountPaymentFundingDetailsBankAccount, v9);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v8 verificationDetails]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pendingAttempt]);

    v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _fireDateForVerificationAttempt:v12 withStyle:a5]);
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 components:30 fromDate:v13]);

      if (v15) {
        v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@-%ld-%ld-%ld-%ld-%ld",  @"FSVerificationReminder",  a5,  [v15 era],  objc_msgSend(v15, "year"),  objc_msgSend(v15, "month"),  objc_msgSend(v15, "day")));
      }
      else {
        v16 = 0LL;
      }
    }

    else
    {
      v16 = 0LL;
    }
  }

  else
  {
    v16 = 0LL;
  }

  return v16;
}

+ (id)_fireDateForVerificationAttempt:(id)a3 withStyle:(unint64_t)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(&OBJC_CLASS___NSDateComponents);
  v7 = v6;
  if (a4 == 1)
  {
    -[NSDateComponents setDay:](v6, "setDay:", -3LL);
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 expiryDate]);
  }

  else
  {
    if (a4)
    {
      uint64_t v9 = 0LL;
      goto LABEL_8;
    }

    -[NSDateComponents setDay:](v6, "setDay:", 3LL);
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 sentDate]);
  }

  uint64_t v9 = (void *)v8;
  if (v8)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 components:62 fromDate:v9]);
    [v11 setHour:17];
    uint32_t v12 = arc4random_uniform(0x3840u);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v10 dateFromComponents:v11]);

    v14 = (void *)objc_claimAutoreleasedReturnValue([v10 dateByAddingComponents:v7 toDate:v13 options:0]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v14 dateByAddingTimeInterval:(double)v12]);
  }

- (PDAccountFundingSourceVerificationReminderUserNotification)initWithAccount:(id)a3 fundingSources:(id)a4 style:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (v9 && [v10 count])
  {
    uint32_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 accountIdentifier]);
    id v14 = objc_msgSend( (id)objc_opt_class(self, v13),  "identifierForAccountIdentifier:fundingSources:style:",  v12,  v11,  a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 fundingDetails]);

    uint64_t v19 = objc_opt_class(&OBJC_CLASS___PKAccountPaymentFundingDetailsBankAccount, v18);
    if ((objc_opt_isKindOfClass(v17, v19) & 1) != 0)
    {
      v31 = v15;
      v32 = v12;
      v21 = (void *)objc_opt_class(self, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue([v17 verificationDetails]);
      v23 = (void *)objc_claimAutoreleasedReturnValue([v22 pendingAttempt]);
      v24 = (void *)objc_claimAutoreleasedReturnValue([v21 _fireDateForVerificationAttempt:v23 withStyle:a5]);

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      id v26 = [v25 compare:v24];

      if (v26 == (id)1)
      {
        v27 = 0LL;
        v15 = v31;
        uint32_t v12 = v32;
      }

      else
      {
        v33.receiver = self;
        v33.super_class = (Class)&OBJC_CLASS___PDAccountFundingSourceVerificationReminderUserNotification;
        v15 = v31;
        uint32_t v12 = v32;
        v28 = -[PDUserNotification initWithNotificationIdentifier:forAccountIdentifier:]( &v33,  "initWithNotificationIdentifier:forAccountIdentifier:",  v31,  v32);
        v29 = v28;
        if (v28)
        {
          objc_storeStrong((id *)&v28->_account, a3);
          v29->_style = a5;
          objc_storeStrong((id *)&v29->_fundingSources, a4);
          -[PDAccountFundingSourceVerificationReminderUserNotification _refreshActionURL](v29, "_refreshActionURL");
          -[PDUserNotification setDate:](v29, "setDate:", v24);
          -[PDUserNotification setReissueBannerOnUpdate:](v29, "setReissueBannerOnUpdate:", 0LL);
        }

        self = v29;
        v27 = self;
      }
    }

    else
    {
      v27 = 0LL;
    }
  }

  else
  {
    v27 = 0LL;
  }

  return v27;
}

- (unint64_t)notificationType
{
  return 78LL;
}

- (BOOL)isValid
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(-[PDAccountFundingSourceVerificationReminderUserNotification _expiryDate](self, "_expiryDate"));
  v4 = (void *)v2;
  if (v2 && (PKIsMac(v2, v3) & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    BOOL v5 = [v6 compare:v4] != (id)1;
  }

  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)notificationContentWithDataSource:(id)a3
{
  account = self->_account;
  id v5 = a3;
  id v6 = -[PKAccount feature](account, "feature");
  NSUInteger v7 = -[NSArray count](self->_fundingSources, "count");
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___PDAccountFundingSourceVerificationReminderUserNotification;
  id v8 = -[PDUserNotification notificationContentWithDataSource:](&v28, "notificationContentWithDataSource:", v5);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  unint64_t style = self->_style;
  if (style == 1)
  {
    uint64_t v17 = objc_claimAutoreleasedReturnValue(-[PDAccountFundingSourceVerificationReminderUserNotification _expiryDate](self, "_expiryDate"));
    if (!v17)
    {
      id v25 = 0LL;
      goto LABEL_7;
    }

    uint64_t v18 = (void *)v17;
    NSUInteger v27 = v7;
    uint64_t v19 = PKLocalizedFeatureString(@"ACCOUNT_NOTIFICATION_BANK_VERIFICATION_REMINDER_SUBTITLE", v6, @"%ld");
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    objc_msgSend(v9, "setTitle:", v20, v27);

    uint64_t v21 = PKMediumDayAndLongMonthStringFromDate(v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    uint64_t v23 = PKLocalizedFeatureString( @"ACCOUNT_NOTIFICATION_BANK_VERIFICATION_REMINDER_BODY_URGENT",  v6,  @"%@");
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    objc_msgSend(v9, "setBody:", v24, v22);

    [v9 setInterruptionLevel:2];
  }

  else if (!style)
  {
    uint64_t v11 = PKLocalizedFeatureString(@"ACCOUNT_NOTIFICATION_BANK_VERIFICATION_REMINDER_TITLE", v6);
    uint32_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    [v9 setTitle:v12];

    uint64_t v13 = PKLocalizedFeatureString(@"ACCOUNT_NOTIFICATION_BANK_VERIFICATION_REMINDER_SUBTITLE", v6, @"%ld");
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    objc_msgSend(v9, "setSubtitle:", v14, v7);

    uint64_t v15 = PKLocalizedFeatureString( @"ACCOUNT_NOTIFICATION_BANK_VERIFICATION_REMINDER_BODY_NON_URGENT",  v6,  @"%ld");
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    objc_msgSend(v9, "setBody:", v16, v7);

    [v9 setInterruptionLevel:UNNotificationInterruptionLevelDefault];
  }

  id v25 = v9;
LABEL_7:

  return v25;
}

- (id)applicationMessageContent
{
  if (self->_style == 1)
  {
    id v3 = -[PKAccount feature](self->_account, "feature");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountFundingSourceVerificationReminderUserNotification _expiryDate](self, "_expiryDate"));
    if (v4)
    {
      -[NSArray count](self->_fundingSources, "count");
      uint64_t v5 = PKLocalizedFeatureString(@"ACCOUNT_NOTIFICATION_BANK_VERIFICATION_REMINDER_SUBTITLE", v3, @"%ld");
      id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      uint64_t v7 = PKMediumDayAndLongMonthStringFromDate(v4);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v7);
      uint64_t v8 = PKLocalizedFeatureString( @"ACCOUNT_NOTIFICATION_BANK_VERIFICATION_REMINDER_BODY_URGENT",  v3,  @"%@");
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification accountIdentifier](self, "accountIdentifier", v18));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( [@"PDSavingsAccountApplicationMessageGroupIdentifier" stringByAppendingString:v10]);

      id v12 = +[PKApplicationMessageGroupDescriptor createForIdentifier:withSingularSummary:pluralSummary:]( &OBJC_CLASS___PKApplicationMessageGroupDescriptor,  "createForIdentifier:withSingularSummary:pluralSummary:",  v11,  v6,  v6);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification actionURL](self, "actionURL"));
      id v14 = +[PKApplicationMessageActionURL createWithURL:]( &OBJC_CLASS___PKApplicationMessageActionURL,  "createWithURL:",  v13);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[PDUserNotification applicationMessageIconForFeature:]( &OBJC_CLASS___PDUserNotification,  "applicationMessageIconForFeature:",  5LL));
      id v16 = +[PKApplicationMessageContentDefault createWithGroup:action:icon:title:body:]( &OBJC_CLASS___PKApplicationMessageContentDefault,  "createWithGroup:action:icon:title:body:",  v12,  v14,  v15,  v6,  v9);
    }

    else
    {
      id v16 = 0LL;
    }
  }

  else
  {
    id v16 = 0LL;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDAccountFundingSourceVerificationReminderUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___PDAccountFundingSourceVerificationReminderUserNotification;
  id v6 = -[PDUserNotification initWithCoder:](&v18, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(PKAccount, v5), @"account");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    account = v6->_account;
    v6->_account = (PKAccount *)v8;

    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSArray, v10);
    uint64_t v13 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v11,  objc_opt_class(&OBJC_CLASS___PKAccountPaymentFundingSource, v12),  0LL);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v14 forKey:@"fundingSources"]);
    fundingSources = v6->_fundingSources;
    v6->_fundingSources = (NSArray *)v15;

    v6->_unint64_t style = (unint64_t)[v4 decodeIntegerForKey:@"style"];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDAccountFundingSourceVerificationReminderUserNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_account, @"account", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_fundingSources forKey:@"fundingSources"];
  [v4 encodeInteger:self->_style forKey:@"style"];
}

- (id)_expiryDate
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_fundingSources, "firstObject"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 fundingDetails]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___PKAccountPaymentFundingDetailsBankAccount, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 verificationDetails]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 pendingAttempt]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 expiryDate]);
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (void)_refreshActionURL
{
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  PKURLActionRouteSavings,  PKURLActionRouteSavingsBankVerification));
  if ((id)-[NSArray count](self->_fundingSources, "count") == (id)1)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_fundingSources, "firstObject"));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v7 stringByAppendingFormat:@"/%@", v4]);

    id v6 = (id)v5;
  }

  else
  {
    id v6 = v7;
  }

  id v8 = v6;
  -[PDUserNotification setCustomActionRoute:](self, "setCustomActionRoute:", v6);
}

- (void)setFundingSources:(id)a3
{
  uint64_t v4 = (NSArray *)a3;
  BOOL v5 = -[NSArray count](self->_fundingSources, "count") < 2;
  BOOL v6 = -[NSArray count](v4, "count") > 1;
  fundingSources = self->_fundingSources;
  self->_fundingSources = v4;

  if (((v5 ^ v6) & 1) == 0) {
    -[PDAccountFundingSourceVerificationReminderUserNotification _refreshActionURL](self, "_refreshActionURL");
  }
}

- (PKAccount)account
{
  return self->_account;
}

- (NSArray)fundingSources
{
  return self->_fundingSources;
}

- (unint64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
}

@end
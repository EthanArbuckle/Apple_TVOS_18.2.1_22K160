@interface PDAccountPaymentPastDueUserNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (BOOL)needsNotificationSettings;
- (BOOL)useGenericMessaging;
- (PDAccountPaymentPastDueUserNotification)initWithCoder:(id)a3;
- (PDAccountPaymentPastDueUserNotification)initWithPassUniqueIdentifier:(id)a3 account:(id)a4;
- (id)_messageString;
- (id)_title;
- (id)notificationContentWithDataSource:(id)a3;
- (int64_t)_variantForDay:(int64_t)a3 cycle:(int64_t)a4;
- (int64_t)variant;
- (unint64_t)featureIdentifier;
- (unint64_t)notificationType;
- (void)_updateForNextPastDueNotificationForAccount:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setVariant:(int64_t)a3;
@end

@implementation PDAccountPaymentPastDueUserNotification

- (PDAccountPaymentPastDueUserNotification)initWithPassUniqueIdentifier:(id)a3 account:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (!a3 || !v6)
  {

LABEL_12:
    v8 = 0LL;
    goto LABEL_13;
  }

  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PDAccountPaymentPastDueUserNotification;
  v8 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v17,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  @"accountPaymentPastDue",  a3);
  -[PDAccountPaymentPastDueUserNotification _updateForNextPastDueNotificationForAccount:]( v8,  "_updateForNextPastDueNotificationForAccount:",  v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification date](v8, "date"));

  if (!v9)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(14LL);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[PDAccountPaymentPastDueUserNotification initWithPassUniqueIdentifier:account:]";
      v12 = "Skipping %s: date is nil";
      v13 = v11;
      uint32_t v14 = 12;
      goto LABEL_10;
    }

- (void)_updateForNextPastDueNotificationForAccount:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 creditDetails]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 accountSummary]);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 pastDueAmount]);
  v9 = v8;
  if (v8 && objc_msgSend(v8, "pk_isPositiveNumber") && objc_msgSend(v4, "state") != (id)3)
  {
    uint64_t v10 = (uint64_t)[v7 cyclesPastDue];
    if (v10 >= 6)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(14LL);
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Ignoring: Account is 6 months or more past due.",  buf,  2u);
      }
    }

    else
    {
      uint64_t v51 = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](&OBJC_CLASS___NSTimeZone, "systemTimeZone"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v4 creditDetails]);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 productTimeZone]);

      v48 = v13;
      id v14 = [v13 secondsFromGMT];
      v49 = v11;
      id v15 = [v11 secondsFromGMT];
      v16 = objc_alloc(&OBJC_CLASS___NSArray);
      v46 = self;
      if ((uint64_t)v14 >= (uint64_t)v15) {
        objc_super v17 = -[NSArray initWithObjects:]( v16,  "initWithObjects:",  &off_100690218,  &off_100690230,  &off_100690248,  &off_100690260,  &off_100690278,  0LL);
      }
      else {
        objc_super v17 = -[NSArray initWithObjects:]( v16,  "initWithObjects:",  &off_100690290,  &off_1006902A8,  &off_1006902C0,  &off_1006902D8,  &off_1006902F0,  0LL);
      }
      __int16 v20 = v17;
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSCalendar calendarWithIdentifier:]( &OBJC_CLASS___NSCalendar,  "calendarWithIdentifier:",  NSCalendarIdentifierGregorian));
      v22 = (void *)objc_claimAutoreleasedReturnValue([v21 components:240 fromDate:v5]);
      v23 = (char *)[v22 day];
      uint64_t v24 = (uint64_t)[v22 hour];
      id v25 = [v22 minute];
      v47 = v22;
      id v26 = [v22 second];
      if (v24 == 12 && v25 == 0LL && v26 == 0LL) {
        v29 = v23;
      }
      else {
        v29 = v23 + 1;
      }
      if (v24 >= 12) {
        v23 = v29;
      }
      v50 = v21;
      v52 = (void *)objc_claimAutoreleasedReturnValue([v21 components:14 fromDate:v5]);
      __int128 v54 = 0u;
      __int128 v55 = 0u;
      __int128 v56 = 0u;
      __int128 v57 = 0u;
      v30 = v20;
      id v31 = -[NSArray countByEnumeratingWithState:objects:count:]( v30,  "countByEnumeratingWithState:objects:count:",  &v54,  v59,  16LL);
      if (v31)
      {
        id v32 = v31;
        uint64_t v33 = *(void *)v55;
LABEL_23:
        uint64_t v34 = 0LL;
        while (1)
        {
          if (*(void *)v55 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = (char *)[*(id *)(*((void *)&v54 + 1) + 8 * v34) integerValue];
          if (v32 == (id)++v34)
          {
            id v32 = -[NSArray countByEnumeratingWithState:objects:count:]( v30,  "countByEnumeratingWithState:objects:count:",  &v54,  v59,  16LL);
            if (v32) {
              goto LABEL_23;
            }
            goto LABEL_29;
          }
        }

        uint64_t v36 = (uint64_t)v35;

        if (v36 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_31;
        }
        v40 = v52;
        [v52 setDay:v36];
        v41 = v46;
        v39 = v50;
      }

      else
      {
LABEL_29:

LABEL_31:
        uint64_t Month = PKStartOfNextMonth(v5);
        v38 = (void *)objc_claimAutoreleasedReturnValue(Month);
        v39 = v50;
        v40 = (void *)objc_claimAutoreleasedReturnValue([v50 components:30 fromDate:v38]);

        uint64_t v36 = 1LL;
        v41 = v46;
      }

      v53 = v40;
      [v40 setHour:12];
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v39 dateFromComponents:v40]);
      v41->_featureIdentifier = (unint64_t)[v4 feature];
      v42 = (void *)objc_claimAutoreleasedReturnValue([v4 accountIdentifier]);
      -[PDUserNotification setAccountIdentifier:](v41, "setAccountIdentifier:", v42);

      v43 = (void *)objc_claimAutoreleasedReturnValue([v4 creditDetails]);
      v44 = (void *)objc_claimAutoreleasedReturnValue([v43 accountSummary]);
      v41->_useGenericMessaging = [v44 requiresDebtCollectionNotices];

      v41->_variant = -[PDAccountPaymentPastDueUserNotification _variantForDay:cycle:]( v41,  "_variantForDay:cycle:",  v36,  v51);
      -[PDUserNotification setPreventAutomaticDismissal:](v41, "setPreventAutomaticDismissal:", 1LL);
      -[PDUserNotification setDate:](v41, "setDate:", v19);
      v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"accountPaymentPastDue-%ld-%ld-%ld-%ld",  [v53 year],  objc_msgSend(v53, "month"),  objc_msgSend(v53, "day"),  v51));
      -[PDUserNotification setNotificationIdentifier:](v41, "setNotificationIdentifier:", v45);
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDAccountPaymentPastDueUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PDAccountPaymentPastDueUserNotification;
  v5 = -[PDUserNotification initWithCoder:](&v7, "initWithCoder:", v4);
  if (v5)
  {
    v5->_variant = (int64_t)[v4 decodeIntegerForKey:@"variant"];
    v5->_useGenericMessaging = [v4 decodeBoolForKey:@"useGenericMessaging"];
    v5->_featureIdentifier = (unint64_t)[v4 decodeIntegerForKey:@"accountFeatureIdentifier"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDAccountPaymentPastDueUserNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_variant, @"variant", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_useGenericMessaging forKey:@"useGenericMessaging"];
  [v4 encodeInteger:self->_featureIdentifier forKey:@"accountFeatureIdentifier"];
}

- (int64_t)_variantForDay:(int64_t)a3 cycle:(int64_t)a4
{
  if (self->_useGenericMessaging) {
    return 0LL;
  }
  if (a4)
  {
    uint64_t v5 = 10LL;
    else {
      uint64_t v6 = 8LL;
    }
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0xE) {
      uint64_t v7 = 6LL;
    }
    else {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v8 = 4LL;
    }
    else {
      int64_t v9 = 2LL;
    }
    if (a4 <= 4) {
      return v9;
    }
    else {
      return 11LL;
    }
  }

  else
  {
    uint64_t v10 = 9LL;
    else {
      uint64_t v11 = 7LL;
    }
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0xE) {
      uint64_t v12 = 5LL;
    }
    else {
      uint64_t v12 = v11;
    }
    else {
      int64_t v13 = 3LL;
    }
    else {
      return 1LL;
    }
  }

- (id)_messageString
{
  if (self->_useGenericMessaging)
  {
    self->_variant = 0LL;
LABEL_3:
    v3 = @"ACCOUNT_SERVICE_PAYMENT_PAST_DUE_BODY_MM";
LABEL_4:
    uint64_t v4 = PDDeviceSpecificLocalizedStringKeyForKey(v3, a2);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue(v4);
LABEL_5:
    uint64_t v6 = PKLocalizedFeatureString(v5, self->_featureIdentifier);
    id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  }

  else
  {
    uint64_t v5 = @"ACCOUNT_SERVICE_PAYMENT_PAST_DUE_BODY_DAY_FOURTEEN_MONTH_TWO_THROUGH_FIVE";
    switch(self->_variant)
    {
      case 0LL:
        goto LABEL_3;
      case 1LL:
        v3 = @"ACCOUNT_SERVICE_PAYMENT_PAST_DUE_BODY_DAY_ONE_FIRST_MONTH";
        goto LABEL_4;
      case 2LL:
        v3 = @"ACCOUNT_SERVICE_PAYMENT_PAST_DUE_BODY_DAY_ONE_MONTH_TWO_THROUGH_FIVE";
        goto LABEL_4;
      case 3LL:
      case 4LL:
        v3 = @"ACCOUNT_SERVICE_PAYMENT_PAST_DUE_BODY_DAY_SEVEN_MONTH_ONE_THROUGH_FIVE";
        goto LABEL_4;
      case 5LL:
        v3 = @"ACCOUNT_SERVICE_PAYMENT_PAST_DUE_BODY_DAY_FOURTEEN_FIRST_MONTH";
        goto LABEL_4;
      case 6LL:
        goto LABEL_5;
      case 7LL:
        uint64_t v5 = @"ACCOUNT_SERVICE_PAYMENT_PAST_DUE_BODY_DAY_TWENTY_ONE_FIRST_MONTH";
        goto LABEL_5;
      case 8LL:
        uint64_t v5 = @"ACCOUNT_SERVICE_PAYMENT_PAST_DUE_BODY_DAY_TWENTY_ONE_MONTH_TWO_THROUGH_FIVE";
        goto LABEL_5;
      case 9LL:
        uint64_t v5 = @"ACCOUNT_SERVICE_PAYMENT_PAST_DUE_BODY_DAY_TWENTY_SEVEN_FIRST_MONTH";
        goto LABEL_5;
      case 0xALL:
        uint64_t v5 = @"ACCOUNT_SERVICE_PAYMENT_PAST_DUE_BODY_DAY_TWENTY_SEVEN_MONTH_TWO_THROUGH_FIVE";
        goto LABEL_5;
      case 0xBLL:
        uint64_t v5 = @"ACCOUNT_SERVICE_PAYMENT_PAST_DUE_BODY_ALL_DAYS_MONTH_SIX";
        goto LABEL_5;
      default:
        id v7 = 0LL;
        break;
    }
  }

  return v7;
}

- (id)_title
{
  if (self->_useGenericMessaging)
  {
    v2 = @"ACCOUNT_SERVICE_PAYMENT_PAST_DUE_TITLE_MM";
  }

  else
  {
    unint64_t v3 = self->_variant - 6;
    if (v3 > 5) {
      v2 = @"ACCOUNT_SERVICE_PAYMENT_PAST_DUE_TITLE";
    }
    else {
      v2 = off_10064D550[v3];
    }
  }

  uint64_t v4 = PKLocalizedFeatureString(v2, self->_featureIdentifier);
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (BOOL)isValid
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification accountIdentifier](self, "accountIdentifier"));
  if (!v3 || self->_variant == -1)
  {
    BOOL v5 = 0;
  }

  else
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountPaymentPastDueUserNotification _messageString](self, "_messageString"));
    BOOL v5 = [v4 length] != 0;
  }

  return v5;
}

- (unint64_t)notificationType
{
  return 29LL;
}

- (BOOL)needsNotificationSettings
{
  return 1;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PDAccountPaymentPastDueUserNotification;
  id v4 = a3;
  id v5 = -[PDUserNotification notificationContentWithDataSource:](&v13, "notificationContentWithDataSource:", v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "notificationSettings", v13.receiver, v13.super_class));

  BOOL v8 = self->_useGenericMessaging || [v7 showPreviewsSetting] == 0;
  self->_useGenericMessaging = v8;
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountPaymentPastDueUserNotification _title](self, "_title"));
  [v6 setSubtitle:v9];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountPaymentPastDueUserNotification _messageString](self, "_messageString"));
  [v6 setBody:v10];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification date](self, "date"));
  [v6 setDate:v11];

  [v6 setInterruptionLevel:2];
  return v6;
}

- (BOOL)useGenericMessaging
{
  return self->_useGenericMessaging;
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (int64_t)variant
{
  return self->_variant;
}

- (void)setVariant:(int64_t)a3
{
  self->_variant = a3;
}

@end
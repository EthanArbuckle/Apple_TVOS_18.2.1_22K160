@interface PDAccountFinancingPlanPastDueNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForFinancingPlan:(id)a3 daysPastDueEnum:(int64_t)a4;
- (BOOL)isValid;
- (PDAccountFinancingPlanPastDueNotification)initWithCoder:(id)a3;
- (PDAccountFinancingPlanPastDueNotification)initWithFinancingPlan:(id)a3 requiresGenericMessaging:(BOOL)a4 daysPastDue:(int64_t)a5 passUniqueIdentifier:(id)a6;
- (id)_bodyStringForBNPL;
- (id)applicationMessageContent;
- (id)notificationContentWithDataSource:(id)a3;
- (id)planIdentifier;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDAccountFinancingPlanPastDueNotification

+ (id)notificationIdentifierForFinancingPlan:(id)a3 daysPastDueEnum:(int64_t)a4
{
  uint64_t v5 = objc_claimAutoreleasedReturnValue([a3 planIdentifier]);
  v6 = (void *)v5;
  else {
    uint64_t v7 = (uint64_t)*(&off_1006517B0 + a4);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"financingPlanPastDue-%@-%@",  v5,  v7));

  return v8;
}

- (PDAccountFinancingPlanPastDueNotification)initWithFinancingPlan:(id)a3 requiresGenericMessaging:(BOOL)a4 daysPastDue:(int64_t)a5 passUniqueIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  if (a5 > 55)
  {
    if (a5 > 83)
    {
      if (a5 > 104)
      {
        if (a5 != 105)
        {
          if (a5 != 112) {
            goto LABEL_63;
          }
          uint64_t v13 = 16LL;
          if (!v11) {
            goto LABEL_63;
          }
          goto LABEL_52;
        }

        uint64_t v13 = 15LL;
        if (v11) {
          goto LABEL_52;
        }
      }

      else
      {
        if (a5 != 84)
        {
          if (a5 != 98) {
            goto LABEL_63;
          }
          uint64_t v13 = 14LL;
          if (!v11) {
            goto LABEL_63;
          }
          goto LABEL_52;
        }

        uint64_t v13 = 13LL;
        if (v11) {
          goto LABEL_52;
        }
      }
    }

    else if (a5 > 69)
    {
      if (a5 != 70)
      {
        if (a5 != 77) {
          goto LABEL_63;
        }
        uint64_t v13 = 12LL;
        if (!v11) {
          goto LABEL_63;
        }
        goto LABEL_52;
      }

      uint64_t v13 = 11LL;
      if (v11) {
        goto LABEL_52;
      }
    }

    else
    {
      if (a5 != 56)
      {
        if (a5 != 63) {
          goto LABEL_63;
        }
        uint64_t v13 = 10LL;
        if (!v11) {
          goto LABEL_63;
        }
        goto LABEL_52;
      }

      uint64_t v13 = 9LL;
      if (v11) {
        goto LABEL_52;
      }
    }

    goto LABEL_63;
  }

  if (a5 > 27)
  {
    if (a5 > 41)
    {
      if (a5 != 42)
      {
        if (a5 != 49) {
          goto LABEL_63;
        }
        uint64_t v13 = 7LL;
        if (!v11) {
          goto LABEL_63;
        }
        goto LABEL_52;
      }

      uint64_t v13 = 6LL;
      goto LABEL_51;
    }

    if (a5 != 28)
    {
      if (a5 != 35) {
        goto LABEL_63;
      }
      uint64_t v13 = 5LL;
      if (!v11) {
        goto LABEL_63;
      }
      goto LABEL_52;
    }

    uint64_t v13 = 4LL;
    if (v11) {
      goto LABEL_52;
    }
LABEL_63:
    v28 = 0LL;
    goto LABEL_64;
  }

  if (a5 > 13)
  {
    if (a5 != 14)
    {
      if (a5 != 21) {
        goto LABEL_63;
      }
      uint64_t v13 = 3LL;
      if (!v11) {
        goto LABEL_63;
      }
      goto LABEL_52;
    }

    uint64_t v13 = 2LL;
    if (v11) {
      goto LABEL_52;
    }
    goto LABEL_63;
  }

  uint64_t v13 = 0LL;
  if (a5 == 1)
  {
LABEL_51:
    if (v11) {
      goto LABEL_52;
    }
    goto LABEL_63;
  }

  if (a5 != 7) {
    goto LABEL_63;
  }
  uint64_t v13 = 1LL;
  if (!v11) {
    goto LABEL_63;
  }
LABEL_52:
  v14 = (void *)objc_claimAutoreleasedReturnValue([v11 planSummary]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 pastDueAmount]);

  if (v15)
  {
    BOOL v31 = a4;
    id v32 = v12;
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSCalendar calendarWithIdentifier:]( &OBJC_CLASS___NSCalendar,  "calendarWithIdentifier:",  NSCalendarIdentifierGregorian));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v16 components:28 fromDate:v17]);
    [v18 setHour:18];
    v19 = (void *)objc_claimAutoreleasedReturnValue([v16 dateFromComponents:v18]);
    if ([v19 compare:v17] != (id)1)
    {
      id v21 = v17;

      v19 = v21;
    }

    id v22 = objc_msgSend( (id)objc_opt_class(self, v20),  "notificationIdentifierForFinancingPlan:daysPastDueEnum:",  v11,  v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v33.receiver = self;
    v33.super_class = (Class)&OBJC_CLASS___PDAccountFinancingPlanPastDueNotification;
    v24 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v33,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v23,  v32);
    v25 = v24;
    if (v24)
    {
      objc_storeStrong((id *)&v24->_financingPlan, a3);
      v25->_requiresGenericMessaging = v31;
      v25->_daysPastDue = v13;
      -[PDUserNotification setDate:](v25, "setDate:", v19);
      -[PDUserNotification setCustomActionRoute:]( v25,  "setCustomActionRoute:",  PKUserNotificationActionRoutePayLaterViewFinancingPlan);
      uint64_t v35 = PKUserNotificationActionQueryItemFinancingPlanIdentifier;
      v26 = (void *)objc_claimAutoreleasedReturnValue([v11 planIdentifier]);
      v36 = v26;
      v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  &v35,  1LL));
      -[PDUserNotification setCustomActionQueryParameters:](v25, "setCustomActionQueryParameters:", v27);

      -[PDUserNotification setPreventAutomaticDismissal:](v25, "setPreventAutomaticDismissal:", 1LL);
    }

    self = v25;

    v28 = self;
    id v12 = v32;
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(14LL);
    v16 = (void *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  OS_LOG_TYPE_DEFAULT,  "Cannot create financing plan past due notification for a nil pastDueAmount",  buf,  2u);
    }

    v28 = 0LL;
  }

LABEL_64:
  return v28;
}

- (id)planIdentifier
{
  return -[PKPayLaterFinancingPlan planIdentifier](self->_financingPlan, "planIdentifier");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDAccountFinancingPlanPastDueNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDAccountFinancingPlanPastDueNotification;
  v6 = -[PDUserNotification initWithCoder:](&v11, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKPayLaterFinancingPlan, v5),  @"financingPlan");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    financingPlan = v6->_financingPlan;
    v6->_financingPlan = (PKPayLaterFinancingPlan *)v8;

    v6->_requiresGenericMessaging = [v4 decodeBoolForKey:@"requiresGenericMessaging"];
    v6->_daysPastDue = (int64_t)[v4 decodeIntegerForKey:@"daysPastDue"];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDAccountFinancingPlanPastDueNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_financingPlan, @"financingPlan", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_requiresGenericMessaging forKey:@"requiresGenericMessaging"];
  [v4 encodeInteger:self->_daysPastDue forKey:@"daysPastDue"];
}

- (unint64_t)notificationType
{
  return 54LL;
}

- (BOOL)isValid
{
  return 1;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDAccountFinancingPlanPastDueNotification;
  id v4 = a3;
  id v5 = -[PDUserNotification notificationContentWithDataSource:](&v11, "notificationContentWithDataSource:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[PDUserNotification updatePassNameForNotificationContent:dataSource:]( self,  "updatePassNameForNotificationContent:dataSource:",  v6,  v4,  v11.receiver,  v11.super_class);

  if (self->_requiresGenericMessaging)
  {
    +[PDAccountFinancingPlanPaymentNotification updateNotificationContentWithGenericMessaging:]( &OBJC_CLASS___PDAccountFinancingPlanPaymentNotification,  "updateNotificationContentWithGenericMessaging:",  v6);
  }

  else
  {
    uint64_t v7 = PKLocalizedCocoonString(@"NOTIFICATION_YOUR_ACCOUNT_NEEDS_ATTENTION");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (-[PKPayLaterFinancingPlan productType](self->_financingPlan, "productType") == (id)1)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountFinancingPlanPastDueNotification _bodyStringForBNPL](self, "_bodyStringForBNPL"));
      [v6 setSubtitle:v8];
      if (v9)
      {
        [v6 setBody:v9];
      }
    }

    else
    {
      [v6 setSubtitle:v8];
    }
  }

  return v6;
}

- (id)applicationMessageContent
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKPayLaterFinancingPlan planSummary](self->_financingPlan, "planSummary"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pastDueAmount]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 formattedStringValue]);
  uint64_t v6 = PKLocalizedCocoonString(@"PAY_LATER_GROUP_PAYMENT_PAST_DUE_MESSAGE", @"%@", v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  uint64_t v8 = PKLocalizedCocoonString(@"PAY_LATER_GROUP_PAYMENT_PAST_DUE_TITLE");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue( -[PDUserNotification _payLaterApplicationMessageContentWithTitleText:messageText:]( self,  "_payLaterApplicationMessageContentWithTitleText:messageText:",  v9,  v7));

  return v10;
}

- (id)_bodyStringForBNPL
{
  if (-[PKPayLaterFinancingPlan productType](self->_financingPlan, "productType") == (id)1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKPayLaterFinancingPlan planSummary](self->_financingPlan, "planSummary"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pastDueAmount]);

    switch(self->_daysPastDue)
    {
      case 0LL:
        int IsSupported = PKPassbookIsSupported(v5, v6);
        v14 = @"NOTIFICATION_BNPL_ONE_DAY_PAST_DUE_MESSAGE";
        if (!IsSupported) {
          v14 = @"NOTIFICATION_BNPL_ONE_DAY_PAST_DUE_MESSAGE_SETTINGS";
        }
        v15 = v14;
        v16 = (void *)objc_claimAutoreleasedReturnValue([v4 formattedStringValue]);
        uint64_t v17 = PKLocalizedCocoonString(v15, @"%@", v16);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v17);

        break;
      case 1LL:
      case 5LL:
      case 9LL:
      case 0xDLL:
        else {
          uint64_t v7 = @"NOTIFICATION_BNPL_SEVEN_DAYS_PAST_DUE_MESSAGE_SETTINGS";
        }
        goto LABEL_10;
      case 2LL:
      case 6LL:
      case 0xALL:
      case 0xELL:
        uint64_t v7 = @"NOTIFICATION_BNPL_FOURTEEN_DAYS_PAST_DUE_MESSAGE";
        goto LABEL_10;
      case 3LL:
      case 7LL:
      case 0xBLL:
      case 0xFLL:
        v9 = (void *)objc_claimAutoreleasedReturnValue([v4 formattedStringValue]);
        uint64_t v10 = PKLocalizedCocoonString( @"NOTIFICATION_BNPL_TWENTY_ONE_DAYS_PAST_DUE_MESSAGE",  @"%@",  v9);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v10);

        break;
      case 4LL:
      case 8LL:
      case 0xCLL:
      case 0x10LL:
        uint64_t v7 = @"NOTIFICATION_BNPL_TWENTY_SEVEN_DAYS_PAST_DUE_MESSAGE";
LABEL_10:
        uint64_t v11 = PKLocalizedCocoonString(&v7->isa);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v11);
        break;
      default:
        uint64_t v8 = 0LL;
        break;
    }
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end
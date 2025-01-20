@interface PDAccountFinancingPlanPaymentReminderNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForInstallment:(id)a3 reminderOffset:(unint64_t)a4;
- (BOOL)isValid;
- (PDAccountFinancingPlanPaymentReminderNotification)initWithCoder:(id)a3;
- (PDAccountFinancingPlanPaymentReminderNotification)initWithInstallment:(id)a3 financingPlan:(id)a4 accountCreatedDate:(id)a5 passUniqueIdentifier:(id)a6 reminderOffset:(unint64_t)a7;
- (id)applicationMessageContent;
- (id)notificationContentWithDataSource:(id)a3;
- (id)planIdentifier;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDAccountFinancingPlanPaymentReminderNotification

+ (id)notificationIdentifierForInstallment:(id)a3 reminderOffset:(unint64_t)a4
{
  v4 = 0LL;
  switch(a4)
  {
    case 0uLL:
      v4 = @"Today";
      goto LABEL_5;
    case 1uLL:
      v4 = @"1-Day-Before";
      goto LABEL_5;
    case 2uLL:
      v4 = @"5-Days-Before";
      goto LABEL_5;
    case 3uLL:
      return v4;
    default:
LABEL_5:
      v5 = (void *)objc_claimAutoreleasedReturnValue([a3 installmentIdentifier]);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"installmentPaymentReminder-%@-%@",  v4,  v5));

      return v4;
  }

- (PDAccountFinancingPlanPaymentReminderNotification)initWithInstallment:(id)a3 financingPlan:(id)a4 accountCreatedDate:(id)a5 passUniqueIdentifier:(id)a6 reminderOffset:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v17 = 0LL;
  if (v13 && v14 && a7 != 3)
  {
    if (!a7)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v14 fundingSource]);
      unsigned int v19 = [v18 autoPayment];

      if (v19)
      {
        uint64_t Object = PKLogFacilityTypeGetObject(14LL);
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Ignoring financing plan payment reminder notification with offset 'today' since its only applicable for plan s with auto payment off",  buf,  2u);
        }

        v17 = 0LL;
        goto LABEL_25;
      }
    }

    v45 = self;
    v42 = v14;
    id v43 = v16;
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v13 dueDate]);
    id v41 = v15;
    id v23 = v15;
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSCalendar calendarWithIdentifier:]( &OBJC_CLASS___NSCalendar,  "calendarWithIdentifier:",  NSCalendarIdentifierGregorian));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 components:28 fromDate:v22]);
    [v25 setHour:18];
    v26 = (void *)objc_claimAutoreleasedReturnValue([v24 dateFromComponents:v25]);
    v27 = v26;
    double v28 = 86400.0;
    if (a7 != 1) {
      double v28 = 0.0;
    }
    if (a7 == 2) {
      double v28 = 432000.0;
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue([v26 dateByAddingTimeInterval:-v28]);

    if (v23)
    {
      [v23 timeIntervalSince1970];
      uint64_t v31 = objc_claimAutoreleasedReturnValue([v29 dateByAddingTimeInterval:(double)(18000 * ((uint64_t)v30 / 18000) - (uint64_t)v30)]);

      v29 = (void *)v31;
    }

    id v14 = v42;
    if (v29 && [v44 compare:v29] == (id)1)
    {
      uint64_t v33 = PKLogFacilityTypeGetObject(14LL);
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v29;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Ignoring financing plan payment reminder notification with a fire date in the past: %@",  buf,  0xCu);
      }
    }

    else
    {
      id v35 = objc_msgSend((id)objc_opt_class(v45, v32), "notificationIdentifierForInstallment:reminderOffset:", v13, a7);
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (v34)
      {
        v46.receiver = v45;
        v46.super_class = (Class)&OBJC_CLASS___PDAccountFinancingPlanPaymentReminderNotification;
        v36 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v46,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v34,  v43);
        v37 = v36;
        if (v36)
        {
          objc_storeStrong((id *)&v36->_installment, a3);
          objc_storeStrong((id *)&v37->_financingPlan, a4);
          v37->_paymentReminderOffset = a7;
          -[PDUserNotification setDate:](v37, "setDate:", v29);
          -[PDUserNotification setCustomActionRoute:]( v37,  "setCustomActionRoute:",  PKUserNotificationActionRoutePayLaterViewFinancingPlan);
          uint64_t v47 = PKUserNotificationActionQueryItemFinancingPlanIdentifier;
          v38 = (void *)objc_claimAutoreleasedReturnValue([v42 planIdentifier]);
          v48 = v38;
          v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v48,  &v47,  1LL));
          -[PDUserNotification setCustomActionQueryParameters:](v37, "setCustomActionQueryParameters:", v39);
        }

        v17 = v37;
        v45 = v17;
        goto LABEL_24;
      }
    }

    v17 = 0LL;
LABEL_24:
    v21 = (os_log_s *)v44;

    id v15 = v41;
    id v16 = v43;
    self = v45;
LABEL_25:
  }

  return v17;
}

- (id)planIdentifier
{
  return -[PKPayLaterFinancingPlan planIdentifier](self->_financingPlan, "planIdentifier");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDAccountFinancingPlanPaymentReminderNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PDAccountFinancingPlanPaymentReminderNotification;
  v6 = -[PDUserNotification initWithCoder:](&v15, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKPayLaterInstallment, v5),  @"installment");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    installment = v6->_installment;
    v6->_installment = (PKPayLaterInstallment *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKPayLaterFinancingPlan, v10),  @"financingPlan");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    financingPlan = v6->_financingPlan;
    v6->_financingPlan = (PKPayLaterFinancingPlan *)v12;

    v6->_paymentReminderOffset = (unint64_t)[v4 decodeIntegerForKey:@"paymentReminderOffset"];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDAccountFinancingPlanPaymentReminderNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_installment, @"installment", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_financingPlan forKey:@"financingPlan"];
  [v4 encodeInteger:self->_paymentReminderOffset forKey:@"paymentReminderOffset"];
}

- (unint64_t)notificationType
{
  return 53LL;
}

- (BOOL)isValid
{
  return 1;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___PDAccountFinancingPlanPaymentReminderNotification;
  id v4 = a3;
  id v5 = -[PDUserNotification notificationContentWithDataSource:](&v31, "notificationContentWithDataSource:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[PDUserNotification updatePassNameForNotificationContent:dataSource:]( self,  "updatePassNameForNotificationContent:dataSource:",  v6,  v4);

  if (qword_100707AC8 != -1) {
    dispatch_once(&qword_100707AC8, &stru_100651748);
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKPayLaterFinancingPlan fundingSource](self->_financingPlan, "fundingSource"));
  unsigned int v8 = [v7 autoPayment];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PKPayLaterInstallment currentBalance](self->_installment, "currentBalance"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 formattedStringValue]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PKPayLaterFinancingPlan merchant](self->_financingPlan, "merchant"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 displayName]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[PKPayLaterInstallment dueDate](self->_installment, "dueDate"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100707AC0 stringFromDate:v13]);
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSCalendar calendarWithIdentifier:]( &OBJC_CLASS___NSCalendar,  "calendarWithIdentifier:",  NSCalendarIdentifierGregorian));
  unint64_t paymentReminderOffset = self->_paymentReminderOffset;
  if (paymentReminderOffset == 2)
  {
    if (v8)
    {
      uint64_t v22 = PKLocalizedCocoonString( @"NOTIFICATION_AUTO_PAYMENT_DUE_FIVE_DAYS_MESSAGE",  @"%@%@%@",  v10,  v12,  v14);
LABEL_14:
      id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      goto LABEL_19;
    }

    uint64_t v26 = PKLocalizedCocoonString( @"NOTIFICATION_MANUAL_PAYMENT_DUE_FIVE_DAYS_MESSAGE",  @"%@%@%@",  v10,  v12,  v14);
LABEL_22:
    id v23 = (void *)objc_claimAutoreleasedReturnValue(v26);
    goto LABEL_23;
  }

  if (paymentReminderOffset == 1)
  {
    if (v8)
    {
      uint64_t v22 = PKLocalizedCocoonString( @"NOTIFICATION_AUTO_PAYMENT_DUE_TOMORROW_MESSAGE",  @"%@%@",  v10,  v12);
      goto LABEL_14;
    }

    uint64_t v26 = PKLocalizedCocoonString( @"NOTIFICATION_MANUAL_PAYMENT_DUE_TOMORROW_MESSAGE",  @"%@%@",  v10,  v12);
    goto LABEL_22;
  }

  if (paymentReminderOffset)
  {
    id v23 = 0LL;
    if ((v8 & 1) == 0) {
      goto LABEL_23;
    }
LABEL_19:
    v25 = @"NOTIFICATION_AUTO_PAYMENT_REMINDER";
    goto LABEL_24;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification date](self, "date"));
  unsigned int v18 = [v15 isDate:v13 inSameDayAsDate:v17];

  if (v18)
  {
    else {
      v21 = @"NOTIFICATION_MANUAL_PAYMENT_DUE_TODAY_MESSAGE_SETTINGS";
    }
  }

  else
  {
    v21 = @"NOTIFICATION_MANUAL_PAYMENT_DUE_TOMORROW_MESSAGE";
  }

  uint64_t v24 = PKLocalizedCocoonString(&v21->isa, @"%@%@", v10, v12);
  id v23 = (void *)objc_claimAutoreleasedReturnValue(v24);
  if ((v8 & 1) != 0) {
    goto LABEL_19;
  }
LABEL_23:
  v25 = @"NOTIFICATION_PAYMENT_REMINDER";
LABEL_24:
  uint64_t v27 = PKLocalizedCocoonString(&v25->isa);
  double v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  [v6 setSubtitle:v28];

  if (v23) {
    [v6 setBody:v23];
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification date](self, "date"));
  [v6 setDate:v29];

  return v6;
}

- (id)applicationMessageContent
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKPayLaterFinancingPlan fundingSource](self->_financingPlan, "fundingSource"));
  unsigned __int8 v4 = [v3 autoPayment];

  if ((v4 & 1) != 0)
  {
    id v5 = 0LL;
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKPayLaterInstallment currentBalance](self->_installment, "currentBalance"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 formattedStringValue]);

    if (self->_paymentReminderOffset)
    {
      id v5 = 0LL;
    }

    else
    {
      uint64_t v8 = PKLocalizedCocoonString(@"PAY_LATER_GROUP_PAYMENT_DUE_TODAY_MESSAGE", @"%@", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      uint64_t v10 = PKLocalizedCocoonString(@"PAY_LATER_GROUP_PAYMENT_DUE_TODAY_TITLE");
      id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDUserNotification _payLaterApplicationMessageContentWithTitleText:messageText:]( self,  "_payLaterApplicationMessageContentWithTitleText:messageText:",  v11,  v9));
    }
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end
@interface PDAccountFinancingPlanPaymentNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForPayment:(id)a3;
+ (void)updateNotificationContentWithGenericMessaging:(id)a3;
- (BOOL)isValid;
- (PDAccountFinancingPlanPaymentNotification)initWithCoder:(id)a3;
- (PDAccountFinancingPlanPaymentNotification)initWithFinancingPlan:(id)a3 payment:(id)a4 requiresGenericMessaging:(BOOL)a5 passUniqueIdentifier:(id)a6;
- (id)applicationMessageContent;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)_updateContentForPaymentAdjustmentType:(id)a3;
- (void)_updateContentForPaymentDeclinedType:(id)a3;
- (void)_updateContentForPaymentRefundType:(id)a3;
- (void)_updateContentForPaymentType:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDAccountFinancingPlanPaymentNotification

+ (void)updateNotificationContentWithGenericMessaging:(id)a3
{
  id v10 = a3;
  uint64_t v3 = PKLocalizedCocoonString(@"NOTIFICATION_PAST_DUE_GENERIC_TITLE");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v10 setSubtitle:v4];

  else {
    v7 = @"NOTIFICATION_PAST_DUE_GENERIC_MESSAGE_SETTINGS";
  }
  uint64_t v8 = PKLocalizedCocoonString(&v7->isa);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v10 setBody:v9];
}

+ (id)notificationIdentifierForPayment:(id)a3
{
  id v3 = a3;
  uint64_t v4 = PKPayLaterPaymentTypeToString([v3 type]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 paymentIdentifier]);

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"financingPlanPayment-%@-%@",  v5,  v6));
  return v7;
}

- (PDAccountFinancingPlanPaymentNotification)initWithFinancingPlan:(id)a3 payment:(id)a4 requiresGenericMessaging:(BOOL)a5 passUniqueIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  v13 = v12;
  v14 = 0LL;
  if (v11 && v12)
  {
    id v15 = a6;
    id v17 = objc_msgSend((id)objc_opt_class(self, v16), "notificationIdentifierForPayment:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v23.receiver = self;
    v23.super_class = (Class)&OBJC_CLASS___PDAccountFinancingPlanPaymentNotification;
    v19 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v23,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v18,  v15);

    if (v19)
    {
      objc_storeStrong((id *)&v19->_payment, a4);
      objc_storeStrong((id *)&v19->_financingPlan, a3);
      v19->_requiresGenericMessaging = a5;
      -[PDUserNotification setCustomActionRoute:]( v19,  "setCustomActionRoute:",  PKUserNotificationActionRoutePayLaterViewFinancingPlan);
      uint64_t v24 = PKUserNotificationActionQueryItemFinancingPlanIdentifier;
      v20 = (void *)objc_claimAutoreleasedReturnValue([v11 planIdentifier]);
      v25 = v20;
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
      -[PDUserNotification setCustomActionQueryParameters:](v19, "setCustomActionQueryParameters:", v21);
    }

    self = v19;

    v14 = self;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDAccountFinancingPlanPaymentNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PDAccountFinancingPlanPaymentNotification;
  uint64_t v6 = -[PDUserNotification initWithCoder:](&v15, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKPayLaterPayment, v5),  @"payment");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    payment = v6->_payment;
    v6->_payment = (PKPayLaterPayment *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKPayLaterFinancingPlan, v10),  @"financingPlan");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    financingPlan = v6->_financingPlan;
    v6->_financingPlan = (PKPayLaterFinancingPlan *)v12;

    v6->_requiresGenericMessaging = [v4 decodeBoolForKey:@"requiresGenericMessaging"];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDAccountFinancingPlanPaymentNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_payment, @"payment", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_financingPlan forKey:@"financingPlan"];
  [v4 encodeBool:self->_requiresGenericMessaging forKey:@"account"];
}

- (unint64_t)notificationType
{
  return 51LL;
}

- (BOOL)isValid
{
  return 1;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PDAccountFinancingPlanPaymentNotification;
  id v4 = a3;
  id v5 = -[PDUserNotification notificationContentWithDataSource:](&v9, "notificationContentWithDataSource:", v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[PDUserNotification updatePassNameForNotificationContent:dataSource:]( self,  "updatePassNameForNotificationContent:dataSource:",  v6,  v4,  v9.receiver,  v9.super_class);

  switch((unint64_t)-[PKPayLaterPayment type](self->_payment, "type"))
  {
    case 1uLL:
      -[PDAccountFinancingPlanPaymentNotification _updateContentForPaymentType:]( self,  "_updateContentForPaymentType:",  v6);
      break;
    case 3uLL:
      -[PDAccountFinancingPlanPaymentNotification _updateContentForPaymentRefundType:]( self,  "_updateContentForPaymentRefundType:",  v6);
      break;
    case 5uLL:
      -[PDAccountFinancingPlanPaymentNotification _updateContentForPaymentDeclinedType:]( self,  "_updateContentForPaymentDeclinedType:",  v6);
      break;
    case 7uLL:
      -[PDAccountFinancingPlanPaymentNotification _updateContentForPaymentAdjustmentType:]( self,  "_updateContentForPaymentAdjustmentType:",  v6);
      break;
    default:
      break;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v6 setDate:v7];

  return v6;
}

- (id)applicationMessageContent
{
  if (-[PKPayLaterPayment type](self->_payment, "type") == (id)5)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKPayLaterPayment amount](self->_payment, "amount"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 formattedStringValue]);

    uint64_t v5 = PKLocalizedCocoonString(@"PAY_LATER_GROUP_PAYMENT_DECLINED_MESSAGE", @"%@", v4);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    uint64_t v7 = PKLocalizedCocoonString(@"PAY_LATER_GROUP_PAYMENT_DECLINED_TITLE");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDUserNotification _payLaterApplicationMessageContentWithTitleText:messageText:]( self,  "_payLaterApplicationMessageContentWithTitleText:messageText:",  v8,  v6));
  }

  else
  {
    objc_super v9 = 0LL;
  }

  return v9;
}

- (void)_updateContentForPaymentType:(id)a3
{
  id v28 = a3;
  if (-[PKPayLaterPayment type](self->_payment, "type") == (id)1)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKPayLaterFinancingPlan scheduleSummary](self->_financingPlan, "scheduleSummary"));
    unsigned int v5 = 1;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 paymentsOfType:1]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sortedArrayUsingComparator:&stru_100651728]);

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 paymentIdentifier]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[PKPayLaterPayment paymentIdentifier](self->_payment, "paymentIdentifier"));
    id v11 = v9;
    id v12 = v10;
    v13 = v12;
    if (v11 != v12)
    {
      if (v11) {
        BOOL v14 = v12 == 0LL;
      }
      else {
        BOOL v14 = 1;
      }
      if (v14) {
        unsigned int v5 = 0;
      }
      else {
        unsigned int v5 = [v11 isEqualToString:v12];
      }
    }

    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(-[PKPayLaterPayment amount](self->_payment, "amount"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 formattedStringValue]);

    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[PKPayLaterFinancingPlan merchant](self->_financingPlan, "merchant"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 displayName]);

    if (v5)
    {
      uint64_t v19 = PKLocalizedCocoonString(@"NOTIFICATION_FIRST_PAYMENT_TITLE");
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      [v28 setSubtitle:v20];

      else {
        objc_super v23 = @"NOTIFICATION_FIRST_PAYMENT_MESSAGE_SETTINGS";
      }
      uint64_t v24 = PKLocalizedCocoonString(&v23->isa, @"%@", v18);
    }

    else
    {
      uint64_t v25 = PKLocalizedCocoonString(@"NOTIFICATION_OTHER_PAYMENT_TITLE");
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      [v28 setSubtitle:v26];

      uint64_t v24 = PKLocalizedCocoonString(@"NOTIFICATION_OTHER_PAYMENT_MESSAGE", @"%@%@", v16, v18);
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(v24);
    [v28 setBody:v27];
  }
}

- (void)_updateContentForPaymentDeclinedType:(id)a3
{
  id v13 = a3;
  if (-[PKPayLaterPayment type](self->_payment, "type") == (id)5)
  {
    if (self->_requiresGenericMessaging)
    {
      objc_msgSend((id)objc_opt_class(self, v4), "updateNotificationContentWithGenericMessaging:", v13);
    }

    else
    {
      unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKPayLaterPayment amount](self->_payment, "amount"));
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 formattedStringValue]);

      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKPayLaterFinancingPlan merchant](self->_financingPlan, "merchant"));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 displayName]);

      uint64_t v9 = PKLocalizedCocoonString(@"NOTIFICATION_PAYMENT_DECLINED_TITLE");
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      [v13 setSubtitle:v10];

      uint64_t v11 = PKLocalizedCocoonString(@"NOTIFICATION_PAYMENT_DECLINED_MESSAGE", @"%@%@", v6, v8);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      [v13 setBody:v12];
    }
  }
}

- (void)_updateContentForPaymentRefundType:(id)a3
{
  id v17 = a3;
  BOOL v4 = -[PKPayLaterPayment type](self->_payment, "type") == (id)3;
  uint64_t v6 = v17;
  if (v4)
  {
    if (self->_requiresGenericMessaging)
    {
      objc_msgSend((id)objc_opt_class(self, v5), "updateNotificationContentWithGenericMessaging:", v17);
    }

    else
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKPayLaterPayment amount](self->_payment, "amount"));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 formattedStringValue]);

      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[PKPayLaterFinancingPlan merchant](self->_financingPlan, "merchant"));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 displayName]);

      id v11 = -[PKPayLaterPayment subtype](self->_payment, "subtype");
      if ((unint64_t)v11 > 4)
      {
        BOOL v14 = 0LL;
        uint64_t v16 = 0LL;
      }

      else
      {
        id v12 = (NSString *)*(&off_1006518A0 + (void)v11);
        uint64_t v13 = PKLocalizedCocoonString(&(*(&off_100651878 + (void)v11))->isa, @"%@%@", v8, v10);
        BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        uint64_t v15 = PKLocalizedCocoonString(v12);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      }

      [v17 setSubtitle:v16];
      [v17 setBody:v14];
    }

    uint64_t v6 = v17;
  }
}

- (void)_updateContentForPaymentAdjustmentType:(id)a3
{
  id v13 = a3;
  if (-[PKPayLaterPayment type](self->_payment, "type") == (id)7
    && -[PKPayLaterPayment subtype](self->_payment, "subtype")
    && -[PKPayLaterPayment subtype](self->_payment, "subtype") != (id)1)
  {
    if (self->_requiresGenericMessaging)
    {
      objc_msgSend((id)objc_opt_class(self, v4), "updateNotificationContentWithGenericMessaging:", v13);
    }

    else
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKPayLaterFinancingPlan merchant](self->_financingPlan, "merchant"));
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 displayName]);

      uint64_t v7 = (char *)-[PKPayLaterPayment subtype](self->_payment, "subtype") - 2;
      if ((unint64_t)v7 > 2)
      {
        uint64_t v10 = 0LL;
        id v12 = 0LL;
      }

      else
      {
        uint64_t v8 = (NSString *)*(&off_100651798 + (void)v7);
        uint64_t v9 = PKLocalizedCocoonString(&(*(&off_100651780 + (void)v7))->isa, @"%@", v6);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        uint64_t v11 = PKLocalizedCocoonString(v8);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      }

      [v13 setSubtitle:v12];
      [v13 setBody:v10];
    }
  }
}

- (void).cxx_destruct
{
}

@end
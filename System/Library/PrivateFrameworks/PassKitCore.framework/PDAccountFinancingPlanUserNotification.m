@interface PDAccountFinancingPlanUserNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForFinancingPlan:(id)a3 updateType:(int64_t)a4;
- (BOOL)isValid;
- (PDAccountFinancingPlanUserNotification)initWithCoder:(id)a3;
- (PDAccountFinancingPlanUserNotification)initWithFinancingPlan:(id)a3 updateType:(int64_t)a4 passUniqueIdentifier:(id)a5;
- (id)applicationMessageContent;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDAccountFinancingPlanUserNotification

+ (id)notificationIdentifierForFinancingPlan:(id)a3 updateType:(int64_t)a4
{
  uint64_t v5 = objc_claimAutoreleasedReturnValue([a3 planIdentifier]);
  v6 = (void *)v5;
  else {
    uint64_t v7 = (uint64_t)*(&off_100651768 + a4);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"financingPlan-%@-updateType-%@",  v5,  v7));

  return v8;
}

- (PDAccountFinancingPlanUserNotification)initWithFinancingPlan:(id)a3 updateType:(int64_t)a4 passUniqueIdentifier:(id)a5
{
  id v9 = a3;
  v10 = 0LL;
  if (v9 && a4)
  {
    id v11 = a5;
    id v13 = objc_msgSend((id)objc_opt_class(self, v12), "notificationIdentifierForFinancingPlan:updateType:", v9, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v19.receiver = self;
    v19.super_class = (Class)&OBJC_CLASS___PDAccountFinancingPlanUserNotification;
    v15 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v19,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v14,  v11);

    if (v15)
    {
      objc_storeStrong((id *)&v15->_financingPlan, a3);
      v15->_updateType = a4;
      -[PDUserNotification setCustomActionRoute:]( v15,  "setCustomActionRoute:",  PKUserNotificationActionRoutePayLaterViewFinancingPlan);
      uint64_t v20 = PKUserNotificationActionQueryItemFinancingPlanIdentifier;
      v16 = (void *)objc_claimAutoreleasedReturnValue([v9 planIdentifier]);
      v21 = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
      -[PDUserNotification setCustomActionQueryParameters:](v15, "setCustomActionQueryParameters:", v17);
    }

    self = v15;

    v10 = self;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDAccountFinancingPlanUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDAccountFinancingPlanUserNotification;
  v6 = -[PDUserNotification initWithCoder:](&v11, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKPayLaterFinancingPlan, v5),  @"financingPlan");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    financingPlan = v6->_financingPlan;
    v6->_financingPlan = (PKPayLaterFinancingPlan *)v8;

    v6->_updateType = (int64_t)[v4 decodeIntegerForKey:@"updateType"];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDAccountFinancingPlanUserNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_financingPlan, @"financingPlan", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_updateType forKey:@"updateType"];
}

- (unint64_t)notificationType
{
  return 44LL;
}

- (BOOL)isValid
{
  return self->_updateType != 0;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___PDAccountFinancingPlanUserNotification;
  id v4 = a3;
  id v5 = -[PDUserNotification notificationContentWithDataSource:](&v22, "notificationContentWithDataSource:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[PDUserNotification updatePassNameForNotificationContent:dataSource:]( self,  "updatePassNameForNotificationContent:dataSource:",  v6,  v4);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  int64_t updateType = self->_updateType;
  if (updateType == 2)
  {
    uint64_t v17 = PKLocalizedCocoonString(@"NOTIFICATION_PAYMENT_CANCELED_TITLE");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v17);
    uint64_t v18 = PKLocalizedCocoonString(@"NOTIFICATION_PAYMENT_CANCELED_MESSAGE_NO_MERCHANT");
    v14 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PKPayLaterFinancingPlan merchant](self->_financingPlan, "merchant"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 displayName]);
    if (v15 && ([v15 displayNameIsFallbackString] & 1) == 0 && v16)
    {
      uint64_t v19 = PKLocalizedCocoonString(@"NOTIFICATION_PAYMENT_CANCELED_MESSAGE", @"%@", v16);
      uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);

      v14 = (void *)v20;
    }
  }

  else
  {
    if (updateType != 1)
    {
      v10 = 0LL;
      v14 = 0LL;
      goto LABEL_16;
    }

    uint64_t v9 = PKLocalizedCocoonString(@"NOTIFICATION_NEW_PURCHASE_TITLE");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    else {
      uint64_t v12 = @"NOTIFICATION_NEW_PURCHASE_MESSAGE_SETTINGS";
    }
    uint64_t v13 = PKLocalizedCocoonString(&v12->isa);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PKPayLaterFinancingPlan planSummary](self->_financingPlan, "planSummary"));
    v16 = v7;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v15 transactionDate]);
  }

  if (v10) {
    [v6 setSubtitle:v10];
  }
  if (v14) {
    [v6 setBody:v14];
  }
LABEL_16:
  [v6 setDate:v7];

  return v6;
}

- (id)applicationMessageContent
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKPayLaterFinancingPlan merchant](self->_financingPlan, "merchant"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 displayName]);
  if (v3) {
    unsigned int v5 = [v3 displayNameIsFallbackString] ^ 1;
  }
  else {
    unsigned int v5 = 0;
  }
  int64_t updateType = self->_updateType;
  if (updateType == 2)
  {
    uint64_t v16 = PKLocalizedCocoonString(@"PAY_LATER_GROUP_CANCELED_FINANCING_PLAN_MESSAGE_NO_MERCHANT");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v16);
    if (v5)
    {
      uint64_t v17 = PKLocalizedCocoonString(@"PAY_LATER_GROUP_CANCELED_FINANCING_PLAN_MESSAGE", @"%@", v4);
      uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);

      uint64_t v8 = (void *)v18;
    }

    uint64_t v19 = PKLocalizedCocoonString(@"PAY_LATER_GROUP_CANCELED_FINANCING_PLAN_TITLE");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v19);
    uint64_t v13 = self;
    v14 = v12;
    v15 = v8;
  }

  else
  {
    if (updateType != 1)
    {
      uint64_t v20 = 0LL;
      goto LABEL_14;
    }

    id v7 = v4;
    uint64_t v8 = v7;
    if (v5)
    {
      uint64_t v9 = PKLocalizedCocoonString(@"PAY_LATER_GROUP_NEW_FINANCING_PLAN_TITLE", @"%@", v7);
      uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);

      uint64_t v8 = (void *)v10;
    }

    uint64_t v11 = PKLocalizedCocoonString(@"PAY_LATER_GROUP_NEW_FINANCING_PLAN_MESSAGE");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = self;
    v14 = v8;
    v15 = v12;
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( -[PDUserNotification _payLaterApplicationMessageContentWithTitleText:messageText:]( v13,  "_payLaterApplicationMessageContentWithTitleText:messageText:",  v14,  v15));

LABEL_14:
  return v20;
}

- (void).cxx_destruct
{
}

@end
@interface PDAccountFinancingPlanScheduleUpdateNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForFinancingPlan:(id)a3 updateType:(int64_t)a4;
- (BOOL)isValid;
- (PDAccountFinancingPlanScheduleUpdateNotification)initWithCoder:(id)a3;
- (PDAccountFinancingPlanScheduleUpdateNotification)initWithFinancingPlan:(id)a3 updateType:(int64_t)a4 requiresGenericMessaging:(BOOL)a5 passUniqueIdentifier:(id)a6;
- (id)notificationContentWithDataSource:(id)a3;
- (id)planIdentifier;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDAccountFinancingPlanScheduleUpdateNotification

+ (id)notificationIdentifierForFinancingPlan:(id)a3 updateType:(int64_t)a4
{
  uint64_t v5 = objc_claimAutoreleasedReturnValue([a3 planIdentifier]);
  v6 = (void *)v5;
  else {
    uint64_t v7 = (uint64_t)*(&off_100651838 + a4);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"financingPlanScheduleUpdate-%@-%@",  v5,  v7));

  return v8;
}

- (PDAccountFinancingPlanScheduleUpdateNotification)initWithFinancingPlan:(id)a3 updateType:(int64_t)a4 requiresGenericMessaging:(BOOL)a5 passUniqueIdentifier:(id)a6
{
  id v11 = a3;
  v12 = 0LL;
  if (v11 && a4)
  {
    id v13 = a6;
    id v15 = objc_msgSend((id)objc_opt_class(self, v14), "notificationIdentifierForFinancingPlan:updateType:", v11, a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v22.receiver = self;
    v22.super_class = (Class)&OBJC_CLASS___PDAccountFinancingPlanScheduleUpdateNotification;
    v17 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v22,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v16,  v13);

    if (v17)
    {
      objc_storeStrong((id *)&v17->_financingPlan, a3);
      v17->_updateType = a4;
      v17->_requiresGenericMessaging = a5;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      -[PDUserNotification setDate:](v17, "setDate:", v18);

      -[PDUserNotification setCustomActionRoute:]( v17,  "setCustomActionRoute:",  PKUserNotificationActionRoutePayLaterViewFinancingPlan);
      uint64_t v23 = PKUserNotificationActionQueryItemFinancingPlanIdentifier;
      v19 = (void *)objc_claimAutoreleasedReturnValue([v11 planIdentifier]);
      v24 = v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
      -[PDUserNotification setCustomActionQueryParameters:](v17, "setCustomActionQueryParameters:", v20);
    }

    self = v17;

    v12 = self;
  }

  return v12;
}

- (id)planIdentifier
{
  return -[PKPayLaterFinancingPlan planIdentifier](self->_financingPlan, "planIdentifier");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDAccountFinancingPlanScheduleUpdateNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDAccountFinancingPlanScheduleUpdateNotification;
  v6 = -[PDUserNotification initWithCoder:](&v11, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKPayLaterFinancingPlan, v5),  @"financingPlan");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    financingPlan = v6->_financingPlan;
    v6->_financingPlan = (PKPayLaterFinancingPlan *)v8;

    v6->_updateType = (int64_t)[v4 decodeIntegerForKey:@"updateType"];
    v6->_requiresGenericMessaging = [v4 decodeBoolForKey:@"requiresGenericMessaging"];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDAccountFinancingPlanScheduleUpdateNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_financingPlan, @"financingPlan", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_updateType forKey:@"updateType"];
  [v4 encodeBool:self->_requiresGenericMessaging forKey:@"requiresGenericMessaging"];
}

- (unint64_t)notificationType
{
  return 55LL;
}

- (BOOL)isValid
{
  return self->_updateType != 0;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___PDAccountFinancingPlanScheduleUpdateNotification;
  id v4 = a3;
  id v5 = -[PDUserNotification notificationContentWithDataSource:](&v19, "notificationContentWithDataSource:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[PDUserNotification updatePassNameForNotificationContent:dataSource:]( self,  "updatePassNameForNotificationContent:dataSource:",  v6,  v4);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKPayLaterFinancingPlan merchant](self->_financingPlan, "merchant"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 displayName]);

  switch(self->_updateType)
  {
    case 1LL:
      uint64_t v9 = PKLocalizedCocoonString(@"NOTIFICATION_FINANCING_PLAN_SCHEDULE_UPDATE_TITLE");
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      uint64_t v11 = PKLocalizedCocoonString(@"NOTIFICATION_FINANCING_PLAN_SCHEDULE_UPDATE_MESSAGE");
      uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
      goto LABEL_10;
    case 2LL:
      uint64_t v14 = PKLocalizedCocoonString(@"NOTIFICATION_FINANCING_PLAN_AMOUNT_INCREASED_TITLE");
      v10 = (void *)objc_claimAutoreleasedReturnValue(v14);
      uint64_t v15 = PKLocalizedCocoonString( @"NOTIFICATION_FINANCING_PLAN_AMOUNT_INCREASED_MESSAGE",  @"%@",  v8);
      goto LABEL_9;
    case 3LL:
      uint64_t v16 = PKLocalizedCocoonString(@"NOTIFICATION_FINANCING_PLAN_DEFERRAL_TITLE");
      v10 = (void *)objc_claimAutoreleasedReturnValue(v16);
      uint64_t v15 = PKLocalizedCocoonString(@"NOTIFICATION_FINANCING_PLAN_DEFERRAL_MESSAGE", @"%@", v8);
      goto LABEL_9;
    case 4LL:
      if (self->_requiresGenericMessaging)
      {
        +[PDAccountFinancingPlanPaymentNotification updateNotificationContentWithGenericMessaging:]( &OBJC_CLASS___PDAccountFinancingPlanPaymentNotification,  "updateNotificationContentWithGenericMessaging:",  v6);
      }

      else
      {
        uint64_t v17 = PKLocalizedCocoonString(@"NOTIFICATION_PAYMENT_REVERSED_TITLE");
        v10 = (void *)objc_claimAutoreleasedReturnValue(v17);
        uint64_t v15 = PKLocalizedCocoonString(@"NOTIFICATION_PAYMENT_REVERSED_MESSAGE", @"%@", v8);
LABEL_9:
        uint64_t v12 = objc_claimAutoreleasedReturnValue(v15);
LABEL_10:
        id v13 = (void *)v12;
        if (v12) {
          [v6 setBody:v12];
        }
        if (v10)
        {
          [v6 setSubtitle:v10];
        }

- (void).cxx_destruct
{
}

@end
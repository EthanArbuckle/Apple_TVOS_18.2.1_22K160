@interface PDAccountFinancingPlanPaidOffNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForFinancingPlan:(id)a3;
- (BOOL)isValid;
- (PDAccountFinancingPlanPaidOffNotification)initWithCoder:(id)a3;
- (PDAccountFinancingPlanPaidOffNotification)initWithFinancingPlan:(id)a3 passUniqueIdentifier:(id)a4;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDAccountFinancingPlanPaidOffNotification

+ (id)notificationIdentifierForFinancingPlan:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 planIdentifier]);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"planPaidOff-%@", v3));

  return v4;
}

- (PDAccountFinancingPlanPaidOffNotification)initWithFinancingPlan:(id)a3 passUniqueIdentifier:(id)a4
{
  id v7 = a3;
  if (v7)
  {
    id v8 = a4;
    id v10 = objc_msgSend((id)objc_opt_class(self, v9), "notificationIdentifierForFinancingPlan:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v17.receiver = self;
    v17.super_class = (Class)&OBJC_CLASS___PDAccountFinancingPlanPaidOffNotification;
    v12 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v17,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v11,  v8);

    if (v12)
    {
      objc_storeStrong((id *)&v12->_financingPlan, a3);
      -[PDUserNotification setCustomActionRoute:]( v12,  "setCustomActionRoute:",  PKUserNotificationActionRoutePayLaterViewFinancingPlan);
      uint64_t v18 = PKUserNotificationActionQueryItemFinancingPlanIdentifier;
      v13 = (void *)objc_claimAutoreleasedReturnValue([v7 planIdentifier]);
      v19 = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
      -[PDUserNotification setCustomActionQueryParameters:](v12, "setCustomActionQueryParameters:", v14);
    }

    self = v12;

    v15 = self;
  }

  else
  {
    v15 = 0LL;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDAccountFinancingPlanPaidOffNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDAccountFinancingPlanPaidOffNotification;
  v6 = -[PDUserNotification initWithCoder:](&v11, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKPayLaterFinancingPlan, v5),  @"financingPlan");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    financingPlan = v6->_financingPlan;
    v6->_financingPlan = (PKPayLaterFinancingPlan *)v8;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDAccountFinancingPlanPaidOffNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_financingPlan, @"financingPlan", v5.receiver, v5.super_class);
}

- (unint64_t)notificationType
{
  return 52LL;
}

- (BOOL)isValid
{
  return 1;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___PDAccountFinancingPlanPaidOffNotification;
  id v4 = a3;
  id v5 = -[PDUserNotification notificationContentWithDataSource:](&v20, "notificationContentWithDataSource:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[PDUserNotification updatePassNameForNotificationContent:dataSource:]( self,  "updatePassNameForNotificationContent:dataSource:",  v6,  v4);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKPayLaterFinancingPlan scheduleSummary](self->_financingPlan, "scheduleSummary"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 lastPayment]);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[PKPayLaterFinancingPlan merchant](self->_financingPlan, "merchant"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 displayName]);

  uint64_t v11 = PKLocalizedCocoonString(@"NOTIFICATION_LAST_PAYMENT_TITLE");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  [v6 setSubtitle:v12];

  uint64_t v13 = PKLocalizedCocoonString(@"NOTIFICATION_LAST_PAYMENT_MESSAGE", @"%@", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  [v6 setBody:v14];

  v15 = (void *)objc_claimAutoreleasedReturnValue([v8 postedDate]);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  objc_super v17 = v16;
  if (v15)
  {
    if ([v16 compare:v15] == (id)1) {
      uint64_t v18 = v15;
    }
    else {
      uint64_t v18 = v17;
    }
  }

  else
  {
    uint64_t v18 = 0LL;
  }

  [v6 setDate:v18];

  return v6;
}

- (void).cxx_destruct
{
}

@end
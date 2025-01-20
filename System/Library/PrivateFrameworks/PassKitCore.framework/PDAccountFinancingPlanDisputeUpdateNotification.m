@interface PDAccountFinancingPlanDisputeUpdateNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForFinancingPlan:(id)a3 dispute:(id)a4 type:(int64_t)a5;
- (BOOL)isValid;
- (PDAccountFinancingPlanDisputeUpdateNotification)initWithCoder:(id)a3;
- (PDAccountFinancingPlanDisputeUpdateNotification)initWithFinancingPlan:(id)a3 dispute:(id)a4 type:(int64_t)a5 passUniqueIdentifier:(id)a6;
- (id)disputeIdentifier;
- (id)notificationContentWithDataSource:(id)a3;
- (id)planIdentifier;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDAccountFinancingPlanDisputeUpdateNotification

+ (id)notificationIdentifierForFinancingPlan:(id)a3 dispute:(id)a4 type:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = PKPayLaterFinancingPlanDisputeStateToString([v7 state]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  else {
    v11 = *(&off_100651860 + a5);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);

  v13 = (void *)objc_claimAutoreleasedReturnValue([v8 planIdentifier]);
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"financingPlanDisputeUpdate-%@-type-%@-diputeID-%@-planID-%@",  v10,  v11,  v12,  v13));

  return v14;
}

- (PDAccountFinancingPlanDisputeUpdateNotification)initWithFinancingPlan:(id)a3 dispute:(id)a4 type:(int64_t)a5 passUniqueIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v14 = 0LL;
  if (v11)
  {
    if (v12)
    {
      id v15 = [v12 state];
      v14 = 0LL;
      if (a5 != 2)
      {
        if (v15)
        {
          id v17 = objc_msgSend( (id)objc_opt_class(self, v16),  "notificationIdentifierForFinancingPlan:dispute:type:",  v11,  v12,  a5);
          v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
          v38.receiver = self;
          v38.super_class = (Class)&OBJC_CLASS___PDAccountFinancingPlanDisputeUpdateNotification;
          v19 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v38,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v18,  v13);
          v20 = v19;
          if (v19)
          {
            objc_storeStrong((id *)&v19->_financingPlan, a3);
            objc_storeStrong((id *)&v20->_dispute, a4);
            v20->_type = a5;
            id v21 = v12;
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
            if (a5 && [v21 state] == (id)2)
            {
              v23 = (void *)objc_claimAutoreleasedReturnValue([v21 deadlineDate]);
              if (v23)
              {
                v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSCalendar calendarWithIdentifier:]( &OBJC_CLASS___NSCalendar,  "calendarWithIdentifier:",  NSCalendarIdentifierGregorian));
                v37 = v23;
                v25 = (void *)objc_claimAutoreleasedReturnValue([v24 components:28 fromDate:v23]);
                [v25 setHour:18];
                v35 = v25;
                v36 = (os_log_s *)v24;
                v26 = (void *)objc_claimAutoreleasedReturnValue([v24 dateFromComponents:v25]);

                v22 = (void *)objc_claimAutoreleasedReturnValue([v26 dateByAddingTimeInterval:-86400.0]);
                v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
                id v28 = [v27 compare:v22];

                if (v28 == (id)1)
                {
                  uint64_t v29 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));

                  v22 = (void *)v29;
                }

                v30 = v36;
                v23 = v37;
              }

              else
              {
                uint64_t Object = PKLogFacilityTypeGetObject(14LL);
                v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  id v42 = v21;
                  _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Error, no deadlineDate defined for financing plan dispute %@",  buf,  0xCu);
                }
              }
            }

            -[PDUserNotification setDate:](v20, "setDate:", v22);
            -[PDUserNotification setCustomActionRoute:]( v20,  "setCustomActionRoute:",  PKUserNotificationActionRoutePayLaterViewFinancingPlan);
            uint64_t v39 = PKUserNotificationActionQueryItemFinancingPlanIdentifier;
            v32 = (void *)objc_claimAutoreleasedReturnValue([v11 planIdentifier]);
            v40 = v32;
            v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL));
            -[PDUserNotification setCustomActionQueryParameters:](v20, "setCustomActionQueryParameters:", v33);
          }

          self = v20;

          v14 = self;
        }
      }
    }
  }

  return v14;
}

- (id)planIdentifier
{
  return -[PKPayLaterFinancingPlan planIdentifier](self->_financingPlan, "planIdentifier");
}

- (id)disputeIdentifier
{
  return -[PKPayLaterFinancingPlanDispute identifier](self->_dispute, "identifier");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDAccountFinancingPlanDisputeUpdateNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PDAccountFinancingPlanDisputeUpdateNotification;
  v6 = -[PDUserNotification initWithCoder:](&v15, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKPayLaterFinancingPlan, v5),  @"financingPlan");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    financingPlan = v6->_financingPlan;
    v6->_financingPlan = (PKPayLaterFinancingPlan *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKPayLaterFinancingPlanDispute, v10),  @"dispute");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    dispute = v6->_dispute;
    v6->_dispute = (PKPayLaterFinancingPlanDispute *)v12;

    v6->_type = (int64_t)[v4 decodeIntegerForKey:@"updateType"];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDAccountFinancingPlanDisputeUpdateNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_financingPlan, @"financingPlan", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_dispute forKey:@"dispute"];
  [v4 encodeInteger:self->_type forKey:@"updateType"];
}

- (unint64_t)notificationType
{
  return 56LL;
}

- (BOOL)isValid
{
  return 1;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___PDAccountFinancingPlanDisputeUpdateNotification;
  id v4 = a3;
  id v5 = -[PDUserNotification notificationContentWithDataSource:](&v20, "notificationContentWithDataSource:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[PDUserNotification updatePassNameForNotificationContent:dataSource:]( self,  "updatePassNameForNotificationContent:dataSource:",  v6,  v4);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKPayLaterFinancingPlan merchant](self->_financingPlan, "merchant"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 displayName]);

  switch((unint64_t)-[PKPayLaterFinancingPlanDispute state](self->_dispute, "state"))
  {
    case 1uLL:
      int64_t type = self->_type;
      if (type != 1) {
        goto LABEL_6;
      }
      goto LABEL_4;
    case 2uLL:
      int64_t type = self->_type;
      if (type == 1)
      {
        uint64_t v18 = PKLocalizedCocoonString(@"NOTIFICATION_FINANCING_PLAN_DISPUTE_EVIDENCE_TITLE");
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v18);
        uint64_t v19 = PKLocalizedCocoonString(@"NOTIFICATION_FINANCING_PLAN_DISPUTE_EVIDENCE_MESSAGE");
        uint64_t v15 = objc_claimAutoreleasedReturnValue(v19);
      }

      else
      {
LABEL_6:
        if (type)
        {
LABEL_13:
          uint64_t v16 = 0LL;
          goto LABEL_14;
        }

        uint64_t v14 = PKLocalizedCocoonString(@"NOTIFICATION_FINANCING_PLAN_DISPUTE_UNRESOLVED_TITLE");
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v14);
        uint64_t v11 = PKLocalizedCocoonString( @"NOTIFICATION_FINANCING_PLAN_DISPUTE_UNRESOLVED_MESSAGE",  @"%@",  v8);
LABEL_8:
        uint64_t v15 = objc_claimAutoreleasedReturnValue(v11);
      }

      uint64_t v16 = (void *)v15;
      if (v15) {
        [v6 setBody:v15];
      }
      if (v10)
      {
        [v6 setSubtitle:v10];
      }

- (void).cxx_destruct
{
}

@end
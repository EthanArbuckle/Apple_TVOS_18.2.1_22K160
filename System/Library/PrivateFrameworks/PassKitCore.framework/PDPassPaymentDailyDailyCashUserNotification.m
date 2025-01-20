@interface PDPassPaymentDailyDailyCashUserNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForDate:(id)a3;
- (NSDateComponents)dateComponents;
- (NSSet)monthlyRewardTypes;
- (PDPassPaymentDailyDailyCashUserNotification)initWithCoder:(id)a3;
- (PDPassPaymentDailyDailyCashUserNotification)initWithMonthlyAmount:(id)a3 date:(id)a4 forPassUniqueIdentifier:(id)a5 lastRedemptionType:(unint64_t)a6 monthlyRewardTypes:(id)a7;
- (PKCurrencyAmount)monthlyAmount;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPassPaymentDailyDailyCashUserNotification

+ (id)notificationIdentifierForDate:(id)a3
{
  id v3 = a3;
  if (v3
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar")),
        v5 = (void *)objc_claimAutoreleasedReturnValue([v4 components:30 fromDate:v3]),
        v4,
        v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"dailycash-%lu-%lu-%lu-%lu",  [v5 era],  objc_msgSend(v5, "year"),  objc_msgSend(v5, "month"),  objc_msgSend(v5, "day")));
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

- (PDPassPaymentDailyDailyCashUserNotification)initWithMonthlyAmount:(id)a3 date:(id)a4 forPassUniqueIdentifier:(id)a5 lastRedemptionType:(unint64_t)a6 monthlyRewardTypes:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if (!v14)
  {
    v18 = 0LL;
LABEL_7:

    v22 = 0LL;
    goto LABEL_8;
  }

  unint64_t v33 = a6;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 components:30 fromDate:v14]);

  if (!v15 || !v18) {
    goto LABEL_7;
  }
  id v20 = objc_msgSend((id)objc_opt_class(self, v19), "notificationIdentifierForDate:", v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___PDPassPaymentDailyDailyCashUserNotification;
  v22 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v34,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v21,  v15);

  if (v22)
  {
    uint32_t v23 = arc4random_uniform(0x384u);
    id v32 = v13;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 dateFromComponents:v18]);
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 dateByAddingTimeInterval:(double)v23 + 115200.0]);

    objc_storeStrong((id *)&v22->_monthlyAmount, a3);
    objc_storeStrong((id *)&v22->_dateComponents, v18);
    objc_storeStrong((id *)&v22->_monthlyRewardTypes, a7);
    -[PDUserNotification setDate:](v22, "setDate:", v26);
    -[PDUserNotification setReissueBannerOnUpdate:](v22, "setReissueBannerOnUpdate:", 0LL);
    -[PDUserNotification setAssetType:](v22, "setAssetType:", 2LL);
    -[PDUserNotification setCustomActionRoute:]( v22,  "setCustomActionRoute:",  PKUserNotificationActionRouteViewDailyCash);
    uint64_t v27 = PKW3CDateStringFromDate(v14);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v35[0] = PKUserNotificationActionQueryItemDate;
    v35[1] = PKUserNotificationActionQueryItemPassUniqueIdentifier;
    v36[0] = v28;
    v36[1] = v15;
    v35[2] = PKUserNotificationActionQueryItemRedemptionType;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%lu", v33));
    v36[2] = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v36,  v35,  3LL));
    -[PDUserNotification setCustomActionQueryParameters:](v22, "setCustomActionQueryParameters:", v30);

    id v13 = v32;
  }

- (PDPassPaymentDailyDailyCashUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___PDPassPaymentDailyDailyCashUserNotification;
  v6 = -[PDUserNotification initWithCoder:](&v22, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKCurrencyAmount, v5),  @"monthlyAmount");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    monthlyAmount = v6->_monthlyAmount;
    v6->_monthlyAmount = (PKCurrencyAmount *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSDateComponents, v10),  @"components");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    dateComponents = v6->_dateComponents;
    v6->_dateComponents = (NSDateComponents *)v12;

    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSSet, v14);
    v17 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v15,  objc_opt_class(&OBJC_CLASS___NSNumber, v16),  0LL);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    uint64_t v19 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v18 forKey:@"monthlyRewardTypes"]);
    monthlyRewardTypes = v6->_monthlyRewardTypes;
    v6->_monthlyRewardTypes = (NSSet *)v19;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDPassPaymentDailyDailyCashUserNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_monthlyAmount, @"monthlyAmount", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_dateComponents forKey:@"components"];
  [v4 encodeObject:self->_monthlyRewardTypes forKey:@"monthlyRewardTypes"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)notificationType
{
  return 23LL;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PDPassPaymentDailyDailyCashUserNotification;
  id v4 = -[PDUserNotification notificationContentWithDataSource:](&v8, "notificationContentWithDataSource:", a3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification date](self, "date"));
  [v5 setDate:v6];

  return v5;
}

- (NSDateComponents)dateComponents
{
  return self->_dateComponents;
}

- (PKCurrencyAmount)monthlyAmount
{
  return self->_monthlyAmount;
}

- (NSSet)monthlyRewardTypes
{
  return self->_monthlyRewardTypes;
}

- (void).cxx_destruct
{
}

@end
@interface PDPassExpressModeEnabledUserNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)promotionActive;
- (NSDate)promoteEndDate;
- (PDPassExpressModeEnabledUserNotification)initWithCoder:(id)a3;
- (PDPassExpressModeEnabledUserNotification)initWithTitle:(id)a3 message:(id)a4 forPassUniqueIdentifier:(id)a5;
- (PDPassExpressModeEnabledUserNotification)initWithTitle:(id)a3 message:(id)a4 forPassUniqueIdentifier:(id)a5 hideDisableAction:(unint64_t)a6 promoteDuration:(double)a7;
- (id)initAsUnpromotedReplacementForNotification:(id)a3;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)hideDisableAction;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPassExpressModeEnabledUserNotification

- (PDPassExpressModeEnabledUserNotification)initWithTitle:(id)a3 message:(id)a4 forPassUniqueIdentifier:(id)a5 hideDisableAction:(unint64_t)a6 promoteDuration:(double)a7
{
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray safelyAddObject:](v15, "safelyAddObject:", v14);
  -[NSMutableArray safelyAddObject:](v15, "safelyAddObject:", v13);
  -[NSMutableArray safelyAddObject:](v15, "safelyAddObject:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a6));
  -[NSMutableArray safelyAddObject:](v15, "safelyAddObject:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a7));
  -[NSMutableArray safelyAddObject:](v15, "safelyAddObject:", v17);

  v18 = -[PDGenericUserNotification _initWithTitle:subtitle:message:forPassUniqueIdentifier:hashComponents:]( self,  "_initWithTitle:subtitle:message:forPassUniqueIdentifier:hashComponents:",  v14,  0LL,  v13,  v12,  v15);
  if (v18)
  {
    -[PDUserNotification setCustomActionRoute:](v18, "setCustomActionRoute:", PKUserNotificationActionRouteViewPass);
    -[PDUserNotification setCustomActionVerb:]( v18,  "setCustomActionVerb:",  PKUserNotificationActionRouteViewPassExpressPromotion);
    v18->_hideDisableAction = a6;
    if (a6)
    {
      v19 = @"true";
      if (a6 != 1) {
        v19 = 0LL;
      }
      if (a6 == 2) {
        v19 = @"false";
      }
      uint64_t v25 = PKUserNotificationActionQueryItemExpressModeEnabledHideDisableAction;
      v26 = v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
      -[PDUserNotification setCustomActionQueryParameters:](v18, "setCustomActionQueryParameters:", v20);
    }

    if (a7 > 0.0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification date](v18, "date"));
      uint64_t v22 = objc_claimAutoreleasedReturnValue([v21 dateByAddingTimeInterval:a7]);
      promoteEndDate = v18->_promoteEndDate;
      v18->_promoteEndDate = (NSDate *)v22;
    }
  }

  return v18;
}

- (id)initAsUnpromotedReplacementForNotification:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 message]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 passUniqueIdentifier]);
  v8 = -[PDPassExpressModeEnabledUserNotification initWithTitle:message:forPassUniqueIdentifier:hideDisableAction:promoteDuration:]( self,  "initWithTitle:message:forPassUniqueIdentifier:hideDisableAction:promoteDuration:",  v5,  v6,  v7,  [v4 hideDisableAction],  0.0);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 date]);
    -[PDUserNotification setDate:](v8, "setDate:", v9);

    -[PDUserNotification setSuppressionBehavior:](v8, "setSuppressionBehavior:", 2LL);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 customActionQueryParameters]);
    -[PDUserNotification setCustomActionQueryParameters:](v8, "setCustomActionQueryParameters:", v10);
  }

  return v8;
}

- (PDPassExpressModeEnabledUserNotification)initWithTitle:(id)a3 message:(id)a4 forPassUniqueIdentifier:(id)a5
{
  return -[PDPassExpressModeEnabledUserNotification initWithTitle:message:forPassUniqueIdentifier:hideDisableAction:promoteDuration:]( self,  "initWithTitle:message:forPassUniqueIdentifier:hideDisableAction:promoteDuration:",  a3,  a4,  a5,  0LL,  0.0);
}

- (BOOL)promotionActive
{
  promoteEndDate = self->_promoteEndDate;
  if (promoteEndDate)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    LOBYTE(promoteEndDate) = (id)-[NSDate compare:](promoteEndDate, "compare:", v3) == (id)1;
  }

  return (char)promoteEndDate;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPassExpressModeEnabledUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PDPassExpressModeEnabledUserNotification;
  v6 = -[PDGenericUserNotification initWithCoder:](&v14, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v5),  @"hideDisableAction");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v6->_hideDisableAction = (unint64_t)[v8 integerValue];

    id v10 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSDate, v9),  @"promotionEndDate");
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
    promoteEndDate = v6->_promoteEndDate;
    v6->_promoteEndDate = (NSDate *)v11;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PDPassExpressModeEnabledUserNotification;
  id v4 = a3;
  -[PDGenericUserNotification encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_hideDisableAction,  v6.receiver,  v6.super_class));
  [v4 encodeObject:v5 forKey:@"hideDisableAction"];

  [v4 encodeObject:self->_promoteEndDate forKey:@"promotionEndDate"];
}

- (unint64_t)notificationType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassExpressModeEnabledUserNotification promoteEndDate](self, "promoteEndDate"));

  if (v2) {
    return 32LL;
  }
  else {
    return 28LL;
  }
}

- (id)notificationContentWithDataSource:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDPassExpressModeEnabledUserNotification;
  id v3 = -[PDGenericUserNotification notificationContentWithDataSource:](&v5, "notificationContentWithDataSource:", a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (unint64_t)hideDisableAction
{
  return self->_hideDisableAction;
}

- (NSDate)promoteEndDate
{
  return self->_promoteEndDate;
}

- (void).cxx_destruct
{
}

@end
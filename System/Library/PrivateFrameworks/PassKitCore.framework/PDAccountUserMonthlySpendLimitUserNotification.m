@interface PDAccountUserMonthlySpendLimitUserNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForAccountUserAltDSID:(id)a3 accountIdentifier:(id)a4;
- (BOOL)isValid;
- (PDAccountUserMonthlySpendLimitUserNotification)initWithAccountUser:(id)a3 familyMember:(id)a4 monthlySpendLimit:(id)a5 accountIdentifier:(id)a6 passUniqueIdentifier:(id)a7;
- (PDAccountUserMonthlySpendLimitUserNotification)initWithCoder:(id)a3;
- (PKAccountUser)accountUser;
- (PKCurrencyAmount)monthlySpendLimit;
- (PKFamilyMember)familyMember;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDAccountUserMonthlySpendLimitUserNotification

+ (id)notificationIdentifierForAccountUserAltDSID:(id)a3 accountIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"monthlySpendLimit-%@-%@",  v5,  v6);

  return v7;
}

- (PDAccountUserMonthlySpendLimitUserNotification)initWithAccountUser:(id)a3 familyMember:(id)a4 monthlySpendLimit:(id)a5 accountIdentifier:(id)a6 passUniqueIdentifier:(id)a7
{
  id v13 = a3;
  id v23 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v18 = (void *)objc_opt_class(self, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v13 altDSID]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v18 notificationIdentifierForAccountUserAltDSID:v19 accountIdentifier:v15]);

  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___PDAccountUserMonthlySpendLimitUserNotification;
  v21 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v24,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v20,  v16);

  if (v21)
  {
    objc_storeStrong((id *)&v21->_accountUser, a3);
    objc_storeStrong((id *)&v21->_familyMember, a4);
    -[PDUserNotification setAccountIdentifier:](v21, "setAccountIdentifier:", v15);
    objc_storeStrong((id *)&v21->_monthlySpendLimit, a5);
  }

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDAccountUserMonthlySpendLimitUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___PDAccountUserMonthlySpendLimitUserNotification;
  id v6 = -[PDUserNotification initWithCoder:](&v19, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKAccountUser, v5),  @"accountUser");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    accountUser = v6->_accountUser;
    v6->_accountUser = (PKAccountUser *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKFamilyMember, v10),  @"familyMember");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    familyMember = v6->_familyMember;
    v6->_familyMember = (PKFamilyMember *)v12;

    id v15 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKCurrencyAmount, v14),  @"monthlySpendLimit");
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    monthlySpendLimit = v6->_monthlySpendLimit;
    v6->_monthlySpendLimit = (PKCurrencyAmount *)v16;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDAccountUserMonthlySpendLimitUserNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_accountUser, @"accountUser", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_familyMember forKey:@"familyMember"];
  [v4 encodeObject:self->_monthlySpendLimit forKey:@"monthlySpendLimit"];
}

- (unint64_t)notificationType
{
  return 37LL;
}

- (BOOL)isValid
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDAccountUserMonthlySpendLimitUserNotification;
  BOOL v3 = -[PDUserNotification isValid](&v5, "isValid");
  if (v3)
  {
    if (self->_accountUser) {
      LOBYTE(v3) = self->_monthlySpendLimit != 0LL;
    }
    else {
      LOBYTE(v3) = 0;
    }
  }

  return v3;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___PDAccountUserMonthlySpendLimitUserNotification;
  id v4 = -[PDUserNotification notificationContentWithDataSource:](&v26, "notificationContentWithDataSource:", a3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  familyMember = self->_familyMember;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccountUser nameComponents](self->_accountUser, "nameComponents"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[PKContactResolver contactForFamilyMember:nameComponents:imageData:]( &OBJC_CLASS___PKContactResolver,  "contactForFamilyMember:nameComponents:imageData:",  familyMember,  v7,  0LL));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PKCurrencyAmount amount](self->_monthlySpendLimit, "amount"));
  [v9 floatValue];
  double v11 = v10;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 givenName]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[PKCurrencyAmount formattedStringValue](self->_monthlySpendLimit, "formattedStringValue"));
  uint64_t v14 = PKLocalizedMadisonString( @"ACCOUNT_USER_MONTHLY_SPEND_LIMIT_EXCEEDED_NOTIFICATION_BODY",  @"%lf%@%@",  *(void *)&v11,  v12,  v13);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  [v5 setBody:v15];

  uint64_t v16 = PKLocalizedMadisonString(@"ACCOUNT_USER_MONTHLY_SPEND_LIMIT_EXCEEDED_NOTIFICATION_TITLE");
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  [v5 setSubtitle:v17];
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v5 setDate:v18];

  objc_super v19 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
  id v20 = [v19 mutableCopy];
  v21 = v20;
  if (v20) {
    v22 = (NSMutableDictionary *)v20;
  }
  else {
    v22 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  id v23 = v22;

  objc_super v24 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification passUniqueIdentifier](self, "passUniqueIdentifier"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v23,  "setObject:forKeyedSubscript:",  v24,  PKUserNotificationPassUniqueIdentifierContextKey);

  [v5 setUserInfo:v23];
  return v5;
}

- (PKAccountUser)accountUser
{
  return self->_accountUser;
}

- (PKFamilyMember)familyMember
{
  return self->_familyMember;
}

- (PKCurrencyAmount)monthlySpendLimit
{
  return self->_monthlySpendLimit;
}

- (void).cxx_destruct
{
}

@end
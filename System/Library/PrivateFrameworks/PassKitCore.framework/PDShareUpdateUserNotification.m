@interface PDShareUpdateUserNotification
+ (BOOL)supportsSecureCoding;
- (NSArray)shareIdentifiers;
- (PDShareUpdateUserNotification)initWithCoder:(id)a3;
- (PDShareUpdateUserNotification)initWithTitle:(id)a3 message:(id)a4 forPassUniqueIdentifier:(id)a5 shareIdentifiers:(id)a6;
- (id)description;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDShareUpdateUserNotification

- (PDShareUpdateUserNotification)initWithTitle:(id)a3 message:(id)a4 forPassUniqueIdentifier:(id)a5 shareIdentifiers:(id)a6
{
  id v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PDShareUpdateUserNotification;
  v12 = -[PDGenericUserNotification initWithTitle:message:forPassUniqueIdentifier:]( &v17,  "initWithTitle:message:forPassUniqueIdentifier:",  a3,  a4,  a5);
  v13 = v12;
  if (v12)
  {
    -[PDUserNotification setCustomActionRoute:](v12, "setCustomActionRoute:", PKUserNotificationActionRouteViewPass);
    -[PDUserNotification setCustomActionVerb:]( v13,  "setCustomActionVerb:",  PKUserNotificationActionRouteViewShareDetails);
    objc_storeStrong((id *)&v13->_shareIdentifiers, a6);
    if (v11)
    {
      uint64_t v18 = PKUserNotificationActionQueryItemShareIdentifiers;
      v14 = (void *)objc_claimAutoreleasedReturnValue([v11 componentsJoinedByString:@","]);
      v19 = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
      -[PDUserNotification setCustomActionQueryParameters:](v13, "setCustomActionQueryParameters:", v15);
    }

    -[PDUserNotification setReissueBannerOnUpdate:](v13, "setReissueBannerOnUpdate:", 1LL);
  }

  return v13;
}

- (unint64_t)notificationType
{
  return 47LL;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p; ",
                   v5,
                   self));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification passUniqueIdentifier](self, "passUniqueIdentifier"));
  [v6 appendFormat:@"passIdentifier: '%@'; ", v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDGenericUserNotification title](self, "title"));
  [v6 appendFormat:@"title: '%@'; ", v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDGenericUserNotification message](self, "message"));
  [v6 appendFormat:@"message: '%@'; ", v9];

  [v6 appendFormat:@"shareIdentifiers: '%@'; ", self->_shareIdentifiers];
  [v6 appendFormat:@">"];
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v6));

  return v10;
}

- (PDShareUpdateUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PDShareUpdateUserNotification;
  v6 = -[PDGenericUserNotification initWithCoder:](&v14, "initWithCoder:", v4);
  if (v6)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSArray, v5);
    v9 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v7,  objc_opt_class(&OBJC_CLASS___NSString, v8),  0LL);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v10 forKey:@"shareIdentifiers"]);
    shareIdentifiers = v6->_shareIdentifiers;
    v6->_shareIdentifiers = (NSArray *)v11;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDShareUpdateUserNotification;
  id v4 = a3;
  -[PDGenericUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeObject:forKey:",  self->_shareIdentifiers,  @"shareIdentifiers",  v5.receiver,  v5.super_class);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)shareIdentifiers
{
  return self->_shareIdentifiers;
}

- (void).cxx_destruct
{
}

@end
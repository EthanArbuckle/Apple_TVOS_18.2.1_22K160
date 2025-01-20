@interface PDAccountFailedIdentityVerificationUserNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (PDAccountFailedIdentityVerificationUserNotification)initWithAccount:(id)a3 accountUser:(id)a4;
- (PDAccountFailedIdentityVerificationUserNotification)initWithCoder:(id)a3;
- (id)_messageString;
- (id)_titleString;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDAccountFailedIdentityVerificationUserNotification

- (PDAccountFailedIdentityVerificationUserNotification)initWithAccount:(id)a3 accountUser:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  v9 = objc_alloc(&OBJC_CLASS___NSString);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 accountIdentifier]);
  v11 = -[NSString initWithFormat:](v9, "initWithFormat:", @"accountFailedIdentityVerification-%@", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue([v8 associatedPassUniqueID]);
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PDAccountFailedIdentityVerificationUserNotification;
  v13 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v16,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v11,  v12);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_accountUser, a4);
    -[PDUserNotification setCustomActionVerb:]( v14,  "setCustomActionVerb:",  PKUserNotificationActionRouteViewPassDetails);
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDAccountFailedIdentityVerificationUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDAccountFailedIdentityVerificationUserNotification;
  v6 = -[PDUserNotification initWithCoder:](&v11, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKAccountUser, v5),  @"accountUser");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    accountUser = v6->_accountUser;
    v6->_accountUser = (PKAccountUser *)v8;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDAccountFailedIdentityVerificationUserNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_accountUser, @"accountUser", v5.receiver, v5.super_class);
}

- (unint64_t)notificationType
{
  return 40LL;
}

- (BOOL)isValid
{
  return self->_accountUser != 0LL;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PDAccountFailedIdentityVerificationUserNotification;
  id v4 = -[PDUserNotification notificationContentWithDataSource:](&v9, "notificationContentWithDataSource:", a3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountFailedIdentityVerificationUserNotification _titleString](self, "_titleString"));
  [v5 setSubtitle:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountFailedIdentityVerificationUserNotification _messageString](self, "_messageString"));
  [v5 setBody:v7];

  return v5;
}

- (id)_titleString
{
  return (id)PKLocalizedMadisonString(@"ACCOUNT_FAILED_IDENTITY_VERIFICATION_TITLE");
}

- (id)_messageString
{
  return (id)PKLocalizedMadisonString(@"ACCOUNT_FAILED_IDENTITY_VERIFICATION_MESSAGE");
}

- (void).cxx_destruct
{
}

@end
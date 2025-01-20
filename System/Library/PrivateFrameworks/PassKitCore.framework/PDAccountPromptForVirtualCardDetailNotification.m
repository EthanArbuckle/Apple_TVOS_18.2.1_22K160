@interface PDAccountPromptForVirtualCardDetailNotification
+ (BOOL)supportsSecureCoding;
- (NSString)virtualCardIdentifier;
- (PDAccountPromptForVirtualCardDetailNotification)initWithAccountIdentifier:(id)a3 virtualCardIdentifier:(id)a4 forPassUniqueIdentifier:(id)a5;
- (id)_notificationIdentifierForAccountIdentifier:(id)a3 virtualCardIdentifier:(id)a4;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
@end

@implementation PDAccountPromptForVirtualCardDetailNotification

- (PDAccountPromptForVirtualCardDetailNotification)initWithAccountIdentifier:(id)a3 virtualCardIdentifier:(id)a4 forPassUniqueIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( -[PDAccountPromptForVirtualCardDetailNotification _notificationIdentifierForAccountIdentifier:virtualCardIdentifier:]( self,  "_notificationIdentifierForAccountIdentifier:virtualCardIdentifier:",  v8,  v9));
    v15.receiver = self;
    v15.super_class = (Class)&OBJC_CLASS___PDAccountPromptForVirtualCardDetailNotification;
    v12 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v15,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v11,  v10);

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      -[PDUserNotification setDate:](v12, "setDate:", v13);

      -[PDUserNotification setCustomActionVerb:]( v12,  "setCustomActionVerb:",  PKUserNotificationActionRouteViewPassDetails);
    }
  }

  else
  {

    v12 = 0LL;
  }

  return v12;
}

- (id)_notificationIdentifierForAccountIdentifier:(id)a3 virtualCardIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length] && objc_msgSend(v6, "length")) {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@-promptDetailForVirtualCard",  v5,  v6));
  }
  else {
    v7 = 0LL;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)notificationType
{
  return 24LL;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PDAccountPromptForVirtualCardDetailNotification;
  id v3 = -[PDUserNotification notificationContentWithDataSource:](&v8, "notificationContentWithDataSource:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_DIRECT_TO_VIRTUAL_CARD", 2LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v4 setBody:v6];

  return v4;
}

- (NSString)virtualCardIdentifier
{
  return self->_virtualCardIdentifier;
}

- (void).cxx_destruct
{
}

@end
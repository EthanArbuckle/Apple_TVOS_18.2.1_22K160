@interface PDSharingRelayServerUpdateMailboxResponse
+ (BOOL)jsonDataOptional;
- (BOOL)supportsPushNotifications;
- (PDSharingRelayServerUpdateMailboxResponse)initWithData:(id)a3;
- (void)setSupportsPushNotifications:(BOOL)a3;
@end

@implementation PDSharingRelayServerUpdateMailboxResponse

- (PDSharingRelayServerUpdateMailboxResponse)initWithData:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PDSharingRelayServerUpdateMailboxResponse;
  v3 = -[PDSharingRelayServerUpdateMailboxResponse initWithData:](&v9, "initWithData:", a3);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDSharingRelayServerUpdateMailboxResponse JSONObject](v3, "JSONObject"));
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary, v6);
    if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0) {
      v4->_supportsPushNotifications = [v5 PKBoolForKey:@"isPushNotificationSupported"];
    }
  }

  return v4;
}

+ (BOOL)jsonDataOptional
{
  return 1;
}

- (BOOL)supportsPushNotifications
{
  return self->_supportsPushNotifications;
}

- (void)setSupportsPushNotifications:(BOOL)a3
{
  self->_supportsPushNotifications = a3;
}

@end
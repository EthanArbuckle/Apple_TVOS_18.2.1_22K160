@interface PDSharingRelayServerCreateMailboxResponse
- (BOOL)supportsPushNotifications;
- (NSString)mailboxURL;
- (PDSharingRelayServerCreateMailboxResponse)initWithData:(id)a3;
- (void)setMailboxURL:(id)a3;
- (void)setSupportsPushNotifications:(BOOL)a3;
@end

@implementation PDSharingRelayServerCreateMailboxResponse

- (PDSharingRelayServerCreateMailboxResponse)initWithData:(id)a3
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___PDSharingRelayServerCreateMailboxResponse;
  v3 = -[PDSharingRelayServerCreateMailboxResponse initWithData:](&v25, "initWithData:", a3);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDSharingRelayServerCreateMailboxResponse JSONObject](v3, "JSONObject"));
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary, v6);
    if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v5 PKStringForKey:@"urlLink"]);
      v9 = v8;
      if (!v8) {
        v9 = (void *)objc_claimAutoreleasedReturnValue([v5 PKStringForKey:@"mailboxIdentifier"]);
      }
      objc_storeStrong((id *)&v4->_mailboxURL, v9);
      if (!v8) {

      }
      if (!v4->_mailboxURL)
      {
        uint64_t Object = PKLogFacilityTypeGetObject(6LL);
        v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v13 = (void *)objc_opt_class(v4, v12);
          *(_DWORD *)buf = 138412290;
          v27 = v13;
          id v14 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Malformed response: missing mailbox url link inside %@",  buf,  0xCu);
        }

        v4 = 0LL;
      }

      v4->_supportsPushNotifications = [v5 PKBoolForKey:@"isPushNotificationSupported"];
    }

    else
    {
      uint64_t v15 = PKLogFacilityTypeGetObject(6LL);
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (objc_class *)objc_opt_class(v5, v17);
        v19 = NSStringFromClass(v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        v22 = (void *)objc_opt_class(v4, v21);
        *(_DWORD *)buf = 138543618;
        v27 = v20;
        __int16 v28 = 2112;
        v29 = v22;
        id v23 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Malformed response: expected dictionary and received %{public}@ inside %@",  buf,  0x16u);
      }

      v4 = 0LL;
    }
  }

  return v4;
}

- (BOOL)supportsPushNotifications
{
  return self->_supportsPushNotifications;
}

- (void)setSupportsPushNotifications:(BOOL)a3
{
  self->_supportsPushNotifications = a3;
}

- (NSString)mailboxURL
{
  return self->_mailboxURL;
}

- (void)setMailboxURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
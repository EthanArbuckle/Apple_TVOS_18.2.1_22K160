@interface IDSProfileValidateInvitationContext
- (BOOL)wantsBAASigning;
- (BOOL)wantsExtraTimeoutRetry;
- (IDSProfileValidateInvitationContext)init;
- (NSDictionary)responseExtraInfo;
- (NSString)basePhoneNumber;
- (NSString)regionID;
- (NSString)responseBasePhoneNumber;
- (NSString)responseRegionID;
- (double)anisetteHeadersTimeout;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (int)maxTimeoutRetries;
- (void)handleResponseDictionary:(id)a3;
- (void)setBasePhoneNumber:(id)a3;
- (void)setRegionID:(id)a3;
- (void)setResponseBasePhoneNumber:(id)a3;
- (void)setResponseExtraInfo:(id)a3;
- (void)setResponseRegionID:(id)a3;
@end

@implementation IDSProfileValidateInvitationContext

- (IDSProfileValidateInvitationContext)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IDSProfileValidateInvitationContext;
  v2 = -[IDSProfileMessage init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[IDSProfileValidateInvitationContext setTimeout:](v2, "setTimeout:", 120.0);
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___IDSProfileValidateInvitationContext;
  id v4 = -[IDSProfileMessage copyWithZone:](&v11, "copyWithZone:", a3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProfileValidateInvitationContext basePhoneNumber](self, "basePhoneNumber"));
  [v4 setBasePhoneNumber:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProfileValidateInvitationContext regionID](self, "regionID"));
  [v4 setRegionID:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProfileValidateInvitationContext responseBasePhoneNumber](self, "responseBasePhoneNumber"));
  [v4 setResponseBasePhoneNumber:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProfileValidateInvitationContext responseRegionID](self, "responseRegionID"));
  [v4 setResponseRegionID:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProfileValidateInvitationContext responseExtraInfo](self, "responseExtraInfo"));
  [v4 setResponseExtraInfo:v9];

  return v4;
}

- (BOOL)wantsExtraTimeoutRetry
{
  return 1;
}

- (int)maxTimeoutRetries
{
  return 2;
}

- (BOOL)wantsBAASigning
{
  return 1;
}

- (id)bagKey
{
  return @"vc-profile-validate-invitation-context";
}

- (id)requiredKeys
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObject:](v2, "addObject:", @"base-phone-number");
  -[NSMutableArray addObject:](v2, "addObject:", @"region-id");
  return v2;
}

- (id)messageBody
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProfileValidateInvitationContext basePhoneNumber](self, "basePhoneNumber"));
  if (v4)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"base-phone-number", v4);
  }

  else
  {
    BOOL v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v5) {
      sub_10069CF04(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProfileValidateInvitationContext regionID](self, "regionID"));
  if (v13)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"region-id", v13);
  }

  else
  {
    BOOL v14 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v14) {
      sub_10069CE78(v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }

  return v3;
}

- (double)anisetteHeadersTimeout
{
  return 5.0;
}

- (void)handleResponseDictionary:(id)a3
{
  id v4 = a3;
  if (_IMWillLog(@"Registration", v5))
  {
    id v9 = v4;
    _IMAlwaysLog(0LL, @"Registration", @"Profile validation response: %@");
  }

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___IDSProfileValidateInvitationContext;
  -[IDSProfileMessage handleResponseDictionary:](&v10, "handleResponseDictionary:", v4, v9);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"region-id"]);
  -[IDSProfileValidateInvitationContext setResponseRegionID:](self, "setResponseRegionID:", v6);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"base-phone-number"]);
  -[IDSProfileValidateInvitationContext setResponseBasePhoneNumber:](self, "setResponseBasePhoneNumber:", v7);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"extra"]);
  -[IDSProfileValidateInvitationContext setResponseExtraInfo:](self, "setResponseExtraInfo:", v8);
}

- (NSString)basePhoneNumber
{
  return (NSString *)objc_getProperty(self, a2, 280LL, 1);
}

- (void)setBasePhoneNumber:(id)a3
{
}

- (NSString)regionID
{
  return (NSString *)objc_getProperty(self, a2, 288LL, 1);
}

- (void)setRegionID:(id)a3
{
}

- (NSString)responseBasePhoneNumber
{
  return (NSString *)objc_getProperty(self, a2, 296LL, 1);
}

- (void)setResponseBasePhoneNumber:(id)a3
{
}

- (NSString)responseRegionID
{
  return (NSString *)objc_getProperty(self, a2, 304LL, 1);
}

- (void)setResponseRegionID:(id)a3
{
}

- (NSDictionary)responseExtraInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 312LL, 1);
}

- (void)setResponseExtraInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
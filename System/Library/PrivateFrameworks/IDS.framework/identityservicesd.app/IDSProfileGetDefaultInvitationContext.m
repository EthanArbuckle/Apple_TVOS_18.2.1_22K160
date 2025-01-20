@interface IDSProfileGetDefaultInvitationContext
- (BOOL)responseValidated;
- (BOOL)wantsBAASigning;
- (IDSProfileGetDefaultInvitationContext)init;
- (NSDictionary)responseExtraInfo;
- (NSString)responseBasePhoneNumber;
- (NSString)responseRegionID;
- (double)anisetteHeadersTimeout;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (void)handleResponseDictionary:(id)a3;
- (void)setResponseBasePhoneNumber:(id)a3;
- (void)setResponseExtraInfo:(id)a3;
- (void)setResponseRegionID:(id)a3;
- (void)setResponseValidated:(BOOL)a3;
@end

@implementation IDSProfileGetDefaultInvitationContext

- (IDSProfileGetDefaultInvitationContext)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IDSProfileGetDefaultInvitationContext;
  v2 = -[IDSProfileMessage init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[IDSProfileGetDefaultInvitationContext setTimeout:](v2, "setTimeout:", 240.0);
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSProfileGetDefaultInvitationContext;
  id v4 = -[IDSProfileMessage copyWithZone:](&v9, "copyWithZone:", a3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProfileGetDefaultInvitationContext responseBasePhoneNumber](self, "responseBasePhoneNumber"));
  [v4 setResponseBasePhoneNumber:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProfileGetDefaultInvitationContext responseRegionID](self, "responseRegionID"));
  [v4 setResponseRegionID:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProfileGetDefaultInvitationContext responseExtraInfo](self, "responseExtraInfo"));
  [v4 setResponseExtraInfo:v7];

  objc_msgSend( v4,  "setResponseValidated:",  -[IDSProfileGetDefaultInvitationContext responseValidated](self, "responseValidated"));
  return v4;
}

- (id)bagKey
{
  return @"vc-profile-get-default-invitation-context";
}

- (id)requiredKeys
{
  return objc_alloc_init(&OBJC_CLASS___NSMutableArray);
}

- (id)messageBody
{
  return objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
}

- (double)anisetteHeadersTimeout
{
  return 5.0;
}

- (BOOL)wantsBAASigning
{
  return 1;
}

- (void)handleResponseDictionary:(id)a3
{
  id v4 = a3;
  if (_IMWillLog(@"Registration", v5))
  {
    id v10 = v4;
    _IMAlwaysLog(0LL, @"Registration", @"Default invitation context response: %@");
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___IDSProfileGetDefaultInvitationContext;
  -[IDSProfileMessage handleResponseDictionary:](&v11, "handleResponseDictionary:", v4, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"region-id"]);
  -[IDSProfileGetDefaultInvitationContext setResponseRegionID:](self, "setResponseRegionID:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"base-phone-number"]);
  -[IDSProfileGetDefaultInvitationContext setResponseBasePhoneNumber:](self, "setResponseBasePhoneNumber:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"extra"]);
  -[IDSProfileGetDefaultInvitationContext setResponseExtraInfo:](self, "setResponseExtraInfo:", v8);

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"validated"]);
  -[IDSProfileGetDefaultInvitationContext setResponseValidated:]( self,  "setResponseValidated:",  [v9 intValue] != 0);
}

- (NSString)responseBasePhoneNumber
{
  return (NSString *)objc_getProperty(self, a2, 288LL, 1);
}

- (void)setResponseBasePhoneNumber:(id)a3
{
}

- (NSString)responseRegionID
{
  return (NSString *)objc_getProperty(self, a2, 296LL, 1);
}

- (void)setResponseRegionID:(id)a3
{
}

- (NSDictionary)responseExtraInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 304LL, 1);
}

- (void)setResponseExtraInfo:(id)a3
{
}

- (BOOL)responseValidated
{
  return self->_responseValidated;
}

- (void)setResponseValidated:(BOOL)a3
{
  self->_responseValidated = a3;
}

- (void).cxx_destruct
{
}

@end
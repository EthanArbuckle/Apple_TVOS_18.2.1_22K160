@interface TKSmartCardToken
- (NSData)AID;
- (TKSmartCard)smartCard;
- (TKSmartCardToken)initWithSmartCard:(TKSmartCard *)smartCard AID:(NSData *)AID instanceID:(NSString *)instanceID tokenDriver:(TKSmartCardTokenDriver *)tokenDriver;
- (id)keepAlive;
- (void)setKeepAlive:(id)a3;
@end

@implementation TKSmartCardToken

- (TKSmartCardToken)initWithSmartCard:(TKSmartCard *)smartCard AID:(NSData *)AID instanceID:(NSString *)instanceID tokenDriver:(TKSmartCardTokenDriver *)tokenDriver
{
  v10 = smartCard;
  v11 = AID;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___TKSmartCardToken;
  v12 = -[TKToken initWithTokenDriver:instanceID:](&v20, sel_initWithTokenDriver_instanceID_, tokenDriver, instanceID);
  if (v12)
  {
    v13 = -[TKSmartCard slot](v10, "slot");
    uint64_t v14 = [v13 makeSmartCard];
    v15 = v12->_smartCard;
    v12->_smartCard = (TKSmartCard *)v14;

    objc_storeStrong((id *)&v12->_AID, AID);
    v16 = objc_alloc(&OBJC_CLASS___TKTokenKeychainContents);
    v17 = -[TKToken configuration](v12, "configuration");
    v18 = -[TKTokenKeychainContents initWithConfiguration:](v16, "initWithConfiguration:", v17);
    -[TKToken setKeychainContents:](v12, "setKeychainContents:", v18);
  }

  return v12;
}

- (NSData)AID
{
  return (NSData *)objc_getProperty(self, a2, 48LL, 1);
}

- (TKSmartCard)smartCard
{
  return self->_smartCard;
}

- (id)keepAlive
{
  return self->_keepAlive;
}

- (void)setKeepAlive:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
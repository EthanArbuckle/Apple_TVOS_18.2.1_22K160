@interface MAPushNotification
+ (BOOL)supportsSecureCoding;
- (MAPushNotification)initWithCoder:(id)a3;
- (MAPushNotification)initWithUserInfo:(id)a3;
- (NSDictionary)pushPayload;
- (void)setPushPayload:(id)a3;
@end

@implementation MAPushNotification

- (MAPushNotification)initWithUserInfo:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MAPushNotification;
  v5 = -[MAPushNotification init](&v9, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"aps"]);
    pushPayload = v5->_pushPayload;
    v5->_pushPayload = (NSDictionary *)v6;
  }

  return v5;
}

- (MAPushNotification)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MAPushNotification;
  return -[MAPushNotification init](&v4, "init", a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)pushPayload
{
  return (NSDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setPushPayload:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
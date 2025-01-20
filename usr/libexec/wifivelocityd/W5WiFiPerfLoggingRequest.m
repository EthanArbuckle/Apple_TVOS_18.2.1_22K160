@interface W5WiFiPerfLoggingRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToWiFiPerfLoggingRequest:(id)a3;
- (NSDictionary)configuration;
- (NSUUID)uuid;
- (OS_os_transaction)transaction;
- (W5WiFiPerfLoggingRequest)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)reply;
- (unint64_t)hash;
- (void)dealloc;
- (void)setConfiguration:(id)a3;
- (void)setReply:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation W5WiFiPerfLoggingRequest

- (W5WiFiPerfLoggingRequest)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___W5WiFiPerfLoggingRequest;
  v2 = -[W5WiFiPerfLoggingRequest init](&v5, "init");
  if (v2)
  {
    uint64_t v3 = os_transaction_create("com.apple.wifivelocity.W5WiFiPerfLoggingRequest");
    objc_msgSend( +[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"),  "osTransactionCreate:transaction:",  "com.apple.wifivelocity.W5WiFiPerfLoggingRequest",  v3);
    v2->_transaction = (OS_os_transaction *)v3;
  }

  return v2;
}

- (void)dealloc
{
  self->_transaction = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___W5WiFiPerfLoggingRequest;
  -[W5WiFiPerfLoggingRequest dealloc](&v3, "dealloc");
}

- (id)description
{
  objc_super v3 = +[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 0LL);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"UUID: %@\n", self->_uuid);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"Configuration: %@\n", self->_configuration);
  return -[NSMutableString copy](v3, "copy");
}

- (BOOL)isEqualToWiFiPerfLoggingRequest:(id)a3
{
  return -[NSUUID isEqual:](self->_uuid, "isEqual:", [a3 uuid]);
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (a3)
  {
    uint64_t v5 = objc_opt_class(self, a2);
    if ((objc_opt_isKindOfClass(a3, v5) & 1) != 0) {
      return -[W5WiFiPerfLoggingRequest isEqualToWiFiPerfLoggingRequest:](self, "isEqualToWiFiPerfLoggingRequest:", a3);
    }
  }

  return 0;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSUUID hash](self->_uuid, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = -[W5WiFiPerfLoggingRequest init]( +[W5WiFiPerfLoggingRequest allocWithZone:](&OBJC_CLASS___W5WiFiPerfLoggingRequest, "allocWithZone:", a3),  "init");
  -[W5WiFiPerfLoggingRequest setUuid:](v4, "setUuid:", self->_uuid);
  -[W5WiFiPerfLoggingRequest setConfiguration:](v4, "setConfiguration:", self->_configuration);
  -[W5WiFiPerfLoggingRequest setReply:](v4, "setReply:", self->_reply);
  return v4;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (id)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
}

@end
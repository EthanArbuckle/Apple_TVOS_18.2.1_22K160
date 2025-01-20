@interface XPCRequestToken
- (AMSProcessInfo)processInfo;
- (BOOL)isInternal;
- (XPCNotificationClient)notificationClient;
- (id)description;
- (void)dealloc;
@end

@implementation XPCRequestToken

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___XPCRequestToken;
  -[XPCRequestToken dealloc](&v3, "dealloc");
}

- (XPCNotificationClient)notificationClient
{
  return (XPCNotificationClient *)self->_serviceClient;
}

- (id)description
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"[%@]", self->_logKey);
}

- (BOOL)isInternal
{
  return self->_internal;
}

- (AMSProcessInfo)processInfo
{
  return (AMSProcessInfo *)objc_getProperty(self, a2, 72LL, 1);
}

- (void).cxx_destruct
{
}

@end
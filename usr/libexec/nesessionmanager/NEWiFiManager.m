@interface NEWiFiManager
- (NEWiFiManager)init;
@end

@implementation NEWiFiManager

- (NEWiFiManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NEWiFiManager;
  result = -[NEWiFiManager init](&v3, "init");
  if (result)
  {
    result->_wowRefCount = 0LL;
    result->_wifiManagerClient = 0LL;
  }

  return result;
}

@end
@interface VOTDebugManager
+ (id)sharedInstance;
- (VOTDebugManager)init;
- (VOTElementManagementProtocol)elementManager;
- (void)dealloc;
- (void)setElementManager:(id)a3;
@end

@implementation VOTDebugManager

+ (id)sharedInstance
{
  if (qword_1001AD048 != -1) {
    dispatch_once(&qword_1001AD048, &stru_10017A0C8);
  }
  return (id)qword_1001AD040;
}

- (VOTDebugManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VOTDebugManager;
  return -[VOTDebugManager init](&v3, "init");
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___VOTDebugManager;
  -[VOTDebugManager dealloc](&v4, "dealloc");
}

- (VOTElementManagementProtocol)elementManager
{
  return self->_elementManager;
}

- (void)setElementManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
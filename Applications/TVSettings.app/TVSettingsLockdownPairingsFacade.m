@interface TVSettingsLockdownPairingsFacade
+ (id)sharedInstance;
- (TVSettingsLockdownPairingsFacade)init;
- (void)setLockdownPairingEnabled:(BOOL)a3;
@end

@implementation TVSettingsLockdownPairingsFacade

+ (id)sharedInstance
{
  if (qword_1001E19F8 != -1) {
    dispatch_once(&qword_1001E19F8, &stru_100192F00);
  }
  return (id)qword_1001E19F0;
}

- (TVSettingsLockdownPairingsFacade)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSettingsLockdownPairingsFacade;
  v2 = -[TVSettingsLockdownPairingsFacade init](&v6, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.TVSettings.TVSettingsLockdownPairingsFacade", 0LL);
    lockdown_queue = v2->_lockdown_queue;
    v2->_lockdown_queue = (OS_dispatch_queue *)v3;
  }

  return v2;
}

- (void)setLockdownPairingEnabled:(BOOL)a3
{
  lockdown_queue = (dispatch_queue_s *)self->_lockdown_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A282C;
  block[3] = &unk_100192F20;
  BOOL v5 = a3;
  dispatch_async(lockdown_queue, block);
}

- (void).cxx_destruct
{
}

@end
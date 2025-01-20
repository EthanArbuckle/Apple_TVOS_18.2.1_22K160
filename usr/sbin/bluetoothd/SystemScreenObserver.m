@interface SystemScreenObserver
- (BOOL)screenOn;
- (CUSystemMonitor)systemMonitor;
- (SystemScreenObserver)init;
- (void)activateWithSystemMonitor:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)screenStateChanged:(BOOL)a3;
- (void)setScreenOn:(BOOL)a3;
- (void)setSystemMonitor:(id)a3;
@end

@implementation SystemScreenObserver

- (SystemScreenObserver)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SystemScreenObserver;
  result = -[SystemScreenObserver init](&v3, "init");
  if (result) {
    result->_screenUndimmedChangeNotifyToken = -1;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SystemScreenObserver;
  -[SystemScreenObserver dealloc](&v3, "dealloc");
}

- (void)activateWithSystemMonitor:(id)a3
{
  id v3 = a3;
  id v5 = a3;
  objc_storeStrong((id *)&self->_systemMonitor, v3);
  LOBYTE(v3) = [v5 screenOn];
  uint64_t v6 = sub_100404EB8();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100346260;
  v7[3] = &unk_100880230;
  v7[4] = self;
  char v8 = (char)v3;
  sub_100405384(v6, v7);
}

- (void)screenStateChanged:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = sub_100404EB8();
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v5 + 8));
  uint64_t v6 = (os_unfair_lock_s *)sub_1002E8D54();
  if (-[SystemScreenObserver screenOn](self, "screenOn") != v3)
  {
    -[SystemScreenObserver setScreenOn:](self, "setScreenOn:", v3);
    if (v6) {
      sub_100269DA0(v6, v3);
    }
  }

- (void)invalidate
{
  int screenUndimmedChangeNotifyToken = self->_screenUndimmedChangeNotifyToken;
  if (screenUndimmedChangeNotifyToken != -1)
  {
    notify_cancel(screenUndimmedChangeNotifyToken);
    self->_int screenUndimmedChangeNotifyToken = -1;
  }

- (BOOL)screenOn
{
  return self->_screenOn;
}

- (void)setScreenOn:(BOOL)a3
{
  self->_screenOn = a3;
}

- (CUSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
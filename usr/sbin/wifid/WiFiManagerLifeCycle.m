@interface WiFiManagerLifeCycle
- (NSMutableArray)signals;
- (WiFiManagerLifeCycle)init;
- (__WiFiManager)manager;
- (id)handleSignal:(int)a3 onQueue:(id)a4;
- (void)dealloc;
- (void)setManager:(__WiFiManager *)a3;
- (void)setSignals:(id)a3;
- (void)startOnQueue:(id)a3;
- (void)stopOnQueue:(id)a3;
@end

@implementation WiFiManagerLifeCycle

- (WiFiManagerLifeCycle)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___WiFiManagerLifeCycle;
  v2 = -[WiFiManagerLifeCycle init](&v5, "init");
  if (!v2 || (v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray), (v2->_signals = v3) == 0LL))
  {

    return 0LL;
  }

  return v2;
}

- (void)dealloc
{
  self->_signals = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___WiFiManagerLifeCycle;
  -[WiFiManagerLifeCycle dealloc](&v3, "dealloc");
}

- (void)startOnQueue:(id)a3
{
  if (!a3)
  {
LABEL_6:
    v7 = objc_autoreleasePoolPush();
    v8 = (void *)qword_100219F60;
    if (qword_100219F60)
    {
      v9 = "WiFiManager started";
LABEL_10:
      objc_msgSend(v8, "WFLog:message:", 4, v9, v10);
      goto LABEL_11;
    }

    goto LABEL_11;
  }

  NSLog(@"----- WiFiManager starting, version: %s -----", a2, "WiFiManager-1800.35 Nov 10 2024 02:31:40");
  objc_super v5 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "----- WiFiManager starting, version: %s -----",  "WiFiManager-1800.35 Nov 10 2024 02:31:40");
  }
  objc_autoreleasePoolPop(v5);
  v6 = (__WiFiManager *)sub_100060C04((uint64_t)kCFAllocatorDefault, (dispatch_queue_s *)a3);
  self->_manager = v6;
  if (v6)
  {
    -[NSMutableArray addObject:]( self->_signals,  "addObject:",  -[WiFiManagerLifeCycle handleSignal:onQueue:](self, "handleSignal:onQueue:", 2LL, a3));
    -[NSMutableArray addObject:]( self->_signals,  "addObject:",  -[WiFiManagerLifeCycle handleSignal:onQueue:](self, "handleSignal:onQueue:", 15LL, a3));
    -[NSMutableArray addObject:]( self->_signals,  "addObject:",  -[WiFiManagerLifeCycle handleSignal:onQueue:](self, "handleSignal:onQueue:", 3LL, a3));
    sub_1000661C8((uint64_t)self->_manager, 0);
    sub_10006B4E4((uint64_t)self->_manager);
    sub_100067864((uint64_t)self->_manager, (uint64_t)a3);
    notify_post("com.apple.wifivelocity.trigger");
    goto LABEL_6;
  }

  v7 = objc_autoreleasePoolPush();
  v8 = (void *)qword_100219F60;
  if (qword_100219F60)
  {
    v10 = "-[WiFiManagerLifeCycle startOnQueue:]";
    v9 = "%s: Error: WiFiManagerCreate failed";
    goto LABEL_10;
  }

- (void)stopOnQueue:(id)a3
{
  objc_super v5 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "----- WiFiManager stopping, version: %s -----",  "WiFiManager-1800.35 Nov 10 2024 02:31:40");
  }
  objc_autoreleasePoolPop(v5);
  sub_1000684E8((uint64_t)self->_manager, a3);
  sub_100068478((uint64_t)self->_manager, 0);
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_signals, "enumerateObjectsUsingBlock:", &stru_1001E46E0);
  manager = self->_manager;
  if (manager)
  {
    CFRelease(manager);
    self->_manager = 0LL;
  }

  NSLog(@"WiFiManager stopped");
}

- (id)handleSignal:(int)a3 onQueue:(id)a4
{
  v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, a3, 0LL, (dispatch_queue_t)a4);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10009179C;
  handler[3] = &unk_1001E4708;
  int v10 = a3;
  handler[4] = self;
  handler[5] = a4;
  dispatch_source_set_event_handler(v7, handler);
  dispatch_activate(v7);
  return v7;
}

- (__WiFiManager)manager
{
  return self->_manager;
}

- (void)setManager:(__WiFiManager *)a3
{
  self->_manager = a3;
}

- (NSMutableArray)signals
{
  return self->_signals;
}

- (void)setSignals:(id)a3
{
}

@end
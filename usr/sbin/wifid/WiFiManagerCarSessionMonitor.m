@interface WiFiManagerCarSessionMonitor
+ (id)sharedInstance;
- (BOOL)isCarDNDActive;
- (OS_dispatch_queue)queue;
- (__WiFiManager)manager;
- (void)dealloc;
- (void)initializeWithManager:(__WiFiManager *)a3 queue:(id)a4;
- (void)setCarDNDActive:(BOOL)a3;
- (void)setManager:(__WiFiManager *)a3;
- (void)setQueue:(id)a3;
@end

@implementation WiFiManagerCarSessionMonitor

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003A168;
  block[3] = &unk_1001E2620;
  block[4] = a1;
  if (qword_100219880 != -1) {
    dispatch_once(&qword_100219880, block);
  }
  return (id)qword_100219878;
}

- (void)initializeWithManager:(__WiFiManager *)a3 queue:(id)a4
{
  id v6 = a4;
  -[WiFiManagerCarSessionMonitor setManager:](self, "setManager:", a3);
  -[WiFiManagerCarSessionMonitor setQueue:](self, "setQueue:", v6);

  self->_carDNDActive = 0;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___WiFiManagerCarSessionMonitor;
  -[WiFiManagerCarSessionMonitor dealloc](&v2, "dealloc");
}

- (BOOL)isCarDNDActive
{
  return self->_carDNDActive;
}

- (void)setCarDNDActive:(BOOL)a3
{
  self->_carDNDActive = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (__WiFiManager)manager
{
  return self->_manager;
}

- (void)setManager:(__WiFiManager *)a3
{
  self->_manager = a3;
}

- (void).cxx_destruct
{
}

@end
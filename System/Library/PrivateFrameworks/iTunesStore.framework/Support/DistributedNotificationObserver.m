@interface DistributedNotificationObserver
- (DistributedNotificationObserver)initWithServiceName:(id)a3;
- (NSArray)observedNotificationNames;
- (void)addObservedNotificationName:(id)a3;
- (void)addObservedNotificationNames:(id)a3;
- (void)dealloc;
- (void)postNotificationName:(id)a3 message:(id)a4;
- (void)removeObservedNotificationName:(id)a3;
@end

@implementation DistributedNotificationObserver

- (DistributedNotificationObserver)initWithServiceName:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DistributedNotificationObserver;
  v4 = -[DistributedNotificationObserver init](&v6, "init");
  if (v4)
  {
    v4->_connection = -[SSXPCConnection initWithServiceName:]( objc_alloc(&OBJC_CLASS___SSXPCConnection),  "initWithServiceName:",  a3);
    v4->_notificationNames = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DistributedNotificationObserver;
  -[DistributedNotificationObserver dealloc](&v3, "dealloc");
}

- (void)addObservedNotificationName:(id)a3
{
}

- (void)addObservedNotificationNames:(id)a3
{
}

- (NSArray)observedNotificationNames
{
  return (NSArray *)-[NSMutableSet allObjects](self->_notificationNames, "allObjects");
}

- (void)postNotificationName:(id)a3 message:(id)a4
{
}

- (void)removeObservedNotificationName:(id)a3
{
}

@end
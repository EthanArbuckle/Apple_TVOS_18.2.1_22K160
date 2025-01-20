@interface NSNotificationQueue
+ (NSNotificationQueue)defaultQueue;
- (NSNotificationQueue)init;
- (NSNotificationQueue)initWithNotificationCenter:(NSNotificationCenter *)notificationCenter;
- (void)_flushNotificationQueue;
- (void)dealloc;
- (void)dequeueNotificationsMatching:(NSNotification *)notification coalesceMask:(NSUInteger)coalesceMask;
- (void)enqueueNotification:(NSNotification *)notification postingStyle:(NSPostingStyle)postingStyle;
- (void)enqueueNotification:(NSNotification *)notification postingStyle:(NSPostingStyle)postingStyle coalesceMask:(NSNotificationCoalescing)coalesceMask forModes:(NSArray *)modes;
@end

@implementation NSNotificationQueue

+ (NSNotificationQueue)defaultQueue
{
  v3 = -[NSThread threadDictionary]( +[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread"),  "threadDictionary");
  uint64_t v4 = -[NSMutableDictionary objectForKey:](v3, "objectForKey:", @"NSDefaultNotificationQueue");
  v5 = (NSNotificationQueue *)v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    v5 = (NSNotificationQueue *)[objc_allocWithZone((Class)a1) init];
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v5, @"NSDefaultNotificationQueue");
  }

  return v5;
}

- (NSNotificationQueue)init
{
  return -[NSNotificationQueue initWithNotificationCenter:]( self,  "initWithNotificationCenter:",  +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
}

- (NSNotificationQueue)initWithNotificationCenter:(NSNotificationCenter *)notificationCenter
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSNotificationQueue;
  uint64_t v4 = -[NSNotificationQueue init](&v6, sel_init);
  if (v4)
  {
    v4->_notificationCenter = notificationCenter;
    v4->_asapQueue = (NSMutableArray *)(id)[MEMORY[0x189603FA8] array];
    v4->_idleQueue = (NSMutableArray *)(id)[MEMORY[0x189603FA8] array];
  }

  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  -[NSNotificationQueue _flushNotificationQueue](self, "_flushNotificationQueue");

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSNotificationQueue;
  -[NSNotificationQueue dealloc](&v3, sel_dealloc);
}

- (void)_flushNotificationQueue
{
  asapQueue = self->_asapQueue;
  idleQueue = self->_idleQueue;
  self->_asapQueue = 0LL;
  self->_idleQueue = 0LL;
}

- (void)enqueueNotification:(NSNotification *)notification postingStyle:(NSPostingStyle)postingStyle
{
}

- (void)enqueueNotification:(NSNotification *)notification postingStyle:(NSPostingStyle)postingStyle coalesceMask:(NSNotificationCoalescing)coalesceMask forModes:(NSArray *)modes
{
  if (postingStyle != NSPostWhenIdle)
  {
    if (postingStyle != NSPostASAP)
    {
      if (postingStyle == NSPostNow)
      {
        removeNotificationsFromQueue(self->_idleQueue, notification, 0, coalesceMask);
        removeNotificationsFromQueue(self->_asapQueue, notification, 0, coalesceMask);
        -[NSNotificationCenter postNotification:](self->_notificationCenter, "postNotification:", notification);
      }

      return;
    }

    removeNotificationsFromQueue(self->_idleQueue, notification, 0, coalesceMask);
    if (removeNotificationsFromQueue(self->_asapQueue, notification, 1, coalesceMask)) {
      return;
    }
    v10 = self;
    v11 = notification;
    v12 = modes;
    int v13 = 1;
LABEL_11:
    addNotificationToQueue(v10, (uint64_t)v11, v12, v13);
    return;
  }

  if (!removeNotificationsFromQueue(self->_asapQueue, notification, 1, coalesceMask)
    && !removeNotificationsFromQueue(self->_idleQueue, notification, 1, coalesceMask))
  {
    v10 = self;
    v11 = notification;
    v12 = modes;
    int v13 = 0;
    goto LABEL_11;
  }

- (void)dequeueNotificationsMatching:(NSNotification *)notification coalesceMask:(NSUInteger)coalesceMask
{
}

@end
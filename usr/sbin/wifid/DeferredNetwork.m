@interface DeferredNetwork
- (BOOL)doesContain:(__WiFiNetwork *)a3;
- (BOOL)setDeferredNetwork:(__WiFiNetwork *)a3;
- (DeferredNetwork)init;
- (NSString)ssid;
- (double)timeSinceFirstDeferral:(__WiFiNetwork *)a3;
- (void)dealloc;
- (void)reset;
@end

@implementation DeferredNetwork

- (DeferredNetwork)init
{
  v3 = objc_autoreleasePoolPush();
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___DeferredNetwork;
  v4 = -[DeferredNetwork init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    v4->_firstSeen = 0.0;
    v4->_history = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (void)dealloc
{
  v3 = objc_autoreleasePoolPush();
  history = self->_history;
  if (history) {

  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DeferredNetwork;
  -[DeferredNetwork dealloc](&v5, "dealloc");
  objc_autoreleasePoolPop(v3);
}

- (BOOL)doesContain:(__WiFiNetwork *)a3
{
  objc_super v5 = objc_autoreleasePoolPush();
  history = self->_history;
  if (history) {
    unsigned __int8 v7 = -[NSMutableArray containsObject:](history, "containsObject:", a3);
  }
  else {
    unsigned __int8 v7 = 0;
  }
  objc_autoreleasePoolPop(v5);
  return v7;
}

- (BOOL)setDeferredNetwork:(__WiFiNetwork *)a3
{
  objc_super v5 = objc_autoreleasePoolPush();
  history = self->_history;
  if (history)
  {
    if (!-[NSMutableArray count](self->_history, "count"))
    {
      +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
      self->_firstSeen = v7;
      self->_ssid = (NSString *)[(id)sub_100095BC8(a3) copy];
    }

    -[NSMutableArray addObject:](self->_history, "addObject:", a3);
  }

  objc_autoreleasePoolPop(v5);
  return history != 0LL;
}

- (double)timeSinceFirstDeferral:(__WiFiNetwork *)a3
{
  objc_super v5 = objc_autoreleasePoolPush();
  history = self->_history;
  if (history && -[NSMutableArray count](history, "count") && self->_firstSeen != 0.0)
  {
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    double v8 = v7 - self->_firstSeen;
  }

  else
  {
    v9 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s: %@ not previously time-deferred", "-[DeferredNetwork timeSinceFirstDeferral:]", sub_100095BC8(a3) message];
    }
    objc_autoreleasePoolPop(v9);
    double v8 = 0.0;
  }

  objc_autoreleasePoolPop(v5);
  return v8;
}

- (void)reset
{
  v3 = objc_autoreleasePoolPush();
  self->_firstSeen = 0.0;
  -[NSMutableArray removeAllObjects](self->_history, "removeAllObjects");
  objc_autoreleasePoolPop(v3);
}

- (NSString)ssid
{
  return self->_ssid;
}

@end
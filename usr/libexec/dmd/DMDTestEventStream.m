@interface DMDTestEventStream
- (NSString)eventType;
- (id)_testEvent;
- (void)startNotificationStreamWithEventsHandler:(id)a3;
@end

@implementation DMDTestEventStream

- (NSString)eventType
{
  return (NSString *)@"com.apple.event.management.test";
}

- (void)startNotificationStreamWithEventsHandler:(id)a3
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTestEventStream _testEvent](self, "_testEvent"));
  v8 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  (*((void (**)(id, void *))a3 + 2))(v5, v7);
}

- (id)_testEvent
{
  return  -[DMDEventStreamEvent initWithEventType:details:]( objc_alloc(&OBJC_CLASS___DMDEventStreamEvent),  "initWithEventType:details:",  @"com.apple.event.management.test",  0LL);
}

@end
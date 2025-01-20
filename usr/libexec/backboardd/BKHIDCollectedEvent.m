@interface BKHIDCollectedEvent
- (void)dealloc;
@end

@implementation BKHIDCollectedEvent

- (void)dealloc
{
  event = self->_event;
  if (event) {
    CFRelease(event);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___BKHIDCollectedEvent;
  -[BKHIDCollectedEvent dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
}

@end
@interface HIDEvent
- (HIDEvent)initWithSize:(unint64_t)a3 type:(unsigned int)a4 timestamp:(unint64_t)a5 options:(unsigned int)a6;
- (id)description;
- (void)dealloc;
@end

@implementation HIDEvent

- (HIDEvent)initWithSize:(unint64_t)a3 type:(unsigned int)a4 timestamp:(unint64_t)a5 options:(unsigned int)a6
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___HIDEvent;
  v10 = -[HIDEvent init](&v13, sel_init);
  result = 0LL;
  if (a3 >= 0x10 && v10)
  {
    result = (HIDEvent *)malloc(a3);
    v10->_event.eventData = (IOHIDEventData *)result;
    if (result)
    {
      v12 = result;
      bzero(result, a3);
      v10->_event.timeStamp = a5;
      v10->_event.options = a6;
      v10->_event.typeMask = 1LL << a4;
      LODWORD(v12->super.isa) = a3;
      HIDWORD(v12->super.isa) = a4;
      LODWORD(v12->_event.timeStamp) = a6;
      return v10;
    }
  }

  return result;
}

- (void)dealloc
{
  eventData = self->_event.eventData;
  if (eventData) {
    free(eventData);
  }
  children = self->_event.children;
  if (children)
  {
    CFIndex Count = CFArrayGetCount(children);
    if (Count >= 1)
    {
      CFIndex v6 = Count;
      for (CFIndex i = 0LL; i != v6; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(self->_event.children, i);
        if (ValueAtIndex) {
          ValueAtIndex[10] = 0LL;
        }
      }
    }

    CFRelease(self->_event.children);
  }

  attributeData = self->_event.attributeData;
  if (attributeData) {
    free(attributeData);
  }
  sender = self->_event.sender;
  if (sender) {
    CFRelease(sender);
  }
  attachments = self->_event.attachments;
  if (attachments) {
    CFRelease(attachments);
  }
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___HIDEvent;
  -[HIDEvent dealloc](&v12, sel_dealloc);
}

- (id)description
{
  return IOHIDEventCopyDescription((uint64_t)self);
}

@end
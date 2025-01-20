@interface TVHHIDEventManager
- (TVHHIDEventManager)init;
- (void)_dispatchEventWithUsagePage:(unsigned int)a3 usage:(unsigned int)a4;
- (void)_dispatchEventWithUsagePage:(unsigned int)a3 usage:(unsigned int)a4 isKeyDown:(BOOL)a5;
- (void)_dispatchHIDEvent:(__IOHIDEvent *)a3;
- (void)dealloc;
- (void)dispatchEvent:(unint64_t)a3;
- (void)dispatchUnicodeEventWithText:(id)a3;
@end

@implementation TVHHIDEventManager

- (TVHHIDEventManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVHHIDEventManager;
  v2 = -[TVHHIDEventManager init](&v8, "init");
  if (v2)
  {
    v2->_hidClient = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate(kCFAllocatorDefault);
    v3 = (objc_class *)objc_opt_class(v2);
    Name = class_getName(v3);
    dispatch_queue_t v5 = dispatch_queue_create(Name, 0LL);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue_serial *)v5;
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHHIDEventManager;
  -[TVHHIDEventManager dealloc](&v3, "dealloc");
}

- (void)dispatchEvent:(unint64_t)a3
{
  if (a3 <= 7) {
    -[TVHHIDEventManager _dispatchEventWithUsagePage:usage:]( self,  "_dispatchEventWithUsagePage:usage:",  dword_1000C33D8[a3],  dword_1000C33F8[a3]);
  }
}

- (void)dispatchUnicodeEventWithText:(id)a3
{
  id v4 = a3;
  uint64_t v5 = mach_absolute_time();
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 dataUsingEncoding:4]);

  id v8 = v6;
  UnicodeEvent = (const void *)IOHIDEventCreateUnicodeEvent( kCFAllocatorDefault,  v5,  [v8 bytes],  objc_msgSend(v8, "length"),  0,  0);
  -[TVHHIDEventManager _dispatchHIDEvent:](self, "_dispatchHIDEvent:", UnicodeEvent);
  CFRelease(UnicodeEvent);
}

- (void)_dispatchEventWithUsagePage:(unsigned int)a3 usage:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  -[TVHHIDEventManager _dispatchEventWithUsagePage:usage:isKeyDown:]( self,  "_dispatchEventWithUsagePage:usage:isKeyDown:",  *(void *)&a3,  *(void *)&a4,  1LL);
  -[TVHHIDEventManager _dispatchEventWithUsagePage:usage:isKeyDown:]( self,  "_dispatchEventWithUsagePage:usage:isKeyDown:",  v5,  v4,  0LL);
}

- (void)_dispatchEventWithUsagePage:(unsigned int)a3 usage:(unsigned int)a4 isKeyDown:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  uint64_t v9 = mach_absolute_time();
  KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent(kCFAllocatorDefault, v9, v7, v6, v5, 0LL);
  -[TVHHIDEventManager _dispatchHIDEvent:](self, "_dispatchHIDEvent:", KeyboardEvent);
  CFRelease(KeyboardEvent);
}

- (void)_dispatchHIDEvent:(__IOHIDEvent *)a3
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004CDFC;
  block[3] = &unk_1000FE130;
  objc_copyWeak(v7, &location);
  v7[1] = a3;
  dispatch_async(serialQueue, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
}

@end
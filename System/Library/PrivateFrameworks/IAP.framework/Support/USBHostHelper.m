@interface USBHostHelper
- (void)_run;
- (void)dealloc;
- (void)setUsbHostPort:(void *)a3;
- (void)start;
- (void)usbHostPort;
@end

@implementation USBHostHelper

- (void)start
{
  v3 = -[NSThread initWithTarget:selector:object:]( objc_alloc(&OBJC_CLASS___NSThread),  "initWithTarget:selector:object:",  self,  "_run",  0LL);
  self->_runLoopThread = v3;
  -[NSThread start](v3, "start");
}

- (void)_run
{
  Current = CFRunLoopGetCurrent();
  usbHostPort = self->_usbHostPort;
  v5 = (__CFRunLoopSource *)*((void *)usbHostPort + 27);
  if (v5)
  {
    *((void *)usbHostPort + 28) = Current;
    CFRunLoopAddSource(Current, v5, kCFRunLoopDefaultMode);
    CFRunLoopRun();
  }

- (void)dealloc
{
  self->_runLoopThread = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___USBHostHelper;
  -[USBHostHelper dealloc](&v3, "dealloc");
}

- (void)usbHostPort
{
  return self->_usbHostPort;
}

- (void)setUsbHostPort:(void *)a3
{
  self->_usbHostPort = a3;
}

@end
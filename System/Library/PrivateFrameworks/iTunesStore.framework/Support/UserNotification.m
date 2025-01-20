@interface UserNotification
- (BOOL)isCanceled;
- (UserNotification)initWithDictionary:(__CFDictionary *)a3 options:(unint64_t)a4 completionBlock:(id)a5;
- (__CFUserNotification)userNotification;
- (id)completionBlock;
- (void)cancel;
- (void)dealloc;
- (void)setCompletionBlock:(id)a3;
- (void)show;
- (void)updateWithDictionary:(__CFDictionary *)a3 options:(unint64_t)a4;
@end

@implementation UserNotification

- (UserNotification)initWithDictionary:(__CFDictionary *)a3 options:(unint64_t)a4 completionBlock:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___UserNotification;
  v8 = -[UserNotification init](&v10, "init");
  if (v8)
  {
    v8->_completionBlock = [a5 copy];
    v8->_notificationDictionary = CFDictionaryCreateCopy(0LL, a3);
    v8->_notificationOptions = a4;
  }

  return v8;
}

- (void)dealloc
{
  CFRelease(self->_notificationDictionary);
  runLoopSource = self->_runLoopSource;
  if (runLoopSource)
  {
    CFRunLoopSourceInvalidate(runLoopSource);
    CFRelease(self->_runLoopSource);
  }

  userNotification = self->_userNotification;
  if (userNotification)
  {
    CFUserNotificationCancel(userNotification);
    CFRelease(self->_userNotification);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___UserNotification;
  -[UserNotification dealloc](&v5, "dealloc");
}

- (void)cancel
{
  self->_isCanceled = 1;
  runLoopSource = self->_runLoopSource;
  if (runLoopSource)
  {
    CFRunLoopSourceInvalidate(runLoopSource);
    Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveSource(Current, self->_runLoopSource, kCFRunLoopDefaultMode);
    CFRelease(self->_runLoopSource);
    self->_runLoopSource = 0LL;
  }

  userNotification = self->_userNotification;
  if (userNotification)
  {
    CFUserNotificationCancel(userNotification);
    CFRelease(self->_userNotification);
    self->_userNotification = 0LL;
  }

- (void)show
{
  if (!self->_userNotification)
  {
    v3 = CFUserNotificationCreate(0LL, 0.0, self->_notificationOptions, 0LL, self->_notificationDictionary);
    self->_userNotification = v3;
    if (v3)
    {
      self->_runLoopSource = CFUserNotificationCreateRunLoopSource( 0LL,  v3,  (CFUserNotificationCallBack)sub_1000DE750,  0LL);
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, self->_runLoopSource, kCFRunLoopDefaultMode);
    }
  }

- (void)updateWithDictionary:(__CFDictionary *)a3 options:(unint64_t)a4
{
  if (self->_userNotification)
  {
    CFRelease(self->_notificationDictionary);
    Copy = CFDictionaryCreateCopy(0LL, a3);
    self->_notificationDictionary = Copy;
    self->_notificationOptions = a4;
    CFUserNotificationUpdate(self->_userNotification, 0.0, a4, Copy);
  }

- (__CFUserNotification)userNotification
{
  return self->_userNotification;
}

- (BOOL)isCanceled
{
  return self->_isCanceled;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

@end
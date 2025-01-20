@interface IAPMicrophoneEventHandlerHelper
+ (id)sharedInstance;
- (void)dealloc;
- (void)microphoneStateChangeDebouceTimeout;
- (void)microphoneStateChangedNotification;
- (void)sendMicrophoneStateChangedNotification;
@end

@implementation IAPMicrophoneEventHandlerHelper

+ (id)sharedInstance
{
  if (qword_10011BBB0 != -1) {
    dispatch_once(&qword_10011BBB0, &stru_100102080);
  }
  return (id)qword_10011BBA8;
}

- (void)dealloc
{
  p_stateChangeDebouceTimer = &self->_stateChangeDebouceTimer;
  if (((unint64_t)&self->_stateChangeDebouceTimer & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    if (*p_stateChangeDebouceTimer)
    {
      -[NSTimer invalidate](*p_stateChangeDebouceTimer, "invalidate");
      *p_stateChangeDebouceTimer = 0LL;
    }

    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS___IAPMicrophoneEventHandlerHelper;
    -[IAPMicrophoneEventHandlerHelper dealloc](&v4, "dealloc");
  }

- (void)sendMicrophoneStateChangedNotification
{
}

- (void)microphoneStateChangedNotification
{
  p_stateChangeDebouceTimer = &self->_stateChangeDebouceTimer;
  if (((unint64_t)&self->_stateChangeDebouceTimer & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    if (*p_stateChangeDebouceTimer)
    {
      -[NSTimer invalidate](*p_stateChangeDebouceTimer, "invalidate");
      *p_stateChangeDebouceTimer = 0LL;
    }

    self->_stateChangeDebouceTimer = -[NSTimer initWithFireDate:interval:target:selector:userInfo:repeats:]( objc_alloc(&OBJC_CLASS___NSTimer),  "initWithFireDate:interval:target:selector:userInfo:repeats:",  +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  0.3),  self,  "microphoneStateChangeDebouceTimeout",  0LL,  0LL,  0.0);
    -[NSRunLoop addTimer:forMode:]( +[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"),  "addTimer:forMode:",  self->_stateChangeDebouceTimer,  NSDefaultRunLoopMode);
  }

- (void)microphoneStateChangeDebouceTimeout
{
  if (((unint64_t)&self->_stateChangeDebouceTimer & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    self->_stateChangeDebouceTimer = 0LL;
    +[IAPServer sendAudioStateChangedNotification](&OBJC_CLASS___IAPServer, "sendAudioStateChangedNotification");
  }

@end
@interface DMDUserNotification
- (BOOL)displayWhenLocked;
- (DMDUserNotification)init;
- (NSString)alternateButtonTitle;
- (NSString)defaultButtonTitle;
- (NSString)header;
- (NSString)message;
- (NSString)otherButtonTitle;
- (NSUUID)identifier;
- (__CFUserNotification)notificationRef;
- (double)timeout;
- (void)dealloc;
- (void)setAlternateButtonTitle:(id)a3;
- (void)setDefaultButtonTitle:(id)a3;
- (void)setDisplayWhenLocked:(BOOL)a3;
- (void)setHeader:(id)a3;
- (void)setMessage:(id)a3;
- (void)setNotificationRef:(__CFUserNotification *)a3;
- (void)setOtherButtonTitle:(id)a3;
- (void)setTimeout:(double)a3;
@end

@implementation DMDUserNotification

- (DMDUserNotification)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DMDUserNotification;
  v2 = -[DMDUserNotification init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___NSUUID);
    identifier = v2->_identifier;
    v2->_identifier = v3;

    v2->_displayWhenLocked = 1;
    v2->_timeout = 0.0;
  }

  return v2;
}

- (void)dealloc
{
  notificationRef = self->_notificationRef;
  if (notificationRef) {
    CFRelease(notificationRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DMDUserNotification;
  -[DMDUserNotification dealloc](&v4, "dealloc");
}

- (__CFUserNotification)notificationRef
{
  return self->_notificationRef;
}

- (void)setNotificationRef:(__CFUserNotification *)a3
{
  notificationRef = self->_notificationRef;
  if (notificationRef != a3)
  {
    if (notificationRef) {
      CFRelease(notificationRef);
    }
    if (a3) {
      objc_super v6 = (__CFUserNotification *)CFRetain(a3);
    }
    else {
      objc_super v6 = 0LL;
    }
    self->_notificationRef = v6;
  }

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)defaultButtonTitle
{
  return self->_defaultButtonTitle;
}

- (void)setDefaultButtonTitle:(id)a3
{
}

- (NSString)alternateButtonTitle
{
  return self->_alternateButtonTitle;
}

- (void)setAlternateButtonTitle:(id)a3
{
}

- (NSString)otherButtonTitle
{
  return self->_otherButtonTitle;
}

- (void)setOtherButtonTitle:(id)a3
{
}

- (BOOL)displayWhenLocked
{
  return self->_displayWhenLocked;
}

- (void)setDisplayWhenLocked:(BOOL)a3
{
  self->_displayWhenLocked = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (void).cxx_destruct
{
}

@end
@interface UARPHIDUpdaterPreferences
+ (id)sharedPrefs;
- (UARPHIDUpdaterPreferences)init;
- (unsigned)powerLogStagingWindowSecondsOverride;
@end

@implementation UARPHIDUpdaterPreferences

+ (id)sharedPrefs
{
  if (qword_10002F950 != -1) {
    dispatch_once(&qword_10002F950, &stru_100028890);
  }
  return (id)qword_10002F948;
}

- (UARPHIDUpdaterPreferences)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UARPHIDUpdaterPreferences;
  v2 = -[UARPHIDUpdaterPreferences init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSUserDefaults);
    defaults = v2->_defaults;
    v2->_defaults = v3;
  }

  return v2;
}

- (unsigned)powerLogStagingWindowSecondsOverride
{
  return -[NSUserDefaults integerForKey:]( self->_defaults,  "integerForKey:",  @"powerLoggingStagingWindowSecondsOverride");
}

- (void).cxx_destruct
{
}

@end
@interface ADSystemLanguagePreferencesObserver
+ (id)sharedObserver;
- (ADSystemLanguagePreferencesObserver)init;
- (BOOL)systemLanguagePreferenceHasChanged;
- (void)notifyObserver:(id)a3 didReceiveNotificationWithToken:(int)a4;
@end

@implementation ADSystemLanguagePreferencesObserver

- (ADSystemLanguagePreferencesObserver)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ADSystemLanguagePreferencesObserver;
  v2 = -[ADSystemLanguagePreferencesObserver init](&v10, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("ADSystemLanguagePreferencesObserver", v4);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = -[AFNotifyObserver initWithName:options:queue:delegate:]( objc_alloc(&OBJC_CLASS___AFNotifyObserver),  "initWithName:options:queue:delegate:",  @"AppleLanguagePreferencesChangedNotification",  0LL,  v2->_queue,  v2);
    notifyObserver = v2->_notifyObserver;
    v2->_notifyObserver = v7;
  }

  return v2;
}

- (void)notifyObserver:(id)a3 didReceiveNotificationWithToken:(int)a4
{
  self->_changed = 1;
}

- (BOOL)systemLanguagePreferenceHasChanged
{
  return self->_changed;
}

- (void).cxx_destruct
{
}

+ (id)sharedObserver
{
  if (qword_1005780E8 != -1) {
    dispatch_once(&qword_1005780E8, &stru_1004F60A8);
  }
  return (id)qword_1005780F0;
}

@end
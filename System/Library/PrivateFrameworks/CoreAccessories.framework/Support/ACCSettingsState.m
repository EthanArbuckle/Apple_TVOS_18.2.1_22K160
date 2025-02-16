@interface ACCSettingsState
- (ACCSettingsState)initWithKey:(id)a3 applicationID:(id)a4 notification:(id)a5 defaultValue:(int64_t)a6 invalidValue:(int64_t)a7;
- (BOOL)BOOLValue;
- (BOOL)exists;
- (NSString)applicationID;
- (NSString)key;
- (NSString)notificationName;
- (id)description;
- (int64_t)defaultValue;
- (int64_t)intValue;
- (int64_t)invalidValue;
- (void)_readLoggingPrefs;
- (void)_registerForLoggingPrefsNotification;
- (void)dealloc;
@end

@implementation ACCSettingsState

- (ACCSettingsState)initWithKey:(id)a3 applicationID:(id)a4 notification:(id)a5 defaultValue:(int64_t)a6 invalidValue:(int64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___ACCSettingsState;
  v16 = -[ACCSettingsState init](&v19, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_key, a3);
    objc_storeStrong((id *)&v17->_applicationID, a4);
    objc_storeStrong((id *)&v17->_notificationName, a5);
    v17->_defaultValue = a6;
    v17->_invalidValue = a7;
    -[ACCSettingsState _readLoggingPrefs](v17, "_readLoggingPrefs");
    -[ACCSettingsState _registerForLoggingPrefsNotification](v17, "_registerForLoggingPrefsNotification");
  }

  return v17;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)self->_notificationName, 0LL);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ACCSettingsState;
  -[ACCSettingsState dealloc](&v4, "dealloc");
}

- (id)description
{
  if (self->_BOOLValue) {
    v2 = @"true";
  }
  else {
    v2 = @"false";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<ACCSettingsState>[%@:%@ = %ld (= %@), default = %ld, invalid = %ld]",  self->_applicationID,  self->_key,  self->_intValue,  v2,  self->_defaultValue,  self->_invalidValue);
}

- (void)_readLoggingPrefs
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue( (CFStringRef)self->_key,  (CFStringRef)self->_applicationID,  &keyExistsAndHasValidFormat);
  int64_t intValue = self->_intValue;
  int v5 = keyExistsAndHasValidFormat;
  if (!keyExistsAndHasValidFormat || AppIntegerValue == self->_invalidValue) {
    CFIndex AppIntegerValue = self->_defaultValue;
  }
  self->_int64_t intValue = AppIntegerValue;
  self->_BOOLValue = AppIntegerValue != 0;
  self->_exists = v5 != 0;
}

- (void)_registerForLoggingPrefsNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  self,  (CFNotificationCallback)__receivedNotification,  (CFStringRef)self->_notificationName,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (int64_t)defaultValue
{
  return self->_defaultValue;
}

- (int64_t)invalidValue
{
  return self->_invalidValue;
}

- (int64_t)intValue
{
  return self->_intValue;
}

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

- (BOOL)exists
{
  return self->_exists;
}

- (NSString)key
{
  return self->_key;
}

- (NSString)applicationID
{
  return self->_applicationID;
}

- (NSString)notificationName
{
  return self->_notificationName;
}

- (void).cxx_destruct
{
}

@end
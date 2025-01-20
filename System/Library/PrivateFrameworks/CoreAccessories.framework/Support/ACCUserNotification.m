@interface ACCUserNotification
- (ACCUserNotification)init;
- (BOOL)dismissOnUnlock;
- (BOOL)ignoreQuietMode;
- (BOOL)isModal;
- (BOOL)presentViaSystemAperture;
- (NSDictionary)userNotificationCFDict;
- (NSNumber)systemSoundID;
- (NSString)defaultButtonName;
- (NSString)groupIdentifier;
- (NSString)identifier;
- (NSString)message;
- (NSString)otherButtonName;
- (NSString)title;
- (NSString)uuid;
- (NSURL)iconURL;
- (__CFUserNotification)userNotificationCF;
- (double)timeout;
- (int)type;
- (void)createBackingUserNotification;
- (void)setDefaultButtonName:(id)a3;
- (void)setDismissOnUnlock:(BOOL)a3;
- (void)setGroupIdentifier:(id)a3;
- (void)setIconURL:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIgnoreQuietMode:(BOOL)a3;
- (void)setIsModal:(BOOL)a3;
- (void)setMessage:(id)a3;
- (void)setOtherButtonName:(id)a3;
- (void)setPresentViaSystemAperture:(BOOL)a3;
- (void)setSystemSoundID:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setTitle:(id)a3;
- (void)setType:(int)a3;
- (void)setUserNotificationCF:(__CFUserNotification *)a3;
- (void)setUserNotificationCFDict:(id)a3;
@end

@implementation ACCUserNotification

- (ACCUserNotification)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___ACCUserNotification;
  v2 = -[ACCUserNotification init](&v16, "init");
  v3 = v2;
  if (v2)
  {
    v2->_userNotificationCF = 0LL;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 UUIDString]);
    uuid = v3->_uuid;
    v3->_uuid = (NSString *)v5;

    v3->_type = 0;
    title = v3->_title;
    v3->_title = 0LL;

    message = v3->_message;
    v3->_message = 0LL;

    defaultButtonName = v3->_defaultButtonName;
    v3->_defaultButtonName = 0LL;

    otherButtonName = v3->_otherButtonName;
    v3->_otherButtonName = 0LL;

    iconURL = v3->_iconURL;
    v3->_iconURL = 0LL;

    *(_DWORD *)&v3->_isModal = 0;
    systemSoundID = v3->_systemSoundID;
    v3->_systemSoundID = 0LL;

    identifier = v3->_identifier;
    v3->_identifier = 0LL;

    groupIdentifier = v3->_groupIdentifier;
    v3->_groupIdentifier = 0LL;
  }

  return v3;
}

- (void)createBackingUserNotification
{
  if (-[ACCUserNotification userNotificationCF](self, "userNotificationCF")) {
    -[ACCUserNotification setUserNotificationCF:](self, "setUserNotificationCF:", 0LL);
  }
  -[ACCUserNotification isModal](self, "isModal");
  v22[0] = kCFUserNotificationAlertHeaderKey;
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[ACCUserNotification title](self, "title"));
  v4 = (void *)v3;
  if (v3) {
    uint64_t v5 = (const __CFString *)v3;
  }
  else {
    uint64_t v5 = &stru_100200A40;
  }
  v23[0] = v5;
  v22[1] = kCFUserNotificationAlertMessageKey;
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[ACCUserNotification message](self, "message"));
  v7 = (void *)v6;
  if (v6) {
    v8 = (const __CFString *)v6;
  }
  else {
    v8 = &stru_100200A40;
  }
  v23[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  2LL));
  id v10 = [v9 mutableCopy];

  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[ACCUserNotification defaultButtonName](self, "defaultButtonName"));
  if (v11)
  {
    v12 = (void *)v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ACCUserNotification defaultButtonName](self, "defaultButtonName"));
    id v14 = [v13 length];

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ACCUserNotification defaultButtonName](self, "defaultButtonName"));
      [v10 setObject:v15 forKey:kCFUserNotificationDefaultButtonTitleKey];
    }
  }

  uint64_t v16 = objc_claimAutoreleasedReturnValue(-[ACCUserNotification otherButtonName](self, "otherButtonName"));
  if (v16)
  {
    v17 = (void *)v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ACCUserNotification otherButtonName](self, "otherButtonName"));
    id v19 = [v18 length];

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ACCUserNotification otherButtonName](self, "otherButtonName"));
      [v10 setObject:v20 forKey:kCFUserNotificationAlternateButtonTitleKey];
    }
  }

  id v21 = [v10 copy];
  -[ACCUserNotification setUserNotificationCFDict:](self, "setUserNotificationCFDict:", v21);
}

- (void)setUserNotificationCF:(__CFUserNotification *)a3
{
  userNotificationCF = self->_userNotificationCF;
  if (userNotificationCF) {
    CFRelease(userNotificationCF);
  }
  if (a3) {
    uint64_t v6 = (__CFUserNotification *)CFRetain(a3);
  }
  else {
    uint64_t v6 = 0LL;
  }
  self->_userNotificationCF = v6;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)defaultButtonName
{
  return self->_defaultButtonName;
}

- (void)setDefaultButtonName:(id)a3
{
}

- (NSString)otherButtonName
{
  return self->_otherButtonName;
}

- (void)setOtherButtonName:(id)a3
{
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (void)setIconURL:(id)a3
{
}

- (BOOL)isModal
{
  return self->_isModal;
}

- (void)setIsModal:(BOOL)a3
{
  self->_isModal = a3;
}

- (BOOL)dismissOnUnlock
{
  return self->_dismissOnUnlock;
}

- (void)setDismissOnUnlock:(BOOL)a3
{
  self->_dismissOnUnlock = a3;
}

- (BOOL)ignoreQuietMode
{
  return self->_ignoreQuietMode;
}

- (void)setIgnoreQuietMode:(BOOL)a3
{
  self->_ignoreQuietMode = a3;
}

- (BOOL)presentViaSystemAperture
{
  return self->_presentViaSystemAperture;
}

- (void)setPresentViaSystemAperture:(BOOL)a3
{
  self->_presentViaSystemAperture = a3;
}

- (NSNumber)systemSoundID
{
  return self->_systemSoundID;
}

- (void)setSystemSoundID:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
}

- (NSDictionary)userNotificationCFDict
{
  return self->_userNotificationCFDict;
}

- (void)setUserNotificationCFDict:(id)a3
{
}

- (__CFUserNotification)userNotificationCF
{
  return self->_userNotificationCF;
}

- (void).cxx_destruct
{
}

@end
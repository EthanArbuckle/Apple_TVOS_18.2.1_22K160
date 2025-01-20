@interface CDUserNotificationContent
+ (CDUserNotificationContent)appSignInContent;
+ (CDUserNotificationContent)learnMoreContent;
+ (CDUserNotificationContent)legacyAppSignInContent;
+ (CDUserNotificationContent)registerPasskeyContent;
+ (CDUserNotificationContent)storeAuthenticationContent;
+ (CDUserNotificationContent)storePurchaseContent;
+ (CDUserNotificationContent)tvProviderContent;
+ (id)_photosContent;
+ (id)_recognizeMyVoiceContent;
+ (id)_sharedWithYouContent;
+ (id)notificationContentForSystemService:(int64_t)a3;
+ (id)restrictedAccessContentForRestrictionType:(int64_t)a3;
- (NSArray)bodyArguments;
- (NSArray)titleArguments;
- (NSString)bodyKey;
- (NSString)bundleIdentifier;
- (NSString)categoryIdentifier;
- (NSString)iconName;
- (NSString)iconSystemName;
- (NSString)identifier;
- (NSString)titleKey;
- (unsigned)flags;
- (void)addBodyArgument:(id)a3;
- (void)addTitleArgument:(id)a3;
- (void)setBodyKey:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCategoryIdentifier:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setIconName:(id)a3;
- (void)setIconSystemName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setTitleKey:(id)a3;
@end

@implementation CDUserNotificationContent

+ (CDUserNotificationContent)appSignInContent
{
  v2 = objc_alloc_init(&OBJC_CLASS___CDUserNotificationContent);
  -[CDUserNotificationContent setBundleIdentifier:]( v2,  "setBundleIdentifier:",  @"com.apple.CompanionNotifications");
  -[CDUserNotificationContent setCategoryIdentifier:]( v2,  "setCategoryIdentifier:",  @"CDUserNotificationCategoryGeneric");
  -[CDUserNotificationContent setFlags:](v2, "setFlags:", 17LL);
  -[CDUserNotificationContent setIconSystemName:](v2, "setIconSystemName:", @"person.crop.circle");
  -[CDUserNotificationContent setTitleKey:](v2, "setTitleKey:", @"APP_SIGN_IN_TITLE");
  v3 = (void *)GestaltCopyAnswer(@"DeviceName", 0LL, 0LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%@",  @"APP_SIGN_IN_BODY",  v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uppercaseString]);

  -[CDUserNotificationContent setBodyKey:](v2, "setBodyKey:", v5);
  return v2;
}

+ (CDUserNotificationContent)legacyAppSignInContent
{
  v2 = objc_alloc_init(&OBJC_CLASS___CDUserNotificationContent);
  -[CDUserNotificationContent setBundleIdentifier:]( v2,  "setBundleIdentifier:",  @"com.apple.CompanionNotifications");
  -[CDUserNotificationContent setCategoryIdentifier:]( v2,  "setCategoryIdentifier:",  @"CDUserNotificationCategoryGeneric");
  -[CDUserNotificationContent setFlags:](v2, "setFlags:", 17LL);
  -[CDUserNotificationContent setIconSystemName:](v2, "setIconSystemName:", @"person.crop.circle");
  -[CDUserNotificationContent setTitleKey:](v2, "setTitleKey:", @"LEGACY_APP_SIGN_IN_TITLE");
  -[CDUserNotificationContent setBodyKey:](v2, "setBodyKey:", @"LEGACY_APP_SIGN_IN_BODY");
  return v2;
}

+ (CDUserNotificationContent)storePurchaseContent
{
  v2 = objc_alloc_init(&OBJC_CLASS___CDUserNotificationContent);
  -[CDUserNotificationContent setBundleIdentifier:]( v2,  "setBundleIdentifier:",  @"com.apple.CompanionNotifications");
  -[CDUserNotificationContent setCategoryIdentifier:]( v2,  "setCategoryIdentifier:",  @"CDUserNotificationCategoryGeneric");
  -[CDUserNotificationContent setFlags:](v2, "setFlags:", 17LL);
  else {
    v3 = @"touchid";
  }
  -[CDUserNotificationContent setIconSystemName:](v2, "setIconSystemName:", v3);
  -[CDUserNotificationContent setTitleKey:](v2, "setTitleKey:", @"STORE_PURCHASE_TITLE");
  v4 = (void *)GestaltCopyAnswer(@"DeviceName", 0LL, 0LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%@",  @"STORE_PURCHASE_BODY",  v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 uppercaseString]);

  -[CDUserNotificationContent setBodyKey:](v2, "setBodyKey:", v6);
  return v2;
}

+ (CDUserNotificationContent)registerPasskeyContent
{
  v2 = objc_alloc_init(&OBJC_CLASS___CDUserNotificationContent);
  -[CDUserNotificationContent setBundleIdentifier:]( v2,  "setBundleIdentifier:",  @"com.apple.CompanionNotifications");
  -[CDUserNotificationContent setCategoryIdentifier:]( v2,  "setCategoryIdentifier:",  @"CDUserNotificationCategoryGeneric");
  -[CDUserNotificationContent setFlags:](v2, "setFlags:", 17LL);
  -[CDUserNotificationContent setIconSystemName:](v2, "setIconSystemName:", @"person.badge.key.fill");
  -[CDUserNotificationContent setTitleKey:](v2, "setTitleKey:", @"REGISTER_PASSKEY_TITLE");
  v3 = (void *)GestaltCopyAnswer(@"DeviceName", 0LL, 0LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%@",  @"REGISTER_PASSKEY_BODY",  v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uppercaseString]);

  -[CDUserNotificationContent setBodyKey:](v2, "setBodyKey:", v5);
  return v2;
}

+ (id)notificationContentForSystemService:(int64_t)a3
{
  switch(a3)
  {
    case 4LL:
      v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _recognizeMyVoiceContent]);
      break;
    case 3LL:
      v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _photosContent]);
      break;
    case 2LL:
      v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedWithYouContent]);
      break;
    default:
      v3 = 0LL;
      break;
  }

  return v3;
}

+ (id)restrictedAccessContentForRestrictionType:(int64_t)a3
{
  v4 = objc_alloc_init(&OBJC_CLASS___CDUserNotificationContent);
  -[CDUserNotificationContent setBundleIdentifier:]( v4,  "setBundleIdentifier:",  @"com.apple.CompanionNotifications");
  -[CDUserNotificationContent setCategoryIdentifier:]( v4,  "setCategoryIdentifier:",  @"CDUserNotificationCategoryGeneric");
  -[CDUserNotificationContent setFlags:](v4, "setFlags:", 17LL);
  -[CDUserNotificationContent setIconSystemName:](v4, "setIconSystemName:", @"figure.child.and.lock.fill");
  -[CDUserNotificationContent setTitleKey:](v4, "setTitleKey:", @"RESTRICTED_ACCESS_TITLE");
  switch(a3)
  {
    case 1LL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v6 = v5;
      v7 = @"RESTRICTED_ACCESS_BODY_CONTENT";
      goto LABEL_8;
    case 2LL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v6 = v5;
      v7 = @"RESTRICTED_ACCESS_BODY_SETTINGS";
      goto LABEL_8;
    case 3LL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v6 = v5;
      v7 = @"RESTRICTED_ACCESS_BODY_PURCHASE";
      goto LABEL_8;
    case 4LL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v6 = v5;
      v7 = @"RESTRICTED_ACCESS_BODY_CONFERENCE_ROOM_DISPLAY";
      goto LABEL_8;
    case 5LL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v6 = v5;
      v7 = @"RESTRICTED_ACCESS_BODY_MODIFY_RESTRICTIONS";
      goto LABEL_8;
    case 6LL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v6 = v5;
      v7 = @"RESTRICTED_ACCESS_BODY_TURN_OFF_RESTRICTIONS";
LABEL_8:
      v8 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:v7 value:&stru_100031E78 table:0]);
      -[CDUserNotificationContent setBodyKey:](v4, "setBodyKey:", v8);

      break;
    default:
      return v4;
  }

  return v4;
}

+ (CDUserNotificationContent)storeAuthenticationContent
{
  v2 = objc_alloc_init(&OBJC_CLASS___CDUserNotificationContent);
  -[CDUserNotificationContent setBundleIdentifier:]( v2,  "setBundleIdentifier:",  @"com.apple.CompanionNotifications");
  -[CDUserNotificationContent setCategoryIdentifier:]( v2,  "setCategoryIdentifier:",  @"CDUserNotificationCategoryGeneric");
  -[CDUserNotificationContent setFlags:](v2, "setFlags:", 17LL);
  -[CDUserNotificationContent setIconSystemName:](v2, "setIconSystemName:", @"person.circle");
  -[CDUserNotificationContent setTitleKey:](v2, "setTitleKey:", @"STORE_AUTHENTICATION_TITLE");
  v3 = (void *)GestaltCopyAnswer(@"DeviceName", 0LL, 0LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%@",  @"STORE_AUTHENTICATION_BODY",  v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uppercaseString]);

  -[CDUserNotificationContent setBodyKey:](v2, "setBodyKey:", v5);
  return v2;
}

+ (CDUserNotificationContent)tvProviderContent
{
  v2 = objc_alloc_init(&OBJC_CLASS___CDUserNotificationContent);
  -[CDUserNotificationContent setBundleIdentifier:]( v2,  "setBundleIdentifier:",  @"com.apple.CompanionNotifications");
  -[CDUserNotificationContent setCategoryIdentifier:]( v2,  "setCategoryIdentifier:",  @"CDUserNotificationCategoryGeneric");
  -[CDUserNotificationContent setFlags:](v2, "setFlags:", 17LL);
  -[CDUserNotificationContent setIconSystemName:](v2, "setIconSystemName:", @"tv");
  -[CDUserNotificationContent setTitleKey:](v2, "setTitleKey:", @"TV_PROVIDER_TITLE");
  v3 = (void *)GestaltCopyAnswer(@"DeviceName", 0LL, 0LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%@",  @"TV_PROVIDER_BODY",  v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uppercaseString]);

  -[CDUserNotificationContent setBodyKey:](v2, "setBodyKey:", v5);
  return v2;
}

+ (CDUserNotificationContent)learnMoreContent
{
  v2 = objc_alloc_init(&OBJC_CLASS___CDUserNotificationContent);
  -[CDUserNotificationContent setBundleIdentifier:]( v2,  "setBundleIdentifier:",  @"com.apple.CompanionNotifications");
  -[CDUserNotificationContent setCategoryIdentifier:]( v2,  "setCategoryIdentifier:",  @"CDUserNotificationCategoryGeneric");
  -[CDUserNotificationContent setFlags:](v2, "setFlags:", 17LL);
  -[CDUserNotificationContent setIconSystemName:](v2, "setIconSystemName:", @"safari");
  -[CDUserNotificationContent setTitleKey:](v2, "setTitleKey:", @"LEARN_MORE_TITLE");
  v3 = (void *)GestaltCopyAnswer(@"DeviceName", 0LL, 0LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%@",  @"LEARN_MORE_BODY",  v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uppercaseString]);

  -[CDUserNotificationContent setBodyKey:](v2, "setBodyKey:", v5);
  return v2;
}

- (NSArray)titleArguments
{
  id v2 = -[NSMutableArray copy](self->_mutableTitleArguments, "copy");
  v3 = v2;
  if (!v2) {
    id v2 = &__NSArray0__struct;
  }
  v4 = (NSArray *)v2;

  return v4;
}

- (void)addTitleArgument:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  mutableTitleArguments = self->_mutableTitleArguments;
  id v10 = v4;
  if (!mutableTitleArguments)
  {
    v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v8 = self->_mutableTitleArguments;
    self->_mutableTitleArguments = v7;

    id v5 = v10;
    mutableTitleArguments = self->_mutableTitleArguments;
    if (v10) {
      goto LABEL_3;
    }
LABEL_5:
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    -[NSMutableArray addObject:](mutableTitleArguments, "addObject:", v9);

    goto LABEL_6;
  }

  if (!v4) {
    goto LABEL_5;
  }
LABEL_3:
  -[NSMutableArray addObject:](mutableTitleArguments, "addObject:", v5);
LABEL_6:
}

- (NSArray)bodyArguments
{
  id v2 = -[NSMutableArray copy](self->_mutableBodyArguments, "copy");
  v3 = v2;
  if (!v2) {
    id v2 = &__NSArray0__struct;
  }
  id v4 = (NSArray *)v2;

  return v4;
}

- (void)addBodyArgument:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  mutableBodyArguments = self->_mutableBodyArguments;
  id v10 = v4;
  if (!mutableBodyArguments)
  {
    v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v8 = self->_mutableBodyArguments;
    self->_mutableBodyArguments = v7;

    id v5 = v10;
    mutableBodyArguments = self->_mutableBodyArguments;
    if (v10) {
      goto LABEL_3;
    }
LABEL_5:
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    -[NSMutableArray addObject:](mutableBodyArguments, "addObject:", v9);

    goto LABEL_6;
  }

  if (!v4) {
    goto LABEL_5;
  }
LABEL_3:
  -[NSMutableArray addObject:](mutableBodyArguments, "addObject:", v5);
LABEL_6:
}

+ (id)_sharedWithYouContent
{
  id v2 = objc_alloc_init(&OBJC_CLASS___CDUserNotificationContent);
  -[CDUserNotificationContent setBundleIdentifier:]( v2,  "setBundleIdentifier:",  @"com.apple.CompanionNotifications");
  -[CDUserNotificationContent setCategoryIdentifier:]( v2,  "setCategoryIdentifier:",  @"CDUserNotificationCategoryGeneric");
  -[CDUserNotificationContent setFlags:](v2, "setFlags:", 17LL);
  -[CDUserNotificationContent setIconSystemName:](v2, "setIconSystemName:", @"shared.with.you");
  -[CDUserNotificationContent setTitleKey:](v2, "setTitleKey:", @"SHARED_WITH_YOU_TITLE");
  v3 = (void *)GestaltCopyAnswer(@"DeviceName", 0LL, 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%@",  @"SHARED_WITH_YOU_BODY",  v3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uppercaseString]);

  -[CDUserNotificationContent setBodyKey:](v2, "setBodyKey:", v5);
  return v2;
}

+ (id)_photosContent
{
  id v2 = objc_alloc_init(&OBJC_CLASS___CDUserNotificationContent);
  -[CDUserNotificationContent setBundleIdentifier:]( v2,  "setBundleIdentifier:",  @"com.apple.CompanionNotifications");
  -[CDUserNotificationContent setCategoryIdentifier:]( v2,  "setCategoryIdentifier:",  @"CDUserNotificationCategoryGeneric");
  -[CDUserNotificationContent setFlags:](v2, "setFlags:", 17LL);
  -[CDUserNotificationContent setIconSystemName:](v2, "setIconSystemName:", @"photos");
  -[CDUserNotificationContent setTitleKey:](v2, "setTitleKey:", @"PHOTOS_TITLE");
  v3 = (void *)GestaltCopyAnswer(@"DeviceName", 0LL, 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%@",  @"PHOTOS_BODY",  v3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uppercaseString]);

  -[CDUserNotificationContent setBodyKey:](v2, "setBodyKey:", v5);
  return v2;
}

+ (id)_recognizeMyVoiceContent
{
  id v2 = objc_alloc_init(&OBJC_CLASS___CDUserNotificationContent);
  -[CDUserNotificationContent setBundleIdentifier:]( v2,  "setBundleIdentifier:",  @"com.apple.CompanionNotifications");
  -[CDUserNotificationContent setCategoryIdentifier:]( v2,  "setCategoryIdentifier:",  @"CDUserNotificationCategoryGeneric");
  -[CDUserNotificationContent setFlags:](v2, "setFlags:", 17LL);
  -[CDUserNotificationContent setIconName:](v2, "setIconName:", @"siri-icon");
  -[CDUserNotificationContent setTitleKey:](v2, "setTitleKey:", @"RECOGNIZE_MY_VOICE_TITLE");
  v3 = (void *)GestaltCopyAnswer(@"DeviceName", 0LL, 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%@",  @"RECOGNIZE_MY_VOICE_BODY",  v3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uppercaseString]);

  -[CDUserNotificationContent setBodyKey:](v2, "setBodyKey:", v5);
  return v2;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (void)setCategoryIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (NSString)iconSystemName
{
  return self->_iconSystemName;
}

- (void)setIconSystemName:(id)a3
{
}

- (NSString)iconName
{
  return self->_iconName;
}

- (void)setIconName:(id)a3
{
}

- (NSString)titleKey
{
  return self->_titleKey;
}

- (void)setTitleKey:(id)a3
{
}

- (NSString)bodyKey
{
  return self->_bodyKey;
}

- (void)setBodyKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
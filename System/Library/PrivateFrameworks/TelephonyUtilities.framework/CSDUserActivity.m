@interface CSDUserActivity
+ (BOOL)activityTypeRequiresBestAppSuggestionListener:(unsigned int)a3;
+ (BOOL)activityTypeSupportsDynamicIdentifierRegistration:(unsigned int)a3;
+ (CSDUserActivity)activityWithType:(unsigned int)a3 dynamicIdentifier:(id)a4 userInfo:(id)a5 originatingDeviceType:(id)a6;
+ (id)_userActivityTypeStringForActivityType:(unsigned int)a3;
+ (id)appHistoryActivityWithTitle:(id)a3 subtitle:(id)a4 keywords:(id)a5 userInfo:(id)a6;
+ (unsigned)activityTypeForUserActivityTypeString:(id)a3;
+ (void)registerActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4;
+ (void)unregisterActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4;
- (NSString)dynamicIdentifier;
- (NSString)originatingDeviceType;
- (NSUserActivity)userActivity;
- (id)description;
- (void)addUserInfoEntriesFromDictionary:(id)a3;
- (void)becomeCurrent;
- (void)invalidate;
- (void)resignCurrent;
- (void)setDynamicIdentifier:(id)a3;
- (void)setOriginatingDeviceType:(id)a3;
- (void)setUserActivity:(id)a3;
@end

@implementation CSDUserActivity

+ (id)appHistoryActivityWithTitle:(id)a3 subtitle:(id)a4 keywords:(id)a5 userInfo:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = objc_alloc_init(&OBJC_CLASS___CSDUserActivity);
  v15 = (void *)objc_claimAutoreleasedReturnValue([a1 _userActivityTypeStringForActivityType:4]);
  id v16 = -[NSUserActivity _initWithTypeIdentifier:suggestedActionType:options:]( objc_alloc(&OBJC_CLASS___NSUserActivity),  "_initWithTypeIdentifier:suggestedActionType:options:",  v15,  1LL,  0LL);
  [v16 _setContentType:v15];
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  864000.0));
  [v16 setExpirationDate:v17];

  [v16 setEligibleForSearch:1];
  [v16 setEligibleForPublicIndexing:0];
  [v16 setEligibleForHandoff:0];
  [v16 setTitle:v13];

  [v16 _setSubtitle:v12];
  [v16 _setContentUserAction:NSUserActivityContentUserActionCall];
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v11));

  [v16 setKeywords:v18];
  -[CSDUserActivity setUserActivity:](v14, "setUserActivity:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivity userActivity](v14, "userActivity"));
  [v19 setUserInfo:v10];

  return v14;
}

+ (CSDUserActivity)activityWithType:(unsigned int)a3 dynamicIdentifier:(id)a4 userInfo:(id)a5 originatingDeviceType:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = objc_alloc_init(&OBJC_CLASS___CSDUserActivity);
  v14 = (void *)objc_claimAutoreleasedReturnValue([a1 _userActivityTypeStringForActivityType:v8]);
  if (v8 <= 5)
  {
    if (((1 << v8) & 0x2C) != 0)
    {
      v15 = objc_alloc(&OBJC_CLASS___NSUserActivity);
      v23[0] = UAUserActivityAlwaysPickKey;
      v23[1] = UAAlwaysAdvertise;
      v24[0] = &off_1003F17B0;
      v24[1] = &__kCFBooleanTrue;
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  2LL));
      id v17 = -[NSUserActivity _initWithUserActivityType:dynamicActivityType:options:]( v15,  "_initWithUserActivityType:dynamicActivityType:options:",  v14,  v10,  v16);
      -[CSDUserActivity setUserActivity:](v13, "setUserActivity:", v17);
    }

    else
    {
      if (((1 << v8) & 0x11) == 0)
      {
        id v21 = -[NSUserActivity _initWithTypeIdentifier:suggestedActionType:options:]( objc_alloc(&OBJC_CLASS___NSUserActivity),  "_initWithTypeIdentifier:suggestedActionType:options:",  v14,  12LL,  &__NSDictionary0__struct);
        -[CSDUserActivity setUserActivity:](v13, "setUserActivity:", v21);

        goto LABEL_8;
      }

      id v18 = sub_1001704C4();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v22[0] = 67109120;
        v22[1] = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[WARN] Bad activity type: %d",  (uint8_t *)v22,  8u);
      }
    }
  }

+ (void)registerActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[CSDUserActivity _userActivityTypeStringForActivityType:]( &OBJC_CLASS___CSDUserActivity,  "_userActivityTypeStringForActivityType:",  v4));
  unsigned int v7 = +[CSDUserActivity activityTypeSupportsDynamicIdentifierRegistration:]( &OBJC_CLASS___CSDUserActivity,  "activityTypeSupportsDynamicIdentifierRegistration:",  v4);
  id v8 = sub_1001704C4();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v10)
    {
      int v11 = 138412546;
      id v12 = v6;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Registering for %@ user activity type and dynamic identifier %@",  (uint8_t *)&v11,  0x16u);
    }

    +[NSUserActivity _registerUserActivityType:dynamicActivityType:]( &OBJC_CLASS___NSUserActivity,  "_registerUserActivityType:dynamicActivityType:",  v6,  v5);
  }

  else
  {
    if (v10)
    {
      int v11 = 138412546;
      id v12 = v6;
      __int16 v13 = 1024;
      LODWORD(v14) = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[WARN] Asked to register for activity type %@ (%d), but that is not supported",  (uint8_t *)&v11,  0x12u);
    }
  }
}

+ (void)unregisterActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[CSDUserActivity _userActivityTypeStringForActivityType:]( &OBJC_CLASS___CSDUserActivity,  "_userActivityTypeStringForActivityType:",  v4));
  unsigned int v7 = +[CSDUserActivity activityTypeSupportsDynamicIdentifierRegistration:]( &OBJC_CLASS___CSDUserActivity,  "activityTypeSupportsDynamicIdentifierRegistration:",  v4);
  id v8 = sub_1001704C4();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v10)
    {
      int v11 = 138412546;
      id v12 = v6;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Unregistering for %@ user activity type and dynamic identifier %@",  (uint8_t *)&v11,  0x16u);
    }

    +[NSUserActivity _unregisterUserActivityType:dynamicActivityType:]( &OBJC_CLASS___NSUserActivity,  "_unregisterUserActivityType:dynamicActivityType:",  v6,  v5);
  }

  else
  {
    if (v10)
    {
      int v11 = 138412546;
      id v12 = v6;
      __int16 v13 = 1024;
      LODWORD(v14) = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[WARN] Asked to unregister for activity type %@ (%d), but that is not supported",  (uint8_t *)&v11,  0x12u);
    }
  }
}

+ (BOOL)activityTypeSupportsDynamicIdentifierRegistration:(unsigned int)a3
{
  return (a3 < 6) & (0x2Cu >> a3);
}

+ (BOOL)activityTypeRequiresBestAppSuggestionListener:(unsigned int)a3
{
  return ((a3 - 3) & 0xFFFFFFFD) == 0;
}

+ (unsigned)activityTypeForUserActivityTypeString:(id)a3
{
  id v3 = a3;
  id v4 = [v3 isEqualToString:@"com.apple.mobilephone"];
  if ((v4 & 1) != 0)
  {
    unsigned int v6 = 1;
  }

  else
  {
    uint64_t v7 = TUCallHandoffActivityType(v4, v5);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    unsigned __int8 v9 = [v3 isEqualToString:v8];

    if ((v9 & 1) != 0)
    {
      unsigned int v6 = 2;
    }

    else if ([v3 isEqualToString:@"com.apple.telephonyutilities.suppressringtone"])
    {
      unsigned int v6 = 3;
    }

    else if ([v3 isEqualToString:TUUserActivityTypeConversationHandoff])
    {
      unsigned int v6 = 5;
    }

    else
    {
      unsigned int v6 = 0;
    }
  }

  return v6;
}

- (id)description
{
  id v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@ %p",  objc_opt_class(self, a2),  self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivity userActivity](self, "userActivity"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 activityType]);
  [v4 appendFormat:@" activityType=%@", v6];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivity dynamicIdentifier](self, "dynamicIdentifier"));
  [v4 appendFormat:@" dynamicIdentifier=%@", v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivity userActivity](self, "userActivity"));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
  [v4 appendFormat:@" activityUserInfo=%@", v9];

  [v4 appendString:@">"];
  id v10 = [v4 copy];

  return v10;
}

+ (id)_userActivityTypeStringForActivityType:(unsigned int)a3
{
  switch(a3)
  {
    case 1u:
      return @"com.apple.mobilephone";
    case 2u:
      uint64_t v4 = TUCallHandoffActivityType(a1, a2);
      id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
      goto LABEL_8;
    case 3u:
      return @"com.apple.telephonyutilities.suppressringtone";
    case 4u:
      uint64_t v6 = TUCallPhoneAppHistoryActivityType(a1, a2);
      id v5 = (id)objc_claimAutoreleasedReturnValue(v6);
      goto LABEL_8;
    case 5u:
      id v5 = TUUserActivityTypeConversationHandoff;
LABEL_8:
      id result = v5;
      break;
    default:
      id result = 0LL;
      break;
  }

  return result;
}

- (void)addUserInfoEntriesFromDictionary:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivity userActivity](self, "userActivity"));
  [v5 addUserInfoEntriesFromDictionary:v4];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSDUserActivity userActivity](self, "userActivity"));
  [v6 setNeedsSave:1];
}

- (void)becomeCurrent
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivity userActivity](self, "userActivity"));
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Beginning advertising user activity as current: %@",  (uint8_t *)&v7,  0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivity userActivity](self, "userActivity"));
  [v6 becomeCurrent];
}

- (void)resignCurrent
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivity userActivity](self, "userActivity"));
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Stopping advertising user activity as current, without invalidating: %@",  (uint8_t *)&v7,  0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivity userActivity](self, "userActivity"));
  [v6 resignCurrent];
}

- (void)invalidate
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivity userActivity](self, "userActivity"));
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Invalidating user activity: %@",  (uint8_t *)&v7,  0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivity userActivity](self, "userActivity"));
  [v6 invalidate];
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (void)setUserActivity:(id)a3
{
}

- (NSString)dynamicIdentifier
{
  return self->_dynamicIdentifier;
}

- (void)setDynamicIdentifier:(id)a3
{
}

- (NSString)originatingDeviceType
{
  return self->_originatingDeviceType;
}

- (void)setOriginatingDeviceType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
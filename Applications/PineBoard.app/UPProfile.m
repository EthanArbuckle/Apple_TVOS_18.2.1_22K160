@interface UPProfile
- (NSDate)pb_lastActiveDate;
- (NSPersonNameComponents)pb_personNameComponents;
- (NSSet)pb_preferredInputModes;
- (NSSet)pb_preferredLanguages;
- (NSSet)pb_recommendationGroupIdentities;
- (NSString)pb_customName;
- (NSString)pb_identifier;
- (NSString)pb_identityLogString;
- (PBSUserProfile)pb_userProfile;
- (id)_pb_pbsPreferredInputModes;
- (id)_pb_pbsPreferredLanguages;
- (int64_t)_pb_pbsAvailability;
- (int64_t)_pb_pbsGroupRecommendationsConsent;
- (int64_t)_pb_userProfileType;
- (int64_t)pb_recommendationGroupConsent;
@end

@implementation UPProfile

- (PBSUserProfile)pb_userProfile
{
  int64_t v3 = -[UPProfile _pb_userProfileType](self, "_pb_userProfileType");
  if (v3 == 1) {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UPProfile personaUniqueIdentifier](self, "personaUniqueIdentifier"));
  }
  else {
    v22 = 0LL;
  }
  v17 = objc_alloc(&OBJC_CLASS___PBSUserProfile);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UPProfile pb_identifier](self, "pb_identifier"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UPProfile iCloudAltDSID](self, "iCloudAltDSID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UPProfile iTunesAltDSID](self, "iTunesAltDSID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UPProfile gameCenterAltDSID](self, "gameCenterAltDSID"));
  unsigned __int8 v4 = -[UPProfile isActive](self, "isActive");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UPProfile pb_customName](self, "pb_customName"));
  int64_t v5 = -[UPProfile _pb_pbsGroupRecommendationsConsent](self, "_pb_pbsGroupRecommendationsConsent");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UPProfile pb_lastActiveDate](self, "pb_lastActiveDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UPProfile _pb_pbsPreferredLanguages](self, "_pb_pbsPreferredLanguages"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UPProfile _pb_pbsPreferredInputModes](self, "_pb_pbsPreferredInputModes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UPProfile pb_personNameComponents](self, "pb_personNameComponents"));
  int64_t v9 = -[UPProfile _pb_pbsAvailability](self, "_pb_pbsAvailability");
  LOBYTE(v14) = -[UPProfile isSetupInProgress](self, "isSetupInProgress");
  LOBYTE(v13) = v4;
  v10 = -[PBSUserProfile initWithIdentifier:type:iCloudAltDSID:iTunesAltDSID:gameCenterAltDSID:personaUniqueString:homeUserIdentifier:selected:overrideName:groupRecommendationsConsent:lastSelectedDate:preferredLanguages:preferredInputModes:personNameComponents:availability:setupInProgress:]( v17,  "initWithIdentifier:type:iCloudAltDSID:iTunesAltDSID:gameCenterAltDSID:personaUniqueString:homeUserIdentifier:s elected:overrideName:groupRecommendationsConsent:lastSelectedDate:preferredLanguages:preferredInputModes:perso nNameComponents:availability:setupInProgress:",  v21,  v3,  v20,  v19,  v18,  v22,  0LL,  v13,  v16,  v5,  v15,  v6,  v7,  v8,  v9,  v14);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UPProfile identity](self, "identity"));
  -[PBSUserProfile setIdentity:](v10, "setIdentity:", v11);

  return v10;
}

- (NSString)pb_identifier
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[UPProfile systemAppUserIdentifier](self, "systemAppUserIdentifier"));
  if (v4) {
    return (NSString *)v4;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"identifier != nil"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1002792F8(a2, (uint64_t)self, (uint64_t)v6);
  }
  result = (NSString *)_bs_set_crash_log_message([v6 UTF8String]);
  __break(0);
  return result;
}

- (NSString)pb_identityLogString
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[UPProfile systemAppUserIdentifier](self, "systemAppUserIdentifier"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[UPProfile identity](self, "identity"));
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (identifier=%@)",  v4,  v3));

  return (NSString *)v5;
}

- (int64_t)pb_recommendationGroupConsent
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[UPSettingKey recommendationGroupConsentSettingKey]( &OBJC_CLASS___UPSettingKey,  "recommendationGroupConsentSettingKey"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[UPProfile settingForKey:](self, "settingForKey:", v3));
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 value]);

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber);
  id v7 = v5;
  v8 = v7;
  if (v6)
  {
    if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0) {
      int64_t v9 = v8;
    }
    else {
      int64_t v9 = 0LL;
    }
  }

  else
  {
    int64_t v9 = 0LL;
  }

  id v10 = v9;

  if (v10) {
    id v11 = [v10 integerValue];
  }
  else {
    id v11 = 0LL;
  }

  return (int64_t)v11;
}

- (NSSet)pb_recommendationGroupIdentities
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[UPSettingKey recommendationGroupIdentitiesSettingKey]( &OBJC_CLASS___UPSettingKey,  "recommendationGroupIdentitiesSettingKey"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[UPProfile settingForKey:](self, "settingForKey:", v3));
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 value]);

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSSet);
  id v7 = v5;
  v8 = v7;
  if (v6)
  {
    if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0) {
      int64_t v9 = v8;
    }
    else {
      int64_t v9 = 0LL;
    }
  }

  else
  {
    int64_t v9 = 0LL;
  }

  id v10 = v9;

  return (NSSet *)v10;
}

- (NSString)pb_customName
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[UPSettingKey customNameSettingKey](&OBJC_CLASS___UPSettingKey, "customNameSettingKey"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[UPProfile settingForKey:](self, "settingForKey:", v3));
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 value]);

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
  id v7 = v5;
  v8 = v7;
  if (v6)
  {
    if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0) {
      int64_t v9 = v8;
    }
    else {
      int64_t v9 = 0LL;
    }
  }

  else
  {
    int64_t v9 = 0LL;
  }

  id v10 = v9;

  return (NSString *)v10;
}

- (NSPersonNameComponents)pb_personNameComponents
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[UPSettingKey nameComponentsSettingKey](&OBJC_CLASS___UPSettingKey, "nameComponentsSettingKey"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[UPProfile settingForKey:](self, "settingForKey:", v3));
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 value]);

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSPersonNameComponents);
  id v7 = v5;
  v8 = v7;
  if (v6)
  {
    if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0) {
      int64_t v9 = v8;
    }
    else {
      int64_t v9 = 0LL;
    }
  }

  else
  {
    int64_t v9 = 0LL;
  }

  id v10 = v9;

  return (NSPersonNameComponents *)v10;
}

- (NSDate)pb_lastActiveDate
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[UPSettingKey lastActiveDateSettingKey](&OBJC_CLASS___UPSettingKey, "lastActiveDateSettingKey"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[UPProfile settingForKey:](self, "settingForKey:", v3));
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 value]);

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDate);
  id v7 = v5;
  v8 = v7;
  if (v6)
  {
    if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0) {
      int64_t v9 = v8;
    }
    else {
      int64_t v9 = 0LL;
    }
  }

  else
  {
    int64_t v9 = 0LL;
  }

  id v10 = v9;

  return (NSDate *)v10;
}

- (NSSet)pb_preferredLanguages
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[UPSettingKey preferredLanguagesSettingKey]( &OBJC_CLASS___UPSettingKey,  "preferredLanguagesSettingKey"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[UPProfile settingForKey:](self, "settingForKey:", v3));
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 value]);

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSOrderedSet);
  id v7 = v5;
  v8 = v7;
  if (v6)
  {
    if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0) {
      int64_t v9 = v8;
    }
    else {
      int64_t v9 = 0LL;
    }
  }

  else
  {
    int64_t v9 = 0LL;
  }

  id v10 = v9;

  return (NSSet *)v10;
}

- (NSSet)pb_preferredInputModes
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[UPSettingKey preferredInputModesSettingKey]( &OBJC_CLASS___UPSettingKey,  "preferredInputModesSettingKey"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[UPProfile settingForKey:](self, "settingForKey:", v3));
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 value]);

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSOrderedSet);
  id v7 = v5;
  v8 = v7;
  if (v6)
  {
    if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0) {
      int64_t v9 = v8;
    }
    else {
      int64_t v9 = 0LL;
    }
  }

  else
  {
    int64_t v9 = 0LL;
  }

  id v10 = v9;

  return (NSSet *)v10;
}

- (int64_t)_pb_userProfileType
{
  return -[UPProfile isPrimary](self, "isPrimary") ^ 1;
}

- (int64_t)_pb_pbsAvailability
{
  return 1LL;
}

- (int64_t)_pb_pbsGroupRecommendationsConsent
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[UPSettingKey recommendationGroupConsentSettingKey]( &OBJC_CLASS___UPSettingKey,  "recommendationGroupConsentSettingKey"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[UPProfile settingForKey:](self, "settingForKey:", v3));
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 value]);

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber);
  id v7 = v5;
  v8 = v7;
  if (v6)
  {
    if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0) {
      int64_t v9 = v8;
    }
    else {
      int64_t v9 = 0LL;
    }
  }

  else
  {
    int64_t v9 = 0LL;
  }

  id v10 = v9;

  if (v10)
  {
    id v11 = [v10 integerValue];
    else {
      int64_t v12 = (int64_t)v11;
    }
  }

  else
  {
    int64_t v12 = 0LL;
  }

  return v12;
}

- (id)_pb_pbsPreferredLanguages
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UPProfile pb_preferredLanguages](self, "pb_preferredLanguages"));
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allObjects]);

  return v3;
}

- (id)_pb_pbsPreferredInputModes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UPProfile pb_preferredInputModes](self, "pb_preferredInputModes"));
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allObjects]);

  return v3;
}

@end
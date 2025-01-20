@interface MCAppEnforcedRestrictions
+ (id)enforcedRestrictionsForBundleID:(id)a3;
+ (id)enforcedRestrictionsForBundleID:(id)a3 countryCode:(id)a4;
+ (id)restrictionEnforcingApps;
+ (id)setOfActiveRestrictionUUIDs;
+ (id)setOfActiveRestrictionUUIDsForCountryCode:(id)a3;
@end

@implementation MCAppEnforcedRestrictions

+ (id)restrictionEnforcingApps
{
  if (qword_1000DC1F8 != -1) {
    dispatch_once(&qword_1000DC1F8, &stru_1000C3EF8);
  }
  return (id)qword_1000DC1F0;
}

+ (id)enforcedRestrictionsForBundleID:(id)a3
{
  return +[MCAppEnforcedRestrictions enforcedRestrictionsForBundleID:countryCode:]( &OBJC_CLASS___MCAppEnforcedRestrictions,  "enforcedRestrictionsForBundleID:countryCode:",  a3,  0LL);
}

+ (id)enforcedRestrictionsForBundleID:(id)a3 countryCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7) {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v7));
  }
  else {
    v8 = 0LL;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 restrictionEnforcingApps]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v6]);

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByAppendingPathComponent:@"MCRestrictions.plist"]);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v11));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[MCAppEnforcedRestrictionUtilities enforcedRestrictionsForBundleID:restrictionPlistURL:countryCodes:]( &OBJC_CLASS___MCAppEnforcedRestrictionUtilities,  "enforcedRestrictionsForBundleID:restrictionPlistURL:countryCodes:",  v6,  v12,  v8));
    }

    else
    {
      v15 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        int v17 = 138543362;
        id v18 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Could not find restriction plist for app “%{public}@”",  (uint8_t *)&v17,  0xCu);
      }

      v13 = 0LL;
    }
  }

  else
  {
    v14 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      int v17 = 138543362;
      id v18 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Attempted to enforce restrictions for unhandled app “%{public}@”",  (uint8_t *)&v17,  0xCu);
    }

    v13 = 0LL;
  }

  return v13;
}

+ (id)setOfActiveRestrictionUUIDs
{
  return +[MCAppEnforcedRestrictions setOfActiveRestrictionUUIDsForCountryCode:]( &OBJC_CLASS___MCAppEnforcedRestrictions,  "setOfActiveRestrictionUUIDsForCountryCode:",  0LL);
}

+ (id)setOfActiveRestrictionUUIDsForCountryCode:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[MCAppEnforcedRestrictions restrictionEnforcingApps]( &OBJC_CLASS___MCAppEnforcedRestrictions,  "restrictionEnforcingApps",  0LL));
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue( +[MCAppEnforcedRestrictions enforcedRestrictionsForBundleID:countryCode:]( &OBJC_CLASS___MCAppEnforcedRestrictions,  "enforcedRestrictionsForBundleID:countryCode:",  v10,  v3));
        if ([v11 count])
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue( +[MCAppEnforcedRestrictionUtilities clientUUIDForBundleID:]( &OBJC_CLASS___MCAppEnforcedRestrictionUtilities,  "clientUUIDForBundleID:",  v10));
          [v4 addObject:v12];
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  return v4;
}

@end
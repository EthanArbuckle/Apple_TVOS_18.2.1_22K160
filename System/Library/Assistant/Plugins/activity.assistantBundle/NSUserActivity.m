@interface NSUserActivity
- (BOOL)hasLocationData;
- (BOOL)hasPhoneNumber;
- (id)clientUserActivity;
- (id)combinedUserInfo;
@end

@implementation NSUserActivity

- (BOOL)hasLocationData
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserActivity contentAttributeSet](self, "contentAttributeSet"));
  unsigned __int8 v3 = [v2 hasLocationData];

  return v3;
}

- (BOOL)hasPhoneNumber
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserActivity contentAttributeSet](self, "contentAttributeSet"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 phoneNumbers]);
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)clientUserActivity
{
  unsigned __int8 v3 = objc_alloc_init(&OBJC_CLASS___SAClientUserActivity);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserActivity _uniqueIdentifier](self, "_uniqueIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
  -[SAClientUserActivity setAceId:](v3, "setAceId:", v5);

  -[SAClientUserActivity setIsEligibleForDirections:]( v3,  "setIsEligibleForDirections:",  -[NSUserActivity hasLocationData](self, "hasLocationData"));
  -[SAClientUserActivity setIsEligibleForAppPunchout:]( v3,  "setIsEligibleForAppPunchout:",  -[NSUserActivity hasPhoneNumber](self, "hasPhoneNumber"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserActivity combinedUserInfo](self, "combinedUserInfo"));
  -[SAClientUserActivity setUserInfo:](v3, "setUserInfo:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserActivity activityType](self, "activityType"));
  -[SAClientUserActivity setType:](v3, "setType:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserActivity title](self, "title"));
  -[SAClientUserActivity setTitle:](v3, "setTitle:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserActivity webpageURL](self, "webpageURL"));
  -[SAClientUserActivity setWebpageURL:](v3, "setWebpageURL:", v9);

  -[SAClientUserActivity setIsEligibleForSearch:]( v3,  "setIsEligibleForSearch:",  -[NSUserActivity isEligibleForSearch](self, "isEligibleForSearch"));
  -[SAClientUserActivity setIsEligibleForPublicIndexing:]( v3,  "setIsEligibleForPublicIndexing:",  -[NSUserActivity isEligibleForPublicIndexing](self, "isEligibleForPublicIndexing"));
  -[SAClientUserActivity setIsEligibleForHandoff:]( v3,  "setIsEligibleForHandoff:",  -[NSUserActivity isEligibleForHandoff](self, "isEligibleForHandoff"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserActivity keywords](self, "keywords"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allObjects]);
  -[SAClientUserActivity setKeywords:](v3, "setKeywords:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserActivity requiredUserInfoKeys](self, "requiredUserInfoKeys"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 allObjects]);
  -[SAClientUserActivity setRequiredUserInfoKeys:](v3, "setRequiredUserInfoKeys:", v13);

  return v3;
}

- (id)combinedUserInfo
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserActivity userInfo](self, "userInfo"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserActivity contentAttributeSet](self, "contentAttributeSet"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 addressDictionary]);
  [v4 addEntriesFromDictionary:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserActivity contentAttributeSet](self, "contentAttributeSet"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 longitude]);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserActivity contentAttributeSet](self, "contentAttributeSet"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 longitude]);
    [v4 setObject:v10 forKey:@"longitude"];
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserActivity contentAttributeSet](self, "contentAttributeSet"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 latitude]);

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserActivity contentAttributeSet](self, "contentAttributeSet"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 latitude]);
    [v4 setObject:v14 forKey:@"latitude"];
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserActivity contentAttributeSet](self, "contentAttributeSet"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 phoneNumbers]);
  id v17 = [v16 count];

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserActivity contentAttributeSet](self, "contentAttributeSet"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 phoneNumbers]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 firstObject]);
    [v4 setObject:v20 forKey:@"phone"];
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserActivity contentAttributeSet](self, "contentAttributeSet"));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 namedLocation]);

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserActivity contentAttributeSet](self, "contentAttributeSet"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 namedLocation]);
    [v4 setObject:v24 forKey:@"name"];
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserActivity externalMediaContentIdentifier](self, "externalMediaContentIdentifier"));

  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserActivity externalMediaContentIdentifier](self, "externalMediaContentIdentifier"));
    [v4 setObject:v26 forKey:@"externalMediaContentIdentifier"];

    v27 = (void *)objc_claimAutoreleasedReturnValue( -[NSUserActivity _externalMediaContentBundleIdentifier]( self,  "_externalMediaContentBundleIdentifier"));
    [v4 setObject:v27 forKey:@"externalMediaContentBundleIdentifier"];
  }

  return v4;
}

@end
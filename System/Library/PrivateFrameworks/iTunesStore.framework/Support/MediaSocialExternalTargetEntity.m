@interface MediaSocialExternalTargetEntity
+ (id)databaseTable;
+ (id)newEntityValuesWithMediaSocialExternalDestination:(id)a3;
@end

@implementation MediaSocialExternalTargetEntity

+ (id)newEntityValuesWithMediaSocialExternalDestination:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 accessToken]);
  if (v5) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v5, @"access_token");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 pageAccessToken]);

  if (v6) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v6, @"page_access_token");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 pageIdentifier]);

  if (v7) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v7, @"page_id");
  }
  v8 = objc_alloc(&OBJC_CLASS___NSNumber);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v3 serviceIdentifier]);
  v10 = -[NSNumber initWithInteger:](v8, "initWithInteger:", sub_100087764(v9));

  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v10, @"service_type");
  return v4;
}

+ (id)databaseTable
{
  return @"external_target";
}

@end
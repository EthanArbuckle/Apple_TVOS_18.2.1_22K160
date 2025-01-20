@interface AppEventEntityCrossfire
+ (id)databaseTable;
+ (id)defaultProperties;
@end

@implementation AppEventEntityCrossfire

+ (id)databaseTable
{
  return @"app_events_crossfire";
}

+ (id)defaultProperties
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___AppEventEntityCrossfire;
  id v2 = objc_msgSendSuper2(&v8, "defaultProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v3));

  v9[0] = @"clip_affiliate_token";
  v9[1] = @"clip_app_type";
  v9[2] = @"clip_campaign";
  v9[3] = @"clip_campaign_token";
  v9[4] = @"clip_provider_token";
  v9[5] = @"clip_ref_source";
  v9[6] = @"clip_ref_type";
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 7LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 arrayByAddingObjectsFromArray:v5]);

  return v6;
}

@end
@interface BetaAppFeedbackMemoryEntity
+ (Class)databaseEntityClass;
+ (id)defaultProperties;
@end

@implementation BetaAppFeedbackMemoryEntity

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___BetaAppFeedbackEntity, a2);
}

+ (id)defaultProperties
{
  v3[0] = @"account_dsid";
  v3[1] = @"attempt_count";
  v3[2] = @"app_version";
  v3[3] = @"beta_build_group_id";
  v3[4] = @"feedback";
  v3[5] = @"successful_image_uploads";
  v3[6] = @"is_app_clip";
  v3[7] = @"log_key";
  v3[8] = @"next_retry_date";
  v3[9] = @"pending_image_uploads";
  v3[10] = @"state";
  v3[11] = @"item_id";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  12LL));
}

- (void).cxx_destruct
{
}

@end
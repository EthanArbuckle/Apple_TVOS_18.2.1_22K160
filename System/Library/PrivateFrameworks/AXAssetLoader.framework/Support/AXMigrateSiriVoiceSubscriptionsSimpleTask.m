@interface AXMigrateSiriVoiceSubscriptionsSimpleTask
+ (id)triggers;
@end

@implementation AXMigrateSiriVoiceSubscriptionsSimpleTask

+ (id)triggers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[AXSimpleAssetTaskTrigger withFirstBootType]( &OBJC_CLASS___AXSimpleAssetTaskTrigger,  "withFirstBootType"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));

  return v3;
}

@end
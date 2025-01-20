@interface AXTVKitGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXTVKitGlue

+ (id)accessibilityBundles
{
  return 0LL;
}

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXValidationManager sharedInstance](&OBJC_CLASS___AXValidationManager, "sharedInstance"));
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_178 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_182];

    id v3 = [objc_allocWithZone((Class)AXTVKitGlue) init];
    v4 = (void *)_Failover;
    _Failover = (uint64_t)v3;
  }

BOOL __44__AXTVKitGlue_accessibilityInitializeBundle__block_invoke(id a1, AXValidationManager *a2)
{
  return 1;
}

BOOL __44__AXTVKitGlue_accessibilityInitializeBundle__block_invoke_2(id a1, AXValidationManager *a2)
{
  v2 = a2;
  -[AXValidationManager setValidationTargetName:](v2, "setValidationTargetName:", @"TVKit");
  -[AXValidationManager setOverrideProcessName:](v2, "setOverrideProcessName:", @"TVKit");
  -[AXValidationManager setDebugBuild:](v2, "setDebugBuild:", 0LL);

  return AXPerformValidationChecks();
}

@end
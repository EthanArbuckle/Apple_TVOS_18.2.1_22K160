@interface ZOTSystemInterface
+ (id)applicationWorkspace;
+ (id)runningApplications;
+ (id)topApplicationBundleId;
+ (void)initialize;
+ (void)sendUserEventOccurred;
@end

@implementation ZOTSystemInterface

+ (void)initialize
{
  Class v2 = NSClassFromString(@"AXBackBoardGlue");
  uint64_t v3 = objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)AXBackboardGlue;
  AXBackboardGlue = v3;

  id v5 = (id)objc_claimAutoreleasedReturnValue(+[AXValidationManager sharedInstance](&OBJC_CLASS___AXValidationManager, "sharedInstance"));
  [v5 performValidations:&__block_literal_global_1 withPreValidationHandler:&__block_literal_global_205 postValidationHandler:0];
}

BOOL __32__ZOTSystemInterface_initialize__block_invoke(id a1, AXValidationManager *a2)
{
  Class v2 = a2;
  -[AXValidationManager validateClass:hasClassMethod:withFullSignature:]( v2,  "validateClass:hasClassMethod:withFullSignature:",  @"AXBackBoardGlue",  @"sendUserEventOccurred",  "v",  0LL);
  -[AXValidationManager validateClass:hasClassMethod:withFullSignature:]( v2,  "validateClass:hasClassMethod:withFullSignature:",  @"AXBackBoardGlue",  @"topApplicationBundleId",  "@",  0LL);
  -[AXValidationManager validateClass:hasClassMethod:withFullSignature:]( v2,  "validateClass:hasClassMethod:withFullSignature:",  @"AXBackBoardGlue",  @"runningApplications",  "@",  0LL);
  -[AXValidationManager validateClass:hasClassMethod:withFullSignature:]( v2,  "validateClass:hasClassMethod:withFullSignature:",  @"AXBackBoardGlue",  @"applicationWorkspace",  "@",  0LL);
  -[AXValidationManager validateClass:hasInstanceVariable:withType:]( v2,  "validateClass:hasInstanceVariable:withType:",  @"BKApplication",  @"_activationSettings",  "BKSApplicationActivationSettings");
  -[AXValidationManager validateClass:hasInstanceMethod:withFullSignature:]( v2,  "validateClass:hasInstanceMethod:withFullSignature:",  @"BKSApplicationActivationSettings",  @"classic",  "B",  0LL);
  -[AXValidationManager validateClass:hasInstanceMethod:withFullSignature:]( v2,  "validateClass:hasInstanceMethod:withFullSignature:",  @"BKApplication",  @"noteSuspended:",  "v",  "^{__GSEvent=}",  0LL);
  -[AXValidationManager validateClass:hasInstanceMethod:withFullSignature:]( v2,  "validateClass:hasInstanceMethod:withFullSignature:",  @"BKApplication",  @"noteSuspensionSettingsUpdated:",  "v",  "^{__GSEvent=}",  0LL);

  return 1;
}

BOOL __32__ZOTSystemInterface_initialize__block_invoke_2(id a1, AXValidationManager *a2)
{
  Class v2 = a2;
  -[AXValidationManager setValidationTargetName:](v2, "setValidationTargetName:", @"ZoomTouch");
  -[AXValidationManager setOverrideProcessName:](v2, "setOverrideProcessName:", @"ZoomTouch");

  return AXPerformValidationChecks();
}

+ (void)sendUserEventOccurred
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXUserEventTimer sharedInstance](&OBJC_CLASS___AXUserEventTimer, "sharedInstance"));
  [v2 userEventOccurred];
}

+ (id)topApplicationBundleId
{
  return [(id)AXBackboardGlue safeValueForKey:@"topApplicationBundleId"];
}

+ (id)runningApplications
{
  return [(id)AXBackboardGlue safeValueForKey:@"runningApplications"];
}

+ (id)applicationWorkspace
{
  return [(id)AXBackboardGlue safeValueForKey:@"applicationWorkspace"];
}

@end
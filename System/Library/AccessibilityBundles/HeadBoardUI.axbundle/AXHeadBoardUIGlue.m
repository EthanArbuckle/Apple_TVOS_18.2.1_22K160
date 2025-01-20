@interface AXHeadBoardUIGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXHeadBoardUIGlue

+ (id)accessibilityBundles
{
  return 0LL;
}

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXValidationManager sharedInstance](&OBJC_CLASS___AXValidationManager, "sharedInstance"));
    [v2 performValidations:&__block_literal_global_0 withPreValidationHandler:&__block_literal_global_178 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_182];

    v3 = objc_alloc_init(&OBJC_CLASS___AXHeadBoardUIGlue);
    v4 = (void *)_Failover;
    _Failover = (uint64_t)v3;
  }

BOOL __50__AXHeadBoardUIGlue_accessibilityInitializeBundle__block_invoke(id a1, AXValidationManager *a2)
{
  return 1;
}

BOOL __50__AXHeadBoardUIGlue_accessibilityInitializeBundle__block_invoke_2(id a1, AXValidationManager *a2)
{
  v2 = a2;
  -[AXValidationManager setValidationTargetName:](v2, "setValidationTargetName:", @"HeadBoardUI");
  -[AXValidationManager setOverrideProcessName:](v2, "setOverrideProcessName:", @"HeadBoardUI");
  -[AXValidationManager setDebugBuild:](v2, "setDebugBuild:", 0LL);

  return AXPerformValidationChecks();
}

void __50__AXHeadBoardUIGlue_accessibilityInitializeBundle__block_invoke_3(id a1, AXValidationManager *a2)
{
  v2 = a2;
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"HBUITopShelfHostViewControllerAccessibility",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"HBUITopShelfParadeActionsCollectionViewCellAccessibility",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"HBUITopShelfParadeDetailsContentViewControllerAccessibility",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"HBUITopShelfParadeButtonAccessibility",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"HBUITopShelfParadeContentCoordinatorAccessibility",  1LL);
}

@end
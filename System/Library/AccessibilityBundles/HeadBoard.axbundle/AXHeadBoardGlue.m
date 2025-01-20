@interface AXHeadBoardGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXHeadBoardGlue

+ (id)accessibilityBundles
{
  return 0LL;
}

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXValidationManager sharedInstance](&OBJC_CLASS___AXValidationManager, "sharedInstance"));
    [v2 performValidations:&__block_literal_global_0 withPreValidationHandler:&__block_literal_global_190 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_194];

    id v3 = [objc_allocWithZone((Class)AXHeadBoardGlue) init];
    v4 = (void *)_Failover;
    _Failover = (uint64_t)v3;
  }

BOOL __48__AXHeadBoardGlue_accessibilityInitializeBundle__block_invoke(id a1, AXValidationManager *a2)
{
  v2 = a2;
  -[AXValidationManager validateClass:hasInstanceMethod:withFullSignature:]( v2,  "validateClass:hasInstanceMethod:withFullSignature:",  @"HBAppGridLayout",  @"rowFromIndexPath:",  "Q",  "@",  0LL);
  -[AXValidationManager validateClass:hasInstanceMethod:withFullSignature:]( v2,  "validateClass:hasInstanceMethod:withFullSignature:",  @"HBAppGridLayout",  @"colFromIndexPath:",  "Q",  "@",  0LL);
  -[AXValidationManager validateClass:hasInstanceMethod:withFullSignature:]( v2,  "validateClass:hasInstanceMethod:withFullSignature:",  @"HBAppGridView",  @"layout",  "@",  0LL);

  return 1;
}

BOOL __48__AXHeadBoardGlue_accessibilityInitializeBundle__block_invoke_2(id a1, AXValidationManager *a2)
{
  v2 = a2;
  -[AXValidationManager setValidationTargetName:](v2, "setValidationTargetName:", @"HeadBoard");
  -[AXValidationManager setOverrideProcessName:](v2, "setOverrideProcessName:", @"HeadBoard");
  -[AXValidationManager setDebugBuild:](v2, "setDebugBuild:", 0LL);

  return AXPerformValidationChecks();
}

void __48__AXHeadBoardGlue_accessibilityInitializeBundle__block_invoke_3(id a1, AXValidationManager *a2)
{
  v2 = a2;
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"HB_UICollectionViewAccessibility",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"TVImageStackCollectionViewCellAccessibility__HeadBoard__TVKit",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"HBAppGridViewAccessibility",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"_HBMainViewAccessibility",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"HBTopShelfLabeledContentViewCellAccessibility",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"HBRootCellAccessibility",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"HBAppDeleteHintViewAccessibility",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"HBTopShelfLabeledContentViewAccessibility",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"HBTopShelfSectionLabelAccessibility",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"HBTopShelfBannerViewCellAccessibility",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"HBTopShelfAppBundleViewControllerAccessibility",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"HBFolderViewControllerAccessibility",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"HBTopShelfBannerViewControllerAccessibility",  1LL);
}

@end
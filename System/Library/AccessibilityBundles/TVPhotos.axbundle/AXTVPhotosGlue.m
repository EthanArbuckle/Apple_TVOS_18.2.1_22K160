@interface AXTVPhotosGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXTVPhotosGlue

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

    id v3 = [objc_allocWithZone((Class)AXTVPhotosGlue) init];
    v4 = (void *)_Failover;
    _Failover = (uint64_t)v3;
  }

BOOL __47__AXTVPhotosGlue_accessibilityInitializeBundle__block_invoke(id a1, AXValidationManager *a2)
{
  return 1;
}

BOOL __47__AXTVPhotosGlue_accessibilityInitializeBundle__block_invoke_2(id a1, AXValidationManager *a2)
{
  v2 = a2;
  -[AXValidationManager setValidationTargetName:](v2, "setValidationTargetName:", @"TVPhotos");
  -[AXValidationManager setOverrideProcessName:](v2, "setOverrideProcessName:", @"TVPhotos");
  -[AXValidationManager setDebugBuild:](v2, "setDebugBuild:", 0LL);

  return AXPerformValidationChecks();
}

void __47__AXTVPhotosGlue_accessibilityInitializeBundle__block_invoke_3(id a1, AXValidationManager *a2)
{
  v2 = a2;
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"TVPSharedPSMainViewControllerAccessibility",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"TVOneUpPresentationImplementationDelegateAccessibility",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"TVPPhotoCellAccessibility",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"TVPhotoLibraryGridViewCellAccessibility",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"TVPSharedPSActivitySupplementaryViewAccessibility",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"TVPSharedPSActivityBannerViewAccessibility",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"TVPSharedPSAlbumDescriptionViewAccessibility",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"TVPPhotoLibraryTitleViewAccessibility",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"TVPPhotoLibraryMomentsHeaderViewAccessibility",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"TVPMemoriesTabCollectionViewCellAccessibility",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"UITabBarButtonAccessibility",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"UITabBarAccessibility",  1LL);
}

@end
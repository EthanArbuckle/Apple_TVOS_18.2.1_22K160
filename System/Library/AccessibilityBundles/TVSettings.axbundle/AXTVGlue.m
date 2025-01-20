@interface AXTVGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXTVGlue

+ (id)accessibilityBundles
{
  return 0LL;
}

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXValidationManager sharedInstance](&OBJC_CLASS___AXValidationManager, "sharedInstance"));
    [v2 performValidations:&__block_literal_global_0 withPreValidationHandler:&__block_literal_global_180 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_184];

    v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXBinaryMonitor sharedInstance](&OBJC_CLASS___AXBinaryMonitor, "sharedInstance"));
    [v3 addHandler:&__block_literal_global_205 forFramework:@"TVSettingKit"];

    id v4 = [objc_allocWithZone((Class)AXTVGlue) init];
    v5 = (void *)_Failover;
    _Failover = (uint64_t)v4;
  }

BOOL __41__AXTVGlue_accessibilityInitializeBundle__block_invoke(id a1, AXValidationManager *a2)
{
  return 1;
}

BOOL __41__AXTVGlue_accessibilityInitializeBundle__block_invoke_2(id a1, AXValidationManager *a2)
{
  v2 = a2;
  -[AXValidationManager setValidationTargetName:](v2, "setValidationTargetName:", @"TVSettings");
  -[AXValidationManager setOverrideProcessName:](v2, "setOverrideProcessName:", @"TVSettings");
  -[AXValidationManager setDebugBuild:](v2, "setDebugBuild:", 0LL);

  return AXPerformValidationChecks();
}

void __41__AXTVGlue_accessibilityInitializeBundle__block_invoke_3(id a1, AXValidationManager *a2)
{
  v2 = a2;
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"TVSettingsInfoCellAccessibility",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"TVSettingsLearnRemoteViewControllerAccessibility",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"TVHighlightingLabelAccessibility__TVSettings__TVKit",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"TVSettingsColorBarsViewAccessibility",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"TVSettings_UILabelAccessibility",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"TVSettingsLanguageViewControllerAccessibility",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"TVSettingsCAPackageViewAccessibility",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"TVSettingsColorCalibrationViewAccessibility",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"TVSettingsSignalStrengthCellAccessibility",  1LL);
}

void __41__AXTVGlue_accessibilityInitializeBundle__block_invoke_4(id a1)
{
  dispatch_time_t v1 = dispatch_time(0LL, 500000000LL);
  dispatch_after(v1, &_dispatch_main_q, &__block_literal_global_206);
}

void __41__AXTVGlue_accessibilityInitializeBundle__block_invoke_5(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[AXValidationManager sharedInstance](&OBJC_CLASS___AXValidationManager, "sharedInstance"));
  [v1 performValidations:&__block_literal_global_207 withPreValidationHandler:&__block_literal_global_208 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_211];
}

BOOL __41__AXTVGlue_accessibilityInitializeBundle__block_invoke_6(id a1, AXValidationManager *a2)
{
  return 1;
}

BOOL __41__AXTVGlue_accessibilityInitializeBundle__block_invoke_7(id a1, AXValidationManager *a2)
{
  v2 = a2;
  -[AXValidationManager setValidationTargetName:](v2, "setValidationTargetName:", @"TVSettings1");
  -[AXValidationManager setOverrideProcessName:](v2, "setOverrideProcessName:", @"TVSettings1");
  -[AXValidationManager setDebugBuild:](v2, "setDebugBuild:", 0LL);

  return AXPerformValidationChecks();
}

void __41__AXTVGlue_accessibilityInitializeBundle__block_invoke_8(id a1, AXValidationManager *a2)
{
}

@end
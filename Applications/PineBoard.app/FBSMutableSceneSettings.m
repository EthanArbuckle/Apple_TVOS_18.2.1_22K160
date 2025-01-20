@interface FBSMutableSceneSettings
- (void)setPb_isAppJailed:(BOOL)a3;
@end

@implementation FBSMutableSceneSettings

- (void)setPb_isAppJailed:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBSMutableSceneSettings transientLocalSettings](self, "transientLocalSettings"));
  [v4 setFlag:BSSettingFlagForBool(v3) forSetting:807381945];
}

@end
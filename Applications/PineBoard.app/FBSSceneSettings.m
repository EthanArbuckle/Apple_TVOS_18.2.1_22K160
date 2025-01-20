@interface FBSSceneSettings
- (BOOL)pb_isAppJailed;
@end

@implementation FBSSceneSettings

- (BOOL)pb_isAppJailed
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FBSSceneSettings transientLocalSettings](self, "transientLocalSettings"));
  id v3 = [v2 flagForSetting:807381945];

  return BSSettingFlagIsYes(v3);
}

@end
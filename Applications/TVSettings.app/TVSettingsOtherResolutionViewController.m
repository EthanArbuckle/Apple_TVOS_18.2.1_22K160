@interface TVSettingsOtherResolutionViewController
- (id)loadSettingGroups;
@end

@implementation TVSettingsOtherResolutionViewController

- (id)loadSettingGroups
{
  return -[TVSettingsResolutionViewController resolutionGroupsForCommonModes:]( self,  "resolutionGroupsForCommonModes:",  0LL);
}

@end
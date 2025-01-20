@interface TVSettingsDNSEditingViewController
- (id)_promptText;
@end

@implementation TVSettingsDNSEditingViewController

- (id)_promptText
{
  return (id)TSKLocString(@"NetworkConfigureDNSEntryPrompt");
}

@end
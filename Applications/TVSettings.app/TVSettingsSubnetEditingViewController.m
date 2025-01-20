@interface TVSettingsSubnetEditingViewController
- (id)_promptText;
@end

@implementation TVSettingsSubnetEditingViewController

- (id)_promptText
{
  return (id)TSKLocString(@"NetworkConfigureSubnetEntryPrompt");
}

@end
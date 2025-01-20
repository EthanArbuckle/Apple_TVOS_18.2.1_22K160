@interface TVSettingsRouterEditingViewController
- (id)_promptText;
@end

@implementation TVSettingsRouterEditingViewController

- (id)_promptText
{
  return (id)TSKLocString(@"NetworkConfigureRouterEntryPrompt");
}

@end
@interface NSURL(LSPreferredLocalizations)
- (id)ls_preferredLocalizations;
- (void)ls_setPreferredLocalizations:()LSPreferredLocalizations;
@end

@implementation NSURL(LSPreferredLocalizations)

- (id)ls_preferredLocalizations
{
  id v3 = 0LL;
  [a1 getResourceValue:&v3 forKey:@"com.apple.launchservices.preferredLocalizations" error:0];
  return v3;
}

- (void)ls_setPreferredLocalizations:()LSPreferredLocalizations
{
  id v4 = a3;
}

@end
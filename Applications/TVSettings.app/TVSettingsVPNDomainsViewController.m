@interface TVSettingsVPNDomainsViewController
- (TVSettingsVPNConfiguration)configuration;
- (TVSettingsVPNDomainsViewController)initWithConfiguration:(id)a3;
- (id)loadSettingGroups;
- (id)title;
- (void)setConfiguration:(id)a3;
@end

@implementation TVSettingsVPNDomainsViewController

- (TVSettingsVPNDomainsViewController)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSettingsVPNDomainsViewController;
  v5 = -[TVSettingsVPNDomainsViewController init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[TVSettingsVPNDomainsViewController setConfiguration:](v5, "setConfiguration:", v4);
  }

  return v6;
}

- (id)title
{
  return (id)TSKLocString(@"VPNDomainsTitle");
}

- (id)loadSettingGroups
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNDomainsViewController configuration](self, "configuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v2,  @"domains",  &stru_100193050));
  v6 = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));

  return v4;
}

- (TVSettingsVPNConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
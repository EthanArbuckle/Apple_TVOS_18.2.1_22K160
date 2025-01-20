@interface DMDConfigurationSource
- (NSString)description;
- (NSString)organizationIdentifier;
- (void)setOrganizationIdentifier:(id)a3;
@end

@implementation DMDConfigurationSource

- (void)setOrganizationIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSource organization](self, "organization"));
  [v5 setIdentifier:v4];
}

- (NSString)organizationIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSource organization](self, "organization"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 identifier]);

  return (NSString *)v3;
}

- (NSString)description
{
  v7[0] = @"identifier";
  v7[1] = @"organizationIdentifier";
  v7[2] = @"displayName";
  v7[3] = @"machServiceName";
  v7[4] = @"reportingRequirements";
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 5LL));
  uint64_t v4 = DMFObjectDescriptionWithProperties(self, v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return (NSString *)v5;
}

@end
@interface DMDConfigurationSourceRepresentation
- (DMDConfigurationSourceRepresentation)initWithConfigurationSource:(id)a3;
- (DMFReportingRequirements)reportingRequirements;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)machServiceName;
- (NSString)organizationIdentifier;
- (NSXPCListenerEndpoint)listenerEndpoint;
- (void)setDisplayName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setListenerEndpoint:(id)a3;
- (void)setMachServiceName:(id)a3;
- (void)setOrganizationIdentifier:(id)a3;
- (void)setReportingRequirements:(id)a3;
@end

@implementation DMDConfigurationSourceRepresentation

- (DMDConfigurationSourceRepresentation)initWithConfigurationSource:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___DMDConfigurationSourceRepresentation;
  v5 = -[DMDConfigurationSourceRepresentation init](&v19, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 identifier]);
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 organizationIdentifier]);
    organizationIdentifier = v5->_organizationIdentifier;
    v5->_organizationIdentifier = (NSString *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue([v4 displayName]);
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue([v4 machServiceName]);
    machServiceName = v5->_machServiceName;
    v5->_machServiceName = (NSString *)v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue([v4 listenerEndpoint]);
    listenerEndpoint = v5->_listenerEndpoint;
    v5->_listenerEndpoint = (NSXPCListenerEndpoint *)v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue([v4 reportingRequirements]);
    reportingRequirements = v5->_reportingRequirements;
    v5->_reportingRequirements = (DMFReportingRequirements *)v16;
  }

  return v5;
}

- (NSString)description
{
  v7[0] = @"identifier";
  v7[1] = @"displayName";
  v7[2] = @"machServiceName";
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 3LL));
  uint64_t v4 = DMFObjectDescriptionWithProperties(self, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return (NSString *)v5;
}

- (NSString)debugDescription
{
  v7[0] = @"identifier";
  v7[1] = @"displayName";
  v7[2] = @"machServiceName";
  void v7[3] = @"listenerEndpoint";
  v7[4] = @"reportingRequirements";
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 5LL));
  uint64_t v4 = DMFObjectDescriptionWithProperties(self, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return (NSString *)v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)organizationIdentifier
{
  return self->_organizationIdentifier;
}

- (void)setOrganizationIdentifier:(id)a3
{
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (void)setMachServiceName:(id)a3
{
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return self->_listenerEndpoint;
}

- (void)setListenerEndpoint:(id)a3
{
}

- (DMFReportingRequirements)reportingRequirements
{
  return self->_reportingRequirements;
}

- (void)setReportingRequirements:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
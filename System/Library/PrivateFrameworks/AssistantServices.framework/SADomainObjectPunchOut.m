@interface SADomainObjectPunchOut
- (BOOL)supportsADSADOCommand;
- (id)domainFromSADObject;
- (id)expectedResponseClassName;
@end

@implementation SADomainObjectPunchOut

- (id)domainFromSADObject
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SADomainObjectPunchOut domainItem](self, "domainItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 groupIdentifier]);

  return v3;
}

- (id)expectedResponseClassName
{
  return SACommandSucceededClassIdentifier;
}

- (BOOL)supportsADSADOCommand
{
  return 1;
}

@end
@interface SADomainObjectUpdate
- (BOOL)supportsADSADOCommand;
- (id)domainFromSADObject;
- (id)expectedResponseClassName;
@end

@implementation SADomainObjectUpdate

- (id)domainFromSADObject
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SADomainObjectUpdate identifier](self, "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 groupIdentifier]);

  return v3;
}

- (id)expectedResponseClassName
{
  return SADomainObjectUpdateCompletedClassIdentifier;
}

- (BOOL)supportsADSADOCommand
{
  return 1;
}

@end
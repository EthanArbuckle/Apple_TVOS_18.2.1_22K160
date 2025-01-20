@interface SADomainObjectDelete
- (BOOL)supportsADSADOCommand;
- (id)domainFromSADObject;
- (id)expectedResponseClassName;
@end

@implementation SADomainObjectDelete

- (id)domainFromSADObject
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SADomainObjectDelete identifier](self, "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 groupIdentifier]);

  return v3;
}

- (id)expectedResponseClassName
{
  return SADomainObjectDeleteCompletedClassIdentifier;
}

- (BOOL)supportsADSADOCommand
{
  return 1;
}

@end
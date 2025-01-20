@interface SADomainObjectCancel
- (BOOL)supportsADSADOCommand;
- (id)domainFromSADObject;
- (id)expectedResponseClassName;
@end

@implementation SADomainObjectCancel

- (id)domainFromSADObject
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SADomainObjectCancel identifier](self, "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 groupIdentifier]);

  return v3;
}

- (id)expectedResponseClassName
{
  return SADomainObjectCancelCompletedClassIdentifier;
}

- (BOOL)supportsADSADOCommand
{
  return 1;
}

@end
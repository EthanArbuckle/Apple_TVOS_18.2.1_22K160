@interface SADomainObjectRetrieve
- (BOOL)supportsADSADOCommand;
- (id)domainFromSADObject;
- (id)expectedResponseClassName;
@end

@implementation SADomainObjectRetrieve

- (id)domainFromSADObject
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SADomainObjectRetrieve identifiers](self, "identifiers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 lastObject]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 groupIdentifier]);

  return v4;
}

- (id)expectedResponseClassName
{
  return SADomainObjectRetrieveCompletedClassIdentifier;
}

- (BOOL)supportsADSADOCommand
{
  return 1;
}

@end
@interface DMDEngineProcessStatusOperation
- (NSString)organizationIdentifier;
- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3;
- (void)setOrganizationIdentifier:(id)a3;
@end

@implementation DMDEngineProcessStatusOperation

- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineProcessStatusOperation organizationIdentifier](self, "organizationIdentifier"));
  [v4 postNotificationName:@"DMDConfigurationSourceStatusDidChange" object:v5];

  -[DMDEngineProcessStatusOperation setResultObject:](self, "setResultObject:", 0LL);
}

- (NSString)organizationIdentifier
{
  return self->_organizationIdentifier;
}

- (void)setOrganizationIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
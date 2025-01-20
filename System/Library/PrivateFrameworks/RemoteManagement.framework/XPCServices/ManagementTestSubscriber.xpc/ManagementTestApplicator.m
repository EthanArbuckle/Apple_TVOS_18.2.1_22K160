@interface ManagementTestApplicator
+ (id)supportedConfigurationTypes;
- (ManagementTestApplicator)init;
@end

@implementation ManagementTestApplicator

- (ManagementTestApplicator)init
{
  v3 = objc_opt_new(&OBJC_CLASS___ManagementTestAdapter);
  v4 = -[ManagementTestApplicator initWithAdapter:inPlaceUpdates:](self, "initWithAdapter:inPlaceUpdates:", v3, 1LL);

  return v4;
}

+ (id)supportedConfigurationTypes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelManagementTestDeclaration registeredIdentifier]( &OBJC_CLASS___RMModelManagementTestDeclaration,  "registeredIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v2));

  return v3;
}

@end
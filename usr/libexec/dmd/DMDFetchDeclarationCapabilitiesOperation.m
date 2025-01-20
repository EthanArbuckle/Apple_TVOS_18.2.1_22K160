@interface DMDFetchDeclarationCapabilitiesOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (unint64_t)queueGroup;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDFetchDeclarationCapabilitiesOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFFetchDeclarationCapabilitiesRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5748;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___DMDFetchDeclarationCapabilitiesOperation;
  return objc_msgSendSuper2(&v5, "validateRequest:error:", a3, a4);
}

- (unint64_t)queueGroup
{
  return 1LL;
}

- (void)runWithRequest:(id)a3
{
  id v11 = (id)objc_opt_new(&OBJC_CLASS___DMFFetchDeclarationCapabilitiesResultObject);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[DMDConfigurationCapabilities supportedCommandTypes]( &OBJC_CLASS___DMDConfigurationCapabilities,  "supportedCommandTypes"));
  [v11 setSupportedCommands:v4];

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[DMDConfigurationCapabilities supportedAssetTypes]( &OBJC_CLASS___DMDConfigurationCapabilities,  "supportedAssetTypes"));
  [v11 setSupportedAssets:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[DMDConfigurationCapabilities supportedConfigurationTypes]( &OBJC_CLASS___DMDConfigurationCapabilities,  "supportedConfigurationTypes"));
  [v11 setSupportedConfigurations:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[DMDConfigurationCapabilities supportedEventTypes]( &OBJC_CLASS___DMDConfigurationCapabilities,  "supportedEventTypes"));
  [v11 setSupportedEvents:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[DMDConfigurationCapabilities supportedActivationTypes]( &OBJC_CLASS___DMDConfigurationCapabilities,  "supportedActivationTypes"));
  [v11 setSupportedActivations:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[DMDConfigurationCapabilities supportedPredicateTypes]( &OBJC_CLASS___DMDConfigurationCapabilities,  "supportedPredicateTypes"));
  [v11 setSupportedPredicates:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[DMDConfigurationCapabilities supportedMessageTypes]( &OBJC_CLASS___DMDConfigurationCapabilities,  "supportedMessageTypes"));
  [v11 setSupportedMessages:v10];

  -[DMDFetchDeclarationCapabilitiesOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v11);
}

@end
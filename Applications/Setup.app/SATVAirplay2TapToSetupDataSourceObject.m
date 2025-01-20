@interface SATVAirplay2TapToSetupDataSourceObject
- (NSString)description;
- (NSString)name;
- (NSString)uniqueIdentifier;
- (SATVAirplay2TapToSetupDataSourceObject)initWithHomeKitObject:(id)a3;
- (TVSKTapToSetupHomeKitObject)homeKitObject;
@end

@implementation SATVAirplay2TapToSetupDataSourceObject

- (SATVAirplay2TapToSetupDataSourceObject)initWithHomeKitObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SATVAirplay2TapToSetupDataSourceObject;
  v6 = -[SATVAirplay2TapToSetupDataSourceObject init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_homeKitObject, a3);
  }

  return v7;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2TapToSetupDataSourceObject homeKitObject](self, "homeKitObject"));
  id v5 = [v3 appendObject:v4 withName:@"homeKitObject"];

  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);
  return (NSString *)v6;
}

- (NSString)uniqueIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2TapToSetupDataSourceObject homeKitObject](self, "homeKitObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 uniqueIdentifier]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 UUIDString]);

  return (NSString *)v4;
}

- (NSString)name
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2TapToSetupDataSourceObject homeKitObject](self, "homeKitObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 name]);

  return (NSString *)v3;
}

- (TVSKTapToSetupHomeKitObject)homeKitObject
{
  return self->_homeKitObject;
}

- (void).cxx_destruct
{
}

@end
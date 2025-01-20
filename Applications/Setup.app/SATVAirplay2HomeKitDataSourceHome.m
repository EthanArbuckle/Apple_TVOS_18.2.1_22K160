@interface SATVAirplay2HomeKitDataSourceHome
- (NSString)description;
- (NSString)name;
- (NSString)uniqueIdentifier;
- (SATVAirplay2HomeKitDataSourceHome)initWithHome:(id)a3;
- (TVCSHome)home;
@end

@implementation SATVAirplay2HomeKitDataSourceHome

- (SATVAirplay2HomeKitDataSourceHome)initWithHome:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SATVAirplay2HomeKitDataSourceHome;
  v6 = -[SATVAirplay2HomeKitDataSourceHome init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_home, a3);
  }

  return v7;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2HomeKitDataSourceHome home](self, "home"));
  id v5 = [v3 appendObject:v4 withName:@"home"];

  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);
  return (NSString *)v6;
}

- (NSString)uniqueIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2HomeKitDataSourceHome home](self, "home"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 hmHome]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueIdentifier]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);

  return (NSString *)v5;
}

- (NSString)name
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2HomeKitDataSourceHome home](self, "home"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 name]);

  return (NSString *)v3;
}

- (TVCSHome)home
{
  return self->_home;
}

- (void).cxx_destruct
{
}

@end
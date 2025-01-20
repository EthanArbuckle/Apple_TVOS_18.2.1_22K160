@interface SATVAirplay2HomeKitDataSourceRoom
- (NSString)description;
- (NSString)name;
- (NSString)uniqueIdentifier;
- (SATVAirplay2HomeKitDataSourceRoom)initWithRoom:(id)a3;
- (TVCSRoom)room;
@end

@implementation SATVAirplay2HomeKitDataSourceRoom

- (SATVAirplay2HomeKitDataSourceRoom)initWithRoom:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SATVAirplay2HomeKitDataSourceRoom;
  v6 = -[SATVAirplay2HomeKitDataSourceRoom init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_room, a3);
  }

  return v7;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2HomeKitDataSourceRoom room](self, "room"));
  id v5 = [v3 appendObject:v4 withName:@"room"];

  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);
  return (NSString *)v6;
}

- (NSString)uniqueIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2HomeKitDataSourceRoom room](self, "room"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 hmRoom]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueIdentifier]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);

  return (NSString *)v5;
}

- (NSString)name
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2HomeKitDataSourceRoom room](self, "room"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 name]);

  return (NSString *)v3;
}

- (TVCSRoom)room
{
  return self->_room;
}

- (void).cxx_destruct
{
}

@end
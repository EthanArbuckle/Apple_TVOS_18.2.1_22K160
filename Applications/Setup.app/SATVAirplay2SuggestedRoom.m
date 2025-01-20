@interface SATVAirplay2SuggestedRoom
- (NSString)description;
- (NSString)name;
- (NSString)uniqueIdentifier;
- (SATVAirplay2SuggestedRoom)initWithUniqueIdentifier:(id)a3 name:(id)a4;
@end

@implementation SATVAirplay2SuggestedRoom

- (SATVAirplay2SuggestedRoom)initWithUniqueIdentifier:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SATVAirplay2SuggestedRoom;
  v8 = -[SATVAirplay2SuggestedRoom init](&v14, "init");
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    uniqueIdentifier = v8->_uniqueIdentifier;
    v8->_uniqueIdentifier = v9;

    v11 = (NSString *)[v7 copy];
    name = v8->_name;
    v8->_name = v11;
  }

  return v8;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2SuggestedRoom uniqueIdentifier](self, "uniqueIdentifier"));
  id v5 = [v3 appendObject:v4 withName:@"uniqueIdentifier"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2SuggestedRoom name](self, "name"));
  [v3 appendString:v6 withName:@"name"];

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);
  return (NSString *)v7;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

@end
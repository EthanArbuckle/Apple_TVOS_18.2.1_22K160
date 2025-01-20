@interface SharingIDSChannelEndpoint
+ (id)_properties;
+ (id)databaseTable;
- (SharingIDSChannelEndpoint)initWithIDSEndpoint:(id)a3 inDatabase:(id)a4;
@end

@implementation SharingIDSChannelEndpoint

- (SharingIDSChannelEndpoint)initWithIDSEndpoint:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v9, @"ia");

  id v10 = [v6 isDeviceOnSameIDSAccount];
  v11 = @"true";
  if (v10 != (id)1) {
    v11 = 0LL;
  }
  if (v10 == (id)2) {
    v12 = @"false";
  }
  else {
    v12 = v11;
  }
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v12, @"ib");
  v13 = (void *)objc_claimAutoreleasedReturnValue([v6 idsCorrelationIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v13, @"ic");

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v8, v7);
  return v14;
}

+ (id)databaseTable
{
  return @"breakfast_burrito";
}

+ (id)_properties
{
  v3[0] = @"ia";
  v3[1] = @"ib";
  v3[2] = @"ic";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  3LL));
}

@end
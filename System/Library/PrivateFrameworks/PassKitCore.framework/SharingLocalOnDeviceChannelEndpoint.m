@interface SharingLocalOnDeviceChannelEndpoint
+ (id)_properties;
+ (id)databaseTable;
- (SharingLocalOnDeviceChannelEndpoint)initWithLocalEndpoint:(id)a3 inDatabase:(id)a4;
@end

@implementation SharingLocalOnDeviceChannelEndpoint

- (SharingLocalOnDeviceChannelEndpoint)initWithLocalEndpoint:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 sourceTransportIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v9, @"la");

  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 destinationTransportIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v10, @"lb");

  v11 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v8, v6);
  return v11;
}

+ (id)databaseTable
{
  return @"green_eggs_ham";
}

+ (id)_properties
{
  v3[0] = @"la";
  v3[1] = @"lb";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  2LL));
}

@end
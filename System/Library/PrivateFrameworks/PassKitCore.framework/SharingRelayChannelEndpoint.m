@interface SharingRelayChannelEndpoint
+ (id)_properties;
+ (id)databaseTable;
- (SharingRelayChannelEndpoint)initWithRelayServerEndpoint:(id)a3 inDatabase:(id)a4;
@end

@implementation SharingRelayChannelEndpoint

- (SharingRelayChannelEndpoint)initWithRelayServerEndpoint:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v9 = PDSharingRelayServerEndpointStatusToString((uint64_t)[v7 mailboxStatus]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v10, @"ra");

  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 payloadEncryptionPassword]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 base64EncodedStringWithOptions:0]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v12, @"rb");

  v13 = (void *)objc_claimAutoreleasedReturnValue([v7 deviceClaim]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v13, @"rc");

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v7 hasOutstandingMessages]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v14, @"rd");

  v15 = (void *)objc_claimAutoreleasedReturnValue([v7 relayServerHost]);
  v16 = (void *)_SQLValueForURL(v15);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v16, @"rf");

  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v7 timeToLive]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v17, @"rg");

  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v7 doesRemoteMailboxSupportPushNotifications]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v18, @"rh");

  id v19 = [v7 pollingBackoffCounter];
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v19));
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v20, @"ri");

  v21 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v8, v6);
  return v21;
}

+ (id)databaseTable
{
  return @"mangosteen";
}

+ (id)_properties
{
  v3[0] = @"ra";
  v3[1] = @"rb";
  v3[2] = @"rc";
  v3[3] = @"rd";
  v3[4] = @"rf";
  v3[5] = @"rg";
  v3[6] = @"rh";
  v3[7] = @"ri";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  8LL));
}

@end
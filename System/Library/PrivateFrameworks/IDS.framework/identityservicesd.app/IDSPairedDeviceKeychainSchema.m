@interface IDSPairedDeviceKeychainSchema
- (BOOL)isMigrationRequiredForKeychainDictionary:(id)a3;
- (id)_migrateFromSinglePairedDeviceToMultipleWithKeychainDictionary:(id)a3;
- (id)_propertyDictionariesFromPairedDevices:(id)a3;
- (id)keychainDictionaryWithPairedDevices:(id)a3;
- (id)migrateKeychainDictionary:(id)a3;
- (unint64_t)_migrationTypeForKeychainDictionary:(id)a3;
@end

@implementation IDSPairedDeviceKeychainSchema

- (id)keychainDictionaryWithPairedDevices:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPairedDeviceKeychainSchema _propertyDictionariesFromPairedDevices:]( self,  "_propertyDictionariesFromPairedDevices:",  a3));
  v6[0] = @"schema-version";
  v6[1] = @"paired-devices";
  v7[0] = &off_100946D08;
  v7[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  2LL));

  return v4;
}

- (id)_propertyDictionariesFromPairedDevices:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v12 + 1) + 8 * (void)v9),  "persistedProperties",  (void)v12));
        [v4 addObject:v10];

        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  return v4;
}

- (BOOL)isMigrationRequiredForKeychainDictionary:(id)a3
{
  return -[IDSPairedDeviceKeychainSchema _migrationTypeForKeychainDictionary:]( self,  "_migrationTypeForKeychainDictionary:",  a3) != 0;
}

- (unint64_t)_migrationTypeForKeychainDictionary:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"schema-version"]);
  id v4 = [v3 unsignedIntegerValue];
  if (v4)
  {
    if (v4 != (id)9200)
    {
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        sub_10069C1B8((uint64_t)v3, v5);
      }
    }

    unint64_t v6 = 0LL;
  }

  else
  {
    unint64_t v6 = 1LL;
  }

  return v6;
}

- (id)migrateKeychainDictionary:(id)a3
{
  id v4 = a3;
  unint64_t v5 = -[IDSPairedDeviceKeychainSchema _migrationTypeForKeychainDictionary:]( self,  "_migrationTypeForKeychainDictionary:",  v4);
  id v6 = v4;
  id v7 = v6;
  if (v5 == 1)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPairedDeviceKeychainSchema _migrateFromSinglePairedDeviceToMultipleWithKeychainDictionary:]( self,  "_migrateFromSinglePairedDeviceToMultipleWithKeychainDictionary:",  v6));
  }

  else
  {
    uint64_t v8 = v6;
    if (!v5)
    {
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        sub_10069C22C(v9);
      }

      uint64_t v8 = v7;
    }
  }

  return v8;
}

- (id)_migrateFromSinglePairedDeviceToMultipleWithKeychainDictionary:(id)a3
{
  id v4 = a3;
  unint64_t v5 = -[IDSPairedDevice initWithProperties:](objc_alloc(&OBJC_CLASS___IDSPairedDevice), "initWithProperties:", v4);

  id v6 = -[IDSPairedDevice initWithPairedDevice:isActive:]( objc_alloc(&OBJC_CLASS___IDSPairedDevice),  "initWithPairedDevice:isActive:",  v5,  1LL);
  v10 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPairedDeviceKeychainSchema keychainDictionaryWithPairedDevices:]( self,  "keychainDictionaryWithPairedDevices:",  v7));

  return v8;
}

@end
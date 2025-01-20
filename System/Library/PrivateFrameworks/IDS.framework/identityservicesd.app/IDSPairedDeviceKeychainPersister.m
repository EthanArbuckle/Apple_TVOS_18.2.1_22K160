@interface IDSPairedDeviceKeychainPersister
- (BOOL)_removeFromKeychain;
- (BOOL)_saveToKeychainWithDictionary:(id)a3;
- (BOOL)savePairedDevices:(id)a3;
- (IDSPairedDeviceKeychainPersister)init;
- (id)_pairedDevicesFromPropertyDictionaries:(id)a3;
- (id)loadPairedDevices;
@end

@implementation IDSPairedDeviceKeychainPersister

- (IDSPairedDeviceKeychainPersister)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___IDSPairedDeviceKeychainPersister;
  v2 = -[IDSPairedDeviceKeychainPersister init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___IDSPairedDeviceKeychainSchema);
    keychainSchema = v2->_keychainSchema;
    v2->_keychainSchema = v3;
  }

  return v2;
}

- (id)loadPairedDevices
{
  int v16 = 0;
  id v15 = 0LL;
  int v3 = IMGetKeychainData(&v15, @"com.apple.ids", @"PairedDevice", @"apple", &v16);
  id v4 = v15;
  v5 = v4;
  if (v3)
  {
    uint64_t v6 = JWDecodeDictionary(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    if ([v7 count])
    {
      if (-[IDSPairedDeviceKeychainSchema isMigrationRequiredForKeychainDictionary:]( self->_keychainSchema,  "isMigrationRequiredForKeychainDictionary:",  v7))
      {
        uint64_t v8 = objc_claimAutoreleasedReturnValue( -[IDSPairedDeviceKeychainSchema migrateKeychainDictionary:]( self->_keychainSchema,  "migrateKeychainDictionary:",  v7));

        v7 = (void *)v8;
      }

      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"paired-devices"]);
      v10 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPairedDeviceKeychainPersister _pairedDevicesFromPropertyDictionaries:]( self,  "_pairedDevicesFromPropertyDictionaries:",  v9));
    }

    else
    {
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        sub_1006A89A8(v9);
      }
      v10 = &__NSArray0__struct;
    }

    goto LABEL_21;
  }

  if (v16 != -25300)
  {
    if (v16 == -34019)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v11 = "Paired device properties can't be loaded because the keychain is upgrading.";
        v12 = (os_log_s *)v7;
        uint32_t v13 = 2;
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }

    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v18 = v16;
        v11 = "Paired device properties can't be loaded because of a keychain error %d.";
        v12 = (os_log_s *)v7;
        uint32_t v13 = 8;
        goto LABEL_19;
      }
    }

    v10 = 0LL;
    goto LABEL_21;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_DEFAULT,  "Didn't find device properties to load",  buf,  2u);
  }

  v10 = &__NSArray0__struct;
LABEL_21:

  return v10;
}

- (BOOL)savePairedDevices:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPairedDeviceKeychainSchema keychainDictionaryWithPairedDevices:]( self->_keychainSchema,  "keychainDictionaryWithPairedDevices:",  v4));
    BOOL v6 = -[IDSPairedDeviceKeychainPersister _saveToKeychainWithDictionary:](self, "_saveToKeychainWithDictionary:", v5);
  }

  else
  {
    BOOL v6 = -[IDSPairedDeviceKeychainPersister _removeFromKeychain](self, "_removeFromKeychain");
  }

  return v6;
}

- (id)_pairedDevicesFromPropertyDictionaries:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)v9);
        v11 = objc_alloc(&OBJC_CLASS___IDSPairedDevice);
        v12 = -[IDSPairedDevice initWithProperties:](v11, "initWithProperties:", v10, (void)v14);
        [v4 addObject:v12];

        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  return v4;
}

- (BOOL)_saveToKeychainWithDictionary:(id)a3
{
  int v8 = 0;
  uint64_t v3 = JWEncodeDictionary(a3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  char v5 = IMSetKeychainData(v4, @"com.apple.ids", @"PairedDevice", @"apple", 0LL, &v8);
  if ((v5 & 1) == 0)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_1006A89E8();
    }
  }

  return v5;
}

- (BOOL)_removeFromKeychain
{
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Removing the paired device repository's keychain entry.",  buf,  2u);
  }

  int v6 = 0;
  char v3 = IMRemoveKeychainData(@"com.apple.ids", @"PairedDevice", &v6);
  if ((v3 & 1) == 0)
  {
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_1006A8A5C();
    }
  }

  return v3;
}

- (void).cxx_destruct
{
}

  ;
}

@end
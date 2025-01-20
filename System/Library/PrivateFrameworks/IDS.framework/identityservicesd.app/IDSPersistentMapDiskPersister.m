@interface IDSPersistentMapDiskPersister
- (BOOL)isAvailable;
- (IDSKeychainWrapper)keychainWrapper;
- (IDSPersistentMapDiskPersister)initWithIdentifier:(id)a3 dataProtectionClass:(int64_t)a4 keychainWrapper:(id)a5 systemMonitor:(id)a6;
- (IDSPersistentMapDiskPersister)initWithIdentifier:(id)a3 dataProtectionClass:(int64_t)a4 keychainWrapper:(id)a5 systemMonitor:(id)a6 fileDirectory:(id)a7;
- (IMSystemMonitor)systemMonitor;
- (NSString)directory;
- (NSString)identifier;
- (id)data;
- (int64_t)dataProtectionClass;
- (void)purgeData;
- (void)saveData:(id)a3 allowBackup:(BOOL)a4;
- (void)setDataProtectionClass:(int64_t)a3;
- (void)setDirectory:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setKeychainWrapper:(id)a3;
- (void)setSystemMonitor:(id)a3;
@end

@implementation IDSPersistentMapDiskPersister

- (IDSPersistentMapDiskPersister)initWithIdentifier:(id)a3 dataProtectionClass:(int64_t)a4 keychainWrapper:(id)a5 systemMonitor:(id)a6
{
  return -[IDSPersistentMapDiskPersister initWithIdentifier:dataProtectionClass:keychainWrapper:systemMonitor:fileDirectory:]( self,  "initWithIdentifier:dataProtectionClass:keychainWrapper:systemMonitor:fileDirectory:",  a3,  a4,  a5,  a6,  @"/Library/IdentityServices/Persistence/");
}

- (IDSPersistentMapDiskPersister)initWithIdentifier:(id)a3 dataProtectionClass:(int64_t)a4 keychainWrapper:(id)a5 systemMonitor:(id)a6 fileDirectory:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___IDSPersistentMapDiskPersister;
  v17 = -[IDSPersistentMapDiskPersister init](&v20, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_identifier, a3);
    v18->_dataProtectionClass = a4;
    objc_storeStrong((id *)&v18->_keychainWrapper, a5);
    objc_storeStrong((id *)&v18->_systemMonitor, a6);
    objc_storeStrong((id *)&v18->_directory, a7);
  }

  return v18;
}

- (BOOL)isAvailable
{
  int64_t v3 = -[IDSPersistentMapDiskPersister dataProtectionClass](self, "dataProtectionClass");
  if (v3)
  {
    if (v3 != 1) {
      return 1;
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPersistentMapDiskPersister systemMonitor](self, "systemMonitor"));
    unsigned __int8 v5 = [v4 isUnderDataProtectionLock];
  }

  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPersistentMapDiskPersister systemMonitor](self, "systemMonitor"));
    unsigned __int8 v5 = [v4 isUnderFirstDataProtectionLock];
  }

  char v6 = v5 ^ 1;

  return v6;
}

- (id)data
{
  if (!-[IDSPersistentMapDiskPersister isAvailable](self, "isAvailable")) {
    return 0LL;
  }
  int64_t v3 = NSHomeDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  directory = self->_directory;
  v42[0] = v4;
  v42[1] = directory;
  char v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v42, 2LL));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v6));

  identifier = self->_identifier;
  v41[0] = v7;
  v41[1] = identifier;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v41, 2LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v9));

  v11 = -[NSData initWithContentsOfFile:](objc_alloc(&OBJC_CLASS___NSData), "initWithContentsOfFile:", v10);
  if (-[NSData length](v11, "length") >= 0x11)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-aesKey",  self->_identifier));
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPersistentMapDiskPersister keychainWrapper](self, "keychainWrapper"));
    id v35 = 0LL;
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 dataForIdentifier:v34 error:&v35]);
    id v33 = v35;

    if (v15 && [v15 length] == (id)16)
    {
      id v16 = malloc(0x10uLL);
      -[NSData getBytes:range:](v11, "getBytes:range:", v16, 0LL, 16LL);
      v17 = (char *)-[NSData length](v11, "length") - 16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSData subdataWithRange:](v11, "subdataWithRange:", 16LL, v17));
      v19 = -[NSMutableData initWithLength:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithLength:", v17);
      *(void *)v38 = 0xAAAAAAAAAAAAAAAALL;
      id key = [v15 bytes];
      id v32 = v18;
      id v20 = [v32 bytes];
      id v21 = [v32 length];
      v22 = v19;
      v23 = (void *)CCCrypt( 1u,  0,  1u,  key,  0x10uLL,  v16,  v20,  (size_t)v21,  -[NSMutableData mutableBytes](v22, "mutableBytes"),  -[NSMutableData length](v22, "length"),  (size_t *)v38);
      free(v16);
      if ((_DWORD)v23)
      {
        uint64_t v24 = OSLogHandleForIDSCategory("IDSPersistentMap");
        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v37 = (int)v23;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "CCCrypt failed -- purging && returning nil {cryptResult: %d}",  buf,  8u);
        }

        if (os_log_shim_legacy_logging_enabled(v26))
        {
          if (_IDSShouldLog(0LL, @"IDSPersistentMap"))
          {
            dataOut = v23;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSPersistentMap",  @"CCCrypt failed -- purging && returning nil {cryptResult: %d}");
          }
        }

        -[IDSPersistentMapDiskPersister purgeData](self, "purgeData", dataOut);
        v12 = 0LL;
      }

      else
      {
        -[NSMutableData setLength:](v22, "setLength:", *(void *)v38);
        v12 = v22;
      }
    }

    else
    {
      uint64_t v27 = OSLogHandleForIDSCategory("IDSPersistentMap");
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v38 = 138412546;
        *(void *)&v38[4] = v33;
        __int16 v39 = 2112;
        v40 = v34;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Failed To load key -- returning nil {error: %@, keyIdentifier: %@}",  v38,  0x16u);
      }

      if (os_log_shim_legacy_logging_enabled(v29)
        && _IDSShouldLog(0LL, @"IDSPersistentMap"))
      {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSPersistentMap",  @"Failed To load key -- returning nil {error: %@, keyIdentifier: %@}");
      }

      v12 = 0LL;
    }
  }

  else
  {
    v12 = 0LL;
  }

  return v12;
}

- (void)saveData:(id)a3 allowBackup:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (-[IDSPersistentMapDiskPersister isAvailable](self, "isAvailable"))
  {
    v7 = NSHomeDirectory();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    directory = self->_directory;
    v62[0] = v8;
    v62[1] = directory;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v62, 2LL));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v10));

    identifier = self->_identifier;
    v61[0] = v11;
    v61[1] = identifier;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v61, 2LL));
    id v14 = (NSData *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v13));

    LODWORD(v13) = [v6 length] == 0;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v16 = v15;
    if ((_DWORD)v13)
    {
      id v57 = 0LL;
      unsigned __int8 v22 = [v15 removeItemAtPath:v14 error:&v57];
      id v52 = v57;

      if ((v22 & 1) == 0)
      {
        uint64_t v23 = OSLogHandleForIDSCategory("IDSPersistentMap");
        uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v52;
          __int16 v59 = 2112;
          v60 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Failed To remove file {error: %@, path: %@}",  buf,  0x16u);
        }

        if (os_log_shim_legacy_logging_enabled(v25)
          && _IDSShouldLog(0LL, @"IDSPersistentMap"))
        {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSPersistentMap",  @"Failed To remove file {error: %@, path: %@}");
        }
      }

      goto LABEL_42;
    }

    id v56 = 0LL;
    [v15 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:&v56];
    id v52 = v56;

    v17 = malloc(0x10uLL);
    int v18 = SecRandomCopyBytes(kSecRandomDefault, 0x10uLL, v17);
    if (v18)
    {
      uint64_t v19 = OSLogHandleForIDSCategory("IDSPersistentMap");
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Failed To Generate IV {ivResult: %d}",  buf,  8u);
      }

      if (os_log_shim_legacy_logging_enabled(v21)
        && _IDSShouldLog(0LL, @"IDSPersistentMap"))
      {
        _IDSLogV(0LL, @"IDSFoundation", @"IDSPersistentMap", @"Failed To Generate IV {ivResult: %d}");
      }

      free(v17);
      goto LABEL_42;
    }

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPersistentMapDiskPersister keychainWrapper](self, "keychainWrapper"));
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-aesKey",  self->_identifier));
    id v55 = 0LL;
    v28 = (NSData *)objc_claimAutoreleasedReturnValue([v26 dataForIdentifier:v27 error:&v55]);
    id v51 = v55;

    if (!v28 || (id)-[NSData length](v28, "length") != (id)16)
    {
      uint64_t v29 = malloc(0x10uLL);
      uint64_t v30 = OSLogHandleForIDSCategory("IDSPersistentMap");
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v51;
        __int16 v59 = 2112;
        v60 = v28;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Failed to get a stored key, generating a new key {error: %@, result: %@}",  buf,  0x16u);
      }

      if (os_log_shim_legacy_logging_enabled(v32)
        && _IDSShouldLog(0LL, @"IDSPersistentMap"))
      {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSPersistentMap",  @"Failed to get a stored key, generating a new key {error: %@, result: %@}");
      }

      int v33 = SecRandomCopyBytes(kSecRandomDefault, 0x10uLL, v29);
      if (v33)
      {
        uint64_t v34 = OSLogHandleForIDSCategory("IDSPersistentMap");
        id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v33;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Failed To Generate key {keyResult: %d}",  buf,  8u);
        }

        if (os_log_shim_legacy_logging_enabled(v36)
          && _IDSShouldLog(0LL, @"IDSPersistentMap"))
        {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSPersistentMap",  @"Failed To Generate key {keyResult: %d}");
        }

        free(v17);
        free(v29);
LABEL_41:

LABEL_42:
        goto LABEL_43;
      }

      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472LL;
      v54[2] = sub_100314F88;
      v54[3] = &unk_1008FC7D8;
      v54[4] = v29;
      int v37 = -[NSData initWithBytesNoCopy:length:deallocator:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytesNoCopy:length:deallocator:",  v29,  16LL,  v54);

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPersistentMapDiskPersister keychainWrapper](self, "keychainWrapper"));
      __int16 v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-aesKey",  self->_identifier));
      id v53 = 0LL;
      objc_msgSend( v38,  "saveData:forIdentifier:allowSync:allowBackup:dataProtectionClass:error:",  v37,  v39,  0,  v4,  -[IDSPersistentMapDiskPersister dataProtectionClass](self, "dataProtectionClass"),  &v53);
      id v40 = v53;

      if (v40)
      {
        uint64_t v41 = OSLogHandleForIDSCategory("IDSPersistentMap");
        v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v40;
          _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "Failed to save key -- returning {keySaveError: %@}",  buf,  0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v43)
          && _IDSShouldLog(0LL, @"IDSPersistentMap"))
        {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSPersistentMap",  @"Failed to save key -- returning {keySaveError: %@}");
        }

        free(v17);

        v28 = v37;
        goto LABEL_41;
      }

      v28 = v37;
    }

    v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableData dataWithLength:]( NSMutableData,  "dataWithLength:",  (char *)[v6 length] + 16));
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    v28 = v28;
    id v45 = -[NSData bytes](v28, "bytes");
    id v46 = v6;
    id v47 = [v46 bytes];
    id v48 = [v46 length];
    id v49 = v44;
    if (!CCCrypt( 0,  0,  1u,  v45,  0x10uLL,  v17,  v47,  (size_t)v48,  [v49 mutableBytes],  (size_t)objc_msgSend(v49, "length"),  (size_t *)buf)) {
      [v49 setLength:*(void *)buf];
    }
    v50 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
    -[NSMutableData appendBytes:length:](v50, "appendBytes:length:", v17, 16LL);
    -[NSMutableData appendData:](v50, "appendData:", v49);
    -[NSMutableData writeToFile:atomically:](v50, "writeToFile:atomically:", v14, 1LL);
    free(v17);

    goto LABEL_41;
  }

- (void)purgeData
{
  if (-[IDSPersistentMapDiskPersister isAvailable](self, "isAvailable"))
  {
    -[IDSPersistentMapDiskPersister saveData:allowBackup:](self, "saveData:allowBackup:", 0LL, 1LL);
    int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPersistentMapDiskPersister keychainWrapper](self, "keychainWrapper"));
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-aesKey",  self->_identifier));
    id v13 = 0LL;
    unsigned __int8 v5 = [v3 removeDataForIdentifier:v4 dataProtectionClass:0 error:&v13];
    id v6 = (IDSPersistentMapDiskPersister *)v13;

    if ((v5 & 1) == 0)
    {
      uint64_t v7 = OSLogHandleForIDSCategory("IDSPersistentMap");
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Failed to purge stored key {removeError: %@}",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v9))
      {
        if (_IDSShouldLog(0LL, @"IDSPersistentMap")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSPersistentMap",  @"Failed to purge stored key {removeError: %@}");
        }
      }
    }
  }

  else
  {
    uint64_t v10 = OSLogHandleForIDSCategory("IDSPersistentMap");
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Tried to purge before available -- returning {self: %@}",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v12)
      && _IDSShouldLog(0LL, @"IDSPersistentMap"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSPersistentMap",  @"Tried to purge before available -- returning {self: %@}");
    }
  }

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (IDSKeychainWrapper)keychainWrapper
{
  return self->_keychainWrapper;
}

- (void)setKeychainWrapper:(id)a3
{
}

- (IMSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
}

- (NSString)directory
{
  return self->_directory;
}

- (void)setDirectory:(id)a3
{
}

- (int64_t)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (void)setDataProtectionClass:(int64_t)a3
{
  self->_dataProtectionClass = a3;
}

- (void).cxx_destruct
{
}

@end
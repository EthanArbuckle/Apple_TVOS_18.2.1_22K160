@interface _LSDeviceIdentifierCache
- (BOOL)deviceUnlockedSinceBoot;
- (NSString)personaUniqueString;
- (OS_dispatch_queue)queue;
- (_LSDeviceIdentifierCache)initWithPersona:(id)a3;
- (id)allIdentifiersNotDispatched;
- (id)applyPerUserEntropyNotDispatched:(id)a3 type:(int64_t)a4;
- (id)deviceIdentifierVendorSeed;
- (id)extractUUIDForKey:(id)a3;
- (id)generateSomePerUserEntropyNotDispatched;
- (id)identifiersOfTypeNotDispatched:(int64_t)a3;
- (void)clearAllIdentifiersOfType:(int64_t)a3;
- (void)clearIdentifiersForUninstallationWithVendorName:(id)a3 bundleIdentifier:(id)a4;
- (void)generatePerUserEntropyIfNeededNotDispatched;
- (void)getIdentifierOfType:(int64_t)a3 vendorName:(id)a4 bundleIdentifier:(id)a5 completionHandler:(id)a6;
- (void)save;
@end

@implementation _LSDeviceIdentifierCache

- (_LSDeviceIdentifierCache)initWithPersona:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS____LSDeviceIdentifierCache;
  v6 = -[_LSDeviceIdentifierCache init](&v20, sel_init);
  v7 = v6;
  _LSAssertRunningInServer((uint64_t)"-[_LSDeviceIdentifierCache initWithPersona:]");
  if (v6)
  {
    objc_storeStrong((id *)&v6->_personaUniqueString, a3);
    identifiers = v6->_identifiers;
    v6->_identifiers = 0LL;

    advertiserIdentifier = v6->_advertiserIdentifier;
    v6->_advertiserIdentifier = 0LL;

    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.launchservices.deviceidentifiers", v10);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v11;

    if (v5 && [v5 length])
    {
      [(id)__LSDefaultsGetSharedInstance() identifiersFileURL];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 URLByDeletingPathExtension];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      [NSString stringWithFormat:@"%@.plist", v5];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = [v14 URLByAppendingPathExtension:v15];
      identifiersFileURL = v7->_identifiersFileURL;
      v7->_identifiersFileURL = (NSURL *)v16;
    }

    else
    {
      uint64_t v18 = [(id)__LSDefaultsGetSharedInstance() identifiersFileURL];
      v13 = v6->_identifiersFileURL;
      v6->_identifiersFileURL = (NSURL *)v18;
    }
  }

  return v7;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)getIdentifierOfType:(int64_t)a3 vendorName:(id)a4 bundleIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __94___LSDeviceIdentifierCache_getIdentifierOfType_vendorName_bundleIdentifier_completionHandler___block_invoke;
  block[3] = &unk_189D75C10;
  id v18 = v10;
  id v19 = v11;
  id v21 = v12;
  int64_t v22 = a3;
  objc_super v20 = self;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(queue, block);
}

- (void)clearIdentifiersForUninstallationWithVendorName:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __93___LSDeviceIdentifierCache_clearIdentifiersForUninstallationWithVendorName_bundleIdentifier___block_invoke;
  block[3] = &unk_189D74C48;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)clearAllIdentifiersOfType:(int64_t)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __54___LSDeviceIdentifierCache_clearAllIdentifiersOfType___block_invoke;
  v4[3] = &unk_189D72268;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)save
{
  queue = self->_queue;
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __32___LSDeviceIdentifierCache_save__block_invoke;
  v3[3] = &unk_189D741C8;
  v3[4] = self;
  _LSDispatchCoalescedAfterDelay((unsigned __int8 *)&self->_saveFlag, queue, v3, 3.0);
}

- (NSString)personaUniqueString
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void).cxx_destruct
{
}

- (BOOL)deviceUnlockedSinceBoot
{
  return (int)softLinkMKBDeviceUnlockedSinceBoot() > 0;
}

- (id)generateSomePerUserEntropyNotDispatched
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x18960BE08], 0x10uLL, bytes)) {
    return 0LL;
  }
  [MEMORY[0x189603F48] dataWithBytes:bytes length:16];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)generatePerUserEntropyIfNeededNotDispatched
{
  v22[3] = *MEMORY[0x1895F89C0];
  if (!self->_perUserEntropy && -[_LSDeviceIdentifierCache deviceUnlockedSinceBoot](self, "deviceUnlockedSinceBoot"))
  {
    if ([(id)__LSDefaultsGetSharedInstance() isInEducationMode])
    {
      _LSPerUserEntropyURL();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        [MEMORY[0x189603F48] dataWithContentsOfURL:v3];
        uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (v4)
        {
          id v5 = (void *)MEMORY[0x189607908];
          id v6 = (void *)MEMORY[0x189604010];
          uint64_t v7 = objc_opt_class();
          uint64_t v8 = objc_opt_class();
          objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
          id v9 = (void *)objc_claimAutoreleasedReturnValue();
          [v5 unarchivedObjectOfClasses:v9 fromData:v4 error:0];
          id v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
          perUserEntropy = self->_perUserEntropy;
          self->_perUserEntropy = v10;
        }

        if (!self->_perUserEntropy)
        {
          -[_LSDeviceIdentifierCache generateSomePerUserEntropyNotDispatched]( self,  "generateSomePerUserEntropyNotDispatched");
          id v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[_LSDeviceIdentifierCache generateSomePerUserEntropyNotDispatched]( self,  "generateSomePerUserEntropyNotDispatched");
          id v13 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v14 = -[_LSDeviceIdentifierCache generateSomePerUserEntropyNotDispatched]( self,  "generateSomePerUserEntropyNotDispatched");
          id v15 = (void *)v14;
          if (v12 && v14)
          {
            v21[0] = &unk_189DA8110;
            v21[1] = &unk_189DA8128;
            v22[0] = v12;
            v22[1] = v14;
            v21[2] = &unk_189DA8140;
            v22[2] = v13;
            [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:v21 count:3];
            id v16 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
            v17 = self->_perUserEntropy;
            self->_perUserEntropy = v16;

            -[_LSDeviceIdentifierCache save](self, "save");
          }

          else
          {
            _LSDefaultLog();
            id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( &dword_183E58000,  v19,  OS_LOG_TYPE_DEFAULT,  "Failed to get per-user entropy for device identifiers. Will only have per-device identifiers.",  buf,  2u);
            }
          }
        }
      }

      else
      {
        _LSDefaultLog();
        uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( &dword_183E58000,  v4,  OS_LOG_TYPE_DEFAULT,  "Failed to get per-user entropy URL for device identifiers. Will only have per-device identifiers.",  buf,  2u);
        }
      }
    }

    else
    {
      id v18 = self->_perUserEntropy;
      self->_perUserEntropy = (NSDictionary *)MEMORY[0x189604A60];
    }
  }

- (id)applyPerUserEntropyNotDispatched:(id)a3 type:(int64_t)a4
{
  v21[2] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  -[_LSDeviceIdentifierCache generatePerUserEntropyIfNeededNotDispatched]( self,  "generatePerUserEntropyIfNeededNotDispatched");
  if (v6)
  {
    perUserEntropy = self->_perUserEntropy;
    uint64_t v8 = v6;
    if (perUserEntropy)
    {
      [MEMORY[0x189607968] numberWithInteger:a4];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKeyedSubscript:](perUserEntropy, "objectForKeyedSubscript:", v9);
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = [v10 length];

      uint64_t v8 = v6;
      if (v11)
      {
        v21[0] = 0LL;
        v21[1] = 0LL;
        [v6 getUUIDBytes:v21];
        id v12 = (void *)MEMORY[0x189603FB8];
        id v13 = self->_perUserEntropy;
        [MEMORY[0x189607968] numberWithInteger:a4];
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v14);
        id v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "dataWithCapacity:", objc_msgSend(v15, "length") + 16);
        id v16 = (void *)objc_claimAutoreleasedReturnValue();

        uint64_t v8 = v6;
        if (v16)
        {
          [v16 appendBytes:v21 length:16];
          v17 = self->_perUserEntropy;
          [MEMORY[0x189607968] numberWithInteger:a4];
          id v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", v18);
          id v19 = (void *)objc_claimAutoreleasedReturnValue();
          [v16 appendData:v19];

          objc_msgSend(MEMORY[0x189607AB8], "_LS_UUIDWithData:digestType:", v16, 1);
          uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
    }
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (id)extractUUIDForKey:(id)a3
{
  id v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_identifiers, "objectForKeyedSubscript:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDString:v5];
    -[NSDictionary removeObjectForKey:](self->_identifiers, "removeObjectForKey:", v4);
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (id)allIdentifiersNotDispatched
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  if (!-[_LSDeviceIdentifierCache deviceUnlockedSinceBoot](self, "deviceUnlockedSinceBoot"))
  {
    _LSDefaultLog();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_183E58000,  v4,  OS_LOG_TYPE_DEFAULT,  "Identifiers file unavailable (not yet unlocked)",  buf,  2u);
    }

    v3 = 0LL;
    goto LABEL_26;
  }

  v3 = self->_identifiers;
  if (!v3)
  {
    id v4 = self->_identifiersFileURL;
    if (v4)
    {
      [MEMORY[0x189603F48] dataWithContentsOfURL:v4];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
LABEL_5:
        [MEMORY[0x1896079E8] propertyListWithData:v5 options:1 format:0 error:0];
        id v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        identifiers = self->_identifiers;
        self->_identifiers = v6;

        -[NSDictionary objectForKeyedSubscript:](self->_identifiers, "objectForKeyedSubscript:", @"LSVendors");
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v9 = v8 == 0LL;

        if (v9)
        {
          [MEMORY[0x189603FC8] dictionary];
          id v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKeyedSubscript:]( self->_identifiers,  "setObject:forKeyedSubscript:",  v10,  @"LSVendors");

          -[_LSDeviceIdentifierCache save](self, "save");
        }

        -[_LSDeviceIdentifierCache extractUUIDForKey:](self, "extractUUIDForKey:", @"LSAdvertiserIdentifier");
        uint64_t v11 = (NSUUID *)objc_claimAutoreleasedReturnValue();
        advertiserIdentifier = self->_advertiserIdentifier;
        self->_advertiserIdentifier = v11;

        -[_LSDeviceIdentifierCache extractUUIDForKey:](self, "extractUUIDForKey:", @"LSVendorSeed");
        id v13 = (NSUUID *)objc_claimAutoreleasedReturnValue();
        vendorIdentifierSeed = self->_vendorIdentifierSeed;
        self->_vendorIdentifierSeed = v13;

        goto LABEL_21;
      }

      id v15 = (void *)[objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:@"/var/db/lsd/com.apple.lsdidentifiers.plist" isDirectory:0];
      [MEMORY[0x1896078A8] defaultManager];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 path];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      char v18 = [v16 fileExistsAtPath:v17];

      if ((v18 & 1) != 0)
      {
        _LSDefaultLog();
        id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v33 = v15;
          _os_log_impl( &dword_183E58000,  v19,  OS_LOG_TYPE_DEFAULT,  "Identifiers file does not exist, attempting to read file from old location in %@",  buf,  0xCu);
        }

        uint64_t v20 = [MEMORY[0x189603F48] dataWithContentsOfURL:v15];
        id v5 = (void *)v20;
        if (!v20)
        {
          _LSDefaultLog();
          id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v33 = v15;
            _os_log_impl(&dword_183E58000, v21, OS_LOG_TYPE_DEFAULT, "Invalid data found at %@", buf, 0xCu);
          }
        }

        [MEMORY[0x1896078A8] defaultManager];
        int64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
        [v22 removeItemAtURL:v15 error:0];

        if (!v20) {
          goto LABEL_21;
        }
        goto LABEL_5;
      }
    }

- (id)identifiersOfTypeNotDispatched:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  -[_LSDeviceIdentifierCache allIdentifiersNotDispatched](self, "allIdentifiersNotDispatched");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = v4;
  if (!v4 || (unint64_t)(a3 - 1) < 2)
  {
LABEL_8:
    id v6 = 0LL;
    goto LABEL_9;
  }

  if (a3)
  {
    _LSDefaultLog();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = a3;
      _os_log_impl( &dword_183E58000,  v7,  OS_LOG_TYPE_DEFAULT,  "Failed to figure out string representation of identifier type %i",  (uint8_t *)v9,  8u);
    }

    goto LABEL_8;
  }

  [v4 objectForKeyedSubscript:@"LSVendors"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v6;
}

- (id)deviceIdentifierVendorSeed
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  vendorIdentifierSeed = self->_vendorIdentifierSeed;
  if (!vendorIdentifierSeed)
  {
    [MEMORY[0x189607AB8] UUID];
    id v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_vendorIdentifierSeed;
    self->_vendorIdentifierSeed = v4;

    _LSDefaultLog();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = self->_vendorIdentifierSeed;
      int v9 = 138412290;
      uint64_t v10 = v7;
      _os_log_impl(&dword_183E58000, v6, OS_LOG_TYPE_INFO, "Generated vendor seed %@", (uint8_t *)&v9, 0xCu);
    }

    -[_LSDeviceIdentifierCache save](self, "save");
    vendorIdentifierSeed = self->_vendorIdentifierSeed;
  }

  return vendorIdentifierSeed;
}

@end
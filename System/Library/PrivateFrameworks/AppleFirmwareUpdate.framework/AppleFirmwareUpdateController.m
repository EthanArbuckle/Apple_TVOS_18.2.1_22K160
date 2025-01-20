@interface AppleFirmwareUpdateController
- (AppleFirmwareUpdateController)initWithRegistryEntryID:(id)a3 fwAssetDirectory:(id)a4;
- (BOOL)createFWAssetInfo;
- (BOOL)createFWAssetInfoInternal;
- (BOOL)getEarlyBootList:(id)a3;
- (BOOL)getEarlyBootListInternal:(id)a3;
- (BOOL)isFWDownloadNeeded:(id)a3;
- (BOOL)registerForPendingEarlyBootAccessories;
- (BOOL)registerForPendingEarlyBootAccessoriesInternal;
- (BOOL)shouldSkipImage4Download;
- (NSArray)fdrClasses;
- (NSNumber)fwAssetSize;
- (NSNumber)fwAssetVersion;
- (NSNumber)img4Tag;
- (NSString)fwAssetFile;
- (NSString)fwAssetSignatureType;
- (id)extractFDRDataWithClassKey:(id)a3 error:(id *)a4;
- (id)findFWAssetFromTag:(id)a3 tag:(unsigned int)a4 size:(unint64_t *)a5;
- (id)getPendingEarlyBootAccessories;
- (id)updateFirmwareWithOptions:(id)a3;
- (id)updateFirmwareWithOptionsInternal:(id)a3;
- (int64_t)sendFDRData:(unsigned int)a3;
- (unsigned)getConnectionForRegistryID:(int64_t *)a3;
- (unsigned)getServiceForRegistryID:(int64_t *)a3;
- (void)dealloc;
- (void)earlyBootAccessoryAttached:(unsigned int)a3;
- (void)earlyBootAccessoryAttachedInternal:(unsigned int)a3;
- (void)enableEarlyBootLoggingMode;
- (void)readCriticalEarlyBootEntries;
- (void)setDelegate:(id)a3;
- (void)setFdrClasses:(id)a3;
- (void)setFwAssetFile:(id)a3;
- (void)setFwAssetSignatureType:(id)a3;
- (void)setFwAssetSize:(id)a3;
- (void)setFwAssetVersion:(id)a3;
- (void)setImg4Tag:(id)a3;
- (void)sortEarlyBootListWithLoadingGroup:(id)a3;
@end

@implementation AppleFirmwareUpdateController

- (AppleFirmwareUpdateController)initWithRegistryEntryID:(id)a3 fwAssetDirectory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___AppleFirmwareUpdateController;
  v9 = -[AppleFirmwareUpdateController init](&v19, sel_init);
  if (v9)
  {
    os_log_t v10 = os_log_create("com.apple.accessoryfirmwareupdate", "default");
    log = v9->_log;
    v9->_log = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    pendingCriticalEarlyBootEntriesInternal = v9->_pendingCriticalEarlyBootEntriesInternal;
    v9->_pendingCriticalEarlyBootEntriesInternal = v12;

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.appleFirmwareUpdate.delegateQueue", 0LL);
    delegateQueue = v9->_delegateQueue;
    v9->_delegateQueue = (OS_dispatch_queue *)v14;

    dispatch_queue_t v16 = dispatch_queue_create("com.apple.appleFirmwareUpdate.workQueue", 0LL);
    workQueue = v9->_workQueue;
    v9->_workQueue = (OS_dispatch_queue *)v16;

    objc_storeStrong((id *)&v9->_registryEntryID, a3);
    objc_storeStrong((id *)&v9->_fwAssetDirectory, a4);
  }

  return v9;
}

- (void)dealloc
{
  iokitNotifyPort = self->_iokitNotifyPort;
  if (iokitNotifyPort)
  {
    IONotificationPortDestroy(iokitNotifyPort);
    self->_iokitNotifyPort = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AppleFirmwareUpdateController;
  -[AppleFirmwareUpdateController dealloc](&v4, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __45__AppleFirmwareUpdateController_setDelegate___block_invoke;
  block[3] = &unk_18A24DE48;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)workQueue, block);
}

id __45__AppleFirmwareUpdateController_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 32LL), *(id *)(a1 + 40));
}

- (void)enableEarlyBootLoggingMode
{
}

- (BOOL)getEarlyBootList:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __50__AppleFirmwareUpdateController_getEarlyBootList___block_invoke;
  block[3] = &unk_18A24DE70;
  id v9 = v4;
  os_log_t v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)workQueue, block);
  LOBYTE(workQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)workQueue;
}

void __50__AppleFirmwareUpdateController_getEarlyBootList___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) getEarlyBootListInternal:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) sortEarlyBootListWithLoadingGroup:*(void *)(a1 + 40)];
  v2 = *(os_log_s **)(*(void *)(a1 + 32) + 8LL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v4 = 136315394;
    v5 = "-[AppleFirmwareUpdateController getEarlyBootList:]_block_invoke";
    __int16 v6 = 2112;
    uint64_t v7 = v3;
    _os_log_impl(&dword_188509000, v2, OS_LOG_TYPE_INFO, "%s: Ealyboot List: %@", (uint8_t *)&v4, 0x16u);
  }

- (void)sortEarlyBootListWithLoadingGroup:(id)a3
{
}

uint64_t __67__AppleFirmwareUpdateController_sortEarlyBootListWithLoadingGroup___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v4 objectForKeyedSubscript:@"LoadingGroup"],
        __int16 v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        (isKindOfClass & 1) != 0))
  {
    [v4 objectForKeyedSubscript:@"LoadingGroup"];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v8 = &unk_18A24F940;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v5 objectForKeyedSubscript:@"LoadingGroup"],
        id v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char v10 = objc_opt_isKindOfClass(),
        v9,
        (v10 & 1) != 0))
  {
    [v5 objectForKeyedSubscript:@"LoadingGroup"];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v11 = &unk_18A24F940;
  }

  uint64_t v12 = [v11 compare:v8];

  return v12;
}

- (BOOL)getEarlyBootListInternal:(id)a3
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v27 = a3;
  io_iterator_t existing = 0;
  FudLogSetMode(1LL);
  -[AppleFirmwareUpdateController readCriticalEarlyBootEntries](self, "readCriticalEarlyBootEntries");
  id v4 = IOServiceMatching("AppleFirmwareUpdateKext");
  if (v4 && !IOServiceGetMatchingServices(*MEMORY[0x1896086B0], v4, &existing))
  {
    uint64_t v5 = 0LL;
    __int16 v6 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    while (1)
    {
      io_registry_entry_t v7 = IOIteratorNext(existing);
      if (!v7)
      {
LABEL_23:
        if (v5) {
          goto LABEL_24;
        }
        goto LABEL_27;
      }

      io_registry_entry_t v14 = v7;
      uint64_t entryID = 0LL;
      if (IORegistryEntryGetRegistryEntryID(v7, &entryID)) {
        break;
      }
      [MEMORY[0x189603FC8] dictionaryWithCapacity:0];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        dispatch_queue_t v16 = 0LL;
LABEL_22:
        char v23 = 0;
        uint64_t v5 = 14LL;
        goto LABEL_18;
      }

      [MEMORY[0x189603FC8] dictionaryWithCapacity:0];
      dispatch_queue_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16) {
        goto LABEL_22;
      }
      [v15 setObject:@"com.apple.mau.plugin.generickext" forKeyedSubscript:@"DeviceClassName"];
      [MEMORY[0x189607968] numberWithUnsignedLongLong:entryID];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 setObject:v17 forKeyedSubscript:@"IOMatchLaunchServiceID"];

      [v15 setObject:v16 forKey:@"OptionsDict"];
      CFProperty = (void *)IORegistryEntryCreateCFProperty(v14, @"Image Tag", v6, 0);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0) {
        -[NSMutableArray removeObject:](self->_pendingCriticalEarlyBootEntriesInternal, "removeObject:", CFProperty);
      }
      objc_super v19 = (void *)IORegistryEntryCreateCFProperty(v14, @"LoadingGroup", v6, 0);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = v15;
        v21 = v19;
      }

      else
      {
        v20 = v15;
        v21 = &unk_18A24F940;
      }

      [v20 setObject:v21 forKeyedSubscript:@"LoadingGroup"];
      [v27 addObject:v15];
      if (v5 == 1) {
        goto LABEL_14;
      }
LABEL_17:
      IOObjectRelease(v14);

      char v23 = 1;
LABEL_18:

      if ((v23 & 1) == 0) {
        goto LABEL_23;
      }
    }

    objc_super v19 = 0LL;
    CFProperty = 0LL;
    v15 = 0LL;
    dispatch_queue_t v16 = 0LL;
LABEL_14:
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "-[AppleFirmwareUpdateController getEarlyBootListInternal:]";
      __int16 v32 = 1024;
      LODWORD(v33) = v14;
      _os_log_impl(&dword_188509000, log, OS_LOG_TYPE_INFO, "%s: registry entry not found for service=%d", buf, 0x12u);
    }

    uint64_t v5 = 1LL;
    goto LABEL_17;
  }

  uint64_t v5 = 13LL;
LABEL_24:
  v24 = self->_log;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = errorString[v5];
    *(_DWORD *)buf = 136315650;
    v31 = "-[AppleFirmwareUpdateController getEarlyBootListInternal:]";
    __int16 v32 = 2112;
    v33 = v25;
    __int16 v34 = 2048;
    uint64_t v35 = v5;
    _os_log_impl(&dword_188509000, v24, OS_LOG_TYPE_INFO, "%s: Error:%@ code=0x%0lx", buf, 0x20u);
  }

  [v27 removeAllObjects];
LABEL_27:
  FudLog( 7,  (uint64_t)@"%s: Pending critical earlyBoot entries %@",  v8,  v9,  v10,  v11,  v12,  v13,  (uint64_t)"-[AppleFirmwareUpdateController getEarlyBootListInternal:]");

  return 0;
}

- (BOOL)registerForPendingEarlyBootAccessories
{
  uint64_t v6 = 0LL;
  io_registry_entry_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __71__AppleFirmwareUpdateController_registerForPendingEarlyBootAccessories__block_invoke;
  v5[3] = &unk_18A24DED8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)workQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __71__AppleFirmwareUpdateController_registerForPendingEarlyBootAccessories__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) registerForPendingEarlyBootAccessoriesInternal];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

- (BOOL)registerForPendingEarlyBootAccessoriesInternal
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  uint64_t v3 = -[NSMutableArray count](self->_pendingCriticalEarlyBootEntriesInternal, "count");
  if (v3)
  {
    uint64_t v20 = v3;
    if (!self->_iokitNotifyPort) {
      self->_iokitNotifyPort = IONotificationPortCreate(*MEMORY[0x1896086B0]);
    }
    io_iterator_t notification = 0;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    obj = self->_pendingCriticalEarlyBootEntriesInternal;
    uint64_t v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v22,  v29,  16LL);
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v23;
      do
      {
        for (uint64_t i = 0LL; i != v5; ++i)
        {
          if (*(void *)v23 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          CFMutableDictionaryRef v9 = IOServiceMatching("AppleFirmwareUpdateKext");
          id v27 = @"Image Tag";
          uint64_t v28 = v8;
          [MEMORY[0x189603F68] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFDictionary setObject:forKey:](v9, "setObject:forKey:", v10, @"IOPropertyMatch");

          iokitNotifyPort = self->_iokitNotifyPort;
          uint64_t v12 = v9;
          if (IOServiceAddMatchingNotification( iokitNotifyPort,  "IOServiceMatched",  v12,  (IOServiceMatchingCallback)serviceRegistered,  self,  &notification))
          {
            FudLog( 7,  (uint64_t)@"%s: Failed to registered for tag %@",  v13,  v14,  v15,  v16,  v17,  v18,  (uint64_t)"-[AppleFirmwareUpdateController registerForPendingEarlyBootAccessoriesInternal]");
          }

          else
          {
            FudLog( 7,  (uint64_t)@"%s: Registered for tag %@",  v13,  v14,  v15,  v16,  v17,  v18,  (uint64_t)"-[AppleFirmwareUpdateController registerForPendingEarlyBootAccessoriesInternal]");
            if (notification)
            {
              -[AppleFirmwareUpdateController earlyBootAccessoryAttachedInternal:]( self,  "earlyBootAccessoryAttachedInternal:");
              IOObjectRelease(notification);
            }
          }
        }

        uint64_t v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v22,  v29,  16LL);
      }

      while (v5);
    }

    uint64_t v3 = v20;
  }

  return v3 != 0;
}

- (void)earlyBootAccessoryAttached:(unsigned int)a3
{
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __60__AppleFirmwareUpdateController_earlyBootAccessoryAttached___block_invoke;
  v4[3] = &unk_18A24DF00;
  v4[4] = self;
  unsigned int v5 = a3;
  dispatch_async((dispatch_queue_t)workQueue, v4);
}

uint64_t __60__AppleFirmwareUpdateController_earlyBootAccessoryAttached___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) earlyBootAccessoryAttachedInternal:*(unsigned int *)(a1 + 40)];
}

- (void)earlyBootAccessoryAttachedInternal:(unsigned int)a3
{
  io_object_t v10 = IOIteratorNext(a3);
  if (v10)
  {
    io_object_t v11 = v10;
    uint64_t v12 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    do
    {
      uint64_t entryID = 0LL;
      if (IORegistryEntryGetRegistryEntryID(v11, &entryID))
      {
        IOObjectRelease(v11);
      }

      else
      {
        [MEMORY[0x189603FC8] dictionary];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        [MEMORY[0x189603FC8] dictionary];
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 setObject:@"com.apple.mau.plugin.generickext" forKey:@"DeviceClassName"];
        [MEMORY[0x189607968] numberWithUnsignedLongLong:entryID];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 setObject:v15 forKey:@"IOMatchLaunchServiceID"];

        [v13 setObject:v14 forKey:@"OptionsDict"];
        CFProperty = (void *)IORegistryEntryCreateCFProperty(v11, @"Image Tag", v12, 0);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0) {
          -[NSMutableArray removeObject:](self->_pendingCriticalEarlyBootEntriesInternal, "removeObject:", CFProperty);
        }
        delegateQueue = self->_delegateQueue;
        block[0] = MEMORY[0x1895F87A8];
        block[1] = 3221225472LL;
        block[2] = __68__AppleFirmwareUpdateController_earlyBootAccessoryAttachedInternal___block_invoke;
        block[3] = &unk_18A24DE48;
        block[4] = self;
        id v20 = v13;
        id v18 = v13;
        dispatch_async((dispatch_queue_t)delegateQueue, block);
        IOObjectRelease(v11);
      }

      io_object_t v11 = IOIteratorNext(a3);
    }

    while (v11);
  }

  if (!-[NSMutableArray count](self->_pendingCriticalEarlyBootEntriesInternal, "count"))
  {
    IONotificationPortDestroy(self->_iokitNotifyPort);
    self->_iokitNotifyPort = 0LL;
  }

void __68__AppleFirmwareUpdateController_earlyBootAccessoryAttachedInternal___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32LL));
  [WeakRetained earlyBootAccessoryAttached:*(void *)(a1 + 40)];
}

- (void)readCriticalEarlyBootEntries
{
  io_iterator_t iterator = 0;
  if (!IORegistryCreateIterator(0, "IODeviceTree", 1u, &iterator))
  {
    io_object_t v3 = IOIteratorNext(iterator);
    if (v3)
    {
      io_registry_entry_t v4 = v3;
      uint64_t v5 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      do
      {
        CFProperty = (void *)IORegistryEntryCreateCFProperty(v4, @"aud-early-boot-critical", v5, 0);
        if (CFProperty)
        {
          uint64_t v7 = (void *)IORegistryEntryCreateCFProperty(v4, @"image-tag", v5, 0);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 length] == 4)
          {
            unsigned int v16 = 0;
            [v7 getBytes:&v16 length:4];
            FudLog( 7,  (uint64_t)@"%s: Critical earlyBoot entry: imageTag %u",  v8,  v9,  v10,  v11,  v12,  v13,  (uint64_t)"-[AppleFirmwareUpdateController readCriticalEarlyBootEntries]");
            pendingCriticalEarlyBootEntriesInternal = self->_pendingCriticalEarlyBootEntriesInternal;
            [MEMORY[0x189607968] numberWithUnsignedInt:v16];
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray addObject:](pendingCriticalEarlyBootEntriesInternal, "addObject:", v15);
          }
        }

        IOObjectRelease(v4);

        io_registry_entry_t v4 = IOIteratorNext(iterator);
      }

      while (v4);
    }

    IOObjectRelease(iterator);
  }

- (id)getPendingEarlyBootAccessories
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = __Block_byref_object_copy_;
  uint64_t v10 = __Block_byref_object_dispose_;
  id v11 = 0LL;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __63__AppleFirmwareUpdateController_getPendingEarlyBootAccessories__block_invoke;
  v5[3] = &unk_18A24DED8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)workQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __63__AppleFirmwareUpdateController_getPendingEarlyBootAccessories__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x189603F18] arrayWithArray:*(void *)(*(void *)(a1 + 32) + 24)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  io_registry_entry_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)createFWAssetInfo
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __50__AppleFirmwareUpdateController_createFWAssetInfo__block_invoke;
  v5[3] = &unk_18A24DED8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)workQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__AppleFirmwareUpdateController_createFWAssetInfo__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) createFWAssetInfoInternal];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

- (BOOL)createFWAssetInfoInternal
{
  uint64_t v2 = self;
  uint64_t v74 = *MEMORY[0x1895F89C0];
  uint64_t v59 = 0LL;
  uint64_t v60 = 0LL;
  fwAssetDirectory = self->_fwAssetDirectory;
  if (fwAssetDirectory)
  {
    io_registry_entry_t v4 = fwAssetDirectory;
    id v5 = 0LL;
    uint64_t v6 = 0LL;
  }

  else
  {
    [MEMORY[0x189610B70] sharedDataAccessor];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v58 = 0LL;
    uint64_t v6 = (void *)[v7 copyPathForPersonalizedData:0 error:&v58];
    id v5 = v58;

    log = v2->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v62 = v6;
      _os_log_impl(&dword_188509000, log, OS_LOG_TYPE_DEFAULT, "personalizedDataPath: %@", buf, 0xCu);
    }

    if (!v6)
    {
      CFProperty = 0LL;
      BOOL v24 = 0;
      io_registry_entry_t v4 = 0LL;
      goto LABEL_34;
    }

    [NSString stringWithFormat:@"%@/%@", v6, @"FUD"];
    io_registry_entry_t v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }

  char v9 = v2->_log;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v62 = v4;
    _os_log_impl(&dword_188509000, v9, OS_LOG_TYPE_DEFAULT, "Firmware directory path: %@", buf, 0xCu);
  }

  io_registry_entry_t v10 = -[AppleFirmwareUpdateController getServiceForRegistryID:](v2, "getServiceForRegistryID:", &v60);
  if (!v10)
  {
    CFProperty = 0LL;
    goto LABEL_41;
  }

  io_registry_entry_t v11 = v10;
  uint64_t v12 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFProperty = (void *)IORegistryEntryCreateCFProperty( v10,  @"FDR Classes",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    io_registry_entry_t v49 = v11;
    v51 = v4;
    id v52 = v5;
    v53 = v6;
    v50 = CFProperty;
    -[AppleFirmwareUpdateController setFdrClasses:](v2, "setFdrClasses:", CFProperty);
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    uint64_t v14 = v2;
    -[AppleFirmwareUpdateController fdrClasses](v2, "fdrClasses");
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [v15 countByEnumeratingWithState:&v54 objects:v73 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v55;
      while (2)
      {
        for (uint64_t i = 0LL; i != v17; ++i)
        {
          if (*(void *)v55 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v54 + 1) + 8 * i);
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          __int128 v22 = v14->_log;
          BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
          if ((isKindOfClass & 1) == 0)
          {
            if (v23)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_188509000, v22, OS_LOG_TYPE_INFO, "Invalid FDR class in registry entry", buf, 2u);
            }

            BOOL v24 = 0;
            id v5 = v52;
            uint64_t v6 = v53;
            CFProperty = v50;
            io_registry_entry_t v4 = v51;
            goto LABEL_34;
          }

          if (v23)
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v62 = v20;
            _os_log_impl(&dword_188509000, v22, OS_LOG_TYPE_INFO, "FDR class from registry entry='%@'", buf, 0xCu);
          }
        }

        uint64_t v17 = [v15 countByEnumeratingWithState:&v54 objects:v73 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }

    id v5 = v52;
    uint64_t v6 = v53;
    CFProperty = v50;
    io_registry_entry_t v4 = v51;
    uint64_t v2 = v14;
    io_registry_entry_t v11 = v49;
  }

  if (-[AppleFirmwareUpdateController shouldSkipImage4Download](v2, "shouldSkipImage4Download"))
  {
    BOOL v24 = 1;
    goto LABEL_34;
  }

  __int128 v25 = (void *)IORegistryEntryCreateCFProperty(v11, @"Image Tag", v12, 0);
  -[AppleFirmwareUpdateController setImg4Tag:](v2, "setImg4Tag:", v25);
  v26 = -[AppleFirmwareUpdateController img4Tag](v2, "img4Tag");
  if (!v26)
  {
LABEL_41:
    BOOL v24 = 0;
    goto LABEL_34;
  }

  -[AppleFirmwareUpdateController img4Tag](v2, "img4Tag");
  id v27 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v28 = [v27 unsignedIntValue];

  if (!(_DWORD)v28)
  {
    v45 = v2->_log;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v46 = "Zero tag value in registry entry";
      v47 = v45;
      uint32_t v48 = 2;
LABEL_40:
      _os_log_impl(&dword_188509000, v47, OS_LOG_TYPE_INFO, v46, buf, v48);
      goto LABEL_41;
    }

    goto LABEL_41;
  }
  v29 = -[AppleFirmwareUpdateController findFWAssetFromTag:tag:size:](v2, "findFWAssetFromTag:tag:size:", v4, v28, &v59);
  -[AppleFirmwareUpdateController setFwAssetFile:](v2, "setFwAssetFile:", v29);

  -[AppleFirmwareUpdateController fwAssetFile](v2, "fwAssetFile");
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = v2->_log;
  if (!v30)
  {
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v62 = v28;
      v46 = "FW asset for tag=0x%0x not found";
      v47 = v31;
      uint32_t v48 = 8;
      goto LABEL_40;
    }

    goto LABEL_41;
  }

  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v32 = v31;
    v33 = -[AppleFirmwareUpdateController fwAssetFile](v2, "fwAssetFile");
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v62 = v28;
    *(_WORD *)&v62[4] = 2112;
    *(void *)&v62[6] = v33;
    *(_WORD *)&v62[14] = 2048;
    *(void *)&v62[16] = v59;
    _os_log_impl(&dword_188509000, v32, OS_LOG_TYPE_DEFAULT, "Found FW file for tag=0x%0x - %@ [size=%zu]", buf, 0x1Cu);
  }

  [MEMORY[0x189607968] numberWithUnsignedLongLong:v59];
  __int16 v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppleFirmwareUpdateController setFwAssetSize:](v2, "setFwAssetSize:", v34);

  -[AppleFirmwareUpdateController setFwAssetSignatureType:](v2, "setFwAssetSignatureType:", @"IMG4");
  [MEMORY[0x189607968] numberWithLongLong:0];
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppleFirmwareUpdateController setFwAssetVersion:](v2, "setFwAssetVersion:", v35);

  uint64_t v36 = v2->_log;
  BOOL v24 = 1;
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    fwAssetSize = v2->_fwAssetSize;
    img4Tag = v2->_img4Tag;
    registryEntryID = v2->_registryEntryID;
    v40 = v2->_fwAssetDirectory;
    fwAssetFile = v2->_fwAssetFile;
    fwAssetSignatureType = v2->_fwAssetSignatureType;
    fwAssetVersion = v2->_fwAssetVersion;
    *(_DWORD *)buf = 136316930;
    *(void *)v62 = "-[AppleFirmwareUpdateController createFWAssetInfoInternal]";
    *(_WORD *)&v62[8] = 2112;
    *(void *)&v62[10] = registryEntryID;
    *(_WORD *)&v62[18] = 2112;
    *(void *)&v62[20] = img4Tag;
    __int16 v63 = 2112;
    v64 = v40;
    __int16 v65 = 2112;
    v66 = fwAssetFile;
    __int16 v67 = 2112;
    v68 = fwAssetSignatureType;
    __int16 v69 = 2112;
    v70 = fwAssetVersion;
    __int16 v71 = 2112;
    v72 = fwAssetSize;
    _os_log_impl( &dword_188509000,  v36,  OS_LOG_TYPE_INFO,  "%s:\n registryID=%@\n fwTag=%@ fwDirectory=%@ fwFile=%@\n fwSignType=%@\n fwVersion=%@\n fwSize=%@",  buf,  0x52u);
  }

- (unsigned)getServiceForRegistryID:(int64_t *)a3
{
  kern_return_t v7;
  CFMutableDictionaryRef v8;
  BOOL v9;
  CFMutableDictionaryRef properties;
  properties = 0LL;
  *a3 = 0LL;
  io_registry_entry_t v4 = IORegistryEntryIDMatching(-[NSNumber unsignedLongLongValue](self->_registryEntryID, "unsignedLongLongValue"));
  if (v4 && (io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x1896086B0], v4)) != 0)
  {
    unsigned int v6 = MatchingService;
    uint64_t v7 = IORegistryEntryCreateCFProperties(MatchingService, &properties, (CFAllocatorRef)*MEMORY[0x189604DB0], 0);
    uint64_t v8 = properties;
    if (v7) {
      char v9 = 1;
    }
    else {
      char v9 = properties == 0LL;
    }
    if (!v9 || (*a3 = 2LL, v8)) {
      CFRelease(v8);
    }
  }

  else
  {
    unsigned int v6 = 0;
    *a3 = 2LL;
  }

  return v6;
}

- (id)updateFirmwareWithOptions:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  id v17 = 0LL;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __59__AppleFirmwareUpdateController_updateFirmwareWithOptions___block_invoke;
  block[3] = &unk_18A24DE70;
  id v10 = v4;
  io_registry_entry_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)workQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __59__AppleFirmwareUpdateController_updateFirmwareWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) updateFirmwareWithOptionsInternal:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)updateFirmwareWithOptionsInternal:(id)a3
{
  uint64_t v52 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (!self->_registryEntryID)
  {
    uint64_t v36 = 1LL;
    goto LABEL_33;
  }

  if (-[AppleFirmwareUpdateController shouldSkipImage4Download](self, "shouldSkipImage4Download")) {
    goto LABEL_9;
  }
  -[AppleFirmwareUpdateController fwAssetFile](self, "fwAssetFile");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    uint64_t v36 = 6LL;
    goto LABEL_33;
  }

  -[AppleFirmwareUpdateController fwAssetVersion](self, "fwAssetVersion");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 unsignedIntegerValue];

  if (v7)
  {
    uint64_t v36 = 5LL;
    goto LABEL_33;
  }

  -[AppleFirmwareUpdateController fwAssetSize](self, "fwAssetSize");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 unsignedLongLongValue];

  if (!v9)
  {
    uint64_t v36 = 7LL;
    goto LABEL_33;
  }

  -[AppleFirmwareUpdateController fwAssetSignatureType](self, "fwAssetSignatureType");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v10 isEqualToString:@"IMG4"])
  {

    goto LABEL_9;
  }

  -[AppleFirmwareUpdateController fwAssetSignatureType](self, "fwAssetSignatureType");
  io_registry_entry_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  char v12 = [v11 isEqualToString:@"NONE"];

  if ((v12 & 1) == 0)
  {
    uint64_t v36 = 4LL;
LABEL_33:
    uint64_t v37 = v36;
    goto LABEL_22;
  }

- (BOOL)isFWDownloadNeeded:(id)a3
{
  io_registry_entry_t v4 = -[AppleFirmwareUpdateController getServiceForRegistryID:](self, "getServiceForRegistryID:", v10);
  if (!v4) {
    return 1;
  }
  CFProperty = (void *)IORegistryEntryCreateCFProperty( v4,  @"Need FUD Download",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    char v6 = [CFProperty BOOLValue];
  }

  else
  {
    log = self->_log;
    char v6 = 1;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_188509000, log, OS_LOG_TYPE_INFO, "download needed property not in registry entry", v9, 2u);
    }
  }

  return v6;
}

- (BOOL)shouldSkipImage4Download
{
  io_registry_entry_t v2 = -[AppleFirmwareUpdateController getServiceForRegistryID:](self, "getServiceForRegistryID:", v9);
  if (!v2) {
    return 0;
  }
  io_object_t v3 = v2;
  CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty( v2,  @"skip-image-loading",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  if (CFProperty)
  {
    id v5 = CFProperty;
    CFTypeID v6 = CFGetTypeID(CFProperty);
    BOOL v7 = v6 == CFBooleanGetTypeID() && CFBooleanGetValue(v5) != 0;
    CFRelease(v5);
  }

  else
  {
    BOOL v7 = 0;
  }

  IOObjectRelease(v3);
  return v7;
}

- (unsigned)getConnectionForRegistryID:(int64_t *)a3
{
  io_connect_t connect = 0;
  *a3 = 0LL;
  unsigned int result = -[AppleFirmwareUpdateController getServiceForRegistryID:](self, "getServiceForRegistryID:");
  if (result)
  {
    io_object_t v5 = result;
    if (IOServiceOpen(result, *MEMORY[0x1895FBBE0], 0, &connect)) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = connect == 0;
    }
    if (v6) {
      *a3 = 3LL;
    }
    IOObjectRelease(v5);
    return connect;
  }

  return result;
}

- (id)findFWAssetFromTag:(id)a3 tag:(unsigned int)a4 size:(unint64_t *)a5
{
  uint64_t v59 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  [MEMORY[0x1896078A8] defaultManager];
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v51 = 0LL;
  [v7 contentsOfDirectoryAtPath:v6 error:&v51];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v51;
  if (!v8)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int128 v54 = 0;
      _os_log_impl(&dword_188509000, log, OS_LOG_TYPE_INFO, "No asset files found", v54, 2u);
    }

    uint64_t v30 = 0LL;
    v29 = 0LL;
    goto LABEL_36;
  }

  __int16 v34 = v8;
  uint64_t v35 = v7;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id obj = v8;
  uint64_t v43 = [obj countByEnumeratingWithState:&v47 objects:v58 count:16];
  if (!v43)
  {
    v38 = v9;
    id v39 = 0LL;
    goto LABEL_35;
  }

  v33 = a5;
  id v39 = 0LL;
  uint64_t v10 = *(void *)v48;
  unint64_t v11 = 0x189607000uLL;
  v38 = v9;
  uint64_t v40 = *(void *)v48;
  while (2)
  {
    uint64_t v12 = 0LL;
    do
    {
      if (*(void *)v48 != v10) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void *)(*((void *)&v47 + 1) + 8 * v12);
      mach_port_t v14 = (void *)MEMORY[0x1895C83AC]();
      [v6 stringByAppendingPathComponent:v13];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(v11 + 2200) fileHandleForReadingAtPath:v15];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      id v46 = 0LL;
      [v16 readDataUpToLength:64 error:&v46];
      int v17 = (void *)objc_claimAutoreleasedReturnValue();
      id v18 = v46;
      [v16 closeFile];
      if (v17 && [v17 length] == 64)
      {
        id v19 = v6;
        id v20 = v17;
        if (Img4DecodeParseLengthFromBuffer([v20 bytes], objc_msgSend(v20, "length"), buf))
        {
          v21 = self->_log;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__int128 v54 = 138543362;
            __int128 v55 = v15;
            _os_log_error_impl( &dword_188509000,  v21,  OS_LOG_TYPE_ERROR,  "Failed decoding check for %{public}@",  v54,  0xCu);
          }
        }

        else
        {
          id v45 = v38;
          [MEMORY[0x189603F48] dataWithContentsOfFile:v15 options:1 error:&v45];
          BOOL v23 = (void *)objc_claimAutoreleasedReturnValue();
          id v37 = v45;

          if (v23)
          {
            int v17 = v20;
            id v39 = v23;
            Img4DecodeInit([v39 bytes], objc_msgSend(v39, "length"), (uint64_t)v54);
            if (!v24)
            {
              id v6 = v19;
              if (Img4DecodeGetPayloadType((uint64_t)v54, &v44))
              {
                id v27 = self->_log;
                uint64_t v10 = v40;
                if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v53 = v15;
                  _os_log_impl(&dword_188509000, v27, OS_LOG_TYPE_INFO, "IMG4 get tag failed - %@", buf, 0xCu);
                }
              }

              else
              {
                uint64_t v10 = v40;
                if (v44 == a4)
                {
                  uint64_t v30 = v39;
                  if (v33) {
                    unint64_t *v33 = [v39 length];
                  }
                  v29 = (void *)objc_msgSend(v15, "copy", v33);

                  objc_autoreleasePoolPop(v14);
                  uint64_t v8 = v34;
                  BOOL v7 = v35;
                  id v9 = v37;
                  goto LABEL_36;
                }
              }

              v38 = v37;
              goto LABEL_14;
            }

            __int128 v25 = self->_log;
            id v6 = v19;
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v53 = v15;
              _os_log_impl(&dword_188509000, v25, OS_LOG_TYPE_INFO, "IMG4 decode init failed - %@", buf, 0xCu);
            }

            v38 = v37;
LABEL_13:
            uint64_t v10 = v40;
LABEL_14:
            unint64_t v11 = 0x189607000LL;
            goto LABEL_17;
          }

          v26 = self->_log;
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__int128 v54 = 138543618;
            __int128 v55 = v15;
            __int16 v56 = 2114;
            id v57 = v37;
            _os_log_error_impl( &dword_188509000,  v26,  OS_LOG_TYPE_ERROR,  "Failed to read %{public}@ with error %{public}@ ",  v54,  0x16u);
          }

          v38 = v37;
          id v39 = 0LL;
        }

        id v6 = v19;
        goto LABEL_13;
      }

      __int128 v22 = self->_log;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 v54 = 138543618;
        __int128 v55 = v15;
        __int16 v56 = 2114;
        id v57 = v18;
        _os_log_error_impl( &dword_188509000,  v22,  OS_LOG_TYPE_ERROR,  "Failed to read file %{public}@ with error %{public}@",  v54,  0x16u);
      }

- (int64_t)sendFDRData:(unsigned int)a3
{
  kern_return_t v17;
  OS_os_log *log;
  os_log_s *v19;
  int v20;
  int64_t v21;
  kern_return_t v22;
  OS_os_log *v23;
  __int128 v25;
  AppleFirmwareUpdateController *v26;
  uint64_t v28;
  id obj;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[4];
  void *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  kern_return_t v40;
  _BYTE buf[24];
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;
  int v44 = *MEMORY[0x1895F89C0];
  MEMORY[0x1895C8100](fdrLogHandler, a2);
  v33 = 0u;
  __int16 v34 = 0u;
  v31 = 0u;
  __int16 v32 = 0u;
  -[AppleFirmwareUpdateController fdrClasses](self, "fdrClasses");
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v32;
    __int128 v25 = 0x8400302uLL;
    v26 = self;
    while (2)
    {
      uint64_t v7 = 0LL;
      uint64_t v28 = v5;
      do
      {
        if (*(void *)v32 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v31 + 1) + 8 * v7);
        uint64_t v30 = 0LL;
        -[AppleFirmwareUpdateController extractFDRDataWithClassKey:error:]( self,  "extractFDRDataWithClassKey:error:",  v8,  &v30,  v25);
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        id v10 = v30;
        unint64_t v11 = v10;
        if (v9) {
          BOOL v12 = v10 == 0LL;
        }
        else {
          BOOL v12 = 0;
        }
        if (v12)
        {
          [v8 dataUsingEncoding:4];
          mach_port_t v14 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v15 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FB8]),  "initWithCapacity:",  objc_msgSend(v9, "length") + objc_msgSend(v8, "length"));
          [v15 appendData:v14];
          [v15 appendData:v9];
          id v16 = v15;
          *(void *)buf = [v16 bytes];
          *(void *)&buf[8] = [v16 length];
          *(void *)&buf[16] = [v14 length];
          __int16 v42 = xmmword_1885137A0;
          int v17 = IOConnectCallScalarMethod(a3, 1u, (const uint64_t *)buf, 5u, 0LL, 0LL);
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
          {
            id v19 = log;
            id v20 = [v9 length];
            *(_DWORD *)uint64_t v35 = v25;
            uint64_t v36 = v8;
            id v37 = 1024;
            v38 = v20;
            id v39 = 1024;
            uint64_t v40 = v17;
            _os_log_impl(&dword_188509000, v19, OS_LOG_TYPE_INFO, "LoadFDR class='%@' with %u bytes ret=%d", v35, 0x18u);
          }

          uint64_t v5 = v28;
          self = v26;
          if (v17 == 1)
          {

            v21 = 16LL;
            goto LABEL_18;
          }
        }

        else
        {
          uint64_t v13 = self->_log;
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v8;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v11;
            _os_log_impl(&dword_188509000, v13, OS_LOG_TYPE_INFO, "Cannot find FDR data for class '%@': %@", buf, 0x16u);
          }
        }

        ++v7;
      }

      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v31 objects:v43 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  v21 = 0LL;
LABEL_18:

  __int128 v22 = IOConnectCallScalarMethod(a3, 2u, 0LL, 0, 0LL, 0LL);
  BOOL v23 = self->_log;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v22;
    _os_log_impl(&dword_188509000, v23, OS_LOG_TYPE_INFO, "LoadFDRDataComplete ret=%d", buf, 8u);
  }

  return v21;
}

- (id)extractFDRDataWithClassKey:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  if (v6)
  {
    mach_port_t v14 = @"CopyAllowUnsealed";
    v15[0] = MEMORY[0x189604A88];
    [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v6 containsString:@"/"])
    {
      [v6 componentsSeparatedByString:@"/"];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v8 count] == 2)
      {
        [v8 objectAtIndexedSubscript:0];

        uint64_t v9 = AMFDRSealingMapCopyLocalDictForClass();
        if (v9)
        {
          id v10 = (const __CFDictionary *)v9;
          [v8 objectAtIndexedSubscript:1];
          unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

          Value = (void *)CFDictionaryGetValue(v10, v11);
          if (!a4) {
            goto LABEL_15;
          }
          goto LABEL_9;
        }

        if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
          -[AppleFirmwareUpdateController extractFDRDataWithClassKey:error:].cold.1();
        }
      }

      else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
      {
        -[AppleFirmwareUpdateController extractFDRDataWithClassKey:error:].cold.2();
      }

      Value = 0LL;
      goto LABEL_15;
    }

    Value = (void *)AMFDRSealingMapCopyLocalDataForClass();
    if (!a4)
    {
LABEL_15:

      goto LABEL_16;
    }

- (NSString)fwAssetFile
{
  return self->_fwAssetFile;
}

- (void)setFwAssetFile:(id)a3
{
}

- (NSString)fwAssetSignatureType
{
  return self->_fwAssetSignatureType;
}

- (void)setFwAssetSignatureType:(id)a3
{
}

- (NSNumber)fwAssetVersion
{
  return self->_fwAssetVersion;
}

- (void)setFwAssetVersion:(id)a3
{
}

- (NSNumber)fwAssetSize
{
  return self->_fwAssetSize;
}

- (void)setFwAssetSize:(id)a3
{
}

- (NSNumber)img4Tag
{
  return self->_img4Tag;
}

- (void)setImg4Tag:(id)a3
{
}

- (NSArray)fdrClasses
{
  return self->_fdrClasses;
}

- (void)setFdrClasses:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)extractFDRDataWithClassKey:error:.cold.1()
{
}

- (void)extractFDRDataWithClassKey:error:.cold.2()
{
}

@end
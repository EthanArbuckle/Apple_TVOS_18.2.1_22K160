@interface SKManager
+ (BOOL)isMountPointWithPath:(id)a3;
+ (id)BSDNameFromString:(id)a3;
+ (id)defaultVisibleRoles;
+ (id)sharedManager;
+ (id)sharedManagerWithBindingsSafety:(BOOL)a3;
+ (id)syncSharedManager;
- (BOOL)isBusy;
- (NSSet)visibleRoles;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)frameworkAsyncOperationsQueue;
- (SKManager)initWithBindingSafety:(BOOL)a3;
- (id)_diskForPath:(id)a3;
- (id)_diskForString:(id)a3;
- (id)allDisks;
- (id)allDisksSet;
- (id)childDisksForWholeDisk:(id)a3;
- (id)contentDiskWithDisk:(id)a3;
- (id)diskForBSDname:(id)a3;
- (id)diskForPath:(id)a3;
- (id)diskForString:(id)a3;
- (id)diskForUUID:(id)a3;
- (id)diskForVolumeName:(id)a3;
- (id)filesystemWithSKType:(id)a3 isCaseSensitive:(BOOL)a4 isEncrypted:(BOOL)a5;
- (id)filesystems;
- (id)formatableFileSystems;
- (id)knownDiskForDictionary:(id)a3;
- (id)knownDiskForDictionary:(id)a3 waitingForDaemon:(BOOL)a4;
- (id)knownDiskForDictionary:(id)a3 waitingForDaemon:(BOOL)a4 fromSet:(id)a5;
- (id)knownDisksForDictionaries:(id)a3;
- (id)knownDisksForDictionaries:(id)a3 waitingForDaemon:(BOOL)a4;
- (id)knownDisksForDictionaries:(id)a3 waitingForDaemon:(BOOL)a4 fromSet:(id)a5;
- (id)newDiskWithDictionary:(id)a3;
- (id)physicalStoresForAPFSVolume:(id)a3;
- (id)visibleDisks;
- (id)volumesForAPFSPS:(id)a3;
- (id)wholeDiskForDisk:(id)a3;
- (void)_disksAppeared:(id)a3 toListener:(id)a4;
- (void)_initialPopulateCompleteForListener:(id)a3;
- (void)addListener:(id)a3;
- (void)disksAppeared:(id)a3;
- (void)disksChanged:(id)a3;
- (void)disksDisappeared:(id)a3;
- (void)initialPopulateComplete;
- (void)knownDiskForDictionary:(id)a3 notify:(id)a4 onQueue:(id)a5;
- (void)managerResumed;
- (void)managerStalled;
- (void)removeListener:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setFrameworkAsyncOperationsQueue:(id)a3;
- (void)setVisibleRoles:(id)a3;
- (void)syncAllDisks;
@end

@implementation SKManager

+ (id)sharedManagerWithBindingsSafety:(BOOL)a3
{
  if (a3) {
    +[SKManager sharedManagerWithBindingsSafety:].cold.1();
  }
  return +[SKManager sharedManager](&OBJC_CLASS___SKManager, "sharedManager");
}

+ (id)sharedManager
{
  if (NSClassFromString(@"SKDaemonManager"))
  {
    v2 = +[SKBaseManager sharedManager](&OBJC_CLASS___SKBaseManager, "sharedManager");
    [v2 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&__block_literal_global_0];

    SKGetOSLog();
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl( &dword_188F75000,  v3,  OS_LOG_TYPE_FAULT,  "Client sharedManager has been called from the daemon.",  v5,  2u);
    }
  }

  if (sharedManager_once != -1) {
    dispatch_once(&sharedManager_once, &__block_literal_global_22);
  }
  return (id)sSharedManager;
}

id __26__SKManager_sharedManager__block_invoke()
{
  v4[1] = *MEMORY[0x1895F89C0];
  v3 = @"faultCode";
  base64Encode((uint64_t)"SKManager.m", 59LL);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  [MEMORY[0x189603F68] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

void __26__SKManager_sharedManager__block_invoke_20()
{
  v0 = -[SKManager initWithBindingSafety:](objc_alloc(&OBJC_CLASS___SKManager), "initWithBindingSafety:", 0LL);
  v1 = (void *)sSharedManager;
  sSharedManager = (uint64_t)v0;
}

- (SKManager)initWithBindingSafety:(BOOL)a3
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___SKManager;
  v4 = -[SKBaseManager init](&v21, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_shouldBeBindingsSafe = a3;
    uint64_t v6 = [objc_alloc(MEMORY[0x189603FE0]) initWithCapacity:10];
    allDisks = v5->allDisks;
    v5->allDisks = (NSMutableSet *)v6;

    uint64_t v8 = [MEMORY[0x189603FC8] dictionaryWithCapacity:5];
    listenersAppearedDisks = v5->_listenersAppearedDisks;
    v5->_listenersAppearedDisks = (NSMutableDictionary *)v8;

    uint64_t v10 = [MEMORY[0x1896078B8] weakObjectsHashTable];
    listeners = v5->_listeners;
    v5->_listeners = (NSHashTable *)v10;

    uint64_t v12 = objc_opt_new();
    waitingForDiskSet = v5->_waitingForDiskSet;
    v5->_waitingForDiskSet = (NSMutableSet *)v12;

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.SKManager.waitingForDisk", 0LL);
    waitingForDiskQueue = v5->_waitingForDiskQueue;
    v5->_waitingForDiskQueue = (OS_dispatch_queue *)v14;

    uint64_t v16 = +[SKManager defaultVisibleRoles](&OBJC_CLASS___SKManager, "defaultVisibleRoles");
    visibleRoles = v5->_visibleRoles;
    v5->_visibleRoles = (NSSet *)v16;

    dispatch_queue_t v18 = dispatch_queue_create("com.apple.SKManager.frameworkOperations", MEMORY[0x1895F8AF8]);
    frameworkAsyncOperationsQueue = v5->_frameworkAsyncOperationsQueue;
    v5->_frameworkAsyncOperationsQueue = (OS_dispatch_queue *)v18;
  }

  return v5;
}

+ (id)syncSharedManager
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 syncAllDisks];
  return v2;
}

- (OS_dispatch_queue)callbackQueue
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 callbackQueue];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (void)setCallbackQueue:(id)a3
{
  id v3 = a3;
  +[SKHelperClient sharedClient](&OBJC_CLASS___SKHelperClient, "sharedClient");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setCallbackQueue:v3];
}

- (id)allDisks
{
  id v3 = self->allDisks;
  objc_sync_enter(v3);
  -[NSMutableSet allObjects](self->allDisks, "allObjects");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  return v4;
}

- (id)allDisksSet
{
  id v3 = self->allDisks;
  objc_sync_enter(v3);
  id v4 = (void *)-[NSMutableSet copy](self->allDisks, "copy");
  objc_sync_exit(v3);

  return v4;
}

- (BOOL)isBusy
{
  uint64_t v5 = 0LL;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  char v8 = 1;
  v2 = +[SKHelperClient sharedClient](&OBJC_CLASS___SKHelperClient, "sharedClient");
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  void v4[2] = __19__SKManager_isBusy__block_invoke;
  v4[3] = &unk_18A323170;
  v4[4] = &v5;
  [v2 isBusyWithBlocking:1 completionBlock:v4];

  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __19__SKManager_isBusy__block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = a2;
  return result;
}

- (void)syncAllDisks
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 syncAllDisksWithBlocking:1 completionBlock:0];
}

- (void)setVisibleRoles:(id)a3
{
  id v7 = a3;
  id v4 = self->allDisks;
  objc_sync_enter(v4);
  uint64_t v5 = (NSSet *)[v7 copy];
  visibleRoles = self->_visibleRoles;
  self->_visibleRoles = v5;

  objc_sync_exit(v4);
}

- (id)visibleDisks
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FA8] arrayWithCapacity:2];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = self->allDisks;
  objc_sync_enter(v4);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v5 = self->allDisks;
  uint64_t v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "role", (void)v12);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSSet containsObject:](self->_visibleRoles, "containsObject:", v10)) {
          [v3 addObject:v9];
        }
      }

      uint64_t v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v6);
  }

  objc_sync_exit(v4);
  return v3;
}

+ (id)defaultVisibleRoles
{
  return (id)objc_msgSend( MEMORY[0x189604010],  "setWithObjects:",  kSKDiskRoleLegacyMacData[0],  kSKDiskRoleLegacyMacSystem[0],  kSKDiskRoleMacData[0],  kSKDiskRoleMacSystem[0],  kSKDiskRoleWindowsData[0],  kSKDiskRoleWindowsSystem[0],  kSKDiskRoleUnknown[0],  0);
}

- (id)diskForBSDname:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = self->allDisks;
    objc_sync_enter(v5);
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    uint64_t v6 = self->allDisks;
    id v7 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
          objc_msgSend(v10, "diskIdentifier", (void)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          int v12 = [v11 isEqualToString:v4];

          if (v12)
          {
            id v7 = v10;
            goto LABEL_12;
          }
        }

        id v7 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
        if (v7) {
          continue;
        }
        break;
      }
    }

- (id)contentDiskWithDisk:(id)a3
{
  return a3;
}

- (id)diskForUUID:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  obj = self->allDisks;
  objc_sync_enter(obj);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  uint64_t v5 = self->allDisks;
  uint64_t v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [v9 volumeUUID];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v10 isEqualToString:v4])
        {

LABEL_13:
          -[SKManager contentDiskWithDisk:](self, "contentDiskWithDisk:", v9);
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }

        [v9 mediaUUID];
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        int v12 = [v11 isEqualToString:v4];

        if (v12) {
          goto LABEL_13;
        }
      }

      uint64_t v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
      __int128 v13 = 0LL;
      if (v6) {
        continue;
      }
      break;
    }
  }

  else
  {
    __int128 v13 = 0LL;
  }

- (id)diskForVolumeName:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v5 = self->allDisks;
  objc_sync_enter(v5);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v6 = self->allDisks;
  uint64_t v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "volumeName", (void)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          -[SKManager contentDiskWithDisk:](self, "contentDiskWithDisk:", v10);
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }

      uint64_t v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

  __int128 v13 = 0LL;
LABEL_11:

  objc_sync_exit(v5);
  return v13;
}

+ (BOOL)isMountPointWithPath:(id)a3
{
  v5[1] = 0x400000000LL;
  v5[2] = 0LL;
  v5[0] = 0x800000005LL;
  int v3 = getattrlist( (const char *)[a3 fileSystemRepresentation], v5, v6, 0xCuLL, 0);
  BOOL result = 0;
  if (!v3) {
    return (v7 == 2) & v8;
  }
  return result;
}

+ (id)BSDNameFromString:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"apfs://disk"])
  {
    id v4 = v3;
  }

  else
  {
    [MEMORY[0x189607A00] regularExpressionWithPattern:@"^(\\/dev\\/)?r?(disk\\d+(s\\d+){0,2})$" options:1 error:0];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    int v7 = v6;
    if (v6 && [v6 count] == 1)
    {
      [v7 objectAtIndexedSubscript:0];
      char v8 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v9 = [v8 numberOfRanges];

      id v4 = 0LL;
      if (v9 >= 3)
      {
        [v7 objectAtIndexedSubscript:0];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v11 = [v10 rangeAtIndex:2];
        objc_msgSend(v3, "substringWithRange:", v11, v12);
        id v4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

    else
    {
      id v4 = 0LL;
    }
  }

  return v4;
}

- (id)_diskForString:(id)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if ([v4 length] == 36)
  {
    id v5 = v4;
    if (!uuid_parse((const char *)[v5 UTF8String], uu))
    {
      -[SKManager diskForUUID:](self, "diskForUUID:", v5);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        id v8 = v12;
        int v7 = v8;
        goto LABEL_13;
      }
    }
  }

  [(id)objc_opt_class() BSDNameFromString:v4];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[SKManager _diskForPath:](self, "_diskForPath:", v4);
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && +[SKManager isMountPointWithPath:](&OBJC_CLASS___SKManager, "isMountPointWithPath:", v4))
    {
      id v10 = v9;
    }

    else
    {
      -[SKManager diskForVolumeName:](self, "diskForVolumeName:", v4);
      int v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7) {
        goto LABEL_5;
      }
      id v10 = v7;
    }

    id v8 = v10;
    int v7 = v10;
    goto LABEL_12;
  }

  -[SKManager diskForBSDname:](self, "diskForBSDname:", v6);
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
  id v8 = 0LL;
LABEL_12:

LABEL_13:
  return v7;
}

- (id)diskForString:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 length])
  {
    -[SKManager _diskForString:](self, "_diskForString:", v5);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    int v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }

    else
    {
      -[SKManager syncAllDisks](self, "syncAllDisks");
      -[SKManager _diskForString:](self, "_diskForString:", v5);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }

    unint64_t v9 = v8;
  }

  else
  {
    unint64_t v9 = 0LL;
  }

  return v9;
}

- (id)_diskForPath:(id)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (([v4 isEqualToString:@"/"] & 1) == 0)
  {
    id v4 = v4;
    int v5 = open((const char *)[v4 fileSystemRepresentation], 0x200000);
    if (v5 != -1)
    {
      int v6 = v5;
      if (!fstatfs(v5, &v22))
      {
        uint64_t v7 = [NSString stringWithUTF8String:v22.f_mntonname];

        id v4 = (id)v7;
      }

      close(v6);
    }
  }

  id v8 = self->allDisks;
  objc_sync_enter(v8);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  unint64_t v9 = self->allDisks;
  id v10 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v10)
  {
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0LL; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v9);
        }
        __int128 v13 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        objc_msgSend(v13, "mountPoint", (void)v17);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        int v15 = [v14 isEqualToString:v4];

        if (v15)
        {
          id v10 = v13;
          goto LABEL_16;
        }
      }

      id v10 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
      if (v10) {
        continue;
      }
      break;
    }
  }

- (id)diskForPath:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4 && [v4 length])
  {
    -[SKManager _diskForPath:](self, "_diskForPath:", v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      -[SKManager syncAllDisks](self, "syncAllDisks");
      -[SKManager _diskForPath:](self, "_diskForPath:", v5);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        uint64_t v10 = 0LL;
        uint64_t v11 = &v10;
        uint64_t v12 = 0x3032000000LL;
        __int128 v13 = __Block_byref_object_copy_;
        uint64_t v14 = __Block_byref_object_dispose_;
        id v15 = 0LL;
        +[SKHelperClient sharedClient](&OBJC_CLASS___SKHelperClient, "sharedClient");
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9[0] = MEMORY[0x1895F87A8];
        v9[1] = 3221225472LL;
        v9[2] = __25__SKManager_diskForPath___block_invoke;
        v9[3] = &unk_18A323198;
        v9[4] = &v10;
        [v7 diskForPath:v5 blocking:1 withCallbackBlock:v9];

        id v6 = (id)v11[5];
        _Block_object_dispose(&v10, 8);
      }
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

void __25__SKManager_diskForPath___block_invoke(uint64_t a1, void *a2)
{
}

- (id)wholeDiskForDisk:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  uint64_t v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = 0LL;
  if ([v4 isWholeDisk])
  {
    id v5 = v4;
  }

  else
  {
    [v4 cachedWholeDiskByIdentifier];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7
      || (-[SKManager syncAllDisks](self, "syncAllDisks"),
          [v4 cachedWholeDiskByIdentifier],
          (uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL))
    {
      id v6 = v7;

      goto LABEL_7;
    }

    +[SKHelperClient sharedClient](&OBJC_CLASS___SKHelperClient, "sharedClient");
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __30__SKManager_wholeDiskForDisk___block_invoke;
    v10[3] = &unk_18A323198;
    v10[4] = &v11;
    [v9 wholeDiskForDisk:v4 blocking:1 withCallbackBlock:v10];

    id v5 = (id)v12[5];
  }

  id v6 = v5;
LABEL_7:
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __30__SKManager_wholeDiskForDisk___block_invoke(uint64_t a1, void *a2)
{
}

- (id)childDisksForWholeDisk:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = 0LL;
  [v4 type];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  char v6 = [v5 isEqualToString:kSKDiskTypeRAID[0]];

  if ((v6 & 1) == 0
    && (([v4 children], (unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
     || (-[SKManager syncAllDisks](self, "syncAllDisks"),
         [v4 children],
         (unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL)))
  {
    id v8 = v9;
  }

  else
  {
    +[SKHelperClient sharedClient](&OBJC_CLASS___SKHelperClient, "sharedClient");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __36__SKManager_childDisksForWholeDisk___block_invoke;
    v11[3] = &unk_18A3231C0;
    v11[4] = &v12;
    [v7 childDisksForWholeDisk:v4 blocking:1 withCallbackBlock:v11];

    id v8 = (id)v13[5];
  }

  _Block_object_dispose(&v12, 8);

  return v8;
}

void __36__SKManager_childDisksForWholeDisk___block_invoke(uint64_t a1, void *a2)
{
}

- (id)filesystems
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __24__SKManager_filesystems__block_invoke;
  block[3] = &unk_18A3231E8;
  block[4] = self;
  if (filesystems_onceToken != -1) {
    dispatch_once(&filesystems_onceToken, block);
  }
  return self->_filesystems;
}

void __24__SKManager_filesystems__block_invoke(uint64_t a1)
{
  uint64_t v4 = 0LL;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000LL;
  uint64_t v7 = __Block_byref_object_copy_;
  id v8 = __Block_byref_object_dispose_;
  [MEMORY[0x189603FA8] arrayWithCapacity:20];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  +[SKHelperClient sharedClient](&OBJC_CLASS___SKHelperClient, "sharedClient");
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __24__SKManager_filesystems__block_invoke_2;
  v3[3] = &unk_18A3231C0;
  v3[4] = &v4;
  [v2 filesystemsWithBlocking:1 callbackBlock:v3];

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 72LL), (id)v5[5]);
  _Block_object_dispose(&v4, 8);
}

void __24__SKManager_filesystems__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  SKGetOSLog();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188F75000, v4, OS_LOG_TYPE_DEFAULT, "Initializing filesystems dictionary", buf, 2u);
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
        uint64_t v11 = objc_alloc(&OBJC_CLASS___SKFilesystem);
        uint64_t v12 = -[SKFilesystem initWithDictionaryRepresentation:]( v11,  "initWithDictionaryRepresentation:",  v10,  (void)v13);
        [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v12];

        ++v9;
      }

      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }

    while (v7);
  }
}

- (id)formatableFileSystems
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  -[SKManager filesystems](self, "filesystems");
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FA8] arrayWithCapacity:10];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  return v3;
}

- (id)filesystemWithSKType:(id)a3 isCaseSensitive:(BOOL)a4 isEncrypted:(BOOL)a5
{
  int v5 = a5;
  int v6 = a4;
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  -[SKManager filesystems](self, "filesystems");
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0LL; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        __int128 v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_msgSend(v14, "type", (void)v19);
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v15 isEqualToString:v8]
          && [v14 isCaseSensitive] == v6)
        {
          int v16 = [v14 isEncrypted];

          if (v16 == v5)
          {
            id v17 = v14;
            goto LABEL_14;
          }
        }

        else
        {
        }
      }

      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  id v17 = 0LL;
LABEL_14:

  return v17;
}

- (id)physicalStoresForAPFSVolume:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  uint64_t v11 = __Block_byref_object_copy_;
  uint64_t v12 = __Block_byref_object_dispose_;
  [MEMORY[0x189603FA8] arrayWithCapacity:2];
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  +[SKHelperClient sharedClient](&OBJC_CLASS___SKHelperClient, "sharedClient");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __41__SKManager_physicalStoresForAPFSVolume___block_invoke;
  v7[3] = &unk_18A3231C0;
  v7[4] = &v8;
  [v4 physicalStoresForAPFSVolume:v3 blocking:1 completionBlock:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __41__SKManager_physicalStoresForAPFSVolume___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObjectsFromArray:a2];
}

- (id)volumesForAPFSPS:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  uint64_t v11 = __Block_byref_object_copy_;
  uint64_t v12 = __Block_byref_object_dispose_;
  [MEMORY[0x189603FA8] arrayWithCapacity:1];
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  +[SKHelperClient sharedClient](&OBJC_CLASS___SKHelperClient, "sharedClient");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __30__SKManager_volumesForAPFSPS___block_invoke;
  v7[3] = &unk_18A3231C0;
  v7[4] = &v8;
  [v4 volumesForAPFSPS:v3 blocking:1 completionBlock:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __30__SKManager_volumesForAPFSPS___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObjectsFromArray:a2];
}

- (id)knownDisksForDictionaries:(id)a3
{
  id v4 = a3;
  -[SKManager allDisksSet](self, "allDisksSet");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKManager knownDisksForDictionaries:waitingForDaemon:fromSet:]( self,  "knownDisksForDictionaries:waitingForDaemon:fromSet:",  v4,  1LL,  v5);
  int v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)knownDisksForDictionaries:(id)a3 waitingForDaemon:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  -[SKManager allDisksSet](self, "allDisksSet");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKManager knownDisksForDictionaries:waitingForDaemon:fromSet:]( self,  "knownDisksForDictionaries:waitingForDaemon:fromSet:",  v6,  v4,  v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)knownDisksForDictionaries:(id)a3 waitingForDaemon:(BOOL)a4 fromSet:(id)a5
{
  uint64_t v6 = a4;
  uint64_t v48 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = self;
  id v11 = v9;
  objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v14)
  {
    uint64_t v16 = v14;
    uint64_t v17 = *(void *)v36;
    *(void *)&__int128 v15 = 138413058LL;
    __int128 v30 = v15;
    v32 = v10;
    id v33 = v11;
    unsigned int v31 = v6;
    do
    {
      uint64_t v18 = 0LL;
      uint64_t v34 = v16;
      do
      {
        if (*(void *)v36 != v17) {
          objc_enumerationMutation(v13);
        }
        __int128 v19 = *(void **)(*((void *)&v35 + 1) + 8 * v18);
        -[SKManager knownDiskForDictionary:waitingForDaemon:fromSet:]( v10,  "knownDiskForDictionary:waitingForDaemon:fromSet:",  v19,  v6,  v11,  v30);
        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          [v12 addObject:v20];
        }

        else
        {
          +[SKBaseManager sharedManager](&OBJC_CLASS___SKBaseManager, "sharedManager");
          __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
          [v21 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&__block_literal_global_41];

          SKGetOSLog();
          __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
          {
            [v19 objectForKey:@"volumeName"];
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
            [v19 objectForKey:@"volumeUUID"];
            id v24 = v13;
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            [v19 objectForKey:@"diskIdentifier"];
            v26 = v12;
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            [v19 objectForKey:@"mountPoint"];
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v30;
            v40 = v23;
            __int16 v41 = 2114;
            v42 = v25;
            __int16 v43 = 2114;
            v44 = v27;
            __int16 v45 = 2112;
            v46 = v28;
            _os_log_impl( &dword_188F75000,  v22,  OS_LOG_TYPE_FAULT,  "SKManager: no known disk resembling: {%@,%{public}@,%{public}@,%@}",  buf,  0x2Au);

            uint64_t v12 = v26;
            id v13 = v24;

            uint64_t v6 = v31;
            uint64_t v10 = v32;
            id v11 = v33;
          }

          uint64_t v16 = v34;
        }

        ++v18;
      }

      while (v16 != v18);
      uint64_t v16 = [v13 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }

    while (v16);
  }

  return v12;
}

id __64__SKManager_knownDisksForDictionaries_waitingForDaemon_fromSet___block_invoke()
{
  v4[1] = *MEMORY[0x1895F89C0];
  id v3 = @"faultCode";
  base64Encode((uint64_t)"SKManager.m", 554LL);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  [MEMORY[0x189603F68] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (void)knownDiskForDictionary:(id)a3 notify:(id)a4 onQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (dispatch_queue_s *)a5;
  if (v8)
  {
    -[SKManager allDisksSet](self, "allDisksSet");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKManager knownDiskForDictionary:waitingForDaemon:fromSet:]( self,  "knownDiskForDictionary:waitingForDaemon:fromSet:",  v8,  0LL,  v11);
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __51__SKManager_knownDiskForDictionary_notify_onQueue___block_invoke_2;
      block[3] = &unk_18A323258;
      id v22 = v9;
      id v12 = v12;
      id v21 = v12;
      dispatch_async(v10, block);

      id v13 = v22;
    }

    else
    {
      dispatch_time_t v14 = dispatch_time(0LL, 100000000LL);
      dispatch_get_global_queue(0LL, 0LL);
      __int128 v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1895F87A8];
      v16[1] = 3221225472LL;
      v16[2] = __51__SKManager_knownDiskForDictionary_notify_onQueue___block_invoke_3;
      v16[3] = &unk_18A323280;
      v16[4] = self;
      id v17 = v8;
      id v19 = v9;
      uint64_t v18 = v10;
      dispatch_after(v14, v15, v16);

      id v13 = v17;
    }
  }

  else
  {
    v23[0] = MEMORY[0x1895F87A8];
    v23[1] = 3221225472LL;
    v23[2] = __51__SKManager_knownDiskForDictionary_notify_onQueue___block_invoke;
    v23[3] = &unk_18A323230;
    id v24 = v9;
    dispatch_async(v10, v23);
    id v12 = v24;
  }
}

uint64_t __51__SKManager_knownDiskForDictionary_notify_onQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __51__SKManager_knownDiskForDictionary_notify_onQueue___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t __51__SKManager_knownDiskForDictionary_notify_onQueue___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) knownDiskForDictionary:*(void *)(a1 + 40) notify:*(void *)(a1 + 56) onQueue:*(void *)(a1 + 48)];
}

- (id)knownDiskForDictionary:(id)a3
{
  id v4 = a3;
  -[SKManager allDisksSet](self, "allDisksSet");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKManager knownDiskForDictionary:waitingForDaemon:fromSet:]( self,  "knownDiskForDictionary:waitingForDaemon:fromSet:",  v4,  1LL,  v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)knownDiskForDictionary:(id)a3 waitingForDaemon:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  -[SKManager allDisksSet](self, "allDisksSet");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKManager knownDiskForDictionary:waitingForDaemon:fromSet:]( self,  "knownDiskForDictionary:waitingForDaemon:fromSet:",  v6,  v4,  v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)knownDiskForDictionary:(id)a3 waitingForDaemon:(BOOL)a4 fromSet:(id)a5
{
  BOOL v6 = a4;
  uint64_t v49 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a5;
  if (v8
    && ([MEMORY[0x189603FE8] null],
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(),
        char v11 = [v8 isEqual:v10],
        v10,
        (v11 & 1) == 0))
  {
    uint64_t v35 = 0LL;
    __int128 v36 = &v35;
    uint64_t v37 = 0x3032000000LL;
    __int128 v38 = __Block_byref_object_copy_;
    v39 = __Block_byref_object_dispose_;
    id v40 = 0LL;
    dispatch_semaphore_t v13 = dispatch_semaphore_create(0LL);
    waitingForDiskQueue = (dispatch_queue_s *)self->_waitingForDiskQueue;
    uint64_t v25 = MEMORY[0x1895F87A8];
    uint64_t v26 = 3221225472LL;
    v27 = __61__SKManager_knownDiskForDictionary_waitingForDaemon_fromSet___block_invoke;
    v28 = &unk_18A3232D0;
    id v29 = v9;
    id v15 = v8;
    id v30 = v15;
    id v33 = &v35;
    BOOL v34 = v6;
    uint64_t v16 = v13;
    unsigned int v31 = v16;
    v32 = self;
    dispatch_sync(waitingForDiskQueue, &v25);
    id v17 = v36;
    if (v6 && !v36[5])
    {
      dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
      id v17 = v36;
      if (!v36[5])
      {
        +[SKBaseManager sharedManager](&OBJC_CLASS___SKBaseManager, "sharedManager", v25, v26, v27, v28, v29, v30);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v18 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&__block_literal_global_52];

        SKGetOSLog();
        id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          [v15 objectForKey:@"volumeName"];
          id v20 = (id)objc_claimAutoreleasedReturnValue();
          [v15 objectForKey:@"volumeUUID"];
          id v21 = (id)objc_claimAutoreleasedReturnValue();
          [v15 objectForKey:@"diskIdentifier"];
          id v22 = (id)objc_claimAutoreleasedReturnValue();
          [v15 objectForKey:@"mountPoint"];
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          id v42 = v20;
          __int16 v43 = 2114;
          id v44 = v21;
          __int16 v45 = 2114;
          id v46 = v22;
          __int16 v47 = 2112;
          uint64_t v48 = v23;
          _os_log_impl( &dword_188F75000,  v19,  OS_LOG_TYPE_FAULT,  "SKManager: no daemon-known disk resembling: {%@,%{public}@,%{public}@,%@}",  buf,  0x2Au);
        }

        id v17 = v36;
      }
    }

    id v12 = (id)v17[5];

    _Block_object_dispose(&v35, 8);
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

void __61__SKManager_knownDiskForDictionary_waitingForDaemon_fromSet___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v7 matchesDictionary:*(void *)(a1 + 40)])
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL), v7);
          goto LABEL_11;
        }
      }

      uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

void __61__SKManager_knownDiskForDictionary_waitingForDaemon_fromSet___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id __61__SKManager_knownDiskForDictionary_waitingForDaemon_fromSet___block_invoke_3()
{
  v4[1] = *MEMORY[0x1895F89C0];
  id v3 = @"faultCode";
  base64Encode((uint64_t)"SKManager.m", 639LL);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  [MEMORY[0x189603F68] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (id)newDiskWithDictionary:(id)a3
{
  id v3 = a3;
  [v3 objectForKey:@"type"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForKey:@"**ClassName**"];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v4 isEqualToString:kSKDiskTypeAPFSPS[0]]
    && ([v5 isEqualToString:@"SKAPFSStoreDisk"] & 1) != 0)
  {
    BOOL v6 = off_18A322A58;
  }

  else if ([v4 isEqualToString:kSKDiskTypeAPFSContainer[0]] {
         && ([v5 isEqualToString:@"SKAPFSContainerDisk"] & 1) != 0)
  }
  {
    BOOL v6 = off_18A322A40;
  }

  else if ([v4 isEqualToString:kSKDiskTypeAPFSLV[0]] {
         && ([v5 isEqualToString:@"SKAPFSDisk"] & 1) != 0)
  }
  {
    BOOL v6 = off_18A322A48;
  }

  else if ([v5 isEqualToString:@"SKAPFSSnapshotDisk"])
  {
    BOOL v6 = off_18A322A50;
  }

  else
  {
    if (([v5 isEqualToString:@"SKDisk"] & 1) == 0) {
      -[SKManager newDiskWithDictionary:].cold.1(v5);
    }
    BOOL v6 = off_18A322A68;
  }

  uint64_t v7 = (void *)[objc_alloc(*v6) initWithDictionary:v3];

  return v7;
}

- (void)addListener:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_listeners;
  objc_sync_enter(v5);
  -[NSHashTable addObject:](self->_listeners, "addObject:", v4);
  listenersAppearedDisks = self->_listenersAppearedDisks;
  [MEMORY[0x189603FE0] setWithCapacity:5];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v4, "hash"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](listenersAppearedDisks, "setObject:forKey:", v7, v8);

  -[SKManager allDisks](self, "allDisks");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 count];

  uint64_t v11 = MEMORY[0x1895F87A8];
  if (v10)
  {
    +[SKHelperClient sharedClient](&OBJC_CLASS___SKHelperClient, "sharedClient");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 xpcQueue];
    id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v11;
    block[1] = 3221225472LL;
    block[2] = __25__SKManager_addListener___block_invoke;
    block[3] = &unk_18A323318;
    void block[4] = self;
    id v19 = v4;
    dispatch_async(v13, block);
  }

  objc_sync_exit(v5);

  +[SKHelperClient sharedClient](&OBJC_CLASS___SKHelperClient, "sharedClient");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472LL;
  v16[2] = __25__SKManager_addListener___block_invoke_2;
  v16[3] = &unk_18A323318;
  v16[4] = self;
  id v17 = v4;
  id v15 = v4;
  [v14 syncAllDisksWithCompletionBlock:v16];
}

void __25__SKManager_addListener___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  [v2 allDisks];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 _disksAppeared:v3 toListener:*(void *)(a1 + 40)];
}

uint64_t __25__SKManager_addListener___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _initialPopulateCompleteForListener:*(void *)(a1 + 40)];
}

- (void)removeListener:(id)a3
{
  id v7 = a3;
  id v4 = self->_listeners;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](self->_listeners, "removeObject:", v7);
  listenersAppearedDisks = self->_listenersAppearedDisks;
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v7, "hash"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](listenersAppearedDisks, "removeObjectForKey:", v6);

  objc_sync_exit(v4);
}

- (void)initialPopulateComplete
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v3 = self->_listeners;
  objc_sync_enter(v3);
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v4 = self->_listeners;
  uint64_t v5 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        -[SKManager _initialPopulateCompleteForListener:]( self,  "_initialPopulateCompleteForListener:",  *(void *)(*((void *)&v8 + 1) + 8 * v7++),  (void)v8);
      }

      while (v5 != v7);
      uint64_t v5 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v5);
  }

  objc_sync_exit(v3);
}

- (void)_initialPopulateCompleteForListener:(id)a3
{
  id v4 = a3;
  -[SKManager callbackQueue](self, "callbackQueue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __49__SKManager__initialPopulateCompleteForListener___block_invoke;
  block[3] = &unk_18A3231E8;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

uint64_t __49__SKManager__initialPopulateCompleteForListener___block_invoke(uint64_t a1)
{
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_188F75000, v2, OS_LOG_TYPE_DEFAULT, "CLIENT - Initial Populate Complete", v4, 2u);
  }

  uint64_t result = objc_opt_respondsToSelector();
  if ((result & 1) != 0) {
    return [*(id *)(a1 + 32) initialPopulateComplete];
  }
  return result;
}

- (void)disksAppeared:(id)a3
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  objc_msgSend(MEMORY[0x189603FE0], "setWithCapacity:", objc_msgSend(v4, "count"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FE0] set];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v35 = 0LL;
  __int128 v36 = (os_log_type_t *)&v35;
  uint64_t v37 = 0x2020000000LL;
  char v38 = 1;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v32;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        -[SKManager knownDiskForDictionary:waitingForDaemon:]( self,  "knownDiskForDictionary:waitingForDaemon:",  v11,  0LL);
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v13 = v12 == 0LL;

        if (v13)
        {
          id v14 = -[SKManager newDiskWithDictionary:](self, "newDiskWithDictionary:", v11);
          [v5 addObject:v14];
        }

        else
        {
          [v6 addObject:v11];
        }
      }

      uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v40 count:16];
    }

    while (v8);
  }

  waitingForDiskQueue = (dispatch_queue_s *)self->_waitingForDiskQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __27__SKManager_disksAppeared___block_invoke;
  block[3] = &unk_18A323340;
  void block[4] = self;
  id v16 = v5;
  id v29 = v16;
  id v30 = &v35;
  dispatch_sync(waitingForDiskQueue, block);
  if ([v6 count])
  {
    [v6 allObjects];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKManager disksChanged:](self, "disksChanged:", v17);
  }

  __int128 v18 = self->_listeners;
  objc_sync_enter(v18);
  [v16 allObjects];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  SKLogArrayRedacted(v36[24], (uint64_t)"CLIENT - Disks appeared:", v19);
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  uint64_t v20 = self->_listeners;
  uint64_t v21 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v24,  v39,  16LL);
  if (v21)
  {
    uint64_t v22 = *(void *)v25;
    do
    {
      for (uint64_t j = 0LL; j != v21; ++j)
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v20);
        }
        -[SKManager _disksAppeared:toListener:]( self,  "_disksAppeared:toListener:",  v19,  *(void *)(*((void *)&v24 + 1) + 8 * j),  (void)v24);
      }

      uint64_t v21 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v24,  v39,  16LL);
    }

    while (v21);
  }

  objc_sync_exit(v18);
  _Block_object_dispose(&v35, 8);
}

void __27__SKManager_disksAppeared___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v28 = *MEMORY[0x1895F89C0];
  if ([*(id *)(*(void *)(a1 + 32) + 64) count])
  {
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    uint64_t v17 = v1;
    obuint64_t j = *(id *)(v1 + 40);
    uint64_t v16 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v16)
    {
      uint64_t v15 = *(void *)v23;
      do
      {
        for (uint64_t i = 0LL; i != v16; ++i)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(obj);
          }
          id v3 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          id v4 = (void *)objc_opt_new();
          __int128 v20 = 0u;
          __int128 v21 = 0u;
          __int128 v18 = 0u;
          __int128 v19 = 0u;
          id v5 = *(id *)(*(void *)(v17 + 32) + 64LL);
          uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
          if (v6)
          {
            uint64_t v7 = *(void *)v19;
            do
            {
              for (uint64_t j = 0LL; j != v6; ++j)
              {
                if (*(void *)v19 != v7) {
                  objc_enumerationMutation(v5);
                }
                uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * j);
                [v9 diskDictionary];
                __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
                int v11 = [v3 matchesDictionary:v10];

                if (v11)
                {
                  [v9 block];
                  id v12 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
                  ((void (**)(void, void *))v12)[2](v12, v3);

                  [v4 addObject:v9];
                }
              }

              uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
            }

            while (v6);
          }

          [*(id *)(*(void *)(v17 + 32) + 64) minusSet:v4];
        }

        uint64_t v16 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
      }

      while (v16);
    }

    uint64_t v1 = v17;
  }

  id v13 = *(id *)(*(void *)(v1 + 32) + 24LL);
  objc_sync_enter(v13);
  if ([*(id *)(*(void *)(v1 + 32) + 24) count]) {
    *(_BYTE *)(*(void *)(*(void *)(v1 + 48) + 8LL) + 24LL) = 0;
  }
  [*(id *)(*(void *)(v1 + 32) + 24) unionSet:*(void *)(v1 + 40)];
  objc_sync_exit(v13);
}

- (void)_disksAppeared:(id)a3 toListener:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    listenersAppearedDisks = self->_listenersAppearedDisks;
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v7, "hash"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](listenersAppearedDisks, "objectForKey:", v9);
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();

    char v11 = objc_opt_respondsToSelector();
    uint64_t v12 = MEMORY[0x1895F87A8];
    if ((v11 & 1) != 0
      && ([v7 visibleDiskRoles], id v13 = (void *)objc_claimAutoreleasedReturnValue(),
                                                v13,
                                                v13))
    {
      id v14 = (void *)MEMORY[0x1896079C8];
      v22[0] = v12;
      v22[1] = 3221225472LL;
      v22[2] = __39__SKManager__disksAppeared_toListener___block_invoke;
      v22[3] = &unk_18A323368;
      id v23 = v10;
      id v24 = v7;
      [v14 predicateWithBlock:v22];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 filteredArrayUsingPredicate:v15];
      id v16 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v16 = v6;
    }

    [MEMORY[0x189604010] setWithArray:v16];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 unionSet:v17];

    v19[0] = v12;
    v19[1] = 3221225472LL;
    v19[2] = __39__SKManager__disksAppeared_toListener___block_invoke_2;
    v19[3] = &unk_18A323318;
    id v20 = v16;
    id v21 = v7;
    id v18 = v16;
    dispatch_async(MEMORY[0x1895F8AE0], v19);
  }
}

uint64_t __39__SKManager__disksAppeared_toListener___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) containsObject:v3])
  {
    uint64_t v4 = 0LL;
  }

  else
  {
    [*(id *)(a1 + 40) visibleDiskRoles];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 role];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [v5 containsObject:v6];
  }

  return v4;
}

uint64_t __39__SKManager__disksAppeared_toListener___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) count];
  if (result) {
    return [*(id *)(a1 + 40) disksAppeared:*(void *)(a1 + 32)];
  }
  return result;
}

- (void)disksDisappeared:(id)a3
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  id v32 = a3;
  __int128 v33 = self;
  -[SKManager allDisksSet](self, "allDisksSet");
  id v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x189603FE0], "setWithCapacity:", objc_msgSend(v32, "count"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  obuint64_t j = self->allDisks;
  objc_sync_enter(obj);
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id v5 = self->allDisks;
  uint64_t v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v46,  v52,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v47;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v47 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        __int128 v42 = 0u;
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        id v10 = v32;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v51 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v43;
          do
          {
            for (uint64_t j = 0LL; j != v11; ++j)
            {
              if (*(void *)v43 != v12) {
                objc_enumerationMutation(v10);
              }
              if ([v9 matchesDictionary:*(void *)(*((void *)&v42 + 1) + 8 * j)])
              {
                [v4 addObject:v9];
                [v9 setIsValid:0];
              }
            }

            uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v51 count:16];
          }

          while (v11);
        }
      }

      uint64_t v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v46,  v52,  16LL);
    }

    while (v6);
  }

  -[NSMutableSet minusSet:](v33->allDisks, "minusSet:", v4);
  objc_sync_exit(obj);

  obja = v33->_listeners;
  objc_sync_enter(obja);
  SKLogArrayRedacted(OS_LOG_TYPE_DEFAULT, (uint64_t)"CLIENT - Disks disappeared:", v4);
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v31 = v33->_listeners;
  uint64_t v14 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v31,  "countByEnumeratingWithState:objects:count:",  &v38,  v50,  16LL);
  if (v14)
  {
    uint64_t v15 = *(void *)v39;
    do
    {
      for (uint64_t k = 0LL; k != v14; ++k)
      {
        if (*(void *)v39 != v15) {
          objc_enumerationMutation(v31);
        }
        uint64_t v17 = *(void **)(*((void *)&v38 + 1) + 8 * k);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          if ((objc_opt_respondsToSelector() & 1) == 0
            || ([v17 visibleDiskRoles],
                id v18 = (void *)objc_claimAutoreleasedReturnValue(),
                BOOL v19 = v18 == 0LL,
                v18,
                v19))
          {
            -[SKManager knownDisksForDictionaries:waitingForDaemon:fromSet:]( v33,  "knownDisksForDictionaries:waitingForDaemon:fromSet:",  v32,  0LL,  v30);
            __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            [v4 allObjects];
            id v20 = (void *)objc_claimAutoreleasedReturnValue();
            v37[0] = MEMORY[0x1895F87A8];
            v37[1] = 3221225472LL;
            v37[2] = __30__SKManager_disksDisappeared___block_invoke;
            v37[3] = &unk_18A323368;
            v37[4] = v33;
            v37[5] = v17;
            [MEMORY[0x1896079C8] predicateWithBlock:v37];
            id v21 = (void *)objc_claimAutoreleasedReturnValue();
            [v20 filteredArrayUsingPredicate:v21];
            __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
          }

          listenersAppearedDisks = v33->_listenersAppearedDisks;
          objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v17, "hash"));
          id v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](listenersAppearedDisks, "objectForKey:", v24);
          __int128 v25 = (void *)objc_claimAutoreleasedReturnValue();

          [MEMORY[0x189604010] setWithArray:v22];
          __int128 v26 = (void *)objc_claimAutoreleasedReturnValue();
          [v25 minusSet:v26];

          block[0] = MEMORY[0x1895F87A8];
          block[1] = 3221225472LL;
          block[2] = __30__SKManager_disksDisappeared___block_invoke_2;
          block[3] = &unk_18A323318;
          id v35 = v22;
          __int128 v36 = v17;
          id v27 = v22;
          dispatch_async(MEMORY[0x1895F8AE0], block);
        }
      }

      uint64_t v14 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v31,  "countByEnumeratingWithState:objects:count:",  &v38,  v50,  16LL);
    }

    while (v14);
  }

  objc_sync_exit(obja);
}

uint64_t __30__SKManager_disksDisappeared___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 48LL);
  uint64_t v4 = (void *)MEMORY[0x189607968];
  id v5 = a2;
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v2, "hash"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForKey:v6];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = [v7 containsObject:v5];
  return v8;
}

uint64_t __30__SKManager_disksDisappeared___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) count];
  if (result) {
    return [*(id *)(a1 + 40) disksDisappeared:*(void *)(a1 + 32)];
  }
  return result;
}

- (void)disksChanged:(id)a3
{
  uint64_t v69 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = (void *)[v4 mutableCopy];
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 3221225472LL;
  aBlock[2] = __26__SKManager_disksChanged___block_invoke;
  aBlock[3] = &unk_18A323318;
  __int128 v42 = self;
  aBlock[4] = self;
  id v33 = v4;
  id v65 = v33;
  blocuint64_t k = (void (**)(void))_Block_copy(aBlock);
  if (self->_shouldBeBindingsSafe) {
    dispatch_async(MEMORY[0x1895F8AE0], block);
  }
  else {
    block[2]();
  }
  objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
  id v35 = self->allDisks;
  objc_sync_enter(v35);
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  obuint64_t j = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v60 objects:v68 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v61;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v61 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v60 + 1) + 8 * i);
        __int128 v56 = 0u;
        __int128 v57 = 0u;
        __int128 v58 = 0u;
        __int128 v59 = 0u;
        id v10 = self->allDisks;
        uint64_t v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v56,  v67,  16LL);
        if (v11)
        {
          uint64_t v12 = *(void *)v57;
          while (2)
          {
            for (uint64_t j = 0LL; j != v11; ++j)
            {
              if (*(void *)v57 != v12) {
                objc_enumerationMutation(v10);
              }
              if ([*(id *)(*((void *)&v56 + 1) + 8 * j) matchesDictionary:v9])
              {

                goto LABEL_19;
              }
            }

            uint64_t v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v56,  v67,  16LL);
            if (v11) {
              continue;
            }
            break;
          }
        }

        [v37 addObject:v9];
LABEL_19:
        ;
      }

      uint64_t v6 = [obj countByEnumeratingWithState:&v60 objects:v68 count:16];
    }

    while (v6);
  }

  objc_sync_exit(v35);
  if ([v37 count])
  {
    -[SKManager disksAppeared:](self, "disksAppeared:", v37);
    [obj removeObjectsInArray:v37];
  }

  -[SKManager knownDisksForDictionaries:waitingForDaemon:]( self,  "knownDisksForDictionaries:waitingForDaemon:",  obj,  0LL);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v36 = self->_listeners;
  objc_sync_enter(v36);
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v38 = self->_listeners;
  uint64_t v15 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v38,  "countByEnumeratingWithState:objects:count:",  &v52,  v66,  16LL);
  if (v15)
  {
    uint64_t v40 = *(void *)v53;
    do
    {
      uint64_t v41 = v15;
      for (uint64_t k = 0LL; k != v41; ++k)
      {
        if (*(void *)v53 != v40) {
          objc_enumerationMutation(v38);
        }
        uint64_t v17 = *(void **)(*((void *)&v52 + 1) + 8 * k);
        if ((objc_opt_respondsToSelector() & 1) == 0
          || ([v17 visibleDiskRoles],
              id v18 = (void *)objc_claimAutoreleasedReturnValue(),
              BOOL v19 = v18 == 0LL,
              v18,
              v19))
        {
          v43[0] = MEMORY[0x1895F87A8];
          v43[1] = 3221225472LL;
          v43[2] = __26__SKManager_disksChanged___block_invoke_5;
          v43[3] = &unk_18A323318;
          v43[4] = v17;
          id v44 = v14;
          dispatch_async(MEMORY[0x1895F8AE0], v43);
          id v21 = v44;
        }

        else
        {
          v51[0] = MEMORY[0x1895F87A8];
          v51[1] = 3221225472LL;
          v51[2] = __26__SKManager_disksChanged___block_invoke_2;
          v51[3] = &unk_18A323390;
          v51[4] = v17;
          [MEMORY[0x1896079C8] predicateWithBlock:v51];
          id v20 = (void *)objc_claimAutoreleasedReturnValue();
          [v14 filteredArrayUsingPredicate:v20];
          id v21 = (void *)objc_claimAutoreleasedReturnValue();

          v50[0] = MEMORY[0x1895F87A8];
          v50[1] = 3221225472LL;
          v50[2] = __26__SKManager_disksChanged___block_invoke_3;
          v50[3] = &unk_18A323390;
          v50[4] = v17;
          [MEMORY[0x1896079C8] predicateWithBlock:v50];
          __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
          [v14 filteredArrayUsingPredicate:v22];
          id v23 = (void *)objc_claimAutoreleasedReturnValue();

          listenersAppearedDisks = v42->_listenersAppearedDisks;
          objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v17, "hash"));
          __int128 v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](listenersAppearedDisks, "objectForKey:", v25);
          __int128 v26 = (void *)objc_claimAutoreleasedReturnValue();

          [MEMORY[0x189603FE0] setWithArray:v23];
          id v27 = (void *)objc_claimAutoreleasedReturnValue();
          [v27 intersectSet:v26];
          [MEMORY[0x189603FE0] setWithArray:v21];
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
          [v28 minusSet:v26];
          [MEMORY[0x189603FE0] setWithArray:v21];
          id v29 = (void *)objc_claimAutoreleasedReturnValue();
          [v29 minusSet:v28];
          [v29 minusSet:v27];
          [v26 minusSet:v27];
          [v26 unionSet:v28];
          v45[0] = MEMORY[0x1895F87A8];
          v45[1] = 3221225472LL;
          v45[2] = __26__SKManager_disksChanged___block_invoke_4;
          v45[3] = &unk_18A3233B8;
          id v46 = v29;
          __int128 v47 = v17;
          id v48 = v27;
          id v49 = v28;
          id v30 = v28;
          id v31 = v27;
          id v32 = v29;
          dispatch_async(MEMORY[0x1895F8AE0], v45);
        }
      }

      uint64_t v15 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v38,  "countByEnumeratingWithState:objects:count:",  &v52,  v66,  16LL);
    }

    while (v15);
  }

  objc_sync_exit(v36);
}

void __26__SKManager_disksChanged___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v12 = *(id *)(*(void *)(a1 + 32) + 24LL);
  objc_sync_enter(v12);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  obuint64_t j = *(id *)(*(void *)(a1 + 32) + 24LL);
  uint64_t v2 = [obj countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v19;
    do
    {
      for (uint64_t i = 0LL; i != v2; ++i)
      {
        if (*(void *)v19 != v3) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        __int128 v14 = 0u;
        __int128 v15 = 0u;
        __int128 v16 = 0u;
        __int128 v17 = 0u;
        id v6 = *(id *)(a1 + 40);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v22 count:16];
        if (v7)
        {
          uint64_t v8 = *(void *)v15;
          do
          {
            for (uint64_t j = 0LL; j != v7; ++j)
            {
              if (*(void *)v15 != v8) {
                objc_enumerationMutation(v6);
              }
              id v10 = *(void **)(*((void *)&v14 + 1) + 8 * j);
              if (objc_msgSend(v5, "matchesDictionary:", v10, v12))
              {
                id v11 = v10;
                objc_sync_enter(v11);
                [v5 updateWithDictionary:v11];
                objc_sync_exit(v11);
              }
            }

            uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v22 count:16];
          }

          while (v7);
        }
      }

      uint64_t v2 = [obj countByEnumeratingWithState:&v18 objects:v23 count:16];
    }

    while (v2);
  }

  objc_sync_exit(v12);
}

uint64_t __26__SKManager_disksChanged___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 visibleDiskRoles];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 role];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = [v4 containsObject:v5];
  return v6;
}

uint64_t __26__SKManager_disksChanged___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 visibleDiskRoles];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 role];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = [v4 containsObject:v5] ^ 1;
  return v6;
}

void __26__SKManager_disksChanged___block_invoke_4(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    SKLogArrayRedacted(OS_LOG_TYPE_DEFAULT, (uint64_t)"CLIENT - Disks changed:", *(void **)(a1 + 32));
    uint64_t v2 = *(void **)(a1 + 40);
    [*(id *)(a1 + 32) allObjects];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 disksChanged:v3];
  }

  if ([*(id *)(a1 + 48) count] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    SKLogArrayRedacted(OS_LOG_TYPE_DEFAULT, (uint64_t)"CLIENT - Disks disappeared:", *(void **)(a1 + 48));
    id v4 = *(void **)(a1 + 40);
    [*(id *)(a1 + 48) allObjects];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 disksDisappeared:v5];
  }

  if ([*(id *)(a1 + 56) count])
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      uint64_t v6 = *(void **)(a1 + 40);
      [*(id *)(a1 + 56) allObjects];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 disksAppeared:v7];

      SKLogArrayRedacted(OS_LOG_TYPE_DEFAULT, (uint64_t)"CLIENT - Disks appeared:", *(void **)(a1 + 56));
    }
  }

uint64_t __26__SKManager_disksChanged___block_invoke_5(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if ((result & 1) != 0) {
    return [*(id *)(a1 + 32) disksChanged:*(void *)(a1 + 40)];
  }
  return result;
}

- (void)managerStalled
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  self->diskQueueStucuint64_t k = 1;
  obuint64_t j = self->_listeners;
  objc_sync_enter(obj);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v3 = self->_listeners;
  uint64_t v4 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    uint64_t v6 = MEMORY[0x1895F87A8];
    uint64_t v7 = (dispatch_queue_s *)MEMORY[0x1895F8AE0];
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          block[0] = v6;
          block[1] = 3221225472LL;
          block[2] = __27__SKManager_managerStalled__block_invoke;
          block[3] = &unk_18A3231E8;
          void block[4] = v9;
          dispatch_async(v7, block);
        }

        ++v8;
      }

      while (v4 != v8);
      uint64_t v4 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v4);
  }

  objc_sync_exit(obj);
}

uint64_t __27__SKManager_managerStalled__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) managerStalled];
}

- (void)managerResumed
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  self->diskQueueStucuint64_t k = 0;
  id v3 = self->_listeners;
  objc_sync_enter(v3);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v4 = self->_listeners;
  uint64_t v5 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    uint64_t v7 = MEMORY[0x1895F87A8];
    uint64_t v8 = (dispatch_queue_s *)MEMORY[0x1895F8AE0];
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        block[0] = v7;
        block[1] = 3221225472LL;
        block[2] = __27__SKManager_managerResumed__block_invoke;
        block[3] = &unk_18A3231E8;
        void block[4] = v10;
        dispatch_async(v8, block);
        ++v9;
      }

      while (v5 != v9);
      uint64_t v5 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v5);
  }

  objc_sync_exit(v3);
}

uint64_t __27__SKManager_managerResumed__block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if ((result & 1) != 0) {
    return [*(id *)(a1 + 32) managerResumed];
  }
  return result;
}

- (NSSet)visibleRoles
{
  return self->_visibleRoles;
}

- (OS_dispatch_queue)frameworkAsyncOperationsQueue
{
  return self->_frameworkAsyncOperationsQueue;
}

- (void)setFrameworkAsyncOperationsQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)sharedManagerWithBindingsSafety:.cold.1()
{
  __assert_rtn("+[SKManager sharedManagerWithBindingsSafety:]", "SKManager.m", 51, "isBindingsSafe == NO");
}

- (void)newDiskWithDictionary:(void *)a1 .cold.1(void *a1)
{
}

@end
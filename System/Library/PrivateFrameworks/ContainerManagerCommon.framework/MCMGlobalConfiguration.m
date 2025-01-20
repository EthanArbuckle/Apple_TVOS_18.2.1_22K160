@interface MCMGlobalConfiguration
- (BOOL)handlesGlobalContainers;
- (BOOL)handlesUserContainers;
- (BOOL)isGlobalBundleContainerWithContainerClass:(unint64_t)a3;
- (BOOL)isGlobalContainerClass:(unint64_t)a3;
- (BOOL)isGlobalSystemContainerWithContainerClass:(unint64_t)a3;
- (BOOL)isInternalImage;
- (BOOL)isPerUserBundleContainerWithContainerClass:(unint64_t)a3;
- (BOOL)isUnsupportedBundleContainerWithContainerClass:(unint64_t)a3;
- (BOOL)isUnsupportedSystemContainerWithContainerClass:(unint64_t)a3;
- (BOOL)isUserBundleContainerWithContainerClass:(unint64_t)a3;
- (BOOL)isUserSystemContainerWithContainerClass:(unint64_t)a3;
- (BOOL)kernelUpcallEnabled;
- (MCMContainerClassIterator)classIterator;
- (MCMContainerClassPathCache)classPathCache;
- (MCMGlobalConfiguration)initWithStaticConfig:(id)a3 runMode:(unsigned int)a4 userContainerMode:(unsigned int)a5 bundleContainerMode:(unsigned int)a6 bundleContainerOwner:(id)a7 systemContainerMode:(unsigned int)a8 systemContainerOwner:(id)a9 kernelUpcallEnabled:(BOOL)a10;
- (MCMLibraryRepair)libraryRepair;
- (MCMManagedPathRegistry)managedPathRegistry;
- (MCMPOSIXUser)bundleContainerOwner;
- (MCMPOSIXUser)currentUser;
- (MCMPOSIXUser)defaultUser;
- (MCMPOSIXUser)systemContainerOwner;
- (MCMStaticConfiguration)staticConfig;
- (NSArray)appUserDataItemNames;
- (NSArray)excludedFromAppUserData;
- (NSURL)sharedContainersDirectory;
- (unsigned)bundleContainerMode;
- (unsigned)dispositionForContainerClass:(unint64_t)a3;
- (unsigned)dispositionForContainerClass:(unint64_t)a3 forUser:(id)a4;
- (unsigned)runmode;
- (unsigned)systemContainerMode;
- (unsigned)userContainerMode;
- (void)setIsInternalImage:(BOOL)a3;
- (void)signpostFirstContainerClass:(unint64_t)a3;
@end

@implementation MCMGlobalConfiguration

- (MCMGlobalConfiguration)initWithStaticConfig:(id)a3 runMode:(unsigned int)a4 userContainerMode:(unsigned int)a5 bundleContainerMode:(unsigned int)a6 bundleContainerOwner:(id)a7 systemContainerMode:(unsigned int)a8 systemContainerOwner:(id)a9 kernelUpcallEnabled:(BOOL)a10
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  id v17 = a3;
  id v18 = a7;
  id v44 = a9;
  v45.receiver = self;
  v45.super_class = (Class)&OBJC_CLASS___MCMGlobalConfiguration;
  v19 = -[MCMGlobalConfiguration init](&v45, sel_init);
  if (!v19)
  {
LABEL_9:

    return v19;
  }

  container_class_for_each_normalized_class();
  objc_storeStrong((id *)&v19->_staticConfig, a3);
  v20 = -[MCMContainerClassIterator initWithStaticConfig:]( objc_alloc(&OBJC_CLASS___MCMContainerClassIterator),  "initWithStaticConfig:",  v17);
  classIterator = v19->_classIterator;
  v19->_classIterator = v20;

  v19->_runmode = a4;
  v19->_userContainerMode = a5;
  v19->_bundleContainerMode = a6;
  objc_storeStrong((id *)&v19->_bundleContainerOwner, a7);
  v19->_systemContainerMode = a8;
  objc_storeStrong((id *)&v19->_systemContainerOwner, a9);
  [v17 defaultUser];
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    v24 = v22;
  }

  else
  {
    +[MCMPOSIXUser currentPOSIXUser](&OBJC_CLASS___MCMPOSIXUser, "currentPOSIXUser");
    v24 = (MCMPOSIXUser *)objc_claimAutoreleasedReturnValue();
  }

  defaultUser = v19->_defaultUser;
  v19->_defaultUser = v24;

  uint64_t v26 = +[MCMPOSIXUser currentPOSIXUser](&OBJC_CLASS___MCMPOSIXUser, "currentPOSIXUser");
  currentUser = v19->_currentUser;
  v19->_currentUser = (MCMPOSIXUser *)v26;

  v19->_kernelUpcallEnabled = a10;
  uint64_t v28 = -[MCMPOSIXUser homeDirectoryURL](v19->_currentUser, "homeDirectoryURL");
  homeDirectory = v19->_homeDirectory;
  v19->_homeDirectory = (NSURL *)v28;

  if (v19->_homeDirectory)
  {
    v30 = -[MCMManagedPathRegistry initWithDaemonUser:privileged:]( objc_alloc(&OBJC_CLASS___MCMManagedPathRegistry),  "initWithDaemonUser:privileged:",  v19->_currentUser,  a4 == 0);
    managedPathRegistry = v19->_managedPathRegistry;
    v19->_managedPathRegistry = v30;

    v32 = objc_alloc(&OBJC_CLASS___MCMLibraryRepair);
    v33 = v19->_managedPathRegistry;
    v34 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
    uint64_t v35 = -[MCMLibraryRepair initWithManagedPathRegistry:fileManager:classIterator:]( v32,  "initWithManagedPathRegistry:fileManager:classIterator:",  v33,  v34,  v19->_classIterator);
    libraryRepair = v19->_libraryRepair;
    v19->_libraryRepair = (MCMLibraryRepair *)v35;

    container_log_handle_for_category();
    v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v39 = v19->_defaultUser;
      v40 = v19->_currentUser;
      bundleContainerOwner = v19->_bundleContainerOwner;
      v42 = v19->_homeDirectory;
      *(_DWORD *)buf = 138413058;
      v47 = v39;
      __int16 v48 = 2112;
      v49 = v40;
      __int16 v50 = 2112;
      v51 = bundleContainerOwner;
      __int16 v52 = 2112;
      v53 = v42;
      _os_log_error_impl( &dword_188846000,  v37,  OS_LOG_TYPE_ERROR,  "Default user: %@, current user: %@, bundle owner: %@, home dir: [%@]",  buf,  0x2Au);
    }

    goto LABEL_9;
  }

  container_log_handle_for_category();
  v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_188846000, v43, OS_LOG_TYPE_ERROR, "could not get home directory...aborting\n", buf, 2u);
  }

  result = (MCMGlobalConfiguration *)_os_crash();
  __break(1u);
  return result;
}

- (void)signpostFirstContainerClass:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (a3 - 1 <= 0xD)
  {
    uint64_t v3 = container_class_normalized();
    os_unfair_lock_lock_with_options();
    os_signpost_id_t v4 = gSignpostedFirstContainerOfClass[v3];
    gSignpostedFirstContainerOfClass[v3] = 0LL;
    os_unfair_lock_unlock((os_unfair_lock_t)&gSignpostedFirstContainerOfClassLock + v3);
    if (v4)
    {
      container_log_handle_for_category();
      v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v4 != -1LL && os_signpost_enabled(v5))
      {
        int v7 = 134349056;
        uint64_t v8 = v3;
        _os_signpost_emit_with_name_impl( &dword_188846000,  v6,  OS_SIGNPOST_INTERVAL_END,  v4,  "VendFirstContainerOfClass",  " class=%{public, signpost.description:attribute}llu ",  (uint8_t *)&v7,  0xCu);
      }
    }
  }

- (MCMContainerClassPathCache)classPathCache
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_classPathCache)
  {
    uint64_t v3 = objc_alloc(&OBJC_CLASS___MCMContainerClassPathCache);
    +[MCMUserIdentitySharedCache sharedInstance](&OBJC_CLASS___MCMUserIdentitySharedCache, "sharedInstance");
    os_signpost_id_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = -[MCMContainerClassPathCache initWithUserIdentityCache:](v3, "initWithUserIdentityCache:", v4);
    classPathCache = v2->_classPathCache;
    v2->_classPathCache = (MCMContainerClassPathCache *)v5;
  }

  objc_sync_exit(v2);

  return v2->_classPathCache;
}

- (NSURL)sharedContainersDirectory
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  -[MCMGlobalConfiguration currentUser](self, "currentUser");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = [v3 isRoot];

  if (v4)
  {
    uint64_t v5 = self;
    objc_sync_enter(v5);
    if (!v5->_sharedContainersDirectory)
    {
      uint64_t v6 = [MEMORY[0x189604030] fileURLWithPath:@"/private/var/containers" isDirectory:1];
      sharedContainersDirectory = v5->_sharedContainersDirectory;
      v5->_sharedContainersDirectory = (NSURL *)v6;
    }

    +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = v5->_sharedContainersDirectory;
    id v16 = 0LL;
    char v10 = [v8 createDirectoryAtURL:v9 withIntermediateDirectories:1 mode:493 error:&v16];
    id v11 = v16;

    if ((v10 & 1) == 0)
    {
      container_log_handle_for_category();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v15 = -[NSURL path](v5->_sharedContainersDirectory, "path");
        *(_DWORD *)buf = 138412546;
        id v18 = v15;
        __int16 v19 = 2112;
        id v20 = v11;
        _os_log_error_impl( &dword_188846000,  v12,  OS_LOG_TYPE_ERROR,  "Failed to create shared container dir at %@: %@",  buf,  0x16u);
      }

      v13 = v5->_sharedContainersDirectory;
      v5->_sharedContainersDirectory = 0LL;
    }

    objc_sync_exit(v5);
  }

  return self->_sharedContainersDirectory;
}

- (NSArray)appUserDataItemNames
{
  return (NSArray *)&unk_18A2BE890;
}

- (NSArray)excludedFromAppUserData
{
  return (NSArray *)&unk_18A2BE8A8;
}

- (BOOL)isInternalImage
{
  v4[5] = *MEMORY[0x1895F89C0];
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __41__MCMGlobalConfiguration_isInternalImage__block_invoke;
  v4[3] = &unk_18A29E378;
  v4[4] = self;
  if (isInternalImage_onceToken != -1) {
    dispatch_once(&isInternalImage_onceToken, v4);
  }
  return self->_isInternalImage;
}

- (BOOL)isGlobalSystemContainerWithContainerClass:(unint64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 0xC) {
    return 0;
  }
  id v3 = containermanager_copy_global_configuration();
  BOOL v4 = [v3 systemContainerMode] == 1;

  return v4;
}

- (BOOL)isUserSystemContainerWithContainerClass:(unint64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 0xC) {
    return 0;
  }
  id v3 = containermanager_copy_global_configuration();
  BOOL v4 = [v3 systemContainerMode] == 2;

  return v4;
}

- (BOOL)isUnsupportedSystemContainerWithContainerClass:(unint64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 0xC) {
    return 0;
  }
  id v3 = containermanager_copy_global_configuration();
  BOOL v4 = [v3 systemContainerMode] == 0;

  return v4;
}

- (BOOL)isGlobalBundleContainerWithContainerClass:(unint64_t)a3
{
  BOOL v3 = 0;
  if (a3 <= 8 && ((1LL << a3) & 0x12A) != 0)
  {
    id v4 = containermanager_copy_global_configuration();
    BOOL v3 = [v4 bundleContainerMode] == 1;
  }

  return v3;
}

- (BOOL)isPerUserBundleContainerWithContainerClass:(unint64_t)a3
{
  if (a3 != 14) {
    return 0;
  }
  id v3 = containermanager_copy_global_configuration();
  BOOL v4 = [v3 bundleContainerMode] != 0;

  return v4;
}

- (BOOL)isUserBundleContainerWithContainerClass:(unint64_t)a3
{
  BOOL v3 = 0;
  if (a3 <= 0xE)
  {
    if (((1LL << a3) & 0x12A) != 0)
    {
      id v4 = containermanager_copy_global_configuration();
      BOOL v3 = [v4 bundleContainerMode] == 2;
    }

    else
    {
      if (a3 != 14) {
        return v3;
      }
      id v4 = containermanager_copy_global_configuration();
      BOOL v3 = [v4 bundleContainerMode] != 0;
    }
  }

  return v3;
}

- (BOOL)isUnsupportedBundleContainerWithContainerClass:(unint64_t)a3
{
  BOOL v3 = 0;
  if (a3 <= 0xE && ((1LL << a3) & 0x412A) != 0)
  {
    id v4 = containermanager_copy_global_configuration();
    BOOL v3 = [v4 bundleContainerMode] == 0;
  }

  return v3;
}

- (BOOL)isGlobalContainerClass:(unint64_t)a3
{
  if (a3 - 2 < 0xD && ((0x13B5u >> (a3 - 2)) & 1) != 0)
  {
    LOBYTE(v5) = 0;
  }

  else if (-[MCMGlobalConfiguration isGlobalSystemContainerWithContainerClass:]( self,  "isGlobalSystemContainerWithContainerClass:",  a3) {
         || (BOOL v5 = -[MCMGlobalConfiguration isGlobalBundleContainerWithContainerClass:]( self,  "isGlobalBundleContainerWithContainerClass:",  a3)))
  }
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (BOOL)handlesGlobalContainers
{
  id v2 = containermanager_copy_global_configuration();
  if ([v2 bundleContainerMode] == 1)
  {
    BOOL v3 = 1;
  }

  else
  {
    id v4 = containermanager_copy_global_configuration();
    BOOL v3 = [v4 systemContainerMode] == 1;
  }

  return v3;
}

- (BOOL)handlesUserContainers
{
  id v2 = containermanager_copy_global_configuration();
  if ([v2 userContainerMode])
  {
    BOOL v3 = 1;
  }

  else
  {
    id v4 = containermanager_copy_global_configuration();
    if ([v4 bundleContainerMode] == 2)
    {
      BOOL v3 = 1;
    }

    else
    {
      id v5 = containermanager_copy_global_configuration();
      BOOL v3 = [v5 systemContainerMode] == 2;
    }
  }

  return v3;
}

- (unsigned)dispositionForContainerClass:(unint64_t)a3
{
  return -[MCMGlobalConfiguration dispositionForContainerClass:forUser:]( self,  "dispositionForContainerClass:forUser:",  a3,  0LL);
}

- (unsigned)dispositionForContainerClass:(unint64_t)a3 forUser:(id)a4
{
  id v6 = a4;
  if (a3 <= 8 && ((1LL << a3) & 0x12A) != 0)
  {
    id v7 = containermanager_copy_global_configuration();
    int v8 = [v7 bundleContainerMode];

    unsigned int v9 = v8 - 1;
  }

  else
  {
    unint64_t v11 = a3 & 0xFFFFFFFFFFFFFFFELL;
    id v12 = containermanager_copy_global_configuration();
    v13 = v12;
    if (v11 != 12)
    {
      int v15 = [v12 userContainerMode];

      if (v15 == 2
        || v15 == 1
        && (!v6
         || (-[MCMGlobalConfiguration defaultUser](self, "defaultUser"),
             id v16 = (void *)objc_claimAutoreleasedReturnValue(),
             int v17 = [v6 isEqual:v16],
             v16,
             v17)))
      {
        unsigned int v10 = 1;
        goto LABEL_14;
      }

- (MCMStaticConfiguration)staticConfig
{
  return self->_staticConfig;
}

- (MCMContainerClassIterator)classIterator
{
  return self->_classIterator;
}

- (MCMPOSIXUser)defaultUser
{
  return self->_defaultUser;
}

- (MCMPOSIXUser)currentUser
{
  return self->_currentUser;
}

- (void)setIsInternalImage:(BOOL)a3
{
  self->_isInternalImage = a3;
}

- (unsigned)runmode
{
  return self->_runmode;
}

- (unsigned)userContainerMode
{
  return self->_userContainerMode;
}

- (unsigned)bundleContainerMode
{
  return self->_bundleContainerMode;
}

- (unsigned)systemContainerMode
{
  return self->_systemContainerMode;
}

- (MCMPOSIXUser)bundleContainerOwner
{
  return self->_bundleContainerOwner;
}

- (MCMPOSIXUser)systemContainerOwner
{
  return self->_systemContainerOwner;
}

- (MCMManagedPathRegistry)managedPathRegistry
{
  return self->_managedPathRegistry;
}

- (MCMLibraryRepair)libraryRepair
{
  return self->_libraryRepair;
}

- (BOOL)kernelUpcallEnabled
{
  return self->_kernelUpcallEnabled;
}

- (void).cxx_destruct
{
}

uint64_t __41__MCMGlobalConfiguration_isInternalImage__block_invoke(uint64_t a1)
{
  uint64_t result = os_variant_has_internal_content();
  *(_BYTE *)(*(void *)(a1 + 32) + 24LL) = result;
  return result;
}

void __175__MCMGlobalConfiguration_initWithStaticConfig_runMode_userContainerMode_bundleContainerMode_bundleContainerOwner_systemContainerMode_systemContainerOwner_kernelUpcallEnabled___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  container_log_handle_for_category();
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, &gSignpostedFirstContainerOfClass[a2]);

  container_log_handle_for_category();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)id v7 = 0;
    _os_signpost_emit_with_name_impl( &dword_188846000,  v6,  OS_SIGNPOST_INTERVAL_BEGIN,  v4,  "VendFirstContainerOfClass",  "",  v7,  2u);
  }

  gSignpostedFirstContainerOfClass[a2] = v4;
  gSignpostedFirstContainerOfClassLock[a2] = 0;
}

@end
@interface MIFileManager
+ (id)_sanitizeFilePathForVarOrTmpSymlink:(id)a3 error:(id *)a4;
+ (id)defaultManager;
- (BOOL)_bulkSetPropertiesForPath:(const char *)a3 existingFD:(int)a4 UID:(unsigned int)a5 GID:(unsigned int)a6 mode:(unsigned __int16)a7 flags:(unsigned int)a8 dataProtectionClass:(int)a9 removeACL:(BOOL)a10 error:(id *)a11;
- (BOOL)_copyItemAtURL:(id)a3 toURL:(id)a4 failIfSrcMissing:(BOOL)a5 alwaysClone:(BOOL)a6 ignoreErrors:(BOOL)a7 error:(id *)a8;
- (BOOL)_itemIsType:(unsigned __int16)a3 withDescription:(id)a4 atURL:(id)a5 error:(id *)a6;
- (BOOL)_markEAFlag:(const char *)a3 forAppIdentifier:(id)a4 insecurelyCachedOnBundle:(id)a5 error:(id *)a6;
- (BOOL)_moveItemAtURL:(id)a3 toURL:(id)a4 failIfSrcMissing:(BOOL)a5 error:(id *)a6;
- (BOOL)_removeACLAtPath:(const char *)a3 isDir:(BOOL)a4 error:(id *)a5;
- (BOOL)_setData:(id)a3 forExtendedAttributeNamed:(id)a4 onURL:(id)a5 orFD:(int)a6 error:(id *)a7;
- (BOOL)_stageURLByCopying:(id)a3 toItemName:(id)a4 inStagingDir:(id)a5 stagingMode:(int)a6 settingUID:(unsigned int)a7 gid:(unsigned int)a8 dataProtectionClass:(int)a9 hasSymlink:(BOOL *)a10 error:(id *)a11;
- (BOOL)_validateSymlink:(id)a3 withStartingDepth:(unsigned int)a4 andEndingDepth:(unsigned int *)a5;
- (BOOL)bulkSetPropertiesForPath:(const char *)a3 UID:(unsigned int)a4 GID:(unsigned int)a5 mode:(unsigned __int16)a6 flags:(unsigned int)a7 dataProtectionClass:(int)a8 removeACL:(BOOL)a9 error:(id *)a10;
- (BOOL)bulkSetPropertiesForPath:(const char *)a3 withOpenFD:(int)a4 UID:(unsigned int)a5 GID:(unsigned int)a6 mode:(unsigned __int16)a7 flags:(unsigned int)a8 dataProtectionClass:(int)a9 removeACL:(BOOL)a10 error:(id *)a11;
- (BOOL)bundleAtURLIsPlaceholder:(id)a3;
- (BOOL)captureStoreDataFromDirectory:(id)a3 toDirectory:(id)a4 doCopy:(BOOL)a5 failureIsFatal:(BOOL)a6 includeiTunesMetadata:(BOOL)a7 withError:(id *)a8;
- (BOOL)clearPlaceholderStatusForBundle:(id)a3 withError:(id *)a4;
- (BOOL)copyItemAtURL:(id)a3 toURL:(id)a4 alwaysClone:(BOOL)a5 error:(id *)a6;
- (BOOL)copyItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)copyItemIfExistsAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)copyItemIgnoringErrorsAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 mode:(unsigned __int16)a5 class:(int)a6 error:(id *)a7;
- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 mode:(unsigned __int16)a5 error:(id *)a6;
- (BOOL)createSymbolicLinkAtURL:(id)a3 withDestinationURL:(id)a4 error:(id *)a5;
- (BOOL)dataProtectionClassOfItemAtURL:(id)a3 class:(int *)a4 error:(id *)a5;
- (BOOL)itemDoesNotExistAtURL:(id)a3;
- (BOOL)itemDoesNotExistOrIsNotDirectoryAtURL:(id)a3;
- (BOOL)itemExistsAtURL:(id)a3;
- (BOOL)itemExistsAtURL:(id)a3 error:(id *)a4;
- (BOOL)itemIsDirectoryAtURL:(id)a3 error:(id *)a4;
- (BOOL)itemIsFIFOAtURL:(id)a3 error:(id *)a4;
- (BOOL)itemIsFileAtURL:(id)a3 error:(id *)a4;
- (BOOL)itemIsSocketAtURL:(id)a3 error:(id *)a4;
- (BOOL)itemIsSymlinkAtURL:(id)a3 error:(id *)a4;
- (BOOL)markBundleAsPlaceholder:(id)a3 withError:(id *)a4;
- (BOOL)moveItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)moveItemIfExistsAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)removeExtendedAttributeNamed:(id)a3 fromURL:(id)a4 error:(id *)a5;
- (BOOL)removeItemAtURL:(id)a3 error:(id *)a4;
- (BOOL)removeItemAtURL:(id)a3 keepParent:(BOOL)a4 error:(id *)a5;
- (BOOL)secureRenameFromSourceURL:(id)a3 toDestinationURL:(id)a4 destinationStatus:(unsigned __int8)a5 error:(id *)a6;
- (BOOL)setAppClipAppIdentifier:(id)a3 insecurelyCachedOnBundle:(id)a4 error:(id *)a5;
- (BOOL)setData:(id)a3 forExtendedAttributeNamed:(id)a4 onFD:(int)a5 fdLocation:(id)a6 error:(id *)a7;
- (BOOL)setData:(id)a3 forExtendedAttributeNamed:(id)a4 onURL:(id)a5 error:(id *)a6;
- (BOOL)setDataProtectionClassOfItemAtURL:(id)a3 toClass:(int)a4 ifPredicate:(id)a5 error:(id *)a6;
- (BOOL)setInstallType:(id)a3 inExtendedAttributeOnBundle:(id)a4 error:(id *)a5;
- (BOOL)setModificationDateToNowForURL:(id)a3 error:(id *)a4;
- (BOOL)setOwnerOfURL:(id)a3 toUID:(unsigned int)a4 gid:(unsigned int)a5 error:(id *)a6;
- (BOOL)setPermissionsForURL:(id)a3 toMode:(unsigned __int16)a4 error:(id *)a5;
- (BOOL)setValidatedByFreeProfileAppIdentifier:(id)a3 insecurelyCachedOnBundle:(id)a4 error:(id *)a5;
- (BOOL)stageURL:(id)a3 toItemName:(id)a4 inStagingDir:(id)a5 stagingMode:(int)a6 settingUID:(unsigned int)a7 gid:(unsigned int)a8 hasSymlink:(BOOL *)a9 error:(id *)a10;
- (BOOL)stageURLByMoving:(id)a3 toItemName:(id)a4 inStagingDir:(id)a5 settingUID:(unsigned int)a6 gid:(unsigned int)a7 dataProtectionClass:(int)a8 breakHardlinks:(BOOL)a9 hasSymlink:(BOOL *)a10 error:(id *)a11;
- (BOOL)standardizeOwnershipAtURL:(id)a3 toUID:(unsigned int)a4 GID:(unsigned int)a5 removeACLs:(BOOL)a6 setProtectionClass:(BOOL)a7 foundSymlink:(BOOL *)a8 error:(id *)a9;
- (BOOL)validateSymlinksInURLDoNotEscapeURL:(id)a3 error:(id *)a4;
- (id)_dataForExtendedAttributeNamed:(id)a3 length:(unint64_t)a4 onURL:(id)a5 orFD:(int)a6 error:(id *)a7;
- (id)_insecureCachedAppIdentifierIfMarkedWithEAFlag:(const char *)a3 bundleURL:(id)a4 allowPlaceholders:(BOOL)a5 error:(id *)a6;
- (id)_realPathForURL:(id)a3 allowNonExistentPathComponents:(BOOL)a4;
- (id)_realPathWhatExistsInPath:(id)a3 isDirectory:(BOOL)a4;
- (id)aclTextFromURL:(id)a3 error:(id *)a4;
- (id)createTemporaryDirectoryInDirectoryURL:(id)a3 error:(id *)a4;
- (id)dataForExtendedAttributeNamed:(id)a3 length:(unint64_t)a4 fromFD:(int)a5 fdLocation:(id)a6 error:(id *)a7;
- (id)dataForExtendedAttributeNamed:(id)a3 length:(unint64_t)a4 fromURL:(id)a5 error:(id *)a6;
- (id)debugDescriptionForItemAtURL:(id)a3;
- (id)destinationOfSymbolicLinkAtURL:(id)a3 error:(id *)a4;
- (id)enumerateURLsForItemsInDirectoryAtURL:(id)a3 ignoreSymlinks:(BOOL)a4 withBlock:(id)a5;
- (id)extendedAttributesFromURL:(id)a3 error:(id *)a4;
- (id)insecureCachedAppIdentifierIfAppClipForBundle:(id)a3 error:(id *)a4;
- (id)insecureCachedAppIdentifierIfValidatedByFreeProfileForBundle:(id)a3 error:(id *)a4;
- (id)installTypeFromExtendedAttributeOnBundle:(id)a3 error:(id *)a4;
- (id)modificationDateForURL:(id)a3 error:(id *)a4;
- (id)realPathForURL:(id)a3 allowNonExistentPathComponents:(BOOL)a4 isDirectory:(BOOL)a5 error:(id *)a6;
- (id)realPathForURL:(id)a3 ifChildOfURL:(id)a4;
- (id)traverseDirectoryAtURL:(id)a3 withBlock:(id)a4;
- (id)upToFirstFourBytesFromURL:(id)a3 error:(id *)a4;
- (id)urlsForItemsInDirectoryAtURL:(id)a3 ignoringSymlinks:(BOOL)a4 error:(id *)a5;
- (int)deviceForURLOrFirstAvailableParent:(id)a3 error:(id *)a4;
- (unint64_t)diskUsageForURL:(id)a3;
- (void)logAccessPermissionsForURL:(id)a3;
@end

@implementation MIFileManager

+ (id)defaultManager
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __31__MIFileManager_defaultManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultManager_onceToken_1 != -1) {
    dispatch_once(&defaultManager_onceToken_1, block);
  }
  return (id)defaultManager_defaultInstance;
}

void __31__MIFileManager_defaultManager__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)defaultManager_defaultInstance;
  defaultManager_defaultInstance = (uint64_t)v0;
}

- (BOOL)removeItemAtURL:(id)a3 error:(id *)a4
{
  return -[MIFileManager removeItemAtURL:keepParent:error:](self, "removeItemAtURL:keepParent:error:", a3, 0LL, a4);
}

- (BOOL)removeItemAtURL:(id)a3 keepParent:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  v8 = removefile_state_alloc();
  v10 = v8;
  int value = 0;
  if (!v7)
  {
    v18 = (void *)*MEMORY[0x189607688];
    v19 = @"nil url passed to -removeItemAtURL:error:";
    uint64_t v20 = 109LL;
    uint64_t v21 = 14LL;
LABEL_19:
    _CreateError((uint64_t)"-[MIFileManager removeItemAtURL:keepParent:error:]", v20, v18, v21, 0LL, 0LL, v19, v9, v28);
    goto LABEL_20;
  }

  if (removefile_state_set(v8, 3u, _removefile_error_callback) && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v11 = __error();
    strerror(*v11);
    MOLogWrite();
  }

  if (removefile_state_set(v10, 4u, &value) && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v12 = __error();
    strerror(*v12);
    MOLogWrite();
  }

  if (v6) {
    removefile_flags_t v13 = 3;
  }
  else {
    removefile_flags_t v13 = 1;
  }
  id v14 = v7;
  if (removefile((const char *)[v14 fileSystemRepresentation], v10, v13) && *__error() != 2)
  {
    v22 = (void *)*MEMORY[0x189607688];
    uint64_t v23 = *__error();
    v24 = __error();
    uint64_t v28 = (uint64_t)v14;
    strerror(*v24);
    v19 = @"removefile of %@ failed: %s";
    uint64_t v20 = 130LL;
    v18 = v22;
    uint64_t v21 = v23;
    goto LABEL_19;
  }

  uint64_t v15 = value;
  if ((value & 0xFFFFFFFD) == 0)
  {
    removefile_state_free(v10);
    id v25 = 0LL;
    BOOL v26 = 1;
    goto LABEL_24;
  }

  v16 = (void *)*MEMORY[0x189607688];
  strerror(value);
  _CreateError( (uint64_t)"-[MIFileManager removeItemAtURL:keepParent:error:]",  136LL,  v16,  v15,  0LL,  0LL,  @"removefile of %@ failed: %s",  v17,  (uint64_t)v14);
LABEL_20:
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  removefile_state_free(v10);
  if (a5)
  {
    id v25 = v25;
    BOOL v26 = 0;
    *a5 = v25;
  }

  else
  {
    BOOL v26 = 0;
  }

- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 mode:(unsigned __int16)a5 class:(int)a6 error:(id *)a7
{
  uint64_t v8 = *(void *)&a6;
  BOOL v10 = a4;
  id v11 = a3;
  v12 = (const char *)[v11 fileSystemRepresentation];
  if (v10)
  {
    int v13 = mkpath_np(v12, a5);
    if (v13)
    {
      int v14 = v13;
      if (v13 != 17)
      {
        uint64_t v15 = (void *)*MEMORY[0x189607688];
        [v11 path];
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        strerror(v14);
        _CreateError( (uint64_t)"-[MIFileManager createDirectoryAtURL:withIntermediateDirectories:mode:class:error:]",  159LL,  v15,  v14,  0LL,  0LL,  @"mkpath_np of %@ failed: %s",  v17,  (uint64_t)v16);
        id v18 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_15;
      }
    }
  }

  else if (mkdir(v12, a5) && *__error() != 17)
  {
    v30 = (void *)*MEMORY[0x189607688];
    uint64_t v31 = *__error();
    [v11 path];
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = __error();
    strerror(*v33);
    _CreateError( (uint64_t)"-[MIFileManager createDirectoryAtURL:withIntermediateDirectories:mode:class:error:]",  165LL,  v30,  v31,  0LL,  0LL,  @"mkdir of %@ failed: %s",  v34,  (uint64_t)v32);
LABEL_14:
    id v18 = (id)objc_claimAutoreleasedReturnValue();

LABEL_15:
    BOOL v24 = 0;
    if (!a7) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }

  if ((_DWORD)v8 == -1)
  {
    id v18 = 0LL;
    BOOL v24 = 1;
    goto LABEL_21;
  }

  id v19 = v11;
  uint64_t v20 = opendir((const char *)[v19 fileSystemRepresentation]);
  if (!v20)
  {
    v35 = (void *)*MEMORY[0x189607688];
    uint64_t v36 = *__error();
    [v19 path];
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = __error();
    strerror(*v37);
    _CreateError( (uint64_t)"-[MIFileManager createDirectoryAtURL:withIntermediateDirectories:mode:class:error:]",  175LL,  v35,  v36,  0LL,  0LL,  @"opendir of %@ failed: %s",  v38,  (uint64_t)v32);
    goto LABEL_14;
  }

  uint64_t v21 = v20;
  int v22 = dirfd(v20);
  int v23 = fcntl(v22, 64, v8);
  BOOL v24 = v23 == 0;
  if (v23)
  {
    id v25 = (void *)*MEMORY[0x189607688];
    uint64_t v26 = *__error();
    [v19 path];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v28 = __error();
    strerror(*v28);
    _CreateError( (uint64_t)"-[MIFileManager createDirectoryAtURL:withIntermediateDirectories:mode:class:error:]",  181LL,  v25,  v26,  0LL,  0LL,  @"Failed to setclass(%d) on directory %@: %s",  v29,  v8);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v18 = 0LL;
  }

  closedir(v21);
  if (a7)
  {
LABEL_19:
    if (!v24)
    {
      id v18 = v18;
      BOOL v24 = 0;
      *a7 = v18;
    }
  }

- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 mode:(unsigned __int16)a5 error:(id *)a6
{
  return -[MIFileManager createDirectoryAtURL:withIntermediateDirectories:mode:class:error:]( self,  "createDirectoryAtURL:withIntermediateDirectories:mode:class:error:",  a3,  a4,  a5,  0xFFFFFFFFLL,  a6);
}

- (BOOL)_copyItemAtURL:(id)a3 toURL:(id)a4 failIfSrcMissing:(BOOL)a5 alwaysClone:(BOOL)a6 ignoreErrors:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v13 = a3;
  id v14 = a4;
  uint64_t v15 = (void *)objc_opt_new();
  [v15 setIgnoreErrors:v9];
  [v15 setError:0];
  if (a5
    || (memset(&v42, 0, sizeof(v42)),
        id v16 = v13,
        !lstat((const char *)[v16 fileSystemRepresentation], &v42)))
  {
    memset(&v41, 0, sizeof(v41));
    id v20 = v14;
    if (lstat((const char *)[v20 fileSystemRepresentation], &v41) || (v41.st_mode & 0xF000) != 0x4000)
    {
      if (v10) {
        copyfile_flags_t v24 = 34373647;
      }
      else {
        copyfile_flags_t v24 = 17596431;
      }
      id v25 = copyfile_state_alloc();
      copyfile_state_set(v25, 6u, _CopyfileStatusCallback);
      copyfile_state_set(v25, 7u, v15);
      id v26 = v13;
      v27 = (const char *)[v26 fileSystemRepresentation];
      id v28 = v20;
      int v29 = copyfile(v27, (const char *)[v28 fileSystemRepresentation], v25, v24);
      BOOL v18 = v29 == 0;
      if (v29)
      {
        [v15 error];
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v31 = v30;
        if (v30)
        {
          id v19 = v30;
        }

        else
        {
          int v35 = *__error();
          v40 = (void *)*MEMORY[0x189607688];
          [v26 path];
          uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
          [v28 path];
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          strerror(v35);
          _CreateError( (uint64_t)"-[MIFileManager _copyItemAtURL:toURL:failIfSrcMissing:alwaysClone:ignoreErrors:error:]",  334LL,  v40,  v35,  0LL,  0LL,  @"copyfile of %@ to %@ failed: %s",  v37,  (uint64_t)v36);
          id v19 = (id)objc_claimAutoreleasedReturnValue();
        }

        if (!v25) {
          goto LABEL_20;
        }
      }

      else
      {
        id v19 = 0LL;
        if (!v25) {
          goto LABEL_20;
        }
      }

      copyfile_state_free(v25);
    }

    else
    {
      uint64_t v21 = (void *)*MEMORY[0x189607688];
      [v20 path];
      int v22 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateError( (uint64_t)"-[MIFileManager _copyItemAtURL:toURL:failIfSrcMissing:alwaysClone:ignoreErrors:error:]",  300LL,  v21,  17LL,  0LL,  0LL,  @"Destination %@ exists and is a directory",  v23,  (uint64_t)v22);
      id v19 = (id)objc_claimAutoreleasedReturnValue();

      BOOL v18 = 0;
    }
  }

  else
  {
    uint64_t v17 = *__error();
    BOOL v18 = v17 == 2;
    if ((_DWORD)v17 == 2)
    {
      id v19 = 0LL;
    }

    else
    {
      v32 = (void *)*MEMORY[0x189607688];
      [v16 path];
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      strerror(v17);
      _CreateError( (uint64_t)"-[MIFileManager _copyItemAtURL:toURL:failIfSrcMissing:alwaysClone:ignoreErrors:error:]",  289LL,  v32,  v17,  0LL,  0LL,  @"stat of %@ failed: %s",  v34,  (uint64_t)v33);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

- (BOOL)_moveItemAtURL:(id)a3 toURL:(id)a4 failIfSrcMissing:(BOOL)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = v10;
  id v13 = (const char *)[v12 fileSystemRepresentation];
  id v14 = v11;
  uint64_t v15 = (const char *)[v14 fileSystemRepresentation];
  if (!a5)
  {
    memset(&v42, 0, sizeof(v42));
    if (lstat(v13, &v42))
    {
      id v16 = __error();
      uint64_t v17 = *v16;
      LOBYTE(v18) = v17 == 2;
      if ((_DWORD)v17 == 2)
      {
        id v19 = 0LL;
        if (!a6) {
          goto LABEL_28;
        }
LABEL_25:
        if (!v18)
        {
          id v32 = v19;
          LOBYTE(v18) = 0;
          *a6 = v32;
          goto LABEL_29;
        }

- (BOOL)copyItemAtURL:(id)a3 toURL:(id)a4 alwaysClone:(BOOL)a5 error:(id *)a6
{
  return -[MIFileManager _copyItemAtURL:toURL:failIfSrcMissing:alwaysClone:ignoreErrors:error:]( self,  "_copyItemAtURL:toURL:failIfSrcMissing:alwaysClone:ignoreErrors:error:",  a3,  a4,  0LL,  a5,  0LL,  a6);
}

- (BOOL)copyItemIfExistsAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return -[MIFileManager _copyItemAtURL:toURL:failIfSrcMissing:alwaysClone:ignoreErrors:error:]( self,  "_copyItemAtURL:toURL:failIfSrcMissing:alwaysClone:ignoreErrors:error:",  a3,  a4,  0LL,  0LL,  0LL,  a5);
}

- (BOOL)moveItemIfExistsAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return -[MIFileManager _moveItemAtURL:toURL:failIfSrcMissing:error:]( self,  "_moveItemAtURL:toURL:failIfSrcMissing:error:",  a3,  a4,  0LL,  a5);
}

- (BOOL)copyItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return -[MIFileManager _copyItemAtURL:toURL:failIfSrcMissing:alwaysClone:ignoreErrors:error:]( self,  "_copyItemAtURL:toURL:failIfSrcMissing:alwaysClone:ignoreErrors:error:",  a3,  a4,  1LL,  0LL,  0LL,  a5);
}

- (BOOL)copyItemIgnoringErrorsAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return -[MIFileManager _copyItemAtURL:toURL:failIfSrcMissing:alwaysClone:ignoreErrors:error:]( self,  "_copyItemAtURL:toURL:failIfSrcMissing:alwaysClone:ignoreErrors:error:",  a3,  a4,  1LL,  0LL,  1LL,  a5);
}

- (BOOL)moveItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return -[MIFileManager _moveItemAtURL:toURL:failIfSrcMissing:error:]( self,  "_moveItemAtURL:toURL:failIfSrcMissing:error:",  a3,  a4,  1LL,  a5);
}

- (id)createTemporaryDirectoryInDirectoryURL:(id)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x1895F89C0];
  if (a4) {
    *a4 = 0LL;
  }
  id v5 = [a3 URLByAppendingPathComponent:@"temp.XXXXXX" isDirectory:1];
  BOOL v6 = strdup((const char *)[v5 fileSystemRepresentation]);
  if (mkdtemp(v6))
  {
    [MEMORY[0x189604030] fileURLWithFileSystemRepresentation:v6 isDirectory:1 relativeToURL:0];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    free(v6);
  }

  else
  {
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:*__error() userInfo:0];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = @"PathArgument";
    v14[0] = v5;
    [MEMORY[0x189603F68] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIFileManager createTemporaryDirectoryInDirectoryURL:error:]",  452LL,  @"MIInstallerErrorDomain",  4LL,  v8,  v9,  @"Failed to create temp dir at path %s",  v10,  (uint64_t)v6);
    id v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4) {
      *a4 = v11;
    }
    free(v6);

    id v7 = 0LL;
  }

  return v7;
}

- (BOOL)_removeACLAtPath:(const char *)a3 isDir:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  acl_t v8 = acl_init(0);
  if (v8)
  {
    acl_t v9 = v8;
    if (v6)
    {
      uint64_t v10 = opendir(a3);
      if (v10)
      {
        id v11 = v10;
        if (dirfd(v10) < 0)
        {
          v48 = (void *)*MEMORY[0x189607688];
          uint64_t v49 = *__error();
          v50 = __error();
          strerror(*v50);
          _CreateError( (uint64_t)"-[MIFileManager _removeACLAtPath:isDir:error:]",  485LL,  v48,  v49,  0LL,  0LL,  @"dirfd of %s failed: %s",  v51,  (uint64_t)a3);
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v18 = 485LL;
        }

        else
        {
          if (!MEMORY[0x186E269BC]())
          {
            uint64_t v26 = 0LL;
            BOOL v27 = 1;
            goto LABEL_20;
          }

          id v12 = (void *)*MEMORY[0x189607688];
          uint64_t v13 = *__error();
          id v14 = __error();
          strerror(*v14);
          _CreateError( (uint64_t)"-[MIFileManager _removeACLAtPath:isDir:error:]",  490LL,  v12,  v13,  0LL,  0LL,  @"Failed to set ACL on dir %s: %s",  v15,  (uint64_t)a3);
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v18 = 490LL;
        }

        _CreateAndLogError( (uint64_t)"-[MIFileManager _removeACLAtPath:isDir:error:]",  v18,  @"MIInstallerErrorDomain",  4LL,  v17,  0LL,  @"Failed to remove ACL",  v16,  v53);
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();

        BOOL v27 = 0;
LABEL_20:
        closedir(v11);
        goto LABEL_21;
      }

      uint64_t v37 = (void *)*MEMORY[0x189607688];
      uint64_t v38 = *__error();
      v39 = __error();
      strerror(*v39);
      _CreateError( (uint64_t)"-[MIFileManager _removeACLAtPath:isDir:error:]",  479LL,  v37,  v38,  0LL,  0LL,  @"opendir of %s failed: %s",  v40,  (uint64_t)a3);
      stat v42 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v43 = 479LL;
    }

    else
    {
      int v28 = open(a3, 2097154);
      if ((v28 & 0x80000000) == 0)
      {
        int v29 = v28;
        int v30 = MEMORY[0x186E269BC]();
        BOOL v27 = v30 == 0;
        if (v30)
        {
          BOOL v31 = (void *)*MEMORY[0x189607688];
          uint64_t v32 = *__error();
          v33 = __error();
          strerror(*v33);
          _CreateError( (uint64_t)"-[MIFileManager _removeACLAtPath:isDir:error:]",  501LL,  v31,  v32,  0LL,  0LL,  @"Failed to set ACL on %s: %s",  v34,  (uint64_t)a3);
          int v35 = (void *)objc_claimAutoreleasedReturnValue();
          _CreateAndLogError( (uint64_t)"-[MIFileManager _removeACLAtPath:isDir:error:]",  501LL,  @"MIInstallerErrorDomain",  4LL,  v35,  0LL,  @"Failed to remove ACL",  v36,  v55);
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          uint64_t v26 = 0LL;
        }

        close(v29);
LABEL_21:
        acl_free(v9);
        if (!a5) {
          goto LABEL_24;
        }
        goto LABEL_22;
      }

      v44 = (void *)*MEMORY[0x189607688];
      uint64_t v45 = *__error();
      v46 = __error();
      strerror(*v46);
      _CreateError( (uint64_t)"-[MIFileManager _removeACLAtPath:isDir:error:]",  496LL,  v44,  v45,  0LL,  0LL,  @"open of %s failed: %s",  v47,  (uint64_t)a3);
      stat v42 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v43 = 496LL;
    }

    _CreateAndLogError( (uint64_t)"-[MIFileManager _removeACLAtPath:isDir:error:]",  v43,  @"MIInstallerErrorDomain",  4LL,  v42,  0LL,  @"Failed to remove ACL",  v41,  v56);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();

    BOOL v27 = 0;
    goto LABEL_21;
  }

  id v19 = (void *)*MEMORY[0x189607688];
  uint64_t v20 = *__error();
  uint64_t v21 = __error();
  uint64_t v22 = strerror(*v21);
  _CreateError( (uint64_t)"-[MIFileManager _removeACLAtPath:isDir:error:]",  472LL,  v19,  v20,  0LL,  0LL,  @"acl_init() failed: %s",  v23,  (uint64_t)v22);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  _CreateAndLogError( (uint64_t)"-[MIFileManager _removeACLAtPath:isDir:error:]",  472LL,  @"MIInstallerErrorDomain",  4LL,  v24,  0LL,  @"Failed to remove ACL",  v25,  v54);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();

  BOOL v27 = 0;
  if (!a5) {
    goto LABEL_24;
  }
LABEL_22:
  if (!v27) {
    *a5 = v26;
  }
LABEL_24:

  return v27;
}

- (BOOL)bulkSetPropertiesForPath:(const char *)a3 withOpenFD:(int)a4 UID:(unsigned int)a5 GID:(unsigned int)a6 mode:(unsigned __int16)a7 flags:(unsigned int)a8 dataProtectionClass:(int)a9 removeACL:(BOOL)a10 error:(id *)a11
{
  return -[MIFileManager _bulkSetPropertiesForPath:existingFD:UID:GID:mode:flags:dataProtectionClass:removeACL:error:]( self,  "_bulkSetPropertiesForPath:existingFD:UID:GID:mode:flags:dataProtectionClass:removeACL:error:",  a3,  *(void *)&a4,  *(void *)&a5,  *(void *)&a6,  a7,  *(void *)&a8);
}

- (BOOL)bulkSetPropertiesForPath:(const char *)a3 UID:(unsigned int)a4 GID:(unsigned int)a5 mode:(unsigned __int16)a6 flags:(unsigned int)a7 dataProtectionClass:(int)a8 removeACL:(BOOL)a9 error:(id *)a10
{
  return -[MIFileManager _bulkSetPropertiesForPath:existingFD:UID:GID:mode:flags:dataProtectionClass:removeACL:error:]( self,  "_bulkSetPropertiesForPath:existingFD:UID:GID:mode:flags:dataProtectionClass:removeACL:error:",  a3,  0xFFFFFFFFLL,  *(void *)&a4,  *(void *)&a5,  a6,  *(void *)&a7);
}

- (BOOL)_bulkSetPropertiesForPath:(const char *)a3 existingFD:(int)a4 UID:(unsigned int)a5 GID:(unsigned int)a6 mode:(unsigned __int16)a7 flags:(unsigned int)a8 dataProtectionClass:(int)a9 removeACL:(BOOL)a10 error:(id *)a11
{
  int v33 = a4;
  uint64_t v34 = a3;
  v36[3] = *MEMORY[0x1895F89C0];
  v36[0] = 5LL;
  v36[1] = 0LL;
  v36[2] = 0LL;
  ssize_t v15 = acl_size((acl_t)1);
  int v35 = v32;
  uint64_t v16 = v15 + 28;
  if (!a10) {
    uint64_t v16 = 28LL;
  }
  uint64_t v17 = (unsigned int *)&v32[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  size_t v18 = 12LL;
  if (a9 == -1) {
    uint64_t v19 = 8LL;
  }
  else {
    uint64_t v19 = 12LL;
  }
  if (geteuid())
  {
    int v20 = 0;
    uint64_t v21 = v17;
  }

  else
  {
    *uint64_t v17 = a5;
    uint64_t v21 = v17 + 1;
    int v20 = 0x8000;
    size_t v18 = 16LL;
  }

  *uint64_t v21 = a6;
  v21[1] = a7 & 0xFFF;
  v21[2] = a8;
  uint64_t v22 = (int *)(v21 + 3);
  int v23 = v20 | 0x70000;
  HIDWORD(v36[0]) = v20 | 0x70000;
  if (a10)
  {
    *(void *)(v21 + 3) = v19;
    v18 += 8LL;
    uint64_t v24 = v21 + 3;
    uint64_t v22 = (int *)(v21 + 5);
    int v23 = v20 | 0x470000;
    HIDWORD(v36[0]) = v20 | 0x470000;
  }

  else
  {
    uint64_t v24 = 0LL;
  }

  if (a9 != -1)
  {
    *v22++ = a9;
    v18 += 4LL;
    HIDWORD(v36[0]) = v23 | 0x40000000;
  }

  if (a10)
  {
    ssize_t v25 = acl_copy_ext_native(v22, (acl_t)1, v15);
    if (v25 > v15)
    {
      _CreateAndLogError( (uint64_t)"-[MIFileManager _bulkSetPropertiesForPath:existingFD:UID:GID:mode:flags:dataProtectionClass:removeACL:error:]",  632LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"acl_copy_ext_native returned size %zd which was more than we had allocated (%zd)",  v26,  v25);
      goto LABEL_21;
    }

    v24[1] = v25;
    v18 += v25;
  }

  if (v33 < 0)
  {
    if (setattrlist(v34, v36, v17, v18, 1u)) {
      goto LABEL_20;
    }
LABEL_24:
    id v29 = 0LL;
    BOOL v30 = 1;
    goto LABEL_26;
  }

  if (!fsetattrlist(v33, v36, v17, v18, 0)) {
    goto LABEL_24;
  }
LABEL_20:
  uint64_t v27 = *__error();
  _CreateAndLogError( (uint64_t)"-[MIFileManager _bulkSetPropertiesForPath:existingFD:UID:GID:mode:flags:dataProtectionClass:removeACL:error:]",  651LL,  (void *)*MEMORY[0x189607688],  v27,  0LL,  0LL,  @"setattrlist failed for file %s",  v28,  (uint64_t)v34);
LABEL_21:
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  if (a11)
  {
    id v29 = v29;
    BOOL v30 = 0;
    *a11 = v29;
  }

  else
  {
    BOOL v30 = 0;
  }

- (BOOL)stageURLByMoving:(id)a3 toItemName:(id)a4 inStagingDir:(id)a5 settingUID:(unsigned int)a6 gid:(unsigned int)a7 dataProtectionClass:(int)a8 breakHardlinks:(BOOL)a9 hasSymlink:(BOOL *)a10 error:(id *)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  uint64_t v51 = 0LL;
  v52 = &v51;
  uint64_t v53 = 0x2020000000LL;
  char v54 = 0;
  uint64_t v45 = 0LL;
  v46 = &v45;
  uint64_t v47 = 0x3032000000LL;
  v48 = __Block_byref_object_copy__9;
  uint64_t v49 = __Block_byref_object_dispose__9;
  id v50 = 0LL;
  [v19 URLByAppendingPathComponent:v18 isDirectory:0];
  int v20 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = (void *)objc_opt_new();
  id v44 = 0LL;
  LOBYTE(a5) = -[MIFileManager moveItemAtURL:toURL:error:](self, "moveItemAtURL:toURL:error:", v17, v20, &v44);
  uint64_t v32 = v17;
  id v22 = v44;
  if ((a5 & 1) == 0)
  {
LABEL_9:
    if (a11)
    {
      if (v22)
      {
        id v29 = v22;
        id v22 = v29;
      }

      else
      {
        id v29 = (id) v46[5];
      }

      BOOL v30 = 0;
      *a11 = v29;
    }

    else
    {
      BOOL v30 = 0;
    }

    goto LABEL_15;
  }

  uint64_t v23 = [v20 fileSystemRepresentation];
  id v43 = v22;
  v34[0] = MEMORY[0x1895F87A8];
  v34[1] = 3221225472LL;
  v34[2] = __125__MIFileManager_stageURLByMoving_toItemName_inStagingDir_settingUID_gid_dataProtectionClass_breakHardlinks_hasSymlink_error___block_invoke;
  v34[3] = &unk_189D49100;
  v34[4] = self;
  id v35 = v19;
  unsigned int v39 = a6;
  unsigned int v40 = a7;
  int v41 = a8;
  BOOL v42 = a9;
  id v24 = v21;
  id v36 = v24;
  uint64_t v37 = &v45;
  uint64_t v38 = &v51;
  int v25 = TraverseDirectory(v23, 0, 0x88u, &v43, v34);
  id v26 = v43;

  if (v26) {
    int v27 = 0;
  }
  else {
    int v27 = v25;
  }
  if (v27 != 1)
  {

    id v22 = v26;
    goto LABEL_9;
  }

  uint64_t v28 = v46[5];

  if (v28
    || [v24 count]
    && (v33[0] = MEMORY[0x1895F87A8],
        v33[1] = 3221225472LL,
        v33[2] = __125__MIFileManager_stageURLByMoving_toItemName_inStagingDir_settingUID_gid_dataProtectionClass_breakHardlinks_hasSymlink_error___block_invoke_2,
        v33[3] = &unk_189D49128,
        v33[4] = self,
        v33[5] = &v45,
        [v24 enumerateKeysAndObjectsUsingBlock:v33],
        v46[5]))
  {
    id v22 = 0LL;
    goto LABEL_9;
  }

  id v22 = 0LL;
  if (a10) {
    *a10 = *((_BYTE *)v52 + 24);
  }
  BOOL v30 = 1;
LABEL_15:

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);

  return v30;
}

uint64_t __125__MIFileManager_stageURLByMoving_toItemName_inStagingDir_settingUID_gid_dataProtectionClass_breakHardlinks_hasSymlink_error___block_invoke( uint64_t a1,  uint64_t a2)
{
  v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(unsigned int *)(a1 + 72);
  unsigned int v50 = *(_DWORD *)(a1 + 76);
  int v6 = *(_DWORD *)(a1 + 80);
  int v7 = *(unsigned __int8 *)(a1 + 84);
  acl_t v8 = *(void **)(a1 + 48);
  id v9 = *(id *)(a1 + 32);
  id v10 = v4;
  id v11 = v8;
  unsigned __int8 v56 = 0;
  int v12 = *(_DWORD *)(a2 + 56);
  uint64_t v13 = *(const char **)(a2 + 16);
  v52 = v11;
  uint64_t v53 = v10;
  if (v12 != 1)
  {
    if (v12 == 2)
    {
      int v14 = 0;
      uint64_t v17 = 0xFFFFFFFFLL;
      uint64_t v23 = 493LL;
    }

    else
    {
      if (v12 == 5)
      {
        int v14 = 1;
        unsigned __int8 v56 = 1;
      }

      else
      {
        int v14 = 0;
      }

      uint64_t v17 = 0xFFFFFFFFLL;
      uint64_t v23 = 420LL;
    }

    goto LABEL_18;
  }

  ssize_t v15 = v11;
  uint64_t v16 = open(v13, 256);
  uint64_t v17 = v16;
  if ((v16 & 0x80000000) != 0)
  {
    int v32 = *__error();
    int v33 = (void *)*MEMORY[0x189607688];
    uint64_t v34 = v32;
    strerror(v32);
    _CreateAndLogError( (uint64_t)"_StageURLByMovingProcessItem",  705LL,  v33,  v34,  0LL,  0LL,  @"Failed to open %s : %s",  v35,  (uint64_t)v13);
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    id v26 = v9;
    goto LABEL_27;
  }

  int v49 = *(_DWORD *)(a2 + 76);
  LODWORD(v55) = 0;
  id v18 = (const char *)ffsctl(v16, 0xC0044115uLL, &v55, 0);
  if ((_DWORD)v18)
  {
    id v19 = v18;
    if (*__error() != 16)
    {
      int v20 = __error();
      uint64_t v21 = *v20;
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        uint64_t v47 = strerror(*v20);
        v48 = v13;
        id v44 = v19;
        uint64_t v46 = v21;
        MOLogWrite();
      }
    }

    uint64_t v22 = gLogHandle;
    if (v49 == 1)
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      {
        id v44 = v13;
LABEL_40:
        MOLogWrite();
        goto LABEL_41;
      }

      goto LABEL_41;
    }
  }

  else
  {
    int v14 = 0;
    uint64_t v23 = 420LL;
    if (!v7 || v49 == 1)
    {
LABEL_18:
      if ((*(_BYTE *)(a2 + 48) & 0x20) != 0)
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
        {
          HIDWORD(v44) = HIDWORD(v13);
          MOLogWrite();
        }

        uint64_t v24 = 32LL;
      }

      else
      {
        uint64_t v24 = 0LL;
      }

      id v55 = 0LL;
      uint64_t v25 = 1LL;
      BYTE4(v44) = 1;
      LODWORD(v44) = v6;
      id v26 = v9;
      char v27 = objc_msgSend( v9,  "bulkSetPropertiesForPath:withOpenFD:UID:GID:mode:flags:dataProtectionClass:removeACL:error:",  v13,  v17,  v5,  v50,  v23,  v24,  v44,  &v55);
      id v28 = v55;
      if ((v27 & 1) != 0)
      {
        id v29 = 0LL;
        ssize_t v15 = v52;
        goto LABEL_28;
      }

      ssize_t v15 = v52;
LABEL_27:
      id v28 = v28;
      uint64_t v25 = 0LL;
      int v14 = v56;
      id v29 = v28;
LABEL_28:
      if ((v17 & 0x80000000) != 0) {
        goto LABEL_30;
      }
      goto LABEL_29;
    }

    uint64_t v22 = gLogHandle;
    id v10 = v53;
  }

  if (!v22 || *(int *)(v22 + 44) >= 5)
  {
    id v44 = v13;
    goto LABEL_40;
  }

void __125__MIFileManager_stageURLByMoving_toItemName_inStagingDir_settingUID_gid_dataProtectionClass_breakHardlinks_hasSymlink_error___block_invoke_2( uint64_t a1,  void *a2,  void *a3,  _BYTE *a4)
{
  id v7 = a3;
  acl_t v8 = *(void **)(a1 + 32);
  id v21 = 0LL;
  id v9 = a2;
  LOBYTE(v8) = [v8 moveItemAtURL:v9 toURL:v7 error:&v21];
  id v10 = v21;
  if ((v8 & 1) != 0)
  {
    [v9 URLByDeletingLastPathComponent];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();

    id v12 = v11;
    uint64_t v13 = (const char *)[v12 fileSystemRepresentation];

    if (rmdir(v13))
    {
      int v14 = *__error();
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      {
        strerror(v14);
        MOLogWrite();
      }
    }
  }

  else
  {
    [v9 path];
    ssize_t v15 = (void *)objc_claimAutoreleasedReturnValue();

    [v7 path];
    int v20 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = _CreateAndLogError( (uint64_t)"-[MIFileManager stageURLByMoving:toItemName:inStagingDir:settingUID:gid:dataProtectionClass:breakHardlink s:hasSymlink:error:]_block_invoke_2",  810LL,  @"MIInstallerErrorDomain",  4LL,  v10,  0LL,  @"Failed to move clone replaced file from %@ to %@",  v16,  (uint64_t)v15);
    uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    *a4 = 1;
  }
}

- (BOOL)_stageURLByCopying:(id)a3 toItemName:(id)a4 inStagingDir:(id)a5 stagingMode:(int)a6 settingUID:(unsigned int)a7 gid:(unsigned int)a8 dataProtectionClass:(int)a9 hasSymlink:(BOOL *)a10 error:(id *)a11
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  uint64_t v49 = 0LL;
  unsigned int v50 = &v49;
  uint64_t v51 = 0x2020000000LL;
  char v52 = 0;
  uint64_t v43 = 0LL;
  id v44 = &v43;
  uint64_t v45 = 0x3032000000LL;
  uint64_t v46 = __Block_byref_object_copy__9;
  uint64_t v47 = __Block_byref_object_dispose__9;
  id v48 = 0LL;
  v41[0] = 0LL;
  v41[1] = v41;
  v41[2] = 0x2020000000LL;
  char v42 = 0;
  v39[0] = 0LL;
  v39[1] = v39;
  v39[2] = 0x2020000000LL;
  char v40 = 0;
  id v20 = [v19 URLByAppendingPathComponent:v18 isDirectory:0];
  [v20 fileSystemRepresentation];
  unint64_t v21 = __strlcpy_chk();
  v38[0] = 0LL;
  v38[1] = v38;
  v38[2] = 0x2020000000LL;
  v38[3] = v21;
  if (v21 < 0x400)
  {
    uint64_t v25 = [v17 fileSystemRepresentation];
    id v37 = 0LL;
    v32[0] = MEMORY[0x1895F87A8];
    v32[1] = 3221225472LL;
    v32[2] = __124__MIFileManager__stageURLByCopying_toItemName_inStagingDir_stagingMode_settingUID_gid_dataProtectionClass_hasSymlink_error___block_invoke;
    v32[3] = &unk_189D49150;
    v32[6] = v38;
    v32[7] = &v43;
    v32[8] = v39;
    v32[9] = &v49;
    v32[10] = v53;
    v32[4] = self;
    v32[5] = v41;
    int v33 = a6;
    unsigned int v34 = a7;
    unsigned int v35 = a8;
    int v36 = a9;
    v31[0] = MEMORY[0x1895F87A8];
    v31[1] = 3221225472LL;
    v31[2] = __124__MIFileManager__stageURLByCopying_toItemName_inStagingDir_stagingMode_settingUID_gid_dataProtectionClass_hasSymlink_error___block_invoke_2;
    v31[3] = &unk_189D49178;
    v31[4] = v38;
    v31[5] = v53;
    int v26 = TraverseDirectoryWithPostTraversal(v25, 0, 8u, &v37, v32, v31);
    unint64_t v27 = (unint64_t)v37;
    uint64_t v24 = (void *)v27;
    if (v26 && !(v44[5] | v27))
    {
      uint64_t v24 = 0LL;
      *a10 = *((_BYTE *)v50 + 24);
      BOOL v29 = 1;
      goto LABEL_11;
    }
  }

  else
  {
    uint64_t v22 = [v20 fileSystemRepresentation];
    _CreateAndLogError( (uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass :hasSymlink:error:]",  912LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Staging destination path was too long: %s (%zu)",  v23,  v22);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (a11)
  {
    if (v24)
    {
      id v28 = v24;
      uint64_t v24 = v28;
      BOOL v29 = 0;
    }

    else
    {
      id v28 = (id) v44[5];
      BOOL v29 = 0;
      uint64_t v24 = 0LL;
    }

    *a11 = v28;
  }

  else
  {
    BOOL v29 = 0;
  }

uint64_t __124__MIFileManager__stageURLByCopying_toItemName_inStagingDir_stagingMode_settingUID_gid_dataProtectionClass_hasSymlink_error___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v100 = *MEMORY[0x1895F89C0];
  id v10 = *(const char **)(a2 + 32);
  if ((*(_BYTE *)(a2 + 48) & 0x20) != 0 && *(_DWORD *)(a2 + 56) == 1 && (*(_DWORD *)(a1 + 88) & 0xFFFFFFFE) == 2)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      uint64_t v97 = *(void *)(a2 + 16);
      MOLogWrite();
    }

    uint64_t v11 = 32LL;
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8LL);
  if (*(_BYTE *)(v12 + 24))
  {
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8LL);
    size_t v14 = strlen(v10);
    uint64_t v15 = *(void *)(v13 + 24);
    unint64_t v16 = v15 + 1 + v14;
    if (v16 <= 0x3FF)
    {
      uint64_t v17 = *(void *)(a1 + 80);
      *(_BYTE *)(v17 + v15) = 47;
      memcpy((void *)(v17 + v15 + 1), v10, v14);
      *(_BYTE *)(v17 + v16) = 0;
      *(void *)(v13 + 24) = v16;
    }
  }

  else
  {
    *(_BYTE *)(v12 + 24) = 1;
  }

  int v18 = *(_DWORD *)(a2 + 56);
  if (v18 == 1)
  {
    int v27 = *(_DWORD *)(a1 + 88);
    switch(v27)
    {
      case 1:
        if (copyfile(*(const char **)(a2 + 16), *(const char **)(a1 + 80), 0LL, 0xC0008u))
        {
          int v63 = *__error();
          v64 = (void *)*MEMORY[0x189607688];
          uint64_t v65 = v63;
          uint64_t v66 = *(void *)(a2 + 16);
          strerror(v63);
          _CreateError( (uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectio nClass:hasSymlink:error:]_block_invoke",  992LL,  v64,  v65,  0LL,  0LL,  @"copyfile failed for %s to %s: %s",  v67,  v66);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          _CreateAndLogError( (uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectio nClass:hasSymlink:error:]_block_invoke",  992LL,  @"MIInstallerErrorDomain",  4LL,  v61,  &unk_189D64AB0,  @"Failed to copyfile %s to %s",  v68,  *(void *)(a2 + 16));
          goto LABEL_43;
        }

        break;
      case 3:
        if (link(*(const char **)(a2 + 16), *(const char **)(a1 + 80)))
        {
          int v69 = *__error();
          v70 = (void *)*MEMORY[0x189607688];
          uint64_t v71 = v69;
          uint64_t v72 = *(void *)(a2 + 16);
          strerror(v69);
          _CreateError( (uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectio nClass:hasSymlink:error:]_block_invoke",  1002LL,  v70,  v71,  0LL,  0LL,  @"link failed for %s to %s: %s",  v73,  v72);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          _CreateAndLogError( (uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectio nClass:hasSymlink:error:]_block_invoke",  1002LL,  @"MIInstallerErrorDomain",  4LL,  v61,  &unk_189D64AD8,  @"Failed to link %s to %s",  v74,  *(void *)(a2 + 16));
          goto LABEL_43;
        }

        break;
      case 2:
        id v28 = (uint64_t *)(a2 + 16);
        if (clonefile(*(const char **)(a2 + 16), *(const char **)(a1 + 80), 3u))
        {
          BOOL v29 = __error();
          uint64_t v30 = *v29;
          if ((_DWORD)v30 != 18)
          {
            v93 = (void *)*MEMORY[0x189607688];
            uint64_t v94 = *v28;
            strerror(*v29);
            _CreateError( (uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtect ionClass:hasSymlink:error:]_block_invoke",  981LL,  v93,  v30,  0LL,  0LL,  @"clonefile failed for %s to %s: %s",  v95,  v94);
            uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
            _CreateAndLogError( (uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtect ionClass:hasSymlink:error:]_block_invoke",  981LL,  @"MIInstallerErrorDomain",  4LL,  v25,  &unk_189D64A88,  @"Failed to clonefile %s to %s",  v96,  *v28);
            goto LABEL_35;
          }

          if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL))
          {
            if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT)) {
              __124__MIFileManager__stageURLByCopying_toItemName_inStagingDir_stagingMode_settingUID_gid_dataProtectionClass_hasSymlink_error___block_invoke_cold_1( a2 + 16,  a1 + 80,  v31,  v32,  v33,  v34,  v35,  v36);
            }
            if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
            {
              uint64_t v97 = *v28;
              MOLogWrite();
            }

            *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 1;
          }

          if (copyfile((const char *)*v28, *(const char **)(a1 + 80), 0LL, 0xC0008u))
          {
            int v37 = *__error();
            id v38 = (void *)*MEMORY[0x189607688];
            uint64_t v39 = v37;
            uint64_t v40 = *v28;
            strerror(v37);
            _CreateError( (uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtect ionClass:hasSymlink:error:]_block_invoke",  977LL,  v38,  v39,  0LL,  0LL,  @"copyfile after clonefile failed for %s to %s: %s",  v41,  v40);
            uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
            _CreateAndLogError( (uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtect ionClass:hasSymlink:error:]_block_invoke",  977LL,  @"MIInstallerErrorDomain",  4LL,  v25,  &unk_189D64A60,  @"Failed to copyfile %s to %s",  v42,  *v28);
            goto LABEL_35;
          }
        }

        break;
      default:
        _CreateAndLogError( (uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionC lass:hasSymlink:error:]_block_invoke",  1009LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Unexpected staging mode: %d",  a8,  *(unsigned int *)(a1 + 88));
        goto LABEL_37;
    }

uint64_t __124__MIFileManager__stageURLByCopying_toItemName_inStagingDir_stagingMode_settingUID_gid_dataProtectionClass_hasSymlink_error___block_invoke_2( uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8LL);
  unsigned __int16 v3 = *(_WORD *)(v2 + 24);
  if (v3)
  {
    do
      uint64_t v4 = --v3;
    while (*(_BYTE *)(v1 + v3) != 47 && v3 != 0);
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  *(_BYTE *)(v1 + v4) = 0;
  *(void *)(v2 + 24) = v4;
  return 1LL;
}

- (BOOL)stageURL:(id)a3 toItemName:(id)a4 inStagingDir:(id)a5 stagingMode:(int)a6 settingUID:(unsigned int)a7 gid:(unsigned int)a8 hasSymlink:(BOOL *)a9 error:(id *)a10
{
  if (a6)
  {
    LODWORD(v11) = 4;
    return -[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSymlink:error:]( self,  "_stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSymlink:error:",  a3,  a4,  a5,  *(void *)&a6,  *(void *)&a7,  *(void *)&a8,  v11,  a9,  a10);
  }

  else
  {
    LOBYTE(v11) = 1;
    return -[MIFileManager stageURLByMoving:toItemName:inStagingDir:settingUID:gid:dataProtectionClass:breakHardlinks:hasSymlink:error:]( self,  "stageURLByMoving:toItemName:inStagingDir:settingUID:gid:dataProtectionClass:breakHardlinks:hasSymlink:error:",  a3,  a4,  a5,  *(void *)&a7,  *(void *)&a8,  4LL,  v11,  a9,  a10);
  }

- (BOOL)standardizeOwnershipAtURL:(id)a3 toUID:(unsigned int)a4 GID:(unsigned int)a5 removeACLs:(BOOL)a6 setProtectionClass:(BOOL)a7 foundSymlink:(BOOL *)a8 error:(id *)a9
{
  uint64_t v33 = 0LL;
  uint64_t v34 = (id *)&v33;
  uint64_t v35 = 0x3032000000LL;
  uint64_t v36 = __Block_byref_object_copy__9;
  int v37 = __Block_byref_object_dispose__9;
  id v38 = 0LL;
  uint64_t v29 = 0LL;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000LL;
  char v32 = 0;
  id v15 = a3;
  uint64_t v16 = [v15 fileSystemRepresentation];
  id v28 = 0LL;
  v23[0] = MEMORY[0x1895F87A8];
  v23[1] = 3221225472LL;
  v23[2] = __102__MIFileManager_standardizeOwnershipAtURL_toUID_GID_removeACLs_setProtectionClass_foundSymlink_error___block_invoke;
  v23[3] = &unk_189D491A0;
  BOOL v26 = a7;
  v23[4] = self;
  v23[5] = &v29;
  unsigned int v24 = a4;
  unsigned int v25 = a5;
  BOOL v27 = a6;
  v23[6] = &v33;
  char v17 = TraverseDirectory(v16, 0, 8u, &v28, v23);
  id v18 = v28;
  id v19 = v28;
  int v20 = v34;
  if ((v17 & 1) == 0 && !v34[5])
  {
    objc_storeStrong(v34 + 5, v18);
    int v20 = v34;
  }

  id v21 = v20[5];
  if (v21) {
    char v17 = 0;
  }
  if (a9 && (v17 & 1) == 0) {
    *a9 = v21;
  }
  if (a8) {
    *a8 = *((_BYTE *)v30 + 24);
  }
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return v17;
}

uint64_t __102__MIFileManager_standardizeOwnershipAtURL_toUID_GID_removeACLs_setProtectionClass_foundSymlink_error___block_invoke( uint64_t a1,  uint64_t a2)
{
  int v4 = *(_DWORD *)(a2 + 56);
  if (v4 == 2) {
    uint64_t v5 = 493LL;
  }
  else {
    uint64_t v5 = 420LL;
  }
  if (v4 == 5) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
  if (*(_BYTE *)(a1 + 64)) {
    uint64_t v6 = 4LL;
  }
  else {
    uint64_t v6 = 0xFFFFFFFFLL;
  }
  if ((*(_BYTE *)(a2 + 48) & 0x20) != 0)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      uint64_t v17 = *(void *)(a2 + 16);
      MOLogWrite();
    }

    uint64_t v7 = 32LL;
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  acl_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a2 + 16);
  uint64_t v10 = *(unsigned int *)(a1 + 56);
  uint64_t v11 = *(unsigned int *)(a1 + 60);
  char v12 = *(_BYTE *)(a1 + 65);
  id v18 = 0LL;
  LOBYTE(v17) = v12;
  uint64_t v13 = [v8 bulkSetPropertiesForPath:v9 UID:v10 GID:v11 mode:v5 flags:v7 dataProtectionClass:v6 removeACL:v17 error:&v18];
  id v14 = v18;
  id v15 = v18;
  if ((v13 & 1) == 0) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), v14);
  }

  return v13;
}

- (BOOL)validateSymlinksInURLDoNotEscapeURL:(id)a3 error:(id *)a4
{
  uint64_t v19 = 0LL;
  int v20 = (id *)&v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = __Block_byref_object_copy__9;
  uint64_t v23 = __Block_byref_object_dispose__9;
  id v24 = 0LL;
  id v6 = a3;
  uint64_t v7 = [v6 fileSystemRepresentation];
  id v18 = 0LL;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __59__MIFileManager_validateSymlinksInURLDoNotEscapeURL_error___block_invoke;
  v15[3] = &unk_189D491C8;
  v15[4] = self;
  id v8 = v6;
  id v16 = v8;
  uint64_t v17 = &v19;
  char v9 = TraverseDirectory(v7, 0, 0, &v18, v15);
  id v10 = v18;
  id v11 = v18;
  char v12 = v20;
  if ((v9 & 1) == 0 && !v20[5])
  {
    objc_storeStrong(v20 + 5, v10);
    char v12 = v20;
  }

  id v13 = v12[5];
  if (v13) {
    char v9 = 0;
  }
  if (a4 && (v9 & 1) == 0) {
    *a4 = v13;
  }

  _Block_object_dispose(&v19, 8);
  return v9;
}

uint64_t __59__MIFileManager_validateSymlinksInURLDoNotEscapeURL_error___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 56) != 5) {
    return 1LL;
  }
  [MEMORY[0x189604030] fileURLWithFileSystemRepresentation:*(void *)(a2 + 16) isDirectory:0 relativeToURL:0];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) realPathForURL:v4 ifChildOfURL:*(void *)(a1 + 40)];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v6 = v5 != 0LL;

  if (!v5)
  {
    uint64_t v8 = _CreateAndLogError( (uint64_t)"-[MIFileManager validateSymlinksInURLDoNotEscapeURL:error:]_block_invoke",  1161LL,  @"MIInstallerErrorDomain",  70LL,  0LL,  &unk_189D64B78,  @"invalid symlink at %s",  v7,  *(void *)(a2 + 16));
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }

  return v6;
}

- (id)enumerateURLsForItemsInDirectoryAtURL:(id)a3 ignoreSymlinks:(BOOL)a4 withBlock:(id)a5
{
  id v7 = a5;
  uint64_t v8 = [a3 fileSystemRepresentation];
  id v18 = 0LL;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __80__MIFileManager_enumerateURLsForItemsInDirectoryAtURL_ignoreSymlinks_withBlock___block_invoke;
  v15[3] = &unk_189D491F0;
  BOOL v17 = a4;
  id v9 = v7;
  id v16 = v9;
  char v10 = TraverseDirectory(v8, 1, 0, &v18, v15);
  id v11 = v18;
  char v12 = v11;
  id v13 = 0LL;
  if ((v10 & 1) == 0) {
    id v13 = v11;
  }

  return v13;
}

uint64_t __80__MIFileManager_enumerateURLsForItemsInDirectoryAtURL_ignoreSymlinks_withBlock___block_invoke( uint64_t a1,  uint64_t a2,  _BYTE *a3)
{
  int v4 = *(_DWORD *)(a2 + 56);
  if (*(_BYTE *)(a1 + 40)) {
    BOOL v5 = v4 == 5;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    return 1LL;
  }

  else
  {
    [MEMORY[0x189604030] fileURLWithFileSystemRepresentation:*(void *)(a2 + 16) isDirectory:v4 == 2 relativeToURL:0];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    *a3 = 0;
    unint64_t v9 = *(unsigned int *)(a2 + 56);
    if (v9 >= 8) {
      char v10 = 0;
    }
    else {
      char v10 = 0x10C0A0206040800uLL >> (8 * v9);
    }
    uint64_t v11 = (*(uint64_t (**)(void, void *, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  v8,  v10 & 0xF);

    return v11;
  }

- (id)traverseDirectoryAtURL:(id)a3 withBlock:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 fileSystemRepresentation];
  id v15 = 0LL;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __50__MIFileManager_traverseDirectoryAtURL_withBlock___block_invoke;
  v13[3] = &unk_189D49218;
  id v7 = v5;
  id v14 = v7;
  char v8 = TraverseDirectory(v6, 1, 0, &v15, v13);
  id v9 = v15;
  char v10 = v9;
  id v11 = 0LL;
  if ((v8 & 1) == 0) {
    id v11 = v9;
  }

  return v11;
}

uint64_t __50__MIFileManager_traverseDirectoryAtURL_withBlock___block_invoke( uint64_t a1,  uint64_t a2,  char *a3)
{
  [MEMORY[0x189604030] fileURLWithFileSystemRepresentation:*(void *)(a2 + 16) isDirectory:*(_DWORD *)(a2 + 56) == 2 relativeToURL:0];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  char v11 = 1;
  unint64_t v7 = *(unsigned int *)(a2 + 56);
  if (v7 >= 8) {
    char v8 = 0;
  }
  else {
    char v8 = 0x10C0A0206040800uLL >> (8 * v7);
  }
  uint64_t v9 = (*(uint64_t (**)(void, void *, void, char *))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  v6,  v8 & 0xF,  &v11);
  *a3 = v11;

  return v9;
}

- (id)urlsForItemsInDirectoryAtURL:(id)a3 ignoringSymlinks:(BOOL)a4 error:(id *)a5
{
  id v7 = a3;
  char v8 = (void *)objc_opt_new();
  uint64_t v25 = 0LL;
  BOOL v26 = (id *)&v25;
  uint64_t v27 = 0x3032000000LL;
  id v28 = __Block_byref_object_copy__9;
  uint64_t v29 = __Block_byref_object_dispose__9;
  id v30 = 0LL;
  id v9 = v7;
  uint64_t v10 = [v9 fileSystemRepresentation];
  id v24 = 0LL;
  uint64_t v17 = MEMORY[0x1895F87A8];
  uint64_t v18 = 3221225472LL;
  uint64_t v19 = __69__MIFileManager_urlsForItemsInDirectoryAtURL_ignoringSymlinks_error___block_invoke;
  int v20 = &unk_189D49240;
  BOOL v23 = a4;
  uint64_t v22 = &v25;
  id v11 = v8;
  id v21 = v11;
  char v12 = TraverseDirectory(v10, 1, 0, &v24, &v17);
  id v13 = v24;
  id v14 = v24;
  if (v26[5])
  {
LABEL_6:
    id v15 = 0LL;
    if (!a5) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }

  if ((v12 & 1) == 0)
  {
    objc_storeStrong(v26 + 5, v13);
    goto LABEL_6;
  }

  id v15 = (void *)objc_msgSend(v11, "copy", v17, v18, v19, v20);
  if (!a5) {
    goto LABEL_9;
  }
LABEL_7:
  if (!v15) {
    *a5 = v26[5];
  }
LABEL_9:

  _Block_object_dispose(&v25, 8);
  return v15;
}

uint64_t __69__MIFileManager_urlsForItemsInDirectoryAtURL_ignoringSymlinks_error___block_invoke( uint64_t a1,  uint64_t a2,  _BYTE *a3)
{
  int v4 = *(_DWORD *)(a2 + 56);
  if (*(_BYTE *)(a1 + 48)) {
    BOOL v5 = v4 == 5;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    return 1LL;
  }

  else
  {
    [MEMORY[0x189604030] fileURLWithFileSystemRepresentation:*(void *)(a2 + 16) isDirectory:v4 == 2 relativeToURL:0];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v10 = v9 != 0LL;
    if (v9)
    {
      *a3 = 0;
      [*(id *)(a1 + 32) addObject:v9];
    }

    else
    {
      uint64_t v11 = _CreateAndLogError( (uint64_t)"-[MIFileManager urlsForItemsInDirectoryAtURL:ignoringSymlinks:error:]_block_invoke",  1265LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Failed to create URL for %s",  v8,  *(void *)(a2 + 16));
      uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8LL);
      id v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;
    }
  }

  return v10;
}

- (BOOL)createSymbolicLinkAtURL:(id)a3 withDestinationURL:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (const char *)[v8 fileSystemRepresentation];
  id v10 = v7;
  int v11 = symlink(v9, (const char *)[v10 fileSystemRepresentation]);
  if (v11)
  {
    uint64_t v12 = (void *)*MEMORY[0x189607688];
    uint64_t v13 = *__error();
    uint64_t v14 = [v8 fileSystemRepresentation];
    [v10 fileSystemRepresentation];
    id v15 = __error();
    strerror(*v15);
    _CreateError( (uint64_t)"-[MIFileManager createSymbolicLinkAtURL:withDestinationURL:error:]",  1298LL,  v12,  v13,  0LL,  0LL,  @"Could not create symlink containing %s at %s: %s",  v16,  v14);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    if (a5)
    {
      id v17 = v17;
      *a5 = v17;
    }
  }

  else
  {
    id v17 = 0LL;
  }

  return v11 == 0;
}

- (id)destinationOfSymbolicLinkAtURL:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  ssize_t v6 = readlink((const char *)[v5 fileSystemRepresentation], v17, 0x400uLL);
  if (v6 < 0)
  {
    int v11 = (void *)*MEMORY[0x189607688];
    uint64_t v12 = *__error();
    uint64_t v13 = [v5 fileSystemRepresentation];
    uint64_t v14 = __error();
    strerror(*v14);
    _CreateError( (uint64_t)"-[MIFileManager destinationOfSymbolicLinkAtURL:error:]",  1318LL,  v11,  v12,  0LL,  0LL,  @"Could not readlink %s : %s",  v15,  v13);
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = 0LL;
    if (!a4) {
      goto LABEL_7;
    }
  }

  else
  {
    v17[v6] = 0;
    id v7 = (void *)MEMORY[0x189604030];
    [NSString stringWithFileSystemRepresentation:v17 length:v6];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 fileURLWithPath:v8];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();

    id v10 = 0LL;
    if (!a4) {
      goto LABEL_7;
    }
  }

  if (!v9) {
    *a4 = v10;
  }
LABEL_7:

  return v9;
}

- (BOOL)itemExistsAtURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  int v6 = lstat((const char *)[v5 fileSystemRepresentation], &v13);
  if (v6)
  {
    id v7 = __error();
    uint64_t v8 = *v7;
    if ((_DWORD)v8 != 2 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      strerror(*v7);
      MOLogWrite();
    }

    if (a4)
    {
      id v9 = (void *)*MEMORY[0x189607688];
      uint64_t v10 = [v5 fileSystemRepresentation];
      strerror(v8);
      _CreateError( (uint64_t)"-[MIFileManager itemExistsAtURL:error:]",  1345LL,  v9,  v8,  0LL,  0LL,  @"lstat of %s failed: %s",  v11,  v10);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v6 == 0;
}

- (BOOL)itemExistsAtURL:(id)a3
{
  return -[MIFileManager itemExistsAtURL:error:](self, "itemExistsAtURL:error:", a3, 0LL);
}

- (BOOL)itemDoesNotExistAtURL:(id)a3
{
  id v3 = a3;
  if (!lstat((const char *)[v3 fileSystemRepresentation], &v7))
  {
LABEL_7:
    BOOL v4 = 0;
    goto LABEL_8;
  }

  if (*__error() != 2)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      id v5 = __error();
      strerror(*v5);
      MOLogWrite();
    }

    goto LABEL_7;
  }

  BOOL v4 = 1;
LABEL_8:

  return v4;
}

- (BOOL)itemDoesNotExistOrIsNotDirectoryAtURL:(id)a3
{
  id v13 = 0LL;
  BOOL v3 = -[MIFileManager itemIsDirectoryAtURL:error:](self, "itemIsDirectoryAtURL:error:", a3, &v13);
  id v4 = v13;
  id v5 = v4;
  if (v3)
  {
    BOOL v6 = 0;
  }

  else
  {
    [v4 domain];
    stat v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = *MEMORY[0x189607688];
    else {
      BOOL v9 = 0;
    }

    [v5 domain];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    else {
      BOOL v11 = 0;
    }

    BOOL v6 = v9 || v11;
  }

  return v6;
}

- (BOOL)_itemIsType:(unsigned __int16)a3 withDescription:(id)a4 atURL:(id)a5 error:(id *)a6
{
  int v8 = a3;
  id v9 = a4;
  memset(&v18, 0, sizeof(v18));
  uint64_t v10 = (const char *)[a5 fileSystemRepresentation];
  if (lstat(v10, &v18))
  {
    uint64_t v12 = __error();
    uint64_t v13 = *v12;
    if ((_DWORD)v13 != 2 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      strerror(*v12);
      MOLogWrite();
    }

    if (a6)
    {
      uint64_t v14 = (void *)*MEMORY[0x189607688];
      strerror(v13);
      _CreateError( (uint64_t)"-[MIFileManager _itemIsType:withDescription:atURL:error:]",  1403LL,  v14,  v13,  0LL,  0LL,  @"lstat of %s failed: %s",  v15,  (uint64_t)v10);
LABEL_12:
      BOOL v16 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }

    goto LABEL_13;
  }

  if ((v18.st_mode & 0xF000) != v8)
  {
    if (a6)
    {
      _CreateError( (uint64_t)"-[MIFileManager _itemIsType:withDescription:atURL:error:]",  1393LL,  (void *)*MEMORY[0x189607688],  22LL,  0LL,  0LL,  @"%s is not a %@ (mode 0%ho)",  v11,  (uint64_t)v10);
      goto LABEL_12;
    }

- (BOOL)itemIsFileAtURL:(id)a3 error:(id *)a4
{
  return -[MIFileManager _itemIsType:withDescription:atURL:error:]( self,  "_itemIsType:withDescription:atURL:error:",  0x8000LL,  @"regular file",  a3,  a4);
}

- (BOOL)itemIsSymlinkAtURL:(id)a3 error:(id *)a4
{
  return -[MIFileManager _itemIsType:withDescription:atURL:error:]( self,  "_itemIsType:withDescription:atURL:error:",  40960LL,  @"symlink",  a3,  a4);
}

- (BOOL)itemIsDirectoryAtURL:(id)a3 error:(id *)a4
{
  return -[MIFileManager _itemIsType:withDescription:atURL:error:]( self,  "_itemIsType:withDescription:atURL:error:",  0x4000LL,  @"directory",  a3,  a4);
}

- (BOOL)itemIsFIFOAtURL:(id)a3 error:(id *)a4
{
  return -[MIFileManager _itemIsType:withDescription:atURL:error:]( self,  "_itemIsType:withDescription:atURL:error:",  4096LL,  @"FIFO",  a3,  a4);
}

- (BOOL)itemIsSocketAtURL:(id)a3 error:(id *)a4
{
  return -[MIFileManager _itemIsType:withDescription:atURL:error:]( self,  "_itemIsType:withDescription:atURL:error:",  49152LL,  @"socket",  a3,  a4);
}

- (int)deviceForURLOrFirstAvailableParent:(id)a3 error:(id *)a4
{
  id v5 = memset(&v17, 0, sizeof(v17));
  BOOL v6 = (const char *)[v5 fileSystemRepresentation];
  if (lstat(v6, &v17))
  {
    int v9 = *__error();
    if (v9 == 2)
    {
      while (![v5 isEqualToString:@"/"])
      {
        [v5 stringByDeletingLastPathComponent];
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

        memset(&v17, 0, sizeof(v17));
        id v5 = v11;
        BOOL v6 = (const char *)[v5 fileSystemRepresentation];
        if (!lstat(v6, &v17)) {
          goto LABEL_7;
        }
        int v9 = *__error();
        if (v9 != 2) {
          goto LABEL_6;
        }
      }

      _CreateError( (uint64_t)"-[MIFileManager deviceForURLOrFirstAvailableParent:error:]",  1460LL,  (void *)*MEMORY[0x189607688],  2LL,  0LL,  0LL,  @"lstat for path / failed, which should never happen!",  v10,  v16);
    }

    else
    {
LABEL_6:
      _CreateError( (uint64_t)"-[MIFileManager deviceForURLOrFirstAvailableParent:error:]",  1467LL,  (void *)*MEMORY[0x189607688],  v9,  0LL,  0LL,  @"lstat failed for %s",  v8,  (uint64_t)v6);
    }
  }

  else
  {
LABEL_7:
    dev_t st_dev = v17.st_dev;
    if (v17.st_dev != -1)
    {
      id v13 = 0LL;
      goto LABEL_14;
    }

    _CreateError( (uint64_t)"-[MIFileManager deviceForURLOrFirstAvailableParent:error:]",  1452LL,  (void *)*MEMORY[0x189607688],  22LL,  0LL,  0LL,  @"lstat succeeded but st_dev was -1 for %s",  v7,  (uint64_t)v6);
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v13 = v14;
  if (a4)
  {
    id v13 = v14;
    *a4 = v13;
  }

  dev_t st_dev = -1;
LABEL_14:

  return st_dev;
}

- (id)upToFirstFourBytesFromURL:(id)a3 error:(id *)a4
{
  id v11 = 0LL;
  [MEMORY[0x189607898] fileHandleForReadingFromURL:a3 error:&v11];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v11;
  if (v5)
  {
    id v10 = 0LL;
    [v5 readDataUpToLength:4 error:&v10];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = v10;

    id v6 = v8;
    if (!a4) {
      goto LABEL_7;
    }
  }

  else
  {
    uint64_t v7 = 0LL;
    if (!a4) {
      goto LABEL_7;
    }
  }

  if (!v7) {
    *a4 = v6;
  }
LABEL_7:

  return v7;
}

- (id)aclTextFromURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  file = acl_get_file((const char *)[v5 fileSystemRepresentation], ACL_TYPE_EXTENDED);
  if (!file)
  {
    int v12 = *__error();
    id v13 = (void *)*MEMORY[0x189607688];
    [v5 path];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    strerror(v12);
    _CreateError( (uint64_t)"-[MIFileManager aclTextFromURL:error:]",  1518LL,  v13,  v12,  0LL,  0LL,  @"Could not get ACL for file %@: %s",  v15,  (uint64_t)v14);
    id v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }

  uint64_t v7 = file;
  id v8 = acl_to_text(file, 0LL);
  if (!v8)
  {
    int v16 = *__error();
    stat v17 = (void *)*MEMORY[0x189607688];
    [v5 path];
    stat v18 = (void *)objc_claimAutoreleasedReturnValue();
    strerror(v16);
    _CreateError( (uint64_t)"-[MIFileManager aclTextFromURL:error:]",  1524LL,  v17,  v16,  0LL,  0LL,  @"Could not read ACL text for file %@: %s",  v19,  (uint64_t)v18);
    id v11 = (void *)objc_claimAutoreleasedReturnValue();

    acl_free(v7);
LABEL_7:
    id v10 = 0LL;
    if (!a4) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }

  int v9 = v8;
  [NSString stringWithUTF8String:v8];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  acl_free(v7);
  acl_free(v9);
  id v11 = 0LL;
  if (!a4) {
    goto LABEL_10;
  }
LABEL_8:
  if (!v10) {
    *a4 = v11;
  }
LABEL_10:

  return v10;
}

- (id)extendedAttributesFromURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  int v6 = open((const char *)[v5 fileSystemRepresentation], 256);
  if ((v6 & 0x80000000) == 0)
  {
    int v7 = v6;
    ssize_t v8 = flistxattr(v6, 0LL, 0LL, 32);
    if (v8 < 0)
    {
      int v26 = *__error();
      uint64_t v27 = (void *)*MEMORY[0x189607688];
      [v5 path];
      id v28 = (void *)objc_claimAutoreleasedReturnValue();
      strerror(v26);
      _CreateError( (uint64_t)"-[MIFileManager extendedAttributesFromURL:error:]",  1598LL,  v27,  v26,  0LL,  0LL,  @"Could not get the length for extended attribute list for %@: %s",  v29,  (uint64_t)v28);
    }

    else
    {
      size_t v9 = v8;
      if (v8)
      {
        id v10 = (char *)malloc(v8);
        if (v10)
        {
          id v11 = v10;
          ssize_t v12 = flistxattr(v7, v10, v9, 32);
          if (v12 < 0)
          {
            int v35 = *__error();
            uint64_t v36 = (void *)*MEMORY[0x189607688];
            [v5 path];
            id v28 = (void *)objc_claimAutoreleasedReturnValue();
            strerror(v35);
            _CreateError( (uint64_t)"-[MIFileManager extendedAttributesFromURL:error:]",  1615LL,  v36,  v35,  0LL,  0LL,  @"Could not get extended attribute list for %@: %s",  v37,  (uint64_t)v28);
            id v15 = (id)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            uint64_t v13 = v12;
            if (v12)
            {
              id v14 = objc_alloc_init(MEMORY[0x189603FC8]);
              id v15 = 0LL;
              int v16 = v11;
              do
              {
                stat v17 = v15;
                id v38 = v15;
                _dataForEAKey(v16, v7, &v38);
                stat v18 = (void *)objc_claimAutoreleasedReturnValue();
                id v15 = v38;

                [NSString stringWithUTF8String:v16];
                uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
                if (v18)
                {
                  [v14 setObject:v18 forKeyedSubscript:v19];
                }

                else
                {

                  [MEMORY[0x189603FE8] null];
                  int v20 = (void *)objc_claimAutoreleasedReturnValue();
                  [v14 setObject:v20 forKeyedSubscript:v19];

                  id v15 = 0LL;
                }

                size_t v21 = strlen(v16);
                v13 -= v21 + 1;
                v16 += v21 + 1;
              }

              while (v13 > 0);
              goto LABEL_22;
            }

            if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
            {
              id v14 = 0LL;
              id v15 = 0LL;
              goto LABEL_22;
            }

            [v5 path];
            id v28 = (void *)objc_claimAutoreleasedReturnValue();
            MOLogWrite();
            id v15 = 0LL;
          }

- (BOOL)dataProtectionClassOfItemAtURL:(id)a3 class:(int *)a4 error:(id *)a5
{
  id v7 = a3;
  int v8 = open((const char *)[v7 fileSystemRepresentation], 256);
  int v9 = v8;
  if (v8 < 0)
  {
    uint64_t v13 = (void *)*MEMORY[0x189607688];
    uint64_t v14 = *__error();
    uint64_t v15 = [v7 fileSystemRepresentation];
    int v16 = __error();
    strerror(*v16);
    _CreateError( (uint64_t)"-[MIFileManager dataProtectionClassOfItemAtURL:class:error:]",  1655LL,  v13,  v14,  0LL,  0LL,  @"Failed to open %s : %s",  v17,  v15);
  }

  else
  {
    int v10 = fcntl(v8, 63);
    if ((v10 & 0x80000000) == 0)
    {
      id v11 = 0LL;
      *a4 = v10;
      char v12 = 1;
LABEL_9:
      close(v9);
      BOOL v24 = v12;
      goto LABEL_10;
    }

    stat v18 = (void *)*MEMORY[0x189607688];
    uint64_t v19 = *__error();
    uint64_t v20 = [v7 fileSystemRepresentation];
    size_t v21 = __error();
    strerror(*v21);
    _CreateError( (uint64_t)"-[MIFileManager dataProtectionClassOfItemAtURL:class:error:]",  1661LL,  v18,  v19,  0LL,  0LL,  @"Failed to getclass of file %s: %s",  v22,  v20);
  }

  BOOL v23 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v23;
  if (a5) {
    *a5 = v23;
  }
  char v12 = 0;
  BOOL v24 = 0;
  if ((v9 & 0x80000000) == 0) {
    goto LABEL_9;
  }
LABEL_10:

  return v24;
}

- (BOOL)setDataProtectionClassOfItemAtURL:(id)a3 toClass:(int)a4 ifPredicate:(id)a5 error:(id *)a6
{
  uint64_t v8 = *(void *)&a4;
  id v9 = a3;
  int v10 = (unsigned int (**)(id, void))a5;
  id v11 = v9;
  int v12 = open((const char *)[v11 fileSystemRepresentation], 256);
  int v13 = v12;
  if (v12 < 0)
  {
    uint64_t v19 = (void *)*MEMORY[0x189607688];
    uint64_t v20 = *__error();
    uint64_t v21 = [v11 fileSystemRepresentation];
    uint64_t v22 = __error();
    uint64_t v33 = v21;
    strerror(*v22);
    BOOL v24 = @"Failed to open %s : %s";
    uint64_t v25 = 1686LL;
  }

  else
  {
    if (!v10)
    {
LABEL_5:
      if (fcntl(v13, 64, v8))
      {
        uint64_t v15 = (void *)*MEMORY[0x189607688];
        uint64_t v16 = *__error();
        [v11 fileSystemRepresentation];
        uint64_t v17 = __error();
        strerror(*v17);
        _CreateError( (uint64_t)"-[MIFileManager setDataProtectionClassOfItemAtURL:toClass:ifPredicate:error:]",  1703LL,  v15,  v16,  0LL,  0LL,  @"Failed to setclass(%d) on file %s: %s",  v18,  v8);
        goto LABEL_11;
      }

- (BOOL)setOwnerOfURL:(id)a3 toUID:(unsigned int)a4 gid:(unsigned int)a5 error:(id *)a6
{
  id v9 = a3;
  int v10 = lchown((const char *)[v9 fileSystemRepresentation], a4, a5);
  if (v10)
  {
    int v11 = *__error();
    int v12 = (void *)*MEMORY[0x189607688];
    uint64_t v13 = [v9 fileSystemRepresentation];
    strerror(v11);
    _CreateError( (uint64_t)"-[MIFileManager setOwnerOfURL:toUID:gid:error:]",  1726LL,  v12,  v11,  0LL,  0LL,  @"Failed to lchown %s : %s",  v14,  v13);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    if (a6)
    {
      id v15 = v15;
      *a6 = v15;
    }
  }

  else
  {
    id v15 = 0LL;
  }

  return v10 == 0;
}

- (BOOL)setPermissionsForURL:(id)a3 toMode:(unsigned __int16)a4 error:(id *)a5
{
  id v7 = a3;
  int v8 = lchmod((const char *)[v7 fileSystemRepresentation], a4);
  if (v8)
  {
    int v9 = *__error();
    int v10 = (void *)*MEMORY[0x189607688];
    uint64_t v11 = [v7 fileSystemRepresentation];
    strerror(v9);
    _CreateError( (uint64_t)"-[MIFileManager setPermissionsForURL:toMode:error:]",  1745LL,  v10,  v9,  0LL,  0LL,  @"Failed to lchmod %s : %s",  v12,  v11);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (a5)
    {
      id v13 = v13;
      *a5 = v13;
    }
  }

  else
  {
    id v13 = 0LL;
  }

  return v8 == 0;
}

- (BOOL)captureStoreDataFromDirectory:(id)a3 toDirectory:(id)a4 doCopy:(BOOL)a5 failureIsFatal:(BOOL)a6 includeiTunesMetadata:(BOOL)a7 withError:(id *)a8
{
  BOOL v35 = a5;
  v49[5] = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v36 = a4;
  v49[0] = @"Manifest.plist";
  v49[1] = @"iTunesArtwork";
  v49[2] = @"iTunesMetadata.plist";
  v49[3] = @"GeoJSON";
  v49[4] = @"com.apple.mobileinstallation.companion_placeholder";
  [MEMORY[0x189603F18] arrayWithObjects:v49 count:5];
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v30 = a8;
    uint64_t v14 = 0LL;
    id v15 = 0LL;
    uint64_t v16 = *(void *)v41;
    id v31 = v10;
    id obj = v11;
LABEL_3:
    uint64_t v17 = 0LL;
    while (1)
    {
      if (*(void *)v41 != v16) {
        objc_enumerationMutation(obj);
      }
      uint64_t v18 = *(void *)(*((void *)&v40 + 1) + 8 * v17);
      if (!a7
        && ([*(id *)(*((void *)&v40 + 1) + 8 * v17) isEqualToString:@"iTunesMetadata.plist"] & 1) != 0)
      {
        goto LABEL_15;
      }

      [v36 URLByAppendingPathComponent:v18 isDirectory:0];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 URLByAppendingPathComponent:v18 isDirectory:0];
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35)
      {
        id v39 = v15;
        BOOL v21 = -[MIFileManager copyItemIfExistsAtURL:toURL:error:]( self,  "copyItemIfExistsAtURL:toURL:error:",  v20,  v19,  &v39);
        id v22 = v39;

        if (!v21)
        {
          uint64_t v46 = @"LegacyErrorString";
          [&unk_189D64DB0 objectAtIndexedSubscript:v14];
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v47 = v23;
          [MEMORY[0x189603F68] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
          BOOL v24 = (void *)objc_claimAutoreleasedReturnValue();
          _CreateAndLogError( (uint64_t)"-[MIFileManager captureStoreDataFromDirectory:toDirectory:doCopy:failureIsFatal:includeiTunesMetadata:withError:]",  1778LL,  @"MIInstallerErrorDomain",  24LL,  v22,  v24,  @"Failed to copy %@ to %@",  v25,  (uint64_t)v20);
          goto LABEL_13;
        }
      }

      else
      {
        id v38 = v15;
        BOOL v26 = -[MIFileManager moveItemIfExistsAtURL:toURL:error:]( self,  "moveItemIfExistsAtURL:toURL:error:",  v20,  v19,  &v38);
        id v22 = v38;

        if (!v26)
        {
          int v44 = @"LegacyErrorString";
          [&unk_189D64DB0 objectAtIndexedSubscript:v14];
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v45 = v23;
          [MEMORY[0x189603F68] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
          BOOL v24 = (void *)objc_claimAutoreleasedReturnValue();
          _CreateAndLogError( (uint64_t)"-[MIFileManager captureStoreDataFromDirectory:toDirectory:doCopy:failureIsFatal:includeiTunesMetadata:withError:]",  1786LL,  @"MIInstallerErrorDomain",  24LL,  v22,  v24,  @"Failed to move %@ to %@",  v27,  (uint64_t)v20);
LABEL_13:
          id v15 = (id)objc_claimAutoreleasedReturnValue();

          id v10 = v31;
          id v22 = v15;
          if (a6)
          {

            id v11 = obj;
            if (v30)
            {
              id v15 = v15;
              BOOL v28 = 0;
              id *v30 = v15;
            }

            else
            {
              BOOL v28 = 0;
            }

            goto LABEL_23;
          }
        }
      }

      ++v14;

      id v15 = v22;
LABEL_15:
      if (v13 == ++v17)
      {
        id v11 = obj;
        uint64_t v13 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
        if (v13) {
          goto LABEL_3;
        }
        goto LABEL_21;
      }
    }
  }

  id v15 = 0LL;
LABEL_21:

  BOOL v28 = 1;
LABEL_23:

  return v28;
}

- (id)_realPathWhatExistsInPath:(id)a3 isDirectory:(BOOL)a4
{
  BOOL v17 = a4;
  [a3 pathComponents];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 count];
  uint64_t v7 = v6 - 1;
  if (v6 == 1)
  {
    id v10 = 0LL;
  }

  else
  {
    do
    {
      objc_msgSend(v5, "subarrayWithRange:", 0, v7 + 1);
      int v8 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189604030] fileURLWithPathComponents:v8];
      int v9 = (void *)objc_claimAutoreleasedReturnValue();
      id v10 = 0LL;
      if (-[MIFileManager itemExistsAtURL:](self, "itemExistsAtURL:", v9))
      {
        -[MIFileManager realPathForURL:allowNonExistentPathComponents:isDirectory:error:]( self,  "realPathForURL:allowNonExistentPathComponents:isDirectory:error:",  v9,  0LL,  v17,  0LL);
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v5, "subarrayWithRange:", v7 + 1, objc_msgSend(v5, "count") - (v7 + 1));
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
          [NSString pathWithComponents:v12];
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
          {
            [v11 path];
            uint64_t v16 = v13;
            id v15 = (void *)objc_claimAutoreleasedReturnValue();
            MOLogWrite();
          }

          objc_msgSend(v11, "URLByAppendingPathComponent:isDirectory:", v13, v17, v15, v16);
          id v10 = (void *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          id v10 = 0LL;
        }
      }

      if (v10) {
        break;
      }
      --v7;
    }

    while (v7);
  }

  return v10;
}

- (id)realPathForURL:(id)a3 allowNonExistentPathComponents:(BOOL)a4 isDirectory:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v23 = *MEMORY[0x1895F89C0];
  bzero(v22, 0x400uLL);
  id v11 = [a3 path];
  if (realpath_DARWIN_EXTSN((const char *)[v11 fileSystemRepresentation], v22))
  {
    uint64_t v12 = [MEMORY[0x189604030] fileURLWithFileSystemRepresentation:v22 isDirectory:v7 relativeToURL:0];
LABEL_11:
    uint64_t v20 = (void *)v12;
    goto LABEL_12;
  }

  uint64_t v13 = *__error();
  if ((_DWORD)v13 == 2 && v8)
  {
    uint64_t v12 = -[MIFileManager _realPathWhatExistsInPath:isDirectory:](self, "_realPathWhatExistsInPath:isDirectory:", v11, v7);
    goto LABEL_11;
  }

  id v15 = (void *)*MEMORY[0x189607688];
  uint64_t v16 = [v11 fileSystemRepresentation];
  strerror(v13);
  _CreateAndLogError( (uint64_t)"-[MIFileManager realPathForURL:allowNonExistentPathComponents:isDirectory:error:]",  1845LL,  v15,  v13,  0LL,  0LL,  @"Failed to realpath %s : %s at %s",  v17,  v16);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = v18;
  if (a6) {
    *a6 = v18;
  }

  uint64_t v20 = 0LL;
LABEL_12:

  return v20;
}

- (id)_realPathForURL:(id)a3 allowNonExistentPathComponents:(BOOL)a4
{
  return -[MIFileManager realPathForURL:allowNonExistentPathComponents:isDirectory:error:]( self,  "realPathForURL:allowNonExistentPathComponents:isDirectory:error:",  a3,  a4,  0LL,  0LL);
}

- (BOOL)_validateSymlink:(id)a3 withStartingDepth:(unsigned int)a4 andEndingDepth:(unsigned int *)a5
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  BOOL v8 = v7;
  if (v7)
  {
    uint64_t v18 = a5;
    [v7 pathComponents];
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
      signed int v13 = a4;
      while (2)
      {
        for (uint64_t i = 0LL; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          id v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ([v15 isEqualToString:@".."])
          {
            --v13;
          }

          else if (([v15 isEqualToString:&stru_189D525C8] & 1) == 0 {
                 && ([v15 isEqualToString:@"."] & 1) == 0)
          }
          {
            v13 += [v15 isEqualToString:@"/"] ^ 1;
          }

          if (v13 < (int)a4)
          {

            goto LABEL_18;
          }
        }

        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    else
    {
      signed int v13 = a4;
    }

    if (v18) {
      unsigned int *v18 = v13;
    }
    BOOL v16 = 1;
  }

  else
  {
    id v9 = 0LL;
LABEL_18:
    BOOL v16 = 0;
  }

  return v16;
}

- (id)realPathForURL:(id)a3 ifChildOfURL:(id)a4
{
  uint64_t v76 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  bzero(v75, 0x400uLL);
  if (!v6 || !v7)
  {
    goto LABEL_14;
  }

  [v7 path];
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
  int v9 = [v8 hasPrefix:@"/private/"];

  if (v9)
  {
    uint64_t v10 = (void *)MEMORY[0x189604030];
    [v7 path];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "substringFromIndex:", objc_msgSend(@"/private", "length"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v10 fileURLWithPath:v12];

    id v7 = (id)v13;
  }

  [v6 path];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  int v15 = [v14 hasPrefix:@"/private/"];

  if (v15)
  {
    BOOL v16 = (void *)MEMORY[0x189604030];
    [v6 path];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "substringFromIndex:", objc_msgSend(@"/private", "length"));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [v16 fileURLWithPath:v18];

    id v6 = (id)v19;
  }

  [v6 path];
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 path];
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
  char v22 = [v20 hasPrefix:v21];

  if ((v22 & 1) == 0)
  {
    [v6 path];
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 path];
    uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

    goto LABEL_37;
  }

  [v6 pathComponents];
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  int v24 = [v23 containsObject:@".."];

  if (v24)
  {
    goto LABEL_11;
  }

  id v6 = v6;
  ssize_t v26 = readlink((const char *)[v6 fileSystemRepresentation], v75, 0x400uLL);
  if (v26 == -1)
  {
    if (*__error() == 22 || *__error() == 2)
    {
      [v6 path];
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v28 = 0LL;
      goto LABEL_28;
    }

    __int128 v43 = __error();
    strerror(*v43);
LABEL_14:
    MOLogWrite();
LABEL_38:
    id v39 = 0LL;
    id v38 = 0LL;
    id v36 = 0LL;
    uint64_t v27 = 0LL;
    BOOL v28 = 0LL;
    goto LABEL_39;
  }

  if (v75[0] == 47)
  {
LABEL_11:
    [v6 path];
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_36:
    MOLogWrite();
LABEL_37:

    goto LABEL_38;
  }

  unsigned int v74 = 0;
  [v7 path];
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v30 = -[MIFileManager _validateSymlink:withStartingDepth:andEndingDepth:]( self,  "_validateSymlink:withStartingDepth:andEndingDepth:",  v29,  0LL,  &v74);

  if (!v30)
  {
    [v7 path];
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }

  [v6 path];
  id v31 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 path];
  char v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "substringFromIndex:", objc_msgSend(v32, "length"));
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();

  [v33 stringByDeletingLastPathComponent];
  BOOL v28 = (void *)objc_claimAutoreleasedReturnValue();

  [NSString stringWithFileSystemRepresentation:v75 length:v26];
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
  [v28 stringByAppendingPathComponent:v34];
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[MIFileManager _validateSymlink:withStartingDepth:andEndingDepth:]( self,  "_validateSymlink:withStartingDepth:andEndingDepth:",  v27,  v74,  0LL))
  {
    [v6 path];
    __int128 v42 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 path];
    int v63 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

    goto LABEL_53;
  }

- (BOOL)markBundleAsPlaceholder:(id)a3 withError:(id *)a4
{
  int value = 1;
  id v5 = (const char *)[a3 fileSystemRepresentation];
  int v6 = setxattr(v5, "com.apple.installd.placeholder", &value, 4uLL, 0, 1);
  if (v6)
  {
    id v7 = __error();
    int v8 = *v7;
    _CreateError( (uint64_t)"-[MIFileManager markBundleAsPlaceholder:withError:]",  2101LL,  (void *)*MEMORY[0x189607688],  *v7,  0LL,  0LL,  @"setxattr for %s on %s failed",  v9,  (uint64_t)"com.apple.installd.placeholder");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    strerror(v8);
    _CreateAndLogError( (uint64_t)"-[MIFileManager markBundleAsPlaceholder:withError:]",  2101LL,  @"MIInstallerErrorDomain",  4LL,  v10,  0LL,  @"Could't set placeholder EA on %s: %s",  v11,  (uint64_t)v5);
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      id v12 = v12;
      *a4 = v12;
    }
  }

  else
  {
    id v12 = 0LL;
  }

  return v6 == 0;
}

- (BOOL)bundleAtURLIsPlaceholder:(id)a3
{
  int value = 0;
  return getxattr( (const char *)[a3 fileSystemRepresentation], "com.apple.installd.placeholder", &value, 4uLL, 0, 1) == 4;
}

- (BOOL)clearPlaceholderStatusForBundle:(id)a3 withError:(id *)a4
{
  id v5 = (const char *)[a3 fileSystemRepresentation];
  int v6 = removexattr(v5, "com.apple.installd.placeholder", 1);
  if (v6)
  {
    id v7 = __error();
    _CreateError( (uint64_t)"-[MIFileManager clearPlaceholderStatusForBundle:withError:]",  2125LL,  (void *)*MEMORY[0x189607688],  *v7,  0LL,  0LL,  @"removexattr on %s for %s failed",  v8,  (uint64_t)v5);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIFileManager clearPlaceholderStatusForBundle:withError:]",  2125LL,  @"MIInstallerErrorDomain",  4LL,  v9,  0LL,  @"Could't remove placeholder EA on \"%s\"",  v10,  (uint64_t)v5);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4) {
      *a4 = v11;
    }
  }

  return v6 == 0;
}

- (BOOL)_markEAFlag:(const char *)a3 forAppIdentifier:(id)a4 insecurelyCachedOnBundle:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  int value = 1;
  if (!v9 || ![v9 length])
  {
    uint64_t v20 = [v10 fileSystemRepresentation];
    _CreateAndLogError( (uint64_t)"-[MIFileManager _markEAFlag:forAppIdentifier:insecurelyCachedOnBundle:error:]",  2141LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Attempted to set a zero-length or nil app identifier on \"%s\"",  v21,  v20);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }

  id v11 = v10;
  int v12 = open((const char *)[v11 fileSystemRepresentation], 256);
  if (v12 < 0)
  {
    uint64_t v23 = __error();
    int v24 = *v23;
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:*v23 userInfo:0];
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = [v11 fileSystemRepresentation];
    strerror(v24);
    _CreateAndLogError( (uint64_t)"-[MIFileManager _markEAFlag:forAppIdentifier:insecurelyCachedOnBundle:error:]",  2148LL,  @"MIInstallerErrorDomain",  4LL,  v25,  0LL,  @"Couldn't open bundle %s for setting extended attributes: %s",  v27,  v26);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
    BOOL v19 = 0;
    if (!a6) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }

  int v13 = v12;
  if (fsetxattr(v12, a3, &value, 4uLL, 0, 0))
  {
    uint64_t v14 = __error();
    int v15 = *v14;
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:*v14 userInfo:0];
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 fileSystemRepresentation];
    strerror(v15);
    _CreateAndLogError( (uint64_t)"-[MIFileManager _markEAFlag:forAppIdentifier:insecurelyCachedOnBundle:error:]",  2154LL,  @"MIInstallerErrorDomain",  4LL,  v16,  0LL,  @"Couldn't set %s EA on %s: %s",  v17,  (uint64_t)a3);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
    BOOL v19 = 0;
    goto LABEL_7;
  }

  BOOL v28 = (const char *)[v9 UTF8String];
  size_t v29 = strlen(v28);
  if (fsetxattr(v13, "com.apple.installd.appIdentifier", v28, v29, 0, 0))
  {
    BOOL v30 = __error();
    int v31 = *v30;
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:*v30 userInfo:0];
    char v32 = (void *)objc_claimAutoreleasedReturnValue();
    id v33 = v11;
    uint64_t v34 = [v33 fileSystemRepresentation];
    strerror(v31);
    _CreateAndLogError( (uint64_t)"-[MIFileManager _markEAFlag:forAppIdentifier:insecurelyCachedOnBundle:error:]",  2163LL,  @"MIInstallerErrorDomain",  4LL,  v32,  0LL,  @"Couldn't set app identifier EA on %s: %s",  v35,  v34);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (fremovexattr(v13, a3, 1) < 0)
    {
      int v36 = *__error();
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        [v33 fileSystemRepresentation];
        strerror(v36);
        MOLogWrite();
      }
    }

    goto LABEL_6;
  }

  uint64_t v18 = 0LL;
  BOOL v19 = 1;
LABEL_7:
  close(v13);
  if (!a6) {
    goto LABEL_13;
  }
LABEL_11:
  if (!v19) {
    *a6 = v18;
  }
LABEL_13:

  return v19;
}

- (id)_insecureCachedAppIdentifierIfMarkedWithEAFlag:(const char *)a3 bundleURL:(id)a4 allowPlaceholders:(BOOL)a5 error:(id *)a6
{
  int value = 0;
  id v9 = a4;
  int v10 = open((const char *)[v9 fileSystemRepresentation], 256);
  if ((v10 & 0x80000000) == 0)
  {
    int v11 = v10;
    if (fgetxattr(v10, a3, &value, 4uLL, 0, 0) != 4)
    {
      uint64_t v23 = *__error();
      if ((_DWORD)v23 == 93)
      {
        int v24 = (void *)*MEMORY[0x189607688];
        [v9 path];
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError( (uint64_t)"-[MIFileManager _insecureCachedAppIdentifierIfMarkedWithEAFlag:bundleURL:allowPlaceholders:error:]",  2202LL,  v24,  93LL,  0LL,  0LL,  @"Attr named %s not present on %@",  v25,  (uint64_t)a3);
        id v15 = (id)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:v23 userInfo:0];
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 fileSystemRepresentation];
        strerror(v23);
        _CreateAndLogError( (uint64_t)"-[MIFileManager _insecureCachedAppIdentifierIfMarkedWithEAFlag:bundleURL:allowPlaceholders:error:]",  2204LL,  @"MIInstallerErrorDomain",  4LL,  v27,  0LL,  @"Couldn't get %s EA from %s: %s",  v28,  (uint64_t)a3);
        id v15 = (id)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_13;
    }

    if (value != 1)
    {
      [v9 fileSystemRepresentation];
      _CreateAndLogError( (uint64_t)"-[MIFileManager _insecureCachedAppIdentifierIfMarkedWithEAFlag:bundleURL:allowPlaceholders:error:]",  2208LL,  @"MIInstallerErrorDomain",  141LL,  0LL,  0LL,  @"%s EA was not set to expected value from \"%s\"",  v26,  (uint64_t)a3);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }

    if (!a5)
    {
      int v37 = 0;
      if (fgetxattr(v11, "com.apple.installd.placeholder", &v37, 4uLL, 0, 0) == 4)
      {
        int v12 = (void *)*MEMORY[0x189607688];
        [v9 path];
        int v13 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError( (uint64_t)"-[MIFileManager _insecureCachedAppIdentifierIfMarkedWithEAFlag:bundleURL:allowPlaceholders:error:]",  2217LL,  v12,  93LL,  0LL,  0LL,  @"Not allowed to mark placeholder as validatedByFreeProfile for %@",  v14,  (uint64_t)v13);
        id v15 = (id)objc_claimAutoreleasedReturnValue();

LABEL_13:
        char v22 = 0LL;
        uint64_t v21 = 0LL;
        goto LABEL_14;
      }
    }

    id v36 = 0LL;
    _dataForEAKey("com.apple.installd.appIdentifier", v11, &v36);
    char v22 = (void *)objc_claimAutoreleasedReturnValue();
    id v15 = v36;
    if (v22)
    {
      uint64_t v30 = [objc_alloc(NSString) initWithData:v22 encoding:4];
      if (v30)
      {
        uint64_t v21 = (void *)v30;
        goto LABEL_14;
      }

      [v9 fileSystemRepresentation];
      uint64_t v33 = _CreateAndLogError( (uint64_t)"-[MIFileManager _insecureCachedAppIdentifierIfMarkedWithEAFlag:bundleURL:allowPlaceholders:error:]",  2230LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Failed to convert app identifier EA data (%@) to string from \"%s\"",  v34,  (uint64_t)v22);
    }

    else
    {
      uint64_t v31 = [v9 fileSystemRepresentation];
      uint64_t v33 = _CreateAndLogError( (uint64_t)"-[MIFileManager _insecureCachedAppIdentifierIfMarkedWithEAFlag:bundleURL:allowPlaceholders:error:]",  2224LL,  @"MIInstallerErrorDomain",  4LL,  v15,  0LL,  @"Couldn't get appIdentifier EA from \"%s\"",  v32,  v31);

      char v22 = 0LL;
    }

    uint64_t v21 = 0LL;
    id v15 = (id)v33;
LABEL_14:
    close(v11);
    if (!a6) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }

  BOOL v16 = __error();
  int v17 = *v16;
  [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:*v16 userInfo:0];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = [v9 fileSystemRepresentation];
  strerror(v17);
  _CreateAndLogError( (uint64_t)"-[MIFileManager _insecureCachedAppIdentifierIfMarkedWithEAFlag:bundleURL:allowPlaceholders:error:]",  2194LL,  @"MIInstallerErrorDomain",  4LL,  v18,  0LL,  @"Couldn't open bundle %s for setting extended attributes: %s",  v20,  v19);
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v21 = 0LL;
  char v22 = 0LL;
  if (!a6) {
    goto LABEL_17;
  }
LABEL_15:
  if (!v21) {
    *a6 = v15;
  }
LABEL_17:

  return v21;
}

- (BOOL)setAppClipAppIdentifier:(id)a3 insecurelyCachedOnBundle:(id)a4 error:(id *)a5
{
  return -[MIFileManager _markEAFlag:forAppIdentifier:insecurelyCachedOnBundle:error:]( self,  "_markEAFlag:forAppIdentifier:insecurelyCachedOnBundle:error:",  "com.apple.installd.appclip",  a3,  a4,  a5);
}

- (id)insecureCachedAppIdentifierIfAppClipForBundle:(id)a3 error:(id *)a4
{
  return -[MIFileManager _insecureCachedAppIdentifierIfMarkedWithEAFlag:bundleURL:allowPlaceholders:error:]( self,  "_insecureCachedAppIdentifierIfMarkedWithEAFlag:bundleURL:allowPlaceholders:error:",  "com.apple.installd.appclip",  a3,  1LL,  a4);
}

- (BOOL)setValidatedByFreeProfileAppIdentifier:(id)a3 insecurelyCachedOnBundle:(id)a4 error:(id *)a5
{
  return -[MIFileManager _markEAFlag:forAppIdentifier:insecurelyCachedOnBundle:error:]( self,  "_markEAFlag:forAppIdentifier:insecurelyCachedOnBundle:error:",  "com.apple.installd.validatedByFreeProfile",  a3,  a4,  a5);
}

- (id)insecureCachedAppIdentifierIfValidatedByFreeProfileForBundle:(id)a3 error:(id *)a4
{
  return -[MIFileManager _insecureCachedAppIdentifierIfMarkedWithEAFlag:bundleURL:allowPlaceholders:error:]( self,  "_insecureCachedAppIdentifierIfMarkedWithEAFlag:bundleURL:allowPlaceholders:error:",  "com.apple.installd.validatedByFreeProfile",  a3,  0LL,  a4);
}

- (BOOL)setInstallType:(id)a3 inExtendedAttributeOnBundle:(id)a4 error:(id *)a5
{
  id v7 = a4;
  uint64_t value = [a3 unsignedLongLongValue];
  id v8 = v7;
  int v9 = setxattr( (const char *)[v8 fileSystemRepresentation],  "com.apple.installd.installType",  &value,  8uLL,  0,  1);
  if (v9)
  {
    int v10 = __error();
    int v11 = *v10;
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:*v10 userInfo:0];
    int v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v8 fileSystemRepresentation];
    strerror(v11);
    _CreateAndLogError( (uint64_t)"-[MIFileManager setInstallType:inExtendedAttributeOnBundle:error:]",  2277LL,  @"MIInstallerErrorDomain",  4LL,  v12,  0LL,  @"Couldn't set installType EA on %s: %s",  v14,  v13);
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    if (a5)
    {
      id v15 = v15;
      *a5 = v15;
    }
  }

  else
  {
    id v15 = 0LL;
  }

  return v9 == 0;
}

- (id)installTypeFromExtendedAttributeOnBundle:(id)a3 error:(id *)a4
{
  uint64_t value = 0LL;
  id v5 = a3;
  ssize_t v6 = getxattr( (const char *)[v5 fileSystemRepresentation],  "com.apple.installd.installType",  &value,  8uLL,  0,  1);
  if (v6 < 0)
  {
    uint64_t v9 = *__error();
    if ((_DWORD)v9 == 93)
    {
      [v5 path];
      int v10 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError( (uint64_t)"-[MIFileManager installTypeFromExtendedAttributeOnBundle:error:]",  2294LL,  @"MIInstallerErrorDomain",  158LL,  0LL,  0LL,  @"Install type extended attribute not found on %@",  v11,  (uint64_t)v10);
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:v9 userInfo:0];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = [v5 fileSystemRepresentation];
      strerror(v9);
      _CreateAndLogError( (uint64_t)"-[MIFileManager installTypeFromExtendedAttributeOnBundle:error:]",  2296LL,  @"MIInstallerErrorDomain",  4LL,  v14,  0LL,  @"Couldn't get installType EA from %s: %s",  v16,  v15);
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

- (BOOL)_setData:(id)a3 forExtendedAttributeNamed:(id)a4 onURL:(id)a5 orFD:(int)a6 error:(id *)a7
{
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = (const char *)[v11 fileSystemRepresentation];
  id v15 = v12;
  uint64_t v16 = (const char *)[v15 UTF8String];

  id v17 = v13;
  uint64_t v18 = (const void *)[v17 bytes];
  size_t v19 = [v17 length];

  if (!v17)
  {
    _CreateAndLogError( (uint64_t)"-[MIFileManager _setData:forExtendedAttributeNamed:onURL:orFD:error:]",  2324LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Attempted to set nil data on %s for EA named %s",  v20,  (uint64_t)v14);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    if (a7) {
      goto LABEL_5;
    }
LABEL_7:
    BOOL v27 = 0;
    goto LABEL_10;
  }

  if ((a6 & 0x80000000) == 0)
  {
    if (fsetxattr(a6, v16, v18, v19, 0, 0)) {
      goto LABEL_4;
    }
LABEL_9:
    id v26 = 0LL;
    BOOL v27 = 1;
    goto LABEL_10;
  }

  if (!setxattr(v14, v16, v18, v19, 0, 1)) {
    goto LABEL_9;
  }
LABEL_4:
  uint64_t v21 = __error();
  int v22 = *v21;
  _CreateError( (uint64_t)"-[MIFileManager _setData:forExtendedAttributeNamed:onURL:orFD:error:]",  2337LL,  (void *)*MEMORY[0x189607688],  *v21,  0LL,  0LL,  @"[f]setxattr failed for path %s fd %d",  v23,  (uint64_t)v14);
  int v24 = (void *)objc_claimAutoreleasedReturnValue();
  strerror(v22);
  _CreateAndLogError( (uint64_t)"-[MIFileManager _setData:forExtendedAttributeNamed:onURL:orFD:error:]",  2337LL,  @"MIInstallerErrorDomain",  4LL,  v24,  0LL,  @"Failed to set EA named %s on %s: %s",  v25,  (uint64_t)v16);
  id v26 = (id)objc_claimAutoreleasedReturnValue();

  if (!a7) {
    goto LABEL_7;
  }
LABEL_5:
  id v26 = v26;
  BOOL v27 = 0;
  *a7 = v26;
LABEL_10:

  return v27;
}

- (BOOL)setData:(id)a3 forExtendedAttributeNamed:(id)a4 onURL:(id)a5 error:(id *)a6
{
  return -[MIFileManager _setData:forExtendedAttributeNamed:onURL:orFD:error:]( self,  "_setData:forExtendedAttributeNamed:onURL:orFD:error:",  a3,  a4,  a5,  0xFFFFFFFFLL,  a6);
}

- (BOOL)setData:(id)a3 forExtendedAttributeNamed:(id)a4 onFD:(int)a5 fdLocation:(id)a6 error:(id *)a7
{
  return -[MIFileManager _setData:forExtendedAttributeNamed:onURL:orFD:error:]( self,  "_setData:forExtendedAttributeNamed:onURL:orFD:error:",  a3,  a4,  a6,  *(void *)&a5,  a7);
}

- (id)_dataForExtendedAttributeNamed:(id)a3 length:(unint64_t)a4 onURL:(id)a5 orFD:(int)a6 error:(id *)a7
{
  id v11 = (void *)MEMORY[0x189603FB8];
  id v12 = a5;
  id v13 = a3;
  id v14 = [v11 dataWithLength:a4];
  id v15 = (void *)[v14 mutableBytes];
  id v16 = v13;
  id v17 = (const char *)[v16 UTF8String];

  id v18 = v12;
  size_t v19 = (const char *)[v18 fileSystemRepresentation];

  if ((a6 & 0x80000000) == 0)
  {
    ssize_t v20 = fgetxattr(a6, v17, v15, a4, 0, 0);
    if ((v20 & 0x8000000000000000LL) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    uint64_t v25 = *__error();
    if ((_DWORD)v25 != 93)
    {
      _CreateError( (uint64_t)"-[MIFileManager _dataForExtendedAttributeNamed:length:onURL:orFD:error:]",  2385LL,  (void *)*MEMORY[0x189607688],  v25,  0LL,  0LL,  @"[f]getxattr failed for path %s fd %d",  v24,  (uint64_t)v19);
      BOOL v27 = (void *)objc_claimAutoreleasedReturnValue();
      strerror(v25);
      _CreateAndLogError( (uint64_t)"-[MIFileManager _dataForExtendedAttributeNamed:length:onURL:orFD:error:]",  2385LL,  @"MIInstallerErrorDomain",  4LL,  v27,  0LL,  @"Couldn't get data from EA named %s on %s: %s",  v28,  (uint64_t)v17);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
      int v22 = 0LL;
      if (!a7) {
        goto LABEL_15;
      }
      goto LABEL_13;
    }

    uint64_t v26 = _CreateError( (uint64_t)"-[MIFileManager _dataForExtendedAttributeNamed:length:onURL:orFD:error:]",  2382LL,  (void *)*MEMORY[0x189607688],  93LL,  0LL,  0LL,  @"Attr named %s not present on \"%s\"",  v24,  (uint64_t)v17);
LABEL_10:
    uint64_t v23 = (void *)v26;
    goto LABEL_12;
  }

  ssize_t v20 = getxattr(v19, v17, v15, a4, 0, 1);
  if (v20 < 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (v20 != a4)
  {
    uint64_t v26 = _CreateAndLogError( (uint64_t)"-[MIFileManager _dataForExtendedAttributeNamed:length:onURL:orFD:error:]",  2389LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"getxattr for EA named %s on %s returned %zd (expected %zu)",  v21,  (uint64_t)v17);
    goto LABEL_10;
  }

  int v22 = (void *)[v14 copy];
  uint64_t v23 = 0LL;
  if (!a7) {
    goto LABEL_15;
  }
LABEL_13:
  if (!v22) {
    *a7 = v23;
  }
LABEL_15:

  return v22;
}

- (id)dataForExtendedAttributeNamed:(id)a3 length:(unint64_t)a4 fromURL:(id)a5 error:(id *)a6
{
  return -[MIFileManager _dataForExtendedAttributeNamed:length:onURL:orFD:error:]( self,  "_dataForExtendedAttributeNamed:length:onURL:orFD:error:",  a3,  a4,  a5,  0xFFFFFFFFLL,  a6);
}

- (id)dataForExtendedAttributeNamed:(id)a3 length:(unint64_t)a4 fromFD:(int)a5 fdLocation:(id)a6 error:(id *)a7
{
  return -[MIFileManager _dataForExtendedAttributeNamed:length:onURL:orFD:error:]( self,  "_dataForExtendedAttributeNamed:length:onURL:orFD:error:",  a3,  a4,  a6,  *(void *)&a5,  a7);
}

- (BOOL)removeExtendedAttributeNamed:(id)a3 fromURL:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = (const char *)[a4 fileSystemRepresentation];
  id v9 = v7;
  BOOL v10 = 1;
  if (removexattr(v8, (const char *)[v9 fileSystemRepresentation], 1))
  {
    id v11 = __error();
    uint64_t v12 = *v11;
    if ((_DWORD)v12 == 93)
    {
      id v13 = 0LL;
      BOOL v10 = 1;
    }

    else
    {
      id v14 = (void *)*MEMORY[0x189607688];
      strerror(*v11);
      _CreateError( (uint64_t)"-[MIFileManager removeExtendedAttributeNamed:fromURL:error:]",  2420LL,  v14,  v12,  0LL,  0LL,  @"Failed to remove extended attribute named %@ from %s: %s",  v15,  (uint64_t)v9);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      if (a5)
      {
        id v13 = v13;
        BOOL v10 = 0;
        *a5 = v13;
      }

      else
      {
        BOOL v10 = 0;
      }
    }
  }

  else
  {
    id v13 = 0LL;
  }

  return v10;
}

- (unint64_t)diskUsageForURL:(id)a3
{
  id v3 = a3;
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  uint64_t v20 = 0LL;
  [MEMORY[0x1896078B8] hashTableWithOptions:256];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = v3;
  uint64_t v6 = [v5 fileSystemRepresentation];
  id v16 = 0LL;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __33__MIFileManager_diskUsageForURL___block_invoke;
  v13[3] = &unk_189D49268;
  uint64_t v15 = &v17;
  id v7 = v4;
  id v14 = v7;
  char v8 = TraverseDirectory(v6, 2, 0x1C0u, &v16, v13);
  id v9 = v16;
  if ((v8 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    [v5 path];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();
  }

  unint64_t v10 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v10;
}

uint64_t __33__MIFileManager_diskUsageForURL___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 56) != 2)
  {
    if (*(_DWORD *)(a2 + 76) == 1)
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) += *(void *)(a2 + 8);
    }

    else
    {
      id v4 = *(const void **)a2;
      if (NSHashGet(*(NSHashTable **)(a1 + 32), *(const void **)a2))
      {
      }

      else
      {
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) += *(void *)(a2 + 8);
        NSHashInsertKnownAbsent(*(NSHashTable **)(a1 + 32), v4);
      }
    }
  }

  return 1LL;
}

- (BOOL)setModificationDateToNowForURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  int v6 = open((const char *)[v5 fileSystemRepresentation], 256);
  if (v6 < 0)
  {
    int v15 = *__error();
    id v16 = (void *)*MEMORY[0x189607688];
    [v5 path];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    strerror(v15);
    _CreateError( (uint64_t)"-[MIFileManager setModificationDateToNowForURL:error:]",  2679LL,  v16,  v15,  0LL,  0LL,  @"open() failed for %@: %s",  v18,  (uint64_t)v17);
    id v14 = (void *)objc_claimAutoreleasedReturnValue();

    BOOL v9 = 0;
    if (!a4) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }

  int v7 = v6;
  int v8 = futimes(v6, 0LL);
  BOOL v9 = v8 == 0;
  if (v8)
  {
    int v10 = *__error();
    id v11 = (void *)*MEMORY[0x189607688];
    [v5 path];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    strerror(v10);
    _CreateError( (uint64_t)"-[MIFileManager setModificationDateToNowForURL:error:]",  2685LL,  v11,  v10,  0LL,  0LL,  @"futimes() failed for %@: %s",  v13,  (uint64_t)v12);
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v14 = 0LL;
  }

  close(v7);
  if (a4)
  {
LABEL_8:
    if (!v9) {
      *a4 = v14;
    }
  }

- (id)modificationDateForURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (lstat((const char *)[v5 fileSystemRepresentation], &v11))
  {
    if (a4)
    {
      int v6 = *__error();
      int v7 = (void *)*MEMORY[0x189607688];
      [v5 path];
      int v8 = (void *)objc_claimAutoreleasedReturnValue();
      strerror(v6);
      _CreateError( (uint64_t)"-[MIFileManager modificationDateForURL:error:]",  2710LL,  v7,  v6,  0LL,  0LL,  @"lstat() failed for %@: %s",  v9,  (uint64_t)v8);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0LL;
    }
  }

  else
  {
    [MEMORY[0x189603F50] dateWithTimeIntervalSince1970:(double)v11.st_mtimespec.tv_nsec / 1000000000.0 + (double)v11.st_mtimespec.tv_sec];
    a4 = (id *)objc_claimAutoreleasedReturnValue();
  }

  return a4;
}

- (id)debugDescriptionForItemAtURL:(id)a3
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x189607940]);
  [v4 path];
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = (void *)[v5 initWithFormat:@"Extra info about %@: ", v6];

  memset(&v49, 0, sizeof(v49));
  id v8 = v4;
  if (lstat((const char *)[v8 fileSystemRepresentation], &v49))
  {
    int v9 = *__error();
    [v8 path];
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 appendFormat:@"Couldn't stat %@: %s", v10, strerror(v9)];

    stat v11 = (void *)[v7 copy];
    goto LABEL_50;
  }

  objc_msgSend( v7,  "appendFormat:",  @"dev=%d ino=%llu mode=0%ho nlink=%hu uid=%u gid=%u rdev=%d size=%lld atime=%lf mtime=%lf ctime=%lf birthtime=%lf blksize=%d blocks=%lld flags=0x%x ",  v49.st_dev,  v49.st_ino,  v49.st_mode,  v49.st_nlink,  v49.st_uid,  v49.st_gid,  v49.st_rdev,  v49.st_size,  (double)v49.st_atimespec.tv_nsec / 1000000000.0 + (double)v49.st_atimespec.tv_sec,  (double)v49.st_mtimespec.tv_nsec / 1000000000.0 + (double)v49.st_mtimespec.tv_sec,  (double)v49.st_ctimespec.tv_nsec / 1000000000.0 + (double)v49.st_ctimespec.tv_sec,  (double)v49.st_birthtimespec.tv_nsec / 1000000000.0 + (double)v49.st_birthtimespec.tv_sec,  v49.st_blksize,  v49.st_blocks,  v49.st_flags);
  if ((v49.st_mode & 0xF000) == 0x8000)
  {
    id v48 = 0LL;
    -[MIFileManager upToFirstFourBytesFromURL:error:](self, "upToFirstFourBytesFromURL:error:", v8, &v48);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = v48;
    if (v12)
    {
      [v7 appendFormat:@"firstBytes=%@ ", v12];
    }

    else
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        [v8 path];
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        id v37 = v13;
        MOLogWrite();
      }

      id v13 = 0LL;
    }
  }

  else
  {
    id v13 = 0LL;
  }

  id v47 = v13;
  -[MIFileManager aclTextFromURL:error:](self, "aclTextFromURL:error:", v8, &v47, v33, v37);
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = v47;

  if (v14)
  {
    [v7 appendFormat:@"ACL={ %@ } ", v14];
    goto LABEL_22;
  }

  [v15 domain];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v16 isEqualToString:*MEMORY[0x189607688]])
  {

    goto LABEL_18;
  }

  uint64_t v17 = [v15 code];

  if (v17 != 2)
  {
LABEL_18:
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      id v34 = v15;
      MOLogWrite();
    }

    goto LABEL_21;
  }

  [v7 appendString:@"ACL=<not found> "];
LABEL_21:

  id v15 = 0LL;
LABEL_22:
  id v46 = v15;
  -[MIFileManager extendedAttributesFromURL:error:](self, "extendedAttributesFromURL:error:", v8, &v46, v34);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  id v19 = v46;

  if (!v18)
  {
    [v19 domain];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v20 isEqualToString:@"MIInstallerErrorDomain"])
    {
      uint64_t v21 = [v19 code];

      if (v21 == 140)
      {
        [v7 appendString:@"extendedAttributes=<not found> "];
LABEL_31:

        id v19 = 0LL;
        goto LABEL_32;
      }
    }

    else
    {
    }

    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      id v35 = v19;
      MOLogWrite();
    }

    goto LABEL_31;
  }

  [v7 appendFormat:@"extendedAttributes=%@ ", v18];
LABEL_32:
  objc_msgSend(v8, "pathExtension", v35);
  int v22 = (void *)objc_claimAutoreleasedReturnValue();
  int v23 = [v22 isEqualToString:@"plist"];

  if (v23)
  {
    id v45 = v19;
    objc_msgSend(MEMORY[0x189603F68], "MI_dictionaryWithContentsOfURL:options:error:", v8, 0, &v45);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    id v25 = v45;

    if (v24)
    {
      objc_msgSend(v7, "appendFormat:", @"keyCount=%lu ", objc_msgSend(v24, "count"));
      if ([v24 count])
      {
        id v39 = v25;
        id v40 = v14;
        [v7 appendString:@"keySample={ "];
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        id v26 = v24;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v41 objects:v50 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = 0LL;
          uint64_t v30 = *(void *)v42;
LABEL_37:
          uint64_t v31 = 0LL;
          while (1)
          {
            if (*(void *)v42 != v30) {
              objc_enumerationMutation(v26);
            }
            [v7 appendFormat:@"%@ ", *(void *)(*((void *)&v41 + 1) + 8 * v31)];
            if (v29 + v31 == 4) {
              break;
            }
            if (v28 == ++v31)
            {
              uint64_t v28 = [v26 countByEnumeratingWithState:&v41 objects:v50 count:16];
              v29 += v31;
              if (v28) {
                goto LABEL_37;
              }
              break;
            }
          }
        }

        [v7 appendString:@"} "];
        id v25 = v39;
        id v14 = v40;
      }
    }

    else
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        [v8 path];
        id v36 = (void *)objc_claimAutoreleasedReturnValue();
        id v38 = v25;
        MOLogWrite();
      }

      id v25 = 0LL;
    }

    id v19 = v25;
  }

  stat v11 = (void *)objc_msgSend(v7, "copy", v36, v38);

LABEL_50:
  return v11;
}

- (void)logAccessPermissionsForURL:(id)a3
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  objc_msgSend(a3, "MI_allAccessURLs");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v35;
    uint64_t v29 = *MEMORY[0x189607688];
    uint64_t v30 = v3;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v35 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v34 + 1) + 8 * v7);
        memset(&v33, 0, sizeof(v33));
        id v9 = v8;
        if (!lstat((const char *)[v9 fileSystemRepresentation], &v33))
        {
          id v32 = 0LL;
          -[MIFileManager aclTextFromURL:error:](self, "aclTextFromURL:error:", v9, &v32);
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
          id v13 = v32;
          stat v11 = v13;
          if (v12)
          {
            if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
            {
              uint64_t st_mode = v33.st_mode;
              st_uid = (void *)v33.st_uid;
              st_gid = (char *)v33.st_gid;
              objc_msgSend(v9, "path", v24, v25);
              uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v27 = v17;
              uint64_t v28 = v12;
              id v25 = st_gid;
              uint64_t v26 = st_mode;
              uint64_t v24 = st_uid;
              MOLogWrite();
              goto LABEL_24;
            }

            goto LABEL_25;
          }

          [v13 domain];
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ([v18 isEqualToString:v29])
          {
            uint64_t v19 = [v11 code];

            if (v19 == 2) {
              goto LABEL_21;
            }
          }

          else
          {
          }

          if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
          {
            objc_msgSend(v9, "path", v24, v25, v26, v27, v28);
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
            id v25 = (char *)v11;
            MOLogWrite();
          }

+ (id)_sanitizeFilePathForVarOrTmpSymlink:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([v5 hasPrefix:@"/var"])
  {
    [MEMORY[0x189604030] fileURLWithPath:@"/var/" isDirectory:1];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [(id)objc_opt_class() defaultManager];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v21 = 0LL;
    [v7 realPathForURL:v6 allowNonExistentPathComponents:0 isDirectory:1 error:&v21];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = v21;

    if (v8)
    {
      [v8 path];
      stat v11 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = @"/var";
LABEL_7:
      objc_msgSend(v5, "substringFromIndex:", -[__CFString length](v12, "length"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 stringByAppendingString:v14];
      id v15 = (id)objc_claimAutoreleasedReturnValue();

      id v16 = 0LL;
      goto LABEL_13;
    }

    uint64_t v17 = @"Failed to get the real path of /var";
    uint64_t v18 = 2846LL;
    goto LABEL_12;
  }

  if ([v5 hasPrefix:@"/tmp"])
  {
    [MEMORY[0x189604030] fileURLWithPath:@"/tmp/" isDirectory:1];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [(id)objc_opt_class() defaultManager];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v20 = 0LL;
    [v13 realPathForURL:v6 allowNonExistentPathComponents:0 isDirectory:1 error:&v20];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = v20;

    if (v8)
    {
      [v8 path];
      stat v11 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = @"/tmp";
      goto LABEL_7;
    }

    uint64_t v17 = @"Failed to get the real path of /tmp";
    uint64_t v18 = 2856LL;
LABEL_12:
    _CreateAndLogError( (uint64_t)"+[MIFileManager _sanitizeFilePathForVarOrTmpSymlink:error:]",  v18,  @"MIInstallerErrorDomain",  4LL,  v9,  0LL,  v17,  v10,  (uint64_t)v20);
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    id v15 = 0LL;
LABEL_13:

    if (!a4) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }

  id v15 = v5;
  id v16 = 0LL;
  if (!a4) {
    goto LABEL_16;
  }
LABEL_14:
  if (!v15) {
    *a4 = v16;
  }
LABEL_16:

  return v15;
}

- (BOOL)secureRenameFromSourceURL:(id)a3 toDestinationURL:(id)a4 destinationStatus:(unsigned __int8)a5 error:(id *)a6
{
  int v7 = a5;
  id v10 = a3;
  id v11 = a4;
  uint64_t v62 = v10;
  [v10 URLByDeletingLastPathComponent];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v11;
  [v11 URLByDeletingLastPathComponent];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  id v14 = (void *)objc_opt_class();
  [v12 path];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  id v65 = 0LL;
  [v14 _sanitizeFilePathForVarOrTmpSymlink:v15 error:&v65];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  id v17 = v65;

  if (!v16)
  {
    [v12 path];
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIFileManager secureRenameFromSourceURL:toDestinationURL:destinationStatus:error:]",  2888LL,  @"MIInstallerErrorDomain",  4LL,  v17,  0LL,  @"Failed to sanitize source file path %@",  v29,  (uint64_t)v23);
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v31 = 0;
    id v22 = v17;
LABEL_10:
    stat v33 = v62;
    goto LABEL_30;
  }

  uint64_t v60 = a6;
  uint64_t v18 = (const char *)[v16 fileSystemRepresentation];
  uint64_t v19 = (void *)objc_opt_class();
  [v13 path];
  id v20 = (void *)objc_claimAutoreleasedReturnValue();
  id v64 = v17;
  [v19 _sanitizeFilePathForVarOrTmpSymlink:v20 error:&v64];
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  id v22 = v64;

  if (!v21)
  {
    [v13 path];
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIFileManager secureRenameFromSourceURL:toDestinationURL:destinationStatus:error:]",  2895LL,  @"MIInstallerErrorDomain",  4LL,  v22,  0LL,  @"Failed to sanitize destination file path %@",  v32,  (uint64_t)v23);
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v31 = 0;
    a6 = v60;
    goto LABEL_10;
  }

  id v58 = v22;
  uint64_t v59 = v13;
  id v23 = v21;
  uint64_t v24 = (const char *)[v23 fileSystemRepresentation];
  uint64_t v25 = open(v18, 537919488);
  if ((v25 & 0x80000000) != 0)
  {
    int v34 = *__error();
    __int128 v35 = (void *)*MEMORY[0x189607688];
    uint64_t v36 = v34;
    strerror(v34);
    _CreateError( (uint64_t)"-[MIFileManager secureRenameFromSourceURL:toDestinationURL:destinationStatus:error:]",  2903LL,  v35,  v36,  0LL,  0LL,  @"Failed to open file %s : %s",  v37,  (uint64_t)v18);
    id v30 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v26 = v25;
    int v27 = open(v24, 537919488);
    if ((v27 & 0x80000000) == 0)
    {
      int v28 = v27;
      if (v7 == 2)
      {
        BOOL v53 = 0;
        unsigned int v57 = 4;
      }

      else
      {
        if (v7 != 1)
        {
          __int128 v42 = v61;
          BOOL v53 = -[MIFileManager itemExistsAtURL:](self, "itemExistsAtURL:", v61);
          if (v53) {
            int v43 = 2;
          }
          else {
            int v43 = 4;
          }
          unsigned int v57 = v43;
LABEL_20:
          id v44 = [v62 lastPathComponent];
          id v45 = (const char *)[v44 fileSystemRepresentation];
          id v46 = [v42 lastPathComponent];
          LODWORD(v45) = renameatx_np(v26, v45, v28, (const char *)[v46 fileSystemRepresentation], v57);
          BOOL v31 = (_DWORD)v45 == 0;

          int v55 = v28;
          int v56 = v26;
          if ((_DWORD)v45)
          {
            int v47 = *__error();
            uint64_t v54 = (void *)*MEMORY[0x189607688];
            [v62 path];
            id v30 = (id)objc_claimAutoreleasedReturnValue();
            [v61 path];
            id v48 = (void *)objc_claimAutoreleasedReturnValue();
            strerror(v47);
            uint64_t v50 = _CreateError( (uint64_t)"-[MIFileManager secureRenameFromSourceURL:toDestinationURL:destinationStatus:error:]",  2929LL,  v54,  v47,  0LL,  0LL,  @"Failed to renameatx_np() for source fd %d path %@ to destination fd %d path %@ with flags 0x%x, Error: %s",  v49,  v26);
            a6 = v60;
          }

          else
          {
            if (!v53)
            {
              id v30 = 0LL;
              a6 = v60;
              goto LABEL_28;
            }

            id v63 = 0LL;
            stat v33 = v62;
            BOOL v51 = -[MIFileManager removeItemAtURL:error:](self, "removeItemAtURL:error:", v62, &v63);
            id v30 = v63;
            a6 = v60;
            if (v51)
            {
              id v13 = v59;
LABEL_29:
              id v22 = v58;
              close(v56);
              close(v55);
              goto LABEL_30;
            }

            if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
            {
              uint64_t v50 = 0LL;
              goto LABEL_23;
            }

            [v62 path];
            id v48 = (void *)objc_claimAutoreleasedReturnValue();
            MOLogWrite();
            uint64_t v50 = 0LL;
          }

LABEL_23:
          id v30 = (id)v50;
LABEL_28:
          id v13 = v59;
          stat v33 = v62;
          goto LABEL_29;
        }

        unsigned int v57 = 2;
        BOOL v53 = 1;
      }

      __int128 v42 = v61;
      goto LABEL_20;
    }

    int v38 = *__error();
    uint64_t v39 = (void *)*MEMORY[0x189607688];
    uint64_t v40 = v38;
    strerror(v38);
    _CreateError( (uint64_t)"-[MIFileManager secureRenameFromSourceURL:toDestinationURL:destinationStatus:error:]",  2910LL,  v39,  v40,  0LL,  0LL,  @"Failed to open file %s : %s",  v41,  (uint64_t)v24);
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    close(v26);
  }

  BOOL v31 = 0;
  id v13 = v59;
  a6 = v60;
  stat v33 = v62;
LABEL_30:

  if (a6 && !v31) {
    *a6 = v30;
  }

  return v31;
}

- (void)_moveItemAtURL:(uint64_t)a3 toURL:(uint64_t)a4 failIfSrcMissing:(uint64_t)a5 error:(uint64_t)a6 .cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

void __124__MIFileManager__stageURLByCopying_toItemName_inStagingDir_stagingMode_settingUID_gid_dataProtectionClass_hasSymlink_error___block_invoke_cold_1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

@end
@interface LSBundleProxy
+ (BOOL)canInstantiateFromDatabase;
+ (BOOL)supportsSecureCoding;
+ (LSBundleProxy)bundleProxyWithAuditToken:(id *)a3 error:(id *)a4;
+ (id)bundleProxyForCurrentProcess;
+ (id)bundleProxyForIdentifier:(id)a3;
+ (id)bundleProxyForURL:(id)a3;
+ (id)bundleProxyForURL:(id)a3 error:(id *)a4;
+ (void)clearBundleProxyForCurrentProcess;
- (BOOL)_hasAssociatedPersonas;
- (BOOL)_usesSystemPersona;
- (BOOL)foundBackingBundle;
- (BOOL)isContainerized;
- (BOOL)isEqual:(id)a3;
- (LSBundleProxy)initWithCoder:(id)a3;
- (NSArray)machOUUIDs;
- (NSDictionary)entitlements;
- (NSDictionary)environmentVariables;
- (NSDictionary)groupContainerURLs;
- (NSString)bundleExecutable;
- (NSString)bundleIdentifier;
- (NSString)bundleType;
- (NSString)bundleVersion;
- (NSString)canonicalExecutablePath;
- (NSString)localizedShortName;
- (NSString)sdkVersion;
- (NSString)signerIdentity;
- (NSString)signerOrganization;
- (NSURL)appStoreReceiptURL;
- (NSURL)bundleContainerURL;
- (NSURL)bundleURL;
- (NSURL)containerURL;
- (NSURL)dataContainerURL;
- (NSUUID)cacheGUID;
- (_LSLazyPropertyList)_entitlements;
- (_LSLazyPropertyList)_environmentVariables;
- (_LSLazyPropertyList)_infoDictionary;
- (id)_initWithBundleUnit:(unsigned int)a3 context:(LSContext *)a4 bundleType:(unint64_t)a5 bundleID:(id)a6 localizedName:(id)a7 bundleContainerURL:(id)a8 dataContainerURL:(id)a9 resourcesDirectoryURL:(id)a10 iconsDictionary:(id)a11 iconFileNames:(id)a12 version:(id)a13;
- (id)_localizedNameWithPreferredLocalizations:(id)a3 useShortNameOnly:(BOOL)a4;
- (id)_managedPersonas;
- (id)_stringLocalizerForTable:(id)a3;
- (id)appStoreReceiptName;
- (id)entitlementValueForKey:(id)a3 ofClass:(Class)a4;
- (id)entitlementValueForKey:(id)a3 ofClass:(Class)a4 valuesOfClass:(Class)a5;
- (id)entitlementValuesForKeys:(id)a3;
- (id)localizedName;
- (id)localizedValuesForKeys:(id)a3 fromTable:(id)a4;
- (id)objectForInfoDictionaryKey:(id)a3 ofClass:(Class)a4;
- (id)objectForInfoDictionaryKey:(id)a3 ofClass:(Class)a4 valuesOfClass:(Class)a5;
- (id)objectsForInfoDictionaryKeys:(id)a3;
- (unint64_t)compatibilityState;
- (unint64_t)hash;
- (unint64_t)sequenceNumber;
- (void)_setCompatibilityState:(unint64_t)a3;
- (void)_setEntitlements:(id)a3;
- (void)_setEnvironmentVariables:(id)a3;
- (void)_setInfoDictionary:(id)a3;
- (void)canonicalExecutablePath;
- (void)encodeWithCoder:(id)a3;
- (void)setMachOUUIDs:(id)a3;
- (void)setSDKVersion:(id)a3;
@end

@implementation LSBundleProxy

+ (BOOL)canInstantiateFromDatabase
{
  int MayMapDatabase = _LSCurrentProcessMayMapDatabase();
  if (MayMapDatabase) {
    LOBYTE(MayMapDatabase) = !+[_LSQueryContext simulateLimitedMappingForXCTests]( &OBJC_CLASS____LSQueryContext,  "simulateLimitedMappingForXCTests");
  }
  return MayMapDatabase;
}

- (id)_initWithBundleUnit:(unsigned int)a3 context:(LSContext *)a4 bundleType:(unint64_t)a5 bundleID:(id)a6 localizedName:(id)a7 bundleContainerURL:(id)a8 dataContainerURL:(id)a9 resourcesDirectoryURL:(id)a10 iconsDictionary:(id)a11 iconFileNames:(id)a12 version:(id)a13
{
  uint64_t v17 = *(void *)&a3;
  uint64_t v96 = *MEMORY[0x1895F89C0];
  id v79 = a6;
  id v80 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  id v75 = a12;
  id v74 = a13;
  v77 = v20;
  v78 = v19;
  v76 = v21;
  if ((_DWORD)v17)
  {
    if (a4)
    {
      uint64_t v22 = _LSDatabaseGetCacheGUID();
      uint64_t SequenceNumber = _LSDatabaseGetSequenceNumber();
      uint64_t v24 = _LSBundleGet(a4->db, v17);
      if (v24)
      {
        uint64_t v25 = v24;
        v66 = *(void **)(v24 + 272);
        unint64_t v26 = *(void *)(v24 + 164);
        if (*(_DWORD *)v24)
        {
          *(void *)buf = 0LL;
          int v27 = _LSBundleCopyNode(a4->db, v17, 0LL, 0LL, buf);
          uint64_t v28 = 0LL;
          if (!v27)
          {
            uint64_t v28 = [*(id *)buf URL];
          }

          id v72 = (id)v28;

          if (v18) {
            goto LABEL_26;
          }
        }

        else
        {
          id v72 = 0LL;
          if (v18)
          {
LABEL_26:
            v63 = (void *)v22;
            id v64 = v18;
            uint64_t v68 = *(void *)(v25 + 264);
            v71 = (void *)_CSStringCopyCFString();
            __int128 v47 = *(_OWORD *)(v25 + 76);
            v95[0] = *(_OWORD *)(v25 + 60);
            v95[1] = v47;
            _LSVersionNumberGetStringRepresentation(v95);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v65 = (v26 >> 38) & 1;
            v69 = +[_LSLazyPropertyList lazyPropertyListWithContext:unit:]( &OBJC_CLASS____LSLazyPropertyList,  "lazyPropertyListWithContext:unit:",  a4,  *(unsigned int *)(v25 + 128));
            __int128 v83 = 0u;
            __int128 v84 = 0u;
            __int128 v85 = 0u;
            __int128 v86 = 0u;
            uint64_t v61 = v25;
            v62 = a4;
            _LSDatabaseGetStringArray(a4->db);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v49 = [v48 countByEnumeratingWithState:&v83 objects:v94 count:16];
            if (v49)
            {
              uint64_t v50 = v49;
              v34 = 0LL;
              uint64_t v51 = *(void *)v84;
              do
              {
                for (uint64_t i = 0LL; i != v50; ++i)
                {
                  if (*(void *)v84 != v51) {
                    objc_enumerationMutation(v48);
                  }
                  uint64_t v53 = *(void *)(*((void *)&v83 + 1) + 8 * i);
                  v54 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDString:v53];
                  if (v54)
                  {
                    if (!v34)
                    {
                      [MEMORY[0x189603FA8] array];
                      v34 = (void *)objc_claimAutoreleasedReturnValue();
                    }

                    [v34 addObject:v54];
                  }

                  else
                  {
                    _LSDefaultLog();
                    v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(void *)&buf[4] = v53;
                      _os_log_impl( &dword_183E58000,  v55,  OS_LOG_TYPE_DEFAULT,  "Launch Services: Failed to create a UUID from invalid string %@",  buf,  0xCu);
                    }
                  }
                }

                uint64_t v50 = [v48 countByEnumeratingWithState:&v83 objects:v94 count:16];
              }

              while (v50);
            }

            else
            {
              v34 = 0LL;
            }
            v33 = +[_LSLazyPropertyList lazyPropertyListWithContext:unit:]( &OBJC_CLASS____LSLazyPropertyList,  "lazyPropertyListWithContext:unit:",  v62,  *(unsigned int *)(v61 + 132));
            char v81 = 1;
            id v43 = v80;
            id v30 = v63;
            v32 = v64;
            goto LABEL_43;
          }
        }

        int v45 = *(_DWORD *)(v25 + 484);
        if (v45)
        {
          v46 = _LSAliasCopyResolvedNode(a4->db, v45, 0LL, 0LL, 0LL);
          [v46 URL];
          id v18 = (id)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          id v18 = 0LL;
        }

        goto LABEL_26;
      }

      v32 = v18;
      _LSDefaultLog();
      v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = v79;
        __int16 v90 = 2112;
        uint64_t v91 = v22;
        __int16 v92 = 2048;
        uint64_t v93 = SequenceNumber;
        _os_log_error_impl( &dword_183E58000,  v44,  OS_LOG_TYPE_ERROR,  "LaunchServices: _LSBundleGet() failed, can't create LSBundleProxy for %@ {%@ %llu}",  buf,  0x20u);
      }

      id v30 = (id)v22;
      uint64_t v68 = SequenceNumber;

      v33 = 0LL;
      v34 = 0LL;
      v69 = 0LL;
      v70 = 0LL;
      v71 = 0LL;
      v66 = 0LL;
    }

    else
    {
      _LSDefaultLog();
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        -[LSBundleProxy _initWithBundleUnit:context:bundleType:bundleID:localizedName:bundleContainerURL:dataContainerURL:resourcesDirectoryURL:iconsDictionary:iconFileNames:version:].cold.1( v17,  v35,  v36,  v37,  v38,  v39,  v40,  v41);
      }
      v32 = v18;

      id v30 = 0LL;
      v33 = 0LL;
      v34 = 0LL;
      v69 = 0LL;
      v70 = 0LL;
      v71 = 0LL;
      v66 = 0LL;
      uint64_t v68 = 0LL;
    }

    LOBYTE(v65) = 0;
    id v72 = 0LL;
LABEL_21:
    char v81 = 1;
    id v43 = v80;
    goto LABEL_43;
  }
  v29 = +[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace");
  id v87 = 0LL;
  id v88 = 0LL;
  [v29 getKnowledgeUUID:&v88 andSequenceNumber:&v87];
  id v30 = v88;
  id v31 = v87;

  uint64_t v68 = [v31 unsignedLongLongValue];
  v32 = v18;
  if (a5 == 6)
  {
    v71 = 0LL;
    id v72 = v20;
    v33 = 0LL;
    v34 = 0LL;
    v69 = 0LL;
    v70 = 0LL;
    LOBYTE(v65) = 1;
    v66 = 0LL;
    goto LABEL_21;
  }

  _LSDefaultLog();
  v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v43 = v80;
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v79;
    __int16 v90 = 2112;
    uint64_t v91 = (uint64_t)v30;
    __int16 v92 = 2048;
    uint64_t v93 = v68;
    _os_log_debug_impl( &dword_183E58000,  v42,  OS_LOG_TYPE_DEBUG,  "LaunchServices: failed to find bundle record for %@ {%@ %llu}",  buf,  0x20u);
  }

  v33 = 0LL;
  v34 = 0LL;
  v69 = 0LL;
  v70 = 0LL;
  v71 = 0LL;
  id v72 = 0LL;
  LOBYTE(v65) = 0;
  v66 = 0LL;
  char v81 = 0;
LABEL_43:
  v82.receiver = self;
  v82.super_class = (Class)&OBJC_CLASS___LSBundleProxy;
  v56 = -[LSResourceProxy _initWithLocalizedName:](&v82, sel__initWithLocalizedName_, v43);
  v57 = v56;
  if (v56)
  {
    objc_storeStrong(v56 + 5, a6);
    objc_storeStrong(v57 + 6, v72);
    objc_storeStrong(v57 + 7, v71);
    objc_storeStrong(v57 + 8, v32);
    *((_BYTE *)v57 + 32) = v81;
    objc_storeStrong(v57 + 9, a13);
    objc_storeStrong(v57 + 11, v30);
    v57[12] = (id)v68;
    *((_BYTE *)v57 + 33) = v65;
    id v58 = v57[3];
    v57[3] = 0LL;

    objc_storeStrong(v57 + 15, v69);
    objc_storeStrong(v57 + 13, v34);
    objc_storeStrong(v57 + 10, v70);
    objc_storeStrong(v57 + 16, v33);
    v57[14] = v66;
    [v57 _setIconsDictionary:v76];
  }

  v59 = v57;

  return v59;
}

- (void)_initWithBundleUnit:(uint64_t)a3 context:(uint64_t)a4 bundleType:(uint64_t)a5 bundleID:(uint64_t)a6 localizedName:(uint64_t)a7 bundleContainerURL:(uint64_t)a8 dataContainerURL:resourcesDirectoryURL:iconsDictionary:iconFileNames:version:.cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (id)localizedName
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___LSBundleProxy;
  v3 = -[LSResourceProxy localizedName](&v6, sel_localizedName);
  os_unfair_lock_unlock(&localizedNameLock);
  if (!v3)
  {
    v3 = -[LSBundleProxy _localizedNameWithPreferredLocalizations:useShortNameOnly:]( self,  "_localizedNameWithPreferredLocalizations:useShortNameOnly:",  0LL,  0LL);
    if (v3)
    {
      os_unfair_lock_lock(&localizedNameLock);
      v4 = (void *)[v3 copy];
      -[LSResourceProxy _setLocalizedName:](self, "_setLocalizedName:", v4);

      os_unfair_lock_unlock(&localizedNameLock);
    }
  }

  return v3;
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (NSUUID)cacheGUID
{
  return self->_cacheGUID;
}

- (id)objectsForInfoDictionaryKeys:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 handleFailureInMethod:a2, self, @"LSBundleProxy.m", 767, @"Invalid parameter not satisfying: %@", @"keys != nil" object file lineNumber description];
  }

  objc_super v6 = objc_alloc(&OBJC_CLASS___LSBundleInfoCachedValues);
  v7 = -[LSBundleProxy _infoDictionary](self, "_infoDictionary");
  [v7 uncheckedObjectsForKeys:v5];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = -[LSBundleInfoCachedValues _initWithKeys:forDictionary:](v6, "_initWithKeys:forDictionary:", v5, v8);

  return v9;
}

- (_LSLazyPropertyList)_infoDictionary
{
  return self->__infoDictionary;
}

- (id)entitlementValuesForKeys:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 handleFailureInMethod:a2, self, @"LSBundleProxy.m", 740, @"Invalid parameter not satisfying: %@", @"keys != nil" object file lineNumber description];
  }

  objc_super v6 = objc_alloc(&OBJC_CLASS___LSBundleInfoCachedValues);
  v7 = -[LSBundleProxy _entitlements](self, "_entitlements");
  [v7 uncheckedObjectsForKeys:v5];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = -[LSBundleInfoCachedValues _initWithKeys:forDictionary:](v6, "_initWithKeys:forDictionary:", v5, v8);

  return v9;
}

- (_LSLazyPropertyList)_entitlements
{
  return self->__entitlements;
}

- (NSString)canonicalExecutablePath
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    _LSDefaultLog();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[LSBundleProxy canonicalExecutablePath].cold.1();
    }
    goto LABEL_8;
  }
  v4 = -[LSBundleProxy bundleURL](self, "bundleURL");
  if (!v4)
  {
    _LSDefaultLog();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[LSBundleProxy canonicalExecutablePath].cold.2();
    }
LABEL_8:

    v10 = 0LL;
    return (NSString *)v10;
  }

  id v5 = objc_alloc(MEMORY[0x189604030]);
  -[LSBundleProxy bundleExecutable](self, "bundleExecutable");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[LSBundleProxy bundleURL](self, "bundleURL");
  [v7 URLByResolvingSymlinksInPath];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = (void *)[v5 initFileURLWithPath:v6 isDirectory:0 relativeToURL:v8];
  [v9 path];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (NSString)bundleExecutable
{
  return self->_bundleExecutable;
}

- (NSURL)bundleContainerURL
{
  return self->_bundleContainerURL;
}

- (NSString)sdkVersion
{
  return self->_sdkVersion;
}

- (void).cxx_destruct
{
}

+ (LSBundleProxy)bundleProxyWithAuditToken:(id *)a3 error:(id *)a4
{
  __int128 v4 = *(_OWORD *)&a3->var0[4];
  v8[0] = *(_OWORD *)a3->var0;
  v8[1] = v4;
  +[LSBundleRecord bundleRecordForAuditToken:error:]( &OBJC_CLASS___LSBundleRecord,  "bundleRecordForAuditToken:error:",  v8,  a4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 compatibilityObject];
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (LSBundleProxy *)v6;
}

+ (id)bundleProxyForIdentifier:(id)a3
{
  __int128 v4 = (__CFString *)a3;
  if ([a1 canInstantiateFromDatabase])
  {
    v10.db = 0LL;
    if (_LSContextInit((id *)&v10.db))
    {
      id v5 = 0LL;
LABEL_10:

      goto LABEL_11;
    }

    uint64_t v6 = _LSFindBundleWithInfo_NoIOFiltered(&v10, 1uLL, v4, 0, 0LL, 0LL, 0LL, 0LL, 0LL);
    unsigned int v9 = v6;
    if ((_DWORD)v6
      || (uint64_t v6 = _LSFindBundleWithInfo_NoIOFiltered(&v10, 3uLL, v4, 0, 0LL, 0LL, 0LL, 0LL, 0LL), (v9 = v6) != 0))
    {
      uint64_t v7 = +[LSApplicationProxy applicationProxyWithBundleUnitID:withContext:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyWithBundleUnitID:withContext:",  v6,  &v10);
    }

    else
    {
      unsigned int v9 = _LSFindBundleWithInfo_NoIOFiltered(&v10, 5uLL, v4, 0, 0LL, 0LL, 0LL, 0LL, 0LL);
      if (v9)
      {
        uint64_t v7 = +[LSVPNPluginProxy VPNPluginProxyForIdentifier:withContext:]( &OBJC_CLASS___LSVPNPluginProxy,  "VPNPluginProxyForIdentifier:withContext:",  v4,  &v10);
      }

      else
      {
        if (!_LSPluginFindWithInfo(v10.db, 0LL, v4, 3, 0LL, &v9, 0LL))
        {
          id v5 = 0LL;
          goto LABEL_9;
        }

        uint64_t v7 = +[LSPlugInKitProxy plugInKitProxyForPlugin:withContext:]( &OBJC_CLASS___LSPlugInKitProxy,  "plugInKitProxyForPlugin:withContext:",  v9,  &v10);
      }
    }

    id v5 = (void *)v7;
LABEL_9:
    _LSContextDestroy((void **)&v10.db);
    goto LABEL_10;
  }

  +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v5;
}

+ (id)bundleProxyForURL:(id)a3
{
  return (id)[a1 bundleProxyForURL:a3 error:0];
}

+ (id)bundleProxyForURL:(id)a3 error:(id *)a4
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  if ([a1 canInstantiateFromDatabase])
  {
    v13.db = 0LL;
    if (!_LSContextInitReturningError((uint64_t)&v13, (uint64_t)a4))
    {
      v8 = 0LL;
LABEL_18:

      goto LABEL_19;
    }

    uint64_t v7 = _LSFindBundleWithInfo_NoIOFiltered(&v13, 0LL, 0LL, 0, v6, 0LL, 0LL, 0LL, a4);
    if ((_DWORD)v7)
    {
      v8 = +[LSApplicationProxy applicationProxyWithBundleUnitID:withContext:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyWithBundleUnitID:withContext:",  v7,  &v13);
LABEL_17:
      _LSContextDestroy((void **)&v13.db);
      goto LABEL_18;
    }

    unsigned int v9 = -[FSNode initWithURL:flags:error:](objc_alloc(&OBJC_CLASS___FSNode), "initWithURL:flags:error:", v6, 0LL, a4);
    if (v9)
    {
      unsigned int v12 = 0;
      if (_LSPluginFindWithInfo(v13.db, 0LL, 0LL, 0, v9, &v12, a4))
      {
        v8 = +[LSPlugInKitProxy plugInKitProxyForPlugin:withContext:]( &OBJC_CLASS___LSPlugInKitProxy,  "plugInKitProxyForPlugin:withContext:",  v12,  &v13);
LABEL_16:

        goto LABEL_17;
      }

      _LSDefaultLog();
      LSContext v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v6;
        _os_log_impl(&dword_183E58000, v10, OS_LOG_TYPE_DEFAULT, "no registered bundle with URL %@", buf, 0xCu);
      }
    }

    v8 = 0LL;
    goto LABEL_16;
  }

  __LAUNCH_SERVICES_IS_GENERATING_A_SANDBOX_EXCEPTION_BECAUSE_THIS_PROCESS_MAY_NOT_MAP_THE_DATABASE__();
  __LAUNCH_SERVICES_IS_ABORTING_BECAUSE_THIS_PROCESS_MAY_NOT_MAP_THE_DATABASE__();
  if (a4)
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -54LL,  (uint64_t)"+[LSBundleProxy bundleProxyForURL:error:]",  291LL,  0LL);
    v8 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v8 = 0LL;
  }

+ (void)clearBundleProxyForCurrentProcess
{
  v2 = (void *)current;
  current = 0LL;

  os_unfair_lock_unlock((os_unfair_lock_t)&currentLock);
}

+ (id)bundleProxyForCurrentProcess
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  os_unfair_lock_lock((os_unfair_lock_t)&currentLock);
  [(id)current bundleIdentifier];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x1896077F8] mainBundle];
  __int128 v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 bundleIdentifier];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!current) {
    goto LABEL_15;
  }
  if (([v3 isEqual:v5] & 1) == 0)
  {
    _LSDefaultLog();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v3;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl( &dword_183E58000,  v6,  OS_LOG_TYPE_DEFAULT,  "Current bundle's identifier changed from %@ to %@",  buf,  0x16u);
    }

    uint64_t v7 = (void *)current;
    current = 0LL;
  }

  v8 = (void *)current;
  if (!current)
  {
LABEL_15:
    if (_LSCurrentProcessMayMapDatabase())
    {
      +[LSBundleRecord bundleRecordForCurrentProcess](&OBJC_CLASS___LSBundleRecord, "bundleRecordForCurrentProcess");
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = [v9 compatibilityObject];
      v11 = (void *)current;
      current = v10;
    }

    else
    {
      +[_LSDService synchronousXPCProxyWithErrorHandler:]( (uint64_t)&OBJC_CLASS____LSDReadService,  __block_literal_global_13);
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 getBundleProxyForCurrentProcessWithCompletionHandler:&__block_literal_global_17];
    }

    v8 = (void *)current;
    if (current)
    {
      dispatch_time_t v12 = dispatch_time(0LL, 5000000000LL);
      dispatch_get_global_queue(0LL, 0LL);
      LSContext v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __45__LSBundleProxy_bundleProxyForCurrentProcess__block_invoke_18;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = a1;
      dispatch_after(v12, v13, block);

      v8 = (void *)current;
    }
  }

  id v14 = v8;

  os_unfair_lock_unlock((os_unfair_lock_t)&currentLock);
  return v14;
}

void __45__LSBundleProxy_bundleProxyForCurrentProcess__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  _LSDefaultLog();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __45__LSBundleProxy_bundleProxyForCurrentProcess__block_invoke_cold_1();
  }
}

void __45__LSBundleProxy_bundleProxyForCurrentProcess__block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&current, a2);
  }

  else
  {
    _LSDefaultLog();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __45__LSBundleProxy_bundleProxyForCurrentProcess__block_invoke_cold_1();
    }
  }
}

void __45__LSBundleProxy_bundleProxyForCurrentProcess__block_invoke_18(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x186E2A59C]();
  [*(id *)(a1 + 32) clearBundleProxyForCurrentProcess];
  objc_autoreleasePoolPop(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LSBundleProxy)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___LSBundleProxy;
  id v5 = -[LSResourceProxy initWithCoder:](&v29, sel_initWithCoder_, v4);
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"bundleIdentifier");
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    uint64_t v8 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"bundleURL");
    bundleURL = v5->_bundleURL;
    v5->_bundleURL = (NSURL *)v8;

    uint64_t v10 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"bundleVersion");
    bundleVersion = v5->_bundleVersion;
    v5->_bundleVersion = (NSString *)v10;

    uint64_t v12 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"bundleExecutable");
    bundleExecutable = v5->_bundleExecutable;
    v5->_bundleExecutable = (NSString *)v12;

    uint64_t v14 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"bundleContainerURL");
    bundleContainerURL = v5->_bundleContainerURL;
    v5->_bundleContainerURL = (NSURL *)v14;

    v5->_sequenceNumber = [v4 decodeInt64ForKey:@"sequenceNumber"];
    v5->_compatibilityState = [v4 decodeInt64ForKey:@"compatibilityState"];
    v5->_foundBackingBundle = [v4 decodeBoolForKey:@"foundBundle"];
    uint64_t v16 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"cacheGUID");
    cacheGUID = v5->_cacheGUID;
    v5->_cacheGUID = (NSUUID *)v16;

    v5->_containerized = [v4 decodeBoolForKey:@"isContainerized"];
    uint64_t v18 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"localizedShortName");
    localizedShortName = v5->_localizedShortName;
    v5->_localizedShortName = (NSString *)v18;

    uint64_t v20 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"infoDictionary");
    infoDictionary = v5->__infoDictionary;
    v5->__infoDictionary = (_LSLazyPropertyList *)v20;

    uint64_t v22 = objc_msgSend(v4, "ls_decodeArrayWithValuesOfClass:forKey:", objc_opt_class(), @"machOUUIDs");
    machOUUIDs = v5->_machOUUIDs;
    v5->_machOUUIDs = (NSArray *)v22;

    uint64_t v24 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"sdkVersion");
    sdkVersion = v5->_sdkVersion;
    v5->_sdkVersion = (NSString *)v24;

    uint64_t v26 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"entitlements");
    entitlements = v5->__entitlements;
    v5->__entitlements = (_LSLazyPropertyList *)v26;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___LSBundleProxy;
  id v4 = a3;
  -[LSResourceProxy encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend( v4,  "encodeObject:forKey:",  self->_bundleIdentifier,  @"bundleIdentifier",  v5.receiver,  v5.super_class);
  [v4 encodeObject:self->_bundleURL forKey:@"bundleURL"];
  [v4 encodeObject:self->_bundleVersion forKey:@"bundleVersion"];
  [v4 encodeObject:self->_bundleExecutable forKey:@"bundleExecutable"];
  [v4 encodeObject:self->_bundleContainerURL forKey:@"bundleContainerURL"];
  [v4 encodeInt64:self->_sequenceNumber forKey:@"sequenceNumber"];
  [v4 encodeInt64:self->_compatibilityState forKey:@"compatibilityState"];
  [v4 encodeBool:self->_foundBackingBundle forKey:@"foundBundle"];
  [v4 encodeObject:self->_cacheGUID forKey:@"cacheGUID"];
  [v4 encodeBool:self->_containerized forKey:@"isContainerized"];
  [v4 encodeObject:self->_localizedShortName forKey:@"localizedShortName"];
  [v4 encodeObject:self->__infoDictionary forKey:@"infoDictionary"];
  [v4 encodeObject:self->_machOUUIDs forKey:@"machOUUIDs"];
  [v4 encodeObject:self->_sdkVersion forKey:@"sdkVersion"];
  [v4 encodeObject:self->__entitlements forKey:@"entitlements"];
}

- (NSString)bundleType
{
  return 0LL;
}

- (NSURL)containerURL
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[LSBundleProxy dataContainerURL](self, "dataContainerURL");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    -[LSBundleProxy bundleURL](self, "bundleURL");
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LSBundleProxy bundleIdentifier](self, "bundleIdentifier");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 path];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (([v7 hasPrefix:@"/var/mobile/Applications/"] & 1) != 0
      || [v7 hasPrefix:@"/private/var/mobile/Applications/"])
    {
      id v8 = objc_alloc(MEMORY[0x189604030]);
      [v7 stringByDeletingLastPathComponent];
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue();
      id v4 = (void *)[v8 initFileURLWithPath:v9 isDirectory:1];
    }

    else
    {
      id v4 = (void *)[objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:@"/var/mobile/" isDirectory:1];
    }
  }

  return (NSURL *)v4;
}

- (id)_managedPersonas
{
  return (id)MEMORY[0x189604A58];
}

- (BOOL)_usesSystemPersona
{
  return 0;
}

- (BOOL)_hasAssociatedPersonas
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSURL)dataContainerURL
{
  return 0LL;
}

- (id)appStoreReceiptName
{
  else {
    return @"receipt";
  }
}

- (NSURL)appStoreReceiptURL
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 URLByAppendingPathComponent:@"StoreKit" isDirectory:1];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[LSBundleProxy appStoreReceiptName](self, "appStoreReceiptName");
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 URLByAppendingPathComponent:v5 isDirectory:0];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  return (NSURL *)v6;
}

- (NSDictionary)environmentVariables
{
  return (NSDictionary *)MEMORY[0x189604A60];
}

- (NSString)signerIdentity
{
  return 0LL;
}

- (NSString)signerOrganization
{
  return 0LL;
}

- (NSDictionary)entitlements
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LSLazyPropertyList propertyList](v2);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (id)entitlementValueForKey:(id)a3 ofClass:(Class)a4
{
  return -[LSBundleProxy entitlementValueForKey:ofClass:valuesOfClass:]( self,  "entitlementValueForKey:ofClass:valuesOfClass:",  a3,  a4,  0LL);
}

- (id)entitlementValueForKey:(id)a3 ofClass:(Class)a4 valuesOfClass:(Class)a5
{
  id v9 = a3;
  if (!v9)
  {
    [MEMORY[0x1896077D8] currentHandler];
    LSContext v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 handleFailureInMethod:a2, self, @"LSBundleProxy.m", 752, @"Invalid parameter not satisfying: %@", @"key != nil" object file lineNumber description];
  }

  -[LSBundleProxy _entitlements](self, "_entitlements");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 objectForKey:v9 checkingKeyClass:a4 checkingValueClass:a5];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSDictionary)groupContainerURLs
{
  return (NSDictionary *)MEMORY[0x189604A60];
}

- (id)objectForInfoDictionaryKey:(id)a3 ofClass:(Class)a4
{
  return -[LSBundleProxy objectForInfoDictionaryKey:ofClass:valuesOfClass:]( self,  "objectForInfoDictionaryKey:ofClass:valuesOfClass:",  a3,  a4,  0LL);
}

- (id)objectForInfoDictionaryKey:(id)a3 ofClass:(Class)a4 valuesOfClass:(Class)a5
{
  id v9 = a3;
  if (!v9)
  {
    [MEMORY[0x1896077D8] currentHandler];
    LSContext v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 handleFailureInMethod:a2, self, @"LSBundleProxy.m", 778, @"Invalid parameter not satisfying: %@", @"key != nil" object file lineNumber description];
  }

  -[LSBundleProxy _infoDictionary](self, "_infoDictionary");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 objectForKey:v9 checkingKeyClass:a4 checkingValueClass:a5];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_stringLocalizerForTable:(id)a3
{
  id v4 = a3;
  objc_super v5 = objc_alloc(&OBJC_CLASS____LSStringLocalizer);
  -[LSBundleProxy bundleURL](self, "bundleURL");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = -[_LSStringLocalizer initWithBundleURL:stringsFile:](v5, "initWithBundleURL:stringsFile:", v6, v4);

  return v7;
}

- (id)localizedValuesForKeys:(id)a3 fromTable:(id)a4
{
  id v7 = a3;
  id v8 = (__CFString *)a4;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 handleFailureInMethod:a2, self, @"LSBundleProxy.m", 793, @"Invalid parameter not satisfying: %@", @"keys != nil" object file lineNumber description];
  }

  id v9 = (void *)MEMORY[0x186E2A59C]();
  -[LSBundleProxy bundleURL](self, "bundleURL");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v11 = +[FSNode canReadURL:fromSandboxWithAuditToken:]( &OBJC_CLASS___FSNode,  "canReadURL:fromSandboxWithAuditToken:",  v10,  0LL);

  id v12 = 0LL;
  if (v11)
  {
    if (v8) {
      LSContext v13 = v8;
    }
    else {
      LSContext v13 = @"InfoPlist";
    }
    -[LSBundleProxy _stringLocalizerForTable:](self, "_stringLocalizerForTable:", v13);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 localizedStringsWithStrings:v7 preferredLocalizations:0];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15) {
      id v12 = -[LSBundleInfoCachedValues _initWithKeys:forDictionary:]( objc_alloc(&OBJC_CLASS___LSBundleInfoCachedValues),  "_initWithKeys:forDictionary:",  v7,  v15);
    }
    else {
      id v12 = 0LL;
    }
  }

  objc_autoreleasePoolPop(v9);

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LSBundleProxy *)a3;
  objc_super v5 = v4;
  if (self == v4)
  {
    char v12 = 1;
  }

  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    -[LSBundleProxy bundleType](v6, "bundleType");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LSBundleProxy bundleType](self, "bundleType");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    int v9 = [v7 isEqual:v8];

    if (v9)
    {
      -[LSBundleProxy _valueForEqualityTesting](self, "_valueForEqualityTesting");
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[LSBundleProxy _valueForEqualityTesting](v6, "_valueForEqualityTesting");
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
      char v12 = [v10 isEqual:v11];
    }

    else
    {
      char v12 = 0;
    }
  }

  else
  {
    char v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)setSDKVersion:(id)a3
{
}

- (BOOL)foundBackingBundle
{
  return self->_foundBackingBundle;
}

- (BOOL)isContainerized
{
  return self->_containerized;
}

- (NSArray)machOUUIDs
{
  return self->_machOUUIDs;
}

- (void)setMachOUUIDs:(id)a3
{
}

- (unint64_t)compatibilityState
{
  return self->_compatibilityState;
}

- (void)_setCompatibilityState:(unint64_t)a3
{
  self->_compatibilityState = a3;
}

- (void)_setInfoDictionary:(id)a3
{
}

- (void)_setEntitlements:(id)a3
{
}

- (_LSLazyPropertyList)_environmentVariables
{
  return self->__environmentVariables;
}

- (void)_setEnvironmentVariables:(id)a3
{
}

- (NSString)localizedShortName
{
  unint64_t v3 = self->_localizedShortName;
  os_unfair_lock_unlock(&localizedNameLock);
  if (!v3)
  {
    -[LSBundleProxy _localizedNameWithPreferredLocalizations:useShortNameOnly:]( self,  "_localizedNameWithPreferredLocalizations:useShortNameOnly:",  0LL,  1LL);
    unint64_t v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      os_unfair_lock_lock(&localizedNameLock);
      id v4 = (NSString *)-[NSString copy](v3, "copy");
      localizedShortName = self->_localizedShortName;
      self->_localizedShortName = v4;

      os_unfair_lock_unlock(&localizedNameLock);
    }
  }

  return v3;
}

- (id)_localizedNameWithPreferredLocalizations:(id)a3 useShortNameOnly:(BOOL)a4
{
  return 0LL;
}

void __45__LSBundleProxy_bundleProxyForCurrentProcess__block_invoke_cold_1()
{
}

- (void)canonicalExecutablePath
{
}

@end
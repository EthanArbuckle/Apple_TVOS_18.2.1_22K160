@interface _LSCoreTypesRecordProxy
+ (BOOL)supportsSecureCoding;
+ (id)classFallbacksForKeyedArchiver;
+ (id)description;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFreeProfileValidated;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)isMemberOfClass:(Class)a3;
- (BOOL)isProfileValidated;
- (BOOL)isUPPValidated;
- (BOOL)supportsNowPlaying;
- (BOOL)wasBuiltWithThreadSanitizer;
- (LSBundleRecord)_realRecord;
- (char)developerType;
- (id)SDKVersion;
- (id)UIBackgroundModes;
- (id)URL;
- (id)WKBackgroundModes;
- (id)_loadRealRecord;
- (id)_personasWithAttributes;
- (id)accentColorName;
- (id)applicationIdentifier;
- (id)associatedPersonas;
- (id)bundleIdentifier;
- (id)dataContainerURL;
- (id)debugDescription;
- (id)description;
- (id)executableURL;
- (id)intentDefinitionURLs;
- (id)intentsRestrictedWhileLocked;
- (id)intentsRestrictedWhileProtectedDataUnavailable;
- (id)localizedName;
- (id)localizedNameWithPreferredLocalizations:(id)a3;
- (id)localizedShortName;
- (id)localizedShortNameWithPreferredLocalizations:(id)a3;
- (id)localizedUsageDescriptionForFeature:(unint64_t)a3;
- (id)localizedUsageDescriptionForFeature:(unint64_t)a3 preferredLocalizations:(id)a4;
- (id)machOUUIDs;
- (id)managedPersonas;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)serviceRecords;
- (id)signerIdentity;
- (id)signerOrganization;
- (id)supportedIntentMediaCategories;
- (id)supportedIntents;
- (id)teamIdentifier;
- (unint64_t)hash;
- (unsigned)platform;
- (void)detach;
- (void)forwardInvocation:(id)a3;
@end

@implementation _LSCoreTypesRecordProxy

- (id)_loadRealRecord
{
  uint64_t v28 = 0LL;
  v29 = (id *)&v28;
  uint64_t v30 = 0x3032000000LL;
  v31 = __Block_byref_object_copy__8;
  v32 = __Block_byref_object_dispose__8;
  id v33 = 0LL;
  id WeakRetained = objc_loadWeakRetained(&LaunchServices::Record::weakCoreTypesRecord);
  if (WeakRetained)
  {
    objc_storeStrong(v29 + 5, WeakRetained);
  }

  else
  {
    MayMapDatabase = (LaunchServices::DatabaseContext *)_LSCurrentProcessMayMapDatabase();
    if ((_DWORD)MayMapDatabase)
    {
      CurrentContext = (void **)_LSDatabaseContextGetCurrentContext(MayMapDatabase);
      id v25 = 0LL;
      char v26 = 0;
      id v27 = 0LL;
      +[_LSDServiceDomain defaultServiceDomain]();
      v4 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v5 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v4, 0LL);

      if (v5)
      {
        uint64_t v20 = 0LL;
        v21 = &v20;
        uint64_t v22 = 0x2020000000LL;
        int v23 = 0;
        uint64_t v16 = 0LL;
        v17 = &v16;
        uint64_t v18 = 0x2020000000LL;
        uint64_t v19 = 0LL;
        v15[5] = MEMORY[0x1895F87A8];
        v15[6] = 3221225472LL;
        v15[7] = __42___LSCoreTypesRecordProxy__loadRealRecord__block_invoke;
        v15[8] = &unk_189D749E0;
        v15[9] = &v16;
        v15[10] = &v20;
        _CSStoreEnumerateUnits();
        if (*((_DWORD *)v21 + 6))
        {
          v6 = -[FSNode initWithPath:flags:error:]( objc_alloc(&OBJC_CLASS___FSNode),  "initWithPath:flags:error:",  @"/System/Library/CoreServices/MobileCoreTypes.bundle",  8LL,  0LL);
          v7 = objc_alloc(&OBJC_CLASS___LSBundleRecord);
          uint64_t v8 = -[LSBundleRecord _initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:]( v7,  "_initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:",  v6,  @"com.apple.mobilecoretypes",  v5,  *(unsigned int *)(*(void *)v5 + 20LL),  *((unsigned int *)v21 + 6),  v17[3],  0LL);
          id v9 = v29[5];
          v29[5] = (id)v8;
        }

        _Block_object_dispose(&v16, 8);
        _Block_object_dispose(&v20, 8);
      }

      if (CurrentContext && v26) {
        _LSContextDestroy(CurrentContext);
      }
      id v10 = v25;
      CurrentContext = 0LL;
      id v25 = 0LL;

      char v26 = 0;
      id v11 = v27;
      id v27 = 0LL;
    }

    else
    {
      v12 = +[_LSDService synchronousXPCProxyWithErrorHandler:]( (uint64_t)&OBJC_CLASS____LSDReadService,  __block_literal_global_427);
      v15[0] = MEMORY[0x1895F87A8];
      v15[1] = 3221225472LL;
      v15[2] = __42___LSCoreTypesRecordProxy__loadRealRecord__block_invoke_3;
      v15[3] = &unk_189D74A28;
      v15[4] = &v28;
      [v12 getBundleRecordForCoreTypesWithCompletionHandler:v15];
    }

    LaunchServices::Record::storeWeakSharedRecord(v29[5], &LaunchServices::Record::weakCoreTypesRecord);
  }

  id v13 = v29[5];
  _Block_object_dispose(&v28, 8);

  return v13;
}

- (LSBundleRecord)_realRecord
{
  realRecord = self->_realRecord;
  if (!realRecord)
  {
    -[_LSCoreTypesRecordProxy _loadRealRecord](self, "_loadRealRecord");
    v4 = (LSBundleRecord *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = self->_realRecord;
    self->_realRecord = v4;

    realRecord = self->_realRecord;
  }

  v6 = realRecord;
  os_unfair_lock_unlock((os_unfair_lock_t)&LaunchServices::Record::coreTypesProxyLock);
  return v6;
}

- (id)bundleIdentifier
{
  return @"com.apple.mobilecoretypes";
}

- (id)applicationIdentifier
{
  return 0LL;
}

- (id)teamIdentifier
{
  return @"0000000000";
}

- (id)URL
{
  return (id)[objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:@"/System/Library/CoreServices/MobileCoreTypes.bundle" isDirectory:1];
}

- (id)executableURL
{
  return 0LL;
}

- (char)developerType
{
  return 1;
}

- (id)machOUUIDs
{
  return (id)MEMORY[0x189604A58];
}

- (id)SDKVersion
{
  return 0LL;
}

- (unsigned)platform
{
  return 0;
}

- (BOOL)wasBuiltWithThreadSanitizer
{
  return 0;
}

- (id)serviceRecords
{
  return objc_alloc_init(MEMORY[0x189604010]);
}

- (id)dataContainerURL
{
  return 0LL;
}

- (id)localizedName
{
  return @"CoreTypes";
}

- (id)localizedShortName
{
  return @"CoreTypes";
}

- (id)localizedNameWithPreferredLocalizations:(id)a3
{
  return @"CoreTypes";
}

- (id)localizedShortNameWithPreferredLocalizations:(id)a3
{
  return @"CoreTypes";
}

- (id)localizedUsageDescriptionForFeature:(unint64_t)a3
{
  return 0LL;
}

- (id)localizedUsageDescriptionForFeature:(unint64_t)a3 preferredLocalizations:(id)a4
{
  return 0LL;
}

- (id)signerOrganization
{
  return 0LL;
}

- (id)signerIdentity
{
  return 0LL;
}

- (BOOL)isProfileValidated
{
  return 0;
}

- (BOOL)isUPPValidated
{
  return 0;
}

- (BOOL)isFreeProfileValidated
{
  return 0;
}

- (id)managedPersonas
{
  return 0LL;
}

- (id)associatedPersonas
{
  return 0LL;
}

- (id)_personasWithAttributes
{
  return 0LL;
}

- (id)UIBackgroundModes
{
  return (id)MEMORY[0x189604A58];
}

- (id)accentColorName
{
  return 0LL;
}

- (id)WKBackgroundModes
{
  return (id)MEMORY[0x189604A58];
}

- (BOOL)supportsNowPlaying
{
  return 0;
}

- (id)intentDefinitionURLs
{
  return (id)MEMORY[0x189604A60];
}

- (id)supportedIntents
{
  return (id)MEMORY[0x189604A58];
}

- (id)intentsRestrictedWhileLocked
{
  return (id)MEMORY[0x189604A58];
}

- (id)intentsRestrictedWhileProtectedDataUnavailable
{
  return (id)MEMORY[0x189604A58];
}

- (id)supportedIntentMediaCategories
{
  return (id)MEMORY[0x189604A58];
}

- (void)forwardInvocation:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "setTarget:");
  [a3 invoke];
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)+[LSBundleRecord instanceMethodSignatureForSelector:]( &OBJC_CLASS___LSBundleRecord,  "instanceMethodSignatureForSelector:",  a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)detach
{
  if (_LSCurrentProcessMayMapDatabase())
  {
    os_unfair_lock_lock((os_unfair_lock_t)&LaunchServices::Record::coreTypesProxyLock);
    p_realRecord = &self->_realRecord;
    id obj = (id)-[LSBundleRecord copy](*p_realRecord, "copy");
    if (obj) {
      objc_storeStrong((id *)p_realRecord, obj);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&LaunchServices::Record::coreTypesProxyLock);
    [obj detach];
  }

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self || ([a3 isMemberOfClass:objc_opt_class()] & 1) != 0)
  {
    LOBYTE(v5) = 1;
  }

  else
  {
    int v5 = [a3 isMemberOfClass:objc_opt_class()];
    if (v5) {
      LOBYTE(v5) = [a3 isEqual:self];
    }
  }

  return v5;
}

+ (id)description
{
  return @"LS(Proxied)BundleRecord";
}

- (id)description
{
  return (id)[objc_alloc(NSString) initWithFormat:@"<%@ %p>", objc_opt_class(), self];
}

- (id)debugDescription
{
  id v3 = objc_alloc(NSString);
  uint64_t v4 = objc_opt_class();
  if (self->_realRecord) {
    int v5 = @"yes";
  }
  else {
    int v5 = @"no";
  }
  v6 = (void *)[v3 initWithFormat:@"<%@ %p> { resolved: %@ }", v4, self, v5];
  os_unfair_lock_unlock((os_unfair_lock_t)&LaunchServices::Record::coreTypesProxyLock);
  return v6;
}

- (BOOL)isKindOfClass:(Class)a3
{
  Class = object_getClass(self);
  if (!Class) {
    return +[LSBundleRecord isSubclassOfClass:](&OBJC_CLASS___LSBundleRecord, "isSubclassOfClass:", a3);
  }
  while (Class != a3)
  {
    Class = class_getSuperclass(Class);
    if (!Class) {
      return +[LSBundleRecord isSubclassOfClass:](&OBJC_CLASS___LSBundleRecord, "isSubclassOfClass:", a3);
    }
  }

  return 1;
}

- (BOOL)isMemberOfClass:(Class)a3
{
  return (Class)objc_opt_class() == a3 || objc_opt_class() == (void)a3;
}

- (BOOL)conformsToProtocol:(id)a3
{
  uint64_t v4 = (objc_class *)objc_opt_class();
  if (class_conformsToProtocol(v4, (Protocol *)a3)) {
    return 1;
  }
  v6 = (objc_class *)objc_opt_class();
  return class_conformsToProtocol(v6, (Protocol *)a3);
}

+ (id)classFallbacksForKeyedArchiver
{
  return (id)MEMORY[0x189604A58];
}

- (void).cxx_destruct
{
}

@end
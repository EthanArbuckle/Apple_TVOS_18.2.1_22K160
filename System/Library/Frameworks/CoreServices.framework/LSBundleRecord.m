@interface LSBundleRecord
+ (BOOL)supportsSecureCoding;
+ (LSBundleRecord)bundleRecordForCurrentProcess;
+ (LSBundleRecord)bundleRecordWithApplicationIdentifier:(id)a3 error:(id *)a4;
+ (LSBundleRecord)bundleRecordWithBundleIdentifier:(id)a3 allowPlaceholder:(BOOL)a4 error:(id *)a5;
+ (LSBundleRecord)coreTypesBundleRecord;
+ (id)_bundleRecordForAuditToken:(id *)a3 checkNSBundleMainBundle:(unsigned __int8)a4 error:(id *)a5;
+ (id)_propertyClasses;
+ (id)bundleRecordForAuditToken:(id *)a3 error:(id *)a4;
+ (id)redactedProperties;
+ (void)bundleRecordForCurrentProcess;
- (BOOL)_containerized;
- (BOOL)_usesSystemPersona;
- (BOOL)appProtectionHidden;
- (BOOL)appProtectionLocked;
- (BOOL)eligibleForRedaction;
- (BOOL)getDataContainerURL:(id *)a3 error:(id *)a4;
- (BOOL)isAppleInternal;
- (BOOL)isAppleInternalWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFreeProfileValidated;
- (BOOL)isLinkEnabled;
- (BOOL)isLinkEnabledWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (BOOL)isProfileValidated;
- (BOOL)isRedacted;
- (BOOL)isUPPValidated;
- (BOOL)personaIsApplicable:(id)a3;
- (BOOL)supportsNowPlaying;
- (BOOL)unredactWithError:(id *)a3;
- (BOOL)wasBuiltWithThreadSanitizer;
- (FSNode)_node;
- (LSBundleBaseFlags)_baseFlags;
- (LSBundleBaseFlags)_baseFlagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6;
- (LSBundleRecord)initWithCoder:(id)a3;
- (LSPropertyList)entitlements;
- (LSPropertyList)infoDictionary;
- (LSVersionNumber)_bundleVersion;
- (LSVersionNumber)_bundleVersionWithContext:(SEL)a3 tableID:(LSContext *)a4 unitID:(unsigned int)a5 unitBytes:(unsigned int)a6;
- (NSArray)UIBackgroundModes;
- (NSArray)WKBackgroundModes;
- (NSArray)_personasWithAttributes;
- (NSArray)associatedPersonas;
- (NSArray)intentsRestrictedWhileLocked;
- (NSArray)intentsRestrictedWhileProtectedDataUnavailable;
- (NSArray)machOUUIDs;
- (NSArray)managedPersonas;
- (NSArray)privacyTrackingDomains;
- (NSArray)supportedIntentMediaCategories;
- (NSArray)supportedIntents;
- (NSDate)registrationDate;
- (NSDictionary)groupContainerURLs;
- (NSDictionary)intentDefinitionURLs;
- (NSSet)claimRecords;
- (NSSet)exportedTypeRecords;
- (NSSet)importedTypeRecords;
- (NSSet)serviceRecords;
- (NSString)SDKVersion;
- (NSString)_fallbackLocalizedName;
- (NSString)accentColorName;
- (NSString)applicationIdentifier;
- (NSString)bundleIdentifier;
- (NSString)bundleVersion;
- (NSString)localizedName;
- (NSString)localizedShortName;
- (NSString)signerIdentity;
- (NSString)signerOrganization;
- (NSString)teamIdentifier;
- (NSURL)URL;
- (NSURL)_dataContainerURLFromDatabase;
- (NSURL)dataContainerURL;
- (NSURL)executableURL;
- (_LSLazyPropertyList)_rawGroupContainerURLs;
- (_LSLocalizedStringRecord)_localizedName;
- (_LSLocalizedStringRecord)_localizedShortName;
- (char)developerType;
- (char)developerTypeWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (const)_auditToken;
- (id)SDKVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6;
- (id)_cachedDataContainerURL;
- (id)_dataContainerURLFromDatabaseWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6;
- (id)_getGroupContainersCreatingIfNecessary:(BOOL)a3 checkNonContainerizedBundles:(BOOL)a4;
- (id)_initWithContext:(LSContext *)a3 persistentIdentifierData:(const LSPersistentIdentifierData *)a4 length:(unint64_t)a5;
- (id)_initWithNode:(id)a3 bundleIdentifier:(id)a4 context:(LSContext *)a5 tableID:(unsigned int)a6 unitID:(unsigned int)a7 bundleBaseData:(const LSBundleBaseData *)a8 error:(id *)a9;
- (id)_localizedNameWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6;
- (id)_localizedShort:(BOOL)a3 nameWithContext:(LSContext *)a4 tableID:(unsigned int)a5 unitID:(unsigned int)a6 bundleData:(const LSBundleBaseData *)a7;
- (id)_localizedShortNameWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6;
- (id)_rawGroupContainerURLsCheckingRedaction;
- (id)_rawGroupContainerURLsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6;
- (id)claimRecordsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)entitlementsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6;
- (id)executableURLWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6;
- (id)exported:(BOOL)a3 typesWithContext:(LSContext *)a4 tableID:(unsigned int)a5 unitID:(unsigned int)a6 unitBytes:(const LSBundleData *)a7;
- (id)exportedTypeRecordsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)getGroupContainersCreatingIfNecessary:(BOOL)a3;
- (id)groupContainerIdentifiers;
- (id)importedTypeRecordsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)infoDictionaryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6;
- (id)intentDefinitionURLsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6;
- (id)localizedNameWithPreferredLocalizations:(id)a3;
- (id)localizedShortNameWithPreferredLocalizations:(id)a3;
- (id)localizedUsageDescriptionForFeature:(unint64_t)a3;
- (id)localizedUsageDescriptionForFeature:(unint64_t)a3 preferredLocalizations:(id)a4;
- (id)machOUUIDsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6;
- (id)recordForUnredactingWithContext:(LSContext *)a3 error:(id *)a4;
- (id)registrationDateWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6;
- (id)signerIdentityWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6;
- (id)signerOrganizationWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6;
- (id)teamIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6;
- (unint64_t)_containerClass;
- (unint64_t)compatibilityState;
- (unint64_t)hash;
- (unsigned)_profileValidationState;
- (unsigned)_profileValidationStateWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6;
- (unsigned)codeSignatureVersion;
- (unsigned)codeSignatureVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6;
- (unsigned)platform;
- (unsigned)platformWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6;
- (void)_LSRecord_resolve_SDKVersion;
- (void)_LSRecord_resolve__bundleVersion;
- (void)_LSRecord_resolve__dataContainerURLFromDatabase;
- (void)_LSRecord_resolve__localizedName;
- (void)_LSRecord_resolve__localizedShortName;
- (void)_LSRecord_resolve__rawGroupContainerURLs;
- (void)_LSRecord_resolve_claimRecords;
- (void)_LSRecord_resolve_entitlements;
- (void)_LSRecord_resolve_executableURL;
- (void)_LSRecord_resolve_exportedTypeRecords;
- (void)_LSRecord_resolve_importedTypeRecords;
- (void)_LSRecord_resolve_infoDictionary;
- (void)_LSRecord_resolve_intentDefinitionURLs;
- (void)_LSRecord_resolve_machOUUIDs;
- (void)_LSRecord_resolve_registrationDate;
- (void)_LSRecord_resolve_signerIdentity;
- (void)_LSRecord_resolve_signerOrganization;
- (void)_LSRecord_resolve_teamIdentifier;
- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6;
- (void)_fallbackLocalizedName;
- (void)_rawGroupContainerURLsCheckingRedaction;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)redact;
@end

@implementation LSBundleRecord

- (id)_initWithNode:(id)a3 bundleIdentifier:(id)a4 context:(LSContext *)a5 tableID:(unsigned int)a6 unitID:(unsigned int)a7 bundleBaseData:(const LSBundleBaseData *)a8 error:(id *)a9
{
  uint64_t v10 = *(void *)&a7;
  uint64_t v11 = *(void *)&a6;
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v15 = a4;
  uint64_t v27 = 0LL;
  v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  v30 = __Block_byref_object_copy__8;
  v31 = __Block_byref_object_dispose__8;
  id v32 = a3;
  if (!v28[5])
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v34 = 0x3032000000LL;
    v35 = __Block_byref_object_copy__8;
    v36 = __Block_byref_object_dispose__8;
    id v37 = 0LL;
    v26[0] = MEMORY[0x1895F87A8];
    v26[1] = 3221225472LL;
    v26[2] = __93__LSBundleRecord__initWithNode_bundleIdentifier_context_tableID_unitID_bundleBaseData_error___block_invoke;
    v26[3] = &unk_189D748C8;
    v26[6] = a5;
    v26[7] = a8;
    v26[4] = &v27;
    v26[5] = &buf;
    __LSRECORD_IS_PERFORMING_IO_FOR_A_CALLER__((uint64_t)v26);
    if (a9 && !v28[5]) {
      *a9 = *(id *)(*((void *)&buf + 1) + 40LL);
    }
    _Block_object_dispose(&buf, 8);

    if (!v28[5])
    {
      _LSDefaultLog();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[LSBundleRecord _initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:].cold.1(v23);
      }

      v17 = 0LL;
      v21 = (os_log_s *)self;
      goto LABEL_19;
    }
  }

  if (!v15) {
    id v15 = (id)_CSStringCopyCFString();
  }
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___LSBundleRecord;
  v16 = -[LSRecord _initWithContext:tableID:unitID:](&v25, sel__initWithContext_tableID_unitID_, a5, v11, v10);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong(v16 + 7, (id)v28[5]);
    uint64_t v18 = [v15 copy];
    id v19 = v17[8];
    v17[8] = (id)v18;

    v20 = (void *)v28[5];
    if (_LSBundleRecordMaybeLogInit(FSNode *,NSString *)::onceToken != -1) {
      dispatch_once(&_LSBundleRecordMaybeLogInit(FSNode *,NSString *)::onceToken, &__block_literal_global_470);
    }
    if (_LSBundleRecordMaybeLogInit(FSNode *,NSString *)::myBundleIDIfEnabledAndFirstParty
      && ([v15 isEqualToString:@"com.apple.mobilecoretypes"] & 1) == 0
      && ([v15 isEqualToString:_LSBundleRecordMaybeLogInit(FSNode *,NSString *)::myBundleIDIfEnabledAndFirstParty] & 1) == 0)
    {
      _LSPrivacyLog();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        [v20 URL];
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v22;
        _os_log_impl( &dword_183E58000,  v21,  OS_LOG_TYPE_INFO,  "constructing bundle record for %@",  (uint8_t *)&buf,  0xCu);
      }

- (LSPropertyList)infoDictionary
{
  return (LSPropertyList *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_infoDictionaryWithContext_tableID_unitID_unitBytes_);
}

- (id)infoDictionaryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  return +[_LSLazyPropertyList lazyPropertyListWithContext:unit:]( &OBJC_CLASS____LSLazyPropertyList,  "lazyPropertyListWithContext:unit:",  a3,  a6->infoDictionary,  *(void *)&a5);
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (NSURL)_dataContainerURLFromDatabase
{
  return (NSURL *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel__dataContainerURLFromDatabaseWithContext_tableID_unitID_unitBytes_);
}

- (id)_dataContainerURLFromDatabaseWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  v6 = _LSAliasCopyResolvedNode(a3->db, a6->dataContainerAlias, 0LL, 0LL, 0LL);
  v7 = v6;
  if (v6)
  {
    [v6 URL];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (NSURL)URL
{
  return (NSURL *)-[FSNode URL](self->_node, "URL");
}

- (void)_LSRecord_resolve_executableURL
{
  id v2 = -[LSBundleRecord executableURL](self, "executableURL");
}

- (NSURL)executableURL
{
  return (NSURL *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_executableURLWithContext_tableID_unitID_unitBytes_);
}

- (id)executableURLWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    _LSDefaultLog();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[LSBundleRecord executableURLWithContext:tableID:unitID:unitBytes:].cold.1();
    }
    goto LABEL_9;
  }

  v7 = (os_log_s *)_CSStringCopyCFString();
  if (!v7)
  {
    _LSDefaultLog();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[LSBundleRecord executableURLWithContext:tableID:unitID:unitBytes:].cold.2();
    }

LABEL_9:
    v8 = 0LL;
    goto LABEL_10;
  }

  v8 = (void *)[objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:v7 isDirectory:0 relativeToURL:v6];
LABEL_10:

  return v8;
}

- (char)developerType
{
  return __LSRECORD_GETTER__<unsigned char>( self,  (LSRecord *)a2,  sel_developerTypeWithContext_tableID_unitID_unitBytes_);
}

- (char)developerTypeWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  if (a3->db->schema.bundleTable != a4) {
    return -1;
  }
  if (a6->_clas == 14) {
    return 1;
  }
  v8 = (void *)_CSStringCopyCFString();
  if (v8)
  {
    if (-[LSBundleRecord developerTypeWithContext:tableID:unitID:unitBytes:]::once != -1) {
      dispatch_once( &-[LSBundleRecord developerTypeWithContext:tableID:unitID:unitBytes:]::once,  &__block_literal_global_30);
    }
    if ([(id)-[LSBundleRecord developerTypeWithContext:tableID:unitID:unitBytes:]::systemTypes containsObject:v8])
    {

      return 1;
    }
  }

  int containingDirectoryClass = a6->base.containingDirectoryClass;
  char v9 = 1;
  if (containingDirectoryClass != 1 && containingDirectoryClass != 4)
  {
    if ((*(_BYTE *)&a6->base.flags & 1) == 0) {
      return 3;
    }
    auditToken = self->_auditToken;
    if (auditToken)
    {
      else {
        return -1;
      }
    }

    return -1;
  }

  return v9;
}

- (BOOL)isLinkEnabled
{
  return __LSRECORD_GETTER__<BOOL>(self, (LSRecord *)a2, sel_isLinkEnabledWithContext_tableID_unitID_unitBytes_);
}

- (BOOL)isLinkEnabledWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return (*(_BYTE *)&a6->base.flags >> 3) & 1;
}

- (void)_LSRecord_resolve_SDKVersion
{
  id v2 = -[LSBundleRecord SDKVersion](self, "SDKVersion");
}

- (NSString)SDKVersion
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_SDKVersionWithContext_tableID_unitID_unitBytes_);
}

- (id)SDKVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  __int128 v6 = *(_OWORD *)&a6->execSDKVersion._opaque[16];
  v8[0] = *(_OWORD *)a6->execSDKVersion._opaque;
  v8[1] = v6;
  _LSVersionNumberGetStringRepresentation(v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (LSBundleBaseFlags)_baseFlags
{
  return (LSBundleBaseFlags)__LSRECORD_GETTER__<LSBundleBaseFlags>( self,  (LSRecord *)a2,  sel__baseFlagsWithContext_tableID_unitID_unitBytes_);
}

- (LSBundleBaseFlags)_baseFlagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  return (LSBundleBaseFlags)*(_BYTE *)&a6->flags;
}

- (void)_LSRecord_resolve__bundleVersion
{
}

- (LSVersionNumber)_bundleVersion
{
  return result;
}

- (LSVersionNumber)_bundleVersionWithContext:(SEL)a3 tableID:(LSContext *)a4 unitID:(unsigned int)a5 unitBytes:(unsigned int)a6
{
  __int128 v7 = *(_OWORD *)&a7->version._opaque[16];
  *(_OWORD *)retstr->_opaque = *(_OWORD *)a7->version._opaque;
  *(_OWORD *)&retstr->_opaque[16] = v7;
  return self;
}

- (void)_LSRecord_resolve__dataContainerURLFromDatabase
{
  id v2 = -[LSBundleRecord _dataContainerURLFromDatabase](self, "_dataContainerURLFromDatabase");
}

- (void)_LSRecord_resolve__localizedName
{
  id v2 = -[LSBundleRecord _localizedName](self, "_localizedName");
}

- (_LSLocalizedStringRecord)_localizedName
{
  return (_LSLocalizedStringRecord *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel__localizedNameWithContext_tableID_unitID_unitBytes_);
}

- (id)_localizedNameWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  return -[LSBundleRecord _localizedShort:nameWithContext:tableID:unitID:bundleData:]( self,  "_localizedShort:nameWithContext:tableID:unitID:bundleData:",  0LL,  a3,  *(void *)&a4,  *(void *)&a5,  a6);
}

- (id)_localizedShort:(BOOL)a3 nameWithContext:(LSContext *)a4 tableID:(unsigned int)a5 unitID:(unsigned int)a6 bundleData:(const LSBundleBaseData *)a7
{
  if (a3 || (p_localizedShortDisplayName = &a7->localizedDisplayName, !a7->localizedDisplayName))
  {
    uint64_t v10 = objc_alloc(&OBJC_CLASS____LSLocalizedStringRecord);
    p_localizedShortDisplayName = &a7->localizedShortDisplayName;
  }

  else
  {
    uint64_t v10 = objc_alloc(&OBJC_CLASS____LSLocalizedStringRecord);
  }

  return  -[_LSLocalizedStringRecord _initWithContext:unitID:]( v10,  "_initWithContext:unitID:",  a4,  *p_localizedShortDisplayName);
}

- (void)_LSRecord_resolve__localizedShortName
{
  id v2 = -[LSBundleRecord _localizedShortName](self, "_localizedShortName");
}

- (_LSLocalizedStringRecord)_localizedShortName
{
  return (_LSLocalizedStringRecord *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel__localizedShortNameWithContext_tableID_unitID_unitBytes_);
}

- (id)_localizedShortNameWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  return -[LSBundleRecord _localizedShort:nameWithContext:tableID:unitID:bundleData:]( self,  "_localizedShort:nameWithContext:tableID:unitID:bundleData:",  1LL,  a3,  *(void *)&a4,  *(void *)&a5,  a6);
}

- (unsigned)_profileValidationState
{
  return __LSRECORD_GETTER__<unsigned char>( self,  (LSRecord *)a2,  sel__profileValidationStateWithContext_tableID_unitID_unitBytes_);
}

- (unsigned)_profileValidationStateWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  return a6->profileValidationState;
}

- (void)_LSRecord_resolve__rawGroupContainerURLs
{
  id v2 = -[LSBundleRecord _rawGroupContainerURLs](self, "_rawGroupContainerURLs");
}

- (_LSLazyPropertyList)_rawGroupContainerURLs
{
  return (_LSLazyPropertyList *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel__rawGroupContainerURLsWithContext_tableID_unitID_unitBytes_);
}

- (id)_rawGroupContainerURLsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  return +[_LSLazyPropertyList lazyPropertyListWithContext:unit:]( &OBJC_CLASS____LSLazyPropertyList,  "lazyPropertyListWithContext:unit:",  a3,  a6->groupContainers,  *(void *)&a5);
}

- (void)_LSRecord_resolve_claimRecords
{
  id v2 = -[LSBundleRecord claimRecords](self, "claimRecords");
}

- (NSSet)claimRecords
{
  return (NSSet *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_claimRecordsWithContext_tableID_unitID_unitBytes_);
}

- (id)claimRecordsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  id v9 = objc_alloc_init(MEMORY[0x189603FE0]);
  uint64_t v10 = v9;
  if (a3->db->schema.bundleTable == a4)
  {
    uint64_t v13 = MEMORY[0x1895F87A8];
    uint64_t v14 = 3221225472LL;
    id v15 = __67__LSBundleRecord_claimRecordsWithContext_tableID_unitID_unitBytes___block_invoke;
    v16 = &unk_189D74878;
    v17 = self;
    id v18 = v9;
    _CSArrayEnumerateAllValues();
  }

  uint64_t v11 = (void *)objc_msgSend(v10, "copy", v13, v14, v15, v16, v17);

  return v11;
}

- (unsigned)codeSignatureVersion
{
  return __LSRECORD_GETTER__<unsigned int>( self,  (LSRecord *)a2,  sel_codeSignatureVersionWithContext_tableID_unitID_unitBytes_);
}

- (unsigned)codeSignatureVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  return a6->signatureVersion;
}

- (void)_LSRecord_resolve_entitlements
{
  id v2 = -[LSBundleRecord entitlements](self, "entitlements");
}

- (LSPropertyList)entitlements
{
  return (LSPropertyList *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_entitlementsWithContext_tableID_unitID_unitBytes_);
}

- (id)entitlementsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  id v9 = (void *)MEMORY[0x186E2A59C](self, a2, a3, *(void *)&a4, *(void *)&a5);
  if (!self->_auditToken
    || (__LAUNCH_SERVICES_IS_GETTING_ENTITLEMENTS_FROM_THE_KERNEL__((uint64_t)self),
        (uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0LL))
  {
    +[_LSLazyPropertyList lazyPropertyListWithContext:unit:]( &OBJC_CLASS____LSLazyPropertyList,  "lazyPropertyListWithContext:unit:",  a3,  a6->entitlements);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_autoreleasePoolPop(v9);
  return v10;
}

- (void)_LSRecord_resolve_exportedTypeRecords
{
  id v2 = -[LSBundleRecord exportedTypeRecords](self, "exportedTypeRecords");
}

- (NSSet)exportedTypeRecords
{
  return (NSSet *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_exportedTypeRecordsWithContext_tableID_unitID_unitBytes_);
}

- (id)exportedTypeRecordsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return -[LSBundleRecord exported:typesWithContext:tableID:unitID:unitBytes:]( self,  "exported:typesWithContext:tableID:unitID:unitBytes:",  1LL,  a3,  *(void *)&a4,  *(void *)&a5,  a6);
}

- (id)exported:(BOOL)a3 typesWithContext:(LSContext *)a4 tableID:(unsigned int)a5 unitID:(unsigned int)a6 unitBytes:(const LSBundleData *)a7
{
  id v10 = objc_alloc_init(MEMORY[0x189603FE0]);
  uint64_t v11 = v10;
  if (a4->db->schema.bundleTable == a5)
  {
    uint64_t v14 = MEMORY[0x1895F87A8];
    uint64_t v15 = 3221225472LL;
    v16 = __69__LSBundleRecord_exported_typesWithContext_tableID_unitID_unitBytes___block_invoke;
    v17 = &unk_189D748A0;
    id v18 = self;
    id v19 = v10;
    _CSArrayEnumerateAllValues();
  }

  v12 = (void *)objc_msgSend(v11, "copy", v14, v15, v16, v17, v18);

  return v12;
}

- (void)_LSRecord_resolve_importedTypeRecords
{
  id v2 = -[LSBundleRecord importedTypeRecords](self, "importedTypeRecords");
}

- (NSSet)importedTypeRecords
{
  return (NSSet *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_importedTypeRecordsWithContext_tableID_unitID_unitBytes_);
}

- (id)importedTypeRecordsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return -[LSBundleRecord exported:typesWithContext:tableID:unitID:unitBytes:]( self,  "exported:typesWithContext:tableID:unitID:unitBytes:",  0LL,  a3,  *(void *)&a4,  *(void *)&a5,  a6);
}

- (void)_LSRecord_resolve_infoDictionary
{
  id v2 = -[LSBundleRecord infoDictionary](self, "infoDictionary");
}

- (void)_LSRecord_resolve_intentDefinitionURLs
{
  id v2 = -[LSBundleRecord intentDefinitionURLs](self, "intentDefinitionURLs");
}

- (NSDictionary)intentDefinitionURLs
{
  return (NSDictionary *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_intentDefinitionURLsWithContext_tableID_unitID_unitBytes_);
}

- (id)intentDefinitionURLsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  id v8 = objc_alloc_init(MEMORY[0x189603FC8]);
  +[_LSLazyPropertyList lazyPropertyListWithContext:unit:]( &OBJC_CLASS____LSLazyPropertyList,  "lazyPropertyListWithContext:unit:",  a3,  a6->intentDefinitionURLs);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = v9;
  if (v9)
  {
    -[_LSLazyPropertyList propertyList](v9);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __84__LSBundleRecord_Intents__intentDefinitionURLsWithContext_tableID_unitID_unitBytes___block_invoke;
    v14[3] = &unk_189D74918;
    id v15 = v8;
    [v11 enumerateKeysAndObjectsUsingBlock:v14];
  }

  v12 = (void *)[v8 copy];
  return v12;
}

- (BOOL)isAppleInternal
{
  return __LSRECORD_GETTER__<BOOL>(self, (LSRecord *)a2, sel_isAppleInternalWithContext_tableID_unitID_unitBytes_);
}

- (BOOL)isAppleInternalWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return *(_BYTE *)&a6->base.flags & 1;
}

- (void)_LSRecord_resolve_machOUUIDs
{
  id v2 = -[LSBundleRecord machOUUIDs](self, "machOUUIDs");
}

- (NSArray)machOUUIDs
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_machOUUIDsWithContext_tableID_unitID_unitBytes_);
}

- (id)machOUUIDsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v7 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  _LSDatabaseGetStringArray(a3->db);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDString:v12];
        if (v13)
        {
          [v7 addObject:v13];
        }

        else
        {
          _LSDefaultLog();
          uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 138412290;
            uint64_t v22 = v12;
            _os_log_impl( &dword_183E58000,  v14,  OS_LOG_TYPE_DEFAULT,  "Launch Services: Failed to create a UUID from invalid string %@",  buf,  0xCu);
          }
        }
      }

      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }

    while (v9);
  }

  id v15 = (void *)[v7 copy];
  return v15;
}

- (unsigned)platform
{
  return __LSRECORD_GETTER__<unsigned int>(self, (LSRecord *)a2, sel_platformWithContext_tableID_unitID_unitBytes_);
}

- (unsigned)platformWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  return a6->platform;
}

- (void)_LSRecord_resolve_registrationDate
{
  id v2 = -[LSBundleRecord registrationDate](self, "registrationDate");
}

- (NSDate)registrationDate
{
  return (NSDate *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_registrationDateWithContext_tableID_unitID_unitBytes_);
}

- (id)registrationDateWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  return (id)[objc_alloc(MEMORY[0x189603F50]) initWithTimeIntervalSinceReferenceDate:(double)a6->registrationTime];
}

- (void)_LSRecord_resolve_signerIdentity
{
  id v2 = -[LSBundleRecord signerIdentity](self, "signerIdentity");
}

- (NSString)signerIdentity
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_signerIdentityWithContext_tableID_unitID_unitBytes_);
}

- (id)signerIdentityWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  return (id)_CSStringCopyCFString();
}

- (void)_LSRecord_resolve_signerOrganization
{
  id v2 = -[LSBundleRecord signerOrganization](self, "signerOrganization");
}

- (NSString)signerOrganization
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_signerOrganizationWithContext_tableID_unitID_unitBytes_);
}

- (id)signerOrganizationWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  return (id)_CSStringCopyCFString();
}

- (void)_LSRecord_resolve_teamIdentifier
{
  id v2 = -[LSBundleRecord teamIdentifier](self, "teamIdentifier");
}

- (NSString)teamIdentifier
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_teamIdentifierWithContext_tableID_unitID_unitBytes_);
}

- (id)teamIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  return (id)_CSStringCopyCFString();
}

- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  -[LSRecord _resolvedPropertyValueForGetter:]( self,  "_resolvedPropertyValueForGetter:",  sel_infoDictionary,  *(void *)&a4,  *(void *)&a5,  a6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v7;
  if (v7) {
    [v7 detach];
  }

  -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel_entitlements);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = v9;
  if (v9) {
    [v9 detach];
  }

  -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel__localizedName);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = v11;
  if (v11) {
    [v11 detach];
  }

  -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel__localizedShortName);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = v13;
  if (v13) {
    [v13 detach];
  }

  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel_claimRecords);
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [v15 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v38;
    do
    {
      uint64_t v18 = 0LL;
      do
      {
        if (*(void *)v38 != v17) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v37 + 1) + 8 * v18++) detach];
      }

      while (v16 != v18);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }

    while (v16);
  }

  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel_exportedTypeRecords);
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v34;
    do
    {
      uint64_t v22 = 0LL;
      do
      {
        if (*(void *)v34 != v21) {
          objc_enumerationMutation(v19);
        }
        [*(id *)(*((void *)&v33 + 1) + 8 * v22++) detach];
      }

      while (v20 != v22);
      uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v42 count:16];
    }

    while (v20);
  }

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  v23 = -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel_importedTypeRecords, 0LL);
  uint64_t v24 = [v23 countByEnumeratingWithState:&v29 objects:v41 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v30;
    do
    {
      uint64_t v26 = 0LL;
      do
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(v23);
        }
        [*(id *)(*((void *)&v29 + 1) + 8 * v26++) detach];
      }

      while (v24 != v26);
      uint64_t v24 = [v23 countByEnumeratingWithState:&v29 objects:v41 count:16];
    }

    while (v24);
  }

  -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel__rawGroupContainerURLs);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27) {
    [v27 detach];
  }
}

- (NSString)localizedName
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringValue];
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  postprocessLocalizedNameishStringFromStringRecord(self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSURL)dataContainerURL
{
  id v3 = 0LL;
  -[LSBundleRecord getDataContainerURL:error:](self, "getDataContainerURL:error:", &v3, 0LL);
  return (NSURL *)v3;
}

- (BOOL)getDataContainerURL:(id *)a3 error:(id *)a4
{
  if (!-[LSBundleRecord isRedacted](self, "isRedacted"))
  {
LABEL_4:
    -[LSBundleRecord _cachedDataContainerURL](self, "_cachedDataContainerURL");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v30 = 0;
    -[LSBundleRecord(Personas) _personasWithAttributes](self, "_personasWithAttributes");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    _LSShouldFetchContainersFromContainermanagerForPersona( v11,  -[LSBundleRecord _usesSystemPersona](self, "_usesSystemPersona"),  &v30);
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    BOOL v13 = -[LSBundleRecord _containerized](self, "_containerized");
    BOOL v14 = v12 == 0LL;
    if (v12) {
      BOOL v15 = 0;
    }
    else {
      BOOL v15 = v13;
    }
    if (v15 && (v30 || !v10))
    {
      if (!v30)
      {
        _LSDefaultLog();
        uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          -[LSBundleRecord(Containers) getDataContainerURL:error:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);
        }
      }

      -[LSBundleRecord bundleIdentifier](self, "bundleIdentifier");
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v25 = -[LSBundleRecord _containerClass](self, "_containerClass");
      unsigned int active_platform = dyld_get_active_platform();
      uint64_t v27 = _LSCopyDataContainerURLFromContainermanager(v24, v25, active_platform);

      uint64_t v10 = (void *)v27;
    }

    if (a4) {
      *a4 = v12;
    }
    if (a3) {
      *a3 = v10;
    }

    goto LABEL_20;
  }

  id v31 = 0LL;
  BOOL v7 = -[LSBundleRecord unredactWithError:](self, "unredactWithError:", &v31);
  id v8 = v31;
  uint64_t v9 = v8;
  if (v7)
  {

    goto LABEL_4;
  }

  _LSDefaultLog();
  __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
    -[LSBundleRecord _rawGroupContainerURLsCheckingRedaction].cold.1();
  }

  if (a4)
  {
    id v12 = v9;
    BOOL v14 = 0;
    *a4 = v12;
  }

  else
  {
    BOOL v14 = 0;
    id v12 = v9;
  }

- (id)_cachedDataContainerURL
{
  id v3 = self->_cachedDataContainerURL;
  os_unfair_lock_unlock((os_unfair_lock_t)&LaunchServices::Record::cachedDataContainerURLLock);
  if (v3)
  {
    id v4 = (id)*MEMORY[0x189605018];
  }

  else
  {
    if (!-[LSBundleRecord _containerized](self, "_containerized")
      || ![(id)__LSDefaultsGetSharedInstance() isInEducationMode]
      || (-[LSBundleRecord bundleIdentifier](self, "bundleIdentifier"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          uint64_t v6 = -[LSBundleRecord _containerClass](self, "_containerClass"),
          unsigned int active_platform = dyld_get_active_platform(),
          id v3 = (id)_LSCopyDataContainerURLFromContainermanager(v5, v6, active_platform),
          v5,
          !v3))
    {
      -[LSBundleRecord _dataContainerURLFromDatabase](self, "_dataContainerURLFromDatabase");
      id v3 = (id)objc_claimAutoreleasedReturnValue();
    }

    os_unfair_lock_lock((os_unfair_lock_t)&LaunchServices::Record::cachedDataContainerURLLock);
    id v4 = (id)*MEMORY[0x189605018];
    if (v3) {
      id v8 = v3;
    }
    else {
      id v8 = (void *)*MEMORY[0x189605018];
    }
    objc_storeStrong(&self->_cachedDataContainerURL, v8);
    os_unfair_lock_unlock((os_unfair_lock_t)&LaunchServices::Record::cachedDataContainerURLLock);
  }

  if (v3 == v4) {
    uint64_t v9 = 0LL;
  }
  else {
    uint64_t v9 = v3;
  }
  id v10 = v9;

  return v10;
}

- (BOOL)isProfileValidated
{
  return -[LSBundleRecord _profileValidationState](self, "_profileValidationState") != 0;
}

- (BOOL)isUPPValidated
{
  return -[LSBundleRecord _profileValidationState](self, "_profileValidationState") == 2;
}

- (BOOL)isFreeProfileValidated
{
  return -[LSBundleRecord _profileValidationState](self, "_profileValidationState") == 3;
}

- (NSArray)UIBackgroundModes
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [v2 objectForKey:@"UIBackgroundModes" ofClass:v3 valuesOfClass:objc_opt_class()];

  if (v4) {
    v5 = (void *)v4;
  }
  else {
    v5 = (void *)MEMORY[0x189604A58];
  }
  return (NSArray *)v5;
}

- (BOOL)wasBuiltWithThreadSanitizer
{
  return (-[LSBundleRecord _baseFlags](self, "_baseFlags") >> 2) & 1;
}

- (void)dealloc
{
  auditToken = self->_auditToken;
  if (auditToken) {
    operator delete(auditToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___LSBundleRecord;
  -[LSRecord dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
}

+ (id)bundleRecordForAuditToken:(id *)a3 error:(id *)a4
{
  __int128 v4 = *(_OWORD *)&a3->var0[4];
  v6[0] = *(_OWORD *)a3->var0;
  v6[1] = v4;
  [a1 _bundleRecordForAuditToken:v6 checkNSBundleMainBundle:0 error:a4];
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_bundleRecordForAuditToken:(id *)a3 checkNSBundleMainBundle:(unsigned __int8)a4 error:(id *)a5
{
  v73[1] = *MEMORY[0x1895F89C0];
  uint64_t v59 = 0LL;
  v60 = &v59;
  uint64_t v61 = 0x3032000000LL;
  v62 = __Block_byref_object_copy__8;
  v63 = __Block_byref_object_dispose__8;
  id v64 = 0LL;
  MayMapDatabase = (LaunchServices::DatabaseContext *)_LSCurrentProcessMayMapDatabase();
  if ((_DWORD)MayMapDatabase)
  {
    CurrentContext = (void **)_LSDatabaseContextGetCurrentContext(MayMapDatabase);
    id v56 = 0LL;
    char v57 = 0;
    id v58 = 0LL;
    +[_LSDServiceDomain defaultServiceDomain]();
    uint64_t v9 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v9, 0LL);

    if (!v10)
    {
      if (a5)
      {
        +[_LSDServiceDomain defaultServiceDomain]();
        uint64_t v24 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
        uint64_t v25 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v24, 0LL);

        if (v25) {
          id v26 = 0LL;
        }
        else {
          id v26 = v58;
        }
        *a5 = v26;
      }

      goto LABEL_36;
    }

    uint64_t v49 = 0LL;
    v50 = &v49;
    uint64_t v51 = 0x3032000000LL;
    v52 = __Block_byref_object_copy__8;
    v53 = __Block_byref_object_dispose__8;
    id v54 = 0LL;
    uint64_t v11 = MEMORY[0x1895F87A8];
    v45[0] = MEMORY[0x1895F87A8];
    __int128 v12 = *(_OWORD *)&a3->var0[4];
    __int128 v46 = *(_OWORD *)a3->var0;
    v45[1] = 3221225472LL;
    v45[2] = __75__LSBundleRecord__bundleRecordForAuditToken_checkNSBundleMainBundle_error___block_invoke;
    v45[3] = &unk_189D747B8;
    __int128 v47 = v12;
    unsigned __int8 v48 = a4;
    v45[4] = &v49;
    __LSRECORD_IS_PERFORMING_IO_FOR_A_CALLER__((uint64_t)v45);
    if (!v50[5])
    {
      if (a5)
      {
        uint64_t v68 = *MEMORY[0x189607490];
        v69 = @"The file system path for this process could not be determined. It may not be running, or it may have been deleted or moved while running.";
        [MEMORY[0x189603F68] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -600LL,  (uint64_t)"+[LSBundleRecord _bundleRecordForAuditToken:checkNSBundleMainBundle:error:]",  371LL,  v28);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_35;
    }

    uint64_t v41 = 0LL;
    v42 = &v41;
    uint64_t v43 = 0x2020000000LL;
    int v44 = 0;
    v40[0] = v11;
    v40[1] = 3221225472LL;
    v40[2] = __75__LSBundleRecord__bundleRecordForAuditToken_checkNSBundleMainBundle_error___block_invoke_2;
    v40[3] = &unk_189D747E0;
    v40[4] = &v41;
    v40[5] = &v49;
    __LSRECORD_IS_PERFORMING_IO_FOR_A_CALLER__((uint64_t)v40);
    int v13 = *((_DWORD *)v42 + 6);
    if (v13 == 2)
    {
      __int128 v29 = objc_alloc(&OBJC_CLASS___LSApplicationRecord);
      uint64_t v30 = -[LSApplicationRecord _initWithNode:bundleIdentifier:placeholderBehavior:systemPlaceholder:itemID:forceInBundleContainer:context:error:]( v29,  "_initWithNode:bundleIdentifier:placeholderBehavior:systemPlaceholder:itemID:forceInBundleContainer:context:error:",  v50[5],  0LL,  0LL,  0LL,  0LL,  0LL,  v10,  a5);
      uint64_t v19 = (void *)v60[5];
      v60[5] = v30;
LABEL_33:

      goto LABEL_34;
    }

    if (v13 == 12)
    {
      uint64_t v14 = v50[5];
      BOOL v15 = objc_alloc(&OBJC_CLASS___LSApplicationExtensionRecord);
      id v65 = 0LL;
      uint64_t v16 = -[LSApplicationExtensionRecord _initWithUUID:node:bundleIdentifier:context:requireValid:error:]( v15,  "_initWithUUID:node:bundleIdentifier:context:requireValid:error:",  0LL,  v14,  0LL,  v10,  0LL,  &v65);
      id v17 = v65;
      uint64_t v18 = v17;
      if (a5 && !v16) {
        *a5 = v17;
      }

      uint64_t v19 = (void *)v60[5];
      v60[5] = v16;
      goto LABEL_33;
    }

    if ([(id)v50[5] isDirectory])
    {
      if (a5)
      {
        uint64_t v72 = *MEMORY[0x189607490];
        v73[0] = @"This process' bundle type is not something Launch Services registers.";
        [MEMORY[0x189603F68] dictionaryWithObjects:v73 forKeys:&v72 count:1];
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
        _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"+[LSBundleRecord _bundleRecordForAuditToken:checkNSBundleMainBundle:error:]",  363LL,  v19);
        id v31 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:
        *a5 = v31;
        goto LABEL_33;
      }
    }

    else if (a5)
    {
      uint64_t v70 = *MEMORY[0x189607490];
      v71 = @"This process is not the executable of a bundle.";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v71 forKeys:&v70 count:1];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"+[LSBundleRecord _bundleRecordForAuditToken:checkNSBundleMainBundle:error:]",  365LL,  v19);
      id v31 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    }

void __75__LSBundleRecord__bundleRecordForAuditToken_checkNSBundleMainBundle_error___block_invoke( uint64_t a1)
{
  id v2 = (void *)_LSCopyBundleURLForAuditToken((_OWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 72));
  if (v2)
  {
    id v6 = v2;
    uint64_t v3 = -[FSNode initWithURL:flags:error:](objc_alloc(&OBJC_CLASS___FSNode), "initWithURL:flags:error:", v2, 0LL, 0LL);
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    id v2 = v6;
  }
}

uint64_t __75__LSBundleRecord__bundleRecordForAuditToken_checkNSBundleMainBundle_error___block_invoke_2( uint64_t a1)
{
  uint64_t result = _LSGetBundleClassForNode(0LL, *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

+ (LSBundleRecord)bundleRecordForCurrentProcess
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (_LSCurrentProcessMayMapDatabase())
  {
    uint64_t v3 = (_OWORD *)_LSGetAuditTokenForSelf();
    if (!v3) {
      return (LSBundleRecord *)0LL;
    }
    __int128 v4 = v3[1];
    v18[0] = *v3;
    v18[1] = v4;
    id v17 = 0LL;
    [a1 _bundleRecordForAuditToken:v18 checkNSBundleMainBundle:1 error:&v17];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    id v6 = v17;
    if (!v5)
    {
      _LSDefaultLog();
      BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v20 = v6;
        _os_log_impl( &dword_183E58000,  v7,  OS_LOG_TYPE_INFO,  "failure to find bundle record for our audit token: %@",  buf,  0xCu);
      }
    }
  }

  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)&LaunchServices::Record::currentProcessLock);
    id WeakRetained = (id)+[LSBundleRecord bundleRecordForCurrentProcess]::strongCurrentProcessRecord;
    if (!WeakRetained)
    {
      id WeakRetained = objc_loadWeakRetained(&LaunchServices::Record::weakCurrentProcessRecord);
      if (!WeakRetained)
      {
        uint64_t v9 = (_OWORD *)_LSGetAuditTokenForSelf();
        if (v9)
        {
          __int128 v10 = v9[1];
          v16[0] = *v9;
          v16[1] = v10;
          id v15 = 0LL;
          [a1 _bundleRecordForAuditToken:v16 checkNSBundleMainBundle:1 error:&v15];
          id WeakRetained = (id)objc_claimAutoreleasedReturnValue();
          id v11 = v15;
          if (v11)
          {
            _LSDefaultLog();
            __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
              +[LSBundleRecord bundleRecordForCurrentProcess].cold.1();
            }
          }

          LaunchServices::Record::storeWeakSharedRecord(WeakRetained, &LaunchServices::Record::weakCurrentProcessRecord);
        }

        else
        {
          id WeakRetained = 0LL;
        }
      }

      objc_storeStrong((id *)&+[LSBundleRecord bundleRecordForCurrentProcess]::strongCurrentProcessRecord, WeakRetained);
      dispatch_time_t v14 = dispatch_time(0LL, 5000000000LL);
      dispatch_after(v14, MEMORY[0x1895F8AE0], &__block_literal_global_15);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&LaunchServices::Record::currentProcessLock);
    v5 = WeakRetained;
  }

  return (LSBundleRecord *)v5;
}

void __47__LSBundleRecord_bundleRecordForCurrentProcess__block_invoke()
{
  v0 = (void *)+[LSBundleRecord bundleRecordForCurrentProcess]::strongCurrentProcessRecord;
  +[LSBundleRecord bundleRecordForCurrentProcess]::strongCurrentProcessRecord = 0LL;

  os_unfair_lock_unlock((os_unfair_lock_t)&LaunchServices::Record::currentProcessLock);
}

+ (LSBundleRecord)coreTypesBundleRecord
{
  return (LSBundleRecord *)objc_alloc_init(&OBJC_CLASS____LSCoreTypesRecordProxy);
}

+ (LSBundleRecord)bundleRecordWithBundleIdentifier:(id)a3 allowPlaceholder:(BOOL)a4 error:(id *)a5
{
  v18[1] = *MEMORY[0x1895F89C0];
  BOOL v7 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "initWithBundleIdentifier:allowPlaceholder:error:",  a3,  a4,  0LL);
  if (v7)
  {
    id v8 = (LSApplicationExtensionRecord *)v7;
LABEL_3:
    uint64_t v9 = 0LL;
    goto LABEL_4;
  }

  id v11 = objc_alloc(&OBJC_CLASS___LSApplicationExtensionRecord);
  if (a5) {
    __int128 v12 = &v16;
  }
  else {
    __int128 v12 = 0LL;
  }
  if (a5) {
    id v16 = 0LL;
  }
  id v8 = -[LSApplicationExtensionRecord initWithBundleIdentifier:error:]( v11,  "initWithBundleIdentifier:error:",  a3,  v12,  v16);
  if (!a5) {
    goto LABEL_3;
  }
  id v13 = v16;
  uint64_t v9 = v13;
  if (!v8)
  {
    dispatch_time_t v14 = (void *)*MEMORY[0x189607670];
    if (v13)
    {
      uint64_t v17 = *MEMORY[0x189607798];
      v18[0] = v13;
      [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl( v14,  -10814LL,  (uint64_t)"+[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:]",  163LL,  v15);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      id v8 = 0LL;
    }

    else
    {
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -10814LL,  (uint64_t)"+[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:]",  165LL,  0LL);
      id v8 = 0LL;
      uint64_t v9 = 0LL;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

+ (LSBundleRecord)bundleRecordWithApplicationIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 handleFailureInMethod:a2, a1, @"LSBundleRecord.mm", 176, @"Invalid parameter not satisfying: %@", @"appID != nil" object file lineNumber description];
  }

  id v6 = (LaunchServices::DatabaseContext *)_LSLogAppRecordInitsForDataSeparation();
  if ((_DWORD)v6)
  {
    _LSDataSeparationLog();
    BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v30 = a3;
      _os_log_impl(&dword_183E58000, v7, OS_LOG_TYPE_INFO, "bundle record search with app ID: %@", buf, 0xCu);
    }
  }

  CurrentContext = (void **)_LSDatabaseContextGetCurrentContext(v6);
  id v26 = 0LL;
  char v27 = 0;
  id v28 = 0LL;
  +[_LSDServiceDomain defaultServiceDomain]();
  id v8 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = (LSContext *)LaunchServices::Database::Context::_get( (LaunchServices::Database::Context *)&CurrentContext,  v8,  0LL);

  if (v9)
  {
    LaunchServices::BindingEvaluator::CreateWithApplicationIdentifier( (LaunchServices::BindingEvaluator *)a3,  0LL,  (uint64_t)buf);
    int Options = LaunchServices::BindingEvaluator::getOptions((LaunchServices::BindingEvaluator *)buf);
    LaunchServices::BindingEvaluator::setOptions((uint64_t)buf, Options | 0x80);
    LaunchServices::BindingEvaluator::getBestBinding((LaunchServices::BindingEvaluator *)buf, v9, a4, v23);
    if (v24)
    {
      id v11 = objc_alloc(&OBJC_CLASS___LSApplicationRecord);
      id v12 = -[LSApplicationRecord _initWithContext:bundleID:bundleData:error:]( v11,  "_initWithContext:bundleID:bundleData:error:",  v9,  LODWORD(v23[0]),  v23[1],  a4);
      if (v24)
      {
      }
    }

    else
    {
      id v12 = 0LL;
    }

    LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)buf);
  }

  else if (a4)
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    id v13 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v13, 0LL);

    if (v14) {
      id v15 = 0LL;
    }
    else {
      id v15 = v28;
    }
    id v12 = 0LL;
    *a4 = v15;
  }

  else
  {
    id v12 = 0LL;
  }

  id v16 = v12;
  if (CurrentContext && v27) {
    _LSContextDestroy(CurrentContext);
  }
  id v17 = v26;
  CurrentContext = 0LL;
  id v26 = 0LL;

  char v27 = 0;
  id v18 = v28;
  id v28 = 0LL;

  return (LSBundleRecord *)v16;
}

id __75__LSBundleRecord__bundleRecordForAuditToken_checkNSBundleMainBundle_error___block_invoke_3( uint64_t a1)
{
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  id v11 = __Block_byref_object_copy__8;
  id v12 = __Block_byref_object_dispose__8;
  id v13 = 0LL;
  uint64_t v2 = MEMORY[0x1895F87A8];
  v7[0] = (void (*)(void, void))MEMORY[0x1895F87A8];
  v7[1] = (void (*)(void, void))3221225472LL;
  v7[2] = (void (*)(void, void))__75__LSBundleRecord__bundleRecordForAuditToken_checkNSBundleMainBundle_error___block_invoke_4;
  v7[3] = (void (*)(void, void))&unk_189D72338;
  v7[4] = (void (*)(void, void))&v8;
  +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDReadService, v7);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  v6[1] = 3221225472LL;
  _OWORD v6[2] = __75__LSBundleRecord__bundleRecordForAuditToken_checkNSBundleMainBundle_error___block_invoke_5;
  v6[3] = &unk_189D74808;
  v6[4] = *(void *)(a1 + 32);
  v6[5] = &v8;
  [v3 getBundleRecordForCurrentProcessWithCompletionHandler:v6];
  id v4 = (id)v9[5];

  _Block_object_dispose(&v8, 8);
  return v4;
}

void __75__LSBundleRecord__bundleRecordForAuditToken_checkNSBundleMainBundle_error___block_invoke_4( uint64_t a1,  void *a2)
{
}

void __75__LSBundleRecord__bundleRecordForAuditToken_checkNSBundleMainBundle_error___block_invoke_5( uint64_t a1,  void *a2,  void *a3)
{
}

- (NSString)applicationIdentifier
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 _applicationIdentifier];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)bundleVersion
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  -[LSBundleRecord _bundleVersion](self, "_bundleVersion");
  _LSVersionNumberGetStringRepresentation(&v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

void __68__LSBundleRecord_developerTypeWithContext_tableID_unitID_unitBytes___block_invoke()
{
  v4[5] = *MEMORY[0x1895F89C0];
  id v0 = objc_alloc(MEMORY[0x189604010]);
  v4[0] = @"System";
  v4[1] = @"SystemAppPlaceholder";
  v4[2] = @"Internal";
  v4[3] = @"Hidden";
  v4[4] = @"CoreServices";
  [MEMORY[0x189603F18] arrayWithObjects:v4 count:5];
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v0 initWithArray:v1];
  __int128 v3 = (void *)-[LSBundleRecord developerTypeWithContext:tableID:unitID:unitBytes:]::systemTypes;
  -[LSBundleRecord developerTypeWithContext:tableID:unitID:unitBytes:]::systemTypes = v2;
}

void __67__LSBundleRecord_claimRecordsWithContext_tableID_unitID_unitBytes___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  if (_LSClaimGet())
  {
    v5 = -[LSRecord _initWithContext:tableID:unitID:]( objc_alloc(&OBJC_CLASS___LSClaimRecord),  "_initWithContext:tableID:unitID:",  *(void *)(a1 + 48),  *(unsigned int *)(a1 + 56),  a3);
    if (v5)
    {
      objc_storeWeak(v5 + 4, *(id *)(a1 + 32));
      [*(id *)(a1 + 40) addObject:v5];
    }
  }

void __69__LSBundleRecord_exported_typesWithContext_tableID_unitID_unitBytes___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  uint64_t v5 = _UTTypeGet();
  if (v5 && ((*(_DWORD *)(v5 + 8) >> 4) & 1) == *(_BYTE *)(a1 + 60))
  {
    id v6 = -[LSRecord _initWithContext:tableID:unitID:]( objc_alloc(&OBJC_CLASS____UTDeclaredTypeRecord),  "_initWithContext:tableID:unitID:",  *(void *)(a1 + 48),  *(unsigned int *)(a1 + 56),  a3);
    if (v6)
    {
      objc_storeWeak(v6 + 4, *(id *)(a1 + 32));
      [*(id *)(a1 + 40) addObject:v6];
    }
  }

- (NSSet)serviceRecords
{
  return (NSSet *)[MEMORY[0x189604010] set];
}

void __93__LSBundleRecord__initWithNode_bundleIdentifier_context_tableID_unitID_bundleBaseData_error___block_invoke( uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  __int128 v3 = **(void ***)(a1 + 48);
  int v4 = **(_DWORD **)(a1 + 56);
  uint64_t v5 = *(void *)(v2 + 8);
  id obj = *(id *)(v5 + 40);
  id v6 = _LSAliasCopyResolvedNode(v3, v4, 0LL, 0LL, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (const)_auditToken
{
  return self->_auditToken;
}

- (BOOL)_usesSystemPersona
{
  return 0;
}

- (BOOL)_containerized
{
  return 0;
}

- (unint64_t)_containerClass
{
  return 0LL;
}

- (id)_rawGroupContainerURLsCheckingRedaction
{
  if (!-[LSBundleRecord isRedacted](self, "isRedacted")) {
    goto LABEL_4;
  }
  id v9 = 0LL;
  BOOL v3 = -[LSBundleRecord unredactWithError:](self, "unredactWithError:", &v9);
  id v4 = v9;
  uint64_t v5 = v4;
  if (v3)
  {

LABEL_4:
    -[LSBundleRecord _rawGroupContainerURLs](self, "_rawGroupContainerURLs");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    return v6;
  }

  _LSDefaultLog();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    -[LSBundleRecord _rawGroupContainerURLsCheckingRedaction].cold.1();
  }

  id v6 = 0LL;
  return v6;
}

- (id)_getGroupContainersCreatingIfNecessary:(BOOL)a3 checkNonContainerizedBundles:(BOOL)a4
{
  BOOL v12 = 0;
  -[LSBundleRecord(Personas) _personasWithAttributes](self, "_personasWithAttributes", a3, a4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  _LSShouldFetchContainersFromContainermanagerForPersona( v5,  -[LSBundleRecord _usesSystemPersona](self, "_usesSystemPersona"),  &v12);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (([(id)__LSDefaultsGetSharedInstance() isInEducationMode] & 1) != 0 || !v6 && v12)
  {
    -[LSBundleRecord bundleIdentifier](self, "bundleIdentifier");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    dyld_get_active_platform();
    uint64_t v8 = (uint64_t)_LSCopyGroupContainerURLSFromContainermanager(v7);
  }

  else
  {
    -[LSBundleRecord _rawGroupContainerURLsCheckingRedaction](self, "_rawGroupContainerURLsCheckingRedaction");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LSLazyPropertyList propertyList](v9);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v8 = _LSCopyRationalizedGroupContainerURLDict(v7);
  }

  uint64_t v10 = (void *)v8;

  if (!v10 || v6)
  {

    uint64_t v10 = (void *)MEMORY[0x189604A60];
  }

  return v10;
}

- (NSDictionary)groupContainerURLs
{
  return (NSDictionary *)-[LSBundleRecord _getGroupContainersCreatingIfNecessary:checkNonContainerizedBundles:]( self,  "_getGroupContainersCreatingIfNecessary:checkNonContainerizedBundles:",  1LL,  0LL);
}

- (NSString)_fallbackLocalizedName
{
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  id v11 = __Block_byref_object_copy__8;
  BOOL v12 = __Block_byref_object_dispose__8;
  id v13 = 0LL;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __40__LSBundleRecord__fallbackLocalizedName__block_invoke;
  v7[3] = &unk_189D748F0;
  v7[4] = self;
  v7[5] = &v8;
  __LSRECORD_IS_PERFORMING_IO_FOR_A_CALLER__((uint64_t)v7);
  if (v9[5])
  {
    uint64_t v2 = +[_LSLocalizedStringRecord sanitizeString:](&OBJC_CLASS____LSLocalizedStringRecord, "sanitizeString:");
    BOOL v3 = (void *)v9[5];
    v9[5] = v2;
  }

  else
  {
    _LSDefaultLog();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[LSBundleRecord _fallbackLocalizedName].cold.1();
    }

    BOOL v3 = (void *)v9[5];
    v9[5] = (uint64_t)@"(no path)";
  }

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSString *)v5;
}

void __40__LSBundleRecord__fallbackLocalizedName__block_invoke(uint64_t a1)
{
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 lastPathComponent];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 stringByDeletingPathExtension];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

+ (id)_propertyClasses
{
  v3[7] = *MEMORY[0x1895F89C0];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  v3[5] = objc_opt_class();
  v3[6] = objc_opt_class();
  [MEMORY[0x189603F18] arrayWithObjects:v3 count:7];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_initWithContext:(LSContext *)a3 persistentIdentifierData:(const LSPersistentIdentifierData *)a4 length:(unint64_t)a5
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  unsigned int var3 = a4->var3;
  db = a3->db;
  if (var3 == a3->db->schema.bundleTable)
  {
    uint64_t v11 = _LSBundleGet(db, a4->var2);
    if (v11)
    {
      if (*(_DWORD *)(v11 + 160) == 11) {
        BOOL v12 = objc_alloc_init(&OBJC_CLASS____LSCoreTypesRecordProxy);
      }
      else {
        BOOL v12 = -[LSApplicationRecord _initWithContext:persistentIdentifierData:length:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "_initWithContext:persistentIdentifierData:length:",  a3,  a4,  a5);
      }
      goto LABEL_15;
    }

    _LSRecordLog();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      id v15 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytesNoCopy:a4 length:a5 freeWhenDone:0];
      *(_DWORD *)__int128 buf = 138412290;
      id v26 = v15;
      _os_log_impl( &dword_183E58000,  v14,  OS_LOG_TYPE_DEBUG,  "Failed to initialize application/bundle record with persistent identifier %@ because it was not found in the database.",  buf,  0xCu);
    }

    goto LABEL_13;
  }

  if (var3 == a3->db->schema.pluginTable)
  {
    uint64_t v13 = _LSGetPlugin((uint64_t)db, a4->var2);
    if (v13)
    {
      BOOL v12 = -[LSApplicationExtensionRecord _initWithContext:pluginID:pluginData:error:]( objc_alloc(&OBJC_CLASS___LSApplicationExtensionRecord),  "_initWithContext:pluginID:pluginData:error:",  a3,  a4->var2,  v13,  0LL);
LABEL_15:
      id v17 = v12;

      return v17;
    }

    _LSRecordLog();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      id v16 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytesNoCopy:a4 length:a5 freeWhenDone:0];
      *(_DWORD *)__int128 buf = 138412290;
      id v26 = v16;
      _os_log_impl( &dword_183E58000,  v14,  OS_LOG_TYPE_DEBUG,  "Failed to initialize application extension record with persistent identifier %@ because it was not found in the database.",  buf,  0xCu);
    }

- (id)description
{
  id v3 = objc_alloc(NSString);
  -[LSBundleRecord bundleIdentifier](self, "bundleIdentifier");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSBundleRecord URL](self, "URL");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = (void *)[v3 initWithFormat:@"{ bundleID: %@, URL: %@ }", v4, v5];

  return v6;
}

- (id)debugDescription
{
  id v3 = objc_alloc(NSString);
  uint64_t v4 = objc_opt_class();
  -[LSBundleRecord bundleIdentifier](self, "bundleIdentifier");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSBundleRecord URL](self, "URL");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___LSBundleRecord;
  -[LSRecord debugDescription](&v10, sel_debugDescription);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = (void *)[v3 initWithFormat:@"<%@ %p> { bundleID: %@, URL: %@, super: %@ }", v4, self, v5, v6, v7];

  return v8;
}

- (unint64_t)hash
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v5 = a3;
  -[LSBundleRecord URL](self, "URL");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 URL];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  char v8 = [v6 isEqual:v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___LSBundleRecord;
  -[LSRecord encodeWithCoder:](&v7, sel_encodeWithCoder_);
  [a3 encodeObject:self->_node forKey:@"node"];
  [a3 encodeObject:self->_bundleIdentifier forKey:@"bundleIdentifier"];
  if (self->_auditToken)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x189607B18]) initWithBytes:self->_auditToken objCType:"{?=[8I]}"];
    [a3 encodeObject:v5 forKey:@"auditToken"];
  }

  os_unfair_lock_lock((os_unfair_lock_t)&LaunchServices::Record::cachedDataContainerURLLock);
  id v6 = self->_cachedDataContainerURL;
  os_unfair_lock_unlock((os_unfair_lock_t)&LaunchServices::Record::cachedDataContainerURLLock);
  [a3 encodeObject:v6 forKey:@"cachedDataContainerURL"];
  [a3 encodeBool:*(_BYTE *)&self->_flags & 1 forKey:@"redacted"];
}

- (LSBundleRecord)initWithCoder:(id)a3
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  v45.receiver = self;
  v45.super_class = (Class)&OBJC_CLASS___LSBundleRecord;
  uint64_t v4 = -[LSRecord initWithCoder:](&v45, sel_initWithCoder_);
  if (v4)
  {
    uint64_t v5 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"node");
    node = v4->_node;
    v4->_node = (FSNode *)v5;

    uint64_t v7 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"bundleIdentifier");
    bundleIdentifier = v4->_bundleIdentifier;
    v4->_bundleIdentifier = (NSString *)v7;

    if (!v4->_auditToken)
    {
      objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"auditToken");
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_super v10 = v9;
      if (v9)
      {
        id v11 = v9;
        if (!strcmp((const char *)[v11 objCType], "{?=[8I]}"))
        {
          BOOL v12 = ($115C4C562B26FF47E01F9F4EA65B5887 *)operator new(0x20uLL);
          *(_OWORD *)v12->var0 = 0u;
          *(_OWORD *)&v12->var0[4] = 0u;
          v4->_auditToken = v12;
          [v11 getValue:v12 size:32];
        }
      }
    }

    id v13 = objc_alloc(MEMORY[0x189604010]);
    uint64_t v14 = objc_opt_class();
    id v15 = (void *)objc_msgSend(v13, "initWithObjects:", v14, objc_opt_class(), 0);
    uint64_t v16 = objc_msgSend(a3, "ls_decodeObjectOfClasses:forKey:", v15, @"cachedDataContainerURL");
    id cachedDataContainerURL = v4->_cachedDataContainerURL;
    v4->_id cachedDataContainerURL = (id)v16;

    *(_BYTE *)&v4->_flags = *(_BYTE *)&v4->_flags & 0xFE | [a3 decodeBoolForKey:@"redacted"];
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    -[LSRecord _resolvedPropertyValueForGetter:](v4, "_resolvedPropertyValueForGetter:", sel_claimRecords);
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [v18 countByEnumeratingWithState:&v41 objects:v48 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v42;
      do
      {
        for (uint64_t i = 0LL; i != v19; ++i)
        {
          if (*(void *)v42 != v20) {
            objc_enumerationMutation(v18);
          }
          objc_storeWeak((id *)(*(void *)(*((void *)&v41 + 1) + 8 * i) + 32LL), v4);
        }

        uint64_t v19 = [v18 countByEnumeratingWithState:&v41 objects:v48 count:16];
      }

      while (v19);
    }

    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    -[LSRecord _resolvedPropertyValueForGetter:](v4, "_resolvedPropertyValueForGetter:", sel_exportedTypeRecords);
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = [v22 countByEnumeratingWithState:&v37 objects:v47 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v38;
      do
      {
        for (uint64_t j = 0LL; j != v23; ++j)
        {
          if (*(void *)v38 != v24) {
            objc_enumerationMutation(v22);
          }
          id v26 = *(id **)(*((void *)&v37 + 1) + 8 * j);
        }

        uint64_t v23 = [v22 countByEnumeratingWithState:&v37 objects:v47 count:16];
      }

      while (v23);
    }

    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    -[LSRecord _resolvedPropertyValueForGetter:](v4, "_resolvedPropertyValueForGetter:", sel_importedTypeRecords);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v28 = [v27 countByEnumeratingWithState:&v33 objects:v46 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v34;
      do
      {
        for (uint64_t k = 0LL; k != v28; ++k)
        {
          if (*(void *)v34 != v29) {
            objc_enumerationMutation(v27);
          }
          uint64_t v31 = *(id **)(*((void *)&v33 + 1) + 8 * k);
        }

        uint64_t v28 = [v27 countByEnumeratingWithState:&v33 objects:v46 count:16];
      }

      while (v28);
    }
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___LSBundleRecord;
  uint64_t v4 = -[LSRecord copyWithZone:](&v10, sel_copyWithZone_, a3);
  uint64_t v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 7, self->_node);
    objc_storeStrong(v5 + 8, self->_bundleIdentifier);
    os_unfair_lock_lock((os_unfair_lock_t)&LaunchServices::Record::cachedDataContainerURLLock);
    objc_storeStrong(v5 + 5, self->_cachedDataContainerURL);
    os_unfair_lock_unlock((os_unfair_lock_t)&LaunchServices::Record::cachedDataContainerURLLock);
    auditToken = self->_auditToken;
    if (auditToken)
    {
      if (!v5[4])
      {
        uint64_t v7 = operator new(0x20uLL);
        __int128 v8 = *(_OWORD *)&auditToken->var0[4];
        _OWORD *v7 = *(_OWORD *)auditToken->var0;
        v7[1] = v8;
        v5[4] = v7;
      }
    }
  }

  return v5;
}

- (FSNode)_node
{
  return self->_node;
}

- (NSArray)_personasWithAttributes
{
  return (NSArray *)objc_getProperty(self, a2, 72LL, 1);
}

- (id)getGroupContainersCreatingIfNecessary:(BOOL)a3
{
  return -[LSBundleRecord _getGroupContainersCreatingIfNecessary:checkNonContainerizedBundles:]( self,  "_getGroupContainersCreatingIfNecessary:checkNonContainerizedBundles:",  a3,  1LL);
}

- (id)groupContainerIdentifiers
{
  uint64_t v3 = -[LSBundleRecord bundleIdentifier](self, "bundleIdentifier");
  if (!v3) {
    goto LABEL_3;
  }
  uint64_t v4 = (void *)v3;
  -[LSBundleRecord bundleIdentifier](self, "bundleIdentifier");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSBundleRecord entitlements](self, "entitlements");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = _LSCopyGroupContainerIdentifiersFromEntitlements(v5, v6);

  if (!v7) {
LABEL_3:
  }
    id v7 = objc_alloc_init(MEMORY[0x189604010]);
  return v7;
}

- (NSString)localizedShortName
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringValue];
  uint64_t v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  postprocessLocalizedNameishStringFromStringRecord(self, v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)localizedNameWithPreferredLocalizations:(id)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 stringValueWithPreferredLocalizations:a3];
  id v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  postprocessLocalizedNameishStringFromStringRecord(self, v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)localizedShortNameWithPreferredLocalizations:(id)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 stringValueWithPreferredLocalizations:a3];
  id v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  postprocessLocalizedNameishStringFromStringRecord(self, v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)localizedUsageDescriptionForFeature:(unint64_t)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (a3 >= 2)
  {
    _LSDefaultLog();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134217984;
      unint64_t v7 = a3;
      _os_log_impl( &dword_183E58000,  v4,  OS_LOG_TYPE_DEFAULT,  "Unknown usage description feature %lu",  (uint8_t *)&v6,  0xCu);
    }
  }

  return 0LL;
}

- (id)localizedUsageDescriptionForFeature:(unint64_t)a3 preferredLocalizations:(id)a4
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (a3 >= 2)
  {
    _LSDefaultLog();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      unint64_t v8 = a3;
      _os_log_impl( &dword_183E58000,  v5,  OS_LOG_TYPE_DEFAULT,  "Unknown usage description feature %lu",  (uint8_t *)&v7,  0xCu);
    }
  }

  return 0LL;
}

- (unint64_t)compatibilityState
{
  return 0LL;
}

- (NSArray)managedPersonas
{
  return 0LL;
}

- (NSArray)associatedPersonas
{
  return 0LL;
}

- (BOOL)personaIsApplicable:(id)a3
{
  if (-[LSBundleRecord _usesSystemPersona](self, "_usesSystemPersona")) {
    return 1;
  }
  -[LSBundleRecord associatedPersonas](self, "associatedPersonas");
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  char v5 = [v6 containsObject:a3];

  return v5;
}

- (NSString)accentColorName
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKey:@"NSAccentColorName" ofClass:objc_opt_class()];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)privacyTrackingDomains
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [v2 objectForKey:@"NSPrivacyTrackingDomains" ofClass:v3 valuesOfClass:objc_opt_class()];

  if (v4) {
    char v5 = (void *)v4;
  }
  else {
    char v5 = (void *)MEMORY[0x189604A58];
  }
  return (NSArray *)v5;
}

- (NSArray)WKBackgroundModes
{
  return (NSArray *)MEMORY[0x189604A58];
}

- (BOOL)supportsNowPlaying
{
  return 0;
}

void __84__LSBundleRecord_Intents__intentDefinitionURLsWithContext_tableID_unitID_unitBytes___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  id v5 = (id)[objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:a3 isDirectory:0];
  if (v5) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:a2];
  }
}

- (NSArray)supportedIntents
{
  return (NSArray *)MEMORY[0x189604A58];
}

- (NSArray)intentsRestrictedWhileLocked
{
  return (NSArray *)MEMORY[0x189604A58];
}

- (NSArray)intentsRestrictedWhileProtectedDataUnavailable
{
  return (NSArray *)MEMORY[0x189604A58];
}

- (NSArray)supportedIntentMediaCategories
{
  return (NSArray *)MEMORY[0x189604A58];
}

+ (id)redactedProperties
{
  if (+[LSBundleRecord(Redaction) redactedProperties]::once != -1) {
    dispatch_once(&+[LSBundleRecord(Redaction) redactedProperties]::once, &__block_literal_global_402);
  }
  return (id)+[LSBundleRecord(Redaction) redactedProperties]::properties;
}

void __47__LSBundleRecord_Redaction__redactedProperties__block_invoke()
{
  id v0 = (void *)+[LSBundleRecord(Redaction) redactedProperties]::properties;
  +[LSBundleRecord(Redaction) redactedProperties]::properties = (uint64_t)&unk_189DA84F0;
}

- (BOOL)eligibleForRedaction
{
  return (-[LSBundleRecord _baseFlags](self, "_baseFlags") >> 5) & 1;
}

- (BOOL)isRedacted
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)redact
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    if (-[LSBundleRecord eligibleForRedaction](self, "eligibleForRedaction"))
    {
      -[LSRecord _resolveAllProperties](self, "_resolveAllProperties");
      -[LSRecord detach](self, "detach");
      __int128 v10 = 0u;
      __int128 v11 = 0u;
      __int128 v8 = 0u;
      __int128 v9 = 0u;
      objc_msgSend((id)objc_opt_class(), "redactedProperties", 0);
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4)
      {
        uint64_t v5 = *(void *)v9;
        do
        {
          uint64_t v6 = 0LL;
          do
          {
            if (*(void *)v9 != v5) {
              objc_enumerationMutation(v3);
            }
            -[LSRecord _removeResolvedPropertyValueForGetter:]( self,  "_removeResolvedPropertyValueForGetter:",  NSSelectorFromString(*(NSString **)(*((void *)&v8 + 1) + 8 * v6++)));
          }

          while (v4 != v6);
          uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
        }

        while (v4);
      }

      *(_BYTE *)&self->_flags |= 1u;
    }

    else
    {
      _LSDefaultLog();
      int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        -[LSBundleRecord(Redaction) redact].cold.1();
      }
    }
  }

- (id)recordForUnredactingWithContext:(LSContext *)a3 error:(id *)a4
{
}

- (BOOL)unredactWithError:(id *)a3
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  if ((*(_BYTE *)&self->_flags & 1) == 0) {
    return 1;
  }
  if (_LSCurrentProcessMayMapDatabase())
  {
    id v41 = 0LL;
    __int128 v38 = 0LL;
    id v39 = 0LL;
    char v40 = 0;
    +[_LSDServiceDomain defaultServiceDomain]();
    uint64_t v6 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v38, v6, 0LL);

    if (v7)
    {
      id v37 = 0LL;
      -[LSBundleRecord recordForUnredactingWithContext:error:](self, "recordForUnredactingWithContext:error:", v7, &v37);
      __int128 v8 = (void *)objc_claimAutoreleasedReturnValue();
      id v30 = v37;
      if (v8)
      {
        id v9 = objc_alloc_init(MEMORY[0x189603FA8]);
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        [(id)objc_opt_class() redactedProperties];
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v42 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v34;
          do
          {
            for (uint64_t i = 0LL; i != v11; ++i)
            {
              if (*(void *)v34 != v12) {
                objc_enumerationMutation(v10);
              }
              uint64_t v14 = NSSelectorFromString(*(NSString **)(*((void *)&v33 + 1) + 8 * i));
              [v8 v14];
              id v15 = (void *)objc_claimAutoreleasedReturnValue();
              -[LSRecord _setResolvedPropertyValue:forGetter:](self, "_setResolvedPropertyValue:forGetter:", v15, v14);
              if ((objc_opt_respondsToSelector() & 1) != 0) {
                [v9 addObject:v15];
              }
            }

            uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v42 count:16];
          }

          while (v11);
        }

        v31[0] = MEMORY[0x1895F87A8];
        v31[1] = 3221225472LL;
        v31[2] = __47__LSBundleRecord_Redaction__unredactWithError___block_invoke_2;
        v31[3] = &unk_189D741C8;
        id v16 = v9;
        id v32 = v16;
        -[LSRecord _ifAttached:else:](self, "_ifAttached:else:", &__block_literal_global_410, v31);
        *(_BYTE *)&self->_flags &= ~1u;

        BOOL v3 = 1;
        goto LABEL_27;
      }
    }

    else
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      uint64_t v25 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v26 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v38, v25, 0LL);

      if (!v26)
      {
        id v30 = v41;
        if (a3) {
          goto LABEL_23;
        }
        goto LABEL_26;
      }

      id v30 = 0LL;
    }

    if (a3)
    {
LABEL_23:
      id v30 = v30;
      BOOL v3 = 0;
      __int128 v8 = 0LL;
      *a3 = v30;
      goto LABEL_27;
    }

uint64_t __47__LSBundleRecord_Redaction__unredactWithError___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) enumerateObjectsUsingBlock:&__block_literal_global_412];
}

uint64_t __47__LSBundleRecord_Redaction__unredactWithError___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 detach];
}

- (BOOL)appProtectionHidden
{
  return 0;
}

- (BOOL)appProtectionLocked
{
  return 0;
}

+ (void)bundleRecordForCurrentProcess
{
}

- (void)executableURLWithContext:tableID:unitID:unitBytes:.cold.1()
{
}

- (void)executableURLWithContext:tableID:unitID:unitBytes:.cold.2()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_6_0();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_debug_impl( &dword_183E58000,  v1,  OS_LOG_TYPE_DEBUG,  "Cannot generate executableURL for app %@ because it has no executable path stored (%llx)",  v2,  0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)_initWithNode:(os_log_t)log bundleIdentifier:context:tableID:unitID:bundleBaseData:error:.cold.1( os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl( &dword_183E58000,  log,  OS_LOG_TYPE_ERROR,  "could not resolve URL while initializing a bundle record!",  v1,  2u);
  OUTLINED_FUNCTION_33();
}

- (void)_rawGroupContainerURLsCheckingRedaction
{
}

- (void)_fallbackLocalizedName
{
}

@end
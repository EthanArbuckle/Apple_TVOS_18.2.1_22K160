@interface LSApplicationRecord
+ (BOOL)isAnyRegisteredApplicationInstalledFromDistributorOrWeb;
+ (BOOL)supportsSecureCoding;
+ (id)_alternateIconQueue;
+ (id)_propertyClasses;
+ (id)applicationRecordsForUserActivityDomainName:(id)a3 limit:(unint64_t)a4 error:(id *)a5;
+ (id)applicationRecordsForUserActivityType:(id)a3 limit:(unint64_t)a4 error:(id *)a5;
+ (id)displayOrderEnumeratorForViableDefaultAppsForCategory:(unint64_t)a3 options:(unint64_t)a4;
+ (id)enumeratorForViableDefaultAppsForCategory:(unint64_t)a3 options:(unint64_t)a4;
+ (id)enumeratorOnVolumeAtURL:(id)a3 options:(unint64_t)a4;
+ (id)enumeratorWithOptions:(unint64_t)a3;
+ (id)personalPersonaAttributes;
+ (id)redactedProperties;
+ (id)remotePlaceholderEnumerator;
+ (id)systemPlaceholderEnumerator;
+ (void)setUpdateAvailabilityForApplicationsWithBundleIdentifiers:(id)a3 completionHandler:(id)a4;
- (BOOL)_containerized;
- (BOOL)_usesSystemPersona;
- (BOOL)applicationHasMIDBasedSINF;
- (BOOL)applicationMissingRequiredSINF;
- (BOOL)canHandleWebAuthentication;
- (BOOL)getGenericTranslocationTargetURL:(id *)a3 error:(id *)a4;
- (BOOL)hasComplication;
- (BOOL)hasCustomNotification;
- (BOOL)hasGlance;
- (BOOL)hasParallelPlaceholder;
- (BOOL)hasSettingsBundle;
- (BOOL)isAdHocCodeSigned;
- (BOOL)isAppStoreVendable;
- (BOOL)isAppStoreVendableWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (BOOL)isArcadeApp;
- (BOOL)isBeta;
- (BOOL)isDeletable;
- (BOOL)isDeletableSystemApplication;
- (BOOL)isDeletableSystemApplicationWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (BOOL)isDeletableWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (BOOL)isEligibleForWatchAppInstall;
- (BOOL)isEligibleWebBrowser;
- (BOOL)isFileSharingEnabled;
- (BOOL)isInstalledFromDistributorOrWeb;
- (BOOL)isLaunchDisabled;
- (BOOL)isLaunchProhibited;
- (BOOL)isMailClient;
- (BOOL)isManagedAppDistributor;
- (BOOL)isPlaceholder;
- (BOOL)isSwiftPlaygroundsApp;
- (BOOL)isSystemPlaceholder;
- (BOOL)isSystemPlaceholderWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (BOOL)isTrustedForBinding;
- (BOOL)isUpdate;
- (BOOL)isWatchOnly;
- (BOOL)isWebAppPlaceholder;
- (BOOL)isWebBrowser;
- (BOOL)isWrapped;
- (BOOL)isWrapper;
- (BOOL)mayBeBUIVisible;
- (BOOL)requiresNativeExecution;
- (BOOL)requiresPostProcessing;
- (BOOL)runsIndependentlyOfCompanionApp;
- (BOOL)shouldShowSecurityPromptsOnSignIn;
- (BOOL)shouldSkipWatchAppInstall;
- (BOOL)supportsAlternateIconNames;
- (BOOL)supportsAudiobooks;
- (BOOL)supportsCarPlayDashboardScene;
- (BOOL)supportsCarPlayInstrumentClusterScene;
- (BOOL)supportsControllerUserInteraction;
- (BOOL)supportsExternallyPlayableContent;
- (BOOL)supportsLiveActivities;
- (BOOL)supportsLiveActivitiesFrequentUpdates;
- (BOOL)supportsMultiwindow;
- (BOOL)supportsOnDemandResources;
- (BOOL)supportsOpenInPlace;
- (BOOL)supportsPurgeableLocalStorage;
- (BOOL)supportsSpotlightQueryContinuation;
- (BOOL)wasRenamed;
- (LSAppClipMetadata)appClipMetadata;
- (LSApplicationRecord)initWithBundleIdentifier:(id)a3 allowPlaceholder:(BOOL)a4 error:(id *)a5;
- (LSApplicationRecord)initWithBundleIdentifier:(id)a3 fetchingPlaceholder:(int64_t)a4 error:(id *)a5;
- (LSApplicationRecord)initWithBundleIdentifierOfCompanionApplication:(id)a3 error:(id *)a4;
- (LSApplicationRecord)initWithBundleIdentifierOfSystemPlaceholder:(id)a3 error:(id *)a4;
- (LSApplicationRecord)initWithCoder:(id)a3;
- (LSApplicationRecord)initWithRemotePlaceholderBundleIdentifier:(id)a3 error:(id *)a4;
- (LSApplicationRecord)initWithStoreItemIdentifier:(unint64_t)a3 error:(id *)a4;
- (LSApplicationRecord)initWithURL:(id)a3 allowPlaceholder:(BOOL)a4 error:(id *)a5;
- (LSApplicationRecord)initWithURL:(id)a3 fetchingPlaceholder:(int64_t)a4 error:(id *)a5;
- (LSApplicationRecord)linkedParentApplication;
- (LSBundleMoreFlags)_rawMoreFlags;
- (LSBundleMoreFlags)_rawMoreFlagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (LSStashedAppMetadata)stashedAppMetadata;
- (LSiTunesMetadata)iTunesMetadata;
- (NSArray)VPNPlugins;
- (NSArray)_iconFileNames;
- (NSArray)appTags;
- (NSArray)audioComponents;
- (NSArray)backgroundTaskSchedulerPermittedIdentifiers;
- (NSArray)carPlayInstrumentClusterURLSchemes;
- (NSArray)counterpartIdentifiers;
- (NSArray)deviceFamilies;
- (NSArray)directionsModes;
- (NSArray)driverExtensionPaths;
- (NSArray)equivalentBundleIdentifiers;
- (NSArray)externalAccessoryProtocols;
- (NSArray)identities;
- (NSArray)spotlightActions;
- (NSArray)staticShortcutItems;
- (NSArray)supportedComplicationFamilies;
- (NSArray)supportedGameControllers;
- (NSArray)supportedLiveActivityLaunchAttributeTypes;
- (NSData)installSessionIdentifier;
- (NSData)uniqueInstallIdentifier;
- (NSDictionary)_localizedNamesWithContext;
- (NSDictionary)additionalEnvironmentVariables;
- (NSDictionary)iconDictionary;
- (NSDictionary)requiredDeviceCapabilities;
- (NSNumber)eligibilityDeletionDomain;
- (NSSet)applicationExtensionRecords;
- (NSSet)userActivityTypes;
- (NSString)_deviceIdentifierVendorName;
- (NSString)_linkedParentApplicationBundleID;
- (NSString)_preferredLaunchArchitecture;
- (NSString)alternateIconName;
- (NSString)appStoreToolsBuildVersion;
- (NSString)companionBundleIdentifier;
- (NSString)complicationPrincipalClassName;
- (NSString)exactBundleVersion;
- (NSString)jobLabel;
- (NSString)managementDomain;
- (NSString)maximumSystemVersion;
- (NSString)minimumSystemVersion;
- (NSString)regulatoryPrivacyDisclosureVersion;
- (NSString)shortVersionString;
- (NSString)typeForInstallMachinery;
- (NSString)watchKitApplicationTintColorName;
- (NSString)watchKitVersion;
- (NSURL)bundleContainerURL;
- (NSUUID)deviceIdentifierForAdvertising;
- (NSUUID)deviceIdentifierForVendor;
- (_LSApplicationState)applicationState;
- (_LSDiskUsage)diskUsage;
- (_LSLazyPropertyList)_rawEnvironmentVariables;
- (_LSLazyPropertyList)_rawIconDictionary;
- (id)VPNPluginsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)_compatibilityObjectWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6;
- (id)_deviceIdentifierVendorNameWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)_iconFileNamesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)_initWithBundleIdentifier:(id)a3 placeholder:(BOOL)a4 error:(id *)a5;
- (id)_initWithContext:(LSContext *)a3 bundleID:(unsigned int)a4 bundleData:(const LSBundleData *)a5 error:(id *)a6;
- (id)_initWithContext:(LSContext *)a3 persistentIdentifierData:(const LSPersistentIdentifierData *)a4 length:(unint64_t)a5;
- (id)_initWithNode:(id)a3 bundleIdentifier:(id)a4 context:(LSContext *)a5 tableID:(unsigned int)a6 unitID:(unsigned int)a7 bundleBaseData:(const LSBundleBaseData *)a8 error:(id *)a9;
- (id)_initWithNode:(id)a3 bundleIdentifier:(id)a4 placeholderBehavior:(int64_t)a5 systemPlaceholder:(BOOL)a6 itemID:(unint64_t)a7 forceInBundleContainer:(BOOL)a8 context:(LSContext *)a9 error:(id *)a10;
- (id)_linkedParentApplicationBundleIDWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)_localizedNamesWithContextWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)_persistentIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6;
- (id)_personasWithAttributes;
- (id)_personasWithAttributesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)_preferredLaunchArchitectureWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)_rawEnvironmentVariablesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)_rawIconDictionaryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)appStoreToolsBuildVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)appTagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)applicationExtensionRecordsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)applicationStateWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)associatedPersonas;
- (id)audioComponentsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)backgroundTaskSchedulerPermittedIdentifiersWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)bundleContainerURLWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)bundleMetadataReturningError:(id *)a3;
- (id)bundleVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)companionBundleIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)counterpartIdentifiersWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)deviceFamiliesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)directionsModesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)diskUsageWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)driverExtensionPathsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)equivalentBundleIdentifiersWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)exactBundleVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)extensionPointRecordForIdentifier:(id)a3 platform:(unsigned int)a4 error:(id *)a5;
- (id)externalAccessoryProtocolsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)getApplicationExtensionDiagnosticDescriptionWithError:(id *)a3;
- (id)iTunesMetadataWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)iconDictionaryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)initForInstallMachineryWithBundleIdentifier:(id)a3 error:(id *)a4;
- (id)installSessionIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)intentsRestrictedWhileLocked;
- (id)intentsRestrictedWhileProtectedDataUnavailable;
- (id)linkedChildApplicationRecordEnumeratorWithOptions:(unint64_t)a3;
- (id)localizedNameWithContext:(id)a3;
- (id)localizedNameWithContext:(id)a3 preferredLocalizations:(id)a4;
- (id)managedPersonas;
- (id)managementDomainWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)maximumSystemVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)minimumSystemVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)recordForUnredactingWithContext:(LSContext *)a3 error:(id *)a4;
- (id)regulatoryPrivacyDisclosureVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)requiredDeviceCapabilitiesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)shortVersionStringWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)stashedAppMetadataWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)staticShortcutItemsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)supportedGameControllersWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)supportedIntentMediaCategories;
- (id)supportedIntents;
- (id)trustedCDHashes;
- (id)typeForInstallMachineryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)uniqueInstallIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)userActivityTypesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (int)_bundleModTime;
- (int)_bundleModTimeWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (unint64_t)_containerClass;
- (unint64_t)_rawBundleFlags;
- (unint64_t)_rawBundleFlagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (unint64_t)applicationDSID;
- (unint64_t)applicationDSIDWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (unint64_t)applicationDownloaderDSID;
- (unint64_t)applicationDownloaderDSIDWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (unint64_t)applicationFamilyID;
- (unint64_t)applicationFamilyIDWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (unint64_t)bundleInode;
- (unint64_t)compatibilityState;
- (unint64_t)compatibilityStateWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (unint64_t)executableInode;
- (unint64_t)installType;
- (unint64_t)installTypeWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (unint64_t)placeholderFailureReason;
- (unint64_t)placeholderFailureReasonWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (unint64_t)sequenceNumber;
- (unint64_t)supportedDefaultAppCategories;
- (unint64_t)updateAvailability;
- (unsigned)_rawIconFlags;
- (unsigned)_rawIconFlagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (unsigned)_rawPlistFlags;
- (unsigned)_rawPlistFlagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (unsigned)watchKitApplicationType;
- (void)_LSRecord_resolve_VPNPlugins;
- (void)_LSRecord_resolve__deviceIdentifierVendorName;
- (void)_LSRecord_resolve__iconFileNames;
- (void)_LSRecord_resolve__linkedParentApplicationBundleID;
- (void)_LSRecord_resolve__localizedNamesWithContext;
- (void)_LSRecord_resolve__personasWithAttributes;
- (void)_LSRecord_resolve__preferredLaunchArchitecture;
- (void)_LSRecord_resolve__rawEnvironmentVariables;
- (void)_LSRecord_resolve__rawIconDictionary;
- (void)_LSRecord_resolve_appStoreToolsBuildVersion;
- (void)_LSRecord_resolve_appTags;
- (void)_LSRecord_resolve_applicationExtensionRecords;
- (void)_LSRecord_resolve_applicationState;
- (void)_LSRecord_resolve_audioComponents;
- (void)_LSRecord_resolve_backgroundTaskSchedulerPermittedIdentifiers;
- (void)_LSRecord_resolve_bundleContainerURL;
- (void)_LSRecord_resolve_companionBundleIdentifier;
- (void)_LSRecord_resolve_counterpartIdentifiers;
- (void)_LSRecord_resolve_deviceFamilies;
- (void)_LSRecord_resolve_directionsModes;
- (void)_LSRecord_resolve_diskUsage;
- (void)_LSRecord_resolve_driverExtensionPaths;
- (void)_LSRecord_resolve_equivalentBundleIdentifiers;
- (void)_LSRecord_resolve_exactBundleVersion;
- (void)_LSRecord_resolve_externalAccessoryProtocols;
- (void)_LSRecord_resolve_iTunesMetadata;
- (void)_LSRecord_resolve_iconDictionary;
- (void)_LSRecord_resolve_installSessionIdentifier;
- (void)_LSRecord_resolve_managementDomain;
- (void)_LSRecord_resolve_maximumSystemVersion;
- (void)_LSRecord_resolve_minimumSystemVersion;
- (void)_LSRecord_resolve_regulatoryPrivacyDisclosureVersion;
- (void)_LSRecord_resolve_requiredDeviceCapabilities;
- (void)_LSRecord_resolve_shortVersionString;
- (void)_LSRecord_resolve_stashedAppMetadata;
- (void)_LSRecord_resolve_staticShortcutItems;
- (void)_LSRecord_resolve_supportedGameControllers;
- (void)_LSRecord_resolve_typeForInstallMachinery;
- (void)_LSRecord_resolve_uniqueInstallIdentifier;
- (void)_LSRecord_resolve_userActivityTypes;
- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6;
- (void)additionalEnvironmentVariables;
- (void)clearAdvertisingIdentifier;
- (void)getDeviceManagementPolicyWithCompletionHandler:(id)a3;
- (void)linkedParentApplication;
- (void)setAlternateIconName:(id)a3 completionHandler:(id)a4;
- (void)setUpdateAvailability:(unint64_t)a3 completionHandler:(id)a4;
@end

@implementation LSApplicationRecord

- (id)_initWithContext:(LSContext *)a3 bundleID:(unsigned int)a4 bundleData:(const LSBundleData *)a5 error:(id *)a6
{
  uint64_t v7 = (uint64_t)a5;
  uint64_t v8 = *(void *)&a4;
  v14[1] = *MEMORY[0x1895F89C0];
  if (a5) {
    return -[LSApplicationRecord _initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:]( self,  "_initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:",  0LL,  0LL,  a3,  a3->db->schema.bundleTable,  v8,  v7,  a6);
  }
  uint64_t v7 = _LSBundleGet(a3->db, a4);
  if (v7) {
    return -[LSApplicationRecord _initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:]( self,  "_initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:",  0LL,  0LL,  a3,  a3->db->schema.bundleTable,  v8,  v7,  a6);
  }
  if (a6)
  {
    uint64_t v13 = *MEMORY[0x189607490];
    v14[0] = @"Unable to find this application record in the Launch Services database.";
    [MEMORY[0x189603F68] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -10814LL,  (uint64_t)"-[LSApplicationRecord _initWithContext:bundleID:bundleData:error:]",  1304LL,  v12);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (id)_initWithNode:(id)a3 bundleIdentifier:(id)a4 context:(LSContext *)a5 tableID:(unsigned int)a6 unitID:(unsigned int)a7 bundleBaseData:(const LSBundleBaseData *)a8 error:(id *)a9
{
  uint64_t v10 = *(void *)&a7;
  uint64_t v11 = *(void *)&a6;
  uint64_t v27 = 0LL;
  v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  v30 = __Block_byref_object_copy__93;
  v31 = __Block_byref_object_dispose__94;
  id v32 = a3;
  uint64_t v15 = v28[5];
  if (v15) {
    goto LABEL_5;
  }
  uint64_t v21 = 0LL;
  v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  v24 = __Block_byref_object_copy__93;
  v25 = __Block_byref_object_dispose__94;
  id v26 = 0LL;
  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  v19[2] = __98__LSApplicationRecord__initWithNode_bundleIdentifier_context_tableID_unitID_bundleBaseData_error___block_invoke;
  v19[3] = &unk_189D72788;
  v19[5] = &v21;
  v19[6] = a5;
  int v20 = v10;
  v19[4] = &v27;
  __LSRECORD_IS_PERFORMING_IO_FOR_A_CALLER__((uint64_t)v19);
  if (a9) {
    *a9 = (id) v22[5];
  }
  _Block_object_dispose(&v21, 8);

  uint64_t v15 = v28[5];
  if (v15)
  {
LABEL_5:
    v18.receiver = self;
    v18.super_class = (Class)&OBJC_CLASS___LSApplicationRecord;
    id v16 = -[LSBundleRecord _initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:]( &v18,  sel__initWithNode_bundleIdentifier_context_tableID_unitID_bundleBaseData_error_,  v15,  a4,  a5,  v11,  v10,  a8,  a9);
  }

  else
  {

    id v16 = 0LL;
  }

  _Block_object_dispose(&v27, 8);

  return v16;
}

void __98__LSApplicationRecord__initWithNode_bundleIdentifier_context_tableID_unitID_bundleBaseData_error___block_invoke( uint64_t a1)
{
  int v2 = _LSBundleCopyNode( **(void **)(a1 + 48),  *(unsigned int *)(a1 + 56),  0LL,  0LL,  *(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id obj = *(id *)(v3 + 40);
  _LSGetNSErrorFromOSStatusImpl( v2,  &obj,  (uint64_t)"-[LSApplicationRecord _initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:]_block_invoke",  1266LL);
  objc_storeStrong((id *)(v3 + 40), obj);
}

- (NSArray)_iconFileNames
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel__iconFileNamesWithContext_tableID_unitID_unitBytes_);
}

- (id)_iconFileNamesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return _LSDatabaseGetStringArray(a3->db);
}

- (BOOL)isPlaceholder
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 18) & 1;
}

- (unint64_t)_rawBundleFlags
{
  return __LSRECORD_GETTER__<unsigned long long>( self,  (LSRecord *)a2,  sel__rawBundleFlagsWithContext_tableID_unitID_unitBytes_);
}

- (unint64_t)_rawBundleFlagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return *(void *)(&a6->_clas + 1);
}

- (NSURL)bundleContainerURL
{
  return (NSURL *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_bundleContainerURLWithContext_tableID_unitID_unitBytes_);
}

- (id)bundleContainerURLWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  v12 = __Block_byref_object_copy__93;
  uint64_t v13 = __Block_byref_object_dispose__94;
  id v14 = 0LL;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __90__LSApplicationRecord_Containers__bundleContainerURLWithContext_tableID_unitID_unitBytes___block_invoke;
  v8[3] = &unk_189D72838;
  v8[5] = a3;
  v8[6] = a6;
  v8[4] = &v9;
  __LSRECORD_IS_PERFORMING_IO_FOR_A_CALLER__((uint64_t)v8);
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __90__LSApplicationRecord_Containers__bundleContainerURLWithContext_tableID_unitID_unitBytes___block_invoke( uint64_t a1)
{
  int v2 = _LSAliasCopyResolvedNode(**(void ***)(a1 + 40), *(_DWORD *)(*(void *)(a1 + 48) + 484LL), 0LL, 0LL, 0LL);
  if (v2)
  {
    id v6 = v2;
    uint64_t v3 = [v2 URL];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    int v2 = v6;
  }
}

- (NSString)exactBundleVersion
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_exactBundleVersionWithContext_tableID_unitID_unitBytes_);
}

- (id)exactBundleVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return (id)_CSStringCopyCFString();
}

- (LSBundleMoreFlags)_rawMoreFlags
{
  return (LSBundleMoreFlags)__LSRECORD_GETTER__<LSBundleMoreFlags>( self,  (LSRecord *)a2,  sel__rawMoreFlagsWithContext_tableID_unitID_unitBytes_);
}

- (LSBundleMoreFlags)_rawMoreFlagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return (LSBundleMoreFlags)*(unsigned __int16 *)((char *)&a6->_itemFlags + 1);
}

- (unsigned)_rawIconFlags
{
  return __LSRECORD_GETTER__<unsigned char>( self,  (LSRecord *)a2,  sel__rawIconFlagsWithContext_tableID_unitID_unitBytes_);
}

- (unsigned)_rawIconFlagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return a6->_itemFlags;
}

- (void)_LSRecord_resolve_VPNPlugins
{
  id v2 = -[LSApplicationRecord VPNPlugins](self, "VPNPlugins");
}

- (NSArray)VPNPlugins
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_VPNPluginsWithContext_tableID_unitID_unitBytes_);
}

- (id)VPNPluginsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  v13[1] = *MEMORY[0x1895F89C0];
  if ((a6->_bundleFlags & 0x100000000000LL) == 0) {
    return MEMORY[0x189604A58];
  }
  -[LSBundleRecord infoDictionary](self, "infoDictionary", a3, *(void *)&a4, *(void *)&a5);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = objc_opt_class();
  [v8 objectForKey:@"UIVPNPlugin" ofClass:v9 valuesOfClass:objc_opt_class()];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10) {
    return v10;
  }
  -[LSBundleRecord infoDictionary](self, "infoDictionary");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 objectForKey:@"UIVPNPlugin" ofClass:objc_opt_class()];
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12) {
    return MEMORY[0x189604A58];
  }
  v13[0] = v12;
  [MEMORY[0x189603F18] arrayWithObjects:v13 count:1];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10) {
    return v10;
  }
  else {
    return MEMORY[0x189604A58];
  }
}

- (int)_bundleModTime
{
  return __LSRECORD_GETTER__<unsigned int>( self,  (LSRecord *)a2,  sel__bundleModTimeWithContext_tableID_unitID_unitBytes_);
}

- (int)_bundleModTimeWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return _LSBundleDataGetModTime((uint64_t)a6);
}

- (void)_LSRecord_resolve__deviceIdentifierVendorName
{
  id v2 = -[LSApplicationRecord _deviceIdentifierVendorName](self, "_deviceIdentifierVendorName");
}

- (NSString)_deviceIdentifierVendorName
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel__deviceIdentifierVendorNameWithContext_tableID_unitID_unitBytes_);
}

- (id)_deviceIdentifierVendorNameWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return +[_LSDDeviceIdentifierService vendorNameForDeviceIdentifiersWithContext:bundleUnit:bundleData:]( &OBJC_CLASS____LSDDeviceIdentifierService,  "vendorNameForDeviceIdentifiersWithContext:bundleUnit:bundleData:",  a3,  *(void *)&a5,  a6);
}

- (void)_LSRecord_resolve__iconFileNames
{
  id v2 = -[LSApplicationRecord _iconFileNames](self, "_iconFileNames");
}

- (void)_LSRecord_resolve__linkedParentApplicationBundleID
{
  id v2 = -[LSApplicationRecord _linkedParentApplicationBundleID](self, "_linkedParentApplicationBundleID");
}

- (NSString)_linkedParentApplicationBundleID
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel__linkedParentApplicationBundleIDWithContext_tableID_unitID_unitBytes_);
}

- (id)_linkedParentApplicationBundleIDWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return (id)_CSStringCopyCFString();
}

- (void)_LSRecord_resolve__localizedNamesWithContext
{
  id v2 = -[LSApplicationRecord _localizedNamesWithContext](self, "_localizedNamesWithContext");
}

- (NSDictionary)_localizedNamesWithContext
{
  return (NSDictionary *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel__localizedNamesWithContextWithContext_tableID_unitID_unitBytes_);
}

- (id)_localizedNamesWithContextWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  v12 = __Block_byref_object_copy__93;
  uint64_t v13 = __Block_byref_object_dispose__94;
  id v14 = 0LL;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __86__LSApplicationRecord__localizedNamesWithContextWithContext_tableID_unitID_unitBytes___block_invoke;
  v8[3] = &unk_189D727D0;
  v8[4] = &v9;
  v8[5] = a6;
  v8[6] = a3;
  _LSBundleDisplayNameContextEnumerate(v8, a2, a3, *(void *)&a4, *(void *)&a5);
  id v6 = (void *)[(id)v10[5] copy];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void)_LSRecord_resolve__personasWithAttributes
{
  id v2 = -[LSApplicationRecord _personasWithAttributes](self, "_personasWithAttributes");
}

- (id)_personasWithAttributes
{
  return __LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel__personasWithAttributesWithContext_tableID_unitID_unitBytes_);
}

- (id)_personasWithAttributesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  id v7 = objc_alloc_init(MEMORY[0x189603FE0]);
  _LSDatabaseGetStringArray(a3->db);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  __p = 0LL;
  id v26 = 0LL;
  uint64_t v27 = 0LL;
  uint64_t v20 = MEMORY[0x1895F87A8];
  uint64_t v21 = 3221225472LL;
  v22 = __83__LSApplicationRecord__personasWithAttributesWithContext_tableID_unitID_unitBytes___block_invoke;
  uint64_t v23 = &__block_descriptor_40_e14_v24__0I8I12_16l;
  p_p = &__p;
  _CSArrayEnumerateAllValues();
  for (unsigned int i = 0; ; ++i)
  {
    uint64_t v11 = __p;
    uint64_t v10 = v26;
    unint64_t v12 = objc_msgSend(v8, "count", v20, v21, v22, v23, p_p);
    unint64_t v13 = v12 >= (v10 - v11) >> 3 ? (v10 - v11) >> 3 : v12;
    if (v13 <= i) {
      break;
    }
    id v14 = objc_alloc(&OBJC_CLASS____LSPersonaWithAttributes);
    uint64_t v15 = *((void *)__p + i);
    [v8 objectAtIndexedSubscript:i];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[_LSPersonaWithAttributes initWithPersonaType:personaUniqueString:](v14, v15, v16);
    [v7 addObject:v17];
  }

  [v7 allObjects];
  objc_super v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (__p)
  {
    id v26 = __p;
    operator delete(__p);
  }

  return v18;
}

void __83__LSApplicationRecord__personasWithAttributesWithContext_tableID_unitID_unitBytes___block_invoke( uint64_t a1,  uint64_t a2,  unsigned int a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = a3;
  v5 = *(void **)(v3 + 8);
  unint64_t v6 = *(void *)(v3 + 16);
  if ((unint64_t)v5 >= v6)
  {
    uint64_t v8 = *(void **)v3;
    uint64_t v9 = ((uint64_t)v5 - *(void *)v3) >> 3;
    unint64_t v10 = v9 + 1;
    uint64_t v11 = v6 - (void)v8;
    if (v11 >> 2 > v10) {
      unint64_t v10 = v11 >> 2;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      unint64_t v13 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<os_eligibility_answer_t>>(v3 + 16, v12);
      uint64_t v8 = *(void **)v3;
      v5 = *(void **)(v3 + 8);
    }

    else
    {
      unint64_t v13 = 0LL;
    }

    id v14 = &v13[8 * v9];
    uint64_t v15 = &v13[8 * v12];
    *(void *)id v14 = v4;
    id v7 = v14 + 8;
    while (v5 != v8)
    {
      uint64_t v16 = *--v5;
      *((void *)v14 - 1) = v16;
      v14 -= 8;
    }

    *(void *)uint64_t v3 = v14;
    *(void *)(v3 + 8) = v7;
    *(void *)(v3 + 16) = v15;
    if (v8) {
      operator delete(v8);
    }
  }

  else
  {
    void *v5 = a3;
    id v7 = v5 + 1;
  }

  *(void *)(v3 + 8) = v7;
}

- (void)_LSRecord_resolve__preferredLaunchArchitecture
{
  id v2 = -[LSApplicationRecord _preferredLaunchArchitecture](self, "_preferredLaunchArchitecture");
}

- (NSString)_preferredLaunchArchitecture
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel__preferredLaunchArchitectureWithContext_tableID_unitID_unitBytes_);
}

- (id)_preferredLaunchArchitectureWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return _LSBundleGetPreferredLaunchArchitecture(a3->db, a5);
}

- (void)_LSRecord_resolve__rawEnvironmentVariables
{
  id v2 = -[LSApplicationRecord _rawEnvironmentVariables](self, "_rawEnvironmentVariables");
}

- (_LSLazyPropertyList)_rawEnvironmentVariables
{
  return (_LSLazyPropertyList *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel__rawEnvironmentVariablesWithContext_tableID_unitID_unitBytes_);
}

- (id)_rawEnvironmentVariablesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return +[_LSLazyPropertyList lazyPropertyListWithContext:unit:]( &OBJC_CLASS____LSLazyPropertyList,  "lazyPropertyListWithContext:unit:",  a3,  a6->activityTypes,  *(void *)&a5);
}

- (void)_LSRecord_resolve__rawIconDictionary
{
  id v2 = -[LSApplicationRecord _rawIconDictionary](self, "_rawIconDictionary");
}

- (_LSLazyPropertyList)_rawIconDictionary
{
  return (_LSLazyPropertyList *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel__rawIconDictionaryWithContext_tableID_unitID_unitBytes_);
}

- (id)_rawIconDictionaryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return +[_LSLazyPropertyList lazyPropertyListWithContext:unit:]( &OBJC_CLASS____LSLazyPropertyList,  "lazyPropertyListWithContext:unit:",  a3,  HIDWORD(a6->genreID),  *(void *)&a5);
}

- (unsigned)_rawPlistFlags
{
  return __LSRECORD_GETTER__<unsigned int>( self,  (LSRecord *)a2,  sel__rawPlistFlagsWithContext_tableID_unitID_unitBytes_);
}

- (unsigned)_rawPlistFlagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return HIDWORD(a6->_bundleFlags);
}

- (void)_LSRecord_resolve_appStoreToolsBuildVersion
{
  id v2 = -[LSApplicationRecord appStoreToolsBuildVersion](self, "appStoreToolsBuildVersion");
}

- (NSString)appStoreToolsBuildVersion
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_appStoreToolsBuildVersionWithContext_tableID_unitID_unitBytes_);
}

- (id)appStoreToolsBuildVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  unint64_t v6 = (__CFString *)_CSStringCopyCFString();
  id v7 = v6;
  if (!v6) {
    unint64_t v6 = &stru_189D7B4C8;
  }
  uint64_t v8 = v6;

  return v8;
}

- (void)_LSRecord_resolve_appTags
{
  id v2 = -[LSApplicationRecord appTags](self, "appTags");
}

- (NSArray)appTags
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_appTagsWithContext_tableID_unitID_unitBytes_);
}

- (id)appTagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  if ((a6->_bundleFlags & 0x80000000000LL) == 0
    || (-[LSBundleRecord infoDictionary](self, "infoDictionary", a3, *(void *)&a4, *(void *)&a5),
        unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = objc_opt_class(),
        [v6 objectForKey:@"SBAppTags" ofClass:v7 valuesOfClass:objc_opt_class()],
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v8))
  {
    uint64_t v8 = (void *)MEMORY[0x189604A58];
  }

  return v8;
}

- (unint64_t)applicationDSID
{
  return __LSRECORD_GETTER__<unsigned long long>( self,  (LSRecord *)a2,  sel_applicationDSIDWithContext_tableID_unitID_unitBytes_);
}

- (unint64_t)applicationDSIDWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return a6->staticDiskUsage;
}

- (unint64_t)applicationDownloaderDSID
{
  return __LSRECORD_GETTER__<unsigned long long>( self,  (LSRecord *)a2,  sel_applicationDownloaderDSIDWithContext_tableID_unitID_unitBytes_);
}

- (unint64_t)applicationDownloaderDSIDWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return a6->purchaserDSID;
}

- (void)_LSRecord_resolve_applicationExtensionRecords
{
  id v2 = -[LSApplicationRecord applicationExtensionRecords](self, "applicationExtensionRecords");
}

- (NSSet)applicationExtensionRecords
{
  return (NSSet *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_applicationExtensionRecordsWithContext_tableID_unitID_unitBytes_);
}

- (id)applicationExtensionRecordsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  id v8 = objc_alloc_init(MEMORY[0x189603FE0]);
  _CSArrayEnumerateAllValues();
  unint64_t v6 = (void *)[v8 copy];

  return v6;
}

- (unint64_t)applicationFamilyID
{
  return __LSRECORD_GETTER__<unsigned long long>( self,  (LSRecord *)a2,  sel_applicationFamilyIDWithContext_tableID_unitID_unitBytes_);
}

- (unint64_t)applicationFamilyIDWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return a6->downloaderDSID;
}

- (void)_LSRecord_resolve_applicationState
{
  id v2 = -[LSApplicationRecord applicationState](self, "applicationState");
}

- (_LSApplicationState)applicationState
{
  return (_LSApplicationState *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_applicationStateWithContext_tableID_unitID_unitBytes_);
}

- (id)applicationStateWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  unint64_t v8 = -[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags", a3, *(void *)&a4, *(void *)&a5);
  uint64_t v9 = 12LL;
  char v10 = 41;
  if ((v8 & 0x40000) != 0) {
    char v10 = 12;
  }
  uint64_t v11 = 32LL;
  if ((v8 & 0x40000) == 0)
  {
    uint64_t v11 = 2LL;
    uint64_t v9 = 20LL;
  }

  unint64_t v12 = (v8 >> v10) & v11 | v9;
  uint64_t bundleVersion = a6->bundleVersion;
  id v14 = objc_alloc(&OBJC_CLASS____LSApplicationState);
  -[LSBundleRecord bundleIdentifier](self, "bundleIdentifier");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = -[_LSApplicationState initWithBundleIdentifier:stateFlags:ratingRank:installType:]( v14,  "initWithBundleIdentifier:stateFlags:ratingRank:installType:",  v15,  v12,  a6->sourceAppBundleID,  bundleVersion);

  return v16;
}

- (void)_LSRecord_resolve_audioComponents
{
  id v2 = -[LSApplicationRecord audioComponents](self, "audioComponents");
}

- (NSArray)audioComponents
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_audioComponentsWithContext_tableID_unitID_unitBytes_);
}

- (id)audioComponentsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  if ((a6->_bundleFlags & 0x40000000000LL) == 0
    || (-[LSBundleRecord infoDictionary](self, "infoDictionary", a3, *(void *)&a4, *(void *)&a5),
        unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = objc_opt_class(),
        [v6 objectForKey:@"AudioComponents" ofClass:v7 valuesOfClass:objc_opt_class()],
        unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v8))
  {
    unint64_t v8 = (void *)MEMORY[0x189604A58];
  }

  return v8;
}

- (void)_LSRecord_resolve_backgroundTaskSchedulerPermittedIdentifiers
{
  id v2 =  -[LSApplicationRecord backgroundTaskSchedulerPermittedIdentifiers]( self,  "backgroundTaskSchedulerPermittedIdentifiers");
}

- (NSArray)backgroundTaskSchedulerPermittedIdentifiers
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_backgroundTaskSchedulerPermittedIdentifiersWithContext_tableID_unitID_unitBytes_);
}

- (id)backgroundTaskSchedulerPermittedIdentifiersWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = v6;
  if (!v6) {
    unint64_t v6 = (void *)MEMORY[0x189604A58];
  }
  id v8 = v6;

  return v8;
}

- (void)_LSRecord_resolve_bundleContainerURL
{
  id v2 = -[LSApplicationRecord bundleContainerURL](self, "bundleContainerURL");
}

- (void)_LSRecord_resolve_companionBundleIdentifier
{
  id v2 = -[LSApplicationRecord companionBundleIdentifier](self, "companionBundleIdentifier");
}

- (NSString)companionBundleIdentifier
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_companionBundleIdentifierWithContext_tableID_unitID_unitBytes_);
}

- (id)companionBundleIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return 0LL;
}

- (unint64_t)compatibilityState
{
  return __LSRECORD_GETTER__<unsigned long>( self,  (LSRecord *)a2,  sel_compatibilityStateWithContext_tableID_unitID_unitBytes_);
}

- (unint64_t)compatibilityStateWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return a6->sequenceNumber;
}

- (void)_LSRecord_resolve_counterpartIdentifiers
{
  id v2 = -[LSApplicationRecord counterpartIdentifiers](self, "counterpartIdentifiers");
}

- (NSArray)counterpartIdentifiers
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_counterpartIdentifiersWithContext_tableID_unitID_unitBytes_);
}

- (id)counterpartIdentifiersWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return _LSDatabaseGetStringArray(a3->db);
}

- (void)_LSRecord_resolve_deviceFamilies
{
  id v2 = -[LSApplicationRecord deviceFamilies](self, "deviceFamilies");
}

- (NSArray)deviceFamilies
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_deviceFamiliesWithContext_tableID_unitID_unitBytes_);
}

- (id)deviceFamiliesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  id v8 = objc_alloc_init(MEMORY[0x189603FA8]);
  _CSArrayEnumerateAllValues();
  unint64_t v6 = (void *)[v8 copy];

  return v6;
}

void __93__LSApplicationRecord_InfoPlistRarities__deviceFamiliesWithContext_tableID_unitID_unitBytes___block_invoke( uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:");
}

- (void)_LSRecord_resolve_directionsModes
{
  id v2 = -[LSApplicationRecord directionsModes](self, "directionsModes");
}

- (NSArray)directionsModes
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_directionsModesWithContext_tableID_unitID_unitBytes_);
}

- (id)directionsModesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  if ((a6->_bundleFlags & 0x10000000000LL) == 0
    || (-[LSBundleRecord infoDictionary](self, "infoDictionary", a3, *(void *)&a4, *(void *)&a5),
        unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = objc_opt_class(),
        [v6 objectForKey:@"MKDirectionsApplicationSupportedModes" ofClass:v7 valuesOfClass:objc_opt_class()],  id v8 = (void *)objc_claimAutoreleasedReturnValue(),  v6,  !v8))
  {
    id v8 = (void *)MEMORY[0x189604A58];
  }

  return v8;
}

- (void)_LSRecord_resolve_diskUsage
{
  id v2 = -[LSApplicationRecord diskUsage](self, "diskUsage");
}

- (_LSDiskUsage)diskUsage
{
  return (_LSDiskUsage *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_diskUsageWithContext_tableID_unitID_unitBytes_);
}

- (id)diskUsageWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  v15[1] = *MEMORY[0x1895F89C0];
  -[LSBundleRecord bundleIdentifier](self, "bundleIdentifier", a3, *(void *)&a4, *(void *)&a5);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v14 = @"static";
  [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)&a6->vendorName];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  char v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && [(id)__LSDefaultsGetSharedInstance() isServer])
  {
    uint64_t v11 = (id *)-[_LSBundleIDValidationToken initWithBundleIdentifier:]( objc_alloc(&OBJC_CLASS____LSBundleIDValidationToken),  v8);
    -[_LSValidationToken setOwner:](v11, self);
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  id v12 = -[_LSDiskUsage _initWithBundleIdentifier:alreadyKnownUsage:validationToken:]( objc_alloc(&OBJC_CLASS____LSDiskUsage),  "_initWithBundleIdentifier:alreadyKnownUsage:validationToken:",  v8,  v10,  v11);

  return v12;
}

- (void)_LSRecord_resolve_driverExtensionPaths
{
  id v2 = -[LSApplicationRecord driverExtensionPaths](self, "driverExtensionPaths");
}

- (NSArray)driverExtensionPaths
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_driverExtensionPathsWithContext_tableID_unitID_unitBytes_);
}

- (id)driverExtensionPathsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return _LSDatabaseGetStringArray(a3->db);
}

- (void)_LSRecord_resolve_equivalentBundleIdentifiers
{
  id v2 = -[LSApplicationRecord equivalentBundleIdentifiers](self, "equivalentBundleIdentifiers");
}

- (NSArray)equivalentBundleIdentifiers
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_equivalentBundleIdentifiersWithContext_tableID_unitID_unitBytes_);
}

- (id)equivalentBundleIdentifiersWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return _LSDatabaseGetStringArray(a3->db);
}

- (void)_LSRecord_resolve_exactBundleVersion
{
  id v2 = -[LSApplicationRecord exactBundleVersion](self, "exactBundleVersion");
}

- (void)_LSRecord_resolve_externalAccessoryProtocols
{
  id v2 = -[LSApplicationRecord externalAccessoryProtocols](self, "externalAccessoryProtocols");
}

- (NSArray)externalAccessoryProtocols
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_externalAccessoryProtocolsWithContext_tableID_unitID_unitBytes_);
}

- (id)externalAccessoryProtocolsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  if ((a6->_bundleFlags & 0x800000000000LL) == 0
    || (-[LSBundleRecord infoDictionary](self, "infoDictionary", a3, *(void *)&a4, *(void *)&a5),
        unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = objc_opt_class(),
        [v6 objectForKey:@"UISupportedExternalAccessoryProtocols" ofClass:v7 valuesOfClass:objc_opt_class()],  id v8 = (void *)objc_claimAutoreleasedReturnValue(),  v6,  !v8))
  {
    id v8 = (void *)MEMORY[0x189604A58];
  }

  return v8;
}

- (void)_LSRecord_resolve_iTunesMetadata
{
  id v2 = -[LSApplicationRecord iTunesMetadata](self, "iTunesMetadata");
}

- (LSiTunesMetadata)iTunesMetadata
{
  return (LSiTunesMetadata *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_iTunesMetadataWithContext_tableID_unitID_unitBytes_);
}

- (id)iTunesMetadataWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return  -[LSiTunesMetadata _initWithContext:bundleData:]( objc_alloc(&OBJC_CLASS___LSiTunesMetadata),  "_initWithContext:bundleData:",  a3,  a6);
}

- (void)_LSRecord_resolve_iconDictionary
{
  id v2 = -[LSApplicationRecord iconDictionary](self, "iconDictionary");
}

- (NSDictionary)iconDictionary
{
  return (NSDictionary *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_iconDictionaryWithContext_tableID_unitID_unitBytes_);
}

- (id)iconDictionaryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  if (HIDWORD(a6->genreID))
  {
    +[_LSLazyPropertyList lazyPropertyListWithContext:unit:]( &OBJC_CLASS____LSLazyPropertyList,  "lazyPropertyListWithContext:unit:");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = (void *)_CSStringCopyCFString();
    if (!-[LSApplicationRecord supportsAlternateIconNames](self, "supportsAlternateIconNames")) {
      goto LABEL_12;
    }
    uint64_t v9 = -[LSApplicationRecord alternateIconName](self, "alternateIconName");
    char v10 = (void *)v9;
    uint64_t v11 = v9 ? (void *)v9 : v8;
    id v12 = v11;

    if (!v12) {
      goto LABEL_12;
    }
    [v7 objectForKey:@"CFBundleAlternateIcons" ofClass:objc_opt_class()];
    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = [v13 objectForKey:v12];
    uint64_t v16 = (void *)v15;
    if (v14 && v15 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      uint64_t v16 = 0LL;
    }

    if (!v16)
    {
LABEL_12:
      [v7 objectForKey:@"CFBundlePrimaryIcon" ofClass:objc_opt_class()];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    }

    [v7 objectForKey:@"ISGraphicIconConfiguration" ofClass:objc_opt_class()];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_super v18 = (void *)objc_opt_new();
      [v18 setObject:v17 forKey:@"ISGraphicIconConfiguration"];
      if (v16)
      {
        [v18 addEntriesFromDictionary:v16];
        uint64_t v19 = [MEMORY[0x189603F68] dictionaryWithDictionary:v18];

        uint64_t v16 = (void *)v19;
      }

      else
      {
        [MEMORY[0x189603F68] dictionaryWithDictionary:v18];
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }

  else
  {
    uint64_t v16 = 0LL;
  }

  return v16;
}

- (void)_LSRecord_resolve_installSessionIdentifier
{
  id v2 = -[LSApplicationRecord installSessionIdentifier](self, "installSessionIdentifier");
}

- (NSData)installSessionIdentifier
{
  return (NSData *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_installSessionIdentifierWithContext_tableID_unitID_unitBytes_);
}

- (id)installSessionIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSData() & 1) == 0)
  {

    unint64_t v6 = 0LL;
  }

  return v6;
}

- (unint64_t)installType
{
  return __LSRECORD_GETTER__<unsigned long>(self, (LSRecord *)a2, sel_installTypeWithContext_tableID_unitID_unitBytes_);
}

- (unint64_t)installTypeWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return a6->bundleVersion;
}

- (BOOL)isAppStoreVendable
{
  return __LSRECORD_GETTER__<BOOL>(self, (LSRecord *)a2, sel_isAppStoreVendableWithContext_tableID_unitID_unitBytes_);
}

- (BOOL)isAppStoreVendableWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  id v8 = (void *)_CSStringCopyCFString();
  if ([v8 isEqualToString:@"System"])
  {
    LOBYTE(self) = _LSFindBundleWithInfo( a3,  7uLL,  -[LSBundleRecord bundleIdentifier](self, "bundleIdentifier"),  0,  0LL,  0LL,  0LL) != 0;
  }

  else
  {
    -[LSApplicationRecord iTunesMetadata](self, "iTunesMetadata");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v9 storeItemIdentifier]
      && (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") & 0x8000001200000LL) == 0)
    {
      LODWORD(self) = !-[LSBundleRecord isProfileValidated](self, "isProfileValidated");
    }

    else
    {
      LOBYTE(self) = 0;
    }
  }

  return (char)self;
}

- (BOOL)isDeletable
{
  return __LSRECORD_GETTER__<BOOL>(self, (LSRecord *)a2, sel_isDeletableWithContext_tableID_unitID_unitBytes_);
}

- (BOOL)isDeletableWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  unint64_t v6 = *(void *)(&a6->_clas + 1);
  if ((v6 & 0x10000000000LL) == 0) {
    return 0;
  }
  uint64_t v8 = (v6 >> 40) & 1;
  int installFailureReason_high = HIDWORD(a6->installFailureReason);
  if (installFailureReason_high
    && _LSDatabaseGetStringForCFString(a3->db, @"System", 0) == installFailureReason_high)
  {
    +[LSApplicationRestrictionsManager sharedInstance]();
    char v10 = (void *)objc_claimAutoreleasedReturnValue();
    int v11 = -[LSApplicationRestrictionsManager isSystemAppDeletionEnabled]((uint64_t)v10);
    unint64_t v12 = (v6 & 0x10000000000LL) >> 40;

    if (v11) {
      LODWORD(v8) = v12;
    }
    else {
      LODWORD(v8) = 0;
    }
  }

  return (_DWORD)v8 != 0;
}

- (BOOL)isDeletableSystemApplication
{
  return __LSRECORD_GETTER__<BOOL>( self,  (LSRecord *)a2,  sel_isDeletableSystemApplicationWithContext_tableID_unitID_unitBytes_);
}

- (BOOL)isDeletableSystemApplicationWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return (a6->_bundleFlags & 0x100) != 0
      && (int installFailureReason_high = HIDWORD(a6->installFailureReason)) != 0
      && _LSDatabaseGetStringForCFString(a3->db, @"System", 0) == installFailureReason_high;
}

- (BOOL)isSystemPlaceholder
{
  return __LSRECORD_GETTER__<BOOL>(self, (LSRecord *)a2, sel_isSystemPlaceholderWithContext_tableID_unitID_unitBytes_);
}

- (BOOL)isSystemPlaceholderWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return a6->_clas == 14;
}

- (void)_LSRecord_resolve_managementDomain
{
  id v2 = -[LSApplicationRecord managementDomain](self, "managementDomain");
}

- (NSString)managementDomain
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_managementDomainWithContext_tableID_unitID_unitBytes_);
}

- (id)managementDomainWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  unint64_t v6 = (__CFString *)_CSStringCopyCFString();
  if (!v6) {
    unint64_t v6 = @"default";
  }
  return v6;
}

- (void)_LSRecord_resolve_maximumSystemVersion
{
  id v2 = -[LSApplicationRecord maximumSystemVersion](self, "maximumSystemVersion");
}

- (NSString)maximumSystemVersion
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_maximumSystemVersionWithContext_tableID_unitID_unitBytes_);
}

- (id)maximumSystemVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  __int128 v6 = *(_OWORD *)&a6->_maxSystemVersion._opaque[8];
  v8[0] = *(_OWORD *)&a6->_minSystemVersion._opaque[24];
  v8[1] = v6;
  _LSVersionNumberGetStringRepresentation(v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_LSRecord_resolve_minimumSystemVersion
{
  id v2 = -[LSApplicationRecord minimumSystemVersion](self, "minimumSystemVersion");
}

- (NSString)minimumSystemVersion
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_minimumSystemVersionWithContext_tableID_unitID_unitBytes_);
}

- (id)minimumSystemVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  __int128 v6 = *(_OWORD *)&a6->_minSystemVersion._opaque[8];
  v8[0] = *(_OWORD *)&a6->_mtime;
  v8[1] = v6;
  _LSVersionNumberGetStringRepresentation(v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)placeholderFailureReason
{
  return __LSRECORD_GETTER__<unsigned long>( self,  (LSRecord *)a2,  sel_placeholderFailureReasonWithContext_tableID_unitID_unitBytes_);
}

- (unint64_t)placeholderFailureReasonWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return *(void *)&a6->shortVersionString;
}

- (void)_LSRecord_resolve_regulatoryPrivacyDisclosureVersion
{
  id v2 = -[LSApplicationRecord regulatoryPrivacyDisclosureVersion](self, "regulatoryPrivacyDisclosureVersion");
}

- (NSString)regulatoryPrivacyDisclosureVersion
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_regulatoryPrivacyDisclosureVersionWithContext_tableID_unitID_unitBytes_);
}

- (id)regulatoryPrivacyDisclosureVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  __int128 v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKey:@"NSRegulatoryPrivacyDisclosure" ofClass:objc_opt_class()];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  [v7 objectForKey:@"NSRegulatoryPrivacyDisclosureVersion"];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_LSRecord_resolve_requiredDeviceCapabilities
{
  id v2 = -[LSApplicationRecord requiredDeviceCapabilities](self, "requiredDeviceCapabilities");
}

- (NSDictionary)requiredDeviceCapabilities
{
  return (NSDictionary *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_requiredDeviceCapabilitiesWithContext_tableID_unitID_unitBytes_);
}

- (id)requiredDeviceCapabilitiesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if ((a6->_bundleFlags & 0x200000000000LL) == 0) {
    return MEMORY[0x189604A60];
  }
  -[LSBundleRecord infoDictionary](self, "infoDictionary", a3, *(void *)&a4, *(void *)&a5);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = objc_opt_class();
  [v8 objectForKey:@"UIRequiredDeviceCapabilities" ofClass:v9 valuesOfClass:objc_opt_class()];
  char v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10) {
    return v10;
  }
  -[LSBundleRecord infoDictionary](self, "infoDictionary");
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = objc_opt_class();
  [v11 objectForKey:@"UIRequiredDeviceCapabilities" ofClass:v12 valuesOfClass:objc_opt_class()];
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13) {
    return MEMORY[0x189604A60];
  }
  uint64_t v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FC8]), "initWithCapacity:", objc_msgSend(v13, "count"));
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v15 = v13;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v21;
    uint64_t v18 = MEMORY[0x189604A88];
    do
    {
      for (uint64_t i = 0LL; i != v16; ++i)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v15);
        }
        [v14 setObject:v18 forKeyedSubscript:*(void *)(*((void *)&v20 + 1) + 8 * i)];
      }

      uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v16);
  }

  char v10 = (void *)[v14 copy];
  if (v10) {
    return v10;
  }
  else {
    return MEMORY[0x189604A60];
  }
}

- (void)_LSRecord_resolve_shortVersionString
{
  id v2 = -[LSApplicationRecord shortVersionString](self, "shortVersionString");
}

- (NSString)shortVersionString
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_shortVersionStringWithContext_tableID_unitID_unitBytes_);
}

- (id)shortVersionStringWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return (id)_CSStringCopyCFString();
}

- (void)_LSRecord_resolve_stashedAppMetadata
{
  id v2 = -[LSApplicationRecord stashedAppMetadata](self, "stashedAppMetadata");
}

- (LSStashedAppMetadata)stashedAppMetadata
{
  return (LSStashedAppMetadata *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_stashedAppMetadataWithContext_tableID_unitID_unitBytes_);
}

- (id)stashedAppMetadataWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  if (a6->bundlePersonaTypes) {
    __int128 v6 = -[LSStashedAppMetadata initWithContext:unitID:]( objc_alloc(&OBJC_CLASS___LSStashedAppMetadata),  "initWithContext:unitID:",  a3,  a6->bundlePersonaTypes);
  }
  else {
    __int128 v6 = 0LL;
  }
  return v6;
}

- (void)_LSRecord_resolve_staticShortcutItems
{
  id v2 = -[LSApplicationRecord staticShortcutItems](self, "staticShortcutItems");
}

- (NSArray)staticShortcutItems
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_staticShortcutItemsWithContext_tableID_unitID_unitBytes_);
}

- (id)staticShortcutItemsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  __int128 v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = [v6 objectForKey:@"UIApplicationShortcutItems" ofClass:v7 valuesOfClass:objc_opt_class()];

  if (v8) {
    uint64_t v9 = (void *)v8;
  }
  else {
    uint64_t v9 = (void *)MEMORY[0x189604A58];
  }
  return v9;
}

- (void)_LSRecord_resolve_supportedGameControllers
{
  id v2 = -[LSApplicationRecord supportedGameControllers](self, "supportedGameControllers");
}

- (NSArray)supportedGameControllers
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_supportedGameControllersWithContext_tableID_unitID_unitBytes_);
}

- (id)supportedGameControllersWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  id v6 = objc_alloc_init(MEMORY[0x189603FA8]);
  uint64_t v9 = MEMORY[0x1895F87A8];
  id v10 = v6;
  _CSArrayEnumerateAllValues();
  uint64_t v7 = (void *)objc_msgSend( v10,  "copy",  v9,  3221225472,  __93__LSApplicationRecord_GameKit__supportedGameControllersWithContext_tableID_unitID_unitBytes___block_invoke,  &unk_189D72A38);

  return v7;
}

- (void)_LSRecord_resolve_typeForInstallMachinery
{
  id v2 = -[LSApplicationRecord typeForInstallMachinery](self, "typeForInstallMachinery");
}

- (NSString)typeForInstallMachinery
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_typeForInstallMachineryWithContext_tableID_unitID_unitBytes_);
}

- (id)typeForInstallMachineryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return (id)_CSStringCopyCFString();
}

- (void)_LSRecord_resolve_uniqueInstallIdentifier
{
  id v2 = -[LSApplicationRecord uniqueInstallIdentifier](self, "uniqueInstallIdentifier");
}

- (NSData)uniqueInstallIdentifier
{
  return (NSData *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_uniqueInstallIdentifierWithContext_tableID_unitID_unitBytes_);
}

- (id)uniqueInstallIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSData() & 1) == 0)
  {

    id v6 = 0LL;
  }

  return v6;
}

- (void)_LSRecord_resolve_userActivityTypes
{
  id v2 = -[LSApplicationRecord userActivityTypes](self, "userActivityTypes");
}

- (NSSet)userActivityTypes
{
  return (NSSet *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_userActivityTypesWithContext_tableID_unitID_unitBytes_);
}

- (id)userActivityTypesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6) {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x189604010]) initWithArray:v6];
  }
  else {
    uint64_t v7 = 0LL;
  }

  return v7;
}

- (id)_persistentIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___LSApplicationRecord;
  -[LSRecord _persistentIdentifierWithContext:tableID:unitID:unitBytes:]( &v11,  sel__persistentIdentifierWithContext_tableID_unitID_unitBytes_,  a3,  *(void *)&a4,  *(void *)&a5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = (void *)[v7 mutableCopy];

  [v8 appendBytes:(char *)a6 + 264 length:8];
  uint64_t v9 = (void *)[v8 copy];

  return v9;
}

- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___LSApplicationRecord;
  -[LSBundleRecord _detachFromContext:tableID:unitID:unitBytes:]( &v29,  sel__detachFromContext_tableID_unitID_unitBytes_,  a3,  *(void *)&a4,  *(void *)&a5,  a6);
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  -[LSRecord _resolvedPropertyValueForGetter:]( self,  "_resolvedPropertyValueForGetter:",  sel_applicationExtensionRecords);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v26;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * v10++) detach];
      }

      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }

    while (v8);
  }

  -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel__rawEnvironmentVariables);
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = v11;
  if (v11) {
    [v11 detach];
  }

  -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel__localizedNamesWithContext);
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = v13;
  if (v13) {
    [v13 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_162];
  }

  -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel_supportedGameControllers);
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = v15;
  if (v15)
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v17 = v15;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v21 objects:v30 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v22;
      do
      {
        uint64_t v20 = 0LL;
        do
        {
          if (*(void *)v22 != v19) {
            objc_enumerationMutation(v17);
          }
          objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v20++), "detach", (void)v21);
        }

        while (v18 != v20);
        uint64_t v18 = [v17 countByEnumeratingWithState:&v21 objects:v30 count:16];
      }

      while (v18);
    }
  }
}

- (NSArray)identities
{
  v15[1] = *MEMORY[0x1895F89C0];
  -[LSApplicationRecord _personasWithAttributes](self, "_personasWithAttributes");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v3 count])
  {
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    void v13[2] = __45__LSApplicationRecord_Identities__identities__block_invoke;
    v13[3] = &unk_189D72A80;
    v13[4] = self;
    XNSArrayByMappingBlock(v3, v13);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else if (([(id)__LSDefaultsGetSharedInstance() isInEducationMode] & 1) != 0 {
         || ([(id)__LSDefaultsGetSharedInstance() isUsingEphemeralStorage] & 1) != 0)
  }
  {
    id v5 = -[LSApplicationIdentity initForRecord:personaWithAttributes:]( objc_alloc(&OBJC_CLASS___LSApplicationIdentity),  "initForRecord:personaWithAttributes:",  self,  0LL);
    id v14 = v5;
    [MEMORY[0x189603F18] arrayWithObjects:&v14 count:1];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    _LSDefaultLog();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[LSApplicationRecord(Identities) identities].cold.1(v6);
    }

    +[LSApplicationRecord personalPersonaAttributes](&OBJC_CLASS___LSApplicationRecord, "personalPersonaAttributes");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 userPersonaUniqueString];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v9 = objc_alloc(&OBJC_CLASS___LSApplicationIdentity);
    uint64_t v10 = -[_LSPersonaWithAttributes initWithPersonaType:personaUniqueString:]( objc_alloc(&OBJC_CLASS____LSPersonaWithAttributes),  1LL,  v8);
    id v11 = -[LSApplicationIdentity initForRecord:personaWithAttributes:]( v9,  "initForRecord:personaWithAttributes:",  self,  v10);
    v15[0] = v11;
    [MEMORY[0x189603F18] arrayWithObjects:v15 count:1];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSArray *)v4;
}

id __45__LSApplicationRecord_Identities__identities__block_invoke(uint64_t a1, uint64_t a2)
{
  return  -[LSApplicationIdentity initForRecord:personaWithAttributes:]( objc_alloc(&OBJC_CLASS___LSApplicationIdentity),  "initForRecord:personaWithAttributes:",  *(void *)(a1 + 32),  a2);
}

- (NSString)jobLabel
{
  if ((-[LSApplicationRecord _rawPlistFlags](self, "_rawPlistFlags") & 0x80) != 0)
  {
    -[LSBundleRecord infoDictionary](self, "infoDictionary");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKey:@"LSLaunchDLabel" ofClass:objc_opt_class()];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  return (NSString *)v3;
}

- (BOOL)_containerized
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 38) & 1;
}

- (BOOL)_usesSystemPersona
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 56) & 1;
}

- (BOOL)isBeta
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 21) & 1;
}

- (NSDictionary)additionalEnvironmentVariables
{
  if (!-[LSBundleRecord isRedacted](self, "isRedacted")) {
    goto LABEL_4;
  }
  id v20 = 0LL;
  BOOL v3 = -[LSBundleRecord unredactWithError:](self, "unredactWithError:", &v20);
  id v4 = v20;
  id v5 = v4;
  if (v3)
  {

LABEL_4:
    char v6 = [(id)__LSDefaultsGetSharedInstance() isInEducationMode];
    BOOL v19 = 0;
    -[LSApplicationRecord _personasWithAttributes](self, "_personasWithAttributes");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    _LSShouldFetchContainersFromContainermanagerForPersona( v7,  -[LSApplicationRecord _usesSystemPersona](self, "_usesSystemPersona"),  &v19);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v6 & 1) != 0)
    {
      BOOL v9 = 1;
    }

    else if (v8)
    {
      _LSDefaultLog();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[LSApplicationRecord additionalEnvironmentVariables].cold.1((uint64_t)v8, v10);
      }

      BOOL v9 = 0;
    }

    else
    {
      BOOL v9 = v19;
    }

    unsigned int active_platform = dyld_get_active_platform();
    if (v9)
    {
      unsigned int v14 = active_platform;
      -[LSBundleRecord bundleIdentifier](self, "bundleIdentifier");
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = _LSCopyEnvironmentVariablesFromContainermanager( v15,  (void *)-[LSApplicationRecord _containerClass](self, "_containerClass"),  v14);
    }

    else
    {
      -[LSApplicationRecord _rawEnvironmentVariables](self, "_rawEnvironmentVariables");
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_LSLazyPropertyList propertyList](v17);
      id v15 = (void *)objc_claimAutoreleasedReturnValue();

      uint64_t v16 = (uint64_t)_LSCopyRationalizedEnvironmentVariablesDict(v15);
    }

    uint64_t v18 = (void *)v16;

    return (NSDictionary *)v18;
  }

  _LSDefaultLog();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
    -[LSApplicationRecord additionalEnvironmentVariables].cold.2((uint64_t)self);
  }

  return (NSDictionary *)0LL;
}

- (BOOL)supportsMultiwindow
{
  int base_platform = dyld_get_base_platform();
  if ((base_platform - 2) < 2)
  {
LABEL_4:
    -[LSBundleRecord infoDictionary](self, "infoDictionary");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKey:@"UIApplicationSceneManifest" ofClass:objc_opt_class()];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      [v5 objectForKeyedSubscript:@"UIApplicationSupportsMultipleScenes"];
      char v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        char v7 = [v6 BOOLValue];
LABEL_17:

        return v7;
      }
    }

    else
    {
      -[LSBundleRecord infoDictionary](self, "infoDictionary");
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 objectForKey:@"UIApplicationInterfaceManifest" ofClass:objc_opt_class()];
      char v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        [v6 objectForKeyedSubscript:@"UIApplicationSupportsMultiwindow"];
        BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9 && (objc_opt_respondsToSelector() & 1) != 0) {
          char v7 = [v9 BOOLValue];
        }
        else {
          char v7 = 0;
        }

        goto LABEL_17;
      }
    }

    char v7 = 0;
    goto LABEL_17;
  }

  if (base_platform == 1) {
    return 1;
  }
  if (base_platform == 11) {
    goto LABEL_4;
  }
  return 0;
}

- (id)_initWithNode:(id)a3 bundleIdentifier:(id)a4 placeholderBehavior:(int64_t)a5 systemPlaceholder:(BOOL)a6 itemID:(unint64_t)a7 forceInBundleContainer:(BOOL)a8 context:(LSContext *)a9 error:(id *)a10
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  if (_LSLogAppRecordInitsForDataSeparation::onceToken != -1) {
    dispatch_once(&_LSLogAppRecordInitsForDataSeparation::onceToken, &__block_literal_global_3);
  }
  if (_LSLogAppRecordInitsForDataSeparation::result)
  {
    _LSDataSeparationLog();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = a3;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = a4;
      *(_WORD *)&buf[22] = 2048;
      unint64_t v46 = a7;
      _os_log_impl( &dword_183E58000,  v17,  OS_LOG_TYPE_INFO,  "application record search init. Node: %@ bundleID: %@ itemID: %llu",  buf,  0x20u);
    }
  }

  p_db = (void **)&a9->db;
  if (!a9) {
    p_db = (void **)_LSDatabaseContextGetCurrentContext(0LL);
  }
  v39 = p_db;
  id v40 = 0LL;
  char v41 = 0;
  id v42 = 0LL;
  +[_LSDServiceDomain defaultServiceDomain]();
  BOOL v19 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  id v20 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v39, v19, 0LL);

  if (v20)
  {
    uint64_t v35 = 0LL;
    v36 = &v35;
    uint64_t v37 = 0x2020000000LL;
    int v38 = 0;
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    unint64_t v46 = (unint64_t)__Block_byref_object_copy__93;
    v47 = __Block_byref_object_dispose__94;
    id v48 = 0LL;
    v32[0] = MEMORY[0x1895F87A8];
    v32[1] = 3221225472LL;
    v32[2] = __136__LSApplicationRecord__initWithNode_bundleIdentifier_placeholderBehavior_systemPlaceholder_itemID_forceInBundleContainer_context_error___block_invoke;
    v32[3] = &unk_189D72700;
    BOOL v33 = a6;
    v32[4] = a4;
    v32[5] = a3;
    v32[8] = v20;
    v32[9] = a7;
    v32[6] = &v35;
    v32[7] = buf;
    v32[10] = a5;
    BOOL v34 = a8;
    __LSRECORD_IS_PERFORMING_IO_FOR_A_CALLER__((uint64_t)v32);
    if (a10) {
      *a10 = *(id *)(*(void *)&buf[8] + 40LL);
    }
    int v21 = *((_DWORD *)v36 + 6);
    if (v21)
    {
      uint64_t v22 = _LSBundleGet(*v20, v21);
      if (v22)
      {
        id v23 = -[LSApplicationRecord _initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:]( self,  "_initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:",  a3,  a4,  v20,  *((unsigned int *)*v20 + 5),  *((unsigned int *)v36 + 6),  v22,  a10);
LABEL_21:
        _Block_object_dispose(buf, 8);

        _Block_object_dispose(&v35, 8);
        goto LABEL_25;
      }

      if (a10)
      {
        uint64_t v43 = *MEMORY[0x189607490];
        v44 = @"Unable to find this application record in the Launch Services database.";
        [MEMORY[0x189603F68] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();
        _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -10814LL,  (uint64_t)"-[LSApplicationRecord _initWithNode:bundleIdentifier:placeholderBehavior:systemPlaceholder:itemID:for ceInBundleContainer:context:error:]",  1160LL,  v27);
        *a10 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

    id v23 = 0LL;
    goto LABEL_21;
  }

  if (a10)
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    __int128 v24 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v39, v24, 0LL);

    if (v25) {
      id v26 = 0LL;
    }
    else {
      id v26 = v42;
    }
    *a10 = v26;
  }

  id v23 = 0LL;
LABEL_25:
  id v28 = v23;
  if (v39 && v41) {
    _LSContextDestroy(v39);
  }
  id v29 = v40;
  v39 = 0LL;
  id v40 = 0LL;

  char v41 = 0;
  id v30 = v42;
  id v42 = 0LL;

  return v28;
}

- (id)_compatibilityObjectWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  uint64_t v6 = *(void *)&a5;
  BOOL v9 = objc_alloc(&OBJC_CLASS___LSApplicationProxy);
  -[LSBundleRecord bundleIdentifier](self, "bundleIdentifier");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = -[LSApplicationProxy _initWithContext:bundleUnit:applicationRecord:bundleID:resolveAndDetach:]( v9,  "_initWithContext:bundleUnit:applicationRecord:bundleID:resolveAndDetach:",  a3,  v6,  self,  v10,  0LL);

  return v11;
}

- (LSApplicationRecord)initWithURL:(id)a3 allowPlaceholder:(BOOL)a4 error:(id *)a5
{
  return -[LSApplicationRecord initWithURL:fetchingPlaceholder:error:]( self,  "initWithURL:fetchingPlaceholder:error:",  a3,  a4,  a5);
}

- (LSApplicationRecord)initWithURL:(id)a3 fetchingPlaceholder:(int64_t)a4 error:(id *)a5
{
  uint64_t v8 = -[FSNode initWithURL:flags:error:](objc_alloc(&OBJC_CLASS___FSNode), "initWithURL:flags:error:", a3, 0LL, 0LL);
  BOOL v9 = -[LSApplicationRecord _initWithNode:bundleIdentifier:placeholderBehavior:systemPlaceholder:itemID:forceInBundleContainer:context:error:]( self,  "_initWithNode:bundleIdentifier:placeholderBehavior:systemPlaceholder:itemID:forceInBundleContainer:context:error:",  v8,  0LL,  a4,  0LL,  0LL,  0LL,  0LL,  a5);

  return v9;
}

- (LSApplicationRecord)initWithBundleIdentifier:(id)a3 allowPlaceholder:(BOOL)a4 error:(id *)a5
{
  return -[LSApplicationRecord initWithBundleIdentifier:fetchingPlaceholder:error:]( self,  "initWithBundleIdentifier:fetchingPlaceholder:error:",  a3,  a4,  a5);
}

- (LSApplicationRecord)initWithBundleIdentifier:(id)a3 fetchingPlaceholder:(int64_t)a4 error:(id *)a5
{
  return (LSApplicationRecord *)-[LSApplicationRecord _initWithNode:bundleIdentifier:placeholderBehavior:systemPlaceholder:itemID:forceInBundleContainer:context:error:]( self,  "_initWithNode:bundleIdentifier:placeholderBehavior:systemPlaceholder:itemID:forceInBun dleContainer:context:error:",  0LL,  a3,  a4,  0LL,  0LL,  0LL,  0LL,  a5);
}

- (LSApplicationRecord)initWithBundleIdentifierOfSystemPlaceholder:(id)a3 error:(id *)a4
{
  return (LSApplicationRecord *)-[LSApplicationRecord _initWithNode:bundleIdentifier:placeholderBehavior:systemPlaceholder:itemID:forceInBundleContainer:context:error:]( self,  "_initWithNode:bundleIdentifier:placeholderBehavior:systemPlaceholder:itemID:forceInBun dleContainer:context:error:",  0LL,  a3,  0LL,  1LL,  0LL,  0LL,  0LL,  a4);
}

- (LSApplicationRecord)initWithRemotePlaceholderBundleIdentifier:(id)a3 error:(id *)a4
{
  return -[LSApplicationRecord initWithBundleIdentifier:fetchingPlaceholder:error:]( self,  "initWithBundleIdentifier:fetchingPlaceholder:error:",  a3,  4LL,  a4);
}

- (LSApplicationRecord)initWithStoreItemIdentifier:(unint64_t)a3 error:(id *)a4
{
  v8[1] = *MEMORY[0x1895F89C0];
  if (a3) {
    return (LSApplicationRecord *)-[LSApplicationRecord _initWithNode:bundleIdentifier:placeholderBehavior:systemPlaceholder:itemID:forceInBundleContainer:context:error:]( self,  "_initWithNode:bundleIdentifier:placeholderBehavior:systemPlaceholder:itemID:forceInB undleContainer:context:error:",  0LL,  0LL,  0LL,  1LL,  a3,  0LL,  0LL,  a4);
  }

  if (a4)
  {
    uint64_t v7 = *MEMORY[0x189607490];
    v8[0] = @"Item ID 0 never exists.";
    [MEMORY[0x189603F68] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[LSApplicationRecord initWithStoreItemIdentifier:error:]",  137LL,  v6);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (id)extensionPointRecordForIdentifier:(id)a3 platform:(unsigned int)a4 error:(id *)a5
{
  return  -[LSExtensionPointRecord initWithIdentifier:platform:parentAppRecord:error:]( objc_alloc(&OBJC_CLASS___LSExtensionPointRecord),  "initWithIdentifier:platform:parentAppRecord:error:",  a3,  *(void *)&a4,  self,  a5);
}

- (BOOL)isUpdate
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 19) & 1;
}

- (unint64_t)updateAvailability
{
  return (-[LSApplicationRecord _rawMoreFlags](self, "_rawMoreFlags") >> 3) & 1;
}

- (void)setUpdateAvailability:(unint64_t)a3 completionHandler:(id)a4
{
  v14[1] = *MEMORY[0x1895F89C0];
  -[LSBundleRecord bundleIdentifier](self, "bundleIdentifier");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    Class Class = object_getClass(self);
    unint64_t v13 = v7;
    [MEMORY[0x189607968] numberWithUnsignedInteger:a3];
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    [MEMORY[0x189603F68] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class setUpdateAvailabilityForApplicationsWithBundleIdentifiers:completionHandler:]( Class,  "setUpdateAvailabilityForApplicationsWithBundleIdentifiers:completionHandler:",  v10,  a4);
LABEL_5:

    goto LABEL_6;
  }

  if (a4)
  {
    uint64_t v11 = *MEMORY[0x189607490];
    uint64_t v12 = @"This application does not have a bundle identifier and cannot have its updateAvailability property modified.";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[LSApplicationRecord setUpdateAvailability:completionHandler:]",  266LL,  v9);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void *))a4 + 2))(a4, 0LL, v10);
    goto LABEL_5;
  }

+ (void)setUpdateAvailabilityForApplicationsWithBundleIdentifiers:(id)a3 completionHandler:(id)a4
{
  v18[1] = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    [MEMORY[0x1896077D8] currentHandler];
    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 handleFailureInMethod:a2, a1, @"LSApplicationRecord.mm", 274, @"Invalid parameter not satisfying: %@", @"updateAvailabilities != nil" object file lineNumber description];
  }

  if ([a3 count])
  {
    if (([(id)__LSDefaultsGetSharedInstance() isServer] & 1) != 0
      || ([(id)__LSDefaultsGetSharedInstance() hasServer] & 1) == 0)
    {
      _LSServer_DatabaseExecutionContext();
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1895F87A8];
      v16[1] = 3221225472LL;
      v16[2] = __99__LSApplicationRecord_setUpdateAvailabilityForApplicationsWithBundleIdentifiers_completionHandler___block_invoke;
      v16[3] = &unk_189D72568;
      v16[4] = a3;
      v16[5] = a4;
      v16[6] = a2;
      -[LSDBExecutionContext syncWrite:]((uint64_t)v9, v16);
    }

    else
    {
      uint64_t v7 = MEMORY[0x1895F87A8];
      v15[0] = (void (*)(void, void))MEMORY[0x1895F87A8];
      v15[1] = (void (*)(void, void))3221225472LL;
      void v15[2] = (void (*)(void, void))__99__LSApplicationRecord_setUpdateAvailabilityForApplicationsWithBundleIdentifiers_completionHandler___block_invoke_33;
      v15[3] = (void (*)(void, void))&unk_189D72590;
      v15[4] = (void (*)(void, void))a4;
      +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDModifyService, v15);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v7;
      v14[1] = 3221225472LL;
      void v14[2] = __99__LSApplicationRecord_setUpdateAvailabilityForApplicationsWithBundleIdentifiers_completionHandler___block_invoke_2;
      v14[3] = &unk_189D725B8;
      v14[4] = a4;
      [v8 setUpdateAvailabilities:a3 completionHandler:v14];
    }
  }

  else if (a4)
  {
    uint64_t v17 = *MEMORY[0x189607490];
    v18[0] = @"updateAvailabilities";
    [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"+[LSApplicationRecord setUpdateAvailabilityForApplicationsWithBundleIdentifiers:completionHandler:]",  366LL,  v10);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void *))a4 + 2))(a4, 0LL, v11);
  }

void __99__LSApplicationRecord_setUpdateAvailabilityForApplicationsWithBundleIdentifiers_completionHandler___block_invoke( uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  id v35 = 0LL;
  uint64_t v32 = 0LL;
  id v33 = 0LL;
  char v34 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  id v2 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v32, v2, 0LL);

  if (v3)
  {
    unint64_t v4 = [*(id *)(a1 + 32) count];
    uint64_t v24 = 0LL;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x5812000000LL;
    __int128 v27 = __Block_byref_object_copy__2;
    id v28 = __Block_byref_object_dispose__2;
    memset(v29, 0, sizeof(v29));
    uint64_t v30 = 0LL;
    int v31 = 1065353216;
    std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::__rehash<true>( (uint64_t)v29 + 8,  (unint64_t)(float)v4);
    v23[0] = MEMORY[0x1895F87A8];
    v23[1] = 3221225472LL;
    v23[2] = __99__LSApplicationRecord_setUpdateAvailabilityForApplicationsWithBundleIdentifiers_completionHandler___block_invoke_29;
    v23[3] = &unk_189D72540;
    v23[5] = &v24;
    v23[6] = v3;
    id v5 = *(void **)(a1 + 32);
    v23[4] = *(void *)(a1 + 40);
    uint64_t v6 = [v5 enumerateKeysAndObjectsUsingBlock:v23];
    if (v25[9] == v4)
    {
      uint64_t v7 = v25 + 8;
      while (1)
      {
        uint64_t v7 = (void *)*v7;
        if (!v7) {
          break;
        }
        uint64_t v8 = *((unsigned int *)v7 + 4);
        unint64_t v9 = v7[3];
        uint64_t v10 = (void *)MEMORY[0x186E2A59C](v6);
        if (_LSBundleGet(*v3, v8))
        {
          if (v9 > 1)
          {
            _LSDefaultLog();
            uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              Name = sel_getName(*(SEL *)(a1 + 48));
              *(_DWORD *)buf = 136446722;
              uint64_t v37 = Name;
              __int16 v38 = 2048;
              uint64_t v39 = v8;
              __int16 v40 = 1024;
              LODWORD(v41) = v9;
              _os_log_error_impl( &dword_183E58000,  v12,  OS_LOG_TYPE_ERROR,  "%{public}s: Caller told us to set the update availability of bundle 0x%llx to invalid value %u. Ignoring.",  buf,  0x1Cu);
            }
          }

          if (!_CSStoreWriteToUnit())
          {
            _LSDefaultLog();
            unint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              id v15 = sel_getName(*(SEL *)(a1 + 48));
              *(_DWORD *)buf = 136446722;
              uint64_t v37 = v15;
              __int16 v38 = 2048;
              uint64_t v39 = v8;
              __int16 v40 = 2112;
              uint64_t v41 = 0LL;
              _os_log_error_impl( &dword_183E58000,  v13,  OS_LOG_TYPE_ERROR,  "%{public}s: Failed to write to bundle 0x%llx, ignoring: %@",  buf,  0x20u);
            }
          }
        }

        else
        {
          _LSDefaultLog();
          uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            unsigned int v14 = sel_getName(*(SEL *)(a1 + 48));
            *(_DWORD *)buf = 136446466;
            uint64_t v37 = v14;
            __int16 v38 = 2048;
            uint64_t v39 = v8;
            _os_log_error_impl( &dword_183E58000,  v11,  OS_LOG_TYPE_ERROR,  "%{public}s: While enumerating bundles, lost track of bundle 0x%llx. Ignoring.",  buf,  0x16u);
          }
        }

        objc_autoreleasePoolPop(v10);
      }

      _LSDatabaseCommit((uint64_t)*v3);
      _LSArmSaveTimer(1);
      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    }

    _Block_object_dispose(&v24, 8);
    std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>>>::~__hash_table((uint64_t)v29 + 8);
  }

  else
  {
    uint64_t v17 = *(void *)(a1 + 40);
    +[_LSDServiceDomain defaultServiceDomain]();
    uint64_t v18 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v32, v18, 0LL);

    if (v19) {
      id v20 = 0LL;
    }
    else {
      id v20 = v35;
    }
    (*(void (**)(uint64_t, void, id))(v17 + 16))(v17, 0LL, v20);
  }

  if (v32 && v34) {
    _LSContextDestroy(v32);
  }
  id v21 = v33;
  uint64_t v32 = 0LL;
  id v33 = 0LL;

  char v34 = 0;
  id v22 = v35;
  id v35 = 0LL;
}

void __99__LSApplicationRecord_setUpdateAvailabilityForApplicationsWithBundleIdentifiers_completionHandler___block_invoke_29( void *a1,  void *a2,  void *a3,  _BYTE *a4)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  unsigned int v13 = 0;
  uint64_t v7 = (LSContext *)a1[6];
  memset(v14, 0, sizeof(v14));
  int v8 = _LSBundleFindWithInfo(v7, 0LL, a2, 0, v14, 2, 0, &v13, 0LL);
  if (v8)
  {
    uint64_t v9 = a1[4];
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  v8,  (uint64_t)"+[LSApplicationRecord setUpdateAvailabilityForApplicationsWithBundleIdentifiers:completionHandler:]_block_invoke",  295LL,  0LL);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0LL, v10);

    *a4 = 1;
  }

  else
  {
    uint64_t v11 = *(void *)(a1[5] + 8LL);
    uint64_t v12 = [a3 unsignedLongLongValue];
    std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>>>::__emplace_unique_key_args<unsigned int,unsigned int &,LSApplicationRecordUpdateAvailability>( v11 + 48,  &v13,  &v13,  &v12);
  }

uint64_t __99__LSApplicationRecord_setUpdateAvailabilityForApplicationsWithBundleIdentifiers_completionHandler___block_invoke_33( uint64_t a1,  uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0LL, a2);
  }
  return result;
}

uint64_t __99__LSApplicationRecord_setUpdateAvailabilityForApplicationsWithBundleIdentifiers_completionHandler___block_invoke_2( uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)isWebAppPlaceholder
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 39) & 1;
}

- (BOOL)hasParallelPlaceholder
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 46) & 1;
}

- (BOOL)isLaunchProhibited
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 41) & 1;
}

- (BOOL)isLaunchDisabled
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 7) & 1;
}

- (BOOL)isManagedAppDistributor
{
  return (-[LSApplicationRecord _rawMoreFlags](self, "_rawMoreFlags") >> 10) & 1;
}

- (BOOL)isInstalledFromDistributorOrWeb
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 distributorInfo];
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 distributorID];
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && ([v4 isEqualToString:@"com.apple.AppStore"] & 1) == 0) {
    int v5 = [v4 isEqualToString:@"com.apple.TestFlight"] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

+ (BOOL)isAnyRegisteredApplicationInstalledFromDistributorOrWeb
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  [a1 enumeratorWithOptions:192];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
        int v8 = (void *)MEMORY[0x186E2A59C](v3);
        LOBYTE(v7) = objc_msgSend(v7, "isInstalledFromDistributorOrWeb", (void)v10);
        objc_autoreleasePoolPop(v8);
        if ((v7 & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }

        ++v6;
      }

      while (v4 != v6);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }

- (BOOL)canHandleWebAuthentication
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKey:@"com.apple.AuthenticationServices.canHandleASWebAuthenticationSessionRequest" ofClass:objc_opt_class()];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0LL;
}

void __87__LSApplicationRecord_applicationExtensionRecordsWithContext_tableID_unitID_unitBytes___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  uint64_t v5 = objc_alloc(&OBJC_CLASS___LSApplicationExtensionRecord);
  uint64_t v6 = *(void *)(a1 + 48);
  id v10 = 0LL;
  uint64_t v7 = -[LSApplicationExtensionRecord _initWithContext:pluginID:pluginData:error:]( v5,  "_initWithContext:pluginID:pluginData:error:",  v6,  a3,  0LL,  &v10);
  id v8 = v10;
  if (v7)
  {
    objc_storeWeak(v7 + 10, *(id *)(a1 + 32));
    [*(id *)(a1 + 40) addObject:v7];
  }

  else
  {
    _LSDefaultLog();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __87__LSApplicationRecord_applicationExtensionRecordsWithContext_tableID_unitID_unitBytes___block_invoke_cold_1( a3,  (uint64_t)v8,  v9);
    }
  }
}

- (BOOL)isArcadeApp
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 59) & 1;
}

- (BOOL)supportsOnDemandResources
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 43) & 1;
}

- (BOOL)supportsAudiobooks
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 29) & 1;
}

- (NSArray)carPlayInstrumentClusterURLSchemes
{
  return (NSArray *)MEMORY[0x189604A58];
}

- (BOOL)supportsCarPlayDashboardScene
{
  return 0;
}

- (BOOL)supportsCarPlayInstrumentClusterScene
{
  return 0;
}

- (void)getDeviceManagementPolicyWithCompletionHandler:(id)a3
{
  if (!a3)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithUTF8String:"-[LSApplicationRecord getDeviceManagementPolicyWithCompletionHandler:]"];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 handleFailureInFunction:v7, @"LSApplicationRecord.mm", 760, @"Invalid parameter not satisfying: %@", @"completionHandler != nil" file lineNumber description];
  }

  -[LSBundleRecord bundleIdentifier](self, "bundleIdentifier");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  void v8[2] = __70__LSApplicationRecord_getDeviceManagementPolicyWithCompletionHandler___block_invoke;
  v8[3] = &unk_189D72608;
  v8[4] = a3;
  _LSGetDMFPolicyWithCompletionHandler((uint64_t)v5, v8);
}

uint64_t __70__LSApplicationRecord_getDeviceManagementPolicyWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (LSAppClipMetadata)appClipMetadata
{
  return 0LL;
}

- (BOOL)shouldShowSecurityPromptsOnSignIn
{
  return 0;
}

- (BOOL)isWebBrowser
{
  return 0;
}

- (BOOL)isEligibleWebBrowser
{
  return 0;
}

- (BOOL)isMailClient
{
  return 0;
}

- (BOOL)supportsSpotlightQueryContinuation
{
  return 0;
}

- (NSArray)spotlightActions
{
  return (NSArray *)[MEMORY[0x189603F18] array];
}

- (BOOL)requiresNativeExecution
{
  return 0;
}

- (BOOL)isSwiftPlaygroundsApp
{
  return (-[LSApplicationRecord _rawMoreFlags](self, "_rawMoreFlags") >> 4) & 1;
}

- (LSApplicationRecord)linkedParentApplication
{
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  uint64_t v24 = __Block_byref_object_copy__93;
  uint64_t v25 = __Block_byref_object_dispose__94;
  id v26 = 0LL;
  -[LSApplicationRecord _linkedParentApplicationBundleID](self, "_linkedParentApplicationBundleID");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v18 = 0LL;
    v19[0] = &v18;
    v19[1] = 0x3032000000LL;
    v19[2] = __Block_byref_object_copy__93;
    v19[3] = __Block_byref_object_dispose__94;
    id v20 = 0LL;
    uint64_t v5 = MEMORY[0x1895F87A8];
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    _OWORD v14[2] = __46__LSApplicationRecord_linkedParentApplication__block_invoke;
    v14[3] = &unk_189D72630;
    uint64_t v16 = &v21;
    id v15 = v3;
    uint64_t v17 = &v18;
    v10[0] = v5;
    v10[1] = 3221225472LL;
    v10[2] = __46__LSApplicationRecord_linkedParentApplication__block_invoke_2;
    v10[3] = &unk_189D72658;
    __int128 v12 = &v21;
    id v6 = v15;
    id v11 = v6;
    __int128 v13 = &v18;
    -[LSRecord _ifAttached:else:](self, "_ifAttached:else:", v14, v10);
    if (!v22[5])
    {
      _LSDefaultLog();
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[LSApplicationRecord linkedParentApplication].cold.1((uint64_t)v6, (uint64_t)v19, v7);
      }
    }

    _Block_object_dispose(&v18, 8);
  }

  id v8 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return (LSApplicationRecord *)v8;
}

void __46__LSApplicationRecord_linkedParentApplication__block_invoke(void *a1, uint64_t a2)
{
  uint64_t v4 = objc_alloc(&OBJC_CLASS___LSApplicationRecord);
  uint64_t v5 = a1[4];
  id v12 = 0LL;
  uint64_t v6 = -[LSApplicationRecord _initWithNode:bundleIdentifier:placeholderBehavior:systemPlaceholder:itemID:forceInBundleContainer:context:error:]( v4,  "_initWithNode:bundleIdentifier:placeholderBehavior:systemPlaceholder:itemID:forceInBundleContainer:context:error:",  0LL,  v5,  0LL,  0LL,  0LL,  0LL,  a2,  &v12);
  id v7 = v12;
  uint64_t v8 = *(void *)(a1[5] + 8LL);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v6;

  uint64_t v10 = *(void *)(a1[6] + 8LL);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
}

void __46__LSApplicationRecord_linkedParentApplication__block_invoke_2(void *a1)
{
  id v2 = objc_alloc(&OBJC_CLASS___LSApplicationRecord);
  uint64_t v3 = a1[4];
  id v10 = 0LL;
  uint64_t v4 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:]( v2,  "initWithBundleIdentifier:allowPlaceholder:error:",  v3,  0LL,  &v10);
  id v5 = v10;
  uint64_t v6 = *(void *)(a1[5] + 8LL);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;

  uint64_t v8 = *(void *)(a1[6] + 8LL);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
}

- (BOOL)isEligibleForWatchAppInstall
{
  return 0;
}

- (BOOL)isTrustedForBinding
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") & 0x80) == 0;
}

- (id)trustedCDHashes
{
  return 0LL;
}

void __136__LSApplicationRecord__initWithNode_bundleIdentifier_placeholderBehavior_systemPlaceholder_itemID_forceInBundleContainer_context_error___block_invoke( uint64_t a1)
{
  if (*(_BYTE *)(a1 + 88))
  {
    id v2 = *(LSContext **)(a1 + 64);
    uint64_t v3 = *(void **)(a1 + 32);
    [*(id *)(a1 + 40) URL];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = *(void *)(a1 + 72);
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8LL);
    id obj = *(id *)(v6 + 40);
    int v7 = _LSFindBundleWithInfo(v2, 7uLL, v3, 0, v4, v5, &obj);
    objc_storeStrong((id *)(v6 + 40), obj);
    uint64_t v8 = a1 + 48;
LABEL_15:
    *(_DWORD *)(*(void *)(*(void *)v8 + 8LL) + 24LL) = v7;

    return;
  }

  unint64_t v9 = *(void *)(a1 + 80);
  switch(v9)
  {
    case 1uLL:
    case 3uLL:
      unint64_t v10 = 3LL;
      goto LABEL_7;
    case 2uLL:
      unint64_t v10 = 1LL;
      unint64_t v9 = 3LL;
      goto LABEL_7;
    case 4uLL:
      unint64_t v10 = 8LL;
      if (*(_BYTE *)(a1 + 89))
      {
        unint64_t v9 = 8LL;
LABEL_11:
        id v12 = @"must be in bundle container";
        id v11 = &__block_literal_global_99;
      }

      else
      {
        id v12 = @"must be remote placeholder";
        unint64_t v9 = 8LL;
        id v11 = &__block_literal_global_102;
      }

      break;
    default:
      unint64_t v9 = 1LL;
      unint64_t v10 = 1LL;
LABEL_7:
      if (*(_BYTE *)(a1 + 89)) {
        goto LABEL_11;
      }
      id v11 = 0LL;
      id v12 = 0LL;
      break;
  }

  __int128 v13 = *(LSContext **)(a1 + 64);
  unsigned int v14 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) URL];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = *(void *)(a1 + 72);
  uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id v23 = *(id *)(v17 + 40);
  LODWORD(v13) = _LSFindBundleWithInfo_NoIOFiltered(v13, v9, v14, 0, v15, v16, v12, v11, &v23);
  objc_storeStrong((id *)(v17 + 40), v23);
  uint64_t v8 = a1 + 48;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = (_DWORD)v13;

  if (v9 != v10 && !*(_DWORD *)(*(void *)(*(void *)v8 + 8LL) + 24LL))
  {
    uint64_t v18 = *(LSContext **)(a1 + 64);
    uint64_t v19 = *(void **)(a1 + 32);
    [*(id *)(a1 + 40) URL];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = *(void *)(a1 + 72);
    uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8LL);
    id v22 = *(id *)(v21 + 40);
    int v7 = _LSFindBundleWithInfo_NoIOFiltered(v18, v10, v19, 0, v4, v20, v12, v11, &v22);
    objc_storeStrong((id *)(v21 + 40), v22);
    goto LABEL_15;
  }

BOOL __136__LSApplicationRecord__initWithNode_bundleIdentifier_placeholderBehavior_systemPlaceholder_itemID_forceInBundleContainer_context_error___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  return *(_DWORD *)(a4 + 484) != 0;
}

BOOL __136__LSApplicationRecord__initWithNode_bundleIdentifier_placeholderBehavior_systemPlaceholder_itemID_forceInBundleContainer_context_error___block_invoke_3( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  return *(_DWORD *)(a4 + 160) == 16;
}

- (id)_initWithBundleIdentifier:(id)a3 placeholder:(BOOL)a4 error:(id *)a5
{
  uint64_t v5 = 3LL;
  if (!a4) {
    uint64_t v5 = 0LL;
  }
  return -[LSApplicationRecord _initWithNode:bundleIdentifier:placeholderBehavior:systemPlaceholder:itemID:forceInBundleContainer:context:error:]( self,  "_initWithNode:bundleIdentifier:placeholderBehavior:systemPlaceholder:itemID:forceInBundleContainer:context:error:",  0LL,  a3,  v5,  0LL,  0LL,  0LL,  0LL,  a5);
}

- (id)bundleVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return (id)_CSStringCopyCFString();
}

- (id)managedPersonas
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v2 count] == 1)
  {
    [v2 firstObject];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = -[_LSPersonaWithAttributes personaType]((uint64_t)v3);

    if (v4 == 1)
    {

      id v2 = (void *)MEMORY[0x189604A58];
    }
  }

  XNSArrayByMappingBlock(v2, &__block_literal_global_110);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __38__LSApplicationRecord_managedPersonas__block_invoke(uint64_t a1, uint64_t a2)
{
  return -[_LSDatabase store](a2);
}

- (id)associatedPersonas
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  XNSArrayByMappingBlock(v2, &__block_literal_global_111);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __41__LSApplicationRecord_associatedPersonas__block_invoke(uint64_t a1, uint64_t a2)
{
  return -[_LSDatabase store](a2);
}

- (unint64_t)_containerClass
{
  return 2LL;
}

void __86__LSApplicationRecord__localizedNamesWithContextWithContext_tableID_unitID_unitBytes___block_invoke( void *a1,  uint64_t a2,  uint64_t a3)
{
  if (!*(void *)(*(void *)(a1[4] + 8LL) + 40LL))
  {
    id v6 = objc_alloc_init(MEMORY[0x189603FC8]);
    uint64_t v7 = *(void *)(a1[4] + 8LL);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }

  id v9 = -[_LSLocalizedStringRecord _initWithContext:unitID:]( objc_alloc(&OBJC_CLASS____LSLocalizedStringRecord),  "_initWithContext:unitID:",  a1[6],  *(unsigned int *)(a1[5] + 4 * a2 + 496));
  id v10 = v9;
  if (v9) {
    [*(id *)(*(void *)(a1[4] + 8) + 40) setObject:v9 forKeyedSubscript:a3];
  }
  else {
    [*(id *)(*(void *)(a1[4] + 8) + 40) setObject:*MEMORY[0x189605018] forKeyedSubscript:a3];
  }
}

- (BOOL)requiresPostProcessing
{
  return (-[LSApplicationRecord _rawMoreFlags](self, "_rawMoreFlags") >> 7) & 1;
}

+ (id)_propertyClasses
{
  v3[12] = *MEMORY[0x1895F89C0];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  v3[5] = objc_opt_class();
  v3[6] = objc_opt_class();
  v3[7] = objc_opt_class();
  v3[8] = objc_opt_class();
  v3[9] = objc_opt_class();
  v3[10] = objc_opt_class();
  v3[11] = objc_opt_class();
  [MEMORY[0x189603F18] arrayWithObjects:v3 count:12];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_initWithContext:(LSContext *)a3 persistentIdentifierData:(const LSPersistentIdentifierData *)a4 length:(unint64_t)a5
{
  db = a3->db;
  if (a4->var3 != a3->db->schema.bundleTable)
  {
    [MEMORY[0x1896077D8] currentHandler];
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 handleFailureInMethod:a2, self, @"LSApplicationRecord.mm", 1522, @"Invalid parameter not satisfying: %@", @"pi->tableID == ctx->db->schema.bundleTable" object file lineNumber description];

    db = a3->db;
  }

  uint64_t v10 = _LSBundleGet(db, a4->var2);
  if (v10 && a5 == 36 && *(void *)a4->var5 == *(void *)(v10 + 264)) {
    return -[LSApplicationRecord _initWithContext:bundleID:bundleData:error:]( self,  "_initWithContext:bundleID:bundleData:error:",  a3,  a4->var2,  v10,  0LL);
  }

  return 0LL;
}

uint64_t __67__LSApplicationRecord__detachFromContext_tableID_unitID_unitBytes___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LSApplicationRecord)initWithCoder:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___LSApplicationRecord;
  uint64_t v3 = -[LSBundleRecord initWithCoder:](&v14, sel_initWithCoder_, a3);
  uint64_t v4 = v3;
  if (v3)
  {
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    -[LSRecord _resolvedPropertyValueForGetter:]( v3,  "_resolvedPropertyValueForGetter:",  sel_applicationExtensionRecords,  0LL);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v5);
          }
          objc_storeWeak((id *)(*(void *)(*((void *)&v10 + 1) + 8 * v8++) + 80LL), v4);
        }

        while (v6 != v8);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
      }

      while (v6);
    }
  }

  return v4;
}

- (NSUUID)deviceIdentifierForVendor
{
  uint64_t v11 = 0LL;
  __int128 v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  objc_super v14 = __Block_byref_object_copy__93;
  id v15 = __Block_byref_object_dispose__94;
  id v16 = 0LL;
  uint64_t v3 = MEMORY[0x1895F87A8];
  v10[0] = (void (*)(void, void))MEMORY[0x1895F87A8];
  v10[1] = (void (*)(void, void))3221225472LL;
  v10[2] = __67__LSApplicationRecord_UniqueIdentifiers__deviceIdentifierForVendor__block_invoke;
  v10[3] = (void (*)(void, void))&unk_189D72860;
  void v10[4] = (void (*)(void, void))self;
  +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDDeviceIdentifierService, v10);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSApplicationRecord _deviceIdentifierVendorName](self, "_deviceIdentifierVendorName");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSBundleRecord bundleIdentifier](self, "bundleIdentifier");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v9[1] = 3221225472LL;
  v9[2] = __67__LSApplicationRecord_UniqueIdentifiers__deviceIdentifierForVendor__block_invoke_431;
  v9[3] = &unk_189D72888;
  v9[4] = &v11;
  [v4 getIdentifierOfType:0 vendorName:v5 bundleIdentifier:v6 completionHandler:v9];

  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSUUID *)v7;
}

void __67__LSApplicationRecord_UniqueIdentifiers__deviceIdentifierForVendor__block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  _LSRecordLog();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    [*(id *)(a1 + 32) bundleIdentifier];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    int v6 = 138478083;
    id v7 = v5;
    __int16 v8 = 2112;
    uint64_t v9 = a2;
    _os_log_impl( &dword_183E58000,  v4,  OS_LOG_TYPE_ERROR,  "Error getting identifier for vendor for %{private}@: %@",  (uint8_t *)&v6,  0x16u);
  }
}

void __67__LSApplicationRecord_UniqueIdentifiers__deviceIdentifierForVendor__block_invoke_431( uint64_t a1,  void *a2)
{
}

- (NSUUID)deviceIdentifierForAdvertising
{
  uint64_t v11 = 0LL;
  __int128 v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  objc_super v14 = __Block_byref_object_copy__93;
  id v15 = __Block_byref_object_dispose__94;
  id v16 = 0LL;
  uint64_t v3 = MEMORY[0x1895F87A8];
  v10[0] = (void (*)(void, void))MEMORY[0x1895F87A8];
  v10[1] = (void (*)(void, void))3221225472LL;
  v10[2] = __72__LSApplicationRecord_UniqueIdentifiers__deviceIdentifierForAdvertising__block_invoke;
  v10[3] = (void (*)(void, void))&unk_189D72860;
  void v10[4] = (void (*)(void, void))self;
  +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDDeviceIdentifierService, v10);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSApplicationRecord _deviceIdentifierVendorName](self, "_deviceIdentifierVendorName");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSBundleRecord bundleIdentifier](self, "bundleIdentifier");
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v9[1] = 3221225472LL;
  v9[2] = __72__LSApplicationRecord_UniqueIdentifiers__deviceIdentifierForAdvertising__block_invoke_433;
  v9[3] = &unk_189D72888;
  v9[4] = &v11;
  [v4 getIdentifierOfType:1 vendorName:v5 bundleIdentifier:v6 completionHandler:v9];

  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSUUID *)v7;
}

void __72__LSApplicationRecord_UniqueIdentifiers__deviceIdentifierForAdvertising__block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  _LSRecordLog();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    [*(id *)(a1 + 32) bundleIdentifier];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    int v6 = 138478083;
    id v7 = v5;
    __int16 v8 = 2112;
    uint64_t v9 = a2;
    _os_log_impl( &dword_183E58000,  v4,  OS_LOG_TYPE_ERROR,  "Error getting identifier for vendor for %{private}@: %@",  (uint8_t *)&v6,  0x16u);
  }
}

void __72__LSApplicationRecord_UniqueIdentifiers__deviceIdentifierForAdvertising__block_invoke_433( uint64_t a1,  void *a2)
{
}

- (void)clearAdvertisingIdentifier
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 clearAllIdentifiersOfType:1];
}

- (BOOL)supportsExternallyPlayableContent
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 30) & 1;
}

- (BOOL)supportsOpenInPlace
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 33) & 1;
}

- (BOOL)isFileSharingEnabled
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 31) & 1;
}

- (BOOL)supportsPurgeableLocalStorage
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 34) & 1;
}

- (BOOL)supportsLiveActivitiesFrequentUpdates
{
  return (-[LSApplicationRecord _rawMoreFlags](self, "_rawMoreFlags") >> 6) & 1;
}

- (BOOL)supportsLiveActivities
{
  return (-[LSApplicationRecord _rawMoreFlags](self, "_rawMoreFlags") >> 5) & 1;
}

- (NSArray)supportedLiveActivityLaunchAttributeTypes
{
  return 0LL;
}

- (id)localizedNameWithContext:(id)a3
{
  return -[LSApplicationRecord localizedNameWithContext:preferredLocalizations:]( self,  "localizedNameWithContext:preferredLocalizations:",  a3,  0LL);
}

- (id)localizedNameWithContext:(id)a3 preferredLocalizations:(id)a4
{
  uint64_t v13 = 0LL;
  objc_super v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  id v16 = __Block_byref_object_copy__93;
  uint64_t v17 = __Block_byref_object_dispose__94;
  id v18 = 0LL;
  if (a3 && [a3 length])
  {
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __85__LSApplicationRecord_Localization__localizedNameWithContext_preferredLocalizations___block_invoke;
    v12[3] = &unk_189D728D8;
    v12[4] = a3;
    v12[5] = self;
    v12[6] = a4;
    v12[7] = &v13;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __85__LSApplicationRecord_Localization__localizedNameWithContext_preferredLocalizations___block_invoke_3;
    v11[3] = &unk_189D72900;
    v11[4] = self;
    v11[5] = a3;
    v11[6] = a4;
    v11[7] = &v13;
    -[LSRecord _ifAttached:else:](self, "_ifAttached:else:", v12, v11);
  }

  else
  {
    _LSRecordLog();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl( &dword_183E58000,  v7,  OS_LOG_TYPE_FAULT,  "You must pass a valid context string when using -localizedNameWithContext:. Did you want -localizedName?",  v10,  2u);
    }
  }

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

uint64_t __85__LSApplicationRecord_Localization__localizedNameWithContext_preferredLocalizations___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  int a4)
{
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __85__LSApplicationRecord_Localization__localizedNameWithContext_preferredLocalizations___block_invoke_2;
  v6[3] = &unk_189D728B0;
  uint64_t v9 = a2;
  int v10 = a4;
  __int128 v4 = *(_OWORD *)(a1 + 48);
  __int128 v7 = *(_OWORD *)(a1 + 32);
  __int128 v8 = v4;
  return __LSRECORD_IS_PERFORMING_IO_FOR_A_CALLER__((uint64_t)v6);
}

void __85__LSApplicationRecord_Localization__localizedNameWithContext_preferredLocalizations___block_invoke_2( uint64_t a1)
{
  id v2 = **(void ***)(a1 + 64);
  uint64_t v3 = *(unsigned int *)(a1 + 72);
  __int128 v4 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) _node];
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = _LSBundleGetLocalizedName(v2, v3, v4, v8, *(void **)(a1 + 48), 0);
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8LL);
  __int128 v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __85__LSApplicationRecord_Localization__localizedNameWithContext_preferredLocalizations___block_invoke_3( uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (v2)
  {
    id v8 = v2;
    id v4 = (id)[v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
    uint64_t v3 = v8;
    if (v4 != (id)*MEMORY[0x189605018])
    {
      uint64_t v5 = [v4 stringValueWithPreferredLocalizations:*(void *)(a1 + 48)];
      uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8LL);
      __int128 v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;

      uint64_t v3 = v8;
    }
  }
}

- (BOOL)wasRenamed
{
  return 0;
}

+ (id)_alternateIconQueue
{
  if (+[LSApplicationRecord(AlternateIcons) _alternateIconQueue]::once != -1) {
    dispatch_once(&+[LSApplicationRecord(AlternateIcons) _alternateIconQueue]::once, &__block_literal_global_541);
  }
  return (id)+[LSApplicationRecord(AlternateIcons) _alternateIconQueue]::result;
}

void __58__LSApplicationRecord_AlternateIcons___alternateIconQueue__block_invoke()
{
  id v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v0 = dispatch_queue_create("LS alternate icon queue", v2);
  v1 = (void *)+[LSApplicationRecord(AlternateIcons) _alternateIconQueue]::result;
  +[LSApplicationRecord(AlternateIcons) _alternateIconQueue]::uint64_t result = (uint64_t)v0;
}

- (BOOL)supportsAlternateIconNames
{
  return (-[LSApplicationRecord _rawIconFlags](self, "_rawIconFlags") >> 3) & 1;
}

- (void)setAlternateIconName:(id)a3 completionHandler:(id)a4
{
  __int128 v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __78__LSApplicationRecord_AlternateIcons__setAlternateIconName_completionHandler___block_invoke;
  block[3] = &unk_189D72970;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  dispatch_async(v7, block);
}

void __78__LSApplicationRecord_AlternateIcons__setAlternateIconName_completionHandler___block_invoke( uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  if ([(id)__LSDefaultsGetSharedInstance() allowsAlternateIcons])
  {
    id v2 = (os_log_s *)_LSIconsLog(void)::log;
    if (os_log_type_enabled((os_log_t)_LSIconsLog(void)::log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v26 = v3;
      __int16 v27 = 2112;
      uint64_t v28 = v4;
      _os_log_impl(&dword_183E58000, v2, OS_LOG_TYPE_DEFAULT, "Setting preferredIconName to %@ for %@", buf, 0x16u);
    }

    [*(id *)(a1 + 40) bundleIdentifier];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) _rawIconDictionary];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 _expensiveDictionaryRepresentation];
    __int128 v7 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v15 = (void (*)(void, void))MEMORY[0x1895F87A8];
    uint64_t v16 = 3221225472LL;
    uint64_t v17 = __78__LSApplicationRecord_AlternateIcons__setAlternateIconName_completionHandler___block_invoke_544;
    id v18 = &unk_189D72948;
    id v8 = v5;
    uint64_t v9 = *(void *)(a1 + 48);
    id v19 = v8;
    uint64_t v20 = v9;
    +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDIconService, &v15);
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v10,  "setAlternateIconName:forIdentifier:iconsDictionary:reply:",  *(void *)(a1 + 32),  v8,  v7,  *(void *)(a1 + 48),  v15,  v16,  v17,  v18);
  }

  else
  {
    uint64_t v23 = *MEMORY[0x1896075E0];
    uint64_t v24 = @"alternateIcons not allowed";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = _LSMakeNSErrorImpl( @"LSApplicationWorkspaceErrorDomain",  110LL,  (uint64_t)"-[LSApplicationRecord(AlternateIcons) setAlternateIconName:completionHandler:]_block_invoke",  2033LL,  v11);

    uint64_t v21 = *MEMORY[0x189607798];
    uint64_t v22 = v12;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607460],  3328LL,  (uint64_t)"-[LSApplicationRecord(AlternateIcons) setAlternateIconName:completionHandler:]_block_invoke",  2035LL,  v13);
    __int128 v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_super v14 = (os_log_s *)_LSIconsLog(void)::log;
    if (os_log_type_enabled((os_log_t)_LSIconsLog(void)::log, OS_LOG_TYPE_ERROR)) {
      __78__LSApplicationRecord_AlternateIcons__setAlternateIconName_completionHandler___block_invoke_cold_1( a1,  (uint64_t)v7,  v14);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    id v8 = (id)v12;
  }
}

uint64_t __78__LSApplicationRecord_AlternateIcons__setAlternateIconName_completionHandler___block_invoke_544( uint64_t a1,  uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (os_log_s *)_LSIconsLog(void)::log;
  if (os_log_type_enabled((os_log_t)_LSIconsLog(void)::log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = a2;
    _os_log_impl( &dword_183E58000,  v4,  OS_LOG_TYPE_DEFAULT,  "Failed to set alternate icon name for bundleID %@ with error: %@",  (uint8_t *)&v7,  0x16u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (NSString)alternateIconName
{
  uint64_t v6 = 0LL;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  __int16 v9 = __Block_byref_object_copy__93;
  uint64_t v10 = __Block_byref_object_dispose__94;
  id v11 = 0LL;
  if ([(id)__LSDefaultsGetSharedInstance() allowsAlternateIcons]
    && -[LSApplicationRecord supportsAlternateIconNames](self, "supportsAlternateIconNames"))
  {
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __56__LSApplicationRecord_AlternateIcons__alternateIconName__block_invoke;
    v5[3] = &unk_189D729C0;
    v5[4] = self;
    v5[5] = &v6;
    __LSRECORD_IS_PERFORMING_IO_FOR_A_CALLER__((uint64_t)v5);
  }

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __56__LSApplicationRecord_AlternateIcons__alternateIconName__block_invoke(uint64_t a1)
{
  id v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __56__LSApplicationRecord_AlternateIcons__alternateIconName__block_invoke_2;
  v3[3] = &unk_189D729C0;
  __int128 v4 = *(_OWORD *)(a1 + 32);
  dispatch_sync(v2, v3);
}

void __56__LSApplicationRecord_AlternateIcons__alternateIconName__block_invoke_2(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ([(id)__LSDefaultsGetSharedInstance() isServer])
  {
    +[LSAltIconManager sharedInstance](&OBJC_CLASS___LSAltIconManager, "sharedInstance");
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    id v16 = 0LL;
    uint64_t v4 = [v3 alternateIconNameForIdentifier:v2 error:&v16];
    id v5 = v16;
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
    int v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v4;

    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
    {
    }
  }

  else
  {
    uint64_t v8 = MEMORY[0x1895F87A8];
    v14[0] = (void (*)(void, void))MEMORY[0x1895F87A8];
    v14[1] = (void (*)(void, void))3221225472LL;
    _OWORD v14[2] = __56__LSApplicationRecord_AlternateIcons__alternateIconName__block_invoke_548;
    v14[3] = (void (*)(void, void))&unk_189D72860;
    id v9 = v2;
    id v15 = v9;
    +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDIconService, v14);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    v11[1] = 3221225472LL;
    v11[2] = __56__LSApplicationRecord_AlternateIcons__alternateIconName__block_invoke_549;
    v11[3] = &unk_189D72998;
    uint64_t v13 = *(void *)(a1 + 40);
    id v12 = v9;
    [v10 getAlternateIconNameForIdentifier:v12 reply:v11];

    id v5 = v15;
  }
}

void __56__LSApplicationRecord_AlternateIcons__alternateIconName__block_invoke_548(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (os_log_s *)_LSIconsLog(void)::log;
  if (os_log_type_enabled((os_log_t)_LSIconsLog(void)::log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    uint64_t v9 = a2;
    _os_log_impl( &dword_183E58000,  v4,  OS_LOG_TYPE_DEFAULT,  "Failed to retrieve alternate icon name for bundleID %@ with error: %@",  (uint8_t *)&v6,  0x16u);
  }

void __56__LSApplicationRecord_AlternateIcons__alternateIconName__block_invoke_549(uint64_t a1, void *a2)
{
  if (a2)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
  }

  else
  {
  }

- (id)supportedIntents
{
  if ((-[LSApplicationRecord _rawPlistFlags](self, "_rawPlistFlags") & 0x200000) == 0
    || (-[LSBundleRecord infoDictionary](self, "infoDictionary"),
        id v3 = (void *)objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = objc_opt_class(),
        [v3 objectForKey:@"INIntentsSupported" ofClass:v4 valuesOfClass:objc_opt_class()],
        uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v5))
  {
    uint64_t v5 = (void *)MEMORY[0x189604A58];
  }

  return v5;
}

- (id)intentsRestrictedWhileLocked
{
  if ((-[LSApplicationRecord _rawPlistFlags](self, "_rawPlistFlags") & 0x200000) == 0
    || (-[LSBundleRecord infoDictionary](self, "infoDictionary"),
        id v3 = (void *)objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = objc_opt_class(),
        [v3 objectForKey:@"INIntentsRestrictedWhileLocked" ofClass:v4 valuesOfClass:objc_opt_class()],  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(),  v3,  !v5))
  {
    uint64_t v5 = (void *)MEMORY[0x189604A58];
  }

  return v5;
}

- (id)intentsRestrictedWhileProtectedDataUnavailable
{
  if ((-[LSApplicationRecord _rawPlistFlags](self, "_rawPlistFlags") & 0x200000) == 0
    || (-[LSBundleRecord infoDictionary](self, "infoDictionary"),
        id v3 = (void *)objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = objc_opt_class(),
        [v3 objectForKey:@"INIntentsRestrictedWhileProtectedDataUnavailable" ofClass:v4 valuesOfClass:objc_opt_class()],  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(),  v3,  !v5))
  {
    uint64_t v5 = (void *)MEMORY[0x189604A58];
  }

  return v5;
}

- (id)supportedIntentMediaCategories
{
  if ((-[LSApplicationRecord _rawPlistFlags](self, "_rawPlistFlags") & 0x200000) == 0
    || (-[LSBundleRecord infoDictionary](self, "infoDictionary"),
        id v3 = (void *)objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = objc_opt_class(),
        [v3 objectForKey:@"INSupportedMediaCategories" ofClass:v4 valuesOfClass:objc_opt_class()],  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(),  v3,  !v5))
  {
    uint64_t v5 = (void *)MEMORY[0x189604A58];
  }

  return v5;
}

+ (id)applicationRecordsForUserActivityType:(id)a3 limit:(unint64_t)a4 error:(id *)a5
{
  if (!a3)
  {
    [MEMORY[0x1896077D8] currentHandler];
    char v34 = (void *)objc_claimAutoreleasedReturnValue();
    [v34 handleFailureInMethod:a2, a1, @"LSApplicationRecord.mm", 2205, @"Invalid parameter not satisfying: %@", @"userActivityType != nil" object file lineNumber description];
  }

  CurrentContext = (void **)_LSDatabaseContextGetCurrentContext((LaunchServices::DatabaseContext *)a1);
  id v46 = 0LL;
  char v47 = 0;
  id v48 = 0LL;
  +[_LSDServiceDomain defaultServiceDomain]();
  __int16 v8 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v8, 0LL);

  v44 = v9;
  if (v9)
  {
    uint64_t v35 = 0LL;
    v36 = &v35;
    __int16 v38 = __Block_byref_object_copy__585;
    uint64_t v39 = __Block_byref_object_dispose__586;
    uint64_t v37 = 0x4812000000LL;
    __int16 v40 = "";
    __p = 0LL;
    uint64_t v42 = 0LL;
    uint64_t v43 = 0LL;
    _LSDatabaseGetStringForCFString(*v9, (const __CFString *)a3, 0);
    _LSDatabaseEnumeratingBindingMap();
    uint64_t v10 = v36[6];
    unint64_t v11 = v36[7];
    unint64_t v12 = 126 - 2 * __clz((uint64_t)(v11 - v10) >> 4);
    uint64_t v49 = &v44;
    if (v11 == v10) {
      uint64_t v13 = 0LL;
    }
    else {
      uint64_t v13 = v12;
    }
    std::__introsort<std::_ClassicAlgPolicy,+[LSApplicationRecord(UserActivity) applicationRecordsForUserActivityType:limit:error:]::$_0 &,std::pair<unsigned int,LSBundleData const*> *,false>( v10,  v11,  &v49,  v13,  1);
    id v14 = objc_alloc(MEMORY[0x189603FA8]);
    id v15 = (void *)[v14 initWithCapacity:(v36[7] - v36[6]) >> 4];
    id v16 = (unsigned int *)v36[6];
    uint64_t v17 = (unsigned int *)v36[7];
    if (v16 != v17)
    {
      uint64_t v18 = 0LL;
      do
      {
        id v19 = (void *)MEMORY[0x186E2A59C]();
        uint64_t v20 = objc_alloc(&OBJC_CLASS___LSApplicationRecord);
        id v21 = -[LSApplicationRecord _initWithContext:bundleID:bundleData:error:]( v20,  "_initWithContext:bundleID:bundleData:error:",  v44,  *v16,  *((void *)v16 + 1),  0LL);
        BOOL v22 = 0;
        if (v21)
        {
          [v15 addObject:v21];
          if (++v18 >= a4) {
            BOOL v22 = 1;
          }
        }

        objc_autoreleasePoolPop(v19);
        v16 += 4;
        char v23 = v16 == v17 || v22;
      }

      while ((v23 & 1) == 0);
    }

    uint64_t v24 = (void *)[v15 copy];

    _Block_object_dispose(&v35, 8);
    if (__p)
    {
      uint64_t v42 = __p;
      operator delete(__p);
    }
  }

  else if (a5)
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    uint64_t v25 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v25, 0LL);

    if (v26) {
      id v27 = 0LL;
    }
    else {
      id v27 = v48;
    }
    uint64_t v24 = 0LL;
    *a5 = v27;
  }

  else
  {
    uint64_t v24 = 0LL;
  }

  id v28 = v24;
  if (CurrentContext && v47) {
    _LSContextDestroy(CurrentContext);
  }
  id v29 = v46;
  CurrentContext = 0LL;
  id v46 = 0LL;

  char v47 = 0;
  id v30 = v48;
  id v48 = 0LL;

  return v28;
}

void __87__LSApplicationRecord_UserActivity__applicationRecordsForUserActivityType_limit_error___block_invoke( uint64_t a1,  uint64_t a2,  int a3)
{
  uint64_t v5 = _LSBundleGet(**(void ***)(a1 + 48), a3);
  if (v5)
  {
    uint64_t v6 = v5;
    if (_LSBundleCouldBeSelectedForActivityContinuation(**(void ***)(a1 + 48), a3, v5, *(void **)(a1 + 32)))
    {
      uint64_t v7 = *(void **)(*(void *)(a1 + 40) + 8LL);
      unint64_t v8 = v7[7];
      unint64_t v9 = v7[8];
      if (v8 >= v9)
      {
        uint64_t v11 = v7[6];
        uint64_t v12 = (uint64_t)(v8 - v11) >> 4;
        unint64_t v13 = v12 + 1;
        uint64_t v14 = v9 - v11;
        if (v14 >> 3 > v13) {
          unint64_t v13 = v14 >> 3;
        }
        else {
          unint64_t v15 = v13;
        }
        id v16 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<unsigned int,NSUUID * {__strong}>>>( (uint64_t)(v7 + 8),  v15);
        uint64_t v17 = &v16[16 * v12];
        id v19 = &v16[16 * v18];
        *(_DWORD *)uint64_t v17 = a3;
        *((void *)v17 + 1) = v6;
        uint64_t v10 = v17 + 16;
        id v21 = (char *)v7[6];
        uint64_t v20 = (char *)v7[7];
        if (v20 != v21)
        {
          do
          {
            *((_OWORD *)v17 - 1) = *((_OWORD *)v20 - 1);
            v17 -= 16;
            v20 -= 16;
          }

          while (v20 != v21);
          uint64_t v20 = (char *)v7[6];
        }

        v7[6] = v17;
        v7[7] = v10;
        v7[8] = v19;
        if (v20) {
          operator delete(v20);
        }
      }

      else
      {
        *(_DWORD *)unint64_t v8 = a3;
        *(void *)(v8 + 8) = v6;
        uint64_t v10 = (char *)(v8 + 16);
      }

      v7[7] = v10;
    }
  }

+ (id)applicationRecordsForUserActivityDomainName:(id)a3 limit:(unint64_t)a4 error:(id *)a5
{
  id v9 = a3;
  if (!v9)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 handleFailureInMethod:a2, a1, @"LSApplicationRecord.mm", 2260, @"Invalid parameter not satisfying: %@", @"domainName != nil" object file lineNumber description];
  }

  [v9 lowercaseString];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  CurrentContext = (void **)_LSDatabaseContextGetCurrentContext(v11);
  id v33 = 0LL;
  char v34 = 0;
  id v35 = 0LL;
  +[_LSDServiceDomain defaultServiceDomain]();
  uint64_t v12 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  unint64_t v13 = (void *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v12, 0LL);

  if (v13)
  {
    id v14 = objc_alloc_init(MEMORY[0x189603FA8]);
    v31[0] = 0LL;
    v31[1] = v31;
    v31[2] = 0x2020000000LL;
    v31[3] = 0LL;
    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    v25[2] = __93__LSApplicationRecord_UserActivity__applicationRecordsForUserActivityDomainName_limit_error___block_invoke;
    v25[3] = &unk_189D72A10;
    id v29 = v13;
    id v26 = v10;
    id v15 = v14;
    id v27 = v15;
    id v28 = v31;
    unint64_t v30 = a4;
    _LSEnumerateViableBundlesOfClass(v13, 2LL, v25);
    id v16 = (void *)[v15 copy];

    _Block_object_dispose(v31, 8);
  }

  else if (a5)
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    uint64_t v17 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v17, 0LL);

    if (v18) {
      id v19 = 0LL;
    }
    else {
      id v19 = v35;
    }
    id v16 = 0LL;
    *a5 = v19;
  }

  else
  {
    id v16 = 0LL;
  }

  id v20 = v16;
  if (CurrentContext && v34) {
    _LSContextDestroy(CurrentContext);
  }
  id v21 = v33;
  CurrentContext = 0LL;
  id v33 = 0LL;

  char v34 = 0;
  id v22 = v35;
  id v35 = 0LL;

  return v20;
}

void __93__LSApplicationRecord_UserActivity__applicationRecordsForUserActivityDomainName_limit_error___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  _BYTE *a4)
{
  unint64_t v8 = (void *)MEMORY[0x186E2A59C]();
  CFSetRef v9 = _LSBundleCopyUserActivityDomainNames(**(void **)(a1 + 56), a2, a3);
  CFSetRef v10 = v9;
  if (v9)
  {
    -[__CFSet member:](v9, "member:", *(void *)(a1 + 32));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      id v12 = -[LSApplicationRecord _initWithContext:bundleID:bundleData:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "_initWithContext:bundleID:bundleData:error:",  *(void *)(a1 + 56),  a2,  a3,  0LL);
      if (v12)
      {
        [*(id *)(a1 + 40) addObject:v12];
        if (++*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) >= *(void *)(a1 + 64)) {
          *a4 = 1;
        }
      }
    }
  }

  objc_autoreleasePoolPop(v8);
}

- (BOOL)supportsControllerUserInteraction
{
  return -[LSApplicationRecord _rawMoreFlags](self, "_rawMoreFlags") & 1;
}

void __93__LSApplicationRecord_GameKit__supportedGameControllersWithContext_tableID_unitID_unitBytes___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

- (BOOL)isWrapper
{
  return 0;
}

- (BOOL)isWrapped
{
  return 0;
}

- (BOOL)getGenericTranslocationTargetURL:(id *)a3 error:(id *)a4
{
  if (a4)
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -4LL,  (uint64_t)"-[LSApplicationRecord(AppWrappers) getGenericTranslocationTargetURL:error:]",  2371LL,  0LL);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (id)bundleMetadataReturningError:(id *)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  uint64_t v5 = (void *)MEMORY[0x186E2A59C](self, a2);
  -[LSBundleRecord bundleIdentifier](self, "bundleIdentifier");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = 0LL;
  softLinkMobileInstallationCopyAppMetadata(v6, (uint64_t)&v11);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v11;

  if (!v7)
  {
    _LSRecordLog();
    CFSetRef v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      unint64_t v13 = self;
      __int16 v14 = 2112;
      id v15 = v8;
      _os_log_impl(&dword_183E58000, v9, OS_LOG_TYPE_ERROR, "Failed to lookup metadata for app %@: %@", buf, 0x16u);
    }

    if (a3) {
      *a3 = v8;
    }
  }

  objc_autoreleasePoolPop(v5);

  return v7;
}

- (BOOL)isAdHocCodeSigned
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 26) & 1;
}

- (BOOL)hasSettingsBundle
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 32) & 1;
}

- (BOOL)applicationHasMIDBasedSINF
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 24) & 1;
}

- (BOOL)applicationMissingRequiredSINF
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 25) & 1;
}

- (BOOL)hasCustomNotification
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 44) & 1;
}

- (LSApplicationRecord)initWithBundleIdentifierOfCompanionApplication:(id)a3 error:(id *)a4
{
  v9[1] = *MEMORY[0x1895F89C0];
  if (a4)
  {
    uint64_t v8 = *MEMORY[0x189607490];
    v9[0] = @"This platform does not support discovery of companion application identifiers.";
    [MEMORY[0x189603F68] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -4LL,  (uint64_t)"-[LSApplicationRecord(watchOS) initWithBundleIdentifierOfCompanionApplication:error:]",  2744LL,  v6);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (unsigned)watchKitApplicationType
{
  return 0;
}

- (NSString)watchKitVersion
{
  return 0LL;
}

- (NSString)complicationPrincipalClassName
{
  return 0LL;
}

- (NSArray)supportedComplicationFamilies
{
  return (NSArray *)MEMORY[0x189604A58];
}

- (BOOL)hasComplication
{
  return 0;
}

- (BOOL)hasGlance
{
  return 0;
}

- (BOOL)shouldSkipWatchAppInstall
{
  return (-[LSApplicationRecord _rawBundleFlags](self, "_rawBundleFlags") >> 48) & 1;
}

- (BOOL)isWatchOnly
{
  return 0;
}

- (BOOL)runsIndependentlyOfCompanionApp
{
  return 0;
}

- (NSString)watchKitApplicationTintColorName
{
  return 0LL;
}

- (id)initForInstallMachineryWithBundleIdentifier:(id)a3 error:(id *)a4
{
  return -[LSApplicationRecord _initWithNode:bundleIdentifier:placeholderBehavior:systemPlaceholder:itemID:forceInBundleContainer:context:error:]( self,  "_initWithNode:bundleIdentifier:placeholderBehavior:systemPlaceholder:itemID:forceInBundleContainer:context:error:",  0LL,  a3,  1LL,  0LL,  0LL,  0LL,  0LL,  a4);
}

- (NSNumber)eligibilityDeletionDomain
{
  if ((-[LSApplicationRecord _rawPlistFlags](self, "_rawPlistFlags") & 0x20) != 0)
  {
    -[LSBundleRecord infoDictionary](self, "infoDictionary");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKey:@"LSEligibilityDeletionDomain" ofClass:objc_opt_class()];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v3 = 0LL;
  }

  return (NSNumber *)v3;
}

- (unint64_t)sequenceNumber
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t SequenceNumberInternal = _LSApplicationRecordPersistentIdentifierGetSequenceNumberInternal(v2);

  return SequenceNumberInternal;
}

+ (id)personalPersonaAttributes
{
  if (+[LSApplicationRecord(Identities) personalPersonaAttributes]::once != -1) {
    dispatch_once(&+[LSApplicationRecord(Identities) personalPersonaAttributes]::once, &__block_literal_global_819);
  }
  return (id)+[LSApplicationRecord(Identities) personalPersonaAttributes]::result;
}

void __60__LSApplicationRecord_Identities__personalPersonaAttributes__block_invoke()
{
  uint64_t v0 = [(id)getUMUserPersonaAttributesClass() personaAttributesForPersonaType:0];
  v1 = (void *)+[LSApplicationRecord(Identities) personalPersonaAttributes]::result;
  +[LSApplicationRecord(Identities) personalPersonaAttributes]::uint64_t result = v0;
}

- (unint64_t)supportedDefaultAppCategories
{
  return 0LL;
}

- (BOOL)mayBeBUIVisible
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v2 isEqualToString:@"System"]) {
    char v3 = 1;
  }
  else {
    char v3 = [v2 isEqualToString:@"User"];
  }

  return v3;
}

- (unint64_t)bundleInode
{
  return 0LL;
}

- (unint64_t)executableInode
{
  return 0LL;
}

+ (id)redactedProperties
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __52__LSApplicationRecord_Redaction__redactedProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[LSApplicationRecord(Redaction) redactedProperties]::once != -1) {
    dispatch_once(&+[LSApplicationRecord(Redaction) redactedProperties]::once, block);
  }
  return (id)+[LSApplicationRecord(Redaction) redactedProperties]::properties;
}

void __52__LSApplicationRecord_Redaction__redactedProperties__block_invoke(uint64_t a1)
{
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)&OBJC_METACLASS___LSApplicationRecord;
  objc_msgSendSuper2(&v4, sel_redactedProperties);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v1 arrayByAddingObject:@"_rawEnvironmentVariables"];
  char v3 = (void *)+[LSApplicationRecord(Redaction) redactedProperties]::properties;
  +[LSApplicationRecord(Redaction) redactedProperties]::properties = v2;
}

- (id)recordForUnredactingWithContext:(LSContext *)a3 error:(id *)a4
{
  uint64_t v7 = objc_alloc(&OBJC_CLASS___LSApplicationRecord);
  -[LSBundleRecord _node](self, "_node");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSBundleRecord bundleIdentifier](self, "bundleIdentifier");
  CFSetRef v9 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v10 = -[LSApplicationRecord isPlaceholder](self, "isPlaceholder");
  BOOL v11 = -[LSApplicationRecord isSystemPlaceholder](self, "isSystemPlaceholder");
  if (v10) {
    uint64_t v12 = 3LL;
  }
  else {
    uint64_t v12 = 0LL;
  }
  id v13 = -[LSApplicationRecord _initWithNode:bundleIdentifier:placeholderBehavior:systemPlaceholder:itemID:forceInBundleContainer:context:error:]( v7,  "_initWithNode:bundleIdentifier:placeholderBehavior:systemPlaceholder:itemID:forceInBundleContainer:context:error:",  v8,  v9,  v12,  v11,  0LL,  0LL,  a3,  a4);

  return v13;
}

- (id)getApplicationExtensionDiagnosticDescriptionWithError:(id *)a3
{
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  uint64_t v17 = __Block_byref_object_copy__93;
  uint64_t v18 = __Block_byref_object_dispose__94;
  id v19 = 0LL;
  uint64_t v8 = 0LL;
  CFSetRef v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  BOOL v11 = __Block_byref_object_copy__93;
  uint64_t v12 = __Block_byref_object_dispose__94;
  id v13 = 0LL;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __89__LSApplicationRecord_Diagnostic__getApplicationExtensionDiagnosticDescriptionWithError___block_invoke;
  v7[3] = &unk_189D72AC8;
  v7[4] = &v8;
  v7[5] = &v14;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __89__LSApplicationRecord_Diagnostic__getApplicationExtensionDiagnosticDescriptionWithError___block_invoke_2;
  v6[3] = &unk_189D72AF0;
  void v6[4] = self;
  v6[5] = &v8;
  v6[6] = &v14;
  -[LSRecord _ifAttached:else:](self, "_ifAttached:else:", v7, v6);
  if (a3) {
    *a3 = (id) v15[5];
  }
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v4;
}

void __89__LSApplicationRecord_Diagnostic__getApplicationExtensionDiagnosticDescriptionWithError___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  unsigned int a4)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v6 = *(void **)(v5 + 40);
  uint64_t v7 = _LSGetApplicationExtensionDiagnosticDescriptionForBundle(a2, a4);
  objc_storeStrong((id *)(v5 + 40), v6);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8LL);
  CFSetRef v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void __89__LSApplicationRecord_Diagnostic__getApplicationExtensionDiagnosticDescriptionWithError___block_invoke_2( uint64_t a1)
{
  id v19 = 0LL;
  uint64_t v16 = 0LL;
  id v17 = 0LL;
  char v18 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  uint64_t v2 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  char v3 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v16, v2, 0LL);

  if (!v3)
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    uint64_t v10 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v16, v10, 0LL);

    if (v11) {
      id v12 = 0LL;
    }
    else {
      id v12 = v19;
    }
    goto LABEL_8;
  }

  if (!_LSBundleGet(*v3, [*(id *)(a1 + 32) unitID]))
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -10814LL,  (uint64_t)"-[LSApplicationRecord(Diagnostic) getApplicationExtensionDiagnosticDescriptionWithError:]_block_invoke_2",  3138LL,  0LL);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8LL);
    CFSetRef v9 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
    goto LABEL_9;
  }

  unsigned int v4 = [*(id *)(a1 + 32) unitID];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v6 = *(void **)(v5 + 40);
  uint64_t v7 = _LSGetApplicationExtensionDiagnosticDescriptionForBundle((uint64_t)v3, v4);
  objc_storeStrong((id *)(v5 + 40), v6);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8LL);
  CFSetRef v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
LABEL_9:

  if (v16 && v18) {
    _LSContextDestroy(v16);
  }
  id v14 = v17;
  uint64_t v16 = 0LL;
  id v17 = 0LL;

  char v18 = 0;
  id v15 = v19;
  id v19 = 0LL;
}

+ (id)enumeratorWithOptions:(unint64_t)a3
{
  return  -[_LSApplicationRecordEnumerator initWithContext:volumeURL:options:]( objc_alloc(&OBJC_CLASS____LSApplicationRecordEnumerator),  "initWithContext:volumeURL:options:",  0LL,  0LL,  a3);
}

+ (id)enumeratorOnVolumeAtURL:(id)a3 options:(unint64_t)a4
{
  if (!a3)
  {
    [MEMORY[0x1896077D8] currentHandler];
    CFSetRef v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 handleFailureInMethod:a2, a1, @"LSRecord+Enumeration.mm", 37, @"Invalid parameter not satisfying: %@", @"volumeURL != nil" object file lineNumber description];
  }

  if (([a3 isFileURL] & 1) == 0)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 handleFailureInMethod:a2, a1, @"LSRecord+Enumeration.mm", 38, @"Invalid parameter not satisfying: %@", @"volumeURL.fileURL" object file lineNumber description];
  }

  return  -[_LSApplicationRecordEnumerator initWithContext:volumeURL:options:]( objc_alloc(&OBJC_CLASS____LSApplicationRecordEnumerator),  "initWithContext:volumeURL:options:",  0LL,  a3,  a4);
}

+ (id)systemPlaceholderEnumerator
{
  uint64_t v2 = -[_LSApplicationRecordEnumerator initWithContext:volumeURL:options:]( objc_alloc(&OBJC_CLASS____LSApplicationRecordEnumerator),  "initWithContext:volumeURL:options:",  0LL,  0LL,  0LL);
  -[_LSApplicationRecordEnumerator setBundleClass:](v2, "setBundleClass:", 14LL);
  return v2;
}

+ (id)remotePlaceholderEnumerator
{
  uint64_t v2 = -[_LSApplicationRecordEnumerator initWithContext:volumeURL:options:]( objc_alloc(&OBJC_CLASS____LSRemotePlaceholderEnumerator),  "initWithContext:volumeURL:options:",  0LL,  0LL,  64LL);
  -[_LSApplicationRecordEnumerator setBundleClass:](v2, "setBundleClass:", 16LL);
  return v2;
}

- (id)linkedChildApplicationRecordEnumeratorWithOptions:(unint64_t)a3
{
  uint64_t v5 = objc_alloc(&OBJC_CLASS____LSLinkedChildApplicationRecordEnumerator);
  -[LSBundleRecord bundleIdentifier](self, "bundleIdentifier");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = -[_LSLinkedChildApplicationRecordEnumerator initWithContext:parentBundleID:options:]( v5,  "initWithContext:parentBundleID:options:",  0LL,  v6,  a3);

  return v7;
}

+ (id)enumeratorForViableDefaultAppsForCategory:(unint64_t)a3 options:(unint64_t)a4
{
  return  -[_LSApplicationRecordSpecificUnitsEnumerator initWithContext:options:unitIDs:unitCount:]( objc_alloc(&OBJC_CLASS____LSApplicationRecordSpecificUnitsEnumerator),  "initWithContext:options:unitIDs:unitCount:",  0LL,  a4,  0LL,  0LL);
}

+ (id)displayOrderEnumeratorForViableDefaultAppsForCategory:(unint64_t)a3 options:(unint64_t)a4
{
  return  -[_LSApplicationRecordSpecificUnitsEnumerator initWithContext:options:unitIDs:unitCount:]( objc_alloc(&OBJC_CLASS____LSApplicationRecordSpecificUnitsEnumerator),  "initWithContext:options:unitIDs:unitCount:",  0LL,  a4,  0LL,  0LL);
}

void __87__LSApplicationRecord_applicationExtensionRecordsWithContext_tableID_unitID_unitBytes___block_invoke_cold_1( unsigned int a1,  uint64_t a2,  os_log_s *a3)
{
  *(_DWORD *)char v3 = 134349314;
  *(void *)&void v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_2_0( &dword_183E58000,  a2,  a3,  "Could not create appex record for plugin unit %{public}llx! Error: %{public}@",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

- (void)linkedParentApplication
{
  *(_DWORD *)char v3 = 138412546;
  *(void *)&void v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *(void *)(*(void *)a2 + 40LL);
  OUTLINED_FUNCTION_2_0( &dword_183E58000,  a2,  a3,  "could not find parent application with bundle identifier %@: %@",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

- (void)additionalEnvironmentVariables
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138412546;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_3_1();
  _os_log_fault_impl(&dword_183E58000, v1, OS_LOG_TYPE_FAULT, "could not unredact record %@: %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __78__LSApplicationRecord_AlternateIcons__setAlternateIconName_completionHandler___block_invoke_cold_1( uint64_t a1,  uint64_t a2,  os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 138412802;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl( &dword_183E58000,  log,  OS_LOG_TYPE_ERROR,  "Failed to set preferredIconName to %@ for %@ error: %@",  (uint8_t *)&v5,  0x20u);
}

void __56__LSApplicationRecord_AlternateIcons__alternateIconName__block_invoke_2_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_0( &dword_183E58000,  v1,  v2,  "Couldn't fetch alternate icon name for %@, error: %@",  (void)v3,  DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __56__LSApplicationRecord_AlternateIcons__alternateIconName__block_invoke_549_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_0( &dword_183E58000,  v1,  v2,  "Failed to retrieve alternate icon name for bundleID %@ with error: %@",  (void)v3,  DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

@end
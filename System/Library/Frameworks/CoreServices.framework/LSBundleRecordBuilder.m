@interface LSBundleRecordBuilder
- (BOOL)containerized;
- (BOOL)parseInfoPlist:(id)a3;
- (BOOL)parseInstallationInfo:(id)a3;
- (BOOL)registerChildItemsTrusted;
- (BOOL)webNotificationPlaceholder;
- (LSBundleData)buildBundleData:(SEL)a3 error:(id)a4;
- (NSArray)URLClaims;
- (NSArray)activityTypes;
- (NSArray)alternateNames;
- (NSArray)bgPermittedIdentifiers;
- (NSArray)bundlePersonas;
- (NSArray)deviceFamily;
- (NSArray)documentClaims;
- (NSArray)driverExtensionPaths;
- (NSArray)exportedTypes;
- (NSArray)iconFileNames;
- (NSArray)importedTypes;
- (NSArray)libraryItems;
- (NSArray)machOUUIDs;
- (NSArray)queriableSchemes;
- (NSArray)slices;
- (NSArray)supportedComplicationFamilies;
- (NSDictionary)distributorInfo;
- (NSDictionary)entitlements;
- (NSDictionary)extensionSDK;
- (NSDictionary)groupContainers;
- (NSDictionary)iconsDict;
- (NSDictionary)intentDefinitionURLs;
- (NSDictionary)localizedNames;
- (NSDictionary)localizedShortNames;
- (NSDictionary)localizedStrings;
- (NSDictionary)mobileInstallIDs;
- (NSDictionary)pluginMIDicts;
- (NSDictionary)pluginPlists;
- (NSDictionary)sandboxEnvironmentVariables;
- (NSDictionary)stashedAppInfo;
- (NSDictionary)unlocalizedNamesWithContext;
- (NSMutableSet)counterpartAppBundleIDs;
- (NSMutableSet)equivalentBundleIDs;
- (NSNumber)compatibilityState;
- (NSNumber)directoryClass;
- (NSNumber)downloaderDSID;
- (NSNumber)familyID;
- (NSNumber)genreID;
- (NSNumber)installFailureReason;
- (NSNumber)installType;
- (NSNumber)itemID;
- (NSNumber)purchaserDSID;
- (NSNumber)ratingRank;
- (NSNumber)signatureVersion;
- (NSNumber)staticDiskUsage;
- (NSNumber)storefront;
- (NSNumber)versionID;
- (NSString)alternatePrimaryIconName;
- (NSString)appStoreToolsBuildVersion;
- (NSString)appType;
- (NSString)appVariant;
- (NSString)applicationManagementDomain;
- (NSString)bundleName;
- (NSString)categoryType;
- (NSString)codeInfoIdentifier;
- (NSString)complicationPrincipalClass;
- (NSString)displayName;
- (NSString)execPath;
- (NSString)genre;
- (NSString)identifier;
- (NSString)itemName;
- (NSString)libraryPath;
- (NSString)linkedParentBundleID;
- (NSString)managementDeclarationIdentifier;
- (NSString)maxSystemVersion;
- (NSString)minSystemVersion;
- (NSString)primaryIconName;
- (NSString)ratingLabel;
- (NSString)sdkVersion;
- (NSString)secondCategoryType;
- (NSString)shortDisplayName;
- (NSString)shortVersionString;
- (NSString)signerIdentity;
- (NSString)signerOrganization;
- (NSString)sourceAppBundleID;
- (NSString)teamID;
- (NSString)vendorName;
- (NSString)version;
- (NSString)watchKitVersion;
- (NSURL)bundleContainerURL;
- (NSURL)dataContainerURL;
- (id)_LSBundleFlagMap;
- (id)_LSKeyTypeMap;
- (id)_LSPlistRaritiesMap;
- (id)iconsDictionaryFromDict:(id)a3;
- (id)truncate:(BOOL *)a3 queriableSchemesIfNeeded:(id)a4;
- (int)activateBindings:(id)a3 unitID:(unsigned int)a4 bundleData:(const LSBundleData *)a5;
- (int)registerQueriableSchemes:(id)a3 bundleData:(LSBundleData *)a4;
- (unint64_t)sequenceNumber;
- (unsigned)previousInstallType;
- (unsigned)profileValidationState;
- (unsigned)registerBundleRecord:(id)a3 error:(id *)a4;
- (unsigned)retries;
- (void)addBundleFlag:(unint64_t)a3;
- (void)addIconFlag:(unsigned __int8)a3;
- (void)addItemInfoFlag:(unsigned int)a3;
- (void)addPlistFlag:(unsigned int)a3;
- (void)parseActivityTypesFromDictionary:(id)a3;
- (void)parseArchitecturesFromDict:(id)a3;
- (void)parseDeviceFamilyFromDict:(id)a3;
- (void)parseDocumentClaimsFromDict:(id)a3;
- (void)parseIconFilenamesFromDict:(id)a3 forPlatform:(unsigned int)a4;
- (void)parseNSExtensionSDKDefinitionsFromDictionary:(id)a3;
- (void)parseURLClaimsFromDict:(id)a3;
- (void)setCommonInfoPlistKeysFromDictionary:(id)a3;
- (void)setFlagsFromDictionary:(id)a3;
- (void)setPreviousInstallType:(unsigned int)a3;
- (void)setProfileValidationState:(unsigned __int8)a3;
- (void)setRaritiesFromDictionary:(id)a3;
- (void)setRegistrationInfo:(id)a3 alias:(id)a4;
- (void)setRetries:(unsigned __int8)a3;
- (void)setSequenceNumber:(unint64_t)a3;
@end

@implementation LSBundleRecordBuilder

- (void)setRegistrationInfo:(id)a3 alias:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9) {
    v7 = (LSRegistrationInfo *)[v9 mutableCopy];
  }
  else {
    v7 = objc_alloc_init(&OBJC_CLASS___LSRegistrationInfo);
  }
  registrationInfo = self->_registrationInfo;
  self->_registrationInfo = v7;

  self->_bundleClass = self->_registrationInfo->bundleClass;
  self->_itemFlags = self->_registrationInfo->itemFlags;
  if (v6) {
    objc_storeStrong((id *)&self->_bundleAlias, a4);
  }
  *(void *)&self->_hfsCreator = self->_registrationInfo->inoExec;
}

- (void)addBundleFlag:(unint64_t)a3
{
  self->_bundleFlags |= a3;
}

- (void)addPlistFlag:(unsigned int)a3
{
  self->_plistContentFlags |= a3;
}

- (void)addIconFlag:(unsigned __int8)a3
{
  self->_iconFlags |= a3;
}

- (void)addItemInfoFlag:(unsigned int)a3
{
  self->_itemFlags |= a3;
}

- (int)registerQueriableSchemes:(id)a3 bundleData:(LSBundleData *)a4
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v23 = a3;
  context = (void *)MEMORY[0x186E2A59C]();
  id v5 = objc_alloc_init(MEMORY[0x189603FE0]);
  char v28 = 0;
  id v6 = self->_exportedTypes;
  if (v6)
  {
    v7 = v6;
    v8 = -[LSBundleRecordBuilder truncate:queriableSchemesIfNeeded:](self, "truncate:queriableSchemesIfNeeded:", &v28, v6);
    [v5 addObjectsFromArray:v8];
  }

  else
  {
    v8 = 0LL;
  }

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v9 = self->_documentClaims;
  uint64_t v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v24,  v29,  16LL);
  if (v10)
  {
    uint64_t v11 = *(void *)v25;
    uint64_t v12 = *MEMORY[0x189604B08];
    do
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (_NSIsNSDictionary())
        {
          uint64_t v15 = objc_opt_class();
          uint64_t v16 = [v14 objectForKey:v12];
          v17 = (void *)v16;
          if (v15 && v16)
          {
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              v17 = 0LL;
LABEL_16:

              continue;
            }
          }

          else if (!v16)
          {
            goto LABEL_16;
          }

          [v5 addObjectsFromArray:v17];
          goto LABEL_16;
        }
      }

      uint64_t v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v24,  v29,  16LL);
    }

    while (v10);
  }

  if (!v5 || ![v5 count])
  {
    int v19 = 0;
    a4->types = 0;
LABEL_27:
    if (v28) {
      *(_WORD *)&self->_moreFlags |= 4u;
    }
    goto LABEL_29;
  }

  [v5 allObjects];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  a4->types = _LSDatabaseCreateStringArray(v23, v18, 1, 0LL);

  if (a4->types) {
    int v19 = 0;
  }
  else {
    int v19 = -9493;
  }
  if (a4->types) {
    goto LABEL_27;
  }
LABEL_29:

  objc_autoreleasePoolPop(context);
  return v19;
}

- (id)truncate:(BOOL *)a3 queriableSchemesIfNeeded:(id)a4
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  _LSMakeVersionNumber(15LL, 0LL, 0LL, v19);
  v7 = +[_LSCanOpenURLManager sharedManager](&OBJC_CLASS____LSCanOpenURLManager, "sharedManager");
  unint64_t v8 = [v7 schemeQueryLimit];

  __int128 v9 = *(_OWORD *)&self->_sdkVersionNumber._opaque[8];
  *(_OWORD *)uint64_t v16 = *(_OWORD *)&self->_supportedGameControllers;
  *(_OWORD *)&v16[16] = v9;
  v20[0] = v19[0];
  v20[1] = v19[1];
  if ((unint64_t)_LSVersionNumberCompare(v16, v20) > 1 || [v6 count] <= v8)
  {
    BOOL v12 = 0;
    goto LABEL_9;
  }

  _LSInstallLog();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    installType = self->_installType;
    if (!installType) {
      installType = (NSNumber *)self->_shortDisplayName;
    }
    uint64_t v15 = [v6 count];
    *(_DWORD *)uint64_t v16 = 138413058;
    *(void *)&v16[4] = installType;
    *(_WORD *)&v16[12] = 2048;
    *(void *)&v16[14] = v15;
    *(_WORD *)&v16[22] = 2048;
    *(void *)&v16[24] = v8;
    __int16 v17 = 2048;
    unint64_t v18 = v8;
    _os_log_error_impl( &dword_183E58000,  v10,  OS_LOG_TYPE_ERROR,  "Application %@ has requested permission to query %llu URL schemes, but the maximum queriable is %llu. Limiting to the first %llu listed in its Info.plist.",  v16,  0x2Au);
  }

  objc_msgSend(v6, "subarrayWithRange:", 0, v8);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v12 = 1;
  if (!v11)
  {
LABEL_9:
    id v11 = v6;
    if (!a3) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  if (a3) {
LABEL_6:
  }
    *a3 = v12;
LABEL_7:

  return v11;
}

- (id)_LSBundleFlagMap
{
  if (-[LSBundleRecordBuilder _LSBundleFlagMap]::onceToken != -1) {
    dispatch_once(&-[LSBundleRecordBuilder _LSBundleFlagMap]::onceToken, &__block_literal_global_16);
  }
  return (id)-[LSBundleRecordBuilder _LSBundleFlagMap]::bundleFlagMap;
}

void __41__LSBundleRecordBuilder__LSBundleFlagMap__block_invoke()
{
  v3[45] = *MEMORY[0x1895F89C0];
  v2[0] = *MEMORY[0x189604AA0];
  v2[1] = @"LSHasLocalizedDisplayName";
  v3[0] = &unk_189DA7BB8;
  v3[1] = &unk_189DA7BB8;
  v2[2] = @"LSUIElement";
  v2[3] = @"NSUIElement";
  v3[2] = &unk_189DA7BD0;
  v3[3] = &unk_189DA7BD0;
  v2[4] = @"UINewsstandApp";
  v2[5] = @"LSBackgroundOnly";
  v3[4] = &unk_189DA7BE8;
  v3[5] = &unk_189DA7C00;
  v2[6] = @"NSBGOnly";
  v2[7] = @"LSMultipleInstancesProhibited";
  v3[6] = &unk_189DA7C00;
  v3[7] = &unk_189DA7C18;
  v2[8] = @"_LSIsExecutableForParentBundle";
  v2[9] = @"_LSInfoPlistIsMissing";
  v3[8] = &unk_189DA7C30;
  v3[9] = &unk_189DA7C48;
  v2[10] = @"_LSNoExecutableInfo";
  v2[11] = @"LSFileQuarantineEnabled";
  v3[10] = &unk_189DA7C60;
  v3[11] = &unk_189DA7C78;
  v2[12] = @"_LSRequiresOldJavaStub";
  v2[13] = @"_LSRequiresJavaRuntime";
  v3[12] = &unk_189DA7C90;
  v3[13] = &unk_189DA7CA8;
  v2[14] = @"_LSRequiresIPhoneSimulator";
  v2[15] = @"LSRequiresIPhoneOS";
  v3[14] = &unk_189DA7CC0;
  v3[15] = &unk_189DA7CD8;
  v2[16] = @"_LSBundleVersionTooLow";
  v2[17] = @"is-purchased-redownload";
  v3[16] = &unk_189DA7CF0;
  v3[17] = &unk_189DA7D08;
  v2[18] = @"DeviceBasedVPP";
  v2[19] = @"IsPlaceholder";
  v3[18] = &unk_189DA7D20;
  v3[19] = &unk_189DA7D38;
  v2[20] = @"HasMIDBasedSINF";
  v2[21] = @"MissingSINF";
  v3[20] = &unk_189DA7D50;
  v3[21] = &unk_189DA7D68;
  v2[22] = @"RestrictedDownload";
  v2[23] = @"IsParallelPlaceholder";
  v3[22] = &unk_189DA7D80;
  v3[23] = &unk_189DA7D98;
  v2[24] = @"IsUpdatedSystemApp";
  v2[25] = @"IsDeletable";
  v3[24] = &unk_189DA7D98;
  v3[25] = &unk_189DA7DB0;
  v2[26] = @"IsAdHocSigned";
  v2[27] = @"HasSettingsBundle";
  v3[26] = &unk_189DA7DC8;
  v3[27] = &unk_189DA7DE0;
  v2[28] = @"NSSupportsPurgeableLocalStorage";
  v2[29] = @"HasCustomNotificationKey";
  v3[28] = &unk_189DA7DF8;
  v3[29] = &unk_189DA7E10;
  v2[30] = @"HasWatchGlance";
  v2[31] = @"SkipWatchAppInstall";
  v3[30] = &unk_189DA7E28;
  v3[31] = &unk_189DA7E40;
  v2[32] = @"SupportsAudiobooks";
  v2[33] = @"MPSupportsExternallyPlayableContent";
  v3[32] = &unk_189DA7E58;
  v3[33] = &unk_189DA7E70;
  v2[34] = @"UIFileSharingEnabled";
  v2[35] = @"LSSupportsOpeningDocumentsInPlace";
  v3[34] = &unk_189DA7E88;
  v3[35] = &unk_189DA7EA0;
  v2[36] = @"UISupportsDocumentBrowser";
  v2[37] = @"_LSBundleIsInGenerationalStorage";
  v3[36] = &unk_189DA7EA0;
  v3[37] = &unk_189DA7EB8;
  v2[38] = @"_LSBundleIsApplet";
  v2[39] = @"LSApplicationIsStickerProvider";
  v3[38] = &unk_189DA7ED0;
  v3[39] = &unk_189DA7EE8;
  v2[40] = @"LSApplicationLaunchProhibited";
  v2[41] = @"initialODRSize";
  v3[40] = &unk_189DA7EE8;
  v3[41] = &unk_189DA7F00;
  v2[42] = @"gameCenterEnabled";
  v2[43] = @"gameCenterEverEnabled";
  v3[42] = &unk_189DA7F18;
  v3[43] = &unk_189DA7F30;
  v2[44] = @"NSApplicationRequiresArcade";
  v3[44] = &unk_189DA7F48;
  uint64_t v0 = [MEMORY[0x189603F68] dictionaryWithObjects:v3 forKeys:v2 count:45];
  v1 = (void *)-[LSBundleRecordBuilder _LSBundleFlagMap]::bundleFlagMap;
  -[LSBundleRecordBuilder _LSBundleFlagMap]::bundleFlagMap = v0;
}

- (id)_LSPlistRaritiesMap
{
  if (-[LSBundleRecordBuilder _LSPlistRaritiesMap]::onceToken != -1) {
    dispatch_once(&-[LSBundleRecordBuilder _LSPlistRaritiesMap]::onceToken, &__block_literal_global_131_0);
  }
  return (id)-[LSBundleRecordBuilder _LSPlistRaritiesMap]::plistMap;
}

void __44__LSBundleRecordBuilder__LSPlistRaritiesMap__block_invoke()
{
  v3[18] = *MEMORY[0x1895F89C0];
  v2[0] = @"LSLaunchDLabel";
  v2[1] = @"LSFileQuarantineExcludedPathPatterns";
  v3[0] = &unk_189DA7F60;
  v3[1] = &unk_189DA7F78;
  v2[2] = @"MKDirectionsApplicationSupportedModes";
  v2[3] = @"UIBackgroundModes";
  v3[2] = &unk_189DA7F90;
  v3[3] = &unk_189DA7FA8;
  v2[4] = @"AudioComponents";
  v2[5] = @"UIVPNPlugin";
  v3[4] = &unk_189DA7FC0;
  v3[5] = &unk_189DA7FD8;
  v2[6] = @"SBAppTags";
  v2[7] = @"UIRequiredDeviceCapabilities";
  v3[6] = &unk_189DA7FF0;
  v3[7] = &unk_189DA8008;
  v2[8] = @"UISupportedExternalAccessoryProtocols";
  v2[9] = @"LSMinimumSystemVersionByArchitecture";
  v3[8] = &unk_189DA8020;
  v3[9] = &unk_189DA8038;
  v2[10] = @"LSEnvironment";
  v2[11] = @"storeCohort";
  v3[10] = &unk_189DA8050;
  v3[11] = &unk_189DA8068;
  v2[12] = @"subgenres";
  v2[13] = @"INIntentsSupported";
  v3[12] = &unk_189DA8080;
  v3[13] = &unk_189DA8098;
  v2[14] = @"INIntentsRestrictedWhileLocked";
  v2[15] = @"INIntentsRestrictedWhileProtectedDataUnavailable";
  v3[14] = &unk_189DA8098;
  v3[15] = &unk_189DA8098;
  v2[16] = @"INSupportedMediaCategories";
  v2[17] = @"LSEligibilityDeletionDomain";
  v3[16] = &unk_189DA8098;
  v3[17] = &unk_189DA80B0;
  uint64_t v0 = [MEMORY[0x189603F68] dictionaryWithObjects:v3 forKeys:v2 count:18];
  v1 = (void *)-[LSBundleRecordBuilder _LSPlistRaritiesMap]::plistMap;
  -[LSBundleRecordBuilder _LSPlistRaritiesMap]::plistMap = v0;
}

- (id)_LSKeyTypeMap
{
  if (-[LSBundleRecordBuilder _LSKeyTypeMap]::onceToken != -1) {
    dispatch_once(&-[LSBundleRecordBuilder _LSKeyTypeMap]::onceToken, &__block_literal_global_184_0);
  }
  return (id)-[LSBundleRecordBuilder _LSKeyTypeMap]::typeMap;
}

void __38__LSBundleRecordBuilder__LSKeyTypeMap__block_invoke()
{
  v3[13] = *MEMORY[0x1895F89C0];
  v2[0] = @"LSLaunchDLabel";
  v3[0] = objc_opt_class();
  v2[1] = @"LSFileQuarantineExcludedPathPatterns";
  v3[1] = objc_opt_class();
  v2[2] = @"MKDirectionsApplicationSupportedModes";
  v3[2] = objc_opt_class();
  v2[3] = @"UIBackgroundModes";
  v3[3] = objc_opt_class();
  v2[4] = @"AudioComponents";
  v3[4] = objc_opt_class();
  v2[5] = @"SBAppTags";
  v3[5] = objc_opt_class();
  v2[6] = @"UIRequiredDeviceCapabilities";
  v3[6] = objc_opt_class();
  v2[7] = @"UISupportedExternalAccessoryProtocols";
  v3[7] = objc_opt_class();
  v2[8] = @"LSMinimumSystemVersionByArchitecture";
  v3[8] = objc_opt_class();
  v2[9] = @"LSEnvironment";
  v3[9] = objc_opt_class();
  v2[10] = @"storeCohort";
  v3[10] = objc_opt_class();
  v2[11] = @"subgenres";
  v3[11] = objc_opt_class();
  v2[12] = @"LSEligibilityDeletionDomain";
  v3[12] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x189603F68] dictionaryWithObjects:v3 forKeys:v2 count:13];
  v1 = (void *)-[LSBundleRecordBuilder _LSKeyTypeMap]::typeMap;
  -[LSBundleRecordBuilder _LSKeyTypeMap]::typeMap = v0;
}

- (void)setFlagsFromDictionary:(id)a3
{
  id v4 = a3;
  -[LSBundleRecordBuilder _LSBundleFlagMap](self, "_LSBundleFlagMap");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __48__LSBundleRecordBuilder_setFlagsFromDictionary___block_invoke;
  v11[3] = &unk_189D74AD0;
  id v6 = v4;
  id v12 = v6;
  v13 = self;
  [v5 enumerateKeysAndObjectsUsingBlock:v11];

  [v6 objectForKey:*MEMORY[0x189604AA0]];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7) {
    -[LSBundleRecordBuilder addBundleFlag:](self, "addBundleFlag:", 2LL);
  }
  [v6 objectForKey:@"Java"];
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8) {
    -[LSBundleRecordBuilder addBundleFlag:](self, "addBundleFlag:", 0x2000LL);
  }
  registrationInfo = self->_registrationInfo;
  if (registrationInfo)
  {
    if (registrationInfo->bundleClass == 2)
    {
      char v10 = 0;
      -[LSBundleRecordBuilder addItemInfoFlag:]( self,  "addItemInfoFlag:",  _LSGetApplicationFlagsFromPlist( (const __CFDictionary *)v6,  0LL,  (LOBYTE(registrationInfo->itemFlags) >> 3) & 1,  0,  0,  &v10));
      if (v10) {
        -[LSBundleRecordBuilder addBundleFlag:](self, "addBundleFlag:", 0x2000000000LL);
      }
    }
  }
}

void __48__LSBundleRecordBuilder_setFlagsFromDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
}

- (void)setRaritiesFromDictionary:(id)a3
{
  id v4 = a3;
  -[LSBundleRecordBuilder _LSPlistRaritiesMap](self, "_LSPlistRaritiesMap");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __51__LSBundleRecordBuilder_setRaritiesFromDictionary___block_invoke;
  v7[3] = &unk_189D74AD0;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

void __51__LSBundleRecordBuilder_setRaritiesFromDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) _LSKeyTypeMap];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = (id)[v6 objectForKey:v14];

  uint64_t v8 = [*(id *)(a1 + 40) objectForKey:v14];
  __int128 v9 = (void *)v8;
  if (v7 && v8)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      __int128 v9 = 0LL;
      goto LABEL_9;
    }
  }

  else if (!v8)
  {
    goto LABEL_9;
  }

  char v10 = *(void **)(a1 + 32);
  if (!v10[15])
  {
    uint64_t v11 = [objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:0];
    uint64_t v12 = *(void *)(a1 + 32);
    v13 = *(void **)(v12 + 120);
    *(void *)(v12 + 120) = v11;

    char v10 = *(void **)(a1 + 32);
  }

  objc_msgSend(v10, "addPlistFlag:", objc_msgSend(v5, "unsignedLongLongValue"));
  [*(id *)(*(void *)(a1 + 32) + 120) setObject:v9 forKey:v14];
LABEL_9:
}

- (void)setCommonInfoPlistKeysFromDictionary:(id)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __62__LSBundleRecordBuilder_setCommonInfoPlistKeysFromDictionary___block_invoke;
  v3[3] = &unk_189D74AF8;
  v3[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v3];
}

void __62__LSBundleRecordBuilder_setCommonInfoPlistKeysFromDictionary___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (_NSIsNSString() && _LSBundleInfoPlistKeyIsCommon(v10))
  {
    id v6 = *(void **)(*(void *)(a1 + 32) + 128LL);
    if (!v6)
    {
      uint64_t v7 = [objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:0];
      uint64_t v8 = *(void *)(a1 + 32);
      __int128 v9 = *(void **)(v8 + 128);
      *(void *)(v8 + 128) = v7;

      id v6 = *(void **)(*(void *)(a1 + 32) + 128LL);
    }

    [v6 setObject:v5 forKey:v10];
  }
}

- (void)parseArchitecturesFromDict:(id)a3
{
  id v6 = a3;
  [v6 objectForKey:@"_LSSliceInfosKey"];
  id v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  mobileInstallIDs = self->_mobileInstallIDs;
  self->_mobileInstallIDs = v4;
}

- (id)iconsDictionaryFromDict:(id)a3
{
  v32[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [v4 objectForKey:@"CFBundleIcons"];
  uint64_t v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v7 = 0LL;
  }

  uint64_t v9 = objc_msgSend(v4, "_LS_BoolForKey:", @"UIPrerenderedIcon");
  if ((_DWORD)v9) {
    -[LSBundleRecordBuilder addIconFlag:](self, "addIconFlag:", 2LL);
  }
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = [v7 objectForKey:@"CFBundlePrimaryIcon"];
  uint64_t v12 = (void *)v11;
  if (!v10 || !v11)
  {
    if (!v11) {
      goto LABEL_15;
    }
LABEL_14:
    [MEMORY[0x189603FC8] dictionaryWithDictionary:v7];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = @"CFBundleIconName";
    v32[0] = v12;
    [MEMORY[0x189603F68] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 setObject:v14 forKeyedSubscript:@"CFBundlePrimaryIcon"];

    uint64_t v15 = [v13 copy];
    uint64_t v7 = (void *)v15;
    goto LABEL_15;
  }

  if ((objc_opt_isKindOfClass() & 1) != 0) {
    goto LABEL_14;
  }

  uint64_t v12 = 0LL;
LABEL_15:
  if (!v7 || ![v7 count])
  {
    [v4 objectForKey:@"CFBundleIconFiles"];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSArray())
    {
      id v17 = v16;
      id v18 = 0LL;
      if (!v17) {
        goto LABEL_29;
      }
      goto LABEL_23;
    }

    if (_NSIsNSString())
    {
      id v18 = v16;
      if (v18) {
        goto LABEL_22;
      }
    }

    else
    {
      uint64_t v22 = objc_opt_class();
      uint64_t v23 = [v4 objectForKey:*MEMORY[0x189604AB0]];
      __int128 v24 = (void *)v23;
      if (v22 && v23 && (objc_opt_isKindOfClass() & 1) == 0)
      {

        id v18 = 0LL;
      }

      else
      {
        id v18 = v24;
        if (v24)
        {
LABEL_22:
          id v30 = v18;
          [MEMORY[0x189603F18] arrayWithObjects:&v30 count:1];
          id v17 = (id)objc_claimAutoreleasedReturnValue();
          if (!v17)
          {
LABEL_29:

            goto LABEL_30;
          }

- (void)parseIconFilenamesFromDict:(id)a3 forPlatform:(unsigned int)a4
{
  id v10 = a3;
  -[LSBundleRecordBuilder iconsDictionaryFromDict:](self, "iconsDictionaryFromDict:");
  uint64_t v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  alternatePrimaryIconName = self->_alternatePrimaryIconName;
  self->_alternatePrimaryIconName = v6;

  if (_LSIconDictionarySupportsAssetCatalogs(self->_alternatePrimaryIconName))
  {
    -[LSBundleRecordBuilder addIconFlag:](self, "addIconFlag:", 4LL);
    _LSIconDictionaryGetPrimaryIconName(self->_alternatePrimaryIconName);
    BOOL v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    distributorInfo = self->_distributorInfo;
    self->_distributorInfo = v8;
  }

  if (a4 - 13 <= 0xFFFFFFFD && _LSIconDictionarySupportsAlternateIcons((NSDictionary *)self->_alternatePrimaryIconName)) {
    -[LSBundleRecordBuilder addIconFlag:](self, "addIconFlag:", 8LL);
  }
}

- (void)parseDeviceFamilyFromDict:(id)a3
{
  v8[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 objectForKey:@"UIDeviceFamily"];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    [v4 objectForKey:@"DeviceFamily"];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      [v4 objectForKey:@"ProductType"];
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  if (_NSIsNSArray())
  {
    objc_storeStrong((id *)&self->_activityTypes, v5);
  }

  else if ((_NSIsNSString() & 1) != 0 || _NSIsNSNumber())
  {
    v8[0] = v5;
    [MEMORY[0x189603F18] arrayWithObjects:v8 count:1];
    uint64_t v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    activityTypes = self->_activityTypes;
    self->_activityTypes = v6;
  }
}

- (void)parseDocumentClaimsFromDict:(id)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v19 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [v19 objectForKey:*MEMORY[0x189604AA8]];
  uint64_t v6 = (NSArray *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v6 = 0LL;
  }

  libraryItems = self->_libraryItems;
  self->_libraryItems = v6;

  uint64_t v9 = self->_libraryItems;
  if (!v9) {
    goto LABEL_26;
  }
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v10 = v9;
  uint64_t v11 = -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
  if (!v11) {
    goto LABEL_25;
  }
  uint64_t v12 = *(void *)v21;
  uint64_t v13 = *MEMORY[0x189604AF0];
  while (2)
  {
    for (uint64_t i = 0LL; i != v11; ++i)
    {
      if (*(void *)v21 != v12) {
        objc_enumerationMutation(v10);
      }
      uint64_t v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
      if (_NSIsNSDictionary())
      {
        uint64_t v16 = objc_opt_class();
        uint64_t v17 = [v15 objectForKey:v13];
        id v18 = (void *)v17;
        if (v16 && v17)
        {
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            id v18 = 0LL;
LABEL_20:

            continue;
          }
        }

        else if (!v17)
        {
          goto LABEL_20;
        }

        if (![v18 caseInsensitiveCompare:@"Shell"])
        {
          *(_WORD *)&self->_moreFlags |= 0x100u;

          goto LABEL_25;
        }

        goto LABEL_20;
      }
    }

    uint64_t v11 = -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
    if (v11) {
      continue;
    }
    break;
  }

- (void)parseURLClaimsFromDict:(id)a3
{
  v16[2] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [v4 objectForKey:@"PrivateURLSchemes"];
  BOOL v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    BOOL v7 = 0LL;
  }

  uint64_t v9 = objc_opt_class();
  uint64_t v10 = [v4 objectForKey:*MEMORY[0x189604B10]];
  uint64_t v11 = (void *)v10;
  if (v9 && v10 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    if (v7) {
      goto LABEL_14;
    }
    uint64_t v11 = 0LL;
LABEL_17:
    objc_storeStrong((id *)&self->_documentClaims, v11);
    goto LABEL_18;
  }

  if (!v7) {
    goto LABEL_17;
  }
  if (!v11)
  {
LABEL_14:
    [MEMORY[0x189603FA8] arrayWithCapacity:0];
    uint64_t v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = 0LL;
    goto LABEL_15;
  }

  uint64_t v12 = (NSArray *)[v11 mutableCopy];
LABEL_15:
  v15[0] = *MEMORY[0x189604B08];
  v15[1] = @"CFBundleURLIsPrivate";
  v16[0] = v7;
  v16[1] = MEMORY[0x189604A88];
  [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:v15 count:2];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](v12, "addObject:", v13);
  documentClaims = self->_documentClaims;
  self->_documentClaims = v12;

LABEL_18:
}

- (BOOL)parseInfoPlist:(id)a3
{
  uint64_t v250 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if ((_NSIsNSDictionary() & 1) == 0) {
    goto LABEL_29;
  }
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [v4 objectForKey:*MEMORY[0x189604E00]];
  BOOL v7 = (NSNumber *)v6;
  if (v5 && v6 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    BOOL v7 = 0LL;
  }

  installType = self->_installType;
  self->_installType = v7;

  if (!self->_installType)
  {
LABEL_29:
    BOOL v23 = 0;
    goto LABEL_288;
  }

  uint64_t v9 = objc_opt_class();
  uint64_t v10 = [v4 objectForKey:@"LSExecutableSDKVersion"];
  uint64_t v11 = (void *)v10;
  if (v9 && v10 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v11 = 0LL;
  }

  maxSystemVersion = self->_maxSystemVersion;
  self->_maxSystemVersion = (NSString *)v11;

  uint64_t v13 = self->_maxSystemVersion;
  if (v13)
  {
    _LSVersionNumberMakeWithString(buf, v13);
    __int128 v14 = v249;
    *(_OWORD *)&self->_supportedGameControllers = *(_OWORD *)buf;
    *(_OWORD *)&self->_sdkVersionNumber._opaque[8] = v14;
  }

  -[LSBundleRecordBuilder setFlagsFromDictionary:](self, "setFlagsFromDictionary:", v4);
  -[LSBundleRecordBuilder setRaritiesFromDictionary:](self, "setRaritiesFromDictionary:", v4);
  -[LSBundleRecordBuilder setCommonInfoPlistKeysFromDictionary:](self, "setCommonInfoPlistKeysFromDictionary:", v4);
  [v4 valueForKey:@"LSIsSecuredSystemContent"];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    char v16 = 0;
  }
  *((_BYTE *)&self->_moreFlags + 2) = *((_BYTE *)&self->_moreFlags + 2) & 0xEF | v16;

  else {
    __int16 v17 = 0;
  }
  *(_WORD *)&self->_moreFlags = *(_WORD *)&self->_moreFlags & 0xFF7F | v17;
  else {
    __int16 v18 = 0;
  }
  *(_WORD *)&self->_moreFlags = *(_WORD *)&self->_moreFlags & 0xFFDF | v18;
  else {
    __int16 v19 = 0;
  }
  *(_WORD *)&self->_moreFlags = *(_WORD *)&self->_moreFlags & 0xFFBF | v19;
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = [v4 objectForKey:@"_LSIsLinkEnabled"];
  __int128 v22 = (void *)v21;
  if (!v20 || !v21)
  {
    if (!v21) {
      goto LABEL_36;
    }
    goto LABEL_31;
  }

  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_31:
    else {
      char v24 = 0;
    }
    *((_BYTE *)&self->_moreFlags + 2) = *((_BYTE *)&self->_moreFlags + 2) & 0xF7 | v24;
  }

LABEL_36:
  [v4 objectForKey:@"_LSIsLinkEnabled"];
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    char v26 = 0;
  }
  *((_BYTE *)&self->_moreFlags + 2) = *((_BYTE *)&self->_moreFlags + 2) & 0xF7 | v26;

  uint64_t v27 = objc_opt_class();
  uint64_t v28 = [v4 objectForKey:@"PurchaserID"];
  v29 = (NSArray *)v28;
  if (v27 && v28 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v29 = 0LL;
  }

  iconFileNames = self->_iconFileNames;
  self->_iconFileNames = v29;

  self->_minSystemVersionPlatform = _LSGetRawOSTypeForPossibleString((const __CFString *)[v4 objectForKey:*MEMORY[0x189604AB8]]);
  self->_uint64_t baseFlags = 0;
  uint64_t v31 = objc_opt_class();
  uint64_t v32 = [v4 objectForKey:@"LSExecutablePlatformKey"];
  v33 = (void *)v32;
  if (v31 && v32)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_49;
    }
    goto LABEL_48;
  }

  if (v32)
  {
LABEL_48:
    self->_uint64_t baseFlags = (LSBundleBaseFlags)[v33 unsignedLongLongValue];
LABEL_49:
  }

  uint64_t v34 = objc_opt_class();
  uint64_t v35 = [v4 objectForKey:@"DTAppStoreToolsBuild"];
  v36 = (void *)v35;
  if (v34 && v35 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v36 = 0LL;
  }

  sdkVersion = self->_sdkVersion;
  self->_sdkVersion = (NSString *)v36;

  uint64_t v38 = objc_opt_class();
  uint64_t v39 = [v4 objectForKey:*MEMORY[0x189604E18]];
  v40 = (NSNumber *)v39;
  if (v38 && v39 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v40 = 0LL;
  }

  installFailureReason = self->_installFailureReason;
  self->_installFailureReason = v40;

  uint64_t baseFlags = self->_baseFlags;
  _LSVersionNumberMakeWithString(v247, self->_maxSystemVersion);
  _LSGetMinimumOSVersionStringAndReferencePlatformForPlatformSDKLinkage( v4,  baseFlags,  v247,  (id *)&self->_version,  &self->_platform);
  uint64_t v43 = objc_opt_class();
  uint64_t v44 = [v4 objectForKey:@"LSMaximumSystemVersion"];
  v45 = (void *)v44;
  if (v43 && v44 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v45 = 0LL;
  }

  minSystemVersion = self->_minSystemVersion;
  self->_minSystemVersion = (NSString *)v45;

  uint64_t v47 = objc_opt_class();
  uint64_t v48 = [v4 objectForKey:*MEMORY[0x189604AC8]];
  v49 = (void *)v48;
  if (v47 && v48 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v49 = 0LL;
  }

  appStoreToolsBuildVersion = self->_appStoreToolsBuildVersion;
  self->_appStoreToolsBuildVersion = (NSString *)v49;

  uint64_t v51 = objc_opt_class();
  uint64_t v236 = *MEMORY[0x189604E10];
  uint64_t v52 = objc_msgSend(v4, "objectForKey:");
  v53 = (void *)v52;
  if (v51 && v52 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v53 = 0LL;
  }

  shortDisplayName = self->_shortDisplayName;
  self->_shortDisplayName = (NSString *)v53;

  uint64_t v55 = objc_opt_class();
  uint64_t v235 = *MEMORY[0x189604AA0];
  uint64_t v56 = objc_msgSend(v4, "objectForKey:");
  v57 = (void *)v56;
  if (v55 && v56 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v57 = 0LL;
  }

  identifier = self->_identifier;
  self->_identifier = (NSString *)v57;

  uint64_t v59 = objc_opt_class();
  uint64_t v60 = [v4 objectForKey:v236];
  v61 = (void *)v60;
  if (v59 && v60 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v61 = 0LL;
  }

  displayName = self->_displayName;
  self->_displayName = (NSString *)v61;

  uint64_t v63 = objc_opt_class();
  uint64_t v64 = [v4 objectForKey:@"artistName"];
  v65 = (void *)v64;
  if (v63 && v64 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v65 = 0LL;
  }

  secondCategoryType = self->_secondCategoryType;
  self->_secondCategoryType = (NSString *)v65;

  uint64_t v67 = objc_opt_class();
  uint64_t v68 = [v4 objectForKey:@"itemName"];
  v69 = (void *)v68;
  if (v67 && v68 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v69 = 0LL;
  }

  signerOrganization = self->_signerOrganization;
  self->_signerOrganization = (NSString *)v69;

  uint64_t v71 = objc_opt_class();
  uint64_t v72 = [v4 objectForKey:@"s"];
  v73 = (void *)v72;
  if (v71 && v72 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v73 = 0LL;
  }

  itemName = self->_itemName;
  self->_itemName = (NSString *)v73;

  uint64_t v75 = objc_opt_class();
  uint64_t v76 = [v4 objectForKey:@"softwareVersionExternalIdentifier"];
  v77 = (NSNumber *)v76;
  if (v75 && v76 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v77 = 0LL;
  }

  storefront = self->_storefront;
  self->_storefront = v77;

  if (!self->_storefront)
  {
    uint64_t v79 = objc_opt_class();
    uint64_t v80 = [v4 objectForKey:@"betaExternalVersionIdentifier"];
    v81 = (NSNumber *)v80;
    if (v79 && v80 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      v81 = 0LL;
    }

    v82 = self->_storefront;
    self->_storefront = v81;
  }

  uint64_t v83 = objc_opt_class();
  uint64_t v84 = [v4 objectForKey:@"sourceApp"];
  v85 = (NSNumber *)v84;
  if (v83 && v84 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v85 = 0LL;
  }

  versionID = self->_versionID;
  self->_versionID = v85;

  uint64_t v87 = objc_opt_class();
  uint64_t v88 = [v4 objectForKey:@"variantID"];
  v89 = (void *)v88;
  if (v87 && v88 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v89 = 0LL;
  }

  sourceAppBundleID = self->_sourceAppBundleID;
  self->_sourceAppBundleID = (NSString *)v89;

  uint64_t v91 = objc_opt_class();
  uint64_t v92 = [v4 objectForKey:@"_LSExecutablePath"];
  v93 = (void *)v92;
  if (v91 && v92 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v93 = 0LL;
  }

  shortVersionString = self->_shortVersionString;
  self->_shortVersionString = (NSString *)v93;

  uint64_t v95 = objc_opt_class();
  uint64_t v96 = [v4 objectForKey:@"genre"];
  v97 = (NSNumber *)v96;
  if (v95 && v96 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v97 = 0LL;
  }

  ratingRank = self->_ratingRank;
  self->_ratingRank = v97;

  uint64_t v99 = objc_opt_class();
  uint64_t v100 = [v4 objectForKey:@"distributorInfo"];
  v101 = (NSNumber *)v100;
  if (v99 && v100 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v101 = 0LL;
  }

  genreID = self->_genreID;
  self->_genreID = v101;

  uint64_t v103 = objc_opt_class();
  uint64_t v104 = [v4 objectForKey:@"managementDeclarationIdentifier"];
  v105 = (void *)v104;
  if (v103 && v104 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v105 = 0LL;
  }

  appVariant = self->_appVariant;
  self->_appVariant = (NSString *)v105;

  v107 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
  counterpartAppBundleIDs = self->_counterpartAppBundleIDs;
  self->_counterpartAppBundleIDs = v107;

  v109 = (NSString *)objc_alloc_init(MEMORY[0x189603FE0]);
  managementDeclarationIdentifier = self->_managementDeclarationIdentifier;
  self->_managementDeclarationIdentifier = v109;

  uint64_t v111 = objc_opt_class();
  uint64_t v112 = [v4 objectForKey:@"LSCounterpartIdentifiers"];
  v237 = (void *)v112;
  uint64_t v113 = v112;
  if (v111 && v112)
  {
    uint64_t v113 = v112;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

LABEL_130:
      v237 = 0LL;
      goto LABEL_131;
    }
  }

  else if (!v112)
  {
    goto LABEL_130;
  }

  -[NSString addObjectsFromArray:](self->_managementDeclarationIdentifier, "addObjectsFromArray:", v113);
  -[NSMutableSet addObjectsFromArray:](self->_counterpartAppBundleIDs, "addObjectsFromArray:", v113);
LABEL_131:
  uint64_t v114 = objc_opt_class();
  uint64_t v115 = [v4 objectForKey:@"NSEquivalentBundleIdentifiers"];
  v116 = (void *)v115;
  if (!v114 || !v115)
  {
    if (!v115) {
      goto LABEL_137;
    }
LABEL_136:
    -[NSMutableSet addObjectsFromArray:](self->_counterpartAppBundleIDs, "addObjectsFromArray:", v116);
    goto LABEL_137;
  }

  if ((objc_opt_isKindOfClass() & 1) != 0) {
    goto LABEL_136;
  }

  v116 = 0LL;
LABEL_137:
  uint64_t v117 = objc_opt_class();
  uint64_t v118 = [v4 objectForKey:@"label"];
  v119 = (NSArray *)v118;
  if (v117 && v118 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v119 = 0LL;
  }

  supportedComplicationFamilies = self->_supportedComplicationFamilies;
  self->_supportedComplicationFamilies = v119;

  uint64_t v121 = objc_opt_class();
  uint64_t v122 = [v4 objectForKey:@"itemId"];
  v123 = (NSArray *)v122;
  if (v121 && v122 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v123 = 0LL;
  }

  machOUUIDs = self->_machOUUIDs;
  self->_machOUUIDs = v123;

  uint64_t v125 = objc_opt_class();
  uint64_t v126 = [v4 objectForKey:@"rank"];
  v127 = (void *)v126;
  if (v125 && v126 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v127 = 0LL;
  }

  ratingLabel = self->_ratingLabel;
  self->_ratingLabel = (NSString *)v127;

  uint64_t v129 = objc_opt_class();
  uint64_t v130 = [v4 objectForKey:@"genreId"];
  v131 = (void *)v130;
  if (v129 && v130 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v131 = 0LL;
  }

  genre = self->_genre;
  self->_genre = (NSString *)v131;

  uint64_t v133 = objc_opt_class();
  uint64_t v134 = [v4 objectForKey:@"MachOUUIDs"];
  v135 = (void *)v134;
  if (v133 && v134 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v135 = 0LL;
  }

  execPath = self->_execPath;
  self->_execPath = (NSString *)v135;

  uint64_t v137 = objc_opt_class();
  uint64_t v138 = [v4 objectForKey:@"LSApplicationQueriesSchemes"];
  v139 = (NSArray *)v138;
  if (v137 && v138 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v139 = 0LL;
  }

  exportedTypes = self->_exportedTypes;
  self->_exportedTypes = v139;

  uint64_t v141 = objc_opt_class();
  uint64_t v142 = [v4 objectForKey:@"_LSBundleLibraryPath"];
  v143 = (NSNumber *)v142;
  if (v141 && v142 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v143 = 0LL;
  }

  staticDiskUsage = self->_staticDiskUsage;
  self->_staticDiskUsage = v143;

  uint64_t v145 = objc_opt_class();
  uint64_t v146 = [v4 objectForKey:@"_LSBundleLibraryItems"];
  v147 = (void *)v146;
  if (v145 && v146 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v147 = 0LL;
  }

  libraryPath = self->_libraryPath;
  self->_libraryPath = (NSString *)v147;

  uint64_t v149 = objc_opt_class();
  uint64_t v150 = [v4 objectForKey:@"UTExportedTypeDeclarations"];
  v151 = (NSArray *)v150;
  if (v149 && v150 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v151 = 0LL;
  }

  importedTypes = self->_importedTypes;
  self->_importedTypes = v151;

  uint64_t v153 = objc_opt_class();
  uint64_t v154 = [v4 objectForKey:@"UTImportedTypeDeclarations"];
  v155 = (NSArray *)v154;
  if (v153 && v154 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v155 = 0LL;
  }

  URLClaims = self->_URLClaims;
  self->_URLClaims = v155;

  -[LSBundleRecordBuilder parseDocumentClaimsFromDict:](self, "parseDocumentClaimsFromDict:", v4);
  uint64_t v157 = objc_opt_class();
  uint64_t v158 = [v4 objectForKey:@"_LSBundlePlugins"];
  v159 = (NSArray *)v158;
  if (v157 && v158 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v159 = 0LL;
  }

  queriableSchemes = self->_queriableSchemes;
  self->_queriableSchemes = v159;

  uint64_t v161 = objc_opt_class();
  uint64_t v162 = [v4 objectForKey:@"_LSIntentDefinitionURLs"];
  v163 = (NSDictionary *)v162;
  if (v161 && v162 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v163 = 0LL;
  }

  extensionSDK = self->_extensionSDK;
  self->_extensionSDK = v163;

  uint64_t v165 = objc_opt_class();
  uint64_t v166 = [v4 objectForKey:@"BGTaskSchedulerPermittedIdentifiers"];
  v167 = (NSDictionary *)v166;
  if (v165 && v166 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v167 = 0LL;
  }

  intentDefinitionURLs = self->_intentDefinitionURLs;
  self->_intentDefinitionURLs = v167;

  uint64_t v169 = objc_opt_class();
  uint64_t v170 = [v4 objectForKey:@"GCSupportsControllerUserInteraction"];
  v171 = (void *)v170;
  if (v169 && v170)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_195;
    }
    goto LABEL_194;
  }

  if (v170)
  {
LABEL_194:
    *(_WORD *)&self->_moreFlags = *(_WORD *)&self->_moreFlags & 0xFFFE | [v171 BOOLValue];
LABEL_195:
  }

  uint64_t v172 = objc_opt_class();
  uint64_t v173 = [v4 objectForKey:@"GCSupportedGameControllers"];
  v174 = (NSMutableDictionary *)v173;
  if (v172 && v173 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v174 = 0LL;
  }

  commonInfoPlistEntries = self->_commonInfoPlistEntries;
  self->_commonInfoPlistEntries = v174;

  uint64_t v176 = objc_opt_class();
  uint64_t v177 = [v4 objectForKey:@"_LSLocalizedStringsDictionary"];
  v178 = (void *)v177;
  if (v176 && v177)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v178 = 0LL;
      goto LABEL_215;
    }
  }

  else if (!v177)
  {
    goto LABEL_215;
  }

  v179 = (void *)objc_opt_class();
  v180 = (void *)objc_opt_class();
  if (_LSIsDictionaryWithKeysAndValuesOfClass(v178, v179, v180))
  {
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&__int128 v249 = 0x2020000000LL;
    uint64_t v181 = MEMORY[0x1895F87A8];
    BYTE8(v249) = 1;
    v245[0] = MEMORY[0x1895F87A8];
    v245[1] = 3221225472LL;
    v245[2] = __40__LSBundleRecordBuilder_parseInfoPlist___block_invoke;
    v245[3] = &unk_189D74B20;
    v245[4] = buf;
    [v178 enumerateKeysAndObjectsUsingBlock:v245];
    if (*(_BYTE *)(*(void *)&buf[8] + 24LL))
    {
      objc_storeStrong((id *)&self->_localizedShortNames, v178);
      [v178 objectForKeyedSubscript:v235];
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      v183 = v182;
      if (v182 && [v182 count]) {
        objc_storeStrong((id *)&self->_bgPermittedIdentifiers, v183);
      }

      [v178 objectForKeyedSubscript:v236];
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      v185 = v184;
      if (v184 && [v184 count]) {
        objc_storeStrong((id *)&self->_localizedNames, v185);
      }

      v242[0] = v181;
      v242[1] = 3221225472LL;
      v242[2] = __40__LSBundleRecordBuilder_parseInfoPlist___block_invoke_2;
      v242[3] = &unk_189D74B48;
      id v186 = objc_alloc_init(MEMORY[0x189603FC8]);
      id v243 = v186;
      id v244 = v4;
      _LSBundleDisplayNameContextEnumerate(v242, v187, v188, v189, v190);
      v191 = (NSDictionary *)[v186 copy];
      localizedStrings = self->_localizedStrings;
      self->_localizedStrings = v191;
    }

    _Block_object_dispose(buf, 8);
  }

void __40__LSBundleRecordBuilder_parseInfoPlist___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v8 = a3;
  uint64_t v6 = (void *)objc_opt_class();
  BOOL v7 = (void *)objc_opt_class();
  if ((_LSIsDictionaryWithKeysAndValuesOfClass(v8, v6, v7) & 1) == 0)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    *a4 = 1;
  }
}

void __40__LSBundleRecordBuilder_parseInfoPlist___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = [v6 objectForKey:a4];
  id v9 = (id)v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    id v11 = (id)v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v9 = v11;
    }

    else
    {

      id v9 = 0LL;
    }
  }

  id v12 = v9;
  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:a4];
}

- (BOOL)parseInstallationInfo:(id)a3
{
  uint64_t v138 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  char v5 = _NSIsNSDictionary();
  if ((v5 & 1) == 0) {
    goto LABEL_150;
  }
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [v4 objectForKey:@"Entitlements"];
  uint64_t v8 = (NSDictionary *)v7;
  if (v6 && v7 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v8 = 0LL;
  }

  groupContainers = self->_groupContainers;
  self->_groupContainers = v8;

  BOOL v10 = self->_groupContainers;
  if (v10 && (*(_WORD *)&self->_moreFlags & 0x200) == 0) {
    -[NSDictionary enumerateKeysAndObjectsWithOptions:usingBlock:]( v10,  "enumerateKeysAndObjectsWithOptions:usingBlock:",  0LL,  &__block_literal_global_317);
  }
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = [v4 objectForKey:@"BundleContainer"];
  uint64_t v13 = (void *)v12;
  if (v11 && v12)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }

  if (v12)
  {
LABEL_14:
    __int128 v14 = (NSURL *)[objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:v13 isDirectory:1];
    dataContainerURL = self->_dataContainerURL;
    self->_dataContainerURL = v14;

LABEL_15:
  }

  -[LSBundleRecordBuilder setFlagsFromDictionary:](self, "setFlagsFromDictionary:", v4);
  -[LSBundleRecordBuilder setRaritiesFromDictionary:](self, "setRaritiesFromDictionary:", v4);
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = [v4 objectForKey:@"CompatibilityState"];
  __int16 v18 = (void *)v17;
  if (v16 && v17 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    __int16 v18 = 0LL;
  }

  __int16 v19 = *(void **)&self->_containerized;
  *(void *)&self->_containerized = v18;

  uint64_t v20 = objc_opt_class();
  uint64_t v21 = [v4 objectForKey:@"PlaceholderFailureReason"];
  __int128 v22 = (NSNumber *)v21;
  if (v20 && v21 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    __int128 v22 = 0LL;
  }

  compatibilityState = self->_compatibilityState;
  self->_compatibilityState = v22;

  uint64_t v24 = objc_opt_class();
  uint64_t v25 = [v4 objectForKey:@"LSInstallType"];
  char v26 = (NSArray *)v25;
  if (v24 && v25 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    char v26 = 0LL;
  }

  deviceFamily = self->_deviceFamily;
  self->_deviceFamily = v26;

  int v28 = objc_msgSend(v4, "_LS_BoolForKey:", @"IsContainerized");
  self->_sdkVersionNumber._opaque[24] = v28;
  if (v28)
  {
    -[LSBundleRecordBuilder addBundleFlag:](self, "addBundleFlag:", 0x4000000000LL);
    uint64_t v29 = objc_opt_class();
    uint64_t v30 = [v4 objectForKey:@"Container"];
    uint64_t v31 = (void *)v30;
    if (v29 && v30)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_35;
      }
      goto LABEL_34;
    }

    if (v30)
    {
LABEL_34:
      uint64_t v32 = (NSArray *)[objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:v31 isDirectory:1];
      alternateNames = self->_alternateNames;
      self->_alternateNames = v32;

LABEL_35:
    }
  }

  uint64_t v34 = objc_opt_class();
  uint64_t v35 = [v4 objectForKey:@"StashedVersionInfo"];
  v36 = (NSNumber *)v35;
  if (v34 && v35 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v36 = 0LL;
  }

  signatureVersion = self->_signatureVersion;
  self->_signatureVersion = v36;

  [v4 objectForKey:@"ApplicationDSID"];
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    iconFileNames = self->_iconFileNames;
    if (iconFileNames)
    {
      self->_iconFileNames = 0LL;
    }

    uint64_t v40 = objc_opt_class();
    uint64_t v41 = [v4 objectForKey:@"ApplicationDSID"];
    v42 = (NSArray *)v41;
    if (v40 && v41 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      v42 = 0LL;
    }

    uint64_t v43 = self->_iconFileNames;
    self->_iconFileNames = v42;
  }

  uint64_t v44 = objc_opt_class();
  uint64_t v45 = [v4 objectForKey:@"DownloaderDSID"];
  v46 = (NSNumber *)v45;
  if (v44 && v45 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v46 = 0LL;
  }

  purchaserDSID = self->_purchaserDSID;
  self->_purchaserDSID = v46;

  uint64_t v48 = objc_opt_class();
  uint64_t v49 = [v4 objectForKey:@"FamilyID"];
  v50 = (NSNumber *)v49;
  if (v48 && v49 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v50 = 0LL;
  }

  downloaderDSID = self->_downloaderDSID;
  self->_downloaderDSID = v50;

  uint64_t v52 = objc_opt_class();
  uint64_t v53 = [v4 objectForKey:@"SignerIdentity"];
  v54 = (void *)v53;
  if (v52 && v53 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v54 = 0LL;
  }

  appType = self->_appType;
  self->_appType = (NSString *)v54;

  uint64_t v56 = objc_opt_class();
  uint64_t v57 = [v4 objectForKey:@"CodeInfoIdentifier"];
  v58 = (void *)v57;
  if (v56 && v57 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v58 = 0LL;
  }

  signerIdentity = self->_signerIdentity;
  self->_signerIdentity = (NSString *)v58;

  uint64_t v60 = objc_opt_class();
  uint64_t v61 = [v4 objectForKey:@"SignerOrganization"];
  v62 = (void *)v61;
  if (v60 && v61 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v62 = 0LL;
  }

  codeInfoIdentifier = self->_codeInfoIdentifier;
  self->_codeInfoIdentifier = (NSString *)v62;

  uint64_t v64 = objc_opt_class();
  uint64_t v65 = [v4 objectForKey:@"ApplicationType"];
  v66 = (void *)v65;
  if (v64 && v65 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v66 = 0LL;
  }

  vendorName = self->_vendorName;
  self->_vendorName = (NSString *)v66;

  if (-[NSString isEqualToString:](self->_vendorName, "isEqualToString:", @"SystemAppPlaceholder"))
  {
    self->_bundleClass = 14;
    _LSRegistrationLog();
    uint64_t v68 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
    {
      installType = self->_installType;
      int v136 = 138412290;
      uint64_t v137 = installType;
      _os_log_impl( &dword_183E58000,  v68,  OS_LOG_TYPE_DEBUG,  "Setting LSBundleClassSystemPlaceholder for app %@",  (uint8_t *)&v136,  0xCu);
    }
  }

  uint64_t v70 = objc_opt_class();
  uint64_t v71 = [v4 objectForKey:@"WatchKitVersion"];
  uint64_t v72 = (NSMutableSet *)v71;
  if (v70 && v71 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v72 = 0LL;
  }

  equivalentBundleIDs = self->_equivalentBundleIDs;
  self->_equivalentBundleIDs = v72;

  uint64_t v74 = objc_opt_class();
  uint64_t v75 = [v4 objectForKey:@"ComplicationPrincipalClass"];
  uint64_t v76 = (void *)v75;
  if (v74 && v75 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v76 = 0LL;
  }

  watchKitVersion = self->_watchKitVersion;
  self->_watchKitVersion = (NSString *)v76;

  uint64_t v78 = objc_opt_class();
  uint64_t v79 = [v4 objectForKey:@"StaticDiskUsage"];
  uint64_t v80 = (NSNumber *)v79;
  if (v78 && v79 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v80 = 0LL;
  }

  familyID = self->_familyID;
  self->_familyID = v80;

  uint64_t v82 = objc_opt_class();
  uint64_t v83 = [v4 objectForKey:@"SupportedComplicationFamilies"];
  uint64_t v84 = (void *)v83;
  if (v82 && v83 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v84 = 0LL;
  }

  complicationPrincipalClass = self->_complicationPrincipalClass;
  self->_complicationPrincipalClass = (NSString *)v84;

  uint64_t v86 = objc_opt_class();
  uint64_t v87 = [v4 objectForKey:@"LSCounterpartIdentifiers"];
  uint64_t v88 = (void *)v87;
  if (v86 && v87)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      uint64_t v88 = 0LL;
      goto LABEL_98;
    }
  }

  else if (!v87)
  {
    goto LABEL_98;
  }

  -[NSString addObjectsFromArray:](self->_managementDeclarationIdentifier, "addObjectsFromArray:", v88);
  -[NSMutableSet addObjectsFromArray:](self->_counterpartAppBundleIDs, "addObjectsFromArray:", v88);
LABEL_98:
  uint64_t v89 = objc_opt_class();
  uint64_t v90 = [v4 objectForKey:@"GroupContainers"];
  uint64_t v91 = (NSArray *)v90;
  if (v89 && v90 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v91 = 0LL;
  }

  driverExtensionPaths = self->_driverExtensionPaths;
  self->_driverExtensionPaths = v91;

  uint64_t v93 = objc_opt_class();
  uint64_t v94 = [v4 objectForKey:@"EnvironmentVariables"];
  uint64_t v95 = (NSDictionary *)v94;
  if (v93 && v94 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v95 = 0LL;
  }

  entitlements = self->_entitlements;
  self->_entitlements = v95;

  uint64_t v97 = objc_opt_class();
  uint64_t v98 = [v4 objectForKey:@"_LSBundlePlugins"];
  uint64_t v99 = (NSDictionary *)v98;
  if (v97 && v98 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v99 = 0LL;
  }

  pluginPlists = self->_pluginPlists;
  self->_pluginPlists = v99;

  uint64_t v101 = objc_opt_class();
  uint64_t v102 = [v4 objectForKey:@"DriverKitExtensionPaths"];
  uint64_t v103 = (NSDictionary *)v102;
  if (v101 && v102 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v103 = 0LL;
  }

  pluginMIDicts = self->_pluginMIDicts;
  self->_pluginMIDicts = v103;

  _LSGetTeamIdentifierFromInstallDict(v4);
  v105 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  itemID = self->_itemID;
  self->_itemID = v105;

  -[LSBundleRecordBuilder setProfileValidationState:]( self,  "setProfileValidationState:",  _LSGetProfileValidationStateFromInstallDictionary((const __CFDictionary *)v4));
  id v107 = objc_alloc_init(MEMORY[0x189603FC8]);
  uint64_t v108 = objc_opt_class();
  uint64_t v109 = [v4 objectForKey:@"UniqueInstallID"];
  v110 = (void *)v109;
  if (v108 && v109 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v110 = 0LL;
  }

  [v107 setObject:v110 forKeyedSubscript:@"UniqueInstallID"];

  uint64_t v111 = objc_opt_class();
  uint64_t v112 = [v4 objectForKey:@"InstallSessionID"];
  uint64_t v113 = (void *)v112;
  if (v111 && v112 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v113 = 0LL;
  }

  [v107 setObject:v113 forKeyedSubscript:@"InstallSessionID"];

  if ([v107 count])
  {
    uint64_t v114 = (NSNumber *)[v107 copy];
    directoryClass = self->_directoryClass;
    self->_directoryClass = v114;
  }

  else {
    __int16 v116 = 0;
  }
  *(_WORD *)&self->_moreFlags = *(_WORD *)&self->_moreFlags & 0xFFFD | v116;
  else {
    __int16 v117 = 0;
  }
  *(_WORD *)&self->_moreFlags = *(_WORD *)&self->_moreFlags & 0xFFEF | v117;
  uint64_t v118 = objc_opt_class();
  uint64_t v119 = [v4 objectForKey:@"AppManagementDomain"];
  v120 = (NSDictionary *)v119;
  if (v118 && v119 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v120 = 0LL;
  }

  stashedAppInfo = self->_stashedAppInfo;
  self->_stashedAppInfo = v120;

  uint64_t v122 = objc_opt_class();
  uint64_t v123 = [v4 objectForKey:@"LinkedParentBundleID"];
  v124 = (void *)v123;
  if (v122 && v123 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v124 = 0LL;
  }

  applicationManagementDomain = self->_applicationManagementDomain;
  self->_applicationManagementDomain = (NSString *)v124;

  uint64_t v126 = objc_opt_class();
  uint64_t v127 = [v4 objectForKey:@"SignatureVersion"];
  v128 = (NSArray *)v127;
  if (v126 && v127 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v128 = 0LL;
  }

  slices = self->_slices;
  self->_slices = v128;

  uint64_t v130 = objc_opt_class();
  uint64_t v131 = [v4 objectForKey:@"AlternateIconName"];
  v132 = (void *)v131;
  if (v130 && v131 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v132 = 0LL;
  }

  primaryIconName = self->_primaryIconName;
  self->_primaryIconName = (NSString *)v132;

  self->_sdkVersionNumber._opaque[25] = objc_msgSend(v4, "_LS_BoolForKey:", @"IsWebNotificationBundle");
  else {
    __int16 v134 = 0;
  }
  *(_WORD *)&self->_moreFlags = *(_WORD *)&self->_moreFlags & 0xFBFF | v134;

LABEL_150:
  return v5;
}

- (void)parseActivityTypesFromDictionary:(id)a3
{
  id v4 = (const __CFDictionary *)a3;
  uint64_t v21 = 0LL;
  groupContainers = self->_groupContainers;
  if (groupContainers)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = -[NSDictionary objectForKey:](groupContainers, "objectForKey:", @"useractivity-team-identifier");
    itemID = (__CFString *)v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      if (v7)
      {
LABEL_12:
        uint64_t v21 = itemID;
LABEL_19:
        installType = self->_installType;
        goto LABEL_20;
      }
    }

    else
    {
      char isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0) {
        goto LABEL_12;
      }
    }

    uint64_t v12 = self->_groupContainers;
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = -[NSDictionary objectForKey:](v12, "objectForKey:", @"com.apple.developer.team-identifier");
    itemID = (__CFString *)v14;
    if (v13 && v14 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      itemID = 0LL;
    }

    uint64_t v21 = itemID;
    if (itemID) {
      goto LABEL_19;
    }
    uint64_t v17 = self->_groupContainers;
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = -[NSDictionary objectForKey:](v17, "objectForKey:", @"application-identifier");
    uint64_t v20 = (void *)v19;
    if (v18 && v19)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        uint64_t v20 = 0LL;
        goto LABEL_30;
      }
    }

    else if (!v19)
    {
      goto LABEL_30;
    }

    _LSSplitApplicationIdentifier(v20, (void **)&v21, 0LL);
LABEL_30:

    itemID = v21;
    installType = self->_installType;
    if (v21) {
      goto LABEL_20;
    }
    goto LABEL_10;
  }

  installType = self->_installType;
LABEL_10:
  itemID = (__CFString *)self->_itemID;
LABEL_20:
  CFArrayRef v15 = _LSCopyActivityTypesClaimedHashedAdvertisingStrings( (uint64_t)installType,  itemID,  v4,  (const __CFDictionary *)self->_groupContainers);
  CFArrayRef v16 = v15;
  if (v15 && -[__CFArray count](v15, "count")) {
    objc_storeStrong((id *)&self->_teamID, v16);
  }
}

- (void)parseNSExtensionSDKDefinitionsFromDictionary:(id)a3
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v26 = a3;
  context = (void *)MEMORY[0x186E2A59C]();
  id v4 = (void *)objc_opt_new();
  groupContainers = self->_groupContainers;
  if (groupContainers)
  {
    -[NSDictionary objectForKey:]( groupContainers,  "objectForKey:",  @"com.apple.private.coreservices.definesExtensionPoint");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      LOBYTE(self->_inode) = 1;
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = [v26 objectForKey:@"NSExtensionSDK"];
      BOOL v9 = (void *)v8;
      if (v7 && v8 && (objc_opt_isKindOfClass() & 1) == 0)
      {

        BOOL v9 = 0LL;
      }

      [v4 addEntriesFromDictionary:v9];
    }

    else
    {
      LOBYTE(self->_inode) = 0;
    }
  }

  if ([(id)__LSDefaultsGetSharedInstance() allowsUnentitledExtensionPointDeclaration])
  {
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [v26 objectForKey:@"_LSBundleExtensionPoints"];
    uint64_t v12 = (void *)v11;
    if (v10 && v11 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      uint64_t v12 = 0LL;
    }

    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0LL; i != v14; ++i)
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            _LSExtensionsLog();
            uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              uint64_t v21 = (objc_class *)objc_opt_class();
              NSStringFromClass(v21);
              __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[LSBundleRecordBuilder parseNSExtensionSDKDefinitionsFromDictionary:].cold.1(v22, buf, v20);
            }

            goto LABEL_30;
          }

          _LSExtensionsLog();
          uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v32 = v17;
            _os_log_impl( &dword_183E58000,  v18,  OS_LOG_TYPE_DEFAULT,  "Registering extension point definition: %@",  buf,  0xCu);
          }

          [MEMORY[0x189603F68] dictionaryWithContentsOfURL:v17];
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19) {
            [v4 addEntriesFromDictionary:v19];
          }
        }

        uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v33 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

- (LSBundleData)buildBundleData:(SEL)a3 error:(id)a4
{
  v225[4] = *MEMORY[0x1895F89C0];
  id v7 = a4;
  bzero(retstr, 0x214uLL);
  unsigned __int8 retries = self->_retries;
  LOBYTE(retstr->extensionPoints) = 11;
  BYTE1(retstr->extensionPoints) = retries;
  v185 = retstr;
  retstr->_clas = self->_bundleClass;
  uint64_t v188 = self;
  uint64_t v189 = v7;
  bundleAlias = self->_bundleAlias;
  id v212 = 0LL;
  obuint64_t j = _LSAliasAdd(v7, bundleAlias, &v212);
  id v183 = v212;
  unsigned int v10 = obj;
  if (!obj)
  {
    int v11 = _LSGetOSStatusFromNSError(v183);
    unsigned int v10 = 0;
    if (v11)
    {
      id v24 = v183;
LABEL_150:
      if (a5)
      {
        _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  v11,  (uint64_t)"-[LSBundleRecordBuilder buildBundleData:error:]",  2169LL,  0LL);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_291;
    }
  }

  retstr->base.bookmaruint64_t k = v10;
  registrationInfo = self->_registrationInfo;
  if (registrationInfo)
  {
    retstr->base.container = registrationInfo->containerUnit;
    _LSBundleDataSetModTime((uint64_t)retstr, (int)registrationInfo->contentModDate);
  }

  else
  {
    retstr->base.container = 0;
  }

  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  _LSBundleDataSetRegTime((uint64_t)retstr, (int)Current);
  CFAbsoluteTime v14 = CFAbsoluteTimeGetCurrent();
  unsigned int minSystemVersionPlatform = self->_minSystemVersionPlatform;
  retstr->appContainerAlias = (int)v14;
  *(_DWORD *)&retstr->_iconFlags = minSystemVersionPlatform;
  retstr->base.platforuint64_t m = self->_baseFlags;
  CFArrayRef v16 = *(void **)&self->_containerized;
  if (v16)
  {
    uint64_t v17 = (unsigned int *)[v16 unsignedLongLongValue];
    retstr->sequenceNumber = (unint64_t)v17;
    if (v17)
    {
      _LSRegistrationLog();
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        installType = (unsigned int *)self->_installType;
        LODWORD(buf.__begin_) = 138412546;
        *(std::vector<unsigned int>::pointer *)((char *)&buf.__begin_ + 4) = installType;
        WORD2(buf.__end_) = 2048;
        *(std::vector<unsigned int>::pointer *)((char *)&buf.__end_ + 6) = v17;
        _os_log_impl( &dword_183E58000,  v18,  OS_LOG_TYPE_DEBUG,  "Registering app %@ with compatibility state %llu",  (uint8_t *)&buf,  0x16u);
      }
    }
  }

  compatibilityState = self->_compatibilityState;
  if (compatibilityState)
  {
    uint64_t v21 = -[NSNumber unsignedLongLongValue](compatibilityState, "unsignedLongLongValue");
    *(void *)&retstr->shortVersionString = v21;
    if (v21)
    {
      _LSRegistrationLog();
      __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        BOOL v23 = (unsigned int *)self->_installType;
        LODWORD(buf.__begin_) = 138412546;
        *(std::vector<unsigned int>::pointer *)((char *)&buf.__begin_ + 4) = v23;
        WORD2(buf.__end_) = 2048;
        *(std::vector<unsigned int>::pointer *)((char *)&buf.__end_ + 6) = v21;
        _os_log_impl( &dword_183E58000,  v22,  OS_LOG_TYPE_ERROR,  "Registering app %@ with install failure reason %llu",  (uint8_t *)&buf,  0x16u);
      }
    }
  }

  if ([(id)__LSDefaultsGetSharedInstance() isInEducationMode])
  {
    unsigned int v182 = 0;
    id v24 = v183;
  }

  else
  {
    alternateNames = self->_alternateNames;
    id v24 = v183;
    if (alternateNames)
    {
      id v211 = v183;
      unsigned int v182 = _LSAliasAddURL(v7, alternateNames, &v211);
      id v24 = v211;

      if (!v182)
      {
        int v11 = _LSGetOSStatusFromNSError(v24);
        unsigned int v182 = 0;
        int v181 = 0;
        if (v11) {
          goto LABEL_144;
        }
      }
    }

    else
    {
      unsigned int v182 = 0;
    }
  }

  retstr->base.dataContainerAlias = v182;
  dataContainerURL = self->_dataContainerURL;
  if (dataContainerURL)
  {
    id v210 = v24;
    unsigned int v27 = _LSAliasAddURL(v7, dataContainerURL, &v210);
    id v184 = v210;

    if (!v27)
    {
      int v11 = _LSGetOSStatusFromNSError(v184);
      unsigned int v27 = 0;
      if (v11)
      {
        int v181 = 0;
LABEL_143:
        id v24 = v184;
LABEL_144:
        if (obj) {
          _LSAliasRemove(v189, obj);
        }
        if (v181) {
          _LSAliasRemove(v189, v181);
        }
        if (v182) {
          _LSAliasRemove(v189, v182);
        }
        goto LABEL_150;
      }
    }
  }

  else
  {
    unsigned int v27 = 0;
    id v184 = v24;
  }

  int v181 = v27;
  retstr->driverExtensions = v27;
  installFailureReasouint64_t n = self->_installFailureReason;
  if (installFailureReason)
  {
    __int128 v29 = (__int128 *)v225;
    _LSVersionNumberMakeWithString(v225, installFailureReason);
  }

  else
  {
    appStoreToolsBuildVersiouint64_t n = self->_appStoreToolsBuildVersion;
    if (appStoreToolsBuildVersion)
    {
      __int128 v29 = (__int128 *)v224;
      _LSVersionNumberMakeWithString(v224, appStoreToolsBuildVersion);
    }

    else
    {
      __int128 v29 = &kLSVersionNumberNull;
    }
  }

  __int128 v31 = v29[1];
  uint64_t v32 = retstr;
  *(_OWORD *)retstr->base.version._opaque = *v29;
  *(_OWORD *)&retstr->base.version._opaque[16] = v31;
  versiouint64_t n = self->_version;
  if (version)
  {
    _LSVersionNumberMakeWithString(v223, version);
    uint64_t v32 = retstr;
    *(_OWORD *)&retstr->_mtime = v223[0];
    *(_OWORD *)&retstr->_minSystemVersion._opaque[8] = v223[1];
  }

  else
  {
    *(_OWORD *)&retstr->_mtime = kLSVersionNumberNull;
    *(_OWORD *)&retstr->_minSystemVersion._opaque[8] = *(_OWORD *)algn_183FBF5B0;
  }

  v32->_hfsType = self->_platform;
  minSystemVersiouint64_t n = self->_minSystemVersion;
  if (minSystemVersion)
  {
    _LSVersionNumberMakeWithString(v222, minSystemVersion);
    uint64_t v32 = retstr;
    *(_OWORD *)&retstr->_minSystemVersion._opaque[24] = v222[0];
    *(_OWORD *)&retstr->_maxSystemVersion._opaque[8] = v222[1];
  }

  else
  {
    *(_OWORD *)&v32->_minSystemVersion._opaque[24] = kLSVersionNumberNull;
    *(_OWORD *)&v32->_maxSystemVersion._opaque[8] = *(_OWORD *)algn_183FBF5B0;
  }

  __int128 v35 = *(_OWORD *)&self->_sdkVersionNumber._opaque[8];
  *(_OWORD *)v32->base.execSDKVersion._opaque = *(_OWORD *)&self->_supportedGameControllers;
  *(_OWORD *)&v32->base.execSDKVersion._opaque[16] = v35;
  *(_DWORD *)&retstr->_maxSystemVersion._opaque[24] = _LSDatabaseCreateStringForCFString( v189,  (const __CFString *)self->_sdkVersion,  0);
  deviceFamily = self->_deviceFamily;
  if (deviceFamily && -[NSArray unsignedLongLongValue](deviceFamily, "unsignedLongLongValue"))
  {
    unsigned int previousInstallType = -[NSArray unsignedLongLongValue](self->_deviceFamily, "unsignedLongLongValue");
    uint64_t v38 = retstr;
  }

  else
  {
    unsigned int previousInstallType = self->_previousInstallType;
    uint64_t v38 = retstr;
    if (!previousInstallType) {
      goto LABEL_44;
    }
  }

  v38->bundleVersiouint64_t n = previousInstallType;
LABEL_44:
  *(void *)&v38->_maxSystemVersion._opaque[28] = self->_sequenceNumber;
  purchaserDSID = self->_purchaserDSID;
  if (purchaserDSID) {
    retstr->purchaserDSID = -[NSNumber unsignedLongLongValue](purchaserDSID, "unsignedLongLongValue");
  }
  iconFileNames = self->_iconFileNames;
  if (iconFileNames) {
    retstr->staticDiskUsage = -[NSArray unsignedLongLongValue](iconFileNames, "unsignedLongLongValue");
  }
  downloaderDSID = self->_downloaderDSID;
  if (downloaderDSID) {
    retstr->downloaderDSID = -[NSNumber unsignedLongLongValue](downloaderDSID, "unsignedLongLongValue");
  }
  ratingLabel = self->_ratingLabel;
  if (ratingLabel) {
    *(void *)&retstr->sourceAppBundleID = -[NSString unsignedLongLongValue](ratingLabel, "unsignedLongLongValue");
  }
  genre = self->_genre;
  if (genre) {
    *(void *)(&retstr->managementDeclarationIdentifier + 1) = -[NSString unsignedLongLongValue]( genre,  "unsignedLongLongValue");
  }
  machOUUIDs = self->_machOUUIDs;
  if (machOUUIDs) {
    retstr->compatibilityState = -[NSArray unsignedLongLongValue](machOUUIDs, "unsignedLongLongValue");
  }
  familyID = self->_familyID;
  if (familyID) {
    *(void *)&retstr->vendorName = -[NSNumber unsignedLongLongValue](familyID, "unsignedLongLongValue");
  }
  itemName = self->_itemName;
  if (itemName) {
    *(unint64_t *)((char *)&retstr->familyID + 4) = -[NSString unsignedLongLongValue]( itemName,  "unsignedLongLongValue");
  }
  storefront = self->_storefront;
  if (storefront) {
    *(void *)(&retstr->itemName + 1) = -[NSNumber unsignedLongLongValue](storefront, "unsignedLongLongValue");
  }
  HIDWORD(retstr->storefront) = _LSDatabaseCreateStringForCFString(v189, (const __CFString *)self->_versionID, 0);
  HIDWORD(retstr->itemID) = _LSDatabaseCreateStringForCFString(v189, (const __CFString *)self->_installType, 1);
  retstr->base.exactIdentifier = _LSDatabaseCreateStringForCFString(v189, (const __CFString *)self->_installType, 0);
  retstr->base.bundleName = _LSDatabaseCreateStringForCFString(v189, (const __CFString *)self->_shortDisplayName, 0);
  retstr->base.execPath = _LSDatabaseCreateStringForCFString(v189, (const __CFString *)self->_shortVersionString, 0);
  retstr->base.displayName = _LSDatabaseCreateStringForCFString(v189, (const __CFString *)self->_identifier, 0);
  retstr->equivalentBundleIdentifiers = _LSDatabaseCreateStringForCFString( v189,  (const __CFString *)self->_installFailureReason,  0);
  retstr->filename = _LSDatabaseCreateStringForCFString(v189, (const __CFString *)self->_appStoreToolsBuildVersion, 0);
  LODWORD(retstr->installFailureReason) = _LSDatabaseCreateStringForCFString( v189,  (const __CFString *)self->_secondCategoryType,  0);
  vendorName = self->_vendorName;
  if (vendorName)
  {
    if (-[NSString isEqualToString:](vendorName, "isEqualToString:", @"CoreServices"))
    {
      int StringForCFString = _LSDatabaseCreateStringForCFString(v189, @"Hidden", 0);
      goto LABEL_68;
    }

    v50 = (const __CFString *)self->_vendorName;
  }

  else
  {
    v50 = 0LL;
  }

  int StringForCFString = _LSDatabaseCreateStringForCFString(v189, v50, 0);
LABEL_68:
  HIDWORD(retstr->installFailureReason) = StringForCFString;
  LODWORD(retstr->familyID) = _LSDatabaseCreateStringForCFString(v189, (const __CFString *)self->_signerOrganization, 0);
  LODWORD(retstr->versionIdentifier) = _LSDatabaseCreateStringForCFString( v189,  (const __CFString *)self->_sourceAppBundleID,  0);
  HIDWORD(retstr->versionIdentifier) = _LSDatabaseCreateStringForCFString( v189,  (const __CFString *)self->_appVariant,  0);
  managementDeclarationIdentifier = self->_managementDeclarationIdentifier;
  if (managementDeclarationIdentifier)
  {
    -[NSString allObjects](managementDeclarationIdentifier, "allObjects");
    uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
    retstr->deviceFamilies = _LSDatabaseCreateStringArray(v189, v52, 0, 0LL);
  }

  counterpartAppBundleIDs = self->_counterpartAppBundleIDs;
  if (counterpartAppBundleIDs)
  {
    v54 = -[NSMutableSet allObjects](counterpartAppBundleIDs, "allObjects");
    retstr->identifier = _LSDatabaseCreateStringArray(v189, v54, 0, 0LL);
  }

  if (-[NSDictionary count](self->_unlocalizedNamesWithContext, "count"))
  {
    uint64_t v55 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  -[NSDictionary count](self->_unlocalizedNamesWithContext, "count"));
    memset(&buf, 0, sizeof(buf));
    std::vector<unsigned int>::reserve(&buf, -[NSDictionary count](self->_unlocalizedNamesWithContext, "count"));
    __int128 v208 = 0u;
    __int128 v209 = 0u;
    __int128 v206 = 0u;
    __int128 v207 = 0u;
    uint64_t v56 = self->_unlocalizedNamesWithContext;
    uint64_t v57 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v56,  "countByEnumeratingWithState:objects:count:",  &v206,  v220,  16LL);
    if (v57)
    {
      uint64_t v58 = *(void *)v207;
      do
      {
        for (uint64_t i = 0LL; i != v57; ++i)
        {
          if (*(void *)v207 != v58) {
            objc_enumerationMutation(v56);
          }
          uint64_t v60 = *(void *)(*((void *)&v206 + 1) + 8 * i);
          -[_LSDatabase store](v60);
          uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
          [v55 addObject:v61];

          unsigned int v62 = -[_LSPersonaWithAttributes personaType](v60);
          unsigned int v63 = v62;
          std::vector<unsigned int>::pointer end = buf.__end_;
          if (buf.__end_ >= buf.__end_cap_.__value_)
          {
            std::vector<unsigned int>::pointer begin = buf.__begin_;
            int64_t v67 = buf.__end_ - buf.__begin_;
            unint64_t v68 = v67 + 1;
            int64_t v69 = (char *)buf.__end_cap_.__value_ - (char *)buf.__begin_;
            else {
              unint64_t v70 = v68;
            }
            if (v70)
            {
              uint64_t v71 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>( (uint64_t)&buf.__end_cap_,  v70);
              std::vector<unsigned int>::pointer begin = buf.__begin_;
              std::vector<unsigned int>::pointer end = buf.__end_;
            }

            else
            {
              uint64_t v71 = 0LL;
            }

            uint64_t v72 = (unsigned int *)&v71[4 * v67];
            *uint64_t v72 = v63;
            uint64_t v65 = v72 + 1;
            while (end != begin)
            {
              unsigned int v73 = *--end;
              *--uint64_t v72 = v73;
            }

            buf.__begin_ = v72;
            buf.__end_ = v65;
            buf.__end_cap_.__value_ = (unsigned int *)&v71[4 * v70];
            if (begin) {
              operator delete(begin);
            }
          }

          else
          {
            *buf.__end_ = v62;
            uint64_t v65 = end + 1;
          }

          buf.__end_ = v65;
        }

        uint64_t v57 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v56,  "countByEnumeratingWithState:objects:count:",  &v206,  v220,  16LL);
      }

      while (v57);
    }

    v185->uint64_t queriableSchemes = _LSDatabaseCreateStringArray(v189, v55, 0, 0LL);
    unsigned int v74 = _CSArrayCreate();
    v185->uint64_t bgPermittedIDs = v74;
    if (!v185->queriableSchemes || !v74)
    {
      _LSRegistrationLog();
      uint64_t v75 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
      {
        uint64_t queriableSchemes = v185->queriableSchemes;
        uint64_t bgPermittedIDs = v185->bgPermittedIDs;
        *(_DWORD *)uint64_t v217 = 134218240;
        *(void *)&v217[4] = queriableSchemes;
        __int16 v218 = 2048;
        uint64_t v219 = bgPermittedIDs;
        _os_log_impl( &dword_183E58000,  v75,  OS_LOG_TYPE_ERROR,  "failed to allocate personas (%llx) or persona types (%llx) CSArray",  v217,  0x16u);
      }

      *(void *)&v185->uint64_t queriableSchemes = 0LL;
    }

    if (buf.__begin_)
    {
      buf.__end_ = buf.__begin_;
      operator delete(buf.__begin_);
    }
  }

  bundlePersonas = self->_bundlePersonas;
  if (bundlePersonas) {
    char v79 = -[NSArray unsignedLongLongValue](bundlePersonas, "unsignedLongLongValue");
  }
  else {
    char v79 = -1;
  }
  v185->base.containingDirectoryClass = v79;
  v185->base.profileValidationState = -[LSBundleRecordBuilder profileValidationState](self, "profileValidationState");
  v185->managementDeclarationIdentifier = _LSDatabaseCreateStringForCFString( v189,  (const __CFString *)self->_supportedComplicationFamilies,  0);
  HIDWORD(v185->ratingRank) = _LSDatabaseCreateStringForCFString(v189, (const __CFString *)self->_ratingRank, 0);
  v185->ratingLabel = _LSPlistAdd((uint64_t)v189, self->_genreID);
  +[FSNode nameForBookmarkData:error:](&OBJC_CLASS___FSNode, "nameForBookmarkData:error:", self->_bundleAlias, 0LL);
  uint64_t v80 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v80) {
    v185->counterpartIdentifiers = _LSDatabaseCreateStringForCFString(v189, v80, 1);
  }

  if (!v185->counterpartIdentifiers)
  {
    int v11 = -10817;
    goto LABEL_143;
  }

  activityTypes = self->_activityTypes;
  if (activityTypes)
  {
    memset(&buf, 0, sizeof(buf));
    __int128 v202 = 0u;
    __int128 v203 = 0u;
    __int128 v204 = 0u;
    __int128 v205 = 0u;
    uint64_t v82 = activityTypes;
    uint64_t v83 = -[NSArray countByEnumeratingWithState:objects:count:]( v82,  "countByEnumeratingWithState:objects:count:",  &v202,  v216,  16LL);
    if (v83)
    {
      uint64_t v84 = *(void *)v203;
      do
      {
        for (uint64_t j = 0LL; j != v83; ++j)
        {
          if (*(void *)v203 != v84) {
            objc_enumerationMutation(v82);
          }
          uint64_t v86 = *(void **)(*((void *)&v202 + 1) + 8 * j);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            signed int v87 = [v86 intValue];
            unsigned int v88 = v87;
            if (v87 >= 1)
            {
              std::vector<unsigned int>::pointer v89 = buf.__end_;
              if (buf.__end_ >= buf.__end_cap_.__value_)
              {
                std::vector<unsigned int>::pointer v91 = buf.__begin_;
                int64_t v92 = buf.__end_ - buf.__begin_;
                unint64_t v93 = v92 + 1;
                int64_t v94 = (char *)buf.__end_cap_.__value_ - (char *)buf.__begin_;
                else {
                  unint64_t v95 = v93;
                }
                if (v95)
                {
                  uint64_t v96 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>( (uint64_t)&buf.__end_cap_,  v95);
                  std::vector<unsigned int>::pointer v91 = buf.__begin_;
                  std::vector<unsigned int>::pointer v89 = buf.__end_;
                }

                else
                {
                  uint64_t v96 = 0LL;
                }

                uint64_t v97 = (unsigned int *)&v96[4 * v92];
                unsigned int *v97 = v88;
                uint64_t v90 = v97 + 1;
                while (v89 != v91)
                {
                  unsigned int v98 = *--v89;
                  *--uint64_t v97 = v98;
                }

                buf.__begin_ = v97;
                buf.__end_ = v90;
                buf.__end_cap_.__value_ = (unsigned int *)&v96[4 * v95];
                if (v91) {
                  operator delete(v91);
                }
              }

              else
              {
                *buf.__end_ = v87;
                uint64_t v90 = v89 + 1;
              }

              buf.__end_ = v90;
            }
          }
        }

        uint64_t v83 = -[NSArray countByEnumeratingWithState:objects:count:]( v82,  "countByEnumeratingWithState:objects:count:",  &v202,  v216,  16LL);
      }

      while (v83);
    }

    *(void *)uint64_t v217 = 0LL;
    int v99 = _CSArrayCreate();
    LODWORD(v185->itemID) = v99;
    if (v99) {
      int v11 = 0;
    }
    else {
      int v11 = _LSGetOSStatusFromNSError(*(void **)v217);
    }

    if (buf.__begin_)
    {
      buf.__end_ = buf.__begin_;
      operator delete(buf.__begin_);
    }

    if (v11) {
      goto LABEL_143;
    }
  }

  execPath = self->_execPath;
  if (execPath) {
    v185->base.machOUUIDs = _LSDatabaseCreateStringArray(v189, execPath, 0, 0LL);
  }
  int v11 = -[LSBundleRecordBuilder registerQueriableSchemes:bundleData:]( self,  "registerQueriableSchemes:bundleData:",  v189,  v185);
  if (v11) {
    goto LABEL_143;
  }
  *(&v185->ratingLabel + 1) = _LSDatabaseCreateStringForCFString(v189, (const __CFString *)self->_distributorInfo, 0);
  LODWORD(v185->genreID) = _LSDatabaseCreateStringForCFString(v189, (const __CFString *)self->_primaryIconName, 0);
  HIDWORD(v185->genreID) = _LSPlistAdd((uint64_t)v189, self->_alternatePrimaryIconName);
  iconsDict = self->_iconsDict;
  if (iconsDict)
  {
    unsigned int StringArray = _LSDatabaseCreateStringArray(v189, iconsDict, 0, 0LL);
    v185->genre = StringArray;
    if (!StringArray) {
      goto LABEL_294;
    }
  }

  if ([*(id *)&self->_canDefineSystemExtensionPoint count]
    || -[NSMutableDictionary count](self->_plistRarities, "count"))
  {
    id v103 = objc_alloc_init(MEMORY[0x189603FC8]);
    uint64_t v104 = v103;
    if (self->_plistRarities) {
      objc_msgSend(v104, "addEntriesFromDictionary:");
    }
    v185->base.infoDictionary = _LSPlistAdd((uint64_t)v189, v104);
  }

  else
  {
    v185->base.infoDictionary = 0;
  }

  v185->base.groupContainers = _LSPlistAdd((uint64_t)v189, self->_driverExtensionPaths);
  uint64_t v179 = 696LL;
  v185->base.entitlements = _LSPlistAdd((uint64_t)v189, self->_groupContainers);
  v185->activityTypes = _LSPlistAdd((uint64_t)v189, self->_entitlements);
  v185->base.intentDefinitionURLs = _LSPlistAdd((uint64_t)v189, self->_extensionSDK);
  v185->plugins = _LSDatabaseCreateStringArray(v189, self->_intentDefinitionURLs, 0, 0LL);
  v105 = (void *)MEMORY[0x186E2A59C]();
  memset(&buf, 0, sizeof(buf));
  __int128 v198 = 0u;
  __int128 v199 = 0u;
  __int128 v200 = 0u;
  __int128 v201 = 0u;
  v106 = self->_commonInfoPlistEntries;
  uint64_t v107 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v106,  "countByEnumeratingWithState:objects:count:",  &v198,  v215,  16LL);
  if (v107)
  {
    uint64_t v108 = *(void *)v199;
    do
    {
      for (uint64_t k = 0LL; k != v107; ++k)
      {
        if (*(void *)v199 != v108) {
          objc_enumerationMutation(v106);
        }
        unsigned int v110 = _LSPlistAdd((uint64_t)v189, *(void **)(*((void *)&v198 + 1) + 8 * k));
        unsigned int v111 = v110;
        if (v110)
        {
          std::vector<unsigned int>::pointer v112 = buf.__end_;
          if (buf.__end_ >= buf.__end_cap_.__value_)
          {
            std::vector<unsigned int>::pointer v114 = buf.__begin_;
            int64_t v115 = buf.__end_ - buf.__begin_;
            unint64_t v116 = v115 + 1;
            int64_t v117 = (char *)buf.__end_cap_.__value_ - (char *)buf.__begin_;
            else {
              unint64_t v118 = v116;
            }
            if (v118)
            {
              uint64_t v119 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>( (uint64_t)&buf.__end_cap_,  v118);
              std::vector<unsigned int>::pointer v114 = buf.__begin_;
              std::vector<unsigned int>::pointer v112 = buf.__end_;
            }

            else
            {
              uint64_t v119 = 0LL;
            }

            v120 = (unsigned int *)&v119[4 * v115];
            unsigned int *v120 = v111;
            uint64_t v113 = v120 + 1;
            while (v112 != v114)
            {
              unsigned int v121 = *--v112;
              *--v120 = v121;
            }

            buf.__begin_ = v120;
            buf.__end_ = v113;
            buf.__end_cap_.__value_ = (unsigned int *)&v119[4 * v118];
            if (v114) {
              operator delete(v114);
            }
          }

          else
          {
            *buf.__end_ = v110;
            uint64_t v113 = v112 + 1;
          }

          buf.__end_ = v113;
        }
      }

      uint64_t v107 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v106,  "countByEnumeratingWithState:objects:count:",  &v198,  v215,  16LL);
    }

    while (v107);
  }

  uint64_t v122 = buf.__begin_;
  if (buf.__begin_ != buf.__end_)
  {
    *(_DWORD *)&v185->revisiouint64_t n = _CSArrayCreate();
    uint64_t v122 = buf.__begin_;
  }

  if (v122)
  {
    buf.__end_ = v122;
    operator delete(v122);
  }

  objc_autoreleasePoolPop(v105);
  v185->base.localizedDisplayName = LaunchServices::LocalizedString::Add( v189,  self->_bgPermittedIdentifiers,  self->_identifier);
  v185->base.localizedShortDisplayName = LaunchServices::LocalizedString::Add( v189,  self->_localizedNames,  self->_displayName);
  v185->distributorInfo = _LSDatabaseCreateStringForCFString(v189, (const __CFString *)self->_staticDiskUsage, 0);
  libraryPath = self->_libraryPath;
  if (libraryPath)
  {
    unsigned int v124 = _LSDatabaseCreateStringArray(v189, libraryPath, 0, 0LL);
    v185->primaryIconName = v124;
    if (!v124) {
      goto LABEL_294;
    }
  }

  uint64_t v125 = self;
  if ((self->_bundleFlags & 0x100) != 0) {
    goto LABEL_222;
  }
  importedTypes = self->_importedTypes;
  if (importedTypes || self->_URLClaims)
  {
    buf.__begin_ = 0LL;
    -[NSArray count](importedTypes, "count", 696LL);
    -[NSArray count](self->_URLClaims, "count");
    unsigned int v127 = _CSArrayCreateWithCapacity();
    v185->iconsDict = v127;
    if (!v127)
    {
      int v11 = _LSGetOSStatusFromNSError(buf.__begin_);
      if (v11) {
        goto LABEL_298;
      }
    }

    v128 = self->_importedTypes;
    if (v128 && -[NSArray count](v128, "count")
      || (URLClaims = self->_URLClaims) != 0LL && -[NSArray count](URLClaims, "count"))
    {
      -[LSBundleRecordBuilder addPlistFlag:](self, "addPlistFlag:", 0x10000LL);
    }
  }

  documentClaims = self->_documentClaims;
  if (documentClaims || self->_libraryItems)
  {
    buf.__begin_ = 0LL;
    -[NSArray count](documentClaims, "count", v179);
    -[NSArray count](self->_libraryItems, "count");
    unsigned int v131 = _CSArrayCreateWithCapacity();
    v185->alternatePrimaryIconName = v131;
    if (v131 || (int v11 = _LSGetOSStatusFromNSError(buf.__begin_)) == 0)
    {
      v132 = self->_documentClaims;
      if (v132 && -[NSArray count](v132, "count")
        || (libraryItems = self->_libraryItems) != 0LL && -[NSArray count](libraryItems, "count"))
      {
        -[LSBundleRecordBuilder addPlistFlag:](self, "addPlistFlag:", 0x10000LL);
      }

      goto LABEL_216;
    }

- (int)activateBindings:(id)a3 unitID:(unsigned int)a4 bundleData:(const LSBundleData *)a5
{
  id v7 = a3;
  int v8 = _LSBindableActivate(v7, a4);
  if (!v8)
  {
    int v8 = _LSBindableActivate(v7, a4);
    if (!v8 && (!a5->base.bundleName || (int v8 = _LSBindableActivate(v7, a4)) == 0))
    {
      if (a5->recordModificationTime) {
        int v8 = _LSBindableActivate(v7, a4);
      }
      else {
        int v8 = 0;
      }
    }
  }

  return v8;
}

- (unsigned)registerBundleRecord:(id)a3 error:(id *)a4
{
  uint64_t v64 = *MEMORY[0x1895F89C0];
  unsigned int v54 = 0;
  id v48 = a3;
  uint64_t v45 = a4;
  -[LSBundleRecordBuilder buildBundleData:error:](self, "buildBundleData:error:");
  memcpy(__dst, __src, sizeof(__dst));
  int v6 = _LSBundleAdd(v48, (uint64_t)__dst, &v54);
  uint64_t v49 = self;
  if (v6)
  {
    unsigned int v54 = 0;
  }

  else
  {
    int v6 = -[LSBundleRecordBuilder activateBindings:unitID:bundleData:]( self,  "activateBindings:unitID:bundleData:",  v48,  v54,  __src);
    if (!v6)
    {
      importedTypes = self->_importedTypes;
      int v8 = __src[114];
      if (importedTypes) {
        BOOL v9 = __src[114] == 0;
      }
      else {
        BOOL v9 = 1;
      }
      if (v9)
      {
        unsigned int v46 = 0;
      }

      else
      {
        unsigned int v46 = _LSRegisterTypeDeclarationsForBundle(v48, v54, (uint64_t)__src, importedTypes, self->_localizedShortNames);
        int v8 = __src[114];
      }

      URLClaims = self->_URLClaims;
      if (URLClaims && v8) {
        unsigned int v46 = _LSRegisterTypeDeclarationsForBundle(v48, v54, (uint64_t)__src, URLClaims, self->_localizedShortNames);
      }
      int v11 = __src[113];
      if (self->_libraryItems && __src[113])
      {
        unsigned int v46 = _LSRegisterDocumentTypes((uint64_t)v48);
        int v11 = __src[113];
      }

      if (self->_documentClaims && v11) {
        unsigned int v46 = _LSRegisterURLTypes((uint64_t)v48);
      }
      if (__src[118]) {
        unsigned int v46 = _LSBundleActivateBindingsForUserActivityTypes(v48, v54, (uint64_t)__src);
      }
      if (!self->_registrationInfo
        || !self->_queriableSchemes
        || !__src[115]
        || _LSBundleDataIsInUnsupportedLocation((uint64_t)v48, (uint64_t)__src)
        || _LSBundleDataGetUnsupportedFormatFlag()
        || (__src[41] & 0x80) != 0)
      {
        _LSExtensionsLog();
        uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          -[LSBundleRecordBuilder registerBundleRecord:error:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);
        }
      }

      else
      {
        _LSExtensionsLog();
        uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          -[LSBundleRecordBuilder registerBundleRecord:error:].cold.2(v12, v13, v14, v15, v16, v17, v18, v19);
        }

        unsigned int v46 = _LSRegisterPlugins( v48,  self->_registrationInfo->containerUnit,  v54,  (const __CFDictionary *)self->_queriableSchemes,  self->_pluginPlists,  0);
      }

      if (self->_sandboxEnvironmentVariables && __src[117])
      {
        [(id)getEXEnumeratorClass() extensionPointDefinitionEnumeratorWithSDKDictionary:self->_sandboxEnvironmentVariables];
        __int128 v52 = 0u;
        __int128 v53 = 0u;
        __int128 v50 = 0u;
        __int128 v51 = 0u;
        obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v28 = [obj countByEnumeratingWithState:&v50 objects:v61 count:16];
        if (v28)
        {
          uint64_t v29 = *(void *)v51;
          do
          {
            for (uint64_t i = 0LL; i != v28; ++i)
            {
              if (*(void *)v51 != v29) {
                objc_enumerationMutation(obj);
              }
              __int128 v31 = *(__CFString **)(*((void *)&v50 + 1) + 8 * i);
              -[__CFString identifier](v31, "identifier");
              uint64_t v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
              uint64_t v33 = -[__CFString platform](v31, "platform");
              -[__CFString SDKDictionary](v31, "SDKDictionary");
              uint64_t v34 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
              -[__CFString url](v31, "url");
              __int128 v35 = (void *)objc_claimAutoreleasedReturnValue();
              if (LOBYTE(self->_inode)
                || !-[__CFString hasPrefix:](v32, "hasPrefix:", @"com.apple."))
              {
                _LSExtensionsLog();
                v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)std::vector<unsigned int> buf = 136315394;
                  uint64_t v56 = "-[LSBundleRecordBuilder registerBundleRecord:error:]";
                  __int16 v57 = 2112;
                  uint64_t v58 = v31;
                  _os_log_debug_impl( &dword_183E58000,  v37,  OS_LOG_TYPE_DEBUG,  "%s Registering extension point: %@",  buf,  0x16u);
                }

                _LSRegisterExtensionPoint(v48, v54, v32, v33, v34, v35);
              }

              else
              {
                _LSExtensionsLog();
                v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                {
                  -[LSBundleRecordBuilder identifier](self, "identifier");
                  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)std::vector<unsigned int> buf = 136315650;
                  uint64_t v56 = "-[LSBundleRecordBuilder registerBundleRecord:error:]";
                  __int16 v57 = 2112;
                  uint64_t v58 = v32;
                  __int16 v59 = 2112;
                  uint64_t v60 = v38;
                  _os_log_error_impl( &dword_183E58000,  v36,  OS_LOG_TYPE_ERROR,  "%s Skipping extension point '%@' unentitled app '%@' is not permitted to register a system extension point",  buf,  0x20u);
                }
              }
            }

            uint64_t v28 = [obj countByEnumeratingWithState:&v50 objects:v61 count:16];
          }

          while (v28);
        }
      }

      int v6 = v46;
    }
  }

  int v39 = v6;
  if (v6 && v54)
  {
    _LSBundleRemove(v48, v54, 0);
    unsigned int v54 = 0;
  }

  else if (!v6)
  {
    self->_registerChildItemsTrusted = (__src[41] & 0x80) == 0;
    goto LABEL_57;
  }

  if (v45)
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  v39,  (uint64_t)"-[LSBundleRecordBuilder registerBundleRecord:error:]",  2354LL,  0LL);
    id *v45 = (id)objc_claimAutoreleasedReturnValue();
  }

- (unsigned)retries
{
  return self->_retries;
}

- (void)setRetries:(unsigned __int8)a3
{
  self->_unsigned __int8 retries = a3;
}

- (unsigned)previousInstallType
{
  return self->_previousInstallType;
}

- (void)setPreviousInstallType:(unsigned int)a3
{
  self->_unsigned int previousInstallType = a3;
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unint64_t)a3
{
  self->_sequenceNumber = a3;
}

- (BOOL)registerChildItemsTrusted
{
  return self->_registerChildItemsTrusted;
}

- (BOOL)containerized
{
  return self->_sdkVersionNumber._opaque[24];
}

- (BOOL)webNotificationPlaceholder
{
  return self->_sdkVersionNumber._opaque[25];
}

- (NSNumber)compatibilityState
{
  return *(NSNumber **)&self->_containerized;
}

- (NSNumber)installFailureReason
{
  return self->_compatibilityState;
}

- (NSString)version
{
  return (NSString *)&self->_installFailureReason->super.super.isa;
}

- (NSString)minSystemVersion
{
  return self->_version;
}

- (NSString)maxSystemVersion
{
  return self->_minSystemVersion;
}

- (NSString)sdkVersion
{
  return self->_maxSystemVersion;
}

- (NSString)appStoreToolsBuildVersion
{
  return self->_sdkVersion;
}

- (NSString)shortVersionString
{
  return self->_appStoreToolsBuildVersion;
}

- (NSString)execPath
{
  return self->_shortVersionString;
}

- (NSArray)machOUUIDs
{
  return (NSArray *)self->_execPath;
}

- (NSNumber)itemID
{
  return (NSNumber *)self->_machOUUIDs;
}

- (NSString)teamID
{
  return (NSString *)&self->_itemID->super.super.isa;
}

- (NSArray)activityTypes
{
  return (NSArray *)self->_teamID;
}

- (NSArray)deviceFamily
{
  return self->_activityTypes;
}

- (NSNumber)installType
{
  return (NSNumber *)self->_deviceFamily;
}

- (NSString)identifier
{
  return (NSString *)&self->_installType->super.super.isa;
}

- (NSString)displayName
{
  return self->_identifier;
}

- (NSString)shortDisplayName
{
  return self->_displayName;
}

- (NSString)bundleName
{
  return self->_shortDisplayName;
}

- (NSArray)alternateNames
{
  return (NSArray *)self->_bundleName;
}

- (NSURL)dataContainerURL
{
  return (NSURL *)self->_alternateNames;
}

- (NSURL)bundleContainerURL
{
  return self->_dataContainerURL;
}

- (NSString)categoryType
{
  return (NSString *)&self->_bundleContainerURL->super.isa;
}

- (NSString)secondCategoryType
{
  return self->_categoryType;
}

- (NSString)vendorName
{
  return self->_secondCategoryType;
}

- (NSString)appType
{
  return self->_vendorName;
}

- (NSString)signerIdentity
{
  return self->_appType;
}

- (NSString)codeInfoIdentifier
{
  return self->_signerIdentity;
}

- (NSString)signerOrganization
{
  return self->_codeInfoIdentifier;
}

- (NSString)itemName
{
  return self->_signerOrganization;
}

- (NSNumber)storefront
{
  return (NSNumber *)self->_itemName;
}

- (NSNumber)versionID
{
  return self->_storefront;
}

- (NSString)sourceAppBundleID
{
  return (NSString *)&self->_versionID->super.super.isa;
}

- (NSString)appVariant
{
  return self->_sourceAppBundleID;
}

- (NSString)managementDeclarationIdentifier
{
  return self->_appVariant;
}

- (NSMutableSet)counterpartAppBundleIDs
{
  return (NSMutableSet *)self->_managementDeclarationIdentifier;
}

- (NSMutableSet)equivalentBundleIDs
{
  return self->_counterpartAppBundleIDs;
}

- (NSString)watchKitVersion
{
  return (NSString *)&self->_equivalentBundleIDs->super.super.isa;
}

- (NSString)complicationPrincipalClass
{
  return self->_watchKitVersion;
}

- (NSArray)supportedComplicationFamilies
{
  return (NSArray *)self->_complicationPrincipalClass;
}

- (NSString)ratingLabel
{
  return (NSString *)&self->_supportedComplicationFamilies->super.isa;
}

- (NSNumber)ratingRank
{
  return (NSNumber *)self->_ratingLabel;
}

- (NSString)genre
{
  return (NSString *)&self->_ratingRank->super.super.isa;
}

- (NSNumber)genreID
{
  return (NSNumber *)self->_genre;
}

- (NSDictionary)distributorInfo
{
  return (NSDictionary *)self->_genreID;
}

- (NSString)primaryIconName
{
  return (NSString *)&self->_distributorInfo->super.isa;
}

- (NSString)alternatePrimaryIconName
{
  return self->_primaryIconName;
}

- (NSDictionary)iconsDict
{
  return (NSDictionary *)self->_alternatePrimaryIconName;
}

- (NSArray)iconFileNames
{
  return (NSArray *)self->_iconsDict;
}

- (NSNumber)purchaserDSID
{
  return (NSNumber *)self->_iconFileNames;
}

- (NSNumber)downloaderDSID
{
  return self->_purchaserDSID;
}

- (NSNumber)familyID
{
  return self->_downloaderDSID;
}

- (NSNumber)staticDiskUsage
{
  return self->_familyID;
}

- (NSString)libraryPath
{
  return (NSString *)&self->_staticDiskUsage->super.super.isa;
}

- (NSArray)libraryItems
{
  return (NSArray *)self->_libraryPath;
}

- (NSArray)documentClaims
{
  return self->_libraryItems;
}

- (NSArray)URLClaims
{
  return self->_documentClaims;
}

- (NSArray)importedTypes
{
  return self->_URLClaims;
}

- (NSArray)exportedTypes
{
  return self->_importedTypes;
}

- (NSArray)queriableSchemes
{
  return self->_exportedTypes;
}

- (NSDictionary)pluginPlists
{
  return (NSDictionary *)self->_queriableSchemes;
}

- (NSDictionary)pluginMIDicts
{
  return self->_pluginPlists;
}

- (NSArray)driverExtensionPaths
{
  return (NSArray *)self->_pluginMIDicts;
}

- (NSDictionary)groupContainers
{
  return (NSDictionary *)self->_driverExtensionPaths;
}

- (NSDictionary)entitlements
{
  return self->_groupContainers;
}

- (NSDictionary)sandboxEnvironmentVariables
{
  return self->_entitlements;
}

- (NSDictionary)extensionSDK
{
  return self->_sandboxEnvironmentVariables;
}

- (NSDictionary)intentDefinitionURLs
{
  return self->_extensionSDK;
}

- (NSArray)bgPermittedIdentifiers
{
  return (NSArray *)self->_intentDefinitionURLs;
}

- (unsigned)profileValidationState
{
  return self->_sdkVersionNumber._opaque[26];
}

- (void)setProfileValidationState:(unsigned __int8)a3
{
  self->_sdkVersionNumber._opaque[26] = a3;
}

- (NSDictionary)localizedNames
{
  return (NSDictionary *)self->_bgPermittedIdentifiers;
}

- (NSDictionary)localizedShortNames
{
  return self->_localizedNames;
}

- (NSDictionary)localizedStrings
{
  return self->_localizedShortNames;
}

- (NSDictionary)unlocalizedNamesWithContext
{
  return self->_localizedStrings;
}

- (NSArray)bundlePersonas
{
  return (NSArray *)self->_unlocalizedNamesWithContext;
}

- (NSNumber)directoryClass
{
  return (NSNumber *)self->_bundlePersonas;
}

- (NSDictionary)mobileInstallIDs
{
  return (NSDictionary *)objc_getProperty(self, a2, 784LL, 1);
}

- (NSArray)slices
{
  return (NSArray *)self->_mobileInstallIDs;
}

- (NSNumber)signatureVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 800LL, 1);
}

- (NSDictionary)stashedAppInfo
{
  return (NSDictionary *)self->_signatureVersion;
}

- (NSString)applicationManagementDomain
{
  return (NSString *)&self->_stashedAppInfo->super.isa;
}

- (NSString)linkedParentBundleID
{
  return self->_applicationManagementDomain;
}

- (void).cxx_destruct
{
}

- (void)parseNSExtensionSDKDefinitionsFromDictionary:(os_log_t)log .cold.1( void *a1,  uint8_t *buf,  os_log_t log)
{
  *(_DWORD *)std::vector<unsigned int> buf = 136315650;
  *(void *)(buf + 4) = "-[LSBundleRecordBuilder parseNSExtensionSDKDefinitionsFromDictionary:]";
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  *((_WORD *)buf + 11) = 2112;
  *((void *)buf + 3) = @"_LSBundleExtensionPoints";
}

- (void)registerBundleRecord:(uint64_t)a3 error:(uint64_t)a4 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)registerBundleRecord:(uint64_t)a3 error:(uint64_t)a4 .cold.2( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end
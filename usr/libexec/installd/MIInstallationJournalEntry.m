@interface MIInstallationJournalEntry
+ (BOOL)supportsSecureCoding;
+ (id)_registerUsingDiscoveredInfoForAppIdentity:(id)a3 inDomain:(unint64_t)a4 error:(id *)a5;
+ (void)_attemptLSUpdateWithDiscoveredStateForIdentity:(id)a3 domain:(unint64_t)a4;
- (BOOL)_beginLaunchServicesRegistrationWithError:(id *)a3;
- (BOOL)_commitContainersWithError:(id *)a3;
- (BOOL)_findBundleContainerForToken:(id)a3 error:(id *)a4;
- (BOOL)_gatherLaunchServicesRegistrationInfoWithError:(id *)a3;
- (BOOL)_linkToParentApplication:(id *)a3;
- (BOOL)_performJournaledInstallAsReplay:(BOOL)a3 withError:(id *)a4;
- (BOOL)_populateSigningInfoWithError:(id *)a3;
- (BOOL)_refreshUUIDForContainer:(id)a3 withError:(id *)a4;
- (BOOL)_updateJournalPhaseTo:(unint64_t)a3 withError:(id *)a4;
- (BOOL)_updateReferencesWithError:(id *)a3;
- (BOOL)_writeJournalEntryWithError:(id *)a3;
- (BOOL)cleanUpJournaledDataOnDiskWithError:(id *)a3;
- (BOOL)finalizeContainersWithError:(id *)a3;
- (BOOL)finalizeWithError:(id *)a3;
- (BOOL)isPlaceholderInstall;
- (BOOL)makeStagedBackgroundUpdateLive:(id *)a3;
- (BOOL)performLaunchServicesRegistrationWithError:(id *)a3;
- (BOOL)shouldModifyExistingContainers;
- (BOOL)shouldPersist;
- (BOOL)stageUpdateForLater:(id *)a3;
- (LSRecordPromise)recordPromise;
- (MIAppIdentity)identity;
- (MIBundleContainer)bundleContainer;
- (MIBundleContainer)existingBundleContainer;
- (MICodeSigningInfo)bundleSigningInfo;
- (MIDataContainer)dataContainer;
- (MIExecutableBundle)bundle;
- (MIInstallOptions)installOptions;
- (MIInstallationJournalEntry)initWithCoder:(id)a3;
- (MIInstallationJournalEntry)initWithIdentity:(id)a3 bundleContainer:(id)a4 existingBundleContainer:(id)a5 installationDomain:(unint64_t)a6 operationType:(unint64_t)a7 installOptions:(id)a8 bundleSigningInfo:(id)a9;
- (NSArray)appExtensionBundles;
- (NSArray)appExtensionDataContainers;
- (NSArray)bundleRecordsToRegister;
- (NSArray)noLongerPresentAppExtensionDataContainers;
- (NSString)description;
- (NSString)linkToParentBundleID;
- (NSString)uniqueIdentifier;
- (NSUUID)journalEntryID;
- (id)_containerLinkManager;
- (id)_containerProtectionManager;
- (id)_freeProfileValidatedAppTracker;
- (id)_journalInstance;
- (id)_keychainAccessGroupTracker;
- (id)_registerInstalledInfo:(id)a3 forIdentity:(id)a4 inDomain:(unint64_t)a5 error:(id *)a6;
- (id)_systemAppState;
- (id)_uninstalledAppList;
- (id)progressBlock;
- (unint64_t)attemptCount;
- (unint64_t)installationDomain;
- (unint64_t)journalPhase;
- (unint64_t)operationType;
- (void)_purgeJournalEntry;
- (void)_updateContainerStatePostCommit;
- (void)encodeWithCoder:(id)a3;
- (void)setAppExtensionBundles:(id)a3;
- (void)setAppExtensionDataContainers:(id)a3;
- (void)setDataContainer:(id)a3;
- (void)setJournalPhase:(unint64_t)a3;
- (void)setLinkToParentBundleID:(id)a3;
- (void)setNoLongerPresentAppExtensionDataContainers:(id)a3;
- (void)setProgressBlock:(id)a3;
@end

@implementation MIInstallationJournalEntry

- (id)_containerLinkManager
{
  return +[MIContainerLinkManager sharedInstanceForDomain:]( &OBJC_CLASS___MIContainerLinkManager,  "sharedInstanceForDomain:",  -[MIInstallationJournalEntry installationDomain](self, "installationDomain"));
}

- (id)_keychainAccessGroupTracker
{
  return +[MIKeychainAccessGroupTracker sharedTracker](&OBJC_CLASS___MIKeychainAccessGroupTracker, "sharedTracker");
}

- (id)_freeProfileValidatedAppTracker
{
  return +[MIFreeProfileValidatedAppTracker sharedTracker]( &OBJC_CLASS___MIFreeProfileValidatedAppTracker,  "sharedTracker");
}

- (id)_systemAppState
{
  return +[MISystemAppState sharedList](&OBJC_CLASS___MISystemAppState, "sharedList");
}

- (id)_containerProtectionManager
{
  return +[MIContainerProtectionManager defaultManager](&OBJC_CLASS___MIContainerProtectionManager, "defaultManager");
}

- (id)_uninstalledAppList
{
  return +[MIUninstalledAppList sharedList](&OBJC_CLASS___MIUninstalledAppList, "sharedList");
}

- (id)_journalInstance
{
  return +[MIJournal sharedInstance](&OBJC_CLASS___MIJournal, "sharedInstance");
}

+ (id)_registerUsingDiscoveredInfoForAppIdentity:(id)a3 inDomain:(unint64_t)a4 error:(id *)a5
{
  return +[MILaunchServicesOperationManager registerUsingDiscoveredInfoForAppIdentity:inDomain:error:]( &OBJC_CLASS___MILaunchServicesOperationManager,  "registerUsingDiscoveredInfoForAppIdentity:inDomain:error:",  a3,  a4,  a5);
}

- (id)_registerInstalledInfo:(id)a3 forIdentity:(id)a4 inDomain:(unint64_t)a5 error:(id *)a6
{
  return +[MILaunchServicesOperationManager registerInstalledInfo:forIdentity:inDomain:error:]( &OBJC_CLASS___MILaunchServicesOperationManager,  "registerInstalledInfo:forIdentity:inDomain:error:",  a3,  a4,  a5,  a6);
}

+ (void)_attemptLSUpdateWithDiscoveredStateForIdentity:(id)a3 domain:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = MIStringForInstallationDomain(a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
  {
    id v11 = v6;
    v12 = v8;
    MOLogWrite(qword_100095BF8);
  }

  id v13 = 0LL;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_registerUsingDiscoveredInfoForAppIdentity:inDomain:error:", v6, a4, &v13, v11, v12));
  id v10 = v13;

  if (!v9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100050CB8();
    }
  }
}

- (MIInstallationJournalEntry)initWithIdentity:(id)a3 bundleContainer:(id)a4 existingBundleContainer:(id)a5 installationDomain:(unint64_t)a6 operationType:(unint64_t)a7 installOptions:(id)a8 bundleSigningInfo:(id)a9
{
  id v15 = a3;
  id v25 = a4;
  id v24 = a5;
  id v16 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___MIInstallationJournalEntry;
  v18 = -[MIInstallationJournalEntry init](&v26, "init");
  if (v18)
  {
    v19 = (MIAppIdentity *)[v15 copy];
    identity = v18->_identity;
    v18->_identity = v19;

    objc_storeStrong((id *)&v18->_bundleContainer, a4);
    objc_storeStrong((id *)&v18->_existingBundleContainer, a5);
    v18->_installationDomain = a6;
    v18->_operationType = a7;
    objc_storeStrong((id *)&v18->_installOptions, a8);
    objc_storeStrong((id *)&v18->_bundleSigningInfo, a9);
    v18->_journalPhase = 1LL;
    v18->_attemptCount = 0LL;
    v21 = objc_opt_new(&OBJC_CLASS___NSUUID);
    journalEntryID = v18->_journalEntryID;
    v18->_journalEntryID = v21;

    if (_os_feature_enabled_impl("MobileInstallation", "install_journal"))
    {
    }
  }

  return v18;
}

- (BOOL)_populateSigningInfoWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundle](self, "bundle"));
  id v12 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 codeSigningInfoByValidatingResources:0 performingOnlineAuthorization:0 ignoringCachedSigningInfo:0 checking TrustCacheIfApplicable:0 skippingProfileIDValidation:0 error:&v12]);
  id v8 = v12;
  if (v6)
  {
    objc_storeStrong((id *)&self->_bundleSigningInfo, v6);
  }

  else
  {
    id v9 = sub_1000130F4( (uint64_t)"-[MIInstallationJournalEntry _populateSigningInfoWithError:]",  228LL,  MIInstallerErrorDomain,  4LL,  v8,  0LL,  @"Failed to get signing info for bundle %@",  v7,  (uint64_t)v5);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

    if (a3)
    {
      id v8 = v10;
      *a3 = v8;
    }

    else
    {
      id v8 = v10;
    }
  }

  return v6 != 0LL;
}

- (BOOL)_findBundleContainerForToken:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (self->_journalPhase == 2) {
    uint64_t v7 = 2LL;
  }
  else {
    uint64_t v7 = 3LL;
  }
  id v16 = 0LL;
  id v8 = -[MIBundleContainer initWithToken:options:error:]( objc_alloc(&OBJC_CLASS___MIBundleContainer),  "initWithToken:options:error:",  v6,  v7,  &v16);
  id v9 = v16;
  bundleContainer = self->_bundleContainer;
  self->_bundleContainer = v8;

  id v12 = self->_bundleContainer;
  if (!v12)
  {
    id v13 = sub_1000130F4( (uint64_t)"-[MIInstallationJournalEntry _findBundleContainerForToken:error:]",  257LL,  MIInstallerErrorDomain,  186LL,  v9,  0LL,  @"Failed to locate bundle container for token %@",  v11,  (uint64_t)v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

    if (a4)
    {
      id v9 = v14;
      *a4 = v9;
    }

    else
    {
      id v9 = v14;
    }
  }

  return v12 != 0LL;
}

- (MIInstallationJournalEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v108.receiver = self;
  v108.super_class = (Class)&OBJC_CLASS___MIInstallationJournalEntry;
  v5 = -[MIInstallationJournalEntry init](&v108, "init");
  if (!v5)
  {
    id v14 = 0LL;
    goto LABEL_6;
  }

  id v6 = [v4 decodeObjectOfClass:objc_opt_class(MIAppIdentity) forKey:@"identity"];
  uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
  identity = v5->_identity;
  v5->_identity = (MIAppIdentity *)v7;

  if (!v5->_identity)
  {
    id v17 = (void *)MIInstallerErrorDomain;
    v18 = @"Decoded object was missing identity.";
    uint64_t v19 = 278LL;
LABEL_12:
    id v13 = sub_1000130F4( (uint64_t)"-[MIInstallationJournalEntry initWithCoder:]",  v19,  v17,  186LL,  0LL,  0LL,  v18,  v9,  v90);
    goto LABEL_13;
  }

  id v10 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"journalPhase"];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v5->_journalPhase = (unint64_t)[v11 unsignedIntegerValue];

  if (v5->_journalPhase - 8 <= 0xFFFFFFFFFFFFFFF8LL)
  {
    id v13 = sub_1000130F4( (uint64_t)"-[MIInstallationJournalEntry initWithCoder:]",  285LL,  MIInstallerErrorDomain,  186LL,  0LL,  0LL,  @"Got invalid journal phase: %lu.",  v12,  v5->_journalPhase);
LABEL_13:
    id v16 = (id)objc_claimAutoreleasedReturnValue(v13);
    v28 = 0LL;
    goto LABEL_14;
  }

  id v20 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"attemptCount"];
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v5->_attemptCount = (unint64_t)[v21 unsignedIntegerValue];

  ++v5->_attemptCount;
  id v22 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"installationDomain"];
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v5->_unint64_t installationDomain = (unint64_t)[v23 unsignedIntegerValue];

  unint64_t installationDomain = v5->_installationDomain;
  if ((MIIsValidInstallationDomain(installationDomain) & 1) == 0)
  {
    id v17 = (void *)MIInstallerErrorDomain;
    uint64_t v90 = installationDomain;
    v18 = @"Got invalid installation domain: %lu.";
    uint64_t v19 = 295LL;
    goto LABEL_12;
  }

  id v25 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"operationType"];
  objc_super v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v5->_operationType = (unint64_t)[v26 unsignedIntegerValue];

  if (v5->_operationType - 6 <= 0xFFFFFFFFFFFFFFFALL)
  {
    id v13 = sub_1000130F4( (uint64_t)"-[MIInstallationJournalEntry initWithCoder:]",  304LL,  MIInstallerErrorDomain,  186LL,  0LL,  0LL,  @"Got invalid journal operation type: %lu.",  v27,  v5->_operationType);
    goto LABEL_13;
  }

  id v30 = [v4 decodeObjectOfClass:objc_opt_class(MIInstallOptions) forKey:@"installOptions"];
  uint64_t v31 = objc_claimAutoreleasedReturnValue(v30);
  installOptions = v5->_installOptions;
  v5->_installOptions = (MIInstallOptions *)v31;

  id v33 = [v4 decodeObjectOfClass:objc_opt_class(NSUUID) forKey:@"journalEntryID"];
  uint64_t v34 = objc_claimAutoreleasedReturnValue(v33);
  journalEntryID = v5->_journalEntryID;
  v5->_journalEntryID = (NSUUID *)v34;

  id v36 = [v4 decodeObjectOfClass:objc_opt_class(MIBundleContainerToken) forKey:@"BundleContainerToken"];
  uint64_t v37 = objc_claimAutoreleasedReturnValue(v36);
  if (!v37)
  {
    id v17 = (void *)MIInstallerErrorDomain;
    v18 = @"Serialized journal entry did not contain bundle container token.";
    uint64_t v19 = 314LL;
    goto LABEL_12;
  }

  v38 = (void *)v37;
  id v107 = 0LL;
  unsigned int v39 = -[MIInstallationJournalEntry _findBundleContainerForToken:error:]( v5,  "_findBundleContainerForToken:error:",  v37,  &v107);
  id v16 = v107;
  if (!v39)
  {
    v28 = v38;
    goto LABEL_14;
  }

  -[MIInstallationJournalEntry _populateSigningInfoWithError:](v5, "_populateSigningInfoWithError:", 0LL);
  id v40 = [v4 decodeObjectOfClass:objc_opt_class(MIBundleContainerToken) forKey:@"ExistingBundleContainerToken"];
  v28 = (void *)objc_claimAutoreleasedReturnValue(v40);

  if (-[MIInstallationJournalEntry journalPhase](v5, "journalPhase") < 2)
  {
    if (v28) {
      objc_storeStrong((id *)&v5->_existingBundleContainer, v5->_bundleContainer);
    }
  }

  else if (v28)
  {
    id v106 = v16;
    v41 = -[MIBundleContainer initWithToken:options:error:]( objc_alloc(&OBJC_CLASS___MIBundleContainer),  "initWithToken:options:error:",  v28,  1LL,  &v106);
    id v42 = v106;

    existingBundleContainer = v5->_existingBundleContainer;
    v5->_existingBundleContainer = v41;

    if (!v5->_existingBundleContainer)
    {
      id v86 = sub_1000130F4( (uint64_t)"-[MIInstallationJournalEntry initWithCoder:]",  330LL,  MIInstallerErrorDomain,  186LL,  v42,  0LL,  @"Expected to find existing bundle container but lookup failed.",  v44,  v90);
      id v16 = (id)objc_claimAutoreleasedReturnValue(v86);

      goto LABEL_14;
    }

    id v16 = v42;
  }

  id v45 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"linkToParentBundleID"];
  uint64_t v46 = objc_claimAutoreleasedReturnValue(v45);
  linkToParentBundleID = v5->_linkToParentBundleID;
  v5->_linkToParentBundleID = (NSString *)v46;

  v48 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v93 = v4;
  id v49 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class(MIContainerToken) forKey:@"NoLongerPresentContainerTokens"];
  v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
  __int128 v102 = 0u;
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  __int128 v105 = 0u;
  id v51 = [v50 countByEnumeratingWithState:&v102 objects:v110 count:16];
  if (v51)
  {
    id v52 = v51;
    uint64_t v53 = *(void *)v103;
    do
    {
      for (i = 0LL; i != v52; i = (char *)i + 1)
      {
        if (*(void *)v103 != v53) {
          objc_enumerationMutation(v50);
        }
        id v55 = [[MIPluginDataContainer alloc] initWithToken:*(void *)(*((void *)&v102 + 1) + 8 * (void)i) options:0 error:0];
        if (v55) {
          -[NSMutableArray addObject:](v48, "addObject:", v55);
        }
      }

      id v52 = [v50 countByEnumeratingWithState:&v102 objects:v110 count:16];
    }

    while (v52);
  }

  if (-[NSMutableArray count](v48, "count"))
  {
    v56 = (NSArray *)-[NSMutableArray copy](v48, "copy");
    noLongerPresentAppExtensionDataContainers = v5->_noLongerPresentAppExtensionDataContainers;
    v5->_noLongerPresentAppExtensionDataContainers = v56;
  }

  v58 = v93;
  id v59 = [v93 decodeObjectOfClass:objc_opt_class(MIContainerToken) forKey:@"DataContainerToken"];
  v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
  if (!v60)
  {
    v91 = 0LL;
    goto LABEL_44;
  }

  id v101 = v16;
  v61 = -[MIDataContainer initWithToken:options:error:]( objc_alloc(&OBJC_CLASS___MIDataContainer),  "initWithToken:options:error:",  v60,  0LL,  &v101);
  id v62 = v101;

  dataContainer = v5->_dataContainer;
  v5->_dataContainer = v61;

  if (v5->_dataContainer)
  {
    v91 = v60;
    id v16 = v62;
    v58 = v93;
LABEL_44:
    v92 = v28;
    id v65 = [v58 decodeArrayOfObjectsOfClass:objc_opt_class(MIContainerToken) forKey:@"AppExtensionDataContainerTokens"];
    v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
    -[NSMutableArray removeAllObjects](v48, "removeAllObjects");
    __int128 v99 = 0u;
    __int128 v100 = 0u;
    __int128 v97 = 0u;
    __int128 v98 = 0u;
    id v67 = v66;
    id v68 = [v67 countByEnumeratingWithState:&v97 objects:v109 count:16];
    if (v68)
    {
      id v69 = v68;
      uint64_t v70 = *(void *)v98;
      id obj = v67;
      while (2)
      {
        v71 = 0LL;
        v72 = v16;
        do
        {
          if (*(void *)v98 != v70) {
            objc_enumerationMutation(obj);
          }
          uint64_t v73 = *(void *)(*((void *)&v97 + 1) + 8LL * (void)v71);
          id v74 = objc_alloc(&OBJC_CLASS___MIPluginDataContainer);
          id v96 = v72;
          id v75 = [v74 initWithToken:v73 options:0 error:&v96];
          id v16 = v96;

          if (!v75)
          {
            id v82 = sub_1000130F4( (uint64_t)"-[MIInstallationJournalEntry initWithCoder:]",  383LL,  MIInstallerErrorDomain,  186LL,  v16,  0LL,  @"Expected to find app extension data container but lookup failed.",  v76,  v90);
            uint64_t v83 = objc_claimAutoreleasedReturnValue(v82);
            id v67 = obj;
            v84 = obj;
            goto LABEL_60;
          }

          -[NSMutableArray addObject:](v48, "addObject:", v75);

          v71 = (char *)v71 + 1;
          v72 = v16;
        }

        while (v69 != v71);
        id v67 = obj;
        id v69 = [obj countByEnumeratingWithState:&v97 objects:v109 count:16];
        if (v69) {
          continue;
        }
        break;
      }
    }

    if (-[NSMutableArray count](v48, "count"))
    {
      v77 = (NSArray *)-[NSMutableArray copy](v48, "copy");
      appExtensionDataContainers = v5->_appExtensionDataContainers;
      v5->_appExtensionDataContainers = v77;
    }

    v79 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundle](v5, "bundle"));
    id v95 = v16;
    uint64_t v80 = objc_claimAutoreleasedReturnValue([v79 appExtensionBundlesWithError:&v95]);
    id v14 = v95;

    appExtensionBundles = v5->_appExtensionBundles;
    v5->_appExtensionBundles = (NSArray *)v80;

    if (!v5->_appExtensionBundles)
    {
      v87 = (void *)MIInstallerErrorDomain;
      v84 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundle](v5, "bundle"));
      id v89 = sub_1000130F4( (uint64_t)"-[MIInstallationJournalEntry initWithCoder:]",  395LL,  v87,  186LL,  v14,  0LL,  @"Failed to locate app extension bundles in bundle %@.",  v88,  (uint64_t)v84);
      uint64_t v83 = objc_claimAutoreleasedReturnValue(v89);
      id v16 = v14;
LABEL_60:

      id v16 = (id)v83;
      v28 = v92;
      id v4 = v93;
      goto LABEL_14;
    }

    id v4 = v93;
LABEL_6:
    id v15 = v5;
    id v16 = v14;
    goto LABEL_18;
  }

  id v85 = sub_1000130F4( (uint64_t)"-[MIInstallationJournalEntry initWithCoder:]",  372LL,  MIInstallerErrorDomain,  186LL,  v62,  0LL,  @"Expected to find data container but lookup failed.",  v64,  v90);
  id v16 = (id)objc_claimAutoreleasedReturnValue(v85);

  id v4 = v93;
LABEL_14:

  if (v5->_identity && MIIsValidInstallationDomain(v5->_installationDomain)) {
    [(id)objc_opt_class(v5) _attemptLSUpdateWithDiscoveredStateForIdentity:v5->_identity domain:v5->_installationDomain];
  }
  [v4 failWithError:v16];
  id v15 = 0LL;
LABEL_18:

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry identity](self, "identity"));
  [v4 encodeObject:v5 forKey:@"identity"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[MIInstallationJournalEntry journalPhase](self, "journalPhase")));
  [v4 encodeObject:v6 forKey:@"journalPhase"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[MIInstallationJournalEntry attemptCount](self, "attemptCount")));
  [v4 encodeObject:v7 forKey:@"attemptCount"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[MIInstallationJournalEntry installationDomain](self, "installationDomain")));
  [v4 encodeObject:v8 forKey:@"installationDomain"];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[MIInstallationJournalEntry operationType](self, "operationType")));
  [v4 encodeObject:v9 forKey:@"operationType"];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry installOptions](self, "installOptions"));
  [v4 encodeObject:v10 forKey:@"installOptions"];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry journalEntryID](self, "journalEntryID"));
  [v4 encodeObject:v11 forKey:@"journalEntryID"];

  id v12 = objc_alloc(&OBJC_CLASS___MIBundleContainerToken);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundleContainer](self, "bundleContainer"));
  id v14 = [v12 initWithContainer:v13];

  [v4 encodeObject:v14 forKey:@"BundleContainerToken"];
  uint64_t v15 = objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry existingBundleContainer](self, "existingBundleContainer"));
  uint64_t v34 = (void *)v15;
  if (v15)
  {
    id v16 = [[MIBundleContainerToken alloc] initWithContainer:v15];

    [v4 encodeObject:v16 forKey:@"ExistingBundleContainerToken"];
    id v14 = v16;
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry linkToParentBundleID](self, "linkToParentBundleID"));
  [v4 encodeObject:v17 forKey:@"linkToParentBundleID"];

  v18 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  uint64_t v19 = self->_noLongerPresentAppExtensionDataContainers;
  id v20 = -[NSArray countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v39,  v44,  16LL);
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v40;
    do
    {
      v23 = 0LL;
      do
      {
        if (*(void *)v40 != v22) {
          objc_enumerationMutation(v19);
        }
        id v24 = [[MIContainerToken alloc] initWithContainer:*(void *)(*((void *)&v39 + 1) + 8 * (void)v23)];
        -[NSMutableArray addObject:](v18, "addObject:", v24);

        v23 = (char *)v23 + 1;
      }

      while (v21 != v23);
      id v21 = -[NSArray countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v39,  v44,  16LL);
    }

    while (v21);
  }

  if (-[NSMutableArray count](v18, "count")) {
    [v4 encodeObject:v18 forKey:@"NoLongerPresentContainerTokens"];
  }
  id v25 = objc_alloc(&OBJC_CLASS___MIContainerToken);
  objc_super v26 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry dataContainer](self, "dataContainer"));
  id v27 = [v25 initWithContainer:v26];

  [v4 encodeObject:v27 forKey:@"DataContainerToken"];
  -[NSMutableArray removeAllObjects](v18, "removeAllObjects");
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  v28 = self->_appExtensionDataContainers;
  id v29 = -[NSArray countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v35,  v43,  16LL);
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v36;
    do
    {
      v32 = 0LL;
      do
      {
        if (*(void *)v36 != v31) {
          objc_enumerationMutation(v28);
        }
        id v33 = [[MIContainerToken alloc] initWithContainer:*(void *)(*((void *)&v35 + 1) + 8 * (void)v32)];
        -[NSMutableArray addObject:](v18, "addObject:", v33);

        v32 = (char *)v32 + 1;
      }

      while (v30 != v32);
      id v30 = -[NSArray countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v35,  v43,  16LL);
    }

    while (v30);
  }

  if (-[NSMutableArray count](v18, "count")) {
    [v4 encodeObject:v18 forKey:@"AppExtensionDataContainerTokens"];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class(self);
  id v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry identity](self, "identity"));
  uint64_t v7 = MIStringForInstallationDomain(-[MIInstallationJournalEntry installationDomain](self, "installationDomain"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  unint64_t v9 = -[MIInstallationJournalEntry operationType](self, "operationType");
  id v10 = sub_10002F280(-[MIInstallationJournalEntry journalPhase](self, "journalPhase"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundle](self, "bundle"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleVersion]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@<%p> %@/%@ op:%lu phase:%@ version:%@>",  v5,  self,  v6,  v8,  v9,  v11,  v13));

  return (NSString *)v14;
}

- (NSString)uniqueIdentifier
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry journalEntryID](self, "journalEntryID"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 UUIDString]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry identity](self, "identity"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleID]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@_%@", v4, v6));

  return (NSString *)v7;
}

- (BOOL)shouldPersist
{
  return (id)-[MIInstallationJournalEntry operationType](self, "operationType") == (id)5;
}

- (MIExecutableBundle)bundle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundleContainer](self, "bundleContainer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 bundle]);

  return (MIExecutableBundle *)v3;
}

- (BOOL)shouldModifyExistingContainers
{
  return (id)-[MIInstallationJournalEntry operationType](self, "operationType") != (id)3;
}

- (BOOL)isPlaceholderInstall
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry installOptions](self, "installOptions"));
  unint64_t v3 = (unint64_t)[v2 installTargetType];

  return (v3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)_writeJournalEntryWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry _journalInstance](self, "_journalInstance"));
  LOBYTE(a3) = [v5 writeJournalEntry:self withError:a3];

  return (char)a3;
}

- (void)_purgeJournalEntry
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry _journalInstance](self, "_journalInstance"));
  [v3 purgeJournalEntry:self withError:0];
}

- (BOOL)_updateJournalPhaseTo:(unint64_t)a3 withError:(id *)a4
{
  id v15 = 0LL;
  BOOL v7 = -[MIInstallationJournalEntry _writeJournalEntryWithError:](self, "_writeJournalEntryWithError:", &v15);
  id v8 = v15;
  if (!v7)
  {
    unint64_t v9 = (void *)MIInstallerErrorDomain;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry identity](self, "identity"));
    id v11 = sub_1000130F4( (uint64_t)"-[MIInstallationJournalEntry _updateJournalPhaseTo:withError:]",  531LL,  v9,  188LL,  v8,  0LL,  @"Failed to write updated journal with phase %lu for %@",  v10,  a3);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    if (a4)
    {
      id v8 = v12;
      *a4 = v8;
    }

    else
    {
      id v8 = v12;
    }
  }

  return v7;
}

- (BOOL)_refreshUUIDForContainer:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  if (!-[MIInstallationJournalEntry shouldModifyExistingContainers](self, "shouldModifyExistingContainers")
    || [v6 status] != (id)1)
  {
    id v9 = 0LL;
LABEL_8:
    BOOL v13 = 1;
    goto LABEL_9;
  }

  id v16 = 0LL;
  unsigned int v7 = [v6 regenerateDirectoryUUIDWithError:&v16];
  id v8 = v16;
  id v9 = v8;
  if (v7)
  {
    uint64_t v10 = qword_100095BF8;
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 containerURL]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 path]);
      MOLogWrite(v10);
    }

    goto LABEL_8;
  }

  if (a4)
  {
    id v9 = v8;
    BOOL v13 = 0;
    *a4 = v9;
  }

  else
  {
    BOOL v13 = 0;
  }

- (BOOL)_linkToParentApplication:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry linkToParentBundleID](self, "linkToParentBundleID"));
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry _containerLinkManager](self, "_containerLinkManager"));
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundleContainer](self, "bundleContainer"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    id v12 = 0LL;
    unsigned __int8 v9 = [v6 linkChild:v8 toParent:v5 error:&v12];
    id v10 = v12;

    if (a3 && (v9 & 1) == 0)
    {
      id v10 = v10;
      unsigned __int8 v9 = 0;
      *a3 = v10;
    }
  }

  else
  {
    id v10 = 0LL;
    unsigned __int8 v9 = 1;
  }

  return v9;
}

- (BOOL)_updateReferencesWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry _keychainAccessGroupTracker](self, "_keychainAccessGroupTracker"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry _freeProfileValidatedAppTracker](self, "_freeProfileValidatedAppTracker"));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry existingBundleContainer](self, "existingBundleContainer"));

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry existingBundleContainer](self, "existingBundleContainer"));
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundle]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundleContainer](self, "bundleContainer"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bundle]);
    id v34 = 0LL;
    unsigned __int8 v12 = [v5 updateReferencesWithOldBundle:v9 newBundle:v11 error:&v34];
    id v13 = v34;

    if ((v12 & 1) == 0)
    {
      uint64_t v14 = qword_100095BF8;
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundle](self, "bundle"));
        id v29 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
        id v30 = v13;
        MOLogWrite(v14);
      }

      [v5 invalidateCache];
      id v13 = 0LL;
    }

- (BOOL)_commitContainersWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry dataContainer](self, "dataContainer"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundle](self, "bundle"));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);

  if (!v5 || [v5 status] == (id)3)
  {
    uint64_t v46 = a3;
    id v8 = 0LL;
LABEL_4:
    id v45 = v5;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry appExtensionDataContainers](self, "appExtensionDataContainers"));
    id v10 = [v9 countByEnumeratingWithState:&v56 objects:v63 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v57;
      while (2)
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v57 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v56 + 1) + 8LL * (void)i);
          id v55 = v8;
          unsigned int v15 = -[MIInstallationJournalEntry _refreshUUIDForContainer:withError:]( self,  "_refreshUUIDForContainer:withError:",  v14,  &v55);
          id v16 = v55;

          if (!v15)
          {
            LOBYTE(v23) = 0;
            goto LABEL_27;
          }

          if ([v14 status] == (id)3)
          {
            id v8 = v16;
          }

          else
          {
            id v54 = v16;
            unsigned int v17 = [v14 makeContainerLiveWithError:&v54];
            id v8 = v54;

            if (!v17)
            {
              LOBYTE(v23) = 0;
LABEL_26:
              id v16 = v8;
              goto LABEL_27;
            }
          }
        }

        id v11 = [v9 countByEnumeratingWithState:&v56 objects:v63 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    if ((id)-[MIInstallationJournalEntry operationType](self, "operationType") == (id)4)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundle](self, "bundle"));
      unsigned int v19 = [v18 bundleType];

      v5 = v45;
      if (v19 == 1)
      {
        id v20 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry installOptions](self, "installOptions"));
        id v21 = (char *)[v20 lsInstallType];

        if ((unint64_t)(v21 - 7) >= 3)
        {
          if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) < 3)
          {
            uint64_t v22 = 3LL;
          }

          else
          {
            uint64_t v44 = v21;
            uint64_t v22 = 3LL;
            MOLogWrite(qword_100095BF8);
          }
        }

        else
        {
          uint64_t v22 = ((_DWORD)v21 - 4);
        }

        id v30 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry existingBundleContainer](self, "existingBundleContainer", v44));
        id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 bundle]);
        unsigned int v32 = [v31 bundleType];

        if (v32 == 1)
        {
          id v33 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry _systemAppState](self, "_systemAppState"));
          [v33 addIdentifier:v7 withState:v22];
        }
      }

      uint64_t v29 = 1LL;
    }

    else
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry existingBundleContainer](self, "existingBundleContainer"));

      if (v28) {
        uint64_t v29 = 2LL;
      }
      else {
        uint64_t v29 = 3LL;
      }
      v5 = v45;
    }

    id v34 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry installOptions](self, "installOptions"));
    id v35 = [v34 waitForDeletion];

    __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundleContainer](self, "bundleContainer"));
    __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry existingBundleContainer](self, "existingBundleContainer"));
    id v53 = v8;
    unsigned int v23 = [v36 makeContainerLiveReplacingContainer:v37 reason:v29 waitForDeletion:v35 withError:&v53];
    id v16 = v53;

    if (!v23)
    {
LABEL_29:
      a3 = v46;
      if (!v46) {
        goto LABEL_32;
      }
      goto LABEL_30;
    }

    if (!v5 || [v5 status] != (id)3)
    {
LABEL_49:
      __int128 v50 = 0u;
      __int128 v51 = 0u;
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry appExtensionDataContainers](self, "appExtensionDataContainers"));
      id v39 = [v9 countByEnumeratingWithState:&v48 objects:v62 count:16];
      if (v39)
      {
        id v40 = v39;
        uint64_t v41 = *(void *)v49;
        do
        {
          for (j = 0LL; j != v40; j = (char *)j + 1)
          {
            if (*(void *)v49 != v41) {
              objc_enumerationMutation(v9);
            }
            v43 = *(void **)(*((void *)&v48 + 1) + 8LL * (void)j);
            if ([v43 status] == (id)3)
            {
              [v43 setParentBundleID:v7];
              id v47 = v16;
              unsigned int v23 = [v43 makeContainerLiveWithError:&v47];
              id v8 = v47;

              if (!v23) {
                goto LABEL_26;
              }
              id v16 = v8;
            }
          }

          id v40 = [v9 countByEnumeratingWithState:&v48 objects:v62 count:16];
          LOBYTE(v23) = 1;
        }

        while (v40);
LABEL_27:
        v5 = v45;
      }

      else
      {
        LOBYTE(v23) = 1;
      }

      goto LABEL_29;
    }

    id v52 = v16;
    unsigned int v38 = [v5 makeContainerLiveWithError:&v52];
    id v8 = v52;

    if (v38)
    {
      id v16 = v8;
      goto LABEL_49;
    }

- (void)_updateContainerStatePostCommit
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[MIInstallationJournalEntry noLongerPresentAppExtensionDataContainers]( self,  "noLongerPresentAppExtensionDataContainers"));
  if (![v3 count])
  {
LABEL_7:
    id v5 = 0LL;
    goto LABEL_8;
  }

  id v27 = 0LL;
  unsigned __int8 v4 = +[MIContainer removeContainers:waitForDeletion:error:]( &OBJC_CLASS___MIContainer,  "removeContainers:waitForDeletion:error:",  v3,  0LL,  &v27);
  id v5 = v27;
  if ((v4 & 1) == 0)
  {
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
    {
      id v25 = v3;
      id v26 = v5;
      MOLogWrite(qword_100095BF8);
    }

    goto LABEL_7;
  }

- (BOOL)_gatherLaunchServicesRegistrationInfoWithError:(id *)a3
{
  __int128 v36 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundleContainer](self, "bundleContainer"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundle](self, "bundle"));
  id v35 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);

  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry progressBlock](self, "progressBlock"));
  id v8 = (void *)v7;
  if (v7) {
    (*(void (**)(uint64_t, const __CFString *, uint64_t))(v7 + 16))( v7,  @"GeneratingApplicationMap",  90LL);
  }
  id v9 = objc_alloc(&OBJC_CLASS___MIInstalledInfoGatherer);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry dataContainer](self, "dataContainer"));
  id v11 = [v9 initWithBundleContainer:v5 dataContainer:v10];

  id v38 = 0LL;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleRecordWithError:&v38]);
  id v13 = v38;
  if (!v12)
  {
    id v26 = 0LL;
    if (a3)
    {
LABEL_17:
      id v13 = v13;
      BOOL v27 = 0;
      *a3 = v13;
      goto LABEL_18;
    }

    goto LABEL_11;
  }

  id v33 = a3;
  -[NSMutableArray addObject:](v36, "addObject:", v12);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry appExtensionBundles](self, "appExtensionBundles"));
  unsigned int v15 = (char *)[v14 count];

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry appExtensionDataContainers](self, "appExtensionDataContainers"));
  unsigned int v17 = (char *)[v16 count];

  id v34 = v8;
  if (v15 != v17)
  {
    id v28 = sub_1000130F4( (uint64_t)"-[MIInstallationJournalEntry _gatherLaunchServicesRegistrationInfoWithError:]",  900LL,  MIInstallerErrorDomain,  4LL,  0LL,  0LL,  @"Have %ld app extensions and %ld app extension data containers; they should be equal.",
            v18,
            (uint64_t)v15);
    unsigned int v23 = v13;
    id v13 = (id)objc_claimAutoreleasedReturnValue(v28);
    goto LABEL_16;
  }

  unsigned int v32 = v5;
  if (v15)
  {
    unsigned int v19 = 0LL;
    while (1)
    {
      id v20 = v11;
      id v21 = v13;
      unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry appExtensionBundles](self, "appExtensionBundles"));
      unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectAtIndexedSubscript:v19]);

      unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry appExtensionDataContainers](self, "appExtensionDataContainers"));
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectAtIndexedSubscript:v19]);

      id v11 = [[MIInstalledInfoGatherer alloc] initWithAppExtensionBundle:v23 inBundleIdentifier:v35 dataContainer:v25];
      id v37 = v21;
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleRecordWithError:&v37]);
      id v13 = v37;

      if (!v26) {
        break;
      }
      -[NSMutableArray addObject:](v36, "addObject:", v26);

      ++v19;
      uint64_t v12 = v26;
      if (v15 == v19) {
        goto LABEL_14;
      }
    }

    uint64_t v12 = 0LL;
    id v5 = v32;
LABEL_16:

    id v26 = v12;
    a3 = v33;
    id v8 = v34;
    if (v33) {
      goto LABEL_17;
    }
LABEL_11:
    BOOL v27 = 0;
    goto LABEL_18;
  }

  id v26 = v12;
LABEL_14:
  uint64_t v29 = (NSArray *)-[NSMutableArray copy](v36, "copy");
  bundleRecordsToRegister = self->_bundleRecordsToRegister;
  self->_bundleRecordsToRegister = v29;

  BOOL v27 = 1;
  id v5 = v32;
  id v8 = v34;
LABEL_18:

  return v27;
}

- (BOOL)_beginLaunchServicesRegistrationWithError:(id *)a3
{
  unint64_t v5 = -[MIInstallationJournalEntry installationDomain](self, "installationDomain");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry identity](self, "identity"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[MIInstallationJournalEntry _registerInstalledInfo:forIdentity:inDomain:error:]( self,  "_registerInstalledInfo:forIdentity:inDomain:error:",  self->_bundleRecordsToRegister,  v6,  v5,  a3));
  if (v7) {
    objc_storeStrong((id *)&self->_recordPromise, v7);
  }

  return v7 != 0LL;
}

- (BOOL)_performJournaledInstallAsReplay:(BOOL)a3 withError:(id *)a4
{
  BOOL v5 = a3;
  unint64_t v7 = -[MIInstallationJournalEntry attemptCount](self, "attemptCount");
  if (v7 < 6)
  {
    unint64_t v21 = -[MIInstallationJournalEntry journalPhase](self, "journalPhase");
    id v14 = 0LL;
    BOOL v15 = 0;
    id v22 = 0LL;
    switch(v21)
    {
      case 1uLL:
        id v50 = 0LL;
        unsigned int v23 = -[MIInstallationJournalEntry _updateJournalPhaseTo:withError:]( self,  "_updateJournalPhaseTo:withError:",  2LL,  &v50);
        id v14 = v50;
        if (!v23) {
          goto LABEL_9;
        }
        goto LABEL_22;
      case 2uLL:
LABEL_22:
        unsigned int v24 = v14;
        id v49 = v14;
        unsigned int v25 = -[MIInstallationJournalEntry _updateReferencesWithError:](self, "_updateReferencesWithError:", &v49);
        id v14 = v49;

        if (!v25) {
          goto LABEL_9;
        }
        id v48 = v14;
        unsigned int v16 = -[MIInstallationJournalEntry _commitContainersWithError:](self, "_commitContainersWithError:", &v48);
        id v22 = v48;

        if (!v16)
        {
          BOOL v15 = 1;
          id v14 = v22;
          goto LABEL_11;
        }

        if (!-[MIInstallationJournalEntry _updateJournalPhaseTo:withError:]( self,  "_updateJournalPhaseTo:withError:",  3LL,  0LL))
        {
          uint64_t v26 = qword_100095BF8;
          if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
          {
            __int128 v42 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry identity](self, "identity"));
            MOLogWrite(v26);
          }
        }

        BOOL v15 = 1;
LABEL_29:
        -[MIInstallationJournalEntry _updateContainerStatePostCommit](self, "_updateContainerStatePostCommit", v42);
        if (!-[MIInstallationJournalEntry _updateJournalPhaseTo:withError:]( self,  "_updateJournalPhaseTo:withError:",  4LL,  0LL))
        {
          uint64_t v27 = qword_100095BF8;
          if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
          {
            v43 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry identity](self, "identity"));
            MOLogWrite(v27);
          }
        }

        id v47 = v22;
        unsigned int v16 = -[MIInstallationJournalEntry _gatherLaunchServicesRegistrationInfoWithError:]( self,  "_gatherLaunchServicesRegistrationInfoWithError:",  &v47,  v43);
        id v14 = v47;

        if (!v16 || !v5) {
          goto LABEL_11;
        }
LABEL_35:
        if (!v5
          && !-[MIInstallationJournalEntry _updateJournalPhaseTo:withError:]( self,  "_updateJournalPhaseTo:withError:",  5LL,  0LL))
        {
          uint64_t v28 = qword_100095BF8;
          if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
          {
            __int128 v42 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry identity](self, "identity"));
            MOLogWrite(v28);
          }
        }

- (BOOL)finalizeContainersWithError:(id *)a3
{
  unint64_t v5 = -[MIInstallationJournalEntry journalPhase](self, "journalPhase");
  if (v5 == 1)
  {
    id v14 = 0LL;
    BOOL v6 = -[MIInstallationJournalEntry _performJournaledInstallAsReplay:withError:]( self,  "_performJournaledInstallAsReplay:withError:",  0LL,  &v14);
    id v7 = v14;
    if (!a3) {
      goto LABEL_7;
    }
  }

  else
  {
    uint64_t v8 = (void *)MIInstallerErrorDomain;
    uint64_t v9 = sub_10002F280(v5);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v12 = sub_1000130F4( (uint64_t)"-[MIInstallationJournalEntry finalizeContainersWithError:]",  1108LL,  v8,  4LL,  0LL,  0LL,  @"Finalize called on journal entry in unexpected state; found journal phase %@, should have been %@",
            v11,
            (uint64_t)v10);
    id v7 = (id)objc_claimAutoreleasedReturnValue(v12);

    BOOL v6 = 0;
    if (!a3) {
      goto LABEL_7;
    }
  }

  if (!v6) {
    *a3 = v7;
  }
LABEL_7:

  return v6;
}

- (BOOL)performLaunchServicesRegistrationWithError:(id *)a3
{
  unint64_t v5 = -[MIInstallationJournalEntry journalPhase](self, "journalPhase");
  if (v5 == 4)
  {
    id v14 = 0LL;
    BOOL v6 = -[MIInstallationJournalEntry _performJournaledInstallAsReplay:withError:]( self,  "_performJournaledInstallAsReplay:withError:",  0LL,  &v14);
    id v7 = v14;
    if (!a3) {
      goto LABEL_7;
    }
  }

  else
  {
    uint64_t v8 = (void *)MIInstallerErrorDomain;
    uint64_t v9 = sub_10002F280(v5);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v12 = sub_1000130F4( (uint64_t)"-[MIInstallationJournalEntry performLaunchServicesRegistrationWithError:]",  1132LL,  v8,  4LL,  0LL,  0LL,  @"Asked to register journal entry with LaunchServices in unexpected state; found journal phase %@, should have been %@",
            v11,
            (uint64_t)v10);
    id v7 = (id)objc_claimAutoreleasedReturnValue(v12);

    BOOL v6 = 0;
    if (!a3) {
      goto LABEL_7;
    }
  }

  if (!v6) {
    *a3 = v7;
  }
LABEL_7:

  return v6;
}

- (BOOL)finalizeWithError:(id *)a3
{
  if ((id)-[MIInstallationJournalEntry journalPhase](self, "journalPhase") != (id)7) {
    return -[MIInstallationJournalEntry _performJournaledInstallAsReplay:withError:]( self,  "_performJournaledInstallAsReplay:withError:",  1LL,  a3);
  }
  return 1;
}

- (BOOL)stageUpdateForLater:(id *)a3
{
  id v12 = 0LL;
  unsigned int v5 = -[MIInstallationJournalEntry _updateJournalPhaseTo:withError:]( self,  "_updateJournalPhaseTo:withError:",  7LL,  &v12);
  id v6 = v12;
  if (v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundleContainer](self, "bundleContainer"));
    id v11 = v6;
    unsigned __int8 v8 = [v7 markContainerAsStagedUpdateContainer:&v11];
    id v9 = v11;

    id v6 = v9;
    if (!a3) {
      goto LABEL_7;
    }
  }

  else
  {
    unsigned __int8 v8 = 0;
    if (!a3) {
      goto LABEL_7;
    }
  }

  if ((v8 & 1) == 0) {
    *a3 = v6;
  }
LABEL_7:

  return v8;
}

- (BOOL)makeStagedBackgroundUpdateLive:(id *)a3
{
  id v12 = 0LL;
  unsigned int v5 = -[MIInstallationJournalEntry _updateJournalPhaseTo:withError:]( self,  "_updateJournalPhaseTo:withError:",  2LL,  &v12);
  id v6 = v12;
  id v7 = v6;
  if (v5)
  {
    id v11 = v6;
    BOOL v8 = -[MIInstallationJournalEntry _performJournaledInstallAsReplay:withError:]( self,  "_performJournaledInstallAsReplay:withError:",  0LL,  &v11);
    id v9 = v11;

    id v7 = v9;
    if (!a3) {
      goto LABEL_7;
    }
  }

  else
  {
    BOOL v8 = 0;
    if (!a3) {
      goto LABEL_7;
    }
  }

  if (!v8) {
    *a3 = v7;
  }
LABEL_7:

  return v8;
}

- (BOOL)cleanUpJournaledDataOnDiskWithError:(id *)a3
{
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundleContainer](self, "bundleContainer"));
  id v6 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  char v33 = 0;
  id v32 = 0LL;
  unsigned __int8 v7 = [v5 isStagedUpdateContainer:&v33 withError:&v32];
  id v8 = v32;
  if ((v7 & 1) == 0)
  {
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
    {
      unsigned int v24 = v5;
      id v25 = v8;
      MOLogWrite(qword_100095BF8);
    }

    char v33 = 1;
LABEL_8:
    id v31 = v8;
    unsigned int v9 = objc_msgSend(v5, "clearStagedUpdateContainerStatusWithError:", &v31, v24, v25);
    id v10 = v31;

    id v8 = v10;
    if (!v9) {
      goto LABEL_27;
    }
    goto LABEL_9;
  }

  if (v33) {
    goto LABEL_8;
  }
LABEL_9:
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry dataContainer](self, "dataContainer"));
  unsigned int v12 = [v11 isTransient];

  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry dataContainer](self, "dataContainer"));
    -[NSMutableArray addObject:](v6, "addObject:", v13);
  }

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry appExtensionDataContainers](self, "appExtensionDataContainers"));
  id v15 = [v14 countByEnumeratingWithState:&v27 objects:v34 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v28;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(v14);
        }
        unsigned int v19 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
      }

      id v16 = [v14 countByEnumeratingWithState:&v27 objects:v34 count:16];
    }

    while (v16);
  }

  if (!-[NSMutableArray count](v6, "count"))
  {
    BOOL v22 = 1;
    goto LABEL_30;
  }

  id v26 = v8;
  unsigned __int8 v20 = +[MIContainer removeContainers:waitForDeletion:error:]( &OBJC_CLASS___MIContainer,  "removeContainers:waitForDeletion:error:",  v6,  0LL,  &v26);
  id v21 = v26;

  if ((v20 & 1) != 0)
  {
    BOOL v22 = 1;
    id v8 = v21;
    goto LABEL_30;
  }

  id v8 = v21;
LABEL_27:
  if (a3)
  {
    id v8 = v8;
    BOOL v22 = 0;
    *a3 = v8;
  }

  else
  {
    BOOL v22 = 0;
  }

- (MIAppIdentity)identity
{
  return self->_identity;
}

- (MIBundleContainer)bundleContainer
{
  return self->_bundleContainer;
}

- (MIBundleContainer)existingBundleContainer
{
  return self->_existingBundleContainer;
}

- (unint64_t)installationDomain
{
  return self->_installationDomain;
}

- (unint64_t)operationType
{
  return self->_operationType;
}

- (MIInstallOptions)installOptions
{
  return self->_installOptions;
}

- (MICodeSigningInfo)bundleSigningInfo
{
  return self->_bundleSigningInfo;
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (void)setProgressBlock:(id)a3
{
}

- (NSString)linkToParentBundleID
{
  return self->_linkToParentBundleID;
}

- (void)setLinkToParentBundleID:(id)a3
{
}

- (NSArray)noLongerPresentAppExtensionDataContainers
{
  return self->_noLongerPresentAppExtensionDataContainers;
}

- (void)setNoLongerPresentAppExtensionDataContainers:(id)a3
{
}

- (MIDataContainer)dataContainer
{
  return self->_dataContainer;
}

- (void)setDataContainer:(id)a3
{
}

- (NSArray)appExtensionBundles
{
  return self->_appExtensionBundles;
}

- (void)setAppExtensionBundles:(id)a3
{
}

- (NSArray)appExtensionDataContainers
{
  return self->_appExtensionDataContainers;
}

- (void)setAppExtensionDataContainers:(id)a3
{
}

- (NSArray)bundleRecordsToRegister
{
  return self->_bundleRecordsToRegister;
}

- (LSRecordPromise)recordPromise
{
  return self->_recordPromise;
}

- (unint64_t)attemptCount
{
  return self->_attemptCount;
}

- (NSUUID)journalEntryID
{
  return self->_journalEntryID;
}

- (unint64_t)journalPhase
{
  return self->_journalPhase;
}

- (void)setJournalPhase:(unint64_t)a3
{
  self->_journalPhase = a3;
}

- (void).cxx_destruct
{
}

  ;
}

@end
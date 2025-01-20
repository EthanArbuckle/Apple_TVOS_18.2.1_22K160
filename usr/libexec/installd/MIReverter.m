@interface MIReverter
+ (id)reverterForAppIdentity:(id)a3 withOptions:(id)a4 forClient:(id)a5;
- (BOOL)_finalizeInstallationWithError:(id *)a3;
- (BOOL)_performInstallationWithError:(id *)a3;
- (BOOL)_performPreflightWithError:(id *)a3;
- (BOOL)_performVerificationWithError:(id *)a3;
- (BOOL)_postFlightAppExtensionsWithError:(id *)a3;
- (BOOL)_postFlightInstallationWithError:(id *)a3;
- (BOOL)_refreshUUIDForContainer:(id)a3 withError:(id *)a4;
- (BOOL)_validateAndEstablishLinkToParentContainer:(id *)a3;
- (BOOL)isLocked;
- (BOOL)performRevertWithError:(id *)a3;
- (LSRecordPromise)recordPromise;
- (MIAppIdentity)identity;
- (MIBundleContainer)bundleContainer;
- (MIBundleContainer)existingBundleContainer;
- (MIClientConnection)client;
- (MIDataContainer)dataContainer;
- (MIStashedBundleContainer)stashedContainer;
- (NSArray)appExtensionBundles;
- (NSArray)receipt;
- (NSDictionary)options;
- (NSMutableArray)appExtensionDataContainers;
- (id)_launchServicesBundleRecordsWithError:(id *)a3;
- (id)_validateBundle:(id)a3 error:(id *)a4;
- (id)initForAppIdentity:(id)a3 options:(id)a4 forClient:(id)a5;
- (void)_fireCallbackWithStatus:(id)a3;
- (void)_fireCallbackWithStatus:(id)a3 percentComplete:(unsigned int)a4;
- (void)dealloc;
- (void)setAppExtensionBundles:(id)a3;
- (void)setAppExtensionDataContainers:(id)a3;
- (void)setBundleContainer:(id)a3;
- (void)setClient:(id)a3;
- (void)setDataContainer:(id)a3;
- (void)setExistingBundleContainer:(id)a3;
- (void)setIdentity:(id)a3;
- (void)setIsLocked:(BOOL)a3;
- (void)setOptions:(id)a3;
- (void)setStashedContainer:(id)a3;
@end

@implementation MIReverter

+ (id)reverterForAppIdentity:(id)a3 withOptions:(id)a4 forClient:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)objc_opt_class(a1)) initForAppIdentity:v10 options:v9 forClient:v8];

  return v11;
}

- (id)initForAppIdentity:(id)a3 options:(id)a4 forClient:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MIReverter;
  v12 = -[MIReverter init](&v15, "init");
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_client, v11);
    objc_storeStrong(p_isa + 5, a4);
    objc_storeStrong(p_isa + 6, a3);
  }

  return p_isa;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter bundleContainer](self, "bundleContainer"));
  sub_10000E010(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter dataContainer](self, "dataContainer"));
  sub_10000E010(v4);

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter appExtensionDataContainers](self, "appExtensionDataContainers"));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        sub_10000E010(*(void **)(*((void *)&v13 + 1) + 8LL * (void)v9));
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  if (-[MIReverter isLocked](self, "isLocked"))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter identity](self, "identity"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleID]);
    sub_10004D608();
  }

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MIReverter;
  -[MIReverter dealloc](&v12, "dealloc");
}

- (void)_fireCallbackWithStatus:(id)a3 percentComplete:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[MIReverter client](self, "client"));
  [v7 sendProgressWithStatus:v6 percentComplete:v4];
}

- (void)_fireCallbackWithStatus:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MIReverter client](self, "client"));
  [v5 sendProgressWithStatus:v4];
}

- (BOOL)_performPreflightWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter identity](self, "identity"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleID]);

  -[MIReverter _fireCallbackWithStatus:percentComplete:]( self,  "_fireCallbackWithStatus:percentComplete:",  @"PreflightingApplication",  30LL);
  id v22 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MIBundleContainer appBundleContainerWithIdentifier:createIfNeeded:created:error:]( &OBJC_CLASS___MIBundleContainer,  "appBundleContainerWithIdentifier:createIfNeeded:created:error:",  v6,  0LL,  0LL,  &v22));
  id v9 = v22;
  if (!v7)
  {
    id v17 = sub_1000130F4( (uint64_t)"-[MIReverter _performPreflightWithError:]",  138LL,  MIInstallerErrorDomain,  26LL,  v9,  0LL,  @"Could not locate an existing installed app with bundle ID %@ to revert",  v8,  (uint64_t)v6);
    id v15 = (id)objc_claimAutoreleasedReturnValue(v17);
LABEL_7:

    id v10 = 0LL;
    goto LABEL_8;
  }

  -[MIReverter setExistingBundleContainer:](self, "setExistingBundleContainer:", v7);
  id v21 = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 stashedBundleContainerWithError:&v21]);
  id v11 = v21;

  if (!v10)
  {
    id v18 = sub_1000130F4( (uint64_t)"-[MIReverter _performPreflightWithError:]",  145LL,  MIInstallerErrorDomain,  167LL,  v11,  0LL,  @"Installed app with bundle ID %@ did not have a stashed version",  v12,  (uint64_t)v6);
    id v15 = (id)objc_claimAutoreleasedReturnValue(v18);
    id v9 = v11;
    goto LABEL_7;
  }

  -[MIReverter setStashedContainer:](self, "setStashedContainer:", v10);
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v10 bundle]);
  id v20 = v11;
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 appExtensionBundlesWithError:&v20]);
  id v15 = v20;

  if (v14)
  {
    -[MIReverter setAppExtensionBundles:](self, "setAppExtensionBundles:", v14);

    BOOL v16 = 1;
    goto LABEL_11;
  }

- (id)_validateBundle:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v21 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( [v6 codeSigningInfoByValidatingResources:0 performingOnlineAuthorization:0 ignoringCachedSigningInfo:1 checking TrustCacheIfApplicable:0 skippingProfileIDValidation:0 error:&v21]);
  id v8 = v21;
  id v9 = v8;
  if (!v7)
  {
    id v13 = v8;
    goto LABEL_6;
  }

  if ([v6 codeSignatureVerificationState] != (id)2)
  {
    id v15 = (void *)MIInstallerErrorDomain;
    id v16 = [v6 codeSignatureVerificationState];
    id v18 = sub_1000130F4( (uint64_t)"-[MIReverter _validateBundle:error:]",  181LL,  v15,  4LL,  0LL,  0LL,  @"Unexpectedly failed to validate code signing (status %lu) for %@",  v17,  (uint64_t)v16);
    id v13 = (id)objc_claimAutoreleasedReturnValue(v18);

    if (a4) {
      goto LABEL_7;
    }
    goto LABEL_9;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter identity](self, "identity"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 personaUniqueString]);
  id v20 = v9;
  unsigned int v12 = [v6 hasNoConflictsWithOtherInstalledEntitiesForSigningInfo:v7 forPersona:v11 error:&v20];
  id v13 = v20;

  if (!v12)
  {
LABEL_6:
    if (a4)
    {
LABEL_7:
      id v13 = v13;
      id v14 = 0LL;
      *a4 = v13;
      goto LABEL_10;
    }

- (BOOL)_performVerificationWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter stashedContainer](self, "stashedContainer"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundle]);
  id v24 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter _validateBundle:error:](self, "_validateBundle:error:", v6, &v24));
  id v8 = v24;

  if (!v7)
  {
    BOOL v17 = 0;
    if (!a3) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter appExtensionBundles](self, "appExtensionBundles"));
  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v21;
    while (2)
    {
      id v13 = 0LL;
      id v14 = v8;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)v13);
        id v19 = v14;
        id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter _validateBundle:error:](self, "_validateBundle:error:", v15, &v19));
        id v8 = v19;

        if (!v16)
        {
          BOOL v17 = 0;
          goto LABEL_12;
        }

        id v13 = (char *)v13 + 1;
        id v14 = v8;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  BOOL v17 = 1;
LABEL_12:

  if (a3)
  {
LABEL_15:
    if (!v17) {
      *a3 = v8;
    }
  }

- (BOOL)_validateAndEstablishLinkToParentContainer:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter bundleContainer](self, "bundleContainer"));
  id v17 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleMetadataWithError:&v17]);
  id v7 = v17;

  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter existingBundleContainer](self, "existingBundleContainer"));
    id v16 = v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleMetadataWithError:&v16]);
    id v10 = v16;

    if (v9)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 linkedChildBundleIDs]);
      [v6 setLinkedChildBundleIDs:v11];

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter bundleContainer](self, "bundleContainer"));
      id v15 = v10;
      unsigned __int8 v13 = [v12 saveBundleMetadata:v6 withError:&v15];
      id v7 = v15;

      if (!a3) {
        goto LABEL_16;
      }
      goto LABEL_14;
    }

    unsigned __int8 v13 = 0;
    id v7 = v10;
    if (a3)
    {
LABEL_14:
      if ((v13 & 1) == 0) {
        *a3 = v7;
      }
    }
  }

  else
  {
    unsigned __int8 v13 = 0;
    if (a3) {
      goto LABEL_14;
    }
  }

- (BOOL)_performInstallationWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter identity](self, "identity"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleID]);
  id v19 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MIBundleContainer tempAppBundleContainerWithIdentifier:error:]( &OBJC_CLASS___MIBundleContainer,  "tempAppBundleContainerWithIdentifier:error:",  v6,  &v19));
  id v8 = v19;

  if (v7)
  {
    -[MIReverter setBundleContainer:](self, "setBundleContainer:", v7);
    -[MIReverter _fireCallbackWithStatus:percentComplete:]( self,  "_fireCallbackWithStatus:percentComplete:",  @"InstallingApplication",  60LL);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter stashedContainer](self, "stashedContainer"));
    id v18 = v8;
    unsigned int v11 = [v7 cloneContentFromStashedBundleContainer:v10 error:&v18];
    id v12 = v18;

    if (!v11)
    {
      BOOL v13 = 0;
      if (!a3) {
        goto LABEL_10;
      }
      goto LABEL_8;
    }

    id v17 = v12;
    BOOL v13 = -[MIReverter _validateAndEstablishLinkToParentContainer:]( self,  "_validateAndEstablishLinkToParentContainer:",  &v17);
    id v8 = v12;
    id v12 = v17;
  }

  else
  {
    id v14 = sub_1000130F4( (uint64_t)"-[MIReverter _performInstallationWithError:]",  279LL,  MIInstallerErrorDomain,  21LL,  v8,  &off_10008A598,  @"Failed to create container",  v9,  v16);
    id v12 = (id)objc_claimAutoreleasedReturnValue(v14);
    BOOL v13 = 0;
  }

  if (!a3) {
    goto LABEL_10;
  }
LABEL_8:
  if (!v13) {
    *a3 = v12;
  }
LABEL_10:

  return v13;
}

- (BOOL)_postFlightAppExtensionsWithError:(id *)a3
{
  id v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  v34 = self;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[MIReverter appExtensionBundles](self, "appExtensionBundles"));
  id v6 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v6)
  {
    id v7 = v6;
    v31 = a3;
    id v8 = 0LL;
    uint64_t v33 = *(void *)v38;
LABEL_3:
    uint64_t v9 = 0LL;
    id v10 = v8;
    while (1)
    {
      if (*(void *)v38 != v33) {
        objc_enumerationMutation(obj);
      }
      unsigned int v11 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)v9);
      id v36 = 0LL;
      unsigned __int8 v12 = [v11 updateMCMWithCodeSigningInfoAsAdvanceCopy:1 withError:&v36];
      id v13 = v36;
      if ((v12 & 1) == 0) {
        break;
      }
      id v14 = v5;
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter identity](v34, "identity"));
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 personaUniqueString]);
      id v35 = v10;
      id v17 = (void *)objc_claimAutoreleasedReturnValue( [v11 dataContainerCreatingIfNeeded:1 forPersona:v16 makeLive:0 created:0 error:&v35]);
      id v8 = v35;

      if (!v17)
      {
        v25 = (void *)MIInstallerErrorDomain;
        __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
        id v27 = sub_1000130F4( (uint64_t)"-[MIReverter _postFlightAppExtensionsWithError:]",  332LL,  v25,  21LL,  v8,  &off_10008A5C0,  @"Failed to create app extension data container for  %@",  v26,  (uint64_t)v22);
        id v19 = (id)objc_claimAutoreleasedReturnValue(v27);
        id v10 = v8;
        id v5 = v14;
LABEL_18:

        if (v31)
        {
          id v19 = v19;
          BOOL v18 = 0;
          id *v31 = v19;
        }

        else
        {
          BOOL v18 = 0;
        }

        goto LABEL_21;
      }

      id v5 = v14;
      -[NSMutableArray addObject:](v14, "addObject:", v17);

      uint64_t v9 = (char *)v9 + 1;
      id v10 = v8;
      if (v7 == v9)
      {
        id v7 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }

    uint64_t v20 = qword_100095BF8;
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
      id v30 = v13;
      MOLogWrite(v20);
    }

    __int128 v21 = (void *)MIInstallerErrorDomain;
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier", v29, v30));
    [v11 isPlaceholder];
    id v24 = sub_1000130F4( (uint64_t)"-[MIReverter _postFlightAppExtensionsWithError:]",  325LL,  v21,  110LL,  v13,  0LL,  @"Failed to set app extension code signing info with container manager for %@, isPlaceholder: %c",  v23,  (uint64_t)v22);
    id v19 = (id)objc_claimAutoreleasedReturnValue(v24);
    goto LABEL_18;
  }

  id v8 = 0LL;
LABEL_12:

  -[MIReverter setAppExtensionDataContainers:](v34, "setAppExtensionDataContainers:", v5);
  BOOL v18 = 1;
  id v19 = v8;
LABEL_21:

  return v18;
}

- (BOOL)_postFlightInstallationWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter identity](self, "identity"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleID]);
  -[MIReverter _fireCallbackWithStatus:percentComplete:]( self,  "_fireCallbackWithStatus:percentComplete:",  @"PostflightingApplication",  70LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter bundleContainer](self, "bundleContainer"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 bundle]);

  if ([v8 needsDataContainer])
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 personaUniqueString]);
    id v18 = 0LL;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( [v8 dataContainerCreatingIfNeeded:1 forPersona:v9 makeLive:0 created:0 error:&v18]);
    id v11 = v18;

    if (!v10)
    {
      id v15 = sub_1000130F4( (uint64_t)"-[MIReverter _postFlightInstallationWithError:]",  371LL,  MIInstallerErrorDomain,  4LL,  v11,  0LL,  @"Failed to locate data container for stashed app %@",  v12,  (uint64_t)v6);
      id v14 = (id)objc_claimAutoreleasedReturnValue(v15);
      BOOL v13 = 0;
      goto LABEL_7;
    }

    -[MIReverter setDataContainer:](self, "setDataContainer:", v10);
  }

  else
  {
    id v11 = 0LL;
  }

  id v17 = v11;
  BOOL v13 = -[MIReverter _postFlightAppExtensionsWithError:](self, "_postFlightAppExtensionsWithError:", &v17);
  id v14 = v17;
LABEL_7:

  if (a3 && !v13) {
    *a3 = v14;
  }

  return v13;
}

- (BOOL)_refreshUUIDForContainer:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  if ([v5 status] != (id)1)
  {
    id v8 = 0LL;
LABEL_7:
    BOOL v12 = 1;
    goto LABEL_8;
  }

  id v15 = 0LL;
  unsigned int v6 = [v5 regenerateDirectoryUUIDWithError:&v15];
  id v7 = v15;
  id v8 = v7;
  if (v6)
  {
    uint64_t v9 = qword_100095BF8;
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 containerURL]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);
      MOLogWrite(v9);
    }

    goto LABEL_7;
  }

  if (a4)
  {
    id v8 = v7;
    BOOL v12 = 0;
    *a4 = v8;
  }

  else
  {
    BOOL v12 = 0;
  }

- (BOOL)_finalizeInstallationWithError:(id *)a3
{
  v3 = self;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter bundleContainer](self, "bundleContainer"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bundle]);

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 0LL));
  -[MIReverter _fireCallbackWithStatus:percentComplete:]( v3,  "_fireCallbackWithStatus:percentComplete:",  @"SandboxingApplication",  80LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter existingBundleContainer](v3, "existingBundleContainer"));

  v95 = v3;
  if (v7)
  {
    v93 = v6;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter existingBundleContainer](v3, "existingBundleContainer"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundle]);

    id v121 = 0LL;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 appExtensionBundlesWithError:&v121]);
    id v11 = v121;
    if (v10)
    {
      v91 = v10;
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 0LL));
      __int128 v117 = 0u;
      __int128 v118 = 0u;
      __int128 v119 = 0u;
      __int128 v120 = 0u;
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter appExtensionBundles](v3, "appExtensionBundles"));
      id v14 = [v13 countByEnumeratingWithState:&v117 objects:v125 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v118;
        do
        {
          for (i = 0LL; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v118 != v16) {
              objc_enumerationMutation(v13);
            }
            id v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v117 + 1) + 8 * (void)i) identifier]);
            [v12 addObject:v18];
          }

          id v15 = [v13 countByEnumeratingWithState:&v117 objects:v125 count:16];
        }

        while (v15);
      }

      v90 = v5;

      __int128 v115 = 0u;
      __int128 v116 = 0u;
      __int128 v113 = 0u;
      __int128 v114 = 0u;
      id v10 = v91;
      id obj = v91;
      id v19 = [obj countByEnumeratingWithState:&v113 objects:v124 count:16];
      if (v19)
      {
        id v20 = v19;
        v89 = v9;
        uint64_t v21 = *(void *)v114;
        do
        {
          __int128 v22 = 0LL;
          uint64_t v23 = v11;
          do
          {
            if (*(void *)v114 != v21) {
              objc_enumerationMutation(obj);
            }
            id v24 = *(void **)(*((void *)&v113 + 1) + 8LL * (void)v22);
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "identifier", v85, v87));
            unsigned __int8 v26 = [v12 containsObject:v25];

            if ((v26 & 1) != 0)
            {
              id v11 = v23;
            }

            else
            {
              id v27 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter identity](v95, "identity"));
              v28 = (void *)objc_claimAutoreleasedReturnValue([v27 personaUniqueString]);
              id v112 = v23;
              v29 = (void *)objc_claimAutoreleasedReturnValue( [v24 dataContainerCreatingIfNeeded:0 forPersona:v28 makeLive:0 created:0 error:&v112]);
              id v11 = v112;

              uint64_t v30 = qword_100095BF8;
              if (v29)
              {
                if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
                {
                  v85 = (void *)objc_claimAutoreleasedReturnValue([v24 identifier]);
                  MOLogWrite(v30);
                }

                objc_msgSend(v93, "addObject:", v29, v85);
              }

              else if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
              {
                v85 = (void *)objc_claimAutoreleasedReturnValue([v24 identifier]);
                id v87 = v11;
                MOLogWrite(v30);
              }

              uint64_t v23 = v11;
            }

            __int128 v22 = (char *)v22 + 1;
          }

          while (v20 != v22);
          id v20 = [obj countByEnumeratingWithState:&v113 objects:v124 count:16];
        }

        while (v20);
        uint64_t v9 = v89;
        id v5 = v90;
        v3 = v95;
        id v10 = v91;
      }
    }

    else
    {
      uint64_t v31 = qword_100095BF8;
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleURL]);
      v85 = (void *)objc_claimAutoreleasedReturnValue([v12 path]);
      id v87 = v11;
      id obj = v85;
      MOLogWrite(v31);
    }

LABEL_33:
    unsigned int v6 = v93;
  }

  uint64_t v32 = objc_claimAutoreleasedReturnValue(-[MIReverter dataContainer](v3, "dataContainer", v85, v87));
  if (v32
    && (uint64_t v33 = (void *)v32,
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter dataContainer](v3, "dataContainer")),
        id v35 = [v34 status],
        v34,
        v33,
        v35 != (id)3))
  {
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter dataContainer](v3, "dataContainer"));
    id v111 = 0LL;
    unsigned int v69 = -[MIReverter _refreshUUIDForContainer:withError:](v3, "_refreshUUIDForContainer:withError:", v68, &v111);
    id v51 = v111;

    if (!v69) {
      goto LABEL_69;
    }
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter dataContainer](v3, "dataContainer"));
    id v110 = v51;
    unsigned int v71 = [v70 makeContainerLiveWithError:&v110];
    id v36 = v110;

    id v51 = v36;
    if (!v71) {
      goto LABEL_69;
    }
  }

  else
  {
    id v36 = 0LL;
  }

  __int128 v108 = 0u;
  __int128 v109 = 0u;
  __int128 v106 = 0u;
  __int128 v107 = 0u;
  __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter appExtensionDataContainers](v3, "appExtensionDataContainers"));
  id v38 = [v37 countByEnumeratingWithState:&v106 objects:v123 count:16];
  if (v38)
  {
    id v39 = v38;
    uint64_t v40 = *(void *)v107;
LABEL_39:
    uint64_t v41 = 0LL;
    while (1)
    {
      if (*(void *)v107 != v40) {
        objc_enumerationMutation(v37);
      }
      v42 = *(void **)(*((void *)&v106 + 1) + 8 * v41);
      id v105 = v36;
      unsigned int v43 = -[MIReverter _refreshUUIDForContainer:withError:](v95, "_refreshUUIDForContainer:withError:", v42, &v105);
      id v44 = v105;

      if (!v43) {
        goto LABEL_68;
      }
      if ([v42 status] == (id)3)
      {
        id v36 = v44;
      }

      else
      {
        id v104 = v44;
        unsigned int v45 = [v42 makeContainerLiveWithError:&v104];
        id v36 = v104;

        if (!v45)
        {
          id v44 = v36;
          goto LABEL_68;
        }
      }

      if (v39 == (id)++v41)
      {
        id v39 = [v37 countByEnumeratingWithState:&v106 objects:v123 count:16];
        if (v39) {
          goto LABEL_39;
        }
        break;
      }
    }
  }

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter options](v95, "options"));
  v47 = (void *)objc_claimAutoreleasedReturnValue([v46 objectForKeyedSubscript:@"WaitForStorageDeletion"]);
  id v48 = sub_1000133E0(v47, 0LL);

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter bundleContainer](v95, "bundleContainer"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter existingBundleContainer](v95, "existingBundleContainer"));
  id v103 = v36;
  LODWORD(v48) = [v49 makeContainerLiveReplacingContainer:v50 reason:2 waitForDeletion:v48 withError:&v103];
  id v51 = v103;

  if (!(_DWORD)v48) {
    goto LABEL_69;
  }
  uint64_t v52 = objc_claimAutoreleasedReturnValue(-[MIReverter dataContainer](v95, "dataContainer"));
  if (v52)
  {
    v53 = (void *)v52;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter dataContainer](v95, "dataContainer"));
    id v55 = [v54 status];

    if (v55 == (id)3)
    {
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter dataContainer](v95, "dataContainer"));
      id v102 = v51;
      unsigned int v57 = [v56 makeContainerLiveWithError:&v102];
      id v58 = v102;

      id v51 = v58;
      if (!v57) {
        goto LABEL_69;
      }
    }
  }

  __int128 v100 = 0u;
  __int128 v101 = 0u;
  __int128 v98 = 0u;
  __int128 v99 = 0u;
  __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter appExtensionDataContainers](v95, "appExtensionDataContainers"));
  id v59 = [v37 countByEnumeratingWithState:&v98 objects:v122 count:16];
  if (v59)
  {
    id v60 = v59;
    uint64_t v61 = *(void *)v99;
LABEL_54:
    uint64_t v62 = 0LL;
    while (1)
    {
      if (*(void *)v99 != v61) {
        objc_enumerationMutation(v37);
      }
      v63 = *(void **)(*((void *)&v98 + 1) + 8 * v62);
      if ([v63 status] == (id)3)
      {
        v64 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
        [v63 setParentBundleID:v64];

        id v97 = v51;
        LODWORD(v64) = [v63 makeContainerLiveWithError:&v97];
        id v44 = v97;

        id v51 = v44;
        if (!(_DWORD)v64) {
          break;
        }
      }

      if (v60 == (id)++v62)
      {
        id v60 = [v37 countByEnumeratingWithState:&v98 objects:v122 count:16];
        if (v60) {
          goto LABEL_54;
        }
        goto LABEL_61;
      }
    }

- (id)_launchServicesBundleRecordsWithError:(id *)a3
{
  id v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter identity](self, "identity"));
  id v35 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleID]);
  -[MIReverter _fireCallbackWithStatus:percentComplete:]( self,  "_fireCallbackWithStatus:percentComplete:",  @"GeneratingApplicationMap",  90LL);
  id v7 = objc_alloc(&OBJC_CLASS___MIInstalledInfoGatherer);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter bundleContainer](self, "bundleContainer"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter dataContainer](self, "dataContainer"));
  id v10 = [v7 initWithBundleContainer:v8 dataContainer:v9];

  id v37 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleRecordWithError:&v37]);
  id v12 = v37;
  if (!v11)
  {
    unsigned __int8 v26 = 0LL;
    if (!a3) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }

  -[NSMutableArray addObject:](v5, "addObject:", v11);
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter appExtensionBundles](self, "appExtensionBundles"));
  id v14 = [v13 count];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter appExtensionDataContainers](self, "appExtensionDataContainers"));
  id v16 = [v15 count];

  if (v14 != v16)
  {
    id v27 = sub_1000130F4( (uint64_t)"-[MIReverter _launchServicesBundleRecordsWithError:]",  590LL,  MIInstallerErrorDomain,  4LL,  0LL,  0LL,  @"Have %ld app extensions and %ld app extension data containers; they should be equal.",
            v17,
            (uint64_t)v14);
    uint64_t v28 = objc_claimAutoreleasedReturnValue(v27);

    unsigned __int8 v26 = 0LL;
    id v12 = (id)v28;
    if (!a3) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }

  uint64_t v32 = v6;
  uint64_t v33 = a3;
  uint64_t v31 = v11;
  if (v14)
  {
    id v34 = v14;
    uint64_t v18 = 0LL;
    while (1)
    {
      id v19 = v10;
      id v20 = v12;
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter appExtensionBundles](self, "appExtensionBundles"));
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectAtIndexedSubscript:v18]);

      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter appExtensionDataContainers](self, "appExtensionDataContainers"));
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectAtIndexedSubscript:v18]);

      id v10 = [[MIInstalledInfoGatherer alloc] initWithAppExtensionBundle:v22 inBundleIdentifier:v35 dataContainer:v24];
      id v36 = v12;
      v25 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleRecordWithError:&v36]);
      id v12 = v36;

      if (!v25) {
        break;
      }
      -[NSMutableArray addObject:](v5, "addObject:", v25);

      if (v34 == (id)++v18) {
        goto LABEL_7;
      }
    }

    unsigned __int8 v26 = 0LL;
  }

  else
  {
LABEL_7:
    unsigned __int8 v26 = v5;
  }

  unsigned int v6 = v32;
  a3 = v33;
  id v11 = v31;
  if (v33)
  {
LABEL_14:
    if (!v26) {
      *a3 = v12;
    }
  }

- (BOOL)performRevertWithError:(id *)a3
{
  uint64_t v41 = 0LL;
  v42 = (id *)&v41;
  uint64_t v43 = 0x3032000000LL;
  id v44 = sub_1000100EC;
  unsigned int v45 = sub_1000100FC;
  id v46 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter identity](self, "identity"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleID]);
  -[MIReverter _fireCallbackWithStatus:percentComplete:]( self,  "_fireCallbackWithStatus:percentComplete:",  @"CreatingStagingDirectory",  5LL);
  -[MIReverter _fireCallbackWithStatus:percentComplete:]( self,  "_fireCallbackWithStatus:percentComplete:",  @"ExtractingPackage",  15LL);
  -[MIReverter _fireCallbackWithStatus:percentComplete:]( self,  "_fireCallbackWithStatus:percentComplete:",  @"InspectingPackage",  20LL);
  -[MIReverter _fireCallbackWithStatus:](self, "_fireCallbackWithStatus:", @"TakingInstallLock");
  sub_10004D4EC(v6);
  -[MIReverter setIsLocked:](self, "setIsLocked:", 1LL);
  id v7 = v42;
  id v40 = v42[5];
  unsigned __int8 v8 = [v5 resolvePersonaWithError:&v40];
  objc_storeStrong(v7 + 5, v40);
  if ((v8 & 1) == 0)
  {
    id v16 = 0LL;
    goto LABEL_13;
  }

  uint64_t v9 = v42;
  id v39 = v42[5];
  LODWORD(v10) = -[MIReverter _performPreflightWithError:](self, "_performPreflightWithError:", &v39);
  objc_storeStrong(v9 + 5, v39);
  if (!(_DWORD)v10) {
    goto LABEL_14;
  }
  id v11 = v42;
  id obj = v42[5];
  LODWORD(v10) = -[MIReverter _performVerificationWithError:](self, "_performVerificationWithError:", &obj);
  objc_storeStrong(v11 + 5, obj);
  if (!(_DWORD)v10) {
    goto LABEL_14;
  }
  id v12 = v42;
  id v37 = v42[5];
  LODWORD(v10) = -[MIReverter _performInstallationWithError:](self, "_performInstallationWithError:", &v37);
  objc_storeStrong(v12 + 5, v37);
  if (!(_DWORD)v10) {
    goto LABEL_14;
  }
  BOOL v13 = v42;
  id v36 = v42[5];
  LODWORD(v10) = -[MIReverter _postFlightInstallationWithError:](self, "_postFlightInstallationWithError:", &v36);
  objc_storeStrong(v13 + 5, v36);
  if (!(_DWORD)v10
    || (id v14 = v42,
        id v35 = v42[5],
        LODWORD(v10) = -[MIReverter _finalizeInstallationWithError:](self, "_finalizeInstallationWithError:", &v35),
        objc_storeStrong(v14 + 5, v35),
        !(_DWORD)v10))
  {
LABEL_14:
    id v16 = 0LL;
    goto LABEL_15;
  }

  id v15 = v42;
  id v34 = v42[5];
  id v16 = (id)objc_claimAutoreleasedReturnValue(-[MIReverter _launchServicesBundleRecordsWithError:](self, "_launchServicesBundleRecordsWithError:", &v34));
  objc_storeStrong(v15 + 5, v34);
  if (!v16)
  {
LABEL_13:
    LOBYTE(v10) = 0;
    goto LABEL_15;
  }

  objc_storeStrong((id *)&self->_receipt, v16);
  if (-[MIReverter isLocked](self, "isLocked"))
  {
    sub_10004D608(v6);
    -[MIReverter setIsLocked:](self, "setIsLocked:", 0LL);
  }

  uint64_t v28 = 0LL;
  v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  uint64_t v31 = sub_1000100EC;
  uint64_t v32 = sub_1000100FC;
  id v33 = 0LL;
  id v17 = sub_10000D8B4();
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v17);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010104;
  block[3] = &unk_100080EA8;
  unsigned __int8 v26 = &v28;
  id v16 = v16;
  id v24 = v16;
  id v25 = v5;
  id v27 = &v41;
  dispatch_sync(v10, block);

  uint64_t v18 = (void *)v29[5];
  LOBYTE(v10) = v18 != 0LL;
  if (v18)
  {
    objc_storeStrong((id *)&self->_recordPromise, v18);
  }

  else if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
  {
    uint64_t v21 = v6;
    uint64_t v22 = (uint64_t)v42[5];
    MOLogWrite(qword_100095BF8);
  }

  _Block_object_dispose(&v28, 8);
LABEL_15:
  if (-[MIReverter isLocked](self, "isLocked", v21, v22))
  {
    sub_10004D608(v6);
    -[MIReverter setIsLocked:](self, "setIsLocked:", 0LL);
  }

  if (a3) {
    char v19 = (char)v10;
  }
  else {
    char v19 = 1;
  }
  if ((v19 & 1) == 0) {
    *a3 = v42[5];
  }

  _Block_object_dispose(&v41, 8);
  return (char)v10;
}

- (NSArray)receipt
{
  return self->_receipt;
}

- (LSRecordPromise)recordPromise
{
  return self->_recordPromise;
}

- (MIClientConnection)client
{
  return (MIClientConnection *)objc_loadWeakRetained((id *)&self->_client);
}

- (void)setClient:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (MIAppIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
}

- (BOOL)isLocked
{
  return self->_isLocked;
}

- (void)setIsLocked:(BOOL)a3
{
  self->_isLocked = a3;
}

- (MIBundleContainer)existingBundleContainer
{
  return self->_existingBundleContainer;
}

- (void)setExistingBundleContainer:(id)a3
{
}

- (MIStashedBundleContainer)stashedContainer
{
  return self->_stashedContainer;
}

- (void)setStashedContainer:(id)a3
{
}

- (MIBundleContainer)bundleContainer
{
  return self->_bundleContainer;
}

- (void)setBundleContainer:(id)a3
{
}

- (NSArray)appExtensionBundles
{
  return self->_appExtensionBundles;
}

- (void)setAppExtensionBundles:(id)a3
{
}

- (MIDataContainer)dataContainer
{
  return self->_dataContainer;
}

- (void)setDataContainer:(id)a3
{
}

- (NSMutableArray)appExtensionDataContainers
{
  return self->_appExtensionDataContainers;
}

- (void)setAppExtensionDataContainers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface IXSRemoteInstaller
+ (BOOL)_configurePlaceholderPromiseForCoordinator:(id)a3 remoteInstallOptions:(id)a4;
+ (BOOL)_setInstallOptions:(id)a3 forCoordinator:(id)a4;
+ (BOOL)isAllowedByAppQuotaWithError:(id *)a3;
+ (BOOL)isInstallProhibited;
+ (id)_coordinatorForEmbeddedAppWithRemoteInstallConfiguration:(id)a3 error:(id *)a4;
+ (id)_coordinatorWithBundleID:(id)a3 forUpdate:(BOOL)a4 created:(BOOL *)a5 error:(id *)a6;
+ (int)_readAssetFromXPCAssetStream:(id)a3 error:(id *)a4;
+ (unint64_t)_autoInstallOverrideForRemoteOverride:(unsigned __int8)a3;
+ (unint64_t)_importanceFromRemoteInstallImportance:(unsigned __int8)a3;
+ (unint64_t)_stashModeForRemoteStashMode:(unsigned __int8)a3;
+ (unsigned)_remoteProgressPhaseForPhase:(unint64_t)a3;
+ (void)_cancelAppAssetPromise:(id)a3 withUnderlyingError:(id)a4;
+ (void)_completeStreamingForExtractor:(id)a3 forReadFD:(int)a4 isMultiUser:(BOOL)a5 completion:(id)a6;
- (BOOL)isMultiUser;
- (IXInitiatingOrUpdatingCoordinator)coordinator;
- (IXRemoteInstallConfiguration)remoteInstallOptions;
- (IXSRemoteInstaller)initWithRemoteInstallOptions:(id)a3 xpcAssetStream:(id)a4 assetSize:(unint64_t)a5 error:(id *)a6;
- (IXSRemoteInstallerDelegate)delegate;
- (NSString)bundleID;
- (OS_xpc_object)xpcAssetStream;
- (unint64_t)assetSize;
- (unsigned)remoteAction;
- (void)_beginTransferAndInstallEmbeddedApp;
- (void)beginTransferAndInstall;
- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5;
- (void)coordinator:(id)a3 didUpdateProgress:(double)a4 forPhase:(unint64_t)a5 overallProgress:(double)a6;
- (void)coordinatorDidCompleteSuccessfully:(id)a3 forApplicationRecord:(id)a4;
- (void)coordinatorDidInstallPlaceholder:(id)a3 forApplicationRecord:(id)a4;
- (void)setAssetSize:(unint64_t)a3;
- (void)setBundleID:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsMultiUser:(BOOL)a3;
- (void)setRemoteInstallOptions:(id)a3;
- (void)setXpcAssetStream:(id)a3;
@end

@implementation IXSRemoteInstaller

+ (id)_coordinatorWithBundleID:(id)a3 forUpdate:(BOOL)a4 created:(BOOL *)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v9 = a3;
  id v10 = [[IXApplicationIdentity alloc] initWithBundleIdentifier:v9];
  v11 = sub_10000F01C((uint64_t)off_100026DA8);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v13)
    {
      int v17 = 136315394;
      v18 = "+[IXSRemoteInstaller _coordinatorWithBundleID:forUpdate:created:error:]";
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s: Found an app record for app with %@, creating an updating coordinator",  (uint8_t *)&v17,  0x16u);
    }

    v14 = (id *)&OBJC_CLASS___IXUpdatingAppInstallCoordinator_ptr;
  }

  else
  {
    if (v13)
    {
      int v17 = 136315394;
      v18 = "+[IXSRemoteInstaller _coordinatorWithBundleID:forUpdate:created:error:]";
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s: Could not find an app record for app with %@, creating an initiating coordinator",  (uint8_t *)&v17,  0x16u);
    }

    v14 = (id *)&OBJC_CLASS___IXInitiatingAppInstallCoordinator_ptr;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue( [*v14 processScopedCoordinatorForAppWithIdentity:v10 withClientID:20 createIfNotExisting:1 created:a5 error:a6]);
  return v15;
}

+ (id)_coordinatorForEmbeddedAppWithRemoteInstallConfiguration:(id)a3 error:(id *)a4
{
  char v32 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue([a3 bundleID]);
  id v7 = [[LSApplicationRecord alloc] initWithBundleIdentifier:v6 allowPlaceholder:0 error:0];
  id v31 = 0LL;
  id v8 = [(id)objc_opt_class(a1) _coordinatorWithBundleID:v6 forUpdate:v7 != 0 created:&v32 error:&v31];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = v31;
  if (!v9) {
    goto LABEL_9;
  }
  if (v32) {
    goto LABEL_6;
  }
  if ([v9 creatorIdentifier] == (id)20)
  {
    id v12 = sub_1000095BC( (uint64_t)"+[IXSRemoteInstaller _coordinatorForEmbeddedAppWithRemoteInstallConfiguration:error:]",  98LL,  @"IXRemoteErrorDomain",  5LL,  0LL,  0LL,  @"Cancel orphaned coordinator",  v11,  v28);
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    [v9 cancelForReason:v13 client:20 error:0];
    id v30 = v10;
    id v14 = [(id)objc_opt_class(a1) _coordinatorWithBundleID:v6 forUpdate:v7 != 0 created:&v32 error:&v30];
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
    id v16 = v30;

    id v10 = v16;
    id v9 = (void *)v15;
    if (!v15)
    {
LABEL_9:
      __int16 v19 = sub_10000F01C((uint64_t)off_100026DA8);
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
        sub_1000147C4();
      }
      goto LABEL_11;
    }
  }

  if (!v32)
  {
    v23 = sub_10000F01C((uint64_t)off_100026DA8);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_100014830();
    }

    id v26 = sub_1000095BC( (uint64_t)"+[IXSRemoteInstaller _coordinatorForEmbeddedAppWithRemoteInstallConfiguration:error:]",  109LL,  @"IXRemoteErrorDomain",  5LL,  0LL,  0LL,  @"Failed to create a new coordinator as one already existed : %@",  v25,  (uint64_t)v9);
    uint64_t v27 = objc_claimAutoreleasedReturnValue(v26);

    id v10 = (id)v27;
LABEL_11:

    if (a4)
    {
      id v10 = v10;
      id v9 = 0LL;
      *a4 = v10;
    }

    else
    {
      id v9 = 0LL;
    }

    goto LABEL_17;
  }

- (IXSRemoteInstaller)initWithRemoteInstallOptions:(id)a3 xpcAssetStream:(id)a4 assetSize:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___IXSRemoteInstaller;
  id v12 = -[IXSRemoteInstaller init](&v41, "init");
  BOOL v13 = v12;
  if (!v12)
  {
    id v28 = 0LL;
LABEL_21:
    id v29 = v13;
    id v16 = v28;
    goto LABEL_22;
  }

  -[IXSRemoteInstaller setRemoteInstallOptions:](v12, "setRemoteInstallOptions:", v10);
  -[IXSRemoteInstaller setXpcAssetStream:](v13, "setXpcAssetStream:", v11);
  -[IXSRemoteInstaller setAssetSize:](v13, "setAssetSize:", a5);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleID]);
  -[IXSRemoteInstaller setBundleID:](v13, "setBundleID:", v14);

  id v40 = 0LL;
  unsigned int v15 = [(id)objc_opt_class(v13) isAllowedByAppQuotaWithError:&v40];
  id v16 = v40;
  if (!v15) {
    goto LABEL_8;
  }
  if ([(id)objc_opt_class(v13) isInstallProhibited])
  {
    unsigned __int8 v17 = sub_10000F01C((uint64_t)off_100026DA8);
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100014908(v18, v19, v20, v21, v22, v23, v24, v25);
    }

    id v27 = sub_1000095BC( (uint64_t)"-[IXSRemoteInstaller initWithRemoteInstallOptions:xpcAssetStream:assetSize:error:]",  149LL,  @"IXRemoteErrorDomain",  9LL,  0LL,  0LL,  @"Installation on this device is prohibited by ManagedConfiguration",  v26,  v37);
    id v28 = (id)objc_claimAutoreleasedReturnValue(v27);

    goto LABEL_7;
  }

  if ([v10 installableType])
  {
    id v28 = v16;
LABEL_20:
    -[IXSRemoteInstaller setIsMultiUser:](v13, "setIsMultiUser:", 0LL);
    goto LABEL_21;
  }

  id v39 = v16;
  id v30 = [(id)objc_opt_class(v13) _coordinatorForEmbeddedAppWithRemoteInstallConfiguration:v10 error:&v39];
  id v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  id v28 = v39;

  if (v31)
  {
    [v31 setObserver:v13];
    -[IXSRemoteInstaller setCoordinator:](v13, "setCoordinator:", v31);
    id v38 = 0LL;
    unsigned __int8 v32 = objc_msgSend( v31,  "setImportance:error:",  objc_msgSend( (id)objc_opt_class(v13),  "_importanceFromRemoteInstallImportance:",  objc_msgSend(v10, "importance")),  &v38);
    id v33 = v38;
    if ((v32 & 1) == 0)
    {
      v34 = sub_10000F01C((uint64_t)off_100026DA8);
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_100014978();
      }
    }

    goto LABEL_20;
  }

+ (unint64_t)_importanceFromRemoteInstallImportance:(unsigned __int8)a3
{
  unint64_t v3 = 1LL;
  if (a3 == 1) {
    unint64_t v3 = 2LL;
  }
  if (a3 == 2) {
    return 3LL;
  }
  else {
    return v3;
  }
}

+ (unsigned)_remoteProgressPhaseForPhase:(unint64_t)a3
{
  if (a3) {
    return 2 * (a3 == 1);
  }
  else {
    return 1;
  }
}

+ (unint64_t)_autoInstallOverrideForRemoteOverride:(unsigned __int8)a3
{
  if (a3 == 1) {
    return 1LL;
  }
  else {
    return 2LL * (a3 == 2);
  }
}

+ (unint64_t)_stashModeForRemoteStashMode:(unsigned __int8)a3
{
  if (a3 == 1) {
    return 1LL;
  }
  else {
    return 2LL * (a3 == 2);
  }
}

+ (BOOL)_configurePlaceholderPromiseForCoordinator:(id)a3 remoteInstallOptions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleID]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[IXFileManager defaultManager](&OBJC_CLASS___IXFileManager, "defaultManager"));
  id v9 = objc_alloc(&OBJC_CLASS___IXPlaceholder);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedName]);
  id v75 = 0LL;
  id v11 = [v9 initAppPlaceholderWithBundleName:v10 bundleID:v7 installType:1 client:20 error:&v75];
  id v12 = v75;

  if (!v11)
  {
    uint64_t v20 = sub_10000F01C((uint64_t)off_100026DA8);
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000149E4();
    }

    uint64_t v22 = v5;
    goto LABEL_10;
  }

  id v74 = v12;
  unsigned __int8 v13 = [v5 setPlaceholderPromise:v11 error:&v74];
  id v14 = v74;

  if ((v13 & 1) != 0)
  {
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v6 iconData]);

    if (v15)
    {
      id v16 = objc_alloc(&OBJC_CLASS___IXPromisedInMemoryData);
      unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([v6 iconData]);
      id v18 = [v16 initWithName:@"Placeholder icon data" client:20 data:v17];

      if (v18)
      {
        id v73 = v14;
        unsigned __int8 v19 = [v11 setIconPromise:v18 error:&v73];
        id v12 = v73;

        if ((v19 & 1) == 0)
        {
          unsigned __int8 v32 = sub_10000F01C((uint64_t)off_100026DA8);
          id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            sub_100014EA8();
          }
          goto LABEL_48;
        }

        id v14 = v12;
      }

      else
      {
        id v27 = sub_10000F01C((uint64_t)off_100026DA8);
        id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          sub_100014E18(v6, v28);
        }
      }
    }

    id v29 = (void *)objc_claimAutoreleasedReturnValue([v6 storeMetadata]);

    if (!v29)
    {
LABEL_28:
      v36 = (void *)objc_claimAutoreleasedReturnValue([v6 sinfData]);

      if (!v36)
      {
LABEL_31:
        id v39 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleVersion]);

        if (!v39)
        {
          id v12 = v14;
          goto LABEL_38;
        }

        id v18 = (id)objc_opt_new(&OBJC_CLASS___IXPlaceholderAttributes);
        id v40 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleVersion]);
        [v18 setBundleVersion:v40];

        id v70 = v14;
        unsigned int v41 = [v11 setPlaceholderAttributes:v18 error:&v70];
        id v12 = v70;

        if (v41)
        {

LABEL_38:
          id v44 = [[LSApplicationRecord alloc] initWithBundleIdentifierOfSystemPlaceholder:v7 error:0];
          uint64_t v25 = v44;
          v45 = (void *)objc_claimAutoreleasedReturnValue([v25 URL]);
          v46 = (void *)objc_claimAutoreleasedReturnValue( [v45 URLByAppendingPathComponent:@"PlaceholderEntitlements.plist" isDirectory:0]);

          if ([v8 itemExistsAtURL:v46])
          {
            [v8 diskUsageForURL:v46];
            id v47 = objc_alloc(&OBJC_CLASS___IXPromisedTransferToPath);
            uint64_t v48 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Entitlements Promise for %@",  v7));
            v49 = v46;
            v50 = (void *)v48;
            v67 = v49;
            id v51 = objc_msgSend(v47, "initWithName:client:transferPath:diskSpaceNeeded:", v48, 20);

            if (v51)
            {
              [v51 setShouldCopy:1];
              [v51 setComplete:1];
              id v69 = v12;
              unsigned __int8 v52 = [v11 setEntitlementsPromise:v51 error:&v69];
              id v53 = v69;

              if ((v52 & 1) != 0)
              {
                id v12 = v53;
                v46 = v67;
LABEL_54:

LABEL_55:
                v58 = v12;
                id v68 = v12;
                unsigned __int8 v59 = [v11 setConfigurationCompleteWithError:&v68];
                id v12 = v68;

                if ((v59 & 1) != 0)
                {
                  BOOL v26 = 1;
                  goto LABEL_51;
                }

                v60 = sub_10000F01C((uint64_t)off_100026DA8);
                v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
                if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
                  sub_100014A50();
                }

                [v11 cancelForReason:v12 client:20 error:0];
                goto LABEL_50;
              }

              v66 = sub_10000F01C((uint64_t)off_100026DA8);
              id v12 = (id)objc_claimAutoreleasedReturnValue(v66);
              if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR)) {
                sub_100014B48();
              }
            }

            else
            {
              v62 = sub_10000F01C((uint64_t)off_100026DA8);
              v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
              if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
                sub_100014ABC((uint64_t)v7, v63);
              }

              id v65 = sub_1000095BC( (uint64_t)"+[IXSRemoteInstaller _configurePlaceholderPromiseForCoordinator:remoteInstallOptions:]",  369LL,  IXErrorDomain,  2LL,  0LL,  0LL,  @"Failed to create IXPromisedTransferToPath for entitlements for %@",  v64,  (uint64_t)v7);
              id v53 = (id)objc_claimAutoreleasedReturnValue(v65);
            }

            [v11 cancelForReason:v53 client:20 error:0];
            BOOL v26 = 0;
            id v12 = v53;
            goto LABEL_51;
          }

          v57 = sub_10000F01C((uint64_t)off_100026DA8);
          id v51 = (id)objc_claimAutoreleasedReturnValue(v57);
          if (os_log_type_enabled((os_log_t)v51, OS_LOG_TYPE_ERROR)) {
            sub_100014BB4(v46, (os_log_s *)v51);
          }
          goto LABEL_54;
        }

        v55 = sub_10000F01C((uint64_t)off_100026DA8);
        id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          sub_100014C44();
        }
        goto LABEL_48;
      }

      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v6 sinfData]);
      id v71 = v14;
      unsigned __int8 v38 = [v11 setSinfData:v37 error:&v71];
      id v12 = v71;

      if ((v38 & 1) != 0)
      {
        id v14 = v12;
        goto LABEL_31;
      }

      v42 = sub_10000F01C((uint64_t)off_100026DA8);
      v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        sub_100014CB0();
      }

      uint64_t v22 = v11;
LABEL_10:
      [v22 cancelForReason:v12 client:20 error:0];
LABEL_49:
      uint64_t v25 = 0LL;
LABEL_50:
      BOOL v26 = 0;
      goto LABEL_51;
    }

    id v30 = (void *)objc_claimAutoreleasedReturnValue([v6 storeMetadata]);
    id v18 = (id)objc_claimAutoreleasedReturnValue( +[MIStoreMetadata metadataFromDictionary:]( &OBJC_CLASS___MIStoreMetadata,  "metadataFromDictionary:",  v30));

    if (!v18)
    {
      v34 = sub_10000F01C((uint64_t)off_100026DA8);
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_100014D1C(v6, v35);
      }

      goto LABEL_27;
    }

    id v72 = v14;
    unsigned __int8 v31 = [v11 setMetadata:v18 error:&v72];
    id v12 = v72;

    if ((v31 & 1) != 0)
    {
      id v14 = v12;
LABEL_27:

      goto LABEL_28;
    }

    v54 = sub_10000F01C((uint64_t)off_100026DA8);
    id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_100014DAC();
    }
LABEL_48:

    [v11 cancelForReason:v12 client:20 error:0];
    goto LABEL_49;
  }

  uint64_t v23 = sub_10000F01C((uint64_t)off_100026DA8);
  uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    sub_100014F14();
  }

  [v5 cancelForReason:v14 client:20 error:0];
  uint64_t v25 = 0LL;
  BOOL v26 = 0;
  id v12 = v14;
LABEL_51:

  return v26;
}

+ (void)_cancelAppAssetPromise:(id)a3 withUnderlyingError:(id)a4
{
  id v5 = off_100026DA8;
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_10000F01C((uint64_t)v5);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_100014FEC(v9, v10, v11, v12, v13, v14, v15, v16);
  }

  id v18 = sub_1000095BC( (uint64_t)"+[IXSRemoteInstaller _cancelAppAssetPromise:withUnderlyingError:]",  405LL,  @"IXRemoteErrorDomain",  7LL,  v6,  0LL,  @"Failed to stream the app asset from remote device",  v17,  v24);
  unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  id v25 = 0LL;
  unsigned __int8 v20 = [v7 cancelForReason:v19 client:20 error:&v25];

  id v21 = v25;
  if ((v20 & 1) == 0)
  {
    uint64_t v22 = sub_10000F01C((uint64_t)off_100026DA8);
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100014F80();
    }
  }
}

+ (BOOL)_setInstallOptions:(id)a3 forCoordinator:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(&OBJC_CLASS___MIInstallOptions);
  [v8 setInstallTargetType:1];
  [v8 setLsInstallType:1];
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 provisioningProfileDatas]);
  [v8 setProvisioningProfiles:v9];

  objc_msgSend( v8,  "setAutoInstallOverride:",  objc_msgSend(a1, "_autoInstallOverrideForRemoteOverride:", objc_msgSend(v7, "pairedAutoInstallOverride")));
  objc_msgSend( v8,  "setProvisioningProfileInstallFailureIsFatal:",  objc_msgSend(v7, "provisioningProfileInstallFailureIsFatal"));
  objc_msgSend(v8, "setStashMode:", objc_msgSend(a1, "_stashModeForRemoteStashMode:", objc_msgSend(v7, "stashMode")));
  [v8 setAllowLocalProvisioned:1];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 geoJSONData]);
  [v8 setGeoJSONData:v10];

  LODWORD(v10) = [v7 installMode];
  if ((_DWORD)v10 == 1) {
    [v8 setDeveloperInstall:1];
  }
  id v14 = 0LL;
  unsigned __int8 v11 = [v6 setInstallOptions:v8 error:&v14];
  id v12 = v14;
  if ((v11 & 1) == 0) {
    [v6 cancelForReason:v12 client:20 error:0];
  }

  return v11;
}

+ (void)_completeStreamingForExtractor:(id)a3 forReadFD:(int)a4 isMultiUser:(BOOL)a5 completion:(id)a6
{
  id v8 = a3;
  v17[0] = 0LL;
  v17[1] = v17;
  v17[2] = 0x3032000000LL;
  v17[3] = sub_100010700;
  v17[4] = sub_100010728;
  id v18 = objc_retainBlock(a6);
  dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
  unsigned __int8 v11 = dispatch_queue_create("com.apple.RemoteInstallerAssetStreamingWrite", v10);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010730;
  block[3] = &unk_100020950;
  int v16 = a4;
  id v14 = v8;
  uint64_t v15 = v17;
  id v12 = v8;
  dispatch_async(v11, block);

  _Block_object_dispose(v17, 8);
}

+ (int)_readAssetFromXPCAssetStream:(id)a3 error:(id *)a4
{
  id v5 = a3;
  *(void *)id v33 = -1LL;
  if (pipe(v33))
  {
    int v6 = *__error();
    id v7 = sub_10000F01C((uint64_t)off_100026DA8);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10001522C(v6);
    }

    id v29 = strerror(v6);
    uint64_t v10 = @"Failed to create a pipe() to stream the app asset : %s (%d)";
    uint64_t v11 = 544LL;
  }

  else
  {
    int v14 = v33[0];
    if (v33[0] != -1)
    {
      int v15 = v33[1];
      dispatch_queue_attr_t v16 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      uint64_t v17 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v16);
      id v18 = dispatch_queue_create("com.apple.RemoteInstallerAssetStreamingRead", v17);

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100011094;
      block[3] = &unk_1000209B8;
      id v31 = v5;
      int v32 = v15;
      dispatch_async(v18, block);

      id v13 = 0LL;
      goto LABEL_10;
    }

    unsigned __int8 v20 = sub_10000F01C((uint64_t)off_100026DA8);
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000151BC(v21, v22, v23, v24, v25, v26, v27, v28);
    }

    uint64_t v10 = @"pipe() did not set a valid fd at index 0 in fds array";
    uint64_t v11 = 551LL;
  }

  id v12 = sub_1000095BC( (uint64_t)"+[IXSRemoteInstaller _readAssetFromXPCAssetStream:error:]",  v11,  @"IXRemoteErrorDomain",  5LL,  0LL,  0LL,  v10,  v9,  (uint64_t)v29);
  id v13 = (id)objc_claimAutoreleasedReturnValue(v12);
  if (a4)
  {
    id v13 = v13;
    *a4 = v13;
  }

  int v14 = -1;
LABEL_10:

  return v14;
}

- (void)_beginTransferAndInstallEmbeddedApp
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IXSRemoteInstaller remoteInstallOptions](self, "remoteInstallOptions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedName]);
  v32[0] = SZExtractorOptionsDenyInvalidSymlinks;
  v32[1] = SZExtractorOptionsPerformCachedWrites;
  v33[0] = &__kCFBooleanTrue;
  v33[1] = &__kCFBooleanTrue;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  2LL));
  int v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSRemoteInstaller coordinator](self, "coordinator"));
  if (![(id)objc_opt_class(self) _configurePlaceholderPromiseForCoordinator:v6 remoteInstallOptions:v3])
  {
    id v13 = 0LL;
    id v8 = 0LL;
LABEL_15:
    int v14 = 0LL;
    goto LABEL_16;
  }

  id v31 = 0LL;
  unsigned __int8 v7 = [v6 setInitialODRAssetPromises:&__NSArray0__struct error:&v31];
  id v8 = v31;
  if ((v7 & 1) == 0)
  {
    id v18 = sub_10000F01C((uint64_t)off_100026DA8);
    unsigned __int8 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000153F4();
    }

    goto LABEL_14;
  }

  if (![(id)objc_opt_class(self) _setInstallOptions:v3 forCoordinator:v6])
  {
LABEL_14:
    id v13 = 0LL;
    goto LABEL_15;
  }

  uint64_t v9 = (void *)objc_opt_class(self);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IXSRemoteInstaller xpcAssetStream](self, "xpcAssetStream"));
  id v30 = v8;
  unsigned int v11 = [v9 _readAssetFromXPCAssetStream:v10 error:&v30];
  id v12 = v30;

  if ((v11 & 0x80000000) != 0)
  {
    [v6 cancelForReason:v12 client:20 error:0];
    id v13 = 0LL;
    int v14 = 0LL;
    id v8 = v12;
    goto LABEL_16;
  }

  unsigned int v24 = v11;
  id v13 = objc_msgSend( [IXPromisedStreamingZipTransfer alloc],  "initWithName:client:streamingZipOptions:archiveSize:diskSpaceNeeded:",  v4,  20,  v5,  0,  -[IXSRemoteInstaller assetSize](self, "assetSize"));
  int v14 = (void *)objc_claimAutoreleasedReturnValue([v3 targetLastPathComponent]);
  if (!v14)
  {
    id v8 = v12;
LABEL_19:
    unsigned __int8 v20 = v8;
    id v28 = v8;
    unsigned __int8 v21 = [v6 setAppAssetPromise:v13 error:&v28];
    id v8 = v28;

    if ((v21 & 1) != 0)
    {
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_100011498;
      v25[3] = &unk_100020A30;
      v25[4] = self;
      id v13 = v13;
      id v26 = v13;
      unsigned int v27 = v24;
      [v13 preflightWithCompletion:v25];
    }

    else
    {
      uint64_t v22 = sub_10000F01C((uint64_t)off_100026DA8);
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_10001531C();
      }
    }

    goto LABEL_16;
  }

  int v15 = sub_10000F01C((uint64_t)off_100026DA8);
  dispatch_queue_attr_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_100015388();
  }

  id v29 = v12;
  unsigned int v17 = [v13 setTargetLastPathComponent:v14 error:&v29];
  id v8 = v29;

  if (v17) {
    goto LABEL_19;
  }
LABEL_16:
}

- (void)beginTransferAndInstall
{
}

- (void)coordinatorDidInstallPlaceholder:(id)a3 forApplicationRecord:(id)a4
{
  id v4 = a3;
  id v5 = sub_10000F01C((uint64_t)off_100026DA8);
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100015538();
  }
}

- (void)coordinator:(id)a3 didUpdateProgress:(double)a4 forPhase:(unint64_t)a5 overallProgress:(double)a6
{
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[IXSRemoteInstaller delegate](self, "delegate", a3));
  if (v10) {
    objc_msgSend( v10,  "remoteInstaller:didUpdateProgress:forPhase:overallProgress:",  self,  objc_msgSend((id)objc_opt_class(self), "_remoteProgressPhaseForPhase:", a5),  a4,  a6);
  }
}

- (void)coordinatorDidCompleteSuccessfully:(id)a3 forApplicationRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10000F01C((uint64_t)off_100026DA8);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v28 = "-[IXSRemoteInstaller coordinatorDidCompleteSuccessfully:forApplicationRecord:]";
    __int16 v29 = 2112;
    id v30 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: Coordinator completed successfully %@",  buf,  0x16u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IXSRemoteInstaller delegate](self, "delegate"));
  if (v10)
  {
    if (v7)
    {
      id v11 = 0LL;
    }

    else
    {
      id v12 = objc_alloc(&OBJC_CLASS___LSApplicationRecord);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleID]);
      id v26 = 0LL;
      id v7 = [v12 initWithBundleIdentifier:v13 allowPlaceholder:0 error:&v26];
      id v11 = v26;

      if (!v7)
      {
        unsigned __int8 v20 = sub_10000F01C((uint64_t)off_100026DA8);
        unsigned __int8 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_1000155A4(v6, v21);
        }

        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleID]);
        id v24 = sub_1000095BC( (uint64_t)"-[IXSRemoteInstaller coordinatorDidCompleteSuccessfully:forApplicationRecord:]",  917LL,  @"IXRemoteErrorDomain",  5LL,  v11,  0LL,  @"Install for %@ completed successfully, but LaunchServices did not have a record for it",  v23,  (uint64_t)v22);
        uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);

        [v10 remoteInstaller:self canceledWithReason:v25];
        id v7 = 0LL;
        id v11 = (id)v25;
        goto LABEL_8;
      }
    }

    int v14 = objc_alloc(&OBJC_CLASS___IXRemoteInstallResult);
    int v15 = (void *)objc_claimAutoreleasedReturnValue([v7 databaseUUID]);
    dispatch_queue_attr_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v7 sequenceNumber]));
    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v7 URL]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v7 persistentIdentifier]);
    unsigned __int8 v19 = -[IXRemoteInstallResult initWithDBUUID:dbSequenceNumber:URLOfInstalledApp:persistentIdentifier:]( v14,  "initWithDBUUID:dbSequenceNumber:URLOfInstalledApp:persistentIdentifier:",  v15,  v16,  v17,  v18);

    [v10 remoteInstaller:self completedWithInstallResult:v19];
LABEL_8:
  }
}

- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[IXSRemoteInstaller delegate](self, "delegate"));
  [v7 remoteInstaller:self canceledWithReason:v6];
}

- (unsigned)remoteAction
{
  return 1;
}

+ (BOOL)isAllowedByAppQuotaWithError:(id *)a3
{
  if (qword_100026F30 != -1) {
    dispatch_once(&qword_100026F30, &stru_100020A50);
  }
  id v4 = (id) qword_100026F38;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sharedInstance]);
    id v6 = [v5 synchronouslyFetchApplicationsState];

    if (v6 == (id)2)
    {
      id v28 = sub_10000F01C((uint64_t)off_100026DA8);
      __int16 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_10001578C(v29, v30, v31, v32, v33, v34, v35, v36);
      }

      unsigned int v17 = @"Disallowing app installation becuase TVSCacheDelete says there's no more space";
      uint64_t v18 = 978LL;
    }

    else
    {
      if (v6 == (id)1)
      {
        id v37 = 0LL;
        goto LABEL_23;
      }

      if (v6)
      {
        unsigned __int8 v38 = sub_10000F01C((uint64_t)off_100026DA8);
        id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          sub_1000156A4((uint64_t)v6, v39, v40, v41, v42, v43, v44, v45);
        }

        uint64_t v48 = (uint64_t)v6;
        unsigned int v17 = @"TVSCacheDelete returned unknown state %ld";
        uint64_t v18 = 986LL;
      }

      else
      {
        id v7 = sub_10000F01C((uint64_t)off_100026DA8);
        id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_10001571C(v8, v9, v10, v11, v12, v13, v14, v15);
        }

        unsigned int v17 = @"TVSCacheDelete returned TVSCacheDeleteUnknownApplicationsState; disallowing installations";
        uint64_t v18 = 974LL;
      }
    }
  }

  else
  {
    unsigned __int8 v19 = sub_10000F01C((uint64_t)off_100026DA8);
    unsigned __int8 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100015634(v20, v21, v22, v23, v24, v25, v26, v27);
    }

    unsigned int v17 = @"TVSCacheDelete.class was nil; Assuming app quota doesn't allow installation";
    uint64_t v18 = 967LL;
  }

  id v46 = sub_1000095BC( (uint64_t)"+[IXSRemoteInstaller isAllowedByAppQuotaWithError:]",  v18,  @"IXRemoteErrorDomain",  8LL,  0LL,  0LL,  v17,  v16,  v48);
  id v37 = (id)objc_claimAutoreleasedReturnValue(v46);
  if (a3)
  {
    id v37 = v37;
    LOBYTE(v6) = 0;
    *a3 = v37;
  }

  else
  {
    LOBYTE(v6) = 0;
  }

+ (BOOL)isInstallProhibited
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  BOOL v3 = [v2 effectiveBoolValueForSetting:MCFeatureAppInstallationAllowed] == 2;

  return v3;
}

- (IXSRemoteInstallerDelegate)delegate
{
  return (IXSRemoteInstallerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (IXInitiatingOrUpdatingCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
}

- (IXRemoteInstallConfiguration)remoteInstallOptions
{
  return self->_remoteInstallOptions;
}

- (void)setRemoteInstallOptions:(id)a3
{
}

- (OS_xpc_object)xpcAssetStream
{
  return self->_xpcAssetStream;
}

- (void)setXpcAssetStream:(id)a3
{
}

- (unint64_t)assetSize
{
  return self->_assetSize;
}

- (void)setAssetSize:(unint64_t)a3
{
  self->_assetSize = a3;
}

- (BOOL)isMultiUser
{
  return self->_isMultiUser;
}

- (void)setIsMultiUser:(BOOL)a3
{
  self->_isMultiUser = a3;
}

- (void).cxx_destruct
{
}

@end
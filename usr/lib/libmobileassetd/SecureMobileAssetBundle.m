@interface SecureMobileAssetBundle
+ (BOOL)_shouldUseConclave:(BOOL)a3;
+ (BOOL)assetIsSecureMobileAsset:(id)a3;
+ (BOOL)commitStagedManifestsForSelectors:(id)a3 darwinOnly:(BOOL)a4 error:(id *)a5;
+ (BOOL)commitStagedManifestsForSelectors:(id)a3 error:(id *)a4;
+ (BOOL)fsTag:(unsigned int *)a3 forAssetType:(id)a4 specifier:(id)a5;
+ (OS_dispatch_queue)personalizationQueue;
+ (id)getExclaveManager:(id *)a3;
+ (id)getSigningServerURL:(id)a3;
- (BOOL)_generateNonceProposalForHandle:(unint64_t)a3 digest:(id *)a4 nonce:(id *)a5 error:(id *)a6;
- (BOOL)_personalize:(id)a3 error:(id *)a4;
- (BOOL)_shouldForcePersonalizationFailure;
- (BOOL)_storeManifest:(id)a3 stage:(BOOL)a4 error:(id *)a5;
- (BOOL)beginAccess:(int64_t)a3 error:(id *)a4;
- (BOOL)beginAccess_nowait:(int64_t)a3 error:(id *)a4;
- (BOOL)darwinOnly;
- (BOOL)depersonalize:(id *)a3;
- (BOOL)endAccess:(int64_t)a3 error:(id *)a4;
- (BOOL)endAccess_nowait:(int64_t)a3 error:(id *)a4;
- (BOOL)graft:(id *)a3;
- (BOOL)graftOrMount:(id *)a3;
- (BOOL)isAccessible;
- (BOOL)isGrafted;
- (BOOL)isGraftedPath:(id)a3;
- (BOOL)isMappableToExclaves:(unsigned int *)a3;
- (BOOL)isMounted;
- (BOOL)isPersonalized;
- (BOOL)isPersonalized:(int64_t *)a3;
- (BOOL)isPersonalizedForExclaves:(unsigned int)a3 staged:(BOOL)a4;
- (BOOL)isPersonalizedManifestStaged;
- (BOOL)isPersonalizedManifestStaged:(int64_t *)a3;
- (BOOL)isSecureMobileAsset;
- (BOOL)mapToExclaves:(id *)a3;
- (BOOL)mount:(id *)a3;
- (BOOL)personalize:(id)a3 error:(id *)a4;
- (BOOL)ungraft:(id *)a3;
- (BOOL)ungraftOrUnmount:(id *)a3;
- (BOOL)unmapFromExclaves:(id *)a3;
- (BOOL)unmount:(id *)a3;
- (NSDictionary)assetAttributes;
- (NSDictionary)insecureInfoPlist;
- (NSDictionary)secureInfoPlist;
- (NSString)assetBundlePath;
- (NSString)assetSpecifier;
- (NSString)assetType;
- (NSString)cryptexPath;
- (NSString)graftPath;
- (NSString)insecureInfoPlistPath;
- (NSString)rootHashPath;
- (NSString)secureAssetDataPath;
- (NSString)secureInfoPlistPath;
- (NSString)stagedPersonalizedManifestPath;
- (NSString)ticketPath;
- (NSString)trustCachePath;
- (SecureMobileAssetBundle)initWithPath:(id)a3;
- (id)_manifestDataFromFullyFormedTicket:(id)a3;
- (id)_personalizedBundleTicketData;
- (id)assetValues;
- (id)attach:(id)a3 error:(id *)a4;
- (id)description;
- (id)devnodesForDiskImageID:(id)a3 error:(id *)a4;
- (id)integrityCatalogPath;
- (unsigned)graftdmgType;
- (void)personalize:(id)a3 completionQueue:(id)a4 completion:(id)a5;
- (void)setDarwinOnly:(BOOL)a3;
@end

@implementation SecureMobileAssetBundle

+ (BOOL)assetIsSecureMobileAsset:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 stringByAppendingPathComponent:@"AssetData"]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"Restore"]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:@"BuildManifest.plist"]);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v7 = [v6 fileExistsAtPath:v5];

  return v7;
}

+ (BOOL)fsTag:(unsigned int *)a3 forAssetType:(id)a4 specifier:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (__isPlatformVersionAtLeast(3, 18, 0, 0))
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue(+[MASecureMobileAssetTypes sharedInstance](&OBJC_CLASS___MASecureMobileAssetTypes, "sharedInstance"));
    unsigned __int8 v10 = [v9 fsTag:a3 forAssetType:v7 specifier:v8];
  }

  else
  {
    id v9 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"MASecureMobileAssetTypes is unavailable"));
    id v11 = [v9 UTF8String];
    _MobileAssetLog( 0LL,  3,  (uint64_t)"+[SecureMobileAssetBundle fsTag:forAssetType:specifier:]",  @"[SMA] %s",  v12,  v13,  v14,  v15,  (uint64_t)v11);
    unsigned __int8 v10 = 0;
  }

  return v10;
}

+ (OS_dispatch_queue)personalizationQueue
{
  if (personalizationQueue_once != -1) {
    dispatch_once(&personalizationQueue_once, &__block_literal_global_16);
  }
  return (OS_dispatch_queue *)(id)personalizationQueue_queue;
}

void __47__SecureMobileAssetBundle_personalizationQueue__block_invoke(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.MobileAsset.SecureMobileAsset.Personalization", 0LL);
  v2 = (void *)personalizationQueue_queue;
  personalizationQueue_queue = (uint64_t)v1;
}

+ (BOOL)commitStagedManifestsForSelectors:(id)a3 error:(id *)a4
{
  return +[SecureMobileAssetBundle commitStagedManifestsForSelectors:darwinOnly:error:]( &OBJC_CLASS___SecureMobileAssetBundle,  "commitStagedManifestsForSelectors:darwinOnly:error:",  a3,  0LL,  a4);
}

+ (BOOL)commitStagedManifestsForSelectors:(id)a3 darwinOnly:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  if (__isPlatformVersionAtLeast(3, 18, 0, 0))
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___MASecureManifestStorage);
    if ((objc_opt_respondsToSelector(v8, "commitStagedManifestsForSelectors:error:") & 1) == 0)
    {
      id v51 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Warning: MASecureManifestStorage does not support staging, commit is a no-op"));
      id v52 = [v51 UTF8String];
      _MobileAssetLog( 0LL,  3,  (uint64_t)"+[SecureMobileAssetBundle commitStagedManifestsForSelectors:darwinOnly:error:]",  @"[SMA] %s",  v53,  v54,  v55,  v56,  (uint64_t)v52);

      BOOL v50 = 1;
LABEL_40:

      goto LABEL_41;
    }

    if (![v7 count])
    {
      id v57 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"No selectors specified"));
      id v58 = [v57 UTF8String];
      _MobileAssetLog( 0LL,  3,  (uint64_t)"+[SecureMobileAssetBundle commitStagedManifestsForSelectors:darwinOnly:error:]",  @"[SMA] %s",  v59,  v60,  v61,  v62,  (uint64_t)v58);

      if (a5)
      {
        v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No selectors specified"));
        v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        [v64 setObject:v63 forKeyedSubscript:NSDebugDescriptionErrorKey];
        [v64 setObject:0 forKeyedSubscript:NSUnderlyingErrorKey];
        v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  -3LL,  v64));

        *a5 = v65;
      }

      BOOL v50 = 0;
      goto LABEL_40;
    }

    id v9 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Committing staged manifests for selectors: %@", v7));
    id v10 = [v9 UTF8String];
    _MobileAssetLog( 0LL,  6,  (uint64_t)"+[SecureMobileAssetBundle commitStagedManifestsForSelectors:darwinOnly:error:]",  @"[SMA] %s",  v11,  v12,  v13,  v14,  (uint64_t)v10);

    id v104 = 0LL;
    unsigned __int8 v15 = [v8 commitStagedManifestsForSelectors:v7 error:&v104];
    id v16 = v104;
    if ((v15 & 1) != 0)
    {
      if (__isPlatformVersionAtLeast(3, 18, 2, 0)
        && +[SecureMobileAssetBundle _shouldUseConclave:]( &OBJC_CLASS___SecureMobileAssetBundle,  "_shouldUseConclave:",  v6))
      {
        v95 = v16;
        id v96 = v8;
        v93 = a5;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        __int128 v100 = 0u;
        __int128 v101 = 0u;
        __int128 v102 = 0u;
        __int128 v103 = 0u;
        id v94 = v7;
        id v18 = v7;
        id v19 = [v18 countByEnumeratingWithState:&v100 objects:v105 count:16];
        if (v19)
        {
          id v20 = v19;
          uint64_t v21 = *(void *)v101;
          while (2)
          {
            for (i = 0LL; i != v20; i = (char *)i + 1)
            {
              if (*(void *)v101 != v21) {
                objc_enumerationMutation(v18);
              }
              v23 = *(void **)(*((void *)&v100 + 1) + 8LL * (void)i);
              unsigned int v99 = 0;
              v24 = (void *)objc_claimAutoreleasedReturnValue([v23 assetType]);
              v25 = (void *)objc_claimAutoreleasedReturnValue([v23 assetSpecifier]);
              unsigned int v26 = +[SecureMobileAssetBundle fsTag:forAssetType:specifier:]( &OBJC_CLASS___SecureMobileAssetBundle,  "fsTag:forAssetType:specifier:",  &v99,  v24,  v25);

              if (v26)
              {
                uint64_t v27 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v99));
                if (!v27)
                {
                  id v74 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Failed to allocate NSNumber for fstag=%d", v99));
                  id v75 = [v74 UTF8String];
                  _MobileAssetLog( 0LL,  3,  (uint64_t)"+[SecureMobileAssetBundle commitStagedManifestsForSelectors:darwinOnly:error:]",  @"[SMA] %s",  v76,  v77,  v78,  v79,  (uint64_t)v75);

                  v80 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to allocate NSNumber for fstag"));
                  v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
                  [v81 setObject:v80 forKeyedSubscript:NSDebugDescriptionErrorKey];
                  [v81 setObject:0 forKeyedSubscript:NSUnderlyingErrorKey];
                  v82 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  100LL,  v81));

                  id *v93 = v82;
                  id v16 = v95;
                  id v8 = v96;
                  v29 = v17;
                  goto LABEL_36;
                }

                v28 = (void *)v27;
                [v17 addObject:v27];
              }
            }

            id v20 = [v18 countByEnumeratingWithState:&v100 objects:v105 count:16];
            if (v20) {
              continue;
            }
            break;
          }
        }

        v29 = v17;
        if (![v17 count])
        {
          BOOL v50 = 1;
          id v16 = v95;
          id v8 = v96;
          goto LABEL_37;
        }

        id v98 = v95;
        id v18 = (id)objc_claimAutoreleasedReturnValue( +[SecureMobileAssetBundle getExclaveManager:]( &OBJC_CLASS___SecureMobileAssetBundle,  "getExclaveManager:",  &v98));
        id v30 = v98;

        id v8 = v96;
        if (v18)
        {
          v31 = v93;
          if ((objc_opt_respondsToSelector(v18, "commitStagedManifestForFSTags:error:") & 1) != 0)
          {
            id v32 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Committing staged exclave manifests for fsTags: %@", v29));
            id v33 = [v32 UTF8String];
            _MobileAssetLog( 0LL,  6,  (uint64_t)"+[SecureMobileAssetBundle commitStagedManifestsForSelectors:darwinOnly:error:]",  @"[SMA] %s",  v34,  v35,  v36,  v37,  (uint64_t)v33);

            id v97 = v30;
            unsigned __int8 v38 = [v18 commitStagedManifestForFSTags:v29 error:&v97];
            id v16 = v97;

            if ((v38 & 1) == 0)
            {
              id v39 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Failed to commit staged manifests to Exclaves"));
              id v40 = [v39 UTF8String];
              _MobileAssetLog( 0LL,  3,  (uint64_t)"+[SecureMobileAssetBundle commitStagedManifestsForSelectors:darwinOnly:error:]",  @"[SMA] %s",  v41,  v42,  v43,  v44,  (uint64_t)v40);

              if (v93)
              {
                v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to commit staged manifests to Exclaves"));
                if (v16)
                {
                  id v46 = v16;
LABEL_46:
                  v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
                  [v84 setObject:v45 forKeyedSubscript:NSDebugDescriptionErrorKey];
                  [v84 setObject:v46 forKeyedSubscript:NSUnderlyingErrorKey];
                  v85 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  114LL,  v84));
                  id v86 = v46;

LABEL_51:
                  id *v31 = v85;

                  id v16 = v86;
                  goto LABEL_36;
                }

                goto LABEL_50;
              }

              goto LABEL_36;
            }
          }

          else
          {
            id v87 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Warning: MAExclaveManifestStorageService does not support staging, commit is a no-op"));
            id v88 = [v87 UTF8String];
            _MobileAssetLog( 0LL,  3,  (uint64_t)"+[SecureMobileAssetBundle commitStagedManifestsForSelectors:darwinOnly:error:]",  @"[SMA] %s",  v89,  v90,  v91,  v92,  (uint64_t)v88);

            id v16 = v30;
          }

          BOOL v50 = 1;
          goto LABEL_37;
        }

        v31 = v93;
        if (v93)
        {
          v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to get shared instance of SecureMobileAssetExclave"));
          if (v30)
          {
            id v46 = v30;
            goto LABEL_46;
          }

- (SecureMobileAssetBundle)initWithPath:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SecureMobileAssetBundle;
  v5 = -[SecureMobileAssetBundle init](&v11, "init");
  if (v5)
  {
    id v6 = v4;
    id v7 = realpath_DARWIN_EXTSN((const char *)[v6 fileSystemRepresentation], 0);
    if (v7) {
      id v8 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7));
    }
    else {
      id v8 = (NSString *)v6;
    }
    assetBundlePath = v5->_assetBundlePath;
    v5->_assetBundlePath = v8;

    v5->_darwinOnly = 0;
    free(v7);
  }

  return v5;
}

+ (id)getExclaveManager:(id *)a3
{
  if (__isPlatformVersionAtLeast(3, 18, 2, 0)
    && objc_opt_class(&OBJC_CLASS___SecureMobileAssetExclaveManager))
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue( +[SecureMobileAssetExclaveManager sharedInstance]( &OBJC_CLASS___SecureMobileAssetExclaveManager,  "sharedInstance"));
    if (!v4)
    {
      id v8 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Failed to get shared instance of SecureMobileAssetExclave"));
      id v9 = [v8 UTF8String];
      _MobileAssetLog( 0LL,  3,  (uint64_t)"+[SecureMobileAssetBundle getExclaveManager:]",  @"[SMA] %s",  v10,  v11,  v12,  v13,  (uint64_t)v9);

      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to get shared instance of SecureMobileAssetExclave"));
      unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      [v15 setObject:v14 forKeyedSubscript:NSDebugDescriptionErrorKey];
      [v15 setObject:0 forKeyedSubscript:NSUnderlyingErrorKey];
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  -4LL,  v15));

      v5 = 0LL;
      if (!a3) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }

    v5 = (void *)v4;
  }

  else
  {
    v5 = 0LL;
  }

  id v6 = 0LL;
  if (a3) {
LABEL_7:
  }
    *a3 = v6;
LABEL_8:

  return v5;
}

+ (BOOL)_shouldUseConclave:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = MABrainUtilityConclaveEnabled();
  if (v4)
  {
    int has_internal_content = os_variant_has_internal_content("com.apple.mobileassetd");
    LOBYTE(v4) = 1;
    if (has_internal_content)
    {
      if (v3)
      {
        id v6 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Operations will be restricted to darwin only"));
        id v7 = [v6 UTF8String];
        _MobileAssetLog( 0LL,  6,  (uint64_t)"+[SecureMobileAssetBundle _shouldUseConclave:]",  @"[SMA] %s",  v8,  v9,  v10,  v11,  (uint64_t)v7);

        LOBYTE(v4) = 0;
      }
    }
  }

  return v4;
}

- (BOOL)personalize:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  char v23 = 0;
  uint64_t v14 = 0LL;
  unsigned __int8 v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  v17 = __Block_byref_object_copy__10;
  id v18 = __Block_byref_object_dispose__10;
  id v19 = 0LL;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = __45__SecureMobileAssetBundle_personalize_error___block_invoke;
  v10[3] = &unk_34EB60;
  uint64_t v12 = &v20;
  uint64_t v13 = &v14;
  id v7 = dispatch_semaphore_create(0LL);
  uint64_t v11 = v7;
  -[SecureMobileAssetBundle personalize:completionQueue:completion:]( self,  "personalize:completionQueue:completion:",  v6,  0LL,  v10);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  if (a4) {
    *a4 = (id) v15[5];
  }
  char v8 = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

void __45__SecureMobileAssetBundle_personalize_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)personalize:(id)a3 completionQueue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"[Personalization] enqueue %@", self));
  id v12 = [v11 UTF8String];
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle personalize:completionQueue:completion:]",  @"[SMA] %s",  v13,  v14,  v15,  v16,  (uint64_t)v12);

  id v17 = [(id)objc_opt_class(self) personalizationQueue];
  id v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v17);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __66__SecureMobileAssetBundle_personalize_completionQueue_completion___block_invoke;
  block[3] = &unk_34E050;
  block[4] = self;
  id v23 = v8;
  id v24 = v9;
  id v25 = v10;
  id v19 = v10;
  id v20 = v9;
  id v21 = v8;
  dispatch_async(v18, block);
}

void __66__SecureMobileAssetBundle_personalize_completionQueue_completion___block_invoke(uint64_t a1)
{
  id v2 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"[Personalization] start %@", *(void *)(a1 + 32)));
  id v3 = [v2 UTF8String];
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle personalize:completionQueue:completion:]_block_invoke",  @"[SMA] %s",  v4,  v5,  v6,  v7,  (uint64_t)v3);

  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v27 = 0LL;
  unsigned int v10 = [v8 _personalize:v9 error:&v27];
  id v11 = v27;
  id v12 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"[Personalization] finish %@ (success = %i, error = %@)", *(void *)(a1 + 32), v10, v11));
  id v13 = [v12 UTF8String];
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle personalize:completionQueue:completion:]_block_invoke",  @"[SMA] %s",  v14,  v15,  v16,  v17,  (uint64_t)v13);

  id v18 = *(dispatch_queue_s **)(a1 + 48);
  id v19 = v18;
  if (!v18)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __66__SecureMobileAssetBundle_personalize_completionQueue_completion___block_invoke_2;
  block[3] = &unk_34EB88;
  id v21 = *(id *)(a1 + 56);
  char v26 = v10;
  id v24 = v11;
  id v25 = v21;
  id v22 = v11;
  dispatch_async(v19, block);
  if (!v18) {
}
  }

uint64_t __66__SecureMobileAssetBundle_personalize_completionQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(unsigned __int8 *)(a1 + 48),  *(void *)(a1 + 32));
}

+ (id)getSigningServerURL:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3
    && ([v3 isEqualToString:@"com.apple.MobileAsset.MobileAssetBrain"] & 1) != 0)
  {
    uint64_t v5 = @"https://gs.apple.com";
  }

  else
  {
    uint64_t v5 = @"https://gsra.apple.com:443";
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v5));
  if (os_variant_has_internal_content("com.apple.mobileassetd"))
  {
    uint64_t v7 = _MAPreferencesCopyNSStringValue(@"TatsuURLOverride");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (v8)
    {
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      {
        uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v8));

        id v11 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Using overridden value for signing server"));
        id v12 = [v11 UTF8String];
        _MobileAssetLog( 0LL,  6,  (uint64_t)"+[SecureMobileAssetBundle getSigningServerURL:]",  @"[SMA] %s",  v13,  v14,  v15,  v16,  (uint64_t)v12);

        uint64_t v6 = (void *)v10;
      }
    }
  }

  id v17 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Signing server is '%@'", v6));
  id v18 = [v17 UTF8String];
  _MobileAssetLog( 0LL,  6,  (uint64_t)"+[SecureMobileAssetBundle getSigningServerURL:]",  @"[SMA] %s",  v19,  v20,  v21,  v22,  (uint64_t)v18);

  return v6;
}

- (BOOL)_shouldForcePersonalizationFailure
{
  uint64_t v4 = _MAPreferencesCopyNSStringValue(@"FailPersonalizationConfig");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (!v5) {
    goto LABEL_18;
  }
  uint64_t v6 = v5;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 componentsSeparatedByString:@":"]);
  if ([v7 count])
  {
    id v15 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Default %@ invalid. Uneven number of ':' separated elements:[%@]", @"FailPersonalizationConfig", v6));
    id v16 = [v15 UTF8String];
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[SecureMobileAssetBundle _shouldForcePersonalizationFailure]",  @"[SMA] %s",  v17,  v18,  v19,  v20,  (uint64_t)v16);

LABEL_18:
    LOBYTE(v2) = 0;
    return v2 & 1;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectEnumerator]);
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 nextObject]);
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    while (1)
    {
      id v11 = v10;
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 nextObject]);
      uint64_t v2 = objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle assetType](self, "assetType"));
      unsigned int v13 = [v11 isEqualToString:v2];

      if (v13) {
        break;
      }

      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 nextObject]);
      if (!v10) {
        goto LABEL_8;
      }
    }

    if ([v12 isEqualToString:@"*"])
    {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle assetType](self, "assetType"));
      uint64_t v2 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"All specifiers of AssetType %@ are configured to fail personalization",  v21));

      id v22 = (id) v2;
      id v23 = [v22 UTF8String];
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle _shouldForcePersonalizationFailure]",  @"[SMA] %s",  v24,  v25,  v26,  v27,  (uint64_t)v23);
      LOBYTE(v2) = 1;
    }

    else
    {
      id v22 = (id)objc_claimAutoreleasedReturnValue([v12 componentsSeparatedByString:@","]);
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle assetSpecifier](self, "assetSpecifier"));
      LODWORD(v2) = [v22 containsObject:v28];

      if ((_DWORD)v2)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle assetSpecifier](self, "assetSpecifier"));
        id v30 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle assetType](self, "assetType"));
        v31 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"The current specifier(%@) of AssetType %@ is configured to fail personalization",  v29,  v30);
      }

      else
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle assetType](self, "assetType"));
        id v30 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle assetSpecifier](self, "assetSpecifier"));
        v31 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"The current AssetType(%@) is in the list of those configured to fail personalization but the current specifier(%@) is not",  v29,  v30);
      }

      id v32 = (void *)objc_claimAutoreleasedReturnValue(v31);

      id v33 = v32;
      id v34 = [v33 UTF8String];
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle _shouldForcePersonalizationFailure]",  @"[SMA] %s",  v35,  v36,  v37,  v38,  (uint64_t)v34);
    }

    int v14 = 0;
  }

  else
  {
LABEL_8:
    int v14 = 1;
  }

  if (v14) {
    goto LABEL_18;
  }
  return v2 & 1;
}

- (BOOL)_personalize:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [(id)objc_opt_class(self) personalizationQueue];
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  dispatch_assert_queue_V2(v7);

  AMAuthInstallLogSetHandler(_securemobileassetbundle_log);
  CFTypeRef cf = (CFTypeRef)AMAuthInstallCreate(kCFAllocatorDefault);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSString stringByAppendingPathComponent:]( self->_assetBundlePath,  "stringByAppendingPathComponent:",  @"AssetData"));
  v299 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathComponent:@"Restore"]);
  uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle secureAssetDataPath](self, "secureAssetDataPath"));
  v303 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v10));
  v309 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"ssoToken"]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"AuthInstallOptions"]);

  v329 = 0LL;
  v328 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"stageManifest"]);
  id v13 = [v12 BOOLValue];

  v297 = v8;
  v302 = (void *)v9;
  if (-[SecureMobileAssetBundle isPersonalized](self, "isPersonalized"))
  {
    int v14 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle assetBundlePath](self, "assetBundlePath"));
    id v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Bundle already personalized, skipping: %@",  v14);
LABEL_6:
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

    id v17 = v16;
    id v18 = [v17 UTF8String];
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle _personalize:error:]",  @"[SMA] %s",  v19,  v20,  v21,  v22,  (uint64_t)v18);

    id v23 = 0LL;
    v295 = 0LL;
    v296 = 0LL;
    v305 = 0LL;
    v306 = 0LL;
    v307 = 0LL;
    v308 = 0LL;
    v304 = 0LL;
    v300 = 0LL;
    id v301 = 0LL;
    uint64_t v24 = 0LL;
    uint64_t v25 = 0LL;
    v292 = 0LL;
    id v293 = 0LL;
    id v26 = 0LL;
    uint64_t v27 = 0LL;
    v291 = 0LL;
    v28 = 0LL;
    v298 = 0LL;
    v294 = &__NSDictionary0__struct;
    BOOL v29 = 1;
    goto LABEL_25;
  }

  if ((_DWORD)v13 && -[SecureMobileAssetBundle isPersonalizedManifestStaged](self, "isPersonalizedManifestStaged"))
  {
    int v14 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle assetBundlePath](self, "assetBundlePath"));
    id v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Bundle already personalized and personalized manifest staged, skipping: %@",  v14);
    goto LABEL_6;
  }

  if (!&_AMAuthInstallUpdaterCryptex1MobileAssetSetInfo)
  {
    uint64_t v35 = "AMAuthInstallUpdaterCryptex1MobileAssetSetInfo";
LABEL_13:
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Symbol not found: _%s",  v35));
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v37 setObject:v36 forKeyedSubscript:NSDebugDescriptionErrorKey];
    [v37 setObject:0 forKeyedSubscript:NSUnderlyingErrorKey];
    id v23 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  -5LL,  v37));

    BOOL v29 = 0;
    v295 = 0LL;
    v296 = 0LL;
LABEL_24:
    v305 = 0LL;
    v306 = 0LL;
    v307 = 0LL;
    v308 = 0LL;
    v304 = 0LL;
    id v301 = 0LL;
    uint64_t v24 = 0LL;
    uint64_t v25 = 0LL;
    v292 = 0LL;
    id v293 = 0LL;
    id v26 = 0LL;
    uint64_t v27 = 0LL;
    v291 = 0LL;
    v28 = 0LL;
    v298 = 0LL;
    v300 = 0LL;
    v294 = &__NSDictionary0__struct;
    goto LABEL_25;
  }

  if (!&_AMAuthInstallUpdaterCryptex1MobileAssetCopyImg4WithRestoreInfo)
  {
    uint64_t v35 = "AMAuthInstallUpdaterCryptex1MobileAssetCopyImg4WithRestoreInfo";
    goto LABEL_13;
  }

  id v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  [v30 removeItemAtPath:v10 error:0];

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle assetType](self, "assetType"));
  uint64_t v32 = objc_claimAutoreleasedReturnValue( +[SecureMobileAssetBundle getSigningServerURL:]( &OBJC_CLASS___SecureMobileAssetBundle,  "getSigningServerURL:",  v31));

  v296 = (void *)v32;
  uint64_t v33 = AMAuthInstallSetSigningServerURL(cf, v32);
  if ((_DWORD)v33)
  {
    id v34 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"AMAuthInstallSetSigningServerURL() failed with error %d (%@)",  v33,  AMAuthInstallGetLocalizedStatusString(cf, v33));
LABEL_23:
    uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue(v34);
    id v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v57 setObject:v56 forKeyedSubscript:NSDebugDescriptionErrorKey];
    [v57 setObject:0 forKeyedSubscript:NSUnderlyingErrorKey];
    id v23 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  102LL,  v57));

    BOOL v29 = 0;
    v295 = 0LL;
    goto LABEL_24;
  }

  if (v309)
  {
    uint64_t v38 = objc_opt_class(&OBJC_CLASS___NSData);
    if ((objc_opt_isKindOfClass(v309, v38) & 1) != 0)
    {
      if (!AMAuthInstallSsoSetToken(cf, v309))
      {
        id v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"User-authlisting enabled."));
        int v41 = 6;
        goto LABEL_20;
      }

      id v39 = @"Unable to set SSO token for user authlisting";
    }

    else
    {
      v238 = v309;
      id v39 = @"Invalid ssoToken=%@";
    }

    id v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v39, v238));
    int v41 = 3;
LABEL_20:
    id v42 = v40;
    id v43 = [v42 UTF8String];
    _MobileAssetLog( 0LL,  v41,  (uint64_t)"-[SecureMobileAssetBundle _personalize:error:]",  @"[SMA] %s",  v44,  v45,  v46,  v47,  (uint64_t)v43);
  }

  if (-[SecureMobileAssetBundle _shouldForcePersonalizationFailure](self, "_shouldForcePersonalizationFailure"))
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle assetType](self, "assetType"));
    v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Simulating personalization failure of asset(%@) due to default",  v48));

    id v50 = v49;
    id v51 = [v50 UTF8String];
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle _personalize:error:]",  @"[SMA] %s",  v52,  v53,  v54,  v55,  (uint64_t)v51);

    id v34 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Simulated personalization failure due to default",  v239,  v240);
    goto LABEL_23;
  }

  CFNumberRef v65 = MABrainUtilityCopyEcid();
  uint64_t v66 = objc_claimAutoreleasedReturnValue(v65);
  CFNumberRef v67 = MABrainUtilityCopyChipId();
  uint64_t v68 = objc_claimAutoreleasedReturnValue(v67);
  CFNumberRef v69 = MABrainUtilityCopyBoardId();
  v308 = (void *)objc_claimAutoreleasedReturnValue(v69);
  CFNumberRef v70 = MABrainUtilityCopySecurityDomain();
  v307 = (void *)objc_claimAutoreleasedReturnValue(v70);
  CFBooleanRef v71 = MABrainUtilityCopyCertificateSecurityMode();
  v306 = (void *)objc_claimAutoreleasedReturnValue(v71);
  CFBooleanRef v72 = MABrainUtilityCopySigningFuse();
  uint64_t v73 = objc_claimAutoreleasedReturnValue(v72);
  id v74 = &__NSDictionary0__struct;
  v304 = (void *)v73;
  v305 = (void *)v68;
  if (v66)
  {
    CFTypeRef v75 = cf;
    if (!v68 || !v308 || !v307 || !v306 || !v73) {
      goto LABEL_42;
    }
    v338[0] = kAMAuthInstallApParameterECID;
    v338[1] = kAMAuthInstallApParameterChipID;
    v339[0] = v66;
    v339[1] = v68;
    v338[2] = kAMAuthInstallApParameterBoardID;
    v338[3] = kAMAuthInstallApParameterSecurityDomain;
    v339[2] = v308;
    v339[3] = v307;
    v338[4] = kAMAuthInstallApParameterSecurityMode;
    v338[5] = kAMAuthInstallApParameterProductionMode;
    v339[4] = v306;
    v339[5] = v73;
    id v74 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v339,  v338,  6LL));
  }

  CFTypeRef v75 = cf;
LABEL_42:
  v294 = v74;
  v295 = (void *)v66;
  uint64_t v76 = AMAuthInstallApSetParameters(v75, v74);
  if ((_DWORD)v76)
  {
    uint64_t v77 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"AMAuthInstallApSetParameters() failed with error %d (%@)",  v76,  AMAuthInstallGetLocalizedStatusString(v75, v76));
    uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue(v77);
    uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v79 setObject:v78 forKeyedSubscript:NSDebugDescriptionErrorKey];
    [v79 setObject:0 forKeyedSubscript:NSUnderlyingErrorKey];
    id v23 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  102LL,  v79));

    BOOL v29 = 0;
    id v301 = 0LL;
    uint64_t v24 = 0LL;
    uint64_t v25 = 0LL;
    v292 = 0LL;
    id v293 = 0LL;
    id v26 = 0LL;
    uint64_t v27 = 0LL;
    v291 = 0LL;
LABEL_54:
    v28 = 0LL;
    v298 = 0LL;
    v300 = 0LL;
    goto LABEL_25;
  }

  if (_cryptex1_product_class_onceToken != -1) {
    dispatch_once(&_cryptex1_product_class_onceToken, &__block_literal_global_1237);
  }
  id v80 = (id)_cryptex1_product_class_productClass;
  v336[0] = kAMAuthInstallTagCryptex1ChipId;
  v336[1] = kAMAuthInstallTagCryptex1Type;
  v337[0] = @"0xFF10";
  v337[1] = &off_38EE78;
  v336[2] = kAMAuthInstallTagCryptex1ProductClass;
  id v293 = v80;
  v337[2] = v80;
  id v81 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v337,  v336,  3LL));
  v82 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"scpParametersOverride"]);
  uint64_t v83 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  v291 = v82;
  if ((objc_opt_isKindOfClass(v82, v83) & 1) != 0)
  {
    v84 = v81;
    id v85 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"WARNING: Using software coprocessor parameters override:\n%@", v82));
    id v86 = [v85 UTF8String];
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle _personalize:error:]",  @"[SMA] %s",  v87,  v88,  v89,  v90,  (uint64_t)v86);

    id v81 = v82;
  }

  v292 = v81;
  uint64_t v91 = AMAuthInstallApSoftwareCoprocessorSetParameters(cf, v81);
  if ((_DWORD)v91)
  {
    uint64_t v92 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"AMAuthInstallApSoftwareCoprocessorSetParameters() failed with error %d (%@)",  v91,  AMAuthInstallGetLocalizedStatusString(cf, v91));
LABEL_53:
    id v94 = (void *)objc_claimAutoreleasedReturnValue(v92);
    v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v95 setObject:v94 forKeyedSubscript:NSDebugDescriptionErrorKey];
    [v95 setObject:0 forKeyedSubscript:NSUnderlyingErrorKey];
    id v23 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  102LL,  v95));

    BOOL v29 = 0;
    id v301 = 0LL;
    uint64_t v24 = 0LL;
    uint64_t v25 = 0LL;
    id v26 = 0LL;
    uint64_t v27 = 0LL;
    goto LABEL_54;
  }

  uint64_t v93 = AMAuthInstallBundleCopyBuildIdentityForVariant(cf, v9, 0LL, &v328);
  if ((_DWORD)v93)
  {
    uint64_t v92 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"AMAuthInstallBundleCopyBuildIdentityForVariant() failed with error %d (%@)",  v93,  AMAuthInstallGetLocalizedStatusString(cf, v93));
    goto LABEL_53;
  }

  uint64_t v27 = v328;
  if (!v328)
  {
    __int128 v101 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"AMAuthInstallBundleCopyBuildIdentityForVariant() returned a NULL buildIdentity"));
    __int128 v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v102 setObject:v101 forKeyedSubscript:NSDebugDescriptionErrorKey];
    [v102 setObject:0 forKeyedSubscript:NSUnderlyingErrorKey];
    id v23 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  102LL,  v102));

    BOOL v29 = 0;
    id v301 = 0LL;
    uint64_t v24 = 0LL;
    uint64_t v25 = 0LL;
    id v26 = 0LL;
    goto LABEL_54;
  }

  v328 = 0LL;
  id v96 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"Info"]);
  uint64_t v97 = objc_claimAutoreleasedReturnValue([v96 objectForKeyedSubscript:@"Variant"]);

  uint64_t v98 = objc_opt_class(&OBJC_CLASS___NSString);
  v298 = (void *)v97;
  v300 = v27;
  if ((objc_opt_isKindOfClass(v97, v98) & 1) == 0)
  {
    __int128 v100 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to look up variant",  v238,  v240);
    goto LABEL_62;
  }

  if (v307)
  {
    uint64_t v99 = AMAuthInstallSetUpdaterRequestEntry( cf,  kAMAuthInstallTagApSecurityDomain,  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"0x%02X",  [v307 intValue]));
    if ((_DWORD)v99)
    {
      __int128 v100 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"AMAuthInstallSetUpdaterRequestEntry() failed with error %d (%@)",  v99,  AMAuthInstallGetLocalizedStatusString(cf, v99));
LABEL_62:
      __int128 v103 = (void *)objc_claimAutoreleasedReturnValue(v100);
      id v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      [v104 setObject:v103 forKeyedSubscript:NSDebugDescriptionErrorKey];
      [v104 setObject:0 forKeyedSubscript:NSUnderlyingErrorKey];
      id v23 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  102LL,  v104));

      BOOL v29 = 0;
      id v301 = 0LL;
      uint64_t v24 = 0LL;
      uint64_t v25 = 0LL;
      id v26 = 0LL;
LABEL_63:
      uint64_t v27 = 0LL;
LABEL_64:
      v28 = 0LL;
      goto LABEL_25;
    }
  }

  id v105 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Generating nonce proposal for darwin"));
  id v106 = [v105 UTF8String];
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle _personalize:error:]",  @"[SMA] %s",  v107,  v108,  v109,  v110,  (uint64_t)v106);

  id v327 = 0LL;
  id v326 = 0LL;
  id v325 = 0LL;
  unsigned int v111 = -[SecureMobileAssetBundle _generateNonceProposalForHandle:digest:nonce:error:]( self,  "_generateNonceProposalForHandle:digest:nonce:error:",  5LL,  &v327,  &v326,  &v325);
  id v26 = v327;
  id v301 = v326;
  id v23 = v325;
  if (!v111)
  {
LABEL_101:
    BOOL v29 = 0;
    uint64_t v24 = 0LL;
    uint64_t v25 = 0LL;
    goto LABEL_63;
  }

  if (!-[SecureMobileAssetBundle isMappableToExclaves:](self, "isMappableToExclaves:", 0LL))
  {
    uint64_t v24 = 0LL;
    id v285 = v23;
LABEL_76:
    uint64_t v27 = 0LL;
    goto LABEL_77;
  }

  if (!+[SecureMobileAssetBundle _shouldUseConclave:]( &OBJC_CLASS___SecureMobileAssetBundle,  "_shouldUseConclave:",  -[SecureMobileAssetBundle darwinOnly](self, "darwinOnly")))
  {
LABEL_74:
    uint64_t v24 = 0LL;
    uint64_t v27 = 0LL;
    id v285 = v23;
LABEL_77:
    id v121 = v26;

    id v122 = v301;
    uint64_t v27 = v121;
    uint64_t v24 = v122;
    goto LABEL_78;
  }

  id v324 = v23;
  v112 = (void *)objc_claimAutoreleasedReturnValue( +[SecureMobileAssetBundle getExclaveManager:]( &OBJC_CLASS___SecureMobileAssetBundle,  "getExclaveManager:",  &v324));
  id v285 = v324;

  v279 = v112;
  if (!v112)
  {
    if (v285)
    {
      id v167 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to get shared instance of SecureMobileAssetExclave"));
      id v168 = v285;
      v169 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      [v169 setObject:v167 forKeyedSubscript:NSDebugDescriptionErrorKey];
      [v169 setObject:v168 forKeyedSubscript:NSUnderlyingErrorKey];
      id v285 = v169;
      id v23 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  102LL,  v169));
      v170 = v168;
LABEL_100:

      goto LABEL_101;
    }

    id v217 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Unable to get SecureMobileAssetExclave instance in this environment"));
    id v218 = [v217 UTF8String];
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle _personalize:error:]",  @"[SMA] %s",  v219,  v220,  v221,  v222,  (uint64_t)v218);

    id v285 = 0LL;
    uint64_t v24 = 0LL;
    goto LABEL_76;
  }

  id v113 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Generating nonce proposal for exclaves"));
  id v114 = [v113 UTF8String];
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle _personalize:error:]",  @"[SMA] %s",  v115,  v116,  v117,  v118,  (uint64_t)v114);

  id v323 = 0LL;
  v119 = (void *)objc_claimAutoreleasedReturnValue([v112 proposeNonce:&v323]);
  id v120 = v323;
  if (!v119)
  {
    id v171 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Failed to get nonce dictionary from SecureMobileAssetExclave: %@", v120));
    id v172 = [v171 UTF8String];
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[SecureMobileAssetBundle _personalize:error:]",  @"[SMA] %s",  v173,  v174,  v175,  v176,  (uint64_t)v172);

    v170 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to get exclave nonces"));
    id v167 = v120;
    id v168 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v168 setObject:v170 forKeyedSubscript:NSDebugDescriptionErrorKey];
    [v168 setObject:v167 forKeyedSubscript:NSUnderlyingErrorKey];
    id v23 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  102LL,  v168));

    goto LABEL_100;
  }

  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v119 objectForKeyedSubscript:@"digestNonce"]);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v119 objectForKeyedSubscript:@"rawNonce"]);

  if (!v24 || !v27) {
    goto LABEL_77;
  }
LABEL_78:
  id v123 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Darwin nonce digest: %@", v26));
  id v124 = [v123 UTF8String];
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle _personalize:error:]",  @"[SMA] %s",  v125,  v126,  v127,  v128,  (uint64_t)v124);

  id v129 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Exclave nonce digest: %@", v27));
  id v130 = [v129 UTF8String];
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle _personalize:error:]",  @"[SMA] %s",  v131,  v132,  v133,  v134,  (uint64_t)v130);

  uint64_t v135 = AMAuthInstallUpdaterCryptex1MobileAssetSetInfo(cf, v302, v303, 0LL, v11, v26, 0LL, v27, 0LL, 0, &v329);
  id v23 = v329;
  if (v329)
  {

    BOOL v29 = 0;
    uint64_t v25 = 0LL;
LABEL_80:
    v28 = 0LL;
    v329 = 0LL;
    goto LABEL_25;
  }

  if ((_DWORD)v135)
  {
    v136 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"AMAuthInstallUpdaterCryptex1SetInfo() failed with error %d (%@)",  v135,  AMAuthInstallGetLocalizedStatusString(cf, v135));
    v137 = (void *)objc_claimAutoreleasedReturnValue(v136);
    v138 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v138 setObject:v137 forKeyedSubscript:NSDebugDescriptionErrorKey];
    [v138 setObject:0 forKeyedSubscript:NSUnderlyingErrorKey];
    id v23 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  102LL,  v138));

    BOOL v29 = 0;
    uint64_t v25 = 0LL;
    goto LABEL_64;
  }

  if (&_AMAuthInstallUpdaterCopyTags && (uint64_t v139 = kAMAuthInstallUpdaterRequestHeaderTags) != 0)
  {
    uint64_t v140 = AMAuthInstallUpdaterCopyTags(cf, @"Cryptex1", kAMAuthInstallUpdaterRequestHeaderTags, &v329);
    uint64_t v25 = (NSMutableDictionary *)v140;
    id v23 = v329;
    if (v329) {
      goto LABEL_89;
    }
    if (!v140)
    {
      id v141 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"No requestTags found in existing amai object. Creating new object"));
      id v142 = [v141 UTF8String];
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle _personalize:error:]",  @"[SMA] %s",  v143,  v144,  v145,  v146,  (uint64_t)v142);

      uint64_t v25 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v25,  "setObject:forKeyedSubscript:",  @"nsb",  @"x-tatsu-route");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v25,  "setObject:forKeyedSubscript:",  v298,  @"x-tatsu-rlid");
    id v147 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Setting headers: %@", v25));
    id v148 = [v147 UTF8String];
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle _personalize:error:]",  @"[SMA] %s",  v149,  v150,  v151,  v152,  (uint64_t)v148);

    AMAuthInstallUpdaterSetTags(cf, @"Cryptex1", v139, v25, &v329);
    id v23 = v329;
    if (v329)
    {
LABEL_89:

      BOOL v29 = 0;
      goto LABEL_80;
    }
  }

  else
  {
    id v153 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Not adding additional requestTags to personalization request"));
    id v154 = [v153 UTF8String];
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle _personalize:error:]",  @"[SMA] %s",  v155,  v156,  v157,  v158,  (uint64_t)v154);

    uint64_t v25 = 0LL;
  }

  uint64_t v280 = AMAuthInstallSetSigningServerRetry(cf, 1LL);
  if ((_DWORD)v280)
  {
    v159 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unable to set signing server retry count | AMAuthInstallSetSigningServerRetry() failed with error %d (%@)",  v280,  AMAuthInstallGetLocalizedStatusString(cf, v280));
    id v160 = objc_claimAutoreleasedReturnValue(v159);
    id v161 = [v160 UTF8String];
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle _personalize:error:]",  @"[SMA] %s",  v162,  v163,  v164,  v165,  (uint64_t)v161);
  }

  v166 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  AMAuthInstallSetUUID(cf, [v166 UUIDString]);

  CFTypeRef v254 = (CFTypeRef)AMAuthInstallUpdaterPersonalize(cf, @"Cryptex1", v303, &v329);
  id v23 = v329;
  if (v329)
  {

    v28 = 0LL;
    BOOL v29 = 0;
    v329 = 0LL;
    goto LABEL_95;
  }

  if (!v254)
  {
    v223 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"AMAuthInstallUpdaterPersonalize() failed with error %d (%@)",  v280,  AMAuthInstallGetLocalizedStatusString(cf, v280));
    v224 = (void *)objc_claimAutoreleasedReturnValue(v223);
    v225 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v225 setObject:v224 forKeyedSubscript:NSDebugDescriptionErrorKey];
    [v225 setObject:0 forKeyedSubscript:NSUnderlyingErrorKey];
    id v23 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  102LL,  v225));

    BOOL v29 = 0;
    goto LABEL_64;
  }

  uint64_t v177 = AMAuthInstallUpdaterCryptex1MobileAssetCopyImg4WithRestoreInfo(cf, v303, v301, v24, &v329);
  if (v177)
  {
    v28 = (const void *)v177;
    v241 = objc_autoreleasePoolPush();
    v334[0] = @"SecureMobileAsset.trustcache";
    v334[1] = @"SecureMobileAsset.root_hash";
    v335[0] = kAMAuthInstallBuildIdentityCryptex1GenericTrustCache;
    v335[1] = kAMAuthInstallBuildIdentityCryptex1GenericVolume;
    v334[2] = @"SecureMobileAsset.integritycatalog";
    v334[3] = @"SecureMobileAsset-Info.plist";
    v335[2] = kAMAuthInstallBuildIdentityCryptex1GenericIntegrityCatalog;
    v335[3] = kAMAuthInstallBuildIdentityCryptex1CryptexInfoPlist;
    v281 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v335,  v334,  4LL));
    v332 = @"SecureMobileAsset.dmg";
    uint64_t v333 = kAMAuthInstallBuildIdentityCryptex1GenericDmg;
    v242 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v333,  &v332,  1LL));
    v244 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", &off_38FAD8));
    __int128 v319 = 0u;
    __int128 v320 = 0u;
    __int128 v321 = 0u;
    __int128 v322 = 0u;
    id obj = v281;
    id v247 = [obj countByEnumeratingWithState:&v319 objects:v331 count:16];
    if (v247)
    {
      uint64_t v245 = *(void *)v320;
LABEL_106:
      v268 = 0LL;
      while (1)
      {
        if (*(void *)v320 != v245) {
          objc_enumerationMutation(obj);
        }
        uint64_t v178 = *(void *)(*((void *)&v319 + 1) + 8LL * (void)v268);
        context = objc_autoreleasePoolPush();
        v272 = (void *)objc_claimAutoreleasedReturnValue([v300 objectForKeyedSubscript:@"Manifest"]);
        uint64_t v258 = v178;
        v179 = (void *)objc_claimAutoreleasedReturnValue([obj objectForKeyedSubscript:v178]);
        id v282 = (id)objc_claimAutoreleasedReturnValue([v272 objectForKeyedSubscript:v179]);

        if (v282)
        {
          v273 = (void *)objc_claimAutoreleasedReturnValue([v282 objectForKeyedSubscript:@"Info"]);
          uint64_t v180 = objc_claimAutoreleasedReturnValue([v273 objectForKeyedSubscript:@"Path"]);

          v274 = (void *)v180;
          if (!v180)
          {
            uint64_t v263 = objc_claimAutoreleasedReturnValue([obj objectForKeyedSubscript:v258]);
            uint64_t v229 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Manifest entry for %@ has no path",  v263));
            v230 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
            v271 = (void *)v229;
            [v230 setObject:v229 forKeyedSubscript:NSDebugDescriptionErrorKey];
            [v230 setObject:0 forKeyedSubscript:NSUnderlyingErrorKey];
            id v23 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  102LL,  v230));

            id v285 = (id)v263;
LABEL_141:
            id v257 = obj;
LABEL_142:

LABEL_143:
            objc_autoreleasePoolPop(context);

            objc_autoreleasePoolPop(v241);
            goto LABEL_144;
          }

          id v255 = (id)objc_claimAutoreleasedReturnValue([v299 stringByAppendingPathComponent:v180]);
          v259 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByAppendingPathComponent:v258]);
          id v181 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Attempting to copy file from %@ to %@", v255, v259));
          id v182 = [v181 UTF8String];
          _MobileAssetLog( 0LL,  7,  (uint64_t)"-[SecureMobileAssetBundle _personalize:error:]",  @"[SMA] %s",  v183,  v184,  v185,  v186,  (uint64_t)v182);

          v249 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          id v318 = v285;
          unsigned __int8 v251 = [v249 copyItemAtPath:v255 toPath:v259 error:&v318];
          id v23 = v318;

          if ((v251 & 1) == 0)
          {
            id v257 = obj;
            goto LABEL_143;
          }

          id v285 = v23;
        }

        else
        {
          unsigned int v256 = [v244 containsObject:v258];
          id v282 = (id)objc_claimAutoreleasedReturnValue([obj objectForKeyedSubscript:v258]);
          if (v256)
          {
            uint64_t v231 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Could not find manifest entry to copy for %@",  v282));
            v232 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
            v274 = (void *)v231;
            [v232 setObject:v231 forKeyedSubscript:NSDebugDescriptionErrorKey];
            [v232 setObject:0 forKeyedSubscript:NSUnderlyingErrorKey];
            v271 = v232;
            id v23 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  102LL,  v232));
            goto LABEL_141;
          }

          v187 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SecureMobileAsset did not contain a personalized entry for %@",  v282));

          id v282 = v187;
          id v188 = [v282 UTF8String];
          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle _personalize:error:]",  @"[SMA] %s",  v189,  v190,  v191,  v192,  (uint64_t)v188);
        }

        objc_autoreleasePoolPop(context);
        v268 = (char *)v268 + 1;
        if (v247 == v268)
        {
          id v247 = [obj countByEnumeratingWithState:&v319 objects:v331 count:16];
          if (v247) {
            goto LABEL_106;
          }
          break;
        }
      }
    }

    __int128 v316 = 0u;
    __int128 v317 = 0u;
    __int128 v314 = 0u;
    __int128 v315 = 0u;
    id v257 = v242;
    id v246 = [v257 countByEnumeratingWithState:&v314 objects:v330 count:16];
    if (v246)
    {
      uint64_t v243 = *(void *)v315;
      while (2)
      {
        for (i = 0LL; i != v246; i = (char *)i + 1)
        {
          if (*(void *)v315 != v243) {
            objc_enumerationMutation(v257);
          }
          uint64_t v193 = *(void *)(*((void *)&v314 + 1) + 8LL * (void)i);
          context = objc_autoreleasePoolPush();
          v275 = (void *)objc_claimAutoreleasedReturnValue([v300 objectForKeyedSubscript:@"Manifest"]);
          uint64_t v252 = v193;
          v194 = (void *)objc_claimAutoreleasedReturnValue([v257 objectForKeyedSubscript:v193]);
          id v282 = (id)objc_claimAutoreleasedReturnValue([v275 objectForKeyedSubscript:v194]);

          if (v282)
          {
            v276 = (void *)objc_claimAutoreleasedReturnValue([v282 objectForKeyedSubscript:@"Info"]);
            uint64_t v195 = objc_claimAutoreleasedReturnValue([v276 objectForKeyedSubscript:@"Path"]);

            v274 = (void *)v195;
            if (!v195)
            {
              uint64_t v264 = objc_claimAutoreleasedReturnValue([obj objectForKeyedSubscript:v252]);
              uint64_t v233 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Manifest entry for %@ has no path",  v264));
              v234 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
              v271 = (void *)v233;
              [v234 setObject:v233 forKeyedSubscript:NSDebugDescriptionErrorKey];
              [v234 setObject:0 forKeyedSubscript:NSUnderlyingErrorKey];
              id v23 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  102LL,  v234));

              id v285 = (id)v264;
              goto LABEL_142;
            }

            uint64_t v250 = objc_claimAutoreleasedReturnValue([@".." stringByAppendingPathComponent:@"AssetData"]);
            v196 = (void *)objc_claimAutoreleasedReturnValue([(id)v250 stringByAppendingPathComponent:@"Restore"]);
            v260 = (void *)objc_claimAutoreleasedReturnValue([v196 stringByAppendingPathComponent:v274]);

            v253 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByAppendingPathComponent:v252]);
            id v197 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Attempting to symlink %@ to %@", v253, v260));
            id v198 = [v197 UTF8String];
            _MobileAssetLog( 0LL,  7,  (uint64_t)"-[SecureMobileAssetBundle _personalize:error:]",  @"[SMA] %s",  v199,  v200,  v201,  v202,  (uint64_t)v198);

            v248 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
            id v313 = v285;
            LOBYTE(v250) = [v248 createSymbolicLinkAtPath:v253 withDestinationPath:v260 error:&v313];
            id v23 = v313;

            if ((v250 & 1) == 0) {
              goto LABEL_143;
            }

            id v285 = v23;
          }

          else
          {
            unsigned int v261 = [v244 containsObject:v252];
            id v282 = (id)objc_claimAutoreleasedReturnValue([v257 objectForKeyedSubscript:v252]);
            if (v261)
            {
              uint64_t v235 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Could not find manifest entry to link for %@",  v282));
              v236 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
              v274 = (void *)v235;
              [v236 setObject:v235 forKeyedSubscript:NSDebugDescriptionErrorKey];
              [v236 setObject:0 forKeyedSubscript:NSUnderlyingErrorKey];
              v271 = v236;
              id v23 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  102LL,  v236));
              goto LABEL_142;
            }

            v203 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SecureMobileAsset did not contain a personalized entry for %@",  v282));

            id v282 = v203;
            id v204 = [v282 UTF8String];
            _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle _personalize:error:]",  @"[SMA] %s",  v205,  v206,  v207,  v208,  (uint64_t)v204);
          }

          objc_autoreleasePoolPop(context);
        }

        id v246 = [v257 countByEnumeratingWithState:&v314 objects:v330 count:16];
        if (v246) {
          continue;
        }
        break;
      }
    }

    v270 = objc_autoreleasePoolPush();
    v283 = (void *)objc_claimAutoreleasedReturnValue([v299 stringByAppendingPathComponent:@"BuildManifest.plist"]);
    v277 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByAppendingPathComponent:@"BuildManifest.plist"]);
    id v209 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Attempting to copy BuildManifest from %@ to %@", v283, v277));
    id v210 = [v209 UTF8String];
    _MobileAssetLog( 0LL,  7,  (uint64_t)"-[SecureMobileAssetBundle _personalize:error:]",  @"[SMA] %s",  v211,  v212,  v213,  v214,  (uint64_t)v210);

    v262 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v312 = v285;
    unsigned int contexta = [v262 copyItemAtPath:v283 toPath:v277 error:&v312];
    id v23 = v312;

    unsigned int v286 = 0;
    if (contexta)
    {
      id v311 = v23;
      unsigned int v286 = -[SecureMobileAssetBundle _storeManifest:stage:error:]( self,  "_storeManifest:stage:error:",  v28,  v13,  &v311);
      id v215 = v311;

      id v23 = v215;
    }

    objc_autoreleasePoolPop(v270);
    objc_autoreleasePoolPop(v241);
    if (v286)
    {
      int v216 = AMAuthInstallUpdaterSaveToReceipt(cf, @"Cryptex1", v303, &v329);
      v287 = v329;
      if (v329)
      {

        BOOL v29 = 0;
        v329 = 0LL;
        id v23 = v287;
      }

      else if (v216)
      {
        BOOL v29 = 1;
      }

      else
      {
        v289 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"AMAuthInstallUpdaterSaveToReceipt() failed"));
        v237 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        [v237 setObject:v289 forKeyedSubscript:NSDebugDescriptionErrorKey];
        [v237 setObject:0 forKeyedSubscript:NSUnderlyingErrorKey];
        uint64_t v284 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  102LL,  v237));

        BOOL v29 = 0;
        id v23 = (id)v284;
      }
    }

    else
    {
LABEL_144:
      BOOL v29 = 0;
    }

- (BOOL)_generateNonceProposalForHandle:(unint64_t)a3 digest:(id *)a4 nonce:(id *)a5 error:(id *)a6
{
  if (!__isPlatformVersionAtLeast(3, 18, 0, 0))
  {
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Nonce proposal API unavailable"));
    id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v26 setObject:v25 forKeyedSubscript:NSDebugDescriptionErrorKey];
    [v26 setObject:0 forKeyedSubscript:NSUnderlyingErrorKey];
    uint64_t v27 = -5LL;
LABEL_7:
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  v27,  v26));

    *a6 = v28;
    return 0;
  }

  uint64_t v10 = image4_environment_new(&_image4_coprocessor_cryptex1, a3);
  uint64_t v40 = v10;
  if (!v10)
  {
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"image4_environment_new() failed"));
    id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v26 setObject:v25 forKeyedSubscript:NSDebugDescriptionErrorKey];
    [v26 setObject:0 forKeyedSubscript:NSUnderlyingErrorKey];
    uint64_t v27 = 102LL;
    goto LABEL_7;
  }

  memset(v42, 0, sizeof(v42));
  v41[0] = 0LL;
  v41[1] = 0LL;
  uint64_t v38 = 16LL;
  uint64_t v39 = 0LL;
  uint64_t v11 = image4_environment_generate_nonce_proposal(v10, v42, &v39, v41, &v38);
  image4_environment_destroy(&v40);
  BOOL v12 = (_DWORD)v11 == 0;
  if ((_DWORD)v11)
  {
    id v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to generate nonce proposal: %d (%s)",  v11,  strerror(v11));
    id v14 = objc_claimAutoreleasedReturnValue(v13);
    id v15 = [v14 UTF8String];
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[SecureMobileAssetBundle _generateNonceProposalForHandle:digest:nonce:error:]",  @"[SMA] %s",  v16,  v17,  v18,  v19,  (uint64_t)v15);

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  (int)v11,  0LL));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"image4_environment_generate_nonce_proposal() failed"));
    id v22 = v20;
    id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v23 setObject:v21 forKeyedSubscript:NSDebugDescriptionErrorKey];
    [v23 setObject:v22 forKeyedSubscript:NSUnderlyingErrorKey];

    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  102LL,  v23));
    *a6 = v24;
  }

  else
  {
    id v30 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Obtained nonce (%lu bytes) and digest (%lu bytes)", v38, v39));
    id v31 = [v30 UTF8String];
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle _generateNonceProposalForHandle:digest:nonce:error:]",  @"[SMA] %s",  v32,  v33,  v34,  v35,  (uint64_t)v31);

    uint64_t v36 = objc_alloc(&OBJC_CLASS___NSData);
    *a4 = -[NSData initWithBytes:length:](v36, "initWithBytes:length:", v42, v39);
    uint64_t v37 = objc_alloc(&OBJC_CLASS___NSData);
    *a5 = -[NSData initWithBytes:length:](v37, "initWithBytes:length:", v41, v38);
  }

  return v12;
}

- (BOOL)_storeManifest:(id)a3 stage:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (__isPlatformVersionAtLeast(3, 18, 0, 0))
  {
    uint64_t v9 = @"Storing";
    if (v6) {
      uint64_t v9 = @"Staging";
    }
    id v10 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"%@ manifest for %@", v9, self));
    id v11 = [v10 UTF8String];
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle _storeManifest:stage:error:]",  @"[SMA] %s",  v12,  v13,  v14,  v15,  (uint64_t)v11);

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle secureInfoPlistPath](self, "secureInfoPlistPath"));
    if (!v16)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"failed to get cryptex info plist path"));
      BOOL v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      [v29 setObject:v28 forKeyedSubscript:NSDebugDescriptionErrorKey];
      [v29 setObject:0 forKeyedSubscript:NSUnderlyingErrorKey];
      id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  102LL,  v29));

      *a5 = v30;
      BOOL v27 = 0;
LABEL_49:

      goto LABEL_50;
    }

    id v89 = 0LL;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v16,  0LL,  &v89));
    id v18 = v89;
    if (!v17)
    {
      id v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"failed to read cryptex info plist"));
      id v22 = v18;
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      [v32 setObject:v31 forKeyedSubscript:NSDebugDescriptionErrorKey];
      [v32 setObject:v22 forKeyedSubscript:NSUnderlyingErrorKey];
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  102LL,  v32));

      BOOL v27 = 0;
      *a5 = v33;
LABEL_48:

      goto LABEL_49;
    }

    id v19 = objc_alloc_init(&OBJC_CLASS___MASecureManifestStorage);
    uint64_t v20 = v19;
    id v81 = v19;
    if (v6)
    {
      if ((objc_opt_respondsToSelector(v19, "stageManifest:infoPlist:error:") & 1) != 0)
      {
        id v88 = v18;
        unsigned __int8 v21 = [v20 stageManifest:v8 infoPlist:v17 error:&v88];
        id v22 = v88;

        if ((v21 & 1) != 0)
        {
          int v23 = 1;
          goto LABEL_16;
        }

        uint64_t v55 = @"failed to stage manifest";
        goto LABEL_27;
      }

      id v34 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Warning: MASecureManifestStorage does not support staging, storing manifest instead"));
      id v35 = [v34 UTF8String];
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[SecureMobileAssetBundle _storeManifest:stage:error:]",  @"[SMA] %s",  v36,  v37,  v38,  v39,  (uint64_t)v35);
    }

    id v87 = v18;
    unsigned __int8 v40 = [v20 storeManifest:v8 infoPlist:v17 error:&v87];
    id v22 = v87;

    if ((v40 & 1) != 0)
    {
      int v23 = 0;
LABEL_16:
      unsigned int v86 = 0;
      if (!-[SecureMobileAssetBundle isMappableToExclaves:](self, "isMappableToExclaves:", &v86)
        || !+[SecureMobileAssetBundle _shouldUseConclave:]( &OBJC_CLASS___SecureMobileAssetBundle,  "_shouldUseConclave:",  -[SecureMobileAssetBundle darwinOnly](self, "darwinOnly")))
      {
        goto LABEL_46;
      }

      uint64_t v41 = objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle integrityCatalogPath](self, "integrityCatalogPath"));
      if (v41)
      {
        v85[1] = v22;
        id v80 = (void *)v41;
        uint64_t v42 = objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:"));
        id v43 = v22;

        if (v42)
        {
          v85[0] = v43;
          uint64_t v44 = objc_claimAutoreleasedReturnValue( +[SecureMobileAssetBundle getExclaveManager:]( &OBJC_CLASS___SecureMobileAssetBundle,  "getExclaveManager:",  v85));
          id v45 = v85[0];

          uint64_t v78 = (void *)v42;
          uint64_t v79 = (void *)v44;
          if (v44)
          {
            int v46 = objc_opt_respondsToSelector(v44, "stageManifest:infoPlist:catalog:error:");
            int v47 = v46;
            v48 = v80;
            if (v23 && (v46 & 1) == 0)
            {
              id v49 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Warning: MAExclaveManifestStorageService does not support staging, storing manifest instead"));
              id v50 = [v49 UTF8String];
              _MobileAssetLog( 0LL,  3,  (uint64_t)"-[SecureMobileAssetBundle _storeManifest:stage:error:]",  @"[SMA] %s",  v51,  v52,  v53,  v54,  (uint64_t)v50);

              uint64_t v42 = (uint64_t)v78;
LABEL_38:
              id v83 = v45;
              unsigned int v64 = [v79 storeManifest:v8 infoPlist:v17 catalog:v42 error:&v83];
              id v65 = v83;

              if ((v64 & v47) == 1)
              {
                uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  v86));
                uint64_t v90 = v66;
                CFNumberRef v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v90,  1LL));
                id v82 = v65;
                unsigned __int8 v68 = [v79 commitStagedManifestForFSTags:v67 error:&v82];
                id v22 = v82;

                id v65 = v22;
                v48 = v80;
                if ((v68 & 1) != 0) {
                  goto LABEL_45;
                }
              }

              else
              {
                v48 = v80;
              }

              uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"failed to store manifest in Exclave Secure Storage"));
              id v22 = v65;
              goto LABEL_43;
            }

            if (!v23) {
              goto LABEL_38;
            }
            id v84 = v45;
            unsigned __int8 v63 = [v79 stageManifest:v8 infoPlist:v17 catalog:v42 error:&v84];
            id v22 = v84;

            if ((v63 & 1) == 0)
            {
              uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"failed to stage manifest in Exclave Secure Storage"));
              id v62 = v22;
              goto LABEL_37;
            }
          }

          else
          {
            v48 = v80;
            if (v45)
            {
              uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to get shared instance of SecureMobileAssetExclave"));
              id v62 = v45;
LABEL_37:
              id v22 = v62;
LABEL_43:
              CFNumberRef v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
              [v69 setObject:v61 forKeyedSubscript:NSDebugDescriptionErrorKey];
              [v69 setObject:v22 forKeyedSubscript:NSUnderlyingErrorKey];
              CFNumberRef v70 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  102LL,  v69));

              *a5 = v70;
              goto LABEL_29;
            }

            id v71 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Unable to get SecureMobileAssetExclave instance in this environment"));
            id v72 = [v71 UTF8String];
            _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle _storeManifest:stage:error:]",  @"[SMA] %s",  v73,  v74,  v75,  v76,  (uint64_t)v72);

            id v22 = 0LL;
          }

- (BOOL)depersonalize:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle secureAssetDataPath](self, "secureAssetDataPath"));
  id v6 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Depersonalizing %@", self));
  id v7 = [v6 UTF8String];
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle depersonalize:]",  @"[SMA] %s",  v8,  v9,  v10,  v11,  (uint64_t)v7);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v13 = [v12 fileExistsAtPath:v5];

  if (!v13)
  {
    id v16 = 0LL;
LABEL_9:
    BOOL v31 = 1;
    goto LABEL_10;
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v33 = 0LL;
  unsigned __int8 v15 = [v14 removeItemAtPath:v5 error:&v33];
  id v16 = v33;

  if ((v15 & 1) != 0)
  {
    id v17 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Removed personalized bundle: %@", v5));
    id v18 = [v17 UTF8String];
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle depersonalize:]",  @"[SMA] %s",  v19,  v20,  v21,  v22,  (uint64_t)v18);
  }

  else
  {
    id v17 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to remove personalized bundle for %@: %@",  self,  v16));
    id v23 = v16;
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v24 setObject:v17 forKeyedSubscript:NSDebugDescriptionErrorKey];
    [v24 setObject:v23 forKeyedSubscript:NSUnderlyingErrorKey];
    id v16 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  103LL,  v24));
  }

  if (!v16) {
    goto LABEL_9;
  }
  id v25 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Failed to depersonalize: %@", v16));
  id v26 = [v25 UTF8String];
  _MobileAssetLog( 0LL,  3,  (uint64_t)"-[SecureMobileAssetBundle depersonalize:]",  @"[SMA] %s",  v27,  v28,  v29,  v30,  (uint64_t)v26);

  if (a3)
  {
    id v16 = v16;
    BOOL v31 = 0;
    *a3 = v16;
  }

  else
  {
    BOOL v31 = 0;
  }

- (BOOL)isGrafted
{
  uint64_t v2 = self;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle graftPath](self, "graftPath"));
  LOBYTE(v2) = -[SecureMobileAssetBundle isGraftedPath:](v2, "isGraftedPath:", v3);

  return (char)v2;
}

- (BOOL)isGraftedPath:(id)a3
{
  v5[0] = 0LL;
  v5[1] = 0LL;
  if (fsctl( (const char *)objc_msgSend(a3, "fileSystemRepresentation", 0, 0), 0xC0104A66uLL, v5, 1u))
  {
    BOOL v3 = 1;
  }

  else
  {
    BOOL v3 = BYTE4(v5[0]) == 0;
  }

  return !v3;
}

- (BOOL)graft:(id *)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  unint64_t v76 = -1LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle graftPath](self, "graftPath"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle cryptexPath](self, "cryptexPath"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle ticketPath](self, "ticketPath"));
  char v75 = 0;
  __int128 v113 = 0u;
  memset(v114, 0, sizeof(v114));
  __int128 v111 = 0u;
  __int128 v112 = 0u;
  __int128 v109 = 0u;
  __int128 v110 = 0u;
  __int128 v107 = 0u;
  __int128 v108 = 0u;
  __int128 v105 = 0u;
  __int128 v106 = 0u;
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  __int128 v101 = 0u;
  __int128 v102 = 0u;
  __int128 v100 = 0u;
  __int128 v99 = 0u;
  __int128 v98 = 0u;
  __int128 v97 = 0u;
  __int128 v96 = 0u;
  __int128 v95 = 0u;
  __int128 v94 = 0u;
  __int128 v93 = 0u;
  __int128 v92 = 0u;
  __int128 v91 = 0u;
  __int128 v90 = 0u;
  __int128 v89 = 0u;
  __int128 v88 = 0u;
  __int128 v87 = 0u;
  __int128 v86 = 0u;
  __int128 v85 = 0u;
  __int128 v83 = xmmword_27EBA0;
  int v84 = -1;
  v81[0] = NSFileOwnerAccountID;
  v81[1] = NSFileGroupOwnerAccountID;
  v82[0] = &off_38EE90;
  v82[1] = &off_38EE90;
  v81[2] = NSFilePosixPermissions;
  v82[2] = &off_38EEA8;
  uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v82,  v81,  3LL));
  uint64_t v9 = (void *)v8;
  if (!v5)
  {
    CFNumberRef v70 = (void *)v8;
    uint64_t v12 = v4;
    unsigned int v13 = @"graftPath is nil";
LABEL_7:
    uint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v13));
    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v15 setObject:v14 forKeyedSubscript:NSDebugDescriptionErrorKey];
    [v15 setObject:0 forKeyedSubscript:NSUnderlyingErrorKey];
    id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  100LL,  v15));

    BOOL v11 = 0;
LABEL_8:

    goto LABEL_9;
  }

  if (!v6)
  {
    CFNumberRef v70 = (void *)v8;
    uint64_t v12 = v4;
    unsigned int v13 = @"cryptexPath is nil";
    goto LABEL_7;
  }

  if (-[SecureMobileAssetBundle isGraftedPath:](self, "isGraftedPath:", v5))
  {
    id v10 = 0LL;
    BOOL v11 = 1;
    goto LABEL_13;
  }

  CFNumberRef v70 = v9;
  uint64_t v12 = v4;
  id v68 = v7;
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v25 = [v24 fileExistsAtPath:v5 isDirectory:&v75];

  if ((v25 & 1) == 0)
  {
    id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v73 = 0LL;
    unsigned __int8 v27 = [v26 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:v70 error:&v73];
    id v10 = v73;

    if ((v27 & 1) != 0) {
      goto LABEL_18;
    }
    goto LABEL_31;
  }

  if (v75)
  {
    id v10 = 0LL;
    goto LABEL_18;
  }

  int v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v72 = 0LL;
  unsigned int v66 = [v46 removeItemAtPath:v5 error:&v72];
  id v10 = v72;

  if (!v66)
  {
LABEL_31:
    BOOL v11 = 0;
    goto LABEL_32;
  }

  int v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v71 = v10;
  unsigned int v48 = [v47 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:v70 error:&v71];
  id v67 = v71;

  if (v48)
  {
    id v10 = v67;
LABEL_18:
    id v28 = v5;
    if (lstat((const char *)[v28 fileSystemRepresentation], &v74))
    {
      id v29 = v28;
      id v30 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"Could not lstat %s", [v29 fileSystemRepresentation]));
      id v31 = [v30 UTF8String];
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[SecureMobileAssetBundle graft:]",  @"[SMA] %s",  v32,  v33,  v34,  v35,  (uint64_t)v31);

      uint64_t v36 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  *__error(),  0LL);
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(v36);

      v79[0] = NSDebugDescriptionErrorKey;
      v79[1] = NSUnderlyingErrorKey;
      v80[0] = @"lstat failed";
      v80[1] = v37;
      v79[2] = @"graftPath";
      v80[2] = v29;
      uint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v80,  v79,  3LL));
      id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  10504LL,  v14));

      BOOL v11 = 0;
LABEL_40:
      id v7 = v68;
      goto LABEL_8;
    }

    id v65 = v28;
    if (!-[SecureMobileAssetBundle isPersonalized:](self, "isPersonalized:", &v76))
    {
      if (v76 >= 4) {
        uint64_t v49 = 105LL;
      }
      else {
        uint64_t v49 = v76 + 10500;
      }
      v77[0] = NSDebugDescriptionErrorKey;
      if (v76 > 3) {
        uint64_t v14 = @"cannot graft an unpersonalized cryptex";
      }
      else {
        uint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue( [@"cannot graft an unpersonalized cryptex" stringByAppendingFormat:@" (%@)", off_34EBC8[v76]]);
      }
      v78[0] = v14;
      v78[1] = v6;
      v77[1] = @"cryptexPath";
      v77[2] = @"graftPath";
      v78[2] = v65;
      id v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v78,  v77,  3LL));
      uint64_t v51 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  v49,  v50));

      BOOL v11 = 0;
      id v10 = (id)v51;
      goto LABEL_40;
    }

    id v38 = objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle cryptexPath](self, "cryptexPath"));
    uint64_t v39 = open((const char *)[v38 fileSystemRepresentation], 0);

    if ((v39 & 0x80000000) != 0)
    {
      id v45 = v12;
      [v12 setObject:@"open()" forKeyedSubscript:@"syscall"];
      uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle cryptexPath](self, "cryptexPath"));
      [v12 setObject:v52 forKeyedSubscript:@"path"];
    }

    else
    {
      id v40 = v68;
      int v41 = open((const char *)[v40 fileSystemRepresentation], 0);
      if (v41 < 0)
      {
        [v12 setObject:@"open()" forKeyedSubscript:@"syscall"];
        [v12 setObject:v40 forKeyedSubscript:@"path"];
        close(v39);
        id v45 = v12;
      }

      else
      {
        int v64 = v41;
        id v42 = objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle rootHashPath](self, "rootHashPath"));
        int v43 = open((const char *)[v42 fileSystemRepresentation], 0);

        if (v43 < 0)
        {
          int v53 = v39;
          id v45 = v12;
          [v12 setObject:@"open()" forKeyedSubscript:@"syscall"];
          uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle rootHashPath](self, "rootHashPath"));
          [v12 setObject:v54 forKeyedSubscript:@"path"];

          close(v64);
          close(v53);
        }

        else
        {
          DWORD2(v83) = v64;
          int v84 = v43;
          *(void *)&__int128 v85 = 16LL;
          id v44 = v65;
          if (!graftdmg( v39,  [v44 fileSystemRepresentation],  -[SecureMobileAssetBundle graftdmgType](self, "graftdmgType"),  &v83))
          {
            close(v43);
            close(v64);
            close(v39);
            uint64_t v14 = (__CFString *) objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Successfully grafted %@ onto %@", v6, v44));
            id v59 = -[__CFString UTF8String](v14, "UTF8String");
            _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle graft:]",  @"[SMA] %s",  v60,  v61,  v62,  v63,  (uint64_t)v59);
            BOOL v11 = 1;
            goto LABEL_40;
          }

          [v12 setObject:@"graftdmg()" forKeyedSubscript:@"syscall"];
          if ((v85 & 0x10) != 0) {
            [v12 setObject:@"SBC_STRICT_AUTH" forKeyedSubscript:@"sbc_flags"];
          }
          close(v43);
          close(v64);
          close(v39);
          id v45 = v12;
        }
      }
    }

    uint64_t v55 = *__error();
    if ([v45 count]) {
      uint64_t v56 = v45;
    }
    else {
      uint64_t v56 = 0LL;
    }
    uint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v55,  v56));

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v12 setObject:@"graft failed" forKeyedSubscript:NSDebugDescriptionErrorKey];
    [v12 setObject:v14 forKeyedSubscript:NSUnderlyingErrorKey];
    [v12 setObject:v68 forKeyedSubscript:@"ticketPath"];
    id v57 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle cryptexPath](self, "cryptexPath"));
    [v12 setObject:v57 forKeyedSubscript:@"cryptexPath"];

    id v58 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle rootHashPath](self, "rootHashPath"));
    [v12 setObject:v58 forKeyedSubscript:@"rootHashPath"];

    [v12 setObject:v65 forKeyedSubscript:@"graftPath"];
    id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  105LL,  v12));
    BOOL v11 = 0;
    id v7 = v68;
    goto LABEL_8;
  }

  BOOL v11 = 0;
  id v10 = v67;
LABEL_32:
  id v7 = v68;
LABEL_9:
  uint64_t v4 = v12;
  uint64_t v9 = v70;
  if (v10)
  {
    id v16 = v7;
    id v17 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Failed to graft: %@", v10));
    id v18 = [v17 UTF8String];
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[SecureMobileAssetBundle graft:]",  @"[SMA] %s",  v19,  v20,  v21,  v22,  (uint64_t)v18);

    if (a3)
    {
      id v10 = v10;
      *a3 = v10;
    }

    id v7 = v16;
  }

- (BOOL)ungraft:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle graftPath](self, "graftPath"));
  if (v6)
  {
    if (-[SecureMobileAssetBundle isGraftedPath:](self, "isGraftedPath:", v6))
    {
      id v7 = v6;
      if (ungraftdmg([v7 fileSystemRepresentation], 0))
      {
        id v8 = v7;
        id v9 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"Could not ungraft %s", [v8 fileSystemRepresentation]));
        id v10 = [v9 UTF8String];
        _MobileAssetLog( 0LL,  3,  (uint64_t)"-[SecureMobileAssetBundle ungraft:]",  @"[SMA] %s",  v11,  v12,  v13,  v14,  (uint64_t)v10);

        [v5 setObject:@"ungraftdmg()" forKeyedSubscript:@"syscall"];
        uint64_t v15 = *__error();
        if ([v5 count]) {
          id v16 = v5;
        }
        else {
          id v16 = 0LL;
        }
        id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v15,  v16));
        v36[0] = NSDebugDescriptionErrorKey;
        v36[1] = NSUnderlyingErrorKey;
        v37[0] = @"ungraft failed";
        v37[1] = v17;
        v36[2] = @"graftPath";
        v37[2] = v8;
        id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v37,  v36,  3LL));
        id v19 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  106LL,  v18));

        if (!v19) {
          goto LABEL_12;
        }
        goto LABEL_10;
      }

      id v29 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Successfully ungrafted %@ from the file system using %@", v7, @"ungraftdmg()"));
      id v30 = [v29 UTF8String];
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle ungraft:]",  @"[SMA] %s",  v31,  v32,  v33,  v34,  (uint64_t)v30);
    }

    id v19 = 0LL;
    BOOL v28 = 1;
    goto LABEL_15;
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"graftPath is nil"));
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v21 setObject:v20 forKeyedSubscript:NSDebugDescriptionErrorKey];
  [v21 setObject:0 forKeyedSubscript:NSUnderlyingErrorKey];
  id v19 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  100LL,  v21));

  if (!v19)
  {
LABEL_12:
    BOOL v28 = 0;
    goto LABEL_15;
  }

- (BOOL)isMounted
{
  id v2 = objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle graftPath](self, "graftPath"));
  BOOL v3 = realpath_DARWIN_EXTSN((const char *)[v2 fileSystemRepresentation], 0);
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v3));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByDeletingLastPathComponent]);
    id v7 = v5;
    BOOL v8 = !stat((const char *)[v7 fileSystemRepresentation], &v11)
    free(v4);
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)attach:(id)a3 error:(id *)a4
{
  kern_return_t v15;
  kern_return_t v16;
  CFStringRef v17;
  __CFString *v18;
  NSString *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  kern_return_t v30;
  kern_return_t v31;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  BOOL v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  void *v51;
  void *v52;
  int outputStruct;
  size_t outputStructCnt;
  io_connect_t connect[2];
  __int128 inputStruct;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  int v72;
  int v73;
  void v74[10];
  uint64_t v75;
  outputStructCnt = 0LL;
  *(void *)connect = 0LL;
  CFNumberRef v70 = 0u;
  id v71 = 0u;
  id v68 = 0u;
  CFNumberRef v69 = 0u;
  unsigned int v66 = 0u;
  id v67 = 0u;
  int v64 = 0u;
  id v65 = 0u;
  uint64_t v63 = 0u;
  uint64_t v61 = 0u;
  uint64_t v62 = 0u;
  id v59 = 0u;
  uint64_t v60 = 0u;
  id v57 = 0u;
  id v58 = 0u;
  inputStruct = 0u;
  LODWORD(v5) = -1;
  outputStruct = 0;
  id v50 = a3;
  if (v50)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);

      if (v52)
      {
        [v6 setObject:v52 forKeyedSubscript:@"hdik-unique-identifier"];
        id v8 = v50;
        uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( NSData,  "dataWithBytes:length:",  [v8 UTF8String],  objc_msgSend(v8, "length")));
        if (v51)
        {
          [v6 setObject:v51 forKeyedSubscript:@"image-path"];
          id v9 = v8;
          uint64_t v5 = open((const char *)[v9 fileSystemRepresentation], 0);
          if ((v5 & 0x80000000) != 0)
          {
            Data = 0LL;
            id v19 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to open %@: %{errno}d",  v9,  *__error());
            id v18 = (__CFString *)objc_claimAutoreleasedReturnValue(v19);
            io_object_t v14 = 0;
          }

          else
          {
            stat v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v5));
            [v6 setObject:v10 forKeyedSubscript:@"image-fd"];

            Data = CFPropertyListCreateData(kCFAllocatorDefault, v6, kCFPropertyListXMLFormat_v1_0, 0LL, 0LL);
            if (Data)
            {
              uint64_t v12 = IOServiceMatching("IOHDIXController");
              io_connect_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v12);
              io_object_t v14 = MatchingService;
              connect[1] = MatchingService;
              if (MatchingService)
              {
                uint64_t v15 = IOServiceOpen(MatchingService, mach_task_self_, 0, connect);
                LOWORD(v16) = v15;
                if (v15)
                {
                  id v17 = @"Failed to open disk image kernel extension: 0x%04x";
                }

                else
                {
                  *(void *)&inputStruct = 0x1BEEFFEEDLL;
                  *((void *)&inputStruct + 1) = CFDataGetBytePtr(Data);
                  *(void *)&id v57 = CFDataGetLength(Data);
                  outputStructCnt = 4LL;
                  id v16 = IOConnectCallStructMethod( connect[0],  0,  &inputStruct,  0x100uLL,  &outputStruct,  &outputStructCnt);
                  if (!v16)
                  {
                    uint64_t v33 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Successfully attached %@ with ID: %@", v9, v52));
                    uint64_t v34 = [v33 UTF8String];
                    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle attach:error:]",  @"[SMA] %s",  v35,  v36,  v37,  v38,  (uint64_t)v34);

                    id v29 = v52;
                    id v18 = 0LL;
                    uint64_t v52 = v29;
LABEL_23:
                    if (close(v5) == -1)
                    {
                      char v75 = 0LL;
                      memset(v74, 0, sizeof(v74));
                      uint64_t v39 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
                      id v40 = *__error();
                      if (v39) {
                        int v41 = 3LL;
                      }
                      else {
                        int v41 = 2LL;
                      }
                      id v72 = 67109120;
                      id v73 = v40;
                      id v42 = _os_log_send_and_compose_impl(v41, &v75, v74, 80LL, &dword_0, &_os_log_default, 16LL);
                      int v43 = _os_crash_msg(v75, v42);
                      -[SecureMobileAssetBundle attach:error:].cold.1(v43);
                    }

                    goto LABEL_24;
                  }

                  id v17 = @"Failed to attach disk image: 0x%04x";
                }

                id v18 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  v17,  v16 & 0x3FFF));
              }

              else
              {
                id v18 = @"Failed to connect to disk image kernel extension.";
              }
            }

            else
            {
              io_object_t v14 = 0;
              id v18 = @"Failed to create dictionary with data.";
            }
          }
        }

        else
        {
          io_object_t v14 = 0;
          Data = 0LL;
          uint64_t v51 = 0LL;
          LODWORD(v5) = -1;
          id v18 = @"Failed to create data.";
        }
      }

      else
      {
        io_object_t v14 = 0;
        Data = 0LL;
        uint64_t v51 = 0LL;
        uint64_t v52 = 0LL;
        id v18 = @"Failed to create UUID string.";
      }
    }

    else
    {
      io_object_t v14 = 0;
      Data = 0LL;
      uint64_t v51 = 0LL;
      uint64_t v52 = 0LL;
      id v18 = @"Failed to create dictionary.";
    }
  }

  else
  {
    io_object_t v14 = 0;
    Data = 0LL;
    id v6 = 0LL;
    uint64_t v51 = 0LL;
    uint64_t v52 = 0LL;
    id v18 = @"Invalid input.";
  }

  uint64_t v20 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v18));
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v21 setObject:v20 forKeyedSubscript:NSDebugDescriptionErrorKey];
  [v21 setObject:0 forKeyedSubscript:NSUnderlyingErrorKey];
  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  112LL,  v21));

  id v23 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Failed to attach cryptex disk image: %@", v22));
  uint64_t v24 = [v23 UTF8String];
  _MobileAssetLog( 0LL,  3,  (uint64_t)"-[SecureMobileAssetBundle attach:error:]",  @"[SMA] %s",  v25,  v26,  v27,  v28,  (uint64_t)v24);

  if (a4) {
    *a4 = v22;
  }

  id v29 = 0LL;
  if ((_DWORD)v5 != -1) {
    goto LABEL_23;
  }
LABEL_24:
  if (connect[0])
  {
    id v30 = IOServiceClose(connect[0]);
    if (v30)
    {
      v74[0] = 0LL;
      id v59 = 0u;
      uint64_t v60 = 0u;
      id v57 = 0u;
      id v58 = 0u;
      inputStruct = 0u;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        id v44 = 3LL;
      }
      else {
        id v44 = 2LL;
      }
      LODWORD(v75) = 67109120;
      HIDWORD(v75) = v30;
      id v45 = _os_log_send_and_compose_impl(v44, v74, &inputStruct, 80LL, &dword_0, &_os_log_default, 16LL);
      int v46 = _os_crash_msg(v74[0], v45);
      -[SecureMobileAssetBundle attach:error:].cold.1(v46);
    }
  }

  if (v14)
  {
    uint64_t v31 = IOObjectRelease(v14);
    if (v31)
    {
      v74[0] = 0LL;
      id v59 = 0u;
      uint64_t v60 = 0u;
      id v57 = 0u;
      id v58 = 0u;
      inputStruct = 0u;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        int v47 = 3LL;
      }
      else {
        int v47 = 2LL;
      }
      LODWORD(v75) = 67109120;
      HIDWORD(v75) = v31;
      unsigned int v48 = _os_log_send_and_compose_impl(v47, v74, &inputStruct, 80LL, &dword_0, &_os_log_default, 16LL);
      uint64_t v49 = _os_crash_msg(v74[0], v48);
      -[SecureMobileAssetBundle attach:error:].cold.1(v49);
    }
  }

  if (Data) {
    CFRelease(Data);
  }

  return v29;
}

- (id)devnodesForDiskImageID:(id)a3 error:(id *)a4
{
  kern_return_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  io_registry_entry_t v13;
  CFTypeRef v14;
  void *CFProperty;
  NSString *v16;
  void *v17;
  BOOLean_t v18;
  void *v19;
  BOOLean_t v20;
  BOOLean_t v21;
  BOOLean_t v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  kern_return_t ParentEntry;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  NSString *v36;
  void *v37;
  kern_return_t v38;
  id v39;
  void *v40;
  id v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  IONotificationPort *notify;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  io_object_t v55;
  io_iterator_t notification;
  io_object_t object;
  uint64_t v58;
  NSErrorUserInfoKey v59;
  void *v60;
  NSErrorUserInfoKey v61;
  void *v62;
  int v63;
  kern_return_t v64;
  io_registry_entry_t parent[4];
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint64_t v52 = a3;
  uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  int v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  notification = 0;
  IONotificationPortRef v4 = IONotificationPortCreate(0);
  if (!v4)
  {
    stat v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"failed to get notification port"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v12 setObject:v11 forKeyedSubscript:NSDebugDescriptionErrorKey];
    [v12 setObject:0 forKeyedSubscript:NSUnderlyingErrorKey];
    unsigned int v48 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  -4LL,  v12));

    stat v10 = 0LL;
    goto LABEL_45;
  }

  uint64_t v5 = v4;
  id v6 = IOServiceMatching("IOMedia");
  notify = v5;
  id v7 = IOServiceAddMatchingNotification(v5, "IOServiceMatched", v6, 0LL, 0LL, &notification);
  if (v7)
  {
    id v59 = NSDebugDescriptionErrorKey;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"IOServiceAddMatchingNotification() failed: 0x%04x",  v7 & 0x3FFF));
    uint64_t v60 = v8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v60,  &v59,  1LL));
    unsigned int v48 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IOKitErrorDomain",  v7,  v9));

    goto LABEL_4;
  }

  uint64_t v13 = IOIteratorNext(notification);
  if (v13)
  {
    unsigned int v48 = 0LL;
    stat v10 = 0LL;
    while (1)
    {
      uint64_t v55 = v13;
      io_object_t v14 = IORegistryEntrySearchCFProperty(v13, "IOService", @"hdik-unique-identifier", 0LL, 3u);
      if (v14)
      {
      }

      uint64_t v24 = 0LL;
LABEL_40:

      if (v14) {
        CFRelease(v14);
      }
      if (IOObjectRelease(v55)) {
        -[SecureMobileAssetBundle devnodesForDiskImageID:error:].cold.1(&v58, parent);
      }
      uint64_t v13 = IOIteratorNext(notification);
      if (!v13) {
        goto LABEL_44;
      }
    }

    CFProperty = (void *)IORegistryEntryCreateCFProperty(v13, @"BSD Name", kCFAllocatorDefault, 0);
    id v16 = NSStringFromCFType(CFProperty);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    id v18 = IOObjectConformsTo(v13, "AppleAPFSVolume");
    id v19 = v53;
    if ((v18
       || (v20 = IOObjectConformsTo(v13, "AppleAPFSMedia"), id v19 = v51, v20)
       || (v21 = IOObjectConformsTo(v13, "AppleAPFSContainer"), id v19 = v50, v21)
       || (v22 = IOObjectConformsTo(v13, "AppleAPFSContainerScheme"), id v19 = v49, v22))
      && (id v23 = v19) != 0LL)
    {
      uint64_t v24 = v23;
      if (!v17) {
        goto LABEL_38;
      }
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([@"/dev/" stringByAppendingPathComponent:v17]);
      [v24 addObject:v25];
    }

    else
    {
      if (v10)
      {
        uint64_t v24 = 0LL;
        goto LABEL_38;
      }

      object = 0;
      IOObjectRetain(v13);
      uint64_t v26 = 0LL;
      object = v13;
      while (1)
      {
        uint64_t v27 = (void *)IORegistryEntryCreateCFProperty(v13, @"Whole", kCFAllocatorDefault, 0);
        BOOL v28 = objc_opt_class(&OBJC_CLASS___NSNumber);
        if ((objc_opt_isKindOfClass(v27, v28) & 1) != 0)
        {
        }

        parent[0] = 0;
        ParentEntry = IORegistryEntryGetParentEntry(v13, "IOService", parent);
        IOObjectRelease(v13);
        uint64_t v13 = parent[0];
        object = parent[0];
        if (ParentEntry)
        {
          uint64_t v61 = NSDebugDescriptionErrorKey;
          id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"IORegistryEntryGetParentEntry() failed: 0x%04x",  ParentEntry & 0x3FFF));
          uint64_t v62 = v30;
          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v62,  &v61,  1LL));
          uint64_t v32 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IOKitErrorDomain",  ParentEntry,  v31));

          uint64_t v13 = object;
          uint64_t v26 = (id)v32;
        }

        if (!v13)
        {
          uint64_t v33 = 0LL;
LABEL_27:
          uint64_t v26 = v26;
          uint64_t v34 = v26;
          goto LABEL_34;
        }
      }

      uint64_t v35 = (void *)IORegistryEntryCreateCFProperty(v13, @"BSD Name", kCFAllocatorDefault, 0);
      uint64_t v36 = NSStringFromCFType(v35);
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      if (v37) {
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([@"/dev/" stringByAppendingPathComponent:v37]);
      }
      else {
        uint64_t v33 = 0LL;
      }

      if (v35) {
        CFRelease(v35);
      }

      uint64_t v34 = v48;
      if (!v37) {
        goto LABEL_27;
      }
LABEL_34:
      stat v10 = v33;
      if (object)
      {
        id v38 = IOObjectRelease(object);
        if (v38)
        {
          id v58 = 0LL;
          CFNumberRef v69 = 0u;
          id v67 = 0u;
          id v68 = 0u;
          *(_OWORD *)parent = 0u;
          unsigned int v66 = 0u;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            int v43 = 3LL;
          }
          else {
            int v43 = 2LL;
          }
          uint64_t v63 = 67109120;
          int v64 = v38;
          id v44 = _os_log_send_and_compose_impl(v43, &v58, parent, 80LL, &dword_0, &_os_log_default, 16LL);
          id v45 = _os_crash_msg(v58, v44);
          -[SecureMobileAssetBundle attach:error:].cold.1(v45);
        }
      }

      uint64_t v24 = 0LL;
      uint64_t v25 = v48;
      unsigned int v48 = v34;
    }

LABEL_38:
    if (CFProperty) {
      CFRelease(CFProperty);
    }
    goto LABEL_40;
  }

  unsigned int v48 = 0LL;
LABEL_4:
  stat v10 = 0LL;
LABEL_44:
  IONotificationPortDestroy(notify);
LABEL_45:
  if ([v53 count]) {
    [v54 setObject:v53 forKeyedSubscript:@"volumes"];
  }
  if ([v51 count]) {
    [v54 setObject:v51 forKeyedSubscript:@"media"];
  }
  if ([v50 count]) {
    [v54 setObject:v50 forKeyedSubscript:@"containers"];
  }
  if ([v49 count]) {
    [v54 setObject:v49 forKeyedSubscript:@"schemes"];
  }
  [v54 setObject:v10 forKeyedSubscript:@"wholeDisk"];
  if (a4) {
    *a4 = v48;
  }
  uint64_t v39 = [v54 count];
  id v40 = v54;
  if (!v39) {
    id v40 = 0LL;
  }
  int v41 = v40;

  return v41;
}

- (BOOL)mount:(id *)a3
{
  IONotificationPortRef v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  unint64_t v106 = -1LL;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle graftPath](self, "graftPath"));
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle cryptexPath](self, "cryptexPath"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle ticketPath](self, "ticketPath"));
  __int128 v94 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle rootHashPath](self, "rootHashPath"));
  char v105 = 0;
  __int128 v127 = 0u;
  memset(v128, 0, 60);
  __int128 v125 = 0u;
  __int128 v126 = 0u;
  __int128 v123 = 0u;
  __int128 v124 = 0u;
  __int128 v121 = 0u;
  __int128 v122 = 0u;
  __int128 v119 = 0u;
  __int128 v120 = 0u;
  __int128 v117 = 0u;
  __int128 v118 = 0u;
  __int128 v115 = 0u;
  __int128 v116 = 0u;
  __int128 v113 = 0u;
  __int128 v114 = 0u;
  __int128 v111 = 0u;
  __int128 v112 = 0u;
  v109[0] = NSFileOwnerAccountID;
  v109[1] = NSFileGroupOwnerAccountID;
  v110[0] = &off_38EE90;
  v110[1] = &off_38EE90;
  v109[2] = NSFilePosixPermissions;
  v110[2] = &off_38EEA8;
  uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v110,  v109,  3LL));
  __int128 v95 = (void *)v8;
  if (!v5)
  {
    __int128 v89 = v7;
    __int128 v91 = v4;
    id v92 = v6;
    id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"mountPath is nil"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v19 setObject:v16 forKeyedSubscript:NSDebugDescriptionErrorKey];
    [v19 setObject:0 forKeyedSubscript:NSUnderlyingErrorKey];
    id v20 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  100LL,  v19));

    __int128 v87 = 0LL;
    __int128 v88 = 0LL;
    __int128 v90 = 0LL;
    id v21 = 0LL;
    id v22 = 0LL;
    id v23 = 0LL;
    id v10 = 0LL;
    id v6 = 0LL;
    goto LABEL_25;
  }

  if (!v6)
  {
    __int128 v89 = v7;
    __int128 v91 = v4;
    id v92 = 0LL;
    id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"cryptexPath is nil"));
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v24 setObject:v16 forKeyedSubscript:NSDebugDescriptionErrorKey];
    [v24 setObject:0 forKeyedSubscript:NSUnderlyingErrorKey];
    id v20 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  100LL,  v24));

LABEL_23:
    __int128 v87 = 0LL;
    __int128 v88 = 0LL;
    __int128 v90 = 0LL;
    id v21 = 0LL;
    id v22 = 0LL;
LABEL_24:
    id v23 = 0LL;
    id v10 = 0LL;
    goto LABEL_25;
  }

  uint64_t v9 = v8;
  if (!-[SecureMobileAssetBundle isMounted](self, "isMounted"))
  {
    __int128 v89 = v7;
    if (-[SecureMobileAssetBundle isPersonalized:](self, "isPersonalized:", &v106))
    {
      uint64_t v25 = 0LL;
    }

    else
    {
      if (v106 >= 4) {
        uint64_t v26 = 107LL;
      }
      else {
        uint64_t v26 = v106 + 10700;
      }
      v107[0] = NSDebugDescriptionErrorKey;
      if (v106 > 3) {
        uint64_t v27 = @"cannot mount an unpersonalized cryptex";
      }
      else {
        uint64_t v27 = (__CFString *)objc_claimAutoreleasedReturnValue( [@"cannot mount an unpersonalized cryptex" stringByAppendingFormat:@" (%@)", off_34EBC8[v106]]);
      }
      v108[0] = v27;
      v108[1] = v6;
      v107[1] = @"cryptexPath";
      v107[2] = @"mountPath";
      v108[2] = v5;
      BOOL v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v108,  v107,  3LL));
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  v26,  v28));
    }

    id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned __int8 v30 = [v29 fileExistsAtPath:v5 isDirectory:&v105];

    __int128 v91 = v4;
    id v92 = v6;
    if ((v30 & 1) != 0)
    {
      if (v105)
      {
        id v16 = v25;
LABEL_20:
        id v33 = v5;
        if (lstat((const char *)[v33 fileSystemRepresentation], &v104))
        {
          id v34 = v33;
          id v35 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"Could not lstat %s", [v34 fileSystemRepresentation]));
          id v36 = [v35 UTF8String];
          _MobileAssetLog( 0LL,  3,  (uint64_t)"-[SecureMobileAssetBundle mount:]",  @"[SMA] %s",  v37,  v38,  v39,  v40,  (uint64_t)v36);

          int v41 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  *__error(),  0LL);
          id v6 = (id)objc_claimAutoreleasedReturnValue(v41);
          [v4 setObject:@"lstat() failed" forKeyedSubscript:NSDebugDescriptionErrorKey];
          [v4 setObject:v6 forKeyedSubscript:NSUnderlyingErrorKey];
          [v4 setObject:v34 forKeyedSubscript:@"mountPath"];
          uint64_t v42 = 10704LL;
LABEL_22:
          id v20 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  v42,  v4));
          goto LABEL_23;
        }

        id v100 = 0LL;
        uint64_t v60 = objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle attach:error:](self, "attach:error:", v6, &v100));
        id v61 = v100;
        id v62 = v6;
        id v6 = v61;
        if (!v60)
        {
          [v4 setObject:@"Failed to attach disk image" forKeyedSubscript:NSDebugDescriptionErrorKey];
          [v4 setObject:v6 forKeyedSubscript:NSUnderlyingErrorKey];
          [v4 setObject:v62 forKeyedSubscript:@"cryptexPath"];
          uint64_t v42 = 10705LL;
          goto LABEL_22;
        }

        id v85 = v33;
        id v99 = v61;
        uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue( -[SecureMobileAssetBundle devnodesForDiskImageID:error:]( self,  "devnodesForDiskImageID:error:",  v60,  &v99));
        id v86 = v99;

        id v22 = (void *)objc_claimAutoreleasedReturnValue([v63 objectForKeyedSubscript:@"wholeDisk"]);
        int v64 = (void *)objc_claimAutoreleasedReturnValue([v63 objectForKeyedSubscript:@"volumes"]);
        id v65 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"\ndevnodes=%@", v63));
        id v66 = [v65 UTF8String];
        _MobileAssetLog( 0LL,  7,  (uint64_t)"-[SecureMobileAssetBundle mount:]",  @"[SMA] %s",  v67,  v68,  v69,  v70,  (uint64_t)v66);

        __int128 v90 = v63;
        __int128 v87 = v64;
        __int128 v88 = (void *)v60;
        if (!v63)
        {
          [v4 setObject:@"Failed to find devnodes for attached disk image" forKeyedSubscript:NSDebugDescriptionErrorKey];
          id v6 = v86;
          [v4 setObject:v86 forKeyedSubscript:NSUnderlyingErrorKey];
          [v4 setObject:v92 forKeyedSubscript:@"cryptexPath"];
          id v20 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  10706LL,  v4));
          __int128 v90 = 0LL;
          id v21 = 0LL;
          goto LABEL_24;
        }

        if ([v64 count])
        {
          if ((unint64_t)[v64 count] < 2)
          {
            id v21 = objc_claimAutoreleasedReturnValue([v64 objectAtIndexedSubscript:0]);
            *(void *)&__int128 v111 = [v21 fileSystemRepresentation];
            DWORD1(v128[3]) = getuid();
            DWORD2(v128[3]) = getgid();
            LOWORD(v112) = 8;
            DWORD2(v111) = 1048577;
            id v98 = v86;
            id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v89,  0LL,  &v98));
            id v6 = v98;

            if (v10)
            {
              id v97 = v6;
              unint64_t v76 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v94,  0LL,  &v97));
              id v17 = v97;

              LOWORD(v112) = 8;
              *(void *)((char *)&v128[2] + 12) = 0x867746776LL;
              id v10 = v10;
              *(void *)((char *)&v128[1] + 12) = [v10 bytes];
              *(void *)((char *)&v128[2] + 4) = [v10 length];
              id v23 = v76;
              *(void *)((char *)v128 + 12) = [v23 bytes];
              *(void *)((char *)&v128[1] + 4) = [v23 length];
              id v77 = v85;
              if (!mount("apfs", (const char *)[v77 fileSystemRepresentation], 1048577, &v111))
              {
                id v79 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Successfully mounted cryptex volume %@ at %@", v21, v77));
                id v80 = [v79 UTF8String];
                _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle mount:]",  @"[SMA] %s",  v81,  v82,  v83,  v84,  (uint64_t)v80);

                BOOL v18 = 1;
LABEL_35:
                IONotificationPortRef v4 = v91;
                id v6 = v92;
                id v7 = v89;
                goto LABEL_36;
              }

              uint64_t v78 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  *__error(),  0LL);
              id v6 = (id)objc_claimAutoreleasedReturnValue(v78);

              [v91 setObject:@"mount() failed" forKeyedSubscript:NSDebugDescriptionErrorKey];
              [v91 setObject:v6 forKeyedSubscript:NSUnderlyingErrorKey];
              [v91 setObject:v92 forKeyedSubscript:@"cryptexPath"];
              [v91 setObject:v77 forKeyedSubscript:@"mountPath"];
              [v91 setObject:v21 forKeyedSubscript:@"volumeDevNode"];
              id v20 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  107LL,  v91));
            }

            else
            {
              [v4 setObject:@"Failed to load im4m for cryptex" forKeyedSubscript:NSDebugDescriptionErrorKey];
              [v4 setObject:v6 forKeyedSubscript:NSUnderlyingErrorKey];
              [v4 setObject:v92 forKeyedSubscript:@"cryptexPath"];
              [v4 setObject:v89 forKeyedSubscript:@"ticketPath"];
              id v20 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  10709LL,  v4));
              id v23 = 0LL;
            }

            goto LABEL_25;
          }

          [v4 setObject:@"Found more than one APFS volume in attached disk image" forKeyedSubscript:NSDebugDescriptionErrorKey];
          [v4 setObject:v86 forKeyedSubscript:NSUnderlyingErrorKey];
          [v4 setObject:v92 forKeyedSubscript:@"cryptexPath"];
          uint64_t v71 = 10708LL;
        }

        else
        {
          [v4 setObject:@"Failed to find APFS volume for attached disk image" forKeyedSubscript:NSDebugDescriptionErrorKey];
          [v4 setObject:v86 forKeyedSubscript:NSUnderlyingErrorKey];
          [v4 setObject:v92 forKeyedSubscript:@"cryptexPath"];
          uint64_t v71 = 10707LL;
        }

        id v20 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  v71,  v4));
        id v21 = 0LL;
        id v23 = 0LL;
        id v10 = 0LL;
        id v6 = v86;
LABEL_25:

        id v17 = v6;
LABEL_26:
        id v16 = v20;
        goto LABEL_27;
      }

      id v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v102 = v25;
      unsigned int v73 = [v72 removeItemAtPath:v5 error:&v102];
      id v16 = v102;

      if (v73)
      {
        stat v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        id v101 = v16;
        unsigned int v75 = [v74 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:v95 error:&v101];
        id v20 = v101;

        if (!v75)
        {
          __int128 v87 = 0LL;
          __int128 v88 = 0LL;
          __int128 v90 = 0LL;
          id v21 = 0LL;
          id v22 = 0LL;
          id v23 = 0LL;
          id v10 = 0LL;
          id v17 = 0LL;
          goto LABEL_26;
        }

        id v16 = v20;
        IONotificationPortRef v4 = v91;
        goto LABEL_20;
      }
    }

    else
    {
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v103 = v25;
      unsigned __int8 v32 = [v31 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:v9 error:&v103];
      id v16 = v103;

      if ((v32 & 1) != 0) {
        goto LABEL_20;
      }
    }

    __int128 v87 = 0LL;
    __int128 v88 = 0LL;
    __int128 v90 = 0LL;
    id v21 = 0LL;
    id v22 = 0LL;
    id v23 = 0LL;
    id v10 = 0LL;
    id v17 = 0LL;
LABEL_27:
    id v43 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Failed to attach and mount cryptex disk image: %@", v16));
    id v44 = [v43 UTF8String];
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[SecureMobileAssetBundle mount:]",  @"[SMA] %s",  v45,  v46,  v47,  v48,  (uint64_t)v44);

    id v96 = 0LL;
    BOOL v49 = eject(v21, &v96);
    id v50 = v96;
    if (v49)
    {
      if (!v22)
      {
LABEL_32:
        if (a3) {
          *a3 = v16;
        }

        BOOL v18 = 0;
        goto LABEL_35;
      }

      uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Ejected %@ after mount failure",  v22));
      int v52 = 6;
    }

    else
    {
      uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"WARNING: Failed to eject %@ after mount failure: %@",  v22,  v50));
      int v52 = 3;
    }

    id v53 = v51;
    id v54 = [v53 UTF8String];
    _MobileAssetLog( 0LL,  v52,  (uint64_t)"-[SecureMobileAssetBundle mount:]",  @"[SMA] %s",  v55,  v56,  v57,  v58,  (uint64_t)v54);

    goto LABEL_32;
  }

  id v10 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Crytex is already dmg mounted"));
  id v11 = [v10 UTF8String];
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle mount:]",  @"[SMA] %s",  v12,  v13,  v14,  v15,  (uint64_t)v11);
  id v16 = 0LL;
  id v17 = 0LL;
  BOOL v18 = 1;
LABEL_36:

  return v18;
}

- (BOOL)unmount:(id *)a3
{
  IONotificationPortRef v4 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle graftPath](self, "graftPath"));
  bzero(&v45, 0x878uLL);
  id v5 = v4;
  if (statfs((const char *)[v5 fileSystemRepresentation], &v45))
  {
    int v6 = *__error();
    uint64_t v7 = v6;
    v43[0] = NSDebugDescriptionErrorKey;
    uint64_t v8 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", strerror(v6));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v44[0] = v9;
    v44[1] = @"statfs";
    v43[1] = @"syscall";
    v43[2] = @"mountPath";
    v44[2] = v5;
    id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v44,  v43,  3LL));
    id v11 = (const __CFString *)NSPOSIXErrorDomain;
    uint64_t v12 = v7;
LABEL_5:
    id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v11,  v12,  v10));
    goto LABEL_6;
  }

  id v13 = v5;
  if (unmount((const char *)[v13 fileSystemRepresentation], 0))
  {
    uint64_t v14 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  *__error(),  0LL);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v41[0] = NSDebugDescriptionErrorKey;
    v41[1] = NSUnderlyingErrorKey;
    v42[0] = @"unmount failed";
    v42[1] = v9;
    void v41[2] = @"mountPath";
    v42[2] = v13;
    id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v42,  v41,  3LL));
    id v11 = @"SecureMobileAssetErrorDomain";
    uint64_t v12 = 108LL;
    goto LABEL_5;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v45.f_mntfromname));
  id v23 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Successfully unmounted cryptex volume %@ from %@", v9, v13));
  id v24 = [v23 UTF8String];
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle unmount:]",  @"[SMA] %s",  v25,  v26,  v27,  v28,  (uint64_t)v24);

  id v40 = 0LL;
  BOOL v29 = eject(v9, &v40);
  id v15 = v40;
  if (v29)
  {
    id v10 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Successfully ejected cryptex disk image previously mounted at %@", v13));
    id v38 = [v10 UTF8String];
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle unmount:]",  @"[SMA] %s",  v30,  v31,  v32,  v33,  (uint64_t)v38);
  }

  else
  {
    id v10 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Failed to eject cryptex disk image previously mounted at %@: %@", v13, v15));
    id v39 = [v10 UTF8String];
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[SecureMobileAssetBundle unmount:]",  @"[SMA] %s",  v34,  v35,  v36,  v37,  (uint64_t)v39);
  }

- (BOOL)graftOrMount:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle cryptexPath](self, "cryptexPath"));
  uint64_t v7 = self;
  objc_sync_enter(v7);
  if ((MABrainUtilityForceSecureAssetMount() & 1) != 0)
  {
    uint64_t v8 = 0LL;
    uint64_t v9 = 0LL;
    goto LABEL_16;
  }

  id v10 = v6;
  int v11 = open((const char *)[v10 fileSystemRepresentation], 0);
  int v12 = v11;
  int v44 = v11;
  if (v11 < 0)
  {
    uint64_t v21 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  *__error(),  0LL);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v21);
    [v5 setObject:@"Failed to open cryptex file" forKeyedSubscript:NSDebugDescriptionErrorKey];
    [v5 setObject:v9 forKeyedSubscript:NSUnderlyingErrorKey];
    [v5 setObject:v10 forKeyedSubscript:@"cryptexPath"];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  -4LL,  v5));
    if (v12 == -1)
    {
      unsigned __int8 v34 = 0;
LABEL_18:
      objc_sync_exit(v7);

      if (!a3) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }

    BOOL v14 = 0;
  }

  else
  {
    int v13 = ffsctl(v11, 0x20004A85uLL, 0LL, 0);
    BOOL v14 = v13 == 0;
    if (v13)
    {
      if (*__error() == 45)
      {
        id v15 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Cryptex at %@ is not graftable", v10));
        id v16 = [v15 UTF8String];
        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle graftOrMount:]",  @"[SMA] %s",  v17,  v18,  v19,  v20,  (uint64_t)v16);
      }

      else
      {
        uint64_t v27 = __error();
        uint64_t v28 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Could not determine whether cryptex at %@ is graftable: %s",  v10,  strerror(*v27));
        id v15 = objc_claimAutoreleasedReturnValue(v28);
        id v29 = [v15 UTF8String];
        _MobileAssetLog( 0LL,  3,  (uint64_t)"-[SecureMobileAssetBundle graftOrMount:]",  @"[SMA] %s",  v30,  v31,  v32,  v33,  (uint64_t)v29);
      }
    }

    else
    {
      id v15 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Cryptex at %@ is graftable", v10));
      id v22 = [v15 UTF8String];
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle graftOrMount:]",  @"[SMA] %s",  v23,  v24,  v25,  v26,  (uint64_t)v22);
    }

    uint64_t v8 = 0LL;
    uint64_t v9 = 0LL;
  }

  if (close(v12) == -1)
  {
    uint64_t v45 = 0LL;
    memset(v48, 0, sizeof(v48));
    BOOL v37 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    int v38 = *__error();
    if (v37) {
      uint64_t v39 = 3LL;
    }
    else {
      uint64_t v39 = 2LL;
    }
    int v46 = 67109120;
    int v47 = v38;
    uint64_t v40 = _os_log_send_and_compose_impl(v39, &v45, v48, 80LL, &dword_0, &_os_log_default, 16LL);
    uint64_t v41 = _os_crash_msg(v45, v40);
    -[SecureMobileAssetBundle attach:error:].cold.1(v41);
  }

  if ((v12 & 0x80000000) == 0)
  {
    if (v14)
    {
      id v43 = v8;
      unsigned __int8 v34 = -[SecureMobileAssetBundle graft:](v7, "graft:", &v43);
      id v35 = v43;

LABEL_17:
      uint64_t v8 = v35;
      goto LABEL_18;
    }

- (BOOL)ungraftOrUnmount:(id *)a3
{
  IONotificationPortRef v4 = self;
  objc_sync_enter(v4);
  if (-[SecureMobileAssetBundle isGrafted](v4, "isGrafted"))
  {
    uint64_t v11 = 0LL;
    id v5 = (id *)&v11;
    unsigned __int8 v6 = -[SecureMobileAssetBundle ungraft:](v4, "ungraft:", &v11);
  }

  else
  {
    if (!-[SecureMobileAssetBundle isMounted](v4, "isMounted"))
    {
      id v8 = 0LL;
      BOOL v7 = 1;
      goto LABEL_7;
    }

    uint64_t v10 = 0LL;
    id v5 = (id *)&v10;
    unsigned __int8 v6 = -[SecureMobileAssetBundle unmount:](v4, "unmount:", &v10);
  }

  BOOL v7 = v6;
  id v8 = *v5;
LABEL_7:
  objc_sync_exit(v4);

  if (a3 && v8) {
    *a3 = v8;
  }

  return v7;
}

- (BOOL)beginAccess:(int64_t)a3 error:(id *)a4
{
  uint64_t v7 = objc_opt_class(self);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_sync_enter(v8);
  LOBYTE(a4) = -[SecureMobileAssetBundle beginAccess_nowait:error:](self, "beginAccess_nowait:error:", a3, a4);
  objc_sync_exit(v8);

  return (char)a4;
}

- (BOOL)beginAccess_nowait:(int64_t)a3 error:(id *)a4
{
  char v5 = a3;
  id v74 = 0LL;
  unsigned int v7 = -[SecureMobileAssetBundle graftOrMount:](self, "graftOrMount:", &v74);
  id v8 = v74;
  if ((v5 & 2) != 0 && v7)
  {
    uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle assetType](self, "assetType"));
    uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle assetSpecifier](self, "assetSpecifier"));
    if (!-[SecureMobileAssetBundle isMappableToExclaves:](self, "isMappableToExclaves:", &v73))
    {
      v75[0] = NSDebugDescriptionErrorKey;
      v75[1] = @"assetType";
      uint64_t v17 = @"nil";
      if (v9) {
        uint64_t v18 = v9;
      }
      else {
        uint64_t v18 = @"nil";
      }
      v76[0] = @"Asset type+sepcifier is unsupported in Exclaves";
      v76[1] = v18;
      v75[2] = @"specifier";
      if (v10) {
        uint64_t v17 = v10;
      }
      v76[2] = v17;
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v76,  v75,  3LL));
      uint64_t v20 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  109LL,  v19));

      id v8 = (id)v20;
      goto LABEL_37;
    }

    unint64_t v72 = -1LL;
    if (!-[SecureMobileAssetBundle isPersonalized:](self, "isPersonalized:", &v72))
    {
      id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      if (v72 > 3) {
        uint64_t v21 = @"Cannot map an unpersonalized asset to Exclaves";
      }
      else {
        uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue( [@"Cannot map an unpersonalized asset to Exclaves" stringByAppendingFormat:@" (%@)", off_34EBC8[v72]]);
      }
      [v12 setObject:v21 forKeyedSubscript:NSDebugDescriptionErrorKey];

      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v73));
      [v12 setObject:v25 forKeyedSubscript:@"fstag"];

      if (v72 >= 4) {
        uint64_t v26 = 110LL;
      }
      else {
        uint64_t v26 = v72 + 11000;
      }
      id v13 = v8;
      id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  v26,  v12));
      goto LABEL_36;
    }

    id v70 = 0LL;
    id v71 = 0LL;
    BOOL MappedExclavePath = getMappedExclavePath(v73, &v71, &v70);
    id v12 = v71;
    id v13 = v70;
    if (MappedExclavePath)
    {
      if (v12)
      {
        BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle accessPath](self, "accessPath"));
        unsigned __int8 v15 = [v14 isEqualToString:v12];

        if ((v15 & 1) != 0)
        {
          id v16 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Matching registration found for Exclave mapped path [fstag=%d] %@:%@: %@",  v73,  v9,  v10,  v12);
          goto LABEL_34;
        }

        id v27 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Conflicting registration found for Exclave mapped path [fstag=%d] %@:%@: %@", v73, v9, v10, v12));
        id v28 = [v27 UTF8String];
        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle beginAccess_nowait:error:]",  @"[SMA] %s",  v29,  v30,  v31,  v32,  (uint64_t)v28);

        id v66 = v12;
        id v69 = v13;
        int v33 = unregisterMappedExclavePath((const char *)[v66 fileSystemRepresentation], &v69);
        id v34 = v69;

        if (v33)
        {
          v79[0] = NSUnderlyingErrorKey;
          v79[1] = NSDebugDescriptionErrorKey;
          v80[1] = @"Unable to unregister existing asset path for fstag";
          v80[2] = v66;
          v79[2] = @"path";
          void v79[3] = @"assetType";
          id v35 = @"nil";
          if (v9) {
            id v35 = v9;
          }
          void v80[3] = v35;
          v79[4] = @"fstag";
          v80[0] = v34;
          uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v73));
          v80[4] = v36;
          BOOL v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v80,  v79,  5LL));
          uint64_t v24 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  11005LL,  v37));

          id v13 = v34;
          id v12 = v66;
          goto LABEL_18;
        }

        id v13 = v34;
      }

      id v38 = objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle accessPath](self, "accessPath"));
      uint64_t v39 = (const char *)[v38 fileSystemRepresentation];

      unsigned int v68 = v73;
      if (fsctl(v39, 0x80044119uLL, &v68, 0))
      {
        uint64_t v40 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  *__error(),  0LL);
        uint64_t v67 = objc_claimAutoreleasedReturnValue(v40);
        v77[0] = NSUnderlyingErrorKey;
        v77[1] = NSDebugDescriptionErrorKey;
        v78[0] = v67;
        v78[1] = @"Unable to register asset path with fstag";
        v77[2] = @"path";
        uint64_t v41 = objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle assetBundlePath](self, "assetBundlePath"));
        int v64 = (void *)v41;
        void v77[3] = @"assetType";
        id v42 = @"nil";
        if (v9) {
          id v42 = v9;
        }
        v78[2] = v41;
        void v78[3] = v42;
        v77[4] = @"fstag";
        id v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v73));
        v78[4] = v43;
        int v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v78,  v77,  5LL));
        uint64_t v65 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  110LL,  v44));

        id v45 = (id)v67;
        id v8 = (id)v65;
        goto LABEL_35;
      }

      id v16 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Successfully registered Exclave mapped path [fstag=%d] %@:%@: %s",  v73,  v9,  v10,  v39);
LABEL_34:
      id v45 = objc_claimAutoreleasedReturnValue(v16);
      id v46 = [v45 UTF8String];
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle beginAccess_nowait:error:]",  @"[SMA] %s",  v47,  v48,  v49,  v50,  (uint64_t)v46);
LABEL_35:

      goto LABEL_36;
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v22 setObject:v13 forKeyedSubscript:NSUnderlyingErrorKey];
    [v22 setObject:@"Could not determine Exclave mapped path registration state" forKeyedSubscript:NSDebugDescriptionErrorKey];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v73));
    [v22 setObject:v23 forKeyedSubscript:@"fstag"];

    uint64_t v24 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  11004LL,  v22));
LABEL_18:
    id v8 = (id)v24;
LABEL_36:

LABEL_37:
  }

  if (v8)
  {
    id v51 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Begin access failed for secure asset (%@): %@", self, v8));
    id v52 = [v51 UTF8String];
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[SecureMobileAssetBundle beginAccess_nowait:error:]",  @"[SMA] %s",  v53,  v54,  v55,  v56,  (uint64_t)v52);

    if (a4) {
      *a4 = v8;
    }
  }

  else
  {
    id v57 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Begin access successful for secure asset: %@", self));
    id v58 = [v57 UTF8String];
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle beginAccess_nowait:error:]",  @"[SMA] %s",  v59,  v60,  v61,  v62,  (uint64_t)v58);
  }

  return v8 == 0LL;
}

- (BOOL)endAccess:(int64_t)a3 error:(id *)a4
{
  uint64_t v7 = objc_opt_class(self);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_sync_enter(v8);
  LOBYTE(a4) = -[SecureMobileAssetBundle endAccess_nowait:error:](self, "endAccess_nowait:error:", a3, a4);
  objc_sync_exit(v8);

  return (char)a4;
}

- (BOOL)endAccess_nowait:(int64_t)a3 error:(id *)a4
{
  char v5 = a3;
  uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle assetType](self, "assetType"));
  if (-[SecureMobileAssetBundle isMappableToExclaves:](self, "isMappableToExclaves:", &v58))
  {
    id v56 = 0LL;
    id v57 = 0LL;
    BOOL MappedExclavePath = getMappedExclavePath(v58, &v57, &v56);
    id v9 = v57;
    id v10 = v56;
    if (!MappedExclavePath)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      [v11 setObject:v10 forKeyedSubscript:NSUnderlyingErrorKey];
      [v11 setObject:@"Could not determine Exclave mapped path registration state" forKeyedSubscript:NSDebugDescriptionErrorKey];
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v58));
      [v11 setObject:v12 forKeyedSubscript:@"fstag"];

      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  111LL,  v11));
      id v14 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"WARNING: %@", v13));
      id v15 = [v14 UTF8String];
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[SecureMobileAssetBundle endAccess_nowait:error:]",  @"[SMA] %s",  v16,  v17,  v18,  v19,  (uint64_t)v15);
    }

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle accessPath](self, "accessPath"));
    unsigned int v21 = [v9 isEqualToString:v20];

    if (v21)
    {
      id v22 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"<%@> has a registered Exclave mapped path [fstag=%d]: %@", self, v58, v9));
      id v23 = [v22 UTF8String];
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle endAccess_nowait:error:]",  @"[SMA] %s",  v24,  v25,  v26,  v27,  (uint64_t)v23);

      id v28 = v9;
      id v55 = v10;
      int v29 = unregisterMappedExclavePath((const char *)[v28 fileSystemRepresentation], &v55);
      id v30 = v55;

      if (v29)
      {
        id v31 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        [v31 setObject:v30 forKeyedSubscript:NSUnderlyingErrorKey];
        [v31 setObject:@"Unable to unregister fstag mapping" forKeyedSubscript:NSDebugDescriptionErrorKey];
        [v31 setObject:v28 forKeyedSubscript:@"mappedPath"];
        if (v7) {
          uint64_t v32 = v7;
        }
        else {
          uint64_t v32 = @"nil";
        }
        [v31 setObject:v32 forKeyedSubscript:@"assetType"];
        int v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v58));
        [v31 setObject:v33 forKeyedSubscript:@"fstag"];

        id v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  111LL,  v31));
      }

      else
      {
        id v31 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Successfully unregistered Exclave mapped path [fstag=%d]: %@", v58, v28));
        id v35 = [v31 UTF8String];
        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle endAccess_nowait:error:]",  @"[SMA] %s",  v36,  v37,  v38,  v39,  (uint64_t)v35);
        id v34 = 0LL;
      }
    }

    else
    {
      id v34 = 0LL;
      id v30 = v10;
    }

    if ((v5 & 2) == 0) {
      goto LABEL_16;
    }
  }

  else
  {
    id v34 = 0LL;
    if ((v5 & 2) == 0)
    {
LABEL_16:
      id v54 = v34;
      -[SecureMobileAssetBundle ungraftOrUnmount:](self, "ungraftOrUnmount:", &v54);
      id v40 = v54;

      id v34 = v40;
    }
  }

  if (v34)
  {
    id v41 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"End access failed for secure asset (%@): %@", self, v34));
    id v42 = [v41 UTF8String];
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[SecureMobileAssetBundle endAccess_nowait:error:]",  @"[SMA] %s",  v43,  v44,  v45,  v46,  (uint64_t)v42);

    if (a4) {
      *a4 = v34;
    }
  }

  else
  {
    id v47 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"End access successful for secure asset: %@", self));
    id v48 = [v47 UTF8String];
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle endAccess_nowait:error:]",  @"[SMA] %s",  v49,  v50,  v51,  v52,  (uint64_t)v48);
  }

  return v34 == 0LL;
}

- (BOOL)mapToExclaves:(id *)a3
{
  return -[SecureMobileAssetBundle beginAccess:error:](self, "beginAccess:error:", 2LL, a3);
}

- (BOOL)unmapFromExclaves:(id *)a3
{
  return -[SecureMobileAssetBundle endAccess:error:](self, "endAccess:error:", 2LL, a3);
}

- (NSString)assetBundlePath
{
  return self->_assetBundlePath;
}

- (BOOL)isSecureMobileAsset
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle assetBundlePath](self, "assetBundlePath"));
  BOOL v3 = +[SecureMobileAssetBundle assetIsSecureMobileAsset:]( &OBJC_CLASS___SecureMobileAssetBundle,  "assetIsSecureMobileAsset:",  v2);

  return v3;
}

- (BOOL)isMappableToExclaves:(unsigned int *)a3
{
  if (MABrainUtilityDeviceSupportsExclaves())
  {
    unsigned int v26 = 0;
    char v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle assetType](self, "assetType"));
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle assetSpecifier](self, "assetSpecifier"));
    BOOL v7 = +[SecureMobileAssetBundle fsTag:forAssetType:specifier:]( &OBJC_CLASS___SecureMobileAssetBundle,  "fsTag:forAssetType:specifier:",  &v26,  v5,  v6);

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle assetType](self, "assetType"));
    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle assetSpecifier](self, "assetSpecifier"));
    id v10 = (void *)v9;
    if (v7)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Allow listed for Exclaves: %@:%@ fstag=%u",  v8,  v9,  v26));

      id v12 = v11;
      id v13 = [v12 UTF8String];
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SecureMobileAssetBundle isMappableToExclaves:]",  @"[SMA] %s",  v14,  v15,  v16,  v17,  (uint64_t)v13);

      if (a3) {
        *a3 = v26;
      }
    }

    else
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Not allow listed for Exclaves: %@:%@",  v8,  v9));

      id v19 = v18;
      id v20 = [v19 UTF8String];
      _MobileAssetLog( 0LL,  7,  (uint64_t)"-[SecureMobileAssetBundle isMappableToExclaves:]",  @"[SMA] %s",  v21,  v22,  v23,  v24,  (uint64_t)v20);
    }
  }

  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)_personalizedBundleTicketData
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle secureAssetDataPath](self, "secureAssetDataPath"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v4 = [v3 fileExistsAtPath:v2];

  if (v4)
  {
    char v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v2, 1LL));
    uint64_t v6 = AMAuthInstallCreate(kCFAllocatorDefault);
    if (v6)
    {
      if (&_AMAuthInstallUpdaterCryptex1CopyTicket)
      {
        BOOL v7 = (const void *)v6;
        id v8 = (void *)AMAuthInstallUpdaterCryptex1CopyTicket();
        CFRelease(v7);
        if (!v8)
        {
          id v9 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"AMAuthInstallUpdaterCryptex1CopyTicket() failed: %@", 0LL));
          id v10 = [v9 UTF8String];
          _MobileAssetLog( 0LL,  3,  (uint64_t)"-[SecureMobileAssetBundle _personalizedBundleTicketData]",  @"[SMA] %s",  v11,  v12,  v13,  v14,  (uint64_t)v10);
        }

        goto LABEL_10;
      }

      uint64_t v15 = @"AMAuthInstallUpdaterCryptex1CopyTicket() is unavailable";
    }

    else
    {
      uint64_t v15 = @"AMAuthInstallCreate() failed";
    }

    id v16 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v15));
    id v17 = [v16 UTF8String];
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[SecureMobileAssetBundle _personalizedBundleTicketData]",  @"[SMA] %s",  v18,  v19,  v20,  v21,  (uint64_t)v17);

    id v8 = 0LL;
LABEL_10:

    goto LABEL_11;
  }

  id v8 = 0LL;
LABEL_11:

  return v8;
}

- (id)_manifestDataFromFullyFormedTicket:(id)a3
{
  id v3 = a3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v3));
  char v5 = v4;
  if (v4)
  {
    uint64_t v23 = 0LL;
    memset(v22, 0, sizeof(v22));
    id v6 = v4;
    double v8 = Img4DecodeInit((uint64_t)[v6 bytes], (uint64_t)objc_msgSend(v6, "length"), (uint64_t)v22);
    if ((_DWORD)v7)
    {
      id v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Img4DecodeInit() failed for %@: %d",  v8,  v3,  v7);
    }

    else
    {
      uint64_t v21 = 0LL;
      unsigned int v20 = 0;
      uint64_t Manifest = Img4DecodeGetManifest((uint64_t)v22, &v21, &v20);
      if (!(_DWORD)Manifest)
      {
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v21, v20));
        goto LABEL_8;
      }

      id v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Img4DecodeGetManifest() failed for %@: %d",  v11,  v3,  Manifest);
    }

    id v12 = objc_claimAutoreleasedReturnValue(v9);
    id v13 = [v12 UTF8String];
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[SecureMobileAssetBundle _manifestDataFromFullyFormedTicket:]",  @"[SMA] %s",  v14,  v15,  v16,  v17,  (uint64_t)v13);
  }

  uint64_t v18 = 0LL;
LABEL_8:

  return v18;
}

- (BOOL)isPersonalized
{
  return -[SecureMobileAssetBundle isPersonalized:](self, "isPersonalized:", 0LL);
}

- (BOOL)isPersonalized:(int64_t *)a3
{
  char v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle _personalizedBundleTicketData](self, "_personalizedBundleTicketData"));
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle ticketPath](self, "ticketPath"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[SecureMobileAssetBundle _manifestDataFromFullyFormedTicket:]( self,  "_manifestDataFromFullyFormedTicket:",  v6));

    if (v7)
    {
      if ([v5 isEqualToData:v7])
      {
        unsigned int v11 = 0;
        if (!-[SecureMobileAssetBundle isMappableToExclaves:](self, "isMappableToExclaves:", &v11)
          || !+[SecureMobileAssetBundle _shouldUseConclave:]( &OBJC_CLASS___SecureMobileAssetBundle,  "_shouldUseConclave:",  -[SecureMobileAssetBundle darwinOnly](self, "darwinOnly"))
          || -[SecureMobileAssetBundle isPersonalizedForExclaves:staged:]( self,  "isPersonalizedForExclaves:staged:",  v11,  0LL))
        {
          BOOL v8 = 1;
LABEL_16:

          goto LABEL_17;
        }

        BOOL v8 = 0;
        if (!a3) {
          goto LABEL_16;
        }
        int64_t v9 = 3LL;
LABEL_14:
        *a3 = v9;
        goto LABEL_16;
      }

      if (a3)
      {
        BOOL v8 = 0;
        int64_t v9 = 2LL;
        goto LABEL_14;
      }
    }

    else if (a3)
    {
      BOOL v8 = 0;
      int64_t v9 = 1LL;
      goto LABEL_14;
    }

    BOOL v8 = 0;
    goto LABEL_16;
  }

  BOOL v8 = 0;
  if (a3) {
    *a3 = 0LL;
  }
LABEL_17:

  return v8;
}

- (BOOL)isPersonalizedManifestStaged
{
  return -[SecureMobileAssetBundle isPersonalizedManifestStaged:](self, "isPersonalizedManifestStaged:", 0LL);
}

- (BOOL)isPersonalizedManifestStaged:(int64_t *)a3
{
  char v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle _personalizedBundleTicketData](self, "_personalizedBundleTicketData"));
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle stagedPersonalizedManifestPath](self, "stagedPersonalizedManifestPath"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[SecureMobileAssetBundle _manifestDataFromFullyFormedTicket:]( self,  "_manifestDataFromFullyFormedTicket:",  v6));

    if (v7)
    {
      if ([v5 isEqualToData:v7])
      {
        unsigned int v11 = 0;
        if (!-[SecureMobileAssetBundle isMappableToExclaves:](self, "isMappableToExclaves:", &v11)
          || !+[SecureMobileAssetBundle _shouldUseConclave:]( &OBJC_CLASS___SecureMobileAssetBundle,  "_shouldUseConclave:",  -[SecureMobileAssetBundle darwinOnly](self, "darwinOnly")))
        {
          BOOL v8 = 1;
          goto LABEL_18;
        }

        BOOL v8 = 1;
        if (-[SecureMobileAssetBundle isPersonalizedForExclaves:staged:]( self,  "isPersonalizedForExclaves:staged:",  v11,  1LL))
        {
          goto LABEL_18;
        }

        BOOL v8 = 0;
        if (!a3) {
          goto LABEL_18;
        }
        int64_t v9 = 3LL;
        goto LABEL_15;
      }

      if (a3)
      {
        BOOL v8 = 0;
        int64_t v9 = 2LL;
        goto LABEL_15;
      }
    }

    else if (a3)
    {
      BOOL v8 = 0;
      int64_t v9 = 1LL;
LABEL_15:
      *a3 = v9;
LABEL_18:

      goto LABEL_19;
    }

    BOOL v8 = 0;
    goto LABEL_18;
  }

  BOOL v8 = 0;
  if (a3) {
    *a3 = 0LL;
  }
LABEL_19:

  return v8;
}

- (BOOL)isPersonalizedForExclaves:(unsigned int)a3 staged:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  id v34 = 0LL;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[SecureMobileAssetBundle getExclaveManager:]( &OBJC_CLASS___SecureMobileAssetBundle,  "getExclaveManager:",  &v34));
  id v8 = v34;
  int64_t v9 = v8;
  if (v7)
  {
    if (v4) {
      uint64_t v10 = objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle stagedPersonalizedManifestPath](self, "stagedPersonalizedManifestPath"));
    }
    else {
      uint64_t v10 = objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle ticketPath](self, "ticketPath"));
    }
    id v14 = (id)v10;
    unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle secureInfoPlistPath](self, "secureInfoPlistPath"));
    uint64_t v21 = objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle integrityCatalogPath](self, "integrityCatalogPath"));
    uint64_t v22 = (void *)v21;
    unsigned __int8 v11 = 0;
    if (v14 && v20 && v21)
    {
      uint64_t v23 = objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v14));
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v20));
      uint64_t v25 = objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v22));
      unsigned int v26 = (void *)v23;
      uint64_t v27 = (void *)v25;
      unsigned __int8 v11 = 0;
      if (v26 && v24 && v25)
      {
        char v33 = 0;
        id v32 = v9;
        BOOL v28 = v4;
        int v29 = v26;
        unsigned __int8 v11 = [v7 checkManifestForFSTag:v5 staged:v28 manifest:v26 infoPlist:v24 catalog:v25 isValid:&v33 error:&v32];
        id v30 = v32;

        if (!v33) {
          unsigned __int8 v11 = 0;
        }
        int64_t v9 = v30;
      }

      else
      {
        int v29 = v26;
      }
    }
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 checkedDescription]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to get shared instance of SecureMobileAssetExclave: %@",  v12));

    id v14 = v13;
    id v15 = [v14 UTF8String];
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[SecureMobileAssetBundle isPersonalizedForExclaves:staged:]",  @"[SMA] %s",  v16,  v17,  v18,  v19,  (uint64_t)v15);
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (NSString)secureAssetDataPath
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle assetBundlePath](self, "assetBundlePath"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathComponent:@"SecureAssetData"]);

  return (NSString *)v3;
}

- (NSString)graftPath
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle assetBundlePath](self, "assetBundlePath"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathComponent:@".AssetData"]);

  return (NSString *)v3;
}

- (NSString)cryptexPath
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle secureAssetDataPath](self, "secureAssetDataPath"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathComponent:@"SecureMobileAsset.dmg"]);

  id v4 = v3;
  uint64_t v5 = realpath_DARWIN_EXTSN((const char *)[v4 UTF8String], 0);
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v5));

    id v4 = (id)v6;
  }

  free(v5);
  return (NSString *)v4;
}

- (NSString)secureInfoPlistPath
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle secureAssetDataPath](self, "secureAssetDataPath"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathComponent:@"SecureMobileAsset-Info.plist"]);

  return (NSString *)v3;
}

- (NSString)insecureInfoPlistPath
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle assetBundlePath](self, "assetBundlePath"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathComponent:@"Info.plist"]);

  return (NSString *)v3;
}

- (NSString)ticketPath
{
  if (__isPlatformVersionAtLeast(3, 18, 0, 0))
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___MASecureManifestStorage);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle assetType](self, "assetType"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle assetSpecifier](self, "assetSpecifier"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 manifestPathForAssetType:v4 specifier:v5]);
  }

  else
  {
    id v3 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"MASecureManifestStorage isn't available"));
    id v7 = [v3 UTF8String];
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[SecureMobileAssetBundle ticketPath]",  @"[SMA] %s",  v8,  v9,  v10,  v11,  (uint64_t)v7);
    uint64_t v6 = 0LL;
  }

  return (NSString *)v6;
}

- (NSString)stagedPersonalizedManifestPath
{
  if (__isPlatformVersionAtLeast(3, 18, 0, 0))
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___MASecureManifestStorage);
    if ((objc_opt_respondsToSelector(v3, "stagedManifestPathForAssetType:specifier:") & 1) != 0)
    {
      id v4 = (id)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle assetType](self, "assetType"));
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle assetSpecifier](self, "assetSpecifier"));
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 stagedManifestPathForAssetType:v4 specifier:v5]);
    }

    else
    {
      id v4 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Warning: MASecureManifestStorage does not support staging, returning nil"));
      id v12 = [v4 UTF8String];
      _MobileAssetLog( 0LL,  7,  (uint64_t)"-[SecureMobileAssetBundle stagedPersonalizedManifestPath]",  @"[SMA] %s",  v13,  v14,  v15,  v16,  (uint64_t)v12);
      uint64_t v6 = 0LL;
    }
  }

  else
  {
    id v3 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"MASecureManifestStorage isn't available"));
    id v7 = [v3 UTF8String];
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[SecureMobileAssetBundle stagedPersonalizedManifestPath]",  @"[SMA] %s",  v8,  v9,  v10,  v11,  (uint64_t)v7);
    uint64_t v6 = 0LL;
  }

  return (NSString *)v6;
}

- (unsigned)graftdmgType
{
  return 8;
}

- (NSString)rootHashPath
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle secureAssetDataPath](self, "secureAssetDataPath"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathComponent:@"SecureMobileAsset.root_hash"]);

  return (NSString *)v3;
}

- (NSString)trustCachePath
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle secureAssetDataPath](self, "secureAssetDataPath"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathComponent:@"SecureMobileAsset.trustcache"]);

  return (NSString *)v3;
}

- (id)integrityCatalogPath
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle secureAssetDataPath](self, "secureAssetDataPath"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathComponent:@"SecureMobileAsset.integritycatalog"]);

  return v3;
}

- (BOOL)isAccessible
{
  if (-[SecureMobileAssetBundle isGrafted](self, "isGrafted")) {
    return 1;
  }
  else {
    return -[SecureMobileAssetBundle isMounted](self, "isMounted");
  }
}

- (NSDictionary)secureInfoPlist
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle secureInfoPlistPath](self, "secureInfoPlistPath"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v2));

  return (NSDictionary *)v3;
}

- (NSDictionary)insecureInfoPlist
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle insecureInfoPlistPath](self, "insecureInfoPlistPath"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v2));

  return (NSDictionary *)v3;
}

- (NSDictionary)assetAttributes
{
  id v2 = self;
  objc_sync_enter(v2);
  if (!v2->_assetAttributes)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle insecureInfoPlist](v2, "insecureInfoPlist"));
    uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"MobileAssetProperties"]);
    assetAttributes = v2->_assetAttributes;
    v2->_assetAttributes = (NSDictionary *)v4;
  }

  objc_sync_exit(v2);

  return v2->_assetAttributes;
}

- (NSString)assetType
{
  id v2 = self;
  objc_sync_enter(v2);
  if (!v2->_assetType)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle insecureInfoPlist](v2, "insecureInfoPlist"));
    uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:kCFBundleIdentifierKey]);
    assetType = v2->_assetType;
    v2->_assetType = (NSString *)v4;
  }

  objc_sync_exit(v2);

  return v2->_assetType;
}

- (NSString)assetSpecifier
{
  id v2 = self;
  objc_sync_enter(v2);
  if (!v2->_assetSpecifier)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle assetAttributes](v2, "assetAttributes"));
    uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"AssetSpecifier"]);
    assetSpecifier = v2->_assetSpecifier;
    v2->_assetSpecifier = (NSString *)v4;
  }

  objc_sync_exit(v2);

  return v2->_assetSpecifier;
}

- (id)description
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle assetType](self, "assetType"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle assetSpecifier](self, "assetSpecifier"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle assetBundlePath](self, "assetBundlePath"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 lastPathComponent]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@:%@ (%@)",  v3,  v4,  v6));
  return v7;
}

- (id)assetValues
{
  id v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle assetType](self, "assetType"));
  -[NSMutableDictionary setSafeObject:forKey:](v3, "setSafeObject:forKey:", v4, @"AssetType");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecureMobileAssetBundle assetSpecifier](self, "assetSpecifier"));
  -[NSMutableDictionary setSafeObject:forKey:](v3, "setSafeObject:forKey:", v5, @"AssetSpecifier");

  return v3;
}

- (BOOL)darwinOnly
{
  return self->_darwinOnly;
}

- (void)setDarwinOnly:(BOOL)a3
{
  self->_darwinOnly = a3;
}

- (void).cxx_destruct
{
}

- (void)devnodesForDiskImageID:(void *)a1 error:(_OWORD *)a2 .cold.1(void *a1, _OWORD *a2)
{
  uint64_t v7 = OUTLINED_FUNCTION_0_3(v3, v4, v5, v6, (uint64_t)&dword_0);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

@end
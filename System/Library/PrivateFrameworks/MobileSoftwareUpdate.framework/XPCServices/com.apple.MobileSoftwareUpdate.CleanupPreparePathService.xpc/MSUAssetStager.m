@interface MSUAssetStager
+ (BOOL)_checkAndLogLocalError:(id)a3 outError:(id *)a4;
+ (BOOL)_isEnabledWithAdditionalIndicators:(BOOL)a3 options:(id)a4 updateAttributes:(id)a5 snapshotPrepare:(BOOL)a6 splat:(BOOL)a7 sfr:(BOOL)a8 purging:(BOOL)a9;
+ (BOOL)_preSUStagingSupportedInSUCore;
+ (BOOL)_stageAssetsUsingUpdateAttributes:(id)a3 withError:(id *)a4;
+ (BOOL)isPurgingEnabled;
+ (BOOL)isStagingEnabledForOptions:(id)a3 updateAttributes:(id)a4 snapshotPrepare:(BOOL)a5 splat:(BOOL)a6 sfr:(BOOL)a7;
+ (BOOL)stageAssetsUsingUpdateAttributes:(id)a3 withError:(id *)a4;
+ (id)buildVersionFromAttributes:(id)a3;
+ (id)buildVersionFromInfoPlist:(id)a3;
+ (id)osVersionFromAttributes:(id)a3;
+ (id)osVersionFromInfoPlist:(id)a3;
+ (id)restoreVersionFromAttributes:(id)a3;
+ (id)trainNameFromAttributes:(id)a3;
+ (void)_purgeStagedAssetsSynchronously:(BOOL)a3;
+ (void)disableStagingForReason:(id)a3 buildVersion:(id)a4 osVersion:(id)a5;
+ (void)purgeStagedAssets;
+ (void)purgeStagedAssetsAsync;
@end

@implementation MSUAssetStager

+ (BOOL)stageAssetsUsingUpdateAttributes:(id)a3 withError:(id *)a4
{
  return +[MSUAssetStager _stageAssetsUsingUpdateAttributes:withError:]( &OBJC_CLASS___MSUAssetStager,  "_stageAssetsUsingUpdateAttributes:withError:",  a3,  a4);
}

+ (BOOL)_stageAssetsUsingUpdateAttributes:(id)a3 withError:(id *)a4
{
  uint64_t v107 = 0LL;
  v108 = &v107;
  uint64_t v109 = 0x3052000000LL;
  v110 = __Block_byref_object_copy_;
  v111 = __Block_byref_object_dispose_;
  uint64_t v112 = 0LL;
  if (a4) {
    *a4 = 0LL;
  }
  if (objc_opt_class(&OBJC_CLASS___MAAutoAsset)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSelector)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetStatus))
  {
    if (((objc_opt_respondsToSelector( &OBJC_CLASS___MAAutoAsset,  "stageDetermineAllAvailableForUpdateSync:totalExpectedBytes:error:") & 1) != 0 || (objc_opt_respondsToSelector( &OBJC_CLASS___MAAutoAsset,  "stageDetermineAllAvailableSync:forTargetBuildVersion:totalExpectedBytes:error:") & 1) != 0)
      && (objc_opt_respondsToSelector( &OBJC_CLASS___MAAutoAsset,  "stageDownloadAllSync:assetsSuccessfullyStaged:error:reportingProgress:") & 1) != 0 && (objc_opt_respondsToSelector(&OBJC_CLASS___MAAutoAsset, "stagePurgeAllSync") & 1) != 0)
    {
      v106[0] = 0LL;
      v106[1] = v106;
      v106[2] = 0x2020000000LL;
      v106[3] = 0LL;
      uint64_t v104 = 0LL;
      unint64_t v105 = 0LL;
      uint64_t v101 = 0LL;
      v102 = &v101;
      uint64_t v103 = 0x2020000000LL;
      id v9 = +[MSUAssetStager buildVersionFromAttributes:]( &OBJC_CLASS___MSUAssetStager,  "buildVersionFromAttributes:",  a3);
      id v10 = +[MSUAssetStager osVersionFromAttributes:](&OBJC_CLASS___MSUAssetStager, "osVersionFromAttributes:", a3);
      id v11 = +[MSUAssetStager trainNameFromAttributes:](&OBJC_CLASS___MSUAssetStager, "trainNameFromAttributes:", a3);
      id v12 = +[MSUAssetStager restoreVersionFromAttributes:]( &OBJC_CLASS___MSUAssetStager,  "restoreVersionFromAttributes:",  a3);
      if ((objc_opt_respondsToSelector( &OBJC_CLASS___MAAutoAsset,  "stageDetermineAllAvailableForUpdateSync:totalExpectedBytes:error:") & 1) != 0)
      {
        v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v9, @"Build");
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v18,  "setObject:forKeyedSubscript:",  v10,  @"OSVersion");
        if (v11) {
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v18,  "setObject:forKeyedSubscript:",  v11,  @"TrainName");
        }
        else {
          logfunction( ",  1,  @"MSUAssetStager: Unable to determine TrainName from update attributes. Not adding to options\n"",  v19,  v20,  v21,  v22,  v23,  v93);
        }
        if (v12) {
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v18,  "setObject:forKeyedSubscript:",  v12,  @"RestoreVersion");
        }
        else {
          logfunction( ",  1,  @"MSUAssetStager: Unable to determine RestoreVersion from update attributes. Not adding to options\n"",  v24,  v25,  v26,  v27,  v28,  v93);
        }
        logfunction( ",  1,  @"MSUAssetStager: Using new SPI for determining assets for pre SU staging. Options being passed into stageDetermineAllAvailableForUpdate are {\n%@\n}\n"",  v40,  v41,  v42,  v43,  v44,  (char)v18);
        id v34 = +[MAAutoAsset stageDetermineAllAvailableForUpdateSync:totalExpectedBytes:error:]( &OBJC_CLASS___MAAutoAsset,  "stageDetermineAllAvailableForUpdateSync:totalExpectedBytes:error:",  v18,  &v105,  v108 + 5);
      }

      else
      {
        logfunction( ",  1,  @"MSUAssetStager: Determining all available assets for staging using buildVersion:%@ osVersion:%@ via legacy SPI on supported OS\n"",  v13,  v14,  v15,  v16,  v17,  (char)v9);
        id v34 = +[MAAutoAsset stageDetermineAllAvailableSync:forTargetBuildVersion:totalExpectedBytes:error:]( &OBJC_CLASS___MAAutoAsset,  "stageDetermineAllAvailableSync:forTargetBuildVersion:totalExpectedBytes:error:",  v10,  v9,  &v105,  v108 + 5);
      }

      v45 = v34;
      if (v108[5])
      {
        logfunction( ",  1,  @"MSUAssetStager: Failed to determine assets available for staging\n"",  v35,  v36,  v37,  v38,  v39,  v94);
        CFTypeRef v46 = (CFTypeRef)v108[5];
      }

      else
      {
        if (!v34 || ![v34 count])
        {
          BOOL v32 = 1;
          logfunction(", 1, @"MSUAssetStager: No assets found for staging\n"", v35, v36, v37, v38, v39, v94);
          goto LABEL_38;
        }

        if (v105)
        {
          char v47 = [v45 count];
          logfunction( ",  1,  @"MSUAssetStager: Determined %lu assets to stage requiring %llu bytes\n"",  v48,  v49,  v50,  v51,  v52,  v47);
          v99 = 0LL;
          CFErrorRef v100 = 0LL;
          if ((get_snapshot_preparation_size(a3, &v99, &v100) & 1) != 0)
          {
            uint64_t v98 = 0LL;
            if ((get_snapshot_apply_size((const __CFDictionary *)a3, &v98) & 1) != 0)
            {
              bzero(&v113, 0x878uLL);
              statfs("/private/var", &v113);
              uint64_t v68 = v113.f_bavail * v113.f_bsize;
              unint64_t v69 = v68 - (void)&v99[v98];
              if (v68 <= (unint64_t)&v99[v98])
              {
                CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  63LL,  0LL,  0LL,  @"Free space (%llu) is less than the prepareSize (%llu) + applySize (%llu) total",  v65,  v66,  v67,  LOBYTE(v113.f_bavail) * LOBYTE(v113.f_bsize));
                CFTypeRef v90 = (id)CFMakeCollectable(error_internal_cf);
                v108[5] = (uint64_t)v90;
                +[MSUAssetStager _checkAndLogLocalError:outError:]( &OBJC_CLASS___MSUAssetStager,  "_checkAndLogLocalError:outError:",  v90,  a4);
              }

              else
              {
                unint64_t v70 = (unint64_t)(float)((float)((float)v105 + (float)((float)v105 * 0.1)) + 262140000.0);
                logfunction( ",  1,  @"MSUAssetStager: Required space for staging assets freeSpace:%llu - (prepareSize:%llu + applySize:%llu) = remainingSpace:%llu > estimatedBytesWithPadding:%llu | stagingValid:%@\n"",  v63,  v64,  v65,  v66,  v67,  LOBYTE(v113.f_bavail) * LOBYTE(v113.f_bsize));
                if (v69 <= v70)
                {
                  CFErrorRef v91 = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  63LL,  0LL,  0LL,  @"Not enough space available for staging assets; remainingSpace:%llu, estimatedBytesWithPadding:%llu",
                          v73,
                          v74,
                          v75,
                          v69);
                  CFTypeRef v92 = (id)CFMakeCollectable(v91);
                  v108[5] = (uint64_t)v92;
                  +[MSUAssetStager _checkAndLogLocalError:outError:]( &OBJC_CLASS___MSUAssetStager,  "_checkAndLogLocalError:outError:",  v92,  a4);
                }

                else
                {
                  logfunction( ",  1,  @"MSUAssetStager: Beginning asset downloads for staging\n"",  v71,  v72,  v73,  v74,  v75,  v95);
                  dispatch_semaphore_t v76 = dispatch_semaphore_create(0LL);
                  if (v76)
                  {
                    v82 = v76;
                    v97[0] = _NSConcreteStackBlock;
                    v97[1] = 3221225472LL;
                    v97[2] = __62__MSUAssetStager__stageAssetsUsingUpdateAttributes_withError___block_invoke_2;
                    v97[3] = &unk_100061158;
                    v97[6] = &v101;
                    v97[7] = &v107;
                    v97[4] = v76;
                    v97[5] = v106;
                    +[MAAutoAsset stageDownloadAll:reportingProgress:completion:]( &OBJC_CLASS___MAAutoAsset,  "stageDownloadAll:reportingProgress:completion:",  3600LL,  &__block_literal_global_1,  v97);
                    if (dispatch_semaphore_wait(v82, 0LL))
                    {
                      -[NSRunLoop runMode:beforeDate:]( +[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"),  "runMode:beforeDate:",  NSDefaultRunLoopMode,  objc_opt_new(&OBJC_CLASS___NSDate));
                      +[MAAutoAsset stagePurgeAllSync](&OBJC_CLASS___MAAutoAsset, "stagePurgeAllSync");
                    }

                    else
                    {
                      if (!v108[5])
                      {
                        BOOL v32 = 1;
                        logfunction( ",  1,  @"MSUAssetStager: Completed asset staging using %llu bytes\n"",  v83,  v84,  v85,  v86,  v87,  v102[3]);
                        goto LABEL_38;
                      }

                      logfunction( ",  1,  @"MSUAssetStager: Failed to download assets for staging\n"",  v83,  v84,  v85,  v86,  v87,  v96);
                      +[MSUAssetStager _checkAndLogLocalError:outError:]( &OBJC_CLASS___MSUAssetStager,  "_checkAndLogLocalError:outError:",  v108[5],  a4);
                    }
                  }

                  else
                  {
                    logfunction( ",  1,  @"MSUAssetStager: Failed to create semaphore for staging.\n"",  v77,  v78,  v79,  v80,  v81,  v96);
                  }
                }
              }
            }

            else
            {
              logfunction( ",  1,  @"MSUAssetStager: Failed to get snapshot apply size with error: %@\n"",  v58,  v59,  v60,  v61,  v62,  (char)v100);
              +[MSUAssetStager _checkAndLogLocalError:outError:]( &OBJC_CLASS___MSUAssetStager,  "_checkAndLogLocalError:outError:",  v100,  a4);
            }
          }

          else
          {
            logfunction( ",  1,  @"MSUAssetStager: Failed to get snapshot preparation size with error: %@\n"",  v53,  v54,  v55,  v56,  v57,  (char)v100);
            +[MSUAssetStager _checkAndLogLocalError:outError:]( &OBJC_CLASS___MSUAssetStager,  "_checkAndLogLocalError:outError:",  v100,  a4);
          }

          goto LABEL_26;
        }

        CFErrorRef v88 = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  63LL,  0LL,  0LL,  @"Failed to estimate bytes needed for staging",  v37,  v38,  v39,  v94);
        CFTypeRef v46 = (id)CFMakeCollectable(v88);
        v108[5] = (uint64_t)v46;
      }

      +[MSUAssetStager _checkAndLogLocalError:outError:]( &OBJC_CLASS___MSUAssetStager,  "_checkAndLogLocalError:outError:",  v46,  a4);
LABEL_26:
      BOOL v32 = 0;
LABEL_38:
      _Block_object_dispose(&v101, 8);
      _Block_object_dispose(v106, 8);
      goto LABEL_16;
    }

    v29 = @"Required MobileAsset classes do not respond to required selectors";
  }

  else
  {
    v29 = @"Required MobileAsset classes do not exist";
  }

  CFErrorRef v30 = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 63LL, 0LL, 0LL, v29, v6, v7, v8, v93);
  CFTypeRef v31 = (id)CFMakeCollectable(v30);
  v108[5] = (uint64_t)v31;
  +[MSUAssetStager _checkAndLogLocalError:outError:]( &OBJC_CLASS___MSUAssetStager,  "_checkAndLogLocalError:outError:",  v31,  a4);
  BOOL v32 = 0;
LABEL_16:
  _Block_object_dispose(&v107, 8);
  return v32;
}

void __62__MSUAssetStager__stageAssetsUsingUpdateAttributes_withError___block_invoke( id a1,  MAAutoAssetStatus *a2,  NSError *a3)
{
  if ((objc_opt_respondsToSelector(a2, "summary") & 1) != 0)
  {
    char v9 = -[MAAutoAssetStatus summary](a2, "summary");
    logfunction(", 1, @"MSUAssetStager: Progress %@\n"", v10, v11, v12, v13, v14, v9);
  }

  else
  {
    logfunction( ",  1,  @"MSUAssetStager: Progress reported, but status does not implement summary\n"",  v4,  v5,  v6,  v7,  v8,  v15);
  }

uint64_t __62__MSUAssetStager__stageAssetsUsingUpdateAttributes_withError___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a3;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = a2;
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL) = a4;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)disableStagingForReason:(id)a3 buildVersion:(id)a4 osVersion:(id)a5
{
  if (!+[MSUAssetStager _preSUStagingSupportedInSUCore](&OBJC_CLASS___MSUAssetStager, "_preSUStagingSupportedInSUCore"))
  {
    v22[0] = @"DisablePreSoftwareUpdateAssetStaging";
    v22[1] = @"Reason";
    uint64_t v8 = @"NotSpecified";
    if (a3) {
      char v9 = (const __CFString *)a3;
    }
    else {
      char v9 = @"NotSpecified";
    }
    v23[0] = &__kCFBooleanTrue;
    v23[1] = v9;
    if (a4) {
      uint64_t v10 = (const __CFString *)a4;
    }
    else {
      uint64_t v10 = @"NotSpecified";
    }
    v22[2] = @"BuildVersion";
    v22[3] = @"OSVersion";
    if (a5) {
      uint64_t v8 = (const __CFString *)a5;
    }
    v23[2] = v10;
    v23[3] = v8;
    uint64_t v11 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  4LL);
    logfunction( ",  1,  @"MSUAssetStager: Writing preSoftwareUpdateStagingDictionary: %@ to path: %s\n"",  v12,  v13,  v14,  v15,  v16,  (char)v11);
    if (!-[NSDictionary writeToFile:atomically:]( v11,  "writeToFile:atomically:",  @"/private/var/MobileSoftwareUpdate/PreSoftwareUpdateAssetStaging.plist",  1LL)) {
      logfunction( ",  1,  @"MSUAssetStager: Failed to write preSoftwareUpdateStagingDictionary to plist at path: %s\n",  v17,  v18,  v19,  v20,  v21,  (char)"/private/var/MobileSoftwareUpdate/PreSoftwareUpdateAssetStaging.plist"");
    }
  }

+ (void)purgeStagedAssets
{
}

+ (void)purgeStagedAssetsAsync
{
}

+ (void)_purgeStagedAssetsSynchronously:(BOOL)a3
{
  BOOL v3 = a3;
  if (objc_opt_class(&OBJC_CLASS___MAAutoAsset))
  {
    if (v3)
    {
      if ((objc_opt_respondsToSelector(&OBJC_CLASS___MAAutoAsset, "stagePurgeAllSync") & 1) != 0)
      {
        if (+[MSUAssetStager isPurgingEnabled](&OBJC_CLASS___MSUAssetStager, "isPurgingEnabled"))
        {
          logfunction( ",  1,  @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging purge starting (synchronously)\n"",  v4,  v5,  v6,  v7,  v8,  v11);
          id v9 = +[MAAutoAsset stagePurgeAllSync](&OBJC_CLASS___MAAutoAsset, "stagePurgeAllSync");
          if (v9)
          {
            logfunction( ",  1,  @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging failed to complete purge with error: %@\n"",  v4,  v5,  v6,  v7,  v8,  (char)v9);
            return;
          }

          uint64_t v10 = @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging completed purge successfully\n";
          goto LABEL_14;
        }

        goto LABEL_13;
      }

      uint64_t v10 = @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging cannot proceed as MAAutoAsset class does respond to required selector (stagePurgeAllSync)\n";
    }

    else
    {
      if ((objc_opt_respondsToSelector(&OBJC_CLASS___MAAutoAsset, "stagePurgeAll:") & 1) != 0)
      {
        if (+[MSUAssetStager isPurgingEnabled](&OBJC_CLASS___MSUAssetStager, "isPurgingEnabled"))
        {
          logfunction( ",  1,  @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging purge starting (asynchronously)\n"",  v4,  v5,  v6,  v7,  v8,  v11);
          +[MAAutoAsset stagePurgeAll:](&OBJC_CLASS___MAAutoAsset, "stagePurgeAll:", &__block_literal_global_114);
          return;
        }

void __50__MSUAssetStager__purgeStagedAssetsSynchronously___block_invoke(id a1, NSError *a2)
{
  if (a2) {
    logfunction( ",  1,  @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging failed to complete purge with error: %@\n"",  v2,  v3,  v4,  v5,  v6,  (char)a2);
  }
  else {
    logfunction( ",  1,  @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging completed purge successfully\n"",  v2,  v3,  v4,  v5,  v6,  v7);
  }
}

+ (BOOL)isPurgingEnabled
{
  LOBYTE(v10) = 1;
  BOOL v7 = +[MSUAssetStager _isEnabledWithAdditionalIndicators:options:updateAttributes:snapshotPrepare:splat:sfr:purging:]( &OBJC_CLASS___MSUAssetStager,  "_isEnabledWithAdditionalIndicators:options:updateAttributes:snapshotPrepare:splat:sfr:purging:",  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v10);
  uint64_t v8 = "not enabled";
  if (v7) {
    uint64_t v8 = "enabled";
  }
  logfunction( ",  1,  @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging is %s for purging\n"",  v2,  v3,  v4,  v5,  v6,  (char)v8);
  return v7;
}

+ (BOOL)isStagingEnabledForOptions:(id)a3 updateAttributes:(id)a4 snapshotPrepare:(BOOL)a5 splat:(BOOL)a6 sfr:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v29 = 0LL;
  int v12 = MANonUserInitiatedDownloadsAllowed(&v29, a2);
  if (v29) {
    int v18 = 0;
  }
  else {
    int v18 = v12;
  }
  if ((v18 & 1) == 0) {
    logfunction( ",  1,  @"MSUAssetStager: Failed to check if non-User Initiated Downloads are allowed with error: %@\n"",  v13,  v14,  v15,  v16,  v17,  v29);
  }
  LOBYTE(v28) = 0;
  unsigned int v19 = +[MSUAssetStager _isEnabledWithAdditionalIndicators:options:updateAttributes:snapshotPrepare:splat:sfr:purging:]( &OBJC_CLASS___MSUAssetStager,  "_isEnabledWithAdditionalIndicators:options:updateAttributes:snapshotPrepare:splat:sfr:purging:",  1LL,  a3,  a4,  v9,  v8,  v7,  v28);
  if (-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  @"/private/var/MobileSoftwareUpdate/PreSoftwareUpdateAssetStaging.plist"))
  {
    logfunction( ",  1,  @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging found preSoftwareUpdateStagingPlist at path: %s\n",  v20,  v21,  v22,  v23,  v24,  (char)"/private/var/MobileSoftwareUpdate/PreSoftwareUpdateAssetStaging.plist"");
    LOBYTE(v25) = 0;
    uint64_t v26 = "not enabled";
  }

  else
  {
    int v25 = v19 & v18;
    uint64_t v26 = "not enabled";
    if (v25) {
      uint64_t v26 = "enabled";
    }
  }

  logfunction( ",  1,  @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging is %s for downloads and staging\n"",  v20,  v21,  v22,  v23,  v24,  (char)v26);
  return v25 & 1;
}

+ (BOOL)_preSUStagingSupportedInSUCore
{
  return 0;
}

+ (BOOL)_isEnabledWithAdditionalIndicators:(BOOL)a3 options:(id)a4 updateAttributes:(id)a5 snapshotPrepare:(BOOL)a6 splat:(BOOL)a7 sfr:(BOOL)a8 purging:(BOOL)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  BOOL v11 = a6;
  BOOL v13 = a3;
  if (+[MSUAssetStager _preSUStagingSupportedInSUCore]( &OBJC_CLASS___MSUAssetStager,  "_preSUStagingSupportedInSUCore",  a3,  a4))
  {
    BOOL v19 = !a9;
  }

  else
  {
    BOOL v19 = 0;
  }

  if (v19)
  {
    BOOL v23 = 0;
    uint64_t v22 = @"MSUAssetStager: Only purging is enabled\n";
    goto LABEL_8;
  }

  uint64_t AppBooleanValueWithDefaultValue = _MSUPreferencesGetAppBooleanValueWithDefaultValue( @"DisablePreSoftwareUpdateAssetStaging",  0);
  if ((_DWORD)AppBooleanValueWithDefaultValue)
  {
    BOOL v23 = 0;
    uint64_t v22 = @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging disabled via on-device default; skipping staging\n";
    goto LABEL_8;
  }

  if (v13)
  {
    id v25 = [a5 objectForKey:@"DisablePreSoftwareUpdateAssetStaging"];
    uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSNumber);
    uint64_t AppBooleanValueWithDefaultValue = objc_opt_isKindOfClass(v25, v26);
    if ((AppBooleanValueWithDefaultValue & 1) != 0)
    {
      uint64_t AppBooleanValueWithDefaultValue = (uint64_t)[v25 BOOLValue];
      BOOL v23 = 0;
      int v27 = AppBooleanValueWithDefaultValue | (v10 || v9);
      uint64_t v28 = @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging is disabled for sfr updates\n";
      if (v10) {
        uint64_t v28 = @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging is disabled for splat updates\n";
      }
      if ((_DWORD)AppBooleanValueWithDefaultValue) {
        uint64_t v28 = @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging is disabled via asset attributes\n";
      }
      if (v27) {
        uint64_t v22 = v28;
      }
      else {
        uint64_t v22 = @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging is only enabled for snapshot based updates\n";
      }
      if ((v27 & 1) != 0 || !v11) {
        goto LABEL_8;
      }
    }

    else
    {
      BOOL v23 = 0;
      uint64_t v29 = @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging is only enabled for snapshot based updates\n";
      if (v9) {
        uint64_t v29 = @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging is disabled for sfr updates\n";
      }
      if (v10) {
        uint64_t v22 = @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging is disabled for splat updates\n";
      }
      else {
        uint64_t v22 = v29;
      }
      if (!v11 || v9 || v10) {
        goto LABEL_8;
      }
    }
  }

  if ((msu_running_in_limited_environment(AppBooleanValueWithDefaultValue, v21, (uint64_t)v22, v14, v15, v16, v17, v18) & 1) != 0)
  {
    BOOL v23 = 0;
    uint64_t v22 = @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging is not enabled running in limited environments\n";
  }

  else
  {
    if (a5)
    {
      if (!+[MSUAssetStager buildVersionFromAttributes:]( &OBJC_CLASS___MSUAssetStager,  "buildVersionFromAttributes:",  a5))
      {
        BOOL v23 = 0;
        uint64_t v22 = @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging requires a build version\n";
        goto LABEL_8;
      }

      if (!+[MSUAssetStager osVersionFromAttributes:](&OBJC_CLASS___MSUAssetStager, "osVersionFromAttributes:", a5))
      {
        BOOL v23 = 0;
        uint64_t v22 = @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging requires an os version\n";
        goto LABEL_8;
      }
    }

    BOOL v23 = 1;
    uint64_t v22 = @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging passed environment pre-checks\n";
  }

+ (id)buildVersionFromAttributes:(id)a3
{
  id v3 = [a3 objectForKey:@"Build"];
  if (!v3) {
    return 0LL;
  }
  uint64_t v4 = v3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0) {
    return 0LL;
  }
  return v4;
}

+ (id)osVersionFromAttributes:(id)a3
{
  id v3 = [a3 objectForKey:@"OSVersion"];
  if (v3)
  {
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    {
      if ((unint64_t)[v3 length] >= 4
        && objc_msgSend(v3, "rangeOfString:options:range:", @"9.9.", 0, 0, 4) != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        return objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", 0, 4, &stru_1000643C8);
      }
    }

    else
    {
      return 0LL;
    }
  }

  return v3;
}

+ (id)trainNameFromAttributes:(id)a3
{
  id v3 = [a3 objectForKey:@"TrainName"];
  if (!v3) {
    return 0LL;
  }
  uint64_t v4 = v3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0) {
    return 0LL;
  }
  return v4;
}

+ (id)restoreVersionFromAttributes:(id)a3
{
  id v3 = [a3 objectForKey:@"RestoreVersion"];
  if (!v3) {
    return 0LL;
  }
  uint64_t v4 = v3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0) {
    return 0LL;
  }
  return v4;
}

+ (id)buildVersionFromInfoPlist:(id)a3
{
  id v3 = [a3 objectForKey:@"TargetUpdate"];
  if (!v3) {
    return 0LL;
  }
  uint64_t v4 = v3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0) {
    return 0LL;
  }
  return v4;
}

+ (id)osVersionFromInfoPlist:(id)a3
{
  id v3 = [a3 objectForKey:@"ProductVersion"];
  if (v3)
  {
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    {
      if ((unint64_t)[v3 length] >= 4
        && objc_msgSend(v3, "rangeOfString:options:range:", @"9.9.", 0, 0, 4) != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        return objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", 0, 4, &stru_1000643C8);
      }
    }

    else
    {
      return 0LL;
    }
  }

  return v3;
}

+ (BOOL)_checkAndLogLocalError:(id)a3 outError:(id *)a4
{
  if (a3)
  {
    logfunction(", 1, @"MSUAssetStager: Failed with error %@\n"", (uint64_t)a4, v4, v5, v6, v7, (char)a3);
    id v10 = a3;
    if (!a4) {
      return a3 == 0LL;
    }
    goto LABEL_6;
  }

  if (a4)
  {
    id v10 = 0LL;
LABEL_6:
    *a4 = v10;
  }

  return a3 == 0LL;
}

@end
@interface MCNewRestrictionsPayloadHandler
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (BOOL)isInstalled;
- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4;
- (void)didRemoveOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4;
@end

@implementation MCNewRestrictionsPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kMCInstallProfileOptionIsInstalledByMDM]);
  unsigned __int8 v11 = [v10 BOOLValue];

  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 restrictions]);
  if ((v11 & 1) != 0) {
    goto LABEL_2;
  }
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "restrictedBoolForFeature:withRestrictionsDictionary:",  MCFeatureManagedWriteUnmanagedContactsAllowed,  v12) == 1)
  {
LABEL_15:
    id v25 = (id)objc_claimAutoreleasedReturnValue(+[MCInstaller notInstalledByMDMError](&OBJC_CLASS___MCInstaller, "notInstalledByMDMError"));
    goto LABEL_36;
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManager intersectedValuesForFeature:withRestrictionsDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "intersectedValuesForFeature:withRestrictionsDictionary:",  MCFeatureAllowedExternalIntelligenceWorkspaceIDs,  v12));
  if (v26)
  {

    goto LABEL_15;
  }

  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "restrictedBoolForFeature:withRestrictionsDictionary:",  MCFeatureUnmanagedReadManagedContactsAllowed,  v12) == 1) {
    goto LABEL_15;
  }
LABEL_2:
  uint64_t v13 = MCEffectiveSingleAppModeBundleID();
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManager intersectedValuesForFeature:withRestrictionsDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "intersectedValuesForFeature:withRestrictionsDictionary:",  MCFeatureAppLockBundleIDs,  v12));
    v16 = v15;
    if (v15 && ([v15 containsObject:v14] & 1) == 0)
    {
      uint64_t v34 = MCRestrictionsErrorDomain;
      uint64_t v35 = MCErrorArray(@"RESTRICTION_ERROR_ALLOW_LIST_CONFLICTS_WITH_APPLOCK");
      v72 = self;
      v36 = a6;
      v37 = v16;
      id v38 = v8;
      v39 = (void *)objc_claimAutoreleasedReturnValue(v35);
      v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v34,  3002LL,  v39,  MCErrorTypeFatal,  v14,  0LL));
      id v25 = [v40 MCCopyAsPrimaryError];

      id v8 = v38;
      v16 = v37;
      a6 = v36;
      self = v72;
    }

    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManager unionValuesForFeature:withRestrictionsDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "unionValuesForFeature:withRestrictionsDictionary:",  MCFeatureBlacklistedAppBundleIDs,  v12));
      v73 = v17;
      if ([v17 containsObject:v14])
      {
        uint64_t v18 = MCRestrictionsErrorDomain;
        uint64_t v19 = MCErrorArray(@"RESTRICTION_ERROR_DNEY_LIST_CONFLICTS_WITH_APPLOCK");
        v70 = self;
        v20 = a6;
        v21 = v16;
        id v22 = v8;
        v23 = (void *)objc_claimAutoreleasedReturnValue(v19);
        v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v18,  3003LL,  v23,  MCErrorTypeFatal,  v14,  0LL));
        id v25 = [v24 MCCopyAsPrimaryError];

        v17 = v73;
        id v8 = v22;
        v16 = v21;
        a6 = v20;
        self = v70;
      }

      else
      {
        id v71 = v8;
        v27 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManager unionValuesForFeature:withRestrictionsDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "unionValuesForFeature:withRestrictionsDictionary:",  MCFeatureBlockedAppBundleIDs,  v12));
        if ([v27 containsObject:v14])
        {
          v28 = v27;
          uint64_t v29 = MCRestrictionsErrorDomain;
          uint64_t v30 = MCErrorArray(@"RESTRICTION_ERROR_DNEY_LIST_CONFLICTS_WITH_APPLOCK");
          id v31 = (id)objc_claimAutoreleasedReturnValue(v30);
          uint64_t v32 = v29;
          v27 = v28;
          v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v32,  3003LL,  v31,  MCErrorTypeFatal,  v14,  0LL));
          id v25 = [v33 MCCopyAsPrimaryError];

          v17 = v73;
        }

        else
        {
          __int128 v74 = 0u;
          __int128 v75 = 0u;
          __int128 v76 = 0u;
          __int128 v77 = 0u;
          id v31 = (id)objc_claimAutoreleasedReturnValue( +[MCRestrictionManager explicitlyRestrictedAppsBySetting]( &OBJC_CLASS___MCRestrictionManager,  "explicitlyRestrictedAppsBySetting"));
          id v25 = [v31 countByEnumeratingWithState:&v74 objects:v82 count:16];
          if (v25)
          {
            v66 = a6;
            v68 = v27;
            v65 = v16;
            uint64_t v41 = *(void *)v75;
            while (2)
            {
              for (i = 0LL; i != v25; i = (char *)i + 1)
              {
                if (*(void *)v75 != v41) {
                  objc_enumerationMutation(v31);
                }
                uint64_t v43 = *(void *)(*((void *)&v74 + 1) + 8LL * (void)i);
                v44 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKeyedSubscript:v43]);
                if ([v44 containsObject:v14]
                  && +[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "restrictedBoolForFeature:withRestrictionsDictionary:",  v43,  v12) == 2)
                {
                  uint64_t v45 = MCRestrictionsErrorDomain;
                  uint64_t v46 = MCErrorArray(@"RESTRICTION_ERROR_RESTRICTION_CONFLICTS_WITH_APPLOCK");
                  v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
                  v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v45,  3004LL,  v47,  MCErrorTypeFatal,  v14,  0LL));
                  id v25 = [v48 MCCopyAsPrimaryError];

                  goto LABEL_27;
                }
              }

              id v25 = [v31 countByEnumeratingWithState:&v74 objects:v82 count:16];
              if (v25) {
                continue;
              }
              break;
            }

- (BOOL)isInstalled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 restrictions]);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentRestrictions]);
  id v6 =  +[MCRestrictionManagerWriter restrictionsAfterApplyingRestrictionsDictionary:toRestrictionsDictionary:outChangeDetected:outError:]( &OBJC_CLASS___MCRestrictionManagerWriter,  "restrictionsAfterApplyingRestrictionsDictionary:toRestrictionsDictionary:outChangeDetected:outError:",  v3,  v5,  &v8,  0LL);

  return v8 == 0;
}

- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MCNewRestrictionsPayloadHandler;
  id v5 = a4;
  id v6 = a3;
  -[MCNewPayloadHandler didInstallOldGlobalRestrictions:newGlobalRestrictions:]( &v18,  "didInstallOldGlobalRestrictions:newGlobalRestrictions:",  v6,  v5);
  uint64_t v7 = MCRestrictedBoolKey;
  char v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", MCRestrictedBoolKey, v18.receiver, v18.super_class));

  uint64_t v9 = MCFeaturePredictiveKeyboardAllowed;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:MCFeaturePredictiveKeyboardAllowed]);

  uint64_t v11 = MCRestrictedBoolValueKey;
  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:MCRestrictedBoolValueKey]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v7]);

  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v9]);
  uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 objectForKey:v11]);
  v16 = (void *)v15;
  if (!v12)
  {
    if (!v15) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }

  else {
    BOOL v17 = 1;
  }
  if (!v17)
  {
LABEL_9:
  }

- (void)didRemoveOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MCNewRestrictionsPayloadHandler;
  id v5 = a4;
  id v6 = a3;
  -[MCNewPayloadHandler didRemoveOldGlobalRestrictions:newGlobalRestrictions:]( &v16,  "didRemoveOldGlobalRestrictions:newGlobalRestrictions:",  v6,  v5);
  uint64_t v7 = MCRestrictedBoolKey;
  char v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", MCRestrictedBoolKey, v16.receiver, v16.super_class));

  uint64_t v9 = MCFeaturePredictiveKeyboardAllowed;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:MCFeaturePredictiveKeyboardAllowed]);

  uint64_t v11 = MCRestrictedBoolValueKey;
  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:MCRestrictedBoolValueKey]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v7]);

  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v9]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v11]);
  if (v12
    && ([v12 BOOLValue] & 1) == 0
    && (!v15 || [v15 BOOLValue]))
  {
    MCSendKeyboardSettingsChangedNotification();
  }
}

@end
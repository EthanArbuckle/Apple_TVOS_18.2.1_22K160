@interface MCUIAppSigner
+ (id)_uppProfilesBySignerIDWithOutFreeDevProfilesBySignerID:(id *)a3;
+ (id)enterpriseAppSignersWithOutDeveloperAppSigners:(id *)a3;
+ (void)_addProfile:(id)a3 toSignerIdentity:(id)a4 inDictionary:(id)a5;
- (BOOL)hasFreePP;
- (BOOL)hasUniversalPP;
- (BOOL)isAppRemovalAllowed;
- (BOOL)isEnterpriseAppTrustAllowed;
- (BOOL)isTrustable;
- (BOOL)isTrusted;
- (MCUIAppSigner)initWithIdentity:(id)a3 applications:(id)a4 provisioningProfiles:(id)a5 hasUPP:(BOOL)a6 hasFreePP:(BOOL)a7;
- (NSArray)applications;
- (NSArray)provisioningProfiles;
- (NSString)displayName;
- (NSString)identity;
- (int64_t)almostUntrustedAppCount;
- (int64_t)untrustedAppCount;
- (void)_updateUntrustedAppCountsForBundleIDs:(id)a3;
- (void)main_removeMCUIReferenceForBundleID:(id)a3;
- (void)refreshApplications;
- (void)setIdentity:(id)a3;
@end

@implementation MCUIAppSigner

- (MCUIAppSigner)initWithIdentity:(id)a3 applications:(id)a4 provisioningProfiles:(id)a5 hasUPP:(BOOL)a6 hasFreePP:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___MCUIAppSigner;
  v16 = -[MCUIAppSigner init](&v23, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_identity, a3);
    v18 = (NSArray *)[v14 mutableCopy];
    applications = v17->_applications;
    v17->_applications = v18;

    objc_storeStrong((id *)&v17->_provisioningProfiles, a5);
    v17->_hasUniversalPP = v8;
    v17->_hasFreePP = v7;
    uint64_t v20 = objc_claimAutoreleasedReturnValue( +[MDMProvisioningProfileTrust developerFromIdentity:hasFreePP:hasUPP:]( &OBJC_CLASS___MDMProvisioningProfileTrust,  "developerFromIdentity:hasFreePP:hasUPP:",  v13,  v7,  v8));
    displayName = v17->_displayName;
    v17->_displayName = (NSString *)v20;

    -[MCUIAppSigner refreshApplications](v17, "refreshApplications");
  }

  return v17;
}

- (void)setIdentity:(id)a3
{
  BOOL v7 = (NSString *)a3;
  if (self->_identity != v7)
  {
    objc_storeStrong((id *)&self->_identity, a3);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue( +[MDMProvisioningProfileTrust developerFromIdentity:hasFreePP:hasUPP:]( &OBJC_CLASS___MDMProvisioningProfileTrust,  "developerFromIdentity:hasFreePP:hasUPP:",  v7,  self->_hasFreePP,  self->_hasUniversalPP));
    displayName = self->_displayName;
    self->_displayName = v5;
  }
}

- (void)refreshApplications
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[MCUIAppSigner applications](self, "applications"));
  -[MCUIAppSigner _updateUntrustedAppCountsForBundleIDs:](self, "_updateUntrustedAppCountsForBundleIDs:", v3);
}

- (void)_updateUntrustedAppCountsForBundleIDs:(id)a3
{
  id v15 = a3;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCUIAppSigner applications](self, "applications"));
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    int64_t v7 = 0LL;
    int64_t v8 = 0LL;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
        v12 = objc_autoreleasePoolPush();
        id v13 = [[DMCApplicationProxy alloc] initWithBundleID:v11 dataSource:0];
        id v14 = (char *)[v13 misStateIncludingPending:1];
        if ((unint64_t)(v14 - 2) >= 2)
        {
          if (v14 == (_BYTE *)&dword_0 + 1)
          {
            ++v7;
          }

          else
          {
            if (v14 == (_BYTE *)&dword_4 + 1)
            {

              objc_autoreleasePoolPop(v12);
              goto LABEL_16;
            }

            ++v8;
          }
        }

        objc_autoreleasePoolPop(v12);
      }

      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  else
  {
    int64_t v7 = 0LL;
    int64_t v8 = 0LL;
  }

- (void)main_removeMCUIReferenceForBundleID:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_15A78;
  v6[3] = &unk_28E20;
  objc_copyWeak(&v9, &location);
  id v7 = v4;
  int64_t v8 = self;
  id v5 = v4;
  dispatch_sync(&_dispatch_main_q, v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (BOOL)isTrusted
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 trustedCodeSigningIdentities]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCUIAppSigner identity](self, "identity"));
  unsigned int v6 = [v4 containsObject:v5];

  if (!v6) {
    return 0;
  }
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCUIAppSigner provisioningProfiles](self, "provisioningProfiles"));
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 uuid]);
        id v14 = [v13 length];

        if (v14)
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 uuid]);
          unsigned int v16 = +[MDMProvisioningProfileTrust isTrustedProvisioningProfileUUID:]( &OBJC_CLASS___MDMProvisioningProfileTrust,  "isTrustedProvisioningProfileUUID:",  v15);

          if (!v16)
          {
            BOOL v17 = 0;
            goto LABEL_15;
          }
        }

        else
        {
          NSLog(@"MCUIAppSigner: Could not find profile UUID for provisioning profile %@", v12);
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v9);
  }

  BOOL v17 = 1;
LABEL_15:

  return v17;
}

- (BOOL)isAppRemovalAllowed
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  BOOL v3 = [v2 effectiveBoolValueForSetting:MCFeatureAppRemovalAllowed] != 2;

  return v3;
}

- (BOOL)isEnterpriseAppTrustAllowed
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  BOOL v3 = [v2 effectiveBoolValueForSetting:MCFeatureEnterpriseAppTrustAllowed] != 2;

  return v3;
}

- (BOOL)isTrustable
{
  if (-[MCUIAppSigner isTrusted](self, "isTrusted")
    && -[MCUIAppSigner isAppRemovalAllowed](self, "isAppRemovalAllowed"))
  {
    return 1;
  }

  if (-[MCUIAppSigner isTrusted](self, "isTrusted")) {
    return 0;
  }
  return -[MCUIAppSigner isEnterpriseAppTrustAllowed](self, "isEnterpriseAppTrustAllowed");
}

+ (id)enterpriseAppSignersWithOutDeveloperAppSigners:(id *)a3
{
  BOOL v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v73 = 0LL;
  v60 = (void *)objc_claimAutoreleasedReturnValue( +[MCUIAppSigner _uppProfilesBySignerIDWithOutFreeDevProfilesBySignerID:]( &OBJC_CLASS___MCUIAppSigner,  "_uppProfilesBySignerIDWithOutFreeDevProfilesBySignerID:",  &v73));
  id v59 = v73;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 managedAppIDs]);

  __int128 v71 = 0u;
  __int128 v72 = 0u;
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[DMCApplicationProxy userApplications](&OBJC_CLASS___DMCApplicationProxy, "userApplications"));
  v52 = v5;
  id v57 = [v6 countByEnumeratingWithState:&v69 objects:v76 count:16];
  if (v57)
  {
    uint64_t v7 = *(void *)v70;
    v53 = v3;
    uint64_t v50 = *(void *)v70;
    v51 = v6;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v70 != v7) {
          objc_enumerationMutation(v6);
        }
        id v9 = *(void **)(*((void *)&v69 + 1) + 8LL * (void)v8);
        uint64_t v10 = objc_autoreleasePoolPush();
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 signerID]);

        if (v11)
        {
          unsigned __int8 v12 = [v9 isInstalled];
          uint64_t v13 = objc_claimAutoreleasedReturnValue([v9 bundleID]);
          id v14 = (void *)v13;
          if ((v12 & 1) != 0)
          {
            unsigned int v15 = [v5 containsObject:v13];

            if (v15)
            {
              id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleID]);
              NSLog(@"MCUIAppSigner: Ignoring potential app signer for app %@: App is managed", v14);
            }

            else
            {
              unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v9 signerID]);
              id v14 = (void *)objc_claimAutoreleasedReturnValue([v60 objectForKey:v16]);

              BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v9 signerID]);
              uint64_t v18 = objc_claimAutoreleasedReturnValue([v59 objectForKey:v17]);

              __int128 v19 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
              __int128 v20 = v19;
              if (v14) {
                -[NSMutableArray addObjectsFromArray:](v19, "addObjectsFromArray:", v14);
              }
              if (v18) {
                -[NSMutableArray addObjectsFromArray:](v20, "addObjectsFromArray:", v18);
              }
              id v55 = (id)v18;
              __int128 v67 = 0u;
              __int128 v68 = 0u;
              __int128 v65 = 0u;
              __int128 v66 = 0u;
              __int128 v21 = v20;
              id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v65,  v75,  16LL);
              if (v22)
              {
                id v23 = v22;
                uint64_t v24 = *(void *)v66;
                while (2)
                {
                  for (i = 0LL; i != v23; i = (char *)i + 1)
                  {
                    if (*(void *)v66 != v24) {
                      objc_enumerationMutation(v21);
                    }
                    v26 = *(void **)(*((void *)&v65 + 1) + 8LL * (void)i);
                    if (([v26 isAppleInternal] & 1) != 0
                      || (unsigned int v27 = [v9 isBetaApp],
                          v27 == [v26 isBeta])
                      && (v28 = (void *)objc_claimAutoreleasedReturnValue([v9 appIDEntitlement]),
                          unsigned int v29 = [v26 allowsAppIDEntitlement:v28],
                          v28,
                          v29))
                    {
                      v32 = (void *)objc_claimAutoreleasedReturnValue([v9 signerID]);
                      BOOL v3 = v53;
                      v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v53, "objectForKey:", v32));

                      if (v33)
                      {
                        v34 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleID]);
                        [v33 addObject:v34];
                      }

                      else
                      {
                        v35 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleID]);
                        v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithObject:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObject:",  v35));

                        v34 = (void *)objc_claimAutoreleasedReturnValue([v9 signerID]);
                        -[NSMutableDictionary setObject:forKey:](v53, "setObject:forKey:", v33, v34);
                      }

                      goto LABEL_33;
                    }

                    v30 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleID]);
                    v31 = (void *)objc_claimAutoreleasedReturnValue([v9 appIDEntitlement]);
                    NSLog( @"MCUIAppSigner: Skipping potential app signer for app %@: App ID entitlement does not match: %@",  v30,  v31);
                  }

                  id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v65,  v75,  16LL);
                  BOOL v3 = v53;
                  if (v23) {
                    continue;
                  }
                  break;
                }
              }

+ (void)_addProfile:(id)a3 toSignerIdentity:(id)a4 inDictionary:(id)a5
{
  id v10 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v7]);
  if (!v9)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    [v8 setObject:v9 forKey:v7];
  }

  [v9 addObject:v10];
}

+ (id)_uppProfilesBySignerIDWithOutFreeDevProfilesBySignerID:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1658C;
  v11[3] = &unk_28E48;
  id v6 = v4;
  id v12 = v6;
  id v7 = v5;
  id v13 = v7;
  +[MDMProvisioningProfileTrust enumerateProvisioningProfilesWithBlock:]( &OBJC_CLASS___MDMProvisioningProfileTrust,  "enumerateProvisioningProfilesWithBlock:",  v11);
  if (a3) {
    *a3 = v7;
  }
  id v8 = v13;
  id v9 = v6;

  return v9;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)identity
{
  return self->_identity;
}

- (NSArray)applications
{
  return self->_applications;
}

- (NSArray)provisioningProfiles
{
  return self->_provisioningProfiles;
}

- (BOOL)hasFreePP
{
  return self->_hasFreePP;
}

- (BOOL)hasUniversalPP
{
  return self->_hasUniversalPP;
}

- (int64_t)untrustedAppCount
{
  return self->_untrustedAppCount;
}

- (int64_t)almostUntrustedAppCount
{
  return self->_almostUntrustedAppCount;
}

- (void).cxx_destruct
{
}

@end
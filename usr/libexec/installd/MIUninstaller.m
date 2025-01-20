@interface MIUninstaller
+ (id)uninstallerForIdentities:(id)a3 withOptions:(id)a4 forClient:(id)a5;
- (BOOL)_removeAllReferencesForCurrentUser:(id)a3 wasLastReference:(BOOL *)a4 error:(id *)a5;
- (BOOL)_removeReferenceForBundleWithIdentity:(id)a3 linkedToChildren:(id)a4 temporaryReference:(id)a5 removedInfo:(id)a6 wasLastReference:(BOOL *)a7 gatherOptions:(unint64_t *)a8 error:(id *)a9;
- (BOOL)_uninstallUserStuffForIdentity:(id)a3 error:(id *)a4;
- (BOOL)performUninstallationByRevokingTemporaryReference:(id)a3 error:(id *)a4;
- (BOOL)performUninstallationWithError:(id *)a3;
- (MIClientConnection)client;
- (MIUninstaller)initWithIdentitites:(id)a3 options:(id)a4 forClient:(id)a5;
- (NSArray)identities;
- (NSArray)receipt;
- (NSDictionary)options;
- (id)_uninstallBundleWithIdentity:(id)a3 linkedToChildren:(id)a4 waitForDeletion:(BOOL)a5 uninstallReason:(id)a6 temporaryReference:(id)a7 deleteDataContainers:(BOOL)a8 wasLastReference:(BOOL *)a9 error:(id *)a10;
- (unsigned)percentComplete;
- (void)_fireCallbackWithStatus:(id)a3;
- (void)_fireCallbackWithStatus:(id)a3 percentComplete:(unsigned int)a4;
- (void)setPercentComplete:(unsigned int)a3;
@end

@implementation MIUninstaller

- (MIUninstaller)initWithIdentitites:(id)a3 options:(id)a4 forClient:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MIUninstaller;
  v12 = -[MIUninstaller init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identities, a3);
    objc_storeStrong((id *)&v13->_options, a4);
    objc_storeStrong((id *)&v13->_client, a5);
  }

  return v13;
}

+ (id)uninstallerForIdentities:(id)a3 withOptions:(id)a4 forClient:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)objc_opt_class(a1)) initWithIdentitites:v10 options:v9 forClient:v8];

  return v11;
}

- (void)_fireCallbackWithStatus:(id)a3 percentComplete:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v10[0] = @"Status";
  v10[1] = @"PercentComplete";
  v11[0] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[MIUninstaller percentComplete](self, "percentComplete")));
  v11[1] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  2LL));

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstaller client](self, "client"));
  [v9 sendProgressWithDictionary:v8];
}

- (void)_fireCallbackWithStatus:(id)a3
{
  id v4 = a3;
  -[MIUninstaller _fireCallbackWithStatus:percentComplete:]( self,  "_fireCallbackWithStatus:percentComplete:",  v4,  -[MIUninstaller percentComplete](self, "percentComplete"));
}

- (BOOL)_uninstallUserStuffForIdentity:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleID]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 personaUniqueString]);
  id v27 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[MIContainer allContainersForIdentifier:persona:options:error:]( &OBJC_CLASS___MIContainer,  "allContainersForIdentifier:persona:options:error:",  v6,  v7,  2LL,  &v27));
  id v9 = v27;

  if (v8)
  {
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
    {
      id v21 = v5;
      MOLogWrite(qword_100095BF8);
    }

    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v11 = v8;
    id v12 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v24;
LABEL_7:
      objc_super v15 = 0LL;
      v16 = v9;
      while (1)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        v17 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)v15);
        id v22 = v16;
        unsigned int v18 = objc_msgSend(v17, "purgeContentWithError:", &v22, v21);
        id v9 = v22;

        if (!v18) {
          break;
        }
        objc_super v15 = (char *)v15 + 1;
        v16 = v9;
        if (v13 == v15)
        {
          id v13 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
          LOBYTE(v18) = 1;
          if (v13) {
            goto LABEL_7;
          }
          break;
        }
      }
    }

    else
    {
      LOBYTE(v18) = 1;
    }
  }

  else
  {
    id v19 = sub_1000130F4( (uint64_t)"-[MIUninstaller _uninstallUserStuffForIdentity:error:]",  102LL,  MIInstallerErrorDomain,  26LL,  v9,  0LL,  @"Could not get containers with identity %@",  v10,  (uint64_t)v5);
    LOBYTE(v18) = 0;
    id v11 = v9;
    id v9 = (id)objc_claimAutoreleasedReturnValue(v19);
  }

  if (a4 && (v18 & 1) == 0) {
    *a4 = v9;
  }

  return v18;
}

- (BOOL)_removeAllReferencesForCurrentUser:(id)a3 wasLastReference:(BOOL *)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MIAppReferenceManager defaultManager](&OBJC_CLASS___MIAppReferenceManager, "defaultManager"));
  id v14 = 0LL;
  unsigned __int8 v9 = [v8 removeAllReferencesForIdentifier:v7 inDomain:2 forUserWithID:sub_10000D79C() wasLastReference:a4 error:&v14];
  id v10 = v14;

  if (a5 && (v9 & 1) == 0)
  {
    id v12 = sub_1000130F4( (uint64_t)"-[MIUninstaller _removeAllReferencesForCurrentUser:wasLastReference:error:]",  141LL,  MIInstallerErrorDomain,  25LL,  v10,  0LL,  @"Failed to delete all the references associated with %@",  v11,  (uint64_t)v7);
    *a5 = (id)objc_claimAutoreleasedReturnValue(v12);
  }

  return v9;
}

- (BOOL)_removeReferenceForBundleWithIdentity:(id)a3 linkedToChildren:(id)a4 temporaryReference:(id)a5 removedInfo:(id)a6 wasLastReference:(BOOL *)a7 gatherOptions:(unint64_t *)a8 error:(id *)a9
{
  id v13 = a3;
  id v60 = a4;
  id v14 = a5;
  id v61 = a6;
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(+[MIAppReferenceManager defaultManager](&OBJC_CLASS___MIAppReferenceManager, "defaultManager"));
  uint64_t v16 = sub_10000D79C();
  BOOL v74 = 0;
  v17 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleID]);
  id v73 = 0LL;
  uint64_t v62 = 3LL;
  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue( +[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:]( &OBJC_CLASS___MIBundleContainer,  "appBundleContainerForIdentifier:inDomain:withError:",  v17,  3LL,  &v73));
  id v19 = v73;
  id v20 = v19;
  if (!v18)
  {
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v19 domain]);
    if ([v27 isEqualToString:MIContainerManagerErrorDomain])
    {
      id v28 = [v20 code];

      if (v28 == (id)21)
      {

        id v72 = 0LL;
        uint64_t v62 = 2LL;
        unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue( +[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:]( &OBJC_CLASS___MIBundleContainer,  "appBundleContainerForIdentifier:inDomain:withError:",  v17,  2LL,  &v72));
        id v20 = v72;
        id v22 = v20;
        if (v18) {
          goto LABEL_2;
        }
      }

      else
      {
        id v22 = v20;
      }
    }

    else
    {
      id v22 = v20;
    }

    v30 = 0LL;
LABEL_25:
    __int128 v24 = 0LL;
    __int128 v25 = 0LL;
    goto LABEL_48;
  }

- (id)_uninstallBundleWithIdentity:(id)a3 linkedToChildren:(id)a4 waitForDeletion:(BOOL)a5 uninstallReason:(id)a6 temporaryReference:(id)a7 deleteDataContainers:(BOOL)a8 wasLastReference:(BOOL *)a9 error:(id *)a10
{
  BOOL v10 = a8;
  BOOL v86 = a5;
  objc_super v15 = a10;
  id v16 = a3;
  id v17 = a4;
  id v89 = a6;
  id v18 = a7;
  v91 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v92 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v16 bundleID]);
  BOOL v114 = 0;
  v88 = (void *)objc_claimAutoreleasedReturnValue([v16 personaUniqueString]);
  if (+[ICLFeatureFlags appReferencesEnabled](&OBJC_CLASS___ICLFeatureFlags, "appReferencesEnabled"))
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v16 bundleID]);
    id v113 = 0LL;
    unsigned __int8 v21 = -[MIUninstaller _removeAllReferencesForCurrentUser:wasLastReference:error:]( self,  "_removeAllReferencesForCurrentUser:wasLastReference:error:",  v20,  &v114,  &v113);
    id v22 = (NSMutableSet *)v113;

    if ((v21 & 1) == 0)
    {
LABEL_34:
      id v39 = 0LL;
      id v40 = 0LL;
      v87 = 0LL;
      goto LABEL_83;
    }

    if (!v114)
    {
      uint64_t v23 = 0LL;
      goto LABEL_11;
    }
  }

  else
  {
    id v22 = 0LL;
    BOOL v114 = 1;
  }

  if (v10) {
    uint64_t v23 = 7LL;
  }
  else {
    uint64_t v23 = 5LL;
  }
  if (_os_feature_enabled_impl("containermanagerd", "multipersona_reconciliation_on_delete"))
  {

    __int128 v24 = 0LL;
    goto LABEL_12;
  }

- (BOOL)performUninstallationWithError:(id *)a3
{
  return -[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]( self,  "performUninstallationByRevokingTemporaryReference:error:",  0LL,  a3);
}

- (BOOL)performUninstallationByRevokingTemporaryReference:(id)a3 error:(id *)a4
{
  id v161 = a3;
  uint64_t v222 = 0LL;
  v223 = &v222;
  uint64_t v224 = 0x3032000000LL;
  v225 = sub_100035338;
  v226 = sub_100035348;
  id v227 = 0LL;
  v184 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  v165 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v171 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  v164 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v183 = (void *)objc_claimAutoreleasedReturnValue( +[MIContainerLinkManager sharedInstanceForDomain:]( &OBJC_CLASS___MIContainerLinkManager,  "sharedInstanceForDomain:",  2LL));
  v175 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v174 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v162 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v220 = 0u;
  __int128 v221 = 0u;
  __int128 v218 = 0u;
  __int128 v219 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstaller identities](self, "identities"));
  id v5 = [v4 countByEnumeratingWithState:&v218 objects:v234 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v219;
LABEL_3:
    uint64_t v7 = 0LL;
    while (1)
    {
      if (*(void *)v219 != v6) {
        objc_enumerationMutation(v4);
      }
      id v8 = *(void **)(*((void *)&v218 + 1) + 8 * v7);
      unsigned __int8 v9 = (id *)(v223 + 5);
      id obj = (id)v223[5];
      unsigned __int8 v10 = [v8 resolvePersonaWithError:&obj];
      objc_storeStrong(v9, obj);
      if ((v10 & 1) == 0) {
        break;
      }
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleID]);
      -[NSMutableArray addObject:](v164, "addObject:", v11);

      if (v5 == (id)++v7)
      {
        id v5 = [v4 countByEnumeratingWithState:&v218 objects:v234 count:16];
        if (!v5) {
          goto LABEL_9;
        }
        goto LABEL_3;
      }
    }

    id v160 = 0LL;
    v169 = 0LL;
    v157 = 0LL;
    goto LABEL_181;
  }

- (NSArray)receipt
{
  return self->_receipt;
}

- (NSArray)identities
{
  return self->_identities;
}

- (NSDictionary)options
{
  return self->_options;
}

- (MIClientConnection)client
{
  return self->_client;
}

- (unsigned)percentComplete
{
  return self->_percentComplete;
}

- (void)setPercentComplete:(unsigned int)a3
{
  self->_percentComplete = a3;
}

- (void).cxx_destruct
{
}

@end
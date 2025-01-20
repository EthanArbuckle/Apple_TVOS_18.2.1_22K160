@interface IDSAccountIdentityElector
- (IDSAccountIdentityElector)initWithKeychainElectionStore:(id)a3 cloudKitElectionStore:(id)a4 groupServerElectionStore:(id)a5;
- (IDSCloudKitKeyElectionStore)cloudKitElectionStore;
- (IDSGroupServerKeyElectionStore)groupServerElectionStore;
- (IDSKeychainKeyElectionStore)keychainElectionStore;
- (id)_fullAccountIdentityWithError:(id *)a3;
- (id)_fullClusterWithAccountIdentityClusterWithAccountIdentity:(id)a3 fullAdminServiceIdentities:(id)a4 fullSigningServiceIdentities:(id)a5 error:(id *)a6;
- (id)_fullServiceIdentityAdminWithAccountIdentity:(id)a3 type:(int64_t)a4 error:(id *)a5;
- (id)_fullServiceIdentitySigningWithAccountIdentity:(id)a3 type:(int64_t)a4 error:(id *)a5;
- (void)_cleanupFailedElectionWithFullAccountIdentityCluster:(id)a3;
- (void)_createAccountKeysWithFullAccountIdentity:(id)a3 serviceTypeNames:(id)a4 oldCluster:(id)a5 completion:(id)a6;
- (void)_getCurrentAccountClusterWithCompletion:(id)a3;
- (void)_getKeysForServiceTypeName:(id)a3 completion:(id)a4;
- (void)_rollAccountKeyWithFullCluster:(id)a3 completion:(id)a4;
- (void)getKeysForServiceTypeName:(id)a3 completion:(id)a4;
- (void)rollAccountKeyWithCompletion:(id)a3;
@end

@implementation IDSAccountIdentityElector

- (IDSAccountIdentityElector)initWithKeychainElectionStore:(id)a3 cloudKitElectionStore:(id)a4 groupServerElectionStore:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___IDSAccountIdentityElector;
  v12 = -[IDSAccountIdentityElector init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_keychainElectionStore, a3);
    objc_storeStrong((id *)&v13->_cloudKitElectionStore, a4);
    objc_storeStrong((id *)&v13->_groupServerElectionStore, a5);
  }

  return v13;
}

- (void)getKeysForServiceTypeName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  id v10 = _os_activity_create( (void *)&_mh_execute_header,  "ElectAccountIdentity",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v10, &state);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog accountIdentity](&OBJC_CLASS___IDSFoundationLog, "accountIdentity"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "!setState serviceTypeName=%@", buf, 0xCu);
  }

  -[IDSAccountIdentityElector _getKeysForServiceTypeName:completion:]( self,  "_getKeysForServiceTypeName:completion:",  v6,  v7);
  os_activity_scope_leave(&state);
  cut_arc_os_release(&v10);
}

- (void)rollAccountKeyWithCompletion:(id)a3
{
  id v4 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  id v9 = _os_activity_create( (void *)&_mh_execute_header,  "RollAccountKey",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v9, &state);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000243E4;
  v6[3] = &unk_1008F66D8;
  id v5 = v4;
  v6[4] = self;
  id v7 = v5;
  -[IDSAccountIdentityElector _getCurrentAccountClusterWithCompletion:]( self,  "_getCurrentAccountClusterWithCompletion:",  v6);

  os_activity_scope_leave(&state);
  cut_arc_os_release(&v9);
}

- (void)_getKeysForServiceTypeName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100024578;
  v9[3] = &unk_1008F6700;
  id v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v6;
  id v8 = v12;
  -[IDSAccountIdentityElector _getCurrentAccountClusterWithCompletion:]( self,  "_getCurrentAccountClusterWithCompletion:",  v9);
}

- (void)_getCurrentAccountClusterWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountIdentityElector cloudKitElectionStore](self, "cloudKitElectionStore"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100024A74;
  v7[3] = &unk_1008F6728;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchAccountIdentityItemWithCompletion:v7];
}

- (void)_rollAccountKeyWithFullCluster:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 fullAccountIdentity]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 fullServiceIdentitiesSigning]);
  id v10 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v9 count]);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      objc_super v15 = 0LL;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v20 + 1) + 8 * (void)v15) identityServiceTypeName]);
        -[NSMutableArray addObject:](v10, "addObject:", v16);

        objc_super v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v13);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100024F08;
  v18[3] = &unk_1008F6750;
  id v19 = v7;
  id v17 = v7;
  -[IDSAccountIdentityElector _createAccountKeysWithFullAccountIdentity:serviceTypeNames:oldCluster:completion:]( self,  "_createAccountKeysWithFullAccountIdentity:serviceTypeNames:oldCluster:completion:",  v8,  v10,  v6,  v18);
}

- (void)_createAccountKeysWithFullAccountIdentity:(id)a3 serviceTypeNames:(id)a4 oldCluster:(id)a5 completion:(id)a6
{
  v72 = (NSMutableArray *)a3;
  v71 = (NSMutableArray *)a4;
  id v10 = (NSMutableArray *)a5;
  v70 = (void (**)(id, void, uint64_t))a6;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v104 = _os_activity_create( (void *)&_mh_execute_header,  "Create account keys",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v104, &state);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog accountIdentity](&OBJC_CLASS___IDSFoundationLog, "accountIdentity"));
  v73 = v10;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Create Account Key", buf, 2u);
  }

  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog accountIdentity](&OBJC_CLASS___IDSFoundationLog, "accountIdentity"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v106 = v72;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "!setState currentIdentity=%@", buf, 0xCu);
  }

  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog accountIdentity](&OBJC_CLASS___IDSFoundationLog, "accountIdentity"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v106 = v71;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "!setState serviceTypeNames=%@", buf, 0xCu);
  }

  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog accountIdentity](&OBJC_CLASS___IDSFoundationLog, "accountIdentity"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v106 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "!setState oldCluster=%@", buf, 0xCu);
  }

  if (v72)
  {
    objc_super v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog accountIdentity](&OBJC_CLASS___IDSFoundationLog, "accountIdentity"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Rolling full identity", buf, 2u);
    }

    uint64_t v102 = 0LL;
    v16 = (id *)&v102;
    uint64_t v17 = objc_claimAutoreleasedReturnValue(-[NSMutableArray rolledAccountIdenityWithError:](v72, "rolledAccountIdenityWithError:", &v102));
  }

  else
  {
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog accountIdentity](&OBJC_CLASS___IDSFoundationLog, "accountIdentity"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Creating new full identity", buf, 2u);
    }

    uint64_t v101 = 0LL;
    v16 = (id *)&v101;
    uint64_t v17 = objc_claimAutoreleasedReturnValue(-[IDSAccountIdentityElector _fullAccountIdentityWithError:](self, "_fullAccountIdentityWithError:", &v101));
  }

  id v19 = (NSMutableArray *)v17;
  __int128 v20 = (NSMutableArray *)*v16;
  __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog accountIdentity](&OBJC_CLASS___IDSFoundationLog, "accountIdentity"));
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v106 = v19;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "!setState newAccountIdentity=%@", buf, 0xCu);
  }

  if (v19)
  {
    v75 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v74 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v99 = 0u;
    __int128 v100 = 0u;
    __int128 v97 = 0u;
    __int128 v98 = 0u;
    __int128 v22 = v71;
    id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v97,  v109,  16LL);
    if (v23)
    {
      uint64_t v24 = *(void *)v98;
      while (2)
      {
        for (i = 0LL; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v98 != v24) {
            objc_enumerationMutation(v22);
          }
          uint64_t v26 = IDSMPServiceIdentityTypeForName(*(void *)(*((void *)&v97 + 1) + 8LL * (void)i));
          v96 = v20;
          v27 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( -[IDSAccountIdentityElector _fullServiceIdentityAdminWithAccountIdentity:type:error:]( self,  "_fullServiceIdentityAdminWithAccountIdentity:type:error:",  v19,  v26,  &v96));
          v28 = v96;

          if (!v27)
          {
            v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog accountIdentity](&OBJC_CLASS___IDSFoundationLog, "accountIdentity"));
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v106 = 0LL;
              _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Failed to create adming identity -- Fail {adminServiceIdentity: %{public}@}",  buf,  0xCu);
            }

            v70[2](v70, 0LL, 131073LL);
            goto LABEL_70;
          }

          v95 = v28;
          v29 = (void *)objc_claimAutoreleasedReturnValue( -[IDSAccountIdentityElector _fullServiceIdentitySigningWithAccountIdentity:type:error:]( self,  "_fullServiceIdentitySigningWithAccountIdentity:type:error:",  v19,  v26,  &v95));
          __int128 v20 = v95;

          if (!v29)
          {
            v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog accountIdentity](&OBJC_CLASS___IDSFoundationLog, "accountIdentity"));
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v106 = 0LL;
              _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Failed to create signingServiceIdenitty -- Fail {signingServiceIdentity: %{public}@}",  buf,  0xCu);
            }

            v70[2](v70, 0LL, 131074LL);
            goto LABEL_69;
          }

          -[NSMutableArray addObject:](v75, "addObject:", v27);
          -[NSMutableArray addObject:](v74, "addObject:", v29);
        }

        id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v97,  v109,  16LL);
        if (v23) {
          continue;
        }
        break;
      }
    }

    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog accountIdentity](&OBJC_CLASS___IDSFoundationLog, "accountIdentity"));
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v106 = v75;
      __int16 v107 = 2114;
      v108 = v74;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_INFO,  "Created service identities {fullServiceAdminIdentities: %{public}@, fullServiceSigningIdentities: %{public}@}",  buf,  0x16u);
    }

    if (v73)
    {
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog accountIdentity](&OBJC_CLASS___IDSFoundationLog, "accountIdentity"));
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Rolling old cluster", buf, 2u);
      }

      v94 = v20;
      v32 = (id *)&v94;
      uint64_t v33 = objc_claimAutoreleasedReturnValue( -[NSMutableArray rolledClusterWithFullAccountIdentity:fullAdminServiceIdentities:fullSigningServiceIdentities:error:]( v73,  "rolledClusterWithFullAccountIdentity:fullAdminServiceIdentities:fullSigningServiceIdentities:error:",  v19,  v75,  v74,  &v94));
    }

    else
    {
      v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog accountIdentity](&OBJC_CLASS___IDSFoundationLog, "accountIdentity"));
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Creating new cluster", buf, 2u);
      }

      v93 = v20;
      v32 = (id *)&v93;
      uint64_t v33 = objc_claimAutoreleasedReturnValue( -[IDSAccountIdentityElector _fullClusterWithAccountIdentityClusterWithAccountIdentity:fullAdminServiceIdentities:fullSigningServiceIdentities:error:]( self,  "_fullClusterWithAccountIdentityClusterWithAccountIdentity:fullAdminServiceIdentities:fullSigningServiceI dentities:error:",  v19,  v75,  v74,  &v93));
    }

    __int128 v22 = (NSMutableArray *)v33;
    id v38 = *v32;

    v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog accountIdentity](&OBJC_CLASS___IDSFoundationLog, "accountIdentity"));
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v106 = v22;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "!setState newCluster=%@", buf, 0xCu);
    }

    if (v73 && (-[NSMutableArray isParentOfCluster:](v73, "isParentOfCluster:", v22) & 1) == 0) {
      __assert_rtn( "-[IDSAccountIdentityElector _createAccountKeysWithFullAccountIdentity:serviceTypeNames:oldCluster:completion:]",  "IDSAccountIdentityElector.m",  262,  "[oldCluster isParentOfCluster:newCluster]");
    }
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountIdentityElector keychainElectionStore](self, "keychainElectionStore"));
    v27 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v40 identifierForFullCluster:v73]);

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountIdentityElector keychainElectionStore](self, "keychainElectionStore"));
    v68 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v41 identifierForFullCluster:v22]);

    v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog accountIdentity](&OBJC_CLASS___IDSFoundationLog, "accountIdentity"));
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v106 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "!setState existingIdentityGroupName=%@",  buf,  0xCu);
    }

    v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog accountIdentity](&OBJC_CLASS___IDSFoundationLog, "accountIdentity"));
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v106 = v68;
      _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "!setState accountIdentityGroupName=%@",  buf,  0xCu);
    }

    id v92 = v38;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray publicAccountClusterWithError:](v22, "publicAccountClusterWithError:", &v92));
    id v45 = v92;

    if (!v44) {
      __assert_rtn( "-[IDSAccountIdentityElector _createAccountKeysWithFullAccountIdentity:serviceTypeNames:oldCluster:completion:]",  "IDSAccountIdentityElector.m",  271,  "newPublicCluster");
    }
    id v91 = v45;
    v69 = (void *)objc_claimAutoreleasedReturnValue([v44 dataRepresentationWithError:&v91]);
    __int128 v20 = (NSMutableArray *)v91;

    if (v69)
    {
      v67 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableArray groupID](v22, "groupID"));
      id v46 = -[NSMutableArray publicKey](v73, "publicKey");
      v66 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray forwardingTicket](v22, "forwardingTicket"));
      v90 = v20;
      v65 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray signData:withError:](v22, "signData:withError:", v69, &v90));
      v60 = v90;

      id v64 = -[NSMutableArray publicKey](v22, "publicKey");
      v47 = v73;
      if (v73)
      {
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray groupID](v73, "groupID"));
        v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  (int)[v48 generation]));

        v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray groupID](v22, "groupID"));
        v50 = (void *)objc_claimAutoreleasedReturnValue([v49 stableGroupID]);
        v62 = (void *)objc_claimAutoreleasedReturnValue([v50 dataRepresentation]);

        v47 = v73;
      }

      else
      {
        v62 = 0LL;
        v63 = 0LL;
      }

      v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog accountIdentity](&OBJC_CLASS___IDSFoundationLog, "accountIdentity", v60));
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v106 = v67;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "!setState newGroupID=%@", buf, 0xCu);
      }

      if (v47)
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray publicAccountClusterWithError:](v73, "publicAccountClusterWithError:", 0LL));
        if (([v53 isParentOfCluster:v44] & 1) == 0) {
          __assert_rtn( "-[IDSAccountIdentityElector _createAccountKeysWithFullAccountIdentity:serviceTypeNames:oldCluster:completion:]",  "IDSAccountIdentityElector.m",  298,  "[oldPublicCluster isParentOfCluster:newPublicCluster]");
        }
      }

      v54 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountIdentityElector cloudKitElectionStore](self, "cloudKitElectionStore"));
      v76[0] = _NSConcreteStackBlock;
      v76[1] = 3221225472LL;
      v76[2] = sub_100025DA8;
      v76[3] = &unk_1008F67F0;
      v76[4] = self;
      v77 = v22;
      v87 = v70;
      v78 = v27;
      id v79 = v69;
      id v55 = v65;
      id v80 = v55;
      v56 = v67;
      v81 = v56;
      id v57 = v66;
      id v82 = v57;
      id v88 = v46;
      id v89 = v64;
      id v58 = v63;
      id v83 = v58;
      id v59 = v62;
      id v84 = v59;
      v85 = v68;
      v86 = v73;
      [v54 fetchAccountIdentityItemWithCompletion:v76];

      __int128 v20 = v61;
    }

    else
    {
      v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog accountIdentity](&OBJC_CLASS___IDSFoundationLog, "accountIdentity"));
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v106 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "Failed to create publicClusterBlob -- Fail {error: %{public}@}",  buf,  0xCu);
      }

      -[IDSAccountIdentityElector _cleanupFailedElectionWithFullAccountIdentityCluster:]( self,  "_cleanupFailedElectionWithFullAccountIdentityCluster:",  v22);
      v70[2](v70, 0LL, 131075LL);
    }

LABEL_69:
    v28 = v20;
LABEL_70:

    __int128 v20 = v28;
  }

  else
  {
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog accountIdentity](&OBJC_CLASS___IDSFoundationLog, "accountIdentity"));
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v106 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Failed to create new account identity -- Fail {error: %{public}@}",  buf,  0xCu);
    }

    v70[2](v70, 0LL, 0x20000LL);
  }

  os_activity_scope_leave(&state);
  cut_arc_os_release(&v104);
}

- (void)_cleanupFailedElectionWithFullAccountIdentityCluster:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog accountIdentity](&OBJC_CLASS___IDSFoundationLog, "accountIdentity"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Cleaning up after failed election {cluster %{public}@}",  buf,  0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountIdentityElector keychainElectionStore](self, "keychainElectionStore"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifierForFullCluster:v4]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountIdentityElector keychainElectionStore](self, "keychainElectionStore"));
  id v12 = 0LL;
  unsigned __int8 v9 = [v8 removeFullClusterWithIdentifier:v7 error:&v12];
  id v10 = v12;

  if ((v9 & 1) == 0)
  {
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog accountIdentity](&OBJC_CLASS___IDSFoundationLog, "accountIdentity"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v14 = v4;
      __int16 v15 = 2112;
      id v16 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Failed to clean up failed election {cluster: %{public}@, error: %{error}@}",  buf,  0x16u);
    }
  }
}

- (id)_fullAccountIdentityWithError:(id *)a3
{
  return +[IDSMPFullAccountIdentity fullAccountIdentityWithError:]( &OBJC_CLASS___IDSMPFullAccountIdentity,  "fullAccountIdentityWithError:",  a3);
}

- (id)_fullServiceIdentityAdminWithAccountIdentity:(id)a3 type:(int64_t)a4 error:(id *)a5
{
  return +[IDSMPFullServiceIdentityAdmin fullServiceIdentityWithFullAccountIdentity:type:error:]( &OBJC_CLASS___IDSMPFullServiceIdentityAdmin,  "fullServiceIdentityWithFullAccountIdentity:type:error:",  a3,  a4,  a5);
}

- (id)_fullServiceIdentitySigningWithAccountIdentity:(id)a3 type:(int64_t)a4 error:(id *)a5
{
  return +[IDSMPFullServiceIdentitySigning fullServiceIdentityWithFullAccountIdentity:type:error:]( &OBJC_CLASS___IDSMPFullServiceIdentitySigning,  "fullServiceIdentityWithFullAccountIdentity:type:error:",  a3,  a4,  a5);
}

- (id)_fullClusterWithAccountIdentityClusterWithAccountIdentity:(id)a3 fullAdminServiceIdentities:(id)a4 fullSigningServiceIdentities:(id)a5 error:(id *)a6
{
  return +[IDSMPFullAccountIdentityCluster clusterWithFullAccountIdentity:fullAdminServiceIdentities:fullSigningServiceIdentities:error:]( &OBJC_CLASS___IDSMPFullAccountIdentityCluster,  "clusterWithFullAccountIdentity:fullAdminServiceIdentities:fullSigningServiceIdentities:error:",  a3,  a4,  a5,  a6);
}

- (IDSKeychainKeyElectionStore)keychainElectionStore
{
  return self->_keychainElectionStore;
}

- (IDSCloudKitKeyElectionStore)cloudKitElectionStore
{
  return self->_cloudKitElectionStore;
}

- (IDSGroupServerKeyElectionStore)groupServerElectionStore
{
  return self->_groupServerElectionStore;
}

- (void).cxx_destruct
{
}

@end
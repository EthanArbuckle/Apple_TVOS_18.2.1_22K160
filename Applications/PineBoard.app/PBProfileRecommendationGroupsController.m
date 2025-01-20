@interface PBProfileRecommendationGroupsController
+ (id)_emptySessionWithSnapshot:(id)a3;
- (BOOL)updateActiveSessionWithRecommendationGroupIdentities:(id)a3 error:(id *)a4;
- (BOOL)updateConsent:(int64_t)a3 forProfileIdentity:(id)a4 error:(id *)a5;
- (PBProfileRecommendationGroupsController)initWithProfileStoreSnapshotProvider:(id)a3;
- (PBSGroupRecommendationsSession)activeSession;
@end

@implementation PBProfileRecommendationGroupsController

- (PBProfileRecommendationGroupsController)initWithProfileStoreSnapshotProvider:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PBProfileRecommendationGroupsController;
  v5 = -[PBProfileRecommendationGroupsController init](&v8, "init");
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_snapshotProvider, v4);
  }

  return v6;
}

- (PBSGroupRecommendationsSession)activeSession
{
  id v4 = sub_100115E04();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v39 = "-[PBProfileRecommendationGroupsController activeSession]";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s: Building recommendation group session.",  buf,  0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_snapshotProvider);
  v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained snapshot]);

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v7 activeProfile]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pb_userProfilesSnapshot"));
  if (!v8)
  {
    id v13 = sub_100115E04();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v39 = "-[PBProfileRecommendationGroupsController activeSession]";
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s: There is no active profile. The session will be empty.",  buf,  0xCu);
    }

    goto LABEL_11;
  }

  if (objc_msgSend(v8, "pb_recommendationGroupConsent") != (id)1)
  {
    id v15 = sub_100084680();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue([v8 identity]);
      uint64_t v17 = UPConsentDescription(objc_msgSend(v8, "pb_recommendationGroupConsent"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      *(_DWORD *)buf = 136315650;
      v39 = "-[PBProfileRecommendationGroupsController activeSession]";
      __int16 v40 = 2114;
      v41 = v16;
      __int16 v42 = 2114;
      v43 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s: Selected profile hasn't opted-in group recommendations, the session will be empty. {identity=%{public}@, con sent=%{public}@}",  buf,  0x20u);
    }

- (BOOL)updateConsent:(int64_t)a3 forProfileIdentity:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = sub_100115E04();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = UPConsentDescription(a3);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)buf = 136315650;
    v26 = "-[PBProfileRecommendationGroupsController updateConsent:forProfileIdentity:error:]";
    __int16 v27 = 2114;
    id v28 = v8;
    __int16 v29 = 2114;
    v30 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: Updating recommendation group consent. {identity=%{public}@, consent=%{public}@",  buf,  0x20u);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[UPUpdateProfileRequest updateRequestForProfileIdentity:recommendationGroupConsent:]( &OBJC_CLASS___UPUpdateProfileRequest,  "updateRequestForProfileIdentity:recommendationGroupConsent:",  v8,  a3));
  id WeakRetained = objc_loadWeakRetained((id *)&self->_snapshotProvider);
  id v24 = 0LL;
  unsigned int v15 = [WeakRetained updateWithUpdateProfileRequest:v13 error:&v24];
  id v16 = v24;

  id v17 = sub_100115E04();
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  id v19 = v18;
  if (v15)
  {
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    uint64_t v20 = UPConsentDescription(a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    *(_DWORD *)buf = 136315650;
    v26 = "-[PBProfileRecommendationGroupsController updateConsent:forProfileIdentity:error:]";
    __int16 v27 = 2114;
    id v28 = v8;
    __int16 v29 = 2114;
    v30 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%s: Updated profile group recommendation consent. {identity=%{public}@, consent=%{public}@}",  buf,  0x20u);
    goto LABEL_6;
  }

  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    uint64_t v23 = UPConsentDescription(a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v23);
    *(_DWORD *)buf = 136315906;
    v26 = "-[PBProfileRecommendationGroupsController updateConsent:forProfileIdentity:error:]";
    __int16 v27 = 2114;
    id v28 = v8;
    __int16 v29 = 2114;
    v30 = v21;
    __int16 v31 = 2112;
    id v32 = v16;
    _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s: Failed to update profile group recommendation consent. {identity=%{public}@, consent=%{public}@, error=%@}",  buf,  0x2Au);
LABEL_6:
  }

- (BOOL)updateActiveSessionWithRecommendationGroupIdentities:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id v8 = sub_100115E04();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v55 = "-[PBProfileRecommendationGroupsController updateActiveSessionWithRecommendationGroupIdentities:error:]";
    __int16 v56 = 2114;
    id v57 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: Updating recommendation group. {identities=%{public}@}",  buf,  0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_snapshotProvider);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained snapshot]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 activeProfile]);
  if (v12)
  {
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472LL;
    v52[2] = sub_1001164F8;
    v52[3] = &unk_1003D80C8;
    id v53 = v11;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bs_filter:", v52));
    if ([v13 isEqual:v7])
    {
      v49 = a2;
      id v14 = [v7 mutableCopy];
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v12 identity]);
      [v14 removeObject:v15];

      id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 identity]);
      id v50 = v14;
      id v17 = [v14 copy];
      uint64_t v18 = objc_claimAutoreleasedReturnValue( +[UPUpdateProfileRequest updateRequestForProfileIdentity:recommendationGroupIdentities:]( &OBJC_CLASS___UPUpdateProfileRequest,  "updateRequestForProfileIdentity:recommendationGroupIdentities:",  v16,  v17));

      id v19 = (void *)v18;
      id v20 = objc_loadWeakRetained((id *)&self->_snapshotProvider);
      id v51 = 0LL;
      unsigned int v21 = [v20 updateWithUpdateProfileRequest:v18 error:&v51];
      id v22 = v51;

      if (v21)
      {
        if (v22)
        {
          v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"error == nil"));
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_100282D44(v49);
          }
          _bs_set_crash_log_message([v48 UTF8String]);
          __break(0);
          JUMPOUT(0x1001164F0LL);
        }

        id v23 = sub_100115E04();
        id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        v25 = v50;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v55 = "-[PBProfileRecommendationGroupsController updateActiveSessionWithRecommendationGroupIdentities:error:]";
          __int16 v56 = 2114;
          id v57 = v50;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%s: Updated active profile group recommendation. {identities=%{public}@}",  buf,  0x16u);
        }
      }

      else
      {
        id v46 = sub_100115E04();
        id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          sub_100282DF0((uint64_t)v22, v24);
        }
        v25 = v50;
      }

      if (a4) {
        *a4 = v22;
      }
    }

    else
    {
      id v36 = sub_100115E04();
      id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        sub_100282E74(v37, v38, v39, v40, v41, v42, v43, v44);
      }

      if (a4)
      {
        uint64_t v45 = PBSUserProfileServiceErrorForCodeWithDebugDescription( 400LL,  @"The set of users for group recommendations session is invalid.");
        LOBYTE(v21) = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue(v45);
      }

      else
      {
        LOBYTE(v21) = 0;
      }
    }
  }

  else
  {
    id v26 = sub_100115E04();
    __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_100282CD4(v27, v28, v29, v30, v31, v32, v33, v34);
    }

    if (a4)
    {
      uint64_t v35 = PBSUserProfileServiceErrorForCodeWithDebugDescription( 400LL,  @"Failed to update recommendation group session. No active profile.");
      LOBYTE(v21) = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v35);
    }

    else
    {
      LOBYTE(v21) = 0;
    }
  }

  return v21;
}

+ (id)_emptySessionWithSnapshot:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___PBSGroupRecommendationsSession);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  v6 = -[PBSGroupRecommendationsSession initWithUserIdentifiers:userProfilesSnapshot:]( v4,  "initWithUserIdentifiers:userProfilesSnapshot:",  v5,  v3);

  return v6;
}

- (void).cxx_destruct
{
}

@end
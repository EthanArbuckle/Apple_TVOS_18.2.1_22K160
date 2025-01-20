@interface SATVCreatePrimaryProfileStep
+ (NSString)stableIdentifier;
- (TVSKStepDelegate)stepDelegate;
- (TVSKTapToSetupHomeKitInfo)homeKitInfo;
- (id)_primaryProfile;
- (id)executeStepForContext:(id)a3;
- (void)_createPrimaryProfileWithiCloudAccount:(id)a3;
- (void)_deletePrimaryProfile:(id)a3 completion:(id)a4;
- (void)_runStep;
- (void)_stepDidComplete;
- (void)setHomeKitInfo:(id)a3;
- (void)setStepDelegate:(id)a3;
@end

@implementation SATVCreatePrimaryProfileStep

- (id)executeStepForContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 setupSession]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 tapToSetupDeviceInfo]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 homeKitInfo]);

  objc_storeStrong((id *)&self->_homeKitInfo, v7);
  id v8 = [v4 navigationFlow];

  if (v8 == (id)1)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKBasicStepResult successResult](&OBJC_CLASS___TVSKBasicStepResult, "successResult"));
  }

  else
  {
    if (!v8) {
      -[SATVCreatePrimaryProfileStep _runStep](self, "_runStep");
    }
    v9 = objc_alloc_init(&OBJC_CLASS___TVSKActivityIndicatorViewController);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCreatePrimaryProfileStep stepDelegate](self, "stepDelegate"));
    [v10 step:self displayViewController:v9];

    v11 = 0LL;
  }

  return v11;
}

+ (NSString)stableIdentifier
{
  return (NSString *)@"SATVCreatePrimaryProfileStep";
}

- (void)_runStep
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "aa_primaryAppleAccount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCreatePrimaryProfileStep _primaryProfile](self, "_primaryProfile"));
  if (v5)
  {
    if (_os_feature_enabled_impl("AppleIDSetup", "Sandstone")
      && (v6 = (void *)objc_claimAutoreleasedReturnValue([v5 iCloudAltDSID]),
          v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aa_altDSID")),
          unsigned int v8 = [v6 isEqual:v7],
          v7,
          v6,
          v8))
    {
      id v9 = sub_10001F6A0();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aa_altDSID"));
        *(_DWORD *)buf = 138544130;
        v22 = v11;
        __int16 v23 = 2160;
        uint64_t v24 = 1752392040LL;
        __int16 v25 = 2112;
        v26 = v12;
        __int16 v27 = 2112;
        uint64_t v28 = (uint64_t)v5;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "A primary profile already exists, skipping creation. {identifier=%{public}@, iCloudAltDSID=%{mask.hash}@, profile=%@}",  buf,  0x2Au);
      }

      -[SATVCreatePrimaryProfileStep _stepDidComplete](self, "_stepDidComplete");
    }

    else
    {
      id v13 = sub_10001F6A0();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
        v16 = (void *)objc_claimAutoreleasedReturnValue([v5 iCloudAltDSID]);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aa_altDSID"));
        *(_DWORD *)buf = 138544386;
        v22 = v15;
        __int16 v23 = 2160;
        uint64_t v24 = 1752392040LL;
        __int16 v25 = 2112;
        v26 = v16;
        __int16 v27 = 2160;
        uint64_t v28 = 1752392040LL;
        __int16 v29 = 2112;
        v30 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "A mismatched primary profile already exists deleting it first. {identifier=%{public}@, profile.iCloudAltDSID=% {mask.hash}@, signedIniCloudAltDSID=%{mask.hash}@}",  buf,  0x34u);
      }

      objc_initWeak((id *)buf, self);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_10001F6E0;
      v18[3] = &unk_1000C9640;
      objc_copyWeak(&v20, (id *)buf);
      id v19 = v4;
      -[SATVCreatePrimaryProfileStep _deletePrimaryProfile:completion:]( self,  "_deletePrimaryProfile:completion:",  v5,  v18);

      objc_destroyWeak(&v20);
      objc_destroyWeak((id *)buf);
    }
  }

  else
  {
    -[SATVCreatePrimaryProfileStep _createPrimaryProfileWithiCloudAccount:]( self,  "_createPrimaryProfileWithiCloudAccount:",  v4);
  }
}

- (void)_createPrimaryProfileWithiCloudAccount:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  id v5 = sub_10001F6A0();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 141558274;
    uint64_t v40 = 1752392040LL;
    __int16 v41 = 2112;
    v42 = (TVSKTapToSetupHomeKitInfo *)v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Creating new primary profile. {iCloudAltDSID=%{mask.hash}@}",  buf,  0x16u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  uint64_t v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ams_activeiTunesAccount"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierGameCenter]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 accountsWithAccountType:v9]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);

  if (v8) {
    goto LABEL_20;
  }
  id v12 = sub_10001F6A0();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "No active iTunes account found, trying to find a not active one instead.",  buf,  2u);
  }

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ams_iTunesAccounts"));
  uint64_t v8 = (uint64_t)[v14 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v8)
  {
    uint64_t v15 = *(void *)v35;
    while (2)
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(v14);
        }
        v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if ((objc_msgSend(v17, "ams_isLocalAccount") & 1) == 0)
        {
          uint64_t v8 = v17;
          goto LABEL_16;
        }
      }

      uint64_t v8 = (uint64_t)[v14 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

- (void)_deletePrimaryProfile:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"primaryProfile != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000766E8(a2);
    }
    _bs_set_crash_log_message([v14 UTF8String]);
    __break(0);
    JUMPOUT(0x10001FE74LL);
  }

  uint64_t v8 = v7;
  if ([v6 type])
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[primaryProfile type] == PBSUserProfileTypePrimary"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100076840(a2);
    }
    _bs_set_crash_log_message([v15 UTF8String]);
    __break(0);
    JUMPOUT(0x10001FED8LL);
  }

  if (!v8)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"completion != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100076794(a2);
    }
    _bs_set_crash_log_message([v16 UTF8String]);
    __break(0);
    JUMPOUT(0x10001FF3CLL);
  }

  id v9 = sub_10001F6A0();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    *(_DWORD *)buf = 138543362;
    id v20 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Deleting primary profile... {identifier=%{public}@}",  buf,  0xCu);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10001FF44;
  v17[3] = &unk_1000C9A00;
  id v18 = v8;
  id v13 = v8;
  +[SATVUserProfilesUtilities deleteUserProfileWithIdentifier:completionHandler:]( &OBJC_CLASS___SATVUserProfilesUtilities,  "deleteUserProfileWithIdentifier:completionHandler:",  v12,  v17);
}

- (id)_primaryProfile
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 userProfilesSnapshot]);
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 primaryUserProfile]);

  return v4;
}

- (void)_stepDidComplete
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->stepDelegate);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKBasicStepResult successResult](&OBJC_CLASS___TVSKBasicStepResult, "successResult"));
  [WeakRetained step:self didCompleteWithResult:v3];
}

- (TVSKStepDelegate)stepDelegate
{
  return (TVSKStepDelegate *)objc_loadWeakRetained((id *)&self->stepDelegate);
}

- (void)setStepDelegate:(id)a3
{
}

- (TVSKTapToSetupHomeKitInfo)homeKitInfo
{
  return self->_homeKitInfo;
}

- (void)setHomeKitInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
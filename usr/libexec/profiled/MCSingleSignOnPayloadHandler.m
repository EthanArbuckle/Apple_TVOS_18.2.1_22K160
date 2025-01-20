@interface MCSingleSignOnPayloadHandler
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (BOOL)preflightUserInputResponses:(id)a3 outError:(id *)a4;
- (id)userInputFields;
- (void)remove;
@end

@implementation MCSingleSignOnPayloadHandler

- (id)userInputFields
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 kerberosInfo]);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 principalName]);
  id v6 = [v5 length];

  if (!v6)
  {
    uint64_t v7 = MCLocalizedFormat(@"PRINCIPAL_NAME_TITLE");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v3 realm]);
    uint64_t v10 = MCLocalizedFormat(@"KERBEROS_PRINCIPAL_NAME_P_REALM");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "humanReadableName", v9));
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:]( &OBJC_CLASS___MCNewPayloadHandler,  "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue :minimumLength:fieldType:flags:",  @"KPrincipalName",  v8,  v11,  0LL,  v12,  0LL,  0LL,  1LL,  0LL));
    [v4 addObject:v13];
  }

  return v4;
}

- (BOOL)preflightUserInputResponses:(id)a3 outError:(id *)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[MCNewPayloadHandler prioritizeUserInput:key:overField:]( &OBJC_CLASS___MCNewPayloadHandler,  "prioritizeUserInput:key:overField:",  a3,  @"KPrincipalName",  0LL));
  id v6 = v5;
  if (v5 && [v5 rangeOfString:@"@"] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = MCSSOErrorDomain;
    uint64_t v12 = MCErrorArray(@"SSO_PRINCIPAL_NAME_INVALID");
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v11,  34003LL,  v13,  MCErrorTypeNeedsRetry,  0LL));

    BOOL v7 = v8 != 0LL;
    if (a4 && v8)
    {
      id v8 = v8;
      *a4 = v8;
      BOOL v7 = 1;
    }
  }

  else
  {
    BOOL v7 = 0;
    id v8 = 0LL;
  }

  BOOL v9 = !v7;

  return v9;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v79 = a5;
  uint64_t v106 = 0LL;
  v107 = &v106;
  uint64_t v108 = 0x3032000000LL;
  v109 = sub_10007E56C;
  v110 = sub_10007E57C;
  id v111 = 0LL;
  v78 = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:kMCInstallProfileOptionIsInstalledByMDM]);
  unsigned int v74 = [v11 BOOLValue];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 kerberosInfo]);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler userInputResponses](self, "userInputResponses"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v13 principalName]);
  v80 = (void *)objc_claimAutoreleasedReturnValue( +[MCNewPayloadHandler prioritizeUserInput:key:overField:]( &OBJC_CLASS___MCNewPayloadHandler,  "prioritizeUserInput:key:overField:",  v15,  @"KPrincipalName",  v16));

  if (!v13)
  {
LABEL_34:
    v55 = (void *)v107[5];
    if (v55)
    {
      if (a6) {
        *a6 = v55;
      }
      v56 = (void *)objc_claimAutoreleasedReturnValue([v13 accountGUID]);

      if (v56)
      {
        v57 = (void *)objc_claimAutoreleasedReturnValue([v13 accountGUID]);
        v58 = (void *)objc_claimAutoreleasedReturnValue([v14 accountWithIdentifier:v57]);

        if (v58)
        {
          dispatch_semaphore_t v59 = dispatch_semaphore_create(0LL);
          dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
          v61 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
          v85[0] = _NSConcreteStackBlock;
          v85[1] = 3221225472LL;
          v85[2] = sub_10007E8B4;
          v85[3] = &unk_1000C3D10;
          id v86 = v14;
          id v87 = v58;
          dispatch_semaphore_t v88 = v59;
          v62 = v59;
          dispatch_async(v61, v85);

          dispatch_semaphore_wait(v62, 0xFFFFFFFFFFFFFFFFLL);
        }
      }

      uint64_t v38 = objc_claimAutoreleasedReturnValue([v13 accountTypeGUID]);

      if (v38)
      {
        v63 = (void *)objc_claimAutoreleasedReturnValue([v13 accountTypeGUID]);
        uint64_t v38 = objc_claimAutoreleasedReturnValue([v14 accountTypeWithAccountTypeIdentifier:v63]);

        if (v38)
        {
          dispatch_semaphore_t v64 = dispatch_semaphore_create(0LL);
          dispatch_queue_global_t v65 = dispatch_get_global_queue(0LL, 0LL);
          v66 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v65);
          v81[0] = _NSConcreteStackBlock;
          v81[1] = 3221225472LL;
          v81[2] = sub_10007EA20;
          v81[3] = &unk_1000C3D10;
          id v82 = v14;
          id v83 = (id)v38;
          dispatch_semaphore_t v84 = v64;
          v67 = v64;
          dispatch_async(v66, v81);

          dispatch_semaphore_wait(v67, 0xFFFFFFFFFFFFFFFFLL);
        }

        LOBYTE(v38) = 0;
      }
    }

    else
    {
      LOBYTE(v38) = 1;
    }

    goto LABEL_46;
  }

  if (![v80 length])
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue([v12 humanReadableName]);
    uint64_t v24 = MCErrorArray(@"SSO_MISSING_PRINCIPAL_NAME_P_SSO");
    v23 = (void *)objc_claimAutoreleasedReturnValue(v24);
    uint64_t v25 = objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  MCSSOErrorDomain,  34002LL,  v23,  MCErrorTypeFatal,  v21,  0LL));
    v26 = (void *)v107[5];
    v107[5] = v25;

    goto LABEL_7;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue([v13 certificateUUID]);

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v13 certificateUUID]);
    v76 = (void *)objc_claimAutoreleasedReturnValue([v18 persistentIDForCertificateUUID:v19]);

    if (!v76)
    {
      uint64_t v20 = MCErrorArray(@"SSO_BAD_CERTIFICATE_REF");
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      uint64_t v22 = objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  MCSSOErrorDomain,  34004LL,  v21,  MCErrorTypeFatal,  0LL));
      v23 = (void *)v107[5];
      v107[5] = v22;
LABEL_7:

      goto LABEL_34;
    }
  }

  else
  {
    v76 = 0LL;
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue([v13 realm]);
  v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@@%@", v80, v27));

  v28 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v114 = v72;
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "Creating Kerberos SSO account for %{public}@",  buf,  0xCu);
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString MCMakeUUID](&OBJC_CLASS___NSString, "MCMakeUUID"));
  v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.account.kerberos.sso.%@",  v29));

  v31 = objc_alloc(&OBJC_CLASS___ACAccountType);
  v32 = (void *)objc_claimAutoreleasedReturnValue([v12 humanReadableName]);
  v33 = -[ACAccountType initWithIdentifier:description:](v31, "initWithIdentifier:description:", v30, v32);

  uint64_t v34 = ACCredentialTypeKerberos;
  -[ACAccountType setCredentialType:](v33, "setCredentialType:", ACCredentialTypeKerberos);
  dispatch_semaphore_t v35 = dispatch_semaphore_create(0LL);
  dispatch_queue_global_t v36 = dispatch_get_global_queue(0LL, 0LL);
  id v71 = v9;
  v37 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v36);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007E584;
  block[3] = &unk_1000C4198;
  uint64_t v38 = v14;
  id v100 = (id)v38;
  v39 = v33;
  v101 = v39;
  id v40 = v13;
  id v102 = v40;
  id v70 = v30;
  id v103 = v70;
  v105 = &v106;
  dispatch_semaphore_t dsema = v35;
  dispatch_semaphore_t v104 = dsema;
  dispatch_async(v37, block);

  id v9 = v71;
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  if (v107[5])
  {
    int v41 = 2;
  }

  else
  {
    v42 = -[ACAccount initWithAccountType:](objc_alloc(&OBJC_CLASS___ACAccount), "initWithAccountType:", v39);
    -[ACAccount setManagingOwnerIdentifier:](v42, "setManagingOwnerIdentifier:", kMCAccountManagingOwnerIdentifier);
    v43 = (void *)objc_claimAutoreleasedReturnValue([v12 friendlyName]);
    -[ACAccount setManagingSourceName:](v42, "setManagingSourceName:", v43);

    v44 = -[ACAccountCredential initWithPassword:]( objc_alloc(&OBJC_CLASS___ACAccountCredential),  "initWithPassword:",  0LL);
    -[ACAccountCredential setCredentialType:](v44, "setCredentialType:", v34);
    -[ACAccount setAuthenticationType:](v42, "setAuthenticationType:", kAccountAuthenticationTypeKerberos);
    -[ACAccount setCredential:](v42, "setCredential:", v44);
    -[ACAccount setUsername:](v42, "setUsername:", v72);
    if (v76) {
      -[ACAccount setAccountProperty:forKey:](v42, "setAccountProperty:forKey:", v76, @"kGSSICCertificate");
    }
    v45 = (void *)objc_claimAutoreleasedReturnValue([v40 URLPrefixMatches]);

    if (v45)
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue([v40 URLPrefixMatches]);
      -[ACAccount setAccountProperty:forKey:](v42, "setAccountProperty:forKey:", v46, @"domains");
    }

    else
    {
      -[ACAccount setAccountProperty:forKey:](v42, "setAccountProperty:forKey:", &off_1000CC128, @"domains");
    }

    if (v74) {
      -[ACAccount setAccountProperty:forKey:]( v42,  "setAccountProperty:forKey:",  &__kCFBooleanTrue,  @"MCAccountIsManaged");
    }
    v93[0] = _NSConcreteStackBlock;
    v93[1] = 3221225472LL;
    v93[2] = sub_10007E6A4;
    v93[3] = &unk_1000C41C0;
    id v47 = (id)v38;
    id v94 = v47;
    v75 = v42;
    v95 = v75;
    id v48 = v40;
    id v96 = v48;
    v98 = &v106;
    v97 = dsema;
    uint64_t v38 = objc_retainBlock(v93);
    (*(void (**)(void))(v38 + 16))();
    if (v107[5])
    {
      int v41 = 2;
    }

    else
    {
      [v47 clearAllPermissionsGrantedForAccountType:v39];
      v69 = v44;
      __int128 v91 = 0u;
      __int128 v92 = 0u;
      __int128 v89 = 0u;
      __int128 v90 = 0u;
      v49 = (void *)objc_claimAutoreleasedReturnValue([v48 appIdentifierMatches]);
      id v50 = [v49 countByEnumeratingWithState:&v89 objects:v112 count:16];
      if (v50)
      {
        uint64_t v51 = *(void *)v90;
        do
        {
          for (i = 0LL; i != v50; i = (char *)i + 1)
          {
            if (*(void *)v90 != v51) {
              objc_enumerationMutation(v49);
            }
            [v47 setPermissionGranted:1 forBundleID:*(void *)(*((void *)&v89 + 1) + 8 * (void)i) onAccountType:v39];
          }

          id v50 = [v49 countByEnumeratingWithState:&v89 objects:v112 count:16];
        }

        while (v50);
      }

      id v9 = v71;
      v44 = v69;
      v53 = _MCLogObjects[0];
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        v54 = (void *)objc_claimAutoreleasedReturnValue([v12 humanReadableName]);
        *(_DWORD *)buf = 138543362;
        v114 = v54;
        _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_INFO,  "Installed Kerberos account for %{public}@",  buf,  0xCu);
      }

      int v41 = 0;
    }
  }

  if ((v41 | 2) == 2) {
    goto LABEL_34;
  }
LABEL_46:

  _Block_object_dispose(&v106, 8);
  return v38 & 1;
}

- (void)remove
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 kerberosInfo]);
  os_log_t v5 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v44 UUID]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 profile]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    uint64_t v12 = v4;
    v13 = v3;
    v14 = (void *)objc_claimAutoreleasedReturnValue([v11 profile]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 UUID]);
    *(_DWORD *)buf = 138543874;
    v56 = v7;
    __int16 v57 = 2114;
    v58 = v10;
    __int16 v59 = 2114;
    v60 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Remove SSO payload with UUID %{public}@ in profile %{public}@ (%{public}@)",  buf,  0x20u);

    v3 = v13;
    v4 = v12;
  }

  os_log_t v16 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue([v4 principalName]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v4 realm]);
    *(_DWORD *)buf = 138543618;
    v56 = v18;
    __int16 v57 = 2114;
    v58 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "Remove SSO payload: principal name = %{public}@, realm = %{public}@",  buf,  0x16u);
  }

  os_log_t v20 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    v21 = v20;
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v4 accountGUID]);
    *(_DWORD *)buf = 138543362;
    v56 = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Remove SSO payload: looking for account with accountGUID = %{public}@",  buf,  0xCu);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue([v4 accountGUID]);

  if (v23)
  {
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v4 accountGUID]);
    v26 = (void *)objc_claimAutoreleasedReturnValue([v24 accountWithIdentifier:v25]);

    v27 = _MCLogObjects[0];
    BOOL v28 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT);
    if (v26)
    {
      if (v28)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Remove SSO payload: found account to remove",  buf,  2u);
      }

      dispatch_semaphore_t v29 = dispatch_semaphore_create(0LL);
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      v31 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10007F130;
      block[3] = &unk_1000C3C50;
      id v51 = v24;
      id v52 = v26;
      id v53 = v3;
      dispatch_semaphore_t v54 = v29;
      v32 = v29;
      dispatch_async(v31, block);
    }

    else if (v28)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Remove SSO payload: no account found to remove",  buf,  2u);
    }

    os_log_t v33 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v34 = v33;
      dispatch_semaphore_t v35 = (void *)objc_claimAutoreleasedReturnValue([v4 accountTypeGUID]);
      *(_DWORD *)buf = 138543362;
      v56 = v35;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Remove SSO payload: looking for account type with accountTypeGUID = %{public}@",  buf,  0xCu);
    }

    dispatch_queue_global_t v36 = (void *)objc_claimAutoreleasedReturnValue([v4 accountTypeGUID]);
    v37 = (void *)objc_claimAutoreleasedReturnValue([v24 accountTypeWithAccountTypeIdentifier:v36]);

    uint64_t v38 = _MCLogObjects[0];
    BOOL v39 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT);
    if (v37)
    {
      if (v39)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Remove SSO payload: found account type to remove",  buf,  2u);
      }

      dispatch_semaphore_t v40 = dispatch_semaphore_create(0LL);
      dispatch_queue_global_t v41 = dispatch_get_global_queue(0LL, 0LL);
      v42 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v41);
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472LL;
      v45[2] = sub_10007F2F0;
      v45[3] = &unk_1000C3C50;
      id v46 = v24;
      id v47 = v37;
      id v48 = v3;
      dispatch_semaphore_t v49 = v40;
      v43 = v40;
      dispatch_async(v42, v45);
    }

    else if (v39)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Remove SSO payload: no account type found to remove",  buf,  2u);
    }
  }
}

@end
@interface AKGrandslamTokenUpdater
+ (BOOL)shouldUpdateSynchronouslyWith:(id)a3;
- (BOOL)_isTouchIDRequiredForGrandSlamServiceTokenWithID:(id)a3;
- (void)_updateCredentialForSavedAIDAAccount:(id)a3 accountStore:(id)a4 withNewTokens:(id)a5;
- (void)_updateWithRequest:(id)a3 error:(id *)a4;
- (void)updateGrandSlamServiceTokensWithRequest:(id)a3 error:(id *)a4;
@end

@implementation AKGrandslamTokenUpdater

- (void)updateGrandSlamServiceTokensWithRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (objc_msgSend((id)objc_opt_class(self, v7), "shouldUpdateSynchronouslyWith:", v6))
  {
    -[AKGrandslamTokenUpdater _updateWithRequest:error:](self, "_updateWithRequest:error:", v6, a4);
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A22DC;
    block[3] = &unk_1001CA6D0;
    block[4] = self;
    id v11 = v6;
    v12 = a4;
    dispatch_async(v9, block);
  }
}

+ (BOOL)shouldUpdateSynchronouslyWith:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 context]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceIdentifier]);
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 aidaAccount]);
    BOOL v7 = v6 != 0LL;
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_updateWithRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = _AKSignpostLogSystem(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  os_signpost_id_t v9 = _AKSignpostCreate();
  uint64_t v11 = v10;

  uint64_t v13 = _AKSignpostLogSystem(v12);
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  v15 = v14;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v15,  OS_SIGNPOST_INTERVAL_BEGIN,  v9,  "PersistGrandslamTokens",  " enableTelemetry=YES ",  buf,  2u);
  }

  uint64_t v17 = _AKSignpostLogSystem(v16);
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v74 = (ACAccount *)v9;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PersistGrandslamTokens  enableTelemetry=YES ",  buf,  0xCu);
  }

  v19 = (ACAccount *)objc_claimAutoreleasedReturnValue([v6 aidaAccount]);
  if (!v19)
  {
    uint64_t v20 = _AKLogSystem(0LL);
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (ACAccount *)objc_claimAutoreleasedReturnValue([v6 altDSID]);
      v23 = (void *)objc_claimAutoreleasedReturnValue([v6 appleIDUsername]);
      *(_DWORD *)buf = 138412546;
      v74 = v22;
      __int16 v75 = 2112;
      double v76 = *(double *)&v23;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "No AIDA account for altDSID %@ was found. Searching by Apple ID: %@",  buf,  0x16u);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue([v6 accountManager]);
    v25 = (void *)objc_claimAutoreleasedReturnValue([v6 appleIDUsername]);
    v19 = (ACAccount *)objc_claimAutoreleasedReturnValue([v24 appleIDAccountWithAppleID:v25]);

    if (!v19)
    {
      uint64_t v27 = _AKLogSystem(v26);
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = (ACAccount *)objc_claimAutoreleasedReturnValue([v6 appleIDUsername]);
        *(_DWORD *)buf = 138412290;
        v74 = v29;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Creating new AIDA account for Apple ID: %@",  buf,  0xCu);
      }

      v30 = objc_alloc(&OBJC_CLASS___ACAccount);
      v31 = (void *)objc_claimAutoreleasedReturnValue([v6 accountManager]);
      v32 = (void *)objc_claimAutoreleasedReturnValue([v31 appleIDAccountType]);
      v19 = -[ACAccount initWithAccountType:](v30, "initWithAccountType:", v32);

      v33 = (void *)objc_claimAutoreleasedReturnValue([v6 appleIDUsername]);
      -[ACAccount setUsername:](v19, "setUsername:", v33);

      v34 = (void *)objc_claimAutoreleasedReturnValue( +[AKAccountManager personaIDIfCurrentPersonaIsDataSeparated]( &OBJC_CLASS___AKAccountManager,  "personaIDIfCurrentPersonaIsDataSeparated"));
      if (v34) {
        -[ACAccount setObject:forKeyedSubscript:]( v19,  "setObject:forKeyedSubscript:",  v34,  ACAccountPropertyPersonaIdentifier);
      }
    }
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accountManager", v9 - 1));
  v36 = (void *)objc_claimAutoreleasedReturnValue([v6 altDSID]);
  v37 = (void *)objc_claimAutoreleasedReturnValue([v35 authKitAccountWithAltDSID:v36 error:0]);

  if (v37)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue([v6 accountManager]);
    objc_msgSend(v39, "setCredentialStorageOption:forAccount:", objc_msgSend(v37, "credentialLocation"), v19);
  }

  uint64_t v40 = _AKLogSystem(v38);
  v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v74 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "Updating AIDA account %@ with properties and tokens.",  buf,  0xCu);
  }

  -[ACAccount setCredential:](v19, "setCredential:", 0LL);
  -[ACAccount setAuthenticated:](v19, "setAuthenticated:", 1LL);
  v42 = (void *)objc_claimAutoreleasedReturnValue([v6 accountManager]);
  v43 = (void *)objc_claimAutoreleasedReturnValue([v6 altDSID]);
  [v42 setAltDSID:v43 forAccount:v19];

  v44 = (void *)objc_claimAutoreleasedReturnValue([v6 dsid]);
  if (v44)
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue([v6 dsid]);
    -[ACAccount setAccountProperty:forKey:](v19, "setAccountProperty:forKey:", v45, AKPropertyLegacyDSIDKey);
  }

  v46 = (void *)objc_claimAutoreleasedReturnValue([v6 accountManager]);
  id v72 = 0LL;
  unsigned int v47 = [v46 saveAccount:v19 error:&v72];
  id v48 = v72;

  if (v47)
  {
    uint64_t v50 = _AKLogSystem(v49);
    v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Successfully saved AIDA account.", buf, 2u);
    }

    v52 = (void *)objc_claimAutoreleasedReturnValue([v6 accountManager]);
    v53 = (void *)objc_claimAutoreleasedReturnValue([v52 store]);
    v54 = (void *)objc_claimAutoreleasedReturnValue([v6 tokensById]);
    -[AKGrandslamTokenUpdater _updateCredentialForSavedAIDAAccount:accountStore:withNewTokens:]( self,  "_updateCredentialForSavedAIDAAccount:accountStore:withNewTokens:",  v19,  v53,  v54);
  }

  else
  {
    if (a4)
    {
      id v49 = v48;
      *a4 = v49;
    }

    uint64_t v55 = _AKLogSystem(v49);
    v52 = (void *)objc_claimAutoreleasedReturnValue(v55);
    if (os_log_type_enabled((os_log_t)v52, OS_LOG_TYPE_ERROR)) {
      sub_10013FD48((uint64_t)v48, (os_log_s *)v52, v56, v57, v58, v59, v60, v61);
    }
  }

  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(v9, v11);
  uint64_t v63 = _AKSignpostLogSystem(Nanoseconds);
  v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
  v65 = v64;
  if (v71 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
  {
    unsigned int v66 = [v48 code];
    *(_DWORD *)buf = 67240192;
    LODWORD(v74) = v66;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v65,  OS_SIGNPOST_INTERVAL_END,  v9,  "PersistGrandslamTokens",  " Error=%{public,signpost.telemetry:number2,name=Error}d ",  buf,  8u);
  }

  uint64_t v68 = _AKSignpostLogSystem(v67);
  v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v70 = [v48 code];
    *(_DWORD *)buf = 134218496;
    v74 = (ACAccount *)v9;
    __int16 v75 = 2048;
    double v76 = (double)Nanoseconds / 1000000000.0;
    __int16 v77 = 1026;
    unsigned int v78 = v70;
    _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs:PersistGrandslamTokens  Error=%{public,signpost.telemetry:number2,name=Error}d ",  buf,  0x1Cu);
  }
}

- (void)_updateCredentialForSavedAIDAAccount:(id)a3 accountStore:(id)a4 withNewTokens:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(33LL, 0LL);
  uint64_t v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A2AD4;
  block[3] = &unk_1001C9BA8;
  id v17 = v10;
  v18 = self;
  id v19 = v9;
  id v20 = v8;
  id v13 = v8;
  id v14 = v9;
  id v15 = v10;
  dispatch_sync(v12, block);
}

- (BOOL)_isTouchIDRequiredForGrandSlamServiceTokenWithID:(id)a3
{
  return [a3 isEqualToString:@"com.apple.gs.icloud.storage.buy"];
}

@end
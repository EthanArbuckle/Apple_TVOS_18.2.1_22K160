@interface RestoreDemotedApplicationsOperation
- (RestoreDemotedApplicationsOperation)initWithBundleIdentifiers:(id)a3 options:(id)a4;
- (id)_accountIdForAppleID:(id)a3;
- (id)_appleIDForApp:(id)a3;
- (void)_notifyCompletion;
- (void)restoreDownloadItemsOperation:(id)a3 didReceiveResponse:(id)a4;
- (void)run;
@end

@implementation RestoreDemotedApplicationsOperation

- (RestoreDemotedApplicationsOperation)initWithBundleIdentifiers:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___RestoreDemotedApplicationsOperation;
  v8 = -[RestoreDemotedApplicationsOperation init](&v14, "init");
  if (v8)
  {
    v9 = (NSArray *)[v6 copy];
    bundleIDs = v8->_bundleIDs;
    v8->_bundleIDs = v9;

    v11 = (NSDictionary *)[v7 copy];
    options = v8->_options;
    v8->_options = v11;
  }

  return v8;
}

- (void)run
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v73 = self;
  if (-[NSArray count](self->_bundleIDs, "count"))
  {
    __int128 v88 = 0u;
    __int128 v89 = 0u;
    __int128 v87 = 0u;
    __int128 v86 = 0u;
    p_super = self->_bundleIDs;
    id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( p_super,  "countByEnumeratingWithState:objects:count:",  &v86,  v99,  16LL);
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v87;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v87 != v7) {
            objc_enumerationMutation(p_super);
          }
          v9 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  *(void *)(*((void *)&v86 + 1) + 8LL * (void)i)));
          v10 = v9;
          if (v9
            && (([v9 isPlaceholder] & 1) != 0 || objc_msgSend(v10, "installType") == (id)7))
          {
            -[NSMutableArray addObject:](v3, "addObject:", v10);
          }
        }

        id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( p_super,  "countByEnumeratingWithState:objects:count:",  &v86,  v99,  16LL);
      }

      while (v6);
    }
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
    v90[0] = _NSConcreteStackBlock;
    v90[1] = 3221225472LL;
    v90[2] = sub_1000671B8;
    v90[3] = &unk_10034C6D8;
    v91 = v3;
    [v11 enumerateBundlesOfType:0 block:v90];

    p_super = &v91->super;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v12) {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v13 = [v12 shouldLog];
  objc_super v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = v13 & 2;
  }
  if (!(_DWORD)v15) {
    goto LABEL_25;
  }
  v16 = (void *)objc_opt_class(v73);
  id v17 = v16;
  id v18 = -[NSMutableArray count](v3, "count");
  int v92 = 138412546;
  v93 = v16;
  __int16 v94 = 2048;
  uint64_t v95 = (uint64_t)v18;
  v19 = (void *)_os_log_send_and_compose_impl( v15,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  16LL,  "%@: Checking eligibility for %ld demoted apps",  &v92,  22);

  if (v19)
  {
    objc_super v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v19,  4LL));
    free(v19);
    v66 = v14;
    SSFileLog(v12, @"%@");
LABEL_25:
  }

  v72 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
  v70 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  __int128 v84 = 0u;
  __int128 v85 = 0u;
  obj = v3;
  id v75 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v82,  v98,  16LL);
  if (!v75)
  {
    uint64_t v69 = 0LL;
    char v20 = 1;
    v21 = v73;
    v22 = &ACSLocateCachingServer_ptr;
    goto LABEL_81;
  }

  uint64_t v69 = 0LL;
  uint64_t v74 = *(void *)v83;
  char v20 = 1;
  v21 = v73;
  v22 = &ACSLocateCachingServer_ptr;
  do
  {
    for (j = 0LL; j != v75; j = (char *)j + 1)
    {
      if (*(void *)v83 != v74) {
        objc_enumerationMutation(obj);
      }
      v24 = *(void **)(*((void *)&v82 + 1) + 8LL * (void)j);
      v77 = objc_autoreleasePoolPush();
      v76 = -[DemotedApplication initWithApplication:]( objc_alloc(&OBJC_CLASS___DemotedApplication),  "initWithApplication:",  v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[DemotedApplication restoreDownloadItem](v76, "restoreDownloadItem"));
      v26 = (void *)objc_claimAutoreleasedReturnValue([v24 bundleIdentifier]);
      [v25 setBundleID:v26];

      v27 = (void *)objc_claimAutoreleasedReturnValue([v25 storeAccountID]);
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", 0LL));

      if (v27 != v28)
      {
        if (!v27) {
          goto LABEL_34;
        }
LABEL_33:
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "accountWithUniqueIdentifier:", v27, v66));
        v30 = (void *)objc_claimAutoreleasedReturnValue([v29 accountName]);
        [v25 setStoreAccountAppleID:v30];

        goto LABEL_34;
      }

      v43 = (void *)objc_claimAutoreleasedReturnValue(-[RestoreDemotedApplicationsOperation _appleIDForApp:](v21, "_appleIDForApp:", v24));
      v44 = (void *)objc_claimAutoreleasedReturnValue([v22[459] sharedDaemonConfig]);
      if (!v44) {
        v44 = (void *)objc_claimAutoreleasedReturnValue([v22[459] sharedConfig]);
      }
      LODWORD(v45) = objc_msgSend(v44, "shouldLog", v66);
      v46 = (os_log_s *)objc_claimAutoreleasedReturnValue([v44 OSLogObject]);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v45 = v45;
      }
      else {
        v45 &= 2u;
      }
      if ((_DWORD)v45)
      {
        v47 = (void *)objc_opt_class(v21);
        int v92 = 138412546;
        v93 = v47;
        __int16 v94 = 2112;
        uint64_t v95 = (uint64_t)v43;
        id v48 = v47;
        LODWORD(v68) = 22;
        v49 = (void *)_os_log_send_and_compose_impl( v45,  0LL,  0LL,  0LL,  &_mh_execute_header,  v46,  0LL,  "%@: Fallback appleID from is %@",  &v92,  v68);

        if (!v49) {
          goto LABEL_59;
        }
        v46 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v49,  4LL));
        free(v49);
        v66 = v46;
        SSFileLog(v44, @"%@");
      }

LABEL_59:
      if (!v43) {
        goto LABEL_72;
      }
      uint64_t v50 = objc_claimAutoreleasedReturnValue(-[RestoreDemotedApplicationsOperation _accountIdForAppleID:](v73, "_accountIdForAppleID:", v43));

      v51 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v51) {
        v51 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      LODWORD(v52) = objc_msgSend(v51, "shouldLog", v66);
      v53 = (os_log_s *)objc_claimAutoreleasedReturnValue([v51 OSLogObject]);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v52 = v52;
      }
      else {
        v52 &= 2u;
      }
      if (!(_DWORD)v52) {
        goto LABEL_70;
      }
      v54 = (void *)objc_opt_class(v73);
      int v92 = 138412546;
      v93 = v54;
      __int16 v94 = 2112;
      uint64_t v95 = v50;
      id v55 = v54;
      LODWORD(v68) = 22;
      v56 = (void *)_os_log_send_and_compose_impl( v52,  0LL,  0LL,  0LL,  &_mh_execute_header,  v53,  0LL,  "%@: Fallback accountID is %@",  &v92,  v68);

      if (v56)
      {
        v53 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v56,  4LL));
        free(v56);
        v66 = v53;
        SSFileLog(v51, @"%@");
LABEL_70:
      }

      v27 = (void *)v50;
LABEL_72:
      v21 = v73;
      v22 = &ACSLocateCachingServer_ptr;

      if (v27) {
        goto LABEL_33;
      }
LABEL_34:
      id v81 = 0LL;
      unsigned __int8 v31 = objc_msgSend(v25, "isEligibleForRestore:", &v81, v66);
      id v32 = v81;
      if ((v31 & 1) != 0)
      {
        v33 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v70, "objectForKey:", v27));
        if (v33)
        {
          v34 = v33;
          -[NSMutableArray addObject:](v33, "addObject:", v25);
        }

        else
        {
          v34 = -[NSMutableArray initWithObjects:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithObjects:",  v25,  0LL);
          -[NSMutableDictionary setObject:forKey:](v70, "setObject:forKey:", v34, v27);
          ++v69;
        }
      }

      else
      {
        v34 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v22[459] sharedDaemonConfig]);
        if (!v34) {
          v34 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v22[459] sharedConfig]);
        }
        LODWORD(v35) = -[NSMutableArray shouldLog](v34, "shouldLog");
        v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NSMutableArray OSLogObject](v34, "OSLogObject"));
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v35 = v35;
        }
        else {
          v35 &= 2u;
        }
        if (!(_DWORD)v35) {
          goto LABEL_47;
        }
        v37 = (void *)objc_opt_class(v21);
        id v38 = v37;
        v39 = (void *)objc_claimAutoreleasedReturnValue([v24 bundleIdentifier]);
        int v92 = 138412802;
        v93 = v37;
        __int16 v94 = 2112;
        uint64_t v95 = (uint64_t)v39;
        __int16 v96 = 2112;
        id v97 = v32;
        LODWORD(v68) = 32;
        v40 = (void *)_os_log_send_and_compose_impl( v35,  0LL,  0LL,  0LL,  &_mh_execute_header,  v36,  0LL,  "%@: Could not restore ineligible app: %@, error: %@",  &v92,  v68);

        if (v40)
        {
          v36 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v40,  4LL));
          free(v40);
          v66 = v36;
          SSFileLog(v34, @"%@");
          v21 = v73;
LABEL_47:
          v42 = v76;
          v41 = v77;

          char v20 = 0;
          v22 = &ACSLocateCachingServer_ptr;
          goto LABEL_77;
        }

        char v20 = 0;
        v21 = v73;
        v22 = &ACSLocateCachingServer_ptr;
      }

      v42 = v76;
      v41 = v77;
LABEL_77:

      objc_autoreleasePoolPop(v41);
    }

    id v75 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v82,  v98,  16LL);
  }

  while (v75);
LABEL_81:

  v57 = (void *)objc_claimAutoreleasedReturnValue([v22[459] sharedDaemonConfig]);
  if (!v57) {
    v57 = (void *)objc_claimAutoreleasedReturnValue([v22[459] sharedConfig]);
  }
  unsigned int v58 = objc_msgSend(v57, "shouldLog", v66);
  v59 = (os_log_s *)objc_claimAutoreleasedReturnValue([v57 OSLogObject]);
  if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
    uint64_t v60 = v58;
  }
  else {
    uint64_t v60 = v58 & 2;
  }
  if ((_DWORD)v60)
  {
    v61 = (void *)objc_opt_class(v21);
    id v62 = v61;
    id v63 = -[NSMutableDictionary count](v70, "count");
    int v92 = 138412802;
    v93 = v61;
    __int16 v94 = 2048;
    uint64_t v95 = v69;
    __int16 v96 = 2048;
    id v97 = v63;
    LODWORD(v68) = 32;
    v64 = (void *)_os_log_send_and_compose_impl( v60,  0LL,  0LL,  0LL,  &_mh_execute_header,  v59,  16LL,  "%@: Found %ld eligible restore item(s) for %ld account(s)",  &v92,  v68);

    v21 = v73;
    v65 = v72;
    if (v64)
    {
      v59 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v64,  4LL));
      free(v64);
      v67 = v59;
      SSFileLog(v57, @"%@");
      goto LABEL_92;
    }
  }

  else
  {
    v65 = v72;
LABEL_92:
  }

  if (v69 >= 1)
  {
    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472LL;
    v78[2] = sub_10006722C;
    v78[3] = &unk_10034C700;
    id v79 = v65;
    v80 = v21;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v70, "enumerateKeysAndObjectsUsingBlock:", v78);
  }

  -[RestoreDemotedApplicationsOperation setError:](v21, "setError:", 0LL, v67);
  -[RestoreDemotedApplicationsOperation setSuccess:](v21, "setSuccess:", v20 & 1);
  -[RestoreDemotedApplicationsOperation _notifyCompletion](v21, "_notifyCompletion");
}

- (void)restoreDownloadItemsOperation:(id)a3 didReceiveResponse:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 requestItems]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 serverResponse]);

  v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 downloads]);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1000678C0;
  v26[3] = &unk_10034C728;
  v10 = v8;
  v27 = v10;
  [v9 enumerateObjectsUsingBlock:v26];

  if (!-[NSMutableDictionary count](v10, "count"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForKey:@"bundleID"]);
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v13) {
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v14 = [v13 shouldLog];
    else {
      LODWORD(v15) = v14;
    }
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 OSLogObject]);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v15 = v15;
    }
    else {
      v15 &= 2u;
    }
    if ((_DWORD)v15)
    {
      id v17 = (void *)objc_opt_class(self);
      id v18 = v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue([v7 error]);
      int v28 = 138412802;
      v29 = v17;
      __int16 v30 = 2112;
      unsigned __int8 v31 = v19;
      __int16 v32 = 2112;
      v33 = v12;
      char v20 = (void *)_os_log_send_and_compose_impl( v15,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "%@: Received zero downloads with error: %@, for apps: %@",  &v28,  32);

      if (!v20)
      {
LABEL_15:

        goto LABEL_16;
      }

      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v20,  4LL));
      free(v20);
      SSFileLog(v13, @"%@");
    }

    goto LABEL_15;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[DownloadsDatabase downloadsDatabase](&OBJC_CLASS___DownloadsDatabase, "downloadsDatabase"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100067938;
  v21[3] = &unk_10034C750;
  id v22 = v6;
  v23 = v10;
  v24 = self;
  id v25 = v7;
  [v11 modifyAsyncUsingTransactionBlock:v21];

  v12 = v22;
LABEL_16:
}

- (id)_appleIDForApp:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 bundleContainerURL]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:@"iTunesMetadata.plist"]);

  id v6 = -[NSMutableDictionary initWithContentsOfFile:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithContentsOfFile:",  v5);
  uint64_t v7 = v6;
  if (v6) {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v6, "objectForKey:", @"appleId"));
  }
  else {
    v8 = 0LL;
  }

  return v8;
}

- (id)_accountIdForAppleID:(id)a3
{
  id v4 = a3;
  accountsCacheDB = self->_accountsCacheDB;
  if (!accountsCacheDB)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___AccountCacheDBClient);
    uint64_t v7 = self->_accountsCacheDB;
    self->_accountsCacheDB = v6;

    accountsCacheDB = self->_accountsCacheDB;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AccountCacheDBClient dSIDForAppleID:](accountsCacheDB, "dSIDForAppleID:", v4));

  return v8;
}

- (void)_notifyCompletion
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v3, &stru_10034C770);
}

- (void).cxx_destruct
{
}

@end
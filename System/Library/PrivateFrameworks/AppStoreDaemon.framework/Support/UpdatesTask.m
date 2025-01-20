@interface UpdatesTask
- (void)main;
@end

@implementation UpdatesTask

- (void)main
{
  v2 = self;
  if (!self) {
    goto LABEL_37;
  }
  v74 = self;
  v75 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v3 = v2->super._error;
  v4 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSError count](v3, "count"));
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  v5 = v3;
  id v6 = -[NSError countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v80,  buf,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v81;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v81 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v80 + 1) + 8LL * (void)i);
        uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 storeItemID]);
        if (v11
          && (v12 = (void *)v11,
              v13 = (void *)objc_claimAutoreleasedReturnValue([v10 storeExternalVersionID]),
              v13,
              v12,
              v13))
        {
          v88[0] = @"adam-id";
          v14 = (void *)objc_claimAutoreleasedReturnValue([v10 storeItemID]);
          v88[1] = @"installed-version-identifier";
          v89[0] = v14;
          v15 = (void *)objc_claimAutoreleasedReturnValue([v10 storeExternalVersionID]);
          v89[1] = v15;
          v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v89,  v88,  2LL));

          if (v16) {
            -[NSMutableArray addObject:](v4, "addObject:", v16);
          }
        }

        else
        {

          v16 = 0LL;
        }
      }

      id v7 = -[NSError countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v80,  buf,  16LL);
    }

    while (v7);
  }

  id v17 = -[NSMutableArray copy](v4, "copy");
  if ([v17 count])
  {
    v18 = v75;
    v19 = v75;
    v20 = v17;
  }

  else
  {
    id v21 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
    v22 = (id *)objc_claimAutoreleasedReturnValue(v21);
    unsigned __int8 v23 = sub_100255FB0(v22, (uint64_t)@"updates-use-optimized-requests", 0LL);

    v18 = v75;
    if ((v23 & 1) != 0)
    {
      v24 = 0LL;
      v2 = v74;
      goto LABEL_30;
    }

    v20 = &__NSArray0__struct;
    v19 = v75;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v19,  "setObject:forKeyedSubscript:",  v20,  @"local-software",  v74);
  v2 = v74;
  v25 = +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  sub_1002FA098((uint64_t)&OBJC_CLASS___AppDefaultsManager));
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v18,  "setObject:forKeyedSubscript:",  v26,  @"autoUpdatesEnabled");

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDevice deviceGUID](&OBJC_CLASS___AMSDevice, "deviceGUID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v27, @"guid");

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&v74->super._success, "ams_DSID"));
  if (v28)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[AMSKeybag sharedInstance](&OBJC_CLASS___AMSKeybag, "sharedInstance"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&v74->super._success, "ams_DSID"));
    id v79 = 0LL;
    v31 = (void *)objc_claimAutoreleasedReturnValue([v29 keybagSyncDataWithAccountID:v30 transactionType:11 error:&v79]);
    id v32 = v79;

    if (v32)
    {
      uint64_t v33 = ASDLogHandleForCategory(40LL);
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        apps = v74->_apps;
        v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&v74->super._success, "ams_DSID"));
        *(_DWORD *)buf = 138412546;
        v85 = apps;
        __int16 v86 = 2114;
        id v87 = v71;
        _os_log_error_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "[%@] Error generating keybag for account: %{public}@",  buf,  0x16u);
      }
    }

    if ([v31 length])
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue([v31 base64EncodedStringWithOptions:0]);
      if (v35) {
        -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v35, @"kbsync");
      }
    }
  }

  v24 = v18;
LABEL_30:

  if (!v24)
  {
LABEL_37:
    v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  ASDErrorDomain,  901LL,  0LL,  v74));
    -[Task completeWithError:](v2, "completeWithError:", v46);

    v24 = 0LL;
    goto LABEL_53;
  }

  int account_low = LOBYTE(v2->_account);
  id v37 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  v39 = v38;
  v40 = off_1003F0680;
  if (account_low) {
    v40 = off_1003F0698;
  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "URLForKey:", *v40, v74));

  id v78 = 0LL;
  v42 = (void *)objc_claimAutoreleasedReturnValue([v41 valueWithError:&v78]);
  id v43 = v78;

  if (v43)
  {
    uint64_t v44 = ASDLogHandleForCategory(40LL);
    v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      v69 = v2->_apps;
      *(_DWORD *)buf = 138412546;
      v85 = v69;
      __int16 v86 = 2114;
      id v87 = v43;
      _os_log_error_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_ERROR,  "[%@] Error generating updates URL. Error: %{public}@",  buf,  0x16u);
    }

    -[Task completeWithError:](v2, "completeWithError:", v43);
  }

  else
  {
    id v47 = sub_1001ECDD8(v42, &off_10040E150);
    uint64_t v48 = objc_claimAutoreleasedReturnValue(v47);

    v49 = objc_alloc(&OBJC_CLASS___AMSURLRequestEncoder);
    id v50 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
    v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
    v52 = -[AMSURLRequestEncoder initWithBag:](v49, "initWithBag:", v51);

    -[AMSURLRequestEncoder setCompressRequestBody:](v52, "setCompressRequestBody:", 1LL);
    v53 = *(void **)&v2->super._success;
    if (v53)
    {
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "ams_DSID"));

      if (v54) {
        -[AMSURLRequestEncoder setAccount:](v52, "setAccount:", *(void *)&v2->super._success);
      }
    }

    v55 = (void *)objc_claimAutoreleasedReturnValue( -[AMSURLRequestEncoder requestWithMethod:URL:parameters:]( v52,  "requestWithMethod:URL:parameters:",  4LL,  v48,  v24));
    id v77 = 0LL;
    v56 = (void *)objc_claimAutoreleasedReturnValue([v55 resultWithError:&v77]);
    id v43 = v77;

    if (v43)
    {
      uint64_t v57 = ASDLogHandleForCategory(40LL);
      v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        v72 = v2->_apps;
        *(_DWORD *)buf = 138412546;
        v85 = v72;
        __int16 v86 = 2114;
        id v87 = v43;
        _os_log_error_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_ERROR,  "[%@] Error encoding request: %{public}@",  buf,  0x16u);
      }

      -[Task completeWithError:](v2, "completeWithError:", v43);
    }

    else
    {
      v59 = (void *)objc_claimAutoreleasedReturnValue(+[AMSURLSession defaultSession](&OBJC_CLASS___AMSURLSession, "defaultSession"));
      v60 = (void *)objc_claimAutoreleasedReturnValue([v59 dataTaskPromiseWithRequest:v56]);

      id v76 = 0LL;
      v61 = (void *)objc_claimAutoreleasedReturnValue([v60 resultWithError:&v76]);
      id v43 = v76;
      if (v43)
      {
        uint64_t v62 = ASDLogHandleForCategory(40LL);
        v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          v73 = v2->_apps;
          *(_DWORD *)buf = 138412546;
          v85 = v73;
          __int16 v86 = 2114;
          id v87 = v43;
          _os_log_error_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_ERROR,  "[%@] Error fetching updates: %{public}@",  buf,  0x16u);
        }

        -[Task completeWithError:](v2, "completeWithError:", v43);
      }

      else
      {
        v64 = objc_alloc(&OBJC_CLASS___UpdatesResponse);
        v65 = v2;
        v66 = (void *)objc_claimAutoreleasedReturnValue([v61 object]);
        v67 = sub_1002E4428(v64, v66);
        v68 = *(void **)&v65->_isUserInitiated;
        *(void *)&v65->_isUserInitiated = v67;

        -[Task completeWithSuccess](v65, "completeWithSuccess");
      }
    }

    v42 = (void *)v48;
  }

LABEL_53:
}

- (void).cxx_destruct
{
}

@end
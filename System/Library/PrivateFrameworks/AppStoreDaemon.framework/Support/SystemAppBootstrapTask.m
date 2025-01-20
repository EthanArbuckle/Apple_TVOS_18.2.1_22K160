@interface SystemAppBootstrapTask
- (void)main;
@end

@implementation SystemAppBootstrapTask

- (void)main
{
  uint64_t v3 = ASDLogHandleForCategory(2LL);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)&self->super._success count];
    *(_DWORD *)buf = 134217984;
    id v101 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Attempting to bootstrap %lu system app(s)",  buf,  0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&self->super._success allKeys]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);
  v9 = sub_10024DC0C((uint64_t)&OBJC_CLASS___SystemAppLookupTask, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  id v91 = 0LL;
  unsigned int v11 = -[Task runSubTask:returningError:](self, "runSubTask:returningError:", v10, &v91);
  id v13 = v91;
  v78 = v7;
  if (v11)
  {
    __int128 v89 = 0u;
    __int128 v90 = 0u;
    __int128 v87 = 0u;
    __int128 v88 = 0u;
    if (v10) {
      id Property = objc_getProperty(v10, v12, 48LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id obj = Property;
    id v81 = [obj countByEnumeratingWithState:&v87 objects:v98 count:16];
    v76 = v10;
    if (!v81)
    {
LABEL_41:

      __int128 v84 = 0u;
      __int128 v85 = 0u;
      __int128 v82 = 0u;
      __int128 v83 = 0u;
      id v46 = v7;
      id v47 = [v46 countByEnumeratingWithState:&v82 objects:v96 count:16];
      if (v47)
      {
        id v48 = v47;
        uint64_t v49 = *(void *)v83;
        do
        {
          for (i = 0LL; i != v48; i = (char *)i + 1)
          {
            if (*(void *)v83 != v49) {
              objc_enumerationMutation(v46);
            }
            v51 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)&self->super._success objectForKeyedSubscript:*(void *)(*((void *)&v82 + 1) + 8 * (void)i)]);
            [v51 setValue:&off_10040BDA0 forProperty:@"phase"];
          }

          id v48 = [v46 countByEnumeratingWithState:&v82 objects:v96 count:16];
        }

        while (v48);
      }

      -[Task lock](self, "lock");
      v52 = (NSError *)objc_claimAutoreleasedReturnValue([*(id *)&self->super._success allValues]);
      error = self->super._error;
      self->super._error = v52;

      -[Task unlock](self, "unlock");
      -[Task completeWithSuccess](self, "completeWithSuccess");
      v10 = v76;
      goto LABEL_74;
    }

    uint64_t v80 = *(void *)v88;
    v77 = self;
LABEL_8:
    uint64_t v15 = 0LL;
    while (1)
    {
      if (*(void *)v88 != v80) {
        objc_enumerationMutation(obj);
      }
      v16 = *(void **)(*((void *)&v87 + 1) + 8 * v15);
      v17 = *(void **)&self->super._success;
      v18 = v16 ? (void *)v16[2] : 0LL;
      id v19 = v18;
      v20 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v19]);

      if (v20) {
        break;
      }
      uint64_t v37 = ASDLogHandleForCategory(2LL);
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        if (v16) {
          v38 = (void *)v16[2];
        }
        else {
          v38 = 0LL;
        }
        id v28 = v38;
        *(_DWORD *)buf = 138543362;
        id v101 = v28;
        _os_log_fault_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_FAULT,  "Received item for unexpected system app: %{public}@",  buf,  0xCu);
LABEL_30:
      }

      if (v16) {
        v43 = (void *)v16[2];
      }
      else {
        v43 = 0LL;
      }
      id v44 = v43;
      [v7 removeObject:v44];

      if (v81 == (id)++v15)
      {
        id v45 = [obj countByEnumeratingWithState:&v87 objects:v98 count:16];
        id v81 = v45;
        if (!v45) {
          goto LABEL_41;
        }
        goto LABEL_8;
      }
    }

    v21 = (os_log_s *)sub_100191A50(objc_alloc(&OBJC_CLASS___AppPackage), v16);
    v97 = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v97, 1LL));
    objc_setProperty_atomic_copy(v20, v23, v22, 40LL);

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    [v20 setValue:v24 forProperty:@"failure_error"];

    [v20 setValue:&off_10040BD88 forProperty:@"bootstrapped"];
    if (v16) {
      v25 = (void *)v16[8];
    }
    else {
      v25 = 0LL;
    }
    id v26 = v25;
    [v20 setValue:v26 forProperty:@"bundle_name"];

    v27 = sub_1002E5EDC((uint64_t)&OBJC_CLASS___AppInstallPolicy);
    id v28 = (id)objc_claimAutoreleasedReturnValue(v27);
    if (((unint64_t)sub_1001E2698(v20, (uint64_t)@"IFNULL(app_install.priority, 0)") & 0x8000000000000000LL) != 0)
    {
      sub_1002E60D4((uint64_t)v28, 3LL);
      sub_1002E6174((uint64_t)v28, 3LL);
      sub_1002E5F7C((uint64_t)v28, 62LL);
    }

    else
    {
      id v30 = objc_getProperty(v20, v29, 40LL, 1);
      v31 = v13;
      v32 = (void *)objc_claimAutoreleasedReturnValue([v30 firstObject]);
      v33 = sub_1002D6750(v20, v32);

      v34 = (uint64_t *)sub_1002D883C((id *)objc_alloc(&OBJC_CLASS___ReviewNetworkPolicyTask), v33);
      id v86 = v31;
      unsigned int v35 = -[Task runSubTask:returningError:](self, "runSubTask:returningError:", v34, &v86);
      id v13 = v86;

      if (v35)
      {
        if (v34)
        {
          sub_1002E60D4((uint64_t)v28, v34[7]);
          sub_1002E6174((uint64_t)v28, v34[8]);
          uint64_t v36 = v34[9];
        }

        else
        {
          sub_1002E60D4((uint64_t)v28, 0LL);
          sub_1002E6174((uint64_t)v28, 0LL);
          uint64_t v36 = 0LL;
        }

        sub_1002E5F7C((uint64_t)v28, v36);
      }

      self = v77;
      v7 = v78;
    }

    sub_100323D30(v20, (id *)v28);
    uint64_t v39 = ASDLogHandleForCategory(2LL);
    v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      v41 = sub_100323C54(v20);
      v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
      *(_DWORD *)buf = 138412290;
      id v101 = v42;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "[%@] Bootstrap completed", buf, 0xCu);
    }

    goto LABEL_30;
  }

  uint64_t v54 = ASDLogHandleForCategory(2LL);
  v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
  if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
  {
    id v75 = [*(id *)&self->super._success count];
    *(_DWORD *)buf = 134218242;
    id v101 = v75;
    __int16 v102 = 2114;
    id v103 = v13;
    _os_log_error_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_ERROR,  "Bootstrap for %lu system app(s) failed with error: %{public}@",  buf,  0x16u);
  }

  id v56 = v13;
  __int128 v92 = 0u;
  __int128 v93 = 0u;
  __int128 v94 = 0u;
  __int128 v95 = 0u;
  v57 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&self->super._success objectEnumerator]);
  id v58 = [v57 countByEnumeratingWithState:&v92 objects:buf count:16];
  if (!v58) {
    goto LABEL_72;
  }
  id v59 = v58;
  uint64_t v60 = *(void *)v93;
  while (2)
  {
    for (j = 0LL; j != v59; j = (char *)j + 1)
    {
      if (*(void *)v93 != v60) {
        objc_enumerationMutation(v57);
      }
      if (!sub_1001E2598( *(id *)(*((void *)&v92 + 1) + 8LL * (void)j),  (uint64_t)@"supress_dialogs"))
      {

        id v62 = v56;
        objc_opt_self(&OBJC_CLASS___SystemAppBootstrapTask);
        id v63 = v62;
        v64 = (void *)objc_claimAutoreleasedReturnValue([v63 domain]);
        unsigned int v65 = [v64 isEqualToString:ASDErrorDomain];

        if (v65)
        {
          v66 = (void *)objc_claimAutoreleasedReturnValue([v63 userInfo]);
          v67 = (void *)objc_claimAutoreleasedReturnValue([v66 objectForKeyedSubscript:NSUnderlyingErrorKey]);

          id v68 = v63;
          v7 = v78;
          if (v67)
          {
            id v68 = v67;
          }

          if ([v63 code] == (id)513) {
            v69 = @"Basejumper does not have assets for this build. Please try again later.";
          }
          else {
            v69 = @"Unable to connect to basejumper. Make sure you are on an internal network or have VPN on-demand enabled.";
          }

          if (!v68) {
            goto LABEL_71;
          }
        }

        else
        {
          v69 = @"An unknown error occurred. Make sure you are on an internal network or have VPN on-demand enabled.";
          id v68 = v63;
          v7 = v78;
          if (!v63)
          {
LABEL_71:

            v57 = (void *)objc_claimAutoreleasedReturnValue( +[AMSDialogRequest requestWithTitle:message:]( &OBJC_CLASS___AMSDialogRequest,  "requestWithTitle:message:",  @"Internal Only",  v69));
            uint64_t v71 = ASDLocalizedString(@"OK");
            v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
            v73 = (void *)objc_claimAutoreleasedReturnValue( +[AMSDialogAction actionWithTitle:style:]( &OBJC_CLASS___AMSDialogAction,  "actionWithTitle:style:",  v72,  0LL));

            v99 = v73;
            v74 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v99,  1LL));
            [v57 setButtonActions:v74];

            sub_100321874(v57, @"systemAppBootstrapInternal");
            sub_1001D7974(v73, @"ok");
            sub_10027808C((uint64_t)&OBJC_CLASS___InteractiveRequestPresenter, v57, 0LL);

            goto LABEL_72;
          }
        }

        v70 = (void *)objc_claimAutoreleasedReturnValue([v68 domain]);
        v69 = (__CFString *)objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingFormat:]( v69,  "stringByAppendingFormat:",  @" (%@: %ld)",  v70,  [v68 code]));

        goto LABEL_71;
      }
    }

    id v59 = [v57 countByEnumeratingWithState:&v92 objects:buf count:16];
    if (v59) {
      continue;
    }
    break;
  }

  v7 = v78;
LABEL_72:

LABEL_73:
  -[Task completeWithError:](self, "completeWithError:", v13);
LABEL_74:
}

- (void).cxx_destruct
{
}

@end
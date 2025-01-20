@interface UpdatesBatchTask
- (void)main;
@end

@implementation UpdatesBatchTask

- (void)main
{
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472LL;
  v77 = sub_1002E8C7C;
  v78 = &unk_1003F2268;
  v79 = self;
  v3 = v76;
  v72 = self;
  if (self)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
    v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    v6 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    id v7 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    unsigned int v9 = sub_100256DD0(v8, @"ignore-maid-accounts", 0LL, 0);

    if (v9)
    {
      v10 = v6;
      v6 = (NSMutableArray *)[*(id *)&v72->super._success mutableCopy];
    }

    else
    {
      v70 = v4;
      v71 = v3;
      __int128 v90 = 0u;
      __int128 v91 = 0u;
      __int128 v88 = 0u;
      __int128 v89 = 0u;
      id v11 = *(id *)&self->super._success;
      id v12 = [v11 countByEnumeratingWithState:&v88 objects:v101 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v89;
        do
        {
          for (i = 0LL; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v89 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v88 + 1) + 8LL * (void)i);
            if ([v16 isB2BCustomApp])
            {
              v17 = objc_alloc(&OBJC_CLASS___UpdatableApp);
              v18 = (void *)objc_claimAutoreleasedReturnValue([v16 storeItemID]);
              v19 = (void *)objc_claimAutoreleasedReturnValue([v16 storeExternalVersionID]);
              v20 = sub_100270D60((id *)&v17->super.isa, v18, v19);
              -[NSMutableArray addObject:](v5, "addObject:", v20);
            }

            else
            {
              -[NSMutableArray addObject:](v6, "addObject:", v16);
            }
          }

          id v13 = [v11 countByEnumeratingWithState:&v88 objects:v101 count:16];
        }

        while (v13);
      }

      if (!-[NSMutableArray count](v5, "count"))
      {
        v3 = v71;
LABEL_42:
        v4 = v70;
        goto LABEL_43;
      }

      __int128 v86 = 0u;
      __int128 v87 = 0u;
      __int128 v84 = 0u;
      __int128 v85 = 0u;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
      v22 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "ams_iTunesAccounts"));

      id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v84,  v100,  16LL);
      v3 = v71;
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v85;
LABEL_17:
        uint64_t v26 = 0LL;
        while (1)
        {
          if (*(void *)v85 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v84 + 1) + 8 * v26);
          if (v24 == (id)++v26)
          {
            id v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v84,  v100,  16LL);
            if (v24) {
              goto LABEL_17;
            }
            goto LABEL_23;
          }
        }

        v28 = v27;

        if (!v28) {
          goto LABEL_42;
        }
        uint64_t v29 = ASDLogHandleForCategory(40LL);
        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          error = v72->super._error;
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray ams_DSID](v28, "ams_DSID"));
          *(_DWORD *)buf = 138412546;
          v97 = error;
          __int16 v98 = 2114;
          v99 = v32;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "[%@] ╒ Checking for updates for MAID: %{public}@",  buf,  0x16u);
        }

        v69 = v28;

        __int128 v83 = 0u;
        __int128 v81 = 0u;
        __int128 v82 = 0u;
        __int128 v80 = 0u;
        v33 = v5;
        id v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v33,  "countByEnumeratingWithState:objects:count:",  &v80,  buf,  16LL);
        if (v34)
        {
          id v35 = v34;
          uint64_t v36 = *(void *)v81;
          do
          {
            for (j = 0LL; j != v35; j = (char *)j + 1)
            {
              if (*(void *)v81 != v36) {
                objc_enumerationMutation(v33);
              }
              uint64_t v38 = *(void *)(*((void *)&v80 + 1) + 8LL * (void)j);
              uint64_t v39 = ASDLogHandleForCategory(40LL);
              v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
              {
                v41 = v72->super._error;
                *(_DWORD *)v92 = 138412546;
                *(void *)&v92[4] = v41;
                *(_WORD *)&v92[12] = 2114;
                *(void *)&v92[14] = v38;
                _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "[%@] ├ %{public}@", v92, 0x16u);
              }
            }

            id v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v33,  "countByEnumeratingWithState:objects:count:",  &v80,  buf,  16LL);
          }

          while (v35);
        }

        uint64_t v42 = ASDLogHandleForCategory(40LL);
        v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          v44 = v72->super._error;
          *(_DWORD *)v92 = 138412290;
          *(void *)&v92[4] = v44;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "[%@] ╘", v92, 0xCu);
        }

        v3 = v71;
        v10 = v69;
        v77((uint64_t)v71, v69, v33);
      }

      else
      {
LABEL_23:
        v10 = v22;
      }

      v4 = v70;
    }

LABEL_43:
    v45 = sub_1002B8330((NSDictionary *)v6, &stru_1003F22D0);
    v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
    *(void *)v92 = _NSConcreteStackBlock;
    *(void *)&v92[8] = 3221225472LL;
    *(void *)&v92[16] = sub_1002E952C;
    v93 = &unk_1003F22F8;
    id v94 = v4;
    v95 = v3;
    id v47 = v4;
    [v46 enumerateKeysAndObjectsUsingBlock:v92];
  }

  v48 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  logKey = v72->_logKey;
  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472LL;
  v74[2] = sub_1002E9494;
  v74[3] = &unk_1003F2290;
  v50 = v48;
  v75 = v50;
  -[LogKey enumerateObjectsUsingBlock:](logKey, "enumerateObjectsUsingBlock:", v74);
  v51 = sub_1002C9B88((uint64_t)&OBJC_CLASS___ForcedUpdatesTask, v50, v72->super._error);
  v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
  id v73 = 0LL;
  unsigned int v53 = -[Task runSubTask:returningError:](v72, "runSubTask:returningError:", v52, &v73);
  id v54 = v73;
  if (!v53)
  {
    uint64_t v67 = ASDLogHandleForCategory(40LL);
    v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    {
      v68 = v72->super._error;
      *(_DWORD *)v101 = 138412546;
      v102 = v68;
      __int16 v103 = 2114;
      id v104 = v54;
      _os_log_error_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_ERROR,  "[%@] Failed to run forced updates task: %{public}@",  v101,  0x16u);
    }

    goto LABEL_57;
  }

  if (v52) {
    v55 = (void *)v52[7];
  }
  else {
    v55 = 0LL;
  }
  id v56 = v55;
  id v57 = [v56 count];

  if (v57)
  {
    uint64_t v58 = ASDLogHandleForCategory(40LL);
    v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      v60 = v72->super._error;
      if (v52) {
        v61 = (void *)v52[7];
      }
      else {
        v61 = 0LL;
      }
      id v62 = v61;
      id v63 = [v62 count];
      *(_DWORD *)v101 = 138412546;
      v102 = v60;
      __int16 v103 = 2048;
      id v104 = v63;
      _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "[%@] Received %lu forced update(s)",  v101,  0x16u);
    }

    v64 = v72->_logKey;
    if (v52) {
      v65 = (void *)v52[7];
    }
    else {
      v65 = 0LL;
    }
    v66 = v65;
    -[LogKey addObjectsFromArray:](v64, "addObjectsFromArray:", v66);
LABEL_57:
  }

  -[Task completeWithSuccess](v72, "completeWithSuccess");
}

- (void).cxx_destruct
{
}

@end
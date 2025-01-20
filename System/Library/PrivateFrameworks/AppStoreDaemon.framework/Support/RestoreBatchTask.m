@interface RestoreBatchTask
- (void)main;
@end

@implementation RestoreBatchTask

- (void)main
{
  uint64_t v3 = ASDLogHandleForCategory(29LL);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (_TtC9appstored6LogKey *)-[NSError count](self->super._error, "count");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->super._success, "ams_DSID"));
    *(_DWORD *)buf = 134218242;
    v203 = v5;
    __int16 v204 = 2114;
    uint64_t v205 = (uint64_t)v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Starting batch restore for %ld items with accountID: %{public}@",  buf,  0x16u);
  }

  if (!-[NSError count](self->super._error, "count"))
  {
    uint64_t v102 = ASDErrorWithTitleAndMessage( ASDErrorDomain,  507LL,  @"Please provide one or more restore items to restore",  0LL);
    v103 = (void *)objc_claimAutoreleasedReturnValue(v102);
    objc_setProperty_atomic_copy(self, v104, v103, 32LL);

LABEL_62:
    LOBYTE(self->super._keepAlive) = 0;
    return;
  }

  id v8 = objc_getProperty(self, v7, 40LL, 1);
  v9 = *(void **)&self->super._success;
  *(void *)&self->super._success = v8;

  if (!*(void *)&self->super._success)
  {
    uint64_t v10 = ASDLogHandleForCategory(29LL);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Using the active account for content restore call",  buf,  2u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
    uint64_t v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ams_activeiTunesAccount"));
    v14 = *(void **)&self->super._success;
    *(void *)&self->super._success = v13;

    if (!*(void *)&self->super._success)
    {
      uint64_t v126 = ASDErrorDomain;
      v127 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unable to determine account for content restore. Requested account: %@",  objc_getProperty(self, v15, 40LL, 1));
      v128 = (void *)objc_claimAutoreleasedReturnValue(v127);
      uint64_t v129 = ASDErrorWithTitleAndMessage(v126, 507LL, v128, 0LL);
      v130 = (void *)objc_claimAutoreleasedReturnValue(v129);
      objc_setProperty_atomic_copy(self, v131, v130, 32LL);

      goto LABEL_62;
    }
  }

  v177 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSError count](self->super._error, "count"));
  v169 = self;
  if (((uint64_t)self->_account & 1) != 0 || !sub_1002FA098((uint64_t)&OBJC_CLASS___AppDefaultsManager))
  {
    v16 = (NSError *)objc_alloc_init(&OBJC_CLASS___ASDCoastGuard);
    id v27 = sub_1002F9B60((uint64_t)&OBJC_CLASS___AppDefaultsManager);
    selfa = (id)objc_claimAutoreleasedReturnValue(v27);
    __int128 v184 = 0u;
    __int128 v185 = 0u;
    __int128 v186 = 0u;
    __int128 v187 = 0u;
    v28 = self->super._error;
    id v29 = -[NSError countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v184,  v198,  16LL);
    if (!v29) {
      goto LABEL_45;
    }
    id v30 = v29;
    uint64_t v31 = *(void *)v185;
    while (1)
    {
      for (i = 0LL; i != v30; i = (char *)i + 1)
      {
        if (*(void *)v185 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = *(_BYTE **)(*((void *)&v184 + 1) + 8LL * (void)i);
        id v34 = sub_100323DD0(v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
        id v36 = [v35 unsignedLongLongValue];
        v37 = sub_1002D7968(v33);
        v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
        LODWORD(v36) = -[NSError isUnrepairableAppWithItemID:externalVersionID:]( v16,  "isUnrepairableAppWithItemID:externalVersionID:",  v36,  [v38 unsignedLongLongValue]);

        if (!(_DWORD)v36)
        {
          id v46 = sub_100323D88(v33);
          v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
          v45 = (void *)objc_claimAutoreleasedReturnValue([selfa objectForKeyedSubscript:v47]);

          id v48 = [v45 longLongValue];
          v49 = sub_1002D7968(v33);
          v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
          id v51 = [v50 longLongValue];

          uint64_t v52 = ASDLogHandleForCategory(29LL);
          v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
          BOOL v54 = os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT);
          if ((uint64_t)v48 >= (uint64_t)v51)
          {
            if (v54)
            {
              id v55 = sub_100323D88(v33);
              v56 = (_TtC9appstored6LogKey *)objc_claimAutoreleasedReturnValue(v55);
              *(_DWORD *)buf = 138543362;
              v203 = v56;
              _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "Fetching latest version of %{public}@ due to code signature error",  buf,  0xCu);
            }

            if (v33) {
              v33[56] = 1;
            }
          }

          else
          {
            if (v54)
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "Skipping initial latest version fetch for batch",  buf,  2u);
            }
          }

          goto LABEL_42;
        }

        uint64_t v39 = ASDLogHandleForCategory(29LL);
        v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Fetching latest version since this evid is known to have been unrepairable",  buf,  2u);
        }

        if (v33) {
          v33[56] = 1;
        }
        id v41 = sub_100323D88(v33);
        v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
        id v43 = [v42 length];

        if (v43)
        {
          id v44 = sub_100323D88(v33);
          v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
          -[NSMutableArray addObject:](v177, "addObject:", v45);
LABEL_42:

          continue;
        }
      }

      id v30 = -[NSError countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v184,  v198,  16LL);
      if (!v30)
      {
LABEL_45:

        self = v169;
        goto LABEL_46;
      }
    }
  }

  __int128 v190 = 0u;
  __int128 v191 = 0u;
  __int128 v188 = 0u;
  __int128 v189 = 0u;
  v16 = self->super._error;
  id v17 = -[NSError countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v188,  v199,  16LL);
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v189;
    do
    {
      for (j = 0LL; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v189 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(_BYTE **)(*((void *)&v188 + 1) + 8LL * (void)j);
        if (v21) {
          v21[56] = 1;
        }
        id v22 = sub_100323D88(v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        id v24 = [v23 length];

        if (v24)
        {
          id v25 = sub_100323D88(v21);
          v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
          -[NSMutableArray addObject:](v177, "addObject:", v26);
        }
      }

      id v18 = -[NSError countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v188,  v199,  16LL);
    }

    while (v18);
  }

- (void).cxx_destruct
{
}

@end
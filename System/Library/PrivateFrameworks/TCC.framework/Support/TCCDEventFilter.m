@interface TCCDEventFilter
- (BOOL)matches:(id)a3;
- (TCCDEventFilter)initWithCriteria:(id)a3;
@end

@implementation TCCDEventFilter

- (TCCDEventFilter)initWithCriteria:(id)a3
{
  id v4 = a3;
  v62.receiver = self;
  v62.super_class = (Class)&OBJC_CLASS___TCCDEventFilter;
  v5 = -[TCCDEventFilter init](&v62, "init");
  if (!v5) {
    goto LABEL_25;
  }
  v6 = (void *)_CFXPCCreateCFObjectFromXPCObject(v4);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
  {
    id v35 = tcc_events_log();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10001BEFC((uint64_t)v6, (uint64_t)v9, v36, v37);
    }
LABEL_32:

    v34 = 0LL;
    goto LABEL_33;
  }

  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  v9 = v6;
  id v53 = -[os_log_s countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v58,  v64,  16LL);
  if (!v53) {
    goto LABEL_24;
  }
  uint64_t v11 = *(void *)v59;
  v12 = &selRef_responsibleProcessIsDistinct;
  v50 = v6;
  id v51 = v4;
  v52 = v9;
  uint64_t v49 = *(void *)v59;
  while (2)
  {
    v13 = 0LL;
    v14 = &AnalyticsSendEventLazy_ptr;
    do
    {
      if (*(void *)v59 != v11) {
        objc_enumerationMutation(v9);
      }
      uint64_t v15 = *(void *)(*((void *)&v58 + 1) + 8LL * (void)v13);
      uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSString, v10);
      if ((objc_opt_isKindOfClass(v15, v16) & 1) == 0)
      {
        id v41 = tcc_events_log();
        v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          sub_10001BE90(v15, (uint64_t)v42, v43, v44);
        }
        goto LABEL_38;
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue([v12 + 425 currentPlatform]);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 serviceByName:v15]);

      if (!v18)
      {
        id v45 = tcc_events_log();
        v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          sub_10001BD14(v15, v42);
        }
LABEL_38:

        v6 = v50;
        id v4 = v51;
        goto LABEL_32;
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v15));
      uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSNumber, v20);
      if ((objc_opt_isKindOfClass(v19, v21) & 1) == 0)
      {
        uint64_t v23 = objc_opt_class(v14[42], v22);
        if ((objc_opt_isKindOfClass(v19, v23) & 1) == 0)
        {
          id v46 = tcc_events_log();
          v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
          v6 = v50;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            sub_10001BE24((uint64_t)v19, (uint64_t)v25, v47, v48);
          }
LABEL_31:

          id v4 = v51;
          goto LABEL_32;
        }
      }

      uint64_t v24 = objc_opt_class(v14[42], v22);
      if ((objc_opt_isKindOfClass(v19, v24) & 1) != 0)
      {
        __int128 v56 = 0u;
        __int128 v57 = 0u;
        __int128 v54 = 0u;
        __int128 v55 = 0u;
        v25 = v19;
        id v26 = -[os_log_s countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v54,  v63,  16LL);
        if (v26)
        {
          id v28 = v26;
          uint64_t v29 = *(void *)v55;
          while (2)
          {
            v30 = 0LL;
            do
            {
              if (*(void *)v55 != v29) {
                objc_enumerationMutation(v25);
              }
              uint64_t v31 = *(void *)(*((void *)&v54 + 1) + 8LL * (void)v30);
              uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSString, v27);
              if ((objc_opt_isKindOfClass(v31, v32) & 1) == 0)
              {
                id v38 = tcc_events_log();
                v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
                if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
                  sub_10001BD88(v31, (uint64_t)v25, v39);
                }

                v6 = v50;
                v9 = v52;
                goto LABEL_31;
              }

              v30 = (char *)v30 + 1;
            }

            while (v28 != v30);
            id v28 = -[os_log_s countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v54,  v63,  16LL);
            if (v28) {
              continue;
            }
            break;
          }
        }

        v9 = v52;
        uint64_t v11 = v49;
        v12 = &selRef_responsibleProcessIsDistinct;
        v14 = &AnalyticsSendEventLazy_ptr;
      }

      v13 = (char *)v13 + 1;
    }

    while (v13 != v53);
    id v4 = v51;
    id v53 = -[os_log_s countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v58,  v64,  16LL);
    if (v53) {
      continue;
    }
    break;
  }

- (BOOL)matches:(id)a3
{
  id v4 = a3;
  if (-[NSDictionary count](self->_servicesToSubjects, "count"))
  {
    servicesToSubjects = self->_servicesToSubjects;
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 service]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](servicesToSubjects, "objectForKeyedSubscript:", v7));

    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber, v9);
    if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0 && ([v8 BOOLValue] & 1) != 0
      || (uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSArray, v11), (objc_opt_isKindOfClass(v8, v12) & 1) != 0)
      && (v13 = (void *)objc_claimAutoreleasedReturnValue([v4 subjectIdentifier]),
          unsigned __int8 v14 = [v8 containsObject:v13],
          v13,
          (v14 & 1) != 0))
    {
      unsigned __int8 v15 = 1;
    }

    else
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_servicesToSubjects,  "objectForKeyedSubscript:",  @"kTCCServiceAll"));
      uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSNumber, v17);
      if (objc_opt_isKindOfClass(v16, v18) & 1) != 0 && ([v16 BOOLValue])
      {
        unsigned __int8 v15 = 1;
      }

      else
      {
        uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSArray, v19);
        if ((objc_opt_isKindOfClass(v16, v20) & 1) != 0)
        {
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v4 subjectIdentifier]);
          unsigned __int8 v15 = [v16 containsObject:v21];
        }

        else
        {
          unsigned __int8 v15 = 0;
        }
      }
    }
  }

  else
  {
    unsigned __int8 v15 = 1;
  }

  return v15;
}

- (void).cxx_destruct
{
}

@end
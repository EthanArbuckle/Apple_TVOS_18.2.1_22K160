@interface PerformUpdatesTask
- (NSArray)jobResults;
- (NSArray)orderedBundleIDs;
- (PerformUpdatesTask)initWithContext:(id)a3;
- (_TtC9appstored14UpdatesContext)context;
- (void)completeWithError:(id)a3;
- (void)completeWithSuccess;
- (void)main;
- (void)setContext:(id)a3;
- (void)setOrderedBundleIDs:(id)a3;
@end

@implementation PerformUpdatesTask

- (PerformUpdatesTask)initWithContext:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PerformUpdatesTask;
  v6 = -[Task init](&v12, "init");
  if (v6)
  {
    v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    v8 = *(void **)&v6->super._success;
    *(void *)&v6->super._success = v7;

    v9 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    error = v6->super._error;
    v6->super._error = (NSError *)v9;

    objc_storeStrong((id *)&v6->_jobResultItems, a3);
  }

  return v6;
}

- (NSArray)jobResults
{
  id v3 = -[NSError copy](self->super._error, "copy");
  -[Task unlock](self, "unlock");
  return (NSArray *)v3;
}

- (void)completeWithSuccess
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PerformUpdatesTask;
  -[Task completeWithSuccess](&v3, "completeWithSuccess");
}

- (void)completeWithError:(id)a3
{
  id v4 = a3;
  sub_1001CF92C((uint64_t)self);
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PerformUpdatesTask;
  -[Task completeWithError:](&v5, "completeWithError:", v4);
}

- (void)main
{
  uint64_t v2 = ASDLogHandleForCategory(40LL);
  objc_super v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PerformUpdatesTask context](self, "context"));
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 logKey]);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PerformUpdatesTask context](self, "context"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 humanReadableReason]);
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[%@] Perform updates start with reason: %{public}@",  buf,  0x16u);
  }

  if (self)
  {
    if (LODWORD(self->_updatesPurchases)) {
      sub_1001CF92C((uint64_t)self);
    }
    Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(Mutable, @"AssertType", @"PreventUserIdleSystemSleep");
    else {
      v9 = @"User";
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray logKey](self->_jobResultItems, "logKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Update All (%@) - %@",  v9,  v10));

    CFDictionarySetValue(Mutable, @"AssertName", v11);
    if ((-[NSMutableArray isBackgroundRequest](self->_jobResultItems, "isBackgroundRequest") & 1) == 0)
    {
      CFDictionarySetValue(Mutable, @"TimeoutSeconds", &off_10040C310);
      CFDictionarySetValue(Mutable, @"TimeoutAction", @"TimeoutActionTurnOff");
    }

    IOReturn v12 = IOPMAssertionCreateWithProperties(Mutable, (IOPMAssertionID *)&self->_updatesPurchases);
    uint64_t v13 = ASDLogHandleForCategory(40LL);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    v15 = v14;
    if (v12)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray logKey](self->_jobResultItems, "logKey"));
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v16;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v12;
        _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "[%@] Failed to obtain a power assertion: %d",  buf,  0x12u);
      }
    }

    else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray logKey](self->_jobResultItems, "logKey"));
      int updatesPurchases = (int)self->_updatesPurchases;
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = updatesPurchases;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[%@] Obtained power assertion: %d",  buf,  0x12u);
    }

    CFRelease(Mutable);
  }

  v19 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v77 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v20 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v21 = sub_100237D18((uint64_t)&OBJC_CLASS___AppUpdatesDatabaseStore);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v105[0] = _NSConcreteStackBlock;
  v105[1] = 3221225472LL;
  v105[2] = sub_1001D0774;
  v105[3] = &unk_1003EB9C8;
  v85 = v19;
  v106 = v85;
  v76 = v20;
  v107 = v76;
  [v22 readUsingSession:v105];

  id v23 = [*(id *)&self->_powerAssertionID count];
  v24 = v76;
  if (v23) {
    v24 = *(NSMutableArray **)&self->_powerAssertionID;
  }
  v25 = v24;
  v26 = sub_1002736B8((uint64_t)&OBJC_CLASS___Restrictions, 0LL);
  v75 = (void *)objc_claimAutoreleasedReturnValue(v26);
  id v83 = [v75 integerValue];
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  __int128 v101 = 0u;
  __int128 v102 = 0u;
  obj = v25;
  id v86 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v101,  v113,  16LL);
  if (!v86)
  {

    goto LABEL_57;
  }

  uint64_t v80 = 0LL;
  uint64_t v84 = *(void *)v102;
  do
  {
    for (i = 0LL; i != v86; i = (char *)i + 1)
    {
      if (*(void *)v102 != v84) {
        objc_enumerationMutation(obj);
      }
      uint64_t v28 = *(void *)(*((void *)&v101 + 1) + 8LL * (void)i);
      v29 = objc_autoreleasePoolPush();
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v85, "objectForKeyedSubscript:", v28));
      v31 = v30;
      if (v30)
      {
        if ((uint64_t)[v30 parentalControlsRank] > (uint64_t)v83)
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue( +[ASDJobResult resultWithRestrictedActivity:bundleID:]( ASDJobResult,  "resultWithRestrictedActivity:bundleID:",  [v31 databaseID],  v28));
          -[NSError addObject:](self->super._error, "addObject:", v32);
          uint64_t v33 = ASDLogHandleForCategory(40LL);
          v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            v35 = (void *)objc_claimAutoreleasedReturnValue(-[PerformUpdatesTask context](self, "context"));
            v36 = (void *)objc_claimAutoreleasedReturnValue([v35 logKey]);
            id v37 = [v31 parentalControlsRank];
            *(_DWORD *)buf = 138413058;
            *(void *)&buf[4] = v36;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v28;
            *(_WORD *)&buf[22] = 2048;
            v109 = v37;
            *(_WORD *)v110 = 2048;
            *(void *)&v110[2] = v83;
            _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "[%@] Skipping %{public}@ due to restrictions, parentalControlsRank: %ld restrictionsRank: %ld",  buf,  0x2Au);
          }

          goto LABEL_51;
        }

        uint64_t v97 = 0LL;
        v98 = &v97;
        uint64_t v99 = 0x2020000000LL;
        char v100 = 0;
        v96[0] = 0LL;
        v96[1] = v96;
        v96[2] = 0x2020000000LL;
        uint64_t v90 = 0LL;
        v91 = &v90;
        uint64_t v92 = 0x3032000000LL;
        v93 = sub_1001CF260;
        v94 = sub_1001CF270;
        id v95 = 0LL;
        id v40 = sub_1002EEBC0((uint64_t)&OBJC_CLASS___AppInstallsDatabaseStore);
        v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
        v89[0] = _NSConcreteStackBlock;
        v89[1] = 3221225472LL;
        v89[2] = sub_1001D0860;
        v89[3] = &unk_1003EB9F0;
        v89[4] = v28;
        v89[5] = &v90;
        v89[6] = &v97;
        v89[7] = v96;
        [v41 readUsingSession:v89];

        if (*((_BYTE *)v98 + 24))
        {
          uint64_t v42 = ASDLogHandleForCategory(40LL);
          v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            v44 = (void *)objc_claimAutoreleasedReturnValue(-[PerformUpdatesTask context](self, "context"));
            v45 = (void *)objc_claimAutoreleasedReturnValue([v44 logKey]);
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v45;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v28;
            _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "[%@] Skipping %{public}@ due to the existence of an in-progress installation for the same bundle ID",  buf,  0x16u);
          }

          v46 = (void *)objc_claimAutoreleasedReturnValue(-[PerformUpdatesTask context](self, "context"));
          unsigned int v47 = [v46 userInitiated];

          if (v47)
          {
            uint64_t v48 = ASDLogHandleForCategory(40LL);
            v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              v50 = (void *)objc_claimAutoreleasedReturnValue(-[PerformUpdatesTask context](self, "context"));
              v51 = (void *)objc_claimAutoreleasedReturnValue([v50 logKey]);
              uint64_t v52 = v91[5];
              *(_DWORD *)buf = 138412546;
              *(void *)&buf[4] = v51;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v52;
              _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "[%@] [%@] Converting to a user-initiated installation…",  buf,  0x16u);
            }

            id v53 = sub_1002EEBC0((uint64_t)&OBJC_CLASS___AppInstallsDatabaseStore);
            v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
            v88[0] = _NSConcreteStackBlock;
            v88[1] = 3221225472LL;
            v88[2] = sub_1001D08E4;
            v88[3] = &unk_1003EBA18;
            v88[4] = v96;
            [v54 modifyUsingTransaction:v88];
            goto LABEL_49;
          }
        }

        else
        {
          v54 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v31,  "purchaseInfoForUpdateUserInitiated:",  -[NSMutableArray isBackgroundRequest]( self->_jobResultItems,  "isBackgroundRequest") ^ 1));
          v55 = (void *)objc_claimAutoreleasedReturnValue([v54 account]);
          uint64_t v56 = objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "ams_DSID"));

          v57 = &off_10040C2F8;
          if (v56) {
            v57 = (_UNKNOWN **)v56;
          }
          v82 = v57;
          if ([v54 isMachineBased])
          {

            v82 = &off_10040C2F8;
          }

          v58 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray requestToken](self->_jobResultItems, "requestToken"));
          [v54 setRequestToken:v58];

          v59 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v77,  "objectForKeyedSubscript:",  v82));
          v60 = v59;
          if (v59)
          {
            -[NSMutableArray addObject:](v59, "addObject:", v54);
          }

          else
          {
            v60 = -[NSMutableArray initWithObjects:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithObjects:",  v54,  0LL);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v77, "setObject:forKeyedSubscript:", v60, v82);
          }

          uint64_t v61 = ASDLogHandleForCategory(40LL);
          v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            v79 = (void *)objc_claimAutoreleasedReturnValue(-[PerformUpdatesTask context](self, "context"));
            v78 = (void *)objc_claimAutoreleasedReturnValue([v79 logKey]);
            v63 = (void *)objc_claimAutoreleasedReturnValue([v31 bundleID]);
            v64 = (void *)objc_claimAutoreleasedReturnValue([v31 itemIdentifier]);
            id v65 = [v64 longLongValue];
            v66 = (void *)objc_claimAutoreleasedReturnValue([v54 externalID]);
            *(_DWORD *)buf = 138413314;
            *(void *)&buf[4] = v78;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v63;
            *(_WORD *)&buf[22] = 2048;
            v109 = v65;
            *(_WORD *)v110 = 2114;
            *(void *)&v110[2] = v66;
            __int16 v111 = 2114;
            v112 = v82;
            _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEFAULT,  "[%@] [%{public}@:%lld][%{public}@] Added purchase for account: %{public}@",  buf,  0x34u);
          }

          ++v80;
LABEL_49:
        }

        _Block_object_dispose(&v90, 8);

        _Block_object_dispose(v96, 8);
        _Block_object_dispose(&v97, 8);
        goto LABEL_51;
      }

      uint64_t v38 = ASDLogHandleForCategory(40LL);
      v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        v67 = (void *)objc_claimAutoreleasedReturnValue(-[PerformUpdatesTask context](self, "context"));
        v68 = (void *)objc_claimAutoreleasedReturnValue([v67 logKey]);
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v68;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v28;
        _os_log_error_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "[%@] Could not find update for bundleID: %{public}@",  buf,  0x16u);
      }

LABEL_51:
      objc_autoreleasePoolPop(v29);
    }

    id v86 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v101,  v113,  16LL);
  }

  while (v86);

  if (v80 >= 1 && self)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472LL;
    *(void *)&buf[16] = sub_1001D0910;
    v109 = &unk_1003EBA68;
    *(void *)v110 = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v77, "enumerateKeysAndObjectsUsingBlock:", buf);
  }

- (_TtC9appstored14UpdatesContext)context
{
  return (_TtC9appstored14UpdatesContext *)self->_jobResultItems;
}

- (void)setContext:(id)a3
{
}

- (NSArray)orderedBundleIDs
{
  return *(NSArray **)&self->_powerAssertionID;
}

- (void)setOrderedBundleIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
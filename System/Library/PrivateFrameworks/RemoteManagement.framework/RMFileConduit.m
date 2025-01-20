@interface RMFileConduit
+ (id)_generateEnrollmentToken;
- (BOOL)_prepareDirectoryWithURL:(id)a3 error:(id *)a4;
- (BOOL)_syncDeclarationsWithManagementSource:(id)a3 error:(id *)a4;
- (BOOL)_syncWithManagementSource:(id)a3 onlyIfNeeded:(BOOL)a4 error:(id *)a5;
- (BOOL)isSyncAllowed;
- (BOOL)madeChangesDuringSync;
- (NSManagedObjectContext)context;
- (NSManagedObjectID)managementSourceObjectID;
- (RMFileConduit)initWithManagementSourceObjectID:(id)a3 inContext:(id)a4;
- (RMFileConduitDelegate)delegate;
- (id)statusItemsToImplicitlySubscribeTo;
- (id)statusItemsToSendDuringEnrollment;
- (signed)errorState;
- (void)enrollWithStatusItems:(id)a3 completionHandler:(id)a4;
- (void)sendStatusData:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setMadeChangesDuringSync:(BOOL)a3;
- (void)startWithCompletionHandler:(id)a3;
- (void)syncOnlyIfNeeded:(BOOL)a3 completionHandler:(id)a4;
- (void)unenrollWithCompletionHandler:(id)a3;
- (void)updateWithPushMessage:(id)a3 completionHandler:(id)a4;
- (void)updateWithTokensResponse:(id)a3 completionHandler:(id)a4;
@end

@implementation RMFileConduit

- (RMFileConduit)initWithManagementSourceObjectID:(id)a3 inContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___RMFileConduit;
  v9 = -[RMFileConduit init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_managementSourceObjectID, a3);
    objc_storeStrong((id *)&v10->_context, a4);
    v11 = objc_opt_new(&OBJC_CLASS___NSObject);
    statusWritingLock = v10->_statusWritingLock;
    v10->_statusWritingLock = v11;
  }

  return v10;
}

- (void)startWithCompletionHandler:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = _os_activity_create( (void *)&_mh_execute_header,  "FileConduit: starting",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002CB90;
  v7[3] = &unk_1000B90A0;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[RMFileConduit context](self, "context"));
  id v8 = v6;
  v9 = self;
  [v6 performBlockAndWait:v7];
  v4[2](v4);

  os_activity_scope_leave(&state);
}

- (signed)errorState
{
  v2 = self;
  uint64_t v9 = 0LL;
  v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  __int16 v12 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10002CD48;
  v5[3] = &unk_1000B8DA8;
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[RMFileConduit context](self, "context"));
  id v6 = v3;
  id v7 = v2;
  id v8 = &v9;
  [v3 performBlockAndWait:v5];
  LOWORD(v2) = *((_WORD *)v10 + 12);

  _Block_object_dispose(&v9, 8);
  return (__int16)v2;
}

- (id)statusItemsToImplicitlySubscribeTo
{
  v5[0] = RMModelStatusItemManagementClientCapabilities;
  v5[1] = RMModelStatusItemManagementDeclarations;
  v5[2] = RMModelStatusItemManagementPushToken;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v5, 3LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v2));

  return v3;
}

- (id)statusItemsToSendDuringEnrollment
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 2LL));
  [v3 addObject:RMModelStatusItemManagementClientCapabilities];
  uint64_t v11 = 0LL;
  __int16 v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002CFCC;
  v7[3] = &unk_1000B8DA8;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[RMFileConduit context](self, "context"));
  id v8 = v4;
  uint64_t v9 = self;
  v10 = &v11;
  [v4 performBlockAndWait:v7];
  if (*((_BYTE *)v12 + 24))
  {
    [v3 addObject:RMModelStatusItemDeviceSerialNumber];
    [v3 addObject:RMModelStatusItemDeviceUDID];
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v3));

  _Block_object_dispose(&v11, 8);
  return v5;
}

- (void)enrollWithStatusItems:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = _os_activity_create( (void *)&_mh_execute_header,  "FileConduit: enrolling",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &state);
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  v17 = sub_10002D1B0;
  v18 = sub_10002D1C0;
  id v19 = 0LL;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10002D1C8;
  v10[3] = &unk_1000B8DA8;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[RMFileConduit context](self, "context"));
  id v11 = v9;
  __int16 v12 = self;
  uint64_t v13 = &v14;
  [v9 performBlockAndWait:v10];
  v7[2](v7, v15[5]);

  _Block_object_dispose(&v14, 8);
  os_activity_scope_leave(&state);
}

- (BOOL)_prepareDirectoryWithURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v25 = 0LL;
  unsigned int v6 = [v5 getResourceValue:&v25 forKey:NSURLIsDirectoryKey error:a4];
  id v7 = v25;
  id v8 = v7;
  if (v6)
  {
    if ([v7 BOOLValue])
    {
      v29[0] = @"Declarations";
      v29[1] = @"Subscriptions";
      v29[2] = @"Status";
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 3LL));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      id v11 = v9;
      id v12 = [v11 countByEnumeratingWithState:&v21 objects:v28 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v22;
        while (2)
        {
          for (i = 0LL; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v22 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v5,  "URLByAppendingPathComponent:isDirectory:",  *(void *)(*((void *)&v21 + 1) + 8 * (void)i),  1,  (void)v21));
            unsigned int v17 = [v10 createDirectoryAtURL:v16 withIntermediateDirectories:1 attributes:0 error:a4];

            if (!v17)
            {
              BOOL v18 = 0;
              goto LABEL_17;
            }
          }

          id v13 = [v11 countByEnumeratingWithState:&v21 objects:v28 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

      BOOL v18 = 1;
LABEL_17:

      goto LABEL_18;
    }

    if (a4)
    {
      NSErrorUserInfoKey v26 = NSURLErrorKey;
      id v27 = v5;
      id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));
      id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  260LL,  v19));

      if (v11)
      {
        id v11 = v11;
        BOOL v18 = 0;
        *a4 = v11;
      }

      else
      {
        BOOL v18 = 0;
      }

+ (id)_generateEnrollmentToken
{
  v2 = objc_opt_new(&OBJC_CLASS___NSUUID);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v2, "UUIDString"));

  return v3;
}

- (void)unenrollWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void, uint64_t))a3;
  id v5 = _os_activity_create( (void *)&_mh_execute_header,  "FileConduit: unenrolling",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  uint64_t v14 = sub_10002D1B0;
  v15 = sub_10002D1C0;
  id v16 = 0LL;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002D8A0;
  v7[3] = &unk_1000B8DA8;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[RMFileConduit context](self, "context"));
  id v8 = v6;
  id v9 = self;
  v10 = &v11;
  [v6 performBlockAndWait:v7];
  v4[2](v4, 0LL, v12[5]);

  _Block_object_dispose(&v11, 8);
  os_activity_scope_leave(&state);
}

- (BOOL)isSyncAllowed
{
  v2 = self;
  uint64_t v9 = 0LL;
  v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  char v12 = 1;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10002DB40;
  void v5[3] = &unk_1000B8DA8;
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[RMFileConduit context](self, "context"));
  id v6 = v3;
  id v7 = v2;
  id v8 = &v9;
  [v3 performBlockAndWait:v5];
  LOBYTE(v2) = *((_BYTE *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)v2;
}

- (void)syncOnlyIfNeeded:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, BOOL, void))a4;
  id v7 = _os_activity_create( (void *)&_mh_execute_header,  "FileConduit: syncing only if needed",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &state);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog fileConduit](&OBJC_CLASS___RMLog, "fileConduit"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10002FAE4(v4, v8, v9, v10, v11, v12, v13, v14);
  }

  -[RMFileConduit setMadeChangesDuringSync:](self, "setMadeChangesDuringSync:", 0LL);
  uint64_t v25 = 0LL;
  NSErrorUserInfoKey v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  v28 = sub_10002D1B0;
  v29 = sub_10002D1C0;
  id v30 = 0LL;
  unsigned int v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  id v19 = sub_10002DE08;
  v20 = &unk_1000B9B80;
  id v15 = (id)objc_claimAutoreleasedReturnValue(-[RMFileConduit context](self, "context"));
  id v21 = v15;
  __int128 v22 = self;
  BOOL v24 = v4;
  __int128 v23 = &v25;
  [v15 performBlockAndWait:&v17];
  BOOL v16 = -[RMFileConduit madeChangesDuringSync](self, "madeChangesDuringSync", v17, v18, v19, v20);
  v6[2](v6, v16, v26[5]);

  _Block_object_dispose(&v25, 8);
  os_activity_scope_leave(&state);
}

- (BOOL)_syncWithManagementSource:(id)a3 onlyIfNeeded:(BOOL)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v17 = 0LL;
  unsigned __int8 v9 = -[RMFileConduit _syncDeclarationsWithManagementSource:error:]( self,  "_syncDeclarationsWithManagementSource:error:",  v7,  &v17);

  id v10 = v17;
  uint64_t v11 = v10;
  if ((v9 & 1) == 0 && v10) {
    -[NSMutableArray addObject:](v8, "addObject:", v10);
  }
  id v12 = -[NSMutableArray count](v8, "count");
  id v13 = v12;
  if (a5 && v12)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createMultipleErrorOrReturnTheSingleErrorWithErrors:]( &OBJC_CLASS___RMErrorUtilities,  "createMultipleErrorOrReturnTheSingleErrorWithErrors:",  v8));
    id v15 = v14;
    if (v14) {
      *a5 = v14;
    }
  }

  return v13 == 0LL;
}

- (void)updateWithPushMessage:(id)a3 completionHandler:(id)a4
{
}

- (void)updateWithTokensResponse:(id)a3 completionHandler:(id)a4
{
}

- (BOOL)_syncDeclarationsWithManagementSource:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v102 = self;
  v100 = (void *)objc_claimAutoreleasedReturnValue(-[RMFileConduit context](self, "context"));
  id v6 = v5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 assets]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 activations]);
  v101 = v6;
  v115 = (void *)objc_claimAutoreleasedReturnValue([v6 configurations]);
  v111 = (void *)objc_claimAutoreleasedReturnValue([v6 management]);
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  (char *)[v7 count]
                 + (void)[v8 count]
  __int128 v126 = 0u;
  __int128 v127 = 0u;
  __int128 v128 = 0u;
  __int128 v129 = 0u;
  id obj = v7;
  id v10 = [obj countByEnumeratingWithState:&v126 objects:buf count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v127;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v127 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v126 + 1) + 8LL * (void)i);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
        BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v14 serverToken]);
        id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  v15,  v16));
        [v9 setObject:v14 forKeyedSubscript:v17];
      }

      id v11 = [obj countByEnumeratingWithState:&v126 objects:buf count:16];
    }

    while (v11);
  }

  id v18 = v9;
  id v19 = v8;
  __int128 v126 = 0u;
  __int128 v127 = 0u;
  __int128 v128 = 0u;
  __int128 v129 = 0u;
  id v20 = [v19 countByEnumeratingWithState:&v126 objects:buf count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v127;
    do
    {
      for (j = 0LL; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v127 != v22) {
          objc_enumerationMutation(v19);
        }
        BOOL v24 = *(void **)(*((void *)&v126 + 1) + 8LL * (void)j);
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 identifier]);
        NSErrorUserInfoKey v26 = (void *)objc_claimAutoreleasedReturnValue([v24 serverToken]);
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  v25,  v26));
        [v18 setObject:v24 forKeyedSubscript:v27];
      }

      id v21 = [v19 countByEnumeratingWithState:&v126 objects:buf count:16];
    }

    while (v21);
  }

  v109 = v19;

  id v28 = v18;
  id v29 = v115;
  __int128 v126 = 0u;
  __int128 v127 = 0u;
  __int128 v128 = 0u;
  __int128 v129 = 0u;
  id v30 = [v29 countByEnumeratingWithState:&v126 objects:buf count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v127;
    do
    {
      for (k = 0LL; k != v31; k = (char *)k + 1)
      {
        if (*(void *)v127 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = *(void **)(*((void *)&v126 + 1) + 8LL * (void)k);
        v35 = (void *)objc_claimAutoreleasedReturnValue([v34 identifier]);
        v36 = (void *)objc_claimAutoreleasedReturnValue([v34 serverToken]);
        v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  v35,  v36));
        [v28 setObject:v34 forKeyedSubscript:v37];
      }

      id v31 = [v29 countByEnumeratingWithState:&v126 objects:buf count:16];
    }

    while (v31);
  }

  id v116 = v28;
  id v38 = v111;
  __int128 v126 = 0u;
  __int128 v127 = 0u;
  __int128 v128 = 0u;
  __int128 v129 = 0u;
  id v39 = [v38 countByEnumeratingWithState:&v126 objects:buf count:16];
  if (v39)
  {
    id v40 = v39;
    uint64_t v41 = *(void *)v127;
    do
    {
      for (m = 0LL; m != v40; m = (char *)m + 1)
      {
        if (*(void *)v127 != v41) {
          objc_enumerationMutation(v38);
        }
        v43 = *(void **)(*((void *)&v126 + 1) + 8LL * (void)m);
        v44 = (void *)objc_claimAutoreleasedReturnValue([v43 identifier]);
        v45 = (void *)objc_claimAutoreleasedReturnValue([v43 serverToken]);
        v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  v44,  v45));
        [v116 setObject:v43 forKeyedSubscript:v46];
      }

      id v40 = [v38 countByEnumeratingWithState:&v126 objects:buf count:16];
    }

    while (v40);
  }

  v47 = v116;
  v48 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v49 = (void *)objc_claimAutoreleasedReturnValue([v101 bootstrapURI]);
  uint64_t v50 = objc_claimAutoreleasedReturnValue([v49 URLByAppendingPathComponent:@"Declarations" isDirectory:1]);

  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  NSURLResourceKey v131 = NSURLNameKey;
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v131, 1LL));
  v99 = (void *)v50;
  v53 = (void *)objc_claimAutoreleasedReturnValue( [v51 enumeratorAtURL:v50 includingPropertiesForKeys:v52 options:5 errorHandler:0]);

  __int128 v124 = 0u;
  __int128 v125 = 0u;
  __int128 v122 = 0u;
  __int128 v123 = 0u;
  id v108 = v53;
  id obja = [v108 countByEnumeratingWithState:&v122 objects:v130 count:16];
  id v54 = 0LL;
  if (obja)
  {
    v55 = &APSEnvironmentDevelopment_ptr;
    uint64_t v112 = *(void *)v123;
    v106 = v48;
    do
    {
      v56 = 0LL;
      do
      {
        if (*(void *)v123 != v112) {
          objc_enumerationMutation(v108);
        }
        v57 = *(os_log_s **)(*((void *)&v122 + 1) + 8LL * (void)v56);
        v58 = v55[53];
        id v121 = v54;
        v59 = (void *)objc_claimAutoreleasedReturnValue([v58 dataWithContentsOfURL:v57 options:0 error:&v121]);
        id v60 = v121;

        if (v59)
        {
          id v120 = v60;
          v61 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelDeclarationBase loadData:serializationType:error:]( &OBJC_CLASS___RMModelDeclarationBase,  "loadData:serializationType:error:",  v59,  1LL,  &v120));
          id v54 = v120;

          if (!v61)
          {
            v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog fileConduit](&OBJC_CLASS___RMLog, "fileConduit"));
            if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v133 = v57;
              __int16 v134 = 2114;
              uint64_t v135 = (uint64_t)v54;
              _os_log_error_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_ERROR,  "Could not parse declaration from file data: %{public}@ %{public}@",  buf,  0x16u);
            }

            goto LABEL_59;
          }

          v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s lastPathComponent](v57, "lastPathComponent"));
          v63 = (void *)objc_claimAutoreleasedReturnValue([v61 declarationIdentifier]);
          uint64_t v110 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v48, "objectForKeyedSubscript:", v63));
          if (v110)
          {
            v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog fileConduit](&OBJC_CLASS___RMLog, "fileConduit"));
            if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v133 = v62;
              __int16 v134 = 2114;
              v65 = (void *)v110;
              uint64_t v135 = v110;
              _os_log_error_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_ERROR,  "Ignoring declaration file %{public}@ because identifier matches file %{public}@",  buf,  0x16u);
            }

            else
            {
              v65 = (void *)v110;
            }

- (void)sendStatusData:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  uint64_t v65 = 0LL;
  v66 = &v65;
  uint64_t v67 = 0x3032000000LL;
  v68 = sub_10002D1B0;
  uint64_t v69 = sub_10002D1C0;
  id v70 = 0LL;
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472LL;
  v61[2] = sub_10002F5D0;
  v61[3] = &unk_1000B8DA8;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[RMFileConduit context](self, "context"));
  id v62 = v8;
  v63 = self;
  v64 = &v65;
  [v8 performBlockAndWait:v61];
  id v60 = 0LL;
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v6,  0LL,  &v60));
  id v10 = v60;
  if (v9)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[RMDateFormat stringLocalTimeZoneFractionalSecondsWithDate:]( &OBJC_CLASS___RMDateFormat,  "stringLocalTimeZoneFractionalSecondsWithDate:",  0LL));
    v57 = (void *)objc_claimAutoreleasedReturnValue([(id)v11 stringByAppendingPathExtension:@"json"]);

    v56 = (void *)objc_claimAutoreleasedReturnValue([(id)v66[5] URLByAppendingPathComponent:v57 isDirectory:0]);
    id v59 = v10;
    LOBYTE(v11) = +[RMJSONUtilities serializeJSONDictionary:fileURL:error:]( &OBJC_CLASS___RMJSONUtilities,  "serializeJSONDictionary:fileURL:error:",  v9,  v56,  &v59);
    id v55 = v59;

    if ((v11 & 1) == 0)
    {
      __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog fileConduit](&OBJC_CLASS___RMLog, "fileConduit"));
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_10002FEA0();
      }

      v7[2](v7, v55);
      goto LABEL_53;
    }

    id v54 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"StatusItems"]);
    if (!v54)
    {
      BOOL v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog fileConduit](&OBJC_CLASS___RMLog, "fileConduit"));
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_10002FD20();
      }

      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[RMErrorUtilities createInternalError](&OBJC_CLASS___RMErrorUtilities, "createInternalError"));
      v7[2](v7, v25);

      goto LABEL_52;
    }

    id obj = self->_statusWritingLock;
    objc_sync_enter(obj);
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472LL;
    v58[2] = sub_10002F664;
    v58[3] = &unk_1000B9BD0;
    v58[4] = &v65;
    [v54 enumerateKeysAndObjectsUsingBlock:v58];
    uint64_t v12 = (void *)v66[5];
    v51 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"FullReport"]);
    unsigned int v48 = [v51 BOOLValue];
    id v13 = v12;
    id v50 = v54;
    id v52 = v13;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v52 URLByAppendingPathComponent:@"OverallStatus.json" isDirectory:0]);
    v71[0] = 0LL;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v14,  0LL,  v71));
    id v16 = v71[0];
    id v17 = v16;
    if (v15)
    {
      *(void *)buf = v16;
      oslog = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v15,  1LL,  buf));
      id v18 = *(id *)buf;

      uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary, v19);
      if ((objc_opt_isKindOfClass(oslog, v20) & 1) != 0) {
        goto LABEL_27;
      }
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog fileConduit](&OBJC_CLASS___RMLog, "fileConduit"));
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_10002FE40();
      }
    }

    else
    {
      NSErrorUserInfoKey v26 = (void *)objc_claimAutoreleasedReturnValue([v16 domain]);
      if ([v26 isEqualToString:NSCocoaErrorDomain])
      {
        BOOL v27 = [v17 code] == (id)260;

        if (v27)
        {
          id v18 = v17;
LABEL_26:
          oslog = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
LABEL_27:

          if (v48)
          {
            id v28 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
LABEL_44:
            v71[0] = _NSConcreteStackBlock;
            v71[1] = (id)3221225472LL;
            v71[2] = sub_10002F870;
            v71[3] = &unk_1000B8E78;
            id v39 = v28;
            uint64_t v72 = v39;
            [v50 enumerateKeysAndObjectsUsingBlock:v71];
            if ((-[NSMutableDictionary isEqualToDictionary:](v39, "isEqualToDictionary:", oslog) & 1) == 0)
            {
              id v40 = v52;
              uint64_t v41 = v39;
              v42 = (void *)objc_claimAutoreleasedReturnValue( [v40 URLByAppendingPathComponent:@"OverallStatus.json" isDirectory:0]);
              id v73 = 0LL;
              unsigned __int8 v43 = +[RMJSONUtilities serializeJSONDictionary:fileURL:error:]( &OBJC_CLASS___RMJSONUtilities,  "serializeJSONDictionary:fileURL:error:",  v41,  v42,  &v73);
              id v44 = v73;
              if ((v43 & 1) != 0)
              {
                v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog fileConduit](&OBJC_CLASS___RMLog, "fileConduit"));
                if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138543362;
                  *(void *)&uint8_t buf[4] = v42;
                  _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_INFO,  "Updated overall status %{public}@",  buf,  0xCu);
                }
              }

              else
              {
                v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog fileConduit](&OBJC_CLASS___RMLog, "fileConduit"));
                if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
                  sub_10002FD80();
                }
              }
            }

            objc_sync_exit(obj);
            v7[2](v7, 0LL);
LABEL_52:

LABEL_53:
            id v10 = v55;
            goto LABEL_54;
          }

          id v46 = v52;
          v49 = (void *)objc_claimAutoreleasedReturnValue( [v46 URLByAppendingPathComponent:@"OverallStatus.json" isDirectory:0]);
          v71[0] = 0LL;
          id v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v49,  0LL,  v71));
          id v30 = v71[0];
          id v31 = v30;
          if (v29)
          {
            *(void *)buf = v30;
            uint64_t v32 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v29,  1LL,  buf));
            id v33 = *(id *)buf;

            uint64_t v35 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary, v34);
            if ((objc_opt_isKindOfClass(v32, v35) & 1) != 0)
            {
LABEL_43:

              id v28 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](v32, "mutableCopy");
              goto LABEL_44;
            }

            v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog fileConduit](&OBJC_CLASS___RMLog, "fileConduit"));
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
              sub_10002FE40();
            }
          }

          else
          {
            v37 = (void *)objc_claimAutoreleasedReturnValue([v30 domain]);
            if ([v37 isEqualToString:NSCocoaErrorDomain])
            {
              BOOL v38 = [v31 code] == (id)260;

              if (v38)
              {
                id v33 = v31;
LABEL_42:
                uint64_t v32 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
                goto LABEL_43;
              }
            }

            else
            {
            }

            uint64_t v32 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[RMLog fileConduit](&OBJC_CLASS___RMLog, "fileConduit"));
            if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR)) {
              sub_10002FDE0();
            }
            id v33 = v31;
          }

          goto LABEL_42;
        }
      }

      else
      {
      }

      oslog = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[RMLog fileConduit](&OBJC_CLASS___RMLog, "fileConduit"));
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
        sub_10002FDE0();
      }
      id v18 = v17;
    }

    goto LABEL_26;
  }

  uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog fileConduit](&OBJC_CLASS___RMLog, "fileConduit"));
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    sub_10002FCC0();
  }

  v7[2](v7, v10);
LABEL_54:

  _Block_object_dispose(&v65, 8);
}

- (RMFileConduitDelegate)delegate
{
  return (RMFileConduitDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)madeChangesDuringSync
{
  return self->_madeChangesDuringSync;
}

- (void)setMadeChangesDuringSync:(BOOL)a3
{
  self->_madeChangesDuringSync = a3;
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (NSManagedObjectID)managementSourceObjectID
{
  return self->_managementSourceObjectID;
}

- (void).cxx_destruct
{
}

@end
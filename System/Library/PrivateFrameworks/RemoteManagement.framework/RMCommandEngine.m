@interface RMCommandEngine
- (BOOL)_executeCommand:(id)a3 managementChannel:(id)a4 error:(id *)a5;
- (BOOL)_handleResultForCommand:(id)a3 status:(signed __int16)a4 result:(id)a5 reasons:(id)a6 unknownPayloadKeys:(id)a7 error:(id)a8 outError:(id *)a9;
- (BOOL)executingCommands;
- (NSManagedObjectContext)context;
- (NSManagedObjectID)managementSourceObjectID;
- (RMCommandEngine)initWithManagementSourceObjectID:(id)a3 context:(id)a4;
- (id)_fetchCommand;
- (void)_processCommand:(id)a3;
- (void)setExecutingCommands:(BOOL)a3;
- (void)syncWithCompletionHandler:(id)a3;
@end

@implementation RMCommandEngine

- (RMCommandEngine)initWithManagementSourceObjectID:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___RMCommandEngine;
  v9 = -[RMCommandEngine init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_managementSourceObjectID, a3);
    objc_storeStrong((id *)&v10->_context, a4);
  }

  return v10;
}

- (void)syncWithCompletionHandler:(id)a3
{
}

- (void)_processCommand:(id)a3
{
  v4 = (void (**)(id, void, uint64_t))a3;
  v5 = _os_activity_create( (void *)&_mh_execute_header,  "CommandEngine: executing pending command",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog commandEngine](&OBJC_CLASS___RMLog, "commandEngine"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10001BC74();
  }

  uint64_t v38 = 0LL;
  v39 = &v38;
  uint64_t v40 = 0x3032000000LL;
  v41 = sub_10001AD6C;
  v42 = sub_10001AD7C;
  id v43 = 0LL;
  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  v35 = sub_10001AD6C;
  v36 = sub_10001AD7C;
  id v37 = 0LL;
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  v29 = sub_10001AD6C;
  v30 = sub_10001AD7C;
  id v31 = 0LL;
  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  char v25 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10001AD84;
  v15[3] = &unk_1000B95F0;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[RMCommandEngine context](self, "context"));
  id v16 = v7;
  v17 = self;
  v18 = &v38;
  v19 = &v32;
  v20 = &v26;
  v21 = &v22;
  [v7 performBlockAndWait:v15];
  if (v27[5])
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog commandEngine](&OBJC_CLASS___RMLog, "commandEngine"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10001BC48();
    }
  }

  else if (v33[5])
  {
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog commandEngine](&OBJC_CLASS___RMLog, "commandEngine"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10001BC1C();
    }

    uint64_t v10 = v33[5];
    uint64_t v11 = v39[5];
    objc_super v12 = (id *)(v27 + 5);
    id obj = (id)v27[5];
    unsigned __int8 v13 = -[RMCommandEngine _executeCommand:managementChannel:error:]( self,  "_executeCommand:managementChannel:error:",  v10,  v11,  &obj);
    objc_storeStrong(v12, obj);
    *((_BYTE *)v23 + 24) = v13;
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog commandEngine](&OBJC_CLASS___RMLog, "commandEngine"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10001BBF0();
    }
  }

  else
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog commandEngine](&OBJC_CLASS___RMLog, "commandEngine"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10001BBC4();
    }
  }

  v4[2](v4, *((unsigned __int8 *)v23 + 24), v27[5]);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  os_activity_scope_leave(&state);
}

- (BOOL)_executeCommand:(id)a3 managementChannel:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = -[NSConditionLock initWithCondition:](objc_alloc(&OBJC_CLASS___NSConditionLock), "initWithCondition:", 0LL);
  uint64_t v62 = 0LL;
  v63 = &v62;
  uint64_t v64 = 0x3032000000LL;
  v65 = sub_10001AD6C;
  v66 = sub_10001AD7C;
  id v67 = 0LL;
  uint64_t v59 = 0LL;
  v60 = &v59;
  uint64_t v61 = 0x2020000000LL;
  uint64_t v53 = 0LL;
  v54 = &v53;
  uint64_t v55 = 0x3032000000LL;
  v56 = sub_10001AD6C;
  v57 = sub_10001AD7C;
  id v58 = 0LL;
  uint64_t v47 = 0LL;
  v48 = &v47;
  uint64_t v49 = 0x3032000000LL;
  v50 = sub_10001AD6C;
  v51 = sub_10001AD7C;
  id v52 = 0LL;
  uint64_t v41 = 0LL;
  v42 = &v41;
  uint64_t v43 = 0x3032000000LL;
  v44 = sub_10001AD6C;
  v45 = sub_10001AD7C;
  id v46 = 0LL;
  uint64_t v35 = 0LL;
  v36 = &v35;
  uint64_t v37 = 0x3032000000LL;
  uint64_t v38 = sub_10001AD6C;
  v39 = sub_10001AD7C;
  id v40 = 0LL;
  id v10 = v7;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10001B3F0;
  v26[3] = &unk_1000B9618;
  uint64_t v28 = &v62;
  v29 = &v59;
  v30 = &v53;
  id v31 = &v47;
  uint64_t v32 = &v41;
  v33 = &v35;
  uint64_t v11 = v8;
  objc_super v12 = v9;
  v27 = v12;
  uint64_t v34 = 1LL;
  objc_msgSend(v10, "rm_executeRequestOnBehalfOfManagementChannel:completionHandler:", v8, v26);
  -[NSConditionLock lockWhenCondition:](v12, "lockWhenCondition:", 1LL);
  -[NSConditionLock unlock](v12, "unlock");
  uint64_t v13 = v63[5];
  uint64_t v14 = *((__int16 *)v60 + 12);
  uint64_t v15 = v54[5];
  uint64_t v16 = v48[5];
  uint64_t v17 = v42[5];
  uint64_t v18 = v36[5];
  id v25 = 0LL;
  BOOL v19 = -[RMCommandEngine _handleResultForCommand:status:result:reasons:unknownPayloadKeys:error:outError:]( self,  "_handleResultForCommand:status:result:reasons:unknownPayloadKeys:error:outError:",  v13,  v14,  v15,  v16,  v17,  v18,  &v25);
  id v20 = v25;
  v21 = v20;
  if (a5) {
    char v22 = v19;
  }
  else {
    char v22 = 1;
  }
  if ((v22 & 1) == 0 && v20) {
    *a5 = v20;
  }

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v62, 8);

  return v19;
}

- (id)_fetchCommand
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RMCommandPayload fetchRequest](&OBJC_CLASS___RMCommandPayload, "fetchRequest"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RMCommandEngine managementSourceObjectID](self, "managementSourceObjectID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K == %@) && (%K == %@)",  @"managementSource",  v4,  @"state",  v5));
  [v3 setPredicate:v6];

  [v3 setFetchLimit:1];
  id v12 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 execute:&v12]);
  id v8 = v12;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);
  }

  else
  {
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog commandEngine](&OBJC_CLASS___RMLog, "commandEngine"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_10001BF48((uint64_t)v8, v10);
    }

    v9 = 0LL;
  }

  return v9;
}

- (BOOL)_handleResultForCommand:(id)a3 status:(signed __int16)a4 result:(id)a5 reasons:(id)a6 unknownPayloadKeys:(id)a7 error:(id)a8 outError:(id *)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = _os_activity_create( (void *)&_mh_execute_header,  "CommandEngine: processing command result",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v20, &state);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RMCommandEngine context](self, "context"));
  uint64_t v39 = 0LL;
  id v40 = &v39;
  uint64_t v41 = 0x3032000000LL;
  v42 = sub_10001AD6C;
  uint64_t v43 = sub_10001AD7C;
  id v44 = 0LL;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_10001B894;
  v30[3] = &unk_1000B9640;
  id v22 = v15;
  id v31 = v22;
  uint64_t v37 = &v39;
  id v23 = v19;
  id v32 = v23;
  id v24 = v17;
  id v33 = v24;
  signed __int16 v38 = a4;
  id v25 = v16;
  id v34 = v25;
  id v26 = v18;
  id v35 = v26;
  id v27 = v21;
  id v36 = v27;
  [v27 performBlockAndWait:v30];
  uint64_t v28 = (void *)v40[5];
  if (a9 && v28) {
    *a9 = v28;
  }

  _Block_object_dispose(&v39, 8);
  os_activity_scope_leave(&state);

  return v28 == 0LL;
}

- (NSManagedObjectID)managementSourceObjectID
{
  return self->_managementSourceObjectID;
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (BOOL)executingCommands
{
  return self->_executingCommands;
}

- (void)setExecutingCommands:(BOOL)a3
{
  self->_executingCommands = a3;
}

- (void).cxx_destruct
{
}

@end
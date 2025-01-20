@interface ContextProxy
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)_isPreflightOnCleanContext:(id)a3;
- (BOOL)cApiOrigin;
- (BOOL)checkEntitlement:(id)a3;
- (Context)managedContext;
- (ContextProxy)initWithContext:(id)a3 processId:(int)a4 userId:(unsigned int)a5 auditSessionId:(int)a6 auditToken:(id *)a7 cApiOrigin:(BOOL)a8 checkEntitlementBlock:(id)a9 invalidationBlock:(id)a10 callback:(id)a11 clientId:(unint64_t)a12;
- (LAContextCallbackXPC)callback;
- (NSString)description;
- (NSString)proxyId;
- (int)auditSessionId;
- (int)processId;
- (unint64_t)originatorId;
- (unsigned)userId;
- (void)_evaluateRequest:(id)a3 originator:(id)a4 preflightKey:(id)a5 uiDelegate:(id)a6 reply:(id)a7;
- (void)allowTransferToProcess:(int)a3 receiverAuditTokenData:(id)a4 reply:(id)a5;
- (void)authMethodWithReply:(id)a3;
- (void)credentialOfType:(int64_t)a3 reply:(id)a4;
- (void)dealloc;
- (void)evaluateACL:(id)a3 cfOperation:(void *)a4 options:(id)a5 uiDelegate:(id)a6 reply:(id)a7;
- (void)evaluateACL:(id)a3 operation:(id)a4 options:(id)a5 uiDelegate:(id)a6 originator:(id)a7 reply:(id)a8;
- (void)evaluateACL:(id)a3 operation:(id)a4 options:(id)a5 uiDelegate:(id)a6 reply:(id)a7;
- (void)evaluatePolicy:(int64_t)a3 options:(id)a4 uiDelegate:(id)a5 originator:(id)a6 reply:(id)a7;
- (void)evaluatePolicy:(int64_t)a3 options:(id)a4 uiDelegate:(id)a5 reply:(id)a6;
- (void)externalizedContextWithReply:(id)a3;
- (void)failProcessedEvent:(int64_t)a3 failureError:(id)a4 reply:(id)a5;
- (void)getDomainStateWithOptions:(id)a3 originator:(id)a4 reply:(id)a5;
- (void)getDomainStateWithOptions:(id)a3 reply:(id)a4;
- (void)interruptWithReply:(id)a3;
- (void)invalidateWithError:(id)a3;
- (void)invalidateWithReply:(id)a3;
- (void)isCredentialSet:(int64_t)a3 reply:(id)a4;
- (void)pauseProcessedEvent:(int64_t)a3 pause:(BOOL)a4 reply:(id)a5;
- (void)resetProcessedEvent:(int64_t)a3 reply:(id)a4;
- (void)retryProcessedEvent:(int64_t)a3 reply:(id)a4;
- (void)serverPropertyForOption:(int64_t)a3 reply:(id)a4;
- (void)setCredential:(id)a3 forProcessedEvent:(int64_t)a4 credentialType:(int64_t)a5 reply:(id)a6;
- (void)setCredential:(id)a3 type:(int64_t)a4 reply:(id)a5;
- (void)setServerPropertyForOption:(int64_t)a3 value:(id)a4 reply:(id)a5;
- (void)setShowingCoachingHint:(BOOL)a3 event:(int64_t)a4 reply:(id)a5;
- (void)tokenForTransferToUnknownProcess:(id)a3;
- (void)verifyFileVaultUser:(id)a3 volumeUuid:(id)a4 options:(unint64_t)a5 reply:(id)a6;
@end

@implementation ContextProxy

- (ContextProxy)initWithContext:(id)a3 processId:(int)a4 userId:(unsigned int)a5 auditSessionId:(int)a6 auditToken:(id *)a7 cApiOrigin:(BOOL)a8 checkEntitlementBlock:(id)a9 invalidationBlock:(id)a10 callback:(id)a11 clientId:(unint64_t)a12
{
  uint64_t v15 = *(void *)&a4;
  id v18 = a3;
  id v42 = a9;
  id v19 = a10;
  id v20 = a11;
  v43.receiver = self;
  v43.super_class = (Class)&OBJC_CLASS___ContextProxy;
  v21 = -[ContextProxy init](&v43, "init");
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_managedContext, a3);
    v22->_processId = v15;
    v22->_userId = a5;
    v22->_auditSessionId = a6;
    __int128 v23 = *(_OWORD *)&a7->var0[4];
    *(_OWORD *)v22->_auditToken.val = *(_OWORD *)a7->var0;
    *(_OWORD *)&v22->_auditToken.val[4] = v23;
    v22->_cApiOrigin = a8;
    id v24 = objc_retainBlock(v42);
    id checkEntitlementBlock = v22->_checkEntitlementBlock;
    v22->_id checkEntitlementBlock = v24;

    id v26 = objc_retainBlock(v19);
    id invalidationBlock = v22->_invalidationBlock;
    v22->_id invalidationBlock = v26;

    objc_storeStrong((id *)&v22->_callback, a11);
    do
    {
      unint64_t v28 = __ldaxr(&qword_10003E1F0);
      unint64_t v29 = v28 + 1;
    }

    while (__stlxr(v29, &qword_10003E1F0));
    v22->_originatorId = v29;
    id v30 = [v18 instanceId];
    v31 = (void *)objc_claimAutoreleasedReturnValue([v18 plugin]);
    uint64_t v32 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%u:%u",  v30,  [v31 instanceId]));
    proxyId = v22->_proxyId;
    v22->_proxyId = (NSString *)v32;

    v22->_clientId = a12;
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue([v18 plugin]);
  v35 = (void *)objc_claimAutoreleasedReturnValue([v34 module]);
  v36 = (void *)objc_claimAutoreleasedReturnValue([v18 plugin]);
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[ContextProxy managedContext](v22, "managedContext"));
  [v35 trackPlugin:v36 processId:v15 proxy:v22 context:v37 invalidationBlock:v19];

  uint64_t v38 = LALogForCategory(256LL);
  v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v45 = v22;
    __int16 v46 = 2114;
    id v47 = v18;
    __int16 v48 = 1024;
    unsigned int v49 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "%{public}@ created for %{public}@ uid:%d",  buf,  0x1Cu);
  }

  return v22;
}

- (void)dealloc
{
  uint64_t v3 = LALogForCategory(256LL);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ deallocated", buf, 0xCu);
  }

  -[ContextProxy interruptWithReply:](self, "interruptWithReply:", 0LL);
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ContextProxy;
  -[ContextProxy dealloc](&v5, "dealloc");
}

- (void)interruptWithReply:(id)a3
{
  id v4 = a3;
  unint64_t v5 = -[ContextProxy originatorId](self, "originatorId");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContextProxy description](self, "description"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[Context uuid](self->_managedContext, "uuid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[DaemonUtils sharedInstance](&OBJC_CLASS___DaemonUtils, "sharedInstance"));
  v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 serverQueue]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100006EA8;
  v13[3] = &unk_100030CD0;
  id v16 = v4;
  unint64_t v17 = v5;
  id v14 = v6;
  id v15 = v7;
  id v10 = v7;
  id v11 = v4;
  id v12 = v6;
  dispatch_async(v9, v13);
}

- (NSString)description
{
  uint64_t v3 = -[ContextProxy processId](self, "processId");
  uint64_t clientId = self->_clientId;
  uint64_t v5 = -[Context instanceId](self->_managedContext, "instanceId");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[Context plugin](self->_managedContext, "plugin"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"ContextProxy[%u:%u:%u:%u]",  v3,  clientId,  v5,  [v6 instanceId]));

  return (NSString *)v7;
}

- (void)getDomainStateWithOptions:(id)a3 originator:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  managedContext = self->_managedContext;
  if (v8) {
    id v11 = v8;
  }
  else {
    id v11 = &__NSDictionary0__struct;
  }
  id v12 = a4;
  v13 = (void *)objc_claimAutoreleasedReturnValue( -[Context updateOptionsWithServerProperties:]( managedContext,  "updateOptionsWithServerProperties:",  v11));
  id v14 = objc_alloc(&OBJC_CLASS___DomainStateRequest);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[Context uuid](self->_managedContext, "uuid"));
  id v16 = [v14 initWithOptions:v13 client:v12 contextID:v15];

  unint64_t v17 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v18 = [[LACDomainStateProvider alloc] initWithProviders:v17];
  uint64_t v19 = LALogCategoryForOptions(v13, 0LL);
  uint64_t v20 = LALogForCategory(v19);
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  v22 = objc_opt_new(&OBJC_CLASS___NSUUID);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v33 = v17;
    __int16 v34 = 2114;
    id v35 = v8;
    __int16 v36 = 2114;
    v37 = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Requesting domain state with providers: %{public}@ options: %{public}@ uuid: %{public}@",  buf,  0x20u);
  }

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1000072A4;
  v27[3] = &unk_100030CF8;
  unint64_t v28 = v21;
  unint64_t v29 = v22;
  id v30 = v18;
  id v31 = v9;
  id v23 = v18;
  id v24 = v9;
  v25 = v22;
  id v26 = v21;
  [v23 domainStateForRequest:v16 completion:v27];
}

- (void)evaluatePolicy:(int64_t)a3 options:(id)a4 uiDelegate:(id)a5 originator:(id)a6 reply:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v12) {
    id v16 = v12;
  }
  else {
    id v16 = &__NSDictionary0__struct;
  }
  unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[Context updateOptionsWithServerProperties:]( self->_managedContext,  "updateOptionsWithServerProperties:",  v16));
  id v18 = objc_alloc(&OBJC_CLASS___EvaluationRequest);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[Context uuid](self->_managedContext, "uuid"));
  int64_t v31 = a3;
  id v20 = [v18 initWithPolicy:a3 options:v17 uiDelegate:v13 contextID:v19];

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_10000771C;
  v37[3] = &unk_100030D20;
  id v21 = v20;
  id v38 = v21;
  id v22 = v15;
  id v39 = v22;
  id v23 = objc_retainBlock(v37);
  if (-[ContextProxy _isPreflightOnCleanContext:](self, "_isPreflightOnCleanContext:", v12))
  {
    id v30 = v22;
    id v24 = (void *)objc_claimAutoreleasedReturnValue(+[PreflightCache sharedInstance](&OBJC_CLASS___PreflightCache, "sharedInstance"));
    if (v14) {
      [v14 auditToken];
    }
    else {
      memset(v36, 0, sizeof(v36));
    }
    id v25 = (id)objc_claimAutoreleasedReturnValue( objc_msgSend( v24,  "keyForPreflightOfPolicy:options:auditToken:uid:",  v31,  v16,  v36,  objc_msgSend(v14, "userId")));

    if (v25)
    {
      id v26 = (void *)objc_claimAutoreleasedReturnValue(+[PreflightCache sharedInstance](&OBJC_CLASS___PreflightCache, "sharedInstance"));
      v27 = (void *)objc_claimAutoreleasedReturnValue([v26 cachedPreflightResultForKey:v25]);

      if (v27)
      {
        ((void (*)(void *, void, void *))v23[2])(v23, 0LL, v27);
        id v22 = v30;
        goto LABEL_16;
      }
    }

    id v22 = v30;
  }

  else
  {
    id v25 = 0LL;
  }

  unint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 log]);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v29 = [v21 identifier];
    *(_DWORD *)buf = 67110146;
    int v41 = v31;
    __int16 v42 = 2114;
    id v43 = v12;
    __int16 v44 = 1024;
    BOOL v45 = v13 != 0LL;
    __int16 v46 = 2114;
    id v47 = self;
    __int16 v48 = 1024;
    unsigned int v49 = v29;
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "evaluatePolicy:%d options:%{public}@, uiDelegate:%d on %{public}@ rid:%u",  buf,  0x28u);
  }

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_1000077BC;
  v32[3] = &unk_100030D48;
  id v33 = v21;
  id v25 = v25;
  id v34 = v25;
  id v35 = v23;
  -[ContextProxy _evaluateRequest:originator:preflightKey:uiDelegate:reply:]( self,  "_evaluateRequest:originator:preflightKey:uiDelegate:reply:",  v33,  v14,  v25,  v13,  v32);

  v27 = v33;
LABEL_16:
}

- (void)evaluateACL:(id)a3 operation:(id)a4 options:(id)a5 uiDelegate:(id)a6 originator:(id)a7 reply:(id)a8
{
  id v33 = a3;
  id v34 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v31 = a8;
  if (v14) {
    unint64_t v17 = v14;
  }
  else {
    unint64_t v17 = &__NSDictionary0__struct;
  }
  id v18 = (void *)objc_claimAutoreleasedReturnValue( -[Context updateOptionsWithServerProperties:]( self->_managedContext,  "updateOptionsWithServerProperties:",  v17,  v31));
  if (-[ContextProxy _isPreflightOnCleanContext:](self, "_isPreflightOnCleanContext:", v14))
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[PreflightCache sharedInstance](&OBJC_CLASS___PreflightCache, "sharedInstance"));
    if (v16) {
      [v16 auditToken];
    }
    else {
      memset(v39, 0, sizeof(v39));
    }
    id v21 = v33;
    id v20 = (id)objc_claimAutoreleasedReturnValue( objc_msgSend( v19,  "keyForPreflightOfACL:operation:options:auditToken:uid:",  v33,  v34,  v17,  v39,  objc_msgSend(v16, "userId")));

    if (v20)
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue(+[PreflightCache sharedInstance](&OBJC_CLASS___PreflightCache, "sharedInstance"));
      id v23 = (id)objc_claimAutoreleasedReturnValue([v22 cachedPreflightResultForKey:v20]);

      if (v23)
      {
        id v24 = v32;
        ((void (**)(void, void, id))v32)[2](v32, 0LL, v23);
        goto LABEL_15;
      }
    }
  }

  else
  {
    id v20 = 0LL;
    id v21 = v33;
  }

  id v25 = objc_alloc(&OBJC_CLASS___EvaluationRequest);
  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[Context uuid](self->_managedContext, "uuid"));
  id v27 = [v25 initWithAcl:v21 operation:v34 options:v18 uiDelegate:v15 contextID:v26];

  unint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 log]);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v29 = [v21 hash];
    unsigned int v30 = [v27 identifier];
    *(_DWORD *)buf = 67110402;
    unsigned int v41 = v29;
    __int16 v42 = 2114;
    id v43 = v34;
    __int16 v44 = 2114;
    BOOL v45 = v18;
    __int16 v46 = 1024;
    BOOL v47 = v15 != 0LL;
    id v21 = v33;
    __int16 v48 = 2114;
    unsigned int v49 = self;
    __int16 v50 = 1024;
    unsigned int v51 = v30;
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "evaluateACL:%x operation:%{public}@ options:%{public}@, uiDelegate:%d on %{public}@ rid:%u",  buf,  0x32u);
  }

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_100007C1C;
  v35[3] = &unk_100030D48;
  id v36 = v27;
  id v20 = v20;
  id v37 = v20;
  id v24 = v32;
  id v38 = v32;
  id v23 = v27;
  -[ContextProxy _evaluateRequest:originator:preflightKey:uiDelegate:reply:]( self,  "_evaluateRequest:originator:preflightKey:uiDelegate:reply:",  v23,  v16,  v20,  v15,  v35);

LABEL_15:
}

- (void)_evaluateRequest:(id)a3 originator:(id)a4 preflightKey:(id)a5 uiDelegate:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[DaemonServiceLocator sharedInstance](&OBJC_CLASS___DaemonServiceLocator, "sharedInstance"));
  [v12 setServiceLocator:v17];

  [v12 setClient:v13];
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[Context externalizedContext](self->_managedContext, "externalizedContext"));
  [v12 setExternalizedContext:v18];

  uint64_t v19 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[DaemonServiceLocator sharedInstance](&OBJC_CLASS___DaemonServiceLocator, "sharedInstance"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 sharedMode]);
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 processor]);
  -[NSMutableArray addObject:](v19, "addObject:", v22);

  id v23 = -[EvaluationRequestProcessor initWithContext:uiDelegate:]( objc_alloc(&OBJC_CLASS___EvaluationRequestProcessor),  "initWithContext:uiDelegate:",  self->_managedContext,  v15);
  -[NSMutableArray addObject:](v19, "addObject:", v23);

  id v24 = (void *)objc_claimAutoreleasedReturnValue( +[LACEvaluationRequestProcessorFactory makeProcessorWithSubprocessors:]( &OBJC_CLASS___LACEvaluationRequestProcessorFactory,  "makeProcessorWithSubprocessors:",  v19));
  objc_initWeak(&location, self);
  id v25 = (void *)objc_claimAutoreleasedReturnValue( +[LACProcessingConfiguration defaultConfiguration]( &OBJC_CLASS___LACProcessingConfiguration,  "defaultConfiguration"));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100007FFC;
  v30[3] = &unk_100030D98;
  objc_copyWeak(&v35, &location);
  id v26 = v12;
  id v31 = v26;
  id v27 = v16;
  id v34 = v27;
  id v28 = v24;
  id v32 = v28;
  id v29 = v15;
  id v33 = v29;
  [v28 processRequest:v26 configuration:v25 completion:v30];

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
}

- (BOOL)_isPreflightOnCleanContext:(id)a3
{
  return 0;
}

- (void)failProcessedEvent:(int64_t)a3 failureError:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[Request requestFromCurrentConnection](&OBJC_CLASS___Request, "requestFromCurrentConnection"));
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 log]);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109890;
    int v18 = a3;
    __int16 v19 = 2114;
    id v20 = v8;
    __int16 v21 = 2114;
    id v22 = self;
    __int16 v23 = 1024;
    unsigned int v24 = [v10 identifier];
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "failProcessedEvent:%d failureError:%{public}@ on %{public}@ rid:%u",  buf,  0x22u);
  }

  if (-[ContextProxy checkEntitlement:](self, "checkEntitlement:", @"com.apple.private.CoreAuthentication.SPI"))
  {
    managedContext = self->_managedContext;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000083E4;
    v14[3] = &unk_100030DC0;
    id v15 = v10;
    id v16 = v9;
    -[Context failProcessedEvent:failureError:reply:]( managedContext,  "failProcessedEvent:failureError:reply:",  a3,  v8,  v14);

    id v13 = v15;
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper missingEntitlementError:]( &OBJC_CLASS___LAErrorHelper,  "missingEntitlementError:",  @"com.apple.private.CoreAuthentication.SPI"));
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0LL, v13);
  }
}

- (void)retryProcessedEvent:(int64_t)a3 reply:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[Request requestFromCurrentConnection](&OBJC_CLASS___Request, "requestFromCurrentConnection"));
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 log]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v15 = a3;
    __int16 v16 = 2114;
    unint64_t v17 = self;
    __int16 v18 = 1024;
    unsigned int v19 = [v7 identifier];
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "retryProcessedEvent:%d on %{public}@ rid:%u",  buf,  0x18u);
  }

  if (-[ContextProxy checkEntitlement:](self, "checkEntitlement:", @"com.apple.private.CoreAuthentication.SPI"))
  {
    managedContext = self->_managedContext;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10000867C;
    v11[3] = &unk_100030DC0;
    id v12 = v7;
    id v13 = v6;
    -[Context retryEvent:originator:reply:](managedContext, "retryEvent:originator:reply:", a3, self, v11);

    id v10 = v12;
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper missingEntitlementError:]( &OBJC_CLASS___LAErrorHelper,  "missingEntitlementError:",  @"com.apple.private.CoreAuthentication.SPI"));
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0LL, v10);
  }
}

- (void)resetProcessedEvent:(int64_t)a3 reply:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[Request requestFromCurrentConnection](&OBJC_CLASS___Request, "requestFromCurrentConnection"));
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 log]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v15 = a3;
    __int16 v16 = 2114;
    unint64_t v17 = self;
    __int16 v18 = 1024;
    unsigned int v19 = [v7 identifier];
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "resetProcessedEvent:%d on %{public}@ rid:%u",  buf,  0x18u);
  }

  if (-[ContextProxy checkEntitlement:](self, "checkEntitlement:", @"com.apple.private.CoreAuthentication.SPI"))
  {
    managedContext = self->_managedContext;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100008914;
    v11[3] = &unk_100030DC0;
    id v12 = v7;
    id v13 = v6;
    -[Context resetEvent:originator:reply:](managedContext, "resetEvent:originator:reply:", a3, self, v11);

    id v10 = v12;
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper missingEntitlementError:]( &OBJC_CLASS___LAErrorHelper,  "missingEntitlementError:",  @"com.apple.private.CoreAuthentication.SPI"));
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0LL, v10);
  }
}

- (void)pauseProcessedEvent:(int64_t)a3 pause:(BOOL)a4 reply:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[Request requestFromCurrentConnection](&OBJC_CLASS___Request, "requestFromCurrentConnection"));
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 log]);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v17 = a3;
    __int16 v18 = 2114;
    unsigned int v19 = self;
    __int16 v20 = 1024;
    unsigned int v21 = [v9 identifier];
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "pauseProcessedEvent:%d on %{public}@ rid:%u",  buf,  0x18u);
  }

  if (-[ContextProxy checkEntitlement:](self, "checkEntitlement:", @"com.apple.private.CoreAuthentication.SPI"))
  {
    managedContext = self->_managedContext;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100008BB0;
    v13[3] = &unk_100030DC0;
    id v14 = v9;
    id v15 = v8;
    -[Context pauseProcessedEvent:pause:reply:](managedContext, "pauseProcessedEvent:pause:reply:", a3, v5, v13);

    id v12 = v14;
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper missingEntitlementError:]( &OBJC_CLASS___LAErrorHelper,  "missingEntitlementError:",  @"com.apple.private.CoreAuthentication.SPI"));
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0LL, v12);
  }
}

- (void)setShowingCoachingHint:(BOOL)a3 event:(int64_t)a4 reply:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[Request requestFromCurrentConnection](&OBJC_CLASS___Request, "requestFromCurrentConnection"));
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 log]);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109890;
    BOOL v17 = v6;
    __int16 v18 = 1024;
    int v19 = a4;
    __int16 v20 = 2114;
    unsigned int v21 = self;
    __int16 v22 = 1024;
    unsigned int v23 = [v9 identifier];
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "setShowingCoachingHint:%d event:%d on %{public}@ rid:%u",  buf,  0x1Eu);
  }

  if (-[ContextProxy checkEntitlement:](self, "checkEntitlement:", @"com.apple.private.CoreAuthentication.SPI"))
  {
    managedContext = self->_managedContext;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100008E58;
    v13[3] = &unk_100030DC0;
    id v14 = v9;
    id v15 = v8;
    -[Context setShowingCoachingHint:event:originator:reply:]( managedContext,  "setShowingCoachingHint:event:originator:reply:",  v6,  a4,  self,  v13);

    id v12 = v14;
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper missingEntitlementError:]( &OBJC_CLASS___LAErrorHelper,  "missingEntitlementError:",  @"com.apple.private.CoreAuthentication.SPI"));
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0LL, v12);
  }
}

- (void)setCredential:(id)a3 forProcessedEvent:(int64_t)a4 credentialType:(int64_t)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = (void (**)(id, void, void *))a6;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[Request requestFromCurrentConnection](&OBJC_CLASS___Request, "requestFromCurrentConnection"));
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 log]);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109890;
    int v20 = a4;
    __int16 v21 = 1024;
    int v22 = a5;
    __int16 v23 = 2114;
    unsigned int v24 = self;
    __int16 v25 = 1024;
    unsigned int v26 = [v12 identifier];
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "setCredential:forProcessedEvent:%d credentialType:%d on %{public}@ rid:%u",  buf,  0x1Eu);
  }

  if (v10
    && !-[ContextProxy checkEntitlement:](self, "checkEntitlement:", @"com.apple.private.CoreAuthentication.SPI"))
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper missingEntitlementError:]( &OBJC_CLASS___LAErrorHelper,  "missingEntitlementError:",  @"com.apple.private.CoreAuthentication.SPI"));
    v11[2](v11, 0LL, v15);
  }

  else
  {
    managedContext = self->_managedContext;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10000911C;
    v16[3] = &unk_100030DC0;
    id v17 = v12;
    __int16 v18 = v11;
    -[Context setCredential:forProcessedEvent:credentialType:reply:]( managedContext,  "setCredential:forProcessedEvent:credentialType:reply:",  v10,  a4,  a5,  v16);

    id v15 = v17;
  }
}

- (void)isCredentialSet:(int64_t)a3 reply:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[Request requestFromCurrentConnection](&OBJC_CLASS___Request, "requestFromCurrentConnection"));
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 log]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v16 = a3;
    __int16 v17 = 2114;
    __int16 v18 = self;
    __int16 v19 = 1024;
    unsigned int v20 = [v7 identifier];
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "isCredentialSet:%d on %{public}@ rid:%u",  buf,  0x18u);
  }

  managedContext = self->_managedContext;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100009370;
  v12[3] = &unk_100030DC0;
  id v13 = v7;
  id v14 = v6;
  id v10 = v6;
  id v11 = v7;
  -[Context isCredentialSet:originator:reply:](managedContext, "isCredentialSet:originator:reply:", a3, self, v12);
}

- (void)setCredential:(id)a3 type:(int64_t)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[Request requestFromCurrentConnection](&OBJC_CLASS___Request, "requestFromCurrentConnection"));
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 log]);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v19 = a4;
    __int16 v20 = 2114;
    __int16 v21 = self;
    __int16 v22 = 1024;
    unsigned int v23 = [v10 identifier];
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "setCredential:type:%d on %{public}@ rid:%u",  buf,  0x18u);
  }

  managedContext = self->_managedContext;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000095E4;
  v15[3] = &unk_100030DC0;
  id v16 = v10;
  id v17 = v8;
  id v13 = v8;
  id v14 = v10;
  -[Context setCredential:type:options:originator:reply:]( managedContext,  "setCredential:type:options:originator:reply:",  v9,  a4,  &__NSDictionary0__struct,  self,  v15);
}

- (void)invalidateWithReply:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[Request requestFromCurrentConnection](&OBJC_CLASS___Request, "requestFromCurrentConnection"));
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 log]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v13 = self;
    __int16 v14 = 1024;
    unsigned int v15 = [v5 identifier];
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "invalidateWithReply on %{public}@ rid:%u",  buf,  0x12u);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100009814;
  v9[3] = &unk_100030DE8;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  -[ContextProxy interruptWithReply:](self, "interruptWithReply:", v9);
}

- (void)credentialOfType:(int64_t)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[Request requestFromCurrentConnection](&OBJC_CLASS___Request, "requestFromCurrentConnection"));
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 log]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v16 = a3;
    __int16 v17 = 2114;
    __int16 v18 = self;
    __int16 v19 = 1024;
    unsigned int v20 = [v7 identifier];
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "credentialOfType:%d on %{public}@ rid:%u",  buf,  0x18u);
  }

  managedContext = self->_managedContext;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100009A34;
  v12[3] = &unk_100030E10;
  id v13 = v7;
  id v14 = v6;
  id v10 = v6;
  id v11 = v7;
  -[Context credentialOfType:originator:reply:](managedContext, "credentialOfType:originator:reply:", a3, self, v12);
}

- (void)serverPropertyForOption:(int64_t)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[Request requestFromCurrentConnection](&OBJC_CLASS___Request, "requestFromCurrentConnection"));
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 log]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v16 = a3;
    __int16 v17 = 2114;
    __int16 v18 = self;
    __int16 v19 = 1024;
    unsigned int v20 = [v7 identifier];
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "serverPropertyForOption:%d on %{public}@ rid:%u",  buf,  0x18u);
  }

  managedContext = self->_managedContext;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100009CAC;
  v12[3] = &unk_100030E38;
  id v13 = v7;
  id v14 = v6;
  id v10 = v6;
  id v11 = v7;
  -[Context serverPropertyForOption:reply:](managedContext, "serverPropertyForOption:reply:", a3, v12);
}

- (void)setServerPropertyForOption:(int64_t)a3 value:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[Request requestFromCurrentConnection](&OBJC_CLASS___Request, "requestFromCurrentConnection"));
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 log]);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109890;
    int v19 = a3;
    __int16 v20 = 2114;
    id v21 = v8;
    __int16 v22 = 2114;
    unsigned int v23 = self;
    __int16 v24 = 1024;
    unsigned int v25 = [v10 identifier];
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "setServerPropertyForOption:%d value:%{public}@ on %{public}@ rid:%u",  buf,  0x22u);
  }

  managedContext = self->_managedContext;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100009F1C;
  v15[3] = &unk_100030DC0;
  id v16 = v10;
  id v17 = v9;
  id v13 = v9;
  id v14 = v10;
  -[Context setServerPropertyForOption:value:reply:]( managedContext,  "setServerPropertyForOption:value:reply:",  a3,  v8,  v15);
}

- (void)externalizedContextWithReply:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[Request requestFromCurrentConnection](&OBJC_CLASS___Request, "requestFromCurrentConnection"));
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 log]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v14 = self;
    __int16 v15 = 1024;
    unsigned int v16 = [v5 identifier];
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "externalizedContextWithReply on %{public}@ rid:%u",  buf,  0x12u);
  }

  managedContext = self->_managedContext;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000A150;
  v10[3] = &unk_100030E10;
  id v11 = v5;
  id v12 = v4;
  id v8 = v4;
  id v9 = v5;
  -[Context externalizedContextWithReply:](managedContext, "externalizedContextWithReply:", v10);
}

- (void)authMethodWithReply:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[Request requestFromCurrentConnection](&OBJC_CLASS___Request, "requestFromCurrentConnection"));
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 log]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v14 = self;
    __int16 v15 = 1024;
    unsigned int v16 = [v5 identifier];
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "authMethodWithReply on %{public}@ rid:%u",  buf,  0x12u);
  }

  managedContext = self->_managedContext;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000A3C0;
  v10[3] = &unk_100030E10;
  id v11 = v5;
  id v12 = v4;
  id v8 = v4;
  id v9 = v5;
  -[Context authMethodWithReply:](managedContext, "authMethodWithReply:", v10);
}

- (void)verifyFileVaultUser:(id)a3 volumeUuid:(id)a4 options:(unint64_t)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[Request requestFromCurrentConnection](&OBJC_CLASS___Request, "requestFromCurrentConnection"));
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 log]);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544386;
    id v22 = v10;
    __int16 v23 = 2114;
    id v24 = v11;
    __int16 v25 = 1024;
    int v26 = a5;
    __int16 v27 = 2114;
    id v28 = self;
    __int16 v29 = 1024;
    unsigned int v30 = [v13 identifier];
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "verifyFileVaultUser:%{public}@ volumeUuid:%{public}@, options:%u on %{public}@ rid:%u",  buf,  0x2Cu);
  }

  managedContext = self->_managedContext;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10000A690;
  v18[3] = &unk_100030DC0;
  id v19 = v13;
  id v20 = v12;
  id v16 = v12;
  id v17 = v13;
  -[Context verifyFileVaultUser:volumeUuid:options:reply:]( managedContext,  "verifyFileVaultUser:volumeUuid:options:reply:",  v10,  v11,  a5,  v18);
}

- (void)allowTransferToProcess:(int)a3 receiverAuditTokenData:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[Request requestFromCurrentConnection](&OBJC_CLASS___Request, "requestFromCurrentConnection"));
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 log]);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109890;
    int v20 = a3;
    __int16 v21 = 1024;
    unsigned int v22 = [v8 hash];
    __int16 v23 = 2114;
    id v24 = self;
    __int16 v25 = 1024;
    unsigned int v26 = [v10 identifier];
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "allowTransferToProcess:%d receiverAuditTokenData:%x on %{public}@ rid:%u",  buf,  0x1Eu);
  }

  managedContext = self->_managedContext;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 caller]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10000A924;
  v16[3] = &unk_100030DC0;
  id v17 = v10;
  id v18 = v9;
  id v14 = v9;
  id v15 = v10;
  -[Context allowTransferFromCaller:receiverAuditTokenData:reply:]( managedContext,  "allowTransferFromCaller:receiverAuditTokenData:reply:",  v13,  v8,  v16);
}

- (void)tokenForTransferToUnknownProcess:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[Request requestFromCurrentConnection](&OBJC_CLASS___Request, "requestFromCurrentConnection"));
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 log]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v15 = self;
    __int16 v16 = 1024;
    unsigned int v17 = [v5 identifier];
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "tokenForTransferToUnknownProcess on %{public}@ rid:%u",  buf,  0x12u);
  }

  managedContext = self->_managedContext;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 caller]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000AB70;
  v11[3] = &unk_100030E10;
  id v12 = v5;
  id v13 = v4;
  id v9 = v4;
  id v10 = v5;
  -[Context tokenForTransferFromCaller:reply:](managedContext, "tokenForTransferFromCaller:reply:", v8, v11);
}

- (void)getDomainStateWithOptions:(id)a3 reply:(id)a4
{
}

- (void)evaluatePolicy:(int64_t)a3 options:(id)a4 uiDelegate:(id)a5 reply:(id)a6
{
}

- (void)evaluateACL:(id)a3 operation:(id)a4 options:(id)a5 uiDelegate:(id)a6 reply:(id)a7
{
}

- (void)evaluateACL:(id)a3 cfOperation:(void *)a4 options:(id)a5 uiDelegate:(id)a6 reply:(id)a7
{
}

- (BOOL)checkEntitlement:(id)a3
{
  return (*((uint64_t (**)(void))self->_checkEntitlementBlock + 2))();
}

- (void)invalidateWithError:(id)a3
{
  id invalidationBlock = (void (**)(void))self->_invalidationBlock;
  if (invalidationBlock)
  {
    invalidationBlock[2]();
    id v5 = self->_invalidationBlock;
    self->_id invalidationBlock = 0LL;
  }

- (BOOL)cApiOrigin
{
  return self->_cApiOrigin;
}

- (int)processId
{
  return self->_processId;
}

- (unsigned)userId
{
  return self->_userId;
}

- (int)auditSessionId
{
  return self->_auditSessionId;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3 = *(_OWORD *)self[3].var0;
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[2].var0[4];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (LAContextCallbackXPC)callback
{
  return self->_callback;
}

- (unint64_t)originatorId
{
  return self->_originatorId;
}

- (Context)managedContext
{
  return self->_managedContext;
}

- (NSString)proxyId
{
  return self->_proxyId;
}

- (void).cxx_destruct
{
}

@end
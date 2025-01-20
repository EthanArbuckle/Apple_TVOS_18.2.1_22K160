@interface Context
+ (unsigned)newInstanceId;
+ (void)managedContextWithExternalizedContext:(id)a3 processId:(int)a4 userId:(unsigned int)a5 auditSessionId:(int)a6 reply:(id)a7;
- (BOOL)_hasProtectedOptions:(id)a3;
- (BOOL)_hasProtectedUiDelegate:(id)a3 policy:(int64_t)a4 options:(id)a5;
- (Context)initWithPlugin:(id)a3 processId:(int)a4 userId:(unsigned int)a5 auditSessionId:(int)a6 externalizedContext:(id)a7;
- (ContextPlugin)plugin;
- (NSData)externalizedContext;
- (NSString)description;
- (NSUUID)uuid;
- (OS_os_transaction)transaction;
- (id)_updateOptionsWithServerProperties:(id)a3 policy:(int64_t)a4;
- (id)updateOptionsWithServerProperties:(id)a3;
- (int)auditSessionId;
- (int)processId;
- (unsigned)instanceId;
- (unsigned)userId;
- (void)_registerAcmHashInDaemon:(unint64_t)a3 completion:(id)a4;
- (void)allowTransferFromCaller:(id)a3 receiverAuditTokenData:(id)a4 reply:(id)a5;
- (void)authMethodWithReply:(id)a3;
- (void)checkCredentialSatisfied:(int64_t)a3 policy:(int64_t)a4 reply:(id)a5;
- (void)connectFromCaller:(id)a3 token:(id)a4 senderAuditTokenData:(id)a5 reply:(id)a6;
- (void)contextWasExternalized:(id)a3;
- (void)credentialOfType:(int64_t)a3 originator:(id)a4 reply:(id)a5;
- (void)dealloc;
- (void)evaluateRequest:(id)a3 uiDelegate:(id)a4 originator:(id)a5 reply:(id)a6;
- (void)externalizedContextWithReply:(id)a3;
- (void)failProcessedEvent:(int64_t)a3 failureError:(id)a4 reply:(id)a5;
- (void)forciblyInvalidate;
- (void)isCredentialSet:(int64_t)a3 originator:(id)a4 reply:(id)a5;
- (void)pauseProcessedEvent:(int64_t)a3 pause:(BOOL)a4 reply:(id)a5;
- (void)resetEvent:(int64_t)a3 originator:(id)a4 reply:(id)a5;
- (void)retryEvent:(int64_t)a3 originator:(id)a4 reply:(id)a5;
- (void)serverPropertyForOption:(int64_t)a3 reply:(id)a4;
- (void)setCredential:(id)a3 forProcessedEvent:(int64_t)a4 credentialType:(int64_t)a5 reply:(id)a6;
- (void)setCredential:(id)a3 type:(int64_t)a4 options:(id)a5 originator:(id)a6 reply:(id)a7;
- (void)setServerPropertyForOption:(int64_t)a3 value:(id)a4 reply:(id)a5;
- (void)setShowingCoachingHint:(BOOL)a3 event:(int64_t)a4 originator:(id)a5 reply:(id)a6;
- (void)tokenForTransferFromCaller:(id)a3 reply:(id)a4;
- (void)verifyFileVaultUser:(id)a3 volumeUuid:(id)a4 options:(unint64_t)a5 reply:(id)a6;
@end

@implementation Context

+ (void)managedContextWithExternalizedContext:(id)a3 processId:(int)a4 userId:(unsigned int)a5 auditSessionId:(int)a6 reply:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[ContextManager sharedInstance](&OBJC_CLASS___ContextManager, "sharedInstance"));
  id v22 = 0LL;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 loadModule:1 error:&v22]);
  id v15 = v22;

  if (v14)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10000DD3C;
    v16[3] = &unk_1000310F0;
    id v18 = v12;
    int v19 = a4;
    unsigned int v20 = a5;
    int v21 = a6;
    id v17 = v11;
    [v14 contextPluginWithExternalizedContext:v17 reply:v16];
  }

  else
  {
    (*((void (**)(id, void, id))v12 + 2))(v12, 0LL, v15);
  }
}

- (Context)initWithPlugin:(id)a3 processId:(int)a4 userId:(unsigned int)a5 auditSessionId:(int)a6 externalizedContext:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  id v12 = a3;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___Context;
  v13 = -[Context init](&v29, "init");
  if (v13)
  {
    v14 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    serverProperties = v13->_serverProperties;
    v13->_serverProperties = v14;

    v16 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    allowedTransfers = v13->_allowedTransfers;
    v13->_allowedTransfers = v16;

    objc_storeStrong((id *)&v13->_plugin, a3);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[ContextPlugin cachedExternalizedContext](v13->_plugin, "cachedExternalizedContext"));
    [v18 setExternalizationObserver:v13];

    v13->_userId = a5;
    v13->_auditSessionId = a6;
    int v19 = objc_opt_new(&OBJC_CLASS___NSUUID);
    uuid = v13->_uuid;
    v13->_uuid = v19;

    v13->_instanceId = +[Context newInstanceId](&OBJC_CLASS___Context, "newInstanceId");
    int v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:]( &OBJC_CLASS___NSDateFormatter,  "localizedStringFromDate:dateStyle:timeStyle:",  v21,  1LL,  3LL));
    id v23 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"com.apple.LocalAuthentication.LAContext (%@ initially acquired by %d at %@)", v13, v9, v22));
    uint64_t v24 = os_transaction_create([v23 UTF8String]);
    transaction = v13->_transaction;
    v13->_transaction = (OS_os_transaction *)v24;
  }

  uint64_t v26 = LALogForCategory(256LL);
  v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v31 = v13;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ created", buf, 0xCu);
  }

  return v13;
}

- (void)_registerAcmHashInDaemon:(unint64_t)a3 completion:(id)a4
{
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

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___Context;
  -[Context dealloc](&v5, "dealloc");
}

+ (unsigned)newInstanceId
{
  return ++dword_10003E238;
}

- (NSString)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Context[%u:%u]",  -[Context instanceId](self, "instanceId"),  -[ContextPlugin instanceId](self->_plugin, "instanceId"));
}

- (BOOL)_hasProtectedOptions:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObjects:](&OBJC_CLASS___NSMutableSet, "setWithObjects:", 0LL));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));
  [v4 intersectSet:v6];
  BOOL v7 = [v4 count] != 0;

  return v7;
}

- (BOOL)_hasProtectedUiDelegate:(id)a3 policy:(int64_t)a4 options:(id)a5
{
  return a3 != 0LL;
}

- (void)evaluateRequest:(id)a3 uiDelegate:(id)a4 originator:(id)a5 reply:(id)a6
{
  id v17 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void, void *))a6;
  id v13 = [v17 policy];
  v14 = (void *)objc_claimAutoreleasedReturnValue([v17 options]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[Context _updateOptionsWithServerProperties:policy:]( self,  "_updateOptionsWithServerProperties:policy:",  v14,  v13));
  [v17 updateOptions:v15];
  if ((-[Context _hasProtectedUiDelegate:policy:options:]( self,  "_hasProtectedUiDelegate:policy:options:",  v10,  v13,  v15)
     || -[Context _hasProtectedOptions:](self, "_hasProtectedOptions:", v15))
    && ([v11 checkEntitlement:@"com.apple.private.CoreAuthentication.SPI"] & 1) == 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper missingEntitlementError:]( &OBJC_CLASS___LAErrorHelper,  "missingEntitlementError:",  @"com.apple.private.CoreAuthentication.SPI"));
    v12[2](v12, 0LL, v16);
  }

  else
  {
    -[ContextPlugin evaluateRequest:uiDelegate:originator:reply:]( self->_plugin,  "evaluateRequest:uiDelegate:originator:reply:",  v17,  v10,  v11,  v12);
  }
}

- (void)verifyFileVaultUser:(id)a3 volumeUuid:(id)a4 options:(unint64_t)a5 reply:(id)a6
{
}

- (void)setCredential:(id)a3 forProcessedEvent:(int64_t)a4 credentialType:(int64_t)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AuthenticationManager sharedInstance](&OBJC_CLASS___AuthenticationManager, "sharedInstance"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[Context plugin](self, "plugin"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v12 findMechanismForEvent:a4 mustBeRunning:1 plugin:v13]);

  if (v14)
  {
    if (v10)
    {
      [v14 setCredential:v10 credentialType:a5 reply:v11];
    }

    else
    {
      plugin = self->_plugin;
      id v19 = [v14 policy];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_10000E548;
      v20[3] = &unk_100030DC0;
      id v21 = v14;
      id v22 = v11;
      -[ContextPlugin checkCredentialSatisfied:policy:reply:]( plugin,  "checkCredentialSatisfied:policy:reply:",  a5,  v19,  v20);
    }
  }

  else if (v10)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No running mechanism for event %@.",  v15));
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper errorWithCode:message:]( &OBJC_CLASS___LAErrorHelper,  "errorWithCode:message:",  -1008LL,  v16));
    (*((void (**)(id, void, void *))v11 + 2))(v11, 0LL, v17);
  }

  else
  {
    (*((void (**)(id, uint64_t, void))v11 + 2))(v11, 1LL, 0LL);
  }
}

- (void)isCredentialSet:(int64_t)a3 originator:(id)a4 reply:(id)a5
{
}

- (void)setCredential:(id)a3 type:(int64_t)a4 options:(id)a5 originator:(id)a6 reply:(id)a7
{
  plugin = self->_plugin;
  id v13 = a7;
  id v14 = a6;
  id v15 = a3;
  id v16 = (id)objc_claimAutoreleasedReturnValue(-[Context updateOptionsWithServerProperties:](self, "updateOptionsWithServerProperties:", a5));
  -[ContextPlugin setCredential:type:options:originator:reply:]( plugin,  "setCredential:type:options:originator:reply:",  v15,  a4,  v16,  v14,  v13);
}

- (void)credentialOfType:(int64_t)a3 originator:(id)a4 reply:(id)a5
{
}

- (void)checkCredentialSatisfied:(int64_t)a3 policy:(int64_t)a4 reply:(id)a5
{
}

- (id)updateOptionsWithServerProperties:(id)a3
{
  return -[Context _updateOptionsWithServerProperties:policy:]( self,  "_updateOptionsWithServerProperties:policy:",  a3,  0LL);
}

- (id)_updateOptionsWithServerProperties:(id)a3 policy:(int64_t)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v5));
  id v7 = -[NSMutableDictionary copy](self->_serverProperties, "copy");
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000E788;
  v12[3] = &unk_100031118;
  id v13 = v5;
  id v8 = v6;
  id v14 = v8;
  id v15 = self;
  id v9 = v5;
  [v7 enumerateKeysAndObjectsUsingBlock:v12];

  id v10 = v8;
  return v10;
}

- (void)serverPropertyForOption:(int64_t)a3 reply:(id)a4
{
  v6 = (void (**)(id, void *, void))a4;
  id v7 = sub_10000E918();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109378;
    v12[1] = a3;
    __int16 v13 = 2114;
    id v14 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "querying option %d on %{public}@",  (uint8_t *)v12,  0x12u);
  }

  serverProperties = self->_serverProperties;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](serverProperties, "objectForKeyedSubscript:", v10));

  v6[2](v6, v11, 0LL);
}

- (void)setServerPropertyForOption:(int64_t)a3 value:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, uint64_t, void))a5;
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber);
  char isKindOfClass = objc_opt_isKindOfClass(v8, v10);
  id v12 = sub_10000E918();
  __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if ((isKindOfClass & 1) != 0)
  {
    if (v14)
    {
      LODWORD(v20) = 67109634;
      HIDWORD(v20) = a3;
      *(_WORD *)id v21 = 2114;
      *(void *)&v21[2] = self;
      *(_WORD *)&v21[10] = 2114;
      *(void *)&v21[12] = v8;
      id v15 = "setting option %d on %{public}@ to %{public}@";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v20, 0x1Cu);
    }
  }

  else if (v14)
  {
    LODWORD(v20) = 67109634;
    HIDWORD(v20) = a3;
    *(_WORD *)id v21 = 2114;
    *(void *)&v21[2] = self;
    *(_WORD *)&v21[10] = 2112;
    *(void *)&v21[12] = v8;
    id v15 = "setting option %d on %{public}@ to %@";
    goto LABEL_6;
  }

  if (v8 && (uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSNull), (objc_opt_isKindOfClass(v8, v16) & 1) == 0))
  {
    serverProperties = self->_serverProperties;
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    -[NSMutableDictionary setObject:forKey:](serverProperties, "setObject:forKey:", v8, v18);
  }

  else
  {
    id v17 = self->_serverProperties;
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  a3,  v20,  *(_OWORD *)v21,  *(void *)&v21[16]));
    -[NSMutableDictionary removeObjectForKey:](v17, "removeObjectForKey:", v18);
  }

  v9[2](v9, 1LL, 0LL);
}

- (void)failProcessedEvent:(int64_t)a3 failureError:(id)a4 reply:(id)a5
{
  id v14 = a4;
  id v8 = (void (**)(id, uint64_t, void))a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AuthenticationManager sharedInstance](&OBJC_CLASS___AuthenticationManager, "sharedInstance"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[Context plugin](self, "plugin"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 findMechanismForEvent:a3 mustBeRunning:0 plugin:v10]);

  if (([v11 isRunning] & 1) != 0 || objc_msgSend(v11, "isRestartable"))
  {
    if (v14)
    {
      objc_msgSend(v11, "finishRunWithResult:error:", 0);
    }

    else
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper errorWithCode:message:]( &OBJC_CLASS___LAErrorHelper,  "errorWithCode:message:",  -1LL,  @"Mechanism stopped on client request."));
      [v11 finishRunWithResult:0 error:v12];
    }

    v8[2](v8, 1LL, 0LL);
  }

  else
  {
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper errorWithCode:message:]( &OBJC_CLASS___LAErrorHelper,  "errorWithCode:message:",  -1008LL,  @"Can't stop event, because its mechanism is not running."));
    ((void (**)(id, uint64_t, void *))v8)[2](v8, 0LL, v13);
  }
}

- (void)resetEvent:(int64_t)a3 originator:(id)a4 reply:(id)a5
{
}

- (void)retryEvent:(int64_t)a3 originator:(id)a4 reply:(id)a5
{
  id v7 = (void (**)(id, uint64_t, void))a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AuthenticationManager sharedInstance](&OBJC_CLASS___AuthenticationManager, "sharedInstance"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[Context plugin](self, "plugin"));
  id v11 = (id)objc_claimAutoreleasedReturnValue([v8 findMechanismForEvent:a3 mustBeRunning:1 plugin:v9]);

  if (v11)
  {
    [v11 restartWithEventIdentifier:a3 lastAttempt:0];
    v7[2](v7, 1LL, 0LL);
  }

  else
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[LAErrorHelper errorWithCode:message:]( &OBJC_CLASS___LAErrorHelper,  "errorWithCode:message:",  -1008LL,  @"Can't retry event, because no suitable mechanism is running."));
    v7[2](v7, 0LL, v10);

    id v7 = (void (**)(id, uint64_t, void))v10;
  }
}

- (void)pauseProcessedEvent:(int64_t)a3 pause:(BOOL)a4 reply:(id)a5
{
  BOOL v5 = a4;
  id v8 = (void (**)(id, id, id))a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AuthenticationManager sharedInstance](&OBJC_CLASS___AuthenticationManager, "sharedInstance"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[Context plugin](self, "plugin"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 findMechanismForEvent:a3 mustBeRunning:1 plugin:v10]);

  if (v11)
  {
    id v15 = 0LL;
    id v12 = [v11 pause:v5 forEvent:a3 error:&v15];
    id v13 = v15;
    v8[2](v8, v12, v13);
  }

  else
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper errorWithCode:message:]( &OBJC_CLASS___LAErrorHelper,  "errorWithCode:message:",  -1008LL,  @"Can't toggle event because no suitable mechanism is running."));
    v8[2](v8, 0LL, v14);
  }
}

- (void)setShowingCoachingHint:(BOOL)a3 event:(int64_t)a4 originator:(id)a5 reply:(id)a6
{
  BOOL v7 = a3;
  id v13 = (void (**)(id, void, void *))a6;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AuthenticationManager sharedInstance](&OBJC_CLASS___AuthenticationManager, "sharedInstance"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[Context plugin](self, "plugin"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 findMechanismForEvent:a4 mustBeRunning:1 plugin:v10]);

  if (v11)
  {
    [v11 setShowingCoachingHint:v7 reply:v13];
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper errorWithCode:message:]( &OBJC_CLASS___LAErrorHelper,  "errorWithCode:message:",  -1008LL,  @"Can't set coaching, because no suitable mechanism is running."));
    v13[2](v13, 0LL, v12);
  }
}

- (void)externalizedContextWithReply:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContextPlugin cachedExternalizedContext](self->_plugin, "cachedExternalizedContext"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContextPlugin cachedExternalizedContext](self->_plugin, "cachedExternalizedContext"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10000F060;
    v8[3] = &unk_100031140;
    id v9 = v4;
    [v6 externalizedContextWithReply:v8];
  }

  else
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper internalErrorWithMessage:]( &OBJC_CLASS___LAErrorHelper,  "internalErrorWithMessage:",  @"No externalized context"));
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0LL, v7);
  }
}

- (NSData)externalizedContext
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContextPlugin cachedExternalizedContext](self->_plugin, "cachedExternalizedContext"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 externalizedContext]);

  return (NSData *)v3;
}

- (void)contextWasExternalized:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[ContextManager sharedInstance](&OBJC_CLASS___ContextManager, "sharedInstance"));
  [v5 registerExternalizedContext:v4 forContext:self];
}

- (void)forciblyInvalidate
{
}

- (void)authMethodWithReply:(id)a3
{
}

- (void)allowTransferFromCaller:(id)a3 receiverAuditTokenData:(id)a4 reply:(id)a5
{
  p_allowedTransfers = &self->_allowedTransfers;
  allowedTransfers = self->_allowedTransfers;
  id v9 = (void (**)(id, uint64_t, void))a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = -[AllowedTransfer initWithReceiverAuditTokenData:sender:]( objc_alloc(&OBJC_CLASS___AllowedTransfer),  "initWithReceiverAuditTokenData:sender:",  v10,  v11);

  -[NSMutableArray addObject:](allowedTransfers, "addObject:", v12);
  id v13 = sub_10000E918();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_100021330((uint64_t)p_allowedTransfers, v14, v15, v16, v17, v18, v19, v20);
  }

  v9[2](v9, 1LL, 0LL);
}

- (void)tokenForTransferFromCaller:(id)a3 reply:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void, uint64_t))a4;
  uint64_t v8 = SecRandomCopyBytes(kSecRandomDefault, 0x20uLL, bytes);
  if ((_DWORD)v8)
  {
    id v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed generating token: %x (err: %d)",  v8,  *__error());
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[LAErrorHelper internalErrorWithMessage:](&OBJC_CLASS___LAErrorHelper, "internalErrorWithMessage:", v10));
    v7[2](v7, 0LL, v11);

    BOOL v7 = (void (**)(id, void, uint64_t))v11;
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", bytes, 32LL));
    allowedTransfers = self->_allowedTransfers;
    p_allowedTransfers = &self->_allowedTransfers;
    id v14 = -[AllowedTransfer initWithServerToken:sender:]( objc_alloc(&OBJC_CLASS___AllowedTransfer),  "initWithServerToken:sender:",  v10,  v6);
    -[NSMutableArray addObject:](allowedTransfers, "addObject:", v14);

    id v15 = sub_10000E918();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_100021330((uint64_t)p_allowedTransfers, v16, v17, v18, v19, v20, v21, v22);
    }

    ((void (**)(id, void *, uint64_t))v7)[2](v7, v10, 0LL);
  }
}

- (void)connectFromCaller:(id)a3 token:(id)a4 senderAuditTokenData:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, void *))a6;
  id v14 = sub_10000E918();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)v49 = self;
    *(_WORD *)&v49[8] = 1024;
    *(_DWORD *)v50 = [v10 pid];
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "connecting to %{public}@ from %d", buf, 0x12u);
  }

  id v16 = sub_10000E918();
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v37 = [v12 hash];
    v38 = (void *)objc_claimAutoreleasedReturnValue([v10 auditTokenData]);
    unsigned int v39 = [v38 hash];
    unsigned int v40 = [v11 hash];
    allowedTransfers = self->_allowedTransfers;
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v49 = v37;
    *(_WORD *)&v49[4] = 1024;
    *(_DWORD *)&v49[6] = v39;
    *(_WORD *)v50 = 1024;
    *(_DWORD *)&v50[2] = v40;
    __int16 v51 = 2112;
    v52 = allowedTransfers;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "checking access for SAT: %x, RAT: %x, ST: %x against: %@",  buf,  0x1Eu);
  }

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  uint64_t v19 = self->_allowedTransfers;
  p_allowedTransfers = &self->_allowedTransfers;
  uint64_t v20 = v19;
  id v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v43,  v47,  16LL);
  if (!v21)
  {

LABEL_19:
    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"PID %d is not allowed to connect to this context.",  [v10 pid]));
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper errorWithCode:message:]( &OBJC_CLASS___LAErrorHelper,  "errorWithCode:message:",  -1007LL,  v23));
    v13[2](v13, 0LL, v36);

    goto LABEL_20;
  }

  id v22 = v21;
  v42 = v13;
  id v23 = 0LL;
  uint64_t v24 = *(void *)v44;
  do
  {
    for (i = 0LL; i != v22; i = (char *)i + 1)
    {
      if (*(void *)v44 != v24) {
        objc_enumerationMutation(v20);
      }
      uint64_t v26 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)i);
      if ([v26 isReceiver:v10 allowedToConnectWithServerToken:v11 senderAuditTokenData:v12])
      {
        id v27 = v26;

        id v23 = v27;
      }
    }

    id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v43,  v47,  16LL);
  }

  while (v22);

  id v13 = v42;
  if (!v23) {
    goto LABEL_19;
  }
  -[NSMutableArray removeObject:](*p_allowedTransfers, "removeObject:", v23);
  id v28 = sub_10000E918();
  objc_super v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
    sub_100021398((uint64_t)p_allowedTransfers, v29, v30, v31, v32, v33, v34, v35);
  }

  v42[2](v42, 1LL, 0LL);
LABEL_20:
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (ContextPlugin)plugin
{
  return self->_plugin;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
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

- (unsigned)instanceId
{
  return self->_instanceId;
}

- (void).cxx_destruct
{
}

@end
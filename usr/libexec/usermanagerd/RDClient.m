@interface RDClient
+ (RDClient)clientWithXPCConnection:(id)a3;
+ (id)sharedBubbleXPCInterface;
+ (id)sharedXPCInterface;
- ($115C4C562B26FF47E01F9F4EA65B5887)currentAuditToken;
- (BOOL)bubblePopstakeholderIsRegistered;
- (BOOL)bubbleStakeHolder;
- (BOOL)criticalStakeHolder;
- (BOOL)hasEntitlement:(id)a3;
- (BOOL)hasUserSwitchTasks;
- (BOOL)hasUserSyncTasks;
- (BOOL)personaStakeHolderIsRegistered;
- (BOOL)removeUserSwitchTask:(id)a3;
- (BOOL)removeUserSyncTask:(id)a3;
- (BOOL)stakeholderIsRegistered;
- (BOOL)wasToldWillSwitchUser;
- (NSMutableArray)userSwitchTasks;
- (NSMutableArray)userSyncTasks;
- (NSString)machServiceName;
- (NSXPCConnection)syncXPCConnection;
- (NSXPCConnection)xpcConnection;
- (RDClient)init;
- (id)proxy;
- (id)syncProxy;
- (id)taskDictionaryInArray:(id)a3 withUUIDString:(id)a4;
- (int)pid;
- (int)switchStakeHolderKind;
- (void)addUserSwitchTask:(id)a3;
- (void)addUserSyncTask:(id)a3;
- (void)bubbleDidPop;
- (void)bubbleShouldPop;
- (void)clearTaskLists;
- (void)deviceLoginSessionStateDidUpdate;
- (void)personaListDidUpdateCompletionHandler:(id)a3;
- (void)personaUpdateCallbackForMachServiceCompletionHandler:(id)a3;
- (void)readyToSwitchToLoginSession:(id)a3 completionHandler:(id)a4;
- (void)readyToSwitchToUser:(id)a3 completionHandler:(id)a4;
- (void)setBubblePopstakeholderIsRegistered:(BOOL)a3;
- (void)setBubbleStakeHolder:(BOOL)a3;
- (void)setCriticalStakeHolder:(BOOL)a3;
- (void)setMachServiceName:(id)a3;
- (void)setPersonaStakeHolderIsRegistered:(BOOL)a3;
- (void)setStakeholderIsRegistered:(BOOL)a3;
- (void)setSwitchStakeHolderKind:(int)a3;
- (void)setSyncXPCConnection:(id)a3;
- (void)setUserSwitchTasks:(id)a3;
- (void)setUserSyncTasks:(id)a3;
- (void)setWasToldWillSwitchUser:(BOOL)a3;
- (void)setXpcConnection:(id)a3;
- (void)uploadContentWithCompletionHandler:(id)a3;
- (void)userSwitchTaskListDidUpdate;
- (void)willSwitchToUser:(id)a3 completionHandler:(id)a4;
@end

@implementation RDClient

+ (RDClient)clientWithXPCConnection:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_opt_new(a1);
  v6 = v5;
  if (v5) {
    [v5 setXpcConnection:v4];
  }

  return (RDClient *)v6;
}

+ (id)sharedXPCInterface
{
  if (qword_1000DBAD0 != -1) {
    dispatch_once(&qword_1000DBAD0, &stru_1000CD588);
  }
  return (id)qword_1000DBAC8;
}

+ (id)sharedBubbleXPCInterface
{
  if (qword_1000DBAE0 != -1) {
    dispatch_once(&qword_1000DBAE0, &stru_1000CD5A8);
  }
  return (id)qword_1000DBAD8;
}

- (RDClient)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___RDClient;
  v2 = -[RDClient init](&v8, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    userSwitchTasks = v2->_userSwitchTasks;
    v2->_userSwitchTasks = v3;

    v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    userSyncTasks = v2->_userSyncTasks;
    v2->_userSyncTasks = v5;
  }

  return v2;
}

- (int)pid
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RDClient xpcConnection](self, "xpcConnection"));
  int v3 = [v2 processIdentifier];

  return v3;
}

- (BOOL)hasEntitlement:(id)a3
{
  if (!a3) {
    return 1;
  }
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RDClient xpcConnection](self, "xpcConnection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:v4]);

  BOOL v8 = 0;
  if (v6)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber);
  }

  return v8;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)currentAuditToken
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RDClient xpcConnection](self, "xpcConnection"));
  if (v4)
  {
    v6 = v4;
    [v4 auditToken];
    id v4 = v6;
  }

  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }

  return result;
}

- (id)proxy
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(-[RDClient xpcConnection](self, "xpcConnection"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100052804;
  v6[3] = &unk_1000CD5D0;
  v6[4] = self;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 remoteObjectProxyWithErrorHandler:v6]);

  return v4;
}

- (id)syncProxy
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(-[RDClient xpcConnection](self, "xpcConnection"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000528BC;
  v6[3] = &unk_1000CD5D0;
  v6[4] = self;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 synchronousRemoteObjectProxyWithErrorHandler:v6]);

  return v4;
}

- (void)addUserSwitchTask:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[RDClient userSwitchTasks](self, "userSwitchTasks"));
  [v5 addObject:v4];
}

- (id)taskDictionaryInArray:(id)a3 withUUIDString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", kUMUserSwitchTaskUUIDKey, (void)v14));
        if ([v6 isEqualToString:v12])
        {
          id v8 = v11;

          goto LABEL_11;
        }
      }

      id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

- (BOOL)removeUserSwitchTask:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kUMUserSwitchTaskUUIDKey]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RDClient userSwitchTasks](self, "userSwitchTasks"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[RDClient taskDictionaryInArray:withUUIDString:]( self,  "taskDictionaryInArray:withUUIDString:",  v6,  v5));

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[RDClient userSwitchTasks](self, "userSwitchTasks"));
    [v8 removeObject:v7];
  }

  else
  {
    NSLog(@"Client %@ does not have user switch task %@", self, v4);
  }

  return v7 != 0LL;
}

- (BOOL)hasUserSwitchTasks
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RDClient userSwitchTasks](self, "userSwitchTasks"));
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)addUserSyncTask:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[RDClient userSyncTasks](self, "userSyncTasks"));
  [v5 addObject:v4];
}

- (BOOL)removeUserSyncTask:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kUMUserSwitchTaskUUIDKey]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RDClient userSyncTasks](self, "userSyncTasks"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[RDClient taskDictionaryInArray:withUUIDString:]( self,  "taskDictionaryInArray:withUUIDString:",  v6,  v5));

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[RDClient userSyncTasks](self, "userSyncTasks"));
    [v8 removeObject:v4];
  }

  else
  {
    NSLog(@"Client %@ does not have user sync task %@", self, v4);
  }

  return v7 != 0LL;
}

- (BOOL)hasUserSyncTasks
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RDClient userSyncTasks](self, "userSyncTasks"));
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)willSwitchToUser:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = self;
  id v8 = a3;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[RDClient proxy](v7, "proxy"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100052DB4;
  v12[3] = &unk_1000CD0B8;
  v13 = v7;
  id v14 = v6;
  id v10 = v6;
  v11 = v7;
  [v9 willSwitchToUser:v8 completionHandler:v12];
}

- (void)personaListDidUpdateCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RDClient proxy](v5, "proxy"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100052FD4;
  v9[3] = &unk_1000CD0B8;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  [v6 personaListDidUpdateCompletionHandler:v9];
}

- (void)personaUpdateCallbackForMachServiceCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = self;
  if (qword_1000DBAF0 != -1) {
    dispatch_once(&qword_1000DBAF0, &stru_1000CD5F0);
  }
  id v6 = (os_log_s *)(id)qword_1000DBAE8;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = 0LL;
    LODWORD(v7) = sub_100053B4C(1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v7 = v7;
    }
    else {
      uint64_t v7 = v7 & 0xFFFFFFFE;
    }
    if ((_DWORD)v7)
    {
      id v8 = v6;
      v17[0] = 67109120;
      v17[1] = -[RDClient pid](v5, "pid");
      uint64_t v9 = (char *)_os_log_send_and_compose_impl( v7,  &v16,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "RDCLient: calling personaUpdateCallbackForMachServiceCompletionHandler to Pid:%d",  v17);

      if (v9) {
        sub_100053B7C(v9);
      }
    }

    else
    {
      uint64_t v9 = 0LL;
    }

    free(v9);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[RDClient syncProxy](v5, "syncProxy"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100053314;
  v13[3] = &unk_1000CD0B8;
  id v14 = v5;
  id v15 = v4;
  id v11 = v4;
  v12 = v5;
  [v10 personaUpdateCallbackForMachServiceCompletionHandler:v13];
}

- (void)readyToSwitchToUser:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  if (qword_1000DBAF0 != -1) {
    dispatch_once(&qword_1000DBAF0, &stru_1000CD5F0);
  }
  uint64_t v9 = (os_log_s *)(id)qword_1000DBAE8;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = 0LL;
    LODWORD(v10) = sub_100053B4C(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v10 = v10;
    }
    else {
      uint64_t v10 = v10 & 0xFFFFFFFE;
    }
    if ((_DWORD)v10)
    {
      id v11 = v9;
      v15[0] = 67109120;
      v15[1] = -[RDClient pid](v8, "pid");
      v12 = (char *)_os_log_send_and_compose_impl( v10,  &v14,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "RDCLient: calling readyToSwitchToUser to Pid:%d",  v15);

      if (v12) {
        sub_100053B7C(v12);
      }
    }

    else
    {
      v12 = 0LL;
    }

    free(v12);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RDClient proxy](v8, "proxy"));
  [v13 readyToSwitchToUser:v6 completionHandler:v7];
}

- (void)readyToSwitchToLoginSession:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  if (qword_1000DBAF0 != -1) {
    dispatch_once(&qword_1000DBAF0, &stru_1000CD5F0);
  }
  uint64_t v9 = (os_log_s *)(id)qword_1000DBAE8;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = 0LL;
    LODWORD(v10) = sub_100053B4C(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v10 = v10;
    }
    else {
      uint64_t v10 = v10 & 0xFFFFFFFE;
    }
    if ((_DWORD)v10)
    {
      id v11 = v9;
      v15[0] = 67109120;
      v15[1] = -[RDClient pid](v8, "pid");
      v12 = (char *)_os_log_send_and_compose_impl( v10,  &v14,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "RDCLient: calling readyToSwitchToLoginSession to Pid:%d",  v15);

      if (v12) {
        sub_100053B7C(v12);
      }
    }

    else
    {
      v12 = 0LL;
    }

    free(v12);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RDClient proxy](v8, "proxy"));
  [v13 readyToSwitchToLoginSession:v6 completionHandler:v7];
}

- (void)userSwitchTaskListDidUpdate
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[RDClient proxy](self, "proxy"));
  [v2 userSwitchTaskListDidUpdate];
}

- (void)deviceLoginSessionStateDidUpdate
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[RDClient proxy](self, "proxy"));
  [v2 deviceLoginSessionStateDidUpdate];
}

- (void)uploadContentWithCompletionHandler:(id)a3
{
  id v4 = a3;
  NSLog(@"BD: CLIENT IS ABOUT TO SEND UPLOAD CONTENT...");
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[RDClient proxy](self, "proxy"));
  [v5 uploadContentWithCompletionHandler:v4];
}

- (void)bubbleDidPop
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[RDClient proxy](self, "proxy"));
  [v2 bubbleDidPop];
}

- (void)bubbleShouldPop
{
  if (qword_1000DBAF0 != -1) {
    dispatch_once(&qword_1000DBAF0, &stru_1000CD5F0);
  }
  BOOL v3 = (os_log_s *)(id)qword_1000DBAE8;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = 0LL;
    unsigned int v4 = sub_100053B4C(1);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = v4 & 0xFFFFFFFE;
    }
    if ((_DWORD)v5)
    {
      __int16 v9 = 0;
      id v6 = (const char *)_os_log_send_and_compose_impl( v5,  &v10,  0LL,  0LL,  &_mh_execute_header,  v3,  0LL,  "IN bubbleShouldPop: RDClient",  &v9,  2);
      id v7 = (char *)v6;
      if (v6) {
        sub_100053B7C(v6);
      }
    }

    else
    {
      id v7 = 0LL;
    }

    free(v7);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[RDClient proxy](self, "proxy"));
  [v8 bubbleShouldPop];
}

- (void)clearTaskLists
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[RDClient userSwitchTasks](self, "userSwitchTasks"));
  [v3 removeAllObjects];

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[RDClient userSyncTasks](self, "userSyncTasks"));
  [v4 removeAllObjects];
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (void)setMachServiceName:(id)a3
{
}

- (BOOL)stakeholderIsRegistered
{
  return self->_stakeholderIsRegistered;
}

- (void)setStakeholderIsRegistered:(BOOL)a3
{
  self->_stakeholderIsRegistered = a3;
}

- (BOOL)wasToldWillSwitchUser
{
  return self->_wasToldWillSwitchUser;
}

- (void)setWasToldWillSwitchUser:(BOOL)a3
{
  self->_wasToldWillSwitchUser = a3;
}

- (BOOL)criticalStakeHolder
{
  return self->_criticalStakeHolder;
}

- (void)setCriticalStakeHolder:(BOOL)a3
{
  self->_criticalStakeHolder = a3;
}

- (BOOL)bubbleStakeHolder
{
  return self->_bubbleStakeHolder;
}

- (void)setBubbleStakeHolder:(BOOL)a3
{
  self->_bubbleStakeHolder = a3;
}

- (BOOL)bubblePopstakeholderIsRegistered
{
  return self->_bubblePopstakeholderIsRegistered;
}

- (void)setBubblePopstakeholderIsRegistered:(BOOL)a3
{
  self->_bubblePopstakeholderIsRegistered = a3;
}

- (int)switchStakeHolderKind
{
  return self->_switchStakeHolderKind;
}

- (void)setSwitchStakeHolderKind:(int)a3
{
  self->_switchStakeHolderKind = a3;
}

- (BOOL)personaStakeHolderIsRegistered
{
  return self->_personaStakeHolderIsRegistered;
}

- (void)setPersonaStakeHolderIsRegistered:(BOOL)a3
{
  self->_personaStakeHolderIsRegistered = a3;
}

- (NSMutableArray)userSwitchTasks
{
  return self->_userSwitchTasks;
}

- (void)setUserSwitchTasks:(id)a3
{
}

- (NSMutableArray)userSyncTasks
{
  return self->_userSyncTasks;
}

- (void)setUserSyncTasks:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (NSXPCConnection)syncXPCConnection
{
  return self->_syncXPCConnection;
}

- (void)setSyncXPCConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
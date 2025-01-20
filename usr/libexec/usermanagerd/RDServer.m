@interface RDServer
+ (id)sharedBubbleXPCInterface;
+ (id)sharedServer;
+ (id)sharedXPCInterface;
- (BOOL)LogoutToUser:(id)a3;
- (BOOL)anyBubblePopClients;
- (BOOL)inLoginSession;
- (BOOL)inLogoutProcess;
- (BOOL)notifyNextPersonaObserver:(id)a3 withUser:(unsigned int)a4;
- (BOOL)remoteProcessHasBooleanEntitlement:(id)a3;
- (NSMutableDictionary)pidsToClients;
- (NSMutableDictionary)userToSwitchTo;
- (OS_dispatch_source)fastLogoutTimer;
- (OS_dispatch_source)logoutTimer;
- (RDServer)init;
- (id)_allowlistedPreferencesKeys;
- (id)_clientForPID:(int)a3;
- (id)bubbleStakeHolder;
- (id)criticalStakeHolder;
- (id)fetchUserBlockTaskList;
- (id)fetchUserSyncTaskList;
- (int)asidForClient:(id)a3 withAuid:(unsigned int *)a4 withPid:(int)a5;
- (int)switchState;
- (void)StopBubbleWithPID:(int)a3 WithUID:(unsigned int)a4 WithStatus:(unint64_t)a5;
- (void)_broadcastBubbleDidPop;
- (void)_broadcastDeviceLoginSessionStateDidUpdate;
- (void)_broadcastPersonaUpdates:(id)a3 withAuid:(unsigned int)a4;
- (void)_broadcastUserSwitchTaskListDidUpdate;
- (void)_checkIfWeShouldSwitchUser:(BOOL)a3;
- (void)_enumerateClientsWithBlock:(id)a3;
- (void)_reallySwitchUser:(BOOL)a3;
- (void)addBubbleClient:(id)a3;
- (void)addClient:(id)a3;
- (void)addUserSwitchBlockingTask:(id)a3 forPID:(int)a4;
- (void)addUserSwitchBlockingTask:(id)a3 forPID:(int)a4 completionHandler:(id)a5;
- (void)addUserSyncTask:(id)a3 forPID:(int)a4;
- (void)addUserSyncTask:(id)a3 forPID:(int)a4 completionHandler:(id)a5;
- (void)createPersona:(id)a3 passcodeData:(id)a4 forPid:(int)a5 completionHandler:(id)a6;
- (void)createPersona:(id)a3 passcodeData:(id)a4 passcodeDataType:(unint64_t)a5 forPid:(int)a6 completionHandler:(id)a7;
- (void)deletePersona:(id)a3 forPid:(int)a4 completionHandler:(id)a5;
- (void)directSwitchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 preferences:(id)a6 pid:(int)a7 completionHandler:(id)a8;
- (void)disablePersona:(id)a3 forPid:(int)a4 completionHandler:(id)a5;
- (void)fetchAllUsersPersonaListforPid:(int)a3 withCompletionHandler:(id)a4;
- (void)fetchAsidMapforPid:(int)a3 withCompletionHandler:(id)a4;
- (void)fetchBundleIdentifiersForPersona:(id)a3 forPid:(int)a4 completionHandler:(id)a5;
- (void)fetchMachServiceNameswithPID:(int)a3 WithUID:(unsigned int)a4 WithCompletionHandler:(id)a5;
- (void)fetchMultiPersonaBundleIdentifiersforPid:(int)a3 withCompletionHandler:(id)a4;
- (void)fetchPersona:(id)a3 forPid:(int)a4 completionHandler:(id)a5;
- (void)fetchPersonaListforPid:(int)a3 withCompletionHandler:(id)a4;
- (void)fetchUserSwitchBlockingTaskListWithCompletionHandler:(id)a3;
- (void)loginComplete;
- (void)loginUICheckinForPID:(int)a3 completionHandler:(id)a4;
- (void)logoutToLoginSessionWithPID:(int)a3 completionHandler:(id)a4;
- (void)personaLoginWithPid:(int)a3 WithUserODuuid:(id)a4 withUid:(unsigned int)a5 completionHandler:(id)a6;
- (void)personaLogoutWithPid:(int)a3 WithUserODuuid:(id)a4 withUid:(unsigned int)a5 completionHandler:(id)a6;
- (void)provisionDevice:(id)a3 forPid:(int)a4 completionHandler:(id)a5;
- (void)reengageUserQuotaForPID:(int)a3 completionHandler:(id)a4;
- (void)registerBubblePopStakeholderForPID:(int)a3 completionHandler:(id)a4;
- (void)registerCriticalUserSwitchStakeholderForPID:(int)a3 completionHandler:(id)a4;
- (void)registerUserPersonaObserverForPID:(int)a3 withMachServiceName:(id)a4 completionHandler:(id)a5;
- (void)registerUserPersonaStakeholderForPID:(int)a3 completionHandler:(id)a4;
- (void)registerUserSwitchStakeholderForPID:(int)a3 completionHandler:(id)a4;
- (void)registerUserSyncStakeholderForPID:(int)a3 machServiceName:(id)a4 completionHandler:(id)a5;
- (void)removeBubbleClient:(id)a3;
- (void)removeClient:(id)a3;
- (void)removeMachServiceName:(id)a3 withPID:(int)a4 WithUID:(unsigned int)a5;
- (void)removeUserSwitchBlockingTask:(id)a3 forPID:(int)a4;
- (void)removeUserSwitchBlockingTask:(id)a3 forPID:(int)a4 completionHandler:(id)a5;
- (void)removeUserSyncTask:(id)a3 forPID:(int)a4;
- (void)removeUserSyncTask:(id)a3 forPID:(int)a4 completionHandler:(id)a5;
- (void)resetStateForUserSwitch;
- (void)resumeSyncBubbleForPID:(int)a3 completionHandler:(id)a4;
- (void)setFastLogoutTimer:(id)a3;
- (void)setLogoutTimer:(id)a3;
- (void)setMultiPersonaBundlesIdentifiers:(id)a3 forPid:(int)a4 WithcompletionHandler:(id)a5;
- (void)setPidsToClients:(id)a3;
- (void)setSinglePersonaBundlesIdentifiers:(id)a3 forPersona:(id)a4 forPid:(int)a5 completionHandler:(id)a6;
- (void)setSwitchState:(int)a3;
- (void)setUserToSwitchTo:(id)a3;
- (void)suspendUserQuotaForPID:(int)a3 completionHandler:(id)a4;
- (void)switchToLoginUserWithPID:(int)a3 completionHandler:(id)a4;
- (void)switchToUser:(id)a3;
- (void)switchToUser:(id)a3 passcodeData:(id)a4;
- (void)switchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 pid:(int)a6 completionHandler:(id)a7;
- (void)switchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 preferences:(id)a6 pid:(int)a7 completionHandler:(id)a8;
- (void)terminateSyncBubbleForPID:(int)a3 completionHandler:(id)a4;
- (void)unregisterStakeholderForPID:(int)a3 status:(unint64_t)a4 reason:(id)a5 completionHandler:(id)a6;
@end

@implementation RDServer

+ (id)sharedServer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000510C;
  block[3] = &unk_1000CCDB8;
  block[4] = a1;
  if (qword_1000DB9D0 != -1) {
    dispatch_once(&qword_1000DB9D0, block);
  }
  return (id)qword_1000DB9C8;
}

+ (id)sharedXPCInterface
{
  if (qword_1000DB9E0 != -1) {
    dispatch_once(&qword_1000DB9E0, &stru_1000CCDF8);
  }
  return (id)qword_1000DB9D8;
}

+ (id)sharedBubbleXPCInterface
{
  if (qword_1000DB9F0 != -1) {
    dispatch_once(&qword_1000DB9F0, &stru_1000CCE18);
  }
  return (id)qword_1000DB9E8;
}

- (RDServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RDServer;
  v2 = -[RDServer init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    pidsToClients = v2->_pidsToClients;
    v2->_pidsToClients = v3;
  }

  return v2;
}

- (BOOL)remoteProcessHasBooleanEntitlement:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForEntitlement:v3]);

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
    unsigned __int8 v7 = [v5 BOOLValue];
  }
  else {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void)addClient:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)qword_1000DBD48;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000053A0;
  v7[3] = &unk_1000CCE40;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)removeClient:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)qword_1000DBD48;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000054D8;
  v7[3] = &unk_1000CCE40;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)addBubbleClient:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)qword_1000DBD48;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000576C;
  v7[3] = &unk_1000CCE40;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)removeBubbleClient:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)qword_1000DBD48;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000058A4;
  v7[3] = &unk_1000CCE40;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)_clientForPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RDServer pidsToClients](self, "pidsToClients"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

  if (!v6) {
    NSLog(@"We do not have a client for pid: %d", v3);
  }
  return v6;
}

- (void)_enumerateClientsWithBlock:(id)a3
{
  id v4 = (void (**)(id, void *, _BYTE *))a3;
  unsigned __int8 v16 = 0;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[RDServer pidsToClients](self, "pidsToClients"));
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v5,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v12 + 1) + 8 * v9),  (void)v12));
      v4[2](v4, v10, &v16);
      int v11 = v16;

      if (v11) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)criticalStakeHolder
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[RDServer pidsToClients](self, "pidsToClients"));
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  id v4 = 0LL;
  if (v3)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      id v6 = 0LL;
      id v7 = v4;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v4 = (id)objc_claimAutoreleasedReturnValue( objc_msgSend( v2,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v9 + 1) + 8 * (void)v6),  (void)v9));

        if ([v4 criticalStakeHolder])
        {
          id v4 = v4;
          id v3 = v4;
          goto LABEL_11;
        }

        id v6 = (char *)v6 + 1;
        id v7 = v4;
      }

      while (v3 != v6);
      id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

- (id)bubbleStakeHolder
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[RDServer pidsToClients](self, "pidsToClients"));
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  id v4 = 0LL;
  if (v3)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      id v6 = 0LL;
      id v7 = v4;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v4 = (id)objc_claimAutoreleasedReturnValue( objc_msgSend( v2,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v9 + 1) + 8 * (void)v6),  (void)v9));

        if ([v4 bubbleStakeHolder])
        {
          id v4 = v4;
          id v3 = v4;
          goto LABEL_11;
        }

        id v6 = (char *)v6 + 1;
        id v7 = v4;
      }

      while (v3 != v6);
      id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

- (void)registerUserSwitchStakeholderForPID:(int)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = (dispatch_queue_s *)qword_1000DBD48;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005E10;
  block[3] = &unk_1000CCE68;
  int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)registerCriticalUserSwitchStakeholderForPID:(int)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = (dispatch_queue_s *)qword_1000DBD48;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006190;
  block[3] = &unk_1000CCE68;
  int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)registerBubblePopStakeholderForPID:(int)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = (dispatch_queue_s *)qword_1000DBD48;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000662C;
  block[3] = &unk_1000CCE68;
  int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (BOOL)anyBubblePopClients
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[RDServer pidsToClients](self, "pidsToClients"));
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = 0LL;
    uint64_t v6 = *(void *)v12;
LABEL_3:
    id v7 = 0LL;
    id v8 = v5;
    while (1)
    {
      if (*(void *)v12 != v6) {
        objc_enumerationMutation(v2);
      }
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v2,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v11 + 1) + 8 * (void)v7),  (void)v11));

      unsigned __int8 v9 = [v5 bubblePopstakeholderIsRegistered];
      if ((v9 & 1) != 0) {
        break;
      }
      id v7 = (char *)v7 + 1;
      id v8 = v5;
      if (v4 == v7)
      {
        id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (BOOL)inLogoutProcess
{
  if (qword_1000DBA10 != -1) {
    dispatch_once(&qword_1000DBA10, &stru_1000CD208);
  }
  id v3 = (os_log_s *)(id)qword_1000DBA08;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = 0LL;
    LODWORD(v4) = sub_100053B4C(1);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v4 = v4;
    }
    else {
      uint64_t v4 = v4 & 0xFFFFFFFE;
    }
    if ((_DWORD)v4)
    {
      uint64_t v5 = v3;
      v9[0] = 67109120;
      v9[1] = -[RDServer switchState](self, "switchState");
      uint64_t v6 = (char *)_os_log_send_and_compose_impl( v4,  &v8,  0LL,  0LL,  &_mh_execute_header,  v5,  0LL,  "SWSTATE:%d",  v9);

      if (v6) {
        sub_100053B7C(v6);
      }
    }

    else
    {
      uint64_t v6 = 0LL;
    }

    free(v6);
  }

  return -[RDServer switchState](self, "switchState") != 0;
}

- (void)registerUserSyncStakeholderForPID:(int)a3 machServiceName:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (dispatch_queue_s *)qword_1000DBD48;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100006CBC;
  v13[3] = &unk_1000CCE90;
  int v16 = a3;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)unregisterStakeholderForPID:(int)a3 status:(unint64_t)a4 reason:(id)a5 completionHandler:(id)a6
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100007194;
  block[3] = &unk_1000CCEB8;
  int v7 = a3;
  block[4] = self;
  void block[5] = a4;
  dispatch_async((dispatch_queue_t)qword_1000DBD48, block);
}

- (id)_allowlistedPreferencesKeys
{
  if (qword_1000DBA00 != -1) {
    dispatch_once(&qword_1000DBA00, &stru_1000CCED8);
  }
  return (id)qword_1000DB9F8;
}

- (void)switchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 preferences:(id)a6 pid:(int)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  v19 = (dispatch_queue_s *)qword_1000DBD48;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000078AC;
  block[3] = &unk_1000CCF00;
  int v31 = a7;
  block[4] = self;
  id v26 = v14;
  id v27 = v17;
  id v28 = v15;
  id v29 = v16;
  id v30 = v18;
  id v20 = v16;
  id v21 = v15;
  id v22 = v17;
  id v23 = v18;
  id v24 = v14;
  dispatch_async(v19, block);
}

- (void)switchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 pid:(int)a6 completionHandler:(id)a7
{
}

- (void)switchToLoginUserWithPID:(int)a3 completionHandler:(id)a4
{
  id v6 = a4;
  int v7 = (dispatch_queue_s *)qword_1000DBD48;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000082F4;
  block[3] = &unk_1000CCE68;
  int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)logoutToLoginSessionWithPID:(int)a3 completionHandler:(id)a4
{
  id v6 = a4;
  int v7 = (dispatch_queue_s *)qword_1000DBD48;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100008854;
  block[3] = &unk_1000CCE68;
  int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)directSwitchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 preferences:(id)a6 pid:(int)a7 completionHandler:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  if (qword_1000DBA10 != -1) {
    dispatch_once(&qword_1000DBA10, &stru_1000CD208);
  }
  v19 = (os_log_s *)(id)qword_1000DBA08;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = 0LL;
    unsigned int v20 = sub_100053B4C(1);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v21 = v20;
    }
    else {
      uint64_t v21 = v20 & 0xFFFFFFFE;
    }
    if ((_DWORD)v21)
    {
      __int16 v24 = 0;
      id v22 = (const char *)_os_log_send_and_compose_impl( v21,  &v25,  0LL,  0LL,  &_mh_execute_header,  v19,  0LL,  "in directSwitchToUser",  &v24,  2);
      id v23 = (char *)v22;
      if (v22) {
        sub_100053B7C(v22);
      }
    }

    else
    {
      id v23 = 0LL;
    }

    free(v23);
  }

  -[RDServer switchToUser:passcodeData:context:preferences:pid:completionHandler:]( self,  "switchToUser:passcodeData:context:preferences:pid:completionHandler:",  v14,  v15,  v16,  v17,  v9,  v18);
}

- (BOOL)inLoginSession
{
  int v2 = dword_1000DBCF0;
  if (qword_1000DBA10 != -1) {
    dispatch_once(&qword_1000DBA10, &stru_1000CD208);
  }
  id v3 = (os_log_s *)(id)qword_1000DBA08;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = 0LL;
    unsigned int v4 = sub_100053B4C(1);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = v4 & 0xFFFFFFFE;
    }
    if ((_DWORD)v5)
    {
      int v17 = 67109120;
      int v18 = v2;
      id v6 = (const char *)_os_log_send_and_compose_impl( v5,  &v16,  0LL,  0LL,  &_mh_execute_header,  v3,  0LL,  "SessionType is :%d",  &v17);
      int v7 = (char *)v6;
      if (v6) {
        sub_100053B7C(v6);
      }
    }

    else
    {
      int v7 = 0LL;
    }

    free(v7);
  }

  if (v2 == 1)
  {
    if (qword_1000DBA10 != -1) {
      dispatch_once(&qword_1000DBA10, &stru_1000CD208);
    }
    id v8 = (os_log_s *)(id)qword_1000DBA08;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = 0LL;
      unsigned int v9 = sub_100053B4C(1);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = v9 & 0xFFFFFFFE;
      }
      if ((_DWORD)v10)
      {
        int v17 = 67109120;
        int v18 = 1;
        int v11 = (const char *)_os_log_send_and_compose_impl( v10,  &v16,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "In LoginUI Session:%d",  &v17);
        goto LABEL_29;
      }

      goto LABEL_31;
    }
  }

  else
  {
    if (qword_1000DBA10 != -1) {
      dispatch_once(&qword_1000DBA10, &stru_1000CD208);
    }
    id v8 = (os_log_s *)(id)qword_1000DBA08;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = 0LL;
      unsigned int v12 = sub_100053B4C(1);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v13 = v12;
      }
      else {
        uint64_t v13 = v12 & 0xFFFFFFFE;
      }
      if ((_DWORD)v13)
      {
        int v17 = 67109120;
        int v18 = v2;
        int v11 = (const char *)_os_log_send_and_compose_impl( v13,  &v16,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "Session Type not Login:%d",  &v17);
LABEL_29:
        id v14 = (char *)v11;
        if (v11) {
          sub_100053B7C(v11);
        }
        goto LABEL_32;
      }

- (void)loginComplete
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100009390;
  block[3] = &unk_1000CCF28;
  block[4] = self;
  dispatch_async((dispatch_queue_t)qword_1000DBD48, block);
}

- (void)loginUICheckinForPID:(int)a3 completionHandler:(id)a4
{
  id v6 = a4;
  int v7 = (dispatch_queue_s *)qword_1000DBD48;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000962C;
  block[3] = &unk_1000CCE68;
  int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)terminateSyncBubbleForPID:(int)a3 completionHandler:(id)a4
{
  id v6 = a4;
  int v7 = (dispatch_queue_s *)qword_1000DBD48;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100009E20;
  block[3] = &unk_1000CCE68;
  int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)resumeSyncBubbleForPID:(int)a3 completionHandler:(id)a4
{
  id v6 = a4;
  int v7 = (dispatch_queue_s *)qword_1000DBD48;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000A1F0;
  block[3] = &unk_1000CCE68;
  int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)fetchMachServiceNameswithPID:(int)a3 WithUID:(unsigned int)a4 WithCompletionHandler:(id)a5
{
  id v8 = a5;
  unsigned int v9 = (dispatch_queue_s *)qword_1000DBD48;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000A444;
  block[3] = &unk_1000CCF50;
  int v13 = a3;
  unsigned int v14 = a4;
  block[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(v9, block);
}

- (void)removeMachServiceName:(id)a3 withPID:(int)a4 WithUID:(unsigned int)a5
{
  id v8 = a3;
  unsigned int v9 = (dispatch_queue_s *)qword_1000DBD48;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000A734;
  block[3] = &unk_1000CCF78;
  int v13 = a4;
  unsigned int v14 = a5;
  block[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(v9, block);
}

- (void)StopBubbleWithPID:(int)a3 WithUID:(unsigned int)a4 WithStatus:(unint64_t)a5
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000A8C0;
  block[3] = &unk_1000CCEB8;
  unsigned int v6 = a4;
  block[4] = self;
  void block[5] = a5;
  dispatch_async((dispatch_queue_t)qword_1000DBD48, block);
}

- (void)_broadcastBubbleDidPop
{
}

- (void)switchToUser:(id)a3 passcodeData:(id)a4
{
  unsigned int v6 = (const __CFDictionary *)a3;
  id v73 = a4;
  -[RDServer setUserToSwitchTo:](self, "setUserToSwitchTo:", v6);
  -[RDServer setSwitchState:](self, "setSwitchState:", 1LL);
  if (qword_1000DBA10 != -1) {
    dispatch_once(&qword_1000DBA10, &stru_1000CD208);
  }
  p_name = &OBJC_PROTOCOL___UMMobileKeyBagProviding.name;
  id v8 = (os_log_s *)(id)qword_1000DBA08;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(void *)v79 = 0LL;
    unsigned int v9 = sub_100053B4C(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = v9 & 0xFFFFFFFE;
    }
    if ((_DWORD)v10)
    {
      LOWORD(v78[0]) = 0;
      int v11 = (const char *)_os_log_send_and_compose_impl( v10,  v79,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "in SwitchtoUser Internal",  v78,  2);
      id v12 = (char *)v11;
      if (v11) {
        sub_100053B7C(v11);
      }
    }

    else
    {
      id v12 = 0LL;
    }

    free(v12);
  }

  int v13 = (void *)objc_claimAutoreleasedReturnValue(-[RDServer fastLogoutTimer](self, "fastLogoutTimer"));
  if (v13)
  {
    if (qword_1000DBA20 != -1) {
      dispatch_once(&qword_1000DBA20, &stru_1000CD228);
    }
    unsigned int v14 = (os_log_s *)(id)qword_1000DBA18;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v78[0] = 0LL;
      LODWORD(v15) = sub_100053B4C(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v15 = v15;
      }
      else {
        uint64_t v15 = v15 & 0xFFFFFFFE;
      }
      if ((_DWORD)v15)
      {
        uint64_t v16 = v14;
        int v17 = (void *)objc_claimAutoreleasedReturnValue(-[RDServer fastLogoutTimer](self, "fastLogoutTimer"));
        *(_DWORD *)v79 = 134217984;
        *(void *)&v79[4] = v17;
        int v18 = (char *)_os_log_send_and_compose_impl( v15,  v78,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "Canceling fast logout timer (%p)",  v79);

        if (v18) {
          sub_100053B7C(v18);
        }
      }

      else
      {
        int v18 = 0LL;
      }

      free(v18);
    }

    v19 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[RDServer fastLogoutTimer](self, "fastLogoutTimer"));
    dispatch_source_cancel(v19);

    -[RDServer setFastLogoutTimer:](self, "setFastLogoutTimer:", 0LL);
  }

  unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[RDServer pidsToClients](self, "pidsToClients"));
  if ([v20 count])
  {
    char v21 = _os_feature_enabled_impl("UserManagement", "LocalUserEnrollment");

    if ((v21 & 1) == 0) {
      goto LABEL_91;
    }
  }

  else
  {
  }

  -[RDServer setSwitchState:](self, "setSwitchState:", 2LL);
  if (CFDictionaryContainsKey(v6, @"UserSwitchTaskOpqueData"))
  {
    Value = CFDictionaryGetValue(v6, @"UserSwitchTaskOpqueData");
    id v23 = (const __CFData *)CFRetain(Value);
    CFDictionaryRemoveValue(v6, @"UserSwitchTaskOpqueData");
    if (qword_1000DBA10 != -1) {
      dispatch_once(&qword_1000DBA10, &stru_1000CD208);
    }
    __int16 v24 = (os_log_s *)(id)qword_1000DBA08;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v78[0] = 0LL;
      LODWORD(v25) = sub_100053B4C(1);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v25 = v25;
      }
      else {
        uint64_t v25 = v25 & 0xFFFFFFFE;
      }
      if ((_DWORD)v25)
      {
        id v26 = v24;
        CFIndex Length = CFDataGetLength(v23);
        *(_DWORD *)v79 = 134217984;
        *(void *)&v79[4] = Length;
        id v28 = (char *)_os_log_send_and_compose_impl( v25,  v78,  0LL,  0LL,  &_mh_execute_header,  v26,  0LL,  "switchToUser: with BLOB of size %ld",  v79);

        if (v28) {
          sub_100053B7C(v28);
        }
      }

      else
      {
        id v28 = 0LL;
      }

      free(v28);
    }
  }

  else
  {
    id v23 = 0LL;
  }

  if (byte_1000DBD3A)
  {
    if (qword_1000DBA10 != -1) {
      dispatch_once(&qword_1000DBA10, &stru_1000CD208);
    }
    id v29 = (os_log_s *)(id)qword_1000DBA08;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(void *)v79 = 0LL;
      unsigned int v30 = sub_100053B4C(1);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v31 = v30;
      }
      else {
        uint64_t v31 = v30 & 0xFFFFFFFE;
      }
      if ((_DWORD)v31)
      {
        LOWORD(v78[0]) = 0;
        LODWORD(v72) = 2;
        v32 = (const char *)_os_log_send_and_compose_impl( v31,  v79,  0LL,  0LL,  &_mh_execute_header,  v29,  0LL,  "AKSIdentity Login setup",  v78,  v72);
        v33 = (char *)v32;
        if (v32) {
          sub_100053B7C(v32);
        }
      }

      else
      {
        v33 = 0LL;
      }

      free(v33);
    }

    if (sub_1000288F0(v6, (uint64_t)v73))
    {
      if (qword_1000DBA10 != -1) {
        dispatch_once(&qword_1000DBA10, &stru_1000CD208);
      }
      v34 = (os_log_s *)(id)qword_1000DBA08;
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_78;
      }
      *(void *)v79 = 0LL;
      unsigned int v35 = sub_100053B4C(1);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v36 = v35;
      }
      else {
        uint64_t v36 = v35 & 0xFFFFFFFE;
      }
      if ((_DWORD)v36)
      {
        LOWORD(v78[0]) = 0;
        LODWORD(v72) = 2;
        v37 = (const char *)_os_log_send_and_compose_impl( v36,  v79,  0LL,  0LL,  &_mh_execute_header,  v34,  0LL,  "AKSIdentity Login success, all set for switch",  v78,  v72);
        goto LABEL_74;
      }
    }

    else
    {
      if (qword_1000DBA10 != -1) {
        dispatch_once(&qword_1000DBA10, &stru_1000CD208);
      }
      v34 = (os_log_s *)(id)qword_1000DBA08;
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_78;
      }
      *(void *)v79 = 0LL;
      unsigned int v38 = sub_100053B4C(1);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v39 = v38;
      }
      else {
        uint64_t v39 = v38 & 0xFFFFFFFE;
      }
      if ((_DWORD)v39)
      {
        LOWORD(v78[0]) = 0;
        LODWORD(v72) = 2;
        v37 = (const char *)_os_log_send_and_compose_impl( v39,  v79,  0LL,  0LL,  &_mh_execute_header,  v34,  0LL,  "AKSIdentity Login failed, user switch will need passcode to unlock",  v78,  v72);
LABEL_74:
        v40 = (char *)v37;
        if (v37) {
          sub_100053B7C(v37);
        }
        goto LABEL_77;
      }
    }

    v40 = 0LL;
LABEL_77:
    free(v40);
LABEL_78:
  }

  if (qword_1000DBA10 != -1) {
    dispatch_once(&qword_1000DBA10, &stru_1000CD208);
  }
  v41 = (os_log_s *)(id)qword_1000DBA08;
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(void *)v79 = 0LL;
    unsigned int v42 = sub_100053B4C(1);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v43 = v42;
    }
    else {
      uint64_t v43 = v42 & 0xFFFFFFFE;
    }
    if ((_DWORD)v43)
    {
      LOWORD(v78[0]) = 0;
      LODWORD(v72) = 2;
      v44 = (const char *)_os_log_send_and_compose_impl( v43,  v79,  0LL,  0LL,  &_mh_execute_header,  v41,  0LL,  "calling USR",  v78,  v72);
      v45 = (char *)v44;
      if (v44) {
        sub_100053B7C(v44);
      }
    }

    else
    {
      v45 = 0LL;
    }

    free(v45);
  }

  sub_10002EAB0(v6, v23);
LABEL_91:
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[RDServer logoutTimer](self, "logoutTimer"));

  if (v46)
  {
    if (qword_1000DBA20 != -1) {
      dispatch_once(&qword_1000DBA20, &stru_1000CD228);
    }
    v47 = (os_log_s *)(id)qword_1000DBA18;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v78[0] = 0LL;
      LODWORD(v48) = sub_100053B4C(0);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v48 = v48;
      }
      else {
        uint64_t v48 = v48 & 0xFFFFFFFE;
      }
      if ((_DWORD)v48)
      {
        v49 = v47;
        v50 = (void *)objc_claimAutoreleasedReturnValue(-[RDServer logoutTimer](self, "logoutTimer"));
        *(_DWORD *)v79 = 134217984;
        *(void *)&v79[4] = v50;
        v51 = (char *)_os_log_send_and_compose_impl( v48,  v78,  0LL,  0LL,  &_mh_execute_header,  v49,  0LL,  "Logout timer (%p) already running, not starting a new one.",  v79);

        if (v51) {
          sub_100053B7C(v51);
        }
        p_name = &OBJC_PROTOCOL___UMMobileKeyBagProviding.name;
      }

      else
      {
        v51 = 0LL;
      }

      free(v51);
    }
  }

  else
  {
    dispatch_source_t v52 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)qword_1000DBD48);
    -[RDServer setLogoutTimer:](self, "setLogoutTimer:", v52);

    if (qword_1000DBA20 != -1) {
      dispatch_once(&qword_1000DBA20, &stru_1000CD228);
    }
    v53 = (os_log_s *)(id)qword_1000DBA18;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      v78[0] = 0LL;
      LODWORD(v54) = sub_100053B4C(0);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v54 = v54;
      }
      else {
        uint64_t v54 = v54 & 0xFFFFFFFE;
      }
      if ((_DWORD)v54)
      {
        v55 = v53;
        v56 = (void *)objc_claimAutoreleasedReturnValue(-[RDServer logoutTimer](self, "logoutTimer"));
        *(_DWORD *)v79 = 134217984;
        *(void *)&v79[4] = v56;
        v57 = (char *)_os_log_send_and_compose_impl( v54,  v78,  0LL,  0LL,  &_mh_execute_header,  v55,  0LL,  "Starting 6 minute logout timer [switchToUser] (%p)",  v79);

        if (v57) {
          sub_100053B7C(v57);
        }
        p_name = (char **)(&OBJC_PROTOCOL___UMMobileKeyBagProviding + 8);
      }

      else
      {
        v57 = 0LL;
      }

      free(v57);
    }

    v58 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[RDServer logoutTimer](self, "logoutTimer"));
    dispatch_time_t v59 = dispatch_time(0LL, 360000000000LL);
    dispatch_source_set_timer(v58, v59, 0xFFFFFFFFFFFFFFFFLL, 0LL);

    v60 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[RDServer logoutTimer](self, "logoutTimer"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10000B674;
    handler[3] = &unk_1000CCF28;
    handler[4] = self;
    dispatch_source_set_event_handler(v60, handler);

    v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[RDServer logoutTimer](self, "logoutTimer"));
    dispatch_activate((dispatch_object_t)v47);
  }

  uint64_t v61 = sub_100018E80(qword_1000DBD40);
  v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
  if (sub_100019ADC((uint64_t)v62))
  {
    uint64_t v63 = sub_100018E80(qword_1000DBD40);
    v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
    if (sub_100019B60((uint64_t)v64) == 502)
    {

LABEL_131:
      v74[0] = _NSConcreteStackBlock;
      v74[1] = 3221225472LL;
      v74[2] = sub_10000B9F4;
      v74[3] = &unk_1000CCFE0;
      v75 = v6;
      v76 = self;
      -[RDServer _enumerateClientsWithBlock:](self, "_enumerateClientsWithBlock:", v74);

      goto LABEL_135;
    }

    int v71 = dword_1000DBCF0;

    if (v71 != 1) {
      goto LABEL_131;
    }
  }

  else
  {
    int v65 = dword_1000DBCF0;

    if (v65 != 1) {
      goto LABEL_131;
    }
  }

  if (qword_1000DBA10 != -1) {
    dispatch_once(&qword_1000DBA10, &stru_1000CD208);
  }
  v66 = p_name[321];
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    *(void *)v79 = 0LL;
    unsigned int v67 = sub_100053B4C(1);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v68 = v67;
    }
    else {
      uint64_t v68 = v67 & 0xFFFFFFFE;
    }
    if ((_DWORD)v68)
    {
      LOWORD(v78[0]) = 0;
      LODWORD(v72) = 2;
      v69 = (const char *)_os_log_send_and_compose_impl( v68,  v79,  0LL,  0LL,  &_mh_execute_header,  v66,  0LL,  "IN SWITCH IN LOGIN SESSION, SO SKIP SHOULDSWITCH: move to ReallySW",  v78,  v72);
      v70 = (char *)v69;
      if (v69) {
        sub_100053B7C(v69);
      }
    }

    else
    {
      v70 = 0LL;
    }

    free(v70);
  }

  -[RDServer _reallySwitchUser:](self, "_reallySwitchUser:", 0LL);
LABEL_135:
}

- (void)switchToUser:(id)a3
{
}

- (BOOL)LogoutToUser:(id)a3
{
  id v4 = a3;
  -[RDServer setUserToSwitchTo:](self, "setUserToSwitchTo:", 0LL);
  -[RDServer setSwitchState:](self, "setSwitchState:", 1LL);
  if (qword_1000DBA10 != -1) {
    dispatch_once(&qword_1000DBA10, &stru_1000CD208);
  }
  uint64_t v5 = (os_log_s *)(id)qword_1000DBA08;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(void *)v51 = 0LL;
    unsigned int v6 = sub_100053B4C(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFE;
    }
    if ((_DWORD)v7)
    {
      LOWORD(v50[0]) = 0;
      id v8 = (const char *)_os_log_send_and_compose_impl( v7,  v51,  0LL,  0LL,  &_mh_execute_header,  v5,  0LL,  "in LogoutToUser, setting type to usertypesw to login",  v50,  2);
      unsigned int v9 = (char *)v8;
      if (v8) {
        sub_100053B7C(v8);
      }
    }

    else
    {
      unsigned int v9 = 0LL;
    }

    free(v9);
  }

  dword_1000DBCF0 = 3;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[RDServer fastLogoutTimer](self, "fastLogoutTimer"));

  if (v10)
  {
    if (qword_1000DBA20 != -1) {
      dispatch_once(&qword_1000DBA20, &stru_1000CD228);
    }
    int v11 = (os_log_s *)(id)qword_1000DBA18;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v50[0] = 0LL;
      LODWORD(v12) = sub_100053B4C(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v12 = v12;
      }
      else {
        uint64_t v12 = v12 & 0xFFFFFFFE;
      }
      if ((_DWORD)v12)
      {
        int v13 = v11;
        unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[RDServer fastLogoutTimer](self, "fastLogoutTimer"));
        *(_DWORD *)v51 = 134217984;
        *(void *)&v51[4] = v14;
        uint64_t v15 = (char *)_os_log_send_and_compose_impl( v12,  v50,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "Canceling fast logout timer (%p)",  v51);

        if (v15) {
          sub_100053B7C(v15);
        }
      }

      else
      {
        uint64_t v15 = 0LL;
      }

      free(v15);
    }

    uint64_t v16 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[RDServer fastLogoutTimer](self, "fastLogoutTimer"));
    dispatch_source_cancel(v16);

    -[RDServer setFastLogoutTimer:](self, "setFastLogoutTimer:", 0LL);
  }

  int v17 = (void *)objc_claimAutoreleasedReturnValue(-[RDServer pidsToClients](self, "pidsToClients"));
  id v18 = [v17 count];

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RDServer logoutTimer](self, "logoutTimer"));

    if (v19)
    {
      if (qword_1000DBA20 != -1) {
        dispatch_once(&qword_1000DBA20, &stru_1000CD228);
      }
      unsigned int v20 = (os_log_s *)(id)qword_1000DBA18;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v50[0] = 0LL;
        LODWORD(v21) = sub_100053B4C(0);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v21 = v21;
        }
        else {
          uint64_t v21 = v21 & 0xFFFFFFFE;
        }
        if ((_DWORD)v21)
        {
          id v22 = v20;
          id v23 = (void *)objc_claimAutoreleasedReturnValue(-[RDServer logoutTimer](self, "logoutTimer"));
          *(_DWORD *)v51 = 134217984;
          *(void *)&v51[4] = v23;
          __int16 v24 = (char *)_os_log_send_and_compose_impl( v21,  v50,  0LL,  0LL,  &_mh_execute_header,  v22,  0LL,  "Logout timer (%p) already running, not starting a new one.",  v51);

          if (v24) {
            sub_100053B7C(v24);
          }
        }

        else
        {
          __int16 v24 = 0LL;
        }

        free(v24);
      }
    }

    else
    {
      dispatch_source_t v30 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)qword_1000DBD48);
      -[RDServer setLogoutTimer:](self, "setLogoutTimer:", v30);

      if (qword_1000DBA20 != -1) {
        dispatch_once(&qword_1000DBA20, &stru_1000CD228);
      }
      uint64_t v31 = (os_log_s *)(id)qword_1000DBA18;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v50[0] = 0LL;
        LODWORD(v32) = sub_100053B4C(0);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v32 = v32;
        }
        else {
          uint64_t v32 = v32 & 0xFFFFFFFE;
        }
        if ((_DWORD)v32)
        {
          v33 = v31;
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[RDServer logoutTimer](self, "logoutTimer"));
          *(_DWORD *)v51 = 134217984;
          *(void *)&v51[4] = v34;
          unsigned int v35 = (char *)_os_log_send_and_compose_impl( v32,  v50,  0LL,  0LL,  &_mh_execute_header,  v33,  0LL,  "Starting 6 minute logout timer [LogoutToUser] (%p)",  v51);

          if (v35) {
            sub_100053B7C(v35);
          }
        }

        else
        {
          unsigned int v35 = 0LL;
        }

        free(v35);
      }

      v41 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[RDServer logoutTimer](self, "logoutTimer"));
      dispatch_time_t v42 = dispatch_time(0LL, 360000000000LL);
      dispatch_source_set_timer(v41, v42, 0xFFFFFFFFFFFFFFFFLL, 0LL);

      uint64_t v43 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[RDServer logoutTimer](self, "logoutTimer"));
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_10000C374;
      handler[3] = &unk_1000CCF28;
      handler[4] = self;
      dispatch_source_set_event_handler(v43, handler);

      unsigned int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[RDServer logoutTimer](self, "logoutTimer"));
      dispatch_activate((dispatch_object_t)v20);
    }

    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472LL;
    v46[2] = sub_10000C6B4;
    v46[3] = &unk_1000CCFE0;
    id v47 = v4;
    uint64_t v48 = self;
    -[RDServer _enumerateClientsWithBlock:](self, "_enumerateClientsWithBlock:", v46);
  }

  else
  {
    -[RDServer setSwitchState:](self, "setSwitchState:", 2LL);
    if (qword_1000DBA10 != -1) {
      dispatch_once(&qword_1000DBA10, &stru_1000CD208);
    }
    uint64_t v25 = (os_log_s *)(id)qword_1000DBA08;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(void *)v51 = 0LL;
      unsigned int v26 = sub_100053B4C(1);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v27 = v26;
      }
      else {
        uint64_t v27 = v26 & 0xFFFFFFFE;
      }
      if ((_DWORD)v27)
      {
        LOWORD(v50[0]) = 0;
        LODWORD(v45) = 2;
        id v28 = (const char *)_os_log_send_and_compose_impl( v27,  v51,  0LL,  0LL,  &_mh_execute_header,  v25,  0LL,  "NO Clients to willSwitchUser, moving to ReadytoSwitchUserWithRestart",  v50,  v45);
        id v29 = (char *)v28;
        if (v28) {
          sub_100053B7C(v28);
        }
      }

      else
      {
        id v29 = 0LL;
      }

      free(v29);
    }

    if (qword_1000DBA10 != -1) {
      dispatch_once(&qword_1000DBA10, &stru_1000CD208);
    }
    uint64_t v36 = (os_log_s *)(id)qword_1000DBA08;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(void *)v51 = 0LL;
      unsigned int v37 = sub_100053B4C(1);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v38 = v37;
      }
      else {
        uint64_t v38 = v37 & 0xFFFFFFFE;
      }
      if ((_DWORD)v38)
      {
        LOWORD(v50[0]) = 0;
        LODWORD(v45) = 2;
        uint64_t v39 = (const char *)_os_log_send_and_compose_impl( v38,  v51,  0LL,  0LL,  &_mh_execute_header,  v36,  0LL,  "LogoutToUser moving ON to _reallySwitchUser as NO CLIENTS",  v50,  v45);
        v40 = (char *)v39;
        if (v39) {
          sub_100053B7C(v39);
        }
      }

      else
      {
        v40 = 0LL;
      }

      free(v40);
    }

    -[RDServer _reallySwitchUser:](self, "_reallySwitchUser:", 1LL);
  }

  return 1;
}

- (void)_checkIfWeShouldSwitchUser:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = 0LL;
  __int16 v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  char v26 = 1;
  if (qword_1000DBA10 != -1) {
    dispatch_once(&qword_1000DBA10, &stru_1000CD208);
  }
  uint64_t v5 = (os_log_s *)(id)qword_1000DBA08;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v22[0] = 0LL;
    unsigned int v6 = sub_100053B4C(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFE;
    }
    if ((_DWORD)v7)
    {
      id v8 = "FALSE";
      if (v3) {
        id v8 = "TRUE";
      }
      *(_DWORD *)uint64_t v27 = 136315138;
      *(void *)&v27[4] = v8;
      unsigned int v9 = (const char *)_os_log_send_and_compose_impl( v7,  v22,  0LL,  0LL,  &_mh_execute_header,  v5,  0LL,  "IN _checkIfWeShouldSwitchUser logout:%s",  v27);
      uint64_t v10 = (char *)v9;
      if (v9) {
        sub_100053B7C(v9);
      }
    }

    else
    {
      uint64_t v10 = 0LL;
    }

    free(v10);
  }

  if (-[RDServer switchState](self, "switchState") == 1)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10000CC4C;
    v21[3] = &unk_1000CD008;
    v21[4] = &v23;
    -[RDServer _enumerateClientsWithBlock:](self, "_enumerateClientsWithBlock:", v21);
    if (*((_BYTE *)v24 + 24))
    {
      if (qword_1000DBA10 != -1) {
        dispatch_once(&qword_1000DBA10, &stru_1000CD208);
      }
      int v11 = (os_log_s *)(id)qword_1000DBA08;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(void *)uint64_t v27 = 0LL;
        unsigned int v12 = sub_100053B4C(1);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v13 = v12;
        }
        else {
          uint64_t v13 = v12 & 0xFFFFFFFE;
        }
        if ((_DWORD)v13)
        {
          LOWORD(v22[0]) = 0;
          unsigned int v14 = (const char *)_os_log_send_and_compose_impl( v13,  v27,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "_checkIfWeShouldSwitchUser should switch",  v22,  2);
          uint64_t v15 = (char *)v14;
          if (v14) {
            sub_100053B7C(v14);
          }
        }

        else
        {
          uint64_t v15 = 0LL;
        }

        free(v15);
      }

      -[RDServer _reallySwitchUser:](self, "_reallySwitchUser:", v3);
    }
  }

  else
  {
    if (qword_1000DBA10 != -1) {
      dispatch_once(&qword_1000DBA10, &stru_1000CD208);
    }
    uint64_t v16 = (os_log_s *)(id)qword_1000DBA08;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(void *)uint64_t v27 = 0LL;
      unsigned int v17 = sub_100053B4C(1);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v18 = v17;
      }
      else {
        uint64_t v18 = v17 & 0xFFFFFFFE;
      }
      if ((_DWORD)v18)
      {
        LOWORD(v22[0]) = 0;
        v19 = (const char *)_os_log_send_and_compose_impl( v18,  v27,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "_checkIfWeShouldSwitchUser returns as device not in userswitch yet",  v22,  2);
        unsigned int v20 = (char *)v19;
        if (v19) {
          sub_100053B7C(v19);
        }
      }

      else
      {
        unsigned int v20 = 0LL;
      }

      free(v20);
    }
  }

  _Block_object_dispose(&v23, 8);
}

- (void)_reallySwitchUser:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(-[RDServer userToSwitchTo](self, "userToSwitchTo"));
  if (qword_1000DBA10 != -1) {
    dispatch_once(&qword_1000DBA10, &stru_1000CD208);
  }
  unsigned int v6 = (os_log_s *)(id)qword_1000DBA08;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v92 = 0LL;
    unsigned int v7 = sub_100053B4C(1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = v7 & 0xFFFFFFFE;
    }
    if ((_DWORD)v8)
    {
      unsigned int v9 = "FALSE";
      if (v3) {
        unsigned int v9 = "TRUE";
      }
      *(_DWORD *)v91 = 136315138;
      *(void *)&v91[4] = v9;
      uint64_t v10 = (const char *)_os_log_send_and_compose_impl( v8,  &v92,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "in _reallySwitchUser: logoutPath:%s",  v91);
      int v11 = (char *)v10;
      if (v10) {
        sub_100053B7C(v10);
      }
    }

    else
    {
      int v11 = 0LL;
    }

    free(v11);
  }

  -[RDServer setSwitchState:](self, "setSwitchState:", 2LL);
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[RDServer logoutTimer](self, "logoutTimer"));

  if (v12)
  {
    if (qword_1000DBA20 != -1) {
      dispatch_once(&qword_1000DBA20, &stru_1000CD228);
    }
    uint64_t v13 = (os_log_s *)(id)qword_1000DBA18;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v92 = 0LL;
      LODWORD(v14) = sub_100053B4C(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v14 = v14;
      }
      else {
        uint64_t v14 = v14 & 0xFFFFFFFE;
      }
      if ((_DWORD)v14)
      {
        uint64_t v15 = v13;
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[RDServer logoutTimer](self, "logoutTimer"));
        *(_DWORD *)v91 = 134217984;
        *(void *)&v91[4] = v16;
        unsigned int v17 = (char *)_os_log_send_and_compose_impl( v14,  &v92,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "Canceling logout timer (%p)",  v91);

        if (v17) {
          sub_100053B7C(v17);
        }
      }

      else
      {
        unsigned int v17 = 0LL;
      }

      free(v17);
    }

    uint64_t v18 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[RDServer logoutTimer](self, "logoutTimer"));
    dispatch_source_cancel(v18);

    -[RDServer setLogoutTimer:](self, "setLogoutTimer:", 0LL);
  }

  uint64_t v19 = sub_100018E80(qword_1000DBD40);
  unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  if ((sub_100019ADC((uint64_t)v20) & 1) != 0)
  {
    uint64_t v21 = sub_100018E80(qword_1000DBD40);
    id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    int v23 = sub_100019B60((uint64_t)v22);

    if (v23 == 502)
    {
      if (qword_1000DBA10 != -1) {
        dispatch_once(&qword_1000DBA10, &stru_1000CD208);
      }
      __int16 v24 = (os_log_s *)(id)qword_1000DBA08;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(void *)v91 = 0LL;
        unsigned int v25 = sub_100053B4C(1);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v26 = v25;
        }
        else {
          uint64_t v26 = v25 & 0xFFFFFFFE;
        }
        if ((_DWORD)v26)
        {
          LOWORD(v92) = 0;
          uint64_t v27 = (const char *)_os_log_send_and_compose_impl( v26,  v91,  0LL,  0LL,  &_mh_execute_header,  v24,  0LL,  "LoginUI should not have any sync bubble content, remove if any is left out..",  &v92,  2);
          id v28 = (char *)v27;
          if (v27) {
            sub_100053B7C(v27);
          }
        }

        else
        {
          id v28 = 0LL;
        }

        free(v28);
      }

      sub_10001D8E8(0LL, 502);
      goto LABEL_67;
    }
  }

  else
  {
  }

  if ((dword_1000DBCF0 & 0xFFFFFFFE) == 2)
  {
    if (qword_1000DBA10 != -1) {
      dispatch_once(&qword_1000DBA10, &stru_1000CD208);
    }
    id v29 = (os_log_s *)(id)qword_1000DBA08;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(void *)v91 = 0LL;
      unsigned int v30 = sub_100053B4C(1);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v31 = v30;
      }
      else {
        uint64_t v31 = v30 & 0xFFFFFFFE;
      }
      if ((_DWORD)v31)
      {
        LOWORD(v92) = 0;
        uint64_t v32 = (const char *)_os_log_send_and_compose_impl( v31,  v91,  0LL,  0LL,  &_mh_execute_header,  v29,  0LL,  "ENUMERATING SYNCTASKS",  &v92,  2);
        v33 = (char *)v32;
        if (v32) {
          sub_100053B7C(v32);
        }
      }

      else
      {
        v33 = 0LL;
      }

      free(v33);
    }

    -[RDServer _enumerateClientsWithBlock:](self, "_enumerateClientsWithBlock:", &stru_1000CD028);
    sub_100034A5C();
  }

  else
  {
    if (qword_1000DBA10 != -1) {
      dispatch_once(&qword_1000DBA10, &stru_1000CD208);
    }
    v34 = (os_log_s *)(id)qword_1000DBA08;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(void *)v91 = 0LL;
      unsigned int v35 = sub_100053B4C(1);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v36 = v35;
      }
      else {
        uint64_t v36 = v35 & 0xFFFFFFFE;
      }
      if ((_DWORD)v36)
      {
        LODWORD(v92) = 67109120;
        HIDWORD(v92) = dword_1000DBCF0;
        unsigned int v37 = (const char *)_os_log_send_and_compose_impl( v36,  v91,  0LL,  0LL,  &_mh_execute_header,  v34,  0LL,  "NOT IN UserSession to collect SyncBubble service, _gUserSessionType:%d",  &v92);
        uint64_t v38 = (char *)v37;
        if (v37) {
          sub_100053B7C(v37);
        }
      }

      else
      {
        uint64_t v38 = 0LL;
      }

      free(v38);
    }
  }

- (void)addUserSwitchBlockingTask:(id)a3 forPID:(int)a4
{
}

- (void)removeUserSwitchBlockingTask:(id)a3 forPID:(int)a4
{
}

- (void)addUserSwitchBlockingTask:(id)a3 forPID:(int)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (dispatch_queue_s *)qword_1000DBD48;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000EF5C;
  v13[3] = &unk_1000CCE90;
  int v16 = a4;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)removeUserSwitchBlockingTask:(id)a3 forPID:(int)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (dispatch_queue_s *)qword_1000DBD48;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000F2D0;
  v13[3] = &unk_1000CCE90;
  int v16 = a4;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)_broadcastUserSwitchTaskListDidUpdate
{
}

- (void)_broadcastDeviceLoginSessionStateDidUpdate
{
}

- (void)fetchUserSwitchBlockingTaskListWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)qword_1000DBD48;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000F79C;
  v7[3] = &unk_1000CD0B8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)fetchUserSyncTaskList
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000F8FC;
  v5[3] = &unk_1000CD090;
  BOOL v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v6 = v3;
  -[RDServer _enumerateClientsWithBlock:](self, "_enumerateClientsWithBlock:", v5);

  return v3;
}

- (id)fetchUserBlockTaskList
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000F9C0;
  v5[3] = &unk_1000CD090;
  BOOL v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v6 = v3;
  -[RDServer _enumerateClientsWithBlock:](self, "_enumerateClientsWithBlock:", v5);

  return v3;
}

- (void)addUserSyncTask:(id)a3 forPID:(int)a4
{
}

- (void)removeUserSyncTask:(id)a3 forPID:(int)a4
{
}

- (void)addUserSyncTask:(id)a3 forPID:(int)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (dispatch_queue_s *)qword_1000DBD48;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000FACC;
  v13[3] = &unk_1000CCE90;
  int v16 = a4;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)removeUserSyncTask:(id)a3 forPID:(int)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (dispatch_queue_s *)qword_1000DBD48;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000FE70;
  v13[3] = &unk_1000CCE90;
  int v16 = a4;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)suspendUserQuotaForPID:(int)a3 completionHandler:(id)a4
{
  id v4 = a4;
  uint64_t v5 = (dispatch_queue_s *)qword_1000DBD48;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000101C0;
  block[3] = &unk_1000CD0E0;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

- (void)reengageUserQuotaForPID:(int)a3 completionHandler:(id)a4
{
  id v4 = a4;
  uint64_t v5 = (dispatch_queue_s *)qword_1000DBD48;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000102A4;
  block[3] = &unk_1000CD0E0;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

- (void)createPersona:(id)a3 passcodeData:(id)a4 forPid:(int)a5 completionHandler:(id)a6
{
}

- (void)createPersona:(id)a3 passcodeData:(id)a4 passcodeDataType:(unint64_t)a5 forPid:(int)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  unsigned int v16 = [v15 processIdentifier];

  if (v16 != a6)
  {
    if (qword_1000DBA10 != -1) {
      dispatch_once(&qword_1000DBA10, &stru_1000CD208);
    }
    unsigned int v17 = (os_log_s *)(id)qword_1000DBA08;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v35 = 0LL;
      unsigned int v18 = sub_100053B4C(1);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v19 = v18;
      }
      else {
        uint64_t v19 = v18 & 0xFFFFFFFE;
      }
      if ((_DWORD)v19)
      {
        v36[0] = 67109376;
        v36[1] = v16;
        __int16 v37 = 1024;
        int v38 = a6;
        unsigned int v20 = (const char *)_os_log_send_and_compose_impl( v19,  &v35,  0LL,  0LL,  &_mh_execute_header,  v17,  0LL,  " RDSERVER: DIFFERING PID: createPersona PID from connection: %d, passed in pid: %d",  v36,  14);
        uint64_t v21 = (char *)v20;
        if (v20) {
          sub_100053B7C(v20);
        }
      }

      else
      {
        uint64_t v21 = 0LL;
      }

      free(v21);
    }
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  int v23 = sub_100046494((uint64_t)[v22 processIdentifier]);

  __int16 v24 = (dispatch_queue_s *)qword_1000DBD48;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010570;
  block[3] = &unk_1000CD130;
  void block[4] = self;
  id v29 = v12;
  id v31 = v14;
  unint64_t v32 = a5;
  id v30 = v13;
  unsigned int v33 = v16;
  int v34 = v23;
  id v25 = v13;
  id v26 = v12;
  id v27 = v14;
  dispatch_async(v24, block);
}

- (void)deletePersona:(id)a3 forPid:(int)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  unsigned int v11 = [v10 processIdentifier];

  if (v11 != a4)
  {
    if (qword_1000DBA10 != -1) {
      dispatch_once(&qword_1000DBA10, &stru_1000CD208);
    }
    id v12 = (os_log_s *)(id)qword_1000DBA08;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = 0LL;
      unsigned int v13 = sub_100053B4C(1);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v14 = v13;
      }
      else {
        uint64_t v14 = v13 & 0xFFFFFFFE;
      }
      if ((_DWORD)v14)
      {
        v28[0] = 67109376;
        v28[1] = v11;
        __int16 v29 = 1024;
        int v30 = a4;
        id v15 = (const char *)_os_log_send_and_compose_impl( v14,  &v27,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  " RDSERVER: DIFFERING PID: deletePersona PID from connection: %d, passed in pid: %d",  v28,  14);
        unsigned int v16 = (char *)v15;
        if (v15) {
          sub_100053B7C(v15);
        }
      }

      else
      {
        unsigned int v16 = 0LL;
      }

      free(v16);
    }
  }

  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  int v18 = sub_100046494((uint64_t)[v17 processIdentifier]);

  uint64_t v19 = (dispatch_queue_s *)qword_1000DBD48;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100011508;
  block[3] = &unk_1000CD158;
  void block[4] = self;
  id v23 = v8;
  unsigned int v25 = v11;
  int v26 = v18;
  id v24 = v9;
  id v20 = v9;
  id v21 = v8;
  dispatch_async(v19, block);
}

- (void)disablePersona:(id)a3 forPid:(int)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  unsigned int v11 = [v10 processIdentifier];

  if (v11 != a4)
  {
    if (qword_1000DBA10 != -1) {
      dispatch_once(&qword_1000DBA10, &stru_1000CD208);
    }
    id v12 = (os_log_s *)(id)qword_1000DBA08;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = 0LL;
      unsigned int v13 = sub_100053B4C(1);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v14 = v13;
      }
      else {
        uint64_t v14 = v13 & 0xFFFFFFFE;
      }
      if ((_DWORD)v14)
      {
        v28[0] = 67109376;
        v28[1] = v11;
        __int16 v29 = 1024;
        int v30 = a4;
        id v15 = (const char *)_os_log_send_and_compose_impl( v14,  &v27,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  " RDSERVER: DIFFERING PID: disablePersona PID from connection: %d, passed in pid: %d",  v28,  14);
        unsigned int v16 = (char *)v15;
        if (v15) {
          sub_100053B7C(v15);
        }
      }

      else
      {
        unsigned int v16 = 0LL;
      }

      free(v16);
    }
  }

  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  int v18 = sub_100046494((uint64_t)[v17 processIdentifier]);

  uint64_t v19 = (dispatch_queue_s *)qword_1000DBD48;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100011CE0;
  block[3] = &unk_1000CD158;
  void block[4] = self;
  id v23 = v8;
  unsigned int v25 = v11;
  int v26 = v18;
  id v24 = v9;
  id v20 = v9;
  id v21 = v8;
  dispatch_async(v19, block);
}

- (void)fetchPersonaListforPid:(int)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  int v8 = sub_100046494((uint64_t)[v7 processIdentifier]);

  id v9 = (dispatch_queue_s *)qword_1000DBD48;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100012354;
  block[3] = &unk_1000CCF50;
  int v13 = a3;
  int v14 = v8;
  void block[4] = self;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

- (void)fetchAllUsersPersonaListforPid:(int)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  unsigned int v7 = (dispatch_queue_s *)qword_1000DBD48;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000128F0;
  block[3] = &unk_1000CCE68;
  int v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)fetchAsidMapforPid:(int)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  unsigned int v7 = (dispatch_queue_s *)qword_1000DBD48;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100012E38;
  block[3] = &unk_1000CCE68;
  int v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)fetchPersona:(id)a3 forPid:(int)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  int v11 = sub_100046494((uint64_t)[v10 processIdentifier]);

  id v12 = (dispatch_queue_s *)qword_1000DBD48;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100013290;
  v15[3] = &unk_1000CD158;
  v15[4] = self;
  id v16 = v8;
  int v18 = a4;
  int v19 = v11;
  id v17 = v9;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v12, v15);
}

- (void)setSinglePersonaBundlesIdentifiers:(id)a3 forPersona:(id)a4 forPid:(int)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  unsigned int v14 = [v13 processIdentifier];

  if (v14 != a5)
  {
    if (qword_1000DBA10 != -1) {
      dispatch_once(&qword_1000DBA10, &stru_1000CD208);
    }
    id v15 = (os_log_s *)(id)qword_1000DBA08;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = 0LL;
      unsigned int v16 = sub_100053B4C(1);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v17 = v16;
      }
      else {
        uint64_t v17 = v16 & 0xFFFFFFFE;
      }
      if ((_DWORD)v17)
      {
        v33[0] = 67109376;
        v33[1] = v14;
        __int16 v34 = 1024;
        int v35 = a5;
        int v18 = (const char *)_os_log_send_and_compose_impl( v17,  &v32,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  " RDSERVER: DIFFERING PID: setSinglePersonaBundlesIdentifiers PID from connection: %d, passed in pid: %d",  v33,  14);
        int v19 = (char *)v18;
        if (v18) {
          sub_100053B7C(v18);
        }
      }

      else
      {
        int v19 = 0LL;
      }

      free(v19);
    }
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  int v21 = sub_100046494((uint64_t)[v20 processIdentifier]);

  id v22 = (dispatch_queue_s *)qword_1000DBD48;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100013BB8;
  block[3] = &unk_1000CD180;
  void block[4] = self;
  id v27 = v11;
  unsigned int v30 = v14;
  int v31 = v21;
  id v28 = v10;
  id v29 = v12;
  id v23 = v12;
  id v24 = v10;
  id v25 = v11;
  dispatch_async(v22, block);
}

- (void)fetchBundleIdentifiersForPersona:(id)a3 forPid:(int)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  int v11 = sub_100046494((uint64_t)[v10 processIdentifier]);

  id v12 = (dispatch_queue_s *)qword_1000DBD48;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100014350;
  v15[3] = &unk_1000CD158;
  v15[4] = self;
  id v16 = v8;
  int v18 = a4;
  int v19 = v11;
  id v17 = v9;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v12, v15);
}

- (void)setMultiPersonaBundlesIdentifiers:(id)a3 forPid:(int)a4 WithcompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  unsigned int v11 = [v10 processIdentifier];

  if (v11 != a4)
  {
    if (qword_1000DBA10 != -1) {
      dispatch_once(&qword_1000DBA10, &stru_1000CD208);
    }
    id v12 = (os_log_s *)(id)qword_1000DBA08;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = 0LL;
      unsigned int v13 = sub_100053B4C(1);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v14 = v13;
      }
      else {
        uint64_t v14 = v13 & 0xFFFFFFFE;
      }
      if ((_DWORD)v14)
      {
        v28[0] = 67109376;
        v28[1] = v11;
        __int16 v29 = 1024;
        int v30 = a4;
        id v15 = (const char *)_os_log_send_and_compose_impl( v14,  &v27,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  " RDSERVER: DIFFERING PID: setMultiPersonaBundlesIdentifiers PID from connection: %d, passed in pid: %d",  v28,  14);
        id v16 = (char *)v15;
        if (v15) {
          sub_100053B7C(v15);
        }
      }

      else
      {
        id v16 = 0LL;
      }

      free(v16);
    }
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  int v18 = sub_100046494((uint64_t)[v17 processIdentifier]);

  int v19 = (dispatch_queue_s *)qword_1000DBD48;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100014C3C;
  block[3] = &unk_1000CD158;
  void block[4] = self;
  id v23 = v8;
  unsigned int v25 = v11;
  int v26 = v18;
  id v24 = v9;
  id v20 = v9;
  id v21 = v8;
  dispatch_async(v19, block);
}

- (void)fetchMultiPersonaBundleIdentifiersforPid:(int)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  int v8 = sub_100046494((uint64_t)[v7 processIdentifier]);

  id v9 = (dispatch_queue_s *)qword_1000DBD48;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000152C4;
  block[3] = &unk_1000CCF50;
  int v13 = a3;
  int v14 = v8;
  void block[4] = self;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

- (void)personaLoginWithPid:(int)a3 WithUserODuuid:(id)a4 withUid:(unsigned int)a5 completionHandler:(id)a6
{
  if (a6)
  {
    id v7 = a6;
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  45LL,  0LL));
    (*((void (**)(id, id))a6 + 2))(v7, v8);
  }

- (void)personaLogoutWithPid:(int)a3 WithUserODuuid:(id)a4 withUid:(unsigned int)a5 completionHandler:(id)a6
{
  if (a6)
  {
    id v7 = a6;
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  45LL,  0LL));
    (*((void (**)(id, id))a6 + 2))(v7, v8);
  }

- (void)_broadcastPersonaUpdates:(id)a3 withAuid:(unsigned int)a4
{
  id v6 = a3;
  if (qword_1000DBA10 != -1) {
    dispatch_once(&qword_1000DBA10, &stru_1000CD208);
  }
  id v7 = (os_log_s *)(id)qword_1000DBA08;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = 0LL;
    unsigned int v8 = sub_100053B4C(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = v8 & 0xFFFFFFFE;
    }
    if ((_DWORD)v9)
    {
      __int16 v16 = 0;
      id v10 = (const char *)_os_log_send_and_compose_impl( v9,  &v17,  0LL,  0LL,  &_mh_execute_header,  v7,  0LL,  "Persona Update broadcast for registered machService",  &v16,  2);
      unsigned int v11 = (char *)v10;
      if (v10) {
        sub_100053B7C(v10);
      }
    }

    else
    {
      unsigned int v11 = 0LL;
    }

    free(v11);
  }

  CFArrayRef v12 = sub_1000463D8(v6);
  CFArrayRef v13 = v12;
  if (v12)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100015AFC;
    v14[3] = &unk_1000CD1A8;
    v14[4] = self;
    unsigned int v15 = a4;
    -[__CFArray enumerateObjectsUsingBlock:](v12, "enumerateObjectsUsingBlock:", v14);
  }
}

- (BOOL)notifyNextPersonaObserver:(id)a3 withUser:(unsigned int)a4
{
  id v5 = a3;
  if (v5)
  {
    if (qword_1000DBA10 != -1) {
      dispatch_once(&qword_1000DBA10, &stru_1000CD208);
    }
    id v6 = (os_log_s *)(id)qword_1000DBA08;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v30[0] = 0LL;
      unsigned int v7 = sub_100053B4C(1);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = v7 & 0xFFFFFFFE;
      }
      if ((_DWORD)v8)
      {
        *(_DWORD *)int v31 = 138412290;
        *(void *)&v31[4] = v5;
        uint64_t v9 = (const char *)_os_log_send_and_compose_impl( v8,  v30,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "setting up connection to mach service %@",  v31,  12);
        id v10 = (char *)v9;
        if (v9) {
          sub_100053B7C(v9);
        }
      }

      else
      {
        id v10 = 0LL;
      }

      free(v10);
    }

    __int16 v16 = -[NSXPCConnection initWithMachServiceName:options:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithMachServiceName:options:",  v5,  0LL);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[RDClient sharedXPCInterface](&OBJC_CLASS___RDClient, "sharedXPCInterface"));
    -[NSXPCConnection setRemoteObjectInterface:](v16, "setRemoteObjectInterface:", v17);

    int v18 = (void *)objc_claimAutoreleasedReturnValue(+[RDServer sharedXPCInterface](&OBJC_CLASS___RDServer, "sharedXPCInterface"));
    -[NSXPCConnection setExportedInterface:](v16, "setExportedInterface:", v18);

    -[NSXPCConnection setExportedObject:](v16, "setExportedObject:", self);
    -[NSXPCConnection setInterruptionHandler:](v16, "setInterruptionHandler:", &stru_1000CD1C8);
    -[NSXPCConnection setInvalidationHandler:](v16, "setInvalidationHandler:", &stru_1000CD1E8);
    -[NSXPCConnection resume](v16, "resume");
    id v11 = (id)objc_claimAutoreleasedReturnValue(+[RDClient clientWithXPCConnection:](&OBJC_CLASS___RDClient, "clientWithXPCConnection:", v16));
    if (!v11)
    {
      if (qword_1000DBA10 != -1) {
        dispatch_once(&qword_1000DBA10, &stru_1000CD208);
      }
      int v19 = (os_log_s *)(id)qword_1000DBA08;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(void *)int v31 = 0LL;
        unsigned int v20 = sub_100053B4C(1);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v21 = v20;
        }
        else {
          uint64_t v21 = v20 & 0xFFFFFFFE;
        }
        if ((_DWORD)v21)
        {
          LOWORD(v30[0]) = 0;
          LODWORD(v26) = 2;
          id v22 = (const char *)_os_log_send_and_compose_impl( v21,  v31,  0LL,  0LL,  &_mh_execute_header,  v19,  0LL,  "No personaOberverClient",  v30,  v26);
          id v23 = (char *)v22;
          if (v22) {
            sub_100053B7C(v22);
          }
        }

        else
        {
          id v23 = 0LL;
        }

        free(v23);
      }
    }

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_1000162C4;
    v27[3] = &unk_1000CCE40;
    id v28 = v5;
    __int16 v29 = v16;
    id v24 = v16;
    [v11 personaUpdateCallbackForMachServiceCompletionHandler:v27];
  }

  else
  {
    if (qword_1000DBA10 != -1) {
      dispatch_once(&qword_1000DBA10, &stru_1000CD208);
    }
    id v11 = (id)qword_1000DBA08;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      *(void *)int v31 = 0LL;
      unsigned int v12 = sub_100053B4C(1);
      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v13 = v12;
      }
      else {
        uint64_t v13 = v12 & 0xFFFFFFFE;
      }
      if ((_DWORD)v13)
      {
        LOWORD(v30[0]) = 0;
        int v14 = (const char *)_os_log_send_and_compose_impl( v13,  v31,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "No machService called in",  v30,  2);
        unsigned int v15 = (char *)v14;
        if (v14) {
          sub_100053B7C(v14);
        }
      }

      else
      {
        unsigned int v15 = 0LL;
      }

      free(v15);
    }
  }

  return v5 != 0LL;
}

- (void)registerUserPersonaStakeholderForPID:(int)a3 completionHandler:(id)a4
{
  id v6 = a4;
  unsigned int v7 = (dispatch_queue_s *)qword_1000DBD48;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100016498;
  block[3] = &unk_1000CCE68;
  int v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)registerUserPersonaObserverForPID:(int)a3 withMachServiceName:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  int v11 = sub_100046494((uint64_t)[v10 processIdentifier]);

  unsigned int v12 = (dispatch_queue_s *)qword_1000DBD48;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000169DC;
  v15[3] = &unk_1000CD158;
  v15[4] = self;
  id v16 = v8;
  int v18 = a3;
  int v19 = v11;
  id v17 = v9;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v12, v15);
}

- (int)asidForClient:(id)a3 withAuid:(unsigned int *)a4 withPid:(int)a5
{
  if (a4) {
    *a4 = -1;
  }
  return -1;
}

- (void)provisionDevice:(id)a3 forPid:(int)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (dispatch_queue_s *)qword_1000DBD48;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100017040;
  v13[3] = &unk_1000CCE90;
  int v16 = a4;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)resetStateForUserSwitch
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[RDServer logoutTimer](self, "logoutTimer"));

  if (v3)
  {
    if (qword_1000DBA20 != -1) {
      dispatch_once(&qword_1000DBA20, &stru_1000CD228);
    }
    id v4 = (os_log_s *)(id)qword_1000DBA18;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = 0LL;
      LODWORD(v5) = sub_100053B4C(0);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v5 = v5;
      }
      else {
        uint64_t v5 = v5 & 0xFFFFFFFE;
      }
      if ((_DWORD)v5)
      {
        id v6 = v4;
        unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[RDServer logoutTimer](self, "logoutTimer"));
        int v18 = 134217984;
        int v19 = v7;
        id v8 = (char *)_os_log_send_and_compose_impl( v5,  &v17,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "Canceling logout timer (%p)",  &v18);

        if (v8) {
          sub_100053B7C(v8);
        }
      }

      else
      {
        id v8 = 0LL;
      }

      free(v8);
    }

    id v9 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[RDServer logoutTimer](self, "logoutTimer"));
    dispatch_source_cancel(v9);

    -[RDServer setLogoutTimer:](self, "setLogoutTimer:", 0LL);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[RDServer fastLogoutTimer](self, "fastLogoutTimer"));

  if (v10)
  {
    if (qword_1000DBA20 != -1) {
      dispatch_once(&qword_1000DBA20, &stru_1000CD228);
    }
    id v11 = (os_log_s *)(id)qword_1000DBA18;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = 0LL;
      LODWORD(v12) = sub_100053B4C(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v12 = v12;
      }
      else {
        uint64_t v12 = v12 & 0xFFFFFFFE;
      }
      if ((_DWORD)v12)
      {
        id v13 = v11;
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[RDServer fastLogoutTimer](self, "fastLogoutTimer"));
        int v18 = 134217984;
        int v19 = v14;
        id v15 = (char *)_os_log_send_and_compose_impl( v12,  &v17,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "Canceling fast logout timer (%p)",  &v18);

        if (v15) {
          sub_100053B7C(v15);
        }
      }

      else
      {
        id v15 = 0LL;
      }

      free(v15);
    }

    int v16 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[RDServer fastLogoutTimer](self, "fastLogoutTimer"));
    dispatch_source_cancel(v16);

    -[RDServer setFastLogoutTimer:](self, "setFastLogoutTimer:", 0LL);
  }

- (NSMutableDictionary)pidsToClients
{
  return self->_pidsToClients;
}

- (void)setPidsToClients:(id)a3
{
}

- (NSMutableDictionary)userToSwitchTo
{
  return self->_userToSwitchTo;
}

- (void)setUserToSwitchTo:(id)a3
{
}

- (int)switchState
{
  return self->_switchState;
}

- (void)setSwitchState:(int)a3
{
  self->_switchState = a3;
}

- (OS_dispatch_source)logoutTimer
{
  return self->_logoutTimer;
}

- (void)setLogoutTimer:(id)a3
{
}

- (OS_dispatch_source)fastLogoutTimer
{
  return self->_fastLogoutTimer;
}

- (void)setFastLogoutTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
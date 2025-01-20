@interface FudIpcDispatch
- (BOOL)dispatchEvent:(id)a3;
- (BOOL)dispatchQueryEvent:(id)a3;
- (BOOL)dispatchStateMachineEvent:(id)a3;
- (BOOL)dispatchStatelessEvent:(id)a3;
- (BOOL)isEventQueryRequest:(id)a3;
- (BOOL)isEventStateless:(id)a3;
- (BOOL)isStateMachineAcceptingNewStreamEvents:(id)a3;
- (BOOL)isStateMachineBusyInExclusionGroup:(id)a3;
- (BOOL)isStateMachineForFilterAcceptingNewStreamEvents:(id)a3;
- (BOOL)notifyAccessoryAttachedWithEvent:(id)a3;
- (BOOL)registerClientWithEvent:(id)a3 error:(id *)a4;
- (BOOL)sendDeviceClassAttached:(id)a3 toClient:(id)a4;
- (BOOL)sendReplyToDictionary:(id)a3 forCommand:(int)a4 withStatus:(BOOL)a5 withError:(id)a6;
- (BOOL)setLastRemoteFindWithEvent:(id)a3;
- (BOOL)setupClientSessionWithEvent:(id)a3 error:(id *)a4;
- (BOOL)shouldBlockCriticalSectionDuringStep:(int)a3;
- (BOOL)shouldUnblockCriticalSectionAfterStep:(int)a3 wasSuccessful:(BOOL)a4;
- (BOOL)unregisterClientWithEvent:(id)a3 error:(id *)a4;
- (FudIpcDispatch)initWithStorage:(id)a3;
- (OS_dispatch_queue)workQueue;
- (id)getPluginWithName:(id)a3 forFilter:(id)a4 delegate:(id)a5 info:(id *)a6 options:(id)a7;
- (id)getStorage;
- (int)getCommandForState:(int)a3;
- (void)accessoryDisconnected:(id)a3 error:(id)a4;
- (void)addEventToQueue:(id)a3 withFilter:(id)a4 stateMachine:(id)a5;
- (void)aquireCriticalSectionLock;
- (void)dealloc;
- (void)disableStreamEventsForStateMachine:(id)a3;
- (void)enableStreamEventsForStateMachine:(id)a3;
- (void)issueNotification:(id)a3 request:(id)a4;
- (void)queueUpEventForAccessory:(id)a3 stateMachine:(id)a4;
- (void)releaseCriticalSectionLock;
- (void)stepComplete:(int)a3 stateMachine:(id)a4 status:(BOOL)a5 error:(id)a6 info:(id)a7;
- (void)stepProgress:(int)a3 stateMachine:(id)a4 progress:(double)a5 overallProgress:(double)a6;
- (void)stepWillBegin:(int)a3 stateMachine:(id)a4;
@end

@implementation FudIpcDispatch

- (FudIpcDispatch)initWithStorage:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___FudIpcDispatch;
  v4 = -[FudIpcDispatch init](&v9, "init");
  if (a3)
  {
    v4->eventFlags = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  5LL);
    v4->storage = (FudStorage *)a3;
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_BACKGROUND, 0);
    v4->_attr = (OS_dispatch_queue_attr *)v6;
    v4->isActive = 1;
    v4->workQueue = (OS_dispatch_queue *)dispatch_queue_create( "com.apple.MobileAccessoryUpdater.dispatch.workQueue",  v6);
    v4->criticalSectionSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(1LL);
    v4->queuedEvents = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  3LL);
  }

  else
  {
    FudLog(3LL, @"You need storage to run dispatch class!");
    v7 = v4;
    return 0LL;
  }

  return v4;
}

- (BOOL)isEventStateless:(id)a3
{
  if (a3) {
    return [a3 type] == 107
  }
        || [a3 type] == 105
        || [a3 type] == 106
        || [a3 type] == 100
        || [a3 type] == 117;
  FudLog(3LL, @"Can't check state on nil event");
  return 0;
}

- (BOOL)isEventQueryRequest:(id)a3
{
  if (a3)
  {
  }

  else
  {
    FudLog(3LL, @"Can't check if query event since it's nil");
  }

  return 0;
}

- (BOOL)unregisterClientWithEvent:(id)a3 error:(id *)a4
{
  if (a3)
  {
    if (objc_msgSend(a3, "clientName", "-[FudIpcDispatch unregisterClientWithEvent:error:]"))
    {
      -[FudStorage unregisterClientFromAllPlugins:]( self->storage,  "unregisterClientFromAllPlugins:",  [a3 clientName]);
      return 1;
    }

    v8 = @"Can't unregister client without name";
  }

  else
  {
    v8 = @"Can't unregister with NULL event";
  }

  if (!a4) {
    return 0;
  }
  objc_super v9 = (void *)FUDError(1LL, v8);
  BOOL result = 0;
  *a4 = v9;
  return result;
}

- (BOOL)registerClientWithEvent:(id)a3 error:(id *)a4
{
  if (!a3)
  {
    objc_super v9 = @"Can't register with nil event";
    goto LABEL_21;
  }

  if (!objc_msgSend(a3, "clientName", "-[FudIpcDispatch registerClientWithEvent:error:]"))
  {
    objc_super v9 = @"Can't register with nil client name";
    goto LABEL_21;
  }

  v7 = -[FudStorage getClientWithName:](self->storage, "getClientWithName:", [a3 clientName]);
  if ([a3 isInternalEvent])
  {
    xpc_connection_t remote_connection = 0LL;
  }

  else
  {
    xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection([a3 data]);
    if (!remote_connection)
    {
      v16 = @"Failed to get xpc connection from inbound dictionary";
      goto LABEL_27;
    }
  }

  if (!v7)
  {
    v7 =  -[ClientInfo initWithName:connection:]( [ClientInfo alloc],  "initWithName:connection:",  [a3 clientName],  remote_connection);
    if (!v7)
    {
      v16 = @"Failed to get client object";
LABEL_27:
      FudLog(3LL, v16);
      return 0;
    }
  }

  -[ClientInfo setIsInternalClient:](v7, "setIsInternalClient:", [a3 isInternalEvent]);
  string = xpc_dictionary_get_string([a3 data], "PluginIdentifier");
  if (string)
  {
    v11 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", string, 4LL);
    if (!-[FudStorage registerClient:withPlugin:](self->storage, "registerClient:withPlugin:", v7, v11))
    {
      v12 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Failed to register client: %@",  [a3 clientName],  v18);
LABEL_20:
      objc_super v9 = (const __CFString *)v12;
LABEL_21:
      BOOL result = 0;
      if (a4)
      {
        if (v9)
        {
          v15 = (void *)FUDError(1LL, v9);
          BOOL result = 0;
          *a4 = v15;
        }
      }

      return result;
    }
  }

  else
  {
    v13 = xpc_dictionary_get_string([a3 data], "GroupIdentifier");
    if (!v13)
    {
      objc_super v9 = @"Can't register client with NULL plugin and group identifier";
      goto LABEL_21;
    }

    v11 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v13, 4LL);
    if (!-[FudStorage registerClient:withGroup:](self->storage, "registerClient:withGroup:", v7, v11))
    {
      v12 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Failed to register client:%@ for group:%@",  [a3 clientName],  v11);
      goto LABEL_20;
    }
  }

  id v17 = [a3 clientName];
  FudLog(5LL, @"Successfully registered client '%@' for identifier '%@'");
  if (remote_connection) {
    -[ClientInfo setConnection:](v7, "setConnection:", remote_connection, v17, v11);
  }
  return 1;
}

- (BOOL)setupClientSessionWithEvent:(id)a3 error:(id *)a4
{
  if (a3)
  {
    objc_msgSend(a3, "clientName", "-[FudIpcDispatch setupClientSessionWithEvent:error:]");
    id v7 = -[FudStorage getClientWithName:](self->storage, "getClientWithName:", [a3 clientName]);
    if (v7)
    {
      v8 = v7;
      xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection([a3 data]);
      if (remote_connection)
      {
        [v8 setConnection:remote_connection];
        [v8 name];
        FudLog(7LL, @"Resuming event queue for client: %@");
        return 1;
      }

      v11 = @"Can't setup session since connection information was NULL in inbound event";
    }

    else
    {
      v11 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Can't setup session since this client '%@' isn't registered for any events",  [a3 clientName]);
    }
  }

  else
  {
    v11 = @"Can't setup connection with nil event.";
  }

  BOOL result = 0;
  if (a4)
  {
    if (v11)
    {
      v12 = (void *)FUDError(1LL, v11);
      BOOL result = 0;
      *a4 = v12;
    }
  }

  return result;
}

- (BOOL)notifyAccessoryAttachedWithEvent:(id)a3
{
  id v5 = objc_msgSend(a3, "filterName", "-[FudIpcDispatch notifyAccessoryAttachedWithEvent:]");
  if (!v5)
  {
    v19 = @"Missing filter name in attach event";
    goto LABEL_22;
  }

  id v6 = v5;
  id v7 = -[FudStorage getPolicyForFilterName:](self->storage, "getPolicyForFilterName:", v5);
  if (!v7)
  {
    v19 = @"There is no policy for the filter: %@";
    goto LABEL_22;
  }

  v8 = v7;
  id v9 = -[FudStorage getRegisteredClientsForPlugin:]( self->storage,  "getRegisteredClientsForPlugin:",  [v7 pluginName]);
  if (v9)
  {
    v10 = v9;
    if ([v9 count])
    {
      id v11 = [v8 getMatchingFilterWithName:v6];
      if (v11)
      {
        id v12 = [v11 exclusionGroup];
        if (v12)
        {
          if (-[FudIpcDispatch isStateMachineBusyInExclusionGroup:](self, "isStateMachineBusyInExclusionGroup:", v12))
          {
            FudLog(5LL, @"Dropping attach event since state machine in exclusion group (%@) is busy");
          }

          else
          {
            __int128 v23 = 0u;
            __int128 v24 = 0u;
            __int128 v21 = 0u;
            __int128 v22 = 0u;
            id v13 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
            if (v13)
            {
              id v14 = v13;
              uint64_t v15 = *(void *)v22;
              do
              {
                for (i = 0LL; i != v14; i = (char *)i + 1)
                {
                  if (*(void *)v22 != v15) {
                    objc_enumerationMutation(v10);
                  }
                  id v17 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
                  id v20 = [v17 name];
                  FudLog(7LL, @"Notifying client about attached event. client:%@ device:%@");
                  -[FudIpcDispatch sendDeviceClassAttached:toClient:]( self,  "sendDeviceClassAttached:toClient:",  v6,  v17,  v20,  v6);
                }

                id v14 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
              }

              while (v14);
            }
          }

          return 1;
        }

        v19 = @"No exclusion group in filter: %@";
      }

      else
      {
        v19 = @"No matching filter found with filter name: %@";
      }

- (BOOL)setLastRemoteFindWithEvent:(id)a3
{
  id v5 = objc_msgSend(a3, "filterName", "-[FudIpcDispatch setLastRemoteFindWithEvent:]");
  if (v5)
  {
    id v6 = v5;
    id v7 = -[FudStorage getPolicyForFilterName:](self->storage, "getPolicyForFilterName:", v5);
    if (v7)
    {
      id v8 = v7;
      id v9 = [a3 clientOptions];
      if (v9)
      {
        id v10 = [v9 objectForKey:@"LastRemoteFindDate"];
        if (v10)
        {
          -[FudStorage recordSuccessfulRemoteFindForPolicy:filter:revision:date:]( self->storage,  "recordSuccessfulRemoteFindForPolicy:filter:revision:date:",  v8,  v6,  0LL,  v10);
          return 1;
        }

        id v12 = @"Missing LAST_REMOTE_FIND_DATE parameter in SET_LAST_REMOTE_FIND event.";
      }

      else
      {
        id v12 = @"Missing options in SET_LAST_REMOTE_FIND event.";
      }
    }

    else
    {
      id v12 = @"There is no policy for the filter: %@";
    }
  }

  else
  {
    id v12 = @"Missing filter name in SET_LAST_REMOTE_FIND event.";
  }

  FudLog(3LL, v12);
  return 0;
}

- (BOOL)dispatchEvent:(id)a3
{
  if (!a3)
  {
    id v7 = @"Can't dispatch NULL event, dropping it.";
LABEL_7:
    FudLog(3LL, v7);
    return 0;
  }

  if (!objc_msgSend(a3, "type", "-[FudIpcDispatch dispatchEvent:]"))
  {
    id v7 = @"Can't dispatch command with no type.";
    goto LABEL_7;
  }

  if (self->isActive)
  {
    workQueue = (dispatch_queue_s *)self->workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100014A24;
    block[3] = &unk_1000754A8;
    block[4] = self;
    block[5] = a3;
    dispatch_group_async((dispatch_group_t)qword_10008F5A0, workQueue, block);
    return 1;
  }

  return 0;
}

- (BOOL)dispatchQueryEvent:(id)a3
{
  uint64_t v16 = 0LL;
  FudLog(7LL, @"Dispatching query event");
  if (!a3)
  {
    id v14 = @"Can't do query with nil event";
LABEL_26:
    FudLog(3LL, v14);
    return 0;
  }

  if (!objc_msgSend(a3, "data", "-[FudIpcDispatch dispatchQueryEvent:]"))
  {
    id v14 = @"Can't reply to nil data";
    goto LABEL_26;
  }

  unsigned int v5 = [a3 type];
  if ([a3 type] == 104)
  {
    if ([a3 filterName])
    {
      id v6 = -[FudStorage getStateMachineForFilterName:]( self->storage,  "getStateMachineForFilterName:",  [a3 filterName]);
      if (v6)
      {
        int64_t v7 = -[FudIpcDispatch getCommandForState:]( self,  "getCommandForState:",  [v6 nextStep:&v16]);
        id v15 = (id)v7;
        FudLog(7LL, @"Next operation is: %lld");
        id v8 = 0LL;
LABEL_9:
        BOOL v9 = 1;
        goto LABEL_12;
      }

      id v15 = [a3 filterName];
      id v10 = @"Failed to get state machine for filter:%@";
    }

    else
    {
      id v10 = @"Can't do next step query without filter name";
    }
  }

  else
  {
    if ([a3 type] == 102)
    {
      id v8 = -[NSMutableDictionary allKeys](-[FudStorage pluginToPolicy](self->storage, "pluginToPolicy"), "allKeys");
      id v15 = v8;
      FudLog(7LL, @"pluginList is: %@");
      int64_t v7 = -1LL;
      goto LABEL_9;
    }

    id v10 = @"Unknown query operation requested";
  }

  FudLog(3LL, v10);
  BOOL v9 = 0;
  id v8 = 0LL;
  int64_t v7 = -1LL;
LABEL_12:
  else {
    xpc_object_t reply = xpc_dictionary_create_reply([a3 data]);
  }
  id v12 = reply;
  if (reply)
  {
    xpc_dictionary_set_int64(reply, "Response", v5);
    if ([a3 type] == 104)
    {
      xpc_dictionary_set_int64(v12, "NextStep", v7);
      xpc_dictionary_set_BOOL(v12, "Status", v9);
    }

    else if ([a3 type] == 102)
    {
      addObjectToXpcDictionary(v12, "PluginsList", v8);
    }

    xpc_dictionary_set_string( v12,  "FilterIdentifier",  (const char *)objc_msgSend(objc_msgSend(a3, "filterName"), "cStringUsingEncoding:", 4));
    if (v16) {
      addObjectToXpcDictionary(v12, "Error", v16);
    }
    FudLog(7LL, @"Sending query response.");
    sendReplyMessageToClient(v12, [a3 data]);
    xpc_release(v12);
  }

  else
  {
    FudLog(3LL, @"Failed to create response dictionary, can't reply to client now");
  }

  return v9;
}

- (BOOL)dispatchStatelessEvent:(id)a3
{
  uint64_t v12 = 0LL;
  if (!a3)
  {
    id v6 = @"Can't dispatch NULL event, dropping it.";
LABEL_7:
    FudLog(3LL, v6);
    LOBYTE(v7) = 0;
    return v7;
  }

  if (!objc_msgSend(a3, "type", "-[FudIpcDispatch dispatchStatelessEvent:]"))
  {
    id v6 = @"Can't dispatch command with no type.";
    goto LABEL_7;
  }

  if ([a3 type] != 105)
  {
    if ([a3 type] == 106)
    {
      BOOL v5 = -[FudIpcDispatch unregisterClientWithEvent:error:](self, "unregisterClientWithEvent:error:", a3, &v12);
      goto LABEL_12;
    }

    if ([a3 type] == 107)
    {
      BOOL v5 = -[FudIpcDispatch setupClientSessionWithEvent:error:](self, "setupClientSessionWithEvent:error:", a3, &v12);
      goto LABEL_12;
    }

    if ([a3 type] == 100)
    {
      unsigned __int8 v10 = -[FudIpcDispatch notifyAccessoryAttachedWithEvent:](self, "notifyAccessoryAttachedWithEvent:", a3);
    }

    else
    {
      if ([a3 type] != 117)
      {
        LOBYTE(v7) = 0;
        goto LABEL_21;
      }

      unsigned __int8 v10 = -[FudIpcDispatch setLastRemoteFindWithEvent:](self, "setLastRemoteFindWithEvent:", a3);
    }

    LOBYTE(v7) = v10;
LABEL_21:
    [a3 sendResponse];
    return v7;
  }

  BOOL v5 = -[FudIpcDispatch registerClientWithEvent:error:](self, "registerClientWithEvent:error:", a3, &v12);
LABEL_12:
  BOOL v7 = v5;
  if ([a3 sendResponse] && objc_msgSend(a3, "data"))
  {
    id v8 = [a3 data];
    id v9 = [a3 type];
    -[FudIpcDispatch sendReplyToDictionary:forCommand:withStatus:withError:]( self,  "sendReplyToDictionary:forCommand:withStatus:withError:",  v8,  v9,  v7,  v12);
  }

  return v7;
}

- (void)addEventToQueue:(id)a3 withFilter:(id)a4 stateMachine:(id)a5
{
  if ([a4 needsMultiUpdateCheck])
  {
    id v17 = [a4 exclusionGroup];
    FudLog(5LL, @"Checking exclusion group (%@) for already queued events...");
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    queuedEvents = self->queuedEvents;
    id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( queuedEvents,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL,  v17);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v22;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(queuedEvents);
          }
          id v13 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
          id v14 = objc_msgSend(objc_msgSend(v13, "clientOptions"), "objectForKey:", @"SerialNumber");
          if (objc_msgSend( objc_msgSend(v13, "filterName"),  "isEqualToString:",  objc_msgSend(a3, "filterName"))
            && (!v14
             || objc_msgSend( v14,  "isEqualToString:",  objc_msgSend(objc_msgSend(a3, "clientOptions"), "objectForKey:", @"SerialNumber"))))
          {
            id v18 = [a3 filterName];
            FudLog(5LL, @"Dequeue duplicate connection event: %@");
            -[NSMutableArray removeObject:](self->queuedEvents, "removeObject:", v13, v18);
            goto LABEL_14;
          }
        }

        id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( queuedEvents,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
        if (v10) {
          continue;
        }
        break;
      }
    }
  }

- (BOOL)dispatchStateMachineEvent:(id)a3
{
  if (!a3)
  {
    id v18 = @"Can't dispatch NULL event, dropping it.";
LABEL_28:
    uint64_t v19 = 3LL;
    goto LABEL_29;
  }

  if (!objc_msgSend(a3, "type", "-[FudIpcDispatch dispatchStateMachineEvent:]"))
  {
    id v18 = @"Can't dispatch command with no type.";
    goto LABEL_28;
  }

  if (![a3 filterName])
  {
    id v18 = @"Can't dispatch event without filter name";
    goto LABEL_28;
  }

  id v5 = -[FudStorage getPolicyForFilterName:](self->storage, "getPolicyForFilterName:", [a3 filterName]);
  id v6 = [a3 filterName];
  if (!v5)
  {
    id v18 = @"There was no policy owning filter '%@', dropping event.";
    goto LABEL_28;
  }

  id v7 = [v5 getMatchingFilterWithName:v6];
  if (!v7)
  {
    [a3 filterName];
LABEL_46:
    id v18 = @"No filter found with name: %@";
    goto LABEL_28;
  }

  id v8 = v7;
  id v9 = -[FudStorage getStateMachineForFilterName:]( self->storage,  "getStateMachineForFilterName:",  [a3 filterName]);
  if (v9)
  {
    if ([a3 isConnectionEvent])
    {
      unsigned int v10 = -[FudStateMachine isActive](v9, "isActive");
      v28 = -[FudStateMachine stateMachinePluginName](v9, "stateMachinePluginName");
      v30 = -[FudStateMachine stateMachineFilterName](v9, "stateMachineFilterName");
      id v25 = (id)v10;
      FudLog(7LL, @"state machine exists: active=%d for [%@ : %@]");
      if (v10)
      {
        uint64_t v11 = self;
        id v12 = a3;
        id v13 = v8;
        id v14 = v9;
LABEL_22:
        -[FudIpcDispatch addEventToQueue:withFilter:stateMachine:]( v11,  "addEventToQueue:withFilter:stateMachine:",  v12,  v13,  v14,  v25,  v28);
        return 1;
      }
    }
  }

  if (!objc_msgSend(a3, "isConnectionEvent", v25, v28, v30))
  {
LABEL_15:
    if (v9)
    {
      FudLog(5LL, @"Resuming state machine...");
      -[FudStateMachine setDelegate:](v9, "setDelegate:", self);
LABEL_17:
      switch(objc_msgSend(a3, "type", v26))
      {
        case 'g':
        case 'r':
          FudLog(7LL, @"Performing next command...");
          -[FudStateMachine performNextStepWithOptions:]( v9,  "performNextStepWithOptions:",  [a3 clientOptions]);
          return 1;
        case 'l':
          FudLog(7LL, @"Performing bootstrap command...");
          id v21 = [a3 clientOptions];
          __int128 v22 = v9;
          uint64_t v23 = 2LL;
          goto LABEL_37;
        case 'm':
          FudLog(7LL, @"Performing find command...");
          id v21 = [a3 clientOptions];
          __int128 v22 = v9;
          uint64_t v23 = 4LL;
          goto LABEL_37;
        case 'n':
          FudLog(7LL, @"Performing download command...");
          id v21 = [a3 clientOptions];
          __int128 v22 = v9;
          uint64_t v23 = 7LL;
          goto LABEL_37;
        case 'o':
          FudLog(7LL, @"Performing prepare command...");
          id v21 = [a3 clientOptions];
          __int128 v22 = v9;
          uint64_t v23 = 8LL;
          goto LABEL_37;
        case 'p':
          FudLog(7LL, @"Performing apply command...");
          id v21 = [a3 clientOptions];
          __int128 v22 = v9;
          uint64_t v23 = 9LL;
          goto LABEL_37;
        case 'q':
          FudLog(7LL, @"Performing finish command...");
          id v21 = [a3 clientOptions];
          __int128 v22 = v9;
          uint64_t v23 = 10LL;
LABEL_37:
          -[FudStateMachine performStep:withOptions:](v22, "performStep:withOptions:", v23, v21);
          break;
        case 'v':
          id v27 = -[NSMutableArray count](self->queuedEvents, "count");
          FudLog(7LL, @"Performing done command... queueCount=%lu");
          -[FudStateMachine doneWithOptions:](v9, "doneWithOptions:", objc_msgSend(a3, "clientOptions", v27));
          if (!self->isActive) {
            return 0;
          }
          workQueue = (dispatch_queue_s *)self->workQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1000156C0;
          block[3] = &unk_100074F50;
          block[4] = self;
          dispatch_group_async((dispatch_group_t)qword_10008F5A0, workQueue, block);
          break;
        default:
          [a3 type];
          id v18 = @"Unrecognized state machine command: %d";
          goto LABEL_28;
      }

      return 1;
    }

    goto LABEL_20;
  }

  id v8 = objc_msgSend(v5, "getMatchingFilterWithName:", objc_msgSend(a3, "filterName"));
  id v15 = [a3 filterName];
  if (!v8) {
    goto LABEL_46;
  }
  id v31 = [v8 exclusionGroup];
  FudLog(5LL, @"%s - filter name: %@ - exclusion group - %@");
  if (!-[FudIpcDispatch isStateMachineBusyInExclusionGroup:]( self,  "isStateMachineBusyInExclusionGroup:",  objc_msgSend(v8, "exclusionGroup", "-[FudIpcDispatch dispatchStateMachineEvent:]", v15, v31)))
  {
    FudLog(5LL, @"Clearing state for new event stream...");
    -[FudStorage setStateMachine:forPlugin:forFilter:]( self->storage,  "setStateMachine:forPlugin:forFilter:",  0,  [v5 pluginName],  objc_msgSend(a3, "filterName"));
LABEL_20:
    if (-[FudStorage isAnyStateMachineActiveForPlugin:]( self->storage,  "isAnyStateMachineActiveForPlugin:",  [v5 pluginName]))
    {
      id v25 = [v5 pluginName];
      v28 = (NSString *)[a3 filterName];
      FudLog(5LL, @"Active FW update detected for service %@, queue up %@");
      uint64_t v11 = self;
      id v12 = a3;
      id v13 = v8;
      id v14 = 0LL;
      goto LABEL_22;
    }

    FudLog(5LL, @"Creating new state machine for event: %@");
    id v16 = -[FudStateMachine initWithPluginName:filterName:delegate:options:]( [FudStateMachine alloc],  "initWithPluginName:filterName:delegate:options:",  objc_msgSend(v5, "pluginName", a3),  objc_msgSend(a3, "filterName"),  self,  objc_msgSend(a3, "clientOptions"));
    if (v16)
    {
      id v9 = v16;
      -[FudStateMachine setAccessory:](v16, "setAccessory:", [a3 accessory]);
      id v29 = [a3 accessory];
      FudLog(6LL, @"Set acc for statemachine %@ %@");
      id v17 = v9;
      if (!-[FudStorage setStateMachine:forPlugin:forFilter:]( self->storage,  "setStateMachine:forPlugin:forFilter:",  v9,  objc_msgSend(v5, "pluginName", v9, v29),  objc_msgSend(a3, "filterName")))
      {
        id v26 = [a3 filterName];
        FudLog(3LL, @"Failed to set state machine for filter: %@");
      }

      goto LABEL_17;
    }

    [v5 pluginName];
    id v18 = @"Failed to create stame machine for plugin: %@";
    goto LABEL_28;
  }

  if ([v8 needsMultiUpdateCheck])
  {
    -[FudIpcDispatch addEventToQueue:withFilter:stateMachine:]( self,  "addEventToQueue:withFilter:stateMachine:",  a3,  v8,  v9);
    goto LABEL_15;
  }

  [v8 exclusionGroup];
  id v18 = @"State machine in exclusion group (%@) is busy, dropping stream event...";
  uint64_t v19 = 5LL;
LABEL_29:
  FudLog(v19, v18);
  return 0;
}

- (BOOL)isStateMachineForFilterAcceptingNewStreamEvents:(id)a3
{
  if (a3) {
    return -[NSMutableDictionary objectForKey:]( self->eventFlags,  "objectForKey:",  a3,  "-[FudIpcDispatch isStateMachineForFilterAcceptingNewStreamEvents:]") == 0LL;
  }
  FudLog(3LL, @"Missing filter name in state machine!");
  return 1;
}

- (BOOL)isStateMachineAcceptingNewStreamEvents:(id)a3
{
  return -[FudIpcDispatch isStateMachineForFilterAcceptingNewStreamEvents:]( self,  "isStateMachineForFilterAcceptingNewStreamEvents:",  objc_msgSend(a3, "stateMachineFilterName", "-[FudIpcDispatch isStateMachineAcceptingNewStreamEvents:]"));
}

- (BOOL)isStateMachineBusyInExclusionGroup:(id)a3
{
  if (!a3)
  {
    id v12 = @"No exclusion group";
LABEL_18:
    FudLog(3LL, v12);
    LOBYTE(v7) = 0;
    return (char)v7;
  }

  id v5 = -[FudStorage getFiltersInExclusionGroup:]( self->storage,  "getFiltersInExclusionGroup:",  a3,  "-[FudIpcDispatch isStateMachineBusyInExclusionGroup:]");
  if (!v5)
  {
    id v12 = @"No set of exclusion groups found for group: %@";
    goto LABEL_18;
  }

  id v6 = v5;
  if (![v5 count])
  {
    id v12 = @"Empty set of exclusion groups found for group: %@";
    goto LABEL_18;
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      unsigned int v10 = 0LL;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)v10);
        id v14 = [v11 filterName];
        FudLog(5LL, @"ExclusionGroupFilter: %@ (%@)");
        if (!-[FudIpcDispatch isStateMachineForFilterAcceptingNewStreamEvents:]( self,  "isStateMachineForFilterAcceptingNewStreamEvents:",  objc_msgSend(v11, "filterName", v14, a3)))
        {
          LOBYTE(v7) = 1;
          return (char)v7;
        }

        unsigned int v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      id v8 = v7;
      if (v7) {
        continue;
      }
      break;
    }
  }

  return (char)v7;
}

- (void)disableStreamEventsForStateMachine:(id)a3
{
  id v5 = objc_msgSend(a3, "stateMachineFilterName", "-[FudIpcDispatch disableStreamEventsForStateMachine:]");
  if (v5) {
    -[NSMutableDictionary setObject:forKey:]( self->eventFlags,  "setObject:forKey:",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL),  v5);
  }
  else {
    FudLog(3LL, @"Can't disable stream events since state machine has no filter!");
  }
}

- (void)enableStreamEventsForStateMachine:(id)a3
{
  id v5 = objc_msgSend(a3, "stateMachineFilterName", "-[FudIpcDispatch enableStreamEventsForStateMachine:]");
  if (v5)
  {
    id v6 = v5;
    if (-[NSMutableDictionary objectForKey:](self->eventFlags, "objectForKey:", v5)) {
      -[NSMutableDictionary removeObjectForKey:](self->eventFlags, "removeObjectForKey:", v6);
    }
  }

  else
  {
    FudLog(3LL, @"Can't disable stream events since state machine has no filter!");
  }

- (BOOL)shouldBlockCriticalSectionDuringStep:(int)a3
{
  return (a3 & 0xFFFFFFFE) == 8;
}

- (BOOL)shouldUnblockCriticalSectionAfterStep:(int)a3 wasSuccessful:(BOOL)a4
{
  return (a3 & 0xFFFFFFFE) == 8;
}

- (void)aquireCriticalSectionLock
{
}

- (void)releaseCriticalSectionLock
{
}

- (BOOL)sendDeviceClassAttached:(id)a3 toClient:(id)a4
{
  if (!a3)
  {
    unsigned int v10 = @"Can't send attached event without device class";
LABEL_11:
    FudLog(3LL, v10);
    LOBYTE(a4) = 0;
    return (char)a4;
  }

  if (!a4)
  {
    FudLog(3LL, @"Can't send attached event without client");
    return (char)a4;
  }

  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v6)
  {
    unsigned int v10 = @"Failed to allocate xpc dictionary for attached event";
    goto LABEL_11;
  }

  id v7 = v6;
  xpc_dictionary_set_int64(v6, "Response", 100LL);
  id v8 = (const char *)objc_msgSend( a3,  "cStringUsingEncoding:",  4,  "-[FudIpcDispatch sendDeviceClassAttached:toClient:]");
  if (v8)
  {
    xpc_dictionary_set_string(v7, "FilterIdentifier", v8);
    LOBYTE(a4) = [a4 sendMessage:v7];
  }

  else
  {
    FudLog(3LL, @"Failed to get device class C string");
    LOBYTE(a4) = 0;
  }

  xpc_release(v7);
  return (char)a4;
}

- (BOOL)sendReplyToDictionary:(id)a3 forCommand:(int)a4 withStatus:(BOOL)a5 withError:(id)a6
{
  if (!a3)
  {
    id v13 = @"Can't reply to NULL dictionary";
LABEL_11:
    FudLog(3LL, v13);
    return 0;
  }

  if (xpc_dictionary_get_BOOL(a3, "InternalClient")) {
    xpc_object_t reply = xpc_dictionary_create(0LL, 0LL, 0LL);
  }
  else {
    xpc_object_t reply = xpc_dictionary_create_reply(a3);
  }
  uint64_t v11 = reply;
  if (!reply)
  {
    id v13 = @"Failed to create reply dictionary from inbound dict";
    goto LABEL_11;
  }

  xpc_dictionary_set_int64(reply, "Response", a4);
  xpc_dictionary_set_BOOL(v11, "Status", a5);
  if (a6) {
    addObjectToXpcDictionary(v11, "Error", a6);
  }
  sendReplyMessageToClient(v11, a3);
  xpc_release(v11);
  return 1;
}

- (int)getCommandForState:(int)a3
{
  int v3 = a3 - 1;
  FudLog(3LL, @"Unknown state for value:%d");
  return 0;
}

- (id)getPluginWithName:(id)a3 forFilter:(id)a4 delegate:(id)a5 info:(id *)a6 options:(id)a7
{
  uint64_t v19 = 0LL;
  if (!a3 || !a4)
  {
    __int128 v16 = @"Can't load plugin with invalid filter name: %@ plugin name: %@";
LABEL_12:
    FudLog(3LL, v16);
LABEL_13:
    FudLog(3LL, @"Failed to acquire plugin");
    return 0LL;
  }

  id v12 = +[FudUtilities getURLForServiceIdentifier:]( &OBJC_CLASS___FudUtilities,  "getURLForServiceIdentifier:",  a3,  "-[FudIpcDispatch getPluginWithName:forFilter:delegate:info:options:]");
  if (!v12)
  {
    __int128 v16 = @"There is no plugin bundle for: %@";
    goto LABEL_12;
  }

  id v13 = +[FudUtilities copyPluginAtURL:forFilter:delegate:info:options:bundleVersion:]( &OBJC_CLASS___FudUtilities,  "copyPluginAtURL:forFilter:delegate:info:options:bundleVersion:",  v12,  a4,  a5,  a6,  a7,  &v19);
  if (!v13)
  {
    [0 setDelegate:a5];
    goto LABEL_13;
  }

  id v14 = v13;
  id v15 = v13;
  [v14 setDelegate:a5];
  if (a6 && *a6 && [*a6 objectForKey:@"AccessoryIdentifier"]) {
    a4 = [*a6 objectForKey:@"AccessoryIdentifier"];
  }
  v20[0] = @"pluginName";
  v20[1] = @"modelName";
  v21[0] = a3;
  v21[1] = a4;
  __int128 v18 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL);
  FudLog(7LL, @"CoreAnalytics event: %@\neventDict: %@");
  AnalyticsSendEvent(@"com.apple.fud.updateTriggered", v18);
  return v14;
}

- (id)getStorage
{
  return self->storage;
}

- (void)stepWillBegin:(int)a3 stateMachine:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  FudLog(7LL, @"Entering: %s");
  if (-[FudIpcDispatch shouldBlockCriticalSectionDuringStep:]( self,  "shouldBlockCriticalSectionDuringStep:",  v5,  "-[FudIpcDispatch stepWillBegin:stateMachine:]"))
  {
    -[FudIpcDispatch aquireCriticalSectionLock](self, "aquireCriticalSectionLock");
  }

  if (self->isActive)
  {
    workQueue = (dispatch_queue_s *)self->workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000160DC;
    block[3] = &unk_1000756F8;
    int v9 = v5;
    block[4] = a4;
    void block[5] = self;
    dispatch_sync(workQueue, block);
  }

- (void)queueUpEventForAccessory:(id)a3 stateMachine:(id)a4
{
  workQueue = (dispatch_queue_s *)self->workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000161E0;
  block[3] = &unk_1000754F8;
  block[4] = a4;
  void block[5] = a3;
  void block[6] = self;
  dispatch_sync(workQueue, block);
}

- (void)stepComplete:(int)a3 stateMachine:(id)a4 status:(BOOL)a5 error:(id)a6 info:(id)a7
{
  FudLog(3LL, @"FudIPCDispatch: stepComplete():  plugin:%@ status:%d info=%@");
  if (self->isActive)
  {
    workQueue = (dispatch_queue_s *)self->workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000163D4;
    block[3] = &unk_100075720;
    int v15 = a3;
    block[4] = a4;
    void block[5] = self;
    BOOL v16 = a5;
    void block[6] = a7;
    void block[7] = a6;
    dispatch_sync(workQueue, block);
  }

- (void)stepProgress:(int)a3 stateMachine:(id)a4 progress:(double)a5 overallProgress:(double)a6
{
  if (self->isActive)
  {
    workQueue = (dispatch_queue_s *)self->workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000169FC;
    block[3] = &unk_100075748;
    int v13 = a3;
    block[4] = a4;
    void block[5] = self;
    *(double *)&void block[6] = a5;
    *(double *)&void block[7] = a6;
    dispatch_sync(workQueue, block);
  }

- (void)accessoryDisconnected:(id)a3 error:(id)a4
{
  if (self->isActive)
  {
    workQueue = (dispatch_queue_s *)self->workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100016E14;
    block[3] = &unk_1000754F8;
    block[4] = a3;
    void block[5] = self;
    void block[6] = a4;
    dispatch_sync(workQueue, block);
  }

- (void)dealloc
{
  workQueue = (dispatch_queue_s *)self->workQueue;
  if (workQueue)
  {
    self->isActive = 0;
    dispatch_sync(workQueue, &stru_100075768);
    dispatch_release((dispatch_object_t)self->workQueue);
  }

  storage = self->storage;
  if (storage) {

  }
  eventFlags = self->eventFlags;
  if (eventFlags) {

  }
  queuedEvents = self->queuedEvents;
  if (queuedEvents) {

  }
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___FudIpcDispatch;
  -[FudIpcDispatch dealloc](&v7, "dealloc");
}

- (void)issueNotification:(id)a3 request:(id)a4
{
  if (self->isActive)
  {
    id v7 = a4;
    workQueue = (dispatch_queue_s *)self->workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100017190;
    block[3] = &unk_1000754F8;
    block[4] = a3;
    void block[5] = self;
    void block[6] = v7;
    dispatch_sync(workQueue, block);
  }

- (OS_dispatch_queue)workQueue
{
  return self->workQueue;
}

@end
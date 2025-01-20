@interface RPStatusDaemon
+ (id)sharedStatusDaemon;
- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5;
- (BOOL)diagnosticCommand:(id)a3 params:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)removeXPCMatchingToken:(unint64_t)a3;
- (OS_dispatch_queue)dispatchQueue;
- (RPMessageable)messenger;
- (RPStatusDaemon)init;
- (id)descriptionWithLevel:(int)a3;
- (void)_activate;
- (void)_invalidate;
- (void)_invalidated;
- (void)_xpcConnectionInvalidated:(id)a3;
- (void)activate;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setMessenger:(id)a3;
@end

@implementation RPStatusDaemon

+ (id)sharedStatusDaemon
{
  if (qword_100133690 != -1) {
    dispatch_once(&qword_100133690, &stru_100114E90);
  }
  return (id)qword_100133688;
}

- (RPStatusDaemon)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RPStatusDaemon;
  v2 = -[RPStatusDaemon init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v4 = v3;
  }

  return v3;
}

- (id)descriptionWithLevel:(int)a3
{
  if (a3 < 21)
  {
    id v38 = 0LL;
    NSAppendPrintF(&v38, "-- RPStatusDaemon --\n");
    id v7 = v38;
    if (a3 >= 11) {
      uint64_t v8 = 50LL;
    }
    else {
      uint64_t v8 = 30LL;
    }
    id v9 = -[NSMutableSet count](self->_xpcConnections, "count");
    if (v9)
    {
      id v37 = v7;
      NSAppendPrintF(&v37, "%d XPC Cnx\n", (_DWORD)v9);
      id v10 = v37;

      id v7 = v10;
    }

    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    obj = self->_xpcConnections;
    id v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v33,  v39,  16LL);
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v34;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v34 != v13) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
          id v32 = v7;
          v16 = (void *)objc_claimAutoreleasedReturnValue([v15 xpcCnx]);
          NSAppendPrintF(&v32, "    %#{pid}", [v16 processIdentifier]);
          id v17 = v32;

          uint64_t v18 = objc_claimAutoreleasedReturnValue([v15 subscriber]);
          v19 = (void *)v18;
          if (v18)
          {
            id v31 = v17;
            uint64_t v20 = CUDescriptionWithLevel(v18, v8);
            v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
            NSAppendPrintF(&v31, ", %@", v21);
            id v22 = v31;

            id v17 = v22;
          }

          uint64_t v23 = objc_claimAutoreleasedReturnValue([v15 provider]);
          v24 = (void *)v23;
          if (v23)
          {
            id v30 = v17;
            uint64_t v25 = CUDescriptionWithLevel(v23, v8);
            v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
            NSAppendPrintF(&v30, ", %@", v26);
            id v27 = v30;

            id v17 = v27;
          }

          id v29 = v17;
          NSAppendPrintF(&v29, "\n");
          id v7 = v29;
        }

        id v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v33,  v39,  16LL);
      }

      while (v12);
    }

    return v7;
  }

  else
  {
    uint64_t v4 = NSPrintF("RPPeopleDaemon %{ptr}", a2, self);
    return (id)objc_claimAutoreleasedReturnValue(v4);
  }

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000AA6F4;
  block[3] = &unk_1001110A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  if (!self->_xpcListener)
  {
    v3 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.rapport.StatusUpdates");
    xpcListener = self->_xpcListener;
    self->_xpcListener = v3;

    -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
    -[NSXPCListener _setQueue:](self->_xpcListener, "_setQueue:", self->_dispatchQueue);
    -[NSXPCListener resume](self->_xpcListener, "resume");
  }

  if (!self->_messenger)
  {
    v5 = (RPMessageable *)objc_claimAutoreleasedReturnValue( +[RPCompanionLinkDaemon sharedCompanionLinkDaemon]( &OBJC_CLASS___RPCompanionLinkDaemon,  "sharedCompanionLinkDaemon"));
    messenger = self->_messenger;
    self->_messenger = v5;

    uint64_t v8 = @"statusFlags";
    id v9 = &off_10011B0C0;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
    -[RPMessageable registerEventID:options:handler:]( self->_messenger,  "registerEventID:options:handler:",  @"_statusInfo",  v7,  &stru_100114ED0);
  }

  -[RPStatusDaemon prefsChanged](self, "prefsChanged");
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000AA958;
  block[3] = &unk_1001110A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_100132D20 <= 30
      && (dword_100132D20 != -1 || _LogCategory_Initialize(&dword_100132D20, 30LL)))
    {
      LogPrintF(&dword_100132D20, "-[RPStatusDaemon _invalidate]", 30LL, "Invalidating\n");
    }

    -[RPMessageable deregisterEventID:](self->_messenger, "deregisterEventID:", @"_statusInfo");
    -[NSXPCListener invalidate](self->_xpcListener, "invalidate");
    xpcListener = self->_xpcListener;
    self->_xpcListener = 0LL;

    -[RPStatusDaemon _invalidated](self, "_invalidated");
  }

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    self->_invalidateDone = 1;
    if (dword_100132D20 <= 30
      && (dword_100132D20 != -1 || _LogCategory_Initialize(&dword_100132D20, 30LL)))
    {
      LogPrintF(&dword_100132D20, "-[RPStatusDaemon _invalidated]", 30LL, "Invalidated\n");
    }
  }

- (BOOL)diagnosticCommand:(id)a3 params:(id)a4
{
  return 0;
}

- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5
{
  return 0;
}

- (BOOL)removeXPCMatchingToken:(unint64_t)a3
{
  return 0;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  objc_super v6 = -[RPStatusUpdatableXPCConnection initWithDaemon:xpcCnx:]( objc_alloc(&OBJC_CLASS___RPStatusUpdatableXPCConnection),  "initWithDaemon:xpcCnx:",  self,  v5);
  -[RPStatusUpdatableXPCConnection setDispatchQueue:](v6, "setDispatchQueue:", self->_dispatchQueue);
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    id v9 = self->_xpcConnections;
    self->_xpcConnections = v8;

    xpcConnections = self->_xpcConnections;
  }

  -[NSMutableSet addObject:](xpcConnections, "addObject:", v6);
  id v10 = self->_xpcClientInterface;
  if (!v10)
  {
    v74 = objc_alloc(&OBJC_CLASS___NSSet);
    uint64_t v72 = objc_opt_class(&OBJC_CLASS___NSArray, v11, v12);
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary, v13, v14);
    uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSData, v16, v17);
    uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSDate, v19, v20);
    uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSNull, v22, v23);
    uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSNumber, v25, v26);
    uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSString, v28, v29);
    __int128 v33 = -[NSSet initWithObjects:]( v74,  "initWithObjects:",  v72,  v15,  v18,  v21,  v24,  v27,  v30,  objc_opt_class(&OBJC_CLASS___NSUUID, v31, v32),  0LL);
    id v10 = (NSXPCInterface *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___RPStatusUpdatableXPCClientInterface));
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v10,  "setClasses:forSelector:argumentIndex:ofReply:",  v33,  "xpcStatusUpdatableGiveStatusUpdate:peerDevice:currentState:statusInfo:",  1LL,  0LL);
    objc_storeStrong((id *)&self->_xpcClientInterface, v10);
  }

  __int128 v34 = self->_xpcDaemonInterface;
  if (!v34)
  {
    v75 = objc_alloc(&OBJC_CLASS___NSSet);
    uint64_t v73 = objc_opt_class(&OBJC_CLASS___NSArray, v35, v36);
    uint64_t v71 = objc_opt_class(&OBJC_CLASS___NSDictionary, v37, v38);
    uint64_t v41 = objc_opt_class(&OBJC_CLASS___NSData, v39, v40);
    uint64_t v44 = objc_opt_class(&OBJC_CLASS___NSDate, v42, v43);
    uint64_t v47 = objc_opt_class(&OBJC_CLASS___NSNull, v45, v46);
    uint64_t v50 = objc_opt_class(&OBJC_CLASS___NSNumber, v48, v49);
    uint64_t v53 = objc_opt_class(&OBJC_CLASS___NSString, v51, v52);
    v56 = -[NSSet initWithObjects:]( v75,  "initWithObjects:",  v73,  v71,  v41,  v44,  v47,  v50,  v53,  objc_opt_class(&OBJC_CLASS___NSUUID, v54, v55),  0LL);
    v57 = objc_alloc(&OBJC_CLASS___NSSet);
    uint64_t v60 = objc_opt_class(&OBJC_CLASS___NSArray, v58, v59);
    v63 = -[NSSet initWithObjects:]( v57,  "initWithObjects:",  v60,  objc_opt_class(&OBJC_CLASS___RPStatusDevice, v61, v62),  0LL);
    __int128 v34 = (NSXPCInterface *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___RPStatusUpdatableXPCDaemonInterface));
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v34,  "setClasses:forSelector:argumentIndex:ofReply:",  v63,  "xpcStatusSubscriberActivate:completion:",  0LL,  1LL);
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v34,  "setClasses:forSelector:argumentIndex:ofReply:",  v63,  "xpcStatusProviderActivate:completion:",  0LL,  1LL);
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v34,  "setClasses:forSelector:argumentIndex:ofReply:",  v56,  "xpcStatusUpdatableProvideStatus:statusInfo:",  0LL,  0LL);
    -[NSXPCInterface setClass:forSelector:argumentIndex:ofReply:]( v34,  "setClass:forSelector:argumentIndex:ofReply:",  objc_opt_class(&OBJC_CLASS___NSString, v64, v65),  "xpcStatusUpdatableCancelProvideStatus:",  0LL,  0LL);
    -[NSXPCInterface setClass:forSelector:argumentIndex:ofReply:]( v34,  "setClass:forSelector:argumentIndex:ofReply:",  objc_opt_class(&OBJC_CLASS___NSString, v66, v67),  "xpcStatusUpdatableSubscribeToStatus:",  0LL,  0LL);
    -[NSXPCInterface setClass:forSelector:argumentIndex:ofReply:]( v34,  "setClass:forSelector:argumentIndex:ofReply:",  objc_opt_class(&OBJC_CLASS___NSString, v68, v69),  "xpcStatusUpdatableUnsubscribeToStatus:",  0LL,  0LL);
    objc_storeStrong((id *)&self->_xpcDaemonInterface, v34);
  }

  [v5 setExportedInterface:v34];
  [v5 setExportedObject:v6];
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472LL;
  v76[2] = sub_1000AAF50;
  v76[3] = &unk_100111968;
  v76[4] = self;
  v76[5] = v6;
  [v5 setInvalidationHandler:v76];
  [v5 setRemoteObjectInterface:v10];
  [v5 _setQueue:self->_dispatchQueue];
  [v5 resume];
  if (dword_100132D20 <= 20 && (dword_100132D20 != -1 || _LogCategory_Initialize(&dword_100132D20, 20LL))) {
    LogPrintF( &dword_100132D20,  "-[RPStatusDaemon listener:shouldAcceptNewConnection:]",  20,  "XPC connection started from %#{pid}\n",  [v5 processIdentifier]);
  }

  return 1;
}

- (void)_xpcConnectionInvalidated:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  [v5 connectionInvalidated];
  -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v5);

  -[RPStatusDaemon _update](self, "_update");
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (RPMessageable)messenger
{
  return self->_messenger;
}

- (void)setMessenger:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
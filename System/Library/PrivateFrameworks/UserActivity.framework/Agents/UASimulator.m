@interface UASimulator
+ (UASimulator)simulatorWithController:(id)a3 pairedPort:(unsigned int)a4 childSimPid:(int)a5 childVersion:(unint64_t)a6;
+ (UASimulator)simulatorWithController:(id)a3 parentSimulatorPortName:(id)a4;
- (BOOL)active;
- (BOOL)activitiesShouldCrossover;
- (BOOL)reconnectToParentSimulator;
- (BOOL)resume;
- (BOOL)suspend;
- (BOOL)terminate;
- (NSSet)notifiedItems;
- (NSString)bootstrapName;
- (OS_dispatch_queue)dispatchQ;
- (SFPeerDevice)ourDevice;
- (SFPeerDevice)peeredDevice;
- (UASimulator)initWithController:(id)a3;
- (UASimulatorAdvertisementCreator)creator;
- (UASimulatorAdvertiser)advertiser;
- (UASimulatorController)controller;
- (UASimulatorReceiver)receiver;
- (id)statusString;
- (unsigned)commandPort;
- (unsigned)pairedClientPort;
- (void)dealloc;
- (void)setNotifiedItems:(id)a3;
- (void)setOurDevice:(id)a3;
- (void)setPeeredDevice:(id)a3;
- (void)setSimulatorInFront:(BOOL)a3;
@end

@implementation UASimulator

- (UASimulator)initWithController:(id)a3
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 manager]);
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___UASimulator;
  v7 = -[UACornerActionManagerHandler initWithManager:name:](&v34, "initWithManager:name:", v6, @"SimController");

  if (v7)
  {
    objc_storeStrong((id *)&v7->_controller, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[SFPeerDevice peerForSelf](&OBJC_CLASS___SFPeerDevice, "peerForSelf"));
    ourDevice = v7->_ourDevice;
    v7->_ourDevice = (SFPeerDevice *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("simQ", 0LL);
    dispatchQ = v7->_dispatchQ;
    v7->_dispatchQ = (OS_dispatch_queue *)v10;

    if (!mach_port_allocate(mach_task_self_, 1u, &v7->_commandPort))
    {
      sub_10006CDF8(-[UASimulator commandPort](v7, "commandPort"), v7);
      uintptr_t v12 = -[UASimulator commandPort](v7, "commandPort");
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      dispatch_source_t v15 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_mach_recv, v12, 0LL, v14);

      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_10006CEC8;
      handler[3] = &unk_1000BCD38;
      v16 = v7;
      v32 = v16;
      dispatch_source_t v33 = v15;
      v17 = v15;
      dispatch_source_set_event_handler(v17, handler);
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_10006CFBC;
      v29[3] = &unk_1000BCCA8;
      v30 = v16;
      dispatch_source_set_cancel_handler(v17, v29);
      dispatch_resume(v17);
    }

    v18 = -[UASimulatorAdvertiser initWithSimulator:]( objc_alloc(&OBJC_CLASS___UASimulatorAdvertiser),  "initWithSimulator:",  v7);
    advertiser = v7->_advertiser;
    v7->_advertiser = v18;

    v20 = -[UASimulatorReceiver initWithSimulator:]( objc_alloc(&OBJC_CLASS___UASimulatorReceiver),  "initWithSimulator:",  v7);
    receiver = v7->_receiver;
    v7->_receiver = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulator controller](v7, "controller"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 manager]);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulator advertiser](v7, "advertiser"));
    [v23 addAdvertiser:v24];

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulator controller](v7, "controller"));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 manager]);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulator receiver](v7, "receiver"));
    [v26 addReceiver:v27];
  }

  return v7;
}

+ (UASimulator)simulatorWithController:(id)a3 pairedPort:(unsigned int)a4 childSimPid:(int)a5 childVersion:(unint64_t)a6
{
  return 0LL;
}

+ (UASimulator)simulatorWithController:(id)a3 parentSimulatorPortName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_log_t v8 = sub_100039584(0LL);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    id v19 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "SIMULATOR: Creating UASimulator to talk to real useractivityd in OSX, portName=%{public}@",  buf,  0xCu);
  }

  id v10 = [objc_alloc((Class)objc_opt_class(a1)) initWithController:v6];
  v11 = (int *)v10;
  if (v10)
  {
    objc_storeStrong((id *)v10 + 16, a4);
    id v12 = objc_claimAutoreleasedReturnValue([v11 bootstrapName]);
    v13 = (const char *)[v12 cStringUsingEncoding:4];
    v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 dispatchQ]);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10006D2B8;
    handler[3] = &unk_1000BD0D8;
    v17 = v11;
    notify_register_dispatch(v13, v11 + 13, v14, handler);
  }

  return (UASimulator *)v11;
}

- (void)dealloc
{
  mach_port_name_t pairedClientPort = self->_pairedClientPort;
  if (pairedClientPort) {
    mach_port_mod_refs(mach_task_self_, pairedClientPort, 0, -1);
  }
  int notifyToken = self->_notifyToken;
  if (notifyToken) {
    notify_cancel(notifyToken);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___UASimulator;
  -[UASimulator dealloc](&v5, "dealloc");
}

- (BOOL)reconnectToParentSimulator
{
  os_log_t v3 = sub_100039584(0LL);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "SIMULATOR: Looking up parent port in order to talk to useractivity in OSX",  buf,  2u);
  }

  int v43 = 0;
  uint64_t v5 = bootstrap_port;
  id v6 = objc_claimAutoreleasedReturnValue(-[UASimulator bootstrapName](self, "bootstrapName"));
  LODWORD(v5) = bootstrap_look_up2(v5, [v6 cStringUsingEncoding:4], &v43, 0, 0);

  if ((_DWORD)v5) {
    return 0;
  }
  os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler uuid](self, "uuid"));
  [v8 getUUIDBytes:&v50];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulator ourDevice](self, "ourDevice"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v9,  1LL,  0LL));

  uint64_t v41 = 0LL;
  uint64_t v42 = 0LL;
  v11 = self;
  objc_sync_enter(v11);
  uint64_t v40 = 0LL;
  LODWORD(v9) = v43;
  int v12 = -[UASimulator commandPort](v11, "commandPort");
  id v13 = v10;
  int v14 = sub_1000767E8( (mach_port_t)v9,  &v50,  v12,  (uint64_t)[v13 bytes],  (int)objc_msgSend(v13, "length"),  2,  &v41,  &v42,  (_DWORD *)&v41 + 1,  &v40);
  os_log_t v15 = sub_100039584(0LL);
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v45 = v14;
    __int16 v46 = 2048;
    uint64_t v47 = v40;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "UASimRegisterWithParentWithVersion()=%ld parentVersion=%ld",  buf,  0x16u);
  }

  BOOL v7 = v14 == 0;
  if (!v14)
  {
    v17 = objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v42, HIDWORD(v41)));
    id v19 = -[NSKeyedUnarchiver initForReadingFromData:error:](v17, "initForReadingFromData:error:", v18, 0LL);

    if (HIDWORD(v41))
    {
      id v20 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v19,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___SFPeerDevice),  NSKeyedArchiveRootObjectKey);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      if (v21)
      {
        os_log_t v22 = sub_100039584(0LL);
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138477827;
          unint64_t v45 = (unint64_t)v21;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "SIMULATOR: Changing peer device info to %{private}@",  buf,  0xCu);
        }

        -[UASimulator setPeeredDevice:](v11, "setPeeredDevice:", v21);
      }

      -[NSKeyedUnarchiver finishDecoding](v19, "finishDecoding");
    }

    os_log_t v24 = sub_100039584(0LL);
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v26 = -[UASimulator commandPort](v11, "commandPort");
      uint64_t v27 = v41;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulator peeredDevice](v11, "peeredDevice"));
      *(_DWORD *)buf = 134218498;
      unint64_t v45 = v26;
      __int16 v46 = 2048;
      uint64_t v47 = v27;
      __int16 v48 = 2114;
      v49 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "SIMULATOR: Paired with parent simulator, commandPort=%ld pairedPort=%ld pairedPeer=%{public}@",  buf,  0x20u);
    }

    uintptr_t v29 = v41;
    v11->_mach_port_name_t pairedClientPort = v41;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulator controller](v11, "controller"));
    v31 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v30 dispatchQ]);
    dispatch_source_t v32 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_mach_send, v29, 1uLL, v31);

    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10006D938;
    handler[3] = &unk_1000BE0E0;
    int v39 = v41;
    void handler[4] = v11;
    dispatch_source_t v38 = v32;
    dispatch_source_t v33 = v32;
    dispatch_source_set_event_handler(v33, handler);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_10006DB48;
    v35[3] = &unk_1000BE100;
    int v36 = v41;
    dispatch_source_set_cancel_handler(v33, v35);
    dispatch_resume(v33);
  }

  objc_sync_exit(v11);

  return v7;
}

- (unsigned)pairedClientPort
{
  return self->_pairedClientPort;
}

- (NSSet)notifiedItems
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = -[NSMutableSet copy](v2->_notifiedItems, "copy");
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (void)setNotifiedItems:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  -[NSMutableSet removeAllObjects](v5->_notifiedItems, "removeAllObjects");
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8LL * (void)v9);
        uint64_t v11 = objc_opt_class(&OBJC_CLASS___UASimulatorSuggestedItem);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0) {
          -[NSMutableSet addObject:](v5->_notifiedItems, "addObject:", v10, (void)v12);
        }
        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  objc_sync_exit(v5);
}

- (BOOL)active
{
  unsigned int v3 = -[UASimulator commandPort](self, "commandPort");
  if (v3) {
    LOBYTE(v3) = self->_pairedClientPort != 0;
  }
  return v3;
}

- (void)setSimulatorInFront:(BOOL)a3
{
  BOOL v3 = a3;
  os_log_t v5 = sub_100039584(0LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"not in front";
    if (v3) {
      id v7 = @"IN FRONT";
    }
    int v12 = 138543362;
    __int128 v13 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "SIMULATOR: Simulator application is %{public}@",  (uint8_t *)&v12,  0xCu);
  }

  self->_activitiesShouldCrossover = v3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulator controller](self, "controller"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 manager]);
  [v9 scheduleUpdatingAdvertisableItems];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulator controller](self, "controller"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 manager]);
  [v11 scheduleBestAppDetermination];
}

- (BOOL)resume
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___UASimulator;
  BOOL v3 = -[UACornerActionManagerHandler resume](&v8, "resume");
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulator advertiser](self, "advertiser"));
    [v4 resume];

    os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulator receiver](self, "receiver"));
    [v5 resume];

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulator creator](self, "creator"));
    [v6 resume];
  }

  return v3;
}

- (BOOL)suspend
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___UASimulator;
  BOOL v3 = -[UACornerActionManagerHandler suspend](&v8, "suspend");
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulator advertiser](self, "advertiser"));
    [v4 suspend];

    os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulator receiver](self, "receiver"));
    [v5 suspend];

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulator creator](self, "creator"));
    [v6 suspend];
  }

  return v3;
}

- (BOOL)terminate
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___UASimulator;
  BOOL v3 = -[UACornerActionManagerHandler terminate](&v17, "terminate");
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulator advertiser](self, "advertiser"));
    [v4 terminate];

    os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulator receiver](self, "receiver"));
    [v5 terminate];

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulator creator](self, "creator"));
    [v6 terminate];

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulator controller](self, "controller"));
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v7 manager]);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulator advertiser](self, "advertiser"));
    [v8 removeAdvertiser:v9];

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulator controller](self, "controller"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 manager]);
    int v12 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulator receiver](self, "receiver"));
    [v11 removeReceiver:v12];

    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulator controller](self, "controller"));
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 manager]);
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulator creator](self, "creator"));
    [v14 removeClient:v15];

    mach_port_mod_refs(mach_task_self_, -[UASimulator commandPort](self, "commandPort"), 1u, -1);
    mach_port_mod_refs(mach_task_self_, self->_pairedClientPort, 0, -1);
    self->_commandPort = 0;
    self->_mach_port_name_t pairedClientPort = 0;
  }

  return v3;
}

- (id)statusString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulator peeredDevice](self, "peeredDevice"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 name]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" - SIMULATOR:%@",  v3));

  return v4;
}

- (UASimulatorController)controller
{
  return (UASimulatorController *)objc_getProperty(self, a2, 72LL, 1);
}

- (SFPeerDevice)ourDevice
{
  return (SFPeerDevice *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setOurDevice:(id)a3
{
}

- (SFPeerDevice)peeredDevice
{
  return (SFPeerDevice *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setPeeredDevice:(id)a3
{
}

- (UASimulatorAdvertiser)advertiser
{
  return (UASimulatorAdvertiser *)objc_getProperty(self, a2, 96LL, 1);
}

- (UASimulatorReceiver)receiver
{
  return (UASimulatorReceiver *)objc_getProperty(self, a2, 104LL, 1);
}

- (UASimulatorAdvertisementCreator)creator
{
  return (UASimulatorAdvertisementCreator *)objc_getProperty(self, a2, 112LL, 1);
}

- (BOOL)activitiesShouldCrossover
{
  return self->_activitiesShouldCrossover;
}

- (unsigned)commandPort
{
  return self->_commandPort;
}

- (OS_dispatch_queue)dispatchQ
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 120LL, 1);
}

- (NSString)bootstrapName
{
  return (NSString *)objc_getProperty(self, a2, 128LL, 1);
}

- (void).cxx_destruct
{
}

@end
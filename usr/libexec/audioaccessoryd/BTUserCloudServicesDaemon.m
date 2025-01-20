@interface BTUserCloudServicesDaemon
+ (id)sharedBTServicesDaemon;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BTUserCloudServicesDaemon)init;
- (id)descriptionWithLevel:(int)a3;
- (void)_activate;
- (void)_invalidate;
- (void)_xpcConnectionInvalidated:(id)a3;
- (void)activate;
- (void)invalidate;
- (void)reportHMDeviceCloudRecordInfosUpdated:(id)a3;
@end

@implementation BTUserCloudServicesDaemon

+ (id)sharedBTServicesDaemon
{
  if (qword_100237268 != -1) {
    dispatch_once(&qword_100237268, &stru_100208830);
  }
  return (id)qword_100237260;
}

- (BTUserCloudServicesDaemon)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___BTUserCloudServicesDaemon;
  v2 = -[BTUserCloudServicesDaemon init](&v9, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("BTUserCloudServicesDaemon", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    v7 = v2;
  }

  return v2;
}

- (id)descriptionWithLevel:(int)a3
{
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  dispatch_queue_attr_t v3 = (void *)CFPrefs_CopyKeys(@"com.apple.bluetooth", 0LL);
  id v4 = [v3 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v4)
  {
    id v5 = v4;
    int v6 = 0;
    v7 = 0LL;
    uint64_t v8 = *(void *)v28;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)i);
        if (!v6)
        {
          id v26 = v7;
          NSAppendPrintF(&v26, "\n");
          id v11 = v26;

          v7 = v11;
        }

        uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
        {
          v13 = (void *)CFPrefs_CopyTypedValue(@"com.apple.bluetooth", v10, 0LL, 0LL);
          id v25 = v7;
          NSAppendPrintF(&v25, "Pref: '%@' = '%##@'\n", v10, v13);
          id v14 = v25;

          ++v6;
          v7 = v14;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }

    while (v5);
  }

  else
  {
    v7 = 0LL;
  }

  id v24 = v7;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[CBIDSManager sharedInstance](&OBJC_CLASS___CBIDSManager, "sharedInstance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 statedumpAndRecordDailyMetric]);
  NSAppendPrintF(&v24, "%@\n", v16);
  id v17 = v24;

  id v23 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 deviceManager]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 printDebug]);
  NSAppendPrintF(&v23, "%@\n", v20);
  id v21 = v23;

  return v21;
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006D04C;
  block[3] = &unk_100206058;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  if (!self->_xpcListener)
  {
    dispatch_queue_attr_t v3 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.BluetoothCloudServices");
    xpcListener = self->_xpcListener;
    self->_xpcListener = v3;

    -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
    -[NSXPCListener _setQueue:](self->_xpcListener, "_setQueue:", self->_dispatchQueue);
    -[NSXPCListener resume](self->_xpcListener, "resume");
  }

  if (!self->_stateHandle)
  {
    dispatchQueue = self->_dispatchQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10006D174;
    v6[3] = &unk_1002066F8;
    v6[4] = self;
    self->_stateHandle = os_state_add_handler(dispatchQueue, v6);
  }

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006D1E8;
  block[3] = &unk_100206058;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  xpcListener = self->_xpcListener;
  self->_xpcListener = 0LL;

  unint64_t stateHandle = self->_stateHandle;
  if (stateHandle)
  {
    os_state_remove_handler(stateHandle);
    self->_unint64_t stateHandle = 0LL;
  }

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v28 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(&OBJC_CLASS___BTCloudServicesXPCConnection);
  -[BTCloudServicesXPCConnection setDaemon:](v7, "setDaemon:", self);
  -[BTCloudServicesXPCConnection setDispatchQueue:](v7, "setDispatchQueue:", self->_dispatchQueue);
  -[BTCloudServicesXPCConnection setXpcCnx:](v7, "setXpcCnx:", v6);
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    objc_super v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    uint64_t v10 = self->_xpcConnections;
    self->_xpcConnections = v9;

    xpcConnections = self->_xpcConnections;
  }

  -[NSMutableSet addObject:](xpcConnections, "addObject:", v7);
  v35 = self;
  v36 = v6;
  if (v6) {
    [v6 auditToken];
  }
  else {
    memset(v40, 0, 32);
  }
  uint64_t v11 = xpc_copy_code_signing_identity_for_token(v40);
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v11));
    free(v12);
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  __int128 v27 = (void *)v13;
  -[BTCloudServicesXPCConnection setSigningIdentity:](v7, "setSigningIdentity:", v13);
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___BTCloudServicesXPCClientInterface));
  v34 = objc_alloc(&OBJC_CLASS___NSSet);
  uint64_t v33 = objc_opt_class(&OBJC_CLASS___NSArray);
  uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSData);
  uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSDate);
  uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSError);
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSFileHandle);
  v16 = v7;
  uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSNull);
  uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSUUID);
  uint64_t v21 = objc_opt_class(&OBJC_CLASS___BTCloudDevice);
  uint64_t v22 = objc_opt_class(&OBJC_CLASS___BTMagicPairingSettings);
  uint64_t v23 = objc_opt_class(&OBJC_CLASS___BTCloudDeviceSupportInformation);
  id v24 = -[NSSet initWithObjects:]( v34,  "initWithObjects:",  v33,  v32,  v31,  v30,  v29,  v15,  v17,  v18,  v19,  v20,  v21,  v22,  v23,  objc_opt_class(&OBJC_CLASS___BTCloudSoundProfileRecord),  0LL);
  [v14 setClasses:v24 forSelector:"createDeviceRecord:completion:" argumentIndex:0 ofReply:1];
  [v14 setClasses:v24 forSelector:"modifyDeviceRecord:completion:" argumentIndex:0 ofReply:1];
  [v14 setClasses:v24 forSelector:"deleteDeviceRecord:completion:" argumentIndex:0 ofReply:1];
  [v14 setClasses:v24 forSelector:"deviceRecord:completion:" argumentIndex:1 ofReply:1];
  [v14 setClasses:v24 forSelector:"deviceRecordsWithCompletion:" argumentIndex:0 ofReply:1];
  [v14 setClasses:v24 forSelector:"createDeviceSupportInformationRecord:completion:" argumentIndex:0 ofReply:1];
  [v14 setClasses:v24 forSelector:"modifyDeviceSupportInformationRecord:completion:" argumentIndex:0 ofReply:1];
  [v14 setClasses:v24 forSelector:"deleteDeviceSupportInformationRecord:completion:" argumentIndex:0 ofReply:1];
  [v14 setClasses:v24 forSelector:"deviceSupportInformationRecord:completion:" argumentIndex:1 ofReply:1];
  [v14 setClasses:v24 forSelector:"deviceSupportInformationRecordsWithCompletion:" argumentIndex:0 ofReply:1];
  [v14 setClasses:v24 forSelector:"createMagicSettingsRecord:completion:" argumentIndex:0 ofReply:1];
  [v14 setClasses:v24 forSelector:"modifyMagicSettingsRecord:completion:" argumentIndex:0 ofReply:1];
  [v14 setClasses:v24 forSelector:"deleteDeviceRecord:completion:" argumentIndex:0 ofReply:1];
  [v14 setClasses:v24 forSelector:"magicSettingsRecord:completion:" argumentIndex:1 ofReply:1];
  [v14 setClasses:v24 forSelector:"magicSettingsRecordsWithCompletion:" argumentIndex:0 ofReply:1];
  [v14 setClasses:v24 forSelector:"accountInfoWithCompletion:" argumentIndex:0 ofReply:1];
  [v14 setClasses:v24 forSelector:"cloudPairingIdentifierForPeripheral:completion:" argumentIndex:0 ofReply:1];
  [v14 setClasses:v24 forSelector:"cloudPairingIdentifierForPeripheral:completion:" argumentIndex:1 ofReply:1];
  [v14 setClasses:v24 forSelector:"createSoundProfileRecord:completion:" argumentIndex:0 ofReply:1];
  [v14 setClasses:v24 forSelector:"modifySoundProfileRecord:completion:" argumentIndex:0 ofReply:1];
  [v14 setClasses:v24 forSelector:"fetchSoundProfileRecordWithCompletion:" argumentIndex:0 ofReply:1];
  [v14 setClasses:v24 forSelector:"deleteSoundProfileRecordWithCompletion:" argumentIndex:0 ofReply:1];
  [v14 setClasses:v24 forSelector:"hmDeviceCloudRecordInfosUpdated:" argumentIndex:0 ofReply:0];
  [v36 _setQueue:v35->_dispatchQueue];
  id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___BTCloudServicesXPCDaemonInterface));
  [v36 setExportedInterface:v25];

  [v36 setExportedObject:v16];
  objc_initWeak(&location, v35);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_10006D8E4;
  v37[3] = &unk_1002084D0;
  objc_copyWeak(&v38, &location);
  v37[4] = v16;
  [v36 setInvalidationHandler:v37];
  [v36 setRemoteObjectInterface:v14];
  [v36 resume];
  if (dword_1002345E8 <= 20 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 20LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTUserCloudServicesDaemon listener:shouldAcceptNewConnection:]",  20,  "XPC connection started: %#{pid}",  [v36 processIdentifier]);
  }
  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);

  return 1;
}

- (void)_xpcConnectionInvalidated:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (dword_1002345E8 <= 20)
  {
    if (dword_1002345E8 != -1 || (v6 = _LogCategory_Initialize(&dword_1002345E8, 20LL), id v4 = v7, v6))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 xpcCnx]);
      LogPrintF( &dword_1002345E8,  "-[BTUserCloudServicesDaemon _xpcConnectionInvalidated:]",  20,  "XPC connection ended: %#{pid}",  [v5 processIdentifier]);

      id v4 = v7;
    }
  }

  [v4 xpcConnectionInvalidated];
  -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v7);
}

- (void)reportHMDeviceCloudRecordInfosUpdated:(id)a3
{
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = self->_xpcConnections;
  id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      objc_super v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend( *(id *)(*((void *)&v10 + 1) + 8 * (void)v9),  "clientReportHMDeviceCloudRecordInfosUpdated:",  v4,  (void)v10);
        objc_super v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }
}

- (void).cxx_destruct
{
}

@end
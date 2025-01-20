@interface SDAirDropTransferManager
- (BOOL)shouldAcceptNewConnection:(id)a3;
- (NSArray)kvoObservingKeys;
- (NSMutableDictionary)transferIdentifierToHandler;
- (NSMutableDictionary)transferIdentifierToTransfer;
- (SDAirDropAlertManagerDelegate)classroomDelegate;
- (SDAirDropAlertManagerDelegate)delegate;
- (SDAirDropTransferManager)init;
- (id)exportedInterface;
- (id)itemTypesForTransfer:(id)a3;
- (id)machServiceName;
- (id)remoteObjectInterface;
- (void)_enumerateRemoteObjectProxiesUsingBlock:(id)a3;
- (void)_remoteObjectProxyForConnection:(id)a3 usingBlock:(id)a4;
- (void)activate;
- (void)askEventForRecordID:(id)a3 withResults:(id)a4;
- (void)cancelEventForRecordID:(id)a3 withResults:(id)a4;
- (void)cleanUpTransfer:(id)a3;
- (void)cleanUpURL:(id)a3;
- (void)connectionEstablished:(id)a3;
- (void)connectionInvalidated:(id)a3;
- (void)errorEventForRecordID:(id)a3 withResults:(id)a4;
- (void)failTransfer:(id)a3 withState:(unint64_t)a4 failureReason:(unint64_t)a5;
- (void)finishedEventForRecordID:(id)a3 withResults:(id)a4;
- (void)handlerFailedForTransfer:(id)a3;
- (void)invalidate;
- (void)loadAllPersistedTransfers;
- (void)notifyObserversOfRemovedTransfer:(id)a3;
- (void)notifyObserversOfUpdatedTransfer:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)progressEventForRecordID:(id)a3 withResults:(id)a4;
- (void)removeTransfer:(id)a3 shouldCleanup:(BOOL)a4;
- (void)setClassroomDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHandler:(id)a3 forTransfer:(id)a4;
- (void)setKvoObservingKeys:(id)a3;
- (void)setTransferIdentifierToHandler:(id)a3;
- (void)setTransferIdentifierToTransfer:(id)a3;
- (void)setTransferState:(unint64_t)a3 forTransfer:(id)a4 shouldNotify:(BOOL)a5;
- (void)setTransferState:(unint64_t)a3 forTransfer:(id)a4 shouldNotify:(BOOL)a5 shouldCleanup:(BOOL)a6;
- (void)transfer:(id)a3 actionTriggeredForAction:(id)a4;
- (void)transferUserResponseUpdated:(id)a3;
@end

@implementation SDAirDropTransferManager

- (SDAirDropTransferManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SDAirDropTransferManager;
  v2 = -[SDXPCDaemon init](&v14, "init");
  if (v2)
  {
    v3 = NSStringFromSelector("userResponse");
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v15[0] = v4;
    v5 = NSStringFromSelector("needsAction");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v15[1] = v6;
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));
    kvoObservingKeys = v2->_kvoObservingKeys;
    v2->_kvoObservingKeys = (NSArray *)v7;

    v9 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    transferIdentifierToTransfer = v2->_transferIdentifierToTransfer;
    v2->_transferIdentifierToTransfer = v9;

    v11 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    transferIdentifierToHandler = v2->_transferIdentifierToHandler;
    v2->_transferIdentifierToHandler = v11;

    -[SDAirDropTransferManager loadAllPersistedTransfers](v2, "loadAllPersistedTransfers");
  }

  return v2;
}

- (void)activate
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___SDAirDropTransferManager;
  -[SDXPCDaemon _activate](&v2, "_activate");
}

- (void)invalidate
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___SDAirDropTransferManager;
  -[SDXPCDaemon _invalidate](&v2, "_invalidate");
}

- (void)_remoteObjectProxyForConnection:(id)a3 usingBlock:(id)a4
{
}

- (void)_enumerateRemoteObjectProxiesUsingBlock:(id)a3
{
}

- (void)notifyObserversOfUpdatedTransfer:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100050D60;
    v6[3] = &unk_1005CBEE0;
    id v7 = v4;
    -[SDAirDropTransferManager _enumerateRemoteObjectProxiesUsingBlock:]( self,  "_enumerateRemoteObjectProxiesUsingBlock:",  v6);
  }
}

- (void)notifyObserversOfRemovedTransfer:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100050DE8;
  v5[3] = &unk_1005CBEE0;
  id v6 = [a3 copy];
  id v4 = v6;
  -[SDAirDropTransferManager _enumerateRemoteObjectProxiesUsingBlock:]( self,  "_enumerateRemoteObjectProxiesUsingBlock:",  v5);
}

- (void)removeTransfer:(id)a3 shouldCleanup:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = airdrop_log(v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    int v15 = 138412290;
    v16 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Removing transfer with id %@",  (uint8_t *)&v15,  0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager transferIdentifierToHandler](self, "transferIdentifierToHandler"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  [v10 setObject:0 forKeyedSubscript:v11];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager transferIdentifierToTransfer](self, "transferIdentifierToTransfer"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  [v12 setObject:0 forKeyedSubscript:v13];

  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager kvoObservingKeys](self, "kvoObservingKeys"));
  [v6 removeObserver:self forKeyPaths:v14 context:off_100641B30];

  -[SDAirDropTransferManager notifyObserversOfRemovedTransfer:](self, "notifyObserversOfRemovedTransfer:", v6);
  if (v4) {
    -[SDAirDropTransferManager cleanUpTransfer:](self, "cleanUpTransfer:", v6);
  }
}

- (void)cleanUpTransfer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = airdrop_log(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    int v9 = 138412290;
    v10 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Cleaning up transfer with id %@",  (uint8_t *)&v9,  0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[SDAirDropHandler transferURLForTransfer:]( &OBJC_CLASS___SDAirDropHandler,  "transferURLForTransfer:",  v4));
  -[SDAirDropTransferManager cleanUpURL:](self, "cleanUpURL:", v8);
}

- (void)askEventForRecordID:(id)a3 withResults:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  int v9 = -[SFAirDropTransfer initWithIdentifier:initialInformation:]( objc_alloc(&OBJC_CLASS___SFAirDropTransfer),  "initWithIdentifier:initialInformation:",  v7,  v8);
  -[SFAirDropTransfer updateWithInformation:](v9, "updateWithInformation:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager itemTypesForTransfer:](self, "itemTypesForTransfer:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SFAirDropTransfer metaData](v9, "metaData"));
  [v11 setItems:v10];

  uint64_t v13 = airdrop_log(v12);
  objc_super v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = (void *)objc_claimAutoreleasedReturnValue(-[SFAirDropTransfer identifier](v9, "identifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SFAirDropTransfer metaData](v9, "metaData"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 items]);
    *(_DWORD *)buf = 138543874;
    v33 = v15;
    __int16 v34 = 2112;
    v35 = v9;
    __int16 v36 = 2112;
    v37 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[Transfer: %{public}@]: New incoming transfer %@ with items: %@",  buf,  0x20u);
  }

  id v18 =  +[SFAirDropTransferTestingSnapshot writeSnapshotForTransfer:initialInfo:name:error:]( &OBJC_CLASS___SFAirDropTransferTestingSnapshot,  "writeSnapshotForTransfer:initialInfo:name:error:",  v9,  v8,  @"before_handler",  0LL);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager transferIdentifierToTransfer](self, "transferIdentifierToTransfer"));
  [v19 setObject:v9 forKeyedSubscript:v7];

  v20 = (void *)objc_claimAutoreleasedReturnValue( +[SDAirDropHandlerFactory handlerForTransfer:]( &OBJC_CLASS___SDAirDropHandlerFactory,  "handlerForTransfer:",  v9));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager kvoObservingKeys](self, "kvoObservingKeys"));
  -[SFAirDropTransfer addObserver:forKeyPaths:options:context:]( v9,  "addObserver:forKeyPaths:options:context:",  self,  v21,  0LL,  off_100641B30);

  if (v20)
  {
    -[SDAirDropTransferManager setHandler:forTransfer:](self, "setHandler:forTransfer:", v20, v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SFAirDropTransfer metaData](v9, "metaData"));
    if ([v22 canAutoAccept])
    {
      uint64_t v24 = objc_opt_class(&OBJC_CLASS___SDAirDropHandlerUnsupportedType, v23);
      char isKindOfClass = objc_opt_isKindOfClass(v20, v24);

      if ((isKindOfClass & 1) == 0)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[SFAirDropTransfer metaData](v9, "metaData"));
        [v26 setDidAutoAccept:1];

        -[SDAirDropTransferManager setTransferState:forTransfer:shouldNotify:]( self,  "setTransferState:forTransfer:shouldNotify:",  1LL,  v9,  0LL);
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[SFAirDropTransfer possibleActions](v9, "possibleActions"));
        v28 = (void *)objc_claimAutoreleasedReturnValue([v27 firstObject]);
        -[SDAirDropTransferManager transfer:actionTriggeredForAction:]( self,  "transfer:actionTriggeredForAction:",  v9,  v28);

LABEL_10:
        id v31 =  +[SFAirDropTransferTestingSnapshot writeSnapshotForTransfer:initialInfo:name:error:]( &OBJC_CLASS___SFAirDropTransferTestingSnapshot,  "writeSnapshotForTransfer:initialInfo:name:error:",  v9,  v8,  @"after_handler",  0LL);
        goto LABEL_11;
      }
    }

    else
    {
    }

    -[SDAirDropTransferManager setTransferState:forTransfer:shouldNotify:]( self,  "setTransferState:forTransfer:shouldNotify:",  1LL,  v9,  1LL);
    goto LABEL_10;
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[SFAirDropTransfer identifier](v9, "identifier"));
  [v29 handleFailureInMethod:a2, self, @"SDAirDropTransferManager.m", 150, @"Failed to find valid handler for transfer id %@", v30 object file lineNumber description];

LABEL_11:
}

- (void)progressEventForRecordID:(id)a3 withResults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager transferIdentifierToTransfer](self, "transferIdentifierToTransfer"));
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v6]);

  if (v9)
  {
    [v9 updateWithInformation:v7];
    if ([v9 transferState] == (id)1) {
      -[SDAirDropTransferManager setTransferState:forTransfer:shouldNotify:]( self,  "setTransferState:forTransfer:shouldNotify:",  2LL,  v9,  1LL);
    }
  }

  else
  {
    uint64_t v11 = airdrop_log(v10);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10005319C();
    }
  }
}

- (void)cancelEventForRecordID:(id)a3 withResults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager transferIdentifierToTransfer](self, "transferIdentifierToTransfer"));
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v6]);

  if (v9)
  {
    [v9 updateWithInformation:v7];
    -[SDAirDropTransferManager failTransfer:withState:failureReason:]( self,  "failTransfer:withState:failureReason:",  v9,  3LL,  1LL);
  }

  else
  {
    uint64_t v11 = airdrop_log(v10);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000531FC();
    }
  }
}

- (void)errorEventForRecordID:(id)a3 withResults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager transferIdentifierToTransfer](self, "transferIdentifierToTransfer"));
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v6]);

  uint64_t v11 = airdrop_log(v10);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
  if (v9)
  {
    if (v13) {
      sub_1000532BC();
    }

    [v9 updateWithInformation:v7];
    -[SDAirDropTransferManager failTransfer:withState:failureReason:]( self,  "failTransfer:withState:failureReason:",  v9,  9LL,  1LL);
  }

  else
  {
    if (v13) {
      sub_10005325C();
    }
  }
}

- (void)finishedEventForRecordID:(id)a3 withResults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager transferIdentifierToTransfer](self, "transferIdentifierToTransfer"));
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v6]);

  if (v9)
  {
    [v9 updateWithInformation:v7];
    -[SDAirDropTransferManager setTransferState:forTransfer:shouldNotify:]( self,  "setTransferState:forTransfer:shouldNotify:",  4LL,  v9,  1LL);
  }

  else
  {
    uint64_t v11 = airdrop_log(v10);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100053354();
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = v11;
  if (off_100641B30 == a6)
  {
    id v13 = v11;
    objc_super v14 = NSStringFromSelector("userResponse");
    int v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    unsigned int v16 = [v10 isEqual:v15];

    if (v16)
    {
      -[SDAirDropTransferManager transferUserResponseUpdated:](self, "transferUserResponseUpdated:", v13);
    }

    else
    {
      v17 = NSStringFromSelector("needsAction");
      id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      unsigned int v19 = [v10 isEqual:v18];

      if (v19) {
        -[SDAirDropTransferManager notifyObserversOfUpdatedTransfer:](self, "notifyObserversOfUpdatedTransfer:", v13);
      }
    }
  }

  else
  {
    v20.receiver = self;
    v20.super_class = (Class)&OBJC_CLASS___SDAirDropTransferManager;
    -[SDAirDropTransferManager observeValueForKeyPath:ofObject:change:context:]( &v20,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  a5,  a6);
  }
}

- (void)transferUserResponseUpdated:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userResponse];
  uint64_t v6 = airdrop_log(v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = SFAirDropTransferUserResponseToString(v5);
    int v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    *(_DWORD *)buf = 138412546;
    __int16 v36 = v9;
    __int16 v37 = 2112;
    v38 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "User response: %@ for transfer with id %@",  buf,  0x16u);
  }

  switch((unint64_t)v5)
  {
    case 0uLL:
      break;
    case 1uLL:
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager transferIdentifierToHandler](self, "transferIdentifierToHandler"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
      objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v13]);

      int v15 = (void *)objc_claimAutoreleasedReturnValue([v4 customDestinationURL]);
      if ((objc_opt_respondsToSelector(v14, "shouldExtractMediaFromPhotosBundles") & 1) != 0) {
        id v16 = [v14 shouldExtractMediaFromPhotosBundles];
      }
      else {
        id v16 = 0LL;
      }
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager delegate](self, "delegate"));
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
      [v23 alertManager:self acceptingTransferWithRecordID:v24 withDestinationURL:v15 shouldExtractMediaFromPhotosBundlesForRecordID:v16];

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager classroomDelegate](self, "classroomDelegate"));
      v26 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
      [v25 alertManager:self acceptingTransferWithRecordID:v26 withDestinationURL:v15 shouldExtractMediaFromPhotosBundlesForRecordID:v16];

      -[SDAirDropTransferManager notifyObserversOfUpdatedTransfer:](self, "notifyObserversOfUpdatedTransfer:", v4);
      break;
    case 2uLL:
      unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager delegate](self, "delegate"));
      objc_super v20 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
      objc_msgSend( v19,  "alertManager:cancelingTransferWithRecordID:withFailureReason:",  self,  v20,  objc_msgSend(v4, "failureReason"));

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager classroomDelegate](self, "classroomDelegate"));
      v22 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
      objc_msgSend( v21,  "alertManager:cancelingTransferWithRecordID:withFailureReason:",  self,  v22,  objc_msgSend(v4, "failureReason"));

      -[SDAirDropTransferManager removeTransfer:shouldCleanup:](self, "removeTransfer:shouldCleanup:", v4, 1LL);
      break;
    case 3uLL:
      if ([v4 transferState] == (id)7) {
        -[SDAirDropTransferManager setTransferState:forTransfer:shouldNotify:shouldCleanup:]( self,  "setTransferState:forTransfer:shouldNotify:shouldCleanup:",  8LL,  v4,  1LL,  1LL);
      }
      break;
    default:
      uint64_t v17 = airdrop_log(v11);
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1000533B4(v18);
      }

      break;
  }

  uint64_t v27 = objc_claimAutoreleasedReturnValue([v4 metaData]);
  if (v27)
  {
    v28 = (void *)v27;
    v29 = (void *)objc_claimAutoreleasedReturnValue([v4 metaData]);
    unsigned int v30 = [v29 transferTypes];

    if ((v30 & 0x40000) != 0)
    {
      if ([v4 userResponse])
      {
        id v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  objc_msgSend(v4, "userResponse", @"response")));
        __int16 v34 = v31;
        v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));

        SFMetricsLog(@"com.apple.sharing.AirDropCredentialResponse", v32);
      }
    }
  }
}

- (void)transfer:(id)a3 actionTriggeredForAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager transferIdentifierToHandler](self, "transferIdentifierToHandler"));
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);

  if (v10)
  {
    [v10 actionSelected:v7];
  }

  else
  {
    uint64_t v12 = airdrop_log(v11);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000533F4();
    }
  }
}

- (id)machServiceName
{
  return @"com.apple.sharing.transfer-observer";
}

- (id)exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___SDAirDropTransferManagerProtocol);
}

- (id)remoteObjectInterface
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___SFAirDropTransferObserverProtocol);
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  return 1;
}

- (void)connectionEstablished:(id)a3
{
  id v4 = a3;
  uint64_t v5 = airdrop_log(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sd_description"));
    *(_DWORD *)buf = 138412290;
    id v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "New connection established %@", buf, 0xCu);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100051E24;
  v8[3] = &unk_1005CBF08;
  v8[4] = self;
  -[SDAirDropTransferManager _remoteObjectProxyForConnection:usingBlock:]( self,  "_remoteObjectProxyForConnection:usingBlock:",  v4,  v8);
}

- (void)connectionInvalidated:(id)a3
{
  id v3 = a3;
  uint64_t v4 = airdrop_log(v3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sd_description"));
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Connection invalidated %@",  (uint8_t *)&v7,  0xCu);
  }
}

- (void)setHandler:(id)a3 forTransfer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = airdrop_log(v7);
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    uint64_t v12 = (objc_class *)objc_opt_class(v6, v11);
    id v13 = NSStringFromClass(v12);
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    *(_DWORD *)buf = 138543618;
    v28 = v10;
    __int16 v29 = 2112;
    unsigned int v30 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[Transfer: %{public}@] Setting handler of class %@",  buf,  0x16u);
  }

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000521D4;
  v25[3] = &unk_1005CBF58;
  v25[4] = self;
  id v15 = v7;
  id v26 = v15;
  [v6 setUpdateTransferStateHandler:v25];
  unsigned int v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472LL;
  v21 = sub_100052280;
  v22 = &unk_1005CBFD0;
  uint64_t v23 = self;
  id v24 = v15;
  id v16 = v15;
  [v6 setCompletionHandler:&v19];
  objc_msgSend(v6, "activate", v19, v20, v21, v22, v23);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager transferIdentifierToHandler](self, "transferIdentifierToHandler"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
  [v17 setObject:v6 forKeyedSubscript:v18];
}

- (void)handlerFailedForTransfer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager transferIdentifierToHandler](self, "transferIdentifierToHandler"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);

  uint64_t v9 = airdrop_log(v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_100053470((uint64_t)v7, v4);
  }

  uint64_t v11 = -[SDAirDropHandleriCloudDrive initWithTransfer:]( objc_alloc(&OBJC_CLASS___SDAirDropHandleriCloudDrive),  "initWithTransfer:",  v4);
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___SDAirDropHandleriCloudDrive, v12);
  if ((objc_opt_isKindOfClass(v7, v13) & 1) != 0
    || !-[SDAirDropHandleriCloudDrive canHandleTransfer](v11, "canHandleTransfer"))
  {
    -[SDAirDropTransferManager failTransfer:withState:failureReason:]( self,  "failTransfer:withState:failureReason:",  v4,  9LL,  3LL);
  }

  else
  {
    -[SDAirDropTransferManager setHandler:forTransfer:](self, "setHandler:forTransfer:", v11, v4);
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager transferIdentifierToHandler](self, "transferIdentifierToHandler"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v15]);
    [v16 transferUpdated];

    -[SDAirDropTransferManager notifyObserversOfUpdatedTransfer:](self, "notifyObserversOfUpdatedTransfer:", v4);
  }
}

- (void)failTransfer:(id)a3 withState:(unint64_t)a4 failureReason:(unint64_t)a5
{
  id v9 = a3;
  id v10 = v9;
  if (a4 != 3 && a4 != 9)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    uint64_t v12 = SFAirDropTransferStateToString(a4);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    [v11 handleFailureInMethod:a2, self, @"SDAirDropTransferManager.m", 364, @"Failing transfer with invalid state: %@", v13 object file lineNumber description];
  }

  uint64_t v14 = airdrop_log(v9);
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_100053504();
  }

  [v10 setFailureReason:a5];
  id v16 = off_1005C8828;
  if (a5 != 2) {
    id v16 = off_1005C8820;
  }
  id v17 = [objc_alloc(*v16) initWithTransfer:v10];
  -[SDAirDropTransferManager setHandler:forTransfer:](self, "setHandler:forTransfer:", v17, v10);
  [v17 setCompletionHandler:&stru_1005CC010];
  -[SDAirDropTransferManager setTransferState:forTransfer:shouldNotify:]( self,  "setTransferState:forTransfer:shouldNotify:",  a4,  v10,  1LL);
}

- (void)setTransferState:(unint64_t)a3 forTransfer:(id)a4 shouldNotify:(BOOL)a5
{
}

- (void)setTransferState:(unint64_t)a3 forTransfer:(id)a4 shouldNotify:(BOOL)a5 shouldCleanup:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a4;
  uint64_t v11 = airdrop_log(v10);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_1000535A4();
  }

  [v10 setTransferState:a3];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager transferIdentifierToHandler](self, "transferIdentifierToHandler"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v14]);
  [v15 transferUpdated];

  if (v7) {
    -[SDAirDropTransferManager notifyObserversOfUpdatedTransfer:](self, "notifyObserversOfUpdatedTransfer:", v10);
  }
  if (v6) {
    -[SDAirDropTransferManager removeTransfer:shouldCleanup:](self, "removeTransfer:shouldCleanup:", v10, 1LL);
  }
}

- (void)cleanUpURL:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = airdrop_log(v3);
    BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
      *(_DWORD *)buf = 138412290;
      id v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Cleaning up URL %@", buf, 0xCu);
    }

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v14 = 0LL;
    unsigned __int8 v9 = [v8 removeItemAtURL:v4 error:&v14];
    id v10 = v14;

    if ((v9 & 1) == 0)
    {
      uint64_t v12 = airdrop_log(v11);
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100053684();
      }
    }
  }
}

- (void)loadAllPersistedTransfers
{
  uint64_t v2 = airdrop_log(self);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Loading all persisted transfers", buf, 2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[SDAirDropHandler persistedTransfersBaseURL]( &OBJC_CLASS___SDAirDropHandler,  "persistedTransfersBaseURL"));
  if (v5)
  {
    v31[0] = NSURLIsDirectoryKey;
    v31[1] = NSURLIsReadableKey;
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 2LL));
    unsigned int v19 = v5;
    uint64_t v20 = v4;
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( [v4 enumeratorAtURL:v5 includingPropertiesForKeys:v6 options:7 errorHandler:0]);

    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v25;
      do
      {
        uint64_t v12 = 0LL;
        do
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)v12);
          id v23 = 0LL;
          [v13 getResourceValue:&v23 forKey:NSURLIsDirectoryKey error:0];
          id v14 = v23;
          id v22 = 0LL;
          [v13 getResourceValue:&v22 forKey:NSURLIsReadableKey error:0];
          id v15 = v22;
          if ([v14 BOOLValue])
          {
            id v16 = [v15 BOOLValue];
            if ((_DWORD)v16)
            {
              uint64_t v17 = airdrop_log(v16);
              id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                __int16 v29 = v13;
                _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Receive data at %@ is not valid",  buf,  0xCu);
              }

              -[SDAirDropTransferManager cleanUpURL:](self, "cleanUpURL:", v13);
            }
          }

          uint64_t v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v24 objects:v30 count:16];
      }

      while (v10);
    }

    uint64_t v5 = v19;
    id v4 = v20;
  }
}

- (id)itemTypesForTransfer:(id)a3
{
  id v3 = a3;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_100052F60;
  v42[3] = &unk_1005CC038;
  v32 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v43 = v32;
  id v4 = objc_retainBlock(v42);
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 metaData]);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 rawFiles]);

  id v7 = [v6 countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v39;
    uint64_t v10 = kSFOperationFileTypeKey;
    uint64_t v11 = kSFOperationtFileSubTypeKey;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v39 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
        id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v10, v32));
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v11]);
        ((void (*)(void *, void *, void *, uint64_t))v4[2])(v4, v14, v15, 1LL);
      }

      id v8 = [v6 countByEnumeratingWithState:&v38 objects:v45 count:16];
    }

    while (v8);
  }

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  uint64_t v33 = v3;
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v3 completedURLs]);
  id v17 = [v16 countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v35;
    do
    {
      for (j = 0LL; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v35 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)j);
        if ((objc_msgSend(v21, "isFileURL", v32) & 1) == 0)
        {
          id v22 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationWorkspace defaultWorkspace]( &OBJC_CLASS___LSApplicationWorkspace,  "defaultWorkspace"));
          id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 URLOverrideForURL:v21]);

          __int128 v24 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationWorkspace defaultWorkspace]( &OBJC_CLASS___LSApplicationWorkspace,  "defaultWorkspace"));
          __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 applicationsAvailableForOpeningURL:v21]);

          __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 firstObject]);
          __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 applicationIdentifier]);

          if (v27)
          {
            ((void (*)(void *, void *, void, void))v4[2])(v4, v27, 0LL, 0LL);
          }

          else
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue([v23 scheme]);
            ((void (*)(void *, void *, void, void))v4[2])(v4, v28, 0LL, 0LL);
          }
        }
      }

      id v18 = [v16 countByEnumeratingWithState:&v34 objects:v44 count:16];
    }

    while (v18);
  }

  __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v32, "allValues"));
  unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v29));

  return v30;
}

- (SDAirDropAlertManagerDelegate)delegate
{
  return (SDAirDropAlertManagerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
}

- (SDAirDropAlertManagerDelegate)classroomDelegate
{
  return (SDAirDropAlertManagerDelegate *)objc_loadWeakRetained((id *)&self->_classroomDelegate);
}

- (void)setClassroomDelegate:(id)a3
{
}

- (NSMutableDictionary)transferIdentifierToTransfer
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setTransferIdentifierToTransfer:(id)a3
{
}

- (NSMutableDictionary)transferIdentifierToHandler
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setTransferIdentifierToHandler:(id)a3
{
}

- (NSArray)kvoObservingKeys
{
  return (NSArray *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setKvoObservingKeys:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

  ;
}

@end
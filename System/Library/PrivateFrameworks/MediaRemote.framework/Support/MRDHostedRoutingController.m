@interface MRDHostedRoutingController
+ (void)initialize;
- (BOOL)devicePresenceDetected;
- (BOOL)isOutputContextInUse:(id)a3;
- (MRDHostedRoutingController)init;
- (MRDHostedRoutingController)initWithDiscoverySession:(id)a3;
- (MRDRemoteControlDiscoverySession)discoverySession;
- (MRDeviceInfo)deviceInfo;
- (NSArray)availableDistantEndpoints;
- (NSArray)availableDistantOutputDevices;
- (NSArray)availableEndpoints;
- (NSArray)availableOutputDevices;
- (NSArray)resolvedAvailableEndpoints;
- (NSArray)virtualOutputDevices;
- (NSDictionary)availableExternalDevices;
- (NSMutableDictionary)virtualOutputDeviceDictionary;
- (NSString)debugDescription;
- (OS_dispatch_queue)serialQueue;
- (id)_onQueue_determineGroupLeaderForOutputDevices:(id)a3 availableOutputDevices:(id)a4 options:(unint64_t)a5;
- (id)_onQueue_makeExternalDeviceForEndpoint:(id)a3;
- (id)_onQueue_makeExternalDeviceTransportForEndpoint:(id)a3 designatedGroupLeader:(id)a4;
- (id)_onQueue_makeHostedExternalDeviceForEndpoint:(id)a3 didCreate:(BOOL *)a4;
- (id)_onQueue_makeHostedExternalDeviceForEndpoint:(id)a3 didCreate:(BOOL *)a4 factory:(id)a5;
- (id)_onQueue_makeLocalHostedExternalDeviceForEndpoint:(id)a3 didCreate:(BOOL *)a4;
- (id)computeHostsByGroupIDForOutputDevices:(id)a3 unclusteredDevices:(id)a4;
- (id)createDiscoverySession;
- (id)determineGroupLeaderForOutputDevices:(id)a3 options:(unint64_t)a4;
- (id)externalDeviceForEndpoint:(id)a3;
- (id)filterOutputDevices:(id)a3 remoteControllableOnly:(BOOL)a4;
- (id)makeEndpointWithOutputDeviceUIDs:(id)a3 options:(unint64_t)a4;
- (id)makeEndpointWithOutputDevices:(id)a3 options:(unint64_t)a4;
- (id)makeTransientExternalDeviceToOutputDevice:(id)a3;
- (id)resolveOutputDevices:(id)a3;
- (unsigned)discoveryMode;
- (void)_handleEndpointOutputDevicesDidChangeNotification:(id)a3;
- (void)_handleExternalDeviceConnectionStateDidChangeNotification:(id)a3;
- (void)_handleOutputContextManagerDidReset:(id)a3;
- (void)_onQueue_reloadEndpoints;
- (void)_onQueue_reloadOutputDevices;
- (void)_onQueue_reloadWithOutputDevices:(id)a3;
- (void)_processDiscoveryObserverChanges;
- (void)addObserver:(id)a3;
- (void)addVirtualOutputDevice:(id)a3 forClient:(id)a4;
- (void)dealloc;
- (void)hostedExternalDeviceManagerDidUpdateExternalDeviceMapping:(id)a3;
- (void)removeObserver:(id)a3;
- (void)removeVirtualOutputDevicesForClient:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setDiscoverySession:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setVirtualOutputDeviceDictionary:(id)a3;
@end

@implementation MRDHostedRoutingController

+ (void)initialize
{
}

- (MRDHostedRoutingController)initWithDiscoverySession:(id)a3
{
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)&OBJC_CLASS___MRDHostedRoutingController;
  v5 = -[MRDHostedRoutingController init](&v44, "init");
  v6 = v5;
  if (v5)
  {
    v7 = (objc_class *)objc_opt_class(v5);
    Name = class_getName(v7);
    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_queue_t v11 = dispatch_queue_create(Name, v10);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v11;

    dispatch_queue_attr_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v13);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.mediaremoted.MRDHostedRoutingController/calloutQueue", v14);
    observerCalloutQueue = v6->_observerCalloutQueue;
    v6->_observerCalloutQueue = (OS_dispatch_queue *)v15;

    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    weakObservers = v6->_weakObservers;
    v6->_weakObservers = (NSHashTable *)v17;

    uint64_t v19 = objc_claimAutoreleasedReturnValue( +[MRAVLocalEndpoint sharedLocalEndpointForRoutingContextWithUID:]( &OBJC_CLASS___MRAVLocalEndpoint,  "sharedLocalEndpointForRoutingContextWithUID:",  0LL));
    localEndpoint = v6->_localEndpoint;
    v6->_localEndpoint = (MRAVEndpoint *)v19;

    v21 = objc_alloc_init(&OBJC_CLASS___MRDHostedExternalDeviceManager);
    externalDeviceManager = v6->_externalDeviceManager;
    v6->_externalDeviceManager = v21;

    -[MRDHostedExternalDeviceManager setDelegate:](v6->_externalDeviceManager, "setDelegate:", v6);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[MRDAVOutputContextManager sharedManager](&OBJC_CLASS___MRDAVOutputContextManager, "sharedManager"));
    [v23 addDataSource:v6];

    uint64_t v24 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    virtualOutputDeviceDictionary = v6->_virtualOutputDeviceDictionary;
    v6->_virtualOutputDeviceDictionary = (NSMutableDictionary *)v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v26 addObserver:v6 selector:"_handleExternalDeviceConnectionStateDidChangeNotification:" name:kMRExternalDeviceConnectionStateDidChangeNotification object:0];
    [v26 addObserver:v6 selector:"_handleObserverDiscoveryModeDidChangeNotification:" name:@"MRDAVHostedRoutingObserverDiscoveryModeDidChangeNotification" object:0];
    [v26 addObserver:v6 selector:"_handleEndpointOutputDevicesDidChangeNotification:" name:kMRAVEndpointOutputDevicesDidChangeNotification object:0];
    [v26 addObserver:v6 selector:"_handleOutputContextManagerDidReset:" name:@"MRDAVOutputContextManagerDidReset" object:0];
    if (v4) {
      v27 = (MRDRemoteControlDiscoverySession *)v4;
    }
    else {
      v27 = objc_alloc_init(&OBJC_CLASS___MRDRemoteControlDiscoverySession);
    }
    discoverySession = v6->_discoverySession;
    v6->_discoverySession = v27;

    objc_initWeak(&location, v6);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MRDHostedRoutingController discoverySession](v6, "discoverySession"));
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_1000C7CE8;
    v41[3] = &unk_10039BA20;
    objc_copyWeak(&v42, &location);
    uint64_t v30 = objc_claimAutoreleasedReturnValue([v29 addOutputDevicesChangedCallback:v41]);
    id discoverySessionOutputDevicesToken = v6->_discoverySessionOutputDevicesToken;
    v6->_id discoverySessionOutputDevicesToken = (id)v30;

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MRDHostedRoutingController discoverySession](v6, "discoverySession"));
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_1000C7D70;
    v39[3] = &unk_10039BA20;
    objc_copyWeak(&v40, &location);
    uint64_t v33 = objc_claimAutoreleasedReturnValue([v32 addEndpointsChangedCallback:v39]);
    id discoverySessionEndpointsToken = v6->_discoverySessionEndpointsToken;
    v6->_id discoverySessionEndpointsToken = (id)v33;

    v35 = (dispatch_queue_s *)v6->_serialQueue;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_1000C7DF8;
    v37[3] = &unk_100399250;
    v38 = v6;
    dispatch_async(v35, v37);

    objc_destroyWeak(&v40);
    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (MRDHostedRoutingController)init
{
  return -[MRDHostedRoutingController initWithDiscoverySession:](self, "initWithDiscoverySession:", 0LL);
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDHostedRoutingController discoverySession](self, "discoverySession"));
  [v3 removeOutputDevicesChangedCallback:self->_discoverySessionOutputDevicesToken];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDHostedRoutingController discoverySession](self, "discoverySession"));
  [v4 removeEndpointsChangedCallback:self->_discoverySessionEndpointsToken];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MRDHostedRoutingController;
  -[MRDHostedRoutingController dealloc](&v5, "dealloc");
}

- (NSString)debugDescription
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlDiscoverySession debugDescription](self->_discoverySession, "debugDescription"));
  objc_super v5 = -[NSString initWithFormat:](v3, "initWithFormat:", @"DiscoverySession=%@\n", v4);

  return v5;
}

- (id)createDiscoverySession
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s is abstract",  "-[MRDHostedRoutingController createDiscoverySession]"));
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v2,  0LL));

  objc_exception_throw(v3);
  -[MRDHostedRoutingController _onQueue_reloadEndpoints](v4, v5);
  return result;
}

- (void)_onQueue_reloadEndpoints
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s is abstract",  "-[MRDHostedRoutingController _onQueue_reloadEndpoints]"));
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v2,  0LL));

  objc_exception_throw(v3);
  -[MRDHostedRoutingController _onQueue_makeExternalDeviceTransportForEndpoint:designatedGroupLeader:](v4, v5, v6, v7);
}

- (id)_onQueue_makeExternalDeviceTransportForEndpoint:(id)a3 designatedGroupLeader:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s is abstract",  "-[MRDHostedRoutingController _onQueue_makeExternalDeviceTransportForEndpoint:designatedGroupLeader:]"));
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v7,  0LL));

  objc_exception_throw(v8);
  return -[MRDHostedRoutingController makeEndpointWithOutputDevices:options:](v9, v10, v11, v12);
}

- (id)makeEndpointWithOutputDevices:(id)a3 options:(unint64_t)a4
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s is abstract",  "-[MRDHostedRoutingController makeEndpointWithOutputDevices:options:]"));
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v5,  0LL));

  objc_exception_throw(v6);
  return -[MRDHostedRoutingController makeEndpointWithOutputDeviceUIDs:options:](v7, v8, v9, v10);
}

- (id)makeEndpointWithOutputDeviceUIDs:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDHostedRoutingController availableOutputDevices](self, "availableOutputDevices"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000C8218;
  v15[3] = &unk_10039E308;
  id v16 = v6;
  id v8 = v6;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 indexesOfObjectsPassingTest:v15]);
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectsAtIndexes:v9]);

  id v11 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v10);
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet allObjects](v11, "allObjects"));

  dispatch_queue_attr_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[MRDHostedRoutingController makeEndpointWithOutputDevices:options:]( self,  "makeEndpointWithOutputDevices:options:",  v12,  a4));
  return v13;
}

- (id)makeTransientExternalDeviceToOutputDevice:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && (id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 primaryID]), v6, v6))
  {
    id v7 = objc_alloc_init(&OBJC_CLASS____MRAVOutputDeviceDescriptorProtobuf);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 primaryID]);
    -[_MRAVOutputDeviceDescriptorProtobuf setUniqueIdentifier:](v7, "setUniqueIdentifier:", v8);

    -[_MRAVOutputDeviceDescriptorProtobuf setTransportType:](v7, "setTransportType:", [v5 transportType]);
    id v9 = -[MRAVDistantOutputDevice initWithDescriptor:]( objc_alloc(&OBJC_CLASS___MRAVDistantOutputDevice),  "initWithDescriptor:",  v7);
    id v10 = [[MRAVConcreteEndpoint alloc] initWithDesignatedGroupLeader:v9 outputDevices:0 preferredSuffix:0 connectionType:2];
    uint64_t v18 = 0LL;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3032000000LL;
    v21 = sub_1000C843C;
    v22 = sub_1000C844C;
    id v23 = 0LL;
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000C8454;
    block[3] = &unk_100399CB8;
    id v16 = v10;
    uint64_t v17 = &v18;
    block[4] = self;
    id v12 = v10;
    dispatch_sync(serialQueue, block);
    id v13 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
  }

  else
  {
    id v13 = 0LL;
  }

  return v13;
}

- (BOOL)devicePresenceDetected
{
  return -[MRDRemoteControlDiscoverySession devicePresenceDetected](self->_discoverySession, "devicePresenceDetected");
}

- (unsigned)discoveryMode
{
  return -[MRDRemoteControlDiscoverySession discoveryMode](self->_discoverySession, "discoveryMode");
}

- (NSArray)availableEndpoints
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_1000C843C;
  id v10 = sub_1000C844C;
  id v11 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000C8554;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NSArray)availableDistantEndpoints
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_1000C843C;
  id v10 = sub_1000C844C;
  id v11 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000C861C;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NSArray)resolvedAvailableEndpoints
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDHostedRoutingController availableDistantEndpoints](self, "availableDistantEndpoints"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "msv_map:", &stru_10039F418));

  return (NSArray *)v3;
}

- (NSDictionary)availableExternalDevices
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_1000C843C;
  id v10 = sub_1000C844C;
  id v11 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000C8770;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

- (NSArray)availableDistantOutputDevices
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_1000C843C;
  id v10 = sub_1000C844C;
  id v11 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000C8860;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NSArray)availableOutputDevices
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_1000C843C;
  id v10 = sub_1000C844C;
  id v11 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000C8928;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C89E8;
  block[3] = &unk_100398E60;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
  -[MRDHostedRoutingController _processDiscoveryObserverChanges](self, "_processDiscoveryObserverChanges");
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C8A78;
  block[3] = &unk_100398E60;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
  -[MRDHostedRoutingController _processDiscoveryObserverChanges](self, "_processDiscoveryObserverChanges");
}

- (id)externalDeviceForEndpoint:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = sub_1000C843C;
  v21 = sub_1000C844C;
  id v22 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C8BC4;
  block[3] = &unk_100399CB8;
  id v16 = &v17;
  block[4] = self;
  id v6 = v4;
  id v15 = v6;
  dispatch_sync(serialQueue, block);
  id v7 = (void *)v18[5];
  if (!v7)
  {
    id v8 = (dispatch_queue_s *)self->_serialQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000C8C00;
    v11[3] = &unk_10039C6E8;
    v11[4] = self;
    id v13 = &v17;
    id v12 = v6;
    dispatch_sync(v8, v11);

    id v7 = (void *)v18[5];
  }

  id v9 = v7;

  _Block_object_dispose(&v17, 8);
  return v9;
}

- (id)_onQueue_makeHostedExternalDeviceForEndpoint:(id)a3 didCreate:(BOOL *)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000C8CDC;
  v8[3] = &unk_10039F440;
  id v9 = self;
  id v10 = a3;
  id v5 = v10;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[MRDHostedRoutingController _onQueue_makeHostedExternalDeviceForEndpoint:didCreate:factory:]( v9,  "_onQueue_makeHostedExternalDeviceForEndpoint:didCreate:factory:",  v5,  a4,  v8));

  return v6;
}

- (id)_onQueue_makeLocalHostedExternalDeviceForEndpoint:(id)a3 didCreate:(BOOL *)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000C8D80;
  v9[3] = &unk_10039F468;
  id v10 = a3;
  id v6 = v10;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[MRDHostedRoutingController _onQueue_makeHostedExternalDeviceForEndpoint:didCreate:factory:]( self,  "_onQueue_makeHostedExternalDeviceForEndpoint:didCreate:factory:",  v6,  a4,  v9));

  return v7;
}

- (id)_onQueue_makeHostedExternalDeviceForEndpoint:(id)a3 didCreate:(BOOL *)a4 factory:(id)a5
{
  id v8 = a3;
  id v9 = (uint64_t (**)(void))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 designatedGroupLeader]);
  id v11 = 0LL;
  if ([v8 connectionType] != (id)1 && v10)
  {
    externalDeviceManager = self->_externalDeviceManager;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueIdentifier]);
    id v11 = (MRDAVHostedExternalDevice *)objc_claimAutoreleasedReturnValue( -[MRDHostedExternalDeviceManager hostedExternalDeviceForEndpointIdentifier:]( externalDeviceManager,  "hostedExternalDeviceForEndpointIdentifier:",  v13));

    if (!v11)
    {
      uint64_t v14 = v9[2](v9);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      if (v15)
      {
        id v11 = -[MRDAVHostedExternalDevice initWithExternalDevice:]( objc_alloc(&OBJC_CLASS___MRDAVHostedExternalDevice),  "initWithExternalDevice:",  v15);
        -[MRDHostedExternalDeviceManager addHostedExternalDevice:endpoint:]( self->_externalDeviceManager,  "addHostedExternalDevice:endpoint:",  v11,  v8);
        if (a4) {
          *a4 = 1;
        }
      }

      else
      {
        id v11 = 0LL;
      }
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVHostedExternalDevice externalDevice](v11, "externalDevice"));
    [v8 setExternalDevice:v16];
  }

  return v11;
}

- (id)_onQueue_makeExternalDeviceForEndpoint:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 designatedGroupLeader]);
  if ([v4 connectionType] == (id)6 && objc_msgSend(v5, "willBeLocallyHosted"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 designatedProxyGroupLeader]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MRDAVOutputContextManager sharedManager](&OBJC_CLASS___MRDAVOutputContextManager, "sharedManager"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 outputContextForOutputDevice:v6]);

    uint64_t v9 = objc_claimAutoreleasedReturnValue([v6 groupContextID]);
    if (v9
      && (id v10 = (void *)v9,
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 groupContextID]),
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 contextID]),
          unsigned __int8 v13 = [v11 isEqualToString:v12],
          v12,
          v11,
          v10,
          (v13 & 1) == 0))
    {
      uint64_t v22 = MRLogCategoryDiscovery(v14, v15);
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v4 debugName]);
        v25 = (void *)objc_claimAutoreleasedReturnValue([v6 groupContextID]);
        v26 = (void *)objc_claimAutoreleasedReturnValue([v8 contextID]);
        int v28 = 138543874;
        id v29 = v24;
        __int16 v30 = 2114;
        v31 = v25;
        __int16 v32 = 2114;
        uint64_t v33 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "Ignoring makeExternalDeviceForEndpoint=%{public}@ because groupContextID mismatch with contextID: %{public}@ != %{public}@",  (uint8_t *)&v28,  0x20u);
      }

      id v16 = 0LL;
    }

    else
    {
      id v16 = -[MRDAVOutputContextExternalDevice initWithOutputContext:]( objc_alloc(&OBJC_CLASS___MRDAVOutputContextExternalDevice),  "initWithOutputContext:",  v8);
    }
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[MRDHostedRoutingController _onQueue_makeExternalDeviceTransportForEndpoint:designatedGroupLeader:]( self,  "_onQueue_makeExternalDeviceTransportForEndpoint:designatedGroupLeader:",  v4,  v5));
    if (v6)
    {
      else {
        uint64_t v18 = &OBJC_CLASS___MRDTransportExternalDevice;
      }
      id v16 = (MRDAVOutputContextExternalDevice *)[[v18 alloc] initWithTransport:v6];
    }

    else
    {
      uint64_t v19 = MRLogCategoryDiscovery(0LL, v17);
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue([v5 uid]);
        int v28 = 138543618;
        id v29 = v4;
        __int16 v30 = 2114;
        v31 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Failed to create external device transport for %{public}@, group leader: %{public}@",  (uint8_t *)&v28,  0x16u);
      }

      id v16 = 0LL;
    }
  }

  return v16;
}

- (id)determineGroupLeaderForOutputDevices:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  uint64_t v18 = sub_1000C843C;
  uint64_t v19 = sub_1000C844C;
  id v20 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000C92D0;
  v11[3] = &unk_10039F490;
  v11[4] = self;
  id v12 = v6;
  unsigned __int8 v13 = &v15;
  unint64_t v14 = a4;
  id v8 = v6;
  dispatch_sync(serialQueue, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (NSArray)virtualOutputDevices
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = sub_1000C843C;
  id v11 = sub_1000C844C;
  id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000C93D8;
  v6[3] = &unk_100398EC8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(serialQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (void)addVirtualOutputDevice:(id)a3 forClient:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (_os_feature_enabled_impl("MediaRemote", "virtual_device"))
  {
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000C959C;
    block[3] = &unk_100398F40;
    block[4] = self;
    id v10 = v6;
    id v11 = v8;
    dispatch_sync(serialQueue, block);
  }
}

- (void)removeVirtualOutputDevicesForClient:(id)a3
{
  id v5 = a3;
  if (_os_feature_enabled_impl("MediaRemote", "virtual_device"))
  {
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000C9704;
    block[3] = &unk_100398E60;
    block[4] = self;
    id v7 = v5;
    dispatch_sync(serialQueue, block);
  }
}

- (void)_onQueue_reloadOutputDevices
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDHostedRoutingController discoverySession](self, "discoverySession"));
  id v4 = (MRDeviceInfo *)objc_claimAutoreleasedReturnValue([v3 deviceInfo]);
  deviceInfo = self->_deviceInfo;
  self->_deviceInfo = v4;

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[MRDHostedRoutingController discoverySession](self, "discoverySession"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 availableOutputDevices]);
  -[MRDHostedRoutingController _onQueue_reloadWithOutputDevices:](self, "_onQueue_reloadWithOutputDevices:", v6);
}

- (id)_onQueue_determineGroupLeaderForOutputDevices:(id)a3 availableOutputDevices:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  id v89 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 groupID]);
  uint64_t v11 = MRComputeBaseGroupID();
  uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);

  unsigned __int8 v13 = self;
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlDiscoverySession nativeOutputDevice](self->_discoverySession, "nativeOutputDevice"));
  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v8 sortedArrayUsingComparator:&stru_10039F4D0]);

  v90 = self;
  if (!a5) {
    goto LABEL_17;
  }
  uint64_t v17 = MRLogCategoryDiscovery(v15, v16);
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v14 valueForKey:@"uid"]);
    id v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "componentsJoinedByString:", @", "));
    *(_DWORD *)buf = 138543362;
    id v103 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "- Selecting devices (non-default selection options) from: %{public}@",  buf,  0xCu);

    unsigned __int8 v13 = v90;
  }

  uint64_t v23 = MRLogCategoryDiscovery(v21, v22);
  uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v26 = v25;
    if ((a5 & 2) != 0)
    {
      [v25 addObject:@"ignoreExistingLeader"];
      if ((a5 & 4) == 0)
      {
LABEL_7:
        if ((a5 & 8) == 0) {
          goto LABEL_8;
        }
        goto LABEL_139;
      }
    }

    else if ((a5 & 4) == 0)
    {
      goto LABEL_7;
    }

    [v26 addObject:@"preferExistingConnection"];
    if ((a5 & 8) == 0)
    {
LABEL_8:
      if ((a5 & 0x10) == 0) {
        goto LABEL_9;
      }
      goto LABEL_140;
    }

- (void)_onQueue_reloadWithOutputDevices:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));
  v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v4 count]));
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v41;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v41 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
        uint64_t v11 = objc_alloc(&OBJC_CLASS___MRAVDistantOutputDevice);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 descriptor]);
        unsigned __int8 v13 = -[MRAVDistantOutputDevice initWithDescriptor:](v11, "initWithDescriptor:", v12);

        unint64_t v14 = v13;
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVDistantOutputDevice uid](v14, "uid"));
        if ([v15 length])
        {
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVDistantOutputDevice groupID](v14, "groupID"));
          id v17 = [v16 length];

          if (v17)
          {
            [v35 addObject:v14];
            id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MRAVDistantOutputDevice uid](v14, "uid"));
            [v34 setObject:v10 forKeyedSubscript:v20];
            goto LABEL_12;
          }
        }

        else
        {
        }

        uint64_t v21 = MRLogCategoryDiscovery(v18, v19);
        id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v45 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Skipping invalid output device: %{public}@",  buf,  0xCu);
        }

- (void)_handleExternalDeviceConnectionStateDidChangeNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kMRExternalDeviceConnectionStateUserInfoKey]);
  unsigned int v6 = [v5 unsignedIntValue];

  if (v6 == 3)
  {
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000CAA30;
    block[3] = &unk_100399250;
    void block[4] = self;
    dispatch_sync(serialQueue, block);
  }

- (void)_handleEndpointOutputDevicesDidChangeNotification:(id)a3
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000CAA94;
  block[3] = &unk_100399250;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_handleOutputContextManagerDidReset:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000CAB18;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

- (void)_processDiscoveryObserverChanges
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000CAD24;
  block[3] = &unk_100399250;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)hostedExternalDeviceManagerDidUpdateExternalDeviceMapping:(id)a3
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000CB1A0;
  block[3] = &unk_100399250;
  void block[4] = self;
  dispatch_async(serialQueue, block);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000CB1C8;
  v5[3] = &unk_100399250;
  v5[4] = self;
  dispatch_async(&_dispatch_main_q, v5);
}

- (id)computeHostsByGroupIDForOutputDevices:(id)a3 unclusteredDevices:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "msv_compactMap:", &stru_10039F640));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v8));

  id v32 = v6;
  id v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "msv_filter:", &stru_10039F680));
  id v31 = v7;
  id v29 = (void *)objc_claimAutoreleasedReturnValue([v30 arrayByAddingObjectsFromArray:v7]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "msv_filter:", &stru_10039F6A0));
  v35 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v33 = (void *)objc_claimAutoreleasedReturnValue(-[MRDeviceInfo groupUID](self->_deviceInfo, "groupUID"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "msv_firstWhere:", &stru_10039F6C0));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVClusterController sharedController](&OBJC_CLASS___MRAVClusterController, "sharedController"));
  LODWORD(v8) = [v12 needsCommandRedirection];

  if ((_DWORD)v8)
  {
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVClusterController sharedController](&OBJC_CLASS___MRAVClusterController, "sharedController"));
    unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 clusterLeaderUID]);

    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472LL;
    v48[2] = sub_1000CB688;
    v48[3] = &unk_10039F6E8;
    id v49 = v14;
    id v15 = v14;
    uint64_t v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "msv_firstWhere:", v48));

    uint64_t v11 = (void *)v16;
  }

  unsigned __int8 v38 = -[MRDeviceInfo effectiveParentGroupContainsDiscoverableGroupLeader]( self->_deviceInfo,  "effectiveParentGroupContainsDiscoverableGroupLeader");
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id obj = v9;
  id v39 = [obj countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v39)
  {
    v36 = v11;
    uint64_t v37 = *(void *)v45;
    do
    {
      for (i = 0LL; i != v39; i = (char *)i + 1)
      {
        if (*(void *)v45 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
        if ((v38 & 1) != 0
          || ![v33 isEqual:*(void *)(*((void *)&v44 + 1) + 8 * (void)i)])
        {
          __int128 v42 = 0u;
          __int128 v43 = 0u;
          __int128 v40 = 0u;
          __int128 v41 = 0u;
          uint64_t v19 = v10;
          id v20 = v10;
          id v21 = [v20 countByEnumeratingWithState:&v40 objects:v50 count:16];
          if (v21)
          {
            id v22 = v21;
            uint64_t v23 = *(void *)v41;
            while (2)
            {
              for (j = 0LL; j != v22; j = (char *)j + 1)
              {
                if (*(void *)v41 != v23) {
                  objc_enumerationMutation(v20);
                }
                v25 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)j);
                v26 = (void *)objc_claimAutoreleasedReturnValue([v25 baseGroupID]);
                uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v25 baseParentGroupID]);
                if (([v27 isEqualToString:v18] & 1) == 0
                  && [v18 isEqualToString:v26])
                {
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v35, "setObject:forKeyedSubscript:", v25, v18);

                  goto LABEL_22;
                }
              }

              id v22 = [v20 countByEnumeratingWithState:&v40 objects:v50 count:16];
              if (v22) {
                continue;
              }
              break;
            }
          }

- (id)resolveOutputDevices:(id)a3
{
  discoverySession = self->_discoverySession;
  id v5 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000CB834;
  v9[3] = &unk_10039F750;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlDiscoverySession nativeOutputDevice](discoverySession, "nativeOutputDevice"));
  uint64_t v11 = &stru_10039F728;
  void v9[4] = self;
  id v6 = v10;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mr_map:", v9));

  return v7;
}

- (id)filterOutputDevices:(id)a3 remoteControllableOnly:(BOOL)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDHostedRoutingController resolveOutputDevices:](self, "resolveOutputDevices:", a3));
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_1000CBC2C;
  v41[3] = &unk_10039F770;
  BOOL v42 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mr_filter:", v41));

  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[MRDeviceInfo senderDefaultGroupUID](self->_deviceInfo, "senderDefaultGroupUID"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v31 = (void *)v8;
  id v32 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (v8)
  {
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    id v30 = v7;
    id v10 = v7;
    id v11 = [v10 countByEnumeratingWithState:&v37 objects:v44 count:16];
    if (!v11) {
      goto LABEL_16;
    }
    id v12 = v11;
    uint64_t v13 = *(void *)v38;
    while (1)
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 groupID]);
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 parentGroupIdentifier]);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v15 parentGroupIdentifier]);
        if (![v18 isEqualToString:v31]
          || ([v15 isAirPlayReceiverSessionActive] & 1) == 0)
        {

LABEL_13:
          continue;
        }

        unsigned __int8 v19 = [v15 parentGroupContainsDiscoverableLeader];

        if ((v19 & 1) == 0)
        {
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v15 groupID]);
          [v9 addObject:v20];

          [v32 addObject:v15];
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v37 objects:v44 count:16];
      if (!v12)
      {
LABEL_16:

        id v7 = v30;
        break;
      }
    }
  }

  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v21 = v7;
  id v22 = [v21 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v34;
    do
    {
      for (j = 0LL; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v34 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)j);
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 groupID]);
        unsigned __int8 v28 = [v9 containsObject:v27];

        if ((v28 & 1) == 0) {
          [v32 addObject:v26];
        }
      }

      id v23 = [v21 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }

    while (v23);
  }

  return v32;
}

- (BOOL)isOutputContextInUse:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 contextID]);
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[MRDHostedExternalDeviceManager availableExternalDevices]( self->_externalDeviceManager,  "availableExternalDevices"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000CBE84;
    v11[3] = &unk_10039B1C0;
    id v12 = v4;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "msv_firstWhere:", v11));
    BOOL v9 = v8 != 0LL;
  }

  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (MRDRemoteControlDiscoverySession)discoverySession
{
  return self->_discoverySession;
}

- (void)setDiscoverySession:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (NSMutableDictionary)virtualOutputDeviceDictionary
{
  return self->_virtualOutputDeviceDictionary;
}

- (void)setVirtualOutputDeviceDictionary:(id)a3
{
}

- (MRDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (void)setDeviceInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface MRDSystemEndpointControllerHelper
+ (void)fetchActiveEndpointOnQueue:(id)a3 withCompletion:(id)a4;
- (MRAVEndpoint)activeEndpoint;
- (MRDAVSystemEndpointController)controller;
- (MRDSystemEndpointControllerHelper)initWithSystemEndpointController:(id)a3;
- (MRDSystemEndpointControllerHelperEndpointInfo)endpointInfo;
- (OS_dispatch_queue)workerQueue;
- (id)lastFetchAttemptToken;
- (void)_handleActiveSystemEndpointDidChange:(id)a3;
- (void)_handleDeviceInfoDidChange:(id)a3;
- (void)_initialize;
- (void)_onWorkerQueue_maybeRetargetActiveOutputDeviceUIDForNativeOrAirPlayback:(id)a3 fromCurrentActiveEndpoint:(id)a4 withLocalDeviceInfo:(id)a5;
- (void)_onWorkerQueue_maybeRetargetActiveOutputDeviceUIDForRemoteEndpointChanges:(id)a3 fromCurrentActiveEndpoint:(id)a4 withDeviceInfo:(id)a5 previousDeviceInfo:(id)a6;
- (void)_onWorkerQueue_reevaluate;
- (void)_onWorkerQueue_reevaluateWithEndpoint:(id)a3 deviceInfo:(id)a4 previousDeviceInfo:(id)a5;
- (void)_reevaluate;
- (void)_reevaluateWithEndpoint:(id)a3 deviceInfo:(id)a4 previousDeviceInfo:(id)a5;
- (void)setActiveEndpoint:(id)a3;
- (void)setEndpointInfo:(id)a3;
- (void)setLastFetchAttemptToken:(id)a3;
@end

@implementation MRDSystemEndpointControllerHelper

- (MRDSystemEndpointControllerHelper)initWithSystemEndpointController:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MRDSystemEndpointControllerHelper;
  v6 = -[MRDSystemEndpointControllerHelper init](&v17, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_controller, a3);
    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.mediaremote.MRDSystemEndpointControllerHelper", v9);
    workerQueue = v7->_workerQueue;
    v7->_workerQueue = (OS_dispatch_queue *)v10;

    dispatch_time_t v12 = dispatch_time(0LL, 3000000000LL);
    v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDSystemEndpointControllerHelper workerQueue](v7, "workerQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100117170;
    block[3] = &unk_100399250;
    v16 = v7;
    dispatch_after(v12, v13, block);
  }

  return v7;
}

- (void)_initialize
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDSystemEndpointControllerHelper workerQueue](self, "workerQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 addObserver:self selector:"_handleActiveSystemEndpointDidChange:" name:kMRMediaRemoteActiveSystemEndpointDidChangeNotification object:0];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 addObserver:self selector:"_handleDeviceInfoDidChange:" name:kMRDeviceInfoDidChangeNotification object:0];

  -[MRDSystemEndpointControllerHelper _reevaluate](self, "_reevaluate");
}

- (void)_handleActiveSystemEndpointDidChange:(id)a3
{
}

- (void)_handleDeviceInfoDidChange:(id)a3
{
  id v4 = a3;
  id v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mr_origin"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mr_deviceInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mr_previousDeviceInfo"));

  if (([v14 isLocal] & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDSystemEndpointControllerHelper activeEndpoint](self, "activeEndpoint"));
    id v8 = (id)objc_claimAutoreleasedReturnValue([v7 origin]);
    if (v14 == v8)
    {
    }

    else
    {
      unsigned __int8 v9 = [v14 isEqual:v8];

      if ((v9 & 1) == 0) {
        goto LABEL_11;
      }
    }
  }

  id v10 = (id)objc_claimAutoreleasedReturnValue([v5 parentGroupID]);
  id v11 = (id)objc_claimAutoreleasedReturnValue([v6 parentGroupID]);
  if (v10 == v11)
  {

    goto LABEL_10;
  }

  dispatch_time_t v12 = v11;
  unsigned __int8 v13 = [v10 isEqual:v11];

  if ((v13 & 1) == 0)
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[MRDSystemEndpointControllerHelper activeEndpoint](self, "activeEndpoint"));
    -[MRDSystemEndpointControllerHelper _reevaluateWithEndpoint:deviceInfo:previousDeviceInfo:]( self,  "_reevaluateWithEndpoint:deviceInfo:previousDeviceInfo:",  v10,  v5,  v6);
LABEL_10:
  }

- (void)setActiveEndpoint:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  uint64_t v7 = _MRLogForCategory(0LL, v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVEndpoint debugName](v5->_activeEndpoint, "debugName"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 debugName]);
    int v14 = 138412546;
    v15 = v9;
    __int16 v16 = 2112;
    objc_super v17 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[MRDSystemEndpointControllerHelper] ActiveEndpoint changed from <%@> to <%@>",  (uint8_t *)&v14,  0x16u);
  }

  activeEndpoint = v5->_activeEndpoint;
  v5->_activeEndpoint = (MRAVEndpoint *)v4;
  id v12 = v4;

  objc_sync_exit(v5);
  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 deviceInfo]);
  -[MRDSystemEndpointControllerHelper _reevaluateWithEndpoint:deviceInfo:previousDeviceInfo:]( v5,  "_reevaluateWithEndpoint:deviceInfo:previousDeviceInfo:",  v12,  v13,  0LL);
}

- (MRAVEndpoint)activeEndpoint
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_activeEndpoint;
  objc_sync_exit(v2);

  return v3;
}

- (void)_reevaluate
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDSystemEndpointControllerHelper workerQueue](self, "workerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011759C;
  block[3] = &unk_100399250;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)_onWorkerQueue_reevaluate
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDSystemEndpointControllerHelper workerQueue](self, "workerQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  -[MRDSystemEndpointControllerHelper setLastFetchAttemptToken:](self, "setLastFetchAttemptToken:", v4);
  id v5 = (void *)objc_opt_class(self);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDSystemEndpointControllerHelper workerQueue](self, "workerQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100117678;
  v8[3] = &unk_1003A0548;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  [v5 fetchActiveEndpointOnQueue:v6 withCompletion:v8];
}

- (void)_reevaluateWithEndpoint:(id)a3 deviceInfo:(id)a4 previousDeviceInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDSystemEndpointControllerHelper workerQueue](self, "workerQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001177BC;
  v15[3] = &unk_100399880;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)_onWorkerQueue_reevaluateWithEndpoint:(id)a3 deviceInfo:(id)a4 previousDeviceInfo:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDSystemEndpointControllerHelper workerQueue](self, "workerQueue"));
  dispatch_assert_queue_V2(v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVSystemEndpointController activeOutputDeviceUID](self->_controller, "activeOutputDeviceUID"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 deviceInfo]);

  uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 deviceUID]);
  if (v14)
  {
    v15 = (void *)v14;
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned int v17 = [v16 supportNativeToAirPlayASERetargetting];

    if (v17) {
      -[MRDSystemEndpointControllerHelper _onWorkerQueue_maybeRetargetActiveOutputDeviceUIDForNativeOrAirPlayback:fromCurrentActiveEndpoint:withLocalDeviceInfo:]( self,  "_onWorkerQueue_maybeRetargetActiveOutputDeviceUIDForNativeOrAirPlayback:fromCurrentActiveEndpoint:withLocalDeviceInfo:",  v11,  v20,  v13);
    }
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v19 = [v18 supportASERetargetting];

  if (v19) {
    -[MRDSystemEndpointControllerHelper _onWorkerQueue_maybeRetargetActiveOutputDeviceUIDForRemoteEndpointChanges:fromCurrentActiveEndpoint:withDeviceInfo:previousDeviceInfo:]( self,  "_onWorkerQueue_maybeRetargetActiveOutputDeviceUIDForRemoteEndpointChanges:fromCurrentActiveEndpoint:withDeviceInfo :previousDeviceInfo:",  v11,  v20,  v8,  v9);
  }
}

- (void)_onWorkerQueue_maybeRetargetActiveOutputDeviceUIDForNativeOrAirPlayback:(id)a3 fromCurrentActiveEndpoint:(id)a4 withLocalDeviceInfo:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDSystemEndpointControllerHelper workerQueue](self, "workerQueue"));
  dispatch_assert_queue_V2(v10);

  if (!v13 || [v9 containsDevice:v13])
  {
    if (([v9 isAirPlayActive] & 1) == 0
      && ([v8 isRemoteEndpoint] & 1) != 0)
    {
      id v11 = @"Retarget back to local since AirPlay stopped";
LABEL_14:
      id v12 = [[MRUpdateActiveSystemEndpointRequest alloc] initWithOutputDeviceUID:v13 reason:v11];
      -[MRDAVSystemEndpointController updateSystemEndpointForRequest:event:completion:]( self->_controller,  "updateSystemEndpointForRequest:event:completion:",  v12,  9LL,  0LL);

      goto LABEL_15;
    }

    if ([v9 isAirPlayActive]
      && ([v9 parentGroupContainsDiscoverableGroupLeader] & 1) == 0
      && ([v8 isRemoteEndpoint] & 1) != 0)
    {
      id v11 = @"Retarget back to local since hijacked by UGL";
      goto LABEL_14;
    }

    if ([v9 isAirPlayActive]
      && [v9 parentGroupContainsDiscoverableGroupLeader]
      && ([v8 isRemoteEndpoint] & 1) == 0)
    {
      id v11 = @"Retarget to remote since DGL AirPlay started";
      goto LABEL_14;
    }
  }

- (void)_onWorkerQueue_maybeRetargetActiveOutputDeviceUIDForRemoteEndpointChanges:(id)a3 fromCurrentActiveEndpoint:(id)a4 withDeviceInfo:(id)a5 previousDeviceInfo:(id)a6
{
  id v9 = a3;
  if (a5 && a6)
  {
    id v16 = v9;
    id v10 = a6;
    id v11 = (id)objc_claimAutoreleasedReturnValue([a5 parentGroupID]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 parentGroupID]);

    id v13 = v12;
    if (v11 == v13)
    {

      goto LABEL_7;
    }

    uint64_t v14 = v13;
    unsigned __int8 v15 = [v11 isEqual:v13];

    id v9 = v16;
    if ((v15 & 1) == 0)
    {
      id v11 = [[MRUpdateActiveSystemEndpointRequest alloc] initWithOutputDeviceUID:v16 reason:@"Retarget to new endpoint because group leader changed"];
      -[MRDAVSystemEndpointController updateSystemEndpointForRequest:event:completion:]( self->_controller,  "updateSystemEndpointForRequest:event:completion:",  v11,  9LL,  0LL);
LABEL_7:

      id v9 = v16;
    }
  }
}

+ (void)fetchActiveEndpointOnQueue:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MRAVRoutingDiscoverySession discoverySessionWithEndpointFeatures:]( &OBJC_CLASS___MRAVRoutingDiscoverySession,  "discoverySessionWithEndpointFeatures:",  8LL));
  [v7 setDiscoveryMode:3];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);

  id v11 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@<%@>",  @"MRDSystemEndpointControllerHelper.fetchActiveEndpointOnQueue",  v10);
  uint64_t v13 = _MRLogForCategory(10LL, v12);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v34 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100117DAC;
  v26[3] = &unk_10039CA18;
  id v27 = v7;
  v28 = @"MRDSystemEndpointControllerHelper.fetchActiveEndpointOnQueue";
  id v15 = v10;
  id v29 = v15;
  id v30 = v8;
  id v31 = v5;
  id v32 = v6;
  id v16 = v6;
  id v17 = v5;
  id v18 = v8;
  id v19 = v7;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100118008;
  v22[3] = &unk_1003A1710;
  v23 = @"MRDSystemEndpointControllerHelper.fetchActiveEndpointOnQueue";
  id v24 = v15;
  v25 = objc_retainBlock(v26);
  id v20 = v25;
  id v21 = v15;
  MRAVEndpointResolveActiveSystemEndpointWithTimeout(v17, v22, 7.0);
}

- (MRDAVSystemEndpointController)controller
{
  return self->_controller;
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (MRDSystemEndpointControllerHelperEndpointInfo)endpointInfo
{
  return self->_endpointInfo;
}

- (void)setEndpointInfo:(id)a3
{
}

- (id)lastFetchAttemptToken
{
  return self->_lastFetchAttemptToken;
}

- (void)setLastFetchAttemptToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
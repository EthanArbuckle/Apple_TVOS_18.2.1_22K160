@interface MRDAVSystemEndpointController
- (BOOL)_hasPersonalDeviceForContext:(id)a3;
- (BOOL)_requiresConnectionToUpdate:(id)a3;
- (BOOL)_requiresPlaybackToUpdate:(id)a3;
- (MRDAVSystemEndpointController)initWithRoutingController:(id)a3;
- (MRDAVSystemEndpointControllerDelegate)delegate;
- (NSArray)recentlyDismissedRecommendationsInfo;
- (NSDictionary)systemEndpointInfo;
- (NSString)activeOutputDeviceUID;
- (id)_isAllowedToUpdateRecommendationForOutputDevice:(id)a3 recentlyDismissed:(id)a4;
- (id)_onSerialQueue_calculateActiveEndpoint:(int64_t)a3 event:(int64_t)a4 reason:(id *)a5 suppressPairedDeviceSync:(BOOL *)a6;
- (id)_onSerialQueue_calculateProactiveEndpointForEvent:(int64_t)a3 reason:(id *)a4;
- (id)_onSerialQueue_calculateProactiveRecommendedEndpoint:(id *)a3;
- (id)_onSerialQueue_calculateRecommendedEndpointForEvent:(int64_t)a3 reason:(id *)a4;
- (id)_onSerialQueue_calculateUserSelectedEndpointForEvent:(int64_t)a3 reason:(id *)a4 suppressPairedDeviceSync:(BOOL *)a5;
- (id)_onSerialQueue_updateSystemEndpoint:(id)a3 event:(int64_t)a4 eventReason:(id)a5;
- (id)_validate:(id)a3;
- (id)activeOutputDeviceUID:(int64_t)a3;
- (id)originClientForDeviceUID:(id)a3;
- (void)_deviceInfoDidChange:(id)a3;
- (void)_handleIsPlayingDidChangeNotification:(id)a3;
- (void)_handleOriginDidRegisterNotification:(id)a3;
- (void)_handleOriginDidUnregisterNotification:(id)a3;
- (void)_handleOutputContextDidAddOutputDeviceNotification:(id)a3;
- (void)_initializeSystemEndpointInfo;
- (void)_onSerialQueue_clearActiveEndpointType:(int64_t)a3 outputDeviceUID:(id)a4 event:(int64_t)a5 reason:(id)a6 clientBundleIdentifier:(id)a7;
- (void)_onSerialQueue_maybeSetupPlaybackTimerForEvent:(int64_t)a3;
- (void)_onSerialQueue_maybeSetupUserSelectedTimerForEvent:(int64_t)a3;
- (void)_onSerialQueue_reconnectToOutputDevice:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)_onSerialQueue_reevaluateActiveEndpoint:(int64_t)a3 event:(int64_t)a4 changeType:(int64_t)a5 eventReason:(id)a6 clientBundleIdentifier:(id)a7;
- (void)_onSerialQueue_reevaluateActiveEndpoint:(int64_t)a3 event:(int64_t)a4 eventReason:(id)a5 clientBundleIdentifier:(id)a6;
- (void)_storeRecentlyDismissedRecommendationForOutputDeviceUID:(id)a3 disableDuration:(double)a4;
- (void)_writeSystemEndpointInfo:(id)a3 recentlyDismissedRecommendationsInfo:(id)a4;
- (void)clearActiveEndpointType:(int64_t)a3 outputDeviceUID:(id)a4 event:(int64_t)a5 reason:(id)a6 clientBundleIdentifier:(id)a7;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)updateSystemEndpointForRequest:(id)a3;
- (void)updateSystemEndpointForRequest:(id)a3 completion:(id)a4;
- (void)updateSystemEndpointForRequest:(id)a3 event:(int64_t)a4 completion:(id)a5;
- (void)updateSystemEndpointForRequest:(id)a3 event:(int64_t)a4 eventReason:(id)a5 completion:(id)a6;
@end

@implementation MRDAVSystemEndpointController

- (MRDAVSystemEndpointController)initWithRoutingController:(id)a3
{
  id v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___MRDAVSystemEndpointController;
  v6 = -[MRDAVSystemEndpointController init](&v31, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_routingController, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 nowPlayingServer]);
    nowPlayingServer = v7->_nowPlayingServer;
    v7->_nowPlayingServer = (MRDNowPlayingServer *)v9;

    v11 = (objc_class *)objc_opt_class(v7);
    Name = class_getName(v11);
    dispatch_queue_attr_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v13);
    dispatch_queue_t v15 = dispatch_queue_create(Name, v14);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v15;

    v17 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.mediaremote");
    userDefaults = v7->_userDefaults;
    v7->_userDefaults = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue( +[MRAVOutputContext sharedSystemAudioContext]( &OBJC_CLASS___MRAVOutputContext,  "sharedSystemAudioContext"));
    v7->_cachedHasPersonalDevices = -[MRDAVSystemEndpointController _hasPersonalDeviceForContext:]( v7,  "_hasPersonalDeviceForContext:",  v19);

    v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    systemEndpointEntries = v7->_systemEndpointEntries;
    v7->_systemEndpointEntries = v20;

    v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    recentlyDismissedRecommendations = v7->_recentlyDismissedRecommendations;
    v7->_recentlyDismissedRecommendations = v22;

    -[MRDAVSystemEndpointController _initializeSystemEndpointInfo](v7, "_initializeSystemEndpointInfo");
    v24 = -[MRDSystemEndpointControllerHelper initWithSystemEndpointController:]( objc_alloc(&OBJC_CLASS___MRDSystemEndpointControllerHelper),  "initWithSystemEndpointController:",  v7);
    helper = v7->_helper;
    v7->_helper = v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v27 = kMRMediaRemoteOriginDidRegisterNotification;
    [v26 addObserver:v7 selector:"_handleOriginDidRegisterNotification:" name:kMRMediaRemoteOriginDidRegisterNotification object:0];
    [v26 addObserver:v7 selector:"_handleOriginDidUnregisterNotification:" name:kMRMediaRemoteOriginDidUnregisterNotification object:0];
    uint64_t v28 = MRAVOutputContextDidAddOutputDeviceNotification;
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[MRAVOutputContext sharedSystemAudioContext]( &OBJC_CLASS___MRAVOutputContext,  "sharedSystemAudioContext"));
    [v26 addObserver:v7 selector:"_handleOutputContextDidAddOutputDeviceNotification:" name:v28 object:v29];

    [v26 addObserver:v7 selector:"_handleIsPlayingDidChangeNotification:" name:kMRMediaRemoteOriginNowPlayingApplicationIsPlayingDidChangeNotification object:0];
    [v26 addObserver:v7 selector:"_deviceInfoDidChange:" name:kMRDeviceInfoDidChangeNotification object:0];
    [v26 addObserver:v7 selector:"_deviceInfoDidChange:" name:v27 object:0];
  }

  return v7;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MRDAVSystemEndpointController;
  -[MRDAVSystemEndpointController dealloc](&v4, "dealloc");
}

- (NSDictionary)systemEndpointInfo
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  serialQueue = self->_serialQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000040EC;
  v9[3] = &unk_100398E60;
  v9[4] = self;
  id v5 = v3;
  v10 = v5;
  msv_dispatch_sync_on_queue(serialQueue, v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

- (NSArray)recentlyDismissedRecommendationsInfo
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_100004580;
  v10 = sub_100004590;
  id v11 = 0LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100004598;
  v5[3] = &unk_100398EC8;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NSString)activeOutputDeviceUID
{
  return (NSString *)-[MRDAVSystemEndpointController activeOutputDeviceUID:](self, "activeOutputDeviceUID:", 0LL);
}

- (id)activeOutputDeviceUID:(int64_t)a3
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100004580;
  id v11 = sub_100004590;
  id v12 = 0LL;
  serialQueue = self->_serialQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000046FC;
  v6[3] = &unk_100398EF0;
  v6[4] = self;
  v6[5] = &v7;
  v6[6] = a3;
  msv_dispatch_sync_on_queue(serialQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (BOOL)_requiresConnectionToUpdate:(id)a3
{
  id v3 = a3;
  if ([v3 type] == (id)2)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 outputDeviceUID]);
    BOOL v5 = v4 != 0LL;
  }

  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_requiresPlaybackToUpdate:(id)a3
{
  return [a3 type] == (id)2;
}

- (id)_validate:(id)a3
{
  id v3 = a3;
  if ([v3 type] != (id)2)
  {
LABEL_4:
    id v4 = 0LL;
    goto LABEL_6;
  }

  id v4 = (NSError *)objc_claimAutoreleasedReturnValue([v3 outputDeviceUID]);
  if (v4)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned __int8 v6 = [v5 enableRouteRecommendations];

    if ((v6 & 1) == 0)
    {
      uint64_t v7 = objc_alloc(&OBJC_CLASS___NSError);
      active = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription(2LL);
      id v4 = -[NSError initWithMRError:format:]( v7,  "initWithMRError:format:",  3LL,  @"%@ is disabled via Settings",  active);

      goto LABEL_6;
    }

    goto LABEL_4;
  }

- (void)updateSystemEndpointForRequest:(id)a3 event:(int64_t)a4 eventReason:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v49 = a5;
  id v10 = a6;
  v46 = v9;
  id v11 = [v9 copy];
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[MRDeviceInfoRequest localDeviceInfo](&OBJC_CLASS___MRDeviceInfoRequest, "localDeviceInfo"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 outputDeviceUID]);
  dispatch_queue_attr_t v13 = (void *)objc_claimAutoreleasedReturnValue([v48 WHAIdentifier]);
  unsigned int v14 = [v12 isEqualToString:v13];

  if (v14) {
    [v11 setOutputDeviceUID:0];
  }
  dispatch_queue_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  v16 = objc_alloc(&OBJC_CLASS___NSString);
  active = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription([v11 type]);
  v18 = -[NSString initWithFormat:](v16, "initWithFormat:", @"SystemEndpointController.update%@", active);

  v47 = v18;
  v19 = -[MRRequestDetails initWithName:requestID:reason:]( objc_alloc(&OBJC_CLASS___MRRequestDetails),  "initWithName:requestID:reason:",  v18,  0LL,  v49);
  v20 = objc_alloc(&OBJC_CLASS___NSMutableString);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails name](v19, "name"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails requestID](v19, "requestID"));
  v23 = -[NSMutableString initWithFormat:](v20, "initWithFormat:", @"%@<%@>", v21, v22);

  v24 = (void *)objc_claimAutoreleasedReturnValue([v11 outputDeviceUID]);
  if (v24)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue([v11 outputDeviceUID]);
    -[NSMutableString appendFormat:](v23, "appendFormat:", @" for %@", v26);
  }

  uint64_t v27 = _MRLogForCategory(10LL, v25);
  uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v23;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472LL;
  v62[2] = sub_100004E9C;
  v62[3] = &unk_100398F18;
  id v29 = v11;
  id v63 = v29;
  v30 = v19;
  v64 = v30;
  id v45 = v15;
  id v65 = v45;
  id v44 = v10;
  id v66 = v44;
  objc_super v31 = objc_retainBlock(v62);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVSystemEndpointController _validate:](self, "_validate:", v29));
  if (!v32)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100005174;
    block[3] = &unk_100398F40;
    block[4] = self;
    id v35 = v29;
    id v60 = v35;
    id v36 = v33;
    id v61 = v36;
    dispatch_sync(serialQueue, block);
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v68 = 0x3032000000LL;
    v69 = sub_100004580;
    v70 = sub_100004590;
    id v71 = 0LL;
    v37 = dispatch_group_create();
    if (-[MRDAVSystemEndpointController _requiresPlaybackToUpdate:](self, "_requiresPlaybackToUpdate:", v35))
    {
      dispatch_group_enter(v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue([v35 outputDeviceUID]);
      v58[0] = _NSConcreteStackBlock;
      v58[1] = 3221225472LL;
      v58[2] = sub_100005208;
      v58[3] = &unk_100398F90;
      v58[5] = &buf;
      v58[4] = v37;
      +[MRAVEndpoint connectToEndpointContainingOutputDeviceUID:options:details:completion:]( &OBJC_CLASS___MRAVEndpoint,  "connectToEndpointContainingOutputDeviceUID:options:details:completion:",  v38,  0LL,  v30,  v58);
      v39 = v58;
    }

    else
    {
      if (!-[MRDAVSystemEndpointController _requiresConnectionToUpdate:](self, "_requiresConnectionToUpdate:", v35))
      {
LABEL_14:
        v41 = (dispatch_queue_s *)self->_serialQueue;
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472LL;
        v50[2] = sub_10000539C;
        v50[3] = &unk_100398FB8;
        p___int128 buf = &buf;
        v50[4] = self;
        id v51 = v35;
        id v52 = v36;
        int64_t v56 = a4;
        id v53 = v49;
        v54 = v31;
        id v42 = v36;
        dispatch_group_notify(v37, v41, v50);

        _Block_object_dispose(&buf, 8);
        goto LABEL_15;
      }

      dispatch_group_enter(v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue([v35 outputDeviceUID]);
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472LL;
      v57[2] = sub_10000534C;
      v57[3] = &unk_100398F90;
      v57[5] = &buf;
      v57[4] = v37;
      +[MRAVEndpoint connectToEndpointContainingOutputDeviceUID:options:details:completion:]( &OBJC_CLASS___MRAVEndpoint,  "connectToEndpointContainingOutputDeviceUID:options:details:completion:",  v38,  0LL,  v30,  v57);
      v39 = v57;
    }

    v40 = (id *)(v39 + 4);

    goto LABEL_14;
  }

  ((void (*)(void *, void *))v31[2])(v31, v32);
LABEL_15:
}

- (void)updateSystemEndpointForRequest:(id)a3 event:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue([v9 reason]);
  -[MRDAVSystemEndpointController updateSystemEndpointForRequest:event:eventReason:completion:]( self,  "updateSystemEndpointForRequest:event:eventReason:completion:",  v9,  a4,  v10,  v8);
}

- (void)updateSystemEndpointForRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue([v7 reason]);
  -[MRDAVSystemEndpointController updateSystemEndpointForRequest:event:eventReason:completion:]( self,  "updateSystemEndpointForRequest:event:eventReason:completion:",  v7,  1LL,  v8,  v6);
}

- (void)updateSystemEndpointForRequest:(id)a3
{
}

- (void)clearActiveEndpointType:(int64_t)a3 outputDeviceUID:(id)a4 event:(int64_t)a5 reason:(id)a6 clientBundleIdentifier:(id)a7
{
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000056B8;
  block[3] = &unk_100398FE0;
  block[4] = self;
  id v20 = v12;
  int64_t v23 = a3;
  int64_t v24 = a5;
  id v21 = v13;
  id v22 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_sync(serialQueue, block);
}

- (void)_onSerialQueue_clearActiveEndpointType:(int64_t)a3 outputDeviceUID:(id)a4 event:(int64_t)a5 reason:(id)a6 clientBundleIdentifier:(id)a7
{
  id v17 = a4;
  id v12 = a6;
  id v13 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v14 = (id)objc_claimAutoreleasedReturnValue(-[MRDAVSystemEndpointController activeOutputDeviceUID:](self, "activeOutputDeviceUID:", a3));
  if (v14 == v17 || [v17 isEqualToString:v14])
  {
    id v15 = [[MRUpdateActiveSystemEndpointRequest alloc] initWithOutputDeviceUID:0 reason:v12];
    [v15 setClientBundleIdentifier:v13];
    [v15 setType:a3];
    id v16 =  -[MRDAVSystemEndpointController _onSerialQueue_updateSystemEndpoint:event:eventReason:]( self,  "_onSerialQueue_updateSystemEndpoint:event:eventReason:",  v15,  a5,  v12);
  }
}

- (id)originClientForDeviceUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[MRDHostedRoutingController availableEndpoints](self->_routingController, "availableEndpoints"));
    id v5 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v5)
    {
      id v6 = v5;
      id v7 = 0LL;
      uint64_t v8 = *(void *)v26;
      id v23 = v4;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
          if (objc_msgSend(v10, "containsOutputDeviceWithUID:", v4, v23))
          {
            id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 externalDevice]);
            id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 customOrigin]);

            id v13 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingServer originClientForOrigin:]( self->_nowPlayingServer,  "originClientForOrigin:",  v12));
            if (!v7) {
              goto LABEL_11;
            }
            id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 registrationDate]);
            id v15 = self;
            id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 registrationDate]);
            id v17 = v6;
            uint64_t v18 = v8;
            id v19 = [v14 compare:v16];

            self = v15;
            BOOL v20 = v19 == (id)1;
            uint64_t v8 = v18;
            id v6 = v17;
            if (v20)
            {
LABEL_11:
              id v21 = v13;

              id v7 = v21;
            }

            id v4 = v23;
          }
        }

        id v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }

      while (v6);
    }

    else
    {
      id v7 = 0LL;
    }
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer localOriginClient](self->_nowPlayingServer, "localOriginClient"));
  }

  return v7;
}

- (void)_handleOriginDidRegisterNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  uint64_t v5 = MRGetDeviceInfoFromUserInfo();
  id v16 = (id)objc_claimAutoreleasedReturnValue(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVSystemEndpointController activeOutputDeviceUID:](self, "activeOutputDeviceUID:", 0LL));
  id v7 = objc_alloc(&OBJC_CLASS___NSString);
  active = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription(0LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v16 deviceUID]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v16 name]);
  id v11 = -[NSString initWithFormat:](v7, "initWithFormat:", @"%@ origin registered <%@> (<%@>) ", active, v9, v10);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v16 deviceUID]);
  LODWORD(v9) = [v6 isEqualToString:v12];

  if ((_DWORD)v9)
  {
    id v13 = [[MRUpdateActiveSystemEndpointRequest alloc] initWithOutputDeviceUID:v6 reason:v11];
    [v13 setChangeType:1];
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 bundleIdentifier]);
    [v13 setClientBundleIdentifier:v15];

    -[MRDAVSystemEndpointController updateSystemEndpointForRequest:event:eventReason:completion:]( self,  "updateSystemEndpointForRequest:event:eventReason:completion:",  v13,  3LL,  v11,  0LL);
  }
}

- (void)_handleOriginDidUnregisterNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  uint64_t v5 = MRGetOriginFromUserInfo();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005BD0;
  block[3] = &unk_100398E60;
  id v10 = v6;
  id v11 = self;
  id v8 = v6;
  dispatch_sync(serialQueue, block);
}

- (void)_handleOutputContextDidAddOutputDeviceNotification:(id)a3
{
  id v9 = (id)objc_claimAutoreleasedReturnValue([a3 object]);
  unsigned int v4 = -[MRDAVSystemEndpointController _hasPersonalDeviceForContext:](self, "_hasPersonalDeviceForContext:");
  BOOL v5 = v4;
  if (v4 && !self->_cachedHasPersonalDevices)
  {
    id v6 = [[MRUpdateActiveSystemEndpointRequest alloc] initWithOutputDeviceUID:0 reason:@"personal device was attached"];
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
    [v6 setClientBundleIdentifier:v8];

    -[MRDAVSystemEndpointController updateSystemEndpointForRequest:](self, "updateSystemEndpointForRequest:", v6);
  }

  self->_cachedHasPersonalDevices = v5;
}

- (void)_handleIsPlayingDidChangeNotification:(id)a3
{
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([a3 playerPath]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 client]);
  unsigned int v6 = [v5 processIdentifier];

  uint64_t v7 = 5LL;
  if (!v6) {
    uint64_t v7 = 7LL;
  }
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006020;
  block[3] = &unk_100399030;
  id v11 = v4;
  id v12 = self;
  uint64_t v13 = v7;
  id v9 = v4;
  dispatch_sync(serialQueue, block);
}

- (void)_onSerialQueue_reevaluateActiveEndpoint:(int64_t)a3 event:(int64_t)a4 eventReason:(id)a5 clientBundleIdentifier:(id)a6
{
}

- (void)_onSerialQueue_reevaluateActiveEndpoint:(int64_t)a3 event:(int64_t)a4 changeType:(int64_t)a5 eventReason:(id)a6 clientBundleIdentifier:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  uint64_t v15 = _MRLogForCategory(0LL, v14);
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_1002B44E8(a3, (uint64_t)v12, v16);
  }

  unsigned __int8 v22 = 0;
  id v21 = 0LL;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVSystemEndpointController _onSerialQueue_calculateActiveEndpoint:event:reason:suppressPairedDeviceSync:]( self,  "_onSerialQueue_calculateActiveEndpoint:event:reason:suppressPairedDeviceSync:",  a3,  a4,  &v21,  &v22));
  id v18 = v21;
  id v19 = [[MRUpdateActiveSystemEndpointRequest alloc] initWithOutputDeviceUID:v17 reason:v18];
  [v19 setChangeType:a5];
  [v19 setClientBundleIdentifier:v13];

  [v19 setType:a3];
  [v19 setSuppressPairedDeviceSync:v22];
  id v20 =  -[MRDAVSystemEndpointController _onSerialQueue_updateSystemEndpoint:event:eventReason:]( self,  "_onSerialQueue_updateSystemEndpoint:event:eventReason:",  v19,  a4,  v12);
}

- (id)_onSerialQueue_calculateActiveEndpoint:(int64_t)a3 event:(int64_t)a4 reason:(id *)a5 suppressPairedDeviceSync:(BOOL *)a6
{
  switch(a3)
  {
    case 0LL:
      id v11 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVSystemEndpointController _onSerialQueue_calculateUserSelectedEndpointForEvent:reason:suppressPairedDeviceSync:]( self,  "_onSerialQueue_calculateUserSelectedEndpointForEvent:reason:suppressPairedDeviceSync:",  a4,  a5,  a6));
      break;
    case 1LL:
      id v11 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVSystemEndpointController _onSerialQueue_calculateProactiveEndpointForEvent:reason:]( self,  "_onSerialQueue_calculateProactiveEndpointForEvent:reason:",  a4,  a5));
      break;
    case 2LL:
      id v11 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVSystemEndpointController _onSerialQueue_calculateRecommendedEndpointForEvent:reason:]( self,  "_onSerialQueue_calculateRecommendedEndpointForEvent:reason:",  a4,  a5));
      break;
    case 3LL:
      id v11 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVSystemEndpointController _onSerialQueue_calculateProactiveRecommendedEndpoint:]( self,  "_onSerialQueue_calculateProactiveRecommendedEndpoint:",  a5));
      break;
    default:
      id v11 = 0LL;
      break;
  }

  return v11;
}

- (id)_onSerialQueue_calculateUserSelectedEndpointForEvent:(int64_t)a3 reason:(id *)a4 suppressPairedDeviceSync:(BOOL *)a5
{
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_systemEndpointEntries,  "objectForKeyedSubscript:",  &off_1003BB1C8));
  id v9 = v8;
  if (!v8)
  {
    id v18 = objc_alloc(&OBJC_CLASS___NSString);
    active = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription(0LL);
    id v17 = -[NSString initWithFormat:](v18, "initWithFormat:", @"No %@SystemEndpoint", active);
    goto LABEL_7;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 outputDeviceUID]);
  active = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVSystemEndpointController originClientForDeviceUID:](self, "originClientForDeviceUID:", v10));

  [active timeSincePlaying];
  double v13 = v12;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v9 date]);
  [v14 timeIntervalSinceNow];
  double v16 = v15;

  if (([v9 supportsIdleReset] & 1) == 0)
  {
    *a4 = @"doesn't participate in idle reset";
LABEL_9:
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v9 outputDeviceUID]);
    goto LABEL_10;
  }

  if (a3 != 6 || !active)
  {
    if (active)
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
      [v21 mediaRecentlyPlayedInterval];
      double v23 = v22;

      if (v13 < v23)
      {
        *a4 =  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"was playing recently <%lf> seconds ago",  *(void *)&v13);
        goto LABEL_9;
      }
    }

    if (a3 == 2)
    {
      int64_t v24 = objc_alloc(&OBJC_CLASS___NSString);
      __int128 v25 = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription(0LL);
      __int128 v26 = -[NSString initWithFormat:]( v24,  "initWithFormat:",  @"was not <%@> sort of recently <%lf> seconds ago",  v25,  *(void *)&v13);
    }

    else
    {
      double v27 = -v16;
      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
      [v28 endpointRecentlyUserSelectedInterval];
      double v30 = v29;

      objc_super v31 = objc_alloc(&OBJC_CLASS___NSString);
      if (v30 > v27)
      {
        v32 = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription(0LL);
        *a4 =  -[NSString initWithFormat:]( v31,  "initWithFormat:",  @"was <%@> recently <%lf> seconds ago",  v32,  *(void *)&v27);

        goto LABEL_9;
      }

      if (active)
      {
        [active timeSincePlaying];
        uint64_t v34 = v33;
        __int128 v25 = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription(0LL);
        id v35 = (void *)objc_claimAutoreleasedReturnValue([v9 date]);
        [v35 timeIntervalSinceNow];
        *a4 =  -[NSString initWithFormat:]( v31,  "initWithFormat:",  @"was not playing recently <%lf> ago and was not <%@> recently <%lf> seconds ago",  v34,  v25,  -v36);

        goto LABEL_21;
      }

      __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v9 outputDeviceUID]);
      __int128 v26 = -[NSString initWithFormat:]( v31,  "initWithFormat:",  @"Could not find origin with deviceUID = <%@>",  v25,  v37);
    }

    *a4 = v26;
LABEL_21:

    id v19 = 0LL;
    goto LABEL_10;
  }

  id v17 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"was not playing sort of recently <%lf> seconds ago",  *(void *)&v13);
LABEL_7:
  id v19 = 0LL;
  *a4 = v17;
LABEL_10:

  return v19;
}

- (id)_onSerialQueue_calculateProactiveEndpointForEvent:(int64_t)a3 reason:(id *)a4
{
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer localOriginClient](self->_nowPlayingServer, "localOriginClient"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 activeNowPlayingClient]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 activePlayerClient]);

  if ([v8 isPlaying])
  {
    id v9 = objc_alloc(&OBJC_CLASS___NSString);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 playerPath]);
    id v11 = -[NSString initWithFormat:](v9, "initWithFormat:", @"local activePlayer %@ is playing", v10);
    double v12 = 0LL;
    *a4 = v11;
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_systemEndpointEntries,  "objectForKeyedSubscript:",  &off_1003BB1C8));
    double v13 = (void *)objc_claimAutoreleasedReturnValue([v10 outputDeviceUID]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVSystemEndpointController originClientForDeviceUID:](self, "originClientForDeviceUID:", v13));
    if (v14)
    {
      *a4 = (id)MRMediaRemoteActiveEndpointTypeCopyDescription(0LL);
      id v15 = v13;
    }

    else
    {
      *a4 = @"Fallback to previous";
      id v15 = (id)objc_claimAutoreleasedReturnValue(-[MRDAVSystemEndpointController activeOutputDeviceUID:](self, "activeOutputDeviceUID:", 1LL));
    }

    double v12 = v15;
  }

  return v12;
}

- (id)_onSerialQueue_calculateRecommendedEndpointForEvent:(int64_t)a3 reason:(id *)a4
{
  systemEndpointEntries = self->_systemEndpointEntries;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 2LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](systemEndpointEntries, "objectForKeyedSubscript:", v7));

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 outputDeviceUID]);
    active = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVSystemEndpointController originClientForDeviceUID:](self, "originClientForDeviceUID:", v9));

    id v11 = (void *)objc_claimAutoreleasedReturnValue([active activeNowPlayingClient]);
    double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 activePlayerClient]);

    if ([v12 isPlaying])
    {
      double v13 = objc_alloc(&OBJC_CLASS___NSString);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 playerPath]);
      *a4 = -[NSString initWithFormat:](v13, "initWithFormat:", @"%@ is playing", v14);

      id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 outputDeviceUID]);
    }

    else
    {
      if (v12)
      {
        id v17 = objc_alloc(&OBJC_CLASS___NSString);
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 playerPath]);
        id v19 = -[NSString initWithFormat:](v17, "initWithFormat:", @"%@ is not playing", v18);
      }

      else
      {
        id v20 = objc_alloc(&OBJC_CLASS___NSString);
        if (active)
        {
          id v18 = (void *)objc_claimAutoreleasedReturnValue([active playerPath]);
          id v19 = -[NSString initWithFormat:](v20, "initWithFormat:", @"%@ does not have a now playing app", v18);
        }

        else
        {
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 outputDeviceUID]);
          id v19 = -[NSString initWithFormat:]( v20,  "initWithFormat:",  @"Could not find origin with deviceUID = <%@>",  v18);
        }
      }

      *a4 = v19;

      id v15 = 0LL;
    }
  }

  else
  {
    double v16 = objc_alloc(&OBJC_CLASS___NSString);
    active = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription(2LL);
    id v15 = 0LL;
    *a4 = -[NSString initWithFormat:](v16, "initWithFormat:", @"No %@SystemEndpoint", active);
  }

  return v15;
}

- (id)_onSerialQueue_calculateProactiveRecommendedEndpoint:(id *)a3
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer localOriginClient](self->_nowPlayingServer, "localOriginClient"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 activeNowPlayingClient]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 activePlayerClient]);

  if ([v7 isPlaying])
  {
    id v8 = objc_alloc(&OBJC_CLASS___NSString);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 playerPath]);
    id v10 = -[NSString initWithFormat:](v8, "initWithFormat:", @"local activePlayer %@ is playing", v9);
    id v11 = 0LL;
    *a3 = v10;
  }

  else
  {
    *a3 = @"Fallback to recommended";
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_systemEndpointEntries,  "objectForKeyedSubscript:",  &off_1003BB1E0));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 outputDeviceUID]);
  }

  return v11;
}

- (id)_isAllowedToUpdateRecommendationForOutputDevice:(id)a3 recentlyDismissed:(id)a4
{
  id v5 = a3;
  unsigned int v6 = v5;
  if (v5)
  {
    v32 = _NSConcreteStackBlock;
    uint64_t v33 = 3221225472LL;
    uint64_t v34 = sub_100006D0C;
    id v35 = &unk_100399058;
    id v7 = v5;
    id v36 = v7;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "msv_firstWhere:", &v32));
    id v9 = v8;
    if (!v8)
    {
      __int128 v26 = 0LL;
LABEL_12:

      goto LABEL_13;
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 date]);
    [v9 disableDuration];
    id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dateByAddingTimeInterval:"));

    double v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    id v13 = [v12 compare:v11];

    if (v13 == (id)-1LL)
    {
      double v27 = objc_alloc(&OBJC_CLASS___NSError);
      active = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription(2LL);
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v9 date]);
      double v22 = (void *)objc_claimAutoreleasedReturnValue([v9 date]);
      [v22 timeIntervalSinceNow];
      uint64_t v29 = v28;
      [v11 timeIntervalSinceNow];
      __int128 v26 = -[NSError initWithMRError:format:]( v27,  "initWithMRError:format:",  3LL,  @"Cannot update the %@ yet. Was last dismissed at %@ (%lf seconds ago). Cannot set until %@ (%lf more seconds)",  active,  v21,  v29,  v11,  v30,  v32,  v33,  v34,  v35);
    }

    else
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 nowPlayingServer]);
      active = (void *)objc_claimAutoreleasedReturnValue([v15 originClientForDeviceUID:v7]);

      id v17 = (void *)objc_claimAutoreleasedReturnValue([active devicePlaybackSessionID]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v9 devicePlaybackSessionID]);
      unsigned int v19 = [v17 isEqualToString:v18];

      if (!v19)
      {
        __int128 v26 = 0LL;
        goto LABEL_11;
      }

      id v20 = objc_alloc(&OBJC_CLASS___NSError);
      id v21 = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription(2LL);
      double v22 = (void *)objc_claimAutoreleasedReturnValue([v9 devicePlaybackSessionID]);
      double v23 = (void *)objc_claimAutoreleasedReturnValue([v9 date]);
      int64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v9 date]);
      [v24 timeIntervalSinceNow];
      __int128 v26 = -[NSError initWithMRError:format:]( v20,  "initWithMRError:format:",  3LL,  @"Cannot update the %@ to outputDeviceUID=%@ while devicePlaybackSessionID=%@, it was already dismissed at %@ (%lf seconds ago)",  v21,  v7,  v22,  v23,  v25,  v32,  v33,  v34,  v35);
    }

LABEL_11:
    goto LABEL_12;
  }

  __int128 v26 = 0LL;
LABEL_13:

  return v26;
}

- (void)_storeRecentlyDismissedRecommendationForOutputDeviceUID:(id)a3 disableDuration:(double)a4
{
  id v6 = a3;
  if (v6 && a4 > 0.0)
  {
    recentlyDismissedRecommendations = self->_recentlyDismissedRecommendations;
    uint64_t v20 = 3221225472LL;
    id v21 = sub_100006ECC;
    double v22 = &unk_100399058;
    id v17 = v6;
    unsigned int v19 = _NSConcreteStackBlock;
    id v8 = v6;
    id v23 = v8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray msv_firstWhere:](recentlyDismissedRecommendations, "msv_firstWhere:", &v19));
    if (v9) {
      -[NSMutableArray removeObject:](self->_recentlyDismissedRecommendations, "removeObject:", v9);
    }
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[MRDMediaRemoteServer server]( &OBJC_CLASS___MRDMediaRemoteServer,  "server",  v17,  v19,  v20,  v21,  v22));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 nowPlayingServer]);
    double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 originClientForDeviceUID:v8]);

    id v13 = objc_alloc(&OBJC_CLASS___MRDSystemEndpointControllerRecentlyDismissedRecommendation);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 devicePlaybackSessionID]);
    double v16 = -[MRDSystemEndpointControllerRecentlyDismissedRecommendation initWithOutputDevice:date:disableDuration:devicePlaybackSessionID:]( v13,  "initWithOutputDevice:date:disableDuration:devicePlaybackSessionID:",  v8,  v14,  v15,  a4);

    -[NSMutableArray addObject:](self->_recentlyDismissedRecommendations, "addObject:", v16);
    id v6 = v18;
  }
}

- (id)_onSerialQueue_updateSystemEndpoint:(id)a3 event:(int64_t)a4 eventReason:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v9 = [v7 type];
  systemEndpointEntries = self->_systemEndpointEntries;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v9));
  double v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( systemEndpointEntries,  "objectForKeyedSubscript:",  v11));

  id v13 = (id)objc_claimAutoreleasedReturnValue([v12 outputDeviceUID]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v7 outputDeviceUID]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  double v16 = (void *)objc_claimAutoreleasedReturnValue([v15 groupSessionServer]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 sessionManager]);

  v90 = v17;
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 session]);
  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);
  unsigned int v20 = [v19 isEqualToString:v14];

  id v21 = v13;
  if (v9 == (id)2)
  {
    [v7 disableDuration];
    -[MRDAVSystemEndpointController _storeRecentlyDismissedRecommendationForOutputDeviceUID:disableDuration:]( self,  "_storeRecentlyDismissedRecommendationForOutputDeviceUID:disableDuration:",  v13);
    double v22 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVSystemEndpointController _isAllowedToUpdateRecommendationForOutputDevice:recentlyDismissed:]( self,  "_isAllowedToUpdateRecommendationForOutputDevice:recentlyDismissed:",  v14,  self->_recentlyDismissedRecommendations));
    if (v22) {
      goto LABEL_52;
    }
  }

  id v23 = v7;
  id v24 = [v7 changeType];
  BOOL v25 = 0LL;
  v92 = v14;
  if (v9 == (id)1 && v24)
  {
    if (a4 == 5)
    {
      if (v13)
      {
        BOOL v25 = 0LL;
        goto LABEL_13;
      }

      __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v23 outputDeviceUID]);
    }

    else
    {
      BOOL v25 = 0LL;
      if ((a4 & 0xFFFFFFFFFFFFFFFBLL) != 2 || !v13) {
        goto LABEL_13;
      }
      __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVSystemEndpointController originClientForDeviceUID:](self, "originClientForDeviceUID:", v13));
    }

    BOOL v25 = v26 != 0LL;
  }

- (void)_onSerialQueue_reconnectToOutputDevice:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc(&OBJC_CLASS___NSString);
  active = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription(0LL);
  id v13 = -[NSString initWithFormat:]( v11,  "initWithFormat:",  @"%@ endpoint disconnected and attempting to reconnect",  active);

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100007D64;
  v22[3] = &unk_100399148;
  id v23 = v9;
  id v24 = v8;
  id v25 = (id)objc_claimAutoreleasedReturnValue( +[MRDAutoConnectionControllerReason reasonWithType:string:]( &OBJC_CLASS___MRDAutoConnectionControllerReason,  "reasonWithType:string:",  3LL,  v13));
  __int128 v26 = self;
  id v14 = v25;
  id v15 = v8;
  id v16 = v9;
  unsigned int v20 = objc_retainBlock(v22);
  id v21 = v10;
  id v17 = (void (*)(double))v20[2];
  id v18 = v10;
  unsigned int v19 = v20;
  v17(0.0);
}

- (void)_onSerialQueue_maybeSetupUserSelectedTimerForEvent:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_systemEndpointEntries,  "objectForKeyedSubscript:",  &off_1003BB1C8));
  id v6 = v5;
  if (v5)
  {
    if ([v5 supportsIdleReset])
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 outputDeviceUID]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVSystemEndpointController originClientForDeviceUID:](self, "originClientForDeviceUID:", v7));

      if ([v8 isPlaying])
      {
        userSelectedTimer = self->_userSelectedTimer;
        id v10 = objc_alloc(&OBJC_CLASS___NSString);
        active = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription(0LL);
        double v12 = -[NSString initWithFormat:](v10, "initWithFormat:", @"%@Endpoint is playing", active);
      }

      else
      {
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 date]);
        [v17 timeIntervalSinceNow];
        double v19 = v18;
        double v20 = -v18;

        id v21 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
        [v21 endpointRecentlyUserSelectedInterval];
        double v23 = v22 + 5.0;

        if (v23 > v20)
        {
          id v24 = self->_userSelectedTimer;
          id v25 = objc_alloc(&OBJC_CLASS___NSString);
          __int128 v26 = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription(0LL);
          double v27 = -[NSString initWithFormat:](v25, "initWithFormat:", @"%@Endpoint changed", v26);
          -[MRPersistentTimer invalidateWithReason:](v24, "invalidateWithReason:", v27);

          uint64_t v28 = objc_alloc(&OBJC_CLASS___MRPersistentTimer);
          serialQueue = self->_serialQueue;
          v34[0] = _NSConcreteStackBlock;
          v34[1] = 3221225472LL;
          v34[2] = sub_1000082E0;
          v34[3] = &unk_1003991C0;
          *(double *)&v34[6] = v23;
          v34[4] = self;
          v34[5] = a3;
          BOOL v30 = -[MRPersistentTimer initWithInterval:name:queue:block:]( v28,  "initWithInterval:name:queue:block:",  @"com.apple.mediaremote.systemendpointcontroller.userselectedtimer",  serialQueue,  v34,  v19 + v23);
          objc_super v31 = self->_userSelectedTimer;
          self->_userSelectedTimer = v30;

LABEL_10:
          goto LABEL_11;
        }

        userSelectedTimer = self->_userSelectedTimer;
        uint64_t v32 = objc_alloc(&OBJC_CLASS___NSString);
        active = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription(0LL);
        double v12 = -[NSString initWithFormat:](v32, "initWithFormat:", @"%@Endpoint timeout imminent", active);
      }

      id v33 = v12;
      -[MRPersistentTimer invalidateWithReason:](userSelectedTimer, "invalidateWithReason:", v12);

      goto LABEL_10;
    }

    id v13 = self->_userSelectedTimer;
    id v14 = objc_alloc(&OBJC_CLASS___NSString);
    id v15 = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription(0LL);
    id v16 = -[NSString initWithFormat:](v14, "initWithFormat:", @"%@Endpoint doesn't reset when idle", v15);
    -[MRPersistentTimer invalidateWithReason:](v13, "invalidateWithReason:", v16);
  }

- (void)_onSerialQueue_maybeSetupPlaybackTimerForEvent:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_systemEndpointEntries,  "objectForKeyedSubscript:",  &off_1003BB1C8));
  id v6 = v5;
  if (v5)
  {
    if ([v5 supportsIdleReset])
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 outputDeviceUID]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVSystemEndpointController originClientForDeviceUID:](self, "originClientForDeviceUID:", v7));

      if ([v8 isPlaying])
      {
        -[MRDAVSystemEndpointController _onSerialQueue_maybeSetupUserSelectedTimerForEvent:]( self,  "_onSerialQueue_maybeSetupUserSelectedTimerForEvent:",  a3);
        playbackTimer = self->_playbackTimer;
        id v10 = objc_alloc(&OBJC_CLASS___NSString);
        active = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription(0LL);
        double v12 = -[NSString initWithFormat:](v10, "initWithFormat:", @"%@Endpoint is playing", active);
      }

      else
      {
        [v8 timeSincePlaying];
        double v18 = v17;
        double v19 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
        [v19 mediaRecentlyPlayedInterval];
        double v21 = v20 + 5.0;

        if (v18 < v21)
        {
          double v22 = objc_alloc(&OBJC_CLASS___MRPersistentTimer);
          serialQueue = self->_serialQueue;
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472LL;
          v28[2] = sub_1000085EC;
          v28[3] = &unk_1003990A8;
          BOOL v30 = self;
          int64_t v31 = a3;
          double v32 = v21;
          id v29 = v8;
          id v24 = -[MRPersistentTimer initWithInterval:name:queue:block:]( v22,  "initWithInterval:name:queue:block:",  @"com.apple.mediaremote.systemendpointcontroller.playbacktimer",  serialQueue,  v28,  v21 - v18);
          id v25 = self->_playbackTimer;
          self->_playbackTimer = v24;

LABEL_10:
          goto LABEL_11;
        }

        playbackTimer = self->_playbackTimer;
        __int128 v26 = objc_alloc(&OBJC_CLASS___NSString);
        active = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription(0LL);
        double v12 = -[NSString initWithFormat:](v26, "initWithFormat:", @"%@Endpoint timeout imminent", active);
      }

      double v27 = v12;
      -[MRPersistentTimer invalidateWithReason:](playbackTimer, "invalidateWithReason:", v12);

      goto LABEL_10;
    }

    id v13 = self->_playbackTimer;
    id v14 = objc_alloc(&OBJC_CLASS___NSString);
    id v15 = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription(0LL);
    id v16 = -[NSString initWithFormat:](v14, "initWithFormat:", @"%@Endpoint doesn't reset when idle", v15);
    -[MRPersistentTimer invalidateWithReason:](v13, "invalidateWithReason:", v16);
  }

- (BOOL)_hasPersonalDeviceForContext:(id)a3
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "outputDevices", 0));
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
        if ([v7 deviceType] != 1
          && [v7 deviceType] != 4
          && [v7 deviceSubtype] != 8)
        {
          LOBYTE(v4) = 1;
          goto LABEL_13;
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

- (void)_writeSystemEndpointInfo:(id)a3 recentlyDismissedRecommendationsInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_1003FDBE8 != -1) {
    dispatch_once(&qword_1003FDBE8, &stru_100399200);
  }
  id v8 = (dispatch_queue_s *)qword_1003FDBE0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100008930;
  block[3] = &unk_100398F40;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)_initializeSystemEndpointInfo
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", @"SystemEndpoint"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100008BCC;
  v23[3] = &unk_100399228;
  v23[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v23];
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSUserDefaults objectForKey:]( self->_userDefaults,  "objectForKey:",  @"SystemEndpointRecentlyDismissedRecommendations"));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        recentlyDismissedRecommendations = self->_recentlyDismissedRecommendations;
        id v10 = -[MRDSystemEndpointControllerRecentlyDismissedRecommendation initWithDictionaryRepresentation:]( objc_alloc(&OBJC_CLASS___MRDSystemEndpointControllerRecentlyDismissedRecommendation),  "initWithDictionaryRepresentation:",  *(void *)(*((void *)&v19 + 1) + 8LL * (void)i));
        -[NSMutableArray addObject:](recentlyDismissedRecommendations, "addObject:", v10);
      }

      id v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }

    while (v6);
  }

  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_systemEndpointEntries,  "objectForKeyedSubscript:",  &off_1003BB1C8));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 outputDeviceUID]);
  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    [v13 activeSystemEndpointStartupDelayToAllowAllPreviousClientsTimeToInitializeInterval];
    int64_t v15 = (uint64_t)(v14 * 1000000000.0);
  }

  else
  {
    int64_t v15 = 0LL;
  }

  dispatch_time_t v16 = dispatch_time(0LL, v15);
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100008DD4;
  block[3] = &unk_100399250;
  void block[4] = self;
  dispatch_after(v16, serialQueue, block);
}

- (void)_deviceInfoDidChange:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVSystemEndpointController activeOutputDeviceUID:](self, "activeOutputDeviceUID:", 0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v7 = MRGetDeviceInfoFromUserInfo();
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v10 = MRGetOriginFromUserInfo();
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  uint64_t v37 = 0LL;
  unint64_t v38 = &v37;
  uint64_t v39 = 0x3032000000LL;
  v40 = sub_100004580;
  v41 = sub_100004590;
  id v42 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100009214;
  block[3] = &unk_100399278;
  void block[4] = self;
  void block[5] = &v37;
  dispatch_sync(serialQueue, block);
  if (([(id)v38[5] isLocal] & 1) == 0
    && ([v11 isEqual:v38[5]] & 1) != 0
    && [v8 supportsMultiplayer])
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceUID]);
    if ([v13 isEqual:v5])
    {
LABEL_15:

      goto LABEL_16;
    }

    double v14 = (void *)objc_claimAutoreleasedReturnValue([v8 clusterID]);
    unsigned __int8 v15 = [v14 isEqual:v5];

    if ((v15 & 1) == 0)
    {
      dispatch_time_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 groupedDevices]);
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      v34[2] = sub_100009228;
      v34[3] = &unk_1003992A0;
      id v17 = v5;
      id v35 = v17;
      unsigned __int8 v18 = objc_msgSend(v16, "mr_any:", v34);

      if ((v18 & 1) == 0)
      {
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceUID]);
        unsigned __int8 v20 = [v19 isEqual:v17];

        if ((v20 & 1) == 0)
        {
          __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 deviceUID]);
          if (v22) {
            goto LABEL_10;
          }
        }

        double v23 = (void *)objc_claimAutoreleasedReturnValue([v8 groupedDevices]);
        id v29 = _NSConcreteStackBlock;
        uint64_t v30 = 3221225472LL;
        int64_t v31 = sub_100009268;
        double v32 = &unk_1003992A0;
        id v33 = v17;
        id v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "mr_first:", &v29));
        __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "deviceUID", v29, v30, v31, v32));

        if (v22)
        {
LABEL_10:
          uint64_t v25 = _MRLogForCategory(0LL, v21);
          __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 138543362;
            id v44 = v22;
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "[SystemEndpointController] Requesting to move ASE to deviceUID: %{public}@ because the old ASE changed groups",  buf,  0xCu);
          }

          id v27 = [[MRUpdateActiveSystemEndpointRequest alloc] initWithOutputDeviceUID:v22 reason:@"ASE moved to another endpoint"];
          -[MRDAVSystemEndpointController updateSystemEndpointForRequest:event:completion:]( self,  "updateSystemEndpointForRequest:event:completion:",  v27,  9LL,  0LL);
        }

        else
        {
          uint64_t v28 = _MRLogForCategory(0LL, v21);
          __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)__int128 buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "[SystemEndpointController] ASE changed groups, but no other devices found in old group",  buf,  2u);
          }
        }
      }

      id v13 = v35;
      goto LABEL_15;
    }
  }

- (MRDAVSystemEndpointControllerDelegate)delegate
{
  return (MRDAVSystemEndpointControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
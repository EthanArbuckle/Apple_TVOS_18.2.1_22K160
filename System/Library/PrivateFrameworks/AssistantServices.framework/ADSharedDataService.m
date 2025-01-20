@interface ADSharedDataService
- (ADSharedDataService)initWithDelegate:(id)a3;
- (BOOL)peerExportsSharedData;
- (BOOL)watchIsNearbyForAssistantId:(id)a3;
- (id)_setDataFromSharedData:(id)a3;
- (id)peerBuildVersion;
- (id)peerType;
- (void)_dataDidUpdate:(id)a3;
- (void)_getDataWithCompletion:(id)a3;
- (void)_getDataWithPBCompletion:(id)a3;
- (void)_handleExecuteRequestOnRemoteWatch:(id)a3 completion:(id)a4;
- (void)_pushSharedDataToPeerFromNotification:(id)a3 completion:(id)a4;
- (void)_requestDataRemotelyAllowingCloudMessaging:(BOOL)a3 completion:(id)a4;
- (void)_sendData:(id)a3;
- (void)_sharedDataDidChange:(id)a3;
- (void)_startRemoteRequest:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)deviceIsNearby:(id)a3;
- (void)effectiveSettingsChanged;
- (void)executeRemoteCommand:(id)a3 completion:(id)a4;
- (void)getSharedDataFromPeerUseCache:(BOOL)a3 allowCloudMessaging:(BOOL)a4 completion:(id)a5;
- (void)getSharedDataFromPeerUseCache:(BOOL)a3 completion:(id)a4;
- (void)peerConnection:(id)a3 handlePBSubclass:(id)a4 completion:(id)a5;
- (void)pushSharedDataToPeer:(id)a3;
- (void)startRemoteRequest:(id)a3 completion:(id)a4;
@end

@implementation ADSharedDataService

- (ADSharedDataService)initWithDelegate:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ADSharedDataService;
  v5 = -[ADSharedDataService init](&v14, "init");
  if (v5)
  {
    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
    dispatch_queue_t v8 = dispatch_queue_create("ADSharedDataService", v7);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    v10 = [[ADPeerConnection alloc] initWithServiceIdentifier:@"com.apple.private.alloy.siri.device" forRequests:j__objc_msgSend__ADPBDeviceRequestType];
    peerConnection = v5->_peerConnection;
    v5->_peerConnection = v10;

    -[ADPeerConnection setDelegate:forRequestTypes:]( v5->_peerConnection,  "setDelegate:forRequestTypes:",  v5,  sub_1000A9368);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v12 addObserver:v5 selector:"_sharedDataDidChange:" name:@"ADSharedDataDidChangeNotification" object:0];

    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v5;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ADSharedDataService;
  -[ADSharedDataService dealloc](&v4, "dealloc");
}

- (void)pushSharedDataToPeer:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000CE638;
  v7[3] = &unk_1004FD990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)effectiveSettingsChanged
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000CE55C;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_pushSharedDataToPeerFromNotification:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  uint64_t v8 = -[ADPeerConnection hasPeer](self->_peerConnection, "hasPeer");
  if ((v8 & 1) != 0 || (sub_1001EA800(v8, v9) & 1) != 0)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000CE32C;
    v12[3] = &unk_1004F77F8;
    v12[4] = self;
    id v13 = (id)objc_claimAutoreleasedReturnValue([v6 userInfo]);
    objc_super v14 = v7;
    id v10 = v13;
    -[ADSharedDataService _getDataWithCompletion:](self, "_getDataWithCompletion:", v12);
  }

  else
  {
    v11 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[ADSharedDataService _pushSharedDataToPeerFromNotification:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s Not pushing shared data because we have no peer",  buf,  0xCu);
    }

    if (v7) {
      v7[2](v7);
    }
  }
}

- (void)_sendData:(id)a3
{
  peerConnection = self->_peerConnection;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[ADSharedDataService _setDataFromSharedData:](self, "_setDataFromSharedData:", a3));
  -[ADPeerConnection sendRequest:responseClass:overrideRequireConnectedPeer:allowCloud:completion:]( peerConnection,  "sendRequest:responseClass:overrideRequireConnectedPeer:allowCloud:completion:",  v4,  0LL,  0LL,  1LL,  0LL);
}

- (void)_getDataWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000CE254;
  v7[3] = &unk_1004F7558;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 getSharedDataForPeer:v7];
}

- (void)_sharedDataDidChange:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[ADSharedDataService _sharedDataDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000CE244;
  v8[3] = &unk_1004FD968;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)_getDataWithPBCompletion:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000CDFD0;
  v7[3] = &unk_1004FD990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)_setDataFromSharedData:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS____ADPBDeviceSetDataRequest);
  -[_ADPBDeviceSetDataRequest _ad_setData:](v5, "_ad_setData:", v4);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADPeerConnection peerName](self->_peerConnection, "peerName"));
  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[ADPeerConnection peerVersion](self->_peerConnection, "peerVersion"));
  uint64_t v8 = AFPreferencesSupportedLanguagesForRemote(v6, v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBDeviceSetDataRequest languageCode](v5, "languageCode"));
  LOBYTE(v7) = [v9 containsObject:v10];

  if ((v7 & 1) == 0)
  {
    v11 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315138;
      objc_super v14 = "-[ADSharedDataService _setDataFromSharedData:]";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s Forcing Siri to off because peer does not support language",  (uint8_t *)&v13,  0xCu);
    }

    -[_ADPBDeviceSetDataRequest setSiriEnabled:](v5, "setSiriEnabled:", 0LL);
  }

  return v5;
}

- (void)_startRemoteRequest:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_ad_requestInfo"));

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000CDF18;
  v10[3] = &unk_1004FC6E0;
  id v11 = v5;
  id v9 = v5;
  [v7 handleExternalActivationRequest:v8 completion:v10];
}

- (void)peerConnection:(id)a3 handlePBSubclass:(id)a4 completion:(id)a5
{
}

- (id)peerType
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_1000CDE88;
  id v10 = sub_1000CDE98;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000CDEDC;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)peerBuildVersion
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_1000CDE88;
  id v10 = sub_1000CDE98;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000CDEA0;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)peerExportsSharedData
{
  return 0;
}

- (void)deviceIsNearby:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000CDDF0;
    v7[3] = &unk_1004FD990;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)getSharedDataFromPeerUseCache:(BOOL)a3 completion:(id)a4
{
}

- (void)getSharedDataFromPeerUseCache:(BOOL)a3 allowCloudMessaging:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = (void (**)(id, void))a5;
  if (v8 || v6)
  {
    if (!-[ADSharedDataService peerExportsSharedData](self, "peerExportsSharedData"))
    {
      id v9 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v16 = "-[ADSharedDataService getSharedDataFromPeerUseCache:allowCloudMessaging:completion:]";
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s Peer does not export shared data.",  buf,  0xCu);
      }

      v8[2](v8, 0LL);
    }

    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000CDDB8;
    block[3] = &unk_1004F3C80;
    BOOL v13 = v6;
    block[4] = self;
    v12 = v8;
    BOOL v14 = a4;
    dispatch_async(queue, block);
  }
}

- (void)_requestDataRemotelyAllowingCloudMessaging:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS____ADPBDeviceGetDataRequest);
  peerConnection = self->_peerConnection;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS____ADPBDeviceSetDataRequest);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000CDCA8;
  v11[3] = &unk_1004F1C48;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  -[ADPeerConnection sendRequest:responseClass:overrideRequireConnectedPeer:allowCloud:completion:]( peerConnection,  "sendRequest:responseClass:overrideRequireConnectedPeer:allowCloud:completion:",  v7,  v9,  0LL,  v4,  v11);
}

- (void)_dataDidUpdate:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000CDC58;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)startRemoteRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000CDB18;
  block[3] = &unk_1004FD9E0;
  id v12 = v6;
  BOOL v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (BOOL)watchIsNearbyForAssistantId:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADSharedData assistantId](self->_remoteData, "assistantId"));
  id v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    id v10 = "-[ADSharedDataService watchIsNearbyForAssistantId:]";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %@ %@", (uint8_t *)&v9, 0x20u);
  }

  unsigned __int8 v7 = [v5 isEqualToString:v4];

  return v7;
}

- (void)executeRemoteCommand:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(&OBJC_CLASS____ADPBDeviceExecuteOnRemoteRequest);
  -[_ADPBDeviceExecuteOnRemoteRequest setContent:](v8, "setContent:", v7);

  peerConnection = self->_peerConnection;
  uint64_t v10 = objc_opt_class(&OBJC_CLASS____ADPBDeviceExecuteOnRemoteResponse);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000CDA3C;
  v12[3] = &unk_1004F0578;
  id v13 = v6;
  id v11 = v6;
  -[ADPeerConnection sendRequest:responseClass:overrideRequireConnectedPeer:allowCloud:completion:]( peerConnection,  "sendRequest:responseClass:overrideRequireConnectedPeer:allowCloud:completion:",  v8,  v10,  1LL,  0LL,  v12);
}

- (void)_handleExecuteRequestOnRemoteWatch:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[ADSharedDataService _handleExecuteRequestOnRemoteWatch:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if ([v5 hasContent])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 content]);
    int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithPlistData:](&OBJC_CLASS___NSDictionary, "dictionaryWithPlistData:", v8));

    uint64_t v10 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = AceObjectClassPListKey;
      id v12 = v10;
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v11]);
      *(_DWORD *)buf = 136315650;
      v18 = "-[ADSharedDataService _handleExecuteRequestOnRemoteWatch:completion:]";
      __int16 v19 = 2112;
      v20 = v13;
      __int16 v21 = 2112;
      v22 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s got remote execution command: %@ -> %@",  buf,  0x20u);
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000CD898;
    v15[3] = &unk_1004FC7C0;
    id v16 = v6;
    [v14 executeCommand:v9 fromPeer:0 remoteExecutionInfo:0 reply:v15];
  }

  else if (v6)
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0LL, 0LL);
  }
}

- (void).cxx_destruct
{
}

@end
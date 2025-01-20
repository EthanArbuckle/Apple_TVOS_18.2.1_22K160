@interface ADRemoteContextStore
- (ADRemoteContextStore)initWithRapportLink:(id)a3 queue:(id)a4;
- (id)_contextLinkMessageOptions;
- (id)_initWithRapportLink:(id)a3 queue:(id)a4 deviceCircleManager:(id)a5;
- (void)_activateOnDemandRapportConnectionAndFetchContext:(id)a3;
- (void)_dumpStateForReason:(id)a3;
- (void)_enumerateDeviceContextsUsingBlock:(id)a3;
- (void)_fetchContextFromCollectorAndForceFetchingFromDevicesWithPeerInfo:(id)a3 completion:(id)a4;
- (void)_fetchContextFromCollectorThroughOnDemandConnection:(id)a3;
- (void)_fetchContextFromDeviceWithPeerInfo:(id)a3 completion:(id)a4;
- (void)_setContextCollectionAllowed:(BOOL)a3;
- (void)fetchContextSnapshotFromAllDevicesWithCompletion:(id)a3;
- (void)fetchContextSnapshotFromDevicesWithPeerInfo:(id)a3 completion:(id)a4;
- (void)getContextSnapshotIncludingKeys:(id)a3 excludingMandatoryKeys:(id)a4 completion:(id)a5;
- (void)getSerializedDeviceContextSnapshotIncludingKeys:(id)a3 excludingMandatoryKeys:(id)a4 completion:(id)a5;
- (void)rapportLink:(id)a3 didLoseDevice:(id)a4;
- (void)setDeviceContext:(id)a3 includedKeys:(id)a4 excludedKeys:(id)a5 forDeviceWithPeerInfo:(id)a6 completion:(id)a7;
- (void)setDeviceContext:(id)a3 withIncludedKeys:(id)a4 excludedKeys:(id)a5 forDeviceWithIDSDeviceUniqueIdentifier:(id)a6 withCompletion:(id)a7;
- (void)startCollectingContext;
- (void)stopCollectingContext;
- (void)updateRapportLink:(id)a3;
@end

@implementation ADRemoteContextStore

- (ADRemoteContextStore)initWithRapportLink:(id)a3 queue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ADDeviceCircleManager sharedInstance](&OBJC_CLASS___ADDeviceCircleManager, "sharedInstance"));
  v9 = -[ADRemoteContextStore _initWithRapportLink:queue:deviceCircleManager:]( self,  "_initWithRapportLink:queue:deviceCircleManager:",  v7,  v6,  v8);

  return v9;
}

- (id)_initWithRapportLink:(id)a3 queue:(id)a4 deviceCircleManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___ADRemoteContextStore;
  v12 = -[ADRemoteContextStore init](&v22, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_rapportLink, a3);
    if (v10)
    {
      v14 = (OS_dispatch_queue *)v10;
      queue = v13->_queue;
      v13->_queue = v14;
    }

    else
    {
      dispatch_queue_attr_t v16 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v17 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v16);
      dispatch_queue_attr_t v18 = dispatch_queue_attr_make_with_qos_class(v17, QOS_CLASS_USER_INITIATED, 0);
      v19 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v18);

      dispatch_queue_t v20 = dispatch_queue_create("ADRemoteContextStore", v19);
      queue = v13->_queue;
      v13->_queue = (OS_dispatch_queue *)v20;
    }

    objc_storeStrong((id *)&v13->_deviceCircleManager, a5);
  }

  return v13;
}

- (void)startCollectingContext
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015A288;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stopCollectingContext
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015A1D4;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_setContextCollectionAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_contextCollectionAllowed != v3)
  {
    self->_contextCollectionAllowed = v3;
    if (v3)
    {
      v5 = objc_alloc_init(&OBJC_CLASS___AFPeerMap);
      deviceContextMap = self->_deviceContextMap;
      self->_deviceContextMap = v5;

      -[ADRapportLink addListener:](self->_rapportLink, "addListener:", self);
    }

    else
    {
      id v7 = self->_deviceContextMap;
      self->_deviceContextMap = 0LL;

      -[ADRapportLink removeListener:](self->_rapportLink, "removeListener:", self);
    }
  }

- (void)_enumerateDeviceContextsUsingBlock:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    deviceContextMap = self->_deviceContextMap;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10015A164;
    v7[3] = &unk_1004F3150;
    id v8 = v4;
    -[AFPeerMap enumerateObjectsUsingBlock:](deviceContextMap, "enumerateObjectsUsingBlock:", v7);
  }
}

- (void)getContextSnapshotIncludingKeys:(id)a3 excludingMandatoryKeys:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    dispatch_queue_attr_t v18 = "-[ADRemoteContextStore getContextSnapshotIncludingKeys:excludingMandatoryKeys:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s #hal", buf, 0xCu);
  }

  if (v10)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100159D88;
    v13[3] = &unk_1004FDA30;
    v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    id v16 = v10;
    dispatch_async(queue, v13);
  }
}

- (void)fetchContextSnapshotFromDevicesWithPeerInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if ([v6 count])
    {
      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100159348;
      block[3] = &unk_1004FD9E0;
      block[4] = self;
      id v10 = v6;
      id v11 = v7;
      dispatch_async(queue, block);
    }

    else
    {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
    }
  }
}

- (void)fetchContextSnapshotFromAllDevicesWithCompletion:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10015920C;
  v7[3] = &unk_1004FD990;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_activateOnDemandRapportConnectionAndFetchContext:(id)a3
{
  id v4 = a3;
  if ((AFSupportsHALOnDemandRapportConnection(v4, v5) & 1) == 0)
  {
LABEL_8:
    (*((void (**)(id, void, void))v4 + 2))(v4, 0LL, 0LL);
    goto LABEL_9;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink configuration](self->_rapportLink, "configuration"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 connectionOptions]);
  id v8 = [v7 usesOnDemandConnection];

  id v9 = (os_log_s *)AFSiriLogContextDaemon;
  if (v8 != (id)2)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      rapportLink = self->_rapportLink;
      *(_DWORD *)buf = 136315394;
      id v16 = "-[ADRemoteContextStore _activateOnDemandRapportConnectionAndFetchContext:]";
      __int16 v17 = 2112;
      dispatch_queue_attr_t v18 = rapportLink;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s #hal #on-demand rapportLink not set up to use on-demand connection: %@",  buf,  0x16u);
    }

    goto LABEL_8;
  }

  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v10 = self->_rapportLink;
    *(_DWORD *)buf = 136315394;
    id v16 = "-[ADRemoteContextStore _activateOnDemandRapportConnectionAndFetchContext:]";
    __int16 v17 = 2112;
    dispatch_queue_attr_t v18 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s #hal #on-demand about to activate link: %@",  buf,  0x16u);
  }

  id v11 = self->_rapportLink;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100159008;
  v13[3] = &unk_1004FD6F0;
  v13[4] = self;
  id v14 = v4;
  -[ADRapportLink activateWithCompletion:](v11, "activateWithCompletion:", v13);

LABEL_9:
}

- (void)_fetchContextFromCollectorThroughOnDemandConnection:(id)a3
{
  id v4 = a3;
  id v6 = (void (**)(void, void, void))v4;
  if (v4)
  {
    if ((AFSupportsHALOnDemandRapportConnection(v4, v5) & 1) != 0)
    {
      queue = (dispatch_queue_s *)self->_queue;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_100158A14;
      v8[3] = &unk_1004FD990;
      v8[4] = self;
      id v9 = v6;
      dispatch_async(queue, v8);
    }

    else
    {
      v6[2](v6, 0LL, 0LL);
    }
  }
}

- (id)_contextLinkMessageOptions
{
  uint64_t v3 = RPOptionStatusFlags;
  id v4 = &off_100513318;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
}

- (void)_fetchContextFromDeviceWithPeerInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "-[ADRemoteContextStore _fetchContextFromDeviceWithPeerInfo:completion:]";
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "%s #hal Force fetching context directly from %@",  buf,  0x16u);
  }

  rapportLink = self->_rapportLink;
  v21 = @"prefers_assistant_identifiers";
  objc_super v22 = &__kCFBooleanTrue;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ADRemoteContextStore _contextLinkMessageOptions](self, "_contextLinkMessageOptions"));
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  __int16 v17 = sub_10015879C;
  dispatch_queue_attr_t v18 = &unk_1004F4150;
  id v19 = v6;
  id v20 = v7;
  id v12 = v7;
  id v13 = v6;
  -[ADRapportLink sendRequestID:messageType:messagePayload:toPeer:options:completion:]( rapportLink,  "sendRequestID:messageType:messagePayload:toPeer:options:completion:",  @"com.apple.siri.rapport-link.request.generic",  @"agg_context_fetch",  v10,  v13,  v11,  &v15);

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics", v15, v16, v17, v18));
  [v14 logEventWithType:4585 context:0];
}

- (void)_fetchContextFromCollectorAndForceFetchingFromDevicesWithPeerInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v14 = "-[ADRemoteContextStore _fetchContextFromCollectorAndForceFetchingFromDevicesWithPeerInfo:completion:]";
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s #hal Force fetching from devices through collector: %@",  buf,  0x16u);
    }

    deviceCircleManager = self->_deviceCircleManager;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100157E68;
    v10[3] = &unk_1004F4268;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    -[ADDeviceCircleManager getContextCollectorDeviceIdentifiersWithCompletion:]( deviceCircleManager,  "getContextCollectorDeviceIdentifiersWithCompletion:",  v10);
  }
}

- (void)updateRapportLink:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100157E2C;
  v7[3] = &unk_1004FD968;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)setDeviceContext:(id)a3 withIncludedKeys:(id)a4 excludedKeys:(id)a5 forDeviceWithIDSDeviceUniqueIdentifier:(id)a6 withCompletion:(id)a7
{
  id v19 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = v15;
  if (v14)
  {
    id v17 = sub_100165580(v14);
    dispatch_queue_attr_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    -[ADRemoteContextStore setDeviceContext:includedKeys:excludedKeys:forDeviceWithPeerInfo:completion:]( self,  "setDeviceContext:includedKeys:excludedKeys:forDeviceWithPeerInfo:completion:",  v19,  v12,  v13,  v18,  v16);
  }

  else if (v15)
  {
    (*((void (**)(id))v15 + 2))(v15);
  }
}

- (void)setDeviceContext:(id)a3 includedKeys:(id)a4 excludedKeys:(id)a5 forDeviceWithPeerInfo:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = v16;
  if (v15)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100157BB0;
    v19[3] = &unk_1004F7960;
    id v20 = v12;
    id v21 = v15;
    id v22 = v13;
    id v23 = v14;
    v24 = self;
    id v25 = v17;
    dispatch_async(queue, v19);
  }

  else if (v16)
  {
    (*((void (**)(id))v16 + 2))(v16);
  }
}

- (void)getSerializedDeviceContextSnapshotIncludingKeys:(id)a3 excludingMandatoryKeys:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1001578A8;
    v12[3] = &unk_1004FDA30;
    id v13 = v8;
    id v16 = v10;
    id v14 = self;
    id v15 = v9;
    dispatch_async(queue, v12);
  }
}

- (void)rapportLink:(id)a3 didLoseDevice:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100157750;
  v8[3] = &unk_1004FD968;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)_dumpStateForReason:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100157674;
  v5[3] = &unk_1004F31A0;
  id v6 = a3;
  id v4 = v6;
  -[ADRemoteContextStore _enumerateDeviceContextsUsingBlock:](self, "_enumerateDeviceContextsUsingBlock:", v5);
}

- (void).cxx_destruct
{
}

@end
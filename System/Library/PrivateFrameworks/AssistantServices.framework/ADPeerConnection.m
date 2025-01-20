@interface ADPeerConnection
- (ADPeerConnection)initWithServiceIdentifier:(id)a3 forRequests:(void *)a4;
- (ADPeerConnection)initWithServiceIdentifier:(id)a3 forRequests:(void *)a4 requireConnectedPeer:(BOOL)a5;
- (BOOL)_hasConnectedPeer;
- (BOOL)deviceIsNearby:(id *)a3;
- (BOOL)hasPeer;
- (id)_account;
- (id)_destination;
- (id)_pairedDevice;
- (id)_service;
- (id)_wrappedSendFailureError:(id)a3;
- (id)peerBuildVersion;
- (id)peerName;
- (id)peerType;
- (id)peerVersion;
- (id)serviceIdentifier;
- (void)_invokeCompletionForIdentifier:(id)a3 response:(id)a4 error:(id)a5;
- (void)_sendRequest:(id)a3 responseClass:(Class)a4 fireAndForget:(BOOL)a5 timeout:(double)a6 overrideRequireConnectedPeer:(BOOL)a7 to:(BOOL)a8 allowCloud:(BOOL)a9 completion:(id)a10;
- (void)_sendResponse:(id)a3 forRequestId:(id)a4;
- (void)sendRequest:(id)a3;
- (void)sendRequest:(id)a3 fireAndForget:(BOOL)a4;
- (void)sendRequest:(id)a3 responseClass:(Class)a4 completion:(id)a5;
- (void)sendRequest:(id)a3 responseClass:(Class)a4 overrideRequireConnectedPeer:(BOOL)a5 allowCloud:(BOOL)a6 completion:(id)a7;
- (void)sendRequest:(id)a3 responseClass:(Class)a4 timeout:(double)a5 completion:(id)a6;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setDelegate:(id)a3 forRequestTypes:(void *)a4;
@end

@implementation ADPeerConnection

- (ADPeerConnection)initWithServiceIdentifier:(id)a3 forRequests:(void *)a4 requireConnectedPeer:(BOOL)a5
{
  id v9 = a3;
  if (v9)
  {
    if (a4) {
      goto LABEL_3;
    }
  }

  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v20 handleFailureInMethod:a2, self, @"ADPeerConnection.m", 43, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v21 handleFailureInMethod:a2, self, @"ADPeerConnection.m", 44, @"Invalid parameter not satisfying: %@", @"func" object file lineNumber description];

LABEL_3:
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___ADPeerConnection;
  v10 = -[ADPeerConnection init](&v22, "init");
  if (v10)
  {
    v11 = (NSString *)[v9 copy];
    identifier = v10->_identifier;
    v10->_identifier = v11;

    dispatch_queue_attr_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v13);
    dispatch_queue_attr_t v15 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_USER_INTERACTIVE, 0);
    v16 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v15);

    dispatch_queue_t v17 = dispatch_queue_create("ADRemotePeerConnection", v16);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v17;

    v10->_requestMapFunc = a4;
    v10->_requireConnectedPeer = a5;
  }

  return v10;
}

- (ADPeerConnection)initWithServiceIdentifier:(id)a3 forRequests:(void *)a4
{
  return -[ADPeerConnection initWithServiceIdentifier:forRequests:requireConnectedPeer:]( self,  "initWithServiceIdentifier:forRequests:requireConnectedPeer:",  a3,  a4,  0LL);
}

- (BOOL)hasPeer
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADPeerConnection _account](self, "_account"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (id)peerType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADPeerConnection _pairedDevice](self, "_pairedDevice"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 modelIdentifier]);

  return v3;
}

- (id)peerName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADPeerConnection _pairedDevice](self, "_pairedDevice"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 productName]);

  return v3;
}

- (id)peerVersion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADPeerConnection _pairedDevice](self, "_pairedDevice"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 productVersion]);

  return v3;
}

- (id)peerBuildVersion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADPeerConnection _pairedDevice](self, "_pairedDevice"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 productBuildVersion]);

  return v3;
}

- (BOOL)deviceIsNearby:(id *)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADPeerConnection _pairedDevice](self, "_pairedDevice"));
  v5 = v4;
  if (a3) {
    *a3 = (id)objc_claimAutoreleasedReturnValue([v4 uniqueIDOverride]);
  }
  unsigned __int8 v6 = [v5 isNearby];

  return v6;
}

- (id)_pairedDevice
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADPeerConnection _service](self, "_service", 0LL));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 devices]);

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
        v7 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
        if ([v7 isDefaultPairedDevice])
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

- (BOOL)_hasConnectedPeer
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADPeerConnection _pairedDevice](self, "_pairedDevice"));
  unsigned __int8 v3 = [v2 isConnected];

  return v3;
}

- (id)serviceIdentifier
{
  return self->_identifier;
}

- (id)_service
{
  idsService = self->_idsService;
  if (!idsService)
  {
    id v4 = -[IDSService initWithService:](objc_alloc(&OBJC_CLASS___IDSService), "initWithService:", self->_identifier);
    uint64_t v5 = self->_idsService;
    self->_idsService = v4;

    -[IDSService addDelegate:queue:](self->_idsService, "addDelegate:queue:", self, self->_queue);
    idsService = self->_idsService;
  }

  return idsService;
}

- (id)_account
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService accounts](self->_idsService, "accounts"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 anyObject]);

  return v3;
}

- (id)_destination
{
  v2 = (void *)qword_100577A10;
  if (!qword_100577A10)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", IDSDefaultPairedDevice));
    id v4 = (void *)qword_100577A10;
    qword_100577A10 = v3;

    v2 = (void *)qword_100577A10;
  }

  return v2;
}

- (void)sendRequest:(id)a3
{
}

- (void)sendRequest:(id)a3 fireAndForget:(BOOL)a4
{
}

- (void)sendRequest:(id)a3 responseClass:(Class)a4 completion:(id)a5
{
}

- (void)sendRequest:(id)a3 responseClass:(Class)a4 timeout:(double)a5 completion:(id)a6
{
}

- (void)sendRequest:(id)a3 responseClass:(Class)a4 overrideRequireConnectedPeer:(BOOL)a5 allowCloud:(BOOL)a6 completion:(id)a7
{
}

- (void)_sendRequest:(id)a3 responseClass:(Class)a4 fireAndForget:(BOOL)a5 timeout:(double)a6 overrideRequireConnectedPeer:(BOOL)a7 to:(BOOL)a8 allowCloud:(BOOL)a9 completion:(id)a10
{
  id v17 = a3;
  id v18 = a10;
  requestMapFunc = (uint64_t (*)(uint64_t))self->_requestMapFunc;
  uint64_t v20 = objc_opt_class(v17);
  int v21 = requestMapFunc(v20);
  objc_super v22 = (os_log_s *)AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "-[ADPeerConnection _sendRequest:responseClass:fireAndForget:timeout:overrideRequireConnectedPeer:to:allowCloud:completion:]";
    __int16 v38 = 1024;
    int v39 = v21;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s Sending Request %d", buf, 0x12u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1000609E4;
  v26[3] = &unk_1004EEAB8;
  BOOL v32 = a7;
  BOOL v33 = a8;
  id v27 = v17;
  id v28 = v18;
  v26[4] = self;
  __int16 v31 = v21;
  BOOL v34 = a5;
  double v29 = a6;
  BOOL v35 = a9;
  Class v30 = a4;
  id v24 = v17;
  id v25 = v18;
  dispatch_async(queue, v26);
}

- (void)setDelegate:(id)a3 forRequestTypes:(void *)a4
{
  id v6 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000609A0;
  block[3] = &unk_1004FDA80;
  block[4] = self;
  id v10 = v6;
  __int128 v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)_sendResponse:(id)a3 forRequestId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000607E4;
    block[3] = &unk_1004FD4C0;
    id v11 = v6;
    id v12 = v7;
    dispatch_queue_attr_t v13 = self;
    dispatch_async(queue, block);
  }

  else
  {
    __int128 v9 = (os_log_s *)AFSiriLogContextIDS;
    if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      dispatch_queue_attr_t v15 = "-[ADPeerConnection _sendResponse:forRequestId:]";
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s Ignoring response with no requestId %@",  buf,  0x16u);
    }
  }
}

- (void)_invokeCompletionForIdentifier:(id)a3 response:(id)a4 error:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_completions,  "objectForKey:",  v14));
  if (!v9 && [v8 isResponse])
  {
    id v11 = objc_alloc((Class)-[NSMutableDictionary objectForKey:](self->_responseClasses, "objectForKey:", v14));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 data]);
    id v13 = [v11 initWithData:v12];

    if (!v10) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  id v13 = 0LL;
  if (v10) {
LABEL_6:
  }
    ((void (**)(void, id, id))v10)[2](v10, v13, v9);
LABEL_7:
  -[NSMutableDictionary removeObjectForKey:](self->_completions, "removeObjectForKey:", v14);
  -[NSMutableDictionary removeObjectForKey:](self->_responseClasses, "removeObjectForKey:", v14);
}

- (id)_wrappedSendFailureError:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___NSError);
  uint64_t v5 = v4;
  if (v3)
  {
    NSErrorUserInfoKey v9 = NSUnderlyingErrorKey;
    id v10 = v3;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
    id v7 = -[NSError initWithDomain:code:userInfo:]( v5,  "initWithDomain:code:userInfo:",  @"ADRemoteConnectionErrorDomain",  3LL,  v6);
  }

  else
  {
    id v7 = -[NSError initWithDomain:code:userInfo:]( v4,  "initWithDomain:code:userInfo:",  @"ADRemoteConnectionErrorDomain",  3LL,  0LL);
  }

  return v7;
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = (NSString *)a5;
  id v11 = a6;
  id v12 = a7;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 incomingResponseIdentifier]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 outgoingResponseIdentifier]);
  unsigned int v15 = [v12 expectsPeerResponse];
  __int16 v16 = (void *)AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    id v17 = v13;
    id v18 = v14;
    unsigned int v19 = v15;
    id v20 = v11;
    identifier = self->_identifier;
    objc_super v22 = v16;
    unsigned int v23 = -[NSString type](v10, "type");
    v40 = self;
    id v24 = v10;
    id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v12 expectsPeerResponse]));
    *(_DWORD *)buf = 136316674;
    v46 = "-[ADPeerConnection service:account:incomingUnhandledProtobuf:fromID:context:]";
    __int16 v47 = 2112;
    v48 = identifier;
    id v11 = v20;
    unsigned int v15 = v19;
    id v14 = v18;
    id v13 = v17;
    __int16 v49 = 1024;
    *(_DWORD *)v50 = v23;
    *(_WORD *)&v50[4] = 2112;
    *(void *)&v50[6] = v11;
    __int16 v51 = 2112;
    v52 = v17;
    __int16 v53 = 2112;
    v54 = v14;
    __int16 v55 = 2112;
    v56 = v25;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "%s Received %@ type %d fromId %@ incoming %@ outgoing %@ expects response %@",  buf,  0x44u);

    id v10 = v24;
    self = v40;
  }

  if (v13)
  {
    -[ADPeerConnection _invokeCompletionForIdentifier:response:error:]( self,  "_invokeCompletionForIdentifier:response:error:",  v13,  v10,  0LL);
  }

  else
  {
    id v41 = v11;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained && (id v27 = self->_classMapFunc, WeakRetained, v27))
    {
      classMapFunc = (uint64_t (*)(id))self->_classMapFunc;
      if (classMapFunc) {
        double v29 = (objc_class *)classMapFunc(-[NSString type](v10, "type"));
      }
      else {
        double v29 = 0LL;
      }
      id v31 = objc_alloc(v29);
      BOOL v32 = v10;
      BOOL v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSString data](v10, "data"));
      id v34 = [v31 initWithData:v33];

      id v35 = objc_loadWeakRetained((id *)&self->_delegate);
      v36 = (os_log_s *)AFSiriLogContextIDS;
      BOOL v37 = os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO);
      id v11 = v41;
      if (v35 && v34)
      {
        if (v37)
        {
          *(_DWORD *)buf = 136315138;
          v46 = "-[ADPeerConnection service:account:incomingUnhandledProtobuf:fromID:context:]";
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "%s Handing protobuf to delegate", buf, 0xCu);
        }

        id v38 = objc_loadWeakRetained((id *)&self->_delegate);
        int v39 = v38;
        if ((v15 & 1) != 0)
        {
          v42[0] = _NSConcreteStackBlock;
          v42[1] = 3221225472LL;
          v42[2] = sub_1000606E8;
          v42[3] = &unk_1004EEAE0;
          id v43 = v14;
          v44 = self;
          [v39 peerConnection:self handlePBSubclass:v34 completion:v42];
        }

        else
        {
          [v38 peerConnection:self handlePBSubclass:v34 completion:0];
        }
      }

      else if (v37)
      {
        *(_DWORD *)buf = 136315650;
        v46 = "-[ADPeerConnection service:account:incomingUnhandledProtobuf:fromID:context:]";
        __int16 v47 = 2112;
        v48 = v32;
        __int16 v49 = 2112;
        *(void *)v50 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_INFO,  "%s Tried to handle protobuf but couldn't find class or had no delegate %@ %@",  buf,  0x20u);
      }

      id v10 = v32;
      id v13 = 0LL;
    }

    else
    {
      Class v30 = (os_log_s *)AFSiriLogContextIDS;
      if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v46 = "-[ADPeerConnection service:account:incomingUnhandledProtobuf:fromID:context:]";
        __int16 v47 = 2112;
        v48 = v10;
        __int16 v49 = 2112;
        *(void *)v50 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_INFO,  "%s Don't know how to handle protobuf %@ %@",  buf,  0x20u);
      }

      id v11 = v41;
      if (v15) {
        -[ADPeerConnection _sendResponse:forRequestId:](self, "_sendResponse:forRequestId:", 0LL, v14);
      }
    }
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (!a6)
  {
    __int16 v16 = (os_log_s *)AFSiriLogContextIDS;
    if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136315650;
      unsigned int v19 = "-[ADPeerConnection service:account:identifier:didSendWithSuccess:error:]";
      __int16 v20 = 2112;
      id v21 = v14;
      __int16 v22 = 2114;
      id v23 = v15;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s Message send with identifier %@ failed %{public}@",  (uint8_t *)&v18,  0x20u);
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[ADPeerConnection _wrappedSendFailureError:](self, "_wrappedSendFailureError:", v15));
    -[ADPeerConnection _invokeCompletionForIdentifier:response:error:]( self,  "_invokeCompletionForIdentifier:response:error:",  v14,  0LL,  v17);
  }
}

- (void).cxx_destruct
{
}

@end
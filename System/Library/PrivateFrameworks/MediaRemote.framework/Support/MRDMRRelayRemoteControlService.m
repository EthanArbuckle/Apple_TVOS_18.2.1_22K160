@interface MRDMRRelayRemoteControlService
- (MRDMRRelayRemoteControlServiceDelegate)delegate;
- (MRDPreemptiveRemoteControlConnectionManager)connectionManager;
- (NSMutableDictionary)operations;
- (NSMutableDictionary)relayConnectionsToSecondaries;
- (NSString)debugDescription;
- (OS_dispatch_queue)queue;
- (void)_clearSecondaryConnectionsForDevicesNotInArray:(id)a3;
- (void)_handleCompletedOperation:(id)a3 forOutputDeviceUID:(id)a4;
- (void)_reevaluateSecondaryConnectionWithDeviceInfo:(id)a3;
- (void)_reevaluateWithReason:(id)a3;
- (void)setConnectionManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOperations:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRelayConnectionsToSecondaries:(id)a3;
- (void)start;
- (void)stop;
- (void)transportDidClose:(id)a3 error:(id)a4;
@end

@implementation MRDMRRelayRemoteControlService

- (void)start
{
  dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.MediaRemote.MRDMRRelayRemoteControlService", v4);
  queue = self->_queue;
  self->_queue = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMRRelayRemoteControlService queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001519BC;
  v8[3] = &unk_100399250;
  v8[4] = self;
  sub_10013D6FC(v7, v8);
}

- (void)stop
{
  dispatch_queue_attr_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDMRRelayRemoteControlService queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100151B10;
  block[3] = &unk_100399250;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (NSString)debugDescription
{
  dispatch_queue_attr_t v3 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"<%@:%p {\n",  objc_opt_class(self),  self);
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDMRRelayRemoteControlService queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100151D44;
  block[3] = &unk_100398E60;
  block[4] = self;
  v5 = v3;
  v10 = v5;
  dispatch_sync(v4, block);

  v6 = v10;
  v7 = v5;

  return &v7->super;
}

- (void)transportDidClose:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDMRRelayRemoteControlService queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100151F90;
  block[3] = &unk_100398F40;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)_reevaluateWithReason:(id)a3
{
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDMRRelayRemoteControlService queue](self, "queue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001521EC;
  block[3] = &unk_100399250;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_reevaluateSecondaryConnectionWithDeviceInfo:(id)a3
{
  id v19 = a3;
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDMRRelayRemoteControlService queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  v20 = (void *)objc_claimAutoreleasedReturnValue( +[MRAVOutputContext sharedAudioPresentationContext]( &OBJC_CLASS___MRAVOutputContext,  "sharedAudioPresentationContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "mr_allAirPlayDevices"));
  -[MRDMRRelayRemoteControlService _clearSecondaryConnectionsForDevicesNotInArray:]( self,  "_clearSecondaryConnectionsForDevicesNotInArray:",  v5);
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v30 = 0u;
  __int128 v29 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v30;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 uid]);
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472LL;
        v26[2] = sub_10015254C;
        v26[3] = &unk_1003A3108;
        v26[4] = self;
        id v11 = v10;
        id v27 = v11;
        v28 = v9;
        id v12 = sub_10015254C((uint64_t)v26);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        if ([v13 result])
        {
          v14 = -[MRDConnectToRelaySecondaryOperation initWithOutputDevice:]( objc_alloc(&OBJC_CLASS___MRDConnectToRelaySecondaryOperation),  "initWithOutputDevice:",  v9);
          objc_initWeak(&location, v14);
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472LL;
          v22[2] = sub_100152690;
          v22[3] = &unk_1003A3130;
          v22[4] = self;
          objc_copyWeak(&v24, &location);
          id v15 = v11;
          id v23 = v15;
          -[MRDConnectToRelaySecondaryOperation setCompletionBlock:](v14, "setCompletionBlock:", v22);
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMRRelayRemoteControlService operations](self, "operations"));
          v17 = (NSOperationQueue *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v15]);

          if (!v17)
          {
            v17 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMRRelayRemoteControlService operations](self, "operations"));
            [v18 setObject:v17 forKeyedSubscript:v15];
          }

          -[NSOperationQueue addOperation:](v17, "addOperation:", v14);

          objc_destroyWeak(&v24);
          objc_destroyWeak(&location);
        }
      }

      id v6 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }

    while (v6);
  }
}

- (void)_handleCompletedOperation:(id)a3 forOutputDeviceUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDMRRelayRemoteControlService queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 handle]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 connection]);
  [v10 addObserver:self];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 handle]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 connection]);
  if (([v12 isValid] & 1) == 0)
  {

    goto LABEL_9;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);

  if (v13)
  {
LABEL_9:
    v22 = (void *)objc_claimAutoreleasedReturnValue([v6 handle]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 connection]);
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
    [v23 closeWithError:v24];

    v25 = (void *)objc_claimAutoreleasedReturnValue([v6 handle]);
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 connection]);
    [v26 removeObserver:self];

    id v27 = objc_alloc(&OBJC_CLASS___NSString);
    v28 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v6 handle]);
    __int128 v30 = -[NSString initWithFormat:]( v27,  "initWithFormat:",  @"relayConnection is not valid with error=%@: %@",  v28,  v29);

    -[MRDMRRelayRemoteControlService _reevaluateWithReason:](self, "_reevaluateWithReason:", v30);
    goto LABEL_10;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMRRelayRemoteControlService relayConnectionsToSecondaries](self, "relayConnectionsToSecondaries"));

  if (!v14)
  {
    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[MRDMRRelayRemoteControlService setRelayConnectionsToSecondaries:](self, "setRelayConnectionsToSecondaries:", v16);
  }

  uint64_t v17 = _MRLogForCategory(0LL, v15);
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v6 handle]);
    *(_DWORD *)buf = 138412290;
    v34 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[MRDMRRelayRemoteControlService] Adding relayConnection: %@",  buf,  0xCu);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue([v6 handle]);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMRRelayRemoteControlService relayConnectionsToSecondaries](self, "relayConnectionsToSecondaries"));
  [v21 setObject:v20 forKeyedSubscript:v7];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100152A8C;
  block[3] = &unk_100398E60;
  block[4] = self;
  id v32 = v6;
  dispatch_async(&_dispatch_main_q, block);

LABEL_10:
}

- (void)_clearSecondaryConnectionsForDevicesNotInArray:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDMRRelayRemoteControlService queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = objc_alloc(&OBJC_CLASS___NSSet);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "msv_map:", &stru_1003A3150));

  v8 = -[NSSet initWithArray:](v6, "initWithArray:", v7);
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[MRDMRRelayRemoteControlService operations](self, "operations"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100152C50;
  v16[3] = &unk_1003A3178;
  id v9 = v8;
  uint64_t v17 = v9;
  v18 = self;
  [v12 enumerateKeysAndObjectsUsingBlock:v16];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMRRelayRemoteControlService relayConnectionsToSecondaries](self, "relayConnectionsToSecondaries"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100152D74;
  v13[3] = &unk_1003A31A0;
  v14 = v9;
  uint64_t v15 = self;
  id v11 = v9;
  [v10 enumerateKeysAndObjectsUsingBlock:v13];
}

- (MRDMRRelayRemoteControlServiceDelegate)delegate
{
  return (MRDMRRelayRemoteControlServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (MRDPreemptiveRemoteControlConnectionManager)connectionManager
{
  return self->_connectionManager;
}

- (void)setConnectionManager:(id)a3
{
}

- (NSMutableDictionary)operations
{
  return self->_operations;
}

- (void)setOperations:(id)a3
{
}

- (NSMutableDictionary)relayConnectionsToSecondaries
{
  return self->_relayConnectionsToSecondaries;
}

- (void)setRelayConnectionsToSecondaries:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
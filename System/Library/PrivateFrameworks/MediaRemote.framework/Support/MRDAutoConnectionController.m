@interface MRDAutoConnectionController
+ (id)sharedConnectionController;
- (NSArray)autoConnectedEndpoints;
- (NSArray)autoConnectingEndpoints;
- (id)_init;
- (void)_connectToAllOutputDevicesForReason:(id)a3 comparator:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)_connectToGroup:(id)a3 reason:(id)a4 completion:(id)a5;
- (void)_connectToOutputDevice:(id)a3 reason:(id)a4 completion:(id)a5;
- (void)_discoverGroup:(id)a3 reason:(id)a4 completion:(id)a5;
- (void)_discoverOutputDevice:(id)a3 reason:(id)a4 completion:(id)a5;
- (void)_handleActiveSystemEndpointDidChangeNotification:(id)a3;
- (void)_handleEndpointDidInvalidateNotification:(id)a3;
- (void)_onSerialQueue_addConnectedEndpoint:(id)a3;
- (void)_onSerialQueue_connectToEndpoint:(id)a3 reason:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)_onSerialQueue_discoverGroup:(id)a3 connect:(BOOL)a4 reason:(id)a5 completion:(id)a6;
- (void)_onSerialQueue_discoverOutputDevice:(id)a3 connect:(BOOL)a4 reason:(id)a5 completion:(id)a6;
- (void)_onSerialQueue_removeConnectedEndpoint:(id)a3;
- (void)connectToAllOutputDevicesForReason:(id)a3 comparator:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)connectToGroup:(id)a3 reason:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)connectToOutputDevice:(id)a3 reason:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)discoverGroup:(id)a3 reason:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)discoverOutputDevice:(id)a3 reason:(id)a4 queue:(id)a5 completion:(id)a6;
@end

@implementation MRDAutoConnectionController

+ (id)sharedConnectionController
{
  if (qword_1003FDEF8 != -1) {
    dispatch_once(&qword_1003FDEF8, &stru_1003A0390);
  }
  return (id)qword_1003FDEF0;
}

- (id)_init
{
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___MRDAutoConnectionController;
  v2 = -[MRDAutoConnectionController init](&v29, "init");
  if (!v2) {
    return v2;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 nowPlayingServer]);
  nowPlayingServer = v2->_nowPlayingServer;
  v2->_nowPlayingServer = (MRDNowPlayingServer *)v4;

  dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
  dispatch_queue_t v8 = dispatch_queue_create("com.apple.mediaremote.MRDAutoConnectionController", v7);
  serialQueue = v2->_serialQueue;
  v2->_serialQueue = (OS_dispatch_queue *)v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v11 = [v10 connectToAllEndpointsWhenAnyEndpointBeginsPlayback];

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[MRCompanionLinkClient sharedCompanionLinkClient]( &OBJC_CLASS___MRCompanionLinkClient,  "sharedCompanionLinkClient"));
    uint64_t v13 = MRCompanionLinkClientEventIsPlaying;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_1000EA20C;
    v27[3] = &unk_10039C370;
    v14 = (id *)&v28;
    v28 = v2;
    v15 = v27;
  }

  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned int v17 = [v16 connectToEndpointWhenBeginsPlayback];

    if (!v17) {
      goto LABEL_7;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[MRCompanionLinkClient sharedCompanionLinkClient]( &OBJC_CLASS___MRCompanionLinkClient,  "sharedCompanionLinkClient"));
    uint64_t v13 = MRCompanionLinkClientEventIsPlaying;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_1000EA3C4;
    v25[3] = &unk_10039C370;
    v14 = (id *)&v26;
    v26 = v2;
    v15 = v25;
  }

  id v18 = [v12 registerEvent:v13 callback:v15];

LABEL_7:
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v20 = [v19 connectToUserSelectedEndpoint];

  if (v20)
  {
    dispatch_time_t v21 = dispatch_time(0LL, 1000000000LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000EA494;
    block[3] = &unk_100399250;
    v24 = v2;
    dispatch_after(v21, &_dispatch_main_q, block);
  }

  return v2;
}

- (NSArray)autoConnectingEndpoints
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_1000EA6A0;
  v10 = sub_1000EA6B0;
  id v11 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000EA6B8;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NSArray)autoConnectedEndpoints
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_1000EA6A0;
  v10 = sub_1000EA6B0;
  id v11 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000EA7A8;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)connectToAllOutputDevicesForReason:(id)a3 comparator:(id)a4 queue:(id)a5 completion:(id)a6
{
  v10 = (dispatch_queue_s *)a5;
  id v11 = a6;
  if (!v10)
  {
    v10 = &_dispatch_main_q;
    v12 = &_dispatch_main_q;
  }

  id v13 = a4;
  id v14 = a3;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000EA91C;
  v19[3] = &unk_1003A0428;
  dispatch_time_t v21 = v10;
  id v22 = v11;
  unsigned int v20 = -[MSVBlockGuard initWithDeallocHandler:]( objc_alloc(&OBJC_CLASS___MSVBlockGuard),  "initWithDeallocHandler:",  &stru_1003A0400);
  v15 = v10;
  id v16 = v11;
  unsigned int v17 = v20;
  id v18 = objc_retainBlock(v19);
  -[MRDAutoConnectionController _connectToAllOutputDevicesForReason:comparator:queue:completion:]( self,  "_connectToAllOutputDevicesForReason:comparator:queue:completion:",  v14,  v13,  v15,  v18);
}

- (void)connectToOutputDevice:(id)a3 reason:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000EAAF4;
  v18[3] = &unk_1003A0470;
  id v20 = v10;
  id v21 = v11;
  v19 = -[MSVBlockGuard initWithDeallocHandler:]( objc_alloc(&OBJC_CLASS___MSVBlockGuard),  "initWithDeallocHandler:",  &stru_1003A0448);
  id v14 = v10;
  id v15 = v11;
  id v16 = v19;
  unsigned int v17 = objc_retainBlock(v18);
  -[MRDAutoConnectionController _connectToOutputDevice:reason:completion:]( self,  "_connectToOutputDevice:reason:completion:",  v13,  v12,  v17);
}

- (void)connectToGroup:(id)a3 reason:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000EACCC;
  v18[3] = &unk_1003A0470;
  id v20 = v10;
  id v21 = v11;
  v19 = -[MSVBlockGuard initWithDeallocHandler:]( objc_alloc(&OBJC_CLASS___MSVBlockGuard),  "initWithDeallocHandler:",  &stru_1003A0490);
  id v14 = v10;
  id v15 = v11;
  id v16 = v19;
  unsigned int v17 = objc_retainBlock(v18);
  -[MRDAutoConnectionController _connectToGroup:reason:completion:]( self,  "_connectToGroup:reason:completion:",  v13,  v12,  v17);
}

- (void)discoverOutputDevice:(id)a3 reason:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000EAEA4;
  v18[3] = &unk_1003A0470;
  id v20 = v10;
  id v21 = v11;
  v19 = -[MSVBlockGuard initWithDeallocHandler:]( objc_alloc(&OBJC_CLASS___MSVBlockGuard),  "initWithDeallocHandler:",  &stru_1003A04B0);
  id v14 = v10;
  id v15 = v11;
  id v16 = v19;
  unsigned int v17 = objc_retainBlock(v18);
  -[MRDAutoConnectionController _discoverOutputDevice:reason:completion:]( self,  "_discoverOutputDevice:reason:completion:",  v13,  v12,  v17);
}

- (void)discoverGroup:(id)a3 reason:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000EB07C;
  v18[3] = &unk_1003A0470;
  id v20 = v10;
  id v21 = v11;
  v19 = -[MSVBlockGuard initWithDeallocHandler:]( objc_alloc(&OBJC_CLASS___MSVBlockGuard),  "initWithDeallocHandler:",  &stru_1003A04D0);
  id v14 = v10;
  id v15 = v11;
  id v16 = v19;
  unsigned int v17 = objc_retainBlock(v18);
  -[MRDAutoConnectionController _discoverGroup:reason:completion:]( self,  "_discoverGroup:reason:completion:",  v13,  v12,  v17);
}

- (void)_connectToAllOutputDevicesForReason:(id)a3 comparator:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[MRAVRoutingDiscoverySession discoverySessionWithEndpointFeatures:]( &OBJC_CLASS___MRAVRoutingDiscoverySession,  "discoverySessionWithEndpointFeatures:",  8LL));
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_1000EB3C4;
  v43[3] = &unk_1003A0520;
  v43[4] = self;
  id v46 = v11;
  id v16 = v10;
  id v44 = v16;
  unsigned int v17 = v14;
  v45 = v17;
  id v32 = v11;
  id v18 = [v15 addEndpointsChangedCallback:v43];
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 UUIDString]);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000EB624;
  block[3] = &unk_100398F40;
  id v21 = v20;
  id v40 = v21;
  id v41 = v16;
  id v22 = v15;
  id v42 = v22;
  id v23 = v16;
  dispatch_async(&_dispatch_main_q, block);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  [v24 discoverEndpointTimeoutInterval];
  dispatch_time_t v26 = dispatch_time(0LL, (uint64_t)(v25 * 1000000000.0));
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_1000EB6E4;
  v33[3] = &unk_100399970;
  id v34 = v21;
  id v35 = v22;
  id v37 = v12;
  id v38 = v13;
  v36 = v17;
  id v27 = v12;
  v28 = v17;
  id v29 = v13;
  id v30 = v22;
  id v31 = v21;
  dispatch_after(v26, &_dispatch_main_q, v33);
}

- (void)_connectToOutputDevice:(id)a3 reason:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000EB8EC;
  v15[3] = &unk_100399120;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(serialQueue, v15);
}

- (void)_connectToGroup:(id)a3 reason:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000EB9C8;
  v15[3] = &unk_100399120;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(serialQueue, v15);
}

- (void)_discoverOutputDevice:(id)a3 reason:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000EBAA4;
  v15[3] = &unk_100399120;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(serialQueue, v15);
}

- (void)_discoverGroup:(id)a3 reason:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000EBB80;
  v15[3] = &unk_100399120;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(serialQueue, v15);
}

- (void)_onSerialQueue_discoverOutputDevice:(id)a3 connect:(BOOL)a4 reason:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  id v13 = a6;
  dispatch_assert_queue_V2(serialQueue);
  if (v10)
  {
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_1000EBE88;
    v43[3] = &unk_1003A0548;
    v43[4] = self;
    id v14 = v10;
    id v44 = v14;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_1000EBFC4;
    v39[3] = &unk_1003A0570;
    id v15 = objc_retainBlock(v43);
    BOOL v42 = a4;
    id v41 = v15;
    v39[4] = self;
    id v16 = v11;
    id v40 = v16;
    id v17 = objc_retainBlock(v39);
    pendingReconSessionCompletions = self->_pendingReconSessionCompletions;
    if (!pendingReconSessionCompletions)
    {
      v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      id v20 = self->_pendingReconSessionCompletions;
      self->_pendingReconSessionCompletions = v19;

      pendingReconSessionCompletions = self->_pendingReconSessionCompletions;
    }

    id v21 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( pendingReconSessionCompletions,  "objectForKeyedSubscript:",  v14));

    if (!v21)
    {
      id v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_pendingReconSessionCompletions,  "setObject:forKeyedSubscript:",  v22,  v14);
    }

    id v23 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_pendingReconSessionCompletions,  "objectForKeyedSubscript:",  v14));
    id v24 = [v13 copy];

    id v25 = objc_retainBlock(v24);
    [v23 addObject:v25];

    dispatch_time_t v26 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_pendingReconSessions,  "objectForKeyedSubscript:",  v14));
    if (!v26)
    {
      id v27 = objc_alloc_init(&OBJC_CLASS___MRAVLightweightReconnaissanceSession);
      pendingReconSessions = self->_pendingReconSessions;
      if (!pendingReconSessions)
      {
        id v29 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        id v30 = self->_pendingReconSessions;
        self->_pendingReconSessions = v29;

        pendingReconSessions = self->_pendingReconSessions;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:]( pendingReconSessions,  "setObject:forKeyedSubscript:",  v27,  v14);
      id v31 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
      [v31 discoverEndpointTimeoutInterval];
      double v33 = v32;
      id v34 = (void *)objc_claimAutoreleasedReturnValue([v16 string]);
      id v35 = self->_serialQueue;
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472LL;
      v37[2] = sub_1000EC0EC;
      v37[3] = &unk_10039CB58;
      id v38 = v17;
      [v27 searchEndpointsForOutputDeviceUID:v14 timeout:v34 reason:v35 queue:v37 completion:v33];
    }
  }

  else
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVLocalEndpoint sharedLocalEndpoint](&OBJC_CLASS___MRAVLocalEndpoint, "sharedLocalEndpoint"));
    (*((void (**)(id, void *))v13 + 2))(v13, v36);
  }
}

- (void)_onSerialQueue_discoverGroup:(id)a3 connect:(BOOL)a4 reason:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  id v13 = a6;
  dispatch_assert_queue_V2(serialQueue);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_1000EC3B0;
  v42[3] = &unk_1003A0548;
  v42[4] = self;
  id v14 = v10;
  id v43 = v14;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_1000EC4EC;
  v38[3] = &unk_1003A0570;
  id v15 = objc_retainBlock(v42);
  BOOL v41 = a4;
  id v40 = v15;
  v38[4] = self;
  id v16 = v11;
  id v39 = v16;
  id v17 = objc_retainBlock(v38);
  pendingGroupReconSessionCompletions = self->_pendingGroupReconSessionCompletions;
  if (!pendingGroupReconSessionCompletions)
  {
    v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v20 = self->_pendingGroupReconSessionCompletions;
    self->_pendingGroupReconSessionCompletions = v19;

    pendingGroupReconSessionCompletions = self->_pendingGroupReconSessionCompletions;
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( pendingGroupReconSessionCompletions,  "objectForKeyedSubscript:",  v14));

  if (!v21)
  {
    id v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_pendingGroupReconSessionCompletions,  "setObject:forKeyedSubscript:",  v22,  v14);
  }

  id v23 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_pendingGroupReconSessionCompletions,  "objectForKeyedSubscript:",  v14));
  id v24 = [v13 copy];

  id v25 = objc_retainBlock(v24);
  [v23 addObject:v25];

  dispatch_time_t v26 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_pendingGroupReconSessions,  "objectForKeyedSubscript:",  v14));
  if (!v26)
  {
    id v27 = objc_alloc_init(&OBJC_CLASS___MRAVLightweightReconnaissanceSession);
    pendingGroupReconSessions = self->_pendingGroupReconSessions;
    if (!pendingGroupReconSessions)
    {
      id v29 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      id v30 = self->_pendingGroupReconSessions;
      self->_pendingGroupReconSessions = v29;

      pendingGroupReconSessions = self->_pendingGroupReconSessions;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( pendingGroupReconSessions,  "setObject:forKeyedSubscript:",  v27,  v14);
    id v31 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    [v31 discoverEndpointTimeoutInterval];
    double v33 = v32;
    id v34 = (void *)objc_claimAutoreleasedReturnValue([v16 string]);
    id v35 = self->_serialQueue;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_1000EC614;
    v36[3] = &unk_10039CB58;
    id v37 = v17;
    [v27 searchEndpointsForGroupUID:v14 timeout:v34 reason:v35 queue:v36 completion:v33];
  }
}

- (void)_onSerialQueue_connectToEndpoint:(id)a3 reason:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = sub_1000EC9A4;
  v51[3] = &unk_10039BC48;
  id v14 = v13;
  id v53 = v14;
  id v15 = v12;
  id v52 = v15;
  id v16 = objc_retainBlock(v51);
  if (v10)
  {
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472LL;
    v49[2] = sub_1000ECA48;
    v49[3] = &unk_10039FE50;
    v49[4] = self;
    id v17 = v10;
    id v50 = v17;
    BOOL v42 = objc_retainBlock(v49);
    pendingConnectingEndpointCompletions = self->_pendingConnectingEndpointCompletions;
    if (!pendingConnectingEndpointCompletions)
    {
      v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      id v20 = self->_pendingConnectingEndpointCompletions;
      self->_pendingConnectingEndpointCompletions = v19;

      pendingConnectingEndpointCompletions = self->_pendingConnectingEndpointCompletions;
    }

    id v43 = v11;
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v17 uniqueIdentifier]);
    id v22 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( pendingConnectingEndpointCompletions,  "objectForKeyedSubscript:",  v21));

    if (!v22)
    {
      id v23 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      id v24 = self->_pendingConnectingEndpointCompletions;
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v17 uniqueIdentifier]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v23, v25);
    }

    dispatch_time_t v26 = self->_pendingConnectingEndpointCompletions;
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v17 uniqueIdentifier]);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v26, "objectForKeyedSubscript:", v27));
    id v29 = [v16 copy];
    id v30 = objc_retainBlock(v29);
    [v28 addObject:v30];

    id v31 = (void *)objc_claimAutoreleasedReturnValue([v17 externalDevice]);
    if ([v31 connectionState] == 2)
    {
    }

    else
    {
      unsigned __int8 v33 = [v17 isLocalEndpoint];

      if ((v33 & 1) == 0)
      {
        connectingEndpoints = self->_connectingEndpoints;
        v36 = (void *)objc_claimAutoreleasedReturnValue([v17 uniqueIdentifier]);
        id v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](connectingEndpoints, "objectForKey:", v36));

        id v34 = v42;
        id v11 = v43;
        if (!v37)
        {
          id v38 = self->_connectingEndpoints;
          if (!v38)
          {
            id v39 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            id v40 = self->_connectingEndpoints;
            self->_connectingEndpoints = v39;

            id v38 = self->_connectingEndpoints;
          }

          BOOL v41 = (void *)objc_claimAutoreleasedReturnValue([v17 uniqueIdentifier]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v38, "setObject:forKeyedSubscript:", v17, v41);

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1000ECBA8;
          block[3] = &unk_100399120;
          id v45 = v17;
          id v46 = v43;
          v47 = self;
          v48 = v42;
          dispatch_async(&_dispatch_main_q, block);
        }

        goto LABEL_11;
      }
    }

    id v34 = v42;
    ((void (*)(void *, void))v42[2])(v42, 0LL);
    id v11 = v43;
LABEL_11:

    goto LABEL_12;
  }

  Error = (void *)MRMediaRemoteCreateError(24LL);
  ((void (*)(void *, void *))v16[2])(v16, Error);

LABEL_12:
}

- (void)_onSerialQueue_addConnectedEndpoint:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 externalDevice]);
  if (v5)
  {
    id v26 = v5;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v7 = kMRExternalDeviceConnectionStateDidChangeNotification;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 externalDevice]);
    [v6 addObserver:self selector:"_handleEndpointDidInvalidateNotification:" name:v7 object:v8];

    connectedEndpoints = self->_connectedEndpoints;
    if (!connectedEndpoints)
    {
      id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      id v11 = self->_connectedEndpoints;
      self->_connectedEndpoints = v10;

      connectedEndpoints = self->_connectedEndpoints;
    }

    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](connectedEndpoints, "allObjects"));
    id v30 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
    if (v30)
    {
      uint64_t v28 = *(void *)v37;
      id v29 = v4;
      do
      {
        uint64_t v12 = 0LL;
        do
        {
          if (*(void *)v37 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v31 = v12;
          id v13 = *(void **)(*((void *)&v36 + 1) + 8 * v12);
          __int128 v32 = 0u;
          __int128 v33 = 0u;
          __int128 v34 = 0u;
          __int128 v35 = 0u;
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 outputDeviceUIDs]);
          id v15 = [v14 countByEnumeratingWithState:&v32 objects:v44 count:16];
          if (v15)
          {
            id v16 = v15;
            uint64_t v17 = *(void *)v33;
            do
            {
              for (i = 0LL; i != v16; i = (char *)i + 1)
              {
                if (*(void *)v33 != v17) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v19 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)i);
                id v20 = (void *)objc_claimAutoreleasedReturnValue([v13 outputDeviceUIDs]);
                LODWORD(v19) = [v20 containsObject:v19];

                if ((_DWORD)v19)
                {
                  uint64_t v22 = _MRLogForCategory(0LL, v21);
                  id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                  {
                    id v24 = (void *)objc_claimAutoreleasedReturnValue([v13 uniqueIdentifier]);
                    id v25 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedName]);
                    *(_DWORD *)buf = 138412546;
                    BOOL v41 = v24;
                    __int16 v42 = 2112;
                    id v43 = v25;
                    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "[MRDAutoConnectionController] Removing outdated endpoint <%@> (<%@>)",  buf,  0x16u);
                  }

                  -[NSMutableSet removeObject:](self->_connectedEndpoints, "removeObject:", v13);
                }
              }

              id v16 = [v14 countByEnumeratingWithState:&v32 objects:v44 count:16];
            }

            while (v16);
          }

          uint64_t v12 = v31 + 1;
          id v4 = v29;
        }

        while ((id)(v31 + 1) != v30);
        id v30 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
      }

      while (v30);
    }

    -[NSMutableSet addObject:](self->_connectedEndpoints, "addObject:", v4);

    v5 = v26;
  }
}

- (void)_onSerialQueue_removeConnectedEndpoint:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_connectedEndpoints, "allObjects"));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        id v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "externalDevice", (void)v19));

        if (v12 == v4)
        {
          uint64_t v14 = _MRLogForCategory(0LL, v13);
          id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueIdentifier]);
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedName]);
            *(_DWORD *)buf = 138412546;
            id v24 = v16;
            __int16 v25 = 2112;
            id v26 = v17;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[MRDAutoConnectionController] Removing endpoint <%@> (<%@>)",  buf,  0x16u);
          }

          id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
          [v18 removeObserver:self name:kMRExternalDeviceConnectionStateDidChangeNotification object:v4];

          -[NSMutableSet removeObject:](self->_connectedEndpoints, "removeObject:", v11);
          goto LABEL_13;
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

- (void)_handleEndpointDidInvalidateNotification:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kMRExternalDeviceConnectionStateUserInfoKey]);
  unsigned int v8 = [v7 intValue];

  if (v8 == 3)
  {
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000ED7B8;
    v10[3] = &unk_100398E60;
    v10[4] = self;
    id v11 = v5;
    dispatch_async(serialQueue, v10);
  }
}

- (void)_handleActiveSystemEndpointDidChangeNotification:(id)a3
{
  id v13 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v13 userInfo]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kMRMediaRemoteActiveEndpointTypeUserInfoKey]);
  unsigned int v6 = [v5 intValue];

  if (!v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v13 userInfo]);
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:kMRAVEndpointOutputDeviceIdentifierUserInfoKey]);

    uint64_t v9 = objc_alloc(&OBJC_CLASS___NSString);
    active = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription(0LL);
    id v11 = -[NSString initWithFormat:](v9, "initWithFormat:", @"%@ endpoint changed", active);

    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[MRDAutoConnectionControllerReason reasonWithType:string:]( &OBJC_CLASS___MRDAutoConnectionControllerReason,  "reasonWithType:string:",  2LL,  v11));
    -[MRDAutoConnectionController connectToOutputDevice:reason:queue:completion:]( self,  "connectToOutputDevice:reason:queue:completion:",  v8,  v12,  0LL,  0LL);
  }
}

- (void).cxx_destruct
{
}

@end
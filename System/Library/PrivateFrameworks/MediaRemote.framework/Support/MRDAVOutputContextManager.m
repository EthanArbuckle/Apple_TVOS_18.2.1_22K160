@interface MRDAVOutputContextManager
+ (id)sharedManager;
- (NSArray)outputContexts;
- (NSArray)populatedOutputContexts;
- (NSHashTable)dataSources;
- (NSMutableDictionary)activeOutputContexts;
- (NSMutableDictionary)inactiveOutputContexts;
- (NSMutableDictionary)reservedOutputContexts;
- (OS_dispatch_queue)serialQueue;
- (id)_init;
- (id)_normalizeOutputDeviceUIDs:(id)a3 fromDeviceInfo:(id)a4;
- (id)debugDescription;
- (id)outputContextForOutputDevice:(id)a3;
- (id)outputContextForOutputDeviceUID:(id)a3;
- (id)outputContextForOutputDeviceUIDs:(id)a3 strict:(BOOL)a4;
- (id)outputContextForOutputDevices:(id)a3 strict:(BOOL)a4;
- (void)_handleMediaServerDeath;
- (void)_notifyLocalDeviceDidChangeOutputContext;
- (void)addDataSource:(id)a3;
- (void)outputDevicesDidChangeNotification:(id)a3;
- (void)processOutputContext:(id)a3;
- (void)registerCommunicationChannelForOutputContext:(id)a3;
- (void)registerCommunicationsChannels;
- (void)registerForOutputContextNotifications:(id)a3;
- (void)registerOutputContext:(id)a3;
- (void)reloadOutputContexts;
- (void)removeDataSource:(id)a3;
- (void)setActiveOutputContexts:(id)a3;
- (void)setDataSources:(id)a3;
- (void)setInactiveOutputContexts:(id)a3;
- (void)setReservedOutputContexts:(id)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation MRDAVOutputContextManager

+ (id)sharedManager
{
  if (qword_1003FDCA0 != -1) {
    dispatch_once(&qword_1003FDCA0, &stru_10039B2D8);
  }
  return (id)qword_1003FDC98;
}

- (id)_init
{
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___MRDAVOutputContextManager;
  v2 = -[MRDAVOutputContextManager init](&v27, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    activeOutputContexts = v2->_activeOutputContexts;
    v2->_activeOutputContexts = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    inactiveOutputContexts = v2->_inactiveOutputContexts;
    v2->_inactiveOutputContexts = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    reservedOutputContexts = v2->_reservedOutputContexts;
    v2->_reservedOutputContexts = v7;

    v9 = (objc_class *)objc_opt_class(v2);
    Name = class_getName(v9);
    dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
    dispatch_queue_t v13 = dispatch_queue_create(Name, v12);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v13;

    uint64_t v15 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    dataSources = v2->_dataSources;
    v2->_dataSources = (NSHashTable *)v15;

    if ((MRProcessIsMediaServerDaemon() & 1) == 0)
    {
      id v17 = off_1003F5DE8();
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

      if (v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
        id v20 = off_1003F5DE8();
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        v28 = v21;
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v28, 1LL));
        [v19 setAttribute:v22 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
        id v24 = off_1003F5DE8();
        v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        [v23 addObserver:v2 selector:"_handleMediaServerDeath" name:v25 object:0];
      }
    }

    -[MRDAVOutputContextManager reloadOutputContexts](v2, "reloadOutputContexts");
  }

  return v2;
}

- (id)debugDescription
{
  uint64_t v15 = objc_alloc(&OBJC_CLASS___NSString);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVOutputContextManager description](self, "description"));
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[MRAVOutputContext sharedAudioPresentationContext]( &OBJC_CLASS___MRAVOutputContext,  "sharedAudioPresentationContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v16 debugDescription]);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVOutputContextManager activeOutputContexts](self, "activeOutputContexts"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allValues]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mr_map:", &stru_10039B318));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 componentsJoinedByString:@"\n"]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVOutputContextManager inactiveOutputContexts](self, "inactiveOutputContexts"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 debugDescription]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVOutputContextManager reservedOutputContexts](self, "reservedOutputContexts"));
  dispatch_queue_attr_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 debugDescription]);
  v12 = -[NSString initWithFormat:]( v15,  "initWithFormat:",  @"%@\nlocal=%@\nactive=%@\ninactive=%@\nreserved=%@",  v14,  v3,  v7,  v9,  v11);

  return v12;
}

- (void)addDataSource:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000426E4;
  block[3] = &unk_100398E60;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
}

- (void)removeDataSource:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004276C;
  block[3] = &unk_100398E60;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
}

- (NSArray)outputContexts
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_10004282C;
  v10 = sub_10004283C;
  id v11 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100042844;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NSArray)populatedOutputContexts
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_10004282C;
  v10 = sub_10004283C;
  id v11 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000429A8;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)registerCommunicationsChannels
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100042A94;
  v8[3] = &unk_10039B340;
  v8[4] = self;
  id v3 = objc_retainBlock(v8);
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100042B88;
  block[3] = &unk_10039AD10;
  block[4] = self;
  id v7 = v3;
  v5 = v3;
  dispatch_sync(serialQueue, block);
}

- (id)outputContextForOutputDevice:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 uid]);
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVOutputContextManager outputContextForOutputDeviceUID:]( self,  "outputContextForOutputDeviceUID:",  v4));

  return v5;
}

- (id)outputContextForOutputDevices:(id)a3 strict:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "mr_map:", &stru_10039B360));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVOutputContextManager outputContextForOutputDeviceUIDs:strict:]( self,  "outputContextForOutputDeviceUIDs:strict:",  v6,  v4));

  return v7;
}

- (id)outputContextForOutputDeviceUID:(id)a3
{
  id v8 = a3;
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVOutputContextManager outputContextForOutputDeviceUIDs:strict:]( self,  "outputContextForOutputDeviceUIDs:strict:",  v5,  0LL,  v8));
  return v6;
}

- (id)outputContextForOutputDeviceUIDs:(id)a3 strict:(BOOL)a4
{
  id v6 = a3;
  uint64_t v26 = 0LL;
  objc_super v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  v29 = sub_10004282C;
  v30 = sub_10004283C;
  id v31 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MROrigin localOrigin](&OBJC_CLASS___MROrigin, "localOrigin"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[MRDeviceInfoRequest cachedDeviceInfoForOrigin:]( &OBJC_CLASS___MRDeviceInfoRequest,  "cachedDeviceInfoForOrigin:",  v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVOutputContextManager _normalizeOutputDeviceUIDs:fromDeviceInfo:]( self,  "_normalizeOutputDeviceUIDs:fromDeviceInfo:",  v6,  v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v9));

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceUID]);
  unsigned int v12 = [v10 containsObject:v11];
  char v13 = v12;
  if (v12) {
    id v14 = v11;
  }
  else {
    id v14 = (id)objc_claimAutoreleasedReturnValue([v10 anyObject]);
  }
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100042F1C;
  block[3] = &unk_10039B3D8;
  block[4] = self;
  id v21 = v10;
  BOOL v24 = a4;
  id v22 = v14;
  v23 = &v26;
  char v25 = v13;
  id v16 = v14;
  id v17 = v10;
  dispatch_sync(serialQueue, block);
  id v18 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v18;
}

- (void)registerOutputContext:(id)a3
{
  id v5 = a3;
  -[MRDAVOutputContextManager registerForOutputContextNotifications:]( self,  "registerForOutputContextNotifications:",  v5);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___MRAVConcreteOutputContext);
  if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0) {
    -[MRDAVOutputContextManager registerCommunicationChannelForOutputContext:]( self,  "registerCommunicationChannelForOutputContext:",  v5);
  }
}

- (void)registerForOutputContextNotifications:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 addObserver:self selector:"outputDevicesDidChangeNotification:" name:MRAVOutputContextOutputDevicesDidChangeNotification object:v4];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 addObserver:self selector:"_handleOutputContextDidAddLocalDevice:" name:MRAVOutputContextDidAddLocalDeviceNotification object:v4];

  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v7 addObserver:self selector:"_handleOutputContextDidRemoveLocalDevice:" name:MRAVOutputContextDidRemoveLocalDeviceNotification object:v4];
}

- (void)registerCommunicationChannelForOutputContext:(id)a3
{
  id v3 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v8 externalDeviceServer]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteControlService]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 airPlayService]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 avOutputContext]);

  [v6 startContext:v7];
}

- (void)outputDevicesDidChangeNotification:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 object]);
  -[MRDAVOutputContextManager processOutputContext:](self, "processOutputContext:", v4);
}

- (void)_notifyLocalDeviceDidChangeOutputContext
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  [v2 postClientNotificationNamed:MRAVOutputContextManagerLocalDeviceDidChangeOutputContextNotification];
}

- (void)_handleMediaServerDeath
{
  uint64_t v3 = _MRLogForCategory(0LL, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[MRDAVOutputContextManager] Re-building output context state in response to mediaserverd death",  buf,  2u);
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100043BB8;
  block[3] = &unk_100399250;
  block[4] = self;
  dispatch_sync(serialQueue, block);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 postNotificationName:@"MRDAVOutputContextManagerDidReset" object:self];

  dispatch_time_t v7 = dispatch_time(0LL, 300000000LL);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100043BF4;
  v8[3] = &unk_100399250;
  v8[4] = self;
  dispatch_after(v7, &_dispatch_main_q, v8);
}

- (void)reloadOutputContexts
{
  id v3 = -[objc_class allSharedAudioOutputContexts](off_1003F5DF0(), "allSharedAudioOutputContexts");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mr_map:", &stru_10039B418));

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8LL * (void)i);
        -[MRDAVOutputContextManager processOutputContext:](self, "processOutputContext:", v11, (void)v12);
        -[MRDAVOutputContextManager registerOutputContext:](self, "registerOutputContext:", v11);
      }

      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }
}

- (void)processOutputContext:(id)a3
{
  id v4 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 contextID]);
  if (v6)
  {
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100043E74;
    block[3] = &unk_100398F40;
    id v17 = v4;
    id v18 = self;
    id v19 = v6;
    dispatch_sync(serialQueue, block);
  }

  else
  {
    uint64_t v8 = _MRLogForCategory(0LL, v5);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1002B5988((uint64_t)v4, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

- (id)_normalizeOutputDeviceUIDs:(id)a3 fromDeviceInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceUID]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 clusterID]);
  uint64_t v9 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 clusteredDevices]);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "msv_map:", &stru_10039B478));
  uint64_t v12 = -[NSMutableArray initWithArray:](v9, "initWithArray:", v11);

  if (v7) {
    -[NSMutableArray addObject:](v12, "addObject:", v7);
  }
  if (v8) {
    -[NSMutableArray addObject:](v12, "addObject:", v8);
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000444EC;
  v21[3] = &unk_10039B1C0;
  id v22 = v12;
  uint64_t v13 = v12;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "msv_filter:", v21));
  id v15 = [v14 count];
  if (v15 == [v5 count])
  {
    id v16 = v14;
  }

  else
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 arrayByAddingObject:v7]);

    uint64_t v18 = _MRLogForCategory(0LL, v17);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_1002B59EC();
    }
  }

  return v16;
}

- (NSMutableDictionary)activeOutputContexts
{
  return self->_activeOutputContexts;
}

- (void)setActiveOutputContexts:(id)a3
{
}

- (NSMutableDictionary)reservedOutputContexts
{
  return self->_reservedOutputContexts;
}

- (void)setReservedOutputContexts:(id)a3
{
}

- (NSMutableDictionary)inactiveOutputContexts
{
  return self->_inactiveOutputContexts;
}

- (void)setInactiveOutputContexts:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (NSHashTable)dataSources
{
  return self->_dataSources;
}

- (void)setDataSources:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
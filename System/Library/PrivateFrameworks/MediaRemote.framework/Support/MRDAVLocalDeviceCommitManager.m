@interface MRDAVLocalDeviceCommitManager
- (BOOL)_shouldCommitLocalDeviceWithReason:(id)a3 deviceInfo:(id)a4;
- (BOOL)_shouldRemoveLocalDeviceWithReason:(id)a3 deviceInfo:(id)a4;
- (MRDAVLocalDeviceCommitManager)init;
- (MSVTimer)timer;
- (NSMutableSet)activeTopologyChangeIdentifiers;
- (OS_dispatch_queue)serialQueue;
- (void)_commitLocalDeviceWithReason:(id)a3;
- (void)airplayActiveDidChangeNotification:(id)a3;
- (void)clusterController:(id)a3 clusterTypeDidChange:(unsigned int)a4;
- (void)eventuallyCommitOutputDevice:(id)a3;
- (void)maybeCommitLocalDeviceWithReason:(id)a3;
- (void)outputContextDidRemoveLocalDeviceNotification:(id)a3;
- (void)outputContextModificationDidBeginNotification:(id)a3;
- (void)outputContextModificationDidFinishNotification:(id)a3;
- (void)setActiveTopologyChangeIdentifiers:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setTimer:(id)a3;
- (void)validateAirPlayConfigurationForReason:(id)a3;
@end

@implementation MRDAVLocalDeviceCommitManager

- (MRDAVLocalDeviceCommitManager)init
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MRDAVLocalDeviceCommitManager;
  v2 = -[MRDAVLocalDeviceCommitManager init](&v17, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("MRDAVLocalDeviceCommitManager.serial", v4);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    activeTopologyChangeIdentifiers = v2->_activeTopologyChangeIdentifiers;
    v2->_activeTopologyChangeIdentifiers = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v9 addObserver:v2 selector:"airplayActiveDidChangeNotification:" name:@"MRDRoutingServerAirplayActiveDidChange" object:0];

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v11 = MRAVOutputContextDidRemoveLocalDeviceNotification;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[MRAVOutputContext sharedAudioPresentationContext]( &OBJC_CLASS___MRAVOutputContext,  "sharedAudioPresentationContext"));
    [v10 addObserver:v2 selector:"outputContextDidRemoveLocalDeviceNotification:" name:v11 object:v12];

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v13 addObserver:v2 selector:"outputContextModificationDidBeginNotification:" name:MRAVOutputContextDidBeginModificationNotification object:0];

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v14 addObserver:v2 selector:"outputContextModificationDidFinishNotification:" name:MRAVOutputContextDidFinishModificationNotification object:0];

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVClusterController sharedController](&OBJC_CLASS___MRAVClusterController, "sharedController"));
    [v15 registerObserver:v2];

    -[MRDAVLocalDeviceCommitManager eventuallyCommitOutputDevice:](v2, "eventuallyCommitOutputDevice:", @"Boot");
    -[MRDAVLocalDeviceCommitManager validateAirPlayConfigurationForReason:]( v2,  "validateAirPlayConfigurationForReason:",  @"Boot");
  }

  return v2;
}

- (void)airplayActiveDidChangeNotification:(id)a3
{
}

- (void)outputContextModificationDidBeginNotification:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 objectForKeyedSubscript:MRAVOutputContextModificationOutputDeviceIdentifiersUserInfoKey]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 objectForKeyedSubscript:MRAVOutputContextExistingOutputDeviceIdentifiersUserInfoKey]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:MRAVOutputContextModificationTypeUserInfoKey]);
  id v11 = [v10 unsignedIntegerValue];

  v14 = (void *)MRMediaRemoteCopyDeviceUID(v12, v13);
  unsigned int v15 = [v6 containsObject:v14];
  if (v11 == (id)3) {
    unsigned int v16 = [v8 containsObject:v14];
  }
  else {
    unsigned int v16 = 0;
  }
  if ((v15 | v16) == 1)
  {
    objc_super v17 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:MRAVOutputContextModificationIdentifierUserInfoKey]);

    v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDAVLocalDeviceCommitManager serialQueue](self, "serialQueue"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100046E24;
    v21[3] = &unk_100398E60;
    v21[4] = self;
    id v22 = v18;
    id v20 = v18;
    dispatch_async(v19, v21);
  }
}

- (void)outputContextModificationDidFinishNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:MRAVOutputContextModificationIdentifierUserInfoKey]);

  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDAVLocalDeviceCommitManager serialQueue](self, "serialQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100046F20;
  v8[3] = &unk_100398E60;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)outputContextDidRemoveLocalDeviceNotification:(id)a3
{
}

- (void)clusterController:(id)a3 clusterTypeDidChange:(unsigned int)a4
{
}

- (void)validateAirPlayConfigurationForReason:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);

  id v7 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@<%@>", v4, v6);
  uint64_t v9 = _MRLogForCategory(0LL, v8);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    objc_super v17 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[LocalDeviceCommitManager] Maybe eventually remove localDevice with reason %@...",  buf,  0xCu);
  }

  dispatch_time_t v11 = dispatch_time(0LL, 1000000000LL);
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100047184;
  block[3] = &unk_100398E60;
  block[4] = self;
  unsigned int v15 = v7;
  uint64_t v13 = v7;
  dispatch_after(v11, serialQueue, block);
}

- (void)eventuallyCommitOutputDevice:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);

  id v7 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@<%@>", v4, v6);
  uint64_t v9 = _MRLogForCategory(0LL, v8);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    unsigned int v16 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[LocalDeviceCommitManager] Maybe eventually commit with reason %@...",  buf,  0xCu);
  }

  dispatch_time_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDAVLocalDeviceCommitManager serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100047518;
  block[3] = &unk_100398E60;
  block[4] = self;
  v14 = v7;
  uint64_t v12 = v7;
  dispatch_async(v11, block);
}

- (void)maybeCommitLocalDeviceWithReason:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceInfo]);

  if (-[MRDAVLocalDeviceCommitManager _shouldCommitLocalDeviceWithReason:deviceInfo:]( self,  "_shouldCommitLocalDeviceWithReason:deviceInfo:",  v6,  v5))
  {
    -[MRDAVLocalDeviceCommitManager _commitLocalDeviceWithReason:](self, "_commitLocalDeviceWithReason:", v6);
  }
}

- (BOOL)_shouldCommitLocalDeviceWithReason:(id)a3 deviceInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned __int8 v9 = [v8 supportOutputContextPrewarming];

  if ((v9 & 1) != 0)
  {
    dispatch_time_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned __int8 v12 = [v11 supportMultiplayerHost];

    if ((v12 & 1) == 0)
    {
      uint64_t v21 = _MRLogForCategory(0LL, v13);
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v46 = 138412290;
        id v47 = v6;
        v19 = "[LocalDeviceCommitManager] Not committing %@ because Not multiplayer";
        goto LABEL_10;
      }

      goto LABEL_11;
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVClusterController sharedController](&OBJC_CLASS___MRAVClusterController, "sharedController"));
    unsigned int v15 = [v14 needsCommandRedirection];

    if (v15)
    {
      uint64_t v17 = _MRLogForCategory(0LL, v16);
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v46 = 138412290;
        id v47 = v6;
        v19 = "[LocalDeviceCommitManager] Not committing %@ because Home Theater secondary";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v46, 0xCu);
        goto LABEL_11;
      }

      goto LABEL_11;
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[MRDAVOutputContextManager sharedManager](&OBJC_CLASS___MRDAVOutputContextManager, "sharedManager"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v7 WHAIdentifier]);
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v24 outputContextForOutputDeviceUID:v25]);

    if (-[os_log_s containsLocalDevice](v18, "containsLocalDevice"))
    {
      uint64_t v27 = _MRLogForCategory(0LL, v26);
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        int v46 = 138412290;
        id v47 = v6;
        v29 = "[LocalDeviceCommitManager] Not committing %@ because containsLocalDevice";
LABEL_19:
        v34 = v28;
        uint32_t v35 = 12;
LABEL_20:
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, v29, (uint8_t *)&v46, v35);
        goto LABEL_21;
      }

      goto LABEL_21;
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVLocalDeviceCommitManager activeTopologyChangeIdentifiers]( self,  "activeTopologyChangeIdentifiers"));
    id v31 = [v30 count];

    if (v31)
    {
      uint64_t v33 = _MRLogForCategory(0LL, v32);
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        int v46 = 138412290;
        id v47 = v6;
        v29 = "[LocalDeviceCommitManager] Not committing %@ because localDevice part of another topology modification";
        goto LABEL_19;
      }

- (BOOL)_shouldRemoveLocalDeviceWithReason:(id)a3 deviceInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((([v6 clusterType] - 1) & 0xFFFFFFFD) != 0)
  {
    uint64_t v8 = _MRLogForCategory(0LL, v7);
    unsigned __int8 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 138412290;
      id v28 = v5;
      uint64_t v10 = "[LocalDeviceCommitManager] Not removing localDevice %@ because not dynamicCluster";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v27, 0xCu);
      goto LABEL_15;
    }

    goto LABEL_15;
  }

  dispatch_time_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVClusterController sharedController](&OBJC_CLASS___MRAVClusterController, "sharedController"));
  unsigned int v12 = [v11 needsCommandRedirection];

  if (v12)
  {
    uint64_t v14 = _MRLogForCategory(0LL, v13);
    unsigned __int8 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 138412290;
      id v28 = v5;
      uint64_t v10 = "[LocalDeviceCommitManager] Not removing localDevice %@ because needsCommandRedirection";
      goto LABEL_14;
    }

- (void)_commitLocalDeviceWithReason:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _MRLogForCategory(0LL, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[LocalDeviceCommitManager] Committing %@...",  buf,  0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceInfo]);

  if ((([v9 clusterType] - 1) & 0xFFFFFFFD) == 0)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned int v11 = [v10 supportAirplayStereoPairPersistentConnections];

    if (v11) {
      MRMediaRemoteSetClusterLeader();
    }
  }

  unsigned int v12 = objc_alloc_init(&OBJC_CLASS____MRAVOutputDeviceDescriptorProtobuf);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 clusterID]);
  -[_MRAVOutputDeviceDescriptorProtobuf setClusterID:](v12, "setClusterID:", v13);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceUID]);
  -[_MRAVOutputDeviceDescriptorProtobuf setUniqueIdentifier:](v12, "setUniqueIdentifier:", v14);

  unsigned int v15 = -[MRAVDistantOutputDevice initWithDescriptor:]( objc_alloc(&OBJC_CLASS___MRAVDistantOutputDevice),  "initWithDescriptor:",  v12);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[MRDAVOutputContextManager sharedManager](&OBJC_CLASS___MRDAVOutputContextManager, "sharedManager"));
  unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([v9 WHAIdentifier]);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 outputContextForOutputDeviceUID:v17]);

  v19 = -[MRRequestDetails initWithName:requestID:reason:]( objc_alloc(&OBJC_CLASS___MRRequestDetails),  "initWithName:requestID:reason:",  @"CommitLocalDevice",  v4,  @"Prewarm");
  uint64_t v20 = objc_alloc(&OBJC_CLASS___MRGroupTopologyModificationRequest);
  int v27 = v15;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v27, 1LL));
  unsigned __int8 v22 = -[MRGroupTopologyModificationRequest initWithRequestDetails:type:outputDevices:]( v20,  "initWithRequestDetails:type:outputDevices:",  v19,  1LL,  v21);

  serialQueue = self->_serialQueue;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10004801C;
  v25[3] = &unk_100399508;
  id v26 = v4;
  id v24 = v4;
  [v18 modifyTopologyWithRequest:v22 withReplyQueue:serialQueue completion:v25];
}

- (NSMutableSet)activeTopologyChangeIdentifiers
{
  return self->_activeTopologyChangeIdentifiers;
}

- (void)setActiveTopologyChangeIdentifiers:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (MSVTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
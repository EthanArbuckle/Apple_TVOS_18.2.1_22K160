@interface ADServiceConnectionProviderServiceDelegate
- (ADServiceConnectionProviderServiceDelegate)initWithServiceConnection:(id)a3 syncQueue:(id)a4;
- (id)syncRequestForUUID:(id)a3;
- (void)assistantServiceWillCrashForStuckSyncPluginAtPath:(id)a3;
- (void)clearSyncRequestWithUUID:(id)a3;
- (void)dismissAssistant;
- (void)dismissAssistantWithReason:(int64_t)a3;
- (void)fetchContextsForKeys:(id)a3 forRequestID:(id)a4 includesNearbyDevices:(BOOL)a5 completion:(id)a6;
- (void)getCarDNDModeWithReply:(id)a3;
- (void)getLockStateWithReply:(id)a3;
- (void)getStarkModeWithReply:(id)a3;
- (void)getTimeoutSuspendedWithReply:(id)a3;
- (void)getWatchAuthenticatedWithReply:(id)a3;
- (void)handleCommand:(id)a3 executionInfo:(id)a4 completion:(id)a5;
- (void)openURL:(id)a3 reply:(id)a4;
- (void)prepareForAudioHandoffFailedWithCompletion:(id)a3;
- (void)prepareForAudioHandoffWithCompletion:(id)a3;
- (void)setSyncRequest:(id)a3 forUUID:(id)a4;
- (void)syncChunksWithPreAnchor:(id)a3 postAnchor:(id)a4 updates:(id)a5 deletes:(id)a6 validity:(id)a7 forRequestUUID:(id)a8 reply:(id)a9;
@end

@implementation ADServiceConnectionProviderServiceDelegate

- (ADServiceConnectionProviderServiceDelegate)initWithServiceConnection:(id)a3 syncQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ADServiceConnectionProviderServiceDelegate;
  v8 = -[ADServiceConnectionProviderServiceDelegate init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_serviceConnection, v6);
    objc_storeStrong((id *)&v9->_syncQueue, a4);
    v10 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  2LL);
    syncRequestsByUUID = v9->_syncRequestsByUUID;
    v9->_syncRequestsByUUID = v10;
  }

  return v9;
}

- (id)syncRequestForUUID:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->_syncRequestsByUUID, "objectForKey:", a3);
}

- (void)setSyncRequest:(id)a3 forUUID:(id)a4
{
}

- (void)clearSyncRequestWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ADServiceConnectionProviderServiceDelegate syncRequestForUUID:](self, "syncRequestForUUID:", v4));
  [v5 invalidateTimer];
  [v5 setSyncChunkHandler:0];
  -[NSMutableDictionary removeObjectForKey:](self->_syncRequestsByUUID, "removeObjectForKey:", v4);
}

- (void)syncChunksWithPreAnchor:(id)a3 postAnchor:(id)a4 updates:(id)a5 deletes:(id)a6 validity:(id)a7 forRequestUUID:(id)a8 reply:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  syncQueue = (dispatch_queue_s *)self->_syncQueue;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100254224;
  v30[3] = &unk_1004F7A78;
  v30[4] = self;
  id v31 = v20;
  id v32 = v15;
  id v33 = v16;
  id v34 = v17;
  id v35 = v18;
  id v36 = v19;
  id v37 = v21;
  id v23 = v21;
  id v24 = v19;
  id v25 = v18;
  id v26 = v17;
  id v27 = v16;
  id v28 = v15;
  id v29 = v20;
  dispatch_async(syncQueue, v30);
}

- (void)openURL:(id)a3 reply:(id)a4
{
  id v9 = a3;
  id v6 = (void (**)(id, void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceConnection);
  v8 = WeakRetained;
  if (v9 && WeakRetained) {
    [WeakRetained _openURL:v9 completion:v6];
  }
  else {
    v6[2](v6, 0LL);
  }
}

- (void)dismissAssistant
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v2 dismissAssistant];
}

- (void)dismissAssistantWithReason:(int64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v4 dismissAssistantWithReason:a3];
}

- (void)getLockStateWithReply:(id)a3
{
  p_serviceConnection = &self->_serviceConnection;
  id v4 = (void (**)(id, void))a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_serviceConnection);
  id v6 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _getLockStateWithReply:v4];
  }
  else {
    v4[2](v4, 0LL);
  }
}

- (void)getCarDNDModeWithReply:(id)a3
{
  p_serviceConnection = &self->_serviceConnection;
  id v4 = (void (**)(id, void))a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_serviceConnection);
  id v6 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _getCarDNDModeWithReply:v4];
  }
  else {
    v4[2](v4, 0LL);
  }
}

- (void)getStarkModeWithReply:(id)a3
{
  p_serviceConnection = &self->_serviceConnection;
  id v4 = (void (**)(id, void))a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_serviceConnection);
  id v6 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _getStarkModeWithReply:v4];
  }
  else {
    v4[2](v4, 0LL);
  }
}

- (void)getWatchAuthenticatedWithReply:(id)a3
{
  p_serviceConnection = &self->_serviceConnection;
  id v4 = (void (**)(id, void))a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_serviceConnection);
  id v6 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _getWatchAuthenticationWithReply:v4];
  }
  else {
    v4[2](v4, 0LL);
  }
}

- (void)prepareForAudioHandoffWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100254218;
  v6[3] = &unk_1004FDA58;
  id v7 = v3;
  id v5 = v3;
  [v4 prepareForStartPlaybackWithDestination:1 intent:0 completion:v6];
}

- (void)prepareForAudioHandoffFailedWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10025420C;
  v6[3] = &unk_1004FC838;
  id v7 = v3;
  id v5 = v3;
  [v4 handleFailedStartPlaybackWithDestination:1 completion:v6];
}

- (void)fetchContextsForKeys:(id)a3 forRequestID:(id)a4 includesNearbyDevices:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  id v12 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v12 getDeviceContextsForKeys:v11 forRequestID:v10 includesNearbyDevices:v6 completion:v9];
}

- (void)handleCommand:(id)a3 executionInfo:(id)a4 completion:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceConnection);
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _handleCommand:v13 executionInfo:v8 completion:v9];
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 7LL));
    v9[2](v9, 0LL, v12);
  }
}

- (void)getTimeoutSuspendedWithReply:(id)a3
{
  p_serviceConnection = &self->_serviceConnection;
  id v4 = (void (**)(id, void))a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_serviceConnection);
  id v6 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _getTimeoutSuspendedWithReply:v4];
  }
  else {
    v4[2](v4, 0LL);
  }
}

- (void)assistantServiceWillCrashForStuckSyncPluginAtPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SiriCoreSymptomsReporter sharedInstance](&OBJC_CLASS___SiriCoreSymptomsReporter, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 lastPathComponent]);
  id v11 = @"plugin_path";
  id v12 = v4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));

  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceConnection);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _connection]);
  id v10 = [v9 processIdentifier];
  [v5 reportIssueForType:@"stuck_sync_plugin" subType:v6 context:v7 processIdentifier:v10 walkboutStatus:byte_1005780A0];
}

- (void).cxx_destruct
{
}

@end
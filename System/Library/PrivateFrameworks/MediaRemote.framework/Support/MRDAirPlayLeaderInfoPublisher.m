@interface MRDAirPlayLeaderInfoPublisher
- (BOOL)isValidOutputDevice:(id)a3;
- (MRAVConcreteOutputContext)outputContext;
- (MRDAirPlayLeaderInfoPublisher)init;
- (MRDAirPlayLeaderInfoPublisher)initWithOrigin:(id)a3 outputContext:(id)a4;
- (MRDeviceInfo)deviceInfo;
- (MROrigin)origin;
- (OS_dispatch_queue)workerQueue;
- (id)currentData;
- (void)handleDeviceInfoDidChange:(id)a3;
- (void)publish;
- (void)publishToOutputDevices:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setWorkerQueue:(id)a3;
@end

@implementation MRDAirPlayLeaderInfoPublisher

- (MRDAirPlayLeaderInfoPublisher)initWithOrigin:(id)a3 outputContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MRDAirPlayLeaderInfoPublisher;
  v9 = -[MRDAirPlayLeaderInfoPublisher init](&v19, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_origin, a3);
    objc_storeStrong((id *)&v10->_outputContext, a4);
    dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.MediaRemote.MRDAirPlayLeaderInfoPublisher", v12);
    workerQueue = v10->_workerQueue;
    v10->_workerQueue = (OS_dispatch_queue *)v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100045578;
    v17[3] = &unk_100399250;
    v18 = v10;
    [v15 addMediaRemoteSeverStartedHandler:v17];
  }

  return v10;
}

- (MRDAirPlayLeaderInfoPublisher)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MROrigin localOrigin](&OBJC_CLASS___MROrigin, "localOrigin"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[MRAVConcreteOutputContext sharedAudioPresentationContext]( &OBJC_CLASS___MRAVConcreteOutputContext,  "sharedAudioPresentationContext"));
  v5 = -[MRDAirPlayLeaderInfoPublisher initWithOrigin:outputContext:](self, "initWithOrigin:outputContext:", v3, v4);

  return v5;
}

- (MRDeviceInfo)deviceInfo
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_deviceInfo;
  objc_sync_exit(v2);

  return v3;
}

- (void)setDeviceInfo:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = v5->_deviceInfo;
  id v7 = (MRDeviceInfo *)v4;
  dispatch_queue_attr_t v11 = v7;
  if (v6 == v7)
  {
  }

  else
  {
    unsigned __int8 v8 = -[MRDeviceInfo isEqual:](v6, "isEqual:", v7);

    if ((v8 & 1) == 0)
    {
      v9 = (MRDeviceInfo *)-[MRDeviceInfo copy](v11, "copy");
      deviceInfo = v5->_deviceInfo;
      v5->_deviceInfo = v9;

      -[MRDAirPlayLeaderInfoPublisher publish](v5, "publish");
    }
  }

  objc_sync_exit(v5);
}

- (void)handleDeviceInfoDidChange:(id)a3
{
  id v13 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v13 userInfo]);
  uint64_t v5 = MRGetOriginFromUserInfo();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAirPlayLeaderInfoPublisher origin](self, "origin"));
  unsigned int v8 = [v6 isEqual:v7];

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v13 userInfo]);
    uint64_t v11 = MRGetDeviceInfoFromUserInfo(v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[MRDAirPlayLeaderInfoPublisher setDeviceInfo:](self, "setDeviceInfo:", v12);
  }
}

- (BOOL)isValidOutputDevice:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 deviceType] == 1 && objc_msgSend(v3, "deviceSubtype") != 1;

  return v4;
}

- (id)currentData
{
  id v3 = objc_alloc_init(&OBJC_CLASS____MRAirPlayLeaderInfoProtobuf);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAirPlayLeaderInfoPublisher deviceInfo](self, "deviceInfo"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 protobuf]);
  [v3 setDeviceInfo:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 data]);
  return v6;
}

- (void)publishToOutputDevices:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDAirPlayLeaderInfoPublisher workerQueue](self, "workerQueue"));
  dispatch_assert_queue_V2(v5);

  if ([v4 count])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAirPlayLeaderInfoPublisher currentData](self, "currentData"));
    if (v6)
    {
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      id v7 = v4;
      id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v14;
        do
        {
          uint64_t v11 = 0LL;
          do
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v13 + 1) + 8 * (void)v11),  "avOutputDevice",  (void)v13));
            [v12 setMediaRemoteData:v6 completionHandler:&stru_10039B540];

            uint64_t v11 = (char *)v11 + 1;
          }

          while (v9 != v11);
          id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }

        while (v9);
      }
    }
  }
}

- (void)publish
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDAirPlayLeaderInfoPublisher workerQueue](self, "workerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100045B1C;
  block[3] = &unk_100399250;
  block[4] = self;
  dispatch_async(v3, block);
}

- (MROrigin)origin
{
  return self->_origin;
}

- (MRAVConcreteOutputContext)outputContext
{
  return self->_outputContext;
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (void)setWorkerQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
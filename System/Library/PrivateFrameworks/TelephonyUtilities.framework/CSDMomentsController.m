@interface CSDMomentsController
+ (BOOL)isFaceTimePhotosAvailable;
+ (BOOL)shouldPreserveMomentsFile;
+ (CSDMomentsControllerLocalCapabilities)localCapabilities;
+ (void)setLocalCapabilities:(id)a3;
- (CSDCallCenterObserver)callCenterObserver;
- (CSDClientManager)clientManager;
- (CSDFileTransferring)fileTransferController;
- (CSDMediaAssetManaging)mediaAssetManager;
- (CSDMomentsController)init;
- (CSDMomentsController)initWithQueue:(id)a3 fileTransferController:(id)a4 mediaAssetManager:(id)a5 callCenterObserver:(id)a6;
- (CSDMomentsControllerDelegate)delegate;
- (CSDMomentsServerBag)serverBag;
- (NSMapTable)streamTokensByCSDClient;
- (NSMutableDictionary)sessionsByToken;
- (OS_dispatch_queue)queue;
- (TUFeatureFlags)featureFlags;
- (TUMomentsControllerXPCClient)momentsClient;
- (id)contentsOfDirectoryAtURL:(id)a3;
- (id)momentsGenerator;
- (id)sessionForTransactionID:(id)a3;
- (id)urlFromResources:(id)a3 withExtension:(id)a4;
- (int)availabilityWithRemoteAvailable:(BOOL)a3;
- (void)_handleReceivedResourcesAtDirectoryURL:(id)a3;
- (void)_handleReceivedVideoURL:(id)a3;
- (void)_saveLivePhotoWithPhotoURL:(id)a3 videoURL:(id)a4 completion:(id)a5;
- (void)_saveVideoWithURL:(id)a3 completion:(id)a4;
- (void)_startTimeoutForMomentsRequestWithTransactionID:(id)a3;
- (void)_transferFileAtURL:(id)a3 forSession:(id)a4 request:(id)a5;
- (void)cleanUpForMomentIfNecessary:(id)a3;
- (void)deleteContentsAtURL:(id)a3;
- (void)discardVideoMessageWithUUID:(id)a3 completion:(id)a4;
- (void)endRecordingMessageWithUUID:(id)a3 completion:(id)a4;
- (void)endRequestWithTransactionID:(id)a3 reply:(id)a4;
- (void)fileTransferer:(id)a3 didReceiveResourcesAtURL:(id)a4 withMetadata:(id)a5 isZipped:(BOOL)a6 fromIDSDestination:(id)a7;
- (void)fileTransferer:(id)a3 didTransferFileAtURL:(id)a4 successfully:(BOOL)a5;
- (void)handleClientDisconnected:(id)a3;
- (void)handleRequestResultWithMomentDescriptor:(id)a3;
- (void)moments:(id)a3 capabilitiesDidChange:(unsigned int)a4;
- (void)moments:(id)a3 didEndProcessingRequest:(id)a4 stillImageURL:(id)a5 movieURL:(id)a6 error:(id)a7;
- (void)moments:(id)a3 didFinishRequest:(id)a4 error:(id)a5;
- (void)moments:(id)a3 didStartProcessingRequest:(id)a4 error:(id)a5;
- (void)momentsServerDidDisconnect:(id)a3;
- (void)prewarmAudioClientWithCompletion:(id)a3;
- (void)registerClient:(id)a3;
- (void)registerStreamToken:(int64_t)a3 requesterID:(id)a4 remoteIDSDestinations:(id)a5 remoteMomentsAvailable:(BOOL)a6 reply:(id)a7;
- (void)registerXPCClientWithReply:(id)a3;
- (void)resetVideoMessagingWithSessionUUID:(id)a3 completionHandler:(id)a4;
- (void)saveVideoMessageWithUUID:(id)a3 completion:(id)a4;
- (void)sendVideoMessageWithUUID:(id)a3 callUUID:(id)a4 toHandles:(id)a5 completion:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setMomentsGenerator:(id)a3;
- (void)setServerBag:(id)a3;
- (void)startRecordingMessageWithMediaType:(int)a3 completion:(id)a4;
- (void)startRequestWithMediaType:(int)a3 forStreamToken:(int64_t)a4 requesteeID:(id)a5 destinationID:(id)a6 reply:(id)a7;
- (void)startRequestWithMediaType:(int)a3 forStreamToken:(int64_t)a4 requesteeID:(id)a5 reply:(id)a6;
- (void)unregisterClient:(id)a3;
- (void)unregisterStreamToken:(int64_t)a3;
- (void)unregisterStreamToken:(int64_t)a3 reply:(id)a4;
@end

@implementation CSDMomentsController

- (CSDMomentsController)init
{
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.telephonyutilities.callservicesd.csdmomentscontroller", 0LL);
  v4 = objc_alloc_init(&OBJC_CLASS___CSDFileTransferController);
  v5 = objc_alloc_init(&OBJC_CLASS___CSDMediaAssetManager);
  v6 = objc_alloc_init(&OBJC_CLASS___CSDCallCenterObserver);
  v7 = -[CSDMomentsController initWithQueue:fileTransferController:mediaAssetManager:callCenterObserver:]( self,  "initWithQueue:fileTransferController:mediaAssetManager:callCenterObserver:",  v3,  v4,  v5,  v6);

  return v7;
}

- (CSDMomentsController)initWithQueue:(id)a3 fileTransferController:(id)a4 mediaAssetManager:(id)a5 callCenterObserver:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___CSDMomentsController;
  v15 = -[CSDMomentsController init](&v24, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_queue, a3);
    queue = (dispatch_queue_s *)v16->_queue;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10018C76C;
    v19[3] = &unk_1003D7B28;
    v20 = v16;
    id v21 = v12;
    id v22 = v13;
    id v23 = v14;
    dispatch_async(queue, v19);
  }

  return v16;
}

- (void)handleClientDisconnected:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "handle disconnect for client: %@", buf, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController streamTokensByCSDClient](self, "streamTokensByCSDClient"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v4]);

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      id v14 = 0LL;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        -[CSDMomentsController unregisterStreamToken:]( self,  "unregisterStreamToken:",  objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)v14), "integerValue", (void)v16));
        id v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v12);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController streamTokensByCSDClient](self, "streamTokensByCSDClient"));
  [v15 removeObjectForKey:v4];
}

- (void)registerXPCClientWithReply:(id)a3
{
  v5 = (void (**)(void))a3;
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  v5[2]();
}

- (void)startRequestWithMediaType:(int)a3 forStreamToken:(int64_t)a4 requesteeID:(id)a5 reply:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController queue](self, "queue"));
  dispatch_assert_queue_V2(v12);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController clientManager](self, "clientManager"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 currentClient]);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10018D02C;
  v17[3] = &unk_1003DC2D8;
  int v21 = a3;
  v17[4] = self;
  id v18 = v10;
  id v19 = v11;
  int64_t v20 = a4;
  id v15 = v11;
  id v16 = v10;
  sub_1001544C8( v14,  @"modify-moments",  v17,  0LL,  (uint64_t)"-[CSDMomentsController startRequestWithMediaType:forStreamToken:requesteeID:reply:]");
}

- (void)endRequestWithTransactionID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController clientManager](self, "clientManager"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 currentClient]);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10018D714;
  v13[3] = &unk_1003D8410;
  id v14 = v6;
  id v15 = self;
  id v16 = v7;
  id v11 = v7;
  id v12 = v6;
  sub_1001544C8( v10,  @"modify-moments",  v13,  0LL,  (uint64_t)"-[CSDMomentsController endRequestWithTransactionID:reply:]");
}

- (void)registerStreamToken:(int64_t)a3 requesterID:(id)a4 remoteIDSDestinations:(id)a5 remoteMomentsAvailable:(BOOL)a6 reply:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController queue](self, "queue"));
  dispatch_assert_queue_V2(v15);

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController clientManager](self, "clientManager"));
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 currentClient]);

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10018DAC0;
  v22[3] = &unk_1003DC300;
  BOOL v28 = a6;
  v22[4] = self;
  id v23 = v13;
  id v24 = v12;
  id v25 = v17;
  id v26 = v14;
  int64_t v27 = a3;
  id v18 = v14;
  id v19 = v17;
  id v20 = v12;
  id v21 = v13;
  sub_1001544C8( v19,  @"modify-moments",  v22,  0LL,  (uint64_t)"-[CSDMomentsController registerStreamToken:requesterID:remoteIDSDestinations:remoteMomentsAvailable:reply:]");
}

- (void)unregisterStreamToken:(int64_t)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController clientManager](self, "clientManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentClient]);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10018E1E4;
  v12[3] = &unk_1003DC328;
  v12[4] = self;
  id v13 = v9;
  id v14 = v6;
  int64_t v15 = a3;
  id v10 = v6;
  id v11 = v9;
  sub_1001544C8(v11, @"modify-moments", v12, 0LL, (uint64_t)"-[CSDMomentsController unregisterStreamToken:reply:]");
}

- (void)registerClient:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10018E3BC;
  v7[3] = &unk_1003D7758;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)unregisterClient:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10018E494;
  v7[3] = &unk_1003D7758;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)discardVideoMessageWithUUID:(id)a3 completion:(id)a4
{
}

- (void)endRecordingMessageWithUUID:(id)a3 completion:(id)a4
{
}

- (void)prewarmAudioClientWithCompletion:(id)a3
{
}

- (void)resetVideoMessagingWithSessionUUID:(id)a3 completionHandler:(id)a4
{
}

- (void)saveVideoMessageWithUUID:(id)a3 completion:(id)a4
{
}

- (void)sendVideoMessageWithUUID:(id)a3 callUUID:(id)a4 toHandles:(id)a5 completion:(id)a6
{
}

- (void)startRecordingMessageWithMediaType:(int)a3 completion:(id)a4
{
}

- (void)startRequestWithMediaType:(int)a3 forStreamToken:(int64_t)a4 requesteeID:(id)a5 destinationID:(id)a6 reply:(id)a7
{
}

- (void)moments:(id)a3 didFinishRequest:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  id v12 = sub_1001704C4();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "didFinish request: %@, error: %@",  (uint8_t *)&v14,  0x16u);
  }

  -[CSDMomentsController cleanUpForMomentIfNecessary:](self, "cleanUpForMomentIfNecessary:", v10);
}

- (void)moments:(id)a3 capabilitiesDidChange:(unsigned int)a4
{
  id v6 = a3;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v22 = a4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "new capabilities: %u", buf, 8u);
  }

  uint64_t v10 = -[CSDMomentsController availabilityWithRemoteAvailable:](self, "availabilityWithRemoteAvailable:", 1LL);
  if ((_DWORD)v10 == 3)
  {
    id v11 = sub_10018E060(a4);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
  }

  else
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  }

  id v13 = (void *)v12;
  id v14 = [[TUMomentsCapabilities alloc] initWithAvailability:v10 supportedMediaTypes:v12];
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController clientManager](self, "clientManager"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10018E808;
  v18[3] = &unk_1003DC350;
  id v19 = v14;
  id v20 = v6;
  id v16 = v6;
  id v17 = v14;
  [v15 performBlockOnClients:v18];
}

- (void)moments:(id)a3 didStartProcessingRequest:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  id v12 = sub_1001704C4();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v40 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "didStartProcessing request: %@", buf, 0xCu);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController serverBag](self, "serverBag"));
  if ([v14 isMomentsDisabled])
  {
  }

  else
  {
    unsigned __int8 v16 = objc_msgSend((id)objc_opt_class(self, v15), "isFaceTimePhotosAvailable");

    if ((v16 & 1) != 0) {
      goto LABEL_9;
    }
  }

  id v17 = sub_1001704C4();
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_1002B9DD0(v18, v19, v20, v21, v22, v23, v24, v25);
  }

LABEL_9:
  if (!v9)
  {
    id v36 = sub_1001704C4();
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_1002B9D70();
    }
    goto LABEL_20;
  }

  id v26 = [v9 mediaType];
  if ((_DWORD)v26 == 2 && (TUAllowLocalVideoRecording(v26) & 1) != 0)
  {
    int v27 = 1;
  }

  else
  {
    BOOL v28 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController clientManager](self, "clientManager"));
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_10018EB0C;
    v37[3] = &unk_1003DC378;
    id v38 = v9;
    [v28 performBlockOnClients:v37];

    int v27 = 0;
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue([v9 requesterID]);

  if (v29)
  {
    v30 = objc_alloc(&OBJC_CLASS___CSDMomentsNotification);
    id v31 = [v8 streamToken];
    v32 = (void *)objc_claimAutoreleasedReturnValue([v9 requesterID]);
    v33 = -[CSDMomentsNotification initWithStreamToken:requesterID:](v30, "initWithStreamToken:requesterID:", v31, v32);

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v34 postNotificationName:@"CSDMomentsControllerStartedRemoteCaptureNotification" object:v33];
  }

  if (v27)
  {
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    -[os_log_s postNotificationName:object:]( v35,  "postNotificationName:object:",  @"CSDMomentsControllerStartedLocalVideoCaptureNotification",  0LL);
LABEL_20:
  }
}

- (void)moments:(id)a3 didEndProcessingRequest:(id)a4 stillImageURL:(id)a5 movieURL:(id)a6 error:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController queue](self, "queue"));
  dispatch_assert_queue_V2(v15);

  id v16 = sub_1001704C4();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v117 = v12;
    __int16 v118 = 2112;
    id v119 = v13;
    __int16 v120 = 2112;
    id v121 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "didEndProcessing request: %@, stillImageURL: %@ movieURL: %@",  buf,  0x20u);
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController serverBag](self, "serverBag"));
  if ([v18 isMomentsDisabled])
  {

    goto LABEL_16;
  }

  unsigned __int8 v20 = objc_msgSend((id)objc_opt_class(self, v19), "isFaceTimePhotosAvailable");

  if ((v20 & 1) == 0)
  {
LABEL_16:
    id v40 = sub_1001704C4();
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_1002B9E00(v23, v41, v42, v43, v44, v45, v46, v47);
    }
    goto LABEL_18;
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController sessionsByToken](self, "sessionsByToken"));
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v11 streamToken]));
  uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v22]);

  if (!v23)
  {
    id v48 = sub_1001704C4();
    v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      sub_1002B9E30(v11, v49);
    }
    goto LABEL_21;
  }

  uint64_t v24 = (uint64_t)[v12 mediaType];
  if ((_DWORD)v24 == 2 || (uint64_t v24 = TUAllowLocalVideoRecording(v24), (v24 & 1) != 0))
  {
    if (!TUAllowLocalVideoRecording(v24))
    {
LABEL_15:
      -[CSDMomentsController cleanUpForMomentIfNecessary:](self, "cleanUpForMomentIfNecessary:", v11);
      goto LABEL_18;
    }

    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v25 postNotificationName:@"CSDMomentsControllerStoppedLocalVideoCaptureNotification" object:0];

    if (v14)
    {
      id v26 = objc_alloc(&OBJC_CLASS___NSUUID);
      int v27 = (void *)objc_claimAutoreleasedReturnValue([v12 transactionID]);
      BOOL v28 = -[NSUUID initWithUUIDString:](v26, "initWithUUIDString:", v27);

      if (v28)
      {
        v29 = NSTemporaryDirectory();
        v105 = (void *)objc_claimAutoreleasedReturnValue(v29);
        v113[0] = v105;
        v97 = v28;
        v102 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v28, "UUIDString"));
        v113[1] = v102;
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
        id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 UUIDString]);
        v113[2] = v31;
        uint64_t v32 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v113, 3LL));
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](&OBJC_CLASS___NSURL, "fileURLWithPathComponents:", v32));

        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        id v109 = 0LL;
        LOBYTE(v32) = [v34 createDirectoryAtURL:v33 withIntermediateDirectories:1 attributes:0 error:&v109];
        id v35 = v109;

        if ((v32 & 1) != 0)
        {
          v106 = v33;
          id v36 = (void *)objc_claimAutoreleasedReturnValue([v33 URLByAppendingPathComponent:@"lp_movie"]);
          uint64_t v37 = objc_claimAutoreleasedReturnValue([v14 pathExtension]);
          id v38 = (void *)objc_claimAutoreleasedReturnValue([v36 URLByAppendingPathExtension:v37]);

          v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          id v108 = v35;
          LOBYTE(v37) = [v39 copyItemAtURL:v14 toURL:v38 error:&v108];
          id v103 = v108;

          if ((v37 & 1) != 0)
          {
            -[CSDMomentsController _handleReceivedVideoURL:](self, "_handleReceivedVideoURL:", v38);

            goto LABEL_15;
          }

          id v86 = sub_1001704C4();
          v87 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
          v50 = v97;
          id v35 = v103;
          if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
            sub_1002B9F84();
          }

          v80 = (os_log_s *)v106;
        }

        else
        {
          v80 = (os_log_s *)v33;
          id v83 = sub_1001704C4();
          id v38 = (void *)objc_claimAutoreleasedReturnValue(v83);
          if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_ERROR)) {
            sub_1002B9FE4();
          }
          v50 = v97;
        }

        goto LABEL_51;
      }

      id v81 = sub_1001704C4();
      v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
        sub_1002B9F04(v12, v49);
      }
    }

    else
    {
      id v78 = sub_1001704C4();
      v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v78);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
        sub_1002B9EA4();
      }
    }

- (void)momentsServerDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1002BA260();
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController sessionsByToken](self, "sessionsByToken"));
  [v8 removeAllObjects];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController streamTokensByCSDClient](self, "streamTokensByCSDClient"));
  [v9 removeAllObjects];
}

- (void)fileTransferer:(id)a3 didReceiveResourcesAtURL:(id)a4 withMetadata:(id)a5 isZipped:(BOOL)a6 fromIDSDestination:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10018F6F4;
  block[3] = &unk_1003D9780;
  id v19 = v11;
  id v20 = v12;
  BOOL v23 = a6;
  id v21 = v13;
  uint64_t v22 = self;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  dispatch_async(v14, block);
}

- (void)fileTransferer:(id)a3 didTransferFileAtURL:(id)a4 successfully:(BOOL)a5
{
  id v7 = a4;
  if (!a5)
  {
    id v8 = sub_1001704C4();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1002BA544();
    }
  }

  -[CSDMomentsController deleteContentsAtURL:](self, "deleteContentsAtURL:", v7);
}

- (void)deleteContentsAtURL:(id)a3
{
  id v4 = a3;
  if (objc_msgSend((id)objc_opt_class(self, v5), "shouldPreserveMomentsFile"))
  {
    id v6 = sub_1001704C4();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Preserving file at URL: %@", buf, 0xCu);
    }
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v13 = 0LL;
    unsigned int v9 = [v8 removeItemAtURL:v4 error:&v13];
    id v7 = (os_log_s *)v13;

    id v10 = sub_1001704C4();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    id v12 = v11;
    if (v9)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v4;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Deleted contents at URL: %@", buf, 0xCu);
      }
    }

    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      sub_1002BA5A4();
    }
  }
}

- (id)contentsOfDirectoryAtURL:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v10 = 0LL;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:0 options:0 error:&v10]);
  id v6 = v10;

  if (!v5)
  {
    id v7 = sub_1001704C4();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1002BA60C();
    }

    uint64_t v5 = &__NSArray0__struct;
  }

  return v5;
}

- (id)urlFromResources:(id)a3 withExtension:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pathExtension", (void)v15));
        unsigned int v13 = [v12 isEqualToIgnoringCase:v6];

        if (v13)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }

      id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

- (void)unregisterStreamToken:(int64_t)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134217984;
    int64_t v13 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Unregistering stream token: %ld",  (uint8_t *)&v12,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController sessionsByToken](self, "sessionsByToken"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", a3));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 moments]);
  [v10 setIsRegistered:0];
  -[CSDMomentsController cleanUpForMomentIfNecessary:](self, "cleanUpForMomentIfNecessary:", v11);
}

- (void)cleanUpForMomentIfNecessary:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 streamToken];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController sessionsByToken](self, "sessionsByToken"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v6));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v8]);

  unsigned int v10 = [v9 isRegistered];
  LODWORD(v7) = [v4 activeRequestCount];
  signed int v11 = [v4 pendingRequestCount] + (_DWORD)v7;
  int v12 = (void *)objc_claimAutoreleasedReturnValue([v9 activeRequestsByTransactionID]);
  int64_t v13 = (char *)[v12 count] + v11;

  id v14 = sub_1001704C4();
  __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if ((v10 & 1) != 0 || v13)
  {
    if (v16)
    {
      int v19 = 67109376;
      LODWORD(v20[0]) = v10;
      WORD2(v20[0]) = 2048;
      *(void *)((char *)v20 + 6) = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Delaying cleanup because moment is still registered (%d) or has outstanding requests (%lu)",  (uint8_t *)&v19,  0x12u);
    }
  }

  else
  {
    if (v16)
    {
      int v19 = 138412290;
      v20[0] = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Cleaning up state for moment: %@",  (uint8_t *)&v19,  0xCu);
    }

    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController sessionsByToken](self, "sessionsByToken"));
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v6));
    [v17 setObject:0 forKeyedSubscript:v18];

    __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController delegate](self, "delegate"));
    if ((objc_opt_respondsToSelector(v15, "momentsController:didCleanUpForStream:") & 1) != 0) {
      -[os_log_s momentsController:didCleanUpForStream:](v15, "momentsController:didCleanUpForStream:", self, v6);
    }
  }
}

- (void)_transferFileAtURL:(id)a3 forSession:(id)a4 request:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  signed int v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  id v12 = sub_1001704C4();
  int64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    __int16 v25 = 2112;
    id v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "url: %@ session: %@ request: %@", buf, 0x20u);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 remoteRequesterIDSDestinationFor:v10]);
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v14));

  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "transactionID", @"CSDMomentsControllerMetadataKeyTransactionID"));
  id v20 = v16;
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));

  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController fileTransferController](self, "fileTransferController"));
  [v18 transferFileAtURL:v8 toDestinations:v15 withMetadata:v17];
}

- (void)_handleReceivedResourcesAtDirectoryURL:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "url: %@", buf, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
  unsigned int v10 = [v8 fileExistsAtPath:v9];

  if (v10)
  {
    signed int v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController contentsOfDirectoryAtURL:](self, "contentsOfDirectoryAtURL:", v4));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSDMomentsController urlFromResources:withExtension:]( self,  "urlFromResources:withExtension:",  v11,  @"jpg"));
    uint64_t v13 = objc_claimAutoreleasedReturnValue( -[CSDMomentsController urlFromResources:withExtension:]( self,  "urlFromResources:withExtension:",  v11,  @"heic"));
    id v14 = (void *)v13;
    if (v13) {
      __int128 v15 = (void *)v13;
    }
    else {
      __int128 v15 = v12;
    }
    id v16 = v15;
    uint64_t v17 = objc_claimAutoreleasedReturnValue( -[CSDMomentsController urlFromResources:withExtension:]( self,  "urlFromResources:withExtension:",  v11,  @"mov"));
    __int128 v18 = (void *)v17;
    if (v16 && v17)
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_10019098C;
      v23[3] = &unk_1003DC3C8;
      v23[4] = self;
      id v24 = v4;
      -[CSDMomentsController _saveLivePhotoWithPhotoURL:videoURL:completion:]( self,  "_saveLivePhotoWithPhotoURL:videoURL:completion:",  v16,  v18,  v23);
    }

    else
    {
      id v21 = sub_1001704C4();
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_1002BA674();
      }

      -[CSDMomentsController deleteContentsAtURL:](self, "deleteContentsAtURL:", v4);
    }
  }

  else
  {
    id v19 = sub_1001704C4();
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1002BA6D4();
    }

    -[CSDMomentsController deleteContentsAtURL:](self, "deleteContentsAtURL:", v4);
  }
}

- (void)_handleReceivedVideoURL:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "_handleReceivedVideoURL: %@", buf, 0xCu);
  }

  if (v4 && TUAllowLocalVideoRecording(v8))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100190B84;
    v9[3] = &unk_1003DC3C8;
    v9[4] = self;
    id v10 = v4;
    -[CSDMomentsController _saveVideoWithURL:completion:](self, "_saveVideoWithURL:completion:", v10, v9);
  }
}

- (void)_saveLivePhotoWithPhotoURL:(id)a3 videoURL:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  signed int v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  id v12 = sub_1001704C4();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v24 = v8;
    __int16 v25 = 2112;
    id v26 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "saving live photo with photo url: %@ video url: %@",  buf,  0x16u);
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100190DEC;
  v19[3] = &unk_1003DC3F0;
  id v20 = v8;
  id v21 = v9;
  id v22 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  uint64_t v17 = objc_retainBlock(v19);
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController mediaAssetManager](self, "mediaAssetManager"));
  [v18 saveLivePhotoWithPhotoURL:v16 videoURL:v15 completion:v17];
}

- (void)_saveVideoWithURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  if (TUAllowLocalVideoRecording(v9))
  {
    id v10 = sub_1001704C4();
    signed int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Saving video with url: %@", buf, 0xCu);
    }

    id v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472LL;
    uint64_t v17 = sub_100190FDC;
    __int128 v18 = &unk_1003DC418;
    id v12 = v6;
    id v19 = v12;
    id v20 = v7;
    uint64_t v13 = objc_retainBlock(&v15);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController mediaAssetManager](self, "mediaAssetManager", v15, v16, v17, v18));
    [v14 saveVideoWithURL:v12 completion:v13];
  }
}

- (void)_startTimeoutForMomentsRequestWithTransactionID:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController serverBag](self, "serverBag"));
  [v6 momentsRequestTimeout];
  dispatch_time_t v8 = dispatch_time(0LL, (uint64_t)(v7 * 1000000000.0));
  uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController queue](self, "queue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100191150;
  v11[3] = &unk_1003D7758;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_after(v8, v9, v11);
}

- (id)sessionForTransactionID:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController sessionsByToken](self, "sessionsByToken", 0LL));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allValues]);

  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        signed int v11 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 activeRequestsByTransactionID]);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v4]);

        if (v13)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }

      id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

- (void)handleRequestResultWithMomentDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "momentDescriptor: %@", buf, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController clientManager](self, "clientManager"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001914E4;
  v10[3] = &unk_1003DC378;
  id v11 = v4;
  id v9 = v4;
  [v8 performBlockOnClients:v10];
}

+ (BOOL)isFaceTimePhotosAvailable
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localCapabilities]);
  if ([v3 isEnabled])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 localCapabilities]);
    unsigned int v5 = [v4 isRegionBlocked] ^ 1;
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

+ (CSDMomentsControllerLocalCapabilities)localCapabilities
{
  if (qword_10044D158 != -1) {
    dispatch_once(&qword_10044D158, &stru_1003DC438);
  }
  return (CSDMomentsControllerLocalCapabilities *)(id)qword_10044D160;
}

+ (void)setLocalCapabilities:(id)a3
{
}

- (int)availabilityWithRemoteAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_msgSend((id)objc_opt_class(self, a2), "localCapabilities");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  unsigned __int8 v7 = [v6 isRegionBlocked];

  if ((v7 & 1) != 0) {
    return 2;
  }
  unsigned int v10 = objc_msgSend((id)objc_opt_class(self, v8), "isFaceTimePhotosAvailable");
  int result = 1;
  if (v10 && v3)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMomentsController serverBag](self, "serverBag"));
    unsigned int v12 = [v11 isMomentsDisabled];

    if (v12) {
      return 1;
    }
    else {
      return 3;
    }
  }

  return result;
}

+ (BOOL)shouldPreserveMomentsFile
{
  if (qword_10044D170[0] != -1) {
    dispatch_once(qword_10044D170, &stru_1003DC458);
  }
  return byte_10044D168;
}

- (CSDMomentsControllerDelegate)delegate
{
  return (CSDMomentsControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (CSDFileTransferring)fileTransferController
{
  return self->_fileTransferController;
}

- (CSDMediaAssetManaging)mediaAssetManager
{
  return self->_mediaAssetManager;
}

- (NSMutableDictionary)sessionsByToken
{
  return self->_sessionsByToken;
}

- (NSMapTable)streamTokensByCSDClient
{
  return self->_streamTokensByCSDClient;
}

- (CSDCallCenterObserver)callCenterObserver
{
  return self->_callCenterObserver;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (TUMomentsControllerXPCClient)momentsClient
{
  return self->_momentsClient;
}

- (CSDClientManager)clientManager
{
  return self->_clientManager;
}

- (CSDMomentsServerBag)serverBag
{
  return self->_serverBag;
}

- (void)setServerBag:(id)a3
{
}

- (id)momentsGenerator
{
  return self->_momentsGenerator;
}

- (void)setMomentsGenerator:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end
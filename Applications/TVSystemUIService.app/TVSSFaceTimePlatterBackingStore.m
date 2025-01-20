@interface TVSSFaceTimePlatterBackingStore
+ (BOOL)_isFaceTimeRestricted;
+ (BOOL)_isLocalDeviceFaceTimeCapable;
- (BOOL)isJoinedConversationFaceTimeCapable;
- (BOOL)isSendingVideo;
- (BOOL)isUplinkMuted;
- (NSDictionary)nearbyConversationIDsToDeviceHandles;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)userNotificationsQueue;
- (TUCall)currentCall;
- (TUCallCenter)callCenter;
- (TUConversation)activeSplitConversation;
- (TUConversation)joinedConversation;
- (TUConversationActivitySession)availableActivitySession;
- (TUConversationActivitySession)joinedActivitySession;
- (TUNearbyDeviceHandle)currentSessionDeviceHandle;
- (TVSSFaceTimeIncomingCallInfo)incomingCallInfo;
- (TVSSFaceTimePlatterBackingStore)init;
- (TVSSFaceTimePlatterBackingStoreDelegate)delegate;
- (id)conduit;
- (id)conversationManager;
- (id)currentSplitSessionConversationUUID;
- (id)platterState;
- (id)stateDumpBuilder;
- (void)_presentPullErrorFromDeviceHandleIfNeeded:(id)a3 pullError:(id)a4;
- (void)acceptIncomingCall:(id)a3 wantsStagingArea:(BOOL)a4 completion:(id)a5;
- (void)conversationManager:(id)a3 activitySessionsChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 changedActivityAuthorizationForBundleIdentifier:(id)a4;
- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4;
- (void)conversationManager:(id)a3 removedActiveSplitConversation:(id)a4;
- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4;
- (void)dealloc;
- (void)declineIncomingCall:(id)a3 completion:(id)a4;
- (void)handleMutingNotification:(id)a3;
- (void)joinNearbyConversationWithConversationID:(id)a3;
- (void)launchCurrentActivitySessionWithCompletion:(id)a3;
- (void)leaveConversation;
- (void)leaveCurrentActivitySession;
- (void)neighborhoodActivityConduit:(id)a3 joinedSplitSessionWithID:(id)a4 fromDevice:(id)a5 handoffContext:(id)a6;
- (void)neighborhoodActivityConduit:(id)a3 leftSplitSessionWithID:(id)a4;
- (void)neighborhoodActivityConduit:(id)a3 updatedCurrentContinuitySession:(id)a4;
- (void)neighborhoodActivityConduitNearbyConversationsChanged:(id)a3;
- (void)neighborhoodActivityConduitUpdatedKnownContacts:(id)a3;
- (void)notifyChange;
- (void)presentDismissalAlertForCurrentActivitySession;
- (void)setCallCenter:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegate:(id)a3 onQueue:(id)a4;
- (void)setDelegateQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSendingVideo:(BOOL)a3;
- (void)setUplinkMuted:(BOOL)a3;
- (void)setUplinkMuted:(BOOL)a3 bluetoothAudioFormat:(int64_t)a4;
- (void)setUserNotificationsQueue:(id)a3;
@end

@implementation TVSSFaceTimePlatterBackingStore

- (TVSSFaceTimePlatterBackingStore)init
{
  SEL v16 = a2;
  v17 = 0LL;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVSSFaceTimePlatterBackingStore;
  v17 = -[TVSSFaceTimePlatterBackingStore init](&v15, "init");
  objc_storeStrong((id *)&v17, v17);
  if (v17)
  {
    v2 = +[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance");
    callCenter = v17->_callCenter;
    v17->_callCenter = v2;

    v10 = dispatch_get_global_queue(0LL, 0LL);
    dispatch_queue_t v4 = dispatch_queue_create_with_target_V2("com.apple.FaceTime.tvOS_platter_queue", 0LL, v10);
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v4;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.FaceTime.tvOS_platter_usernotificationsQueue", 0LL);
    userNotificationsQueue = v17->_userNotificationsQueue;
    v17->_userNotificationsQueue = (OS_dispatch_queue *)v6;

    id v11 = -[TUCallCenter neighborhoodActivityConduit](v17->_callCenter, "neighborhoodActivityConduit");
    [v11 addDelegate:v17 queue:v17->_queue];

    id v12 = -[TUCallCenter conversationManager](v17->_callCenter, "conversationManager");
    [v12 addDelegate:v17 queue:v17->_queue];

    id v13 = -[TUCallCenter conversationManager](v17->_callCenter, "conversationManager");
    [v13 registerWithCompletionHandler:0];

    v14 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v14,  "addObserver:selector:name:object:",  v17,  "handleMutingNotification:",  TUCallIsUplinkMutedChangedNotification,  0LL);
    objc_storeStrong((id *)&v14, 0LL);
  }

  v9 = v17;
  objc_storeStrong((id *)&v17, 0LL);
  return v9;
}

- (void)dealloc
{
  v5 = self;
  SEL v4 = a2;
  v2 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:](v2, "removeObserver:", v5);

  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS___TVSSFaceTimePlatterBackingStore;
  -[TVSSFaceTimePlatterBackingStore dealloc](&v3, "dealloc");
}

- (void)setDelegate:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  SEL v4 = v7;
  id v3 = location[0];
  v5 = &_dispatch_main_q;
  -[TVSSFaceTimePlatterBackingStore setDelegate:onQueue:](v4, "setDelegate:onQueue:", v3);

  objc_storeStrong(location, 0LL);
}

- (void)setDelegate:(id)a3 onQueue:(id)a4
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  objc_storeWeak((id *)&v9->_delegate, location[0]);
  if (location[0])
  {
    objc_storeStrong((id *)&v9->_delegateQueue, v7);
  }

  else
  {
    SEL v4 = &_dispatch_main_q;
    delegateQueue = v9->_delegateQueue;
    v9->_delegateQueue = (OS_dispatch_queue *)v4;
  }

  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)platterState
{
  v9 = self;
  v8[1] = (id)a2;
  v8[0] = -[TVSSFaceTimePlatterBackingStore joinedConversation](self, "joinedConversation");
  v2 = -[TVSSFaceTimePlatterBackingStore incomingCallInfo](v9, "incomingCallInfo");
  BOOL v4 = v2 == 0LL;

  if (!v4)
  {
    v10 = @"IncomingCall";
    int v7 = 1;
    goto LABEL_25;
  }

  if (v8[0])
  {
    id location = -[TVSSFaceTimePlatterBackingStore availableActivitySession](v9, "availableActivitySession");
    if (-[TVSSFaceTimePlatterBackingStore isJoinedConversationFaceTimeCapable]( v9,  "isJoinedConversationFaceTimeCapable")
      || location)
    {
      if (-[TVSSFaceTimePlatterBackingStore isJoinedConversationFaceTimeCapable]( v9,  "isJoinedConversationFaceTimeCapable")
        || !location)
      {
        if (!-[TVSSFaceTimePlatterBackingStore isJoinedConversationFaceTimeCapable]( v9,  "isJoinedConversationFaceTimeCapable")
          || location)
        {
          if (-[TVSSFaceTimePlatterBackingStore isJoinedConversationFaceTimeCapable]( v9,  "isJoinedConversationFaceTimeCapable")
            && location)
          {
            v10 = @"FaceTimeAndSharePlayActivity";
            int v7 = 1;
          }

          else
          {
            int v7 = 0;
          }
        }

        else
        {
          v10 = @"FaceTimeOnly";
          int v7 = 1;
        }
      }

      else
      {
        v10 = @"SharePlayActivity";
        int v7 = 1;
      }
    }

    else
    {
      v10 = @"SharePlayOnly";
      int v7 = 1;
    }

    objc_storeStrong(&location, 0LL);
    if (!v7) {
      goto LABEL_24;
    }
  }

  else if (([(id)objc_opt_class(v9) _isFaceTimeRestricted] & 1) != 0 {
         || ((id v5 =  -[TVSSFaceTimePlatterBackingStore nearbyConversationIDsToDeviceHandles]( v9,  "nearbyConversationIDsToDeviceHandles"),  ![v5 count])
  }
           ? (int v7 = 0)
           : (v10 = @"NearbyConversations", int v7 = 1),
             objc_storeStrong(&v5, 0LL),
             !v7))
  {
LABEL_24:
    v10 = @"NoConversations";
    int v7 = 1;
  }

- (id)conversationManager
{
  return -[TUCallCenter conversationManager](self->_callCenter, "conversationManager", a2, self);
}

- (id)conduit
{
  return -[TUCallCenter neighborhoodActivityConduit](self->_callCenter, "neighborhoodActivityConduit", a2, self);
}

- (id)currentSplitSessionConversationUUID
{
  id v4 = -[TVSSFaceTimePlatterBackingStore conduit](self, "conduit");
  id v3 = [v4 currentSplitSession];
  id v5 = [v3 conversationID];

  return v5;
}

- (NSDictionary)nearbyConversationIDsToDeviceHandles
{
  id v3 = -[TVSSFaceTimePlatterBackingStore conduit](self, "conduit");
  id v4 = [v3 nearbyConversations];

  return (NSDictionary *)v4;
}

- (TUNearbyDeviceHandle)currentSessionDeviceHandle
{
  id v4 = -[TVSSFaceTimePlatterBackingStore conduit](self, "conduit");
  id v3 = [v4 currentSplitSession];
  id v5 = [v3 device];

  return (TUNearbyDeviceHandle *)v5;
}

+ (BOOL)_isLocalDeviceFaceTimeCapable
{
  return MGGetBoolAnswer(@"DeviceSupportsLaguna") & 1;
}

+ (BOOL)_isFaceTimeRestricted
{
  BOOL v3 = 1;
  if (!TVSCameraIsRestricted()) {
    return TVSVideoConferencingIsRestricted();
  }
  return v3;
}

- (BOOL)isJoinedConversationFaceTimeCapable
{
  BOOL v3 = -[TVSSFaceTimePlatterBackingStore joinedConversation](self, "joinedConversation");
  id v4 = -[TUConversation localMember](v3, "localMember");
  char v6 = 0;
  BOOL v5 = 0;
  if (([v4 isLightweightMember] & 1) == 0)
  {
    int v7 = -[TVSSFaceTimePlatterBackingStore joinedConversation](self, "joinedConversation");
    char v6 = 1;
    BOOL v5 = -[TUConversation avMode](v7, "avMode") != 0LL;
  }

  if ((v6 & 1) != 0) {

  }
  return v5;
}

- (TUConversation)activeSplitConversation
{
  v21 = self;
  location[1] = (id)a2;
  location[0] =  -[TVSSFaceTimePlatterBackingStore currentSplitSessionConversationUUID]( self,  "currentSplitSessionConversationUUID");
  if (location[0])
  {
    memset(__b, 0, sizeof(__b));
    id v11 = -[TVSSFaceTimePlatterBackingStore conversationManager](v21, "conversationManager");
    id obj = [v11 activeConversations];

    id v13 = [obj countByEnumeratingWithState:__b objects:v23 count:16];
    if (v13)
    {
      uint64_t v8 = *(void *)__b[2];
      uint64_t v9 = 0LL;
      id v10 = v13;
      while (1)
      {
        uint64_t v7 = v9;
        if (*(void *)__b[2] != v8) {
          objc_enumerationMutation(obj);
        }
        id v18 = *(id *)(__b[1] + 8 * v9);
        id v5 = [v18 UUID];
        unsigned __int8 v6 = [v5 isEqual:location[0]];

        if ((v6 & 1) != 0) {
          break;
        }
        ++v9;
        if (v7 + 1 >= (unint64_t)v10)
        {
          uint64_t v9 = 0LL;
          id v10 = [obj countByEnumeratingWithState:__b objects:v23 count:16];
          if (!v10) {
            goto LABEL_11;
          }
        }
      }

      id v22 = v18;
      int v19 = 1;
    }

    else
    {
LABEL_11:
      int v19 = 0;
    }

    if (!v19)
    {
      os_log_t oslog = (os_log_t)FaceTimeControllerLog();
      os_log_type_t type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        log = oslog;
        os_log_type_t v4 = type;
        sub_100010524(v14);
        _os_log_error_impl( (void *)&_mh_execute_header,  log,  v4,  "Failed to find currentSplitSessionConversationUUID in conversation manager.",  v14,  2u);
      }

      objc_storeStrong((id *)&oslog, 0LL);
      id v22 = 0LL;
      int v19 = 1;
    }
  }

  else
  {
    id v22 = 0LL;
    int v19 = 1;
  }

  objc_storeStrong(location, 0LL);
  return (TUConversation *)v22;
}

- (TUConversation)joinedConversation
{
  v14 = self;
  SEL v13 = a2;
  memset(__b, 0, sizeof(__b));
  id v7 = -[TVSSFaceTimePlatterBackingStore conversationManager](v14, "conversationManager");
  id obj = [v7 activeConversations];

  id v9 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
  if (v9)
  {
    uint64_t v4 = *(void *)__b[2];
    uint64_t v5 = 0LL;
    id v6 = v9;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)__b[2] != v4) {
        objc_enumerationMutation(obj);
      }
      id v12 = *(id *)(__b[1] + 8 * v5);
      if ([v12 state] == (id)3 || objc_msgSend(v12, "state") == (id)2) {
        break;
      }
      ++v5;
      if (v3 + 1 >= (unint64_t)v6)
      {
        uint64_t v5 = 0LL;
        id v6 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
        if (!v6) {
          goto LABEL_10;
        }
      }
    }

    id v15 = v12;
    int v10 = 1;
  }

  else
  {
LABEL_10:
    int v10 = 0;
  }

  if (!v10) {
    id v15 = 0LL;
  }
  return (TUConversation *)v15;
}

- (void)joinNearbyConversationWithConversationID:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  queue = (dispatch_queue_s *)v12->_userNotificationsQueue;
  uint64_t v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_100073214;
  uint64_t v8 = &unk_1001B61C0;
  id v9 = v12;
  id v10 = location[0];
  dispatch_async(queue, &v4);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong((id *)&v9, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)leaveConversation
{
  int v5 = self;
  location[1] = (id)a2;
  location[0] = -[TVSSFaceTimePlatterBackingStore activeSplitConversation](self, "activeSplitConversation");
  if (location[0])
  {
    id v3 = -[TVSSFaceTimePlatterBackingStore conversationManager](v5, "conversationManager");
    id v2 = [location[0] UUID];
    objc_msgSend(v3, "leaveConversationWithUUID:");
  }

  objc_storeStrong(location, 0LL);
}

- (void)acceptIncomingCall:(id)a3 wantsStagingArea:(BOOL)a4 completion:(id)a5
{
  int v19 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BOOL v17 = a4;
  id v16 = 0LL;
  objc_storeStrong(&v16, a5);
  id v15 = [location[0] call];
  id v14 = [v15 conversationUUID];
  id v5 = objc_alloc(&OBJC_CLASS___TUJoinContinuityConversationRequest);
  id v13 = [v5 initWithUUID:v14 isAudioEnabled:1 isVideoEnabled:1 wantsStagingArea:v17];
  uint64_t v8 = -[TVSSFaceTimePlatterBackingStore callCenter](v19, "callCenter");
  id v12 = -[TUCallCenter neighborhoodActivityConduit](v8, "neighborhoodActivityConduit");

  id v10 = v12;
  id v9 = v13;
  id v11 = v16;
  objc_msgSend(v10, "joinContinuityConversationWithRequest:completion:", v9);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)declineIncomingCall:(id)a3 completion:(id)a4
{
  int v19 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v17 = 0LL;
  objc_storeStrong(&v17, a4);
  id v16 = [location[0] call];
  id v15 = [v16 uuid];
  id v5 = -[TVSSFaceTimePlatterBackingStore callCenter](v19, "callCenter");
  id v14 = -[TUCallCenter neighborhoodActivityConduit](v5, "neighborhoodActivityConduit");

  id v7 = v14;
  id v6 = v15;
  uint64_t v8 = _NSConcreteStackBlock;
  int v9 = -1073741824;
  int v10 = 0;
  id v11 = sub_1000747E4;
  id v12 = &unk_1001B8B38;
  id v13 = v17;
  objc_msgSend(v7, "declineContinuityCallWithUUID:completion:", v6);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_presentPullErrorFromDeviceHandleIfNeeded:(id)a3 pullError:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v20 = 0LL;
  objc_storeStrong(&v20, a4);
  id v9 = [v20 domain];
  unsigned __int8 v10 = [v9 isEqual:TUNeighborhoodActivityConduitErrorDomain];

  if ((v10 & 1) != 0 && ((id v7 = (char *)[v20 code], (unint64_t)(v7 - 4) <= 1) || v7 == (char *)17))
  {
    int v19 = 1;
  }

  else
  {
    v24[0] = kCFUserNotificationAlertHeaderKey;
    id v6 = TVSSLagunaLocalizedString(@"LagunaJoinSessionFailedAlertHeader");
    v25[0] = v6;
    v24[1] = kCFUserNotificationAlertMessageKey;
    id v5 = TVSSLagunaLocalizedString(@"LagunaJoinSessionFailedAlertMessage");
    v25[1] = v5;
    v24[2] = kCFUserNotificationDefaultButtonTitleKey;
    id v4 = TVSSLagunaLocalizedString(@"LagunaJoinSessionFailedDefaultButton");
    v25[2] = v4;
    id v18 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v25,  v24,  3LL);

    id v16 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0LL, &error, (CFDictionaryRef)v18);
    if (v16)
    {
      os_log_t v13 = (os_log_t)FaceTimeControllerLog();
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        sub_10000D28C((uint64_t)v22, (uint64_t)v20);
        _os_log_impl( (void *)&_mh_execute_header,  v13,  v12,  "Presenting CFUserNotification for pull session error: %@.",  v22,  0xCu);
      }

      objc_storeStrong((id *)&v13, 0LL);
      CFOptionFlags responseFlags = 3LL;
      SInt32 error = CFUserNotificationReceiveResponse(v16, 0.0, &responseFlags);
      CFRelease(v16);
      int v19 = 0;
    }

    else
    {
      os_log_t oslog = (os_log_t)FaceTimeControllerLog();
      os_log_type_t type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        sub_100074CCC( (uint64_t)v23,  (uint64_t)"-[TVSSFaceTimePlatterBackingStore _presentPullErrorFromDeviceHandleIfNeeded:pullError:]",  error);
        _os_log_error_impl( (void *)&_mh_execute_header,  oslog,  type,  "%s Error creating CFUserNotification: %d",  v23,  0x12u);
      }

      objc_storeStrong((id *)&oslog, 0LL);
      int v19 = 1;
    }

    objc_storeStrong(&v18, 0LL);
  }

  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(location, 0LL);
}

- (TUConversationActivitySession)availableActivitySession
{
  id v14 = self;
  SEL v13 = a2;
  memset(__b, 0, sizeof(__b));
  id v7 = -[TVSSFaceTimePlatterBackingStore joinedConversation](v14, "joinedConversation");
  id obj = -[TUConversation activitySessions](v7, "activitySessions");

  id v9 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
  if (v9)
  {
    uint64_t v4 = *(void *)__b[2];
    uint64_t v5 = 0LL;
    id v6 = v9;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)__b[2] != v4) {
        objc_enumerationMutation(obj);
      }
      id v12 = *(id *)(__b[1] + 8 * v5);
      if ((sub_100074F28(v12) & 1) == 0) {
        break;
      }
      ++v5;
      if (v3 + 1 >= (unint64_t)v6)
      {
        uint64_t v5 = 0LL;
        id v6 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
        if (!v6) {
          goto LABEL_9;
        }
      }
    }

    id v15 = v12;
    int v10 = 1;
  }

  else
  {
LABEL_9:
    int v10 = 0;
  }

  if (!v10) {
    id v15 = 0LL;
  }
  return (TUConversationActivitySession *)v15;
}

- (TUConversationActivitySession)joinedActivitySession
{
  id v14 = self;
  SEL v13 = a2;
  memset(__b, 0, sizeof(__b));
  id v7 = -[TVSSFaceTimePlatterBackingStore joinedConversation](v14, "joinedConversation");
  id obj = -[TUConversation activitySessions](v7, "activitySessions");

  id v9 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
  if (v9)
  {
    uint64_t v4 = *(void *)__b[2];
    uint64_t v5 = 0LL;
    id v6 = v9;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)__b[2] != v4) {
        objc_enumerationMutation(obj);
      }
      id v12 = *(id *)(__b[1] + 8 * v5);
      if ([v12 state] == (id)1 && (sub_100074F28(v12) & 1) == 0) {
        break;
      }
      ++v5;
      if (v3 + 1 >= (unint64_t)v6)
      {
        uint64_t v5 = 0LL;
        id v6 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
        if (!v6) {
          goto LABEL_10;
        }
      }
    }

    id v15 = v12;
    int v10 = 1;
  }

  else
  {
LABEL_10:
    int v10 = 0;
  }

  if (!v10) {
    id v15 = 0LL;
  }
  return (TUConversationActivitySession *)v15;
}

- (void)launchCurrentActivitySessionWithCompletion:(id)a3
{
  v40 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v32 = _NSConcreteStackBlock;
  int v33 = -1073741824;
  int v34 = 0;
  v35 = sub_1000755CC;
  v36 = &unk_1001B8048;
  id v37 = location[0];
  id v38 = objc_retainBlock(&v32);
  v25 = _NSConcreteStackBlock;
  int v26 = -1073741824;
  int v27 = 0;
  v28 = sub_100075658;
  v29 = &unk_1001B8B60;
  id v30 = v38;
  id v31 = objc_retainBlock(&v25);
  id v24 = -[TVSSFaceTimePlatterBackingStore availableActivitySession](v40, "availableActivitySession");
  if (v24)
  {
    id v7 = [v24 activity];
    id v19 = [v7 bundleIdentifier];

    if (v19)
    {
      id v4 = -[TVSSFaceTimePlatterBackingStore conversationManager](v40, "conversationManager");
      id v3 = v24;
      int v10 = _NSConcreteStackBlock;
      int v11 = -1073741824;
      int v12 = 0;
      SEL v13 = sub_100075708;
      id v14 = &unk_1001B8B38;
      id v15 = v38;
      [v4 launchApplicationForActivitySession:v3 completionHandler:&v10];

      objc_storeStrong(&v15, 0LL);
      int v20 = 0;
    }

    else
    {
      id v18 = FaceTimeControllerLog();
      os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = (os_log_s *)v18;
        os_log_type_t v6 = v17;
        sub_100010524(v16);
        _os_log_impl( (void *)&_mh_execute_header,  v5,  v6,  "Skipping request to launch current activity session because the current activity does not have a bundle identifier.",  v16,  2u);
      }

      objc_storeStrong(&v18, 0LL);
      (*((void (**)(id, uint64_t, void))v31 + 2))(v31, 1004LL, 0LL);
      int v20 = 1;
    }

    objc_storeStrong(&v19, 0LL);
  }

  else
  {
    id v23 = FaceTimeControllerLog();
    os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
    {
      log = (os_log_s *)v23;
      os_log_type_t type = v22;
      sub_100010524(v21);
      _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "Skipping request to launch current activity session because no activity session exists.",  v21,  2u);
    }

    objc_storeStrong(&v23, 0LL);
    (*((void (**)(id, uint64_t, void))v31 + 2))(v31, 1001LL, 0LL);
    int v20 = 1;
  }

  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(&v31, 0LL);
  objc_storeStrong(&v30, 0LL);
  objc_storeStrong(&v38, 0LL);
  objc_storeStrong(&v37, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)presentDismissalAlertForCurrentActivitySession
{
  id v16 = self;
  v15[1] = (id)a2;
  v15[0] = -[TVSSFaceTimePlatterBackingStore activeSplitConversation](self, "activeSplitConversation");
  if (v15[0])
  {
    id v10 = -[TVSSFaceTimePlatterBackingStore joinedActivitySession](v16, "joinedActivitySession");
    if (v10)
    {
      id v2 = -[TVSSFaceTimePlatterBackingStore conversationManager](v16, "conversationManager");
      [v2 presentDismissalAlertForActivitySession:v10 onConversation:v15[0]];

      int v11 = 0;
    }

    else
    {
      os_log_t oslog = (os_log_t)FaceTimeControllerLog();
      os_log_type_t v8 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        id v3 = oslog;
        os_log_type_t v4 = v8;
        sub_100010524(v7);
        _os_log_error_impl( (void *)&_mh_execute_header,  v3,  v4,  "Tried to ask the user to end a SharePlay session without having a SharePlay activity",  v7,  2u);
      }

      objc_storeStrong((id *)&oslog, 0LL);
      int v11 = 1;
    }

    objc_storeStrong(&v10, 0LL);
  }

  else
  {
    id location = FaceTimeControllerLog();
    char v13 = 16;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)location;
      os_log_type_t type = v13;
      sub_100010524(v12);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "Tried to ask the user to end a SharePlay session without being joined in a conversation",  v12,  2u);
    }

    objc_storeStrong(&location, 0LL);
    int v11 = 1;
  }

  objc_storeStrong(v15, 0LL);
}

- (void)leaveCurrentActivitySession
{
  uint64_t v5 = self;
  v4[1] = (id)a2;
  v4[0] = -[TVSSFaceTimePlatterBackingStore activeSplitConversation](self, "activeSplitConversation");
  if (v4[0])
  {
    id location = -[TVSSFaceTimePlatterBackingStore joinedActivitySession](v5, "joinedActivitySession");
    if (location)
    {
      id v2 = -[TVSSFaceTimePlatterBackingStore conversationManager](v5, "conversationManager");
      [v2 leaveActivitySession:location onConversation:v4[0]];
    }

    objc_storeStrong(&location, 0LL);
  }

  objc_storeStrong(v4, 0LL);
}

- (TUCall)currentCall
{
  char v13 = self;
  v12[1] = (id)a2;
  v12[0] = -[TVSSFaceTimePlatterBackingStore activeSplitConversation](self, "activeSplitConversation");
  callCenter = v13->_callCenter;
  os_log_type_t v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = sub_100075C2C;
  id v10 = &unk_1001B8B88;
  id v11 = v12[0];
  id v4 = -[TUCallCenter callsPassingTest:](callCenter, "callsPassingTest:");
  id v5 = [v4 firstObject];

  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(v12, 0LL);
  return (TUCall *)v5;
}

- (TVSSFaceTimeIncomingCallInfo)incomingCallInfo
{
  v18[2] = self;
  v18[1] = (id)a2;
  id v7 = -[TUCallCenter neighborhoodActivityConduit](self->_callCenter, "neighborhoodActivityConduit");
  v18[0] = [v7 currentContinuitySession];

  if (v18[0])
  {
    id v5 = [v18[0] calls];
    id v16 = objc_msgSend(v5, "bs_firstObjectPassingTest:", &stru_1001B8BC8);

    id v2 = [v16 conversationUUID];
    BOOL v6 = v2 != 0LL;

    if (v6)
    {
      id v15 = [v16 conversationUUID];
      id v4 = [v18[0] activeConversations];
      int v8 = _NSConcreteStackBlock;
      int v9 = -1073741824;
      int v10 = 0;
      id v11 = sub_100075F9C;
      int v12 = &unk_1001B8BF0;
      id v13 = v15;
      id location = objc_msgSend(v4, "bs_firstObjectPassingTest:", &v8);

      if (location) {
        id v19 =  +[_TVSSFaceTimeIncomingCallInfo incomingCallInfoWithCall:conversation:]( &OBJC_CLASS____TVSSFaceTimeIncomingCallInfo,  "incomingCallInfoWithCall:conversation:",  v16,  location);
      }
      else {
        id v19 = 0LL;
      }
      int v17 = 1;
      objc_storeStrong(&location, 0LL);
      objc_storeStrong(&v13, 0LL);
      objc_storeStrong(&v15, 0LL);
    }

    else
    {
      id v19 = 0LL;
      int v17 = 1;
    }

    objc_storeStrong(&v16, 0LL);
  }

  else
  {
    id v19 = 0LL;
    int v17 = 1;
  }

  objc_storeStrong(v18, 0LL);
  return (TVSSFaceTimeIncomingCallInfo *)v19;
}

- (void)setUplinkMuted:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = -[TVSSFaceTimePlatterBackingStore currentCall](self, "currentCall");
  -[TVSSFaceTimePlatterBackingStore setUplinkMuted:bluetoothAudioFormat:]( self,  "setUplinkMuted:bluetoothAudioFormat:",  v3,  -[TUCall bluetoothAudioFormat](v5, "bluetoothAudioFormat"));
}

- (BOOL)isUplinkMuted
{
  BOOL v3 = -[TVSSFaceTimePlatterBackingStore currentCall](self, "currentCall");
  unsigned __int8 v4 = -[TUCall isUplinkMuted](v3, "isUplinkMuted");

  return v4 & 1;
}

- (void)setUplinkMuted:(BOOL)a3 bluetoothAudioFormat:(int64_t)a4
{
  BOOL v7 = a3;
  unsigned __int8 v4 = -[TVSSFaceTimePlatterBackingStore currentCall](self, "currentCall");
  -[TUCall setUplinkMuted:](v4, "setUplinkMuted:", v7);

  id v5 = -[TVSSFaceTimePlatterBackingStore currentCall](self, "currentCall");
  -[TUCall setBluetoothAudioFormat:](v5, "setBluetoothAudioFormat:", a4);
}

- (void)setSendingVideo:(BOOL)a3
{
  id v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  id v10 = -[TVSSFaceTimePlatterBackingStore joinedConversation](self, "joinedConversation");
  if (v10 && [v10 avMode] != (id)2 && v11)
  {
    id v4 = -[TUCallCenter videoDeviceController](v13->_callCenter, "videoDeviceController");
    [v4 startPreview];

    callCenter = v13->_callCenter;
    BOOL v6 = -[TVSSFaceTimePlatterBackingStore currentCall](v13, "currentCall");
    -[TUCallCenter requestVideoUpgradeForCall:originatingUIType:]( callCenter,  "requestVideoUpgradeForCall:originatingUIType:");

    int v9 =  +[FBSOpenApplicationService serviceWithDefaultShellEndpoint]( &OBJC_CLASS___FBSOpenApplicationService,  "serviceWithDefaultShellEndpoint");
    BOOL v7 = v9;
    id v8 = (id)TUPreferredFaceTimeBundleIdentifier();
    -[FBSOpenApplicationService openApplication:withOptions:completion:](v7, "openApplication:withOptions:completion:");

    objc_storeStrong((id *)&v9, 0LL);
  }

  BOOL v3 = -[TVSSFaceTimePlatterBackingStore currentCall](v13, "currentCall");
  -[TUCall setIsSendingVideo:](v3, "setIsSendingVideo:", v11);

  objc_storeStrong(&v10, 0LL);
}

- (BOOL)isSendingVideo
{
  BOOL v3 = -[TVSSFaceTimePlatterBackingStore currentCall](self, "currentCall");
  unsigned __int8 v4 = -[TUCall isSendingVideo](v3, "isSendingVideo");

  return v4 & 1;
}

- (void)handleMutingNotification:(id)a3
{
  BOOL v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  unsigned __int8 v4 = (TUCall *)[location[0] object];
  BOOL v3 = -[TVSSFaceTimePlatterBackingStore currentCall](v7, "currentCall");
  BOOL v5 = v4 != v3;

  if (!v5) {
    -[TVSSFaceTimePlatterBackingStore notifyChange](v7, "notifyChange");
  }
  objc_storeStrong(location, 0LL);
}

- (void)notifyChange
{
  SEL v12 = self;
  location[1] = (id)a2;
  id v2 = -[TVSSFaceTimePlatterBackingStore delegate](self, "delegate");
  BOOL v4 = v2 == 0LL;

  if (!v4)
  {
    objc_initWeak(location, v12);
    queue = (dispatch_queue_s *)v12->_delegateQueue;
    BOOL v5 = _NSConcreteStackBlock;
    int v6 = -1073741824;
    int v7 = 0;
    id v8 = sub_1000764F4;
    int v9 = &unk_1001B75D0;
    objc_copyWeak(&v10, location);
    dispatch_async(queue, &v5);
    objc_destroyWeak(&v10);
    objc_destroyWeak(location);
  }

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v13 = 0LL;
  objc_storeStrong(&v13, a4);
  id v8 = [v13 UUID];
  id v7 =  -[TVSSFaceTimePlatterBackingStore currentSplitSessionConversationUUID]( v15,  "currentSplitSessionConversationUUID");
  unsigned __int8 v9 = objc_msgSend(v8, "isEqual:");

  if ((v9 & 1) != 0)
  {
    id v12 = FaceTimeControllerLog();
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
    {
      log = (os_log_s *)v12;
      os_log_type_t type = v11;
      sub_100010524(v10);
      _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "Notifying delegate because conversation state changed.",  v10,  2u);
    }

    objc_storeStrong(&v12, 0LL);
    -[TVSSFaceTimePlatterBackingStore notifyChange](v15, "notifyChange");
  }

  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)conversationManager:(id)a3 activitySessionsChangedForConversation:(id)a4
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v13 = 0LL;
  objc_storeStrong(&v13, a4);
  id v8 = [v13 UUID];
  id v7 =  -[TVSSFaceTimePlatterBackingStore currentSplitSessionConversationUUID]( v15,  "currentSplitSessionConversationUUID");
  unsigned __int8 v9 = objc_msgSend(v8, "isEqual:");

  if ((v9 & 1) != 0)
  {
    id v12 = FaceTimeControllerLog();
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
    {
      log = (os_log_s *)v12;
      os_log_type_t type = v11;
      sub_100010524(v10);
      _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "Notifying delegate because conversation activity sessions changed.",  v10,  2u);
    }

    objc_storeStrong(&v12, 0LL);
    -[TVSSFaceTimePlatterBackingStore notifyChange](v15, "notifyChange");
  }

  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)conversationManager:(id)a3 removedActiveSplitConversation:(id)a4
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v10 = 0LL;
  objc_storeStrong(&v10, a4);
  id v9 = FaceTimeControllerLog();
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v9;
    os_log_type_t type = v8;
    sub_100010524(v7);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Notifying delegate because the split session ended.", v7, 2u);
  }

  objc_storeStrong(&v9, 0LL);
  -[TVSSFaceTimePlatterBackingStore notifyChange](v12, "notifyChange");
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v14 = 0LL;
  objc_storeStrong(&v14, a4);
  id v13 = FaceTimeControllerLog();
  os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v13;
    os_log_type_t type = v12;
    id v8 =  -[TVSSFaceTimePlatterBackingStore currentSplitSessionConversationUUID]( v16,  "currentSplitSessionConversationUUID");
    id v4 = v8;
    id v11 = v4;
    id v7 = [v14 UUID];
    id v10 = v7;
    sub_10000D540((uint64_t)v17, (uint64_t)v4, (uint64_t)v10);
    _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "Notifying delegate because the active conversation was removed. currentSplitSessionConversationUUID: %@, conversation.UUID: %@",  v17,  0x16u);

    objc_storeStrong(&v10, 0LL);
    objc_storeStrong(&v11, 0LL);
  }

  objc_storeStrong(&v13, 0LL);
  -[TVSSFaceTimePlatterBackingStore notifyChange](v16, "notifyChange");
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)conversationManager:(id)a3 changedActivityAuthorizationForBundleIdentifier:(id)a4
{
  int v17 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v15 = 0LL;
  objc_storeStrong(&v15, a4);
  id v7 = v15;
  id v10 = -[TVSSFaceTimePlatterBackingStore availableActivitySession](v17, "availableActivitySession");
  id v9 = -[TUConversationActivitySession activity](v10, "activity");
  id v8 = [v9 bundleIdentifier];
  char v11 = BSEqualStrings(v7);

  if ((v11 & 1) != 0)
  {
    id v14 = FaceTimeControllerLog();
    os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
    {
      log = (os_log_s *)v14;
      os_log_type_t type = v13;
      sub_100010524(v12);
      _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "Notifying delegate because the current activity session app changed authorization.",  v12,  2u);
    }

    objc_storeStrong(&v14, 0LL);
    -[TVSSFaceTimePlatterBackingStore notifyChange](v17, "notifyChange");
  }

  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)neighborhoodActivityConduitNearbyConversationsChanged:(id)a3
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = FaceTimeControllerLog();
  os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v7;
    os_log_type_t type = v6;
    sub_100010524(v5);
    _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "Notifying delegate because nearby conversations changed.",  v5,  2u);
  }

  objc_storeStrong(&v7, 0LL);
  -[TVSSFaceTimePlatterBackingStore notifyChange](v9, "notifyChange");
  objc_storeStrong(location, 0LL);
}

- (void)neighborhoodActivityConduitUpdatedKnownContacts:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0LL);
}

- (void)neighborhoodActivityConduit:(id)a3 joinedSplitSessionWithID:(id)a4 fromDevice:(id)a5 handoffContext:(id)a6
{
  id v18 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v16 = 0LL;
  objc_storeStrong(&v16, a4);
  id v15 = 0LL;
  objc_storeStrong(&v15, a5);
  id v14 = 0LL;
  objc_storeStrong(&v14, a6);
  id v13 = FaceTimeControllerLog();
  os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v13;
    os_log_type_t type = v12;
    sub_100010524(v11);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Notifying delegate due to joining a split session.", v11, 2u);
  }

  objc_storeStrong(&v13, 0LL);
  -[TVSSFaceTimePlatterBackingStore notifyChange](v18, "notifyChange");
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)neighborhoodActivityConduit:(id)a3 leftSplitSessionWithID:(id)a4
{
  os_log_type_t v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v10 = 0LL;
  objc_storeStrong(&v10, a4);
  id v9 = FaceTimeControllerLog();
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v9;
    os_log_type_t type = v8;
    sub_100010524(v7);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Notifying delegate due to leaving a split session.", v7, 2u);
  }

  objc_storeStrong(&v9, 0LL);
  -[TVSSFaceTimePlatterBackingStore notifyChange](v12, "notifyChange");
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)neighborhoodActivityConduit:(id)a3 updatedCurrentContinuitySession:(id)a4
{
  os_log_type_t v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v10 = 0LL;
  objc_storeStrong(&v10, a4);
  id v9 = FaceTimeControllerLog();
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v9;
    os_log_type_t type = v8;
    sub_100010524(v7);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Notifying delegate due update to continuity session", v7, 2u);
  }

  objc_storeStrong(&v9, 0LL);
  -[TVSSFaceTimePlatterBackingStore notifyChange](v12, "notifyChange");
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)stateDumpBuilder
{
  os_log_type_t v8 = self;
  v7[1] = (id)a2;
  v7[0] = objc_alloc_init(&OBJC_CLASS___TVSStateDumpBuilder);
  id v4 = v7[0];
  id v5 = -[TVSSFaceTimePlatterBackingStore platterState](v8, "platterState");
  id v2 = objc_msgSend(v4, "appendString:withKey:");

  id v6 = v7[0];
  objc_storeStrong(v7, 0LL);
  return v6;
}

- (TVSSFaceTimePlatterBackingStoreDelegate)delegate
{
  return (TVSSFaceTimePlatterBackingStoreDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (TUCallCenter)callCenter
{
  return self->_callCenter;
}

- (void)setCallCenter:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)userNotificationsQueue
{
  return self->_userNotificationsQueue;
}

- (void)setUserNotificationsQueue:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
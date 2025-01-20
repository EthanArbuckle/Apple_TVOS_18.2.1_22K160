@interface RPCloudDaemon
+ (id)sharedCloudDaemon;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)operatingSystemVersionForID:(SEL)a3;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)operatingSystemVersionForSelf;
- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5;
- (BOOL)diagnosticCommand:(id)a3 params:(id)a4;
- (BOOL)idsHasAppleTV;
- (BOOL)idsHasHomePod;
- (BOOL)idsHasMac;
- (BOOL)idsHasRealityDevice;
- (BOOL)idsHasWatch;
- (BOOL)idsHasiPad;
- (BOOL)idsIsSignedIn;
- (BOOL)removeXPCMatchingToken:(unint64_t)a3;
- (BOOL)sendIDSMessage:(id)a3 cloudServiceID:(id)a4 frameType:(unsigned __int8)a5 destinationDevice:(id)a6 sendFlags:(unsigned int)a7 msgCtx:(id)a8 error:(id *)a9;
- (BOOL)sendIDSMessage:(id)a3 cloudServiceID:(id)a4 frameType:(unsigned __int8)a5 destinationID:(id)a6 sendFlags:(unsigned int)a7 msgCtx:(id)a8 error:(id *)a9;
- (IDSService)nearbyIDSService;
- (NSArray)idsDeviceArray;
- (NSDictionary)idsDeviceMap;
- (NSDictionary)idsFamilyEndpointMap;
- (NSString)idsDeviceIDSelf;
- (OS_dispatch_queue)dispatchQueue;
- (RPCloudDaemon)init;
- (id)_idsAccountWithURI:(id)a3 senderID:(id *)a4;
- (id)_idsURIWithID:(id)a3;
- (id)descriptionWithLevel:(int)a3;
- (id)idsCorrelationIdentifier;
- (id)idsDeviceForBluetoothUUID:(id)a3;
- (int)idsHandheldCount;
- (void)_idsEnsureStarted;
- (void)_idsEnsureStopped;
- (void)_invalidate;
- (void)_invalidated;
- (void)_primaryAppleIDChanged;
- (void)_receivedFamilyIdentityFrameType:(unsigned __int8)a3 ptr:(const char *)a4 length:(unint64_t)a5 msgCtx:(id)a6;
- (void)_receivedFriendIdentityFrameType:(unsigned __int8)a3 ptr:(const char *)a4 length:(unint64_t)a5 msgCtx:(id)a6;
- (void)_receivedWatchIdentityFrameType:(unsigned __int8)a3 ptr:(const char *)a4 length:(unint64_t)a5 fromID:(id)a6;
- (void)_receivedWatchIdentityRequest:(id)a3 fromIDSDevice:(id)a4;
- (void)_receivedWatchIdentityResponse:(id)a3 fromIDSDevice:(id)a4;
- (void)_update;
- (void)activate;
- (void)daemonInfoChanged:(unint64_t)a3;
- (void)idsFamilyEndpointQueryWithCompletion:(id)a3;
- (void)idsFamilyEndpointsUpdateWithForce:(BOOL)a3;
- (void)invalidate;
- (void)prefsChanged;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)serviceSpaceDidBecomeAvailable:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setIdsFamilyEndpointMap:(id)a3;
- (void)setNearbyIDSService:(id)a3;
@end

@implementation RPCloudDaemon

+ (id)sharedCloudDaemon
{
  if (qword_1001331E8 != -1) {
    dispatch_once(&qword_1001331E8, &stru_100111108);
  }
  return (id)qword_1001331E0;
}

- (RPCloudDaemon)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RPCloudDaemon;
  v2 = -[RPCloudDaemon init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v3->_prefIsSignedInForce = -1;
    *(void *)&v3->_idsHandheldCountCache = -1LL;
    *(void *)&v3->_idsHasHomePodCache = -1LL;
    *(void *)&v3->_idsHasMacCache = -1LL;
    v3->_idsIsSignedInCache = -1;
    *(void *)&v3->_prefHasAppleTVForce = -1LL;
    *(void *)&v3->_prefHasiPadForce = -1LL;
    v3->_prefHasRealityDeviceForce = -1;
    v4 = v3;
  }

  return v3;
}

- (id)descriptionWithLevel:(int)a3
{
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](self->_idsFamilyEndpointMap, "allKeys"));
  id v34 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v34)
  {
    uint64_t v31 = *(void *)v39;
    v3 = &stru_1001152C8;
    do
    {
      v4 = 0LL;
      v5 = v3;
      do
      {
        if (*(void *)v39 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v38 + 1) + 8LL * (void)v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_idsFamilyEndpointMap,  "objectForKeyedSubscript:",  v6));
        v8 = (void *)objc_claimAutoreleasedReturnValue([v7 familyEndpointData]);
        v9 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceName]);
        v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_idsFamilyEndpointMap,  "objectForKeyedSubscript:",  v6));
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 familyEndpointData]);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 productVersion]);
        v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    IDSID: %@, name: %@, productVersion: %@\n",  v6,  v9,  v12));

        v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v13));
        v4 = (char *)v4 + 1;
        v5 = v3;
      }

      while (v34 != v4);
      id v34 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    }

    while (v34);
  }

  else
  {
    v3 = &stru_1001152C8;
  }

  id v37 = 0LL;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RPCloudDaemon idsDeviceArray](self, "idsDeviceArray"));
  id v35 = [v14 count];
  if (-[RPCloudDaemon idsIsSignedIn](self, "idsIsSignedIn")) {
    v15 = "yes";
  }
  else {
    v15 = "no";
  }
  v32 = v15;
  if (-[RPCloudDaemon idsHasAppleTV](self, "idsHasAppleTV")) {
    v16 = "yes";
  }
  else {
    v16 = "no";
  }
  obja = v16;
  if (-[RPCloudDaemon idsHasHomePod](self, "idsHasHomePod")) {
    v17 = "yes";
  }
  else {
    v17 = "no";
  }
  if (-[RPCloudDaemon idsHasiPad](self, "idsHasiPad")) {
    v18 = "yes";
  }
  else {
    v18 = "no";
  }
  if (-[RPCloudDaemon idsHasMac](self, "idsHasMac")) {
    v19 = "yes";
  }
  else {
    v19 = "no";
  }
  if (-[RPCloudDaemon idsHasWatch](self, "idsHasWatch")) {
    v20 = "yes";
  }
  else {
    v20 = "no";
  }
  if (-[RPCloudDaemon idsHasRealityDevice](self, "idsHasRealityDevice")) {
    v21 = "yes";
  }
  else {
    v21 = "no";
  }
  uint64_t v22 = -[RPCloudDaemon idsHandheldCount](self, "idsHandheldCount");
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RPCloudDaemon idsFamilyEndpointMap](self, "idsFamilyEndpointMap"));
  NSAppendPrintF( &v37,  "-- RPCloudDaemon --\n IDS devices %d, Signed In %s, AppleTV %s, HomePod %s, iPad %s, Mac %s, Watch %s, RealityDevice %s, Handheld %d, Sess ions %d \n %d FamilyEndpointMap:\n %@",  v35,  v32,  obja,  v17,  v18,  v19,  v20,  v21,  v22,  0,  [v23 count],  v3);
  id v24 = v37;

  if (a3 <= 20)
  {
    id v36 = v24;
    NSAppendPrintF(&v36, "\n");
    id v25 = v36;

    id v24 = v25;
  }

  id v26 = v24;

  return v26;
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004518;
  block[3] = &unk_1001110A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000046D8;
  block[3] = &unk_1001110A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_1001311F8 <= 30
      && (dword_1001311F8 != -1 || _LogCategory_Initialize(&dword_1001311F8, 30LL)))
    {
      LogPrintF(&dword_1001311F8, "-[RPCloudDaemon _invalidate]", 30LL, "Invalidate\n");
    }

    -[CUSystemMonitor invalidate](self->_systemMonitor, "invalidate");
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = 0LL;

    -[RPCloudDaemon _idsEnsureStopped](self, "_idsEnsureStopped");
    -[RPCloudDaemon _invalidated](self, "_invalidated");
  }

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    self->_invalidateDone = 1;
    if (dword_1001311F8 <= 30
      && (dword_1001311F8 != -1 || _LogCategory_Initialize(&dword_1001311F8, 30LL)))
    {
      LogPrintF(&dword_1001311F8, "-[RPCloudDaemon _invalidated]", 30LL, "Invalidated\n");
    }
  }

- (void)daemonInfoChanged:(unint64_t)a3
{
  if ((a3 & 0x400) != 0)
  {
    if (dword_1001311F8 <= 30
      && (dword_1001311F8 != -1 || _LogCategory_Initialize(&dword_1001311F8, 30LL)))
    {
      LogPrintF( &dword_1001311F8,  "-[RPCloudDaemon daemonInfoChanged:]",  30LL,  "Daemon info changed: %#ll{flags}\n",  a3,  &unk_100109265);
    }

    -[RPCloudDaemon idsFamilyEndpointsUpdateWithForce:](self, "idsFamilyEndpointsUpdateWithForce:", 1LL);
  }

- (BOOL)diagnosticCommand:(id)a3 params:(id)a4
{
  return 0;
}

- (void)prefsChanged
{
  BOOL v3 = CFPrefs_GetInt64(@"com.apple.rapport", @"hasAppleTVForce", &v26) != 0;
  if (v26) {
    int v4 = -1;
  }
  else {
    int v4 = v3;
  }
  int prefHasAppleTVForce = self->_prefHasAppleTVForce;
  if (v4 == prefHasAppleTVForce) {
    goto LABEL_10;
  }
  if (dword_1001311F8 <= 40)
  {
    if (dword_1001311F8 == -1)
    {
      int prefHasAppleTVForce = self->_prefHasAppleTVForce;
    }

    LogPrintF( &dword_1001311F8,  "-[RPCloudDaemon prefsChanged]",  40LL,  "HasAppleTVForce: %d -> %d\n",  prefHasAppleTVForce,  v4);
  }

- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5
{
  return 0;
}

- (BOOL)removeXPCMatchingToken:(unint64_t)a3
{
  return 0;
}

- (void)_update
{
  if (self->_prefIDSEnabled) {
    -[RPCloudDaemon _idsEnsureStarted](self, "_idsEnsureStarted");
  }
  else {
    -[RPCloudDaemon _idsEnsureStopped](self, "_idsEnsureStopped");
  }
}

- (void)_primaryAppleIDChanged
{
  idsCorrelationIdentifier = self->_idsCorrelationIdentifier;
  self->_idsCorrelationIdentifier = 0LL;
}

- (void)_idsEnsureStarted
{
  if (!self->_nearbyIDSService)
  {
    if (dword_1001311F8 <= 40
      && (dword_1001311F8 != -1 || _LogCategory_Initialize(&dword_1001311F8, 40LL)))
    {
      LogPrintF(&dword_1001311F8, "-[RPCloudDaemon _idsEnsureStarted]", 40LL, "IDS start: Nearby\n");
    }

    BOOL v3 = -[IDSService initWithService:]( objc_alloc(&OBJC_CLASS___IDSService),  "initWithService:",  @"com.apple.private.alloy.nearby");
    nearbyIDSService = self->_nearbyIDSService;
    self->_nearbyIDSService = v3;

    -[IDSService addDelegate:queue:](self->_nearbyIDSService, "addDelegate:queue:", self, self->_dispatchQueue);
  }

- (void)_idsEnsureStopped
{
  if (self->_nearbyIDSService)
  {
    if (dword_1001311F8 <= 40
      && (dword_1001311F8 != -1 || _LogCategory_Initialize(&dword_1001311F8, 40LL)))
    {
      LogPrintF(&dword_1001311F8, "-[RPCloudDaemon _idsEnsureStopped]", 40LL, "IDS stop: Nearby\n");
    }

    -[IDSService removeDelegate:](self->_nearbyIDSService, "removeDelegate:", self);
    nearbyIDSService = self->_nearbyIDSService;
    self->_nearbyIDSService = 0LL;
  }

  idsCorrelationIdentifier = self->_idsCorrelationIdentifier;
  self->_idsCorrelationIdentifier = 0LL;
}

- (id)_idsAccountWithURI:(id)a3 senderID:(id *)a4
{
  id v6 = a3;
  int v7 = (void *)IDSCopyRawAddressForDestination();
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService accounts](self->_nearbyIDSService, "accounts"));
  id v9 = [v8 countByEnumeratingWithState:&v61 objects:v68 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v62;
    v46 = a4;
    id v48 = v6;
    uint64_t v42 = *(void *)v62;
    v44 = self;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v62 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = *(void **)(*((void *)&v61 + 1) + 8LL * (void)i);
        if ([v13 canSend])
        {
          __int128 v59 = 0u;
          __int128 v60 = 0u;
          __int128 v57 = 0u;
          __int128 v58 = 0u;
          v14 = (void *)objc_claimAutoreleasedReturnValue([v13 aliasStrings]);
          id v15 = [v14 countByEnumeratingWithState:&v57 objects:v67 count:16];
          if (v15)
          {
            id v16 = v15;
            uint64_t v17 = *(void *)v58;
            while (2)
            {
              for (j = 0LL; j != v16; j = (char *)j + 1)
              {
                if (*(void *)v58 != v17) {
                  objc_enumerationMutation(v14);
                }
                BOOL v19 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)j);
                if ([v19 isEqual:v7])
                {
                  if (v46)
                  {
                    uint64_t v35 = objc_claimAutoreleasedReturnValue(-[RPCloudDaemon _idsURIWithID:](v44, "_idsURIWithID:", v19));
                    id v36 = *v46;
                    id *v46 = (id)v35;
                  }

                  id v34 = v13;
                  goto LABEL_40;
                }
              }

              id v16 = [v14 countByEnumeratingWithState:&v57 objects:v67 count:16];
              if (v16) {
                continue;
              }
              break;
            }
          }

          uint64_t v11 = v42;
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v61 objects:v68 count:16];
      a4 = v46;
      id v6 = v48;
      self = v44;
    }

    while (v10);
  }

  if ([v6 _FZIDType] == (id)-1)
  {
    id v34 = 0LL;
  }

  else
  {
    uint64_t v20 = IMCanonicalizeFormattedString(v7, 3LL);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v20);
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService accounts](self->_nearbyIDSService, "accounts"));
    id v21 = [v14 countByEnumeratingWithState:&v53 objects:v66 count:16];
    if (v21)
    {
      id v22 = v21;
      v45 = self;
      v47 = a4;
      id v48 = v6;
      uint64_t v23 = *(void *)v54;
      uint64_t v40 = *(void *)v54;
      do
      {
        int v24 = 0LL;
        id v41 = v22;
        do
        {
          if (*(void *)v54 != v23) {
            objc_enumerationMutation(v14);
          }
          id v25 = *(void **)(*((void *)&v53 + 1) + 8LL * (void)v24);
          if (objc_msgSend(v25, "canSend", v40))
          {
            __int128 v51 = 0u;
            __int128 v52 = 0u;
            __int128 v49 = 0u;
            __int128 v50 = 0u;
            v43 = v25;
            int v26 = (void *)objc_claimAutoreleasedReturnValue([v25 aliasStrings]);
            id v27 = [v26 countByEnumeratingWithState:&v49 objects:v65 count:16];
            if (v27)
            {
              id v28 = v27;
              uint64_t v29 = *(void *)v50;
              while (2)
              {
                for (k = 0LL; k != v28; k = (char *)k + 1)
                {
                  if (*(void *)v50 != v29) {
                    objc_enumerationMutation(v26);
                  }
                  uint64_t v31 = *(void *)(*((void *)&v49 + 1) + 8LL * (void)k);
                  uint64_t v32 = IMCanonicalizeFormattedString(v31, 3LL);
                  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
                  if ([v33 isEqual:v8])
                  {
                    if (v47)
                    {
                      uint64_t v38 = objc_claimAutoreleasedReturnValue(-[RPCloudDaemon _idsURIWithID:](v45, "_idsURIWithID:", v31));
                      id v39 = *v47;
                      id *v47 = (id)v38;
                    }

                    id v34 = v43;

                    goto LABEL_40;
                  }
                }

                id v28 = [v26 countByEnumeratingWithState:&v49 objects:v65 count:16];
                if (v28) {
                  continue;
                }
                break;
              }
            }

            uint64_t v23 = v40;
            id v22 = v41;
          }

          int v24 = (char *)v24 + 1;
        }

        while (v24 != v22);
        id v22 = [v14 countByEnumeratingWithState:&v53 objects:v66 count:16];
      }

      while (v22);
      id v34 = 0LL;
LABEL_40:
      id v6 = v48;
    }

    else
    {
      id v34 = 0LL;
    }
  }

  return v34;
}

- (id)idsCorrelationIdentifier
{
  idsCorrelationIdentifier = self->_idsCorrelationIdentifier;
  if (!idsCorrelationIdentifier)
  {
    if (self->_idQueryInProgress) {
      return 0LL;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CUSystemMonitor primaryAppleID](self->_systemMonitor, "primaryAppleID"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 _bestGuessURI]);
    if (v6)
    {
      int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v6));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSIDQueryController sharedInstance](&OBJC_CLASS___IDSIDQueryController, "sharedInstance"));
      dispatchQueue = self->_dispatchQueue;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_10000536C;
      v10[3] = &unk_100111130;
      v10[4] = self;
      v10[5] = v5;
      [v8 currentRemoteDevicesForDestinations:v7 service:@"com.apple.private.alloy.nearby" listenerID:@"com.apple.private.alloy.nearby" queue:dispatchQueue completionBlock:v10];
      self->_idQueryInProgress = 1;
    }

    idsCorrelationIdentifier = self->_idsCorrelationIdentifier;
  }

  return idsCorrelationIdentifier;
}

- (NSArray)idsDeviceArray
{
  v2 = self;
  objc_sync_enter(v2);
  idsDeviceArray = v2->_idsDeviceArray;
  if (!idsDeviceArray)
  {
    if (dword_1001311F8 <= 30
      && (dword_1001311F8 != -1 || _LogCategory_Initialize(&dword_1001311F8, 30LL)))
    {
      LogPrintF(&dword_1001311F8, "-[RPCloudDaemon idsDeviceArray]", 30LL, "Get IDSDevices\n");
    }

    uint64_t v4 = objc_claimAutoreleasedReturnValue(-[IDSService devices](v2->_nearbyIDSService, "devices"));
    v5 = v2->_idsDeviceArray;
    v2->_idsDeviceArray = (NSArray *)v4;

    idsDeviceArray = v2->_idsDeviceArray;
  }

  id v6 = idsDeviceArray;
  objc_sync_exit(v2);

  return v6;
}

- (id)idsDeviceForBluetoothUUID:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPCloudDaemon idsDeviceArray](v5, "idsDeviceArray", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 nsuuid]);
        unsigned __int8 v12 = [v11 isEqual:v4];

        if ((v12 & 1) != 0)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (NSString)idsDeviceIDSelf
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_idsDeviceIDSelf;
  if (!v3)
  {
    BOOL v3 = (NSString *)IDSCopyLocalDeviceUniqueID();
    if (v3)
    {
      objc_storeStrong((id *)&v2->_idsDeviceIDSelf, v3);
    }

    else
    {
      if (dword_1001311F8 <= 90
        && (dword_1001311F8 != -1 || _LogCategory_Initialize(&dword_1001311F8, 90LL)))
      {
        LogPrintF(&dword_1001311F8, "-[RPCloudDaemon idsDeviceIDSelf]", 90LL, "### No IDS device ID\n");
      }

      BOOL v3 = 0LL;
    }
  }

  objc_sync_exit(v2);

  return v3;
}

- (NSDictionary)idsDeviceMap
{
  v2 = self;
  objc_sync_enter(v2);
  idsDeviceMap = v2->_idsDeviceMap;
  if (!idsDeviceMap)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPCloudDaemon idsDeviceArray](v2, "idsDeviceArray"));
    if (!v4)
    {
      __int128 v14 = 0LL;
      goto LABEL_14;
    }

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uniqueIDOverride", (void)v16));
          if (v11) {
            -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v10, v11);
          }
        }

        id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v7);
    }

    unsigned __int8 v12 = (NSDictionary *)-[NSMutableDictionary copy](v5, "copy");
    int v13 = v2->_idsDeviceMap;
    v2->_idsDeviceMap = v12;

    idsDeviceMap = v2->_idsDeviceMap;
  }

  __int128 v14 = idsDeviceMap;
LABEL_14:
  objc_sync_exit(v2);

  return v14;
}

- (void)idsFamilyEndpointQueryWithCompletion:(id)a3
{
  id v8 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[RPPeopleDaemon sharedPeopleDaemon](&OBJC_CLASS___RPPeopleDaemon, "sharedPeopleDaemon"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 getFamilyURIs]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSIDQueryController sharedInstance](&OBJC_CLASS___IDSIDQueryController, "sharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSIDInfoOptions refreshIDInfo](&OBJC_CLASS___IDSIDInfoOptions, "refreshIDInfo"));
  if (dword_1001311F8 <= 30 && (dword_1001311F8 != -1 || _LogCategory_Initialize(&dword_1001311F8, 30LL))) {
    LogPrintF( &dword_1001311F8,  "-[RPCloudDaemon idsFamilyEndpointQueryWithCompletion:]",  30LL,  "Starting family IDS query.\n");
  }
  [v6 idInfoForDestinations:v5 service:@"com.apple.private.alloy.nearby.family" infoTypes:1 options:v7 listenerID:@"com.apple.private.alloy.nearby" queue:self->_dispatchQueue completionBlock:v8];
}

- (void)setIdsFamilyEndpointMap:(id)a3
{
  id v4 = (NSDictionary *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  idsFamilyEndpointMap = self->_idsFamilyEndpointMap;
  self->_idsFamilyEndpointMap = v4;
}

- (NSDictionary)idsFamilyEndpointMap
{
  return self->_idsFamilyEndpointMap;
}

- (void)idsFamilyEndpointsUpdateWithForce:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v6 = v5;
  if (self->_lastFamilyQueryDate)
  {
    objc_msgSend(v5, "timeIntervalSinceDate:");
    double v8 = v7;
  }

  else
  {
    double v8 = 0.0;
  }

  if (-[RPCloudDaemon getDeviceClass](self, "getDeviceClass") == 4
    && !self->_idQueryInProgress
    && (v3 || v8 == 0.0 || v8 > 300.0))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100005D54;
    v9[3] = &unk_100111158;
    v9[4] = self;
    -[RPCloudDaemon idsFamilyEndpointQueryWithCompletion:](self, "idsFamilyEndpointQueryWithCompletion:", v9);
    self->_idQueryInProgress = 1;
  }
}

- (int)idsHandheldCount
{
  v2 = self;
  objc_sync_enter(v2);
  int idsHandheldCountCache = v2->_idsHandheldCountCache;
  if (idsHandheldCountCache < 0 && v2->_nearbyIDSService)
  {
    v2->_int idsHandheldCountCache = 0;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPCloudDaemon idsDeviceArray](v2, "idsDeviceArray", 0LL));
    id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v12;
      do
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v4);
          }
          double v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v11 + 1) + 8 * (void)i) modelIdentifier]);
          BOOL v9 = GestaltProductTypeStringToDeviceClass() - 4 < 0xFFFFFFFD;

          if (!v9) {
            ++v2->_idsHandheldCountCache;
          }
        }

        id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v5);
    }

    int idsHandheldCountCache = v2->_idsHandheldCountCache;
  }

  objc_sync_exit(v2);

  return idsHandheldCountCache;
}

- (BOOL)idsHasAppleTV
{
  v2 = self;
  objc_sync_enter(v2);
  int prefHasAppleTVForce = v2->_prefHasAppleTVForce;
  if (prefHasAppleTVForce < 0)
  {
    if (v2->_idsHasAppleTVCache < 0 && v2->_nearbyIDSService)
    {
      v2->_idsHasAppleTVCache = 0;
      __int128 v12 = 0u;
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPCloudDaemon idsDeviceArray](v2, "idsDeviceArray", 0LL));
      id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v13;
        while (2)
        {
          for (i = 0LL; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v13 != v7) {
              objc_enumerationMutation(v5);
            }
            id v9 = objc_retain((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v12 + 1)
                                                                                      + 8LL * (void)i), "modelIdentifier")));
            unsigned __int8 v10 = [v9 hasPrefix:@"AppleTV"];

            if ((v10 & 1) != 0)
            {
              v2->_idsHasAppleTVCache = 1;
              goto LABEL_15;
            }
          }

          id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }

- (BOOL)idsHasHomePod
{
  v2 = self;
  objc_sync_enter(v2);
  int prefHasHomePodForce = v2->_prefHasHomePodForce;
  if (prefHasHomePodForce < 0)
  {
    if (v2->_idsHasHomePodCache < 0 && v2->_nearbyIDSService)
    {
      v2->_idsHasHomePodCache = 0;
      __int128 v11 = 0u;
      __int128 v12 = 0u;
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPCloudDaemon idsDeviceArray](v2, "idsDeviceArray", 0LL));
      id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v12;
        while (2)
        {
          for (i = 0LL; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v12 != v7) {
              objc_enumerationMutation(v5);
            }
            id v9 = objc_retain((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v11 + 1)
                                                                                      + 8LL * (void)i), "modelIdentifier")));
            if (([v9 hasPrefix:@"AudioAccessory1,"] & 1) != 0
              || ([v9 hasPrefix:@"AudioAccessory5,"] & 1) != 0
              || ([v9 hasPrefix:@"AudioAccessory6,"] & 1) != 0
              || ([v9 hasPrefix:@"HomePod"] & 1) != 0)
            {

              v2->_idsHasHomePodCache = 1;
              goto LABEL_18;
            }
          }

          id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }

- (BOOL)idsHasiPad
{
  v2 = self;
  objc_sync_enter(v2);
  int prefHasiPadForce = v2->_prefHasiPadForce;
  if (prefHasiPadForce < 0)
  {
    if (v2->_idsHasiPadCache < 0 && v2->_nearbyIDSService)
    {
      v2->_idsHasiPadCache = 0;
      __int128 v12 = 0u;
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPCloudDaemon idsDeviceArray](v2, "idsDeviceArray", 0LL));
      id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v13;
        while (2)
        {
          for (i = 0LL; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v13 != v7) {
              objc_enumerationMutation(v5);
            }
            id v9 = objc_retain((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v12 + 1)
                                                                                      + 8LL * (void)i), "modelIdentifier")));
            unsigned __int8 v10 = [v9 hasPrefix:@"iPad"];

            if ((v10 & 1) != 0)
            {
              v2->_idsHasiPadCache = 1;
              goto LABEL_15;
            }
          }

          id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }

- (BOOL)idsHasMac
{
  v2 = self;
  objc_sync_enter(v2);
  int prefHasMacForce = v2->_prefHasMacForce;
  if (prefHasMacForce < 0)
  {
    if (v2->_idsHasMacCache < 0 && v2->_nearbyIDSService)
    {
      v2->_idsHasMacCache = 0;
      __int128 v12 = 0u;
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPCloudDaemon idsDeviceArray](v2, "idsDeviceArray", 0LL));
      id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v13;
        while (2)
        {
          for (i = 0LL; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v13 != v7) {
              objc_enumerationMutation(v5);
            }
            id v9 = objc_retain((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v12 + 1)
                                                                                      + 8LL * (void)i), "modelIdentifier")));
            unsigned __int8 v10 = [v9 containsString:@"Mac"];

            if ((v10 & 1) != 0)
            {
              v2->_idsHasMacCache = 1;
              goto LABEL_15;
            }
          }

          id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }

- (BOOL)idsHasRealityDevice
{
  v2 = self;
  objc_sync_enter(v2);
  int prefHasRealityDeviceForce = v2->_prefHasRealityDeviceForce;
  if (prefHasRealityDeviceForce < 0)
  {
    if (v2->_idsHasRealityDeviceCache < 0 && v2->_nearbyIDSService)
    {
      v2->_idsHasRealityDeviceCache = 0;
      __int128 v12 = 0u;
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPCloudDaemon idsDeviceArray](v2, "idsDeviceArray", 0LL));
      id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v13;
        while (2)
        {
          for (i = 0LL; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v13 != v7) {
              objc_enumerationMutation(v5);
            }
            id v9 = objc_retain((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v12 + 1)
                                                                                      + 8LL * (void)i), "modelIdentifier")));
            unsigned __int8 v10 = [v9 hasPrefix:@"RealityDevice"];

            if ((v10 & 1) != 0)
            {
              v2->_idsHasRealityDeviceCache = 1;
              goto LABEL_15;
            }
          }

          id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }

- (BOOL)idsIsSignedIn
{
  v2 = self;
  objc_sync_enter(v2);
  int prefIsSignedInForce = v2->_prefIsSignedInForce;
  if (prefIsSignedInForce < 0)
  {
    if (v2->_idsIsSignedInCache < 0)
    {
      nearbyIDSService = v2->_nearbyIDSService;
      if (nearbyIDSService)
      {
        v2->_idsIsSignedInCache = 0;
        __int128 v11 = 0u;
        __int128 v12 = 0u;
        __int128 v13 = 0u;
        __int128 v14 = 0u;
        id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService accounts](nearbyIDSService, "accounts", 0LL));
        id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v7)
        {
          uint64_t v8 = *(void *)v12;
          while (2)
          {
            for (i = 0LL; i != v7; i = (char *)i + 1)
            {
              if (*(void *)v12 != v8) {
                objc_enumerationMutation(v6);
              }
              if ([*(id *)(*((void *)&v11 + 1) + 8 * (void)i) isActive])
              {
                v2->_idsIsSignedInCache = 1;
                goto LABEL_15;
              }
            }

            id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
            if (v7) {
              continue;
            }
            break;
          }
        }

- (BOOL)idsHasWatch
{
  if (!-[RPCloudDaemon idsIsSignedIn](self, "idsIsSignedIn")) {
    return 0;
  }
  BOOL v3 = self;
  objc_sync_enter(v3);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPCloudDaemon idsDeviceArray](v3, "idsDeviceArray", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = objc_retain((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v12 + 1)
                                                                                  + 8LL * (void)i), "modelIdentifier")));
        unsigned __int8 v9 = [v8 hasPrefix:@"Watch"];

        if ((v9 & 1) != 0)
        {
          BOOL v10 = 1;
          goto LABEL_13;
        }
      }

      id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  BOOL v10 = 0;
LABEL_13:

  objc_sync_exit(v3);
  return v10;
}

- (id)_idsURIWithID:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (v3)
  {
    if ([v3 _FZIDType] == (id)-1)
    {
      uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 _bestGuessURI]);
      id v7 = (void *)v6;
      if (v6) {
        id v8 = (void *)v6;
      }
      else {
        id v8 = v4;
      }
      id v5 = v8;
    }

    else
    {
      id v5 = v4;
    }
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v31 = a5;
  id v11 = a6;
  id v12 = a7;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  __int128 v14 = (IDSService *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  __int128 v15 = (char *)[v31 length];
  nearbyIDSService = self->_nearbyIDSService;

  if (nearbyIDSService != v14)
  {
    if (dword_1001311F8 <= 90
      && (dword_1001311F8 != -1 || _LogCategory_Initialize(&dword_1001311F8, 90LL)))
    {
      LogPrintF( &dword_1001311F8,  "-[RPCloudDaemon service:account:incomingData:fromID:context:]",  90LL,  "### IDS unsupported cloud service: From '%@', %zu bytes, <%.32@>\n",  v11,  v15,  v31);
    }

    __int128 v17 = 0LL;
    goto LABEL_16;
  }

  __int128 v17 = @"com.apple.private.alloy.nearby";
  id v18 = v31;
  __int128 v19 = (unsigned __int8 *)[v18 bytes];
  uint64_t v20 = v15 - 4;
  if ((unint64_t)v15 < 4)
  {
    if (dword_1001311F8 <= 90
      && (dword_1001311F8 != -1 || _LogCategory_Initialize(&dword_1001311F8, 90LL)))
    {
      LogPrintF( &dword_1001311F8,  "-[RPCloudDaemon service:account:incomingData:fromID:context:]",  90LL,  "### IDS header truncated from '%@', %zu bytes, <%.32@>\n",  v11,  v15,  v18);
    }

    goto LABEL_16;
  }

  id v21 = v19;
  unint64_t v22 = ((unint64_t)v19[1] << 16) | ((unint64_t)v19[2] << 8) | v19[3];
  if ((unint64_t)v20 >= v22)
  {
    uint64_t v23 = objc_alloc_init(&OBJC_CLASS___RPCloudMessageContext);
    -[RPCloudMessageContext setCloudServiceID:](v23, "setCloudServiceID:", v17);
    -[RPCloudMessageContext setFromID:](v23, "setFromID:", v11);
    int v24 = (void *)objc_claimAutoreleasedReturnValue([v12 toID]);
    -[RPCloudMessageContext setToID:](v23, "setToID:", v24);

    uint64_t v25 = *v21;
    if (dword_1001311F8 > 30 || dword_1001311F8 == -1 && !_LogCategory_Initialize(&dword_1001311F8, 30LL))
    {
LABEL_56:
      char v28 = v25 - 32;
      if ((v25 - 32) <= 0x21)
      {
        uint64_t v29 = v21 + 4;
        if (((1LL << v28) & 7) != 0)
        {
          -[RPCloudDaemon _receivedFamilyIdentityFrameType:ptr:length:msgCtx:]( self,  "_receivedFamilyIdentityFrameType:ptr:length:msgCtx:",  v25,  v29,  v22,  v23);
          goto LABEL_68;
        }

        if (((1LL << v28) & 0x30000) != 0)
        {
          -[RPCloudDaemon _receivedWatchIdentityFrameType:ptr:length:fromID:]( self,  "_receivedWatchIdentityFrameType:ptr:length:fromID:",  v25,  v29,  v22,  v11);
          goto LABEL_68;
        }

        if (((1LL << v28) & 0x300000000LL) != 0)
        {
          -[RPCloudDaemon _receivedFriendIdentityFrameType:ptr:length:msgCtx:]( self,  "_receivedFriendIdentityFrameType:ptr:length:msgCtx:",  v25,  v29,  v22,  v23);
LABEL_68:

          goto LABEL_16;
        }
      }

      if ((_DWORD)v25 != 1
        && dword_1001311F8 <= 90
        && (dword_1001311F8 != -1 || _LogCategory_Initialize(&dword_1001311F8, 90LL)))
      {
        v30 = sub_10000742C(v25);
        LogPrintF( &dword_1001311F8,  "-[RPCloudDaemon service:account:incomingData:fromID:context:]",  90LL,  "### IDS ignoring unhandled frame 0x%02X (%s), from '%@', %zu bytes, <%.32@>\n",  v25,  v30,  v11,  v22,  v18);
      }

      goto LABEL_68;
    }

    int v26 = (void *)objc_claimAutoreleasedReturnValue(-[RPCloudMessageContext toID](v23, "toID"));
    if ((int)v25 <= 47)
    {
      id v27 = "Invalid";
      switch((int)v25)
      {
        case 0:
          goto LABEL_55;
        case 1:
          id v27 = "NoOp";
          break;
        case 3:
          id v27 = "PS_Start";
          break;
        case 4:
          id v27 = "PS_Next";
          break;
        case 5:
          id v27 = "PV_Start";
          break;
        case 6:
          id v27 = "PV_Next";
          break;
        case 7:
          id v27 = "U_OPACK";
          break;
        case 8:
          id v27 = "E_OPACK";
          break;
        case 9:
          id v27 = "P_OPACK";
          break;
        case 10:
          id v27 = "PA_Req";
          break;
        case 11:
          id v27 = "PA_Rsp";
          break;
        case 16:
          id v27 = "SessionStartRequest";
          break;
        case 17:
          id v27 = "SessionStartResponse";
          break;
        case 18:
          id v27 = "SessionData";
          break;
        case 32:
          id v27 = "FamilyIdentityRequest";
          break;
        case 33:
          id v27 = "FamilyIdentityResponse";
          break;
        case 34:
          id v27 = "FamilyIdentityUpdate";
          break;
        default:
          goto LABEL_54;
      }

      goto LABEL_55;
    }

    if ((int)v25 <= 63)
    {
      if ((_DWORD)v25 == 48)
      {
        id v27 = "WatchIdentityRequest";
        goto LABEL_55;
      }

      if ((_DWORD)v25 == 49)
      {
        id v27 = "WatchIdentityResponse";
        goto LABEL_55;
      }
    }

    else
    {
      switch((_DWORD)v25)
      {
        case '@':
          id v27 = "FriendIdentityRequest";
          goto LABEL_55;
        case 'A':
          id v27 = "FriendIdentityResponse";
          goto LABEL_55;
        case 'B':
          id v27 = "FriendIdentityUpdate";
LABEL_55:
          LogPrintF( &dword_1001311F8,  "-[RPCloudDaemon service:account:incomingData:fromID:context:]",  30LL,  "IDS received frame from '%@', ClSI '%@', ToID %@, 0x%02X (%s), %zu bytes, <%.32@>\n",  v11,  v17,  v26,  v25,  v27,  v22,  v18);

          goto LABEL_56;
      }
    }

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  id v17 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = a8;
  if (v15 || !a6)
  {
    if (dword_1001311F8 <= 90
      && (dword_1001311F8 != -1 || _LogCategory_Initialize(&dword_1001311F8, 90LL)))
    {
      LogPrintF( &dword_1001311F8,  "-[RPCloudDaemon service:account:identifier:didSendWithSuccess:error:context:]",  90LL,  "### IDS send failed ID %@, error %{error}\n",  v14,  v15);
    }
  }

  else if (dword_1001311F8 <= 30 {
         && (dword_1001311F8 != -1 || _LogCategory_Initialize(&dword_1001311F8, 30LL)))
  }
  {
    LogPrintF( &dword_1001311F8,  "-[RPCloudDaemon service:account:identifier:didSendWithSuccess:error:context:]",  30LL,  "IDS sent ID %@\n",  v14);
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  id v12 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (dword_1001311F8 <= 30 && (dword_1001311F8 != -1 || _LogCategory_Initialize(&dword_1001311F8, 30LL))) {
    LogPrintF( &dword_1001311F8,  "-[RPCloudDaemon service:account:identifier:hasBeenDeliveredWithContext:]",  30LL,  "IDS delivered ID %@\n",  v10,  v12);
  }
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (dword_1001311F8 <= 30 && (dword_1001311F8 != -1 || _LogCategory_Initialize(&dword_1001311F8, 30LL))) {
    LogPrintF( &dword_1001311F8,  "-[RPCloudDaemon service:activeAccountsChanged:]",  30,  "IDS ActiveAccountsChanged, %d account(s)\n",  [v6 count]);
  }
  id v7 = self;
  objc_sync_enter(v7);
  idsDeviceArray = v7->_idsDeviceArray;
  v7->_idsDeviceArray = 0LL;

  idsDeviceMap = v7->_idsDeviceMap;
  v7->_idsDeviceMap = 0LL;

  v7->_idsIsSignedInCache = -1;
  *(void *)&v7->_idsHasHomePodCache = -1LL;
  *(void *)&v7->_idsHasMacCache = -1LL;
  *(void *)&v7->_int idsHandheldCountCache = -1LL;
  objc_sync_exit(v7);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](&OBJC_CLASS___RPDaemon, "sharedDaemon"));
  [v10 postDaemonInfoChanges:1];
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_1001311F8 <= 30 && (dword_1001311F8 != -1 || _LogCategory_Initialize(&dword_1001311F8, 30LL))) {
    LogPrintF( &dword_1001311F8,  "-[RPCloudDaemon service:devicesChanged:]",  30,  "IDS DevicesChanged: %d device(s)\n",  [v7 count]);
  }
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    id v12 = v9;
    uint64_t v13 = *(void *)v24;
    while (2)
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v8);
        }
        uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)i);
        uint64_t v16 = objc_opt_class(&OBJC_CLASS___IDSDevice, v10, v11);
        if ((objc_opt_isKindOfClass(v15, v16) & 1) == 0)
        {
          unint64_t v22 = v8;
          if (dword_1001311F8 <= 90)
          {
            if (dword_1001311F8 != -1 || (unint64_t v22 = v8, _LogCategory_Initialize(&dword_1001311F8, 90LL)))
            {
              LogPrintF( &dword_1001311F8,  "-[RPCloudDaemon service:devicesChanged:]",  90LL,  "### Bad IDS device: %@\n",  v15);
              unint64_t v22 = v8;
            }
          }

          goto LABEL_18;
        }
      }

      id v12 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  id v17 = (NSArray *)[v8 copy];
  id v18 = self;
  objc_sync_enter(v18);
  idsDeviceArray = v18->_idsDeviceArray;
  v18->_idsDeviceArray = v17;
  uint64_t v20 = v17;

  idsDeviceMap = v18->_idsDeviceMap;
  v18->_idsDeviceMap = 0LL;

  v18->_idsIsSignedInCache = -1;
  *(void *)&v18->_idsHasHomePodCache = -1LL;
  *(void *)&v18->_idsHasMacCache = -1LL;
  *(void *)&v18->_int idsHandheldCountCache = -1LL;
  objc_sync_exit(v18);

  unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](&OBJC_CLASS___RPDaemon, "sharedDaemon"));
  [v22 postDaemonInfoChanges:1];
LABEL_18:
}

- (void)serviceSpaceDidBecomeAvailable:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (dword_1001311F8 <= 30
    && ((id v6 = v3, dword_1001311F8 != -1) || (v5 = _LogCategory_Initialize(&dword_1001311F8, 30LL), v4 = v6, v5)))
  {
    LogPrintF( &dword_1001311F8,  "-[RPCloudDaemon serviceSpaceDidBecomeAvailable:]",  30LL,  "IDS space became available\n");
  }

  else
  {
  }

- (void)_receivedFamilyIdentityFrameType:(unsigned __int8)a3 ptr:(const char *)a4 length:(unint64_t)a5 msgCtx:(id)a6
{
  int v8 = a3;
  id v9 = a6;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 fromID]);
  uint64_t v13 = (void *)OPACKDecodeBytes(a4, a5, 8LL, &v22);
  if (!v13)
  {
    if (v8 <= 47)
    {
      id v18 = "Invalid";
      switch(v8)
      {
        case 0:
          goto LABEL_73;
        case 1:
          id v18 = "NoOp";
          break;
        case 3:
          id v18 = "PS_Start";
          break;
        case 4:
          id v18 = "PS_Next";
          break;
        case 5:
          id v18 = "PV_Start";
          break;
        case 6:
          id v18 = "PV_Next";
          break;
        case 7:
          id v18 = "U_OPACK";
          break;
        case 8:
          id v18 = "E_OPACK";
          break;
        case 9:
          id v18 = "P_OPACK";
          break;
        case 10:
          id v18 = "PA_Req";
          break;
        case 11:
          id v18 = "PA_Rsp";
          break;
        case 16:
          id v18 = "SessionStartRequest";
          break;
        case 17:
          id v18 = "SessionStartResponse";
          break;
        case 18:
          id v18 = "SessionData";
          break;
        case 32:
          id v18 = "FamilyIdentityRequest";
          break;
        case 33:
          id v18 = "FamilyIdentityResponse";
          break;
        case 34:
          id v18 = "FamilyIdentityUpdate";
          break;
        default:
          goto LABEL_72;
      }

      goto LABEL_73;
    }

    if (v8 <= 63)
    {
      if (v8 == 48)
      {
        id v18 = "WatchIdentityRequest";
        goto LABEL_73;
      }

      if (v8 == 49)
      {
        id v18 = "WatchIdentityResponse";
        goto LABEL_73;
      }
    }

    else
    {
      switch(v8)
      {
        case '@':
          id v18 = "FriendIdentityRequest";
          goto LABEL_73;
        case 'A':
          id v18 = "FriendIdentityResponse";
          goto LABEL_73;
        case 'B':
          id v18 = "FriendIdentityUpdate";
LABEL_73:
          LogPrintF( &dword_1001311F8,  "-[RPCloudDaemon _receivedFamilyIdentityFrameType:ptr:length:msgCtx:]",  90LL,  "### Family identity message decode failed: type %s, fromID '%@', %#m\n",  v18,  v10,  v22);
          goto LABEL_94;
      }
    }

- (void)_receivedFriendIdentityFrameType:(unsigned __int8)a3 ptr:(const char *)a4 length:(unint64_t)a5 msgCtx:(id)a6
{
  int v8 = a3;
  id v9 = a6;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 fromID]);
  uint64_t v13 = (void *)OPACKDecodeBytes(a4, a5, 8LL, &v22);
  if (!v13)
  {
    if (v8 <= 47)
    {
      id v18 = "Invalid";
      switch(v8)
      {
        case 0:
          goto LABEL_73;
        case 1:
          id v18 = "NoOp";
          break;
        case 3:
          id v18 = "PS_Start";
          break;
        case 4:
          id v18 = "PS_Next";
          break;
        case 5:
          id v18 = "PV_Start";
          break;
        case 6:
          id v18 = "PV_Next";
          break;
        case 7:
          id v18 = "U_OPACK";
          break;
        case 8:
          id v18 = "E_OPACK";
          break;
        case 9:
          id v18 = "P_OPACK";
          break;
        case 10:
          id v18 = "PA_Req";
          break;
        case 11:
          id v18 = "PA_Rsp";
          break;
        case 16:
          id v18 = "SessionStartRequest";
          break;
        case 17:
          id v18 = "SessionStartResponse";
          break;
        case 18:
          id v18 = "SessionData";
          break;
        case 32:
          id v18 = "FamilyIdentityRequest";
          break;
        case 33:
          id v18 = "FamilyIdentityResponse";
          break;
        case 34:
          id v18 = "FamilyIdentityUpdate";
          break;
        default:
          goto LABEL_72;
      }

      goto LABEL_73;
    }

    if (v8 <= 63)
    {
      if (v8 == 48)
      {
        id v18 = "WatchIdentityRequest";
        goto LABEL_73;
      }

      if (v8 == 49)
      {
        id v18 = "WatchIdentityResponse";
        goto LABEL_73;
      }
    }

    else
    {
      switch(v8)
      {
        case '@':
          id v18 = "FriendIdentityRequest";
          goto LABEL_73;
        case 'A':
          id v18 = "FriendIdentityResponse";
          goto LABEL_73;
        case 'B':
          id v18 = "FriendIdentityUpdate";
LABEL_73:
          LogPrintF( &dword_1001311F8,  "-[RPCloudDaemon _receivedFriendIdentityFrameType:ptr:length:msgCtx:]",  90LL,  "### Friend identity message decode failed: type %s, fromID '%@', %#m\n",  v18,  v10,  v22);
          goto LABEL_94;
      }
    }

- (void)_receivedWatchIdentityFrameType:(unsigned __int8)a3 ptr:(const char *)a4 length:(unint64_t)a5 fromID:(id)a6
{
  int v8 = a3;
  id v10 = a6;
  if ([v10 hasPrefix:@"device:"])
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[RPCloudDaemon idsDeviceMap](self, "idsDeviceMap"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 substringFromIndex:7]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v12]);

    if (!v13)
    {
      if (dword_1001311F8 <= 90
        && (dword_1001311F8 != -1 || _LogCategory_Initialize(&dword_1001311F8, 90LL)))
      {
        LogPrintF( &dword_1001311F8,  "-[RPCloudDaemon _receivedWatchIdentityFrameType:ptr:length:fromID:]",  90LL,  "### Ignoring watch identity from unknown fromID '%@'\n",  v10);
      }

      goto LABEL_95;
    }

    uint64_t v16 = (void *)OPACKDecodeBytes(a4, a5, 8LL, &v20);
    if (v16)
    {
      uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSDictionary, v14, v15);
      if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
      {
        if (v8 == 49)
        {
          -[RPCloudDaemon _receivedWatchIdentityResponse:fromIDSDevice:]( self,  "_receivedWatchIdentityResponse:fromIDSDevice:",  v16,  v13);
        }

        else if (v8 == 48)
        {
          -[RPCloudDaemon _receivedWatchIdentityRequest:fromIDSDevice:]( self,  "_receivedWatchIdentityRequest:fromIDSDevice:",  v16,  v13);
        }

        else if (dword_1001311F8 <= 90 {
               && (dword_1001311F8 != -1 || _LogCategory_Initialize(&dword_1001311F8, 90LL)))
        }
        {
          sub_10000742C(v8);
          LogPrintF( &dword_1001311F8,  "-[RPCloudDaemon _receivedWatchIdentityFrameType:ptr:length:fromID:]",  90LL,  "### Unhandled watch identity frame 0x%02X (%s)\n");
        }

        goto LABEL_94;
      }

      if (dword_1001311F8 <= 90
        && (dword_1001311F8 != -1 || _LogCategory_Initialize(&dword_1001311F8, 90LL)))
      {
        if (v8 <= 47)
        {
          __int128 v19 = "Invalid";
          switch(v8)
          {
            case 0:
              goto LABEL_93;
            case 1:
              __int128 v19 = "NoOp";
              break;
            case 3:
              __int128 v19 = "PS_Start";
              break;
            case 4:
              __int128 v19 = "PS_Next";
              break;
            case 5:
              __int128 v19 = "PV_Start";
              break;
            case 6:
              __int128 v19 = "PV_Next";
              break;
            case 7:
              __int128 v19 = "U_OPACK";
              break;
            case 8:
              __int128 v19 = "E_OPACK";
              break;
            case 9:
              __int128 v19 = "P_OPACK";
              break;
            case 10:
              __int128 v19 = "PA_Req";
              break;
            case 11:
              __int128 v19 = "PA_Rsp";
              break;
            case 16:
              __int128 v19 = "SessionStartRequest";
              break;
            case 17:
              __int128 v19 = "SessionStartResponse";
              break;
            case 18:
              __int128 v19 = "SessionData";
              break;
            case 32:
              __int128 v19 = "FamilyIdentityRequest";
              break;
            case 33:
              __int128 v19 = "FamilyIdentityResponse";
              break;
            case 34:
              __int128 v19 = "FamilyIdentityUpdate";
              break;
            default:
              goto LABEL_92;
          }

          goto LABEL_93;
        }

        if (v8 <= 63)
        {
          if (v8 == 48)
          {
            __int128 v19 = "WatchIdentityRequest";
            goto LABEL_93;
          }

          if (v8 == 49)
          {
            __int128 v19 = "WatchIdentityResponse";
            goto LABEL_93;
          }
        }

        else
        {
          switch(v8)
          {
            case '@':
              __int128 v19 = "FriendIdentityRequest";
              goto LABEL_93;
            case 'A':
              __int128 v19 = "FriendIdentityResponse";
              goto LABEL_93;
            case 'B':
              __int128 v19 = "FriendIdentityUpdate";
LABEL_93:
              LogPrintF( &dword_1001311F8,  "-[RPCloudDaemon _receivedWatchIdentityFrameType:ptr:length:fromID:]",  90LL,  "### Watch identity message not dictionary: type %s, fromID '%@', %#m\n",  v19,  v10,  v20);
              goto LABEL_94;
          }
        }

- (void)_receivedWatchIdentityRequest:(id)a3 fromIDSDevice:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueIDOverride]);
    if (v7)
    {
      if (dword_1001311F8 <= 30
        && (dword_1001311F8 != -1 || _LogCategory_Initialize(&dword_1001311F8, 30LL)))
      {
        LogPrintF( &dword_1001311F8,  "-[RPCloudDaemon _receivedWatchIdentityRequest:fromIDSDevice:]",  30LL,  "Received watch identity request: from IDS '%.8@'\n",  v7);
      }

      int v8 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
      [v8 saveIdentityWithIDSDeviceID:v7 message:v11 error:0];

      id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
      [v10 addSelfIdentityInfoToMessage:v9 flags:0];

      -[RPCloudDaemon sendIDSMessage:cloudServiceID:frameType:destinationDevice:sendFlags:msgCtx:error:]( self,  "sendIDSMessage:cloudServiceID:frameType:destinationDevice:sendFlags:msgCtx:error:",  v9,  @"com.apple.private.alloy.nearby",  49LL,  v6,  1LL,  0LL,  0LL);
    }

    else if (dword_1001311F8 <= 90 {
           && (dword_1001311F8 != -1 || _LogCategory_Initialize(&dword_1001311F8, 90LL)))
    }
    {
      LogPrintF( &dword_1001311F8,  "-[RPCloudDaemon _receivedWatchIdentityRequest:fromIDSDevice:]",  90LL,  "### Ignoring watch identity request from IDS device with no ID\n");
    }
  }

  else if (dword_1001311F8 <= 30 {
         && (dword_1001311F8 != -1 || _LogCategory_Initialize(&dword_1001311F8, 30LL)))
  }
  {
    LogPrintF( &dword_1001311F8,  "-[RPCloudDaemon _receivedWatchIdentityRequest:fromIDSDevice:]",  30LL,  "### Ignoring watch identity request before FirstUnlock\n");
  }
}

- (void)_receivedWatchIdentityResponse:(id)a3 fromIDSDevice:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueIDOverride]);
    if (v7)
    {
      if (dword_1001311F8 <= 30
        && (dword_1001311F8 != -1 || _LogCategory_Initialize(&dword_1001311F8, 30LL)))
      {
        LogPrintF( &dword_1001311F8,  "-[RPCloudDaemon _receivedWatchIdentityResponse:fromIDSDevice:]",  30LL,  "Received watch identity response: from IDS '%.8@'\n",  v7);
      }

      int v8 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
      [v8 saveIdentityWithIDSDeviceID:v7 message:v9 error:0];
    }

    else if (dword_1001311F8 <= 90 {
           && (dword_1001311F8 != -1 || _LogCategory_Initialize(&dword_1001311F8, 90LL)))
    }
    {
      LogPrintF( &dword_1001311F8,  "-[RPCloudDaemon _receivedWatchIdentityResponse:fromIDSDevice:]",  90LL,  "### Ignoring watch identity response from IDS device with no ID\n");
    }
  }

  else if (dword_1001311F8 <= 60 {
         && (dword_1001311F8 != -1 || _LogCategory_Initialize(&dword_1001311F8, 60LL)))
  }
  {
    LogPrintF( &dword_1001311F8,  "-[RPCloudDaemon _receivedWatchIdentityResponse:fromIDSDevice:]",  60LL,  "### Ignoring watch identity response before FirstUnlock\n");
  }
}

- (BOOL)sendIDSMessage:(id)a3 cloudServiceID:(id)a4 frameType:(unsigned __int8)a5 destinationDevice:(id)a6 sendFlags:(unsigned int)a7 msgCtx:(id)a8 error:(id *)a9
{
  uint64_t v10 = *(void *)&a7;
  uint64_t v12 = a5;
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a8;
  __int128 v25 = (void *)IDSCopyIDForDevice(v17);
  if (v25)
  {
    BOOL v26 = -[RPCloudDaemon sendIDSMessage:cloudServiceID:frameType:destinationID:sendFlags:msgCtx:error:]( self,  "sendIDSMessage:cloudServiceID:frameType:destinationID:sendFlags:msgCtx:error:",  v15,  v16,  v12,  v25,  v10,  v18,  a9);
    goto LABEL_41;
  }

  id v27 = RPErrorF( 4294960591LL,  (uint64_t)"No IDS destination ID for device %@",  v19,  v20,  v21,  v22,  v23,  v24,  (uint64_t)v17);
  char v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  if (dword_1001311F8 <= 90 && (dword_1001311F8 != -1 || _LogCategory_Initialize(&dword_1001311F8, 90LL)))
  {
    if ((int)v12 <= 47)
    {
      uint64_t v29 = "Invalid";
      switch((int)v12)
      {
        case 0:
          goto LABEL_37;
        case 1:
          uint64_t v29 = "NoOp";
          break;
        case 3:
          uint64_t v29 = "PS_Start";
          break;
        case 4:
          uint64_t v29 = "PS_Next";
          break;
        case 5:
          uint64_t v29 = "PV_Start";
          break;
        case 6:
          uint64_t v29 = "PV_Next";
          break;
        case 7:
          uint64_t v29 = "U_OPACK";
          break;
        case 8:
          uint64_t v29 = "E_OPACK";
          break;
        case 9:
          uint64_t v29 = "P_OPACK";
          break;
        case 10:
          uint64_t v29 = "PA_Req";
          break;
        case 11:
          uint64_t v29 = "PA_Rsp";
          break;
        case 16:
          uint64_t v29 = "SessionStartRequest";
          break;
        case 17:
          uint64_t v29 = "SessionStartResponse";
          break;
        case 18:
          uint64_t v29 = "SessionData";
          break;
        case 32:
          uint64_t v29 = "FamilyIdentityRequest";
          break;
        case 33:
          uint64_t v29 = "FamilyIdentityResponse";
          break;
        case 34:
          uint64_t v29 = "FamilyIdentityUpdate";
          break;
        default:
          goto LABEL_36;
      }

      goto LABEL_37;
    }

    if ((int)v12 <= 63)
    {
      if ((_DWORD)v12 == 48)
      {
        uint64_t v29 = "WatchIdentityRequest";
        goto LABEL_37;
      }

      if ((_DWORD)v12 == 49)
      {
        uint64_t v29 = "WatchIdentityResponse";
        goto LABEL_37;
      }
    }

    else
    {
      switch((_DWORD)v12)
      {
        case '@':
          uint64_t v29 = "FriendIdentityRequest";
          goto LABEL_37;
        case 'A':
          uint64_t v29 = "FriendIdentityResponse";
          goto LABEL_37;
        case 'B':
          uint64_t v29 = "FriendIdentityUpdate";
LABEL_37:
          LogPrintF( &dword_1001311F8,  "-[RPCloudDaemon sendIDSMessage:cloudServiceID:frameType:destinationDevice:sendFlags:msgCtx:error:]",  90LL,  "### IDS send frame failed: %s, %{error}\n",  v29,  v28);
          goto LABEL_38;
      }
    }

- (BOOL)sendIDSMessage:(id)a3 cloudServiceID:(id)a4 frameType:(unsigned __int8)a5 destinationID:(id)a6 sendFlags:(unsigned int)a7 msgCtx:(id)a8 error:(id *)a9
{
  char v10 = a7;
  int v12 = a5;
  id v15 = a4;
  id v16 = (__CFString *)a6;
  id v17 = a8;
  if (v12 > 47)
  {
    if (v12 <= 63)
    {
      if (v12 == 48)
      {
        id v18 = "WatchIdentityRequest";
        goto LABEL_31;
      }

      if (v12 == 49)
      {
        id v18 = "WatchIdentityResponse";
        goto LABEL_31;
      }
    }

    else
    {
      switch(v12)
      {
        case '@':
          id v18 = "FriendIdentityRequest";
          goto LABEL_31;
        case 'A':
          id v18 = "FriendIdentityResponse";
          goto LABEL_31;
        case 'B':
          id v18 = "FriendIdentityUpdate";
          goto LABEL_31;
      }
    }

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)operatingSystemVersionForID:(SEL)a3
{
  id v6 = a4;
  retstr->var1 = 0LL;
  retstr->var2 = 0LL;
  retstr->var0 = 0LL;
  if (-[RPCloudDaemon idsIsSignedIn](self, "idsIsSignedIn"))
  {
    id v7 = self;
    objc_sync_enter(v7);
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    int v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPCloudDaemon idsDeviceArray](v7, "idsDeviceArray"));
    id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v19;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v8);
          }
          int v12 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueID]);
          unsigned int v14 = [v13 isEqualToString:v6];

          if (v14)
          {
            if (v12)
            {
              [v12 operatingSystemVersion];
            }

            else
            {
              __int128 v16 = 0uLL;
              int64_t v17 = 0LL;
            }

            *(_OWORD *)&retstr->var0 = v16;
            retstr->var2 = v17;
            goto LABEL_15;
          }
        }

        id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)operatingSystemVersionForSelf
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  if (v4)
  {
    id v6 = v4;
    [v4 operatingSystemVersion];
    BOOL v4 = v6;
  }

  else
  {
    retstr->var0 = 0LL;
    retstr->var1 = 0LL;
    retstr->var2 = 0LL;
  }

  return result;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (IDSService)nearbyIDSService
{
  return self->_nearbyIDSService;
}

- (void)setNearbyIDSService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
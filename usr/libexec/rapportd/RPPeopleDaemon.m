@interface RPPeopleDaemon
+ (id)sharedPeopleDaemon;
- (BOOL)_pruneFamilyDevices;
- (BOOL)_pruneFriendAccounts:(BOOL)a3;
- (BOOL)_pruneFriendDevices;
- (BOOL)_pruneFriends:(BOOL)a3;
- (BOOL)_sendCloudIdentityFrameType:(unsigned __int8)a3 destinationID:(id)a4 flags:(unsigned int)a5 msgCtx:(id)a6;
- (BOOL)_shouldThrottleFriendSyncing;
- (BOOL)_updateFamilyAccounts;
- (BOOL)_updateFamilyDevices;
- (BOOL)_updateFamilyIdentityWithFamilyMember:(id)a3;
- (BOOL)_updateFriendAccounts;
- (BOOL)_updateFriendDevices;
- (BOOL)addOrUpdateAdHocPairedIdentity:(id)a3 error:(id *)a4;
- (BOOL)addOrUpdateIdentity:(id)a3 error:(id *)a4;
- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5;
- (BOOL)diagnosticCommand:(id)a3 params:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)removeXPCMatchingToken:(unint64_t)a3;
- (BOOL)updateFriendIdentityWithAppleID:(id)a3 contactID:(id)a4;
- (OS_dispatch_queue)dispatchQueue;
- (RPPeopleDaemon)init;
- (id)_primaryAppleID:(BOOL)a3;
- (id)descriptionWithLevel:(int)a3;
- (id)getFamilyDeviceIdentities;
- (id)getFamilyURIs;
- (id)getFriendDeviceIdentities;
- (unsigned)_updateFriendIdentityWithAppleID:(id)a3 contactID:(id)a4 sendersKnownAlias:(id)a5 userAdded:(BOOL)a6 updateDateRequested:(BOOL)a7 suggestedContactIDs:(id)a8;
- (unsigned)_updateIdentityType:(int)a3 idsDeviceID:(id)a4 appleID:(id)a5 contactID:(id)a6 msg:(id)a7;
- (void)_activate;
- (void)_bufferCloudMessage:(id)a3 frameType:(unsigned __int8)a4 msgCtx:(id)a5;
- (void)_daemonDeviceChanged:(id)a3 changes:(unsigned int)a4;
- (void)_daemonDeviceFound:(id)a3;
- (void)_daemonDeviceLost:(id)a3;
- (void)_discoveryEnsureStarted;
- (void)_discoveryEnsureStopped;
- (void)_familyEnsureStarted;
- (void)_familyEnsureStopped;
- (void)_fetchSameAccountIdentities;
- (void)_friendsEnsureStarted;
- (void)_friendsEnsureStopped;
- (void)_friendsUpdateSuggestedIfNeeded;
- (void)_invalidate;
- (void)_invalidated;
- (void)_irkMetricsSetup;
- (void)_processBufferedCloudMessages;
- (void)_regenerateSelfIdentity:(id)a3;
- (void)_resetFriends;
- (void)_update;
- (void)_updateFamilyIdentities;
- (void)_updateFamilyNotification;
- (void)_updateFamilySyncing;
- (void)_updateFriendIdentities;
- (void)_updateFriendPrivacy;
- (void)_updateFriendPrivacyResults:(id)a3;
- (void)_updateFriendSyncing;
- (void)_xpcConnectionInvalidated:(id)a3;
- (void)activate;
- (void)daemonInfoChanged:(unint64_t)a3;
- (void)invalidate;
- (void)prefsChanged;
- (void)receivedFamilyIdentityRequest:(id)a3 msgCtx:(id)a4;
- (void)receivedFamilyIdentityResponse:(id)a3 msgCtx:(id)a4;
- (void)receivedFamilyIdentityUpdate:(id)a3 msgCtx:(id)a4;
- (void)receivedFriendIdentityRequest:(id)a3 msgCtx:(id)a4;
- (void)receivedFriendIdentityResponse:(id)a3 msgCtx:(id)a4;
- (void)receivedFriendIdentityUpdate:(id)a3 msgCtx:(id)a4;
- (void)reportIRKMetrics;
- (void)setDispatchQueue:(id)a3;
@end

@implementation RPPeopleDaemon

+ (id)sharedPeopleDaemon
{
  if (qword_1001335C8 != -1) {
    dispatch_once(&qword_1001335C8, &stru_1001143D8);
  }
  return (id)qword_1001335C0;
}

- (RPPeopleDaemon)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RPPeopleDaemon;
  v2 = -[RPPeopleDaemon init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->_airdropModeNotifyToken = -1;
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v3->_familyNotifyToken = -1;
    v3->_friendsSuggestedNotifyToken = -1;
    v3->_privacyChangedNotifyToken = -1;
    -[RPPeopleDaemon _irkMetricsSetup](v3, "_irkMetricsSetup");
    v4 = v3;
  }

  return v3;
}

- (id)descriptionWithLevel:(int)a3
{
  if (a3 < 21)
  {
    uint64_t v74 = 0LL;
    v75 = &v74;
    uint64_t v76 = 0x3032000000LL;
    v77 = sub_100083868;
    v78 = sub_100083878;
    id v79 = 0LL;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[CUSystemMonitor familyMembers](self->_familyMemberMonitor, "familyMembers"));
    v7 = (id *)(v75 + 5);
    id obj = (id)v75[5];
    NSAppendPrintF( &obj,  "-- RPPeopleDaemon: %d devices, %d family, %d XPC --\n",  -[NSMutableDictionary count](self->_discoveredDevices, "count"),  [v48 count],  -[NSMutableSet count](self->_xpcConnections, "count"));
    objc_storeStrong(v7, obj);
    if (a3 > 10)
    {
      uint64_t v23 = 50LL;
    }

    else
    {
      if ([v48 count])
      {
        v8 = (id *)(v75 + 5);
        id v72 = (id)v75[5];
        NSAppendPrintF(&v72, "Family: ");
        objc_storeStrong(v8, v72);
        __int128 v70 = 0u;
        __int128 v71 = 0u;
        __int128 v68 = 0u;
        __int128 v69 = 0u;
        id v49 = v48;
        id v9 = [v49 countByEnumeratingWithState:&v68 objects:v81 count:16];
        if (v9)
        {
          v10 = "";
          uint64_t v11 = *(void *)v69;
          do
          {
            v12 = 0LL;
            do
            {
              if (*(void *)v69 != v11) {
                objc_enumerationMutation(v49);
              }
              v13 = *(void **)(*((void *)&v68 + 1) + 8LL * (void)v12);
              v14 = (id *)(v75 + 5);
              id v67 = (id)v75[5];
              v15 = (void *)objc_claimAutoreleasedReturnValue([v13 appleID]);
              unsigned int v16 = [v13 isMe];
              v17 = " (me)";
              if (!v16) {
                v17 = "";
              }
              NSAppendPrintF(&v67, "%s%{mask}%s", v10, v15, v17);
              objc_storeStrong(v14, v67);

              v12 = (char *)v12 + 1;
              v10 = ", ";
            }

            while (v9 != v12);
            id v9 = [v49 countByEnumeratingWithState:&v68 objects:v81 count:16];
            v10 = ", ";
          }

          while (v9);
        }

        v18 = (id *)(v75 + 5);
        id v66 = (id)v75[5];
        NSAppendPrintF(&v66, "\n");
        objc_storeStrong(v18, v66);
      }

      double Current = CFAbsoluteTimeGetCurrent();
      double Double = CFPrefs_GetDouble(@"com.apple.rapport", @"pdFriendSyncStart", 0LL);
      if (Double >= 0.0)
      {
        if (Double == 0.0)
        {
          v21 = (void **)(v75 + 5);
          v64 = (void *)v75[5];
          NSAppendPrintF(&v64, "Friend Sync Start: not started\n");
          v22 = v64;
        }

        else
        {
          v21 = (void **)(v75 + 5);
          if (Double <= Current)
          {
            v63 = (void *)v75[5];
            NSAppendPrintF(&v63, "Friend Sync Start: %{DateCF}\n", *(void *)&Double);
            v22 = v63;
          }

          else
          {
            v62 = (void *)v75[5];
            NSAppendPrintF( &v62,  "Friend Sync Start: %{DateCF}, %{dur}\n",  *(void *)&Double,  (int)fmin(Double - Current, 2147483650.0));
            v22 = v62;
          }
        }
      }

      else
      {
        v21 = (void **)(v75 + 5);
        v65 = (void *)v75[5];
        NSAppendPrintF(&v65, "Friend Sync Start: disabled\n");
        v22 = v65;
      }

      id v24 = v22;
      v25 = *v21;
      *v21 = v24;

      uint64_t v23 = 30LL;
    }

    v26 = self->_deviceDiscovery;
    v27 = v26;
    if (v26)
    {
      v28 = (id *)(v75 + 5);
      id v61 = (id)v75[5];
      NSAppendPrintF(&v61, "%@\n", v26);
      objc_storeStrong(v28, v61);
    }

    id v29 = -[NSMutableDictionary count](self->_discoveredDevices, "count");
    if (v29)
    {
      v30 = (id *)(v75 + 5);
      id v60 = (id)v75[5];
      NSAppendPrintF(&v60, "%d device(s)\n", (_DWORD)v29);
      objc_storeStrong(v30, v60);
    }

    discoveredDevices = self->_discoveredDevices;
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472LL;
    v58[2] = sub_100083880;
    v58[3] = &unk_100114400;
    v58[4] = &v74;
    int v59 = v23;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( discoveredDevices,  "enumerateKeysAndObjectsUsingBlock:",  v58);
    id v32 = -[NSMutableSet count](self->_xpcConnections, "count");
    if (v32)
    {
      v33 = (id *)(v75 + 5);
      id v57 = (id)v75[5];
      NSAppendPrintF(&v57, "%d XPC Cnx\n", (_DWORD)v32);
      objc_storeStrong(v33, v57);
    }

    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    v34 = self->_xpcConnections;
    id v35 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v34,  "countByEnumeratingWithState:objects:count:",  &v53,  v80,  16LL);
    if (v35)
    {
      uint64_t v36 = *(void *)v54;
      do
      {
        v37 = 0LL;
        do
        {
          if (*(void *)v54 != v36) {
            objc_enumerationMutation(v34);
          }
          v38 = *(void **)(*((void *)&v53 + 1) + 8LL * (void)v37);
          v39 = (id *)(v75 + 5);
          id v52 = (id)v75[5];
          v40 = (void *)objc_claimAutoreleasedReturnValue([v38 xpcCnx]);
          NSAppendPrintF(&v52, "    %#{pid}", [v40 processIdentifier]);
          objc_storeStrong(v39, v52);

          uint64_t v41 = objc_claimAutoreleasedReturnValue([v38 activatedDiscovery]);
          v42 = (void *)v41;
          if (v41)
          {
            v43 = (id *)(v75 + 5);
            id v51 = (id)v75[5];
            uint64_t v44 = CUDescriptionWithLevel(v41, v23);
            v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
            NSAppendPrintF(&v51, ", %@", v45);
            objc_storeStrong(v43, v51);
          }

          v46 = (id *)(v75 + 5);
          id v50 = (id)v75[5];
          NSAppendPrintF(&v50, "\n");
          objc_storeStrong(v46, v50);
          v37 = (char *)v37 + 1;
        }

        while (v35 != v37);
        id v35 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v34,  "countByEnumeratingWithState:objects:count:",  &v53,  v80,  16LL);
      }

      while (v35);
    }

    id v5 = (id)v75[5];
    _Block_object_dispose(&v74, 8);
  }

  else
  {
    uint64_t v4 = NSPrintF("RPPeopleDaemon %{ptr}", a2, self);
    id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  }

  return v5;
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100083940;
  block[3] = &unk_1001110A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  if (!self->_xpcListener)
  {
    v3 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.rapport.people");
    xpcListener = self->_xpcListener;
    self->_xpcListener = v3;

    -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
    -[NSXPCListener _setQueue:](self->_xpcListener, "_setQueue:", self->_dispatchQueue);
    -[NSXPCListener resume](self->_xpcListener, "resume");
  }

  if (self->_airdropModeNotifyToken == -1)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100083B60;
    handler[3] = &unk_1001115C8;
    handler[4] = self;
    notify_register_dispatch( "com.apple.sharing.airdrop-mode-changed",  &self->_airdropModeNotifyToken,  dispatchQueue,  handler);
    int airdropModeNotifyToken = self->_airdropModeNotifyToken;
    uint64_t state64 = 0LL;
    notify_get_state(airdropModeNotifyToken, &state64);
    self->_airdropMode = state64;
  }

  if (!self->_systemMonitor)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___CUSystemMonitor);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v7;

    -[CUSystemMonitor setDispatchQueue:](self->_systemMonitor, "setDispatchQueue:", self->_dispatchQueue);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100083C34;
    v13[3] = &unk_1001110A8;
    v13[4] = self;
    -[CUSystemMonitor setFirstUnlockHandler:](self->_systemMonitor, "setFirstUnlockHandler:", v13);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100083C3C;
    v12[3] = &unk_1001110A8;
    v12[4] = self;
    -[CUSystemMonitor setPrimaryAppleIDChangedHandler:](self->_systemMonitor, "setPrimaryAppleIDChangedHandler:", v12);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100083C60;
    v11[3] = &unk_1001110A8;
    v11[4] = self;
    -[CUSystemMonitor setScreenOnChangedHandler:](self->_systemMonitor, "setScreenOnChangedHandler:", v11);
    id v9 = self->_systemMonitor;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100083C68;
    v10[3] = &unk_1001110A8;
    v10[4] = self;
    -[CUSystemMonitor activateWithCompletion:](v9, "activateWithCompletion:", v10);
  }

  -[RPPeopleDaemon prefsChanged](self, "prefsChanged");
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100083CC8;
  block[3] = &unk_1001110A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_100132930 <= 30
      && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
    {
      LogPrintF(&dword_100132930, "-[RPPeopleDaemon _invalidate]", 30LL, "Invalidating\n");
    }

    primaryAppleIDCached = self->_primaryAppleIDCached;
    self->_primaryAppleIDCached = 0LL;

    -[CUSystemMonitor invalidate](self->_systemMonitor, "invalidate");
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = 0LL;

    int airdropModeNotifyToken = self->_airdropModeNotifyToken;
    if (airdropModeNotifyToken != -1)
    {
      notify_cancel(airdropModeNotifyToken);
      self->_int airdropModeNotifyToken = -1;
    }

    -[NSXPCListener invalidate](self->_xpcListener, "invalidate");
    xpcListener = self->_xpcListener;
    self->_xpcListener = 0LL;

    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    v7 = self->_xpcConnections;
    id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)i), "xpcCnx", (void)v13));
          [v12 invalidate];
        }

        id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      }

      while (v9);
    }

    -[RPPeopleDaemon _discoveryEnsureStopped](self, "_discoveryEnsureStopped");
    -[RPPeopleDaemon _familyEnsureStopped](self, "_familyEnsureStopped");
    -[RPPeopleDaemon _friendsEnsureStopped](self, "_friendsEnsureStopped");
    -[RPPeopleDaemon _invalidated](self, "_invalidated");
  }

- (void)_invalidated
{
  if (self->_invalidateCalled
    && !self->_invalidateDone
    && !-[NSMutableSet count](self->_xpcConnections, "count")
    && !self->_xpcListener)
  {
    self->_invalidateDone = 1;
    if (dword_100132930 <= 30
      && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
    {
      LogPrintF(&dword_100132930, "-[RPPeopleDaemon _invalidated]", 30LL, "Invalidated\n");
    }
  }

- (void)daemonInfoChanged:(unint64_t)a3
{
  int v3 = a3;
  if ((a3 & 0x10) != 0)
  {
    if (dword_100132930 <= 30
      && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
    {
      LogPrintF( &dword_100132930,  "-[RPPeopleDaemon daemonInfoChanged:]",  30LL,  "Removing family identities on sign out\n");
    }

    -[RPPeopleDaemon _familyEnsureStopped](self, "_familyEnsureStopped");
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](&OBJC_CLASS___RPDaemon, "sharedDaemon"));
    [v5 postDaemonInfoChanges:2];

    if (dword_100132930 <= 30
      && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
    {
      LogPrintF( &dword_100132930,  "-[RPPeopleDaemon daemonInfoChanged:]",  30LL,  "Removing friend identities on sign out\n");
    }

    -[RPPeopleDaemon _friendsEnsureStopped](self, "_friendsEnsureStopped");
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](&OBJC_CLASS___RPDaemon, "sharedDaemon"));
    [v6 postDaemonInfoChanges:128];

    -[RPPeopleDaemon _update](self, "_update");
    if ((v3 & 0x40) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }

  else if ((a3 & 0x40) == 0)
  {
    goto LABEL_3;
  }

  -[RPPeopleDaemon _update](self, "_update");
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 0x80000) == 0) {
      return;
    }
LABEL_21:
    -[RPPeopleDaemon reportIRKMetrics](self, "reportIRKMetrics");
    return;
  }

- (BOOL)diagnosticCommand:(id)a3 params:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v6 rangeOfString:@"FamilyReq" options:9] != (id)0x7FFFFFFFFFFFFFFFLL
    || [v6 rangeOfString:@"FamilyAck" options:9] != (id)0x7FFFFFFFFFFFFFFFLL
    || [v6 rangeOfString:@"FamilyUp" options:9] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    CFTypeID TypeID = CFStringGetTypeID();
    uint64_t TypedValue = CFDictionaryGetTypedValue(v7, @"appleID", TypeID, 0LL);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
    if (!v11) {
      goto LABEL_34;
    }
    if ([v6 rangeOfString:@"FamilyReq" options:9] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if ([v6 rangeOfString:@"FamilyAck" options:9] == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        if ([v6 rangeOfString:@"FamilyUp" options:9] == (id)0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_49:

LABEL_50:
          BOOL v8 = 1;
          goto LABEL_51;
        }

        if (dword_100132930 <= 30
          && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
        {
          LogPrintF( &dword_100132930,  "-[RPPeopleDaemon diagnosticCommand:params:]",  30LL,  "Diag: Family Identity Update: %##@\n",  v7);
        }

        __int128 v14 = self;
        uint64_t v15 = 34LL;
      }

      else
      {
        if (dword_100132930 <= 30
          && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
        {
          LogPrintF( &dword_100132930,  "-[RPPeopleDaemon diagnosticCommand:params:]",  30LL,  "Diag: Family Identity Response: %##@\n",  v7);
        }

        __int128 v14 = self;
        uint64_t v15 = 33LL;
      }
    }

    else
    {
      if (dword_100132930 <= 30
        && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
      {
        LogPrintF( &dword_100132930,  "-[RPPeopleDaemon diagnosticCommand:params:]",  30LL,  "Diag: Family Identity Request: %##@\n",  v7);
      }

      __int128 v14 = self;
      uint64_t v15 = 32LL;
    }

    -[RPPeopleDaemon _sendCloudIdentityFrameType:destinationID:flags:msgCtx:]( v14,  "_sendCloudIdentityFrameType:destinationID:flags:msgCtx:",  v15,  v11,  0LL,  0LL);
    goto LABEL_49;
  }

  if ([v6 rangeOfString:@"FriendReq" options:9] != (id)0x7FFFFFFFFFFFFFFFLL
    || [v6 rangeOfString:@"FriendAck" options:9] != (id)0x7FFFFFFFFFFFFFFFLL
    || [v6 rangeOfString:@"FriendUp" options:9] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    CFTypeID v12 = CFStringGetTypeID();
    uint64_t v13 = CFDictionaryGetTypedValue(v7, @"appleID", v12, 0LL);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if (v11)
    {
      if (CFDictionaryGetInt64(v7, @"nonWaking", 0LL))
      {
        if (dword_100132930 <= 10
          && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 10LL)))
        {
          LogPrintF( &dword_100132930,  "-[RPPeopleDaemon diagnosticCommand:params:]",  10LL,  "Diag: Friend Identity non-waking message\n");
        }

        v17 = objc_opt_new(&OBJC_CLASS___RPCloudMessageContext);
        -[RPCloudMessageContext setNonWakingRequest:](v17, "setNonWakingRequest:", 1LL);
      }

      else
      {
        if (dword_100132930 <= 10
          && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 10LL)))
        {
          LogPrintF( &dword_100132930,  "-[RPPeopleDaemon diagnosticCommand:params:]",  10LL,  "Diag: Friend Identity waking message\n");
        }

        v17 = 0LL;
      }

      if ([v6 rangeOfString:@"FriendReq" options:9] == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        if ([v6 rangeOfString:@"FriendAck" options:9] == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          if ([v6 rangeOfString:@"FriendUp" options:9] == (id)0x7FFFFFFFFFFFFFFFLL)
          {
LABEL_89:

            goto LABEL_49;
          }

          if (dword_100132930 > 30)
          {
            uint64_t v18 = 66LL;
          }

          else
          {
            if (dword_100132930 == -1)
            {
              uint64_t v18 = 66LL;
            }

            else
            {
              uint64_t v18 = 66LL;
            }

            LogPrintF( &dword_100132930,  "-[RPPeopleDaemon diagnosticCommand:params:]",  30LL,  "Diag: Friend Identity Update: %##@\n",  v7);
          }
        }

        else if (dword_100132930 > 30)
        {
          uint64_t v18 = 65LL;
        }

        else
        {
          if (dword_100132930 == -1)
          {
            uint64_t v18 = 65LL;
          }

          else
          {
            uint64_t v18 = 65LL;
          }

          LogPrintF( &dword_100132930,  "-[RPPeopleDaemon diagnosticCommand:params:]",  30LL,  "Diag: Friend Identity Response: %##@\n",  v7);
        }
      }

      else if (dword_100132930 > 30)
      {
        uint64_t v18 = 64LL;
      }

      else
      {
        if (dword_100132930 == -1)
        {
          uint64_t v18 = 64LL;
        }

        else
        {
          uint64_t v18 = 64LL;
        }

        LogPrintF( &dword_100132930,  "-[RPPeopleDaemon diagnosticCommand:params:]",  30LL,  "Diag: Friend Identity Request: %##@\n",  v7);
      }

- (BOOL)addOrUpdateIdentity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 type] != 15)
  {
    uint64_t v54 = 0LL;
    __int128 v55 = &v54;
    uint64_t v56 = 0x3032000000LL;
    id v57 = sub_100083868;
    v58 = sub_100083878;
    id v59 = 0LL;
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472LL;
    v50[2] = sub_100084F98;
    v50[3] = &unk_1001144A8;
    id v52 = &v54;
    id v8 = v6;
    id v51 = v8;
    __int128 v53 = a4;
    id v9 = objc_retainBlock(v50);
    id v49 = v9;
    if (dword_100132930 <= 30
      && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
    {
      LogPrintF(&dword_100132930, "-[RPPeopleDaemon addOrUpdateIdentity:error:]", 30LL, "AddOrUpdateIdentity: %@\n", v8);
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 accountID]);
    v17 = v10;
    if (!v10 || ![v10 length])
    {
      uint64_t v41 = v55;
      id v42 = RPErrorF(4294960540LL, (uint64_t)"No accountID", v11, v12, v13, v14, v15, v16, v48);
      uint64_t v43 = objc_claimAutoreleasedReturnValue(v42);
      BOOL v7 = 0;
      id v24 = (void *)v41[5];
      v41[5] = v43;
      goto LABEL_20;
    }

    id v24 = (void *)objc_claimAutoreleasedReturnValue([v8 idsDeviceID]);
    if (v24)
    {
      if ([v8 type] == 6)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue([v8 contactID]);
        unsigned int v32 = -[RPPeopleDaemon _updateFriendIdentityWithAppleID:contactID:sendersKnownAlias:userAdded:updateDateRequested:suggestedContactIDs:]( self,  "_updateFriendIdentityWithAppleID:contactID:sendersKnownAlias:userAdded:updateDateRequested:suggestedContactIDs:",  v17,  v31,  0LL,  1LL,  1LL,  0LL);
        v33 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        v34 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceIRKData]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", v34, @"_dIRK");

        id v35 = (void *)objc_claimAutoreleasedReturnValue([v8 edPKData]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", v35, @"_edPK");

        id v36 = [v8 featureFlags];
        if (v36) {
          v37 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v8 featureFlags]));
        }
        else {
          v37 = &off_10011B078;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", v37, @"_ff");
        if (v36) {

        }
        if (((-[RPPeopleDaemon _updateIdentityType:idsDeviceID:appleID:contactID:msg:]( self,  "_updateIdentityType:idsDeviceID:appleID:contactID:msg:",  6LL,  v24,  v17,  v31,  v33) | v32) & 0xCA86C) != 0)
        {
          v38 = objc_alloc_init(&OBJC_CLASS___RPCloudMessageContext);
          v39 = (void *)objc_claimAutoreleasedReturnValue([v8 sendersKnownAlias]);
          -[RPCloudMessageContext setSendersKnownAlias:](v38, "setSendersKnownAlias:", v39);

          -[RPPeopleDaemon _sendCloudIdentityFrameType:destinationID:flags:msgCtx:]( self,  "_sendCloudIdentityFrameType:destinationID:flags:msgCtx:",  64LL,  v17,  1LL,  v38);
        }

        BOOL v7 = 1;
        id v9 = v49;
        goto LABEL_19;
      }

      uint64_t v44 = v55;
      id v47 = RPErrorF(4294960540LL, (uint64_t)"Only friend device identity allowed", v25, v26, v27, v28, v29, v30, v48);
      uint64_t v46 = objc_claimAutoreleasedReturnValue(v47);
    }

    else
    {
      uint64_t v44 = v55;
      id v45 = RPErrorF(4294960540LL, (uint64_t)"No IDSDeviceID", v18, v19, v20, v21, v22, v23, v48);
      uint64_t v46 = objc_claimAutoreleasedReturnValue(v45);
    }

    BOOL v7 = 0;
    v31 = (void *)v44[5];
    v44[5] = v46;
LABEL_19:

LABEL_20:
    ((void (*)(void *))v9[2])(v9);

    _Block_object_dispose(&v54, 8);
    goto LABEL_21;
  }

  BOOL v7 = -[RPPeopleDaemon addOrUpdateAdHocPairedIdentity:error:](self, "addOrUpdateAdHocPairedIdentity:error:", v6, a4);
LABEL_21:

  return v7;
}

- (BOOL)addOrUpdateAdHocPairedIdentity:(id)a3 error:(id *)a4
{
  id v4 = a3;
  if (dword_100132930 <= 30 && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL))) {
    LogPrintF( &dword_100132930,  "-[RPPeopleDaemon addOrUpdateAdHocPairedIdentity:error:]",  30LL,  "AddOrUpdateAdHocPairedIdentity: %@\n",  v4);
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
  [v5 addOrUpdateAdHocPairedIdentity:v4];

  return 1;
}

- (void)prefsChanged
{
  unsigned int DeviceClass = GestaltGetDeviceClass(self, a2);
  uint64_t Int64 = CFPrefs_GetInt64(@"com.apple.rapport", @"familyIdentityPruneSecs", &v69);
  if (v69) {
    int64_t v5 = 600LL;
  }
  else {
    int64_t v5 = Int64;
  }
  int64_t prefFamilyIdentityPruneSeconds = self->_prefFamilyIdentityPruneSeconds;
  if (v5 == prefFamilyIdentityPruneSeconds) {
    goto LABEL_10;
  }
  if (dword_100132930 <= 30)
  {
    if (dword_100132930 == -1)
    {
      int64_t prefFamilyIdentityPruneSeconds = self->_prefFamilyIdentityPruneSeconds;
    }

    LogPrintF( &dword_100132930,  "-[RPPeopleDaemon prefsChanged]",  30LL,  "FamilyIdentityPruneSeconds: %lld -> %lld\n",  prefFamilyIdentityPruneSeconds,  v5);
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
  if (-[NSMutableSet count](self->_discoveryClients, "count")) {
    -[RPPeopleDaemon _discoveryEnsureStarted](self, "_discoveryEnsureStarted");
  }
  else {
    -[RPPeopleDaemon _discoveryEnsureStopped](self, "_discoveryEnsureStopped");
  }
  if (self->_prefPeopleDiscoveryFamily
    && (int v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPPeopleDaemon _primaryAppleID:](self, "_primaryAppleID:", 0LL)),
        v3,
        v3))
  {
    -[RPPeopleDaemon _familyEnsureStarted](self, "_familyEnsureStarted");
  }

  else
  {
    -[RPPeopleDaemon _familyEnsureStopped](self, "_familyEnsureStopped");
  }

  if (self->_prefPeopleDiscoveryFriends) {
    -[RPPeopleDaemon _friendsEnsureStarted](self, "_friendsEnsureStarted");
  }
  else {
    -[RPPeopleDaemon _friendsEnsureStopped](self, "_friendsEnsureStopped");
  }
}

- (id)_primaryAppleID:(BOOL)a3
{
  BOOL v3 = a3;
  p_primaryAppleIDCached = &self->_primaryAppleIDCached;
  id v6 = self->_primaryAppleIDCached;
  uint64_t v7 = v6;
  if (v3 || !v6)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[CUSystemMonitor primaryAppleID](self->_systemMonitor, "primaryAppleID"));
    if (v9)
    {
      int64_t v10 = (void *)v9;
      uint64_t v11 = CUNormalizeEmailAddress(v9, 1LL);
      int64_t v8 = (NSString *)objc_claimAutoreleasedReturnValue(v11);
    }

    else
    {
      int64_t v8 = 0LL;
    }

    objc_storeStrong((id *)p_primaryAppleIDCached, v8);
    if (dword_100132930 <= 30
      && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
    {
      LogPrintF(&dword_100132930, "-[RPPeopleDaemon _primaryAppleID:]", 30LL, "PrimaryAppleID updated: %{mask}\n", v8);
    }

    if (v3) {
      -[RPPeopleDaemon _update](self, "_update");
    }
  }

  else
  {
    int64_t v8 = v6;
  }

  return v8;
}

- (void)_regenerateSelfIdentity:(id)a3
{
  id v5 = a3;
  *(int32x2_t *)&self->_irkMetrics.selfIdentRolled = vadd_s32( *(int32x2_t *)&self->_irkMetrics.selfIdentRolled,  (int32x2_t)0x100000001LL);
  if (dword_100132930 <= 30 && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL))) {
    LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _regenerateSelfIdentity:]",  30LL,  "Re-generate SelfIdentity: %@\n",  v5);
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
  [v4 regenerateSelfIdentity:v5];

  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( self->_familyAccountIdentityMap,  "enumerateKeysAndObjectsUsingBlock:",  &stru_1001144C8);
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( self->_friendAccountIdentityMap,  "enumerateKeysAndObjectsUsingBlock:",  &stru_1001144E8);
  -[RPPeopleDaemon _update](self, "_update");
}

- (void)_discoveryEnsureStarted
{
  deviceDiscovery = self->_deviceDiscovery;
  if (!deviceDiscovery)
  {
    unsigned int deviceDiscoveryID = self->_deviceDiscoveryID;
    if (dword_100132930 <= 30
      && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
    {
      LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _discoveryEnsureStarted]",  30LL,  "Device discovery start ID %u\n",  deviceDiscoveryID);
    }

    id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    discoveredDevices = self->_discoveredDevices;
    self->_discoveredDevices = v5;

    uint64_t v7 = (SFDeviceDiscovery *)objc_alloc_init(off_1001329A0());
    int64_t v8 = self->_deviceDiscovery;
    self->_deviceDiscovery = v7;

    -[SFDeviceDiscovery setChangeFlags:](self->_deviceDiscovery, "setChangeFlags:", 11LL);
    -[SFDeviceDiscovery setDispatchQueue:](self->_deviceDiscovery, "setDispatchQueue:", self->_dispatchQueue);
    -[SFDeviceDiscovery setPurpose:](self->_deviceDiscovery, "setPurpose:", @"RPPeople");
    -[SFDeviceDiscovery setScanRate:](self->_deviceDiscovery, "setScanRate:", 20LL);
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472LL;
    v47[2] = sub_100086528;
    v47[3] = &unk_100111828;
    v47[4] = self;
    unsigned int v48 = deviceDiscoveryID;
    -[SFDeviceDiscovery setDeviceFoundHandler:](self->_deviceDiscovery, "setDeviceFoundHandler:", v47);
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_10008654C;
    v45[3] = &unk_100111828;
    v45[4] = self;
    unsigned int v46 = deviceDiscoveryID;
    -[SFDeviceDiscovery setDeviceLostHandler:](self->_deviceDiscovery, "setDeviceLostHandler:", v45);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_100086570;
    v43[3] = &unk_100111850;
    v43[4] = self;
    unsigned int v44 = deviceDiscoveryID;
    -[SFDeviceDiscovery setDeviceChangedHandler:](self->_deviceDiscovery, "setDeviceChangedHandler:", v43);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_100086598;
    v41[3] = &unk_100111878;
    v41[4] = self;
    unsigned int v42 = deviceDiscoveryID;
    -[SFDeviceDiscovery setInterruptionHandler:](self->_deviceDiscovery, "setInterruptionHandler:", v41);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_10008662C;
    v39[3] = &unk_100114508;
    unsigned int v40 = deviceDiscoveryID;
    -[SFDeviceDiscovery setInvalidationHandler:](self->_deviceDiscovery, "setInvalidationHandler:", v39);
  }

  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  uint64_t v9 = self->_discoveryClients;
  id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v35,  v50,  16LL);
  if (v10)
  {
    id v11 = v10;
    unsigned int v12 = 0;
    uint64_t v13 = *(void *)v36;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(v9);
        }
        v12 |= [*(id *)(*((void *)&v35 + 1) + 8 * (void)i) discoveryFlags];
      }

      id v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v35,  v50,  16LL);
    }

    while (v11);

    self->_discoveryFlagsAggregate = v12;
    if ((v12 & 0x5FE) == 2)
    {
      uint64_t v15 = 1048577LL;
      goto LABEL_23;
    }
  }

  else
  {

    LOWORD(v12) = 0;
    self->_discoveryFlagsAggregate = 0;
  }

  if ((v12 & 0x5F8) != 0 || (v12 & 6) == 0) {
    uint64_t v15 = 1LL;
  }
  else {
    uint64_t v15 = 33LL;
  }
LABEL_23:
  id v17 = -[SFDeviceDiscovery discoveryFlags](self->_deviceDiscovery, "discoveryFlags");
  if ((id)v15 != v17)
  {
    if (deviceDiscovery)
    {
      if (dword_100132930 <= 30)
      {
        id v18 = v17;
        if (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)) {
          LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _discoveryEnsureStarted]",  30LL,  "Device discovery update flags %#{flags} -> %#{flags}\n",  v18,  &unk_10010ACCE,  v15,  &unk_10010ACCE);
        }
      }
    }

    -[SFDeviceDiscovery setDiscoveryFlags:](self->_deviceDiscovery, "setDiscoveryFlags:", v15);
  }

  int prefTrackWhileAsleepState = self->_prefTrackWhileAsleepState;
  BOOL v20 = prefTrackWhileAsleepState == 6;
  if (!prefTrackWhileAsleepState)
  {
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    uint64_t v21 = self->_discoveryClients;
    id v22 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v31,  v49,  16LL);
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v32;
      while (2)
      {
        for (j = 0LL; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v32 != v24) {
            objc_enumerationMutation(v21);
          }
          if ([*(id *)(*((void *)&v31 + 1) + 8 * (void)j) discoveryFlags])
          {
            BOOL v20 = 1LL;
            goto LABEL_41;
          }
        }

        id v23 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v31,  v49,  16LL);
        if (v23) {
          continue;
        }
        break;
      }
    }

- (void)_discoveryEnsureStopped
{
  if (self->_deviceDiscovery)
  {
    if (dword_100132930 <= 30
      && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
    {
      LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _discoveryEnsureStopped]",  30LL,  "Device discovery stop ID %u\n",  self->_deviceDiscoveryID);
    }

    -[SFDeviceDiscovery invalidate](self->_deviceDiscovery, "invalidate");
    deviceDiscovery = self->_deviceDiscovery;
    self->_deviceDiscovery = 0LL;

    ++self->_deviceDiscoveryID;
    discoveredDevices = self->_discoveredDevices;
    self->_discoveredDevices = 0LL;

    self->_discoveryFlagsAggregate = 0;
  }

- (void)_daemonDeviceFound:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);

  if (v6)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___RPDevice);
    [v7 setIdentifier:v6];
    [v7 updateWithSFDevice:v4 changes:0xFFFFFFFFLL];
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_discoveredDevices,  "setObject:forKeyedSubscript:",  v7,  v6);
    if (dword_100132930 <= 20
      && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 20LL)))
    {
      LogPrintF(&dword_100132930, "-[RPPeopleDaemon _daemonDeviceFound:]", 20LL, "Device found: %@\n", v7);
    }

    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    int64_t v8 = self->_xpcConnections;
    id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * (void)i) clientDeviceFound:v7 report:1];
        }

        id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      }

      while (v10);
    }
  }
}

- (void)_daemonDeviceLost:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 identifier]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_discoveredDevices,  "objectForKeyedSubscript:",  v5));
    if (v6)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_discoveredDevices,  "setObject:forKeyedSubscript:",  0LL,  v5);
      if (dword_100132930 <= 20
        && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 20LL)))
      {
        LogPrintF(&dword_100132930, "-[RPPeopleDaemon _daemonDeviceLost:]", 20LL, "Device lost: %@\n", v6);
      }

      __int128 v14 = 0u;
      __int128 v15 = 0u;
      __int128 v12 = 0u;
      __int128 v13 = 0u;
      id v7 = self->_xpcConnections;
      id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v13;
        do
        {
          for (i = 0LL; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v13 != v10) {
              objc_enumerationMutation(v7);
            }
            [*(id *)(*((void *)&v12 + 1) + 8 * (void)i) clientDeviceLost:v6];
          }

          id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
        }

        while (v9);
      }
    }
  }
}

- (void)_daemonDeviceChanged:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_discoveredDevices,  "objectForKeyedSubscript:",  v8));
    uint64_t v10 = v9;
    if (v9)
    {
      id v11 = [v9 updateWithSFDevice:v6 changes:v4];
      else {
        uint64_t v12 = 20LL;
      }
      if ((int)v12 >= dword_100132930
        && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, v12)))
      {
        LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _daemonDeviceChanged:changes:]",  v12,  "Device changed: %@, %#{flags}\n",  v10,  v11,  &unk_10010ADEA);
      }

      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      __int128 v13 = self->_xpcConnections;
      id v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v19;
        do
        {
          for (i = 0LL; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v19 != v16) {
              objc_enumerationMutation(v13);
            }
            [*(id *)(*((void *)&v18 + 1) + 8 * (void)i) clientDeviceChanged:v10 changes:v11];
          }

          id v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
        }

        while (v15);
      }
    }

    else
    {
      -[RPPeopleDaemon _daemonDeviceFound:](self, "_daemonDeviceFound:", v6);
    }
  }
}

- (void)_familyEnsureStarted
{
  if (!self->_familyMemberMonitor)
  {
    if (dword_100132930 <= 30
      && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
    {
      LogPrintF(&dword_100132930, "-[RPPeopleDaemon _familyEnsureStarted]", 30LL, "People discovery family start\n");
    }

    BOOL v3 = objc_alloc_init(&OBJC_CLASS___CUSystemMonitor);
    familyMemberMonitor = self->_familyMemberMonitor;
    self->_familyMemberMonitor = v3;

    -[CUSystemMonitor setDispatchQueue:](self->_familyMemberMonitor, "setDispatchQueue:", self->_dispatchQueue);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100086F60;
    v13[3] = &unk_1001110A8;
    v13[4] = self;
    -[CUSystemMonitor setFamilyUpdatedHandler:](self->_familyMemberMonitor, "setFamilyUpdatedHandler:", v13);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100086FA0;
    v12[3] = &unk_1001110A8;
    v12[4] = self;
    -[CUSystemMonitor setFirstUnlockHandler:](self->_familyMemberMonitor, "setFirstUnlockHandler:", v12);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100086FA8;
    v11[3] = &unk_1001110A8;
    v11[4] = self;
    -[CUSystemMonitor setSystemNameChangedHandler:](self->_familyMemberMonitor, "setSystemNameChangedHandler:", v11);
    id v5 = self->_familyMemberMonitor;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100086FB0;
    v10[3] = &unk_1001110A8;
    v10[4] = self;
    -[CUSystemMonitor activateWithCompletion:](v5, "activateWithCompletion:", v10);
  }

  if (!self->_familySyncCheckTimer)
  {
    id v6 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    familySyncCheckTimer = self->_familySyncCheckTimer;
    self->_familySyncCheckTimer = v6;

    id v8 = self->_familySyncCheckTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100086FB8;
    handler[3] = &unk_1001110A8;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v8, handler);
    CUDispatchTimerSet(self->_familySyncCheckTimer, 18000.0, 18000.0, -4.0);
    dispatch_activate((dispatch_object_t)self->_familySyncCheckTimer);
  }

  -[RPPeopleDaemon _updateFamilyIdentities](self, "_updateFamilyIdentities");
}

- (void)_familyEnsureStopped
{
  bufferedCloudMessages = self->_bufferedCloudMessages;
  self->_bufferedCloudMessages = 0LL;

  if (self->_familyMemberMonitor)
  {
    if (dword_100132930 <= 30
      && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
    {
      LogPrintF(&dword_100132930, "-[RPPeopleDaemon _familyEnsureStopped]", 30LL, "People discovery family stop\n");
    }

    -[CUSystemMonitor invalidate](self->_familyMemberMonitor, "invalidate");
    familyMemberMonitor = self->_familyMemberMonitor;
    self->_familyMemberMonitor = 0LL;
  }

  int familyNotifyToken = self->_familyNotifyToken;
  if (familyNotifyToken != -1)
  {
    notify_cancel(familyNotifyToken);
    self->_int familyNotifyToken = -1;
  }

  -[NSMutableDictionary removeAllObjects](self->_familyAccountIdentityMap, "removeAllObjects");
  familyAccountIdentityMap = self->_familyAccountIdentityMap;
  self->_familyAccountIdentityMap = 0LL;

  -[NSMutableDictionary removeAllObjects](self->_familyDeviceIdentityMap, "removeAllObjects");
  familyDeviceIdentityMap = self->_familyDeviceIdentityMap;
  self->_familyDeviceIdentityMap = 0LL;

  self->_familyFlags = 0LL;
  familySyncCheckTimer = self->_familySyncCheckTimer;
  if (familySyncCheckTimer)
  {
    uint64_t v10 = familySyncCheckTimer;
    dispatch_source_cancel(v10);
    id v9 = self->_familySyncCheckTimer;
    self->_familySyncCheckTimer = 0LL;
  }

- (id)getFamilyDeviceIdentities
{
  return -[NSMutableDictionary allValues](self->_familyDeviceIdentityMap, "allValues");
}

- (id)getFamilyURIs
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CUSystemMonitor familyMembers](self->_familyMemberMonitor, "familyMembers"));
  BOOL v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_msgSend(v9, "isMe", (void)v13) & 1) == 0)
        {
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 appleID]);

          if (v10)
          {
            id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 appleID]);
            -[NSMutableArray addObject:](v3, "addObject:", v11);
          }
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v6);
  }

  return v3;
}

- (void)_updateFamilyIdentities
{
  if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
  {
    unsigned int v3 = -[RPPeopleDaemon _updateFamilyAccounts](self, "_updateFamilyAccounts");
    unsigned int v4 = -[RPPeopleDaemon _updateFamilyDevices](self, "_updateFamilyDevices") + v3;
    int v5 = -[RPPeopleDaemon _pruneFamilyDevices](self, "_pruneFamilyDevices") << 31 >> 31;
    -[RPPeopleDaemon _processBufferedCloudMessages](self, "_processBufferedCloudMessages");
    -[RPPeopleDaemon _updateFamilySyncing](self, "_updateFamilySyncing");
    if (v4 != v5)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](&OBJC_CLASS___RPDaemon, "sharedDaemon"));
      [v6 postDaemonInfoChanges:2];
    }

    -[RPPeopleDaemon _updateFamilyNotification](self, "_updateFamilyNotification");
  }

  else if (dword_100132930 <= 30 {
         && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
  }
  {
    LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _updateFamilyIdentities]",  30LL,  "Deferring family account identities update until FirstUnlock\n");
  }

- (BOOL)_updateFamilyAccounts
{
  BOOL v25 = (void *)objc_claimAutoreleasedReturnValue(-[CUSystemMonitor familyMembers](self->_familyMemberMonitor, "familyMembers"));
  if (v25
    || (unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_familyAccountIdentityMap, "allKeys")),
        id v4 = [v3 count],
        v3,
        v4))
  {
    uint64_t v36 = 0LL;
    __int128 v37 = &v36;
    uint64_t v38 = 0x2020000000LL;
    char v39 = 0;
    familyAccountIdentityMap = self->_familyAccountIdentityMap;
    if (!familyAccountIdentityMap)
    {
      id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      uint64_t v7 = self->_familyAccountIdentityMap;
      self->_familyAccountIdentityMap = v6;

      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
      id v35 = 0LL;
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identitiesOfType:3 error:&v35]);
      id v24 = v35;

      if (!v9
        && dword_100132930 <= 90
        && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 90LL)))
      {
        LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _updateFamilyAccounts]",  90LL,  "### Load family account identities failed: %{error}\n",  v24);
      }

      __int128 v33 = 0u;
      __int128 v34 = 0u;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      id v11 = v9;
      id v12 = [v11 countByEnumeratingWithState:&v31 objects:v41 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v32;
        do
        {
          for (i = 0LL; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v32 != v13) {
              objc_enumerationMutation(v11);
            }
            __int128 v15 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
            __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
            if (v16)
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_familyAccountIdentityMap,  "setObject:forKeyedSubscript:",  v15,  v16);
              if (dword_100132930 <= 30
                && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
              {
                LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _updateFamilyAccounts]",  30LL,  "Loaded family account identity: %@\n",  v15);
              }

              *((_BYTE *)v37 + 24) = 1;
            }
          }

          id v12 = [v11 countByEnumeratingWithState:&v31 objects:v41 count:16];
        }

        while (v12);
      }

      familyAccountIdentityMap = self->_familyAccountIdentityMap;
    }

    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( familyAccountIdentityMap,  "enumerateKeysAndObjectsUsingBlock:",  &stru_100114548);
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v17 = v25;
    id v18 = [v17 countByEnumeratingWithState:&v27 objects:v40 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v28;
      do
      {
        for (j = 0LL; j != v18; j = (char *)j + 1)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v17);
          }
          __int128 v21 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)j);
          if (([v21 isMe] & 1) == 0
            && -[RPPeopleDaemon _updateFamilyIdentityWithFamilyMember:]( self,  "_updateFamilyIdentityWithFamilyMember:",  v21))
          {
            *((_BYTE *)v37 + 24) = 1;
          }
        }

        id v18 = [v17 countByEnumeratingWithState:&v27 objects:v40 count:16];
      }

      while (v18);
    }

    id v22 = self->_familyAccountIdentityMap;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_1000877C4;
    v26[3] = &unk_100114570;
    v26[4] = &v36;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v22, "enumerateKeysAndObjectsUsingBlock:", v26);
    BOOL v10 = *((_BYTE *)v37 + 24) != 0;
    _Block_object_dispose(&v36, 8);
  }

  else
  {
    if (dword_100132930 <= 30
      && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
    {
      LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _updateFamilyAccounts]",  30LL,  "Deferring family account identities update until family members list is ready\n");
    }

    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)_updateFamilyIdentityWithFamilyMember:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 appleID]);
  id v6 = (void *)v5;
  if (v5)
  {
    uint64_t v7 = CUNormalizeEmailAddress(v5, 1LL);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v9 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_familyAccountIdentityMap,  "objectForKeyedSubscript:",  v8));
    LODWORD(v10) = v9 == 0;
    id v11 = (RPIdentity *)v9;
    if (!v9) {
      id v11 = objc_alloc_init(&OBJC_CLASS___RPIdentity);
    }
    -[RPIdentity setPresent:](v11, "setPresent:", 1LL);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentity dateAdded](v11, "dateAdded"));

    if (!v12)
    {
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      -[RPIdentity setDateAdded:](v11, "setDateAdded:", v10);

      LODWORD(v10) = 1;
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentity dateRemoved](v11, "dateRemoved"));

    if (v13)
    {
      -[RPIdentity setDateRemoved:](v11, "setDateRemoved:", 0LL);
      LODWORD(v10) = 1;
    }

    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentity identifier](v11, "identifier"));
    unsigned __int8 v15 = [v14 isEqual:v8];

    if ((v15 & 1) == 0)
    {
      -[RPIdentity setIdentifier:](v11, "setIdentifier:", v8);
      LODWORD(v10) = 1;
    }

    if (-[RPIdentity type](v11, "type") == 3)
    {
      if (v9)
      {
        if (!(_DWORD)v10)
        {
          if (dword_100132930 <= 10
            && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 10LL)))
          {
            LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _updateFamilyIdentityWithFamilyMember:]",  10LL,  "Unchanged family account identity: %@\n",  v11);
          }

          LOBYTE(v10) = 0;
LABEL_37:

          goto LABEL_38;
        }

- (BOOL)_updateFamilyDevices
{
  if (self->_familyDeviceIdentityMap) {
    return 0;
  }
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  familyDeviceIdentityMap = self->_familyDeviceIdentityMap;
  self->_familyDeviceIdentityMap = v4;

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
  id v22 = 0LL;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 loadFamilyDeviceIdentitiesWithError:&v22]);
  id v8 = v22;

  if (!v7
    && dword_100132930 <= 90
    && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 90LL)))
  {
    LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _updateFamilyDevices]",  90LL,  "### Load family device identities failed: %{error}\n",  v8);
  }

  id v17 = v8;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    BOOL v2 = 0;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        __int128 v14 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
        if (v15)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_familyDeviceIdentityMap,  "setObject:forKeyedSubscript:",  v14,  v15);
          if (dword_100132930 <= 30
            && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
          {
            LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _updateFamilyDevices]",  30LL,  "Loaded family device identity: %@\n",  v14,  v17,  (void)v18);
          }

          BOOL v2 = 1;
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }

    while (v11);
  }

  else
  {
    BOOL v2 = 0;
  }

  return v2;
}

- (BOOL)_pruneFamilyDevices
{
  int64_t prefFamilyIdentityPruneSeconds = self->_prefFamilyIdentityPruneSeconds;
  if (prefFamilyIdentityPruneSeconds <= 0)
  {
    if (dword_100132930 <= 10
      && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 10LL)))
    {
      LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _pruneFamilyDevices]",  10LL,  "Skipping prune friend accounts: invalid prune seconds %lld\n",  prefFamilyIdentityPruneSeconds);
    }

    return 0;
  }

  else
  {
    double Current = CFAbsoluteTimeGetCurrent();
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_familyAccountIdentityMap, "allKeys"));
    id v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v5)
    {
      id v6 = v5;
      BOOL v20 = 0;
      uint64_t v7 = *(void *)v24;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v24 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)i);
          id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_familyAccountIdentityMap,  "objectForKeyedSubscript:",  v9));
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 dateRemoved]);
          uint64_t v12 = v11;
          if (v11)
          {
            [v11 timeIntervalSinceReferenceDate];
            uint64_t v14 = (uint64_t)(Current - v13);
            if (prefFamilyIdentityPruneSeconds <= v14)
            {
              if (dword_100132930 <= 30
                && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
              {
                LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _pruneFamilyDevices]",  30LL,  "Prune family account identity: %ll{dur}, %@\n",  v14,  v10);
              }

              -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_familyAccountIdentityMap,  "setObject:forKeyedSubscript:",  0LL,  v9);
              unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue( +[RPIdentityDaemon sharedIdentityDaemon]( &OBJC_CLASS___RPIdentityDaemon,  "sharedIdentityDaemon"));
              [v15 removeIdentity:v10 error:0];

              familyDeviceIdentityMap = self->_familyDeviceIdentityMap;
              v22[0] = _NSConcreteStackBlock;
              v22[1] = 3221225472LL;
              v22[2] = sub_1000881B8;
              v22[3] = &unk_100114598;
              v22[4] = v9;
              v22[5] = v10;
              v22[6] = self;
              -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( familyDeviceIdentityMap,  "enumerateKeysAndObjectsUsingBlock:",  v22);
              BOOL v20 = 1;
            }

            else if (dword_100132930 <= 9 {
                   && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 9LL)))
            }
            {
              LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _pruneFamilyDevices]",  9LL,  "Skipping prune family account identity: premature, %ll{dur}, %@\n",  v14,  v10);
            }
          }

          else if (dword_100132930 <= 8 {
                 && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 8LL)))
          }
          {
            LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _pruneFamilyDevices]",  8LL,  "Skipping prune family account identity: active, %@\n",  v10,  v19);
          }
        }

        id v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }

      while (v6);
    }

    else
    {
      BOOL v20 = 0;
    }

    return v20;
  }

- (void)_updateFamilySyncing
{
  uint64_t v40 = 0LL;
  BOOL v41 = &v40;
  uint64_t v42 = 0x2020000000LL;
  int v43 = 10;
  uint64_t v36 = 0LL;
  __int128 v37 = &v36;
  uint64_t v38 = 0x2020000000LL;
  int v39 = 0;
  uint64_t v32 = 0LL;
  __int128 v33 = &v32;
  uint64_t v34 = 0x2020000000LL;
  int v35 = 0;
  uint64_t v28 = 0LL;
  __int128 v29 = &v28;
  uint64_t v30 = 0x2020000000LL;
  int v31 = 0;
  uint64_t v24 = 0LL;
  __int128 v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  int v27 = 0;
  uint64_t v20 = 0LL;
  __int128 v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  int v23 = 0;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  int v19 = 0;
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[CUSystemMonitor systemName](self->_familyMemberMonitor, "systemName"));
  if (v3)
  {
    CFTypeID TypeID = CFStringGetTypeID();
    id v5 = (void *)CFPrefs_CopyTypedValue(@"com.apple.rapport", @"familySyncedName", TypeID, 0LL);
    id v6 = v5;
    BOOL v7 = v5 != 0LL;
    else {
      CFPrefs_SetValue(@"com.apple.rapport", @"familySyncedName", v3);
    }
  }

  else
  {
    BOOL v7 = 0;
  }

  familyAccountIdentityMap = self->_familyAccountIdentityMap;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000885D8;
  v14[3] = &unk_1001145C0;
  v14[6] = &v36;
  v14[7] = &v32;
  BOOL v15 = v7;
  v14[8] = &v28;
  v14[9] = &v24;
  v14[4] = v3;
  v14[5] = self;
  v14[10] = &v40;
  v14[11] = &v16;
  v14[12] = &v20;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( familyAccountIdentityMap,  "enumerateKeysAndObjectsUsingBlock:",  v14);
  int maxNumFamilyDevices = self->_irkMetrics.maxNumFamilyDevices;
  signed int v10 = -[NSMutableDictionary count](self->_familyDeviceIdentityMap, "count");
  if (maxNumFamilyDevices <= v10) {
    int v11 = v10;
  }
  else {
    int v11 = maxNumFamilyDevices;
  }
  self->_irkMetrics.int maxNumFamilyDevices = v11;
  self->_sendIRKMetricsReport = 1;
  uint64_t v12 = *((unsigned int *)v41 + 6);
  if (dword_100132930 <= v12)
  {
    if (dword_100132930 == -1)
    {
      uint64_t v12 = *((unsigned int *)v41 + 6);
    }

    unsigned int v13 = -[NSMutableDictionary count](self->_familyAccountIdentityMap, "count");
    LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _updateFamilySyncing]",  v12,  "Updated family account syncing: Total %d, Removed %d, Refresh %d, Retry %d, Later %d, Request %d, Failed %d\n",  v13,  *((_DWORD *)v37 + 6),  *((_DWORD *)v33 + 6),  *((_DWORD *)v29 + 6),  *((_DWORD *)v25 + 6),  *((_DWORD *)v21 + 6),  *((_DWORD *)v17 + 6));
  }

- (void)receivedFamilyIdentityRequest:(id)a3 msgCtx:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 appleID]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 fromID]);
  if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
  {
    uint64_t v9 = self->_familyAccountIdentityMap;
    signed int v10 = v9;
    if (v9)
    {
      int v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v7));

      if (v11)
      {
        CFTypeID TypeID = CFStringGetTypeID();
        uint64_t TypedValue = CFDictionaryGetTypedValue(v15, @"_idsID", TypeID, 0LL);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
        if (v14)
        {
          if (dword_100132930 <= 30
            && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
          {
            LogPrintF( &dword_100132930,  "-[RPPeopleDaemon receivedFamilyIdentityRequest:msgCtx:]",  30LL,  "Received family identity request: from '%{mask}', IDS '%.8@'\n",  v7,  v14);
          }

          -[RPPeopleDaemon _updateIdentityType:idsDeviceID:appleID:contactID:msg:]( self,  "_updateIdentityType:idsDeviceID:appleID:contactID:msg:",  4LL,  v14,  v7,  0LL,  v15);
          -[RPPeopleDaemon _sendCloudIdentityFrameType:destinationID:flags:msgCtx:]( self,  "_sendCloudIdentityFrameType:destinationID:flags:msgCtx:",  33LL,  v8,  0LL,  v6);
        }

        else if (dword_100132930 <= 60 {
               && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 60LL)))
        }
        {
          LogPrintF( &dword_100132930,  "-[RPPeopleDaemon receivedFamilyIdentityRequest:msgCtx:]",  60LL,  "### Ignoring family identity request with no IDS device ID\n");
        }
      }

      else if (dword_100132930 <= 60 {
             && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 60LL)))
      }
      {
        LogPrintF( &dword_100132930,  "-[RPPeopleDaemon receivedFamilyIdentityRequest:msgCtx:]",  60LL,  "### Ignoring family identity request from unknown peer: '%{mask}'\n",  v7);
      }
    }

    else
    {
      if (dword_100132930 <= 30
        && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
      {
        LogPrintF( &dword_100132930,  "-[RPPeopleDaemon receivedFamilyIdentityRequest:msgCtx:]",  30LL,  "Buffering family identity request before ready: '%{mask}'\n",  v7);
      }

      -[RPPeopleDaemon _bufferCloudMessage:frameType:msgCtx:]( self,  "_bufferCloudMessage:frameType:msgCtx:",  v15,  32LL,  v6);
    }
  }

  else
  {
    if (dword_100132930 <= 30
      && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
    {
      LogPrintF( &dword_100132930,  "-[RPPeopleDaemon receivedFamilyIdentityRequest:msgCtx:]",  30LL,  "Buffering family identity request before FirstUnlock: '%{mask}'\n",  v7);
    }

    -[RPPeopleDaemon _bufferCloudMessage:frameType:msgCtx:]( self,  "_bufferCloudMessage:frameType:msgCtx:",  v15,  32LL,  v6);
  }
}

- (void)receivedFamilyIdentityResponse:(id)a3 msgCtx:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 appleID]);
  if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
  {
    id v8 = self->_familyAccountIdentityMap;
    uint64_t v9 = v8;
    if (v8)
    {
      signed int v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v7));
      if (v10)
      {
        CFTypeID TypeID = CFStringGetTypeID();
        uint64_t TypedValue = CFDictionaryGetTypedValue(v16, @"_idsID", TypeID, 0LL);
        unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
        if (v13)
        {
          if (dword_100132930 <= 30
            && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
          {
            LogPrintF( &dword_100132930,  "-[RPPeopleDaemon receivedFamilyIdentityResponse:msgCtx:]",  30LL,  "Received family identity response: from '%{mask}', IDS '%.8@'\n",  v7,  v13);
          }

          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          [v10 setDateAcknowledged:v14];

          id v15 = (void *)objc_claimAutoreleasedReturnValue( +[RPIdentityDaemon sharedIdentityDaemon]( &OBJC_CLASS___RPIdentityDaemon,  "sharedIdentityDaemon"));
          [v15 saveIdentity:v10 error:0];

          -[RPPeopleDaemon _updateIdentityType:idsDeviceID:appleID:contactID:msg:]( self,  "_updateIdentityType:idsDeviceID:appleID:contactID:msg:",  4LL,  v13,  v7,  0LL,  v16);
        }

        else if (dword_100132930 <= 60 {
               && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 60LL)))
        }
        {
          LogPrintF( &dword_100132930,  "-[RPPeopleDaemon receivedFamilyIdentityResponse:msgCtx:]",  60LL,  "### Ignoring family identity response with no IDS device ID\n");
        }
      }

      else if (dword_100132930 <= 60 {
             && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 60LL)))
      }
      {
        LogPrintF( &dword_100132930,  "-[RPPeopleDaemon receivedFamilyIdentityResponse:msgCtx:]",  60LL,  "### Ignoring family identity response from unknown peer: '%{mask}'\n",  v7);
      }
    }

    else
    {
      if (dword_100132930 <= 30
        && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
      {
        LogPrintF( &dword_100132930,  "-[RPPeopleDaemon receivedFamilyIdentityResponse:msgCtx:]",  30LL,  "Buffering family identity response before ready: '%{mask}'\n",  v7);
      }

      -[RPPeopleDaemon _bufferCloudMessage:frameType:msgCtx:]( self,  "_bufferCloudMessage:frameType:msgCtx:",  v16,  33LL,  v6);
    }
  }

  else
  {
    if (dword_100132930 <= 30
      && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
    {
      LogPrintF( &dword_100132930,  "-[RPPeopleDaemon receivedFamilyIdentityResponse:msgCtx:]",  30LL,  "Buffering family identity response before FirstUnlock: '%{mask}'\n",  v7);
    }

    -[RPPeopleDaemon _bufferCloudMessage:frameType:msgCtx:]( self,  "_bufferCloudMessage:frameType:msgCtx:",  v16,  33LL,  v6);
  }
}

- (void)receivedFamilyIdentityUpdate:(id)a3 msgCtx:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 appleID]);
  if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
  {
    id v8 = self->_familyAccountIdentityMap;
    uint64_t v9 = v8;
    if (v8)
    {
      signed int v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v7));

      if (v10)
      {
        CFTypeID TypeID = CFStringGetTypeID();
        uint64_t TypedValue = CFDictionaryGetTypedValue(v14, @"_idsID", TypeID, 0LL);
        unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
        if (v13)
        {
          if (dword_100132930 <= 30
            && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
          {
            LogPrintF( &dword_100132930,  "-[RPPeopleDaemon receivedFamilyIdentityUpdate:msgCtx:]",  30LL,  "Received family identity update: from '%{mask}', IDS '%.8@'\n",  v7,  v13);
          }

          -[RPPeopleDaemon _updateIdentityType:idsDeviceID:appleID:contactID:msg:]( self,  "_updateIdentityType:idsDeviceID:appleID:contactID:msg:",  4LL,  v13,  v7,  0LL,  v14);
        }

        else if (dword_100132930 <= 60 {
               && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 60LL)))
        }
        {
          LogPrintF( &dword_100132930,  "-[RPPeopleDaemon receivedFamilyIdentityUpdate:msgCtx:]",  60LL,  "### Ignoring family identity update with no IDS device ID\n");
        }
      }

      else if (dword_100132930 <= 60 {
             && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 60LL)))
      }
      {
        LogPrintF( &dword_100132930,  "-[RPPeopleDaemon receivedFamilyIdentityUpdate:msgCtx:]",  60LL,  "### Ignoring family identity update from unknown peer: '%{mask}'\n",  v7);
      }
    }

    else
    {
      if (dword_100132930 <= 30
        && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
      {
        LogPrintF( &dword_100132930,  "-[RPPeopleDaemon receivedFamilyIdentityUpdate:msgCtx:]",  30LL,  "Buffering family identity update before ready: '%{mask}'\n",  v7);
      }

      -[RPPeopleDaemon _bufferCloudMessage:frameType:msgCtx:]( self,  "_bufferCloudMessage:frameType:msgCtx:",  v14,  34LL,  v6);
    }
  }

  else
  {
    if (dword_100132930 <= 30
      && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
    {
      LogPrintF( &dword_100132930,  "-[RPPeopleDaemon receivedFamilyIdentityUpdate:msgCtx:]",  30LL,  "Buffering family identity update before FirstUnlock: '%{mask}'\n",  v7);
    }

    -[RPPeopleDaemon _bufferCloudMessage:frameType:msgCtx:]( self,  "_bufferCloudMessage:frameType:msgCtx:",  v14,  34LL,  v6);
  }
}

- (void)_updateFamilyNotification
{
  uint64_t v12 = 0LL;
  unsigned int v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  uint64_t v15 = 1LL;
  if (-[NSMutableDictionary count](self->_familyDeviceIdentityMap, "count")) {
    v13[3] |= 2uLL;
  }
  familyDeviceIdentityMap = self->_familyDeviceIdentityMap;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000893CC;
  v11[3] = &unk_100114570;
  v11[4] = &v12;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( familyDeviceIdentityMap,  "enumerateKeysAndObjectsUsingBlock:",  v11);
  unint64_t familyFlags = self->_familyFlags;
  id v5 = v13;
  uint64_t v6 = v13[3];
  if (v6 != familyFlags)
  {
    if (dword_100132930 <= 30)
    {
      if (dword_100132930 == -1)
      {
        int v7 = _LogCategory_Initialize(&dword_100132930, 30LL);
        id v5 = v13;
        if (!v7) {
          goto LABEL_8;
        }
        uint64_t v6 = v13[3];
      }

      LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _updateFamilyNotification]",  30LL,  "Family flags changed: %#ll{flags} -> %#ll{flags}\n",  familyFlags,  &unk_10010AE2D,  v6,  &unk_10010AE2D);
      id v5 = v13;
    }

- (void)_friendsEnsureStarted
{
  if (!self->_privacyChangedCoalescer
    && self->_prefPrivacyCoalesceMinSecs > 0.0
    && self->_prefPrivacyCoalesceMaxSecs > 0.0)
  {
    unsigned int v3 = objc_alloc_init(&OBJC_CLASS___CUCoalescer);
    privacyChangedCoalescer = self->_privacyChangedCoalescer;
    self->_privacyChangedCoalescer = v3;

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100089558;
    v7[3] = &unk_1001110A8;
    v7[4] = self;
    -[CUCoalescer setActionHandler:](self->_privacyChangedCoalescer, "setActionHandler:", v7);
    -[CUCoalescer setDispatchQueue:](self->_privacyChangedCoalescer, "setDispatchQueue:", self->_dispatchQueue);
    -[CUCoalescer setMinDelay:](self->_privacyChangedCoalescer, "setMinDelay:", self->_prefPrivacyCoalesceMinSecs);
    -[CUCoalescer setMaxDelay:](self->_privacyChangedCoalescer, "setMaxDelay:", self->_prefPrivacyCoalesceMaxSecs);
  }

  if (self->_privacyChangedNotifyToken == -1)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100089560;
    v6[3] = &unk_1001115C8;
    v6[4] = self;
    notify_register_dispatch("com.apple.sharing.privacy-changed", &self->_privacyChangedNotifyToken, dispatchQueue, v6);
    -[CUCoalescer trigger](self->_privacyChangedCoalescer, "trigger");
  }

- (void)_friendsEnsureStopped
{
  friendAccountIdentityMap = self->_friendAccountIdentityMap;
  self->_friendAccountIdentityMap = 0LL;

  -[NSMutableDictionary removeAllObjects](self->_friendDeviceIdentityMap, "removeAllObjects");
  friendDeviceIdentityMap = self->_friendDeviceIdentityMap;
  self->_friendDeviceIdentityMap = 0LL;

  friendsSuggestedArray = self->_friendsSuggestedArray;
  self->_friendsSuggestedArray = 0LL;

  self->_friendsSuggestedNeedsUpdate = 0;
  int friendsSuggestedNotifyToken = self->_friendsSuggestedNotifyToken;
  if (friendsSuggestedNotifyToken != -1)
  {
    notify_cancel(friendsSuggestedNotifyToken);
    self->_int friendsSuggestedNotifyToken = -1;
  }

  -[CUCoalescer invalidate](self->_privacyChangedCoalescer, "invalidate");
  privacyChangedCoalescer = self->_privacyChangedCoalescer;
  self->_privacyChangedCoalescer = 0LL;

  int privacyChangedNotifyToken = self->_privacyChangedNotifyToken;
  if (privacyChangedNotifyToken != -1)
  {
    notify_cancel(privacyChangedNotifyToken);
    self->_int privacyChangedNotifyToken = -1;
  }

  friendsSuggestedPollTimer = self->_friendsSuggestedPollTimer;
  if (friendsSuggestedPollTimer)
  {
    int v11 = friendsSuggestedPollTimer;
    dispatch_source_cancel(v11);
    signed int v10 = self->_friendsSuggestedPollTimer;
    self->_friendsSuggestedPollTimer = 0LL;
  }

- (void)_friendsUpdateSuggestedIfNeeded
{
  if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) == 0)
  {
    if (dword_100132930 <= 30
      && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
    {
      LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _friendsUpdateSuggestedIfNeeded]",  30LL,  "Deferring friend update suggested until FirstUnlock\n");
    }

    return;
  }

  p_int friendsSuggestedNotifyToken = &self->_friendsSuggestedNotifyToken;
  int friendsSuggestedNotifyToken = self->_friendsSuggestedNotifyToken;
  int prefFriendSuggestMax = self->_prefFriendSuggestMax;
  if (prefFriendSuggestMax < 1)
  {
    if (friendsSuggestedNotifyToken != -1)
    {
      if (dword_100132930 > 30) {
        goto LABEL_25;
      }
      if (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)) {
        LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _friendsUpdateSuggestedIfNeeded]",  30LL,  "Friends suggest notify stop\n");
      }
      int friendsSuggestedNotifyToken = *p_friendsSuggestedNotifyToken;
      if (*p_friendsSuggestedNotifyToken != -1)
      {
LABEL_25:
        notify_cancel(friendsSuggestedNotifyToken);
        *p_int friendsSuggestedNotifyToken = -1;
      }
    }

- (id)getFriendDeviceIdentities
{
  return -[NSMutableDictionary allValues](self->_friendDeviceIdentityMap, "allValues");
}

- (BOOL)_pruneFriends:(BOOL)a3
{
  BOOL v3 = a3;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (v3 || Current >= 584466893.0)
  {
    double pruneLastSeconds = self->_pruneLastSeconds;
    if (pruneLastSeconds == 0.0)
    {
      double pruneLastSeconds = CFPrefs_GetDouble(@"com.apple.rapport", @"frPruneLastSecs", 0LL);
      self->_double pruneLastSeconds = pruneLastSeconds;
    }

    double v7 = vabdd_f64(Current, pruneLastSeconds);
    if (v3 || v7 >= 86400.0)
    {
      if (dword_100132930 <= 30
        && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
      {
        LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _pruneFriends:]",  30LL,  "Prune friends: Last %ll{dur}\n",  (uint64_t)v7);
      }

      unsigned __int8 v9 = -[RPPeopleDaemon _pruneFriendAccounts:](self, "_pruneFriendAccounts:", v3);
      unsigned __int8 v10 = -[RPPeopleDaemon _pruneFriendDevices](self, "_pruneFriendDevices");
      self->_double pruneLastSeconds = Current;
      CFPrefs_SetDouble(@"com.apple.rapport", @"frPruneLastSecs", Current);
      LOBYTE(v8) = v9 | v10;
    }

    else
    {
      if (dword_100132930 > 10) {
        goto LABEL_13;
      }
      if (dword_100132930 != -1 || (int v8 = _LogCategory_Initialize(&dword_100132930, 10LL)) != 0)
      {
        LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _pruneFriends:]",  10LL,  "Skipping prune friends: too soon, last %ll{dur}, min %{dur}\n",  (uint64_t)v7,  86400LL);
        goto LABEL_13;
      }
    }
  }

  else
  {
    if (dword_100132930 > 30)
    {
LABEL_13:
      LOBYTE(v8) = 0;
      return v8;
    }

    if (dword_100132930 != -1 || (int v8 = _LogCategory_Initialize(&dword_100132930, 30LL)) != 0)
    {
      LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _pruneFriends:]",  30LL,  "Skipping prune friends: bad clock, %{DateCF}\n",  *(void *)&Current);
      goto LABEL_13;
    }
  }

  return v8;
}

- (BOOL)_pruneFriendAccounts:(BOOL)a3
{
  int64_t prefFriendAccountPruneSeconds = self->_prefFriendAccountPruneSeconds;
  if (a3 || prefFriendAccountPruneSeconds > 0)
  {
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_friendAccountIdentityMap, "allKeys"));
    id v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (!v6)
    {
      BOOL v8 = 0;
      goto LABEL_39;
    }

    id v7 = v6;
    int64_t v19 = prefFriendAccountPruneSeconds;
    BOOL v8 = 0;
    uint64_t v9 = *(void *)v21;
    while (1)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v5);
        }
        int v11 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_friendAccountIdentityMap,  "objectForKeyedSubscript:",  v11));
        if (![v11 length])
        {
          if (dword_100132930 <= 30
            && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
          {
            LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _pruneFriendAccounts:]",  30LL,  "Prune friend account identity with empty identifier: %@\n",  v12);
          }

          goto LABEL_34;
        }

        unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 dateRemoved]);
        if (v13)
        {
          double Current = CFAbsoluteTimeGetCurrent();
          [v13 timeIntervalSinceReferenceDate];
          uint64_t v16 = (uint64_t)(Current - v15);
          if (v19 <= v16)
          {
            if (dword_100132930 <= 30
              && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
            {
              LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _pruneFriendAccounts:]",  30LL,  "Prune friend account identity: %ll{dur}, %@\n",  v16,  v12);
            }

LABEL_34:
            -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_friendAccountIdentityMap,  "setObject:forKeyedSubscript:",  0LL,  v11);
            BOOL v8 = 1;
            self->_needsFriendAccountUpdate = 1;
            unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( +[RPIdentityDaemon sharedIdentityDaemon]( &OBJC_CLASS___RPIdentityDaemon,  "sharedIdentityDaemon"));
            [v13 removeIdentity:v12 error:0];
            goto LABEL_35;
          }

          if (dword_100132930 <= 9
            && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 9LL)))
          {
            LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _pruneFriendAccounts:]",  9LL,  "Skipping prune friend account identity: premature, %ll{dur}, %@\n",  v16,  v12);
          }
        }

        else if (dword_100132930 <= 8 {
               && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 8LL)))
        }
        {
          LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _pruneFriendAccounts:]",  8LL,  "Skipping prune friend account identity: active, %@\n",  v12,  v18);
        }

- (BOOL)_pruneFriendDevices
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_friendDeviceIdentityMap, "allKeys"));
  id v3 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    id v4 = v3;
    char v5 = 0;
    uint64_t v6 = *(void *)v18;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)v7);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_friendDeviceIdentityMap,  "objectForKeyedSubscript:",  v8));
        unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 accountID]);
        if (v10
          && (uint64_t v11 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_friendAccountIdentityMap,  "objectForKeyedSubscript:",  v10))) != 0)
        {
          uint64_t v12 = (void *)v11;
          if (dword_100132930 <= 8
            && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 8LL)))
          {
            LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _pruneFriendDevices]",  8LL,  "Skipping prune friend device identity: active, %@, %@\n",  v9,  v12);
          }
        }

        else
        {
          if (dword_100132930 <= 30
            && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
          {
            LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _pruneFriendDevices]",  30LL,  "Prune friend device identity: %@\n",  v9);
          }

          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_friendDeviceIdentityMap,  "setObject:forKeyedSubscript:",  0LL,  v8);
          unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( +[RPIdentityDaemon sharedIdentityDaemon]( &OBJC_CLASS___RPIdentityDaemon,  "sharedIdentityDaemon"));
          [v13 removeIdentity:v9 error:0];

          uint64_t v12 = 0LL;
          char v5 = 1;
        }

        id v7 = (char *)v7 + 1;
      }

      while (v4 != v7);
      id v14 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      id v4 = v14;
    }

    while (v14);
  }

  else
  {
    char v5 = 0;
  }

  return v5 & 1;
}

- (void)_resetFriends
{
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_friendAccountIdentityMap, "allKeys"));
  id v4 = [v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)i);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_friendAccountIdentityMap,  "objectForKeyedSubscript:",  v8));
        if (dword_100132930 <= 30
          && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
        {
          LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _resetFriends]",  30LL,  "Delete friend account identity for reset: %@\n",  v9);
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_friendAccountIdentityMap,  "setObject:forKeyedSubscript:",  0LL,  v8);
        self->_needsFriendAccountUpdate = 1;
        unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
        [v10 removeIdentity:v9 error:0];
      }

      id v5 = [v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }

    while (v5);
  }

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_friendDeviceIdentityMap, "allKeys"));
  id v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (j = 0LL; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)j);
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_friendDeviceIdentityMap,  "objectForKeyedSubscript:",  v16));
        if (dword_100132930 <= 30
          && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
        {
          LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _resetFriends]",  30LL,  "Delete friend device identity for reset: %@\n",  v17);
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_friendDeviceIdentityMap,  "setObject:forKeyedSubscript:",  0LL,  v16);
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
        [v18 removeIdentity:v17 error:0];
      }

      id v13 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }

    while (v13);
  }

  -[RPPeopleDaemon _update](self, "_update");
}

- (BOOL)_shouldThrottleFriendSyncing
{
  int prefFriendSuggestMax = self->_prefFriendSuggestMax;
  if (prefFriendSuggestMax >= 33
    && dword_100132930 <= 30
    && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
  {
    LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _shouldThrottleFriendSyncing]",  30LL,  "Friend sync throttling is enabled\n");
  }

  return prefFriendSuggestMax > 32;
}

- (void)_updateFriendIdentities
{
  if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
  {
    unsigned int v3 = -[RPPeopleDaemon _updateFriendAccounts](self, "_updateFriendAccounts");
    unsigned int v4 = -[RPPeopleDaemon _updateFriendDevices](self, "_updateFriendDevices") + v3;
    int v5 = -[RPPeopleDaemon _pruneFriends:](self, "_pruneFriends:", 0LL) << 31 >> 31;
    -[RPPeopleDaemon _processBufferedCloudMessages](self, "_processBufferedCloudMessages");
    -[RPPeopleDaemon _updateFriendSyncing](self, "_updateFriendSyncing");
    if (v4 != v5)
    {
      id v6 = (id)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](&OBJC_CLASS___RPDaemon, "sharedDaemon"));
      [v6 postDaemonInfoChanges:128];
    }
  }

  else if (dword_100132930 <= 30 {
         && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
  }
  {
    LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _updateFriendIdentities]",  30LL,  "Deferring friend account identities update until FirstUnlock\n");
  }

- (BOOL)_updateFriendAccounts
{
  uint64_t v64 = 0LL;
  BOOL v65 = &v64;
  uint64_t v66 = 0x2020000000LL;
  char v67 = 0;
  if (!self->_friendAccountIdentityMap)
  {
    unsigned int v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    friendAccountIdentityMap = self->_friendAccountIdentityMap;
    self->_friendAccountIdentityMap = v3;

    int v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
    id v63 = 0LL;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identitiesOfType:5 error:&v63]);
    id v43 = v63;

    if (!v6
      && dword_100132930 <= 90
      && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 90LL)))
    {
      LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _updateFriendAccounts]",  90LL,  "### Load friend account identities failed: %{error}\n",  v43);
    }

    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v59 objects:v71 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v60;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v60 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)i);
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
          if (v12)
          {
            -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_friendAccountIdentityMap,  "setObject:forKeyedSubscript:",  v11,  v12);
            if (dword_100132930 <= 30
              && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
            {
              LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _updateFriendAccounts]",  30LL,  "Loaded friend account identity: %@\n",  v11);
            }

            *((_BYTE *)v65 + 24) = 1;
          }
        }

        id v8 = [v7 countByEnumeratingWithState:&v59 objects:v71 count:16];
      }

      while (v8);
    }

    self->_needsFriendAccountUpdate = 1;
  }

  uint64_t v38 = self->_friendsSuggestedArray;
  if (!v38)
  {
    ++self->_irkMetrics.duetNotQueried;
    self->_sendIRKMetricsReport = 1;
    if (dword_100132930 <= 30
      && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
    {
      LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _updateFriendAccounts]",  30LL,  "Deferring friend account identities update until friends suggested ready\n");
    }

    goto LABEL_62;
  }

  int maxNumDuetSuggestions = self->_irkMetrics.maxNumDuetSuggestions;
  signed int v14 = -[NSArray count](self->_friendsSuggestedArray, "count");
  if (maxNumDuetSuggestions <= v14) {
    int v15 = v14;
  }
  else {
    int v15 = maxNumDuetSuggestions;
  }
  self->_irkMetrics.int maxNumDuetSuggestions = v15;
  self->_sendIRKMetricsReport = 1;
  if (!self->_needsFriendAccountUpdate)
  {
LABEL_62:
    int v35 = *((unsigned __int8 *)v65 + 24);
    goto LABEL_63;
  }

  self->_needsFriendAccountUpdate = 0;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  __int128 v17 = self->_friendAccountIdentityMap;
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472LL;
  v58[2] = sub_10008B170;
  v58[3] = &unk_1001145E0;
  *(CFAbsoluteTime *)&v58[4] = Current;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v17, "enumerateKeysAndObjectsUsingBlock:", v58);
  __int128 v18 = -[NSMutableSet initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableSet),  "initWithCapacity:",  -[NSArray count](v38, "count"));
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v19 = v38;
  id v20 = -[NSArray countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v54,  v70,  16LL);
  if (v20)
  {
    uint64_t v21 = *(void *)v55;
    do
    {
      for (j = 0LL; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v55 != v21) {
          objc_enumerationMutation(v19);
        }
        __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v54 + 1) + 8 * (void)j) contactID]);
        -[NSMutableSet addObject:](v18, "addObject:", v23);
      }

      id v20 = -[NSArray countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v54,  v70,  16LL);
    }

    while (v20);
  }

  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  id obj = v19;
  id v41 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v50,  v69,  16LL);
  if (v41)
  {
    int v37 = 0;
    uint64_t v40 = *(void *)v51;
LABEL_42:
    uint64_t v44 = 0LL;
    int v42 = v37;
    v37 += (int)v41;
    while (1)
    {
      if (*(void *)v51 != v40) {
        objc_enumerationMutation(obj);
      }
      __int128 v24 = *(void **)(*((void *)&v50 + 1) + 8 * v44);
      if ((objc_opt_respondsToSelector(v24, "sendersKnownAlias") & 1) != 0)
      {
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 sendersKnownAlias]);
        __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 _stripFZIDPrefix]);
      }

      else
      {
        __int128 v26 = 0LL;
      }

      __int128 v48 = 0u;
      __int128 v49 = 0u;
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      int v27 = (void *)objc_claimAutoreleasedReturnValue([v24 handles]);
      id v28 = [v27 countByEnumeratingWithState:&v46 objects:v68 count:16];
      if (v28)
      {
        uint64_t v29 = *(void *)v47;
        do
        {
          for (k = 0LL; k != v28; k = (char *)k + 1)
          {
            if (*(void *)v47 != v29) {
              objc_enumerationMutation(v27);
            }
            uint64_t v31 = *(void *)(*((void *)&v46 + 1) + 8LL * (void)k);
            uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v24 contactID]);
            LODWORD(v31) = -[RPPeopleDaemon _updateFriendIdentityWithAppleID:contactID:sendersKnownAlias:userAdded:updateDateRequested:suggestedContactIDs:]( self,  "_updateFriendIdentityWithAppleID:contactID:sendersKnownAlias:userAdded:updateDateRequested: suggestedContactIDs:",  v31,  v32,  v26,  0LL,  0LL,  v18);

            if ((_DWORD)v31) {
              *((_BYTE *)v65 + 24) = 1;
            }
          }

          id v28 = [v27 countByEnumeratingWithState:&v46 objects:v68 count:16];
        }

        while (v28);
      }

      BOOL v33 = ++v42 < self->_prefFriendSuggestMax;
      if (!v33) {
        break;
      }
      if ((id)++v44 == v41)
      {
        id v41 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v50,  v69,  16LL);
        if (v41) {
          goto LABEL_42;
        }
        break;
      }
    }
  }

  uint64_t v34 = self->_friendAccountIdentityMap;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_10008B1F0;
  v45[3] = &unk_100114570;
  v45[4] = &v64;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v34, "enumerateKeysAndObjectsUsingBlock:", v45);
  int v35 = *((unsigned __int8 *)v65 + 24);

LABEL_63:
  _Block_object_dispose(&v64, 8);
  return v35 != 0;
}

- (unsigned)_updateFriendIdentityWithAppleID:(id)a3 contactID:(id)a4 sendersKnownAlias:(id)a5 userAdded:(BOOL)a6 updateDateRequested:(BOOL)a7 suggestedContactIDs:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v18 = CUNormalizeEmailAddress(v14, 1LL);
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[RPPeopleDaemon _primaryAppleID:](self, "_primaryAppleID:", 0LL));
  if ([v20 caseInsensitiveCompare:v19])
  {
    BOOL v63 = v10;
    uint64_t v64 = v20;
    __int128 v62 = self;
    uint64_t v21 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_friendAccountIdentityMap,  "objectForKeyedSubscript:",  v19));
    if (v21)
    {
      __int128 v22 = (RPIdentity *)v21;
      uint64_t v23 = 0LL;
    }

    else
    {
      __int128 v22 = objc_alloc_init(&OBJC_CLASS___RPIdentity);
      uint64_t v23 = 2048LL;
    }

    -[RPIdentity setPresent:](v22, "setPresent:", 1LL);
    if ([v15 length])
    {
      BOOL v24 = v9;
      __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentity contactID](v22, "contactID"));
      if ([v25 isEqual:v15])
      {
      }

      else
      {
        id v60 = v16;
        id v26 = v14;
        id v27 = v15;
        id v28 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentity contactID](v22, "contactID"));
        unsigned __int8 v29 = [v17 containsObject:v28];

        if ((v29 & 1) != 0)
        {
          id v15 = v27;
        }

        else
        {
          id v15 = v27;
          -[RPIdentity setContactID:](v22, "setContactID:", v27);
          uint64_t v23 = v23 | 0x8000;
        }

        id v14 = v26;
        id v16 = v60;
      }

      BOOL v9 = v24;
    }

    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentity dateAdded](v22, "dateAdded"));

    if (!v30)
    {
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      -[RPIdentity setDateAdded:](v22, "setDateAdded:", v31);

      uint64_t v23 = v23 | 2;
    }

    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentity dateRemoved](v22, "dateRemoved"));

    if (v32)
    {
      -[RPIdentity setDateRemoved:](v22, "setDateRemoved:", 0LL);
      uint64_t v23 = v23 | 2;
    }

    if (v9)
    {
      BOOL v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      -[RPIdentity setDateRequested:](v22, "setDateRequested:", v33);
    }

    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentity identifier](v22, "identifier"));
    unsigned __int8 v35 = [v34 isEqual:v19];

    if ((v35 & 1) == 0)
    {
      -[RPIdentity setIdentifier:](v22, "setIdentifier:", v19);
      uint64_t v23 = v23 | 0x2020;
    }

    id v36 = v16;
    if (!v16) {
      goto LABEL_48;
    }
    int v37 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentity allUsedSendersKnownAliases](v22, "allUsedSendersKnownAliases"));

    id v61 = v15;
    if (!v37)
    {
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentity sendersKnownAlias](v22, "sendersKnownAlias"));

      if (v38)
      {
        int v39 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentity sendersKnownAlias](v22, "sendersKnownAlias"));
        BOOL v65 = v39;
        uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v65, 1LL));
        -[RPIdentity setAllUsedSendersKnownAliases:](v22, "setAllUsedSendersKnownAliases:", v40);
      }

      else
      {
        int v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
        -[RPIdentity setAllUsedSendersKnownAliases:](v22, "setAllUsedSendersKnownAliases:", v39);
      }
    }

    if (![v36 length])
    {
LABEL_48:

      if (-[RPIdentity type](v22, "type") != 5)
      {
        -[RPIdentity setType:](v22, "setType:", 5LL);
        uint64_t v23 = v23 | 0x200;
      }

      if (v63 && (-[RPIdentity userAdded](v22, "userAdded") & 1) == 0)
      {
        -[RPIdentity setUserAdded:](v22, "setUserAdded:", 1LL);
        uint64_t v23 = v23 | 0x4000;
      }

      if ((v23 & 0x800) != 0)
      {
        friendAccountIdentityMap = v62->_friendAccountIdentityMap;
        if (!friendAccountIdentityMap)
        {
          __int128 v56 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          __int128 v57 = v62->_friendAccountIdentityMap;
          v62->_friendAccountIdentityMap = v56;

          friendAccountIdentityMap = v62->_friendAccountIdentityMap;
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:]( friendAccountIdentityMap,  "setObject:forKeyedSubscript:",  v22,  v19);
        if (dword_100132930 <= 30
          && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
        {
          LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _updateFriendIdentityWithAppleID:contactID:sendersKnownAlias:userAdded:updateDateRequested: suggestedContactIDs:]",  30LL,  "Added friend account identity: %@\n",  v22);
        }
      }

      else
      {
        if (!(_DWORD)v23)
        {
          if (dword_100132930 <= 10
            && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 10LL)))
          {
            LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _updateFriendIdentityWithAppleID:contactID:sendersKnownAlias:userAdded:updateDateRequeste d:suggestedContactIDs:]",  10LL,  "Unchanged friend account identity: %@\n",  v22);
          }

          goto LABEL_71;
        }

        if (dword_100132930 <= 30
          && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
        {
          LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _updateFriendIdentityWithAppleID:contactID:sendersKnownAlias:userAdded:updateDateRequested: suggestedContactIDs:]",  30LL,  "Updated friend account identity: %@, %#{flags}\n",  v22,  v23,  &unk_10010AE48);
        }
      }

      uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
      [v58 saveIdentity:v22 error:0];

LABEL_71:
      id v20 = v64;
      goto LABEL_72;
    }

    id v41 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentity sendersKnownAlias](v22, "sendersKnownAlias"));
    id v42 = v36;
    id v43 = v41;
    if (v43 == v42)
    {

      goto LABEL_40;
    }

    uint64_t v44 = v43;
    if (v43)
    {
      unsigned __int8 v45 = [v42 isEqual:v43];

      if ((v45 & 1) != 0)
      {
LABEL_40:
        __int128 v46 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentity allUsedSendersKnownAliases](v22, "allUsedSendersKnownAliases"));
        __int128 v47 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentity sendersKnownAlias](v22, "sendersKnownAlias"));
        unsigned __int8 v48 = [v46 containsObject:v47];

        __int128 v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v62->_friendDeviceIdentityMap, "allKeys"));
        unsigned __int8 v50 = [v49 containsObject:v14];

        if ((v48 & 1) == 0 && (v50 & 1) == 0)
        {
          __int128 v51 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentity allUsedSendersKnownAliases](v22, "allUsedSendersKnownAliases"));
          __int128 v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v51));

          __int128 v53 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentity sendersKnownAlias](v22, "sendersKnownAlias"));
          [v52 addObject:v53];

          id v54 = [v52 copy];
          -[RPIdentity setAllUsedSendersKnownAliases:](v22, "setAllUsedSendersKnownAliases:", v54);

          uint64_t v23 = v23 | 0x1000000;
          if (dword_100132930 <= 30
            && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
          {
            LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _updateFriendIdentityWithAppleID:contactID:sendersKnownAlias:userAdded:updateDateRequeste d:suggestedContactIDs:]",  30LL,  "updateFriendIdentity: priming friend account with updated SKA for IRK exchange retry\n");
          }

          -[RPIdentity setDateRequested:](v22, "setDateRequested:", 0LL);
        }

        id v15 = v61;
        goto LABEL_48;
      }
    }

    else
    {
    }

    -[RPIdentity setSendersKnownAlias:](v22, "setSendersKnownAlias:", v42);
    uint64_t v23 = v23 | 0x40000;
    goto LABEL_40;
  }

  if (dword_100132930 <= 30 && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL))) {
    LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _updateFriendIdentityWithAppleID:contactID:sendersKnownAlias:userAdded:updateDateRequested:suggestedContactIDs:]",  30LL,  "Ignoring local friend identity update of ourself\n");
  }
  LODWORD(v23) = 0;
LABEL_72:

  return v23;
}

- (BOOL)updateFriendIdentityWithAppleID:(id)a3 contactID:(id)a4
{
  return -[RPPeopleDaemon _updateFriendIdentityWithAppleID:contactID:sendersKnownAlias:userAdded:updateDateRequested:suggestedContactIDs:]( self,  "_updateFriendIdentityWithAppleID:contactID:sendersKnownAlias:userAdded:updateDateRequested:suggestedContactIDs:",  a3,  a4,  0LL,  1LL,  1LL,  0LL) != 0;
}

- (BOOL)_updateFriendDevices
{
  if (self->_friendDeviceIdentityMap) {
    return 0;
  }
  unsigned int v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  friendDeviceIdentityMap = self->_friendDeviceIdentityMap;
  self->_friendDeviceIdentityMap = v4;

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
  id v22 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 loadFriendDeviceIdentitiesWithError:&v22]);
  id v8 = v22;

  if (!v7
    && dword_100132930 <= 90
    && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 90LL)))
  {
    LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _updateFriendDevices]",  90LL,  "### Load friend device identities failed: %{error}\n",  v8);
  }

  id v17 = v8;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    BOOL v2 = 0;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
        if (v15)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_friendDeviceIdentityMap,  "setObject:forKeyedSubscript:",  v14,  v15);
          if (dword_100132930 <= 30
            && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
          {
            LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _updateFriendDevices]",  30LL,  "Loaded friend device identity: %@\n",  v14,  v17,  (void)v18);
          }

          BOOL v2 = 1;
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }

    while (v11);
  }

  else
  {
    BOOL v2 = 0;
  }

  return v2;
}

- (void)_updateFriendPrivacy
{
  if (!self->_friendPrivacyGetting)
  {
    unsigned int v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    friendAccountIdentityMap = self->_friendAccountIdentityMap;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10008BE40;
    v10[3] = &unk_100114608;
    v10[4] = v3;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( friendAccountIdentityMap,  "enumerateKeysAndObjectsUsingBlock:",  v10);
    if (-[NSMutableArray count](v3, "count"))
    {
      if (dword_100132930 <= 30
        && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
      {
        LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _updateFriendPrivacy]",  30LL,  "Friend privacy get: %d contacts\n",  -[NSMutableArray count](v3, "count"));
      }

      id v5 = objc_alloc_init(off_1001329A8());
      [v5 setDispatchQueue:self->_dispatchQueue];
      id v6 = objc_alloc_init(off_1001329B0());
      [v6 setContactIDs:v3];
      self->_friendPrivacyGetting = 1;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_10008BE8C;
      v8[3] = &unk_1001131C0;
      v8[4] = self;
      id v9 = v5;
      id v7 = v5;
      [v7 getPeopleSuggestions:v6 completion:v8];
    }

    else if (dword_100132930 <= 30 {
           && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
    }
    {
      LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _updateFriendPrivacy]",  30LL,  "Friend privacy get: skipping, no contacts\n");
    }
  }

- (void)_updateFriendPrivacyResults:(id)a3
{
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id obj = a3;
  id v4 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v4)
  {
    char v17 = 0;
    char v5 = 0;
    uint64_t v6 = *(void *)v33;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 contactID]);
        if (!v9)
        {

          goto LABEL_31;
        }

        uint64_t v26 = 0LL;
        id v27 = &v26;
        uint64_t v28 = 0x3032000000LL;
        unsigned __int8 v29 = sub_100083868;
        uint64_t v30 = sub_100083878;
        id v31 = 0LL;
        uint64_t v20 = 0LL;
        __int128 v21 = &v20;
        uint64_t v22 = 0x3032000000LL;
        uint64_t v23 = sub_100083868;
        BOOL v24 = sub_100083878;
        id v25 = 0LL;
        friendAccountIdentityMap = self->_friendAccountIdentityMap;
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472LL;
        v19[2] = sub_10008C3E0;
        v19[3] = &unk_100114630;
        v19[4] = v9;
        v19[5] = &v26;
        v19[6] = &v20;
        -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( friendAccountIdentityMap,  "enumerateKeysAndObjectsUsingBlock:",  v19);
        if (v27[5] && v21[5])
        {
          id v11 = [v8 flags];
          if ((v11 & 3) != 0)
          {
            if (dword_100132930 <= 30
              && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
            {
              LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _updateFriendPrivacyResults:]",  30LL,  "Friend account identity privacy: delete, %@, %#{flags}\n",  v27[5],  v11,  &unk_10010AF43);
            }

            uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([(id)v27[5] dateRequested]);

            BOOL v13 = v12 != 0LL;
            -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_friendAccountIdentityMap,  "setObject:forKeyedSubscript:",  0LL,  v21[5]);
            self->_needsFriendAccountUpdate = 1;
            id v14 = (void *)objc_claimAutoreleasedReturnValue( +[RPIdentityDaemon sharedIdentityDaemon]( &OBJC_CLASS___RPIdentityDaemon,  "sharedIdentityDaemon"));
            [v14 removeIdentity:v27[5] error:0];

            -[RPPeopleDaemon _pruneFriendDevices](self, "_pruneFriendDevices");
            v17 |= v13;
            char v5 = 1;
          }
        }

        else if (dword_100132930 <= 30 {
               && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
        }
        {
          LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _updateFriendPrivacyResults:]",  30LL,  "Friend account identity privacy: not found, %@\n",  v9);
        }

        _Block_object_dispose(&v20, 8);

        _Block_object_dispose(&v26, 8);
      }

      id v4 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v4) {
        continue;
      }
      break;
    }

    if ((v5 & 1) != 0)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](&OBJC_CLASS___RPDaemon, "sharedDaemon"));
      [v15 postDaemonInfoChanges:128];
    }

    if ((v17 & 1) != 0)
    {
      if (self->_prefDisableSelfIdentityRolling)
      {
        if (dword_100132930 <= 30
          && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
        {
          LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _updateFriendPrivacyResults:]",  30LL,  "Press demo mode enabled, not rolling self identity");
        }
      }

      else
      {
        friendsSuggestedArray = self->_friendsSuggestedArray;
        self->_friendsSuggestedArray = 0LL;

        -[RPPeopleDaemon _regenerateSelfIdentity:](self, "_regenerateSelfIdentity:", @"Friend Blocked/Removed");
      }
    }
  }

  else
  {
  }

- (void)_updateFriendSyncing
{
  if (self->_prefFriendSyncDelaySeconds < 0)
  {
    if (dword_100132930 <= 30
      && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
    {
      LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _updateFriendSyncing]",  30LL,  "Friend sync: skipping when disabled via delay\n");
    }
  }

  else
  {
    double Double = CFPrefs_GetDouble(@"com.apple.rapport", @"pdFriendSyncStart", 0LL);
    if (Double < 0.0)
    {
      if (dword_100132930 <= 30
        && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
      {
        LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _updateFriendSyncing]",  30LL,  "Friend sync: skipping when disabled via negative start seconds, resetting to 0\n");
      }

      double Current = CFAbsoluteTimeGetCurrent();
      goto LABEL_23;
    }

    double v4 = Double;
    double v5 = CFAbsoluteTimeGetCurrent();
    double Current = v5;
    if (v4 > 0.0 && vabdd_f64(v4, v5) > 2592000.0)
    {
      if (dword_100132930 <= 30
        && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
      {
        LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _updateFriendSyncing]",  30LL,  "Friend sync: resetting out-of-range start seconds: %f\n",  v4 - Current);
      }

      goto LABEL_23;
    }

    if (v4 == 0.0)
    {
LABEL_23:
      uint64_t v7 = arc4random() % 0x2A301 + 86400;
      double v8 = Current + (double)v7;
      if (dword_100132930 <= 30
        && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
      {
        LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _updateFriendSyncing]",  30LL,  "Friend sync: initial delay: %{DateCF}, %{dur}\n",  *(void *)&v8,  v7);
      }

      CFPrefs_SetDouble(@"com.apple.rapport", @"pdFriendSyncStart", v8);
      return;
    }

    if (v4 <= v5)
    {
      unsigned int v9 = -[RPPeopleDaemon _shouldThrottleFriendSyncing](self, "_shouldThrottleFriendSyncing");
      char v10 = v9;
      if (!v9) {
        goto LABEL_32;
      }
      double friendRequestMaxReachedLastSeconds = self->_friendRequestMaxReachedLastSeconds;
      if (friendRequestMaxReachedLastSeconds == 0.0)
      {
        double friendRequestMaxReachedLastSeconds = CFPrefs_GetDouble( @"com.apple.rapport",  @"frMaxReachedLastSecs",  0LL);
        self->_double friendRequestMaxReachedLastSeconds = friendRequestMaxReachedLastSeconds;
      }

      double v12 = vabdd_f64(Current, friendRequestMaxReachedLastSeconds);
      if (v12 < 3300.0)
      {
        if (dword_100132930 <= 30
          && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
        {
          LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _updateFriendSyncing]",  30LL,  "Friend sync: too soon since last time max reaached; last %ll{dur}, min %{dur}\n",
            (uint64_t)v12,
            3300LL);
        }
      }

      else
      {
LABEL_32:
        v64[0] = 0LL;
        v64[1] = v64;
        v64[2] = 0x2020000000LL;
        int v65 = 10;
        uint64_t v60 = 0LL;
        id v61 = &v60;
        uint64_t v62 = 0x2020000000LL;
        int v63 = 0;
        uint64_t v56 = 0LL;
        __int128 v57 = &v56;
        uint64_t v58 = 0x2020000000LL;
        int v59 = 0;
        uint64_t v52 = 0LL;
        __int128 v53 = &v52;
        uint64_t v54 = 0x2020000000LL;
        int v55 = 0;
        uint64_t v48 = 0LL;
        __int128 v49 = &v48;
        uint64_t v50 = 0x2020000000LL;
        int v51 = 0;
        uint64_t v44 = 0LL;
        unsigned __int8 v45 = &v44;
        uint64_t v46 = 0x2020000000LL;
        int v47 = 0;
        uint64_t v40 = 0LL;
        id v41 = &v40;
        uint64_t v42 = 0x2020000000LL;
        int v43 = 0;
        uint64_t v36 = 0LL;
        int v37 = &v36;
        uint64_t v38 = 0x2020000000LL;
        int v39 = 0;
        uint64_t v32 = 0LL;
        __int128 v33 = &v32;
        uint64_t v34 = 0x2020000000LL;
        int v35 = 0;
        uint64_t v28 = 0LL;
        unsigned __int8 v29 = &v28;
        uint64_t v30 = 0x2020000000LL;
        int v31 = 0;
        uint64_t v24 = 0LL;
        id v25 = &v24;
        uint64_t v26 = 0x2020000000LL;
        char v27 = 0;
        friendAccountIdentityMap = self->_friendAccountIdentityMap;
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472LL;
        v22[2] = sub_10008CC10;
        v22[3] = &unk_100114658;
        v22[6] = &v24;
        void v22[7] = &v36;
        v22[4] = self;
        v22[5] = &v60;
        v22[8] = &v32;
        v22[9] = &v48;
        v22[10] = &v56;
        v22[11] = &v52;
        v22[12] = v64;
        v22[13] = &v40;
        v22[14] = &v44;
        v22[15] = &v28;
        char v23 = v10;
        -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( friendAccountIdentityMap,  "enumerateKeysAndObjectsUsingBlock:",  v22);
        if (*((_BYTE *)v25 + 24))
        {
          if (dword_100132930 <= 30
            && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
          {
            LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _updateFriendSyncing]",  30LL,  "Friend sync: max requests reached\n");
          }

          double v14 = CFAbsoluteTimeGetCurrent();
          self->_double friendRequestMaxReachedLastSeconds = v14;
          CFPrefs_SetDouble(@"com.apple.rapport", @"frMaxReachedLastSecs", v14);
        }

        int maxNumFriendAccounts = self->_irkMetrics.maxNumFriendAccounts;
        signed int v16 = -[NSMutableDictionary count](self->_friendAccountIdentityMap, "count");
        if (maxNumFriendAccounts <= v16) {
          int v17 = v16;
        }
        else {
          int v17 = maxNumFriendAccounts;
        }
        self->_irkMetrics.int maxNumFriendAccounts = v17;
        int maxNumFriendDevices = self->_irkMetrics.maxNumFriendDevices;
        signed int v19 = -[NSMutableDictionary count](self->_friendDeviceIdentityMap, "count");
        if (maxNumFriendDevices <= v19) {
          int v20 = v19;
        }
        else {
          int v20 = maxNumFriendDevices;
        }
        self->_irkMetrics.int maxNumFriendDevices = v20;
        self->_sendIRKMetricsReport = 1;
        if (dword_100132930 <= 30
          && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
        {
          unsigned int v21 = -[NSMutableDictionary count](self->_friendAccountIdentityMap, "count");
          LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _updateFriendSyncing]",  30LL,  "Friend sync: updated accounts: Total %d, Removed %d, Refresh %d, One-Time Refresh %d, Missing SendersKnownAl ias %d, Retry %d, Later %d, Request %d, Failed %d, OverMax %d\n",  v21,  *((_DWORD *)v61 + 6),  *((_DWORD *)v57 + 6),  *((_DWORD *)v33 + 6),  *((_DWORD *)v29 + 6),  *((_DWORD *)v53 + 6),  *((_DWORD *)v49 + 6),  *((_DWORD *)v45 + 6),  *((_DWORD *)v41 + 6),  *((_DWORD *)v37 + 6));
        }

        if (!self->_prefOneTimeDateRequestedResetCompleted)
        {
          if (dword_100132930 <= 30
            && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
          {
            LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _updateFriendSyncing]",  30LL,  "Friend sync: completed the one time dateRequest refresh, setting pref accordingly");
          }

          CFPrefs_SetValue(@"com.apple.rapport", @"oneTimeDateRequestedResetCompleted", kCFBooleanTrue);
          self->_prefOneTimeDateRequestedResetCompleted = 1;
        }

        _Block_object_dispose(&v24, 8);
        _Block_object_dispose(&v28, 8);
        _Block_object_dispose(&v32, 8);
        _Block_object_dispose(&v36, 8);
        _Block_object_dispose(&v40, 8);
        _Block_object_dispose(&v44, 8);
        _Block_object_dispose(&v48, 8);
        _Block_object_dispose(&v52, 8);
        _Block_object_dispose(&v56, 8);
        _Block_object_dispose(&v60, 8);
        _Block_object_dispose(v64, 8);
      }
    }

    else if (dword_100132930 <= 30 {
           && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
    }
    {
      LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _updateFriendSyncing]",  30LL,  "Friend sync: waiting for start: %{DateCF}, %{dur}\n",  *(void *)&v4,  (int)fmin(v4 - Current, 2147483650.0));
    }
  }

- (void)_irkMetricsSetup
{
  self->_irkMetricsReportLock._os_unfair_lock_opaque = 0;
  *(void *)&__int128 v2 = -1LL;
  *((void *)&v2 + 1) = -1LL;
  *(_OWORD *)&self->_irkMetrics.selfIdentRolled = v2;
  *(_OWORD *)&self->_irkMetrics.requestsSent = v2;
  *(_OWORD *)&self->_irkMetrics.requestsIgnoredNoIDSDevice = v2;
  *(void *)&self->_irkMetrics.int maxNumFamilyDevices = -1LL;
}

- (void)_fetchSameAccountIdentities
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
  uint64_t v8 = 0LL;
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identitiesOfType:2 error:&v8]);

  int maxNumSelfDevices = self->_irkMetrics.maxNumSelfDevices;
  signed int v6 = [v4 count];
  if (maxNumSelfDevices <= v6) {
    int v7 = v6;
  }
  else {
    int v7 = maxNumSelfDevices;
  }
  self->_irkMetrics.int maxNumSelfDevices = v7;
  self->_sendIRKMetricsReport = 1;
}

- (void)reportIRKMetrics
{
  if (self->_sendIRKMetricsReport)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    selfIdentRolled = self->_irkMetrics.selfIdentRolled;
    id v28 = (id)v3;
    if ((selfIdentRolled & 0x80000000) == 0)
    {
      double v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  (selfIdentRolled + 1)));
      [v28 setObject:v5 forKeyedSubscript:@"selfIdentRolled"];
    }

    selfIdentRolledBlocked = self->_irkMetrics.selfIdentRolledBlocked;
    if ((selfIdentRolledBlocked & 0x80000000) == 0)
    {
      int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  (selfIdentRolledBlocked + 1)));
      [v28 setObject:v7 forKeyedSubscript:@"selfIdentRolledBlocked"];
    }

    int duetNotQueried = self->_irkMetrics.duetNotQueried;
    if ((duetNotQueried & 0x80000000) == 0)
    {
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  (duetNotQueried + 1)));
      [v28 setObject:v9 forKeyedSubscript:@"duetNotQueried"];
    }

    if ((self->_irkMetrics.maxNumDuetSuggestions & 0x80000000) == 0)
    {
      char v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:"));
      [v28 setObject:v10 forKeyedSubscript:@"numDuetSuggestions"];
    }

    int requestsSent = self->_irkMetrics.requestsSent;
    if ((requestsSent & 0x80000000) == 0)
    {
      double v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  (requestsSent + 1)));
      [v28 setObject:v12 forKeyedSubscript:@"requestsSent"];
    }

    if ((self->_irkMetrics.maxNumFriendAccounts & 0x80000000) == 0)
    {
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:"));
      [v28 setObject:v13 forKeyedSubscript:@"numFriendAccounts"];
    }

    if ((self->_irkMetrics.maxNumFriendDevices & 0x80000000) == 0)
    {
      double v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:"));
      [v28 setObject:v14 forKeyedSubscript:@"numFriendDevices"];
    }

    int requestsIgnored = self->_irkMetrics.requestsIgnored;
    if ((requestsIgnored & 0x80000000) == 0)
    {
      signed int v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  (requestsIgnored + 1)));
      [v28 setObject:v16 forKeyedSubscript:@"requestsIgnored"];
    }

    int requestsIgnoredNoIDSDevice = self->_irkMetrics.requestsIgnoredNoIDSDevice;
    if ((requestsIgnoredNoIDSDevice & 0x80000000) == 0)
    {
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  (requestsIgnoredNoIDSDevice + 1)));
      [v28 setObject:v18 forKeyedSubscript:@"requestsIgnoredNoIDSDevice"];
    }

    int requestsIgnoredSelfIdentReq = self->_irkMetrics.requestsIgnoredSelfIdentReq;
    if ((requestsIgnoredSelfIdentReq & 0x80000000) == 0)
    {
      int v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  (requestsIgnoredSelfIdentReq + 1)));
      [v28 setObject:v20 forKeyedSubscript:@"requestsIgnoredSelfIdentReq"];
    }

    int requestsIgnoredUnknownPeer = self->_irkMetrics.requestsIgnoredUnknownPeer;
    if ((requestsIgnoredUnknownPeer & 0x80000000) == 0)
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  (requestsIgnoredUnknownPeer + 1)));
      [v28 setObject:v22 forKeyedSubscript:@"requestsIgnoredUnknownPeer"];
    }

    int requestsAcked = self->_irkMetrics.requestsAcked;
    if ((requestsAcked & 0x80000000) == 0)
    {
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  (requestsAcked + 1)));
      [v28 setObject:v24 forKeyedSubscript:@"requestsAcked"];
    }

    if ((self->_irkMetrics.maxNumFamilyDevices & 0x80000000) == 0)
    {
      id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:"));
      [v28 setObject:v25 forKeyedSubscript:@"numFamilyDevices"];
    }

    if ((self->_irkMetrics.maxNumSelfDevices & 0x80000000) == 0)
    {
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:"));
      [v28 setObject:v26 forKeyedSubscript:@"numSelfDevices"];
    }

    if (dword_100132930 <= 30
      && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
    {
      LogPrintF( &dword_100132930,  "-[RPPeopleDaemon reportIRKMetrics]",  30LL,  "Friend sync: submitting IRK metrics to Core Analytics %@",  v28);
    }

    CUMetricsLog(@"com.apple.rapport.metrics.irkexchange", v28);
    *(void *)&self->_irkMetrics.int maxNumFamilyDevices = -1LL;
    *(void *)&__int128 v27 = -1LL;
    *((void *)&v27 + 1) = -1LL;
    *(_OWORD *)&self->_irkMetrics.int requestsSent = v27;
    *(_OWORD *)&self->_irkMetrics.int requestsIgnoredNoIDSDevice = v27;
    *(_OWORD *)&self->_irkMetrics.selfIdentRolled = v27;
    self->_sendIRKMetricsReport = 0;
    os_unfair_lock_unlock(&self->_irkMetricsReportLock);
  }

  else
  {
    os_unfair_lock_unlock(&self->_irkMetricsReportLock);
  }

- (void)receivedFriendIdentityRequest:(id)a3 msgCtx:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 appleID]);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 fromID]);
  if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
  {
    CFTypeID TypeID = CFStringGetTypeID();
    uint64_t TypedValue = CFDictionaryGetTypedValue(v6, @"_idsID", TypeID, 0LL);
    double v12 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
    if (v12)
    {
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[RPPeopleDaemon _primaryAppleID:](self, "_primaryAppleID:", 0LL));
      if ([v13 caseInsensitiveCompare:v8])
      {
        id v14 = objc_alloc_init(off_1001329B8());
        [v14 setEmailAddress:v8];
        [v14 setPhoneNumber:v8];
        id v15 = objc_alloc_init(off_1001329A8());
        [v15 setDispatchQueue:self->_dispatchQueue];
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472LL;
        v17[2] = sub_10008D8B4;
        v17[3] = &unk_100114680;
        id v18 = v15;
        signed int v19 = self;
        int v20 = v8;
        unsigned int v21 = v12;
        id v22 = v6;
        id v23 = v7;
        uint64_t v24 = v9;
        id v16 = v15;
        [v16 findContact:v14 completion:v17];
      }

      else
      {
        ++self->_irkMetrics.requestsIgnored;
        ++self->_irkMetrics.requestsIgnoredSelfIdentReq;
        self->_sendIRKMetricsReport = 1;
        if (dword_100132930 <= 30
          && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
        {
          LogPrintF( &dword_100132930,  "-[RPPeopleDaemon receivedFriendIdentityRequest:msgCtx:]",  30LL,  "Ignoring friend identity request from ourself\n");
        }
      }
    }

    else
    {
      *(int32x2_t *)&self->_irkMetrics.int requestsIgnored = vadd_s32( *(int32x2_t *)&self->_irkMetrics.requestsIgnored,  (int32x2_t)0x100000001LL);
      self->_sendIRKMetricsReport = 1;
      if (dword_100132930 <= 60
        && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 60LL)))
      {
        LogPrintF( &dword_100132930,  "-[RPPeopleDaemon receivedFriendIdentityRequest:msgCtx:]",  60LL,  "### Ignoring friend identity request with no IDS device ID\n");
      }
    }
  }

  else
  {
    if (dword_100132930 <= 30
      && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
    {
      LogPrintF( &dword_100132930,  "-[RPPeopleDaemon receivedFriendIdentityRequest:msgCtx:]",  30LL,  "Buffering friend identity request before FirstUnlock: '%{mask}'\n",  v8);
    }

    -[RPPeopleDaemon _bufferCloudMessage:frameType:msgCtx:](self, "_bufferCloudMessage:frameType:msgCtx:", v6, 64LL, v7);
  }
}

- (void)receivedFriendIdentityResponse:(id)a3 msgCtx:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 appleID]);
  if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
  {
    CFTypeID TypeID = CFStringGetTypeID();
    uint64_t TypedValue = CFDictionaryGetTypedValue(v6, @"_idsID", TypeID, 0LL);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
    if (v11)
    {
      double v12 = self->_friendAccountIdentityMap;
      if (v12)
      {
        BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[RPPeopleDaemon _primaryAppleID:](self, "_primaryAppleID:", 0LL));
        if ([v13 caseInsensitiveCompare:v8])
        {
          id v14 = objc_alloc_init(off_1001329B8());
          [v14 setEmailAddress:v8];
          [v14 setPhoneNumber:v8];
          id v15 = objc_alloc_init(off_1001329A8());
          [v15 setDispatchQueue:self->_dispatchQueue];
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472LL;
          v17[2] = sub_10008DD80;
          v17[3] = &unk_1001146A8;
          id v18 = v15;
          signed int v19 = v8;
          int v20 = v11;
          unsigned int v21 = v12;
          id v22 = self;
          id v23 = v6;
          id v16 = v15;
          [v16 findContact:v14 completion:v17];
        }

        else if (dword_100132930 <= 30 {
               && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
        }
        {
          LogPrintF( &dword_100132930,  "-[RPPeopleDaemon receivedFriendIdentityResponse:msgCtx:]",  30LL,  "Ignoring friend identity response from ourself\n");
        }
      }

      else
      {
        if (dword_100132930 <= 30
          && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
        {
          LogPrintF( &dword_100132930,  "-[RPPeopleDaemon receivedFriendIdentityResponse:msgCtx:]",  30LL,  "Buffering friend identity response before ready: '%{mask}'\n",  v8);
        }

        -[RPPeopleDaemon _bufferCloudMessage:frameType:msgCtx:]( self,  "_bufferCloudMessage:frameType:msgCtx:",  v6,  65LL,  v7);
      }
    }

    else if (dword_100132930 <= 60 {
           && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 60LL)))
    }
    {
      LogPrintF( &dword_100132930,  "-[RPPeopleDaemon receivedFriendIdentityResponse:msgCtx:]",  60LL,  "### Ignoring friend identity response with no IDS device ID\n");
    }
  }

  else
  {
    if (dword_100132930 <= 30
      && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
    {
      LogPrintF( &dword_100132930,  "-[RPPeopleDaemon receivedFriendIdentityResponse:msgCtx:]",  30LL,  "Buffering friend identity response before FirstUnlock: '%{mask}'\n",  v8);
    }

    -[RPPeopleDaemon _bufferCloudMessage:frameType:msgCtx:](self, "_bufferCloudMessage:frameType:msgCtx:", v6, 65LL, v7);
  }
}

- (void)receivedFriendIdentityUpdate:(id)a3 msgCtx:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 appleID]);
  if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
  {
    CFTypeID TypeID = CFStringGetTypeID();
    uint64_t TypedValue = CFDictionaryGetTypedValue(v6, @"_idsID", TypeID, 0LL);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
    if (v11)
    {
      double v12 = self->_friendAccountIdentityMap;
      if (v12)
      {
        BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[RPPeopleDaemon _primaryAppleID:](self, "_primaryAppleID:", 0LL));
        if ([v13 caseInsensitiveCompare:v8])
        {
          id v14 = objc_alloc_init(off_1001329B8());
          [v14 setEmailAddress:v8];
          [v14 setPhoneNumber:v8];
          id v15 = objc_alloc_init(off_1001329A8());
          [v15 setDispatchQueue:self->_dispatchQueue];
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472LL;
          v17[2] = sub_10008E29C;
          v17[3] = &unk_1001146D0;
          id v18 = v15;
          signed int v19 = v8;
          int v20 = v11;
          unsigned int v21 = self;
          id v22 = v6;
          id v16 = v15;
          [v16 findContact:v14 completion:v17];
        }

        else if (dword_100132930 <= 30 {
               && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
        }
        {
          LogPrintF( &dword_100132930,  "-[RPPeopleDaemon receivedFriendIdentityUpdate:msgCtx:]",  30LL,  "Ignoring friend identity update from ourself\n");
        }
      }

      else
      {
        if (dword_100132930 <= 30
          && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
        {
          LogPrintF( &dword_100132930,  "-[RPPeopleDaemon receivedFriendIdentityUpdate:msgCtx:]",  30LL,  "Buffering friend identity update before ready: '%{mask}'\n",  v8);
        }

        -[RPPeopleDaemon _bufferCloudMessage:frameType:msgCtx:]( self,  "_bufferCloudMessage:frameType:msgCtx:",  v6,  66LL,  v7);
      }
    }

    else if (dword_100132930 <= 60 {
           && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 60LL)))
    }
    {
      LogPrintF( &dword_100132930,  "-[RPPeopleDaemon receivedFriendIdentityUpdate:msgCtx:]",  60LL,  "### Ignoring friend identity update with no IDS device ID\n");
    }
  }

  else
  {
    if (dword_100132930 <= 30
      && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
    {
      LogPrintF( &dword_100132930,  "-[RPPeopleDaemon receivedFriendIdentityUpdate:msgCtx:]",  30LL,  "Buffering friend identity update before FirstUnlock: '%{mask}'\n",  v8);
    }

    -[RPPeopleDaemon _bufferCloudMessage:frameType:msgCtx:](self, "_bufferCloudMessage:frameType:msgCtx:", v6, 66LL, v7);
  }
}

- (void)_bufferCloudMessage:(id)a3 frameType:(unsigned __int8)a4 msgCtx:(id)a5
{
  uint64_t v6 = a4;
  id v16 = a3;
  id v8 = a5;
  id v9 = -[NSMutableArray count](self->_bufferedCloudMessages, "count");
  if ((unint64_t)v9 < 0x64)
  {
    double v12 = objc_alloc_init(&OBJC_CLASS___RPBufferedCloudMessage);
    -[RPBufferedCloudMessage setFrameType:](v12, "setFrameType:", v6);
    -[RPBufferedCloudMessage setMessage:](v12, "setMessage:", v16);
    -[RPBufferedCloudMessage setMsgCtx:](v12, "setMsgCtx:", v8);
    bufferedCloudMessages = self->_bufferedCloudMessages;
    if (!bufferedCloudMessages)
    {
      id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      id v15 = self->_bufferedCloudMessages;
      self->_bufferedCloudMessages = v14;

      bufferedCloudMessages = self->_bufferedCloudMessages;
    }

    -[NSMutableArray addObject:](bufferedCloudMessages, "addObject:", v12);
    goto LABEL_40;
  }

  if (dword_100132930 <= 60)
  {
    id v10 = v9;
    if (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 60LL))
    {
      if ((int)v6 <= 47)
      {
        id v11 = "Invalid";
        switch((int)v6)
        {
          case 0:
            goto LABEL_39;
          case 1:
            id v11 = "NoOp";
            break;
          case 3:
            id v11 = "PS_Start";
            break;
          case 4:
            id v11 = "PS_Next";
            break;
          case 5:
            id v11 = "PV_Start";
            break;
          case 6:
            id v11 = "PV_Next";
            break;
          case 7:
            id v11 = "U_OPACK";
            break;
          case 8:
            id v11 = "E_OPACK";
            break;
          case 9:
            id v11 = "P_OPACK";
            break;
          case 10:
            id v11 = "PA_Req";
            break;
          case 11:
            id v11 = "PA_Rsp";
            break;
          case 16:
            id v11 = "SessionStartRequest";
            break;
          case 17:
            id v11 = "SessionStartResponse";
            break;
          case 18:
            id v11 = "SessionData";
            break;
          case 32:
            id v11 = "FamilyIdentityRequest";
            break;
          case 33:
            id v11 = "FamilyIdentityResponse";
            break;
          case 34:
            id v11 = "FamilyIdentityUpdate";
            break;
          default:
            goto LABEL_38;
        }

        goto LABEL_39;
      }

      if ((int)v6 <= 63)
      {
        if ((_DWORD)v6 == 48)
        {
          id v11 = "WatchIdentityRequest";
          goto LABEL_39;
        }

        if ((_DWORD)v6 == 49)
        {
          id v11 = "WatchIdentityResponse";
          goto LABEL_39;
        }
      }

      else
      {
        switch((_DWORD)v6)
        {
          case '@':
            id v11 = "FriendIdentityRequest";
            goto LABEL_39;
          case 'A':
            id v11 = "FriendIdentityResponse";
            goto LABEL_39;
          case 'B':
            id v11 = "FriendIdentityUpdate";
LABEL_39:
            double v12 = (RPBufferedCloudMessage *)objc_claimAutoreleasedReturnValue([v8 appleID]);
            LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _bufferCloudMessage:frameType:msgCtx:]",  60LL,  "### Dropping cloud message at max (%zu): %s, '%{mask}'\n",  v10,  v11,  v12);
LABEL_40:

            goto LABEL_41;
        }
      }

- (void)_processBufferedCloudMessages
{
  if (-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked")
    && self->_familyAccountIdentityMap
    && -[NSMutableArray count](self->_bufferedCloudMessages, "count"))
  {
    if (dword_100132930 <= 30
      && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
    {
      LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _processBufferedCloudMessages]",  30LL,  "Processing buffered cloud messages: %d\n",  -[NSMutableArray count](self->_bufferedCloudMessages, "count"));
    }

    uint64_t v3 = self->_bufferedCloudMessages;
    bufferedCloudMessages = self->_bufferedCloudMessages;
    self->_bufferedCloudMessages = 0LL;

    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    double v5 = v3;
    id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        id v9 = 0LL;
        do
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)v9);
          int v11 = [v10 frameType];
          if (v11 > 63)
          {
            switch(v11)
            {
              case '@':
                double v12 = (void *)objc_claimAutoreleasedReturnValue([v10 message]);
                BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v10 msgCtx]);
                -[RPPeopleDaemon receivedFriendIdentityRequest:msgCtx:]( self,  "receivedFriendIdentityRequest:msgCtx:",  v12,  v13);
                goto LABEL_26;
              case 'A':
                double v12 = (void *)objc_claimAutoreleasedReturnValue([v10 message]);
                BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v10 msgCtx]);
                -[RPPeopleDaemon receivedFriendIdentityResponse:msgCtx:]( self,  "receivedFriendIdentityResponse:msgCtx:",  v12,  v13);
                goto LABEL_26;
              case 'B':
                double v12 = (void *)objc_claimAutoreleasedReturnValue([v10 message]);
                BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v10 msgCtx]);
                -[RPPeopleDaemon receivedFriendIdentityUpdate:msgCtx:]( self,  "receivedFriendIdentityUpdate:msgCtx:",  v12,  v13);
                goto LABEL_26;
            }
          }

          else
          {
            switch(v11)
            {
              case ' ':
                double v12 = (void *)objc_claimAutoreleasedReturnValue([v10 message]);
                BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v10 msgCtx]);
                -[RPPeopleDaemon receivedFamilyIdentityRequest:msgCtx:]( self,  "receivedFamilyIdentityRequest:msgCtx:",  v12,  v13);
                goto LABEL_26;
              case '!':
                double v12 = (void *)objc_claimAutoreleasedReturnValue([v10 message]);
                BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v10 msgCtx]);
                -[RPPeopleDaemon receivedFamilyIdentityResponse:msgCtx:]( self,  "receivedFamilyIdentityResponse:msgCtx:",  v12,  v13);
                goto LABEL_26;
              case '""':
                double v12 = (void *)objc_claimAutoreleasedReturnValue([v10 message]);
                BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v10 msgCtx]);
                -[RPPeopleDaemon receivedFamilyIdentityUpdate:msgCtx:]( self,  "receivedFamilyIdentityUpdate:msgCtx:",  v12,  v13);
LABEL_26:

                goto LABEL_27;
            }
          }

          if (dword_100132930 <= 90
            && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 90LL)))
          {
            LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _processBufferedCloudMessages]",  90,  "### Unknown buffered message frame type: %d\n",  [v10 frameType]);
          }

- (BOOL)_sendCloudIdentityFrameType:(unsigned __int8)a3 destinationID:(id)a4 flags:(unsigned int)a5 msgCtx:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = a3;
  id v10 = a4;
  id v11 = a6;
  if (dword_100132930 <= 30 && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
  {
    if ((int)v8 <= 47)
    {
      double v12 = "Invalid";
      switch((int)v8)
      {
        case 0:
          goto LABEL_35;
        case 1:
          double v12 = "NoOp";
          break;
        case 3:
          double v12 = "PS_Start";
          break;
        case 4:
          double v12 = "PS_Next";
          break;
        case 5:
          double v12 = "PV_Start";
          break;
        case 6:
          double v12 = "PV_Next";
          break;
        case 7:
          double v12 = "U_OPACK";
          break;
        case 8:
          double v12 = "E_OPACK";
          break;
        case 9:
          double v12 = "P_OPACK";
          break;
        case 10:
          double v12 = "PA_Req";
          break;
        case 11:
          double v12 = "PA_Rsp";
          break;
        case 16:
          double v12 = "SessionStartRequest";
          break;
        case 17:
          double v12 = "SessionStartResponse";
          break;
        case 18:
          double v12 = "SessionData";
          break;
        case 32:
          double v12 = "FamilyIdentityRequest";
          break;
        case 33:
          double v12 = "FamilyIdentityResponse";
          break;
        case 34:
          double v12 = "FamilyIdentityUpdate";
          break;
        default:
          goto LABEL_34;
      }

      goto LABEL_35;
    }

    if ((int)v8 <= 63)
    {
      if ((_DWORD)v8 == 48)
      {
        double v12 = "WatchIdentityRequest";
        goto LABEL_35;
      }

      if ((_DWORD)v8 == 49)
      {
        double v12 = "WatchIdentityResponse";
        goto LABEL_35;
      }
    }

    else
    {
      switch((_DWORD)v8)
      {
        case '@':
          double v12 = "FriendIdentityRequest";
          goto LABEL_35;
        case 'A':
          double v12 = "FriendIdentityResponse";
          goto LABEL_35;
        case 'B':
          double v12 = "FriendIdentityUpdate";
LABEL_35:
          LogPrintF( &dword_100132930,  "-[RPPeopleDaemon _sendCloudIdentityFrameType:destinationID:flags:msgCtx:]",  30LL,  "Send identity request: %s, '%{mask}'\n",  v12,  v10);
          goto LABEL_36;
      }
    }

- (unsigned)_updateIdentityType:(int)a3 idsDeviceID:(id)a4 appleID:(id)a5 contactID:(id)a6 msg:(id)a7
{
  uint64_t v10 = *(void *)&a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if ((_DWORD)v10 == 4)
  {
    __int128 v16 = "Family";
    uint64_t v17 = 15LL;
    goto LABEL_5;
  }

  if ((_DWORD)v10 == 6)
  {
    __int128 v16 = "Friend";
    uint64_t v17 = 21LL;
LABEL_5:
    location = (id *)&(&self->super.isa)[v17];
    v87 = self;
    v88 = (&self->super.isa)[v17];
    uint64_t v18 = objc_claimAutoreleasedReturnValue(-[objc_class objectForKeyedSubscript:](v88, "objectForKeyedSubscript:", v12));
    v89 = v14;
    if (v18)
    {
      signed int v19 = (RPIdentity *)v18;
      unsigned int v20 = 0;
    }

    else
    {
      signed int v19 = objc_alloc_init(&OBJC_CLASS___RPIdentity);
      -[RPIdentity setIdentifier:](v19, "setIdentifier:", v12);
      -[RPIdentity setType:](v19, "setType:", v10);
      unsigned int v20 = 2048;
    }

    if ([v13 length])
    {
      id v21 = (id)objc_claimAutoreleasedReturnValue(-[RPIdentity accountID](v19, "accountID"));
      id v22 = v13;
      id v23 = v22;
      if (v21 == v22)
      {

        goto LABEL_19;
      }

      if ((v22 != 0LL) == (v21 == 0LL))
      {
      }

      else
      {
        unsigned __int8 v24 = [v21 isEqual:v22];

        if ((v24 & 1) != 0) {
          goto LABEL_19;
        }
      }

      -[RPIdentity setAccountID:](v19, "setAccountID:", v23);
      v20 |= 0x2000u;
    }

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v6 = -[RPPeopleXPCConnection initWithDaemon:xpcCnx:]( objc_alloc(&OBJC_CLASS___RPPeopleXPCConnection),  "initWithDaemon:xpcCnx:",  self,  v5);
  -[RPPeopleXPCConnection setDispatchQueue:](v6, "setDispatchQueue:", self->_dispatchQueue);
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    id v9 = self->_xpcConnections;
    self->_xpcConnections = v8;

    xpcConnections = self->_xpcConnections;
  }

  -[NSMutableSet addObject:](xpcConnections, "addObject:", v6);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___RPPeopleXPCDaemonInterface));
  id v11 = objc_alloc(&OBJC_CLASS___NSSet);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSArray, v12, v13);
  uint64_t v17 = -[NSSet initWithObjects:](v11, "initWithObjects:", v14, objc_opt_class(&OBJC_CLASS___RPPerson, v15, v16), 0LL);
  [v10 setClasses:v17 forSelector:"xpcPeopleDiscoveryActivate:completion:" argumentIndex:0 ofReply:1];

  [v5 _setQueue:self->_dispatchQueue];
  [v5 setExportedInterface:v10];
  [v5 setExportedObject:v6];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10008F850;
  v20[3] = &unk_100111968;
  v20[4] = self;
  v20[5] = v6;
  [v5 setInvalidationHandler:v20];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___RPPeopleXPCClientInterface));
  [v5 setRemoteObjectInterface:v18];

  [v5 resume];
  if (dword_100132930 <= 20 && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 20LL))) {
    LogPrintF( &dword_100132930,  "-[RPPeopleDaemon listener:shouldAcceptNewConnection:]",  20,  "XPC connection started from %#{pid}\n",  [v5 processIdentifier]);
  }

  return 1;
}

- (void)_xpcConnectionInvalidated:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  [v5 connectionInvalidated];
  -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v5);

  -[RPPeopleDaemon _update](self, "_update");
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
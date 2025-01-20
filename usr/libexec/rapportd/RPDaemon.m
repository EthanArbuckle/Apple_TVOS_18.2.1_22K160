@interface RPDaemon
+ (id)sharedDaemon;
- (BOOL)diagnosticCommand:(id)a3 params:(id)a4;
- (BOOL)languageChangePending;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)sigTermPending;
- (OS_dispatch_queue)dispatchQueue;
- (RPDaemon)init;
- (id)descriptionWithLevel:(int)a3;
- (id)keychainStateString;
- (unint64_t)errorFlags;
- (void)_metricsSubmissionSetup;
- (void)_prefsChanged;
- (void)_updateErrorFlags;
- (void)_xpcPublisherAction:(unsigned int)a3 token:(unint64_t)a4 event:(id)a5;
- (void)_xpcPublisherAddToken:(unint64_t)a3 event:(id)a4;
- (void)_xpcPublisherRemoveToken:(unint64_t)a3;
- (void)_xpcPublisherStateChangedForToken:(unint64_t)a3 state:(BOOL)a4;
- (void)_xpcPublisherTriggeredReply:(id)a3 token:(unint64_t)a4 responseHandler:(id)a5;
- (void)_xpcPublisherTriggeredToken:(unint64_t)a3 payload:(id)a4 responseHandler:(id)a5;
- (void)activate;
- (void)invalidate;
- (void)postDaemonInfoChanges:(unint64_t)a3;
- (void)setDispatchQueue:(id)a3;
@end

@implementation RPDaemon

+ (id)sharedDaemon
{
  if (qword_1001332E0 != -1) {
    dispatch_once(&qword_1001332E0, &stru_100112900);
  }
  return (id)qword_1001332D8;
}

- (RPDaemon)init
{
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___RPDaemon;
  v2 = -[RPDaemon init](&v28, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v3->_languageChangedNotifier = -1;
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    subDaemons = v3->_subDaemons;
    v3->_subDaemons = v4;

    v6 = v3->_subDaemons;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
    -[NSMutableArray addObject:](v6, "addObject:", v7);

    v8 = v3->_subDaemons;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[RPCompanionLinkDaemon sharedCompanionLinkDaemon]( &OBJC_CLASS___RPCompanionLinkDaemon,  "sharedCompanionLinkDaemon"));
    -[NSMutableArray addObject:](v8, "addObject:", v9);

    v10 = v3->_subDaemons;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](&OBJC_CLASS___RPCloudDaemon, "sharedCloudDaemon"));
    -[NSMutableArray addObject:](v10, "addObject:", v11);

    v12 = v3->_subDaemons;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[RPNearFieldDaemon sharedNearFieldDaemon](&OBJC_CLASS___RPNearFieldDaemon, "sharedNearFieldDaemon"));
    -[NSMutableArray addObject:](v12, "addObject:", v13);

    v14 = v3->_subDaemons;
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[RPNearbyInvitationDaemon sharedInvitationDaemon]( &OBJC_CLASS___RPNearbyInvitationDaemon,  "sharedInvitationDaemon"));
    -[NSMutableArray addObject:](v14, "addObject:", v15);

    v16 = v3->_subDaemons;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[RPPeopleDaemon sharedPeopleDaemon](&OBJC_CLASS___RPPeopleDaemon, "sharedPeopleDaemon"));
    -[NSMutableArray addObject:](v16, "addObject:", v17);

    v18 = v3->_subDaemons;
    v19 = objc_alloc_init(&OBJC_CLASS___RPRemoteDisplayDaemon);
    -[NSMutableArray addObject:](v18, "addObject:", v19);

    v20 = v3->_subDaemons;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[RPPrivateDaemon sharedPrivateDaemon](&OBJC_CLASS___RPPrivateDaemon, "sharedPrivateDaemon"));
    -[NSMutableArray addObject:](v20, "addObject:", v21);

    v22 = v3->_subDaemons;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent sharedNetworkAgent](&OBJC_CLASS___RPNWNetworkAgent, "sharedNetworkAgent"));
    -[NSMutableArray addObject:](v22, "addObject:", v23);

    v24 = v3->_subDaemons;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[RPStatusDaemon sharedStatusDaemon](&OBJC_CLASS___RPStatusDaemon, "sharedStatusDaemon"));
    -[NSMutableArray addObject:](v24, "addObject:", v25);

    -[RPDaemon _metricsSubmissionSetup](v3, "_metricsSubmissionSetup");
    v26 = v3;
  }

  return v3;
}

- (void)_metricsSubmissionSetup
{
  dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
  dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_BACKGROUND, 0);
  attr = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);

  v6 = (OS_dispatch_queue *)dispatch_queue_create("RPMetricsSubmission", attr);
  metricsReportQueue = self->_metricsReportQueue;
  self->_metricsReportQueue = v6;

  v8 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_metricsReportQueue);
  metricsReportTimer = self->_metricsReportTimer;
  self->_metricsReportTimer = v8;

  dispatch_source_set_event_handler((dispatch_source_t)self->_metricsReportTimer, &stru_100112920);
  CUDispatchTimerSet(self->_metricsReportTimer, 86400.0, 86400.0, -4.0);
  dispatch_resume((dispatch_object_t)self->_metricsReportTimer);
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v4 = a3;
  BOOL v67 = sub_10000AA20();
  __int128 v100 = 0u;
  __int128 v101 = 0u;
  __int128 v102 = 0u;
  __int128 v103 = 0u;
  v66 = self;
  dispatch_queue_attr_t v5 = self->_subDaemons;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v100,  v108,  16LL);
  if (v6)
  {
    id v9 = v6;
    v10 = 0LL;
    uint64_t v11 = *(void *)v101;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v101 != v11) {
          objc_enumerationMutation(v5);
        }
        uint64_t v13 = *(void *)(*((void *)&v100 + 1) + 8LL * (void)i);
        uint64_t v14 = objc_opt_class(&OBJC_CLASS___RPIdentityDaemon, v7, v8);
        if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0)
        {
          id v99 = v10;
          uint64_t v15 = CUDescriptionWithLevel(v13, v4);
          v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
          NSAppendPrintF(&v99, "%@\n", v16);
          id v17 = v99;

          v10 = v17;
        }
      }

      id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v100,  v108,  16LL);
    }

    while (v9);
  }

  else
  {
    v10 = 0LL;
  }

  uint64_t v18 = objc_claimAutoreleasedReturnValue(+[RPMetrics sharedMetricsNoCreate](&OBJC_CLASS___RPMetrics, "sharedMetricsNoCreate"));
  v65 = (void *)v18;
  if (v4 <= 0x13 && v18)
  {
    id v98 = v10;
    uint64_t v19 = CUDescriptionWithLevel(v18, v4);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    NSAppendPrintF(&v98, "%@\n", v20);
    id v21 = v98;

    v10 = v21;
  }

  id v97 = v10;
  NSAppendPrintF(&v97, "-- Daemon XPC Cnx: %d --\n", -[NSMutableSet count](v66->_xpcConnections, "count"));
  id v22 = v97;

  __int128 v95 = 0u;
  __int128 v96 = 0u;
  __int128 v93 = 0u;
  __int128 v94 = 0u;
  obj = v66->_xpcConnections;
  id v70 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v93,  v107,  16LL);
  if (v70)
  {
    uint64_t v69 = *(void *)v94;
    do
    {
      for (j = 0LL; j != v70; j = (char *)j + 1)
      {
        if (*(void *)v94 != v69) {
          objc_enumerationMutation(obj);
        }
        v24 = *(void **)(*((void *)&v93 + 1) + 8LL * (void)j);
        id v92 = v22;
        v25 = (void *)objc_claimAutoreleasedReturnValue([v24 xpcCnx]);
        NSAppendPrintF(&v92, "%#{pid}", [v25 processIdentifier]);
        id v26 = v92;

        v27 = (void *)objc_claimAutoreleasedReturnValue([v24 assertions]);
        if ([v27 count])
        {
          id v91 = v26;
          NSAppendPrintF(&v91, ", assertions <");
          id v28 = v91;

          __int128 v89 = 0u;
          __int128 v90 = 0u;
          __int128 v87 = 0u;
          __int128 v88 = 0u;
          id v71 = v27;
          id v29 = v27;
          id v30 = [v29 countByEnumeratingWithState:&v87 objects:v106 count:16];
          if (v30)
          {
            id v31 = v30;
            uint64_t v32 = *(void *)v88;
            v33 = "";
            do
            {
              v34 = 0LL;
              v35 = v28;
              do
              {
                if (*(void *)v88 != v32) {
                  objc_enumerationMutation(v29);
                }
                uint64_t v36 = *(void *)(*((void *)&v87 + 1) + 8LL * (void)v34);
                id v86 = v35;
                NSAppendPrintF(&v86, "%s%@", v33, v36);
                id v28 = v86;

                v34 = (char *)v34 + 1;
                v33 = " ";
                v35 = v28;
              }

              while (v31 != v34);
              id v31 = [v29 countByEnumeratingWithState:&v87 objects:v106 count:16];
              v33 = " ";
            }

            while (v31);
          }

          id v85 = v28;
          NSAppendPrintF(&v85, ">");
          id v26 = v85;

          v27 = v71;
        }

        id v84 = v26;
        NSAppendPrintF(&v84, "\n");
        id v22 = v84;
      }

      id v70 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v93,  v107,  16LL);
    }

    while (v70);
  }

  unint64_t errorFlags = v66->_errorFlags;
  if (errorFlags)
  {
    id v83 = v22;
    NSAppendPrintF(&v83, "\nError Flags: %#ll{flags}\n", errorFlags, &unk_100109FC0);
    id v38 = v83;

    id v22 = v38;
  }

  v39 = objc_alloc(&OBJC_CLASS___NSSet);
  v40 = (void *)CFPrefs_CopyKeys(@"com.apple.rapport", 0LL);
  v41 = -[NSSet initWithArray:](v39, "initWithArray:", v40);

  v42 = -[NSMutableSet initWithSet:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithSet:", v41);
  v105[0] = @"btPipeEnabled";
  v105[1] = @"cloudDiscovery";
  v105[2] = @"clBLEClient";
  v105[3] = @"clMeDeviceIsMeOverride";
  v105[4] = @"clClientEnabled";
  v105[5] = @"clHomeKit";
  v105[6] = @"clMaxConnectionCount";
  v105[7] = @"clServerBonjourAlways";
  v105[8] = @"clServerEnabled";
  v105[9] = @"familySyncedName";
  v105[10] = @"ftCompress";
  v105[11] = @"ftLargeFileBufferBytes";
  v105[12] = @"ftLargeFileMaxOutstanding";
  v105[13] = @"ftLargeFileMaxTasks";
  v105[14] = @"ftSmallFilesMaxBytes";
  v105[15] = @"ftSmallFilesMaxTasks";
  v105[16] = @"frPruneAccountSecs";
  v105[17] = @"frPruneLastSecs";
  v105[18] = @"frRefreshMax";
  v105[19] = @"frRefreshMin";
  v105[20] = @"frMaxReachedLastSecs";
  v105[21] = @"frSuggestMax";
  v105[22] = @"frSuggestPollSecs";
  v105[23] = @"frSyncDelaySecs";
  v105[24] = @"hasAppleTVForce";
  v105[25] = @"hasHomePodForce";
  v105[26] = @"hasMacForce";
  v105[27] = @"hidEnabled";
  v105[28] = @"idFamilyResolve";
  v105[29] = @"idFriendResolve";
  v105[30] = @"idOwnerResolve";
  v105[31] = @"idPairedResolve";
  v105[32] = @"idSharedHomeResolve";
  v105[33] = @"idsEnabled";
  v105[34] = @"ignoreCompanionLinkChecks";
  v105[35] = @"ignoreRemoteDisplayChecks";
  v105[36] = @"ipEnabled";
  v105[37] = @"isSignedInForce";
  v105[38] = @"liveAudioEnabled";
  v105[39] = @"mcEnabled";
  v105[40] = @"metricsEnabled";
  v105[41] = @"applyNoiWiFiToUSB";
  v105[42] = @"pdFamily";
  v105[43] = @"pdFriends";
  v105[44] = @"pdFriendSyncStart";
  v105[45] = @"pdPrivacyCoalesceMin";
  v105[46] = @"pdPrivacyCoalesceMax";
  v105[47] = @"pdPTSBurstActionScanSecs";
  v105[48] = @"pdPTSBurstInfoScanSecs";
  v105[49] = @"pdRanging";
  v105[50] = @"pdStrangers";
  v105[51] = @"pdTrackWhileAsleep";
  v105[52] = @"rdBLEClient";
  v105[53] = @"rdBLEServer";
  v105[54] = @"rdClientEnabled";
  v105[55] = @"rdHomeKit";
  v105[56] = @"rdNoInfra";
  v105[57] = @"rdServerBonjourInfra";
  v105[58] = @"rdServerEnabled";
  v105[59] = @"siriEnabled";
  v105[60] = @"textInputEnabled";
  v105[61] = @"touchEnabled";
  v105[62] = @"uiNotes";
  v105[63] = @"useTargetAuthTag";
  v105[64] = @"xpcMatchingTestMode";
  v105[65] = @"nearFieldSeverDiscoveryEnabled";
  v105[66] = @"sendActivityLevelOverInfra";
  v105[67] = @"oneTimeDateRequestedResetCompleted";
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v105, 68LL));
  -[NSMutableSet addObjectsFromArray:](v42, "addObjectsFromArray:", v43);

  __int128 v81 = 0u;
  __int128 v82 = 0u;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  v72 = v42;
  id v44 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v72,  "countByEnumeratingWithState:objects:count:",  &v79,  v104,  16LL);
  if (v44)
  {
    id v45 = v44;
    int v46 = 0;
    uint64_t v47 = *(void *)v80;
    do
    {
      for (k = 0LL; k != v45; k = (char *)k + 1)
      {
        if (*(void *)v80 != v47) {
          objc_enumerationMutation(v72);
        }
        uint64_t v49 = *(void *)(*((void *)&v79 + 1) + 8LL * (void)k);
        unsigned __int8 v52 = -[NSSet containsObject:](v41, "containsObject:", v49);
        if (!v46)
        {
          id v78 = v22;
          NSAppendPrintF(&v78, "\n");
          id v53 = v78;

          id v22 = v53;
        }

        uint64_t v54 = objc_opt_class(&OBJC_CLASS___NSString, v50, v51);
        if ((objc_opt_isKindOfClass(v49, v54) & 1) != 0)
        {
          int v77 = 0;
          uint64_t v55 = CFPrefs_CopyTypedValue(@"com.apple.rapport", v49, 0LL, &v77);
          v56 = (void *)v55;
          if ((v52 & 1) != 0)
          {
            if (v67)
            {
              id v74 = v22;
              uint64_t v61 = v49;
              v57 = &v74;
              NSAppendPrintF(&v74, "Pref: '%@' = '%@'\n", v61, v55);
            }

            else
            {
              id v73 = v22;
              uint64_t v63 = v49;
              v57 = &v73;
              NSAppendPrintF(&v73, "Pref: '%@' = '%~@'\n", v63, v55);
            }

            goto LABEL_49;
          }

          if (v77 != -6727)
          {
            if (v67)
            {
              id v76 = v22;
              uint64_t v62 = v49;
              v57 = &v76;
              NSAppendPrintF(&v76, "Pref (profile): '%@' = '%@'\n", v62, v55);
            }

            else
            {
              id v75 = v22;
              uint64_t v64 = v49;
              v57 = &v75;
              NSAppendPrintF(&v75, "Pref (profile): '%@' = '%~@'\n", v64, v55);
            }

- (void)activate
{
  uint64_t Int64 = CFPrefs_GetInt64(@"com.apple.rapport", @"xpcMatchingTestMode", 0LL);
  BOOL v4 = Int64 != 0;
  if (self->_prefXPCMatchingTestMode != v4)
  {
    if (dword_100131820 <= 40)
    {
      uint64_t v5 = Int64;
      if (dword_100131820 != -1 || _LogCategory_Initialize(&dword_100131820, 40LL))
      {
        id v6 = "yes";
        if (v5) {
          uint64_t v7 = "no";
        }
        else {
          uint64_t v7 = "yes";
        }
        if (!v5) {
          id v6 = "no";
        }
        LogPrintF(&dword_100131820, "-[RPDaemon activate]", 40LL, "XPC matching test mode enabled: %s -> %s\n", v7, v6);
      }
    }

    self->_prefXPCMatchingTestMode = v4;
  }

  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  uint64_t v8 = self->_subDaemons;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v44,  v48,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v45;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v45 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
        [v13 setDispatchQueue:self->_dispatchQueue];
        [v13 activate];
      }

      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v44,  v48,  16LL);
    }

    while (v10);
  }

  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100044D94;
  block[3] = &unk_1001110A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
  if (self->_languageChangedNotifier == -1)
  {
    uint64_t v15 = (dispatch_queue_s *)self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100044D9C;
    handler[3] = &unk_1001115C8;
    handler[4] = self;
    notify_register_dispatch("com.apple.language.changed", &self->_languageChangedNotifier, v15, handler);
  }

  if (!self->_sigTermSource)
  {
    v16 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_signal,  0xFuLL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    sigTermSource = self->_sigTermSource;
    self->_sigTermSource = v16;

    uint64_t v18 = self->_sigTermSource;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_100044E30;
    v41[3] = &unk_1001110A8;
    v41[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v18, v41);
    dispatch_resume((dispatch_object_t)self->_sigTermSource);
  }

  if (!self->_systemMonitor)
  {
    uint64_t v19 = objc_alloc_init(&OBJC_CLASS___CUSystemMonitor);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v19;

    -[CUSystemMonitor setDispatchQueue:](self->_systemMonitor, "setDispatchQueue:", self->_dispatchQueue);
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_100044EA8;
    v40[3] = &unk_1001110A8;
    v40[4] = self;
    -[CUSystemMonitor setManateeChangedHandler:](self->_systemMonitor, "setManateeChangedHandler:", v40);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_100044F18;
    v39[3] = &unk_1001110A8;
    v39[4] = self;
    -[CUSystemMonitor setPrimaryAppleIDChangedHandler:](self->_systemMonitor, "setPrimaryAppleIDChangedHandler:", v39);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_100044F88;
    v38[3] = &unk_1001110A8;
    v38[4] = self;
    -[CUSystemMonitor setWifiStateChangedHandler:](self->_systemMonitor, "setWifiStateChangedHandler:", v38);
    id v21 = self->_systemMonitor;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_100044FF8;
    v37[3] = &unk_1001110A8;
    v37[4] = self;
    -[CUSystemMonitor activateWithCompletion:](v21, "activateWithCompletion:", v37);
  }

  if (!self->_xpcEventsRegistered)
  {
    id v22 = (dispatch_queue_s *)self->_dispatchQueue;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_100045000;
    v36[3] = &unk_100112948;
    v36[4] = self;
    xpc_set_event_stream_handler("com.apple.notifyd.matching", v22, v36);
    self->_xpcEventsRegistered = 1;
  }

  if (!self->_xpcListener)
  {
    v23 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.rapport");
    xpcListener = self->_xpcListener;
    self->_xpcListener = v23;

    -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
    -[NSXPCListener _setQueue:](self->_xpcListener, "_setQueue:", self->_dispatchQueue);
    -[NSXPCListener resume](self->_xpcListener, "resume");
  }

  if (!self->_xpcPublisher)
  {
    uint64_t v25 = xpc_event_publisher_create("com.apple.rapport.matching", self->_dispatchQueue);
    id v26 = (OS_xpc_event_publisher *)objc_claimAutoreleasedReturnValue(v25);
    xpcPublisher = self->_xpcPublisher;
    self->_xpcPublisher = v26;

    id v28 = self->_xpcPublisher;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_100045110;
    v35[3] = &unk_100112970;
    v35[4] = self;
    xpc_event_publisher_set_handler(v28, v35);
    id v29 = self->_xpcPublisher;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_100045130;
    v34[3] = &unk_1001115C8;
    v34[4] = self;
    xpc_event_publisher_set_error_handler(v29, v34);
    xpc_event_publisher_activate(self->_xpcPublisher);
  }

  if (!self->_stateHandleGeneral)
  {
    id v30 = self->_dispatchQueue;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_1000451B4;
    v33[3] = &unk_100112998;
    v33[4] = self;
    self->_stateHandleGeneral = os_state_add_handler(v30, v33);
  }

  if (!self->_stateHandleIdentities) {
    self->_stateHandleIdentities = os_state_add_handler(self->_dispatchQueue, &stru_1001129D8);
  }
  if (!self->_stateHandleKeychain)
  {
    id v31 = self->_dispatchQueue;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_100045220;
    v32[3] = &unk_100112998;
    v32[4] = self;
    self->_stateHandleKeychain = os_state_add_handler(v31, v32);
  }

  if (!self->_stateHandlePrivateDiscovery) {
    self->_stateHandlePrivateDiscovery = os_state_add_handler(self->_dispatchQueue, &stru_1001129F8);
  }
}

- (void)invalidate
{
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  dispatch_queue_attr_t v3 = self->_subDaemons;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v26,  v31,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * (void)i) invalidate];
      }

      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v26,  v31,  16LL);
    }

    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_subDaemons, "removeAllObjects");
  xpcPublisher = self->_xpcPublisher;
  self->_xpcPublisher = 0LL;

  if (self->_stateHandleGeneral)
  {
    os_state_remove_handler();
    self->_stateHandleGeneral = 0LL;
  }

  if (self->_stateHandleIdentities)
  {
    os_state_remove_handler();
    self->_stateHandleIdentities = 0LL;
  }

  if (self->_stateHandleKeychain)
  {
    os_state_remove_handler();
    self->_stateHandleKeychain = 0LL;
  }

  if (self->_stateHandlePrivateDiscovery)
  {
    os_state_remove_handler();
    self->_stateHandlePrivateDiscovery = 0LL;
  }

  int languageChangedNotifier = self->_languageChangedNotifier;
  if (languageChangedNotifier != -1)
  {
    notify_cancel(languageChangedNotifier);
    self->_int languageChangedNotifier = -1;
  }

  sigTermSource = self->_sigTermSource;
  if (sigTermSource)
  {
    uint64_t v11 = sigTermSource;
    dispatch_source_cancel(v11);
    v12 = self->_sigTermSource;
    self->_sigTermSource = 0LL;
  }

  -[CUSystemMonitor invalidate](self->_systemMonitor, "invalidate");
  systemMonitor = self->_systemMonitor;
  self->_systemMonitor = 0LL;

  -[NSXPCListener invalidate](self->_xpcListener, "invalidate");
  xpcListener = self->_xpcListener;
  self->_xpcListener = 0LL;

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  uint64_t v15 = self->_xpcConnections;
  id v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v22,  v30,  16LL);
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      for (j = 0LL; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * (void)j), "xpcCnx", (void)v22));
        [v20 invalidate];
      }

      id v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v22,  v30,  16LL);
    }

    while (v17);
  }

  -[NSMutableSet removeAllObjects](self->_xpcConnections, "removeAllObjects");
  xpcConnections = self->_xpcConnections;
  self->_xpcConnections = 0LL;
}

- (BOOL)diagnosticCommand:(id)a3 params:(id)a4
{
  id v6 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  id v8 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  unsigned int v9 = [v8 isEqual:@"errorFlags"];

  if (v9)
  {
    self->_errorFlagsForceSet = CFDictionaryGetInt64(v6, @"setFlags", 0LL);
    uint64_t Int64 = CFDictionaryGetInt64(v6, @"clearFlags", 0LL);
    self->_errorFlagsForceClear = Int64;
    if (dword_100131820 <= 30)
    {
      if (dword_100131820 == -1)
      {
        uint64_t Int64 = self->_errorFlagsForceClear;
      }

      LogPrintF( &dword_100131820,  "-[RPDaemon diagnosticCommand:params:]",  30LL,  "Diag: ErrorFlags: Set %#ll{flags}, Clear %#ll{flags}\n",  self->_errorFlagsForceSet,  &unk_100109FC0,  Int64,  &unk_100109FC0);
    }

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v6 = -[RPDaemonXPCConnection initWithDaemon:xpcConnection:]( objc_alloc(&OBJC_CLASS___RPDaemonXPCConnection),  "initWithDaemon:xpcConnection:",  self,  v5);
  -[RPDaemonXPCConnection setDispatchQueue:](v6, "setDispatchQueue:", self->_dispatchQueue);
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    unsigned int v9 = self->_xpcConnections;
    self->_xpcConnections = v8;

    xpcConnections = self->_xpcConnections;
  }

  -[NSMutableSet addObject:](xpcConnections, "addObject:", v6);
  [v5 _setQueue:self->_dispatchQueue];
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___RPDaemonXPCServerInterface));
  [v5 setExportedInterface:v10];

  [v5 setExportedObject:v6];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10004587C;
  v13[3] = &unk_100111968;
  v13[4] = self;
  v13[5] = v6;
  [v5 setInvalidationHandler:v13];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___RPDaemonXPCClientInterface));
  [v5 setRemoteObjectInterface:v11];

  [v5 resume];
  if (dword_100131820 <= 20 && (dword_100131820 != -1 || _LogCategory_Initialize(&dword_100131820, 20LL))) {
    LogPrintF( &dword_100131820,  "-[RPDaemon listener:shouldAcceptNewConnection:]",  20,  "XPC connection started from %#{pid}\n",  [v5 processIdentifier]);
  }

  return 1;
}

- (id)keychainStateString
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  id v3 = objc_alloc_init(&OBJC_CLASS___CUKeychainItem);
  [v3 setAccessGroup:@"com.apple.rapport"];
  [v3 setSyncType:3];
  id v4 = objc_alloc_init(&OBJC_CLASS___CUKeychainManager);
  id v22 = 0LL;
  id v5 = [v4 copyItemsMatchingItem:v3 flags:0 error:&v22];
  id v6 = v22;
  id v21 = v2;
  NSAppendPrintF(&v21, "-- RPKeychain: %d items, %{error} --\n", [v5 count], v6);
  uint64_t v7 = v21;

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = CUDescriptionWithLevel(*(void *)(*((void *)&v17 + 1) + 8LL * (void)v12), 134217778LL);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        -[NSMutableString appendString:](v7, "appendString:", v14);

        -[NSMutableString appendString:](v7, "appendString:", @"\n");
        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }

    while (v10);
  }

  uint64_t v15 = v7;
  return v15;
}

- (void)postDaemonInfoChanges:(unint64_t)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100045AF4;
  v4[3] = &unk_100112A20;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)_prefsChanged
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  id v3 = self->_subDaemons;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * (void)v7), "prefsChanged", (void)v8);
        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v5);
  }
}

- (void)_updateErrorFlags
{
  else {
    uint64_t v3 = 256LL;
  }
  uint64_t v4 = v3 | (4 * -[CUSystemMonitor wifiFlags](self->_systemMonitor, "wifiFlags")) & 0x80;
  unsigned int v5 = -[CUSystemMonitor wifiState](self->_systemMonitor, "wifiState");
  uint64_t v6 = v4 | 4;
  if (v5 != 10) {
    uint64_t v6 = v4;
  }
  unint64_t v7 = (v6 | self->_errorFlagsForceSet) & ~self->_errorFlagsForceClear;
  unint64_t errorFlags = self->_errorFlags;
  if (v7 != errorFlags)
  {
    self->_unint64_t errorFlags = v7;
    if (dword_100131820 <= 30
      && (dword_100131820 != -1 || _LogCategory_Initialize(&dword_100131820, 30LL)))
    {
      LogPrintF( &dword_100131820,  "-[RPDaemon _updateErrorFlags]",  30LL,  "Error flags changed: %#ll{flags} -> %#ll{flags}\n",  errorFlags,  &unk_100109FC0,  v7,  &unk_100109FC0);
    }

    id v9 = (id)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](&OBJC_CLASS___RPDaemon, "sharedDaemon"));
    [v9 postDaemonInfoChanges:32];
  }

- (void)_xpcPublisherAction:(unsigned int)a3 token:(unint64_t)a4 event:(id)a5
{
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (a3 != 2)
  {
    if (a3 == 1)
    {
      -[RPDaemon _xpcPublisherRemoveToken:](self, "_xpcPublisherRemoveToken:", a4);
    }

    else if (a3)
    {
      if (dword_100131820 <= 30
        && (dword_100131820 != -1 || _LogCategory_Initialize(&dword_100131820, 30LL)))
      {
        LogPrintF( &dword_100131820,  "-[RPDaemon _xpcPublisherAction:token:event:]",  30LL,  "Unknown XPC publisher action: %d\n",  a3);
      }
    }

    else
    {
      -[RPDaemon _xpcPublisherAddToken:event:](self, "_xpcPublisherAddToken:event:", a4, v8);
    }
  }
}

- (void)_xpcPublisherAddToken:(unint64_t)a3 event:(id)a4
{
  id v8 = (void *)_CFXPCCreateCFObjectFromXPCObject(a4, a2);
  if (!v8)
  {
    unint64_t v17 = a3;
    __int128 v10 = "### XPC publisher add: convert XPC event failed: token %llu\n";
LABEL_12:
    LogPrintF(&dword_100131820, "-[RPDaemon _xpcPublisherAddToken:event:]", 90LL, v10, v17);
    goto LABEL_39;
  }

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary, v6, v7);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
  {
    unint64_t v17 = a3;
    __int128 v10 = "### XPC publisher add: not a dictionary: token %llu\n";
    goto LABEL_12;
  }

  if (dword_100131820 <= 30 && (dword_100131820 != -1 || _LogCategory_Initialize(&dword_100131820, 30LL))) {
    LogPrintF( &dword_100131820,  "-[RPDaemon _xpcPublisherAddToken:event:]",  30LL,  "XPC publisher add token %llu, %##@\n",  a3,  v8);
  }
  if (self->_prefXPCMatchingTestMode || !CFDictionaryGetInt64(v8, @"testMode", 0LL))
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v11 = self->_subDaemons;
    id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v20;
      while (2)
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472LL;
          v18[2] = sub_100046278;
          v18[3] = &unk_100112A48;
          v18[4] = self;
          v18[5] = a3;
          if ([v16 addXPCMatchingToken:a3 event:v8 handler:v18])
          {

            goto LABEL_39;
          }
        }

        id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
        if (v13) {
          continue;
        }
        break;
      }
    }

    if (dword_100131820 <= 60
      && (dword_100131820 != -1 || _LogCategory_Initialize(&dword_100131820, 60LL)))
    {
      LogPrintF( &dword_100131820,  "-[RPDaemon _xpcPublisherAddToken:event:]",  60LL,  "### Add XPC matching not handled: token %llu, event %##@\n",  a3,  v8);
    }
  }

  else if (dword_100131820 <= 30 {
         && (dword_100131820 != -1 || _LogCategory_Initialize(&dword_100131820, 30LL)))
  }
  {
    LogPrintF( &dword_100131820,  "-[RPDaemon _xpcPublisherAddToken:event:]",  30LL,  "Ignoring TestMode XPC matching when not enabled: token %llu, event %##@\n",  a3,  v8);
  }

- (void)_xpcPublisherRemoveToken:(unint64_t)a3
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t v4 = self->_subDaemons;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * (void)i) removeXPCMatchingToken:a3])
        {

          return;
        }
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

  if (dword_100131820 <= 30 && (dword_100131820 != -1 || _LogCategory_Initialize(&dword_100131820, 30LL))) {
    LogPrintF( &dword_100131820,  "-[RPDaemon _xpcPublisherRemoveToken:]",  30LL,  "Remove XPC matching not handled: token %llu\n",  a3);
  }
}

- (void)_xpcPublisherTriggeredToken:(unint64_t)a3 payload:(id)a4 responseHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  __int128 v10 = (void (**)(id, void, void *))objc_retainBlock(v9);
  unint64_t v17 = self->_xpcPublisher;
  if (v17)
  {
    if (v8)
    {
      __int128 v18 = (void *)_CFXPCCreateXPCObjectFromCFObject(v8);
      if (v18)
      {
        if (v10)
        {
LABEL_5:
          dispatchQueue = self->_dispatchQueue;
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472LL;
          v24[2] = sub_100046784;
          v24[3] = &unk_100112A70;
          v24[4] = self;
          unint64_t v26 = a3;
          id v25 = v9;
          int v20 = xpc_event_publisher_fire_with_reply(v17, a3, v18, dispatchQueue, v24);

LABEL_18:
          if (v20)
          {
            if (dword_100131820 <= 90
              && (dword_100131820 != -1 || _LogCategory_Initialize(&dword_100131820, 90LL)))
            {
              LogPrintF( &dword_100131820,  "-[RPDaemon _xpcPublisherTriggeredToken:payload:responseHandler:]",  90LL,  "### XPC publisher trigger failed: token %llu, %#m\n");
            }
          }

          else if (dword_100131820 <= 30 {
                 && (dword_100131820 != -1 || _LogCategory_Initialize(&dword_100131820, 30LL)))
          }
          {
            LogPrintF( &dword_100131820,  "-[RPDaemon _xpcPublisherTriggeredToken:payload:responseHandler:]",  30LL,  "XPC publisher triggered: token %llu\n");
          }

          goto LABEL_30;
        }

- (void)_xpcPublisherTriggeredReply:(id)a3 token:(unint64_t)a4 responseHandler:(id)a5
{
  id v7 = a3;
  uint64_t v45 = 0LL;
  __int128 v46 = &v45;
  uint64_t v47 = 0x3032000000LL;
  v48 = sub_1000469F8;
  uint64_t v49 = sub_100046A08;
  id v50 = 0LL;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_100046A10;
  v41[3] = &unk_100112A98;
  v43 = &v45;
  unint64_t v44 = a4;
  id v8 = a5;
  id v42 = v8;
  id v9 = objc_retainBlock(v41);
  if (xpc_get_type(v7) != (xpc_type_t)&_xpc_type_error)
  {
    __int128 v18 = (void *)_CFXPCCreateCFObjectFromXPCObject(v7, v10);
    if (v18)
    {
      uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSDictionary, v11, v12);
      if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
      {
        if (dword_100131820 <= 30
          && (dword_100131820 != -1 || _LogCategory_Initialize(&dword_100131820, 30LL)))
        {
          LogPrintF( &dword_100131820,  "-[RPDaemon _xpcPublisherTriggeredReply:token:responseHandler:]",  30LL,  "XPC publisher reply: token %llu, %##@\n",  a4,  v18);
        }

        (*((void (**)(id, void *, void))v8 + 2))(v8, v18, 0LL);
        goto LABEL_12;
      }

      id v38 = RPErrorF(4294960540LL, (uint64_t)"XPC reply bad type", v20, v21, v22, v23, v24, v25, v40);
      uint64_t v37 = objc_claimAutoreleasedReturnValue(v38);
    }

    else
    {
      id v36 = RPErrorF(4294960584LL, (uint64_t)"XPC reply convert failed", v12, v13, v14, v15, v16, v17, v40);
      uint64_t v37 = objc_claimAutoreleasedReturnValue(v36);
    }

    v39 = (void *)v46[5];
    v46[5] = v37;

    goto LABEL_12;
  }

  string = xpc_dictionary_get_string(v7, _xpc_error_key_description);
  v33 = "?";
  if (string) {
    v33 = string;
  }
  id v34 = RPErrorF(4294960584LL, (uint64_t)"XPC reply error: %s", v27, v28, v29, v30, v31, v32, (uint64_t)v33);
  uint64_t v35 = objc_claimAutoreleasedReturnValue(v34);
  __int128 v18 = (void *)v46[5];
  v46[5] = v35;
LABEL_12:

  ((void (*)(void *))v9[2])(v9);
  _Block_object_dispose(&v45, 8);
}

- (void)_xpcPublisherStateChangedForToken:(unint64_t)a3 state:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = self->_xpcPublisher;
  uint64_t v12 = v6;
  if (v6)
  {
    if (xpc_event_publisher_set_subscriber_keepalive(v6, a3, v4))
    {
      if (dword_100131820 <= 90
        && (dword_100131820 != -1 || _LogCategory_Initialize(&dword_100131820, 90LL)))
      {
        LogPrintF( &dword_100131820,  "-[RPDaemon _xpcPublisherStateChangedForToken:state:]",  90LL,  "### XPC publisher state change failed: token %llu, state %d, %#m\n");
      }
    }

    else if (dword_100131820 <= 30 {
           && (dword_100131820 != -1 || _LogCategory_Initialize(&dword_100131820, 30LL)))
    }
    {
      LogPrintF( &dword_100131820,  "-[RPDaemon _xpcPublisherStateChangedForToken:state:]",  30LL,  "XPC publisher state changed: token %llu, state %d\n");
    }

    if (v4)
    {
      uint64_t v8 = xpc_event_publisher_fire(v12, a3, 0LL);
      if ((_DWORD)v8)
      {
        if (dword_100131820 <= 90)
        {
          uint64_t v9 = v8;
          if (dword_100131820 != -1 || _LogCategory_Initialize(&dword_100131820, 90LL))
          {
            unint64_t v10 = a3;
            BOOL v11 = v9;
            id v7 = "### XPC publisher state  trigger failed: token %llu, %#m\n";
            goto LABEL_23;
          }
        }
      }

      else if (dword_100131820 <= 30 {
             && (dword_100131820 != -1 || _LogCategory_Initialize(&dword_100131820, 30LL)))
      }
      {
        LogPrintF( &dword_100131820,  "-[RPDaemon _xpcPublisherStateChangedForToken:state:]",  30LL,  "XPC publisher state triggered: token %llu\n");
      }
    }
  }

  else if (dword_100131820 <= 90 {
         && (dword_100131820 != -1 || _LogCategory_Initialize(&dword_100131820, 90LL)))
  }
  {
    unint64_t v10 = a3;
    BOOL v11 = v4;
    id v7 = "### XPC publisher state changed without publisher, token %llu, state %d\n";
LABEL_23:
    LogPrintF(&dword_100131820, "-[RPDaemon _xpcPublisherStateChangedForToken:state:]", 90LL, v7, v10, v11);
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (unint64_t)errorFlags
{
  return self->_errorFlags;
}

- (BOOL)languageChangePending
{
  return self->_languageChangePending;
}

- (BOOL)sigTermPending
{
  return self->_sigTermPending;
}

- (void).cxx_destruct
{
}

@end
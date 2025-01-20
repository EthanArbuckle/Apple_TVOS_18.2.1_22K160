@interface MADCacheDeleteManager
+ (id)_generateCacheDeleteManagerStateTable;
+ (id)sharedManager;
- (BOOL)maCacheDeleteSupported:(id *)a3;
- (MADCacheDeleteManager)init;
- (NSDictionary)stateTable;
- (NSLock)downloadsUsingSpaceLock;
- (NSLock)spaceCheckRequestsLock;
- (NSMutableArray)downloadsUsingSpace;
- (NSMutableArray)spaceCheckRequests;
- (SUCoreFSM)stateMachine;
- (SUCoreLog)logger;
- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4;
- (int64_t)action_Activate:(id)a3 error:(id *)a4;
- (int64_t)action_CheckFileSystem:(id)a3 error:(id *)a4;
- (int64_t)action_CheckPendingRequest:(id)a3 error:(id *)a4;
- (int64_t)action_CheckPurgeable:(id)a3 error:(id *)a4;
- (int64_t)action_NotifyEnoughSpace:(id)a3 error:(id *)a4;
- (int64_t)action_NotifyNotEnoughSpaceAfterCheck:(id)a3 error:(id *)a4;
- (int64_t)action_NotifyNotEnoughSpaceAfterPurge:(id)a3 error:(id *)a4;
- (int64_t)action_NotifyOperationError:(id)a3 error:(id *)a4;
- (int64_t)action_PerformPurgeBasePath:(id)a3 error:(id *)a4;
- (int64_t)action_PerformPurgeSharedPath:(id)a3 error:(id *)a4;
- (int64_t)action_QueueRequest:(id)a3 error:(id *)a4;
- (int64_t)action_RemoveCompletedDownload:(id)a3 error:(id *)a4;
- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8;
- (unint64_t)totalSpaceRequired:(unint64_t)a3;
- (void)checkAvailableSpace:(unint64_t)a3 allowPurgeWithUrgency:(int)a4 withCompletionQueue:(id)a5 completion:(id)a6;
- (void)notifyDownloadCompleted:(id)a3;
- (void)notifyDownloadCompleted:(id)a3 withSpaceNoLongerNeeded:(unint64_t)a4;
- (void)setDownloadsUsingSpace:(id)a3;
- (void)setDownloadsUsingSpaceLock:(id)a3;
- (void)setSpaceCheckRequests:(id)a3;
- (void)setSpaceCheckRequestsLock:(id)a3;
- (void)setStateMachine:(id)a3;
@end

@implementation MADCacheDeleteManager

+ (id)_generateCacheDeleteManagerStateTable
{
  v118[0] = @"Startup";
  v116 = @"Activate";
  uint64_t v2 = kSUCoreNextStateKey;
  uint64_t v3 = kSUCoreActionKey;
  v114[0] = kSUCoreNextStateKey;
  v114[1] = kSUCoreActionKey;
  v115[0] = @"Active";
  v115[1] = @"Activate";
  v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v115,  v114,  2LL));
  v117 = v43;
  v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v117,  &v116,  1LL));
  v119[0] = v42;
  v118[1] = @"Active";
  v112[0] = @"ClientSpaceCheckRequest";
  v110[0] = v2;
  v110[1] = v3;
  v111[0] = @"CheckFileSystem";
  v111[1] = @"CheckFileSystem";
  v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v111,  v110,  2LL));
  v113[0] = v41;
  v112[1] = @"ClientDownloadCompleted";
  uint64_t v108 = v3;
  v109 = @"RemoveCompletedDownload";
  v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v109,  &v108,  1LL));
  v113[1] = v40;
  v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v113,  v112,  2LL));
  v119[1] = v39;
  v118[2] = @"CheckPendingRequest";
  v106[0] = @"ClientSpaceCheckRequest";
  uint64_t v104 = v3;
  v105 = @"QueueRequest";
  v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v105,  &v104,  1LL));
  v107[0] = v38;
  v106[1] = @"ClientDownloadCompleted";
  uint64_t v102 = v3;
  v103 = @"RemoveCompletedDownload";
  v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v103,  &v102,  1LL));
  v107[1] = v37;
  v106[2] = @"CheckPendingRequest";
  uint64_t v100 = v3;
  v101 = @"CheckPendingRequest";
  v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v101,  &v100,  1LL));
  v107[2] = v36;
  v106[3] = @"CheckFileSystem";
  v98[0] = v2;
  v98[1] = v3;
  v99[0] = @"CheckFileSystem";
  v99[1] = @"CheckFileSystem";
  v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v99,  v98,  2LL));
  v107[3] = v35;
  v106[4] = @"NoMoreRequest";
  uint64_t v96 = v2;
  v97 = @"Active";
  v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v97,  &v96,  1LL));
  v107[4] = v34;
  v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v107,  v106,  5LL));
  v119[2] = v33;
  v118[3] = @"CheckFileSystem";
  v94[0] = @"ClientSpaceCheckRequest";
  uint64_t v92 = v3;
  v93 = @"QueueRequest";
  v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v93,  &v92,  1LL));
  v95[0] = v32;
  v94[1] = @"ClientDownloadCompleted";
  uint64_t v90 = v3;
  v91 = @"RemoveCompletedDownload";
  v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v91,  &v90,  1LL));
  v95[1] = v31;
  v94[2] = @"CheckPurgeable";
  v88[0] = v2;
  v88[1] = v3;
  v89[0] = @"CheckPurgeable";
  v89[1] = @"CheckPurgeable";
  v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v89,  v88,  2LL));
  v95[2] = v30;
  v94[3] = @"FileSystemHasEnoughSpace";
  v86[0] = v2;
  v86[1] = v3;
  v87[0] = @"CheckPendingRequest";
  v87[1] = @"NotifyEnoughSpace";
  v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v87,  v86,  2LL));
  v95[3] = v29;
  v94[4] = @"NotEnoughPurgeable";
  v84[0] = v2;
  v84[1] = v3;
  v85[0] = @"CheckPendingRequest";
  v85[1] = @"NotifyNotEnoughSpaceAfterCheck";
  v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v85,  v84,  2LL));
  v95[4] = v28;
  v94[5] = @"OperationError";
  v82[0] = v2;
  v82[1] = v3;
  v83[0] = @"CheckPendingRequest";
  v83[1] = @"NotifyOperationError";
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v83,  v82,  2LL));
  v95[5] = v27;
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v95,  v94,  6LL));
  v119[3] = v26;
  v118[4] = @"CheckPurgeable";
  v80[0] = @"ClientSpaceCheckRequest";
  uint64_t v78 = v3;
  v79 = @"QueueRequest";
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v79,  &v78,  1LL));
  v81[0] = v25;
  v80[1] = @"ClientDownloadCompleted";
  uint64_t v76 = v3;
  v77 = @"RemoveCompletedDownload";
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v77,  &v76,  1LL));
  v81[1] = v24;
  v80[2] = @"PerformPurgeBasePath";
  v74[0] = v2;
  v74[1] = v3;
  v75[0] = @"PerformPurgeBasePath";
  v75[1] = @"PerformPurgeBasePath";
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v75,  v74,  2LL));
  v81[2] = v23;
  v80[3] = @"NotEnoughPurgeable";
  v72[0] = v2;
  v72[1] = v3;
  v73[0] = @"CheckPendingRequest";
  v73[1] = @"NotifyNotEnoughSpaceAfterCheck";
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v73,  v72,  2LL));
  v81[3] = v22;
  v80[4] = @"OperationError";
  v70[0] = v2;
  v70[1] = v3;
  v71[0] = @"CheckPendingRequest";
  v71[1] = @"NotifyOperationError";
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v71,  v70,  2LL));
  v81[4] = v21;
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v81,  v80,  5LL));
  v119[4] = v20;
  v118[5] = @"PerformPurgeBasePath";
  v68[0] = @"ClientSpaceCheckRequest";
  uint64_t v66 = v3;
  v67 = @"QueueRequest";
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v67,  &v66,  1LL));
  v69[0] = v19;
  v68[1] = @"ClientDownloadCompleted";
  uint64_t v64 = v3;
  v65 = @"RemoveCompletedDownload";
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v65,  &v64,  1LL));
  v69[1] = v18;
  v68[2] = @"PerformPurgeSharedPath";
  v62[0] = v2;
  v62[1] = v3;
  v63[0] = @"PerformPurgeSharedPath";
  v63[1] = @"PerformPurgeSharedPath";
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v63,  v62,  2LL));
  v69[2] = v17;
  v68[3] = @"PurgeCompletedSuccess";
  v60[0] = v2;
  v60[1] = v3;
  v61[0] = @"CheckPendingRequest";
  v61[1] = @"NotifyEnoughSpace";
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v61,  v60,  2LL));
  v69[3] = v16;
  v68[4] = @"PurgeCompletedSuccess";
  v58[0] = v2;
  v58[1] = v3;
  v59[0] = @"CheckPendingRequest";
  v59[1] = @"NotifyNotEnoughSpaceAfterPurge";
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v59,  v58,  2LL));
  v69[4] = v15;
  v68[5] = @"OperationError";
  v56[0] = v2;
  v56[1] = v3;
  v57[0] = @"CheckPendingRequest";
  v57[1] = @"NotifyOperationError";
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v57,  v56,  2LL));
  v69[5] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v69,  v68,  6LL));
  v119[5] = v5;
  v118[6] = @"PerformPurgeSharedPath";
  uint64_t v52 = v3;
  v53 = @"QueueRequest";
  v54[0] = @"ClientSpaceCheckRequest";
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v53,  &v52,  1LL));
  v55[0] = v6;
  v54[1] = @"ClientDownloadCompleted";
  uint64_t v50 = v3;
  v51 = @"RemoveCompletedDownload";
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v51,  &v50,  1LL));
  v55[1] = v7;
  v54[2] = @"PurgeCompletedSuccess";
  v48[0] = v2;
  v48[1] = v3;
  v49[0] = @"CheckPendingRequest";
  v49[1] = @"NotifyEnoughSpace";
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v49,  v48,  2LL));
  v55[2] = v8;
  v54[3] = @"PurgeCompletedSuccess";
  v46[0] = v2;
  v46[1] = v3;
  v47[0] = @"CheckPendingRequest";
  v47[1] = @"NotifyNotEnoughSpaceAfterPurge";
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v47,  v46,  2LL));
  v55[3] = v9;
  v54[4] = @"OperationError";
  v44[0] = v2;
  v44[1] = v3;
  v45[0] = @"CheckPendingRequest";
  v45[1] = @"NotifyOperationError";
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v45,  v44,  2LL));
  v55[4] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v55,  v54,  5LL));
  v119[6] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v119,  v118,  7LL));

  v13 = -[NSDictionary initWithDictionary:copyItems:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithDictionary:copyItems:",  v12,  1LL);
  return v13;
}

- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8
{
  id v11 = a3;
  id v12 = a6;
  if ([v11 isEqualToString:kSUCoreFSMActionNoOp])
  {
    int64_t v13 = 0LL;
  }

  else
  {
    if ([v11 isEqualToString:@"Activate"])
    {
      int64_t v14 = -[MADCacheDeleteManager action_Activate:error:](self, "action_Activate:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"QueueRequest"])
    {
      int64_t v14 = -[MADCacheDeleteManager action_QueueRequest:error:](self, "action_QueueRequest:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"RemoveCompletedDownload"])
    {
      int64_t v14 = -[MADCacheDeleteManager action_RemoveCompletedDownload:error:]( self,  "action_RemoveCompletedDownload:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"CheckPendingRequest"])
    {
      int64_t v14 = -[MADCacheDeleteManager action_CheckPendingRequest:error:]( self,  "action_CheckPendingRequest:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"CheckFileSystem"])
    {
      int64_t v14 = -[MADCacheDeleteManager action_CheckFileSystem:error:](self, "action_CheckFileSystem:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"CheckPurgeable"])
    {
      int64_t v14 = -[MADCacheDeleteManager action_CheckPurgeable:error:](self, "action_CheckPurgeable:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"PerformPurgeBasePath"])
    {
      int64_t v14 = -[MADCacheDeleteManager action_PerformPurgeBasePath:error:]( self,  "action_PerformPurgeBasePath:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"PerformPurgeSharedPath"])
    {
      int64_t v14 = -[MADCacheDeleteManager action_PerformPurgeSharedPath:error:]( self,  "action_PerformPurgeSharedPath:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"NotifyEnoughSpace"])
    {
      int64_t v14 = -[MADCacheDeleteManager action_NotifyEnoughSpace:error:](self, "action_NotifyEnoughSpace:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"NotifyNotEnoughSpaceAfterCheck"])
    {
      int64_t v14 = -[MADCacheDeleteManager action_NotifyNotEnoughSpaceAfterCheck:error:]( self,  "action_NotifyNotEnoughSpaceAfterCheck:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"NotifyNotEnoughSpaceAfterPurge"])
    {
      int64_t v14 = -[MADCacheDeleteManager action_NotifyNotEnoughSpaceAfterPurge:error:]( self,  "action_NotifyNotEnoughSpaceAfterPurge:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"NotifyOperationError"])
    {
      int64_t v14 = -[MADCacheDeleteManager action_NotifyOperationError:error:]( self,  "action_NotifyOperationError:error:",  v12,  a8);
    }

    else
    {
      int64_t v14 = -[MADCacheDeleteManager actionUnknownAction:error:](self, "actionUnknownAction:error:", v11, a8);
    }

    int64_t v13 = v14;
  }

  return v13;
}

- (int64_t)action_Activate:(id)a3 error:(id *)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager stateMachine](self, "stateMachine", a3, a4));
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 extendedStateQueue]);
  dispatch_assert_queue_V2(v5);

  return 0LL;
}

- (int64_t)action_QueueRequest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager stateMachine](self, "stateMachine"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager spaceCheckRequestsLock](self, "spaceCheckRequestsLock"));
  [v8 lock];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager spaceCheckRequests](self, "spaceCheckRequests"));
  [v9 addObject:v5];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager spaceCheckRequestsLock](self, "spaceCheckRequestsLock"));
  [v10 unlock];

  return 0LL;
}

- (int64_t)action_RemoveCompletedDownload:(id)a3 error:(id *)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager stateMachine](self, "stateMachine", a3, a4));
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 extendedStateQueue]);
  dispatch_assert_queue_V2(v5);

  return 0LL;
}

- (int64_t)action_CheckPendingRequest:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager stateMachine](self, "stateMachine", a3, a4));
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager spaceCheckRequestsLock](self, "spaceCheckRequestsLock"));
  [v7 lock];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager logger](self, "logger"));
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 oslog]);

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager spaceCheckRequests](self, "spaceCheckRequests"));
    int v25 = 134217984;
    id v26 = [v10 count];
    _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "Before serving, number of request waiting: %lu",  (uint8_t *)&v25,  0xCu);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager spaceCheckRequests](self, "spaceCheckRequests"));
  id v12 = [v11 count];

  if (v12)
  {
    int64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager spaceCheckRequests](self, "spaceCheckRequests"));
    int64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager spaceCheckRequests](self, "spaceCheckRequests"));
    [v15 removeObjectAtIndex:0];
  }

  else
  {
    int64_t v14 = 0LL;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager logger](self, "logger"));
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 oslog]);

  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager spaceCheckRequests](self, "spaceCheckRequests"));
    id v19 = [v18 count];
    int v25 = 134217984;
    id v26 = v19;
    _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_DEFAULT,  "After serving, number of request waiting: %lu",  (uint8_t *)&v25,  0xCu);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager spaceCheckRequestsLock](self, "spaceCheckRequestsLock"));
  [v20 unlock];

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager stateMachine](self, "stateMachine"));
  v22 = v21;
  if (v14)
  {
    [v21 postEvent:@"CheckFileSystem" withInfo:v14];
  }

  else
  {
    v23 = objc_alloc_init(&OBJC_CLASS___MADCacheDeleteManagerEventInfo);
    [v22 postEvent:@"NoMoreRequest" withInfo:v23];
  }

  return 0LL;
}

- (int64_t)action_CheckFileSystem:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager stateMachine](self, "stateMachine"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager logger](self, "logger"));
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 oslog]);

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v5 description]);
    buf.f_bsize = 138412290;
    *(void *)&buf.f_iosize = v10;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Requesting to check filesystem: %@", (uint8_t *)&buf, 0xCu);
  }

  char v40 = 0;
  unint64_t AppIntegerValue = (unint64_t)_MAPreferencesGetAppIntegerValue( @"FakeAvailableSpaceInBytesForSpaceCheck",  &v40);
  if (v40)
  {
    id v12 = (id)AppIntegerValue;
    if ((AppIntegerValue & 0x8000000000000000LL) == 0)
    {
      int64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager logger](self, "logger"));
      int64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 oslog]);

      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        buf.f_bsize = 138412546;
        *(void *)&buf.f_iosize = @"FakeAvailableSpaceInBytesForSpaceCheck";
        WORD2(buf.f_blocks) = 2048;
        *(uint64_t *)((char *)&buf.f_blocks + 6) = (uint64_t)v12;
        _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_DEFAULT,  "[SPACE] Using FAKE available space set by the %@ default. Free space available: %llu",  (uint8_t *)&buf,  0x16u);
      }

      [v5 setCacheDeleteUrgency:0xFFFFFFFFLL];
      v15 = 0LL;
      goto LABEL_22;
    }
  }

  if (!statfs((const char *)[@"/var/mobile" fileSystemRepresentation], &buf))
  {
    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  buf.f_mntonname,  4LL));
    id v19 = (void *)v18;
    if (!v18)
    {
      v15 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"check filesystem for available space failed (unable to determine volume name from path=%@)",  @"/var/mobile");
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[MADCacheDeleteManagerError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MADCacheDeleteManagerError,  "buildError:fromOperation:underlyingError:withDescription:",  1LL,  @"CheckFileSystemForAvailableSpace",  0LL,  v15));
      id v12 = 0LL;
      goto LABEL_21;
    }

    v39 = 0LL;
    v20 = (void *)CacheDeleteCopyAvailableSpaceForVolume(v18, 2LL, &v39);
    v21 = v20;
    v22 = v39;
    if (v39)
    {
      v23 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"check for available space failed (error reported by cache delete for path=%@)",  @"/var/mobile");
    }

    else
    {
      if (v20)
      {
        id v12 = [v20 unsignedLongLongValue];
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager logger](self, "logger"));
        int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v24 oslog]);

        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v41 = 138412546;
          v42 = v19;
          __int16 v43 = 2048;
          id v44 = v12;
          _os_log_impl( &dword_0,  v25,  OS_LOG_TYPE_DEFAULT,  "[SPACE] checked space on %@.  Free space available: %llu",  v41,  0x16u);
        }

        v15 = 0LL;
        v16 = 0LL;
        goto LABEL_20;
      }

      v23 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"check for available space failed (unable to determine available space through cache delete for path=%@)",  @"/var/mobile");
    }

    v15 = v23;
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[MADCacheDeleteManagerError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MADCacheDeleteManagerError,  "buildError:fromOperation:underlyingError:withDescription:",  2LL,  @"CheckFileSystemForAvailableSpace",  0LL,  v23));
    id v12 = 0LL;
LABEL_20:

LABEL_21:
    if (v16) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }

  v15 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"check filesystem for available space failed (unable to statfs path=%@)",  @"/var/mobile");
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[MADCacheDeleteManagerError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MADCacheDeleteManagerError,  "buildError:fromOperation:underlyingError:withDescription:",  1LL,  @"CheckFileSystemForAvailableSpace",  0LL,  v15));
  id v12 = 0LL;
  if (v16)
  {
LABEL_10:
    [v5 setError:v16];
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager stateMachine](self, "stateMachine"));
    [v17 postEvent:@"OperationError" withInfo:v5];
    goto LABEL_36;
  }

- (int64_t)action_CheckPurgeable:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager stateMachine](self, "stateMachine"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  v51[0] = @"/var/mobile";
  v50[0] = @"CACHE_DELETE_VOLUME";
  v50[1] = @"CACHE_DELETE_URGENCY";
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  (int)[v5 cacheDeleteUrgency]));
  v51[1] = v8;
  v50[2] = @"CACHE_DELETE_PURGE_TIMEOUT";
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 300LL));
  v51[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v51,  v50,  3LL));

  id v11 = [v5 totalRequiredSpaceForAllRequests];
  unint64_t v12 = v11 - (_BYTE *)[v5 totalAvailableOnFS];
  int64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager logger](self, "logger"));
  int64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 oslog]);

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v42 = 134218242;
    unint64_t v43 = v12;
    __int16 v44 = 2112;
    id v45 = v10;
    _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_DEFAULT,  "Performing cache delete purgeable check for %lld bytes free space with these options: %@",  (uint8_t *)&v42,  0x16u);
  }

  uint64_t v15 = CacheDeleteCopyPurgeableSpaceWithInfo(v10);
  if (!v15)
  {
    v23 = @"no results provided on cache delete purgeable complete";
LABEL_12:
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[MADCacheDeleteManagerError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MADCacheDeleteManagerError,  "buildError:fromOperation:underlyingError:withDescription:",  2LL,  @"CheckCacheDeleteForAvailableSpace",  0LL,  v23));
    goto LABEL_15;
  }

  v16 = (void *)v15;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (TypeID != CFGetTypeID(v16))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager stateMachine](self, "stateMachine"));
    int v25 = (void *)objc_claimAutoreleasedReturnValue([v24 diag]);
    [v25 trackAnomaly:@"cacheDeletePurgeable" forReason:@"result provided by CacheDeleteCopyPurgeableSpaceWithInfo is not CFDictionary type - ignored" withResult:0 withError:0];

    CFRelease(v16);
    v23 = @"invalid results type provided on cache delete purgeable complete";
    goto LABEL_12;
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager logger](self, "logger"));
  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 oslog]);

  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v42 = 138412290;
    unint64_t v43 = (unint64_t)v16;
    _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Cache delete purgeable check results: %@", (uint8_t *)&v42, 0xCu);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:@"CACHE_DELETE_AMOUNT"]);
  if (v20 && (uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v20, v21) & 1) != 0))
  {
    objc_msgSend(v5, "setTotalAvailableFromCD:", objc_msgSend(v20, "unsignedLongLongValue"));
    v22 = 0LL;
  }

  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[MADCacheDeleteManagerError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MADCacheDeleteManagerError,  "buildError:fromOperation:underlyingError:withDescription:",  2LL,  @"CheckCacheDeleteForAvailableSpace",  0LL,  @"Amount of space is not returned in cache delete check SPI"));
  }

LABEL_15:
  if (v22)
  {
    [v5 setError:v22];
    unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager stateMachine](self, "stateMachine"));
    v27 = v26;
    v28 = @"OperationError";
  }

  else
  {
    id v29 = [v5 totalAvailableFromCD];
    id v30 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager logger](self, "logger"));
    unsigned int v31 = (os_log_s *)objc_claimAutoreleasedReturnValue([v30 oslog]);

    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
    if ((unint64_t)v29 >= v12)
    {
      if (v32)
      {
        id v37 = [v5 totalRequiredSpaceForAllRequests];
        id v38 = [v5 totalRequiredFreeSpace];
        id v39 = [v5 totalAvailableOnFS];
        id v40 = [v5 totalAvailableFromCD];
        int v42 = 134218752;
        unint64_t v43 = (unint64_t)v37;
        __int16 v44 = 2048;
        id v45 = v38;
        __int16 v46 = 2048;
        id v47 = v39;
        __int16 v48 = 2048;
        id v49 = v40;
        _os_log_impl( &dword_0,  v31,  OS_LOG_TYPE_DEFAULT,  "CD Check: Enough space.  Grand Total Required:%llu, Required for request:%llu, Avail FS:%llu, Avail CD:%llu",  (uint8_t *)&v42,  0x2Au);
      }

      unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager stateMachine](self, "stateMachine"));
      v27 = v26;
      v28 = @"PerformPurgeBasePath";
    }

    else
    {
      if (v32)
      {
        id v33 = [v5 totalRequiredSpaceForAllRequests];
        id v34 = [v5 totalRequiredFreeSpace];
        id v35 = [v5 totalAvailableOnFS];
        id v36 = [v5 totalAvailableFromCD];
        int v42 = 134218752;
        unint64_t v43 = (unint64_t)v33;
        __int16 v44 = 2048;
        id v45 = v34;
        __int16 v46 = 2048;
        id v47 = v35;
        __int16 v48 = 2048;
        id v49 = v36;
        _os_log_impl( &dword_0,  v31,  OS_LOG_TYPE_DEFAULT,  "CD Check: NOT enough space.  Grand Total Required:%llu, Required for request:%llu, Avail FS:%llu, Avail CD:%llu",  (uint8_t *)&v42,  0x2Au);
      }

      unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager stateMachine](self, "stateMachine"));
      v27 = v26;
      v28 = @"NotEnoughPurgeable";
    }
  }

  [v26 postEvent:v28 withInfo:v5];

  return 0LL;
}

- (int64_t)action_PerformPurgeBasePath:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager stateMachine](self, "stateMachine"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  v8 = [v5 totalRequiredSpaceForAllRequests];
  v9 = [v5 totalAvailableOnFS];
  BOOL v10 = (uint64_t)v8 <= (uint64_t)v9;
  int64_t v11 = v8 - v9;
  if (v10)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager logger](self, "logger"));
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 oslog]);

    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v36 = 134349312;
      *(void *)&v36[4] = v11;
      *(_WORD *)&v36[12] = 2050;
      *(void *)&v36[14] = [v5 totalRequiredSpaceForAllRequests];
      _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_DEFAULT,  "There's enough space, no need to purge base path. Space needed: %{public}lld, total required: %{public}llu",  v36,  0x16u);
    }

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager stateMachine](self, "stateMachine"));
    [v21 postEvent:@"PurgeCompletedSuccess" withInfo:v5];
  }

  else
  {
    *(void *)id v36 = 0LL;
    *(void *)&v36[8] = v36;
    *(void *)&v36[16] = 0x3032000000LL;
    id v37 = __Block_byref_object_copy__14;
    id v38 = __Block_byref_object_dispose__14;
    id v39 = 0LL;
    uint64_t v28 = 0LL;
    id v29 = &v28;
    uint64_t v30 = 0x2020000000LL;
    uint64_t v31 = 0LL;
    v35[0] = @"/var/mobile";
    v34[0] = @"CACHE_DELETE_VOLUME";
    v34[1] = @"CACHE_DELETE_AMOUNT";
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v11));
    v35[1] = v12;
    v34[2] = @"CACHE_DELETE_URGENCY_LIMIT";
    int64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v5 cacheDeleteUrgency]));
    v35[2] = v13;
    v34[3] = @"CACHE_DELETE_PURGE_TIMEOUT";
    int64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 300LL));
    v35[3] = v14;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v35,  v34,  4LL));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager logger](self, "logger"));
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 oslog]);

    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)statfs buf = 138543362;
      id v33 = v15;
      _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_DEFAULT,  "Triggering CacheDeletePurge on base path with info: %{public}@",  buf,  0xCu);
    }

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = __59__MADCacheDeleteManager_action_PerformPurgeBasePath_error___block_invoke;
    v23[3] = &unk_34FB48;
    v23[4] = self;
    int v25 = v36;
    id v24 = v5;
    unint64_t v26 = &v28;
    int64_t v27 = v11;
    uint64_t v18 = CacheDeletePurgeSpaceWithInfo(v15, v23);
    v29[3] = v18;

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(v36, 8);
  }

  return 0LL;
}

void __59__MADCacheDeleteManager_action_PerformPurgeBasePath_error___block_invoke(uint64_t a1, void *a2)
{
  valuePtr = 0LL;
  if (!a2)
  {
    unint64_t v12 = @"no results provided on cache delete purge complete";
LABEL_11:
    uint64_t v15 = objc_claimAutoreleasedReturnValue( +[MADCacheDeleteManagerError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MADCacheDeleteManagerError,  "buildError:fromOperation:underlyingError:withDescription:",  2LL,  @"CacheDeletePurgeBasePath",  0LL,  v12));
    uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8LL);
    v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    goto LABEL_14;
  }

  CFTypeID TypeID = CFDictionaryGetTypeID();
  CFTypeID v5 = CFGetTypeID(a2);
  v6 = *(void **)(a1 + 32);
  if (TypeID != v5)
  {
    int64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 stateMachine]);
    int64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 diag]);
    [v14 trackAnomaly:@"cacheDeletePurge" forReason:@"result provided by CacheDeletePurgeSpaceWithInfo is not CFDictionary type CFDictionary type - ignored" withResult:0 withError:0];

    unint64_t v12 = @"invalid results type provided on cache delete purge complete";
    goto LABEL_11;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 logger]);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 oslog]);

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)statfs buf = 138412290;
    uint64_t v31 = a2;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "[PURGE] cache delete purge results: %@", buf, 0xCu);
  }

  Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a2, @"CACHE_DELETE_AMOUNT");
  if (Value)
  {
    CFNumberGetValue(Value, kCFNumberLongLongType, &valuePtr);
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
    int64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 oslog]);

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)statfs buf = 134217984;
      uint64_t v31 = valuePtr;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "[SPACE] purged %lld bytes", buf, 0xCu);
    }

    [*(id *)(a1 + 40) setTotalCDBasePath:valuePtr];
  }

  else
  {
    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[MADCacheDeleteManagerError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MADCacheDeleteManagerError,  "buildError:fromOperation:underlyingError:withDescription:",  2LL,  @"CacheDeletePurgeBasePath",  0LL,  @"no amount of space purged provided on cache delete purge complete"));
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8LL);
    v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }

LABEL_14:
  uint64_t v21 = *(const void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
  if (v21)
  {
    CFRelease(v21);
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0LL;
  }

  v22 = *(void **)(a1 + 40);
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL))
  {
    objc_msgSend(v22, "setError:");
    v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stateMachine]);
    id v24 = v23;
    uint64_t v25 = *(void *)(a1 + 40);
    unint64_t v26 = @"OperationError";
  }

  else
  {
    id v27 = [v22 totalCDBasePath];
    unint64_t v28 = *(void *)(a1 + 64);
    v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stateMachine]);
    id v24 = v23;
    uint64_t v25 = *(void *)(a1 + 40);
    else {
      unint64_t v26 = @"PerformPurgeSharedPath";
    }
  }

  [v23 postEvent:v26 withInfo:v25];
}

- (int64_t)action_PerformPurgeSharedPath:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager stateMachine](self, "stateMachine"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  v8 = [v5 totalRequiredSpaceForAllRequests];
  id v9 = [v5 totalAvailableOnFS];
  uint64_t v10 = v8 - ((char *)[v5 totalCDBasePath] + (void)v9);
  if (v10 <= 0)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager logger](self, "logger"));
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 oslog]);

    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v34 = 134349568;
      *(void *)&void v34[4] = v10;
      *(_WORD *)&v34[12] = 2050;
      *(void *)&v34[14] = [v5 totalRequiredSpaceForAllRequests];
      *(_WORD *)&v34[22] = 2050;
      id v35 = (uint64_t (*)(uint64_t, uint64_t))[v5 totalAvailableOnFS];
      _os_log_impl( &dword_0,  v19,  OS_LOG_TYPE_DEFAULT,  "There's enough space, no need to purge shared path. Space needed: %{public}lld, total required: %{public}llu, av ailable on FS: %{public}llu",  v34,  0x20u);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager stateMachine](self, "stateMachine"));
    [v20 postEvent:@"PurgeCompletedSuccess" withInfo:v5];
  }

  else
  {
    *(void *)id v34 = 0LL;
    *(void *)&v34[8] = v34;
    *(void *)&v34[16] = 0x3032000000LL;
    id v35 = __Block_byref_object_copy__14;
    id v36 = __Block_byref_object_dispose__14;
    id v37 = 0LL;
    uint64_t v26 = 0LL;
    id v27 = &v26;
    uint64_t v28 = 0x2020000000LL;
    uint64_t v29 = 0LL;
    v33[0] = @"/var";
    v32[0] = @"CACHE_DELETE_VOLUME";
    v32[1] = @"CACHE_DELETE_AMOUNT";
    int64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v10));
    v33[1] = v11;
    v32[2] = @"CACHE_DELETE_URGENCY_LIMIT";
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v5 cacheDeleteUrgency]));
    v33[2] = v12;
    v32[3] = @"CACHE_DELETE_PURGE_TIMEOUT";
    int64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 300LL));
    v33[3] = v13;
    int64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  4LL));

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager logger](self, "logger"));
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 oslog]);

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)statfs buf = 138543362;
      uint64_t v31 = v14;
      _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_DEFAULT,  "Triggering CacheDeletePurge on shared path with info: %{public}@",  buf,  0xCu);
    }

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = __61__MADCacheDeleteManager_action_PerformPurgeSharedPath_error___block_invoke;
    v22[3] = &unk_34FB70;
    v22[4] = self;
    id v24 = v34;
    id v23 = v5;
    uint64_t v25 = &v26;
    uint64_t v17 = CacheDeletePurgeSpaceWithInfo(v14, v22);
    v27[3] = v17;

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(v34, 8);
  }

  return 0LL;
}

void __61__MADCacheDeleteManager_action_PerformPurgeSharedPath_error___block_invoke(uint64_t a1, void *a2)
{
  valuePtr = 0LL;
  if (!a2)
  {
    unint64_t v12 = @"no results provided on cache delete purge complete";
LABEL_11:
    uint64_t v15 = objc_claimAutoreleasedReturnValue( +[MADCacheDeleteManagerError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MADCacheDeleteManagerError,  "buildError:fromOperation:underlyingError:withDescription:",  2LL,  @"CacheDeletePurgeSharedPath",  0LL,  v12));
    uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    goto LABEL_14;
  }

  CFTypeID TypeID = CFDictionaryGetTypeID();
  CFTypeID v5 = CFGetTypeID(a2);
  v6 = *(void **)(a1 + 32);
  if (TypeID != v5)
  {
    int64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 stateMachine]);
    int64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 diag]);
    [v14 trackAnomaly:@"cacheDeletePurge" forReason:@"result provided by CacheDeletePurgeSpaceWithInfo is not CFDictionary type CFDictionary type - ignored" withResult:0 withError:0];

    unint64_t v12 = @"invalid results type provided on cache delete purge complete";
    goto LABEL_11;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 logger]);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 oslog]);

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)statfs buf = 138412290;
    uint64_t v29 = a2;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "[PURGE] cache delete purge results: %@", buf, 0xCu);
  }

  Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a2, @"CACHE_DELETE_AMOUNT");
  if (Value)
  {
    CFNumberGetValue(Value, kCFNumberLongLongType, &valuePtr);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
    int64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 oslog]);

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)statfs buf = 134217984;
      uint64_t v29 = valuePtr;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "[SPACE] purged %lld bytes", buf, 0xCu);
    }

    [*(id *)(a1 + 40) setTotalCDSharedPath:valuePtr];
  }

  else
  {
    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[MADCacheDeleteManagerError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MADCacheDeleteManagerError,  "buildError:fromOperation:underlyingError:withDescription:",  2LL,  @"CacheDeletePurgeSharedPath",  0LL,  @"no amount of space purged provided on cache delete purge complete"));
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8LL);
    v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }

LABEL_14:
  uint64_t v21 = *(const void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
  if (v21)
  {
    CFRelease(v21);
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0LL;
  }

  v22 = *(void **)(a1 + 40);
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL))
  {
    objc_msgSend(v22, "setError:");
    id v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stateMachine]);
    id v24 = v23;
    uint64_t v25 = *(void *)(a1 + 40);
    uint64_t v26 = @"OperationError";
  }

  else
  {
    [v22 totalAvailableOnFS];
    [*(id *)(a1 + 40) totalCDBasePath];
    [*(id *)(a1 + 40) totalCDSharedPath];
    [*(id *)(a1 + 40) totalRequiredFreeSpace];
    id v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stateMachine]);
    id v24 = v23;
    uint64_t v25 = *(void *)(a1 + 40);
    uint64_t v26 = @"PurgeCompletedSuccess";
  }

  [v23 postEvent:v26 withInfo:v25];
}

- (int64_t)action_NotifyEnoughSpace:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager stateMachine](self, "stateMachine"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);

  uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 completionQueue]);
  uint64_t v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  uint64_t v18 = __56__MADCacheDeleteManager_action_NotifyEnoughSpace_error___block_invoke;
  uint64_t v19 = &unk_34DB98;
  id v20 = v5;
  id v21 = v9;
  id v11 = v9;
  id v12 = v5;
  dispatch_async(v10, &v16);

  int64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager stateMachine](self, "stateMachine", v16, v17, v18, v19));
  int64_t v14 = objc_alloc_init(&OBJC_CLASS___MADCacheDeleteManagerEventInfo);
  [v13 followupEvent:@"CheckPendingRequest" withInfo:v14];

  return 0LL;
}

void __56__MADCacheDeleteManager_action_NotifyEnoughSpace_error___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) completion]);
  (*((void (**)(id, uint64_t, id, void, void))v2 + 2))( v2,  1,  [*(id *)(a1 + 32) totalRequiredFreeSpace],  *(void *)(a1 + 40),  0);
}

- (int64_t)action_NotifyNotEnoughSpaceAfterCheck:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager stateMachine](self, "stateMachine"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 completionQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __69__MADCacheDeleteManager_action_NotifyNotEnoughSpaceAfterCheck_error___block_invoke;
  block[3] = &unk_34DBC0;
  id v14 = v5;
  id v9 = v5;
  dispatch_async(v8, block);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager stateMachine](self, "stateMachine"));
  id v11 = objc_alloc_init(&OBJC_CLASS___MADCacheDeleteManagerEventInfo);
  [v10 followupEvent:@"CheckPendingRequest" withInfo:v11];

  return 0LL;
}

void __69__MADCacheDeleteManager_action_NotifyNotEnoughSpaceAfterCheck_error___block_invoke(uint64_t a1)
{
  id v2 = (char *)[*(id *)(a1 + 32) totalAvailableOnFS];
  uint64_t v3 = &v2[(void)[*(id *)(a1 + 32) totalAvailableFromCD]];
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) completion]);
  (*((void (**)(id, void, char *, void, void))v4 + 2))(v4, 0LL, v3, 0LL, 0LL);
}

- (int64_t)action_NotifyNotEnoughSpaceAfterPurge:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager stateMachine](self, "stateMachine"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 completionQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __69__MADCacheDeleteManager_action_NotifyNotEnoughSpaceAfterPurge_error___block_invoke;
  block[3] = &unk_34DBC0;
  id v14 = v5;
  id v9 = v5;
  dispatch_async(v8, block);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager stateMachine](self, "stateMachine"));
  id v11 = objc_alloc_init(&OBJC_CLASS___MADCacheDeleteManagerEventInfo);
  [v10 followupEvent:@"CheckPendingRequest" withInfo:v11];

  return 0LL;
}

void __69__MADCacheDeleteManager_action_NotifyNotEnoughSpaceAfterPurge_error___block_invoke(uint64_t a1)
{
  id v2 = (char *)[*(id *)(a1 + 32) totalAvailableOnFS];
  uint64_t v3 = &v2[(void)[*(id *)(a1 + 32) totalCDBasePath]];
  id v4 = (char *)[*(id *)(a1 + 32) totalCDSharedPath] + (void)v3;
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) completion]);
  (*((void (**)(id, void, char *, void, void))v5 + 2))(v5, 0LL, v4, 0LL, 0LL);
}

- (int64_t)action_NotifyOperationError:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager stateMachine](self, "stateMachine"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 error]);
  if (v8)
  {
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 completionQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __59__MADCacheDeleteManager_action_NotifyOperationError_error___block_invoke;
    block[3] = &unk_34DBC0;
    id v16 = v5;
    dispatch_async(v9, block);
  }

  else
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager stateMachine](self, "stateMachine"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 diag]);
    [v11 trackAnomaly:@"NotifyOperationError" forReason:@"error is nil when notify operation error is called" withResult:0 withError:0];
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager stateMachine](self, "stateMachine"));
  int64_t v13 = objc_alloc_init(&OBJC_CLASS___MADCacheDeleteManagerEventInfo);
  [v12 followupEvent:@"CheckPendingRequest" withInfo:v13];

  return 0LL;
}

void __59__MADCacheDeleteManager_action_NotifyOperationError_error___block_invoke(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) completion]);
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) error]);
  (*((void (**)(id, void, void, void, void *))v3 + 2))(v3, 0LL, 0LL, 0LL, v2);
}

- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager stateMachine](self, "stateMachine"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag"));
  id v9 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"unknown FSM action(%@)",  v5);
  [v8 trackAnomaly:@"[CACHE_DELETE_MANAGER]" forReason:v9 withResult:8116 withError:0];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager logger](self, "logger"));
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 oslog]);

  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[MADCacheDeleteManager actionUnknownAction:error:].cold.1((uint64_t)v5, v11);
  }

  return 0LL;
}

- (unint64_t)totalSpaceRequired:(unint64_t)a3
{
  return a3;
}

+ (id)sharedManager
{
  if (sharedManager_managerOnce != -1) {
    dispatch_once(&sharedManager_managerOnce, &__block_literal_global_25);
  }
  return (id)sharedManager_manager;
}

void __38__MADCacheDeleteManager_sharedManager__block_invoke(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___MADCacheDeleteManager);
  id v2 = (void *)sharedManager_manager;
  sharedManager_manager = (uint64_t)v1;
}

- (MADCacheDeleteManager)init
{
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___MADCacheDeleteManager;
  id v2 = -[MADCacheDeleteManager init](&v27, "init");
  if (v2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 oslog]);

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "MADCacheDeleteManager initializing", v26, 2u);
    }

    id v5 = -[SUCoreLog initWithCategory:]( objc_alloc(&OBJC_CLASS___SUCoreLog),  "initWithCategory:",  @"MADCacheDeleteManager");
    logger = v2->_logger;
    v2->_logger = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    spaceCheckRequests = v2->_spaceCheckRequests;
    v2->_spaceCheckRequests = v7;

    id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    downloadsUsingSpace = v2->_downloadsUsingSpace;
    v2->_downloadsUsingSpace = v9;

    id v11 = objc_alloc_init(&OBJC_CLASS___NSLock);
    spaceCheckRequestsLock = v2->_spaceCheckRequestsLock;
    v2->_spaceCheckRequestsLock = v11;

    int64_t v13 = objc_alloc_init(&OBJC_CLASS___NSLock);
    downloadsUsingSpaceLock = v2->_downloadsUsingSpaceLock;
    v2->_downloadsUsingSpaceLock = v13;

    id v15 = [(id)objc_opt_class(MADCacheDeleteManager) _generateCacheDeleteManagerStateTable];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    stateTable = v2->_stateTable;
    v2->_stateTable = (NSDictionary *)v16;

    uint64_t v18 = (SUCoreFSM *)-[SUCoreFSM initMachine:withTable:startingIn:usingDelegate:registeringAllInfoClass:]( objc_alloc(&OBJC_CLASS___SUCoreFSM),  "initMachine:withTable:startingIn:usingDelegate:registeringAllInfoClass:",  @"MADCacheDeleteManager",  v2->_stateTable,  @"Startup",  v2,  objc_opt_class(&OBJC_CLASS___MADCacheDeleteManagerEventInfo));
    stateMachine = v2->_stateMachine;
    v2->_stateMachine = v18;

    if (!v2->_stateMachine)
    {
      id v24 = 0LL;
      goto LABEL_10;
    }

    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager stateMachine](v2, "stateMachine"));
    id v21 = objc_alloc_init(&OBJC_CLASS___MADCacheDeleteManagerEventInfo);
    [v20 postEvent:@"Activate" withInfo:v21];

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 oslog]);

    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "MADCacheDeleteManager completed init...", v26, 2u);
    }
  }

  id v24 = v2;
LABEL_10:

  return v24;
}

- (BOOL)maCacheDeleteSupported:(id *)a3
{
  if (!&_os_variant_uses_ephemeral_storage)
  {
    if (a3)
    {
      BOOL v4 = 0;
      id v5 = @"MobileAsset space check disabled because unable to determine whether mobileassetd is running in NeRD or not";
      goto LABEL_7;
    }

    return 0;
  }

  if (os_variant_uses_ephemeral_storage("com.apple.MobileAsset", a2))
  {
    if (a3)
    {
      BOOL v4 = 0;
      id v5 = @"MobileAsset space check is not supported in NeRD";
LABEL_7:
      *a3 = v5;
      return v4;
    }

    return 0;
  }

  self_entitlements = _xpc_runtime_get_self_entitlements();
  v7 = (void *)objc_claimAutoreleasedReturnValue(self_entitlements);
  v8 = v7;
  if (v7)
  {
    xpc_object_t array = xpc_dictionary_get_array(v7, "com.apple.security.exception.mach-lookup.global-name");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(array);
    if (v10)
    {
      id v11 = v10;
      if (xpc_array_get_count(v10))
      {
        size_t v12 = 0LL;
        char v13 = 0;
        char v14 = 0;
        while (1)
        {
          xpc_object_t value = xpc_array_get_value(v11, v12);
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(value);
          uint64_t v17 = v16;
          if (!v16 || xpc_get_type(v16) != (xpc_type_t)&_xpc_type_string) {
            goto LABEL_20;
          }
          string_ptr = xpc_string_get_string_ptr(v17);
          if (!string_ptr) {
            goto LABEL_18;
          }
          uint64_t v19 = string_ptr;
          if (strncmp(string_ptr, "com.apple.cache_delete", 0x17uLL)) {
            break;
          }
          char v13 = 1;
LABEL_19:
          if ((v14 & 1) != 0)
          {

            BOOL v4 = 1;
            goto LABEL_26;
          }

- (void)checkAvailableSpace:(unint64_t)a3 allowPurgeWithUrgency:(int)a4 withCompletionQueue:(id)a5 completion:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a6;
  id v23 = 0LL;
  id v11 = (dispatch_queue_s *)a5;
  unsigned int v12 = -[MADCacheDeleteManager maCacheDeleteSupported:](self, "maCacheDeleteSupported:", &v23);
  char v13 = (__CFString *)v23;
  if (v12)
  {
    char v14 = -[MADCacheDeleteManagerEventInfo initWithTotalRequiredFreeSpace:cacheDeleteUrgency:completionQueue:completion:]( objc_alloc(&OBJC_CLASS___MADCacheDeleteManagerEventInfo),  "initWithTotalRequiredFreeSpace:cacheDeleteUrgency:completionQueue:completion:",  a3,  v7,  v11,  v10);

    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager stateMachine](self, "stateMachine"));
    [v15 postEvent:@"ClientSpaceCheckRequest" withInfo:v14];
  }

  else
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[MADCacheDeleteManagerError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MADCacheDeleteManagerError,  "buildError:fromOperation:underlyingError:withDescription:",  3LL,  @"checkAvailableSpace",  0LL,  v13));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager logger](self, "logger"));
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 oslog]);

    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = @"None";
      if (v13) {
        uint64_t v19 = v13;
      }
      *(_DWORD *)statfs buf = 138412290;
      uint64_t v25 = v19;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Reason for not doing space check: %@", buf, 0xCu);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __98__MADCacheDeleteManager_checkAvailableSpace_allowPurgeWithUrgency_withCompletionQueue_completion___block_invoke;
    block[3] = &unk_34E208;
    id v21 = v16;
    id v22 = v10;
    char v14 = v16;
    dispatch_async(v11, block);

    id v15 = v22;
  }
}

uint64_t __98__MADCacheDeleteManager_checkAvailableSpace_allowPurgeWithUrgency_withCompletionQueue_completion___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  0LL,  0LL,  *(void *)(a1 + 32));
}

- (void)notifyDownloadCompleted:(id)a3
{
  id v4 = a3;
  v6 = -[MADCacheDeleteManagerEventInfo initWithSpaceCheckedID:]( objc_alloc(&OBJC_CLASS___MADCacheDeleteManagerEventInfo),  "initWithSpaceCheckedID:",  v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager stateMachine](self, "stateMachine"));
  [v5 postEvent:@"ClientDownloadCompleted" withInfo:v6];
}

- (void)notifyDownloadCompleted:(id)a3 withSpaceNoLongerNeeded:(unint64_t)a4
{
  id v6 = a3;
  v8 = -[MADCacheDeleteManagerEventInfo initWithSpaceCheckedID:]( objc_alloc(&OBJC_CLASS___MADCacheDeleteManagerEventInfo),  "initWithSpaceCheckedID:",  v6);

  -[MADCacheDeleteManagerEventInfo setSpaceNoLongerNeeded:](v8, "setSpaceNoLongerNeeded:", a4);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManager stateMachine](self, "stateMachine"));
  [v7 postEvent:@"ClientDownloadCompleted" withInfo:v8];
}

- (NSDictionary)stateTable
{
  return self->_stateTable;
}

- (SUCoreFSM)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (NSMutableArray)spaceCheckRequests
{
  return self->_spaceCheckRequests;
}

- (void)setSpaceCheckRequests:(id)a3
{
}

- (NSMutableArray)downloadsUsingSpace
{
  return self->_downloadsUsingSpace;
}

- (void)setDownloadsUsingSpace:(id)a3
{
}

- (NSLock)spaceCheckRequestsLock
{
  return self->_spaceCheckRequestsLock;
}

- (void)setSpaceCheckRequestsLock:(id)a3
{
}

- (NSLock)downloadsUsingSpaceLock
{
  return self->_downloadsUsingSpaceLock;
}

- (void)setDownloadsUsingSpaceLock:(id)a3
{
}

- (SUCoreLog)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
}

- (void)actionUnknownAction:(uint64_t)a1 error:(os_log_s *)a2 .cold.1(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Unknown FSM action(%@)", (uint8_t *)&v2, 0xCu);
}

@end
}

void sub_100002E7C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

uint64_t sub_100002E9C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100002EAC(uint64_t a1)
{
}

void sub_100002EB4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = sub_10008C90C();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 136315650;
    v26 = "-[W5DiagnosticsModeManager _startDiagnosticsModeWithConfiguration:currentPeer:reply:]_block_invoke";
    __int16 v27 = 2114;
    id v28 = v6;
    __int16 v29 = 2114;
    id v30 = v5;
    int v20 = 32;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[wifivelocity] %s: [DM] start DM finished errors='%{public}@' mode='%{public}@'",  &v25,  v20);
  }

  uint64_t v9 = *(void *)(a1 + 56);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
  (*(void (**)(uint64_t, id, void *))(v9 + 16))(v9, v5, v10);

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000030B4;
  block[3] = &unk_1000D0F30;
  id v13 = *(id *)(a1 + 32);
  uint64_t v14 = *(void *)(a1 + 40);
  id v22 = v13;
  uint64_t v23 = v14;
  id v24 = v5;
  id v15 = v5;
  dispatch_async(v12, block);

  v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) processors]);
  [v16 removeObject:*(void *)(a1 + 48)];

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[W5ActivityManager sharedActivityManager](&OBJC_CLASS___W5ActivityManager, "sharedActivityManager"));
  [v17 osTransactionComplete:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];

  uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8LL);
  v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = 0LL;
}

void sub_1000030B4(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  if ([*(id *)(a1 + 32) role] != (id)8) {
    [*(id *)(a1 + 40) _finishedProcessingDiagnosticMode:*(void *)(a1 + 48)];
  }
  objc_autoreleasePoolPop(v2);
}

void sub_100003410(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    uint64_t v16 = sub_10008C90C();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void *)(a1 + 56);
      v19 = *(void **)(a1 + 32);
      int v41 = 136315650;
      v42 = "-[W5DiagnosticsModeManager stopDiagnosticsModeWithUUID:info:reply:]_block_invoke";
      __int16 v43 = 2112;
      uint64_t v44 = v18;
      __int16 v45 = 2114;
      v46 = v19;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  0LL,  "[wifivelocity] %s: [DM] DM was not running on peer (%@) with uuid='%{public}@'",  &v41,  32);
    }

    int v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) UUIDString]);
    v21 = (void *)objc_claimAutoreleasedReturnValue([0 uuid]);
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 UUIDString]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Diagnostic mode is running on this device, but the UUID provided (%@) doesn't match (%@).",  v20,  v22));

    uint64_t v23 = *(void *)(a1 + 64);
    NSErrorUserInfoKey v37 = NSLocalizedFailureReasonErrorKey;
    v38 = @"W5InternalErr";
    id v24 = &v38;
    int v25 = &v37;
    goto LABEL_11;
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 uuid]);
  unsigned int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (!v8)
  {
    uint64_t v26 = sub_10008C90C();
    __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = *(void *)(a1 + 32);
      __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v5 uuid]);
      int v41 = 136315650;
      v42 = "-[W5DiagnosticsModeManager stopDiagnosticsModeWithUUID:info:reply:]_block_invoke";
      __int16 v43 = 2114;
      uint64_t v44 = v28;
      __int16 v45 = 2114;
      v46 = v29;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v27,  0LL,  "[wifivelocity] %s: [DM] non-matching expected='%{public}@' found='%{public}@'",  &v41,  32);
    }

    id v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) UUIDString]);
    v31 = (void *)objc_claimAutoreleasedReturnValue([v5 uuid]);
    v32 = (void *)objc_claimAutoreleasedReturnValue([v31 UUIDString]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Diagnostic mode is running on this device, but the UUID provided (%@) doesn't match (%@).",  v30,  v32));

    uint64_t v23 = *(void *)(a1 + 64);
    NSErrorUserInfoKey v39 = NSLocalizedFailureReasonErrorKey;
    v40 = @"W5InternalErr";
    id v24 = &v40;
    int v25 = &v39;
LABEL_11:
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v25,  1LL));
    v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  9LL,  v33));
    (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v34);

    goto LABEL_14;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 peers]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) localPeer]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 peerID]);
  id v12 = sub_100086510(v9, v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  uint64_t v14 = objc_alloc(&OBJC_CLASS___W5DiagnosticsModePeer);
  if (v13) {
    uint64_t v15 = (uint64_t)[v13 role];
  }
  else {
    uint64_t v15 = 8LL;
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) localPeer]);
  v36 = -[W5DiagnosticsModePeer initWithRole:peer:](v14, "initWithRole:peer:", v15, v35);

  [*(id *)(a1 + 40) _stopDiagnosticsMode:v5 currentPeer:v36 info:*(void *)(a1 + 48) reply:*(void *)(a1 + 64)];
LABEL_14:
}

void sub_100003AE8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_100003B08(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = sub_10008C90C();
  unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 136315394;
    uint64_t v23 = "-[W5DiagnosticsModeManager _stopDiagnosticsMode:currentPeer:info:reply:]_block_invoke";
    __int16 v24 = 2114;
    id v25 = v6;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[wifivelocity] %s: [DM] stop DM finished errors='%{public}@'",  &v22,  22);
  }

  uint64_t v9 = *(void *)(a1 + 56);
  if (v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }

  else
  {
    (*(void (**)(void, void))(v9 + 16))(*(void *)(a1 + 56), 0LL);
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100003D14;
  block[3] = &unk_1000D0F30;
  id v19 = *(id *)(a1 + 32);
  id v20 = v5;
  uint64_t v21 = *(void *)(a1 + 40);
  id v13 = v5;
  dispatch_async(v12, block);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) processors]);
  [v14 removeObject:*(void *)(a1 + 48)];

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[W5ActivityManager sharedActivityManager](&OBJC_CLASS___W5ActivityManager, "sharedActivityManager"));
  [v15 osTransactionComplete:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];

  uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8LL);
  v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = 0LL;
}

void sub_100003D14(id *a1)
{
  v2 = objc_autoreleasePoolPush();
  if ([a1[4] role] != (id)8
    || [a1[4] role] == (id)8 && objc_msgSend(a1[5], "state") == (id)5)
  {
    [a1[6] _finishedProcessingDiagnosticMode:a1[5]];
  }

  objc_autoreleasePoolPop(v2);
}

void sub_100003E6C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a2;
    id v6 = (id)objc_claimAutoreleasedReturnValue([a3 diagnosticsMode]);
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);
  }

LABEL_15:
    id v25 = 0LL;
    uint64_t v26 = 0LL;
    id v6 = v54;
LABEL_20:
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager store](v52, "store"));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);
    v34 = (void *)objc_claimAutoreleasedReturnValue([v32 diagnosticsModeMatchingUUID:v33]);

    if (v34)
    {
      v35 = [v34 state];
      v36 = sub_10008C90C();
      NSErrorUserInfoKey v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
      if (v35 == (id)10)
      {
        if (v38)
        {
          v63 = 136315650;
          v64 = "-[W5DiagnosticsModeManager updateDiagnosticsMode:reply:]";
          v65 = 2080;
          v66 = "W5DiagnosticsModeManager.m";
          v67 = 1024;
          v68 = 351;
          LODWORD(v50) = 28;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v37,  0LL,  "[wifivelocity] %s (%s:%u) [DM] Locally stored DM is already for waiting for collection, returning",  (const char *)&v63,  v50,  v51);
        }

        uint64_t v7 = v53;
        goto LABEL_35;
      }

      if (v38)
      {
        v63 = 136315906;
        v64 = "-[W5DiagnosticsModeManager updateDiagnosticsMode:reply:]";
        v65 = 2080;
        v66 = "W5DiagnosticsModeManager.m";
        v67 = 1024;
        v68 = 355;
        v69 = 2112;
        v70 = (const char *)v34;
        LODWORD(v50) = 38;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v37,  0LL,  "[wifivelocity] %s (%s:%u) [DM] Updating existing local mode: %@",  &v63,  v50);
      }
    }

    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472LL;
    v55[2] = sub_1000047A0;
    v55[3] = &unk_1000D0FD0;
    uint64_t v7 = v53;
    v56 = v53;
    -[W5DiagnosticsModeManager _updateDiagnosticsMode:incomingMode:currentPeer:reply:]( v52,  "_updateDiagnosticsMode:incomingMode:currentPeer:reply:",  v34,  v6,  v14,  v55);
    NSErrorUserInfoKey v37 = v56;
LABEL_35:

LABEL_36:
    goto LABEL_37;
  }

  __int16 v27 = sub_10008C90C();
  uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v63 = 136315650;
    v64 = "-[W5DiagnosticsModeManager updateDiagnosticsMode:reply:]";
    v65 = 2080;
    v66 = "W5DiagnosticsModeManager.m";
    v67 = 1024;
    v68 = 312;
    LODWORD(v50) = 28;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v28,  0LL,  "[wifivelocity] %s (%s:%u) [DM] mode is nil",  (const char *)&v63,  v50,  v51);
  }

  v78 = NSLocalizedFailureReasonErrorKey;
  v79 = @"W5ParamErr";
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v79,  &v78,  1LL));
  id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  1LL,  v14));
  v7[2](v7, v25);
LABEL_37:
}

uint64_t sub_1000047A0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100004A7C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100004A9C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = sub_10008C90C();
  unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136315394;
    uint64_t v21 = "-[W5DiagnosticsModeManager _updateDiagnosticsMode:incomingMode:currentPeer:reply:]_block_invoke";
    __int16 v22 = 2114;
    id v23 = v6;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[wifivelocity] %s: [DM] update DM finished errors='%{public}@'",  &v20,  22);
  }

  uint64_t v9 = *(void *)(a1 + 48);
  if (v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }

  else
  {
    (*(void (**)(void, void))(v9 + 16))(*(void *)(a1 + 48), 0LL);
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004C94;
  block[3] = &unk_1000D0FF8;
  void block[4] = *(void *)(a1 + 32);
  id v19 = v5;
  id v13 = v5;
  dispatch_async(v12, block);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) processors]);
  [v14 removeObject:*(void *)(a1 + 40)];

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[W5ActivityManager sharedActivityManager](&OBJC_CLASS___W5ActivityManager, "sharedActivityManager"));
  [v15 osTransactionComplete:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

  uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8LL);
  v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = 0LL;
}

void sub_100004C94(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  [*(id *)(a1 + 32) _finishedProcessingDiagnosticMode:*(void *)(a1 + 40)];
  objc_autoreleasePoolPop(v2);
}

W5DiagnosticsActionResult *sub_100004D30(uint64_t a1, NSMutableSet *a2, void *a3, void *a4)
{
  id v227 = a3;
  id v225 = a4;
  uint64_t v6 = sub_10008C90C();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v8 = sub_100086280((unint64_t)a2);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 136316674;
    *(void *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "W5DiagnosticsModeManager.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v296) = 398;
    WORD2(v296) = 2080;
    *(void *)((char *)&v296 + 6) = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
    HIWORD(v296) = 2048;
    v297 = a2;
    __int16 v298 = 2112;
    uint64_t v299 = (uint64_t)v9;
    __int16 v300 = 2112;
    uint64_t v301 = (uint64_t)v225;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  0LL,  "[wifivelocity] %s (%s:%u) %s: [DM] action handler='%ld (%@)' info='%@'",  buf,  68);
  }

  v226 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsActionResult);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v227 peer]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 peerID]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) peerManager]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 localIDSIdentifier]);
  if (v11 == v13)
  {
    unsigned int v18 = 1;
  }

  else
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v227 peer]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 peerID]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) peerManager]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 localIDSIdentifier]);
    unsigned int v18 = [v15 isEqual:v17];
  }

  switch((unint64_t)a2)
  {
    case 0uLL:
      v55 = (void *)objc_claimAutoreleasedReturnValue([v225 objectForKeyedSubscript:@"DiagnosticsMode"]);
      if (!v55)
      {
        uint64_t v161 = sub_10008C90C();
        v162 = (os_log_s *)objc_claimAutoreleasedReturnValue(v161);
        if (os_log_type_enabled(v162, OS_LOG_TYPE_DEFAULT))
        {
          v163 = (NSMutableSet *)objc_claimAutoreleasedReturnValue([v227 peer]);
          *(_DWORD *)buf = 136316162;
          *(void *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "W5DiagnosticsModeManager.m";
          *(_WORD *)&buf[22] = 1024;
          LODWORD(v296) = 407;
          WORD2(v296) = 2080;
          *(void *)((char *)&v296 + 6) = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
          HIWORD(v296) = 2114;
          v297 = v163;
          LODWORD(v222) = 48;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v162,  0LL,  "[wifivelocity] %s (%s:%u) %s: no mode specified for sniffer peer='%{public}@'",  buf,  v222);
        }

        NSErrorUserInfoKey v309 = NSLocalizedFailureReasonErrorKey;
        v310 = @"W5ParamErr";
        v57 = (NSMutableSet *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v310,  &v309,  1LL));
        v164 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  1LL,  v57));
        -[W5DiagnosticsActionResult setError:](v226, "setError:", v164);

        goto LABEL_165;
      }

      v56 = (void *)objc_claimAutoreleasedReturnValue([v227 info]);
      v57 = (NSMutableSet *)objc_claimAutoreleasedReturnValue([v56 objectForKeyedSubscript:@"PrimaryChannel"]);

      if (!v57)
      {
        uint64_t v177 = sub_10008C90C();
        v178 = (os_log_s *)objc_claimAutoreleasedReturnValue(v177);
        if (os_log_type_enabled(v178, OS_LOG_TYPE_DEFAULT))
        {
          v179 = (NSMutableSet *)objc_claimAutoreleasedReturnValue([v227 peer]);
          *(_DWORD *)buf = 136316162;
          *(void *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "W5DiagnosticsModeManager.m";
          *(_WORD *)&buf[22] = 1024;
          LODWORD(v296) = 414;
          WORD2(v296) = 2080;
          *(void *)((char *)&v296 + 6) = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
          HIWORD(v296) = 2114;
          v297 = v179;
          LODWORD(v222) = 48;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v178,  0LL,  "[wifivelocity] %s (%s:%u) %s: no channel specified for sniffer peer='%{public}@'",  buf,  v222);
        }

        NSErrorUserInfoKey v307 = NSLocalizedFailureReasonErrorKey;
        v308 = @"W5ParamErr";
        v180 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v308,  &v307,  1LL));
        v181 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  1LL,  v180));
        -[W5DiagnosticsActionResult setError:](v226, "setError:", v181);

        v57 = 0LL;
        goto LABEL_165;
      }

      *(void *)location = 0LL;
      *(void *)&location[8] = location;
      *(void *)&location[16] = 0x3032000000LL;
      *(void *)&__int128 v305 = sub_100002E9C;
      *((void *)&v305 + 1) = sub_100002EAC;
      id v306 = 0LL;
      uint64_t v266 = 0LL;
      v267 = &v266;
      uint64_t v268 = 0x3032000000LL;
      v269 = sub_100002E9C;
      v270 = sub_100002EAC;
      id v271 = (id)objc_claimAutoreleasedReturnValue([v55 uuid]);
      uint64_t v260 = 0LL;
      v261 = &v260;
      uint64_t v262 = 0x3032000000LL;
      v263 = sub_100002E9C;
      v264 = sub_100002EAC;
      id v265 = 0LL;
      if (v18)
      {
        v58 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
        -[NSDateFormatter setDateFormat:](v58, "setDateFormat:", @"yyyy-MM-dd_HH.mm.ss.SSS");
        v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        v60 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v58, "stringFromDate:", v59));

        v61 = (void *)objc_claimAutoreleasedReturnValue([v227 peer]);
        v62 = (void *)objc_claimAutoreleasedReturnValue([v61 name]);
        v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_ch%li_%@.pcap",  v62,  -[NSMutableSet channel](v57, "channel"),  v60));

        v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/var/run/com.apple.wifivelocity"));
        uint64_t v65 = objc_claimAutoreleasedReturnValue([v64 URLByAppendingPathComponent:v63]);
        v66 = (void *)v261[5];
        v261[5] = v65;

        v67 = objc_alloc_init(&OBJC_CLASS___W5WiFiSnifferRequest);
        -[W5WiFiSnifferRequest setUuid:](v67, "setUuid:", v267[5]);
        -[W5WiFiSnifferRequest setChannel:](v67, "setChannel:", v57);
        -[W5WiFiSnifferRequest setDuration:](v67, "setDuration:", 86400.0);
        -[W5WiFiSnifferRequest setOutputFile:](v67, "setOutputFile:", v261[5]);
        -[W5WiFiSnifferRequest setMonitorMode:](v67, "setMonitorMode:", 1LL);
        -[W5WiFiSnifferRequest setTcpDump:](v67, "setTcpDump:", 1LL);
        -[W5WiFiSnifferRequest setNoAutoStop:](v67, "setNoAutoStop:", 1LL);
        -[W5WiFiSnifferRequest setRotationInterval:](v67, "setRotationInterval:", 900LL);
        v257[0] = _NSConcreteStackBlock;
        v257[1] = 3221225472LL;
        v257[2] = sub_100007A18;
        v257[3] = &unk_1000D1048;
        v259 = location;
        v68 = dispatch_semaphore_create(0LL);
        v258 = v68;
        -[W5WiFiSnifferRequest setReply:](v67, "setReply:", v257);
        v69 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) snifferManager]);
        [v69 addRequest:v67];

        uint64_t v70 = sub_10008C90C();
        v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v72 = v267[5];
          uint64_t v73 = v261[5];
          *(_DWORD *)buf = 136316930;
          *(void *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke_2";
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "W5DiagnosticsModeManager.m";
          *(_WORD *)&buf[22] = 1024;
          LODWORD(v296) = 449;
          WORD2(v296) = 2112;
          *(void *)((char *)&v296 + 6) = v72;
          HIWORD(v296) = 2112;
          v297 = v57;
          __int16 v298 = 2048;
          uint64_t v299 = 86400LL;
          __int16 v300 = 2048;
          uint64_t v301 = 900LL;
          __int16 v302 = 2112;
          uint64_t v303 = v73;
          LODWORD(v223) = 78;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v71,  0LL,  "[wifivelocity] %s (%s:%u) Sniffer Request added to queue with UUID: %@, channel: %@, duration: %ld, rotation interval: %ld, outputFile: %@",  buf,  v223);
        }

        [*(id *)(a1 + 32) _storeSnifferInfo:v55 peer:v227 uuid:v267[5] path:v261[5]];
        dispatch_time_t v74 = dispatch_time(0LL, 30000000000LL);
        if (dispatch_semaphore_wait(v68, v74) >= 1
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134349056;
          *(void *)&buf[4] = 0x403E000000000000LL;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing",  buf,  0xCu);
        }

        v75 = v226;
      }

      else
      {
        v191 = (void *)objc_claimAutoreleasedReturnValue([v227 peer]);
        id v192 = [v191 copy];

        [v192 setControlFlags:1];
        dispatch_semaphore_t v193 = dispatch_semaphore_create(0LL);
        v194 = objc_alloc(&OBJC_CLASS___W5PeerSnifferRequest);
        uint64_t v195 = v267[5];
        v294 = v57;
        v196 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v294,  1LL));
        v251[0] = _NSConcreteStackBlock;
        v251[1] = 3221225472LL;
        v251[2] = sub_100007A64;
        v251[3] = &unk_1000D1070;
        v254 = location;
        v255 = &v260;
        v252 = v57;
        v256 = &v266;
        v197 = v193;
        v253 = v197;
        v198 = -[W5PeerSnifferRequest initWithPeer:requestType:duration:uuid:channels:config:reply:]( v194,  "initWithPeer:requestType:duration:uuid:channels:config:reply:",  v192,  1LL,  v195,  v196,  &off_1000E1B10,  v251,  86400.0);

        v199 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) peerManager]);
        v200 = (NSMutableSet *)objc_claimAutoreleasedReturnValue([v199 runSnifferAtPeerWithRequest:v198]);

        if (v200)
        {
          uint64_t v201 = sub_10008C90C();
          v202 = (os_log_s *)objc_claimAutoreleasedReturnValue(v201);
          if (os_log_type_enabled(v202, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            *(void *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke_2";
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "W5DiagnosticsModeManager.m";
            *(_WORD *)&buf[22] = 1024;
            LODWORD(v296) = 474;
            WORD2(v296) = 2114;
            *(void *)((char *)&v296 + 6) = v227;
            HIWORD(v296) = 2114;
            v297 = v200;
            LODWORD(v222) = 48;
            _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v202,  0LL,  "[wifivelocity] %s (%s:%u) sniffer start failed for peer='%{public}@' error='%{public}@'",  buf,  v222);
          }

          -[W5DiagnosticsActionResult setError:](v226, "setError:", v200);
        }

        else
        {
          dispatch_time_t v214 = dispatch_time(0LL, 30000000000LL);
          if (dispatch_semaphore_wait(v197, v214) >= 1
            && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134349056;
            *(void *)&buf[4] = 0x403E000000000000LL;
            _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing",  buf,  0xCu);
          }
        }

        v75 = v226;
        if (v200) {
          goto LABEL_164;
        }
      }

      -[W5DiagnosticsActionResult setUuid:](v75, "setUuid:", v267[5]);
      -[W5DiagnosticsActionResult setError:](v75, "setError:", *(void *)(*(void *)&location[8] + 40LL));
      if (v267[5] && v261[5]) {
        objc_msgSend(*(id *)(a1 + 32), "_storeSnifferInfo:peer:uuid:path:", v55, v227);
      }
      -[W5DiagnosticsActionResult setPeer:](v75, "setPeer:", v227);
LABEL_164:
      _Block_object_dispose(&v260, 8);

      _Block_object_dispose(&v266, 8);
      _Block_object_dispose(location, 8);

LABEL_165:
      goto LABEL_166;
    case 1uLL:
      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000LL;
      *(void *)&__int128 v296 = sub_100002E9C;
      *((void *)&v296 + 1) = sub_100002EAC;
      v297 = 0LL;
      v76 = (void *)objc_claimAutoreleasedReturnValue([v225 objectForKeyedSubscript:@"DiagnosticsMode"]);
      v77 = (void *)objc_claimAutoreleasedReturnValue([v227 info]);
      v78 = (void *)objc_claimAutoreleasedReturnValue([v77 objectForKey:@"UUID"]);

      if (!v78)
      {
        v79 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localStore]);
        v80 = (void *)objc_claimAutoreleasedReturnValue([v79 infoMatchingDiagnosticMode:v76]);

        if (!v80) {
          goto LABEL_44;
        }
        v78 = (void *)objc_claimAutoreleasedReturnValue([v80 objectForKey:@"UUID"]);
        uint64_t v81 = sub_10008C90C();
        v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)location = 136315906;
          *(void *)&location[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
          *(_WORD *)&location[12] = 2080;
          *(void *)&location[14] = "W5DiagnosticsModeManager.m";
          *(_WORD *)&location[22] = 1024;
          LODWORD(v305) = 500;
          WORD2(v305) = 2114;
          *(void *)((char *)&v305 + 6) = v78;
          LODWORD(v222) = 38;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v82,  0LL,  "[wifivelocity] %s (%s:%u) [DM] UUID for stopping sniffer='%{public}@' [local store]",  location,  v222);
        }

        if (!v78)
        {
LABEL_44:
          uint64_t v83 = sub_10008C90C();
          v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v83);
          if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
          {
            v85 = (void *)objc_claimAutoreleasedReturnValue([v227 peer]);
            *(_DWORD *)location = 136315906;
            *(void *)&location[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
            *(_WORD *)&location[12] = 2080;
            *(void *)&location[14] = "W5DiagnosticsModeManager.m";
            *(_WORD *)&location[22] = 1024;
            LODWORD(v305) = 505;
            WORD2(v305) = 2114;
            *(void *)((char *)&v305 + 6) = v85;
            LODWORD(v222) = 38;
            _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v84,  0LL,  "[wifivelocity] %s (%s:%u) No UUID specified for sniffer peer='%{public}@'",  location,  v222);
          }

          uint64_t v86 = sub_10008C90C();
          v87 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
          if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
          {
            v88 = (void *)objc_claimAutoreleasedReturnValue([v76 uuid]);
            *(_DWORD *)location = 136316162;
            *(void *)&location[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
            *(_WORD *)&location[12] = 2080;
            *(void *)&location[14] = "W5DiagnosticsModeManager.m";
            *(_WORD *)&location[22] = 1024;
            LODWORD(v305) = 506;
            WORD2(v305) = 2080;
            *(void *)((char *)&v305 + 6) = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
            HIWORD(v305) = 2112;
            id v306 = v88;
            LODWORD(v222) = 48;
            _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v87,  0LL,  "[wifivelocity] %s (%s:%u) %s: using DM UUID (%@) to stop sniffer",  location,  v222);
          }

          v78 = (void *)objc_claimAutoreleasedReturnValue([v76 uuid]);
        }
      }

      if (v18)
      {
        dispatch_semaphore_t v89 = dispatch_semaphore_create(0LL);
        v90 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) snifferManager]);
        v247[0] = _NSConcreteStackBlock;
        v247[1] = 3221225472LL;
        v247[2] = sub_100007B2C;
        v247[3] = &unk_1000D1098;
        v250 = buf;
        id v91 = v78;
        id v248 = v91;
        v92 = v89;
        v249 = v92;
        [v90 cancelRequestWithUUID:v91 reply:v247];

        dispatch_time_t v93 = dispatch_time(0LL, 30000000000LL);
        if (dispatch_semaphore_wait(v92, v93) >= 1
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)location = 134349056;
          *(void *)&location[4] = 0x403E000000000000LL;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing",  location,  0xCu);
        }

        uint64_t v94 = sub_10008C90C();
        v95 = (os_log_s *)objc_claimAutoreleasedReturnValue(v94);
        if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)location = 136315906;
          *(void *)&location[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
          *(_WORD *)&location[12] = 2080;
          *(void *)&location[14] = "W5DiagnosticsModeManager.m";
          *(_WORD *)&location[22] = 1024;
          LODWORD(v305) = 519;
          WORD2(v305) = 2112;
          *(void *)((char *)&v305 + 6) = v91;
          LODWORD(v222) = 38;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v95,  0LL,  "[wifivelocity] %s (%s:%u) Cancelled Sniffer Request with UUID: %@",  location,  v222);
        }
      }

      else
      {
        v150 = (void *)objc_claimAutoreleasedReturnValue([v227 peer]);
        id v151 = [v150 copy];

        [v151 setControlFlags:1];
        dispatch_semaphore_t v152 = dispatch_semaphore_create(0LL);
        v153 = objc_alloc(&OBJC_CLASS___W5PeerSnifferRequest);
        v244[0] = _NSConcreteStackBlock;
        v244[1] = 3221225472LL;
        v244[2] = sub_100007C5C;
        v244[3] = &unk_1000D10C0;
        v246 = buf;
        v154 = v152;
        v245 = v154;
        v155 = -[W5PeerSnifferRequest initWithPeer:requestType:duration:uuid:channels:config:reply:]( v153,  "initWithPeer:requestType:duration:uuid:channels:config:reply:",  v151,  2LL,  v78,  0LL,  0LL,  v244,  0.0);
        v156 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) peerManager]);
        v157 = (void *)objc_claimAutoreleasedReturnValue([v156 runSnifferAtPeerWithRequest:v155]);

        if (v157)
        {
          uint64_t v158 = sub_10008C90C();
          v159 = (os_log_s *)objc_claimAutoreleasedReturnValue(v158);
          if (os_log_type_enabled(v159, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)location = 136316162;
            *(void *)&location[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke_2";
            *(_WORD *)&location[12] = 2080;
            *(void *)&location[14] = "W5DiagnosticsModeManager.m";
            *(_WORD *)&location[22] = 1024;
            LODWORD(v305) = 541;
            WORD2(v305) = 2114;
            *(void *)((char *)&v305 + 6) = v227;
            HIWORD(v305) = 2114;
            id v306 = v157;
            LODWORD(v222) = 48;
            _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v159,  0LL,  "[wifivelocity] %s (%s:%u) sniffer stop failed for peer='%{public}@' error='%{public}@'",  location,  v222);
          }

          -[W5DiagnosticsActionResult setError:](v226, "setError:", v157);
        }

        else
        {
          dispatch_time_t v203 = dispatch_time(0LL, 30000000000LL);
          if (dispatch_semaphore_wait(v154, v203) >= 1
            && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)location = 134349056;
            *(void *)&location[4] = 0x403E000000000000LL;
            _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing",  location,  0xCu);
          }
        }

        if (v157)
        {
LABEL_149:

          _Block_object_dispose(buf, 8);
          goto LABEL_166;
        }
      }

      -[W5DiagnosticsActionResult setError:](v226, "setError:", *(void *)(*(void *)&buf[8] + 40LL));
      goto LABEL_149;
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v225 objectForKeyedSubscript:@"DiagnosticsMode"]);
      if (v19)
      {
        if (!v18)
        {
          id v22 = -[W5DebugConfiguration initDiagnosticsMode:wifiState:megaWiFiProfileState:noLoggingWiFiProfileState:eapolState:bluetoothState:]( objc_alloc(&OBJC_CLASS___W5DebugConfiguration),  "initDiagnosticsMode:wifiState:megaWiFiProfileState:noLoggingWiFiProfileState:eapolState:bluetoothState:",  v19,  0LL,  0LL,  0LL,  0LL,  0LL);
          *(void *)buf = 0LL;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000LL;
          *(void *)&__int128 v296 = sub_100002E9C;
          *((void *)&v296 + 1) = sub_100002EAC;
          v297 = 0LL;
          int v41 = (void *)objc_claimAutoreleasedReturnValue([v227 peer]);
          if (a2 == (NSMutableSet *)5)
          {
            v42 = (void *)objc_claimAutoreleasedReturnValue([v227 peer]);
            id v43 = [v42 copy];

            [v43 setControlFlags:1];
            int v41 = v43;
          }

          dispatch_semaphore_t v44 = dispatch_semaphore_create(0LL);
          NSErrorUserInfoKey v286 = NSLocalizedFailureReasonErrorKey;
          v287 = @"W5TimeoutErr";
          __int16 v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v287,  &v286,  1LL));
          uint64_t v46 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  3LL,  v45));
          v47 = *(void **)(*(void *)&buf[8] + 40LL);
          *(void *)(*(void *)&buf[8] + 40LL) = v46;

          v48 = objc_alloc(&OBJC_CLASS___W5PeerDebugConfigurationRequest);
          v241[0] = _NSConcreteStackBlock;
          v241[1] = 3221225472LL;
          v241[2] = sub_100007CA8;
          v241[3] = &unk_1000D10E8;
          v243 = buf;
          v49 = v44;
          v242 = v49;
          v50 = -[W5PeerDebugConfigurationRequest initWithPeer:type:debugConfiguration:reply:]( v48,  "initWithPeer:type:debugConfiguration:reply:",  v41,  2LL,  v22,  v241);
          v51 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) peerManager]);
          v52 = (void *)objc_claimAutoreleasedReturnValue([v51 sendDebugConfigurationForPeerWithRequest:v50]);

          if (v52)
          {
            uint64_t v53 = sub_10008C90C();
            v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)location = 136316162;
              *(void *)&location[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke_2";
              *(_WORD *)&location[12] = 2080;
              *(void *)&location[14] = "W5DiagnosticsModeManager.m";
              *(_WORD *)&location[22] = 1024;
              LODWORD(v305) = 611;
              WORD2(v305) = 2114;
              *(void *)((char *)&v305 + 6) = v227;
              HIWORD(v305) = 2114;
              id v306 = v52;
              LODWORD(v222) = 48;
              _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v54,  0LL,  "[wifivelocity] %s (%s:%u) [DM] failed to set dm for peer='%{public}@' error='%{public}@'",  location,  v222);
            }

            -[W5DiagnosticsActionResult setError:](v226, "setError:", v52);
          }

          else
          {
            dispatch_time_t v160 = dispatch_time(0LL, 30000000000LL);
            if (dispatch_semaphore_wait(v49, v160) >= 1
              && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)location = 134349056;
              *(void *)&location[4] = 0x403E000000000000LL;
              _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing",  location,  0xCu);
            }

            -[W5DiagnosticsActionResult setError:](v226, "setError:", *(void *)(*(void *)&buf[8] + 40LL));
          }

          _Block_object_dispose(buf, 8);
          goto LABEL_109;
        }

        int v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) store]);
        [v20 updateStoreWithDiagnosticsMode:v19];

        if (([v227 role] & 4) == 0)
        {
LABEL_110:

          goto LABEL_166;
        }

        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v227 info]);
        id v22 = (id)objc_claimAutoreleasedReturnValue([v21 objectForKey:@"UUID"]);

        id v23 = (void *)objc_claimAutoreleasedReturnValue([v227 info]);
        __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKey:@"path"]);

        if (v24 && v22)
        {
          id v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localStore]);
          v290[0] = @"UUID";
          v290[1] = @"path";
          v291[0] = v22;
          v291[1] = v24;
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v291,  v290,  2LL));
          [v25 addToStore:v19 newInfo:v26];

LABEL_109:
          goto LABEL_110;
        }

        uint64_t v172 = sub_10008C90C();
        v173 = (os_log_s *)objc_claimAutoreleasedReturnValue(v172);
        if (os_log_type_enabled(v173, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          *(void *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "W5DiagnosticsModeManager.m";
          *(_WORD *)&buf[22] = 1024;
          LODWORD(v296) = 575;
          WORD2(v296) = 2112;
          *(void *)((char *)&v296 + 6) = v227;
          LODWORD(v222) = 38;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v173,  0LL,  "[wifivelocity] %s (%s:%u) [DM] Sniffer information missing from DM peer: %@",  buf,  v222);
        }

        NSErrorUserInfoKey v288 = NSLocalizedFailureReasonErrorKey;
        v289 = @"W5ParamErr";
        v174 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v289,  &v288,  1LL));
        v175 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  1LL,  v174));
        -[W5DiagnosticsActionResult setError:](v226, "setError:", v175);

        v176 = v226;
      }

      else
      {
        NSErrorUserInfoKey v292 = NSLocalizedFailureReasonErrorKey;
        v293 = @"W5ParamErr";
        v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v293,  &v292,  1LL));
        v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  1LL,  v35));
        -[W5DiagnosticsActionResult setError:](v226, "setError:", v36);

        NSErrorUserInfoKey v37 = v226;
      }

      goto LABEL_22;
    case 6uLL:
      v96 = (void *)objc_claimAutoreleasedReturnValue([v225 objectForKeyedSubscript:@"DiagnosticsMode"]);
      if (!v96)
      {
        NSErrorUserInfoKey v284 = NSLocalizedFailureReasonErrorKey;
        v285 = @"W5ParamErr";
        v165 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v285,  &v284,  1LL));
        v166 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  1LL,  v165));
        -[W5DiagnosticsActionResult setError:](v226, "setError:", v166);

        goto LABEL_166;
      }

      v97 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) netUsageManager]);
      v98 = (void *)objc_claimAutoreleasedReturnValue([v96 uuid]);
      [v97 recordUsageToDate:v98];

      v99 = (void *)objc_claimAutoreleasedReturnValue([v225 objectForKey:@"event"]);
      id v100 = [v99 integerValue];

      if (v100 == (id)1)
      {
        v101 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) netUsageManager]);
        v102 = (void *)objc_claimAutoreleasedReturnValue([v96 uuid]);
        [v101 stopPeriodicUsageMonitor:v102];
      }

      else
      {
        if (v100) {
          goto LABEL_139;
        }
        v101 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) netUsageManager]);
        v102 = (void *)objc_claimAutoreleasedReturnValue([v96 uuid]);
        [v101 startPeriodicUsageMonitor:180 maxEntries:v102 uuid:10.0];
      }

LABEL_139:
      goto LABEL_166;
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
      __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v225 objectForKeyedSubscript:@"DiagnosticsMode"]);
      if (v27)
      {
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localStore]);
        __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v28 infoMatchingDiagnosticMode:v27]);

        switch((unint64_t)a2)
        {
          case 7uLL:
            if (v29)
            {
              id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKey:@"TestOutputDirectory"]);
              BOOL v31 = v30 == 0LL;

              if (!v31)
              {
                uint64_t v32 = sub_10008C90C();
                v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                {
                  v34 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKey:@"TestOutputDirectory"]);
                  *(_DWORD *)buf = 136315906;
                  *(void *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
                  *(_WORD *)&buf[12] = 2080;
                  *(void *)&buf[14] = "W5DiagnosticsModeManager.m";
                  *(_WORD *)&buf[22] = 1024;
                  LODWORD(v296) = 721;
                  WORD2(v296) = 2114;
                  *(void *)((char *)&v296 + 6) = v34;
                  LODWORD(v222) = 38;
                  _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v33,  0LL,  "[wifivelocity] %s (%s:%u) [DM] tests have already been run for this fault output='%{public}@'",  buf,  v222);
                }

                goto LABEL_99;
              }
            }

            [*(id *)(a1 + 32) _runDiagnosticsForDiagnosticMode:v27];
            break;
          case 8uLL:
            if (v29)
            {
              v138 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKey:@"analyticsCSVsOutputPath"]);
              BOOL v139 = v138 == 0LL;

              if (!v139)
              {
                uint64_t v140 = sub_10008C90C();
                v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v140);
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                {
                  v141 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKey:@"analyticsCSVsOutputPath"]);
                  *(_DWORD *)buf = 136315906;
                  *(void *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
                  *(_WORD *)&buf[12] = 2080;
                  *(void *)&buf[14] = "W5DiagnosticsModeManager.m";
                  *(_WORD *)&buf[22] = 1024;
                  LODWORD(v296) = 728;
                  WORD2(v296) = 2114;
                  *(void *)((char *)&v296 + 6) = v141;
                  LODWORD(v222) = 38;
                  _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v33,  0LL,  "[wifivelocity] %s (%s:%u) [DM] analytics CSVs have already been collected for this fault output='%{public}@'",  buf,  v222);
                }

                goto LABEL_99;
              }
            }

            [*(id *)(a1 + 32) _collectAnalyticsCSVsForDiagnosticMode:v27];
            break;
          case 9uLL:
            if (v29)
            {
              v142 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKey:@"systemLogsOutputPath"]);
              BOOL v143 = v142 == 0LL;

              if (!v143)
              {
                uint64_t v144 = sub_10008C90C();
                v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v144);
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                {
                  v145 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKey:@"systemLogsOutputPath"]);
                  *(_DWORD *)buf = 136315906;
                  *(void *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
                  *(_WORD *)&buf[12] = 2080;
                  *(void *)&buf[14] = "W5DiagnosticsModeManager.m";
                  *(_WORD *)&buf[22] = 1024;
                  LODWORD(v296) = 735;
                  WORD2(v296) = 2114;
                  *(void *)((char *)&v296 + 6) = v145;
                  LODWORD(v222) = 38;
                  _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v33,  0LL,  "[wifivelocity] %s (%s:%u) [DM] system logarchive has already been collected for this fault output='%{public}@'",  buf,  v222);
                }

                goto LABEL_99;
              }
            }

            [*(id *)(a1 + 32) _collectSystemLogsForDiagnosticMode:v27];
            break;
          case 0xAuLL:
            if (!v29
              || (v146 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKey:@"networkInfoOutputPath"]),
                  BOOL v147 = v146 == 0LL,
                  v146,
                  v147))
            {
              [*(id *)(a1 + 32) _collectNetworkInfoForDiagnosticMode:v27];
            }

            else
            {
              uint64_t v148 = sub_10008C90C();
              v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v148);
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                v149 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKey:@"networkInfoOutputPath"]);
                *(_DWORD *)buf = 136315906;
                *(void *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
                *(_WORD *)&buf[12] = 2080;
                *(void *)&buf[14] = "W5DiagnosticsModeManager.m";
                *(_WORD *)&buf[22] = 1024;
                LODWORD(v296) = 742;
                WORD2(v296) = 2114;
                *(void *)((char *)&v296 + 6) = v149;
                LODWORD(v222) = 38;
                _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v33,  0LL,  "[wifivelocity] %s (%s:%u) [DM] network info has already been collected for this fault output='%{public}@'",  buf,  v222);
              }

LABEL_99:
            }

            break;
          default:
            break;
        }
      }

      else
      {
        NSErrorUserInfoKey v273 = NSLocalizedFailureReasonErrorKey;
        v274 = @"W5ParamErr";
        NSErrorUserInfoKey v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v274,  &v273,  1LL));
        v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  1LL,  v39));
        -[W5DiagnosticsActionResult setError:](v226, "setError:", v40);
      }

      goto LABEL_166;
    case 0xBuLL:
      v103 = (void *)objc_claimAutoreleasedReturnValue([v225 objectForKeyedSubscript:@"DiagnosticsMode"]);
      if (!v103)
      {
        uint64_t v167 = sub_10008C90C();
        v168 = (os_log_s *)objc_claimAutoreleasedReturnValue(v167);
        if (os_log_type_enabled(v168, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "W5DiagnosticsModeManager.m";
          *(_WORD *)&buf[22] = 1024;
          LODWORD(v296) = 647;
          LODWORD(v222) = 28;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v168,  0LL,  "[wifivelocity] %s (%s:%u) [DM] nil mode",  buf,  v222,  v224);
        }

        NSErrorUserInfoKey v282 = NSLocalizedFailureReasonErrorKey;
        v283 = @"W5ParamErr";
        v169 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v283,  &v282,  1LL));
        v170 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  1LL,  v169));
        -[W5DiagnosticsActionResult setError:](v226, "setError:", v170);

        goto LABEL_166;
      }

      objc_initWeak((id *)location, *(id *)(a1 + 32));
      v104 = (void *)objc_claimAutoreleasedReturnValue([v225 objectForKey:@"event"]);
      id v105 = [v104 integerValue];

      if (v105)
      {
        if (v105 != (id)1)
        {
LABEL_136:
          objc_destroyWeak((id *)location);

          goto LABEL_166;
        }

        v106 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localStore]);
        WeakRetained = (id *)objc_claimAutoreleasedReturnValue([v106 infoMatchingDiagnosticMode:v103]);

        if (WeakRetained)
        {
          v108 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained objectForKey:@"tcpdumpPID"]);
          v109 = v108;
          if (v108)
          {
            kill((pid_t)[v108 intValue], 9);
LABEL_135:

            goto LABEL_136;
          }

          uint64_t v217 = sub_10008C90C();
          v218 = (os_log_s *)objc_claimAutoreleasedReturnValue(v217);
          if (os_log_type_enabled(v218, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(void *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "W5DiagnosticsModeManager.m";
            *(_WORD *)&buf[22] = 1024;
            LODWORD(v296) = 695;
            LODWORD(v222) = 28;
            _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v218,  0LL,  "[wifivelocity] %s (%s:%u) [DM] nil PID. Failed to stop tcpump",  buf,  v222,  v224);
          }

          NSErrorUserInfoKey v275 = NSLocalizedFailureReasonErrorKey;
          v276 = @"W5InternalErr";
          v219 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v276,  &v275,  1LL));
          v220 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  9LL,  v219));
          -[W5DiagnosticsActionResult setError:](v226, "setError:", v220);

          v221 = v226;
        }

        else
        {
          uint64_t v204 = sub_10008C90C();
          v205 = (os_log_s *)objc_claimAutoreleasedReturnValue(v204);
          if (os_log_type_enabled(v205, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(void *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "W5DiagnosticsModeManager.m";
            *(_WORD *)&buf[22] = 1024;
            LODWORD(v296) = 685;
            LODWORD(v222) = 28;
            _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v205,  0LL,  "[wifivelocity] %s (%s:%u) [DM] nil localInfo",  buf,  v222,  v224);
          }

          NSErrorUserInfoKey v277 = NSLocalizedFailureReasonErrorKey;
          v278 = @"W5ParamErr";
          v206 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v278,  &v277,  1LL));
          v207 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  1LL,  v206));
          -[W5DiagnosticsActionResult setError:](v226, "setError:", v207);

          v208 = v226;
        }
      }

      else
      {
        WeakRetained = (id *)objc_loadWeakRetained((id *)location);
        v182 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained[2] wifi]);
        v109 = (void *)objc_claimAutoreleasedReturnValue([v182 interfaceName]);

        if (v109)
        {
          v183 = (void *)objc_claimAutoreleasedReturnValue([v103 uuid]);
          v184 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DM-%@_%@_tcpdump.pcap",  v183,  v109));
          v185 = (void *)objc_claimAutoreleasedReturnValue( [@"/var/run/com.apple.wifivelocity" stringByAppendingPathComponent:v184]);

          v279[0] = @"-i";
          v279[1] = v109;
          v279[2] = @"-G";
          v186 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d",  900LL));
          v279[3] = v186;
          v279[4] = @"-w";
          v279[5] = v185;
          v187 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v279,  6LL));

          v236[0] = _NSConcreteStackBlock;
          v236[1] = 3221225472LL;
          v236[2] = sub_100007CF4;
          v236[3] = &unk_1000D1110;
          v188 = v226;
          uint64_t v189 = *(void *)(a1 + 32);
          v237 = v188;
          uint64_t v238 = v189;
          id v239 = v103;
          id v190 = v185;
          id v240 = v190;
          +[NSTask runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:",  @"/usr/sbin/tcpdump",  v187,  v236,  0LL,  &stru_1000D1150,  0.0);

          goto LABEL_135;
        }

        uint64_t v209 = sub_10008C90C();
        v210 = (os_log_s *)objc_claimAutoreleasedReturnValue(v209);
        if (os_log_type_enabled(v210, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "W5DiagnosticsModeManager.m";
          *(_WORD *)&buf[22] = 1024;
          LODWORD(v296) = 659;
          LODWORD(v222) = 28;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v210,  0LL,  "[wifivelocity] %s (%s:%u) [DM] Unable to get WiFi interface name",  buf,  v222,  v224);
        }

        NSErrorUserInfoKey v280 = NSLocalizedFailureReasonErrorKey;
        v281 = @"W5NotPermittedErr";
        v211 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v281,  &v280,  1LL));
        v212 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  5LL,  v211));
        -[W5DiagnosticsActionResult setError:](v226, "setError:", v212);

        v213 = v226;
      }

      objc_destroyWeak((id *)location);

LABEL_22:
      v38 = v226;
      goto LABEL_167;
    case 0xCuLL:
      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000LL;
      *(void *)&__int128 v296 = sub_100002E9C;
      *((void *)&v296 + 1) = sub_100002EAC;
      v297 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      uint64_t v110 = sub_10008C90C();
      v111 = (os_log_s *)objc_claimAutoreleasedReturnValue(v110);
      if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)location = 136315906;
        *(void *)&location[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
        *(_WORD *)&location[12] = 2080;
        *(void *)&location[14] = "W5DiagnosticsModeManager.m";
        *(_WORD *)&location[22] = 1024;
        LODWORD(v305) = 753;
        WORD2(v305) = 2114;
        *(void *)((char *)&v305 + 6) = v225;
        LODWORD(v222) = 38;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v111,  0LL,  "[wifivelocity] %s (%s:%u) [DM] peers to discover='%{public}@'",  location,  v222);
      }

      __int128 v234 = 0u;
      __int128 v235 = 0u;
      __int128 v232 = 0u;
      __int128 v233 = 0u;
      v112 = (void *)objc_claimAutoreleasedReturnValue([v225 objectForKeyedSubscript:@"peers"]);
      id v113 = [v112 countByEnumeratingWithState:&v232 objects:v272 count:16];
      if (!v113) {
        goto LABEL_81;
      }
      uint64_t v114 = *(void *)v233;
      break;
    default:
      goto LABEL_166;
  }

  do
  {
    for (i = 0LL; i != v113; i = (char *)i + 1)
    {
      if (*(void *)v233 != v114) {
        objc_enumerationMutation(v112);
      }
      v116 = *(void **)(*((void *)&v232 + 1) + 8LL * (void)i);
      v117 = (void *)objc_claimAutoreleasedReturnValue([v116 peer]);
      v118 = (void *)objc_claimAutoreleasedReturnValue([v117 peerID]);

      if (v118)
      {
        v119 = (void *)objc_claimAutoreleasedReturnValue([v116 peer]);
        v120 = (void *)objc_claimAutoreleasedReturnValue([v119 peerID]);
        v121 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) peerManager]);
        v122 = (void *)objc_claimAutoreleasedReturnValue([v121 localIDSIdentifier]);
        unsigned __int8 v123 = [v120 isEqualToString:v122];

        if ((v123 & 1) != 0) {
          continue;
        }
        v124 = *(void **)(*(void *)&buf[8] + 40LL);
        v125 = (void *)objc_claimAutoreleasedReturnValue([v116 peer]);
        v126 = (void *)objc_claimAutoreleasedReturnValue([v125 peerID]);
        [v124 addObject:v126];
      }

      else
      {
        uint64_t v127 = sub_10008C90C();
        v125 = (void *)objc_claimAutoreleasedReturnValue(v127);
        if (os_log_type_enabled((os_log_t)v125, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)location = 136315906;
          *(void *)&location[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
          *(_WORD *)&location[12] = 2080;
          *(void *)&location[14] = "W5DiagnosticsModeManager.m";
          *(_WORD *)&location[22] = 1024;
          LODWORD(v305) = 759;
          WORD2(v305) = 2114;
          *(void *)((char *)&v305 + 6) = v116;
          LODWORD(v222) = 38;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v125,  0LL,  "[wifivelocity] %s (%s:%u) [DM] nil peerID for peer='%{public}@'",  location,  v222);
        }
      }
    }

    id v113 = [v112 countByEnumeratingWithState:&v232 objects:v272 count:16];
  }

  while (v113);
LABEL_81:

  dispatch_semaphore_t v128 = dispatch_semaphore_create(0LL);
  v129 = objc_alloc_init(&OBJC_CLASS___W5PeerDiscoveryConfiguration);
  -[W5PeerDiscoveryConfiguration setDiscoveryFlags:](v129, "setDiscoveryFlags:", 1LL);
  v130 = objc_alloc(&OBJC_CLASS___W5PeerDiscoveryRequest);
  v131 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v229[0] = _NSConcreteStackBlock;
  v229[1] = 3221225472LL;
  v229[2] = sub_100007FD0;
  v229[3] = &unk_1000D1178;
  v231 = buf;
  v132 = v128;
  v230 = v132;
  v133 = -[W5PeerDiscoveryRequest initWithConfiguration:uuid:handler:]( v130,  "initWithConfiguration:uuid:handler:",  v129,  v131,  v229);

  v134 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) peerManager]);
  v135 = (void *)objc_claimAutoreleasedReturnValue([v134 startPeerDiscoveryWithRequest:v133]);

  if (v135)
  {
    uint64_t v136 = sub_10008C90C();
    v137 = (os_log_s *)objc_claimAutoreleasedReturnValue(v136);
    if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 136315906;
      *(void *)&location[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke_2";
      *(_WORD *)&location[12] = 2080;
      *(void *)&location[14] = "W5DiagnosticsModeManager.m";
      *(_WORD *)&location[22] = 1024;
      LODWORD(v305) = 778;
      WORD2(v305) = 2114;
      *(void *)((char *)&v305 + 6) = v135;
      LODWORD(v222) = 38;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v137,  0LL,  "[wifivelocity] %s (%s:%u) peer discovery failed error='%{public}@'",  location,  v222);
    }

    -[W5DiagnosticsActionResult setError:](v226, "setError:", v135);
  }

  else
  {
    dispatch_time_t v171 = dispatch_time(0LL, 30000000000LL);
    if (dispatch_semaphore_wait(v132, v171) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 134349056;
      *(void *)&location[4] = 0x403E000000000000LL;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing",  location,  0xCu);
    }
  }

  _Block_object_dispose(buf, 8);
LABEL_166:
  v38 = v226;
  v215 = v226;
LABEL_167:

  return v226;
}

void sub_100007908(_Unwind_Exception *a1)
{
}

void sub_100007A18(uint64_t a1, void *a2)
{
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100007A64(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8 = a2;
  id v9 = a5;
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8LL);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v8;
  id v19 = v8;
  id v12 = a4;

  uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:*(void *)(a1 + 32)]);
  uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8LL);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8LL);
  v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v9;
  id v18 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100007B2C(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), a2);
  uint64_t v5 = sub_10008C90C();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v9 = 136316162;
    uint64_t v10 = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
    __int16 v11 = 2080;
    id v12 = "W5DiagnosticsModeManager.m";
    __int16 v13 = 1024;
    int v14 = 514;
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    __int16 v17 = 2112;
    id v18 = v4;
    int v8 = 48;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "[wifivelocity] %s (%s:%u) Failed to cancel Sniffer Request with UUID: %@. Error: %@",  &v9,  v8);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100007C5C(uint64_t a1, void *a2)
{
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100007CA8(uint64_t a1, void *a2)
{
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100007CF4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = sub_10008C90C();
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315906;
      __int16 v17 = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
      __int16 v18 = 2080;
      id v19 = "W5DiagnosticsModeManager.m";
      __int16 v20 = 1024;
      int v21 = 668;
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[wifivelocity] %s (%s:%u) [DM] Failed to start tcpdump with error: %@",  &v16,  38);
    }

    [*(id *)(a1 + 32) setError:v6];
  }

  else
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) localStore]);
    uint64_t v10 = *(void *)(a1 + 48);
    v14[0] = @"tcpdumpPID";
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v5 processIdentifier]));
    v14[1] = @"tcpdumpOutputPath";
    v15[0] = v11;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", *(void *)(a1 + 56)));
    v15[1] = v12;
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));
    [v9 addToStore:v10 newInfo:v13];
  }
}

void sub_100007ED8(id a1, NSTask *a2, NSError *a3)
{
  uint64_t v3 = a3;
  uint64_t v4 = sub_10008C90C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315906;
    int v8 = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
    __int16 v9 = 2080;
    uint64_t v10 = "W5DiagnosticsModeManager.m";
    __int16 v11 = 1024;
    int v12 = 677;
    __int16 v13 = 2112;
    int v14 = v3;
    int v6 = 38;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v5,  0LL,  "[wifivelocity] %s (%s:%u) [DM] Tcpdump ended. Error: %@",  &v7,  v6);
  }
}

void sub_100007FD0(uint64_t a1, void *a2)
{
  id v3 = a2;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      int v7 = 0LL;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
        __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v10 + 1) + 8 * (void)v7) peerID]);
        [v8 removeObject:v9];

        int v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v5);
  }

  if (![*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count]) {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

LABEL_54:
}

LABEL_17:
}
  }

  return v6;
}

uint64_t sub_100009D08(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

LABEL_9:
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }
}
  }

  __int16 v20 = v5;

  return v20;
}

  objc_autoreleasePoolPop(v2);
}

  dispatch_release(v9);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}
  }

  return v2;
}

LABEL_7:
  }
}
  }
}
  }
}

void sub_10000B32C(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_10008C90C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315906;
    int v14 = "-[W5DiagnosticsModeManager handlePeerFaultEvent:]_block_invoke";
    __int16 v15 = 2080;
    int v16 = "W5DiagnosticsModeManager.m";
    __int16 v17 = 1024;
    int v18 = 1088;
    __int16 v19 = 2112;
    id v20 = v3;
    int v10 = 38;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v5,  0LL,  "[wifivelocity] %s (%s:%u) [DM] Stop Diagnostic Mode completed. Error: %@",  &v13,  v10);
  }

  uint64_t v6 = (void *)a1[4];
  uint64_t v7 = a1[5];
  uint64_t v8 = a1[6];
  __int128 v11 = @"DiagnosticMode";
  uint64_t v12 = v8;
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
  [v6 _notifyPeers:v7 info:v9];
}

LABEL_19:
  int v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager lastNotificationTimestamp](self, "lastNotificationTimestamp"));
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:v21]);

  if (v23)
  {
    [v5 timeIntervalSinceDate:v23];
    id v25 = v24 > v7;
  }

  else
  {
    id v25 = 1;
  }

  uint64_t v26 = sub_10008C90C();
  __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v31 = 136316674;
    uint64_t v32 = "-[W5DiagnosticsModeManager _shouldShowNotification:]";
    v33 = 2080;
    v34 = "W5DiagnosticsModeManager.m";
    v35 = 1024;
    v36 = 1270;
    NSErrorUserInfoKey v37 = 2112;
    v38 = v21;
    NSErrorUserInfoKey v39 = 2112;
    v40 = v23;
    int v41 = 2048;
    v42 = v7;
    id v43 = 1024;
    dispatch_semaphore_t v44 = v25;
    LODWORD(v30) = 64;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v27,  0LL,  "[wifivelocity] %s (%s:%u) Notification Type: %@, Last notification timestamp: %@, minTimeInterval (s): %f, Allow N otification?: %d",  &v31,  v30);
  }

  if (v25)
  {
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager lastNotificationTimestamp](self, "lastNotificationTimestamp"));
    [v28 setObject:v5 forKeyedSubscript:v21];
  }

  return v25;
}

  __int16 v17 = 2.0;
  if (v11) {
LABEL_7:
  }
    __int128 v11 = [v11 unsignedIntegerValue];
LABEL_8:
  int v18 = [a3 objectForKeyedSubscript:@"PingTrafficClass"];
  if (-[CWFInterface SSID](-[W5StatusManager corewifi](self->_status, "corewifi"), "SSID"))
  {
    __int16 v19 = -[CWFInterface IPv4RouterAddress](-[W5StatusManager corewifi](self->_status, "corewifi"), "IPv4RouterAddress");
    id v20 = -[CWFInterface IPv6RouterAddress](-[W5StatusManager corewifi](self->_status, "corewifi"), "IPv6RouterAddress");
    if (v19 || (__int16 v19 = v20) != 0LL)
    {
      int v21 = -[W5DiagnosticsManager __performPingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:]( self,  "__performPingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:",  v19,  v6,  v18,  -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"),  v11,  v13,  v17,  v15);
      if (v21)
      {
        __int16 v22 = v21;
        if ((uint64_t)[v21 count] >= 1)
        {
          [v22 packetLoss];
          if (v23 < 100.0)
          {
            -[W5DiagnosticsTestResult setResult:](v5, "setResult:", 1LL);
            -[W5DiagnosticsTestResult setDidPass:](v5, "setDidPass:", 1LL);
          }
        }

        id v25 = @"PingResult";
        uint64_t v26 = v22;
        -[W5DiagnosticsTestResult setInfo:]( v5,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
      }
    }
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v5, "setTestCompleted:");
  return v5;
}

void sub_10000CDF8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  uint64_t v6 = sub_10008C90C();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 136315906;
    __int16 v27 = "-[W5DiagnosticsModeManager _collectNetworkInfoForDiagnosticMode:]_block_invoke";
    __int16 v28 = 2080;
    __int16 v29 = "W5DiagnosticsModeManager.m";
    __int16 v30 = 1024;
    int v31 = 1366;
    __int16 v32 = 2112;
    v33 = v5;
    int v22 = 38;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  0LL,  "[wifivelocity] %s (%s:%u) [DM] Network info log generation completed with receipt: %@",  &v26,  v22);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  __int16 v9 = objc_alloc_init(&OBJC_CLASS___W5LogItemRequestInternal);
  -[W5LogItemRequestInternal setUuid:](v9, "setUuid:", v8);
  int v10 = (void *)objc_claimAutoreleasedReturnValue( +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  90LL,  0LL));
  v25[0] = v10;
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  4LL,  &off_1000E1C28));
  v25[1] = v11;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  6LL,  0LL));
  v25[2] = v12;
  int v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 3LL));
  -[W5LogItemRequestInternal setItemRequests:](v9, "setItemRequests:", v13);

  -[W5LogItemRequestInternal setFilename:](v9, "setFilename:", *(void *)(a1 + 32));
  int v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[W5LogItemRequestInternal setAddedAt:](v9, "setAddedAt:", v14);

  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) logManager]);
  [v15 addRequest:v9];

  uint64_t v16 = sub_10008C90C();
  __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 136315906;
    __int16 v27 = "-[W5DiagnosticsModeManager _collectNetworkInfoForDiagnosticMode:]_block_invoke";
    __int16 v28 = 2080;
    __int16 v29 = "W5DiagnosticsModeManager.m";
    __int16 v30 = 1024;
    int v31 = 1379;
    __int16 v32 = 2112;
    v33 = v9;
    LODWORD(v21) = 38;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  0LL,  "[wifivelocity] %s (%s:%u) Added to W5LogManager queue: %@",  &v26,  v21);
  }

  int v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) localStore]);
  uint64_t v19 = *(void *)(a1 + 48);
  id v23 = @"networkInfoCollectUUID";
  __int16 v24 = v8;
  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
  [v18 addToStore:v19 newInfo:v20];
}

LABEL_11:
  return (int64_t)v6;
}

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v5, "setTestCompleted:");
  return v5;
}

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v5, "setTestCompleted:");
  return v5;
}

    return;
  }

  id v5 = -[W5RapportClient _configureDiscoveryClient](self, "_configureDiscoveryClient");
  uint64_t v6 = sub_10008C90C();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v7 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) == 0)
  {
    if (v7)
    {
      *(_DWORD *)location = 136315650;
      *(void *)&location[4] = "-[W5RapportClient startDiscoveringDevices]";
      int v14 = 2080;
      __int16 v15 = "W5RapportClient.m";
      uint64_t v16 = 1024;
      __int16 v17 = 169;
      LODWORD(v9) = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v3,  0LL,  "[wifivelocity] %s (%s:%u) failed to configure discovery client",  location,  v9,  v10);
    }

    goto LABEL_11;
  }

  if (v7)
  {
    *(_DWORD *)location = 136315650;
    *(void *)&location[4] = "-[W5RapportClient startDiscoveringDevices]";
    int v14 = 2080;
    __int16 v15 = "W5RapportClient.m";
    uint64_t v16 = 1024;
    __int16 v17 = 173;
    LODWORD(v9) = 28;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v3,  0LL,  "[wifivelocity] %s (%s:%u) starting device discovery",  location,  v9,  v10);
  }

  self->_discoveringDevices = 1;
  objc_initWeak((id *)location, self);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[W5RapportClient discoveryClient](self, "discoveryClient"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100046AB4;
  v11[3] = &unk_1000D2938;
  objc_copyWeak(&v12, (id *)location);
  [v8 activateWithCompletion:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)location);
}

  result = [*(id *)(a1 + 32) updatedWiFiCallback];
  if (result)
  {
    uint64_t v8 = (uint64_t (**)(id, W5Event *))[*(id *)(a1 + 32) updatedWiFiCallback];
    if (a2)
    {
      __int16 v9 = *(void **)(*(void *)(a1 + 32) + 40LL);
      int v10 = objc_alloc_init(&OBJC_CLASS___W5Event);
      __int128 v11 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
      objc_msgSend( v11,  "setObject:forKeyedSubscript:",  objc_msgSend(objc_msgSend(a2, "eventID"), "interfaceName"),  @"InterfaceName");
      objc_msgSend(objc_msgSend(a2, "timestamp"), "timeIntervalSinceReferenceDate");
      -[W5Event setTimestamp:](v10, "setTimestamp:");
      switch((unint64_t)objc_msgSend(objc_msgSend(a2, "eventID"), "type"))
      {
        case 1uLL:
          -[W5Event setEventID:](v10, "setEventID:", 18LL);
          uint64_t v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 powerOn]);
          int v13 = @"WiFiPowerOn";
          goto LABEL_30;
        case 2uLL:
          -[W5Event setEventID:](v10, "setEventID:", 19LL);
          objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(v9, "SSID"), @"WiFiSSID");
          uint64_t v12 = (NSNumber *)[v9 networkName];
          int v13 = @"WiFiSSIDString";
          goto LABEL_30;
        case 3uLL:
          -[W5Event setEventID:](v10, "setEventID:", 20LL);
          uint64_t v12 = (NSNumber *)[v9 BSSID];
          int v13 = @"WiFiBSSID";
          goto LABEL_30;
        case 4uLL:
          -[W5Event setEventID:](v10, "setEventID:", 24LL);
          uint64_t v12 = (NSNumber *)[v9 countryCode];
          int v13 = @"WiFiCountryCode";
          goto LABEL_30;
        case 6uLL:
          int v14 = [a2 info];
          __int16 v15 = [v14 objectForKeyedSubscript:CWFEventLinkChangeStatusKey];
          -[W5Event setEventID:](v10, "setEventID:", 22LL);
          objc_msgSend( v11,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  objc_msgSend(v15, "isLinkDown") ^ 1),  @"WiFiLinkUp");
          objc_msgSend( v11,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  objc_msgSend(v15, "reason")),  @"WiFiLinkChangeReason");
          objc_msgSend( v11,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v15, "subreason")),  @"WiFiLinkChangeSubreason");
          uint64_t v12 = +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v15 isInvoluntaryLinkDown]);
          int v13 = @"WiFiLinkChangeInvoluntary";
          goto LABEL_30;
        case 7uLL:
          uint64_t v16 = [a2 info];
          __int16 v17 = [v16 objectForKeyedSubscript:CWFEventLinkQualityMetricKey];
          int v18 = (NSNumber *)objc_alloc_init(&OBJC_CLASS___W5WiFiLinkQualityUpdate);
          -[NSNumber setRssi:](v18, "setRssi:", [v17 RSSI]);
          [v17 txRate];
          -[NSNumber setTxRate:](v18, "setTxRate:", (uint64_t)v19);
          *(float *)&id v20 = (float)(unint64_t)[v17 CCA];
          -[NSNumber setCca:](v18, "setCca:", v20);
          objc_msgSend(objc_msgSend(v17, "updatedAt"), "timeIntervalSinceReferenceDate");
          -[NSNumber setTimestamp:](v18, "setTimestamp:");
          -[W5Event setEventID:](v10, "setEventID:", 25LL);
          int v13 = @"WiFiLinkQualityUpdate";
          uint64_t v21 = v11;
          uint64_t v12 = v18;
          goto LABEL_31;
        case 8uLL:
          -[W5Event setEventID:](v10, "setEventID:", 23LL);
          uint64_t v12 = +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v9 opMode]);
          int v13 = @"WiFiMode";
          goto LABEL_30;
        case 0xEuLL:
          int v22 = [a2 info];
          if (objc_msgSend(objc_msgSend(v22, "objectForKeyedSubscript:", CWFEventRoamStatusKey), "endedAt"))
          {
            id v23 = v10;
            __int16 v24 = 31LL;
          }

          else
          {
            id v23 = v10;
            __int16 v24 = 30LL;
          }

          goto LABEL_33;
        case 0xFuLL:
          id v23 = v10;
          __int16 v24 = 32LL;
          goto LABEL_33;
        case 0x10uLL:
          id v23 = v10;
          __int16 v24 = 33LL;
          goto LABEL_33;
        case 0x11uLL:
          id v23 = v10;
          __int16 v24 = 2LL;
          goto LABEL_33;
        case 0x12uLL:
          id v23 = v10;
          __int16 v24 = 8LL;
LABEL_33:
          -[W5Event setEventID:](v23, "setEventID:", v24);
          break;
        case 0x17uLL:
          -[W5Event setEventID:](v10, "setEventID:", 14LL);
          objc_msgSend( v11,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  objc_msgSend(v9, "EAP8021XControlMode")),  @"EAPControlMode");
          objc_msgSend( v11,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  objc_msgSend(v9, "EAP8021XSupplicantState")),  @"EAPSupplicantState");
          objc_msgSend( v11,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  objc_msgSend(v9, "EAP8021XControlState")),  @"EAPControlState");
          uint64_t v12 = +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v9 EAP8021XClientStatus]);
          int v13 = @"EAPClientStatus";
          goto LABEL_30;
        case 0x18uLL:
          -[W5Event setEventID:](v10, "setEventID:", 11LL);
          uint64_t v12 = +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v9 reachabilityFlags]);
          int v13 = @"NetworkReachability";
LABEL_30:
          uint64_t v21 = v11;
LABEL_31:
          [v21 setObject:v12 forKeyedSubscript:v13];
          break;
        default:
          break;
      }

      -[W5Event setInfo:](v10, "setInfo:", v11);
    }

    else
    {
      int v10 = 0LL;
    }

    return (id)v8[2](v8, v10);
  }

  return result;
}

  __int128 v11 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = self->_model;
    v51 = 136316930;
    v52 = "-[W5LogManager __basicWiFiLogsWithFilteredContent:useMegaWiFiProfileLimits:]";
    uint64_t v53 = 2080;
    v54 = "W5LogManager.m";
    v55 = 1024;
    v56 = 2388;
    v57 = 2114;
    v58 = v12;
    v59 = 2048;
    v60 = v9;
    v61 = 1024;
    v62 = v10;
    v63 = 1024;
    v64 = v4;
    uint64_t v65 = 1024;
    v66 = v10;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "[wifivelocity] %s (%s:%u) Collecting WiFi logs for %{public}@ (cc count=%lu, compress=%d, megaWiFiProfile=%d, diagnostics=%d)",  &v51,  66);
  }

  int v22 = v9;
  int v13 = -[NSUUID UUIDString](+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"), "UUIDString");
  int v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@~sysdiag",  @"WiFiDebug");
  v48 = @"TimestampUUID";
  v49 = -[NSUUID UUIDString](+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"), "UUIDString");
  uint64_t v21 = v49;
  v50[0] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  39LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v49,  &v48,  1LL));
  v50[1] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  45LL,  &off_1000E2E98);
  v50[2] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  46LL,  &off_1000E2EC0);
  v50[3] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  28LL,  &off_1000E2EE8);
  v46[0] = @"Requests";
  v46[1] = @"RunConcurrent";
  v47[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v50, 4LL);
  v47[1] = &__kCFBooleanFalse;
  v46[2] = @"NameOverride";
  v47[2] = @"Wi-Fi Status / Scan";
  v45[0] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  53LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v47,  v46,  3LL));
  v43[0] = @"Reason";
  v43[1] = @"TimestampUUID";
  v44[0] = v14;
  id v20 = v13;
  v44[1] = v13;
  v45[1] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  21LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v44,  v43,  2LL));
  v45[2] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  70LL,  &off_1000E2F10);
  __int16 v15 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v45, 3LL);
  if ((_DWORD)v10)
  {
    uint64_t v16 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    objc_msgSend( v16,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  81,  &off_1000E2F38));
    objc_msgSend( v16,  "addObject:",  -[W5LogManager __fastConnectivityDiagnosticsLogItemWithTimeout:]( self,  "__fastConnectivityDiagnosticsLogItemWithTimeout:",  0.0));
    objc_msgSend( v16,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  81,  &off_1000E2F60));
    v41[0] = @"Requests";
    v41[1] = @"RunConcurrent";
    v42[0] = v16;
    v42[1] = &__kCFBooleanFalse;
    v41[2] = @"NameOverride";
    v42[2] = @"Wi-Fi Diagnostics";
    __int16 v15 = -[NSArray arrayByAddingObject:]( v15,  "arrayByAddingObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  53LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v42,  v41,  3LL)));
  }

  v39[0] = @"Requests";
  v39[1] = @"RunConcurrent";
  v40[0] = v15;
  v40[1] = &__kCFBooleanTrue;
  v39[2] = @"Timeout";
  v39[3] = @"NameOverride";
  v40[2] = &off_1000DF348;
  v40[3] = @"Wi-Fi Status / Diagnostics";
  objc_msgSend( v6,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  53,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v40,  v39,  4)));
  v37[0] = @"MaxCount";
  v38[0] = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v22);
  v37[1] = @"FilterContent";
  v38[1] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v23);
  v37[2] = @"Compress";
  v38[2] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v10);
  __int16 v17 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v38,  v37,  3LL);
  v34[0] = @"Delay";
  v34[1] = @"TimestampUUID";
  v35[0] = &off_1000DF360;
  v35[1] = v20;
  v36[0] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  69LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v35,  v34,  2LL));
  v36[1] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  19LL,  v17);
  v32[0] = @"Requests";
  v32[1] = @"RunConcurrent";
  v33[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v36, 2LL);
  v32[2] = @"Timeout";
  v32[3] = @"NameOverride";
  v33[1] = &__kCFBooleanFalse;
  v33[2] = &off_1000DF108;
  v33[3] = @"CoreCapture";
  int v18 = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  53LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  4LL));
  v29[0] = @"Delay";
  v29[1] = @"TimestampUUID";
  v30[0] = &off_1000DF168;
  v30[1] = v21;
  v31[0] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  69LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  2LL));
  v31[1] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  37LL,  &off_1000E2F88);
  v27[0] = @"Requests";
  v27[1] = @"RunConcurrent";
  v28[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 2LL);
  v28[1] = &__kCFBooleanFalse;
  v27[2] = @"Timeout";
  v27[3] = @"NameOverride";
  v28[2] = &off_1000DF108;
  v28[3] = @"WiFi Logs";
  v26[0] = v18;
  v26[1] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  53LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  4LL));
  v26[2] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  40LL,  0LL);
  v26[3] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  28LL,  &off_1000E2FB0);
  v24[0] = @"Requests";
  v24[1] = @"RunConcurrent";
  v25[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 4LL);
  v24[2] = @"Timeout";
  v24[3] = @"NameOverride";
  v25[1] = &__kCFBooleanTrue;
  v25[2] = &off_1000DF378;
  void v25[3] = @"Collect WiFi / CoreCapture";
  objc_msgSend( v6,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  53,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v25,  v24,  4)));
  return v6;
}

  dispatch_release(v10);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

  if (!-[NSMutableDictionary count](v3, "count"))
  {
    int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s: empty payload",  "-[W5PeerDebugResponsePayload encode]"));
    __int16 v15 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v14,  0LL));

    objc_exception_throw(v15);
  }

  if (-[NSMutableDictionary count](v3, "count")) {
    __int128 v11 = v3;
  }
  else {
    __int128 v11 = 0LL;
  }
  uint64_t v12 = v11;

  return v12;
}

  return (char)v3;
}

uint64_t sub_10000D6F4(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 state];
  id v5 = (id)a1[5];
  uint64_t v6 = v4 == v5;
  if (a1[4]) {
    BOOL v7 = v4 == v5;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "peers", 0));
    uint64_t v6 = (uint64_t)[v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0LL; i != v6; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v8);
          }
          __int128 v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v12 = (void *)a1[4];
          int v13 = (void *)objc_claimAutoreleasedReturnValue([v11 peer]);
          int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 peerID]);
          if ([v12 isEqualToString:v14])
          {
            unint64_t v15 = a1[6] & (unint64_t)[v11 role];

            if (v15)
            {
              uint64_t v6 = 1LL;
              goto LABEL_17;
            }
          }

          else
          {
          }
        }

        uint64_t v6 = (uint64_t)[v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }

      while (v6);
    }

uint64_t sub_10000D92C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 state];
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = v4 == v5;
  if (*(void *)(a1 + 32)) {
    BOOL v7 = v4 == v5;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "peers", 0));
    uint64_t v6 = (uint64_t)[v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0LL; i != v6; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v8);
          }
          __int128 v11 = *(void **)(a1 + 32);
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v15 + 1) + 8 * i) peer]);
          int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 peerID]);
          LOBYTE(v11) = [v11 isEqualToString:v13];

          if ((v11 & 1) != 0)
          {
            uint64_t v6 = 1LL;
            goto LABEL_16;
          }
        }

        uint64_t v6 = (uint64_t)[v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

LABEL_16:
  }

  return v6;
}

  -[NSFileHandle closeFile](v8, "closeFile");
}

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v3, "setTestCompleted:");
  return v3;
}

  __int16 v32 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v4,  "objectForKeyedSubscript:",  @"fetchRequestNSData"));
  if (v32)
  {

LABEL_19:
    v34 = sub_10008E334();
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (!os_signpost_enabled(v35)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    v36 = "Success";
    goto LABEL_21;
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v4,  "objectForKeyedSubscript:",  @"fetchRequestNSDataUncompressed"));

  if (v33) {
    goto LABEL_19;
  }
  v38 = sub_10008C90C();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v54 = "-[W5PeerDatabaseRequestPayload encode]";
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "[wifivelocity] W5PeerDatabaseRequestPayload %s: Failed to form kW5PeerRequestDatabaseFetchRequestNSDataKey or kW5P eerRequestDatabaseFetchRequestNSDataUncompressedKey",  (const char *)buf);
  }

id sub_10000DB6C(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 uuid]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 UUIDString]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) UUIDString]);
  id v6 = [v4 isEqualToString:v5];

  return v6;
}

LABEL_27:
}

    -[W5WiFiConnectionMonitor stopMonitoring](self->_monitor, "stopMonitoring");
    isMonitoringConnectionTransaction = self->_isMonitoringConnectionTransaction;
    if (isMonitoringConnectionTransaction)
    {
      objc_msgSend( +[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"),  "osTransactionComplete:",  self->_isMonitoringConnectionTransaction);

      LOBYTE(isMonitoringConnectionTransaction) = 0;
      self->_isMonitoringConnectionTransaction = 0LL;
    }

    goto LABEL_29;
  }

  dispatch_release(objecta);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v33, "setCompletedAt:");
  return v33;
}

id sub_10000E17C()
{
  uint64_t v4 = 0LL;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  v0 = (void *)qword_1000F74E0;
  uint64_t v7 = qword_1000F74E0;
  if (!qword_1000F74E0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_10000F474;
    v3[3] = &unk_1000D12E0;
    v3[4] = &v4;
    sub_10000F474((uint64_t)v3);
    v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_10000E218( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

LABEL_10:
  return v11 == 0LL;
}

  return v11 == 0LL;
}

  if (v7) {
    CFRelease(v7);
  }
  return v8 == 0;
}
    }
  }

  return v5;
}

LABEL_14:
  }
}

  return v5;
}

  if (!a4)
  {
    __int128 v16 = 0;
    goto LABEL_8;
  }

  int v22 = NSLocalizedFailureReasonErrorKey;
  id v23 = @"W5ParamErr";
  __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
  __int128 v16 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  1LL,  v15));
LABEL_7:

LABEL_8:
  return v16;
}

  return v16;
}

  return v11;
}

        BOMCopierFree(v10);
        return v16;
      }

      int v22 = v12;
      __int16 v28 = NSLocalizedFailureReasonErrorKey;
      __int16 v29 = @"err";
      __int128 v18 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL);
      __int128 v19 = NSPOSIXErrorDomain;
      __int128 v20 = v22;
    }

    else
    {
      __int16 v30 = NSLocalizedFailureReasonErrorKey;
      int v31 = @"ENOENT";
      __int128 v18 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL);
      __int128 v19 = NSPOSIXErrorDomain;
      __int128 v20 = 2LL;
    }
  }

  else
  {
    __int16 v32 = NSLocalizedFailureReasonErrorKey;
    v33 = @"ENOMEM";
    __int128 v18 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL);
    __int128 v19 = NSPOSIXErrorDomain;
    __int128 v20 = 12LL;
  }

  uint64_t v21 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v19,  v20,  v18);
LABEL_20:
  if (qword_1000F75D8 != -1) {
    dispatch_once(&qword_1000F75D8, &stru_1000D3558);
  }
  id v23 = qword_1000F75D0;
  if (os_log_type_enabled((os_log_t)qword_1000F75D0, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v24 = [a1 path];
    id v25 = -[NSError code](v21, "code");
    v35 = "W5CopyUsingBOMCopier";
    v36 = 2080;
    v34 = 136316162;
    NSErrorUserInfoKey v37 = "W5MiscUtil.m";
    v38 = 1024;
    NSErrorUserInfoKey v39 = 516;
    v40 = 2114;
    int v41 = v24;
    v42 = 2048;
    id v43 = v25;
    LODWORD(v26) = 48;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v23,  0LL,  "[wifivelocity] %s (%s:%u) FAILED to copy using BOMCopier '%{public}@', returned error %ld",  &v34,  v26);
  }

  if (a3 && v21) {
    *a3 = v21;
  }
  __int128 v16 = 0LL;
  result = 0LL;
  if (v10) {
    goto LABEL_14;
  }
  return result;
}

id sub_10000F110(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

Class sub_10000F474(uint64_t a1)
{
  uint64_t v6 = 0LL;
  if (!qword_1000F74E8)
  {
    __int128 v7 = off_1000D1300;
    uint64_t v8 = 0LL;
    qword_1000F74E8 = _sl_dlopen(&v7, &v6);
  }

  if (!qword_1000F74E8)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *WiFiAnalyticsLibrary(void)"));
    objc_msgSend( v3,  "handleFailureInFunction:file:lineNumber:description:",  v4,  @"W5DiagnosticsModeManager.m",  31,  @"%s",  v6);

    goto LABEL_10;
  }

  if (v6) {
    free(v6);
  }
  Class result = objc_getClass("AnalyticsProcessor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getAnalyticsProcessorClass(void)_block_invoke"));
    objc_msgSend( v3,  "handleFailureInFunction:file:lineNumber:description:",  v5,  @"W5DiagnosticsModeManager.m",  33,  @"Unable to find class %s",  "AnalyticsProcessor");

LABEL_10:
    __break(1u);
  }

  qword_1000F74E0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void sub_10000FE5C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_10000FE80(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000FE90(uint64_t a1)
{
}

void sub_10000FE98(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_10008C90C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      int v9 = 136315906;
      int v10 = "-[W5NetUsageManager _getCurrentUsage]_block_invoke";
      __int16 v11 = 2080;
      uint64_t v12 = "W5NetUsageManager.m";
      __int16 v13 = 1024;
      int v14 = 93;
      __int16 v15 = 2048;
      id v16 = [v3 count];
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v5,  0LL,  "[wifivelocity] %s (%s:%u) Got Network Usage for %ld entries",  (const char *)&v9,  38);
    }

    id v7 = [v3 copy];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v5 = *(os_log_s **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }

  else if (v6)
  {
    int v9 = 136315650;
    int v10 = "-[W5NetUsageManager _getCurrentUsage]_block_invoke";
    __int16 v11 = 2080;
    uint64_t v12 = "W5NetUsageManager.m";
    __int16 v13 = 1024;
    int v14 = 97;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v5,  0LL,  "[wifivelocity] %s (%s:%u) Failed to get Network Usage",  (const char *)&v9,  28);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100010668(uint64_t a1)
{
  double v2 = *(double *)(a1 + 56);
  BOOL v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472LL;
  uint64_t v8 = sub_100010730;
  int v9 = &unk_1000D1348;
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(id *)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 64);
  id v12 = v3;
  uint64_t v13 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  1LL,  &v6,  v2));
  objc_msgSend( *(id *)(*(void *)(a1 + 32) + 40),  "setObject:forKeyedSubscript:",  v5,  *(void *)(a1 + 40),  v6,  v7,  v8,  v9,  v10);
}

void sub_100010730(uint64_t a1)
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _getCurrentUsage]);
  if (v2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    uint64_t v4 = sub_10008C90C();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v36 = 136316162;
      NSErrorUserInfoKey v37 = "-[W5NetUsageManager startPeriodicUsageMonitor:maxEntries:uuid:]_block_invoke_2";
      __int16 v38 = 2080;
      NSErrorUserInfoKey v39 = "W5NetUsageManager.m";
      __int16 v40 = 1024;
      int v41 = 158;
      __int16 v42 = 2048;
      id v43 = [v2 count];
      __int16 v44 = 2114;
      v45[0] = v3;
      int v33 = 48;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v5,  0LL,  "[wifivelocity] %s (%s:%u) Recording Network Usage for %ld entries, at: %{public}@",  &v36,  v33);
    }

    id v6 = -[W5WiFiNetUsageRecord init:usageData:]( objc_alloc(&OBJC_CLASS___W5WiFiNetUsageRecord),  "init:usageData:",  v3,  v2);
    uint64_t v7 = *(void **)(a1 + 40);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 date]);
    id v9 = sub_10008E3A0((uint64_t)v8);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"netusage_%@.csv",  v10));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 URLByAppendingPathComponent:v11]);

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 48)]);
    id v14 = [v13 unsignedIntegerValue];

    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:*(void *)(a1 + 48)]);
    id v16 = [v15 count];

    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:*(void *)(a1 + 48)]);
    __int128 v18 = v17;
    if (v14 >= v16)
    {
      [v17 addObject:v12];
      __int128 v19 = v18;
    }

    else
    {
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v17 objectAtIndex:v14]);

      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v35 = 0LL;
      unsigned int v21 = [v20 removeItemAtURL:v19 error:&v35];
      id v22 = v35;

      uint64_t v23 = sub_10008C90C();
      __int16 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        int v36 = 136316418;
        NSErrorUserInfoKey v37 = "-[W5NetUsageManager startPeriodicUsageMonitor:maxEntries:uuid:]_block_invoke";
        __int16 v38 = 2080;
        NSErrorUserInfoKey v39 = "W5NetUsageManager.m";
        __int16 v40 = 1024;
        int v41 = 168;
        __int16 v42 = 2112;
        id v43 = v19;
        __int16 v44 = 1024;
        LODWORD(v45[0]) = v21;
        WORD2(v45[0]) = 2112;
        *(void *)((char *)v45 + 6) = v22;
        LODWORD(v32) = 54;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v24,  0LL,  "[wifivelocity] %s (%s:%u) Remove file: %@, success: %d, error: %@",  &v36,  v32);
      }

      id v25 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:*(void *)(a1 + 48)]);
      [v25 replaceObjectAtIndex:v14 withObject:v12];
    }

    int v26 = (void *)objc_claimAutoreleasedReturnValue([v6 usageData]);
    +[W5NetUsageManager writeProcNetUsage:ToFile:]( &OBJC_CLASS___W5NetUsageManager,  "writeProcNetUsage:ToFile:",  v26,  v12);

    uint64_t v27 = sub_10008C90C();
    __int16 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v29 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:*(void *)(a1 + 48)]);
      id v30 = [v29 count];
      int v36 = 136315906;
      NSErrorUserInfoKey v37 = "-[W5NetUsageManager startPeriodicUsageMonitor:maxEntries:uuid:]_block_invoke";
      __int16 v38 = 2080;
      NSErrorUserInfoKey v39 = "W5NetUsageManager.m";
      __int16 v40 = 1024;
      int v41 = 177;
      __int16 v42 = 2048;
      id v43 = v30;
      LODWORD(v32) = 38;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v28,  0LL,  "[wifivelocity] %s (%s:%u) Netusage periodic dump has %ld files",  (const char *)&v36,  v32,  v34,  v35);
    }

    int v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  ((unint64_t)v14 + 1) % *(void *)(a1 + 56)));
    [*(id *)(*(void *)(a1 + 32) + 32) setObject:v31 forKeyedSubscript:*(void *)(a1 + 48)];
  }
}

void sub_100011440(id *a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1[4] objectForKey:v16]);
    [v8 doubleValue];
    double v10 = v9;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([a1[5] objectForKey:v16]);
    [v11 doubleValue];
    double v13 = v10 - v12;

    id v14 = a1[6];
    __int16 v15 = -[NSNumber initWithDouble:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithDouble:", v13);
    [v14 setObject:v15 forKey:v16];
  }

  else
  {
    [a1[6] setObject:v5 forKey:v16];
  }
}

void sub_100011C98(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v12 = v5;
  if (!a3)
  {
    [*(id *)(a1 + 32) appendFormat:@"%@\t%@\t%@\t%@\t%@\n", @"Process Name", @"WiFi In (Bytes)", @"WiFi Out (Bytes)", @"AWDL In (Bytes)", @"AWDL Out (Bytes)"];
    id v5 = v12;
  }

  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"procName"]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"wifiInBytes"]);
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"wifiOutBytes"]);
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"awdlInBytes"]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"awdlOutBytes"]);
  [v6 appendFormat:@"%@\t%@\t%@\t%@\t%@\n", v7, v8, v9, v10, v11];
}

void sub_100012528( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

uint64_t sub_100012560(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100012570(uint64_t a1)
{
}

void sub_100012578(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7 = a2;
  uint64_t v8 = v7;
  if (a3 == 1) {
    *a4 = 1;
  }
  if (v7)
  {
    double v9 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
    -[NSDateFormatter setDateFormat:](v9, "setDateFormat:", @"yyyy-MM-dd_HH.mm.ss.SSS");
    double v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v9, "stringFromDate:", v10));

    id v12 = [v8 channel];
    id v13 = [v8 channelWidth];
    id v14 = [v8 band];
    if (*(_BYTE *)(a1 + 96)) {
      __int16 v15 = "nostop";
    }
    else {
      __int16 v15 = "remote";
    }
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ch%li_%@_bw%ld_band%ld_%s.pcap",  v12,  v11,  v13,  v14,  v15));
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/var/run/com.apple.wifivelocity"));
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 URLByAppendingPathComponent:v16]);

    __int128 v19 = objc_alloc_init(&OBJC_CLASS___W5WiFiSnifferRequest);
    -[W5WiFiSnifferRequest setUuid:](v19, "setUuid:", *(void *)(a1 + 32));
    -[W5WiFiSnifferRequest setChannel:](v19, "setChannel:", v8);
    -[W5WiFiSnifferRequest setDuration:](v19, "setDuration:", *(double *)(a1 + 80));
    -[W5WiFiSnifferRequest setOutputFile:](v19, "setOutputFile:", v18);
    -[W5WiFiSnifferRequest setMonitorMode:](v19, "setMonitorMode:", 1LL);
    -[W5WiFiSnifferRequest setTcpDump:](v19, "setTcpDump:", 1LL);
    -[W5WiFiSnifferRequest setNoAutoStop:](v19, "setNoAutoStop:", *(unsigned __int8 *)(a1 + 96));
    if (*(_BYTE *)(a1 + 96)) {
      -[W5WiFiSnifferRequest setRotationInterval:](v19, "setRotationInterval:", *(void *)(a1 + 88));
    }
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_100012A78;
    v43[3] = &unk_1000D13E8;
    id v44 = *(id *)(a1 + 32);
    id v20 = v8;
    id v45 = v20;
    -[W5WiFiSnifferRequest setReply:](v19, "setReply:", v43);
    unsigned int v21 = *(void **)(a1 + 40);
    BOOL v22 = *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) == 0;
    uint64_t v23 = *(void *)(*(void *)(a1 + 64) + 8LL);
    id obj = *(id *)(v23 + 40);
    [v21 setUserAutoJoinDisabled:v22 error:&obj];
    objc_storeStrong((id *)(v23 + 40), obj);
    uint64_t v24 = sub_10008C90C();
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = v16;
      uint64_t v27 = v11;
      BOOL v28 = *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) == 0;
      unsigned int v29 = [*(id *)(a1 + 40) userAutoJoinDisabled];
      uint64_t v30 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
      int v46 = 136316418;
      v47 = "-[W5PeerSnifferListener _runSnifferOnChannels:interface:duration:noAutoStop:rotationInternal:uuid:]_block_invoke";
      __int16 v48 = 2080;
      v49 = "W5PeerSnifferListener.m";
      __int16 v50 = 1024;
      int v51 = 148;
      __int16 v52 = 1024;
      *(_DWORD *)uint64_t v53 = v28;
      id v11 = v27;
      id v16 = v26;
      *(_WORD *)&v53[4] = 1024;
      *(_DWORD *)&v53[6] = v29;
      *(_WORD *)v54 = 2114;
      *(void *)&v54[2] = v30;
      LODWORD(v3_Block_object_dispose((const void *)(v29 - 128), 8) = 50;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v25,  0LL,  "[wifivelocity] %s (%s:%u) Setting User Auto Join Disabled: %d, status: %d, error: %{public}@",  &v46,  v38);
    }

    [*(id *)(*(void *)(a1 + 48) + 16) addRequest:v19];
    uint64_t v31 = sub_10008C90C();
    __int16 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v33 = *(void *)(a1 + 32);
      uint64_t v34 = (uint64_t)*(double *)(a1 + 80);
      int v46 = 136316674;
      v47 = "-[W5PeerSnifferListener _runSnifferOnChannels:interface:duration:noAutoStop:rotationInternal:uuid:]_block_invoke";
      __int16 v48 = 2080;
      v49 = "W5PeerSnifferListener.m";
      __int16 v50 = 1024;
      int v51 = 151;
      __int16 v52 = 2114;
      *(void *)uint64_t v53 = v33;
      *(_WORD *)&v53[8] = 2114;
      *(void *)v54 = v20;
      *(_WORD *)&v54[8] = 2048;
      uint64_t v55 = v34;
      __int16 v56 = 2114;
      v57 = v18;
      LODWORD(v3_Block_object_dispose((const void *)(v29 - 128), 8) = 68;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v32,  0LL,  "[wifivelocity] %s (%s:%u) Sniffer Request added to queue with UUID: %{public}@, channel: %{public}@, duration: % ld, outputFile: %{public}@",  &v46,  v38);
    }

    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setObject:v18 forKey:v20];
    dispatch_time_t v35 = dispatch_time(0LL, 1000000000 * (uint64_t)*(double *)(a1 + 80));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100012B90;
    block[3] = &unk_1000D0F30;
    int v36 = *(void **)(a1 + 40);
    void block[4] = *(void *)(a1 + 48);
    __int16 v40 = v19;
    id v41 = v36;
    NSErrorUserInfoKey v37 = v19;
    dispatch_after(v35, &_dispatch_main_q, block);
  }
}

void sub_100012A78(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_10008C90C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    int v9 = 136316418;
    double v10 = "-[W5PeerSnifferListener _runSnifferOnChannels:interface:duration:noAutoStop:rotationInternal:uuid:]_block_invoke_2";
    __int16 v11 = 2080;
    id v12 = "W5PeerSnifferListener.m";
    __int16 v13 = 1024;
    int v14 = 144;
    __int16 v15 = 2114;
    uint64_t v16 = v6;
    __int16 v17 = 2114;
    uint64_t v18 = v7;
    __int16 v19 = 2114;
    id v20 = v3;
    int v8 = 58;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v5,  0LL,  "[wifivelocity] %s (%s:%u) Sniffer Request with UUID: %{public}@, channel: %{public}@, replied with error: %{public}@",  &v9,  v8);
  }
}

void sub_100012B90(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uuid]);
  [v2 stopSnifferWithUUID:v3 interface:*(void *)(a1 + 48)];
}

void sub_100012DE4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_10008C90C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v8 = 138543618;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    id v11 = v3;
    int v7 = 22;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v5,  0LL,  "[wifivelocity] Cancel Sniffer Request with UUID: %{public}@ replied: %{public}@",  &v8,  v7);
  }
}

void sub_100013698(id a1, NSError *a2)
{
  double v2 = a2;
  uint64_t v3 = sub_10008C90C();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    int v7 = v2;
    int v5 = 12;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v4,  0LL,  "[wifivelocity] File Sender, Transfer Completion, error: %{public}@",  &v6,  v5);
  }
}

void sub_100013758(id a1, RPFileTransferProgress *a2)
{
  double v2 = a2;
  uint64_t v3 = sub_10008C90C();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    int v7 = v2;
    int v5 = 12;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v4,  0LL,  "[wifivelocity] File Sender, Transfer Progress: %{public}@",  &v6,  v5);
  }
}

void sub_100013818(id a1, RPFileTransferItem *a2, id a3)
{
  uint64_t v4 = a2;
  int v5 = (void (**)(id, void))a3;
  uint64_t v6 = sub_10008C90C();
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    __int16 v10 = v4;
    int v8 = 12;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  0LL,  "[wifivelocity] File Sender, Received item: %{public}@",  &v9,  v8);
  }

  v5[2](v5, 0LL);
}

void sub_100013900(id a1, NSError *a2)
{
  double v2 = a2;
  uint64_t v3 = sub_10008C90C();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    int v7 = v2;
    int v5 = 12;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v4,  0LL,  "[wifivelocity] File Sender, Item Completion, error: %{public}@",  &v6,  v5);
  }
}

void sub_100013BFC(id a1, RPFileTransferProgress *a2)
{
  double v2 = a2;
  uint64_t v3 = sub_10008C90C();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    int v7 = v2;
    int v5 = 12;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v4,  0LL,  "[wifivelocity] File Receiver, Transfer Progress: %{public}@",  &v6,  v5);
  }
}

void sub_100013CBC(uint64_t a1, void *a2, uint64_t a3)
{
  int v5 = a2;
  (*(void (**)(uint64_t, void))(a3 + 16))(a3, 0LL);
  uint64_t v6 = sub_10008C90C();
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138543362;
    id v25 = v5;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  0LL,  "[wifivelocity] File Receiver, Received Item: %{public}@",  &v24,  12);
  }

  int v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](&OBJC_CLASS___NSNumber, "numberWithShort:", 420LL));
  -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v9, NSFilePosixPermissions);
  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 itemURL]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);
  id v23 = 0LL;
  unsigned int v13 = [v10 setAttributes:v8 ofItemAtPath:v12 error:&v23];
  id v14 = v23;

  uint64_t v15 = sub_10008C90C();
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (!v17) {
      goto LABEL_9;
    }
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v5 itemURL]);
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 path]);
    int v24 = 136316162;
    id v25 = "-[W5FileTransferManager startW5FileReceiverWithPeerPublicKey:reply:]_block_invoke";
    __int16 v26 = 2080;
    uint64_t v27 = "W5FileTransferManager.m";
    __int16 v28 = 1024;
    int v29 = 168;
    __int16 v30 = 1024;
    *(_DWORD *)uint64_t v31 = 420;
    *(_WORD *)&v31[4] = 2114;
    *(void *)&v31[6] = v19;
    LODWORD(v22) = 44;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "[wifivelocity] %s (%s:%u) Set file permissions to %hd on: %{public}@",  &v24,  v22);
  }

  else
  {
    if (!v17) {
      goto LABEL_9;
    }
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v5 itemURL]);
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 path]);
    int v24 = 136316162;
    id v25 = "-[W5FileTransferManager startW5FileReceiverWithPeerPublicKey:reply:]_block_invoke";
    __int16 v26 = 2080;
    uint64_t v27 = "W5FileTransferManager.m";
    __int16 v28 = 1024;
    int v29 = 171;
    __int16 v30 = 2114;
    *(void *)uint64_t v31 = v14;
    *(_WORD *)&v31[8] = 2114;
    *(void *)&v31[10] = v19;
    LODWORD(v22) = 48;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "[wifivelocity] %s (%s:%u) Unable to set file permissions, error: %{public}@ for: %{public}@",  &v24,  v22);
  }

LABEL_9:
  uint64_t v20 = *(void *)(a1 + 32);
  if (v20)
  {
    unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v5 itemURL]);
    (*(void (**)(uint64_t, id, void *))(v20 + 16))(v20, v14, v21);
  }
}

LABEL_13:
}

  -[NSFileHandle closeFile](v18, "closeFile");
  -[NSFileHandle closeFile](v20, "closeFile");
  if (a10) {
    (*((void (**)(id, NSError *, void))a10 + 2))(a10, v16, 0LL);
  }
}

  if (!-[NSMutableDictionary count](v3, "count"))
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s: empty payload",  "-[W5PeerSnifferResponsePayload encode]"));
    uint64_t v15 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v14,  0LL));

    objc_exception_throw(v15);
  }

  return v3;
}

  __int16 v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, void, uint64_t))(v10 + 16))(v10, 0LL, v9);
  }
  objc_autoreleasePoolPop(v2);
}

  __int16 v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, void, uint64_t))(v10 + 16))(v10, 0LL, v9);
  }
  objc_autoreleasePoolPop(v2);
}

  __int16 v19 = 2.0;
  if (v10) {
LABEL_6:
  }
    __int16 v10 = [v10 unsignedIntegerValue];
LABEL_7:
  uint64_t v20 = v13;
  if (v11)
  {
    unsigned int v21 = [v11 BOOLValue] ^ 1;
    if (v12)
    {
LABEL_9:
      uint64_t v22 = [v12 BOOLValue];
      goto LABEL_17;
    }
  }

  else
  {
    unsigned int v21 = 1;
    if (v12) {
      goto LABEL_9;
    }
  }

  uint64_t v22 = 1;
LABEL_17:
  id v23 = [a3 objectForKeyedSubscript:@"PingTrafficClass"];
  if (-[CWFInterface SSID](-[W5StatusManager corewifi](self->_status, "corewifi"), "SSID"))
  {
    int v24 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    if ((v21 & 1) != 0)
    {
      status = self->_status;
      if (v20)
      {
        __int16 v26 = -[W5DiagnosticsManager __performPingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:]( self,  "__performPingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:",  v20,  v53,  v23,  -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](status, "wifi"), "interfaceName"),  v10,  v15,  v19,  v17);
        if (v26) {
          [v24 addObject:v26];
        }
      }

      else
      {
        int v36 = -[CWFInterface DNSServerAddresses](-[W5StatusManager corewifi](status, "corewifi"), "DNSServerAddresses");
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        NSErrorUserInfoKey v37 = [v36 countByEnumeratingWithState:&v58 objects:v69 count:16];
        if (v37)
        {
          uint64_t v38 = v37;
          NSErrorUserInfoKey v39 = *(void *)v59;
          do
          {
            for (uint64_t i = 0LL; i != v38; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v59 != v39) {
                objc_enumerationMutation(v36);
              }
              id v41 = -[W5DiagnosticsManager __performPingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:]( self,  "__performPingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:",  *(void *)(*((void *)&v58 + 1) + 8LL * (void)i),  v53,  v23,  -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"),  v10,  v15,  v19,  v17);
              if (v41)
              {
                __int16 v42 = v41;
                [v24 addObject:v41];
                [v42 packetLoss];
                if (v43 < 100.0) {
                  id v44 = 1;
                }
                else {
                  id v44 = v22;
                }
                if ((v44 & 1) != 0) {
                  goto LABEL_51;
                }
              }

              else if ((v22 & 1) != 0)
              {
                goto LABEL_51;
              }
            }

            uint64_t v38 = [v36 countByEnumeratingWithState:&v58 objects:v69 count:16];
          }

          while (v38);
        }
      }
    }

    else
    {
      uint64_t v27 = sub_10008C29C();
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      uint64_t v65 = 0u;
      __int16 v28 = [v27 countByEnumeratingWithState:&v62 objects:v70 count:16];
      if (v28)
      {
        int v29 = v28;
        __int16 v30 = *(void *)v63;
        do
        {
          for (j = 0LL; j != v29; j = (char *)j + 1)
          {
            if (*(void *)v63 != v30) {
              objc_enumerationMutation(v27);
            }
            __int16 v32 = -[W5DiagnosticsManager __performPingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:]( self,  "__performPingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:",  *(void *)(*((void *)&v62 + 1) + 8LL * (void)j),  v53,  v23,  -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"),  v10,  v15,  v19,  v17);
            if (v32)
            {
              uint64_t v33 = v32;
              [v24 addObject:v32];
              [v33 packetLoss];
              if (v34 < 100.0) {
                dispatch_time_t v35 = 1;
              }
              else {
                dispatch_time_t v35 = v22;
              }
              if ((v35 & 1) != 0) {
                goto LABEL_51;
              }
            }

            else if ((v22 & 1) != 0)
            {
              goto LABEL_51;
            }
          }

          int v29 = [v27 countByEnumeratingWithState:&v62 objects:v70 count:16];
        }

        while (v29);
      }
    }

    id v12 = 0LL;
    goto LABEL_14;
  }

  id v12 = [v9 mutableCopy];
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v11]);

  if (v13)
  {
    [v12 removeObjectForKey:v11];
    [v8 setObject:v12 forKeyedSubscript:@"registered-app-peers"];
    -[W5CloudStore _setHomeDiagnosticsDomain:](self, "_setHomeDiagnosticsDomain:", v8);
    id v14 = sub_10008C90C();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 136315906;
      id v25 = "-[W5CloudStore unregisterDiagnosticModePeer:error:]";
      __int16 v26 = 2080;
      uint64_t v27 = "W5CloudStore.m";
      __int16 v28 = 1024;
      int v29 = 166;
      __int16 v30 = 2114;
      uint64_t v31 = v6;
      uint64_t v16 = 1;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "[wifivelocity] %s (%s:%u) unregistered peer='%{public}@",  &v24,  38);
    }

    else
    {
      uint64_t v16 = 1;
    }

    goto LABEL_7;
  }

  unsigned int v21 = sub_10008C90C();
  __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 136315906;
    id v25 = "-[W5CloudStore unregisterDiagnosticModePeer:error:]";
    __int16 v26 = 2080;
    uint64_t v27 = "W5CloudStore.m";
    __int16 v28 = 1024;
    int v29 = 156;
    __int16 v30 = 2114;
    uint64_t v31 = v11;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  0LL,  "[wifivelocity] %s (%s:%u) peer is not registered with ID='%{public}@'",  &v24,  38);
  }

  if ([v10 state] != (id)10)
  {
LABEL_29:
    objc_initWeak((id *)location, self);
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor queue](self, "queue"));
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472LL;
    v65[2] = sub_100085D68;
    v65[3] = &unk_1000D33D8;
    v67 = v11;
    v66 = v10;
    objc_copyWeak(&v68, (id *)location);
    [v61 addBarrierBlock:v65];

    objc_destroyWeak(&v68);
    objc_destroyWeak((id *)location);
    goto LABEL_30;
  }

  if (v64)
  {
    __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
    int v29 = [v28 role];

    if ((v29 & 1) != 0)
    {
      __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
      uint64_t v83 = @"DiagnosticsMode";
      v84 = v64;
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v84,  &v83,  1LL));
      -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:]( self,  "_runAction:peer:info:handler:completion:",  7LL,  v30,  v31,  v63,  v11);
    }

    __int16 v32 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
    uint64_t v33 = [v32 role];

    if ((v33 & 2) != 0)
    {
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
      uint64_t v81 = @"DiagnosticsMode";
      v82 = v64;
      dispatch_time_t v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v82,  &v81,  1LL));
      -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:]( self,  "_runAction:peer:info:handler:completion:",  9LL,  v34,  v35,  v63,  v11);
    }

    int v36 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
    if ([v36 role])
    {
    }

    else
    {
      NSErrorUserInfoKey v37 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
      uint64_t v38 = ((unint64_t)[v37 role] & 2) == 0;

      if (v38)
      {
LABEL_27:
        uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
        __int16 v56 = [v55 role];

        if ((v56 & 4) != 0)
        {
          v57 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
          v71 = @"DiagnosticsMode";
          uint64_t v72 = v64;
          v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v72,  &v71,  1LL));
          -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:]( self,  "_runAction:peer:info:handler:completion:",  8LL,  v57,  v58,  v63,  v11);

          v59 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
          v69 = @"DiagnosticsMode";
          uint64_t v70 = v64;
          v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v70,  &v69,  1LL));
          -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:]( self,  "_runAction:peer:info:handler:completion:",  9LL,  v59,  v60,  v63,  v11);
        }

        goto LABEL_29;
      }
    }

    id v44 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
    v79[0] = @"event";
    id v45 = -[NSNumber initWithInt:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInt:", 1LL);
    v79[1] = @"DiagnosticsMode";
    v80[0] = v45;
    v80[1] = v64;
    int v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v80,  v79,  2LL));
    -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:]( self,  "_runAction:peer:info:handler:completion:",  6LL,  v44,  v46,  v63,  v11);

    v47 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
    v77[0] = @"event";
    __int16 v48 = -[NSNumber initWithInt:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInt:", 1LL);
    v77[1] = @"DiagnosticsMode";
    v78[0] = v48;
    v78[1] = v64;
    v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v78,  v77,  2LL));
    -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:]( self,  "_runAction:peer:info:handler:completion:",  11LL,  v47,  v49,  v63,  v11);

    __int16 v50 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
    v75 = @"DiagnosticsMode";
    v76 = v64;
    int v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v76,  &v75,  1LL));
    -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:]( self,  "_runAction:peer:info:handler:completion:",  8LL,  v50,  v51,  v63,  v11);

    __int16 v52 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
    uint64_t v73 = @"DiagnosticsMode";
    uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
    dispatch_time_t v74 = v53;
    v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v74,  &v73,  1LL));
    -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:]( self,  "_runAction:peer:info:handler:completion:",  10LL,  v52,  v54,  v63,  v11);

    goto LABEL_27;
  }

  NSErrorUserInfoKey v39 = sub_10008C90C();
  __int16 v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)location = 136315906;
    *(void *)&location[4] = "-[W5DiagnosticsModeProcessor performUpdateOperationsForMode:incomingMode:handler:completion:]";
    dispatch_semaphore_t v89 = 2080;
    v90 = "W5DiagnosticsModeProcessor.m";
    id v91 = 1024;
    v92 = 404;
    dispatch_time_t v93 = 2112;
    uint64_t v94 = v10;
    LODWORD(v62) = 38;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v40,  0LL,  "[wifivelocity] %s (%s:%u) [DM] No existing mode matches dm=%@. Returning.",  location,  v62);
  }

  v85 = NSLocalizedFailureReasonErrorKey;
  uint64_t v86 = @"W5ParamErr";
  id v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v86,  &v85,  1LL));
  __int16 v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  1LL,  v41));
  v87 = v42;
  id v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v87, 1LL));
  (*((void (**)(id, void, void *))v11 + 2))(v11, 0LL, v43);

LABEL_30:
}

  if (v12) {
    archive_entry_free(v12);
  }
  return v19;
}

void sub_100014610(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = a3;
  int v8 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v6 reply]);
  if (v5)
  {

    ((void (**)(void, id, void))v8)[2](v8, v5, 0LL);
  }

  else
  {
    id v10 = v7;
    int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));

    ((void (**)(void, void, void *))v8)[2](v8, 0LL, v9);
  }
}

void sub_10001592C(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  uint64_t v4 = a3;
  uint64_t v5 = sub_10008C90C();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136316162;
    int v9 = "-[W5UserNotificationManager init]_block_invoke";
    __int16 v10 = 2080;
    id v11 = "W5UserNotificationManager.m";
    __int16 v12 = 1024;
    int v13 = 38;
    __int16 v14 = 1024;
    BOOL v15 = v3;
    __int16 v16 = 2114;
    BOOL v17 = v4;
    int v7 = 44;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "[wifivelocity] %s (%s:%u) Authorization for Notification: granted %d error %{public}@",  &v8,  v7);
  }
}

void sub_100015DD4(id a1, NSError *a2)
{
  double v2 = a2;
  uint64_t v3 = sub_10008C90C();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315906;
    int v7 = "-[W5UserNotificationManager dispatchNotificationWithTitle:subtitle:body:type:UUID:actionURL:]_block_invoke";
    __int16 v8 = 2080;
    int v9 = "W5UserNotificationManager.m";
    __int16 v10 = 1024;
    int v11 = 86;
    __int16 v12 = 2114;
    int v13 = v2;
    int v5 = 38;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v4,  0LL,  "[wifivelocity] %s (%s:%u) Queued Notification with Error: %{public}@",  &v6,  v5);
  }
}

void sub_100016914(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___W5ActivityManager);
  double v2 = (void *)qword_1000F74F8;
  qword_1000F74F8 = (uint64_t)v1;
}

void sub_100016BB8(uint64_t a1)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100016C3C;
  v5[3] = &unk_1000D1650;
  v5[4] = *(void *)(a1 + 32);
  uint64_t v2 = objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  1LL,  v5,  5.0));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;
}

void sub_100016C3C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(dispatch_queue_s **)(v1 + 40);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100016C94;
  block[3] = &unk_1000D11C8;
  void block[4] = v1;
  dispatch_async(v2, block);
}

void sub_100016C94(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v14 = [v1 count];
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[wifivelocity] W5ActivityManager activeTransactions %lu",  buf,  0xCu);
  }

  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  id v2 = v1;
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0LL; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t description = os_transaction_get_description(*(void *)(*((void *)&v8 + 1) + 8LL * (void)i));
          *(_DWORD *)buf = 136315138;
          id v14 = (id)description;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[wifivelocity] W5ActivityManager activeTransaction %s",  buf,  0xCu);
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v4);
  }
}

void sub_100016EDC(void *a1)
{
  id v2 = (void *)a1[4];
  if (!v2[2])
  {
    unsigned int v3 = [v2 debugTimerEnabled];
    id v2 = (void *)a1[4];
    if (v3)
    {
      [v2 debugTimer];
      id v2 = (void *)a1[4];
    }
  }

  if (!v2[6])
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    uint64_t v5 = a1[4];
    int v6 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v4;

    id v2 = (void *)a1[4];
  }

  int v7 = (void *)v2[1];
  if (v7 && [v7 isValid])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[wifivelocity] W5ActivityManager osTransactionCreate, timer was running, invalidating and freeing",  (uint8_t *)&v13,  2u);
    }

    [*(id *)(a1[4] + 8) invalidate];
    uint64_t v8 = a1[4];
    __int128 v9 = *(void **)(v8 + 8);
    *(void *)(v8 + _Block_object_dispose((const void *)(v29 - 128), 8) = 0LL;
  }

  [*(id *)(a1[4] + 24) addObject:a1[5]];
  ++*(void *)(a1[4] + 48LL);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = a1[6];
    id v11 = [*(id *)(a1[4] + 24) count];
    uint64_t v12 = *(void *)(a1[4] + 48LL);
    int v13 = 136315650;
    uint64_t v14 = v10;
    __int16 v15 = 2048;
    id v16 = v11;
    __int16 v17 = 2048;
    uint64_t v18 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[wifivelocity] W5ActivityManager osTransactionCreate %s, active count is now %lu, total started is now %lu",  (uint8_t *)&v13,  0x20u);
  }

void sub_100017178(void *a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t description = os_transaction_get_description(a1[4]);
    *(_DWORD *)buf = 136315138;
    double v16 = *(double *)&description;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[wifivelocity] W5ActivityManager osTransactionComplete %s",  buf,  0xCu);
  }

  if (([*(id *)(a1[5] + 24) containsObject:a1[4]] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = os_transaction_get_description(a1[4]);
      id v13 = [*(id *)(a1[5] + 24) count];
      *(_DWORD *)buf = 136315394;
      double v16 = *(double *)&v12;
      __int16 v17 = 2048;
      id v18 = v13;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] W5ActivityManager osTransactionComplete %s, TRANSACTION NOT FOUND, active count is now %lu",  buf,  0x16u);
    }

    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
  }

  [*(id *)(a1[5] + 24) removeObject:a1[4]];
  ++*(void *)(a1[5] + 64LL);
  if (![*(id *)(a1[5] + 24) count])
  {
    unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 persistentDomainForName:@"com.apple.wifivelocity"]);

    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"eager-exit-timeout"]);
    if (v5)
    {
      NSLog( @"%s: Found preference value in domain: %@ key: %@",  "-[W5ActivityManager osTransactionComplete:]_block_invoke",  @"com.apple.wifivelocity",  @"eager-exit-timeout");
      int v6 = [v5 intValue];
      if (v6 < 1)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[wifivelocity] W5ActivityManager empty, eager exit timer disabled via defaults write",  buf,  2u);
        }

        goto LABEL_21;
      }

      double v7 = (double)v6;
    }

    else
    {
      double v7 = 300.0;
    }

    uint64_t v8 = *(void **)(a1[5] + 8LL);
    BOOL v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v9)
      {
        *(_DWORD *)buf = 134217984;
        double v16 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[wifivelocity] W5ActivityManager empty, extending running eager exit timer to %f seconds",  buf,  0xCu);
        uint64_t v8 = *(void **)(a1[5] + 8LL);
      }

      uint64_t v10 = a1[5];
      id v11 = *(void **)(v10 + 8);
      *(void *)(v10 + _Block_object_dispose((const void *)(v29 - 128), 8) = 0LL;
    }

    else if (v9)
    {
      *(_DWORD *)buf = 134217984;
      double v16 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[wifivelocity] W5ActivityManager empty, configuring eager exit timer in %f seconds",  buf,  0xCu);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000174DC;
    block[3] = &unk_1000D16C8;
    void block[4] = a1[5];
    *(double *)&void block[5] = v7;
    dispatch_async(&_dispatch_main_q, block);
LABEL_21:
  }

void sub_1000174DC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100017564;
  v6[3] = &unk_1000D16A0;
  v6[4] = *(void *)(a1 + 32);
  v6[5] = v2;
  uint64_t v3 = objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  0LL,  v6));
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 8);
  *(void *)(v4 + _Block_object_dispose((const void *)(v29 - 128), 8) = v3;
}

void sub_100017564(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(v4 + 64);
    [*(id *)(v4 + 56) timeIntervalSinceNow];
    int v9 = 134218240;
    uint64_t v10 = v5;
    __int16 v11 = 2048;
    double v12 = -v6;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[wifivelocity] W5ActivityManager Completed %lu transactions within uptime of %f seconds",  (uint8_t *)&v9,  0x16u);
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    int v9 = 134217984;
    uint64_t v10 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[wifivelocity] W5ActivityManager Attempting Daemon Eager Exit due to inactivity timeout of %f seconds",  (uint8_t *)&v9,  0xCu);
  }

  [*(id *)(a1 + 32) _executeTimerBlock];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) alternateExecutionBlockForCleanExit]);

  if (!v8
    && (xpc_transaction_try_exit_clean() & 1) == 0
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[wifivelocity] W5ActivityManager Cannot eager exit, still outstanding transactions",  (uint8_t *)&v9,  2u);
  }
}

id sub_1000177DC(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 24) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

uint64_t sub_1000183A8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100018440(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_10001850C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t result = *(void *)(a1 + 32);
    if (result) {
      return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a3, 0LL);
    }
  }

  else
  {
    uint64_t result = *(void *)(a1 + 40);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }

  return result;
}

id *sub_10001853C(id *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3) {
    uint64_t result = (id *)objc_msgSend(result[4], "appendData:");
  }
  if (a4) {
    return (id *)[v5[5] appendData:a4];
  }
  return result;
}

uint64_t sub_100018580(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a3, 1LL);
  }
  return result;
}

uint64_t sub_100018604(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100018A7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3);
  }
  return result;
}

uint64_t sub_100018B40(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100018CAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t result = *(void *)(a1 + 32);
    if (result) {
      return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a3, 0LL);
    }
  }

  else
  {
    uint64_t result = *(void *)(a1 + 40);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }

  return result;
}

id sub_100018CDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  double v6 = *(void **)(a1 + 32);
  if (v6) {
    objc_msgSend(v6, "writeData:");
  }
  id result = *(id *)(a1 + 40);
  if (result) {
    return [result writeData:a4];
  }
  return result;
}

void sub_100018D54( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, int a11, int a12, uint64_t a13, __int16 a14, uint64_t a15, __int16 a16, int a17, __int16 a18, uint64_t a19)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    __int16 v19 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  0LL,  "[wifivelocity] %s (%s:%u) [NSFileHandle writeData:] failed with exception %{public}@");
    }
    objc_end_catch();
    JUMPOUT(0x100018D24LL);
  }

  _Unwind_Resume(exception_object);
}

uint64_t sub_100018EE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a3, 1LL);
  }
  return result;
}

LABEL_25:
    uint64_t v27 = 0LL;
    int v46 = 0LL;
    int v24 = 0LL;
    uint64_t v22 = 0LL;
LABEL_27:
    uint64_t v31 = 0LL;
    goto LABEL_33;
  }

  unsigned int v21 = objc_alloc(&OBJC_CLASS___NSFileHandle);
  uint64_t v22 = -[NSFileHandle initWithFileDescriptor:closeOnDealloc:]( v21,  "initWithFileDescriptor:closeOnDealloc:",  v63,  1LL);
  id v23 = objc_alloc(&OBJC_CLASS___NSFileHandle);
  int v24 = -[NSFileHandle initWithFileDescriptor:closeOnDealloc:]( v23,  "initWithFileDescriptor:closeOnDealloc:",  handle_4,  1LL);
  id v25 = objc_alloc(&OBJC_CLASS___NSFileHandle);
  int v46 = -[NSFileHandle initWithFileDescriptor:closeOnDealloc:]( v25,  "initWithFileDescriptor:closeOnDealloc:",  handle,  1LL);
  __int16 v26 = objc_alloc(&OBJC_CLASS___NSFileHandle);
  uint64_t v27 = -[NSFileHandle initWithFileDescriptor:closeOnDealloc:]( v26,  "initWithFileDescriptor:closeOnDealloc:",  v60,  1LL);
  -[NSTask setStandardOutput:](v18, "setStandardOutput:", v24);
  -[NSTask setStandardError:](v18, "setStandardError:", v27);
  -[NSTask setStandardInput:](v18, "setStandardInput:", 0LL);
  fcntl(v63, 4, 4LL);
  fcntl(handle, 4, 4LL);
  __int16 v28 = v63;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  __int16 v30 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v28, 0LL, global_queue);
  if (!v30)
  {
    v77 = NSLocalizedFailureReasonErrorKey;
    v78 = @"W5NoMemErr";
    NSErrorUserInfoKey v37 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  2LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v78,  &v77,  1LL));
    goto LABEL_27;
  }

  uint64_t v31 = v30;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100019A3C;
  handler[3] = &unk_1000D1830;
  v59 = v63;
  handler[7] = v70;
  handler[6] = v16;
  handler[4] = identifier;
  handler[5] = v18;
  dispatch_source_set_event_handler(v30, handler);
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472LL;
  v57[2] = sub_100019B70;
  v57[3] = &unk_1000D1858;
  v57[4] = v24;
  v57[5] = v22;
  v57[6] = v31;
  dispatch_source_set_cancel_handler(v31, v57);
  dispatch_resume(v31);
  __int16 v32 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, (int)handle, 0LL, global_queue);
  if (v32)
  {
    uint64_t v33 = v32;
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472LL;
    v55[2] = sub_100019BA0;
    v55[3] = &unk_1000D1830;
    __int16 v56 = handle;
    v55[6] = v16;
    v55[7] = v70;
    v55[4] = identifier;
    v55[5] = v18;
    dispatch_source_set_event_handler(v32, v55);
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472LL;
    v54[2] = sub_100019CD4;
    v54[3] = &unk_1000D1858;
    v54[4] = v27;
    v54[5] = v46;
    v54[6] = v33;
    dispatch_source_set_cancel_handler(v33, v54);
    dispatch_resume(v33);
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472LL;
    v53[2] = sub_100019D04;
    v53[3] = &unk_1000D1880;
    v53[12] = v70;
    v53[13] = v72;
    v53[4] = identifier;
    v53[5] = v18;
    v53[6] = a3;
    v53[7] = a4;
    v53[11] = &v64;
    v53[9] = v31;
    _BYTE v53[10] = a8;
    v53[14] = v74;
    v53[8] = v33;
    uint64_t v34 = -[NSNotificationCenter addObserverForName:object:queue:usingBlock:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "addObserverForName:object:queue:usingBlock:",  NSTaskDidTerminateNotification,  v18,  +[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"),  v53);
    v65[5] = (uint64_t)v34;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001A1E0;
    block[3] = &unk_1000D1920;
    void block[4] = v18;
    void block[5] = a3;
    void block[6] = v33;
    block[7] = v31;
    block[8] = identifier;
    block[9] = a4;
    block[10] = 0LL;
    block[11] = v47;
    *(double *)&block[14] = a5;
    block[12] = v74;
    block[13] = v72;
    dispatch_async(&_dispatch_main_q, block);
    goto LABEL_16;
  }

  v75 = NSLocalizedFailureReasonErrorKey;
  v76 = @"W5NoMemErr";
  __int16 v15 = a4;
  uint64_t v14 = &off_1000A4000;
  NSErrorUserInfoKey v37 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  2LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v76,  &v75,  1LL));
LABEL_33:

  if (v31)
  {
    dispatch_source_cancel(v31);
  }

  else
  {
  }

  __int16 v42 = (dispatch_queue_global_t)identifier;
  if (!identifier) {
    __int16 v42 = dispatch_get_global_queue(0LL, 0LL);
  }
  v51[0] = _NSConcreteStackBlock;
  v51[1] = *((void *)v14 + 447);
  v51[2] = sub_10001A830;
  v51[3] = &unk_1000D18A8;
  v51[4] = a3;
  v51[5] = v37;
  v51[6] = v15;
  v51[7] = v18;
  v51[8] = v47;
  v51[9] = v74;
  dispatch_async(v42, v51);
  if (identifier) {
    dispatch_release(identifier);
  }

LABEL_16:
  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(v70, 8);
  _Block_object_dispose(v72, 8);
  _Block_object_dispose(v74, 8);
}

      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
      dispatch_time_t v35 = (void *)objc_claimAutoreleasedReturnValue([v34 peers]);
      int v36 = sub_100083F7C(v35, 1LL);
      NSErrorUserInfoKey v37 = (void *)objc_claimAutoreleasedReturnValue(v36);

      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
      NSErrorUserInfoKey v39 = (void *)objc_claimAutoreleasedReturnValue([v38 peers]);
      __int16 v40 = sub_100083F7C(v39, 2LL);
      id v41 = (void *)objc_claimAutoreleasedReturnValue(v40);

      v108 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      if (v37) {
        -[NSMutableArray addObjectsFromArray:](v108, "addObjectsFromArray:", v37);
      }
      if (v41) {
        -[NSMutableArray addObjectsFromArray:](v108, "addObjectsFromArray:", v41);
      }
      v157 = @"peers";
      uint64_t v158 = v108;
      __int16 v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v158,  &v157,  1LL));
      -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:]( self,  "_runAction:peer:info:handler:completion:",  12LL,  0LL,  v42,  v105,  v106);

      if (v37)
      {
        v119 = 0u;
        v120 = 0u;
        v117 = 0u;
        v118 = 0u;
        id v43 = v37;
        id v44 = [v43 countByEnumeratingWithState:&v117 objects:v156 count:16];
        if (v44)
        {
          id v45 = *(void *)v118;
          do
          {
            for (uint64_t i = 0LL; i != v44; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v118 != v45) {
                objc_enumerationMutation(v43);
              }
              v47 = *(void *)(*((void *)&v117 + 1) + 8LL * (void)i);
              v154 = @"DiagnosticsMode";
              __int16 v48 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
              v155 = v48;
              v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v155,  &v154,  1LL));
              -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:]( self,  "_runAction:peer:info:handler:completion:",  3LL,  v47,  v49,  v105,  v106);
            }

            id v44 = [v43 countByEnumeratingWithState:&v117 objects:v156 count:16];
          }

          while (v44);
        }
      }

      else
      {
        __int16 v50 = sub_10008C90C();
        id v43 = (id)objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)location = 136315138;
          *(void *)&location[4] = "-[W5DiagnosticsModeProcessor performStopOperationsForMode:handler:completion:]";
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v43,  0LL,  "[wifivelocity] %s: [DM] no primary peers found in peer list",  location);
        }
      }

      if (v41)
      {
        v115 = 0u;
        v116 = 0u;
        id v113 = 0u;
        uint64_t v114 = 0u;
        int v51 = v41;
        __int16 v52 = [v51 countByEnumeratingWithState:&v113 objects:v153 count:16];
        if (v52)
        {
          uint64_t v53 = *(void *)v114;
          do
          {
            for (j = 0LL; j != v52; j = (char *)j + 1)
            {
              if (*(void *)v114 != v53) {
                objc_enumerationMutation(v51);
              }
              uint64_t v55 = *(void *)(*((void *)&v113 + 1) + 8LL * (void)j);
              id v151 = @"DiagnosticsMode";
              __int16 v56 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
              dispatch_semaphore_t v152 = v56;
              v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v152,  &v151,  1LL));
              -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:]( self,  "_runAction:peer:info:handler:completion:",  4LL,  v55,  v57,  v105,  v106);
            }

            __int16 v52 = [v51 countByEnumeratingWithState:&v113 objects:v153 count:16];
          }

          while (v52);
        }
      }

      else
      {
        v58 = sub_10008C90C();
        int v51 = (id)objc_claimAutoreleasedReturnValue(v58);
        if (os_log_type_enabled((os_log_t)v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)location = 136315138;
          *(void *)&location[4] = "-[W5DiagnosticsModeProcessor performStopOperationsForMode:handler:completion:]";
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v51,  0LL,  "[wifivelocity] %s: [DM] no secondary peers found in peer list",  location);
        }
      }

LABEL_52:
      v59 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
      if ([v59 role])
      {
      }

      else
      {
        v60 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
        v61 = ((unint64_t)[v60 role] & 2) == 0;

        if (v61) {
          goto LABEL_57;
        }
      }

      v62 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
      v149[0] = @"event";
      v63 = -[NSNumber initWithInt:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInt:", 1LL);
      v150[0] = v63;
      v149[1] = @"DiagnosticsMode";
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
      v150[1] = v64;
      uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v150,  v149,  2LL));
      -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:]( self,  "_runAction:peer:info:handler:completion:",  6LL,  v62,  v65,  v105,  v106);

      v66 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
      v147[0] = @"event";
      v67 = -[NSNumber initWithInt:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInt:", 1LL);
      v147[1] = @"DiagnosticsMode";
      v148[0] = v67;
      v148[1] = v99;
      v68 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v148,  v147,  2LL));
      -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:]( self,  "_runAction:peer:info:handler:completion:",  11LL,  v66,  v68,  v105,  v106);

      v69 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
      v145 = @"DiagnosticsMode";
      uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
      v146 = v70;
      v71 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v146,  &v145,  1LL));
      -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:]( self,  "_runAction:peer:info:handler:completion:",  8LL,  v69,  v71,  v105,  v106);

      uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
      BOOL v143 = @"DiagnosticsMode";
      uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
      uint64_t v144 = v73;
      dispatch_time_t v74 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v144,  &v143,  1LL));
      -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:]( self,  "_runAction:peer:info:handler:completion:",  10LL,  v72,  v74,  v105,  v106);

LABEL_57:
      v75 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
      v76 = [v75 role];

      if ((v76 & 1) != 0)
      {
        v77 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
        v141 = @"DiagnosticsMode";
        v78 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
        v142 = v78;
        v79 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v142,  &v141,  1LL));
        -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:]( self,  "_runAction:peer:info:handler:completion:",  7LL,  v77,  v79,  v105,  v106);
      }

      v80 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
      uint64_t v81 = [v80 role];

      if ((v81 & 4) != 0)
      {
        v82 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
        BOOL v139 = @"DiagnosticsMode";
        uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
        uint64_t v140 = v83;
        v84 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v140,  &v139,  1LL));
        -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:]( self,  "_runAction:peer:info:handler:completion:",  8LL,  v82,  v84,  v105,  v106);

        v85 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
        v137 = @"DiagnosticsMode";
        v138 = v99;
        uint64_t v86 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v138,  &v137,  1LL));
        -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:]( self,  "_runAction:peer:info:handler:completion:",  9LL,  v85,  v86,  v105,  v106);
      }

      v87 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor operationErrors](self, "operationErrors"));
      if (v87)
      {
        v88 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor operationErrors](self, "operationErrors"));
        dispatch_semaphore_t v89 = [v88 count] == 0;

        if (!v89)
        {
          v90 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
          [v90 setState:5];
        }
      }

      objc_initWeak((id *)location, self);
      id v91 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor queue](self, "queue"));
      v110[0] = _NSConcreteStackBlock;
      v110[1] = 3221225472LL;
      v110[2] = sub_1000852D8;
      v110[3] = &unk_1000D33B0;
      objc_copyWeak(&v112, (id *)location);
      v111 = v106;
      [v91 addBarrierBlock:v110];

      objc_destroyWeak(&v112);
      objc_destroyWeak((id *)location);
      goto LABEL_65;
    }

    unsigned __int8 v123 = 0u;
    v124 = 0u;
    v121 = 0u;
    v122 = 0u;
    id obj = v98;
    v102 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v121,  v163,  16LL);
    if (!v102) {
      goto LABEL_25;
    }
    v101 = *(void *)v122;
LABEL_11:
    double v16 = 0LL;
    while (1)
    {
      if (*(void *)v122 != v101)
      {
        __int16 v17 = v16;
        objc_enumerationMutation(obj);
        double v16 = v17;
      }

      v103 = v16;
      v107 = *(void **)(*((void *)&v121 + 1) + 8 * v16);
      uint64_t v161 = @"DiagnosticsMode";
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
      v162 = v18;
      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v162,  &v161,  1LL));
      -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:]( self,  "_runAction:peer:info:handler:completion:",  1LL,  v107,  v19,  v105,  v106);

      v104 = (void *)objc_claimAutoreleasedReturnValue([v107 peer]);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v104 peerID]);
      unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 peer]);
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 peerID]);
      if (v20 == v23) {
        break;
      }
      int v24 = (void *)objc_claimAutoreleasedReturnValue([v107 peer]);
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 peerID]);
      __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 peer]);
      __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 peerID]);
      int v29 = [v25 isEqual:v28];

      if ((v29 & 1) != 0) {
        goto LABEL_18;
      }
      v159 = @"DiagnosticsMode";
      __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
      dispatch_time_t v160 = v30;
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v160,  &v159,  1LL));
      -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:]( self,  "_runAction:peer:info:handler:completion:",  5LL,  v107,  v31,  v105,  v106);

LABEL_20:
      double v16 = v103 + 1;
      if (v102 == (id)(v103 + 1))
      {
        v102 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v121,  v163,  16LL);
        if (!v102) {
          goto LABEL_25;
        }
        goto LABEL_11;
      }
    }

LABEL_18:
    __int16 v32 = sub_10008C90C();
    __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 136315394;
      *(void *)&location[4] = "-[W5DiagnosticsModeProcessor performStopOperationsForMode:handler:completion:]";
      v129 = 2112;
      v130 = (const char *)v107;
      LODWORD(v97) = 22;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v30,  0LL,  "[wifivelocity] %s: [DM] skipping local peer (%@) set sniffer action",  location,  v97);
    }

    goto LABEL_20;
  }

  v92 = sub_10008C90C();
  dispatch_time_t v93 = (os_log_s *)objc_claimAutoreleasedReturnValue(v92);
  if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
  {
    *(void *)&location[4] = "-[W5DiagnosticsModeProcessor performStopOperationsForMode:handler:completion:]";
    v129 = 2080;
    *(_DWORD *)location = 136316162;
    v130 = "W5DiagnosticsModeProcessor.m";
    v131 = 1024;
    v132 = 351;
    v133 = 2048;
    v134 = [v7 state];
    v135 = 2114;
    uint64_t v136 = v7;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v93,  0LL,  "[wifivelocity] %s (%s:%u) [DM] invalid state (state=%ld) provided for stopping diagnostics mode='%{public}@'",  location,  48);
  }

  v125 = NSLocalizedFailureReasonErrorKey;
  v126 = @"W5ParamErr";
  uint64_t v94 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v126,  &v125,  1LL));
  v95 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  1LL,  v94));
  uint64_t v127 = v95;
  v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v127, 1LL));
  (*((void (**)(id, void, void *))v106 + 2))(v106, 0LL, v96);

LABEL_65:
}

void sub_1000199C4(_Unwind_Exception *a1)
{
}

void sub_100019A20(uint64_t a1, uint64_t a2)
{
}

void sub_100019A30(uint64_t a1)
{
}

void sub_100019A3C(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  ssize_t v3 = read(*(_DWORD *)(a1 + 64), v8, 0x1000uLL);
  if (v3 >= 1)
  {
    uint64_t v4 = +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v8, v3);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100019B20;
    block[3] = &unk_1000D1808;
    __int128 v7 = *(_OWORD *)(a1 + 48);
    uint64_t v5 = *(dispatch_queue_s **)(a1 + 32);
    void block[4] = *(void *)(a1 + 40);
    void block[5] = v4;
    dispatch_async(v5, block);
  }

  objc_autoreleasePoolPop(v2);
}

void sub_100019B20(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  if (!*(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL))
  {
    uint64_t v3 = a1[6];
    if (v3) {
      (*(void (**)(uint64_t, void, void, void))(v3 + 16))(v3, a1[4], a1[5], 0LL);
    }
  }

  objc_autoreleasePoolPop(v2);
}

void sub_100019B70(uint64_t a1)
{
}

void sub_100019BA0(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  ssize_t v3 = read(*(_DWORD *)(a1 + 64), v8, 0x1000uLL);
  if (v3 >= 1)
  {
    uint64_t v4 = +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v8, v3);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100019C84;
    block[3] = &unk_1000D1808;
    __int128 v7 = *(_OWORD *)(a1 + 48);
    uint64_t v5 = *(dispatch_queue_s **)(a1 + 32);
    void block[4] = *(void *)(a1 + 40);
    void block[5] = v4;
    dispatch_async(v5, block);
  }

  objc_autoreleasePoolPop(v2);
}

void sub_100019C84(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  if (!*(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL))
  {
    uint64_t v3 = a1[6];
    if (v3) {
      (*(void (**)(uint64_t, void, void, void))(v3 + 16))(v3, a1[4], 0LL, a1[5]);
    }
  }

  objc_autoreleasePoolPop(v2);
}

void sub_100019CD4(uint64_t a1)
{
}

void sub_100019D04(uint64_t a1)
{
  uint64_t v2 = *(dispatch_queue_s **)(a1 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100019FF0;
  block[3] = &unk_1000D12E0;
  void block[4] = *(void *)(a1 + 96);
  dispatch_async(v2, block);
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 104) + 8LL) + 24LL))
  {
    NSErrorUserInfoKey v14 = NSLocalizedFailureReasonErrorKey;
    __int16 v15 = @"W5TimeoutErr";
    uint64_t v3 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  3LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
  }

  else
  {
    signed int v4 = [*(id *)(a1 + 40) terminationStatus];
    if (v4)
    {
      NSErrorUserInfoKey v12 = NSLocalizedFailureReasonErrorKey;
      id v13 = @"terminationStatus";
      uint64_t v3 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v4,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
    }

    else
    {
      uint64_t v3 = 0LL;
    }
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10001A020;
  v10[3] = &unk_1000D18A8;
  uint64_t v5 = *(void *)(a1 + 56);
  v10[4] = *(void *)(a1 + 48);
  v10[5] = v3;
  uint64_t v6 = *(void *)(a1 + 80);
  __int128 v7 = *(dispatch_queue_s **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  v10[6] = v5;
  v10[7] = v8;
  uint64_t v9 = *(void *)(a1 + 112);
  v10[8] = v6;
  v10[9] = v9;
  dispatch_async(v7, v10);
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 64));
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 72));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

void sub_100019FD0(_Unwind_Exception *a1)
{
}

void sub_100019FF0(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
  objc_autoreleasePoolPop(v2);
}

void sub_10001A020(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 32) lastPathComponent];
    if (*(void *)(a1 + 40)) {
      uint64_t v5 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" (error=%@)",  *(void *)(a1 + 40));
    }
    else {
      uint64_t v5 = &stru_1000D4648;
    }
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [*(id *)(a1 + 48) componentsJoinedByString:@" "];
    int v10 = 136316674;
    __int16 v11 = "+[NSTask(WiFiVelocity) runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:]_block_invoke";
    __int16 v12 = 2080;
    id v13 = "W5TaskUtil.m";
    __int16 v14 = 1024;
    int v15 = 451;
    __int16 v16 = 2114;
    id v17 = v4;
    __int16 v18 = 2114;
    __int16 v19 = v5;
    __int16 v20 = 2114;
    uint64_t v21 = v6;
    __int16 v22 = 2114;
    id v23 = v7;
    int v9 = 68;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v3,  0LL,  "[wifivelocity] %s (%s:%u) <%{public}@> END%{public}@ - '%{public}@ %{public}@'",  &v10,  v9);
  }

  uint64_t v8 = *(void *)(a1 + 64);
  if (v8) {
    (*(void (**)(uint64_t, void, void))(v8 + 16))(v8, *(void *)(a1 + 56), *(void *)(a1 + 40));
  }
  objc_msgSend( +[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"),  "osTransactionComplete:",  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));

  *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL) = 0LL;
  objc_autoreleasePoolPop(v2);
}

void sub_10001A1E0(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(a1 + 32) launch];
  uint64_t v3 = *(dispatch_queue_s **)(a1 + 64);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001A67C;
  block[3] = &unk_1000D18D0;
  uint64_t v4 = *(void *)(a1 + 32);
  void block[4] = *(void *)(a1 + 40);
  int8x16_t v11 = vextq_s8(*(int8x16_t *)(a1 + 72), *(int8x16_t *)(a1 + 72), 8uLL);
  uint64_t v5 = *(void *)(a1 + 88);
  uint64_t v12 = v4;
  uint64_t v13 = v5;
  dispatch_async(v3, block);
  double v6 = *(double *)(a1 + 112);
  if (v6 > 0.0)
  {
    dispatch_time_t v7 = dispatch_time(0LL, (uint64_t)(v6 * 1000000000.0));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10001A804;
    v9[3] = &unk_1000D18F8;
    uint64_t v8 = *(void *)(a1 + 104);
    v9[4] = *(void *)(a1 + 32);
    v9[5] = v8;
    dispatch_after(v7, &_dispatch_main_q, v9);
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10001A490(void *a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    objc_begin_catch(a1);
    JUMPOUT(0x10001A3C8LL);
  }

  JUMPOUT(0x10001A4C0LL);
}

void sub_10001A4C8(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 32) lastPathComponent];
    NSErrorUserInfoKey v10 = NSLocalizedFailureReasonErrorKey;
    int8x16_t v11 = @"W5ResourceErr";
    uint64_t v5 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  7LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [*(id *)(a1 + 40) componentsJoinedByString:@" "];
    int v12 = 136316674;
    uint64_t v13 = "+[NSTask(WiFiVelocity) runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:]_block_invoke";
    __int16 v14 = 2080;
    int v15 = "W5TaskUtil.m";
    __int16 v16 = 1024;
    int v17 = 486;
    __int16 v18 = 2114;
    id v19 = v4;
    __int16 v20 = 2114;
    uint64_t v21 = v5;
    __int16 v22 = 2114;
    uint64_t v23 = v6;
    __int16 v24 = 2114;
    id v25 = v7;
    int v9 = 68;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v3,  0LL,  "[wifivelocity] %s (%s:%u) <%{public}@> START (error=%{public}@) - '%{public}@ %{public}@'",  &v12,  v9);
  }

  uint64_t v8 = *(void *)(a1 + 64);
  if (v8) {
    (*(void (**)(uint64_t, void, void))(v8 + 16))(v8, *(void *)(a1 + 48), *(void *)(a1 + 56));
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10001A67C(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 32) lastPathComponent];
    if (*(void *)(a1 + 40)) {
      uint64_t v5 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" (error=%@)",  *(void *)(a1 + 40));
    }
    else {
      uint64_t v5 = &stru_1000D4648;
    }
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [*(id *)(a1 + 48) componentsJoinedByString:@" "];
    int v10 = 136316674;
    int8x16_t v11 = "+[NSTask(WiFiVelocity) runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:]_block_invoke";
    __int16 v12 = 2080;
    uint64_t v13 = "W5TaskUtil.m";
    __int16 v14 = 1024;
    int v15 = 499;
    __int16 v16 = 2114;
    id v17 = v4;
    __int16 v18 = 2114;
    id v19 = v5;
    __int16 v20 = 2114;
    uint64_t v21 = v6;
    __int16 v22 = 2114;
    id v23 = v7;
    int v9 = 68;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v3,  0LL,  "[wifivelocity] %s (%s:%u) <%{public}@> START%{public}@ - '%{public}@ %{public}@'",  &v10,  v9);
  }

  uint64_t v8 = *(void *)(a1 + 64);
  if (v8) {
    (*(void (**)(uint64_t, void, void))(v8 + 16))(v8, *(void *)(a1 + 56), *(void *)(a1 + 40));
  }
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_10001A804(uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  return kill((pid_t)[*(id *)(a1 + 32) processIdentifier], 9);
}

void sub_10001A830(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 32) lastPathComponent];
    if (*(void *)(a1 + 40)) {
      uint64_t v5 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" (error=%@)",  *(void *)(a1 + 40));
    }
    else {
      uint64_t v5 = &stru_1000D4648;
    }
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [*(id *)(a1 + 48) componentsJoinedByString:@" "];
    int v10 = 136316674;
    int8x16_t v11 = "+[NSTask(WiFiVelocity) runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:]_block_invoke_2";
    __int16 v12 = 2080;
    uint64_t v13 = "W5TaskUtil.m";
    __int16 v14 = 1024;
    int v15 = 541;
    __int16 v16 = 2114;
    id v17 = v4;
    __int16 v18 = 2114;
    id v19 = v5;
    __int16 v20 = 2114;
    uint64_t v21 = v6;
    __int16 v22 = 2114;
    id v23 = v7;
    int v9 = 68;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v3,  0LL,  "[wifivelocity] %s (%s:%u) <%{public}@> START%{public}@ - '%{public}@ %{public}@'",  &v10,  v9);
  }

  uint64_t v8 = *(void *)(a1 + 64);
  if (v8) {
    (*(void (**)(uint64_t, void, void))(v8 + 16))(v8, *(void *)(a1 + 56), *(void *)(a1 + 40));
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10001ACD4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001ACF8(uint64_t a1, void *a2, char a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = a2;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10001AFCC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001AFF0(uint64_t a1, void *a2, char a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10001B2C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001B2E8(uint64_t a1, void *a2, char a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

LABEL_12:
    id v23 = sub_10008C90C();
    publicKey = (NSData *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled((os_log_t)publicKey, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v28 = 136315650;
      int v29 = "-[W5PeerFileTransferRequestPayload initWithRequest:]";
      __int16 v30 = 2080;
      uint64_t v31 = "W5PeerFileTransferRequestPayload.m";
      __int16 v32 = 1024;
      uint64_t v33 = 53;
      LODWORD(v24) = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  publicKey,  0LL,  "[wifivelocity] %s (%s:%u) init error some objects were not found in request",  (const char *)&v28,  v24,  v25);
    }

    uint64_t v5 = 0LL;
    goto LABEL_9;
  }

  if (!type) {
    goto LABEL_12;
  }
LABEL_10:

  return v5;
}

  if (!-[NSMutableDictionary count](v3, "count"))
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s: empty payload",  "-[W5PeerFileTransferRequestPayload encode]"));
    __int16 v18 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v17,  0LL));

    objc_exception_throw(v18);
  }

  return v3;
}

  objc_autoreleasePoolPop(v2);
}

    CFRelease(v3);
  }

  else
  {
    uint64_t v6 = (const __CFArray *)v3;
  }

  CFRelease(v6);
  return v5;
}

  id v17 = 0.1;
  if (v9)
  {
LABEL_5:
    [v9 doubleValue];
    id v19 = v18;
    if (!v10) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  if (!-[NSMutableDictionary count](v3, "count"))
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s: empty payload",  "-[W5PeerStatusResponsePayload encode]"));
    __int16 v18 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v17,  0LL));

    objc_exception_throw(v18);
  }

  return v3;
}

  return v7;
}

__CFString *sub_10001BCD0(unint64_t a1)
{
  uint64_t result = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"? (%ld)", a1);
  if (a1 <= 4) {
    return off_1000D19A8[a1];
  }
  return result;
}

id sub_10001BD20(void *a1)
{
  id v1 = objc_msgSend(objc_msgSend(a1, "scanRecord"), "objectForKeyedSubscript:", @"WPA_IE");
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = v1;
  id v3 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  [v3 appendString:@"["];
  id v4 = objc_msgSend(objc_msgSend(v2, "objectForKeyedSubscript:", @"IE_KEY_WPA_MCIPHER"), "intValue");
  int v5 = (_DWORD)v4 - 1;
  else {
    uint64_t v6 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"<%i>", v4);
  }
  [v3 appendFormat:@"mcast=%@, ", v6];
  [v3 appendString:@"ucast={ "];
  id v23 = v2;
  id v7 = [v2 objectForKeyedSubscript:@"IE_KEY_WPA_UCIPHERS"];
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v29;
    do
    {
      for (uint64_t i = 0LL; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v28 + 1) + 8 * (void)i) intValue];
        int v13 = (_DWORD)v12 - 1;
        else {
          uint64_t v14 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"<%i>", v12);
        }
        [v3 appendFormat:@"%@ ", v14];
      }

      id v9 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }

    while (v9);
  }

  objc_msgSend(v3, "appendString:", @"}, ");
  [v3 appendString:@"auths={ "];
  id v15 = [v23 objectForKeyedSubscript:@"IE_KEY_WPA_AUTHSELS"];
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v16 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v25;
    do
    {
      for (j = 0LL; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = [*(id *)(*((void *)&v24 + 1) + 8 * (void)j) intValue];
        else {
          uint64_t v21 = off_1000D19F8[(int)v20];
        }
        [v3 appendFormat:@"%@ ", v21];
      }

      id v17 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }

    while (v17);
  }

  [v3 appendString:@"}"];
  [v3 appendString:@"]"];
  return v3;
}

__CFString *sub_10001C054(uint64_t a1)
{
  int v1 = a1 - 1;
  else {
    return (__CFString *)+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"<%i>", a1);
  }
}

id sub_10001C0B0(void *a1)
{
  id v1 = objc_msgSend(objc_msgSend(a1, "scanRecord"), "objectForKeyedSubscript:", @"RSN_IE");
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = v1;
  id v3 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  [v3 appendString:@"["];
  [v3 appendFormat:@"mcast=%@, ", sub_10001C054((uint64_t)objc_msgSend( objc_msgSend(v2, "objectForKeyedSubscript:", @"IE_KEY_RSN_MCIPHER"), "intValue"))];
  [v3 appendString:@"ucast={ "];
  id v4 = [v2 objectForKeyedSubscript:@"IE_KEY_RSN_UCIPHERS"];
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v27;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 appendFormat:@"%@ ", sub_10001C054((uint64_t)objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * (void)v8), "intValue"))];
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }

    while (v6);
  }

  objc_msgSend(v3, "appendString:", @"}, ");
  [v3 appendString:@"auths={ "];
  uint64_t v21 = v2;
  id v9 = [v2 objectForKeyedSubscript:@"IE_KEY_RSN_AUTHSELS"];
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      int v13 = 0LL;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = [*(id *)(*((void *)&v22 + 1) + 8 * (void)v13) intValue];
        else {
          id v15 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"<%i>", v14);
        }
        [v3 appendFormat:@"%@ ", v15];
        int v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }

    while (v11);
  }

  objc_msgSend(v3, "appendString:", @"}, ");
  id v16 = [v21 objectForKeyedSubscript:@"IE_KEY_RSN_CAPS"];
  unsigned int v17 = objc_msgSend(objc_msgSend(v16, "objectForKeyedSubscript:", @"MFP_CAPABLE"), "BOOLValue");
  unsigned int v18 = objc_msgSend(objc_msgSend(v16, "objectForKeyedSubscript:", @"MFP_REQUIRED"), "BOOLValue");
  id v19 = "no";
  if (v17) {
    id v19 = "capable";
  }
  if (v18) {
    id v19 = "required";
  }
  objc_msgSend(v3, "appendFormat:", @"mfp=%s", v19);
  [v3 appendString:@"]"];
  return v3;
}

CFStringRef sub_10001C3F0(uint64_t a1)
{
  if (!a1) {
    return &stru_1000D4648;
  }
  unint64_t v2 = *(unsigned __int8 *)(a1 + 8980);
  if (v2 > 2) {
    id v3 = " INVALID";
  }
  else {
    id v3 = off_1000D1990[v2];
  }
  int v4 = snprintf(__str, 0x4000uLL, " \n AP STATUS DETERMINED AS: %s \n", v3);
  uint64_t v5 = 0LL;
  memset((char *)&v53[6] + 15, 0, 289);
  memset((char *)&v52[1] + 8, 0, 376);
  strcpy((char *)v52, " Number of events     :");
  do
  {
    snprintf((char *)v52, 0x190uLL, "%s %u\t", (const char *)v52, *(unsigned __int16 *)(a1 + 8982 + v5));
    v5 += 2LL;
  }

  while (v5 != 32);
  strcpy( (char *)v53,  " Period Ranges [sec]  : 0\t 0-1\t 1-2\t 2-3\t 3-4\t 4-5\t 5-6\t 6-7\t 7-8\t 8-9\t 9-10\t 11-15\t 16-20\t 21-30\t 31-60\t 60+\n");
  uint64_t v6 = snprintf(&__str[v4], 0x4000LL - v4, " \n GENERAL RX RATE PERIOD REPORT \n") + (uint64_t)v4;
  int v7 = v6 + snprintf(&__str[v6], 0x4000 - v6, "%s \n", (const char *)v52);
  int v8 = snprintf(&__str[v7], 0x4000LL - v7, "%s \n", (const char *)v53);
  uint64_t v9 = 0LL;
  strcpy((char *)v52, " Number of events    :");
  memset(v53, 0, sizeof(v53));
  memset((char *)&v52[1] + 7, 0, 377);
  do
  {
    snprintf((char *)v52, 0x190uLL, "%s %u\t", (const char *)v52, *(unsigned __int16 *)(a1 + 9014 + v9));
    v9 += 2LL;
  }

  while (v9 != 32);
  strcpy( (char *)v53,  " Period Ranges [sec] : 0\t 0-1\t 1-2\t 2-3\t 3-4\t 4-5\t 5-6\t 6-7\t 7-8\t 8-9\t 9-10\t 11-15\t 16-20\t 21-30\t 31-60\t 60+\n");
  int v10 = snprintf(&__str[v7 + v8], 0x4000LL - (v7 + v8), " LINK DOWN LOW RX RATE PERIOD REPORT \n") + v7 + v8;
  int v11 = v10 + snprintf(&__str[v10], 0x4000LL - v10, "%s \n", (const char *)v52);
  int v12 = v11 + snprintf(&__str[v11], 0x4000LL - v11, "%s \n", (const char *)v53);
  memset(v52, 0, sizeof(v52));
  memset(v53, 0, sizeof(v53));
  int v13 = snprintf(&__str[v12], 0x4000LL - v12, " ERRORS SUMMARY: GUARD PERIOD START TIME ZERO EVENT \n") + v12;
  int v14 = snprintf( &__str[v13],  0x4000LL - v13,  " Number of reports:     %d\t %d\t %d\t %d\t \n",  *(_DWORD *)(a1 + 8908),  *(_DWORD *)(a1 + 8912),  *(_DWORD *)(a1 + 8916),  *(_DWORD *)(a1 + 8920))
      + v13;
  uint64_t v15 = 0LL;
  int v16 = v14 + snprintf(&__str[v14], 0x4000LL - v14, " Guard Period reason:  FRTS\t SCAN\t PSF\t AW\t \n\n");
  v49 = (_DWORD *)a1;
  uint64_t v17 = a1 + 64;
  __int128 v46 = *(_OWORD *)" Number of reports: ";
  strcpy((char *)&v45, "ports: ");
  __int128 v44 = *(_OWORD *)" Guard        Time: ";
  strcpy((char *)&v43, " Time: ");
  do
  {
    memset((char *)&v52[1] + 5, 0, 379);
    v52[0] = v46;
    *(void *)((char *)v52 + 13) = v45;
    memset((char *)&v53[1] + 5, 0, 368);
    v53[24] = 0u;
    v53[0] = v44;
    *(void *)((char *)v53 + 13) = v43;
    snprintf((char *)v53, 0x190uLL, " %s\t 16-20\t 21-30\t 31-40\t 41-50\t 51-100\t 101-200 201+\n", (const char *)v53);
    uint64_t v18 = 0LL;
    int v19 = 0;
    do
    {
      v19 += *(_DWORD *)(v17 + v18);
      snprintf((char *)v52, 0x190uLL, "%s\t %d", (const char *)v52, *(_DWORD *)(v17 + v18));
      v18 += 4LL;
    }

    while (v18 != 28);
    uint64_t v20 = snprintf( &__str[v16],  0x4000LL - v16,  " ERRORS SUMMARY: LONG %s GUARD PERIOD - TOTAL %d  \n",  off_1000D1968[v15],  v19)
        + (uint64_t)v16;
    LODWORD(v20) = v20 + snprintf(&__str[v20], 0x4000 - v20, "%s \n", (const char *)v52);
    int v16 = v20 + snprintf(&__str[(int)v20], 0x4000LL - (int)v20, "%s \n", (const char *)v53);
    ++v15;
    v17 += 88LL;
  }

  while (v15 != 5);
  int v21 = snprintf(&__str[v16], 0x4000LL - v16, " \n ERRORS SUMMARY: INVALID PACKET AMOUNT REPORTS \n") + v16;
  __int128 v22 = v49;
  int v23 = snprintf( &__str[v21],  0x4000LL - v21,  " Number of reports:       %d\t %d\t %d\t %d\t \n",  v49[2212],  v49[2213],  v49[2214],  v49[2215])
      + v21;
  int v24 = v23 + snprintf(&__str[v23], 0x4000LL - v23, " Guard Period reason:     FRTS\t SCAN\t PSF\t AW\t \n");
  int v25 = v24
      + snprintf( &__str[v24],  0x4000LL - v24,  " \n ERRORS SUMMARY: PACKET ARRIVAL TIME BEFORE GUARD TIME PERIOD REPORTS \n");
  int v26 = snprintf( &__str[v25],  0x4000LL - v25,  " Number of packets:       %d\t %d\t %d\t %d\t \n",  v22[2217],  v22[2218],  v22[2219],  v22[2220])
      + v25;
  int v27 = snprintf( &__str[v26],  0x4000LL - v26,  " Number of guard periods: %d\t %d\t %d\t %d\t \n",  v22[2222],  v22[2223],  v22[2224],  v22[2225])
      + v26;
  int v28 = snprintf(&__str[v27], 0x4000LL - v27, " Guard Period reason:     FRTS\t SCAN\t PSF\t AW\t \n");
  uint64_t v29 = 0LL;
  int v30 = v27 + v28;
  __int128 v31 = v49 + 1;
  __int16 v48 = v49 + 111;
  do
  {
    v47 = v31;
    memset((char *)&v53[1] + 5, 0, 379);
    v53[0] = v44;
    *(void *)((char *)v53 + 13) = v43;
    memset((char *)&v52[1] + 5, 0, 368);
    v52[24] = 0u;
    v52[0] = v46;
    *(void *)((char *)v52 + 13) = v45;
    uint64_t v50 = v29;
    uint64_t v32 = snprintf(&__str[v30], 0x4000LL - v30, " \n GUARD TIME %s REPORT\n", off_1000D1968[v29]) + (uint64_t)v30;
    int v33 = snprintf(&__str[v32], 0x4000 - v32, " Guard Time distribution in 1 milisec granualty \n");
    for (uint64_t i = 0LL; i != 15; ++i)
    {
      if (v47[i])
      {
        snprintf((char *)v53, 0x190uLL, "%s\t %d", (const char *)v53, i);
        snprintf((char *)v52, 0x190uLL, "%s\t %d", (const char *)v52, v47[i]);
      }
    }

    int v35 = snprintf(&__str[(int)v32 + v33], 0x4000LL - ((int)v32 + v33), "%s \n", (const char *)v52) + v32 + v33;
    uint64_t v36 = 0LL;
    int v30 = v35 + snprintf(&__str[v35], 0x4000LL - v35, "%s \n", (const char *)v53);
    NSErrorUserInfoKey v37 = v48;
    uint64_t v38 = v50;
    do
    {
      if (v22[22 * v38 + 1 + v36])
      {
        uint64_t v39 = 0LL;
        int v40 = 0;
        strcpy((char *)v53, " Time        Slots: ");
        strcpy((char *)v52, " Number of packets: ");
        memset((char *)&v53[1] + 5, 0, 379);
        memset((char *)&v52[1] + 5, 0, 379);
        do
        {
          if (v37[v39])
          {
            ++v40;
            snprintf((char *)v53, 0x190uLL, "%s\t %d", (const char *)v53, v39);
            snprintf((char *)v52, 0x190uLL, "%s\t %d", (const char *)v52, v37[v39]);
          }

          ++v39;
        }

        while (v39 != 22);
        if (v40)
        {
          uint64_t v41 = snprintf( &__str[v30],  0x4000LL - v30,  " \n Packet distribution within the Guard Time %d [ time slot 1 milisecond] \n",  v36)
              + (uint64_t)v30;
          LODWORD(v41) = v41 + snprintf(&__str[v41], 0x4000 - v41, "%s \n", (const char *)v52);
          int v30 = v41 + snprintf(&__str[(int)v41], 0x4000LL - (int)v41, "%s \n", (const char *)v53);
        }

        __int128 v22 = v49;
        uint64_t v38 = v50;
      }

      ++v36;
      v37 += 20;
    }

    while (v36 != 22);
    uint64_t v29 = v38 + 1;
    __int128 v31 = v47 + 22;
    v48 += 400;
  }

  while (v29 != 5);
  return (const __CFString *) -[NSString initWithCString:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithCString:encoding:",  __str,  4LL);
}

void sub_10001D78C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, char a35)
{
}

uint64_t sub_10001D7D8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10001D7E8(uint64_t a1)
{
}

void sub_10001D7F0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = sub_10008C90C();
  int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315906;
    uint64_t v17 = "-[W5PeerDiagnosticsListener _runDiagnostics:uuid:configuration:]_block_invoke";
    __int16 v18 = 2080;
    int v19 = "W5PeerDiagnosticsListener.m";
    __int16 v20 = 1024;
    int v21 = 98;
    __int16 v22 = 2114;
    id v23 = v6;
    int v15 = 38;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[wifivelocity] %s (%s:%u) [DEBUG] Hit reply block %{public}@",  &v16,  v15);
  }

  [*(id *)(a1 + 32) lock];
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    id v9 = [v5 copy];
    uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8LL);
    int v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    id v12 = [v6 copy];
    uint64_t v13 = *(void *)(*(void *)(a1 + 72) + 8LL);
    int v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }

  [*(id *)(a1 + 32) unlock];
}

void sub_10001E4C4(uint64_t a1)
{
  unint64_t v2 = objc_autoreleasePoolPush();
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001E534;
  v4[3] = &unk_1000D1B58;
  id v3 = *(void **)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  objc_msgSend(v3, "__cancelActiveRequestAndReply:", v4);
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_10001E534(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10001E598(uint64_t a1)
{
  unint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 32), "__cancelActiveRequestAndReply:", 0);
  objc_autoreleasePoolPop(v2);
}

void sub_10001E738(uint64_t a1)
{
  unint64_t v2 = objc_autoreleasePoolPush();
  id v3 = objc_msgSend(*(id *)(a1 + 32), "__pendingRequestWithUUID:", *(void *)(a1 + 40));
  if (v3)
  {
    int v4 = v3;
    if ([v3 reply])
    {
      id v5 = (void (**)(id, NSError *))[v4 reply];
      NSErrorUserInfoKey v10 = NSLocalizedFailureReasonErrorKey;
      int v11 = @"W5CancelledErr";
      v5[2]( v5,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  6LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL)));
    }

    uint64_t v6 = *(void *)(a1 + 48);
    if (v6) {
      (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0LL);
    }
    [*(id *)(*(void *)(a1 + 32) + 16) removeObject:v4];
  }

  else if (objc_msgSend( objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "uuid"),  "isEqual:",  *(void *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 32), "__cancelActiveRequestAndReply:", *(void *)(a1 + 48));
  }

  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7)
    {
      NSErrorUserInfoKey v8 = NSLocalizedFailureReasonErrorKey;
      id v9 = @"W5ParamErr";
      (*(void (**)(uint64_t, NSError *))(v7 + 16))( v7,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  1LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL)));
    }
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10001E94C(uint64_t a1)
{
  unint64_t v2 = objc_autoreleasePoolPush();
  if (!qword_1000F7500)
  {
    __int128 v9 = off_1000D1C68;
    uint64_t v10 = 0LL;
    qword_1000F7500 = _sl_dlopen(&v9, 0LL);
  }

  if (qword_1000F7500)
  {
    *(void *)&__int128 v9 = 0LL;
    *((void *)&v9 + 1) = &v9;
    uint64_t v10 = 0x2020000000LL;
    id v3 = off_1000F7508;
    int v11 = off_1000F7508;
    if (!off_1000F7508)
    {
      int v4 = sub_10002408C();
      id v3 = dlsym(v4, "CoreCaptureControlCreate");
      *(void *)(*((void *)&v9 + 1) + 24LL) = v3;
      off_1000F7508 = v3;
    }

    _Block_object_dispose(&v9, 8);
    if (!v3)
    {
      -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "CoreCaptureControlRef soft_CoreCaptureControlCreate(CFAllocatorRef)"),  @"W5WiFiPerfLoggingManager.m",  19LL,  @"%s",  dlerror());
      goto LABEL_15;
    }

    id v5 = (const void *)((uint64_t (*)(const CFAllocatorRef))v3)(kCFAllocatorDefault);
    if (v5)
    {
      id v6 = [*(id *)(a1 + 32) UTF8String];
      *(void *)&__int128 v9 = 0LL;
      *((void *)&v9 + 1) = &v9;
      uint64_t v10 = 0x2020000000LL;
      uint64_t v7 = off_1000F7510;
      int v11 = off_1000F7510;
      if (!off_1000F7510)
      {
        NSErrorUserInfoKey v8 = sub_10002408C();
        uint64_t v7 = dlsym(v8, "CoreCaptureControlCaptureWithComponentDirectory");
        *(void *)(*((void *)&v9 + 1) + 24LL) = v7;
        off_1000F7510 = v7;
      }

      _Block_object_dispose(&v9, 8);
      if (v7)
      {
        ((void (*)(const void *, const char *, id))v7)(v5, "WiFi", v6);
        CFRelease(v5);
        goto LABEL_12;
      }

      -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Boolean soft_CoreCaptureControlCaptureWithComponentDirectory(CoreCaptureControlRef, const char *, const char *)"),  @"W5WiFiPerfLoggingManager.m",  23LL,  @"%s",  dlerror());
LABEL_15:
      __break(1u);
    }
  }

void sub_10001EB88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

id sub_10001EC68(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "__dumpCoreCaptureLogsWithReason:",  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"wifiperf[%@]",  objc_msgSend( objc_msgSend(objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "uuid"), "UUIDString"),  "substringToIndex:",  5)));
}

void sub_10001F6CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(dispatch_queue_s **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001F724;
  v4[3] = &unk_1000D1BA8;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_10001F724(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40LL));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48LL));
  objc_autoreleasePoolPop(v2);
}

void sub_10001F770(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40LL;
  if (a3) {
    uint64_t v3 = 48LL;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_10001F78C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(dispatch_queue_s **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001F7E4;
  v4[3] = &unk_1000D1BA8;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_10001F7E4(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40LL));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48LL));
  objc_autoreleasePoolPop(v2);
}

void sub_10001F830(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40LL;
  if (a3) {
    uint64_t v3 = 48LL;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_10001F84C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(dispatch_queue_s **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001F8A4;
  v4[3] = &unk_1000D1BA8;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_10001F8A4(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40LL));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48LL));
  objc_autoreleasePoolPop(v2);
}

void sub_10001F8F0(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40LL;
  if (a3) {
    uint64_t v3 = 48LL;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_10001F90C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(dispatch_queue_s **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001F964;
  v4[3] = &unk_1000D1BA8;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_10001F964(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40LL));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48LL));
  objc_autoreleasePoolPop(v2);
}

void sub_10001F9B0(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40LL;
  if (a3) {
    uint64_t v3 = 48LL;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_10001F9CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(dispatch_queue_s **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001FA24;
  v4[3] = &unk_1000D1BA8;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_10001FA24(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40LL));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48LL));
  objc_autoreleasePoolPop(v2);
}

void sub_10001FA70(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40LL;
  if (a3) {
    uint64_t v3 = 48LL;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_10001FA8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(dispatch_queue_s **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001FAE4;
  v4[3] = &unk_1000D1BA8;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_10001FAE4(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40LL));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48LL));
  objc_autoreleasePoolPop(v2);
}

void sub_10001FB30(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40LL;
  if (a3) {
    uint64_t v3 = 48LL;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_10001FB4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(dispatch_queue_s **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001FBA4;
  v4[3] = &unk_1000D1BA8;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_10001FBA4(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40LL));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48LL));
  objc_autoreleasePoolPop(v2);
}

void sub_10001FBF0(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40LL;
  if (a3) {
    uint64_t v3 = 48LL;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_10001FC0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(dispatch_queue_s **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001FC64;
  v4[3] = &unk_1000D1BA8;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_10001FC64(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40LL));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48LL));
  objc_autoreleasePoolPop(v2);
}

void sub_10001FCB0(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40LL;
  if (a3) {
    uint64_t v3 = 48LL;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_10001FCCC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(dispatch_queue_s **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001FD24;
  v4[3] = &unk_1000D1BA8;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_10001FD24(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40LL));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48LL));
  objc_autoreleasePoolPop(v2);
}

void sub_10001FD70(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40LL;
  if (a3) {
    uint64_t v3 = 48LL;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_1000204A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(dispatch_queue_s **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000204FC;
  v4[3] = &unk_1000D1BA8;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_1000204FC(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40LL));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48LL));
  objc_autoreleasePoolPop(v2);
}

void sub_100020548(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40LL;
  if (a3) {
    uint64_t v3 = 48LL;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_100020564(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(dispatch_queue_s **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000205BC;
  v4[3] = &unk_1000D1BA8;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_1000205BC(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40LL));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48LL));
  objc_autoreleasePoolPop(v2);
}

void sub_100020608(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40LL;
  if (a3) {
    uint64_t v3 = 48LL;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_100020624(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(dispatch_queue_s **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002067C;
  v4[3] = &unk_1000D1BA8;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_10002067C(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40LL));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48LL));
  objc_autoreleasePoolPop(v2);
}

void sub_1000206C8(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40LL;
  if (a3) {
    uint64_t v3 = 48LL;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_1000206E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(dispatch_queue_s **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002073C;
  v4[3] = &unk_1000D1BA8;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_10002073C(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40LL));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48LL));
  objc_autoreleasePoolPop(v2);
}

void sub_100020788(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40LL;
  if (a3) {
    uint64_t v3 = 48LL;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_1000207A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(dispatch_queue_s **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000207FC;
  v4[3] = &unk_1000D1BA8;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_1000207FC(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40LL));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48LL));
  objc_autoreleasePoolPop(v2);
}

void sub_100020848(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40LL;
  if (a3) {
    uint64_t v3 = 48LL;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_100020864(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(dispatch_queue_s **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000208BC;
  v4[3] = &unk_1000D1BA8;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_1000208BC(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40LL));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48LL));
  objc_autoreleasePoolPop(v2);
}

void sub_100020908(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40LL;
  if (a3) {
    uint64_t v3 = 48LL;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_100020924(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(dispatch_queue_s **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002097C;
  v4[3] = &unk_1000D1BA8;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_10002097C(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40LL));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48LL));
  objc_autoreleasePoolPop(v2);
}

void sub_1000209C8(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40LL;
  if (a3) {
    uint64_t v3 = 48LL;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_100020B5C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 64);
  v6[0] = objc_msgSend(objc_msgSend(*(id *)(v2 + 8), "awdl"), "interfaceName");
  v6[1] = @"-dbg=print_sr";
  objc_msgSend( (id)v2,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v3,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 2));
  int v4 = *(dispatch_source_s **)(*(void *)(a1 + 32) + 56LL);
  if (v4)
  {
    dispatch_time_t v5 = dispatch_time(0LL, 5000000000LL);
    dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  }

void sub_100020C80(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 64LL) = 0LL;
}

void sub_1000211F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(dispatch_queue_s **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100021250;
  v4[3] = &unk_1000D1BA8;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100021250(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40LL));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48LL));
  objc_autoreleasePoolPop(v2);
}

void sub_10002129C(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40LL;
  if (a3) {
    uint64_t v3 = 48LL;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_1000212B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(dispatch_queue_s **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100021310;
  v4[3] = &unk_1000D1BA8;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100021310(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40LL));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48LL));
  objc_autoreleasePoolPop(v2);
}

void sub_10002135C(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40LL;
  if (a3) {
    uint64_t v3 = 48LL;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_100021378(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(dispatch_queue_s **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000213D0;
  v4[3] = &unk_1000D1BA8;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_1000213D0(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40LL));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48LL));
  objc_autoreleasePoolPop(v2);
}

void sub_10002141C(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40LL;
  if (a3) {
    uint64_t v3 = 48LL;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_100021438(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(dispatch_queue_s **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100021490;
  v4[3] = &unk_1000D1BA8;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100021490(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40LL));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48LL));
  objc_autoreleasePoolPop(v2);
}

void sub_1000214DC(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40LL;
  if (a3) {
    uint64_t v3 = 48LL;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_1000214F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(dispatch_queue_s **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100021550;
  v4[3] = &unk_1000D1BA8;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100021550(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40LL));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48LL));
  objc_autoreleasePoolPop(v2);
}

void sub_10002159C(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40LL;
  if (a3) {
    uint64_t v3 = 48LL;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_100021730(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 80);
  v6[0] = objc_msgSend(objc_msgSend(*(id *)(v2 + 8), "nan"), "interfaceName");
  v6[1] = @"-dbg=print_nan_avail";
  objc_msgSend( (id)v2,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v3,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 2));
  int v4 = *(dispatch_source_s **)(*(void *)(a1 + 32) + 72LL);
  if (v4)
  {
    dispatch_time_t v5 = dispatch_time(0LL, 5000000000LL);
    dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  }

void sub_10002183C(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 80LL) = 0LL;
}

void sub_100021A78(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(dispatch_queue_s **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100021AD0;
  v4[3] = &unk_1000D1BA8;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100021AD0(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48LL));
  objc_autoreleasePoolPop(v2);
}

void sub_100021B10(uint64_t a1, uint64_t a2, int a3)
{
  if (a3) {
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48LL));
  }
}

id sub_100021D3C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__setupWatchdogTask");
}

uint64_t sub_100023F84(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 24) reply])
  {
    uint64_t v2 = (void (**)(id, NSError *))[*(id *)(*(void *)(a1 + 32) + 24) reply];
    NSErrorUserInfoKey v4 = NSLocalizedFailureReasonErrorKey;
    dispatch_time_t v5 = @"W5CancelledErr";
    v2[2]( v2,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  6LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL)));
  }

  *(void *)(*(void *)(a1 + 32) + 24LL) = 0LL;
  objc_msgSend(*(id *)(a1 + 32), "__nextRequest");
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0LL);
  }
  return result;
}

NSAssertionHandler *sub_10002408C()
{
  NSErrorUserInfoKey v4 = 0LL;
  if (!qword_1000F7500)
  {
    __int128 v5 = off_1000D1C68;
    uint64_t v6 = 0LL;
    qword_1000F7500 = _sl_dlopen(&v5, &v4);
  }

  v0 = (NSAssertionHandler *)qword_1000F7500;
  if (!qword_1000F7500)
  {
    v0 = +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler");
    uint64_t v3 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *CoreCaptureControlLibrary(void)");
    id v1 = -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( v0,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"W5WiFiPerfLoggingManager.m",  15LL,  @"%s",  v4);
    __break(1u);
    goto LABEL_7;
  }

  id v1 = v4;
  if (v4) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void sub_100024744(id a1)
{
  id v1 = -[W5BufferPool initBuffersWithSize:bufferCount:]( objc_alloc(&OBJC_CLASS___W5BufferPool),  "initBuffersWithSize:bufferCount:",  compression_encode_scratch_buffer_size(COMPRESSION_LZFSE),  2LL);
  uint64_t v2 = (void *)qword_1000F7518;
  qword_1000F7518 = (uint64_t)v1;
}

void sub_100024EA0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

void sub_100025558( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

void sub_10002559C(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"timer"]);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    NSErrorUserInfoKey v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"timer"]);
    __int128 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    unsigned __int8 v6 = [v4 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"timer"]);
    }
  }

  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:@"timer"];
}

void sub_10002568C(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"timer"]);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    NSErrorUserInfoKey v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"timer"]);
    __int128 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    unsigned __int8 v6 = [v4 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"timer"]);
    }
  }

  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:@"timer"];
}

void sub_100025B94( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_100025BC8(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100025C58;
  v3[3] = &unk_1000D1650;
  v3[4] = *(void *)(a1 + 40);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  0LL,  v3,  10.0));
  [*(id *)(a1 + 32) setObject:v2 forKeyedSubscript:@"timer"];
}

id sub_100025C58(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) freeIdleBufferOfTimer:a2];
}

void sub_100025DFC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_100025F68(_Unwind_Exception *a1)
{
}

LABEL_72:
    return 0LL;
  }

  if (!-[W5PeerManager registerPeerListeners:]( v2->_peerManager,  "registerPeerListeners:",  -[W5Engine _peerListeners](v2, "_peerListeners"))
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    int v27 = "Failed to register peer listeners";
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] %s",  buf,  0xCu);
  }

  -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
  if (v2->_bgTaskManager) {
    -[W5Engine _scheduleRepeatingCleanupTasks](v2, "_scheduleRepeatingCleanupTasks");
  }
  return v2;
}

void sub_100026B90(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "__setupCallbacks");
  [*(id *)(*(void *)(a1 + 32) + 128) resume];
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_100026DE0(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_100026DE8(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_100026DF0(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_100026DF8(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_100026F64(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 176LL) = objc_alloc_init(&OBJC_CLASS___W5Peer);
  [*(id *)(*(void *)(a1 + 32) + 176) setPeerID:0];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 176), "setModel:", objc_msgSend(*(id *)(a1 + 32), "__model"));
  uint64_t v2 =  -[NSDictionary initWithContentsOfURL:error:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithContentsOfURL:error:",  +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/System/Library/CoreServices/SystemVersion.plist"),  0LL);
  objc_msgSend( *(id *)(*(void *)(a1 + 32) + 176),  "setBuild:",  -[NSDictionary objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", @"ProductBuildVersion"));
  objc_msgSend( *(id *)(*(void *)(a1 + 32) + 176),  "setVersion:",  -[NSDictionary objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", @"ProductVersion"));
  objc_msgSend( *(id *)(*(void *)(a1 + 32) + 176),  "setOs:",  -[NSDictionary objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", @"ProductName"));
  [*(id *)(*(void *)(a1 + 32) + 176) setName:sub_10008C2E4()];
  id result = [*(id *)(*(void *)(a1 + 32) + 176) peerID];
  if (!result)
  {
    id result = *(id *)(*(void *)(a1 + 32) + 80LL);
    if (result)
    {
      id result = [result localIDSIdentifier];
      if (result) {
        return objc_msgSend( *(id *)(*(void *)(a1 + 32) + 176),  "setPeerID:",  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "localIDSIdentifier"));
      }
    }
  }

  return result;
}

LABEL_22:
  *p_isMonitoring = (char)isMonitoringTransaction;
LABEL_23:
  p_isMonitoringWiFiConnection = &self->_isMonitoringWiFiConnection;
  if (self->_isMonitoringWiFiConnection != (v6 & 1))
  {
    if ((v6 & 1) != 0)
    {
LABEL_25:
      -[W5WiFiConnectionMonitor startMonitoring](self->_monitor, "startMonitoring");
      int v15 = (OS_os_transaction *)os_transaction_create("com.apple.wifivelocity.monitoring_connection");
      objc_msgSend( +[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"),  "osTransactionCreate:transaction:",  "com.apple.wifivelocity.monitoring_connection",  v15);
      self->_isMonitoringConnectionTransaction = v15;
      LOBYTE(isMonitoringConnectionTransaction) = 1;
LABEL_29:
      *p_isMonitoringWiFiConnection = (char)isMonitoringConnectionTransaction;
      return;
    }

  int v15 = 0.1;
  if (!v10) {
    goto LABEL_23;
  }
LABEL_5:
  [v10 doubleValue];
  uint64_t v17 = v16;
  if (v11) {
LABEL_6:
  }
    int v11 = [v11 unsignedIntegerValue];
LABEL_7:
  __int16 v18 = [a3 objectForKeyedSubscript:@"PingTrafficClass"];
  int v19 = [a3 objectForKeyedSubscript:@"AddressesToPing"];
  int v33 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  if (-[CWFInterface SSID](-[W5StatusManager corewifi](self->_status, "corewifi"), "SSID")
    && (uint64_t v36 = 0u,
        NSErrorUserInfoKey v37 = 0u,
        uint64_t v34 = 0u,
        int v35 = 0u,
        (__int16 v20 = [v19 countByEnumeratingWithState:&v34 objects:v40 count:16]) != 0))
  {
    int v21 = v20;
    __int128 v31 = v5;
    __int16 v22 = *(void *)v35;
    id v23 = 1;
    int v24 = 1;
    do
    {
      for (uint64_t i = 0LL; i != v21; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v35 != v22) {
          objc_enumerationMutation(v19);
        }
        int v26 = -[W5DiagnosticsManager __performPingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:]( self,  "__performPingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:",  *(void *)(*((void *)&v34 + 1) + 8LL * (void)i),  v32,  v18,  -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"),  v11,  v13,  v17,  v15);
        [v26 packetLoss];
        if (v27 >= 100.0)
        {
          id v23 = 0;
          int v24 = 0;
        }

        -[NSMutableArray addObject:](v33, "addObject:", v26);
      }

      int v21 = [v19 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }

    while (v21);
    int v28 = v23 & 1;
    uint64_t v29 = v24 & 1;
    __int128 v5 = v31;
    unsigned __int8 v6 = &Apple80211BindToInterface_ptr;
  }

  else
  {
    int v28 = 1LL;
    uint64_t v29 = 1LL;
  }

  -[W5DiagnosticsTestResult setDidPass:](v5, "setDidPass:", v29);
  -[W5DiagnosticsTestResult setResult:](v5, "setResult:", v28);
  uint64_t v38 = @"PingsReceived";
  uint64_t v39 = v33;
  -[W5DiagnosticsTestResult setInfo:]( v5,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v39,  &v38,  1LL));
  [v6[116] timeIntervalSinceReferenceDate];
  -[W5DiagnosticsTestResult setTestCompleted:](v5, "setTestCompleted:");
  return v5;
}

      [*(id *)(*(void *)(a1 + 40) + 48) addObject:*(void *)(a1 + 32)];
      objc_msgSend(*(id *)(a1 + 40), "__nextRequest");
      goto LABEL_23;
    }

    if (!objc_msgSend( (id)v11,  "__logItems:containsID:",  objc_msgSend( (id)v11,  "__expandLogItems:configuration:",  objc_msgSend(*(id *)(v11 + 56), "itemRequests"),  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 56), "configuration")),  14)) {
      goto LABEL_22;
    }
    int v25 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v43) = 0;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v25,  0LL,  "[wifivelocity] Active request contains sysdiagnose, replying immediately with EDEADLK",  &v43,  2);
    }

    if (![*(id *)(a1 + 32) reply]) {
      goto LABEL_23;
    }
    int v21 = [*(id *)(a1 + 32) reply];
    __int16 v22 = NSPOSIXErrorDomain;
    int v35 = NSLocalizedFailureReasonErrorKey;
    uint64_t v36 = @"EDEADLK";
    id v23 = &v36;
    int v24 = &v35;
LABEL_34:
    (*((void (**)(id, NSError *, void, void))v21 + 2))( v21,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v22,  11LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v24,  1LL)),  0LL,  0LL);
    goto LABEL_23;
  }

  uint64_t v3 = objc_msgSend( objc_msgSend( objc_msgSend(*(id *)(a1 + 32), "configuration"),  "objectForKeyedSubscript:",  @"AllowCachedSysdiagnose"),  "BOOLValue");
  NSErrorUserInfoKey v4 = *(void *)(a1 + 40);
  if (!v3)
  {
    if (!objc_msgSend( (id)v4,  "__logItems:containsID:",  objc_msgSend( (id)v4,  "__expandLogItems:configuration:",  objc_msgSend(*(id *)(v4 + 56), "itemRequests"),  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 56), "configuration")),  14)) {
      goto LABEL_22;
    }
    __int16 v20 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v43) = 0;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v20,  0LL,  "[wifivelocity] Active request contains sysdiagnose, replying immediately with EDEADLK",  &v43,  2);
    }

    if (![*(id *)(a1 + 32) reply]) {
      goto LABEL_23;
    }
    int v21 = [*(id *)(a1 + 32) reply];
    __int16 v22 = NSPOSIXErrorDomain;
    uint64_t v39 = NSLocalizedFailureReasonErrorKey;
    int v40 = @"EDEADLK";
    id v23 = &v40;
    int v24 = &v39;
    goto LABEL_34;
  }

  if (*(void *)(v4 + 176))
  {
    __int128 v5 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v6 = *(void *)(a1 + 32);
      uint64_t v43 = 138543362;
      __int128 v44 = v6;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v5,  0LL,  "[wifivelocity] Replying with cached content for sysdiagnose request (%{public}@)",  &v43,  12);
    }

    id v8 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(a1 + 40);
    __int128 v9 = v7[22];
LABEL_15:
    objc_msgSend(v7, "__replyWithCachedSysdiagnoseContentForRequest:temporaryURL:", v8, v9);
    goto LABEL_23;
  }

  if (objc_msgSend( objc_msgSend( objc_msgSend(*(id *)(v4 + 56), "configuration"),  "objectForKeyedSubscript:",  @"CachedSysdiagnose"),  "BOOLValue"))
  {
    int v26 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v43) = 0;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v26,  0LL,  "[wifivelocity] Cached content being generated, enqueueing sysdiagnose request",  &v43,  2);
    }

  [v11 appendString:@"\n"];
  objc_msgSend(v5, "appendString:", objc_msgSend(v11, "copy"));
  *(void *)&__int16 v52 = 0LL;
  uint64_t v50 = 0u;
  int v51 = 0u;
  v49 = 0u;
  objc_msgSend(-[CWFInterface AWDLElectionParameters](v6, "AWDLElectionParameters"), "getBytes:length:", &v49, 56);
  int v16 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  [v16 appendFormat:@"awdl election params:\n"];
  objc_msgSend(v16, "appendFormat:", @"  electionID            %u\n", WORD1(v50));
  objc_msgSend(v16, "appendFormat:", @"  self metric           0x%x\n", v51);
  objc_msgSend(v16, "appendFormat:", @"  flags                 0x%x\n", v50);
  objc_msgSend(v16, "appendFormat:", @"  top master metric     0x%x\n", HIDWORD(v50));
  objc_msgSend(v16, "appendFormat:", @"  distance from top     %u\n", BYTE4(v50));
  objc_msgSend( v16,  "appendFormat:",  @"  top master            %02X:%02X:%02X:%02X:%02X:%02X\n",  BYTE6(v50),  BYTE7(v50),  BYTE8(v50),  BYTE9(v50),  BYTE10(v50),  BYTE11(v50));
  objc_msgSend(v5, "appendString:", objc_msgSend(v16, "copy"));
  DWORD2(v49) = 0;
  *(void *)&v49 = 0LL;
  objc_msgSend(-[CWFInterface AWDLElectionMetric](v6, "AWDLElectionMetric"), "getBytes:length:", &v49, 12);
  [v5 appendString:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"awdl election metric = %u\n", DWORD1(v49))];
  uint64_t v17 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  v49 = 0uLL;
  LODWORD(v50) = 0;
  objc_msgSend( -[CWFInterface AWDLElectionRSSIThresholds](v6, "AWDLElectionRSSIThresholds"),  "getBytes:length:",  &v49,  20);
  [v17 appendString:@"awdl election rssi thresholds:\n"];
  objc_msgSend(v17, "appendFormat:", @"  close     %d\n", DWORD2(v49));
  objc_msgSend(v17, "appendFormat:", @"  mid       %d\n", DWORD1(v49));
  objc_msgSend(v17, "appendFormat:", @"  edge      %d\n", v50);
  objc_msgSend(v17, "appendFormat:", @"  closeSync %d\n", HIDWORD(v49));
  objc_msgSend(v5, "appendString:", objc_msgSend(v17, "copy"));
  *(void *)&v49 = 0LL;
  objc_msgSend(-[CWFInterface AWDLSocialTimeSlots](v6, "AWDLSocialTimeSlots"), "getBytes:length:", &v49, 8);
  __int16 v18 = "enabled";
  if (!BYTE4(v49)) {
    __int16 v18 = "disabled";
  }
  [v5 appendString:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"awdl social time slots: %s\n", v18)];
  *(void *)&v49 = 0LL;
  objc_msgSend(-[CWFInterface AWDLEncryptionType](v6, "AWDLEncryptionType"), "getBytes:length:", &v49, 8);
  if (DWORD1(v49)) {
    int v19 = "ENABLED";
  }
  else {
    int v19 = "DISABLED";
  }
  [v5 appendString:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"awdl encryption is %s\n", v19)];
  v49 = 0uLL;
  *(void *)&uint64_t v50 = 0LL;
  objc_msgSend(-[CWFInterface AWDLStrategy](v6, "AWDLStrategy"), "getBytes:length:", &v49, 24);
  [v5 appendString:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"awdl strategy: %u sched %@ [%llu.%03llu]\n", DWORD1(v49), W5DescriptionForAWDLScheduleState(DWORD2(v49)), (unint64_t)v50 / 0x3B9ACA00, (unint64_t)v50 % 0x3B9ACA00 / 0xF4240)];
  *(void *)&v49 = 0LL;
  objc_msgSend(-[CWFInterface AWDLPresenceMode](v6, "AWDLPresenceMode"), "getBytes:length:", &v49, 8);
  [v5 appendString:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"awdl presence mode = %u\n", DWORD1(v49))];
  *(void *)&v49 = 0LL;
  objc_msgSend(-[CWFInterface AWDLGuardTime](v6, "AWDLGuardTime"), "getBytes:length:", &v49, 8);
  [v5 appendString:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"awdl guard time = %u\n", DWORD1(v49))];
  v49 = 0uLL;
  objc_msgSend( -[CWFInterface AWDLAvailabilityWindowAPAlignment](v6, "AWDLAvailabilityWindowAPAlignment"),  "getBytes:length:",  &v49,  16);
  if (DWORD1(v49)) {
    __int16 v20 = "ENABLED";
  }
  else {
    __int16 v20 = "DISABLED";
  }
  [v5 appendString:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"awdl availability window ap beacon alignment: %s offset %d (ms)\n", v20, DWORD2(v49))];
  *(void *)&v49 = 0LL;
  objc_msgSend( -[CWFInterface AWDLContinuousElectionAlgorithmEnabled](v6, "AWDLContinuousElectionAlgorithmEnabled"),  "getBytes:length:",  &v49,  8);
  if (DWORD1(v49)) {
    int v21 = "ENABLED";
  }
  else {
    int v21 = "DISABLED";
  }
  [v5 appendString:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"awdl aw continous election %s\n", v21)];
  __int16 v22 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  v49 = 0uLL;
  *(void *)&uint64_t v50 = 0LL;
  objc_msgSend(-[CWFInterface AWDLSyncState](v6, "AWDLSyncState"), "getBytes:length:", &v49, 24);
  switch(DWORD1(v49))
  {
    case 1:
      objc_msgSend( v22,  "appendFormat:",  @"awdl state: master [%02X:%02X:%02X:%02X:%02X:%02X]\n",  BYTE8(v49),  BYTE9(v49),  BYTE10(v49),  BYTE11(v49),  BYTE12(v49),  BYTE13(v49));
      break;
    case 2:
      objc_msgSend( v22,  "appendFormat:",  @"awdl state: slave [%02X:%02X:%02X:%02X:%02X:%02X]\n",  BYTE8(v49),  BYTE9(v49),  BYTE10(v49),  BYTE11(v49),  BYTE12(v49),  BYTE13(v49));
      break;
    case 3:
      objc_msgSend( v22,  "appendFormat:",  @"awdl state: non-election master [%02X:%02X:%02X:%02X:%02X:%02X]\n",  BYTE8(v49),  BYTE9(v49),  BYTE10(v49),  BYTE11(v49),  BYTE12(v49),  BYTE13(v49));
      break;
    default:
      [v22 appendString:@"awdl state: stop\n"];
      break;
  }

  objc_msgSend(v5, "appendString:", objc_msgSend(v22, "copy"));
  *(void *)&v49 = 0LL;
  objc_msgSend(-[CWFInterface AWDLAFTxMode](v6, "AWDLAFTxMode"), "getBytes:length:", &v49, 8);
  [v5 appendString:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"awdl af tx mode = %u\n", DWORD1(v49))];
  v49 = 0uLL;
  LODWORD(v50) = 0;
  objc_msgSend( -[CWFInterface AWDLExtensionStateMachineParameters](v6, "AWDLExtensionStateMachineParameters"),  "getBytes:length:",  &v49,  20);
  [v5 appendString:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"awdl ext params: min=%u, maxUni=%u, maxMulti=%u, maxAction=%u\n", v50, DWORD2(v49), DWORD1(v49), HIDWORD(v49))];
  v49 = 0uLL;
  *(void *)&uint64_t v50 = 0LL;
  objc_msgSend(-[CWFInterface AWDLSyncParameters](v6, "AWDLSyncParameters"), "getBytes:length:", &v49, 24);
  [v5 appendString:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"awdl sync params: aw_period=%d, aw_length=%d, extension_length=%d, sync_frame_period=%d, as non election master %d\n", DWORD2(v49), DWORD1(v49), HIDWORD(v49), v50, DWORD1(v50))];
  id v23 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  __int16 v52 = 0u;
  uint64_t v53 = 0u;
  uint64_t v50 = 0u;
  int v51 = 0u;
  v49 = 0u;
  objc_msgSend(-[CWFInterface AWDLSidecarDiagnostics](v6, "AWDLSidecarDiagnostics"), "getBytes:length:", &v49, 80);
  objc_msgSend( v23,  "appendFormat:",  @"awdl sidecar diags: txLatencySumMS=%d, txFailCount=%d, txPacketCount=%d, txMaxPacketBurstSizeKB=%d, peerRssi24G=%d, peerRssi5G=%d\n",  DWORD1(v49),  DWORD2(v49),  HIDWORD(v49),  v50,  DWORD1(v50),  DWORD2(v50));
  for (uint64_t i = 0LL; i != 36; i += 12LL)
    objc_msgSend( v23,  "appendFormat:",  @"                    ch=%d, cca=%d\n",  *((unsigned __int8 *)&v52 + i + 4),  *(unsigned int *)((char *)&v52 + i));
  objc_msgSend(v5, "appendString:", objc_msgSend(v23, "copy"));
  [v5 appendString:@"\n\n"];
  int v25 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  __int16 v48 = 0;
  v47 = 0LL;
  objc_msgSend(-[CWFInterface AWDLSyncEnabled](v6, "AWDLSyncEnabled"), "getBytes:length:", &v47, 12);
  [v25 appendString:@"----------------------------------------------------------------------\n"];
  [v25 appendString:@"AWDL Statistics\n"];
  [v25 appendString:@"----------------------------------------------------------------------\n"];
  if (v48)
  {
    bzero(&v49, 0xE80uLL);
    objc_msgSend(-[CWFInterface AWDLStatistics](v6, "AWDLStatistics"), "getBytes:length:", &v49, 3712);
    objc_msgSend(v25, "appendFormat:", @"Rx Bytes              = %d\n", DWORD2(v49));
    objc_msgSend(v25, "appendFormat:", @"Tx Bytes              = %d\n", HIDWORD(v49));
    objc_msgSend(v25, "appendFormat:", @"Self Infra Channel    = %d\n", DWORD1(v50));
    objc_msgSend(v25, "appendFormat:", @"Peer Infra Channel    = %d\n", BYTE8(v50));
    objc_msgSend(v25, "appendFormat:", @"# of Peers Discovered = %d\n", BYTE9(v50));
    objc_msgSend(v25, "appendFormat:", @"# of Cached Peers     = %d\n", BYTE10(v50));
    objc_msgSend(v25, "appendFormat:", @"Flags                 = %x\n", DWORD1(v49));
    if ((BYTE4(v49) & 1) != 0) {
      int v26 = "XZ";
    }
    else {
      int v26 = "non-XZ";
    }
    objc_msgSend(v25, "appendFormat:", @"Country Code          = %s\n", v26);
    if ((BYTE4(v49) & 0x10) != 0) {
      int v27 = "Yes";
    }
    else {
      int v27 = "No";
    }
    objc_msgSend(v25, "appendFormat:", @"Is AppleTV            = %s\n", v27);
    if ((BYTE4(v49) & 8) != 0) {
      int v28 = "Yes";
    }
    else {
      int v28 = "No";
    }
    objc_msgSend(v25, "appendFormat:", @"Supports Solo         = %s\n", v28);
    if ((BYTE4(v49) & 0x20) != 0) {
      uint64_t v29 = "Yes";
    }
    else {
      uint64_t v29 = "No";
    }
    objc_msgSend(v25, "appendFormat:", @"Was Airplaying        = %s\n", v29);
    if ((BYTE4(v49) & 0x40) != 0) {
      int v30 = "Yes";
    }
    else {
      int v30 = "No";
    }
    objc_msgSend(v25, "appendFormat:", @"Was Infra-Airplaying  = %s\n", v30);
    [v25 appendString:@"\n"];
    [v25 appendFormat:@"Cached Peer's Infra on: \n"];
    objc_msgSend(v25, "appendFormat:", @"                 2.4G = %d\n", BYTE11(v50));
    objc_msgSend(v25, "appendFormat:", @"                   5G = %d\n", BYTE12(v50));
    objc_msgSend(v25, "appendFormat:", @"                  DFS = %d\n", BYTE13(v50));
    objc_msgSend(v25, "appendFormat:", @"       Not-Associated = %d\n", BYTE14(v50));
    objc_msgSend(v25, "appendFormat:", @"           Same Infra = %d\n", v51);
    objc_msgSend(v25, "appendFormat:", @"      Different Infra = %d\n", HIBYTE(v50));
    [v25 appendString:@"AWDL State History:\n"];
    [v25 appendString:@"                           State           Count      Duration(msecs)\n"];
    __int128 v31 = 0LL;
    uint64_t v32 = &v72;
    do
    {
      objc_msgSend( v25,  "appendFormat:",  @"%32s %15d %20llu\n",  objc_msgSend((id)W5DescriptionForAWDLScheduleState(v31++), "UTF8String"),  *((unsigned int *)v32 - 2),  *(void *)v32);
      ++v32;
    }

    while (v31 != 54);
    [v25 appendString:@"\n"];
    objc_msgSend(v25, "appendFormat:", @"No-Service Idle Time  = %llu\n", *((void *)&v51 + 1));
    objc_msgSend(v25, "appendFormat:", @"Services Browsed      = +%d -%d (+%d, -%d)\n", v78, v84, v77, v83);
    objc_msgSend(v25, "appendFormat:", @"Services Advertised   = +%d -%d (+%d, -%d)\n", v75, v81, v74, v80);
    [v25 appendString:@"\n"];
    [v25 appendString:@"\n"];
    [v25 appendString:@"Add Service History:\n"];
    [v25 appendString:@"      #            Browse                                     |         Advertise\n"];
    [v25 appendString:@"             Id              Key                              |   Id              Key\n"];
    int v33 = 0LL;
    uint64_t v34 = 1LL;
    do
    {
      objc_msgSend(v25, "appendFormat:", @"      %d -   %3d, ", v34, *(unsigned int *)&v79[v33 + 32]);
      [v25 appendString:sub_100074994((uint64_t)&v79[v33])];
      objc_msgSend(v25, "appendFormat:", @"                %3d, ", *(unsigned int *)&v76[v33 + 32]);
      [v25 appendString:sub_100074994((uint64_t)&v76[v33])];
      [v25 appendString:@"\n"];
      v33 += 48LL;
      uint64_t v34 = (v34 + 1);
    }

    while (v33 != 384);
    [v25 appendString:@"\n"];
    [v25 appendString:@"\n"];
    [v25 appendString:@"Delete Service History:\n"];
    [v25 appendString:@"      #                     Browse                            |               Advertise\n"];
    [v25 appendString:@"             Id         Age             Key                   |   Id         Age              Key\n"];
    int v35 = 0LL;
    uint64_t v36 = 1LL;
    do
    {
      objc_msgSend( v25,  "appendFormat:",  @"     %d -    %3d, %10llu, ",  v36,  *(unsigned int *)&v85[v35 + 32],  *(void *)&v85[v35 + 40]);
      [v25 appendString:sub_100074994((uint64_t)&v85[v35])];
      objc_msgSend( v25,  "appendFormat:",  @"    %3d, %10llu, ",  *(unsigned int *)&v82[v35 + 32],  *(void *)&v82[v35 + 40]);
      [v25 appendString:sub_100074994((uint64_t)&v82[v35])];
      [v25 appendString:@"\n"];
      v35 += 48LL;
      uint64_t v36 = (v36 + 1);
    }

    while (v35 != 384);
    NSErrorUserInfoKey v37 = @"\n";
  }

  else
  {
    NSErrorUserInfoKey v37 = @"AWDL is DISABLED\n";
  }

  [v25 appendString:v37];
  objc_msgSend(v5, "appendString:", objc_msgSend(v25, "copy"));
  return [v5 copy];
}

  if (a3 && v27) {
    *a3 = v27;
  }
  if (v11) {
    archive_write_free(v11);
  }
  return v16;
}

  if (!-[NSMutableDictionary count](v4, "count"))
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s: empty payload",  "-[W5PeerDatabaseRequestPayload encode]"));
    __int16 v48 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v47,  0LL));

    objc_exception_throw(v48);
  }

  objc_autoreleasePoolPop(v3);
  return v4;
}

void sub_10002759C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, a2, a4, a3);
  }
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"Reason"];
  id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"CleanupDelay"];
  if (v7) {
    BOOL v9 = v8 == 0LL;
  }
  else {
    BOOL v9 = 0;
  }
  if (!v9)
  {
    if (v8) {
      int64_t v10 = 1000000000 * (void)[v8 unsignedIntegerValue];
    }
    else {
      int64_t v10 = 120000000000LL;
    }
    v15[0] = 0LL;
    v15[1] = v15;
    void v15[2] = 0x3052000000LL;
    v15[3] = sub_1000276F0;
    v15[4] = sub_100027700;
    uint64_t v11 = os_transaction_create("com.apple.wifivelocity.cleanup");
    objc_msgSend( +[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"),  "osTransactionCreate:transaction:",  "com.apple.wifivelocity.cleanup",  v11);
    v15[5] = v11;
    dispatch_time_t v12 = dispatch_time(0LL, v10);
    uint64_t v13 = *(dispatch_queue_s **)(*(void *)(a1 + 40) + 8LL);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    void v14[2] = sub_10002770C;
    v14[3] = &unk_1000D1CA8;
    v14[4] = a3;
    v14[5] = v15;
    dispatch_after(v12, v13, v14);
    _Block_object_dispose(v15, 8);
  }

void sub_1000276F0(uint64_t a1, uint64_t a2)
{
}

void sub_100027700(uint64_t a1)
{
}

void sub_10002770C(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 32) path];
    v6[0] = 67109378;
    v6[1] = 120;
    __int16 v7 = 2114;
    id v8 = v4;
    int v5 = 18;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v3,  0LL,  "[wifivelocity] CLEANUP temporary WiFi log content (delay=%ds, path='%{public}@')",  v6,  v5);
  }

  -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  [*(id *)(a1 + 32) path],  0);
  objc_msgSend( +[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"),  "osTransactionComplete:",  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = 0LL;
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_100027910(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_1000279FC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100027C60(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100027D6C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100028354(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(a1 + 32) itemID];
  id v3 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v3 setRequest:*(void *)(a1 + 32)];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setStartedAt:");
  [v3 startedAt];
  objc_msgSend(v3, "setCompletedAt:");
  NSErrorUserInfoKey v6 = NSLocalizedFailureReasonErrorKey;
  __int16 v7 = @"W5NotSupportedErr";
  id v4 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  4LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, NSError *, void, id))(v5 + 16))(v5, v4, 0LL, v3);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_100028918(_Unwind_Exception *a1)
{
}

void sub_100028954(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(dispatch_queue_s **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000289B0;
  v4[3] = &unk_1000D18F8;
  v4[4] = a2;
  void v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_1000289B0(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  objc_msgSend( *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40),  "__updatedStatusWithEvent:",  *(void *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_1000289E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(dispatch_queue_s **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100028A44;
  v4[3] = &unk_1000D18F8;
  v4[4] = a2;
  void v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_100028A44(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  objc_msgSend( *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40),  "__updatedStatusWithEvent:",  *(void *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_100028A7C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(dispatch_queue_s **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100028AD8;
  v4[3] = &unk_1000D18F8;
  v4[4] = a2;
  void v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_100028AD8(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  objc_msgSend( *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40),  "__updatedStatusWithEvent:",  *(void *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_100028B10(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(dispatch_queue_s **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100028B6C;
  v4[3] = &unk_1000D18F8;
  v4[4] = a2;
  void v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_100028B6C(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  objc_msgSend( *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40),  "__updatedStatusWithEvent:",  *(void *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_100028BA4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(dispatch_queue_s **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100028C00;
  v4[3] = &unk_1000D18F8;
  v4[4] = a2;
  void v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_100028C00(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  objc_msgSend( *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40),  "__updatedStatusWithEvent:",  *(void *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_100028C38(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(dispatch_queue_s **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100028CA8;
  v3[3] = &unk_1000D2338;
  v3[4] = a2;
  __int128 v4 = *(_OWORD *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  dispatch_async(v2, v3);
}

void sub_100028CA8(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  if ([*(id *)(a1 + 32) eventID] == (id)18)
  {
    unsigned int v3 = objc_msgSend( objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "corewifi"),  "powerOn");
    char v4 = IOPMIsASleep(objc_msgSend( objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "pm"),  "caps"));
    uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
    if (!v3 || (v4 & 1) != 0) {
      [v5 pauseMonitoring];
    }
    else {
      [v5 resumeMonitoringAfterDelay:10.0];
    }
  }

  objc_msgSend( *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40),  "__updatedStatusWithEvent:",  *(void *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_100028D58(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  unsigned int v3 = *(dispatch_queue_s **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100028DB4;
  v4[3] = &unk_1000D18F8;
  v4[4] = a2;
  void v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_100028DB4(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  objc_msgSend( *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40),  "__updatedStatusWithEvent:",  *(void *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_100028DEC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(dispatch_queue_s **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100028E5C;
  v3[3] = &unk_1000D2338;
  __int128 v4 = *(_OWORD *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  v3[4] = a2;
  dispatch_async(v2, v3);
}

void sub_100028E5C(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  unsigned int v3 = objc_msgSend(objc_msgSend(*(id *)(*(void *)(a1[5] + 8) + 40), "corewifi"), "powerOn");
  char v4 = IOPMIsASleep(objc_msgSend(objc_msgSend(*(id *)(*(void *)(a1[5] + 8) + 40), "pm"), "caps"));
  uint64_t v5 = *(void **)(*(void *)(a1[6] + 8LL) + 40LL);
  if (!v3 || (v4 & 1) != 0) {
    [v5 pauseMonitoring];
  }
  else {
    [v5 resumeMonitoringAfterDelay:10.0];
  }
  objc_msgSend(*(id *)(*(void *)(a1[7] + 8) + 40), "__updatedStatusWithEvent:", a1[4]);
  objc_autoreleasePoolPop(v2);
}

void sub_100028EFC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  unsigned int v3 = *(dispatch_queue_s **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100028F58;
  v4[3] = &unk_1000D18F8;
  v4[4] = a2;
  void v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_100028F58(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  objc_msgSend( *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40),  "__updatedStatusWithEvent:",  *(void *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_100028F90(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  unsigned int v3 = *(dispatch_queue_s **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100028FEC;
  v4[3] = &unk_1000D18F8;
  v4[4] = a2;
  void v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_100028FEC(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  objc_msgSend( *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40),  "__updatedStatusWithEvent:",  *(void *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_100029024(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  unsigned int v3 = *(dispatch_queue_s **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100029080;
  v4[3] = &unk_1000D18F8;
  v4[4] = a2;
  void v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_100029080(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  objc_msgSend( *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40),  "__updatedStatusWithEvent:",  *(void *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_1000290B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  unsigned int v3 = *(dispatch_queue_s **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100029114;
  v4[3] = &unk_1000D18F8;
  v4[4] = a2;
  void v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_100029114(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  objc_msgSend( *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40),  "__updatedStatusWithEvent:",  *(void *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_10002914C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  unsigned int v3 = *(dispatch_queue_s **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000291A8;
  v4[3] = &unk_1000D18F8;
  v4[4] = a2;
  void v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_1000291A8(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  objc_msgSend( *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40),  "__updatedStatusWithEvent:",  *(void *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_1000291E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v5 = *(void *)(a1 + 40);
  NSErrorUserInfoKey v6 = *(dispatch_queue_s **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100029244;
  block[3] = &unk_1000D1DC0;
  void block[4] = a2;
  void block[5] = a3;
  *(double *)&block[8] = a5;
  void block[6] = a4;
  block[7] = v5;
  dispatch_async(v6, block);
}

void sub_100029244(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  unsigned int v3 = objc_alloc_init(&OBJC_CLASS___W5Event);
  -[W5Event setEventID:](v3, "setEventID:", 36LL);
  id v4 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  [v4 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"UUID"];
  [v4 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"CompletedDiagnosticsTest"];
  [v4 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"NextDiagnosticsTest"];
  objc_msgSend( v4,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(a1 + 64)),  @"PercentComplete");
  -[W5Event setInfo:](v3, "setInfo:", v4);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5Event setTimestamp:](v3, "setTimestamp:");
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "__completedDiagnosticsTest:", v3);
  objc_autoreleasePoolPop(v2);
}

void sub_100029330(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(dispatch_queue_s **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100029398;
  block[3] = &unk_1000D1E10;
  void block[4] = a2;
  __int128 v4 = *(_OWORD *)(a1 + 40);
  dispatch_async(v2, block);
}

void sub_100029398(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1[5] + 8) + 40) addEvent:a1[4]];
  objc_msgSend(*(id *)(*(void *)(a1[6] + 8) + 40), "__updatedStatusWithEvent:", a1[4]);
  objc_autoreleasePoolPop(v2);
}

void sub_1000293E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v5 = *(void *)(a1 + 40);
  NSErrorUserInfoKey v6 = *(dispatch_queue_s **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100029448;
  block[3] = &unk_1000D1DC0;
  void block[4] = a2;
  void block[5] = a3;
  *(double *)&block[8] = a5;
  void block[6] = a4;
  block[7] = v5;
  dispatch_async(v6, block);
}

void sub_100029448(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  unsigned int v3 = objc_alloc_init(&OBJC_CLASS___W5Event);
  -[W5Event setEventID:](v3, "setEventID:", 37LL);
  id v4 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  [v4 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"UUID"];
  [v4 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"CollectedLogItem"];
  [v4 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"NextLogItem"];
  objc_msgSend( v4,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(a1 + 64)),  @"PercentComplete");
  -[W5Event setInfo:](v3, "setInfo:", v4);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5Event setTimestamp:](v3, "setTimestamp:");
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "__collectedLogItem:", v3);
  objc_autoreleasePoolPop(v2);
}

void sub_100029534(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(dispatch_queue_s **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100029594;
  block[3] = &unk_1000D1E88;
  void block[5] = a3;
  void block[6] = v3;
  void block[4] = a2;
  dispatch_async(v4, block);
}

void sub_100029594(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(void *)(a1[6] + 8) + 40), "__collectLogItem:reply:", a1[4], a1[5]);
  objc_autoreleasePoolPop(v2);
}

void sub_1000295D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(dispatch_queue_s **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100029638;
  block[3] = &unk_1000D1E10;
  void block[4] = a2;
  __int128 v4 = *(_OWORD *)(a1 + 40);
  dispatch_async(v2, block);
}

void sub_100029638(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1[5] + 8) + 40) addEvent:a1[4]];
  objc_msgSend(*(id *)(*(void *)(a1[6] + 8) + 40), "__updatedStatusWithEvent:", a1[4]);
  objc_autoreleasePoolPop(v2);
}

void sub_100029684(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(dispatch_queue_s **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000296EC;
  block[3] = &unk_1000D1E10;
  void block[4] = a2;
  __int128 v4 = *(_OWORD *)(a1 + 40);
  dispatch_async(v2, block);
}

void sub_1000296EC(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1[5] + 8) + 40) addEvent:a1[4]];
  objc_msgSend(*(id *)(*(void *)(a1[6] + 8) + 40), "__updatedStatusWithEvent:", a1[4]);
  objc_autoreleasePoolPop(v2);
}

void sub_100029738(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(dispatch_queue_s **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100029794;
  v4[3] = &unk_1000D1BA8;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100029794(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 136LL);
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0LL; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
        if (objc_msgSend(objc_msgSend(v8, "eventIDs"), "containsObject:", &off_1000DECD0)) {
          objc_msgSend( objc_msgSend(objc_msgSend(v8, "connection"), "remoteObjectProxy"),  "receivedEvent:",  *(void *)(a1 + 40));
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v5);
  }

  [*(id *)(*(void *)(a1 + 32) + 112) handlePeerFaultEvent:*(void *)(a1 + 40)];
  objc_autoreleasePoolPop(v2);
}

void sub_10002992C(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "__updateStatusMonitoring");
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0LL);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_1000299C8(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "__updateStatusMonitoring");
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0LL);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_100029A64(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  id v3 = objc_msgSend(*(id *)(a1 + 32), "__localPeer");
  id v4 = *(void **)(*(void *)(a1 + 32) + 80LL);
  if (v4 && [v4 localIDSIdentifier]) {
    objc_msgSend(v3, "setPeerID:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "localIDSIdentifier"));
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0LL, v3);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_100029B40(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  if (a1[4])
  {
    id v3 = objc_alloc(&OBJC_CLASS___W5PeerStatusRequest);
    uint64_t v4 = a1[4];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100029C50;
    v11[3] = &unk_1000D1F00;
    v11[4] = a1[6];
    uint64_t v5 = -[W5PeerStatusRequest initWithPeer:reply:](v3, "initWithPeer:reply:", v4, v11);
    id v6 = [*(id *)(a1[5] + 80) queryStatusForPeerWithRequest:v5];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = a1[6];
      if (v8) {
        (*(void (**)(uint64_t, id, void))(v8 + 16))(v8, v7, 0LL);
      }
    }

    if (v5) {
      CFRelease(v5);
    }
  }

  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100029C64;
    v9[3] = &unk_1000D1F50;
    __int128 v10 = *(_OWORD *)(a1 + 5);
    objc_msgSend((id)v10, "__queryStatusAndReply:", v9);
  }

  objc_autoreleasePoolPop(v2);
}

uint64_t sub_100029C50(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100029C64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 8LL);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100029CBC;
  v5[3] = &unk_1000D1F28;
  v5[4] = a3;
  void v5[5] = v3;
  dispatch_async(v4, v5);
}

void sub_100029CBC(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, 0LL, *(void *)(a1 + 32));
  }
  objc_autoreleasePoolPop(v2);
}

void sub_100029D58(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = (void *)a1[4];
  if (!v3
    || *(void *)(a1[5] + 176LL)
    && (objc_msgSend( objc_msgSend(v3, "peerID"),  "isEqualToString:",  objc_msgSend(*(id *)(a1[5] + 176), "peerID")) & 1) != 0)
  {
    uint64_t v4 = (void *)a1[5];
    uint64_t v5 = a1[6];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    void v14[2] = sub_100029EAC;
    v14[3] = &unk_1000D1FA0;
    uint64_t v6 = a1[7];
    v14[4] = v4;
    v14[5] = v6;
    objc_msgSend(v4, "__queryDatabaseAndReply:reply:", v5, v14);
  }

  else
  {
    id v7 = objc_alloc(&OBJC_CLASS___W5PeerDatabaseRequest);
    uint64_t v8 = a1[4];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    void v15[2] = sub_100029E98;
    v15[3] = &unk_1000D1F78;
    uint64_t v9 = a1[6];
    v15[4] = a1[7];
    __int128 v10 = -[W5PeerDatabaseRequest initWithPeer:fetch:reply:](v7, "initWithPeer:fetch:reply:", v8, v9, v15);
    id v11 = [*(id *)(a1[5] + 80) queryDatabaseForPeerWithRequest:v10];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = a1[7];
      if (v13) {
        (*(void (**)(uint64_t, id, void))(v13 + 16))(v13, v12, 0LL);
      }
    }

    if (v10) {
      CFRelease(v10);
    }
  }

  objc_autoreleasePoolPop(v2);
}

uint64_t sub_100029E98(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100029EAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 8LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100029F08;
  block[3] = &unk_1000D2018;
  void block[5] = a3;
  void block[6] = v3;
  void block[4] = a2;
  dispatch_async(v4, block);
}

void sub_100029F08(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = a1[4];
  uint64_t v4 = (os_log_s *)sub_10008C90C();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = a1[4];
      *(_DWORD *)__int128 v10 = 136315906;
      *(void *)&v10[4] = "-[W5Engine xpcConnection:queryDatabaseForPeer:fetch:reply:]_block_invoke_4";
      *(_WORD *)&v10[12] = 2080;
      *(void *)&v10[14] = "W5Engine.m";
      *(_WORD *)&v10[22] = 1024;
      LODWORD(v11) = 1057;
      WORD2(v11) = 2112;
      *(void *)((char *)&v11 + 6) = v6;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v4,  0LL,  "[wifivelocity] %s (%s:%u) W5Engine __queryDatabaseAndReply has error %@",  v10,  38,  *(_OWORD *)v10,  *(void *)&v10[16],  v11,  v12);
    }
  }

  else if (v5)
  {
    uint64_t v8 = a1[5];
    uint64_t v7 = a1[6];
    *(_DWORD *)__int128 v10 = 136316162;
    *(void *)&v10[4] = "-[W5Engine xpcConnection:queryDatabaseForPeer:fetch:reply:]_block_invoke";
    *(_WORD *)&v10[12] = 2080;
    *(void *)&v10[14] = "W5Engine.m";
    *(_WORD *)&v10[22] = 1024;
    LODWORD(v11) = 1059;
    WORD2(v11) = 2112;
    *(void *)((char *)&v11 + 6) = v7;
    HIWORD(v11) = 2112;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v4,  0LL,  "[wifivelocity] %s (%s:%u) W5Engine __queryDatabaseAndReply ok %@ reply %@",  v10,  48,  *(_OWORD *)v10,  *(void *)&v10[16],  v11,  v8);
  }

  uint64_t v9 = a1[6];
  if (v9) {
    (*(void (**)(uint64_t, void, void))(v9 + 16))(v9, a1[4], a1[5]);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10002A100(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = objc_alloc(&OBJC_CLASS___W5PeerFileRequest);
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  v12[0] = _NSConcreteStackBlock;
  v12[2] = sub_10002A1CC;
  v12[3] = &unk_1000D1F78;
  uint64_t v6 = a1[7];
  uint64_t v7 = *(void *)(a1[6] + 96LL);
  v12[1] = 3221225472LL;
  v12[4] = v6;
  uint64_t v8 = -[W5PeerFileRequest initWithPeer:requestType:remotePath:transferManager:reply:]( v3,  "initWithPeer:requestType:remotePath:transferManager:reply:",  v4,  1LL,  v5,  v7,  v12);
  id v9 = [*(id *)(a1[6] + 80) requestFileFromPeerWithRequest:v8];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = a1[7];
    if (v11) {
      (*(void (**)(uint64_t, id, void))(v11 + 16))(v11, v10, 0LL);
    }
  }

  if (v8) {
    CFRelease(v8);
  }
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_10002A1CC(uint64_t result, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(result + 32);
  if (v3) {
    return (*(uint64_t (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, a2, [a3 firstObject]);
  }
  return result;
}

void sub_10002A270(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = objc_alloc(&OBJC_CLASS___W5PeerFileRequest);
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  v12[0] = _NSConcreteStackBlock;
  v12[2] = sub_10002A33C;
  v12[3] = &unk_1000D1F78;
  uint64_t v6 = a1[7];
  uint64_t v7 = *(void *)(a1[6] + 96LL);
  v12[1] = 3221225472LL;
  v12[4] = v6;
  uint64_t v8 = -[W5PeerFileRequest initWithPeer:requestType:remotePath:transferManager:reply:]( v3,  "initWithPeer:requestType:remotePath:transferManager:reply:",  v4,  2LL,  v5,  v7,  v12);
  id v9 = [*(id *)(a1[6] + 80) requestFileFromPeerWithRequest:v8];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = a1[7];
    if (v11) {
      (*(void (**)(uint64_t, id, void))(v11 + 16))(v11, v10, 0LL);
    }
  }

  if (v8) {
    CFRelease(v8);
  }
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_10002A33C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10002A3AC(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  if (a1[4])
  {
    uint64_t v3 = objc_alloc(&OBJC_CLASS___W5PeerDebugConfigurationRequest);
    uint64_t v4 = a1[4];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10002A4C4;
    v11[3] = &unk_1000D1FF0;
    v11[4] = a1[6];
    uint64_t v5 = -[W5PeerDebugConfigurationRequest initWithPeer:type:debugConfiguration:reply:]( v3,  "initWithPeer:type:debugConfiguration:reply:",  v4,  1LL,  0LL,  v11);
    id v6 = [*(id *)(a1[5] + 80) sendDebugConfigurationForPeerWithRequest:v5];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = a1[6];
      if (v8) {
        (*(void (**)(uint64_t, id, void))(v8 + 16))(v8, v7, 0LL);
      }
    }

    if (v5) {
      CFRelease(v5);
    }
  }

  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10002A4D8;
    v9[3] = &unk_1000D2040;
    __int128 v10 = *(_OWORD *)(a1 + 5);
    objc_msgSend((id)v10, "__queryDebugConfigurationAndReply:", v9);
  }

  objc_autoreleasePoolPop(v2);
}

uint64_t sub_10002A4C4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10002A4D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 8LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002A534;
  block[3] = &unk_1000D2018;
  void block[5] = a3;
  void block[6] = v3;
  void block[4] = a2;
  dispatch_async(v4, block);
}

void sub_10002A534(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = a1[6];
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, a1[4], a1[5]);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10002A5CC(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  if (a1[4])
  {
    uint64_t v3 = objc_alloc(&OBJC_CLASS___W5PeerDebugConfigurationRequest);
    uint64_t v4 = a1[4];
    uint64_t v5 = a1[5];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10002A6E0;
    v13[3] = &unk_1000D1FF0;
    v13[4] = a1[7];
    id v6 = -[W5PeerDebugConfigurationRequest initWithPeer:type:debugConfiguration:reply:]( v3,  "initWithPeer:type:debugConfiguration:reply:",  v4,  2LL,  v5,  v13);
    id v7 = [*(id *)(a1[6] + 80) sendDebugConfigurationForPeerWithRequest:v6];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = a1[7];
      if (v9) {
        (*(void (**)(uint64_t, id))(v9 + 16))(v9, v8);
      }
    }

    if (v6) {
      CFRelease(v6);
    }
  }

  else
  {
    uint64_t v10 = a1[5];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10002A6F4;
    v11[3] = &unk_1000D2068;
    __int128 v12 = *((_OWORD *)a1 + 3);
    objc_msgSend((id)v12, "__setDebugConfiguration:reply:", v10, v11);
  }

  objc_autoreleasePoolPop(v2);
}

uint64_t sub_10002A6E0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10002A6F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 8LL);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002A74C;
  v4[3] = &unk_1000D1F28;
  v4[4] = a2;
  void v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_10002A74C(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10002A7E8(uint64_t a1)
{
  context = objc_autoreleasePoolPush();
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  uint64_t v3 = v2;
  uint64_t v4 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "UUIDString"), "substringToIndex:", 5);
    id v6 = [*(id *)(a1 + 40) processName];
    unsigned int v7 = objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "connection"), "processIdentifier");
    uint64_t v8 = *(void *)(a1 + 48);
    int v33 = 136316674;
    uint64_t v34 = "-[W5Engine xpcConnection:runDiagnostics:configuration:uuid:reply:]_block_invoke";
    __int16 v35 = 2080;
    uint64_t v36 = "W5Engine.m";
    __int16 v37 = 1024;
    int v38 = 1181;
    __int16 v39 = 2114;
    uint64_t v40 = (uint64_t)v5;
    __int16 v41 = 2114;
    id v42 = v6;
    __int16 v43 = 1024;
    unsigned int v44 = v7;
    __int16 v45 = 2114;
    uint64_t v46 = v8;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v4,  0LL,  "[wifivelocity] %s (%s:%u) RECEIVED DIAGNOSTICS REQUEST (uuid=%{public}@) from %{public}@ (%d) with configuration % {public}@ and items:",  &v33,  64);
  }

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  uint64_t v22 = a1;
  uint64_t v9 = *(void **)(a1 + 56);
  id v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v29;
    do
    {
      for (uint64_t i = 0LL; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v9);
        }
        int v14 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        int v15 = (os_log_s *)sub_10008C90C();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = W5DescriptionForDiagnosticsTestID([v14 testID]);
          id v17 = [v14 testID];
          int v33 = 136316162;
          uint64_t v34 = "-[W5Engine xpcConnection:runDiagnostics:configuration:uuid:reply:]_block_invoke";
          __int16 v35 = 2080;
          uint64_t v36 = "W5Engine.m";
          __int16 v37 = 1024;
          int v38 = 1184;
          __int16 v39 = 2114;
          uint64_t v40 = v16;
          __int16 v41 = 2048;
          id v42 = v17;
          LODWORD(v21) = 48;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "[wifivelocity] %s (%s:%u) TEST: %{public}@ (%ld)",  &v33,  v21);
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }

    while (v11);
  }

  uint64_t v19 = *(void *)(v22 + 48);
  uint64_t v18 = *(void *)(v22 + 56);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10002AB08;
  v24[3] = &unk_1000D20B8;
  __int128 v20 = *(_OWORD *)(v22 + 64);
  __int128 v25 = *(_OWORD *)(v22 + 32);
  __int128 v26 = v20;
  uint64_t v27 = v3;
  objc_msgSend((id)v20, "__runDiagnostics:configuration:uuid:reply:", v18, v19, (void)v25, v24);
  objc_autoreleasePoolPop(context);
}

void sub_10002AB08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "UUIDString"), "substringToIndex:", 5);
    id v8 = [*(id *)(a1 + 40) processName];
    unsigned int v9 = objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "connection"), "processIdentifier");
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    double v11 = v10 - *(double *)(a1 + 64);
    int v16 = 136316674;
    id v17 = "-[W5Engine xpcConnection:runDiagnostics:configuration:uuid:reply:]_block_invoke";
    __int16 v18 = 2080;
    uint64_t v19 = "W5Engine.m";
    __int16 v20 = 1024;
    int v21 = 1189;
    __int16 v22 = 2114;
    id v23 = v7;
    __int16 v24 = 2114;
    id v25 = v8;
    __int16 v26 = 1024;
    unsigned int v27 = v9;
    __int16 v28 = 2048;
    double v29 = v11;
    int v14 = 64;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "[wifivelocity] %s (%s:%u) COMPLETED DIAGNOSTICS REQUEST (uuid=%{public}@) from %{public}@ (%d), took %.6fs",  &v16,  v14);
  }

  uint64_t v12 = *(void *)(a1 + 56);
  uint64_t v13 = *(dispatch_queue_s **)(*(void *)(a1 + 48) + 8LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002ACB4;
  block[3] = &unk_1000D2018;
  void block[5] = a3;
  void block[6] = v12;
  void block[4] = a2;
  dispatch_async(v13, block);
}

void sub_10002ACB4(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = a1[6];
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, a1[4], a1[5]);
  }
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_10002B02C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10002B33C(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "uuid"), "UUIDString"), "substringToIndex:", 5);
    id v5 = [*(id *)(a1 + 32) processName];
    unsigned int v6 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "connection"), "processIdentifier");
    uint64_t v7 = *(void *)(a1 + 40);
    int v12 = 136316674;
    uint64_t v13 = "-[W5Engine xpcConnection:startDiagnosticsModeWithConfiguration:reply:]_block_invoke";
    __int16 v14 = 2080;
    int v15 = "W5Engine.m";
    __int16 v16 = 1024;
    int v17 = 1250;
    __int16 v18 = 2114;
    id v19 = v4;
    __int16 v20 = 2114;
    id v21 = v5;
    __int16 v22 = 1024;
    unsigned int v23 = v6;
    __int16 v24 = 2114;
    uint64_t v25 = v7;
    int v9 = 64;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v3,  0LL,  "[wifivelocity] %s (%s:%u) RECEIVED START DIAGNOSTICS MODE (uuid=%{public}@) from %{public}@ (%d) with configuration: %{public}@",  &v12,  v9);
  }

  uint64_t v8 = *(void *)(a1 + 40);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10002B4D8;
  v10[3] = &unk_1000D2108;
  __int128 v11 = *(_OWORD *)(a1 + 48);
  [*(id *)(v11 + 112) startDiagnosticsModeWithConfiguration:v8 reply:v10];
  objc_autoreleasePoolPop(v2);
}

void sub_10002B4D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 8LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002B534;
  block[3] = &unk_1000D2018;
  void block[5] = a3;
  void block[6] = v3;
  void block[4] = a2;
  dispatch_async(v4, block);
}

void sub_10002B534(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = a1[6];
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, a1[4], a1[5]);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10002B5D0(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "UUIDString"), "substringToIndex:", 5);
    id v5 = [*(id *)(a1 + 40) processName];
    unsigned int v6 = objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "connection"), "processIdentifier");
    uint64_t v7 = *(void *)(a1 + 48);
    int v13 = 136316674;
    __int16 v14 = "-[W5Engine xpcConnection:stopDiagnosticsModeWithUUID:info:reply:]_block_invoke";
    __int16 v15 = 2080;
    __int16 v16 = "W5Engine.m";
    __int16 v17 = 1024;
    int v18 = 1269;
    __int16 v19 = 2114;
    id v20 = v4;
    __int16 v21 = 2114;
    id v22 = v5;
    __int16 v23 = 1024;
    unsigned int v24 = v6;
    __int16 v25 = 2114;
    uint64_t v26 = v7;
    int v10 = 64;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v3,  0LL,  "[wifivelocity] %s (%s:%u) RECEIVED STOP DIAGNOSTICS MODE (uuid=%{public}@) from %{public}@ (%d) with configuration: %{public}@",  &v13,  v10);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 48);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10002B76C;
  v11[3] = &unk_1000D2068;
  __int128 v12 = *(_OWORD *)(a1 + 56);
  [*(id *)(v12 + 112) stopDiagnosticsModeWithUUID:v8 info:v9 reply:v11];
  objc_autoreleasePoolPop(v2);
}

void sub_10002B76C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 8LL);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002B7C4;
  v4[3] = &unk_1000D1F28;
  v4[4] = a2;
  void v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_10002B7C4(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10002B860(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "uuid"), "UUIDString"), "substringToIndex:", 5);
    id v5 = [*(id *)(a1 + 32) processName];
    unsigned int v6 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "connection"), "processIdentifier");
    uint64_t v7 = *(void *)(a1 + 40);
    int v17 = 136316674;
    int v18 = "-[W5Engine xpcConnection:queryDiagnosticsModeForPeer:info:reply:]_block_invoke";
    __int16 v19 = 2080;
    id v20 = "W5Engine.m";
    __int16 v21 = 1024;
    int v22 = 1288;
    __int16 v23 = 2114;
    id v24 = v4;
    __int16 v25 = 2114;
    id v26 = v5;
    __int16 v27 = 1024;
    unsigned int v28 = v6;
    __int16 v29 = 2114;
    uint64_t v30 = v7;
    int v14 = 64;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v3,  0LL,  "[wifivelocity] %s (%s:%u) RECEIVED QUERY DIAGNOSTICS MODE (uuid=%{public}@) from %{public}@ (%d) with configuration: %{public}@",  &v17,  v14);
  }

  if (*(void *)(a1 + 48))
  {
    uint64_t v8 = *(void *)(a1 + 64);
    uint64_t v9 = *(dispatch_queue_s **)(*(void *)(a1 + 56) + 8LL);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    void v15[2] = sub_10002BACC;
    v15[3] = &unk_1000D2158;
    v15[4] = v8;
    int v10 = v15;
  }

  else
  {
    if ([*(id *)(a1 + 40) objectForKeyedSubscript:@"Filter"]
      && objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", @"Filter"), "integerValue") == (id)2)
    {
      id v11 = [*(id *)(*(void *)(a1 + 56) + 112) allDiagnostics];
    }

    else
    {
      id v11 = [*(id *)(*(void *)(a1 + 56) + 112) activeDiagnostics];
    }

    uint64_t v12 = *(void *)(a1 + 64);
    int v13 = *(dispatch_queue_s **)(*(void *)(a1 + 56) + 8LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002BA8C;
    block[3] = &unk_1000D1F28;
    void block[4] = v11;
    void block[5] = v12;
    int v10 = block;
    uint64_t v9 = v13;
  }

  dispatch_async(v9, v10);
  objc_autoreleasePoolPop(v2);
}

void sub_10002BA8C(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, 0LL, *(void *)(a1 + 32));
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10002BACC(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    NSErrorUserInfoKey v4 = NSLocalizedFailureReasonErrorKey;
    id v5 = @"W5NotSupportedErr";
    (*(void (**)(uint64_t, NSError *, void))(v3 + 16))( v3,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  4LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL)),  0LL);
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10002BC00(uint64_t a1)
{
  context = objc_autoreleasePoolPush();
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  uint64_t v3 = v2;
  NSErrorUserInfoKey v4 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "UUIDString"), "substringToIndex:", 5);
    id v6 = [*(id *)(a1 + 40) processName];
    unsigned int v7 = objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "connection"), "processIdentifier");
    uint64_t v8 = *(void *)(a1 + 48);
    int v48 = 136316674;
    v49 = "-[W5Engine xpcConnection:collectLogs:configuration:uuid:reply:]_block_invoke";
    __int16 v50 = 2080;
    int v51 = "W5Engine.m";
    __int16 v52 = 1024;
    int v53 = 1321;
    __int16 v54 = 2114;
    uint64_t v55 = (uint64_t)v5;
    __int16 v56 = 2114;
    id v57 = v6;
    __int16 v58 = 1024;
    unsigned int v59 = v7;
    __int16 v60 = 2114;
    uint64_t v61 = v8;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v4,  0LL,  "[wifivelocity] %s (%s:%u) RECEIVED LOG REQUEST (uuid=%{public}@) from %{public}@ (%d) with configuration %{public}@ and items:",  &v48,  64);
  }

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  uint64_t v37 = a1;
  uint64_t v9 = *(void **)(a1 + 56);
  id v10 = [v9 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v44;
    do
    {
      for (uint64_t i = 0LL; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v44 != v12) {
          objc_enumerationMutation(v9);
        }
        int v14 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)i);
        __int16 v15 = (os_log_s *)sub_10008C90C();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = W5DescriptionForLogItemID([v14 itemID]);
          id v17 = [v14 itemID];
          int v48 = 136316162;
          v49 = "-[W5Engine xpcConnection:collectLogs:configuration:uuid:reply:]_block_invoke";
          __int16 v50 = 2080;
          int v51 = "W5Engine.m";
          __int16 v52 = 1024;
          int v53 = 1324;
          __int16 v54 = 2114;
          uint64_t v55 = v16;
          __int16 v56 = 2048;
          id v57 = v17;
          LODWORD(v36) = 48;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "[wifivelocity] %s (%s:%u) LOG ITEM: %{public}@ (%ld)",  &v48,  v36);
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }

    while (v11);
  }

  id v18 = objc_msgSend(*(id *)(v37 + 64), "__localPeer");
  unsigned int v19 = objc_msgSend( objc_msgSend(*(id *)(v37 + 48), "objectForKeyedSubscript:", @"Compress"),  "BOOLValue");
  id v20 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v20, "setDateFormat:", @"yyyy-MM-dd_HH.mm.ss.SSS");
  __int16 v21 = -[NSDateFormatter stringFromDate:](v20, "stringFromDate:", +[NSDate date](&OBJC_CLASS___NSDate, "date"));
  int v22 = (NSString *)[*(id *)(v37 + 48) objectForKeyedSubscript:@"Reason"];
  if (!v22) {
    int v22 = -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.WiFiVelocity"),  "localizedStringForKey:value:table:",  @"kW5LocWiFiDiagnosticsName",  @"WiFiDiagnostics",  0LL);
  }
  id v23 = [v18 os];
  id v24 = [v18 model];
  id v25 = [v18 build];
  id v26 = &stru_1000D4648;
  if (v19) {
    id v26 = @".tgz";
  }
  __int16 v27 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%@_%@_%@_%@%@",  v22,  v21,  v23,  v24,  v25,  v26);
  uint64_t v28 = getuid();
  uint64_t v29 = getgid();
  uint64_t v31 = *(void *)(v37 + 56);
  uint64_t v30 = *(void **)(v37 + 64);
  uint64_t v32 = *(void *)(v37 + 48);
  id v33 = [*(id *)(v37 + 40) additionalLog];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_10002C05C;
  v39[3] = &unk_1000D21A8;
  __int128 v34 = *(_OWORD *)(v37 + 32);
  uint64_t v42 = v3;
  __int128 v35 = *(_OWORD *)(v37 + 64);
  __int128 v40 = v34;
  __int128 v41 = v35;
  objc_msgSend( v30,  "__collectLogs:configuration:additionalLog:filename:uid:gid:uuid:reply:",  v31,  v32,  v33,  v27,  v28,  v29,  (void)v34,  v39);
  objc_autoreleasePoolPop(context);
}

void sub_10002C05C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "UUIDString"), "substringToIndex:", 5);
    id v10 = [*(id *)(a1 + 40) processName];
    unsigned int v11 = objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "connection"), "processIdentifier");
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    double v13 = v12 - *(double *)(a1 + 64);
    int v18 = 136316930;
    unsigned int v19 = "-[W5Engine xpcConnection:collectLogs:configuration:uuid:reply:]_block_invoke";
    __int16 v20 = 2080;
    __int16 v21 = "W5Engine.m";
    __int16 v22 = 1024;
    int v23 = 1348;
    __int16 v24 = 2114;
    id v25 = v9;
    __int16 v26 = 2114;
    id v27 = v10;
    __int16 v28 = 1024;
    unsigned int v29 = v11;
    __int16 v30 = 2048;
    double v31 = v13;
    __int16 v32 = 2114;
    uint64_t v33 = a4;
    int v16 = 74;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[wifivelocity] %s (%s:%u) COMPLETED LOG REQUEST (uuid=%{public}@) from %{public}@ (%d), took %.6fs, outputURL='%{public}@'",  &v18,  v16);
  }

  uint64_t v14 = *(void *)(a1 + 56);
  __int16 v15 = *(dispatch_queue_s **)(*(void *)(a1 + 48) + 8LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002C21C;
  block[3] = &unk_1000D2180;
  void block[4] = a2;
  void block[5] = a3;
  void block[6] = a4;
  void block[7] = v14;
  dispatch_async(v15, block);
}

void sub_10002C21C(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = a1[7];
  if (v3) {
    (*(void (**)(uint64_t, void, void, void))(v3 + 16))(v3, a1[4], a1[5], a1[6]);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10002C2BC(id *a1)
{
  context = objc_autoreleasePoolPush();
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  uint64_t v3 = v2;
  NSErrorUserInfoKey v4 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = objc_msgSend(objc_msgSend(a1[4], "UUIDString"), "substringToIndex:", 5);
    id v6 = [a1[5] processName];
    unsigned int v7 = objc_msgSend(objc_msgSend(a1[5], "connection"), "processIdentifier");
    id v8 = a1[6];
    int v31 = 136316674;
    __int16 v32 = "-[W5Engine xpcConnection:collectLogsDiagnosticMode:uuid:reply:]_block_invoke";
    __int16 v33 = 2080;
    __int128 v34 = "W5Engine.m";
    __int16 v35 = 1024;
    int v36 = 1365;
    __int16 v37 = 2114;
    id v38 = v5;
    __int16 v39 = 2114;
    id v40 = v6;
    __int16 v41 = 1024;
    unsigned int v42 = v7;
    __int16 v43 = 2114;
    id v44 = v8;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v4,  0LL,  "[wifivelocity] %s (%s:%u) RECEIVED LOG REQUEST (uuid=%{public}@) from %{public}@ (%d) with configuration %{public}@",  &v31,  64);
  }

  id v9 = objc_msgSend(a1[7], "__localPeer");
  unsigned int v25 = objc_msgSend(objc_msgSend(a1[6], "objectForKeyedSubscript:", @"Compress"), "BOOLValue");
  id v10 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v10, "setDateFormat:", @"yyyy.MM.dd_HH-mm-ssZZZZZ");
  -[NSDateFormatter setTimeZone:]( v10,  "setTimeZone:",  +[NSTimeZone defaultTimeZone](&OBJC_CLASS___NSTimeZone, "defaultTimeZone"));
  unsigned int v11 = -[NSString stringByReplacingOccurrencesOfString:withString:]( -[NSDateFormatter stringFromDate:](v10, "stringFromDate:", +[NSDate date](&OBJC_CLASS___NSDate, "date")),  "stringByReplacingOccurrencesOfString:withString:",  @":",  &stru_1000D4648);
  double v12 = (NSString *)[a1[6] objectForKeyedSubscript:@"Reason"];
  if (!v12) {
    double v12 = -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.WiFiVelocity"),  "localizedStringForKey:value:table:",  @"kW5LocWiFiNetworkDiagnosticsName",  @"WiFiNetworkDiagnostics",  0LL);
  }
  if (objc_msgSend(objc_msgSend(v9, "model"), "containsString:", @"AudioAccessory")) {
    double v13 = (__CFString *)objc_msgSend( objc_msgSend(v9, "name"),  "stringByReplacingOccurrencesOfString:withString:",  @" ",  &stru_1000D4648);
  }
  else {
    double v13 = &stru_1000D4648;
  }
  id v14 = objc_msgSend(objc_msgSend(v9, "os"), "stringByReplacingOccurrencesOfString:withString:", @" ", @"-");
  id v15 = [v9 model];
  if (-[__CFString length](v13, "length")) {
    int v16 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"_%@", v13);
  }
  else {
    int v16 = &stru_1000D4648;
  }
  id v17 = [v9 build];
  int v18 = @".tgz";
  if (!v25) {
    int v18 = &stru_1000D4648;
  }
  unsigned int v19 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%@_%@_%@%@_%@%@",  v12,  v11,  v14,  v15,  v16,  v17,  v18);
  uint64_t v20 = getuid();
  uint64_t v21 = getgid();
  id v22 = a1[6];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10002C67C;
  v27[3] = &unk_1000D21A8;
  __int128 v23 = *((_OWORD *)a1 + 2);
  uint64_t v30 = v3;
  __int128 v24 = *(_OWORD *)(a1 + 7);
  __int128 v28 = v23;
  __int128 v29 = v24;
  objc_msgSend( (id)v24,  "__collectLogsDiagnosticMode:outputName:uid:gid:uuid:reply:",  v22,  v19,  v20,  v21,  (void)v23,  v27);
  objc_autoreleasePoolPop(context);
}

void sub_10002C67C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "UUIDString"), "substringToIndex:", 5);
    id v10 = [*(id *)(a1 + 40) processName];
    unsigned int v11 = objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "connection"), "processIdentifier");
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    double v13 = v12 - *(double *)(a1 + 64);
    int v18 = 136316930;
    unsigned int v19 = "-[W5Engine xpcConnection:collectLogsDiagnosticMode:uuid:reply:]_block_invoke";
    __int16 v20 = 2080;
    uint64_t v21 = "W5Engine.m";
    __int16 v22 = 1024;
    int v23 = 1394;
    __int16 v24 = 2114;
    id v25 = v9;
    __int16 v26 = 2114;
    id v27 = v10;
    __int16 v28 = 1024;
    unsigned int v29 = v11;
    __int16 v30 = 2048;
    double v31 = v13;
    __int16 v32 = 2114;
    uint64_t v33 = a4;
    int v16 = 74;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[wifivelocity] %s (%s:%u) COMPLETED LOG REQUEST (uuid=%{public}@) from %{public}@ (%d), took %.6fs, outputURL='%{public}@'",  &v18,  v16);
  }

  uint64_t v14 = *(void *)(a1 + 56);
  id v15 = *(dispatch_queue_s **)(*(void *)(a1 + 48) + 8LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002C83C;
  block[3] = &unk_1000D2180;
  void block[4] = a2;
  void block[5] = a3;
  void block[6] = a4;
  void block[7] = v14;
  dispatch_async(v15, block);
}

void sub_10002C83C(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = a1[7];
  if (v3) {
    (*(void (**)(uint64_t, void, void, void))(v3 + 16))(v3, a1[4], a1[5], a1[6]);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10002C8E0(double *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = *((void *)a1 + 4);
  if (v3)
  {
    NSErrorUserInfoKey v4 = (void *)*((void *)a1 + 5);
    uint64_t v5 = *((void *)a1 + 6);
    double v6 = a1[9];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10002CACC;
    v16[3] = &unk_1000D21F8;
    uint64_t v7 = *((void *)a1 + 8);
    v16[4] = v4;
    v16[5] = v7;
    objc_msgSend(v4, "__runWiFiSnifferOnPeer:channels:duration:uuid:reply:", v3, v5, 0, v16, v6);
  }

  else
  {
    v15[0] = 0LL;
    v15[1] = v15;
    void v15[2] = 0x3052000000LL;
    v15[3] = sub_1000276F0;
    v15[4] = sub_100027700;
    void v15[5] = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  2LL);
    v14[0] = 0LL;
    v14[1] = v14;
    void v14[2] = 0x3052000000LL;
    v14[3] = sub_1000276F0;
    v14[4] = sub_100027700;
    v14[5] = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  2LL);
    id v8 = dispatch_group_create();
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10002CB6C;
    v13[3] = &unk_1000D2248;
    uint64_t v10 = *((void *)a1 + 5);
    id v9 = (void *)*((void *)a1 + 6);
    v13[4] = v8;
    void v13[5] = v10;
    *(double *)&v13[9] = a1[9];
    *(double *)&v13[6] = a1[7];
    v13[7] = v15;
    v13[8] = v14;
    [v9 enumerateObjectsUsingBlock:v13];
    unsigned int v11 = *(dispatch_queue_s **)(*((void *)a1 + 5) + 8LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002CC4C;
    block[3] = &unk_1000D2270;
    *(double *)&void block[4] = a1[8];
    void block[5] = v15;
    void block[6] = v14;
    dispatch_group_notify(v8, v11, block);
    _Block_object_dispose(v14, 8);
    _Block_object_dispose(v15, 8);
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10002CAA0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void sub_10002CACC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *(void *)(a1 + 40);
  double v6 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 8LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002CB2C;
  block[3] = &unk_1000D21D0;
  void block[7] = a5;
  void block[8] = v5;
  void block[4] = a2;
  void block[5] = a3;
  void block[6] = a4;
  dispatch_async(v6, block);
}

void sub_10002CB2C(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = a1[8];
  if (v3) {
    (*(void (**)(uint64_t, void, void, void, void))(v3 + 16))(v3, a1[4], a1[5], a1[6], a1[7]);
  }
  objc_autoreleasePoolPop(v2);
}

id sub_10002CB6C(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  if (a3 == 1) {
    *a4 = 1;
  }
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  double v6 = *(double *)(a1 + 72);
  uint64_t v7 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10002CC00;
  v11[3] = &unk_1000D2220;
  __int128 v12 = *(_OWORD *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 32);
  void v11[4] = a2;
  void v11[5] = v9;
  return objc_msgSend(v7, "__runWiFiSnifferOnChannel:duration:uuid:tcpDump:reply:", a2, v8, 0, v11, v6);
}

void sub_10002CC00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a2)
  {
    uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
    a3 = a2;
  }

  else
  {
    uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  }

  [v5 setObject:a3 forKey:v4];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t sub_10002CC4C(void *a1)
{
  uint64_t result = a1[4];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void, void))(result + 16))( result,  0LL,  *(void *)(*(void *)(a1[5] + 8LL) + 40LL),  *(void *)(*(void *)(a1[6] + 8LL) + 40LL),  0LL);
  }
  return result;
}

void sub_10002CCE4(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  if (v3)
  {
    double v6 = *(double *)(a1 + 72);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10002CDD0;
    v13[3] = &unk_1000D21F8;
    uint64_t v7 = *(void *)(a1 + 64);
    v13[4] = v4;
    void v13[5] = v7;
    objc_msgSend(v4, "__runWiFiSnifferOnPeer:channels:duration:uuid:reply:", v3, v5, 0, v13, v6);
  }

  else
  {
    id v8 = objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:");
    double v9 = *(double *)(a1 + 72);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10002CE80;
    v12[3] = &unk_1000D22C0;
    uint64_t v10 = *(void *)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 64);
    v12[4] = *(void *)(a1 + 40);
    void v12[5] = v11;
    objc_msgSend(v4, "__runWiFiSnifferOnChannel:duration:uuid:tcpDump:reply:", v8, v10, 1, v12, v9);
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10002CDD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 8LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002CE2C;
  block[3] = &unk_1000D2018;
  void block[5] = a4;
  void block[6] = v4;
  void block[4] = a2;
  dispatch_async(v5, block);
}

void sub_10002CE2C(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(uint64_t, void, id))(v3 + 16))( v3,  *(void *)(a1 + 32),  [*(id *)(a1 + 40) allValues]);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10002CE80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 8LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002CEDC;
  block[3] = &unk_1000D2018;
  void block[5] = a3;
  void block[6] = v3;
  void block[4] = a2;
  dispatch_async(v4, block);
}

void sub_10002CEDC(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = a1[6];
  if (v3)
  {
    uint64_t v4 = a1[4];
    uint64_t v5 = a1[5];
    (*(void (**)(uint64_t, uint64_t, NSArray *))(v3 + 16))( v3,  v4,  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10002CFDC(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = objc_alloc(&OBJC_CLASS___W5PeerDiscoveryRequest);
  uint64_t v4 = *(void *)(a1 + 32);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002D088;
  v7[3] = &unk_1000D22E8;
  __int128 v8 = *(_OWORD *)(a1 + 40);
  id v5 = objc_msgSend( *(id *)(*(void *)(a1 + 56) + 80),  "startPeerDiscoveryWithRequest:",   -[W5PeerDiscoveryRequest initWithConfiguration:uuid:handler:]( v3,  "initWithConfiguration:uuid:handler:",  v4,  (void)v8,  v7));
  uint64_t v6 = *(void *)(a1 + 64);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
  }
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_10002D088(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 | a3)
  {
    id v6 = objc_alloc(&OBJC_CLASS___W5PeerDiscoveryEvent);
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v11 = @"UUID";
    uint64_t v12 = v7;
    return (uint64_t)objc_msgSend( objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "connection"), "remoteObjectProxy"),  "receivedPeerDiscoveryEvent:",   objc_msgSend( v6,  "initWithPeersFound:peersLost:info:",  a2,  a3,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1)));
  }

  else
  {
    double v9 = (os_log_s *)sub_10008C90C();
    uint64_t result = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)result)
    {
      int v13 = 136315650;
      uint64_t v14 = "-[W5Engine xpcConnection:startPeerDiscoveryWithConfiguration:uuid:reply:]_block_invoke_2";
      __int16 v15 = 2080;
      int v16 = "W5Engine.m";
      __int16 v17 = 1024;
      int v18 = 1482;
      LODWORD(v10) = 28;
      return _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[wifivelocity] %s (%s:%u) not sending peer discovery event, no peers found/lost",  (const char *)&v13,  v10,  (_DWORD)v11);
    }
  }

  return result;
}

void sub_10002D244(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "__cancelPeerDiscoveryWithUUID:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0LL);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10002D3D8(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002D44C;
  v7[3] = &unk_1000D2068;
  uint64_t v5 = a1[6];
  uint64_t v6 = a1[7];
  void v7[4] = v3;
  v7[5] = v6;
  objc_msgSend(v3, "__runWiFiPerfLoggingWithConfiguration:uuid:reply:", v4, v5, v7);
  objc_autoreleasePoolPop(v2);
}

void sub_10002D44C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 8LL);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002D4A4;
  v4[3] = &unk_1000D1F28;
  v4[4] = a2;
  void v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_10002D4A4(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10002D53C(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  _DWORD v6[2] = sub_10002D5B0;
  v6[3] = &unk_1000D2068;
  uint64_t v5 = a1[6];
  v6[4] = v3;
  v6[5] = v5;
  objc_msgSend(v3, "__cancelDiagnosticsWithUUID:reply:", v4, v6);
  objc_autoreleasePoolPop(v2);
}

void sub_10002D5B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 8LL);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002D608;
  v4[3] = &unk_1000D1F28;
  v4[4] = a2;
  void v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_10002D608(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10002D6A0(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  _DWORD v6[2] = sub_10002D714;
  v6[3] = &unk_1000D2068;
  uint64_t v5 = a1[6];
  v6[4] = v3;
  v6[5] = v5;
  objc_msgSend(v3, "__cancelCollectLogsWithUUID:reply:", v4, v6);
  objc_autoreleasePoolPop(v2);
}

void sub_10002D714(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 8LL);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002D76C;
  v4[3] = &unk_1000D1F28;
  v4[4] = a2;
  void v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_10002D76C(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10002D804(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  if (a1[4])
  {
    uint64_t v3 = objc_alloc_init(&OBJC_CLASS___W5Peer);
    -[W5Peer setPeerID:](v3, "setPeerID:", a1[4]);
    -[W5Peer setDiscoveryFlags:](v3, "setDiscoveryFlags:", 1LL);
    -[W5Peer setControlFlags:](v3, "setControlFlags:", 1LL);
    uint64_t v4 = (void *)a1[5];
    uint64_t v5 = a1[6];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10002D900;
    v11[3] = &unk_1000D2068;
    uint64_t v6 = a1[7];
    void v11[4] = v4;
    void v11[5] = v6;
    objc_msgSend(v4, "__cancelWiFiSnifferWithUUID:peer:reply:", v5, v3, v11);
  }

  else
  {
    uint64_t v7 = (void *)a1[5];
    uint64_t v8 = a1[6];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10002D994;
    v10[3] = &unk_1000D2068;
    uint64_t v9 = a1[7];
    void v10[4] = v7;
    v10[5] = v9;
    objc_msgSend(v7, "__cancelWiFiSnifferWithUUID:reply:", v8, v10);
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10002D900(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 8LL);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002D958;
  v4[3] = &unk_1000D1F28;
  v4[4] = a2;
  void v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_10002D958(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10002D994(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 8LL);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002D9EC;
  v4[3] = &unk_1000D1F28;
  v4[4] = a2;
  void v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_10002D9EC(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10002DA84(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v4 = a1[4];
  uint64_t v3 = (void *)a1[5];
  uint64_t v5 = a1[6];
  if (v4)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10002DB38;
    v9[3] = &unk_1000D2068;
    uint64_t v6 = a1[7];
    void v9[4] = v3;
    v9[5] = v6;
    objc_msgSend(v3, "__cancelWiFiSnifferWithUUID:peer:reply:", v5, v4, v9);
  }

  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10002DBCC;
    v8[3] = &unk_1000D2068;
    uint64_t v7 = a1[7];
    v8[4] = v3;
    v8[5] = v7;
    objc_msgSend(v3, "__cancelWiFiSnifferWithUUID:reply:", v5, v8);
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10002DB38(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 8LL);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002DB90;
  v4[3] = &unk_1000D1F28;
  v4[4] = a2;
  void v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_10002DB90(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10002DBCC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 8LL);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002DC24;
  v4[3] = &unk_1000D1F28;
  v4[4] = a2;
  void v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_10002DC24(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10002DCBC(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  _DWORD v6[2] = sub_10002DD30;
  v6[3] = &unk_1000D2068;
  uint64_t v5 = a1[6];
  v6[4] = v3;
  v6[5] = v5;
  objc_msgSend(v3, "__cancelWiFiPerfLoggingWithUUID:reply:", v4, v6);
  objc_autoreleasePoolPop(v2);
}

void sub_10002DD30(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 8LL);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002DD88;
  v4[3] = &unk_1000D1F28;
  v4[4] = a2;
  void v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_10002DD88(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10002DE20(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = a1[4];
  if (v3)
  {
    [*(id *)(a1[5] + 184) startMonitoringFaultEventsForPeer:v3 reply:a1[6]];
  }

  else
  {
    uint64_t v4 = a1[6];
    if (v4) {
      (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0LL);
    }
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10002DED0(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = a1[4];
  if (v3)
  {
    [*(id *)(a1[5] + 184) stopMonitoringFaultEventsForPeer:v3 reply:a1[6]];
  }

  else
  {
    uint64_t v4 = a1[6];
    if (v4) {
      (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0LL);
    }
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10002DF80(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(a1[4] + 184) submitFaultEvent:a1[5]];
  uint64_t v3 = a1[6];
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0LL);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10002E024(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = a1[4];
  if (v3)
  {
    [*(id *)(a1[5] + 184) queryFaultEventCacheForPeer:v3 reply:a1[6]];
  }

  else
  {
    uint64_t v4 = a1[6];
    if (v4) {
      (*(void (**)(uint64_t, void, id))(v4 + 16))( v4,  0,  [*(id *)(a1[5] + 184) faultEventCache]);
    }
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10002E598( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37)
{
}

void sub_10002E5E4(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 136) addObject:*(void *)(a1 + 40)];
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_10002E618(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) processName];
  unsigned int v3 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) processIdentifier];
  unsigned int v4 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) effectiveUserIdentifier];
  unsigned int v5 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) effectiveGroupIdentifier];
  uint64_t v6 = (os_log_s *)sub_10008C90C();
  uint64_t result = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)result)
  {
    int v9 = 136316674;
    uint64_t v10 = "-[W5Engine listener:shouldAcceptNewConnection:]_block_invoke_2";
    __int16 v11 = 2080;
    uint64_t v12 = "W5Engine.m";
    __int16 v13 = 1024;
    int v14 = 1748;
    __int16 v15 = 2114;
    id v16 = v2;
    __int16 v17 = 1024;
    unsigned int v18 = v3;
    __int16 v19 = 1024;
    unsigned int v20 = v4;
    __int16 v21 = 1024;
    unsigned int v22 = v5;
    int v8 = 56;
    return _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "[wifivelocity] %s (%s:%u) INTERRUPTED XPC CONNECTION %{public}@ [pid=%d, euid=%d, egid=%d]",  &v9,  v8);
  }

  return result;
}

void sub_10002E778(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) processName];
  unsigned int v3 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) processIdentifier];
  unsigned int v4 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) effectiveUserIdentifier];
  unsigned int v5 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) effectiveGroupIdentifier];
  uint64_t v6 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136316674;
    __int16 v15 = "-[W5Engine listener:shouldAcceptNewConnection:]_block_invoke";
    __int16 v16 = 2080;
    __int16 v17 = "W5Engine.m";
    __int16 v18 = 1024;
    int v19 = 1760;
    __int16 v20 = 2114;
    id v21 = v2;
    __int16 v22 = 1024;
    unsigned int v23 = v3;
    __int16 v24 = 1024;
    unsigned int v25 = v4;
    __int16 v26 = 1024;
    unsigned int v27 = v5;
    int v10 = 56;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "[wifivelocity] %s (%s:%u) INVALIDATED XPC CONNECTION %{public}@ [pid=%d, euid=%d, egid=%d]",  &v14,  v10);
  }

  __int128 v7 = *(_OWORD *)(a1 + 32);
  __int128 v8 = *(_OWORD *)(a1 + 48);
  int v9 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 8LL);
  block[1] = 3221225472LL;
  block[0] = _NSConcreteStackBlock;
  block[2] = sub_10002E91C;
  block[3] = &unk_1000D2338;
  __int128 v12 = v7;
  __int128 v13 = v8;
  dispatch_async(v9, block);
}

void sub_10002E91C(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v3 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) activeRequests];
  id v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0LL; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        __int128 v8 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        switch((unint64_t)[v8 type])
        {
          case 1uLL:
            objc_msgSend(*(id *)(a1 + 32), "__cancelDiagnosticsWithUUID:reply:", objc_msgSend(v8, "uuid"), 0);
            break;
          case 2uLL:
            objc_msgSend(*(id *)(a1 + 32), "__cancelCollectLogsWithUUID:reply:", objc_msgSend(v8, "uuid"), 0);
            break;
          case 3uLL:
            objc_msgSend(*(id *)(a1 + 32), "__cancelWiFiSnifferWithUUID:reply:", objc_msgSend(v8, "uuid"), 0);
            break;
          case 4uLL:
            objc_msgSend(*(id *)(a1 + 32), "__cancelPeerDiscoveryWithUUID:", objc_msgSend(v8, "uuid"));
            break;
          case 5uLL:
            objc_msgSend(*(id *)(a1 + 32), "__cancelWiFiPerfLoggingWithUUID:reply:", objc_msgSend(v8, "uuid"), 0);
            break;
          default:
            continue;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }

    while (v5);
  }

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v9 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "faultEventMonitoringPeers", 0);
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (j = 0LL; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*(void *)(a1 + 32) + 184) stopMonitoringFaultEventsForPeer:*(void *)(*((void *)&v14 + 1) + 8 * (void)j) reply:0];
      }

      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }

    while (v11);
  }

  -[NSFileManager removeItemAtURL:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "removeItemAtURL:error:",  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) additionalLog],  0);
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setExportedObject:0];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setInterruptionHandler:0];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setInvalidationHandler:0];
  [*(id *)(*(void *)(a1 + 32) + 136) removeObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  objc_msgSend( +[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"),  "osTransactionComplete:",  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));

  *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL) = 0LL;
  objc_msgSend(*(id *)(a1 + 32), "__updateStatusMonitoring");
  objc_autoreleasePoolPop(v2);
}

void sub_10002F388(id a1, BGRepeatingSystemTask *a2)
{
  uint64_t v10 = 0LL;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10002F5FC;
  v9[3] = &unk_1000D12E0;
  void v9[4] = &v10;
  -[BGRepeatingSystemTask setExpirationHandler:](a2, "setExpirationHandler:", v9);
  id v3 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 v14 = 136315650;
    *(void *)&v14[4] = "-[W5Engine _scheduleRepeatingCleanupTasks]_block_invoke";
    __int16 v15 = 2080;
    __int128 v16 = "W5Engine.m";
    __int16 v17 = 1024;
    int v18 = 1907;
    LODWORD(v7) = 28;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v3,  0LL,  "[wifivelocity] %s (%s:%u) [START] Sniffer Capture Cleanup Task",  v14,  v7,  v8);
  }

  id v4 = +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"pathExtension='pcap'");
  sub_10008D974(@"/var/run/com.apple.wifivelocity", (uint64_t)v4, 7LL, (_BYTE *)v11 + 24);
  id v5 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 v14 = 136315650;
    *(void *)&v14[4] = "-[W5Engine _scheduleRepeatingCleanupTasks]_block_invoke";
    __int16 v15 = 2080;
    __int128 v16 = "W5Engine.m";
    __int16 v17 = 1024;
    int v18 = 1909;
    LODWORD(v7) = 28;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v5,  0LL,  "[wifivelocity] %s (%s:%u) [END] Sniffer Capture Cleanup Task",  v14,  v7,  v8);
  }

  if (*((_BYTE *)v11 + 24))
  {
    if ((-[BGRepeatingSystemTask setTaskExpiredWithRetryAfter:error:]( a2,  "setTaskExpiredWithRetryAfter:error:",  v14,  0.0) & 1) == 0)
    {
      uint64_t v6 = *(const __CFString **)v14;
      if (!*(void *)v14) {
        uint64_t v6 = @"Unknown";
      }
      NSLog(@"Failed to expire task with error: %@", v6);
      -[BGRepeatingSystemTask setTaskCompleted](a2, "setTaskCompleted");
    }
  }

  else
  {
    -[BGRepeatingSystemTask setTaskCompleted](a2, "setTaskCompleted");
  }

  _Block_object_dispose(&v10, 8);
}

void sub_10002F5D8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_10002F5FC(uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
  uint64_t v1 = (os_log_s *)sub_10008C90C();
  uint64_t result = os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)result)
  {
    int v4 = 136315650;
    id v5 = "-[W5Engine _scheduleRepeatingCleanupTasks]_block_invoke_2";
    __int16 v6 = 2080;
    __int128 v7 = "W5Engine.m";
    __int16 v8 = 1024;
    int v9 = 1904;
    int v3 = 28;
    return _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v1,  0LL,  "[wifivelocity] %s (%s:%u) Sniffer Cleanup Task was expired",  (const char *)&v4,  v3);
  }

  return result;
}

void sub_10002F6E4(uint64_t a1, void *a2)
{
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10002F980;
  v10[3] = &unk_1000D12E0;
  void v10[4] = &v11;
  [a2 setExpirationHandler:v10];
  int v4 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 v16 = 136315650;
    *(void *)&v16[4] = "-[W5Engine _scheduleRepeatingCleanupTasks]_block_invoke";
    __int16 v17 = 2080;
    int v18 = "W5Engine.m";
    __int16 v19 = 1024;
    int v20 = 1936;
    LODWORD(v_Block_object_dispose(va, 8) = 28;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v4,  0LL,  "[wifivelocity] %s (%s:%u) [START] DE Output Cleanup Task",  v16,  v8,  v9);
  }

  __int128 v15 = *(_OWORD *)(a1 + 32);
  id v5 = +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 2LL));
  sub_10008D974(@"/var/run/com.apple.wifivelocity", (uint64_t)v5, 7LL, (_BYTE *)v12 + 24);
  __int16 v6 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 v16 = 136315650;
    *(void *)&v16[4] = "-[W5Engine _scheduleRepeatingCleanupTasks]_block_invoke";
    __int16 v17 = 2080;
    int v18 = "W5Engine.m";
    __int16 v19 = 1024;
    int v20 = 1938;
    LODWORD(v_Block_object_dispose(va, 8) = 28;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "[wifivelocity] %s (%s:%u) [END] DE Output Cleanup Task",  v16,  v8,  v9);
  }

  if (*((_BYTE *)v12 + 24))
  {
    if (([a2 setTaskExpiredWithRetryAfter:v16 error:0.0] & 1) == 0)
    {
      __int128 v7 = *(const __CFString **)v16;
      if (!*(void *)v16) {
        __int128 v7 = @"Unknown";
      }
      NSLog(@"Failed to expire task with error: %@", v7);
      [a2 setTaskCompleted];
    }
  }

  else
  {
    [a2 setTaskCompleted];
  }

  _Block_object_dispose(&v11, 8);
}

void sub_10002F95C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_10002F980(uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
  uint64_t v1 = (os_log_s *)sub_10008C90C();
  uint64_t result = os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)result)
  {
    int v4 = 136315650;
    id v5 = "-[W5Engine _scheduleRepeatingCleanupTasks]_block_invoke_2";
    __int16 v6 = 2080;
    __int128 v7 = "W5Engine.m";
    __int16 v8 = 1024;
    int v9 = 1933;
    int v3 = 28;
    return _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v1,  0LL,  "[wifivelocity] %s (%s:%u) DE Cleanup Task was expired",  (const char *)&v4,  v3);
  }

  return result;
}

NSXPCInterface *sub_100030094()
{
  v0 = +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___W5XPCRequestDelegate);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError, v1), 0LL),  "startBrowsingAndReply:",  0LL,  1LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError, v2), 0LL),  "stopBrowsingAndReply:",  0LL,  1LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError, v3), 0LL),  "startAdvertisingAndReply:",  0LL,  1LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError, v4), 0LL),  "stopAdvertisingAndReply:",  0LL,  1LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError, v5), 0LL),  "startMonitoringEvents:reply:",  0LL,  1LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError, v6), 0LL),  "stopMonitoringEvents:reply:",  0LL,  1LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError, v7), 0LL),  "queryPeerCacheAndReply:",  0LL,  1LL);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSArray, v8);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v9, objc_opt_class(&OBJC_CLASS___W5Peer, v10), 0LL),  "queryPeerCacheAndReply:",  1LL,  1LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError, v11), 0LL),  "queryLocalPeerAndReply:",  0LL,  1LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___W5Peer, v12), 0LL),  "queryLocalPeerAndReply:",  1LL,  1LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___W5Peer, v13), 0LL),  "queryStatusForPeer:reply:",  0LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError, v14), 0LL),  "queryStatusForPeer:reply:",  0LL,  1LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___W5Status, v15), 0LL),  "queryStatusForPeer:reply:",  1LL,  1LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___W5Peer, v16), 0LL),  "listFilesFromPeer:remoteDirPath:reply:",  0LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSURL, v17), 0LL),  "listFilesFromPeer:remoteDirPath:reply:",  1LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError, v18), 0LL),  "listFilesFromPeer:remoteDirPath:reply:",  0LL,  1LL);
  uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSArray, v19);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v20, objc_opt_class(&OBJC_CLASS___NSURL, v21), 0LL),  "listFilesFromPeer:remoteDirPath:reply:",  1LL,  1LL);
  uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSArray, v22);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v23,  objc_opt_class(&OBJC_CLASS___W5DiagnosticsTestRequest, v24),  0LL),  "runDiagnostics:configuration:uuid:reply:",  0LL,  0LL);
  uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSDictionary, v25);
  uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSArray, v27);
  uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSNumber, v29);
  uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSString, v31);
  uint64_t v34 = objc_opt_class(&OBJC_CLASS___W5Peer, v33);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v26,  v28,  v30,  v32,  v34,  objc_opt_class(&OBJC_CLASS___W5DiagnosticsTestRequest, v35),  0LL),  "runDiagnostics:configuration:uuid:reply:",  1LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSUUID, v36), 0LL),  "runDiagnostics:configuration:uuid:reply:",  2LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError, v37), 0LL),  "runDiagnostics:configuration:uuid:reply:",  0LL,  1LL);
  uint64_t v39 = objc_opt_class(&OBJC_CLASS___NSArray, v38);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v39,  objc_opt_class(&OBJC_CLASS___W5DiagnosticsTestResult, v40),  0LL),  "runDiagnostics:configuration:uuid:reply:",  1LL,  1LL);
  uint64_t v42 = objc_opt_class(&OBJC_CLASS___NSArray, v41);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v42,  objc_opt_class(&OBJC_CLASS___W5Peer, v43),  0LL),  "runDiagnosticsForPeer:diagnostics:configuration:uuid:reply:",  0LL,  0LL);
  uint64_t v45 = objc_opt_class(&OBJC_CLASS___NSArray, v44);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v45,  objc_opt_class(&OBJC_CLASS___W5DiagnosticsTestRequest, v46),  0LL),  "runDiagnosticsForPeer:diagnostics:configuration:uuid:reply:",  1LL,  0LL);
  uint64_t v48 = objc_opt_class(&OBJC_CLASS___NSDictionary, v47);
  uint64_t v50 = objc_opt_class(&OBJC_CLASS___NSArray, v49);
  uint64_t v52 = objc_opt_class(&OBJC_CLASS___NSNumber, v51);
  uint64_t v54 = objc_opt_class(&OBJC_CLASS___NSString, v53);
  uint64_t v56 = objc_opt_class(&OBJC_CLASS___W5Peer, v55);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v48,  v50,  v52,  v54,  v56,  objc_opt_class(&OBJC_CLASS___W5DiagnosticsTestRequest, v57),  0LL),  "runDiagnosticsForPeer:diagnostics:configuration:uuid:reply:",  2LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSUUID, v58), 0LL),  "runDiagnosticsForPeer:diagnostics:configuration:uuid:reply:",  3LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError, v59), 0LL),  "runDiagnosticsForPeer:diagnostics:configuration:uuid:reply:",  0LL,  1LL);
  uint64_t v61 = objc_opt_class(&OBJC_CLASS___NSArray, v60);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v61,  objc_opt_class(&OBJC_CLASS___W5DiagnosticsTestResult, v62),  0LL),  "runDiagnosticsForPeer:diagnostics:configuration:uuid:reply:",  1LL,  1LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___W5Peer, v63), 0LL),  "registerRemoteDiagnosticEventsForPeer:configuration:reply:",  0LL,  0LL);
  uint64_t v65 = objc_opt_class(&OBJC_CLASS___NSDictionary, v64);
  uint64_t v67 = objc_opt_class(&OBJC_CLASS___NSArray, v66);
  uint64_t v69 = objc_opt_class(&OBJC_CLASS___NSNumber, v68);
  uint64_t v71 = objc_opt_class(&OBJC_CLASS___NSString, v70);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v65,  v67,  v69,  v71,  objc_opt_class(&OBJC_CLASS___W5Peer, v72),  0LL),  "registerRemoteDiagnosticEventsForPeer:configuration:reply:",  1LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError, v73), 0LL),  "registerRemoteDiagnosticEventsForPeer:configuration:reply:",  0LL,  1LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___W5Peer, v74), 0LL),  "unregisterRemoteDiagnosticEventsForPeer:configuration:reply:",  0LL,  0LL);
  uint64_t v76 = objc_opt_class(&OBJC_CLASS___NSDictionary, v75);
  uint64_t v78 = objc_opt_class(&OBJC_CLASS___NSArray, v77);
  uint64_t v80 = objc_opt_class(&OBJC_CLASS___NSNumber, v79);
  uint64_t v82 = objc_opt_class(&OBJC_CLASS___NSString, v81);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v76,  v78,  v80,  v82,  objc_opt_class(&OBJC_CLASS___W5Peer, v83),  0LL),  "unregisterRemoteDiagnosticEventsForPeer:configuration:reply:",  1LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError, v84), 0LL),  "unregisterRemoteDiagnosticEventsForPeer:configuration:reply:",  0LL,  1LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError, v85), 0LL),  "queryRegisteredDiagnosticsPeersWithReply:",  0LL,  1LL);
  uint64_t v87 = objc_opt_class(&OBJC_CLASS___NSArray, v86);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v87,  objc_opt_class(&OBJC_CLASS___W5DiagnosticsModePeer, v88),  0LL),  "queryRegisteredDiagnosticsPeersWithReply:",  1LL,  1LL);
  uint64_t v90 = objc_opt_class(&OBJC_CLASS___NSDictionary, v89);
  uint64_t v92 = objc_opt_class(&OBJC_CLASS___NSArray, v91);
  uint64_t v94 = objc_opt_class(&OBJC_CLASS___NSNumber, v93);
  uint64_t v96 = objc_opt_class(&OBJC_CLASS___NSString, v95);
  uint64_t v98 = objc_opt_class(&OBJC_CLASS___W5Peer, v97);
  uint64_t v100 = objc_opt_class(&OBJC_CLASS___W5DiagnosticsModePeer, v99);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v90,  v92,  v94,  v96,  v98,  v100,  objc_opt_class(&OBJC_CLASS___W5WiFiChannel, v101),  0LL),  "startDiagnosticsModeWithConfiguration:reply:",  0LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  objc_opt_class(&OBJC_CLASS___W5DiagnosticsMode, v102),  0LL),  "startDiagnosticsModeWithConfiguration:reply:",  0LL,  1LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError, v103), 0LL),  "startDiagnosticsModeWithConfiguration:reply:",  1LL,  1LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSUUID, v104), 0LL),  "stopDiagnosticsModeWithUUID:info:reply:",  0LL,  0LL);
  uint64_t v106 = objc_opt_class(&OBJC_CLASS___NSDictionary, v105);
  uint64_t v108 = objc_opt_class(&OBJC_CLASS___NSArray, v107);
  uint64_t v110 = objc_opt_class(&OBJC_CLASS___NSNumber, v109);
  uint64_t v112 = objc_opt_class(&OBJC_CLASS___NSString, v111);
  uint64_t v114 = objc_opt_class(&OBJC_CLASS___W5Peer, v113);
  uint64_t v116 = objc_opt_class(&OBJC_CLASS___W5DiagnosticsModePeer, v115);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v106,  v108,  v110,  v112,  v114,  v116,  objc_opt_class(&OBJC_CLASS___W5WiFiChannel, v117),  0LL),  "stopDiagnosticsModeWithUUID:info:reply:",  1LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError, v118), 0LL),  "stopDiagnosticsModeWithUUID:info:reply:",  0LL,  1LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___W5Peer, v119), 0LL),  "queryDiagnosticsModeForPeer:info:reply:",  0LL,  0LL);
  uint64_t v121 = objc_opt_class(&OBJC_CLASS___NSDictionary, v120);
  uint64_t v123 = objc_opt_class(&OBJC_CLASS___NSArray, v122);
  uint64_t v125 = objc_opt_class(&OBJC_CLASS___NSNumber, v124);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v121,  v123,  v125,  objc_opt_class(&OBJC_CLASS___NSString, v126),  0LL),  "queryDiagnosticsModeForPeer:info:reply:",  1LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError, v127), 0LL),  "queryDiagnosticsModeForPeer:info:reply:",  0LL,  1LL);
  uint64_t v129 = objc_opt_class(&OBJC_CLASS___NSArray, v128);
  uint64_t v131 = objc_opt_class(&OBJC_CLASS___W5DiagnosticsMode, v130);
  uint64_t v133 = objc_opt_class(&OBJC_CLASS___NSUUID, v132);
  uint64_t v135 = objc_opt_class(&OBJC_CLASS___NSDictionary, v134);
  uint64_t v137 = objc_opt_class(&OBJC_CLASS___NSURL, v136);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v129,  v131,  v133,  v135,  v137,  objc_opt_class(&OBJC_CLASS___W5WiFiChannel, v138),  0LL),  "queryDiagnosticsModeForPeer:info:reply:",  1LL,  1LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___W5Peer, v139), 0LL),  "queryDebugConfigurationForPeer:reply:",  0LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError, v140), 0LL),  "queryDebugConfigurationForPeer:reply:",  0LL,  1LL);
  uint64_t v142 = objc_opt_class(&OBJC_CLASS___W5DebugConfiguration, v141);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v142,  objc_opt_class(&OBJC_CLASS___W5DiagnosticsMode, v143),  0LL),  "queryDebugConfigurationForPeer:reply:",  1LL,  1LL);
  uint64_t v145 = objc_opt_class(&OBJC_CLASS___W5DebugConfiguration, v144);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v145,  objc_opt_class(&OBJC_CLASS___W5DiagnosticsMode, v146),  0LL),  "setDebugConfiguration:peer:reply:",  0LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___W5Peer, v147), 0LL),  "setDebugConfiguration:peer:reply:",  1LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError, v148), 0LL),  "setDebugConfiguration:peer:reply:",  0LL,  1LL);
  uint64_t v150 = objc_opt_class(&OBJC_CLASS___NSArray, v149);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v150,  objc_opt_class(&OBJC_CLASS___W5LogItemRequest, v151),  0LL),  "collectLogs:configuration:uuid:reply:",  0LL,  0LL);
  uint64_t v153 = objc_opt_class(&OBJC_CLASS___NSDictionary, v152);
  uint64_t v155 = objc_opt_class(&OBJC_CLASS___NSArray, v154);
  uint64_t v157 = objc_opt_class(&OBJC_CLASS___NSNumber, v156);
  uint64_t v159 = objc_opt_class(&OBJC_CLASS___NSString, v158);
  uint64_t v161 = objc_opt_class(&OBJC_CLASS___W5Peer, v160);
  uint64_t v163 = objc_opt_class(&OBJC_CLASS___W5DiagnosticsTestRequest, v162);
  uint64_t v165 = objc_opt_class(&OBJC_CLASS___W5LogItemRequest, v164);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v153,  v155,  v157,  v159,  v161,  v163,  v165,  objc_opt_class(&OBJC_CLASS___NSURL, v166),  0LL),  "collectLogs:configuration:uuid:reply:",  1LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSUUID, v167), 0LL),  "collectLogs:configuration:uuid:reply:",  2LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError, v168), 0LL),  "collectLogs:configuration:uuid:reply:",  0LL,  1LL);
  uint64_t v170 = objc_opt_class(&OBJC_CLASS___NSArray, v169);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v170,  objc_opt_class(&OBJC_CLASS___W5LogItemReceipt, v171),  0LL),  "collectLogs:configuration:uuid:reply:",  1LL,  1LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSURL, v172), 0LL),  "collectLogs:configuration:uuid:reply:",  2LL,  1LL);
  uint64_t v174 = objc_opt_class(&OBJC_CLASS___NSDictionary, v173);
  uint64_t v176 = objc_opt_class(&OBJC_CLASS___NSArray, v175);
  uint64_t v178 = objc_opt_class(&OBJC_CLASS___NSNumber, v177);
  uint64_t v180 = objc_opt_class(&OBJC_CLASS___NSString, v179);
  uint64_t v182 = objc_opt_class(&OBJC_CLASS___W5Peer, v181);
  uint64_t v184 = objc_opt_class(&OBJC_CLASS___W5DiagnosticsTestRequest, v183);
  uint64_t v186 = objc_opt_class(&OBJC_CLASS___W5LogItemRequest, v185);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v174,  v176,  v178,  v180,  v182,  v184,  v186,  objc_opt_class(&OBJC_CLASS___NSURL, v187),  0LL),  "collectLogsDiagnosticMode:uuid:reply:",  0LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSUUID, v188), 0LL),  "collectLogsDiagnosticMode:uuid:reply:",  1LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError, v189), 0LL),  "collectLogsDiagnosticMode:uuid:reply:",  0LL,  1LL);
  uint64_t v191 = objc_opt_class(&OBJC_CLASS___NSArray, v190);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v191,  objc_opt_class(&OBJC_CLASS___W5LogItemReceipt, v192),  0LL),  "collectLogsDiagnosticMode:uuid:reply:",  1LL,  1LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSURL, v193), 0LL),  "collectLogsDiagnosticMode:uuid:reply:",  2LL,  1LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  objc_opt_class(&OBJC_CLASS___W5PeerDiscoveryConfiguration, v194),  0LL),  "startPeerDiscoveryWithConfiguration:uuid:reply:",  0LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSUUID, v195), 0LL),  "startPeerDiscoveryWithConfiguration:uuid:reply:",  1LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError, v196), 0LL),  "startPeerDiscoveryWithConfiguration:uuid:reply:",  0LL,  1LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSUUID, v197), 0LL),  "stopPeerDiscoveryWithUUID:reply:",  0LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError, v198), 0LL),  "stopPeerDiscoveryWithUUID:reply:",  0LL,  1LL);
  uint64_t v200 = objc_opt_class(&OBJC_CLASS___NSArray, v199);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v200,  objc_opt_class(&OBJC_CLASS___W5WiFiChannel, v201),  0LL),  "runWiFiSnifferOnChannels:duration:peer:uuid:reply:",  0LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___W5Peer, v202), 0LL),  "runWiFiSnifferOnChannels:duration:peer:uuid:reply:",  2LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSUUID, v203), 0LL),  "runWiFiSnifferOnChannels:duration:peer:uuid:reply:",  3LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError, v204), 0LL),  "runWiFiSnifferOnChannels:duration:peer:uuid:reply:",  0LL,  1LL);
  uint64_t v206 = objc_opt_class(&OBJC_CLASS___NSDictionary, v205);
  uint64_t v208 = objc_opt_class(&OBJC_CLASS___W5WiFiChannel, v207);
  uint64_t v210 = objc_opt_class(&OBJC_CLASS___NSError, v209);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v206,  v208,  v210,  objc_opt_class(&OBJC_CLASS___NSNull, v211),  0LL),  "runWiFiSnifferOnChannels:duration:peer:uuid:reply:",  1LL,  1LL);
  uint64_t v213 = objc_opt_class(&OBJC_CLASS___NSDictionary, v212);
  uint64_t v215 = objc_opt_class(&OBJC_CLASS___W5WiFiChannel, v214);
  uint64_t v217 = objc_opt_class(&OBJC_CLASS___NSURL, v216);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v213,  v215,  v217,  objc_opt_class(&OBJC_CLASS___NSNull, v218),  0LL),  "runWiFiSnifferOnChannels:duration:peer:uuid:reply:",  2LL,  1LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSUUID, v219), 0LL),  "runWiFiSnifferOnChannels:duration:peer:uuid:reply:",  3LL,  1LL);
  uint64_t v221 = objc_opt_class(&OBJC_CLASS___NSArray, v220);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v221,  objc_opt_class(&OBJC_CLASS___W5WiFiChannel, v222),  0LL),  "runWiFiSnifferWithTCPDumpOnChannels:duration:peer:uuid:reply:",  0LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___W5Peer, v223), 0LL),  "runWiFiSnifferWithTCPDumpOnChannels:duration:peer:uuid:reply:",  2LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSUUID, v224), 0LL),  "runWiFiSnifferWithTCPDumpOnChannels:duration:peer:uuid:reply:",  3LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError, v225), 0LL),  "runWiFiSnifferWithTCPDumpOnChannels:duration:peer:uuid:reply:",  0LL,  1LL);
  uint64_t v227 = objc_opt_class(&OBJC_CLASS___NSArray, v226);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v227,  objc_opt_class(&OBJC_CLASS___NSURL, v228),  0LL),  "runWiFiSnifferWithTCPDumpOnChannels:duration:peer:uuid:reply:",  1LL,  1LL);
  uint64_t v230 = objc_opt_class(&OBJC_CLASS___NSDictionary, v229);
  uint64_t v232 = objc_opt_class(&OBJC_CLASS___NSArray, v231);
  uint64_t v234 = objc_opt_class(&OBJC_CLASS___NSNumber, v233);
  uint64_t v236 = objc_opt_class(&OBJC_CLASS___NSString, v235);
  uint64_t v238 = objc_opt_class(&OBJC_CLASS___W5Peer, v237);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v230,  v232,  v234,  v236,  v238,  objc_opt_class(&OBJC_CLASS___NSURL, v239),  0LL),  "runWiFiPerformanceLoggingWithConfiguration:uuid:reply:",  0LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSUUID, v240), 0LL),  "runWiFiPerformanceLoggingWithConfiguration:uuid:reply:",  1LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError, v241), 0LL),  "runWiFiPerformanceLoggingWithConfiguration:uuid:reply:",  0LL,  1LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSUUID, v242), 0LL),  "cancelRequestWithUUID:reply:",  0LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError, v243), 0LL),  "cancelRequestWithUUID:reply:",  0LL,  1LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSUUID, v244), 0LL),  "cancelRequestWithUUID:OnPeer:OfType:reply:",  0LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___W5Peer, v245), 0LL),  "cancelRequestWithUUID:OnPeer:OfType:reply:",  1LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSNumber, v246), 0LL),  "cancelRequestWithUUID:OnPeer:OfType:reply:",  2LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError, v247), 0LL),  "cancelRequestWithUUID:OnPeer:OfType:reply:",  0LL,  1LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError, v248), 0LL),  "cancelAllRequestsAndReply:",  0LL,  1LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError, v249), 0LL),  "log:timestamp:reply:",  0LL,  1LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___W5Peer, v250), 0LL),  "startMonitoringFaultEventsForPeer:reply:",  0LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError, v251), 0LL),  "startMonitoringFaultEventsForPeer:reply:",  0LL,  1LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___W5Peer, v252), 0LL),  "stopMonitoringFaultEventsForPeer:reply:",  0LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError, v253), 0LL),  "stopMonitoringFaultEventsForPeer:reply:",  0LL,  1LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___W5Event, v254), 0LL),  "submitFaultEvent:reply:",  0LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError, v255), 0LL),  "submitFaultEvent:reply:",  0LL,  1LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___W5Peer, v256), 0LL),  "queryFaultEventCacheForPeer:reply:",  0LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError, v257), 0LL),  "queryFaultEventCacheForPeer:reply:",  0LL,  1LL);
  uint64_t v259 = objc_opt_class(&OBJC_CLASS___NSArray, v258);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v259,  objc_opt_class(&OBJC_CLASS___W5Event, v260),  0LL),  "queryFaultEventCacheForPeer:reply:",  1LL,  1LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___W5Peer, v261), 0LL),  "queryDatabaseForPeer:fetch:reply:",  0LL,  0LL);
  uint64_t v263 = objc_opt_class(&OBJC_CLASS___NSFetchRequest, v262);
  uint64_t v265 = objc_opt_class(&OBJC_CLASS___NSDate, v264);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v263,  v265,  objc_opt_class(&OBJC_CLASS___NSSet, v266),  0LL),  "queryDatabaseForPeer:fetch:reply:",  1LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError, v267), 0LL),  "queryDatabaseForPeer:fetch:reply:",  0LL,  1LL);
  uint64_t v269 = objc_opt_class(&OBJC_CLASS___NSDate, v268);
  uint64_t v271 = objc_opt_class(&OBJC_CLASS___NSArray, v270);
  uint64_t v273 = objc_opt_class(&OBJC_CLASS___NSDictionary, v272);
  uint64_t v275 = objc_opt_class(&OBJC_CLASS___NSNumber, v274);
  uint64_t v277 = objc_opt_class(&OBJC_CLASS___NSString, v276);
  uint64_t v279 = objc_opt_class(&OBJC_CLASS___NSUUID, v278);
  uint64_t v281 = objc_opt_class(&OBJC_CLASS___NSMutableSet, v280);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v269,  v271,  v273,  v275,  v277,  v279,  v281,  objc_opt_class(&OBJC_CLASS___NSNull, v282),  0LL),  "queryDatabaseForPeer:fetch:reply:",  1LL,  1LL);
  return v0;
}

NSXPCInterface *sub_100031DAC()
{
  v0 = +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___W5XPCEventDelegate);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___W5Event, v1), 0LL),  "receivedEvent:",  0LL,  0LL);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v0,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  objc_opt_class(&OBJC_CLASS___W5PeerDiscoveryEvent, v2),  0LL),  "receivedPeerDiscoveryEvent:",  0LL,  0LL);
  return v0;
}

id sub_100031F6C(uint64_t a1)
{
  id v2 = objc_msgSend(objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "corewifi"), "networkName");
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = objc_msgSend(v3, "__initialTests");
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  _DWORD v6[2] = sub_100031FFC;
  v6[3] = &unk_1000D23F0;
  v6[4] = *(void *)(a1 + 32);
  v6[5] = v2;
  return objc_msgSend(v3, "__runDiagnosticsTests:reply:", v4, v6);
}

void sub_100031FFC(uint64_t a1, uint64_t a2)
{
  block[0] = _NSConcreteStackBlock;
  __int128 v2 = *(_OWORD *)(a1 + 32);
  uint64_t v3 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 8LL);
  block[1] = 3221225472LL;
  block[2] = sub_10003205C;
  block[3] = &unk_1000D23C8;
  uint64_t v6 = a2;
  __int128 v5 = v2;
  dispatch_async(v3, block);
}

void sub_10003205C(uint64_t a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  if (*(_BYTE *)(*(void *)(a1 + 32) + 48LL))
  {
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    uint64_t v3 = *(void *)(a1 + 32);
    if (v4 - *(double *)(v3 + 56) > 0.0)
    {
      uint64_t v5 = *(void *)(a1 + 48);
      if (v5 < 1)
      {
        *(void *)(v3 + 64) = v5;
        uint64_t v9 = *(dispatch_source_s **)(*(void *)(a1 + 32) + 40LL);
        dispatch_time_t v10 = dispatch_time(0LL, 10000000000LL);
        dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0LL);
      }

      else
      {
        dispatch_time_t v6 = dispatch_time(0LL, 2000000000LL);
        v11[0] = _NSConcreteStackBlock;
        __int128 v7 = *(_OWORD *)(a1 + 32);
        uint64_t v8 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 8LL);
        v11[1] = 3221225472LL;
        v11[2] = sub_100032154;
        v11[3] = &unk_1000D1BA8;
        __int128 v12 = v7;
        dispatch_after(v6, v8, v11);
      }
    }
  }

  objc_autoreleasePoolPop(v2);
}

void sub_100032154(uint64_t a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  if (*(_BYTE *)(*(void *)(a1 + 32) + 48LL))
  {
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    uint64_t v3 = *(double **)(a1 + 32);
    if (v4 - v3[7] > 0.0)
    {
      id v5 = objc_msgSend(*(id *)(a1 + 32), "__followupTests");
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472LL;
      _DWORD v6[2] = sub_100032208;
      v6[3] = &unk_1000D23F0;
      __int128 v7 = *(_OWORD *)(a1 + 32);
      objc_msgSend(v3, "__runDiagnosticsTests:reply:", v5, v6);
    }
  }

  objc_autoreleasePoolPop(v2);
}

void sub_100032208(uint64_t a1, uint64_t a2)
{
  block[0] = _NSConcreteStackBlock;
  __int128 v2 = *(_OWORD *)(a1 + 32);
  uint64_t v3 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 8LL);
  block[1] = 3221225472LL;
  block[2] = sub_100032268;
  block[3] = &unk_1000D23C8;
  uint64_t v6 = a2;
  __int128 v5 = v2;
  dispatch_async(v3, block);
}

void sub_100032268(void *a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  if (*(_BYTE *)(a1[4] + 48LL))
  {
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    uint64_t v3 = a1[4];
    if (v4 - *(double *)(v3 + 56) > 0.0)
    {
      uint64_t v5 = a1[6];
      if (v5 >= 1 && v5 != *(void *)(v3 + 64))
      {
        id v6 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
        objc_msgSend( v6,  "setObject:forKeyedSubscript:",  objc_msgSend(objc_msgSend(*(id *)(a1[4] + 16), "wifi"), "interfaceName"),  @"InterfaceName");
        objc_msgSend( v6,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a1[6]),  @"WiFiDropReason");
        if (a1[5]) {
          id v7 = objc_msgSend( objc_msgSend(objc_msgSend(*(id *)(a1[4] + 24), "diagnosticsHistory"), "objectForKey:", a1[5]),  "allValues");
        }
        else {
          id v7 = 0LL;
        }
        [v6 setObject:v7 forKeyedSubscript:@"DiagnosticsTestResults"];
        uint64_t v8 = objc_alloc_init(&OBJC_CLASS___W5Event);
        -[W5Event setEventID:](v8, "setEventID:", 35LL);
        +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
        -[W5Event setTimestamp:](v8, "setTimestamp:");
        -[W5Event setInfo:](v8, "setInfo:", v6);
        uint64_t v3 = a1[4];
        uint64_t v9 = *(void *)(v3 + 72);
        if (v9)
        {
          (*(void (**)(uint64_t, W5Event *))(v9 + 16))(v9, v8);
          uint64_t v3 = a1[4];
        }
      }

      *(void *)(v3 + 64) = a1[6];
      dispatch_time_t v10 = *(dispatch_source_s **)(a1[4] + 40LL);
      dispatch_time_t v11 = dispatch_time(0LL, 10000000000LL);
      dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    }
  }

  objc_autoreleasePoolPop(v2);
}

void sub_100032534(uint64_t a1)
{
  __int128 v2 = objc_autoreleasePoolPush();

  *(void *)(*(void *)(a1 + 32) + 72) = [*(id *)(a1 + 40) copy];
  objc_autoreleasePoolPop(v2);
}

void sub_10003262C(uint64_t a1, uint64_t a2, void *a3)
{
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v17 = a1;
    uint64_t v7 = 7LL;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0LL; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(a3);
        }
        dispatch_time_t v10 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        if ((objc_msgSend(v10, "didPass", v17) & 1) == 0)
        {
          id v11 = [v10 testID];
          switch((unint64_t)v11)
          {
            case 3uLL:
              BOOL v12 = v7 < 2;
              uint64_t v13 = 2LL;
              goto LABEL_12;
            case 4uLL:
            case 5uLL:
            case 8uLL:
            case 0xAuLL:
              continue;
            case 6uLL:
              BOOL v12 = v7 < 3;
              uint64_t v13 = 3LL;
LABEL_12:
              if (!v12) {
                uint64_t v7 = v13;
              }
              break;
            case 7uLL:
              if (v7 >= 5) {
                uint64_t v7 = 5LL;
              }
              break;
            case 9uLL:
              if (v7 >= 4) {
                uint64_t v7 = 4LL;
              }
              break;
            case 0xBuLL:
              if (v7 >= 6) {
                uint64_t v7 = 6LL;
              }
              break;
            default:
              if (v11 == (id)52) {
                uint64_t v7 = 1LL;
              }
              break;
          }
        }
      }

      id v6 = [a3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v6);
    if (v7 >= 7) {
      uint64_t v14 = 0LL;
    }
    else {
      uint64_t v14 = v7;
    }
    a1 = v17;
  }

  else
  {
    uint64_t v14 = 0LL;
  }

  uint64_t v15 = *(void *)(a1 + 40);
  uint64_t v16 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 8LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003280C;
  block[3] = &unk_1000D2418;
  void block[5] = v15;
  void block[6] = v14;
  void block[4] = a3;
  dispatch_async(v16, block);
}

void sub_10003280C(void *a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  uint64_t v3 = a1[5];
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, a1[6], a1[4]);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_100032A98(uint64_t a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v3 + 48))
  {
    *(_BYTE *)(v3 + 4_Block_object_dispose(va, 8) = 1;
    double v4 = *(dispatch_source_s **)(*(void *)(a1 + 32) + 40LL);
    if (v4) {
      dispatch_source_set_timer(v4, 0LL, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    }
  }

  objc_autoreleasePoolPop(v2);
}

void sub_100032B48(uint64_t a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v3 + 48))
  {
    *(_BYTE *)(v3 + 4_Block_object_dispose(va, 8) = 0;
    double v4 = *(dispatch_source_s **)(*(void *)(a1 + 32) + 40LL);
    if (v4) {
      dispatch_source_set_timer(v4, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    }
  }

  objc_autoreleasePoolPop(v2);
}

void sub_100032BF4(uint64_t a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  uint64_t v3 = *(void *)(a1 + 32);
  double v4 = *(dispatch_source_s **)(v3 + 40);
  if (v4)
  {
    dispatch_source_set_timer(v4, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    uint64_t v3 = *(void *)(a1 + 32);
  }

  *(void *)(v3 + 56) = 0x7FEFFFFFFFFFFFFFLL;
  objc_autoreleasePoolPop(v2);
}

void sub_100032CA0(uint64_t a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v3 + 48))
  {
    double v4 = *(double *)(v3 + 56);
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    double v5 = *(double *)(a1 + 40);
    if (v4 > v6 + v5)
    {
      uint64_t v7 = *(dispatch_source_s **)(*(void *)(a1 + 32) + 40LL);
      if (v7)
      {
        dispatch_time_t v8 = dispatch_time(0LL, (uint64_t)((v5 + 1.0) * 1000000000.0));
        dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0LL);
      }

      +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
      *(double *)(*(void *)(a1 + 32) + 56LL) = v9 + *(double *)(a1 + 40);
    }
  }

  objc_autoreleasePoolPop(v2);
}

void sub_1000333C0(uint64_t a1)
{
  __int128 v2 = objc_autoreleasePoolPush();

  *(void *)(*(void *)(a1 + 32) + 32) = [*(id *)(a1 + 40) copy];
  objc_autoreleasePoolPop(v2);
}

void sub_10003348C(uint64_t a1)
{
  __int128 v2 = objc_autoreleasePoolPush();

  *(void *)(*(void *)(a1 + 32) + 40) = [*(id *)(a1 + 40) copy];
  objc_autoreleasePoolPop(v2);
}

void sub_100033584(uint64_t a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v3 + 24))
  {
    *(_BYTE *)(v3 + 24) = 1;
    id v4 = *(id *)(a1 + 32);
    int out_token = 0;
    uint64_t v5 = *(void *)(a1 + 32);
    double v6 = *(dispatch_queue_s **)(v5 + 8);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100033680;
    handler[3] = &unk_1000D2468;
    handler[4] = v5;
    notify_register_dispatch("com.apple.system.powersources.source", &out_token, v6, handler);
    *(_DWORD *)(*(void *)(a1 + 32) + 16LL) = out_token;
    uint64_t v7 = *(void *)(a1 + 32);
    dispatch_time_t v8 = *(dispatch_queue_s **)(v7 + 8);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100033864;
    v9[3] = &unk_1000D2468;
    void v9[4] = v7;
    notify_register_dispatch("com.apple.system.powersources.lowbattery", &out_token, v8, v9);
    *(_DWORD *)(*(void *)(a1 + 32) + 20LL) = out_token;
  }

  objc_autoreleasePoolPop(v2);
}

void sub_100033680(uint64_t a1)
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000336EC;
  block[3] = &unk_1000D1BF8;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(global_queue, block);
}

void sub_1000336EC(uint64_t a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___W5Event);
  -[W5Event setEventID:](v3, "setEventID:", 15LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5Event setTimestamp:](v3, "setTimestamp:");
  v5[0] = @"PowerSourceType";
  v6[0] = +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [*(id *)(a1 + 32) powerSourceType]);
  v5[1] = @"BatteryEstimatedTime";
  [*(id *)(a1 + 32) estimatedTimeRemaining];
  v6[1] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  v5[2] = @"BatteryLevel";
  [*(id *)(a1 + 32) internalBatteryLevel];
  _DWORD v6[2] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  v5[3] = @"BatteryWarningLevel";
  v6[3] = +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [*(id *)(a1 + 32) batteryWarningLevel]);
  -[W5Event setInfo:]( v3,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v6,  v5,  4LL));
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 32LL);
  if (v4) {
    (*(void (**)(uint64_t, W5Event *))(v4 + 16))(v4, v3);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_100033864(uint64_t a1)
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000338D0;
  block[3] = &unk_1000D1BF8;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(global_queue, block);
}

void sub_1000338D0(uint64_t a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___W5Event);
  -[W5Event setEventID:](v3, "setEventID:", 17LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5Event setTimestamp:](v3, "setTimestamp:");
  v5[0] = @"PowerSourceType";
  v6[0] = +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [*(id *)(a1 + 32) powerSourceType]);
  v5[1] = @"BatteryEstimatedTime";
  [*(id *)(a1 + 32) estimatedTimeRemaining];
  v6[1] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  v5[2] = @"BatteryLevel";
  [*(id *)(a1 + 32) internalBatteryLevel];
  _DWORD v6[2] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  v5[3] = @"BatteryWarningLevel";
  v6[3] = +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [*(id *)(a1 + 32) batteryWarningLevel]);
  -[W5Event setInfo:]( v3,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v6,  v5,  4LL));
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 40LL);
  if (v4) {
    (*(void (**)(uint64_t, W5Event *))(v4 + 16))(v4, v3);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_100033AA0(uint64_t a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v3 + 24))
  {
    *(_BYTE *)(v3 + 24) = 0;
    notify_cancel(*(_DWORD *)(*(void *)(a1 + 32) + 16LL));
    notify_cancel(*(_DWORD *)(*(void *)(a1 + 32) + 20LL));
  }

  objc_autoreleasePoolPop(v2);
}

void sub_100033CD8(uint64_t a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  *(CFTimeInterval *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = IOPSGetTimeRemainingEstimate();
  objc_autoreleasePoolPop(v2);
}

void sub_100033DA0(uint64_t a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  uint64_t v3 = (__CFString *)IOPSGetProvidingPowerSourceType(0LL);
  if ((-[__CFString isEqualToString:](v3, "isEqualToString:", @"AC Power") & 1) != 0)
  {
    uint64_t v4 = 1LL;
LABEL_7:
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v4;
    goto LABEL_8;
  }

  if ((-[__CFString isEqualToString:](v3, "isEqualToString:", @"Battery Power") & 1) != 0)
  {
    uint64_t v4 = 2LL;
    goto LABEL_7;
  }

  if (-[__CFString isEqualToString:](v3, "isEqualToString:", @"UPS Power"))
  {
    uint64_t v4 = 3LL;
    goto LABEL_7;
  }

LABEL_8:
  objc_autoreleasePoolPop(v2);
}

    double v9 = 0LL;
  }

  return v5;
}

  return v5;
}

void sub_100033EC4(uint64_t a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = IOPSGetBatteryWarningLevel();
  objc_autoreleasePoolPop(v2);
}

void sub_100034038(uint64_t a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___W5DebugConfiguration);
  uint64_t v50 = 0LL;
  uint64_t v51 = &v50;
  uint64_t v52 = 0x3052000000LL;
  uint64_t v53 = sub_1000347BC;
  uint64_t v54 = sub_1000347CC;
  uint64_t v55 = 0LL;
  uint64_t v46 = 0LL;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x2020000000LL;
  char v49 = 0;
  uint64_t v40 = 0LL;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x3052000000LL;
  uint64_t v43 = sub_1000347BC;
  uint64_t v44 = sub_1000347CC;
  uint64_t v45 = 0LL;
  uint64_t v4 = dispatch_semaphore_create(0LL);
  uint64_t v5 = *(void **)(a1 + 32);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_1000347D8;
  v39[3] = &unk_1000D1948;
  v39[5] = &v50;
  v39[6] = &v46;
  void v39[4] = v4;
  [v5 queryWiFiDebugLoggingAndReply:v39];
  dispatch_time_t v6 = dispatch_time(0LL, 4000000000LL);
  if (dispatch_semaphore_wait(v4, v6) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v57 = 0x4010000000000000LL;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing",  buf,  0xCu);
  }

  dispatch_time_t v8 = v51;
  double v9 = (void *)v51[5];
  if (v9) {
    goto LABEL_48;
  }
  if (*((_BYTE *)v47 + 24)) {
    uint64_t v10 = 1LL;
  }
  else {
    uint64_t v10 = -1LL;
  }
  id v11 = *(void **)(a1 + 32);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_10003481C;
  v38[3] = &unk_1000D1948;
  v38[6] = &v46;
  v38[4] = v4;
  v38[5] = &v50;
  objc_msgSend(v11, "__queryMegaWiFiProfileInstalledAndReply:", v38);
  dispatch_time_t v12 = dispatch_time(0LL, 4000000000LL);
  if (dispatch_semaphore_wait(v4, v12) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v57 = 0x4010000000000000LL;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing",  buf,  0xCu);
  }

  dispatch_time_t v8 = v51;
  double v9 = (void *)v51[5];
  if (v9) {
    goto LABEL_48;
  }
  if (*((_BYTE *)v47 + 24)) {
    uint64_t v13 = 1LL;
  }
  else {
    uint64_t v13 = -1LL;
  }
  uint64_t v14 = *(void **)(a1 + 32);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_100034860;
  v37[3] = &unk_1000D1948;
  v37[6] = &v46;
  v37[4] = v4;
  v37[5] = &v50;
  objc_msgSend(v14, "__queryNoLoggingWiFiProfileInstalledAndReply:", v37);
  dispatch_time_t v15 = dispatch_time(0LL, 4000000000LL);
  if (dispatch_semaphore_wait(v4, v15) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v57 = 0x4010000000000000LL;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing",  buf,  0xCu);
  }

  dispatch_time_t v8 = v51;
  double v9 = (void *)v51[5];
  if (v9) {
    goto LABEL_48;
  }
  if (*((_BYTE *)v47 + 24)) {
    uint64_t v16 = 1LL;
  }
  else {
    uint64_t v16 = -1LL;
  }
  uint64_t v17 = *(void **)(a1 + 32);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_1000348A4;
  v36[3] = &unk_1000D1948;
  v36[6] = &v46;
  v36[4] = v4;
  v36[5] = &v50;
  [v17 queryEAPOLDebugLoggingAndReply:v36];
  dispatch_time_t v18 = dispatch_time(0LL, 4000000000LL);
  if (dispatch_semaphore_wait(v4, v18) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v57 = 0x4010000000000000LL;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing",  buf,  0xCu);
  }

  dispatch_time_t v8 = v51;
  double v9 = (void *)v51[5];
  if (v9) {
    goto LABEL_48;
  }
  if (*((_BYTE *)v47 + 24)) {
    uint64_t v19 = 1LL;
  }
  else {
    uint64_t v19 = -1LL;
  }
  __int128 v20 = *(void **)(a1 + 32);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_1000348E8;
  v35[3] = &unk_1000D1948;
  v35[6] = &v46;
  v35[4] = v4;
  v35[5] = &v50;
  [v20 queryBluetoothDebugLoggingAndReply:v35];
  dispatch_time_t v21 = dispatch_time(0LL, 4000000000LL);
  if (dispatch_semaphore_wait(v4, v21) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v57 = 0x4010000000000000LL;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing",  buf,  0xCu);
  }

  dispatch_time_t v8 = v51;
  double v9 = (void *)v51[5];
  if (v9) {
    goto LABEL_48;
  }
  if (*((_BYTE *)v47 + 24)) {
    uint64_t v22 = 1LL;
  }
  else {
    uint64_t v22 = -1LL;
  }
  uint64_t v23 = *(void **)(a1 + 32);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_10003492C;
  v34[3] = &unk_1000D1948;
  v34[5] = &v50;
  v34[6] = &v46;
  v34[4] = v4;
  [v23 querySTBCAndReply:v34];
  dispatch_time_t v24 = dispatch_time(0LL, 4000000000LL);
  if (dispatch_semaphore_wait(v4, v24) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v57 = 0x4010000000000000LL;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing",  buf,  0xCu);
  }

  dispatch_time_t v8 = v51;
  double v9 = (void *)v51[5];
  if (v9) {
    goto LABEL_48;
  }
  uint64_t v25 = *((_BYTE *)v47 + 24) ? 1LL : -1LL;
  uint64_t v26 = *(void **)(a1 + 32);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100034970;
  v33[3] = &unk_1000D2490;
  v33[6] = &v40;
  v33[4] = v4;
  v33[5] = &v50;
  [v26 queryDiagnosticsModeAndReply:v33];
  dispatch_time_t v27 = dispatch_time(0LL, 4000000000LL);
  if (dispatch_semaphore_wait(v4, v27) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v57 = 0x4010000000000000LL;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing",  buf,  0xCu);
  }

  dispatch_time_t v8 = v51;
  double v9 = (void *)v51[5];
  if (v9
    || (uint64_t v28 = objc_alloc(&OBJC_CLASS___W5DebugConfiguration),
        id v7 =  -[W5DebugConfiguration initDiagnosticsMode:wifiState:megaWiFiProfileState:noLoggingWiFiProfileState:eapolState:bluetoothState:stbcState:]( v28,  "initDiagnosticsMode:wifiState:megaWiFiProfileState:noLoggingWiFiProfileState:eapolState:bluetoothState:stbcState:",  v41[5],  v10,  v13,  v16,  v19,  v22,  v25),  v8 = v51,  (v9 = (void *)v51[5]) != 0LL))
  {
LABEL_48:
    uint64_t v29 = *(void *)(a1 + 40);
    if (v29)
    {
      id v30 = objc_msgSend(v9, "copy", v7);
      id v7 = 0LL;
LABEL_52:
      (*(void (**)(uint64_t, id, id))(v29 + 16))(v29, v30, v7);
      dispatch_time_t v8 = v51;
    }
  }

  else
  {
    uint64_t v29 = *(void *)(a1 + 40);
    if (v29)
    {
      id v30 = 0LL;
      goto LABEL_52;
    }
  }

  id v31 = (id)v8[5];
  id v32 = (id)v41[5];
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);
  objc_autoreleasePoolPop(v2);
}

void sub_100034784( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
}

void sub_1000347BC(uint64_t a1, uint64_t a2)
{
}

void sub_1000347CC(uint64_t a1)
{
}

uint64_t sub_1000347D8(uint64_t a1, void *a2, char a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_10003481C(uint64_t a1, void *a2, char a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_100034860(uint64_t a1, void *a2, char a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_1000348A4(uint64_t a1, void *a2, char a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_1000348E8(uint64_t a1, void *a2, char a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_10003492C(uint64_t a1, void *a2, char a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_100034970(uint64_t a1, void *a2, void *a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100034B74( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100034B98(uint64_t a1, void *a2, void *a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [a3 copy];
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100034C40(uint64_t a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  uint64_t v36 = 0LL;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3052000000LL;
  uint64_t v39 = sub_1000347BC;
  uint64_t v40 = sub_1000347CC;
  uint64_t v41 = 0LL;
  uint64_t v3 = dispatch_semaphore_create(0LL);
  if (![*(id *)(a1 + 32) wifi]) {
    goto LABEL_40;
  }
  uint64_t v4 = *(void **)(a1 + 40);
  BOOL v5 = [*(id *)(a1 + 32) wifi] == (id)1;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_10003537C;
  v35[3] = &unk_1000D24E0;
  v35[4] = v3;
  v35[5] = &v36;
  [v4 setWiFiDebugLoggingEnabled:v5 reply:v35];
  dispatch_time_t v6 = dispatch_time(0LL, 4000000000LL);
  if (dispatch_semaphore_wait(v3, v6) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v43 = 0x4010000000000000LL;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing",  buf,  0xCu);
  }

  if (!v37[5])
  {
LABEL_40:
    if (![*(id *)(a1 + 32) megaWiFiProfile]) {
      goto LABEL_41;
    }
    id v7 = *(void **)(a1 + 40);
    BOOL v8 = [*(id *)(a1 + 32) megaWiFiProfile] == (id)1;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_1000353B0;
    v34[3] = &unk_1000D24E0;
    v34[4] = v3;
    v34[5] = &v36;
    objc_msgSend(v7, "__setMegaWiFiProfileInstalled:reply:", v8, v34);
    dispatch_time_t v9 = dispatch_time(0LL, 4000000000LL);
    if (dispatch_semaphore_wait(v3, v9) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      uint64_t v43 = 0x4010000000000000LL;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing",  buf,  0xCu);
    }

    if (!v37[5])
    {
LABEL_41:
      if (![*(id *)(a1 + 32) noLoggingWiFiProfile]) {
        goto LABEL_42;
      }
      uint64_t v10 = *(void **)(a1 + 40);
      BOOL v11 = [*(id *)(a1 + 32) noLoggingWiFiProfile] == (id)1;
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_1000353E4;
      v33[3] = &unk_1000D24E0;
      v33[4] = v3;
      v33[5] = &v36;
      objc_msgSend(v10, "__setNoLoggingWiFiProfileInstalled:reply:", v11, v33);
      dispatch_time_t v12 = dispatch_time(0LL, 4000000000LL);
      if (dispatch_semaphore_wait(v3, v12) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349056;
        uint64_t v43 = 0x4010000000000000LL;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing",  buf,  0xCu);
      }

      if (!v37[5])
      {
LABEL_42:
        if (![*(id *)(a1 + 32) eapol]) {
          goto LABEL_43;
        }
        uint64_t v13 = *(void **)(a1 + 40);
        BOOL v14 = [*(id *)(a1 + 32) eapol] == (id)1;
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472LL;
        v32[2] = sub_100035418;
        v32[3] = &unk_1000D24E0;
        v32[4] = v3;
        v32[5] = &v36;
        [v13 setEAPOLDebugLoggingEnabled:v14 reply:v32];
        dispatch_time_t v15 = dispatch_time(0LL, 4000000000LL);
        if (dispatch_semaphore_wait(v3, v15) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134349056;
          uint64_t v43 = 0x4010000000000000LL;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing",  buf,  0xCu);
        }

        if (!v37[5])
        {
LABEL_43:
          if ([*(id *)(a1 + 32) bluetooth])
          {
            uint64_t v16 = *(void **)(a1 + 40);
            BOOL v17 = [*(id *)(a1 + 32) bluetooth] == (id)1;
            v31[0] = _NSConcreteStackBlock;
            v31[1] = 3221225472LL;
            v31[2] = sub_10003544C;
            v31[3] = &unk_1000D24E0;
            v31[4] = v3;
            v31[5] = &v36;
            [v16 setBluetoothDebugLoggingEnabled:v17 reply:v31];
            dispatch_time_t v18 = dispatch_time(0LL, 4000000000LL);
            if (dispatch_semaphore_wait(v3, v18) >= 1
              && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134349056;
              uint64_t v43 = 0x4010000000000000LL;
              _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing",  buf,  0xCu);
            }
          }

          if ([*(id *)(a1 + 32) stbc])
          {
            uint64_t v19 = *(void **)(a1 + 40);
            BOOL v20 = [*(id *)(a1 + 32) stbc] == (id)1;
            v30[0] = _NSConcreteStackBlock;
            v30[1] = 3221225472LL;
            v30[2] = sub_100035480;
            v30[3] = &unk_1000D24E0;
            v30[4] = v3;
            v30[5] = &v36;
            [v19 setSTBCEnabled:v20 reply:v30];
            dispatch_time_t v21 = dispatch_time(0LL, 4000000000LL);
            if (dispatch_semaphore_wait(v3, v21) >= 1
              && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134349056;
              uint64_t v43 = 0x4010000000000000LL;
              _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing",  buf,  0xCu);
            }
          }

          uint64_t v22 = (os_log_s *)sub_10008C90C();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            id v23 = [*(id *)(a1 + 32) diagnosticsMode];
            *(_DWORD *)buf = 136315906;
            uint64_t v43 = (uint64_t)"-[W5DebugManager setDebugConfiguration:reply:]_block_invoke";
            __int16 v44 = 2080;
            uint64_t v45 = "W5DebugManager.m";
            __int16 v46 = 1024;
            int v47 = 342;
            __int16 v48 = 2114;
            id v49 = v23;
            int v28 = 38;
            _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v22,  0LL,  "[wifivelocity] %s (%s:%u) diagnosticsMode='%{public}@'",  buf,  v28);
          }

          if ([*(id *)(a1 + 32) diagnosticsMode])
          {
            dispatch_time_t v24 = *(void **)(a1 + 40);
            id v25 = [*(id *)(a1 + 32) diagnosticsMode];
            v29[0] = _NSConcreteStackBlock;
            v29[1] = 3221225472LL;
            v29[2] = sub_1000354B4;
            v29[3] = &unk_1000D24E0;
            v29[4] = v3;
            v29[5] = &v36;
            [v24 setDiagnosticsMode:v25 reply:v29];
            dispatch_time_t v26 = dispatch_time(0LL, 4000000000LL);
            if (dispatch_semaphore_wait(v3, v26) >= 1
              && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134349056;
              uint64_t v43 = 0x4010000000000000LL;
              _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing",  buf,  0xCu);
            }
          }
        }
      }
    }
  }

  uint64_t v27 = *(void *)(a1 + 48);
  if (v27) {
    (*(void (**)(uint64_t, id))(v27 + 16))(v27, [(id)v37[5] copy]);
  }
  _Block_object_dispose(&v36, 8);
  objc_autoreleasePoolPop(v2);
}

void sub_100035354(_Unwind_Exception *a1)
{
}

uint64_t sub_10003537C(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_1000353B0(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_1000353E4(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_100035418(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_10003544C(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_100035480(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_1000354B4(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100035640(uint64_t a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  id v3 = [*(id *)(*(void *)(a1 + 32) + 16) activeDiagnostics];
  if (v3) {
    id v4 = [v3 firstObject];
  }
  else {
    id v4 = 0LL;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0LL, v4);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_100035718(void *a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  uint64_t v3 = a1[5];
  id v4 = *(void **)(a1[4] + 16LL);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100035790;
  v5[3] = &unk_1000D1B58;
  void v5[4] = a1[6];
  [v4 updateDiagnosticsMode:v3 reply:v5];
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_100035790(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100035A38(uint64_t a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  uint64_t v3 = (const void *)WiFiManagerClientCreate(kCFAllocatorDefault, 0LL);
  id v4 = (const __CFBoolean *)WiFiManagerClientCopyProperty(v3, kWiFiLoggingFileEnabledKey);
  if (v4)
  {
    uint64_t v5 = v4;
    BOOL v6 = CFBooleanGetValue(v4) != 0;
    CFRelease(v5);
  }

  else
  {
    BOOL v6 = 0;
  }

  id v7 =  [[OSLogPreferencesSubsystem alloc] initWithName:@"com.apple.WiFiManager"];
  if (!v6 || (BOOL v8 = v7, [v7 effectiveEnabledLevel] != (id)4))
  {
    BOOL v9 = 0LL;
    if (!v3) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  BOOL v9 = [v8 effectivePersistedLevel] == (id)4;
  if (v3) {
LABEL_9:
  }
    CFRelease(v3);
LABEL_10:
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, void, BOOL))(v10 + 16))(v10, 0LL, v9);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_100035BA8(uint64_t a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  uint64_t v3 = WiFiManagerClientCreate(kCFAllocatorDefault, 0LL);
  id v4 = (const void *)v3;
  uint64_t v5 = &kCFBooleanTrue;
  if (!*(_BYTE *)(a1 + 48)) {
    uint64_t v5 = &kCFBooleanFalse;
  }
  WiFiManagerClientSetProperty(v3, kWiFiLoggingFileEnabledKey, *v5);
  id v6 =  [[OSLogPreferencesSubsystem alloc] initWithName:@"com.apple.WiFiManager"];
  id v7 = v6;
  if (*(_BYTE *)(a1 + 48)) {
    uint64_t v8 = 4LL;
  }
  else {
    uint64_t v8 = 1LL;
  }
  [v6 setPersistedLevel:v8];
  if (*(_BYTE *)(a1 + 48)) {
    uint64_t v9 = 4LL;
  }
  else {
    uint64_t v9 = 1LL;
  }
  [v7 setEnabledLevel:v9];
  if (*(_BYTE *)(a1 + 48)) {
    uint64_t v10 = @"debug";
  }
  else {
    uint64_t v10 = @"inherit";
  }
  [*(id *)(a1 + 32) setOSLogPreferenceLevel:v10 enableOvserizeMessages:1 subsystem:@"com.apple.WiFiManager"];
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, void))(v11 + 16))(v11, 0LL);
  }
  if (v4) {
    CFRelease(v4);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_100035F30(uint64_t a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  id v3 = [[OSLogPreferencesSubsystem alloc] initWithName:@"com.apple.eapol"];
  BOOL v4 = objc_msgSend(*(id *)(a1 + 32), "__getEAPOLDebugFlagsEnabled")
    && [v3 effectiveEnabledLevel] == (id)4
    && [v3 effectivePersistedLevel] == (id)4;
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void, BOOL))(v5 + 16))(v5, 0LL, v4);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_100036044(uint64_t a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  id v3 = [[OSLogPreferencesSubsystem alloc] initWithName:@"com.apple.eapol"];
  BOOL v4 = v3;
  if (*(_BYTE *)(a1 + 48)) {
    uint64_t v5 = 4LL;
  }
  else {
    uint64_t v5 = 1LL;
  }
  [v3 setPersistedLevel:v5];
  if (*(_BYTE *)(a1 + 48)) {
    uint64_t v6 = 4LL;
  }
  else {
    uint64_t v6 = 1LL;
  }
  [v4 setEnabledLevel:v6];
  if (*(_BYTE *)(a1 + 48)) {
    id v7 = @"debug";
  }
  else {
    id v7 = @"inherit";
  }
  [*(id *)(a1 + 32) setOSLogPreferenceLevel:v7 enableOvserizeMessages:1 subsystem:@"com.apple.eapol"];
  uint64_t v9 = 0LL;
  objc_msgSend(*(id *)(a1 + 32), "__setEAPOLDebugFlagsEnabled:error:", *(unsigned __int8 *)(a1 + 48), &v9);
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, v9);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_1000361B0(uint64_t a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  id v3 = SCDynamicStoreKeyCreate(kCFAllocatorDefault, @"State:/Network/mDNSResponder/DebugState");
  if (v3)
  {
    BOOL v4 = v3;
    uint64_t v5 = (void *)SCDynamicStoreCopyValue(0LL, v3);
    if (v5)
    {
      uint64_t v6 = v5;
      id v7 = objc_msgSend(objc_msgSend(v5, "objectForKey:", @"VerboseLogging"), "BOOLValue");
      CFRelease(v6);
      uint64_t v8 = 0LL;
    }

    else
    {
      NSErrorUserInfoKey v10 = NSLocalizedFailureReasonErrorKey;
      uint64_t v11 = @"SCError()";
      uint64_t v8 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kCFErrorDomainSystemConfiguration,  SCError(),  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
      id v7 = 0LL;
    }

    CFRelease(v4);
  }

  else
  {
    NSErrorUserInfoKey v12 = NSLocalizedFailureReasonErrorKey;
    uint64_t v13 = @"SCError()";
    uint64_t v8 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kCFErrorDomainSystemConfiguration,  SCError(),  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
    id v7 = 0LL;
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, NSError *, id))(v9 + 16))(v9, v8, v7);
  }
  objc_autoreleasePoolPop(v2);
}

void *sub_1000363CC(void *result, uint64_t a2, int a3)
{
  if (*((unsigned __int8 *)result + 56) != a3)
  {
    BOOL v4 = (void *)result[4];
    uint64_t v3 = result[5];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100036434;
    v5[3] = &unk_1000D1B58;
    void v5[4] = result[6];
    return objc_msgSend(v4, "__toggleDNSLoggingWithQueue:reply:", v3, v5);
  }

  return result;
}

uint64_t sub_100036434(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100036618( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100036638(uint64_t a1, int a2, uint64_t a3)
{
  if (a2)
  {
    dispatch_io_close(*(dispatch_io_t *)(a1 + 32), 0LL);
    uint64_t v4 = *(void *)(a1 + 56);
    if (v4) {
      (*(void (**)(uint64_t, void))(v4 + 16))( v4,  *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL));
    }
  }

  else
  {
    uint64_t v6 = objc_autoreleasePoolPush();
    [*(id *)(a1 + 40) appendData:a3];
    id v7 = -[NSString componentsSeparatedByString:](  -[NSString initWithData:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithData:encoding:",  *(void *)(a1 + 40),  4LL),  "componentsSeparatedByString:",  @"\n");
    objc_msgSend( *(id *)(a1 + 40),  "setData:",  objc_msgSend(-[NSArray lastObject](v7, "lastObject"), "dataUsingEncoding:", 4));
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          NSErrorUserInfoKey v12 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)v11);
          if ([*(id *)(a1 + 48) count])
          {
            unint64_t v13 = 0LL;
            do
            {
              if (objc_msgSend( v12,  "hasSuffix:",  objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", v13))) {
                *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = v13;
              }
              ++v13;
            }

            while (v13 < (unint64_t)[*(id *)(a1 + 48) count]);
          }

          uint64_t v11 = (char *)v11 + 1;
        }

        while (v11 != v9);
        id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      }

      while (v9);
    }

    objc_autoreleasePoolPop(v6);
  }

uint64_t (**sub_1000368A4(uint64_t a1, uint64_t a2))(id, void, BOOL)
{
  if (a2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_100036940;
    v3[3] = &unk_1000D1D48;
    return (uint64_t (**)(id, void, BOOL))+[W5DebugManager __setOpenDirectoryLoggingEnabled:queue:reply:]( &OBJC_CLASS___W5DebugManager,  "__setOpenDirectoryLoggingEnabled:queue:reply:",  1LL,  *(void *)(a1 + 32),  v3);
  }

  else
  {
    uint64_t result = *(uint64_t (***)(id, void, BOOL))(a1 + 40);
    if (result) {
      return (uint64_t (**)(id, void, BOOL))result[2](result, 0LL, a2 == 0);
    }
  }

  return result;
}

uint64_t (**sub_100036940(uint64_t a1, uint64_t a2))(void)
{
  if (a2)
  {
    uint64_t result = *(uint64_t (***)(void))(a1 + 40);
    if (result) {
      return (uint64_t (**)(void))result[2]();
    }
  }

  else
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_1000369D4;
    v3[3] = &unk_1000D25C0;
    return (uint64_t (**)(void))+[W5DebugManager __mostRecentLogWithSuffix:logPath:queue:reply:]( &OBJC_CLASS___W5DebugManager,  "__mostRecentLogWithSuffix:logPath:queue:reply:",  &off_1000E3AC8,  @"/var/log/opendirectoryd.log",  *(void *)(a1 + 32),  v3);
  }

  return result;
}

uint64_t sub_1000369D4(uint64_t a1, uint64_t a2)
{
  if (a2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t result = *(void *)(a1 + 40);
    if (!result) {
      return result;
    }
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
  }

  else
  {
    +[W5DebugManager __setOpenDirectoryLoggingEnabled:queue:reply:]( &OBJC_CLASS___W5DebugManager,  "__setOpenDirectoryLoggingEnabled:queue:reply:",  0LL,  *(void *)(a1 + 32),  0LL);
    uint64_t result = *(void *)(a1 + 40);
    if (!result) {
      return result;
    }
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
  }

  return v4();
}

uint64_t (**sub_100036E78(uint64_t a1, uint64_t a2))(void)
{
  if (a2)
  {
    uint64_t result = *(uint64_t (***)(void))(a1 + 40);
    if (result) {
      return (uint64_t (**)(void))result[2]();
    }
  }

  else
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_100036F00;
    v3[3] = &unk_1000D1D48;
    return (uint64_t (**)(void))+[NSTask runTaskWithLaunchPath:arguments:reply:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:reply:",  *(void *)(a1 + 32),  &off_1000E3AF8,  v3);
  }

  return result;
}

uint64_t (**sub_100036F00(uint64_t a1, uint64_t a2))(void)
{
  if (!a2) {
    return (uint64_t (**)(void))+[NSTask runTaskWithLaunchPath:arguments:reply:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:reply:",  *(void *)(a1 + 32),  &off_1000E3B10,  *(void *)(a1 + 40));
  }
  uint64_t result = *(uint64_t (***)(void))(a1 + 40);
  if (result) {
    return (uint64_t (**)(void))result[2]();
  }
  return result;
}

uint64_t sub_100037000(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t result = *(void *)(a1 + 40);
    if (!result) {
      return result;
    }
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }

  uint64_t v5 =  -[NSString initWithData:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithData:encoding:",  *(void *)(a1 + 32),  4LL);
  if (-[NSString containsString:](v5, "containsString:", @"APBrowser*:level=info")) {
    -[NSString containsString:](v5, "containsString:", @"APBonjour*:level=info");
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }

  return result;
}

void sub_100037104(uint64_t a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  if (objc_opt_class(&OBJC_CLASS___MCProfileConnection, v3)
    && (v4 = objc_msgSend( +[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"),  "installedProfileIdentifiers"),  v11 = 0u,  v12 = 0u,  v13 = 0u,  v14 = 0u,  (id v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16)) != 0))
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * (void)i) containsString:@"wifi.megawifi"])
        {
          uint64_t v9 = 1LL;
          goto LABEL_13;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v9 = 0LL;
      if (v6) {
        continue;
      }
      break;
    }
  }

  else
  {
    uint64_t v9 = 0LL;
  }

uint64_t (**sub_1000372A4(uint64_t a1, uint64_t a2, int a3))(id, void)
{
  if (a2 || *(unsigned __int8 *)(a1 + 40) != a3)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      __int128 v11 = _NSConcreteStackBlock;
      uint64_t v12 = 3221225472LL;
      __int128 v13 = sub_100037390;
      __int128 v14 = &unk_1000D1B58;
      uint64_t v15 = *(void *)(a1 + 32);
      id v4 = &off_1000E3B58;
      id v5 = &v11;
    }

    else
    {
      id v6 = _NSConcreteStackBlock;
      uint64_t v7 = 3221225472LL;
      id v8 = sub_1000373A4;
      uint64_t v9 = &unk_1000D1B58;
      uint64_t v10 = *(void *)(a1 + 32);
      id v4 = &off_1000E3B70;
      id v5 = &v6;
    }

    return (uint64_t (**)(id, void))+[NSTask runTaskWithLaunchPath:arguments:reply:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:reply:",  @"/usr/local/bin/profilectl",  v4,  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  v15);
  }

  else
  {
    uint64_t result = *(uint64_t (***)(id, void))(a1 + 32);
    if (result) {
      return (uint64_t (**)(id, void))result[2](result, 0LL);
    }
  }

  return result;
}

uint64_t sub_100037390(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_1000373A4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100037420(uint64_t a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  if (objc_opt_class(&OBJC_CLASS___MCProfileConnection, v3)
    && (v4 = objc_msgSend( +[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"),  "installedProfileIdentifiers"),  v11 = 0u,  v12 = 0u,  v13 = 0u,  v14 = 0u,  (id v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16)) != 0))
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * (void)i) containsString:@"wifi.nologging"])
        {
          uint64_t v9 = 1LL;
          goto LABEL_13;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v9 = 0LL;
      if (v6) {
        continue;
      }
      break;
    }
  }

  else
  {
    uint64_t v9 = 0LL;
  }

uint64_t (**sub_1000375C0(uint64_t a1, uint64_t a2, int a3))(id, void)
{
  if (a2 || *(unsigned __int8 *)(a1 + 40) != a3)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      __int128 v11 = _NSConcreteStackBlock;
      uint64_t v12 = 3221225472LL;
      __int128 v13 = sub_1000376AC;
      __int128 v14 = &unk_1000D1B58;
      uint64_t v15 = *(void *)(a1 + 32);
      id v4 = &off_1000E3B88;
      id v5 = &v11;
    }

    else
    {
      id v6 = _NSConcreteStackBlock;
      uint64_t v7 = 3221225472LL;
      id v8 = sub_1000376C0;
      uint64_t v9 = &unk_1000D1B58;
      uint64_t v10 = *(void *)(a1 + 32);
      id v4 = &off_1000E3BA0;
      id v5 = &v6;
    }

    return (uint64_t (**)(id, void))+[NSTask runTaskWithLaunchPath:arguments:reply:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:reply:",  @"/usr/local/bin/profilectl",  v4,  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  v15);
  }

  else
  {
    uint64_t result = *(uint64_t (***)(id, void))(a1 + 32);
    if (result) {
      return (uint64_t (**)(id, void))result[2](result, 0LL);
    }
  }

  return result;
}

uint64_t sub_1000376AC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_1000376C0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100037B00(uint64_t a1)
{
  __int128 v2 = objc_autoreleasePoolPush();

  *(void *)(*(void *)(a1 + 32) + 120) = [*(id *)(a1 + 40) copy];
  objc_autoreleasePoolPop(v2);
}

void sub_100037BCC(uint64_t a1)
{
  __int128 v2 = objc_autoreleasePoolPush();

  *(void *)(*(void *)(a1 + 32) + 128) = [*(id *)(a1 + 40) copy];
  objc_autoreleasePoolPop(v2);
}

void sub_100037C68(uint64_t a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 32), "__nextRequest");
  objc_autoreleasePoolPop(v2);
}

void sub_100037E04(uint64_t a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  id v3 = objc_msgSend(*(id *)(a1 + 32), "__pendingRequestWithUUID:", *(void *)(a1 + 40));
  if (v3)
  {
    id v4 = v3;
    if ([v3 reply])
    {
      id v5 = (void (**)(id, NSError *, void))[v4 reply];
      NSErrorUserInfoKey v14 = NSLocalizedFailureReasonErrorKey;
      uint64_t v15 = @"W5CancelledErr";
      v5[2]( v5,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  6LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL)),  0LL);
    }

    uint64_t v6 = *(void *)(a1 + 48);
    if (v6) {
      (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0LL);
    }
    [*(id *)(*(void *)(a1 + 32) + 48) removeObject:v4];
  }

  else if (objc_msgSend( objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "uuid"),  "isEqual:",  *(void *)(a1 + 40)))
  {
    if ([*(id *)(*(void *)(a1 + 32) + 56) reply])
    {
      uint64_t v7 = (void (**)(id, NSError *, void))[*(id *)(*(void *)(a1 + 32) + 56) reply];
      NSErrorUserInfoKey v12 = NSLocalizedFailureReasonErrorKey;
      __int128 v13 = @"W5CancelledErr";
      v7[2]( v7,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  6LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL)),  0LL);
    }

    uint64_t v8 = *(void *)(a1 + 48);
    if (v8) {
      (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0LL);
    }

    *(void *)(*(void *)(a1 + 32) + 56LL) = 0LL;
  }

  else
  {
    uint64_t v9 = *(void *)(a1 + 48);
    if (v9)
    {
      NSErrorUserInfoKey v10 = NSLocalizedFailureReasonErrorKey;
      __int128 v11 = @"W5ParamErr";
      (*(void (**)(uint64_t, NSError *))(v9 + 16))( v9,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  1LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL)));
    }
  }

  objc_autoreleasePoolPop(v2);
}

void sub_1000380AC(uint64_t a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];

  *(void *)(*(void *)(a1 + 32) + 56LL) = 0LL;
  [*(id *)(a1 + 32) resetNetworkServiceOrderForTeardown];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  objc_autoreleasePoolPop(v2);
}

void sub_1000381B4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000381CC(uint64_t a1, uint64_t a2)
{
}

void sub_1000381DC(uint64_t a1)
{
}

void sub_1000381E8(uint64_t a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "__purgeDiagnosticsHistory");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 64) copy];
  objc_autoreleasePoolPop(v2);
}

void sub_100038360(uint64_t a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  *(void *)(*(void *)(a1 + 32) + 96LL) = 0x8000000000000000LL;
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 80LL);
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[wifivelocity] Restoring network service order before teardown",  v4,  2u);
      uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 80LL);
    }

    +[W5DiagnosticsManager __setNetworkServiceOrder:]( &OBJC_CLASS___W5DiagnosticsManager,  "__setNetworkServiceOrder:",  v3);

    *(void *)(*(void *)(a1 + 32) + 80LL) = 0LL;
    -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  @"/var/run/wifivelocity-tmp",  0LL);
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10003855C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100038574(void *a1, uint64_t a2, uint64_t a3)
{
  block[0] = _NSConcreteStackBlock;
  block[2] = sub_1000385DC;
  block[3] = &unk_1000D2610;
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  id v5 = *(dispatch_queue_s **)(v3 + 40);
  block[1] = 3221225472LL;
  void block[4] = v4;
  void block[5] = a2;
  void block[6] = a3;
  void block[7] = v3;
  void block[8] = a1[6];
  dispatch_async(v5, block);
}

void sub_1000385DC(uint64_t a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  if ([*(id *)(a1 + 32) reply])
  {
    id v3 = [*(id *)(a1 + 32) reply];
    (*((void (**)(id, void, void))v3 + 2))(v3, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }

  dispatch_time_t v4 = dispatch_time(0LL, 120000000000LL);
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(dispatch_queue_s **)(*(void *)(a1 + 56) + 40LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000386A0;
  block[3] = &unk_1000D12E0;
  void block[4] = v5;
  dispatch_after(v4, v6, block);

  *(void *)(*(void *)(a1 + 56) + 56LL) = 0LL;
  objc_msgSend(*(id *)(a1 + 56), "__nextRequest");
  objc_autoreleasePoolPop(v2);
}

void sub_1000386A0(uint64_t a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  objc_msgSend( +[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"),  "osTransactionComplete:",  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) = 0LL;
  objc_autoreleasePoolPop(v2);
}

void sub_100039018(uint64_t a1)
{
  id v2 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3052000000LL;
  dispatch_time_t v24 = sub_1000381CC;
  id v25 = sub_1000381DC;
  uint64_t v26 = 0LL;
  v19[0] = 0LL;
  v19[1] = v19;
  v19[2] = 0x2020000000LL;
  char v20 = 0;
  id v3 = dispatch_queue_create(0LL, 0LL);
  id v4 = objc_msgSend( objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "configuration"), "objectForKeyedSubscript:", @"Timeout"),  "unsignedIntegerValue");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100039348;
  block[3] = &unk_1000D26B0;
  __int128 v13 = *(_OWORD *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = v3;
  id v16 = v2;
  __int128 v17 = v19;
  dispatch_time_t v18 = &v21;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  objc_msgSend(objc_msgSend(*(id *)(*(void *)(a1 + 48) + 8), "concurrentQueue"), "addOperationWithBlock:", v5);
  if (v4) {
    dispatch_time_t v6 = dispatch_time(0LL, 1000000LL * (void)v4);
  }
  else {
    dispatch_time_t v6 = -1LL;
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100039880;
  v11[3] = &unk_1000D26D8;
  void v11[4] = v19;
  void v11[5] = &v21;
  void v11[6] = dispatch_block_wait(v5, v6);
  dispatch_sync(v3, v11);
  if ([(id)v22[5] code] == (id)3)
  {
    uint64_t v7 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 134217984;
      id v28 = v4;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  0LL,  "[wifivelocity] DIAGNOSTICS TIMEOUT (timeout=%lums)",  &v27);
    }
  }

  else if ([(id)v22[5] code] == (id)6)
  {
    uint64_t v8 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[wifivelocity] DIAGNOSTICS CANCELLED");
    }
  }

  uint64_t v9 = *(void *)(a1 + 56);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, [(id)v22[5] copy], v2);
  }
  id v10 = (id)v22[5];
  dispatch_release(v3);
  _Block_release(v5);
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v21, 8);
}

void sub_100039314( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

void sub_100039348(uint64_t a1)
{
  unint64_t v2 = 0LL;
  v24[0] = 0LL;
  v24[1] = v24;
  v24[2] = 0x2020000000LL;
  v24[3] = 0LL;
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  char v23 = 0;
  while (v2 < (unint64_t)[*(id *)(a1 + 32) count]
       && !*((_BYTE *)v21 + 24)
       && !*(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL))
  {
    id v3 = objc_autoreleasePoolPush();
    id v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v2];
    int8x16_t v5 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
    uint64_t v6 = *(void *)(a1 + 40);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000394C0;
    block[3] = &unk_1000D2688;
    unint64_t v19 = v2;
    uint64_t v7 = *(dispatch_queue_s **)(v6 + 40);
    int8x16_t v11 = v5;
    id v12 = v4;
    __int128 v13 = *(_OWORD *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 72);
    uint64_t v9 = *(void *)(a1 + 80);
    id v16 = &v20;
    uint64_t v17 = v9;
    dispatch_time_t v18 = v24;
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = v8;
    dispatch_sync(v7, block);
    objc_autoreleasePoolPop(v3);
    ++v2;
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(v24, 8);
}

void sub_100039498( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

void sub_1000394C0(uint64_t a1)
{
  unint64_t v2 = objc_autoreleasePoolPush();
  if ([*(id *)(a1 + 32) includeEvents])
  {
    if (!*(void *)(a1 + 112))
    {
      uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 120LL);
      if (v3) {
        (*(void (**)(uint64_t, id, void, id, double))(v3 + 16))( v3,  [*(id *)(a1 + 32) uuid],  0,  objc_msgSend(*(id *)(a1 + 48), "copy"),  0.0);
      }
    }
  }

  id v4 = +[NSMutableDictionary dictionaryWithDictionary:]( NSMutableDictionary,  "dictionaryWithDictionary:",  [*(id *)(a1 + 48) configuration]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "uuid"), "UUIDString"), "copy"),  @"InternalUUID");
  id v5 = [*(id *)(a1 + 48) copy];
  [v5 setConfiguration:v4];
  id v6 = objc_msgSend(*(id *)(a1 + 40), "__runDiagnosticsTest:", v5);
  if (v6)
  {
    objc_msgSend(v6, "setConfiguration:", objc_msgSend(*(id *)(a1 + 48), "configuration"));
    objc_msgSend(*(id *)(a1 + 40), "__updateDiagnosticsHistoryWithResult:", v6);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100039768;
    block[3] = &unk_1000D2660;
    uint64_t v7 = *(void *)(a1 + 80);
    void block[5] = v6;
    void block[6] = v7;
    uint64_t v8 = *(dispatch_queue_s **)(a1 + 56);
    void block[4] = *(void *)(a1 + 64);
    dispatch_sync(v8, block);
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = objc_msgSend( objc_msgSend( *(id *)(*(void *)(a1 + 40) + 56),  "uuid"),  "isEqual:",  objc_msgSend(*(id *)(a1 + 32), "uuid")) ^ 1;
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL))
  {
    uint64_t v9 = *(dispatch_queue_s **)(a1 + 56);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    void v15[2] = sub_1000397A8;
    v15[3] = &unk_1000D2310;
    uint64_t v10 = *(void *)(a1 + 96);
    v15[4] = *(void *)(a1 + 80);
    void v15[5] = v10;
    dispatch_sync(v9, v15);
  }

  *(double *)(*(void *)(*(void *)(a1 + 104) + 8LL) + 24LL) = *(double *)(*(void *)(*(void *)(a1 + 104) + 8LL)
                                                                           + 24LL)
                                                               + 1.0;
  if ([*(id *)(a1 + 32) includeEvents])
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 120LL);
    if (v11)
    {
      id v12 = [*(id *)(a1 + 32) uuid];
      __int128 v13 = *(char **)(a1 + 112);
      else {
        id v14 =  objc_msgSend( objc_msgSend(*(id *)(a1 + 72), "objectAtIndexedSubscript:", *(void *)(a1 + 112) + 1),  "copy");
      }
      (*(void (**)(uint64_t, id, id, id, double))(v11 + 16))( v11,  v12,  v6,  v14,  *(double *)(*(void *)(*(void *)(a1 + 104) + 8LL) + 24LL)
    }
  }

  objc_autoreleasePoolPop(v2);
}

void sub_100039768(uint64_t a1)
{
  unint64_t v2 = objc_autoreleasePoolPush();
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)) {
    [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
  }
  objc_autoreleasePoolPop(v2);
}

void sub_1000397A8(uint64_t a1)
{
  unint64_t v2 = objc_autoreleasePoolPush();
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    NSErrorUserInfoKey v3 = NSLocalizedFailureReasonErrorKey;
    id v4 = @"W5CancelledErr";
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = -[NSError copy]( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  6LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL)),  "copy");
  }

  objc_autoreleasePoolPop(v2);
}

void sub_100039880(void *a1)
{
  unint64_t v2 = objc_autoreleasePoolPush();
  *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = 1;
  if (a1[6])
  {

    NSErrorUserInfoKey v3 = NSLocalizedFailureReasonErrorKey;
    id v4 = @"W5TimeoutErr";
    *(void *)(*(void *)(a1[5] + 8LL) + 40LL) = -[NSError copy]( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  3LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL)),  "copy");
  }

  objc_autoreleasePoolPop(v2);
}

LABEL_51:
    uint64_t v56 = 0u;
    uint64_t v57 = 0u;
    uint64_t v54 = 0u;
    uint64_t v55 = 0u;
    uint64_t v45 = [v24 countByEnumeratingWithState:&v54 objects:v68 count:16];
    if (v45)
    {
      __int16 v46 = v45;
      int v47 = *(void *)v55;
      while (2)
      {
        for (k = 0LL; k != v46; k = (char *)k + 1)
        {
          if (*(void *)v55 != v47) {
            objc_enumerationMutation(v24);
          }
          id v49 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)k);
          if ((uint64_t)[v49 count] >= 1)
          {
            [v49 packetLoss];
            if (v50 < 100.0)
            {
              -[W5DiagnosticsTestResult setDidPass:](v52, "setDidPass:", 1LL);
              -[W5DiagnosticsTestResult setResult:](v52, "setResult:", 1LL);
              goto LABEL_62;
            }
          }
        }

        __int16 v46 = [v24 countByEnumeratingWithState:&v54 objects:v68 count:16];
        if (v46) {
          continue;
        }
        break;
      }
    }

      id v28 = v33;
      goto LABEL_52;
    }

    goto LABEL_49;
  }

  if (qword_1000F75D8 != -1) {
    dispatch_once(&qword_1000F75D8, &stru_1000D3558);
  }
  int v27 = qword_1000F75D0;
  if (!os_log_type_enabled((os_log_t)qword_1000F75D0, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_55;
  }
  uint64_t v42 = 136316162;
  uint64_t v43 = "W5DeleteFilesAtPath";
  __int16 v44 = 2080;
  uint64_t v45 = "W5MiscUtil.m";
  __int16 v46 = 1024;
  int v47 = 664;
  __int16 v48 = 2114;
  id v49 = @"/var/run/com.apple.wifivelocity";
  uint64_t v50 = 2114;
  *(void *)uint64_t v51 = v41;
  LODWORD(v31) = 48;
  _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v27,  0LL,  "[wifivelocity] %s (%s:%u) Unable to list contents of: %{public}@, error: %{public}@",  &v42,  v31);
LABEL_49:
  uint64_t v33 = 0LL;
LABEL_50:
  if (qword_1000F75D8 == -1) {
    goto LABEL_51;
  }
  dispatch_once(&qword_1000F75D8, &stru_1000D3558);
  id v28 = v33;
LABEL_52:
  uint64_t v29 = qword_1000F75D0;
  if (os_log_type_enabled((os_log_t)qword_1000F75D0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v42 = 136315650;
    uint64_t v43 = "W5DeleteFilesAtPath";
    __int16 v44 = 2080;
    uint64_t v45 = "W5MiscUtil.m";
    __int16 v46 = 1024;
    int v47 = 695;
    LODWORD(v31) = 28;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v29,  0LL,  "[wifivelocity] %s (%s:%u) [END] File Deletion Request",  (const char *)&v42,  v31,  v32);
  }

  return v28;
}

LABEL_62:
    uint64_t v66 = @"PingResults";
    uint64_t v67 = [v24 copy];
    -[W5DiagnosticsTestResult setInfo:]( v52,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v67,  &v66,  1LL));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v52, "setTestCompleted:");
  return v52;
}

LABEL_31:
    uint64_t v40 = @"PingResults";
    uint64_t v41 = [v4 copy];
    -[W5DiagnosticsTestResult setInfo:]( v3,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v41,  &v40,  1LL));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v3, "setTestCompleted:");
  return v3;
}

LABEL_47:
    id v49 = 0u;
    uint64_t v50 = 0u;
    int v47 = 0u;
    __int16 v48 = 0u;
    uint64_t v37 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v47, v61, 16, v44);
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v48;
      while (2)
      {
        for (k = 0LL; k != v38; k = (char *)k + 1)
        {
          if (*(void *)v48 != v39) {
            objc_enumerationMutation(v17);
          }
          uint64_t v41 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)k);
          if ((uint64_t)[v41 count] >= 1)
          {
            [v41 packetLoss];
            if (v42 < 100.0)
            {
              [v45 setDidPass:1];
              [v45 setResult:1];
              goto LABEL_58;
            }
          }
        }

        uint64_t v38 = [v17 countByEnumeratingWithState:&v47 objects:v61 count:16];
        if (v38) {
          continue;
        }
        break;
      }
    }

LABEL_58:
    uint64_t v59 = @"PingResults";
    uint64_t v60 = [v17 copy];
    id v4 = (W5DiagnosticsTestResult *)v45;
    objc_msgSend( v45,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v60,  &v59,  1));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v4, "setTestCompleted:");
  return v4;
}

LABEL_18:
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003B418;
  block[3] = &unk_1000D1BA8;
  void block[4] = v20;
  void block[5] = obj;
  dispatch_sync(v21, block);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v20, "setTestCompleted:");
  if (v8) {
    dispatch_release(v8);
  }
  if (v21) {
    dispatch_release(v21);
  }
  return v20;
}

  if (qword_1000F75D8 != -1) {
    dispatch_once(&qword_1000F75D8, &stru_1000D3558);
  }
  uint64_t v21 = qword_1000F75D0;
  id v16 = 0LL;
  if (os_log_type_enabled((os_log_t)qword_1000F75D0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = [a2 path];
    char v23 = -[NSError code](v27, "code");
    uint64_t v35 = "W5CreateTarball";
    uint64_t v36 = 2080;
    uint64_t v34 = 136316162;
    uint64_t v37 = "W5MiscUtil.m";
    uint64_t v38 = 1024;
    uint64_t v39 = 408;
    uint64_t v40 = 2114;
    uint64_t v41 = v22;
    uint64_t v42 = 2048;
    uint64_t v43 = v23;
    LODWORD(v25) = 48;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v21,  0LL,  "[wifivelocity] %s (%s:%u) FAILED to create archive '%{public}@', returned error %ld",  &v34,  v25);
    id v16 = 0LL;
  }

void sub_10003B2FC(uint64_t a1)
{
  unint64_t v2 = objc_autoreleasePoolPush();
  NSErrorUserInfoKey v3 = +[NSMutableDictionary dictionaryWithDictionary:]( NSMutableDictionary,  "dictionaryWithDictionary:",  [*(id *)(a1 + 32) configuration]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  *(void *)(a1 + 40),  @"InternalUUID");
  id v4 = [*(id *)(a1 + 32) copy];
  [v4 setConfiguration:v3];
  id v5 = objc_msgSend(*(id *)(a1 + 48), "__runDiagnosticsTest:", v4);
  if (v5)
  {
    id v6 = v5;
    objc_msgSend(v5, "setConfiguration:", objc_msgSend(*(id *)(a1 + 32), "configuration"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10003B3E8;
    v8[3] = &unk_1000D1BA8;
    uint64_t v7 = *(dispatch_queue_s **)(a1 + 56);
    v8[4] = *(void *)(a1 + 64);
    v8[5] = v6;
    dispatch_sync(v7, v8);
  }

  objc_autoreleasePoolPop(v2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

void sub_10003B3E8(uint64_t a1)
{
  unint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
  objc_autoreleasePoolPop(v2);
}

void sub_10003B418(uint64_t a1)
{
  unint64_t v2 = objc_autoreleasePoolPush();
  NSErrorUserInfoKey v3 = @"ConcurrentResults";
  id v4 = [*(id *)(a1 + 40) copy];
  objc_msgSend( *(id *)(a1 + 32),  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1));
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_100040F94(uint64_t a1, void *a2, void *a3)
{
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:a3];
  [v6 floatValue];
  float v9 = v8;
  [v7 floatValue];
  if (v9 > v10) {
    return 1LL;
  }
  [v7 floatValue];
  float v13 = v12;
  [v6 floatValue];
  uint64_t v11 = -1LL;
  if (v13 <= v14)
  {
    id v15 = [a2 channel];
  }

  return v11;
}

void sub_100043130(id a1)
{
  qword_1000F7530 = (uint64_t)[&off_1000E3BD0 copy];
}

void sub_10004455C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
}

void sub_10004458C(uint64_t a1, void *a2)
{
  id v4 = objc_autoreleasePoolPush();
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL) = objc_alloc_init(&OBJC_CLASS___W5PingResult);
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setAddress:*(void *)(a1 + 32)];
  objc_msgSend( *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40),  "setInterfaceName:",  objc_msgSend(objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "wifi"), "interfaceName"));
  objc_msgSend( *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40),  "setCount:",  (int)objc_msgSend(a2, "numPingsTransmitted"));
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setTimeout:1.0];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setWait:1.0];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setInterval:1.0];
  [a2 packetLossRate];
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "setPacketLoss:");
  [a2 averageRoundtripTime];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setAvg:v5 * 1000.0];
  [a2 minRoundtripTime];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setMin:v6 * 1000.0];
  [a2 maxRoundtripTime];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setMax:v7 * 1000.0];
  [a2 standardDeviationRoundtripTime];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setStddev:v8 * 1000.0];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setStartedAt:*(double *)(a1 + 64)];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "setEndedAt:");
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  objc_autoreleasePoolPop(v4);
}

LABEL_6:
  CFRelease(v4);
  return v9;
}

void sub_100045608(uint64_t a1)
{
}

void sub_1000459D0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_1000459F0(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3 && [a2 length]) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

Class sub_100045A44(uint64_t a1)
{
  double v5 = 0LL;
  if (!qword_1000F7540)
  {
    __int128 v6 = off_1000D27F8;
    uint64_t v7 = 0LL;
    qword_1000F7540 = _sl_dlopen(&v6, &v5);
  }

  if (!qword_1000F7540)
  {
    NSErrorUserInfoKey v3 = +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler");
    id v4 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *IMFoundationLibrary(void)");
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( v3,  "handleFailureInFunction:file:lineNumber:description:",  v4,  @"W5DiagnosticsManager.m",  45LL,  @"%s",  v5);
    goto LABEL_10;
  }

  if (v5) {
    free(v5);
  }
  Class result = objc_getClass("IMPingTest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL))
  {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getIMPingTestClass(void)_block_invoke"),  @"W5DiagnosticsManager.m",  46LL,  @"Unable to find class %s",  "IMPingTest");
LABEL_10:
    __break(1u);
  }

  qword_1000F7548 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  return result;
}

void sub_1000460E4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, id location)
{
}

void sub_100046130(uint64_t a1)
{
  uint64_t v2 = sub_10008C90C();
  NSErrorUserInfoKey v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315650;
    uint64_t v7 = "-[W5RapportClient _configureDiscoveryClient]_block_invoke";
    __int16 v8 = 2080;
    float v9 = "W5RapportClient.m";
    __int16 v10 = 1024;
    int v11 = 101;
    int v5 = 28;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v3,  0LL,  "[wifivelocity] %s (%s:%u) rapport discovery session invalidated",  (const char *)&v6,  v5);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateRapportClient];
}

void sub_100046228(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) queue]);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  _DWORD v6[2] = sub_1000462E4;
  v6[3] = &unk_1000D2840;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

void sub_1000462E4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleDeviceFound:*(void *)(a1 + 32)];
}

void sub_100046320(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleDeviceLost:v3];
}

void sub_10004636C(id a1, RPCompanionLinkDevice *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = sub_10008C90C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315906;
    id v7 = "-[W5RapportClient _configureDiscoveryClient]_block_invoke_5";
    __int16 v8 = 2080;
    float v9 = "W5RapportClient.m";
    __int16 v10 = 1024;
    int v11 = 122;
    __int16 v12 = 2114;
    float v13 = v2;
    int v5 = 38;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v4,  0LL,  "[wifivelocity] %s (%s:%u) local device updated inDevice='%{public}@'",  &v6,  v5);
  }
}

void sub_100046A88( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_100046AB4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = sub_10008C90C();
    int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315906;
      float v9 = "-[W5RapportClient startDiscoveringDevices]_block_invoke";
      __int16 v10 = 2080;
      int v11 = "W5RapportClient.m";
      __int16 v12 = 1024;
      int v13 = 179;
      __int16 v14 = 2114;
      id v15 = v3;
      int v7 = 38;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v5,  0LL,  "[wifivelocity] %s (%s:%u) W5RapportDiscoveryRequest activation of rapport discovery client falied, error: %{public}@",  &v8,  v7);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setDiscoveringDevices:0];
  }
}

void sub_100046FF0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

void sub_100047014(id a1)
{
  uint64_t v1 = sub_10008C90C();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315650;
    int v5 = "-[W5RapportClient sendMessageToDevice:request:]_block_invoke";
    __int16 v6 = 2080;
    int v7 = "W5RapportClient.m";
    __int16 v8 = 1024;
    int v9 = 223;
    int v3 = 28;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v2,  0LL,  "[wifivelocity] %s (%s:%u) rapport client invalidated",  (const char *)&v4,  v3);
  }
}

void sub_1000470F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = sub_10008C90C();
  __int16 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v7)
    {
      __int16 v8 = *(void **)(a1 + 32);
      *(_DWORD *)location = 136316162;
      *(void *)&location[4] = "-[W5RapportClient sendMessageToDevice:request:]_block_invoke";
      __int16 v35 = 2080;
      uint64_t v36 = "W5RapportClient.m";
      __int16 v37 = 1024;
      int v38 = 231;
      __int16 v39 = 2114;
      uint64_t v40 = v8;
      __int16 v41 = 2114;
      id v42 = v3;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "[wifivelocity] %s (%s:%u) failed to activate rapport request='%{public}@' error='%{public}@'",  location,  48);
    }

    if ([v3 code] == (id)-71146)
    {
      uint64_t v9 = sub_10008C90C();
      __int16 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v12 = *(void **)(a1 + 32);
        int v11 = *(void **)(a1 + 40);
        *(_DWORD *)location = 136316162;
        *(void *)&location[4] = "-[W5RapportClient sendMessageToDevice:request:]_block_invoke";
        __int16 v35 = 2080;
        uint64_t v36 = "W5RapportClient.m";
        __int16 v37 = 1024;
        int v38 = 234;
        __int16 v39 = 2114;
        uint64_t v40 = v11;
        __int16 v41 = 2114;
        id v42 = v12;
        LODWORD(v2_Block_object_dispose(va, 8) = 48;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "[wifivelocity] %s (%s:%u) Service unsupported on device='%{public}@' for request='%{public}@'",  location,  v28);
      }
    }

    int v13 = *(void **)(a1 + 32);
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue( +[W5RapportResponse responseWithPayload:options:error:]( &OBJC_CLASS___W5RapportResponse,  "responseWithPayload:options:error:",  0LL,  0LL,  v3));
    [v13 handleResponse:v14];
  }

  else
  {
    if (v7)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
      id v16 = [*(id *)(a1 + 32) controlFlags];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) requestPayload]);
      dispatch_time_t v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) peer]);
      *(_DWORD *)location = 136316674;
      *(void *)&location[4] = "-[W5RapportClient sendMessageToDevice:request:]_block_invoke";
      __int16 v35 = 2080;
      uint64_t v36 = "W5RapportClient.m";
      __int16 v37 = 1024;
      int v38 = 241;
      __int16 v39 = 2114;
      uint64_t v40 = v15;
      __int16 v41 = 2048;
      id v42 = v16;
      __int16 v43 = 2114;
      __int16 v44 = v17;
      __int16 v45 = 2114;
      __int16 v46 = v18;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "[wifivelocity] %s (%s:%u) sending request='%{public}@' flags='%ld' payload='%{public}@ to='%{public}@'",  location,  68);
    }

    unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) requestPayload]);
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v19 encode]);

    if (v14)
    {
      objc_initWeak((id *)location, WeakRetained);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_100047658;
      v29[3] = &unk_1000D2980;
      objc_copyWeak(&v31, (id *)location);
      id v30 = *(id *)(a1 + 32);
      [WeakRetained sendRequestID:v20 request:v14 options:0 responseHandler:v29];

      objc_destroyWeak(&v31);
      objc_destroyWeak((id *)location);
    }

    else
    {
      uint64_t v21 = sub_10008C90C();
      uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        char v23 = *(void **)(a1 + 32);
        *(_DWORD *)location = 136315906;
        *(void *)&location[4] = "-[W5RapportClient sendMessageToDevice:request:]_block_invoke";
        __int16 v35 = 2080;
        uint64_t v36 = "W5RapportClient.m";
        __int16 v37 = 1024;
        int v38 = 244;
        __int16 v39 = 2114;
        uint64_t v40 = v23;
        LODWORD(v2_Block_object_dispose(va, 8) = 38;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v22,  0LL,  "[wifivelocity] %s (%s:%u) failed to encode payload for request='%{public}@'",  location,  v28);
      }

      dispatch_time_t v24 = *(void **)(a1 + 32);
      NSErrorUserInfoKey v32 = NSLocalizedFailureReasonErrorKey;
      uint64_t v33 = @"W5ParamErr";
      id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL));
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  1LL,  v25));
      int v27 = (void *)objc_claimAutoreleasedReturnValue( +[W5RapportResponse responseWithPayload:options:error:]( &OBJC_CLASS___W5RapportResponse,  "responseWithPayload:options:error:",  0LL,  0LL,  v26));
      [v24 handleResponse:v27];

      __int16 v14 = 0LL;
    }
  }
}

void sub_10004762C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

void sub_100047658(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"statusFlags"]);
  unsigned int v12 = [v11 unsignedIntValue];

  uint64_t v13 = sub_10008C90C();
  __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v30 = WeakRetained;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    char v16 = 0;
    uint64_t v17 = (const char *)&unk_1000A4F9E;
    do
    {
      dispatch_time_t v18 = (char *)(v17 + 1);
      if (((v12 >> v16) & 1) != 0)
      {
        unint64_t v19 = -[NSString initWithCString:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithCString:encoding:",  v18,  1LL);
        [v15 addObject:v19];
        size_t v20 = -[NSString length](v19, "length");
      }

      else
      {
        size_t v20 = strlen(v17 + 1);
      }

      uint64_t v17 = &v18[v20 + 1];
      char v16 = *v17;
    }

    while (*v17);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v15 componentsJoinedByString:@" "]);

    int v31 = 136316418;
    NSErrorUserInfoKey v32 = "-[W5RapportClient sendMessageToDevice:request:]_block_invoke";
    __int16 v33 = 2080;
    uint64_t v34 = "W5RapportClient.m";
    __int16 v35 = 1024;
    int v36 = 257;
    __int16 v37 = 2114;
    int v38 = v21;
    __int16 v39 = 2114;
    id v40 = v7;
    __int16 v41 = 2114;
    id v42 = v8;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "[wifivelocity] %s (%s:%u) transport='%{public}@' inResponse='%{public}@' inOptions='%{public}@'",  &v31,  58);

    id WeakRetained = v30;
  }

  if (v9)
  {
    uint64_t v22 = sub_10008C90C();
    char v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_time_t v24 = *(void **)(a1 + 32);
      int v31 = 136316162;
      NSErrorUserInfoKey v32 = "-[W5RapportClient sendMessageToDevice:request:]_block_invoke";
      __int16 v33 = 2080;
      uint64_t v34 = "W5RapportClient.m";
      __int16 v35 = 1024;
      int v36 = 259;
      __int16 v37 = 2114;
      int v38 = v24;
      __int16 v39 = 2114;
      id v40 = v9;
      LODWORD(v29) = 48;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v23,  0LL,  "[wifivelocity] %s (%s:%u) failed to recieve response from rapport request='%{public}@' error='%{public}@'",  &v31,  v29);
    }

    id v25 = *(void **)(a1 + 32);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[W5RapportResponse responseWithPayload:options:error:]( &OBJC_CLASS___W5RapportResponse,  "responseWithPayload:options:error:",  0LL,  v8,  v9));
    [v25 handleResponse:v26];
  }

  else
  {
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "responsePayloadClass"), "payloadFromDictionary:", v7));
    int v27 = *(void **)(a1 + 32);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[W5RapportResponse responseWithPayload:options:error:]( &OBJC_CLASS___W5RapportResponse,  "responseWithPayload:options:error:",  v26,  v8,  0LL));
    [v27 handleResponse:v28];
  }

  [WeakRetained invalidate];
}

void sub_100047B88( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100047BA0(uint64_t a1, uint64_t a2)
{
}

void sub_100047BB0(uint64_t a1)
{
}

void sub_100047BBC(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "__wifi");
  objc_autoreleasePoolPop(v2);
}

void sub_100047D00( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100047D18(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "__bluetooth");
  objc_autoreleasePoolPop(v2);
}

void sub_100048070(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();

  *(void *)(*(void *)(a1 + 32) + 136) = [*(id *)(a1 + 40) copy];
  objc_autoreleasePoolPop(v2);
}

void sub_10004813C(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();

  *(void *)(*(void *)(a1 + 32) + 144) = [*(id *)(a1 + 40) copy];
  objc_autoreleasePoolPop(v2);
}

void sub_100048208(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();

  *(void *)(*(void *)(a1 + 32) + 152) = [*(id *)(a1 + 40) copy];
  objc_autoreleasePoolPop(v2);
}

void sub_1000482D4(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();

  *(void *)(*(void *)(a1 + 32) + 160) = [*(id *)(a1 + 40) copy];
  objc_autoreleasePoolPop(v2);
}

void sub_1000483A0(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();

  *(void *)(*(void *)(a1 + 32) + 168) = [*(id *)(a1 + 40) copy];
  objc_autoreleasePoolPop(v2);
}

void sub_10004846C(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();

  *(void *)(*(void *)(a1 + 32) + 176) = [*(id *)(a1 + 40) copy];
  objc_autoreleasePoolPop(v2);
}

void sub_100048538(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();

  *(void *)(*(void *)(a1 + 32) + 192) = [*(id *)(a1 + 40) copy];
  objc_autoreleasePoolPop(v2);
}

void sub_100048604(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();

  *(void *)(*(void *)(a1 + 32) + 200) = [*(id *)(a1 + 40) copy];
  objc_autoreleasePoolPop(v2);
}

void sub_1000486D0(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();

  *(void *)(*(void *)(a1 + 32) + 208) = [*(id *)(a1 + 40) copy];
  objc_autoreleasePoolPop(v2);
}

void sub_10004879C(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();

  *(void *)(*(void *)(a1 + 32) + 184) = [*(id *)(a1 + 40) copy];
  objc_autoreleasePoolPop(v2);
}

void sub_100048868(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();

  *(void *)(*(void *)(a1 + 32) + 216) = [*(id *)(a1 + 40) copy];
  objc_autoreleasePoolPop(v2);
}

void sub_100048934(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();

  *(void *)(*(void *)(a1 + 32) + 224) = [*(id *)(a1 + 40) copy];
  objc_autoreleasePoolPop(v2);
}

void sub_100048A00(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();

  *(void *)(*(void *)(a1 + 32) + 232) = [*(id *)(a1 + 40) copy];
  objc_autoreleasePoolPop(v2);
}

void sub_100048A9C(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void, id))(v3 + 16))( v3,  0,  objc_msgSend(*(id *)(a1 + 32), "__queryStatusIncludingWiFiScanCache:", 1));
  }
  objc_autoreleasePoolPop(v2);
}

void sub_100048BA0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100048BB8(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) =  objc_msgSend( *(id *)(a1 + 32),  "__queryStatusIncludingWiFiScanCache:",  1);
  objc_autoreleasePoolPop(v2);
}

void sub_100048CA8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100048CC0(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) =  objc_msgSend( *(id *)(a1 + 32),  "__queryWiFiStatusIncludingScanCache:",  0);
  objc_autoreleasePoolPop(v2);
}

void sub_100048DB0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100048DC8(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "__queryAWDLStatus");
  objc_autoreleasePoolPop(v2);
}

void sub_100048EB4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100048ECC(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) =  objc_msgSend( *(id *)(a1 + 32),  "__queryBluetoothStatus");
  objc_autoreleasePoolPop(v2);
}

void sub_100048FB8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100048FD0(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "__queryNetworkStatus");
  objc_autoreleasePoolPop(v2);
}

void sub_1000490BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000490D4(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "__queryPowerStatus");
  objc_autoreleasePoolPop(v2);
}

void sub_1000491C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_1000491DC(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  if (*(void *)(a1 + 32))
  {
    id v3 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 40), "objectForKeyedSubscript:");
    if (!v3)
    {
      id v3 = objc_msgSend(*(id *)(a1 + 40), "__queryStatusIncludingWiFiScanCache:", 0);
      [*(id *)(*(void *)(a1 + 40) + 40) setObject:v3 forKeyedSubscript:*(void *)(a1 + 32)];
    }

    *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = v3;
  }

  objc_autoreleasePoolPop(v2);
}

void sub_1000492B0(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 40), "removeObjectForKey:");
  }
  objc_autoreleasePoolPop(v2);
}

void sub_100049398( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000493B0(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 48) copy];
  objc_autoreleasePoolPop(v2);
}

void sub_100049448(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "__wifi"), "startEventMonitoring");
  [*(id *)(*(void *)(a1 + 32) + 88) startEventMonitoring];
  [*(id *)(*(void *)(a1 + 32) + 104) startEventMonitoring];
  [*(id *)(*(void *)(a1 + 32) + 112) startEventMonitoring];
  [*(id *)(*(void *)(a1 + 32) + 120) startEventMonitoring];
  objc_msgSend(*(id *)(a1 + 32), "__forceUpdateTrigger");
  objc_autoreleasePoolPop(v2);
}

void sub_10004950C(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "__wifi"), "stopEventMonitoring");
  [*(id *)(*(void *)(a1 + 32) + 88) stopEventMonitoring];
  [*(id *)(*(void *)(a1 + 32) + 104) stopEventMonitoring];
  [*(id *)(*(void *)(a1 + 32) + 112) stopEventMonitoring];
  [*(id *)(*(void *)(a1 + 32) + 120) stopEventMonitoring];
  id v3 = *(dispatch_source_s **)(*(void *)(a1 + 32) + 16LL);
  if (v3)
  {
    dispatch_source_cancel(v3);
    dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16LL));
    *(void *)(*(void *)(a1 + 32) + 16LL) = 0LL;
  }

  objc_autoreleasePoolPop(v2);
}

id sub_100049650(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315906;
    __int16 v6 = "-[W5StatusManager __forceUpdateTrigger]_block_invoke";
    __int16 v7 = 2080;
    id v8 = "W5StatusManager.m";
    __int16 v9 = 1024;
    int v10 = 543;
    __int16 v11 = 1024;
    int v12 = 10;
    int v4 = 34;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v2,  0LL,  "[wifivelocity] %s (%s:%u) force status update (interval=%d)",  (const char *)&v5,  v4);
  }

  return objc_msgSend(*(id *)(a1 + 32), "__updateStatusCoalesce");
}

id sub_1000497F4(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 24LL) = 0LL;
  uint64_t v2 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315906;
    __int16 v6 = "-[W5StatusManager __updateStatusCoalesce]_block_invoke";
    __int16 v7 = 2080;
    id v8 = "W5StatusManager.m";
    __int16 v9 = 1024;
    int v10 = 574;
    __int16 v11 = 1024;
    int v12 = 5;
    int v4 = 34;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v2,  0LL,  "[wifivelocity] %s (%s:%u) coalesced status update (interval=%d)",  (const char *)&v5,  v4);
  }

  return objc_msgSend(*(id *)(a1 + 32), "__updateStatus");
}

void sub_10004AF28(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "__addEvent:", *(void *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

void sub_10004B0C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(dispatch_queue_s **)(v2 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10004B11C;
  v4[3] = &unk_1000D1BA8;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_10004B11C(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "__updateStatusCoalesce");
  objc_msgSend(*(id *)(a1 + 32), "__addEvent:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 176LL);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 40));
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10004B16C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(dispatch_queue_s **)(v2 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10004B1C4;
  v4[3] = &unk_1000D1BA8;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_10004B1C4(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "__updateStatusCoalesce");
  objc_msgSend(*(id *)(a1 + 32), "__addEvent:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 184LL);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 40));
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10004B214(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(dispatch_queue_s **)(v2 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10004B26C;
  v4[3] = &unk_1000D1BA8;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_10004B26C(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "__updateStatusCoalesce");
  objc_msgSend(*(id *)(a1 + 32), "__addEvent:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 192LL);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 40));
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10004B2BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(dispatch_queue_s **)(v2 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10004B314;
  v4[3] = &unk_1000D1BA8;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_10004B314(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "__updateStatusCoalesce");
  objc_msgSend(*(id *)(a1 + 32), "__addEvent:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 200LL);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 40));
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10004B364(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(dispatch_queue_s **)(v2 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10004B3BC;
  v4[3] = &unk_1000D1BA8;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_10004B3BC(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "__updateStatusCoalesce");
  objc_msgSend(*(id *)(a1 + 32), "__addEvent:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 208LL);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 40));
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10004B40C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(dispatch_queue_s **)(v2 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10004B464;
  v4[3] = &unk_1000D1BA8;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_10004B464(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "__updateStatusCoalesce");
  objc_msgSend(*(id *)(a1 + 32), "__addEvent:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 216LL);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 40));
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10004B4B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(dispatch_queue_s **)(v2 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10004B50C;
  v4[3] = &unk_1000D1BA8;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_10004B50C(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "__updateStatusCoalesce");
  objc_msgSend(*(id *)(a1 + 32), "__addEvent:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 224LL);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 40));
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10004B55C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(dispatch_queue_s **)(v2 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10004B5B4;
  v4[3] = &unk_1000D1BA8;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_10004B5B4(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "__updateStatusCoalesce");
  objc_msgSend(*(id *)(a1 + 32), "__addEvent:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 232LL);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 40));
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10004B974(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();

  *(void *)(*(void *)(a1 + 32) + 96) = [*(id *)(a1 + 40) copy];
  objc_autoreleasePoolPop(v2);
}

id sub_10004BBA4(void *a1)
{
  if (!a1) {
    return 0LL;
  }
  id v2 = objc_alloc_init(&OBJC_CLASS___W5WiFiPreferredNetwork);
  objc_msgSend(v2, "setSsid:", objc_msgSend(a1, "SSID"));
  objc_msgSend(v2, "setSsidString:", objc_msgSend(a1, "networkName"));
  objc_msgSend(v2, "setIsEnabled:", objc_msgSend(a1, "isAutoJoinDisabled") ^ 1);
  objc_msgSend(v2, "setLastJoinedTimestamp:", objc_msgSend(a1, "lastJoinedAt"));
  objc_msgSend( v2,  "setSecurity:",  sub_10004D94C( (uint64_t)objc_msgSend(a1, "supportedSecurityTypes"),  (uint64_t)objc_msgSend(a1, "WEPSubtype"),  (uint64_t)objc_msgSend(a1, "WAPISubtype")));
  objc_msgSend(v2, "setIsCaptive:", objc_msgSend(a1, "isCaptive"));
  objc_msgSend(v2, "setIsPasspoint:", objc_msgSend(a1, "isPasspoint"));
  objc_msgSend(v2, "setDomainName:", objc_msgSend(a1, "domainName"));
  objc_msgSend(v2, "setIsHidden:", objc_msgSend(a1, "hiddenState") == (id)1);
  if ([v2 isPasspoint]) {
    uint64_t v3 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"wifivelocityd.preferrednetwork.passpoint.%@",  [v2 domainName]);
  }
  else {
    uint64_t v3 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"wifivelocityd.preferrednetwork.ssid.%@",  [v2 ssidString]);
  }
  [v2 setIdentifier:v3];
  return v2;
}

id sub_10004BFF8(uint64_t a1, void *a2)
{
  uint64_t v4 = (uint64_t)objc_msgSend(objc_msgSend(a2, "eventID"), "type");
  if (v4 > 14)
  {
    if (v4 == 15)
    {
      int v5 = *(void **)(a1 + 32);
      uint64_t v6 = 1LL;
    }

    else
    {
      if (v4 != 16) {
        goto LABEL_11;
      }
      int v5 = *(void **)(a1 + 32);
      uint64_t v6 = 0LL;
    }

    objc_msgSend(v5, "__updateAWDLRealTimeMode:", v6);
  }

  else if (v4 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "__clearLinkQualityUpdates");
    objc_msgSend(*(id *)(a1 + 32), "__updateLastAssociatedSSID");
  }

  else if (v4 == 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "__clearLinkQualityUpdates");
  }

void sub_10004C548(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, void *a6)
{
  __int16 v9 = objc_autoreleasePoolPush();
  int v10 = objc_alloc_init(&OBJC_CLASS___W5Event);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5Event setTimestamp:](v10, "setTimestamp:");
  id v11 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(a6, "interfaceName"), @"InterfaceName");
  if (a3 <= 48)
  {
    if (a3 == 20)
    {
      int v12 = v10;
      uint64_t v13 = 21LL;
      goto LABEL_12;
    }

    if (a3 == 34)
    {
      int v12 = v10;
      uint64_t v13 = 26LL;
      goto LABEL_12;
    }
  }

  else
  {
    switch(a3)
    {
      case '1':
        int v12 = v10;
        uint64_t v13 = 27LL;
        goto LABEL_12;
      case '6':
        objc_msgSend(a6, "__clearLinkQualityUpdates");
        -[W5Event setEventID:](v10, "setEventID:", 29LL);
        objc_msgSend( v11,  "setObject:forKeyedSubscript:",   -[W5WiFiChannel initWithChannel:flags:]( [W5WiFiChannel alloc],  "initWithChannel:flags:",  *(unsigned int *)(a4 + 12),  *(unsigned int *)(a4 + 16)),  @"WiFiChannel");
        break;
      case '7':
        int v12 = v10;
        uint64_t v13 = 28LL;
LABEL_12:
        -[W5Event setEventID:](v12, "setEventID:", v13);
        break;
    }
  }

  if (-[W5Event eventID](v10, "eventID"))
  {
    -[W5Event setInfo:](v10, "setInfo:", v11);
    if ([a6 updatedWiFiCallback])
    {
      id v14 = (void (**)(id, W5Event *))[a6 updatedWiFiCallback];
      v14[2](v14, v10);
    }
  }

  objc_autoreleasePoolPop(v9);
}

void sub_10004C710(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v3 + 48))
  {
    *(_BYTE *)(v3 + 4_Block_object_dispose(va, 8) = 1;
    id v4 = *(id *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 32), "__startEventMonitoring");
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10004C80C(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v3 + 48))
  {
    *(_BYTE *)(v3 + 4_Block_object_dispose(va, 8) = 0;
    objc_msgSend(*(id *)(a1 + 32), "__stopEventMonitoring");
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10004C8B0(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  *(_BYTE *)(*(void *)(a1 + 32) + 88LL) = *(_BYTE *)(a1 + 40);
  objc_autoreleasePoolPop(v2);
}

void sub_10004C934(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();

  *(void *)(*(void *)(a1 + 32) + 64) = objc_msgSend( objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "SSID"),  "copy");
  *(void *)(*(void *)(a1 + 32) + 72) = objc_msgSend( objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "networkName"),  "copy");
  objc_autoreleasePoolPop(v2);
}

void sub_10004C9FC(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 56) removeAllObjects];
  objc_autoreleasePoolPop(v2);
}

void sub_10004CA88(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  if ([*(id *)(*(void *)(a1 + 32) + 56) count] == (id)10) {
    [*(id *)(*(void *)(a1 + 32) + 56) removeObjectAtIndex:0];
  }
  [*(id *)(*(void *)(a1 + 32) + 56) addObject:*(void *)(a1 + 40)];
  objc_autoreleasePoolPop(v2);
}

void sub_10004CB8C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10004CBA4(uint64_t a1, uint64_t a2)
{
}

void sub_10004CBB4(uint64_t a1)
{
}

void sub_10004CBC0(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 56) copy];
  objc_autoreleasePoolPop(v2);
}

W5WiFiChannel *sub_10004CD2C(W5WiFiChannel *result)
{
  if (result) {
    return  -[W5WiFiChannel initWithChannel:flags:]( objc_alloc(&OBJC_CLASS___W5WiFiChannel),  "initWithChannel:flags:",  -[W5WiFiChannel channel](result, "channel"),  -[W5WiFiChannel flags](result, "flags"));
  }
  return result;
}

void sub_10004CE38( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10004CE50(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 64) copy];
  objc_autoreleasePoolPop(v2);
}

void sub_10004CF3C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10004CF54(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 72) copy];
  objc_autoreleasePoolPop(v2);
}

id sub_10004D23C(void *a1)
{
  if (!a1) {
    return 0LL;
  }
  id v2 = objc_alloc_init(&OBJC_CLASS___W5WiFiScanResult);
  objc_msgSend(v2, "setScanRecord:", objc_msgSend(a1, "scanRecord"));
  objc_msgSend(v2, "setSsid:", objc_msgSend(a1, "SSID"));
  objc_msgSend(v2, "setSsidString:", objc_msgSend(a1, "networkName"));
  objc_msgSend(v2, "setBssid:", objc_msgSend(a1, "BSSID"));
  objc_msgSend(v2, "setChannel:", sub_10004CD2C((W5WiFiChannel *)objc_msgSend(a1, "channel")));
  objc_msgSend(v2, "setCountryCode:", objc_msgSend(a1, "countryCode"));
  objc_msgSend(v2, "setBeaconInterval:", objc_msgSend(a1, "beaconInterval"));
  objc_msgSend(v2, "setRssi:", objc_msgSend(a1, "RSSI"));
  objc_msgSend(v2, "setNoise:", objc_msgSend(a1, "noise"));
  objc_msgSend(v2, "setIsIBSS:", objc_msgSend(a1, "isIBSS"));
  objc_msgSend(v2, "setIsAppleSWAP:", objc_msgSend(a1, "isAppleSWAP"));
  objc_msgSend(v2, "setIsPasspoint:", objc_msgSend(a1, "isPasspoint"));
  objc_msgSend(v2, "setIsPersonalHotspot:", objc_msgSend(a1, "isPersonalHotspot"));
  id v3 = [a1 airPortBaseStationModel];
  switch((unint64_t)v3)
  {
    case 'f':
      id v4 = @"AirPort Express (802.11 b/g)";
      break;
    case 'g':
    case 'n':
    case 'o':
    case 'p':
    case 'v':
      goto LABEL_6;
    case 'h':
      id v4 = @"AirPort Extreme 802.11n (1st Generation)";
      break;
    case 'i':
      id v4 = @"AirPort Extreme 802.11n w/ Gigabit Ethernet (2nd Generation)";
      break;
    case 'j':
      id v4 = @"Time Capsule (1st Generation)";
      break;
    case 'k':
      id v4 = @"AirPort Express 802.11n (1st Generation)";
      break;
    case 'l':
      id v4 = @"AirPort Extreme 802.11n w/ Simultaneous Dual-Band (3rd Generation)";
      break;
    case 'm':
      id v4 = @"Time Capsule w/ Simultaneous Dual-Band (2nd Generation)";
      break;
    case 'q':
      id v4 = @"Time Capsule w/ Simultaneous Dual-Band (3rd Generation)";
      break;
    case 'r':
      id v4 = @"AirPort Extreme 802.11n w/ Simultaneous Dual-Band (4th Generation)";
      break;
    case 's':
      id v4 = @"AirPort Express 802.11n w/ Simultaneous Dual-Band (2nd Generation)";
      break;
    case 't':
      id v4 = @"Time Capsule w/ Simultaneous Dual-Band (4th Generation)";
      break;
    case 'u':
      id v4 = @"AirPort Extreme 802.11n w/ Simultaneous Dual-Band (5th Generation)";
      break;
    case 'w':
      id v4 = @"Time Capsule 802.11ac (5th Generation)";
      break;
    case 'x':
      id v4 = @"AirPort Extreme 802.11ac (6th Generation)";
      break;
    default:
      if (v3 == (id)3) {
        id v4 = @"AirPort Extreme (802.11 b/g)";
      }
      else {
LABEL_6:
      }
        id v4 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"? (%ld)", v3);
      break;
  }

  [v2 setAirPortBaseStationModelName:v4];
  objc_msgSend(v2, "setSupportedPHYModes:", objc_msgSend(a1, "supportedPHYModes"));
  id v5 = [a1 supportedSecurityTypes];
  id v6 = [a1 WAPISubtype];
  id v7 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v8 = v7;
  if ((v5 & 0x80) != 0)
  {
    [v7 addObject:&off_1000DEFA0];
    if ((v5 & 0x20) == 0)
    {
LABEL_22:
      goto LABEL_29;
    }
  }

  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_22;
  }

  [v8 addObject:&off_1000DEF88];
  if ((v5 & 8) == 0)
  {
LABEL_23:
    goto LABEL_30;
  }

LABEL_29:
  [v8 addObject:&off_1000DEFB8];
  if ((v5 & 0x40) == 0)
  {
LABEL_24:
LABEL_31:
    [v8 addObject:&off_1000DEDF0];
    goto LABEL_32;
  }

                  id v25 = "?";
                  if (v36 == 512) {
                    id v25 = "IPSecWiFi";
                  }
                  goto LABEL_36;
                }

                id v25 = "BTLE";
              }

LABEL_30:
  [v8 addObject:&off_1000DEE38];
LABEL_25:
  if (v5 == (id)4)
  {
    __int16 v9 = &off_1000DEDC0;
    goto LABEL_38;
  }

    id v15 = IOReportCopyChannelsInCategories(2LL, 2LL, 0LL);
    if (v15)
    {
      unint64_t v16 = (const void *)v15;
      if (IOReportGetChannelCount())
      {
        unsigned int v17 = CFStringCreateWithCString(kCFAllocatorDefault, "Energy Model", 0);
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472LL;
        v26[2] = sub_100068210;
        v26[3] = &unk_1000D2DF0;
        v26[4] = v17;
        IOReportPrune(v16, v26);
        CFRelease(v17);
        IOReportMergeChannels(v4, v16, 0LL);
      }

      CFRelease(v16);
    }

    int v18 = IOReportCopyChannelsInCategories(2LL, 2LL, 0LL);
    if (v18)
    {
      unsigned int v19 = (const void *)v18;
      if (IOReportGetChannelCount())
      {
        uint64_t v20 = CFStringCreateWithCString(kCFAllocatorDefault, "CPU Stats", 0);
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472LL;
        v25[2] = sub_100068264;
        void v25[3] = &unk_1000D2DF0;
        v25[4] = v20;
        IOReportPrune(v19, v25);
        CFRelease(v20);
        IOReportMergeChannels(v4, v19, 0LL);
      }

      CFRelease(v19);
    }

    uint64_t v21 = IOReportCopyChannelsInCategories(2LL, 2LL, 0LL);
    if (v21)
    {
      id v22 = (const void *)v21;
      if (IOReportGetChannelCount())
      {
        char v23 = CFStringCreateWithCString(kCFAllocatorDefault, "Voltage Domain Performance States", 0);
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472LL;
        v24[2] = sub_1000682B8;
        v24[3] = &unk_1000D2DF0;
        void v24[4] = v23;
        IOReportPrune(v22, v24);
        CFRelease(v23);
        IOReportMergeChannels(v4, v22, 0LL);
      }

      CFRelease(v22);
    }

    self->_ioReportSubscription = (__IOReportSubscriptionCF *)IOReportCreateSubscription( kCFAllocatorDefault,  v4,  &self->_ioReportChannels,  0LL,  0LL);
    CFRelease(v4);
  }

LABEL_32:
  if (v5 != (id)2) {
    goto LABEL_39;
  }
  if (v6 == (id)2) {
    __int16 v9 = &off_1000DEE80;
  }
  else {
    __int16 v9 = &off_1000DF048;
  }
LABEL_38:
  [v8 addObject:v9];
LABEL_39:
  objc_msgSend(v2, "setSupportedSecurityTypes:", objc_msgSend(v8, "copy"));
  unsigned int v10 = [a1 isWEP];
  id v11 = [a1 WPAUnicastCiphers];
  unint64_t v12 = (unint64_t)[a1 WPAMulticastCipher];
  if (([v11 containsObject:&off_1000DF000] & 1) != 0
    || ((v12 & 0xFFFFFFFFFFFFFFFBLL) == 1 ? (LODWORD(v13) = 1) : (LODWORD(v13) = v10),
        [v11 containsObject:&off_1000DF018]))
  {
    LODWORD(v13) = 1;
  }

  unsigned int v14 = [v11 containsObject:&off_1000DF030];
  id v15 = [a1 RSNUnicastCiphers];
  unint64_t v16 = (unint64_t)[a1 RSNMulticastCipher];
  if (([v15 containsObject:&off_1000DF000] & 1) != 0
    || ((v16 & 0xFFFFFFFFFFFFFFFBLL) == 1 ? (uint64_t v13 = 1LL) : (uint64_t v13 = v13),
        [v15 containsObject:&off_1000DF018]))
  {
    uint64_t v13 = 1LL;
  }

  unsigned int v17 = [v15 containsObject:&off_1000DF030];
  if (v16 == 2) {
    int v18 = 1;
  }
  else {
    int v18 = v17;
  }
  unsigned int v19 = v18 | v14;
  if (v12 == 2) {
    uint64_t v20 = 1LL;
  }
  else {
    uint64_t v20 = v19;
  }
  [v2 setSupportsWEPCipher:v13];
  [v2 setSupportsTKIPCipher:v20];
  return v2;
}

uint64_t sub_10004D94C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 == 128) {
    return 12LL;
  }
  if ((a1 & 0x20) != 0)
  {
    if ((a1 & 8) != 0) {
      return 10LL;
    }
    else {
      return 11LL;
    }
  }

  else if ((a1 & 8) != 0)
  {
    return 9LL;
  }

  else
  {
    uint64_t v4 = 2LL;
    uint64_t v5 = 14LL;
    if (a3 != 2) {
      uint64_t v5 = 15LL;
    }
    if (a1 != 2) {
      uint64_t v5 = 0LL;
    }
    uint64_t v6 = 8LL;
    if (a2 != 5) {
      uint64_t v6 = 1LL;
    }
    if ((a1 & 1) != 0) {
      uint64_t v5 = v6;
    }
    if (a1 != 4) {
      uint64_t v4 = v5;
    }
    uint64_t v7 = 3LL;
    if ((a1 & 4) == 0) {
      uint64_t v7 = 4LL;
    }
    if ((a1 & 0x10) != 0) {
      uint64_t v4 = v7;
    }
    uint64_t v8 = 5LL;
    if ((a1 & 0x10) != 0) {
      uint64_t v8 = 6LL;
    }
    if ((a1 & 0x40) != 0) {
      return v8;
    }
    else {
      return v4;
    }
  }

void sub_10004DABC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10004DAD4(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  id v3 = *(id **)(a1 + 40);
  if (*(void *)(a1 + 32))
  {
    id v4 = objc_msgSend(v3[10], "objectForKeyedSubscript:");
    if (!v4)
    {
      id v4 = [*(id *)(a1 + 40) preferredNetworksList];
      [*(id *)(*(void *)(a1 + 40) + 80) setObject:v4 forKeyedSubscript:*(void *)(a1 + 32)];
    }
  }

  else
  {
    id v4 = [v3 preferredNetworksList];
  }

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = v4;
  objc_autoreleasePoolPop(v2);
}

void sub_10004DBAC(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 80), "removeObjectForKey:");
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10004E110(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  id v3 = objc_msgSend( objc_msgSend(*(id *)(a1 + 32), "__ipv6SetupConfig"),  "objectForKeyedSubscript:",  kSCPropNetIPv6ConfigMethod);
  if ([v3 isEqualToString:kSCValNetIPv6ConfigMethodAutomatic])
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v5 = 1LL;
  }

  else if ([v3 isEqualToString:kSCValNetIPv6ConfigMethodLinkLocal])
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v5 = 2LL;
  }

  else if ([v3 isEqualToString:kSCValNetIPv6ConfigMethodManual])
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v5 = 3LL;
  }

  else if ([v3 isEqualToString:kSCValNetIPv6ConfigMethodRouterAdvertisement])
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v5 = 4LL;
  }

  else
  {
    unsigned int v6 = [v3 isEqualToString:kSCValNetIPv6ConfigMethod6to4];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
    if (v6) {
      uint64_t v5 = 5LL;
    }
    else {
      uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  *(void *)(v4 + 24) = v5;
  objc_autoreleasePoolPop(v2);
}

void sub_10004E2B8(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  id v3 = objc_msgSend( objc_msgSend(*(id *)(a1 + 32), "__ipv4SetupConfig"),  "objectForKeyedSubscript:",  kSCPropNetIPv4ConfigMethod);
  if ([v3 isEqualToString:kSCValNetIPv4ConfigMethodAutomatic])
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v5 = 1LL;
  }

  else if ([v3 isEqualToString:kSCValNetIPv4ConfigMethodLinkLocal])
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v5 = 2LL;
  }

  else if ([v3 isEqualToString:kSCValNetIPv4ConfigMethodDHCP])
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v5 = 3LL;
  }

  else if ([v3 isEqualToString:kSCValNetIPv4ConfigMethodManual])
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v5 = 4LL;
  }

  else if ([v3 isEqualToString:kSCValNetIPv4ConfigMethodBOOTP])
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v5 = 5LL;
  }

  else if ([v3 isEqualToString:kSCValNetIPv4ConfigMethodINFORM])
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v5 = 6LL;
  }

  else
  {
    unsigned int v6 = [v3 isEqualToString:kSCValNetIPv4ConfigMethodPPP];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
    if (v6) {
      uint64_t v5 = 7LL;
    }
    else {
      uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  *(void *)(v4 + 24) = v5;
  objc_autoreleasePoolPop(v2);
}

void sub_10004E4B0(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  if (objc_msgSend(*(id *)(a1 + 32), "__dnsSetupConfig")) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10004E588(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  id v3 = objc_msgSend(*(id *)(a1 + 32), "__proxiesSetupConfig");
  if ([v3 count] != (id)2)
  {
    if ([v3 count]) {
      goto LABEL_9;
    }
LABEL_8:
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
    goto LABEL_9;
  }

  id v4 = [v3 objectForKeyedSubscript:kSCPropNetProxiesExceptionsList];
  if ([v4 count] == (id)2
    && [v4 containsObject:@"*.local"]
    && [v4 containsObject:@"169.254/16"]
    && (objc_msgSend( objc_msgSend(v3, "objectForKeyedSubscript:", kSCPropNetProxiesFTPPassive),  "BOOLValue") & 1) != 0)
  {
    goto LABEL_8;
  }

void sub_10004ED50(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();

  *(void *)(*(void *)(a1 + 32) + 32) = [*(id *)(a1 + 40) copy];
  objc_autoreleasePoolPop(v2);
}

void sub_10004EE48(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v3 + 24))
  {
    *(_BYTE *)(v3 + 24) = 1;
    id v4 = *(id *)(a1 + 32);
    -[BluetoothManager maskLocalDeviceEvents:]( +[BluetoothManager sharedInstance](&OBJC_CLASS___BluetoothManager, "sharedInstance"),  "maskLocalDeviceEvents:",  0LL);
    uint64_t v5 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v5,  "addObserver:selector:name:object:",  *(void *)(a1 + 32),  "__ios__handleBTAvailabilityNotification:",  BluetoothAvailabilityChangedNotification,  0LL);
    -[NSNotificationCenter addObserver:selector:name:object:]( v5,  "addObserver:selector:name:object:",  *(void *)(a1 + 32),  "__ios__handleBTPowerNotification:",  BluetoothPowerChangedNotification,  0LL);
    -[NSNotificationCenter addObserver:selector:name:object:]( v5,  "addObserver:selector:name:object:",  *(void *)(a1 + 32),  "__ios__handleBTConnectabiliyNotification:",  BluetoothConnectabilityChangedNotification,  0LL);
    -[NSNotificationCenter addObserver:selector:name:object:]( v5,  "addObserver:selector:name:object:",  *(void *)(a1 + 32),  "__ios__handleBTDiscoveryNotification:",  BluetoothDiscoveryStateChangedNotification,  0LL);
    -[NSNotificationCenter addObserver:selector:name:object:]( v5,  "addObserver:selector:name:object:",  *(void *)(a1 + 32),  "__ios__handleBTAdvertisingNotification:",  BluetoothAdvertisingStateChangedNotification,  0LL);
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10004EFC0(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v3 + 24))
  {
    *(_BYTE *)(v3 + 24) = 0;
    -[BluetoothManager maskLocalDeviceEvents:]( +[BluetoothManager sharedInstance](&OBJC_CLASS___BluetoothManager, "sharedInstance"),  "maskLocalDeviceEvents:",  0xFFFFFFFFLL);
    -[NSNotificationCenter removeObserver:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "removeObserver:",  *(void *)(a1 + 32));
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10004F0B4(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = -[BluetoothManager powerState]( +[BluetoothManager sharedInstance]( &OBJC_CLASS___BluetoothManager,  "sharedInstance"),  "powerState") == 2;
  objc_autoreleasePoolPop(v2);
}

void sub_10004F1A8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10004F1C0(uint64_t a1, uint64_t a2)
{
}

void sub_10004F1D0(uint64_t a1)
{
}

void sub_10004F1DC(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = objc_msgSend( -[BluetoothManager localAddress]( +[BluetoothManager sharedInstance]( BluetoothManager,  "sharedInstance"),  "localAddress"),  "copy");
  objc_autoreleasePoolPop(v2);
}

void sub_10004F2B0(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = -[BluetoothManager isDiscoverable]( +[BluetoothManager sharedInstance]( &OBJC_CLASS___BluetoothManager,  "sharedInstance"),  "isDiscoverable");
  objc_autoreleasePoolPop(v2);
}

void sub_10004F380(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = -[BluetoothManager connectable]( +[BluetoothManager sharedInstance]( &OBJC_CLASS___BluetoothManager,  "sharedInstance"),  "connectable");
  objc_autoreleasePoolPop(v2);
}

void sub_10004F450(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = -[BluetoothManager available]( +[BluetoothManager sharedInstance]( &OBJC_CLASS___BluetoothManager,  "sharedInstance"),  "available");
  objc_autoreleasePoolPop(v2);
}

void sub_10004F520(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = -[BluetoothManager deviceScanningInProgress]( +[BluetoothManager sharedInstance]( &OBJC_CLASS___BluetoothManager,  "sharedInstance"),  "deviceScanningInProgress");
  objc_autoreleasePoolPop(v2);
}

void sub_10004F5BC(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___W5Event);
  -[W5Event setEventID:](v3, "setEventID:", 3LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5Event setTimestamp:](v3, "setTimestamp:");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 32LL);
  if (v4) {
    (*(void (**)(uint64_t, W5Event *))(v4 + 16))(v4, v3);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10004F68C(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___W5Event);
  -[W5Event setEventID:](v3, "setEventID:", 3LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5Event setTimestamp:](v3, "setTimestamp:");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 32LL);
  if (v4) {
    (*(void (**)(uint64_t, W5Event *))(v4 + 16))(v4, v3);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10004F75C(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___W5Event);
  -[W5Event setEventID:](v3, "setEventID:", 3LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5Event setTimestamp:](v3, "setTimestamp:");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 32LL);
  if (v4) {
    (*(void (**)(uint64_t, W5Event *))(v4 + 16))(v4, v3);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10004F82C(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___W5Event);
  -[W5Event setEventID:](v3, "setEventID:", 3LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5Event setTimestamp:](v3, "setTimestamp:");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 32LL);
  if (v4) {
    (*(void (**)(uint64_t, W5Event *))(v4 + 16))(v4, v3);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10004F8FC(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___W5Event);
  -[W5Event setEventID:](v3, "setEventID:", 3LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5Event setTimestamp:](v3, "setTimestamp:");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 32LL);
  if (v4) {
    (*(void (**)(uint64_t, W5Event *))(v4 + 16))(v4, v3);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_100050444(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 32), "__nextRequest");
  objc_autoreleasePoolPop(v2);
}

void sub_1000505E0(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  id v3 = objc_msgSend(*(id *)(a1 + 32), "__pendingRequestWithUUID:", *(void *)(a1 + 40));
  if (v3)
  {
    uint64_t v4 = v3;
    if ([v3 reply])
    {
      uint64_t v5 = (void (**)(id, NSError *))[v4 reply];
      NSErrorUserInfoKey v15 = NSLocalizedFailureReasonErrorKey;
      unint64_t v16 = @"W5CancelledErr";
      v5[2]( v5,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  6LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL)));
    }

    uint64_t v6 = *(void *)(a1 + 48);
    if (v6) {
      (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0LL);
    }
    [*(id *)(*(void *)(a1 + 32) + 48) removeObject:v4];
  }

  else if (objc_msgSend( objc_msgSend(objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "requestInfo"), "uuid"),  "isEqual:",  *(void *)(a1 + 40)))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 24);
    if (v8)
    {
      kill((pid_t)[v8 processIdentifier], 9);

      *(void *)(*(void *)(a1 + 32) + 24LL) = 0LL;
      uint64_t v7 = *(void *)(a1 + 32);
    }

    __int16 v9 = *(void **)(v7 + 32);
    if (v9)
    {
      kill((pid_t)[v9 processIdentifier], 9);

      *(void *)(*(void *)(a1 + 32) + 32LL) = 0LL;
      uint64_t v7 = *(void *)(a1 + 32);
    }

    if (objc_msgSend(objc_msgSend(*(id *)(v7 + 56), "requestInfo"), "reply"))
    {
      unsigned int v10 = (void (**)(id, void))objc_msgSend( objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "requestInfo"),  "reply");
      v10[2](v10, 0LL);
    }

    uint64_t v11 = *(void *)(a1 + 48);
    if (v11) {
      (*(void (**)(uint64_t, void))(v11 + 16))(v11, 0LL);
    }

    *(void *)(*(void *)(a1 + 32) + 56LL) = 0LL;
  }

  else
  {
    uint64_t v12 = *(void *)(a1 + 48);
    if (v12)
    {
      NSErrorUserInfoKey v13 = NSLocalizedFailureReasonErrorKey;
      unsigned int v14 = @"W5ParamErr";
      (*(void (**)(uint64_t, NSError *))(v12 + 16))( v12,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  1LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL)));
    }
  }

  if (*(void *)(*(void *)(a1 + 32) + 16LL)
    && +[W5FeatureAvailability isInternalBuild](&OBJC_CLASS___W5FeatureAvailability, "isInternalBuild"))
  {
    [*(id *)(*(void *)(a1 + 32) + 16) removeNotificationWithUUID:*(void *)(a1 + 40)];
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10005096C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(dispatch_queue_s **)(v2 + 64);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000509C4;
  v4[3] = &unk_1000D1BA8;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_1000509C4(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  *(void *)(*(void *)(a1 + 32) + 32LL) = *(id *)(a1 + 40);
  objc_autoreleasePoolPop(v2);
}

void sub_100051110(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(dispatch_queue_s **)(v3 + 64);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005116C;
  block[3] = &unk_1000D1858;
  void block[4] = a3;
  void block[5] = v3;
  void block[6] = a2;
  dispatch_async(v4, block);
}

void sub_10005116C(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = (os_log_s *)sub_10008C90C();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v9 = 136315906;
      unsigned int v10 = "-[W5WiFiSniffManager __nextRequest]_block_invoke_2";
      __int16 v11 = 2080;
      uint64_t v12 = "W5WiFiSniffManager.m";
      __int16 v13 = 1024;
      int v14 = 378;
      __int16 v15 = 2114;
      uint64_t v16 = v6;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v4,  0LL,  "[wifivelocity] %s (%s:%u) tcpdump failed to start %{public}@",  &v9,  38);
    }

    if (objc_msgSend(objc_msgSend(*(id *)(*(void *)(a1 + 40) + 56), "requestInfo"), "reply"))
    {
      uint64_t v7 = (void (**)(id, void))objc_msgSend( objc_msgSend(*(id *)(*(void *)(a1 + 40) + 56), "requestInfo"),  "reply");
      v7[2](v7, *(void *)(a1 + 32));
    }

    *(void *)(*(void *)(a1 + 40) + 56LL) = 0LL;
    objc_msgSend(*(id *)(a1 + 40), "__nextRequest");
  }

  else
  {
    if (v5)
    {
      int v9 = 136315650;
      unsigned int v10 = "-[W5WiFiSniffManager __nextRequest]_block_invoke";
      __int16 v11 = 2080;
      uint64_t v12 = "W5WiFiSniffManager.m";
      __int16 v13 = 1024;
      int v14 = 389;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v4,  0LL,  "[wifivelocity] %s (%s:%u) tcpdump started",  (const char *)&v9,  28);
    }

    uint64_t v8 = *(void *)(a1 + 40);
    if (*(void *)(v8 + 16))
    {
      [*(id *)(*(void *)(a1 + 40) + 16) dispatchNotificationWithTitle:@"WiFi Disconnected", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@ %@", @"Sniffer on Channel", objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(v8 + 56), "requestInfo"), "channel"), "snifferDescription")), @"WiFi will remain disconnected while sniffer log collection is active.", 0, objc_msgSend(objc_msgSend(*(id *)(*(void *)(a1 + 40) + 56), "requestInfo"), "uuid"), 0 subtitle body type UUID actionURL];
      uint64_t v8 = *(void *)(a1 + 40);
    }

    *(void *)(*(void *)(a1 + 40) + 24LL) = *(id *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "__setupWatchdogTask");
  }

  objc_autoreleasePoolPop(v2);
}

void sub_1000513E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(void *)(v4 + 16))
  {
    unsigned int v6 = +[W5FeatureAvailability isInternalBuild](&OBJC_CLASS___W5FeatureAvailability, "isInternalBuild");
    uint64_t v4 = *(void *)(a1 + 32);
    if (v6)
    {
      objc_msgSend( *(id *)(v4 + 16),  "removeNotificationWithUUID:",  objc_msgSend(objc_msgSend(*(id *)(v4 + 56), "requestInfo"), "uuid"));
      uint64_t v4 = *(void *)(a1 + 32);
    }
  }

  uint64_t v7 = *(dispatch_queue_s **)(v4 + 64);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100051494;
  v8[3] = &unk_1000D1BA8;
  v8[4] = v4;
  v8[5] = a3;
  dispatch_async(v7, v8);
}

void sub_100051494(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  if (objc_msgSend(objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "requestInfo"), "reply"))
  {
    uint64_t v3 = (void (**)(id, void))objc_msgSend( objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "requestInfo"),  "reply");
    if ([*(id *)(a1 + 40) code] == (id)3) {
      uint64_t v4 = 0LL;
    }
    else {
      uint64_t v4 = *(void *)(a1 + 40);
    }
    v3[2](v3, v4);
  }

  *(void *)(*(void *)(a1 + 32) + 24LL) = 0LL;
  uint64_t v5 = *(void *)(a1 + 32);
  unsigned int v6 = *(void **)(v5 + 32);
  if (v6)
  {
    kill((pid_t)[v6 processIdentifier], 9);

    *(void *)(*(void *)(a1 + 32) + 32LL) = 0LL;
    uint64_t v5 = *(void *)(a1 + 32);
  }

  *(void *)(*(void *)(a1 + 32) + 56LL) = 0LL;
  objc_msgSend(*(id *)(a1 + 32), "__nextRequest");
  objc_autoreleasePoolPop(v2);
}

void sub_100051600(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = *(void *)(*(void *)(a1 + 32) + 56LL) == 0LL;
  objc_autoreleasePoolPop(v2);
}

void sub_100051690(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];

  *(void *)(*(void *)(a1 + 32) + 56LL) = 0LL;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 24);
  if (v4)
  {
    kill((pid_t)[v4 processIdentifier], 9);

    *(void *)(*(void *)(a1 + 32) + 24LL) = 0LL;
    uint64_t v3 = *(void *)(a1 + 32);
  }

  uint64_t v5 = *(void **)(v3 + 32);
  if (v5)
  {
    kill((pid_t)[v5 processIdentifier], 9);

    *(void *)(*(void *)(a1 + 32) + 32LL) = 0LL;
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_100053438()
{
  uint64_t v3 = 0LL;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x3052000000LL;
  unsigned int v6 = sub_1000558E4;
  uint64_t v7 = sub_1000558F4;
  uint64_t v0 = qword_1000F7550;
  uint64_t v8 = qword_1000F7550;
  if (!qword_1000F7550)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472LL;
    v2[2] = sub_100074718;
    v2[3] = &unk_1000D12E0;
    v2[4] = &v3;
    sub_100074718((uint64_t)v2);
    uint64_t v0 = v4[5];
  }

  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1000534E0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100053580(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();

  *(void *)(*(void *)(a1 + 32) + 208) = [*(id *)(a1 + 40) copy];
  objc_autoreleasePoolPop(v2);
}

void sub_10005364C(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();

  *(void *)(*(void *)(a1 + 32) + 224) = [*(id *)(a1 + 40) copy];
  objc_autoreleasePoolPop(v2);
}

void sub_100053718(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();

  *(void *)(*(void *)(a1 + 32) + 216) = [*(id *)(a1 + 40) copy];
  objc_autoreleasePoolPop(v2);
}

void sub_100053B9C(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  if (objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "itemRequests"), "count") != (id)1
    || objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "itemRequests"), "firstObject"), "itemID") != (id)56)
  {
    if (objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "itemRequests"), "count") != (id)1
      || objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "itemRequests"), "firstObject"), "itemID") != (id)79)
    {
      if (objc_msgSend( objc_msgSend( objc_msgSend(*(id *)(a1 + 32), "configuration"),  "objectForKeyedSubscript:",  @"CacheSysdiagnose"),  "BOOLValue"))
      {
        int v14 = (os_log_s *)sub_10008C90C();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v43) = 0;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "[wifivelocity] Cached content for sysdiagnose will be generated before processing request",  &v43,  2);
        }

        __int16 v15 = objc_alloc_init(&OBJC_CLASS___W5LogItemRequestInternal);
        -[W5LogItemRequestInternal setUuid:](v15, "setUuid:", +[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
        uint64_t v34 = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  56LL,  0LL);
        -[W5LogItemRequestInternal setItemRequests:]( v15,  "setItemRequests:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v34, 1LL));
        -[W5LogItemRequestInternal setConfiguration:](v15, "setConfiguration:", &off_1000E1C78);
        -[W5LogItemRequestInternal setFilename:]( v15,  "setFilename:",  -[NSUUID UUIDString](-[W5LogItemRequestInternal uuid](v15, "uuid"), "UUIDString"));
        -[W5LogItemRequestInternal setAdditionalLog:](v15, "setAdditionalLog:", 0LL);
        -[W5LogItemRequestInternal setUid:](v15, "setUid:", [*(id *)(a1 + 32) uid]);
        -[W5LogItemRequestInternal setGid:](v15, "setGid:", [*(id *)(a1 + 32) gid]);
        -[W5LogItemRequestInternal setIncludeEvents:](v15, "setIncludeEvents:", 0LL);
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472LL;
        v32[2] = sub_100054558;
        v32[3] = &unk_1000D2AC0;
        uint64_t v16 = *(void *)(a1 + 32);
        v32[4] = *(void *)(a1 + 40);
        v32[5] = v15;
        void v32[6] = v16;
        -[W5LogItemRequestInternal setReply:](v15, "setReply:", v32);
        [*(id *)(*(void *)(a1 + 40) + 48) addObject:v15];
        unsigned int v17 = (os_log_s *)sub_10008C90C();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v43) = 0;
          LODWORD(v30) = 2;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  0LL,  "[wifivelocity] Cached content for sysdiagnose (BT) will be generated before processing request",  &v43,  v30);
        }

        int v18 = objc_alloc_init(&OBJC_CLASS___W5LogItemRequestInternal);
        -[W5LogItemRequestInternal setUuid:](v18, "setUuid:", +[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
        __int16 v33 = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  79LL,  0LL);
        -[W5LogItemRequestInternal setItemRequests:]( v18,  "setItemRequests:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v33, 1LL));
        -[W5LogItemRequestInternal setConfiguration:](v18, "setConfiguration:", &off_1000E1CA0);
        -[W5LogItemRequestInternal setFilename:]( v18,  "setFilename:",  -[NSUUID UUIDString](-[W5LogItemRequestInternal uuid](v18, "uuid"), "UUIDString"));
        -[W5LogItemRequestInternal setAdditionalLog:](v18, "setAdditionalLog:", 0LL);
        -[W5LogItemRequestInternal setUid:](v18, "setUid:", [*(id *)(a1 + 32) uid]);
        -[W5LogItemRequestInternal setGid:](v18, "setGid:", [*(id *)(a1 + 32) gid]);
        -[W5LogItemRequestInternal setIncludeEvents:](v18, "setIncludeEvents:", 0LL);
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472LL;
        v31[2] = sub_1000549F4;
        v31[3] = &unk_1000D2AC0;
        uint64_t v19 = *(void *)(a1 + 32);
        v31[4] = *(void *)(a1 + 40);
        v31[5] = v18;
        void v31[6] = v19;
        -[W5LogItemRequestInternal setReply:](v18, "setReply:", v31);
        [*(id *)(*(void *)(a1 + 40) + 48) addObject:v18];
      }

      goto LABEL_22;
    }

    unsigned int v10 = objc_msgSend( objc_msgSend( objc_msgSend(*(id *)(a1 + 32), "configuration"),  "objectForKeyedSubscript:",  @"AllowCachedSysdiagnose"),  "BOOLValue");
    uint64_t v11 = *(void *)(a1 + 40);
    if (v10)
    {
      if (*(void *)(v11 + 184))
      {
        uint64_t v12 = (os_log_s *)sub_10008C90C();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = *(void *)(a1 + 32);
          int v43 = 138543362;
          uint64_t v44 = v13;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "[wifivelocity] Replying with cached content for sysdiagnose (BT) request (%{public}@)",  &v43,  12);
        }

        uint64_t v8 = *(void *)(a1 + 32);
        uint64_t v7 = *(void **)(a1 + 40);
        uint64_t v9 = v7[23];
        goto LABEL_15;
      }

      if (objc_msgSend( objc_msgSend( objc_msgSend(*(id *)(v11 + 56), "configuration"),  "objectForKeyedSubscript:",  @"CachedSysdiagnose"),  "BOOLValue"))
      {
        int v27 = (os_log_s *)sub_10008C90C();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v43) = 0;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v27,  0LL,  "[wifivelocity] Cached content being generated, enqueueing sysdiagnose (BT) request",  &v43,  2);
        }

        goto LABEL_41;
      }

      if (objc_msgSend( *(id *)(a1 + 40),  "__logItems:containsID:",  objc_msgSend( *(id *)(a1 + 40),  "__expandLogItems:configuration:",  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 56), "itemRequests"),  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 56), "configuration")),  14))
      {
        uint64_t v29 = (os_log_s *)sub_10008C90C();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v43) = 0;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v29,  0LL,  "[wifivelocity] Active request contains sysdiagnose, replying immediately with EDEADLK",  &v43,  2);
        }

        if ([*(id *)(a1 + 32) reply])
        {
          id v21 = [*(id *)(a1 + 32) reply];
          NSErrorDomain v22 = NSPOSIXErrorDomain;
          NSErrorUserInfoKey v37 = NSLocalizedFailureReasonErrorKey;
          int v38 = @"EDEADLK";
          char v23 = &v38;
          uint64_t v24 = &v37;
          goto LABEL_34;
        }

        goto LABEL_23;
      }

LABEL_41:
    [*(id *)(*(void *)(a1 + 40) + 48) addObject:*(void *)(a1 + 32)];
    goto LABEL_23;
  }

  if (!objc_msgSend( *(id *)(a1 + 40),  "__logItems:containsID:",  objc_msgSend( *(id *)(a1 + 40),  "__expandLogItems:configuration:",  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 56), "itemRequests"),  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 56), "configuration")),  14)) {
    goto LABEL_22;
  }
  uint64_t v28 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v43) = 0;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v28,  0LL,  "[wifivelocity] Active request contains sysdiagnose, replying immediately with EDEADLK",  &v43,  2);
  }

  if ([*(id *)(a1 + 32) reply])
  {
    id v21 = [*(id *)(a1 + 32) reply];
    NSErrorDomain v22 = NSPOSIXErrorDomain;
    NSErrorUserInfoKey v41 = NSLocalizedFailureReasonErrorKey;
    id v42 = @"EDEADLK";
    char v23 = &v42;
    uint64_t v24 = &v41;
    goto LABEL_34;
  }

LABEL_23:
  objc_autoreleasePoolPop(v2);
}

        __int16 v15 = 0LL;
        goto LABEL_14;
      }
    }

    else
    {
      unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      id v25 = v4;
      __int16 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v17,  1LL,  &v25));
      uint64_t v4 = v25;

      if (!v15)
      {
        NSErrorDomain v22 = sub_10008C90C();
        unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v29 = 136315906;
          uint64_t v30 = "-[W5PeerDiagnosticsRequestPayload encode]";
          int v31 = 2080;
          NSErrorUserInfoKey v32 = "W5PeerDiagnosticsRequestPayload.m";
          __int16 v33 = 1024;
          uint64_t v34 = 90;
          NSErrorUserInfoKey v35 = 2114;
          int v36 = v4;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "[wifivelocity] %s (%s:%u) failed to encode NULL tests with error='%{public}@'",  &v29,  38);
        }

        goto LABEL_23;
      }
    }

    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v15, @"tests");
    int v18 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsRequestPayload uuid](self, "uuid"));

    if (!v18) {
      goto LABEL_15;
    }
    unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsRequestPayload uuid](self, "uuid"));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s UUIDString](v10, "UUIDString"));
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v19, @"uuid");

    goto LABEL_14;
  }

  __int16 v15 = 0LL;
  uint64_t v8 = 0LL;
LABEL_15:
  if (!-[NSMutableDictionary count](v3, "count"))
  {
    char v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s: empty payload",  "-[W5PeerDiagnosticsRequestPayload encode]"));
    uint64_t v24 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v23,  0LL));

    objc_exception_throw(v24);
  }

  return v3;
}

void sub_100054558(int8x16_t *a1, uint64_t a2, uint64_t a3)
{
  v7[1] = 3221225472LL;
  int8x16_t v3 = vextq_s8(a1[2], a1[2], 8uLL);
  uint64_t v4 = a1[2].i64[0];
  v7[0] = _NSConcreteStackBlock;
  v7[2] = sub_1000545C4;
  v7[3] = &unk_1000D2A98;
  uint64_t v5 = *(dispatch_queue_s **)(v4 + 40);
  int8x16_t v8 = v3;
  uint64_t v6 = a1[3].i64[0];
  uint64_t v9 = a3;
  uint64_t v10 = v6;
  dispatch_async(v5, v7);
}

void sub_1000545C4(id *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  int8x16_t v3 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = objc_msgSend(objc_msgSend(objc_msgSend(a1[4], "uuid"), "UUIDString"), "substringToIndex:", 5);
    int v18 = 138543362;
    id v19 = v4;
    int v14 = 12;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v3,  0LL,  "[wifivelocity] Cached content for sysdiagnose generated (uuid=%{public}@), will review pending requests",  &v18,  v14);
  }

  if (*((void *)a1[5] + 22))
  {
    -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  [*((id *)a1[5] + 22) path],  0);
  }

  *((void *)a1[5] + 22) = [a1[6] copy];
  id v5 = +[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet");
  if ([*((id *)a1[5] + 6) count])
  {
    unint64_t v6 = 0LL;
    do
    {
      id v7 = [*((id *)a1[5] + 6) objectAtIndexedSubscript:v6];
      if (objc_msgSend(objc_msgSend(v7, "itemRequests"), "count") == (id)1
        && objc_msgSend(objc_msgSend(objc_msgSend(v7, "itemRequests"), "firstObject"), "itemID") == (id)56
        && objc_msgSend( objc_msgSend( objc_msgSend(a1[7], "configuration"),  "objectForKeyedSubscript:",  @"AllowCachedSysdiagnose"),  "BOOLValue"))
      {
        int8x16_t v8 = (os_log_s *)sub_10008C90C();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 138543362;
          id v19 = v7;
          LODWORD(v13) = 12;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[wifivelocity] Replying with cached content for sysdiagnose request (%{public}@)",  &v18,  v13);
        }

        objc_msgSend(a1[5], "__replyWithCachedSysdiagnoseContentForRequest:temporaryURL:", v7, a1[6]);
        [v5 addIndex:v6];
      }

      ++v6;
    }

    while (v6 < (unint64_t)[*((id *)a1[5] + 6) count]);
  }

  [*((id *)a1[5] + 6) removeObjectsAtIndexes:v5];
  dispatch_time_t v9 = dispatch_time(0LL, 480000000000LL);
  block[1] = 3221225472LL;
  int8x16_t v10 = vextq_s8(*(int8x16_t *)(a1 + 5), *(int8x16_t *)(a1 + 5), 8uLL);
  id v11 = a1[5];
  block[0] = _NSConcreteStackBlock;
  block[2] = sub_10005489C;
  block[3] = &unk_1000D1858;
  uint64_t v12 = (dispatch_queue_s *)*((void *)v11 + 5);
  int8x16_t v16 = v10;
  id v17 = a1[4];
  dispatch_after(v9, v12, block);
  objc_autoreleasePoolPop(v2);
}

void sub_10005489C(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  if (*(void *)(a1 + 32) && objc_msgSend(*(id *)(*(void *)(a1 + 40) + 176), "isEqual:"))
  {
    int8x16_t v3 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 48), "uuid"), "UUIDString"), "substringToIndex:", 5);
      id v5 = [*(id *)(a1 + 32) path];
      v7[0] = 67109634;
      v7[1] = 480;
      __int16 v8 = 2114;
      id v9 = v4;
      __int16 v10 = 2114;
      id v11 = v5;
      int v6 = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v3,  0LL,  "[wifivelocity] CLEANUP cached content for sysdiagnose (delay=%ds, uuid=%{public}@, path='%{public}@')",  v7,  v6);
    }

    -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  [*(id *)(*(void *)(a1 + 40) + 176) path],  0);

    *(void *)(*(void *)(a1 + 40) + 176LL) = 0LL;
  }

  objc_autoreleasePoolPop(v2);
}

void sub_1000549F4(int8x16_t *a1, uint64_t a2, uint64_t a3)
{
  v7[1] = 3221225472LL;
  int8x16_t v3 = vextq_s8(a1[2], a1[2], 8uLL);
  uint64_t v4 = a1[2].i64[0];
  v7[0] = _NSConcreteStackBlock;
  _DWORD v7[2] = sub_100054A60;
  v7[3] = &unk_1000D2A98;
  id v5 = *(dispatch_queue_s **)(v4 + 40);
  int8x16_t v8 = v3;
  uint64_t v6 = a1[3].i64[0];
  uint64_t v9 = a3;
  uint64_t v10 = v6;
  dispatch_async(v5, v7);
}

void sub_100054A60(id *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  int8x16_t v3 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = objc_msgSend(objc_msgSend(objc_msgSend(a1[4], "uuid"), "UUIDString"), "substringToIndex:", 5);
    int v18 = 138543362;
    id v19 = v4;
    int v14 = 12;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v3,  0LL,  "[wifivelocity] Cached content for sysdiagnose (BT) generated (uuid=%{public}@), will review pending requests",  &v18,  v14);
  }

  if (*((void *)a1[5] + 23))
  {
    -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  [*((id *)a1[5] + 23) path],  0);
  }

  *((void *)a1[5] + 23) = [a1[6] copy];
  id v5 = +[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet");
  if ([*((id *)a1[5] + 6) count])
  {
    unint64_t v6 = 0LL;
    do
    {
      id v7 = [*((id *)a1[5] + 6) objectAtIndexedSubscript:v6];
      if (objc_msgSend(objc_msgSend(v7, "itemRequests"), "count") == (id)1
        && objc_msgSend(objc_msgSend(objc_msgSend(v7, "itemRequests"), "firstObject"), "itemID") == (id)79
        && objc_msgSend( objc_msgSend( objc_msgSend(a1[7], "configuration"),  "objectForKeyedSubscript:",  @"AllowCachedSysdiagnose"),  "BOOLValue"))
      {
        int8x16_t v8 = (os_log_s *)sub_10008C90C();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 138543362;
          id v19 = v7;
          LODWORD(v13) = 12;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[wifivelocity] Replying with cached content for sysdiagnose (BT) request (%{public}@)",  &v18,  v13);
        }

        objc_msgSend(a1[5], "__replyWithCachedSysdiagnoseContentForRequest:temporaryURL:", v7, a1[6]);
        [v5 addIndex:v6];
      }

      ++v6;
    }

    while (v6 < (unint64_t)[*((id *)a1[5] + 6) count]);
  }

  [*((id *)a1[5] + 6) removeObjectsAtIndexes:v5];
  dispatch_time_t v9 = dispatch_time(0LL, 480000000000LL);
  block[1] = 3221225472LL;
  int8x16_t v10 = vextq_s8(*(int8x16_t *)(a1 + 5), *(int8x16_t *)(a1 + 5), 8uLL);
  id v11 = a1[5];
  block[0] = _NSConcreteStackBlock;
  block[2] = sub_100054D38;
  block[3] = &unk_1000D1858;
  uint64_t v12 = (dispatch_queue_s *)*((void *)v11 + 5);
  int8x16_t v16 = v10;
  id v17 = a1[4];
  dispatch_after(v9, v12, block);
  objc_autoreleasePoolPop(v2);
}

void sub_100054D38(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  if (*(void *)(a1 + 32) && objc_msgSend(*(id *)(*(void *)(a1 + 40) + 184), "isEqual:"))
  {
    int8x16_t v3 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 48), "uuid"), "UUIDString"), "substringToIndex:", 5);
      id v5 = [*(id *)(a1 + 32) path];
      v7[0] = 67109634;
      v7[1] = 480;
      __int16 v8 = 2114;
      id v9 = v4;
      __int16 v10 = 2114;
      id v11 = v5;
      int v6 = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v3,  0LL,  "[wifivelocity] CLEANUP cached content for sysdiagnose (BT) (delay=%ds, uuid=%{public}@, path='%{public}@')",  v7,  v6);
    }

    -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  [*(id *)(*(void *)(a1 + 40) + 184) path],  0);

    *(void *)(*(void *)(a1 + 40) + 184LL) = 0LL;
  }

  objc_autoreleasePoolPop(v2);
}

void sub_100054EEC(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  id v3 = objc_msgSend(*(id *)(a1 + 32), "__pendingRequestWithUUID:", *(void *)(a1 + 40));
  if (v3)
  {
    id v4 = v3;
    if ([v3 reply])
    {
      id v5 = [v4 reply];
      NSErrorUserInfoKey v14 = NSLocalizedFailureReasonErrorKey;
      __int16 v15 = @"W5CancelledErr";
      (*((void (**)(id, NSError *, void, void))v5 + 2))( v5,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  6LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL)),  0LL,  0LL);
    }

    uint64_t v6 = *(void *)(a1 + 48);
    if (v6) {
      (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0LL);
    }
    [*(id *)(*(void *)(a1 + 32) + 48) removeObject:v4];
  }

  else if (objc_msgSend( objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "uuid"),  "isEqual:",  *(void *)(a1 + 40)))
  {
    if ([*(id *)(*(void *)(a1 + 32) + 56) reply])
    {
      id v7 = [*(id *)(*(void *)(a1 + 32) + 56) reply];
      NSErrorUserInfoKey v12 = NSLocalizedFailureReasonErrorKey;
      uint64_t v13 = @"W5CancelledErr";
      (*((void (**)(id, NSError *, void, void))v7 + 2))( v7,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  6LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL)),  0LL,  0LL);
    }

    uint64_t v8 = *(void *)(a1 + 48);
    if (v8) {
      (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0LL);
    }

    *(void *)(*(void *)(a1 + 32) + 56LL) = 0LL;
  }

  else
  {
    uint64_t v9 = *(void *)(a1 + 48);
    if (v9)
    {
      NSErrorUserInfoKey v10 = NSLocalizedFailureReasonErrorKey;
      id v11 = @"W5ParamErr";
      (*(void (**)(uint64_t, NSError *))(v9 + 16))( v9,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  1LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL)));
    }
  }

  objc_autoreleasePoolPop(v2);
}

void sub_1000551EC(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];

  *(void *)(*(void *)(a1 + 32) + 56LL) = 0LL;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "allValues", 0);
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        kill((pid_t)[*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) processIdentifier], 9);
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  objc_autoreleasePoolPop(v2);
}

int64_t sub_1000557AC(id a1, NSNumber *a2, NSNumber *a3)
{
  return -[NSNumber compare:](a2, "compare:", a3);
}

void sub_1000558CC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_1000558E4(uint64_t a1, uint64_t a2)
{
}

void sub_1000558F4(uint64_t a1)
{
}

void sub_100055900(uint64_t a1, NSError *a2, void *a3, uint64_t a4)
{
  id v8 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "configuration"), "objectForKeyedSubscript:", @"CleanupDelay");
  unsigned int v9 = objc_msgSend( objc_msgSend( objc_msgSend(*(id *)(a1 + 32), "configuration"),  "objectForKeyedSubscript:",  @"Compress"),  "BOOLValue");
  if (a3)
  {
    id v21 = a3;
    uint64_t v24 = 0LL;
    __int128 v10 = -[NSURL URLByAppendingPathComponent:]( +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"/var/run/com.apple.wifivelocity"),  "URLByAppendingPathComponent:",  [*(id *)(a1 + 32) filename]);
    if (v9)
    {
      sub_10008C94C(v21, v10, &v24);
    }

    else
    {
      NSErrorUserInfoKey v12 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
      v28[0] = &off_1000DF060;
      v27[0] = NSFilePosixPermissions;
      v27[1] = NSFileOwnerAccountID;
      v28[1] = +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [*(id *)(a1 + 32) uid]);
      v27[2] = NSFileGroupOwnerAccountID;
      v28[2] = +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [*(id *)(a1 + 32) gid]);
      -[NSFileManager setAttributes:ofItemAtPath:error:]( v12,  "setAttributes:ofItemAtPath:error:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  3),  [v21 path],  0);
    }

    uint64_t v13 = v10;
    if (objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "configuration"), "objectForKeyedSubscript:", @"Reason"))
    {
      NSErrorUserInfoKey v14 = -[NSURL URLByAppendingPathComponent:]( -[NSURL URLByAppendingPathComponent:]( -[NSFileManager containerURLForSecurityApplicationGroupIdentifier:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "containerURLForSecurityApplicationGroupIdentifier:",  @"group.com.apple.wifi.logs"),  "URLByAppendingPathComponent:",  @"previous"),  "URLByAppendingPathComponent:",  [*(id *)(a1 + 32) filename]);
      sub_10008D400(v10, v14, &v24);
      __int16 v15 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
      v26[0] = &off_1000DF060;
      v25[0] = NSFilePosixPermissions;
      v25[1] = NSFileOwnerAccountID;
      v26[1] = +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [*(id *)(a1 + 32) uid]);
      v25[2] = NSFileGroupOwnerAccountID;
      v26[2] = +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [*(id *)(a1 + 32) gid]);
      -[NSFileManager setAttributes:ofItemAtPath:error:]( v15,  "setAttributes:ofItemAtPath:error:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  3LL),  -[NSURL path](v14, "path"),  0LL);
    }

    a3 = v21;
    if ([*(id *)(a1 + 32) reply])
    {
      int8x16_t v16 = (void (**)(id, NSError *, NSURL *, void))[*(id *)(a1 + 32) reply];
      if (v24) {
        id v17 = v24;
      }
      else {
        id v17 = a2;
      }
      v16[2](v16, v17, v13, a4);
    }
  }

  else if ([*(id *)(a1 + 32) reply])
  {
    id v11 = [*(id *)(a1 + 32) reply];
    (*((void (**)(id, NSError *, void, void))v11 + 2))(v11, a2, 0LL, 0LL);
  }

  objc_msgSend( *(id *)(*(void *)(a1 + 40) + 8),  "clearCachedStatusWithUUID:",  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "uuid"), "UUIDString"));
  objc_msgSend( objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "wifi"),  "clearCachedPreferredNetworksListWithUUID:",  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "uuid"), "UUIDString"));
  objc_msgSend( *(id *)(a1 + 40),  "__purgeFilesInDirectory:matching:maxAge:maxCount:",  -[NSURL path]( -[NSURL URLByAppendingPathComponent:]( -[NSFileManager containerURLForSecurityApplicationGroupIdentifier:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "containerURLForSecurityApplicationGroupIdentifier:",  @"group.com.apple.wifi.logs"),  "URLByAppendingPathComponent:",  @"previous"),  "path"),  0,  604800,  20);
  objc_msgSend( *(id *)(a1 + 40),  "__purgeFilesInDirectory:matching:maxAge:maxCount:",  @"/var/run/com.apple.wifivelocity/wifiperf",  0,  21600,  10);
  block[0] = _NSConcreteStackBlock;
  block[2] = sub_100055D64;
  block[3] = &unk_1000D2B50;
  uint64_t v19 = *(void *)(a1 + 32);
  uint64_t v18 = *(void *)(a1 + 40);
  uint64_t v20 = *(dispatch_queue_s **)(v18 + 40);
  block[1] = 3221225472LL;
  void block[4] = v18;
  void block[5] = v8;
  char v23 = v9;
  void block[6] = v19;
  void block[7] = a3;
  void block[8] = *(void *)(a1 + 48);
  dispatch_async(v20, block);
}

void sub_100055D64(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  id v3 = [*(id *)(*(void *)(a1 + 32) + 72) allKeys];
  id v4 = [*(id *)(*(void *)(a1 + 32) + 80) allKeys];
  id v5 = [*(id *)(*(void *)(a1 + 32) + 160) allKeys];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 168) allKeys];
  id v7 = *(void **)(a1 + 40);
  if (v7) {
    int64_t v8 = 1000000000 * (void)[v7 unsignedIntegerValue];
  }
  else {
    int64_t v8 = 120000000000LL;
  }
  dispatch_time_t v9 = dispatch_time(0LL, v8);
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(dispatch_queue_s **)(v10 + 40);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100055E90;
  block[3] = &unk_1000D2B28;
  char v21 = *(_BYTE *)(a1 + 72);
  __int128 v14 = *(_OWORD *)(a1 + 48);
  id v15 = v3;
  uint64_t v16 = v10;
  id v17 = v4;
  id v18 = v5;
  uint64_t v12 = *(void *)(a1 + 64);
  id v19 = v6;
  uint64_t v20 = v12;
  dispatch_after(v9, v11, block);

  *(void *)(*(void *)(a1 + 32) + 56LL) = 0LL;
  objc_msgSend(*(id *)(a1 + 32), "__nextRequest");
  objc_autoreleasePoolPop(v2);
}

void sub_100055E90(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  id v3 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 32) uuid];
    int v16 = 138543362;
    id v17 = v4;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v3,  0LL,  "[wifivelocity] CLEANUP temporary log request resources (uuid=%{public}@)",  &v16,  12);
  }

  if (*(_BYTE *)(a1 + 96)) {
    -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  [*(id *)(a1 + 40) path],  0);
  }
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v5 = *(void **)(a1 + 48);
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*(void *)(a1 + 56) + 72) objectForKeyedSubscript:*(void *)(*((void *)&v11 + 1) + 8 * (void)i)];
        if (v10) {
          kill((pid_t)[v10 processIdentifier], 9);
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }

  [*(id *)(*(void *)(a1 + 56) + 72) removeObjectsForKeys:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(a1 + 56) + 80) removeObjectsForKeys:*(void *)(a1 + 64)];
  [*(id *)(*(void *)(a1 + 56) + 160) removeObjectsForKeys:*(void *)(a1 + 72)];
  [*(id *)(*(void *)(a1 + 56) + 168) removeObjectsForKeys:*(void *)(a1 + 80)];
  objc_msgSend( +[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"),  "osTransactionComplete:",  *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40));

  *(void *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 40LL) = 0LL;
  objc_autoreleasePoolPop(v2);
}

void sub_10005B5F4(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  objc_msgSend( *(id *)(*(void *)(a1 + 32) + 104),  "setObject:forKeyedSubscript:",  v3,  objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "uuid"), "UUIDString"));
  objc_msgSend( *(id *)(*(void *)(a1 + 32) + 96),  "setObject:forKeyedSubscript:",  +[NSMutableString string](NSMutableString, "string"),  objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "uuid"), "UUIDString"));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = *(void **)(a1 + 48);
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0LL; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend( v3,  "setObject:forKeyedSubscript:",  *(void *)(*((void *)&v13 + 1) + 8 * (void)i),  objc_msgSend(objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)i), "uuid"), "UUIDString"));
      }

      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }

    while (v6);
  }

  unsigned int v9 = objc_msgSend( objc_msgSend( objc_msgSend(*(id *)(a1 + 40), "configuration"),  "objectForKeyedSubscript:",  @"UseMegaWiFiProfileLimits"),  "BOOLValue");
  id v10 = "NOT ";
  if (v9) {
    id v10 = "";
  }
  __int128 v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"MegaWiFi profile %sinstalled\n",  v10);
  objc_msgSend( objc_msgSend( *(id *)(*(void *)(a1 + 32) + 96),  "objectForKeyedSubscript:",  objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "uuid"), "UUIDString")),  "appendString:",  v11);
  __int128 v12 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138543362;
    id v18 = v11;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "[wifivelocity] %{public}@",  &v17,  12);
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10005B844(uint64_t a1)
{
  id v2 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3052000000LL;
  uint64_t v28 = sub_1000558E4;
  uint64_t v29 = sub_1000558F4;
  uint64_t v30 = 0LL;
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x2020000000LL;
  char v24 = 0;
  id v3 = dispatch_queue_create(0LL, 0LL);
  id v4 = objc_msgSend( objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "configuration"), "objectForKeyedSubscript:", @"Timeout"),  "unsignedIntegerValue");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005BAB0;
  block[3] = &unk_1000D2BF0;
  __int128 v16 = *(_OWORD *)(a1 + 40);
  uint64_t v17 = *(void *)(a1 + 32);
  __int128 v18 = *(_OWORD *)(a1 + 56);
  id v19 = v3;
  id v20 = v2;
  char v21 = v23;
  NSErrorDomain v22 = &v25;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  objc_msgSend(objc_msgSend(*(id *)(*(void *)(a1 + 48) + 8), "concurrentQueue"), "addOperationWithBlock:", v5);
  if (v4) {
    dispatch_time_t v6 = dispatch_time(0LL, 1000000LL * (void)v4);
  }
  else {
    dispatch_time_t v6 = -1LL;
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  void v14[2] = sub_10005C0C0;
  v14[3] = &unk_1000D26D8;
  v14[4] = v23;
  v14[5] = &v25;
  void v14[6] = dispatch_block_wait(v5, v6);
  dispatch_sync(v3, v14);
  v13[0] = _NSConcreteStackBlock;
  v13[2] = sub_10005C1B0;
  v13[3] = &unk_1000D2C18;
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  unsigned int v9 = *(dispatch_queue_s **)(v7 + 88);
  v13[1] = 3221225472LL;
  v13[7] = &v25;
  v13[8] = v4;
  uint64_t v10 = *(void *)(a1 + 32);
  v13[4] = v7;
  void v13[5] = v10;
  void v13[6] = v8;
  dispatch_sync(v9, v13);
  uint64_t v11 = *(void *)(a1 + 72);
  if (v11) {
    (*(void (**)(uint64_t, id, void, id))(v11 + 16))( v11,  [(id)v26[5] copy],  *(void *)(a1 + 56),  v2);
  }
  id v12 = (id)v26[5];
  dispatch_release(v3);
  _Block_release(v5);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);
}

void sub_10005BA84(_Unwind_Exception *a1)
{
}

void sub_10005BAB0(uint64_t a1)
{
  unint64_t v2 = 0LL;
  v32[0] = 0LL;
  v32[1] = v32;
  v32[2] = 0x2020000000LL;
  v32[3] = 0LL;
  uint64_t v28 = 0LL;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000LL;
  char v31 = 0;
  while (v2 < (unint64_t)[*(id *)(a1 + 32) count]
       && !*((_BYTE *)v29 + 24)
       && !*(_BYTE *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL))
  {
    id v3 = objc_autoreleasePoolPush();
    id v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v2];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005BDA0;
    block[3] = &unk_1000D2BA0;
    unint64_t v27 = v2;
    dispatch_block_t v5 = *(dispatch_queue_s **)(*(void *)(a1 + 40) + 40LL);
    int8x16_t v25 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
    id v26 = v4;
    dispatch_sync(v5, block);
    dispatch_time_t v6 = +[NSMutableDictionary dictionaryWithDictionary:]( NSMutableDictionary,  "dictionaryWithDictionary:",  [v4 configuration]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  *(void *)(a1 + 56),  @"OutputDirectory");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  *(void *)(a1 + 64),  @"HomeDirectory");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 48), "uuid"), "UUIDString"), "copy"),  @"InternalUUID");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [*(id *)(a1 + 48) includeEvents]),  @"IncludeEvents");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  objc_msgSend( objc_msgSend(*(id *)(a1 + 48), "configuration"),  "objectForKeyedSubscript:",  @"UseMegaWiFiProfileLimits"),  @"UseMegaWiFiProfileLimits");
    id v7 = [v4 copy];
    [v7 setConfiguration:v6];
    id v8 = objc_msgSend(*(id *)(a1 + 40), "__collectLogItem:error:", v7, 0);
    id v9 = v8;
    if (v8)
    {
      [v8 setRequest:v4];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_10005BE24;
      void v23[3] = &unk_1000D2660;
      uint64_t v10 = *(void *)(a1 + 88);
      v23[5] = v9;
      v23[6] = v10;
      uint64_t v11 = *(dispatch_queue_s **)(a1 + 72);
      v23[4] = *(void *)(a1 + 80);
      dispatch_sync(v11, v23);
    }

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    void v14[2] = sub_10005BE64;
    v14[3] = &unk_1000D2BC8;
    id v19 = &v28;
    id v12 = *(dispatch_queue_s **)(*(void *)(a1 + 40) + 40LL);
    __int128 v15 = *(_OWORD *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 72);
    __int128 v20 = *(_OWORD *)(a1 + 88);
    uint64_t v16 = v13;
    id v17 = v9;
    char v21 = v32;
    unint64_t v22 = v2;
    uint64_t v18 = *(void *)(a1 + 32);
    dispatch_sync(v12, v14);
    objc_autoreleasePoolPop(v3);
    ++v2;
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(v32, 8);
}

void sub_10005BD6C(_Unwind_Exception *a1)
{
}

void sub_10005BDA0(uint64_t a1)
{
  unint64_t v2 = objc_autoreleasePoolPush();
  if ([*(id *)(a1 + 32) includeEvents])
  {
    if (!*(void *)(a1 + 56))
    {
      uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 208LL);
      if (v3) {
        (*(void (**)(uint64_t, id, void, id, double))(v3 + 16))( v3,  [*(id *)(a1 + 32) uuid],  0,  objc_msgSend(*(id *)(a1 + 48), "copy"),  0.0);
      }
    }
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10005BE24(uint64_t a1)
{
  unint64_t v2 = objc_autoreleasePoolPush();
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)) {
    [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10005BE64(uint64_t a1)
{
  unint64_t v2 = objc_autoreleasePoolPush();
  *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = objc_msgSend( objc_msgSend( *(id *)(*(void *)(a1 + 32) + 56),  "uuid"),  "isEqual:",  objc_msgSend(*(id *)(a1 + 40), "uuid")) ^ 1;
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL))
  {
    uint64_t v3 = *(dispatch_queue_s **)(a1 + 48);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10005BFE8;
    v9[3] = &unk_1000D2310;
    __int128 v10 = *(_OWORD *)(a1 + 80);
    dispatch_sync(v3, v9);
  }

  *(double *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 24LL) = *(double *)(*(void *)(*(void *)(a1 + 96) + 8LL)
                                                                          + 24LL)
                                                              + 1.0;
  if ([*(id *)(a1 + 40) includeEvents])
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 208LL);
    if (v4)
    {
      id v5 = [*(id *)(a1 + 40) uuid];
      dispatch_time_t v6 = *(char **)(a1 + 104);
      uint64_t v7 = *(void *)(a1 + 56);
      else {
        id v8 =  objc_msgSend( objc_msgSend(*(id *)(a1 + 64), "objectAtIndexedSubscript:", *(void *)(a1 + 104) + 1),  "copy");
      }
      (*(void (**)(uint64_t, id, uint64_t, id, double))(v4 + 16))( v4,  v5,  v7,  v8,  *(double *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 24LL)
    }
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10005BFE8(uint64_t a1)
{
  unint64_t v2 = objc_autoreleasePoolPush();
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    NSErrorUserInfoKey v3 = NSLocalizedFailureReasonErrorKey;
    uint64_t v4 = @"W5CancelledErr";
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = -[NSError copy]( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  6LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL)),  "copy");
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10005C0C0(void *a1)
{
  unint64_t v2 = objc_autoreleasePoolPush();
  *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = 1;
  if (a1[6])
  {

    NSErrorUserInfoKey v3 = NSLocalizedFailureReasonErrorKey;
    uint64_t v4 = @"W5TimeoutErr";
    *(void *)(*(void *)(a1[5] + 8LL) + 40LL) = -[NSError copy]( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  3LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL)),  "copy");
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10005C1B0(uint64_t a1)
{
  context = objc_autoreleasePoolPush();
  if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) code] == (id)3)
  {
    unint64_t v2 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"COLLECTION TIMEOUT (timeout=%lums)",  *(void *)(a1 + 64));
    [objc_msgSend( *(id *)(*(void *)(a1 + 32) + 96) objectForKeyedSubscript:objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "uuid"), "UUIDString")), "appendFormat:", @"\n%@\n", v2];
    NSErrorUserInfoKey v3 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v36 = 138543362;
      NSErrorUserInfoKey v37 = (const __CFString *)v2;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v3,  0LL,  "[wifivelocity] %{public}@",  &v36,  12);
    }
  }

  else if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) code] == (id)6)
  {
    [objc_msgSend( *(id *)(*(void *)(a1 + 32) + 96) objectForKeyedSubscript:objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "uuid"), "UUIDString")), "appendFormat:", @"\n%@\n", @"COLLECTION CANCELLED"];
    uint64_t v4 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v36 = 138543362;
      NSErrorUserInfoKey v37 = @"COLLECTION CANCELLED";
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v4,  0LL,  "[wifivelocity] %{public}@",  &v36,  12);
    }
  }

  id v5 = objc_msgSend( *(id *)(*(void *)(a1 + 32) + 96),  "objectForKeyedSubscript:",  objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "uuid"), "UUIDString"));
  id v6 = [*(id *)(*(void *)(a1 + 32) + 104) count];
  uint64_t v7 = "";
  if (!v6) {
    uint64_t v7 = " None";
  }
  objc_msgSend(v5, "appendFormat:", @"\nINCOMPLETE:%s\n", v7);
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id obj = objc_msgSend( objc_msgSend( *(id *)(*(void *)(a1 + 32) + 104),  "objectForKeyedSubscript:",  objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "uuid"), "UUIDString")),  "allValues");
  id v8 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v31;
    do
    {
      for (uint64_t i = 0LL; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        id v13 = objc_msgSend(objc_msgSend(v12, "configuration"), "objectForKeyedSubscript:", @"NameOverride");
        id v14 = objc_msgSend( *(id *)(*(void *)(a1 + 32) + 96),  "objectForKeyedSubscript:",  objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "uuid"), "UUIDString"));
        id v15 = objc_msgSend(objc_msgSend(objc_msgSend(v12, "uuid"), "UUIDString"), "substringToIndex:", 5);
        if (!v13) {
          id v13 = (id)W5DescriptionForLogItemID([v12 itemID]);
        }
        [v14 appendFormat:@"[%@] %@\n", v15, v13];
      }

      id v9 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }

    while (v9);
  }

  uint64_t v16 = -[NSFileManager subpathsOfDirectoryAtPath:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "subpathsOfDirectoryAtPath:error:",  [*(id *)(a1 + 48) path],  0);
  id v17 = objc_msgSend( *(id *)(*(void *)(a1 + 32) + 96),  "objectForKeyedSubscript:",  objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "uuid"), "UUIDString"));
  NSUInteger v18 = -[NSArray count](v16, "count");
  id v19 = "";
  if (!v18) {
    id v19 = " None";
  }
  objc_msgSend(v17, "appendFormat:", @"\nPATHS:%s\n", v19);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v20 = -[NSArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v26,  v34,  16LL);
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v27;
    do
    {
      for (j = 0LL; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v27 != v22) {
          objc_enumerationMutation(v16);
        }
        [objc_msgSend( *(id *)(*(void *)(a1 + 32) + 96) objectForKeyedSubscript:objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "uuid"), "UUIDString")), "appendFormat:", @"./%@\n", *(void *)(*((void *)&v26 + 1) + 8 * (void)j)];
      }

      id v21 = -[NSArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v26,  v34,  16LL);
    }

    while (v21);
  }

  -[NSFileManager createFileAtPath:contents:attributes:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "createFileAtPath:contents:attributes:",  objc_msgSend(objc_msgSend(*(id *)(a1 + 48), "path"), "stringByAppendingPathComponent:", @"debug-log.txt"),  objc_msgSend( objc_msgSend( *(id *)(*(void *)(a1 + 32) + 96),  "objectForKeyedSubscript:",  objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "uuid"), "UUIDString")),  "dataUsingEncoding:",  4),  0);
  objc_msgSend( *(id *)(*(void *)(a1 + 32) + 104),  "removeObjectForKey:",  objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "uuid"), "UUIDString"));
  objc_msgSend( *(id *)(*(void *)(a1 + 32) + 96),  "removeObjectForKey:",  objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "uuid"), "UUIDString"));
  objc_autoreleasePoolPop(context);
}

int64_t sub_10005CDFC(id a1, W5DiagnosticsTestResult *a2, W5DiagnosticsTestResult *a3)
{
  double v5 = v4;
  -[W5DiagnosticsTestResult testCompleted](a3, "testCompleted");
  if (v5 <= v6) {
    return 1LL;
  }
  else {
    return -1LL;
  }
}

void sub_10006179C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

uint64_t sub_100061C88(uint64_t a1, uint64_t a2)
{
  block[1] = 3221225472LL;
  int8x16_t v3 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  uint64_t v4 = *(void *)(a1 + 32);
  block[0] = _NSConcreteStackBlock;
  block[2] = sub_100061D84;
  block[3] = &unk_1000D2A98;
  double v5 = *(dispatch_queue_s **)(v4 + 40);
  int8x16_t v9 = v3;
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v10 = a2;
  uint64_t v11 = v6;
  dispatch_async(v5, block);
  id v12 = +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_tcpdump.pcap",  *(void *)(a1 + 64)));
  objc_msgSend( *(id *)(a1 + 56),  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 72));
}

void sub_100061D84(void *a1)
{
  unint64_t v2 = objc_autoreleasePoolPush();
  if (a1[4])
  {
    objc_msgSend(*(id *)(a1[5] + 72), "setObject:forKeyedSubscript:", a1[6]);
    objc_msgSend( *(id *)(a1[5] + 80),  "setObject:forKeyedSubscript:",  +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", a1[7]),  a1[4]);
  }

  objc_autoreleasePoolPop(v2);
}

void sub_100061DE0(int8x16_t *a1)
{
  v4[1] = 3221225472LL;
  int8x16_t v1 = vextq_s8(a1[2], a1[2], 8uLL);
  uint64_t v2 = a1[2].i64[0];
  v4[0] = _NSConcreteStackBlock;
  v4[2] = sub_100061E40;
  v4[3] = &unk_1000D1BA8;
  int8x16_t v3 = *(dispatch_queue_s **)(v2 + 40);
  int8x16_t v5 = v1;
  dispatch_async(v3, v4);
}

void sub_100061E40(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 72), "setObject:forKeyedSubscript:", 0);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_100061F90(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  id v3 = [*(id *)(*(void *)(a1 + 32) + 72) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v3) {
    kill((pid_t)[v3 processIdentifier], 2);
  }
  id v4 = [*(id *)(*(void *)(a1 + 32) + 80) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v4)
  {
    id v5 = objc_msgSend( *(id *)(a1 + 32),  "__collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:",  v4,  *(void *)(a1 + 48),  0x7FFFFFFFFFFFFFFFLL,  *(unsigned __int8 *)(a1 + 64),  0,  1.79769313e308);
    if (v5)
    {
      id v6 = v5;
      objc_msgSend( *(id *)(a1 + 56),  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
    }
  }

  objc_autoreleasePoolPop(v2);
}

void sub_1000622C0(_Unwind_Exception *a1)
{
}

void sub_1000622E0(uint64_t a1, uint64_t a2)
{
  id v3 = objc_msgSend( *(id *)(a1 + 40),  "__calculateSizeAtPath:",  objc_msgSend( *(id *)(a1 + 48),  "stringByAppendingPathComponent:",  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2)));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100062368;
  v5[3] = &unk_1000D2CF8;
  id v4 = *(dispatch_queue_s **)(a1 + 56);
  void v5[4] = *(void *)(a1 + 64);
  void v5[5] = v3;
  dispatch_sync(v4, v5);
}

void sub_100062368(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) += *(void *)(a1 + 40);
  objc_autoreleasePoolPop(v2);
}

int64_t sub_100063124(id a1, NSNumber *a2, NSNumber *a3)
{
  return -[NSNumber compare:](a3, "compare:", a2);
}

int64_t sub_10006347C(id a1, NSNumber *a2, NSNumber *a3)
{
  return -[NSNumber compare:](a3, "compare:", a2);
}

id sub_100063C08(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "__filterCoreCaptureContent:", a2);
}

id sub_100063F1C(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "__filterCoreCaptureContent:", a2);
}

void sub_1000643E4(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  objc_msgSend( objc_msgSend( *(id *)(*(void *)(a1 + 40) + 96),  "objectForKeyedSubscript:",  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "configuration"), "objectForKeyedSubscript:", @"InternalUUID")),  "appendString:",  @"Filtered known networks for customer install without MegaWiFi profile\n");
  id v3 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = @"Filtered known networks for customer install without MegaWiFi profile\n";
    int v4 = 12;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v3,  0LL,  "[wifivelocity] %{public}@",  &v5,  v4);
  }

  objc_autoreleasePoolPop(v2);
}

void sub_100064624(id a1)
{
  uint64_t v1 = WiFiManagerClientCreate(kCFAllocatorDefault, 0LL);
  if (v1)
  {
    uint64_t v2 = (const void *)v1;
    WiFiManagerClientDumpLogs(v1, 0LL);
    CFRelease(v2);
  }

LABEL_42:
        uint64_t v10 = (char *)v10 + 1;
      }

      while (v102 != v10);
      uint64_t v83 = [v7 countByEnumeratingWithState:&v103 objects:v108 count:16];
      uint64_t v102 = v83;
    }

    while (v83);
  }

  if (-[NSFileManager createFileAtPath:contents:attributes:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "createFileAtPath:contents:attributes:",  objc_msgSend(objc_msgSend(v96, "path"), "stringByAppendingPathComponent:", @"event_history.txt"),  objc_msgSend(v8, "dataUsingEncoding:", 4),  0))
  {
    uint64_t v107 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"event_history.txt");
    objc_msgSend( v97,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v107, 1));
  }

  [v6[116] timeIntervalSinceReferenceDate];
  objc_msgSend(v97, "setCompletedAt:");
  return v97;
}

void sub_100067864(_Unwind_Exception *a1)
{
}

void sub_1000678BC(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  *(void *)(*(void *)(a1[6] + 8) + 24) = objc_msgSend( objc_msgSend( *(id *)(a1[4] + 160),  "objectForKeyedSubscript:",  a1[5]),  "unsignedIntegerValue");
  objc_autoreleasePoolPop(v2);
}

void sub_100067900(uint64_t a1)
{
  uint64_t v2 = +[NSMutableDictionary dictionaryWithDictionary:]( NSMutableDictionary,  "dictionaryWithDictionary:",  [*(id *)(a1 + 32) configuration]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  *(void *)(a1 + 40),  @"OutputDirectory");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  *(void *)(a1 + 48),  @"HomeDirectory");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  *(void *)(a1 + 56),  @"InternalUUID");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 104)),  @"IncludeEvents");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 105)),  @"UseMegaWiFiProfileLimits");
  id v3 = [*(id *)(a1 + 32) copy];
  [v3 setConfiguration:v2];
  id v4 = objc_msgSend(*(id *)(a1 + 64), "__collectLogItem:error:", v3, 0);
  if (v4)
  {
    id v5 = v4;
    [v4 setRequest:*(void *)(a1 + 32)];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100067A48;
    block[3] = &unk_1000D2660;
    uint64_t v6 = *(void *)(a1 + 96);
    void block[5] = v5;
    void block[6] = v6;
    uint64_t v7 = *(dispatch_queue_s **)(a1 + 72);
    void block[4] = *(void *)(a1 + 80);
    dispatch_sync(v7, block);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 88));
}

void sub_100067A48(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)) {
    [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
  }
  objc_autoreleasePoolPop(v2);
}

void sub_100067A88(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
  objc_autoreleasePoolPop(v2);
}

void sub_100067AB8(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  objc_msgSend( *(id *)(a1[4] + 160),  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a1[6]),  a1[5]);
  objc_autoreleasePoolPop(v2);
}

void sub_100067B00(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  if (a1[4]) {
    objc_msgSend( *(id *)(a1[5] + 168),  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a1[6]),  a1[4]);
  }
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_100068210(uint64_t a1, uint64_t a2)
{
  if (!IOReportChannelGetGroup(a2)) {
    return 16LL;
  }
  Group = (const __CFString *)IOReportChannelGetGroup(a2);
  return 16 * (CFStringFind(Group, (CFStringRef)*(void *)(a1 + 32), 1uLL).location == -1);
}

uint64_t sub_100068264(uint64_t a1, uint64_t a2)
{
  if (!IOReportChannelGetGroup(a2)) {
    return 16LL;
  }
  Group = (const __CFString *)IOReportChannelGetGroup(a2);
  return 16 * (CFStringFind(Group, (CFStringRef)*(void *)(a1 + 32), 1uLL).location == -1);
}

uint64_t sub_1000682B8(uint64_t a1, uint64_t a2)
{
  if (!IOReportChannelGetSubGroup(a2)) {
    return 16LL;
  }
  SubGroup = (const __CFString *)IOReportChannelGetSubGroup(a2);
  return 16 * (CFStringFind(SubGroup, (CFStringRef)*(void *)(a1 + 32), 1uLL).location == -1);
}

uint64_t sub_10006A31C(uint64_t a1, uint64_t a2)
{
  id v3 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v7 = 136315906;
    id v8 = "-[W5LogManager __collectDeviceAnalyticsStore:]_block_invoke";
    __int16 v9 = 2080;
    uint64_t v10 = "W5LogManager.m";
    __int16 v11 = 1024;
    int v12 = 7039;
    __int16 v13 = 2114;
    uint64_t v14 = v4;
    int v6 = 38;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v3,  0LL,  "[wifivelocity] %s (%s:%u) Device Analytics Store File:%{public}@",  &v7,  v6);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t sub_10006A858(uint64_t a1, uint64_t a2)
{
  id v3 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v7 = 136315906;
    id v8 = "-[W5LogManager __collectDeviceAnalyticsDeploymentGraph:]_block_invoke";
    __int16 v9 = 2080;
    uint64_t v10 = "W5LogManager.m";
    __int16 v11 = 1024;
    int v12 = 7103;
    __int16 v13 = 2114;
    uint64_t v14 = v4;
    int v6 = 38;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v3,  0LL,  "[wifivelocity] %s (%s:%u) Device Analytics Deployment Graph File:%{public}@",  &v7,  v6);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t sub_10006AF44(uint64_t a1, uint64_t a2)
{
  id v3 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v7 = 136315906;
    id v8 = "-[W5LogManager __collectDeviceAnalyticsEntityCSVs:]_block_invoke";
    __int16 v9 = 2080;
    uint64_t v10 = "W5LogManager.m";
    __int16 v11 = 1024;
    int v12 = 7173;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    int v6 = 38;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v3,  0LL,  "[wifivelocity] %s (%s:%u) Device Analytics CSV Files:%@",  &v7,  v6);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t sub_10006B4B8(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_10006BA44(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "__pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:",  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@.%d",  *(void *)(a1 + 40),  *(unsigned __int8 *)(a1 + 48)),  1,  0,  objc_msgSend(objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "corewifi"), "interfaceName"),  10,  1.0,  1.0,  1.0);
}

uint64_t sub_10006BAC8(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10006C2EC(_Unwind_Exception *a1)
{
}

void sub_10006C854( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
}

void sub_10006C8A0(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  id v3 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "configuration"), "objectForKeyedSubscript:", @"InternalUUID");
  if (v3)
  {
    id v4 = [*(id *)(*(void *)(a1 + 40) + 104) objectForKeyedSubscript:v3];
    if (v4)
    {
      id v5 = v4;
      objc_msgSend( v4,  "setObject:forKeyedSubscript:",  0,  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "uuid"), "UUIDString"));
      id v6 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "configuration"), "objectForKeyedSubscript:", @"Requests");
      __int128 v11 = 0u;
      __int128 v12 = 0u;
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v12;
        do
        {
          uint64_t v10 = 0LL;
          do
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v6);
            }
            objc_msgSend( v5,  "setObject:forKeyedSubscript:",  *(void *)(*((void *)&v11 + 1) + 8 * (void)v10),  objc_msgSend(objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v10), "uuid"), "UUIDString"));
            uint64_t v10 = (char *)v10 + 1;
          }

          while (v8 != v10);
          id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }

        while (v8);
      }
    }
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10006CA10(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  *(void *)(*(void *)(a1[6] + 8) + 24) = objc_msgSend( objc_msgSend( *(id *)(a1[4] + 160),  "objectForKeyedSubscript:",  a1[5]),  "unsignedIntegerValue");
  objc_autoreleasePoolPop(v2);
}

void sub_10006CA54(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "__collectIndividual:error:", *(void *)(a1 + 40), *(void *)(a1 + 72));
  id v3 = *(dispatch_queue_s **)(a1 + 48);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006CAD0;
  block[3] = &unk_1000D2E90;
  __int128 v5 = *(_OWORD *)(a1 + 56);
  void block[4] = v2;
  dispatch_sync(v3, block);
}

void sub_10006CAD0(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) copy];
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10006CB1C(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  if (*(void *)(a1 + 56))
  {

    *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setRequest:*(void *)(a1 + 32)];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setStartedAt:*(double *)(a1 + 64)];
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "setCompletedAt:");
    id v3 = @"TimeoutOccurred";
    id v4 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(void *)(a1 + 56) != 0LL);
    objc_msgSend( *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40),  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1));
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10006CC54(void *a1)
{
  id v2 = objc_autoreleasePoolPush();
  objc_msgSend( *(id *)(a1[4] + 160),  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a1[6]),  a1[5]);
  objc_autoreleasePoolPop(v2);
}

void sub_10006CC9C(void *a1)
{
  id v2 = objc_autoreleasePoolPush();
  if (a1[4]) {
    objc_msgSend( *(id *)(a1[5] + 168),  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a1[6]),  a1[4]);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10006D900( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, char a30, uint64_t a31, uint64_t a32, uint64_t a33, char a34)
{
}

void sub_10006D944(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  id v3 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "configuration"), "objectForKeyedSubscript:", @"InternalUUID");
  id v4 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "configuration"), "objectForKeyedSubscript:", @"NameOverride");
  id v5 = objc_msgSend( *(id *)(*(void *)(a1 + 40) + 64),  "stringFromDate:",  +[NSDate date](NSDate, "date"));
  id v6 = objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "uuid"), "UUIDString"), "substringToIndex:", 5);
  if (!v4) {
    id v4 = *(id *)(a1 + 48);
  }
  id v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ [%@] BEGIN   %@\n",  v5,  v6,  v4);
  objc_msgSend(objc_msgSend(*(id *)(*(void *)(a1 + 40) + 96), "objectForKeyedSubscript:", v3), "appendString:", v7);
  id v8 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    __int128 v11 = v7;
    LODWORD(v9) = 12;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[wifivelocity] %{public}@",  &v10,  v9);
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10006DAC0(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend( objc_msgSend( *(id *)(*(void *)(a1 + 32) + 56),  "additionalLog"),  "copy");
  objc_autoreleasePoolPop(v2);
}

void sub_10006DB04(void *a1)
{
  id v2 = objc_autoreleasePoolPush();
  if (a1[4]) {
    id v3 = objc_msgSend(objc_msgSend(*(id *)(a1[5] + 160), "objectForKeyedSubscript:"), "unsignedIntegerValue");
  }
  else {
    id v3 = 0LL;
  }
  *(void *)(*(void *)(a1[7] + 8LL) + 24LL) = v3;
  if (a1[6]) {
    id v4 = objc_msgSend(objc_msgSend(*(id *)(a1[5] + 168), "objectForKeyedSubscript:"), "unsignedLongLongValue");
  }
  else {
    id v4 = 0LL;
  }
  *(void *)(*(void *)(a1[8] + 8LL) + 24LL) = v4;
  objc_autoreleasePoolPop(v2);
}

void sub_10006DB84(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  id v3 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "configuration"), "objectForKeyedSubscript:", @"InternalUUID");
  id v4 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "configuration"), "objectForKeyedSubscript:", @"NameOverride");
  id v5 = *(void **)(a1 + 40);
  if (v5)
  {
    unsigned int v6 = objc_msgSend( objc_msgSend(objc_msgSend(v5, "info"), "objectForKeyedSubscript:", @"TimeoutOccurred"),  "BOOLValue");
    id v7 = objc_msgSend( *(id *)(*(void *)(a1 + 48) + 64),  "stringFromDate:",  +[NSDate date](NSDate, "date"));
    id v8 = objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "uuid"), "UUIDString"), "substringToIndex:", 5);
    if (v6)
    {
      if (!v4) {
        id v4 = (id)W5DescriptionForLogItemID([*(id *)(a1 + 32) itemID]);
      }
      [*(id *)(a1 + 40) completedAt];
      double v10 = v9;
      [*(id *)(a1 + 40) startedAt];
      __int128 v12 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ [%@] TIMEOUT %@, took %.6fs\n",  v7,  v8,  v4,  v10 - v11);
    }

    else
    {
      if (!v4) {
        id v4 = (id)W5DescriptionForLogItemID([*(id *)(a1 + 32) itemID]);
      }
      [*(id *)(a1 + 40) completedAt];
      double v17 = v16;
      [*(id *)(a1 + 40) startedAt];
      __int128 v12 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ [%@] END     %@, took %.6fs\n",  v7,  v8,  v4,  v17 - v18);
    }

    id v15 = v12;
    objc_msgSend( objc_msgSend(*(id *)(*(void *)(a1 + 48) + 104), "objectForKeyedSubscript:", v3),  "setObject:forKeyedSubscript:",  0,  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "uuid"), "UUIDString"));
  }

  else
  {
    id v13 = objc_msgSend( *(id *)(*(void *)(a1 + 48) + 64),  "stringFromDate:",  +[NSDate date](NSDate, "date"));
    id v14 = objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "uuid"), "UUIDString"), "substringToIndex:", 5);
    if (!v4) {
      id v4 = (id)W5DescriptionForLogItemID([*(id *)(a1 + 32) itemID]);
    }
    id v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ [%@] ERROR   %@, not collected\n",  v13,  v14,  v4);
  }

  objc_msgSend(objc_msgSend(*(id *)(*(void *)(a1 + 48) + 96), "objectForKeyedSubscript:", v3), "appendString:", v15);
  id v19 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138543362;
    uint64_t v22 = v15;
    LODWORD(v20) = 12;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  0LL,  "[wifivelocity] %{public}@",  &v21,  v20);
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10006E228( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31, uint64_t a32, uint64_t a33, uint64_t a34, char a35, uint64_t a36, uint64_t a37, uint64_t a38, char a39)
{
}

void sub_10006E284(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend( objc_msgSend( *(id *)(*(void *)(a1 + 32) + 56),  "uuid"),  "copy");
  objc_autoreleasePoolPop(v2);
}

id sub_10006E2C8(uint64_t a1, void *a2, void *a3)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = [a2 copy];
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = [a3 copy];
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }

  return [*(id *)(a1 + 32) unlock];
}

LABEL_21:
      [v11 appendString:@" "];
      ++v12;
      v13 += 3;
      if (v12 >= BYTE5(v49)) {
        goto LABEL_22;
      }
    }

    if ((v14 & 0x200) != 0) {
      id v15 = @"+";
    }
    else {
      id v15 = @"-";
    }
LABEL_20:
    [v11 appendString:v15];
    goto LABEL_21;
  }

void sub_100072524( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
}

void sub_100072554(uint64_t a1, void *a2)
{
  id v4 = objc_autoreleasePoolPush();
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL) = objc_alloc_init(&OBJC_CLASS___W5PingResult);
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setAddress:*(void *)(a1 + 32)];
  objc_msgSend( *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40),  "setInterfaceName:",  objc_msgSend(objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "wifi"), "interfaceName"));
  objc_msgSend( *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40),  "setCount:",  (int)objc_msgSend(a2, "numPingsTransmitted"));
  [a2 packetLossRate];
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "setPacketLoss:");
  [a2 averageRoundtripTime];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setAvg:v5 * 1000.0];
  [a2 minRoundtripTime];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setMin:v6 * 1000.0];
  [a2 maxRoundtripTime];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setMax:v7 * 1000.0];
  [a2 standardDeviationRoundtripTime];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setStddev:v8 * 1000.0];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setStartedAt:*(double *)(a1 + 64)];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "setEndedAt:");
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  objc_autoreleasePoolPop(v4);
}

void sub_1000731B4(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    id v2 = *(__CFString **)(a1 + 32);
  }
  else {
    id v2 = @"WiFi";
  }
  if (!qword_1000F7580)
  {
    __int128 v10 = off_1000D2FB0;
    uint64_t v11 = 0LL;
    qword_1000F7580 = _sl_dlopen(&v10, 0LL);
  }

  if (qword_1000F7580)
  {
    *(void *)&__int128 v10 = 0LL;
    *((void *)&v10 + 1) = &v10;
    uint64_t v11 = 0x2020000000LL;
    id v3 = off_1000F7588;
    __int128 v12 = off_1000F7588;
    if (!off_1000F7588)
    {
      id v4 = sub_100074BD4();
      id v3 = dlsym(v4, "CoreCaptureControlCreate");
      *(void *)(*((void *)&v10 + 1) + 24LL) = v3;
      off_1000F7588 = v3;
    }

    _Block_object_dispose(&v10, 8);
    if (v3)
    {
      double v5 = (const void *)((uint64_t (*)(const CFAllocatorRef))v3)(kCFAllocatorDefault);
      if (!v5) {
        return;
      }
      id v6 = -[__CFString UTF8String](v2, "UTF8String");
      id v7 = [*(id *)(a1 + 40) UTF8String];
      *(void *)&__int128 v10 = 0LL;
      *((void *)&v10 + 1) = &v10;
      uint64_t v11 = 0x2020000000LL;
      double v8 = off_1000F7590;
      __int128 v12 = off_1000F7590;
      if (!off_1000F7590)
      {
        double v9 = sub_100074BD4();
        double v8 = dlsym(v9, "CoreCaptureControlCaptureWithComponentDirectory");
        *(void *)(*((void *)&v10 + 1) + 24LL) = v8;
        off_1000F7590 = v8;
      }

      _Block_object_dispose(&v10, 8);
      if (v8)
      {
        ((void (*)(const void *, id, id))v8)(v5, v6, v7);
        CFRelease(v5);
        return;
      }

      -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Boolean soft_CoreCaptureControlCaptureWithComponentDirectory(CoreCaptureControlRef, const char *, const char *)"),  @"W5LogManager.m",  57LL,  @"%s",  dlerror());
    }

    else
    {
      -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "CoreCaptureControlRef soft_CoreCaptureControlCreate(CFAllocatorRef)"),  @"W5LogManager.m",  53LL,  @"%s",  dlerror());
    }

    __break(1u);
  }

void sub_1000733FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void sub_1000738C8( uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  if ((a2 & 2) != 0)
  {
    id v11 = [a11 addDomain:a9 rdlen:a8];
    if (v11)
    {
      id v12 = v11;
      DNSServiceRef sdRef = (DNSServiceRef)[a11 serviceRef];
      DNSServiceErrorType v13 = DNSServiceQueryRecord( &sdRef,  0x4000u,  0,  -[NSString cStringUsingEncoding:]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"_services._dns-sd._udp.%@",  v12),  "cStringUsingEncoding:",  4LL),  0xCu,  1u,  (DNSServiceQueryRecordReply)sub_100074CC4,  a11);
      if (v13)
      {
        DNSServiceErrorType v15 = v13;
        double v16 = (os_log_s *)sub_10008C90C();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 136315906;
          id v19 = "_ServiceBrowserDomainsQueryCallback";
          __int16 v20 = 2080;
          int v21 = "W5LogManager.m";
          __int16 v22 = 1024;
          int v23 = 10045;
          __int16 v24 = 1024;
          LODWORD(v25) = v15;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "[wifivelocity] %s (%s:%u) DNSServiceQueryRecord failed. Error: %d",  &v18,  34);
        }
      }
    }

    else
    {
      id v14 = (os_log_s *)sub_10008C90C();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 136315906;
        id v19 = "_ServiceBrowserDomainsQueryCallback";
        __int16 v20 = 2080;
        int v21 = "W5LogManager.m";
        __int16 v22 = 1024;
        int v23 = 10039;
        __int16 v24 = 2112;
        uint64_t v25 = 0LL;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "[wifivelocity] %s (%s:%u) Failed to add domain: %@",  &v18,  38);
      }
    }
  }

LABEL_36:
              v47[2] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s", v25);
              v47[3] = v24;
              objc_msgSend( v22,  "addObject:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 4));
              if (v33->doPing
                && v24
                && ((v36 - 2) <= 0x3E && ((1LL << (v36 - 2)) & 0x4000000040000005LL) != 0
                 || v36 == 128)
                && (-[NSMutableSet containsObject:](v33->pingedIPAddresses, "containsObject:", v24) & 1) == 0)
              {
                sa_family = v32->sa_family;
                if (sa_family == 30)
                {
                  v45[0] = v24;
                  v45[1] = @"-c 1";
                  void v45[2] = @"-B";
                  v45[3] = v23;
                  v45[4] = @"-I";
                  v45[5] = v23;
                  __int128 v27 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v45, 6LL);
                  __int128 v28 = @"/sbin/ping6";
                }

                else if (sa_family == 2)
                {
                  v46[0] = v24;
                  v46[1] = @"-c 1";
                  __int128 v27 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v46, 2LL);
                  __int128 v28 = @"/sbin/ping";
                }

                else
                {
                  __int128 v28 = 0LL;
                  __int128 v27 = 0LL;
                }

                pingQueue = v33->pingQueue;
                v35[0] = _NSConcreteStackBlock;
                v35[1] = 3221225472LL;
                v35[2] = sub_100074298;
                v35[3] = &unk_1000D1858;
                v35[4] = v28;
                v35[5] = v27;
                void v35[6] = v33;
                -[NSOperationQueue addOperationWithBlock:](pingQueue, "addOperationWithBlock:", v35);
                pingedIPAddresses = v33->pingedIPAddresses;
                ++v33->addedCount;
                -[NSMutableSet addObject:](pingedIPAddresses, "addObject:", v24);
              }

              return;
            }
          }

          int v18 = [v16 countByEnumeratingWithState:&v37 objects:v49 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v41 objects:v50 count:16];
    }

    while (v12);
  }

  uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v4,  "objectForKeyedSubscript:",  @"peerDatabaseResults"));
  if (v54)
  {
  }

  else
  {
    uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v4,  "objectForKeyedSubscript:",  @"peerDatabaseResultsUncompressed"));

    if (!v55)
    {
      uint64_t v71 = sub_10008C90C();
      __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v78 = "-[W5PeerDatabaseResponsePayload encode]";
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v31,  0LL,  "[wifivelocity] W5PeerDatabaseResponsePayload %s: Failed to form kW5PeerResponsePeerDatabaseResultsKey or kW5Pe erResponsePeerDatabaseResultsUncompressedKey",  buf);
      }

      goto LABEL_53;
    }
  }

  uint64_t v56 = sub_10008E334();
  uint64_t v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
  if (os_signpost_enabled(v57))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v57,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "W5PeerDatabaseResponsePayload encode",  "Success",  buf,  2u);
  }

  if (!-[NSMutableDictionary count](v4, "count"))
  {
    uint64_t v66 = NSInternalInconsistencyException;
    for (uint64_t i = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s: empty payload",  "-[W5PeerDatabaseResponsePayload encode]");
          ;
          uint64_t i = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s: BOOL Expression FALSE",  "-[W5PeerDatabaseResponsePayload encode]"))
    {
      __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(i);
      uint64_t v68 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  v66,  v31,  0LL));

      objc_exception_throw(v68);
LABEL_57:
      uint64_t v69 = sub_10008C90C();
      uint64_t v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v78 = "-[W5PeerDatabaseResponsePayload encode]";
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v70,  0LL,  "[wifivelocity] W5PeerDatabaseResponsePayload %s: FAILURE: getPairOfBuffersFromPool returned less than 2 buffers",  (const char *)buf);
      }

LABEL_53:
      uint64_t v64 = sub_10008E334();
      uint64_t v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
      if (os_signpost_enabled(v65))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v65,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "W5PeerDatabaseResponsePayload encode",  "Error",  buf,  2u);
      }

      uint64_t v66 = NSInternalInconsistencyException;
    }
  }

  objc_autoreleasePoolPop(v3);
  return v4;
}

id sub_100074298(void *a1)
{
  uint64_t v1 = a1[4];
  uint64_t v2 = a1[5];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10007430C;
  v4[3] = &unk_1000D1C48;
  void v4[4] = a1[6];
  return +[NSTask runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:",  v1,  v2,  0LL,  0LL,  0LL,  v4,  2.0);
}

uint64_t sub_10007430C(uint64_t result)
{
  return result;
}

Class sub_100074718(uint64_t a1)
{
  if (!qword_1000F7558)
  {
    __int128 v3 = off_1000D2F50;
    uint64_t v4 = 0LL;
    qword_1000F7558 = _sl_dlopen(&v3, 0LL);
  }

  Class result = objc_getClass("WADeviceAnalyticsClient");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) = result;
  qword_1000F7550 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  return result;
}

Class sub_1000747D0(uint64_t a1)
{
  id v6 = 0LL;
  uint64_t v7 = 0LL;
  double v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  uint64_t v2 = qword_1000F7568;
  uint64_t v10 = qword_1000F7568;
  if (!qword_1000F7568)
  {
    __int128 v11 = *(_OWORD *)off_1000D2F68;
    uint64_t v12 = 0LL;
    uint64_t v2 = _sl_dlopen(&v11, &v6);
    v8[3] = v2;
    qword_1000F7568 = v2;
  }

  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    uint64_t v4 = +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler");
    double v5 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *libsysdiagnoseLibrary(void)");
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( v4,  "handleFailureInFunction:file:lineNumber:description:",  v5,  @"W5LogManager.m",  69LL,  @"%s",  v6);
    goto LABEL_10;
  }

  if (v6) {
    free(v6);
  }
  Class result = objc_getClass("Libsysdiagnose");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL))
  {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getLibsysdiagnoseClass(void)_block_invoke"),  @"W5LogManager.m",  70LL,  @"Unable to find class %s",  "Libsysdiagnose");
LABEL_10:
    __break(1u);
  }

  qword_1000F7560 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  return result;
}

void sub_100074974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

id sub_100074994(uint64_t a1)
{
  id v2 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  uint64_t v3 = 0LL;
  while (*(_BYTE *)(a1 + v3))
  {
    else {
      [v2 appendString:@"."];
    }
    if (++v3 == 32) {
      return [v2 copy];
    }
  }

  if (v3 <= 0x1F)
  {
    int v4 = 32 - v3;
    do
    {
      [v2 appendString:@" "];
      --v4;
    }

    while (v4);
  }

  return [v2 copy];
}

Class sub_100074A68(uint64_t a1)
{
  double v5 = 0LL;
  if (!qword_1000F7570)
  {
    __int128 v6 = off_1000D2F98;
    uint64_t v7 = 0LL;
    qword_1000F7570 = _sl_dlopen(&v6, &v5);
  }

  if (!qword_1000F7570)
  {
    uint64_t v3 = +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler");
    int v4 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *IMFoundationLibrary(void)");
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( v3,  "handleFailureInFunction:file:lineNumber:description:",  v4,  @"W5LogManager.m",  65LL,  @"%s",  v5);
    goto LABEL_10;
  }

  if (v5) {
    free(v5);
  }
  Class result = objc_getClass("IMPingTest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL))
  {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getIMPingTestClass(void)_block_invoke"),  @"W5LogManager.m",  66LL,  @"Unable to find class %s",  "IMPingTest");
LABEL_10:
    __break(1u);
  }

  qword_1000F7578 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  return result;
}

NSAssertionHandler *sub_100074BD4()
{
  int v4 = 0LL;
  if (!qword_1000F7580)
  {
    __int128 v5 = off_1000D2FB0;
    uint64_t v6 = 0LL;
    qword_1000F7580 = _sl_dlopen(&v5, &v4);
  }

  uint64_t v0 = (NSAssertionHandler *)qword_1000F7580;
  if (!qword_1000F7580)
  {
    uint64_t v0 = +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler");
    uint64_t v3 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *CoreCaptureControlLibrary(void)");
    id v1 = -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( v0,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"W5LogManager.m",  49LL,  @"%s",  v4);
    __break(1u);
    goto LABEL_7;
  }

  id v1 = v4;
  if (v4) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void sub_100074CC4( uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  if ((a2 & 2) != 0)
  {
    id v11 = objc_msgSend(a11, "addServiceType:rdlen:fullname:", a9, a8);
    if (v11)
    {
      uint64_t v12 = v11;
      DNSServiceRef sdRef = (DNSServiceRef)[a11 serviceRef];
      DNSServiceErrorType v13 = DNSServiceBrowse( &sdRef,  0x4000u,  0,  (const char *)objc_msgSend( objc_msgSend(v12, "objectAtIndexedSubscript:", 0),  "cStringUsingEncoding:",  4),  (const char *)objc_msgSend( objc_msgSend(v12, "objectAtIndexedSubscript:", 1),  "cStringUsingEncoding:",  4),  (DNSServiceBrowseReply)sub_100074ED4,  a11);
      if (v13)
      {
        DNSServiceErrorType v15 = v13;
        double v16 = (os_log_s *)sub_10008C90C();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 136316162;
          id v19 = "_ServiceBrowserServicesQueryCallback";
          __int16 v20 = 2080;
          int v21 = "W5LogManager.m";
          __int16 v22 = 1024;
          int v23 = 10014;
          __int16 v24 = 2112;
          uint64_t v25 = v12;
          __int16 v26 = 1024;
          DNSServiceErrorType v27 = v15;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "[wifivelocity] %s (%s:%u) DNSServiceBrowse for: %@ failed. Error: %d",  &v18,  44);
        }
      }
    }

    else
    {
      id v14 = (os_log_s *)sub_10008C90C();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 136315906;
        id v19 = "_ServiceBrowserServicesQueryCallback";
        __int16 v20 = 2080;
        int v21 = "W5LogManager.m";
        __int16 v22 = 1024;
        int v23 = 10010;
        __int16 v24 = 2112;
        uint64_t v25 = 0LL;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "[wifivelocity] %s (%s:%u) Failed to add serviceType: %@",  &v18,  38);
      }
    }
  }

void sub_100074ED4( uint64_t a1, char a2, uint32_t a3, uint64_t a4, const char *a5, const char *a6, const char *a7, void *a8)
{
  if ((a2 & 2) != 0)
  {
    if ([a8 addServiceInstance:a5 serviceType:a6 domain:a7])
    {
      DNSServiceRef sdRef = (DNSServiceRef)[a8 serviceRef];
      DNSServiceErrorType v13 = DNSServiceResolve(&sdRef, 0x4000u, a3, a5, a6, a7, (DNSServiceResolveReply)sub_1000750D8, a8);
      if (v13)
      {
        DNSServiceErrorType v15 = v13;
        double v16 = (os_log_s *)sub_10008C90C();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 136316674;
          id v19 = "_ServiceBrowserBrowseCallback";
          __int16 v20 = 2080;
          int v21 = "W5LogManager.m";
          __int16 v22 = 1024;
          int v23 = 9984;
          __int16 v24 = 2080;
          uint64_t v25 = a5;
          __int16 v26 = 2080;
          DNSServiceErrorType v27 = a6;
          __int16 v28 = 2080;
          __int128 v29 = a7;
          __int16 v30 = 1024;
          DNSServiceErrorType v31 = v15;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "[wifivelocity] %s (%s:%u) DNSServiceResolve for:  %s, %s, %s failed. Error: %d",  &v18,  64);
        }
      }
    }

    else
    {
      id v14 = (os_log_s *)sub_10008C90C();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 136316418;
        id v19 = "_ServiceBrowserBrowseCallback";
        __int16 v20 = 2080;
        int v21 = "W5LogManager.m";
        __int16 v22 = 1024;
        int v23 = 9980;
        __int16 v24 = 2080;
        uint64_t v25 = a5;
        __int16 v26 = 2080;
        DNSServiceErrorType v27 = a6;
        __int16 v28 = 2080;
        __int128 v29 = a7;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "[wifivelocity] %s (%s:%u) Failed to add serviceInstance: %s, %s, %s",  &v18,  58);
      }
    }
  }

uint64_t sub_1000750D8( uint64_t a1, uint64_t a2, uint32_t a3, uint64_t a4, uint64_t a5, const char *a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  v32[0] = a10;
  v32[1] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s", a5);
  DNSServiceErrorType v13 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 2LL);
  [a10 addBrowseContext:v13];
  DNSServiceRef sdRef = (DNSServiceRef)[a10 serviceRef];
  uint64_t result = DNSServiceGetAddrInfo(&sdRef, 0x4000u, a3, 3u, a6, (DNSServiceGetAddrInfoReply)sub_100075268, v13);
  if ((_DWORD)result)
  {
    int v15 = result;
    double v16 = (os_log_s *)sub_10008C90C();
    uint64_t result = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)result)
    {
      int v20 = 136316418;
      int v21 = "_ServiceBrowserResolveCallback";
      __int16 v22 = 2080;
      int v23 = "W5LogManager.m";
      __int16 v24 = 1024;
      int v25 = 9958;
      __int16 v26 = 2080;
      uint64_t v27 = a5;
      __int16 v28 = 2080;
      __int128 v29 = a6;
      __int16 v30 = 1024;
      int v31 = v15;
      LODWORD(v17) = 54;
      return _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "[wifivelocity] %s (%s:%u) DNSServiceGetAddrInfo for: (%s, %s) failed. Error: %d",  (const char *)&v20,  v17,  v18,  (const char *)sdRef);
    }
  }

  return result;
}

id sub_100075268(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  id result = [a8 count];
  if ((a2 & 2) != 0 && result == (id)2) {
    return objc_msgSend( objc_msgSend(a8, "objectAtIndexedSubscript:", 0),  "addBrowseResult:hostname:address:interfaceIndex:",  objc_msgSend(a8, "objectAtIndexedSubscript:", 1),  a5,  a6,  a3);
  }
  return result;
}

void sub_100077380(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();

  *(void *)(*(void *)(a1 + 32) + 24) = [*(id *)(a1 + 40) copy];
  objc_autoreleasePoolPop(v2);
}

void sub_100077470(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v3 + 20))
  {
    *(_BYTE *)(v3 + 20) = 1;
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(dispatch_queue_s **)(v5 + 8);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10007750C;
    handler[3] = &unk_1000D2468;
    handler[4] = v5;
    notify_register_dispatch("com.apple.powermanagement.systempowerstate", (int *)(v5 + 16), v6, handler);
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10007750C(uint64_t a1)
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100077578;
  block[3] = &unk_1000D1BF8;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(global_queue, block);
}

void sub_100077578(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___W5Event);
  -[W5Event setEventID:](v3, "setEventID:", 16LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5Event setTimestamp:](v3, "setTimestamp:");
  uint64_t v5 = @"SystemPowerStateCaps";
  uint64_t v6 = +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [*(id *)(a1 + 32) caps]);
  -[W5Event setInfo:]( v3,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 24LL);
  if (v4) {
    (*(void (**)(uint64_t, W5Event *))(v4 + 16))(v4, v3);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_1000776D0(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v3 + 20))
  {
    *(_BYTE *)(v3 + 20) = 0;
    notify_cancel(*(_DWORD *)(*(void *)(a1 + 32) + 16LL));
  }

  objc_autoreleasePoolPop(v2);
}

void sub_100078068(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___W5CloudStore);
  id v2 = (void *)qword_1000F7598;
  qword_1000F7598 = (uint64_t)v1;
}

LABEL_26:
    NSErrorUserInfoKey v41 = NSLocalizedFailureReasonErrorKey;
    id v42 = @"W5ParamErr";
    NSErrorUserInfoKey v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v42,  &v41,  1LL));
    int v36 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError, "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 1LL, v35));
    *a5 = v36;

LABEL_27:
    __int128 v29 = 0;
    double v16 = 0LL;
    goto LABEL_16;
  }

  double v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  int v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v17 setObject:v18 forKeyedSubscript:@"timestamp"];

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v8 peer]);
  int v20 = (void *)objc_claimAutoreleasedReturnValue([v19 name]);

  if (v20)
  {
    int v21 = (void *)objc_claimAutoreleasedReturnValue([v8 peer]);
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 name]);
    [v17 setObject:v22 forKeyedSubscript:@"name"];
  }

  [v17 setObject:v15 forKeyedSubscript:@"peer"];
  int v23 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKey:@"MinStartNotificationInterval"]);
  if (v23) {
    [v17 setObject:v23 forKey:@"min-start-notification-interval"];
  }
  __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKey:@"MinStopNotificationInterval"]);

  if (v24) {
    [v17 setObject:v24 forKey:@"min-stop-notification-interval"];
  }
  [v38 setObject:v17 forKeyedSubscript:v14];
  [v11 setObject:v38 forKeyedSubscript:@"registered-app-peers"];
  -[W5CloudStore _setHomeDiagnosticsDomain:](self, "_setHomeDiagnosticsDomain:", v11);
  int v25 = sub_10008C90C();
  __int16 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    int v43 = 136315906;
    uint64_t v44 = "-[W5CloudStore registerDiagnosticModePeer:configuration:error:]";
    __int16 v45 = 2080;
    __int16 v46 = "W5CloudStore.m";
    int v47 = 1024;
    __int16 v48 = 131;
    id v49 = 2114;
    uint64_t v50 = v8;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v26,  0LL,  "[wifivelocity] %s (%s:%u) registered peer='%{public}@",  &v43,  38);
  }

  uint64_t v27 = sub_10008C90C();
  __int16 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    int v43 = 136315906;
    uint64_t v44 = "-[W5CloudStore registerDiagnosticModePeer:configuration:error:]";
    __int16 v45 = 2080;
    __int16 v46 = "W5CloudStore.m";
    int v47 = 1024;
    __int16 v48 = 132;
    id v49 = 2112;
    uint64_t v50 = v11;
    LODWORD(v37) = 38;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v28,  0LL,  "[wifivelocity] %s (%s:%u) W5CloudStore: %@",  &v43,  v37);
  }

  __int128 v29 = 1;
LABEL_16:

  return v29;
}

  uint64_t v39 = sub_10008E334();
  NSErrorUserInfoKey v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
  if (os_signpost_enabled(v35))
  {
    *(_WORD *)buf = 0;
    int v36 = "Error";
LABEL_21:
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v35,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "W5PeerDatabaseRequestPayload encode",  v36,  buf,  2u);
  }

void sub_1000794F0(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  id v2 = (void *)qword_1000F75A8;
  qword_1000F75A8 = (uint64_t)v1;
}

id sub_100079680()
{
  uint64_t v4 = 0LL;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  uint64_t v0 = (void *)qword_1000F75B8;
  uint64_t v7 = qword_1000F75B8;
  if (!qword_1000F75B8)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_10007AD10;
    v3[3] = &unk_1000D12E0;
    void v3[4] = &v4;
    sub_10007AD10((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_10007971C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10007980C(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _getWAAnalyticsAccess]);
  [v1 reset];
}

void sub_100079A70( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

uint64_t sub_100079AA0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100079AB0(uint64_t a1)
{
}

void sub_100079AB8(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___W5Event);
  -[W5Event setEventID:](v3, "setEventID:", 39LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5Event setTimestamp:](v3, "setTimestamp:");
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  uint64_t v7 = @"LastHourFaultsStatus";
  uint64_t v8 = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  -[W5Event setInfo:](v3, "setInfo:", v5);

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 56LL);
  if (v6) {
    (*(void (**)(uint64_t, W5Event *))(v6 + 16))(v6, v3);
  }

  objc_autoreleasePoolPop(v2);
}

void sub_100079BB0(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___W5Event);
  -[W5Event setEventID:](v3, "setEventID:", 40LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5Event setTimestamp:](v3, "setTimestamp:");
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  uint64_t v7 = @"LastHourLinkTestsStatus";
  uint64_t v8 = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  -[W5Event setInfo:](v3, "setInfo:", v5);

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 64LL);
  if (v6) {
    (*(void (**)(uint64_t, W5Event *))(v6 + 16))(v6, v3);
  }

  objc_autoreleasePoolPop(v2);
}

void sub_100079CA8(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___W5Event);
  -[W5Event setEventID:](v3, "setEventID:", 41LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5Event setTimestamp:](v3, "setTimestamp:");
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  uint64_t v7 = @"LastHourRecoveriesStatus";
  uint64_t v8 = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  -[W5Event setInfo:](v3, "setInfo:", v5);

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 72LL);
  if (v6) {
    (*(void (**)(uint64_t, W5Event *))(v6 + 16))(v6, v3);
  }

  objc_autoreleasePoolPop(v2);
}

void sub_100079E9C(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8LL);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v2 _performFetch:v3 error:&obj]);
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8LL);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void sub_10007A5C0(void *a1)
{
  id v2 = objc_autoreleasePoolPush();
  uint64_t v3 = objc_autoreleasePoolPush();
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  id v12 = 0LL;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 _performFetch:v5 error:&v12]);
  id v7 = v12;
  if (v7)
  {
    uint64_t v8 = sub_10008C90C();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v7;
      int v11 = 12;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[wifivelocity] Will return error %@",  &v13,  v11);
    }
  }

  uint64_t v10 = a1[6];
  if (v10) {
    (*(void (**)(uint64_t, id, void *))(v10 + 16))(v10, v7, v6);
  }

  objc_autoreleasePoolPop(v3);
  objc_autoreleasePoolPop(v2);
}

void sub_10007A7A0(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 56);
  *(void *)(v3 + 56) = 0LL;

  id v5 = objc_retainBlock(*(id *)(a1 + 40));
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v5;

  objc_autoreleasePoolPop(v2);
}

void sub_10007A8A0(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 64);
  *(void *)(v3 + 64) = 0LL;

  id v5 = objc_retainBlock(*(id *)(a1 + 40));
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v5;

  objc_autoreleasePoolPop(v2);
}

void sub_10007A9A0(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 72);
  *(void *)(v3 + 72) = 0LL;

  id v5 = objc_retainBlock(*(id *)(a1 + 40));
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v5;

  objc_autoreleasePoolPop(v2);
}

void sub_10007AA48(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  if (!*(_BYTE *)(*(void *)(a1 + 32) + 24LL))
  {
    uint64_t v3 = sub_10008C90C();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 0;
      int v8 = 2;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v4,  0LL,  "[wifivelocity] W5DatabaseManager startEventMonitoring",  v9,  v8);
    }

    *(_BYTE *)(*(void *)(a1 + 32) + 24LL) = 1;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v6 + 16) persistentStoreCoordinator]);
    [v5 addObserver:v6 selector:"remoteStoreUpdate:" name:NSPersistentStoreRemoteChangeNotification object:v7];
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10007ABB4(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  if (*(_BYTE *)(*(void *)(a1 + 32) + 24LL))
  {
    uint64_t v3 = sub_10008C90C();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 0;
      int v6 = 2;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v4,  0LL,  "[wifivelocity] W5DatabaseManager stopEventMonitoring",  v7,  v6);
    }

    *(_BYTE *)(*(void *)(a1 + 32) + 24LL) = 0;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 removeObserver:*(void *)(a1 + 32)];
  }

  objc_autoreleasePoolPop(v2);
}

Class sub_10007AD10(uint64_t a1)
{
  int v6 = 0LL;
  if (!qword_1000F75C0)
  {
    __int128 v7 = off_1000D3060;
    uint64_t v8 = 0LL;
    qword_1000F75C0 = _sl_dlopen(&v7, &v6);
  }

  if (!qword_1000F75C0)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *WiFiAnalyticsLibrary(void)"));
    objc_msgSend( v3,  "handleFailureInFunction:file:lineNumber:description:",  v4,  @"W5DatabaseManager.m",  19,  @"%s",  v6);

    goto LABEL_10;
  }

  if (v6) {
    free(v6);
  }
  Class result = objc_getClass("WAAnalyticsAccess");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getWAAnalyticsAccessClass(void)_block_invoke"));
    objc_msgSend( v3,  "handleFailureInFunction:file:lineNumber:description:",  v5,  @"W5DatabaseManager.m",  21,  @"Unable to find class %s",  "WAAnalyticsAccess");

LABEL_10:
    __break(1u);
  }

  qword_1000F75B8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void sub_10007B16C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10007B184(uint64_t a1, uint64_t a2)
{
}

void sub_10007B194(uint64_t a1)
{
}

void sub_10007B1A0(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  objc_autoreleasePoolPop(v2);
}

void sub_10007B28C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10007B2A4(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  objc_autoreleasePoolPop(v2);
}

void sub_10007B390( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10007B3A8(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 72) copy];
  objc_autoreleasePoolPop(v2);
}

void sub_10007B478(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = *(_BYTE *)(*(void *)(a1 + 32) + 32LL);
  objc_autoreleasePoolPop(v2);
}

void sub_10007B538(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = *(_BYTE *)(*(void *)(a1 + 32) + 33LL);
  objc_autoreleasePoolPop(v2);
}

void sub_10007B614( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10007B62C(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 48) copy];
  objc_autoreleasePoolPop(v2);
}

void sub_10007B900( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, int a11, int a12, uint64_t a13, __int16 a14, uint64_t a15, __int16 a16, int a17, __int16 a18, uint64_t a19)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    id v19 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  0LL,  "[wifivelocity] %s (%s:%u) [NSFileHandle writeData:] failed with exception %{public}@");
    }
    objc_end_catch();
    JUMPOUT(0x10007B8CCLL);
  }

  _Unwind_Resume(exception_object);
}

void sub_10007BA28(void *a1)
{
  id v2 = objc_autoreleasePoolPush();
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t v3 = (void *)a1[4];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
LABEL_3:
    uint64_t v7 = 0LL;
    while (1)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
      if (v5 == (id)++v7)
      {
        id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }

  else
  {
LABEL_10:
    [*(id *)(a1[5] + 24) addObjectsFromArray:a1[4]];
  }

  [*(id *)(a1[5] + 80) xpcConnection:a1[5] startMonitoringEvents:a1[4] reply:a1[6]];
  objc_autoreleasePoolPop(v2);
}

void sub_10007BBB8(void *a1)
{
  id v2 = objc_autoreleasePoolPush();
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t v3 = (void *)a1[4];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
LABEL_3:
    uint64_t v7 = 0LL;
    while (1)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
      if (v5 == (id)++v7)
      {
        id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }

  else
  {
LABEL_10:
    [*(id *)(a1[5] + 24) removeObjectsInArray:a1[4]];
  }

  [*(id *)(a1[5] + 80) xpcConnection:a1[5] stopMonitoringEvents:a1[4] reply:a1[6]];
  objc_autoreleasePoolPop(v2);
}

void sub_10007BD44(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 80) xpcConnection:*(void *)(a1 + 32) queryLocalPeerAndReply:*(void *)(a1 + 40)];
  objc_autoreleasePoolPop(v2);
}

void sub_10007BDD4(void *a1)
{
  id v2 = objc_autoreleasePoolPush();
  [*(id *)(a1[4] + 80) xpcConnection:a1[4] queryStatusForPeer:a1[5] reply:a1[6]];
  objc_autoreleasePoolPop(v2);
}

void sub_10007BE68(void *a1)
{
  id v2 = objc_autoreleasePoolPush();
  [*(id *)(a1[4] + 80) xpcConnection:a1[4] queryDatabaseForPeer:a1[5] fetch:a1[6] reply:a1[7]];
  objc_autoreleasePoolPop(v2);
}

void sub_10007BEFC(void *a1)
{
  id v2 = objc_autoreleasePoolPush();
  [*(id *)(a1[4] + 80) xpcConnection:a1[4] requestFileFromPeer:a1[5] remoteFilePath:a1[6] reply:a1[7]];
  objc_autoreleasePoolPop(v2);
}

void sub_10007BF90(void *a1)
{
  id v2 = objc_autoreleasePoolPush();
  [*(id *)(a1[4] + 80) xpcConnection:a1[4] listFilesFromPeer:a1[5] remoteDirPath:a1[6] reply:a1[7]];
  objc_autoreleasePoolPop(v2);
}

void sub_10007C024(void *a1)
{
  id v2 = objc_autoreleasePoolPush();
  [*(id *)(a1[4] + 80) xpcConnection:a1[4] queryDebugConfigurationForPeer:a1[5] reply:a1[6]];
  objc_autoreleasePoolPop(v2);
}

void sub_10007C0B8(void *a1)
{
  id v2 = objc_autoreleasePoolPush();
  [*(id *)(a1[4] + 80) xpcConnection:a1[4] setDebugConfiguration:a1[5] peer:a1[6] reply:a1[7]];
  objc_autoreleasePoolPop(v2);
}

void sub_10007C150(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___W5ActiveRequest);
  -[W5ActiveRequest setType:](v3, "setType:", 1LL);
  -[W5ActiveRequest setUuid:](v3, "setUuid:", *(void *)(a1 + 32));
  id v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"Peer"];
  -[W5ActiveRequest setPeerID:](v3, "setPeerID:", [v4 peerID]);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5ActiveRequest setTimestamp:](v3, "setTimestamp:");
  -[W5ActiveRequest setWantsUpdates:](v3, "setWantsUpdates:", [v4 type] != (id)6);
  [*(id *)(*(void *)(a1 + 48) + 16) addObject:v3];
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void **)(v5 + 80);
  uint64_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  __int128 v9 = sub_10007C260;
  __int128 v10 = &unk_1000D30A8;
  uint64_t v11 = v5;
  __int128 v12 = v3;
  uint64_t v13 = *(void *)(a1 + 64);
  objc_msgSend(v6, "xpcConnection:runDiagnostics:configuration:uuid:reply:");
  objc_autoreleasePoolPop(v2);
}

__n128 sub_10007C260(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = _NSConcreteStackBlock;
  __int128 v3 = *(_OWORD *)(a1 + 32);
  id v4 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 8LL);
  block[1] = 3221225472LL;
  block[2] = sub_10007C2CC;
  block[3] = &unk_1000D3080;
  __int128 v8 = v3;
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v10 = a3;
  uint64_t v11 = v5;
  uint64_t v9 = a2;
  dispatch_async(v4, block);
  return result;
}

void sub_10007C2CC(void *a1)
{
  id v2 = objc_autoreleasePoolPush();
  [*(id *)(a1[4] + 16) removeObject:a1[5]];
  uint64_t v3 = a1[8];
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, a1[6], a1[7]);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10007C374(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___W5ActiveRequest);
  -[W5ActiveRequest setType:](v3, "setType:", 1LL);
  -[W5ActiveRequest setUuid:](v3, "setUuid:", *(void *)(a1 + 32));
  id v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"Peer"];
  -[W5ActiveRequest setPeerID:](v3, "setPeerID:", [v4 peerID]);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5ActiveRequest setTimestamp:](v3, "setTimestamp:");
  -[W5ActiveRequest setWantsUpdates:](v3, "setWantsUpdates:", [v4 type] != (id)6);
  [*(id *)(*(void *)(a1 + 48) + 16) addObject:v3];
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void **)(v5 + 80);
  uint64_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  uint64_t v9 = sub_10007C484;
  uint64_t v10 = &unk_1000D30A8;
  uint64_t v11 = v5;
  __int128 v12 = v3;
  uint64_t v13 = *(void *)(a1 + 72);
  objc_msgSend(v6, "xpcConnection:runDiagnosticsForPeer:diagnostics:configuration:uuid:reply:");
  objc_autoreleasePoolPop(v2);
}

__n128 sub_10007C484(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = _NSConcreteStackBlock;
  __int128 v3 = *(_OWORD *)(a1 + 32);
  id v4 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 8LL);
  block[1] = 3221225472LL;
  block[2] = sub_10007C4F0;
  block[3] = &unk_1000D3080;
  __int128 v8 = v3;
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v10 = a3;
  uint64_t v11 = v5;
  uint64_t v9 = a2;
  dispatch_async(v4, block);
  return result;
}

void sub_10007C4F0(void *a1)
{
  id v2 = objc_autoreleasePoolPush();
  [*(id *)(a1[4] + 16) removeObject:a1[5]];
  uint64_t v3 = a1[8];
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, a1[6], a1[7]);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10007C594(void *a1)
{
  id v2 = objc_autoreleasePoolPush();
  [*(id *)(a1[4] + 80) xpcConnection:a1[4] registerRemoteDiagnosticEventsForPeer:a1[5] configuration:a1[6] reply:a1[7]];
  objc_autoreleasePoolPop(v2);
}

void sub_10007C628(void *a1)
{
  id v2 = objc_autoreleasePoolPush();
  [*(id *)(a1[4] + 80) xpcConnection:a1[4] unregisterRemoteDiagnosticEventsForPeer:a1[5] configuration:a1[6] reply:a1[7]];
  objc_autoreleasePoolPop(v2);
}

void sub_10007C6B8(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 80) xpcConnection:*(void *)(a1 + 32) queryRegisteredDiagnosticsPeersWithReply:*(void *)(a1 + 40)];
  objc_autoreleasePoolPop(v2);
}

void sub_10007C748(void *a1)
{
  id v2 = objc_autoreleasePoolPush();
  [*(id *)(a1[4] + 80) xpcConnection:a1[4] startDiagnosticsModeWithConfiguration:a1[5] reply:a1[6]];
  objc_autoreleasePoolPop(v2);
}

void sub_10007C7DC(void *a1)
{
  id v2 = objc_autoreleasePoolPush();
  [*(id *)(a1[4] + 80) xpcConnection:a1[4] stopDiagnosticsModeWithUUID:a1[5] info:a1[6] reply:a1[7]];
  objc_autoreleasePoolPop(v2);
}

void sub_10007C870(void *a1)
{
  id v2 = objc_autoreleasePoolPush();
  [*(id *)(a1[4] + 80) xpcConnection:a1[4] queryDiagnosticsModeForPeer:a1[5] info:a1[6] reply:a1[7]];
  objc_autoreleasePoolPop(v2);
}

void sub_10007C908(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___W5ActiveRequest);
  -[W5ActiveRequest setType:](v3, "setType:", 2LL);
  -[W5ActiveRequest setUuid:](v3, "setUuid:", *(void *)(a1 + 32));
  id v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"Peer"];
  -[W5ActiveRequest setPeerID:](v3, "setPeerID:", [v4 peerID]);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5ActiveRequest setTimestamp:](v3, "setTimestamp:");
  -[W5ActiveRequest setWantsUpdates:](v3, "setWantsUpdates:", [v4 type] != (id)6);
  [*(id *)(*(void *)(a1 + 48) + 16) addObject:v3];
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void **)(v5 + 80);
  uint64_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  uint64_t v9 = sub_10007CA18;
  uint64_t v10 = &unk_1000D30F8;
  uint64_t v11 = v5;
  __int128 v12 = v3;
  uint64_t v13 = *(void *)(a1 + 64);
  objc_msgSend(v6, "xpcConnection:collectLogs:configuration:uuid:reply:");
  objc_autoreleasePoolPop(v2);
}

__n128 sub_10007CA18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v8[0] = _NSConcreteStackBlock;
  __int128 v4 = *(_OWORD *)(a1 + 32);
  uint64_t v5 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 8LL);
  v8[1] = 3221225472LL;
  v8[2] = sub_10007CA84;
  v8[3] = &unk_1000D30D0;
  __int128 v9 = v4;
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v10 = a2;
  uint64_t v11 = a3;
  uint64_t v12 = a4;
  uint64_t v13 = v6;
  dispatch_async(v5, v8);
  return result;
}

void sub_10007CA84(void *a1)
{
  id v2 = objc_autoreleasePoolPush();
  [*(id *)(a1[4] + 16) removeObject:a1[5]];
  uint64_t v3 = a1[9];
  if (v3) {
    (*(void (**)(uint64_t, void, void, void))(v3 + 16))(v3, a1[6], a1[7], a1[8]);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10007CB2C(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___W5ActiveRequest);
  -[W5ActiveRequest setType:](v3, "setType:", 2LL);
  -[W5ActiveRequest setUuid:](v3, "setUuid:", *(void *)(a1 + 32));
  id v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"Peer"];
  -[W5ActiveRequest setPeerID:](v3, "setPeerID:", [v4 peerID]);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5ActiveRequest setTimestamp:](v3, "setTimestamp:");
  -[W5ActiveRequest setWantsUpdates:](v3, "setWantsUpdates:", [v4 type] != (id)6);
  [*(id *)(*(void *)(a1 + 48) + 16) addObject:v3];
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void **)(v5 + 80);
  uint64_t v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  uint64_t v10 = sub_10007CC38;
  uint64_t v11 = &unk_1000D30F8;
  uint64_t v12 = v5;
  uint64_t v13 = v3;
  uint64_t v14 = v6;
  objc_msgSend(v7, "xpcConnection:collectLogsDiagnosticMode:uuid:reply:");
  objc_autoreleasePoolPop(v2);
}

__n128 sub_10007CC38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v8[0] = _NSConcreteStackBlock;
  __int128 v4 = *(_OWORD *)(a1 + 32);
  uint64_t v5 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 8LL);
  v8[1] = 3221225472LL;
  v8[2] = sub_10007CCA4;
  v8[3] = &unk_1000D30D0;
  __int128 v9 = v4;
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v10 = a2;
  uint64_t v11 = a3;
  uint64_t v12 = a4;
  uint64_t v13 = v6;
  dispatch_async(v5, v8);
  return result;
}

void sub_10007CCA4(void *a1)
{
  id v2 = objc_autoreleasePoolPush();
  [*(id *)(a1[4] + 16) removeObject:a1[5]];
  uint64_t v3 = a1[9];
  if (v3) {
    (*(void (**)(uint64_t, void, void, void))(v3 + 16))(v3, a1[6], a1[7], a1[8]);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10007CD4C(void *a1)
{
  id v2 = objc_autoreleasePoolPush();
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___W5ActiveRequest);
  -[W5ActiveRequest setType:](v3, "setType:", 4LL);
  -[W5ActiveRequest setUuid:](v3, "setUuid:", a1[4]);
  -[W5ActiveRequest setPeerID:](v3, "setPeerID:", 0LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5ActiveRequest setTimestamp:](v3, "setTimestamp:");
  -[W5ActiveRequest setWantsUpdates:](v3, "setWantsUpdates:", 1LL);
  [*(id *)(a1[5] + 16) addObject:v3];
  uint64_t v4 = a1[5];
  uint64_t v5 = *(void **)(v4 + 80);
  uint64_t v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472LL;
  uint64_t v8 = sub_10007CE30;
  __int128 v9 = &unk_1000D2068;
  objc_msgSend( v5,  "xpcConnection:startPeerDiscoveryWithConfiguration:uuid:reply:",  _NSConcreteStackBlock,  3221225472,  sub_10007CE30,  &unk_1000D2068,  v4,  a1[7]);
  objc_autoreleasePoolPop(v2);
}

void sub_10007CE30(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 8LL);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10007CE88;
  v4[3] = &unk_1000D1F28;
  void v4[4] = a2;
  void v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_10007CE88(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10007CF20(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(a1[4] + 80) xpcConnection:a1[4] stopPeerDiscoveryWithUUID:a1[5] reply:a1[6]];
  objc_autoreleasePoolPop(v2);
}

void sub_10007CFBC(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___W5ActiveRequest);
  -[W5ActiveRequest setType:](v3, "setType:", 3LL);
  -[W5ActiveRequest setUuid:](v3, "setUuid:", *(void *)(a1 + 32));
  -[W5ActiveRequest setPeerID:](v3, "setPeerID:", [*(id *)(a1 + 40) peerID]);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5ActiveRequest setTimestamp:](v3, "setTimestamp:");
  [*(id *)(*(void *)(a1 + 48) + 16) addObject:v3];
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void **)(v4 + 80);
  double v6 = *(double *)(a1 + 72);
  uint64_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  __int128 v9 = sub_10007D0A8;
  uint64_t v10 = &unk_1000D3148;
  uint64_t v11 = v4;
  uint64_t v12 = v3;
  uint64_t v13 = *(void *)(a1 + 64);
  objc_msgSend(v5, "xpcConnection:runWiFiSnifferOnChannels:duration:peer:uuid:reply:", v6);
  objc_autoreleasePoolPop(v2);
}

__n128 sub_10007D0A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __int128 v5 = *(_OWORD *)(a1 + 32);
  block[0] = _NSConcreteStackBlock;
  double v6 = *(dispatch_queue_s **)(v5 + 8);
  block[1] = 3221225472LL;
  block[2] = sub_10007D118;
  block[3] = &unk_1000D3120;
  __int128 v10 = v5;
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v14 = a5;
  uint64_t v15 = v7;
  uint64_t v11 = a2;
  uint64_t v12 = a3;
  uint64_t v13 = a4;
  dispatch_async(v6, block);
  return result;
}

void sub_10007D118(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(a1[4] + 16) removeObject:a1[5]];
  uint64_t v3 = a1[10];
  if (v3) {
    (*(void (**)(uint64_t, void, void, void, void))(v3 + 16))(v3, a1[6], a1[7], a1[8], a1[9]);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10007D1C8(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___W5ActiveRequest);
  -[W5ActiveRequest setType:](v3, "setType:", 3LL);
  -[W5ActiveRequest setUuid:](v3, "setUuid:", *(void *)(a1 + 32));
  -[W5ActiveRequest setPeerID:](v3, "setPeerID:", [*(id *)(a1 + 40) peerID]);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5ActiveRequest setTimestamp:](v3, "setTimestamp:");
  [*(id *)(*(void *)(a1 + 48) + 16) addObject:v3];
  uint64_t v4 = *(void *)(a1 + 48);
  __int128 v5 = *(void **)(v4 + 80);
  double v6 = *(double *)(a1 + 72);
  uint64_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  __int128 v9 = sub_10007D2B4;
  __int128 v10 = &unk_1000D30A8;
  uint64_t v11 = v4;
  uint64_t v12 = v3;
  uint64_t v13 = *(void *)(a1 + 64);
  objc_msgSend(v5, "xpcConnection:runWiFiSnifferWithTCPDumpOnChannels:duration:peer:uuid:reply:", v6);
  objc_autoreleasePoolPop(v2);
}

__n128 sub_10007D2B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = _NSConcreteStackBlock;
  __int128 v3 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 8LL);
  block[1] = 3221225472LL;
  block[2] = sub_10007D320;
  block[3] = &unk_1000D3080;
  __int128 v8 = v3;
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v10 = a3;
  uint64_t v11 = v5;
  uint64_t v9 = a2;
  dispatch_async(v4, block);
  return result;
}

void sub_10007D320(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(a1[4] + 16) removeObject:a1[5]];
  uint64_t v3 = a1[8];
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, a1[6], a1[7]);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10007D3C4(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___W5ActiveRequest);
  -[W5ActiveRequest setType:](v3, "setType:", 5LL);
  -[W5ActiveRequest setUuid:](v3, "setUuid:", *(void *)(a1 + 32));
  -[W5ActiveRequest setPeerID:]( v3,  "setPeerID:",  objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", @"Peer"), "peerID"));
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5ActiveRequest setTimestamp:](v3, "setTimestamp:");
  [*(id *)(*(void *)(a1 + 48) + 16) addObject:v3];
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  double v6 = *(void **)(v4 + 80);
  uint64_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  uint64_t v9 = sub_10007D4B4;
  uint64_t v10 = &unk_1000D3198;
  uint64_t v11 = v4;
  uint64_t v12 = v3;
  uint64_t v13 = v5;
  objc_msgSend(v6, "xpcConnection:runWiFiPerformanceLoggingWithConfiguration:uuid:reply:");
  objc_autoreleasePoolPop(v2);
}

__n128 sub_10007D4B4(uint64_t a1, uint64_t a2)
{
  v6[0] = _NSConcreteStackBlock;
  __int128 v2 = *(_OWORD *)(a1 + 32);
  uint64_t v3 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 8LL);
  v6[1] = 3221225472LL;
  _DWORD v6[2] = sub_10007D51C;
  v6[3] = &unk_1000D2090;
  __int128 v7 = v2;
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v8 = a2;
  uint64_t v9 = v4;
  dispatch_async(v3, v6);
  return result;
}

void sub_10007D51C(void *a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  [*(id *)(a1[4] + 16) removeObject:a1[5]];
  uint64_t v3 = a1[7];
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, a1[6]);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10007D5C0(uint64_t a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  id v3 = objc_msgSend(*(id *)(a1 + 32), "__activeRequestWithUUID:", *(void *)(a1 + 40));
  if (v3)
  {
    uint64_t v4 = v3;
    switch((unint64_t)[v3 type])
    {
      case 1uLL:
        objc_msgSend( *(id *)(*(void *)(a1 + 32) + 80),  "xpcConnection:cancelDiagnosticsWithUUID:peerID:reply:",  *(void *)(a1 + 32),  objc_msgSend(v4, "uuid"),  objc_msgSend(v4, "peerID"),  0);
        break;
      case 2uLL:
        objc_msgSend( *(id *)(*(void *)(a1 + 32) + 80),  "xpcConnection:cancelCollectLogsWithUUID:peerID:reply:",  *(void *)(a1 + 32),  objc_msgSend(v4, "uuid"),  objc_msgSend(v4, "peerID"),  0);
        break;
      case 3uLL:
        objc_msgSend( *(id *)(*(void *)(a1 + 32) + 80),  "xpcConnection:cancelWiFiSnifferWithUUID:peerID:reply:",  *(void *)(a1 + 32),  objc_msgSend(v4, "uuid"),  objc_msgSend(v4, "peerID"),  0);
        break;
      case 5uLL:
        objc_msgSend( *(id *)(*(void *)(a1 + 32) + 80),  "xpcConnection:cancelWiFiPerformanceLoggingWithUUID:peerID:reply:",  *(void *)(a1 + 32),  objc_msgSend(v4, "uuid"),  objc_msgSend(v4, "peerID"),  0);
        break;
      default:
        break;
    }

    [*(id *)(*(void *)(a1 + 32) + 16) removeObject:v4];
  }

  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0LL);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10007D788(uint64_t a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v3 = *(void **)(*(void *)(a1 + 32) + 16LL);
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0LL; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        id v9 = [v8 type];
        if (v9 == (id)3)
        {
          objc_msgSend( *(id *)(*(void *)(a1 + 32) + 80),  "xpcConnection:cancelWiFiSnifferWithUUID:peerID:reply:",  *(void *)(a1 + 32),  objc_msgSend(v8, "uuid"),  objc_msgSend(v8, "peerID"),  0);
        }

        else if (v9 == (id)2)
        {
          objc_msgSend( *(id *)(*(void *)(a1 + 32) + 80),  "xpcConnection:cancelCollectLogsWithUUID:peerID:reply:",  *(void *)(a1 + 32),  objc_msgSend(v8, "uuid"),  objc_msgSend(v8, "peerID"),  0);
        }

        else if (v9 == (id)1)
        {
          objc_msgSend( *(id *)(*(void *)(a1 + 32) + 80),  "xpcConnection:cancelDiagnosticsWithUUID:peerID:reply:",  *(void *)(a1 + 32),  objc_msgSend(v8, "uuid"),  objc_msgSend(v8, "peerID"),  0);
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v5);
  }

  [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, void))(v10 + 16))(v10, 0LL);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10007D9D0(void *a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  if (a1[8] == 1LL) {
    [*(id *)(a1[4] + 80) xpcConnection:a1[4] cancelWiFiSnifferWithUUID:a1[5] peer:a1[6] reply:0];
  }
  uint64_t v3 = a1[7];
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0LL);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10007DA8C(uint64_t a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "__logMessage:timestamped:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0LL);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10007DB30(void *a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  [*(id *)(a1[4] + 24) addObject:&off_1000DF750];
  uint64_t v3 = a1[4];
  if (!a1[5])
  {
    id v5 = *(void **)(v3 + 80);
LABEL_7:
    objc_msgSend(v5, "xpcConnection:startMonitoringFaultEventsForPeer:reply:");
    goto LABEL_8;
  }

  if (([*(id *)(v3 + 72) containsObject:a1[5]] & 1) == 0)
  {
    [*(id *)(a1[4] + 72) addObject:a1[5]];
    id v5 = *(void **)(a1[4] + 80LL);
    goto LABEL_7;
  }

  uint64_t v4 = a1[6];
  if (v4) {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0LL);
  }
LABEL_8:
  objc_autoreleasePoolPop(v2);
}

void sub_10007DC24(void *a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  if (a1[4]) {
    objc_msgSend(*(id *)(a1[5] + 72), "removeObject:");
  }
  [*(id *)(a1[5] + 24) removeObject:&off_1000DF750];
  [*(id *)(a1[5] + 80) xpcConnection:a1[5] stopMonitoringFaultEventsForPeer:a1[4] reply:a1[6]];
  objc_autoreleasePoolPop(v2);
}

void sub_10007DCE0(void *a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  [*(id *)(a1[4] + 80) xpcConnection:a1[4] submitFaultEvent:a1[5] reply:a1[6]];
  objc_autoreleasePoolPop(v2);
}

void sub_10007DD74(void *a1)
{
  __int128 v2 = objc_autoreleasePoolPush();
  [*(id *)(a1[4] + 80) xpcConnection:a1[4] queryFaultEventCacheForPeer:a1[5] reply:a1[6]];
  objc_autoreleasePoolPop(v2);
}

void sub_10007E024(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v57 = a3;
  id v55 = a4;
  uint64_t v56 = v7;
  uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"ResponsePeer"]);
  uint64_t v8 = (W5Peer *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"RequestPeer"]);
  if (!v8) {
    uint64_t v8 = objc_alloc_init(&OBJC_CLASS___W5Peer);
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v57 objectForKeyedSubscript:RPOptionSenderIDSDeviceID]);
  -[W5Peer setPeerID:](v8, "setPeerID:", v9);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v57 objectForKeyedSubscript:RPOptionSenderDeviceName]);
  -[W5Peer setName:](v8, "setName:", v10);

  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v57 objectForKeyedSubscript:RPOptionSenderModelID]);
  -[W5Peer setModel:](v8, "setModel:", v11);

  uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"Type"]);
  switch((unint64_t)[v54 integerValue])
  {
    case 1uLL:
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) faultEventCache]);
      __int128 v61 = 0u;
      __int128 v62 = 0u;
      __int128 v59 = 0u;
      __int128 v60 = 0u;
      id v13 = [v12 countByEnumeratingWithState:&v59 objects:v65 count:16];
      if (!v13) {
        goto LABEL_24;
      }
      uint64_t v14 = *(void *)v60;
      break;
    case 2uLL:
      id v29 = *(id *)(a1 + 32);
      objc_sync_enter(v29);
      __int16 v30 = *(void **)(*(void *)(a1 + 32) + 16LL);
      if (!v30)
      {
        uint64_t v31 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
        uint64_t v32 = *(void *)(a1 + 32);
        __int128 v33 = *(void **)(v32 + 16);
        *(void *)(v32 + 16) = v31;

        objc_msgSend(*(id *)(a1 + 32), "__unarchiveNotifyPeers");
        __int16 v30 = *(void **)(*(void *)(a1 + 32) + 16LL);
      }

      [v30 addObject:v8];
      objc_msgSend(*(id *)(a1 + 32), "__archiveNotifyPeers");
      if (!v55) {
        goto LABEL_35;
      }
      goto LABEL_34;
    case 3uLL:
      id v29 = *(id *)(a1 + 32);
      objc_sync_enter(v29);
      uint64_t v34 = *(void **)(*(void *)(a1 + 32) + 16LL);
      if (!v34)
      {
        uint64_t v35 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
        uint64_t v36 = *(void *)(a1 + 32);
        NSErrorUserInfoKey v37 = *(void **)(v36 + 16);
        *(void *)(v36 + 16) = v35;

        objc_msgSend(*(id *)(a1 + 32), "__unarchiveNotifyPeers");
        uint64_t v34 = *(void **)(*(void *)(a1 + 32) + 16LL);
      }

      [v34 removeObject:v8];
      objc_msgSend(*(id *)(a1 + 32), "__archiveNotifyPeers");
      if (v55) {
LABEL_34:
      }
        (*((void (**)(id, void, void))v55 + 2))(v55, 0LL, 0LL);
LABEL_35:
      objc_sync_exit(v29);

      goto LABEL_49;
    case 4uLL:
      id v38 = *(id *)(a1 + 32);
      objc_sync_enter(v38);
      if ([*(id *)(*(void *)(a1 + 32) + 24) countForObject:v8])
      {
        uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"Event"]);
        id v40 = v39;
        if (v39)
        {
          NSErrorUserInfoKey v41 = (void *)objc_claimAutoreleasedReturnValue([v39 peer]);
          id v42 = (void *)objc_claimAutoreleasedReturnValue([v41 peerID]);

          if (!v42)
          {
            int v43 = (void *)objc_claimAutoreleasedReturnValue(-[W5Peer peerID](v8, "peerID"));
            uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v40 peer]);
            [v44 setPeerID:v43];
          }

          objc_msgSend(*(id *)(a1 + 32), "__addFaultEvent:", v40);
          __int16 v45 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) faultEventHandler]);
          ((void (**)(void, void *))v45)[2](v45, v40);
        }

        if (v55) {
          (*((void (**)(id, void, void))v55 + 2))(v55, 0LL, 0LL);
        }
      }

      else
      {
        __int16 v46 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) diagnosticsModeManager]);
        int v47 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) diagnosticsModeManager]);
        __int16 v48 = (void *)objc_claimAutoreleasedReturnValue([v47 localPeer]);
        id v49 = [v46 registeredRoleForPeer:v48];

        if (v49 == (id)16)
        {
          uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"Event"]);
          uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) diagnosticsModeManager]);
          [v51 handlePeerFaultEvent:v50];
        }

        else if (v55)
        {
          NSErrorUserInfoKey v63 = NSLocalizedFailureReasonErrorKey;
          uint64_t v64 = @"ENXIO";
          uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v64,  &v63,  1LL));
          uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  6LL,  v52));
          (*((void (**)(id, void *, void))v55 + 2))(v55, v53, 0LL);
        }
      }

      objc_sync_exit(v38);

      goto LABEL_49;
    default:
      goto LABEL_49;
  }

  do
  {
    for (uint64_t i = 0LL; i != v13; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v60 != v14) {
        objc_enumerationMutation(v12);
      }
      double v16 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)i);
      double v17 = (W5Peer *)objc_claimAutoreleasedReturnValue([v16 peer]);
      if (v17 == v8)
      {

LABEL_17:
        int v23 = (void *)objc_claimAutoreleasedReturnValue([v16 peer]);
        [v23 setPeerID:0];
        goto LABEL_21;
      }

      int v18 = (void *)objc_claimAutoreleasedReturnValue([v16 peer]);
      id v19 = v18;
      if (v18) {
        BOOL v20 = v8 != 0LL;
      }
      else {
        BOOL v20 = 0;
      }
      if (v20)
      {
        int v21 = (void *)objc_claimAutoreleasedReturnValue([v16 peer]);
        unsigned int v22 = [v21 isEqual:v8];

        if (v22) {
          goto LABEL_17;
        }
      }

      else
      {
      }

      __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v16 peer]);
      int v25 = (void *)objc_claimAutoreleasedReturnValue([v24 peerID]);
      BOOL v26 = v25 == 0LL;

      if (!v26) {
        continue;
      }
      int v23 = (void *)objc_claimAutoreleasedReturnValue([v58 peerID]);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v16 peer]);
      [v27 setPeerID:v23];

LABEL_21:
    }

    id v13 = [v12 countByEnumeratingWithState:&v59 objects:v65 count:16];
  }

  while (v13);
LABEL_24:
  __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v28 setObject:v12 forKeyedSubscript:@"Cache"];
  if (v55) {
    (*((void (**)(id, void, void *))v55 + 2))(v55, 0LL, v28);
  }

LABEL_49:
}

void sub_10007E6BC(_Unwind_Exception *a1)
{
}

void sub_10007E890(_Unwind_Exception *a1)
{
}

void sub_10007E8A8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v15 = a2;
  id v7 = a3;
  id v8 = a4;
  if (!v15)
  {
    id v9 = *(id *)(a1 + 32);
    objc_sync_enter(v9);
    uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 24LL);
    if (!v10)
    {
      __int128 v11 = objc_alloc_init(&OBJC_CLASS___NSCountedSet);
      uint64_t v12 = *(void *)(a1 + 32);
      id v13 = *(void **)(v12 + 24);
      *(void *)(v12 + 24) = v11;

      uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 24LL);
    }

    [v10 addObject:*(void *)(a1 + 40)];
    objc_sync_exit(v9);
  }

  uint64_t v14 = *(void *)(a1 + 48);
  if (v14) {
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v15);
  }
}

void sub_10007E970(_Unwind_Exception *a1)
{
}

void sub_10007EB24(_Unwind_Exception *a1)
{
}

uint64_t sub_10007EB40(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10007ECCC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a2;
    id v6 = (id)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"Cache"]);
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v5, v6);
  }

int64_t sub_10007F768(id a1, W5Event *a2, W5Event *a3)
{
  uint64_t v4 = a2;
  id v5 = a3;
  -[W5Event timestamp](v4, "timestamp");
  double v7 = v6;
  -[W5Event timestamp](v5, "timestamp");
  if (v7 <= v8)
  {
    -[W5Event timestamp](v5, "timestamp");
    double v11 = v10;
    -[W5Event timestamp](v4, "timestamp");
    if (v11 <= v12) {
      int64_t v9 = 0LL;
    }
    else {
      int64_t v9 = -1LL;
    }
  }

  else
  {
    int64_t v9 = 1LL;
  }

  return v9;
}

void sub_10007FEA8(_Unwind_Exception *a1)
{
}

id sub_10007FEFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

void sub_10007FF08(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v10)
  {
    id v9 = *(id *)(a1 + 32);
    objc_sync_enter(v9);
    [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
    objc_sync_exit(v9);
  }
}

void sub_10007FF90(_Unwind_Exception *a1)
{
}

void sub_100080038(_Unwind_Exception *a1)
{
}

void sub_100080104(_Unwind_Exception *a1)
{
}

id sub_100081478(uint64_t a1)
{
  uint64_t v2 = sub_10008C90C();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315650;
    id v7 = "-[W5RapportServer _configureCompaionLinkClient]_block_invoke";
    __int16 v8 = 2080;
    id v9 = "W5RapportServer.m";
    __int16 v10 = 1024;
    int v11 = 76;
    int v5 = 28;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v3,  0LL,  "[wifivelocity] %s (%s:%u) rapport discovery session invalidated",  (const char *)&v6,  v5);
  }

  return [*(id *)(a1 + 32) invalidateDiscoveryClient];
}

void sub_1000817D0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = *(void **)(a1 + 32);
  id v10 = a3;
  id v11 = [v9 requestPayloadClass];
  if (!v11)
  {
    double v16 = 0LL;
    goto LABEL_12;
  }

  uint64_t v12 = sub_10008E334();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 138412290;
    id v49 = (id)objc_opt_class(v11, v14);
    id v15 = v49;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "W5RapportServer payloadFromDictionary",  "%@",  buf,  0xCu);
  }

  double v16 = (void *)objc_claimAutoreleasedReturnValue([v11 payloadFromDictionary:v7]);
  uint64_t v17 = sub_10008E334();
  int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  BOOL v19 = os_signpost_enabled(v18);
  if (v16)
  {
    if (v19)
    {
      int v21 = (void *)objc_opt_class(v11, v20);
      *(_DWORD *)buf = 138412290;
      id v49 = v21;
      id v22 = v21;
      int v23 = "%@";
LABEL_10:
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v18,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "W5RapportServer payloadFromDictionary",  v23,  buf,  0xCu);
    }
  }

  else if (v19)
  {
    __int16 v24 = (void *)objc_opt_class(v11, v20);
    *(_DWORD *)buf = 138412290;
    id v49 = v24;
    id v22 = v24;
    int v23 = "%@ Failure";
    goto LABEL_10;
  }

LABEL_12:
  uint64_t v25 = sub_10008E334();
  BOOL v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_signpost_enabled(v26))
  {
    __int16 v28 = (void *)objc_opt_class(v11, v27);
    *(_DWORD *)buf = 138412290;
    id v49 = v28;
    id v29 = v28;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v26,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "W5RapportClientRequest initWithPayload",  "%@",  buf,  0xCu);
  }

  __int16 v30 = objc_alloc(&OBJC_CLASS___W5RapportClientRequest);
  id v42 = _NSConcreteStackBlock;
  uint64_t v43 = 3221225472LL;
  uint64_t v44 = sub_100081C20;
  __int16 v45 = &unk_1000D3318;
  id v31 = v8;
  id v46 = v31;
  id v47 = v11;
  uint64_t v32 = -[W5RapportClientRequest initWithPayload:options:handler:]( v30,  "initWithPayload:options:handler:",  v16,  v10,  &v42);

  uint64_t v33 = sub_10008C90C();
  uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
    *(_DWORD *)buf = 138543618;
    id v49 = v35;
    __int16 v50 = 2114;
    uint64_t v51 = v32;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v34,  0LL,  "[wifivelocity] handling incoming connection identifier='%{public}@' clientRequest='%{public}@'",  buf,  22,  v42,  v43,  v44,  v45);
  }

  uint64_t v36 = sub_10008E334();
  NSErrorUserInfoKey v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
  if (os_signpost_enabled(v37))
  {
    id v38 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
    *(_DWORD *)buf = 138412290;
    id v49 = v38;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v37,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "W5PeerRequestListener handleClientRequest",  "%@",  buf,  0xCu);
  }

  [*(id *)(a1 + 32) handleClientRequest:v32];
  uint64_t v39 = sub_10008E334();
  id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
  if (os_signpost_enabled(v40))
  {
    NSErrorUserInfoKey v41 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
    *(_DWORD *)buf = 138412290;
    id v49 = v41;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v40,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "W5PeerRequestListener handleClientRequest",  "%@",  buf,  0xCu);
  }
}

void sub_100081C20(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 encode]);
  id v8 = v6;
  if (!v7)
  {
    uint64_t v9 = sub_10008C90C();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = (const char *)v5;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "[wifivelocity] failed to encode payload for response='%{public}@'",  buf,  12);
    }

    NSErrorUserInfoKey v28 = NSLocalizedFailureReasonErrorKey;
    id v29 = @"W5EncodingErr";
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  8LL,  v11));
  }

  uint64_t v12 = sub_10008C90C();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v25 = "-[W5RapportServer _registerRequestsForListener:rapportClient:]_block_invoke";
    __int16 v26 = 2114;
    uint64_t v27 = v7;
    LODWORD(v23) = 22;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "[wifivelocity] %s: sending response payload='%{public}@'",  buf,  v23);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  uint64_t v14 = sub_10008E334();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  BOOL v16 = os_signpost_enabled(v15);
  if (v8)
  {
    if (v16)
    {
      int v18 = (void *)objc_opt_class(*(void *)(a1 + 40), v17);
      id v19 = v18;
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v8 description]);
      *(_DWORD *)buf = 138412546;
      uint64_t v25 = (const char *)v18;
      __int16 v26 = 2112;
      uint64_t v27 = v20;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v15,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "W5RapportClientRequest initWithPayload",  "%@ Error=%@",  buf,  0x16u);
    }
  }

  else if (v16)
  {
    int v21 = (char *)objc_opt_class(*(void *)(a1 + 40), v17);
    *(_DWORD *)buf = 138412290;
    uint64_t v25 = v21;
    id v22 = v21;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v15,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "W5RapportClientRequest initWithPayload",  "%@",  buf,  0xCu);
  }
}

LABEL_56:
}

void sub_100083F50(_Unwind_Exception *a1)
{
}

id sub_100083F7C(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
      }

      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  if ([v4 count]) {
    id v11 = v4;
  }
  else {
    id v11 = 0LL;
  }
  id v12 = v11;

  return v12;
}

void sub_1000840C4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  _DWORD v7[2] = sub_100084174;
  v7[3] = &unk_1000D3388;
  id v5 = *(id *)(a1 + 32);
  id v8 = WeakRetained;
  id v9 = v5;
  id v6 = WeakRetained;
  dispatch_async(v4, v7);
}

void sub_100084174(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mode]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) operationErrors]);
  (*(void (**)(uint64_t, void *, void *))(v3 + 16))(v3, v4, v5);

  objc_autoreleasePoolPop(v2);
}

void sub_1000852AC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,id location)
{
}

void sub_1000852D8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  _DWORD v7[2] = sub_100085388;
  v7[3] = &unk_1000D3388;
  id v5 = *(id *)(a1 + 32);
  id v8 = WeakRetained;
  id v9 = v5;
  id v6 = WeakRetained;
  dispatch_async(v4, v7);
}

void sub_100085388(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mode]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) operationErrors]);
  (*(void (**)(uint64_t, void *, void *))(v3 + 16))(v3, v4, v5);

  objc_autoreleasePoolPop(v2);
}

void sub_100085D3C(_Unwind_Exception *a1)
{
}

void sub_100085D68(id *a1)
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100085E28;
  block[3] = &unk_1000D33D8;
  id v6 = a1[5];
  id v5 = a1[4];
  objc_copyWeak(&v7, a1 + 6);
  dispatch_async(v3, block);

  objc_destroyWeak(&v7);
}

void sub_100085E28(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained operationErrors]);
  (*(void (**)(uint64_t, uint64_t, void *))(v3 + 16))(v3, v4, v6);

  objc_autoreleasePoolPop(v2);
}

void sub_100085FC8(_Unwind_Exception *a1)
{
}

void sub_100085FEC(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 error]);

  uint64_t v6 = sub_10008C90C();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      unint64_t v9 = *(void *)(a1 + 64);
      id v10 = *(void **)(a1 + 32);
      id v11 = sub_100086280(v9);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v3 error]);
      int v23 = 136316162;
      __int16 v24 = "-[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:]_block_invoke";
      __int16 v25 = 2048;
      unint64_t v26 = v9;
      __int16 v27 = 2112;
      NSErrorUserInfoKey v28 = v10;
      __int16 v29 = 2114;
      __int16 v30 = v12;
      __int16 v31 = 2114;
      uint64_t v32 = v13;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  0LL,  "[wifivelocity] %s: [DM] failed to run action=%ld (%@) on peer='%{public}@' error='%{public}@'",  &v23,  52);
    }

    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([WeakRetained operationErrors]);
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", *(void *)(a1 + 64)));
    int v21 = v14;
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v3 error]);
    id v22 = v15;
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
    -[os_log_s addObject:](v7, "addObject:", v16);
  }

  else if (v8)
  {
    unint64_t v17 = *(void *)(a1 + 64);
    int v18 = sub_100086280(v17);
    id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    uint64_t v20 = *(void **)(a1 + 32);
    int v23 = 136315906;
    __int16 v24 = "-[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:]_block_invoke";
    __int16 v25 = 2048;
    unint64_t v26 = v17;
    __int16 v27 = 2112;
    NSErrorUserInfoKey v28 = v19;
    __int16 v29 = 2114;
    __int16 v30 = v20;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  0LL,  "[wifivelocity] %s: [DM] successful run action=%ld (%@) on peer='%{public}@'",  &v23,  42);
  }
}

CFStringRef sub_100086280(unint64_t a1)
{
  if (a1 > 0xC) {
    return @"Unknown";
  }
  else {
    return off_1000D3420[a1];
  }
}

id sub_100086378(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v19 = a2;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        if (((unint64_t)[v10 role] & a3) != 0)
        {
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 peer]);
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 peerID]);
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v19 peer]);
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 peerID]);
          unsigned int v15 = [v12 isEqualToString:v14];

          if (v15)
          {
            id v16 = v10;
            goto LABEL_12;
          }
        }
      }

      id v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v16 = 0LL;
LABEL_12:

  return v16;
}

id sub_100086510(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        unint64_t v9 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 peer]);
        uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 peerID]);
        if ((id)v11 == v4)
        {

LABEL_13:
          id v16 = v9;
          goto LABEL_14;
        }

        id v12 = (void *)v11;
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 peer]);
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 peerID]);
        unsigned int v15 = [v14 isEqualToString:v4];

        if (v15) {
          goto LABEL_13;
        }
      }

      id v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      id v16 = 0LL;
      if (v6) {
        continue;
      }
      break;
    }
  }

  else
  {
    id v16 = 0LL;
  }

void sub_100088588(_Unwind_Exception *a1)
{
}

void sub_1000885B4(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleRapportDeviceFound:v3];
}

void sub_1000885FC(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleRapportDeviceLost:v3];
}

void sub_100088E04(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___W5PeerGenericResponsePayload);
  -[W5PeerGenericResponsePayload setInfo:](v7, "setInfo:", v6);
  uint64_t v8 = sub_10008C90C();
  unint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136316162;
    __int128 v14 = "-[W5PeerGenericRequestListener handleClientRequest:]_block_invoke";
    __int16 v15 = 2080;
    id v16 = "W5PeerGenericRequestListener.m";
    __int16 v17 = 1024;
    int v18 = 25;
    __int16 v19 = 2114;
    id v20 = v5;
    __int16 v21 = 2114;
    id v22 = v6;
    int v12 = 48;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[wifivelocity] %s (%s:%u) SEND RESPONSE (error=%{public}@, info=%{public}@)",  &v13,  v12);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) handler]);
  if (v10)
  {
    uint64_t v11 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) handler]);
    ((void (**)(void, W5PeerGenericResponsePayload *, id))v11)[2](v11, v7, v5);
  }
}

LABEL_45:
    id v38 = 0LL;
LABEL_46:

LABEL_47:
    uint64_t v89 = sub_10008C90C();
    uint64_t v90 = (os_log_s *)objc_claimAutoreleasedReturnValue(v89);
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v110 = "-[W5PeerDatabaseResponsePayload initWithRequest:]";
      uint64_t v111 = 2112;
      uint64_t v112 = v38;
      LODWORD(v96) = 22;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v90,  0LL,  "[wifivelocity] W5PeerDatabaseResponsePayload %s: init error (error='%@'",  buf,  v96);
    }

    uint64_t v91 = sub_10008E334();
    uint64_t v92 = (os_log_s *)objc_claimAutoreleasedReturnValue(v91);
    if (os_signpost_enabled(v92))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v110 = v38;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v92,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "W5PeerDatabaseResponsePayload initWithRequest",  "Error=%@",  buf,  0xCu);
    }

    uint64_t v93 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s: BOOL Expression FALSE",  "-[W5PeerDatabaseResponsePayload initWithRequest:]"));
    uint64_t v94 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v93,  0LL));

    objc_exception_throw(v94);
  }

  NSErrorUserInfoKey v41 = (void *)v40;
  if (!compression_decode_scratch_buffer_size(COMPRESSION_LZFSE))
  {
    uint64_t v86 = sub_10008C90C();
    uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v110 = "-[W5PeerDatabaseResponsePayload initWithRequest:]";
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v36,  0LL,  "[wifivelocity] W5PeerDatabaseResponsePayload %s: scratchLengthBytes get sizeof failed",  buf);
    }

    goto LABEL_45;
  }

  id v42 = (void *)objc_claimAutoreleasedReturnValue(+[W5BufferPool sharedW5BufferPool](&OBJC_CLASS___W5BufferPool, "sharedW5BufferPool"));
  uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue([v42 getPairOfBuffersFromPool]);

  if ((unint64_t)-[os_log_s count](v36, "count") <= 1)
  {
    uint64_t v87 = sub_10008C90C();
    uint64_t v88 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v110 = "-[W5PeerDatabaseResponsePayload initWithRequest:]";
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v88,  0LL,  "[wifivelocity] W5PeerDatabaseResponsePayload %s: getPairOfBuffersFromPool returned less than 2 buffers",  (const char *)buf);
    }

    goto LABEL_45;
  }

  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s firstObject](v36, "firstObject"));
  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s lastObject](v36, "lastObject"));
  __int16 v45 = v43;
  id v46 = (uint8_t *)[v45 mutableBytes];
  id v47 = [v45 length];
  uint64_t v34 = v41;
  __int16 v48 = (const uint8_t *)[v34 bytes];
  id v49 = [v34 length];
  uint64_t v100 = v44;
  __int16 v50 = compression_decode_buffer( v46,  (size_t)v47,  v48,  (size_t)v49,  [v100 mutableBytes],  COMPRESSION_LZFSE);
  uint64_t v51 = sub_10008C90C();
  uint64_t v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
  uint64_t v53 = os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT);
  if (v50)
  {
    uint64_t v102 = v8;
    if (v53)
    {
      uint64_t v54 = [v34 length];
      *(_DWORD *)buf = 136315650;
      uint64_t v110 = "-[W5PeerDatabaseResponsePayload initWithRequest:]";
      uint64_t v111 = 2048;
      uint64_t v112 = (char *)v50;
      uint64_t v113 = 2048;
      uint64_t v114 = v54;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v52,  0LL,  "[wifivelocity] W5PeerDatabaseResponsePayload %s: compression_decode_buffer databaseData to Size of %zd, from size %zd",  (const char *)buf,  32,  v97);
    }

    [v45 setLength:v50];
    uint64_t v56 = objc_opt_class(&OBJC_CLASS___NSArray, v55);
    uint64_t v58 = objc_opt_class(&OBJC_CLASS___NSDictionary, v57);
    __int128 v60 = objc_opt_class(&OBJC_CLASS___NSNumber, v59);
    __int128 v62 = v34;
    NSErrorUserInfoKey v63 = objc_opt_class(&OBJC_CLASS___NSString, v61);
    uint64_t v65 = objc_opt_class(&OBJC_CLASS___NSDate, v64);
    uint64_t v67 = objc_opt_class(&OBJC_CLASS___NSUUID, v66);
    uint64_t v69 = objc_opt_class(&OBJC_CLASS___NSMutableSet, v68);
    uint64_t v99 = v63;
    uint64_t v34 = v62;
    uint64_t v71 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v56,  v58,  v60,  v99,  v65,  v67,  v69,  objc_opt_class(&OBJC_CLASS___NSNull, v70),  0LL);
    uint64_t v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
    uint64_t v107 = 0LL;
    NSErrorUserInfoKey v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v52,  v45,  &v107));
    id v38 = (char *)v107;
    uint64_t v8 = v102;
  }

  else
  {
    if (v53)
    {
      uint64_t v72 = [v34 length];
      *(_DWORD *)buf = 136315650;
      uint64_t v110 = "-[W5PeerDatabaseResponsePayload initWithRequest:]";
      uint64_t v111 = 2048;
      uint64_t v112 = 0LL;
      uint64_t v113 = 2048;
      uint64_t v114 = v72;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v52,  0LL,  "[wifivelocity] W5PeerDatabaseResponsePayload %s: FAILURE: compression_decode_buffer databaseData to Size of %zd, from size %zd",  (const char *)buf,  32,  v97);
    }

    NSErrorUserInfoKey v37 = 0LL;
    id v38 = 0LL;
  }

  uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue(+[W5BufferPool sharedW5BufferPool](&OBJC_CLASS___W5BufferPool, "sharedW5BufferPool"));
  [v73 returnBufferToPool:v45];

  uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue(+[W5BufferPool sharedW5BufferPool](&OBJC_CLASS___W5BufferPool, "sharedW5BufferPool"));
  [v74 returnBufferToPool:v100];

LABEL_26:
  if (!v37)
  {
    uint64_t v85 = sub_10008C90C();
    uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v85);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v110 = "-[W5PeerDatabaseResponsePayload initWithRequest:]";
      uint64_t v111 = 2112;
      uint64_t v112 = v38;
      LODWORD(v96) = 22;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v36,  0LL,  "[wifivelocity] W5PeerDatabaseResponsePayload %s: FAILURE to NSKeyedUnarchiver databaseData error='%@'",  buf,  v96);
    }

    goto LABEL_46;
  }

  uint64_t v75 = objc_claimAutoreleasedReturnValue( -[W5PeerDatabaseResponsePayload convertCSVArrayToKeyValueDictArray:]( v8,  "convertCSVArrayToKeyValueDictArray:",  v37));
  fetchedResults = v8->_fetchedResults;
  v8->_fetchedResults = (NSArray *)v75;

  uint64_t v77 = v8->_fetchedResults;
  uint64_t v78 = sub_10008C90C();
  uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v78);
  uint64_t v79 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
  if (!v77)
  {
    if (v79)
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v110 = "-[W5PeerDatabaseResponsePayload initWithRequest:]";
      uint64_t v111 = 2112;
      uint64_t v112 = v38;
      LODWORD(v96) = 22;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v36,  0LL,  "[wifivelocity] W5PeerDatabaseResponsePayload %s: FAILURE: _fetchedResults is nil error='%@'",  buf,  v96);
    }

    goto LABEL_46;
  }

  if (v79)
  {
    uint64_t v80 = (char *)[v34 length];
    *(_DWORD *)buf = 136315394;
    uint64_t v110 = "-[W5PeerDatabaseResponsePayload initWithRequest:]";
    uint64_t v111 = 2048;
    uint64_t v112 = v80;
    LODWORD(v96) = 22;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v36,  0LL,  "[wifivelocity] W5PeerDatabaseResponsePayload %s: W5PeerDatabaseResponsePayload sizeof databaseData %ld bytes",  (const char *)buf,  v96);
  }

  uint64_t v81 = sub_10008E334();
  uint64_t v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
  if (os_signpost_enabled(v82))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v82,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "W5PeerDatabaseResponsePayload initWithRequest",  "Success",  buf,  2u);
  }

  uint64_t v83 = v8;
  objc_autoreleasePoolPop(context);

  return v83;
}

uint64_t start()
{
  uint64_t v0 = objc_autoreleasePoolPush();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446210;
    id v11 = objc_msgSend(objc_msgSend(&off_1000DF828, "stringValue"), "UTF8String");
    _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "[wifivelocity] STARTUP! (v%{public}s)",  buf,  0xCu);
  }

  id v1 = [@"/private" stringByAppendingPathComponent:NSTemporaryDirectory()];
  uint64_t v2 = -[NSURL path]( -[NSFileManager containerURLForSecurityApplicationGroupIdentifier:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "containerURLForSecurityApplicationGroupIdentifier:",  @"group.com.apple.wifi.logs"),  "path");
  if (-[NSString hasSuffix:](v2, "hasSuffix:", @"/")) {
    uint64_t v2 = -[NSString substringToIndex:](v2, "substringToIndex:", (char *)-[NSString length](v2, "length") - 1);
  }
  -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  [v1 stringByAppendingPathComponent:@"com.apple.wifivelocity"],  0);
  -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  [v1 stringByAppendingPathComponent:@"com.apple.wifivelocity"],  0,  0,  0);
  -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  @"/var/log/com.apple.wifivelocity",  0LL,  0LL,  0LL);
  -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  @"/var/run/com.apple.wifivelocity",  0LL,  0LL,  0LL);
  -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  -[NSString stringByAppendingPathComponent:](v2, "stringByAppendingPathComponent:", @"previous"),  0LL,  0LL,  0LL);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", &_dispatch_main_q, &stru_1000D34D0);
  id v3 = objc_alloc_init(&OBJC_CLASS___W5Engine);
  if (+[W5FeatureAvailability diagnosticsModeEnabled](&OBJC_CLASS___W5FeatureAvailability, "diagnosticsModeEnabled")
    && _os_feature_enabled_impl("WiFiVelocity", "RapportServer"))
  {
    xpc_set_event_stream_handler("com.apple.rapport.matching", &_dispatch_main_q, &stru_1000D3518);
  }

  if (!v3)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
LABEL_17:
      objc_autoreleasePoolPop(v0);
      return 0LL;
    }

    *(_WORD *)buf = 0;
    uint64_t v7 = "[wifivelocity] FAILED to initialize WiFiVelocity engine";
LABEL_19:
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v7, buf, 2u);
    goto LABEL_17;
  }

  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))1;
  *(void *)&v9.sa_mask = 0LL;
  sigaction(15, &v9, 0LL);
  id v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, &_dispatch_main_q);
  if (!v4)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    uint64_t v7 = "[wifivelocity] FAILED to setup SIGTERM catcher";
    goto LABEL_19;
  }

  id v5 = v4;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10008B860;
  handler[3] = &unk_1000D1BF8;
  handler[4] = v3;
  dispatch_source_set_event_handler(v4, handler);
  dispatch_resume(v5);
  objc_autoreleasePoolPop(v0);
  -[W5Engine run](v3, "run");
  dispatch_source_cancel(v5);
  dispatch_release(v5);
  return 0LL;
}

void sub_10008B0EC(id a1, OS_xpc_object *a2)
{
  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  if (string)
  {
    id v3 = string;
    size_t v4 = strlen(string);
    if (!strncmp(v3, "com.apple.wifivelocity-wake-120", v4))
    {
      uint64_t v5 = 120LL;
    }

    else if (!strncmp(v3, "com.apple.wifivelocity-wake-240", v4))
    {
      uint64_t v5 = 240LL;
    }

    else if (!strncmp(v3, "com.apple.wifivelocity-wake-600", v4))
    {
      uint64_t v5 = 600LL;
    }

    else if (!strncmp(v3, "com.apple.wifivelocity-wake-86400", v4))
    {
      uint64_t v5 = 86400LL;
    }

    else
    {
      if (strncmp(v3, "com.apple.private.alloy.wifivelocity.idslaunchnotification", v4)) {
        return;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] IDS-based launch\n",  buf,  2u);
      }

      uint64_t v5 = 60LL;
    }

    id v6 = -[NSString substringToIndex:]( -[NSUUID UUIDString](+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"), "UUIDString"),  "substringToIndex:",  5LL);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[12] = 2050;
      *(void *)&buf[14] = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] [%{public}@] BEGIN keepalive for %{public}lds\n",  buf,  0x16u);
    }

    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3052000000LL;
    id v11 = sub_10008B384;
    int v12 = sub_10008B394;
    uint64_t v7 = os_transaction_create("com.apple.wifivelocity.keepalive.notifyd");
    objc_msgSend( +[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"),  "osTransactionCreate:transaction:",  "com.apple.wifivelocity.keepalive.notifyd",  v7);
    uint64_t v13 = v7;
    dispatch_time_t v8 = dispatch_time(0LL, 1000000000LL * v5);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10008B3A0;
    block[3] = &unk_1000D34F8;
    void block[5] = buf;
    void block[6] = v5;
    void block[4] = v6;
    dispatch_after(v8, &_dispatch_main_q, block);
    _Block_object_dispose(buf, 8);
  }

void sub_10008B384(uint64_t a1, uint64_t a2)
{
}

void sub_10008B394(uint64_t a1)
{
}

void sub_10008B3A0(void *a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    uint64_t v2 = a1[4];
    uint64_t v3 = a1[6];
    int v4 = 138543618;
    uint64_t v5 = v2;
    __int16 v6 = 2050;
    uint64_t v7 = v3;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] [%{public}@] END keepalive for %{public}lds\n",  (uint8_t *)&v4,  0x16u);
  }

  objc_msgSend( +[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"),  "osTransactionComplete:",  *(void *)(*(void *)(a1[5] + 8) + 40));

  *(void *)(*(void *)(a1[5] + 8LL) + 40LL) = 0LL;
}

void sub_10008B48C(id a1, OS_xpc_object *a2)
{
  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = string;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] RAPPORT WAKE! event='%s'",  buf,  0xCu);
    if (string) {
      goto LABEL_3;
    }
  }

  else if (string)
  {
LABEL_3:
    int v4 = -[NSString substringToIndex:]( -[NSUUID UUIDString](+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"), "UUIDString"),  "substringToIndex:",  5LL);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v4;
      *(_WORD *)&buf[12] = 2050;
      *(void *)&buf[14] = 60LL;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] [%{public}@] BEGIN RAPPORT keepalive for %{public}lds\n",  buf,  0x16u);
    }

    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3052000000LL;
    int v12 = sub_10008B384;
    uint64_t v13 = sub_10008B394;
    uint64_t v5 = os_transaction_create("com.apple.wifivelocity.keepalive.rapport");
    objc_msgSend( +[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"),  "osTransactionCreate:transaction:",  "com.apple.wifivelocity.keepalive.rapport",  v5);
    uint64_t v14 = v5;
    dispatch_time_t v6 = dispatch_time(0LL, 60000000000LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10008B774;
    block[3] = &unk_1000D34F8;
    void block[6] = 60LL;
    void block[4] = v4;
    void block[5] = buf;
    dispatch_after(v6, &_dispatch_main_q, block);
    if ((xpc_dictionary_expects_reply(a2) & 1) != 0)
    {
      xpc_object_t reply = xpc_dictionary_create_reply(a2);
      dispatch_time_t v8 = reply;
      if (reply)
      {
        xpc_dictionary_send_reply(reply);
        xpc_release(v8);
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)sigaction v9 = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] failed to create rapport reply.",  v9,  2u);
      }
    }

    _Block_object_dispose(buf, 8);
    return;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] bailing out early, no rapport event name.",  buf,  2u);
  }

void sub_10008B750( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10008B774(void *a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    uint64_t v2 = a1[4];
    uint64_t v3 = a1[6];
    int v4 = 138543618;
    uint64_t v5 = v2;
    __int16 v6 = 2050;
    uint64_t v7 = v3;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] [%{public}@] END keepalive for %{public}lds\n",  (uint8_t *)&v4,  0x16u);
  }

  objc_msgSend( +[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"),  "osTransactionComplete:",  *(void *)(*(void *)(a1[5] + 8) + 40));

  *(void *)(*(void *)(a1[5] + 8LL) + 40LL) = 0LL;
}

id sub_10008B860(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[wifivelocity] signal event handler called, exiting",  buf,  2u);
  }

  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v4 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[wifivelocity] calling exit(EXIT_FAILURE)",  v4,  2u);
    }

    exit(1);
  }

  return [v2 terminateAndNotify:&stru_1000D3538];
}

void sub_10008B920(id a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[wifivelocity] calling exit(143)",  v1,  2u);
  }

  exit(143);
}

LABEL_20:
        __int16 v15 = 0LL;
        dispatch_time_t v8 = 0LL;
LABEL_14:

        goto LABEL_15;
      }
    }

    else
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      __int16 v27 = 0LL;
      dispatch_time_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v11,  1LL,  &v27));
      int v4 = v27;

      if (!v8)
      {
        __int16 v21 = sub_10008C90C();
        id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v29 = 136315906;
          __int16 v30 = "-[W5PeerDiagnosticsRequestPayload encode]";
          __int16 v31 = 2080;
          uint64_t v32 = "W5PeerDiagnosticsRequestPayload.m";
          uint64_t v33 = 1024;
          uint64_t v34 = 77;
          uint64_t v35 = 2114;
          uint64_t v36 = v4;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "[wifivelocity] %s (%s:%u) failed to encode NULL configuration with error='%{public}@'",  &v29,  38);
        }

        goto LABEL_20;
      }
    }

    int v12 = v4;
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v8, @"configuration");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsRequestPayload tests](self, "tests"));

    if (v13)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsRequestPayload tests](self, "tests"));
      unint64_t v26 = v4;
      __int16 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v14,  1LL,  &v26));
      int v4 = v26;

      if (!v15)
      {
        id v16 = sub_10008C90C();
        id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v29 = 136315906;
          __int16 v30 = "-[W5PeerDiagnosticsRequestPayload encode]";
          __int16 v31 = 2080;
          uint64_t v32 = "W5PeerDiagnosticsRequestPayload.m";
          uint64_t v33 = 1024;
          uint64_t v34 = 85;
          uint64_t v35 = 2114;
          uint64_t v36 = v4;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "[wifivelocity] %s (%s:%u) failed to encode tests with error='%{public}@'",  &v29,  38);
        }

_UNKNOWN **sub_10008C29C()
{
  return &off_1000E44A0;
}

id sub_10008C2A8()
{
  return objc_msgSend( &off_1000E44A0,  "objectAtIndex:",  arc4random() % (unint64_t)objc_msgSend(&off_1000E44A0, "count"));
}

CFStringRef sub_10008C2E4()
{
  CFStringRef result = SCDynamicStoreCopyComputerName(0LL, 0LL);
  if (result)
  {
    CFStringRef v1 = result;
    uint64_t v2 = +[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", result);
    CFRelease(v1);
    return (CFStringRef)v2;
  }

  return result;
}

id sub_10008C330()
{
  if (IOMainPort(bootstrap_port, &mainPort)) {
    return 0LL;
  }
  io_registry_entry_t v0 = IORegistryEntryFromPath(mainPort, "IODeviceTree:/options");
  if (!v0) {
    return 0LL;
  }
  io_object_t v1 = v0;
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v0, @"boot-args", kCFAllocatorDefault, 0);
  if (!CFProperty)
  {
    IOObjectRelease(v1);
    return 0LL;
  }

  uint64_t v3 = CFProperty;
  id v4 = objc_msgSend( CFProperty,  "componentsSeparatedByCharactersInSet:",  +[NSCharacterSet whitespaceAndNewlineCharacterSet]( NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
  IOObjectRelease(v1);
  CFRelease(v3);
  return v4;
}

void sub_10008C3EC(uint64_t a1, int a2)
{
  kern_return_t v13;
  uint64_t v14;
  mach_error_t v15;
  uint64_t v16;
  CFStringRef v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE v21[24];
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  id v4 = -[NSMutableArray initWithArray:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithArray:", sub_10008C330());
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_35;
  }
  unsigned int v6 = -[NSMutableArray containsObject:](v4, "containsObject:", a1);
  if (a2)
  {
    if (v6)
    {
      if (qword_1000F75D8 != -1) {
        dispatch_once(&qword_1000F75D8, &stru_1000D3558);
      }
      uint64_t v7 = qword_1000F75D0;
      if (os_log_type_enabled((os_log_t)qword_1000F75D0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int16 v21 = 136315906;
        *(void *)&v21[4] = "W5UpdateBootargs";
        *(_WORD *)&v21[12] = 2080;
        *(void *)&v21[14] = "W5MiscUtil.m";
        *(_WORD *)&v21[22] = 1024;
        LODWORD(v22) = 133;
        WORD2(v22) = 2114;
        *(void *)((char *)&v22 + 6) = a1;
        LODWORD(v20) = 38;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  0LL,  "[wifivelocity] %s (%s:%u) %{public}@ is already in current boot-args",  v21,  v20,  *(void *)v21,  *(_OWORD *)&v21[8],  v22);
      }

      goto LABEL_35;
    }
  }

  else if ((v6 & 1) == 0)
  {
    if (qword_1000F75D8 != -1) {
      dispatch_once(&qword_1000F75D8, &stru_1000D3558);
    }
    __int16 v19 = qword_1000F75D0;
    if (os_log_type_enabled((os_log_t)qword_1000F75D0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v21 = 136315906;
      *(void *)&v21[4] = "W5UpdateBootargs";
      *(_WORD *)&v21[12] = 2080;
      *(void *)&v21[14] = "W5MiscUtil.m";
      *(_WORD *)&v21[22] = 1024;
      LODWORD(v22) = 134;
      WORD2(v22) = 2114;
      *(void *)((char *)&v22 + 6) = a1;
      LODWORD(v20) = 38;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  0LL,  "[wifivelocity] %s (%s:%u) %{public}@ is not present current in boot-args",  v21,  v20,  *(void *)v21,  *(_OWORD *)&v21[8],  v22);
    }

    goto LABEL_35;
  }

  if (IOMainPort(bootstrap_port, (mach_port_t *)&v20 + 1)
    || (io_registry_entry_t v8 = IORegistryEntryFromPath(HIDWORD(v20), "IODeviceTree:/options")) == 0)
  {
LABEL_35:

    return;
  }

  io_registry_entry_t v9 = v8;
  if (qword_1000F75D8 != -1) {
    dispatch_once(&qword_1000F75D8, &stru_1000D3558);
  }
  uint64_t v10 = qword_1000F75D0;
  if (os_log_type_enabled((os_log_t)qword_1000F75D0, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = -[NSMutableArray componentsJoinedByString:](v5, "componentsJoinedByString:", @" ");
    *(_DWORD *)__int16 v21 = 136315906;
    *(void *)&v21[4] = "W5UpdateBootargs";
    *(_WORD *)&v21[12] = 2080;
    *(void *)&v21[14] = "W5MiscUtil.m";
    *(_WORD *)&v21[22] = 1024;
    LODWORD(v22) = 143;
    WORD2(v22) = 2114;
    *(void *)((char *)&v22 + 6) = v11;
    LODWORD(v20) = 38;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "[wifivelocity] %s (%s:%u) Existing boot-args: %{public}@",  v21,  v20);
  }

  if (a2) {
    -[NSMutableArray addObject:](v5, "addObject:", a1);
  }
  else {
    -[NSMutableArray removeObject:](v5, "removeObject:", a1);
  }
  id v12 = -[NSMutableArray componentsJoinedByString:](v5, "componentsJoinedByString:", @" ");
  uint64_t v13 = IORegistryEntrySetCFProperty(v9, @"boot-args", v12);
  if (v13)
  {
    __int16 v15 = v13;
    if (qword_1000F75D8 != -1) {
      dispatch_once(&qword_1000F75D8, &stru_1000D3558);
    }
    id v16 = qword_1000F75D0;
    if (os_log_type_enabled((os_log_t)qword_1000F75D0, OS_LOG_TYPE_DEFAULT))
    {
      if (a2) {
        __int16 v17 = @"add";
      }
      else {
        __int16 v17 = @"remove";
      }
      int v18 = mach_error_string(v15);
      *(_DWORD *)__int16 v21 = 136316418;
      *(void *)&v21[4] = "W5UpdateBootargs";
      *(_WORD *)&v21[12] = 2080;
      *(void *)&v21[14] = "W5MiscUtil.m";
      *(_WORD *)&v21[22] = 1024;
      LODWORD(v22) = 151;
      WORD2(v22) = 2114;
      *(void *)((char *)&v22 + 6) = v17;
      HIWORD(v22) = 2114;
      LOWORD(v24) = 2082;
      *(void *)((char *)&v24 + 2) = v18;
      LODWORD(v20) = 58;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "[wifivelocity] %s (%s:%u) Unable to %{public}@ boot-arg: %{public}@, return: %{public}s",  v21,  v20,  *(_OWORD *)v21,  *(void *)&v21[16],  v22,  a1,  v24);
    }
  }

  else
  {
    if (qword_1000F75D8 != -1) {
      dispatch_once(&qword_1000F75D8, &stru_1000D3558);
    }
    uint64_t v14 = qword_1000F75D0;
    if (os_log_type_enabled((os_log_t)qword_1000F75D0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v21 = 136315906;
      *(void *)&v21[4] = "W5UpdateBootargs";
      *(_WORD *)&v21[12] = 2080;
      *(void *)&v21[14] = "W5MiscUtil.m";
      *(_WORD *)&v21[22] = 1024;
      LODWORD(v22) = 153;
      WORD2(v22) = 2114;
      *(void *)((char *)&v22 + 6) = v12;
      LODWORD(v20) = 38;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "[wifivelocity] %s (%s:%u) Updated device boot-args to: %{public}@",  v21,  v20,  *(_OWORD *)v21,  *(void *)&v21[16],  v22,  v23,  v24);
    }
  }

  IOObjectRelease(v9);
}

uint64_t sub_10008C90C()
{
  if (qword_1000F75D8 != -1) {
    dispatch_once(&qword_1000F75D8, &stru_1000D3558);
  }
  return qword_1000F75D0;
}

uint64_t sub_10008C94C(void *a1, void *a2, NSError **a3)
{
  __int16 v27 = 0LL;
  stat((const char *)objc_msgSend(objc_msgSend(a1, "path"), "UTF8String"), &v26);
  if (qword_1000F75D8 != -1) {
    dispatch_once(&qword_1000F75D8, &stru_1000D3558);
  }
  uint64_t v6 = qword_1000F75D0;
  uint64_t v7 = os_log_type_enabled((os_log_t)qword_1000F75D0, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v7)
  {
    id v8 = [a1 path];
    off_t st_size = v26.st_size;
    id v10 = [a2 path];
    int v34 = 136316418;
    uint64_t v35 = "W5CreateTarball";
    __int16 v36 = 2080;
    NSErrorUserInfoKey v37 = "W5MiscUtil.m";
    __int16 v38 = 1024;
    int v39 = 388;
    __int16 v40 = 2114;
    id v41 = v8;
    __int16 v42 = 2048;
    off_t v43 = st_size;
    __int16 v44 = 2114;
    id v45 = v10;
    uint64_t v7 = _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "[wifivelocity] %s (%s:%u) Archiving '%{public}@' (size=%lld) --> '%{public}@'",  &v34,  58);
  }

  uint64_t v11 = archive_write_new(v7);
  if (!v11)
  {
    NSErrorUserInfoKey v32 = NSLocalizedFailureReasonErrorKey;
    uint64_t v33 = @"ENOMEM";
    __int16 v17 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL);
    NSErrorDomain v18 = NSPOSIXErrorDomain;
    uint64_t v19 = 12LL;
LABEL_17:
    __int16 v27 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v18,  v19,  v17);
    goto LABEL_18;
  }

  if (!-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "fileExistsAtPath:",  [a1 path]))
  {
    NSErrorUserInfoKey v30 = NSLocalizedFailureReasonErrorKey;
    __int16 v31 = @"ENOENT";
    __int16 v17 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL);
    NSErrorDomain v18 = NSPOSIXErrorDomain;
    uint64_t v19 = 2LL;
    goto LABEL_17;
  }

  archive_write_add_filter_gzip(v11);
  archive_write_set_format_pax(v11);
  int v12 = archive_write_open_filename(v11, objc_msgSend(objc_msgSend(a2, "path"), "UTF8String"));
  if (v12)
  {
    uint64_t v20 = v12;
    NSErrorUserInfoKey v28 = NSLocalizedFailureReasonErrorKey;
    __int16 v29 = @"err";
    __int16 v17 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL);
    NSErrorDomain v18 = NSPOSIXErrorDomain;
    uint64_t v19 = v20;
    goto LABEL_17;
  }

  if (sub_10008CE50( v11,  a1,  objc_msgSend(objc_msgSend(a2, "lastPathComponent"), "stringByDeletingPathExtension"),  (id *)&v27))
  {
    if (qword_1000F75D8 != -1) {
      dispatch_once(&qword_1000F75D8, &stru_1000D3558);
    }
    uint64_t v13 = qword_1000F75D0;
    if (os_log_type_enabled((os_log_t)qword_1000F75D0, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [a1 path];
      id v15 = [a2 path];
      int v34 = 136316162;
      uint64_t v35 = "W5CreateTarball";
      __int16 v36 = 2080;
      NSErrorUserInfoKey v37 = "W5MiscUtil.m";
      __int16 v38 = 1024;
      int v39 = 412;
      __int16 v40 = 2114;
      id v41 = v14;
      __int16 v42 = 2114;
      off_t v43 = (off_t)v15;
      LODWORD(v25) = 48;
      uint64_t v16 = 1LL;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "[wifivelocity] %s (%s:%u) Successfuly archived '%{public}@' --> '%{public}@'",  &v34,  v25);
    }

    else
    {
      uint64_t v16 = 1LL;
    }

    goto LABEL_22;
  }

uint64_t sub_10008CE50(uint64_t a1, void *a2, void *a3, id *a4)
{
  id v40 = 0LL;
  id v8 = objc_autoreleasePoolPush();
  if (![a2 checkResourceIsReachableAndReturnError:&v40]
    || (id v39 = 0, ![a2 getResourceValue:&v39 forKey:NSURLIsDirectoryKey error:&v40]))
  {
LABEL_33:
    uint64_t v22 = 0LL;
    goto LABEL_25;
  }

  if (![v39 BOOLValue])
  {
    *(void *)__int16 v42 = 0LL;
    if ((sub_10008E524(a1, a2, a3, (NSError **)v42) & 1) == 0)
    {
      if (qword_1000F75D8 != -1) {
        dispatch_once(&qword_1000F75D8, &stru_1000D3558);
      }
      uint64_t v29 = qword_1000F75D0;
      if (os_log_type_enabled((os_log_t)qword_1000F75D0, OS_LOG_TYPE_DEFAULT))
      {
        id v30 = [a2 path];
        id v31 = [*(id *)v42 code];
        *(void *)&v51.st_mode = "__W5ArchiveAddURLToArchive";
        WORD2(v51.st_ino) = 2080;
        v51.st_dev = 136316162;
        *(__darwin_ino64_t *)((char *)&v51.st_ino + 6) = (__darwin_ino64_t)"W5MiscUtil.m";
        HIWORD(v51.st_gid) = 1024;
        v51.st_rdev = 359;
        *((_WORD *)&v51.st_rdev + 2) = 2114;
        *(void *)((char *)&v51.st_rdev + 6) = v30;
        HIWORD(v51.st_atimespec.tv_sec) = 2048;
        v51.st_atimespec.tv_nsec = (uint64_t)v31;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v29,  0LL,  "[wifivelocity] %s (%s:%u) FAILED to add file archive entry '%{public}@', returned error %ld",  &v51,  48);
      }
    }

    goto LABEL_24;
  }

  stat((const char *)objc_msgSend(objc_msgSend(a2, "path"), "UTF8String"), &v51);
  if (qword_1000F75D8 != -1) {
    dispatch_once(&qword_1000F75D8, &stru_1000D3558);
  }
  uint64_t v9 = qword_1000F75D0;
  if (os_log_type_enabled((os_log_t)qword_1000F75D0, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [a2 path];
    *(void *)&v42[4] = "__W5ArchiveAddURLToArchive";
    __int16 v43 = 2080;
    *(_DWORD *)__int16 v42 = 136316162;
    __int16 v44 = "W5MiscUtil.m";
    __int16 v45 = 1024;
    int v46 = 341;
    __int16 v47 = 2114;
    id v48 = v10;
    __int16 v49 = 2048;
    off_t st_size = v51.st_size;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[wifivelocity] %s (%s:%u) Adding contents of directory '%{public}@' (size=%lld) to archive...",  v42,  48);
  }

  uint64_t v11 = -[NSFileManager contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:",  a2,  0LL,  0LL,  &v40);
  if (!v11)
  {
    if (qword_1000F75D8 != -1) {
      dispatch_once(&qword_1000F75D8, &stru_1000D3558);
    }
    uint64_t v26 = qword_1000F75D0;
    if (os_log_type_enabled((os_log_t)qword_1000F75D0, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = [a2 path];
      id v28 = [v40 code];
      *(void *)&v42[4] = "__W5ArchiveAddURLToArchive";
      __int16 v43 = 2080;
      *(_DWORD *)__int16 v42 = 136316162;
      __int16 v44 = "W5MiscUtil.m";
      __int16 v45 = 1024;
      int v46 = 344;
      __int16 v47 = 2114;
      id v48 = v27;
      __int16 v49 = 2048;
      off_t st_size = (off_t)v28;
      LODWORD(v32) = 48;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v26,  0LL,  "[wifivelocity] %s (%s:%u) FAILED to get contents at URL '%{public}@', returned error %ld",  v42,  v32);
    }

    goto LABEL_33;
  }

  int v12 = v11;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v35,  v41,  16LL);
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v36;
    do
    {
      uint64_t v16 = 0LL;
      do
      {
        if (*(void *)v36 != v15) {
          objc_enumerationMutation(v12);
        }
        __int16 v17 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)v16);
        id v34 = 0LL;
        if ((sub_10008CE50( a1,  v17,  objc_msgSend(a3, "stringByAppendingPathComponent:", objc_msgSend(v17, "lastPathComponent")),  &v34) & 1) == 0)
        {
          if (qword_1000F75D8 != -1) {
            dispatch_once(&qword_1000F75D8, &stru_1000D3558);
          }
          uint64_t v18 = qword_1000F75D0;
          if (os_log_type_enabled((os_log_t)qword_1000F75D0, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v33 = v8;
            id v19 = [a2 path];
            id v20 = [v34 code];
            *(_DWORD *)__int16 v42 = 136316162;
            *(void *)&v42[4] = "__W5ArchiveAddURLToArchive";
            __int16 v43 = 2080;
            __int16 v44 = "W5MiscUtil.m";
            __int16 v45 = 1024;
            int v46 = 351;
            __int16 v47 = 2114;
            id v48 = v19;
            id v8 = v33;
            __int16 v49 = 2048;
            off_t st_size = (off_t)v20;
            LODWORD(v32) = 48;
            _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "[wifivelocity] %s (%s:%u) FAILED to add directory archive entry '%{public}@', returned error %ld",  v42,  v32);
          }
        }

        uint64_t v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v21 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v35,  v41,  16LL);
      id v14 = v21;
    }

    while (v21);
  }

LABEL_24:
  uint64_t v22 = 1LL;
LABEL_25:
  id v23 = v40;
  objc_autoreleasePoolPop(v8);
  id v24 = v40;
  if (a4 && v40) {
    *a4 = v40;
  }
  return v22;
}

uint64_t sub_10008D400(void *a1, void *a2, NSError **a3)
{
  if (qword_1000F75D8 != -1) {
    dispatch_once(&qword_1000F75D8, &stru_1000D3558);
  }
  uint64_t v6 = qword_1000F75D0;
  if (os_log_type_enabled((os_log_t)qword_1000F75D0, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [a1 path];
    off_t st_size = v27.st_size;
    id v9 = [a2 path];
    int v34 = 136316418;
    __int128 v35 = "W5CopyUsingBOMCopier";
    __int16 v36 = 2080;
    __int128 v37 = "W5MiscUtil.m";
    __int16 v38 = 1024;
    int v39 = 490;
    __int16 v40 = 2114;
    id v41 = v7;
    __int16 v42 = 2048;
    off_t v43 = st_size;
    __int16 v44 = 2114;
    id v45 = v9;
    LODWORD(v26) = 58;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "[wifivelocity] %s (%s:%u) Copying '%{public}@' (size=%lld) --> '%{public}@'",  &v34,  v26);
  }

  uint64_t v10 = BOMCopierNew( -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  objc_msgSend(objc_msgSend(a2, "path"), "stringByDeletingLastPathComponent"),  1,  0,  0));
  if (v10)
  {
    if (!-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "fileExistsAtPath:",  [a1 path]))
    {
      id v21 = 0LL;
      goto LABEL_20;
    }

    HIBYTE(v26) = 0;
    if (-[NSFileManager fileExistsAtPath:isDirectory:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "fileExistsAtPath:isDirectory:",  [a1 path],  (char *)&v26 + 7))
    {
      id v11 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
      [v11 setObject:&__kCFBooleanTrue forKeyedSubscript:@"copyResources"];
      [v11 setObject:&__kCFBooleanTrue forKeyedSubscript:@"copyExtendedAttributes"];
      int v12 = BOMCopierCopyWithOptions( v10,  [a1 fileSystemRepresentation],  objc_msgSend(a2, "fileSystemRepresentation"),  v11);
      if (!v12)
      {
        if (qword_1000F75D8 != -1) {
          dispatch_once(&qword_1000F75D8, &stru_1000D3558);
        }
        uint64_t v13 = qword_1000F75D0;
        if (os_log_type_enabled((os_log_t)qword_1000F75D0, OS_LOG_TYPE_DEFAULT))
        {
          id v14 = [a1 path];
          id v15 = [a2 path];
          int v34 = 136316162;
          __int128 v35 = "W5CopyUsingBOMCopier";
          __int16 v36 = 2080;
          __int128 v37 = "W5MiscUtil.m";
          __int16 v38 = 1024;
          int v39 = 520;
          __int16 v40 = 2114;
          id v41 = v14;
          __int16 v42 = 2114;
          off_t v43 = (off_t)v15;
          LODWORD(v26) = 48;
          uint64_t v16 = 1LL;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "[wifivelocity] %s (%s:%u) Successfuly copied using BOMCopier '%{public}@' --> '%{public}@'",  &v34,  v26);
        }

        else
        {
          uint64_t v16 = 1LL;
        }

uint64_t sub_10008D974(const __CFString *a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  if (qword_1000F75D8 != -1) {
    dispatch_once(&qword_1000F75D8, &stru_1000D3558);
  }
  uint64_t v7 = qword_1000F75D0;
  if (os_log_type_enabled((os_log_t)qword_1000F75D0, OS_LOG_TYPE_DEFAULT))
  {
    int v42 = 136316418;
    off_t v43 = "W5DeleteFilesAtPath";
    __int16 v44 = 2080;
    id v45 = "W5MiscUtil.m";
    __int16 v46 = 1024;
    int v47 = 648;
    __int16 v48 = 2114;
    __int16 v49 = a1;
    __int16 v50 = 2114;
    *(void *)stat v51 = a2;
    *(_WORD *)&v51[8] = 2048;
    *(void *)&v51[10] = a3;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  0LL,  "[wifivelocity] %s (%s:%u) [START] File Deletion Request, path: %{public}@, filter: %{public}@, threshold: %ld",  &v42,  58);
  }

  uint64_t v40 = 0LL;
  uint64_t v41 = 0LL;
  if (*a4)
  {
    if (qword_1000F75D8 != -1) {
      dispatch_once(&qword_1000F75D8, &stru_1000D3558);
    }
    uint64_t v26 = qword_1000F75D0;
    if (os_log_type_enabled((os_log_t)qword_1000F75D0, OS_LOG_TYPE_DEFAULT))
    {
      int v42 = 136315650;
      off_t v43 = "W5DeleteFilesAtPath";
      __int16 v44 = 2080;
      id v45 = "W5MiscUtil.m";
      __int16 v46 = 1024;
      int v47 = 656;
      LODWORD(v31) = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v26,  0LL,  "[wifivelocity] %s (%s:%u) [STOP] File Deletion Request",  &v42,  v31);
      goto LABEL_49;
    }

LABEL_55:
    uint64_t v28 = 0LL;
    goto LABEL_52;
  }

  id v8 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  id v9 =  -[NSURL initFileURLWithPath:isDirectory:]( objc_alloc(&OBJC_CLASS___NSURL),  "initFileURLWithPath:isDirectory:",  a1,  1LL);
  NSURLResourceKey v55 = NSURLCreationDateKey;
  uint64_t v10 = -[NSFileManager contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:]( v8,  "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:",  v9,  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v55, 1LL),  4LL,  &v41);
  if (v10)
  {
    id obj = -[NSArray filteredArrayUsingPredicate:](v10, "filteredArrayUsingPredicate:", a2);
    if (qword_1000F75D8 != -1) {
      dispatch_once(&qword_1000F75D8, &stru_1000D3558);
    }
    uint64_t v11 = qword_1000F75D0;
    if (os_log_type_enabled((os_log_t)qword_1000F75D0, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = -[NSArray count](obj, "count");
      int v42 = 136316162;
      off_t v43 = "W5DeleteFilesAtPath";
      __int16 v44 = 2080;
      id v45 = "W5MiscUtil.m";
      __int16 v46 = 1024;
      int v47 = 667;
      __int16 v48 = 2048;
      __int16 v49 = v12;
      __int16 v50 = 2114;
      *(void *)stat v51 = @"/var/run/com.apple.wifivelocity";
      LODWORD(v31) = 48;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "[wifivelocity] %s (%s:%u) Found %lu files in %{public}@ matching filter",  &v42,  v31);
    }

    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v36,  v54,  16LL);
    if (v13)
    {
      id v14 = v13;
      uint64_t v33 = 0LL;
      uint64_t v15 = *(void *)v37;
      int v32 = 136316418;
LABEL_13:
      uint64_t v16 = 0LL;
      while (1)
      {
        if (*(void *)v37 != v15) {
          objc_enumerationMutation(obj);
        }
        if (*a4) {
          break;
        }
        __int16 v17 = *(__CFString **)(*((void *)&v36 + 1) + 8 * v16);
        -[__CFString getResourceValue:forKey:error:]( v17,  "getResourceValue:forKey:error:",  &v40,  NSURLCreationDateKey,  &v41);
        if (v41)
        {
          if (qword_1000F75D8 != -1) {
            dispatch_once(&qword_1000F75D8, &stru_1000D3558);
          }
          uint64_t v18 = qword_1000F75D0;
          if (os_log_type_enabled((os_log_t)qword_1000F75D0, OS_LOG_TYPE_DEFAULT))
          {
            int v42 = 136315906;
            off_t v43 = "W5DeleteFilesAtPath";
            __int16 v44 = 2080;
            id v45 = "W5MiscUtil.m";
            __int16 v46 = 1024;
            int v47 = 675;
            __int16 v48 = 2114;
            __int16 v49 = v17;
            LODWORD(v31) = 38;
            _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "[wifivelocity] %s (%s:%u) Could not get creation date for: %{public}@",  &v42,  v31);
          }
        }

        else
        {
          NSErrorDomain v19 = +[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar");
          NSInteger v20 = -[NSDateComponents day]( -[NSCalendar components:fromDate:toDate:options:]( v19,  "components:fromDate:toDate:options:",  16LL,  v40,  +[NSDate date](&OBJC_CLASS___NSDate, "date"),  0LL),  "day");
          if (qword_1000F75D8 != -1) {
            dispatch_once(&qword_1000F75D8, &stru_1000D3558);
          }
          uint64_t v21 = qword_1000F75D0;
          if (os_log_type_enabled((os_log_t)qword_1000F75D0, OS_LOG_TYPE_DEFAULT))
          {
            int v42 = 136316674;
            off_t v43 = "W5DeleteFilesAtPath";
            __int16 v44 = 2080;
            id v45 = "W5MiscUtil.m";
            __int16 v46 = 1024;
            int v47 = 682;
            __int16 v48 = 2114;
            __int16 v49 = v17;
            __int16 v50 = 2114;
            *(void *)stat v51 = v40;
            *(_WORD *)&v51[8] = 2048;
            *(void *)&v51[10] = v20;
            __int16 v52 = 1024;
            BOOL v53 = v20 >= a3;
            LODWORD(v31) = 64;
            _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v21,  0LL,  "[wifivelocity] %s (%s:%u) %{public}@, Creation Date: %{public}@, Delta from Today: %ld days, Delete: %d",  &v42,  v31);
          }

          if (v20 >= a3)
          {
            unsigned int v22 = -[NSFileManager removeItemAtURL:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtURL:error:",  v17,  &v41);
            if (qword_1000F75D8 != -1) {
              dispatch_once(&qword_1000F75D8, &stru_1000D3558);
            }
            uint64_t v23 = qword_1000F75D0;
            if (os_log_type_enabled((os_log_t)qword_1000F75D0, OS_LOG_TYPE_DEFAULT))
            {
              int v42 = 136316418;
              off_t v43 = "W5DeleteFilesAtPath";
              __int16 v44 = 2080;
              id v45 = "W5MiscUtil.m";
              __int16 v46 = 1024;
              int v47 = 687;
              __int16 v48 = 2112;
              __int16 v49 = v17;
              __int16 v50 = 1024;
              *(_DWORD *)stat v51 = v22;
              *(_WORD *)&v51[4] = 2112;
              *(void *)&v51[6] = v41;
              LODWORD(v31) = 54;
              _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v23,  0LL,  "[wifivelocity] %s (%s:%u) Attempted to delete: %@, success: %d, error: %@",  &v42,  v31);
            }

            uint64_t v24 = v33;
            if (!v41) {
              uint64_t v24 = v33 + 1;
            }
            uint64_t v33 = v24;
          }
        }

        if (v14 == (id)++v16)
        {
          id v14 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v36,  v54,  16LL);
          if (v14) {
            goto LABEL_13;
          }
          goto LABEL_50;
        }
      }

      if (qword_1000F75D8 != -1) {
        dispatch_once(&qword_1000F75D8, &stru_1000D3558);
      }
      uint64_t v25 = qword_1000F75D0;
      if (os_log_type_enabled((os_log_t)qword_1000F75D0, OS_LOG_TYPE_DEFAULT))
      {
        int v42 = 136315650;
        off_t v43 = "W5DeleteFilesAtPath";
        __int16 v44 = 2080;
        id v45 = "W5MiscUtil.m";
        __int16 v46 = 1024;
        int v47 = 670;
        LODWORD(v31) = 28;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v25,  0LL,  "[wifivelocity] %s (%s:%u) [STOP] File Deletion Request",  (const char *)&v42,  v31,  136316418);
        goto LABEL_50;
      }

void sub_10008E308(id a1)
{
  qword_1000F75D0 = (uint64_t)os_log_create("com.apple.wifivelocity", "");
}

uint64_t sub_10008E334()
{
  if (qword_1000F75E8 != -1) {
    dispatch_once(&qword_1000F75E8, &stru_1000D3578);
  }
  return qword_1000F75E0;
}

void sub_10008E374(id a1)
{
  qword_1000F75E0 = (uint64_t)os_log_create("com.apple.wifivelocity", "Default");
}

id sub_10008E3A0(uint64_t a1)
{
  return +[NSISO8601DateFormatter stringFromDate:timeZone:formatOptions:]( &OBJC_CLASS___NSISO8601DateFormatter,  "stringFromDate:timeZone:formatOptions:",  a1,  +[NSTimeZone systemTimeZone](&OBJC_CLASS___NSTimeZone, "systemTimeZone"),  1907LL);
}

uint64_t sub_10008E3E0(unsigned __int8 *a1, unint64_t a2, unsigned __int8 *a3, void *a4)
{
  unsigned int v4 = *a1;
  if (!*a1) {
    goto LABEL_28;
  }
  uint64_t v5 = a1;
  do
  {
    if (v4 > 0x3F) {
      return 4294960554LL;
    }
    uint64_t v6 = &v5[v4 + 1];
    if (v6 - a1 > 255) {
      return 4294960554LL;
    }
    uint64_t v7 = v5 + 1;
    do
    {
      unsigned __int8 v8 = *v7;
      if (((char)*v7 - 32) <= 0x5E)
      {
LABEL_24:
        *a3++ = v8;
        goto LABEL_25;
      }

      if ((*v7 & 0x80) != 0) {
        goto LABEL_24;
      }
      *a3 = 92;
      if (v8 <= 0x63u) {
        char v10 = 48;
      }
      else {
        char v10 = 49;
      }
      a3[1] = v10;
      if (v8 >= 0x64u) {
        char v11 = v8 / 0xAu - 10;
      }
      else {
        char v11 = v8 / 0xAu;
      }
      a3[2] = v11 + 48;
      a3[3] = (v8 % 0xAu) | 0x30;
      a3 += 4;
LABEL_25:
      ++v7;
    }

    while (v7 < v6);
    *a3++ = 46;
    unsigned int v4 = *v6;
    uint64_t v5 = v6;
  }

  while (*v6);
  if (v6 == a1)
  {
LABEL_28:
    *a3++ = 46;
    uint64_t v6 = a1;
  }

  *a3 = 0;
  uint64_t result = 0LL;
  if (a4) {
    *a4 = v6 + 1;
  }
  return result;
}

uint64_t sub_10008E524(uint64_t a1, void *a2, void *a3, NSError **a4)
{
  if (qword_1000F75D8 != -1) {
    dispatch_once(&qword_1000F75D8, &stru_1000D3558);
  }
  uint64_t v8 = qword_1000F75D0;
  uint64_t v9 = os_log_type_enabled((os_log_t)qword_1000F75D0, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v9)
  {
    id v10 = [a2 path];
    uint64_t v40 = "__W5ArchiveAddFileURLToArchive";
    __int16 v41 = 2080;
    *(_DWORD *)buf = 136316162;
    *(void *)int v42 = "W5MiscUtil.m";
    *(_WORD *)&v42[8] = 1024;
    *(_DWORD *)&v42[10] = 276;
    *(_WORD *)&v42[14] = 2114;
    *(void *)&v42[16] = v10;
    __int16 v43 = 2048;
    off_t st_size = v31.st_size;
    uint64_t v9 = _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[wifivelocity] %s (%s:%u) Adding file '%{public}@' (size=%lld) to archive",  buf,  48);
  }

  uint64_t v11 = archive_entry_new(v9);
  uint64_t v12 = v11;
  if (v11)
  {
    archive_entry_copy_stat(v11, &v31);
    archive_entry_set_pathname(v12, [a3 UTF8String]);
    archive_entry_set_perm(v12, 420LL);
    int v13 = archive_write_header(a1, v12);
    if (v13)
    {
      int v24 = v13;
      NSErrorUserInfoKey v35 = NSLocalizedFailureReasonErrorKey;
      __int128 v36 = @"err";
      uint64_t v25 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v13,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  &v35,  1LL));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = (const char *)[a3 UTF8String];
        uint64_t v27 = archive_error_string(a1);
        *(_DWORD *)buf = 136446722;
        uint64_t v40 = v26;
        __int16 v41 = 1026;
        *(_DWORD *)int v42 = v24;
        *(_WORD *)&v42[4] = 2082;
        *(void *)&v42[6] = v27;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] archive_write_header() FAILED for %{public}s, returned %{public}d (%{public}s)",  buf,  0x1Cu);
      }

      goto LABEL_21;
    }

    int v14 = open((const char *)objc_msgSend(objc_msgSend(a2, "path"), "UTF8String"), 0);
    if ((v14 & 0x80000000) == 0)
    {
      int v15 = v14;
      ssize_t v16 = read(v14, v32, 0x2000uLL);
      if (v16 < 1)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          NSErrorUserInfoKey v30 = (const char *)[a3 UTF8String];
          *(_DWORD *)buf = 136446210;
          uint64_t v40 = v30;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] Unexpected zero-length file encountered for %{public}s",  buf,  0xCu);
        }

        uint64_t v18 = 0LL;
      }

      else
      {
        ssize_t v17 = v16;
        uint64_t v18 = 0LL;
        do
        {
          v18 += archive_write_data(a1, v32, v17);
          ssize_t v17 = read(v15, v32, 0x2000uLL);
        }

        while (v17 > 0);
      }

      close(v15);
      if (v18 != v31.st_size && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = (const char *)[a3 UTF8String];
        *(_DWORD *)buf = 136446722;
        uint64_t v40 = v29;
        __int16 v41 = 2050;
        *(void *)int v42 = v31.st_size;
        *(_WORD *)&v42[8] = 2050;
        *(void *)&v42[10] = v18;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] Bytes written does not equal file size (file='%{public}s', size=%{public}lld, written=%{public}zd)",  buf,  0x20u);
      }

      uint64_t v19 = 1LL;
      goto LABEL_13;
    }

    uint64_t v28 = *__error();
    NSErrorUserInfoKey v33 = NSLocalizedFailureReasonErrorKey;
    int v34 = @"errno";
    uint64_t v21 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL);
    NSErrorDomain v22 = NSPOSIXErrorDomain;
    uint64_t v23 = v28;
  }

  else
  {
    NSErrorUserInfoKey v37 = NSLocalizedFailureReasonErrorKey;
    __int128 v38 = @"ENOMEM";
    uint64_t v21 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v38,  &v37,  1LL);
    NSErrorDomain v22 = NSPOSIXErrorDomain;
    uint64_t v23 = 12LL;
  }

  uint64_t v25 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v22,  v23,  v21);
LABEL_21:
  uint64_t v19 = 0LL;
  if (a4 && v25)
  {
    uint64_t v19 = 0LL;
    *a4 = v25;
  }

void sub_10008EE64(_Unwind_Exception *exception_object)
{
}

void sub_10008EE80(id a1)
{
  io_object_t v1 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315650;
    unsigned int v4 = "-[W5PeerDiagnosticsManager configureDiscoveryClientAndActivate]_block_invoke";
    __int16 v5 = 2080;
    uint64_t v6 = "W5PeerDiagnosticsManager.m";
    __int16 v7 = 1024;
    int v8 = 139;
    int v2 = 28;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v1,  0LL,  "[wifivelocity] %s (%s:%u) rapport discovery session invalidated",  (const char *)&v3,  v2);
  }

void sub_10008EF58(id a1, RPCompanionLinkDevice *a2)
{
  int v3 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315906;
    uint64_t v6 = "-[W5PeerDiagnosticsManager configureDiscoveryClientAndActivate]_block_invoke";
    __int16 v7 = 2080;
    int v8 = "W5PeerDiagnosticsManager.m";
    __int16 v9 = 1024;
    int v10 = 142;
    __int16 v11 = 2114;
    uint64_t v12 = a2;
    int v4 = 38;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v3,  0LL,  "[wifivelocity] %s (%s:%u) found device:%{public}@",  &v5,  v4);
  }

void sub_10008F040(id a1, RPCompanionLinkDevice *a2)
{
  int v3 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315906;
    uint64_t v6 = "-[W5PeerDiagnosticsManager configureDiscoveryClientAndActivate]_block_invoke";
    __int16 v7 = 2080;
    int v8 = "W5PeerDiagnosticsManager.m";
    __int16 v9 = 1024;
    int v10 = 145;
    __int16 v11 = 2114;
    uint64_t v12 = a2;
    int v4 = 38;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v3,  0LL,  "[wifivelocity] %s (%s:%u) lost device:%{public}@",  &v5,  v4);
  }

id sub_10008F128(uint64_t a1)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  __int128 v1 = *(_OWORD *)(a1 + 32);
  int v2 = *(void **)(*(void *)(a1 + 32) + 16LL);
  v4[2] = sub_10008F184;
  v4[3] = &unk_1000D3600;
  __int128 v5 = v1;
  return [v2 activateWithCompletion:v4];
}

uint64_t sub_10008F184(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    int v4 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      int v8 = "-[W5PeerDiagnosticsManager configureDiscoveryClientAndActivate]_block_invoke_2";
      __int16 v9 = 2080;
      int v10 = "W5PeerDiagnosticsManager.m";
      __int16 v11 = 1024;
      int v12 = 161;
      __int16 v13 = 2114;
      uint64_t v14 = a2;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v4,  0LL,  "[wifivelocity] %s (%s:%u) PeerDiagnostics activation of rapport disovery client falied, error: %{public}@",  &v7,  38);
    }

    __int128 v5 = *(void **)(a1 + 32);
    objc_sync_enter(v5);
    *(void *)(*(void *)(a1 + 32) + 24LL) = 0LL;
    objc_sync_exit(v5);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10008F3C8(uint64_t a1)
{
  ssize_t v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  int v2 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t v15 = a1;
  id v3 = [*(id *)(*(void *)(a1 + 40) + 16) activeDevices];
  id v4 = [v3 countByEnumeratingWithState:&v21 objects:v43 count:16];
  if (v4)
  {
    uint64_t v17 = 0LL;
    uint64_t v18 = 0LL;
    uint64_t v19 = 0LL;
    uint64_t v20 = 0LL;
    uint64_t v5 = *(void *)v22;
    do
    {
      for (uint64_t i = 0LL; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(v3);
        }
        int v7 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        if ([v7 idsDeviceIdentifier]
          && !-[NSMutableSet containsObject:]( v2,  "containsObject:",  [v7 idsDeviceIdentifier]))
        {
          __int16 v9 = (os_log_s *)sub_10008C90C();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            int v25 = 136315906;
            uint64_t v26 = "-[W5PeerDiagnosticsManager beginPeerDiscovery]_block_invoke";
            __int16 v27 = 2080;
            uint64_t v28 = "W5PeerDiagnosticsManager.m";
            __int16 v29 = 1024;
            int v30 = 222;
            __int16 v31 = 2114;
            id v32 = v7;
            LODWORD(v14) = 38;
            _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[wifivelocity] %s (%s:%u) counting device %{public}@",  &v25,  v14);
          }

          -[NSMutableSet addObject:](v2, "addObject:", [v7 idsDeviceIdentifier]);
          if ([v7 model]
            && ((objc_msgSend(objc_msgSend(v7, "model"), "containsString:", @"iPhone") & 1) != 0
             || objc_msgSend(objc_msgSend(v7, "model"), "containsString:", @"iPad")))
          {
            ++v20;
          }

          else if ([v7 model] {
                 && objc_msgSend(objc_msgSend(v7, "model"), "containsString:", @"Mac"))
          }
          {
            ++v19;
          }

          else if ([v7 model] {
                 && objc_msgSend(objc_msgSend(v7, "model"), "containsString:", @"AppleTV"))
          }
          {
            ++v17;
          }

          else if ([v7 model])
          {
            v18 += objc_msgSend(objc_msgSend(v7, "model"), "containsString:", @"Watch");
          }
        }

        else
        {
          int v8 = (os_log_s *)sub_10008C90C();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            int v25 = 136315906;
            uint64_t v26 = "-[W5PeerDiagnosticsManager beginPeerDiscovery]_block_invoke";
            __int16 v27 = 2080;
            uint64_t v28 = "W5PeerDiagnosticsManager.m";
            __int16 v29 = 1024;
            int v30 = 219;
            __int16 v31 = 2114;
            id v32 = v7;
            LODWORD(v14) = 38;
            _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[wifivelocity] %s (%s:%u) skipping device %{public}@",  &v25,  v14);
          }
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v21 objects:v43 count:16];
    }

    while (v4);
  }

  else
  {
    uint64_t v17 = 0LL;
    uint64_t v18 = 0LL;
    uint64_t v19 = 0LL;
    uint64_t v20 = 0LL;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  objc_msgSend(objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "localDevice"), "model"),  @"DeviceModel");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  +[NSDate date](&OBJC_CLASS___NSDate, "date"),  @"Timestamp");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v20),  @"numberOfIOSDevices");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v17),  @"numberOfTVOSDevices");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v19),  @"numberOfMacOSDevices");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v18),  @"numberOfWatchOSDevices");
  int v10 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = -[NSMutableDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", @"DeviceModel");
    id v12 = -[NSMutableDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", @"Timestamp");
    int v25 = 136317186;
    uint64_t v26 = "-[W5PeerDiagnosticsManager beginPeerDiscovery]_block_invoke";
    __int16 v27 = 2080;
    uint64_t v28 = "W5PeerDiagnosticsManager.m";
    __int16 v29 = 1024;
    int v30 = 249;
    __int16 v31 = 2114;
    id v32 = v11;
    __int16 v33 = 2114;
    id v34 = v12;
    __int16 v35 = 2048;
    uint64_t v36 = v20;
    __int16 v37 = 2048;
    uint64_t v38 = v17;
    __int16 v39 = 2048;
    uint64_t v40 = v19;
    __int16 v41 = 2048;
    uint64_t v42 = v18;
    LODWORD(v14) = 88;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "[wifivelocity] %s (%s:%u) Device model %{public}@, timestamp %{public}@, found iOS devices %lu, tvOS devices %lu, macOS devices %lu, watchOS devices %lu",  &v25,  v14);
  }

  __int16 v13 = *(void **)(v15 + 40);
  objc_sync_enter(v13);

  *(void *)(*(void *)(v15 + 40) + 32LL) = -[NSMutableDictionary copy](v16, "copy");
  objc_sync_exit(v13);
  [*(id *)(v15 + 40) invalidateDiscoveryClient];
  dispatch_release(*(dispatch_object_t *)(v15 + 32));
}

void sub_10008F960(_Unwind_Exception *a1)
{
}

id sub_10008F9FC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 16LL);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10008FA68;
  v5[3] = &unk_1000D3628;
  void v5[4] = v2;
  return [v3 activateWithCompletion:v5];
}

uint64_t sub_10008FA68(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v4 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      int v8 = "-[W5PeerDiagnosticsManager registerCallbacksAndActivate]_block_invoke_2";
      __int16 v9 = 2080;
      int v10 = "W5PeerDiagnosticsManager.m";
      __int16 v11 = 1024;
      int v12 = 271;
      __int16 v13 = 2114;
      uint64_t v14 = a2;
      int v6 = 38;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v4,  0LL,  "[wifivelocity] %s (%s:%u) PeerDiagnostics activation of rapport disovery client falied, error: %{public}@",  &v7,  v6);
    }
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_10008FBCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = [*(id *)(a1 + 32) localDiagnostics];
  (*(void (**)(uint64_t, id, void, void))(a4 + 16))(a4, v5, 0LL, 0LL);
  int v6 = (os_log_s *)sub_10008C90C();
  uint64_t result = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)result)
  {
    int v9 = 136315906;
    int v10 = "-[W5PeerDiagnosticsManager registerRequestHandler]_block_invoke";
    __int16 v11 = 2080;
    int v12 = "W5PeerDiagnosticsManager.m";
    __int16 v13 = 1024;
    int v14 = 294;
    __int16 v15 = 2114;
    id v16 = v5;
    int v8 = 38;
    return _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "[wifivelocity] %s (%s:%u) received peerdiagnostics request, response %{public}@",  &v9,  v8);
  }

  return result;
}

void sub_1000900E0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100090108(uint64_t a1, uint64_t a2)
{
}

void sub_100090118(uint64_t a1)
{
}

uint64_t sub_100090124()
{
  uint64_t v3 = 0LL;
  id v4 = &v3;
  uint64_t v5 = 0x3052000000LL;
  int v6 = sub_100090108;
  int v7 = sub_100090118;
  uint64_t v0 = qword_1000F75F0;
  uint64_t v8 = qword_1000F75F0;
  if (!qword_1000F75F0)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472LL;
    v2[2] = sub_10009115C;
    v2[3] = &unk_1000D12E0;
    v2[4] = &v3;
    sub_10009115C((uint64_t)v2);
    uint64_t v0 = v4[5];
  }

  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1000901CC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_1000901E4(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315650;
      int v9 = "-[W5PeerDiagnosticsManager getDPSSummary]_block_invoke";
      __int16 v10 = 2080;
      __int16 v11 = "W5PeerDiagnosticsManager.m";
      __int16 v12 = 1024;
      int v13 = 339;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v4,  0LL,  "[wifivelocity] %s (%s:%u) Failed to obtain DPS summarized logs from wifianalyticsd",  (const char *)&v8,  28);
    }

    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }

  else
  {
    int v7 = *(void **)(a1 + 40);
    objc_sync_enter(v7);
    if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)) {
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [a2 copy];
    }
    objc_sync_exit(v7);
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }

void sub_100090340(_Unwind_Exception *a1)
{
}

uint64_t sub_100090594(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)sub_10008C90C();
  uint64_t result = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)result)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 136315906;
    int v7 = "-[W5PeerDiagnosticsManager requestDiagnostics:completionBlock:]_block_invoke";
    __int16 v8 = 2080;
    int v9 = "W5PeerDiagnosticsManager.m";
    __int16 v10 = 1024;
    int v11 = 385;
    __int16 v12 = 2114;
    uint64_t v13 = v4;
    int v5 = 38;
    return _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v2,  0LL,  "[wifivelocity] %s (%s:%u) session client with device %{public}@ invalidated",  &v6,  v5);
  }

  return result;
}

id sub_100090680(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v4 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315906;
      uint64_t v13 = "-[W5PeerDiagnosticsManager requestDiagnostics:completionBlock:]_block_invoke";
      __int16 v14 = 2080;
      uint64_t v15 = "W5PeerDiagnosticsManager.m";
      __int16 v16 = 1024;
      int v17 = 391;
      __int16 v18 = 2114;
      uint64_t v19 = a2;
      int v8 = 38;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v4,  0LL,  "[wifivelocity] %s (%s:%u) session client falied to activate, error: %{public}@",  &v12,  v8);
    }

    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    uint64_t v10 = RPOptionAllowUnauthenticated;
    int v11 = &__kCFBooleanTrue;
    int v6 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100090810;
    v9[3] = &unk_1000D36A0;
    int v7 = *(void **)(a1 + 32);
    void v9[4] = *(void *)(a1 + 40);
    return [v7 sendRequestID:@"com.apple.proximity.peerdiagnosticslink" request:&__NSDictionary0__struct options:v6 responseHandler:v9];
  }

uint64_t sub_100090810(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100090D58( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, char a39)
{
}

id sub_100090D9C(uint64_t a1)
{
  __int128 v1 = *(void **)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100090E08;
  v5[3] = &unk_1000D36C8;
  void v5[4] = v1;
  int8x16_t v2 = *(int8x16_t *)(a1 + 40);
  __int128 v3 = *(_OWORD *)(a1 + 56);
  int8x16_t v6 = vextq_s8(v2, v2, 8uLL);
  __int128 v7 = v3;
  return [v1 requestDiagnostics:v2.i64[0] completionBlock:v5];
}

void sub_100090E08(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    objc_sync_enter(v4);
    ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
    [*(id *)(a1 + 40) addObject:a2];
    id v5 = [*(id *)(a1 + 40) count];
    objc_sync_exit(v4);
    int8x16_t v6 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*(id *)(a1 + 48) model];
      *(_DWORD *)uint64_t v10 = 136316418;
      *(void *)&void v10[4] = "-[W5PeerDiagnosticsManager gatherPeerDiagnostics]_block_invoke_2";
      *(_WORD *)&v10[12] = 2080;
      *(void *)&v10[14] = "W5PeerDiagnosticsManager.m";
      *(_WORD *)&v10[22] = 1024;
      LODWORD(v11) = 454;
      WORD2(v11) = 2114;
      *(void *)((char *)&v11 + 6) = v7;
      HIWORD(v11) = 2114;
      LOWORD(v13) = 2048;
      *(void *)((char *)&v13 + 2) = v5;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "[wifivelocity] %s (%s:%u) response from peer %{public}@: %{public}@, total responses %lu",  v10,  58,  *(_OWORD *)v10,  *(void *)&v10[16],  v11,  a2,  v13);
    }
  }

  else
  {
    int v8 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 48);
      *(_DWORD *)uint64_t v10 = 136315906;
      *(void *)&void v10[4] = "-[W5PeerDiagnosticsManager gatherPeerDiagnostics]_block_invoke";
      *(_WORD *)&v10[12] = 2080;
      *(void *)&v10[14] = "W5PeerDiagnosticsManager.m";
      *(_WORD *)&v10[22] = 1024;
      LODWORD(v11) = 457;
      WORD2(v11) = 2114;
      *(void *)((char *)&v11 + 6) = v9;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[wifivelocity] %s (%s:%u) no response from peer %{public}@",  v10,  38,  *(_OWORD *)v10,  *(void *)&v10[16],  v11,  v12,  v13);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void sub_100090FFC(_Unwind_Exception *a1)
{
}

void sub_100091010(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) localDiagnostics];
  [v2 setObject:@"YES" forKeyedSubscript:@"LocalDevice"];
  __int128 v3 = *(void **)(a1 + 32);
  objc_sync_enter(v3);
  [*(id *)(a1 + 40) addObject:v2];
  objc_sync_exit(v3);
  uint64_t v4 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315906;
    int8x16_t v6 = "-[W5PeerDiagnosticsManager gatherPeerDiagnostics]_block_invoke";
    __int16 v7 = 2080;
    int v8 = "W5PeerDiagnosticsManager.m";
    __int16 v9 = 1024;
    int v10 = 471;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v4,  0LL,  "[wifivelocity] %s (%s:%u) local diagnostics %{public}@",  &v5,  38);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_100091148(_Unwind_Exception *a1)
{
}

Class sub_10009115C(uint64_t a1)
{
  int v5 = 0LL;
  if (!qword_1000F75F8)
  {
    __int128 v6 = off_1000D3710;
    uint64_t v7 = 0LL;
    qword_1000F75F8 = _sl_dlopen(&v6, &v5);
  }

  if (!qword_1000F75F8)
  {
    __int128 v3 = +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler");
    uint64_t v4 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *WiFiAnalyticsLibrary(void)");
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( v3,  "handleFailureInFunction:file:lineNumber:description:",  v4,  @"W5PeerDiagnosticsManager.m",  22LL,  @"%s",  v5);
    goto LABEL_10;
  }

  if (v5) {
    free(v5);
  }
  Class result = objc_getClass("WAClient");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL))
  {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getWAClientClass(void)_block_invoke"),  @"W5PeerDiagnosticsManager.m",  24LL,  @"Unable to find class %s",  "WAClient");
LABEL_10:
    __break(1u);
  }

  qword_1000F75F0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  return result;
}

id objc_msgSend___collectFileAtURL_outputDirectory_maxAge_maxSize_compress_remainingSize_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:");
}

id objc_msgSend___collectFilesInDirectories_include_exclude_maxAge_maxCount_maxSize_outputDirectory_compress_remainingSize_contentFilter_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "__collectFilesInDirectories:include:exclude:maxAge:maxCount:maxSize:outputDirectory:compress:remainingSize:contentFilter:");
}

id objc_msgSend___logItemsForSysdiagnoseWithFilteredContent_useMegaWiFiProfileLimits_timeout_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__logItemsForSysdiagnoseWithFilteredContent:useMegaWiFiProfileLimits:timeout:");
}

id objc_msgSend___logItemsForSysdiagnoseWithNoTimeoutAndFilteredContent_useMegaWiFiProfileLimits_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__logItemsForSysdiagnoseWithNoTimeoutAndFilteredContent:useMegaWiFiProfileLimits:");
}

id objc_msgSend___mostRecentInDirectories_matchingPrefix_matchingSuffix_excludingPrefix_excludingSuffix_maxAge_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "__mostRecentInDirectories:matchingPrefix:matchingSuffix:excludingPrefix:excludingSuffix:maxAge:");
}

id objc_msgSend___occupiedChannelsForScanResults_supportedChannels_rssiThreshold_ignoreChannel_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__occupiedChannelsForScanResults:supportedChannels:rssiThreshold:ignoreChannel:");
}

id objc_msgSend___performCFPingWithAddress_count_timeout_trafficClass_networkServiceType_dataLength_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__performCFPingWithAddress:count:timeout:trafficClass:networkServiceType:dataLength:");
}

id objc_msgSend___performLoadViaNSURLSessionWithAddress_usingTimeout_andForceWiFiInterface_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__performLoadViaNSURLSessionWithAddress:usingTimeout:andForceWiFiInterface:");
}

id objc_msgSend___performPing6WithAddress_count_wait_trafficClass_interfaceName_dataLength_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__performPing6WithAddress:count:wait:trafficClass:interfaceName:dataLength:");
}

id objc_msgSend___performPingWithAddress_count_timeout_wait_interval_trafficClass_interfaceName_dataLength_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__performPingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:");
}

id objc_msgSend___pingUsingCFNetworkWithAddress_count_timeout_trafficClass_networkServiceType_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:");
}

id objc_msgSend___pingWithAddress_count_timeout_wait_interval_trafficClass_interfaceName_dataLength_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:");
}

id objc_msgSend___runToolWithOutputFileHandle_readFromStandardError_launchPath_arguments_addCommand_addTimestamps_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "__runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:");
}

id objc_msgSend__runSnifferOnChannels_interface_duration_noAutoStop_rotationInternal_uuid_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_runSnifferOnChannels:interface:duration:noAutoStop:rotationInternal:uuid:");
}

id objc_msgSend_dumpDeviceAnalyticsCSVsUsingBatchSizeToFileWithCompletion_batchSize_maxAge_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dumpDeviceAnalyticsCSVsUsingBatchSizeToFileWithCompletion:batchSize:maxAge:");
}

id objc_msgSend_initDiagnosticsMode_wifiState_megaWiFiProfileState_noLoggingWiFiProfileState_eapolState_bluetoothState_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initDiagnosticsMode:wifiState:megaWiFiProfileState:noLoggingWiFiProfileState:eapolState:bluetoothState:");
}

id objc_msgSend_initDiagnosticsMode_wifiState_megaWiFiProfileState_noLoggingWiFiProfileState_eapolState_bluetoothState_stbcState_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initDiagnosticsMode:wifiState:megaWiFiProfileState:noLoggingWiFiProfileState:eapolState:bluetoothState:stbcState:");
}

id objc_msgSend_initWithNetUsageManager_peerManager_userNotificationManager_snifferManager_statusManager_logManager_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithNetUsageManager:peerManager:userNotificationManager:snifferManager:statusManager:logManager:");
}

id objc_msgSend_runTaskWithLaunchPath_arguments_timeout_outputData_errorData_launchHandler_didLaunch_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:");
}

id objc_msgSend_runTaskWithLaunchPath_arguments_timeout_outputData_errorData_launchHandler_reply_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:");
}

id objc_msgSend_runTaskWithLaunchPath_arguments_timeout_outputFileHandle_errorFileHandle_launchHandler_didLaunch_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:didLaunch:error:");
}

id objc_msgSend_runTaskWithLaunchPath_arguments_timeout_outputFileHandle_errorFileHandle_launchHandler_reply_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:reply:");
}

id objc_msgSend_runTaskWithLaunchPath_arguments_timeout_outputFilePath_errorFilePath_redirectErrorToOutput_launchHandler_didLaunch_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:didLaunch:error:");
}

id objc_msgSend_runTaskWithLaunchPath_arguments_timeout_outputFilePath_errorFilePath_redirectErrorToOutput_launchHandler_reply_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:reply:");
}

id objc_msgSend_xpcConnection_runDiagnosticsForPeer_diagnostics_configuration_uuid_reply_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection:runDiagnosticsForPeer:diagnostics:configuration:uuid:reply:");
}

id objc_msgSend_xpcConnection_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_uuid_reply_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection:runWiFiSnifferWithTCPDumpOnChannels:duration:peer:uuid:reply:");
}

id objc_msgSend_xpcConnection_unregisterRemoteDiagnosticEventsForPeer_configuration_reply_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection:unregisterRemoteDiagnosticEventsForPeer:configuration:reply:");
}
@interface W5DiagnosticsModeProcessor
- (BOOL)_canStartMode:(id)a3 error:(id *)a4;
- (NSDictionary)configuration;
- (NSMutableArray)operationErrors;
- (NSOperationQueue)queue;
- (W5DiagnosticsMode)mode;
- (W5DiagnosticsModePeer)currentPeer;
- (W5DiagnosticsModeProcessor)initWithCurrentPeer:(id)a3;
- (void)_cleanup;
- (void)_runAction:(int64_t)a3 peer:(id)a4 info:(id)a5 handler:(id)a6 completion:(id)a7;
- (void)performStartOperationsWithConfiguration:(id)a3 handler:(id)a4 completion:(id)a5;
- (void)performStopOperationsForMode:(id)a3 handler:(id)a4 completion:(id)a5;
- (void)performUpdateOperationsForMode:(id)a3 incomingMode:(id)a4 handler:(id)a5 completion:(id)a6;
- (void)setConfiguration:(id)a3;
- (void)setCurrentPeer:(id)a3;
- (void)setMode:(id)a3;
- (void)setOperationErrors:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation W5DiagnosticsModeProcessor

- (W5DiagnosticsModeProcessor)initWithCurrentPeer:(id)a3
{
  v4 = (W5DiagnosticsModePeer *)a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___W5DiagnosticsModeProcessor;
  v5 = -[W5DiagnosticsModeProcessor init](&v14, "init");
  v6 = v5;
  if (!v5) {
    goto LABEL_9;
  }
  if (!v4)
  {
    uint64_t v11 = sub_10008C90C();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315906;
      v16 = "-[W5DiagnosticsModeProcessor initWithCurrentPeer:]";
      __int16 v17 = 2080;
      v18 = "W5DiagnosticsModeProcessor.m";
      __int16 v19 = 1024;
      int v20 = 32;
      __int16 v21 = 2080;
      v22 = "-[W5DiagnosticsModeProcessor initWithCurrentPeer:]";
      LODWORD(v13) = 38;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "[wifivelocity] %s (%s:%u) %s: [DM] currentPeer is nil",  (const char *)&v15,  v13,  LODWORD(v14.receiver),  (const char *)v14.super_class);
    }

    goto LABEL_9;
  }

  v5->_currentPeer = v4;
  v7 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
  queue = v6->_queue;
  v6->_queue = v7;

  v9 = v6->_queue;
  if (!v9)
  {
LABEL_9:

    v6 = 0LL;
    goto LABEL_5;
  }

  -[NSOperationQueue setMaxConcurrentOperationCount:](v9, "setMaxConcurrentOperationCount:", 1LL);
LABEL_5:

  return v6;
}

- (void)performStartOperationsWithConfiguration:(id)a3 handler:(id)a4 completion:(id)a5
{
  v68 = (char *)a3;
  id v72 = a4;
  v8 = (void (**)(id, void, void *))a5;
  uint64_t v9 = sub_10008C90C();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)location = 136316162;
    *(void *)&location[4] = "-[W5DiagnosticsModeProcessor performStartOperationsWithConfiguration:handler:completion:]";
    __int16 v109 = 2080;
    v110 = "W5DiagnosticsModeProcessor.m";
    __int16 v111 = 1024;
    int v112 = 53;
    __int16 v113 = 2080;
    v114 = "-[W5DiagnosticsModeProcessor performStartOperationsWithConfiguration:handler:completion:]";
    __int16 v115 = 2114;
    v116 = v68;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "[wifivelocity] %s (%s:%u) %s: [DM] configuration='%{public}@'",  location,  48);
  }

  uint64_t v11 = -[W5DiagnosticsMode initWithConfiguration:]( objc_alloc(&OBJC_CLASS___W5DiagnosticsMode),  "initWithConfiguration:",  v68);
  -[W5DiagnosticsModeProcessor setMode:](self, "setMode:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
  LODWORD(v11) = v12 == 0LL;

  if ((_DWORD)v11)
  {
    uint64_t v23 = sub_10008C90C();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 136315906;
      *(void *)&location[4] = "-[W5DiagnosticsModeProcessor performStartOperationsWithConfiguration:handler:completion:]";
      __int16 v109 = 2080;
      v110 = "W5DiagnosticsModeProcessor.m";
      __int16 v111 = 1024;
      int v112 = 57;
      __int16 v113 = 2114;
      v114 = v68;
      LODWORD(v65) = 38;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v24,  0LL,  "[wifivelocity] %s (%s:%u) [DM] unable to create diagnostics mode from provided configuration='%{public}@'",  location,  v65);
    }

    NSErrorUserInfoKey v105 = NSLocalizedFailureReasonErrorKey;
    v106 = @"W5ParamErr";
    v66 = (char *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v106,  &v105,  1LL));
    v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  1LL,  v66));
    v107 = v67;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v107, 1LL));
    v8[2](v8, 0LL, v25);
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
    id v88 = 0LL;
    unsigned __int8 v14 = -[W5DiagnosticsModeProcessor _canStartMode:error:](self, "_canStartMode:error:", v13, &v88);
    v66 = (char *)v88;

    if ((v14 & 1) != 0)
    {
      -[W5DiagnosticsModeProcessor setConfiguration:](self, "setConfiguration:", v68);
      int v15 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
      [v15 setState:3];

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      -[W5DiagnosticsModeProcessor setOperationErrors:](self, "setOperationErrors:", v16);

      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
      v67 = (void *)objc_claimAutoreleasedReturnValue([v17 peers]);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
      unsigned __int8 v19 = [v18 role];

      if ((v19 & 8) != 0)
      {
        id v28 = sub_100083F7C(v67, 1LL);
        v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        id obj = v29;
        if (v29)
        {
          __int128 v86 = 0u;
          __int128 v87 = 0u;
          __int128 v84 = 0u;
          __int128 v85 = 0u;
          id v30 = [v29 countByEnumeratingWithState:&v84 objects:v103 count:16];
          if (v30)
          {
            uint64_t v31 = *(void *)v85;
            do
            {
              for (i = 0LL; i != v30; i = (char *)i + 1)
              {
                if (*(void *)v85 != v31) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v33 = *(void *)(*((void *)&v84 + 1) + 8LL * (void)i);
                v101 = @"DiagnosticsMode";
                v34 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
                v102 = v34;
                v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v102,  &v101,  1LL));
                -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:]( self,  "_runAction:peer:info:handler:completion:",  3LL,  v33,  v35,  v72,  v8);
              }

              id v30 = [obj countByEnumeratingWithState:&v84 objects:v103 count:16];
            }

            while (v30);
          }
        }

        else
        {
          uint64_t v41 = sub_10008C90C();
          v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)location = 136315138;
            *(void *)&location[4] = "-[W5DiagnosticsModeProcessor performStartOperationsWithConfiguration:handler:completion:]";
            _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v42,  0LL,  "[wifivelocity] %s: [DM] no primary peers found in peer list",  location);
          }
        }

        id v43 = sub_100083F7C(v67, 2LL);
        v44 = (NSNumber *)objc_claimAutoreleasedReturnValue(v43);
        v70 = v44;
        if (v44)
        {
          __int128 v82 = 0u;
          __int128 v83 = 0u;
          __int128 v80 = 0u;
          __int128 v81 = 0u;
          id v45 = -[NSNumber countByEnumeratingWithState:objects:count:]( v44,  "countByEnumeratingWithState:objects:count:",  &v80,  v100,  16LL);
          if (v45)
          {
            uint64_t v46 = *(void *)v81;
            do
            {
              for (j = 0LL; j != v45; j = (char *)j + 1)
              {
                if (*(void *)v81 != v46) {
                  objc_enumerationMutation(v70);
                }
                uint64_t v48 = *(void *)(*((void *)&v80 + 1) + 8LL * (void)j);
                v98 = @"DiagnosticsMode";
                v49 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
                v99 = v49;
                v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v99,  &v98,  1LL));
                -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:]( self,  "_runAction:peer:info:handler:completion:",  4LL,  v48,  v50,  v72,  v8);
              }

              id v45 = -[NSNumber countByEnumeratingWithState:objects:count:]( v70,  "countByEnumeratingWithState:objects:count:",  &v80,  v100,  16LL);
            }

            while (v45);
          }
        }

        else
        {
          uint64_t v51 = sub_10008C90C();
          v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)location = 136315138;
            *(void *)&location[4] = "-[W5DiagnosticsModeProcessor performStartOperationsWithConfiguration:handler:completion:]";
            _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v52,  0LL,  "[wifivelocity] %s: [DM] no secondary peers found in peer list",  location);
          }
        }

        id v53 = sub_100083F7C(v67, 4LL);
        v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
        id v69 = v54;
        if (v54)
        {
          __int128 v78 = 0u;
          __int128 v79 = 0u;
          __int128 v76 = 0u;
          __int128 v77 = 0u;
          id v55 = [v54 countByEnumeratingWithState:&v76 objects:v97 count:16];
          if (v55)
          {
            uint64_t v56 = *(void *)v77;
            do
            {
              for (k = 0LL; k != v55; k = (char *)k + 1)
              {
                if (*(void *)v77 != v56) {
                  objc_enumerationMutation(v69);
                }
                uint64_t v58 = *(void *)(*((void *)&v76 + 1) + 8LL * (void)k);
                v95 = @"DiagnosticsMode";
                v59 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
                v96 = v59;
                v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v96,  &v95,  1LL));
                -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:]( self,  "_runAction:peer:info:handler:completion:",  0LL,  v58,  v60,  v72,  v8);

                v93 = @"DiagnosticsMode";
                v61 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
                v94 = v61;
                v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v94,  &v93,  1LL));
                -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:]( self,  "_runAction:peer:info:handler:completion:",  5LL,  v58,  v62,  v72,  v8);
              }

              id v55 = [v69 countByEnumeratingWithState:&v76 objects:v97 count:16];
            }

            while (v55);
          }

          goto LABEL_54;
        }

        uint64_t v63 = sub_10008C90C();
        v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)location = 136315138;
          *(void *)&location[4] = "-[W5DiagnosticsModeProcessor performStartOperationsWithConfiguration:handler:completion:]";
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v40,  0LL,  "[wifivelocity] %s: [DM] no sniffers found in peer list",  location);
        }

        id v69 = 0LL;
      }

      else
      {
        int v20 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
        if ([v20 role])
        {
        }

        else
        {
          __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
          BOOL v22 = ((unint64_t)[v21 role] & 2) == 0;

          if (v22) {
            goto LABEL_55;
          }
        }

        v36 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
        v91[0] = @"event";
        v37 = -[NSNumber initWithInt:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInt:", 0LL);
        v91[1] = @"DiagnosticsMode";
        v92[0] = v37;
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
        v92[1] = v38;
        v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v92,  v91,  2LL));
        -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:]( self,  "_runAction:peer:info:handler:completion:",  6LL,  v36,  v39,  v72,  v8);

        id obj = (id)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
        v89[0] = @"event";
        v70 = -[NSNumber initWithInt:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInt:", 0LL);
        v89[1] = @"DiagnosticsMode";
        v90[0] = v70;
        id v69 = (id)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
        v90[1] = v69;
        v40 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v90,  v89,  2LL));
        -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:]( self,  "_runAction:peer:info:handler:completion:",  11LL,  obj,  v40,  v72,  v8);
      }

LABEL_54:
LABEL_55:
      objc_initWeak((id *)location, self);
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor queue](self, "queue"));
      v73[0] = _NSConcreteStackBlock;
      v73[1] = 3221225472LL;
      v73[2] = sub_1000840C4;
      v73[3] = &unk_1000D33B0;
      objc_copyWeak(&v75, (id *)location);
      v74 = v8;
      [v64 addBarrierBlock:v73];

      objc_destroyWeak(&v75);
      objc_destroyWeak((id *)location);
      goto LABEL_56;
    }

    uint64_t v26 = sub_10008C90C();
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 136316162;
      *(void *)&location[4] = "-[W5DiagnosticsModeProcessor performStartOperationsWithConfiguration:handler:completion:]";
      __int16 v109 = 2080;
      v110 = "W5DiagnosticsModeProcessor.m";
      __int16 v111 = 1024;
      int v112 = 65;
      __int16 v113 = 2080;
      v114 = "-[W5DiagnosticsModeProcessor performStartOperationsWithConfiguration:handler:completion:]";
      __int16 v115 = 2114;
      v116 = v66;
      LODWORD(v65) = 48;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v27,  0LL,  "[wifivelocity] %s (%s:%u) %s: [DM] start preflight checks failed error='%{public}@'",  location,  v65);
    }

    v104 = v66;
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v104, 1LL));
    v8[2](v8, 0LL, v67);
  }

- (BOOL)_canStartMode:(id)a3 error:(id *)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue([a3 peers]);
  id v6 = sub_100083F7C(v5, 4LL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7)
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v20;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)i), "info", (void)v19));
          unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"PrimaryChannel"]);

          if (!v14)
          {
            NSErrorUserInfoKey v23 = NSLocalizedFailureReasonErrorKey;
            v24 = @"W5ParamErr";
            BOOL v16 = 1;
            v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
            id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  1LL,  v18));

            if (a4 && v15)
            {
              id v15 = v15;
              BOOL v16 = 0;
              *a4 = v15;
            }

            goto LABEL_12;
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
  }

  id v15 = 0LL;
  BOOL v16 = 1;
LABEL_12:

  return v16;
}

- (void)performStopOperationsForMode:(id)a3 handler:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v105 = a4;
  id v106 = a5;
  v99 = v7;
  if ([v7 state] == (id)3 || objc_msgSend(v7, "state") == (id)4 || objc_msgSend(v7, "state") == (id)5)
  {
    -[W5DiagnosticsModeProcessor setMode:](self, "setMode:", v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[W5DiagnosticsModeProcessor setOperationErrors:](self, "setOperationErrors:", v8);

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
    [v9 setState:10];

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
    if (([v10 role] & 8) != 0)
    {
    }

    else
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
      unsigned __int8 v12 = [v11 role];

      if ((v12 & 1) == 0) {
        goto LABEL_52;
      }
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 peers]);
    id v15 = sub_100083F7C(v14, 4LL);
    v98 = (void *)objc_claimAutoreleasedReturnValue(v15);

    if (!v98)
    {
      uint64_t v33 = sub_10008C90C();
      id obj = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(obj, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)location = 136315138;
        *(void *)&location[4] = "-[W5DiagnosticsModeProcessor performStopOperationsForMode:handler:completion:]";
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  obj,  0LL,  "[wifivelocity] %s: [DM] no sniffers found in peer list",  location);
      }

- (void)performUpdateOperationsForMode:(id)a3 incomingMode:(id)a4 handler:(id)a5 completion:(id)a6
{
  id v64 = a3;
  id v10 = a4;
  id v63 = a5;
  id v11 = a6;
  -[W5DiagnosticsModeProcessor setMode:](self, "setMode:", v10);
  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  -[W5DiagnosticsModeProcessor setOperationErrors:](self, "setOperationErrors:", v12);

  if ([v10 state] != (id)3) {
    goto LABEL_13;
  }
  if (!v64)
  {
    uint64_t v13 = sub_10008C90C();
    unsigned __int8 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 136315650;
      *(void *)&location[4] = "-[W5DiagnosticsModeProcessor performUpdateOperationsForMode:incomingMode:handler:completion:]";
      __int16 v89 = 2080;
      v90 = "W5DiagnosticsModeProcessor.m";
      __int16 v91 = 1024;
      int v92 = 369;
      LODWORD(v62) = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "[wifivelocity] %s (%s:%u) [DM] No existing mode exists. Adopting incoming mode",  location,  v62,  (_DWORD)v63);
    }

    id v64 = v10;
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
  if ([v15 role])
  {

    goto LABEL_10;
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
  BOOL v17 = ((unint64_t)[v16 role] & 2) == 0;

  if (!v17)
  {
LABEL_10:
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
    v99[0] = @"event";
    __int128 v19 = -[NSNumber initWithInt:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInt:", 0LL);
    v99[1] = @"DiagnosticsMode";
    v100[0] = v19;
    v100[1] = v64;
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v100,  v99,  2LL));
    -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:]( self,  "_runAction:peer:info:handler:completion:",  6LL,  v18,  v20,  v63,  v11);

    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
    v97[0] = @"event";
    __int128 v22 = -[NSNumber initWithInt:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInt:", 0LL);
    v97[1] = @"DiagnosticsMode";
    v98[0] = v22;
    v98[1] = v64;
    NSErrorUserInfoKey v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v98,  v97,  2LL));
    -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:]( self,  "_runAction:peer:info:handler:completion:",  11LL,  v21,  v23,  v63,  v11);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
  unsigned __int8 v25 = [v24 role];

  if ((v25 & 4) != 0)
  {
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
    v95 = @"DiagnosticsMode";
    id v96 = v64;
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v96,  &v95,  1LL));
    -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:]( self,  "_runAction:peer:info:handler:completion:",  5LL,  v26,  v27,  v63,  v11);
  }

- (void)_runAction:(int64_t)a3 peer:(id)a4 info:(id)a5 handler:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  objc_initWeak(&location, self);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor queue](self, "queue"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100085FEC;
  v20[3] = &unk_1000D3400;
  id v17 = v14;
  id v23 = v17;
  v24[1] = (id)a3;
  id v18 = v12;
  id v21 = v18;
  id v19 = v13;
  id v22 = v19;
  objc_copyWeak(v24, &location);
  [v16 addOperationWithBlock:v20];

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
}

- (void)_cleanup
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor queue](self, "queue"));
  [v2 cancelAllOperations];
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (W5DiagnosticsMode)mode
{
  return self->_mode;
}

- (void)setMode:(id)a3
{
}

- (W5DiagnosticsModePeer)currentPeer
{
  return self->_currentPeer;
}

- (void)setCurrentPeer:(id)a3
{
  self->_currentPeer = (W5DiagnosticsModePeer *)a3;
}

- (NSMutableArray)operationErrors
{
  return self->_operationErrors;
}

- (void)setOperationErrors:(id)a3
{
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
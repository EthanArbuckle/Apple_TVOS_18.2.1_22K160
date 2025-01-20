@interface GTMTLReplayService
- (BOOL)cancel:(unint64_t)a3;
- (BOOL)load:(id)a3 error:(id *)a4;
- (BOOL)pause:(unint64_t)a3;
- (BOOL)resume:(unint64_t)a3;
- (GTMTLReplayService)initWithContext:(GTMTLReplayClient *)a3;
- (id)decode:(id)a3;
- (id)fetch:(id)a3;
- (id)profile:(id)a3;
- (id)query:(id)a3;
- (id)raytrace:(id)a3;
- (id)shaderdebug:(id)a3;
- (id)update:(id)a3;
- (unint64_t)registerObserver:(id)a3;
- (void)broadcastDisconnect:(id)a3 path:(id)a4;
- (void)deregisterObserver:(unint64_t)a3;
- (void)deregisterObserversForConnection:(id)a3 path:(id)a4;
- (void)display:(id)a3;
- (void)notifyError:(id)a3;
- (void)terminateProcess;
@end

@implementation GTMTLReplayService

- (GTMTLReplayService)initWithContext:(GTMTLReplayClient *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___GTMTLReplayService;
  v4 = -[GTMTLReplayService init](&v11, "init");
  v6 = v4;
  if (v4)
  {
    v4->_clientContext = a3;
    uint64_t v7 = objc_opt_new(&OBJC_CLASS___GTObservableService, v5);
    observers = v6->_observers;
    v6->_observers = (GTObservableService *)v7;

    var0 = a3->var0;
    control = (uint64_t)apr_palloc(var0, 0x48uLL);
    pthread_mutex_init((pthread_mutex_t *)(control + 8), 0LL);
    *(void *)control = apr_hash_make(var0);
  }

  return v6;
}

- (BOOL)load:(id)a3 error:(id *)a4
{
  id v6 = a3;
  clientContext = self->_clientContext;
  objc_storeStrong((id *)&self->_gputrace, a3);
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  char v18 = 0;
  id var0 = clientContext->var7.var0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = __33__GTMTLReplayService_load_error___block_invoke;
  v11[3] = &unk_58F838;
  v13 = &v15;
  v14 = clientContext;
  id v9 = v6;
  id v12 = v9;
  [var0 addOperationWithBlock:v11];
  [clientContext->var7.var0 waitUntilAllOperationsAreFinished];
  LOBYTE(var0) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)var0;
}

- (void)terminateProcess
{
  clientContext = self->_clientContext;
  if (clientContext && clientContext->var0) {
    apr_pool_destroy(clientContext->var0);
  }
  dispatch_async(&_dispatch_main_q, &__block_literal_global_26);
}

- (unint64_t)registerObserver:(id)a3
{
  return (unint64_t)-[GTObservableService registerObserver:](self->_observers, "registerObserver:", a3);
}

- (void)deregisterObserver:(unint64_t)a3
{
}

- (void)deregisterObserversForConnection:(id)a3 path:(id)a4
{
}

- (void)broadcastDisconnect:(id)a3 path:(id)a4
{
  id v9 = a4;
  id v6 = (OS_xpc_object *)objc_claimAutoreleasedReturnValue([a3 connection]);
  uint64_t v7 = v6;
  if (v6 == self->_terminateConnection)
  {
    int v8 = MessagePathEndsWith(self->_terminatePath, v9);

    if (v8) {
      -[GTMTLReplayService terminateProcess](self, "terminateProcess");
    }
  }

  else
  {
  }
}

- (void)notifyError:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __34__GTMTLReplayService_notifyError___block_invoke;
  v7[3] = &unk_58DAD8;
  id v8 = v4;
  id v6 = v4;
  -[GTObservableService notifyAll:](observers, "notifyAll:", v7);
}

- (id)query:(id)a3
{
  id v4 = a3;
  v82 = self;
  clientContext = self->_clientContext;
  id v83 = [v4 requestID];
  uint64_t v5 = -[GTReplayerOperationBatch initWithRequestID:]( objc_alloc(&OBJC_CLASS___GTReplayerOperationBatch),  "initWithRequestID:",  v83);
  group = dispatch_group_create();
  id v6 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 requests]);
  id v8 = -[NSMutableArray initWithCapacity:](v6, "initWithCapacity:", [v7 count]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 requests]);
  id v10 = [v9 count];

  if (v10)
  {
    unint64_t v12 = 0LL;
    do
    {
      v13 = (void *)objc_opt_new(&OBJC_CLASS___GTReplayResponse, v11);
      -[NSMutableArray setObject:atIndexedSubscript:](v8, "setObject:atIndexedSubscript:", v13, v12);

      ++v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue([v4 requests]);
      id v15 = [v14 count];
    }

    while ((unint64_t)v15 > v12);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v4 requests]);
  id v17 = [v16 count];

  if (v17)
  {
    unint64_t v18 = 0LL;
    do
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue([v4 requests]);
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectAtIndexedSubscript:v18]);

      uint64_t v22 = objc_opt_class(&OBJC_CLASS___GTReplayQueryRasterMap, v21);
      v89 = v20;
      if ((objc_opt_isKindOfClass(v20, v22) & 1) != 0)
      {
        id v24 = v20;
        [v24 dispatchUID];
        [v24 dispatchUID];
        id v25 = [v24 streamRef];
        id v26 = [v24 requestID];

        v27 = objc_alloc(&OBJC_CLASS___GTReplayerOperation);
        v132[0] = _NSConcreteStackBlock;
        v132[1] = 3221225472LL;
        v132[2] = __28__GTMTLReplayService_query___block_invoke;
        v132[3] = &unk_58DB00;
        v134 = clientContext;
        id v135 = v25;
        id v136 = v26;
        v133 = v8;
        int v137 = v18;
        v28 = -[GTReplayerOperation initWithBatch:withBlock:](v27, "initWithBatch:withBlock:", v5, v132);
        -[GTReplayerOperationBatch addOperation:](v5, "addOperation:", v28);

        v29 = (NSURL *)v133;
      }

      else
      {
        uint64_t v30 = objc_opt_class(&OBJC_CLASS___GTReplayQueryResourceUsage, v23);
        if ((objc_opt_isKindOfClass(v20, v30) & 1) != 0)
        {
          id v32 = v20;
          unsigned int v85 = [v32 dispatchUID];
          unint64_t v33 = (unint64_t)[v32 dispatchUID] >> 32;
          id v34 = [v32 requestID];

          v35 = objc_alloc(&OBJC_CLASS___GTReplayerOperation);
          v125[0] = _NSConcreteStackBlock;
          v125[1] = 3221225472LL;
          v125[2] = __28__GTMTLReplayService_query___block_invoke_2;
          v125[3] = &unk_58DB00;
          id v127 = v34;
          v128 = clientContext;
          unsigned int v129 = v85;
          int v130 = v33;
          v126 = v8;
          int v131 = v18;
          v36 = -[GTReplayerOperation initWithBatch:withBlock:](v35, "initWithBatch:withBlock:", v5, v125);
          -[GTReplayerOperationBatch addOperation:](v5, "addOperation:", v36);

          v29 = (NSURL *)v126;
        }

        else
        {
          uint64_t v37 = objc_opt_class(&OBJC_CLASS___GTReplayQueryDeviceCapabilities, v31);
          if ((objc_opt_isKindOfClass(v20, v37) & 1) != 0)
          {
            id v39 = [v20 requestID];
            v40 = objc_alloc(&OBJC_CLASS___GTReplayerOperation);
            v121[0] = _NSConcreteStackBlock;
            v121[1] = 3221225472LL;
            v121[2] = __28__GTMTLReplayService_query___block_invoke_3;
            v121[3] = &unk_58DB28;
            id v123 = v39;
            v122 = v8;
            int v124 = v18;
            v41 = -[GTReplayerOperation initWithBatch:withBlock:](v40, "initWithBatch:withBlock:", v5, v121);
            -[GTReplayerOperationBatch addOperation:](v5, "addOperation:", v41);

            v29 = (NSURL *)v122;
          }

          else
          {
            uint64_t v42 = objc_opt_class(&OBJC_CLASS___GTReplayQueryDerivedCounters, v38);
            if ((objc_opt_isKindOfClass(v20, v42) & 1) != 0)
            {
              id v44 = [v20 requestID];
              v45 = objc_alloc(&OBJC_CLASS___GTReplayerOperation);
              v116[0] = _NSConcreteStackBlock;
              v116[1] = 3221225472LL;
              v116[2] = __28__GTMTLReplayService_query___block_invoke_4;
              v116[3] = &unk_58DB50;
              v118 = clientContext;
              id v119 = v44;
              v117 = v8;
              int v120 = v18;
              v46 = -[GTReplayerOperation initWithBatch:withBlock:](v45, "initWithBatch:withBlock:", v5, v116);
              -[GTReplayerOperationBatch addOperation:](v5, "addOperation:", v46);

              v29 = (NSURL *)v117;
            }

            else
            {
              uint64_t v47 = objc_opt_class(&OBJC_CLASS___GTReplayQueryPerformanceState, v43);
              if ((objc_opt_isKindOfClass(v20, v47) & 1) != 0)
              {
                id v49 = [v20 requestID];
                v50 = objc_alloc(&OBJC_CLASS___GTReplayerOperation);
                v111[0] = _NSConcreteStackBlock;
                v111[1] = 3221225472LL;
                v111[2] = __28__GTMTLReplayService_query___block_invoke_5;
                v111[3] = &unk_58DB50;
                v113 = clientContext;
                id v114 = v49;
                v112 = v8;
                int v115 = v18;
                v51 = -[GTReplayerOperation initWithBatch:withBlock:](v50, "initWithBatch:withBlock:", v5, v111);
                -[GTReplayerOperationBatch addOperation:](v5, "addOperation:", v51);

                v29 = (NSURL *)v112;
              }

              else
              {
                uint64_t v52 = objc_opt_class(&OBJC_CLASS___GTReplayQueryICBTranslation, v48);
                if ((objc_opt_isKindOfClass(v20, v52) & 1) != 0)
                {
                  id v54 = v20;
                  id v81 = [v54 requestID];
                  id v86 = [v54 dispatchUID];
                  v140[0] = @"requestID";
                  v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v81));
                  v141[0] = v55;
                  v140[1] = @"functionIndex";
                  id v56 = [v54 dispatchUID];

                  v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v56));
                  v141[1] = v57;
                  v141[2] = &off_5A05E0;
                  v140[2] = @"object";
                  v140[3] = @"type";
                  v141[3] = &off_5A05F8;
                  v58 = (NSURL *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v141,  v140,  4LL));

                  dispatch_group_enter(group);
                  v104[0] = _NSConcreteStackBlock;
                  v104[1] = 3221225472LL;
                  v104[2] = __28__GTMTLReplayService_query___block_invoke_61;
                  v104[3] = &unk_58DB98;
                  v105 = v58;
                  id v108 = v81;
                  id v109 = v86;
                  v106 = v8;
                  int v110 = v18;
                  v107 = group;
                  v29 = v58;
                  FetchResourceObject((id *)&clientContext->var0, v29, v104);

                  v59 = v105;
                }

                else
                {
                  uint64_t v60 = objc_opt_class(&OBJC_CLASS___GTReplayQueryConfiguration, v53);
                  if ((objc_opt_isKindOfClass(v20, v60) & 1) != 0)
                  {
                    id v62 = [v20 requestID];
                    v63 = objc_alloc(&OBJC_CLASS___GTReplayerOperation);
                    v100[0] = _NSConcreteStackBlock;
                    v100[1] = 3221225472LL;
                    v100[2] = __28__GTMTLReplayService_query___block_invoke_3_73;
                    v100[3] = &unk_58DB28;
                    id v102 = v62;
                    v101 = v8;
                    int v103 = v18;
                    v64 = -[GTReplayerOperation initWithBatch:withBlock:](v63, "initWithBatch:withBlock:", v5, v100);
                    -[GTReplayerOperationBatch addOperation:](v5, "addOperation:", v64);

                    v29 = (NSURL *)v101;
                    goto LABEL_24;
                  }

                  uint64_t v65 = objc_opt_class(&OBJC_CLASS___GTReplayQuerySessionInfo, v61);
                  if ((objc_opt_isKindOfClass(v20, v65) & 1) == 0)
                  {
                    v29 = (NSURL *)objc_opt_new(&OBJC_CLASS___GTReplayResponse, v66);
                    -[NSURL setRequestID:](v29, "setRequestID:", [v20 requestID]);
                    v70 = objc_alloc(&OBJC_CLASS___NSError);
                    NSErrorUserInfoKey v138 = NSLocalizedDescriptionKey;
                    v139 = @"unknown request";
                    v71 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v139,  &v138,  1LL));
                    v72 = -[NSError initWithDomain:code:userInfo:]( v70,  "initWithDomain:code:userInfo:",  NSCocoaErrorDomain,  1LL,  v71);
                    -[NSURL setError:](v29, "setError:", v72);

                    -[NSMutableArray setObject:atIndexedSubscript:](v8, "setObject:atIndexedSubscript:", v29, v18);
                    goto LABEL_24;
                  }

                  id v67 = [v20 requestID];
                  v68 = v82->_gputrace;
                  v87 = objc_alloc(&OBJC_CLASS___GTReplayerOperation);
                  v95[0] = _NSConcreteStackBlock;
                  v95[1] = 3221225472LL;
                  v95[2] = __28__GTMTLReplayService_query___block_invoke_4_76;
                  v95[3] = &unk_58DBC0;
                  v96 = v68;
                  id v98 = v67;
                  v97 = v8;
                  int v99 = v18;
                  v29 = v68;
                  v69 = -[GTReplayerOperation initWithBatch:withBlock:](v87, "initWithBatch:withBlock:", v5, v95);
                  -[GTReplayerOperationBatch addOperation:](v5, "addOperation:", v69);

                  v59 = v96;
                }
              }
            }
          }
        }
      }

- (id)fetch:(id)a3
{
  id v5 = a3;
  var1 = self->_clientContext->var1;
  if (!var1 || (id var0 = var1->var0) == 0LL)
  {
    int v110 = (void *)objc_opt_new(&OBJC_CLASS___GTReplayResponse, v4);
    objc_msgSend(v110, "setRequestID:", objc_msgSend(v5, "requestID"));
    v111 = objc_alloc(&OBJC_CLASS___NSError);
    NSErrorUserInfoKey v162 = NSLocalizedDescriptionKey;
    v163 = @"Fetch request happened before replayer data source is loaded";
    v112 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v163,  &v162,  1LL));
    v113 = -[NSError initWithDomain:code:userInfo:]( v111,  "initWithDomain:code:userInfo:",  @"com.apple.gputools.MTLReplayer",  104LL,  v112);
    [v110 setError:v113];

    id v109 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue([v5 completionHandler]);
    v109[2](v109, v110);
    goto LABEL_58;
  }

  clientContext = self->_clientContext;
  id v8 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 requests]);
  id v127 = -[NSMutableDictionary initWithCapacity:](v8, "initWithCapacity:", [v9 count]);

  v128 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v10);
  v117 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v11);
  __int128 v141 = 0u;
  __int128 v142 = 0u;
  __int128 v143 = 0u;
  __int128 v144 = 0u;
  v116 = v5;
  id obj = (id)objc_claimAutoreleasedReturnValue([v5 requests]);
  id v12 = [obj countByEnumeratingWithState:&v141 objects:v161 count:16];
  if (!v12) {
    goto LABEL_56;
  }
  id v14 = v12;
  uint64_t v131 = *(void *)v142;
  v118 = var0;
  do
  {
    id v15 = 0LL;
    id v129 = v14;
    do
    {
      if (*(void *)v142 != v131) {
        objc_enumerationMutation(obj);
      }
      v16 = *(void **)(*((void *)&v141 + 1) + 8LL * (void)v15);
      uint64_t v17 = objc_opt_class(&OBJC_CLASS___GTReplayFetchTexture, v13);
      if ((objc_opt_isKindOfClass(v16, v17) & 1) == 0)
      {
        uint64_t v27 = objc_opt_class(&OBJC_CLASS___GTReplayFetchBuffer, v18);
        if ((objc_opt_isKindOfClass(v16, v27) & 1) != 0)
        {
          id v19 = v16;
          id v29 = [v19 requestID];
          id v138 = [v19 streamRef];
          unsigned int v30 = [v19 dispatchUID];
          unint64_t v31 = (unint64_t)[v19 dispatchUID];
          Object = GTMTLSMContext_getObject( *(void *)var0->var5,  (uint64_t)[v19 streamRef],  var0->var9.var0.var0 + v30);
          if (Object && *(_DWORD *)Object == 22)
          {
            entry = find_entry((uint64_t)var0->var1, &v138, 8uLL, 0LL);
            if (*entry) {
              uint64_t v34 = *(void *)(*entry + 32LL);
            }
            else {
              uint64_t v34 = 0LL;
            }
            uint64_t v90 = v30;
            v155[0] = @"requestID";
            v91 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v29,  clientContext));
            v156[0] = v91;
            v155[1] = @"functionIndex";
            v92 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v31 & 0xFFFFFFFF00000000LL | v90));
            v156[1] = v92;
            v155[2] = @"streamref";
            id v93 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v138));
            v156[2] = v93;
            v155[3] = @"object";
            id v94 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)(v34 + 8)));
            v156[3] = v94;
            v156[4] = &off_5A05F8;
            v155[4] = @"type";
            v155[5] = @"range.location";
            id v126 = v29;
            v95 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v19 range]));
            v156[5] = v95;
            v155[6] = @"range.length";
            [v19 range];
            v97 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v96));
            v156[6] = v97;
            id v98 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v156,  v155,  7LL));

            [v128 addObject:v98];
            int v99 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v126));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v127, "setObject:forKeyedSubscript:", v98, v99);

LABEL_47:
            id var0 = v118;
LABEL_48:
            id v14 = v129;
            goto LABEL_49;
          }

          goto LABEL_49;
        }

        uint64_t v35 = objc_opt_class(&OBJC_CLASS___GTReplayFetchWireframe, v28);
        if ((objc_opt_isKindOfClass(v16, v35) & 1) != 0)
        {
          id v37 = v16;
          id v38 = [v37 requestID];
          unsigned int v39 = [v37 dispatchUID];
          unint64_t v40 = (unint64_t)[v37 dispatchUID];
          else {
            uint64_t v41 = -1LL;
          }
          v153[0] = @"requestID";
          uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v38,  clientContext));
          v154[0] = v42;
          v153[1] = @"functionIndex";
          uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v40 & 0xFFFFFFFF00000000LL | v39));
          v154[1] = v43;
          v153[2] = @"object";
          id v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v41));
          v154[2] = v44;
          v154[3] = &off_5A0610;
          v153[3] = @"type";
          v153[4] = @"resolution";
          v154[4] = &off_59FE30;
          v45 = v154;
          v46 = v153;
LABEL_26:
          id v19 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v45,  v46,  5LL,  clientContext));

          id v14 = v129;
          [v128 addObject:v19];
          uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v38));
          uint64_t v53 = v127;
          id v54 = v19;
          id v55 = v52;
        }

        else
        {
          uint64_t v47 = objc_opt_class(&OBJC_CLASS___GTReplayFetchImageBlock, v36);
          if ((objc_opt_isKindOfClass(v16, v47) & 1) != 0)
          {
            id v37 = v16;
            id v38 = [v37 requestID];
            unsigned int v49 = [v37 dispatchUID];
            unint64_t v50 = (unint64_t)[v37 dispatchUID];
            uint64_t v51 = [v37 index] - 513;
            v151[0] = @"requestID";
            uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v38));
            v152[0] = v42;
            v151[1] = @"functionIndex";
            uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v50 & 0xFFFFFFFF00000000LL | v49));
            v152[1] = v43;
            v151[2] = @"object";
            id v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v51));
            v152[2] = v44;
            v152[3] = &off_5A0610;
            v151[3] = @"type";
            v151[4] = @"resolution";
            v152[4] = &off_59FE58;
            v45 = v152;
            v46 = v151;
            goto LABEL_26;
          }

          uint64_t v56 = objc_opt_class(&OBJC_CLASS___GTReplayFetchThreadgroup, v48);
          if ((objc_opt_isKindOfClass(v16, v56) & 1) != 0)
          {
            id v58 = v16;
            id v59 = [v58 requestID];
            unsigned int v60 = [v58 dispatchUID];
            unint64_t v61 = (unint64_t)[v58 dispatchUID];
            uint64_t v62 = [v58 index] - 1025;
            v149[0] = @"requestID";
            v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v59));
            v150[0] = v63;
            v149[1] = @"functionIndex";
            v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v61 & 0xFFFFFFFF00000000LL | v60));
            v150[1] = v64;
            v149[2] = @"object";
            uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v62));
            v149[3] = @"type";
            v150[2] = v65;
            v150[3] = &off_5A0658;
            id v19 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v150,  v149,  4LL));

            [v128 addObject:v19];
            uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v59));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v127, "setObject:forKeyedSubscript:", v19, v66);

            goto LABEL_48;
          }

          uint64_t v80 = objc_opt_class(&OBJC_CLASS___GTReplayFetchPostVertex, v57);
          if ((objc_opt_isKindOfClass(v16, v80) & 1) == 0)
          {
            id v19 = (id)objc_opt_new(&OBJC_CLASS___GTReplayResponse, v81);
            objc_msgSend(v19, "setRequestID:", objc_msgSend(v16, "requestID", clientContext));
            v100 = objc_alloc(&OBJC_CLASS___NSError);
            NSErrorUserInfoKey v145 = NSLocalizedDescriptionKey;
            v146 = @"unknown request";
            v101 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v146,  &v145,  1LL));
            id v102 = -[NSError initWithDomain:code:userInfo:]( v100,  "initWithDomain:code:userInfo:",  NSCocoaErrorDomain,  1LL,  v101);
            [v19 setError:v102];

            [v117 addObject:v19];
            goto LABEL_48;
          }

          id v19 = v16;
          id v82 = [v19 requestID];
          unsigned int v83 = [v19 dispatchUID];
          unint64_t v84 = (unint64_t)[v19 dispatchUID];
          unsigned int v85 = [v19 objectShaderThreadgroupBoundsPresent];
          v147[0] = @"requestID";
          id v86 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v82));
          v148[0] = v86;
          v147[1] = @"functionIndex";
          v87 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v84 & 0xFFFFFFFF00000000LL | v83));
          v148[1] = v87;
          v147[2] = @"object";
          v88 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -1026LL));
          v147[3] = @"type";
          v148[2] = v88;
          v148[3] = &off_5A05F8;
          v89 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v148,  v147,  4LL));
          uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v89));

          id var0 = v118;
          id v14 = v129;
          if (v85)
          {
            if (v19)
            {
              [v19 objectShaderThreadgroupBeginBounds];
              [v19 objectShaderThreadgroupEndBounds];
            }

            else
            {
              id v138 = 0LL;
              uint64_t v139 = 0LL;
              uint64_t v140 = 0LL;
              memset(v137, 0, sizeof(v137));
            }

            int v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data", clientContext));
            [v103 appendBytes:&v138 length:12];
            [v103 appendBytes:v137 length:12];
            id v104 = [v103 copy];
            [v52 setObject:v104 forKeyedSubscript:@"objectThreadgroupRange"];
          }

          objc_msgSend(v128, "addObject:", v52, clientContext);
          id v37 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v82));
          uint64_t v53 = v127;
          id v54 = v52;
          id v55 = v37;
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:](v53, "setObject:forKeyedSubscript:", v54, v55);

        goto LABEL_49;
      }

      id v19 = v16;
      id v20 = [v19 requestID];
      v137[0] = [v19 streamRef];
      unsigned int v21 = [v19 dispatchUID];
      unint64_t v22 = (unint64_t)[v19 dispatchUID];
      uint64_t v23 = GTMTLSMContext_getObject( *(void *)var0->var5,  (uint64_t)[v19 streamRef],  var0->var9.var0.var0 + v21);
      if (v23)
      {
        id v24 = v23;
        if (*(_DWORD *)v23 == 80)
        {
          id v25 = find_entry((uint64_t)var0->var1, v137, 8uLL, 0LL);
          if (*v25)
          {
            uint64_t v26 = *(void *)(*v25 + 32LL);
            if (v19) {
              goto LABEL_13;
            }
LABEL_31:
            id v138 = 0LL;
            uint64_t v139 = 0LL;
            uint64_t v140 = 0LL;
          }

          else
          {
            uint64_t v26 = 0LL;
            if (!v19) {
              goto LABEL_31;
            }
LABEL_13:
            objc_msgSend(v19, "size", clientContext);
          }

          v159[0] = @"requestID";
          id v125 = v20;
          int v124 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v20,  clientContext));
          v160[0] = v124;
          v159[1] = @"functionIndex";
          id v123 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v22 & 0xFFFFFFFF00000000LL | v21));
          v160[1] = v123;
          v159[2] = @"streamref";
          v122 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v137[0]));
          v160[2] = v122;
          v159[3] = @"object";
          v121 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)(v26 + 8)));
          v160[3] = v121;
          v160[4] = &off_5A0610;
          v159[4] = @"type";
          v159[5] = @"DependencyGraphRequestedTextureLevel";
          int v120 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v19 level]));
          v160[5] = v120;
          v159[6] = @"DependencyGraphRequestedTextureSlice";
          id v119 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v19 slice]));
          v160[6] = v119;
          v159[7] = @"DependencyGraphRequestedTextureDepthPlane";
          id v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v19 depth]));
          v160[7] = v67;
          v159[8] = @"DependencyGraphRequestedTextureAttachmentIndex";
          id v68 = [v19 plane];
          uint64_t v69 = (uint64_t)v68;
          uint64_t v70 = v24[13];
          if (v70) {
            v71 = (unsigned __int16 *)(v70 + 34);
          }
          else {
            v71 = (unsigned __int16 *)(v24 + 19);
          }
          int v72 = *v71;
          if (v72 == 260 || v72 == 255)
          {
            if ((_DWORD)v68) {
              uint64_t v69 = 9LL;
            }
            else {
              uint64_t v69 = 8LL;
            }
          }

          v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v69));
          v160[8] = v73;
          v159[9] = @"resolveMultisampleTexture";
          id v74 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v19 resolveMultisampleTexture]));
          v160[9] = v74;
          v159[10] = @"resolution";
          v157[0] = @"width";
          v75 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v138));
          v158[0] = v75;
          v157[1] = @"height";
          id v76 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v139));
          v157[2] = @"format";
          v158[1] = v76;
          v158[2] = &off_5A0628;
          v77 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v158,  v157,  3LL));
          v160[10] = v77;
          v78 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v160,  v159,  11LL));

          [v128 addObject:v78];
          v79 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v125));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v127, "setObject:forKeyedSubscript:", v78, v79);

          goto LABEL_47;
        }
      }

- (void)display:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  clientContext = self->_clientContext;
  if (clientContext->var9 && (dword_5B9DE4 & 0x20) == 0 && clientContext->var1)
  {
    id var0 = clientContext->var7.var0;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = __30__GTMTLReplayService_display___block_invoke;
    v8[3] = &unk_58F270;
    uint64_t v10 = clientContext;
    id v9 = v4;
    [var0 addOperationWithBlock:v8];
  }
}

- (id)update:(id)a3
{
  id v5 = a3;
  val = self;
  clientContext = self->_clientContext;
  p_id var0 = (void **)&clientContext->var1->var0;
  if (p_var0) {
    v92 = *p_var0;
  }
  else {
    v92 = 0LL;
  }
  uint64_t v90 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v4);
  id v93 = -[GTReplayerOperationBatch initWithRequestID:]( [GTReplayerOperationBatch alloc],  "initWithRequestID:",  [v5 requestID]);
  id v94 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v7);
  id v8 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 requests]);
  uint64_t v10 = -[NSMutableArray initWithCapacity:](v8, "initWithCapacity:", [v9 count]);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 requests]);
  id v12 = [v11 count];

  if (v12)
  {
    unint64_t v14 = 0LL;
    do
    {
      id v15 = (void *)objc_opt_new(&OBJC_CLASS___GTReplayResponse, v13);
      -[NSMutableArray setObject:atIndexedSubscript:](v10, "setObject:atIndexedSubscript:", v15, v14);

      v16 = (void *)objc_claimAutoreleasedReturnValue([v5 requests]);
      ++v14;
      id v17 = [v16 count];
    }

    while ((unint64_t)v17 > v14);
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v5 requests]);
  id v19 = [v18 count];

  if (v19)
  {
    uint64_t v20 = 0LL;
    while (1)
    {
      unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v5 requests]);
      unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectAtIndexedSubscript:v20]);

      uint64_t v24 = objc_opt_class(&OBJC_CLASS___GTReplayUpdateAccelerationStructureSession, v23);
      if ((objc_opt_isKindOfClass(v22, v24) & 1) == 0)
      {
        uint64_t v38 = objc_opt_class(&OBJC_CLASS___GTReplayUpdateLibraryCache, v25);
        if ((objc_opt_isKindOfClass(v22, v38) & 1) != 0)
        {
          id v40 = v22;
          uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v40 data]);
          uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v40 uuid]);
          [v94 setObject:v41 forKeyedSubscript:v42];

          if ([v94 count] == (char *)&dword_0 + 1)
          {
            uint64_t v43 = objc_alloc(&OBJC_CLASS___GTReplayerOperation);
            v111[0] = _NSConcreteStackBlock;
            v111[1] = 3221225472LL;
            v111[2] = __29__GTMTLReplayService_update___block_invoke;
            v111[3] = &unk_58DC38;
            int v115 = v92;
            id v112 = v94;
            v116 = clientContext;
            id v113 = v40;
            id v114 = v10;
            int v117 = v20;
            id v44 = -[GTReplayerOperation initWithBatch:withBlock:](v43, "initWithBatch:withBlock:", v93, v111);
            -[GTReplayerOperationBatch addOperation:](v93, "addOperation:", v44);
          }
        }

        else
        {
          uint64_t v45 = objc_opt_class(&OBJC_CLASS___GTReplayUpdateLibrary, v39);
          if ((objc_opt_isKindOfClass(v22, v45) & 1) != 0)
          {
            if (v92)
            {
              objc_initWeak(&location, val);
              uint64_t v47 = objc_alloc(&OBJC_CLASS___GTReplayerOperation);
              v105[0] = _NSConcreteStackBlock;
              v105[1] = 3221225472LL;
              v105[2] = __29__GTMTLReplayService_update___block_invoke_2;
              v105[3] = &unk_58DC60;
              objc_copyWeak(v108, &location);
              id v106 = v22;
              v108[1] = v92;
              v108[2] = clientContext;
              id v107 = v10;
              int v109 = v20;
              uint64_t v48 = -[GTReplayerOperation initWithBatch:withBlock:](v47, "initWithBatch:withBlock:", v93, v105);
              -[GTReplayerOperationBatch addOperation:](v93, "addOperation:", v48);

              objc_destroyWeak(v108);
              objc_destroyWeak(&location);
            }

            else
            {
              id v76 = (void *)objc_opt_new(&OBJC_CLASS___GTReplayResponse, v46);
              objc_msgSend(v76, "setRequestID:", objc_msgSend(v22, "requestID"));
              v77 = objc_alloc(&OBJC_CLASS___NSError);
              NSErrorUserInfoKey v121 = NSLocalizedDescriptionKey;
              v122 = @"Update request happened before replayer data source is loaded";
              v78 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v122,  &v121,  1LL));
              v79 = -[NSError initWithDomain:code:userInfo:]( v77,  "initWithDomain:code:userInfo:",  @"com.apple.gputools.MTLReplayer",  104LL,  v78);
              [v76 setError:v79];

              -[NSMutableArray setObject:atIndexedSubscript:](v10, "setObject:atIndexedSubscript:", v76, v20);
            }
          }

          else
          {
            uint64_t v52 = objc_opt_class(&OBJC_CLASS___GTReplayUpdateConfiguration, v46);
            if ((objc_opt_isKindOfClass(v22, v52) & 1) != 0)
            {
              id v54 = v22;
              id v55 = (void *)objc_claimAutoreleasedReturnValue([v54 configuration]);
              [v54 requestID];
              BOOL v56 = val->_gputrace != 0LL;
              uint64_t v57 = objc_alloc(&OBJC_CLASS___GTReplayerOperation);
              v99[0] = _NSConcreteStackBlock;
              v99[1] = 3221225472LL;
              v99[2] = __29__GTMTLReplayService_update___block_invoke_3;
              v99[3] = &unk_58DC88;
              BOOL v104 = v56;
              id v100 = v55;
              id v101 = v54;
              id v102 = v10;
              int v103 = v20;
              id v58 = v54;
              id v59 = v55;
              unsigned int v60 = -[GTReplayerOperation initWithBatch:withBlock:](v57, "initWithBatch:withBlock:", v93, v99);
              -[GTReplayerOperationBatch addOperation:](v93, "addOperation:", v60);
            }

            else
            {
              uint64_t v65 = objc_opt_class(&OBJC_CLASS___GTReplayUpdateTermination, v53);
              if ((objc_opt_isKindOfClass(v22, v65) & 1) != 0)
              {
                id v67 = v22;
                BOOL v68 = val->_terminateConnection == 0LL;
                uint64_t v69 = objc_claimAutoreleasedReturnValue([v67 connection]);
                terminateConnection = val->_terminateConnection;
                val->_terminateConnection = (OS_xpc_object *)v69;

                if (v68)
                {
                  uint64_t v84 = objc_claimAutoreleasedReturnValue([v67 path]);
                  terminatePath = val->_terminatePath;
                  val->_terminatePath = (OS_xpc_object *)v84;
                }

                else
                {
                  v71 = val->_terminatePath;
                  terminatePath = (OS_xpc_object *)objc_claimAutoreleasedReturnValue([v67 path]);
                  uint64_t v73 = MessagePathMerge(v71, terminatePath);
                  uint64_t v74 = objc_claimAutoreleasedReturnValue(v73);
                  v75 = val->_terminatePath;
                  val->_terminatePath = (OS_xpc_object *)v74;
                }
              }

              else
              {
                uint64_t v80 = (void *)objc_opt_new(&OBJC_CLASS___GTReplayResponse, v66);
                objc_msgSend(v80, "setRequestID:", objc_msgSend(v22, "requestID"));
                uint64_t v81 = objc_alloc(&OBJC_CLASS___NSError);
                NSErrorUserInfoKey v119 = NSLocalizedDescriptionKey;
                int v120 = @"unknown request";
                id v82 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v120,  &v119,  1LL));
                unsigned int v83 = -[NSError initWithDomain:code:userInfo:]( v81,  "initWithDomain:code:userInfo:",  NSCocoaErrorDomain,  1LL,  v82);
                [v80 setError:v83];

                -[NSMutableArray setObject:atIndexedSubscript:](v10, "setObject:atIndexedSubscript:", v80, v20);
              }
            }
          }
        }

        goto LABEL_25;
      }

      id v26 = v22;
      uint64_t v28 = (void *)objc_opt_new(&OBJC_CLASS___GTReplayResponse, v27);
      objc_msgSend(v28, "setRequestID:", objc_msgSend(v26, "requestID"));
      var1 = clientContext->var1;
      if (!var1) {
        break;
      }
      var6 = (dispatch_semaphore_s *)var1->var6;
      p_var6 = &var1->var6;
      dispatch_semaphore_wait(var6, 0xFFFFFFFFFFFFFFFFLL);
      id v32 = p_var6[1];
      unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v26 sessionsID]));
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKey:v33]);

      dispatch_semaphore_signal((dispatch_semaphore_t)*p_var6);
      if (!v34)
      {
        unint64_t v61 = objc_alloc(&OBJC_CLASS___NSError);
        NSErrorUserInfoKey v123 = NSLocalizedDescriptionKey;
        int v124 = @"ASV viewer session does not exist";
        unint64_t v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v124,  &v123,  1LL));
        uint64_t v51 = -[NSError initWithDomain:code:userInfo:]( v61,  "initWithDomain:code:userInfo:",  NSCocoaErrorDomain,  1LL,  v50);
        goto LABEL_24;
      }

      id v118 = 0LL;
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  &__kCFBooleanTrue,  1LL,  &v118));
      id v36 = v118;
      [v28 setData:v35];

      [v28 setError:v36];
      -[NSMutableArray setObject:atIndexedSubscript:](v10, "setObject:atIndexedSubscript:", v28, v20);
      id v37 = (void *)objc_claimAutoreleasedReturnValue([v26 data]);

      [v34 receiveData:v37];
LABEL_25:

      v63 = (void *)objc_claimAutoreleasedReturnValue([v5 requests]);
      id v64 = [v63 count];
    }

    unsigned int v49 = objc_alloc(&OBJC_CLASS___NSError);
    NSErrorUserInfoKey v125 = NSLocalizedDescriptionKey;
    id v126 = @"Update request happened before replayer data source is loaded";
    unint64_t v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v126,  &v125,  1LL));
    uint64_t v51 = -[NSError initWithDomain:code:userInfo:]( v49,  "initWithDomain:code:userInfo:",  @"com.apple.gputools.MTLReplayer",  104LL,  v50);
LABEL_24:
    uint64_t v62 = v51;
    [v28 setError:v51];

    -[NSMutableArray setObject:atIndexedSubscript:](v10, "setObject:atIndexedSubscript:", v28, v20);
    goto LABEL_25;
  }

- (id)decode:(id)a3
{
  id v5 = a3;
  var1 = self->_clientContext->var1;
  if (var1)
  {
    clientContext = self->_clientContext;
    id var0 = var1->var0;
    uint64_t v53 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v4);
    id v54 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v7);
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    uint64_t v51 = v5;
    id obj = (id)objc_claimAutoreleasedReturnValue([v5 requests]);
    id v8 = [obj countByEnumeratingWithState:&v61 objects:v71 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = &CATransform3DIdentity_ptr;
      uint64_t v11 = &CATransform3DIdentity_ptr;
      uint64_t v12 = *(void *)v62;
      uint64_t v13 = &CATransform3DIdentity_ptr;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v62 != v12) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v61 + 1) + 8LL * (void)i);
          id v16 = objc_alloc_init((Class)v10[275]);
          uint64_t v18 = objc_opt_class(v11[154], v17);
          if ((objc_opt_isKindOfClass(v15, v18) & 1) != 0)
          {
            id v20 = v15;
            id v60 = [v20 streamRef];
            unsigned int v21 = [v20 dispatchUID];
            unint64_t v22 = (unint64_t)[v20 dispatchUID];
            Object = GTMTLSMContext_getObject(*(void *)var0->var5, (uint64_t)v60, var0->var9.var0.var0 + v21);
            if (Object && *(_DWORD *)Object == 57)
            {
              uint64_t v24 = v21;
              find_entry((uint64_t)var0->var1, &v60, 8uLL, 0LL);
              v69[0] = @"requestID";
              uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v20 requestID]));
              v70[0] = v25;
              v69[1] = @"functionIndex";
              id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v22 & 0xFFFFFFFF00000000LL | v24));
              v70[1] = v26;
              v69[2] = @"streamref";
              uint64_t v13 = &CATransform3DIdentity_ptr;
              uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v60));
              v69[3] = @"type";
              v70[2] = v27;
              v70[3] = &off_5A0670;
              uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v70,  v69,  4LL));
              [v53 addObject:v28];

              uint64_t v11 = &CATransform3DIdentity_ptr;
              uint64_t v10 = &CATransform3DIdentity_ptr;
            }
          }

          else
          {
            uint64_t v29 = objc_opt_class(v13[153], v19);
            if ((objc_opt_isKindOfClass(v15, v29) & 1) != 0)
            {
              id v20 = v15;
              unsigned int v31 = [v20 dispatchUID];
              unint64_t v32 = (unint64_t)[v20 dispatchUID];
              unsigned __int16 v33 = (unsigned __int16)[v20 type] - 1;
              if (v33 <= 7u && ((0xC7u >> v33) & 1) != 0)
              {
                unint64_t v34 = v32 & 0xFFFFFFFF00000000LL;
                uint64_t v35 = qword_316DC8[v33];
                uint64_t v52 = v35 + [v20 index];
                v67[0] = @"requestID";
                id v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v20 requestID]));
                v68[0] = v36;
                v67[1] = @"functionIndex";
                id v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v34 | v31));
                v68[1] = v37;
                v67[2] = @"object";
                uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v52));
                v67[3] = @"type";
                v68[2] = v38;
                v68[3] = &off_5A05F8;
                uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v68,  v67,  4LL));
                uint64_t v13 = &CATransform3DIdentity_ptr;
                [v53 addObject:v39];

                uint64_t v10 = &CATransform3DIdentity_ptr;
                uint64_t v11 = &CATransform3DIdentity_ptr;
              }
            }

            else
            {
              id v20 = (id)objc_opt_new(&OBJC_CLASS___GTReplayResponse, v30);
              objc_msgSend(v20, "setRequestID:", objc_msgSend(v15, "requestID", clientContext));
              id v40 = objc_alloc(&OBJC_CLASS___NSError);
              NSErrorUserInfoKey v65 = NSLocalizedDescriptionKey;
              uint64_t v66 = @"unknown request";
              uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v66,  &v65,  1LL));
              uint64_t v42 = -[NSError initWithDomain:code:userInfo:]( v40,  "initWithDomain:code:userInfo:",  NSCocoaErrorDomain,  1LL,  v41);
              [v20 setError:v42];

              uint64_t v10 = &CATransform3DIdentity_ptr;
              uint64_t v11 = &CATransform3DIdentity_ptr;
              [v54 addObject:v20];
            }
          }
        }

        id v9 = [obj countByEnumeratingWithState:&v61 objects:v71 count:16];
      }

      while (v9);
    }

    id v5 = v51;
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472LL;
    v57[2] = __29__GTMTLReplayService_decode___block_invoke;
    v57[3] = &unk_58DCD8;
    id v58 = v54;
    id v59 = (id)objc_claimAutoreleasedReturnValue([v51 completionHandler]);
    id v43 = v59;
    id v44 = v54;
    FetchResourceObjectBatch((uint64_t)clientContext, v53, 0LL, v57);
  }

  else
  {
    uint64_t v45 = (void *)objc_opt_new(&OBJC_CLASS___GTReplayResponse, v4);
    objc_msgSend(v45, "setRequestID:", objc_msgSend(v5, "requestID"));
    uint64_t v46 = objc_alloc(&OBJC_CLASS___NSError);
    NSErrorUserInfoKey v72 = NSLocalizedDescriptionKey;
    uint64_t v73 = @"Decode request happened before replayer data source is loaded";
    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v73,  &v72,  1LL));
    uint64_t v48 = -[NSError initWithDomain:code:userInfo:]( v46,  "initWithDomain:code:userInfo:",  @"com.apple.gputools.MTLReplayer",  104LL,  v47);
    [v45 setError:v48];

    id v44 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue([v5 completionHandler]);
    uint64_t v53 = v45;
    v44[2](v44, v45);
  }

  return 0LL;
}

- (BOOL)cancel:(unint64_t)a3
{
  uint64_t Operation = GTCoreOperationControl_getOperation(a3);
  if (Operation) {
    *(_BYTE *)(Operation + 24) = 1;
  }
  return Operation != 0;
}

- (BOOL)pause:(unint64_t)a3
{
  uint64_t Operation = GTCoreOperationControl_getOperation(a3);
  if (Operation)
  {
    uint64_t v4 = *(void (**)(void))(Operation + 8);
    if (v4)
    {
      v4();
      LOBYTE(Operation) = 1;
    }

    else
    {
      LOBYTE(Operation) = 0;
    }
  }

  return Operation;
}

- (BOOL)resume:(unint64_t)a3
{
  uint64_t Operation = GTCoreOperationControl_getOperation(a3);
  if (Operation)
  {
    uint64_t v4 = *(void (**)(void))(Operation + 16);
    if (v4)
    {
      v4();
      LOBYTE(Operation) = 1;
    }

    else
    {
      LOBYTE(Operation) = 0;
    }
  }

  return Operation;
}

- (id)profile:(id)a3
{
  id v4 = a3;
  id v5 = [v4 requestID];
  id v6 = -[GTReplayerOperationBatch initWithRequestID:]( objc_alloc(&OBJC_CLASS___GTReplayerOperationBatch),  "initWithRequestID:",  v5);
  clientContext = self->_clientContext;
  BOOL v68 = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([clientContext->var1->var1 defaultDevice]);
  id v8 = DEVICEOBJECT(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  io_registry_entry_t v10 = [v9 acceleratorPort];

  v91[0] = 0x7FFFFFFF;
  uint64_t v85 = 0LL;
  id v86 = &v85;
  uint64_t v87 = 0x3032000000LL;
  v88 = __Block_byref_object_copy__562;
  v89 = __Block_byref_object_dispose__563;
  id MetalPluginName = GetMetalPluginName(v10, v91);
  id v90 = (id)objc_claimAutoreleasedReturnValue(MetalPluginName);
  IsAGXMetalPlugin((void *)v86[5], v12);
  uint64_t v65 = (uint64_t)v5;
  uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue([v4 streamHandler]);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSNumber, v13);
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSString, v15);
  uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSArray, v17);
  uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v19);
  uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSDictionary, v21);
  uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary, v23);
  uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSData, v25);
  uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSSet, v27);
  uint64_t v30 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v14,  v16,  v18,  v20,  v22,  v24,  v26,  v28,  objc_opt_class(&OBJC_CLASS___NSMutableSet, v29),  0LL);
  unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  unint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v4 profileData]);
  id v84 = 0LL;
  unsigned __int16 v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v31,  v32,  &v84));
  id v34 = v84;

  [v33 setObject:v86[5] forKeyedSubscript:@"MetalPluginName"];
  if (v91[0] != 0x7FFFFFFF)
  {
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:"));
    [v33 setObject:v35 forKeyedSubscript:@"gpuTarget"];
  }

  id v36 = (void *)objc_claimAutoreleasedReturnValue([clientContext->var1->var1 defaultDevice]);
  uint64_t v37 = GTDeviceCapabilities_fromDevice();

  char isAGX = GTDeviceCapabilities_isAGX(v37);
  uint64_t v40 = objc_opt_class(&OBJC_CLASS___GTReplayProfileTimeline, v39);
  if ((objc_opt_isKindOfClass(v4, v40) & 1) != 0)
  {
    uint64_t v42 = (GTReplayerOperation *)v4;
    if ((isAGX & 1) != 0)
    {
      if ((GTDeviceCapabilities_isAGX1(v37) & 1) != 0 || GTDeviceCapabilities_isAGX2(v37))
      {
        if ((-[GTReplayerOperation shaderProfiling](v42, "shaderProfiling") & 1) != 0
          || GTDeviceCapabilities_isAGX1(v37))
        {
          id v43 = objc_alloc(&OBJC_CLASS___GTReplayerOperation);
          v82[0] = _NSConcreteStackBlock;
          v82[1] = 3221225472LL;
          v82[2] = __30__GTMTLReplayService_profile___block_invoke_2;
          v82[3] = &unk_58DD00;
          v82[6] = clientContext;
          id v44 = v82;
          v82[4] = v33;
          v82[5] = v66;
          uint64_t v45 = -[GTReplayerOperation initWithBatch:withBlock:](v43, "initWithBatch:withBlock:", v68, v82);
LABEL_13:
          uint64_t v51 = v45;
          uint64_t v52 = (id *)(v44 + 4);
          uint64_t v53 = (id *)(v44 + 5);
LABEL_14:

LABEL_15:
          -[GTReplayerOperationBatch addOperation:](v68, "addOperation:", v51);

          goto LABEL_16;
        }

        __int128 v62 = objc_alloc(&OBJC_CLASS___GTReplayerOperation);
        v81[0] = _NSConcreteStackBlock;
        v81[1] = 3221225472LL;
        v81[2] = __30__GTMTLReplayService_profile___block_invoke_4;
        v81[3] = &unk_58DD28;
        v81[6] = v65;
        id v60 = v81;
        v81[5] = v66;
        v81[7] = clientContext;
        v81[4] = v33;
        __int128 v61 = -[GTReplayerOperation initWithBatch:withBlock:](v62, "initWithBatch:withBlock:", v68, v81);
      }

      else
      {
        if (!GTDeviceCapabilities_isAGX3(v37))
        {
          uint64_t v51 = 0LL;
          goto LABEL_15;
        }

        id v59 = objc_alloc(&OBJC_CLASS___GTReplayerOperation);
        v80[0] = _NSConcreteStackBlock;
        v80[1] = 3221225472LL;
        v80[2] = __30__GTMTLReplayService_profile___block_invoke_6;
        v80[3] = &unk_58DD50;
        v80[7] = v65;
        id v60 = v80;
        v80[5] = v66;
        v80[8] = clientContext;
        v80[4] = v33;
        v80[6] = &v85;
        __int128 v61 = -[GTReplayerOperation initWithBatch:withBlock:](v59, "initWithBatch:withBlock:", v68, v80);
      }

      uint64_t v51 = v61;
      uint64_t v52 = (id *)(v60 + 5);
      uint64_t v53 = (id *)(v60 + 4);
      goto LABEL_14;
    }

    unint64_t v50 = objc_alloc(&OBJC_CLASS___GTReplayerOperation);
    v83[0] = _NSConcreteStackBlock;
    v83[1] = 3221225472LL;
    v83[2] = __30__GTMTLReplayService_profile___block_invoke;
    v83[3] = &unk_58DD00;
    v83[6] = clientContext;
    id v44 = v83;
    v83[4] = v33;
    v83[5] = v66;
    uint64_t v45 = -[GTReplayerOperation initWithBatch:withBlock:](v50, "initWithBatch:withBlock:", v68, v83);
    goto LABEL_13;
  }

  uint64_t v46 = objc_opt_class(&OBJC_CLASS___GTReplayProfileDerivedCounters, v41);
  if ((objc_opt_isKindOfClass(v4, v46) & 1) != 0)
  {
    uint64_t v48 = objc_alloc(&OBJC_CLASS___GTReplayerOperation);
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472LL;
    v75[2] = __30__GTMTLReplayService_profile___block_invoke_8;
    v75[3] = &unk_58DD78;
    char v79 = isAGX;
    v78 = clientContext;
    id v76 = v33;
    id v77 = v66;
    unsigned int v49 = -[GTReplayerOperation initWithBatch:withBlock:](v48, "initWithBatch:withBlock:", v68, v75);
    -[GTReplayerOperationBatch addOperation:](v68, "addOperation:", v49);

    uint64_t v42 = v76;
  }

  else
  {
    uint64_t v55 = objc_opt_class(&OBJC_CLASS___GTReplayProfileBatchFilteredCounters, v47);
    if ((objc_opt_isKindOfClass(v4, v55) & 1) == 0) {
      goto LABEL_17;
    }
    if ([v4 priority])
    {
      BOOL v56 = objc_alloc(&OBJC_CLASS___GTReplayerOperation);
      v69[0] = _NSConcreteStackBlock;
      v69[1] = 3221225472LL;
      v69[2] = __30__GTMTLReplayService_profile___block_invoke_11;
      v69[3] = &unk_58DDC8;
      id v70 = v33;
      id v71 = v66;
      uint64_t v42 = -[GTReplayerOperation initWithBatch:withBlock:](v56, "initWithBatch:withBlock:", v68, v69);
      uint64_t v57 = &v70;
      id v58 = &v71;
    }

    else
    {
      __int128 v63 = objc_alloc(&OBJC_CLASS___GTReplayerOperation);
      v72[0] = _NSConcreteStackBlock;
      v72[1] = 3221225472LL;
      v72[2] = __30__GTMTLReplayService_profile___block_invoke_9;
      v72[3] = &unk_58DD00;
      v74[1] = clientContext;
      id v73 = v33;
      v74[0] = v66;
      uint64_t v42 = -[GTReplayerOperation initWithBatch:withBlock:](v63, "initWithBatch:withBlock:", v68, v72);
      uint64_t Operation = GTCoreOperationControl_getOperation(v65);
      uint64_t v57 = &v73;
      id v58 = (id *)v74;
      *(void *)(Operation + 8) = BatchFilteredPause;
      *(void *)(Operation + 16) = BatchFilteredResume;
    }

    -[GTReplayerOperationBatch addOperation:](v68, "addOperation:", v42);
  }

- (id)shaderdebug:(id)a3
{
  id v4 = a3;
  clientContext = self->_clientContext;
  id var0 = clientContext->var7.var0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = __34__GTMTLReplayService_shaderdebug___block_invoke;
  v9[3] = &unk_58F270;
  id v10 = v4;
  uint64_t v11 = clientContext;
  id v7 = v4;
  [var0 addOperationWithBlock:v9];

  return 0LL;
}

- (id)raytrace:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 streamHandler]);
  [v3 dispatchUID];
  [v3 streamRef];
  [v3 requestID];

  return 0LL;
}

- (void).cxx_destruct
{
}

void __34__GTMTLReplayService_shaderdebug___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___GTReplayShaderDebugKernel, a2);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v4);
  id v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    id v8 = v7;
    id v9 = v8;
    v175[0] = &off_5A0688;
    v174[0] = @"Type";
    v174[1] = @"MinPositionX";
    if (v8)
    {
      [v8 minThreadPositionInGrid];
      uint64_t v10 = v159;
    }

    else
    {
      uint64_t v10 = 0LL;
      uint64_t v160 = 0LL;
      uint64_t v159 = 0LL;
      uint64_t v161 = 0LL;
    }

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v10));
    v175[1] = v21;
    v174[2] = @"MinPositionY";
    if (v9)
    {
      [v9 minThreadPositionInGrid];
      uint64_t v23 = v157;
    }

    else
    {
      uint64_t v23 = 0LL;
      uint64_t v157 = 0LL;
      uint64_t v156 = 0LL;
      uint64_t v158 = 0LL;
    }

    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v23));
    v175[2] = v24;
    v174[3] = @"MinPositionZ";
    if (v9)
    {
      [v9 minThreadPositionInGrid];
      uint64_t v25 = v155;
    }

    else
    {
      uint64_t v25 = 0LL;
      uint64_t v154 = 0LL;
      uint64_t v153 = 0LL;
      uint64_t v155 = 0LL;
    }

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v25));
    v175[3] = v26;
    v174[4] = @"MaxPositionX";
    if (v9)
    {
      [v9 maxThreadPositionInGrid];
      uint64_t v27 = v150;
    }

    else
    {
      uint64_t v27 = 0LL;
      uint64_t v150 = 0LL;
      uint64_t v151 = 0LL;
      uint64_t v152 = 0LL;
    }

    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v27));
    v175[4] = v28;
    v174[5] = @"MaxPositionY";
    if (v9)
    {
      [v9 maxThreadPositionInGrid];
      uint64_t v29 = v148;
    }

    else
    {
      uint64_t v29 = 0LL;
      uint64_t v147 = 0LL;
      uint64_t v148 = 0LL;
      uint64_t v149 = 0LL;
    }

    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v29));
    v175[5] = v30;
    v174[6] = @"MaxPositionZ";
    if (v9)
    {
      [v9 maxThreadPositionInGrid];
      uint64_t v31 = v146;
    }

    else
    {
      uint64_t v31 = 0LL;
      uint64_t v144 = 0LL;
      uint64_t v145 = 0LL;
      uint64_t v146 = 0LL;
    }

    unint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v31));
    v175[6] = v32;
    unsigned __int16 v33 = v175;
    id v34 = v174;
LABEL_46:
    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v34,  7LL));
LABEL_47:

LABEL_48:
    goto LABEL_49;
  }

  uint64_t v11 = objc_opt_class(&OBJC_CLASS___GTReplayShaderDebugObject, v6);
  char v12 = objc_opt_isKindOfClass(v7, v11);
  uint64_t v14 = *(void **)(a1 + 32);
  if ((v12 & 1) != 0)
  {
    id v15 = v14;
    id v9 = v15;
    v173[0] = &off_5A06A0;
    v172[0] = @"Type";
    v172[1] = @"MinPositionX";
    if (v15)
    {
      [v15 minThreadPositionInGrid];
      uint64_t v16 = v141;
    }

    else
    {
      uint64_t v16 = 0LL;
      uint64_t v141 = 0LL;
      uint64_t v142 = 0LL;
      uint64_t v143 = 0LL;
    }

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v16));
    v173[1] = v21;
    v172[2] = @"MinPositionY";
    if (v9)
    {
      [v9 minThreadPositionInGrid];
      uint64_t v41 = v139;
    }

    else
    {
      uint64_t v41 = 0LL;
      uint64_t v138 = 0LL;
      uint64_t v139 = 0LL;
      uint64_t v140 = 0LL;
    }

    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v41));
    v173[2] = v24;
    v172[3] = @"MinPositionZ";
    if (v9)
    {
      [v9 minThreadPositionInGrid];
      uint64_t v42 = v137;
    }

    else
    {
      uint64_t v42 = 0LL;
      uint64_t v135 = 0LL;
      uint64_t v136 = 0LL;
      uint64_t v137 = 0LL;
    }

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v42));
    v173[3] = v26;
    v172[4] = @"MaxPositionX";
    if (v9)
    {
      [v9 maxThreadPositionInGrid];
      uint64_t v43 = v132;
    }

    else
    {
      uint64_t v43 = 0LL;
      uint64_t v132 = 0LL;
      uint64_t v133 = 0LL;
      uint64_t v134 = 0LL;
    }

    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v43));
    v173[4] = v28;
    v172[5] = @"MaxPositionY";
    if (v9)
    {
      [v9 maxThreadPositionInGrid];
      uint64_t v44 = v130;
    }

    else
    {
      uint64_t v44 = 0LL;
      uint64_t v129 = 0LL;
      uint64_t v130 = 0LL;
      uint64_t v131 = 0LL;
    }

    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v44));
    v173[5] = v30;
    v172[6] = @"MaxPositionZ";
    if (v9)
    {
      [v9 maxThreadPositionInGrid];
      uint64_t v45 = v128;
    }

    else
    {
      uint64_t v45 = 0LL;
      uint64_t v126 = 0LL;
      uint64_t v127 = 0LL;
      uint64_t v128 = 0LL;
    }

    unint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v45));
    v173[6] = v32;
    unsigned __int16 v33 = v173;
    id v34 = v172;
    goto LABEL_46;
  }

  uint64_t v17 = objc_opt_class(&OBJC_CLASS___GTReplayShaderDebugMesh, v13);
  char v18 = objc_opt_isKindOfClass(v14, v17);
  uint64_t v20 = *(void **)(a1 + 32);
  if ((v18 & 1) != 0)
  {
    id v9 = v20;
    v171[0] = &off_5A06B8;
    v170[0] = @"Type";
    v170[1] = @"AmplificationID";
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v9 amplificationID]));
    v171[1] = v21;
    v170[2] = @"MinPositionX";
    if (v9)
    {
      [v9 minThreadPositionInGrid];
      uint64_t v22 = v123;
    }

    else
    {
      uint64_t v22 = 0LL;
      uint64_t v123 = 0LL;
      uint64_t v124 = 0LL;
      uint64_t v125 = 0LL;
    }

    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v22));
    v171[2] = v24;
    v170[3] = @"MinPositionY";
    if (v9)
    {
      [v9 minThreadPositionInGrid];
      uint64_t v78 = v121;
    }

    else
    {
      uint64_t v78 = 0LL;
      uint64_t v120 = 0LL;
      uint64_t v121 = 0LL;
      uint64_t v122 = 0LL;
    }

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v78));
    v171[3] = v26;
    v170[4] = @"MinPositionZ";
    if (v9)
    {
      [v9 minThreadPositionInGrid];
      uint64_t v79 = v119;
    }

    else
    {
      uint64_t v79 = 0LL;
      uint64_t v117 = 0LL;
      uint64_t v118 = 0LL;
      uint64_t v119 = 0LL;
    }

    v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v79));
    v171[4] = v97;
    v170[5] = @"MaxPositionX";
    if (v9)
    {
      [v9 maxThreadPositionInGrid];
      uint64_t v80 = v114;
    }

    else
    {
      uint64_t v80 = 0LL;
      uint64_t v114 = 0LL;
      uint64_t v115 = 0LL;
      uint64_t v116 = 0LL;
    }

    uint64_t v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v80));
    v171[5] = v96;
    v170[6] = @"MaxPositionY";
    if (v9)
    {
      [v9 maxThreadPositionInGrid];
      uint64_t v81 = v112;
    }

    else
    {
      uint64_t v81 = 0LL;
      uint64_t v111 = 0LL;
      uint64_t v112 = 0LL;
      uint64_t v113 = 0LL;
    }

    v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v81));
    v171[6] = v95;
    v170[7] = @"MaxPositionZ";
    if (v9)
    {
      [v9 maxThreadPositionInGrid];
      uint64_t v82 = v110;
    }

    else
    {
      uint64_t v82 = 0LL;
      uint64_t v108 = 0LL;
      uint64_t v109 = 0LL;
      uint64_t v110 = 0LL;
    }

    unsigned int v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v82));
    v171[7] = v83;
    v170[8] = @"ObjectThreadgroupPosX";
    if (v9)
    {
      [v9 objectThreadgroupPositionInGrid];
      uint64_t v84 = v105;
    }

    else
    {
      uint64_t v84 = 0LL;
      uint64_t v105 = 0LL;
      uint64_t v106 = 0LL;
      uint64_t v107 = 0LL;
    }

    uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v84));
    v171[8] = v85;
    v170[9] = @"ObjectThreadgroupPosY";
    if (v9)
    {
      [v9 objectThreadgroupPositionInGrid];
      uint64_t v86 = v103;
    }

    else
    {
      uint64_t v86 = 0LL;
      uint64_t v102 = 0LL;
      uint64_t v103 = 0LL;
      uint64_t v104 = 0LL;
    }

    uint64_t v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v86));
    v171[9] = v87;
    v170[10] = @"ObjectThreadgroupPosZ";
    if (v9)
    {
      [v9 objectThreadgroupPositionInGrid];
      uint64_t v88 = v101;
    }

    else
    {
      uint64_t v88 = 0LL;
      v100[1] = 0LL;
      v100[2] = 0LL;
      uint64_t v101 = 0LL;
    }

    v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v88));
    v171[10] = v89;
    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v171,  v170,  11LL));

    goto LABEL_48;
  }

  uint64_t v35 = objc_opt_class(&OBJC_CLASS___GTReplayShaderDebugVertex, v19);
  char v36 = objc_opt_isKindOfClass(v20, v35);
  uint64_t v38 = *(void **)(a1 + 32);
  if ((v36 & 1) != 0)
  {
    v169[0] = &off_5A0610;
    v168[0] = @"Type";
    v168[1] = @"InstanceID";
    id v9 = v38;
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v9 instanceID]));
    v169[1] = v21;
    v168[2] = @"AmplificationID";
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v9 amplificationID]));
    v169[2] = v24;
    v168[3] = @"VertexIDs";
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v9 vertexIDs]);
    v169[3] = v26;
    uint64_t v39 = v169;
    uint64_t v40 = v168;
LABEL_58:
    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v39,  v40,  4LL));
    goto LABEL_48;
  }

  uint64_t v74 = objc_opt_class(&OBJC_CLASS___GTReplayShaderDebugPostTessellationVertex, v37);
  char v75 = objc_opt_isKindOfClass(v38, v74);
  id v77 = *(void **)(a1 + 32);
  if ((v75 & 1) != 0)
  {
    v167[0] = &off_5A06D0;
    v166[0] = @"Type";
    v166[1] = @"InstanceID";
    id v9 = v77;
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v9 instanceID]));
    v167[1] = v21;
    v166[2] = @"AmplificationID";
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v9 amplificationID]));
    v167[2] = v24;
    v166[3] = @"PatchIDs";
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v9 patchIDs]);
    v167[3] = v26;
    uint64_t v39 = v167;
    uint64_t v40 = v166;
    goto LABEL_58;
  }

  uint64_t v90 = objc_opt_class(&OBJC_CLASS___GTReplayShaderDebugFragment, v76);
  if ((objc_opt_isKindOfClass(v77, v90) & 1) != 0)
  {
    v91 = *(void **)(a1 + 32);
    v165[0] = &off_5A05F8;
    v164[0] = @"Type";
    v164[1] = @"MinPositionX";
    id v9 = v91;
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v9 minPixelPosition]));
    v165[1] = v21;
    v164[2] = @"MinPositionY";
    [v9 minPixelPosition];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v92));
    v165[2] = v24;
    v164[3] = @"MaxPositionX";
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v9 maxPixelPosition]));
    v165[3] = v26;
    v164[4] = @"MaxPositionY";
    [v9 maxPixelPosition];
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v93));
    v165[4] = v28;
    v164[5] = @"MinSampleID";
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v9 minSampleID]));
    v165[5] = v30;
    v164[6] = @"MaxSampleID";
    unint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v9 maxSampleID]));
    v165[6] = v32;
    v164[7] = @"RenderTargetArrayIndex";
    id v94 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v9 renderTargetArrayIndex]));
    v165[7] = v94;
    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v165,  v164,  8LL));

    goto LABEL_47;
  }

  uint64_t v46 = 0LL;
LABEL_49:
  id v47 = objc_alloc_init(&OBJC_CLASS___GTReplayResponse);
  objc_msgSend(v47, "setRequestID:", objc_msgSend(*(id *)(a1 + 32), "requestID"));
  if (v46)
  {
    uint64_t v49 = objc_opt_class(&OBJC_CLASS___NSNumber, v48);
    uint64_t v51 = objc_opt_class(&OBJC_CLASS___NSString, v50);
    uint64_t v53 = objc_opt_class(&OBJC_CLASS___NSArray, v52);
    uint64_t v55 = objc_opt_class(&OBJC_CLASS___NSDictionary, v54);
    uint64_t v57 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v49,  v51,  v53,  v55,  objc_opt_class(&OBJC_CLASS___NSData, v56),  0LL);
    id v58 = (NSError *)objc_claimAutoreleasedReturnValue(v57);
    id v59 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) programData]);
    v100[0] = 0LL;
    id v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v58,  v59,  v100));
    id v61 = v100[0];
    id v62 = [v60 mutableCopy];

    __int128 v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [*(id *)(a1 + 32) dispatchUID]));
    [v62 setObject:v63 forKeyedSubscript:@"FunctionIndex"];

    __int128 v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  (unint64_t)[*(id *)(a1 + 32) dispatchUID] >> 32));
    [v62 setObject:v64 forKeyedSubscript:@"SubCommandIndex"];

    [v62 setObject:v46 forKeyedSubscript:@"ROI"];
    uint64_t v65 = *(uint64_t **)(*(void *)(a1 + 40) + 8LL);
    id v66 = [v62 copy];
    id v99 = v61;
    id v67 = GTMTLShaderDebugger_generateTrace(v65, v66, &v99);
    BOOL v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
    id v69 = v99;

    if (v68)
    {
      id v98 = v69;
      id v70 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v68,  1LL,  &v98));
      id v71 = v98;

      [v47 setData:v70];
      id v69 = v71;
    }

    else
    {
      [v47 setData:0];
    }

    [v47 setError:v69];
  }

  else
  {
    [v47 setData:0];
    NSErrorUserInfoKey v72 = objc_alloc(&OBJC_CLASS___NSError);
    NSErrorUserInfoKey v162 = NSLocalizedDescriptionKey;
    v163 = @"Invalid request";
    id v69 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v163,  &v162,  1LL));
    id v58 = -[NSError initWithDomain:code:userInfo:]( v72,  "initWithDomain:code:userInfo:",  @"GTReplayerRequestDomain",  300LL,  v69);
    [v47 setError:v58];
  }

  id v73 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) completionHandler]);
  ((void (**)(void, id))v73)[2](v73, v47);
}

void __30__GTMTLReplayService_profile___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!*(_BYTE *)(a2 + 24))
  {
    ShaderInfo = GTMTLReplayClient_queryShaderInfo( *(void *)(*(void *)(a1 + 48) + 8LL),  (id *)(*(void *)(a1 + 48) + 256LL),  *(void **)(a1 + 32));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(ShaderInfo);
    id v5 = [v4 mutableCopy];
    [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:@"isLegacy"];
    id v7 = (void *)objc_opt_new(&OBJC_CLASS___GTReplayResponse, v6);
    id v8 = [v5 copy];
    id v11 = 0LL;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v8,  1LL,  &v11));
    id v10 = v11;
    [v7 setData:v9];

    [v7 setError:v10];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

void __30__GTMTLReplayService_profile___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (!*(_BYTE *)(a2 + 24))
  {
    [*(id *)(*(void *)(a1 + 48) + 256) waitUntilAllOperationsAreFinished];
    ShaderInfo = GTMTLReplayClient_embeddedQueryShaderInfo( *(GTMTLReplayController **)(*(void *)(a1 + 48) + 8LL),  (id *)(*(void *)(a1 + 48) + 256LL),  *(void **)(a1 + 32));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(ShaderInfo);
    uint64_t v6 = (void *)objc_opt_new(&OBJC_CLASS___GTReplayResponse, v5);
    id v19 = 0LL;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v4,  1LL,  &v19));
    id v8 = v19;
    [v6 setData:v7];

    [v6 setError:v8];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();

    dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"Streaming Shader Profiling Data"]);

    if (v10)
    {
      [*(id *)(*(void *)(a1 + 48) + 256) waitUntilAllOperationsAreFinished];
      uint64_t v11 = *(void *)(a1 + 48);
      uint64_t v12 = *(void *)(v11 + 8);
      uint64_t v13 = (id *)(v11 + 256);
      uint64_t v14 = *(void **)(a1 + 32);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = __30__GTMTLReplayService_profile___block_invoke_3;
      v16[3] = &unk_58DDA0;
      id v15 = v9;
      uint64_t v17 = v15;
      id v18 = *(id *)(a1 + 40);
      GTMTLReplayClient_streamShaderProfilingData(v12, v13, v14, v16);
      dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    }
  }

void __30__GTMTLReplayService_profile___block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (!*(_BYTE *)(a2 + 24))
  {
    uint64_t v3 = (void *)objc_opt_new(&OBJC_CLASS___GTReplayResponse, a2);
    [v3 setRequestID:*(void *)(a1 + 48)];
    id v15 = 0LL;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  &off_59FE80,  1LL,  &v15));
    id v5 = v15;
    [v3 setData:v4];

    [v3 setError:v5];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();

    dispatch_semaphore_t v6 = dispatch_semaphore_create(0LL);
    [*(id *)(*(void *)(a1 + 56) + 256) waitUntilAllOperationsAreFinished];
    uint64_t v7 = *(void *)(a1 + 56);
    uint64_t v8 = *(void *)(v7 + 8);
    dispatch_semaphore_t v9 = (id *)(v7 + 256);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = __30__GTMTLReplayService_profile___block_invoke_5;
    v12[3] = &unk_58DDA0;
    dispatch_semaphore_t v13 = v6;
    id v10 = *(void **)(a1 + 32);
    id v14 = *(id *)(a1 + 40);
    uint64_t v11 = v6;
    GTMTLReplayClient_collectGPUShaderTimelineData(v8, v9, v10, v12);
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  }

void __30__GTMTLReplayService_profile___block_invoke_6(uint64_t a1, uint64_t a2)
{
  if (!*(_BYTE *)(a2 + 24))
  {
    dispatch_queue_t v34 = dispatch_queue_create("gputools.apsreply", 0LL);
    uint64_t v4 = (void *)objc_opt_new(&OBJC_CLASS___GTReplayResponse, v3);
    [v4 setRequestID:*(void *)(a1 + 56)];
    id v47 = 0LL;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  &off_59FEA8,  1LL,  &v47));
    id v6 = v47;
    [v4 setData:v5];

    [v4 setError:v6];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();

    [*(id *)(*(void *)(a1 + 64) + 256) waitUntilAllOperationsAreFinished];
    id v10 = GTShaderProfilerStreamDataFromReplayDataSource(**(uint64_t ****)(*(void *)(a1 + 64) + 8LL), v7, v8, v9);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    dispatch_semaphore_t v12 = dispatch_semaphore_create(0LL);
    v45[0] = 0LL;
    v45[1] = v45;
    v45[2] = 0x2020000000LL;
    char v46 = 0;
    v43[0] = 0LL;
    v43[1] = v43;
    v43[2] = 0x2020000000LL;
    char v44 = 0;
    dispatch_semaphore_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"SupportsFileFormatV2"]);
    objc_msgSend(v11, "setSupportsFileFormatV2:", objc_msgSend(v13, "BOOLValue"));

    uint64_t v14 = *(void *)(a1 + 64);
    uint64_t v15 = *(void *)(v14 + 8);
    uint64_t v16 = (id *)(v14 + 256);
    uint64_t v17 = *(void **)(a1 + 32);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = __30__GTMTLReplayService_profile___block_invoke_7;
    v38[3] = &unk_58EF08;
    id v18 = v12;
    uint64_t v39 = v18;
    uint64_t v41 = v45;
    id v19 = v11;
    id v40 = v19;
    uint64_t v42 = v43;
    GTMTLReplayClient_collectAPSData(v15, v16, v17, v38);
    dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
    [v19 setMetalPluginName:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    id v37 = 0LL;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 encode:0 error:&v37]);
    id v21 = v37;
    if (v21)
    {
      id v23 = v21;
      uint64_t v24 = (void *)objc_opt_new(&OBJC_CLASS___GTReplayResponse, v22);
      [v24 setError:v23];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    }

    else
    {
      if ([v19 supportsFileFormatV2])
      {
        uint64_t v24 = (void *)objc_opt_new(&OBJC_CLASS___GTReplayResponse, v25);
        uint64_t v50 = @"Profiler Raw URL";
        uint64_t v51 = v20;
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v51,  &v50,  1LL));
        id v36 = 0LL;
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v26,  1LL,  &v36));
        id v23 = v36;
        [v24 setData:v27];

        [v24 setError:v23];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
      }

      else
      {
        uint64_t v24 = (void *)objc_opt_new(&OBJC_CLASS___GTReplayResponse, v25);
        uint64_t v28 = objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v20,  8LL,  0LL));
        uint64_t v26 = (void *)v28;
        if (v28)
        {
          uint64_t v48 = @"Profiler Raw";
          uint64_t v49 = v28;
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v49,  &v48,  1LL));
        }

        else
        {
          uint64_t v29 = &__NSDictionary0__struct;
        }

        id v35 = 0LL;
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v29,  1LL,  &v35));
        id v23 = v35;
        [v24 setData:v30];

        [v24 setError:v23];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
        uint64_t v31 = *(void *)(a1 + 40);
        unsigned __int16 v33 = (void *)objc_opt_new(&OBJC_CLASS___GTReplayResponse, v32);
        (*(void (**)(uint64_t, void *))(v31 + 16))(v31, v33);
      }
    }

    _Block_object_dispose(v43, 8);
    _Block_object_dispose(v45, 8);
  }

void __30__GTMTLReplayService_profile___block_invoke_8(uint64_t a1, uint64_t a2)
{
  if (!*(_BYTE *)(a2 + 24))
  {
    int v3 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = *(GTMTLReplayController **)(v4 + 8);
    id v6 = (id *)(v4 + 256);
    uint64_t v7 = *(void **)(a1 + 32);
    if (v3) {
      id v8 = GTMTLReplayClient_embeddedDerivedCounterData(v5, v6, v7);
    }
    else {
      id v8 = GTMTLReplayClient_derivedCounterData((id *)&v5->var0, v6, v7);
    }
    dispatch_semaphore_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    uint64_t v11 = (void *)objc_opt_new(&OBJC_CLASS___GTReplayResponse, v10);
    id v17 = 0LL;
    dispatch_semaphore_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v9,  1LL,  &v17));
    id v13 = v17;
    [v11 setData:v12];

    [v11 setError:v13];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v16 = (void *)objc_opt_new(&OBJC_CLASS___GTReplayResponse, v15);
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v16);
  }

void __30__GTMTLReplayService_profile___block_invoke_9(uint64_t a1, uint64_t a2)
{
  if (!*(_BYTE *)(a2 + 24))
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(v4 + 8);
    id v6 = (id *)(v4 + 256);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = __30__GTMTLReplayService_profile___block_invoke_10;
    v18[3] = &unk_58DDA0;
    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    dispatch_semaphore_t v19 = v3;
    id v20 = v8;
    dispatch_semaphore_t v9 = v3;
    BOOL v10 = GTMTLReplayClient_streamBatchFilteredData(v5, v6, v7, v18);
    id v21 = @"Batch Filtering Started";
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v10));
    uint64_t v22 = v11;
    dispatch_semaphore_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));

    uint64_t v14 = (void *)objc_opt_new(&OBJC_CLASS___GTReplayResponse, v13);
    id v17 = 0LL;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v12,  1LL,  &v17));
    id v16 = v17;
    [v14 setData:v15];

    [v14 setError:v16];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();

    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  }

void __30__GTMTLReplayService_profile___block_invoke_11(uint64_t a1, uint64_t a2)
{
  if (!*(_BYTE *)(a2 + 24))
  {
    GTMTLReplayClient_addBatchFilteringRequest(*(void **)(a1 + 32));
    uint64_t v3 = *(void *)(a1 + 40);
    id v5 = (id)objc_opt_new(&OBJC_CLASS___GTReplayResponse, v4);
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }

void __30__GTMTLReplayService_profile___block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = (void *)objc_opt_new(&OBJC_CLASS___GTReplayResponse, v4);
  id v6 = v5;
  if (v3)
  {
    id v9 = 0LL;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v3,  1LL,  &v9));
    id v8 = v9;
    [v6 setData:v7];
  }

  else
  {
    [v5 setData:0];
    id v8 = 0LL;
  }

  [v6 setError:v8];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  if (!v3) {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

void __30__GTMTLReplayService_profile___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v12 = v3;
  if (v3)
  {
    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)
      || (uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Streaming APS Counters"]),
          *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v4 != 0LL,
          v4,
          id v3 = v12,
          *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)))
    {
      if (*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL)) {
        goto LABEL_8;
      }
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Streaming APS Profiling"]);
      if (v5) {
        *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
      }

      id v3 = v12;
      if (*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL))
      {
LABEL_8:
        id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Remove APS Timeline"]);

        uint64_t v7 = *(void **)(a1 + 40);
        if (v6) {
          [v7 removeAPSTimelineData];
        }
        else {
          [v7 addAPSTimelineData:v12];
        }
      }

      else
      {
        BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"Remove APS Counters"]);

        uint64_t v11 = *(void **)(a1 + 40);
        if (v10) {
          [v11 removeAPSCounterData];
        }
        else {
          [v11 addAPSCounterData:v12];
        }
      }
    }

    else
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"Remove APS Data"]);

      id v9 = *(void **)(a1 + 40);
      if (v8) {
        [v9 removeAPSData];
      }
      else {
        [v9 addAPSData:v12];
      }
    }
  }

  else
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

void __30__GTMTLReplayService_profile___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = (void *)objc_opt_new(&OBJC_CLASS___GTReplayResponse, v4);
  if (v3)
  {
    id v8 = 0LL;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v3,  1LL,  &v8));
    id v7 = v8;
    [v5 setData:v6];

    [v5 setError:v7];
  }

  else
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    id v7 = 0LL;
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void __30__GTMTLReplayService_profile___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = (void *)objc_opt_new(&OBJC_CLASS___GTReplayResponse, v4);
  if (v3)
  {
    id v8 = 0LL;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v3,  1LL,  &v8));
    id v7 = v8;
    [v5 setData:v6];

    [v5 setError:v7];
  }

  else
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    id v7 = 0LL;
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void __29__GTMTLReplayService_decode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v59 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary, v5);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSData, v7);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString, v9);
  id v12 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v6,  v8,  v10,  objc_opt_class(&OBJC_CLASS___NSNumber, v11),  0LL);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v73 = 0LL;
  id v60 = v4;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v13,  v4,  &v73));
  id v15 = v73;

  uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSDictionary, v16);
  uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSArray, v18);
  uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSData, v20);
  id v23 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v17,  v19,  v21,  objc_opt_class(&OBJC_CLASS___NSString, v22),  0LL);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  uint64_t v57 = v14;
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"object"]);
  id v72 = v15;
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v24,  v25,  &v72));
  id v56 = v72;

  id v62 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"object"]);
  id v61 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"requestID"]);
  id v27 = objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"functionIndex"]);
  uint64_t v28 = (uint64_t *)[v27 bytes];
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"stream"]);
  id v30 = [v29 count];

  uint64_t v71 = 0LL;
  memory_object_size_t v31 = 1280LL * (void)v30;
  uint64_t v32 = (void *)GTCoreAlloc(v31);
  bzero(v32, v31);
  concat = &_dispatch_data_empty;
  dispatch_queue_t v34 = &_dispatch_data_empty;
  uint64_t v55 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  id v35 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"stream"]);
  id v36 = [v35 countByEnumeratingWithState:&v67 objects:v74 count:16];
  if (v36)
  {
    id v37 = v36;
    memory_object_size_t v52 = v31;
    id v53 = v27;
    uint64_t v54 = v26;
    uint64_t v38 = *(void *)v68;
    do
    {
      uint64_t v39 = 0LL;
      id v40 = concat;
      do
      {
        if (*(void *)v68 != v38) {
          objc_enumerationMutation(v35);
        }
        uint64_t v41 = *(void **)(*((void *)&v67 + 1) + 8LL * (void)v39);
        v65[0] = GTMTLTextureDescriptorDefaults;
        v65[1] = xmmword_317C18;
        v65[2] = xmmword_317C28;
        uint64_t v66 = 512LL;
        uint64_t v42 = *v28++;
        uint64_t v43 = NewResourceData(v41, v62, v61, 0LL, (uint64_t)v65, (uint64_t)v32, &v71, v42, v40);
        char v44 = (dispatch_data_s *)objc_claimAutoreleasedReturnValue(v43);
        concat = dispatch_data_create_concat(v40, v44);

        uint64_t v39 = (char *)v39 + 1;
        id v40 = concat;
      }

      while (v37 != v39);
      id v37 = [v35 countByEnumeratingWithState:&v67 objects:v74 count:16];
    }

    while (v37);
    size_t v45 = 80 * v71;
    id v27 = v53;
    uint64_t v26 = v54;
    memory_object_size_t v31 = v52;
  }

  else
  {
    size_t v45 = 0LL;
  }

  destructor[0] = _NSConcreteStackBlock;
  destructor[1] = 3221225472LL;
  destructor[2] = __29__GTMTLReplayService_decode___block_invoke_2;
  destructor[3] = &__block_descriptor_48_e5_v8__0l;
  destructor[4] = v32;
  destructor[5] = v31;
  dispatch_data_t v46 = dispatch_data_create(v32, v45, 0LL, destructor);
  -[NSMutableDictionary setObject:forKey:](v55, "setObject:forKey:", v46, @"info");
  -[NSMutableDictionary setObject:forKey:](v55, "setObject:forKey:", concat, @"data");
  id v47 = [*(id *)(a1 + 32) copy];
  -[NSMutableDictionary setObject:forKey:](v55, "setObject:forKey:", v47, @"unknown");

  uint64_t v49 = (void *)objc_opt_new(&OBJC_CLASS___GTReplayResponse, v48);
  id v63 = 0LL;
  uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v55,  1LL,  &v63));
  id v51 = v63;
  [v49 setData:v50];

  [v49 setError:v51];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t __29__GTMTLReplayService_decode___block_invoke_2(uint64_t a1)
{
  uint64_t result = vm_deallocate(mach_task_self_, *(void *)(a1 + 32), *(void *)(a1 + 40));
  *(void *)(a1 + 32) = 0LL;
  return result;
}

void __29__GTMTLReplayService_update___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)objc_opt_new(&OBJC_CLASS___GTReplayResponse, a2);
  id v4 = [*(id *)(a1 + 32) copy];
  id v8 = 0LL;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v4,  1LL,  &v8));
  id v6 = v8;
  [v3 setData:v5];

  [v3 setError:v6];
  uint64_t v7 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) completionHandler]);

  ((void (**)(void, void *))v7)[2](v7, v3);
}

void __29__GTMTLReplayService_update___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!*(_BYTE *)(a2 + 24))
  {
    id v3 = *(void **)(a1 + 32);
    if (*(void *)(a1 + 56))
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8LL);
      uint64_t v5 = *(void **)(v4 + 128);
      id v6 = *(void **)(v4 + 136);
      uint64_t v7 = GTTransportArchiveDirectory();
      id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      UpdateDebugFileCache(v3, v5, v6, v8);
    }

    else
    {
      uint64_t v10 = GTTransportArchiveDirectory();
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      id v12 = v3;
      id v13 = v11;
      if (v12)
      {
        uint64_t v14 = -[NSURL initFileURLWithPath:isDirectory:]( objc_alloc(&OBJC_CLASS___NSURL),  "initFileURLWithPath:isDirectory:",  v13,  1LL);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        id v27 = 0LL;
        [v15 createDirectoryAtURL:v14 withIntermediateDirectories:1 attributes:0 error:&v27];
        id v16 = v27;

        v25[0] = 0LL;
        v25[1] = v25;
        v25[2] = 0x2020000000LL;
        char v26 = 1;
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472LL;
        v22[2] = __StoreDebugFileCache_block_invoke;
        v22[3] = &unk_58DDF0;
        uint64_t v17 = v14;
        id v23 = v17;
        uint64_t v24 = v25;
        [v12 enumerateKeysAndObjectsUsingBlock:v22];

        _Block_object_dispose(v25, 8);
      }
    }

    uint64_t v18 = (void *)objc_opt_new(&OBJC_CLASS___GTReplayResponse, v9);
    objc_msgSend(v18, "setRequestID:", objc_msgSend(*(id *)(a1 + 40), "requestID"));
    id v21 = 0LL;
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  &__kCFBooleanTrue,  1LL,  &v21));
    id v20 = v21;
    [v18 setData:v19];

    [v18 setError:v20];
    [*(id *)(a1 + 48) setObject:v18 atIndexedSubscript:*(int *)(a1 + 72)];
  }

void __29__GTMTLReplayService_update___block_invoke_2(uint64_t a1, uint64_t a2)
{
  WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained || *(_BYTE *)(a2 + 24)) {
    goto LABEL_17;
  }
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v6 = *(id *)(a1 + 32);
  id v7 = [v6 streamRef];
  [v6 dispatchUID];
  [v6 dispatchUID];
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 shaderURL]);

  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 shaderURL]);
    unsigned int v10 = [v9 startAccessingSecurityScopedResource];

    if (v10)
    {
      uint64_t v11 = (apr_pool_t *)*WeakRetained[1];
      id v12 = (const void *)objc_claimAutoreleasedReturnValue([v6 shaderURL]);
      apr_pool_cleanup_register(v11, v12, (apr_status_t (__cdecl *)(void *))CleanupSandboxExtensionURL_615, v13);
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 shaderURL]);
    id v15 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8LL) + 128LL);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v7));
    [v15 setObject:v14 forKeyedSubscript:v16];

    id v37 = @"streamref";
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v6 streamRef]));
    uint64_t v38 = v17;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v38,  &v37,  1LL));

    id v20 = (void *)objc_claimAutoreleasedReturnValue([v6 shaderURL]);
    goto LABEL_13;
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue([v6 shaderIR]);

  if (v21)
  {
    v35[0] = @"streamref";
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v6 streamRef]));
    v35[1] = @"IR";
    v36[0] = v22;
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v6 shaderIR]);
    v36[1] = v23;
    uint64_t v24 = v36;
    uint64_t v25 = v35;
LABEL_11:
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v25,  2LL));

    goto LABEL_12;
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v6 shaderSource]);

  if (v18)
  {
    v33[0] = @"streamref";
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v6 streamRef]));
    v33[1] = @"source";
    v34[0] = v22;
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v6 shaderSource]);
    v34[1] = v23;
    uint64_t v24 = v34;
    uint64_t v25 = v33;
    goto LABEL_11;
  }

void __29__GTMTLReplayService_update___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (!*(_BYTE *)(a2 + 24))
  {
    if (*(_BYTE *)(a1 + 60))
    {
      [*(id *)(a1 + 32) setForceLoadUnusedResources:0];
      [*(id *)(a1 + 32) setEnableReplayFromOtherPlatforms:0];
      [*(id *)(a1 + 32) setEnableCapture:0];
      [*(id *)(a1 + 32) setEnableHUD:0];
    }

    unsigned int v3 = [*(id *)(a1 + 32) forceLoadActionClear];
    dword_5B9DE4 = dword_5B9DE4 & 0xFFFFFFFE | v3;
    else {
      int v4 = 0;
    }
    dword_5B9DE4 = dword_5B9DE4 & 0xFFFFFBFF | v4;
    else {
      int v5 = 0;
    }
    dword_5B9DE4 = dword_5B9DE4 & 0xFFFFFFFD | v5;
    else {
      int v6 = 0;
    }
    dword_5B9DE4 = dword_5B9DE4 & 0xFFFFFFEF | v6;
    else {
      int v7 = 32;
    }
    dword_5B9DE4 = dword_5B9DE4 & 0xFFFFFFDF | v7;
    else {
      int v8 = 0;
    }
    dword_5B9DE4 = dword_5B9DE4 & 0xFFFFDFFF | v8;
    else {
      int v9 = 0;
    }
    dword_5B9DE4 = dword_5B9DE4 & 0xFFF7FFFF | v9;
    else {
      int v10 = 0;
    }
    dword_5B9DE4 = dword_5B9DE4 & 0xFEFFFFFF | v10;
    else {
      int v12 = 0;
    }
    dword_5B9DE4 = dword_5B9DE4 & 0xFDFFFFFF | v12;
    id v13 = (void *)objc_opt_new(&OBJC_CLASS___GTReplayResponse, v11);
    objc_msgSend(v13, "setRequestID:", objc_msgSend(*(id *)(a1 + 40), "requestID"));
    id v16 = 0LL;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  &__kCFBooleanTrue,  1LL,  &v16));
    id v15 = v16;
    [v13 setData:v14];

    [v13 setError:v15];
    [*(id *)(a1 + 48) setObject:v13 atIndexedSubscript:*(int *)(a1 + 56)];
  }

void __30__GTMTLReplayService_display___block_invoke(uint64_t a1)
{
  uint64_t v2 = **(void **)(*(void *)(a1 + 40) + 8LL);
  id v3 = [*(id *)(a1 + 32) streamRef];
  unsigned int v4 = [*(id *)(a1 + 32) dispatchUID];
  unint64_t v5 = (unint64_t)[*(id *)(a1 + 32) dispatchUID] >> 32;
  uint64_t v6 = *(void *)(v2 + 80);
  unsigned __int8 v7 = [*(id *)(a1 + 32) filters];
  if ((v7 & 1) != 0)
  {
    *(void *)&v58[0] = 0x400FF00FFLL;
    BYTE8(v58[0]) = 0;
    BYTE9(v58[0]) = (v7 & 2) != 0;
    BYTE10(v58[0]) = (v7 & 4) != 0;
    BYTE11(v58[0]) = 0;
    GTMTLReplayClient_displayAttachment(*(void *)(a1 + 40), (uint64_t)v58, v4, v5);
  }

  else
  {
    unint64_t v8 = v6 + v4;
    uint64_t v54 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(v54 + 8);
    GTMTLReplayController_debugSubCommandStop(v9, v8, v5);
    uint64_t v10 = *(void *)(*(void *)v9 + 40LL);
    Object = GTMTLSMContext_getObject(*(void *)v10, (uint64_t)v3, v8);
    if (Object)
    {
      memory_object_size_t v52 = Object;
      v62[0] = &off_5A0598;
      v61[0] = @"type";
      v61[1] = @"object";
      int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v3));
      v62[1] = v12;
      v61[2] = @"DependencyGraphRequestedTextureLevel";
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", 0LL));
      v62[2] = v13;
      v61[3] = @"DependencyGraphRequestedTextureSlice";
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", 0LL));
      v62[3] = v14;
      v61[4] = @"DependencyGraphRequestedTextureAttachmentIndex";
      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", 0LL));
      v62[4] = v15;
      v61[5] = @"DependencyGraphRequestedTextureDepthPlane";
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", 0LL));
      v62[5] = v16;
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v62,  v61,  6LL));

      uint64_t v18 = *(void **)(v9 + 40);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v3));
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v19]);

      if (!v20) {
        id v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v9 + 8) textureForKey:v3]);
      }
      id v60 = v17;
      id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v60, 1LL));
      id v59 = v20;
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v59, 1LL));

      GTMTLReplayClient_waitForUntrackedWritesToComplete(v9, v22);
      id v53 = v21;
      TexturesForResize = GTMTLReplayClient_retrieveTexturesForResize((id *)v9, v21, v22, 1, 0LL);
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(TexturesForResize);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v9 + 8) defaultCommandQueue]);
      id v26 = InternalCommandBuffer(v25, @"DisplayTexture");
      id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

      id v28 = objc_alloc(&OBJC_CLASS___GTMTLTextureRenderEncoder);
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v9 + 8) defaultDevice]);
      id v30 = -[GTMTLTextureRenderEncoder initWithDevice:](v28, "initWithDevice:", v29);

      if (v52[24])
      {
        memory_object_size_t v31 = apr_array_make(*(apr_pool_t **)v54, 16, 8);
        GTMTLSMContext_getObjects(*(_DWORD **)(v10 + 240), v8, v31);
        if (v31->nelts >= 1)
        {
          uint64_t v32 = 0LL;
          do
          {
            unsigned __int16 v33 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(v9 + 8) layerForKey:*(void *)(*(void *)&v31->elts[8 * v32] + 40)]);
            [v33 drawableSize];
            double v35 = v34;
            double v37 = v36;
            if (v33) {
              [v33 transform];
            }
            else {
              memset(v58, 0, sizeof(v58));
            }
            -[GTMTLTextureRenderEncoder setTransform:](v30, "setTransform:", v58);
            [v33 bounds];
            double v39 = v38;
            double v41 = v40;
            double v43 = v42;
            double v45 = v44;
            [v33 contentsScale];
            -[GTMTLTextureRenderEncoder setBounds:contentsScale:]( v30,  "setBounds:contentsScale:",  v39,  v41,  v43,  v45,  v46);
            [v33 anchorPoint];
            -[GTMTLTextureRenderEncoder setAnchor:](v30, "setAnchor:");
            id v47 = (void *)objc_claimAutoreleasedReturnValue([v22 objectAtIndexedSubscript:v32]);
            uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v24 objectAtIndexedSubscript:v32]);
            EncodeAttachment(v54, v27, v30, v47, v48, 0LL, 0LL, (unint64_t)v35, (unint64_t)v37, 0);

            ++v32;
          }

          while (v32 < v31->nelts);
        }
      }

      else
      {
        -[GTMTLTextureRenderEncoder setBounds:contentsScale:]( v30,  "setBounds:contentsScale:",  0.0,  0.0,  (double)*(unint64_t *)(v9 + 22464),  (double)*(unint64_t *)(v9 + 22472),  1.0);
        uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v22 objectAtIndexedSubscript:0]);
        uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue([v24 objectAtIndexedSubscript:0]);
        EncodeAttachment(v54, v27, v30, v49, v50, 0LL, 0LL, *(void *)(v9 + 22464), *(void *)(v9 + 22472), 1u);
      }

      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472LL;
      v55[2] = __GTMTLReplayClient_displayTexture_block_invoke;
      v55[3] = &unk_58F760;
      id v56 = v30;
      uint64_t v57 = v54;
      id v51 = v30;
      [v27 addCompletedHandler:v55];
      GTMTLReplay_commitCommandBuffer(v27);
    }
  }

void __28__GTMTLReplayService_fetch___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v8 = v6;
  if (v5)
  {
    uint64_t v70 = a1;
    id v66 = v6;
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary, v7);
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSData, v10);
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString, v12);
    id v15 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v9,  v11,  v13,  objc_opt_class(&OBJC_CLASS___NSNumber, v14),  0LL);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    id v81 = 0LL;
    id v67 = v5;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v16,  v5,  &v81));
    id v18 = v81;

    uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSDictionary, v19);
    uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSArray, v21);
    uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSData, v23);
    uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSString, v25);
    id v28 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v20,  v22,  v24,  v26,  objc_opt_class(&OBJC_CLASS___NSNumber, v27),  0LL);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    uint64_t v65 = v17;
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"object"]);
    id v80 = v18;
    memory_object_size_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v29,  v30,  &v80));
    id v32 = v80;

    __int128 v69 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKeyedSubscript:@"object"]);
    __int128 v68 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKeyedSubscript:@"requestID"]);
    id v33 = objc_claimAutoreleasedReturnValue([v31 objectForKeyedSubscript:@"functionIndex"]);
    double v34 = (uint64_t *)[v33 bytes];
    double v35 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKeyedSubscript:@"stream"]);
    id v36 = [v35 count];

    uint64_t v79 = 0LL;
    uint64_t v37 = 1280LL * (void)v36;
    double v38 = (void *)GTCoreAlloc(1280LL * (void)v36);
    bzero(v38, 1280LL * (void)v36);
    concat = &_dispatch_data_empty;
    double v40 = &_dispatch_data_empty;
    __int128 v64 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v75 = 0u;
    __int128 v76 = 0u;
    __int128 v77 = 0u;
    __int128 v78 = 0u;
    double v41 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKeyedSubscript:@"stream"]);
    id v42 = [v41 countByEnumeratingWithState:&v75 objects:v82 count:16];
    if (v42)
    {
      id v43 = v42;
      uint64_t v61 = 1280LL * (void)v36;
      id v62 = v32;
      id v63 = v31;
      uint64_t v44 = *(void *)v76;
      do
      {
        double v45 = 0LL;
        double v46 = concat;
        do
        {
          if (*(void *)v76 != v44) {
            objc_enumerationMutation(v41);
          }
          id v47 = *(void **)(*((void *)&v75 + 1) + 8LL * (void)v45);
          v73[0] = GTMTLTextureDescriptorDefaults;
          v73[1] = xmmword_317C18;
          v73[2] = xmmword_317C28;
          uint64_t v74 = 512LL;
          uint64_t v48 = *v34++;
          uint64_t v49 = NewResourceData(v47, v69, v68, *(void **)(v70 + 40), (uint64_t)v73, (uint64_t)v38, &v79, v48, v46);
          uint64_t v50 = (dispatch_data_s *)objc_claimAutoreleasedReturnValue(v49);
          concat = dispatch_data_create_concat(v46, v50);

          double v45 = (char *)v45 + 1;
          double v46 = concat;
        }

        while (v43 != v45);
        id v43 = [v41 countByEnumeratingWithState:&v75 objects:v82 count:16];
      }

      while (v43);
      size_t v51 = 80 * v79;
      memory_object_size_t v31 = v63;
      uint64_t v37 = v61;
      memory_object_size_t v52 = v62;
    }

    else
    {
      size_t v51 = 0LL;
      memory_object_size_t v52 = v32;
    }

    destructor[0] = _NSConcreteStackBlock;
    destructor[1] = 3221225472LL;
    destructor[2] = __28__GTMTLReplayService_fetch___block_invoke_2;
    destructor[3] = &__block_descriptor_48_e5_v8__0l;
    destructor[4] = v38;
    destructor[5] = v37;
    dispatch_data_t v54 = dispatch_data_create(v38, v51, 0LL, destructor);
    -[NSMutableDictionary setObject:forKey:](v64, "setObject:forKey:", v54, @"info");
    -[NSMutableDictionary setObject:forKey:](v64, "setObject:forKey:", concat, @"data");
    id v55 = [*(id *)(v70 + 48) copy];
    -[NSMutableDictionary setObject:forKey:](v64, "setObject:forKey:", v55, @"unknown");

    uint64_t v57 = (void *)objc_opt_new(&OBJC_CLASS___GTReplayResponse, v56);
    objc_msgSend(v57, "setRequestID:", objc_msgSend(*(id *)(v70 + 32), "requestID"));
    id v58 = -[NSMutableDictionary copy](v64, "copy");
    id v71 = 0LL;
    id v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v58,  1LL,  &v71));
    id v60 = v71;
    [v57 setData:v59];

    [v57 setError:v60];
    (*(void (**)(void))(*(void *)(v70 + 56) + 16LL))();

    unint64_t v8 = v66;
    id v5 = v67;
  }

  else
  {
    id v53 = (void *)objc_opt_new(&OBJC_CLASS___GTReplayResponse, v7);
    objc_msgSend(v53, "setRequestID:", objc_msgSend(*(id *)(a1 + 32), "requestID"));
    [v53 setData:0];
    [v53 setError:v8];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }
}

uint64_t __28__GTMTLReplayService_fetch___block_invoke_2(uint64_t a1)
{
  uint64_t result = vm_deallocate(mach_task_self_, *(void *)(a1 + 32), *(void *)(a1 + 40));
  *(void *)(a1 + 32) = 0LL;
  return result;
}

void __28__GTMTLReplayService_query___block_invoke_5_80(uint64_t a1)
{
  id v3 = (void *)objc_opt_new(&OBJC_CLASS___GTReplayResponse, v2);
  id v4 = [*(id *)(a1 + 40) copy];
  id v8 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v4,  1LL,  &v8));
  id v6 = v8;
  [v3 setData:v5];

  [v3 setError:v6];
  [v3 setRequestID:*(void *)(a1 + 56)];
  uint64_t v7 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) completionHandler]);

  ((void (**)(void, void *))v7)[2](v7, v3);
}

void __28__GTMTLReplayService_query___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!*(_BYTE *)(a2 + 24))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
    if (v3)
    {
      uint64_t v4 = *(void *)(a1 + 48);
      uint64_t v13 = 0LL;
      id v5 = GTMTLReplayClient_queryRasterMap(v3, v4, &v13);
      id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      uint64_t v7 = v13;
    }

    else
    {
      id v8 = objc_alloc(&OBJC_CLASS___NSError);
      NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
      id v15 = @"Query request happened before replayer data source is loaded";
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
      uint64_t v7 = -[NSError initWithDomain:code:userInfo:]( v8,  "initWithDomain:code:userInfo:",  @"com.apple.gputools.MTLReplayer",  104LL,  v9);

      id v6 = 0LL;
    }

    id v10 = objc_alloc_init(&OBJC_CLASS___GTReplayResponse);
    [v10 setRequestID:*(void *)(a1 + 56)];
    if (v7)
    {
      [v10 setData:0];
    }

    else
    {
      id v12 = 0LL;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v6,  1LL,  &v12));
      uint64_t v7 = (NSError *)v12;
      [v10 setData:v11];
    }

    [v10 setError:v7];
    [*(id *)(a1 + 32) setObject:v10 atIndexedSubscript:*(int *)(a1 + 64)];
  }

void __28__GTMTLReplayService_query___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (!*(_BYTE *)(a2 + 24))
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___GTReplayResponse);
    [v3 setRequestID:*(void *)(a1 + 40)];
    uint64_t v4 = *(unsigned int **)(*(void *)(a1 + 48) + 8LL);
    if (v4)
    {
      unint64_t v5 = *(unsigned int *)(a1 + 56);
      unint64_t v6 = *(unsigned int *)(a1 + 60);
      id v18 = 0LL;
      int v7 = GTMTLReplayClient_generateFunctionResourceUsageInfoV2(v4, v5, v6, &v18);
      id v8 = v18;
      if (v7)
      {
        id v17 = 0LL;
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v8,  1LL,  &v17));
        id v10 = v17;
        [v3 setData:v9];

        [v3 setError:v10];
      }

      else
      {
        NSErrorUserInfoKey v14 = objc_alloc(&OBJC_CLASS___NSError);
        v21[0] = NSLocalizedDescriptionKey;
        v21[1] = NSLocalizedRecoverySuggestionErrorKey;
        v22[0] = @"resource usage error";
        v22[1] = @"query again?";
        id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  2LL));
        id v16 = -[NSError initWithDomain:code:userInfo:]( v14,  "initWithDomain:code:userInfo:",  NSCocoaErrorDomain,  1LL,  v15);
        [v3 setError:v16];

        id v10 = 0LL;
      }
    }

    else
    {
      uint64_t v11 = objc_alloc(&OBJC_CLASS___NSError);
      NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
      uint64_t v20 = @"Query request happened before replayer data source is loaded";
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
      uint64_t v13 = -[NSError initWithDomain:code:userInfo:]( v11,  "initWithDomain:code:userInfo:",  @"com.apple.gputools.MTLReplayer",  104LL,  v12);
      [v3 setError:v13];

      id v10 = 0LL;
      id v8 = 0LL;
    }

    [*(id *)(a1 + 32) setObject:v3 atIndexedSubscript:*(int *)(a1 + 64)];
  }

void __28__GTMTLReplayService_query___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (!*(_BYTE *)(a2 + 24))
  {
    uint64_t v3 = GTMTLDeviceCapabilitiesQuery();
    id v6 = objc_alloc_init(&OBJC_CLASS___GTReplayResponse);
    uint64_t v4 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  v3,  GTMTLDeviceCapabilitiesSize([v6 setRequestID:*(void *)(a1 + 40)]),  0);
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    [v6 setData:v5];

    [v6 setError:0];
    [*(id *)(a1 + 32) setObject:v6 atIndexedSubscript:*(int *)(a1 + 48)];
  }

void __28__GTMTLReplayService_query___block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (!*(_BYTE *)(a2 + 24))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
    if (v3)
    {
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v3 + 8) defaultDevice]);
      id Analysis = DYMTLReplayFrameProfiler_loadAnalysis(v4);
      id v6 = (void *)objc_claimAutoreleasedReturnValue(Analysis);

      id v8 = 0LL;
    }

    else
    {
      uint64_t v9 = objc_alloc(&OBJC_CLASS___NSError);
      NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
      id v15 = @"Query request happened before replayer data source is loaded";
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
      id v8 = -[NSError initWithDomain:code:userInfo:]( v9,  "initWithDomain:code:userInfo:",  @"com.apple.gputools.MTLReplayer",  104LL,  v10);

      id v6 = 0LL;
    }

    uint64_t v11 = (void *)objc_opt_new(&OBJC_CLASS___GTReplayResponse, v7);
    [v11 setRequestID:*(void *)(a1 + 48)];
    if (v8)
    {
      [v11 setData:0];
    }

    else
    {
      id v13 = 0LL;
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v6,  1LL,  &v13));
      id v8 = (NSError *)v13;
      [v11 setData:v12];
    }

    [v11 setError:v8];
    [*(id *)(a1 + 32) setObject:v11 atIndexedSubscript:*(int *)(a1 + 56)];
  }

void __28__GTMTLReplayService_query___block_invoke_5(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a2 + 24)) {
    return;
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  if (!v3)
  {
    NSErrorUserInfoKey v14 = objc_alloc(&OBJC_CLASS___NSError);
    NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
    uint64_t v24 = @"Query request happened before replayer data source is loaded";
    id v8 = (NSNumber *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
    id v15 = -[NSError initWithDomain:code:userInfo:]( v14,  "initWithDomain:code:userInfo:",  @"com.apple.gputools.MTLReplayer",  104LL,  v8);
    id v16 = 0LL;
LABEL_13:

    goto LABEL_14;
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v3 + 8) defaultDevice]);
  uint64_t v5 = GTDeviceCapabilities_fromDevice();

  if (GTDeviceCapabilities_isAGX(v5))
  {
    uint64_t v7 = ExpectedState(v3);
    id v8 = (NSNumber *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v22 = 0LL;
    char v21 = 0;
    id v20 = 0LL;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v3 + 8) defaultDevice]);
    GTAGXPerfStateControl::InitWithDevice((uint64_t)&v20, v9);

    id v10 = GTAGXPerfStateControl::ConsistentGPUPerfStateLevel((GTAGXPerfStateControl *)&v20, v8);
    uint64_t v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v10);
    if (GTDeviceCapabilities_isAGX3(v5))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v11));
      [v12 setObject:&off_5A0AF0 forKeyedSubscript:@"gen"];
      id v13 = (_UNKNOWN **)[v12 copy];
    }

    else
    {
      if (!GTDeviceCapabilities_isAGX2(v5))
      {
        id v16 = v11;
        goto LABEL_12;
      }

      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v11));
      [v12 setObject:&off_5A0B08 forKeyedSubscript:@"gen"];
      id v13 = (_UNKNOWN **)[v12 copy];
    }

    id v16 = v13;

LABEL_12:
    GTAGXPerfStateControl::~GTAGXPerfStateControl(&v20);
    id v15 = 0LL;
    goto LABEL_13;
  }

  id v15 = 0LL;
  id v16 = &off_5A02B8;
LABEL_14:
  id v17 = (void *)objc_opt_new(&OBJC_CLASS___GTReplayResponse, v6);
  [v17 setRequestID:*(void *)(a1 + 48)];
  if (v15)
  {
    [v17 setData:0];
  }

  else
  {
    id v19 = 0LL;
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v16,  1LL,  &v19));
    id v15 = (NSError *)v19;
    [v17 setData:v18];
  }

  [v17 setError:v15];
  [*(id *)(a1 + 32) setObject:v17 atIndexedSubscript:*(int *)(a1 + 56)];
}

void __28__GTMTLReplayService_query___block_invoke_61(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = 0LL;
  memset(buffer, 0, sizeof(buffer));
  uint64_t v25 = @"MTLBuffer-0xfffffffffffffabd-Fetch";
  uint64_t v5 = *(void *)(a1 + 56);
  id v6 = a3;
  id v7 = a2;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v5));
  uint64_t v26 = v8;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)(a1 + 56)));
  NSErrorUserInfoKey v23 = v10;
  uint64_t v24 = *(void *)(a1 + 32);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
  id v12 = NewResourceData(v7, v6, v9, v11, 0LL, (uint64_t)buffer, &v22, *(void *)(a1 + 64), &_dispatch_data_empty);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  dispatch_data_t v14 = dispatch_data_create(buffer, 0x50uLL, 0LL, &__block_literal_global_65);
  id v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v14, @"info");
  -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v13, @"data");
  id v16 = objc_alloc_init(&OBJC_CLASS___GTReplayResponse);
  [v16 setRequestID:*(void *)(a1 + 56)];
  id v17 = -[NSMutableDictionary copy](v15, "copy");
  id v20 = 0LL;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v17,  1LL,  &v20));
  id v19 = v20;
  [v16 setData:v18];

  [v16 setError:v19];
  [*(id *)(a1 + 40) setObject:v16 atIndexedSubscript:*(int *)(a1 + 72)];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __28__GTMTLReplayService_query___block_invoke_3_73(uint64_t a1, uint64_t a2)
{
  if (!*(_BYTE *)(a2 + 24))
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___GTReplayConfiguration);
    [v3 setForceLoadActionClear:dword_5B9DE4 & 1];
    [v3 setForceLoadUnusedResources:(dword_5B9DE4 >> 10) & 1];
    [v3 setForceWaitUntilCompleted:(dword_5B9DE4 >> 1) & 1];
    [v3 setDisableOptimizeRestores:(dword_5B9DE4 >> 4) & 1];
    [v3 setEnableDisplayOnDevice:(dword_5B9DE4 & 0x20) == 0];
    [v3 setDisableHeapTextureCompression:(dword_5B9DE4 >> 13) & 1];
    [v3 setEnableReplayFromOtherPlatforms:(dword_5B9DE4 >> 19) & 1];
    [v3 setEnableCapture:HIBYTE(dword_5B9DE4) & 1];
    [v3 setEnableHUD:(dword_5B9DE4 >> 25) & 1];
    uint64_t v5 = (void *)objc_opt_new(&OBJC_CLASS___GTReplayResponse, v4);
    [v5 setRequestID:*(void *)(a1 + 40)];
    id v8 = 0LL;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v3,  1LL,  &v8));
    id v7 = v8;
    [v5 setData:v6];

    [v5 setError:v7];
    [*(id *)(a1 + 32) setObject:v5 atIndexedSubscript:*(int *)(a1 + 48)];
  }

void __28__GTMTLReplayService_query___block_invoke_4_76(uint64_t a1, uint64_t a2)
{
  if (!*(_BYTE *)(a2 + 24))
  {
    id v3 = (void *)objc_opt_new(&OBJC_CLASS___GTReplaySessionInfo, a2);
    [v3 setGputraceURL:*(void *)(a1 + 32)];
    [v3 setShaderDebuggerVersion:3];
    [v3 setShaderProfilerVersion:4];
    [v3 setAccelerationViewerVersion:11];
    uint64_t v5 = (void *)objc_opt_new(&OBJC_CLASS___GTReplayResponse, v4);
    [v5 setRequestID:*(void *)(a1 + 48)];
    id v8 = 0LL;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v3,  1LL,  &v8));
    id v7 = v8;
    [v5 setData:v6];

    [v5 setError:v7];
    [*(id *)(a1 + 40) setObject:v5 atIndexedSubscript:*(int *)(a1 + 56)];
  }

id __34__GTMTLReplayService_notifyError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 notifyError:*(void *)(a1 + 32)];
}

void __38__GTMTLReplayService_terminateProcess__block_invoke(id a1)
{
}

void __33__GTMTLReplayService_load_error___block_invoke(void *a1)
{
  uint64_t v2 = (apr_pool_t **)a1[6];
  id v3 = (void *)a1[4];
  uint64_t v4 = GTTransportArchiveDirectory();
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v3;
  id v15 = v5;
  id v7 = &__block_literal_global_658;
  if (v6
    && (id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 scheme]),
        unsigned int v9 = [v8 isEqualToString:NSURLFileScheme],
        v8,
        v9))
  {
    if ([v6 startAccessingSecurityScopedResource])
    {
      id v10 = *v2;
      id v11 = v6;
      apr_pool_cleanup_register(v10, v11, (apr_status_t (__cdecl *)(void *))CleanupSandboxExtensionURL, v12);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
    BOOL v14 = BeginDebugArchivePath(v2, v13, v15, 0LL, &__block_literal_global_658);
  }

  else
  {
    BOOL v14 = 0;
  }

  *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = v14;
}

@end
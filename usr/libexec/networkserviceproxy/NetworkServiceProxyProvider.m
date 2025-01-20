@interface NetworkServiceProxyProvider
- (BOOL)handleNewFlow:(id)a3;
- (BOOL)hasNetworkPath;
- (NetworkServiceProxyProvider)init;
- (id)copyStateForClient:(id)a3 withPeerEndpoint:(id)a4 outWaldoInfo:(id *)a5;
- (id)waldoGetCurrentConfiguration;
- (id)waldoRequiresTFO:(id)a3;
- (void)handleAppMessage:(id)a3 completionHandler:(id)a4;
- (void)handleUsageReport:(id)a3 fromClient:(id)a4;
- (void)startProxyWithOptions:(id)a3 completionHandler:(id)a4;
- (void)stopProxyWithReason:(int64_t)a3 completionHandler:(id)a4;
- (void)waldo:(id)a3 didFinishProbingWithSuccess:(BOOL)a4;
- (void)waldo:(id)a3 didFinishSampleProbingWithSuccess:(BOOL)a4;
- (void)waldo:(id)a3 fetchDayPassForURL:(id)a4 ifExpired:(id)a5 session:(id)a6 dataHandler:(id)a7 completionHandler:(id)a8;
- (void)waldoDidSaveToKeychain:(id)a3;
- (void)waldoNeedsPolicyReset;
@end

@implementation NetworkServiceProxyProvider

- (NetworkServiceProxyProvider)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NetworkServiceProxyProvider;
  v2 = -[NetworkServiceProxyProvider init](&v12, "init");
  if (v2)
  {
    uint64_t default_evaluator = nw_path_create_default_evaluator();
    defaultEvaluator = v2->_defaultEvaluator;
    v2->_defaultEvaluator = (OS_nw_path_evaluator *)default_evaluator;

    uint64_t v5 = nw_context_create("com.apple.networksrviceproxy.flow-divert");
    nwContext = v2->_nwContext;
    v2->_nwContext = (OS_nw_context *)v5;

    v7 = v2->_nwContext;
    uint64_t v9 = NPGetInternalQueue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100008308;
    v13[3] = &unk_1000F9720;
    v13[4] = v2;
    nw_context_set_idle_handler(v7, v10, v13);

    nw_context_set_isolate_protocol_cache(v2->_nwContext, 1LL);
  }

  return v2;
}

- (void)startProxyWithOptions:(id)a3 completionHandler:(id)a4
{
  uint64_t v5 = (void (**)(id, void))a4;
  uint64_t v6 = NPGetInternalQueue();
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = nplog_obj();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ startProxyWithOptions", (uint8_t *)&v10, 0xCu);
  }

  v5[2](v5, 0LL);
}

- (void)stopProxyWithReason:(int64_t)a3 completionHandler:(id)a4
{
  id v5 = a4;
  uint64_t v6 = NPGetInternalQueue(v5);
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  dispatch_assert_queue_V2(v7);

  uint64_t v11 = nplog_obj(v8, v9, v10);
  objc_super v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412290;
    v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%@ stopProxyWithReason", (uint8_t *)&v15, 0xCu);
  }

  if (self) {
    objc_setProperty_atomic(self, v13, 0LL, 32LL);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPManager sharedManager](&OBJC_CLASS___NSPManager, "sharedManager"));
  [v14 stopWithCompletionHandler:v5];
}

- (void)handleAppMessage:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (uint64_t)a4;
  uint64_t v10 = (void (**)(void, void))v7;
  if (v6 && (uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSData), v7 = objc_opt_isKindOfClass(v6, v11), (v7 & 1) != 0))
  {
    uint64_t isKindOfClass = objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v6,  0LL,  0LL,  0LL));
    int v15 = (void *)isKindOfClass;
    if (isKindOfClass
      && (uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSDictionary),
          uint64_t isKindOfClass = objc_opt_isKindOfClass(v15, v16),
          (isKindOfClass & 1) != 0))
    {
      v37 = _NSConcreteStackBlock;
      uint64_t v38 = 3221225472LL;
      v39 = sub_100009230;
      v40 = &unk_1000F94F0;
      v41 = v10;
      v17 = objc_retainBlock(&v37);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", @"MessageType", v37, v38, v39, v40));
      if ([v18 integerValue] == (id)1)
      {
        v19 = v17;
        if (self)
        {
          id v20 = v15;
          uint64_t v21 = NPGetInternalQueue(v20);
          v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v21);
          dispatch_assert_queue_V2(v22);

          v23 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"Force"]);
          uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSNumber);
          if ((objc_opt_isKindOfClass(v23, v24) & 1) == 0)
          {

            v23 = 0LL;
          }

          [v23 BOOLValue];
          v42[0] = _NSConcreteStackBlock;
          v42[1] = 3221225472LL;
          v42[2] = sub_100008D28;
          v42[3] = &unk_1000F94C8;
          v43 = v19;
          v25 = v42;
          uint64_t v28 = nplog_obj(v25, v26, v27);
          v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Starting Tuscany refresh", buf, 2u);
          }

          v30 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
          objc_setProperty_atomic(self, v31, v30, 48LL);

          *(void *)buf = _NSConcreteStackBlock;
          uint64_t v45 = 3221225472LL;
          v46 = sub_100008DD4;
          v47 = &unk_1000F96A8;
          v32 = v25;
          v48 = self;
          id v49 = v32;
          sub_100008850((uint64_t)self, buf);
        }
      }

      else
      {
        ((void (*)(void ***, void))v17[2])(v17, 0LL);
      }
    }

    else
    {
      uint64_t v35 = nplog_obj(isKindOfClass, v13, v14);
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "Failed to convert a message to a dictionary",  buf,  2u);
      }

      if (v10) {
        v10[2](v10, 0LL);
      }
    }
  }

  else
  {
    uint64_t v33 = nplog_obj(v7, v8, v9);
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Received invalid message", buf, 2u);
    }

    if (v10) {
      v10[2](v10, 0LL);
    }
  }
}

- (BOOL)handleNewFlow:(id)a3
{
  id v4 = a3;
  kdebug_trace(732954636LL, 0LL, 0LL, 0LL, 0LL);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NEAppProxyTCPFlow);
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v4, v5);
  char v7 = isKindOfClass;
  if ((isKindOfClass & 1) != 0)
  {
    if (self)
    {
      uint64_t v8 = NPGetInternalQueue(isKindOfClass);
      uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100008570;
      block[3] = &unk_1000F9450;
      block[4] = self;
      dispatch_async(v9, block);
    }
  }

  return v7 & 1;
}

- (BOOL)hasNetworkPath
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NetworkServiceProxyProvider defaultPath](self, "defaultPath"));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NetworkServiceProxyProvider defaultPath](self, "defaultPath"));
    BOOL v5 = [v4 status] == (id)1;
  }

  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)waldoGetCurrentConfiguration
{
  uint64_t v2 = NPGetInternalQueue(self);
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v2);
  dispatch_assert_queue_V2(v3);

  id v4 = sub_10005725C();
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (v5) {
    BOOL v5 = (void *)v5[5];
  }
  char v7 = v5;

  return v7;
}

- (void)waldoNeedsPolicyReset
{
  uint64_t v2 = NPGetInternalQueue(self);
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v2);
  dispatch_assert_queue_V2(v3);

  id v4 = sub_10005725C();
}

- (void)waldo:(id)a3 fetchDayPassForURL:(id)a4 ifExpired:(id)a5 session:(id)a6 dataHandler:(id)a7 completionHandler:(id)a8
{
  id v23 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  v17 = (void *)objc_claimAutoreleasedReturnValue([v14 delegate]);
  if (v17)
  {
    id v18 = sub_10005725C();
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    id v20 = (void *)v19;
    if (v19) {
      uint64_t v21 = *(void **)(v19 + 40);
    }
    else {
      uint64_t v21 = 0LL;
    }
    id v22 = v21;
    objc_msgSend(v17, "setIgnoreInvalidCerts:", objc_msgSend(v22, "ignoreInvalidCerts"));
  }

  sub_100009488((uint64_t)self, v23, v13, v14, v15, v16);
}

- (void)waldoDidSaveToKeychain:(id)a3
{
  uint64_t v3 = NPGetInternalQueue(self);
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  dispatch_assert_queue_V2(v4);

  id v5 = sub_10005725C();
  id v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  sub_100066738((uint64_t)v6);
}

- (void)waldo:(id)a3 didFinishProbingWithSuccess:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = NPGetInternalQueue(v5);
  char v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  dispatch_assert_queue_V2(v7);

  uint64_t v11 = nplog_obj(v8, v9, v10);
  objc_super v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    int v14 = 138412546;
    id v15 = v13;
    __int16 v16 = 1024;
    BOOL v17 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%@: Probing finished with success: %d",  (uint8_t *)&v14,  0x12u);
  }
}

- (void)waldo:(id)a3 didFinishSampleProbingWithSuccess:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = NPGetInternalQueue(v5);
  char v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  dispatch_assert_queue_V2(v7);

  uint64_t v11 = nplog_obj(v8, v9, v10);
  objc_super v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    int v14 = 138412546;
    id v15 = v13;
    __int16 v16 = 1024;
    BOOL v17 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%@: One sample probing finished with success: %d",  (uint8_t *)&v14,  0x12u);
  }
}

- (id)waldoRequiresTFO:(id)a3
{
  id v3 = a3;
  uint64_t v4 = NPGetInternalQueue(v3);
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v4);
  dispatch_assert_queue_V2(v5);

  id v6 = sub_10005725C();
  uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = *(void **)(v7 + 40);
  }
  else {
    uint64_t v9 = 0LL;
  }
  id v10 = v9;

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v10 appRules]);
  id v11 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    id v12 = v11;
    id v22 = 0LL;
    uint64_t v13 = *(void *)v24;
    while (1)
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v10 getEdgeSetForAppRule:v15]);
        BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
        if ([v17 isEqualToString:v18])
        {
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v15 requireTFO]);

          if (!v19) {
            goto LABEL_13;
          }
          BOOL v17 = v22;
          id v22 = (id)objc_claimAutoreleasedReturnValue([v15 requireTFO]);
        }

        else
        {
        }

LABEL_13:
      }

      id v12 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (!v12) {
        goto LABEL_17;
      }
    }
  }

  id v22 = 0LL;
LABEL_17:

  return v22;
}

- (void)handleUsageReport:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = NPGetInternalQueue(v7);
  uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  dispatch_assert_queue_V2(v9);

  id v10 = sub_10005725C();
  uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
  id v12 = (void *)v11;
  if (v11) {
    uint64_t v13 = *(void **)(v11 + 40);
  }
  else {
    uint64_t v13 = 0LL;
  }
  id v14 = v13;

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 getEdgeSetForSigningIdentifier:v7]);
  id v18 = v15;
  if (v15)
  {
    if ([v15 source] != (id)2)
    {
      id v19 = [v18 hasEdges];
      if (!(_DWORD)v19
        || [v6 waldoTimestamp]
        && (unsigned int v22 = [v6 waldoTimestamp],
            __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v14 timestamp]),
            unsigned int v24 = [v23 unsignedIntValue],
            v23,
            v22 != v24))
      {
        uint64_t v25 = nplog_obj(v19, v20, v21);
        __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);
          unsigned int v28 = [v6 waldoTimestamp];
          v29 = (void *)objc_claimAutoreleasedReturnValue([v14 timestamp]);
          int v38 = 138412802;
          id v39 = v27;
          __int16 v40 = 1024;
          *(_DWORD *)v41 = v28;
          *(_WORD *)&v41[4] = 1024;
          *(_DWORD *)&v41[6] = [v29 unsignedIntValue];
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%@: Refreshing Waldo because there are no edges or because the timestamp reported by the client (%u) is not equal to the current timestamp (%u)",  (uint8_t *)&v38,  0x18u);
        }

        sub_100008850((uint64_t)self, 0LL);
      }
    }

    id v30 = [v18 hasEdges];
    if ((_DWORD)v30)
    {
      uint64_t v33 = nplog_obj(v30, v31, v32);
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);
        int v38 = 138412546;
        id v39 = v35;
        __int16 v40 = 2112;
        *(void *)v41 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "%@: Handling a usage report from %@",  (uint8_t *)&v38,  0x16u);
      }

      [v18 handleUsageReport:v6];
    }
  }

  else
  {
    uint64_t v36 = nplog_obj(0LL, v16, v17);
    v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = 138412290;
      id v39 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Failed to find an edge set for %@",  (uint8_t *)&v38,  0xCu);
    }
  }
}

- (id)copyStateForClient:(id)a3 withPeerEndpoint:(id)a4 outWaldoInfo:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = NPGetInternalQueue(v9);
  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v10);
  dispatch_assert_queue_V2(v11);

  id v12 = sub_10005725C();
  uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
  id v14 = (void *)v13;
  v118 = a5;
  if (v13) {
    id v15 = *(void **)(v13 + 40);
  }
  else {
    id v15 = 0LL;
  }
  id v16 = v15;

  uint64_t v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v122 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 getEdgeSetForSigningIdentifier:v9]);
  id v19 = v9;
  v120 = v16;
  v121 = v17;
  selfa = self;
  if (self)
  {
    id v20 = sub_10005725C();
    uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
    unsigned int v22 = (void *)v21;
    id v23 = v8;
    if (v21) {
      unsigned int v24 = *(void **)(v21 + 40);
    }
    else {
      unsigned int v24 = 0LL;
    }
    id v25 = v24;
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 appRules]);

    __int128 v125 = 0u;
    __int128 v126 = 0u;
    __int128 v123 = 0u;
    __int128 v124 = 0u;
    id v27 = v26;
    id v28 = [v27 countByEnumeratingWithState:&v123 objects:buf count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v124;
LABEL_8:
      uint64_t v31 = 0LL;
      while (1)
      {
        if (*(void *)v124 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v32 = *(void **)(*((void *)&v123 + 1) + 8 * v31);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v32 matchSigningIdentifier]);
        unsigned __int8 v34 = [v33 isEqualToString:v19];

        if ((v34 & 1) != 0) {
          break;
        }
        if (v29 == (id)++v31)
        {
          id v29 = [v27 countByEnumeratingWithState:&v123 objects:buf count:16];
          if (v29) {
            goto LABEL_8;
          }
          goto LABEL_14;
        }
      }

      id v38 = v32;

      if (!v38) {
        goto LABEL_22;
      }
      id v39 = (void *)objc_claimAutoreleasedReturnValue([v38 locationBundlePath]);

      id v8 = v23;
      if (v39)
      {
        uint64_t v40 = nplog_obj(v35, v36, v37);
        v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          v115 = (void *)objc_claimAutoreleasedReturnValue([v38 label]);
          v116 = (void *)objc_claimAutoreleasedReturnValue([v38 locationBundlePath]);
          *(_DWORD *)v127 = 138412546;
          *(void *)v128 = v115;
          *(_WORD *)&v128[8] = 2112;
          *(void *)&v128[10] = v116;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEBUG,  "Checking if location services are enabled for %@ using bundle %@",  v127,  0x16u);
        }

        v42 = (void *)objc_claimAutoreleasedReturnValue([v38 locationBundlePath]);
        unsigned int v43 = +[CLLocationManager authorizationStatusForBundlePath:]( &OBJC_CLASS___CLLocationManager,  "authorizationStatusForBundlePath:",  v42);

        uint64_t v47 = nplog_obj(v44, v45, v46);
        v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
        uint64_t v17 = v121;
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        {
          v117 = (void *)objc_claimAutoreleasedReturnValue([v38 locationBundlePath]);
          *(_DWORD *)v127 = 67109378;
          *(_DWORD *)v128 = v43;
          *(_WORD *)&v128[4] = 2112;
          *(void *)&v128[6] = v117;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEBUG,  "Got authorization status %d for bundle %@",  v127,  0x12u);
        }

        BOOL v49 = v43 - 3 < 2;
        goto LABEL_26;
      }
    }

    else
    {
LABEL_14:

      id v38 = 0LL;
LABEL_22:
      id v8 = v23;
    }

    uint64_t v50 = nplog_obj(v35, v36, v37);
    v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v127 = 138412290;
      *(void *)v128 = v19;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEBUG,  "App %@ does not have a location bundle path",  v127,  0xCu);
    }

    BOOL v49 = 0;
    uint64_t v17 = v121;
LABEL_26:
    v127[0] = v49;

    uint64_t v52 = v127[0];
  }

  else
  {
    uint64_t v52 = 0LL;
  }

  if (v18)
  {
    id v54 = [v18 copyStateIncludeDistance:v52];
    v55 = (void *)objc_claimAutoreleasedReturnValue([v18 edgeContainingOnRamp:v8]);
    if (v54) {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v54, @"edges");
    }
    id v56 = [v18 copyEdgeSelectionTelemetry];
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v56,  @"edgeSelection");

    v57 = (void *)objc_claimAutoreleasedReturnValue([v18 tag]);
    if (v57)
    {
      v61 = (void *)objc_claimAutoreleasedReturnValue([v18 tag]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v61, @"config");
    }

    uint64_t v62 = nplog_obj(v58, v59, v60);
    v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
    BOOL v64 = os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG);
    if (!(_DWORD)v52)
    {
      if (v64)
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEBUG,  "Not including location information in telemetry",  buf,  2u);
      }

      goto LABEL_46;
    }

    if (v64)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEBUG,  "Including location information in telemetry",  buf,  2u);
    }

    v65 = (void *)objc_claimAutoreleasedReturnValue([v18 locationManager]);
    v63 = (os_log_s *)[v65 copyCurrentGeohash];

    v66 = (void *)objc_claimAutoreleasedReturnValue([v18 locationManager]);
    id v67 = [v66 copyCurrentGeohashFromServer];

    v68 = (void *)objc_claimAutoreleasedReturnValue([v18 locationManager]);
    [v68 dislocation];
    double v70 = v69;

    if (!v63 || v67)
    {
      if (!v67)
      {
LABEL_43:
        if (v70 > 0.0)
        {
          v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v70));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v122,  "setObject:forKeyedSubscript:",  v74,  @"dislocation");
        }

LABEL_46:
        uint64_t v78 = nplog_obj(v75, v76, v77);
        v79 = (os_log_s *)objc_claimAutoreleasedReturnValue(v78);
        if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
        {
          v112 = (void *)objc_claimAutoreleasedReturnValue([v55 label]);
          *(_DWORD *)buf = 138412546;
          id v130 = v8;
          __int16 v131 = 2112;
          v132 = v112;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v79,  OS_LOG_TYPE_DEBUG,  "Mapped connection endpoint %@ to edge %@",  buf,  0x16u);
        }

        v80 = (void *)objc_claimAutoreleasedReturnValue([v55 label]);
        id v81 = [v80 length];

        if (v81)
        {
          v82 = (void *)objc_claimAutoreleasedReturnValue([v55 label]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v122, "setObject:forKeyedSubscript:", v82, @"peer");
        }

        v83 = (void *)objc_claimAutoreleasedReturnValue([v18 telemetryURL]);

        if (v83)
        {
          v84 = (void *)objc_claimAutoreleasedReturnValue([v18 telemetryURL]);
          v85 = (void *)objc_claimAutoreleasedReturnValue([v84 host]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v85, @"host");
        }

        id *v118 = v18;

        goto LABEL_53;
      }

      v71 = @"surfaced_at";
      v72 = v122;
      v73 = (os_log_s *)v67;
    }

    else
    {
      v71 = @"geohash";
      v72 = v122;
      v73 = v63;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](v72, "setObject:forKeyedSubscript:", v73, v71);
    goto LABEL_43;
  }

- (void).cxx_destruct
{
}

@end
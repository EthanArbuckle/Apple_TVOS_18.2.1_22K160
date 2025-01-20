@interface CDService
+ (CDService)serviceWithInfo:(id)a3;
+ (CDService)serviceWithInfo:(id)a3 endpoint:(id)a4;
+ (CDService)serviceWithInfo:(id)a3 extension:(id)a4;
- (BOOL)_inFlight;
- (BOOL)doNotQuery;
- (BOOL)doesPeriodic;
- (BOOL)doesPurge;
- (BOOL)inFlight;
- (BOOL)noQuota;
- (BOOL)rootOnly;
- (CDService)initWithInfo:(id)a3;
- (NSArray)volUUIDs;
- (NSDictionary)notificationOptions;
- (NSMutableArray)purgeQueue;
- (NSSet)desiredNotifications;
- (NSString)ID;
- (NSString)description;
- (OS_dispatch_queue)requestQueue;
- (OS_dispatch_queue)serviceQueue;
- (id)serviceInterruptionHandler;
- (id)serviceInvalidationHandler;
- (void)_serviceCallback:(id)a3 replyBlock:(id)a4;
- (void)_serviceCancelPurge:(id)a3;
- (void)_serviceNotify:(id)a3 replyBlock:(id)a4;
- (void)_servicePeriodic:(int)a3 info:(id)a4 replyBlock:(id)a5;
- (void)_servicePing:(id)a3;
- (void)_servicePurge:(int)a3 info:(id)a4 replyBlock:(id)a5;
- (void)_servicePurgeable:(int)a3 info:(id)a4 replyBlock:(id)a5;
- (void)drainPurgeQueue;
- (void)serviceCallback:(id)a3 replyBlock:(id)a4;
- (void)serviceCancelPurge:(id)a3;
- (void)serviceNotify:(id)a3 replyBlock:(id)a4;
- (void)servicePeriodic:(int)a3 info:(id)a4 replyBlock:(id)a5;
- (void)servicePing:(id)a3;
- (void)servicePurge:(int)a3 info:(id)a4 replyBlock:(id)a5;
- (void)servicePurgeable:(int)a3 info:(id)a4 replyBlock:(id)a5;
- (void)setDoNotQuery:(BOOL)a3;
- (void)setDoesPeriodic:(BOOL)a3;
- (void)setDoesPurge:(BOOL)a3;
- (void)setID:(id)a3;
- (void)setNoQuota:(BOOL)a3;
- (void)setNotificationOptions:(id)a3;
- (void)setPurgeQueue:(id)a3;
- (void)setRequestQueue:(id)a3;
- (void)setRootOnly:(BOOL)a3;
- (void)setServiceInterruptionHandler:(id)a3;
- (void)setServiceInvalidationHandler:(id)a3;
- (void)setServiceQueue:(id)a3;
- (void)set_inFlight:(BOOL)a3;
@end

@implementation CDService

- (CDService)initWithInfo:(id)a3
{
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)&OBJC_CLASS___CDService;
  v5 = -[CDService init](&v49, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"CACHE_DELETE_ID"]);
    if (v6)
    {
      v7 = v6;
      v8 = (void **)(v5 + 24);
      objc_storeStrong((id *)v5 + 3, v6);
      v9 = (char *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"CACHE_DELETE_SERVICES"]);
      uint64_t v10 = CDGetLogHandle("daemon");
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *v8;
        *(_DWORD *)buf = 138412546;
        id v51 = v12;
        __int16 v52 = 2112;
        v53 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ servicesProvided: %@", buf, 0x16u);
      }

      if (!v9)
      {
        *((_WORD *)v5 + 4) = 257;
        goto LABEL_11;
      }

      uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSArray);
      if ((objc_opt_isKindOfClass(v9, v13) & 1) != 0)
      {
        v5[8] = [v9 containsObject:@"PERIODIC"];
        v5[9] = [v9 containsObject:@"PURGE"];
LABEL_11:
        uint64_t v15 = CDGetLogHandle("daemon");
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = (void *)*((void *)v5 + 3);
          v18 = "YES";
          if (!v5[9]) {
            v18 = "NO";
          }
          *(_DWORD *)buf = 138412546;
          id v51 = v17;
          __int16 v52 = 2080;
          v53 = v18;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@ doesPurge: %s", buf, 0x16u);
        }

        uint64_t v19 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"CACHE_DELETE_VOLUMES"]);
        v20 = (void *)*((void *)v5 + 2);
        *((void *)v5 + 2) = v19;

        v21 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"CACHE_DELETE_OPT_OUT_QUOTA_EVENTS"]);
        v5[12] = evaluateBoolProperty(v21);

        if (v5[12])
        {
          uint64_t v22 = CDGetLogHandle("daemon");
          v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            v24 = *v8;
            *(_DWORD *)buf = 138412290;
            id v51 = v24;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%@ is OPT_OUT_QUOTA_EVENTS service",  buf,  0xCu);
          }
        }

        v25 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"CACHE_DELETE_DO_NOT_QUERY"]);
        BOOL v26 = (evaluateBoolProperty(v25) & 1) != 0 || v5[9] == 0;
        v5[10] = v26;

        if (v5[10])
        {
          uint64_t v27 = CDGetLogHandle("daemon");
          v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            v29 = *v8;
            *(_DWORD *)buf = 138412290;
            id v51 = v29;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%@ is DO_NOT_QUERY service", buf, 0xCu);
          }
        }

        v30 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"CACHE_DELETE_NOTIFICATIONS"]);
        if (v30)
        {
          uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSArray);
          if ((objc_opt_isKindOfClass(v30, v31) & 1) != 0)
          {
            uint64_t v32 = objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v30));
            v33 = (void *)*((void *)v5 + 6);
            *((void *)v5 + 6) = v32;

            uint64_t v34 = CDGetLogHandle("daemon");
            v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              v36 = (const char *)*((void *)v5 + 6);
              *(_DWORD *)buf = 138412546;
              id v51 = v7;
              __int16 v52 = 2112;
              v53 = v36;
              _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "%@ desiredNotifications: %@",  buf,  0x16u);
            }
          }
        }

        dispatch_queue_t v37 = dispatch_queue_create((const char *)[*((id *)v5 + 3) UTF8String], 0);
        v38 = (void *)*((void *)v5 + 4);
        *((void *)v5 + 4) = v37;

        id v39 = objc_claimAutoreleasedReturnValue([*((id *)v5 + 3) stringByAppendingString:@".request"]);
        dispatch_queue_t v40 = dispatch_queue_create_with_target_V2( (const char *)[v39 UTF8String],  0,  *((dispatch_queue_t *)v5 + 4));
        v41 = (void *)*((void *)v5 + 5);
        *((void *)v5 + 5) = v40;

        uint64_t v42 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        v43 = (void *)*((void *)v5 + 10);
        *((void *)v5 + 10) = v42;

        goto LABEL_32;
      }

      uint64_t v45 = CDGetLogHandle("daemon");
      v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        v48 = *v8;
        *(_DWORD *)buf = 138412546;
        id v51 = v48;
        __int16 v52 = 2112;
        v53 = v9;
        _os_log_error_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_ERROR,  "%@ : CACHE_DELETE_SERVICES value is not an array: %@",  buf,  0x16u);
      }
    }

    else
    {
      uint64_t v14 = CDGetLogHandle("daemon");
      v7 = (void *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v51 = v4;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_ERROR,  "No Service ID! info dictionary: %@",  buf,  0xCu);
      }
    }

    v44 = 0LL;
    goto LABEL_37;
  }

- (void)drainPurgeQueue
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CDService serviceQueue](self, "serviceQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CDService purgeQueue](self, "purgeQueue"));
  id v5 = [v4 count];

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CDService purgeQueue](self, "purgeQueue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndex:0]);

    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 info]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"CACHE_DELETE_QOS"]);
    uint64_t v10 = evaluateNumberProperty();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CDService purgeQueue](self, "purgeQueue"));
    [v12 removeObjectAtIndex:0];

    if (v11) {
      dispatch_qos_class_t v13 = [v11 unsignedIntValue];
    }
    else {
      dispatch_qos_class_t v13 = QOS_CLASS_UTILITY;
    }
    uint64_t v16 = CDGetLogHandle("daemon");
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CDService ID](self, "ID"));
      *(_DWORD *)buf = 138412546;
      id v28 = v18;
      __int16 v29 = 1024;
      LODWORD(v30) = v13;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "drainPurgeQueue %@ QOS: %u", buf, 0x12u);
    }

    v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472LL;
    v23 = __28__CDService_drainPurgeQueue__block_invoke;
    v24 = &unk_100058AA0;
    v25 = self;
    id v26 = v7;
    id v15 = v7;
    dispatch_block_t v19 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v13, 0, &v21);
    v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CDService requestQueue](self, "requestQueue", v21, v22, v23, v24, v25));
    dispatch_async(v20, v19);

    goto LABEL_10;
  }

  uint64_t v14 = CDGetLogHandle("daemon");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = (id)objc_claimAutoreleasedReturnValue(-[CDService ID](self, "ID"));
    *(_DWORD *)buf = 138412546;
    id v28 = v15;
    __int16 v29 = 2048;
    v30 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_LOG_TYPE_DEFAULT,  "dequeuePurge %@ [%p] no purges queued",  buf,  0x16u);
LABEL_10:
  }
}

void __28__CDService_drainPurgeQueue__block_invoke(uint64_t a1)
{
  uint64_t v2 = CDGetLogHandle("daemon");
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) ID]);
    unsigned int v5 = [*(id *)(a1 + 40) urgency];
    v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) info]);
    *(_DWORD *)buf = 138412802;
    uint64_t v16 = v4;
    __int16 v17 = 1024;
    unsigned int v18 = v5;
    __int16 v19 = 2112;
    v20 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "dequeuePurge executing deferred purge for service %@ at urgency %d : %@",  buf,  0x1Cu);
  }

  v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) urgency];
  v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) info]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = __28__CDService_drainPurgeQueue__block_invoke_52;
  v12[3] = &unk_1000589C8;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 32);
  id v13 = v10;
  uint64_t v14 = v11;
  [v7 _servicePurge:v8 info:v9 replyBlock:v12];
}

id __28__CDService_drainPurgeQueue__block_invoke_52(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  unsigned int v5 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v3 reply]);
  ((void (**)(void, id))v5)[2](v5, v4);

  return [*(id *)(a1 + 40) drainPurgeQueue];
}

- (void)servicePurgeable:(int)a3 info:(id)a4 replyBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CDService serviceQueue](self, "serviceQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __46__CDService_servicePurgeable_info_replyBlock___block_invoke;
  block[3] = &unk_100058BB0;
  block[4] = self;
  dispatch_sync(v10, block);

  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CDService requestQueue](self, "requestQueue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = __46__CDService_servicePurgeable_info_replyBlock___block_invoke_2;
  v14[3] = &unk_100059BB8;
  int v17 = a3;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v11, v14);
}

id __46__CDService_servicePurgeable_info_replyBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) drainPurgeQueue];
}

void __46__CDService_servicePurgeable_info_replyBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 56);
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __46__CDService_servicePurgeable_info_replyBlock___block_invoke_3;
  v6[3] = &unk_100059B90;
  id v5 = *(id *)(a1 + 48);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v3 _servicePurgeable:v2 info:v4 replyBlock:v6];
}

void __46__CDService_servicePurgeable_info_replyBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = CDGetLogHandle("daemon");
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) ID]);
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ servicePurgeable returned", buf, 0xCu);
  }

  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) serviceQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __46__CDService_servicePurgeable_info_replyBlock___block_invoke_55;
  block[3] = &unk_100058BB0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v5, block);
}

id __46__CDService_servicePurgeable_info_replyBlock___block_invoke_55(uint64_t a1)
{
  return [*(id *)(a1 + 32) drainPurgeQueue];
}

- (void)servicePurge:(int)a3 info:(id)a4 replyBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v8 && v9)
  {
    uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CDService serviceQueue](self, "serviceQueue"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = __42__CDService_servicePurge_info_replyBlock___block_invoke;
    v15[3] = &unk_100059BB8;
    v15[4] = self;
    int v18 = a3;
    id v16 = v8;
    id v17 = v10;
    dispatch_sync(v11, v15);
  }

  else
  {
    uint64_t v12 = CDGetLogHandle("daemon");
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = objc_retainBlock(v10);
      *(_DWORD *)buf = 138412546;
      id v20 = v8;
      __int16 v21 = 2112;
      id v22 = v14;
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Parameter error: info: %@, reply: %@",  buf,  0x16u);
    }
  }
}

void __42__CDService_servicePurge_info_replyBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = CDGetLogHandle("daemon");
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) ID]);
    int v5 = *(_DWORD *)(a1 + 56);
    v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138413058;
    v68 = v4;
    __int16 v69 = 2048;
    v70 = v6;
    __int16 v71 = 1024;
    *(_DWORD *)v72 = v5;
    *(_WORD *)&v72[4] = 2112;
    *(void *)&v72[6] = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%@ [%p] queuing purge at urgency %d, info: %@",  buf,  0x26u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"]);
  v57 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"]);
  id v9 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) purgeQueue]);
  id v62 = [v10 countByEnumeratingWithState:&v63 objects:v75 count:16];
  signed int v11 = 0;
  if (v62)
  {
    uint64_t v61 = *(void *)v64;
    char v59 = 1;
    v58 = v10;
    do
    {
      for (i = 0LL; i != v62; i = (char *)i + 1)
      {
        if (*(void *)v64 != v61) {
          objc_enumerationMutation(v10);
        }
        id v13 = *(void **)(*((void *)&v63 + 1) + 8LL * (void)i);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 info]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"]);

        id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 info]);
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"]);

        if (v15) {
          BOOL v18 = v8 == 0LL;
        }
        else {
          BOOL v18 = 1;
        }
        if (!v18 && [v8 isEqualToString:v15])
        {
          signed int v19 = [v13 urgency];
          signed int v11 = v19;
          signed int v20 = *(_DWORD *)(a1 + 56);
          if (v20 > v19
            || v20 == v19
            && (id v21 = [v57 unsignedLongLongValue], v21 > objc_msgSend(v17, "unsignedLongLongValue")))
          {
            uint64_t v22 = CDGetLogHandle("daemon");
            v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) ID]);
              signed int v60 = v11;
              v25 = v9;
              id v26 = v8;
              uint64_t v27 = *(void **)(a1 + 32);
              id v28 = [v17 unsignedLongLongValue];
              *(_DWORD *)buf = 138413058;
              v68 = v24;
              __int16 v69 = 2048;
              v70 = v27;
              id v8 = v26;
              id v9 = v25;
              signed int v11 = v60;
              __int16 v71 = 1024;
              *(_DWORD *)v72 = v60;
              *(_WORD *)&v72[4] = 2048;
              *(void *)&v72[6] = v28;
              _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%@ [%p] dropping purge of urgency %d, amount %llu",  buf,  0x26u);

              id v10 = v58;
            }

            -[NSMutableArray addObject:](v9, "addObject:", v13);
            __int16 v29 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v13 reply]);
            ((void (**)(void, void *))v29)[2](v29, &__NSDictionary0__struct);
          }

          else
          {
            char v59 = 0;
          }
        }
      }

      id v62 = [v10 countByEnumeratingWithState:&v63 objects:v75 count:16];
    }

    while (v62);
  }

  else
  {
    char v59 = 1;
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) purgeQueue]);
  [v30 removeObjectsInArray:v9];

  if ((v59 & 1) != 0)
  {
    uint64_t v31 = v9;
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) purgeQueue]);
    v33 = (char *)[v32 count];

    if (v33)
    {
      v33 = 0LL;
      do
      {
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) purgeQueue]);
        v35 = (void *)objc_claimAutoreleasedReturnValue([v34 objectAtIndexedSubscript:v33]);
        signed int v36 = [v35 urgency];
        signed int v37 = *(_DWORD *)(a1 + 56);

        if (v36 >= v37) {
          break;
        }
        ++v33;
        v38 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) purgeQueue]);
        id v39 = (char *)[v38 count];
      }

      while (v33 < v39);
    }

    uint64_t v40 = CDGetLogHandle("daemon");
    v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) ID]);
      v43 = *(void **)(a1 + 32);
      int v44 = *(_DWORD *)(a1 + 56);
      id v45 = [v57 unsignedLongLongValue];
      *(_DWORD *)buf = 138413314;
      v68 = v42;
      __int16 v69 = 2048;
      v70 = v43;
      __int16 v71 = 1024;
      *(_DWORD *)v72 = v44;
      *(_WORD *)&v72[4] = 2048;
      *(void *)&v72[6] = v45;
      __int16 v73 = 2048;
      v74 = v33;
      _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "%@ [%p] is enqueueing a purge of urgency %d amount %llu at index %lu",  buf,  0x30u);
    }

    v46 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) purgeQueue]);
    v47 = (void *)objc_claimAutoreleasedReturnValue( +[purgeOP purgeOpAtUrgency:info:reply:]( &OBJC_CLASS___purgeOP,  "purgeOpAtUrgency:info:reply:",  *(unsigned int *)(a1 + 56),  *(void *)(a1 + 40),  *(void *)(a1 + 48)));
    [v46 insertObject:v47 atIndex:v33];

    id v9 = v31;
    if (([*(id *)(a1 + 32) _inFlight] & 1) == 0)
    {
      uint64_t v48 = CDGetLogHandle("daemon");
      objc_super v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        v50 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) ID]);
        id v51 = *(void **)(a1 + 32);
        __int16 v52 = (void *)objc_claimAutoreleasedReturnValue([v51 purgeQueue]);
        *(_DWORD *)buf = 138412802;
        v68 = v50;
        __int16 v69 = 2048;
        v70 = v51;
        __int16 v71 = 2112;
        *(void *)v72 = v52;
        _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "%@ [%p] is NOT inFlight, draining the purge queue: %@",  buf,  0x20u);
      }

      [*(id *)(a1 + 32) drainPurgeQueue];
    }
  }

  else
  {
    uint64_t v53 = CDGetLogHandle("daemon");
    v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      v55 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) ID]);
      v56 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v68 = v55;
      __int16 v69 = 2048;
      v70 = v56;
      __int16 v71 = 1024;
      *(_DWORD *)v72 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "%@ [%p] not purging, it has a pending purge (urgency=%d) enqueued already, skipping",  buf,  0x1Cu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
}

- (void)servicePeriodic:(int)a3 info:(id)a4 replyBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CDService requestQueue](self, "requestQueue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = __45__CDService_servicePeriodic_info_replyBlock___block_invoke;
  v13[3] = &unk_100059BB8;
  int v16 = a3;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __45__CDService_servicePeriodic_info_replyBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 56);
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __45__CDService_servicePeriodic_info_replyBlock___block_invoke_2;
  v6[3] = &unk_100059B90;
  id v5 = *(id *)(a1 + 48);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v3 _servicePeriodic:v2 info:v4 replyBlock:v6];
}

void __45__CDService_servicePeriodic_info_replyBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) serviceQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __45__CDService_servicePeriodic_info_replyBlock___block_invoke_3;
  block[3] = &unk_100058BB0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

id __45__CDService_servicePeriodic_info_replyBlock___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) drainPurgeQueue];
}

- (void)serviceCancelPurge:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CDService requestQueue](self, "requestQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __32__CDService_serviceCancelPurge___block_invoke;
  v7[3] = &unk_1000590E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

id __32__CDService_serviceCancelPurge___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _serviceCancelPurge:*(void *)(a1 + 40)];
}

- (void)servicePing:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CDService requestQueue](self, "requestQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __25__CDService_servicePing___block_invoke;
  v7[3] = &unk_1000590E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

id __25__CDService_servicePing___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _servicePing:*(void *)(a1 + 40)];
}

- (void)serviceNotify:(id)a3 replyBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CDService requestQueue](self, "requestQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __38__CDService_serviceNotify_replyBlock___block_invoke;
  block[3] = &unk_100059068;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

id __38__CDService_serviceNotify_replyBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _serviceNotify:*(void *)(a1 + 40) replyBlock:*(void *)(a1 + 48)];
}

- (void)serviceCallback:(id)a3 replyBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CDService requestQueue](self, "requestQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __40__CDService_serviceCallback_replyBlock___block_invoke;
  block[3] = &unk_100059068;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

id __40__CDService_serviceCallback_replyBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _serviceCallback:*(void *)(a1 + 40) replyBlock:*(void *)(a1 + 48)];
}

- (void)_servicePurgeable:(int)a3 info:(id)a4 replyBlock:(id)a5
{
}

- (void)_servicePurge:(int)a3 info:(id)a4 replyBlock:(id)a5
{
}

- (void)_servicePeriodic:(int)a3 info:(id)a4 replyBlock:(id)a5
{
}

- (void)_serviceCancelPurge:(id)a3
{
}

- (void)_servicePing:(id)a3
{
}

- (void)_serviceNotify:(id)a3 replyBlock:(id)a4
{
}

- (void)_serviceCallback:(id)a3 replyBlock:(id)a4
{
}

- (BOOL)inFlight
{
  uint64_t v2 = self;
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CDService serviceQueue](self, "serviceQueue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = __21__CDService_inFlight__block_invoke;
  v5[3] = &unk_100058C48;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

id __21__CDService_inFlight__block_invoke(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _inFlight];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

- (NSString)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  id v4 = (objc_class *)objc_opt_class(self);
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDService ID](self, "ID"));
  if (-[CDService inFlight](self, "inFlight")) {
    uint64_t v8 = "YES";
  }
  else {
    uint64_t v8 = "NO";
  }
  char v9 = (void *)objc_claimAutoreleasedReturnValue(-[CDService purgeQueue](self, "purgeQueue"));
  id v10 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"<%@: %p (%@) = { inFlight=%s , purgeQueueLength=%d }>",  v6,  self,  v7,  v8,  [v9 count]);

  return v10;
}

+ (CDService)serviceWithInfo:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"CACHE_DELETE_SERVICE_IS_LOCAL"]);
  int v5 = evaluateBoolProperty(v4);

  uint64_t v6 = &off_1000580E8;
  if (!v5) {
    uint64_t v6 = &off_1000580D0;
  }
  id v7 = [objc_alloc(*v6) initWithInfo:v3];

  return (CDService *)v7;
}

+ (CDService)serviceWithInfo:(id)a3 endpoint:(id)a4
{
  id v5 = a4;
  id v6 = [a3 mutableCopy];
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"CACHE_DELETE_ID"]);

  if (!v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"ANONYMOUS_%p", v5));
    [v6 setObject:v8 forKeyedSubscript:@"CACHE_DELETE_ID"];
  }

  char v9 = -[CDAnonymousXPCService initWithInfo:endpoint:]( objc_alloc(&OBJC_CLASS___CDAnonymousXPCService),  "initWithInfo:endpoint:",  v6,  v5);

  return (CDService *)v9;
}

+ (CDService)serviceWithInfo:(id)a3 extension:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = -[CDAppExtensionService initWithInfo:extension:]( objc_alloc(&OBJC_CLASS___CDAppExtensionService),  "initWithInfo:extension:",  v6,  v5);

  return (CDService *)v7;
}

- (NSArray)volUUIDs
{
  return self->_volUUIDs;
}

- (NSString)ID
{
  return self->_ID;
}

- (void)setID:(id)a3
{
}

- (BOOL)doesPeriodic
{
  return self->_doesPeriodic;
}

- (void)setDoesPeriodic:(BOOL)a3
{
  self->_doesPeriodic = a3;
}

- (BOOL)doesPurge
{
  return self->_doesPurge;
}

- (void)setDoesPurge:(BOOL)a3
{
  self->_doesPurge = a3;
}

- (BOOL)doNotQuery
{
  return self->_doNotQuery;
}

- (void)setDoNotQuery:(BOOL)a3
{
  self->_doNotQuery = a3;
}

- (BOOL)rootOnly
{
  return self->_rootOnly;
}

- (void)setRootOnly:(BOOL)a3
{
  self->_rootOnly = a3;
}

- (OS_dispatch_queue)serviceQueue
{
  return self->_serviceQueue;
}

- (void)setServiceQueue:(id)a3
{
}

- (OS_dispatch_queue)requestQueue
{
  return self->_requestQueue;
}

- (void)setRequestQueue:(id)a3
{
}

- (NSSet)desiredNotifications
{
  return (NSSet *)objc_getProperty(self, a2, 48LL, 1);
}

- (NSDictionary)notificationOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setNotificationOptions:(id)a3
{
}

- (BOOL)noQuota
{
  return self->_noQuota;
}

- (void)setNoQuota:(BOOL)a3
{
  self->_noQuota = a3;
}

- (BOOL)_inFlight
{
  return self->__inFlight;
}

- (void)set_inFlight:(BOOL)a3
{
  self->__inFlight = a3;
}

- (id)serviceInvalidationHandler
{
  return self->_serviceInvalidationHandler;
}

- (void)setServiceInvalidationHandler:(id)a3
{
}

- (id)serviceInterruptionHandler
{
  return self->_serviceInterruptionHandler;
}

- (void)setServiceInterruptionHandler:(id)a3
{
}

- (NSMutableArray)purgeQueue
{
  return self->_purgeQueue;
}

- (void)setPurgeQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
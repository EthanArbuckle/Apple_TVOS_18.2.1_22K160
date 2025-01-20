@interface CDXPCService
- (BOOL)isConnected;
- (BOOL)isInterrupted;
- (BOOL)isInvalidated;
- (CDXPCService)initWithInfo:(id)a3;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_source)watchdog_timer;
- (id)addProcInfoForConnection:(id)a3 toDict:(id)a4;
- (void)_serviceCallback:(id)a3 replyBlock:(id)a4;
- (void)_serviceCancelPurge:(id)a3;
- (void)_serviceNotify:(id)a3 replyBlock:(id)a4;
- (void)_servicePeriodic:(int)a3 info:(id)a4 replyBlock:(id)a5;
- (void)_servicePurge:(int)a3 info:(id)a4 replyBlock:(id)a5;
- (void)_servicePurgeable:(int)a3 info:(id)a4 replyBlock:(id)a5;
- (void)connectionWasInvalidated;
- (void)dealloc;
- (void)doWithProxy:(id)a3 failure:(id)a4;
- (void)invalidateConnection;
- (void)obtainXPCConnection:(id)a3;
- (void)resumeConnection;
- (void)setIsConnected:(BOOL)a3;
- (void)setIsInterrupted:(BOOL)a3;
- (void)setIsInvalidated:(BOOL)a3;
- (void)setWatchdog_timer:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation CDXPCService

- (CDXPCService)initWithInfo:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CDXPCService;
  return -[CDService initWithInfo:](&v4, "initWithInfo:", a3);
}

- (void)dealloc
{
  if (-[CDService _inFlight](self, "_inFlight"))
  {
    v3 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[CDService requestQueue](self, "requestQueue"));
    dispatch_resume(v3);
  }

  if (-[CDXPCService isConnected](self, "isConnected")) {
    -[CDXPCService invalidateConnection](self, "invalidateConnection");
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CDXPCService;
  -[CDXPCService dealloc](&v4, "dealloc");
}

- (id)addProcInfoForConnection:(id)a3 toDict:(id)a4
{
  id v5 = a3;
  v6 = (NSMutableDictionary *)[a4 mutableCopy];
  v7 = v6;
  if (v5)
  {
    if (!v6) {
      v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    }
    uint64_t v8 = signingIdForConnection(v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    uint64_t v10 = processNameForConnection(v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if (v9) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v9,  @"CACHE_DELETE_SIGNING_ID");
    }
    if (v11) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v11,  @"CACHE_DELETE_PROCNAME");
    }
  }

  id v12 = -[NSMutableDictionary copy](v7, "copy");

  return v12;
}

- (void)_servicePurgeable:(int)a3 info:(id)a4 replyBlock:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = __50__CDXPCService__servicePurgeable_info_replyBlock___block_invoke;
  v11[3] = &unk_100059C30;
  int v15 = a3;
  id v12 = a4;
  v13 = self;
  id v14 = a5;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = __50__CDXPCService__servicePurgeable_info_replyBlock___block_invoke_4;
  v9[3] = &unk_100059C58;
  id v10 = v14;
  id v7 = v14;
  id v8 = v12;
  -[CDXPCService doWithProxy:failure:](self, "doWithProxy:failure:", v11, v9);
}

void __50__CDXPCService__servicePurgeable_info_replyBlock___block_invoke( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v9 = *(void **)(a1 + 32);
  id v10 = a2;
  id v11 = [v9 mutableCopy];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56)));
  [v11 setObject:v12 forKeyedSubscript:@"CACHE_DELETE_URGENCY"];

  uint64_t v13 = *(unsigned int *)(a1 + 56);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = __50__CDXPCService__servicePurgeable_info_replyBlock___block_invoke_2;
  v17[3] = &unk_100059C08;
  uint64_t v14 = *(void *)(a1 + 32);
  v17[4] = *(void *)(a1 + 40);
  id v19 = v8;
  id v20 = *(id *)(a1 + 48);
  id v18 = v7;
  id v15 = v7;
  id v16 = v8;
  [v10 servicePurgeable:v13 info:v14 replyBlock:v17];
}

void __50__CDXPCService__servicePurgeable_info_replyBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) serviceQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __50__CDXPCService__servicePurgeable_info_replyBlock___block_invoke_3;
  block[3] = &unk_100059BE0;
  id v12 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  id v13 = v5;
  block[4] = v6;
  id v10 = v7;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v4, block);
}

void __50__CDXPCService__servicePurgeable_info_replyBlock___block_invoke_3(uint64_t a1)
{
  int v2 = (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16LL))();
  uint64_t v3 = *(void *)(a1 + 64);
  if (v3) {
    BOOL v4 = v2 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) addProcInfoForConnection:*(void *)(a1 + 40) toDict:*(void *)(a1 + 48)]);
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }

void __50__CDXPCService__servicePurgeable_info_replyBlock___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v5 = @"CACHE_DELETE_ERROR";
  uint64_t v6 = a2;
  id v3 = a2;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
}

- (void)_servicePurge:(int)a3 info:(id)a4 replyBlock:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = __46__CDXPCService__servicePurge_info_replyBlock___block_invoke;
  v11[3] = &unk_100059C30;
  int v15 = a3;
  id v12 = a4;
  id v13 = self;
  id v14 = a5;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = __46__CDXPCService__servicePurge_info_replyBlock___block_invoke_4;
  v9[3] = &unk_100059C58;
  id v10 = v14;
  id v7 = v14;
  id v8 = v12;
  -[CDXPCService doWithProxy:failure:](self, "doWithProxy:failure:", v11, v9);
}

void __46__CDXPCService__servicePurge_info_replyBlock___block_invoke( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v9 = *(void **)(a1 + 32);
  id v10 = a2;
  id v11 = [v9 mutableCopy];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56)));
  [v11 setObject:v12 forKeyedSubscript:@"CACHE_DELETE_URGENCY"];

  uint64_t v13 = *(unsigned int *)(a1 + 56);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = __46__CDXPCService__servicePurge_info_replyBlock___block_invoke_2;
  v17[3] = &unk_100059C08;
  uint64_t v14 = *(void *)(a1 + 32);
  v17[4] = *(void *)(a1 + 40);
  id v19 = v8;
  id v20 = *(id *)(a1 + 48);
  id v18 = v7;
  id v15 = v7;
  id v16 = v8;
  [v10 servicePurge:v13 info:v14 replyBlock:v17];
}

void __46__CDXPCService__servicePurge_info_replyBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) serviceQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __46__CDXPCService__servicePurge_info_replyBlock___block_invoke_3;
  block[3] = &unk_100059BE0;
  id v12 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  id v13 = v5;
  block[4] = v6;
  id v10 = v7;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v4, block);
}

void __46__CDXPCService__servicePurge_info_replyBlock___block_invoke_3(uint64_t a1)
{
  int v2 = (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16LL))();
  uint64_t v3 = *(void *)(a1 + 64);
  if (v3) {
    BOOL v4 = v2 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) addProcInfoForConnection:*(void *)(a1 + 40) toDict:*(void *)(a1 + 48)]);
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }

void __46__CDXPCService__servicePurge_info_replyBlock___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v5 = @"CACHE_DELETE_ERROR";
    uint64_t v6 = a2;
    id v3 = a2;
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
  }

- (void)_servicePeriodic:(int)a3 info:(id)a4 replyBlock:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = __49__CDXPCService__servicePeriodic_info_replyBlock___block_invoke;
  v11[3] = &unk_100059C30;
  int v15 = a3;
  id v12 = a4;
  id v13 = self;
  id v14 = a5;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = __49__CDXPCService__servicePeriodic_info_replyBlock___block_invoke_4;
  v9[3] = &unk_100059C58;
  id v10 = v14;
  id v7 = v14;
  id v8 = v12;
  -[CDXPCService doWithProxy:failure:](self, "doWithProxy:failure:", v11, v9);
}

void __49__CDXPCService__servicePeriodic_info_replyBlock___block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  void *a4)
{
  id v6 = a4;
  id v7 = *(void **)(a1 + 32);
  id v8 = a2;
  id v9 = [v7 mutableCopy];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56)));
  [v9 setObject:v10 forKeyedSubscript:@"CACHE_DELETE_URGENCY"];

  uint64_t v11 = *(unsigned int *)(a1 + 56);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = __49__CDXPCService__servicePeriodic_info_replyBlock___block_invoke_2;
  v14[3] = &unk_100059C80;
  uint64_t v12 = *(void *)(a1 + 32);
  v14[4] = *(void *)(a1 + 40);
  id v15 = v6;
  id v16 = *(id *)(a1 + 48);
  id v13 = v6;
  [v8 servicePeriodic:v11 info:v12 replyBlock:v14];
}

void __49__CDXPCService__servicePeriodic_info_replyBlock___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1[4] serviceQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __49__CDXPCService__servicePeriodic_info_replyBlock___block_invoke_3;
  block[3] = &unk_100059CD0;
  id v8 = a1[5];
  id v9 = a1[6];
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __49__CDXPCService__servicePeriodic_info_replyBlock___block_invoke_3(void *a1)
{
  int v2 = (*(uint64_t (**)(void))(a1[5] + 16LL))();
  uint64_t result = a1[6];
  if (result) {
    BOOL v4 = v2 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, a1[4]);
  }
  return result;
}

void __49__CDXPCService__servicePeriodic_info_replyBlock___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v5 = @"CACHE_DELETE_ERROR";
    id v6 = a2;
    id v3 = a2;
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
  }

- (void)_serviceCancelPurge:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __36__CDXPCService__serviceCancelPurge___block_invoke;
  v6[3] = &unk_100059CF8;
  id v7 = self;
  id v8 = a3;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = __36__CDXPCService__serviceCancelPurge___block_invoke_4;
  v4[3] = &unk_100059C58;
  id v5 = v8;
  id v3 = v8;
  -[CDXPCService doWithProxy:failure:](v7, "doWithProxy:failure:", v6, v4);
}

void __36__CDXPCService__serviceCancelPurge___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = __36__CDXPCService__serviceCancelPurge___block_invoke_2;
  v9[3] = &unk_100059CD0;
  id v7 = *(void **)(a1 + 40);
  void v9[4] = *(void *)(a1 + 32);
  id v10 = v6;
  id v11 = v7;
  id v8 = v6;
  [a2 serviceCancelPurge:v9];
}

void __36__CDXPCService__serviceCancelPurge___block_invoke_2(id *a1)
{
  uint64_t v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1[4] serviceQueue]);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = __36__CDXPCService__serviceCancelPurge___block_invoke_3;
  v3[3] = &unk_100059CA8;
  id v4 = a1[5];
  id v5 = a1[6];
  dispatch_async(v2, v3);
}

uint64_t __36__CDXPCService__serviceCancelPurge___block_invoke_3(uint64_t a1)
{
  int v2 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    BOOL v4 = v2 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __36__CDXPCService__serviceCancelPurge___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CDGetLogHandle("daemon");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "ServiceCancelPurge failed: %@",  (uint8_t *)&v7,  0xCu);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
}

- (void)_serviceNotify:(id)a3 replyBlock:(id)a4
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = __42__CDXPCService__serviceNotify_replyBlock___block_invoke;
  v10[3] = &unk_100059D20;
  id v11 = a3;
  uint64_t v12 = self;
  id v13 = a4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __42__CDXPCService__serviceNotify_replyBlock___block_invoke_4;
  v8[3] = &unk_100059C58;
  id v9 = v13;
  id v6 = v13;
  id v7 = v11;
  -[CDXPCService doWithProxy:failure:](self, "doWithProxy:failure:", v10, v8);
}

void __42__CDXPCService__serviceNotify_replyBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = __42__CDXPCService__serviceNotify_replyBlock___block_invoke_2;
  v9[3] = &unk_100059CD0;
  uint64_t v7 = *(void *)(a1 + 32);
  void v9[4] = *(void *)(a1 + 40);
  id v10 = v6;
  id v11 = *(id *)(a1 + 48);
  id v8 = v6;
  [a2 serviceNotify:v7 replyBlock:v9];
}

void __42__CDXPCService__serviceNotify_replyBlock___block_invoke_2(id *a1)
{
  int v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1[4] serviceQueue]);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = __42__CDXPCService__serviceNotify_replyBlock___block_invoke_3;
  v3[3] = &unk_100059CA8;
  id v4 = a1[5];
  id v5 = a1[6];
  dispatch_async(v2, v3);
}

uint64_t __42__CDXPCService__serviceNotify_replyBlock___block_invoke_3(uint64_t a1)
{
  int v2 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    BOOL v4 = v2 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __42__CDXPCService__serviceNotify_replyBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CDGetLogHandle("daemon");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "ServiceNotify failed: %@",  (uint8_t *)&v7,  0xCu);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
}

- (void)_serviceCallback:(id)a3 replyBlock:(id)a4
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = __44__CDXPCService__serviceCallback_replyBlock___block_invoke;
  v10[3] = &unk_100059D20;
  id v11 = a3;
  uint64_t v12 = self;
  id v13 = a4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __44__CDXPCService__serviceCallback_replyBlock___block_invoke_4;
  v8[3] = &unk_100059C58;
  id v9 = v13;
  id v6 = v13;
  id v7 = v11;
  -[CDXPCService doWithProxy:failure:](self, "doWithProxy:failure:", v10, v8);
}

void __44__CDXPCService__serviceCallback_replyBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = __44__CDXPCService__serviceCallback_replyBlock___block_invoke_2;
  v12[3] = &unk_100059C08;
  uint64_t v9 = *(void *)(a1 + 32);
  v12[4] = *(void *)(a1 + 40);
  id v14 = v8;
  id v15 = *(id *)(a1 + 48);
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  [a2 serviceCallback:v9 replyBlock:v12];
}

void __44__CDXPCService__serviceCallback_replyBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) serviceQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __44__CDXPCService__serviceCallback_replyBlock___block_invoke_3;
  block[3] = &unk_100059BE0;
  id v12 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  id v13 = v5;
  void block[4] = v6;
  id v10 = v7;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v4, block);
}

void __44__CDXPCService__serviceCallback_replyBlock___block_invoke_3(uint64_t a1)
{
  int v2 = (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16LL))();
  uint64_t v3 = *(void *)(a1 + 64);
  if (v3) {
    BOOL v4 = v2 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) addProcInfoForConnection:*(void *)(a1 + 40) toDict:*(void *)(a1 + 48)]);
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }

void __44__CDXPCService__serviceCallback_replyBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CDGetLogHandle("daemon");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v3;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "ServiceCancelPurge failed: %@", buf, 0xCu);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    id v8 = @"CACHE_DELETE_ERROR";
    id v9 = v3;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
}

- (void)doWithProxy:(id)a3 failure:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15[0] = 0LL;
  v15[1] = v15;
  v15[2] = 0x2020000000LL;
  char v16 = 0;
  -[CDService set_inFlight:](self, "set_inFlight:", 1LL);
  id v8 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[CDService requestQueue](self, "requestQueue"));
  dispatch_suspend(v8);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = __36__CDXPCService_doWithProxy_failure___block_invoke;
  v11[3] = &unk_100059DC0;
  id v14 = v15;
  void v11[4] = self;
  id v9 = v7;
  id v12 = v9;
  id v10 = v6;
  id v13 = v10;
  -[CDXPCService obtainXPCConnection:](self, "obtainXPCConnection:", v11);

  _Block_object_dispose(v15, 8);
}

void __36__CDXPCService_doWithProxy_failure___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8LL);
  if (*(_BYTE *)(v8 + 24))
  {
    uint64_t v9 = CDGetLogHandle("daemon");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) ID]);
      v35 = (objc_class *)objc_opt_class(*(void *)(a1 + 32));
      v36 = NSStringFromClass(v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      *(_DWORD *)v54 = 138412546;
      *(void *)&v54[4] = v34;
      *(_WORD *)&v54[12] = 2112;
      *(void *)&v54[14] = v37;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_FAULT,  "%@: obtainXPCConnection callback fired more than once for %@!",  v54,  0x16u);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) ID]);
    id v12 = (objc_class *)objc_opt_class(*(void *)(a1 + 32));
    id v13 = NSStringFromClass(v12);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    _CacheDeleteAbortWithMessage("%@: obtainXPCConnection callback fired more than once for %@!", v11, v14);
  }

  else
  {
    *(_BYTE *)(v8 + 24) = 1;
    if (!v5 || v6)
    {
      uint64_t v29 = CDGetLogHandle("daemon");
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) ID]);
        *(_DWORD *)v54 = 138412546;
        *(void *)&v54[4] = v38;
        *(_WORD *)&v54[12] = 2112;
        *(void *)&v54[14] = v7;
        _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "%@: obtainXPCConnection failed to get a connection: %@",  v54,  0x16u);
      }

      v31 = *(void **)(a1 + 32);
      if (v5)
      {
        [v31 invalidateConnection];
      }

      else if ([v31 _inFlight])
      {
        objc_msgSend(*(id *)(a1 + 32), "set_inFlight:", 0);
        v32 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) requestQueue]);
        dispatch_resume(v32);
      }

      uint64_t v33 = *(void *)(a1 + 40);
      if (v33) {
        (*(void (**)(uint64_t, void *))(v33 + 16))(v33, v7);
      }
    }

    else
    {
      [*(id *)(a1 + 32) setXpcConnection:v5];
      *(void *)v54 = 0LL;
      *(void *)&v54[8] = v54;
      *(void *)&v54[16] = 0x2020000000LL;
      char v55 = 0;
      v50[0] = 0LL;
      v50[1] = v50;
      v50[2] = 0x2020000000LL;
      char v51 = 0;
      v48[0] = 0LL;
      v48[1] = v48;
      v48[2] = 0x2020000000LL;
      char v49 = 0;
      objc_initWeak(&location, *(id *)(a1 + 32));
      id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) serviceQueue]);
      dispatch_source_t v16 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v15);
      objc_msgSend(*(id *)(a1 + 32), "setWatchdog_timer:", v16);

      v17 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "watchdog_timer"));
      dispatch_time_t v18 = dispatch_time(0LL, 90000000000LL);
      dispatch_source_set_timer(v17, v18, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

      id v19 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "watchdog_timer"));
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = __36__CDXPCService_doWithProxy_failure___block_invoke_17;
      handler[3] = &unk_100058C48;
      handler[4] = *(void *)(a1 + 32);
      handler[5] = v50;
      dispatch_source_set_event_handler(v19, handler);

      id v20 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "watchdog_timer"));
      dispatch_resume(v20);

      if (([*(id *)(a1 + 32) isConnected] & 1) == 0)
      {
        uint64_t v21 = CDGetLogHandle("daemon");
        v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) ID]);
          *(_DWORD *)buf = 138412290;
          v53 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Connecting to %@", buf, 0xCu);
        }

        v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___CacheDeleteServiceProtocol));
        v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) xpcConnection]);
        [v25 setRemoteObjectInterface:v24];

        [*(id *)(a1 + 32) resumeConnection];
        [*(id *)(a1 + 32) setIsConnected:1];
      }

      v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) xpcConnection]);
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472LL;
      v41[2] = __36__CDXPCService_doWithProxy_failure___block_invoke_32;
      v41[3] = &unk_100059D70;
      objc_copyWeak(&v45, &location);
      v43 = v54;
      v44 = v48;
      id v42 = *(id *)(a1 + 40);
      v27 = (void *)objc_claimAutoreleasedReturnValue([v26 remoteObjectProxyWithErrorHandler:v41]);

      uint64_t v28 = *(void *)(a1 + 48);
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472LL;
      v39[2] = __36__CDXPCService_doWithProxy_failure___block_invoke_34;
      v39[3] = &unk_100059D98;
      objc_copyWeak(&v40, &location);
      v39[4] = v48;
      v39[5] = v54;
      v39[6] = v50;
      (*(void (**)(uint64_t, void *, id, void *))(v28 + 16))(v28, v27, v5, v39);
      objc_destroyWeak(&v40);

      objc_destroyWeak(&v45);
      objc_destroyWeak(&location);
      _Block_object_dispose(v48, 8);
      _Block_object_dispose(v50, 8);
      _Block_object_dispose(v54, 8);
    }
  }
}

void __36__CDXPCService_doWithProxy_failure___block_invoke_17(uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  uint64_t v2 = CDGetLogHandle("daemon");
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) ID]);
    int v5 = 138412546;
    id v6 = v4;
    __int16 v7 = 2048;
    uint64_t v8 = 90LL;
    _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "%@: failed to respond after %llu seconds, deleted is dirty for this reason.",  (uint8_t *)&v5,  0x16u);
  }
}

void __36__CDXPCService_doWithProxy_failure___block_invoke_32(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  int v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([WeakRetained serviceQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __36__CDXPCService_doWithProxy_failure___block_invoke_2;
    block[3] = &unk_100059D48;
    id v10 = v3;
    id v11 = v5;
    uint64_t v13 = *(void *)(a1 + 48);
    __int128 v8 = *(_OWORD *)(a1 + 32);
    id v7 = (id)v8;
    __int128 v12 = v8;
    dispatch_async(v6, block);
  }
}

void __36__CDXPCService_doWithProxy_failure___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = CDGetLogHandle("daemon");
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      __int128 v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) ID]);
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "%@: remoteObjectProxyWithErrorHandler error: %@",  buf,  0x16u);
    }
  }

  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL))
  {
    uint64_t v4 = CDGetLogHandle("daemon");
    int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) ID]);
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_FAULT,  "%@: Received an error after the request succeeded! error: %@",  buf,  0x16u);
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) ID]);
    _CacheDeleteAbortWithMessage( "%@: Received an error after the request succeeded! error: %@",  v6,  *(void *)(a1 + 32));
  }

  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8LL);
  if (!*(_BYTE *)(v7 + 24))
  {
    *(_BYTE *)(v7 + 24) = 1;
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    [*(id *)(a1 + 40) invalidateConnection];
  }

uint64_t __36__CDXPCService_doWithProxy_failure___block_invoke_34(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (!WeakRetained)
  {
LABEL_7:
    uint64_t v9 = 0LL;
    goto LABEL_11;
  }

  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([WeakRetained serviceQueue]);
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (*(_BYTE *)(v5 + 24))
  {
    if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
    {
      uint64_t v6 = CDGetLogHandle("daemon");
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v3 ID]);
        int v15 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
        *(_DWORD *)buf = 138412546;
        v17 = v14;
        __int16 v18 = 1024;
        int v19 = v15;
        _os_log_fault_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_FAULT,  "%@: Received completion after we sent a callback! Success = %d",  buf,  0x12u);
      }

      __int128 v8 = (void *)objc_claimAutoreleasedReturnValue([v3 ID]);
      _CacheDeleteAbortWithMessage( "%@: Received completion after we sent a callback! Success = %d",  v8,  *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
    }

    goto LABEL_7;
  }

  *(_BYTE *)(v5 + 24) = 1;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  uint64_t v10 = CDGetLogHandle("daemon");
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v3 ID]);
    *(_DWORD *)buf = 138412290;
    v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@: Successful Request", buf, 0xCu);
  }

  [v3 invalidateConnection];
  uint64_t v9 = 1LL;
LABEL_11:

  return v9;
}

- (void)obtainXPCConnection:(id)a3
{
  uint64_t v6 = (void (**)(id, void *, void))a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[CDXPCService xpcConnection](self, "xpcConnection"));

  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CDXPCService xpcConnection](self, "xpcConnection"));
    v6[2](v6, v5, 0LL);
  }

  else
  {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"com.apple.cache_delete.CDXPCService.no_connection",  @"Subclass needs to implement this");
  }
}

- (void)invalidateConnection
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CDXPCService xpcConnection](self, "xpcConnection"));

  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[CDXPCService xpcConnection](self, "xpcConnection"));
    [v4 invalidate];

    -[CDXPCService connectionWasInvalidated](self, "connectionWasInvalidated");
  }

  else
  {
    uint64_t v5 = CDGetLogHandle("daemon");
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      __int128 v12 = (CDXPCService *)objc_claimAutoreleasedReturnValue(-[CDService ID](self, "ID"));
      int v13 = 138412290;
      __int16 v14 = v12;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%@: invalidate and connection is nil!",  (uint8_t *)&v13,  0xCu);
    }
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDXPCService watchdog_timer](self, "watchdog_timer"));

  if (v7)
  {
    __int128 v8 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[CDXPCService watchdog_timer](self, "watchdog_timer"));
    dispatch_source_cancel(v8);

    -[CDXPCService setWatchdog_timer:](self, "setWatchdog_timer:", 0LL);
  }

  else
  {
    uint64_t v9 = CDGetLogHandle("daemon");
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CDXPCService watchdog_timer](self, "watchdog_timer"));
      int v13 = 134218240;
      __int16 v14 = self;
      __int16 v15 = 2048;
      dispatch_source_t v16 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "watchdog timer is nil, self: %p, timer: %p",  (uint8_t *)&v13,  0x16u);
    }
  }

- (void)resumeConnection
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[CDXPCService xpcConnection](self, "xpcConnection"));
  [v2 resume];
}

- (void)connectionWasInvalidated
{
  uint64_t v3 = CDGetLogHandle("daemon");
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CDService ID](self, "ID"));
    int v7 = 138412290;
    __int128 v8 = v6;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "Connection to %@ was invalidated.",  (uint8_t *)&v7,  0xCu);
  }

  -[CDXPCService setXpcConnection:](self, "setXpcConnection:", 0LL);
  -[CDXPCService setIsConnected:](self, "setIsConnected:", 0LL);
  if (-[CDService _inFlight](self, "_inFlight"))
  {
    -[CDService set_inFlight:](self, "set_inFlight:", 0LL);
    uint64_t v5 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[CDService requestQueue](self, "requestQueue"));
    dispatch_resume(v5);
  }

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (BOOL)isInterrupted
{
  return self->_isInterrupted;
}

- (void)setIsInterrupted:(BOOL)a3
{
  self->_isInterrupted = a3;
}

- (BOOL)isInvalidated
{
  return self->_isInvalidated;
}

- (void)setIsInvalidated:(BOOL)a3
{
  self->_isInvalidated = a3;
}

- (OS_dispatch_source)watchdog_timer
{
  return self->_watchdog_timer;
}

- (void)setWatchdog_timer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
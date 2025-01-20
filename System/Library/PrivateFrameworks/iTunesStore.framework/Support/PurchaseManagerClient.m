@interface PurchaseManagerClient
- (BOOL)finishesPurchases;
- (BOOL)useRemoteAuthentication;
- (PurchaseManagerClient)initWithInputConnection:(id)a3;
- (int64_t)URLBagType;
- (int64_t)uniqueIdentifier;
- (void)ackConnection;
- (void)dealloc;
- (void)postNotificationWithResponse:(id)a3;
- (void)sendAuthenticateRequestWithContext:(id)a3 responseHandler:(id)a4;
- (void)sendError:(id)a3 forPurchases:(id)a4;
- (void)sendResponse:(id)a3;
- (void)sendResponse:(id)a3 forPurchases:(id)a4;
- (void)sendResponses:(id)a3;
- (void)setFinishesPurchases:(BOOL)a3;
- (void)setUniqueIdentifier:(int64_t)a3;
- (void)setUseRemoteAuthentication:(BOOL)a3;
@end

@implementation PurchaseManagerClient

- (PurchaseManagerClient)initWithInputConnection:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PurchaseManagerClient;
  v3 = -[XPCClient initWithInputConnection:](&v6, "initWithInputConnection:", a3);
  if (v3)
  {
    v4 = CFUUIDCreate(0LL);
    v3->_uniqueIdentifier = *(_OWORD *)&CFUUIDGetUUIDBytes(v4);
    CFRelease(v4);
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PurchaseManagerClient;
  -[XPCClient dealloc](&v3, "dealloc");
}

- (void)ackConnection
{
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015F478;
  block[3] = &unk_10034AE98;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (BOOL)finishesPurchases
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 1;
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10015F568;
  v5[3] = &unk_10034B2D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)sendAuthenticateRequestWithContext:(id)a3 responseHandler:(id)a4
{
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015F5EC;
  block[3] = &unk_10034E7E0;
  block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_async(dispatchQueue, block);
}

- (void)sendError:(id)a3 forPurchases:(id)a4
{
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___SSPurchaseResponse);
  id v7 = [a3 userInfo];
  -[SSPurchaseResponse setCancelsPurchaseBatch:]( v8,  "setCancelsPurchaseBatch:",  objc_msgSend(objc_msgSend(v7, "objectForKey:", SSPurchaseErrorKeyShouldCancelPurchaseBatch), "BOOLValue"));
  -[SSPurchaseResponse setError:](v8, "setError:", a3);
  -[PurchaseManagerClient sendResponse:forPurchases:](self, "sendResponse:forPurchases:", v8, a4);
  if ([a4 count]) {
    -[PurchaseManagerClient postNotificationWithResponse:](self, "postNotificationWithResponse:", v8);
  }
}

- (void)sendResponse:(id)a3
{
  v4 = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", a3, 0LL);
  -[PurchaseManagerClient sendResponses:](self, "sendResponses:", v4);
}

- (void)sendResponse:(id)a3 forPurchases:(id)a4
{
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10016006C;
  block[3] = &unk_10034AF00;
  block[4] = self;
  void block[5] = a4;
  block[6] = a3;
  dispatch_async(dispatchQueue, block);
}

- (void)sendResponses:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10016027C;
  v4[3] = &unk_10034AE70;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)postNotificationWithResponse:(id)a3
{
  id v5 = [a3 error];
  id v6 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  id v7 = v6;
  if (v5)
  {
    if (!v6) {
      id v7 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v8 = [v7 shouldLog];
    else {
      LODWORD(v9) = v8;
    }
    v10 = (os_log_s *)[v7 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      uint64_t v9 = v9;
    }
    else {
      v9 &= 2u;
    }
    if ((_DWORD)v9)
    {
      int v40 = 138543362;
      uint64_t v41 = objc_opt_class(self);
      uint64_t v11 = _os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  2LL,  "[%{public}@] Purchase failed, not sending purchase succeeded notification",  &v40,  12);
      if (v11)
      {
        v12 = (void *)v11;
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v11, 4LL);
        free(v12);
        SSFileLog(v7, @"%@");
      }
    }
  }

  else
  {
    if (!v6) {
      id v7 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v13 = [v7 shouldLog];
    else {
      LODWORD(v14) = v13;
    }
    v15 = (os_log_s *)[v7 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      uint64_t v14 = v14;
    }
    else {
      v14 &= 2u;
    }
    if ((_DWORD)v14)
    {
      int v40 = 138543362;
      uint64_t v41 = objc_opt_class(self);
      uint64_t v16 = _os_log_send_and_compose_impl( v14,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  2LL,  "[%{public}@] Will send purchase succeeded notification",  &v40,  12);
      if (v16)
      {
        v17 = (void *)v16;
        v18 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v16, 4LL);
        free(v17);
        v35 = v18;
        SSFileLog(v7, @"%@");
      }
    }

    v19 = (objc_class *)objc_opt_class(&OBJC_CLASS___SSPurchaseResponse);
    v20 = NSStringFromClass(v19);
    +[NSKeyedArchiver setClassName:forClass:]( &OBJC_CLASS___NSKeyedArchiver,  "setClassName:forClass:",  v20,  objc_opt_class(&OBJC_CLASS___DaemonPurchaseResponse));
    uint64_t v37 = 0LL;
    v21 = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  a3,  1LL,  &v37);
    if (v37)
    {
      id v22 = +[SSLogConfig sharedStoreServicesConfig](&OBJC_CLASS___SSLogConfig, "sharedStoreServicesConfig");
      if (!v22) {
        id v22 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v23 = objc_msgSend(v22, "shouldLog", v35);
      else {
        LODWORD(v24) = v23;
      }
      v25 = (os_log_s *)[v22 OSLogObject];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        uint64_t v24 = v24;
      }
      else {
        v24 &= 2u;
      }
      if ((_DWORD)v24)
      {
        uint64_t v26 = objc_opt_class(self);
        int v40 = 138543618;
        uint64_t v41 = v26;
        __int16 v42 = 2114;
        uint64_t v43 = v37;
        LODWORD(v36) = 22;
        uint64_t v27 = _os_log_send_and_compose_impl( v24,  0LL,  0LL,  0LL,  &_mh_execute_header,  v25,  16LL,  "%{public}@: Failed to archive response. Error = %{public}@",  &v40,  v36);
        if (v27)
        {
          v28 = (void *)v27;
          +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v27, 4LL);
          free(v28);
          SSFileLog(v22, @"%@");
        }
      }
    }

    v29 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
    v38 = @"response";
    v39 = v21;
    v30 = -[NSMutableDictionary initWithDictionary:]( v29,  "initWithDictionary:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v39,  &v38,  1LL));
    v31 = +[AMSBuyParams buyParamsWithString:]( AMSBuyParams,  "buyParamsWithString:",  objc_msgSend(objc_msgSend(a3, "purchase"), "buyParameters"));
    id v32 = -[AMSBuyParams propertyForKey:](v31, "propertyForKey:", AMSBuyParamPropertyClientCorrelationKey);
    if (v32) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v30,  "setObject:forKeyedSubscript:",  v32,  @"clientCorrelationKey");
    }
    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterPostNotification( DistributedCenter,  kSSPurchaseRequestSucceededNotification,  0LL,  (CFDictionaryRef)-[NSMutableDictionary copy](v30, "copy"),  1u);
    id v34 = +[EventDispatcher eventDispatcher](&OBJC_CLASS___EventDispatcher, "eventDispatcher");
    [v34 postEventWithName:SSEventNamePurchaseSucceeded userInfo:v30];
  }

- (void)setFinishesPurchases:(BOOL)a3
{
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100160904;
  v4[3] = &unk_10034B328;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)setUniqueIdentifier:(int64_t)a3
{
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100160980;
  v4[3] = &unk_10034B300;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)setUseRemoteAuthentication:(BOOL)a3
{
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001609FC;
  v4[3] = &unk_10034B328;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

- (int64_t)uniqueIdentifier
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100160AB0;
  v5[3] = &unk_10034B2D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)URLBagType
{
  if (-[XPCClient hasEntitlements](self, "hasEntitlements")) {
    return 0LL;
  }
  else {
    return -[XPCClient isAppleSigned](self, "isAppleSigned") ^ 1;
  }
}

- (BOOL)useRemoteAuthentication
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100160BA0;
  v5[3] = &unk_10034B2D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

@end
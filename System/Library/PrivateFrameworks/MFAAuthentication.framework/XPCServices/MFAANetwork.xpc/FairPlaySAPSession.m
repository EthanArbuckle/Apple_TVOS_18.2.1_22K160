@interface FairPlaySAPSession
+ (FairPlaySAPSession)sessionWithDelegate:(id)a3;
- (FPSAPContextOpaque_)sessionContext;
- (FairPlayHWInfo_)hwInfo;
- (FairPlaySAPSession)init;
- (FairPlaySAPSession)initWithDelegate:(id)a3;
- (FairPlaySAPSessionDelegate)delegate;
- (NSDate)expiration;
- (NSUUID)UUID;
- (OS_dispatch_queue)completionQueue;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)internalQueue;
- (double)TTL;
- (id)description;
- (unint64_t)state;
- (unint64_t)state_int;
- (void)_checkExpiration;
- (void)_close;
- (void)close;
- (void)dealloc;
- (void)openWithCompletionHandler:(id)a3;
- (void)setCompletionQueue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setExpiration:(id)a3;
- (void)setHwInfo:(FairPlayHWInfo_ *)a3;
- (void)setInternalQueue:(id)a3;
- (void)setSessionContext:(FPSAPContextOpaque_ *)a3;
- (void)setState_int:(unint64_t)a3;
- (void)setTTL:(double)a3;
- (void)signatureForData:(id)a3 completionHandler:(id)a4;
- (void)verifySignature:(id)a3 forData:(id)a4 completionHandler:(id)a5;
@end

@implementation FairPlaySAPSession

- (FairPlaySAPSession)initWithDelegate:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___FairPlaySAPSession;
  v5 = -[FairPlaySAPSession init](&v29, "init");
  if (v5 == self)
  {
    objc_storeWeak((id *)&self->_delegate, v4);
    self->_state_int = 0LL;
    v6 = (NSUUID *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    UUID = self->_UUID;
    self->_UUID = v6;

    v8 = (objc_class *)objc_opt_class(self);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%lu.completionQueue", v10, -[FairPlaySAPSession hash](self, "hash")));
    v12 = (OS_dispatch_queue *)dispatch_queue_create( (const char *)[v11 UTF8String],  &_dispatch_queue_attr_concurrent);
    completionQueue = self->_completionQueue;
    self->_completionQueue = v12;

    v14 = (objc_class *)objc_opt_class(self);
    v15 = NSStringFromClass(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    id v17 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%lu.internalQueue", v16, -[FairPlaySAPSession hash](self, "hash")));
    v18 = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v17 UTF8String], 0);
    internalQueue = self->_internalQueue;
    self->_internalQueue = v18;

    v20 = (objc_class *)objc_opt_class(self);
    v21 = NSStringFromClass(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    id v23 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%lu.delegateQueue", v22, -[FairPlaySAPSession hash](self, "hash")));
    v24 = (OS_dispatch_queue *)dispatch_queue_create( (const char *)[v23 UTF8String],  &_dispatch_queue_attr_concurrent);
    delegateQueue = self->_delegateQueue;
    self->_delegateQueue = v24;

    self->_sessionContext = 0LL;
    *(void *)&self->_hwInfo.ID[4] = 0LL;
    *(void *)&self->_hwInfo.ID[12] = 0LL;
    *(void *)&self->_hwInfo.IDLength = 0LL;
    v26 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
    expiration = self->_expiration;
    self->_expiration = v26;
  }

  return v5;
}

- (FairPlaySAPSession)init
{
  id v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = NSStringFromSelector("initWithDelegate:");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (objc_class *)objc_opt_class(self);
  v10 = NSStringFromClass(v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Must use +[%@ %@] instead of +[%@ %@]!",  v6,  v8,  v11,  v13);

  return 0LL;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___FairPlaySAPSession;
  -[FairPlaySAPSession dealloc](&v3, "dealloc");
}

- (void)openWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[FairPlaySAPSession internalQueue](self, "internalQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke;
  v7[3] = &unk_1000749D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "state_int"))
  {
    v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) completionQueue]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_2_33;
    v16[3] = &unk_100074740;
    id v17 = *(id *)(a1 + 40);
    dispatch_async(v2, v16);

    objc_super v3 = v17;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "[#FairPlaySAPSession] Opening session...",  buf,  2u);
    }

    cp2g1b9ro(*(void *)(a1 + 32) + 56LL, *(void *)(a1 + 32) + 72LL);
    if ((_DWORD)v4)
    {
      uint64_t v5 = v4;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
      }
      v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) completionQueue]);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_16;
      block[3] = &unk_100074740;
      id v21 = *(id *)(a1 + 40);
      dispatch_async(v13, block);

      objc_super v3 = v21;
    }

    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setState_int:", 1);
      objc_msgSend(*(id *)(a1 + 32), "setState_int:", 2);
      v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegateQueue]);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_2;
      v18[3] = &unk_1000749D0;
      v15 = *(void **)(a1 + 40);
      v18[4] = *(void *)(a1 + 32);
      id v19 = v15;
      dispatch_async(v14, v18);

      objc_super v3 = v19;
    }
  }
}

void __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_16(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = (id)objc_claimAutoreleasedReturnValue( +[NSError FPSAPS_errorWithCode:andDescription:]( &OBJC_CLASS___NSError,  "FPSAPS_errorWithCode:andDescription:",  -4LL,  @"Could not initialize session."));
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }

void __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_3;
  v4[3] = &unk_100074980;
  objc_super v3 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = v3;
  [v2 session:v5 requestCertificateWithCompletionHandler:v4];
}

void __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) internalQueue]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_4;
  v12[3] = &unk_100074958;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(a1 + 40);
  id v13 = v6;
  uint64_t v14 = v8;
  id v15 = v5;
  id v16 = v9;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, v12);
}

void __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_4(id *a1)
{
  uint64_t v2 = (uint64_t)(a1 + 4);
  if (a1[4])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_4_cold_2(v2, v3, v4, v5, v6, v7, v8, v9);
    }
    [a1[5] _close];
    id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1[5] completionQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_21;
    block[3] = &unk_1000746F0;
    id v31 = a1[7];
    id v30 = a1[4];
    dispatch_async(v10, block);

    id v11 = v31;
LABEL_17:

    return;
  }

  id v12 = a1[6];
  if (!v12 || ![v12 length])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[#FairPlaySAPSession] Invalid certificate received!",  buf,  2u);
    }

    [a1[5] _close];
    id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1[5] completionQueue]);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_22;
    v27[3] = &unk_100074740;
    id v28 = a1[7];
    dispatch_async(v17, v27);

    id v11 = v28;
    goto LABEL_17;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "[#FairPlaySAPSession] Received certificate!",  buf,  2u);
  }

  objc_msgSend(a1[5], "setState_int:", 3);
  char v26 = -1;
  *(void *)buf = 0LL;
  int v24 = 0;
  Mib5yocT( 200, (uint64_t)a1[5] + 72, (uint64_t)[a1[5] sessionContext], (uint64_t)objc_msgSend(a1[6], "bytes"), (uint64_t)objc_msgSend(a1[6], "length"), (uint64_t)buf, (uint64_t)&v24, (uint64_t)&v26);
  if (!v13 && v26 == 1 && *(void *)buf && v24)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:](&OBJC_CLASS___NSData, "dataWithBytesNoCopy:length:"));
    objc_msgSend(a1[5], "setState_int:", 4);
    id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1[5] delegateQueue]);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_2_25;
    v19[3] = &unk_1000749A8;
    v19[4] = a1[5];
    id v20 = v14;
    id v21 = a1[7];
    id v16 = v14;
    dispatch_async(v15, v19);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_4_cold_1();
    }
    if (*(void *)buf)
    {
      free(*(void **)buf);
      *(void *)buf = 0LL;
    }

    [a1[5] _close];
    v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1[5] completionQueue]);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_23;
    v22[3] = &unk_100074740;
    id v23 = a1[7];
    dispatch_async(v18, v22);

    id v16 = v23;
  }
}

uint64_t __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_21(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_22(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSError FPSAPS_errorWithCode:](&OBJC_CLASS___NSError, "FPSAPS_errorWithCode:", -3LL));
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }

void __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_23(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSError FPSAPS_errorWithCode:](&OBJC_CLASS___NSError, "FPSAPS_errorWithCode:", -4LL));
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }

void __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_2_25(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_3_26;
  v5[3] = &unk_100074980;
  v5[4] = v3;
  id v6 = *(id *)(a1 + 48);
  [v2 session:v3 requestHandshakeWithServer:v4 completionHandler:v5];
}

void __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_3_26(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) internalQueue]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_4_27;
  v12[3] = &unk_100074958;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(a1 + 40);
  id v13 = v6;
  uint64_t v14 = v8;
  id v15 = v5;
  id v16 = v9;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, v12);
}

void __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_4_27(id *a1)
{
  uint64_t v2 = (uint64_t)(a1 + 4);
  if (a1[4])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_4_27_cold_2(v2, v3, v4, v5, v6, v7, v8, v9);
    }
    [a1[5] _close];
    id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1[5] completionQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_28;
    block[3] = &unk_1000746F0;
    id v29 = a1[7];
    id v28 = a1[4];
    dispatch_async(v10, block);

    id v11 = v29;
  }

  else if (a1[6])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "[#FairPlaySAPSession] Received handshake response!",  buf,  2u);
    }

    objc_msgSend(a1[5], "setState_int:", 5);
    char v24 = -1;
    *(void *)buf = 0LL;
    int v22 = 0;
    Mib5yocT( 200, (uint64_t)a1[5] + 72, (uint64_t)[a1[5] sessionContext], (uint64_t)objc_msgSend(a1[6], "bytes"), (uint64_t)objc_msgSend(a1[6], "length"), (uint64_t)buf, (uint64_t)&v22, (uint64_t)&v24);
    int v13 = v12;
    if (*(void *)buf)
    {
      free(*(void **)buf);
      *(void *)buf = 0LL;
    }

    if (v13 || v24)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_4_27_cold_1();
      }
      [a1[5] _close];
      uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1[5] completionQueue]);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_31;
      v18[3] = &unk_100074740;
      id v15 = &v19;
      id v19 = a1[7];
      id v16 = v18;
    }

    else
    {
      objc_msgSend(a1[5], "setState_int:", 6);
      uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1[5] completionQueue]);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_30;
      v20[3] = &unk_100074740;
      id v15 = &v21;
      id v21 = a1[7];
      id v16 = v20;
    }

    dispatch_async(v14, v16);

    id v11 = *v15;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[#FairPlaySAPSession] Invalid handshake response received!",  buf,  2u);
    }

    [a1[5] _close];
    id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1[5] completionQueue]);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_29;
    v25[3] = &unk_100074740;
    id v26 = a1[7];
    dispatch_async(v17, v25);

    id v11 = v26;
  }
}

uint64_t __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_28(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_29(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSError FPSAPS_errorWithCode:](&OBJC_CLASS___NSError, "FPSAPS_errorWithCode:", -3LL));
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }

uint64_t __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_30(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0LL);
  }
  return result;
}

void __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_31(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSError FPSAPS_errorWithCode:](&OBJC_CLASS___NSError, "FPSAPS_errorWithCode:", -4LL));
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }

void __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_2_33(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = (id)objc_claimAutoreleasedReturnValue( +[NSError FPSAPS_errorWithCode:andDescription:]( &OBJC_CLASS___NSError,  "FPSAPS_errorWithCode:andDescription:",  -7LL,  @"Session is already open or initializing."));
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }

- (void)close
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[FairPlaySAPSession internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __27__FairPlaySAPSession_close__block_invoke;
  block[3] = &unk_1000749F8;
  void block[4] = self;
  dispatch_async(v3, block);
}

id __27__FairPlaySAPSession_close__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _close];
}

- (void)signatureForData:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[FairPlaySAPSession internalQueue](self, "internalQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __57__FairPlaySAPSession_signatureForData_completionHandler___block_invoke;
    block[3] = &unk_1000749A8;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

void __57__FairPlaySAPSession_signatureForData_completionHandler___block_invoke(id *a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "[#FairPlaySAPSession] Generating signature...",  buf,  2u);
  }

  [a1[4] _checkExpiration];
  id v2 = a1[5];
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
  {
    if (objc_msgSend(a1[4], "state_int") == (id)6)
    {
      *(void *)buf = 0LL;
      int v30 = 0;
      Fc3vhtJDvr( (uint64_t)[a1[4] sessionContext], (uint64_t)objc_msgSend(a1[5], "bytes"), (uint64_t)objc_msgSend(a1[5], "length"), (uint64_t)buf, (uint64_t)&v30);
      if ((_DWORD)v4)
      {
        uint64_t v5 = v4;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          __57__FairPlaySAPSession_signatureForData_completionHandler___block_invoke_cold_1( v5,  v6,  v7,  v8,  v9,  v10,  v11,  v12);
        }
        if (*(void *)buf)
        {
          free(*(void **)buf);
          *(void *)buf = 0LL;
        }

        int v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1[4] completionQueue]);
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472LL;
        v25[2] = __57__FairPlaySAPSession_signatureForData_completionHandler___block_invoke_37;
        v25[3] = &unk_100074740;
        uint64_t v14 = &v26;
        id v26 = a1[6];
        id v15 = v25;
      }

      else
      {
        int v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1[4] completionQueue]);
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472LL;
        v27[2] = __57__FairPlaySAPSession_signatureForData_completionHandler___block_invoke_2;
        v27[3] = &unk_100074A20;
        uint64_t v14 = (void **)v28;
        v28[0] = a1[6];
        v28[1] = *(void *)buf;
        int v29 = v30;
        id v15 = v27;
      }

      dispatch_async(v13, v15);

      id v21 = *v14;
    }

    else
    {
      int v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1[4] completionQueue]);
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = __57__FairPlaySAPSession_signatureForData_completionHandler___block_invoke_2_38;
      v23[3] = &unk_100074740;
      id v24 = a1[6];
      dispatch_async(v22, v23);

      id v21 = v24;
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      id v16 = (objc_class *)objc_opt_class(a1[5]);
      id v17 = NSStringFromClass(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      id v19 = a1[5];
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v18;
      __int16 v34 = 2112;
      id v35 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "[#FairPlaySAPSession] Invalid parameter! (data.class: %@, data: %@)",  buf,  0x16u);
    }

    id v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1[4] completionQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __57__FairPlaySAPSession_signatureForData_completionHandler___block_invoke_36;
    block[3] = &unk_100074740;
    id v32 = a1[6];
    dispatch_async(v20, block);

    id v21 = v32;
  }
}

void __57__FairPlaySAPSession_signatureForData_completionHandler___block_invoke_36(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSError FPSAPS_errorWithCode:](&OBJC_CLASS___NSError, "FPSAPS_errorWithCode:", -3LL));
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0LL, v2);
}

void __57__FairPlaySAPSession_signatureForData_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:",  *(void *)(a1 + 40),  *(unsigned int *)(a1 + 48)));
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0LL);
}

void __57__FairPlaySAPSession_signatureForData_completionHandler___block_invoke_37(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSError FPSAPS_errorWithCode:](&OBJC_CLASS___NSError, "FPSAPS_errorWithCode:", -3LL));
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0LL, v2);
}

void __57__FairPlaySAPSession_signatureForData_completionHandler___block_invoke_2_38(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[NSError FPSAPS_errorWithCode:andDescription:]( &OBJC_CLASS___NSError,  "FPSAPS_errorWithCode:andDescription:",  -7LL,  @"Session must be open to generate signature."));
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0LL, v2);
}

- (void)verifySignature:(id)a3 forData:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[FairPlaySAPSession internalQueue](self, "internalQueue"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = __64__FairPlaySAPSession_verifySignature_forData_completionHandler___block_invoke;
    v12[3] = &unk_100074A48;
    id v13 = v8;
    id v14 = v9;
    id v15 = self;
    id v16 = v10;
    dispatch_async(v11, v12);
  }
}

void __64__FairPlaySAPSession_verifySignature_forData_completionHandler___block_invoke(id *a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "[#FairPlaySAPSession] Verifying signature...",  buf,  2u);
  }

  id v2 = a1[4];
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0
    && (id v4 = a1[5], v5 = objc_opt_class(&OBJC_CLASS___NSData), (objc_opt_isKindOfClass(v4, v5) & 1) != 0))
  {
    if (objc_msgSend(a1[6], "state_int") == (id)6)
    {
      id v6 = [a1[5] mutableCopy];
      [a1[6] sessionContext];
      [a1[4] bytes];
      [a1[4] length];
      id v7 = v6;
      [v7 mutableBytes];
      [v7 length];
      gLg1CWr7p();
      int v9 = v8;
      [a1[6] _checkExpiration];
      if (v9)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v32) = v9;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[#FairPlaySAPSession] Signature verification failed! (status: %d)",  buf,  8u);
        }

        id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1[6] completionQueue]);
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472LL;
        v25[2] = __64__FairPlaySAPSession_verifySignature_forData_completionHandler___block_invoke_42;
        v25[3] = &unk_100074740;
        uint64_t v11 = &v26;
        id v26 = a1[7];
        uint64_t v12 = v25;
      }

      else
      {
        id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1[6] completionQueue]);
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472LL;
        v27[2] = __64__FairPlaySAPSession_verifySignature_forData_completionHandler___block_invoke_2;
        v27[3] = &unk_100074740;
        uint64_t v11 = &v28;
        id v28 = a1[7];
        uint64_t v12 = v27;
      }

      dispatch_async(v10, v12);
    }

    else
    {
      int v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1[6] completionQueue]);
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = __64__FairPlaySAPSession_verifySignature_forData_completionHandler___block_invoke_2_43;
      v23[3] = &unk_100074740;
      id v24 = a1[7];
      dispatch_async(v22, v23);

      id v7 = v24;
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      id v13 = (objc_class *)objc_opt_class(a1[4]);
      id v14 = NSStringFromClass(v13);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      id v16 = (objc_class *)objc_opt_class(a1[5]);
      id v17 = NSStringFromClass(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      id v19 = a1[4];
      id v20 = a1[5];
      *(_DWORD *)buf = 138413058;
      id v32 = v15;
      __int16 v33 = 2112;
      __int16 v34 = v18;
      __int16 v35 = 2112;
      id v36 = v19;
      __int16 v37 = 2112;
      id v38 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "[#FairPlaySAPSession] Invalid parameter! (signature.class: %@, data.class: %@, signature: %@, data: %@)",  buf,  0x2Au);
    }

    id v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1[6] completionQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __64__FairPlaySAPSession_verifySignature_forData_completionHandler___block_invoke_41;
    block[3] = &unk_100074740;
    id v30 = a1[7];
    dispatch_async(v21, block);

    id v7 = v30;
  }
}

void __64__FairPlaySAPSession_verifySignature_forData_completionHandler___block_invoke_41(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSError FPSAPS_errorWithCode:](&OBJC_CLASS___NSError, "FPSAPS_errorWithCode:", -3LL));
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0LL, v2);
}

uint64_t __64__FairPlaySAPSession_verifySignature_forData_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __64__FairPlaySAPSession_verifySignature_forData_completionHandler___block_invoke_42(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSError FPSAPS_errorWithCode:](&OBJC_CLASS___NSError, "FPSAPS_errorWithCode:", -3LL));
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0LL, v2);
}

void __64__FairPlaySAPSession_verifySignature_forData_completionHandler___block_invoke_2_43(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[NSError FPSAPS_errorWithCode:andDescription:]( &OBJC_CLASS___NSError,  "FPSAPS_errorWithCode:andDescription:",  -7LL,  @"Session must be open to verify signature."));
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0LL, v2);
}

- (void)_close
{
}

- (void)_checkExpiration
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 expiration]);
  int v2 = 138412290;
  uint64_t v3 = v1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "[#FairPlaySAPSession] Checking expiration for session (expiration: %@)...",  (uint8_t *)&v2,  0xCu);

  OUTLINED_FUNCTION_6();
}

- (id)description
{
  uint64_t v3 = (objc_class *)objc_opt_class(self);
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  unint64_t v6 = -[FairPlaySAPSession state](self, "state");
  if (v6 > 2) {
    id v7 = 0LL;
  }
  else {
    id v7 = off_100074AB8[v6];
  }
  -[FairPlaySAPSession TTL](self, "TTL");
  int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ <state: %@, TTL: %fs>",  v5,  v7,  v8));

  return v9;
}

- (unint64_t)state
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  uint64_t v10 = 0LL;
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[FairPlaySAPSession internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __27__FairPlaySAPSession_state__block_invoke;
  v6[3] = &unk_100074A70;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_barrier_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

char *__27__FairPlaySAPSession_state__block_invoke(uint64_t a1)
{
  uint64_t result = (char *)objc_msgSend(*(id *)(a1 + 32), "state_int");
  return result;
}

- (double)TTL
{
  uint64_t v7 = 0LL;
  uint64_t v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000LL;
  uint64_t v10 = 0LL;
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[FairPlaySAPSession internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __25__FairPlaySAPSession_TTL__block_invoke;
  v6[3] = &unk_100074A70;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_barrier_sync(v3, v6);

  double v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __25__FairPlaySAPSession_TTL__block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "state_int") == (id)6)
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) expiration]);
    [v3 timeIntervalSinceNow];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v2;
  }

- (void)setTTL:(double)a3
{
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[FairPlaySAPSession internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __29__FairPlaySAPSession_setTTL___block_invoke;
  v6[3] = &unk_100074A98;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_barrier_sync(v5, v6);
}

void __29__FairPlaySAPSession_setTTL___block_invoke(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)(a1 + 40);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  *(double *)(a1 + 40)));
  uint64_t v5 = *(void **)(a1 + 32);
  double v4 = (id *)(a1 + 32);
  [v5 setExpiration:v3];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    __29__FairPlaySAPSession_setTTL___block_invoke_cold_1(v2, v4);
  }
}

- (void)setState_int:(unint64_t)a3
{
  self->_unint64_t state_int = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    unint64_t state_int = self->_state_int;
    else {
      uint64_t v5 = off_100074AD0[state_int];
    }
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "[#FairPlaySAPSession] self.state_int: %@",  (uint8_t *)&v6,  0xCu);
  }

+ (FairPlaySAPSession)sessionWithDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithDelegate:v4];

  return (FairPlaySAPSession *)v5;
}

- (FairPlaySAPSessionDelegate)delegate
{
  return (FairPlaySAPSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (unint64_t)state_int
{
  return self->_state_int;
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (FPSAPContextOpaque_)sessionContext
{
  return self->_sessionContext;
}

- (void)setSessionContext:(FPSAPContextOpaque_ *)a3
{
  self->_sessionContext = a3;
}

- (FairPlayHWInfo_)hwInfo
{
  *retstr = self[3];
  return self;
}

- (void)setHwInfo:(FairPlayHWInfo_ *)a3
{
  __int128 v3 = *(_OWORD *)&a3->IDLength;
  *(void *)&self->_hwInfo.ID[12] = *(void *)&a3->ID[12];
  *(_OWORD *)&self->_hwInfo.IDLength = v3;
}

- (NSDate)expiration
{
  return self->_expiration;
}

- (void)setExpiration:(id)a3
{
}

- (void).cxx_destruct
{
}

void __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_cold_1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_3_0( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "[#FairPlaySAPSession] Could not generate handshake request data! (status: %d, returnCode: %d)",  v1,  v2,  v3,  v4,  v5);
  OUTLINED_FUNCTION_2();
}

void __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_4_cold_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_4_27_cold_1()
{
  OUTLINED_FUNCTION_3_0( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "[#FairPlaySAPSession] Could not process handshake response! (status: %d, returnCode: %d)",  v1,  v2,  v3,  v4,  v5);
  OUTLINED_FUNCTION_2();
}

void __48__FairPlaySAPSession_openWithCompletionHandler___block_invoke_4_27_cold_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __57__FairPlaySAPSession_signatureForData_completionHandler___block_invoke_cold_1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __29__FairPlaySAPSession_setTTL___block_invoke_cold_1(uint64_t *a1, id *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*a2 expiration]);
  int v4 = 134218242;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "[#FairPlaySAPSession] Setting TTL... (TTL: %f, self.expiration: %@)",  (uint8_t *)&v4,  0x16u);

  OUTLINED_FUNCTION_6();
}

@end
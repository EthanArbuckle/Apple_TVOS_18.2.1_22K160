@interface CLMescalSigner
- (double)replaceAfter;
- (id)_mescalSignerNSURLSession;
- (id)initInSilo:(id)a3;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)_churnMescalExchangeData:(id)a3 withCompletion:(id)a4;
- (void)_doSigningWhenReady;
- (void)_initializeMescalWithCompletion:(id)a3;
- (void)dealloc;
- (void)signData:(id)a3 withCompletion:(id)a4;
@end

@implementation CLMescalSigner

- (id)initInSilo:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CLMescalSigner;
  v4 = -[CLMescalSigner init](&v11, "init");
  v5 = v4;
  if (v4)
  {
    sub_1001981E8(0LL, 0LL, (uint64_t)&v4->_hardwareInfo);
    if (v6)
    {
      if (qword_101934A70 != -1) {
        dispatch_once(&qword_101934A70, &stru_10182FBB8);
      }
      v7 = (os_log_s *)qword_101934A78;
      if (os_log_type_enabled((os_log_t)qword_101934A78, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_FAULT,  "MESCAL: Could not derive hardware info for SAPInit",  buf,  2u);
      }

      if (sub_1002921D0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934A70 != -1) {
          dispatch_once(&qword_101934A70, &stru_10182FBB8);
        }
        v10[0] = 0;
        v9 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A78,  17LL,  "MESCAL: Could not derive hardware info for SAPInit",  v10,  2);
        sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLMescalSigner initInSilo:]", "%s\n", v9);
      }

      return 0LL;
    }

    else
    {
      v5->_silo = (CLSilo *)a3;
      v5->_worklist = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      v5->_replaceAfter = CFAbsoluteTimeGetCurrent() + 3600.0;
    }
  }

  return v5;
}

- (void)dealloc
{
  self->_mescalVersion = 0LL;
  self->_mescalCertURL = 0LL;

  self->_mescalExchangeURL = 0LL;
  session = self->_session;
  if (session)
  {
    sub_10016C050((uint64_t)session);
    self->_session = 0LL;
  }

  if (-[NSMutableArray count](self->_worklist, "count"))
  {
    v4 = (CLMescalSigner *)sub_1012334E8();
    -[CLMescalSigner signData:withCompletion:](v4, v5, v6, v7);
  }

  else
  {

    self->_worklist = 0LL;
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___CLMescalSigner;
    -[CLMescalSigner dealloc](&v8, "dealloc");
  }

- (void)signData:(id)a3 withCompletion:(id)a4
{
  if (!a3)
  {
    id v6 = (id)sub_101233648(self, a2, 0LL, a4);
    goto LABEL_9;
  }

  worklist = self->_worklist;
  v9[0] = a3;
  v8[0] = @"dataIn";
  v8[1] = @"hdlr";
  v9[1] = [a4 copy];
  id v6 = -[NSMutableArray addObject:]( worklist,  "addObject:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  2LL));
  if (self->_keyExchangeComplete)
  {
    -[CLMescalSigner _doSigningWhenReady](self, "_doSigningWhenReady");
    return;
  }

  if (!self->_keyExchangeStarted)
  {
    self->_keyExchangeStarted = 1;
    if (!self->_session)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_1002CD074;
      v7[3] = &unk_10182FAF8;
      v7[4] = self;
      -[CLMescalSigner _initializeMescalWithCompletion:](self, "_initializeMescalWithCompletion:", v7);
      return;
    }

- (void)_doSigningWhenReady
{
  if (!self->_keyExchangeComplete) {
    sub_101233A68();
  }
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  worklist = self->_worklist;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( worklist,  "countByEnumeratingWithState:objects:count:",  &v22,  v30,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(worklist);
        }
        objc_super v8 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)v7);
        id v9 = [v8 objectForKey:@"dataIn"];
        v10 = (void (**)(id, void))[v8 objectForKey:@"hdlr"];
        objc_super v11 = v10;
        session = self->_session;
        if (session)
        {
          uint64_t v21 = 0LL;
          unsigned int v20 = 0;
          sub_10017B928( (uint64_t)session,  (uint64_t)[v9 bytes],  (uint64_t)objc_msgSend(v9, "length"),  (uint64_t)&v21,  (uint64_t)&v20);
          if (v13)
          {
            int v14 = v13;
            if (qword_101934A70 != -1) {
              dispatch_once(&qword_101934A70, &stru_10182FBB8);
            }
            v15 = (os_log_s *)qword_101934A78;
            if (os_log_type_enabled((os_log_t)qword_101934A78, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 134349056;
              uint64_t v29 = v14;
              _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_FAULT,  "MESCAL: SAPSign failed with: %{public}ld",  buf,  0xCu);
            }

            if (sub_1002921D0(115, 0))
            {
              bzero(buf, 0x65CuLL);
              if (qword_101934A70 != -1) {
                dispatch_once(&qword_101934A70, &stru_10182FBB8);
              }
              int v26 = 134349056;
              uint64_t v27 = v14;
              LODWORD(v19) = 12;
              v17 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A78,  17LL,  "MESCAL: SAPSign failed with: %{public}ld",  &v26,  v19);
              sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLMescalSigner _doSigningWhenReady]", "%s\n", v17);
            }

            v16 = 0LL;
          }

          else
          {
            v16 = +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v21, v20);
            sub_10017B8CC(v21);
          }

          ((void (**)(id, NSData *))v11)[2](v11, v16);
        }

        else
        {
          v10[2](v10, 0LL);
        }

        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( worklist,  "countByEnumeratingWithState:objects:count:",  &v22,  v30,  16LL);
      id v5 = v18;
    }

    while (v18);
  }

  -[NSMutableArray removeAllObjects](self->_worklist, "removeAllObjects");
}

- (id)_mescalSignerNSURLSession
{
  return +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  +[NSURLSessionConfiguration defaultSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "defaultSessionConfiguration"),  self,  -[CLSilo operationQueue](self->_silo, "operationQueue"));
}

- (void)_initializeMescalWithCompletion:(id)a3
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  int v13 = sub_1002CD75C;
  int v14 = &unk_10182FB20;
  v15 = self;
  id v16 = a3;
  sub_10017AA1C((uint64_t)&self->_session, (uint64_t)&self->_hardwareInfo);
  if (v4)
  {
    int v5 = v4;
    if (qword_101934A70 != -1) {
      dispatch_once(&qword_101934A70, &stru_10182FBB8);
    }
    uint64_t v6 = (os_log_s *)qword_101934A78;
    if (os_log_type_enabled((os_log_t)qword_101934A78, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134349056;
      uint64_t v20 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_FAULT,  "MESCAL: SAPInit failed with: %{public}ld",  buf,  0xCu);
    }

    if (!sub_1002921D0(115, 0)) {
      goto LABEL_18;
    }
    bzero(buf, 0x65CuLL);
    if (qword_101934A70 != -1) {
      dispatch_once(&qword_101934A70, &stru_10182FBB8);
    }
    int v17 = 134349056;
    uint64_t v18 = v5;
    id v7 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A78,  17LL,  "MESCAL: SAPInit failed with: %{public}ld",  &v17,  12);
    goto LABEL_22;
  }

  if (objc_opt_class(&OBJC_CLASS___SSURLBag))
  {
    id v8 = +[SSURLBag URLBagForContext:]( &OBJC_CLASS___SSURLBag,  "URLBagForContext:",  objc_alloc_init(&OBJC_CLASS___SSURLBagContext));
    if (v8)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_1002CD91C;
      v11[3] = &unk_10182FB98;
      v11[4] = self;
      v11[5] = v12;
      [v8 loadWithCompletionBlock:v11];
      return;
    }
  }

  if (qword_101934A70 != -1) {
    dispatch_once(&qword_101934A70, &stru_10182FBB8);
  }
  id v9 = (os_log_s *)qword_101934A78;
  if (os_log_type_enabled((os_log_t)qword_101934A78, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "MESCAL: Could not obtain store URL bag", buf, 2u);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934A70 != -1) {
      dispatch_once(&qword_101934A70, &stru_10182FBB8);
    }
    LOWORD(v17) = 0;
    id v7 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A78,  17LL,  "MESCAL: Could not obtain store URL bag",  &v17,  2);
LABEL_22:
    v10 = (uint8_t *)v7;
    sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLMescalSigner _initializeMescalWithCompletion:]", "%s\n", v7);
    if (v10 != buf) {
      free(v10);
    }
  }

- (void)_churnMescalExchangeData:(id)a3 withCompletion:(id)a4
{
  session = self->_session;
  if (!session)
  {
    self = (CLMescalSigner *)sub_101233BC8();
    goto LABEL_22;
  }

  p_vtable = a3;
  if (!a3)
  {
LABEL_22:
    sub_101233D28(self, a2);
    goto LABEL_23;
  }

  int v4 = (void (**)(id, void))a4;
  id v7 = self;
  uint64_t v20 = 0LL;
  unsigned int v19 = 0;
  char v18 = -1;
  sub_10019FCC0( 200,  (uint64_t)&self->_hardwareInfo,  (uint64_t)session,  (uint64_t)[a3 bytes],  (uint64_t)objc_msgSend(a3, "length"),  (uint64_t)&v20,  (uint64_t)&v19,  (uint64_t)&v18);
  LODWORD(session) = v8;
  id v9 = +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v20, v19);
  sub_10017B8CC(v20);
  if ((_DWORD)session)
  {
    p_vtable = &OBJC_METACLASS___CLPrivacyManager.vtable;
    if (qword_101934A70 == -1)
    {
LABEL_5:
      v10 = (os_log_s *)qword_101934A78;
      if (os_log_type_enabled((os_log_t)qword_101934A78, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134349056;
        uint64_t v26 = (int)session;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_FAULT,  "MESCAL: SAPExchange failed with: %{public}ld",  buf,  0xCu);
      }

      if (!sub_1002921D0(115, 0)) {
        goto LABEL_8;
      }
      bzero(buf, 0x65CuLL);
      if (p_vtable[334] != -1LL) {
        dispatch_once(&qword_101934A70, &stru_10182FBB8);
      }
      int v23 = 134349056;
      uint64_t v24 = (int)session;
      v15 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A78,  17LL,  "MESCAL: SAPExchange failed with: %{public}ld",  &v23,  12);
LABEL_27:
      id v16 = (uint8_t *)v15;
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLMescalSigner _churnMescalExchangeData:withCompletion:]", "%s\n", v15);
      if (v16 != buf) {
        free(v16);
      }
LABEL_8:
      v4[2](v4, 0LL);
      return;
    }

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
}

- (double)replaceAfter
{
  return self->_replaceAfter;
}

@end
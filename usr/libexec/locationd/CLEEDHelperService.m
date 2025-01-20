@interface CLEEDHelperService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)notifyMitigationNeeded:(id)a3;
- (BOOL)notifyNewRequestAvailable;
- (CLEEDHelperService)initWithUniverse:(id)a3 pendingRequestsCB:(id)a4 streamingRequestCB:(id)a5 uploadRequestCB:(id)a6 streamingEndCB:(id)a7 uploadListCB:(id)a8 handleResponseCB:(id)a9 mitigationsCB:(id)a10;
- (void)connectToEEDHelper;
- (void)dealloc;
- (void)fetchAllPendingRequestsWithCompletion:(id)a3;
- (void)fetchCurrentMediaUploadRequestWithCompletion:(id)a3;
- (void)fetchCurrentStreamingRequestWithCompletion:(id)a3;
- (void)fetchMitigationsWithCompletion:(id)a3;
- (void)handleResponse:(BOOL)a3 forRequest:(id)a4 completion:(id)a5;
- (void)mediaUploadList:(id)a3 forRequestID:(id)a4 completion:(id)a5;
- (void)streamingSessionEndedForRequestID:(id)a3 completion:(id)a4;
@end

@implementation CLEEDHelperService

- (CLEEDHelperService)initWithUniverse:(id)a3 pendingRequestsCB:(id)a4 streamingRequestCB:(id)a5 uploadRequestCB:(id)a6 streamingEndCB:(id)a7 uploadListCB:(id)a8 handleResponseCB:(id)a9 mitigationsCB:(id)a10
{
  if (qword_101934890 != -1) {
    dispatch_once(&qword_101934890, &stru_101894710);
  }
  p_vtable = &OBJC_METACLASS___CLPrivacyManager.vtable;
  v18 = (os_log_s *)qword_101934898;
  if (os_log_type_enabled((os_log_t)qword_101934898, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446210;
    v37 = "-[CLEEDHelperService initWithUniverse:pendingRequestsCB:streamingRequestCB:uploadRequestCB:streamingEndCB:uplo"
          "adListCB:handleResponseCB:mitigationsCB:]";
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s", buf, 0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934890 != -1) {
      dispatch_once(&qword_101934890, &stru_101894710);
    }
    int v34 = 136446210;
    v35 = "-[CLEEDHelperService initWithUniverse:pendingRequestsCB:streamingRequestCB:uploadRequestCB:streamingEndCB:uplo"
          "adListCB:handleResponseCB:mitigationsCB:]";
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934898,  2LL,  "#EED2FWK,%{public}s",  &v34,  12);
    v28 = (uint8_t *)v27;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLEEDHelperService initWithUniverse:pendingRequestsCB:streamingRequestCB:uploadRequestCB:streamingEndCB:uploadLi stCB:handleResponseCB:mitigationsCB:]",  "%s\n",  v27);
    if (v28 != buf) {
      free(v28);
    }
    p_vtable = (void **)(&OBJC_METACLASS___CLPrivacyManager + 24);
  }

  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___CLEEDHelperService;
  v19 = -[CLEEDHelperService init](&v33, "init");
  if (v19)
  {
    v19->fUniverse = (CLIntersiloUniverse *)a3;
    dispatch_assert_queue_V2((dispatch_queue_t)objc_msgSend(objc_msgSend(a3, "silo"), "queue"));
    v19->fPendingRequestsCB = _Block_copy(a4);
    v19->fStreamingRequestCB = _Block_copy(a5);
    v19->fUploadRequestCB = _Block_copy(a6);
    v19->fStreamingEndCB = _Block_copy(a7);
    v19->fUploadListCB = _Block_copy(a8);
    v19->fHandleResponseCB = _Block_copy(a9);
    v19->fFetchMitigationsCB = _Block_copy(a10);
    v20 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.locationd.eedhelper");
    v19->fListener = v20;
    if (v20)
    {
      -[NSXPCListener _setQueue:]( v20,  "_setQueue:",  objc_msgSend(-[CLIntersiloUniverse silo](v19->fUniverse, "silo"), "queue"));
      -[NSXPCListener setDelegate:](v19->fListener, "setDelegate:", v19);
      -[NSXPCListener activate](v19->fListener, "activate");
      if (qword_101934890 != -1) {
        dispatch_once(&qword_101934890, &stru_101894710);
      }
      v21 = (os_log_s *)p_vtable[275];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446210;
        v37 = "-[CLEEDHelperService initWithUniverse:pendingRequestsCB:streamingRequestCB:uploadRequestCB:streamingEndCB:"
              "uploadListCB:handleResponseCB:mitigationsCB:]";
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "#EED2FWK,%{public}s, Listener activated",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934890 != -1) {
          dispatch_once(&qword_101934890, &stru_101894710);
        }
        v22 = p_vtable[275];
        int v34 = 136446210;
        v35 = "-[CLEEDHelperService initWithUniverse:pendingRequestsCB:streamingRequestCB:uploadRequestCB:streamingEndCB:"
              "uploadListCB:handleResponseCB:mitigationsCB:]";
        LODWORD(v32) = 12;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v22,  2LL,  "#EED2FWK,%{public}s, Listener activated",  &v34,  v32);
        v24 = (uint8_t *)v23;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLEEDHelperService initWithUniverse:pendingRequestsCB:streamingRequestCB:uploadRequestCB:streamingEndCB:uplo adListCB:handleResponseCB:mitigationsCB:]",  "%s\n",  v23);
        if (v24 != buf) {
          free(v24);
        }
      }
    }

    else
    {
      if (qword_101934890 != -1) {
        dispatch_once(&qword_101934890, &stru_101894710);
      }
      v25 = (os_log_s *)p_vtable[275];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        v37 = "-[CLEEDHelperService initWithUniverse:pendingRequestsCB:streamingRequestCB:uploadRequestCB:streamingEndCB:"
              "uploadListCB:handleResponseCB:mitigationsCB:]";
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "#EED2FWK,%{public}s, Could not establish listener",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934890 != -1) {
          dispatch_once(&qword_101934890, &stru_101894710);
        }
        v29 = p_vtable[275];
        int v34 = 136446210;
        v35 = "-[CLEEDHelperService initWithUniverse:pendingRequestsCB:streamingRequestCB:uploadRequestCB:streamingEndCB:"
              "uploadListCB:handleResponseCB:mitigationsCB:]";
        LODWORD(v32) = 12;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v29,  16LL,  "#EED2FWK,%{public}s, Could not establish listener",  &v34,  v32);
        v31 = (uint8_t *)v30;
        sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLEEDHelperService initWithUniverse:pendingRequestsCB:streamingRequestCB:uploadRequestCB:streamingEndCB:uplo adListCB:handleResponseCB:mitigationsCB:]",  "%s\n",  v30);
        if (v31 != buf) {
          free(v31);
        }
      }

      return 0LL;
    }
  }

  return v19;
}

- (void)dealloc
{
  if (qword_101934890 != -1) {
    dispatch_once(&qword_101934890, &stru_101894710);
  }
  v3 = (os_log_s *)qword_101934898;
  if (os_log_type_enabled((os_log_t)qword_101934898, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446210;
    v10 = "-[CLEEDHelperService dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s", buf, 0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934890 != -1) {
      dispatch_once(&qword_101934890, &stru_101894710);
    }
    int v7 = 136446210;
    v8 = "-[CLEEDHelperService dealloc]";
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934898,  2LL,  "#EED2FWK,%{public}s",  &v7,  12);
    v5 = (uint8_t *)v4;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLEEDHelperService dealloc]", "%s\n", v4);
    if (v5 != buf) {
      free(v5);
    }
  }

  -[NSMutableArray removeAllObjects](self->fConnections, "removeAllObjects");

  self->fConnections = 0LL;
  -[NSXPCListener invalidate](self->fListener, "invalidate");

  self->fListener = 0LL;
  _Block_release(self->fPendingRequestsCB);
  self->fPendingRequestsCB = 0LL;
  _Block_release(self->fStreamingRequestCB);
  self->fStreamingRequestCB = 0LL;
  _Block_release(self->fUploadRequestCB);
  self->fUploadRequestCB = 0LL;
  _Block_release(self->fStreamingEndCB);
  self->fStreamingEndCB = 0LL;
  _Block_release(self->fUploadListCB);
  self->fUploadListCB = 0LL;
  _Block_release(self->fHandleResponseCB);
  self->fHandleResponseCB = 0LL;
  _Block_release(self->fFetchMitigationsCB);
  self->fFetchMitigationsCB = 0LL;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CLEEDHelperService;
  -[CLEEDHelperService dealloc](&v6, "dealloc");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  if (qword_101934890 != -1) {
    dispatch_once(&qword_101934890, &stru_101894710);
  }
  objc_super v6 = (os_log_s *)qword_101934898;
  if (os_log_type_enabled((os_log_t)qword_101934898, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v40 = "-[CLEEDHelperService listener:shouldAcceptNewConnection:]";
    __int16 v41 = 1024;
    unsigned int v42 = [a4 processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, client[%d]", buf, 0x12u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934890 != -1) {
      dispatch_once(&qword_101934890, &stru_101894710);
    }
    uint64_t v15 = qword_101934898;
    int v35 = 136446466;
    v36 = "-[CLEEDHelperService listener:shouldAcceptNewConnection:]";
    __int16 v37 = 1024;
    unsigned int v38 = [a4 processIdentifier];
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v15,  0LL,  "#EED2FWK,%{public}s, client[%d]",  &v35,  18);
    v17 = (uint8_t *)v16;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLEEDHelperService listener:shouldAcceptNewConnection:]", "%s\n", v16);
    if (v17 != buf) {
      free(v17);
    }
  }

  if (qword_10199FED0 != -1) {
    dispatch_once(&qword_10199FED0, &stru_1018945D8);
  }
  id v7 = [a4 valueForEntitlement:@"com.apple.locationd.eedhelperservice"];
  if (v7
    && (objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    && [v7 BOOLValue])
  {
    fConnections = self->fConnections;
    if (!fConnections)
    {
      fConnections = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      self->fConnections = fConnections;
    }

    -[NSMutableArray addObject:](fConnections, "addObject:", a4);
    objc_msgSend(a4, "_setQueue:", objc_msgSend(-[CLIntersiloUniverse silo](self->fUniverse, "silo"), "queue"));
    [a4 setExportedInterface:qword_10199FEC0];
    [a4 setExportedObject:self];
    [a4 setRemoteObjectInterface:qword_10199FEC8];
    objc_initWeak(&location, self);
    objc_initWeak(&from, a4);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_10100F6E8;
    v30[3] = &unk_101894600;
    objc_copyWeak(&v31, &location);
    objc_copyWeak(&v32, &from);
    [a4 setInvalidationHandler:v30];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_10100F8F8;
    v28[3] = &unk_10182B328;
    objc_copyWeak(&v29, &from);
    [a4 setInterruptionHandler:v28];
    [a4 activate];
    if (qword_101934890 != -1) {
      dispatch_once(&qword_101934890, &stru_101894710);
    }
    v10 = (os_log_s *)qword_101934898;
    if (os_log_type_enabled((os_log_t)qword_101934898, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v11 = [a4 processIdentifier];
      *(_DWORD *)buf = 136446466;
      v40 = "-[CLEEDHelperService listener:shouldAcceptNewConnection:]";
      __int16 v41 = 1026;
      unsigned int v42 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "#EED2FWK,%{public}s, New connection resumed with pid:%{public}d",  buf,  0x12u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934890 != -1) {
        dispatch_once(&qword_101934890, &stru_101894710);
      }
      uint64_t v22 = qword_101934898;
      unsigned int v23 = [a4 processIdentifier];
      int v35 = 136446466;
      v36 = "-[CLEEDHelperService listener:shouldAcceptNewConnection:]";
      __int16 v37 = 1026;
      unsigned int v38 = v23;
      LODWORD(v27) = 18;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v22,  0LL,  "#EED2FWK,%{public}s, New connection resumed with pid:%{public}d",  &v35,  v27);
      v25 = (uint8_t *)v24;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLEEDHelperService listener:shouldAcceptNewConnection:]", "%s\n", v24);
      if (v25 != buf) {
        free(v25);
      }
    }

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    LOBYTE(v12) = 1;
  }

  else
  {
    if (qword_101934890 != -1) {
      dispatch_once(&qword_101934890, &stru_101894710);
    }
    v13 = (os_log_s *)qword_101934898;
    if (os_log_type_enabled((os_log_t)qword_101934898, OS_LOG_TYPE_ERROR))
    {
      unsigned int v14 = -[NSXPCConnection processIdentifier]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "processIdentifier");
      *(_DWORD *)buf = 136446466;
      v40 = "-[CLEEDHelperService listener:shouldAcceptNewConnection:]";
      __int16 v41 = 1024;
      unsigned int v42 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "#EED2FWK,%{public}s, Error in entilement check. Client[%d] does not have entitlement",  buf,  0x12u);
    }

    BOOL v12 = sub_1002921D0(115, 0);
    if (v12)
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934890 != -1) {
        dispatch_once(&qword_101934890, &stru_101894710);
      }
      uint64_t v18 = qword_101934898;
      unsigned int v19 = -[NSXPCConnection processIdentifier]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "processIdentifier");
      int v35 = 136446466;
      v36 = "-[CLEEDHelperService listener:shouldAcceptNewConnection:]";
      __int16 v37 = 1024;
      unsigned int v38 = v19;
      LODWORD(v27) = 18;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v18,  16LL,  "#EED2FWK,%{public}s, Error in entilement check. Client[%d] does not have entitlement",  &v35,  v27);
      v21 = (uint8_t *)v20;
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLEEDHelperService listener:shouldAcceptNewConnection:]", "%s\n", v20);
      if (v21 != buf) {
        free(v21);
      }
      LOBYTE(v12) = 0;
    }
  }

  return v12;
}

- (void)connectToEEDHelper
{
  if (qword_101934890 != -1) {
    dispatch_once(&qword_101934890, &stru_101894710);
  }
  v2 = (os_log_s *)qword_101934898;
  if (os_log_type_enabled((os_log_t)qword_101934898, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    unsigned int v11 = "-[CLEEDHelperService connectToEEDHelper]";
    __int16 v12 = 1026;
    unsigned int v13 = -[NSXPCConnection processIdentifier]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "processIdentifier");
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEBUG,  "#EED2FWK,%{public}s[client:%{public}d], client connected to CLEEDHelperService",  buf,  0x12u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934890 != -1) {
      dispatch_once(&qword_101934890, &stru_101894710);
    }
    uint64_t v3 = qword_101934898;
    int v6 = 136446466;
    id v7 = "-[CLEEDHelperService connectToEEDHelper]";
    __int16 v8 = 1026;
    unsigned int v9 = -[NSXPCConnection processIdentifier]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "processIdentifier");
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v3,  2LL,  "#EED2FWK,%{public}s[client:%{public}d], client connected to CLEEDHelperService",  &v6,  18);
    v5 = (uint8_t *)v4;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLEEDHelperService connectToEEDHelper]", "%s\n", v4);
    if (v5 != buf) {
      free(v5);
    }
  }

- (void)fetchAllPendingRequestsWithCompletion:(id)a3
{
  if (qword_101934890 != -1) {
    dispatch_once(&qword_101934890, &stru_101894710);
  }
  v5 = (os_log_s *)qword_101934898;
  if (os_log_type_enabled((os_log_t)qword_101934898, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v18 = "-[CLEEDHelperService fetchAllPendingRequestsWithCompletion:]";
    __int16 v19 = 1026;
    unsigned int v20 = -[NSXPCConnection processIdentifier]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "processIdentifier");
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "#EED2FWK,%{public}s[client:%{public}d]",  buf,  0x12u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934890 != -1) {
      dispatch_once(&qword_101934890, &stru_101894710);
    }
    uint64_t v7 = qword_101934898;
    int v13 = 136446466;
    unsigned int v14 = "-[CLEEDHelperService fetchAllPendingRequestsWithCompletion:]";
    __int16 v15 = 1026;
    unsigned int v16 = -[NSXPCConnection processIdentifier]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "processIdentifier");
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v7,  2LL,  "#EED2FWK,%{public}s[client:%{public}d]",  &v13,  18);
    unsigned int v9 = (uint8_t *)v8;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLEEDHelperService fetchAllPendingRequestsWithCompletion:]", "%s\n", v8);
    if (v9 != buf) {
      free(v9);
    }
  }

  dispatch_assert_queue_V2((dispatch_queue_t)objc_msgSend(-[CLIntersiloUniverse silo](self->fUniverse, "silo"), "queue"));
  fPendingRequestsCB = (void (**)(id, void *))self->fPendingRequestsCB;
  if (fPendingRequestsCB)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10100FF94;
    v10[3] = &unk_101894628;
    v10[4] = self;
    v10[5] = a3;
    fPendingRequestsCB[2](fPendingRequestsCB, v10);
  }

  else
  {
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    __int16 v12 = @"EED is unable to service this request";
    (*((void (**)(id, void, NSError *))a3 + 2))( a3,  0LL,  -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.CoreLocation.CLEEDHelperService",  7LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL)));
  }

- (void)fetchCurrentMediaUploadRequestWithCompletion:(id)a3
{
  if (qword_101934890 != -1) {
    dispatch_once(&qword_101934890, &stru_101894710);
  }
  v5 = (os_log_s *)qword_101934898;
  if (os_log_type_enabled((os_log_t)qword_101934898, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v18 = "-[CLEEDHelperService fetchCurrentMediaUploadRequestWithCompletion:]";
    __int16 v19 = 1026;
    unsigned int v20 = -[NSXPCConnection processIdentifier]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "processIdentifier");
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "#EED2FWK,%{public}s[client:%{public}d]",  buf,  0x12u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934890 != -1) {
      dispatch_once(&qword_101934890, &stru_101894710);
    }
    uint64_t v7 = qword_101934898;
    int v13 = 136446466;
    unsigned int v14 = "-[CLEEDHelperService fetchCurrentMediaUploadRequestWithCompletion:]";
    __int16 v15 = 1026;
    unsigned int v16 = -[NSXPCConnection processIdentifier]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "processIdentifier");
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v7,  2LL,  "#EED2FWK,%{public}s[client:%{public}d]",  &v13,  18);
    unsigned int v9 = (uint8_t *)v8;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLEEDHelperService fetchCurrentMediaUploadRequestWithCompletion:]",  "%s\n",  v8);
    if (v9 != buf) {
      free(v9);
    }
  }

  dispatch_assert_queue_V2((dispatch_queue_t)objc_msgSend(-[CLIntersiloUniverse silo](self->fUniverse, "silo"), "queue"));
  fUploadRequestCB = (void (**)(id, void *))self->fUploadRequestCB;
  if (fUploadRequestCB)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_101010460;
    v10[3] = &unk_101894650;
    v10[4] = self;
    v10[5] = a3;
    fUploadRequestCB[2](fUploadRequestCB, v10);
  }

  else
  {
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    __int16 v12 = @"EED is unable to service this request";
    (*((void (**)(id, void, NSError *))a3 + 2))( a3,  0LL,  -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.CoreLocation.CLEEDHelperService",  7LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL)));
  }

- (void)fetchCurrentStreamingRequestWithCompletion:(id)a3
{
  if (qword_101934890 != -1) {
    dispatch_once(&qword_101934890, &stru_101894710);
  }
  v5 = (os_log_s *)qword_101934898;
  if (os_log_type_enabled((os_log_t)qword_101934898, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v18 = "-[CLEEDHelperService fetchCurrentStreamingRequestWithCompletion:]";
    __int16 v19 = 1026;
    unsigned int v20 = -[NSXPCConnection processIdentifier]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "processIdentifier");
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "#EED2FWK,%{public}s[client:%{public}d]",  buf,  0x12u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934890 != -1) {
      dispatch_once(&qword_101934890, &stru_101894710);
    }
    uint64_t v7 = qword_101934898;
    int v13 = 136446466;
    unsigned int v14 = "-[CLEEDHelperService fetchCurrentStreamingRequestWithCompletion:]";
    __int16 v15 = 1026;
    unsigned int v16 = -[NSXPCConnection processIdentifier]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "processIdentifier");
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v7,  2LL,  "#EED2FWK,%{public}s[client:%{public}d]",  &v13,  18);
    unsigned int v9 = (uint8_t *)v8;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLEEDHelperService fetchCurrentStreamingRequestWithCompletion:]",  "%s\n",  v8);
    if (v9 != buf) {
      free(v9);
    }
  }

  dispatch_assert_queue_V2((dispatch_queue_t)objc_msgSend(-[CLIntersiloUniverse silo](self->fUniverse, "silo"), "queue"));
  fStreamingRequestCB = (void (**)(id, void *))self->fStreamingRequestCB;
  if (fStreamingRequestCB)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_101010934;
    v10[3] = &unk_101894678;
    v10[4] = self;
    v10[5] = a3;
    fStreamingRequestCB[2](fStreamingRequestCB, v10);
  }

  else
  {
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    __int16 v12 = @"EED is unable to service this request";
    (*((void (**)(id, void, NSError *))a3 + 2))( a3,  0LL,  -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.CoreLocation.CLEEDHelperService",  7LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL)));
  }

- (void)fetchMitigationsWithCompletion:(id)a3
{
  if (qword_101934890 != -1) {
    dispatch_once(&qword_101934890, &stru_101894710);
  }
  v5 = (os_log_s *)qword_101934898;
  if (os_log_type_enabled((os_log_t)qword_101934898, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v18 = "-[CLEEDHelperService fetchMitigationsWithCompletion:]";
    __int16 v19 = 1026;
    unsigned int v20 = -[NSXPCConnection processIdentifier]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "processIdentifier");
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "#EED2FWK,%{public}s[client:%{public}d]",  buf,  0x12u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934890 != -1) {
      dispatch_once(&qword_101934890, &stru_101894710);
    }
    uint64_t v7 = qword_101934898;
    int v13 = 136446466;
    unsigned int v14 = "-[CLEEDHelperService fetchMitigationsWithCompletion:]";
    __int16 v15 = 1026;
    unsigned int v16 = -[NSXPCConnection processIdentifier]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "processIdentifier");
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v7,  2LL,  "#EED2FWK,%{public}s[client:%{public}d]",  &v13,  18);
    unsigned int v9 = (uint8_t *)v8;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLEEDHelperService fetchMitigationsWithCompletion:]", "%s\n", v8);
    if (v9 != buf) {
      free(v9);
    }
  }

  dispatch_assert_queue_V2((dispatch_queue_t)objc_msgSend(-[CLIntersiloUniverse silo](self->fUniverse, "silo"), "queue"));
  fFetchMitigationsCB = (void (**)(id, void *))self->fFetchMitigationsCB;
  if (fFetchMitigationsCB)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_101010E00;
    v10[3] = &unk_1018946A0;
    v10[4] = self;
    v10[5] = a3;
    fFetchMitigationsCB[2](fFetchMitigationsCB, v10);
  }

  else
  {
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    __int16 v12 = @"EED is unable to service this request";
    (*((void (**)(id, void, NSError *))a3 + 2))( a3,  0LL,  -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.CoreLocation.CLEEDHelperService",  7LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL)));
  }

- (void)mediaUploadList:(id)a3 forRequestID:(id)a4 completion:(id)a5
{
  if (qword_101934890 != -1) {
    dispatch_once(&qword_101934890, &stru_101894710);
  }
  unsigned int v9 = (os_log_s *)qword_101934898;
  if (os_log_type_enabled((os_log_t)qword_101934898, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    v28 = "-[CLEEDHelperService mediaUploadList:forRequestID:completion:]";
    __int16 v29 = 1026;
    LODWORD(v30) = -[NSXPCConnection processIdentifier]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "processIdentifier");
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "#EED2FWK,%{public}s[client:%{public}d]",  buf,  0x12u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934890 != -1) {
      dispatch_once(&qword_101934890, &stru_101894710);
    }
    uint64_t v12 = qword_101934898;
    int v21 = 136446466;
    uint64_t v22 = "-[CLEEDHelperService mediaUploadList:forRequestID:completion:]";
    __int16 v23 = 1026;
    LODWORD(v24) = -[NSXPCConnection processIdentifier]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "processIdentifier");
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v12,  2LL,  "#EED2FWK,%{public}s[client:%{public}d]",  &v21,  18);
    unsigned int v14 = (uint8_t *)v13;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLEEDHelperService mediaUploadList:forRequestID:completion:]", "%s\n", v13);
    if (v14 != buf) {
      free(v14);
    }
  }

  dispatch_assert_queue_V2((dispatch_queue_t)objc_msgSend(-[CLIntersiloUniverse silo](self->fUniverse, "silo"), "queue"));
  if (qword_101934890 != -1) {
    dispatch_once(&qword_101934890, &stru_101894710);
  }
  v10 = (os_log_s *)qword_101934898;
  if (os_log_type_enabled((os_log_t)qword_101934898, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446723;
    v28 = "-[CLEEDHelperService mediaUploadList:forRequestID:completion:]";
    __int16 v29 = 2113;
    id v30 = a3;
    __int16 v31 = 2114;
    id v32 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "#EED2FWK,%{public}s, received mediaUploadList:%{private}@ forRequestID:%{public}@",  buf,  0x20u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934890 != -1) {
      dispatch_once(&qword_101934890, &stru_101894710);
    }
    int v21 = 136446723;
    uint64_t v22 = "-[CLEEDHelperService mediaUploadList:forRequestID:completion:]";
    __int16 v23 = 2113;
    id v24 = a3;
    __int16 v25 = 2114;
    id v26 = a4;
    LODWORD(v17) = 32;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934898,  2LL,  "#EED2FWK,%{public}s, received mediaUploadList:%{private}@ forRequestID:%{public}@",  &v21,  v17);
    unsigned int v16 = (uint8_t *)v15;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLEEDHelperService mediaUploadList:forRequestID:completion:]", "%s\n", v15);
    if (v16 != buf) {
      free(v16);
    }
  }

  fUploadListCB = (void (**)(id, id, id, void *))self->fUploadListCB;
  if (fUploadListCB)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_101011464;
    v18[3] = &unk_1018946C8;
    v18[4] = self;
    v18[5] = a5;
    fUploadListCB[2](fUploadListCB, a3, a4, v18);
  }

  else
  {
    NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
    unsigned int v20 = @"EED is unable to service this request";
    (*((void (**)(id, NSError *))a5 + 2))( a5,  -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.CoreLocation.CLEEDHelperService",  7LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL)));
  }

- (void)streamingSessionEndedForRequestID:(id)a3 completion:(id)a4
{
  if (qword_101934890 != -1) {
    dispatch_once(&qword_101934890, &stru_101894710);
  }
  uint64_t v7 = (os_log_s *)qword_101934898;
  if (os_log_type_enabled((os_log_t)qword_101934898, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    id v24 = "-[CLEEDHelperService streamingSessionEndedForRequestID:completion:]";
    __int16 v25 = 1026;
    LODWORD(v26) = -[NSXPCConnection processIdentifier]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "processIdentifier");
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "#EED2FWK,%{public}s[client:%{public}d]",  buf,  0x12u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934890 != -1) {
      dispatch_once(&qword_101934890, &stru_101894710);
    }
    uint64_t v10 = qword_101934898;
    int v19 = 136446466;
    unsigned int v20 = "-[CLEEDHelperService streamingSessionEndedForRequestID:completion:]";
    __int16 v21 = 1026;
    LODWORD(v22) = -[NSXPCConnection processIdentifier]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "processIdentifier");
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v10,  2LL,  "#EED2FWK,%{public}s[client:%{public}d]",  &v19,  18);
    uint64_t v12 = (uint8_t *)v11;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLEEDHelperService streamingSessionEndedForRequestID:completion:]",  "%s\n",  v11);
    if (v12 != buf) {
      free(v12);
    }
  }

  dispatch_assert_queue_V2((dispatch_queue_t)objc_msgSend(-[CLIntersiloUniverse silo](self->fUniverse, "silo"), "queue"));
  if (qword_101934890 != -1) {
    dispatch_once(&qword_101934890, &stru_101894710);
  }
  __int16 v8 = (os_log_s *)qword_101934898;
  if (os_log_type_enabled((os_log_t)qword_101934898, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    id v24 = "-[CLEEDHelperService streamingSessionEndedForRequestID:completion:]";
    __int16 v25 = 2114;
    id v26 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "#EED2FWK,%{public}s, received streamingSessionEndedForRequestID:%{public}@",  buf,  0x16u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934890 != -1) {
      dispatch_once(&qword_101934890, &stru_101894710);
    }
    int v19 = 136446466;
    unsigned int v20 = "-[CLEEDHelperService streamingSessionEndedForRequestID:completion:]";
    __int16 v21 = 2114;
    id v22 = a3;
    LODWORD(v15) = 22;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934898,  2LL,  "#EED2FWK,%{public}s, received streamingSessionEndedForRequestID:%{public}@",  &v19,  v15);
    unsigned int v14 = (uint8_t *)v13;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLEEDHelperService streamingSessionEndedForRequestID:completion:]",  "%s\n",  v13);
    if (v14 != buf) {
      free(v14);
    }
  }

  fStreamingEndCB = (void (**)(id, id, void *))self->fStreamingEndCB;
  if (fStreamingEndCB)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_101011A88;
    v16[3] = &unk_1018946C8;
    v16[4] = self;
    v16[5] = a4;
    fStreamingEndCB[2](fStreamingEndCB, a3, v16);
  }

  else
  {
    NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
    uint64_t v18 = @"EED is unable to service this request";
    (*((void (**)(id, NSError *))a4 + 2))( a4,  -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.CoreLocation.CLEEDHelperService",  7LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL)));
  }

- (void)handleResponse:(BOOL)a3 forRequest:(id)a4 completion:(id)a5
{
  BOOL v7 = a3;
  if (qword_101934890 != -1) {
    dispatch_once(&qword_101934890, &stru_101894710);
  }
  unsigned int v9 = (os_log_s *)qword_101934898;
  if (os_log_type_enabled((os_log_t)qword_101934898, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    v28 = "-[CLEEDHelperService handleResponse:forRequest:completion:]";
    __int16 v29 = 1026;
    unsigned int v30 = -[NSXPCConnection processIdentifier]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "processIdentifier");
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "#EED2FWK,%{public}s[client:%{public}d]",  buf,  0x12u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934890 != -1) {
      dispatch_once(&qword_101934890, &stru_101894710);
    }
    uint64_t v12 = qword_101934898;
    int v21 = 136446466;
    id v22 = "-[CLEEDHelperService handleResponse:forRequest:completion:]";
    __int16 v23 = 1026;
    unsigned int v24 = -[NSXPCConnection processIdentifier]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "processIdentifier");
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v12,  2LL,  "#EED2FWK,%{public}s[client:%{public}d]",  &v21,  18);
    unsigned int v14 = (uint8_t *)v13;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLEEDHelperService handleResponse:forRequest:completion:]", "%s\n", v13);
    if (v14 != buf) {
      free(v14);
    }
  }

  dispatch_assert_queue_V2((dispatch_queue_t)objc_msgSend(-[CLIntersiloUniverse silo](self->fUniverse, "silo"), "queue"));
  if (qword_101934890 != -1) {
    dispatch_once(&qword_101934890, &stru_101894710);
  }
  uint64_t v10 = (os_log_s *)qword_101934898;
  if (os_log_type_enabled((os_log_t)qword_101934898, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446722;
    v28 = "-[CLEEDHelperService handleResponse:forRequest:completion:]";
    __int16 v29 = 1026;
    unsigned int v30 = v7;
    __int16 v31 = 2114;
    id v32 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "#EED2FWK,%{public}s, received handleResponse:%{public}u forRequestID:%{public}@",  buf,  0x1Cu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934890 != -1) {
      dispatch_once(&qword_101934890, &stru_101894710);
    }
    int v21 = 136446722;
    id v22 = "-[CLEEDHelperService handleResponse:forRequest:completion:]";
    __int16 v23 = 1026;
    unsigned int v24 = v7;
    __int16 v25 = 2114;
    id v26 = a4;
    LODWORD(v17) = 28;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934898,  2LL,  "#EED2FWK,%{public}s, received handleResponse:%{public}u forRequestID:%{public}@",  &v21,  v17);
    unsigned int v16 = (uint8_t *)v15;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLEEDHelperService handleResponse:forRequest:completion:]", "%s\n", v15);
    if (v16 != buf) {
      free(v16);
    }
  }

  fHandleResponseCB = (void (**)(id, BOOL, id, void *))self->fHandleResponseCB;
  if (fHandleResponseCB)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1010120D0;
    v18[3] = &unk_1018946F0;
    v18[4] = self;
    v18[5] = a5;
    fHandleResponseCB[2](fHandleResponseCB, v7, a4, v18);
  }

  else
  {
    NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
    unsigned int v20 = @"EED is unable to service this request";
    (*((void (**)(id, void, NSError *))a5 + 2))( a5,  0LL,  -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.CoreLocation.CLEEDHelperService",  7LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL)));
  }

- (BOOL)notifyNewRequestAvailable
{
  if (qword_101934890 != -1) {
    dispatch_once(&qword_101934890, &stru_101894710);
  }
  uint64_t v3 = (os_log_s *)qword_101934898;
  if (os_log_type_enabled((os_log_t)qword_101934898, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446210;
    __int16 v37 = "-[CLEEDHelperService notifyNewRequestAvailable]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s", buf, 0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934890 != -1) {
      dispatch_once(&qword_101934890, &stru_101894710);
    }
    int v29 = 136446210;
    unsigned int v30 = "-[CLEEDHelperService notifyNewRequestAvailable]";
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934898,  2LL,  "#EED2FWK,%{public}s",  &v29,  12);
    NSErrorUserInfoKey v19 = (uint8_t *)v18;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLEEDHelperService notifyNewRequestAvailable]", "%s\n", v18);
    if (v19 != buf) {
      free(v19);
    }
  }

  dispatch_assert_queue_V2((dispatch_queue_t)objc_msgSend(-[CLIntersiloUniverse silo](self->fUniverse, "silo"), "queue"));
  fConnections = self->fConnections;
  if (fConnections)
  {
    fConnections = (NSMutableArray *)-[NSMutableArray count](fConnections, "count");
    if (fConnections)
    {
      if (qword_101934890 != -1) {
        dispatch_once(&qword_101934890, &stru_101894710);
      }
      v5 = (os_log_s *)qword_101934898;
      if (os_log_type_enabled((os_log_t)qword_101934898, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446210;
        __int16 v37 = "-[CLEEDHelperService notifyNewRequestAvailable]";
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "#EED2FWK,%{public}s, received notifyNewRequestAvailable request from EED",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934890 != -1) {
          dispatch_once(&qword_101934890, &stru_101894710);
        }
        int v29 = 136446210;
        unsigned int v30 = "-[CLEEDHelperService notifyNewRequestAvailable]";
        LODWORD(v23) = 12;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934898,  2LL,  "#EED2FWK,%{public}s, received notifyNewRequestAvailable request from EED",  &v29,  v23);
        int v21 = (uint8_t *)v20;
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLEEDHelperService notifyNewRequestAvailable]", "%s\n", v20);
        if (v21 != buf) {
          free(v21);
        }
      }

      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      int v6 = self->fConnections;
      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v25,  v35,  16LL);
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v26;
        do
        {
          uint64_t v10 = 0LL;
          do
          {
            if (*(void *)v26 != v9) {
              objc_enumerationMutation(v6);
            }
            NSErrorUserInfoKey v11 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)v10);
            v24[0] = _NSConcreteStackBlock;
            v24[1] = 3221225472LL;
            v24[2] = sub_101012898;
            v24[3] = &unk_101830628;
            v24[4] = v11;
            id v12 = [v11 remoteObjectProxyWithErrorHandler:v24];
            if (v12)
            {
              int v13 = v12;
              if (qword_101934890 != -1) {
                dispatch_once(&qword_101934890, &stru_101894710);
              }
              unsigned int v14 = (os_log_s *)qword_101934898;
              if (os_log_type_enabled((os_log_t)qword_101934898, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136446722;
                __int16 v37 = "-[CLEEDHelperService notifyNewRequestAvailable]";
                __int16 v38 = 2114;
                v39 = v11;
                __int16 v40 = 2114;
                __int16 v41 = v13;
                _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "#EED2FWK,%{public}s, notifying connection:%{public}@, remote:%{public}@",  buf,  0x20u);
              }

              if (sub_1002921D0(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_101934890 != -1) {
                  dispatch_once(&qword_101934890, &stru_101894710);
                }
                int v29 = 136446722;
                unsigned int v30 = "-[CLEEDHelperService notifyNewRequestAvailable]";
                __int16 v31 = 2114;
                id v32 = v11;
                __int16 v33 = 2114;
                int v34 = v13;
                LODWORD(v23) = 32;
                _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934898,  0LL,  "#EED2FWK,%{public}s, notifying connection:%{public}@, remote:%{public}@",  &v29,  v23);
                unsigned int v16 = (uint8_t *)v15;
                sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLEEDHelperService notifyNewRequestAvailable]", "%s\n", v15);
                if (v16 != buf) {
                  free(v16);
                }
              }

              [v13 notifyNewRequestAvailable];
            }

            uint64_t v10 = (char *)v10 + 1;
          }

          while (v8 != v10);
          id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v25,  v35,  16LL);
          id v8 = v17;
        }

        while (v17);
      }

      LOBYTE(fConnections) = 1;
    }
  }

  return (char)fConnections;
}

- (BOOL)notifyMitigationNeeded:(id)a3
{
  if (qword_101934890 != -1) {
    dispatch_once(&qword_101934890, &stru_101894710);
  }
  v4 = (os_log_s *)qword_101934898;
  if (os_log_type_enabled((os_log_t)qword_101934898, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446210;
    v39 = "-[CLEEDHelperService notifyMitigationNeeded:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s", buf, 0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934890 != -1) {
      dispatch_once(&qword_101934890, &stru_101894710);
    }
    int v31 = 136446210;
    id v32 = "-[CLEEDHelperService notifyMitigationNeeded:]";
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934898,  2LL,  "#EED2FWK,%{public}s",  &v31,  12);
    unsigned int v20 = (uint8_t *)v19;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLEEDHelperService notifyMitigationNeeded:]", "%s\n", v19);
    if (v20 != buf) {
      free(v20);
    }
  }

  dispatch_assert_queue_V2((dispatch_queue_t)objc_msgSend(-[CLIntersiloUniverse silo](self->fUniverse, "silo"), "queue"));
  fConnections = self->fConnections;
  if (fConnections)
  {
    fConnections = (NSMutableArray *)-[NSMutableArray count](fConnections, "count");
    if (fConnections)
    {
      if (qword_101934890 != -1) {
        dispatch_once(&qword_101934890, &stru_101894710);
      }
      int v6 = (os_log_s *)qword_101934898;
      if (os_log_type_enabled((os_log_t)qword_101934898, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        v39 = "-[CLEEDHelperService notifyMitigationNeeded:]";
        __int16 v40 = 2114;
        id v41 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "#EED2FWK,%{public}s, received notifyMitigationNeeded:%{public}@ from EED",  buf,  0x16u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934890 != -1) {
          dispatch_once(&qword_101934890, &stru_101894710);
        }
        int v31 = 136446466;
        id v32 = "-[CLEEDHelperService notifyMitigationNeeded:]";
        __int16 v33 = 2114;
        id v34 = a3;
        LODWORD(v24) = 22;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934898,  2LL,  "#EED2FWK,%{public}s, received notifyMitigationNeeded:%{public}@ from EED",  &v31,  v24);
        id v22 = (uint8_t *)v21;
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLEEDHelperService notifyMitigationNeeded:]", "%s\n", v21);
        if (v22 != buf) {
          free(v22);
        }
      }

      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      id v7 = self->fConnections;
      id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v27,  v37,  16LL);
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v28;
        do
        {
          NSErrorUserInfoKey v11 = 0LL;
          do
          {
            if (*(void *)v28 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)v11);
            v26[0] = _NSConcreteStackBlock;
            v26[1] = 3221225472LL;
            v26[2] = sub_1010130DC;
            v26[3] = &unk_101830628;
            v26[4] = v12;
            id v13 = [v12 remoteObjectProxyWithErrorHandler:v26];
            if (v13)
            {
              unsigned int v14 = v13;
              if ((objc_opt_respondsToSelector(v13, "notifyMitigationNeeded:") & 1) != 0)
              {
                if (qword_101934890 != -1) {
                  dispatch_once(&qword_101934890, &stru_101894710);
                }
                uint64_t v15 = (os_log_s *)qword_101934898;
                if (os_log_type_enabled((os_log_t)qword_101934898, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136446722;
                  v39 = "-[CLEEDHelperService notifyMitigationNeeded:]";
                  __int16 v40 = 2114;
                  id v41 = v12;
                  __int16 v42 = 2114;
                  v43 = v14;
                  _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "#EED2FWK,%{public}s, notifying connection:%{public}@, remote:%{public}@",  buf,  0x20u);
                }

                if (sub_1002921D0(115, 2))
                {
                  bzero(buf, 0x65CuLL);
                  if (qword_101934890 != -1) {
                    dispatch_once(&qword_101934890, &stru_101894710);
                  }
                  int v31 = 136446722;
                  id v32 = "-[CLEEDHelperService notifyMitigationNeeded:]";
                  __int16 v33 = 2114;
                  id v34 = v12;
                  __int16 v35 = 2114;
                  v36 = v14;
                  LODWORD(v24) = 32;
                  _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934898,  0LL,  "#EED2FWK,%{public}s, notifying connection:%{public}@, remote:%{public}@",  &v31,  v24);
                  id v17 = (uint8_t *)v16;
                  sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLEEDHelperService notifyMitigationNeeded:]", "%s\n", v16);
                  if (v17 != buf) {
                    free(v17);
                  }
                }

                [v14 notifyMitigationNeeded:a3];
              }
            }

            NSErrorUserInfoKey v11 = (char *)v11 + 1;
          }

          while (v9 != v11);
          id v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v27,  v37,  16LL);
          id v9 = v18;
        }

        while (v18);
      }

      LOBYTE(fConnections) = 1;
    }
  }

  return (char)fConnections;
}

@end
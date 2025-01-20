@interface CLEEDMediaServiceHandler
- (CLEEDMediaServiceHandler)initWithUniverse:(id)a3 serviceCompletionCB:(id)a4 getMitigationCB:(id)a5 getUploadConfigCB:(id)a6 errorCB:(id)a7;
- (void)cleanup;
- (void)connectToMediaService;
- (void)dealloc;
- (void)handleRemoteProxyError:(id)a3 forProcessIdentifier:(int)a4;
- (void)notifyProcessingCompletion;
- (void)processMediaEndOfExtendedSessionNotification;
- (void)processMediaForMitigations:(id)a3;
- (void)processMediaForRequestID:(id)a3 callUUID:(id)a4 uploadURL:(id)a5 sharedInfoPrefix:(id)a6 combinedSecret:(id)a7 token:(id)a8 mediaList:(id)a9 mitigation:(id)a10 completion:(id)a11;
@end

@implementation CLEEDMediaServiceHandler

- (CLEEDMediaServiceHandler)initWithUniverse:(id)a3 serviceCompletionCB:(id)a4 getMitigationCB:(id)a5 getUploadConfigCB:(id)a6 errorCB:(id)a7
{
  return 0LL;
}

- (void)dealloc
{
  if (qword_101934890 != -1) {
    dispatch_once(&qword_101934890, &stru_10188E198);
  }
  v3 = (os_log_s *)qword_101934898;
  if (os_log_type_enabled((os_log_t)qword_101934898, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v15 = "-[CLEEDMediaServiceHandler dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s", buf, 0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934890 != -1) {
      dispatch_once(&qword_101934890, &stru_10188E198);
    }
    int v12 = 136446210;
    v13 = "-[CLEEDMediaServiceHandler dealloc]";
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934898,  0LL,  "#EED2FWK,%{public}s",  &v12,  12);
    v10 = (uint8_t *)v9;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLEEDMediaServiceHandler dealloc]", "%s\n", v9);
    if (v10 != buf) {
      free(v10);
    }
  }

  fConnection = self->fConnection;
  if (fConnection)
  {

    self->fConnection = 0LL;
  }

  id fCompletionCallback = self->fCompletionCallback;
  if (fCompletionCallback)
  {
    _Block_release(fCompletionCallback);
    self->id fCompletionCallback = 0LL;
  }

  id fErrorCallback = self->fErrorCallback;
  if (fErrorCallback)
  {
    _Block_release(fErrorCallback);
    self->id fErrorCallback = 0LL;
  }

  id fGetMitigationCallback = self->fGetMitigationCallback;
  if (fGetMitigationCallback)
  {
    _Block_release(fGetMitigationCallback);
    self->id fGetMitigationCallback = 0LL;
  }

  id fGetUploadConfigCallback = self->fGetUploadConfigCallback;
  if (fGetUploadConfigCallback)
  {
    _Block_release(fGetUploadConfigCallback);
    self->id fGetUploadConfigCallback = 0LL;
  }

  self->fUniverse = 0LL;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CLEEDMediaServiceHandler;
  -[CLEEDMediaServiceHandler dealloc](&v11, "dealloc");
}

- (void)connectToMediaService
{
  if (qword_101934890 != -1) {
    dispatch_once(&qword_101934890, &stru_10188E198);
  }
  v3 = (os_log_s *)qword_101934898;
  if (os_log_type_enabled((os_log_t)qword_101934898, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v24 = "-[CLEEDMediaServiceHandler connectToMediaService]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s", buf, 0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934890 != -1) {
      dispatch_once(&qword_101934890, &stru_10188E198);
    }
    int v21 = 136446210;
    v22 = "-[CLEEDMediaServiceHandler connectToMediaService]";
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934898,  0LL,  "#EED2FWK,%{public}s",  &v21,  12);
    objc_super v11 = (uint8_t *)v10;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLEEDMediaServiceHandler connectToMediaService]", "%s\n", v10);
    if (v11 != buf) {
      free(v11);
    }
  }

  if (qword_10199F6B0 != -1) {
    dispatch_once(&qword_10199F6B0, &stru_10188E130);
  }
  if (!self->fConnection)
  {
    v4 = -[NSXPCConnection initWithServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithServiceName:",  @"com.apple.corelocation.eedmediaservice");
    self->fConnection = v4;
    -[NSXPCConnection setRemoteObjectInterface:](v4, "setRemoteObjectInterface:", qword_10199F6A0);
    -[NSXPCConnection setExportedInterface:](self->fConnection, "setExportedInterface:", qword_10199F6A8);
    -[NSXPCConnection setExportedObject:](self->fConnection, "setExportedObject:", self);
    -[NSXPCConnection _setQueue:]( self->fConnection,  "_setQueue:",  objc_msgSend(-[CLIntersiloUniverse silo](self->fUniverse, "silo"), "queue"));
    -[NSXPCConnection setInvalidationHandler:](self->fConnection, "setInvalidationHandler:", &stru_10188E150);
    objc_initWeak(&location, self);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100F5544C;
    v18[3] = &unk_10188E178;
    objc_copyWeak(&v19, &location);
    v18[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->fConnection, "setInterruptionHandler:", v18);
    -[NSXPCConnection activate](self->fConnection, "activate");
    if (qword_101934890 != -1) {
      dispatch_once(&qword_101934890, &stru_10188E198);
    }
    v5 = (os_log_s *)qword_101934898;
    if (os_log_type_enabled((os_log_t)qword_101934898, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v24 = "-[CLEEDMediaServiceHandler connectToMediaService]";
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#EED2FWK,%{public}s, connection to EEDMediaService configured",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934890 != -1) {
        dispatch_once(&qword_101934890, &stru_10188E198);
      }
      int v21 = 136446210;
      v22 = "-[CLEEDMediaServiceHandler connectToMediaService]";
      LODWORD(v16) = 12;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934898,  0LL,  "#EED2FWK,%{public}s, connection to EEDMediaService configured",  &v21,  v16);
      v13 = (uint8_t *)v12;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLEEDMediaServiceHandler connectToMediaService]", "%s\n", v12);
      if (v13 != buf) {
        free(v13);
      }
    }

    uint64_t v6 = (*((uint64_t (**)(void))self->fGetMitigationCallback + 2))();
    uint64_t v7 = (*((uint64_t (**)(void))self->fGetUploadConfigCallback + 2))();
    fConnection = self->fConnection;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100F55808;
    v17[3] = &unk_101830628;
    v17[4] = self;
    objc_msgSend( -[NSXPCConnection remoteObjectProxyWithErrorHandler:](fConnection, "remoteObjectProxyWithErrorHandler:", v17),  "connectToMediaService:uploadConfig:",  v6,  v7);
    if (qword_101934890 != -1) {
      dispatch_once(&qword_101934890, &stru_10188E198);
    }
    v9 = (os_log_s *)qword_101934898;
    if (os_log_type_enabled((os_log_t)qword_101934898, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v24 = "-[CLEEDMediaServiceHandler connectToMediaService]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "#EED2FWK,%{public}s, establishing connection to EEDMediaService",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934890 != -1) {
        dispatch_once(&qword_101934890, &stru_10188E198);
      }
      int v21 = 136446210;
      v22 = "-[CLEEDMediaServiceHandler connectToMediaService]";
      LODWORD(v16) = 12;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934898,  0LL,  "#EED2FWK,%{public}s, establishing connection to EEDMediaService",  &v21,  v16);
      v15 = (uint8_t *)v14;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLEEDMediaServiceHandler connectToMediaService]", "%s\n", v14);
      if (v15 != buf) {
        free(v15);
      }
    }

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

- (void)handleRemoteProxyError:(id)a3 forProcessIdentifier:(int)a4
{
  if (qword_101934890 != -1) {
    dispatch_once(&qword_101934890, &stru_10188E198);
  }
  uint64_t v7 = (os_log_s *)qword_101934898;
  if (os_log_type_enabled((os_log_t)qword_101934898, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    int v21 = "-[CLEEDMediaServiceHandler handleRemoteProxyError:forProcessIdentifier:]";
    __int16 v22 = 1026;
    int v23 = a4;
    __int16 v24 = 2114;
    id v25 = [a3 localizedDescription];
    __int16 v26 = 2114;
    id v27 = [a3 localizedFailureReason];
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "#EED2FWK,%{public}s[%{public}d]: %{public}@ %{public}@\n",  buf,  0x26u);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934890 != -1) {
      dispatch_once(&qword_101934890, &stru_10188E198);
    }
    uint64_t v9 = qword_101934898;
    int v12 = 136446978;
    v13 = "-[CLEEDMediaServiceHandler handleRemoteProxyError:forProcessIdentifier:]";
    __int16 v14 = 1026;
    int v15 = a4;
    __int16 v16 = 2114;
    id v17 = [a3 localizedDescription];
    __int16 v18 = 2114;
    id v19 = [a3 localizedFailureReason];
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v9,  16LL,  "#EED2FWK,%{public}s[%{public}d]: %{public}@ %{public}@\n",  &v12,  38);
    objc_super v11 = (uint8_t *)v10;
    sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLEEDMediaServiceHandler handleRemoteProxyError:forProcessIdentifier:]",  "%s\n",  v10);
    if (v11 != buf) {
      free(v11);
    }
  }

  id fErrorCallback = (void (**)(id, id))self->fErrorCallback;
  if (fErrorCallback) {
    fErrorCallback[2](fErrorCallback, a3);
  }
}

- (void)cleanup
{
  if (qword_101934890 != -1) {
    dispatch_once(&qword_101934890, &stru_10188E198);
  }
  v3 = (os_log_s *)qword_101934898;
  if (os_log_type_enabled((os_log_t)qword_101934898, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446210;
    __int16 v18 = "-[CLEEDMediaServiceHandler cleanup]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s", buf, 0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934890 != -1) {
      dispatch_once(&qword_101934890, &stru_10188E198);
    }
    int v13 = 136446210;
    __int16 v14 = "-[CLEEDMediaServiceHandler cleanup]";
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934898,  2LL,  "#EED2FWK,%{public}s",  &v13,  12);
    v8 = (uint8_t *)v7;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLEEDMediaServiceHandler cleanup]", "%s\n", v7);
    if (v8 != buf) {
      free(v8);
    }
  }

  fConnection = self->fConnection;
  if (fConnection)
  {
    -[NSXPCConnection invalidate](fConnection, "invalidate");
    if (qword_101934890 != -1) {
      dispatch_once(&qword_101934890, &stru_10188E198);
    }
    v5 = (os_log_s *)qword_101934898;
    if (os_log_type_enabled((os_log_t)qword_101934898, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = self->fConnection;
      *(_DWORD *)buf = 136446466;
      __int16 v18 = "-[CLEEDMediaServiceHandler cleanup]";
      __int16 v19 = 2114;
      v20 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#EED2FWK,%{public}s, client[%{public}@] disconnected from EEDMediaService",  buf,  0x16u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934890 != -1) {
        dispatch_once(&qword_101934890, &stru_10188E198);
      }
      uint64_t v9 = self->fConnection;
      int v13 = 136446466;
      __int16 v14 = "-[CLEEDMediaServiceHandler cleanup]";
      __int16 v15 = 2114;
      __int16 v16 = v9;
      LODWORD(v12) = 22;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934898,  0LL,  "#EED2FWK,%{public}s, client[%{public}@] disconnected from EEDMediaService",  &v13,  v12);
      objc_super v11 = (uint8_t *)v10;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLEEDMediaServiceHandler cleanup]", "%s\n", v10);
      if (v11 != buf) {
        free(v11);
      }
    }
  }

- (void)processMediaForRequestID:(id)a3 callUUID:(id)a4 uploadURL:(id)a5 sharedInfoPrefix:(id)a6 combinedSecret:(id)a7 token:(id)a8 mediaList:(id)a9 mitigation:(id)a10 completion:(id)a11
{
  if (qword_101934890 != -1) {
    dispatch_once(&qword_101934890, &stru_10188E198);
  }
  __int16 v15 = (os_log_s *)qword_101934898;
  if (os_log_type_enabled((os_log_t)qword_101934898, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136448259;
    v45 = "-[CLEEDMediaServiceHandler processMediaForRequestID:callUUID:uploadURL:sharedInfoPrefix:combinedSecret:token:m"
          "ediaList:mitigation:completion:]";
    __int16 v46 = 2114;
    id v47 = a3;
    __int16 v48 = 2114;
    id v49 = a4;
    __int16 v50 = 2114;
    id v51 = a5;
    __int16 v52 = 2113;
    id v53 = a6;
    __int16 v54 = 2113;
    id v55 = a7;
    __int16 v56 = 2113;
    id v57 = a8;
    __int16 v58 = 2114;
    id v59 = a10;
    __int16 v60 = 2114;
    id v61 = a9;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "#EED2FWK,%{public}s, requestID:%{public}@, callUUID:%{public}@, url:%{public}@, prefix:%{private}@, combinedsecret :%{private}@, token:%{private}@, mitigation:%{public}@, mediaList:%{public}@",  buf,  0x5Cu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934890 != -1) {
      dispatch_once(&qword_101934890, &stru_10188E198);
    }
    int v26 = 136448259;
    id v27 = "-[CLEEDMediaServiceHandler processMediaForRequestID:callUUID:uploadURL:sharedInfoPrefix:combinedSecret:token:m"
          "ediaList:mitigation:completion:]";
    __int16 v28 = 2114;
    id v29 = a3;
    __int16 v30 = 2114;
    id v31 = a4;
    __int16 v32 = 2114;
    id v33 = a5;
    __int16 v34 = 2113;
    id v35 = a6;
    __int16 v36 = 2113;
    id v37 = a7;
    __int16 v38 = 2113;
    id v39 = a8;
    __int16 v40 = 2114;
    id v41 = a10;
    __int16 v42 = 2114;
    id v43 = a9;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934898,  2LL,  "#EED2FWK,%{public}s, requestID:%{public}@, callUUID:%{public}@, url:%{public}@, prefix:%{private}@, combinedsecret :%{private}@, token:%{private}@, mitigation:%{public}@, mediaList:%{public}@",  &v26,  92);
    __int16 v18 = (uint8_t *)v17;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLEEDMediaServiceHandler processMediaForRequestID:callUUID:uploadURL:sharedInfoPrefix:combinedSecret:token:media List:mitigation:completion:]",  "%s\n",  v17);
    if (v18 != buf) {
      free(v18);
    }
  }

  fConnection = self->fConnection;
  if (!fConnection)
  {
    NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
    id v25 = @"No valid connection";
    (*((void (**)(id, NSError *))a11 + 2))( a11,  -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.locationd.CLEEDMediaServiceHandler",  8LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL)));
    fConnection = self->fConnection;
  }

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100F56138;
  v23[3] = &unk_101830628;
  v23[4] = self;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100F5616C;
  v22[3] = &unk_101861B48;
  v22[4] = a11;
  objc_msgSend( -[NSXPCConnection remoteObjectProxyWithErrorHandler:](fConnection, "remoteObjectProxyWithErrorHandler:", v23),  "processMediaServicesForRequestID:callUUID:uploadURL:sharedInfoPrefix:combinedSecret:token:mediaList:mitigation:completion:",  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  v22);
}

- (void)notifyProcessingCompletion
{
  if (qword_101934890 != -1) {
    dispatch_once(&qword_101934890, &stru_10188E198);
  }
  v3 = (os_log_s *)qword_101934898;
  if (os_log_type_enabled((os_log_t)qword_101934898, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446210;
    v10 = "-[CLEEDMediaServiceHandler notifyProcessingCompletion]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s", buf, 0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934890 != -1) {
      dispatch_once(&qword_101934890, &stru_10188E198);
    }
    int v7 = 136446210;
    v8 = "-[CLEEDMediaServiceHandler notifyProcessingCompletion]";
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934898,  2LL,  "#EED2FWK,%{public}s",  &v7,  12);
    uint64_t v6 = (uint8_t *)v5;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLEEDMediaServiceHandler notifyProcessingCompletion]", "%s\n", v5);
    if (v6 != buf) {
      free(v6);
    }
  }

  id fCompletionCallback = (void (**)(void))self->fCompletionCallback;
  if (fCompletionCallback) {
    fCompletionCallback[2]();
  }
}

- (void)processMediaForMitigations:(id)a3
{
  if (qword_101934890 != -1) {
    dispatch_once(&qword_101934890, &stru_10188E198);
  }
  v5 = (os_log_s *)qword_101934898;
  if (os_log_type_enabled((os_log_t)qword_101934898, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    __int16 v19 = "-[CLEEDMediaServiceHandler processMediaForMitigations:]";
    __int16 v20 = 2114;
    id v21 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "#EED2FWK,%{public}s, mitigation:%{public}@",  buf,  0x16u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934890 != -1) {
      dispatch_once(&qword_101934890, &stru_10188E198);
    }
    int v14 = 136446466;
    __int16 v15 = "-[CLEEDMediaServiceHandler processMediaForMitigations:]";
    __int16 v16 = 2114;
    id v17 = a3;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934898,  2LL,  "#EED2FWK,%{public}s, mitigation:%{public}@",  &v14,  22);
    uint64_t v9 = (uint8_t *)v8;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLEEDMediaServiceHandler processMediaForMitigations:]", "%s\n", v8);
    if (v9 != buf) {
      free(v9);
    }
  }

  fConnection = self->fConnection;
  if (fConnection)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100F56880;
    v13[3] = &unk_101830628;
    v13[4] = self;
    objc_msgSend( -[NSXPCConnection remoteObjectProxyWithErrorHandler:](fConnection, "remoteObjectProxyWithErrorHandler:", v13),  "processMediaServicesMitigations:",  a3);
  }

  else
  {
    if (qword_101934890 != -1) {
      dispatch_once(&qword_101934890, &stru_10188E198);
    }
    int v7 = (os_log_s *)qword_101934898;
    if (os_log_type_enabled((os_log_t)qword_101934898, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      __int16 v19 = "-[CLEEDMediaServiceHandler processMediaForMitigations:]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "#EED2FWK,%{public}s, No valid connection, skipping",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934890 != -1) {
        dispatch_once(&qword_101934890, &stru_10188E198);
      }
      int v14 = 136446210;
      __int16 v15 = "-[CLEEDMediaServiceHandler processMediaForMitigations:]";
      LODWORD(v12) = 12;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934898,  16LL,  "#EED2FWK,%{public}s, No valid connection, skipping",  &v14,  v12);
      objc_super v11 = (uint8_t *)v10;
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLEEDMediaServiceHandler processMediaForMitigations:]", "%s\n", v10);
      if (v11 != buf) {
        free(v11);
      }
    }
  }

- (void)processMediaEndOfExtendedSessionNotification
{
  if (qword_101934890 != -1) {
    dispatch_once(&qword_101934890, &stru_10188E198);
  }
  v3 = (os_log_s *)qword_101934898;
  if (os_log_type_enabled((os_log_t)qword_101934898, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446210;
    __int16 v15 = "-[CLEEDMediaServiceHandler processMediaEndOfExtendedSessionNotification]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s", buf, 0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934890 != -1) {
      dispatch_once(&qword_101934890, &stru_10188E198);
    }
    int v12 = 136446210;
    int v13 = "-[CLEEDMediaServiceHandler processMediaEndOfExtendedSessionNotification]";
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934898,  2LL,  "#EED2FWK,%{public}s",  &v12,  12);
    int v7 = (uint8_t *)v6;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLEEDMediaServiceHandler processMediaEndOfExtendedSessionNotification]",  "%s\n",  v6);
    if (v7 != buf) {
      free(v7);
    }
  }

  fConnection = self->fConnection;
  if (fConnection)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100F56C04;
    v11[3] = &unk_101830628;
    v11[4] = self;
    objc_msgSend( -[NSXPCConnection remoteObjectProxyWithErrorHandler:](fConnection, "remoteObjectProxyWithErrorHandler:", v11),  "processMediaServicesEndOfExtendedSessionNotification");
  }

  else
  {
    if (qword_101934890 != -1) {
      dispatch_once(&qword_101934890, &stru_10188E198);
    }
    v5 = (os_log_s *)qword_101934898;
    if (os_log_type_enabled((os_log_t)qword_101934898, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      __int16 v15 = "-[CLEEDMediaServiceHandler processMediaEndOfExtendedSessionNotification]";
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "#EED2FWK,%{public}s, No valid connection, skipping",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934890 != -1) {
        dispatch_once(&qword_101934890, &stru_10188E198);
      }
      int v12 = 136446210;
      int v13 = "-[CLEEDMediaServiceHandler processMediaEndOfExtendedSessionNotification]";
      LODWORD(v10) = 12;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934898,  16LL,  "#EED2FWK,%{public}s, No valid connection, skipping",  &v12,  v10);
      uint64_t v9 = (uint8_t *)v8;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLEEDMediaServiceHandler processMediaEndOfExtendedSessionNotification]",  "%s\n",  v8);
      if (v9 != buf) {
        free(v9);
      }
    }
  }

@end
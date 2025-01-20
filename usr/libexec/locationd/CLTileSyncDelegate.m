@interface CLTileSyncDelegate
- (BOOL)service:(id)a3 startSession:(id)a4 error:(id *)a5;
- (BOOL)syncSession:(id)a3 resetDataStoreWithError:(id *)a4;
- (CLTileSyncDelegate)initWithSyncManager:(void *)a3 silo:(id)a4;
- (int64_t)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5;
- (void)initialSyncStateObserver:(id)a3 initialSyncDidCompleteForPairingIdentifier:(id)a4;
- (void)initialSyncStateObserver:(id)a3 syncDidCompleteForPairingIdentifier:(id)a4;
- (void)initialSyncStateObserver:(id)a3 syncDidResetForPairingIdentifier:(id)a4;
- (void)initialSyncStateObserverClientCanRetryFailedRequests:(id)a3;
- (void)service:(id)a3 didSwitchFromPairingID:(id)a4 toPairingID:(id)a5;
- (void)service:(id)a3 encounteredError:(id)a4 context:(id)a5;
- (void)service:(id)a3 sessionEnded:(id)a4 error:(id)a5;
- (void)service:(id)a3 willSwitchFromPairingID:(id)a4 toPairingID:(id)a5;
- (void)serviceDidPairDevice:(id)a3;
- (void)serviceDidUnpairDevice:(id)a3;
- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4;
- (void)syncCoordinator:(id)a3 didInvalidateSyncSession:(id)a4;
- (void)syncCoordinatorDidChangeSyncRestriction:(id)a3;
- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5;
- (void)syncSession:(id)a3 didEndWithError:(id)a4;
@end

@implementation CLTileSyncDelegate

- (CLTileSyncDelegate)initWithSyncManager:(void *)a3 silo:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CLTileSyncDelegate;
  result = -[CLTileSyncDelegate init](&v7, "init");
  if (result)
  {
    result->fManager = a3;
    result->fSilo = (CLSilo *)a4;
    result->fPsSession = 0LL;
  }

  return result;
}

- (BOOL)service:(id)a3 startSession:(id)a4 error:(id *)a5
{
  id v7 = sub_100215F28((uint64_t)self->fManager, objc_msgSend(a4, "sessionMetadata", a3));
  int v8 = *((unsigned __int8 *)self->fManager + 160);
  if (v8 == 82 || v8 == 73) {
    double v10 = 120.0;
  }
  else {
    double v10 = 900.0;
  }
  [a4 setMaxConcurrentMessages:1];
  [a4 setDelegate:self];
  [a4 setSerializer:objc_alloc_init(CLTileSyncSySerializer)];
  objc_msgSend(a4, "setTargetQueue:", -[CLSilo queue](self->fSilo, "queue"));
  [a4 setSessionMetadata:v7];
  [a4 setPerMessageTimeout:450];
  [a4 setFullSessionTimeout:(uint64_t)v10];
  if (qword_101934860 != -1) {
    dispatch_once(&qword_101934860, &stru_10182B5B0);
  }
  v11 = (os_log_s *)qword_101934868;
  if (os_log_type_enabled((os_log_t)qword_101934868, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    double v17 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "@GtsFlow, CS, startSession, 2, timeout, %{public}.0f",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934860 != -1) {
      dispatch_once(&qword_101934860, &stru_10182B5B0);
    }
    int v14 = 134349056;
    double v15 = v10;
    v13 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934868,  0LL,  "@GtsFlow, CS, startSession, 2, timeout, %{public}.0f",  &v14,  12);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLTileSyncDelegate service:startSession:error:]", "%s\n", v13);
  }

  return 1;
}

- (void)service:(id)a3 sessionEnded:(id)a4 error:(id)a5
{
  if (qword_101934860 != -1) {
    dispatch_once(&qword_101934860, &stru_10182B5B0);
  }
  v5 = (os_log_s *)qword_101934868;
  if (os_log_type_enabled((os_log_t)qword_101934868, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "@GtsFlow, CS, endSession, 6", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934860 != -1) {
      dispatch_once(&qword_101934860, &stru_10182B5B0);
    }
    v7[0] = 0;
    v6 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934868,  0LL,  "@GtsFlow, CS, endSession, 6",  v7,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLTileSyncDelegate service:sessionEnded:error:]", "%s\n", v6);
  }

- (void)serviceDidPairDevice:(id)a3
{
  if (qword_101934860 != -1) {
    dispatch_once(&qword_101934860, &stru_10182B5B0);
  }
  v4 = (os_log_s *)qword_101934868;
  if (os_log_type_enabled((os_log_t)qword_101934868, OS_LOG_TYPE_INFO))
  {
    int v5 = *((char *)self->fManager + 160);
    *(_DWORD *)buf = 67240192;
    int v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "@GtsSync, CsService, serviceDidPairDevice, state, %{public}c",  buf,  8u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934860 != -1) {
      dispatch_once(&qword_101934860, &stru_10182B5B0);
    }
    int v6 = *((char *)self->fManager + 160);
    v8[0] = 67240192;
    v8[1] = v6;
    id v7 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934868,  1LL,  "@GtsSync, CsService, serviceDidPairDevice, state, %{public}c",  v8,  8);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLTileSyncDelegate serviceDidPairDevice:]", "%s\n", v7);
  }

- (void)serviceDidUnpairDevice:(id)a3
{
  if (qword_101934860 != -1) {
    dispatch_once(&qword_101934860, &stru_10182B5B0);
  }
  v4 = (os_log_s *)qword_101934868;
  if (os_log_type_enabled((os_log_t)qword_101934868, OS_LOG_TYPE_INFO))
  {
    int v5 = *((char *)self->fManager + 160);
    *(_DWORD *)buf = 67240192;
    int v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "@GtsSync, CsService, serviceDidUnpairDevice, state, %{public}c",  buf,  8u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934860 != -1) {
      dispatch_once(&qword_101934860, &stru_10182B5B0);
    }
    int v6 = *((char *)self->fManager + 160);
    v8[0] = 67240192;
    v8[1] = v6;
    id v7 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934868,  1LL,  "@GtsSync, CsService, serviceDidUnpairDevice, state, %{public}c",  v8,  8);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLTileSyncDelegate serviceDidUnpairDevice:]", "%s\n", v7);
  }

- (void)service:(id)a3 encounteredError:(id)a4 context:(id)a5
{
  id v7 = objc_msgSend(objc_msgSend(a4, "userInfo", a3), "objectForKeyedSubscript:", NSUnderlyingErrorKey);
  if (qword_101934860 != -1) {
    dispatch_once(&qword_101934860, &stru_10182B5B0);
  }
  int v8 = (os_log_s *)qword_101934868;
  if (os_log_type_enabled((os_log_t)qword_101934868, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446466;
    id v16 = objc_msgSend(objc_msgSend(a4, "localizedDescription"), "UTF8String");
    __int16 v17 = 2082;
    id v18 = objc_msgSend(objc_msgSend(v7, "localizedDescription"), "UTF8String");
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "@GtsSync, CsError, 2, service, %{public}s, underlying, %{public}s",  buf,  0x16u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934860 != -1) {
      dispatch_once(&qword_101934860, &stru_10182B5B0);
    }
    uint64_t v9 = qword_101934868;
    int v11 = 136446466;
    id v12 = objc_msgSend(objc_msgSend(a4, "localizedDescription"), "UTF8String");
    __int16 v13 = 2082;
    id v14 = objc_msgSend(objc_msgSend(v7, "localizedDescription"), "UTF8String");
    int v10 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v9,  1LL,  "@GtsSync, CsError, 2, service, %{public}s, underlying, %{public}s",  &v11,  22);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLTileSyncDelegate service:encounteredError:context:]", "%s\n", v10);
  }

  sub_100216868((uint64_t)self->fManager);
}

- (int64_t)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5
{
  __int16 v7 = sub_100216D2C((uint64_t)self->fManager, [a3 sessionMetadata]);
  if ((_BYTE)v7 && ((*((uint64_t (**)(id, void))a4 + 2))(a4, *((void *)self->fManager + 3)) & 1) == 0)
  {
    if (qword_101934860 != -1) {
      dispatch_once(&qword_101934860, &stru_10182B5B0);
    }
    int v8 = (os_log_s *)qword_101934868;
    if (os_log_type_enabled((os_log_t)qword_101934868, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "@GtsSync, CsSession, enqueue failed", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934860 != -1) {
        dispatch_once(&qword_101934860, &stru_10182B5B0);
      }
      v14[0] = 0;
      id v12 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934868,  1LL,  "@GtsSync, CsSession, enqueue failed",  v14,  2);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLTileSyncDelegate syncSession:enqueueChanges:error:]", "%s\n", v12);
    }
  }

  if ((v7 & 0xFF00) == 0) {
    return 1LL;
  }
  if (qword_101934860 != -1) {
    dispatch_once(&qword_101934860, &stru_10182B5B0);
  }
  uint64_t v9 = (os_log_s *)qword_101934868;
  if (os_log_type_enabled((os_log_t)qword_101934868, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "@GtsFlow, CS, enqueueComplete, 4", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934860 != -1) {
      dispatch_once(&qword_101934860, &stru_10182B5B0);
    }
    v14[0] = 0;
    LODWORD(v13) = 2;
    int v11 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934868,  0LL,  "@GtsFlow, CS, enqueueComplete, 4",  v14,  v13);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLTileSyncDelegate syncSession:enqueueChanges:error:]", "%s\n", v11);
  }

  return 2LL;
}

- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5
{
  if (qword_101934860 != -1) {
    dispatch_once(&qword_101934860, &stru_10182B5B0);
  }
  int v8 = (os_log_s *)qword_101934868;
  if (os_log_type_enabled((os_log_t)qword_101934868, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    id v20 = [a4 count];
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "@GtsSync, CsSession, applyChanges, %{public}lu\n",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934860 != -1) {
      dispatch_once(&qword_101934860, &stru_10182B5B0);
    }
    uint64_t v11 = qword_101934868;
    int v17 = 134349056;
    id v18 = [a4 count];
    id v12 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v11,  1LL,  "@GtsSync, CsSession, applyChanges, %{public}lu\n",  &v17,  12);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLTileSyncDelegate syncSession:applyChanges:completion:]", "%s\n", v12);
  }

  if ((unint64_t)[a4 count] >= 2)
  {
    if (qword_101934860 != -1) {
      dispatch_once(&qword_101934860, &stru_10182B5B0);
    }
    uint64_t v9 = (os_log_s *)qword_101934868;
    if (os_log_type_enabled((os_log_t)qword_101934868, OS_LOG_TYPE_ERROR))
    {
      id v10 = [a4 count];
      *(_DWORD *)buf = 134349056;
      id v20 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "@GtsSync, CsSession, More than 1 incoming change, %{public}lu, #CloneMe",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934860 != -1) {
        dispatch_once(&qword_101934860, &stru_10182B5B0);
      }
      uint64_t v13 = qword_101934868;
      id v14 = [a4 count];
      int v17 = 134349056;
      id v18 = v14;
      LODWORD(v16) = 12;
      double v15 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v13,  16LL,  "@GtsSync, CsSession, More than 1 incoming change, %{public}lu, #CloneMe",  &v17,  v16);
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLTileSyncDelegate syncSession:applyChanges:completion:]", "%s\n", v15);
    }
  }

  sub_1002170F8((uint64_t)self->fManager, [a4 objectAtIndexedSubscript:0]);
  (*((void (**)(id, uint64_t, void))a5 + 2))(a5, 1LL, 0LL);
}

- (void)syncSession:(id)a3 didEndWithError:(id)a4
{
  id v6 = objc_msgSend(objc_msgSend(a4, "userInfo", a3), "objectForKeyedSubscript:", NSUnderlyingErrorKey);
  if (a4)
  {
    __int16 v7 = v6;
    if (qword_101934860 != -1) {
      dispatch_once(&qword_101934860, &stru_10182B5B0);
    }
    int v8 = (os_log_s *)qword_101934868;
    if (os_log_type_enabled((os_log_t)qword_101934868, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)v21 = objc_msgSend(objc_msgSend(a4, "localizedDescription"), "UTF8String");
      *(_WORD *)&v21[8] = 2082;
      id v22 = objc_msgSend(objc_msgSend(v7, "localizedDescription"), "UTF8String");
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "@GtsSync, CsError, 0, didEndWithError, %{public}s, underlying, %{public}s",  buf,  0x16u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934860 != -1) {
        dispatch_once(&qword_101934860, &stru_10182B5B0);
      }
      uint64_t v13 = qword_101934868;
      int v17 = 136446466;
      *(void *)id v18 = objc_msgSend(objc_msgSend(a4, "localizedDescription"), "UTF8String");
      *(_WORD *)&v18[8] = 2082;
      id v19 = objc_msgSend(objc_msgSend(v7, "localizedDescription"), "UTF8String");
      id v14 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v13,  1LL,  "@GtsSync, CsError, 0, didEndWithError, %{public}s, underlying, %{public}s",  &v17,  22);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLTileSyncDelegate syncSession:didEndWithError:]", "%s\n", v14);
    }
  }

  BOOL v9 = sub_100217B18((uint64_t)self->fManager, a4 != 0LL);
  if (qword_101934860 != -1) {
    dispatch_once(&qword_101934860, &stru_10182B5B0);
  }
  id v10 = (os_log_s *)qword_101934868;
  if (os_log_type_enabled((os_log_t)qword_101934868, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)v21 = a4 != 0LL;
    *(_WORD *)&v21[4] = 1026;
    *(_DWORD *)&v21[6] = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "@GtsFlow, CS, sessionDidEnd, 5, error, %{public}d, synctrap, %{public}d",  buf,  0xEu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934860 != -1) {
      dispatch_once(&qword_101934860, &stru_10182B5B0);
    }
    int v17 = 67240448;
    *(_DWORD *)id v18 = a4 != 0LL;
    *(_WORD *)&v18[4] = 1026;
    *(_DWORD *)&v18[6] = v9;
    LODWORD(v16) = 14;
    id v12 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934868,  0LL,  "@GtsFlow, CS, sessionDidEnd, 5, error, %{public}d, synctrap, %{public}d",  &v17,  v16);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLTileSyncDelegate syncSession:didEndWithError:]", "%s\n", v12);
  }

  if (v9)
  {
    if (qword_101934860 != -1) {
      dispatch_once(&qword_101934860, &stru_10182B5B0);
    }
    uint64_t v11 = (os_log_s *)qword_101934868;
    if (os_log_type_enabled((os_log_t)qword_101934868, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "@GtsFlow, PS, syncDidCompleteTx, 2", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934860 != -1) {
        dispatch_once(&qword_101934860, &stru_10182B5B0);
      }
      LOWORD(v17) = 0;
      LODWORD(v16) = 2;
      double v15 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934868,  0LL,  "@GtsFlow, PS, syncDidCompleteTx, 2",  &v17,  v16);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLTileSyncDelegate syncSession:didEndWithError:]", "%s\n", v15);
    }

    -[PSYServiceSyncSession syncDidComplete](self->fPsSession, "syncDidComplete");
  }

- (BOOL)syncSession:(id)a3 resetDataStoreWithError:(id *)a4
{
  if (qword_101934860 != -1) {
    dispatch_once(&qword_101934860, &stru_10182B5B0);
  }
  v4 = (os_log_s *)qword_101934868;
  if (os_log_type_enabled((os_log_t)qword_101934868, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "@GtsSync, CsSession, resetDataStoreWithError",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934860 != -1) {
      dispatch_once(&qword_101934860, &stru_10182B5B0);
    }
    v7[0] = 0;
    id v6 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934868,  1LL,  "@GtsSync, CsSession, resetDataStoreWithError",  v7,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLTileSyncDelegate syncSession:resetDataStoreWithError:]", "%s\n", v6);
  }

  return 1;
}

- (void)service:(id)a3 willSwitchFromPairingID:(id)a4 toPairingID:(id)a5
{
  if (qword_101934860 != -1) {
    dispatch_once(&qword_101934860, &stru_10182B5B0);
  }
  int v8 = (os_log_s *)qword_101934868;
  if (os_log_type_enabled((os_log_t)qword_101934868, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446466;
    id v16 = objc_msgSend(objc_msgSend(a4, "UUIDString"), "UTF8String");
    __int16 v17 = 2082;
    id v18 = objc_msgSend(objc_msgSend(a5, "UUIDString"), "UTF8String");
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "@GtsSync, CsService, willSwitchPairing, old, %{public}s, new, %{public}s",  buf,  0x16u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934860 != -1) {
      dispatch_once(&qword_101934860, &stru_10182B5B0);
    }
    uint64_t v9 = qword_101934868;
    int v11 = 136446466;
    id v12 = objc_msgSend(objc_msgSend(a4, "UUIDString"), "UTF8String");
    __int16 v13 = 2082;
    id v14 = objc_msgSend(objc_msgSend(a5, "UUIDString"), "UTF8String");
    id v10 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v9,  1LL,  "@GtsSync, CsService, willSwitchPairing, old, %{public}s, new, %{public}s",  &v11,  22);
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLTileSyncDelegate service:willSwitchFromPairingID:toPairingID:]",  "%s\n",  v10);
  }

  sub_100218228((uint64_t)self->fManager, a5);
}

- (void)service:(id)a3 didSwitchFromPairingID:(id)a4 toPairingID:(id)a5
{
  if (qword_101934860 != -1) {
    dispatch_once(&qword_101934860, &stru_10182B5B0);
  }
  int v8 = (os_log_s *)qword_101934868;
  if (os_log_type_enabled((os_log_t)qword_101934868, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446466;
    id v16 = objc_msgSend(objc_msgSend(a4, "UUIDString"), "UTF8String");
    __int16 v17 = 2082;
    id v18 = objc_msgSend(objc_msgSend(a5, "UUIDString"), "UTF8String");
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "@GtsSync, CsService, didSwitchPairing, old, %{public}s, new, %{public}s",  buf,  0x16u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934860 != -1) {
      dispatch_once(&qword_101934860, &stru_10182B5B0);
    }
    uint64_t v9 = qword_101934868;
    int v11 = 136446466;
    id v12 = objc_msgSend(objc_msgSend(a4, "UUIDString"), "UTF8String");
    __int16 v13 = 2082;
    id v14 = objc_msgSend(objc_msgSend(a5, "UUIDString"), "UTF8String");
    id v10 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v9,  1LL,  "@GtsSync, CsService, didSwitchPairing, old, %{public}s, new, %{public}s",  &v11,  22);
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLTileSyncDelegate service:didSwitchFromPairingID:toPairingID:]",  "%s\n",  v10);
  }

  sub_100218674((uint64_t)self->fManager, a4 == 0LL, a5 == 0LL);
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  id v7 = a4;

  self->fPsSession = (PSYServiceSyncSession *)a4;
  if (qword_101934860 != -1) {
    dispatch_once(&qword_101934860, &stru_10182B5B0);
  }
  int v8 = (os_log_s *)qword_101934868;
  if (os_log_type_enabled((os_log_t)qword_101934868, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    id v16 = objc_msgSend(objc_msgSend(a3, "activeSyncSession"), "syncSessionType");
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "@GtsSync, PsCoord, beginSyncSession, %{public}lu",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934860 != -1) {
      dispatch_once(&qword_101934860, &stru_10182B5B0);
    }
    uint64_t v10 = qword_101934868;
    int v13 = 134349056;
    id v14 = objc_msgSend(objc_msgSend(a3, "activeSyncSession"), "syncSessionType");
    int v11 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v10,  1LL,  "@GtsSync, PsCoord, beginSyncSession, %{public}lu",  &v13,  12);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLTileSyncDelegate syncCoordinator:beginSyncSession:]", "%s\n", v11);
  }

  fSilo = self->fSilo;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100218B64;
  v12[3] = &unk_10181A328;
  v12[4] = a3;
  v12[5] = self;
  -[CLSilo sync:](fSilo, "sync:", v12);
}

- (void)syncCoordinator:(id)a3 didInvalidateSyncSession:(id)a4
{
  if (qword_101934860 != -1) {
    dispatch_once(&qword_101934860, &stru_10182B5B0);
  }
  id v6 = (os_log_s *)qword_101934868;
  if (os_log_type_enabled((os_log_t)qword_101934868, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67240192;
    unsigned int v18 = [a4 syncSessionType];
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "@GtsSync, PsCoord, didInvalidateSyncSession, %{public}d",  buf,  8u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934860 != -1) {
      dispatch_once(&qword_101934860, &stru_10182B5B0);
    }
    uint64_t v9 = qword_101934868;
    int v15 = 67240192;
    unsigned int v16 = [a4 syncSessionType];
    uint64_t v10 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v9,  1LL,  "@GtsSync, PsCoord, didInvalidateSyncSession, %{public}d",  &v15,  8);
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLTileSyncDelegate syncCoordinator:didInvalidateSyncSession:]",  "%s\n",  v10);
  }

  if (qword_101934860 != -1) {
    dispatch_once(&qword_101934860, &stru_10182B5B0);
  }
  id v7 = (os_log_s *)qword_101934868;
  if (os_log_type_enabled((os_log_t)qword_101934868, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v8 = [a3 syncRestriction];
    *(_DWORD *)buf = 67240192;
    unsigned int v18 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "@GtsFlow, PS, didInvalidateSession, 3, restriction, %{public}d",  buf,  8u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934860 != -1) {
      dispatch_once(&qword_101934860, &stru_10182B5B0);
    }
    uint64_t v11 = qword_101934868;
    unsigned int v12 = [a3 syncRestriction];
    int v15 = 67240192;
    unsigned int v16 = v12;
    LODWORD(v14) = 8;
    int v13 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v11,  0LL,  "@GtsFlow, PS, didInvalidateSession, 3, restriction, %{public}d",  &v15,  v14);
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLTileSyncDelegate syncCoordinator:didInvalidateSyncSession:]",  "%s\n",  v13);
  }

- (void)syncCoordinatorDidChangeSyncRestriction:(id)a3
{
  if (qword_101934860 != -1) {
    dispatch_once(&qword_101934860, &stru_10182B5B0);
  }
  int v5 = (os_log_s *)qword_101934868;
  if (os_log_type_enabled((os_log_t)qword_101934868, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67240192;
    unsigned int v12 = [a3 syncRestriction];
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "@GtsSync, PsCoord, syncCoordinatorDidChangeSyncRestriction, %{public}d",  buf,  8u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934860 != -1) {
      dispatch_once(&qword_101934860, &stru_10182B5B0);
    }
    uint64_t v7 = qword_101934868;
    v10[0] = 67240192;
    v10[1] = [a3 syncRestriction];
    unsigned int v8 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v7,  1LL,  "@GtsSync, PsCoord, syncCoordinatorDidChangeSyncRestriction, %{public}d",  v10,  8);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLTileSyncDelegate syncCoordinatorDidChangeSyncRestriction:]", "%s\n", v8);
  }

  fSilo = self->fSilo;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100219A60;
  v9[3] = &unk_10181A328;
  v9[4] = a3;
  v9[5] = self;
  -[CLSilo sync:](fSilo, "sync:", v9);
}

- (void)initialSyncStateObserver:(id)a3 initialSyncDidCompleteForPairingIdentifier:(id)a4
{
  if (qword_101934860 != -1) {
    dispatch_once(&qword_101934860, &stru_10182B5B0);
  }
  v4 = (os_log_s *)qword_101934868;
  if (os_log_type_enabled((os_log_t)qword_101934868, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "@GtsSync, PsObserver, initialSyncDidCompleteForPairingID",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934860 != -1) {
      dispatch_once(&qword_101934860, &stru_10182B5B0);
    }
    v6[0] = 0;
    int v5 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934868,  1LL,  "@GtsSync, PsObserver, initialSyncDidCompleteForPairingID",  v6,  2);
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLTileSyncDelegate initialSyncStateObserver:initialSyncDidCompleteForPairingIdentifier:]",  "%s\n",  v5);
  }

- (void)initialSyncStateObserver:(id)a3 syncDidCompleteForPairingIdentifier:(id)a4
{
  if (qword_101934860 != -1) {
    dispatch_once(&qword_101934860, &stru_10182B5B0);
  }
  int v5 = (os_log_s *)qword_101934868;
  if (os_log_type_enabled((os_log_t)qword_101934868, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "@GtsSync, PsObserver, syncDidCompleteForPairingID",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934860 != -1) {
      dispatch_once(&qword_101934860, &stru_10182B5B0);
    }
    v12[0] = 0;
    unsigned int v8 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934868,  1LL,  "@GtsSync, PsObserver, syncDidCompleteForPairingID",  v12,  2);
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLTileSyncDelegate initialSyncStateObserver:syncDidCompleteForPairingIdentifier:]",  "%s\n",  v8);
  }

  if (qword_101934860 != -1) {
    dispatch_once(&qword_101934860, &stru_10182B5B0);
  }
  id v6 = (os_log_s *)qword_101934868;
  if (os_log_type_enabled((os_log_t)qword_101934868, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "@GtsFlow, PS, syncDidCompleteRx, 4", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934860 != -1) {
      dispatch_once(&qword_101934860, &stru_10182B5B0);
    }
    v12[0] = 0;
    LODWORD(v10) = 2;
    uint64_t v9 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934868,  0LL,  "@GtsFlow, PS, syncDidCompleteRx, 4",  v12,  v10);
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLTileSyncDelegate initialSyncStateObserver:syncDidCompleteForPairingIdentifier:]",  "%s\n",  v9);
  }

  fSilo = self->fSilo;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10021A574;
  v11[3] = &unk_10181A288;
  v11[4] = self;
  -[CLSilo sync:](fSilo, "sync:", v11);
}

- (void)initialSyncStateObserver:(id)a3 syncDidResetForPairingIdentifier:(id)a4
{
  if (qword_101934860 != -1) {
    dispatch_once(&qword_101934860, &stru_10182B5B0);
  }
  v4 = (os_log_s *)qword_101934868;
  if (os_log_type_enabled((os_log_t)qword_101934868, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "@GtsSync, PsObserver, syncDidResetForPairingID",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934860 != -1) {
      dispatch_once(&qword_101934860, &stru_10182B5B0);
    }
    v6[0] = 0;
    int v5 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934868,  1LL,  "@GtsSync, PsObserver, syncDidResetForPairingID",  v6,  2);
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLTileSyncDelegate initialSyncStateObserver:syncDidResetForPairingIdentifier:]",  "%s\n",  v5);
  }

- (void)initialSyncStateObserverClientCanRetryFailedRequests:(id)a3
{
  if (qword_101934860 != -1) {
    dispatch_once(&qword_101934860, &stru_10182B5B0);
  }
  v3 = (os_log_s *)qword_101934868;
  if (os_log_type_enabled((os_log_t)qword_101934868, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "@GtsSync, PsObserver, initialSyncStateObserverClientCanRetryFailedRequests",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934860 != -1) {
      dispatch_once(&qword_101934860, &stru_10182B5B0);
    }
    v5[0] = 0;
    v4 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934868,  1LL,  "@GtsSync, PsObserver, initialSyncStateObserverClientCanRetryFailedRequests",  v5,  2);
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLTileSyncDelegate initialSyncStateObserverClientCanRetryFailedRequests:]",  "%s\n",  v4);
  }

@end
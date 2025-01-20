@interface CLTileSyncSySerializer
- (id)changeFromData:(id)a3 ofType:(int64_t)a4;
- (id)dataFromChange:(id)a3;
@end

@implementation CLTileSyncSySerializer

- (id)dataFromChange:(id)a3
{
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___CLTileSyncSyChange);
  char isKindOfClass = objc_opt_isKindOfClass(a3, v4);
  id v6 = objc_msgSend(objc_alloc(off_1019362A0()), "initWithProperties:", objc_msgSend(a3, "properties"));
  if (qword_101934860 != -1) {
    dispatch_once(&qword_101934860, &stru_10182B5B0);
  }
  v7 = (os_log_s *)qword_101934868;
  if (os_log_type_enabled((os_log_t)qword_101934868, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67240192;
    int v12 = isKindOfClass & 1;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "@GtsSync, CsSerial, dataFromChange, isKind, %{public}d\n",  buf,  8u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934860 != -1) {
      dispatch_once(&qword_101934860, &stru_10182B5B0);
    }
    v10[0] = 67240192;
    v10[1] = isKindOfClass & 1;
    v9 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934868,  1LL,  "@GtsSync, CsSerial, dataFromChange, isKind, %{public}d\n",  v10,  8);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLTileSyncSySerializer dataFromChange:]", "%s\n", v9);
  }

  if ((isKindOfClass & 1) != 0) {
    return +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v6,  1LL,  0LL);
  }
  else {
    return 0LL;
  }
}

- (id)changeFromData:(id)a3 ofType:(int64_t)a4
{
  if (qword_101934860 != -1) {
    dispatch_once(&qword_101934860, &stru_10182B5B0);
  }
  v5 = (os_log_s *)qword_101934868;
  if (os_log_type_enabled((os_log_t)qword_101934868, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v11 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "@GtsWarn, GizmoSync, changeFromData, %ld, #CloneMe",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934860 != -1) {
      dispatch_once(&qword_101934860, &stru_10182B5B0);
    }
    int v8 = 134217984;
    int64_t v9 = a4;
    v7 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934868,  0LL,  "@GtsWarn, GizmoSync, changeFromData, %ld, #CloneMe",  &v8);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLTileSyncSySerializer changeFromData:ofType:]", "%s\n", v7);
  }

  return 0LL;
}

@end
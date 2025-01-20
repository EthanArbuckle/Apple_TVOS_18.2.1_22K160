@interface CLWMWatchOrientation
- (CLWMWatchOrientation)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5;
- (id).cxx_construct;
- (int)getSampleCount;
- (void)onWatchOrientationNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3;
- (void)setupListener;
- (void)stop;
- (void)teardownListeners;
- (void)writeWatchOnWristStatus;
- (void)writeWatchOrientation;
@end

@implementation CLWMWatchOrientation

- (CLWMWatchOrientation)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CLWMWatchOrientation;
  result = -[CLWMBase init](&v9, "init");
  if (result)
  {
    *((void *)result + 5) = a3;
    *((void *)result + 6) = a4;
    *((_BYTE *)result + 96) = a5->disableWatchOrientation;
    *((_BYTE *)result + 97) = a5->disableWatchOnWristStatus;
    *((void *)result + 7) = 0x200000002LL;
    *((void *)result + 8) = 0LL;
    *((_DWORD *)result + 18) = 0;
    *((void *)result + 10) = 0LL;
    *(_DWORD *)((char *)result + 87) = 0;
    *((_DWORD *)result + 25) = 0;
  }

  return result;
}

- (void)stop
{
}

- (void)setupListener
{
  if (*((void *)self + 2))
  {
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A3988);
    }
    v6 = (os_log_s *)qword_101934678;
    if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      __int16 v10 = 2082;
      v11 = "";
      __int16 v12 = 2082;
      v13 = "assert";
      __int16 v14 = 2081;
      v15 = "!_watchOrientationObserverClient";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Duplicate creation of watch orientation listener., event:%{public, location:escape_ only}s, condition:%{private, location:escape_only}s}",  buf,  0x26u);
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A3988);
      }
    }

    v7 = (os_log_s *)qword_101934678;
    if (os_signpost_enabled((os_log_t)qword_101934678))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      __int16 v10 = 2082;
      v11 = "";
      __int16 v12 = 2082;
      v13 = "assert";
      __int16 v14 = 2081;
      v15 = "!_watchOrientationObserverClient";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v7,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Duplicate creation of watch orientation listener.",  "{msg%{public}.0s:Duplicate creation of watch orientation listener., event:%{public, location:escape_ only}s, condition:%{private, location:escape_only}s}",  buf,  0x26u);
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A3988);
      }
    }

    v8 = (os_log_s *)qword_101934678;
    if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      __int16 v10 = 2082;
      v11 = "";
      __int16 v12 = 2082;
      v13 = "assert";
      __int16 v14 = 2081;
      v15 = "!_watchOrientationObserverClient";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:Duplicate creation of watch orientation listener., event:%{public, location:escape_ only}s, condition:%{private, location:escape_only}s}",  buf,  0x26u);
    }

    abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Motion/Utilities/WorkoutRecordingModules/CLWMWatchOrientation.mm",  85,  "-[CLWMWatchOrientation setupListener]");
  }

  sub_1005C4E40((uint64_t)sub_10120F77C, (uint64_t)self, *((void **)self + 5), buf);
  uint64_t v3 = *(void *)buf;
  *(void *)buf = 0LL;
  uint64_t v4 = *((void *)self + 2);
  *((void *)self + 2) = v3;
  if (v4)
  {
    (*(void (**)(uint64_t))(*(void *)v4 + 8LL))(v4);
    uint64_t v5 = *(void *)buf;
    *(void *)buf = 0LL;
    if (v5) {
      (*(void (**)(uint64_t))(*(void *)v5 + 8LL))(v5);
    }
  }

  if (!*((_BYTE *)self + 96)) {
    [*(id *)(*((void *)self + 2) + 16) register:*(void *)(*((void *)self + 2) + 8) forNotification:0 registrationInfo:0];
  }
  if (!*((_BYTE *)self + 97)) {
    [*(id *)(*((void *)self + 2) + 16) register:*(void *)(*((void *)self + 2) + 8) forNotification:1 registrationInfo:0];
  }
}

- (void)teardownListeners
{
  uint64_t v3 = *((void *)self + 2);
  *((void *)self + 2) = 0LL;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8LL))(v3);
  }
}

- (void)onWatchOrientationNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (*a3 == 1)
  {
    __int128 v4 = *((_OWORD *)a4 + 1);
    *((_OWORD *)self + 4) = *(_OWORD *)a4;
    *((_OWORD *)self + 5) = v4;
    -[CLWMWatchOrientation writeWatchOnWristStatus](self, "writeWatchOnWristStatus");
  }

  else if (!*a3)
  {
    *((void *)self + 7) = *(void *)a4;
    -[CLWMWatchOrientation writeWatchOrientation](self, "writeWatchOrientation");
  }

- (void)writeWatchOrientation
{
  uint64_t v2 = *((void *)self + 3);
  if (v2 && *(_BYTE *)(v2 + 136) && !*((_BYTE *)self + 96))
  {
    sub_101125260(v9);
    -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
    v11 |= 1u;
    v9[77] = v4;
    sub_101138F40(v9);
    sub_10116E7A4(v10);
    uint64_t v5 = v10;
    uint64_t v6 = *((void *)v10 + 1);
    int v7 = *((_DWORD *)self + 15);
    *(_BYTE *)(v6 + 16) |= 1u;
    *(_DWORD *)(v6 + 8) = v7;
    uint64_t v8 = *((void *)v5 + 1);
    LODWORD(v6) = *((_DWORD *)self + 14);
    *(_BYTE *)(v8 + 16) |= 2u;
    *(_DWORD *)(v8 + 12) = v6;
    sub_10111D6A8(*((void *)self + 3), (uint64_t)v9);
    sub_101127D00((PB::Base *)v9);
  }

- (void)writeWatchOnWristStatus
{
  uint64_t v2 = *((void *)self + 3);
  if (v2 && *(_BYTE *)(v2 + 136) && !*((_BYTE *)self + 97))
  {
    sub_101125260(v17);
    -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
    v19 |= 1u;
    v17[77] = v4;
    sub_101139720(v17);
    sub_10116E410(v18);
    uint64_t v5 = v18;
    uint64_t v6 = *((void *)v18 + 1);
    int v7 = *((_DWORD *)self + 16);
    *(_BYTE *)(v6 + 40) |= 4u;
    *(_DWORD *)(v6 + 24) = v7;
    uint64_t v8 = *((void *)v5 + 1);
    int v9 = *((_DWORD *)self + 17);
    *(_BYTE *)(v8 + 40) |= 0x10u;
    *(_DWORD *)(v8 + 32) = v9;
    uint64_t v10 = *((void *)v5 + 1);
    int v11 = *((_DWORD *)self + 18);
    *(_BYTE *)(v10 + 40) |= 8u;
    *(_DWORD *)(v10 + 28) = v11;
    uint64_t v12 = *((void *)v5 + 1);
    LOBYTE(v11) = *((_BYTE *)self + 88);
    *(_BYTE *)(v12 + 40) |= 0x40u;
    *(_BYTE *)(v12 + 37) = v11;
    uint64_t v13 = *((void *)v5 + 1);
    LOBYTE(v11) = *((_BYTE *)self + 89);
    *(_BYTE *)(v13 + 40) |= 0x20u;
    *(_BYTE *)(v13 + 36) = v11;
    uint64_t v14 = *((void *)v5 + 1);
    LOBYTE(v11) = *((_BYTE *)self + 90);
    *(_BYTE *)(v14 + 40) |= 0x80u;
    *(_BYTE *)(v14 + 38) = v11;
    uint64_t v15 = *((void *)v5 + 1);
    -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", (double)*((unint64_t *)self + 10));
    *(_BYTE *)(v15 + 40) |= 2u;
    *(void *)(v15 + 16) = (unint64_t)v16;
    sub_10111D6A8(*((void *)self + 3), (uint64_t)v17);
    sub_101127D00((PB::Base *)v17);
  }

- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3
{
}

- (int)getSampleCount
{
  return *((_DWORD *)self + 25);
}

- (void).cxx_destruct
{
  uint64_t v3 = *((void *)self + 2);
  *((void *)self + 2) = 0LL;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8LL))(v3);
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0LL;
  *((void *)self + 3) = 0LL;
  *((void *)self + 4) = 0LL;
  return self;
}

@end
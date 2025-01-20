@interface CLSwimNotifierAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncget_prepareSessionEndForSessionType:(int64_t)a3 atEndTime:(double)a4;
- (CLSwimNotifierAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)clearCalibrations;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)querySessionSWOLF:(id)a3 withReply:(id)a4;
- (void)queryUsingRecord:(CLSwimEntry *)a3 withReply:(id)a4;
@end

@implementation CLSwimNotifierAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_1019A04C0 != -1) {
    dispatch_once(&qword_1019A04C0, &stru_101895AC0);
  }
  return (id)qword_1019A04B8;
}

- (CLSwimNotifierAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLSwimNotifierAdapter;
  return -[CLSwimNotifierAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLSwimNotifierProtocol,  &OBJC_PROTOCOL___CLSwimNotifierClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
  {
    uint64_t v3 = sub_101281228();
    sub_10103CD7C(v3);
  }

- (void)endService
{
  v2 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  (*((void (**)(CLNotifierBase *))v2->var0 + 2))(v2);
}

- (void)adaptee
{
  result = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (result) {
  return result;
  }
}

- (void)doAsync:(id)a3
{
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

+ (BOOL)isSupported
{
  if (qword_1019A04D0 != -1) {
    dispatch_once(&qword_1019A04D0, &stru_101895AE0);
  }
  return byte_1019A04C8;
}

- (void)queryUsingRecord:(CLSwimEntry *)a3 withReply:(id)a4
{
  unint64_t v5 = +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  0x86BCA1AF286BCA1BLL * ((v17 - (_BYTE *)__p) >> 3));
  v6 = __p;
  v7 = v17;
  if (__p != v17)
  {
    do
    {
      __int128 v8 = v6[1];
      v18[0] = *v6;
      v18[1] = v8;
      __int128 v9 = v6[2];
      __int128 v10 = v6[3];
      __int128 v11 = v6[5];
      v18[4] = v6[4];
      v18[5] = v11;
      v18[2] = v9;
      v18[3] = v10;
      __int128 v12 = v6[6];
      __int128 v13 = v6[7];
      __int128 v14 = v6[8];
      uint64_t v19 = *((void *)v6 + 18);
      v18[7] = v13;
      v18[8] = v14;
      v18[6] = v12;
      id v15 = [[CMSwimData alloc] initWithSwimEntry:v18];
      -[NSMutableArray addObject:](v5, "addObject:", v15);

      v6 = (_OWORD *)((char *)v6 + 152);
    }

    while (v6 != (_OWORD *)v7);
  }

  (*((void (**)(id, NSMutableArray *))a4 + 2))(a4, v5);
  if (__p)
  {
    v17 = __p;
    operator delete(__p);
  }

- (void)querySessionSWOLF:(id)a3 withReply:(id)a4
{
  if (a3)
  {
    uuid_clear(v14);
    uuid_clear(v15);
    *(void *)buf = 0LL;
    uint64_t v13 = 0LL;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    uint64_t v18 = 0LL;
    [a3 getUUIDBytes:v11];
    uint64_t v7 = sub_10103D35C((uint64_t)-[CLSwimNotifierAdapter adaptee](self, "adaptee"), v11, (uint64_t)buf);
    if ((_DWORD)v7 == 100) {
      (*((void (**)(id, id, uint64_t))a4 + 2))( a4,  [[CMSWOLFSummary alloc] initWithCLSWOLFSummary:buf],  100);
    }
    else {
      (*((void (**)(id, void, uint64_t))a4 + 2))(a4, 0LL, v7);
    }
  }

  else
  {
    if (qword_1019344E0 != -1) {
      dispatch_once(&qword_1019344E0, &stru_101895CB0);
    }
    __int128 v8 = (os_log_s *)qword_1019344E8;
    if (os_log_type_enabled((os_log_t)qword_1019344E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "session SWOLF query nil sessionId", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019344E0 != -1) {
        dispatch_once(&qword_1019344E0, &stru_101895CB0);
      }
      *(_WORD *)__int128 v11 = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019344E8,  0LL,  "session SWOLF query nil sessionId",  v11,  2);
      __int128 v10 = (uint8_t *)v9;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLSwimNotifierAdapter querySessionSWOLF:withReply:]", "%s\n", v9);
      if (v10 != buf) {
        free(v10);
      }
    }

    (*((void (**)(id, void, uint64_t))a4 + 2))(a4, 0LL, 107LL);
  }

- (void)clearCalibrations
{
}

- (BOOL)syncget_prepareSessionEndForSessionType:(int64_t)a3 atEndTime:(double)a4
{
  return 1;
}

@end
@interface CLTilesManagerAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetAppAvailabilityForLocation:(id *)a3 radius:(float)a4 searchContext:(void *)a5 availabilityList:(void *)a6 includeRegionalApps:(BOOL)a7;
- (BOOL)syncgetDeleteTileFile:(int)a3 atPath:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncgetListTilesDirectory:(id)a3 type:(int)a4 time:(double)a5;
- (BOOL)syncgetRegionPreloadManifest:(void *)a3;
- (BOOL)syncgetTileStats:(void *)a3;
- (BOOL)syncgetTransitMacAddressesAmong:(void *)a3 nearLatitude:(double)a4 longitude:(double)a5 resultMacAddresses:(void *)a6;
- (CLTilesManagerAdapter)init;
- (id)syncgetTileFilePath:(int)a3 latitude:(double)a4 longitude:(double)a5 isFileAccessible:(BOOL *)a6 isTileNotExistingOnServer:(BOOL *)a7;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)enableAppTilesDownload:(BOOL)a3;
- (void)endService;
- (void)requestTileDownloadByType:(int)a3 lat:(double)a4 lon:(double)a5 seckey:(unint64_t)a6 details:(CLTileFileDownloadDetails *)a7;
- (void)requestTileDownloadByType:(int)a3 path:(id)a4 details:(CLTileFileDownloadDetails *)a5;
@end

@implementation CLTilesManagerAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199AE28 != -1) {
    dispatch_once(&qword_10199AE28, &stru_101878D60);
  }
  return (id)qword_10199AE20;
}

- (CLTilesManagerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLTilesManagerAdapter;
  return -[CLTilesManagerAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLTilesManagerProtocol,  &OBJC_PROTOCOL___CLTilesManagerClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
  {
    uint64_t v3 = sub_101265A28();
    sub_100C18D24(v3);
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
  int v2 = sub_1004FC938();
  if (v2)
  {
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101879158);
    }
    uint64_t v3 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "CLTilesManager is not supported in diagnostics mode",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101879158);
      }
      v7[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  0LL,  "CLTilesManager is not supported in diagnostics mode",  v7,  2);
      v6 = (uint8_t *)v5;
      sub_10029211C("Generic", 1LL, 0, 2LL, "+[CLTilesManagerAdapter isSupported]", "%s\n", v5);
      if (v6 != buf) {
        free(v6);
      }
    }
  }

  return v2 ^ 1;
}

- (void)requestTileDownloadByType:(int)a3 lat:(double)a4 lon:(double)a5 seckey:(unint64_t)a6 details:(CLTileFileDownloadDetails *)a7
{
  if ((a3 & 0xFFFFFFF7) - 1 >= 2)
  {
    v15 = (_Unwind_Exception *)sub_101265B9C(self, a2, a4, a5);
    _Unwind_Resume(v15);
  }

  double Current = CFAbsoluteTimeGetCurrent();
  v14 = -[CLTilesManagerAdapter adaptee](self, "adaptee");
  sub_1010DDBC0(&__p, "");
  sub_100C190F8((uint64_t)v14, a3, a6, &__p, (__int128 *)&a7->var0, a4, a5, Current);
}

- (void)requestTileDownloadByType:(int)a3 path:(id)a4 details:(CLTileFileDownloadDetails *)a5
{
  if ((a3 & 0xFFFFFFF7) - 1 >= 2)
  {
    v9 = (_Unwind_Exception *)sub_101265E6C(self, a2);
    _Unwind_Resume(v9);
  }

  sub_1010DDBC0(&__p, (char *)[a4 UTF8String]);
  double Current = CFAbsoluteTimeGetCurrent();
  sub_100C190F8( (uint64_t)-[CLTilesManagerAdapter adaptee](self, "adaptee"),  a3,  -1LL,  &__p,  (__int128 *)&a5->var0,  0.0,  0.0,  Current);
}

- (void)enableAppTilesDownload:(BOOL)a3
{
}

- (BOOL)syncgetTileStats:(void *)a3
{
  return 1;
}

- (id)syncgetTileFilePath:(int)a3 latitude:(double)a4 longitude:(double)a5 isFileAccessible:(BOOL *)a6 isTileNotExistingOnServer:(BOOL *)a7
{
  int v17 = a3;
  double v16 = a4;
  double v15 = a5;
  __int16 v14 = 0;
  __p[0] = 0LL;
  __p[1] = 0LL;
  uint64_t v13 = 0LL;
  if (sub_100C2FBF8( (uint64_t)-[CLTilesManagerAdapter adaptee](self, "adaptee"),  &v17,  &v16,  &v15,  (uint64_t)__p,  (_BYTE *)&v14 + 1,  &v14))
  {
    *a6 = HIBYTE(v14);
    *a7 = v14;
    if (v13 >= 0) {
      v9 = __p;
    }
    else {
      v9 = (void **)__p[0];
    }
    v10 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v9);
  }

  else
  {
    v10 = 0LL;
  }

  if (SHIBYTE(v13) < 0) {
    operator delete(__p[0]);
  }
  return v10;
}

- (BOOL)syncgetDeleteTileFile:(int)a3 atPath:(id)a4
{
  int v5 = a3;
  return sub_100C1C7A4( (uint64_t)-[CLTilesManagerAdapter adaptee](self, "adaptee"),  (unsigned int *)&v5,  (const char *)[a4 UTF8String]);
}

- (BOOL)syncgetAppAvailabilityForLocation:(id *)a3 radius:(float)a4 searchContext:(void *)a5 availabilityList:(void *)a6 includeRegionalApps:(BOOL)a7
{
  BOOL v7 = a7;
  v11 = -[CLTilesManagerAdapter adaptee](self, "adaptee", a3, a5);
  return sub_100C1CD00( (uint64_t)v11,  *(double *)(&a3->var0 + 1),  *(double *)((char *)&a3->var1.var0 + 4),  a4,  v12,  (uint64_t *)a6,  v7);
}

- (BOOL)syncgetRegionPreloadManifest:(void *)a3
{
  return sub_100C1E1C0((uint64_t)-[CLTilesManagerAdapter adaptee](self, "adaptee"), (uint64_t *)a3);
}

- (BOOL)syncgetTransitMacAddressesAmong:(void *)a3 nearLatitude:(double)a4 longitude:(double)a5 resultMacAddresses:(void *)a6
{
  return sub_100C1E66C((uint64_t)-[CLTilesManagerAdapter adaptee](self, "adaptee"), (id **)a3, (uint64_t)a6, a4, a5);
}

- (BOOL)syncgetListTilesDirectory:(id)a3 type:(int)a4 time:(double)a5
{
  v8 = -[CLTilesManagerAdapter adaptee](self, "adaptee");
  sub_1010DDBC0(__p, (char *)[a3 UTF8String]);
  BOOL v9 = sub_100C1EA44((uint64_t)v8, (uint64_t)__p, a4, a5);
  if (v12 < 0) {
    operator delete(__p[0]);
  }
  return v9;
}

@end
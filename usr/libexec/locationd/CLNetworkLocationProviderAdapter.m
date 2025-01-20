@interface CLNetworkLocationProviderAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncgetIsBroadConnection;
- (BOOL)syncgetMetric:(void *)a3;
- (CLNetworkLocationProviderAdapter)init;
- (int)syncgetBestMatchLocation:(CLDaemonLocation *)a3 forCell:(const void *)a4;
- (int)syncgetQueryLocationsForCells:(const void *)a3 useCache:(BOOL)a4;
- (int)syncgetQueryLocationsForWifis:(const void *)a3 useCache:(BOOL)a4 piggyback:(BOOL)a5 config:(const CLNetworkLocationRequestConfig *)a6;
- (int)syncgetQueryNearbys:(const CLDaemonLocation *)a3 forFenceKeys:(const void *)a4;
- (void)adaptee;
- (void)addResponseListener:(CLNetworkLocationServerResponseListener *)a3;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)fetchQueryLocationsForWifis:(id)a3 useCache:(BOOL)a4 piggyback:(BOOL)a5 config:(id)a6 withReply:(id)a7;
- (void)removeResponseListener:(CLNetworkLocationServerResponseListener *)a3;
- (void)resetRetryCounters:(id)a3;
- (void)setCurrentReachability:(int)a3;
- (void)setLocation_CDMA:(id)a3 forCell:(id)a4;
- (void)setLocation_GSM:(id)a3 forCell:(id)a4;
- (void)setLocation_LTE:(id)a3 forCell:(id)a4;
- (void)setLocation_NR:(id)a3 forCell:(id)a4;
- (void)setLocation_SCDMA:(id)a3 forCell:(id)a4;
- (void)setPrivateMode:(BOOL)a3;
@end

@implementation CLNetworkLocationProviderAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101996068 != -1) {
    dispatch_once(&qword_101996068, &stru_10183C1B8);
  }
  return (id)qword_101996060;
}

- (CLNetworkLocationProviderAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLNetworkLocationProviderAdapter;
  return -[CLNetworkLocationProviderAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLNetworkLocationProviderProtocol,  &OBJC_PROTOCOL___CLNetworkLocationProviderClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
  {
    uint64_t v3 = sub_10123AE68();
    sub_10049CD9C(v3);
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

- (void)setLocation_GSM:(id)a3 forCell:(id)a4
{
  if (a3)
  {
    [a3 clientLocation];
  }

  else
  {
    __int128 v14 = 0u;
    memset(v15, 0, 28);
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    __int128 v7 = 0u;
  }

  LODWORD(v17[1]) = DWORD2(v15[0]);
  *(_OWORD *)((char *)&v17[1] + 4) = *(_OWORD *)((char *)v15 + 12);
  v6 = -[CLNetworkLocationProviderAdapter adaptee]( self,  "adaptee",  v7,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  v15[0],  *(void *)&v15[1],  *((void *)&v15[1] + 1),  v7,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  *(void *)&v15[0],  v17[1],  (unint64_t)(*(_OWORD *)((char *)v15 + 12) >> 32),  v17[3]);
  (*((void (**)(__int128 *__return_ptr, id))a4 + 2))(&v7, a4);
  sub_10049CFC0((uint64_t)v6, (int *)&v7, (uint64_t)&v16);
}

- (void)setLocation_SCDMA:(id)a3 forCell:(id)a4
{
  if (a3)
  {
    [a3 clientLocation];
  }

  else
  {
    __int128 v14 = 0u;
    memset(v15, 0, 28);
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    __int128 v7 = 0u;
  }

  LODWORD(v17[1]) = DWORD2(v15[0]);
  *(_OWORD *)((char *)&v17[1] + 4) = *(_OWORD *)((char *)v15 + 12);
  v6 = -[CLNetworkLocationProviderAdapter adaptee]( self,  "adaptee",  v7,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  v15[0],  *(void *)&v15[1],  *((void *)&v15[1] + 1),  v7,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  *(void *)&v15[0],  v17[1],  (unint64_t)(*(_OWORD *)((char *)v15 + 12) >> 32),  v17[3]);
  (*((void (**)(__int128 *__return_ptr, id))a4 + 2))(&v7, a4);
  sub_10049D6DC((uint64_t)v6, (int *)&v7, (uint64_t)&v16);
}

- (void)setLocation_CDMA:(id)a3 forCell:(id)a4
{
  if (a3)
  {
    [a3 clientLocation];
  }

  else
  {
    __int128 v14 = 0u;
    memset(v15, 0, 28);
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    *(_OWORD *)__int128 v7 = 0u;
  }

  v18[6] = v13;
  v18[7] = v14;
  v19[0] = v15[0];
  *(_OWORD *)((char *)v19 + 12) = *(_OWORD *)((char *)v15 + 12);
  v18[2] = v9;
  v18[3] = v10;
  v18[4] = v11;
  v18[5] = v12;
  v18[0] = *(_OWORD *)v7;
  v18[1] = v8;
  v6 = -[CLNetworkLocationProviderAdapter adaptee](self, "adaptee", v7[0]);
  (*((void (**)(void **__return_ptr, id))a4 + 2))(v7, a4);
  sub_10049DE28((uint64_t)v6, (uint64_t)v7, (uint64_t)v18);
  if (v17 < 0) {
    operator delete(__p);
  }
  if (v7[1])
  {
    *(void **)&__int128 v8 = v7[1];
    operator delete(v7[1]);
  }

- (void)setLocation_LTE:(id)a3 forCell:(id)a4
{
  if (a3)
  {
    [a3 clientLocation];
  }

  else
  {
    __int128 v14 = 0u;
    memset(v15, 0, 28);
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    __int128 v7 = 0u;
  }

  LODWORD(v17[1]) = DWORD2(v15[0]);
  *(_OWORD *)((char *)&v17[1] + 4) = *(_OWORD *)((char *)v15 + 12);
  v6 = -[CLNetworkLocationProviderAdapter adaptee]( self,  "adaptee",  v7,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  v15[0],  *(void *)&v15[1],  *((void *)&v15[1] + 1),  v7,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  *(void *)&v15[0],  v17[1],  (unint64_t)(*(_OWORD *)((char *)v15 + 12) >> 32),  v17[3]);
  (*((void (**)(__int128 *__return_ptr, id))a4 + 2))(&v7, a4);
  sub_10049E6B8((uint64_t)v6, (unsigned int *)&v7, (uint64_t)&v16);
}

- (void)setLocation_NR:(id)a3 forCell:(id)a4
{
  if (a3)
  {
    [a3 clientLocation];
  }

  else
  {
    __int128 v14 = 0u;
    memset(v15, 0, 28);
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    __int128 v7 = 0u;
  }

  LODWORD(v17[1]) = DWORD2(v15[0]);
  *(_OWORD *)((char *)&v17[1] + 4) = *(_OWORD *)((char *)v15 + 12);
  v6 = -[CLNetworkLocationProviderAdapter adaptee]( self,  "adaptee",  v7,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  v15[0],  *(void *)&v15[1],  *((void *)&v15[1] + 1),  v7,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  *(void *)&v15[0],  v17[1],  (unint64_t)(*(_OWORD *)((char *)v15 + 12) >> 32),  v17[3]);
  (*((void (**)(__int128 *__return_ptr, id))a4 + 2))(&v7, a4);
  sub_10049EEF0((uint64_t)v6, (unsigned int *)&v7, (uint64_t)&v16);
}

- (BOOL)syncgetIsBroadConnection
{
  return sub_10049F678(-[CLNetworkLocationProviderAdapter adaptee](self, "adaptee"));
}

- (void)setPrivateMode:(BOOL)a3
{
  *((_BYTE *)-[CLNetworkLocationProviderAdapter adaptee](self, "adaptee") + 456) = a3;
}

- (BOOL)syncgetMetric:(void *)a3
{
  return 1;
}

- (int)syncgetQueryNearbys:(const CLDaemonLocation *)a3 forFenceKeys:(const void *)a4
{
  return sub_10049FB58((uint64_t)-[CLNetworkLocationProviderAdapter adaptee](self, "adaptee"), (uint64_t)a3, (uint64_t)a4);
}

- (void)setCurrentReachability:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = -[CLNetworkLocationProviderAdapter adaptee](self, "adaptee");
  (*(void (**)(void *, uint64_t))(*v4[56] + 32LL))(v4[56], v3);
}

- (void)addResponseListener:(CLNetworkLocationServerResponseListener *)a3
{
  uint64_t v3 = a3;
  sub_1001145B0( (uint64_t **)-[CLNetworkLocationProviderAdapter adaptee](self, "adaptee") + 73,  (unint64_t *)&v3,  (uint64_t *)&v3);
}

- (void)removeResponseListener:(CLNetworkLocationServerResponseListener *)a3
{
  uint64_t v3 = a3;
  sub_1004C40E4((uint64_t)-[CLNetworkLocationProviderAdapter adaptee](self, "adaptee") + 584, (unint64_t *)&v3);
}

- (void)resetRetryCounters:(id)a3
{
}

- (int)syncgetBestMatchLocation:(CLDaemonLocation *)a3 forCell:(const void *)a4
{
  return sub_1004A0520( (uint64_t)-[CLNetworkLocationProviderAdapter adaptee](self, "adaptee"),  (unsigned int *)a4,  (uint64_t)a3);
}

- (int)syncgetQueryLocationsForCells:(const void *)a3 useCache:(BOOL)a4
{
  return sub_1004A08DC((uint64_t)-[CLNetworkLocationProviderAdapter adaptee](self, "adaptee"), (uint64_t *)a3, a4);
}

- (int)syncgetQueryLocationsForWifis:(const void *)a3 useCache:(BOOL)a4 piggyback:(BOOL)a5 config:(const CLNetworkLocationRequestConfig *)a6
{
  return sub_1004AE46C( (uint64_t)-[CLNetworkLocationProviderAdapter adaptee](self, "adaptee"),  &qword_1019A1028,  &qword_1019A1058,  &qword_1019A1040,  &qword_1019A1070,  &qword_1019A1088,  (uint64_t **)a3,  a4,  a5,  (uint64_t)a6);
}

- (void)fetchQueryLocationsForWifis:(id)a3 useCache:(BOOL)a4 piggyback:(BOOL)a5 config:(id)a6 withReply:(id)a7
{
  BOOL v10 = a4;
  __int128 v12 = -[CLNetworkLocationProviderAdapter adaptee](self, "adaptee");
  (*((void (**)(void **__return_ptr, id))a3 + 2))(__p, a3);
  int v14 = (*((uint64_t (**)(id))a6 + 2))(a6);
  uint64_t v13 = sub_1004AE46C( (uint64_t)v12,  &qword_1019A1028,  &qword_1019A1058,  &qword_1019A1040,  &qword_1019A1070,  &qword_1019A1088,  (uint64_t **)__p,  v10,  a5,  (uint64_t)&v14);
  (*((void (**)(id, uint64_t))a7 + 2))(a7, v13);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

@end
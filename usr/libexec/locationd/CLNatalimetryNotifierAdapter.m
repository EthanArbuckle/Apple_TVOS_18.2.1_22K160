@interface CLNatalimetryNotifierAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLNatalimetryNotifierAdapter)init;
- (id)syncgetUserProfile;
- (id)syncgetUserProfileInternal;
- (int)syncgetQueryExerciseMinuteDataSince:(CLExerciseMinuteData *)a3 records:(void *)a4;
- (int)syncgetQueryNatalieDataSince:(CLNatalieData *)a3 records:(void *)a4;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)onCalorieAggregationActivity:(id)a3;
- (void)pause;
- (void)queryMetMinutesInTimeRange:(id)a3 withReply:(id)a4;
- (void)queryVO2MaxInputsFromRecord:(VO2MaxInput *)a3 withReply:(id)a4;
- (void)queryWorkoutMets:(id)a3 withReply:(id)a4;
- (void)refreshMetrics;
- (void)resetUserProfileForKeys:(id)a3;
- (void)resume;
- (void)setActiveVo2maxOverride:(BOOL)a3;
- (void)setUserProfile:(id)a3 merge:(BOOL)a4;
- (void)setUserProfileFromCMNatalimeter:(id)a3;
- (void)updatePAL:(double)a3;
@end

@implementation CLNatalimetryNotifierAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199EC08 != -1) {
    dispatch_once(&qword_10199EC08, &stru_101884B68);
  }
  return (id)qword_10199EC00;
}

- (CLNatalimetryNotifierAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLNatalimetryNotifierAdapter;
  return -[CLNatalimetryNotifierAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLNatalimetryNotifierProtocol,  &OBJC_PROTOCOL___CLNatalimetryNotifierClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier")) {
    sub_10127253C();
  }
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

- (void)updatePAL:(double)a3
{
  v4 = -[CLNatalimetryNotifierAdapter adaptee](self, "adaptee");
  float v5 = a3;
  sub_100E0BE90((uint64_t)v4, v5);
}

- (void)pause
{
  v2 = -[CLNatalimetryNotifierAdapter adaptee](self, "adaptee");
  (*(void (**)(void *))(*v2[346] + 24LL))(v2[346]);
}

- (void)resume
{
  v2 = -[CLNatalimetryNotifierAdapter adaptee](self, "adaptee");
  (*(void (**)(void *))(*v2[346] + 32LL))(v2[346]);
}

- (void)refreshMetrics
{
}

- (void)setActiveVo2maxOverride:(BOOL)a3
{
}

- (id)syncgetUserProfile
{
  return sub_100E0CA08((uint64_t)-[CLNatalimetryNotifierAdapter adaptee](self, "adaptee"));
}

- (id)syncgetUserProfileInternal
{
  return sub_100E0CB78((uint64_t)-[CLNatalimetryNotifierAdapter adaptee](self, "adaptee"));
}

- (void)setUserProfileFromCMNatalimeter:(id)a3
{
}

- (void)setUserProfile:(id)a3 merge:(BOOL)a4
{
}

- (void)resetUserProfileForKeys:(id)a3
{
}

- (int)syncgetQueryNatalieDataSince:(CLNatalieData *)a3 records:(void *)a4
{
  return sub_100F8ECFC( *((uint64_t **)-[CLNatalimetryNotifierAdapter adaptee](self, "adaptee") + 16),  (uint64_t)a3,  (void **)a4);
}

- (int)syncgetQueryExerciseMinuteDataSince:(CLExerciseMinuteData *)a3 records:(void *)a4
{
  return sub_1007122DC( *((uint64_t **)-[CLNatalimetryNotifierAdapter adaptee](self, "adaptee") + 24),  (uint64_t)a3,  (void **)a4);
}

- (void)queryMetMinutesInTimeRange:(id)a3 withReply:(id)a4
{
  __p = 0LL;
  v11 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v5 = sub_100E0D654((uint64_t)-[CLNatalimetryNotifierAdapter adaptee](self, "adaptee"), (uint64_t)&__p, a3.var0, a3.var1);
  if ((_DWORD)v5 == 100)
  {
    v6 = +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  ((char *)v11 - (_BYTE *)__p) >> 4);
    v7 = (double *)__p;
    v8 = v11;
    if (__p != v11)
    {
      do
      {
        id v9 = objc_msgSend([CMMetMinute alloc], "initWithSample:", *v7, v7[1]);
        -[NSMutableArray addObject:](v6, "addObject:", v9);

        v7 += 2;
      }

      while (v7 != v8);
    }

    (*((void (**)(id, NSMutableArray *, uint64_t))a4 + 2))(a4, v6, 100LL);
  }

  else
  {
    (*((void (**)(id, void, uint64_t))a4 + 2))(a4, 0LL, v5);
  }

  if (__p)
  {
    v11 = (double *)__p;
    operator delete(__p);
  }

- (void)queryWorkoutMets:(id)a3 withReply:(id)a4
{
  if (a3)
  {
    uuid_clear(v14);
    uuid_clear(v15);
    uint64_t v16 = 0LL;
    *(void *)buf = 0LL;
    uint64_t v13 = 0LL;
    [a3 getUUIDBytes:v11];
    uint64_t v7 = sub_100F902F8(*((void *)-[CLNatalimetryNotifierAdapter adaptee](self, "adaptee") + 16), v11, (uint64_t)buf);
    if ((_DWORD)v7 == 100) {
      (*((void (**)(id, id, uint64_t))a4 + 2))( a4,  [[CMWorkoutMetsData alloc] initWithCLWorkoutMets:buf],  100);
    }
    else {
      (*((void (**)(id, void, uint64_t))a4 + 2))(a4, 0LL, v7);
    }
  }

  else
  {
    if (qword_1019344D0 != -1) {
      dispatch_once(&qword_1019344D0, &stru_101884E60);
    }
    v8 = (os_log_s *)qword_1019344D8;
    if (os_log_type_enabled((os_log_t)qword_1019344D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "queryWorkoutMets nil sessionId", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019344D0 != -1) {
        dispatch_once(&qword_1019344D0, &stru_101884E60);
      }
      *(_WORD *)v11 = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019344D8,  0LL,  "queryWorkoutMets nil sessionId",  v11,  2);
      v10 = (uint8_t *)v9;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLNatalimetryNotifierAdapter queryWorkoutMets:withReply:]", "%s\n", v9);
      if (v10 != buf) {
        free(v10);
      }
    }

    (*((void (**)(id, void, uint64_t))a4 + 2))(a4, 0LL, 107LL);
  }

- (void)queryVO2MaxInputsFromRecord:(VO2MaxInput *)a3 withReply:(id)a4
{
  __p = 0LL;
  v17 = 0LL;
  uint64_t v18 = 0LL;
  v6 = (uint64_t *)*((void *)-[CLNatalimetryNotifierAdapter adaptee](self, "adaptee") + 362);
  __int128 v7 = *(_OWORD *)&a3->var12;
  __int128 v24 = *(_OWORD *)&a3->var8;
  __int128 v25 = v7;
  __int128 v26 = *(_OWORD *)&a3->var14;
  __int128 v8 = *(_OWORD *)&a3->var1[8];
  __int128 v20 = *(_OWORD *)&a3->var0;
  __int128 v21 = v8;
  __int128 v9 = *(_OWORD *)&a3->var6;
  __int128 v22 = *(_OWORD *)&a3->var3;
  __int128 v23 = v9;
  uint64_t v10 = sub_1006EBCCC(v6, (int *)&v20, &__p);
  if ((_DWORD)v10 == 100)
  {
    v11 = +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  0x6DB6DB6DB6DB6DB7LL * (((char *)v17 - (_BYTE *)__p) >> 4));
    uint64_t v12 = (__int128 *)__p;
    uint64_t v13 = v17;
    if (__p != v17)
    {
      do
      {
        __int128 v23 = v12[3];
        __int128 v24 = v12[4];
        __int128 v25 = v12[5];
        __int128 v26 = v12[6];
        __int128 v20 = *v12;
        __int128 v21 = v12[1];
        __int128 v22 = v12[2];
        id v14 = objc_alloc(&OBJC_CLASS___CMVO2MaxInputs);
        v19[4] = v24;
        v19[5] = v25;
        v19[6] = v26;
        v19[0] = v20;
        v19[1] = v21;
        v19[2] = v22;
        v19[3] = v23;
        id v15 = [v14 initWithSample:v19];
        -[NSMutableArray addObject:](v11, "addObject:", v15);

        v12 += 7;
      }

      while (v12 != v13);
    }

    (*((void (**)(id, NSMutableArray *, uint64_t))a4 + 2))(a4, v11, 100LL);
  }

  else
  {
    (*((void (**)(id, void, uint64_t))a4 + 2))(a4, 0LL, v10);
  }

  if (__p)
  {
    v17 = (__int128 *)__p;
    operator delete(__p);
  }

- (void)onCalorieAggregationActivity:(id)a3
{
}

+ (BOOL)isSupported
{
  if (qword_10199EC18 != -1) {
    dispatch_once(&qword_10199EC18, &stru_101884B88);
  }
  return byte_10199EC10;
}

@end
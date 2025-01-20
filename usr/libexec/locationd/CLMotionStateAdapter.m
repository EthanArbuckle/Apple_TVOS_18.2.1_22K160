@interface CLMotionStateAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLMotionStateAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)queryMotionStatesWithStartTime:(double)a3 endTime:(double)a4 isFromInternalClient:(BOOL)a5 withReply:(id)a6;
@end

@implementation CLMotionStateAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101995528 != -1) {
    dispatch_once(&qword_101995528, &stru_1018346B0);
  }
  return (id)qword_101995520;
}

- (CLMotionStateAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLMotionStateAdapter;
  return -[CLMotionStateAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLMotionStateProtocol,  &OBJC_PROTOCOL___CLMotionStateClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier")) {
    sub_10123624C();
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

- (void)queryMotionStatesWithStartTime:(double)a3 endTime:(double)a4 isFromInternalClient:(BOOL)a5 withReply:(id)a6
{
  BOOL v7 = a5;
  v35 = 0LL;
  v36 = 0LL;
  uint64_t v37 = 0LL;
  v10 = -[CLMotionStateAdapter adaptee](self, "adaptee");
  (*(void (**)(void *, BOOL, char **, double, double))(*(void *)v10 + 216LL))(v10, v7, &v35, a3, a4);
  v12 = v35;
  v11 = v36;
  unint64_t v13 = 0xF0F0F0F0F0F0F0F1LL * ((v36 - v35) >> 3);
  v14 = +[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", v13);
  if (v11 != v12)
  {
    uint64_t v15 = 0LL;
    unint64_t v16 = v13 - 1;
    if (v13 <= 1) {
      uint64_t v17 = 1LL;
    }
    else {
      uint64_t v17 = v13;
    }
    do
    {
      __int128 v18 = *(_OWORD *)&v35[v15 + 112];
      __int128 v32 = *(_OWORD *)&v35[v15 + 96];
      __int128 v33 = v18;
      uint64_t v34 = *(void *)&v35[v15 + 128];
      __int128 v19 = *(_OWORD *)&v35[v15 + 48];
      __int128 v28 = *(_OWORD *)&v35[v15 + 32];
      __int128 v29 = v19;
      __int128 v20 = *(_OWORD *)&v35[v15 + 80];
      __int128 v30 = *(_OWORD *)&v35[v15 + 64];
      __int128 v31 = v20;
      __int128 v21 = *(_OWORD *)&v35[v15 + 16];
      __int128 v26 = *(_OWORD *)&v35[v15];
      __int128 v27 = v21;
      double v22 = a4;
      if (v16) {
        double v22 = *(double *)&v35[v15 + 216] + -2.22044605e-16;
      }
      v23 = objc_alloc(&OBJC_CLASS___CMMotionActivity);
      v24 = -[CMMotionActivity initWithMotionActivity:endDate:]( v23,  "initWithMotionActivity:endDate:",  &v25,  +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  v22,  v26,  v27,  v28,  v29,  v30,  v31,  v32,  v33,  v34));
      -[NSMutableArray addObject:](v14, "addObject:", v24);

      --v16;
      v15 += 136LL;
      --v17;
    }

    while (v17);
  }

  (*((void (**)(id, NSMutableArray *))a6 + 2))(a6, v14);
  if (v35)
  {
    v36 = v35;
    operator delete(v35);
  }

@end
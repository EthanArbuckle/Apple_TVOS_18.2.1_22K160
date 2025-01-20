@interface CLMotionStateMediatorAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLMotionStateMediatorAdapter)init;
- (id)syncgetActivityOverride;
- (void)adaptee;
- (void)addClient:(id)a3 prepareSessionEndForSessionType:(int64_t)a4;
- (void)beginService;
- (void)beginWorkoutSession:(WorkoutSettings *)a3 withOverview:(id)a4 enableWorkoutChangeDetection:(BOOL)a5;
- (void)currentWorkoutActiveStateWithReply:(id)a3;
- (void)didExitGeoFence;
- (void)didTimeoutGeoFence;
- (void)didUpdateWeather:(id)a3;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)endWorkoutSession:(WorkoutSettings *)a3;
- (void)lastKnownIndoorOutdoorStateWithReply:(id)a3;
- (void)onOutdoorUpdate:(id)a3;
- (void)onVisit:(id)a3;
- (void)pauseWorkout:(WorkoutSettings *)a3;
- (void)registerForWorkoutSessionUpdates:(id)a3;
- (void)removeClient:(id)a3 prepareSessionEndForSessionType:(int64_t)a4;
- (void)resumeWorkout:(WorkoutSettings *)a3;
- (void)setCurrentWorkoutType:(WorkoutSettings *)a3 isManualTransition:(BOOL)a4;
- (void)setWorkoutSuggestedStopTimeout:(double)a3;
- (void)triggerWorkoutLocationEventForTesting:(int64_t)a3 withReply:(id)a4;
- (void)unregisterForWorkoutSessionUpdates:(id)a3;
- (void)updateWorkoutReminderMuteSetting:(int64_t)a3 mute:(BOOL)a4;
- (void)userDismissedWorkoutAlert;
- (void)workoutSnapshotWithReply:(id)a3;
@end

@implementation CLMotionStateMediatorAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101995850 != -1) {
    dispatch_once(&qword_101995850, &stru_101839630);
  }
  return (id)qword_101995848;
}

- (CLMotionStateMediatorAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLMotionStateMediatorAdapter;
  return -[CLMotionStateMediatorAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLMotionStateMediatorProtocol,  &OBJC_PROTOCOL___CLMotionStateMediatorClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier")) {
    sub_10123A340();
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

- (void)onOutdoorUpdate:(id)a3
{
  v4 = -[CLMotionStateMediatorAdapter adaptee](self, "adaptee");
  (*((void (**)(void *__return_ptr, id))a3 + 2))(v5, a3);
  sub_1004559C0((uint64_t)v4, (uint64_t)v5);
}

- (void)onVisit:(id)a3
{
  uint64_t v4 = *((void *)-[CLMotionStateMediatorAdapter adaptee](self, "adaptee") + 1043);
  if (v4) {
    sub_100960AE8(v4, a3);
  }
}

- (void)didUpdateWeather:(id)a3
{
  uint64_t v4 = (std::string *)*((void *)-[CLMotionStateMediatorAdapter adaptee](self, "adaptee") + 1043);
  if (v4) {
    sub_100960694(v4, a3);
  }
}

- (void)addClient:(id)a3 prepareSessionEndForSessionType:(int64_t)a4
{
}

- (void)removeClient:(id)a3 prepareSessionEndForSessionType:(int64_t)a4
{
}

- (void)setWorkoutSuggestedStopTimeout:(double)a3
{
}

- (void)userDismissedWorkoutAlert
{
}

- (void)triggerWorkoutLocationEventForTesting:(int64_t)a3 withReply:(id)a4
{
  else {
    uint64_t v5 = 108LL;
  }
  (*((void (**)(id, uint64_t))a4 + 2))(a4, v5);
}

- (void)lastKnownIndoorOutdoorStateWithReply:(id)a3
{
  uint64_t v4 = -[CLMotionStateMediatorAdapter adaptee](self, "adaptee");
  __int128 v5 = *(_OWORD *)(v4 + 10136);
  uint64_t v6 = *((void *)v4 + 1269);
  (*((void (**)(id, __int128 *))a3 + 2))(a3, &v5);
}

- (void)didExitGeoFence
{
  if (qword_101934680 != -1) {
    dispatch_once(&qword_101934680, &stru_1018399F8);
  }
  objc_super v3 = (os_log_s *)qword_101934688;
  if (os_log_type_enabled((os_log_t)qword_101934688, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "#gfc didExitGeoFence() received in adapter",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934680 != -1) {
      dispatch_once(&qword_101934680, &stru_1018399F8);
    }
    v5[0] = 0;
    uint64_t v4 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934688,  2LL,  "#gfc didExitGeoFence() received in adapter",  v5,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLMotionStateMediatorAdapter didExitGeoFence]", "%s\n", v4);
  }

  sub_100456814((uint64_t)-[CLMotionStateMediatorAdapter adaptee](self, "adaptee"));
}

- (void)didTimeoutGeoFence
{
  if (qword_101934680 != -1) {
    dispatch_once(&qword_101934680, &stru_1018399F8);
  }
  objc_super v3 = (os_log_s *)qword_101934688;
  if (os_log_type_enabled((os_log_t)qword_101934688, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#gfc didTimeout() received in adapter", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934680 != -1) {
      dispatch_once(&qword_101934680, &stru_1018399F8);
    }
    v5[0] = 0;
    uint64_t v4 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934688,  2LL,  "#gfc didTimeout() received in adapter",  v5,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLMotionStateMediatorAdapter didTimeoutGeoFence]", "%s\n", v4);
  }

  sub_100456B8C((uint64_t)-[CLMotionStateMediatorAdapter adaptee](self, "adaptee"));
}

- (id)syncgetActivityOverride
{
  uint64_t v12 = v14;
  v13 = v15;
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      unint64_t v3 = __ldxr(p_shared_owners);
    while (__stxr(v3 + 1, p_shared_owners));
  }

  id v4 = sub_100456EA8(&v12);
  __int128 v5 = v13;
  if (v13)
  {
    uint64_t v6 = (unint64_t *)&v13->__shared_owners_;
    do
      unint64_t v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }

  v8 = v15;
  if (v15)
  {
    v9 = (unint64_t *)&v15->__shared_owners_;
    do
      unint64_t v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }

  return v4;
}

- (void)registerForWorkoutSessionUpdates:(id)a3
{
}

- (void)unregisterForWorkoutSessionUpdates:(id)a3
{
}

- (void)beginWorkoutSession:(WorkoutSettings *)a3 withOverview:(id)a4 enableWorkoutChangeDetection:(BOOL)a5
{
  BOOL v5 = a5;
  v8 = -[CLMotionStateMediatorAdapter adaptee](self, "adaptee");
  (*((void (**)(void **__return_ptr, id))a4 + 2))(v9, a4);
  sub_1004573C8((uint64_t)v8, a3->var0, (uint64_t)v9, v5);
  sub_1002C5F18(v11);
  if (v10 < 0) {
    operator delete(v9[2]);
  }
}

- (void)setCurrentWorkoutType:(WorkoutSettings *)a3 isManualTransition:(BOOL)a4
{
}

- (void)endWorkoutSession:(WorkoutSettings *)a3
{
}

- (void)pauseWorkout:(WorkoutSettings *)a3
{
}

- (void)resumeWorkout:(WorkoutSettings *)a3
{
}

- (void)currentWorkoutActiveStateWithReply:(id)a3
{
  __int128 __src = 0u;
  memset(v33, 0, sizeof(v33));
  id v4 = -[CLMotionStateMediatorAdapter adaptee](self, "adaptee");
  int v15 = v4[2219];
  __int128 v23 = *((_OWORD *)v4 + 602);
  __int128 v24 = *((_OWORD *)v4 + 603);
  __int128 v25 = *((_OWORD *)v4 + 604);
  uint64_t v26 = *((void *)v4 + 1210);
  __int128 v19 = *((_OWORD *)v4 + 598);
  __int128 v20 = *((_OWORD *)v4 + 599);
  __int128 v21 = *((_OWORD *)v4 + 600);
  __int128 v22 = *((_OWORD *)v4 + 601);
  __int128 v16 = *((_OWORD *)v4 + 595);
  __int128 v17 = *((_OWORD *)v4 + 596);
  __int128 v18 = *((_OWORD *)v4 + 597);
  sub_10046F5F4((uint64_t)&v27, (uint64_t)(v4 + 2196));
  v7[0] = &v8;
  v7[1] = v34;
  v7[2] = &v31;
  sub_1004703A0((uint64_t)v7, (uint64_t)&v15);
  sub_10041385C(v30);
  if (v29 < 0) {
    operator delete(__p);
  }
  uint64_t v5 = v8;
  v13[8] = v34[8];
  v13[9] = v34[9];
  uint64_t v14 = v35;
  v13[4] = v34[4];
  v13[5] = v34[5];
  v13[6] = v34[6];
  v13[7] = v34[7];
  v13[0] = v34[0];
  v13[1] = v34[1];
  v13[2] = v34[2];
  v13[3] = v34[3];
  __int128 v9 = v31;
  if (SHIBYTE(v33[0]) < 0)
  {
    sub_1010DD48C(&v10, (void *)__src, *((unint64_t *)&__src + 1));
  }

  else
  {
    __int128 v10 = __src;
    uint64_t v11 = v33[0];
  }

  sub_10046A230((uint64_t)v12, &v33[1]);
  id v6 = sub_1004583A4(&v9);
  (*((void (**)(id, uint64_t, _OWORD *, id))a3 + 2))(a3, v5, v13, v6);
  sub_10041385C(v12);
  if (SHIBYTE(v11) < 0) {
    operator delete((void *)v10);
  }
  sub_10041385C(&v33[1]);
  if (SHIBYTE(v33[0]) < 0) {
    operator delete((void *)__src);
  }
}

- (void)workoutSnapshotWithReply:(id)a3
{
  id v4 = -[CLMotionStateMediatorAdapter adaptee](self, "adaptee");
  __int128 v5 = v4[630];
  v13[12] = v4[629];
  v13[13] = v5;
  __int128 v6 = v4[632];
  v13[14] = v4[631];
  v13[15] = v6;
  __int128 v7 = v4[626];
  v13[8] = v4[625];
  v13[9] = v7;
  __int128 v8 = v4[628];
  _OWORD v13[10] = v4[627];
  v13[11] = v8;
  __int128 v9 = v4[622];
  v13[4] = v4[621];
  v13[5] = v9;
  __int128 v10 = v4[624];
  v13[6] = v4[623];
  v13[7] = v10;
  __int128 v11 = v4[618];
  v13[0] = v4[617];
  v13[1] = v11;
  __int128 v12 = v4[620];
  v13[2] = v4[619];
  v13[3] = v12;
  (*((void (**)(id, _OWORD *))a3 + 2))(a3, v13);
}

- (void)updateWorkoutReminderMuteSetting:(int64_t)a3 mute:(BOOL)a4
{
}

+ (BOOL)isSupported
{
  if (qword_101995860 != -1) {
    dispatch_once(&qword_101995860, &stru_101839650);
  }
  return byte_101995858;
}

@end
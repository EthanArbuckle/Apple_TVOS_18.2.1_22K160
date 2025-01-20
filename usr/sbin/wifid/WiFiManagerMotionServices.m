@interface WiFiManagerMotionServices
- (CMActivityAlarm)drivingAlarm;
- (CMActivityAlarm)walkingAlarm;
- (CMMotionActivityManager)activityManager;
- (NSOperationQueue)motionQ;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)serialActivityDispatchQ;
- (WiFiManagerMotionServices)init;
- (__WiFiManager)manager;
- (double)drivingEndedAlarmTriggerDuration;
- (double)drivingStartedAlarmTriggerDuration;
- (double)motionStartTime;
- (double)walkingEndedAlarmTriggerDuration;
- (double)walkingStartedAlarmTriggerDuration;
- (int)motionState;
- (void)dealloc;
- (void)dispatchMotionCallback;
- (void)motionStateChangeCb;
- (void)setActivityManager:(id)a3;
- (void)setDrivingAlarm:(id)a3;
- (void)setDrivingEndedAlarmTriggerDuration:(double)a3;
- (void)setDrivingStartedAlarmTriggerDuration:(double)a3;
- (void)setManager:(__WiFiManager *)a3;
- (void)setMotionQ:(id)a3;
- (void)setMotionStartTime:(double)a3;
- (void)setMotionState:(int)a3;
- (void)setMotionStateChangeCb:(void *)a3;
- (void)setQueue:(id)a3;
- (void)setSerialActivityDispatchQ:(id)a3;
- (void)setWalkingAlarm:(id)a3;
- (void)setWalkingEndedAlarmTriggerDuration:(double)a3;
- (void)setWalkingStartedAlarmTriggerDuration:(double)a3;
- (void)setupDrivingEndedAlarm;
- (void)setupDrivingStartedAlarm;
- (void)setupWalkingEndedAlarm;
- (void)setupWalkingStartedAlarm;
- (void)startMonitoringMotionState;
- (void)stopMonitoringMotionState;
@end

@implementation WiFiManagerMotionServices

- (WiFiManagerMotionServices)init
{
  if (objc_opt_class(&OBJC_CLASS___CMMotionActivityManager))
  {
    if (+[CMMotionActivityManager isActivityAvailable](&OBJC_CLASS___CMMotionActivityManager, "isActivityAvailable"))
    {
      v5.receiver = self;
      v5.super_class = (Class)&OBJC_CLASS___WiFiManagerMotionServices;
      result = -[WiFiManagerMotionServices init](&v5, "init");
      if (result) {
        return result;
      }
      self = 0LL;
    }

    else
    {
      v4 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: [MOTION] this device does not support motion data",  "-[WiFiManagerMotionServices init]");
      }
      objc_autoreleasePoolPop(v4);
    }
  }

  return 0LL;
}

- (void)startMonitoringMotionState
{
  v3 = objc_autoreleasePoolPush();
  v4 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s",  "-[WiFiManagerMotionServices startMonitoringMotionState]");
  }
  objc_autoreleasePoolPop(v4);
  self->_activityManager = objc_alloc_init(&OBJC_CLASS___CMMotionActivityManager);
  objc_super v5 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
  self->_motionQ = v5;
  -[NSOperationQueue setName:](v5, "setName:", @"WiFiManagerMotionServicesQueue");
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10008FC20;
  v6[3] = &unk_1001E45E8;
  v6[4] = self;
  -[CMMotionActivityManager startActivityUpdatesToQueue:withHandler:]( -[WiFiManagerMotionServices activityManager](self, "activityManager"),  "startActivityUpdatesToQueue:withHandler:",  -[WiFiManagerMotionServices motionQ](self, "motionQ"),  v6);
  objc_autoreleasePoolPop(v3);
}

- (void)dealloc
{
  v3 = objc_autoreleasePoolPush();
  serialActivityDispatchQ = (dispatch_object_s *)self->_serialActivityDispatchQ;
  if (serialActivityDispatchQ) {
    dispatch_release(serialActivityDispatchQ);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___WiFiManagerMotionServices;
  -[WiFiManagerMotionServices dealloc](&v5, "dealloc");
  objc_autoreleasePoolPop(v3);
}

- (void)dispatchMotionCallback
{
  v3 = objc_autoreleasePoolPush();
  if (-[WiFiManagerMotionServices motionStateChangeCb](self, "motionStateChangeCb"))
  {
    v4 = -[WiFiManagerMotionServices motionStateChangeCb](self, "motionStateChangeCb");
    objc_super v5 = -[WiFiManagerMotionServices manager](self, "manager");
    uint64_t v6 = -[WiFiManagerMotionServices motionState](self, "motionState");
    -[WiFiManagerMotionServices motionStartTime](self, "motionStartTime");
    v4(v5, v6);
  }

  else
  {
    v7 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:4 message:"motionStateChangeCb is NULL!"];
    }
    objc_autoreleasePoolPop(v7);
  }

  objc_autoreleasePoolPop(v3);
}

- (void)stopMonitoringMotionState
{
  v3 = objc_autoreleasePoolPush();
  -[CMMotionActivityManager stopActivityUpdates]( -[WiFiManagerMotionServices activityManager](self, "activityManager"),  "stopActivityUpdates");
  objc_autoreleasePoolPop(v3);
}

- (void)setupWalkingStartedAlarm
{
  v3 = objc_autoreleasePoolPush();
  if ((+[CMActivityAlarm activityAlarmAvailable](&OBJC_CLASS___CMActivityAlarm, "activityAlarmAvailable") & 1) != 0)
  {
    if (!self->_serialActivityDispatchQ)
    {
      v4 = off_100218EB0;
      objc_super v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      self->_serialActivityDispatchQ = (OS_dispatch_queue *)dispatch_queue_create(v4, v5);
    }

    -[WiFiManagerMotionServices walkingStartedAlarmTriggerDuration](self, "walkingStartedAlarmTriggerDuration");
    double v7 = v6;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000900CC;
    v10[3] = &unk_1001E4610;
    v10[4] = self;
    self->_walkingAlarm = -[CMActivityAlarm initWithTrigger:duration:onQueue:withHandler:]( objc_alloc(&OBJC_CLASS___CMActivityAlarm),  "initWithTrigger:duration:onQueue:withHandler:",  2LL,  -[WiFiManagerMotionServices serialActivityDispatchQ](self, "serialActivityDispatchQ"),  v10,  v6);
    v8 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: [MOTION] Setting up Walking Started Alarm, dur:%.1fsecs",  "-[WiFiManagerMotionServices setupWalkingStartedAlarm]",  *(void *)&v7);
    }
  }

  else
  {
    v8 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: [MOTION] activity alarm is not available",  "-[WiFiManagerMotionServices setupWalkingStartedAlarm]",  v9);
    }
  }

  objc_autoreleasePoolPop(v8);
  objc_autoreleasePoolPop(v3);
}

- (void)setupWalkingEndedAlarm
{
  v3 = objc_autoreleasePoolPush();
  if ((+[CMActivityAlarm activityAlarmAvailable](&OBJC_CLASS___CMActivityAlarm, "activityAlarmAvailable") & 1) != 0)
  {
    if (!self->_serialActivityDispatchQ)
    {
      v4 = off_100218EB0;
      objc_super v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      self->_serialActivityDispatchQ = (OS_dispatch_queue *)dispatch_queue_create(v4, v5);
    }

    -[WiFiManagerMotionServices walkingEndedAlarmTriggerDuration](self, "walkingEndedAlarmTriggerDuration");
    double v7 = v6;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000902FC;
    v10[3] = &unk_1001E4610;
    v10[4] = self;
    self->_walkingAlarm = -[CMActivityAlarm initWithTrigger:duration:onQueue:withHandler:]( objc_alloc(&OBJC_CLASS___CMActivityAlarm),  "initWithTrigger:duration:onQueue:withHandler:",  0LL,  -[WiFiManagerMotionServices serialActivityDispatchQ](self, "serialActivityDispatchQ"),  v10,  v6);
    v8 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: [MOTION] Setting up Walking Ended Alarm, dur:%.1fsecs",  "-[WiFiManagerMotionServices setupWalkingEndedAlarm]",  *(void *)&v7);
    }
  }

  else
  {
    v8 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: [MOTION] activity alarm is not available",  "-[WiFiManagerMotionServices setupWalkingEndedAlarm]",  v9);
    }
  }

  objc_autoreleasePoolPop(v8);
  objc_autoreleasePoolPop(v3);
}

- (void)setupDrivingStartedAlarm
{
  v3 = objc_autoreleasePoolPush();
  if ((+[CMActivityAlarm activityAlarmAvailable](&OBJC_CLASS___CMActivityAlarm, "activityAlarmAvailable") & 1) != 0)
  {
    if (!self->_serialActivityDispatchQ)
    {
      v4 = off_100218EB0;
      objc_super v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      self->_serialActivityDispatchQ = (OS_dispatch_queue *)dispatch_queue_create(v4, v5);
    }

    -[WiFiManagerMotionServices drivingStartedAlarmTriggerDuration](self, "drivingStartedAlarmTriggerDuration");
    double v7 = v6;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10009052C;
    v10[3] = &unk_1001E4610;
    v10[4] = self;
    self->_drivingAlarm = -[CMActivityAlarm initWithTrigger:duration:onQueue:withHandler:]( objc_alloc(&OBJC_CLASS___CMActivityAlarm),  "initWithTrigger:duration:onQueue:withHandler:",  4LL,  -[WiFiManagerMotionServices serialActivityDispatchQ](self, "serialActivityDispatchQ"),  v10,  v6);
    v8 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: [MOTION] Setting up Driving Started Alarm, dur:%.1fsecs",  "-[WiFiManagerMotionServices setupDrivingStartedAlarm]",  *(void *)&v7);
    }
  }

  else
  {
    v8 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: [MOTION] activity alarm is not available",  "-[WiFiManagerMotionServices setupDrivingStartedAlarm]",  v9);
    }
  }

  objc_autoreleasePoolPop(v8);
  objc_autoreleasePoolPop(v3);
}

- (void)setupDrivingEndedAlarm
{
  v3 = objc_autoreleasePoolPush();
  if ((+[CMActivityAlarm activityAlarmAvailable](&OBJC_CLASS___CMActivityAlarm, "activityAlarmAvailable") & 1) != 0)
  {
    if (!self->_serialActivityDispatchQ)
    {
      v4 = off_100218EB0;
      objc_super v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      self->_serialActivityDispatchQ = (OS_dispatch_queue *)dispatch_queue_create(v4, v5);
    }

    -[WiFiManagerMotionServices drivingEndedAlarmTriggerDuration](self, "drivingEndedAlarmTriggerDuration");
    double v7 = v6;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10009075C;
    v10[3] = &unk_1001E4610;
    v10[4] = self;
    self->_drivingAlarm = -[CMActivityAlarm initWithTrigger:duration:onQueue:withHandler:]( objc_alloc(&OBJC_CLASS___CMActivityAlarm),  "initWithTrigger:duration:onQueue:withHandler:",  10LL,  -[WiFiManagerMotionServices serialActivityDispatchQ](self, "serialActivityDispatchQ"),  v10,  v6);
    v8 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: [MOTION] Setting up Driving Ended Alarm, dur:%.1fsecs",  "-[WiFiManagerMotionServices setupDrivingEndedAlarm]",  *(void *)&v7);
    }
  }

  else
  {
    v8 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: [MOTION] activity alarm is not available",  "-[WiFiManagerMotionServices setupDrivingEndedAlarm]",  v9);
    }
  }

  objc_autoreleasePoolPop(v8);
  objc_autoreleasePoolPop(v3);
}

- (CMMotionActivityManager)activityManager
{
  return self->_activityManager;
}

- (void)setActivityManager:(id)a3
{
}

- (NSOperationQueue)motionQ
{
  return self->_motionQ;
}

- (void)setMotionQ:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void)motionStateChangeCb
{
  return self->_motionStateChangeCb;
}

- (void)setMotionStateChangeCb:(void *)a3
{
  self->_motionStateChangeCb = a3;
}

- (__WiFiManager)manager
{
  return self->_manager;
}

- (void)setManager:(__WiFiManager *)a3
{
  self->_manager = a3;
}

- (int)motionState
{
  return self->_motionState;
}

- (void)setMotionState:(int)a3
{
  self->_motionState = a3;
}

- (OS_dispatch_queue)serialActivityDispatchQ
{
  return self->_serialActivityDispatchQ;
}

- (void)setSerialActivityDispatchQ:(id)a3
{
}

- (CMActivityAlarm)drivingAlarm
{
  return self->_drivingAlarm;
}

- (void)setDrivingAlarm:(id)a3
{
}

- (CMActivityAlarm)walkingAlarm
{
  return self->_walkingAlarm;
}

- (void)setWalkingAlarm:(id)a3
{
}

- (double)drivingStartedAlarmTriggerDuration
{
  return self->_drivingStartedAlarmTriggerDuration;
}

- (void)setDrivingStartedAlarmTriggerDuration:(double)a3
{
  self->_drivingStartedAlarmTriggerDuration = a3;
}

- (double)drivingEndedAlarmTriggerDuration
{
  return self->_drivingEndedAlarmTriggerDuration;
}

- (void)setDrivingEndedAlarmTriggerDuration:(double)a3
{
  self->_drivingEndedAlarmTriggerDuration = a3;
}

- (double)walkingStartedAlarmTriggerDuration
{
  return self->_walkingStartedAlarmTriggerDuration;
}

- (void)setWalkingStartedAlarmTriggerDuration:(double)a3
{
  self->_walkingStartedAlarmTriggerDuration = a3;
}

- (double)walkingEndedAlarmTriggerDuration
{
  return self->_walkingEndedAlarmTriggerDuration;
}

- (void)setWalkingEndedAlarmTriggerDuration:(double)a3
{
  self->_walkingEndedAlarmTriggerDuration = a3;
}

- (double)motionStartTime
{
  return self->_motionStartTime;
}

- (void)setMotionStartTime:(double)a3
{
  self->_motionStartTime = a3;
}

@end
@interface CLWorkoutDistanceCoreAnalytics
+ (BOOL)supportsSecureCoding;
- (CLWorkoutDistanceCoreAnalytics)initWithBeginTime:(double)a3 endTime:(double)a4 totalDistanceStepCount:(double)a5 totalDistanceStepCountMobility:(double)a6 totalDistanceOdometer:(double)a7 totalDistanceFused:(double)a8 percentageRemoteGPSSource:(double)a9 meanPaceStepCount:(double)a10 meanPaceFinalFused:(double)a11 totalStepCount:(int)a12;
- (CLWorkoutDistanceCoreAnalytics)initWithCoder:(id)a3;
- (CLWorkoutDistanceCoreAnalytics)initWithWorkoutDistanceMeasures:(const WorkoutDistanceMeasures *)a3;
- (double)beginTime;
- (double)endTime;
- (double)meanPaceFinalFused;
- (double)meanPaceStepCount;
- (double)percentageRemoteGPSSource;
- (double)totalDistanceFused;
- (double)totalDistanceOdometer;
- (double)totalDistanceStepCount;
- (double)totalDistanceStepCountMobility;
- (id)description;
- (int)totalStepCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLWorkoutDistanceCoreAnalytics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLWorkoutDistanceCoreAnalytics)initWithCoder:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CLWorkoutDistanceCoreAnalytics;
  v4 = -[CLWorkoutDistanceCoreAnalytics init](&v15, "init");
  if (v4)
  {
    [a3 decodeDoubleForKey:@"beginTime"];
    v4->_beginTime = v5;
    [a3 decodeDoubleForKey:@"endTime"];
    v4->_endTime = v6;
    [a3 decodeDoubleForKey:@"totalDistanceStepCount"];
    v4->_totalDistanceStepCount = v7;
    [a3 decodeDoubleForKey:@"totalDistanceStepCountMobility"];
    v4->_totalDistanceStepCountMobility = v8;
    [a3 decodeDoubleForKey:@"totalDistanceOdometer"];
    v4->_totalDistanceOdometer = v9;
    [a3 decodeDoubleForKey:@"totalDistanceFused"];
    v4->_totalDistanceFused = v10;
    [a3 decodeDoubleForKey:@"percentageRemoteGPSSource"];
    v4->_percentageRemoteGPSSource = v11;
    [a3 decodeDoubleForKey:@"meanPaceStepCount"];
    v4->_meanPaceStepCount = v12;
    [a3 decodeDoubleForKey:@"meanPaceFinalFused"];
    v4->_meanPaceFinalFused = v13;
    v4->_totalStepCount = [a3 decodeInt32ForKey:@"totalStepCount"];
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CLWorkoutDistanceCoreAnalytics)initWithBeginTime:(double)a3 endTime:(double)a4 totalDistanceStepCount:(double)a5 totalDistanceStepCountMobility:(double)a6 totalDistanceOdometer:(double)a7 totalDistanceFused:(double)a8 percentageRemoteGPSSource:(double)a9 meanPaceStepCount:(double)a10 meanPaceFinalFused:(double)a11 totalStepCount:(int)a12
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___CLWorkoutDistanceCoreAnalytics;
  result = -[CLWorkoutDistanceCoreAnalytics init](&v22, "init");
  if (result)
  {
    result->_beginTime = a3;
    result->_endTime = a4;
    result->_totalDistanceStepCount = a5;
    result->_totalDistanceStepCountMobility = a6;
    result->_totalDistanceOdometer = a7;
    result->_totalDistanceFused = a8;
    result->_percentageRemoteGPSSource = a9;
    result->_meanPaceStepCount = a10;
    result->_meanPaceFinalFused = a11;
    result->_totalStepCount = a12;
  }

  return result;
}

- (CLWorkoutDistanceCoreAnalytics)initWithWorkoutDistanceMeasures:(const WorkoutDistanceMeasures *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CLWorkoutDistanceCoreAnalytics;
  result = -[CLWorkoutDistanceCoreAnalytics init](&v5, "init");
  if (result)
  {
    result->_beginTime = a3->var0;
    result->_endTime = a3->var1;
    result->_totalDistanceStepCount = a3->var2;
    result->_totalDistanceStepCountMobility = a3->var3;
    result->_totalDistanceOdometer = a3->var4;
    result->_totalDistanceFused = a3->var5;
    result->_percentageRemoteGPSSource = a3->var6;
    result->_meanPaceStepCount = a3->var7;
    result->_meanPaceFinalFused = a3->var8;
    result->_totalStepCount = a3->var9;
  }

  return result;
}

- (id)description
{
  v4 = NSStringFromClass(v3);
  -[CLWorkoutDistanceCoreAnalytics beginTime](self, "beginTime");
  uint64_t v22 = v5;
  -[CLWorkoutDistanceCoreAnalytics endTime](self, "endTime");
  uint64_t v7 = v6;
  -[CLWorkoutDistanceCoreAnalytics totalDistanceStepCount](self, "totalDistanceStepCount");
  uint64_t v9 = v8;
  -[CLWorkoutDistanceCoreAnalytics totalDistanceStepCount](self, "totalDistanceStepCount");
  uint64_t v11 = v10;
  -[CLWorkoutDistanceCoreAnalytics totalDistanceOdometer](self, "totalDistanceOdometer");
  uint64_t v13 = v12;
  -[CLWorkoutDistanceCoreAnalytics totalDistanceFused](self, "totalDistanceFused");
  uint64_t v15 = v14;
  -[CLWorkoutDistanceCoreAnalytics percentageRemoteGPSSource](self, "percentageRemoteGPSSource");
  uint64_t v17 = v16;
  -[CLWorkoutDistanceCoreAnalytics meanPaceStepCount](self, "meanPaceStepCount");
  uint64_t v19 = v18;
  -[CLWorkoutDistanceCoreAnalytics meanPaceFinalFused](self, "meanPaceFinalFused");
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@,<beginTime %f, endTime %f, totalDistanceStepCount %f, totalDistanceStepCountMobility %f, totalDistanceOdometer %f, totalDistanceFused %f, percentageRemoteGPSSource %f, meanPaceStepCount %f, meanPaceFinalFused %f, totalStepCount %d>",  v4,  v22,  v7,  v9,  v11,  v13,  v15,  v17,  v19,  v20,  -[CLWorkoutDistanceCoreAnalytics totalStepCount](self, "totalStepCount"));
}

- (double)beginTime
{
  return self->_beginTime;
}

- (double)endTime
{
  return self->_endTime;
}

- (double)totalDistanceStepCount
{
  return self->_totalDistanceStepCount;
}

- (double)totalDistanceStepCountMobility
{
  return self->_totalDistanceStepCountMobility;
}

- (double)totalDistanceOdometer
{
  return self->_totalDistanceOdometer;
}

- (double)totalDistanceFused
{
  return self->_totalDistanceFused;
}

- (double)percentageRemoteGPSSource
{
  return self->_percentageRemoteGPSSource;
}

- (double)meanPaceStepCount
{
  return self->_meanPaceStepCount;
}

- (double)meanPaceFinalFused
{
  return self->_meanPaceFinalFused;
}

- (int)totalStepCount
{
  return self->_totalStepCount;
}

@end
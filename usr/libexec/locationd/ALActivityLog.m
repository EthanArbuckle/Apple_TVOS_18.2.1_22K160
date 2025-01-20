@interface ALActivityLog
- (ALActivityOverrideMsg)activityOverrideMsg;
- (ALCLAllDayHeartRate)allDayHeartRate;
- (ALCLBodyMetrics)bodyMetrics;
- (ALCLElevationDeprecated)elevationDeprecated;
- (ALCLIDSStatus)idsStatus;
- (ALCLJacksonData)jacksonData;
- (ALCLNatalieDataDeprecated)natalieData;
- (ALCLOdometer)odometer;
- (ALCLRowingModel)rowingModel;
- (ALCLSedentaryAlarmData)sedentaryAlarmData;
- (ALCLSedentaryAlarmDataDeprecated)sedentaryAlarmDataDeprecated;
- (ALCLSessionCatherine)sessionCatherineData;
- (ALCLStairClimbingModel)stairClimbingModel;
- (ALCLStepCountEntry)stepCountData;
- (ALCLStrideCalEntry)strideCalData;
- (ALCLStrideCalEntryDeprecated)strideCalDataDeprecated;
- (ALCMCalorieData)calorieData;
- (ALCMCalorieDataDeprecated)calorieDataDeprecated;
- (ALCMCoarseElevation)coarseElevation;
- (ALCMCoarseElevationDeprecated)coarseElevationDeprecated;
- (ALCMElevation)elevation;
- (ALCMExerciseMinute)exerciseMinute;
- (ALCMFitnessTracking)fitnessTracking;
- (ALCMWorkoutEvent)workoutEvent;
- (ALCMWorkoutEventDeprecated)workoutEventDeprecated;
- (ALMotionState)motionState;
- (BOOL)hasActivityOverrideMsg;
- (BOOL)hasAllDayHeartRate;
- (BOOL)hasBodyMetrics;
- (BOOL)hasCalorieData;
- (BOOL)hasCalorieDataDeprecated;
- (BOOL)hasCoarseElevation;
- (BOOL)hasCoarseElevationDeprecated;
- (BOOL)hasElevation;
- (BOOL)hasElevationDeprecated;
- (BOOL)hasExerciseMinute;
- (BOOL)hasFitnessTracking;
- (BOOL)hasIdsStatus;
- (BOOL)hasJacksonData;
- (BOOL)hasMotionState;
- (BOOL)hasNatalieData;
- (BOOL)hasOdometer;
- (BOOL)hasRowingModel;
- (BOOL)hasSedentaryAlarmData;
- (BOOL)hasSedentaryAlarmDataDeprecated;
- (BOOL)hasSessionCatherineData;
- (BOOL)hasStairClimbingModel;
- (BOOL)hasStepCountData;
- (BOOL)hasStrideCalData;
- (BOOL)hasStrideCalDataDeprecated;
- (BOOL)hasWorkoutEvent;
- (BOOL)hasWorkoutEventDeprecated;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setActivityOverrideMsg:(id)a3;
- (void)setAllDayHeartRate:(id)a3;
- (void)setBodyMetrics:(id)a3;
- (void)setCalorieData:(id)a3;
- (void)setCalorieDataDeprecated:(id)a3;
- (void)setCoarseElevation:(id)a3;
- (void)setCoarseElevationDeprecated:(id)a3;
- (void)setElevation:(id)a3;
- (void)setElevationDeprecated:(id)a3;
- (void)setExerciseMinute:(id)a3;
- (void)setFitnessTracking:(id)a3;
- (void)setIdsStatus:(id)a3;
- (void)setJacksonData:(id)a3;
- (void)setMotionState:(id)a3;
- (void)setNatalieData:(id)a3;
- (void)setOdometer:(id)a3;
- (void)setRowingModel:(id)a3;
- (void)setSedentaryAlarmData:(id)a3;
- (void)setSedentaryAlarmDataDeprecated:(id)a3;
- (void)setSessionCatherineData:(id)a3;
- (void)setStairClimbingModel:(id)a3;
- (void)setStepCountData:(id)a3;
- (void)setStrideCalData:(id)a3;
- (void)setStrideCalDataDeprecated:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setWorkoutEvent:(id)a3;
- (void)setWorkoutEventDeprecated:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALActivityLog

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALActivityLog;
  -[ALActivityLog dealloc](&v3, "dealloc");
}

- (BOOL)hasActivityOverrideMsg
{
  return self->_activityOverrideMsg != 0LL;
}

- (BOOL)hasBodyMetrics
{
  return self->_bodyMetrics != 0LL;
}

- (BOOL)hasMotionState
{
  return self->_motionState != 0LL;
}

- (BOOL)hasStepCountData
{
  return self->_stepCountData != 0LL;
}

- (BOOL)hasSessionCatherineData
{
  return self->_sessionCatherineData != 0LL;
}

- (BOOL)hasJacksonData
{
  return self->_jacksonData != 0LL;
}

- (BOOL)hasStrideCalData
{
  return self->_strideCalData != 0LL;
}

- (BOOL)hasSedentaryAlarmData
{
  return self->_sedentaryAlarmData != 0LL;
}

- (BOOL)hasAllDayHeartRate
{
  return self->_allDayHeartRate != 0LL;
}

- (BOOL)hasFitnessTracking
{
  return self->_fitnessTracking != 0LL;
}

- (BOOL)hasOdometer
{
  return self->_odometer != 0LL;
}

- (BOOL)hasIdsStatus
{
  return self->_idsStatus != 0LL;
}

- (BOOL)hasStairClimbingModel
{
  return self->_stairClimbingModel != 0LL;
}

- (BOOL)hasRowingModel
{
  return self->_rowingModel != 0LL;
}

- (BOOL)hasExerciseMinute
{
  return self->_exerciseMinute != 0LL;
}

- (BOOL)hasElevation
{
  return self->_elevation != 0LL;
}

- (BOOL)hasCoarseElevation
{
  return self->_coarseElevation != 0LL;
}

- (BOOL)hasCalorieData
{
  return self->_calorieData != 0LL;
}

- (BOOL)hasWorkoutEvent
{
  return self->_workoutEvent != 0LL;
}

- (BOOL)hasNatalieData
{
  return self->_natalieData != 0LL;
}

- (BOOL)hasSedentaryAlarmDataDeprecated
{
  return self->_sedentaryAlarmDataDeprecated != 0LL;
}

- (BOOL)hasStrideCalDataDeprecated
{
  return self->_strideCalDataDeprecated != 0LL;
}

- (BOOL)hasCalorieDataDeprecated
{
  return self->_calorieDataDeprecated != 0LL;
}

- (BOOL)hasCoarseElevationDeprecated
{
  return self->_coarseElevationDeprecated != 0LL;
}

- (BOOL)hasElevationDeprecated
{
  return self->_elevationDeprecated != 0LL;
}

- (BOOL)hasWorkoutEventDeprecated
{
  return self->_workoutEventDeprecated != 0LL;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALActivityLog;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[ALActivityLog description](&v3, "description"),  -[ALActivityLog dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timestamp),  @"timestamp");
  activityOverrideMsg = self->_activityOverrideMsg;
  if (activityOverrideMsg) {
    objc_msgSend( v3,  "setObject:forKey:",  -[ALActivityOverrideMsg dictionaryRepresentation](activityOverrideMsg, "dictionaryRepresentation"),  @"activityOverrideMsg");
  }
  bodyMetrics = self->_bodyMetrics;
  if (bodyMetrics) {
    objc_msgSend( v3,  "setObject:forKey:",  -[ALCLBodyMetrics dictionaryRepresentation](bodyMetrics, "dictionaryRepresentation"),  @"bodyMetrics");
  }
  motionState = self->_motionState;
  if (motionState) {
    objc_msgSend( v3,  "setObject:forKey:",  -[ALMotionState dictionaryRepresentation](motionState, "dictionaryRepresentation"),  @"motionState");
  }
  stepCountData = self->_stepCountData;
  if (stepCountData) {
    objc_msgSend( v3,  "setObject:forKey:",  -[ALCLStepCountEntry dictionaryRepresentation](stepCountData, "dictionaryRepresentation"),  @"stepCountData");
  }
  sessionCatherineData = self->_sessionCatherineData;
  if (sessionCatherineData) {
    objc_msgSend( v3,  "setObject:forKey:",  -[ALCLSessionCatherine dictionaryRepresentation](sessionCatherineData, "dictionaryRepresentation"),  @"sessionCatherineData");
  }
  jacksonData = self->_jacksonData;
  if (jacksonData) {
    objc_msgSend( v3,  "setObject:forKey:",  -[ALCLJacksonData dictionaryRepresentation](jacksonData, "dictionaryRepresentation"),  @"jacksonData");
  }
  strideCalData = self->_strideCalData;
  if (strideCalData) {
    objc_msgSend( v3,  "setObject:forKey:",  -[ALCLStrideCalEntry dictionaryRepresentation](strideCalData, "dictionaryRepresentation"),  @"strideCalData");
  }
  sedentaryAlarmData = self->_sedentaryAlarmData;
  if (sedentaryAlarmData) {
    objc_msgSend( v3,  "setObject:forKey:",  -[ALCLSedentaryAlarmData dictionaryRepresentation](sedentaryAlarmData, "dictionaryRepresentation"),  @"sedentaryAlarmData");
  }
  allDayHeartRate = self->_allDayHeartRate;
  if (allDayHeartRate) {
    objc_msgSend( v3,  "setObject:forKey:",  -[ALCLAllDayHeartRate dictionaryRepresentation](allDayHeartRate, "dictionaryRepresentation"),  @"allDayHeartRate");
  }
  fitnessTracking = self->_fitnessTracking;
  if (fitnessTracking) {
    objc_msgSend( v3,  "setObject:forKey:",  -[ALCMFitnessTracking dictionaryRepresentation](fitnessTracking, "dictionaryRepresentation"),  @"fitnessTracking");
  }
  odometer = self->_odometer;
  if (odometer) {
    objc_msgSend( v3,  "setObject:forKey:",  -[ALCLOdometer dictionaryRepresentation](odometer, "dictionaryRepresentation"),  @"odometer");
  }
  idsStatus = self->_idsStatus;
  if (idsStatus) {
    objc_msgSend( v3,  "setObject:forKey:",  -[ALCLIDSStatus dictionaryRepresentation](idsStatus, "dictionaryRepresentation"),  @"idsStatus");
  }
  stairClimbingModel = self->_stairClimbingModel;
  if (stairClimbingModel) {
    objc_msgSend( v3,  "setObject:forKey:",  -[ALCLStairClimbingModel dictionaryRepresentation](stairClimbingModel, "dictionaryRepresentation"),  @"stairClimbingModel");
  }
  rowingModel = self->_rowingModel;
  if (rowingModel) {
    objc_msgSend( v3,  "setObject:forKey:",  -[ALCLRowingModel dictionaryRepresentation](rowingModel, "dictionaryRepresentation"),  @"rowingModel");
  }
  exerciseMinute = self->_exerciseMinute;
  if (exerciseMinute) {
    objc_msgSend( v3,  "setObject:forKey:",  -[ALCMExerciseMinute dictionaryRepresentation](exerciseMinute, "dictionaryRepresentation"),  @"exerciseMinute");
  }
  elevation = self->_elevation;
  if (elevation) {
    objc_msgSend( v3,  "setObject:forKey:",  -[ALCMElevation dictionaryRepresentation](elevation, "dictionaryRepresentation"),  @"elevation");
  }
  coarseElevation = self->_coarseElevation;
  if (coarseElevation) {
    objc_msgSend( v3,  "setObject:forKey:",  -[ALCMCoarseElevation dictionaryRepresentation](coarseElevation, "dictionaryRepresentation"),  @"coarseElevation");
  }
  calorieData = self->_calorieData;
  if (calorieData) {
    objc_msgSend( v3,  "setObject:forKey:",  -[ALCMCalorieData dictionaryRepresentation](calorieData, "dictionaryRepresentation"),  @"calorieData");
  }
  workoutEvent = self->_workoutEvent;
  if (workoutEvent) {
    objc_msgSend( v3,  "setObject:forKey:",  -[ALCMWorkoutEvent dictionaryRepresentation](workoutEvent, "dictionaryRepresentation"),  @"workoutEvent");
  }
  natalieData = self->_natalieData;
  if (natalieData) {
    objc_msgSend( v3,  "setObject:forKey:",  -[ALCLNatalieDataDeprecated dictionaryRepresentation](natalieData, "dictionaryRepresentation"),  @"natalieData");
  }
  sedentaryAlarmDataDeprecated = self->_sedentaryAlarmDataDeprecated;
  if (sedentaryAlarmDataDeprecated) {
    objc_msgSend( v3,  "setObject:forKey:",  -[ALCLSedentaryAlarmDataDeprecated dictionaryRepresentation]( sedentaryAlarmDataDeprecated,  "dictionaryRepresentation"),  @"sedentaryAlarmDataDeprecated");
  }
  strideCalDataDeprecated = self->_strideCalDataDeprecated;
  if (strideCalDataDeprecated) {
    objc_msgSend( v3,  "setObject:forKey:",  -[ALCLStrideCalEntryDeprecated dictionaryRepresentation](strideCalDataDeprecated, "dictionaryRepresentation"),  @"strideCalDataDeprecated");
  }
  calorieDataDeprecated = self->_calorieDataDeprecated;
  if (calorieDataDeprecated) {
    objc_msgSend( v3,  "setObject:forKey:",  -[ALCMCalorieDataDeprecated dictionaryRepresentation](calorieDataDeprecated, "dictionaryRepresentation"),  @"calorieDataDeprecated");
  }
  coarseElevationDeprecated = self->_coarseElevationDeprecated;
  if (coarseElevationDeprecated) {
    objc_msgSend( v3,  "setObject:forKey:",  -[ALCMCoarseElevationDeprecated dictionaryRepresentation](coarseElevationDeprecated, "dictionaryRepresentation"),  @"coarseElevationDeprecated");
  }
  elevationDeprecated = self->_elevationDeprecated;
  if (elevationDeprecated) {
    objc_msgSend( v3,  "setObject:forKey:",  -[ALCLElevationDeprecated dictionaryRepresentation](elevationDeprecated, "dictionaryRepresentation"),  @"elevationDeprecated");
  }
  workoutEventDeprecated = self->_workoutEventDeprecated;
  if (workoutEventDeprecated) {
    objc_msgSend( v3,  "setObject:forKey:",  -[ALCMWorkoutEventDeprecated dictionaryRepresentation](workoutEventDeprecated, "dictionaryRepresentation"),  @"workoutEventDeprecated");
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100262B98((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  activityOverrideMsg = self->_activityOverrideMsg;
  if (activityOverrideMsg) {
    PBDataWriterWriteSubmessage(a3, activityOverrideMsg, 2LL);
  }
  bodyMetrics = self->_bodyMetrics;
  if (bodyMetrics) {
    PBDataWriterWriteSubmessage(a3, bodyMetrics, 3LL);
  }
  motionState = self->_motionState;
  if (motionState) {
    PBDataWriterWriteSubmessage(a3, motionState, 4LL);
  }
  natalieData = self->_natalieData;
  if (natalieData) {
    PBDataWriterWriteSubmessage(a3, natalieData, 5LL);
  }
  sedentaryAlarmDataDeprecated = self->_sedentaryAlarmDataDeprecated;
  if (sedentaryAlarmDataDeprecated) {
    PBDataWriterWriteSubmessage(a3, sedentaryAlarmDataDeprecated, 6LL);
  }
  stepCountData = self->_stepCountData;
  if (stepCountData) {
    PBDataWriterWriteSubmessage(a3, stepCountData, 7LL);
  }
  strideCalDataDeprecated = self->_strideCalDataDeprecated;
  if (strideCalDataDeprecated) {
    PBDataWriterWriteSubmessage(a3, strideCalDataDeprecated, 8LL);
  }
  sessionCatherineData = self->_sessionCatherineData;
  if (sessionCatherineData) {
    PBDataWriterWriteSubmessage(a3, sessionCatherineData, 9LL);
  }
  jacksonData = self->_jacksonData;
  if (jacksonData) {
    PBDataWriterWriteSubmessage(a3, jacksonData, 10LL);
  }
  strideCalData = self->_strideCalData;
  if (strideCalData) {
    PBDataWriterWriteSubmessage(a3, strideCalData, 11LL);
  }
  sedentaryAlarmData = self->_sedentaryAlarmData;
  if (sedentaryAlarmData) {
    PBDataWriterWriteSubmessage(a3, sedentaryAlarmData, 12LL);
  }
  allDayHeartRate = self->_allDayHeartRate;
  if (allDayHeartRate) {
    PBDataWriterWriteSubmessage(a3, allDayHeartRate, 13LL);
  }
  calorieDataDeprecated = self->_calorieDataDeprecated;
  if (calorieDataDeprecated) {
    PBDataWriterWriteSubmessage(a3, calorieDataDeprecated, 14LL);
  }
  coarseElevationDeprecated = self->_coarseElevationDeprecated;
  if (coarseElevationDeprecated) {
    PBDataWriterWriteSubmessage(a3, coarseElevationDeprecated, 15LL);
  }
  fitnessTracking = self->_fitnessTracking;
  if (fitnessTracking) {
    PBDataWriterWriteSubmessage(a3, fitnessTracking, 16LL);
  }
  odometer = self->_odometer;
  if (odometer) {
    PBDataWriterWriteSubmessage(a3, odometer, 17LL);
  }
  elevationDeprecated = self->_elevationDeprecated;
  if (elevationDeprecated) {
    PBDataWriterWriteSubmessage(a3, elevationDeprecated, 18LL);
  }
  idsStatus = self->_idsStatus;
  if (idsStatus) {
    PBDataWriterWriteSubmessage(a3, idsStatus, 19LL);
  }
  stairClimbingModel = self->_stairClimbingModel;
  if (stairClimbingModel) {
    PBDataWriterWriteSubmessage(a3, stairClimbingModel, 20LL);
  }
  rowingModel = self->_rowingModel;
  if (rowingModel) {
    PBDataWriterWriteSubmessage(a3, rowingModel, 21LL);
  }
  exerciseMinute = self->_exerciseMinute;
  if (exerciseMinute) {
    PBDataWriterWriteSubmessage(a3, exerciseMinute, 22LL);
  }
  workoutEventDeprecated = self->_workoutEventDeprecated;
  if (workoutEventDeprecated) {
    PBDataWriterWriteSubmessage(a3, workoutEventDeprecated, 23LL);
  }
  elevation = self->_elevation;
  if (elevation) {
    PBDataWriterWriteSubmessage(a3, elevation, 24LL);
  }
  coarseElevation = self->_coarseElevation;
  if (coarseElevation) {
    PBDataWriterWriteSubmessage(a3, coarseElevation, 25LL);
  }
  calorieData = self->_calorieData;
  if (calorieData) {
    PBDataWriterWriteSubmessage(a3, calorieData, 26LL);
  }
  workoutEvent = self->_workoutEvent;
  if (workoutEvent) {
    PBDataWriterWriteSubmessage(a3, workoutEvent, 27LL);
  }
}

- (void)copyTo:(id)a3
{
  *((void *)a3 + 1) = *(void *)&self->_timestamp;
  if (self->_activityOverrideMsg) {
    objc_msgSend(a3, "setActivityOverrideMsg:");
  }
  if (self->_bodyMetrics) {
    objc_msgSend(a3, "setBodyMetrics:");
  }
  if (self->_motionState) {
    objc_msgSend(a3, "setMotionState:");
  }
  if (self->_natalieData) {
    objc_msgSend(a3, "setNatalieData:");
  }
  if (self->_sedentaryAlarmDataDeprecated) {
    objc_msgSend(a3, "setSedentaryAlarmDataDeprecated:");
  }
  if (self->_stepCountData) {
    objc_msgSend(a3, "setStepCountData:");
  }
  if (self->_strideCalDataDeprecated) {
    objc_msgSend(a3, "setStrideCalDataDeprecated:");
  }
  if (self->_sessionCatherineData) {
    objc_msgSend(a3, "setSessionCatherineData:");
  }
  if (self->_jacksonData) {
    objc_msgSend(a3, "setJacksonData:");
  }
  if (self->_strideCalData) {
    objc_msgSend(a3, "setStrideCalData:");
  }
  if (self->_sedentaryAlarmData) {
    objc_msgSend(a3, "setSedentaryAlarmData:");
  }
  if (self->_allDayHeartRate) {
    objc_msgSend(a3, "setAllDayHeartRate:");
  }
  if (self->_calorieDataDeprecated) {
    objc_msgSend(a3, "setCalorieDataDeprecated:");
  }
  if (self->_coarseElevationDeprecated) {
    objc_msgSend(a3, "setCoarseElevationDeprecated:");
  }
  if (self->_fitnessTracking) {
    objc_msgSend(a3, "setFitnessTracking:");
  }
  if (self->_odometer) {
    objc_msgSend(a3, "setOdometer:");
  }
  if (self->_elevationDeprecated) {
    objc_msgSend(a3, "setElevationDeprecated:");
  }
  if (self->_idsStatus) {
    objc_msgSend(a3, "setIdsStatus:");
  }
  if (self->_stairClimbingModel) {
    objc_msgSend(a3, "setStairClimbingModel:");
  }
  if (self->_rowingModel) {
    objc_msgSend(a3, "setRowingModel:");
  }
  if (self->_exerciseMinute) {
    objc_msgSend(a3, "setExerciseMinute:");
  }
  if (self->_workoutEventDeprecated) {
    objc_msgSend(a3, "setWorkoutEventDeprecated:");
  }
  if (self->_elevation) {
    objc_msgSend(a3, "setElevation:");
  }
  if (self->_coarseElevation) {
    objc_msgSend(a3, "setCoarseElevation:");
  }
  if (self->_calorieData) {
    objc_msgSend(a3, "setCalorieData:");
  }
  if (self->_workoutEvent) {
    objc_msgSend(a3, "setWorkoutEvent:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  *((void *)v5 + 1) = *(void *)&self->_timestamp;

  *((void *)v5 + 2) = -[ALActivityOverrideMsg copyWithZone:](self->_activityOverrideMsg, "copyWithZone:", a3);
  *((void *)v5 + 4) = -[ALCLBodyMetrics copyWithZone:](self->_bodyMetrics, "copyWithZone:", a3);

  *((void *)v5 + 15) = -[ALMotionState copyWithZone:](self->_motionState, "copyWithZone:", a3);
  *((void *)v5 + 16) = -[ALCLNatalieDataDeprecated copyWithZone:](self->_natalieData, "copyWithZone:", a3);

  *((void *)v5 + 20) = -[ALCLSedentaryAlarmDataDeprecated copyWithZone:]( self->_sedentaryAlarmDataDeprecated,  "copyWithZone:",  a3);
  *((void *)v5 + 23) = -[ALCLStepCountEntry copyWithZone:](self->_stepCountData, "copyWithZone:", a3);

  *((void *)v5 + 25) = -[ALCLStrideCalEntryDeprecated copyWithZone:]( self->_strideCalDataDeprecated,  "copyWithZone:",  a3);
  *((void *)v5 + 21) = -[ALCLSessionCatherine copyWithZone:](self->_sessionCatherineData, "copyWithZone:", a3);

  *((void *)v5 + 14) = -[ALCLJacksonData copyWithZone:](self->_jacksonData, "copyWithZone:", a3);
  *((void *)v5 + 24) = -[ALCLStrideCalEntry copyWithZone:](self->_strideCalData, "copyWithZone:", a3);

  *((void *)v5 + 19) = -[ALCLSedentaryAlarmData copyWithZone:](self->_sedentaryAlarmData, "copyWithZone:", a3);
  *((void *)v5 + 3) = -[ALCLAllDayHeartRate copyWithZone:](self->_allDayHeartRate, "copyWithZone:", a3);

  *((void *)v5 + 6) = -[ALCMCalorieDataDeprecated copyWithZone:](self->_calorieDataDeprecated, "copyWithZone:", a3);
  *((void *)v5 + 8) = -[ALCMCoarseElevationDeprecated copyWithZone:]( self->_coarseElevationDeprecated,  "copyWithZone:",  a3);

  *((void *)v5 + 12) = -[ALCMFitnessTracking copyWithZone:](self->_fitnessTracking, "copyWithZone:", a3);
  *((void *)v5 + 17) = -[ALCLOdometer copyWithZone:](self->_odometer, "copyWithZone:", a3);

  *((void *)v5 + 10) = -[ALCLElevationDeprecated copyWithZone:](self->_elevationDeprecated, "copyWithZone:", a3);
  *((void *)v5 + 13) = -[ALCLIDSStatus copyWithZone:](self->_idsStatus, "copyWithZone:", a3);

  *((void *)v5 + 22) = -[ALCLStairClimbingModel copyWithZone:](self->_stairClimbingModel, "copyWithZone:", a3);
  *((void *)v5 + 18) = -[ALCLRowingModel copyWithZone:](self->_rowingModel, "copyWithZone:", a3);

  *((void *)v5 + 11) = -[ALCMExerciseMinute copyWithZone:](self->_exerciseMinute, "copyWithZone:", a3);
  *((void *)v5 + 27) = -[ALCMWorkoutEventDeprecated copyWithZone:](self->_workoutEventDeprecated, "copyWithZone:", a3);

  *((void *)v5 + 9) = -[ALCMElevation copyWithZone:](self->_elevation, "copyWithZone:", a3);
  *((void *)v5 + 7) = -[ALCMCoarseElevation copyWithZone:](self->_coarseElevation, "copyWithZone:", a3);

  *((void *)v5 + 5) = -[ALCMCalorieData copyWithZone:](self->_calorieData, "copyWithZone:", a3);
  *((void *)v5 + 26) = -[ALCMWorkoutEvent copyWithZone:](self->_workoutEvent, "copyWithZone:", a3);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class(self)];
  if (v5)
  {
    if (self->_timestamp == *((double *)a3 + 1))
    {
      activityOverrideMsg = self->_activityOverrideMsg;
      if (!((unint64_t)activityOverrideMsg | *((void *)a3 + 2))
        || (unsigned int v5 = -[ALActivityOverrideMsg isEqual:](activityOverrideMsg, "isEqual:")) != 0)
      {
        bodyMetrics = self->_bodyMetrics;
        if (!((unint64_t)bodyMetrics | *((void *)a3 + 4))
          || (unsigned int v5 = -[ALCLBodyMetrics isEqual:](bodyMetrics, "isEqual:")) != 0)
        {
          motionState = self->_motionState;
          if (!((unint64_t)motionState | *((void *)a3 + 15))
            || (unsigned int v5 = -[ALMotionState isEqual:](motionState, "isEqual:")) != 0)
          {
            natalieData = self->_natalieData;
            if (!((unint64_t)natalieData | *((void *)a3 + 16))
              || (unsigned int v5 = -[ALCLNatalieDataDeprecated isEqual:](natalieData, "isEqual:")) != 0)
            {
              sedentaryAlarmDataDeprecated = self->_sedentaryAlarmDataDeprecated;
              if (!((unint64_t)sedentaryAlarmDataDeprecated | *((void *)a3 + 20))
                || (unsigned int v5 = -[ALCLSedentaryAlarmDataDeprecated isEqual:](sedentaryAlarmDataDeprecated, "isEqual:")) != 0)
              {
                stepCountData = self->_stepCountData;
                if (!((unint64_t)stepCountData | *((void *)a3 + 23))
                  || (unsigned int v5 = -[ALCLStepCountEntry isEqual:](stepCountData, "isEqual:")) != 0)
                {
                  strideCalDataDeprecated = self->_strideCalDataDeprecated;
                  if (!((unint64_t)strideCalDataDeprecated | *((void *)a3 + 25))
                    || (unsigned int v5 = -[ALCLStrideCalEntryDeprecated isEqual:](strideCalDataDeprecated, "isEqual:")) != 0)
                  {
                    sessionCatherineData = self->_sessionCatherineData;
                    if (!((unint64_t)sessionCatherineData | *((void *)a3 + 21))
                      || (unsigned int v5 = -[ALCLSessionCatherine isEqual:](sessionCatherineData, "isEqual:")) != 0)
                    {
                      jacksonData = self->_jacksonData;
                      if (!((unint64_t)jacksonData | *((void *)a3 + 14))
                        || (unsigned int v5 = -[ALCLJacksonData isEqual:](jacksonData, "isEqual:")) != 0)
                      {
                        strideCalData = self->_strideCalData;
                        if (!((unint64_t)strideCalData | *((void *)a3 + 24))
                          || (unsigned int v5 = -[ALCLStrideCalEntry isEqual:](strideCalData, "isEqual:")) != 0)
                        {
                          sedentaryAlarmData = self->_sedentaryAlarmData;
                          if (!((unint64_t)sedentaryAlarmData | *((void *)a3 + 19))
                            || (unsigned int v5 = -[ALCLSedentaryAlarmData isEqual:](sedentaryAlarmData, "isEqual:")) != 0)
                          {
                            allDayHeartRate = self->_allDayHeartRate;
                            if (!((unint64_t)allDayHeartRate | *((void *)a3 + 3))
                              || (unsigned int v5 = -[ALCLAllDayHeartRate isEqual:](allDayHeartRate, "isEqual:")) != 0)
                            {
                              calorieDataDeprecated = self->_calorieDataDeprecated;
                              if (!((unint64_t)calorieDataDeprecated | *((void *)a3 + 6))
                                || (unsigned int v5 = -[ALCMCalorieDataDeprecated isEqual:](calorieDataDeprecated, "isEqual:")) != 0)
                              {
                                coarseElevationDeprecated = self->_coarseElevationDeprecated;
                                if (!((unint64_t)coarseElevationDeprecated | *((void *)a3 + 8))
                                  || (unsigned int v5 = -[ALCMCoarseElevationDeprecated isEqual:]( coarseElevationDeprecated,  "isEqual:")) != 0)
                                {
                                  fitnessTracking = self->_fitnessTracking;
                                  if (!((unint64_t)fitnessTracking | *((void *)a3 + 12))
                                    || (unsigned int v5 = -[ALCMFitnessTracking isEqual:](fitnessTracking, "isEqual:")) != 0)
                                  {
                                    odometer = self->_odometer;
                                    if (!((unint64_t)odometer | *((void *)a3 + 17))
                                      || (unsigned int v5 = -[ALCLOdometer isEqual:](odometer, "isEqual:")) != 0)
                                    {
                                      elevationDeprecated = self->_elevationDeprecated;
                                      if (!((unint64_t)elevationDeprecated | *((void *)a3 + 10))
                                        || (unsigned int v5 = -[ALCLElevationDeprecated isEqual:](elevationDeprecated, "isEqual:")) != 0)
                                      {
                                        idsStatus = self->_idsStatus;
                                        if (!((unint64_t)idsStatus | *((void *)a3 + 13))
                                          || (unsigned int v5 = -[ALCLIDSStatus isEqual:](idsStatus, "isEqual:")) != 0)
                                        {
                                          stairClimbingModel = self->_stairClimbingModel;
                                          if (!((unint64_t)stairClimbingModel | *((void *)a3 + 22))
                                            || (unsigned int v5 = -[ALCLStairClimbingModel isEqual:](stairClimbingModel, "isEqual:")) != 0)
                                          {
                                            rowingModel = self->_rowingModel;
                                            if (!((unint64_t)rowingModel | *((void *)a3 + 18))
                                              || (unsigned int v5 = -[ALCLRowingModel isEqual:](rowingModel, "isEqual:")) != 0)
                                            {
                                              exerciseMinute = self->_exerciseMinute;
                                              if (!((unint64_t)exerciseMinute | *((void *)a3 + 11))
                                                || (unsigned int v5 = -[ALCMExerciseMinute isEqual:](exerciseMinute, "isEqual:")) != 0)
                                              {
                                                workoutEventDeprecated = self->_workoutEventDeprecated;
                                                if (!((unint64_t)workoutEventDeprecated | *((void *)a3 + 27))
                                                  || (unsigned int v5 = -[ALCMWorkoutEventDeprecated isEqual:]( workoutEventDeprecated,  "isEqual:")) != 0)
                                                {
                                                  elevation = self->_elevation;
                                                  if (!((unint64_t)elevation | *((void *)a3 + 9))
                                                    || (unsigned int v5 = -[ALCMElevation isEqual:](elevation, "isEqual:")) != 0)
                                                  {
                                                    coarseElevation = self->_coarseElevation;
                                                    if (!((unint64_t)coarseElevation | *((void *)a3 + 7))
                                                      || (unsigned int v5 = -[ALCMCoarseElevation isEqual:]( coarseElevation,  "isEqual:")) != 0)
                                                    {
                                                      calorieData = self->_calorieData;
                                                      if (!((unint64_t)calorieData | *((void *)a3 + 5))
                                                        || (unsigned int v5 = -[ALCMCalorieData isEqual:](calorieData, "isEqual:")) != 0)
                                                      {
                                                        workoutEvent = self->_workoutEvent;
                                                        if ((unint64_t)workoutEvent | *((void *)a3 + 26)) {
                                                          LOBYTE(v5) = -[ALCMWorkoutEvent isEqual:]( workoutEvent,  "isEqual:");
                                                        }
                                                        else {
                                                          LOBYTE(v5) = 1;
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }

    else
    {
      LOBYTE(v5) = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  double timestamp = self->_timestamp;
  double v4 = -timestamp;
  if (timestamp >= 0.0) {
    double v4 = self->_timestamp;
  }
  double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  double v7 = fmod(v5, 1.84467441e19);
  unint64_t v8 = 2654435761u * (unint64_t)v7;
  unint64_t v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0) {
    unint64_t v9 = 2654435761u * (unint64_t)v7;
  }
  unint64_t v10 = v8 - (unint64_t)fabs(v6);
  if (v6 < 0.0) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v9;
  }
  unint64_t v12 = -[ALActivityOverrideMsg hash](self->_activityOverrideMsg, "hash");
  unint64_t v13 = v11 ^ -[ALCLBodyMetrics hash](self->_bodyMetrics, "hash");
  unint64_t v14 = v12 ^ -[ALMotionState hash](self->_motionState, "hash");
  unint64_t v15 = v14 ^ -[ALCLNatalieDataDeprecated hash](self->_natalieData, "hash");
  unint64_t v16 = v15 ^ -[ALCLSedentaryAlarmDataDeprecated hash](self->_sedentaryAlarmDataDeprecated, "hash");
  unint64_t v17 = v16 ^ -[ALCLStepCountEntry hash](self->_stepCountData, "hash");
  unint64_t v18 = v17 ^ -[ALCLStrideCalEntryDeprecated hash](self->_strideCalDataDeprecated, "hash");
  unint64_t v19 = v18 ^ -[ALCLSessionCatherine hash](self->_sessionCatherineData, "hash");
  unint64_t v20 = v19 ^ -[ALCLJacksonData hash](self->_jacksonData, "hash");
  unint64_t v21 = v20 ^ -[ALCLStrideCalEntry hash](self->_strideCalData, "hash");
  unint64_t v22 = v21 ^ -[ALCLSedentaryAlarmData hash](self->_sedentaryAlarmData, "hash");
  unint64_t v23 = v22 ^ -[ALCLAllDayHeartRate hash](self->_allDayHeartRate, "hash");
  unint64_t v24 = v23 ^ -[ALCMCalorieDataDeprecated hash](self->_calorieDataDeprecated, "hash");
  unint64_t v25 = v24 ^ -[ALCMCoarseElevationDeprecated hash](self->_coarseElevationDeprecated, "hash");
  unint64_t v26 = v25 ^ -[ALCMFitnessTracking hash](self->_fitnessTracking, "hash");
  unint64_t v27 = v26 ^ -[ALCLOdometer hash](self->_odometer, "hash");
  unint64_t v28 = v27 ^ -[ALCLElevationDeprecated hash](self->_elevationDeprecated, "hash");
  unint64_t v29 = v28 ^ -[ALCLIDSStatus hash](self->_idsStatus, "hash");
  unint64_t v30 = v29 ^ -[ALCLStairClimbingModel hash](self->_stairClimbingModel, "hash");
  unint64_t v31 = v30 ^ -[ALCLRowingModel hash](self->_rowingModel, "hash");
  unint64_t v32 = v31 ^ -[ALCMExerciseMinute hash](self->_exerciseMinute, "hash");
  unint64_t v33 = v32 ^ -[ALCMWorkoutEventDeprecated hash](self->_workoutEventDeprecated, "hash");
  unint64_t v34 = v33 ^ -[ALCMElevation hash](self->_elevation, "hash");
  unint64_t v35 = v34 ^ -[ALCMCoarseElevation hash](self->_coarseElevation, "hash");
  unint64_t v36 = v35 ^ -[ALCMCalorieData hash](self->_calorieData, "hash");
  return v36 ^ -[ALCMWorkoutEvent hash](self->_workoutEvent, "hash") ^ v13;
}

- (void)mergeFrom:(id)a3
{
  self->_double timestamp = *((double *)a3 + 1);
  activityOverrideMsg = self->_activityOverrideMsg;
  uint64_t v6 = *((void *)a3 + 2);
  if (activityOverrideMsg)
  {
    if (v6) {
      -[ALActivityOverrideMsg mergeFrom:](activityOverrideMsg, "mergeFrom:");
    }
  }

  else if (v6)
  {
    -[ALActivityLog setActivityOverrideMsg:](self, "setActivityOverrideMsg:");
  }

  bodyMetrics = self->_bodyMetrics;
  uint64_t v8 = *((void *)a3 + 4);
  if (bodyMetrics)
  {
    if (v8) {
      -[ALCLBodyMetrics mergeFrom:](bodyMetrics, "mergeFrom:");
    }
  }

  else if (v8)
  {
    -[ALActivityLog setBodyMetrics:](self, "setBodyMetrics:");
  }

  motionState = self->_motionState;
  uint64_t v10 = *((void *)a3 + 15);
  if (motionState)
  {
    if (v10) {
      -[ALMotionState mergeFrom:](motionState, "mergeFrom:");
    }
  }

  else if (v10)
  {
    -[ALActivityLog setMotionState:](self, "setMotionState:");
  }

  natalieData = self->_natalieData;
  uint64_t v12 = *((void *)a3 + 16);
  if (natalieData)
  {
    if (v12) {
      -[ALCLNatalieDataDeprecated mergeFrom:](natalieData, "mergeFrom:");
    }
  }

  else if (v12)
  {
    -[ALActivityLog setNatalieData:](self, "setNatalieData:");
  }

  sedentaryAlarmDataDeprecated = self->_sedentaryAlarmDataDeprecated;
  uint64_t v14 = *((void *)a3 + 20);
  if (sedentaryAlarmDataDeprecated)
  {
    if (v14) {
      -[ALCLSedentaryAlarmDataDeprecated mergeFrom:](sedentaryAlarmDataDeprecated, "mergeFrom:");
    }
  }

  else if (v14)
  {
    -[ALActivityLog setSedentaryAlarmDataDeprecated:](self, "setSedentaryAlarmDataDeprecated:");
  }

  stepCountData = self->_stepCountData;
  uint64_t v16 = *((void *)a3 + 23);
  if (stepCountData)
  {
    if (v16) {
      -[ALCLStepCountEntry mergeFrom:](stepCountData, "mergeFrom:");
    }
  }

  else if (v16)
  {
    -[ALActivityLog setStepCountData:](self, "setStepCountData:");
  }

  strideCalDataDeprecated = self->_strideCalDataDeprecated;
  uint64_t v18 = *((void *)a3 + 25);
  if (strideCalDataDeprecated)
  {
    if (v18) {
      -[ALCLStrideCalEntryDeprecated mergeFrom:](strideCalDataDeprecated, "mergeFrom:");
    }
  }

  else if (v18)
  {
    -[ALActivityLog setStrideCalDataDeprecated:](self, "setStrideCalDataDeprecated:");
  }

  sessionCatherineData = self->_sessionCatherineData;
  uint64_t v20 = *((void *)a3 + 21);
  if (sessionCatherineData)
  {
    if (v20) {
      -[ALCLSessionCatherine mergeFrom:](sessionCatherineData, "mergeFrom:");
    }
  }

  else if (v20)
  {
    -[ALActivityLog setSessionCatherineData:](self, "setSessionCatherineData:");
  }

  jacksonData = self->_jacksonData;
  uint64_t v22 = *((void *)a3 + 14);
  if (jacksonData)
  {
    if (v22) {
      -[ALCLJacksonData mergeFrom:](jacksonData, "mergeFrom:");
    }
  }

  else if (v22)
  {
    -[ALActivityLog setJacksonData:](self, "setJacksonData:");
  }

  strideCalData = self->_strideCalData;
  uint64_t v24 = *((void *)a3 + 24);
  if (strideCalData)
  {
    if (v24) {
      -[ALCLStrideCalEntry mergeFrom:](strideCalData, "mergeFrom:");
    }
  }

  else if (v24)
  {
    -[ALActivityLog setStrideCalData:](self, "setStrideCalData:");
  }

  sedentaryAlarmData = self->_sedentaryAlarmData;
  uint64_t v26 = *((void *)a3 + 19);
  if (sedentaryAlarmData)
  {
    if (v26) {
      -[ALCLSedentaryAlarmData mergeFrom:](sedentaryAlarmData, "mergeFrom:");
    }
  }

  else if (v26)
  {
    -[ALActivityLog setSedentaryAlarmData:](self, "setSedentaryAlarmData:");
  }

  allDayHeartRate = self->_allDayHeartRate;
  uint64_t v28 = *((void *)a3 + 3);
  if (allDayHeartRate)
  {
    if (v28) {
      -[ALCLAllDayHeartRate mergeFrom:](allDayHeartRate, "mergeFrom:");
    }
  }

  else if (v28)
  {
    -[ALActivityLog setAllDayHeartRate:](self, "setAllDayHeartRate:");
  }

  calorieDataDeprecated = self->_calorieDataDeprecated;
  uint64_t v30 = *((void *)a3 + 6);
  if (calorieDataDeprecated)
  {
    if (v30) {
      -[ALCMCalorieDataDeprecated mergeFrom:](calorieDataDeprecated, "mergeFrom:");
    }
  }

  else if (v30)
  {
    -[ALActivityLog setCalorieDataDeprecated:](self, "setCalorieDataDeprecated:");
  }

  coarseElevationDeprecated = self->_coarseElevationDeprecated;
  uint64_t v32 = *((void *)a3 + 8);
  if (coarseElevationDeprecated)
  {
    if (v32) {
      -[ALCMCoarseElevationDeprecated mergeFrom:](coarseElevationDeprecated, "mergeFrom:");
    }
  }

  else if (v32)
  {
    -[ALActivityLog setCoarseElevationDeprecated:](self, "setCoarseElevationDeprecated:");
  }

  fitnessTracking = self->_fitnessTracking;
  uint64_t v34 = *((void *)a3 + 12);
  if (fitnessTracking)
  {
    if (v34) {
      -[ALCMFitnessTracking mergeFrom:](fitnessTracking, "mergeFrom:");
    }
  }

  else if (v34)
  {
    -[ALActivityLog setFitnessTracking:](self, "setFitnessTracking:");
  }

  odometer = self->_odometer;
  uint64_t v36 = *((void *)a3 + 17);
  if (odometer)
  {
    if (v36) {
      -[ALCLOdometer mergeFrom:](odometer, "mergeFrom:");
    }
  }

  else if (v36)
  {
    -[ALActivityLog setOdometer:](self, "setOdometer:");
  }

  elevationDeprecated = self->_elevationDeprecated;
  uint64_t v38 = *((void *)a3 + 10);
  if (elevationDeprecated)
  {
    if (v38) {
      -[ALCLElevationDeprecated mergeFrom:](elevationDeprecated, "mergeFrom:");
    }
  }

  else if (v38)
  {
    -[ALActivityLog setElevationDeprecated:](self, "setElevationDeprecated:");
  }

  idsStatus = self->_idsStatus;
  uint64_t v40 = *((void *)a3 + 13);
  if (idsStatus)
  {
    if (v40) {
      -[ALCLIDSStatus mergeFrom:](idsStatus, "mergeFrom:");
    }
  }

  else if (v40)
  {
    -[ALActivityLog setIdsStatus:](self, "setIdsStatus:");
  }

  stairClimbingModel = self->_stairClimbingModel;
  uint64_t v42 = *((void *)a3 + 22);
  if (stairClimbingModel)
  {
    if (v42) {
      -[ALCLStairClimbingModel mergeFrom:](stairClimbingModel, "mergeFrom:");
    }
  }

  else if (v42)
  {
    -[ALActivityLog setStairClimbingModel:](self, "setStairClimbingModel:");
  }

  rowingModel = self->_rowingModel;
  uint64_t v44 = *((void *)a3 + 18);
  if (rowingModel)
  {
    if (v44) {
      -[ALCLRowingModel mergeFrom:](rowingModel, "mergeFrom:");
    }
  }

  else if (v44)
  {
    -[ALActivityLog setRowingModel:](self, "setRowingModel:");
  }

  exerciseMinute = self->_exerciseMinute;
  uint64_t v46 = *((void *)a3 + 11);
  if (exerciseMinute)
  {
    if (v46) {
      -[ALCMExerciseMinute mergeFrom:](exerciseMinute, "mergeFrom:");
    }
  }

  else if (v46)
  {
    -[ALActivityLog setExerciseMinute:](self, "setExerciseMinute:");
  }

  workoutEventDeprecated = self->_workoutEventDeprecated;
  uint64_t v48 = *((void *)a3 + 27);
  if (workoutEventDeprecated)
  {
    if (v48) {
      -[ALCMWorkoutEventDeprecated mergeFrom:](workoutEventDeprecated, "mergeFrom:");
    }
  }

  else if (v48)
  {
    -[ALActivityLog setWorkoutEventDeprecated:](self, "setWorkoutEventDeprecated:");
  }

  elevation = self->_elevation;
  uint64_t v50 = *((void *)a3 + 9);
  if (elevation)
  {
    if (v50) {
      -[ALCMElevation mergeFrom:](elevation, "mergeFrom:");
    }
  }

  else if (v50)
  {
    -[ALActivityLog setElevation:](self, "setElevation:");
  }

  coarseElevation = self->_coarseElevation;
  uint64_t v52 = *((void *)a3 + 7);
  if (coarseElevation)
  {
    if (v52) {
      -[ALCMCoarseElevation mergeFrom:](coarseElevation, "mergeFrom:");
    }
  }

  else if (v52)
  {
    -[ALActivityLog setCoarseElevation:](self, "setCoarseElevation:");
  }

  calorieData = self->_calorieData;
  uint64_t v54 = *((void *)a3 + 5);
  if (calorieData)
  {
    if (v54) {
      -[ALCMCalorieData mergeFrom:](calorieData, "mergeFrom:");
    }
  }

  else if (v54)
  {
    -[ALActivityLog setCalorieData:](self, "setCalorieData:");
  }

  workoutEvent = self->_workoutEvent;
  uint64_t v56 = *((void *)a3 + 26);
  if (workoutEvent)
  {
    if (v56) {
      -[ALCMWorkoutEvent mergeFrom:](workoutEvent, "mergeFrom:");
    }
  }

  else if (v56)
  {
    -[ALActivityLog setWorkoutEvent:](self, "setWorkoutEvent:");
  }

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_double timestamp = a3;
}

- (ALActivityOverrideMsg)activityOverrideMsg
{
  return self->_activityOverrideMsg;
}

- (void)setActivityOverrideMsg:(id)a3
{
}

- (ALCLBodyMetrics)bodyMetrics
{
  return self->_bodyMetrics;
}

- (void)setBodyMetrics:(id)a3
{
}

- (ALMotionState)motionState
{
  return self->_motionState;
}

- (void)setMotionState:(id)a3
{
}

- (ALCLStepCountEntry)stepCountData
{
  return self->_stepCountData;
}

- (void)setStepCountData:(id)a3
{
}

- (ALCLSessionCatherine)sessionCatherineData
{
  return self->_sessionCatherineData;
}

- (void)setSessionCatherineData:(id)a3
{
}

- (ALCLJacksonData)jacksonData
{
  return self->_jacksonData;
}

- (void)setJacksonData:(id)a3
{
}

- (ALCLStrideCalEntry)strideCalData
{
  return self->_strideCalData;
}

- (void)setStrideCalData:(id)a3
{
}

- (ALCLSedentaryAlarmData)sedentaryAlarmData
{
  return self->_sedentaryAlarmData;
}

- (void)setSedentaryAlarmData:(id)a3
{
}

- (ALCLAllDayHeartRate)allDayHeartRate
{
  return self->_allDayHeartRate;
}

- (void)setAllDayHeartRate:(id)a3
{
}

- (ALCMFitnessTracking)fitnessTracking
{
  return self->_fitnessTracking;
}

- (void)setFitnessTracking:(id)a3
{
}

- (ALCLOdometer)odometer
{
  return self->_odometer;
}

- (void)setOdometer:(id)a3
{
}

- (ALCLIDSStatus)idsStatus
{
  return self->_idsStatus;
}

- (void)setIdsStatus:(id)a3
{
}

- (ALCLStairClimbingModel)stairClimbingModel
{
  return self->_stairClimbingModel;
}

- (void)setStairClimbingModel:(id)a3
{
}

- (ALCLRowingModel)rowingModel
{
  return self->_rowingModel;
}

- (void)setRowingModel:(id)a3
{
}

- (ALCMExerciseMinute)exerciseMinute
{
  return self->_exerciseMinute;
}

- (void)setExerciseMinute:(id)a3
{
}

- (ALCMElevation)elevation
{
  return self->_elevation;
}

- (void)setElevation:(id)a3
{
}

- (ALCMCoarseElevation)coarseElevation
{
  return self->_coarseElevation;
}

- (void)setCoarseElevation:(id)a3
{
}

- (ALCMCalorieData)calorieData
{
  return self->_calorieData;
}

- (void)setCalorieData:(id)a3
{
}

- (ALCMWorkoutEvent)workoutEvent
{
  return self->_workoutEvent;
}

- (void)setWorkoutEvent:(id)a3
{
}

- (ALCLNatalieDataDeprecated)natalieData
{
  return self->_natalieData;
}

- (void)setNatalieData:(id)a3
{
}

- (ALCLSedentaryAlarmDataDeprecated)sedentaryAlarmDataDeprecated
{
  return self->_sedentaryAlarmDataDeprecated;
}

- (void)setSedentaryAlarmDataDeprecated:(id)a3
{
}

- (ALCLStrideCalEntryDeprecated)strideCalDataDeprecated
{
  return self->_strideCalDataDeprecated;
}

- (void)setStrideCalDataDeprecated:(id)a3
{
}

- (ALCMCalorieDataDeprecated)calorieDataDeprecated
{
  return self->_calorieDataDeprecated;
}

- (void)setCalorieDataDeprecated:(id)a3
{
}

- (ALCMCoarseElevationDeprecated)coarseElevationDeprecated
{
  return self->_coarseElevationDeprecated;
}

- (void)setCoarseElevationDeprecated:(id)a3
{
}

- (ALCLElevationDeprecated)elevationDeprecated
{
  return self->_elevationDeprecated;
}

- (void)setElevationDeprecated:(id)a3
{
}

- (ALCMWorkoutEventDeprecated)workoutEventDeprecated
{
  return self->_workoutEventDeprecated;
}

- (void)setWorkoutEventDeprecated:(id)a3
{
}

@end
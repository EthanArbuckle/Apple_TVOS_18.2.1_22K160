@interface CLSensorMonitorSimulatedDataGenerator
+ (ActivityEvent)generateSimulatedPhysicalActivityEventsData:(SEL)a3;
+ (CLCatherineData)generateHighFrequencyHeartRateData:(SEL)a3;
+ (CLElevationChangeEntry)generateSimulatedElevationData:(SEL)a3;
+ (CLOdometerEntry)generateSimulatedOdometerData:(SEL)a3;
+ (CLOdometerSuitability)generateSimulatedOdometerSuitabilityData:(id)a3;
+ (CLStepCountEntry)generateSimulatedPedometerData:(SEL)a3;
@end

@implementation CLSensorMonitorSimulatedDataGenerator

+ (CLStepCountEntry)generateSimulatedPedometerData:(SEL)a3
{
  id v6 = [a4 objectForKeyedSubscript:@"startTime"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
    objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"startTime"), "doubleValue");
  }
  else {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  }
  retstr->startTime = Current;
  id v9 = [a4 objectForKeyedSubscript:@"count"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0) {
    unsigned int v11 = objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"count"), "unsignedIntValue");
  }
  else {
    unsigned int v11 = sub_1008E7F20(2, 100);
  }
  retstr->count = v11;
  id v12 = [a4 objectForKeyedSubscript:@"distance"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0) {
    objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"distance"), "doubleValue");
  }
  else {
    double v14 = sub_1008E7FC8(0.1, 10.0);
  }
  retstr->distance = v14;
  id v15 = [a4 objectForKeyedSubscript:@"floorsAscended"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0) {
    unsigned int v17 = objc_msgSend( objc_msgSend(a4, "objectForKeyedSubscript:", @"floorsAscended"),  "unsignedIntValue");
  }
  else {
    unsigned int v17 = sub_1008E7F20(2, 100);
  }
  retstr->floorsAscended = v17;
  id v18 = [a4 objectForKeyedSubscript:@"floorsDescended"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0) {
    unsigned int v20 = objc_msgSend( objc_msgSend(a4, "objectForKeyedSubscript:", @"floorsDescended"),  "unsignedIntValue");
  }
  else {
    unsigned int v20 = sub_1008E7F20(2, 100);
  }
  retstr->floorsDescended = v20;
  id v21 = [a4 objectForKeyedSubscript:@"recordId"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0) {
    int v23 = objc_msgSend( objc_msgSend(a4, "objectForKeyedSubscript:", @"recordId"),  "unsignedIntValue");
  }
  else {
    int v23 = sub_1008E7F20(1, 100);
  }
  retstr->recordId = v23;
  id v24 = [a4 objectForKeyedSubscript:@"currentPace"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0) {
    objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"currentPace"), "doubleValue");
  }
  else {
    double v26 = sub_1008E7FC8(1.0, 2.0);
  }
  retstr->currentPace = v26;
  id v27 = [a4 objectForKeyedSubscript:@"currentCadence"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v27, v28) & 1) != 0) {
    objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"currentCadence"), "doubleValue");
  }
  else {
    double v29 = sub_1008E7FC8(1.0, 2.0);
  }
  retstr->currentCadence = v29;
  id v30 = [a4 objectForKeyedSubscript:@"firstStepTime"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v30, v31) & 1) != 0) {
    objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"firstStepTime"), "doubleValue");
  }
  else {
    CFAbsoluteTime v32 = CFAbsoluteTimeGetCurrent() + -5.0;
  }
  retstr->firstStepTime = v32;
  id v33 = [a4 objectForKeyedSubscript:@"activeTime"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v33, v34) & 1) != 0) {
    objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"activeTime"), "doubleValue");
  }
  else {
    double v35 = sub_1008E7FC8(1.0, 2.0);
  }
  retstr->activeTime = v35;
  id v36 = [a4 objectForKeyedSubscript:@"isOdometerDistance"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v36, v37) & 1) != 0) {
    unsigned __int8 v38 = objc_msgSend( objc_msgSend(a4, "objectForKeyedSubscript:", @"isOdometerDistance"),  "BOOLValue");
  }
  else {
    unsigned __int8 v38 = sub_1008E7F20(0, 1) != 0;
  }
  retstr->isOdometerDistance = v38;
  id v39 = [a4 objectForKeyedSubscript:@"isOdometerPace"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v39, v40) & 1) != 0) {
    unsigned __int8 v41 = objc_msgSend( objc_msgSend(a4, "objectForKeyedSubscript:", @"isOdometerPace"),  "BOOLValue");
  }
  else {
    unsigned __int8 v41 = sub_1008E7F20(0, 1) != 0;
  }
  retstr->isOdometerPace = v41;
  id v42 = [a4 objectForKeyedSubscript:@"pushCount"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v42, v43) & 1) != 0) {
    unsigned int v44 = objc_msgSend( objc_msgSend(a4, "objectForKeyedSubscript:", @"pushCount"),  "unsignedIntValue");
  }
  else {
    unsigned int v44 = sub_1008E7F20(2, 100);
  }
  retstr->pushCount = v44;
  id v45 = [a4 objectForKeyedSubscript:@"workoutType"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v45, v46) & 1) != 0) {
    unsigned int v47 = objc_msgSend( objc_msgSend(a4, "objectForKeyedSubscript:", @"workoutType"),  "unsignedIntValue");
  }
  else {
    unsigned int v47 = sub_1008E7F20(2, 3);
  }
  retstr->workoutType = v47;
  id v48 = [a4 objectForKeyedSubscript:@"elevationAscended"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v48, v49) & 1) != 0) {
    unsigned int v50 = objc_msgSend( objc_msgSend(a4, "objectForKeyedSubscript:", @"elevationAscended"),  "unsignedIntValue");
  }
  else {
    unsigned int v50 = sub_1008E7F20(2, 100);
  }
  retstr->elevationAscended = v50;
  id v51 = [a4 objectForKeyedSubscript:@"elevationDescended"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v51, v52) & 1) != 0) {
    unsigned int v53 = objc_msgSend( objc_msgSend(a4, "objectForKeyedSubscript:", @"elevationDescended"),  "unsignedIntValue");
  }
  else {
    unsigned int v53 = sub_1008E7F20(2, 100);
  }
  retstr->elevationDescended = v53;
  id v54 = [a4 objectForKeyedSubscript:@"distanceSource"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v54, v55) & 1) != 0) {
    unsigned __int8 v56 = objc_msgSend( objc_msgSend(a4, "objectForKeyedSubscript:", @"distanceSource"),  "unsignedIntValue");
  }
  else {
    unsigned __int8 v56 = sub_1008E7F20(1, 5);
  }
  *(&retstr->falseStepDetectorState.data + 2) = v56;
  v57 = objc_alloc_init(&OBJC_CLASS___NSUUID);
  id v58 = [a4 objectForKeyedSubscript:@"sourceId"];
  objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v58, v59) & 1) != 0) {
    result = (CLStepCountEntry *)[a4 objectForKeyedSubscript:@"sourceId"];
  }
  else {
    result = -[NSUUID UUIDString](v57, "UUIDString");
  }
  retstr->sourceId = (__CFString *)result;
  return result;
}

+ (CLOdometerSuitability)generateSimulatedOdometerSuitabilityData:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"startTime"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
    objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"startTime"), "doubleValue");
  }
  else {
    double Current = CFAbsoluteTimeGetCurrent();
  }
  double v7 = Current;
  id v8 = [a3 objectForKeyedSubscript:@"suitableForRunning"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0) {
    unsigned int v10 = objc_msgSend( objc_msgSend(a3, "objectForKeyedSubscript:", @"suitableForRunning"),  "BOOLValue");
  }
  else {
    unsigned int v10 = sub_1008E7F20(0, 1) != 0;
  }
  id v11 = [a3 objectForKeyedSubscript:@"suitableForWalking"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0) {
    unsigned int v13 = objc_msgSend( objc_msgSend(a3, "objectForKeyedSubscript:", @"suitableForWalking"),  "BOOLValue");
  }
  else {
    unsigned int v13 = sub_1008E7F20(0, 1) != 0;
  }
  uint64_t v14 = 256LL;
  if (!v13) {
    uint64_t v14 = 0LL;
  }
  uint64_t v15 = v14 | v10;
  double v16 = v7;
  result.var1 = v15;
  result.var2 = BYTE1(v15);
  result.var0 = v16;
  return result;
}

+ (CLOdometerEntry)generateSimulatedOdometerData:(SEL)a3
{
  id v6 = [a4 objectForKeyedSubscript:@"startTime"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
    objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"startTime"), "doubleValue");
  }
  else {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  }
  retstr->startTime = Current;
  id v9 = [a4 objectForKeyedSubscript:@"distance"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0) {
    objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"distance"), "doubleValue");
  }
  else {
    double v11 = sub_1008E7FC8(0.1, 1000.0);
  }
  retstr->distance = v11;
  id v12 = [a4 objectForKeyedSubscript:@"speed"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0) {
    objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"speed"), "doubleValue");
  }
  else {
    double v14 = sub_1008E7FC8(0.1, 10.0);
  }
  retstr->speed = v14;
  id v15 = [a4 objectForKeyedSubscript:@"rawSpeed"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0) {
    objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"rawSpeed"), "doubleValue");
  }
  else {
    double v17 = sub_1008E7FC8(0.1, 10.0);
  }
  retstr->rawSpeed = v17;
  id v18 = [a4 objectForKeyedSubscript:@"gpsSpeedAccuracy"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0) {
    objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"gpsSpeedAccuracy"), "doubleValue");
  }
  else {
    double v20 = sub_1008E7FC8(0.1, 10.0);
  }
  retstr->gpsSpeedAccuracy = v20;
  id v21 = [a4 objectForKeyedSubscript:@"accuracy"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0) {
    objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"accuracy"), "doubleValue");
  }
  else {
    double v23 = sub_1008E7FC8(0.1, 10.0);
  }
  retstr->accuracy = v23;
  id v24 = [a4 objectForKeyedSubscript:@"originDevice"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0) {
    int v26 = objc_msgSend( objc_msgSend(a4, "objectForKeyedSubscript:", @"originDevice"),  "unsignedIntValue");
  }
  else {
    int v26 = sub_1008E7F20(1, 2);
  }
  retstr->originDevice = v26;
  id v27 = [a4 objectForKeyedSubscript:@"groundAltitude"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v27, v28) & 1) != 0) {
    objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"groundAltitude"), "doubleValue");
  }
  else {
    double v29 = sub_1008E7FC8(10.0, 2000.0);
  }
  retstr->groundAltitude = v29;
  id v30 = [a4 objectForKeyedSubscript:@"groundAltitudeUncertainty"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v30, v31) & 1) != 0) {
    objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"groundAltitudeUncertainty"), "doubleValue");
  }
  else {
    double v32 = sub_1008E7FC8(0.1, 10.0);
  }
  retstr->groundAltitudeUncertainty = v32;
  id v33 = [a4 objectForKeyedSubscript:@"timestampGps"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v33, v34) & 1) != 0) {
    objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"timestampGps"), "doubleValue");
  }
  else {
    CFAbsoluteTime v35 = CFAbsoluteTimeGetCurrent();
  }
  retstr->timestampGps = v35;
  id v36 = [a4 objectForKeyedSubscript:@"slope"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v36, v37) & 1) != 0) {
    objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"slope"), "doubleValue");
  }
  else {
    double v38 = sub_1008E7FC8(0.1, 2.0);
  }
  retstr->slope = v38;
  id v39 = [a4 objectForKeyedSubscript:@"maxAbsSlope"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v39, v40) & 1) != 0) {
    CLOdometerSuitability result = (CLOdometerEntry *)objc_msgSend( objc_msgSend(a4, "objectForKeyedSubscript:", @"maxAbsSlope"),  "doubleValue");
  }
  else {
    double v42 = sub_1008E7FC8(0.1, 2.0);
  }
  retstr->maxAbsSlope = v42;
  return result;
}

+ (CLElevationChangeEntry)generateSimulatedElevationData:(SEL)a3
{
  id v6 = [a4 objectForKeyedSubscript:@"startTime"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
    objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"startTime"), "doubleValue");
  }
  else {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  }
  retstr->var1 = Current;
  id v9 = [a4 objectForKeyedSubscript:@"elevationAscended"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0) {
    unsigned int v11 = objc_msgSend( objc_msgSend(a4, "objectForKeyedSubscript:", @"elevationAscended"),  "unsignedIntValue");
  }
  else {
    unsigned int v11 = sub_1008E7F20(2, 1000);
  }
  retstr->var2 = v11;
  id v12 = [a4 objectForKeyedSubscript:@"elevationDescended"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0) {
    unsigned int v14 = objc_msgSend( objc_msgSend(a4, "objectForKeyedSubscript:", @"elevationDescended"),  "unsignedIntValue");
  }
  else {
    unsigned int v14 = sub_1008E7F20(2, 1000);
  }
  retstr->var3 = v14;
  id v15 = [a4 objectForKeyedSubscript:@"source"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0) {
    CLOdometerSuitability result = (CLElevationChangeEntry *)objc_msgSend( objc_msgSend(a4, "objectForKeyedSubscript:", @"source"),  "unsignedIntValue");
  }
  else {
    CLOdometerSuitability result = (CLElevationChangeEntry *)sub_1008E7F20(0, 5);
  }
  retstr->var6 = (int)result;
  return result;
}

+ (ActivityEvent)generateSimulatedPhysicalActivityEventsData:(SEL)a3
{
  id v6 = [a4 objectForKeyedSubscript:@"startTime"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
    objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"startTime"), "doubleValue");
  }
  else {
    CFAbsoluteTime v8 = CFAbsoluteTimeGetCurrent() + -5.0;
  }
  retstr->var0 = v8;
  id v9 = [a4 objectForKeyedSubscript:@"eventType"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0) {
    int64_t v11 = objc_msgSend( objc_msgSend(a4, "objectForKeyedSubscript:", @"eventType"),  "unsignedIntValue");
  }
  else {
    int64_t v11 = (int)sub_1008E7F20(0, 1);
  }
  retstr->var1 = v11;
  id v12 = [a4 objectForKeyedSubscript:@"action"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0) {
    int64_t v14 = objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"action"), "unsignedIntValue");
  }
  else {
    int64_t v14 = (int)sub_1008E7F20(0, 1);
  }
  retstr->var2 = v14;
  id v15 = [a4 objectForKeyedSubscript:@"reason"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0) {
    int64_t v17 = objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"reason"), "unsignedIntValue");
  }
  else {
    int64_t v17 = (int)sub_1008E7F20(1, 23);
  }
  retstr->var3 = v17;
  id v18 = [a4 objectForKeyedSubscript:@"workoutType"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0) {
    int64_t v20 = objc_msgSend( objc_msgSend(a4, "objectForKeyedSubscript:", @"workoutType"),  "unsignedIntValue");
  }
  else {
    int64_t v20 = (int)sub_1008E7F20(0, 10);
  }
  retstr->var4 = v20;
  id v21 = [a4 objectForKeyedSubscript:@"recoveryStartTime"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0) {
    objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"recoveryStartTime"), "doubleValue");
  }
  else {
    CFAbsoluteTime v23 = CFAbsoluteTimeGetCurrent() + -2.0;
  }
  retstr->var5 = v23;
  id v24 = [a4 objectForKeyedSubscript:@"recoveryEndTime"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0) {
    CLOdometerSuitability result = (ActivityEvent *)objc_msgSend( objc_msgSend(a4, "objectForKeyedSubscript:", @"recoveryEndTime"),  "doubleValue");
  }
  else {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  }
  retstr->var6 = Current;
  return result;
}

+ (CLCatherineData)generateHighFrequencyHeartRateData:(SEL)a3
{
  id v6 = [a4 objectForKeyedSubscript:@"startTime"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
    objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"startTime"), "doubleValue");
  }
  else {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  }
  retstr->var6 = Current;
  id v9 = [a4 objectForKeyedSubscript:@"heartRate"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0) {
    unsigned int v11 = objc_msgSend( objc_msgSend(a4, "objectForKeyedSubscript:", @"heartRate"),  "unsignedIntValue");
  }
  else {
    unsigned int v11 = sub_1008E7F20(50, 200);
  }
  retstr->var2 = (double)v11;
  id v12 = [a4 objectForKeyedSubscript:@"confidence"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0) {
    objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"confidence"), "doubleValue");
  }
  else {
    double v14 = sub_1008E7FC8(0.8, 1.0);
  }
  retstr->var3 = v14;
  id v15 = [a4 objectForKeyedSubscript:@"error"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0) {
    unsigned __int8 v17 = objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"error"), "BOOLValue");
  }
  else {
    unsigned __int8 v17 = 0;
  }
  retstr->var4 = v17;
  id v18 = [a4 objectForKeyedSubscript:@"dataSource"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0) {
    int v20 = objc_msgSend( objc_msgSend(a4, "objectForKeyedSubscript:", @"dataSource"),  "unsignedIntValue");
  }
  else {
    int v20 = 3;
  }
  retstr->var0 = v20;
  id v21 = [a4 objectForKeyedSubscript:@"context"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0) {
    int v23 = objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"context"), "unsignedIntValue");
  }
  else {
    int v23 = sub_1008E7F20(1, 11);
  }
  retstr->var8 = v23;
  id v24 = [a4 objectForKeyedSubscript:@"timestamp"];
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0) {
    CLOdometerSuitability result = (CLCatherineData *)objc_msgSend( objc_msgSend(a4, "objectForKeyedSubscript:", @"timestamp"),  "doubleValue");
  }
  else {
    CFAbsoluteTime v27 = CFAbsoluteTimeGetCurrent();
  }
  retstr->var5 = v27;
  return result;
}

@end
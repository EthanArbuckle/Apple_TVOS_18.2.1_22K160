@interface CMPedometerTableRawSpeedToKValue
+ (id)sharedInstance;
- ($F24F406B2B787EFB06265DBA3D28CBD5)binIntervalForRawSpeed:(double)a3;
- (BOOL)isBinaryLogging;
- (BOOL)isRawSpeedValid:(double)a3;
- (BOOL)isRunCalibrationAvailable;
- (BOOL)isWalkCalibrationAvailable;
- (CMPedometerTableRawSpeedToKValue)initWithTestMode:(BOOL)a3;
- (void)binsDidChange;
- (void)logBins;
- (void)updateBinsWithTrack:(id)a3;
@end

@implementation CMPedometerTableRawSpeedToKValue

- (BOOL)isBinaryLogging
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&qword_10199D340);
  if ((v2 & 1) == 0 && __cxa_guard_acquire(&qword_10199D340))
  {
    unsigned __int8 v4 = 0;
    sub_1012049AC((unsigned __int8 *)&unk_10199D338, "LogBinaryPedometerCalibrationTables", &v4, 0);
    __cxa_guard_release(&qword_10199D340);
  }

  return byte_10199D339;
}

+ (id)sharedInstance
{
  if (qword_10199D350 != -1) {
    dispatch_once(&qword_10199D350, &stru_101879C70);
  }
  return (id)qword_10199D348;
}

- (CMPedometerTableRawSpeedToKValue)initWithTestMode:(BOOL)a3
{
  BOOL v3 = a3;
  v18 = 0LL;
  v19 = 0LL;
  uint64_t v20 = 0LL;
  sub_100007590(&v18, (const void *)qword_10199D308, qword_10199D310, (qword_10199D310 - qword_10199D308) >> 3);
  __p = 0LL;
  v16 = 0LL;
  uint64_t v17 = 0LL;
  sub_100007590(&__p, (const void *)qword_10199D320, qword_10199D328, (qword_10199D328 - qword_10199D320) >> 3);
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CMPedometerTableRawSpeedToKValue;
  v5 = -[CMPedometerTable initWithTableName:valueInName:valueOutName:defaultValue:binBoundariesWalk:binBoundariesRun:testMode:]( &v14,  "initWithTableName:valueInName:valueOutName:defaultValue:binBoundariesWalk:binBoundariesRun:testMode:",  @"RawSpeedToKValueTable",  @"RawSpeed",  @"KValue",  &v18,  &__p,  v3,  1.0);
  if (__p)
  {
    v16 = __p;
    operator delete(__p);
  }

  if (v18)
  {
    v19 = v18;
    operator delete(v18);
  }

  if (v5)
  {
    uint64_t v6 = sub_1002F8DDC();
    CFTypeRef v13 = 0LL;
    if (sub_1002A6F20(v6, (uint64_t)@"StrideCalibrationDataBins", &v13))
    {
      CFTypeRef v7 = v13;
      objc_opt_class(&OBJC_CLASS___CMStrideCalibrationData);
      uint64_t v9 = v8;
      *(void *)&double v10 = objc_opt_class(&OBJC_CLASS___NSArray).n128_u64[0];
      -[CMPedometerTable setBins:]( v5,  "setBins:",  +[CMPedometerTable convertToCMPedometerBins:]( &OBJC_CLASS___CMPedometerTableRawSpeedToKValue,  "convertToCMPedometerBins:",  +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v9, v10, v11, 0LL),  v7,  0LL)));
      sub_1002A66DC(v6);
      (*(void (**)(uint64_t))(*(void *)v6 + 944LL))(v6);
    }
  }

  return v5;
}

- (void)logBins
{
  id v3 = objc_msgSend( -[CMPedometerTable description](self, "description"),  "componentsSeparatedByCharactersInSet:",  +[NSCharacterSet newlineCharacterSet](NSCharacterSet, "newlineCharacterSet"));
  id v4 = -[CMPedometerTable copyBins](self, "copyBins");
  if ([v4 count])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100C5CBA0;
    v5[3] = &unk_101879C98;
    v5[4] = v3;
    v5[5] = self;
    [v4 enumerateObjectsUsingBlock:v5];
  }
}

- (void)binsDidChange
{
  if (!-[CMPedometerTable testMode](self, "testMode")) {
    objc_msgSend( objc_msgSend(objc_msgSend((id)sub_1006E2838(), "vendor"), "proxyForService:", @"CLMotionSyncStore"),  "doAsync:",  &stru_101879CB8);
  }
}

- (void)updateBinsWithTrack:(id)a3
{
  double v6 = v5;
  [a3 distanceRawPed];
  double v8 = v6 / v7;
  [a3 distanceRawPed];
  double v10 = v9;
  objc_msgSend(objc_msgSend(a3, "stop"), "timeIntervalSinceReferenceDate");
  double v12 = v11;
  objc_msgSend(objc_msgSend(a3, "start"), "timeIntervalSinceReferenceDate");
  double v14 = v10 / (v12 - v13);
  [a3 distanceGps];
  double v16 = v15 / 400.0;
  if (v16 <= 1.0) {
    double v17 = v16 * 0.4;
  }
  else {
    double v17 = 0.4;
  }
  -[CMPedometerTable updateBinsWithValueOut:valueIn:alpha:](self, "updateBinsWithValueOut:valueIn:alpha:", v8, v14, v17);
  if (qword_101934510 != -1) {
    dispatch_once(&qword_101934510, &stru_101879CD8);
  }
  v18 = (os_log_s *)qword_101934518;
  if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316674;
    id v37 = [@"RawSpeedToKValueTable" UTF8String];
    __int16 v38 = 2080;
    id v39 = [@"RawSpeed" UTF8String];
    __int16 v40 = 2048;
    double v41 = v14;
    __int16 v42 = 2080;
    id v43 = [@"KValue" UTF8String];
    __int16 v44 = 2048;
    double v45 = v8;
    __int16 v46 = 2048;
    double v47 = v17;
    __int16 v48 = 2080;
    id v49 = objc_msgSend(objc_msgSend(a3, "description"), "UTF8String");
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s,Updated,With,%s,%0.4f,%s,%0.4f,Alpha,%0.4f,%s",  buf,  0x48u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_101879CD8);
    }
    uint64_t v19 = qword_101934518;
    int v22 = 136316674;
    id v23 = [@"RawSpeedToKValueTable" UTF8String];
    __int16 v24 = 2080;
    id v25 = [@"RawSpeed" UTF8String];
    __int16 v26 = 2048;
    double v27 = v14;
    __int16 v28 = 2080;
    id v29 = [@"KValue" UTF8String];
    __int16 v30 = 2048;
    double v31 = v8;
    __int16 v32 = 2048;
    double v33 = v17;
    __int16 v34 = 2080;
    id v35 = objc_msgSend(objc_msgSend(a3, "description"), "UTF8String");
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v19,  1LL,  "%s,Updated,With,%s,%0.4f,%s,%0.4f,Alpha,%0.4f,%s",  (const char *)&v22,  72);
    v21 = (uint8_t *)v20;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMPedometerTableRawSpeedToKValue updateBinsWithTrack:]", "%s\n", v20);
    if (v21 != buf) {
      free(v21);
    }
  }

- (BOOL)isWalkCalibrationAvailable
{
  return -[CMPedometerTable isWalkNativeValueOutAvailable](self, "isWalkNativeValueOutAvailable");
}

- (BOOL)isRunCalibrationAvailable
{
  return -[CMPedometerTable isRunNativeValueOutAvailable](self, "isRunNativeValueOutAvailable");
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)binIntervalForRawSpeed:(double)a3
{
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (BOOL)isRawSpeedValid:(double)a3
{
  return -[CMPedometerTable isValueInValid:](self, "isValueInValid:", a3);
}

@end
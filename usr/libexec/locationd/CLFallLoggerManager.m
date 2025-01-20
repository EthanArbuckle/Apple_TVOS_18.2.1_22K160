@interface CLFallLoggerManager
+ (id)encodeBinaryLog:(const BinaryData *)a3;
+ (id)encodeFilteredPressure:(const FilteredPressure *)a3;
+ (id)encodeHeartRate:(const CLCatherineData *)a3;
+ (id)encodePressure:(const Pressure *)a3;
+ (id)loggerDataTypeString:(unsigned __int8)a3;
+ (unsigned)loggerDataTypeFrom:(unsigned __int8)a3;
- (BOOL)isLoggingEnabled;
- (CLGizmoOrientation)orientation;
- (id)addLogger:(unsigned __int8)a3;
- (id)addLogger:(unsigned __int8)a3 toDirectory:(id)a4 prefix:(id)a5 rotation:(int64_t)a6;
- (id)initInUniverse:(id)a3;
- (void)_addLogger:(id)a3 type:(unsigned __int8)a4;
- (void)_forEachLogger:(id)a3;
- (void)_forEachLoggerWithType:(unsigned __int8)a3 logData:(id)a4;
- (void)_forEachLoggerWithType:(unsigned __int8)a3 logItem:(const BinaryData *)a4;
- (void)clearAllLogs;
- (void)dealloc;
- (void)flushData:(id)a3 userProfile:(id)a4;
- (void)logFalsePositiveSuppressionFeatures:(const FalsePositiveSuppressionFeatures *)a3;
- (void)logFilteredPressure:(const FilteredPressure *)a3;
- (void)logHeartRate:(const CLCatherineData *)a3;
- (void)logImpactEvent:(const ImpactEvent *)a3;
- (void)logImpactEventState:(const ImpactEvent *)a3;
- (void)logImpactSensorData:(const ImpactData *)a3;
- (void)logOdometer:(const OdometerEntry *)a3;
- (void)logPressure:(const Pressure *)a3;
- (void)logSensorType:(unsigned __int8)a3 data:(id)a4 startTime:(double)a5 timestamp:(unint64_t)a6;
- (void)setLoggingEnabled:(BOOL)a3;
- (void)setOrientation:(CLGizmoOrientation)a3;
- (void)stopLogging;
@end

@implementation CLFallLoggerManager

+ (unsigned)loggerDataTypeFrom:(unsigned __int8)a3
{
  if (a3 == 4) {
    unsigned __int8 v3 = 3;
  }
  else {
    unsigned __int8 v3 = 0;
  }
  if (a3 == 3) {
    return 2;
  }
  else {
    return v3;
  }
}

+ (id)loggerDataTypeString:(unsigned __int8)a3
{
  if (a3 > 0xCu) {
    return 0LL;
  }
  else {
    return *(&off_101883AD0 + (char)a3);
  }
}

- (id)initInUniverse:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CLFallLoggerManager;
  v4 = -[CLFallLoggerManager init](&v7, "init");
  if (v4)
  {
    v4->fLoggers = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v4->fUniverse = (CLIntersiloUniverse *)a3;
    v5 = (dispatch_object_s *)objc_msgSend(objc_msgSend(a3, "silo"), "queue");
    v4->fQueue = (OS_dispatch_queue *)v5;
    dispatch_retain(v5);
    v4->fEventTimes = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }

  return v4;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->fQueue);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLFallLoggerManager;
  -[CLFallLoggerManager dealloc](&v3, "dealloc");
}

- (void)_addLogger:(id)a3 type:(unsigned __int8)a4
{
  id v6 = +[CLFallLoggerManager loggerDataTypeString:](&OBJC_CLASS___CLFallLoggerManager, "loggerDataTypeString:", a4);
  objc_super v7 = (NSMutableSet *)-[NSMutableDictionary objectForKeyedSubscript:](self->fLoggers, "objectForKeyedSubscript:", v6);
  if (!v7)
  {
    objc_super v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->fLoggers, "setObject:forKeyedSubscript:", v7, v6);
  }

  -[NSMutableSet addObject:](v7, "addObject:", a3);
}

- (id)addLogger:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  v5 = objc_alloc_init(&OBJC_CLASS___CLFallLogger);
  -[CLFallLoggerManager _addLogger:type:](self, "_addLogger:type:", v5, v3);

  return v5;
}

- (id)addLogger:(unsigned __int8)a3 toDirectory:(id)a4 prefix:(id)a5 rotation:(int64_t)a6
{
  uint64_t v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  id v11 = -[CLFallLogger initToDirectory:prefix:rotation:]( objc_alloc(&OBJC_CLASS___CLFallLogger),  "initToDirectory:prefix:rotation:",  a4,  a5,  a6);
  -[CLFallLoggerManager _addLogger:type:](self, "_addLogger:type:", v11, v9);

  return v11;
}

- (void)_forEachLogger:(id)a3
{
  fLoggers = self->fLoggers;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100DD50B4;
  v4[3] = &unk_1018839E0;
  v4[4] = a3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](fLoggers, "enumerateKeysAndObjectsUsingBlock:", v4);
}

- (void)stopLogging
{
}

- (void)clearAllLogs
{
}

- (void)flushData:(id)a3 userProfile:(id)a4
{
  objc_super v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  dispatch_queue_t v8 = dispatch_queue_create("com.apple.CoreMotion.CLFallManager.flush", 0LL);
  uint64_t v9 = dispatch_group_create();
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100DD5334;
  v10[3] = &unk_101883A90;
  v10[4] = v9;
  v10[5] = v8;
  v10[6] = v7;
  -[CLFallLoggerManager _forEachLogger:](self, "_forEachLogger:", v10);
  dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  if (a3) {
    (*((void (**)(id, id, id, NSMutableDictionary *, id))a3 + 2))( a3,  -[NSMutableArray firstObject](self->fEventTimes, "firstObject"),  -[NSMutableArray lastObject](self->fEventTimes, "lastObject"),  v7,  a4);
  }
  -[NSMutableArray removeAllObjects](self->fEventTimes, "removeAllObjects");

  dispatch_release(v8);
  dispatch_release(v9);
}

- (void)_forEachLoggerWithType:(unsigned __int8)a3 logData:(id)a4
{
  fQueue = (dispatch_queue_s *)self->fQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100DD545C;
  block[3] = &unk_10184E600;
  unsigned __int8 v6 = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_async(fQueue, block);
}

+ (id)encodeBinaryLog:(const BinaryData *)a3
{
  uint64_t v4 = (*((uint64_t (**)(const BinaryData *, SEL))a3->var0 + 5))(a3, a2);
  double v5 = __chkstk_darwin(v4);
  objc_super v7 = &v12[-v6];
  int v13 = 0;
  (*((void (**)(const BinaryData *, _BYTE *, uint64_t, int *, double))a3->var0 + 2))( a3,  &v12[-v6],  v4,  &v13,  v5);
  if ((_DWORD)v4 == v13) {
    return +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v7, (int)v4);
  }
  if (qword_1019345D0 != -1) {
    dispatch_once(&qword_1019345D0, &stru_101883AB0);
  }
  uint64_t v9 = (os_log_s *)qword_1019345D8;
  if (os_log_type_enabled((os_log_t)qword_1019345D8, OS_LOG_TYPE_FAULT))
  {
    v17[0] = 67240448;
    v17[1] = v13;
    __int16 v18 = 1026;
    int v19 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_FAULT,  "bufferLength(%{public}d)!=kSize(%{public}d)",  (uint8_t *)v17,  0xEu);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(v17, 0x65CuLL);
    if (qword_1019345D0 != -1) {
      dispatch_once(&qword_1019345D0, &stru_101883AB0);
    }
    v14[0] = 67240448;
    v14[1] = v13;
    __int16 v15 = 1026;
    int v16 = v4;
    _os_log_send_and_compose_impl( 2LL,  0LL,  v17,  1628LL,  &_mh_execute_header,  qword_1019345D8,  17LL,  "bufferLength(%{public}d)!=kSize(%{public}d)",  v14,  14);
    id v11 = (char *)v10;
    sub_10029211C("Generic", 1LL, 0, 0LL, "+[CLFallLoggerManager encodeBinaryLog:]", "%s\n", v10);
  }

  return 0LL;
}

+ (id)encodeFilteredPressure:(const FilteredPressure *)a3
{
  v4[0] = &off_101857B68;
  v4[1] = *((void *)a3 + 4);
  v4[3] = *(void *)((char *)a3 + 12);
  int v5 = *((_DWORD *)a3 + 1);
  return +[CLFallLoggerManager encodeBinaryLog:](&OBJC_CLASS___CLFallLoggerManager, "encodeBinaryLog:", v4);
}

+ (id)encodePressure:(const Pressure *)a3
{
  v6[0] = &off_101857B10;
  double v3 = (double)*(unint64_t *)((char *)a3 + 12);
  v6[1] = *((void *)a3 + 4);
  uint64_t v4 = *(void *)((char *)a3 + 4);
  *(double *)&v6[3] = v3;
  v6[4] = v4;
  return +[CLFallLoggerManager encodeBinaryLog:](&OBJC_CLASS___CLFallLoggerManager, "encodeBinaryLog:", v6);
}

+ (id)encodeHeartRate:(const CLCatherineData *)a3
{
  v5[0] = &off_101858868;
  v5[1] = CFAbsoluteTimeGetCurrent();
  *(void *)((char *)&v5[2] + 4) = *(void *)&a3->var0;
  __int128 v6 = *(_OWORD *)&a3->var2;
  BOOL var4 = a3->var4;
  __int128 v8 = *(_OWORD *)&a3->var5;
  double var7 = a3->var7;
  BOOL v10 = a3->var8 == 5;
  return +[CLFallLoggerManager encodeBinaryLog:](&OBJC_CLASS___CLFallLoggerManager, "encodeBinaryLog:", v5);
}

- (void)_forEachLoggerWithType:(unsigned __int8)a3 logItem:(const BinaryData *)a4
{
  uint64_t v4 = a3;
  id v6 = +[CLFallLoggerManager encodeBinaryLog:](&OBJC_CLASS___CLFallLoggerManager, "encodeBinaryLog:", a4);
  if (v6) {
    -[CLFallLoggerManager _forEachLoggerWithType:logData:](self, "_forEachLoggerWithType:logData:", v4, v6);
  }
}

- (void)logImpactEvent:(const ImpactEvent *)a3
{
}

- (void)logImpactEventState:(const ImpactEvent *)a3
{
  v5[0] = &off_101858158;
  char v6 = 3;
  uint64_t v3 = *(void *)((char *)&a3->fAbsoluteTimestamp + 6);
  v5[1] = *(void *)&a3->fImpact.fOperatingMode;
  v5[3] = v3;
  uint64_t v4 = *(void *)&a3->fImpact.fIsFall;
  uint64_t v7 = *(void *)(&a3->fImpact.fCrown + 1);
  uint64_t v8 = v4;
  char fNow_high = HIBYTE(a3->fImpact.fNow);
  char v10 = BYTE5(a3->fImpact.fNow);
  __int16 v11 = *(_WORD *)&a3->fImpact.fHasMotionBeforeImpact;
  uint64_t v12 = *(void *)((char *)&a3->fAbsoluteImpactTimestamp + 6);
  char v13 = BYTE6(a3->fTimestamp);
  unsigned __int8 fState = a3->fImpact.fState;
  -[CLFallLoggerManager _forEachLoggerWithType:logItem:](self, "_forEachLoggerWithType:logItem:", 6LL, v5);
}

- (void)logImpactSensorData:(const ImpactData *)a3
{
  int var2 = a3->var2;
  if (var2 == 2)
  {
    double var1 = a3->var1;
    double var0 = a3->var0;
    double v15 = var1;
    __int128 v17 = *(_OWORD *)(&a3->var2 + 1);
    char v13 = &off_101858278;
    uint64_t v16 = *(void *)((char *)&a3->var3.var0[2] + 1);
    uint64_t v8 = self;
    uint64_t v9 = 9LL;
  }

  else if (var2 == 1)
  {
    double v11 = a3->var1;
    double var0 = a3->var0;
    double v15 = v11;
    uint64_t v12 = *(void *)(&a3->var2 + 1);
    DWORD2(v17) = *(_DWORD *)((char *)a3->var3.var0 + 1);
    char v13 = &off_101858220;
    uint64_t v16 = *(void *)((char *)&a3->var3.var0[2] + 1);
    *(void *)&__int128 v17 = v12;
    uint64_t v8 = self;
    uint64_t v9 = 8LL;
  }

  else
  {
    if (a3->var2) {
      return;
    }
    double v6 = a3->var1;
    double var0 = a3->var0;
    double v15 = v6;
    uint64_t v7 = *(void *)(&a3->var2 + 1);
    DWORD2(v17) = *(_DWORD *)((char *)a3->var3.var0 + 1);
    char v13 = &off_1018581B0;
    uint64_t v16 = *(void *)((char *)&a3->var3.var0[2] + 1);
    *(void *)&__int128 v17 = v7;
    uint64_t v8 = self;
    uint64_t v9 = 7LL;
  }

  -[CLFallLoggerManager _forEachLoggerWithType:logItem:](v8, "_forEachLoggerWithType:logItem:", v9, &v13);
}

- (void)logFalsePositiveSuppressionFeatures:(const FalsePositiveSuppressionFeatures *)a3
{
  v4[0] = &off_1018582E8;
  char v11 = 3;
  uint64_t v3 = *(void *)((char *)a3 + 76);
  v4[1] = *(void *)((char *)a3 + 68);
  v4[3] = v3;
  void v4[4] = *((void *)a3 + 2);
  __int128 v5 = *(_OWORD *)a3;
  __int16 v6 = *((_WORD *)a3 + 12);
  uint64_t v7 = *(void *)((char *)a3 + 26);
  int v8 = *(_DWORD *)((char *)a3 + 34);
  int v9 = *(_DWORD *)((char *)a3 + 38);
  int v10 = *(_DWORD *)((char *)a3 + 42);
  char v12 = *(_DWORD *)((char *)a3 + 46);
  __int128 v13 = *(_OWORD *)((char *)a3 + 50);
  -[CLFallLoggerManager _forEachLoggerWithType:logItem:](self, "_forEachLoggerWithType:logItem:", 10LL, v4);
}

- (void)logSensorType:(unsigned __int8)a3 data:(id)a4 startTime:(double)a5 timestamp:(unint64_t)a6
{
  uint64_t v10 = +[CLFallLoggerManager loggerDataTypeFrom:](&OBJC_CLASS___CLFallLoggerManager, "loggerDataTypeFrom:", a3);
  char v11 = (char *)[a4 length];
  char v12 = +[NSMutableData dataWithCapacity:](&OBJC_CLASS___NSMutableData, "dataWithCapacity:", v11 + 20);
  id v13 = [[CLSensorRecorderSensorMeta alloc] initWithDataType:v10];
  [v13 setDataSize:v11];
  [v13 setTimestamp:a6];
  [v13 setStartTime:a5];
  +[CLSensorRecorderSensorMetaSerializer serializeMeta:toData:]( &OBJC_CLASS___CLSensorRecorderSensorMetaSerializer,  "serializeMeta:toData:",  v13,  v12);

  -[NSMutableData appendData:](v12, "appendData:", a4);
  -[CLFallLoggerManager _forEachLoggerWithType:logData:](self, "_forEachLoggerWithType:logData:", v10, v12);
}

- (void)logFilteredPressure:(const FilteredPressure *)a3
{
}

- (void)logPressure:(const Pressure *)a3
{
}

- (void)logHeartRate:(const CLCatherineData *)a3
{
}

- (void)logOdometer:(const OdometerEntry *)a3
{
  v8[1] = CFAbsoluteTimeGetCurrent();
  __int128 v5 = *(_OWORD *)&a3->var2.accuracy;
  __int128 v9 = *(_OWORD *)&a3->var2.startTime;
  __int128 v10 = v5;
  __int128 v6 = *(_OWORD *)&a3->var2.odometer;
  __int128 v11 = *(_OWORD *)&a3->var2.speed;
  __int128 v12 = v6;
  *(int32x2_t *)&__int128 v6 = vrev64_s32(*(int32x2_t *)&a3->var2.quality);
  double timestampGps = a3->var2.timestampGps;
  uint64_t v14 = v6;
  __int128 v7 = *(_OWORD *)&a3->var2.smoothedGPSAltitude;
  __int128 v15 = *(_OWORD *)&a3->var2.groundAltitude;
  __int128 v16 = v7;
  v8[0] = &off_101858600;
  __int128 v17 = *(_OWORD *)&a3->var2.gpsCourseRadians;
  -[CLFallLoggerManager _forEachLoggerWithType:logItem:](self, "_forEachLoggerWithType:logItem:", 11LL, v8);
}

- (BOOL)isLoggingEnabled
{
  return self->fLoggingEnabled;
}

- (void)setLoggingEnabled:(BOOL)a3
{
  self->fLoggingEnabled = a3;
}

- (CLGizmoOrientation)orientation
{
  return self->fOrientation;
}

- (void)setOrientation:(CLGizmoOrientation)a3
{
  self->fOrientation = a3;
}

@end
@interface CLWorkoutRecording
- (BOOL)setWorkingDirectory:(id)a3;
- (BOOL)start:(id)a3 recentLocation:(CLDaemonLocation *)a4 triggerDelay:(double)a5 recentWeatherData:(id)a6 maxFileCount:(unsigned int)a7;
- (CLDaemonLocation)getStartLocation;
- (CLWorkoutRecording)initWithDelegate:(id)a3 universe:(id)a4 moduleDictionary:(id)a5 setting:(SettingStructure *)a6;
- (NSArray)recordingURLs;
- (NSDictionary)metadata;
- (basic_string<char,)getStringSessionId:(std::allocator<char>> *__return_ptr)retstr;
- (double)makeSafeCFAbsoluteTime:(double)a3;
- (double)startTime;
- (double)stopTime;
- (id).cxx_construct;
- (id)getLocationBlock;
- (void)cleanup;
- (void)dealloc;
- (void)deleteWorkingDirectory;
- (void)initializeTheSettings:(SettingStructure *)a3;
- (void)recordWeatherData:(id)a3;
- (void)recordWorkoutEffort:(const Result *)a3;
- (void)recordWorkoutSessionEvent:(const WorkoutEvent *)a3;
- (void)recordWorkoutSessionPriors:(const void *)a3;
- (void)releaseBlocks;
- (void)setMotionStateFunction:(id)a3;
- (void)setupListeners;
- (void)setupModuleWriters;
- (void)stop;
- (void)teardownListeners;
- (void)updateMetadata;
- (void)writeStrideCalBins;
@end

@implementation CLWorkoutRecording

- (id)getLocationBlock
{
  return *(id *)&self->_startLocation.referenceFrame;
}

- (void)recordWorkoutSessionEvent:(const WorkoutEvent *)a3
{
  uint64_t v3 = *(void *)&self->_startLocation.floor;
  if (v3) {
    (*(void (**)(uint64_t, const WorkoutEvent *))(v3 + 16))(v3, a3);
  }
}

- (void)initializeTheSettings:(SettingStructure *)a3
{
  BYTE1(self->_fFileTimeInterval) = a3->disableWeatherData;
  BYTE2(self->_fFileTimeInterval) = a3->disableMeanMaxMets;
  LOBYTE(self->_fFileTimeInterval) = a3->disableStrideCalBins;
  self->_recordingType.var0 = a3->recordingType.var0;
  self->_recordingType.__r_.var0 = a3->recordingType.__r_.var0;
  self->_privacyTimeOffset = a3->privacyTimeOffset;
  std::string::operator=((std::string *)&self->_recordingType, (const std::string *)&a3->recordingType);
}

- (CLWorkoutRecording)initWithDelegate:(id)a3 universe:(id)a4 moduleDictionary:(id)a5 setting:(SettingStructure *)a6
{
  if (qword_101934670 != -1) {
    dispatch_once(&qword_101934670, &stru_1018A3078);
  }
  v11 = (os_log_s *)qword_101934678;
  if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEFAULT))
  {
    BOOL hasSyncInWatch = a6->hasSyncInWatch;
    if (self)
    {
      -[CLWorkoutRecording getStringSessionId:](self, "getStringSessionId:", a6->workoutRecorderSessionId);
      v13 = SHIBYTE(__p[2]) >= 0 ? __p : (void **)__p[0];
    }

    else
    {
      memset(__p, 0, 24);
      v13 = __p;
    }

    uint64_t v14 = *(void *)&a6[1].hasSyncInWatch;
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)&buf[4] = hasSyncInWatch;
    *(_WORD *)&buf[8] = 2080;
    *(void *)&buf[10] = v13;
    __int16 v52 = 2048;
    uint64_t v53 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "CLWorkoutRecording: initWithDelegate, hasSync: %d and internal sessionID: %s and activity type: %ld",  buf,  0x1Cu);
    if (SHIBYTE(__p[2]) < 0) {
      operator delete(__p[0]);
    }
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A3078);
    }
    uint64_t v28 = qword_101934678;
    BOOL v29 = a6->hasSyncInWatch;
    if (self)
    {
      -[CLWorkoutRecording getStringSessionId:](self, "getStringSessionId:", a6->workoutRecorderSessionId);
      if (v42 >= 0) {
        v30 = v41;
      }
      else {
        v30 = (void **)v41[0];
      }
    }

    else
    {
      v41[0] = 0LL;
      v41[1] = 0LL;
      v30 = v41;
      uint64_t v42 = 0LL;
    }

    v35 = *(void **)&a6[1].hasSyncInWatch;
    LODWORD(__p[0]) = 67109634;
    HIDWORD(__p[0]) = v29;
    LOWORD(__p[1]) = 2080;
    *(void **)((char *)&__p[1] + 2) = v30;
    WORD1(__p[2]) = 2048;
    *(void **)((char *)&__p[2] + 4) = v35;
    LODWORD(v38) = 28;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v28,  0LL,  "CLWorkoutRecording: initWithDelegate, hasSync: %d and internal sessionID: %s and activity type: %ld",  __p,  v38,  aBlock[0]);
    v37 = v36;
    if (SHIBYTE(v42) < 0) {
      operator delete(v41[0]);
    }
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWorkoutRecording initWithDelegate:universe:moduleDictionary:setting:]",  "%s\n",  v37);
    if (v37 != buf) {
      free(v37);
    }
  }

  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___CLWorkoutRecording;
  v15 = -[CLWorkoutRecording init](&v40, "init");
  v16 = v15;
  if (v15)
  {
    v15->_delegate = (CLWorkoutRecordingDelegate *)a3;
    v15->_universe = (CLIntersiloUniverse *)a4;
    v15->_metadata = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v17 = *(_OWORD *)&a6->privacyTimeOffset;
    v43[2] = *(_OWORD *)&a6->kPrivacyPressureMaxOffset;
    v43[3] = v17;
    __int128 v18 = *(_OWORD *)a6->workoutRecorderSessionId;
    v43[4] = *(_OWORD *)&a6->minimumPowerAssertionTimeSeconds;
    v43[5] = v18;
    __int128 v19 = *(_OWORD *)&a6->hasSyncInWatch;
    v43[0] = *(_OWORD *)&a6->disableAveragedALS;
    v43[1] = v19;
    if (*((char *)&a6->recordingType.__r_.__value_.var0.var1 + 23) < 0)
    {
      sub_1010DD48C( &v44,  a6->recordingType.__r_.__value_.var0.var1.__data_,  a6->recordingType.__r_.__value_.var0.var1.__size_);
    }

    else
    {
      __int128 v44 = *(_OWORD *)a6->recordingType.__r_.__value_.var0.var0.__data_;
      uint64_t v45 = *((void *)&a6->recordingType.__r_.__value_.var0.var1 + 2);
    }

    __int128 v46 = *(_OWORD *)&a6->recordingType.__r_.var0;
    __int128 v47 = *(_OWORD *)&a6[1].disableAveragedALS;
    __int128 v48 = *(_OWORD *)&a6[1].hasSyncInWatch;
    __int128 v49 = *(_OWORD *)&a6[1].kPrivacyPressureMaxOffset;
    -[CLWorkoutRecording initializeTheSettings:](v16, "initializeTheSettings:", v43);
    if (SHIBYTE(v45) < 0) {
      operator delete((void *)v44);
    }
    metadata = v16->_metadata;
    uint64_t v21 = sub_1004F2598();
    sub_1004F58C8(v21, (uint64_t)buf);
    if ((v53 & 0x80000000LL) == 0) {
      v22 = buf;
    }
    else {
      v22 = *(_BYTE **)buf;
    }
    -[NSMutableDictionary setValue:forKey:]( metadata,  "setValue:forKey:",  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v22),  @"HardwareType");
    if (SBYTE3(v53) < 0) {
      operator delete(*(void **)buf);
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v16->_metadata,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", sub_10071E52C()),  @"FallNotifierAvailable");
    p_recordingType = (__long *)&v16->_recordingType;
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v16->_metadata,  "setObject:forKeyedSubscript:",  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", p_recordingType),  @"RecordingType");
    -[CLWorkoutRecording getStringSessionId:](v16, "getStringSessionId:", a6->workoutRecorderSessionId);
    if ((v53 & 0x80000000LL) == 0) {
      v24 = buf;
    }
    else {
      v24 = *(_BYTE **)buf;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v16->_metadata,  "setObject:forKeyedSubscript:",  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v24),  @"workoutRecorderSessionId");
    if (SBYTE3(v53) < 0) {
      operator delete(*(void **)buf);
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v16->_metadata,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a6->hasSyncInWatch),  @"hasCompanionPayload");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v16->_metadata,  "setObject:forKeyedSubscript:",  &off_1018D5398,  @"MeanMaxMets");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v16->_metadata,  "setObject:forKeyedSubscript:",  &off_1018D5240,  @"UniqueWorkoutActivityCount");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v16->_metadata,  "setObject:forKeyedSubscript:",  *(void *)&a6[1].accelIntervalSeconds,  @"ParticipantID");
    if (a6->hasSyncInWatch) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v16->_metadata,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", *(void *)&a6[1].hasSyncInWatch),  @"WorkoutActivityType");
    }
    sub_1004F2598();
    if (sub_1004F8A40()) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v16->_metadata,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"InternalInstall");
    }
    v16->_modulesDict = (NSMutableDictionary *)a5;
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A3078);
    }
    v25 = (os_log_s *)qword_101934678;
    if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEBUG))
    {
      id v26 = objc_msgSend(-[NSMutableDictionary allKeys](v16->_modulesDict, "allKeys"), "count");
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v26;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEBUG,  "CLWorkoutRecording:initWithDelegate %lu",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A3078);
      }
      uint64_t v31 = qword_101934678;
      id v32 = objc_msgSend(-[NSMutableDictionary allKeys](v16->_modulesDict, "allKeys"), "count");
      LODWORD(__p[0]) = 134217984;
      *(void **)((char *)__p + 4) = v32;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v31,  2LL,  "CLWorkoutRecording:initWithDelegate %lu",  __p);
      v34 = (char *)v33;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWorkoutRecording initWithDelegate:universe:moduleDictionary:setting:]",  "%s\n",  v33);
      if (v34 != buf) {
        free(v34);
      }
    }

    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 3221225472LL;
    aBlock[2] = sub_1011F9A70;
    aBlock[3] = &unk_1018A3058;
    aBlock[4] = v16;
    *(void *)&v16->_startLocation.referenceFrame = _Block_copy(aBlock);
  }

  return v16;
}

- (basic_string<char,)getStringSessionId:(std::allocator<char>> *__return_ptr)retstr
{
  return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)sub_1010DDBC0(retstr, out);
}

- (void)dealloc
{
  self->_workingDirectory = 0LL;
  self->_metadata = 0LL;
  self->_delegate = 0LL;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CLWorkoutRecording;
  -[CLWorkoutRecording dealloc](&v7, "dealloc");
  if (qword_101934670 != -1) {
    dispatch_once(&qword_101934670, &stru_1018A3078);
  }
  uint64_t v3 = (os_log_s *)qword_101934678;
  if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "CLWorkoutRecording deallocation is complete.",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A3078);
    }
    v6[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  0LL,  "CLWorkoutRecording deallocation is complete.",  v6,  2);
    v5 = (uint8_t *)v4;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWorkoutRecording dealloc]", "%s\n", v4);
    if (v5 != buf) {
      free(v5);
    }
  }

- (BOOL)start:(id)a3 recentLocation:(CLDaemonLocation *)a4 triggerDelay:(double)a5 recentWeatherData:(id)a6 maxFileCount:(unsigned int)a7
{
  if (-[CLWorkoutRecording setWorkingDirectory:](self, "setWorkingDirectory:", a3))
  {
    self->_startLocation.ellipsoidalAltitude = CFAbsoluteTimeGetCurrent();
    __int128 v12 = *(_OWORD *)&a4->coordinate.longitude;
    *(_OWORD *)(&self->_fFileTimeInterval + 1) = *(_OWORD *)&a4->suitability;
    *(_OWORD *)(&self->_disableMeanMaxMets + 2) = v12;
    __int128 v13 = *(_OWORD *)&a4->course;
    __int128 v14 = *(_OWORD *)&a4->timestamp;
    __int128 v15 = *(_OWORD *)&a4->speed;
    *($AB5116BA7E623E054F959CECB034F4E7 *)((char *)&self->_startLocation.coordinate + 4) = *($AB5116BA7E623E054F959CECB034F4E7 *)&a4->altitude;
    *(_OWORD *)((char *)&self->_startLocation.speedAccuracy + 4) = v14;
    *(_OWORD *)((char *)&self->_startLocation.verticalAccuracy + 4) = v13;
    *(_OWORD *)((char *)&self->_startLocation.horizontalAccuracy + 4) = v15;
    $AB5116BA7E623E054F959CECB034F4E7 rawCoordinate = a4->rawCoordinate;
    __int128 v16 = *(_OWORD *)&a4->rawCourse;
    __int128 v18 = *(_OWORD *)&a4->integrity;
    *(_OWORD *)((char *)&self->_startLocation.courseAccuracy + 4) = *(_OWORD *)&a4->lifespan;
    *(_OWORD *)&self->_startLocation.rawCoordinate.longitude = v18;
    *(_OWORD *)(&self->_startLocation.type + 1) = v16;
    *($AB5116BA7E623E054F959CECB034F4E7 *)(&self->_startLocation.confidence + 1) = rawCoordinate;
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_metadata,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a5),  @"TriggerDelay");
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A3078);
    }
    __int128 v19 = (os_log_s *)qword_101934678;
    if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEBUG))
    {
      workingDirectory = self->_workingDirectory;
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = workingDirectory;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = a7;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "CLWorkoutRecording: Writing files to %@, maxFileCount %d.",  buf,  0x12u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A3078);
      }
      BOOL v29 = self->_workingDirectory;
      *(_DWORD *)v34 = 138412546;
      *(void *)&v34[4] = v29;
      *(_WORD *)&v34[12] = 1024;
      *(_DWORD *)&v34[14] = a7;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  2LL,  "CLWorkoutRecording: Writing files to %@, maxFileCount %d.",  v34,  18);
      uint64_t v31 = (char *)v30;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWorkoutRecording start:recentLocation:triggerDelay:recentWeatherData:maxFileCount:]",  "%s\n",  v30);
      if (v31 != buf) {
        free(v31);
      }
    }

    *(void *)v34 = self->_recordingType.var0;
    *(_DWORD *)&v34[8] = self->_recordingType.__r_.var0;
    *(_DWORD *)&v34[12] = a7;
    sub_1010DDBC0( &v34[16],  (char *)-[NSURL fileSystemRepresentation](self->_workingDirectory, "fileSystemRepresentation"));
    sub_1010DDBC0(&v36, "recording");
    sub_1010DDBC0(&v38, "msl");
    LODWORD(v40) = 2;
    *((void *)&v40 + 1) = 300LL;
    uint64_t v21 = (char *)operator new(0xB0uLL);
    *((void *)v21 + 1) = 0LL;
    *((void *)v21 + 2) = 0LL;
    *(void *)uint64_t v21 = off_1018A30A8;
    *(_OWORD *)buf = *(_OWORD *)v34;
    if (SHIBYTE(v35) < 0)
    {
      sub_1010DD48C(&buf[16], *(void **)&v34[16], *(unint64_t *)&v34[24]);
    }

    else
    {
      *(_OWORD *)&buf[16] = *(_OWORD *)&v34[16];
      uint64_t v42 = v35;
    }

    if (SHIBYTE(v37) < 0)
    {
      sub_1010DD48C(&v43, (void *)v36, *((unint64_t *)&v36 + 1));
    }

    else
    {
      __int128 v43 = v36;
      uint64_t v44 = v37;
    }

    if (SHIBYTE(v39) < 0)
    {
      sub_1010DD48C(&__p, (void *)v38, *((unint64_t *)&v38 + 1));
    }

    else
    {
      __int128 __p = v38;
      uint64_t v46 = v39;
    }

    __int128 v47 = v40;
    sub_10111CC08(v21 + 24, buf);
    if (SHIBYTE(v46) < 0) {
      operator delete((void *)__p);
    }
    if (SHIBYTE(v44) < 0) {
      operator delete((void *)v43);
    }
    if (SHIBYTE(v42) < 0) {
      operator delete(*(void **)&buf[16]);
    }
    self->_writer.__ptr_ = (WriterManager *)(v21 + 24);
    p_writer = &self->_writer;
    cntrl = self->_writer.__cntrl_;
    self->_writer.__cntrl_ = (__shared_weak_count *)v21;
    if (cntrl)
    {
      id v26 = (unint64_t *)((char *)cntrl + 8);
      do
        unint64_t v27 = __ldaxr(v26);
      while (__stlxr(v27 - 1, v26));
      if (!v27)
      {
        (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16LL))(cntrl);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
      }
    }

    BOOL v23 = *((_BYTE *)p_writer->__ptr_ + 136) != 0;
    if (*((_BYTE *)p_writer->__ptr_ + 136))
    {
      -[CLWorkoutRecording setupModuleWriters](self, "setupModuleWriters");
      -[CLWorkoutRecording setupListeners](self, "setupListeners");
      -[CLWorkoutRecording recordWeatherData:](self, "recordWeatherData:", a6);
    }

    else
    {
      sub_1000F0D38(&self->_writer.__ptr_);
    }

    if (SHIBYTE(v39) < 0) {
      operator delete((void *)v38);
    }
    if (SHIBYTE(v37) < 0) {
      operator delete((void *)v36);
    }
    if (SHIBYTE(v35) < 0) {
      operator delete(*(void **)&v34[16]);
    }
  }

  else
  {
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A3078);
    }
    v22 = (os_log_s *)qword_101934678;
    if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "CLWorkoutRecording: start, no working directory",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A3078);
      }
      *(_WORD *)v34 = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  2LL,  "CLWorkoutRecording: start, no working directory",  v34,  2);
      v33 = (char *)v32;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWorkoutRecording start:recentLocation:triggerDelay:recentWeatherData:maxFileCount:]",  "%s\n",  v32);
      if (v33 != buf) {
        free(v33);
      }
    }

    return 0;
  }

  return v23;
}

- (void)stop
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  ptr = self->_writer.__ptr_;
  *(CFAbsoluteTime *)&self->_startLocation.signalEnvironmentType = Current;
  if (ptr)
  {
    __int128 v9 = *(_OWORD *)ptr;
    if (*((char *)ptr + 39) < 0)
    {
      sub_1010DD48C(&v10, *((void **)ptr + 2), *((void *)ptr + 3));
    }

    else
    {
      __int128 v5 = *((_OWORD *)ptr + 1);
      uint64_t v11 = *((void *)ptr + 4);
      __int128 v10 = v5;
    }

    if (*((char *)ptr + 63) < 0)
    {
      sub_1010DD48C(&v12, *((void **)ptr + 5), *((void *)ptr + 6));
    }

    else
    {
      __int128 v6 = *(_OWORD *)((char *)ptr + 40);
      uint64_t v13 = *((void *)ptr + 7);
      __int128 v12 = v6;
    }

    if (*((char *)ptr + 87) < 0)
    {
      sub_1010DD48C(&__p, *((void **)ptr + 8), *((void *)ptr + 9));
    }

    else
    {
      __int128 v7 = *((_OWORD *)ptr + 4);
      uint64_t v15 = *((void *)ptr + 10);
      __int128 __p = v7;
    }

    __int128 v16 = *(_OWORD *)((char *)ptr + 88);
    double v8 = *(double *)&self->_startLocation.signalEnvironmentType - (double)(HIDWORD(v9) * DWORD2(v9));
    if (self->_startLocation.ellipsoidalAltitude < v8) {
      self->_startLocation.ellipsoidalAltitude = v8;
    }
    if (SHIBYTE(v15) < 0) {
      operator delete((void *)__p);
    }
    if (SHIBYTE(v13) < 0) {
      operator delete((void *)v12);
    }
    if (SHIBYTE(v11) < 0) {
      operator delete((void *)v10);
    }
  }

  sub_1000F0D38(&self->_writer.__ptr_);
}

- (void)cleanup
{
}

- (BOOL)setWorkingDirectory:(id)a3
{
  v25[0] = [a3 path];
  v25[1] = -[NSUUID UUIDString](+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"), "UUIDString");
  v4 = +[NSURL fileURLWithPathComponents:]( &OBJC_CLASS___NSURL,  "fileURLWithPathComponents:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 2LL));
  if (-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  -[NSURL path](v4, "path")))
  {
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A3078);
    }
    __int128 v5 = (os_log_s *)qword_101934678;
    if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "CLWorkoutRecording: Recording working directory already exists. This should never happen.",  buf,  2u);
    }

    BOOL v6 = 0;
    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A3078);
      }
      LOWORD(v17) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  16LL,  "CLWorkoutRecording: Recording working directory already exists. This should never happen.",  &v17,  2);
      double v8 = (uint8_t *)v7;
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLWorkoutRecording setWorkingDirectory:]", "%s\n", v7);
      if (v8 != buf) {
        free(v8);
      }
      return 0;
    }
  }

  else
  {
    uint64_t v16 = 0LL;
    -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  -[NSURL path](v4, "path"),  1LL,  0LL,  &v16);
    BOOL v6 = v16 == 0;
    if (v16)
    {
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A3078);
      }
      __int128 v9 = (os_log_s *)qword_101934678;
      if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)v20 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "CLWorkoutRecording: Unable to create recording working directory, error: %{public}@",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934670 != -1) {
          dispatch_once(&qword_101934670, &stru_1018A3078);
        }
        int v17 = 138543362;
        uint64_t v18 = v16;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  16LL,  "CLWorkoutRecording: Unable to create recording working directory, error: %{public}@",  &v17,  12);
        uint64_t v11 = (uint8_t *)v10;
        sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLWorkoutRecording setWorkingDirectory:]", "%s\n", v10);
        if (v11 != buf) {
          free(v11);
        }
      }
    }

    else
    {
      if (self->_workingDirectory)
      {
        if (qword_101934670 != -1) {
          dispatch_once(&qword_101934670, &stru_1018A3078);
        }
        uint64_t v13 = (os_log_s *)qword_101934678;
        if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 68289539;
          *(_DWORD *)v20 = 0;
          *(_WORD *)&v20[4] = 2082;
          *(void *)&v20[6] = "";
          __int16 v21 = 2082;
          v22 = "assert";
          __int16 v23 = 2081;
          v24 = "!_workingDirectory";
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:CLWorkoutRecording : Working directory should only ever be set once., event:%{p ublic, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x26u);
          if (qword_101934670 != -1) {
            dispatch_once(&qword_101934670, &stru_1018A3078);
          }
        }

        __int128 v14 = (os_log_s *)qword_101934678;
        if (os_signpost_enabled((os_log_t)qword_101934678))
        {
          *(_DWORD *)buf = 68289539;
          *(_DWORD *)v20 = 0;
          *(_WORD *)&v20[4] = 2082;
          *(void *)&v20[6] = "";
          __int16 v21 = 2082;
          v22 = "assert";
          __int16 v23 = 2081;
          v24 = "!_workingDirectory";
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v14,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "CLWorkoutRecording : Working directory should only ever be set once.",  "{msg%{public}.0s:CLWorkoutRecording : Working directory should only ever be set once., event:%{p ublic, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x26u);
          if (qword_101934670 != -1) {
            dispatch_once(&qword_101934670, &stru_1018A3078);
          }
        }

        uint64_t v15 = (os_log_s *)qword_101934678;
        if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 68289539;
          *(_DWORD *)v20 = 0;
          *(_WORD *)&v20[4] = 2082;
          *(void *)&v20[6] = "";
          __int16 v21 = 2082;
          v22 = "assert";
          __int16 v23 = 2081;
          v24 = "!_workingDirectory";
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:CLWorkoutRecording : Working directory should only ever be set once., event:%{p ublic, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x26u);
        }

        abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Motion/Utilities/CLWorkoutRecording.mm",  222,  "-[CLWorkoutRecording setWorkingDirectory:]");
      }

      self->_workingDirectory = v4;
    }
  }

  return v6;
}

- (double)stopTime
{
  return result;
}

- (void)updateMetadata
{
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  obj = self->_modulesDict;
  id v16 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v21,  v26,  16LL);
  if (v16)
  {
    int v3 = 0;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
        id v6 = objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:](self->_modulesDict, "objectForKeyedSubscript:", v5),  "metadata");
        if (v6)
        {
          __int128 v7 = v6;
          __int128 v19 = 0u;
          __int128 v20 = 0u;
          __int128 v17 = 0u;
          __int128 v18 = 0u;
          id v8 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v8)
          {
            id v9 = v8;
            uint64_t v10 = *(void *)v18;
            do
            {
              for (j = 0LL; j != v9; j = (char *)j + 1)
              {
                if (*(void *)v18 != v10) {
                  objc_enumerationMutation(v7);
                }
                -[NSMutableDictionary setValue:forKey:]( self->_metadata,  "setValue:forKey:",  [v7 objectForKey:*(void *)(*((void *)&v17 + 1) + 8 * (void)j)],  *(void *)(*((void *)&v17 + 1) + 8 * (void)j));
              }

              id v9 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
            }

            while (v9);
          }
        }

        id v12 = objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:](self->_modulesDict, "objectForKeyedSubscript:", v5),  "getSampleCount");
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_metadata,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v12),  +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@SampleCount", v5));
      }

      id v16 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v21,  v26,  16LL);
    }

    while (v16);
    double v13 = (float)v3;
  }

  else
  {
    double v13 = 0.0;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_metadata,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  v13 / (*(double *)&self->_startLocation.signalEnvironmentType - self->_startLocation.ellipsoidalAltitude)),  @"ActiveSamplePerSeconds");
}

- (NSDictionary)metadata
{
  return &self->_metadata->super;
}

- (NSArray)recordingURLs
{
  workingDirectory = self->_workingDirectory;
  if (!workingDirectory) {
    return 0LL;
  }
  sub_1010DDBC0(buf, (char *)-[NSURL fileSystemRepresentation](workingDirectory, "fileSystemRepresentation"));
  sub_1010DDBC0(__p, "msl");
  sub_1011D7C48((uint64_t *)buf, (uint64_t *)__p, &v16);
  if (SHIBYTE(v15) < 0) {
    operator delete(__p[0]);
  }
  if (v21 < 0) {
    operator delete(*(void **)buf);
  }
  int v3 = +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  0xAAAAAAAAAAAAAAABLL * ((v17 - v16) >> 3));
  uint64_t v4 = v16;
  for (uint64_t i = v17; v4 != i; v4 += 24LL)
  {
    if (*(char *)(v4 + 23) < 0)
    {
      sub_1010DD48C(__p, *(void **)v4, *(void *)(v4 + 8));
    }

    else
    {
      __int128 v6 = *(_OWORD *)v4;
      uint64_t v15 = *(void *)(v4 + 16);
      *(_OWORD *)__int128 __p = v6;
    }

    if (v15 >= 0) {
      __int128 v7 = __p;
    }
    else {
      __int128 v7 = (void **)__p[0];
    }
    id v8 = +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7),  0LL);
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A3078);
    }
    id v9 = (os_log_s *)qword_101934678;
    if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Adding file to be sent: %@", buf, 0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A3078);
      }
      int v18 = 138412290;
      __int128 v19 = v8;
      LODWORD(v13) = 12;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  2LL,  "Adding file to be sent: %@",  &v18,  v13);
      uint64_t v11 = (char *)v10;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWorkoutRecording recordingURLs]", "%s\n", v10);
      if (v11 != buf) {
        free(v11);
      }
    }

    -[NSMutableArray addObject:](v3, "addObject:", v8);
    if (SHIBYTE(v15) < 0) {
      operator delete(__p[0]);
    }
  }

  *(void *)buf = &v16;
  sub_1000129D4((void ***)buf);
  return &v3->super;
}

- (void)setupListeners
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  modulesDict = self->_modulesDict;
  id v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( modulesDict,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0LL; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(modulesDict);
        }
        objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( self->_modulesDict,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v8 + 1) + 8 * (void)i)),  "setupListener");
      }

      id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( modulesDict,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v5);
  }

- (void)teardownListeners
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  modulesDict = self->_modulesDict;
  id v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( modulesDict,  "countByEnumeratingWithState:objects:count:",  &v13,  v18,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0LL; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(modulesDict);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)i);
        objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:](self->_modulesDict, "objectForKeyedSubscript:", v8),  "teardownListeners");
      }

      id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( modulesDict,  "countByEnumeratingWithState:objects:count:",  &v13,  v18,  16LL);
    }

    while (v5);
  }

  self->_modulesDict = 0LL;
  if (qword_101934670 != -1) {
    dispatch_once(&qword_101934670, &stru_1018A3078);
  }
  __int128 v9 = (os_log_s *)qword_101934678;
  if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Tearing down listeners.", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A3078);
    }
    v12[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  2LL,  "Tearing down listeners.",  v12,  2);
    __int128 v11 = (uint8_t *)v10;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWorkoutRecording teardownListeners]", "%s\n", v10);
    if (v11 != buf) {
      free(v11);
    }
  }

- (void)recordWorkoutSessionPriors:(const void *)a3
{
  ptr = self->_writer.__ptr_;
  if (ptr && *((_BYTE *)ptr + 136) && *((void *)a3 + 10))
  {
    sub_101125260(v32);
    -[CLWorkoutRecording makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
    v34 |= 1u;
    v32[77] = v6;
    sub_101139ABC(v32);
    sub_10116F1E8(v33);
    __int128 v7 = v33;
    unint64_t v8 = *((void *)a3 + 9);
    uint64_t v9 = *((void *)a3 + 6);
    uint64_t v10 = *((void *)a3 + 7);
    __int128 v11 = (void *)(v9 + 8 * (v8 / 0x18));
    if (v10 == v9) {
      id v12 = 0LL;
    }
    else {
      id v12 = (void *)(*v11 + 168 * (v8 % 0x18));
    }
    while (1)
    {
      if (v10 == v9)
      {
        unint64_t v14 = 0LL;
      }

      else
      {
        unint64_t v13 = *((void *)a3 + 10) + *((void *)a3 + 9);
        unint64_t v14 = *(void *)(v9 + 8 * (v13 / 0x18)) + 168 * (v13 % 0x18);
      }

      if (v12 == (void *)v14) {
        break;
      }
      sub_10116F66C((char **)(v7[1] + 8LL));
      uint64_t v15 = *(void *)(*(void *)(v7[1] + 16LL) - 8LL);
      uint64_t v16 = v12[6];
      char v17 = *(_BYTE *)(v15 + 32);
      *(_BYTE *)(v15 + 32) = v17 | 0x10;
      *(_DWORD *)(v15 + 28) = v16;
      uint64_t v18 = v12[7];
      *(_BYTE *)(v15 + 32) = v17 | 0x18;
      *(_DWORD *)(v15 + 24) = v18;
      uint64_t v19 = v12[6];
      if (v19 == 14)
      {
        uint64_t v22 = v12[8];
        *(_BYTE *)(v15 + 32) = v17 | 0x1A;
        *(_DWORD *)(v15 + 16) = v22;
      }

      else if (v19 == 19)
      {
        uint64_t v20 = v12[8];
        *(_BYTE *)(v15 + 32) = v17 | 0x1C;
        *(_DWORD *)(v15 + 20) = v20;
        uint64_t v21 = v12[9];
        *(_BYTE *)(v15 + 32) = v17 | 0x1D;
        *(void *)(v15 + 8) = v21;
      }

      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A3078);
      }
      __int128 v23 = (os_log_s *)qword_101934678;
      if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = v12[6];
        uint64_t v25 = v12[7];
        *(_DWORD *)buf = 134218240;
        uint64_t v40 = v24;
        __int16 v41 = 2048;
        uint64_t v42 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "CLWorkoutRecording: Recording workout session priors, workoutType,%ld, workoutLocationType,%ld",  buf,  0x16u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934670 != -1) {
          dispatch_once(&qword_101934670, &stru_1018A3078);
        }
        uint64_t v27 = v12[6];
        uint64_t v28 = v12[7];
        int v35 = 134218240;
        uint64_t v36 = v27;
        __int16 v37 = 2048;
        uint64_t v38 = v28;
        LODWORD(v31) = 22;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  0LL,  "CLWorkoutRecording: Recording workout session priors, workoutType,%ld, workoutLocationType,%ld",  &v35,  v31);
        v30 = (uint8_t *)v29;
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWorkoutRecording recordWorkoutSessionPriors:]", "%s\n", v29);
        if (v30 != buf) {
          free(v30);
        }
      }

      v12 += 21;
      if ((void *)((char *)v12 - *v11) == (void *)4032)
      {
        id v26 = (void *)v11[1];
        ++v11;
        id v12 = v26;
      }

      uint64_t v9 = *((void *)a3 + 6);
      uint64_t v10 = *((void *)a3 + 7);
    }

    sub_10111D6A8((uint64_t)self->_writer.__ptr_, (uint64_t)v32);
    sub_101127D00((PB::Base *)v32);
  }

- (void)writeStrideCalBins
{
  ptr = self->_writer.__ptr_;
  if (ptr && *((_BYTE *)ptr + 136) && !LOBYTE(self->_fFileTimeInterval))
  {
    id v56 =  objc_msgSend( -[CLWorkoutRecordingDelegate vendor](self->_delegate, "vendor"),  "proxyForService:",  @"CLStepCountNotifier");
    __int128 v68 = 0u;
    __int128 v69 = 0u;
    __int128 v70 = 0u;
    __int128 v71 = 0u;
    id obj = [v56 syncgetCopyRawSpeedToKValueBins];
    id v4 = [obj countByEnumeratingWithState:&v68 objects:v89 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v69;
      do
      {
        uint64_t v6 = 0LL;
        do
        {
          if (*(void *)v69 != v5) {
            objc_enumerationMutation(obj);
          }
          __int128 v7 = *(void **)(*((void *)&v68 + 1) + 8LL * (void)v6);
          sub_101125260(v63);
          -[CLWorkoutRecording makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
          v67 |= 1u;
          uint64_t v64 = v8;
          sub_10113AE18(v63);
          uint64_t v9 = v66;
          [v7 begin];
          *(_BYTE *)(v9 + 40) |= 1u;
          *(void *)(v9 + 8) = v10;
          uint64_t v11 = v66;
          [v7 end];
          *(_BYTE *)(v11 + 40) |= 2u;
          *(void *)(v11 + 16) = v12;
          uint64_t v13 = v66;
          [v7 valueOut];
          *(_BYTE *)(v13 + 40) |= 4u;
          *(void *)(v13 + 24) = v14;
          uint64_t v15 = v66;
          unsigned int v16 = [v7 state];
          *(_BYTE *)(v15 + 40) |= 0x10u;
          *(_DWORD *)(v15 + 36) = v16;
          if (qword_101934670 != -1) {
            dispatch_once(&qword_101934670, &stru_1018A3078);
          }
          char v17 = (os_log_s *)qword_101934678;
          if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v18 = *(void *)(v66 + 8);
            uint64_t v19 = *(void *)(v66 + 16);
            uint64_t v20 = *(void *)(v66 + 24);
            int v21 = *(_DWORD *)(v66 + 36);
            *(_DWORD *)buf = 134218752;
            uint64_t v82 = v18;
            __int16 v83 = 2048;
            uint64_t v84 = v19;
            __int16 v85 = 2048;
            uint64_t v86 = v20;
            __int16 v87 = 1024;
            int v88 = v21;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "CLWorkoutRecording: RawSpeedToKValue entry,begin,%f,end,%f,kValue,%f,state,%d",  buf,  0x26u);
          }

          if (sub_1002921D0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_101934670 != -1) {
              dispatch_once(&qword_101934670, &stru_1018A3078);
            }
            uint64_t v22 = *(void *)(v66 + 8);
            uint64_t v23 = *(void *)(v66 + 16);
            uint64_t v24 = *(void *)(v66 + 24);
            int v25 = *(_DWORD *)(v66 + 36);
            int v73 = 134218752;
            uint64_t v74 = v22;
            __int16 v75 = 2048;
            uint64_t v76 = v23;
            __int16 v77 = 2048;
            uint64_t v78 = v24;
            __int16 v79 = 1024;
            int v80 = v25;
            LODWORD(v54) = 38;
            _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  2LL,  "CLWorkoutRecording: RawSpeedToKValue entry,begin,%f,end,%f,kValue,%f,state,%d",  COERCE_DOUBLE(&v73),  v54,  v55,  (_DWORD)v56);
            uint64_t v27 = (uint8_t *)v26;
            sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWorkoutRecording writeStrideCalBins]", "%s\n", v26);
            if (v27 != buf) {
              free(v27);
            }
          }

          sub_10111D6A8((uint64_t)self->_writer.__ptr_, (uint64_t)v63);
          sub_101127D00((PB::Base *)v63);
          uint64_t v6 = (char *)v6 + 1;
        }

        while (v4 != v6);
        id v28 = [obj countByEnumeratingWithState:&v68 objects:v89 count:16];
        id v4 = v28;
      }

      while (v28);
    }

    id v57 = [v56 syncgetCopyStepCadenceToStrideLengthBins];
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    id v29 = [v57 countByEnumeratingWithState:&v59 objects:v72 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v60;
      do
      {
        uint64_t v31 = 0LL;
        do
        {
          if (*(void *)v60 != v30) {
            objc_enumerationMutation(v57);
          }
          id v32 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)v31);
          sub_101125260(v63);
          -[CLWorkoutRecording makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
          v67 |= 1u;
          uint64_t v64 = v33;
          sub_10113AFBC(v63);
          uint64_t v34 = v65;
          [v32 begin];
          *(_BYTE *)(v34 + 40) |= 1u;
          *(void *)(v34 + 8) = v35;
          uint64_t v36 = v65;
          [v32 end];
          *(_BYTE *)(v36 + 40) |= 2u;
          *(void *)(v36 + 16) = v37;
          uint64_t v38 = v65;
          [v32 valueOut];
          *(_BYTE *)(v38 + 40) |= 4u;
          *(void *)(v38 + 24) = v39;
          uint64_t v40 = v65;
          unsigned int v41 = [v32 state];
          *(_BYTE *)(v40 + 40) |= 0x10u;
          *(_DWORD *)(v40 + 36) = v41;
          if (qword_101934670 != -1) {
            dispatch_once(&qword_101934670, &stru_1018A3078);
          }
          uint64_t v42 = (os_log_s *)qword_101934678;
          if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v43 = *(void *)(v65 + 8);
            uint64_t v44 = *(void *)(v65 + 16);
            uint64_t v45 = *(void *)(v65 + 24);
            int v46 = *(_DWORD *)(v65 + 36);
            *(_DWORD *)buf = 134218752;
            uint64_t v82 = v43;
            __int16 v83 = 2048;
            uint64_t v84 = v44;
            __int16 v85 = 2048;
            uint64_t v86 = v45;
            __int16 v87 = 1024;
            int v88 = v46;
            _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEBUG,  "CLWorkoutRecording: StepCadenceToStrideLength entry,begin,%f,end,%f,strideLength,%f,state,%d",  buf,  0x26u);
          }

          if (sub_1002921D0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_101934670 != -1) {
              dispatch_once(&qword_101934670, &stru_1018A3078);
            }
            uint64_t v47 = *(void *)(v65 + 8);
            uint64_t v48 = *(void *)(v65 + 16);
            uint64_t v49 = *(void *)(v65 + 24);
            int v50 = *(_DWORD *)(v65 + 36);
            int v73 = 134218752;
            uint64_t v74 = v47;
            __int16 v75 = 2048;
            uint64_t v76 = v48;
            __int16 v77 = 2048;
            uint64_t v78 = v49;
            __int16 v79 = 1024;
            int v80 = v50;
            LODWORD(v54) = 38;
            _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  2LL,  "CLWorkoutRecording: StepCadenceToStrideLength entry,begin,%f,end,%f,strideLength,%f,state,%d",  COERCE_DOUBLE(&v73),  v54,  v55,  (_DWORD)v56);
            __int16 v52 = (uint8_t *)v51;
            sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWorkoutRecording writeStrideCalBins]", "%s\n", v51);
            if (v52 != buf) {
              free(v52);
            }
          }

          sub_10111D6A8((uint64_t)self->_writer.__ptr_, (uint64_t)v63);
          sub_101127D00((PB::Base *)v63);
          uint64_t v31 = (char *)v31 + 1;
        }

        while (v29 != v31);
        id v53 = [v57 countByEnumeratingWithState:&v59 objects:v72 count:16];
        id v29 = v53;
      }

      while (v53);
    }
  }

- (void)recordWeatherData:(id)a3
{
  if (a3 && !BYTE1(self->_fFileTimeInterval))
  {
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A3078);
    }
    uint64_t v5 = (os_log_s *)qword_101934678;
    if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEFAULT))
    {
      [a3 timestamp];
      uint64_t v7 = v6;
      [a3 weatherPressure];
      double v9 = v8;
      id v10 = objc_msgSend(objc_msgSend(a3, "precipitationType"), "UTF8String");
      [a3 temperature];
      double v12 = v11;
      [a3 feelsLikeTemperature];
      *(_DWORD *)buf = 134350082;
      uint64_t v38 = v7;
      __int16 v39 = 2048;
      double v40 = v9;
      __int16 v41 = 2080;
      id v42 = v10;
      __int16 v43 = 2048;
      double v44 = v12;
      __int16 v45 = 2048;
      double v46 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "WeatherDataUpdate,timestamp,%{public}f,weatherPressure,%f,precipitationType,%s,temperature,%f,feelsLikeTemperature,%f",  buf,  0x34u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A3078);
      }
      uint64_t v16 = qword_101934678;
      [a3 timestamp];
      uint64_t v18 = v17;
      [a3 weatherPressure];
      double v20 = v19;
      id v21 = objc_msgSend(objc_msgSend(a3, "precipitationType"), "UTF8String");
      [a3 temperature];
      double v23 = v22;
      [a3 feelsLikeTemperature];
      int v27 = 134350082;
      uint64_t v28 = v18;
      __int16 v29 = 2048;
      double v30 = v20;
      __int16 v31 = 2080;
      id v32 = v21;
      __int16 v33 = 2048;
      double v34 = v23;
      __int16 v35 = 2048;
      double v36 = v24;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v16,  0LL,  "WeatherDataUpdate,timestamp,%{public}f,weatherPressure,%f,precipitationType,%s,temperature,%f,feelsLikeTemperature,%f",  &v27,  52);
      id v26 = (uint8_t *)v25;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWorkoutRecording recordWeatherData:]", "%s\n", v25);
      if (v26 != buf) {
        free(v26);
      }
    }

    [a3 timestamp];
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_metadata,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"),  @"WeatherDataTimestamp");
    [a3 weatherPressure];
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_metadata,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"),  @"WeatherDataPressure");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_metadata,  "setObject:forKeyedSubscript:",  +[NSString stringWithUTF8String:]( NSString,  "stringWithUTF8String:",  objc_msgSend(objc_msgSend(a3, "precipitationType"), "UTF8String")),  @"WeatherDataPrecipitationType");
    [a3 temperature];
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_metadata,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", sub_100DEA6B0(v14)),  @"WeatherDataTemperature");
    [a3 feelsLikeTemperature];
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_metadata,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", sub_100DEA6B0(v15)),  @"WeatherDataFeelsLikeTemperature");
  }

- (double)makeSafeCFAbsoluteTime:(double)a3
{
  if (a3 == 0.0) {
    return 0.0;
  }
  else {
    return self->_privacyTimeOffset + a3;
  }
}

- (void)recordWorkoutEffort:(const Result *)a3
{
  if (qword_101934670 != -1) {
    dispatch_once(&qword_101934670, &stru_1018A3078);
  }
  uint64_t v5 = (os_log_s *)qword_101934678;
  if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)a3;
    uint64_t v7 = *((void *)a3 + 1);
    double v8 = *((float *)a3 + 4);
    double v9 = *((float *)a3 + 5);
    int v10 = *((unsigned __int8 *)a3 + 24);
    *(_DWORD *)buf = 134219008;
    uint64_t v32 = v6;
    __int16 v33 = 2048;
    uint64_t v34 = v7;
    __int16 v35 = 2048;
    double v36 = v8;
    __int16 v37 = 2048;
    double v38 = v9;
    __int16 v39 = 1024;
    int v40 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "WorkoutRecorder CM Effort, Writing estimated workout effort to workout recorder startTime,%f,endTime,%f,estimatedW orkoutEffort,%f,estimatedWorkoutEffortPreBiasCorrection,%f,isTransient,%d",  buf,  0x30u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A3078);
    }
    uint64_t v13 = *(void *)a3;
    uint64_t v14 = *((void *)a3 + 1);
    double v15 = *((float *)a3 + 4);
    double v16 = *((float *)a3 + 5);
    int v17 = *((unsigned __int8 *)a3 + 24);
    int v21 = 134219008;
    uint64_t v22 = v13;
    __int16 v23 = 2048;
    uint64_t v24 = v14;
    __int16 v25 = 2048;
    double v26 = v15;
    __int16 v27 = 2048;
    double v28 = v16;
    __int16 v29 = 1024;
    int v30 = v17;
    LODWORD(v20) = 48;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  2LL,  "WorkoutRecorder CM Effort, Writing estimated workout effort to workout recorder startTime,%f,endTime,%f,estimatedW orkoutEffort,%f,estimatedWorkoutEffortPreBiasCorrection,%f,isTransient,%d",  COERCE_DOUBLE(&v21),  v20);
    float v19 = (uint8_t *)v18;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWorkoutRecording recordWorkoutEffort:]", "%s\n", v18);
    if (v19 != buf) {
      free(v19);
    }
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_metadata,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)a3),  @"estimatedWorkoutEffortStartTime");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_metadata,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *((double *)a3 + 1)),  @"estimatedWorkoutEffortEndTime");
  LODWORD(v11) = *((_DWORD *)a3 + 4);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_metadata,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v11),  @"estimatedWorkoutEffort");
  LODWORD(v12) = *((_DWORD *)a3 + 5);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_metadata,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v12),  @"estimatedWorkoutEffortPreBiasCorrection");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_metadata,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *((unsigned __int8 *)a3 + 24)),  @"estimatedWorkoutEffortIsTransient");
}

- (void)deleteWorkingDirectory
{
  if (self->_workingDirectory)
  {
    uint64_t v5 = 0LL;
    -[NSFileManager removeItemAtURL:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtURL:error:",  self->_workingDirectory,  &v5);
    if (v5)
    {
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A3078);
      }
      v2 = (os_log_s *)qword_101934678;
      if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v9 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "Unable to delete recording working directory, error: %{public}@",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934670 != -1) {
          dispatch_once(&qword_101934670, &stru_1018A3078);
        }
        int v6 = 138543362;
        uint64_t v7 = v5;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  16LL,  "Unable to delete recording working directory, error: %{public}@",  &v6,  12);
        id v4 = (uint8_t *)v3;
        sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLWorkoutRecording deleteWorkingDirectory]", "%s\n", v3);
        if (v4 != buf) {
          free(v4);
        }
      }
    }
  }

- (CLDaemonLocation)getStartLocation
{
  $AB5116BA7E623E054F959CECB034F4E7 v3 = *($AB5116BA7E623E054F959CECB034F4E7 *)((char *)&self[1].speedAccuracy + 4);
  *(_OWORD *)&retstr->lifespan = *(_OWORD *)((char *)&self[1].verticalAccuracy + 4);
  retstr->$AB5116BA7E623E054F959CECB034F4E7 rawCoordinate = v3;
  *(_OWORD *)&retstr->rawCourse = *(_OWORD *)((char *)&self[1].courseAccuracy + 4);
  __int128 v4 = *(_OWORD *)(&self->fromSimulationController + 4);
  *(_OWORD *)&retstr->altitude = *(_OWORD *)(&self->signalEnvironmentType + 1);
  *(_OWORD *)&retstr->speed = v4;
  __int128 v5 = *(_OWORD *)((char *)&self[1].horizontalAccuracy + 4);
  *($AB5116BA7E623E054F959CECB034F4E7 *)&retstr->course = *($AB5116BA7E623E054F959CECB034F4E7 *)((char *)&self[1].coordinate
                                                                                               + 4);
  *(_OWORD *)&retstr->timestamp = v5;
  __int128 v6 = *(_OWORD *)&self->integrity;
  *(_OWORD *)&retstr->suitability = *(_OWORD *)((char *)&self->rawCoordinate.longitude + 4);
  *(_OWORD *)&retstr->coordinate.longitude = v6;
  *(_OWORD *)&retstr->integrity = *(_OWORD *)&self[1].confidence;
  return self;
}

- (void)setupModuleWriters
{
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  modulesDict = self->_modulesDict;
  id v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( modulesDict,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v4)
  {
    uint64_t v5 = *(void *)v17;
    do
    {
      for (uint64_t i = 0LL; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(modulesDict);
        }
        id v7 = -[NSMutableDictionary objectForKeyedSubscript:]( self->_modulesDict,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v16 + 1) + 8LL * (void)i),  ptr);
        cntrl = self->_writer.__cntrl_;
        ptr = self->_writer.__ptr_;
        double v15 = cntrl;
        if (cntrl)
        {
          uint64_t v9 = (unint64_t *)((char *)cntrl + 8);
          do
            unint64_t v10 = __ldxr(v9);
          while (__stxr(v10 + 1, v9));
        }

        [v7 setWriter:&ptr];
        double v11 = (std::__shared_weak_count *)v15;
        if (v15)
        {
          double v12 = (unint64_t *)((char *)v15 + 8);
          do
            unint64_t v13 = __ldaxr(v12);
          while (__stlxr(v13 - 1, v12));
          if (!v13)
          {
            ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
            std::__shared_weak_count::__release_weak(v11);
          }
        }
      }

      id v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( modulesDict,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL,  ptr);
    }

    while (v4);
  }

- (void)setMotionStateFunction:(id)a3
{
  uint64_t v5 = *(const void **)&self->_startLocation.floor;
  if (v5) {
    _Block_release(v5);
  }
  *(void *)&self->_startLocation.floor = _Block_copy(a3);
}

- (void)releaseBlocks
{
}

- (double)startTime
{
  return self->_startLocation.ellipsoidalAltitude;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0LL;
  *((void *)self + 6) = 0LL;
  *(_OWORD *)((char *)self + 88) = 0uLL;
  *((void *)self + 10) = 0LL;
  *((_DWORD *)self + 31) = 0xFFFF;
  *((void *)self + 16) = 0LL;
  *((void *)self + 17) = 0LL;
  __asm { FMOV            V1.2D, #-1.0 }

  *((_OWORD *)self + 9) = xmmword_1012E0070;
  *((_OWORD *)self + 10) = _Q1;
  *((_OWORD *)self + 11) = _Q1;
  *((_OWORD *)self + 12) = _Q1;
  *((_DWORD *)self + 52) = 0;
  *(void *)((char *)self + 212) = 0xBFF0000000000000LL;
  *(void *)((char *)self + 228) = 0LL;
  *(void *)((char *)self + 220) = 0LL;
  *((_DWORD *)self + 59) = 0;
  *((void *)self + 30) = 0xBFF0000000000000LL;
  *((_DWORD *)self + 62) = 0x7FFFFFFF;
  *(void *)((char *)self + 260) = 0LL;
  *((_BYTE *)self + 276) = 0;
  *(void *)((char *)self + 252) = 0LL;
  *(void *)((char *)self + 268) = 0LL;
  return self;
}

@end
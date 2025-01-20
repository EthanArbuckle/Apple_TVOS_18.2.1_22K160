@interface CLWorkoutModuleSettings
- (CLWorkoutModuleSettings)initWith:(void *)a3;
- (SettingStructure)getStructSetting:(SettingStructure *__return_ptr)retstr;
- (double)createPrivacyTimeOffset;
- (id).cxx_construct;
@end

@implementation CLWorkoutModuleSettings

- (CLWorkoutModuleSettings)initWith:(void *)a3
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___CLWorkoutModuleSettings;
  v4 = -[CLWorkoutModuleSettings init](&v17, "init");
  if (v4)
  {
    sub_101204164(v13, "WorkoutRecorderListenersAccelIntervalSeconds", &qword_1013E4D08, 0);
    v4->_settings.accelIntervalSeconds = *(double *)&v13[8];
    sub_1012049AC(v13, "WorkoutRecorderAveragedALSDisable", (unsigned __int8 *)&unk_1013E4D10, 0);
    v4->_settings.disableAveragedALS = v13[1];
    sub_1012049AC(v13, "WorkoutRecorderListenersBodyMetricsDisable", (unsigned __int8 *)&unk_1013E4D11, 0);
    v4->_settings.disableBodyMetrics = v13[1];
    v4->_settings.disableForceActiveListeners = sub_1012063B4(*(void *)a3);
    sub_1012049AC(v13, "WorkoutRecorderListenersHealthKitInfoDisable", (unsigned __int8 *)&unk_1013E4D12, 0);
    v4->_settings.disableHealthKitInfo = v13[1];
    v4->_settings.disableHeartRate = sub_101206354(*(void *)a3);
    sub_1012049AC(v13, "kWorkoutRecorderLatLongDisable", (unsigned __int8 *)&unk_1013E4D13, 0);
    v4->_settings.disableLatLong = v13[1];
    sub_1012049AC(v13, "kWorkoutRecorderMeanMaxMetsDisable", (unsigned __int8 *)&unk_1013E4D14, 0);
    v4->_settings.disableMeanMaxMets = v13[1];
    sub_1012049AC(v13, "WorkoutRecorderListenersWorkoutEventsDisable", (unsigned __int8 *)&unk_1013E4D15, 0);
    v4->_settings.disableMotionState = v13[1];
    sub_1012049AC(v13, "WorkoutRecorderListenersOdometerDisable", (unsigned __int8 *)&unk_1013E4D16, 0);
    v4->_settings.disableOdometer = v13[1];
    sub_1012049AC(v13, "WorkoutRecorderPressureDisable", (unsigned __int8 *)&unk_1013E4D17, 0);
    v4->_settings.disablePressure = v13[1];
    sub_1012049AC(v13, "WorkoutRecorderElevationOffsetDisable", (unsigned __int8 *)&unk_1013E4D18, 0);
    v4->_settings.disablePrivacyElevationOffset = v13[1];
    sub_1012049AC(v13, "kWorkoutRecorderStrideCalBinsDisable", (unsigned __int8 *)&unk_1013E4D19, 0);
    v4->_settings.disableStrideCalBins = v13[1];
    sub_1012049AC(v13, "WorkoutRecorderListenersWatchOrientation+Disable", (unsigned __int8 *)&unk_1013E4D1A, 0);
    v4->_settings.disableWatchOrientation = v13[1];
    sub_1012049AC(v13, "WorkoutRecorderListenersWatchOnWristStatusDisable", (unsigned __int8 *)&unk_1013E4D1B, 0);
    v4->_settings.disableWatchOnWristStatus = v13[1];
    sub_1012049AC(v13, "WorkoutRecorderWeatherDataDisable", (unsigned __int8 *)&unk_1013E4D1C, 0);
    v4->_settings.disableWeatherData = v13[1];
    sub_1012049AC(v13, "WorkoutRecorderWifiScanDisable", byte_1013E4D1D, 0);
    v4->_settings.disableWifiScans = v13[1];
    v11[0] = (void *)0x1000000;
    sub_10120AA44(v13, "WorkoutRecorderRecordingFileSizeMaxBytes", v11, 0);
    v4->_settings.recordingType.var0 = *(void *)&v13[8];
    sub_101206440((unsigned __int8 *)__p, "WorkoutRecorderRecordingFileSizeMaxSeconds", dword_1013E4D20, 0);
    v4->_settings.recordingType.__r_.var0 = HIDWORD(__p[0]);
    v4->_settings.kPrivacyPressureMaxOffset = 200.0;
    int v5 = sub_1004FD4D0();
    float v6 = 0.03125;
    if (v5) {
      float v6 = 0.0083333;
    }
    v4->_settings.kPressureUpdateInterval = v6;
    sub_101204164(v13, "kWorkoutRecorderMinimumPowerAssertionTimeSeconds", &qword_1013E4D28, 0);
    v4->_settings.minimumPowerAssertionTimeSeconds = *(double *)&v13[8];
    sub_101204164(v13, "kWorkoutRecorderListenersMagIntervalSeconds", &qword_1013E4D30, 0);
    v4->_settings.magIntervalSeconds = *(double *)&v13[8];
    -[CLWorkoutModuleSettings createPrivacyTimeOffset](v4, "createPrivacyTimeOffset");
    v4->_settings.privacyTimeOffset = v7;
    (*(void (**)(_BYTE *__return_ptr))(**(void **)a3 + 40LL))(v13);
    p_recordingType = (void **)&v4->_settings.recordingType;
    *(_OWORD *)p_recordingType = *(_OWORD *)v13;
    *((void *)&v4->_settings.recordingType.__r_.__value_.var0.var1 + 2) = *(void *)&v13[16];
    sub_101204164(v13, "WorkoutRecorderListenersRotationRateIntervalSeconds", &qword_1013E4D38, 0);
    v4->_settings.rotationRateIntervalSeconds = *(double *)&v13[8];
    *(_DWORD *)&v4->_settings.recordingType.__r_.var1 = 3000;
    v4->_settings.kCachedCompassCalibrationQuality = 0.28;
    v4[1].super.isa = (Class)@"CompassCalibration";
    v4[1]._moduleNames.__begin_ = (int *)0x40AC200000000000LL;
    sub_1010DDBC0(v11, "");
    sub_10120A1B0(v13, "WorkoutRecorderParticipantUUID", (__int128 *)v11, 1u);
    if (SHIBYTE(v14) < 0)
    {
      sub_1010DD48C(__p, *(void **)&v13[8], *(unint64_t *)&v13[16]);
    }

    else
    {
      *(_OWORD *)__p = *(_OWORD *)&v13[8];
      uint64_t v16 = v14;
    }

    if (v16 >= 0) {
      v9 = __p;
    }
    else {
      v9 = (void **)__p[0];
    }
    v4[1]._moduleNames.__end_cap_.__value_ = (int *)-[NSString copy]( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  v9),  "copy");
    if (SHIBYTE(v16) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v14) < 0) {
      operator delete(*(void **)&v13[8]);
    }
    if (v12 < 0) {
      operator delete(v11[0]);
    }
    sub_101204164(v13, "WorkoutRecorderHeadsetDMUpdateInterval", &qword_1013E4D40, 0);
    *(void *)&v4[1]._settings.disableAveragedALS = *(void *)&v13[8];
    sub_1012049AC(v13, "WorkoutRecorderHeadsetDMEnableLowLatency", byte_1013E4D48, 0);
    v4[1]._settings.disableOdometer = v13[1];
    LODWORD(__p[0]) = 1;
    sub_101206440(v13, "WorkoutRecorderHeadsetDMBufferSize", __p, 0);
    *(_DWORD *)&v4[1]._settings.disableWatchOrientation = *(_DWORD *)&v13[4];
  }

  return v4;
}

- (double)createPrivacyTimeOffset
{
  double v2 = v6;
  sub_101204164(v5, "WorkoutRecorderTimeIntervalOffsetMin", &qword_1013E4D58, 0);
  double v3 = v6;
  return v3 + (double)rand() / 2147483650.0 * (v2 - v3);
}

- (SettingStructure)getStructSetting:(SettingStructure *__return_ptr)retstr
{
  double v3 = v2;
  uint64_t v4 = v1;
  uuid_copy((unsigned __int8 *)(v1 + 112), v2);
  *(void *)(v4 + 184) = *((void *)v3 + 3);
  if (v3[16]) {
    *(_BYTE *)(v4 + 48) = 1;
  }
  __int128 v6 = *(_OWORD *)(v4 + 80);
  *(_OWORD *)&retstr->kPrivacyPressureMaxOffset = *(_OWORD *)(v4 + 64);
  *(_OWORD *)&retstr->privacyTimeOffset = v6;
  __int128 v7 = *(_OWORD *)(v4 + 112);
  *(_OWORD *)&retstr->minimumPowerAssertionTimeSeconds = *(_OWORD *)(v4 + 96);
  *(_OWORD *)retstr->workoutRecorderSessionId = v7;
  __int128 v8 = *(_OWORD *)(v4 + 48);
  *(_OWORD *)&retstr->disableAveragedALS = *(_OWORD *)(v4 + 32);
  *(_OWORD *)&retstr->hasSyncInWatch = v8;
  result = (SettingStructure *)&retstr->recordingType;
  if (*(char *)(v4 + 151) < 0)
  {
    result = (SettingStructure *)sub_1010DD48C(result, *(void **)(v4 + 128), *(void *)(v4 + 136));
  }

  else
  {
    *(_OWORD *)&result->disableAveragedALS = *(_OWORD *)(v4 + 128);
    *((void *)&retstr->recordingType.__r_.__value_.var0.var1 + 2) = *(void *)(v4 + 144);
  }

  *(_OWORD *)&retstr->recordingType.__r_.var0 = *(_OWORD *)(v4 + 152);
  *(_OWORD *)&retstr[1].disableAveragedALS = *(_OWORD *)(v4 + 168);
  *(_OWORD *)&retstr[1].hasSyncInWatch = *(_OWORD *)(v4 + 184);
  *(_OWORD *)&retstr[1].kPrivacyPressureMaxOffset = *(_OWORD *)(v4 + 200);
  return result;
}

- (void).cxx_destruct
{
  begin = self->_moduleNames.__begin_;
  if (begin)
  {
    self->_moduleNames.__end_ = begin;
    operator delete(begin);
  }

- (id).cxx_construct
{
  *((void *)self + 1) = 0LL;
  *((void *)self + 2) = 0LL;
  *((void *)self + 3) = 0LL;
  *(_OWORD *)((char *)self + 136) = 0uLL;
  *((void *)self + 16) = 0LL;
  return self;
}

@end
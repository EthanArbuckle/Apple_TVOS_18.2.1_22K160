@interface tm38dc1dadc08e0c016148f1ccdeb591ba
- (id)newBacklightComponentController:(__CFDictionary *)a3;
- (void)updateAllThermalLoad:(BOOL)a3;
- (void)updateCoreAnalyticsInfo;
@end

@implementation tm38dc1dadc08e0c016148f1ccdeb591ba

- (void)updateAllThermalLoad:(BOOL)a3
{
  int v4 = dword_10007CF64;
  int v5 = dword_10007CF6C;
  -[SensorDispatcherHelper getFloatValueFromSMCForKey:]( +[SensorDispatcherHelper sharedInstance](&OBJC_CLASS___SensorDispatcherHelper, "sharedInstance", a3),  "getFloatValueFromSMCForKey:",  @"TWFR");
  uint64_t v7 = (int)(float)(v6 * 100.0);
  -[SensorDispatcherHelper getFloatValueFromSMCForKey:]( +[SensorDispatcherHelper sharedInstance](&OBJC_CLASS___SensorDispatcherHelper, "sharedInstance"),  "getFloatValueFromSMCForKey:",  @"TPSD");
  uint64_t v9 = (int)(float)(v8 * 100.0);
  -[SensorDispatcherHelper getFloatValueFromSMCForKey:]( +[SensorDispatcherHelper sharedInstance](&OBJC_CLASS___SensorDispatcherHelper, "sharedInstance"),  "getFloatValueFromSMCForKey:",  @"PD4R");
  *(double *)&xmmword_10007D478 = v10;
  -[SensorDispatcherHelper getFloatValueFromSMCForKey:]( +[SensorDispatcherHelper sharedInstance](&OBJC_CLASS___SensorDispatcherHelper, "sharedInstance"),  "getFloatValueFromSMCForKey:",  @"PP0R");
  *((double *)&xmmword_10007D478 + 1) = v11;
  -[SensorDispatcherHelper getFloatValueFromSMCForKey:]( +[SensorDispatcherHelper sharedInstance](&OBJC_CLASS___SensorDispatcherHelper, "sharedInstance"),  "getFloatValueFromSMCForKey:",  @"PSTR");
  *(double *)&qword_10007D488 = v12;
  id v13 = -[CommonProduct findComponent:](self, "findComponent:", 18LL);
  double v14 = (double)-[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage") / 100.0;
  *(float *)&double v14 = v14;
  [v13 calculateControlEffort:v14];
  sub_100019974(13LL, v7);
  sub_100019974(15LL, v9);
  sub_100019974( 14LL,  (int)((double)v4 * 0.99 + 320.0 + *(double *)&qword_10007D488 * 0.09 + (double)(int)v9 * -0.22));
  float v15 = (float)dword_10007D090;
  id v16 = -[CommonProduct findComponent:](self, "findComponent:", 19LL);
  *(float *)&double v17 = v15 / 100.0;
  [v16 calculateControlEffort:v17];
  float v18 = (float)dword_10007D094;
  id v19 = -[CommonProduct findComponent:](self, "findComponent:", 20LL);
  *(float *)&double v20 = v18 / 100.0;
  [v19 calculateControlEffort:v20];
  id v21 = -[CommonProduct findComponent:](self, "findComponent:", 21LL);
  *(float *)&double v22 = (float)v5 / 100.0;
  [v21 calculateControlEffort:v22];
}

- (id)newBacklightComponentController:(__CFDictionary *)a3
{
  return -[BackLightCCSiriPlusButtonLED initWithParams:]( objc_alloc(&OBJC_CLASS___BackLightCCSiriPlusButtonLED),  "initWithParams:",  a3);
}

- (void)updateCoreAnalyticsInfo
{
  v2 = self;
  uint64_t v8 = *(void *)&dword_10007D090;
  unsigned int v3 = -[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage");
  LODWORD(v2) = -[CommonProduct thermalPressureLevel](v2, "thermalPressureLevel");
  uint64_t v7 = unk_10007CF68;
  -[SensorDispatcherHelper getFloatValueFromSMCForKey:]( +[SensorDispatcherHelper sharedInstance](&OBJC_CLASS___SensorDispatcherHelper, "sharedInstance"),  "getFloatValueFromSMCForKey:",  @"TPSD");
  int v5 = (int)(float)(v4 * 100.0);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000043A8;
  v9[3] = &unk_100060B90;
  *(void *)&__int128 v6 = v8;
  *((void *)&v6 + 1) = v7;
  __int128 v10 = v6;
  unsigned int v11 = v3;
  int v12 = (int)v2;
  int v13 = v5;
  float32x2_t v14 = vcvt_f32_f64((float64x2_t)xmmword_10007D478);
  AnalyticsSendEventLazy(@"com.apple.thermalmonitor", v9);
}

@end
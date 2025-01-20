@interface tm2e091879243eccfb8703f7e927c9e3e0
- (id)initProduct:(id)a3;
- (id)newBacklightComponentController:(__CFDictionary *)a3;
- (void)resetVTFilterState;
- (void)updateAllThermalLoad:(BOOL)a3;
- (void)updateCoreAnalyticsInfo;
@end

@implementation tm2e091879243eccfb8703f7e927c9e3e0

- (id)initProduct:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___tm2e091879243eccfb8703f7e927c9e3e0;
  id v3 = -[CommonProduct initProduct:](&v6, "initProduct:", a3);
  v4 = v3;
  if (v3) {
    [v3 resetVTFilterState];
  }
  return v4;
}

- (void)resetVTFilterState
{
  self->_filteredPUWu = -1.0;
}

- (void)updateAllThermalLoad:(BOOL)a3
{
  if (a3) {
    -[tm2e091879243eccfb8703f7e927c9e3e0 resetVTFilterState](self, "resetVTFilterState");
  }
  uint64_t v5 = dword_10007D0D4;
  int v4 = unk_10007D0D8;
  uint64_t v6 = dword_10007D0E0;
  int v7 = unk_10007D0E4;
  int v8 = dword_10007D0E8;
  int v9 = dword_10007D0EC;
  double filteredPUWu = self->_filteredPUWu;
  if (filteredPUWu >= 0.0) {
    double v11 = filteredPUWu + (*(double *)&qword_10007D4A0 - filteredPUWu) * 0.00826446246;
  }
  else {
    double v11 = *(double *)&qword_10007D4A0;
  }
  self->_double filteredPUWu = v11;
  sub_100019974(39LL, (int)((double)v4 * 1.02 + -35.79));
  sub_100019974(40LL, v5);
  sub_100019974(37LL, (int)((double)v8 * 0.88 + -182.0));
  sub_100019974( 41LL,  (int)((double)v7 * -1.495 + 117.35 + (double)v9 * 2.119 + self->_filteredPUWu * 0.195));
  sub_100019974(38LL, v6);
  id v12 = -[CommonProduct findComponent:](self, "findComponent:", 18LL);
  double v13 = (double)-[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage") / 100.0;
  *(float *)&double v13 = v13;
  [v12 calculateControlEffort:v13];
  float v14 = (float)dword_10007D0F8;
  id v15 = -[CommonProduct findComponent:](self, "findComponent:", 19LL);
  *(float *)&double v16 = v14 / 100.0;
  [v15 calculateControlEffort:v16];
  float v17 = (float)dword_10007D0FC;
  id v18 = -[CommonProduct findComponent:](self, "findComponent:", 20LL);
  *(float *)&double v19 = v17 / 100.0;
  [v18 calculateControlEffort:v19];
  float v20 = (float)dword_10007D0F0;
  id v21 = -[CommonProduct findComponent:](self, "findComponent:", 21LL);
  *(float *)&double v22 = v20 / 100.0;
  [v21 calculateControlEffort:v22];
  float v23 = (float)dword_10007D0F4;
  id v24 = -[CommonProduct findComponent:](self, "findComponent:", 22LL);
  *(float *)&double v25 = v23 / 100.0;
  [v24 calculateControlEffort:v25];
  float v26 = (float)dword_10007D0F0;
  id v27 = -[CommonProduct findComponent:](self, "findComponent:", 23LL);
  *(float *)&double v28 = v26 / 100.0;
  [v27 calculateControlEffort:v28];
}

- (void)updateCoreAnalyticsInfo
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000087F4;
  v3[3] = &unk_100060CF0;
  int v4 = dword_10007D0F8;
  int v5 = dword_10007D0D4;
  int32x2_t v6 = vrev64_s32(*(int32x2_t *)&dword_10007D0F0);
  int v7 = (int)*(double *)&qword_10007D488;
  int v8 = (int)*(double *)&qword_10007D498;
  int v9 = (int)*(double *)&qword_10007D4A8;
  int v10 = (int)unk_10007D490;
  int v11 = (int)(*(double *)&qword_10007D4C0 * 100.0);
  int v12 = dword_10007D070;
  int v13 = dword_10007D100;
  unsigned int v14 = -[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage");
  unsigned int v15 = -[CommonProduct dieTempMaxMax](self, "dieTempMaxMax");
  AnalyticsSendEventLazy(@"com.apple.thermalmonitor", v3);
}

- (id)newBacklightComponentController:(__CFDictionary *)a3
{
  return -[BackLightCCSiriPlusButtonLED initWithParams:]( objc_alloc(&OBJC_CLASS___BackLightCCSiriPlusButtonLED),  "initWithParams:",  a3);
}

@end
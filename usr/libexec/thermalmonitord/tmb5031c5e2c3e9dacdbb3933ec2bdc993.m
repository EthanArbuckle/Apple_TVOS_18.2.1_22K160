@interface tmb5031c5e2c3e9dacdbb3933ec2bdc993
- (id)newBacklightComponentController:(__CFDictionary *)a3;
- (void)updateAllThermalLoad:(BOOL)a3;
- (void)updateCoreAnalyticsInfo;
@end

@implementation tmb5031c5e2c3e9dacdbb3933ec2bdc993

- (void)updateAllThermalLoad:(BOOL)a3
{
  int v4 = dword_10007D05C[0];
  int v5 = unk_10007D060;
  int v6 = dword_10007D064;
  int v7 = dword_10007D068;
  int v8 = dword_10007D06C;
  id v9 = -[CommonProduct findComponent:](self, "findComponent:", 18LL);
  double v10 = (double)-[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage") / 100.0;
  *(float *)&double v10 = v10;
  [v9 calculateControlEffort:v10];
  sub_100019974( 13LL,  (int)((double)v4 * -1.45 + 858.0 + (double)v5 * 2.54 + (double)v6 * -0.29 + (double)v7 * -0.14));
  sub_100019974( 14LL,  (int)((double)v4 * 0.24 + 780.0 + (double)v5 * 0.94 + (double)v6 * -0.55 + (double)v7 * -0.11 + (double)v8 * 0.11));
  float v11 = (float)dword_10007D090;
  id v12 = -[CommonProduct findComponent:](self, "findComponent:", 19LL);
  *(float *)&double v13 = v11 / 100.0;
  [v12 calculateControlEffort:v13];
  float v14 = (float)dword_10007D06C;
  id v15 = -[CommonProduct findComponent:](self, "findComponent:", 20LL);
  *(float *)&double v16 = v14 / 100.0;
  [v15 calculateControlEffort:v16];
}

- (id)newBacklightComponentController:(__CFDictionary *)a3
{
  return -[BackLightCCSiriPlusButtonLED initWithParams:]( objc_alloc(&OBJC_CLASS___BackLightCCSiriPlusButtonLED),  "initWithParams:",  a3);
}

- (void)updateCoreAnalyticsInfo
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100024650;
  v3[3] = &unk_100061990;
  v3[4] = *(void *)&dword_10007D090;
  int v4 = dword_10007D08C;
  int v5 = (int)(*(double *)&xmmword_10007D478 * 1000.0);
  unsigned int v6 = -[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage");
  unsigned int v7 = -[CommonProduct thermalPressureLevel](self, "thermalPressureLevel");
  unsigned int v8 = 100 - objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 0), "releaseMaxLI");
  unsigned int v9 = 100 - objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 10), "releaseMaxLI");
  unsigned int v10 = 100 - objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 2), "releaseMaxLI");
  unsigned int v11 = 100 - objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 3), "releaseMaxLI");
  AnalyticsSendEventLazy(@"com.apple.thermalmonitor", v3);
}

@end
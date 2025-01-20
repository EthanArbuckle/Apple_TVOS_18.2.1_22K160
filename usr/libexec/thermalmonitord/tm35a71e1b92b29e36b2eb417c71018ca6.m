@interface tm35a71e1b92b29e36b2eb417c71018ca6
- (id)initProduct:(id)a3;
- (void)updateAllThermalLoad:(BOOL)a3;
- (void)updateCoreAnalyticsInfo;
@end

@implementation tm35a71e1b92b29e36b2eb417c71018ca6

- (id)initProduct:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___tm35a71e1b92b29e36b2eb417c71018ca6;
  return -[CommonProduct initProduct:](&v4, "initProduct:", a3);
}

- (void)updateAllThermalLoad:(BOOL)a3
{
  int v4 = dword_10007D068;
  id v5 = -[CommonProduct findComponent:](self, "findComponent:", 18LL);
  float v6 = (double)-[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage") / 100.0;
  double v7 = (double)-[CommonProduct dieTempFilteredMaxAverage](self, "dieTempFilteredMaxAverage") / 100.0;
  *(float *)&double v8 = v7;
  *(float *)&double v7 = v6;
  [v5 calculateControlEffort:v7 trigger:v8];
  sub_100019974(47LL, (int)((double)v4 * 0.76 + 610.62));
  float v9 = (float)dword_10007D118;
  id v10 = -[CommonProduct findComponent:](self, "findComponent:", 19LL);
  float v11 = v9 / 100.0;
  *(float *)&double v12 = v11;
  [v10 calculateControlEffort:v12];
  id v13 = -[CommonProduct findComponent:](self, "findComponent:", 20LL);
  *(float *)&double v14 = v11;
  [v13 calculateControlEffort:v14];
}

- (void)updateCoreAnalyticsInfo
{
  unsigned int v3 = -[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage");
  int v4 = dword_10007D4E8;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100017070;
  v5[3] = &unk_100061708;
  int v6 = dword_10007D118;
  int v7 = dword_10007D110;
  unsigned int v8 = v3;
  unsigned int v9 = -[CommonProduct dieTempMaxMax](self, "dieTempMaxMax");
  int v10 = v4;
  unsigned int v11 = -[CommonProduct thermalPressureLevel](self, "thermalPressureLevel");
  AnalyticsSendEventLazy(@"com.apple.thermalmonitor", v5);
}

@end
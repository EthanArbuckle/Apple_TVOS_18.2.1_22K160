@interface tm615510ed960594846913e03b9a1422aa
- (void)updateAllThermalLoad:(BOOL)a3;
@end

@implementation tm615510ed960594846913e03b9a1422aa

- (void)updateAllThermalLoad:(BOOL)a3
{
  id v4 = -[CommonProduct findComponent:](self, "findComponent:", 18LL);
  double v5 = (double)-[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage") / 100.0;
  *(float *)&double v5 = v5;
  [v4 calculateControlEffort:v5];
  sub_100019974(36LL, (int)((double)dword_10007D078 * 0.76 + 610.62));
  float v6 = (float)dword_10007D0EC;
  id v7 = -[CommonProduct findComponent:](self, "findComponent:", 19LL);
  float v8 = v6 / 100.0;
  *(float *)&double v9 = v8;
  [v7 calculateControlEffort:v9];
  id v10 = -[CommonProduct findComponent:](self, "findComponent:", 20LL);
  *(float *)&double v11 = v8;
  [v10 calculateControlEffort:v11];
  id v12 = -[CommonProduct findComponent:](self, "findComponent:", 21LL);
  *(float *)&double v13 = v8;
  [v12 calculateControlEffort:v13];
}

@end
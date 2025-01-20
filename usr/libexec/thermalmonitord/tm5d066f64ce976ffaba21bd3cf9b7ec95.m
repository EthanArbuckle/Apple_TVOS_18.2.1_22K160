@interface tm5d066f64ce976ffaba21bd3cf9b7ec95
- (void)updateAllThermalLoad:(BOOL)a3;
@end

@implementation tm5d066f64ce976ffaba21bd3cf9b7ec95

- (void)updateAllThermalLoad:(BOOL)a3
{
  float v4 = (double)dword_10007D06C * -2.19
     + -1377.36
     + (double)dword_10007D078 * -3.01
     + (double)dword_10007D080 * 7.46
     + (double)dword_10007D08C * -1.3;
  sub_100019C18(27LL, (int)v4, 0);
  int v5 = dword_10007D0C4;
  id v6 = -[CommonProduct findComponent:](self, "findComponent:", 18LL);
  double v7 = (double)v5 / 100.0;
  *(float *)&double v7 = v7;
  [v6 calculateControlEffort:v7];
}

@end
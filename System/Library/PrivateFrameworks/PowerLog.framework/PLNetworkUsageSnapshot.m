@interface PLNetworkUsageSnapshot
- (NSDate)timestamp;
- (NSString)cellType;
- (NSString)quality;
- (NSString)wifi;
- (PLNetworkUsageSnapshot)initWithInfo:(id)a3;
- (double)computeEnergyDiff:(id)a3;
- (double)computeEnergyDiffUntilNow:(BOOL)a3;
- (id)description;
- (void)setCellType:(id)a3;
- (void)setQuality:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setWifi:(id)a3;
- (void)snapshotNetworkState;
@end

@implementation PLNetworkUsageSnapshot

- (PLNetworkUsageSnapshot)initWithInfo:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PLNetworkUsageSnapshot;
  v5 = -[PLNetworkUsageSnapshot init](&v11, sel_init);
  if (v5)
  {
    [MEMORY[0x189603F50] date];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLNetworkUsageSnapshot setTimestamp:](v5, "setTimestamp:", v6);

    [v4 objectForKeyedSubscript:@"cell"];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLNetworkUsageSnapshot setCellType:](v5, "setCellType:", v7);

    [v4 objectForKeyedSubscript:@"quality"];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLNetworkUsageSnapshot setQuality:](v5, "setQuality:", v8);

    [v4 objectForKeyedSubscript:@"wifi"];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLNetworkUsageSnapshot setWifi:](v5, "setWifi:", v9);
  }

  return v5;
}

- (void)snapshotNetworkState
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PLNetworkUsageSnapshot setTimestamp:](self, "setTimestamp:", v3);
}

- (double)computeEnergyDiffUntilNow:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___PLNetworkUsageSnapshot);
  [MEMORY[0x189603F50] date];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLNetworkUsageSnapshot setTimestamp:](v5, "setTimestamp:", v6);
  v7 = -[PLNetworkUsageSnapshot cellType](self, "cellType");
  -[PLNetworkUsageSnapshot setCellType:](v5, "setCellType:", v7);
  v8 = -[PLNetworkUsageSnapshot quality](self, "quality");
  -[PLNetworkUsageSnapshot setQuality:](v5, "setQuality:", v8);
  v9 = -[PLNetworkUsageSnapshot wifi](self, "wifi");
  -[PLNetworkUsageSnapshot setWifi:](v5, "setWifi:", v9);

  -[PLNetworkUsageSnapshot computeEnergyDiff:](v5, "computeEnergyDiff:", self);
  double v11 = v10;
  if (v3)
  {
    PLLogDiscretionaryEnergyMonitor();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[PLNetworkUsageSnapshot computeEnergyDiffUntilNow:].cold.2();
    }

    -[PLNetworkUsageSnapshot snapshotNetworkState](self, "snapshotNetworkState");
    PLLogDiscretionaryEnergyMonitor();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[PLNetworkUsageSnapshot computeEnergyDiffUntilNow:].cold.1();
    }
  }

  return v11;
}

- (double)computeEnergyDiff:(id)a3
{
  id v4 = a3;
  PLLogDiscretionaryEnergyMonitor();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PLNetworkUsageSnapshot computeEnergyDiff:].cold.1();
  }
  v6 = -[PLNetworkUsageSnapshot timestamp](self, "timestamp");
  [v4 timestamp];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 timeIntervalSinceDate:v7];
  double v9 = v8;

  -[PLNetworkUsageSnapshot wifi](self, "wifi");
  double v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    double v11 = 15.3333333;
  }

  else
  {
    v12 = -[PLNetworkUsageSnapshot cellType](self, "cellType");
    char v13 = [v12 isEqualToString:@"5G"];

    if ((v13 & 1) != 0)
    {
      double v11 = 47.3333333;
    }

    else
    {
      v14 = -[PLNetworkUsageSnapshot cellType](self, "cellType");
      char v15 = [v14 isEqualToString:@"LTE"];

      if ((v15 & 1) != 0)
      {
        double v11 = 38.0;
      }

      else
      {
        v16 = -[PLNetworkUsageSnapshot cellType](self, "cellType");
        int v17 = [v16 isEqualToString:@"PreLTE"];

        double v11 = 0.0;
        if (v17) {
          double v11 = 30.0;
        }
      }
    }
  }

  double v18 = v9 / 3600.0 * v11;

  return v18;
}

- (id)description
{
  BOOL v3 = (void *)NSString;
  -[PLNetworkUsageSnapshot timestamp](self, "timestamp");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PLNetworkUsageSnapshot cellType](self, "cellType");
  v6 = -[PLNetworkUsageSnapshot quality](self, "quality");
  v7 = -[PLNetworkUsageSnapshot wifi](self, "wifi");
  [v3 stringWithFormat:@"timestamp=%@, cellType=%@, quality=%@, WiFi=%@", v4, v5, v6, v7];
  double v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setTimestamp:(id)a3
{
}

- (NSString)cellType
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setCellType:(id)a3
{
}

- (NSString)quality
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setQuality:(id)a3
{
}

- (NSString)wifi
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setWifi:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)computeEnergyDiffUntilNow:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_186654000, v0, v1, "after adjusting networkEnergySnapshot=%@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)computeEnergyDiffUntilNow:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_186654000, v0, v1, "adjusting networkEnergySnapshot=%@ to now", v2);
  OUTLINED_FUNCTION_1();
}

- (void)computeEnergyDiff:.cold.1()
{
  OUTLINED_FUNCTION_2(&dword_186654000, v0, v1, "computing network energy diff between self=%@ and otherSnapshot=%@");
  OUTLINED_FUNCTION_1();
}

@end
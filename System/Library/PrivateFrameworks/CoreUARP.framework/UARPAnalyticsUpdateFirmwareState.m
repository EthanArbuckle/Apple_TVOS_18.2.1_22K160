@interface UARPAnalyticsUpdateFirmwareState
- (BOOL)isEqual:(id)a3;
- (UARPAccessoryID)accessoryID;
- (UARPAnalyticsUpdateFirmwareState)initWithAccessoryID:(id)a3 assetID:(id)a4;
- (UARPAssetID)assetID;
- (UARPUpdateFirmwareAnalyticsEventFrameworkParams)eventParams;
- (id)description;
- (unint64_t)age;
- (void)accessoryUnreachable;
- (void)setState:(int64_t)a3;
- (void)stagingCompleteWithStatus:(unint64_t)a3;
- (void)stagingInterrupted;
- (void)stagingStartedWithUserIntent:(BOOL)a3;
- (void)updateStagingDuration;
@end

@implementation UARPAnalyticsUpdateFirmwareState

- (UARPAnalyticsUpdateFirmwareState)initWithAccessoryID:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___UARPAnalyticsUpdateFirmwareState;
  v8 = -[UARPAnalyticsUpdateFirmwareState init](&v18, sel_init);
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    accessoryID = v8->_accessoryID;
    v8->_accessoryID = (UARPAccessoryID *)v9;

    uint64_t v11 = [v7 copy];
    assetID = v8->_assetID;
    v8->_assetID = (UARPAssetID *)v11;

    uint64_t v13 = [MEMORY[0x189603F50] date];
    startDate = v8->_startDate;
    v8->_startDate = (NSDate *)v13;

    os_log_t v15 = os_log_create("com.apple.accessoryupdater.uarp", "analytics");
    log = v8->_log;
    v8->_log = v15;
  }

  return v8;
}

- (void)stagingStartedWithUserIntent:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    uint64_t v9 = "-[UARPAnalyticsUpdateFirmwareState stagingStartedWithUserIntent:]";
    __int16 v10 = 2112;
    uint64_t v11 = self;
    _os_log_impl(&dword_187DC0000, log, OS_LOG_TYPE_INFO, "%s: %@", (uint8_t *)&v8, 0x16u);
  }

  if ((self->_state | 2) == 2)
  {
    [MEMORY[0x189603F50] date];
    id v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    stagingDurationStart = self->_stagingDurationStart;
    self->_stagingDurationStart = v6;

    ++self->_stagingIterations;
    -[UARPAnalyticsUpdateFirmwareState setState:](self, "setState:", 1LL);
    self->_stagingUserInitiated = a3;
  }

  else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
  {
    -[UARPAnalyticsUpdateFirmwareState stagingStartedWithUserIntent:].cold.1();
  }

- (void)stagingInterrupted
{
}

- (void)stagingCompleteWithStatus:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    __int16 v10 = "-[UARPAnalyticsUpdateFirmwareState stagingCompleteWithStatus:]";
    __int16 v11 = 2112;
    uint64_t v12 = self;
    _os_log_impl(&dword_187DC0000, log, OS_LOG_TYPE_INFO, "%s: %@", (uint8_t *)&v9, 0x16u);
  }

  if (self->_state == 1)
  {
    -[UARPAnalyticsUpdateFirmwareState setState:](self, "setState:", 3LL);
    -[UARPAnalyticsUpdateFirmwareState updateStagingDuration](self, "updateStagingDuration");
    if (a3 > 8) {
      uint64_t v6 = 8LL;
    }
    else {
      uint64_t v6 = qword_187E43E38[a3];
    }
    [MEMORY[0x189607968] numberWithInteger:v6];
    id v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    stagingStatus = self->_stagingStatus;
    self->_stagingStatus = v7;
  }

  else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
  {
    -[UARPAnalyticsUpdateFirmwareState stagingCompleteWithStatus:].cold.1();
  }

- (void)updateStagingDuration
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 timeIntervalSinceDate:self->_stagingDurationStart];
  double v5 = v4;

  stagingDurationStart = self->_stagingDurationStart;
  self->_stagingDurationSeconds += (unint64_t)v5;
  self->_stagingDurationStart = 0LL;
}

- (void)accessoryUnreachable
{
  if (self->_state == 1) {
    -[UARPAnalyticsUpdateFirmwareState stagingInterrupted](self, "stagingInterrupted");
  }
}

- (void)setState:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  unint64_t state = self->_state;
  if (state > 3) {
    uint64_t v6 = "unrecognized";
  }
  else {
    uint64_t v6 = off_18A142478[state];
  }
  else {
    id v7 = off_18A142478[a3];
  }
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412802;
    __int16 v10 = self;
    __int16 v11 = 2080;
    uint64_t v12 = v6;
    __int16 v13 = 2080;
    v14 = v7;
    _os_log_impl(&dword_187DC0000, log, OS_LOG_TYPE_INFO, "%@ state change: %s -> %s", (uint8_t *)&v9, 0x20u);
  }

  self->_unint64_t state = a3;
}

- (unint64_t)age
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 timeIntervalSinceDate:self->_startDate];
  unint64_t v5 = (unint64_t)v4;

  return v5;
}

- (UARPUpdateFirmwareAnalyticsEventFrameworkParams)eventParams
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___UARPUpdateFirmwareAnalyticsEventFrameworkParams);
  [MEMORY[0x189607968] numberWithBool:self->_stagingUserInitiated];
  double v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPUpdateFirmwareAnalyticsEventFrameworkParams setStagingUserInitiated:](v3, "setStagingUserInitiated:", v4);

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_stagingDurationSeconds];
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPUpdateFirmwareAnalyticsEventFrameworkParams setStagingDuration:](v3, "setStagingDuration:", v5);

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_stagingIterations];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPUpdateFirmwareAnalyticsEventFrameworkParams setStagingIterations:](v3, "setStagingIterations:", v6);

  -[UARPUpdateFirmwareAnalyticsEventFrameworkParams setStagingStatus:](v3, "setStagingStatus:", self->_stagingStatus);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (UARPAnalyticsUpdateFirmwareState *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self == v4)
    {
      char v10 = 1;
    }

    else
    {
      unint64_t v5 = v4;
      accessoryID = self->_accessoryID;
      -[UARPAnalyticsUpdateFirmwareState accessoryID](v5, "accessoryID");
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[UARPAccessoryID isEqual:](accessoryID, "isEqual:", v7))
      {
        assetID = self->_assetID;
        -[UARPAnalyticsUpdateFirmwareState assetID](v5, "assetID");
        int v9 = (void *)objc_claimAutoreleasedReturnValue();
        char v10 = -[UARPAssetID isEqual:](assetID, "isEqual:", v9);
      }

      else
      {
        char v10 = 0;
      }
    }
  }

  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)description
{
  uint64_t v3 = (void *)NSString;
  double v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPAccessoryID manufacturer](self->_accessoryID, "manufacturer");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPAccessoryID modelName](self->_accessoryID, "modelName");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPAccessoryID serialNumber](self->_accessoryID, "serialNumber");
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPAccessoryID firmwareVersion](self->_accessoryID, "firmwareVersion");
  int v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPAssetID assetVersion](self->_assetID, "assetVersion");
  char v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@: %@ %@ [%@] %@ -> %@>", v5, v6, v7, v8, v9, v10];
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (UARPAccessoryID)accessoryID
{
  return (UARPAccessoryID *)objc_getProperty(self, a2, 104LL, 1);
}

- (UARPAssetID)assetID
{
  return (UARPAssetID *)objc_getProperty(self, a2, 112LL, 1);
}

- (void).cxx_destruct
{
}

- (void)stagingStartedWithUserIntent:.cold.1()
{
}

- (void)stagingCompleteWithStatus:.cold.1()
{
}

@end
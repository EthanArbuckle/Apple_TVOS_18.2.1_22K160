@interface MADAutoSetPolicy
+ (BOOL)supportsSecureCoding;
- (BOOL)allowCheckDownloadOnBattery;
- (BOOL)allowCheckDownloadOverCellular;
- (BOOL)allowCheckDownloadOverExpensive;
- (BOOL)allowCheckDownloadWhenBatteryLow;
- (BOOL)allowCheckDownloadWhenCPUHigh;
- (BOOL)blockCheckDownload;
- (BOOL)isEqual:(id)a3;
- (BOOL)lockInhibitsEmergencyRemoval;
- (BOOL)userInitiated;
- (MADAutoSetPolicy)init;
- (MADAutoSetPolicy)initWithCoder:(id)a3;
- (id)copy;
- (id)initFromAutoAssetSetPolicy:(id)a3;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowCheckDownloadOnBattery:(BOOL)a3;
- (void)setAllowCheckDownloadOverCellular:(BOOL)a3;
- (void)setAllowCheckDownloadOverExpensive:(BOOL)a3;
- (void)setAllowCheckDownloadWhenBatteryLow:(BOOL)a3;
- (void)setAllowCheckDownloadWhenCPUHigh:(BOOL)a3;
- (void)setBlockCheckDownload:(BOOL)a3;
- (void)setLockInhibitsEmergencyRemoval:(BOOL)a3;
- (void)setUserInitiated:(BOOL)a3;
@end

@implementation MADAutoSetPolicy

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (BOOL)lockInhibitsEmergencyRemoval
{
  return self->_lockInhibitsEmergencyRemoval;
}

- (BOOL)allowCheckDownloadOnBattery
{
  return self->_allowCheckDownloadOnBattery;
}

- (BOOL)allowCheckDownloadWhenBatteryLow
{
  return self->_allowCheckDownloadWhenBatteryLow;
}

- (BOOL)allowCheckDownloadWhenCPUHigh
{
  return self->_allowCheckDownloadWhenCPUHigh;
}

- (BOOL)allowCheckDownloadOverExpensive
{
  return self->_allowCheckDownloadOverExpensive;
}

- (BOOL)allowCheckDownloadOverCellular
{
  return self->_allowCheckDownloadOverCellular;
}

- (BOOL)blockCheckDownload
{
  return self->_blockCheckDownload;
}

- (MADAutoSetPolicy)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MADAutoSetPolicy;
  result = -[MADAutoSetPolicy init](&v3, "init");
  if (result) {
    *(void *)&result->_userInitiated = 0LL;
  }
  return result;
}

- (id)initFromAutoAssetSetPolicy:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MADAutoSetPolicy;
  v5 = -[MADAutoSetPolicy init](&v7, "init");
  if (v5)
  {
    v5->_userInitiated = [v4 userInitiated];
    v5->_lockInhibitsEmergencyRemoval = [v4 lockInhibitsEmergencyRemoval];
    v5->_allowCheckDownloadOnBattery = [v4 allowCheckDownloadOnBattery];
    v5->_allowCheckDownloadWhenBatteryLow = [v4 allowCheckDownloadWhenBatteryLow];
    v5->_allowCheckDownloadWhenCPUHigh = [v4 allowCheckDownloadWhenCPUHigh];
    v5->_allowCheckDownloadOverExpensive = [v4 allowCheckDownloadOverExpensive];
    v5->_allowCheckDownloadOverCellular = [v4 allowCheckDownloadOverCellular];
    v5->_blockCheckDownload = [v4 blockCheckDownload];
  }

  return v5;
}

- (MADAutoSetPolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MADAutoSetPolicy;
  v5 = -[MADAutoSetPolicy init](&v7, "init");
  if (v5)
  {
    v5->_userInitiated = [v4 decodeBoolForKey:@"userInitiated"];
    v5->_lockInhibitsEmergencyRemoval = [v4 decodeBoolForKey:@"lockInhibitsEmergencyRemoval"];
    v5->_allowCheckDownloadOnBattery = [v4 decodeBoolForKey:@"allowCheckDownloadOnBattery"];
    v5->_allowCheckDownloadWhenBatteryLow = [v4 decodeBoolForKey:@"allowCheckDownloadWhenBatteryLow"];
    v5->_allowCheckDownloadWhenCPUHigh = [v4 decodeBoolForKey:@"allowCheckDownloadWhenCPUHigh"];
    v5->_allowCheckDownloadOverExpensive = [v4 decodeBoolForKey:@"allowCheckDownloadOverExpensive"];
    v5->_allowCheckDownloadOverCellular = [v4 decodeBoolForKey:@"allowCheckDownloadOverCellular"];
    v5->_blockCheckDownload = [v4 decodeBoolForKey:@"blockCheckDownload"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MADAutoSetPolicy userInitiated](self, "userInitiated"),  @"userInitiated");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MADAutoSetPolicy lockInhibitsEmergencyRemoval](self, "lockInhibitsEmergencyRemoval"),  @"lockInhibitsEmergencyRemoval");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MADAutoSetPolicy allowCheckDownloadOnBattery](self, "allowCheckDownloadOnBattery"),  @"allowCheckDownloadOnBattery");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MADAutoSetPolicy allowCheckDownloadWhenBatteryLow](self, "allowCheckDownloadWhenBatteryLow"),  @"allowCheckDownloadWhenBatteryLow");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MADAutoSetPolicy allowCheckDownloadWhenCPUHigh](self, "allowCheckDownloadWhenCPUHigh"),  @"allowCheckDownloadWhenCPUHigh");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MADAutoSetPolicy allowCheckDownloadOverExpensive](self, "allowCheckDownloadOverExpensive"),  @"allowCheckDownloadOverExpensive");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MADAutoSetPolicy allowCheckDownloadOverCellular](self, "allowCheckDownloadOverCellular"),  @"allowCheckDownloadOverCellular");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MADAutoSetPolicy blockCheckDownload](self, "blockCheckDownload"),  @"blockCheckDownload");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___MADAutoSetPolicy);
  -[MADAutoSetPolicy setUserInitiated:]( v3,  "setUserInitiated:",  -[MADAutoSetPolicy userInitiated](self, "userInitiated"));
  -[MADAutoSetPolicy setLockInhibitsEmergencyRemoval:]( v3,  "setLockInhibitsEmergencyRemoval:",  -[MADAutoSetPolicy lockInhibitsEmergencyRemoval](self, "lockInhibitsEmergencyRemoval"));
  -[MADAutoSetPolicy setAllowCheckDownloadOnBattery:]( v3,  "setAllowCheckDownloadOnBattery:",  -[MADAutoSetPolicy allowCheckDownloadOnBattery](self, "allowCheckDownloadOnBattery"));
  -[MADAutoSetPolicy setAllowCheckDownloadWhenBatteryLow:]( v3,  "setAllowCheckDownloadWhenBatteryLow:",  -[MADAutoSetPolicy allowCheckDownloadWhenBatteryLow](self, "allowCheckDownloadWhenBatteryLow"));
  -[MADAutoSetPolicy setAllowCheckDownloadWhenCPUHigh:]( v3,  "setAllowCheckDownloadWhenCPUHigh:",  -[MADAutoSetPolicy allowCheckDownloadWhenCPUHigh](self, "allowCheckDownloadWhenCPUHigh"));
  -[MADAutoSetPolicy setAllowCheckDownloadOverExpensive:]( v3,  "setAllowCheckDownloadOverExpensive:",  -[MADAutoSetPolicy allowCheckDownloadOverExpensive](self, "allowCheckDownloadOverExpensive"));
  -[MADAutoSetPolicy setAllowCheckDownloadOverCellular:]( v3,  "setAllowCheckDownloadOverCellular:",  -[MADAutoSetPolicy allowCheckDownloadOverCellular](self, "allowCheckDownloadOverCellular"));
  -[MADAutoSetPolicy setBlockCheckDownload:]( v3,  "setBlockCheckDownload:",  -[MADAutoSetPolicy blockCheckDownload](self, "blockCheckDownload"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MADAutoSetPolicy *)a3;
  if (v4 == self)
  {
    LOBYTE(v14) = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___MADAutoSetPolicy);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      unsigned int v7 = -[MADAutoSetPolicy userInitiated](v6, "userInitiated");
      if (v7 == -[MADAutoSetPolicy userInitiated](self, "userInitiated")
        && (unsigned int v8 = -[MADAutoSetPolicy lockInhibitsEmergencyRemoval](v6, "lockInhibitsEmergencyRemoval"),
            v8 == -[MADAutoSetPolicy lockInhibitsEmergencyRemoval](self, "lockInhibitsEmergencyRemoval"))
        && (unsigned int v9 = -[MADAutoSetPolicy allowCheckDownloadOnBattery](v6, "allowCheckDownloadOnBattery"),
            v9 == -[MADAutoSetPolicy allowCheckDownloadOnBattery](self, "allowCheckDownloadOnBattery"))
        && (unsigned int v10 = -[MADAutoSetPolicy allowCheckDownloadWhenBatteryLow](v6, "allowCheckDownloadWhenBatteryLow"),
            v10 == -[MADAutoSetPolicy allowCheckDownloadWhenBatteryLow](self, "allowCheckDownloadWhenBatteryLow"))
        && (unsigned int v11 = -[MADAutoSetPolicy allowCheckDownloadWhenCPUHigh](v6, "allowCheckDownloadWhenCPUHigh"),
            v11 == -[MADAutoSetPolicy allowCheckDownloadWhenCPUHigh](self, "allowCheckDownloadWhenCPUHigh"))
        && (unsigned int v12 = -[MADAutoSetPolicy allowCheckDownloadOverExpensive](v6, "allowCheckDownloadOverExpensive"),
            v12 == -[MADAutoSetPolicy allowCheckDownloadOverExpensive](self, "allowCheckDownloadOverExpensive"))
        && (unsigned int v13 = -[MADAutoSetPolicy allowCheckDownloadOverCellular](v6, "allowCheckDownloadOverCellular"),
            v13 == -[MADAutoSetPolicy allowCheckDownloadOverCellular](self, "allowCheckDownloadOverCellular")))
      {
        unsigned int v16 = -[MADAutoSetPolicy blockCheckDownload](v6, "blockCheckDownload");
        unsigned int v14 = v16 ^ -[MADAutoSetPolicy blockCheckDownload](self, "blockCheckDownload") ^ 1;
      }

      else
      {
        LOBYTE(v14) = 0;
      }
    }

    else
    {
      LOBYTE(v14) = 0;
    }
  }

  return v14;
}

- (id)summary
{
  if (-[MADAutoSetPolicy lockInhibitsEmergencyRemoval](self, "lockInhibitsEmergencyRemoval")
    && -[MADAutoSetPolicy allowCheckDownloadOnBattery](self, "allowCheckDownloadOnBattery")
    && -[MADAutoSetPolicy allowCheckDownloadWhenBatteryLow](self, "allowCheckDownloadWhenBatteryLow")
    && -[MADAutoSetPolicy allowCheckDownloadWhenCPUHigh](self, "allowCheckDownloadWhenCPUHigh")
    && -[MADAutoSetPolicy allowCheckDownloadOverExpensive](self, "allowCheckDownloadOverExpensive")
    && -[MADAutoSetPolicy allowCheckDownloadOverCellular](self, "allowCheckDownloadOverCellular")
    && -[MADAutoSetPolicy blockCheckDownload](self, "blockCheckDownload"))
  {
    objc_super v3 = @"allOtherBool:Y";
  }

  else if (-[MADAutoSetPolicy lockInhibitsEmergencyRemoval](self, "lockInhibitsEmergencyRemoval") {
         || -[MADAutoSetPolicy allowCheckDownloadOnBattery](self, "allowCheckDownloadOnBattery")
  }
         || -[MADAutoSetPolicy allowCheckDownloadWhenBatteryLow](self, "allowCheckDownloadWhenBatteryLow")
         || -[MADAutoSetPolicy allowCheckDownloadWhenCPUHigh](self, "allowCheckDownloadWhenCPUHigh")
         || -[MADAutoSetPolicy allowCheckDownloadOverExpensive](self, "allowCheckDownloadOverExpensive")
         || -[MADAutoSetPolicy allowCheckDownloadOverCellular](self, "allowCheckDownloadOverCellular")
         || -[MADAutoSetPolicy blockCheckDownload](self, "blockCheckDownload"))
  {
    unsigned int v14 = objc_alloc(&OBJC_CLASS___NSString);
    if (-[MADAutoSetPolicy lockInhibitsEmergencyRemoval](self, "lockInhibitsEmergencyRemoval")) {
      id v4 = @"Y";
    }
    else {
      id v4 = @"N";
    }
    if (-[MADAutoSetPolicy allowCheckDownloadOnBattery](self, "allowCheckDownloadOnBattery")) {
      uint64_t v5 = @"Y";
    }
    else {
      uint64_t v5 = @"N";
    }
    if (-[MADAutoSetPolicy allowCheckDownloadWhenBatteryLow](self, "allowCheckDownloadWhenBatteryLow")) {
      v6 = @"Y";
    }
    else {
      v6 = @"N";
    }
    if (-[MADAutoSetPolicy allowCheckDownloadWhenCPUHigh](self, "allowCheckDownloadWhenCPUHigh")) {
      unsigned int v7 = @"Y";
    }
    else {
      unsigned int v7 = @"N";
    }
    if (-[MADAutoSetPolicy allowCheckDownloadOverExpensive](self, "allowCheckDownloadOverExpensive")) {
      unsigned int v8 = @"Y";
    }
    else {
      unsigned int v8 = @"N";
    }
    if (-[MADAutoSetPolicy allowCheckDownloadOverCellular](self, "allowCheckDownloadOverCellular")) {
      unsigned int v9 = @"Y";
    }
    else {
      unsigned int v9 = @"N";
    }
    if (-[MADAutoSetPolicy blockCheckDownload](self, "blockCheckDownload")) {
      unsigned int v10 = @"Y";
    }
    else {
      unsigned int v10 = @"N";
    }
    objc_super v3 = -[NSString initWithFormat:]( v14,  "initWithFormat:",  @"|lockInhibitsRemoval:%@|allowCheckDownload(OnBattery:%@,WhenBatteryLow:%@,WhenCPUHigh:%@,OverExpensive:%@,OverCellular:%@)|blockCheckDownload:%@",  v4,  v5,  v6,  v7,  v8,  v9,  v10);
  }

  else
  {
    objc_super v3 = @"allOtherBool:N";
  }

  if (-[MADAutoSetPolicy userInitiated](self, "userInitiated")) {
    unsigned int v11 = @"Y";
  }
  else {
    unsigned int v11 = @"N";
  }
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"user:%@|%@",  v11,  v3));

  return v12;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (void)setLockInhibitsEmergencyRemoval:(BOOL)a3
{
  self->_lockInhibitsEmergencyRemoval = a3;
}

- (void)setAllowCheckDownloadOnBattery:(BOOL)a3
{
  self->_allowCheckDownloadOnBattery = a3;
}

- (void)setAllowCheckDownloadWhenBatteryLow:(BOOL)a3
{
  self->_allowCheckDownloadWhenBatteryLow = a3;
}

- (void)setAllowCheckDownloadWhenCPUHigh:(BOOL)a3
{
  self->_allowCheckDownloadWhenCPUHigh = a3;
}

- (void)setAllowCheckDownloadOverExpensive:(BOOL)a3
{
  self->_allowCheckDownloadOverExpensive = a3;
}

- (void)setAllowCheckDownloadOverCellular:(BOOL)a3
{
  self->_allowCheckDownloadOverCellular = a3;
}

- (void)setBlockCheckDownload:(BOOL)a3
{
  self->_blockCheckDownload = a3;
}

@end
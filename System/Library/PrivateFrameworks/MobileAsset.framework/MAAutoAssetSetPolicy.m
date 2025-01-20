@interface MAAutoAssetSetPolicy
+ (BOOL)supportsSecureCoding;
- (BOOL)allowCheckDownloadOnBattery;
- (BOOL)allowCheckDownloadOverCellular;
- (BOOL)allowCheckDownloadOverExpensive;
- (BOOL)allowCheckDownloadWhenBatteryLow;
- (BOOL)allowCheckDownloadWhenCPUHigh;
- (BOOL)blockCheckDownload;
- (BOOL)blockCheckDownloadWhenRecentUserActivity;
- (BOOL)lockInhibitsEmergencyRemoval;
- (BOOL)preferCheckDownloadOverWiFi;
- (BOOL)restrictCheckDownloadToNetwork;
- (BOOL)supportingShortTermLocks;
- (BOOL)userInitiated;
- (MAAutoAssetSetPolicy)init;
- (MAAutoAssetSetPolicy)initWithCoder:(id)a3;
- (NSDictionary)additionalPolicyControl;
- (id)description;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalPolicyControl:(id)a3;
- (void)setAllowCheckDownloadOnBattery:(BOOL)a3;
- (void)setAllowCheckDownloadOverCellular:(BOOL)a3;
- (void)setAllowCheckDownloadOverExpensive:(BOOL)a3;
- (void)setAllowCheckDownloadWhenBatteryLow:(BOOL)a3;
- (void)setAllowCheckDownloadWhenCPUHigh:(BOOL)a3;
- (void)setBlockCheckDownload:(BOOL)a3;
- (void)setBlockCheckDownloadWhenRecentUserActivity:(BOOL)a3;
- (void)setLockInhibitsEmergencyRemoval:(BOOL)a3;
- (void)setPreferCheckDownloadOverWiFi:(BOOL)a3;
- (void)setRestrictCheckDownloadToNetwork:(BOOL)a3;
- (void)setSupportingShortTermLocks:(BOOL)a3;
- (void)setUserInitiated:(BOOL)a3;
@end

@implementation MAAutoAssetSetPolicy

- (MAAutoAssetSetPolicy)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MAAutoAssetSetPolicy;
  v2 = -[MAAutoAssetSetPolicy init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_blockCheckDownload = 0;
    *(void *)&v2->_userInitiated = 0LL;
    additionalPolicyControl = v2->_additionalPolicyControl;
    v2->_additionalPolicyControl = 0LL;
  }

  return v3;
}

- (MAAutoAssetSetPolicy)initWithCoder:(id)a3
{
  v13[8] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MAAutoAssetSetPolicy;
  v5 = -[MAAutoAssetSetPolicy init](&v12, sel_init);
  if (v5)
  {
    v5->_userInitiated = [v4 decodeBoolForKey:@"userInitiated"];
    v5->_lockInhibitsEmergencyRemoval = [v4 decodeBoolForKey:@"lockInhibitsEmergencyRemoval"];
    v5->_supportingShortTermLocks = [v4 decodeBoolForKey:@"supportingShortTermLocks"];
    v5->_allowCheckDownloadOnBattery = [v4 decodeBoolForKey:@"allowCheckDownloadOnBattery"];
    v5->_allowCheckDownloadWhenBatteryLow = [v4 decodeBoolForKey:@"allowCheckDownloadWhenBatteryLow"];
    v5->_allowCheckDownloadWhenCPUHigh = [v4 decodeBoolForKey:@"allowCheckDownloadWhenCPUHigh"];
    v5->_allowCheckDownloadOverExpensive = [v4 decodeBoolForKey:@"allowCheckDownloadOverExpensive"];
    v5->_allowCheckDownloadOverCellular = [v4 decodeBoolForKey:@"allowCheckDownloadOverCellular"];
    v5->_blockCheckDownload = [v4 decodeBoolForKey:@"blockCheckDownload"];
    objc_super v6 = (void *)MEMORY[0x189604010];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v13[2] = objc_opt_class();
    v13[3] = objc_opt_class();
    v13[4] = objc_opt_class();
    v13[5] = objc_opt_class();
    v13[6] = objc_opt_class();
    v13[7] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v13 count:8];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setWithArray:v7];
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"additionalPolicyControl"];
    additionalPolicyControl = v5->_additionalPolicyControl;
    v5->_additionalPolicyControl = (NSDictionary *)v9;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MAAutoAssetSetPolicy userInitiated](self, "userInitiated"),  @"userInitiated");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MAAutoAssetSetPolicy lockInhibitsEmergencyRemoval](self, "lockInhibitsEmergencyRemoval"),  @"lockInhibitsEmergencyRemoval");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MAAutoAssetSetPolicy supportingShortTermLocks](self, "supportingShortTermLocks"),  @"supportingShortTermLocks");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MAAutoAssetSetPolicy allowCheckDownloadOnBattery](self, "allowCheckDownloadOnBattery"),  @"allowCheckDownloadOnBattery");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MAAutoAssetSetPolicy allowCheckDownloadWhenBatteryLow](self, "allowCheckDownloadWhenBatteryLow"),  @"allowCheckDownloadWhenBatteryLow");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MAAutoAssetSetPolicy allowCheckDownloadWhenCPUHigh](self, "allowCheckDownloadWhenCPUHigh"),  @"allowCheckDownloadWhenCPUHigh");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MAAutoAssetSetPolicy allowCheckDownloadOverExpensive](self, "allowCheckDownloadOverExpensive"),  @"allowCheckDownloadOverExpensive");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MAAutoAssetSetPolicy allowCheckDownloadOverCellular](self, "allowCheckDownloadOverCellular"),  @"allowCheckDownloadOverCellular");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MAAutoAssetSetPolicy blockCheckDownload](self, "blockCheckDownload"),  @"blockCheckDownload");
  -[MAAutoAssetSetPolicy additionalPolicyControl](self, "additionalPolicyControl");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"additionalPolicyControl"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    id v4 = (void *)NSString;
    -[MAAutoAssetSetPolicy summary](self, "summary");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAAutoAssetSetPolicy additionalPolicyControl](self, "additionalPolicyControl");
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 description];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 stringWithFormat:@"%@|additional:\n%@", v5, v7];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v8 = -[MAAutoAssetSetPolicy summary](self, "summary");
  }

  return v8;
}

- (id)summary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = @"(w/additional)";
  if (!v3) {
    id v4 = &stru_189FFC530;
  }
  id v5 = v4;

  objc_super v6 = @"N";
  if (-[MAAutoAssetSetPolicy lockInhibitsEmergencyRemoval](self, "lockInhibitsEmergencyRemoval")
    && -[MAAutoAssetSetPolicy supportingShortTermLocks](self, "supportingShortTermLocks")
    && -[MAAutoAssetSetPolicy allowCheckDownloadOnBattery](self, "allowCheckDownloadOnBattery")
    && -[MAAutoAssetSetPolicy allowCheckDownloadWhenBatteryLow](self, "allowCheckDownloadWhenBatteryLow")
    && -[MAAutoAssetSetPolicy allowCheckDownloadWhenCPUHigh](self, "allowCheckDownloadWhenCPUHigh")
    && -[MAAutoAssetSetPolicy allowCheckDownloadOverExpensive](self, "allowCheckDownloadOverExpensive")
    && -[MAAutoAssetSetPolicy allowCheckDownloadOverCellular](self, "allowCheckDownloadOverCellular")
    && -[MAAutoAssetSetPolicy blockCheckDownload](self, "blockCheckDownload"))
  {
    v7 = @"allOtherBool:Y";
  }

  else if (-[MAAutoAssetSetPolicy lockInhibitsEmergencyRemoval](self, "lockInhibitsEmergencyRemoval") {
         || -[MAAutoAssetSetPolicy supportingShortTermLocks](self, "supportingShortTermLocks")
  }
         || -[MAAutoAssetSetPolicy allowCheckDownloadOnBattery](self, "allowCheckDownloadOnBattery")
         || -[MAAutoAssetSetPolicy allowCheckDownloadWhenBatteryLow](self, "allowCheckDownloadWhenBatteryLow")
         || -[MAAutoAssetSetPolicy allowCheckDownloadWhenCPUHigh](self, "allowCheckDownloadWhenCPUHigh")
         || -[MAAutoAssetSetPolicy allowCheckDownloadOverExpensive](self, "allowCheckDownloadOverExpensive")
         || -[MAAutoAssetSetPolicy allowCheckDownloadOverCellular](self, "allowCheckDownloadOverCellular")
         || -[MAAutoAssetSetPolicy blockCheckDownload](self, "blockCheckDownload"))
  {
    id v20 = objc_alloc(NSString);
    if (-[MAAutoAssetSetPolicy lockInhibitsEmergencyRemoval](self, "lockInhibitsEmergencyRemoval")) {
      v8 = @"Y";
    }
    else {
      v8 = @"N";
    }
    v19 = v8;
    if (-[MAAutoAssetSetPolicy supportingShortTermLocks](self, "supportingShortTermLocks")) {
      uint64_t v9 = @"Y";
    }
    else {
      uint64_t v9 = @"N";
    }
    if (-[MAAutoAssetSetPolicy allowCheckDownloadOnBattery](self, "allowCheckDownloadOnBattery")) {
      v10 = @"Y";
    }
    else {
      v10 = @"N";
    }
    if (-[MAAutoAssetSetPolicy allowCheckDownloadWhenBatteryLow](self, "allowCheckDownloadWhenBatteryLow")) {
      v11 = @"Y";
    }
    else {
      v11 = @"N";
    }
    if (-[MAAutoAssetSetPolicy allowCheckDownloadWhenCPUHigh](self, "allowCheckDownloadWhenCPUHigh")) {
      objc_super v12 = @"Y";
    }
    else {
      objc_super v12 = @"N";
    }
    if (-[MAAutoAssetSetPolicy allowCheckDownloadOverExpensive](self, "allowCheckDownloadOverExpensive")) {
      v13 = @"Y";
    }
    else {
      v13 = @"N";
    }
    if (-[MAAutoAssetSetPolicy allowCheckDownloadOverCellular](self, "allowCheckDownloadOverCellular")) {
      objc_super v6 = @"Y";
    }
    if (-[MAAutoAssetSetPolicy blockCheckDownload](self, "blockCheckDownload")) {
      v14 = @"Y";
    }
    else {
      v14 = @"N";
    }
    v7 = (__CFString *)[v20 initWithFormat:@"|lockInhibitsRemoval:%@|supportingShortTermLocks:%@|allowCheckDownload(OnBattery:%@,WhenBatteryLow:%@,WhenCPUHigh:%@,OverExpensive:%@,OverCellular:%@)|blockCheckDownload:%@|", v19, v9, v10, v11, v12, v13, v6, v14];
  }

  else
  {
    v7 = @"allOtherBool:N";
  }

  v15 = (void *)NSString;
  if (-[MAAutoAssetSetPolicy userInitiated](self, "userInitiated")) {
    v16 = @"Y";
  }
  else {
    v16 = @"N";
  }
  [v15 stringWithFormat:@"user:%@|%@%@", v16, v7, v5];
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (BOOL)lockInhibitsEmergencyRemoval
{
  return self->_lockInhibitsEmergencyRemoval;
}

- (void)setLockInhibitsEmergencyRemoval:(BOOL)a3
{
  self->_lockInhibitsEmergencyRemoval = a3;
}

- (BOOL)supportingShortTermLocks
{
  return self->_supportingShortTermLocks;
}

- (void)setSupportingShortTermLocks:(BOOL)a3
{
  self->_supportingShortTermLocks = a3;
}

- (BOOL)allowCheckDownloadOnBattery
{
  return self->_allowCheckDownloadOnBattery;
}

- (void)setAllowCheckDownloadOnBattery:(BOOL)a3
{
  self->_allowCheckDownloadOnBattery = a3;
}

- (BOOL)allowCheckDownloadWhenBatteryLow
{
  return self->_allowCheckDownloadWhenBatteryLow;
}

- (void)setAllowCheckDownloadWhenBatteryLow:(BOOL)a3
{
  self->_allowCheckDownloadWhenBatteryLow = a3;
}

- (BOOL)allowCheckDownloadWhenCPUHigh
{
  return self->_allowCheckDownloadWhenCPUHigh;
}

- (void)setAllowCheckDownloadWhenCPUHigh:(BOOL)a3
{
  self->_allowCheckDownloadWhenCPUHigh = a3;
}

- (BOOL)allowCheckDownloadOverExpensive
{
  return self->_allowCheckDownloadOverExpensive;
}

- (void)setAllowCheckDownloadOverExpensive:(BOOL)a3
{
  self->_allowCheckDownloadOverExpensive = a3;
}

- (BOOL)allowCheckDownloadOverCellular
{
  return self->_allowCheckDownloadOverCellular;
}

- (void)setAllowCheckDownloadOverCellular:(BOOL)a3
{
  self->_allowCheckDownloadOverCellular = a3;
}

- (BOOL)blockCheckDownload
{
  return self->_blockCheckDownload;
}

- (void)setBlockCheckDownload:(BOOL)a3
{
  self->_blockCheckDownload = a3;
}

- (BOOL)blockCheckDownloadWhenRecentUserActivity
{
  return self->_blockCheckDownloadWhenRecentUserActivity;
}

- (void)setBlockCheckDownloadWhenRecentUserActivity:(BOOL)a3
{
  self->_blockCheckDownloadWhenRecentUserActivity = a3;
}

- (BOOL)preferCheckDownloadOverWiFi
{
  return self->_preferCheckDownloadOverWiFi;
}

- (void)setPreferCheckDownloadOverWiFi:(BOOL)a3
{
  self->_preferCheckDownloadOverWiFi = a3;
}

- (BOOL)restrictCheckDownloadToNetwork
{
  return self->_restrictCheckDownloadToNetwork;
}

- (void)setRestrictCheckDownloadToNetwork:(BOOL)a3
{
  self->_restrictCheckDownloadToNetwork = a3;
}

- (NSDictionary)additionalPolicyControl
{
  return self->_additionalPolicyControl;
}

- (void)setAdditionalPolicyControl:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
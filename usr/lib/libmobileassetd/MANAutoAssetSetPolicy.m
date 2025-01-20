@interface MANAutoAssetSetPolicy
+ (BOOL)supportsSecureCoding;
- (BOOL)allowCheckDownloadOnBattery;
- (BOOL)allowCheckDownloadOverCellular;
- (BOOL)allowCheckDownloadOverExpensive;
- (BOOL)allowCheckDownloadWhenBatteryLow;
- (BOOL)allowCheckDownloadWhenCPUHigh;
- (BOOL)blockCheckDownload;
- (BOOL)lockInhibitsEmergencyRemoval;
- (BOOL)supportingShortTermLocks;
- (BOOL)userInitiated;
- (MANAutoAssetSetPolicy)init;
- (MANAutoAssetSetPolicy)initWithCoder:(id)a3;
- (NSDictionary)additionalPolicyControl;
- (id)copy;
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
- (void)setLockInhibitsEmergencyRemoval:(BOOL)a3;
- (void)setSupportingShortTermLocks:(BOOL)a3;
- (void)setUserInitiated:(BOOL)a3;
@end

@implementation MANAutoAssetSetPolicy

- (id)summary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetPolicy additionalPolicyControl](self, "additionalPolicyControl"));
  v4 = @"(w/additional)";
  if (!v3) {
    v4 = &stru_355768;
  }
  v5 = v4;

  v6 = @"N";
  if (-[MANAutoAssetSetPolicy lockInhibitsEmergencyRemoval](self, "lockInhibitsEmergencyRemoval")
    && -[MANAutoAssetSetPolicy supportingShortTermLocks](self, "supportingShortTermLocks")
    && -[MANAutoAssetSetPolicy allowCheckDownloadOnBattery](self, "allowCheckDownloadOnBattery")
    && -[MANAutoAssetSetPolicy allowCheckDownloadWhenBatteryLow](self, "allowCheckDownloadWhenBatteryLow")
    && -[MANAutoAssetSetPolicy allowCheckDownloadWhenCPUHigh](self, "allowCheckDownloadWhenCPUHigh")
    && -[MANAutoAssetSetPolicy allowCheckDownloadOverExpensive](self, "allowCheckDownloadOverExpensive")
    && -[MANAutoAssetSetPolicy allowCheckDownloadOverCellular](self, "allowCheckDownloadOverCellular")
    && -[MANAutoAssetSetPolicy blockCheckDownload](self, "blockCheckDownload"))
  {
    v7 = @"allOtherBool:Y";
  }

  else if (-[MANAutoAssetSetPolicy lockInhibitsEmergencyRemoval](self, "lockInhibitsEmergencyRemoval") {
         || -[MANAutoAssetSetPolicy supportingShortTermLocks](self, "supportingShortTermLocks")
  }
         || -[MANAutoAssetSetPolicy allowCheckDownloadOnBattery](self, "allowCheckDownloadOnBattery")
         || -[MANAutoAssetSetPolicy allowCheckDownloadWhenBatteryLow](self, "allowCheckDownloadWhenBatteryLow")
         || -[MANAutoAssetSetPolicy allowCheckDownloadWhenCPUHigh](self, "allowCheckDownloadWhenCPUHigh")
         || -[MANAutoAssetSetPolicy allowCheckDownloadOverExpensive](self, "allowCheckDownloadOverExpensive")
         || -[MANAutoAssetSetPolicy allowCheckDownloadOverCellular](self, "allowCheckDownloadOverCellular")
         || -[MANAutoAssetSetPolicy blockCheckDownload](self, "blockCheckDownload"))
  {
    v19 = objc_alloc(&OBJC_CLASS___NSString);
    if (-[MANAutoAssetSetPolicy lockInhibitsEmergencyRemoval](self, "lockInhibitsEmergencyRemoval")) {
      v8 = @"Y";
    }
    else {
      v8 = @"N";
    }
    v18 = v8;
    if (-[MANAutoAssetSetPolicy supportingShortTermLocks](self, "supportingShortTermLocks")) {
      v9 = @"Y";
    }
    else {
      v9 = @"N";
    }
    if (-[MANAutoAssetSetPolicy allowCheckDownloadOnBattery](self, "allowCheckDownloadOnBattery")) {
      v10 = @"Y";
    }
    else {
      v10 = @"N";
    }
    if (-[MANAutoAssetSetPolicy allowCheckDownloadWhenBatteryLow](self, "allowCheckDownloadWhenBatteryLow")) {
      v11 = @"Y";
    }
    else {
      v11 = @"N";
    }
    if (-[MANAutoAssetSetPolicy allowCheckDownloadWhenCPUHigh](self, "allowCheckDownloadWhenCPUHigh")) {
      v12 = @"Y";
    }
    else {
      v12 = @"N";
    }
    if (-[MANAutoAssetSetPolicy allowCheckDownloadOverExpensive](self, "allowCheckDownloadOverExpensive")) {
      v13 = @"Y";
    }
    else {
      v13 = @"N";
    }
    if (-[MANAutoAssetSetPolicy allowCheckDownloadOverCellular](self, "allowCheckDownloadOverCellular")) {
      v6 = @"Y";
    }
    if (-[MANAutoAssetSetPolicy blockCheckDownload](self, "blockCheckDownload")) {
      v14 = @"Y";
    }
    else {
      v14 = @"N";
    }
    v7 = -[NSString initWithFormat:]( v19,  "initWithFormat:",  @"|lockInhibitsRemoval:%@|supportingShortTermLocks:%@|allowCheckDownload(OnBattery:%@,WhenBatteryLow:%@,WhenCPUHigh:%@,OverExpensive:%@,OverCellular:%@)|blockCheckDownload:%@|",  v18,  v9,  v10,  v11,  v12,  v13,  v6,  v14);
  }

  else
  {
    v7 = @"allOtherBool:N";
  }

  if (-[MANAutoAssetSetPolicy userInitiated](self, "userInitiated")) {
    v15 = @"Y";
  }
  else {
    v15 = @"N";
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"user:%@|%@%@",  v15,  v7,  v5));

  return v16;
}

- (NSDictionary)additionalPolicyControl
{
  return self->_additionalPolicyControl;
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

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (MANAutoAssetSetPolicy)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MANAutoAssetSetPolicy;
  v2 = -[MANAutoAssetSetPolicy init](&v6, "init");
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

- (void).cxx_destruct
{
}

- (MANAutoAssetSetPolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MANAutoAssetSetPolicy;
  v5 = -[MANAutoAssetSetPolicy init](&v11, "init");
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
    v12[0] = objc_opt_class(&OBJC_CLASS___NSDictionary);
    v12[1] = objc_opt_class(&OBJC_CLASS___NSArray);
    v12[2] = objc_opt_class(&OBJC_CLASS___NSNumber);
    v12[3] = objc_opt_class(&OBJC_CLASS___NSString);
    v12[4] = objc_opt_class(&OBJC_CLASS___NSURL);
    v12[5] = objc_opt_class(&OBJC_CLASS___NSDate);
    v12[6] = objc_opt_class(&OBJC_CLASS___NSData);
    v12[7] = objc_opt_class(&OBJC_CLASS___NSNull);
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 8LL));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));

    uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v7 forKey:@"additionalPolicyControl"]);
    additionalPolicyControl = v5->_additionalPolicyControl;
    v5->_additionalPolicyControl = (NSDictionary *)v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MANAutoAssetSetPolicy userInitiated](self, "userInitiated"),  @"userInitiated");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MANAutoAssetSetPolicy lockInhibitsEmergencyRemoval](self, "lockInhibitsEmergencyRemoval"),  @"lockInhibitsEmergencyRemoval");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MANAutoAssetSetPolicy supportingShortTermLocks](self, "supportingShortTermLocks"),  @"supportingShortTermLocks");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MANAutoAssetSetPolicy allowCheckDownloadOnBattery](self, "allowCheckDownloadOnBattery"),  @"allowCheckDownloadOnBattery");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MANAutoAssetSetPolicy allowCheckDownloadWhenBatteryLow](self, "allowCheckDownloadWhenBatteryLow"),  @"allowCheckDownloadWhenBatteryLow");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MANAutoAssetSetPolicy allowCheckDownloadWhenCPUHigh](self, "allowCheckDownloadWhenCPUHigh"),  @"allowCheckDownloadWhenCPUHigh");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MANAutoAssetSetPolicy allowCheckDownloadOverExpensive](self, "allowCheckDownloadOverExpensive"),  @"allowCheckDownloadOverExpensive");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MANAutoAssetSetPolicy allowCheckDownloadOverCellular](self, "allowCheckDownloadOverCellular"),  @"allowCheckDownloadOverCellular");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MANAutoAssetSetPolicy blockCheckDownload](self, "blockCheckDownload"),  @"blockCheckDownload");
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetPolicy additionalPolicyControl](self, "additionalPolicyControl"));
  [v4 encodeObject:v5 forKey:@"additionalPolicyControl"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  v3 = objc_alloc_init(&OBJC_CLASS___MANAutoAssetSetPolicy);
  -[MANAutoAssetSetPolicy setUserInitiated:]( v3,  "setUserInitiated:",  -[MANAutoAssetSetPolicy userInitiated](self, "userInitiated"));
  -[MANAutoAssetSetPolicy setLockInhibitsEmergencyRemoval:]( v3,  "setLockInhibitsEmergencyRemoval:",  -[MANAutoAssetSetPolicy lockInhibitsEmergencyRemoval](self, "lockInhibitsEmergencyRemoval"));
  -[MANAutoAssetSetPolicy setSupportingShortTermLocks:]( v3,  "setSupportingShortTermLocks:",  -[MANAutoAssetSetPolicy supportingShortTermLocks](self, "supportingShortTermLocks"));
  -[MANAutoAssetSetPolicy setAllowCheckDownloadOnBattery:]( v3,  "setAllowCheckDownloadOnBattery:",  -[MANAutoAssetSetPolicy allowCheckDownloadOnBattery](self, "allowCheckDownloadOnBattery"));
  -[MANAutoAssetSetPolicy setAllowCheckDownloadWhenBatteryLow:]( v3,  "setAllowCheckDownloadWhenBatteryLow:",  -[MANAutoAssetSetPolicy allowCheckDownloadWhenBatteryLow](self, "allowCheckDownloadWhenBatteryLow"));
  -[MANAutoAssetSetPolicy setAllowCheckDownloadWhenCPUHigh:]( v3,  "setAllowCheckDownloadWhenCPUHigh:",  -[MANAutoAssetSetPolicy allowCheckDownloadWhenCPUHigh](self, "allowCheckDownloadWhenCPUHigh"));
  -[MANAutoAssetSetPolicy setAllowCheckDownloadOverExpensive:]( v3,  "setAllowCheckDownloadOverExpensive:",  -[MANAutoAssetSetPolicy allowCheckDownloadOverExpensive](self, "allowCheckDownloadOverExpensive"));
  -[MANAutoAssetSetPolicy setAllowCheckDownloadOverCellular:]( v3,  "setAllowCheckDownloadOverCellular:",  -[MANAutoAssetSetPolicy allowCheckDownloadOverCellular](self, "allowCheckDownloadOverCellular"));
  -[MANAutoAssetSetPolicy setBlockCheckDownload:]( v3,  "setBlockCheckDownload:",  -[MANAutoAssetSetPolicy blockCheckDownload](self, "blockCheckDownload"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetPolicy additionalPolicyControl](self, "additionalPolicyControl"));
  id v5 = [v4 copy];
  -[MANAutoAssetSetPolicy setAdditionalPolicyControl:](v3, "setAdditionalPolicyControl:", v5);

  return v3;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetPolicy additionalPolicyControl](self, "additionalPolicyControl"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetPolicy summary](self, "summary"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetPolicy additionalPolicyControl](self, "additionalPolicyControl"));
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 description]);
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@|additional:\n%@",  v4,  v6));
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetPolicy summary](self, "summary"));
  }

  return v7;
}

- (BOOL)supportingShortTermLocks
{
  return self->_supportingShortTermLocks;
}

- (void)setSupportingShortTermLocks:(BOOL)a3
{
  self->_supportingShortTermLocks = a3;
}

- (void)setAdditionalPolicyControl:(id)a3
{
}

@end
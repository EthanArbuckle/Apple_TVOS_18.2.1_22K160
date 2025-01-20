@interface MSDNPIMaskValues
+ (id)sharedInstance;
- (BOOL)isNPIDevice;
- (MSDNPIMaskValues)initWithPreferencesFile:(id)a3;
- (MSDPreferencesFile)preferencesFile;
- (NSMutableDictionary)maskValuesLookUpTable;
- (id)getMaskValueForKey:(id)a3;
- (void)initMaskValuesLookUpTable;
- (void)populateLookupTableUsingDeviceInfo:(id)a3;
- (void)saveDeviceInfo:(id)a3;
- (void)setIsNPIDevice:(BOOL)a3;
- (void)setMaskValuesLookUpTable:(id)a3;
- (void)setPreferencesFile:(id)a3;
@end

@implementation MSDNPIMaskValues

+ (id)sharedInstance
{
  if (qword_100125540 != -1) {
    dispatch_once(&qword_100125540, &stru_1000FA7A0);
  }
  return (id)qword_100125538;
}

- (MSDNPIMaskValues)initWithPreferencesFile:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MSDNPIMaskValues;
  v5 = -[MSDNPIMaskValues init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    -[MSDNPIMaskValues setPreferencesFile:](v5, "setPreferencesFile:", v4);
    -[MSDNPIMaskValues setIsNPIDevice:](v6, "setIsNPIDevice:", 0LL);
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[MSDNPIMaskValues setMaskValuesLookUpTable:](v6, "setMaskValuesLookUpTable:", v7);

    -[MSDNPIMaskValues initMaskValuesLookUpTable](v6, "initMaskValuesLookUpTable");
  }

  return v6;
}

- (void)saveDeviceInfo:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003A95C();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    v11 = "-[MSDNPIMaskValues saveDeviceInfo:]";
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s - deviceInfo:  %{public}@",  (uint8_t *)&v10,  0x16u);
  }

  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNPIMaskValues preferencesFile](self, "preferencesFile"));
    [v7 setObject:v4 forKey:@"device_info"];

    -[MSDNPIMaskValues populateLookupTableUsingDeviceInfo:](self, "populateLookupTableUsingDeviceInfo:", v4);
  }

  else
  {
    id v8 = sub_10003A95C();
    objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      v11 = "-[MSDNPIMaskValues saveDeviceInfo:]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s - Missing deviceInfo.",  (uint8_t *)&v10,  0xCu);
    }
  }
}

- (id)getMaskValueForKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNPIMaskValues maskValuesLookUpTable](self, "maskValuesLookUpTable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);
  }

  else
  {
    id v7 = sub_10003A95C();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      v11 = "-[MSDNPIMaskValues getMaskValueForKey:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s - key is nil.", (uint8_t *)&v10, 0xCu);
    }

    v6 = 0LL;
  }

  return v6;
}

- (void)populateLookupTableUsingDeviceInfo:(id)a3
{
  id v27 = a3;
  if (![v27 count])
  {
    -[MSDNPIMaskValues setIsNPIDevice:](self, "setIsNPIDevice:", 0LL);
    goto LABEL_29;
  }

  -[MSDNPIMaskValues setIsNPIDevice:](self, "setIsNPIDevice:", 1LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"product_type"]);
  if (v5)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      if ([v5 length])
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNPIMaskValues maskValuesLookUpTable](self, "maskValuesLookUpTable"));
        [v7 setObject:v5 forKey:@"ProductType"];
      }
    }
  }

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"part_description"]);
  if (v9)
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString, v8);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    {
      if ([v9 length])
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNPIMaskValues maskValuesLookUpTable](self, "maskValuesLookUpTable"));
        [v11 setObject:v9 forKey:@"MSDDemoPartDescription"];
      }
    }
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"product_description"]);
  if (v13
    && (uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString, v12), (objc_opt_isKindOfClass(v13, v14) & 1) != 0)
    && [v13 length])
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNPIMaskValues maskValuesLookUpTable](self, "maskValuesLookUpTable"));
    v16 = v15;
    v17 = v13;
  }

  else
  {
    if (!v9) {
      goto LABEL_19;
    }
    uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSString, v12);
    if ((objc_opt_isKindOfClass(v9, v18) & 1) == 0 || ![v9 length]) {
      goto LABEL_19;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNPIMaskValues maskValuesLookUpTable](self, "maskValuesLookUpTable"));
    v16 = v15;
    v17 = v9;
  }

  [v15 setObject:v17 forKey:@"MSDDemoProductDescription"];

LABEL_19:
  v20 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"device_family"]);
  if (v20)
  {
    uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSString, v19);
    if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
    {
      if ([v20 length])
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNPIMaskValues maskValuesLookUpTable](self, "maskValuesLookUpTable"));
        [v22 setObject:v20 forKey:@"MSDDemoDeviceFamily"];
      }
    }
  }

  v24 = (__CFString *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"part_number"]);
  if (!v24
    || (uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSString, v23), (objc_opt_isKindOfClass(v24, v25) & 1) == 0)
    || !-[__CFString length](v24, "length"))
  {

    v24 = @"A-123LL/A";
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNPIMaskValues maskValuesLookUpTable](self, "maskValuesLookUpTable"));
  [v26 setObject:v24 forKey:@"PartNumber"];

LABEL_29:
}

- (void)initMaskValuesLookUpTable
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNPIMaskValues preferencesFile](self, "preferencesFile"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"device_info"]);

  if (v4)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary, v5);
    if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
      -[MSDNPIMaskValues populateLookupTableUsingDeviceInfo:](self, "populateLookupTableUsingDeviceInfo:", v4);
    }
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNPIMaskValues maskValuesLookUpTable](self, "maskValuesLookUpTable"));
  [v7 setObject:&off_1001064F8 forKey:@"MSDDemoNANDSize"];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNPIMaskValues maskValuesLookUpTable](self, "maskValuesLookUpTable"));
  v10[0] = kMGQDiskUsageTotalSystemCapacity;
  v10[1] = kMGQDiskUsageTotalSystemAvailable;
  v11[0] = &off_100106510;
  v11[1] = &off_100106510;
  v10[2] = kMGQDiskUsageTotalDataCapacity;
  v10[3] = kMGQDiskUsageTotalDataAvailable;
  v11[2] = &off_100106510;
  v11[3] = &off_100106510;
  v10[4] = kMGQDiskUsageTotalDiskCapacity;
  v10[5] = kMGQDiskUsageAmountDataReserved;
  v11[4] = &off_100106510;
  v11[5] = &off_100106510;
  v10[6] = kMGQDiskUsageAmountDataAvailable;
  v10[7] = kMGQDiskUsageAmountRestoreAvailable;
  v11[6] = &off_100106510;
  v11[7] = &off_100106510;
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  8LL));
  [v8 setObject:v9 forKey:@"DiskUsage"];
}

- (BOOL)isNPIDevice
{
  return self->_isNPIDevice;
}

- (void)setIsNPIDevice:(BOOL)a3
{
  self->_isNPIDevice = a3;
}

- (MSDPreferencesFile)preferencesFile
{
  return self->_preferencesFile;
}

- (void)setPreferencesFile:(id)a3
{
}

- (NSMutableDictionary)maskValuesLookUpTable
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setMaskValuesLookUpTable:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
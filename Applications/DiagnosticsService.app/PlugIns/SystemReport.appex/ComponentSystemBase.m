@interface ComponentSystemBase
- (BOOL)isBetaBuild;
- (BOOL)isGreenTeaDevice;
- (BOOL)isInternalInstall;
- (BOOL)isPresent;
- (BOOL)isProdDevice;
- (BOOL)isSetupAssistantCompleted;
- (id)ECID;
- (id)UDID;
- (id)activationConfigurationInformation;
- (id)buildVersion;
- (id)chipID;
- (id)cpuArchitecture;
- (id)deviceColor;
- (id)deviceType;
- (id)deviceVersion;
- (id)diagnosticsBuild;
- (id)diagnosticsVersion;
- (id)lastEraseDate;
- (id)lastRestoreDate;
- (id)lastUpdateDate;
- (id)localTime;
- (id)marketingName;
- (id)marketingProductNumber;
- (id)marketingVersion;
- (id)modelNumber;
- (id)productClass;
- (id)regulatoryModelNumber;
- (id)rootCreationDate;
- (id)serialNumber;
- (id)setupAssistantCompletionDate;
- (id)setupCompletedDate;
- (id)sikPublicKey;
- (id)storeDemoModeEnabled;
- (id)systemUptime;
- (id)systemVersion;
- (void)populateAttributes:(id)a3;
@end

@implementation ComponentSystemBase

- (BOOL)isPresent
{
  return 1;
}

- (void)populateAttributes:(id)a3
{
  id v39 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase systemUptime](self, "systemUptime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringValue]);
  [v39 setObject:v5 forKeyedSubscript:@"systemUptime"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase ECID](self, "ECID"));
  [v39 setObject:v6 forKeyedSubscript:@"ecid"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase deviceColor](self, "deviceColor"));
  if ([v7 length]) {
    [v39 setObject:v7 forKeyedSubscript:@"deviceColor"];
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase deviceType](self, "deviceType"));
  [v39 setObject:v8 forKeyedSubscript:@"deviceType"];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase deviceVersion](self, "deviceVersion"));
  [v39 setObject:v9 forKeyedSubscript:@"deviceVersion"];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase cpuArchitecture](self, "cpuArchitecture"));
  [v39 setObject:v10 forKeyedSubscript:@"cpuArchitecture"];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase UDID](self, "UDID"));
  [v39 setObject:v11 forKeyedSubscript:@"udid"];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase modelNumber](self, "modelNumber"));
  [v39 setObject:v12 forKeyedSubscript:@"modelNumber"];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase regulatoryModelNumber](self, "regulatoryModelNumber"));
  [v39 setObject:v13 forKeyedSubscript:@"regulatoryModelNumber"];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase buildVersion](self, "buildVersion"));
  [v39 setObject:v14 forKeyedSubscript:@"systemBuild"];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase diagnosticsBuild](self, "diagnosticsBuild"));
  [v39 setObject:v15 forKeyedSubscript:@"diagnosticsBuild"];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase systemVersion](self, "systemVersion"));
  [v39 setObject:v16 forKeyedSubscript:@"systemVersion"];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase serialNumber](self, "serialNumber"));
  [v39 setObject:v17 forKeyedSubscript:@"deviceSerialNumber"];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase serialNumber](self, "serialNumber"));
  [v39 setObject:v18 forKeyedSubscript:@"serialNumber"];

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase diagnosticsVersion](self, "diagnosticsVersion"));
  [v39 setObject:v19 forKeyedSubscript:@"diagnosticsVersion"];

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase lastRestoreDate](self, "lastRestoreDate"));
  [v39 setObject:v20 forKeyedSubscript:@"lastRestoreDate"];

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase lastUpdateDate](self, "lastUpdateDate"));
  [v39 setObject:v21 forKeyedSubscript:@"lastUpdateDate"];

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase lastEraseDate](self, "lastEraseDate"));
  [v39 setObject:v22 forKeyedSubscript:@"lastEraseDate"];

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase setupCompletedDate](self, "setupCompletedDate"));
  [v39 setObject:v23 forKeyedSubscript:@"setupCompletedDate"];

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](&OBJC_CLASS___NSTimeZone, "localTimeZone"));
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 name]);
  [v39 setObject:v25 forKeyedSubscript:@"localTimeZone"];

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase localTime](self, "localTime"));
  [v39 setObject:v26 forKeyedSubscript:@"localTime"];

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase marketingVersion](self, "marketingVersion"));
  [v39 setObject:v27 forKeyedSubscript:@"marketingVersion"];

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase chipID](self, "chipID"));
  [v39 setObject:v28 forKeyedSubscript:@"chipID"];

  v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[ComponentSystemBase isBetaBuild](self, "isBetaBuild")));
  [v39 setObject:v29 forKeyedSubscript:@"isBetaBuild"];

  v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[ComponentSystemBase isInternalInstall](self, "isInternalInstall")));
  [v39 setObject:v30 forKeyedSubscript:@"isInternalInstall"];

  v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[ComponentSystemBase isProdDevice](self, "isProdDevice")));
  [v39 setObject:v31 forKeyedSubscript:@"isProdDevice"];

  v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[ComponentSystemBase isGreenTeaDevice](self, "isGreenTeaDevice")));
  [v39 setObject:v32 forKeyedSubscript:@"greenTeaDevice"];

  v33 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", DiagnosticLogSubmissionEnabled());
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  [v39 setObject:v34 forKeyedSubscript:@"analyticsEnabled"];

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase storeDemoModeEnabled](self, "storeDemoModeEnabled"));
  [v39 setObject:v35 forKeyedSubscript:@"storeDemoModeEnabled"];

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase sikPublicKey](self, "sikPublicKey"));
  [v39 setObject:v36 forKeyedSubscript:@"sik"];

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase marketingProductNumber](self, "marketingProductNumber"));
  [v39 setObject:v37 forKeyedSubscript:@"marketingProductNumber"];

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase activationConfigurationInformation](self, "activationConfigurationInformation"));
  if (v38) {
    [v39 addEntriesFromDictionary:v38];
  }
}

- (id)lastRestoreDate
{
  uint64_t v2 = DiagnosticLogHandleForCategory(6LL);
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    v13 = "-[ComponentSystemBase lastRestoreDate]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v12, 0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DSGeneralLogCollector latestUserLog](&OBJC_CLASS___DSGeneralLogCollector, "latestUserLog"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 restoreDate]);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[DSDateFormatter sharedFormatter](&OBJC_CLASS___DSDateFormatter, "sharedFormatter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 formatterWithType:0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringFromDate:v5]);
  }

  else
  {
    v8 = 0LL;
  }

  id v9 = stringOrNull(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

- (id)lastUpdateDate
{
  uint64_t v2 = DiagnosticLogHandleForCategory(6LL);
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    v13 = "-[ComponentSystemBase lastUpdateDate]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v12, 0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DSGeneralLogCollector latestUserLog](&OBJC_CLASS___DSGeneralLogCollector, "latestUserLog"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 updateDate]);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[DSDateFormatter sharedFormatter](&OBJC_CLASS___DSDateFormatter, "sharedFormatter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 formatterWithType:0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringFromDate:v5]);
  }

  else
  {
    v8 = 0LL;
  }

  id v9 = stringOrNull(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

- (id)lastEraseDate
{
  uint64_t v3 = DiagnosticLogHandleForCategory(6LL);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    v10 = "-[ComponentSystemBase lastEraseDate]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase rootCreationDate](self, "rootCreationDate"));
  id v6 = stringOrNull(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (id)deviceVersion
{
  uint64_t v2 = DiagnosticLogHandleForCategory(6LL);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    int v9 = "-[ComponentSystemBase deviceVersion]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v4 = (void *)MGCopyAnswer(@"ProductVersion", 0LL);
  id v5 = stringOrNull(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)diagnosticsVersion
{
  uint64_t v2 = DiagnosticLogHandleForCategory(6LL);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    v11 = "-[ComponentSystemBase diagnosticsVersion]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 infoDictionary]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"CFBundleShortVersionString"]);
  id v7 = stringOrNull(v6);
  int v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (id)marketingVersion
{
  uint64_t v2 = DiagnosticLogHandleForCategory(6LL);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    int v10 = "-[ComponentSystemBase marketingVersion]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  v4 = (void *)_CFCopySystemVersionDictionary();
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:_kCFSystemVersionProductVersionKey]);
  id v6 = stringOrNull(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (id)systemVersion
{
  uint64_t v2 = DiagnosticLogHandleForCategory(6LL);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ComponentSystemBase systemVersion]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v11 = 0x3032000000LL;
  int v12 = sub_10001D63C;
  v13 = sub_10001D64C;
  id v14 = 0LL;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10001D654;
  v9[3] = &unk_100060628;
  v9[4] = &buf;
  v4 = objc_retainBlock(v9);
  label = dispatch_queue_get_label(&_dispatch_main_q);
  if (label == dispatch_queue_get_label(0LL))
  {
    ((void (*)(void *))v4[2])(v4);
  }

  else
  {
    dispatch_sync(&_dispatch_main_q, v4);
  }

  id v6 = stringOrNull(*(void **)(*((void *)&buf + 1) + 40LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  _Block_object_dispose(&buf, 8);
  return v7;
}

- (id)diagnosticsBuild
{
  uint64_t v2 = DiagnosticLogHandleForCategory(6LL);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    uint64_t v11 = "-[ComponentSystemBase diagnosticsBuild]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 infoDictionary]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"CFBundleVersion"]);
  id v7 = stringOrNull(v6);
  int v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (id)buildVersion
{
  uint64_t v2 = DiagnosticLogHandleForCategory(6LL);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    int v9 = "-[ComponentSystemBase buildVersion]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v4 = (void *)MGCopyAnswer(@"BuildVersion", 0LL);
  id v5 = stringOrNull(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)modelNumber
{
  uint64_t v2 = DiagnosticLogHandleForCategory(6LL);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    int v9 = "-[ComponentSystemBase modelNumber]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v4 = (void *)MGCopyAnswer(@"ModelNumber", 0LL);
  id v5 = stringOrNull(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)regulatoryModelNumber
{
  uint64_t v2 = DiagnosticLogHandleForCategory(6LL);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    int v9 = "-[ComponentSystemBase regulatoryModelNumber]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v4 = (void *)MGCopyAnswer(@"RegulatoryModelNumber", 0LL);
  id v5 = stringOrNull(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)UDID
{
  uint64_t v2 = DiagnosticLogHandleForCategory(6LL);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    int v9 = "-[ComponentSystemBase UDID]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v4 = (void *)MGCopyAnswer(@"UniqueDeviceID", 0LL);
  id v5 = stringOrNull(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)serialNumber
{
  uint64_t v2 = DiagnosticLogHandleForCategory(6LL);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    int v9 = "-[ComponentSystemBase serialNumber]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v4 = (void *)MGCopyAnswer(@"SerialNumber", 0LL);
  id v5 = stringOrNull(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)deviceType
{
  uint64_t v2 = DiagnosticLogHandleForCategory(6LL);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    int v9 = "-[ComponentSystemBase deviceType]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v4 = (void *)MGCopyAnswer(@"ProductType", 0LL);
  id v5 = stringOrNull(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)cpuArchitecture
{
  uint64_t v2 = DiagnosticLogHandleForCategory(6LL);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    int v9 = "-[ComponentSystemBase cpuArchitecture]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v4 = (void *)MGCopyAnswer(@"CPUArchitecture", 0LL);
  id v5 = stringOrNull(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)deviceColor
{
  uint64_t v2 = DiagnosticLogHandleForCategory(6LL);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[ComponentSystemBase deviceColor]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v4 = (void *)MGCopyAnswer(@"DeviceColor", 0LL);
  if ([v4 isEqualToString:@"unknown"])
  {

    v4 = 0LL;
  }

  return v4;
}

- (id)systemUptime
{
  uint64_t v2 = DiagnosticLogHandleForCategory(6LL);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    *(void *)&buf[4] = "-[ComponentSystemBase systemUptime]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  *(void *)id v7 = 0x1500000001LL;
  size_t v6 = 16LL;
  if (sysctl(v7, 2u, buf, &v6, 0LL, 0LL)) {
    return &off_10008E830;
  }
  gettimeofday(&v5, 0LL);
  return objc_autoreleaseReturnValue((id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  (double)(unint64_t)(1000000000 * (v5.tv_sec - *(void *)buf)
}

- (id)ECID
{
  uint64_t v2 = DiagnosticLogHandleForCategory(6LL);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v7 = "-[ComponentSystemBase ECID]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%llx",  MGGetSInt64Answer(@"UniqueChipID", 0LL));
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)marketingName
{
  uint64_t v2 = DiagnosticLogHandleForCategory(6LL);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    int v9 = "-[ComponentSystemBase marketingName]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v4 = (void *)MGCopyAnswer(@"marketing-name", 0LL);
  id v5 = stringOrNull(v4);
  size_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)setupCompletedDate
{
  uint64_t v3 = DiagnosticLogHandleForCategory(6LL);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    v13 = "-[ComponentSystemBase setupCompletedDate]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v12, 0xCu);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase setupAssistantCompletionDate](self, "setupAssistantCompletionDate"));
  if (v5)
  {
    size_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[DSDateFormatter sharedFormatter](&OBJC_CLASS___DSDateFormatter, "sharedFormatter"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 formatterWithType:0]);
    int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringFromDate:v5]);
  }

  else
  {
    int v8 = 0LL;
  }

  id v9 = stringOrNull(v8);
  int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

- (id)productClass
{
  uint64_t v2 = DiagnosticLogHandleForCategory(6LL);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    size_t v6 = "-[ComponentSystemBase productClass]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  return (id)MGCopyAnswer(@"DeviceName", 0LL);
}

- (id)rootCreationDate
{
  uint64_t v2 = DiagnosticLogHandleForCategory(6LL);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    int v12 = "-[ComponentSystemBase rootCreationDate]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v11, 0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 attributesOfItemAtPath:@"/private/var/" error:0]);

  size_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:NSFileCreationDate]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[DSDateFormatter sharedFormatter](&OBJC_CLASS___DSDateFormatter, "sharedFormatter"));
  int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 formatterWithType:0]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 stringFromDate:v6]);

  return v9;
}

- (id)localTime
{
  uint64_t v2 = DiagnosticLogHandleForCategory(6LL);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    int v12 = "-[ComponentSystemBase localTime]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v11, 0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  if (!v4)
  {
    uint64_t v5 = DiagnosticLogHandleForCategory(6LL);
    size_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Current date is nil.",  (uint8_t *)&v11,  2u);
    }

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[DSDateFormatter sharedFormatter](&OBJC_CLASS___DSDateFormatter, "sharedFormatter"));
  int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 formatterWithType:0]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 stringFromDate:v4]);

  return v9;
}

- (id)setupAssistantCompletionDate
{
  uint64_t v2 = DiagnosticLogHandleForCategory(6LL);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    size_t v6 = "-[ComponentSystemBase setupAssistantCompletionDate]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  return (id)(id)CFPreferencesCopyAppValue( @"SetupLastExit",  @"com.apple.purplebuddy");
}

- (BOOL)isSetupAssistantCompleted
{
  uint64_t v3 = DiagnosticLogHandleForCategory(6LL);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    int v10 = "-[ComponentSystemBase isSetupAssistantCompleted]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase setupAssistantCompletionDate](self, "setupAssistantCompletionDate"));
  if (v5)
  {
    size_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    unsigned int v7 = [v5 isEqual:v6] ^ 1;
  }

  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)chipID
{
  uint64_t v2 = DiagnosticLogHandleForCategory(6LL);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    int v9 = "-[ComponentSystemBase chipID]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v4 = (void *)MGCopyAnswer(@"ChipID", 0LL);
  id v5 = numberOrNull(v4);
  size_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (BOOL)isBetaBuild
{
  if (qword_100091F48 != -1) {
    dispatch_once(&qword_100091F48, &stru_100060668);
  }
  return byte_100091F40;
}

- (BOOL)isInternalInstall
{
  if (qword_100091F50 != -1) {
    dispatch_once(&qword_100091F50, &stru_100060688);
  }
  return byte_100091F41;
}

- (BOOL)isProdDevice
{
  uint64_t v2 = DiagnosticLogHandleForCategory(6LL);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    size_t v6 = "-[ComponentSystemBase isProdDevice]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  return MGGetBoolAnswer(@"SigningFuse");
}

- (BOOL)isGreenTeaDevice
{
  uint64_t v2 = DiagnosticLogHandleForCategory(6LL);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    size_t v6 = "-[ComponentSystemBase isGreenTeaDevice]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  return MGGetBoolAnswer(@"green-tea");
}

- (id)storeDemoModeEnabled
{
  uint64_t v2 = DiagnosticLogHandleForCategory(6LL);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    int v10 = "-[ComponentSystemBase storeDemoModeEnabled]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  v4 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.demo-settings");
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v4, "objectForKey:", @"StoreDemoMode"));
  size_t v6 = v5;
  if (!v5) {
    int v5 = &__kCFBooleanFalse;
  }
  id v7 = v5;

  return v7;
}

- (id)activationConfigurationInformation
{
  uint64_t v2 = DiagnosticLogHandleForCategory(6LL);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    v21 = "-[ComponentSystemBase activationConfigurationInformation]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v17 = 0LL;
  uint64_t v4 = MAECopyActivationRecordWithError(&v17);
  int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v17;
  if (v6)
  {
    uint64_t v7 = DiagnosticLogHandleForCategory(6LL);
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v16 = (char *)objc_claimAutoreleasedReturnValue([v6 description]);
      *(_DWORD *)__int128 buf = 138412290;
      v21 = v16;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Could not get activation record with error: %@",  buf,  0xCu);
    }
  }

  else
  {
    if (v5)
    {
      int v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"DeviceConfigurationFlags"]);
      unsigned int v11 = [v10 intValue];
      uint64_t v12 = (v11 >> 2) & 1;
      v18[0] = @"demoActivated";
      int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", (v11 >> 1) & 1));
      v18[1] = @"pointOfSaleActivated";
      v19[0] = v8;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v12));
      v19[1] = v13;
      int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  2LL));

      goto LABEL_9;
    }

    uint64_t v15 = DiagnosticLogHandleForCategory(6LL);
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Error: activation record is NULL",  buf,  2u);
    }
  }

  int v9 = 0LL;
  int v10 = 0LL;
LABEL_9:

  return v9;
}

- (id)sikPublicKey
{
  uint64_t v2 = DiagnosticLogHandleForCategory(6LL);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    CFErrorRef v20 = (CFErrorRef)"-[ComponentSystemBase sikPublicKey]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  uint64_t v4 = (__SecKey *)SecKeyCopySystemKey(0LL, &error);
  if (!v4)
  {
    uint64_t v11 = DiagnosticLogHandleForCategory(6LL);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412290;
      CFErrorRef v20 = error;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to retrieve SIK Key with error: %@",  buf,  0xCu);
    }

    CFRelease(error);
    return &stru_10007DA88;
  }

  int v5 = SecKeyCopyPublicKey(v4);
  if (!v5)
  {
    uint64_t v13 = DiagnosticLogHandleForCategory(6LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Failed to retrieve public SIK Key.",  buf,  2u);
    }

    return &stru_10007DA88;
  }

  id v6 = v5;
  CFDataRef v7 = SecKeyCopyExternalRepresentation(v5, &error);
  CFRelease(v6);
  if (v7)
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue(-[__CFData base64EncodedStringWithOptions:](v7, "base64EncodedStringWithOptions:", 0LL));
    id v9 = stringOrNull(v8);
    int v10 = (__CFString *)objc_claimAutoreleasedReturnValue(v9);
  }

  else
  {
    uint64_t v16 = DiagnosticLogHandleForCategory(6LL);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412290;
      CFErrorRef v20 = error;
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Failed to retrieve data for public SIK key with error: %@",  buf,  0xCu);
    }

    CFRelease(error);
    int v10 = &stru_10007DA88;
  }

  return v10;
}

- (id)marketingProductNumber
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase modelNumber](self, "modelNumber"));
  if (v2)
  {
    uint64_t v3 = (void *)MGCopyAnswer(@"RegionInfo", 0LL);
    id v4 = stringOrNull(v3);
    int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

    if (v5) {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingString:v5]);
    }
    else {
      id v6 = 0LL;
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

@end
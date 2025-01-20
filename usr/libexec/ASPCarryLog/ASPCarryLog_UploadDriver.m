@interface ASPCarryLog_UploadDriver
- (int)_DRResponseConversion:(unsigned __int8)a3;
- (int)allowToParticipateTaskingId:(id)a3 DeviceId:(id)a4;
- (int)uploadFile:(id)a3 TaskingId:(id)a4 DeviceId:(id)a5 LogType:(id)a6;
@end

@implementation ASPCarryLog_UploadDriver

- (int)_DRResponseConversion:(unsigned __int8)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

- (int)uploadFile:(id)a3 TaskingId:(id)a4 DeviceId:(id)a5 LogType:(id)a6
{
  v15 = @"DeviceID";
  id v16 = a5;
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));

  ASPCarryLog_UploadFileToDP(v12, @"com.apple.coreos.nand", v11, @"com.apple.nand.iolog", v13, v9);
  return 1;
}

- (int)allowToParticipateTaskingId:(id)a3 DeviceId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19 = @"DeviceID";
  id v20 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
  if (&_DRShouldEnableLogGathering)
  {
    id v18 = 0LL;
    uint64_t v9 = DRShouldEnableLogGathering(@"com.apple.coreos.nand", v6, v8, @"com.apple.nand.iolog", &v18);
    id v10 = v18;
    if (!v10)
    {
      int v16 = -[ASPCarryLog_UploadDriver _DRResponseConversion:](self, "_DRResponseConversion:", v9);
      goto LABEL_9;
    }

    id v11 = v10;
    id v12 = objc_claimAutoreleasedReturnValue([v10 localizedDescription]);
    id v13 = [v12 UTF8String];

    v14 = (os_log_s *)oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_100042A08((uint64_t)v13, v14);
    }
  }

  else
  {
    v15 = (os_log_s *)oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_100042164(v15);
    }
  }

  int v16 = 0;
LABEL_9:

  return v16;
}

@end
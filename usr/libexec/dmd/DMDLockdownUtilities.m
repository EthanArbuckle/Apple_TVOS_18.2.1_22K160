@interface DMDLockdownUtilities
+ (BOOL)setDeviceName:(id)a3 outError:(id *)a4;
+ (NSDate)deviceLastCloudBackupDate;
@end

@implementation DMDLockdownUtilities

+ (NSDate)deviceLastCloudBackupDate
{
  uint64_t v2 = lockdown_connect(a1, a2);
  v3 = (void *)v2;
  if (v2)
  {
    v4 = (void *)lockdown_copy_value(v2, @"com.apple.mobile.backup", @"LastCloudBackupDate");
    lockdown_disconnect(v3);
    if (v4)
    {
      uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
      {
        v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( NSDate,  "dateWithTimeIntervalSince1970:",  (double)(unint64_t)[v4 unsignedLongLongValue] + 978307200.0));
LABEL_8:

        return (NSDate *)v3;
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100064F3C();
      }
    }

    v3 = 0LL;
    goto LABEL_8;
  }

  return (NSDate *)v3;
}

+ (BOOL)setDeviceName:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100041560;
  v13[3] = &unk_10009EC68;
  v13[4] = a4;
  v6 = objc_retainBlock(v13);
  uint64_t v8 = lockdown_connect(v6, v7);
  if (v8)
  {
    uint64_t v9 = v8;
    int v10 = lockdown_set_value(v8, 0LL, kLockdownDeviceNameKey, v5);
    lockdown_disconnect(v9);
    if (!v10)
    {
      BOOL v11 = 1;
      goto LABEL_7;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100064F80(v10);
    }
  }

  ((void (*)(void *, uint64_t))v6[2])(v6, 2300LL);
  BOOL v11 = 0;
LABEL_7:

  return v11;
}

@end
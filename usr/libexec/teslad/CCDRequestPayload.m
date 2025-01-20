@interface CCDRequestPayload
- (NSDictionary)dictionary;
- (NSString)action;
- (id)_deviceInfoDictionary;
@end

@implementation CCDRequestPayload

- (NSDictionary)dictionary
{
  v11[0] = @"device";
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CCDRequestPayload _deviceInfoDictionary](self, "_deviceInfoDictionary"));
  v5 = v4;
  if (!v4) {
    v5 = (void *)objc_opt_new(&OBJC_CLASS___NSDictionary, v3);
  }
  v11[1] = @"action";
  v12[0] = v5;
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[CCDRequestPayload action](self, "action"));
  v7 = (void *)v6;
  v8 = &stru_100019A88;
  if (v6) {
    v8 = (const __CFString *)v6;
  }
  v12[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  2LL));

  if (!v4) {
  return (NSDictionary *)v9;
  }
}

- (id)_deviceInfoDictionary
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CCDDeviceUtilities serialNumber](&OBJC_CLASS___CCDDeviceUtilities, "serialNumber"));
  uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue( +[CCDFeatures depDeviceSerialNumberWithValue:]( &OBJC_CLASS___CCDFeatures,  "depDeviceSerialNumberWithValue:",  v2));

  if (v3) {
    v4 = v3;
  }
  else {
    v4 = &stru_100019A88;
  }
  v10[0] = @"serial_number";
  v10[1] = @"udid";
  v11[0] = v4;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(+[CCDDeviceUtilities UDID](&OBJC_CLASS___CCDDeviceUtilities, "UDID"));
  uint64_t v6 = (void *)v5;
  if (v5) {
    v7 = (const __CFString *)v5;
  }
  else {
    v7 = &stru_100019A88;
  }
  v11[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  2LL));

  return v8;
}

- (NSString)action
{
  return 0LL;
}

@end
@interface ComponentWiFi
- (BOOL)isPresent;
- (id)serialNumber;
- (id)wifiAddress;
- (id)wifiDeviceCount;
- (void)populateAttributes:(id)a3;
@end

@implementation ComponentWiFi

- (BOOL)isPresent
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentWiFi wifiDeviceCount](self, "wifiDeviceCount"));
  BOOL v3 = (int)[v2 intValue] > 0;

  return v3;
}

- (void)populateAttributes:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentWiFi wifiAddress](self, "wifiAddress"));
  [v4 setObject:v5 forKeyedSubscript:@"wifiAddress"];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[ComponentWiFi serialNumber](self, "serialNumber"));
  [v4 setObject:v6 forKeyedSubscript:@"serialNumber"];
}

- (id)wifiDeviceCount
{
  id v2 = objc_alloc_init(&OBJC_CLASS___CWFInterface);
  BOOL v3 = v2;
  if (v2)
  {
    [v2 activate];
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 interfaceNames]);
    v5 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v4 count]));
  }

  else
  {
    uint64_t v6 = DiagnosticLogHandleForCategory(6LL);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "WiFiManagerClientCreate failed", v9, 2u);
    }

    v5 = &off_10008E818;
  }

  return v5;
}

- (id)wifiAddress
{
  id v2 = (void *)MGCopyAnswer(@"WifiAddress", 0LL);
  id v3 = stringOrNull(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (id)serialNumber
{
  return (id)MGCopyAnswer(@"WirelessBoardSnum", 0LL);
}

@end
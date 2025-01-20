@interface DMDMobileGestalt
+ (BOOL)hasAppleInternalInstallCapability;
+ (BOOL)hasCellularDataCapability;
+ (BOOL)hasPersonalHotspotCapability;
+ (BOOL)hasTelephonyCapability;
+ (NSData)wifiAddressData;
+ (NSNumber)dataAvailable;
+ (NSNumber)dataCapacity;
+ (NSString)bluetoothAddress;
+ (NSString)buildVersion;
+ (NSString)deviceClass;
+ (NSString)ethernetMacAddress;
+ (NSString)marketingName;
+ (NSString)mobileSubscriberCountryCode;
+ (NSString)mobileSubscriberNetworkCode;
+ (NSString)modelNumber;
+ (NSString)phoneNumber;
+ (NSString)productType;
+ (NSString)productVersion;
+ (NSString)serialNumber;
+ (NSString)uniqueDeviceID;
+ (NSString)userAssignedDeviceName;
+ (NSString)wifiAddress;
+ (unint64_t)deviceType;
@end

@implementation DMDMobileGestalt

+ (unint64_t)deviceType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 deviceClass]);
  if ([v2 isEqualToString:@"iPhone"])
  {
    unint64_t v3 = 1LL;
  }

  else if ([v2 isEqualToString:@"iPod"])
  {
    unint64_t v3 = 2LL;
  }

  else if ([v2 isEqualToString:@"iPad"])
  {
    unint64_t v3 = 3LL;
  }

  else if ([v2 isEqualToString:@"AppleTV"])
  {
    unint64_t v3 = 4LL;
  }

  else if ([v2 isEqualToString:@"Watch"])
  {
    unint64_t v3 = 5LL;
  }

  else if ([v2 isEqualToString:@"AudioAccessory"])
  {
    unint64_t v3 = 6LL;
  }

  else if ([v2 isEqualToString:@"RealityDevice"])
  {
    unint64_t v3 = 8LL;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138477827;
      v6 = v2;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Unknown device type %{private}@",  (uint8_t *)&v5,  0xCu);
    }

    unint64_t v3 = 0LL;
  }

  return v3;
}

+ (BOOL)hasAppleInternalInstallCapability
{
  return MGGetBoolAnswer(@"apple-internal-install", a2);
}

+ (NSString)deviceClass
{
  return (NSString *)(id)MGCopyAnswer(@"DeviceClass", 0LL);
}

+ (NSString)productType
{
  return (NSString *)(id)MGCopyAnswer(@"ProductType", 0LL);
}

+ (NSString)productVersion
{
  return (NSString *)(id)MGCopyAnswer(@"ProductVersion", 0LL);
}

+ (NSString)buildVersion
{
  return (NSString *)(id)MGCopyAnswer(@"BuildVersion", 0LL);
}

+ (NSString)marketingName
{
  return (NSString *)(id)MGCopyAnswer(@"marketing-name", 0LL);
}

+ (NSString)serialNumber
{
  return (NSString *)(id)MGCopyAnswer(@"SerialNumber", 0LL);
}

+ (NSString)modelNumber
{
  return (NSString *)(id)MGCopyAnswer(@"ModelNumber", 0LL);
}

+ (NSString)uniqueDeviceID
{
  return (NSString *)(id)MGCopyAnswer(@"UniqueDeviceID", 0LL);
}

+ (NSString)userAssignedDeviceName
{
  return (NSString *)(id)MGCopyAnswer(@"UserAssignedDeviceName", 0LL);
}

+ (NSNumber)dataCapacity
{
  v2 = (void *)MGCopyAnswer(@"DiskUsage", 0LL);
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:kMGQDiskUsageTotalDataCapacity]);
  if (v3)
  {
    v4 = v3;
    [v3 floatValue];
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v5 * 9.31322575e-10));
  }

  else
  {
    v6 = 0LL;
  }

  return (NSNumber *)v6;
}

+ (NSNumber)dataAvailable
{
  v2 = (void *)MGCopyAnswer(@"DiskUsage", 0LL);
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:kMGQDiskUsageAmountDataAvailable]);
  if (v3)
  {
    v4 = v3;
    [v3 floatValue];
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v5 * 9.31322575e-10));
  }

  else
  {
    v6 = 0LL;
  }

  return (NSNumber *)v6;
}

+ (NSString)ethernetMacAddress
{
  return (NSString *)(id)MGCopyAnswer(@"EthernetMacAddress", 0LL);
}

+ (NSString)bluetoothAddress
{
  return (NSString *)(id)MGCopyAnswer(@"BluetoothAddress", 0LL);
}

+ (NSString)wifiAddress
{
  return (NSString *)(id)MGCopyAnswer(@"WifiAddress", 0LL);
}

+ (NSData)wifiAddressData
{
  return (NSData *)(id)MGCopyAnswer(@"WifiAddressData", 0LL);
}

+ (BOOL)hasTelephonyCapability
{
  return MGGetBoolAnswer(@"telephony", a2);
}

+ (BOOL)hasCellularDataCapability
{
  return MGGetBoolAnswer(@"cellular-data", a2);
}

+ (BOOL)hasPersonalHotspotCapability
{
  return MGGetBoolAnswer(@"personal-hotspot", a2);
}

+ (NSString)phoneNumber
{
  return (NSString *)(id)MGCopyAnswer(@"PhoneNumber", 0LL);
}

+ (NSString)mobileSubscriberCountryCode
{
  return (NSString *)(id)MGCopyAnswer(@"MobileSubscriberCountryCode", 0LL);
}

+ (NSString)mobileSubscriberNetworkCode
{
  return (NSString *)(id)MGCopyAnswer(@"MobileSubscriberNetworkCode", 0LL);
}

@end
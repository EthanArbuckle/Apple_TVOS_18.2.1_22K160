@interface _DASBatteryTemperatureReader
+ (id)batteryProperties;
- (id)currentValue;
- (id)lastModifiedDate;
@end

@implementation _DASBatteryTemperatureReader

+ (id)batteryProperties
{
  v2 = IOServiceMatching((const char *)[@"IOPMPowerSource" UTF8String]);
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  if (!MatchingService) {
    return 0LL;
  }
  if (IORegistryEntryCreateCFProperties(MatchingService, &properties, kCFAllocatorDefault, 0)) {
    return 0LL;
  }
  return properties;
}

- (id)currentValue
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[_DASBatteryTemperatureReader batteryProperties]( &OBJC_CLASS____DASBatteryTemperatureReader,  "batteryProperties"));
  v3 = os_log_create("com.apple.clas", "signals");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000B1B74(v2, v3);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"Temperature"]);
  return v4;
}

- (id)lastModifiedDate
{
  return 0LL;
}

@end
@interface NANDTelemetry_NandCoreAnalyticsDaily
+ (BOOL)shouldCollectNandCounters;
+ (BOOL)shouldRegisterActivity;
- (void)runActivity;
@end

@implementation NANDTelemetry_NandCoreAnalyticsDaily

+ (BOOL)shouldCollectNandCounters
{
  return 1;
}

- (void)runActivity
{
  if (+[NANDTelemetry_NandCoreAnalyticsDaily shouldCollectNandCounters]( &OBJC_CLASS___NANDTelemetry_NandCoreAnalyticsDaily,  "shouldCollectNandCounters"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_Base stateMgr](self, "stateMgr"));
    id v12 = (id)objc_claimAutoreleasedReturnValue([v3 getValueForKey:@"geom_error_payload_cnt"]);

    uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v12, v4) & 1) != 0)
    {
      id v5 = [v12 unsignedIntValue];
    }

    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_Base stateMgr](self, "stateMgr"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", 0LL));
      [v6 saveValue:v7 forKey:@"geom_error_payload_cnt" doPersist:1];

      id v5 = 0LL;
    }

    SetGeomErrorPayloadCnt((uint64_t)v5);
    NandInfoExtractToCA_runAllSteps(0);
    uint64_t GeomErrorPayloadCnt = GetGeomErrorPayloadCnt();
    if (GeomErrorPayloadCnt > v5)
    {
      uint64_t v9 = GeomErrorPayloadCnt;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_Base stateMgr](self, "stateMgr"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v9));
      [v10 saveValue:v11 forKey:@"geom_error_payload_cnt" doPersist:1];
    }
  }

+ (BOOL)shouldRegisterActivity
{
  return 1;
}

@end
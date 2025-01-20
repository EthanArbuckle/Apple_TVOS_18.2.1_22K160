@interface MADContactsPersonProcessingTask
- (void)process;
@end

@implementation MADContactsPersonProcessingTask

- (void)process
{
  if ((int)MediaAnalysisLogLevel(self, a2) >= 3)
  {
    uint64_t v2 = VCPLogInstance();
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    os_log_type_t v4 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v3, v4))
    {
      int v5 = 136315138;
      v6 = "-[MADContactsPersonProcessingTask process]";
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Unimplemented method %s", (uint8_t *)&v5, 0xCu);
    }
  }

@end
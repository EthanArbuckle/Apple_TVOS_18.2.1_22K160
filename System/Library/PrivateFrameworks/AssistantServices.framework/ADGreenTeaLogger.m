@interface ADGreenTeaLogger
- (ADGreenTeaLogger)init;
- (void)dealloc;
- (void)logLocationSend;
@end

@implementation ADGreenTeaLogger

- (ADGreenTeaLogger)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ADGreenTeaLogger;
  v2 = -[ADGreenTeaLogger init](&v4, "init");
  if (v2) {
    v2->_green_tea_logger = (ct_green_tea_logger_s *)ct_green_tea_logger_create("siri");
  }
  return v2;
}

- (void)logLocationSend
{
  green_tea_logger = self->_green_tea_logger;
  if (green_tea_logger)
  {
    uint64_t CTGreenTeaOsLogHandle = getCTGreenTeaOsLogHandle(green_tea_logger, a2);
    objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(CTGreenTeaOsLogHandle);
    v5 = v4;
    if (v4)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Sending location", v6, 2u);
      }
    }
  }

- (void)dealloc
{
  green_tea_logger = self->_green_tea_logger;
  if (green_tea_logger) {
    ct_green_tea_logger_destroy(green_tea_logger, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ADGreenTeaLogger;
  -[ADGreenTeaLogger dealloc](&v4, "dealloc");
}

@end
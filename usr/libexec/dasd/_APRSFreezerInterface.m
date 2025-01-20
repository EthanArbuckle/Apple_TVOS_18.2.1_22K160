@interface _APRSFreezerInterface
+ (id)sharedInstance;
- (OS_os_log)log;
- (_APRSFreezerInterface)init;
- (void)setLog:(id)a3;
@end

@implementation _APRSFreezerInterface

- (_APRSFreezerInterface)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____APRSFreezerInterface;
  v2 = -[_APRSFreezerInterface init](&v6, "init");
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.aprs", "appResume.freezerInterface");
    log = v2->_log;
    v2->_log = v3;
  }

  return v2;
}

+ (id)sharedInstance
{
  if (qword_100157780 != -1) {
    dispatch_once(&qword_100157780, &stru_100115A88);
  }
  return (id)qword_100157778;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
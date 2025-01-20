@interface XPCNotificationObserver
- (void)didChangeEnvironment;
@end

@implementation XPCNotificationObserver

- (void)didChangeEnvironment
{
  if (qword_10002ED68 != -1) {
    swift_once(&qword_10002ED68, sub_10000B078);
  }
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v1 = sub_100004558(v0, (uint64_t)qword_100032790);
  v2 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v3 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  v3,  "XPC observer: didChangeEnvironment, resetting session cache.",  v4,  2u);
    swift_slowDealloc(v4, -1LL, -1LL);
  }

  id v5 = [(id)objc_opt_self(AAURLSession) sharedSession];
  [v5 resetSessionCache];
}

@end
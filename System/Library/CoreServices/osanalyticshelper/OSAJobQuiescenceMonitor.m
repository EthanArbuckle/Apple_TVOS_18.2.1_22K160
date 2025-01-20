@interface OSAJobQuiescenceMonitor
+ (_TtC17osanalyticshelper23OSAJobQuiescenceMonitor)sharedInstance;
- (_TtC17osanalyticshelper23OSAJobQuiescenceMonitor)init;
@end

@implementation OSAJobQuiescenceMonitor

+ (_TtC17osanalyticshelper23OSAJobQuiescenceMonitor)sharedInstance
{
  return (_TtC17osanalyticshelper23OSAJobQuiescenceMonitor *)(id)_s17osanalyticshelper23OSAJobQuiescenceMonitorC14sharedInstanceACSgvgZ_0();
}

- (_TtC17osanalyticshelper23OSAJobQuiescenceMonitor)init
{
  return (_TtC17osanalyticshelper23OSAJobQuiescenceMonitor *)sub_100012F64();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC17osanalyticshelper23OSAJobQuiescenceMonitor_logger;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
}

@end
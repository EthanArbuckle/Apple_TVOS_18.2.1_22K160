@interface PLAnalyticsServiceMaintenance
- (PLAnalyticsServiceMaintenance)init;
- (void)performMaintenanceWithCompletion:(id)a3;
@end

@implementation PLAnalyticsServiceMaintenance

- (void)performMaintenanceWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject(&unk_4178, 24LL, 7LL);
    *(void *)(v5 + 16) = v4;
    v6 = sub_3BE0;
  }

  else
  {
    v6 = 0LL;
    uint64_t v5 = 0LL;
  }

  uint64_t v7 = qword_81E8;
  v12 = self;
  if (v7 != -1) {
    swift_once(&qword_81E8, sub_3B18);
  }
  uint64_t v8 = type metadata accessor for Logger(0LL);
  sub_3B94(v8, (uint64_t)qword_81F0);
  v9 = (os_log_s *)Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)v11 = 0;
    _os_log_impl( &dword_0,  v9,  v10,  "SiriPrivateLearningAnalytics maintenance task disabled for non-iOS devices",  v11,  2u);
    swift_slowDealloc(v11, -1LL, -1LL);
  }

  if (v4)
  {
    v6();
    sub_3BAC((uint64_t)v6, v5);
  }
}

- (PLAnalyticsServiceMaintenance)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AnalyticsServiceMaintenance();
  return -[PLAnalyticsServiceMaintenance init](&v3, "init");
}

@end
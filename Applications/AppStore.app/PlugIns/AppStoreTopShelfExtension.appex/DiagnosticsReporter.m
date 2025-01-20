@interface DiagnosticsReporter
- (void)errorDidOccur:(id)a3;
- (void)incidentsDidOccur:(id)a3;
@end

@implementation DiagnosticsReporter

- (void)errorDidOccur:(id)a3
{
  uint64_t v5 = type metadata accessor for Notification(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  swift_retain(self);
  uint64_t v9 = static RenderPipelineDiagnostics.error(of:)(v8);
  if (v9)
  {
    uint64_t v11 = v9;
    sub_100007180(v9);
    swift_errorRelease(v11);
  }

  swift_release(self, v10);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)incidentsDidOccur:(id)a3
{
  uint64_t v5 = type metadata accessor for Notification(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  swift_retain(self);
  uint64_t v9 = static RenderPipelineDiagnostics.incidents(of:)(v8);
  if (v9)
  {
    uint64_t v11 = v9;
    sub_100007690(v9);
    swift_release(self, v12);
    swift_bridgeObjectRelease(v11);
  }

  else
  {
    swift_release(self, v10);
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

@end
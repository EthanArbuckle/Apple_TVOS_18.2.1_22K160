@interface DiagnosticReportCollectorBridge
+ (id)ExcResourceReportPaths;
- (_TtC15CoreDiagnostics31DiagnosticReportCollectorBridge)init;
@end

@implementation DiagnosticReportCollectorBridge

+ (id)ExcResourceReportPaths
{
  if ((unint64_t)ExcResourceReportPaths()())
  {
    v2 = (void *)sub_189153304();
    swift_bridgeObjectRelease();
  }

  else
  {
    v2 = 0LL;
  }

  return v2;
}

- (_TtC15CoreDiagnostics31DiagnosticReportCollectorBridge)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DiagnosticReportCollectorBridge();
  return -[DiagnosticReportCollectorBridge init](&v3, sel_init);
}

@end
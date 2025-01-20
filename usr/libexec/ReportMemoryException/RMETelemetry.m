@interface RMETelemetry
+ (void)emitTelemetryForExecName:(id)a3 bundleID:(id)a4 exceptionType:(int64_t)a5 footprint:(unint64_t)a6 footprintPeak:(unint64_t)a7 jetsamLimit:(unint64_t)a8 memgraphAttempted:(BOOL)a9 memgraphSkippedReason:(int64_t)a10 memgraphSucceeded:(BOOL)a11 memgraphFailedReason:(int64_t)a12 diagFilePath:(id)a13 isMSLEnabled:(BOOL)a14 isGcoreCapture:(BOOL)a15;
@end

@implementation RMETelemetry

+ (void)emitTelemetryForExecName:(id)a3 bundleID:(id)a4 exceptionType:(int64_t)a5 footprint:(unint64_t)a6 footprintPeak:(unint64_t)a7 jetsamLimit:(unint64_t)a8 memgraphAttempted:(BOOL)a9 memgraphSkippedReason:(int64_t)a10 memgraphSucceeded:(BOOL)a11 memgraphFailedReason:(int64_t)a12 diagFilePath:(id)a13 isMSLEnabled:(BOOL)a14 isGcoreCapture:(BOOL)a15
{
  id v19 = a3;
  id v20 = a4;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100003B58;
  v25[3] = &unk_100010540;
  id v26 = a13;
  id v27 = v19;
  id v28 = v20;
  int64_t v29 = a5;
  unint64_t v30 = a6;
  unint64_t v31 = a7;
  BOOL v35 = a9;
  unint64_t v32 = a8;
  int64_t v33 = a10;
  BOOL v36 = a11;
  int64_t v34 = a12;
  BOOL v37 = a14;
  BOOL v38 = a15;
  id v21 = v20;
  id v22 = v19;
  id v23 = v26;
  AnalyticsSendEventLazy(@"com.apple.ReportMemoryException.memoryException.v2", v25);
}

@end
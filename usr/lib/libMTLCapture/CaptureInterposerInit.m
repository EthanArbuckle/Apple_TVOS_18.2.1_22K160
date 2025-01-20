@interface CaptureInterposerInit
@end

@implementation CaptureInterposerInit

void __CaptureInterposerInit_block_invoke(id a1)
{
  hideMemory = 1;
  GTMTLCaptureEnvironment_init();
  GTMTLTelemetryEnvironment_init();
  s_logUsingOsLog = (qword_23A448 & 0x20000) == 0;
  apr_initialize();
  apr_pool_create_ex(&newpool, 0LL, 0LL, 0LL);
  g_loadURLAsMemHeader = 1;
  g_ctx = GTTraceContext_create();
  CaptureMTLInit(g_ctx, v1);
  CaptureCA(g_ctx);
  GTMTLCaptureManager_init();
  GTCaptureBoundaryTracker_init(g_ctx);
  if (GTTelemetry_init::onceToken != -1) {
    dispatch_once(&GTTelemetry_init::onceToken, &__block_literal_global_10499);
  }
  g_guestAppClientMTL = (uint64_t)GTMTLGuestAppClient_interposeCommonInit();
}

@end
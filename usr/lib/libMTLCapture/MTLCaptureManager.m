@interface MTLCaptureManager
@end

@implementation MTLCaptureManager

void __MTLCaptureManager_sharedCaptureManager_block_invoke(id a1)
{
  v1 = -[CaptureMTLCaptureManager initWithCaptureContext:andIsToolsManager:]( objc_alloc(&OBJC_CLASS___CaptureMTLCaptureManager),  "initWithCaptureContext:andIsToolsManager:",  g_ctx,  0LL);
  v2 = (void *)MTLCaptureManager_sharedCaptureManager_sharedCaptureManager;
  MTLCaptureManager_sharedCaptureManager_sharedCaptureManager = (uint64_t)v1;
}

@end
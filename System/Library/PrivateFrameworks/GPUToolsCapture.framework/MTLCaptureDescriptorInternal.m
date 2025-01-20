@interface MTLCaptureDescriptorInternal
- (BOOL)apiTriggeredCapture;
- (BOOL)ignoreUnusedResources;
- (BOOL)includeBacktrace;
- (BOOL)suspendAfterCapture;
- (BOOL)toolTriggeredCapture;
- (MTLCaptureDescriptorInternal)init;
- (id)completionHandler;
- (unint64_t)captureMode;
- (unint64_t)sessionID;
- (unint64_t)triggerHitsToEnd;
- (unint64_t)triggerHitsToStart;
- (void)setApiTriggeredCapture:(BOOL)a3;
- (void)setCaptureMode:(unint64_t)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setIgnoreUnusedResources:(BOOL)a3;
- (void)setIncludeBacktrace:(BOOL)a3;
- (void)setSessionID:(unint64_t)a3;
- (void)setSuspendAfterCapture:(BOOL)a3;
- (void)setToolTriggeredCapture:(BOOL)a3;
- (void)setTriggerHitsToEnd:(unint64_t)a3;
- (void)setTriggerHitsToStart:(unint64_t)a3;
@end

@implementation MTLCaptureDescriptorInternal

- (MTLCaptureDescriptorInternal)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTLCaptureDescriptorInternal;
  v2 = -[MTLCaptureDescriptorInternal init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->_apiTriggeredCapture = 1;
    v4 = v2;
  }

  return v3;
}

- (unint64_t)sessionID
{
  return self->sessionID;
}

- (void)setSessionID:(unint64_t)a3
{
  self->sessionID = a3;
}

- (unint64_t)captureMode
{
  return self->captureMode;
}

- (void)setCaptureMode:(unint64_t)a3
{
  self->captureMode = a3;
}

- (unint64_t)triggerHitsToStart
{
  return self->triggerHitsToStart;
}

- (void)setTriggerHitsToStart:(unint64_t)a3
{
  self->triggerHitsToStart = a3;
}

- (unint64_t)triggerHitsToEnd
{
  return self->triggerHitsToEnd;
}

- (void)setTriggerHitsToEnd:(unint64_t)a3
{
  self->triggerHitsToEnd = a3;
}

- (BOOL)apiTriggeredCapture
{
  return self->_apiTriggeredCapture;
}

- (void)setApiTriggeredCapture:(BOOL)a3
{
  self->_apiTriggeredCapture = a3;
}

- (BOOL)toolTriggeredCapture
{
  return self->toolTriggeredCapture;
}

- (void)setToolTriggeredCapture:(BOOL)a3
{
  self->toolTriggeredCapture = a3;
}

- (BOOL)ignoreUnusedResources
{
  return self->ignoreUnusedResources;
}

- (void)setIgnoreUnusedResources:(BOOL)a3
{
  self->ignoreUnusedResources = a3;
}

- (BOOL)suspendAfterCapture
{
  return self->suspendAfterCapture;
}

- (void)setSuspendAfterCapture:(BOOL)a3
{
  self->suspendAfterCapture = a3;
}

- (id)completionHandler
{
  return self->completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (BOOL)includeBacktrace
{
  return self->includeBacktrace;
}

- (void)setIncludeBacktrace:(BOOL)a3
{
  self->includeBacktrace = a3;
}

- (void).cxx_destruct
{
}

@end
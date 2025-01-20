@interface _LSUserActivityWasContinuedInfo
- (BOOL)isBrowserFallback;
- (BOOL)isCancelled;
- (BOOL)isFromPairedDevice;
- (BOOL)payloadRequested;
- (BOOL)scheduledForSubmission;
- (BOOL)supportsContinuityStreams;
- (BOOL)webToNative;
- (NSError)error;
- (NSString)activityType;
- (NSString)bundleIdentifier;
- (NSString)remoteDeviceType;
- (double)transferDuration;
- (double)transferSpeed;
- (id)description;
- (unint64_t)interactionType;
- (unint64_t)payloadSize;
- (unint64_t)suggestedActionType;
- (void)setActivityType:(id)a3;
- (void)setBrowserFallback:(BOOL)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setFromPairedDevice:(BOOL)a3;
- (void)setInteractionType:(unint64_t)a3;
- (void)setPayloadRequested:(BOOL)a3;
- (void)setPayloadSize:(unint64_t)a3;
- (void)setRemoteDeviceType:(id)a3;
- (void)setScheduledForSubmission:(BOOL)a3;
- (void)setSuggestedActionType:(unint64_t)a3;
- (void)setSupportsContinuityStreams:(BOOL)a3;
- (void)setTransferDuration:(double)a3;
- (void)setTransferSpeed:(double)a3;
- (void)setWebToNative:(BOOL)a3;
- (void)submit;
@end

@implementation _LSUserActivityWasContinuedInfo

- (void)submit
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_submitted)
  {
    objc_sync_exit(obj);
  }

  else
  {
    obj->_submitted = 1;
    objc_sync_exit(obj);

    objc_autoreleasePoolPop(objc_autoreleasePoolPush());
  }

- (id)description
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS____LSUserActivityWasContinuedInfo;
  id v3 = -[_LSUserActivityWasContinuedInfo description](&v22, "description");
  v21 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[_LSUserActivityWasContinuedInfo bundleIdentifier](self, "bundleIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_LSUserActivityWasContinuedInfo activityType](self, "activityType"));
  if (-[_LSUserActivityWasContinuedInfo isBrowserFallback](self, "isBrowserFallback")) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  unint64_t v6 = -[_LSUserActivityWasContinuedInfo payloadSize](self, "payloadSize");
  -[_LSUserActivityWasContinuedInfo transferSpeed](self, "transferSpeed");
  double v8 = v7;
  -[_LSUserActivityWasContinuedInfo transferDuration](self, "transferDuration");
  uint64_t v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_LSUserActivityWasContinuedInfo error](self, "error"));
  if (-[_LSUserActivityWasContinuedInfo isCancelled](self, "isCancelled")) {
    v12 = @"YES";
  }
  else {
    v12 = @"NO";
  }
  unint64_t v13 = -[_LSUserActivityWasContinuedInfo interactionType](self, "interactionType");
  unsigned int v14 = -[_LSUserActivityWasContinuedInfo webToNative](self, "webToNative");
  unsigned int v15 = -[_LSUserActivityWasContinuedInfo supportsContinuityStreams](self, "supportsContinuityStreams");
  if (v14) {
    v16 = @"YES";
  }
  else {
    v16 = @"NO";
  }
  if (v15) {
    v17 = @"YES";
  }
  else {
    v17 = @"NO";
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@(%@ %@ browserFallback=%@ %ld/%.2fk/%.4f sec %@ %@ %lx w2n=%@ scs=%@)",  v21,  v20,  v4,  v5,  v6,  v8 * 0.0009765625,  v10,  v11,  v12,  v13,  v16,  v17));

  return v18;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)activityType
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setActivityType:(id)a3
{
}

- (unint64_t)suggestedActionType
{
  return self->_suggestedActionType;
}

- (void)setSuggestedActionType:(unint64_t)a3
{
  self->_suggestedActionType = a3;
}

- (BOOL)isFromPairedDevice
{
  return self->_fromPairedDevice;
}

- (void)setFromPairedDevice:(BOOL)a3
{
  self->_fromPairedDevice = a3;
}

- (BOOL)isBrowserFallback
{
  return self->_browserFallback;
}

- (void)setBrowserFallback:(BOOL)a3
{
  self->_browserFallback = a3;
}

- (unint64_t)payloadSize
{
  return self->_payloadSize;
}

- (void)setPayloadSize:(unint64_t)a3
{
  self->_payloadSize = a3;
}

- (double)transferSpeed
{
  return self->_transferSpeed;
}

- (void)setTransferSpeed:(double)a3
{
  self->_transferSpeed = a3;
}

- (double)transferDuration
{
  return self->_transferDuration;
}

- (void)setTransferDuration:(double)a3
{
  self->_transferDuration = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setError:(id)a3
{
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (unint64_t)interactionType
{
  return self->_interactionType;
}

- (void)setInteractionType:(unint64_t)a3
{
  self->_interactionType = a3;
}

- (BOOL)webToNative
{
  return self->_webToNative;
}

- (void)setWebToNative:(BOOL)a3
{
  self->_webToNative = a3;
}

- (BOOL)supportsContinuityStreams
{
  return self->_supportsContinuityStreams;
}

- (void)setSupportsContinuityStreams:(BOOL)a3
{
  self->_supportsContinuityStreams = a3;
}

- (NSString)remoteDeviceType
{
  return (NSString *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setRemoteDeviceType:(id)a3
{
}

- (BOOL)scheduledForSubmission
{
  return self->_scheduledForSubmission;
}

- (void)setScheduledForSubmission:(BOOL)a3
{
  self->_scheduledForSubmission = a3;
}

- (BOOL)payloadRequested
{
  return self->_payloadRequested;
}

- (void)setPayloadRequested:(BOOL)a3
{
  self->_payloadRequested = a3;
}

- (void).cxx_destruct
{
}

@end
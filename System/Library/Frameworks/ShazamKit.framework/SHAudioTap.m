@interface SHAudioTap
- (BOOL)canEnableSpectralOutput;
- (NSString)bundleIdentifier;
- (SHAudioTap)initWithRecordingSource:(int64_t)a3 client:(int64_t)a4 bundleIdentifier:(id)a5;
- (SHAudioTap)initWithRecordingSource:(int64_t)a3 client:(int64_t)a4 bundleIdentifier:(id)a5 canEnableSpectralOutput:(BOOL)a6;
- (id)completion;
- (int64_t)client;
- (int64_t)recordingSource;
- (void)setCompletion:(id)a3;
@end

@implementation SHAudioTap

- (SHAudioTap)initWithRecordingSource:(int64_t)a3 client:(int64_t)a4 bundleIdentifier:(id)a5
{
  return -[SHAudioTap initWithRecordingSource:client:bundleIdentifier:canEnableSpectralOutput:]( self,  "initWithRecordingSource:client:bundleIdentifier:canEnableSpectralOutput:",  a3,  a4,  a5,  0LL);
}

- (SHAudioTap)initWithRecordingSource:(int64_t)a3 client:(int64_t)a4 bundleIdentifier:(id)a5 canEnableSpectralOutput:(BOOL)a6
{
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SHAudioTap;
  v12 = -[SHAudioTap init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    v12->_recordingSource = a3;
    v12->_client = a4;
    objc_storeStrong((id *)&v12->_bundleIdentifier, a5);
    v13->_canEnableSpectralOutput = a6;
  }

  return v13;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (int64_t)recordingSource
{
  return self->_recordingSource;
}

- (int64_t)client
{
  return self->_client;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)canEnableSpectralOutput
{
  return self->_canEnableSpectralOutput;
}

- (void).cxx_destruct
{
}

@end
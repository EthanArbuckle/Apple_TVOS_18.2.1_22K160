@interface RMAudioListenerPoseProviderConfiguration
- (BOOL)forceSessionRestart;
- (NSDictionary)tempestOptions;
- (NSUUID)identifier;
- (RMAudioListenerPoseProviderConfiguration)initWithUniqueIdentifier:(id)a3 tempestOptions:(id)a4 forceSessionRestart:(BOOL)a5;
- (void)setForceSessionRestart:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setTempestOptions:(id)a3;
@end

@implementation RMAudioListenerPoseProviderConfiguration

- (RMAudioListenerPoseProviderConfiguration)initWithUniqueIdentifier:(id)a3 tempestOptions:(id)a4 forceSessionRestart:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___RMAudioListenerPoseProviderConfiguration;
  v10 = -[RMAudioListenerPoseProviderConfiguration init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    -[RMAudioListenerPoseProviderConfiguration setIdentifier:](v10, "setIdentifier:", v8);
    -[RMAudioListenerPoseProviderConfiguration setTempestOptions:](v11, "setTempestOptions:", v9);
    -[RMAudioListenerPoseProviderConfiguration setForceSessionRestart:](v11, "setForceSessionRestart:", v5);
  }

  return v11;
}

- (NSDictionary)tempestOptions
{
  return self->_tempestOptions;
}

- (void)setTempestOptions:(id)a3
{
}

- (BOOL)forceSessionRestart
{
  return self->_forceSessionRestart;
}

- (void)setForceSessionRestart:(BOOL)a3
{
  self->_forceSessionRestart = a3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
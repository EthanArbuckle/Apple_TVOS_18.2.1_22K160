@interface SecExperimentConfig
- (BOOL)isSampled;
- (BOOL)shouldRunWithSamplingRate:(id)a3;
- (NSDictionary)config;
- (NSDictionary)configurationData;
- (NSString)identifier;
- (SecExperimentConfig)initWithConfiguration:(id)a3;
- (unsigned)deviceSampleRate;
- (unsigned)fleetSampleRate;
- (unsigned)hostHash;
- (void)setConfig:(id)a3;
- (void)setConfigurationData:(id)a3;
- (void)setDeviceSampleRate:(unsigned int)a3;
- (void)setFleetSampleRate:(unsigned int)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation SecExperimentConfig

- (SecExperimentConfig)initWithConfiguration:(id)a3
{
  id v4 = a3;
  if (v4
    && (v14.receiver = self,
        v14.super_class = (Class)&OBJC_CLASS___SecExperimentConfig,
        v5 = -[SecExperimentConfig init](&v14, sel_init),
        (self = v5) != 0LL))
  {
    -[SecExperimentConfig setConfig:](v5, "setConfig:", v4);
    [v4 objectForKey:@"ExpName"];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SecExperimentConfig setIdentifier:](self, "setIdentifier:", v6);

    [v4 objectForKey:@"DeviceSampleRate"];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7) {
      -[SecExperimentConfig setDeviceSampleRate:](self, "setDeviceSampleRate:", [v7 unsignedIntValue]);
    }
    [v4 objectForKey:@"FleetSampleRate"];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9) {
      -[SecExperimentConfig setFleetSampleRate:](self, "setFleetSampleRate:", [v9 unsignedIntValue]);
    }
    [v4 objectForKey:@"ConfigData"];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SecExperimentConfig setConfigurationData:](self, "setConfigurationData:", v11);

    self = self;
    v12 = self;
  }

  else
  {
    v12 = 0LL;
  }

  return v12;
}

- (unsigned)hostHash
{
  if (sec_experiment_host_hash_onceToken != -1) {
    dispatch_once(&sec_experiment_host_hash_onceToken, &__block_literal_global);
  }
  return sec_experiment_host_hash_hash;
}

- (BOOL)shouldRunWithSamplingRate:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = a3;
  float v4 = (float)arc4random();
  unint64_t v5 = [v3 unsignedIntegerValue];

  return (float)(4295000000.0 / (float)v5) > v4;
}

- (BOOL)isSampled
{
  unsigned int v3 = -[SecExperimentConfig hostHash](self, "hostHash");
  if (!v3 || -[SecExperimentConfig fleetSampleRate](self, "fleetSampleRate") < v3) {
    return 0;
  }
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  -[SecExperimentConfig deviceSampleRate](self, "deviceSampleRate"));
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v6 = -[SecExperimentConfig shouldRunWithSamplingRate:](self, "shouldRunWithSamplingRate:", v5);

  return v6;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (unsigned)fleetSampleRate
{
  return self->_fleetSampleRate;
}

- (void)setFleetSampleRate:(unsigned int)a3
{
  self->_fleetSampleRate = a3;
}

- (unsigned)deviceSampleRate
{
  return self->_deviceSampleRate;
}

- (void)setDeviceSampleRate:(unsigned int)a3
{
  self->_deviceSampleRate = a3;
}

- (NSDictionary)configurationData
{
  return (NSDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setConfigurationData:(id)a3
{
}

- (NSDictionary)config
{
  return (NSDictionary *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setConfig:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
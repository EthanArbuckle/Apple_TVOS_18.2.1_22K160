@interface SecExperiment
- (BOOL)experimentIsAllowedForProcess;
- (BOOL)isSamplingDisabled;
- (BOOL)isSamplingDisabledWithDefault:(BOOL)a3;
- (BOOL)samplingDisabled;
- (NSString)identifier;
- (NSString)name;
- (SecExperiment)initWithName:(const char *)a3;
- (SecExperimentConfig)cachedConfig;
- (id)copyExperimentConfiguration;
- (id)copyExperimentConfigurationFromUserDefaults;
- (id)copyRandomExperimentConfigurationFromAsset:(id)a3;
- (id)copyRemoteExperimentAsset;
- (void)setCachedConfig:(id)a3;
- (void)setName:(id)a3;
- (void)setSamplingDisabled:(BOOL)a3;
@end

@implementation SecExperiment

- (SecExperiment)initWithName:(const char *)a3
{
  v3 = (SecExperiment *)a3;
  if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___SecExperiment;
    self = -[SecExperiment init](&v7, sel_init);
    if (self)
    {
      v4 = self;
      [NSString stringWithUTF8String:v3];
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SecExperiment setName:](v4, "setName:", v5);

      self = v4;
      v3 = self;
    }

    else
    {
      v3 = 0LL;
    }
  }

  return v3;
}

- (BOOL)experimentIsAllowedForProcess
{
  v5[0] = 0LL;
  v5[1] = v5;
  v5[2] = 0x3032000000LL;
  v5[3] = __Block_byref_object_copy_;
  v5[4] = __Block_byref_object_dispose_;
  id v6 = &unk_18969C000;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __46__SecExperiment_experimentIsAllowedForProcess__block_invoke;
  block[3] = &unk_1896734F0;
  block[4] = v5;
  if (experimentIsAllowedForProcess_onceToken != -1) {
    dispatch_once(&experimentIsAllowedForProcess_onceToken, block);
  }
  char v2 = experimentIsAllowedForProcess_isAllowed;
  _Block_object_dispose(v5, 8);

  return v2;
}

- (BOOL)isSamplingDisabledWithDefault:(BOOL)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    [NSString stringWithUTF8String:kSecExperimentDefaultsDomain];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 persistentDomainForName:v5];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_super v7 = (void *)[v6 mutableCopy];

    if (v7)
    {
      [NSString stringWithUTF8String:"disableSampling"];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 objectForKeyedSubscript:v8];
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        [v7 objectForKeyedSubscript:v8];
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        a3 = [v10 BOOLValue];
      }
    }
  }

  return a3;
}

- (BOOL)isSamplingDisabled
{
  return -[SecExperiment isSamplingDisabledWithDefault:]( self,  "isSamplingDisabledWithDefault:",  -[SecExperiment samplingDisabled](self, "samplingDisabled"));
}

- (id)copyExperimentConfigurationFromUserDefaults
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    [NSString stringWithUTF8String:kSecExperimentDefaultsDomain];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 persistentDomainForName:v4];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    id v6 = (void *)[v5 mutableCopy];

    if (v6)
    {
      -[SecExperiment name](self, "name");
      objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 objectForKeyedSubscript:v7];
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        [v6 objectForKeyedSubscript:v7];
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }

    else
    {
      v8 = 0LL;
    }
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (id)copyRemoteExperimentAsset
{
  CFTypeRef cf = 0LL;
  v3 = (void *)SecTrustOTASecExperimentCopyAsset(&cf);
  if (v3)
  {
    v4 = -[SecExperiment name](self, "name");
    [v3 valueForKey:v4];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v5 = 0LL;
  }

  CFTypeRef v6 = cf;
  if (cf)
  {
    CFTypeRef cf = 0LL;
    CFRelease(v6);
  }

  return v5;
}

- (id)copyRandomExperimentConfigurationFromAsset:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v3, "objectAtIndex:", arc4random() % (unint64_t)objc_msgSend(v3, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v4 = 0LL;
  }

  return v4;
}

- (id)copyExperimentConfiguration
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SecExperiment cachedConfig](self, "cachedConfig");
    return (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v5 = -[SecExperiment copyExperimentConfigurationFromUserDefaults]( self,  "copyExperimentConfigurationFromUserDefaults");
    if (v5)
    {
      CFTypeRef v6 = -[SecExperimentConfig initWithConfiguration:]( objc_alloc(&OBJC_CLASS___SecExperimentConfig),  "initWithConfiguration:",  v5);
      -[SecExperiment setCachedConfig:](self, "setCachedConfig:", v6);
      v4 = -[SecExperiment cachedConfig](self, "cachedConfig");
    }

    else
    {
      id v7 = -[SecExperiment copyRemoteExperimentAsset](self, "copyRemoteExperimentAsset");
      if (v7)
      {
        id v8 = -[SecExperiment copyRandomExperimentConfigurationFromAsset:]( self,  "copyRandomExperimentConfigurationFromAsset:",  v7);
        v9 = -[SecExperimentConfig initWithConfiguration:]( objc_alloc(&OBJC_CLASS___SecExperimentConfig),  "initWithConfiguration:",  v8);
        -[SecExperiment setCachedConfig:](self, "setCachedConfig:", v9);
        v4 = -[SecExperiment cachedConfig](self, "cachedConfig");
      }

      else
      {
        v4 = 0LL;
      }
    }
  }

  return v4;
}

- (NSString)identifier
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[SecExperiment cachedConfig](self, "cachedConfig");
    [v4 identifier];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v5 = 0LL;
  }

  return (NSString *)v5;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setName:(id)a3
{
}

- (BOOL)samplingDisabled
{
  return self->_samplingDisabled;
}

- (void)setSamplingDisabled:(BOOL)a3
{
  self->_samplingDisabled = a3;
}

- (SecExperimentConfig)cachedConfig
{
  return (SecExperimentConfig *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setCachedConfig:(id)a3
{
}

- (void).cxx_destruct
{
}

void __46__SecExperiment_experimentIsAllowedForProcess__block_invoke()
{
}

uint64_t __46__SecExperiment_experimentIsAllowedForProcess__block_invoke_2( uint64_t a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  uint64_t result = [a2 isEqualToString:*(void *)(a1 + 32)];
  if ((_DWORD)result)
  {
    experimentIsAllowedForProcess_isAllowed = 1;
    *a4 = 1;
  }

  return result;
}

@end
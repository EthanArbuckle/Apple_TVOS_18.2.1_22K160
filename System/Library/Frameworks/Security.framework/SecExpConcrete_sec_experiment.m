@interface SecExpConcrete_sec_experiment
- (BOOL)experimentIsAllowedForProcess;
- (BOOL)isSamplingDisabled;
- (BOOL)isSamplingDisabledWithDefault:(BOOL)a3;
- (SecExpConcrete_sec_experiment)initWithInnerExperiment:(id)a3;
- (SecExpConcrete_sec_experiment)initWithName:(const char *)a3;
- (const)identifier;
- (const)name;
- (id)copyExperimentConfiguration;
@end

@implementation SecExpConcrete_sec_experiment

- (SecExpConcrete_sec_experiment)initWithName:(const char *)a3
{
  v3 = (SecExpConcrete_sec_experiment *)a3;
  if (a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___SecExpConcrete_sec_experiment;
    self = -[SecExpConcrete_sec_experiment init](&v8, sel_init);
    if (self)
    {
      v4 = self;
      v5 = -[SecExperiment initWithName:](objc_alloc(&OBJC_CLASS___SecExperiment), "initWithName:", v3);
      innerExperiment = v4->innerExperiment;
      v4->innerExperiment = v5;

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

- (SecExpConcrete_sec_experiment)initWithInnerExperiment:(id)a3
{
  id v5 = a3;
  if (v5
    && (v9.receiver = self,
        v9.super_class = (Class)&OBJC_CLASS___SecExpConcrete_sec_experiment,
        v6 = -[SecExpConcrete_sec_experiment init](&v9, sel_init),
        (self = v6) != 0LL))
  {
    objc_storeStrong((id *)&v6->innerExperiment, a3);
    self = self;
    v7 = self;
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

- (const)name
{
  id v2 = -[SecExperiment name](self->innerExperiment, "name");
  v3 = (const char *)[v2 UTF8String];

  return v3;
}

- (const)identifier
{
  id v2 = -[SecExperiment identifier](self->innerExperiment, "identifier");
  v3 = (const char *)[v2 UTF8String];

  return v3;
}

- (BOOL)experimentIsAllowedForProcess
{
  return -[SecExperiment experimentIsAllowedForProcess](self->innerExperiment, "experimentIsAllowedForProcess");
}

- (BOOL)isSamplingDisabledWithDefault:(BOOL)a3
{
  return -[SecExperiment isSamplingDisabledWithDefault:](self->innerExperiment, "isSamplingDisabledWithDefault:", a3);
}

- (BOOL)isSamplingDisabled
{
  return -[SecExperiment isSamplingDisabled](self->innerExperiment, "isSamplingDisabled");
}

- (id)copyExperimentConfiguration
{
  return -[SecExperiment copyExperimentConfiguration](self->innerExperiment, "copyExperimentConfiguration");
}

- (void).cxx_destruct
{
}

@end
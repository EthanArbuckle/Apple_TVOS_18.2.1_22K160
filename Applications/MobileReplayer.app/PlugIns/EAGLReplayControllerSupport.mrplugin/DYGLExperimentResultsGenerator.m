@interface DYGLExperimentResultsGenerator
- (void)begin;
- (void)end;
- (void)onGraphicsFunctionEnd;
- (void)onPlatformFunctionEnd;
- (void)startTiming;
- (void)stopTiming;
@end

@implementation DYGLExperimentResultsGenerator

- (void)startTiming
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLExperimentResultsGenerator functionPlayer](self, "functionPlayer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLExperimentResultsGenerator experiment](self, "experiment"));
  unsigned int v5 = [v4 enableExperimentFinish];

  if (v5) {
    (*((void (**)(id))[v3 gliDispatch] + 89))(objc_msgSend(v3, "gliContext"));
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DYGLExperimentResultsGenerator;
  -[DYGLExperimentResultsGenerator startTiming](&v6, "startTiming");
}

- (void)stopTiming
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLExperimentResultsGenerator functionPlayer](self, "functionPlayer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLExperimentResultsGenerator experiment](self, "experiment"));
  unsigned int v5 = [v4 enableExperimentFinish];

  if (v5) {
    (*((void (**)(id))[v3 gliDispatch] + 89))(objc_msgSend(v3, "gliContext"));
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DYGLExperimentResultsGenerator;
  -[DYGLExperimentResultsGenerator stopTiming](&v6, "stopTiming");
}

- (void)begin
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___DYGLExperimentResultsGenerator;
  -[DYGLExperimentResultsGenerator begin](&v19, "begin");
  v3 = (NSMutableArray *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v2);
  overrides = self->_overrides;
  self->_overrides = v3;

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLExperimentResultsGenerator functionPlayer](self, "functionPlayer"));
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLExperimentResultsGenerator experiment](self, "experiment"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 overrideTypeStrings]);

  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    uint64_t v10 = kDYFunctionPlayerOverrideDisablePresentKey;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if ([v12 isEqualToString:v10])
        {
          DYDisableBufferSwaps(1LL);
          v13 = 0LL;
        }

        else
        {
          v13 = -[DYEAGLFunctionPlayerOverride initWithFunctionPlayer:overrideKey:]( objc_alloc(&OBJC_CLASS___DYEAGLFunctionPlayerOverride),  "initWithFunctionPlayer:overrideKey:",  v5,  v12);
          if (v13) {
            -[NSMutableArray addObject:](self->_overrides, "addObject:", v13);
          }
        }
      }

      id v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }

    while (v8);
  }
}

- (void)end
{
  overrides = self->_overrides;
  self->_overrides = 0LL;

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DYGLExperimentResultsGenerator;
  -[DYGLExperimentResultsGenerator end](&v4, "end");
}

- (void)onGraphicsFunctionEnd
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLExperimentResultsGenerator experiment](self, "experiment"));
  unsigned __int8 v4 = [v3 profilingFlags];

  if ((v4 & 0x40) != 0)
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLExperimentResultsGenerator functionPlayer](self, "functionPlayer"));
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 context]);
    DYAddPerFunctionProfilingData(v6, [v5 ctxID], objc_msgSend(v5, "currentFileFunctionIndex"));
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___DYGLExperimentResultsGenerator;
  -[DYGLExperimentResultsGenerator onGraphicsFunctionEnd](&v7, "onGraphicsFunctionEnd");
}

- (void)onPlatformFunctionEnd
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v3 = self->_overrides;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v4)
  {
    uint64_t v5 = *(void *)v14;
    do
    {
      objc_super v6 = 0LL;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v6) onPlatformFunctionEnd];
        objc_super v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v4);
  }

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLExperimentResultsGenerator experiment](self, "experiment"));
  BOOL v8 = ((unint64_t)[v7 profilingFlags] & 0x40) == 0;

  if (!v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLExperimentResultsGenerator functionPlayer](self, "functionPlayer"));
    unsigned int v10 = -[DYGLExperimentResultsGenerator prevFileFunctionIndex](self, "prevFileFunctionIndex");
    if (v10 != [v9 currentFileFunctionIndex])
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v9 context]);
      DYAddPerFunctionProfilingData(v11, [v9 ctxID], objc_msgSend(v9, "currentFileFunctionIndex"));
    }
  }

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___DYGLExperimentResultsGenerator;
  -[DYGLExperimentResultsGenerator onPlatformFunctionEnd](&v12, "onPlatformFunctionEnd");
}

- (void).cxx_destruct
{
}

@end
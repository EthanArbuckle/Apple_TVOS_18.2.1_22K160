@interface GTMutableShaderProfilerStreamData
+ (id)dataFromArchivedDataURL:(id)a3;
- (BOOL)addAPSCounterData:(id)a3;
- (BOOL)addAPSData:(id)a3;
- (BOOL)addAPSTimelineData:(id)a3;
- (BOOL)addBatchIdFilteredCounterData:(id)a3;
- (BOOL)addGPUTimelineData:(id)a3;
- (BOOL)addShaderProfilerData:(id)a3;
- (GTMutableShaderProfilerStreamData)init;
- (GTMutableShaderProfilerStreamData)initWithNewFileFormatV2Support:(BOOL)a3;
- (id)_copyForAddAPSData:(id)a3 prefix:(id)a4;
- (unint64_t)addString:(id)a3;
- (void)_commonInit;
- (void)addCommandBuffers:(id *)a3 count:(unint64_t)a4;
- (void)addEncoders:(id *)a3 count:(unint64_t)a4;
- (void)addGPUCommands:(id *)a3 count:(unint64_t)a4;
- (void)addPipelineStates:(id *)a3 count:(unint64_t)a4;
- (void)addShaderFunctionInfo:(id *)a3 count:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)removeAPSCounterData;
- (void)removeAPSData;
- (void)removeAPSTimelineData;
- (void)setBatchIdFilterableCounters:(id)a3;
- (void)setDataSourceHasUnusedResources:(BOOL)a3 captureRange:(_NSRange)a4;
- (void)setNumBlitCalls:(unint64_t)a3;
@end

@implementation GTMutableShaderProfilerStreamData

- (GTMutableShaderProfilerStreamData)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___GTMutableShaderProfilerStreamData;
  v2 = -[GTShaderProfilerStreamData initWithNewFileFormatV2Support:](&v5, "initWithNewFileFormatV2Support:", 0LL);
  v3 = v2;
  if (v2) {
    -[GTMutableShaderProfilerStreamData _commonInit](v2, "_commonInit");
  }
  return v3;
}

- (GTMutableShaderProfilerStreamData)initWithNewFileFormatV2Support:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___GTMutableShaderProfilerStreamData;
  v3 = -[GTShaderProfilerStreamData initWithNewFileFormatV2Support:](&v6, "initWithNewFileFormatV2Support:", a3);
  v4 = v3;
  if (v3) {
    -[GTMutableShaderProfilerStreamData _commonInit](v3, "_commonInit");
  }
  return v4;
}

- (void)_commonInit
{
  v3 = (NSMutableData *)objc_opt_new(&OBJC_CLASS___NSMutableData, a2);
  gpuCommandInfoData = self->super._gpuCommandInfoData;
  self->super._gpuCommandInfoData = v3;

  objc_super v6 = (NSMutableData *)objc_opt_new(&OBJC_CLASS___NSMutableData, v5);
  encoderInfoData = self->super._encoderInfoData;
  self->super._encoderInfoData = v6;

  v9 = (NSMutableData *)objc_opt_new(&OBJC_CLASS___NSMutableData, v8);
  pipelineStateInfoData = self->super._pipelineStateInfoData;
  self->super._pipelineStateInfoData = v9;

  v12 = (NSMutableData *)objc_opt_new(&OBJC_CLASS___NSMutableData, v11);
  commandBufferInfoData = self->super._commandBufferInfoData;
  self->super._commandBufferInfoData = v12;

  v15 = (NSMutableArray *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v14);
  archivedShaderProfilerData = self->super._archivedShaderProfilerData;
  self->super._archivedShaderProfilerData = v15;

  v18 = (NSMutableArray *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v17);
  archivedGPUTimelineData = self->super._archivedGPUTimelineData;
  self->super._archivedGPUTimelineData = v18;

  v21 = (NSMutableArray *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v20);
  archivedBatchIdFilteredCounterData = self->super._archivedBatchIdFilteredCounterData;
  self->super._archivedBatchIdFilteredCounterData = v21;

  v24 = (NSMutableArray *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v23);
  archivedAPSData = self->super._archivedAPSData;
  self->super._archivedAPSData = v24;

  v27 = (NSMutableArray *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v26);
  archivedAPSCounterData = self->super._archivedAPSCounterData;
  self->super._archivedAPSCounterData = v27;

  v30 = (NSMutableArray *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v29);
  archivedAPSTimelineData = self->super._archivedAPSTimelineData;
  self->super._archivedAPSTimelineData = v30;

  v33 = (NSMutableData *)objc_opt_new(&OBJC_CLASS___NSMutableData, v32);
  functionInfoData = self->super._functionInfoData;
  self->super._functionInfoData = v33;

  v36 = (NSMutableArray *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v35);
  strings = self->super._strings;
  self->super._strings = v36;

  v39 = (NSMutableDictionary *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v38);
  stringDict = self->super._stringDict;
  self->super._stringDict = v39;

  v42 = (NSLock *)objc_opt_new(&OBJC_CLASS___NSLock, v41);
  addLock = self->_addLock;
  self->_addLock = v42;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GTMutableShaderProfilerStreamData;
  -[GTShaderProfilerStreamData encodeWithCoder:](&v3, "encodeWithCoder:", a3);
}

- (void)addGPUCommands:(id *)a3 count:(unint64_t)a4
{
  gpuCommandInfoData = self->super._gpuCommandInfoData;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", a3, 32 * a4));
  -[NSMutableData appendData:](gpuCommandInfoData, "appendData:", v5);
}

- (void)addEncoders:(id *)a3 count:(unint64_t)a4
{
  encoderInfoData = self->super._encoderInfoData;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", a3, 40 * a4));
  -[NSMutableData appendData:](encoderInfoData, "appendData:", v5);
}

- (void)addPipelineStates:(id *)a3 count:(unint64_t)a4
{
  pipelineStateInfoData = self->super._pipelineStateInfoData;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", a3, 40 * a4));
  -[NSMutableData appendData:](pipelineStateInfoData, "appendData:", v5);
}

- (void)addCommandBuffers:(id *)a3 count:(unint64_t)a4
{
  commandBufferInfoData = self->super._commandBufferInfoData;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", a3, 32 * a4));
  -[NSMutableData appendData:](commandBufferInfoData, "appendData:", v5);
}

- (void)addShaderFunctionInfo:(id *)a3 count:(unint64_t)a4
{
  functionInfoData = self->super._functionInfoData;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", a3, 48 * a4));
  -[NSMutableData appendData:](functionInfoData, "appendData:", v5);
}

- (void)setNumBlitCalls:(unint64_t)a3
{
  self->super._blitCallCount = a3;
}

- (void)setDataSourceHasUnusedResources:(BOOL)a3 captureRange:(_NSRange)a4
{
  self->super._dataSourceHasUnusedResources = a3;
  self->super._captureRange = a4;
}

- (BOOL)addShaderProfilerData:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v8 = 0LL;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  a3,  1LL,  &v8));
  id v5 = v8;
  BOOL v6 = v5 == 0LL;
  if (!v5)
  {
    -[NSLock lock](self->_addLock, "lock");
    -[NSMutableArray addObject:](self->super._archivedShaderProfilerData, "addObject:", v4);
    -[NSLock unlock](self->_addLock, "unlock");
  }

  return v6;
}

- (BOOL)addGPUTimelineData:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v8 = 0LL;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  a3,  1LL,  &v8));
  id v5 = v8;
  BOOL v6 = v5 == 0LL;
  if (!v5)
  {
    -[NSLock lock](self->_addLock, "lock");
    -[NSMutableArray addObject:](self->super._archivedGPUTimelineData, "addObject:", v4);
    -[NSLock unlock](self->_addLock, "unlock");
  }

  return v6;
}

- (id)_copyForAddAPSData:(id)a3 prefix:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData _setupDataPath](self, "_setupDataPath"));
  id v9 = [v7 mutableCopy];

  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"ShaderProfilerData"]);
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = v10;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( NSData,  "dataWithBytes:length:",  [v12 bytes],  objc_msgSend(v12, "length")));
    [v9 setObject:v13 forKeyedSubscript:@"ShaderProfilerData"];
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"APSTraceDataFile"]);
  v15 = v14;
  if (!v14) {
    goto LABEL_10;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue([v14 lastPathComponent]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingString:v16]);

  v18 = (void *)objc_claimAutoreleasedReturnValue([v8 URLByAppendingPathComponent:v17]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 path]);

  uint64_t v20 = -[GTShaderProfilerStreamData supportsFileFormatV2](self, "supportsFileFormatV2") ? v17 : v19;
  [v9 setObject:v20 forKeyedSubscript:@"APSTraceDataFile"];
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v22 = [v21 fileExistsAtPath:v19];

  if (v22)
  {
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    [v23 removeItemAtPath:v19 error:0];
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v28 = 0LL;
  [v24 copyItemAtPath:v15 toPath:v19 error:&v28];
  uint64_t v25 = v28;

  id v26 = 0LL;
  if (!v25) {
LABEL_10:
  }
    id v26 = v9;

  return v26;
}

- (BOOL)addAPSData:(id)a3
{
  id v4 = a3;
  -[NSLock lock](self->_addLock, "lock");
  if (self->super._tempAPSData)
  {
    if (v4) {
      goto LABEL_3;
    }
LABEL_6:
    LOBYTE(v6) = 0;
    goto LABEL_7;
  }

  id v7 = (NSMutableArray *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v5);
  tempAPSData = self->super._tempAPSData;
  self->super._tempAPSData = v7;

  if (!v4) {
    goto LABEL_6;
  }
LABEL_3:
  id v6 = -[GTMutableShaderProfilerStreamData _copyForAddAPSData:prefix:]( self,  "_copyForAddAPSData:prefix:",  v4,  @"Profiling_");
  if (v6)
  {
    -[NSMutableArray addObject:](self->super._tempAPSData, "addObject:", v6);

    LOBYTE(v6) = 1;
  }

- (BOOL)addAPSTimelineData:(id)a3
{
  id v4 = a3;
  -[NSLock lock](self->_addLock, "lock");
  if (self->super._tempAPSTimelineData)
  {
    if (v4) {
      goto LABEL_3;
    }
LABEL_6:
    LOBYTE(v6) = 0;
    goto LABEL_7;
  }

  id v7 = (NSMutableArray *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v5);
  tempAPSTimelineData = self->super._tempAPSTimelineData;
  self->super._tempAPSTimelineData = v7;

  if (!v4) {
    goto LABEL_6;
  }
LABEL_3:
  id v6 = -[GTMutableShaderProfilerStreamData _copyForAddAPSData:prefix:]( self,  "_copyForAddAPSData:prefix:",  v4,  @"Timeline_");
  if (v6)
  {
    -[NSMutableArray addObject:](self->super._tempAPSTimelineData, "addObject:", v6);

    LOBYTE(v6) = 1;
  }

- (BOOL)addAPSCounterData:(id)a3
{
  id v4 = a3;
  -[NSLock lock](self->_addLock, "lock");
  if (self->super._tempAPSCounterData)
  {
    if (v4) {
      goto LABEL_3;
    }
LABEL_6:
    LOBYTE(v6) = 0;
    goto LABEL_7;
  }

  id v7 = (NSMutableArray *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v5);
  tempAPSCounterData = self->super._tempAPSCounterData;
  self->super._tempAPSCounterData = v7;

  if (!v4) {
    goto LABEL_6;
  }
LABEL_3:
  id v6 = -[GTMutableShaderProfilerStreamData _copyForAddAPSData:prefix:]( self,  "_copyForAddAPSData:prefix:",  v4,  @"Counters_");
  if (v6)
  {
    -[NSMutableArray addObject:](self->super._tempAPSCounterData, "addObject:", v6);

    LOBYTE(v6) = 1;
  }

- (void)removeAPSData
{
}

- (void)removeAPSTimelineData
{
}

- (void)removeAPSCounterData
{
}

- (BOOL)addBatchIdFilteredCounterData:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v9 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  a3,  1LL,  &v9));
  id v5 = v9;
  id v6 = v5;
  BOOL v7 = v5 == 0LL;
  if (v5)
  {
    NSLog(@"%@", v5);
  }

  else
  {
    -[NSLock lock](self->_addLock, "lock");
    -[NSMutableArray addObject:](self->super._archivedBatchIdFilteredCounterData, "addObject:", v4);
    -[NSLock unlock](self->_addLock, "unlock");
  }

  return v7;
}

- (void)setBatchIdFilterableCounters:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  batchIdFilterableCounters = self->super._batchIdFilterableCounters;
  self->super._batchIdFilterableCounters = v4;
}

- (unint64_t)addString:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->super._stringDict,  "objectForKeyedSubscript:",  v4));
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 unsignedIntegerValue];
  }

  else
  {
    id v7 = -[NSMutableArray count](self->super._strings, "count");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v7));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._stringDict, "setObject:forKeyedSubscript:", v8, v4);

    -[NSMutableArray addObject:](self->super._strings, "addObject:", v4);
  }

  return (unint64_t)v7;
}

- (void).cxx_destruct
{
}

+ (id)dataFromArchivedDataURL:(id)a3
{
  id v14 = 0LL;
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  a3,  0LL,  &v14));
  id v4 = v14;
  if (v4)
  {
    id v6 = v4;
    id v7 = 0LL;
  }

  else
  {
    id v13 = 0LL;
    id v8 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___GTMutableShaderProfilerStreamData, v5),  v3,  &v13);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v6 = v13;
    uint64_t v10 = objc_opt_new(&OBJC_CLASS___NSLock, v9);
    uint64_t v11 = (void *)v7[35];
    v7[35] = v10;

    v7[1] = 4LL;
  }

  return v7;
}

@end
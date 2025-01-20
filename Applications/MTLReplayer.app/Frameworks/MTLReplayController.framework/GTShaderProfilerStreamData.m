@interface GTShaderProfilerStreamData
+ (BOOL)supportsSecureCoding;
+ (id)dataFromArchivedDataURL:(id)a3;
+ (id)steamDataFromData:(id)a3;
+ (id)streamDataClasses;
- (BOOL)dataSourceHasUnusedResources;
- (BOOL)supportsFileFormatV2;
- (GTShaderProfilerStreamData)init;
- (GTShaderProfilerStreamData)initWithCoder:(id)a3;
- (GTShaderProfilerStreamData)initWithNewFileFormatV2Support:(BOOL)a3;
- (NSArray)archivedAPSCounterData;
- (NSArray)archivedAPSData;
- (NSArray)archivedAPSTimelineData;
- (NSArray)archivedBatchIdFilteredCounterData;
- (NSArray)archivedGPUTimelineData;
- (NSArray)archivedShaderProfilerData;
- (NSArray)batchIdFilterableCounters;
- (NSArray)strings;
- (NSArray)unarchivedAPSCounterData;
- (NSArray)unarchivedAPSData;
- (NSArray)unarchivedAPSTimelineData;
- (NSArray)unarchivedBatchIdFilteredCounterData;
- (NSArray)unarchivedGPUTimelineData;
- (NSArray)unarchivedShaderProfilerData;
- (NSData)commandBufferInfoData;
- (NSData)encoderInfoData;
- (NSData)functionInfoData;
- (NSData)gpuCommandInfoData;
- (NSData)pipelineStateInfoData;
- (NSString)metalPluginName;
- (NSString)traceName;
- (_NSRange)dataSourceCaptureRange;
- (const)GPUCommandInfoFromFunctionIndex:(unsigned int)a3 subCommandIndex:(int)a4;
- (const)commandBuffers;
- (const)encoderInfoFromFunctionIndex:(unsigned int)a3;
- (const)encoders;
- (const)functionInfo;
- (const)gpuCommands;
- (const)pipelineStates;
- (id)_setupDataPath;
- (id)_unarchiveAndPatchAPSData:(id)a3 apsData:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)encode:(id)a3 error:(id *)a4;
- (id)patchLocalFileData:(id)a3;
- (unint64_t)blitCallCount;
- (unint64_t)commandBufferInfoCount;
- (unint64_t)encoderInfoCount;
- (unint64_t)functionInfoCount;
- (unint64_t)gpuCommandInfoCount;
- (unint64_t)pipelineStateInfoCount;
- (unint64_t)version;
- (unsigned)gpuGeneration;
- (void)cleanupLocalFiles;
- (void)dealloc;
- (void)debugDump:(id)a3;
- (void)encodeAPSArrayForOldHost:(id)a3 array:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateUnarchivedBatchIdFilteredCounterData:(id)a3;
- (void)enumerateUnarchivedGPUTimelineData:(id)a3;
- (void)enumerateUnarchivedShaderProfilerData:(id)a3;
- (void)patchObjectIds:(id)a3;
- (void)setMetalPluginName:(id)a3;
- (void)setSupportsFileFormatV2:(BOOL)a3;
- (void)setTraceName:(id)a3;
- (void)unloadAPSData:(BOOL)a3;
@end

@implementation GTShaderProfilerStreamData

- (GTShaderProfilerStreamData)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GTShaderProfilerStreamData;
  result = -[GTShaderProfilerStreamData init](&v3, "init");
  if (result)
  {
    result->_supportsFileFormatV2 = 0;
    result->_version = 4LL;
  }

  return result;
}

- (GTShaderProfilerStreamData)initWithNewFileFormatV2Support:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___GTShaderProfilerStreamData;
  result = -[GTShaderProfilerStreamData init](&v5, "init");
  if (result)
  {
    result->_supportsFileFormatV2 = a3;
    result->_version = 4LL;
  }

  return result;
}

- (GTShaderProfilerStreamData)initWithCoder:(id)a3
{
  id v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)&OBJC_CLASS___GTShaderProfilerStreamData;
  objc_super v5 = -[GTShaderProfilerStreamData init](&v55, "init");
  if (!v5)
  {
LABEL_15:
    v9 = v5;
    goto LABEL_16;
  }

  int v6 = [v4 decodeIntForKey:@"version"];
  int v8 = v6;
  v5->_version = v6;
  if (v6 > 4)
  {
    v9 = 0LL;
    goto LABEL_16;
  }

  if (v6 != 1
    || (v10 = (segment_command_64 *)[v4 decodeIntegerForKey:@"gpuCommandInfoSize"],
        v11 = (char *)[v4 decodeIntegerForKey:@"encoderInfoSize"],
        v12 = (char *)[v4 decodeIntegerForKey:@"pipelineStateInfoSize"],
        v13 = (segment_command_64 *)[v4 decodeIntegerForKey:@"commandBufferInfoSize"],
        v14 = (char *)[v4 decodeIntegerForKey:@"functionInfoSize"],
        v9 = 0LL,
        v10 == &stru_20)
    && v11 == stru_20.segname
    && v12 == stru_20.segname
    && v13 == &stru_20
    && v14 == &stru_20.segname[8])
  {
    v56[0] = objc_opt_class(&OBJC_CLASS___NSData, v7);
    v56[1] = objc_opt_class(&OBJC_CLASS___NSMutableData, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v56, 2LL));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v16));

    id v19 = objc_msgSend((id)objc_opt_class(v5, v18), "streamDataClasses");
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v5->_blitCallCount = (unint64_t)[v4 decodeIntegerForKey:@"numBlitCalls"];
    v5->_supportsFileFormatV2 = [v4 decodeBoolForKey:@"supportsSeparateAPSData"];
    v5->_gpuGeneration = [v4 decodeInt32ForKey:@"gpuGeneration"];
    id v22 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v21),  @"metalPluginName");
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    -[GTShaderProfilerStreamData setMetalPluginName:](v5, "setMetalPluginName:", v23);

    id v25 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v24),  @"traceName");
    uint64_t v26 = objc_claimAutoreleasedReturnValue(v25);
    traceName = v5->_traceName;
    v5->_traceName = (NSString *)v26;

    uint64_t v28 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v17 forKey:@"gpuCommandInfoData"]);
    gpuCommandInfoData = v5->_gpuCommandInfoData;
    v5->_gpuCommandInfoData = (NSMutableData *)v28;

    uint64_t v30 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v17 forKey:@"encoderInfoData"]);
    encoderInfoData = v5->_encoderInfoData;
    v5->_encoderInfoData = (NSMutableData *)v30;

    uint64_t v32 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v17 forKey:@"pipelineStateInfoData"]);
    pipelineStateInfoData = v5->_pipelineStateInfoData;
    v5->_pipelineStateInfoData = (NSMutableData *)v32;

    uint64_t v34 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v17 forKey:@"commandBufferInfoData"]);
    commandBufferInfoData = v5->_commandBufferInfoData;
    v5->_commandBufferInfoData = (NSMutableData *)v34;

    uint64_t v36 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v17 forKey:@"functionInfoData"]);
    functionInfoData = v5->_functionInfoData;
    v5->_functionInfoData = (NSMutableData *)v36;

    uint64_t v38 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v20 forKey:@"strings"]);
    strings = v5->_strings;
    v5->_strings = (NSMutableArray *)v38;

    uint64_t v40 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v20 forKey:@"batchIdFiterableCounters"]);
    batchIdFilterableCounters = v5->_batchIdFilterableCounters;
    v5->_batchIdFilterableCounters = (NSArray *)v40;

    uint64_t v42 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v20 forKey:@"shaderProfilerData"]);
    archivedShaderProfilerData = v5->_archivedShaderProfilerData;
    v5->_archivedShaderProfilerData = (NSMutableArray *)v42;

    uint64_t v44 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v20 forKey:@"gpuTimelineData"]);
    archivedGPUTimelineData = v5->_archivedGPUTimelineData;
    v5->_archivedGPUTimelineData = (NSMutableArray *)v44;

    uint64_t v46 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v20 forKey:@"batchIdFilteredCountersData"]);
    archivedBatchIdFilteredCounterData = v5->_archivedBatchIdFilteredCounterData;
    v5->_archivedBatchIdFilteredCounterData = (NSMutableArray *)v46;

    if (v8 >= 2)
    {
      uint64_t v48 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v20 forKey:@"APSData"]);
      archivedAPSData = v5->_archivedAPSData;
      v5->_archivedAPSData = (NSMutableArray *)v48;

      v5->_gpuGeneration = 2;
      if (v8 != 2)
      {
        uint64_t v50 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v20 forKey:@"APSCounterData"]);
        archivedAPSCounterData = v5->_archivedAPSCounterData;
        v5->_archivedAPSCounterData = (NSMutableArray *)v50;

        if (v8 >= 4)
        {
          uint64_t v52 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v20 forKey:@"APSTimelineData"]);
          archivedAPSTimelineData = v5->_archivedAPSTimelineData;
          v5->_archivedAPSTimelineData = (NSMutableArray *)v52;
        }
      }
    }

    v5->_dataSourceHasUnusedResources = [v4 decodeBoolForKey:@"dataSourceHasUnusedResources"];
    v5->_captureRange.location = (NSUInteger)[v4 decodeIntegerForKey:@"captureRangeLocation"];
    v5->_captureRange.length = (NSUInteger)[v4 decodeIntegerForKey:@"captureRangeLength"];

    goto LABEL_15;
  }

- (void)encodeAPSArrayForOldHost:(id)a3 array:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    uint64_t v7 = v6;
    [v6 removeAllObjects];
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v19 = v5;
    id obj = v5;
    id v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
          v13 = objc_autoreleasePoolPush();
          id v14 = [v12 mutableCopy];
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"APSTraceDataFile"]);
          if (v15 && !self->_supportsFileFormatV2)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v15,  1LL,  0LL));
            if (v16) {
              [v14 setObject:v16 forKeyedSubscript:@"APSTraceData"];
            }
          }

          v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v14,  1LL,  0LL));
          if (v17) {
            [v7 addObject:v17];
          }

          [v14 removeAllObjects];
          if (v15)
          {
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
            [v18 removeItemAtPath:v15 error:0];
          }

          objc_autoreleasePoolPop(v13);
        }

        id v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }

      while (v9);
    }

    id v5 = v19;
    id v6 = v7;
  }
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t version = self->_version;
  id v18 = a3;
  [v18 encodeInteger:version forKey:@"version"];
  -[GTShaderProfilerStreamData encodeAPSArrayForOldHost:array:]( self,  "encodeAPSArrayForOldHost:array:",  self->_tempAPSData,  self->_archivedAPSData);
  -[GTShaderProfilerStreamData encodeAPSArrayForOldHost:array:]( self,  "encodeAPSArrayForOldHost:array:",  self->_tempAPSTimelineData,  self->_archivedAPSTimelineData);
  -[GTShaderProfilerStreamData encodeAPSArrayForOldHost:array:]( self,  "encodeAPSArrayForOldHost:array:",  self->_tempAPSCounterData,  self->_archivedAPSCounterData);
  [v18 encodeInteger:32 forKey:@"gpuCommandInfoSize"];
  [v18 encodeInteger:40 forKey:@"encoderInfoSize"];
  [v18 encodeInteger:40 forKey:@"pipelineStateInfoSize"];
  [v18 encodeInteger:32 forKey:@"commandBufferInfoSize"];
  [v18 encodeInteger:48 forKey:@"functionInfoSize"];
  objc_msgSend( v18,  "encodeInteger:forKey:",  -[GTShaderProfilerStreamData blitCallCount](self, "blitCallCount"),  @"numBlitCalls");
  objc_msgSend( v18,  "encodeBool:forKey:",  -[GTShaderProfilerStreamData supportsFileFormatV2](self, "supportsFileFormatV2"),  @"supportsSeparateAPSData");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData gpuCommandInfoData](self, "gpuCommandInfoData"));
  [v18 encodeObject:v5 forKey:@"gpuCommandInfoData"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData encoderInfoData](self, "encoderInfoData"));
  [v18 encodeObject:v6 forKey:@"encoderInfoData"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData pipelineStateInfoData](self, "pipelineStateInfoData"));
  [v18 encodeObject:v7 forKey:@"pipelineStateInfoData"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData commandBufferInfoData](self, "commandBufferInfoData"));
  [v18 encodeObject:v8 forKey:@"commandBufferInfoData"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData functionInfoData](self, "functionInfoData"));
  [v18 encodeObject:v9 forKey:@"functionInfoData"];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData strings](self, "strings"));
  [v18 encodeObject:v10 forKey:@"strings"];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData batchIdFilterableCounters](self, "batchIdFilterableCounters"));
  [v18 encodeObject:v11 forKey:@"batchIdFiterableCounters"];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData archivedShaderProfilerData](self, "archivedShaderProfilerData"));
  [v18 encodeObject:v12 forKey:@"shaderProfilerData"];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData archivedGPUTimelineData](self, "archivedGPUTimelineData"));
  [v18 encodeObject:v13 forKey:@"gpuTimelineData"];

  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[GTShaderProfilerStreamData archivedBatchIdFilteredCounterData]( self,  "archivedBatchIdFilteredCounterData"));
  [v18 encodeObject:v14 forKey:@"batchIdFilteredCountersData"];

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData archivedAPSData](self, "archivedAPSData"));
  [v18 encodeObject:v15 forKey:@"APSData"];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData archivedAPSCounterData](self, "archivedAPSCounterData"));
  [v18 encodeObject:v16 forKey:@"APSCounterData"];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData archivedAPSTimelineData](self, "archivedAPSTimelineData"));
  [v18 encodeObject:v17 forKey:@"APSTimelineData"];

  [v18 encodeBool:self->_dataSourceHasUnusedResources forKey:@"dataSourceHasUnusedResources"];
  [v18 encodeInteger:self->_captureRange.location forKey:@"captureRangeLocation"];
  [v18 encodeInteger:self->_captureRange.length forKey:@"captureRangeLength"];
  [v18 encodeInt32:self->_gpuGeneration forKey:@"gpuGeneration"];
  [v18 encodeObject:self->_metalPluginName forKey:@"metalPluginName"];
  [v18 encodeObject:self->_traceName forKey:@"traceName"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v5[1] = -[GTShaderProfilerStreamData version](self, "version");
  v5[2] = -[GTShaderProfilerStreamData blitCallCount](self, "blitCallCount");
  *((_BYTE *)v5 + 272) = -[GTShaderProfilerStreamData supportsFileFormatV2](self, "supportsFileFormatV2");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData gpuCommandInfoData](self, "gpuCommandInfoData"));
  id v7 = [v6 copyWithZone:a3];
  id v8 = (void *)v5[3];
  v5[3] = v7;

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData encoderInfoData](self, "encoderInfoData"));
  id v10 = [v9 copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData pipelineStateInfoData](self, "pipelineStateInfoData"));
  id v13 = [v12 copyWithZone:a3];
  id v14 = (void *)v5[5];
  v5[5] = v13;

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData commandBufferInfoData](self, "commandBufferInfoData"));
  id v16 = [v15 copyWithZone:a3];
  v17 = (void *)v5[6];
  v5[6] = v16;

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData archivedShaderProfilerData](self, "archivedShaderProfilerData"));
  id v19 = [v18 copyWithZone:a3];
  v20 = (void *)v5[9];
  v5[9] = v19;

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData archivedGPUTimelineData](self, "archivedGPUTimelineData"));
  id v22 = [v21 copyWithZone:a3];
  __int128 v23 = (void *)v5[8];
  v5[8] = v22;

  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue( -[GTShaderProfilerStreamData archivedBatchIdFilteredCounterData]( self,  "archivedBatchIdFilteredCounterData"));
  id v25 = [v24 copyWithZone:a3];
  uint64_t v26 = (void *)v5[10];
  v5[10] = v25;

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData archivedAPSData](self, "archivedAPSData"));
  id v28 = [v27 copyWithZone:a3];
  v29 = (void *)v5[11];
  v5[11] = v28;

  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData archivedAPSCounterData](self, "archivedAPSCounterData"));
  id v31 = [v30 copyWithZone:a3];
  uint64_t v32 = (void *)v5[13];
  v5[13] = v31;

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData archivedAPSTimelineData](self, "archivedAPSTimelineData"));
  id v34 = [v33 copyWithZone:a3];
  v35 = (void *)v5[12];
  v5[12] = v34;

  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData functionInfoData](self, "functionInfoData"));
  id v37 = [v36 copyWithZone:a3];
  uint64_t v38 = (void *)v5[7];
  v5[7] = v37;

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData strings](self, "strings"));
  id v40 = [v39 copyWithZone:a3];
  v41 = (void *)v5[20];
  v5[20] = v40;

  *((_BYTE *)v5 + 192) = -[GTShaderProfilerStreamData dataSourceHasUnusedResources]( self,  "dataSourceHasUnusedResources");
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData batchIdFilterableCounters](self, "batchIdFilterableCounters"));
  id v43 = [v42 copyWithZone:a3];
  uint64_t v44 = (void *)v5[25];
  v5[25] = v43;

  return v5;
}

- (const)gpuCommands
{
  return (const $D535F67AB11CE01139272ED1408C24C6 *)-[NSMutableData bytes](self->_gpuCommandInfoData, "bytes");
}

- (const)encoders
{
  return (const $BD801356BB6761D70137205404F699DC *)-[NSMutableData bytes](self->_encoderInfoData, "bytes");
}

- (const)pipelineStates
{
  return (const $BD801356BB6761D70137205404F699DC *)-[NSMutableData bytes](self->_pipelineStateInfoData, "bytes");
}

- (const)commandBuffers
{
  return (const $AE9166C28C07DA0297C1F610906ECF11 *)-[NSMutableData bytes](self->_commandBufferInfoData, "bytes");
}

- (const)functionInfo
{
  return (const $1DCF89E860F11EA061E0D2DB567B39C0 *)-[NSMutableData bytes](self->_functionInfoData, "bytes");
}

- (unint64_t)gpuCommandInfoCount
{
  return -[NSMutableData length](self->_gpuCommandInfoData, "length") >> 5;
}

- (unint64_t)encoderInfoCount
{
  return -[NSMutableData length](self->_encoderInfoData, "length") / 0x28;
}

- (unint64_t)pipelineStateInfoCount
{
  return -[NSMutableData length](self->_pipelineStateInfoData, "length") / 0x28;
}

- (unint64_t)commandBufferInfoCount
{
  return -[NSMutableData length](self->_commandBufferInfoData, "length") >> 5;
}

- (unint64_t)functionInfoCount
{
  return -[NSMutableData length](self->_functionInfoData, "length") / 0x30;
}

- (void)unloadAPSData:(BOOL)a3
{
  if (a3)
  {
    unarchivedAPSData = self->_unarchivedAPSData;
    if (unarchivedAPSData)
    {
      -[NSMutableArray removeAllObjects](unarchivedAPSData, "removeAllObjects");
      id v5 = self->_unarchivedAPSData;
      self->_unarchivedAPSData = 0LL;
    }

    archivedAPSData = self->_archivedAPSData;
    p_archivedAPSData = &self->_archivedAPSData;
    id v6 = archivedAPSData;
    if (archivedAPSData)
    {
LABEL_5:
      -[NSMutableArray removeAllObjects](v6, "removeAllObjects");
      id v9 = *p_archivedAPSData;
      *p_archivedAPSData = 0LL;
    }
  }

  else
  {
    archivedAPSTimelineData = self->_archivedAPSTimelineData;
    if (archivedAPSTimelineData)
    {
      -[NSMutableArray removeAllObjects](archivedAPSTimelineData, "removeAllObjects");
      v11 = self->_archivedAPSTimelineData;
      self->_archivedAPSTimelineData = 0LL;
    }

    archivedAPSCounterData = self->_archivedAPSCounterData;
    if (archivedAPSCounterData)
    {
      -[NSMutableArray removeAllObjects](archivedAPSCounterData, "removeAllObjects");
      id v13 = self->_archivedAPSCounterData;
      self->_archivedAPSCounterData = 0LL;
    }

    unarchivedAPSTimelineData = self->_unarchivedAPSTimelineData;
    if (unarchivedAPSTimelineData)
    {
      -[NSMutableArray removeAllObjects](unarchivedAPSTimelineData, "removeAllObjects");
      uint64_t v15 = self->_unarchivedAPSTimelineData;
      self->_unarchivedAPSTimelineData = 0LL;
    }

    unarchivedAPSCounterData = self->_unarchivedAPSCounterData;
    p_archivedAPSData = &self->_unarchivedAPSCounterData;
    id v6 = unarchivedAPSCounterData;
    if (unarchivedAPSCounterData) {
      goto LABEL_5;
    }
  }

- (void)enumerateUnarchivedShaderProfilerData:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData unarchivedShaderProfilerData](self, "unarchivedShaderProfilerData", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8LL * (void)v9));
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }
}

- (NSArray)unarchivedShaderProfilerData
{
  if (-[NSMutableArray count](self->_archivedShaderProfilerData, "count"))
  {
    unarchivedShaderProfilerData = self->_unarchivedShaderProfilerData;
    if (!unarchivedShaderProfilerData || !-[NSMutableArray count](unarchivedShaderProfilerData, "count"))
    {
      id v5 = (NSMutableArray *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v3);
      id v6 = self->_unarchivedShaderProfilerData;
      self->_unarchivedShaderProfilerData = v5;

      id v8 = objc_msgSend((id)objc_opt_class(self, v7), "streamDataClasses");
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v10 = self->_archivedShaderProfilerData;
      id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v21;
        do
        {
          id v14 = 0LL;
          do
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)v14);
            id v19 = 0LL;
            id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v9,  v15,  &v19));
            id v17 = v19;
            if (v16) {
              -[NSMutableArray addObject:](self->_unarchivedShaderProfilerData, "addObject:", v16);
            }

            id v14 = (char *)v14 + 1;
          }

          while (v12 != v14);
          id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
        }

        while (v12);
      }
    }
  }

  return (NSArray *)self->_unarchivedShaderProfilerData;
}

- (void)enumerateUnarchivedGPUTimelineData:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData unarchivedGPUTimelineData](self, "unarchivedGPUTimelineData", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8LL * (void)v9));
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }
}

- (NSArray)unarchivedGPUTimelineData
{
  if (-[NSMutableArray count](self->_archivedGPUTimelineData, "count"))
  {
    unarchivedGPUTimelineData = self->_unarchivedGPUTimelineData;
    if (!unarchivedGPUTimelineData || !-[NSMutableArray count](unarchivedGPUTimelineData, "count"))
    {
      id v5 = (NSMutableArray *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v3);
      id v6 = self->_unarchivedGPUTimelineData;
      self->_unarchivedGPUTimelineData = v5;

      id v8 = objc_msgSend((id)objc_opt_class(self, v7), "streamDataClasses");
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v10 = self->_archivedGPUTimelineData;
      id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v21;
        do
        {
          id v14 = 0LL;
          do
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)v14);
            id v19 = 0LL;
            id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v9,  v15,  &v19));
            id v17 = v19;
            if (v16) {
              -[NSMutableArray addObject:](self->_unarchivedGPUTimelineData, "addObject:", v16);
            }

            id v14 = (char *)v14 + 1;
          }

          while (v12 != v14);
          id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
        }

        while (v12);
      }
    }
  }

  return (NSArray *)self->_unarchivedGPUTimelineData;
}

- (id)patchLocalFileData:(id)a3
{
  id v4 = a3;
  if (!-[GTShaderProfilerStreamData supportsFileFormatV2](self, "supportsFileFormatV2"))
  {
    id v9 = v4;
    goto LABEL_8;
  }

  id v5 = [v4 mutableCopy];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"APSTraceDataFile"]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"Source"]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"APSTraceData"]);
  if (!v8)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](self->_dataFileURL, "URLByAppendingPathComponent:", v6));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned __int8 v14 = [v13 fileExistsAtPath:v12];

    if ((v14 & 1) != 0)
    {
      uint64_t v16 = 0LL;
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v12,  1LL,  &v16));
      if (!v16)
      {
        [v5 setObject:v15 forKeyedSubscript:@"APSTraceData"];

        goto LABEL_4;
      }

      id v9 = v4;
    }

    else
    {
      id v9 = v4;
    }

    goto LABEL_6;
  }

- (NSArray)unarchivedAPSData
{
  if (-[NSMutableArray count](self->_archivedAPSData, "count"))
  {
    unarchivedAPSData = self->_unarchivedAPSData;
    if (!unarchivedAPSData || !-[NSMutableArray count](unarchivedAPSData, "count"))
    {
      id v5 = (NSMutableArray *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v3);
      id v6 = self->_unarchivedAPSData;
      self->_unarchivedAPSData = v5;

      id v8 = objc_msgSend((id)objc_opt_class(self, v7), "streamDataClasses");
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      id obj = self->_archivedAPSData;
      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v23;
        do
        {
          uint64_t v13 = 0LL;
          do
          {
            if (*(void *)v23 != v12) {
              objc_enumerationMutation(obj);
            }
            uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)v13);
            id v21 = 0LL;
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v9,  v14,  &v21));
            id v16 = v21;
            if (v15)
            {
              id v17 = self->_unarchivedAPSData;
              id v18 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData patchLocalFileData:](self, "patchLocalFileData:", v15));
              -[NSMutableArray addObject:](v17, "addObject:", v18);
            }

            uint64_t v13 = (char *)v13 + 1;
          }

          while (v11 != v13);
          id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
        }

        while (v11);
      }
    }
  }

  return (NSArray *)self->_unarchivedAPSData;
}

- (NSArray)unarchivedAPSCounterData
{
  if (-[NSMutableArray count](self->_archivedAPSCounterData, "count"))
  {
    unarchivedAPSCounterData = self->_unarchivedAPSCounterData;
    if (!unarchivedAPSCounterData || !-[NSMutableArray count](unarchivedAPSCounterData, "count"))
    {
      id v5 = (NSMutableArray *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v3);
      id v6 = self->_unarchivedAPSCounterData;
      self->_unarchivedAPSCounterData = v5;

      id v8 = objc_msgSend((id)objc_opt_class(self, v7), "streamDataClasses");
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      id obj = self->_archivedAPSCounterData;
      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v23;
        do
        {
          uint64_t v13 = 0LL;
          do
          {
            if (*(void *)v23 != v12) {
              objc_enumerationMutation(obj);
            }
            uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)v13);
            id v21 = 0LL;
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v9,  v14,  &v21));
            id v16 = v21;
            if (v15)
            {
              id v17 = self->_unarchivedAPSCounterData;
              id v18 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData patchLocalFileData:](self, "patchLocalFileData:", v15));
              -[NSMutableArray addObject:](v17, "addObject:", v18);
            }

            uint64_t v13 = (char *)v13 + 1;
          }

          while (v11 != v13);
          id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
        }

        while (v11);
      }
    }
  }

  return (NSArray *)self->_unarchivedAPSCounterData;
}

- (NSArray)unarchivedAPSTimelineData
{
  if (-[NSMutableArray count](self->_archivedAPSTimelineData, "count"))
  {
    unarchivedAPSTimelineData = self->_unarchivedAPSTimelineData;
    if (!unarchivedAPSTimelineData || !-[NSMutableArray count](unarchivedAPSTimelineData, "count"))
    {
      id v5 = (NSMutableArray *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v3);
      id v6 = self->_unarchivedAPSTimelineData;
      self->_unarchivedAPSTimelineData = v5;

      id v8 = objc_msgSend((id)objc_opt_class(self, v7), "streamDataClasses");
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      id obj = self->_archivedAPSTimelineData;
      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v23;
        do
        {
          uint64_t v13 = 0LL;
          do
          {
            if (*(void *)v23 != v12) {
              objc_enumerationMutation(obj);
            }
            uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)v13);
            id v21 = 0LL;
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v9,  v14,  &v21));
            id v16 = v21;
            if (v15)
            {
              id v17 = self->_unarchivedAPSTimelineData;
              id v18 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData patchLocalFileData:](self, "patchLocalFileData:", v15));
              -[NSMutableArray addObject:](v17, "addObject:", v18);
            }

            uint64_t v13 = (char *)v13 + 1;
          }

          while (v11 != v13);
          id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
        }

        while (v11);
      }
    }
  }

  return (NSArray *)self->_unarchivedAPSTimelineData;
}

- (void)enumerateUnarchivedBatchIdFilteredCounterData:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if (-[NSMutableArray count](self->_archivedBatchIdFilteredCounterData, "count"))
  {
    unarchivedBatchIdFilteredCounterData = self->_unarchivedBatchIdFilteredCounterData;
    if (!unarchivedBatchIdFilteredCounterData
      || !-[NSMutableArray count](unarchivedBatchIdFilteredCounterData, "count"))
    {
      uint64_t v7 = (NSMutableArray *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v5);
      id v8 = self->_unarchivedBatchIdFilteredCounterData;
      self->_unarchivedBatchIdFilteredCounterData = v7;

      id v10 = objc_msgSend((id)objc_opt_class(self, v9), "streamDataClasses");
      id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      if (-[NSMutableArray count](self->_archivedBatchIdFilteredCounterData, "count"))
      {
        unint64_t v12 = 0LL;
        do
        {
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_archivedBatchIdFilteredCounterData,  "objectAtIndexedSubscript:",  v12));
          id v16 = 0LL;
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v11,  v13,  &v16));
          id v15 = v16;
          if (v14)
          {
            -[NSMutableArray addObject:](self->_unarchivedBatchIdFilteredCounterData, "addObject:", v14);
            v4[2](v4, v14);
          }

          ++v12;
        }

        while (v12 < (unint64_t)-[NSMutableArray count](self->_archivedBatchIdFilteredCounterData, "count"));
      }
    }
  }
}

- (NSArray)unarchivedBatchIdFilteredCounterData
{
  if (-[NSMutableArray count](self->_archivedBatchIdFilteredCounterData, "count"))
  {
    unarchivedBatchIdFilteredCounterData = self->_unarchivedBatchIdFilteredCounterData;
    if (!unarchivedBatchIdFilteredCounterData
      || !-[NSMutableArray count](unarchivedBatchIdFilteredCounterData, "count"))
    {
      uint64_t v5 = (NSMutableArray *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v3);
      id v6 = self->_unarchivedBatchIdFilteredCounterData;
      self->_unarchivedBatchIdFilteredCounterData = v5;

      id v8 = objc_msgSend((id)objc_opt_class(self, v7), "streamDataClasses");
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      id v10 = self->_archivedBatchIdFilteredCounterData;
      id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v21;
        do
        {
          uint64_t v14 = 0LL;
          do
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)v14);
            id v19 = 0LL;
            id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v9,  v15,  &v19));
            id v17 = v19;
            if (v16) {
              -[NSMutableArray addObject:](self->_unarchivedBatchIdFilteredCounterData, "addObject:", v16);
            }

            uint64_t v14 = (char *)v14 + 1;
          }

          while (v12 != v14);
          id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
        }

        while (v12);
      }
    }
  }

  return (NSArray *)self->_unarchivedBatchIdFilteredCounterData;
}

- (id)_unarchiveAndPatchAPSData:(id)a3 apsData:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v8 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v7);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id obj = v6;
  id v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"APSTraceDataFile"]);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v14]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"Source"]);
        if (v15)
        {
          id v17 = [v13 mutableCopy];
          [v17 setObject:v15 forKeyedSubscript:@"APSTraceData"];
          [v8 addObject:v17];

          goto LABEL_11;
        }

        id v18 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"APSTraceData"]);

        if (v18) {
LABEL_10:
        }
          [v8 addObject:v13];
LABEL_11:
      }

      id v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v10);
  }

  return v8;
}

- (void)debugDump:(id)a3
{
  id v9 = a3;
  id v5 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableString, v4);
  if (-[GTShaderProfilerStreamData gpuCommandInfoCount](self, "gpuCommandInfoCount"))
  {
    uint64_t v6 = 0LL;
    unint64_t v7 = 0LL;
    do
    {
      id v8 = -[GTShaderProfilerStreamData gpuCommands](self, "gpuCommands");
      objc_msgSend( v5,  "appendFormat:",  @"I: %d, E: %d, P: %d, F: %llu, S: %d, T: %d\n",  v8[v6].var0,  v8[v6].var1,  v8[v6].var3,  v8[v6].var4,  v8[v6].var6,  v8[v6].var5);
      ++v7;
      ++v6;
    }

    while (v7 < -[GTShaderProfilerStreamData gpuCommandInfoCount](self, "gpuCommandInfoCount"));
  }

  [v5 writeToFile:v9 atomically:0 encoding:4 error:0];
}

- (void)patchObjectIds:(id)a3
{
  id v26 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v4 BOOLForKey:@"GPUDebugger.ShaderProfiler.DebugObjectIdPatch"];

  if (!self->_dataSourceHasUnusedResources)
  {
    id v5 = -[GTShaderProfilerStreamData encoderInfoCount](self, "encoderInfoCount");
    if (v5 == [v26 encoderInfoCount])
    {
      id v6 = -[GTShaderProfilerStreamData pipelineStateInfoCount](self, "pipelineStateInfoCount");
      if (v6 == [v26 pipelineStateInfoCount])
      {
        id v7 = -[GTShaderProfilerStreamData functionInfoCount](self, "functionInfoCount");
        if (v7 == [v26 functionInfoCount])
        {
          id v8 = -[GTShaderProfilerStreamData commandBufferInfoCount](self, "commandBufferInfoCount");
          if (v8 == [v26 commandBufferInfoCount])
          {
            id v9 = -[GTShaderProfilerStreamData encoders](self, "encoders");
            if (-[GTShaderProfilerStreamData encoderInfoCount](self, "encoderInfoCount"))
            {
              uint64_t v10 = 0LL;
              unint64_t v11 = 0LL;
              do
              {
                unint64_t var2 = v9[v10].var2;
                ++v11;
                ++v10;
              }

              while (v11 < -[GTShaderProfilerStreamData encoderInfoCount](self, "encoderInfoCount"));
            }

            uint64_t v13 = -[GTShaderProfilerStreamData commandBuffers](self, "commandBuffers");
            if (-[GTShaderProfilerStreamData commandBufferInfoCount](self, "commandBufferInfoCount"))
            {
              uint64_t v14 = 0LL;
              unint64_t v15 = 0LL;
              do
              {
                unint64_t v16 = v13[v14].var2;
                ++v15;
                ++v14;
              }

              while (v15 < -[GTShaderProfilerStreamData commandBufferInfoCount](self, "commandBufferInfoCount"));
            }

            id v17 = -[GTShaderProfilerStreamData pipelineStates](self, "pipelineStates");
            if (-[GTShaderProfilerStreamData pipelineStateInfoCount](self, "pipelineStateInfoCount"))
            {
              uint64_t v18 = 0LL;
              unint64_t v19 = 0LL;
              do
              {
                unint64_t v20 = v17[v18].var2;
                ++v19;
                ++v18;
              }

              while (v19 < -[GTShaderProfilerStreamData pipelineStateInfoCount](self, "pipelineStateInfoCount"));
            }

            __int128 v21 = -[GTShaderProfilerStreamData functionInfo](self, "functionInfo");
            if (-[GTShaderProfilerStreamData functionInfoCount](self, "functionInfoCount"))
            {
              uint64_t v22 = 0LL;
              unint64_t v23 = 0LL;
              do
              {
                __int128 v24 = ($1DCF89E860F11EA061E0D2DB567B39C0 *)&v21[v22];
                unint64_t var1 = v21[v22].var1;
                if (var1 == *(void *)((char *)[v26 functionInfo] + v22 * 48 + 8))
                {
                  v24->var0 = *(void *)((char *)[v26 functionInfo] + v22 * 48);
                  v24->unint64_t var2 = *(void *)((char *)[v26 functionInfo] + v22 * 48 + 16);
                }

                ++v23;
                ++v22;
              }

              while (v23 < -[GTShaderProfilerStreamData functionInfoCount](self, "functionInfoCount"));
            }
          }
        }
      }
    }
  }
}

- (void)setMetalPluginName:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringFromIndex:", objc_msgSend(@"AGXMetal", "length")));
  id v7 = v6;
  if (!v6
    || ([v6 hasPrefix:@"G"] & 1) == 0
    && ([v7 hasPrefix:@"A"] & 1) == 0
    && ![v7 hasPrefix:@"1"])
  {

LABEL_17:
    goto LABEL_18;
  }

  id v8 = v7;
  id v9 = (char *)[v8 UTF8String];
  unint64_t v10 = [v8 hasPrefix:@"1"] ^ 1;
  if ((unint64_t)[v8 length] <= v10)
  {
    int v11 = 0;
  }

  else
  {
    int v11 = 0;
    do
    {
      unsigned int v12 = v9[v10] - 48;
      if (v12 > 9) {
        break;
      }
      int v11 = v12 + 10 * v11;
      ++v10;
    }

    while (v10 < (unint64_t)[v8 length]);
    if (v11 == 15)
    {
      if (v10 < (unint64_t)[v8 length]
        && [v8 characterAtIndex:v10] == 95
        || (id)v10 == [v8 length])
      {
        int v11 = 14;
      }

      else
      {
        int v11 = 15;
      }
    }
  }

  else {
    int v15 = -10;
  }
  int v16 = v15 + v11;
  if (v16 < 0) {
    int v17 = -1;
  }
  else {
    int v17 = v16;
  }

  if ((v17 - 0x7FFFFFFF) < 2)
  {
    unsigned int v13 = 0;
    goto LABEL_19;
  }

  if (v17 >= 5
    && (v17 != 5
     || ([v5 hasSuffix:@"M"] & 1) == 0
     && ([v5 hasSuffix:@"P"] & 1) == 0))
  {
    unsigned int v13 = 2;
    goto LABEL_19;
  }

- (const)GPUCommandInfoFromFunctionIndex:(unsigned int)a3 subCommandIndex:(int)a4
{
  result = -[GTShaderProfilerStreamData gpuCommandInfoCount](self, "gpuCommandInfoCount");
  if (result)
  {
    uint64_t v8 = 0LL;
    unint64_t v9 = 0LL;
    while (1)
    {
      unint64_t v10 = -[GTShaderProfilerStreamData gpuCommands](self, "gpuCommands");
      if (v10[v8].var4 == a3 && v10[v8].var6 == a4) {
        break;
      }
      ++v9;
      ++v8;
      if (v9 >= -[GTShaderProfilerStreamData gpuCommandInfoCount](self, "gpuCommandInfoCount")) {
        return 0LL;
      }
    }

    return &v10[v9];
  }

  return result;
}

- (const)encoderInfoFromFunctionIndex:(unsigned int)a3
{
  result = -[GTShaderProfilerStreamData encoderInfoCount](self, "encoderInfoCount");
  if (result)
  {
    uint64_t v6 = 0LL;
    for (uint64_t i = 16LL; ; i += 40LL)
    {
      uint64_t v8 = -[GTShaderProfilerStreamData encoders](self, "encoders");
      if (++v6 >= -[GTShaderProfilerStreamData encoderInfoCount](self, "encoderInfoCount")) {
        return 0LL;
      }
    }

    return &v8[v6];
  }

  return result;
}

- (id)encode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_autoreleasePoolPush();
  id v28 = 0LL;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  self,  1LL,  &v28));
  id v9 = v28;
  if (!v9)
  {
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData _setupDataPath](self, "_setupDataPath"));
    if (v12 && -[GTShaderProfilerStreamData supportsFileFormatV2](self, "supportsFileFormatV2"))
    {
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 URLByAppendingPathComponent:@"streamData"]);
      id v27 = 0LL;
      [v8 writeToURL:v13 options:0 error:&v27];
      id v10 = v27;

      if (v10)
      {
        if (a4)
        {
LABEL_8:
          id v10 = v10;
          id v11 = 0LL;
          *a4 = v10;
LABEL_27:

          goto LABEL_28;
        }

- (id)_setupDataPath
{
  dataFileURL = self->_dataFileURL;
  if (dataFileURL) {
    return dataFileURL;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerStreamData traceName](self, "traceName"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByDeletingPathExtension]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingString:@"_stream"]);
  id v9 = v7;
  if (v7)
  {
    id v10 = v7;
  }

  else
  {
    id v11 = (void *)objc_opt_new(&OBJC_CLASS___NSUUID, v8);
    id v10 = (id)objc_claimAutoreleasedReturnValue([v11 UUIDString]);
  }

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([@"/tmp/com.apple.gputools.profiling" stringByAppendingPathComponent:v10]);
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByAppendingPathExtension:@"gpuprofiler_raw"]);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  [v14 removeItemAtPath:v13 error:0];

  int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v20 = 0LL;
  [v15 createDirectoryAtPath:v13 withIntermediateDirectories:1 attributes:0 error:&v20];
  id v16 = v20;

  if (v16)
  {
    -[GTShaderProfilerStreamData setSupportsFileFormatV2:](self, "setSupportsFileFormatV2:", 0LL);
    int v17 = 0LL;
  }

  else
  {
    uint64_t v18 = (NSURL *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v13));
    unint64_t v19 = self->_dataFileURL;
    self->_dataFileURL = v18;

    int v17 = self->_dataFileURL;
  }

  return v17;
}

- (void)cleanupLocalFiles
{
  if (self->_dataFileURL)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self->_dataFileURL, "path"));
    [v3 removeItemAtPath:v4 error:0];

    dataFileURL = self->_dataFileURL;
    self->_dataFileURL = 0LL;
  }

- (void)dealloc
{
  dataFileURL = self->_dataFileURL;
  if (dataFileURL) {
    -[NSURL stopAccessingSecurityScopedResource](dataFileURL, "stopAccessingSecurityScopedResource");
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___GTShaderProfilerStreamData;
  -[GTShaderProfilerStreamData dealloc](&v4, "dealloc");
}

- (unint64_t)version
{
  return self->_version;
}

- (unint64_t)blitCallCount
{
  return self->_blitCallCount;
}

- (NSData)gpuCommandInfoData
{
  return &self->_gpuCommandInfoData->super;
}

- (NSData)encoderInfoData
{
  return &self->_encoderInfoData->super;
}

- (NSData)pipelineStateInfoData
{
  return &self->_pipelineStateInfoData->super;
}

- (NSData)commandBufferInfoData
{
  return &self->_commandBufferInfoData->super;
}

- (NSArray)archivedGPUTimelineData
{
  return &self->_archivedGPUTimelineData->super;
}

- (NSArray)archivedShaderProfilerData
{
  return &self->_archivedShaderProfilerData->super;
}

- (NSArray)archivedAPSData
{
  return &self->_archivedAPSData->super;
}

- (NSArray)archivedAPSTimelineData
{
  return &self->_archivedAPSTimelineData->super;
}

- (NSArray)archivedAPSCounterData
{
  return &self->_archivedAPSCounterData->super;
}

- (NSData)functionInfoData
{
  return &self->_functionInfoData->super;
}

- (NSArray)strings
{
  return &self->_strings->super;
}

- (BOOL)dataSourceHasUnusedResources
{
  return self->_dataSourceHasUnusedResources;
}

- (_NSRange)dataSourceCaptureRange
{
  NSUInteger length = self->_captureRange.length;
  NSUInteger location = self->_captureRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSArray)archivedBatchIdFilteredCounterData
{
  return &self->_archivedBatchIdFilteredCounterData->super;
}

- (NSArray)batchIdFilterableCounters
{
  return self->_batchIdFilterableCounters;
}

- (unsigned)gpuGeneration
{
  return self->_gpuGeneration;
}

- (NSString)metalPluginName
{
  return self->_metalPluginName;
}

- (NSString)traceName
{
  return self->_traceName;
}

- (void)setTraceName:(id)a3
{
}

- (BOOL)supportsFileFormatV2
{
  return self->_supportsFileFormatV2;
}

- (void)setSupportsFileFormatV2:(BOOL)a3
{
  self->_supportsFileFormatV2 = a3;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)streamDataClasses
{
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSData, a2);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSMutableData, v2);
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary, v3);
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary, v4);
  uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSArray, v5);
  uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v6);
  uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSNumber, v7);
  uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSString, v8);
  uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSMutableString, v9);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 9LL));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithArray:]( &OBJC_CLASS___NSSet,  "setWithArray:",  v10,  v13,  v14,  v15,  v16,  v17,  v18,  v19,  v20));

  return v11;
}

+ (id)dataFromArchivedDataURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByResolvingSymlinksInPath]);
  unsigned int v8 = [v5 fileExistsAtPath:v7 isDirectory:&v30];
  int v9 = v30;

  if (v8) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    id v27 = 0LL;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v4,  0LL,  &v27));
    id v11 = v27;
    if (!v11)
    {
      id v26 = 0LL;
      id v22 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___GTShaderProfilerStreamData, v12),  v15,  &v26);
      uint64_t v21 = (id *)objc_claimAutoreleasedReturnValue(v22);
      id v13 = v26;
      goto LABEL_18;
    }

    id v13 = v11;
    goto LABEL_12;
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 stringByAppendingPathComponent:@"streamData"]);

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v17 = [v16 fileExistsAtPath:v15];

  if (!v17)
  {
    id v13 = 0LL;
LABEL_12:
    uint64_t v21 = 0LL;
    goto LABEL_18;
  }

  id v29 = 0LL;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v15,  0LL,  &v29));
  id v19 = v29;
  if (v19)
  {
    id v13 = v19;
    uint64_t v21 = 0LL;
  }

  else
  {
    id v28 = 0LL;
    id v23 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___GTShaderProfilerStreamData, v20),  v18,  &v28);
    id v24 = (id *)objc_claimAutoreleasedReturnValue(v23);
    id v13 = v28;
    uint64_t v21 = 0LL;
    if (!v13)
    {
      objc_storeStrong(v24 + 33, a3);
      uint64_t v21 = v24;
    }
  }

LABEL_18:
  return v21;
}

+ (id)steamDataFromData:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0LL;
  id v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___GTShaderProfilerStreamData, v4),  v3,  &v8);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

@end
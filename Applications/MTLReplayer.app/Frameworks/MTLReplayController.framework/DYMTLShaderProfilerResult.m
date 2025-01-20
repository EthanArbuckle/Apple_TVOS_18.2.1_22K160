@interface DYMTLShaderProfilerResult
- (DYMTLShaderProfilerResult)init;
- (NSArray)encoderTilerParamBufBytesUsedArray;
- (NSDictionary)parameterBufferPercentFullDict;
- (NSDictionary)softwareCounterInfo;
- (NSMutableData)unknownUSCSamples;
- (NSMutableDictionary)perRingPerFrameLimiterData;
- (NSNumber)parameterBufferMaxSize;
- (NSNumber)parameterBufferMaxSizeEverMemless;
- (NSNumber)parameterBufferMaxSizeNeverMemless;
- (void)setEncoderTilerParamBufBytesUsedArray:(id)a3;
- (void)setParameterBufferMaxSize:(id)a3;
- (void)setParameterBufferMaxSizeEverMemless:(id)a3;
- (void)setParameterBufferMaxSizeNeverMemless:(id)a3;
- (void)setParameterBufferPercentFullDict:(id)a3;
- (void)setPerRingPerFrameLimiterData:(id)a3;
- (void)setSoftwareCounterInfo:(id)a3;
- (void)setUnknownUSCSamples:(id)a3;
@end

@implementation DYMTLShaderProfilerResult

- (DYMTLShaderProfilerResult)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___DYMTLShaderProfilerResult;
  v2 = -[DYShaderProfilerResult init](&v7, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 1024LL));
    -[DYShaderProfilerResult setShaderProfilingFrameTimes:](v2, "setShaderProfilingFrameTimes:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  1024LL));
    -[DYShaderProfilerResult setBlitEncoderTimeInfo:](v2, "setBlitEncoderTimeInfo:", v4);

    v5 = v2;
  }

  return v2;
}

- (NSArray)encoderTilerParamBufBytesUsedArray
{
  return self->_encoderTilerParamBufBytesUsedArray;
}

- (void)setEncoderTilerParamBufBytesUsedArray:(id)a3
{
}

- (NSNumber)parameterBufferMaxSize
{
  return self->_parameterBufferMaxSize;
}

- (void)setParameterBufferMaxSize:(id)a3
{
}

- (NSNumber)parameterBufferMaxSizeEverMemless
{
  return self->_parameterBufferMaxSizeEverMemless;
}

- (void)setParameterBufferMaxSizeEverMemless:(id)a3
{
}

- (NSNumber)parameterBufferMaxSizeNeverMemless
{
  return self->_parameterBufferMaxSizeNeverMemless;
}

- (void)setParameterBufferMaxSizeNeverMemless:(id)a3
{
}

- (NSDictionary)parameterBufferPercentFullDict
{
  return self->_parameterBufferPercentFullDict;
}

- (void)setParameterBufferPercentFullDict:(id)a3
{
}

- (NSDictionary)softwareCounterInfo
{
  return self->_softwareCounterInfo;
}

- (void)setSoftwareCounterInfo:(id)a3
{
}

- (NSMutableData)unknownUSCSamples
{
  return self->_unknownUSCSamples;
}

- (void)setUnknownUSCSamples:(id)a3
{
}

- (NSMutableDictionary)perRingPerFrameLimiterData
{
  return self->_perRingPerFrameLimiterData;
}

- (void)setPerRingPerFrameLimiterData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
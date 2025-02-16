@interface ShaderBinaryInfo
- (DYShaderAnalyzerResult)analyzerResult;
- (NSData)binary;
- (NSMutableData)uscSamples;
- (NSNumber)dylib;
- (NSString)type;
- (ShaderBinaryInfo)init;
- (void)setAnalyzerResult:(id)a3;
- (void)setBinary:(id)a3;
- (void)setDylib:(id)a3;
- (void)setType:(id)a3;
- (void)setUscSamples:(id)a3;
@end

@implementation ShaderBinaryInfo

- (ShaderBinaryInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ShaderBinaryInfo;
  v2 = -[ShaderBinaryInfo init](&v6, "init");
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (NSData)binary
{
  return self->_binary;
}

- (void)setBinary:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSNumber)dylib
{
  return self->_dylib;
}

- (void)setDylib:(id)a3
{
}

- (NSMutableData)uscSamples
{
  return self->_uscSamples;
}

- (void)setUscSamples:(id)a3
{
}

- (DYShaderAnalyzerResult)analyzerResult
{
  return self->_analyzerResult;
}

- (void)setAnalyzerResult:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
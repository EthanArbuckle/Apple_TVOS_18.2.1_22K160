@interface SLODLDConfigDecoder
- (BOOL)isSPMModelMmapable;
- (NSDictionary)dictionary;
- (NSString)resourcePath;
- (SLODLDConfigDecoder)initWithConfigFile:(id)a3;
- (id)getBertModelFile;
- (id)getBertModelOutputNodes;
- (id)getConfigVersion;
- (id)getOdldModelBnnsIrWeightFile;
- (id)getOutputSpecs;
- (id)getRegexMapConfig;
- (id)getSPMEncoderOptions;
- (id)getSPMModelFile;
- (unint64_t)getInputType;
- (unint64_t)getPreProcessorType;
- (unint64_t)getTokenizerType;
- (void)setDictionary:(id)a3;
- (void)setResourcePath:(id)a3;
@end

@implementation SLODLDConfigDecoder

- (SLODLDConfigDecoder)initWithConfigFile:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SLODLDConfigDecoder;
  v5 = -[SLODLDConfigDecoder init](&v18, "init");
  if (!v5) {
    goto LABEL_8;
  }
  v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[CSFModelConfigDecoder decodeJsonFromFile:]( &OBJC_CLASS___CSFModelConfigDecoder,  "decodeJsonFromFile:",  v4));
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", @"version"));

    if (v8)
    {
LABEL_7:
      uint64_t v14 = objc_claimAutoreleasedReturnValue([v4 stringByDeletingLastPathComponent]);
      resourcePath = v5->_resourcePath;
      v5->_resourcePath = (NSString *)v14;

      NSLog(@"Decoded config at path: %@", v5->_resourcePath);
      dictionary = v5->_dictionary;
      v5->_dictionary = v7;

LABEL_8:
      v13 = v5;
      goto LABEL_9;
    }
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Missing config for regex matcher %@",  v7));
  v19 = @"reason";
  v20 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.sl",  115LL,  v10));

  if (!v11)
  {

    goto LABEL_7;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedDescription]);
  NSLog(@"%@", v12);

  v13 = 0LL;
LABEL_9:

  return v13;
}

- (id)getConfigVersion
{
  return -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", @"version");
}

- (unint64_t)getInputType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_dictionary,  "objectForKeyedSubscript:",  @"inputType"));
  if ([v2 isEqualToString:@"PostITN"])
  {
    unint64_t v3 = 1LL;
  }

  else if ([v2 isEqualToString:@"PreITN"])
  {
    unint64_t v3 = 2LL;
  }

  else
  {
    unint64_t v3 = 0LL;
  }

  return v3;
}

- (id)getOutputSpecs
{
  return -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", @"outputSpecs");
}

- (unint64_t)getPreProcessorType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[CSFModelConfigDecoder getOdldValueForKey:categoryKey:configDict:]( &OBJC_CLASS___CSFModelConfigDecoder,  "getOdldValueForKey:categoryKey:configDict:",  @"preprocessing",  kODLDPipelineKey,  self->_dictionary));
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"regexMapConfig"]);

  return v3 != 0LL;
}

- (unint64_t)getTokenizerType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[CSFModelConfigDecoder getOdldValueForKey:categoryKey:configDict:]( &OBJC_CLASS___CSFModelConfigDecoder,  "getOdldValueForKey:categoryKey:configDict:",  @"tokenizer",  kODLDPipelineKey,  self->_dictionary));
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"spmModel"]);

  return v3 != 0LL;
}

- (id)getRegexMapConfig
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSFModelConfigDecoder getOdldValueForKey:categoryKey:configDict:]( &OBJC_CLASS___CSFModelConfigDecoder,  "getOdldValueForKey:categoryKey:configDict:",  @"preprocessing",  kODLDPipelineKey,  self->_dictionary));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"regexMapConfig"]);

  if (v4)
  {
    resourcePath = self->_resourcePath;
    v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"regexMapConfig"]);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingPathComponent:](resourcePath, "stringByAppendingPathComponent:", v6));
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

- (id)getSPMModelFile
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSFModelConfigDecoder getOdldValueForKey:categoryKey:configDict:]( &OBJC_CLASS___CSFModelConfigDecoder,  "getOdldValueForKey:categoryKey:configDict:",  @"tokenizer",  kODLDPipelineKey,  self->_dictionary));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"spmModel"]);

  if (v4)
  {
    resourcePath = self->_resourcePath;
    v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"spmModel"]);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingPathComponent:](resourcePath, "stringByAppendingPathComponent:", v6));
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

- (id)getSPMEncoderOptions
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[CSFModelConfigDecoder getOdldValueForKey:categoryKey:configDict:]( &OBJC_CLASS___CSFModelConfigDecoder,  "getOdldValueForKey:categoryKey:configDict:",  @"tokenizer",  kODLDPipelineKey,  self->_dictionary));
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"spmEncodeOptions"]);

  if (v3) {
    unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"spmEncodeOptions"]);
  }

  return v3;
}

- (id)getBertModelFile
{
  return +[CSFModelConfigDecoder getOdldModelFileFromConfigDict:resourcePath:]( &OBJC_CLASS___CSFModelConfigDecoder,  "getOdldModelFileFromConfigDict:resourcePath:",  self->_dictionary,  self->_resourcePath);
}

- (id)getOdldModelBnnsIrWeightFile
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSFModelConfigDecoder getOdldValueForKey:categoryKey:configDict:]( &OBJC_CLASS___CSFModelConfigDecoder,  "getOdldValueForKey:categoryKey:configDict:",  @"BnnsIrWeightFile",  kODLDPipelineKey,  self->_dictionary));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SLODLDConfigDecoder getBertModelFile](self, "getBertModelFile"));
  if ([v4 hasSuffix:CSBnnsIrSuffix]
    && (v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"BnnsIrWeightFile"]),
        v5,
        v5))
  {
    resourcePath = self->_resourcePath;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"BnnsIrWeightFile"]);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingPathComponent:](resourcePath, "stringByAppendingPathComponent:", v7));
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (id)getBertModelOutputNodes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[CSFModelConfigDecoder getOdldValueForKey:categoryKey:configDict:]( &OBJC_CLASS___CSFModelConfigDecoder,  "getOdldValueForKey:categoryKey:configDict:",  kODLDModelKey,  kODLDPipelineKey,  self->_dictionary));
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"outputNodeName"]);

  if (v3) {
    unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"outputNodeName"]);
  }

  return v3;
}

- (BOOL)isSPMModelMmapable
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[CSFModelConfigDecoder getOdldValueForKey:categoryKey:configDict:]( &OBJC_CLASS___CSFModelConfigDecoder,  "getOdldValueForKey:categoryKey:configDict:",  @"tokenizer",  kODLDPipelineKey,  self->_dictionary));
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"mmapModel"]);

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"mmapModel"]);
    LOBYTE(v3) = [v4 BOOLValue];
  }

  return (char)v3;
}

- (NSString)resourcePath
{
  return self->_resourcePath;
}

- (void)setResourcePath:(id)a3
{
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
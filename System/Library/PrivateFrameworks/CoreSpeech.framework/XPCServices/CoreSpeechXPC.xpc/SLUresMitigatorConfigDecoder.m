@interface SLUresMitigatorConfigDecoder
- (SLUresMitigatorConfigDecoder)initWithConfigFile:(id)a3 errOut:(id *)a4;
- (id)getBnnsIrWeightFile;
- (id)getInputOpsMap;
- (id)getModelFile;
- (id)getOutputMap;
- (id)getSupportedInputOrigins;
- (id)getVersion;
@end

@implementation SLUresMitigatorConfigDecoder

- (SLUresMitigatorConfigDecoder)initWithConfigFile:(id)a3 errOut:(id *)a4
{
  id v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___SLUresMitigatorConfigDecoder;
  v7 = -[SLUresMitigatorConfigDecoder init](&v26, "init");
  if (!v7) {
    goto LABEL_11;
  }
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 stringByDeletingLastPathComponent]);
  resourcePath = v7->_resourcePath;
  v7->_resourcePath = (NSString *)v8;

  uint64_t v10 = objc_claimAutoreleasedReturnValue(+[CSFModelConfigDecoder decodeJsonFromFile:](&OBJC_CLASS___CSFModelConfigDecoder, "decodeJsonFromFile:", v6));
  configDict = v7->_configDict;
  v7->_configDict = (NSDictionary *)v10;

  v12 = v7->_configDict;
  if (v12)
  {
    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", kUresMitigatorModelFileKey));
    if (v13)
    {
      v14 = (void *)v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v7->_configDict,  "objectForKeyedSubscript:",  @"InputOpsMap"));
      uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v7->_configDict,  "objectForKeyedSubscript:",  @"OutputMap"));
        uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        char isKindOfClass = objc_opt_isKindOfClass(v17, v18);

        if ((isKindOfClass & 1) != 0) {
          goto LABEL_11;
        }
      }

      else
      {
      }
    }
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Missing config for Ures %@",  v7->_configDict));
  v27 = @"reason";
  v28 = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.sl",  105LL,  v21));

  if (!a4)
  {

LABEL_11:
    v24 = v7;
    goto LABEL_12;
  }

  id v23 = v22;
  *a4 = v23;

  v24 = 0LL;
LABEL_12:

  return v24;
}

- (id)getModelFile
{
  uint64_t v3 = kUresMitigatorModelFileKey;
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_configDict,  "objectForKeyedSubscript:",  kUresMitigatorModelFileKey));

  if (v4)
  {
    resourcePath = self->_resourcePath;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_configDict, "objectForKeyedSubscript:", v3));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingPathComponent:](resourcePath, "stringByAppendingPathComponent:", v6));
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

- (id)getBnnsIrWeightFile
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_configDict,  "objectForKeyedSubscript:",  @"BnnsIrWeightFile"));

  if (v3)
  {
    resourcePath = self->_resourcePath;
    v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_configDict,  "objectForKeyedSubscript:",  @"BnnsIrWeightFile"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingPathComponent:](resourcePath, "stringByAppendingPathComponent:", v5));
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (id)getVersion
{
  return -[NSDictionary objectForKeyedSubscript:](self->_configDict, "objectForKeyedSubscript:", @"Version");
}

- (id)getInputOpsMap
{
  return -[NSDictionary objectForKeyedSubscript:](self->_configDict, "objectForKeyedSubscript:", @"InputOpsMap");
}

- (id)getOutputMap
{
  return -[NSDictionary objectForKeyedSubscript:](self->_configDict, "objectForKeyedSubscript:", @"OutputMap");
}

- (id)getSupportedInputOrigins
{
  return -[NSDictionary objectForKeyedSubscript:]( self->_configDict,  "objectForKeyedSubscript:",  @"SupportedInputOrigins");
}

- (void).cxx_destruct
{
}

@end
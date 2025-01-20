@interface CSVoiceTriggerRTModel
+ (BOOL)supportsSecureCoding;
- (CSVoiceTriggerRTModel)initWithCoder:(id)a3;
- (CSVoiceTriggerRTModel)initWithData:(id)a3 hash:(id)a4 locale:(id)a5;
- (CSVoiceTriggerRTModel)initWithData:(id)a3 hash:(id)a4 locale:(id)a5 digest:(id)a6 signature:(id)a7 certificate:(id)a8;
- (CSVoiceTriggerRTModel)initWithHash:(id)a3 locale:(id)a4;
- (NSData)certificate;
- (NSData)digest;
- (NSData)modelData;
- (NSData)signature;
- (NSString)modelHash;
- (NSString)modelLocale;
- (id)builtInRTModelDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CSVoiceTriggerRTModel

- (CSVoiceTriggerRTModel)initWithData:(id)a3 hash:(id)a4 locale:(id)a5 digest:(id)a6 signature:(id)a7 certificate:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___CSVoiceTriggerRTModel;
  v18 = -[CSVoiceTriggerRTModel init](&v24, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_modelData, a3);
    objc_storeStrong((id *)&v19->_modelHash, a4);
    objc_storeStrong((id *)&v19->_modelLocale, a5);
    objc_storeStrong((id *)&v19->_digest, a6);
    objc_storeStrong((id *)&v19->_signature, a7);
    objc_storeStrong((id *)&v19->_certificate, a8);
  }

  return v19;
}

- (CSVoiceTriggerRTModel)initWithHash:(id)a3 locale:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CSVoiceTriggerRTModel;
  v9 = -[CSVoiceTriggerRTModel init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_modelHash, a3);
    objc_storeStrong((id *)&v10->_modelLocale, a4);
  }

  return v10;
}

- (CSVoiceTriggerRTModel)initWithData:(id)a3 hash:(id)a4 locale:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CSVoiceTriggerRTModel;
  objc_super v12 = -[CSVoiceTriggerRTModel init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_modelData, a3);
    objc_storeStrong((id *)&v13->_modelHash, a4);
    objc_storeStrong((id *)&v13->_modelLocale, a5);
  }

  return v13;
}

- (CSVoiceTriggerRTModel)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___CSVoiceTriggerRTModel;
  v5 = -[CSVoiceTriggerRTModel init](&v25, "init");
  if (v5)
  {
    if ([v4 containsValueForKey:@"RTModelData"])
    {
      id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"RTModelData"];
      uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
      modelData = v5->_modelData;
      v5->_modelData = (NSData *)v7;
    }

    if ([v4 containsValueForKey:@"RTModelHash"])
    {
      id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"RTModelHash"];
      uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
      modelHash = v5->_modelHash;
      v5->_modelHash = (NSString *)v10;
    }

    if ([v4 containsValueForKey:@"RTModelLocale"])
    {
      id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"RTModelLocale"];
      uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
      modelLocale = v5->_modelLocale;
      v5->_modelLocale = (NSString *)v13;
    }

    if ([v4 containsValueForKey:@"RTModelDigest"])
    {
      id v15 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"RTModelDigest"];
      uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
      digest = v5->_digest;
      v5->_digest = (NSData *)v16;
    }

    if ([v4 containsValueForKey:@"RTModelSignature"])
    {
      id v18 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"RTModelSignature"];
      uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
      signature = v5->_signature;
      v5->_signature = (NSData *)v19;
    }

    if ([v4 containsValueForKey:@"RTModelCertificate"])
    {
      id v21 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"RTModelCertificate"];
      uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
      certificate = v5->_certificate;
      v5->_certificate = (NSData *)v22;
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc(&OBJC_CLASS___CSVoiceTriggerRTModel);
  id v5 = -[NSData copy](self->_modelData, "copy");
  id v6 = -[NSString copy](self->_modelHash, "copy");
  id v7 = -[NSString copy](self->_modelLocale, "copy");
  id v8 = -[NSData copy](self->_digest, "copy");
  id v9 = -[NSData copy](self->_signature, "copy");
  id v10 = -[NSData copy](self->_certificate, "copy");
  id v11 = -[CSVoiceTriggerRTModel initWithData:hash:locale:digest:signature:certificate:]( v4,  "initWithData:hash:locale:digest:signature:certificate:",  v5,  v6,  v7,  v8,  v9,  v10);

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  modelData = self->_modelData;
  id v11 = v4;
  if (modelData)
  {
    [v4 encodeObject:modelData forKey:@"RTModelData"];
    id v4 = v11;
  }

  modelHash = self->_modelHash;
  if (modelHash)
  {
    [v11 encodeObject:modelHash forKey:@"RTModelHash"];
    id v4 = v11;
  }

  modelLocale = self->_modelLocale;
  if (modelLocale)
  {
    [v11 encodeObject:modelLocale forKey:@"RTModelLocale"];
    id v4 = v11;
  }

  digest = self->_digest;
  if (digest)
  {
    [v11 encodeObject:digest forKey:@"RTModelDigest"];
    id v4 = v11;
  }

  signature = self->_signature;
  if (signature)
  {
    [v11 encodeObject:signature forKey:@"RTModelSignature"];
    id v4 = v11;
  }

  certificate = self->_certificate;
  if (certificate)
  {
    [v11 encodeObject:certificate forKey:@"RTModelCertificate"];
    id v4 = v11;
  }
}

- (id)builtInRTModelDictionary
{
  if (!self->_modelData || !self->_modelHash || !self->_modelLocale) {
    return 0LL;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(@"RT Model for ", "stringByAppendingString:"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingString:@" from asset "]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingString:self->_modelHash]);
  modelData = self->_modelData;
  v9[0] = @"CorealisRTModel";
  v9[1] = @"CorealisRTModelVersion";
  v10[0] = modelData;
  v10[1] = v5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  2LL));

  return v7;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  NSUInteger v4 = -[NSData length](self->_modelData, "length");
  modelLocale = self->_modelLocale;
  modelHash = self->_modelHash;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSData base64EncodedStringWithOptions:](self->_digest, "base64EncodedStringWithOptions:", 0LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 substringToIndex:5]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSData base64EncodedStringWithOptions:](self->_certificate, "base64EncodedStringWithOptions:", 0LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 substringToIndex:5]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSData base64EncodedStringWithOptions:](self->_signature, "base64EncodedStringWithOptions:", 0LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 substringToIndex:5]);
  [v3 appendFormat:@"dataSize(%d), hash(%@), locale(%@), digest(%@), cert(%@), signature(%@)", v4, modelHash, modelLocale, v8, v10, v12];

  return v3;
}

- (NSData)modelData
{
  return self->_modelData;
}

- (NSString)modelLocale
{
  return self->_modelLocale;
}

- (NSString)modelHash
{
  return self->_modelHash;
}

- (NSData)digest
{
  return self->_digest;
}

- (NSData)signature
{
  return self->_signature;
}

- (NSData)certificate
{
  return self->_certificate;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
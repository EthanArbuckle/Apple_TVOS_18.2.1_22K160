@interface VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContextInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContextInfo)initWithDictionary:(id)a3;
- (VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContextInfo)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
@end

@implementation VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContextInfo

- (BOOL)readFrom:(id)a3
{
  return VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContextInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = [v4 isMemberOfClass:objc_opt_class(self)];

  return (char)self;
}

- (unint64_t)hash
{
  return 0LL;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  -[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContextInfo willProduceDictionaryRepresentation:]( self,  "willProduceDictionaryRepresentation:",  v3);
  return v3;
}

- (NSData)jsonData
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContextInfo dictionaryRepresentation]( self,  "dictionaryRepresentation"));
  if (+[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v2)) {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v2,  0LL,  0LL));
  }
  else {
    v3 = 0LL;
  }

  return (NSData *)v3;
}

- (VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContextInfo)initWithJSON:(id)a3
{
  uint64_t v8 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  a3,  0LL,  &v8));
  if (v8 || (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v4, v5) & 1) == 0))
  {
    v6 = 0LL;
  }

  else
  {
    self =  -[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContextInfo initWithDictionary:]( self,  "initWithDictionary:",  v4);
    v6 = self;
  }

  return v6;
}

- (VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContextInfo)initWithDictionary:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContextInfo;
  v3 = -[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContextInfo init](&v7, "init", a3);
  id v4 = v3;
  if (v3) {
    uint64_t v5 = v3;
  }

  return v4;
}

@end
@interface SiriLinkFlowProvisionalLinkActionParameter
- (BOOL)hasName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)name;
- (SiriLinkFlowProvisionalLinkActionParameter)initWithDictionary:(id)a3;
- (SiriLinkFlowProvisionalLinkActionParameter)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setHasName:(BOOL)a3;
- (void)setName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SiriLinkFlowProvisionalLinkActionParameter

- (BOOL)hasName
{
  return self->_name != 0LL;
}

- (BOOL)readFrom:(id)a3
{
  return SiriLinkFlowProvisionalLinkActionParameterReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalLinkActionParameter name](self, "name"));

  if (v4) {
    PBDataWriterWriteStringField(v5, self->_name, 1LL);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class(self)])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalLinkActionParameter name](self, "name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    v7 = v6;
    if ((v5 == 0LL) != (v6 != 0LL))
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalLinkActionParameter name](self, "name"));
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }

      v9 = (void *)v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalLinkActionParameter name](self, "name"));
      v11 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
      unsigned __int8 v12 = [v10 isEqual:v11];

      if ((v12 & 1) != 0) {
        goto LABEL_10;
      }
    }

    else
    {
    }
  }

  BOOL v13 = 0;
LABEL_8:

  return v13;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_name, "hash");
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (self->_name)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalLinkActionParameter name](self, "name"));
    id v5 = [v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"name"];
  }

  return v3;
}

- (NSData)jsonData
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[SiriLinkFlowProvisionalLinkActionParameter dictionaryRepresentation]( self,  "dictionaryRepresentation"));
  if (+[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v2)) {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v2,  0LL,  0LL));
  }
  else {
    v3 = 0LL;
  }

  return (NSData *)v3;
}

- (SiriLinkFlowProvisionalLinkActionParameter)initWithJSON:(id)a3
{
  uint64_t v8 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  a3,  0LL,  &v8));
  if (v8 || (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v4, v5) & 1) == 0))
  {
    v6 = 0LL;
  }

  else
  {
    self = -[SiriLinkFlowProvisionalLinkActionParameter initWithDictionary:](self, "initWithDictionary:", v4);
    v6 = self;
  }

  return v6;
}

- (SiriLinkFlowProvisionalLinkActionParameter)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SiriLinkFlowProvisionalLinkActionParameter;
  uint64_t v5 = -[SiriLinkFlowProvisionalLinkActionParameter init](&v11, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"name"]);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      id v8 = [v6 copy];
      -[SiriLinkFlowProvisionalLinkActionParameter setName:](v5, "setName:", v8);
    }

    v9 = v5;
  }

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void)setHasName:(BOOL)a3
{
  self->_hasName = a3;
}

- (void).cxx_destruct
{
}

@end
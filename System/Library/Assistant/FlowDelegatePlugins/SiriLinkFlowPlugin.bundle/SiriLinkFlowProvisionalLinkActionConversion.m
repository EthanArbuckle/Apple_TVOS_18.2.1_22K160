@interface SiriLinkFlowProvisionalLinkActionConversion
- (BOOL)hasIsSuccess;
- (BOOL)hasOutcome;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSuccess;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)outcome;
- (SiriLinkFlowProvisionalLinkActionConversion)initWithDictionary:(id)a3;
- (SiriLinkFlowProvisionalLinkActionConversion)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setHasIsSuccess:(BOOL)a3;
- (void)setHasOutcome:(BOOL)a3;
- (void)setIsSuccess:(BOOL)a3;
- (void)setOutcome:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SiriLinkFlowProvisionalLinkActionConversion

- (BOOL)hasOutcome
{
  return self->_outcome != 0LL;
}

- (void)setIsSuccess:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isSuccess = a3;
}

- (BOOL)hasIsSuccess
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsSuccess:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)readFrom:(id)a3
{
  return SiriLinkFlowProvisionalLinkActionConversionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalLinkActionConversion outcome](self, "outcome"));

  if (v4) {
    PBDataWriterWriteStringField(v5, self->_outcome, 1LL);
  }
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteBOOLField(v5, self->_isSuccess, 2LL);
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalLinkActionConversion outcome](self, "outcome"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 outcome]);
  v7 = v6;
  if ((v5 == 0LL) == (v6 != 0LL))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }

  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalLinkActionConversion outcome](self, "outcome"));
  if (v8)
  {
    v9 = (void *)v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalLinkActionConversion outcome](self, "outcome"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 outcome]);
    unsigned int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_12;
    }
  }

  else
  {
  }

  if ((v4[20] & 1) != (*(_BYTE *)&self->_has & 1)) {
    goto LABEL_12;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    int isSuccess = self->_isSuccess;
  }

  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_outcome, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v4 = 2654435761LL * self->_isSuccess;
  }
  else {
    uint64_t v4 = 0LL;
  }
  return v4 ^ v3;
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SiriLinkFlowProvisionalLinkActionConversion isSuccess](self, "isSuccess")));
    [v3 setObject:v4 forKeyedSubscript:@"isSuccess"];
  }

  if (self->_outcome)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalLinkActionConversion outcome](self, "outcome"));
    id v6 = [v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"outcome"];
  }

  return v3;
}

- (NSData)jsonData
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[SiriLinkFlowProvisionalLinkActionConversion dictionaryRepresentation]( self,  "dictionaryRepresentation"));
  if (+[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v2)) {
    NSUInteger v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v2,  0LL,  0LL));
  }
  else {
    NSUInteger v3 = 0LL;
  }

  return (NSData *)v3;
}

- (SiriLinkFlowProvisionalLinkActionConversion)initWithJSON:(id)a3
{
  uint64_t v8 = 0LL;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  a3,  0LL,  &v8));
  if (v8 || (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v4, v5) & 1) == 0))
  {
    id v6 = 0LL;
  }

  else
  {
    self = -[SiriLinkFlowProvisionalLinkActionConversion initWithDictionary:](self, "initWithDictionary:", v4);
    id v6 = self;
  }

  return v6;
}

- (SiriLinkFlowProvisionalLinkActionConversion)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SiriLinkFlowProvisionalLinkActionConversion;
  uint64_t v5 = -[SiriLinkFlowProvisionalLinkActionConversion init](&v13, "init");
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"outcome"]);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      id v8 = [v6 copy];
      -[SiriLinkFlowProvisionalLinkActionConversion setOutcome:](v5, "setOutcome:", v8);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"isSuccess"]);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0) {
      -[SiriLinkFlowProvisionalLinkActionConversion setIsSuccess:](v5, "setIsSuccess:", [v9 BOOLValue]);
    }
    v11 = v5;
  }

  return v5;
}

- (NSString)outcome
{
  return self->_outcome;
}

- (void)setOutcome:(id)a3
{
}

- (BOOL)isSuccess
{
  return self->_isSuccess;
}

- (void)setHasOutcome:(BOOL)a3
{
  self->_hasOutcome = a3;
}

- (void).cxx_destruct
{
}

@end
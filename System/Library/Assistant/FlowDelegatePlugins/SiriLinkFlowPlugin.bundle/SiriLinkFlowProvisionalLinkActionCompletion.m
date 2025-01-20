@interface SiriLinkFlowProvisionalLinkActionCompletion
- (BOOL)hasAction;
- (BOOL)hasErrorDescription;
- (BOOL)hasIsSuccess;
- (BOOL)hasTargetBundle;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSuccess;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)errorDescription;
- (NSString)targetBundle;
- (SiriLinkFlowProvisionalLinkAction)action;
- (SiriLinkFlowProvisionalLinkActionCompletion)initWithDictionary:(id)a3;
- (SiriLinkFlowProvisionalLinkActionCompletion)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setAction:(id)a3;
- (void)setErrorDescription:(id)a3;
- (void)setHasAction:(BOOL)a3;
- (void)setHasErrorDescription:(BOOL)a3;
- (void)setHasIsSuccess:(BOOL)a3;
- (void)setHasTargetBundle:(BOOL)a3;
- (void)setIsSuccess:(BOOL)a3;
- (void)setTargetBundle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SiriLinkFlowProvisionalLinkActionCompletion

- (BOOL)hasTargetBundle
{
  return self->_targetBundle != 0LL;
}

- (BOOL)hasAction
{
  return self->_action != 0LL;
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

- (BOOL)hasErrorDescription
{
  return self->_errorDescription != 0LL;
}

- (BOOL)readFrom:(id)a3
{
  return SiriLinkFlowProvisionalLinkActionCompletionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalLinkActionCompletion targetBundle](self, "targetBundle"));

  if (v4) {
    PBDataWriterWriteStringField(v9, self->_targetBundle, 1LL);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalLinkActionCompletion action](self, "action"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalLinkActionCompletion action](self, "action"));
    PBDataWriterWriteSubmessage(v9, v6, 2LL);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteBOOLField(v9, self->_isSuccess, 3LL);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalLinkActionCompletion errorDescription](self, "errorDescription"));

  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField(v9, self->_errorDescription, 4LL);
    v8 = v9;
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalLinkActionCompletion targetBundle](self, "targetBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 targetBundle]);
  if ((v5 == 0LL) == (v6 != 0LL)) {
    goto LABEL_19;
  }
  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalLinkActionCompletion targetBundle](self, "targetBundle"));
  if (v7)
  {
    v8 = (void *)v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalLinkActionCompletion targetBundle](self, "targetBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 targetBundle]);
    unsigned int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_20;
    }
  }

  else
  {
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalLinkActionCompletion action](self, "action"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 action]);
  if ((v5 == 0LL) == (v6 != 0LL)) {
    goto LABEL_19;
  }
  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalLinkActionCompletion action](self, "action"));
  if (v12)
  {
    v13 = (void *)v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalLinkActionCompletion action](self, "action"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v4 action]);
    unsigned int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_20;
    }
  }

  else
  {
  }

  if ((v4[40] & 1) != (*(_BYTE *)&self->_has & 1)) {
    goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    int isSuccess = self->_isSuccess;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalLinkActionCompletion errorDescription](self, "errorDescription"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 errorDescription]);
  if ((v5 == 0LL) != (v6 != 0LL))
  {
    uint64_t v18 = objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalLinkActionCompletion errorDescription](self, "errorDescription"));
    if (!v18)
    {

LABEL_23:
      BOOL v23 = 1;
      goto LABEL_21;
    }

    v19 = (void *)v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalLinkActionCompletion errorDescription](self, "errorDescription"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v4 errorDescription]);
    unsigned __int8 v22 = [v20 isEqual:v21];

    if ((v22 & 1) != 0) {
      goto LABEL_23;
    }
  }

  else
  {
LABEL_19:
  }

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_targetBundle, "hash");
  unint64_t v4 = -[SiriLinkFlowProvisionalLinkAction hash](self->_action, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v5 = 2654435761LL * self->_isSuccess;
  }
  else {
    uint64_t v5 = 0LL;
  }
  return v4 ^ v3 ^ v5 ^ -[NSString hash](self->_errorDescription, "hash");
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (self->_action)
  {
    unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalLinkActionCompletion action](self, "action"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dictionaryRepresentation]);
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"action"];
    }

    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      [v3 setObject:v6 forKeyedSubscript:@"action"];
    }
  }

  if (self->_errorDescription)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalLinkActionCompletion errorDescription](self, "errorDescription"));
    id v8 = [v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"errorDescription"];
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SiriLinkFlowProvisionalLinkActionCompletion isSuccess](self, "isSuccess")));
    [v3 setObject:v9 forKeyedSubscript:@"isSuccess"];
  }

  if (self->_targetBundle)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalLinkActionCompletion targetBundle](self, "targetBundle"));
    id v11 = [v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"targetBundle"];
  }

  return v3;
}

- (NSData)jsonData
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[SiriLinkFlowProvisionalLinkActionCompletion dictionaryRepresentation]( self,  "dictionaryRepresentation"));
  if (+[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v2)) {
    NSUInteger v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v2,  0LL,  0LL));
  }
  else {
    NSUInteger v3 = 0LL;
  }

  return (NSData *)v3;
}

- (SiriLinkFlowProvisionalLinkActionCompletion)initWithJSON:(id)a3
{
  uint64_t v8 = 0LL;
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  a3,  0LL,  &v8));
  if (v8 || (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v4, v5) & 1) == 0))
  {
    v6 = 0LL;
  }

  else
  {
    self = -[SiriLinkFlowProvisionalLinkActionCompletion initWithDictionary:](self, "initWithDictionary:", v4);
    v6 = self;
  }

  return v6;
}

- (SiriLinkFlowProvisionalLinkActionCompletion)initWithDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___SiriLinkFlowProvisionalLinkActionCompletion;
  uint64_t v5 = -[SiriLinkFlowProvisionalLinkActionCompletion init](&v19, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"targetBundle"]);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      id v8 = [v6 copy];
      -[SiriLinkFlowProvisionalLinkActionCompletion setTargetBundle:](v5, "setTargetBundle:", v8);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"action"]);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    {
      id v11 = -[SiriLinkFlowProvisionalLinkAction initWithDictionary:]( objc_alloc(&OBJC_CLASS___SiriLinkFlowProvisionalLinkAction),  "initWithDictionary:",  v9);
      -[SiriLinkFlowProvisionalLinkActionCompletion setAction:](v5, "setAction:", v11);
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"isSuccess"]);
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0) {
      -[SiriLinkFlowProvisionalLinkActionCompletion setIsSuccess:](v5, "setIsSuccess:", [v12 BOOLValue]);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"errorDescription"]);
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
    {
      id v16 = [v14 copy];
      -[SiriLinkFlowProvisionalLinkActionCompletion setErrorDescription:](v5, "setErrorDescription:", v16);
    }

    v17 = v5;
  }

  return v5;
}

- (NSString)targetBundle
{
  return self->_targetBundle;
}

- (void)setTargetBundle:(id)a3
{
}

- (SiriLinkFlowProvisionalLinkAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (BOOL)isSuccess
{
  return self->_isSuccess;
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (void)setErrorDescription:(id)a3
{
}

- (void)setHasTargetBundle:(BOOL)a3
{
  self->_hasTargetBundle = a3;
}

- (void)setHasAction:(BOOL)a3
{
  self->_hasAction = a3;
}

- (void)setHasErrorDescription:(BOOL)a3
{
  self->_hasErrorDescription = a3;
}

- (void).cxx_destruct
{
}

@end
@interface SiriLinkFlowProvisionalLinkAction
- (BOOL)hasIdentifier;
- (BOOL)hasPresentationStyle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)parameters;
- (NSData)jsonData;
- (NSString)identifier;
- (SiriLinkFlowProvisionalLinkAction)initWithDictionary:(id)a3;
- (SiriLinkFlowProvisionalLinkAction)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)parametersAtIndex:(unint64_t)a3;
- (int)presentationStyle;
- (unint64_t)hash;
- (unint64_t)parametersCount;
- (void)addParameters:(id)a3;
- (void)clearParameters;
- (void)setHasIdentifier:(BOOL)a3;
- (void)setHasPresentationStyle:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setParameters:(id)a3;
- (void)setPresentationStyle:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SiriLinkFlowProvisionalLinkAction

- (BOOL)hasIdentifier
{
  return self->_identifier != 0LL;
}

- (void)setPresentationStyle:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_presentationStyle = a3;
}

- (BOOL)hasPresentationStyle
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasPresentationStyle:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)clearParameters
{
}

- (void)addParameters:(id)a3
{
  id v4 = a3;
  parameters = self->_parameters;
  id v8 = v4;
  if (!parameters)
  {
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v7 = self->_parameters;
    self->_parameters = v6;

    id v4 = v8;
    parameters = self->_parameters;
  }

  -[NSArray addObject:](parameters, "addObject:", v4);
}

- (unint64_t)parametersCount
{
  return -[NSArray count](self->_parameters, "count");
}

- (id)parametersAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_parameters, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return SiriLinkFlowProvisionalLinkActionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalLinkAction identifier](self, "identifier"));

  if (v5) {
    PBDataWriterWriteStringField(v4, self->_identifier, 1LL);
  }
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteInt32Field(v4, self->_presentationStyle, 2LL);
  }
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v6 = self->_parameters;
  id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage(v4, *(void *)(*((void *)&v11 + 1) + 8LL * (void)v10), 3LL);
        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v8);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalLinkAction identifier](self, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  if ((v5 == 0LL) == (v6 != 0LL)) {
    goto LABEL_14;
  }
  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalLinkAction identifier](self, "identifier"));
  if (v7)
  {
    id v8 = (void *)v7;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalLinkAction identifier](self, "identifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    unsigned int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_15;
    }
  }

  else
  {
  }

  if ((v4[32] & 1) != (*(_BYTE *)&self->_has & 1)) {
    goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    int presentationStyle = self->_presentationStyle;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalLinkAction parameters](self, "parameters"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 parameters]);
  if ((v5 == 0LL) != (v6 != 0LL))
  {
    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalLinkAction parameters](self, "parameters"));
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }

    __int128 v14 = (void *)v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalLinkAction parameters](self, "parameters"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v4 parameters]);
    unsigned __int8 v17 = [v15 isEqual:v16];

    if ((v17 & 1) != 0) {
      goto LABEL_18;
    }
  }

  else
  {
LABEL_14:
  }

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_identifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v4 = 2654435761LL * self->_presentationStyle;
  }
  else {
    uint64_t v4 = 0LL;
  }
  return v4 ^ v3 ^ (unint64_t)-[NSArray hash](self->_parameters, "hash");
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (self->_identifier)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalLinkAction identifier](self, "identifier"));
    id v5 = [v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"identifier"];
  }

  if (-[NSArray count](self->_parameters, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    uint64_t v7 = self->_parameters;
    id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v17 + 1) + 8 * (void)i) dictionaryRepresentation]);
          if (v12)
          {
            [v6 addObject:v12];
          }

          else
          {
            uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
            [v6 addObject:v13];
          }
        }

        id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
      }

      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"parameters"];
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    uint64_t v14 = -[SiriLinkFlowProvisionalLinkAction presentationStyle](self, "presentationStyle");
    if (v14 >= 4) {
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  v14));
    }
    else {
      v15 = off_1EC3A0[(int)v14];
    }
    [v3 setObject:v15 forKeyedSubscript:@"presentationStyle"];
  }

  return v3;
}

- (NSData)jsonData
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalLinkAction dictionaryRepresentation](self, "dictionaryRepresentation"));
  if (+[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v2)) {
    NSUInteger v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v2,  0LL,  0LL));
  }
  else {
    NSUInteger v3 = 0LL;
  }

  return (NSData *)v3;
}

- (SiriLinkFlowProvisionalLinkAction)initWithJSON:(id)a3
{
  uint64_t v8 = 0LL;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  a3,  0LL,  &v8));
  if (v8 || (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v4, v5) & 1) == 0))
  {
    v6 = 0LL;
  }

  else
  {
    self = -[SiriLinkFlowProvisionalLinkAction initWithDictionary:](self, "initWithDictionary:", v4);
    v6 = self;
  }

  return v6;
}

- (SiriLinkFlowProvisionalLinkAction)initWithDictionary:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___SiriLinkFlowProvisionalLinkAction;
  uint64_t v5 = -[SiriLinkFlowProvisionalLinkAction init](&v28, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"identifier"]);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      id v8 = [v6 copy];
      -[SiriLinkFlowProvisionalLinkAction setIdentifier:](v5, "setIdentifier:", v8);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"presentationStyle"]);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0) {
      -[SiriLinkFlowProvisionalLinkAction setPresentationStyle:]( v5,  "setPresentationStyle:",  [v9 intValue]);
    }
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"parameters"]);
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    {
      v23 = v9;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      id v13 = v11;
      id v14 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v25;
        do
        {
          for (i = 0LL; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v25 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)i);
            uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSDictionary);
            if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
            {
              __int128 v20 = -[SiriLinkFlowProvisionalLinkActionParameter initWithDictionary:]( objc_alloc(&OBJC_CLASS___SiriLinkFlowProvisionalLinkActionParameter),  "initWithDictionary:",  v18);
              -[SiriLinkFlowProvisionalLinkAction addParameters:](v5, "addParameters:", v20);
            }
          }

          id v15 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
        }

        while (v15);
      }

      id v9 = v23;
    }

    v21 = v5;
  }

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int)presentationStyle
{
  return self->_presentationStyle;
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (void)setHasIdentifier:(BOOL)a3
{
  self->_hasIdentifier = a3;
}

- (void).cxx_destruct
{
}

@end
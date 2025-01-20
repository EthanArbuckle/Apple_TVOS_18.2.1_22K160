@interface SiriLinkFlowProvisionalSiriLinkFlowClientEvent
- (BOOL)hasEventMetadata;
- (BOOL)hasLinkActionCompletion;
- (BOOL)hasLinkActionConversion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isProvisional;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWEventMetadata)eventMetadata;
- (NSData)jsonData;
- (SiriLinkFlowProvisionalLinkActionCompletion)linkActionCompletion;
- (SiriLinkFlowProvisionalLinkActionConversion)linkActionConversion;
- (SiriLinkFlowProvisionalSiriLinkFlowClientEvent)initWithDictionary:(id)a3;
- (SiriLinkFlowProvisionalSiriLinkFlowClientEvent)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)getTypeId;
- (id)getVersion;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEvent_Type;
- (void)setEventMetadata:(id)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasLinkActionCompletion:(BOOL)a3;
- (void)setHasLinkActionConversion:(BOOL)a3;
- (void)setLinkActionCompletion:(id)a3;
- (void)setLinkActionConversion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SiriLinkFlowProvisionalSiriLinkFlowClientEvent

- (int)getAnyEventType
{
  return 7;
}

- (BOOL)isProvisional
{
  return 1;
}

- (id)getTypeId
{
  return @"com.apple.aiml.siri.link.flow.provisional.SiriLinkFlowClientEvent";
}

- (id)getVersion
{
  return &off_2012D8;
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0LL;
}

- (void)setLinkActionCompletion:(id)a3
{
  v4 = (SiriLinkFlowProvisionalLinkActionCompletion *)a3;
  linkActionConversion = self->_linkActionConversion;
  self->_linkActionConversion = 0LL;

  unint64_t v6 = 101LL;
  if (!v4) {
    unint64_t v6 = 0LL;
  }
  self->_whichEvent_Type = v6;
  linkActionCompletion = self->_linkActionCompletion;
  self->_linkActionCompletion = v4;
}

- (SiriLinkFlowProvisionalLinkActionCompletion)linkActionCompletion
{
  if (self->_whichEvent_Type == 101) {
    return self->_linkActionCompletion;
  }
  else {
    return (SiriLinkFlowProvisionalLinkActionCompletion *)0LL;
  }
}

- (void)setLinkActionConversion:(id)a3
{
  v4 = (SiriLinkFlowProvisionalLinkActionConversion *)a3;
  linkActionCompletion = self->_linkActionCompletion;
  self->_linkActionCompletion = 0LL;

  unint64_t v6 = 102LL;
  if (!v4) {
    unint64_t v6 = 0LL;
  }
  self->_whichEvent_Type = v6;
  linkActionConversion = self->_linkActionConversion;
  self->_linkActionConversion = v4;
}

- (SiriLinkFlowProvisionalLinkActionConversion)linkActionConversion
{
  if (self->_whichEvent_Type == 102) {
    return self->_linkActionConversion;
  }
  else {
    return (SiriLinkFlowProvisionalLinkActionConversion *)0LL;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SiriLinkFlowProvisionalSiriLinkFlowClientEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalSiriLinkFlowClientEvent eventMetadata](self, "eventMetadata"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalSiriLinkFlowClientEvent eventMetadata](self, "eventMetadata"));
    PBDataWriterWriteSubmessage(v10, v5, 1LL);
  }

  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalSiriLinkFlowClientEvent linkActionCompletion](self, "linkActionCompletion"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalSiriLinkFlowClientEvent linkActionCompletion](self, "linkActionCompletion"));
    PBDataWriterWriteSubmessage(v10, v7, 101LL);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalSiriLinkFlowClientEvent linkActionConversion](self, "linkActionConversion"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalSiriLinkFlowClientEvent linkActionConversion](self, "linkActionConversion"));
    PBDataWriterWriteSubmessage(v10, v9, 102LL);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id whichEvent_Type = (id)self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_18;
  }
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalSiriLinkFlowClientEvent eventMetadata](self, "eventMetadata"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 eventMetadata]);
  if ((v6 == 0LL) == (v7 != 0LL)) {
    goto LABEL_17;
  }
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalSiriLinkFlowClientEvent eventMetadata](self, "eventMetadata"));
  if (v8)
  {
    v9 = (void *)v8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalSiriLinkFlowClientEvent eventMetadata](self, "eventMetadata"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 eventMetadata]);
    unsigned int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_18;
    }
  }

  else
  {
  }

  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalSiriLinkFlowClientEvent linkActionCompletion](self, "linkActionCompletion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 linkActionCompletion]);
  if ((v6 == 0LL) == (v7 != 0LL)) {
    goto LABEL_17;
  }
  uint64_t v13 = objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalSiriLinkFlowClientEvent linkActionCompletion](self, "linkActionCompletion"));
  if (v13)
  {
    v14 = (void *)v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalSiriLinkFlowClientEvent linkActionCompletion](self, "linkActionCompletion"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v4 linkActionCompletion]);
    unsigned int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_18;
    }
  }

  else
  {
  }

  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalSiriLinkFlowClientEvent linkActionConversion](self, "linkActionConversion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 linkActionConversion]);
  if ((v6 == 0LL) != (v7 != 0LL))
  {
    uint64_t v18 = objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalSiriLinkFlowClientEvent linkActionConversion](self, "linkActionConversion"));
    if (!v18)
    {

LABEL_21:
      BOOL v23 = 1;
      goto LABEL_19;
    }

    v19 = (void *)v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalSiriLinkFlowClientEvent linkActionConversion](self, "linkActionConversion"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v4 linkActionConversion]);
    unsigned __int8 v22 = [v20 isEqual:v21];

    if ((v22 & 1) != 0) {
      goto LABEL_21;
    }
  }

  else
  {
LABEL_17:
  }

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)-[FLOWSchemaFLOWEventMetadata hash](self->_eventMetadata, "hash");
  unint64_t v4 = -[SiriLinkFlowProvisionalLinkActionCompletion hash](self->_linkActionCompletion, "hash") ^ v3;
  return v4 ^ -[SiriLinkFlowProvisionalLinkActionConversion hash](self->_linkActionConversion, "hash");
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (self->_eventMetadata)
  {
    unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalSiriLinkFlowClientEvent eventMetadata](self, "eventMetadata"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dictionaryRepresentation]);
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"eventMetadata"];
    }

    else
    {
      unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      [v3 setObject:v6 forKeyedSubscript:@"eventMetadata"];
    }
  }

  if (self->_linkActionCompletion)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalSiriLinkFlowClientEvent linkActionCompletion](self, "linkActionCompletion"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dictionaryRepresentation]);
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"linkActionCompletion"];
    }

    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      [v3 setObject:v9 forKeyedSubscript:@"linkActionCompletion"];
    }
  }

  if (self->_linkActionConversion)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLinkFlowProvisionalSiriLinkFlowClientEvent linkActionConversion](self, "linkActionConversion"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 dictionaryRepresentation]);
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"linkActionConversion"];
    }

    else
    {
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      [v3 setObject:v12 forKeyedSubscript:@"linkActionConversion"];
    }
  }

  return v3;
}

- (NSData)jsonData
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[SiriLinkFlowProvisionalSiriLinkFlowClientEvent dictionaryRepresentation]( self,  "dictionaryRepresentation"));
  if (+[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v2)) {
    unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v2,  0LL,  0LL));
  }
  else {
    unint64_t v3 = 0LL;
  }

  return (NSData *)v3;
}

- (SiriLinkFlowProvisionalSiriLinkFlowClientEvent)initWithJSON:(id)a3
{
  uint64_t v8 = 0LL;
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  a3,  0LL,  &v8));
  if (v8 || (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v4, v5) & 1) == 0))
  {
    unint64_t v6 = 0LL;
  }

  else
  {
    self = -[SiriLinkFlowProvisionalSiriLinkFlowClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    unint64_t v6 = self;
  }

  return v6;
}

- (SiriLinkFlowProvisionalSiriLinkFlowClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___SiriLinkFlowProvisionalSiriLinkFlowClientEvent;
  uint64_t v5 = -[SiriLinkFlowProvisionalSiriLinkFlowClientEvent init](&v17, "init");
  if (v5)
  {
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"eventMetadata"]);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      uint64_t v8 = -[FLOWSchemaFLOWEventMetadata initWithDictionary:]( objc_alloc(&OBJC_CLASS___FLOWSchemaFLOWEventMetadata),  "initWithDictionary:",  v6);
      -[SiriLinkFlowProvisionalSiriLinkFlowClientEvent setEventMetadata:](v5, "setEventMetadata:", v8);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"linkActionCompletion"]);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    {
      v11 = -[SiriLinkFlowProvisionalLinkActionCompletion initWithDictionary:]( objc_alloc(&OBJC_CLASS___SiriLinkFlowProvisionalLinkActionCompletion),  "initWithDictionary:",  v9);
      -[SiriLinkFlowProvisionalSiriLinkFlowClientEvent setLinkActionCompletion:](v5, "setLinkActionCompletion:", v11);
    }

    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"linkActionConversion"]);
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
    {
      v14 = -[SiriLinkFlowProvisionalLinkActionConversion initWithDictionary:]( objc_alloc(&OBJC_CLASS___SiriLinkFlowProvisionalLinkActionConversion),  "initWithDictionary:",  v12);
      -[SiriLinkFlowProvisionalSiriLinkFlowClientEvent setLinkActionConversion:](v5, "setLinkActionConversion:", v14);
    }

    v15 = v5;
  }

  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (FLOWSchemaFLOWEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (void)setEventMetadata:(id)a3
{
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (BOOL)hasLinkActionCompletion
{
  return self->_hasLinkActionCompletion;
}

- (void)setHasLinkActionCompletion:(BOOL)a3
{
  self->_hasLinkActionCompletion = a3;
}

- (BOOL)hasLinkActionConversion
{
  return self->_hasLinkActionConversion;
}

- (void)setHasLinkActionConversion:(BOOL)a3
{
  self->_hasLinkActionConversion = a3;
}

- (void).cxx_destruct
{
}

@end
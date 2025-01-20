@interface VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext
- (BOOL)hasContextId;
- (BOOL)hasEnded;
- (BOOL)hasStartedOrChanged;
- (BOOL)isEqual:(id)a3;
- (BOOL)isProvisional;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)contextId;
- (VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext)initWithDictionary:(id)a3;
- (VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext)initWithJSON:(id)a3;
- (VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContextInfo)startedOrChanged;
- (VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo)ended;
- (id)dictionaryRepresentation;
- (id)getTypeId;
- (id)getVersion;
- (id)qualifiedMessageName;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichContextevent;
- (void)deleteContextId;
- (void)deleteEnded;
- (void)deleteStartedOrChanged;
- (void)setContextId:(id)a3;
- (void)setEnded:(id)a3;
- (void)setHasContextId:(BOOL)a3;
- (void)setHasEnded:(BOOL)a3;
- (void)setHasStartedOrChanged:(BOOL)a3;
- (void)setStartedOrChanged:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext

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
  return @"com.apple.aiml.siri.voicecmds.VoiceCmdsWaitForRequestContext";
}

- (id)getVersion
{
  return &off_2012F0;
}

- (id)qualifiedMessageName
{
  unint64_t v2 = -[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext whichContextevent](self, "whichContextevent");
  v3 = @"com.apple.aiml.siri.voicecmds.ProvisionalVoiceCmdsWaitForRequestContext";
  if (v2 == 101) {
    v3 = @"com.apple.aiml.siri.voicecmds.ProvisionalVoiceCmdsWaitForRequestContext.ProvisionalVoiceCmdsWaitForRequestRemovalInfo";
  }
  if (v2 == 100) {
    return @"com.apple.aiml.siri.voicecmds.ProvisionalVoiceCmdsWaitForRequestContext.ProvisionalVoiceCmdsWaitForRequestContextInfo";
  }
  else {
    return (id)v3;
  }
}

- (BOOL)hasContextId
{
  return self->_contextId != 0LL;
}

- (void)deleteContextId
{
}

- (void)setStartedOrChanged:(id)a3
{
  v4 = (VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContextInfo *)a3;
  ended = self->_ended;
  self->_ended = 0LL;

  unint64_t v6 = 100LL;
  if (!v4) {
    unint64_t v6 = 0LL;
  }
  self->_whichContextevent = v6;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = v4;
}

- (VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContextInfo)startedOrChanged
{
  if (self->_whichContextevent == 100) {
    return self->_startedOrChanged;
  }
  else {
    return (VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContextInfo *)0LL;
  }
}

- (void)deleteStartedOrChanged
{
  if (self->_whichContextevent == 100)
  {
    self->_whichContextevent = 0LL;
    startedOrChanged = self->_startedOrChanged;
    self->_startedOrChanged = 0LL;
  }

- (void)setEnded:(id)a3
{
  v4 = (VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0LL;

  unint64_t v6 = 101LL;
  if (!v4) {
    unint64_t v6 = 0LL;
  }
  self->_whichContextevent = v6;
  ended = self->_ended;
  self->_ended = v4;
}

- (VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo)ended
{
  if (self->_whichContextevent == 101) {
    return self->_ended;
  }
  else {
    return (VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo *)0LL;
  }
}

- (void)deleteEnded
{
  if (self->_whichContextevent == 101)
  {
    self->_whichContextevent = 0LL;
    ended = self->_ended;
    self->_ended = 0LL;
  }

- (BOOL)readFrom:(id)a3
{
  return VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext contextId](self, "contextId"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext contextId](self, "contextId"));
    PBDataWriterWriteSubmessage(v10, v5, 1LL);
  }

  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext startedOrChanged](self, "startedOrChanged"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( -[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext startedOrChanged]( self,  "startedOrChanged"));
    PBDataWriterWriteSubmessage(v10, v7, 100LL);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext ended](self, "ended"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext ended](self, "ended"));
    PBDataWriterWriteSubmessage(v10, v9, 101LL);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id whichContextevent = (id)self->_whichContextevent;
  if (whichContextevent != [v4 whichContextevent]) {
    goto LABEL_18;
  }
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext contextId](self, "contextId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 contextId]);
  if ((v6 == 0LL) == (v7 != 0LL)) {
    goto LABEL_17;
  }
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext contextId](self, "contextId"));
  if (v8)
  {
    v9 = (void *)v8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext contextId](self, "contextId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 contextId]);
    unsigned int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_18;
    }
  }

  else
  {
  }

  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext startedOrChanged](self, "startedOrChanged"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 startedOrChanged]);
  if ((v6 == 0LL) == (v7 != 0LL)) {
    goto LABEL_17;
  }
  uint64_t v13 = objc_claimAutoreleasedReturnValue(-[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext startedOrChanged](self, "startedOrChanged"));
  if (v13)
  {
    v14 = (void *)v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue( -[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext startedOrChanged]( self,  "startedOrChanged"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v4 startedOrChanged]);
    unsigned int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_18;
    }
  }

  else
  {
  }

  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext ended](self, "ended"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 ended]);
  if ((v6 == 0LL) != (v7 != 0LL))
  {
    uint64_t v18 = objc_claimAutoreleasedReturnValue(-[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext ended](self, "ended"));
    if (!v18)
    {

LABEL_21:
      BOOL v23 = 1;
      goto LABEL_19;
    }

    v19 = (void *)v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext ended](self, "ended"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v4 ended]);
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
  unint64_t v3 = (unint64_t)-[SISchemaUUID hash](self->_contextId, "hash");
  unint64_t v4 = -[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContextInfo hash](self->_startedOrChanged, "hash") ^ v3;
  return v4 ^ -[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo hash](self->_ended, "hash");
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (self->_contextId)
  {
    unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext contextId](self, "contextId"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dictionaryRepresentation]);
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"contextId"];
    }

    else
    {
      unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      [v3 setObject:v6 forKeyedSubscript:@"contextId"];
    }
  }

  if (self->_ended)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext ended](self, "ended"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dictionaryRepresentation]);
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"ended"];
    }

    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      [v3 setObject:v9 forKeyedSubscript:@"ended"];
    }
  }

  if (self->_startedOrChanged)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext startedOrChanged]( self,  "startedOrChanged"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 dictionaryRepresentation]);
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"startedOrChanged"];
    }

    else
    {
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      [v3 setObject:v12 forKeyedSubscript:@"startedOrChanged"];
    }
  }

  -[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext willProduceDictionaryRepresentation:]( self,  "willProduceDictionaryRepresentation:",  v3);
  return v3;
}

- (NSData)jsonData
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( -[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext dictionaryRepresentation]( self,  "dictionaryRepresentation"));
  if (+[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v2)) {
    unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v2,  0LL,  0LL));
  }
  else {
    unint64_t v3 = 0LL;
  }

  return (NSData *)v3;
}

- (VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext)initWithJSON:(id)a3
{
  uint64_t v8 = 0LL;
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  a3,  0LL,  &v8));
  if (v8 || (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v4, v5) & 1) == 0))
  {
    unint64_t v6 = 0LL;
  }

  else
  {
    self =  -[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext initWithDictionary:]( self,  "initWithDictionary:",  v4);
    unint64_t v6 = self;
  }

  return v6;
}

- (VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext;
  uint64_t v5 = -[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext init](&v17, "init");
  if (v5)
  {
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"contextId"]);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      uint64_t v8 = -[SISchemaUUID initWithDictionary:](objc_alloc(&OBJC_CLASS___SISchemaUUID), "initWithDictionary:", v6);
      -[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext setContextId:](v5, "setContextId:", v8);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"startedOrChanged"]);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    {
      v11 = -[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContextInfo initWithDictionary:]( objc_alloc(&OBJC_CLASS___VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContextInfo),  "initWithDictionary:",  v9);
      -[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext setStartedOrChanged:](v5, "setStartedOrChanged:", v11);
    }

    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"ended"]);
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
    {
      v14 = -[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo initWithDictionary:]( objc_alloc(&OBJC_CLASS___VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo),  "initWithDictionary:",  v12);
      -[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext setEnded:](v5, "setEnded:", v14);
    }

    v15 = v5;
  }

  return v5;
}

- (unint64_t)whichContextevent
{
  return self->_whichContextevent;
}

- (SISchemaUUID)contextId
{
  return self->_contextId;
}

- (void)setContextId:(id)a3
{
}

- (void)setHasContextId:(BOOL)a3
{
  self->_hasContextId = a3;
}

- (BOOL)hasStartedOrChanged
{
  return self->_hasStartedOrChanged;
}

- (void)setHasStartedOrChanged:(BOOL)a3
{
  self->_hasStartedOrChanged = a3;
}

- (BOOL)hasEnded
{
  return self->_hasEnded;
}

- (void)setHasEnded:(BOOL)a3
{
  self->_hasEnded = a3;
}

- (void).cxx_destruct
{
}

@end
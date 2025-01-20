@interface VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo
- (BOOL)hasClockSeconds;
- (BOOL)hasShortcutName;
- (BOOL)hasWfRunnerEventName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)shortcutName;
- (NSString)wfRunnerEventName;
- (VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo)initWithDictionary:(id)a3;
- (VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo)initWithJSON:(id)a3;
- (float)clockSeconds;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)deleteClockSeconds;
- (void)deleteShortcutName;
- (void)deleteWfRunnerEventName;
- (void)setClockSeconds:(float)a3;
- (void)setHasClockSeconds:(BOOL)a3;
- (void)setHasShortcutName:(BOOL)a3;
- (void)setHasWfRunnerEventName:(BOOL)a3;
- (void)setShortcutName:(id)a3;
- (void)setWfRunnerEventName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo

- (BOOL)hasShortcutName
{
  return self->_shortcutName != 0LL;
}

- (void)deleteShortcutName
{
}

- (void)setClockSeconds:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_clockSeconds = a3;
}

- (BOOL)hasClockSeconds
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasClockSeconds:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteClockSeconds
{
  LODWORD(v2) = 0;
  -[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo setClockSeconds:](self, "setClockSeconds:", v2);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasWfRunnerEventName
{
  return self->_wfRunnerEventName != 0LL;
}

- (void)deleteWfRunnerEventName
{
}

- (BOOL)readFrom:(id)a3
{
  return VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfoReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo shortcutName](self, "shortcutName"));

  if (v4) {
    PBDataWriterWriteStringField(v7, self->_shortcutName, 1LL);
  }
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteFloatField(v7, 2LL, self->_clockSeconds);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo wfRunnerEventName]( self,  "wfRunnerEventName"));

  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField(v7, self->_wfRunnerEventName, 3LL);
    v6 = v7;
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo shortcutName](self, "shortcutName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 shortcutName]);
  if ((v5 == 0LL) == (v6 != 0LL)) {
    goto LABEL_14;
  }
  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo shortcutName](self, "shortcutName"));
  if (v7)
  {
    v8 = (void *)v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo shortcutName](self, "shortcutName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 shortcutName]);
    unsigned int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_15;
    }
  }

  else
  {
  }

  if ((*(_BYTE *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    float clockSeconds = self->_clockSeconds;
    [v4 clockSeconds];
    if (clockSeconds != v13) {
      goto LABEL_15;
    }
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue( -[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo wfRunnerEventName]( self,  "wfRunnerEventName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 wfRunnerEventName]);
  if ((v5 == 0LL) != (v6 != 0LL))
  {
    uint64_t v14 = objc_claimAutoreleasedReturnValue(-[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo wfRunnerEventName](self, "wfRunnerEventName"));
    if (!v14)
    {

LABEL_18:
      BOOL v19 = 1;
      goto LABEL_16;
    }

    v15 = (void *)v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue( -[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo wfRunnerEventName]( self,  "wfRunnerEventName"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v4 wfRunnerEventName]);
    unsigned __int8 v18 = [v16 isEqual:v17];

    if ((v18 & 1) != 0) {
      goto LABEL_18;
    }
  }

  else
  {
LABEL_14:
  }

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_shortcutName, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    float clockSeconds = self->_clockSeconds;
    double v6 = clockSeconds;
    if (clockSeconds < 0.0) {
      double v6 = -clockSeconds;
    }
    double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }

    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }

  else
  {
    unint64_t v4 = 0LL;
  }

  return v4 ^ v3 ^ -[NSString hash](self->_wfRunnerEventName, "hash");
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    -[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo clockSeconds](self, "clockSeconds");
    unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
    [v3 setObject:v4 forKeyedSubscript:@"clockSeconds"];
  }

  if (self->_shortcutName)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo shortcutName](self, "shortcutName"));
    id v6 = [v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"shortcutName"];
  }

  if (self->_wfRunnerEventName)
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue( -[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo wfRunnerEventName]( self,  "wfRunnerEventName"));
    id v8 = [v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"wfRunnerEventName"];
  }

  -[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo willProduceDictionaryRepresentation:]( self,  "willProduceDictionaryRepresentation:",  v3);
  return v3;
}

- (NSData)jsonData
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue( -[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo dictionaryRepresentation]( self,  "dictionaryRepresentation"));
  if (+[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v2)) {
    NSUInteger v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v2,  0LL,  0LL));
  }
  else {
    NSUInteger v3 = 0LL;
  }

  return (NSData *)v3;
}

- (VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo)initWithJSON:(id)a3
{
  uint64_t v8 = 0LL;
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  a3,  0LL,  &v8));
  if (v8 || (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v4, v5) & 1) == 0))
  {
    id v6 = 0LL;
  }

  else
  {
    self =  -[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo initWithDictionary:]( self,  "initWithDictionary:",  v4);
    id v6 = self;
  }

  return v6;
}

- (VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo;
  uint64_t v5 = -[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo init](&v16, "init");
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"shortcutName"]);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      id v8 = [v6 copy];
      -[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo setShortcutName:](v5, "setShortcutName:", v8);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"clockSeconds"]);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    {
      [v9 floatValue];
      -[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo setClockSeconds:](v5, "setClockSeconds:");
    }

    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"wfRunnerEventName"]);
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    {
      id v13 = [v11 copy];
      -[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo setWfRunnerEventName:]( v5,  "setWfRunnerEventName:",  v13);
    }

    uint64_t v14 = v5;
  }

  return v5;
}

- (NSString)shortcutName
{
  return self->_shortcutName;
}

- (void)setShortcutName:(id)a3
{
}

- (float)clockSeconds
{
  return self->_clockSeconds;
}

- (NSString)wfRunnerEventName
{
  return self->_wfRunnerEventName;
}

- (void)setWfRunnerEventName:(id)a3
{
}

- (void)setHasShortcutName:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasWfRunnerEventName:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
}

@end
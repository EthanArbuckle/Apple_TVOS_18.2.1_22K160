@interface SECSFAAction
- (BOOL)hasAbc;
- (BOOL)hasAction;
- (BOOL)hasDrop;
- (BOOL)hasRadarnumber;
- (BOOL)hasTtr;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)radarnumber;
- (SECSFAActionAutomaticBugCapture)abc;
- (SECSFAActionDropEvent)drop;
- (SECSFAActionTapToRadar)ttr;
- (id)actionAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsAction:(id)a3;
- (int)action;
- (unint64_t)hash;
- (void)clearOneofValuesForAction;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbc:(id)a3;
- (void)setAction:(int)a3;
- (void)setDrop:(id)a3;
- (void)setHasAction:(BOOL)a3;
- (void)setRadarnumber:(id)a3;
- (void)setTtr:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECSFAAction

- (BOOL)hasRadarnumber
{
  return self->_radarnumber != 0LL;
}

- (BOOL)hasTtr
{
  return self->_ttr != 0LL;
}

- (void)setTtr:(id)a3
{
  v4 = (SECSFAActionTapToRadar *)a3;
  -[SECSFAAction clearOneofValuesForAction](self, "clearOneofValuesForAction");
  *(_BYTE *)&self->_has |= 1u;
  self->_action = 1;
  ttr = self->_ttr;
  self->_ttr = v4;
}

- (BOOL)hasAbc
{
  return self->_abc != 0LL;
}

- (void)setAbc:(id)a3
{
  v4 = (SECSFAActionAutomaticBugCapture *)a3;
  -[SECSFAAction clearOneofValuesForAction](self, "clearOneofValuesForAction");
  *(_BYTE *)&self->_has |= 1u;
  self->_action = 2;
  abc = self->_abc;
  self->_abc = v4;
}

- (BOOL)hasDrop
{
  return self->_drop != 0LL;
}

- (void)setDrop:(id)a3
{
  v4 = (SECSFAActionDropEvent *)a3;
  -[SECSFAAction clearOneofValuesForAction](self, "clearOneofValuesForAction");
  *(_BYTE *)&self->_has |= 1u;
  self->_action = 3;
  drop = self->_drop;
  self->_drop = v4;
}

- (int)action
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    return self->_action;
  }
  else {
    return 0;
  }
}

- (void)setAction:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_action = a3;
}

- (void)setHasAction:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAction
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)actionAsString:(int)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAction:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PBUNSET"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"ttr"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"abc"])
  {
    int v4 = 2;
  }

  else if ([v3 isEqualToString:@"drop"])
  {
    int v4 = 3;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearOneofValuesForAction
{
  *(_BYTE *)&self->_has &= ~1u;
  self->_action = 0;
  ttr = self->_ttr;
  self->_ttr = 0LL;

  abc = self->_abc;
  self->_abc = 0LL;

  drop = self->_drop;
  self->_drop = 0LL;
}

- (id)description
{
  id v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SECSFAAction;
  -[SECSFAAction description](&v8, sel_description);
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SECSFAAction dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = v3;
  radarnumber = self->_radarnumber;
  if (radarnumber) {
    [v3 setObject:radarnumber forKey:@"radarnumber"];
  }
  ttr = self->_ttr;
  if (ttr)
  {
    v7 = -[SECSFAActionTapToRadar dictionaryRepresentation](ttr, "dictionaryRepresentation");
    [v4 setObject:v7 forKey:@"ttr"];
  }

  abc = self->_abc;
  if (abc)
  {
    v9 = -[SECSFAActionAutomaticBugCapture dictionaryRepresentation](abc, "dictionaryRepresentation");
    [v4 setObject:v9 forKey:@"abc"];
  }

  drop = self->_drop;
  if (drop)
  {
    v11 = -[SECSFAActionDropEvent dictionaryRepresentation](drop, "dictionaryRepresentation");
    [v4 setObject:v11 forKey:@"drop"];
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    uint64_t action = self->_action;
    if (action >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_action);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v13 = off_189665398[action];
    }

    [v4 setObject:v13 forKey:@"Action"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SECSFAActionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_radarnumber)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }

  if (self->_ttr)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }

  if (self->_abc)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }

  if (self->_drop)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_action;
    *((_BYTE *)v4 + 48) |= 1u;
  }

  id v5 = v4;
  if (self->_radarnumber)
  {
    objc_msgSend(v4, "setRadarnumber:");
    id v4 = v5;
  }

  if (self->_ttr)
  {
    objc_msgSend(v5, "setTtr:");
    id v4 = v5;
  }

  if (self->_abc)
  {
    objc_msgSend(v5, "setAbc:");
    id v4 = v5;
  }

  if (self->_drop)
  {
    objc_msgSend(v5, "setDrop:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_action;
    *(_BYTE *)(v5 + 48) |= 1u;
  }

  uint64_t v7 = -[NSString copyWithZone:](self->_radarnumber, "copyWithZone:", a3);
  objc_super v8 = (void *)v6[4];
  v6[4] = v7;

  id v9 = -[SECSFAActionTapToRadar copyWithZone:](self->_ttr, "copyWithZone:", a3);
  v10 = (void *)v6[5];
  v6[5] = v9;

  id v11 = -[SECSFAActionAutomaticBugCapture copyWithZone:](self->_abc, "copyWithZone:", a3);
  v12 = (void *)v6[1];
  v6[1] = v11;

  id v13 = -[SECSFAActionDropEvent copyWithZone:](self->_drop, "copyWithZone:", a3);
  v14 = (void *)v6[3];
  v6[3] = v13;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_action != *((_DWORD *)v4 + 4)) {
      goto LABEL_15;
    }
  }

  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }

  radarnumber = self->_radarnumber;
  if ((unint64_t)radarnumber | *((void *)v4 + 4)
    && !-[NSString isEqual:](radarnumber, "isEqual:"))
  {
    goto LABEL_15;
  }

  ttr = self->_ttr;
  if ((unint64_t)ttr | *((void *)v4 + 5))
  {
    if (!-[SECSFAActionTapToRadar isEqual:](ttr, "isEqual:")) {
      goto LABEL_15;
    }
  }

  abc = self->_abc;
  if ((unint64_t)abc | *((void *)v4 + 1))
  {
    if (!-[SECSFAActionAutomaticBugCapture isEqual:](abc, "isEqual:")) {
      goto LABEL_15;
    }
  }

  drop = self->_drop;
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v3 = 2654435761LL * self->_action;
  }
  else {
    uint64_t v3 = 0LL;
  }
  NSUInteger v4 = -[NSString hash](self->_radarnumber, "hash") ^ v3;
  unint64_t v5 = -[SECSFAActionTapToRadar hash](self->_ttr, "hash");
  unint64_t v6 = v4 ^ v5 ^ -[SECSFAActionAutomaticBugCapture hash](self->_abc, "hash");
  return v6 ^ -[SECSFAActionDropEvent hash](self->_drop, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    self->_uint64_t action = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }

  v12 = v4;
  if (*((void *)v4 + 4))
  {
    -[SECSFAAction setRadarnumber:](self, "setRadarnumber:");
    unint64_t v5 = v12;
  }

  ttr = self->_ttr;
  uint64_t v7 = v5[5];
  if (ttr)
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[SECSFAActionTapToRadar mergeFrom:](ttr, "mergeFrom:");
  }

  else
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[SECSFAAction setTtr:](self, "setTtr:");
  }

  unint64_t v5 = v12;
LABEL_11:
  abc = self->_abc;
  uint64_t v9 = v5[1];
  if (abc)
  {
    if (!v9) {
      goto LABEL_17;
    }
    -[SECSFAActionAutomaticBugCapture mergeFrom:](abc, "mergeFrom:");
  }

  else
  {
    if (!v9) {
      goto LABEL_17;
    }
    -[SECSFAAction setAbc:](self, "setAbc:");
  }

  unint64_t v5 = v12;
LABEL_17:
  drop = self->_drop;
  uint64_t v11 = v5[3];
  if (drop)
  {
    if (v11)
    {
      -[SECSFAActionDropEvent mergeFrom:](drop, "mergeFrom:");
LABEL_22:
      unint64_t v5 = v12;
    }
  }

  else if (v11)
  {
    -[SECSFAAction setDrop:](self, "setDrop:");
    goto LABEL_22;
  }
}

- (NSString)radarnumber
{
  return self->_radarnumber;
}

- (void)setRadarnumber:(id)a3
{
}

- (SECSFAActionTapToRadar)ttr
{
  return self->_ttr;
}

- (SECSFAActionAutomaticBugCapture)abc
{
  return self->_abc;
}

- (SECSFAActionDropEvent)drop
{
  return self->_drop;
}

- (void).cxx_destruct
{
}

@end
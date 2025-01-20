@interface NWPBAgent
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NWPBAgent

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NWPBAgent;
  v4 = -[NWPBAgent description](&v8, sel_description);
  v5 = -[NWPBAgent dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  agentClass = self->_agentClass;
  if (agentClass)
  {
    v5 = -[NWPBAgentClass dictionaryRepresentation](agentClass, "dictionaryRepresentation");
    [v3 setObject:v5 forKey:@"agentClass"];
  }

  agentIdentifier = self->_agentIdentifier;
  if (agentIdentifier) {
    [v3 setObject:agentIdentifier forKey:@"agentIdentifier"];
  }
  agentDescription = self->_agentDescription;
  if (agentDescription) {
    [v3 setObject:agentDescription forKey:@"agentDescription"];
  }
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    [MEMORY[0x189607968] numberWithBool:self->_active];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v12 forKey:@"active"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 0x10) == 0) {
        goto LABEL_10;
      }
      goto LABEL_18;
    }
  }

  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }

  [MEMORY[0x189607968] numberWithBool:self->_userActivated];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v13 forKey:@"userActivated"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_19;
  }

- (BOOL)readFrom:(id)a3
{
  return NWPBAgentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_agentClass)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }

  if (self->_agentIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }

  if (self->_agentDescription)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }

  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 0x10) == 0) {
        goto LABEL_10;
      }
      goto LABEL_18;
    }
  }

  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }

  PBDataWriterWriteBOOLField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_19;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = -[NWPBAgentClass copyWithZone:](self->_agentClass, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = -[NSString copyWithZone:](self->_agentIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  uint64_t v10 = -[NSString copyWithZone:](self->_agentDescription, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_BYTE *)(v5 + 40) = self->_active;
    *(_BYTE *)(v5 + 48) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }

  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }

  *(_BYTE *)(v5 + 43) = self->_userActivated;
  *(_BYTE *)(v5 + 48) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    *(_BYTE *)(v5 + 41) = self->_networkProvider;
    *(_BYTE *)(v5 + 48) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  agentClass = self->_agentClass;
  if ((unint64_t)agentClass | *((void *)v4 + 1))
  {
    if (!-[NWPBAgentClass isEqual:](agentClass, "isEqual:")) {
      goto LABEL_44;
    }
  }

  agentIdentifier = self->_agentIdentifier;
  if ((unint64_t)agentIdentifier | *((void *)v4 + 4))
  {
  }

  agentDescription = self->_agentDescription;
  if ((unint64_t)agentDescription | *((void *)v4 + 3))
  {
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0) {
      goto LABEL_44;
    }
    if (self->_active)
    {
      if (!*((_BYTE *)v4 + 40)) {
        goto LABEL_44;
      }
    }

    else if (*((_BYTE *)v4 + 40))
    {
      goto LABEL_44;
    }
  }

  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_44;
  }

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 8) == 0) {
      goto LABEL_44;
    }
    if (self->_userActivated)
    {
      if (!*((_BYTE *)v4 + 43)) {
        goto LABEL_44;
      }
    }

    else if (*((_BYTE *)v4 + 43))
    {
      goto LABEL_44;
    }
  }

  else if ((*((_BYTE *)v4 + 48) & 8) != 0)
  {
    goto LABEL_44;
  }

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 0x10) == 0) {
      goto LABEL_44;
    }
    if (self->_voluntary)
    {
      if (!*((_BYTE *)v4 + 44)) {
        goto LABEL_44;
      }
    }

    else if (*((_BYTE *)v4 + 44))
    {
      goto LABEL_44;
    }
  }

  else if ((*((_BYTE *)v4 + 48) & 0x10) != 0)
  {
    goto LABEL_44;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0) {
      goto LABEL_44;
    }
    if (self->_networkProvider)
    {
      if (!*((_BYTE *)v4 + 41)) {
        goto LABEL_44;
      }
    }

    else if (*((_BYTE *)v4 + 41))
    {
      goto LABEL_44;
    }
  }

  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_44;
  }

  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    if ((*((_BYTE *)v4 + 48) & 4) == 0) {
      goto LABEL_50;
    }
LABEL_44:
    char v8 = 0;
    goto LABEL_45;
  }

  if ((*((_BYTE *)v4 + 48) & 4) == 0) {
    goto LABEL_44;
  }
  if (!self->_nexusProvider)
  {
    if (!*((_BYTE *)v4 + 42)) {
      goto LABEL_50;
    }
    goto LABEL_44;
  }

  if (!*((_BYTE *)v4 + 42)) {
    goto LABEL_44;
  }
LABEL_50:
  agentData = self->_agentData;
  else {
    char v8 = 1;
  }
LABEL_45:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = -[NWPBAgentClass hash](self->_agentClass, "hash");
  NSUInteger v4 = -[NSString hash](self->_agentIdentifier, "hash");
  NSUInteger v5 = -[NSString hash](self->_agentDescription, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    uint64_t v6 = 2654435761LL * self->_active;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v7 = 2654435761LL * self->_userActivated;
      if ((*(_BYTE *)&self->_has & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }

  else
  {
    uint64_t v6 = 0LL;
    if ((*(_BYTE *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }

  uint64_t v7 = 0LL;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v8 = 2654435761LL * self->_voluntary;
    if ((*(_BYTE *)&self->_has & 2) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v9 = 0LL;
    if ((*(_BYTE *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v10 = 0LL;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ -[NSData hash](self->_agentData, "hash");
  }

- (void).cxx_destruct
{
}

@end
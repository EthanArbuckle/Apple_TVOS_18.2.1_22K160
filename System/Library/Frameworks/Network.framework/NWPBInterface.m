@interface NWPBInterface
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NWPBInterface

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NWPBInterface;
  v4 = -[NWPBInterface description](&v8, sel_description);
  v5 = -[NWPBInterface dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    uint64_t type = self->_type;
    if (type >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v6 = off_189BC6040[type];
    }

    [v3 setObject:v6 forKey:@"type"];

    char has = (char)self->_has;
  }

  if ((has & 0x10) != 0)
  {
    subuint64_t type = self->_subtype;
    if (subtype >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_subtype);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      objc_super v8 = off_189BC6068[subtype];
    }

    [v3 setObject:v8 forKey:@"subtype"];
  }

  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  char v10 = (char)self->_has;
  if ((v10 & 4) != 0)
  {
    [MEMORY[0x189607968] numberWithUnsignedInt:self->_index];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v13 forKey:@"index"];

    char v10 = (char)self->_has;
    if ((v10 & 2) == 0)
    {
LABEL_15:
      if ((v10 & 1) == 0) {
        goto LABEL_16;
      }
      goto LABEL_22;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_15;
  }

  [MEMORY[0x189607968] numberWithUnsignedInt:self->_generation];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v14 forKey:@"generation"];

  char v10 = (char)self->_has;
  if ((v10 & 1) == 0)
  {
LABEL_16:
    if ((v10 & 8) == 0) {
      goto LABEL_17;
    }
LABEL_23:
    [MEMORY[0x189607968] numberWithUnsignedInt:self->_mtu];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v16 forKey:@"mtu"];

    if ((*(_BYTE *)&self->_has & 0x40) == 0) {
      return v3;
    }
    goto LABEL_18;
  }

- (BOOL)readFrom:(id)a3
{
  return NWPBInterfaceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }

  if ((has & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  char v5 = (char)self->_has;
  if ((v5 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    char v5 = (char)self->_has;
    if ((v5 & 2) == 0)
    {
LABEL_9:
      if ((v5 & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_16;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }

  PBDataWriterWriteUint32Field();
  char v5 = (char)self->_has;
  if ((v5 & 1) == 0)
  {
LABEL_10:
    if ((v5 & 8) == 0) {
      goto LABEL_11;
    }
LABEL_17:
    PBDataWriterWriteUint32Field();
    if ((*(_BYTE *)&self->_has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 36) = self->_type;
    *(_BYTE *)(v5 + 44) |= 0x20u;
    char has = (char)self->_has;
  }

  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_subtype;
    *(_BYTE *)(v5 + 44) |= 0x10u;
  }

  uint64_t v8 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v8;

  char v10 = (char)self->_has;
  if ((v10 & 4) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_index;
    *(_BYTE *)(v6 + 44) |= 4u;
    char v10 = (char)self->_has;
    if ((v10 & 2) == 0)
    {
LABEL_7:
      if ((v10 & 1) == 0) {
        goto LABEL_8;
      }
      goto LABEL_14;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }

  *(_DWORD *)(v6 + 12) = self->_generation;
  *(_BYTE *)(v6 + 44) |= 2u;
  char v10 = (char)self->_has;
  if ((v10 & 1) == 0)
  {
LABEL_8:
    if ((v10 & 8) == 0) {
      goto LABEL_9;
    }
LABEL_15:
    *(_DWORD *)(v6 + 20) = self->_mtu;
    *(_BYTE *)(v6 + 44) |= 8u;
    if ((*(_BYTE *)&self->_has & 0x40) == 0) {
      return (id)v6;
    }
    goto LABEL_10;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  char v6 = *((_BYTE *)v4 + 44);
  if ((has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 0x20) == 0 || self->_type != *((_DWORD *)v4 + 9)) {
      goto LABEL_37;
    }
  }

  else if ((*((_BYTE *)v4 + 44) & 0x20) != 0)
  {
    goto LABEL_37;
  }

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 0x10) == 0 || self->_subtype != *((_DWORD *)v4 + 8)) {
      goto LABEL_37;
    }
  }

  else if ((*((_BYTE *)v4 + 44) & 0x10) != 0)
  {
    goto LABEL_37;
  }

  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 3))
  {
    char has = (char)self->_has;
    char v6 = *((_BYTE *)v4 + 44);
  }

  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_index != *((_DWORD *)v4 + 4)) {
      goto LABEL_37;
    }
  }

  else if ((v6 & 4) != 0)
  {
    goto LABEL_37;
  }

  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_generation != *((_DWORD *)v4 + 3)) {
      goto LABEL_37;
    }
  }

  else if ((v6 & 2) != 0)
  {
    goto LABEL_37;
  }

  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_delegateIndex != *((_DWORD *)v4 + 2)) {
      goto LABEL_37;
    }
  }

  else if ((v6 & 1) != 0)
  {
    goto LABEL_37;
  }

  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_mtu != *((_DWORD *)v4 + 5)) {
      goto LABEL_37;
    }
  }

  else if ((v6 & 8) != 0)
  {
    goto LABEL_37;
  }

  BOOL v8 = (v6 & 0x40) == 0;
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) != 0)
    {
      if (self->_expensive)
      {
        if (!*((_BYTE *)v4 + 40)) {
          goto LABEL_37;
        }
      }

      else if (*((_BYTE *)v4 + 40))
      {
        goto LABEL_37;
      }

      BOOL v8 = 1;
      goto LABEL_38;
    }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    uint64_t v3 = 2654435761LL * self->_type;
    if ((*(_BYTE *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
  }

  else
  {
    uint64_t v3 = 0LL;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761LL * self->_subtype;
      goto LABEL_6;
    }
  }

  uint64_t v4 = 0LL;
LABEL_6:
  NSUInteger v5 = -[NSString hash](self->_name, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    uint64_t v6 = 2654435761LL * self->_index;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_8:
      uint64_t v7 = 2654435761LL * self->_generation;
      if ((*(_BYTE *)&self->_has & 1) != 0) {
        goto LABEL_9;
      }
      goto LABEL_14;
    }
  }

  else
  {
    uint64_t v6 = 0LL;
    if ((*(_BYTE *)&self->_has & 2) != 0) {
      goto LABEL_8;
    }
  }

  uint64_t v7 = 0LL;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_9:
    uint64_t v8 = 2654435761LL * self->_delegateIndex;
    if ((*(_BYTE *)&self->_has & 8) != 0) {
      goto LABEL_10;
    }
LABEL_15:
    uint64_t v9 = 0LL;
    if ((*(_BYTE *)&self->_has & 0x40) != 0) {
      goto LABEL_11;
    }
LABEL_16:
    uint64_t v10 = 0LL;
    return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v5;
  }

- (void).cxx_destruct
{
}

@end
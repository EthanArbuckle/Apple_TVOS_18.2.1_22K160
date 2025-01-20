@interface AWDCountersThreadMleS
- (BOOL)hasAttachAttempts;
- (BOOL)hasBetterPartitionAttachAttempts;
- (BOOL)hasChildRoleCount;
- (BOOL)hasDetachedRoleCount;
- (BOOL)hasDisabledRoleCount;
- (BOOL)hasLeaderRoleCount;
- (BOOL)hasParentChangesCount;
- (BOOL)hasPartitionIdChangesCount;
- (BOOL)hasRouterRoleCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)attachAttempts;
- (unsigned)betterPartitionAttachAttempts;
- (unsigned)childRoleCount;
- (unsigned)detachedRoleCount;
- (unsigned)disabledRoleCount;
- (unsigned)leaderRoleCount;
- (unsigned)parentChangesCount;
- (unsigned)partitionIdChangesCount;
- (unsigned)routerRoleCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAttachAttempts:(unsigned int)a3;
- (void)setBetterPartitionAttachAttempts:(unsigned int)a3;
- (void)setChildRoleCount:(unsigned int)a3;
- (void)setDetachedRoleCount:(unsigned int)a3;
- (void)setDisabledRoleCount:(unsigned int)a3;
- (void)setHasAttachAttempts:(BOOL)a3;
- (void)setHasBetterPartitionAttachAttempts:(BOOL)a3;
- (void)setHasChildRoleCount:(BOOL)a3;
- (void)setHasDetachedRoleCount:(BOOL)a3;
- (void)setHasDisabledRoleCount:(BOOL)a3;
- (void)setHasLeaderRoleCount:(BOOL)a3;
- (void)setHasParentChangesCount:(BOOL)a3;
- (void)setHasPartitionIdChangesCount:(BOOL)a3;
- (void)setHasRouterRoleCount:(BOOL)a3;
- (void)setLeaderRoleCount:(unsigned int)a3;
- (void)setParentChangesCount:(unsigned int)a3;
- (void)setPartitionIdChangesCount:(unsigned int)a3;
- (void)setRouterRoleCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCountersThreadMleS

- (void)setDisabledRoleCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_disabledRoleCount = a3;
}

- (void)setHasDisabledRoleCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDisabledRoleCount
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setDetachedRoleCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_detachedRoleCount = a3;
}

- (void)setHasDetachedRoleCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDetachedRoleCount
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setChildRoleCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_childRoleCount = a3;
}

- (void)setHasChildRoleCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasChildRoleCount
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setRouterRoleCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_routerRoleCount = a3;
}

- (void)setHasRouterRoleCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRouterRoleCount
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setLeaderRoleCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_leaderRoleCount = a3;
}

- (void)setHasLeaderRoleCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasLeaderRoleCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setAttachAttempts:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_attachAttempts = a3;
}

- (void)setHasAttachAttempts:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAttachAttempts
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setPartitionIdChangesCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_partitionIdChangesCount = a3;
}

- (void)setHasPartitionIdChangesCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasPartitionIdChangesCount
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setBetterPartitionAttachAttempts:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_betterPartitionAttachAttempts = a3;
}

- (void)setHasBetterPartitionAttachAttempts:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasBetterPartitionAttachAttempts
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setParentChangesCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_parentChangesCount = a3;
}

- (void)setHasParentChangesCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasParentChangesCount
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AWDCountersThreadMleS;
  id v3 = -[AWDCountersThreadMleS description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AWDCountersThreadMleS dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_disabledRoleCount));
    [v3 setObject:v7 forKey:@"disabled_role_count"];

    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }

  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_detachedRoleCount));
  [v3 setObject:v8 forKey:@"detached_role_count"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }

- (BOOL)readFrom:(id)a3
{
  return sub_1000B3F64((uint64_t)self, (uint64_t)a3, (uint64_t)a3, v3, v4);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_disabledRoleCount, 1LL);
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }

  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteUint32Field(v5, self->_detachedRoleCount, 2LL);
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }

- (void)copyTo:(id)a3
{
  uint64_t v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    v4[6] = self->_disabledRoleCount;
    *((_WORD *)v4 + 22) |= 0x10u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }

  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }

  v4[5] = self->_detachedRoleCount;
  *((_WORD *)v4 + 22) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)result + 6) = self->_disabledRoleCount;
    *((_WORD *)result + 22) |= 0x10u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }

  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)result + 5) = self->_detachedRoleCount;
  *((_WORD *)result + 22) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)v4 + 22);
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_disabledRoleCount != *((_DWORD *)v4 + 6)) {
      goto LABEL_47;
    }
  }

  else if ((v7 & 0x10) != 0)
  {
LABEL_47:
    BOOL v8 = 0;
    goto LABEL_48;
  }

  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_detachedRoleCount != *((_DWORD *)v4 + 5)) {
      goto LABEL_47;
    }
  }

  else if ((v7 & 8) != 0)
  {
    goto LABEL_47;
  }

  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_childRoleCount != *((_DWORD *)v4 + 4)) {
      goto LABEL_47;
    }
  }

  else if ((v7 & 4) != 0)
  {
    goto LABEL_47;
  }

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 22) & 0x100) == 0 || self->_routerRoleCount != *((_DWORD *)v4 + 10)) {
      goto LABEL_47;
    }
  }

  else if ((*((_WORD *)v4 + 22) & 0x100) != 0)
  {
    goto LABEL_47;
  }

  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_leaderRoleCount != *((_DWORD *)v4 + 7)) {
      goto LABEL_47;
    }
  }

  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_47;
  }

  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_attachAttempts != *((_DWORD *)v4 + 2)) {
      goto LABEL_47;
    }
  }

  else if ((v7 & 1) != 0)
  {
    goto LABEL_47;
  }

  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_partitionIdChangesCount != *((_DWORD *)v4 + 9)) {
      goto LABEL_47;
    }
  }

  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_47;
  }

  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_betterPartitionAttachAttempts != *((_DWORD *)v4 + 3)) {
      goto LABEL_47;
    }
  }

  else if ((v7 & 2) != 0)
  {
    goto LABEL_47;
  }

  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_parentChangesCount != *((_DWORD *)v4 + 8)) {
      goto LABEL_47;
    }
    BOOL v8 = 1;
  }

  else
  {
    BOOL v8 = (v7 & 0x40) == 0;
  }

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    uint64_t v3 = 2654435761LL * self->_disabledRoleCount;
    if ((has & 8) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761LL * self->_detachedRoleCount;
      if ((has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }

  else
  {
    uint64_t v3 = 0LL;
    if ((has & 8) != 0) {
      goto LABEL_3;
    }
  }

  uint64_t v4 = 0LL;
  if ((has & 4) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761LL * self->_childRoleCount;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 22);
  if ((v5 & 0x10) != 0)
  {
    self->_disabledRoleCount = *((_DWORD *)v4 + 6);
    *(_WORD *)&self->_has |= 0x10u;
    __int16 v5 = *((_WORD *)v4 + 22);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }

  else if ((v5 & 8) == 0)
  {
    goto LABEL_3;
  }

  self->_detachedRoleCount = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 22);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }

- (unsigned)disabledRoleCount
{
  return self->_disabledRoleCount;
}

- (unsigned)detachedRoleCount
{
  return self->_detachedRoleCount;
}

- (unsigned)childRoleCount
{
  return self->_childRoleCount;
}

- (unsigned)routerRoleCount
{
  return self->_routerRoleCount;
}

- (unsigned)leaderRoleCount
{
  return self->_leaderRoleCount;
}

- (unsigned)attachAttempts
{
  return self->_attachAttempts;
}

- (unsigned)partitionIdChangesCount
{
  return self->_partitionIdChangesCount;
}

- (unsigned)betterPartitionAttachAttempts
{
  return self->_betterPartitionAttachAttempts;
}

- (unsigned)parentChangesCount
{
  return self->_parentChangesCount;
}

@end
@interface CSDMessagingCallModelState
- (BOOL)addCallAllowed;
- (BOOL)endAndAnswerAllowed;
- (BOOL)hardPauseAvailable;
- (BOOL)hasAddCallAllowed;
- (BOOL)hasAmbiguityState;
- (BOOL)hasEndAndAnswerAllowed;
- (BOOL)hasHardPauseAvailable;
- (BOOL)hasHoldAllowed;
- (BOOL)hasHoldAndAnswerAllowed;
- (BOOL)hasMergeable;
- (BOOL)hasSendToVoicemailAllowed;
- (BOOL)hasSwappable;
- (BOOL)hasTakingCallsPrivateAllowed;
- (BOOL)holdAllowed;
- (BOOL)holdAndAnswerAllowed;
- (BOOL)isEqual:(id)a3;
- (BOOL)mergeable;
- (BOOL)readFrom:(id)a3;
- (BOOL)sendToVoicemailAllowed;
- (BOOL)swappable;
- (BOOL)takingCallsPrivateAllowed;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)ambiguityState;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAddCallAllowed:(BOOL)a3;
- (void)setAmbiguityState:(unsigned int)a3;
- (void)setEndAndAnswerAllowed:(BOOL)a3;
- (void)setHardPauseAvailable:(BOOL)a3;
- (void)setHasAddCallAllowed:(BOOL)a3;
- (void)setHasAmbiguityState:(BOOL)a3;
- (void)setHasEndAndAnswerAllowed:(BOOL)a3;
- (void)setHasHardPauseAvailable:(BOOL)a3;
- (void)setHasHoldAllowed:(BOOL)a3;
- (void)setHasHoldAndAnswerAllowed:(BOOL)a3;
- (void)setHasMergeable:(BOOL)a3;
- (void)setHasSendToVoicemailAllowed:(BOOL)a3;
- (void)setHasSwappable:(BOOL)a3;
- (void)setHasTakingCallsPrivateAllowed:(BOOL)a3;
- (void)setHoldAllowed:(BOOL)a3;
- (void)setHoldAndAnswerAllowed:(BOOL)a3;
- (void)setMergeable:(BOOL)a3;
- (void)setSendToVoicemailAllowed:(BOOL)a3;
- (void)setSwappable:(BOOL)a3;
- (void)setTakingCallsPrivateAllowed:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingCallModelState

- (void)setAmbiguityState:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_ambiguityState = a3;
}

- (void)setHasAmbiguityState:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAmbiguityState
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setSwappable:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_swappable = a3;
}

- (void)setHasSwappable:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSwappable
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setMergeable:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_mergeable = a3;
}

- (void)setHasMergeable:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasMergeable
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHoldAllowed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_holdAllowed = a3;
}

- (void)setHasHoldAllowed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasHoldAllowed
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setAddCallAllowed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_addCallAllowed = a3;
}

- (void)setHasAddCallAllowed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAddCallAllowed
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setTakingCallsPrivateAllowed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_takingCallsPrivateAllowed = a3;
}

- (void)setHasTakingCallsPrivateAllowed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasTakingCallsPrivateAllowed
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHardPauseAvailable:(BOOL)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_hardPauseAvailable = a3;
}

- (void)setHasHardPauseAvailable:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasHardPauseAvailable
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setEndAndAnswerAllowed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_endAndAnswerAllowed = a3;
}

- (void)setHasEndAndAnswerAllowed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasEndAndAnswerAllowed
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHoldAndAnswerAllowed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_holdAndAnswerAllowed = a3;
}

- (void)setHasHoldAndAnswerAllowed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasHoldAndAnswerAllowed
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setSendToVoicemailAllowed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_sendToVoicemailAllowed = a3;
}

- (void)setHasSendToVoicemailAllowed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasSendToVoicemailAllowed
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSDMessagingCallModelState;
  id v3 = -[CSDMessagingCallModelState description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCallModelState dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int16 has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_ambiguityState));
    [v3 setObject:v7 forKey:@"ambiguityState"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }

  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_swappable));
  [v3 setObject:v8 forKey:@"swappable"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }

- (BOOL)readFrom:(id)a3
{
  return sub_100178730((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_ambiguityState, 1LL);
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }

  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteBOOLField(v5, self->_swappable, 2LL);
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }

- (void)copyTo:(id)a3
{
  v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v4[2] = self->_ambiguityState;
    *((_WORD *)v4 + 12) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }

  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }

  *((_BYTE *)v4 + 19) = self->_swappable;
  *((_WORD *)v4 + 12) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  __int16 has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_ambiguityState;
    *((_WORD *)result + 12) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }

  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }

  *((_BYTE *)result + 19) = self->_swappable;
  *((_WORD *)result + 12) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)v4 + 12);
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_ambiguityState != *((_DWORD *)v4 + 2)) {
      goto LABEL_74;
    }
  }

  else if ((v7 & 1) != 0)
  {
    goto LABEL_74;
  }

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 12) & 0x100) == 0) {
      goto LABEL_74;
    }
    if (self->_swappable)
    {
      if (!*((_BYTE *)v4 + 19)) {
        goto LABEL_74;
      }
    }

    else if (*((_BYTE *)v4 + 19))
    {
      goto LABEL_74;
    }
  }

  else if ((*((_WORD *)v4 + 12) & 0x100) != 0)
  {
    goto LABEL_74;
  }

  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0) {
      goto LABEL_74;
    }
    if (self->_mergeable)
    {
      if (!*((_BYTE *)v4 + 17)) {
        goto LABEL_74;
      }
    }

    else if (*((_BYTE *)v4 + 17))
    {
      goto LABEL_74;
    }
  }

  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_74;
  }

  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0) {
      goto LABEL_74;
    }
    if (self->_holdAllowed)
    {
      if (!*((_BYTE *)v4 + 15)) {
        goto LABEL_74;
      }
    }

    else if (*((_BYTE *)v4 + 15))
    {
      goto LABEL_74;
    }
  }

  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_74;
  }

  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0) {
      goto LABEL_74;
    }
    if (self->_addCallAllowed)
    {
      if (!*((_BYTE *)v4 + 12)) {
        goto LABEL_74;
      }
    }

    else if (*((_BYTE *)v4 + 12))
    {
      goto LABEL_74;
    }
  }

  else if ((v7 & 2) != 0)
  {
    goto LABEL_74;
  }

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 12) & 0x200) == 0) {
      goto LABEL_74;
    }
    if (self->_takingCallsPrivateAllowed)
    {
      if (!*((_BYTE *)v4 + 20)) {
        goto LABEL_74;
      }
    }

    else if (*((_BYTE *)v4 + 20))
    {
      goto LABEL_74;
    }
  }

  else if ((*((_WORD *)v4 + 12) & 0x200) != 0)
  {
    goto LABEL_74;
  }

  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0) {
      goto LABEL_74;
    }
    if (self->_hardPauseAvailable)
    {
      if (!*((_BYTE *)v4 + 14)) {
        goto LABEL_74;
      }
    }

    else if (*((_BYTE *)v4 + 14))
    {
      goto LABEL_74;
    }
  }

  else if ((v7 & 8) != 0)
  {
    goto LABEL_74;
  }

  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0) {
      goto LABEL_74;
    }
    if (self->_endAndAnswerAllowed)
    {
      if (!*((_BYTE *)v4 + 13)) {
        goto LABEL_74;
      }
    }

    else if (*((_BYTE *)v4 + 13))
    {
      goto LABEL_74;
    }
  }

  else if ((v7 & 4) != 0)
  {
    goto LABEL_74;
  }

  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0) {
      goto LABEL_74;
    }
    if (self->_holdAndAnswerAllowed)
    {
      if (!*((_BYTE *)v4 + 16)) {
        goto LABEL_74;
      }
    }

    else if (*((_BYTE *)v4 + 16))
    {
      goto LABEL_74;
    }
  }

  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_74;
  }

  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) != 0)
    {
      if (self->_sendToVoicemailAllowed)
      {
        if (!*((_BYTE *)v4 + 18)) {
          goto LABEL_74;
        }
      }

      else if (*((_BYTE *)v4 + 18))
      {
        goto LABEL_74;
      }

      BOOL v8 = 1;
      goto LABEL_75;
    }

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    uint64_t v3 = 2654435761LL * self->_ambiguityState;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761LL * self->_swappable;
      if ((has & 0x40) != 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }

  else
  {
    uint64_t v3 = 0LL;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_3;
    }
  }

  uint64_t v4 = 0LL;
  if ((has & 0x40) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761LL * self->_mergeable;
    if ((has & 0x10) != 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 12);
  if ((v5 & 1) != 0)
  {
    self->_ambiguityState = *((_DWORD *)v4 + 2);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)v4 + 12);
    if ((v5 & 0x100) == 0)
    {
LABEL_3:
      if ((v5 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }

  else if ((*((_WORD *)v4 + 12) & 0x100) == 0)
  {
    goto LABEL_3;
  }

  self->_swappable = *((_BYTE *)v4 + 19);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 12);
  if ((v5 & 0x40) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }

- (unsigned)ambiguityState
{
  return self->_ambiguityState;
}

- (BOOL)swappable
{
  return self->_swappable;
}

- (BOOL)mergeable
{
  return self->_mergeable;
}

- (BOOL)holdAllowed
{
  return self->_holdAllowed;
}

- (BOOL)addCallAllowed
{
  return self->_addCallAllowed;
}

- (BOOL)takingCallsPrivateAllowed
{
  return self->_takingCallsPrivateAllowed;
}

- (BOOL)hardPauseAvailable
{
  return self->_hardPauseAvailable;
}

- (BOOL)endAndAnswerAllowed
{
  return self->_endAndAnswerAllowed;
}

- (BOOL)holdAndAnswerAllowed
{
  return self->_holdAndAnswerAllowed;
}

- (BOOL)sendToVoicemailAllowed
{
  return self->_sendToVoicemailAllowed;
}

@end
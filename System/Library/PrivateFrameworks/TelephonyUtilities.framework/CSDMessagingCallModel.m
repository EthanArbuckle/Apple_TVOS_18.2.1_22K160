@interface CSDMessagingCallModel
- (BOOL)hasSupportsAddCall;
- (BOOL)hasSupportsDTMF;
- (BOOL)hasSupportsGrouping;
- (BOOL)hasSupportsHolding;
- (BOOL)hasSupportsSendingToVoicemail;
- (BOOL)hasSupportsUnambiguousMultiPartyState;
- (BOOL)hasSupportsUngrouping;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportsAddCall;
- (BOOL)supportsDTMF;
- (BOOL)supportsGrouping;
- (BOOL)supportsHolding;
- (BOOL)supportsSendingToVoicemail;
- (BOOL)supportsUnambiguousMultiPartyState;
- (BOOL)supportsUngrouping;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSupportsAddCall:(BOOL)a3;
- (void)setHasSupportsDTMF:(BOOL)a3;
- (void)setHasSupportsGrouping:(BOOL)a3;
- (void)setHasSupportsHolding:(BOOL)a3;
- (void)setHasSupportsSendingToVoicemail:(BOOL)a3;
- (void)setHasSupportsUnambiguousMultiPartyState:(BOOL)a3;
- (void)setHasSupportsUngrouping:(BOOL)a3;
- (void)setSupportsAddCall:(BOOL)a3;
- (void)setSupportsDTMF:(BOOL)a3;
- (void)setSupportsGrouping:(BOOL)a3;
- (void)setSupportsHolding:(BOOL)a3;
- (void)setSupportsSendingToVoicemail:(BOOL)a3;
- (void)setSupportsUnambiguousMultiPartyState:(BOOL)a3;
- (void)setSupportsUngrouping:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingCallModel

- (void)setSupportsHolding:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_supportsHolding = a3;
}

- (void)setHasSupportsHolding:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSupportsHolding
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setSupportsGrouping:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_supportsGrouping = a3;
}

- (void)setHasSupportsGrouping:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSupportsGrouping
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setSupportsUngrouping:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_supportsUngrouping = a3;
}

- (void)setHasSupportsUngrouping:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSupportsUngrouping
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setSupportsDTMF:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_supportsDTMF = a3;
}

- (void)setHasSupportsDTMF:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSupportsDTMF
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSupportsUnambiguousMultiPartyState:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_supportsUnambiguousMultiPartyState = a3;
}

- (void)setHasSupportsUnambiguousMultiPartyState:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSupportsUnambiguousMultiPartyState
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setSupportsAddCall:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_supportsAddCall = a3;
}

- (void)setHasSupportsAddCall:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSupportsAddCall
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSupportsSendingToVoicemail:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_supportsSendingToVoicemail = a3;
}

- (void)setHasSupportsSendingToVoicemail:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSupportsSendingToVoicemail
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSDMessagingCallModel;
  id v3 = -[CSDMessagingCallModel description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCallModel dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_supportsHolding));
    [v3 setObject:v7 forKey:@"supportsHolding"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }

  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_supportsGrouping));
  [v3 setObject:v8 forKey:@"supportsGrouping"];

  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }

- (BOOL)readFrom:(id)a3
{
  return sub_100043C10((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField(v5, self->_supportsHolding, 1LL);
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }

  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteBOOLField(v5, self->_supportsGrouping, 2LL);
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[11] = self->_supportsHolding;
    v4[16] |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }

  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }

  v4[10] = self->_supportsGrouping;
  v4[16] |= 4u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_BYTE *)result + 11) = self->_supportsHolding;
    *((_BYTE *)result + 16) |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }

  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }

  *((_BYTE *)result + 10) = self->_supportsGrouping;
  *((_BYTE *)result + 16) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((v4[16] & 8) == 0) {
      goto LABEL_52;
    }
    if (self->_supportsHolding)
    {
      if (!v4[11]) {
        goto LABEL_52;
      }
    }

    else if (v4[11])
    {
      goto LABEL_52;
    }
  }

  else if ((v4[16] & 8) != 0)
  {
    goto LABEL_52;
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[16] & 4) == 0) {
      goto LABEL_52;
    }
    if (self->_supportsGrouping)
    {
      if (!v4[10]) {
        goto LABEL_52;
      }
    }

    else if (v4[10])
    {
      goto LABEL_52;
    }
  }

  else if ((v4[16] & 4) != 0)
  {
    goto LABEL_52;
  }

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((v4[16] & 0x40) == 0) {
      goto LABEL_52;
    }
    if (self->_supportsUngrouping)
    {
      if (!v4[14]) {
        goto LABEL_52;
      }
    }

    else if (v4[14])
    {
      goto LABEL_52;
    }
  }

  else if ((v4[16] & 0x40) != 0)
  {
    goto LABEL_52;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[16] & 2) == 0) {
      goto LABEL_52;
    }
    if (self->_supportsDTMF)
    {
      if (!v4[9]) {
        goto LABEL_52;
      }
    }

    else if (v4[9])
    {
      goto LABEL_52;
    }
  }

  else if ((v4[16] & 2) != 0)
  {
    goto LABEL_52;
  }

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((v4[16] & 0x20) == 0) {
      goto LABEL_52;
    }
    if (self->_supportsUnambiguousMultiPartyState)
    {
      if (!v4[13]) {
        goto LABEL_52;
      }
    }

    else if (v4[13])
    {
      goto LABEL_52;
    }
  }

  else if ((v4[16] & 0x20) != 0)
  {
    goto LABEL_52;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[16] & 1) == 0) {
      goto LABEL_52;
    }
    if (self->_supportsAddCall)
    {
      if (!v4[8]) {
        goto LABEL_52;
      }
    }

    else if (v4[8])
    {
      goto LABEL_52;
    }
  }

  else if ((v4[16] & 1) != 0)
  {
    goto LABEL_52;
  }

  BOOL v6 = (v4[16] & 0x10) == 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((v4[16] & 0x10) != 0)
    {
      if (self->_supportsSendingToVoicemail)
      {
        if (!v4[12]) {
          goto LABEL_52;
        }
      }

      else if (v4[12])
      {
        goto LABEL_52;
      }

      BOOL v6 = 1;
      goto LABEL_53;
    }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    uint64_t v2 = 2654435761LL * self->_supportsHolding;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761LL * self->_supportsGrouping;
      if ((*(_BYTE *)&self->_has & 0x40) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }

  else
  {
    uint64_t v2 = 0LL;
    if ((*(_BYTE *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }

  uint64_t v3 = 0LL;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761LL * self->_supportsUngrouping;
    if ((*(_BYTE *)&self->_has & 2) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (BOOL *)a3;
  BOOL v5 = v4[16];
  if ((v5 & 8) != 0)
  {
    self->_supportsHolding = v4[11];
    *(_BYTE *)&self->_has |= 8u;
    BOOL v5 = v4[16];
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }

  else if ((v4[16] & 4) == 0)
  {
    goto LABEL_3;
  }

  self->_supportsGrouping = v4[10];
  *(_BYTE *)&self->_has |= 4u;
  BOOL v5 = v4[16];
  if ((v5 & 0x40) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }

- (BOOL)supportsHolding
{
  return self->_supportsHolding;
}

- (BOOL)supportsGrouping
{
  return self->_supportsGrouping;
}

- (BOOL)supportsUngrouping
{
  return self->_supportsUngrouping;
}

- (BOOL)supportsDTMF
{
  return self->_supportsDTMF;
}

- (BOOL)supportsUnambiguousMultiPartyState
{
  return self->_supportsUnambiguousMultiPartyState;
}

- (BOOL)supportsAddCall
{
  return self->_supportsAddCall;
}

- (BOOL)supportsSendingToVoicemail
{
  return self->_supportsSendingToVoicemail;
}

@end
@interface OTCDPRecoveryInformation
- (BOOL)containsIcdpData;
- (BOOL)hasContainsIcdpData;
- (BOOL)hasNonViableRepair;
- (BOOL)hasRecoveryKey;
- (BOOL)hasRecoverySecret;
- (BOOL)hasSilentRecoveryAttempt;
- (BOOL)hasUseCachedSecret;
- (BOOL)hasUsePreviouslyCachedRecoveryKey;
- (BOOL)hasUsesMultipleIcsc;
- (BOOL)isEqual:(id)a3;
- (BOOL)nonViableRepair;
- (BOOL)readFrom:(id)a3;
- (BOOL)silentRecoveryAttempt;
- (BOOL)useCachedSecret;
- (BOOL)usePreviouslyCachedRecoveryKey;
- (BOOL)usesMultipleIcsc;
- (NSString)recoveryKey;
- (NSString)recoverySecret;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContainsIcdpData:(BOOL)a3;
- (void)setHasContainsIcdpData:(BOOL)a3;
- (void)setHasNonViableRepair:(BOOL)a3;
- (void)setHasSilentRecoveryAttempt:(BOOL)a3;
- (void)setHasUseCachedSecret:(BOOL)a3;
- (void)setHasUsePreviouslyCachedRecoveryKey:(BOOL)a3;
- (void)setHasUsesMultipleIcsc:(BOOL)a3;
- (void)setNonViableRepair:(BOOL)a3;
- (void)setRecoveryKey:(id)a3;
- (void)setRecoverySecret:(id)a3;
- (void)setSilentRecoveryAttempt:(BOOL)a3;
- (void)setUseCachedSecret:(BOOL)a3;
- (void)setUsePreviouslyCachedRecoveryKey:(BOOL)a3;
- (void)setUsesMultipleIcsc:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTCDPRecoveryInformation

- (BOOL)hasRecoverySecret
{
  return self->_recoverySecret != 0LL;
}

- (void)setUseCachedSecret:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_useCachedSecret = a3;
}

- (void)setHasUseCachedSecret:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasUseCachedSecret
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasRecoveryKey
{
  return self->_recoveryKey != 0LL;
}

- (void)setUsePreviouslyCachedRecoveryKey:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_usePreviouslyCachedRecoveryKey = a3;
}

- (void)setHasUsePreviouslyCachedRecoveryKey:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasUsePreviouslyCachedRecoveryKey
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setSilentRecoveryAttempt:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_silentRecoveryAttempt = a3;
}

- (void)setHasSilentRecoveryAttempt:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSilentRecoveryAttempt
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setContainsIcdpData:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_containsIcdpData = a3;
}

- (void)setHasContainsIcdpData:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContainsIcdpData
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setUsesMultipleIcsc:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_usesMultipleIcsc = a3;
}

- (void)setHasUsesMultipleIcsc:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasUsesMultipleIcsc
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setNonViableRepair:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_nonViableRepair = a3;
}

- (void)setHasNonViableRepair:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNonViableRepair
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___OTCDPRecoveryInformation;
  v4 = -[OTCDPRecoveryInformation description](&v8, sel_description);
  v5 = -[OTCDPRecoveryInformation dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  recoverySecret = self->_recoverySecret;
  if (recoverySecret) {
    [v3 setObject:recoverySecret forKey:@"recovery_secret"];
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    [MEMORY[0x189607968] numberWithBool:self->_useCachedSecret];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v6 forKey:@"use_cached_secret"];
  }

  recoveryKey = self->_recoveryKey;
  if (recoveryKey) {
    [v4 setObject:recoveryKey forKey:@"recovery_key"];
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    [MEMORY[0x189607968] numberWithBool:self->_usePreviouslyCachedRecoveryKey];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v11 forKey:@"use_previously_cached_recovery_key"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_16;
    }
  }

  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }

  [MEMORY[0x189607968] numberWithBool:self->_silentRecoveryAttempt];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v12 forKey:@"silent_recovery_attempt"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
LABEL_17:
    [MEMORY[0x189607968] numberWithBool:self->_usesMultipleIcsc];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v14 forKey:@"uses_multiple_icsc"];

    if ((*(_BYTE *)&self->_has & 2) == 0) {
      return v4;
    }
    goto LABEL_12;
  }

- (BOOL)readFrom:(id)a3
{
  return OTCDPRecoveryInformationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_recoverySecret)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }

  if (self->_recoveryKey)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }

  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_16;
    }
  }

  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }

  PBDataWriterWriteBOOLField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
LABEL_17:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    if ((*(_BYTE *)&self->_has & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_recoverySecret)
  {
    objc_msgSend(v4, "setRecoverySecret:");
    id v4 = v6;
  }

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v4[27] = self->_useCachedSecret;
    v4[32] |= 8u;
  }

  if (self->_recoveryKey)
  {
    objc_msgSend(v6, "setRecoveryKey:");
    id v4 = v6;
  }

  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v4[28] = self->_usePreviouslyCachedRecoveryKey;
    v4[32] |= 0x10u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_16;
    }
  }

  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }

  v4[26] = self->_silentRecoveryAttempt;
  v4[32] |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
LABEL_17:
    v4[29] = self->_usesMultipleIcsc;
    v4[32] |= 0x20u;
    if ((*(_BYTE *)&self->_has & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = -[NSString copyWithZone:](self->_recoverySecret, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_BYTE *)(v5 + 27) = self->_useCachedSecret;
    *(_BYTE *)(v5 + 32) |= 8u;
  }

  uint64_t v8 = -[NSString copyWithZone:](self->_recoveryKey, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 28) = self->_usePreviouslyCachedRecoveryKey;
    *(_BYTE *)(v5 + 32) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
  }

  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }

  *(_BYTE *)(v5 + 26) = self->_silentRecoveryAttempt;
  *(_BYTE *)(v5 + 32) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
LABEL_13:
    *(_BYTE *)(v5 + 29) = self->_usesMultipleIcsc;
    *(_BYTE *)(v5 + 32) |= 0x20u;
    if ((*(_BYTE *)&self->_has & 2) == 0) {
      return (id)v5;
    }
    goto LABEL_8;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  recoverySecret = self->_recoverySecret;
  if ((unint64_t)recoverySecret | *((void *)v4 + 2))
  {
  }

  char has = (char)self->_has;
  char v7 = *((_BYTE *)v4 + 32);
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 8) == 0) {
      goto LABEL_49;
    }
    if (self->_useCachedSecret)
    {
      if (!*((_BYTE *)v4 + 27)) {
        goto LABEL_49;
      }
    }

    else if (*((_BYTE *)v4 + 27))
    {
      goto LABEL_49;
    }
  }

  else if ((*((_BYTE *)v4 + 32) & 8) != 0)
  {
    goto LABEL_49;
  }

  recoveryKey = self->_recoveryKey;
  if ((unint64_t)recoveryKey | *((void *)v4 + 1))
  {
    char has = (char)self->_has;
    char v7 = *((_BYTE *)v4 + 32);
  }

  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0) {
      goto LABEL_49;
    }
    if (self->_usePreviouslyCachedRecoveryKey)
    {
      if (!*((_BYTE *)v4 + 28)) {
        goto LABEL_49;
      }
    }

    else if (*((_BYTE *)v4 + 28))
    {
      goto LABEL_49;
    }
  }

  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_49;
  }

  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0) {
      goto LABEL_49;
    }
    if (self->_silentRecoveryAttempt)
    {
      if (!*((_BYTE *)v4 + 26)) {
        goto LABEL_49;
      }
    }

    else if (*((_BYTE *)v4 + 26))
    {
      goto LABEL_49;
    }
  }

  else if ((v7 & 4) != 0)
  {
    goto LABEL_49;
  }

  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0) {
      goto LABEL_49;
    }
    if (self->_containsIcdpData)
    {
      if (!*((_BYTE *)v4 + 24)) {
        goto LABEL_49;
      }
    }

    else if (*((_BYTE *)v4 + 24))
    {
      goto LABEL_49;
    }
  }

  else if ((v7 & 1) != 0)
  {
    goto LABEL_49;
  }

  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0) {
      goto LABEL_49;
    }
    if (self->_usesMultipleIcsc)
    {
      if (!*((_BYTE *)v4 + 29)) {
        goto LABEL_49;
      }
    }

    else if (*((_BYTE *)v4 + 29))
    {
      goto LABEL_49;
    }
  }

  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_49;
  }

  BOOL v9 = (v7 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v7 & 2) != 0)
    {
      if (self->_nonViableRepair)
      {
        if (!*((_BYTE *)v4 + 25)) {
          goto LABEL_49;
        }
      }

      else if (*((_BYTE *)v4 + 25))
      {
        goto LABEL_49;
      }

      BOOL v9 = 1;
      goto LABEL_50;
    }

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_recoverySecret, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0) {
    uint64_t v4 = 2654435761LL * self->_useCachedSecret;
  }
  else {
    uint64_t v4 = 0LL;
  }
  NSUInteger v5 = -[NSString hash](self->_recoveryKey, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    uint64_t v6 = 2654435761LL * self->_usePreviouslyCachedRecoveryKey;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_6:
      uint64_t v7 = 2654435761LL * self->_silentRecoveryAttempt;
      if ((*(_BYTE *)&self->_has & 1) != 0) {
        goto LABEL_7;
      }
      goto LABEL_12;
    }
  }

  else
  {
    uint64_t v6 = 0LL;
    if ((*(_BYTE *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
  }

  uint64_t v7 = 0LL;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761LL * self->_containsIcdpData;
    if ((*(_BYTE *)&self->_has & 0x20) != 0) {
      goto LABEL_8;
    }
LABEL_13:
    uint64_t v9 = 0LL;
    if ((*(_BYTE *)&self->_has & 2) != 0) {
      goto LABEL_9;
    }
LABEL_14:
    uint64_t v10 = 0LL;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (BOOL *)a3;
  uint64_t v6 = v4;
  if (*((void *)v4 + 2))
  {
    -[OTCDPRecoveryInformation setRecoverySecret:](self, "setRecoverySecret:");
    uint64_t v4 = v6;
  }

  if ((v4[32] & 8) != 0)
  {
    self->_useCachedSecret = v4[27];
    *(_BYTE *)&self->_has |= 8u;
  }

  if (*((void *)v4 + 1))
  {
    -[OTCDPRecoveryInformation setRecoveryKey:](self, "setRecoveryKey:");
    uint64_t v4 = v6;
  }

  BOOL v5 = v4[32];
  if ((v5 & 0x10) != 0)
  {
    self->_usePreviouslyCachedRecoveryKey = v4[28];
    *(_BYTE *)&self->_has |= 0x10u;
    BOOL v5 = v4[32];
    if ((v5 & 4) == 0)
    {
LABEL_9:
      if (!v5) {
        goto LABEL_10;
      }
      goto LABEL_16;
    }
  }

  else if ((v4[32] & 4) == 0)
  {
    goto LABEL_9;
  }

  self->_silentRecoveryAttempt = v4[26];
  *(_BYTE *)&self->_has |= 4u;
  BOOL v5 = v4[32];
  if (!v5)
  {
LABEL_10:
    if ((v5 & 0x20) == 0) {
      goto LABEL_11;
    }
LABEL_17:
    self->_usesMultipleIcsc = v4[29];
    *(_BYTE *)&self->_has |= 0x20u;
    if ((v4[32] & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }

- (NSString)recoverySecret
{
  return self->_recoverySecret;
}

- (void)setRecoverySecret:(id)a3
{
}

- (BOOL)useCachedSecret
{
  return self->_useCachedSecret;
}

- (NSString)recoveryKey
{
  return self->_recoveryKey;
}

- (void)setRecoveryKey:(id)a3
{
}

- (BOOL)usePreviouslyCachedRecoveryKey
{
  return self->_usePreviouslyCachedRecoveryKey;
}

- (BOOL)silentRecoveryAttempt
{
  return self->_silentRecoveryAttempt;
}

- (BOOL)containsIcdpData
{
  return self->_containsIcdpData;
}

- (BOOL)usesMultipleIcsc
{
  return self->_usesMultipleIcsc;
}

- (BOOL)nonViableRepair
{
  return self->_nonViableRepair;
}

- (void).cxx_destruct
{
}

@end
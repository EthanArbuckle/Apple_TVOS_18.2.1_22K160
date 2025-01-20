@interface OTEscrowRecord
- (BOOL)hasCoolOffEnd;
- (BOOL)hasCreationDate;
- (BOOL)hasEscrowInformationMetadata;
- (BOOL)hasExpectedFederationId;
- (BOOL)hasFederationId;
- (BOOL)hasLabel;
- (BOOL)hasRecordId;
- (BOOL)hasRecordStatus;
- (BOOL)hasRecordViability;
- (BOOL)hasRecoveryStatus;
- (BOOL)hasRemainingAttempts;
- (BOOL)hasSerialNumber;
- (BOOL)hasSilentAttemptAllowed;
- (BOOL)hasViabilityStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)expectedFederationId;
- (NSString)federationId;
- (NSString)label;
- (NSString)recordId;
- (NSString)serialNumber;
- (OTEscrowRecordMetadata)escrowInformationMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)recordStatusAsString:(int)a3;
- (id)recordViabilityAsString:(int)a3;
- (id)recoveryStatusAsString:(int)a3;
- (id)viabilityStatusAsString:(int)a3;
- (int)StringAsRecordStatus:(id)a3;
- (int)StringAsRecordViability:(id)a3;
- (int)StringAsRecoveryStatus:(id)a3;
- (int)StringAsViabilityStatus:(id)a3;
- (int)recordStatus;
- (int)recordViability;
- (int)recoveryStatus;
- (int)viabilityStatus;
- (unint64_t)coolOffEnd;
- (unint64_t)creationDate;
- (unint64_t)hash;
- (unint64_t)remainingAttempts;
- (unint64_t)silentAttemptAllowed;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCoolOffEnd:(unint64_t)a3;
- (void)setCreationDate:(unint64_t)a3;
- (void)setEscrowInformationMetadata:(id)a3;
- (void)setExpectedFederationId:(id)a3;
- (void)setFederationId:(id)a3;
- (void)setHasCoolOffEnd:(BOOL)a3;
- (void)setHasCreationDate:(BOOL)a3;
- (void)setHasRecordStatus:(BOOL)a3;
- (void)setHasRecordViability:(BOOL)a3;
- (void)setHasRecoveryStatus:(BOOL)a3;
- (void)setHasRemainingAttempts:(BOOL)a3;
- (void)setHasSilentAttemptAllowed:(BOOL)a3;
- (void)setHasViabilityStatus:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setRecordId:(id)a3;
- (void)setRecordStatus:(int)a3;
- (void)setRecordViability:(int)a3;
- (void)setRecoveryStatus:(int)a3;
- (void)setRemainingAttempts:(unint64_t)a3;
- (void)setSerialNumber:(id)a3;
- (void)setSilentAttemptAllowed:(unint64_t)a3;
- (void)setViabilityStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTEscrowRecord

- (void)setCreationDate:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_creationDate = a3;
}

- (void)setHasCreationDate:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCreationDate
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setRemainingAttempts:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_remainingAttempts = a3;
}

- (void)setHasRemainingAttempts:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRemainingAttempts
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasEscrowInformationMetadata
{
  return self->_escrowInformationMetadata != 0LL;
}

- (BOOL)hasLabel
{
  return self->_label != 0LL;
}

- (void)setSilentAttemptAllowed:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_silentAttemptAllowed = a3;
}

- (void)setHasSilentAttemptAllowed:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSilentAttemptAllowed
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (int)recordStatus
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0) {
    return self->_recordStatus;
  }
  else {
    return 0;
  }
}

- (void)setRecordStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_recordStatus = a3;
}

- (void)setHasRecordStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasRecordStatus
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)recordStatusAsString:(int)a3
{
  if (!a3) {
    return @"RECORD_STATUS_VALID";
  }
  if (a3 == 1) {
    char v3 = @"RECORD_STATUS_INVALID";
  }
  else {
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  return v3;
}

- (int)StringAsRecordStatus:(id)a3
{
  id v3 = a3;
  else {
    int v4 = [v3 isEqualToString:@"RECORD_STATUS_INVALID"];
  }

  return v4;
}

- (BOOL)hasRecordId
{
  return self->_recordId != 0LL;
}

- (int)recoveryStatus
{
  if ((*(_BYTE *)&self->_has & 0x40) != 0) {
    return self->_recoveryStatus;
  }
  else {
    return 0;
  }
}

- (void)setRecoveryStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_recoveryStatus = a3;
}

- (void)setHasRecoveryStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasRecoveryStatus
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (id)recoveryStatusAsString:(int)a3
{
  if (a3 >= 3) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return *(&off_10023DBA0 + a3);
  }
}

- (int)StringAsRecoveryStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RECOVERY_STATUS_VALID"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"RECOVERY_STATUS_SOFT_LIMIT_REACHED"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"RECOVERY_STATUS_HARD_LIMIT_REACHED"])
  {
    int v4 = 2;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setCoolOffEnd:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_coolOffEnd = a3;
}

- (void)setHasCoolOffEnd:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCoolOffEnd
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasSerialNumber
{
  return self->_serialNumber != 0LL;
}

- (int)recordViability
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0) {
    return self->_recordViability;
  }
  else {
    return 0;
  }
}

- (void)setRecordViability:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_recordViability = a3;
}

- (void)setHasRecordViability:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasRecordViability
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)recordViabilityAsString:(int)a3
{
  if (a3 >= 3) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return *(&off_10023DBB8 + a3);
  }
}

- (int)StringAsRecordViability:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RECORD_VIABILITY_FULLY_VIABLE"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"RECORD_VIABILITY_PARTIALLY_VIABLE"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"RECORD_VIABILITY_LEGACY"])
  {
    int v4 = 2;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)viabilityStatus
{
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0) {
    return self->_viabilityStatus;
  }
  else {
    return 0;
  }
}

- (void)setViabilityStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_viabilityStatus = a3;
}

- (void)setHasViabilityStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasViabilityStatus
{
  return *(_BYTE *)&self->_has >> 7;
}

- (id)viabilityStatusAsString:(int)a3
{
  if (a3 >= 3) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return *(&off_10023DBD0 + a3);
  }
}

- (int)StringAsViabilityStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SOS_VIABLE_UNKNOWN"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"SOS_VIABLE"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"SOS_NOT_VIABLE"])
  {
    int v4 = 2;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasFederationId
{
  return self->_federationId != 0LL;
}

- (BOOL)hasExpectedFederationId
{
  return self->_expectedFederationId != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___OTEscrowRecord;
  id v3 = -[OTEscrowRecord description](&v8, "description");
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTEscrowRecord dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_creationDate));
    [v3 setObject:v5 forKey:@"creation_date"];

    char has = (char)self->_has;
  }

  if ((has & 4) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_remainingAttempts));
    [v3 setObject:v6 forKey:@"remaining_attempts"];
  }

  escrowInformationMetadata = self->_escrowInformationMetadata;
  if (escrowInformationMetadata)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( -[OTEscrowRecordMetadata dictionaryRepresentation]( escrowInformationMetadata,  "dictionaryRepresentation"));
    [v3 setObject:v8 forKey:@"escrow_information_metadata"];
  }

  label = self->_label;
  if (label) {
    [v3 setObject:label forKey:@"label"];
  }
  char v10 = (char)self->_has;
  if ((v10 & 8) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_silentAttemptAllowed));
    [v3 setObject:v11 forKey:@"silent_attempt_allowed"];

    char v10 = (char)self->_has;
  }

  if ((v10 & 0x10) != 0)
  {
    int recordStatus = self->_recordStatus;
    if (recordStatus)
    {
      if (recordStatus == 1) {
        v13 = @"RECORD_STATUS_INVALID";
      }
      else {
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_recordStatus));
      }
    }

    else
    {
      v13 = @"RECORD_STATUS_VALID";
    }

    [v3 setObject:v13 forKey:@"record_status"];
  }

  recordId = self->_recordId;
  if (recordId) {
    [v3 setObject:recordId forKey:@"record_id"];
  }
  char v15 = (char)self->_has;
  if ((v15 & 0x40) != 0)
  {
    uint64_t recoveryStatus = self->_recoveryStatus;
    if (recoveryStatus >= 3) {
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_recoveryStatus));
    }
    else {
      v17 = *(&off_10023DBA0 + recoveryStatus);
    }
    [v3 setObject:v17 forKey:@"recovery_status"];

    char v15 = (char)self->_has;
  }

  if ((v15 & 1) != 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_coolOffEnd));
    [v3 setObject:v18 forKey:@"cool_off_end"];
  }

  serialNumber = self->_serialNumber;
  if (serialNumber) {
    [v3 setObject:serialNumber forKey:@"serial_number"];
  }
  char v20 = (char)self->_has;
  if ((v20 & 0x20) != 0)
  {
    uint64_t recordViability = self->_recordViability;
    if (recordViability >= 3) {
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_recordViability));
    }
    else {
      v22 = *(&off_10023DBB8 + recordViability);
    }
    [v3 setObject:v22 forKey:@"record_viability"];

    char v20 = (char)self->_has;
  }

  if (v20 < 0)
  {
    uint64_t viabilityStatus = self->_viabilityStatus;
    if (viabilityStatus >= 3) {
      v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_viabilityStatus));
    }
    else {
      v24 = *(&off_10023DBD0 + viabilityStatus);
    }
    [v3 setObject:v24 forKey:@"viability_status"];
  }

  federationId = self->_federationId;
  if (federationId) {
    [v3 setObject:federationId forKey:@"federation_id"];
  }
  expectedFederationId = self->_expectedFederationId;
  if (expectedFederationId) {
    [v3 setObject:expectedFederationId forKey:@"expected_federation_id"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    v5 = &selRef_setAllSelves_;
    v6 = &selRef_setAllSelves_;
    while (!*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
    {
      char v7 = 0;
      unsigned int v8 = 0;
      unint64_t v9 = 0LL;
      while (1)
      {
        unint64_t v10 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        char v11 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v10);
        *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v10 + 1;
        v9 |= (unint64_t)(v11 & 0x7F) << v7;
        if ((v11 & 0x80) == 0) {
          goto LABEL_12;
        }
        v7 += 7;
        BOOL v12 = v8++ >= 9;
        if (v12)
        {
          unint64_t v9 = 0LL;
          int v13 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_14;
        }
      }

      *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_12:
      int v13 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
      if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v9 = 0LL;
      }
LABEL_14:
      if (v13 || (v9 & 7) == 4) {
        break;
      }
      switch((v9 >> 3))
      {
        case 1u:
          char v15 = 0;
          unsigned int v16 = 0;
          uint64_t v17 = 0LL;
          self->PBCodable_opaque[*((int *)v5 + 941)] |= 2u;
          while (1)
          {
            unint64_t v18 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            char v19 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v18);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v18 + 1;
            v17 |= (unint64_t)(v19 & 0x7F) << v15;
            if ((v19 & 0x80) == 0) {
              goto LABEL_87;
            }
            v15 += 7;
            BOOL v12 = v16++ >= 9;
            if (v12)
            {
              uint64_t v17 = 0LL;
              goto LABEL_89;
            }
          }

          *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_87:
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v17 = 0LL;
          }
LABEL_89:
          uint64_t v61 = *((int *)v6 + 942);
          goto LABEL_110;
        case 2u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v17 = 0LL;
          self->PBCodable_opaque[*((int *)v5 + 941)] |= 4u;
          while (2)
          {
            unint64_t v22 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v22 == -1LL || v22 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v23 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v22);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v22 + 1;
              v17 |= (unint64_t)(v23 & 0x7F) << v20;
              if (v23 < 0)
              {
                v20 += 7;
                BOOL v12 = v21++ >= 9;
                if (v12)
                {
                  uint64_t v17 = 0LL;
                  goto LABEL_93;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v17 = 0LL;
          }
LABEL_93:
          uint64_t v61 = 24LL;
          goto LABEL_110;
        case 3u:
          v24 = v5;
          v25 = v6;
          v26 = objc_alloc_init(&OBJC_CLASS___OTEscrowRecordMetadata);
          objc_storeStrong((id *)&self->_escrowInformationMetadata, v26);
          v64[0] = 0xAAAAAAAAAAAAAAAALL;
          v64[1] = 0xAAAAAAAAAAAAAAAALL;
          if (!PBReaderPlaceMark(a3, v64) || (sub_1001C30BC((uint64_t)v26, (uint64_t)a3) & 1) == 0)
          {

            LOBYTE(v30) = 0;
            return v30;
          }

          PBReaderRecallMark(a3, v64);

          v6 = v25;
          v5 = v24;
LABEL_120:
          if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                    + OBJC_IVAR___PBDataReader__length))
            goto LABEL_121;
          break;
        case 4u:
          uint64_t String = PBReaderReadString(a3);
          uint64_t v28 = objc_claimAutoreleasedReturnValue(String);
          uint64_t v29 = 64LL;
          goto LABEL_85;
        case 9u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v17 = 0LL;
          self->PBCodable_opaque[*((int *)v5 + 941)] |= 8u;
          while (2)
          {
            unint64_t v33 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v33 == -1LL || v33 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v34 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v33);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v33 + 1;
              v17 |= (unint64_t)(v34 & 0x7F) << v31;
              if (v34 < 0)
              {
                v31 += 7;
                BOOL v12 = v32++ >= 9;
                if (v12)
                {
                  uint64_t v17 = 0LL;
                  goto LABEL_97;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v17 = 0LL;
          }
LABEL_97:
          uint64_t v61 = 32LL;
          goto LABEL_110;
        case 0xAu:
          char v35 = 0;
          unsigned int v36 = 0;
          uint64_t v37 = 0LL;
          self->PBCodable_opaque[*((int *)v5 + 941)] |= 0x10u;
          while (2)
          {
            unint64_t v38 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v38 == -1LL || v38 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v39 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v38);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v38 + 1;
              v37 |= (unint64_t)(v39 & 0x7F) << v35;
              if (v39 < 0)
              {
                v35 += 7;
                BOOL v12 = v36++ >= 9;
                if (v12)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_101;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v37) = 0;
          }
LABEL_101:
          uint64_t v62 = 80LL;
          goto LABEL_119;
        case 0xBu:
          uint64_t v40 = PBReaderReadString(a3);
          uint64_t v28 = objc_claimAutoreleasedReturnValue(v40);
          uint64_t v29 = 72LL;
          goto LABEL_85;
        case 0xCu:
          char v41 = 0;
          unsigned int v42 = 0;
          uint64_t v37 = 0LL;
          self->PBCodable_opaque[*((int *)v5 + 941)] |= 0x40u;
          while (2)
          {
            unint64_t v43 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v43 == -1LL || v43 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v44 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v43);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v43 + 1;
              v37 |= (unint64_t)(v44 & 0x7F) << v41;
              if (v44 < 0)
              {
                v41 += 7;
                BOOL v12 = v42++ >= 9;
                if (v12)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_105;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v37) = 0;
          }
LABEL_105:
          uint64_t v62 = 88LL;
          goto LABEL_119;
        case 0xDu:
          char v45 = 0;
          unsigned int v46 = 0;
          uint64_t v17 = 0LL;
          self->PBCodable_opaque[*((int *)v5 + 941)] |= 1u;
          while (2)
          {
            unint64_t v47 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v47 == -1LL || v47 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v48 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v47);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v47 + 1;
              v17 |= (unint64_t)(v48 & 0x7F) << v45;
              if (v48 < 0)
              {
                v45 += 7;
                BOOL v12 = v46++ >= 9;
                if (v12)
                {
                  uint64_t v17 = 0LL;
                  goto LABEL_109;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v17 = 0LL;
          }
LABEL_109:
          uint64_t v61 = 8LL;
LABEL_110:
          *(void *)&self->PBCodable_opaque[v61] = v17;
          goto LABEL_120;
        case 0xEu:
          uint64_t v49 = PBReaderReadString(a3);
          uint64_t v28 = objc_claimAutoreleasedReturnValue(v49);
          uint64_t v29 = 96LL;
          goto LABEL_85;
        case 0xFu:
          char v50 = 0;
          unsigned int v51 = 0;
          uint64_t v37 = 0LL;
          self->PBCodable_opaque[*((int *)v5 + 941)] |= 0x20u;
          while (2)
          {
            unint64_t v52 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v52 == -1LL || v52 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v53 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v52);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v52 + 1;
              v37 |= (unint64_t)(v53 & 0x7F) << v50;
              if (v53 < 0)
              {
                v50 += 7;
                BOOL v12 = v51++ >= 9;
                if (v12)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_114;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v37) = 0;
          }
LABEL_114:
          uint64_t v62 = 84LL;
          goto LABEL_119;
        case 0x10u:
          char v54 = 0;
          unsigned int v55 = 0;
          uint64_t v37 = 0LL;
          self->PBCodable_opaque[*((int *)v5 + 941)] |= 0x80u;
          while (2)
          {
            unint64_t v56 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v56 == -1LL || v56 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v57 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v56);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v56 + 1;
              v37 |= (unint64_t)(v57 & 0x7F) << v54;
              if (v57 < 0)
              {
                v54 += 7;
                BOOL v12 = v55++ >= 9;
                if (v12)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_118;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v37) = 0;
          }
LABEL_118:
          uint64_t v62 = 104LL;
LABEL_119:
          *(_DWORD *)&self->PBCodable_opaque[v62] = v37;
          goto LABEL_120;
        case 0x11u:
          uint64_t v58 = PBReaderReadString(a3);
          uint64_t v28 = objc_claimAutoreleasedReturnValue(v58);
          uint64_t v29 = 56LL;
          goto LABEL_85;
        case 0x12u:
          uint64_t v59 = PBReaderReadString(a3);
          uint64_t v28 = objc_claimAutoreleasedReturnValue(v59);
          uint64_t v29 = 48LL;
LABEL_85:
          v60 = *(void **)&self->PBCodable_opaque[v29];
          *(void *)&self->PBCodable_opaque[v29] = v28;

          goto LABEL_120;
        default:
          int v30 = PBReaderSkipValueWithTag(a3);
          if (!v30) {
            return v30;
          }
          goto LABEL_120;
      }
    }
  }

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v15 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_creationDate, 1LL);
    id v4 = v15;
    char has = (char)self->_has;
  }

  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field(v15, self->_remainingAttempts, 2LL);
    id v4 = v15;
  }

  escrowInformationMetadata = self->_escrowInformationMetadata;
  if (escrowInformationMetadata)
  {
    PBDataWriterWriteSubmessage(v15, escrowInformationMetadata, 3LL);
    id v4 = v15;
  }

  label = self->_label;
  if (label)
  {
    PBDataWriterWriteStringField(v15, label, 4LL);
    id v4 = v15;
  }

  char v8 = (char)self->_has;
  if ((v8 & 8) != 0)
  {
    PBDataWriterWriteUint64Field(v15, self->_silentAttemptAllowed, 9LL);
    id v4 = v15;
    char v8 = (char)self->_has;
  }

  if ((v8 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field(v15, self->_recordStatus, 10LL);
    id v4 = v15;
  }

  recordId = self->_recordId;
  if (recordId)
  {
    PBDataWriterWriteStringField(v15, recordId, 11LL);
    id v4 = v15;
  }

  char v10 = (char)self->_has;
  if ((v10 & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field(v15, self->_recoveryStatus, 12LL);
    id v4 = v15;
    char v10 = (char)self->_has;
  }

  if ((v10 & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v15, self->_coolOffEnd, 13LL);
    id v4 = v15;
  }

  serialNumber = self->_serialNumber;
  if (serialNumber)
  {
    PBDataWriterWriteStringField(v15, serialNumber, 14LL);
    id v4 = v15;
  }

  char v12 = (char)self->_has;
  if ((v12 & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field(v15, self->_recordViability, 15LL);
    id v4 = v15;
    char v12 = (char)self->_has;
  }

  if (v12 < 0)
  {
    PBDataWriterWriteInt32Field(v15, self->_viabilityStatus, 16LL);
    id v4 = v15;
  }

  federationId = self->_federationId;
  if (federationId)
  {
    PBDataWriterWriteStringField(v15, federationId, 17LL);
    id v4 = v15;
  }

  expectedFederationId = self->_expectedFederationId;
  if (expectedFederationId)
  {
    PBDataWriterWriteStringField(v15, expectedFederationId, 18LL);
    id v4 = v15;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_creationDate;
    *((_BYTE *)v4 + 108) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 4) != 0)
  {
    v4[3] = self->_remainingAttempts;
    *((_BYTE *)v4 + 108) |= 4u;
  }

  unint64_t v9 = v4;
  if (self->_escrowInformationMetadata)
  {
    objc_msgSend(v4, "setEscrowInformationMetadata:");
    id v4 = v9;
  }

  if (self->_label)
  {
    objc_msgSend(v9, "setLabel:");
    id v4 = v9;
  }

  char v6 = (char)self->_has;
  if ((v6 & 8) != 0)
  {
    v4[4] = self->_silentAttemptAllowed;
    *((_BYTE *)v4 + 108) |= 8u;
    char v6 = (char)self->_has;
  }

  if ((v6 & 0x10) != 0)
  {
    *((_DWORD *)v4 + 20) = self->_recordStatus;
    *((_BYTE *)v4 + 108) |= 0x10u;
  }

  if (self->_recordId)
  {
    objc_msgSend(v9, "setRecordId:");
    id v4 = v9;
  }

  char v7 = (char)self->_has;
  if ((v7 & 0x40) != 0)
  {
    *((_DWORD *)v4 + 22) = self->_recoveryStatus;
    *((_BYTE *)v4 + 108) |= 0x40u;
    char v7 = (char)self->_has;
  }

  if ((v7 & 1) != 0)
  {
    v4[1] = self->_coolOffEnd;
    *((_BYTE *)v4 + 108) |= 1u;
  }

  if (self->_serialNumber)
  {
    objc_msgSend(v9, "setSerialNumber:");
    id v4 = v9;
  }

  char v8 = (char)self->_has;
  if ((v8 & 0x20) != 0)
  {
    *((_DWORD *)v4 + 21) = self->_recordViability;
    *((_BYTE *)v4 + 108) |= 0x20u;
    char v8 = (char)self->_has;
  }

  if (v8 < 0)
  {
    *((_DWORD *)v4 + 26) = self->_viabilityStatus;
    *((_BYTE *)v4 + 108) |= 0x80u;
  }

  if (self->_federationId)
  {
    objc_msgSend(v9, "setFederationId:");
    id v4 = v9;
  }

  if (self->_expectedFederationId)
  {
    objc_msgSend(v9, "setExpectedFederationId:");
    id v4 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  char v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[2] = self->_creationDate;
    *((_BYTE *)v5 + 108) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 4) != 0)
  {
    v5[3] = self->_remainingAttempts;
    *((_BYTE *)v5 + 108) |= 4u;
  }

  id v8 = -[OTEscrowRecordMetadata copyWithZone:](self->_escrowInformationMetadata, "copyWithZone:", a3);
  unint64_t v9 = (void *)v6[5];
  v6[5] = v8;

  id v10 = -[NSString copyWithZone:](self->_label, "copyWithZone:", a3);
  char v11 = (void *)v6[8];
  v6[8] = v10;

  char v12 = (char)self->_has;
  if ((v12 & 8) != 0)
  {
    v6[4] = self->_silentAttemptAllowed;
    *((_BYTE *)v6 + 108) |= 8u;
    char v12 = (char)self->_has;
  }

  if ((v12 & 0x10) != 0)
  {
    *((_DWORD *)v6 + 20) = self->_recordStatus;
    *((_BYTE *)v6 + 108) |= 0x10u;
  }

  id v13 = -[NSString copyWithZone:](self->_recordId, "copyWithZone:", a3);
  v14 = (void *)v6[9];
  v6[9] = v13;

  char v15 = (char)self->_has;
  if ((v15 & 0x40) != 0)
  {
    *((_DWORD *)v6 + 22) = self->_recoveryStatus;
    *((_BYTE *)v6 + 108) |= 0x40u;
    char v15 = (char)self->_has;
  }

  if ((v15 & 1) != 0)
  {
    v6[1] = self->_coolOffEnd;
    *((_BYTE *)v6 + 108) |= 1u;
  }

  id v16 = -[NSString copyWithZone:](self->_serialNumber, "copyWithZone:", a3);
  uint64_t v17 = (void *)v6[12];
  v6[12] = v16;

  char v18 = (char)self->_has;
  if ((v18 & 0x20) != 0)
  {
    *((_DWORD *)v6 + 21) = self->_recordViability;
    *((_BYTE *)v6 + 108) |= 0x20u;
    char v18 = (char)self->_has;
  }

  if (v18 < 0)
  {
    *((_DWORD *)v6 + 26) = self->_viabilityStatus;
    *((_BYTE *)v6 + 108) |= 0x80u;
  }

  id v19 = -[NSString copyWithZone:](self->_federationId, "copyWithZone:", a3);
  char v20 = (void *)v6[7];
  v6[7] = v19;

  id v21 = -[NSString copyWithZone:](self->_expectedFederationId, "copyWithZone:", a3);
  unint64_t v22 = (void *)v6[6];
  v6[6] = v21;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 2) == 0 || self->_creationDate != *((void *)v4 + 2)) {
      goto LABEL_55;
    }
  }

  else if ((*((_BYTE *)v4 + 108) & 2) != 0)
  {
    goto LABEL_55;
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 4) == 0 || self->_remainingAttempts != *((void *)v4 + 3)) {
      goto LABEL_55;
    }
  }

  else if ((*((_BYTE *)v4 + 108) & 4) != 0)
  {
    goto LABEL_55;
  }

  escrowInformationMetadata = self->_escrowInformationMetadata;
  if ((unint64_t)escrowInformationMetadata | *((void *)v4 + 5)
    && !-[OTEscrowRecordMetadata isEqual:](escrowInformationMetadata, "isEqual:"))
  {
    goto LABEL_55;
  }

  label = self->_label;
  if ((unint64_t)label | *((void *)v4 + 8))
  {
  }

  char has = (char)self->_has;
  char v8 = *((_BYTE *)v4 + 108);
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 8) == 0 || self->_silentAttemptAllowed != *((void *)v4 + 4)) {
      goto LABEL_55;
    }
  }

  else if ((*((_BYTE *)v4 + 108) & 8) != 0)
  {
    goto LABEL_55;
  }

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 0x10) == 0 || self->_recordStatus != *((_DWORD *)v4 + 20)) {
      goto LABEL_55;
    }
  }

  else if ((*((_BYTE *)v4 + 108) & 0x10) != 0)
  {
    goto LABEL_55;
  }

  recordId = self->_recordId;
  if ((unint64_t)recordId | *((void *)v4 + 9))
  {
    char has = (char)self->_has;
    char v8 = *((_BYTE *)v4 + 108);
  }

  if ((has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_recoveryStatus != *((_DWORD *)v4 + 22)) {
      goto LABEL_55;
    }
  }

  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_55;
  }

  if ((has & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_coolOffEnd != *((void *)v4 + 1)) {
      goto LABEL_55;
    }
  }

  else if ((v8 & 1) != 0)
  {
    goto LABEL_55;
  }

  serialNumber = self->_serialNumber;
  if ((unint64_t)serialNumber | *((void *)v4 + 12))
  {
    char has = (char)self->_has;
    char v8 = *((_BYTE *)v4 + 108);
  }

  if ((has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_recordViability != *((_DWORD *)v4 + 21)) {
      goto LABEL_55;
    }
  }

  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_55;
  }

  if ((has & 0x80) == 0)
  {
    if ((v8 & 0x80) == 0) {
      goto LABEL_49;
    }
LABEL_55:
    unsigned __int8 v13 = 0;
    goto LABEL_56;
  }

  if ((v8 & 0x80) == 0 || self->_viabilityStatus != *((_DWORD *)v4 + 26)) {
    goto LABEL_55;
  }
LABEL_49:
  federationId = self->_federationId;
  if ((unint64_t)federationId | *((void *)v4 + 7)
    && !-[NSString isEqual:](federationId, "isEqual:"))
  {
    goto LABEL_55;
  }

  expectedFederationId = self->_expectedFederationId;
  else {
    unsigned __int8 v13 = 1;
  }
LABEL_56:

  return v13;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    unint64_t v3 = 2654435761u * self->_creationDate;
  }
  else {
    unint64_t v3 = 0LL;
  }
  unint64_t v20 = v3;
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    unint64_t v4 = 2654435761u * self->_remainingAttempts;
  }
  else {
    unint64_t v4 = 0LL;
  }
  unint64_t v5 = -[OTEscrowRecordMetadata hash](self->_escrowInformationMetadata, "hash");
  NSUInteger v6 = -[NSString hash](self->_label, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0) {
    unint64_t v7 = 2654435761u * self->_silentAttemptAllowed;
  }
  else {
    unint64_t v7 = 0LL;
  }
  NSUInteger v8 = v6;
  if ((*(_BYTE *)&self->_has & 0x10) != 0) {
    uint64_t v9 = 2654435761LL * self->_recordStatus;
  }
  else {
    uint64_t v9 = 0LL;
  }
  NSUInteger v10 = -[NSString hash](self->_recordId, "hash");
  if ((*(_BYTE *)&self->_has & 0x40) != 0) {
    uint64_t v11 = 2654435761LL * self->_recoveryStatus;
  }
  else {
    uint64_t v11 = 0LL;
  }
  NSUInteger v12 = v10;
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    unint64_t v13 = 2654435761u * self->_coolOffEnd;
  }
  else {
    unint64_t v13 = 0LL;
  }
  NSUInteger v14 = -[NSString hash](self->_serialNumber, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0) {
    uint64_t v15 = 2654435761LL * self->_recordViability;
  }
  else {
    uint64_t v15 = 0LL;
  }
  if ((*(_BYTE *)&self->_has & 0x80) != 0) {
    uint64_t v16 = 2654435761LL * self->_viabilityStatus;
  }
  else {
    uint64_t v16 = 0LL;
  }
  unint64_t v17 = v4 ^ v20 ^ v5 ^ v8 ^ v7 ^ v9 ^ v12 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16;
  NSUInteger v18 = -[NSString hash](self->_federationId, "hash");
  return v17 ^ v18 ^ -[NSString hash](self->_expectedFederationId, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (unint64_t *)a3;
  unint64_t v5 = v4;
  char v6 = *((_BYTE *)v4 + 108);
  if ((v6 & 2) != 0)
  {
    self->_creationDate = v4[2];
    *(_BYTE *)&self->_has |= 2u;
    char v6 = *((_BYTE *)v4 + 108);
  }

  if ((v6 & 4) != 0)
  {
    self->_remainingAttempts = v4[3];
    *(_BYTE *)&self->_has |= 4u;
  }

  escrowInformationMetadata = self->_escrowInformationMetadata;
  unint64_t v8 = v5[5];
  NSUInteger v12 = v5;
  if (escrowInformationMetadata)
  {
    if (!v8) {
      goto LABEL_11;
    }
    -[OTEscrowRecordMetadata mergeFrom:](escrowInformationMetadata, "mergeFrom:");
  }

  else
  {
    if (!v8) {
      goto LABEL_11;
    }
    -[OTEscrowRecord setEscrowInformationMetadata:](self, "setEscrowInformationMetadata:");
  }

  unint64_t v5 = v12;
LABEL_11:
  if (v5[8])
  {
    -[OTEscrowRecord setLabel:](self, "setLabel:");
    unint64_t v5 = v12;
  }

  char v9 = *((_BYTE *)v5 + 108);
  if ((v9 & 8) != 0)
  {
    self->_silentAttemptAllowed = v5[4];
    *(_BYTE *)&self->_has |= 8u;
    char v9 = *((_BYTE *)v5 + 108);
  }

  if ((v9 & 0x10) != 0)
  {
    self->_int recordStatus = *((_DWORD *)v5 + 20);
    *(_BYTE *)&self->_has |= 0x10u;
  }

  if (v5[9])
  {
    -[OTEscrowRecord setRecordId:](self, "setRecordId:");
    unint64_t v5 = v12;
  }

  char v10 = *((_BYTE *)v5 + 108);
  if ((v10 & 0x40) != 0)
  {
    self->_uint64_t recoveryStatus = *((_DWORD *)v5 + 22);
    *(_BYTE *)&self->_has |= 0x40u;
    char v10 = *((_BYTE *)v5 + 108);
  }

  if ((v10 & 1) != 0)
  {
    self->_coolOffEnd = v5[1];
    *(_BYTE *)&self->_has |= 1u;
  }

  if (v5[12])
  {
    -[OTEscrowRecord setSerialNumber:](self, "setSerialNumber:");
    unint64_t v5 = v12;
  }

  char v11 = *((_BYTE *)v5 + 108);
  if ((v11 & 0x20) != 0)
  {
    self->_uint64_t recordViability = *((_DWORD *)v5 + 21);
    *(_BYTE *)&self->_has |= 0x20u;
    char v11 = *((_BYTE *)v5 + 108);
  }

  if (v11 < 0)
  {
    self->_uint64_t viabilityStatus = *((_DWORD *)v5 + 26);
    *(_BYTE *)&self->_has |= 0x80u;
  }

  if (v5[7])
  {
    -[OTEscrowRecord setFederationId:](self, "setFederationId:");
    unint64_t v5 = v12;
  }

  if (v5[6])
  {
    -[OTEscrowRecord setExpectedFederationId:](self, "setExpectedFederationId:");
    unint64_t v5 = v12;
  }
}

- (unint64_t)creationDate
{
  return self->_creationDate;
}

- (unint64_t)remainingAttempts
{
  return self->_remainingAttempts;
}

- (OTEscrowRecordMetadata)escrowInformationMetadata
{
  return self->_escrowInformationMetadata;
}

- (void)setEscrowInformationMetadata:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (unint64_t)silentAttemptAllowed
{
  return self->_silentAttemptAllowed;
}

- (NSString)recordId
{
  return self->_recordId;
}

- (void)setRecordId:(id)a3
{
}

- (unint64_t)coolOffEnd
{
  return self->_coolOffEnd;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)federationId
{
  return self->_federationId;
}

- (void)setFederationId:(id)a3
{
}

- (NSString)expectedFederationId
{
  return self->_expectedFederationId;
}

- (void)setExpectedFederationId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
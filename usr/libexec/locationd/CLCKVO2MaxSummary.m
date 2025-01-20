@interface CLCKVO2MaxSummary
- (BOOL)hasCadenceMean;
- (BOOL)hasDurationInSeconds;
- (BOOL)hasGradeMean;
- (BOOL)hasGradeVariance;
- (BOOL)hasHrCadenceAgreementMean;
- (BOOL)hasHrCadenceAgreementVariance;
- (BOOL)hasHrConfidenceMean;
- (BOOL)hasHrConfidenceVariance;
- (BOOL)hasHrMax;
- (BOOL)hasHrMean;
- (BOOL)hasHrMin;
- (BOOL)hasHrVariance;
- (BOOL)hasPointCount;
- (BOOL)hasSessionType;
- (BOOL)hasSpeedMean;
- (BOOL)hasSpeedVariance;
- (BOOL)hasStartTime;
- (BOOL)hasVo2MaxModelSource;
- (BOOL)hasVo2Mean;
- (BOOL)hasVo2Variance;
- (BOOL)hasWorkoutType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)cadenceMean;
- (double)durationInSeconds;
- (double)gradeMean;
- (double)gradeVariance;
- (double)hrCadenceAgreementMean;
- (double)hrCadenceAgreementVariance;
- (double)hrConfidenceMean;
- (double)hrConfidenceVariance;
- (double)hrMax;
- (double)hrMean;
- (double)hrMin;
- (double)hrVariance;
- (double)speedMean;
- (double)speedVariance;
- (double)startTime;
- (double)vo2Mean;
- (double)vo2Variance;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)sessionType;
- (int)vo2MaxModelSource;
- (int)workoutType;
- (unint64_t)hash;
- (unint64_t)pointCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCadenceMean:(double)a3;
- (void)setDurationInSeconds:(double)a3;
- (void)setGradeMean:(double)a3;
- (void)setGradeVariance:(double)a3;
- (void)setHasCadenceMean:(BOOL)a3;
- (void)setHasDurationInSeconds:(BOOL)a3;
- (void)setHasGradeMean:(BOOL)a3;
- (void)setHasGradeVariance:(BOOL)a3;
- (void)setHasHrCadenceAgreementMean:(BOOL)a3;
- (void)setHasHrCadenceAgreementVariance:(BOOL)a3;
- (void)setHasHrConfidenceMean:(BOOL)a3;
- (void)setHasHrConfidenceVariance:(BOOL)a3;
- (void)setHasHrMax:(BOOL)a3;
- (void)setHasHrMean:(BOOL)a3;
- (void)setHasHrMin:(BOOL)a3;
- (void)setHasHrVariance:(BOOL)a3;
- (void)setHasPointCount:(BOOL)a3;
- (void)setHasSessionType:(BOOL)a3;
- (void)setHasSpeedMean:(BOOL)a3;
- (void)setHasSpeedVariance:(BOOL)a3;
- (void)setHasStartTime:(BOOL)a3;
- (void)setHasVo2MaxModelSource:(BOOL)a3;
- (void)setHasVo2Mean:(BOOL)a3;
- (void)setHasVo2Variance:(BOOL)a3;
- (void)setHasWorkoutType:(BOOL)a3;
- (void)setHrCadenceAgreementMean:(double)a3;
- (void)setHrCadenceAgreementVariance:(double)a3;
- (void)setHrConfidenceMean:(double)a3;
- (void)setHrConfidenceVariance:(double)a3;
- (void)setHrMax:(double)a3;
- (void)setHrMean:(double)a3;
- (void)setHrMin:(double)a3;
- (void)setHrVariance:(double)a3;
- (void)setPointCount:(unint64_t)a3;
- (void)setSessionType:(int)a3;
- (void)setSpeedMean:(double)a3;
- (void)setSpeedVariance:(double)a3;
- (void)setStartTime:(double)a3;
- (void)setVo2MaxModelSource:(int)a3;
- (void)setVo2Mean:(double)a3;
- (void)setVo2Variance:(double)a3;
- (void)setWorkoutType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLCKVO2MaxSummary

- (void)setStartTime:(double)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasStartTime
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setWorkoutType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_workoutType = a3;
}

- (void)setHasWorkoutType:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasWorkoutType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setDurationInSeconds:(double)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_durationInSeconds = a3;
}

- (void)setHasDurationInSeconds:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasDurationInSeconds
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setPointCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_pointCount = a3;
}

- (void)setHasPointCount:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasPointCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setHrMin:(double)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_hrMin = a3;
}

- (void)setHasHrMin:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasHrMin
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setHrMax:(double)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_hrMax = a3;
}

- (void)setHasHrMax:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasHrMax
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setHrMean:(double)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_hrMean = a3;
}

- (void)setHasHrMean:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasHrMean
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setHrConfidenceMean:(double)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_hrConfidenceMean = a3;
}

- (void)setHasHrConfidenceMean:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasHrConfidenceMean
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHrCadenceAgreementMean:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_hrCadenceAgreementMean = a3;
}

- (void)setHasHrCadenceAgreementMean:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasHrCadenceAgreementMean
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setVo2Mean:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_vo2Mean = a3;
}

- (void)setHasVo2Mean:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasVo2Mean
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setSpeedMean:(double)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_speedMean = a3;
}

- (void)setHasSpeedMean:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasSpeedMean
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setGradeMean:(double)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_gradeMean = a3;
}

- (void)setHasGradeMean:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasGradeMean
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setCadenceMean:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_cadenceMean = a3;
}

- (void)setHasCadenceMean:(BOOL)a3
{
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasCadenceMean
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHrVariance:(double)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_hrVariance = a3;
}

- (void)setHasHrVariance:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasHrVariance
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setHrConfidenceVariance:(double)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_hrConfidenceVariance = a3;
}

- (void)setHasHrConfidenceVariance:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasHrConfidenceVariance
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setHrCadenceAgreementVariance:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_hrCadenceAgreementVariance = a3;
}

- (void)setHasHrCadenceAgreementVariance:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasHrCadenceAgreementVariance
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setVo2Variance:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_vo2Variance = a3;
}

- (void)setHasVo2Variance:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasVo2Variance
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setSpeedVariance:(double)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_speedVariance = a3;
}

- (void)setHasSpeedVariance:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasSpeedVariance
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setGradeVariance:(double)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_gradeVariance = a3;
}

- (void)setHasGradeVariance:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasGradeVariance
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setVo2MaxModelSource:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_vo2MaxModelSource = a3;
}

- (void)setHasVo2MaxModelSource:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasVo2MaxModelSource
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setSessionType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_sessionType = a3;
}

- (void)setHasSessionType:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasSessionType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLCKVO2MaxSummary;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[CLCKVO2MaxSummary description](&v3, "description"),  -[CLCKVO2MaxSummary dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_startTime),  @"startTime");
    $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
    if ((*(_DWORD *)&has & 0x100000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }

  else if ((*(_DWORD *)&has & 0x100000) == 0)
  {
    goto LABEL_3;
  }

  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_workoutType),  @"workoutType");
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }

- (BOOL)readFrom:(id)a3
{
  return sub_100B636A4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    PBDataWriterWriteDoubleField(a3, 1LL, self->_startTime);
    $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
    if ((*(_DWORD *)&has & 0x100000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }

  else if ((*(_DWORD *)&has & 0x100000) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteInt32Field(a3, self->_workoutType, 2LL);
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_26;
  }

- (void)copyTo:(id)a3
{
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    *((void *)a3 + 16) = *(void *)&self->_startTime;
    *((_DWORD *)a3 + 41) |= 0x8000u;
    $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
    if ((*(_DWORD *)&has & 0x100000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }

  else if ((*(_DWORD *)&has & 0x100000) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)a3 + 40) = self->_workoutType;
  *((_DWORD *)a3 + 41) |= 0x100000u;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_26;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  id result = objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "init");
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    *((void *)result + 16) = *(void *)&self->_startTime;
    *((_DWORD *)result + 41) |= 0x8000u;
    $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
    if ((*(_DWORD *)&has & 0x100000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }

  else if ((*(_DWORD *)&has & 0x100000) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)result + 40) = self->_workoutType;
  *((_DWORD *)result + 41) |= 0x100000u;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }

- (BOOL)isEqual:(id)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  unsigned int v7 = objc_msgSend(a3, "isMemberOfClass:", v6, v5);
  if (v7)
  {
    $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
    int v9 = *((_DWORD *)a3 + 41);
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
    }

    else if ((v9 & 0x8000) != 0)
    {
LABEL_106:
      LOBYTE(v7) = 0;
      return v7;
    }

    if ((*(_DWORD *)&has & 0x100000) != 0)
    {
      if ((v9 & 0x100000) == 0 || self->_workoutType != *((_DWORD *)a3 + 40)) {
        goto LABEL_106;
      }
    }

    else if ((v9 & 0x100000) != 0)
    {
      goto LABEL_106;
    }

    if ((*(_BYTE *)&has & 2) != 0)
    {
    }

    else if ((v9 & 2) != 0)
    {
      goto LABEL_106;
    }

    if ((*(_WORD *)&has & 0x1000) != 0)
    {
    }

    else if ((v9 & 0x1000) != 0)
    {
      goto LABEL_106;
    }

    if ((*(_WORD *)&has & 0x400) != 0)
    {
    }

    else if ((v9 & 0x400) != 0)
    {
      goto LABEL_106;
    }

    if ((*(_WORD *)&has & 0x100) != 0)
    {
    }

    else if ((v9 & 0x100) != 0)
    {
      goto LABEL_106;
    }

    if ((*(_WORD *)&has & 0x200) != 0)
    {
    }

    else if ((v9 & 0x200) != 0)
    {
      goto LABEL_106;
    }

    if ((*(_BYTE *)&has & 0x40) != 0)
    {
    }

    else if ((v9 & 0x40) != 0)
    {
      goto LABEL_106;
    }

    if ((*(_BYTE *)&has & 0x10) != 0)
    {
    }

    else if ((v9 & 0x10) != 0)
    {
      goto LABEL_106;
    }

    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
    }

    else if ((v9 & 0x10000) != 0)
    {
      goto LABEL_106;
    }

    if ((*(_WORD *)&has & 0x2000) != 0)
    {
    }

    else if ((v9 & 0x2000) != 0)
    {
      goto LABEL_106;
    }

    if ((*(_BYTE *)&has & 4) != 0)
    {
    }

    else if ((v9 & 4) != 0)
    {
      goto LABEL_106;
    }

    if ((*(_BYTE *)&has & 1) != 0)
    {
    }

    else if ((v9 & 1) != 0)
    {
      goto LABEL_106;
    }

    if ((*(_WORD *)&has & 0x800) != 0)
    {
    }

    else if ((v9 & 0x800) != 0)
    {
      goto LABEL_106;
    }

    if ((*(_BYTE *)&has & 0x80) != 0)
    {
    }

    else if ((v9 & 0x80) != 0)
    {
      goto LABEL_106;
    }

    if ((*(_BYTE *)&has & 0x20) != 0)
    {
    }

    else if ((v9 & 0x20) != 0)
    {
      goto LABEL_106;
    }

    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
    }

    else if ((v9 & 0x20000) != 0)
    {
      goto LABEL_106;
    }

    if ((*(_WORD *)&has & 0x4000) != 0)
    {
    }

    else if ((v9 & 0x4000) != 0)
    {
      goto LABEL_106;
    }

    if ((*(_BYTE *)&has & 8) != 0)
    {
    }

    else if ((v9 & 8) != 0)
    {
      goto LABEL_106;
    }

    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
      if ((v9 & 0x80000) == 0 || self->_vo2MaxModelSource != *((_DWORD *)a3 + 39)) {
        goto LABEL_106;
      }
    }

    else if ((v9 & 0x80000) != 0)
    {
      goto LABEL_106;
    }

    LOBYTE(v7) = (v9 & 0x40000) == 0;
    if ((*(_DWORD *)&has & 0x40000) != 0)
    {
      if ((v9 & 0x40000) == 0 || self->_sessionType != *((_DWORD *)a3 + 38)) {
        goto LABEL_106;
      }
      LOBYTE(v7) = 1;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    double startTime = self->_startTime;
    double v6 = -startTime;
    if (startTime >= 0.0) {
      double v6 = self->_startTime;
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

  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    uint64_t v104 = 2654435761LL * self->_workoutType;
    if ((*(_BYTE *)&has & 2) != 0) {
      goto LABEL_11;
    }
LABEL_16:
    unint64_t v13 = 0LL;
    goto LABEL_19;
  }

  uint64_t v104 = 0LL;
  if ((*(_BYTE *)&has & 2) == 0) {
    goto LABEL_16;
  }
LABEL_11:
  double durationInSeconds = self->_durationInSeconds;
  double v10 = -durationInSeconds;
  if (durationInSeconds >= 0.0) {
    double v10 = self->_durationInSeconds;
  }
  double v11 = floor(v10 + 0.5);
  double v12 = (v10 - v11) * 1.84467441e19;
  unint64_t v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0) {
      v13 += (unint64_t)v12;
    }
  }

  else
  {
    v13 -= (unint64_t)fabs(v12);
  }

- (void)mergeFrom:(id)a3
{
  int v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 0x8000) != 0)
  {
    self->_double startTime = *((double *)a3 + 16);
    *(_DWORD *)&self->_has |= 0x8000u;
    int v3 = *((_DWORD *)a3 + 41);
    if ((v3 & 0x100000) == 0)
    {
LABEL_3:
      if ((v3 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }

  else if ((v3 & 0x100000) == 0)
  {
    goto LABEL_3;
  }

  self->_workoutType = *((_DWORD *)a3 + 40);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 2) == 0)
  {
LABEL_4:
    if ((v3 & 0x1000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_26;
  }

- (double)startTime
{
  return self->_startTime;
}

- (int)workoutType
{
  return self->_workoutType;
}

- (double)durationInSeconds
{
  return self->_durationInSeconds;
}

- (unint64_t)pointCount
{
  return self->_pointCount;
}

- (double)hrMin
{
  return self->_hrMin;
}

- (double)hrMax
{
  return self->_hrMax;
}

- (double)hrMean
{
  return self->_hrMean;
}

- (double)hrConfidenceMean
{
  return self->_hrConfidenceMean;
}

- (double)hrCadenceAgreementMean
{
  return self->_hrCadenceAgreementMean;
}

- (double)vo2Mean
{
  return self->_vo2Mean;
}

- (double)speedMean
{
  return self->_speedMean;
}

- (double)gradeMean
{
  return self->_gradeMean;
}

- (double)cadenceMean
{
  return self->_cadenceMean;
}

- (double)hrVariance
{
  return self->_hrVariance;
}

- (double)hrConfidenceVariance
{
  return self->_hrConfidenceVariance;
}

- (double)hrCadenceAgreementVariance
{
  return self->_hrCadenceAgreementVariance;
}

- (double)vo2Variance
{
  return self->_vo2Variance;
}

- (double)speedVariance
{
  return self->_speedVariance;
}

- (double)gradeVariance
{
  return self->_gradeVariance;
}

- (int)vo2MaxModelSource
{
  return self->_vo2MaxModelSource;
}

- (int)sessionType
{
  return self->_sessionType;
}

@end
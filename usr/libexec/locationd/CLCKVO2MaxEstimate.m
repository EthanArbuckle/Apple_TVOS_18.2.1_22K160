@interface CLCKVO2MaxEstimate
- (BOOL)eligibleForCalorimetry;
- (BOOL)eligibleForHealthKit;
- (BOOL)hasDurationInSeconds;
- (BOOL)hasEligibleForCalorimetry;
- (BOOL)hasEligibleForHealthKit;
- (BOOL)hasEstimatedHRRecoveryParam;
- (BOOL)hasEstimatedHRResponseParam;
- (BOOL)hasEstimatedVo2Max;
- (BOOL)hasFilteredVo2Max;
- (BOOL)hasHrMax;
- (BOOL)hasHrMin;
- (BOOL)hasNumWorkoutsContrToEstimate;
- (BOOL)hasSessionType;
- (BOOL)hasSessionVo2Max;
- (BOOL)hasStartTime;
- (BOOL)hasVariance;
- (BOOL)hasWorkoutType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)durationInSeconds;
- (double)estimatedHRRecoveryParam;
- (double)estimatedHRResponseParam;
- (double)estimatedVo2Max;
- (double)filteredVo2Max;
- (double)hrMax;
- (double)hrMin;
- (double)sessionVo2Max;
- (double)startTime;
- (double)variance;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)sessionType;
- (int)workoutType;
- (unint64_t)hash;
- (unsigned)numWorkoutsContrToEstimate;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDurationInSeconds:(double)a3;
- (void)setEligibleForCalorimetry:(BOOL)a3;
- (void)setEligibleForHealthKit:(BOOL)a3;
- (void)setEstimatedHRRecoveryParam:(double)a3;
- (void)setEstimatedHRResponseParam:(double)a3;
- (void)setEstimatedVo2Max:(double)a3;
- (void)setFilteredVo2Max:(double)a3;
- (void)setHasDurationInSeconds:(BOOL)a3;
- (void)setHasEligibleForCalorimetry:(BOOL)a3;
- (void)setHasEligibleForHealthKit:(BOOL)a3;
- (void)setHasEstimatedHRRecoveryParam:(BOOL)a3;
- (void)setHasEstimatedHRResponseParam:(BOOL)a3;
- (void)setHasEstimatedVo2Max:(BOOL)a3;
- (void)setHasFilteredVo2Max:(BOOL)a3;
- (void)setHasHrMax:(BOOL)a3;
- (void)setHasHrMin:(BOOL)a3;
- (void)setHasNumWorkoutsContrToEstimate:(BOOL)a3;
- (void)setHasSessionType:(BOOL)a3;
- (void)setHasSessionVo2Max:(BOOL)a3;
- (void)setHasStartTime:(BOOL)a3;
- (void)setHasVariance:(BOOL)a3;
- (void)setHasWorkoutType:(BOOL)a3;
- (void)setHrMax:(double)a3;
- (void)setHrMin:(double)a3;
- (void)setNumWorkoutsContrToEstimate:(unsigned int)a3;
- (void)setSessionType:(int)a3;
- (void)setSessionVo2Max:(double)a3;
- (void)setStartTime:(double)a3;
- (void)setVariance:(double)a3;
- (void)setWorkoutType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLCKVO2MaxEstimate

- (void)setStartTime:(double)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasStartTime
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setEstimatedVo2Max:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_estimatedVo2Max = a3;
}

- (void)setHasEstimatedVo2Max:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasEstimatedVo2Max
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setWorkoutType:(int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_workoutType = a3;
}

- (void)setHasWorkoutType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasWorkoutType
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setDurationInSeconds:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_durationInSeconds = a3;
}

- (void)setHasDurationInSeconds:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasDurationInSeconds
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHrMax:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_hrMax = a3;
}

- (void)setHasHrMax:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasHrMax
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHrMin:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_hrMin = a3;
}

- (void)setHasHrMin:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasHrMin
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setVariance:(double)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_variance = a3;
}

- (void)setHasVariance:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasVariance
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setFilteredVo2Max:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_filteredVo2Max = a3;
}

- (void)setHasFilteredVo2Max:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasFilteredVo2Max
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setSessionType:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_sessionType = a3;
}

- (void)setHasSessionType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasSessionType
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setEligibleForHealthKit:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_eligibleForHealthKit = a3;
}

- (void)setHasEligibleForHealthKit:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasEligibleForHealthKit
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setEligibleForCalorimetry:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_eligibleForCalorimetry = a3;
}

- (void)setHasEligibleForCalorimetry:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasEligibleForCalorimetry
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setNumWorkoutsContrToEstimate:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_numWorkoutsContrToEstimate = a3;
}

- (void)setHasNumWorkoutsContrToEstimate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasNumWorkoutsContrToEstimate
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setEstimatedHRResponseParam:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_estimatedHRResponseParam = a3;
}

- (void)setHasEstimatedHRResponseParam:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasEstimatedHRResponseParam
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setEstimatedHRRecoveryParam:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_estimatedHRRecoveryParam = a3;
}

- (void)setHasEstimatedHRRecoveryParam:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasEstimatedHRRecoveryParam
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setSessionVo2Max:(double)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_sessionVo2Max = a3;
}

- (void)setHasSessionVo2Max:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasSessionVo2Max
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLCKVO2MaxEstimate;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[CLCKVO2MaxEstimate description](&v3, "description"),  -[CLCKVO2MaxEstimate dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_startTime),  @"startTime");
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }

  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }

  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_estimatedVo2Max),  @"estimatedVo2Max");
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }

- (BOOL)readFrom:(id)a3
{
  return sub_100225464((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteDoubleField(a3, 1LL, self->_startTime);
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }

  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteDoubleField(a3, 2LL, self->_estimatedVo2Max);
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((void *)a3 + 9) = *(void *)&self->_startTime;
    *((_WORD *)a3 + 52) |= 0x100u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }

  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }

  *((void *)a3 + 4) = *(void *)&self->_estimatedVo2Max;
  *((_WORD *)a3 + 52) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((void *)result + 9) = *(void *)&self->_startTime;
    *((_WORD *)result + 52) |= 0x100u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }

  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }

  *((void *)result + 4) = *(void *)&self->_estimatedVo2Max;
  *((_WORD *)result + 52) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class(self)];
  if (!v5) {
    return v5;
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)a3 + 52);
  if ((has & 0x100) != 0)
  {
  }

  else if ((*((_WORD *)a3 + 52) & 0x100) != 0)
  {
    goto LABEL_82;
  }

  if ((has & 8) != 0)
  {
  }

  else if ((v7 & 8) != 0)
  {
    goto LABEL_82;
  }

  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)a3 + 52) & 0x1000) == 0 || self->_workoutType != *((_DWORD *)a3 + 24)) {
      goto LABEL_82;
    }
  }

  else if ((*((_WORD *)a3 + 52) & 0x1000) != 0)
  {
    goto LABEL_82;
  }

  if ((has & 1) != 0)
  {
  }

  else if ((v7 & 1) != 0)
  {
    goto LABEL_82;
  }

  if ((has & 0x20) != 0)
  {
  }

  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_82;
  }

  if ((has & 0x40) != 0)
  {
  }

  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_82;
  }

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
  }

  else if ((*((_WORD *)a3 + 52) & 0x200) != 0)
  {
    goto LABEL_82;
  }

  if ((has & 0x10) != 0)
  {
  }

  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_82;
  }

  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)a3 + 52) & 0x800) == 0 || self->_sessionType != *((_DWORD *)a3 + 23)) {
      goto LABEL_82;
    }
  }

  else if ((*((_WORD *)a3 + 52) & 0x800) != 0)
  {
    goto LABEL_82;
  }

  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)a3 + 52) & 0x4000) == 0) {
      goto LABEL_82;
    }
    if (self->_eligibleForHealthKit)
    {
      if (!*((_BYTE *)a3 + 101)) {
        goto LABEL_82;
      }
    }

    else if (*((_BYTE *)a3 + 101))
    {
      goto LABEL_82;
    }
  }

  else if ((*((_WORD *)a3 + 52) & 0x4000) != 0)
  {
    goto LABEL_82;
  }

  if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    if ((*((_WORD *)a3 + 52) & 0x2000) != 0) {
      goto LABEL_82;
    }
    goto LABEL_63;
  }

  if ((*((_WORD *)a3 + 52) & 0x2000) == 0) {
    goto LABEL_82;
  }
  if (self->_eligibleForCalorimetry)
  {
    if (!*((_BYTE *)a3 + 100)) {
      goto LABEL_82;
    }
    goto LABEL_63;
  }

  if (*((_BYTE *)a3 + 100))
  {
LABEL_82:
    LOBYTE(v5) = 0;
    return v5;
  }

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
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

  if ((has & 8) != 0)
  {
    double estimatedVo2Max = self->_estimatedVo2Max;
    double v11 = -estimatedVo2Max;
    if (estimatedVo2Max >= 0.0) {
      double v11 = self->_estimatedVo2Max;
    }
    double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }

    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }

  else
  {
    unint64_t v9 = 0LL;
  }

  if ((has & 0x1000) != 0)
  {
    uint64_t v63 = 2654435761LL * self->_workoutType;
    if ((has & 1) != 0) {
      goto LABEL_19;
    }
LABEL_24:
    unint64_t v18 = 0LL;
    goto LABEL_27;
  }

  uint64_t v63 = 0LL;
  if ((has & 1) == 0) {
    goto LABEL_24;
  }
LABEL_19:
  double durationInSeconds = self->_durationInSeconds;
  double v15 = -durationInSeconds;
  if (durationInSeconds >= 0.0) {
    double v15 = self->_durationInSeconds;
  }
  double v16 = floor(v15 + 0.5);
  double v17 = (v15 - v16) * 1.84467441e19;
  unint64_t v18 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
  if (v17 >= 0.0)
  {
    if (v17 > 0.0) {
      v18 += (unint64_t)v17;
    }
  }

  else
  {
    v18 -= (unint64_t)fabs(v17);
  }

- (void)mergeFrom:(id)a3
{
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x100) != 0)
  {
    self->_double startTime = *((double *)a3 + 9);
    *(_WORD *)&self->_has |= 0x100u;
    __int16 v3 = *((_WORD *)a3 + 52);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }

  else if ((v3 & 8) == 0)
  {
    goto LABEL_3;
  }

  self->_double estimatedVo2Max = *((double *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x1000) == 0)
  {
LABEL_4:
    if ((v3 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }

- (double)startTime
{
  return self->_startTime;
}

- (double)estimatedVo2Max
{
  return self->_estimatedVo2Max;
}

- (int)workoutType
{
  return self->_workoutType;
}

- (double)durationInSeconds
{
  return self->_durationInSeconds;
}

- (double)hrMax
{
  return self->_hrMax;
}

- (double)hrMin
{
  return self->_hrMin;
}

- (double)variance
{
  return self->_variance;
}

- (double)filteredVo2Max
{
  return self->_filteredVo2Max;
}

- (int)sessionType
{
  return self->_sessionType;
}

- (BOOL)eligibleForHealthKit
{
  return self->_eligibleForHealthKit;
}

- (BOOL)eligibleForCalorimetry
{
  return self->_eligibleForCalorimetry;
}

- (unsigned)numWorkoutsContrToEstimate
{
  return self->_numWorkoutsContrToEstimate;
}

- (double)estimatedHRResponseParam
{
  return self->_estimatedHRResponseParam;
}

- (double)estimatedHRRecoveryParam
{
  return self->_estimatedHRRecoveryParam;
}

- (double)sessionVo2Max
{
  return self->_sessionVo2Max;
}

@end
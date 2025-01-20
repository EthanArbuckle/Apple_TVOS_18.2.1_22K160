@interface CLCKVO2MaxCalorimetryInput
- (BOOL)hasCadence;
- (BOOL)hasGPS;
- (BOOL)hasGrade;
- (BOOL)hasGradeType;
- (BOOL)hasHasGPS;
- (BOOL)hasHasStrideCal;
- (BOOL)hasHr;
- (BOOL)hasHrConfidence;
- (BOOL)hasHrTime;
- (BOOL)hasIsStroller;
- (BOOL)hasMetSource;
- (BOOL)hasMets;
- (BOOL)hasPace;
- (BOOL)hasStartTime;
- (BOOL)hasStrideCal;
- (BOOL)hasWorkoutType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStroller;
- (BOOL)readFrom:(id)a3;
- (double)cadence;
- (double)grade;
- (double)hrTime;
- (double)pace;
- (double)startTime;
- (float)hr;
- (float)hrConfidence;
- (float)mets;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)gradeType;
- (int)metSource;
- (int)workoutType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCadence:(double)a3;
- (void)setGrade:(double)a3;
- (void)setGradeType:(int)a3;
- (void)setHasCadence:(BOOL)a3;
- (void)setHasGPS:(BOOL)a3;
- (void)setHasGrade:(BOOL)a3;
- (void)setHasGradeType:(BOOL)a3;
- (void)setHasHasGPS:(BOOL)a3;
- (void)setHasHasStrideCal:(BOOL)a3;
- (void)setHasHr:(BOOL)a3;
- (void)setHasHrConfidence:(BOOL)a3;
- (void)setHasHrTime:(BOOL)a3;
- (void)setHasIsStroller:(BOOL)a3;
- (void)setHasMetSource:(BOOL)a3;
- (void)setHasMets:(BOOL)a3;
- (void)setHasPace:(BOOL)a3;
- (void)setHasStartTime:(BOOL)a3;
- (void)setHasStrideCal:(BOOL)a3;
- (void)setHasWorkoutType:(BOOL)a3;
- (void)setHr:(float)a3;
- (void)setHrConfidence:(float)a3;
- (void)setHrTime:(double)a3;
- (void)setIsStroller:(BOOL)a3;
- (void)setMetSource:(int)a3;
- (void)setMets:(float)a3;
- (void)setPace:(double)a3;
- (void)setStartTime:(double)a3;
- (void)setWorkoutType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLCKVO2MaxCalorimetryInput

- (void)setStartTime:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasStartTime
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setMets:(float)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_mets = a3;
}

- (void)setHasMets:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasMets
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setMetSource:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_metSource = a3;
}

- (void)setHasMetSource:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasMetSource
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHr:(float)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_hr = a3;
}

- (void)setHasHr:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasHr
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHrConfidence:(float)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_hrConfidence = a3;
}

- (void)setHasHrConfidence:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasHrConfidence
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setGradeType:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_gradeType = a3;
}

- (void)setHasGradeType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasGradeType
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setGrade:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_grade = a3;
}

- (void)setHasGrade:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasGrade
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasGPS:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_hasGPS = a3;
}

- (void)setHasHasGPS:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasHasGPS
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasStrideCal:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_hasStrideCal = a3;
}

- (void)setHasHasStrideCal:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasHasStrideCal
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setWorkoutType:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_workoutType = a3;
}

- (void)setHasWorkoutType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasWorkoutType
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setCadence:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_cadence = a3;
}

- (void)setHasCadence:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasCadence
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setPace:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_pace = a3;
}

- (void)setHasPace:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasPace
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setIsStroller:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_isStroller = a3;
}

- (void)setHasIsStroller:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasIsStroller
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setHrTime:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_hrTime = a3;
}

- (void)setHasHrTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasHrTime
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLCKVO2MaxCalorimetryInput;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[CLCKVO2MaxCalorimetryInput description](&v3, "description"),  -[CLCKVO2MaxCalorimetryInput dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_startTime),  @"startTime");
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }

  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }

  *(float *)&double v4 = self->_mets;
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4),  @"mets");
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }

- (BOOL)readFrom:(id)a3
{
  return sub_10099BA60((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteDoubleField(a3, 1LL, self->_startTime);
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }

  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteFloatField(a3, 2LL, self->_mets);
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((void *)a3 + 5) = *(void *)&self->_startTime;
    *((_WORD *)a3 + 38) |= 0x10u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }

  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)a3 + 16) = LODWORD(self->_mets);
  *((_WORD *)a3 + 38) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  id result = objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "init");
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((void *)result + 5) = *(void *)&self->_startTime;
    *((_WORD *)result + 38) |= 0x10u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }

  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)result + 16) = LODWORD(self->_mets);
  *((_WORD *)result + 38) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }

- (BOOL)isEqual:(id)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  unsigned int v7 = objc_msgSend(a3, "isMemberOfClass:", v6, v5);
  if (!v7) {
    return v7;
  }
  __int16 has = (__int16)self->_has;
  __int16 v9 = *((_WORD *)a3 + 38);
  if ((has & 0x10) != 0)
  {
  }

  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_80;
  }

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
  }

  else if ((*((_WORD *)a3 + 38) & 0x200) != 0)
  {
    goto LABEL_80;
  }

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)a3 + 38) & 0x100) == 0 || self->_metSource != *((_DWORD *)a3 + 15)) {
      goto LABEL_80;
    }
  }

  else if ((*((_WORD *)a3 + 38) & 0x100) != 0)
  {
    goto LABEL_80;
  }

  if ((has & 0x40) != 0)
  {
  }

  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_80;
  }

  if ((has & 0x80) != 0)
  {
  }

  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_80;
  }

  if ((has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_gradeType != *((_DWORD *)a3 + 12)) {
      goto LABEL_80;
    }
  }

  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_80;
  }

  if ((has & 2) != 0)
  {
  }

  else if ((v9 & 2) != 0)
  {
    goto LABEL_80;
  }

  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)a3 + 38) & 0x800) == 0) {
      goto LABEL_80;
    }
    if (self->_hasGPS)
    {
      if (!*((_BYTE *)a3 + 72)) {
        goto LABEL_80;
      }
    }

    else if (*((_BYTE *)a3 + 72))
    {
      goto LABEL_80;
    }
  }

  else if ((*((_WORD *)a3 + 38) & 0x800) != 0)
  {
    goto LABEL_80;
  }

  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)a3 + 38) & 0x1000) == 0) {
      goto LABEL_80;
    }
    if (self->_hasStrideCal)
    {
      if (!*((_BYTE *)a3 + 73)) {
        goto LABEL_80;
      }
    }

    else if (*((_BYTE *)a3 + 73))
    {
      goto LABEL_80;
    }
  }

  else if ((*((_WORD *)a3 + 38) & 0x1000) != 0)
  {
    goto LABEL_80;
  }

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)a3 + 38) & 0x400) == 0 || self->_workoutType != *((_DWORD *)a3 + 17)) {
      goto LABEL_80;
    }
  }

  else if ((*((_WORD *)a3 + 38) & 0x400) != 0)
  {
    goto LABEL_80;
  }

  if ((has & 1) != 0)
  {
  }

  else if ((v9 & 1) != 0)
  {
    goto LABEL_80;
  }

  if ((has & 8) != 0)
  {
  }

  else if ((v9 & 8) != 0)
  {
    goto LABEL_80;
  }

  if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    if ((*((_WORD *)a3 + 38) & 0x2000) != 0) {
      goto LABEL_80;
    }
    goto LABEL_76;
  }

  if ((*((_WORD *)a3 + 38) & 0x2000) == 0) {
    goto LABEL_80;
  }
  if (self->_isStroller)
  {
    if (!*((_BYTE *)a3 + 74)) {
      goto LABEL_80;
    }
    goto LABEL_76;
  }

  if (*((_BYTE *)a3 + 74))
  {
LABEL_80:
    LOBYTE(v7) = 0;
    return v7;
  }

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
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

  if ((has & 0x200) != 0)
  {
    float mets = self->_mets;
    float v11 = -mets;
    if (mets >= 0.0) {
      float v11 = self->_mets;
    }
    float v12 = floorf(v11 + 0.5);
    float v13 = (float)(v11 - v12) * 1.8447e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmodf(v12, 1.8447e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }

    else
    {
      v9 -= (unint64_t)fabsf(v13);
    }
  }

  else
  {
    unint64_t v9 = 0LL;
  }

  if ((has & 0x100) != 0)
  {
    uint64_t v53 = 2654435761LL * self->_metSource;
    if ((has & 0x40) != 0) {
      goto LABEL_19;
    }
LABEL_24:
    unint64_t v18 = 0LL;
    goto LABEL_27;
  }

  uint64_t v53 = 0LL;
  if ((has & 0x40) == 0) {
    goto LABEL_24;
  }
LABEL_19:
  float hr = self->_hr;
  float v15 = -hr;
  if (hr >= 0.0) {
    float v15 = self->_hr;
  }
  float v16 = floorf(v15 + 0.5);
  float v17 = (float)(v15 - v16) * 1.8447e19;
  unint64_t v18 = 2654435761u * (unint64_t)fmodf(v16, 1.8447e19);
  if (v17 >= 0.0)
  {
    if (v17 > 0.0) {
      v18 += (unint64_t)v17;
    }
  }

  else
  {
    v18 -= (unint64_t)fabsf(v17);
  }

- (void)mergeFrom:(id)a3
{
  __int16 v3 = *((_WORD *)a3 + 38);
  if ((v3 & 0x10) != 0)
  {
    self->_double startTime = *((double *)a3 + 5);
    *(_WORD *)&self->_has |= 0x10u;
    __int16 v3 = *((_WORD *)a3 + 38);
    if ((v3 & 0x200) == 0)
    {
LABEL_3:
      if ((v3 & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }

  else if ((*((_WORD *)a3 + 38) & 0x200) == 0)
  {
    goto LABEL_3;
  }

  self->_float mets = *((float *)a3 + 16);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v3 = *((_WORD *)a3 + 38);
  if ((v3 & 0x100) == 0)
  {
LABEL_4:
    if ((v3 & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }

- (double)startTime
{
  return self->_startTime;
}

- (float)mets
{
  return self->_mets;
}

- (int)metSource
{
  return self->_metSource;
}

- (float)hr
{
  return self->_hr;
}

- (float)hrConfidence
{
  return self->_hrConfidence;
}

- (int)gradeType
{
  return self->_gradeType;
}

- (double)grade
{
  return self->_grade;
}

- (BOOL)hasGPS
{
  return self->_hasGPS;
}

- (BOOL)hasStrideCal
{
  return self->_hasStrideCal;
}

- (int)workoutType
{
  return self->_workoutType;
}

- (double)cadence
{
  return self->_cadence;
}

- (double)pace
{
  return self->_pace;
}

- (BOOL)isStroller
{
  return self->_isStroller;
}

- (double)hrTime
{
  return self->_hrTime;
}

@end
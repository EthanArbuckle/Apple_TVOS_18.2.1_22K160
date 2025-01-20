@interface ALCLSessionCatherine
- (BOOL)hasFirstCatherine;
- (BOOL)hasFirstCatherineStartTime;
- (BOOL)hasLongestDropout;
- (BOOL)hasMaxGoodCatherine;
- (BOOL)hasMeanCatherine;
- (BOOL)hasMeanGoodCatherine;
- (BOOL)hasMinGoodCatherine;
- (BOOL)hasNCatherine;
- (BOOL)hasNDropout;
- (BOOL)hasNGoodCatherine;
- (BOOL)hasNHighCatherine;
- (BOOL)hasNInterpolatedCatherine;
- (BOOL)hasNLowCatherine;
- (BOOL)hasNSampleAndHoldCatherine;
- (BOOL)hasNVeryHighCatherine;
- (BOOL)hasNVeryLowCatherine;
- (BOOL)hasOnsetCatherine;
- (BOOL)hasOnsetReason;
- (BOOL)hasPersistedMinHR;
- (BOOL)hasStartTime;
- (BOOL)hasTotalDropoutTime;
- (BOOL)hasUserMaxCatherine;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)startTime;
- (float)firstCatherine;
- (float)firstCatherineStartTime;
- (float)longestDropout;
- (float)maxGoodCatherine;
- (float)meanCatherine;
- (float)meanGoodCatherine;
- (float)minGoodCatherine;
- (float)onsetCatherine;
- (float)persistedMinHR;
- (float)totalDropoutTime;
- (float)userMaxCatherine;
- (id)activityTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)onsetReasonAsString:(int)a3;
- (int)StringAsActivityType:(id)a3;
- (int)StringAsOnsetReason:(id)a3;
- (int)activityType;
- (int)onsetReason;
- (unint64_t)hash;
- (unsigned)nCatherine;
- (unsigned)nDropout;
- (unsigned)nGoodCatherine;
- (unsigned)nHighCatherine;
- (unsigned)nInterpolatedCatherine;
- (unsigned)nLowCatherine;
- (unsigned)nSampleAndHoldCatherine;
- (unsigned)nVeryHighCatherine;
- (unsigned)nVeryLowCatherine;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivityType:(int)a3;
- (void)setFirstCatherine:(float)a3;
- (void)setFirstCatherineStartTime:(float)a3;
- (void)setHasFirstCatherine:(BOOL)a3;
- (void)setHasFirstCatherineStartTime:(BOOL)a3;
- (void)setHasLongestDropout:(BOOL)a3;
- (void)setHasMaxGoodCatherine:(BOOL)a3;
- (void)setHasMeanCatherine:(BOOL)a3;
- (void)setHasMeanGoodCatherine:(BOOL)a3;
- (void)setHasMinGoodCatherine:(BOOL)a3;
- (void)setHasNCatherine:(BOOL)a3;
- (void)setHasNDropout:(BOOL)a3;
- (void)setHasNGoodCatherine:(BOOL)a3;
- (void)setHasNHighCatherine:(BOOL)a3;
- (void)setHasNInterpolatedCatherine:(BOOL)a3;
- (void)setHasNLowCatherine:(BOOL)a3;
- (void)setHasNSampleAndHoldCatherine:(BOOL)a3;
- (void)setHasNVeryHighCatherine:(BOOL)a3;
- (void)setHasNVeryLowCatherine:(BOOL)a3;
- (void)setHasOnsetCatherine:(BOOL)a3;
- (void)setHasOnsetReason:(BOOL)a3;
- (void)setHasPersistedMinHR:(BOOL)a3;
- (void)setHasStartTime:(BOOL)a3;
- (void)setHasTotalDropoutTime:(BOOL)a3;
- (void)setHasUserMaxCatherine:(BOOL)a3;
- (void)setLongestDropout:(float)a3;
- (void)setMaxGoodCatherine:(float)a3;
- (void)setMeanCatherine:(float)a3;
- (void)setMeanGoodCatherine:(float)a3;
- (void)setMinGoodCatherine:(float)a3;
- (void)setNCatherine:(unsigned int)a3;
- (void)setNDropout:(unsigned int)a3;
- (void)setNGoodCatherine:(unsigned int)a3;
- (void)setNHighCatherine:(unsigned int)a3;
- (void)setNInterpolatedCatherine:(unsigned int)a3;
- (void)setNLowCatherine:(unsigned int)a3;
- (void)setNSampleAndHoldCatherine:(unsigned int)a3;
- (void)setNVeryHighCatherine:(unsigned int)a3;
- (void)setNVeryLowCatherine:(unsigned int)a3;
- (void)setOnsetCatherine:(float)a3;
- (void)setOnsetReason:(int)a3;
- (void)setPersistedMinHR:(float)a3;
- (void)setStartTime:(double)a3;
- (void)setTotalDropoutTime:(float)a3;
- (void)setUserMaxCatherine:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCLSessionCatherine

- (id)activityTypeAsString:(int)a3
{
  if (a3 > 2023)
  {
    if (a3 <= 11804)
    {
      if (a3 <= 2070)
      {
        if (a3 > 2060)
        {
          if (a3 == 2061) {
            return @"kTypeCrossTraining";
          }
          if (a3 == 2065) {
            return @"kTypeStairClimbing";
          }
        }

        else
        {
          if (a3 == 2024) {
            return @"kTypeCoreTraining";
          }
          if (a3 == 2048) {
            return @"kTypeElliptical";
          }
        }
      }

      else if (a3 <= 2104)
      {
        if (a3 == 2071) {
          return @"kTypeRowing";
        }
        if (a3 == 2101) {
          return @"kTypeCoolDown";
        }
      }

      else
      {
        switch(a3)
        {
          case 2105:
            return @"kTypePilates";
          case 2150:
            return @"kTypeYoga";
          case 3015:
            return @"kTypeDancing";
        }
      }
    }

    else if (a3 > 17149)
    {
      if (a3 <= 18239)
      {
        if (a3 == 17150) {
          return @"kTypeIndoorWalking";
        }
        if (a3 == 18200) {
          return @"kTypeScubaDiving";
        }
      }

      else
      {
        switch(a3)
        {
          case 18240:
            return @"kTypeSwimming";
          case 19150:
            return @"kTypeSummer";
          case 90603:
            return @"kTypeOutdoorWheelchair";
        }
      }
    }

    else if (a3 <= 15109)
    {
      if (a3 == 11805) {
        return @"kTypePushingWheelchair";
      }
      if (a3 == 12150) {
        return @"kTypeIndoorRunning";
      }
    }

    else
    {
      switch(a3)
      {
        case 15110:
          return @"kTypeKickboxing";
        case 15255:
          return @"kTypeGolfing";
        case 15670:
          return @"kTypeTaiChi";
      }
    }

    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
  }

  if (a3 > 40)
  {
    if (a3 > 99)
    {
      if (a3 > 2019)
      {
        if (a3 == 2020) {
          return @"kTypeCalisthenics";
        }
        if (a3 == 2022) {
          return @"kTypeFunctionalStrength";
        }
      }

      else
      {
        if (a3 == 100) {
          return @"kTypeCyclingLeg";
        }
        if (a3 == 2010) {
          return @"kTypeStationaryCycling";
        }
      }
    }

    else if (a3 > 55)
    {
      if (a3 == 56) {
        return @"kTypeDrivingOther";
      }
      if (a3 == 63) {
        return @"kTypeMultiSportTransition";
      }
    }

    else
    {
      if (a3 == 41) {
        return @"kTypeWalkingSlow";
      }
      if (a3 == 52) {
        return @"kTypeVehicularInHand";
      }
    }

    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
  }

  id result = @"kTypeUnknown";
  switch(a3)
  {
    case 0:
      return result;
    case 1:
      id result = @"kTypeFrozen";
      break;
    case 2:
      id result = @"kTypeStatic";
      break;
    case 3:
      id result = @"kTypeMoving";
      break;
    case 4:
      id result = @"kTypeWalking";
      break;
    case 5:
      id result = @"kTypeDriving";
      break;
    case 6:
      id result = @"kTypeCycling";
      break;
    case 7:
      id result = @"kTypeSemiStationary";
      break;
    case 8:
      id result = @"kTypeRunning";
      break;
    case 9:
      id result = @"kTypeMovingCoarse";
      break;
    case 10:
      id result = @"kTypeInVehicleFrozen";
      break;
    case 11:
      id result = @"kTypeInVehicleStatic";
      break;
    default:
      return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
  }

  return result;
}

- (int)StringAsActivityType:(id)a3
{
  return 0;
}

- (void)setNCatherine:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_nCatherine = a3;
}

- (void)setHasNCatherine:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasNCatherine
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setNVeryLowCatherine:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_nVeryLowCatherine = a3;
}

- (void)setHasNVeryLowCatherine:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasNVeryLowCatherine
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setNLowCatherine:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_nLowCatherine = a3;
}

- (void)setHasNLowCatherine:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasNLowCatherine
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setNHighCatherine:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_nHighCatherine = a3;
}

- (void)setHasNHighCatherine:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasNHighCatherine
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setNVeryHighCatherine:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_nVeryHighCatherine = a3;
}

- (void)setHasNVeryHighCatherine:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasNVeryHighCatherine
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setNGoodCatherine:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_nGoodCatherine = a3;
}

- (void)setHasNGoodCatherine:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasNGoodCatherine
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setNInterpolatedCatherine:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_nInterpolatedCatherine = a3;
}

- (void)setHasNInterpolatedCatherine:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasNInterpolatedCatherine
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setNSampleAndHoldCatherine:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_nSampleAndHoldCatherine = a3;
}

- (void)setHasNSampleAndHoldCatherine:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasNSampleAndHoldCatherine
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setMinGoodCatherine:(float)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_minGoodCatherine = a3;
}

- (void)setHasMinGoodCatherine:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasMinGoodCatherine
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setMaxGoodCatherine:(float)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_maxGoodCatherine = a3;
}

- (void)setHasMaxGoodCatherine:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasMaxGoodCatherine
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setMeanCatherine:(float)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_meanCatherine = a3;
}

- (void)setHasMeanCatherine:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasMeanCatherine
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setMeanGoodCatherine:(float)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_meanGoodCatherine = a3;
}

- (void)setHasMeanGoodCatherine:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasMeanGoodCatherine
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setFirstCatherine:(float)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_firstCatherine = a3;
}

- (void)setHasFirstCatherine:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasFirstCatherine
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setFirstCatherineStartTime:(float)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_firstCatherineStartTime = a3;
}

- (void)setHasFirstCatherineStartTime:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasFirstCatherineStartTime
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setLongestDropout:(float)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_longestDropout = a3;
}

- (void)setHasLongestDropout:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasLongestDropout
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setTotalDropoutTime:(float)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_totalDropoutTime = a3;
}

- (void)setHasTotalDropoutTime:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasTotalDropoutTime
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setNDropout:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_nDropout = a3;
}

- (void)setHasNDropout:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasNDropout
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setStartTime:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasStartTime
{
  return *(_DWORD *)&self->_has & 1;
}

- (int)onsetReason
{
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0) {
    return self->_onsetReason;
  }
  else {
    return -1;
  }
}

- (void)setOnsetReason:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_onsetReason = a3;
}

- (void)setHasOnsetReason:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasOnsetReason
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (id)onsetReasonAsString:(int)a3
{
  if ((a3 + 1) >= 5) {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
  }
  else {
    return off_10183ECA0[a3 + 1];
  }
}

- (int)StringAsOnsetReason:(id)a3
{
  return -1;
}

- (void)setOnsetCatherine:(float)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_onsetCatherine = a3;
}

- (void)setHasOnsetCatherine:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasOnsetCatherine
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setUserMaxCatherine:(float)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_userMaxCatherine = a3;
}

- (void)setHasUserMaxCatherine:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasUserMaxCatherine
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setPersistedMinHR:(float)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_persistedMinHR = a3;
}

- (void)setHasPersistedMinHR:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasPersistedMinHR
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALCLSessionCatherine;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[ALCLSessionCatherine description](&v3, "description"),  -[ALCLSessionCatherine dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  int activityType = self->_activityType;
  if (activityType > 2023)
  {
    if (activityType <= 11804)
    {
      if (activityType <= 2070)
      {
        if (activityType > 2060)
        {
          if (activityType == 2061)
          {
            v5 = @"kTypeCrossTraining";
            goto LABEL_80;
          }

          if (activityType == 2065)
          {
            v5 = @"kTypeStairClimbing";
            goto LABEL_80;
          }
        }

        else
        {
          if (activityType == 2024)
          {
            v5 = @"kTypeCoreTraining";
            goto LABEL_80;
          }

          if (activityType == 2048)
          {
            v5 = @"kTypeElliptical";
            goto LABEL_80;
          }
        }
      }

      else if (activityType <= 2104)
      {
        if (activityType == 2071)
        {
          v5 = @"kTypeRowing";
          goto LABEL_80;
        }

        if (activityType == 2101)
        {
          v5 = @"kTypeCoolDown";
          goto LABEL_80;
        }
      }

      else
      {
        switch(activityType)
        {
          case 2105:
            v5 = @"kTypePilates";
            goto LABEL_80;
          case 2150:
            v5 = @"kTypeYoga";
            goto LABEL_80;
          case 3015:
            v5 = @"kTypeDancing";
            goto LABEL_80;
        }
      }
    }

    else if (activityType > 17149)
    {
      if (activityType <= 18239)
      {
        if (activityType == 17150)
        {
          v5 = @"kTypeIndoorWalking";
          goto LABEL_80;
        }

        if (activityType == 18200)
        {
          v5 = @"kTypeScubaDiving";
          goto LABEL_80;
        }
      }

      else
      {
        switch(activityType)
        {
          case 18240:
            v5 = @"kTypeSwimming";
            goto LABEL_80;
          case 19150:
            v5 = @"kTypeSummer";
            goto LABEL_80;
          case 90603:
            v5 = @"kTypeOutdoorWheelchair";
            goto LABEL_80;
        }
      }
    }

    else if (activityType <= 15109)
    {
      if (activityType == 11805)
      {
        v5 = @"kTypePushingWheelchair";
        goto LABEL_80;
      }

      if (activityType == 12150)
      {
        v5 = @"kTypeIndoorRunning";
        goto LABEL_80;
      }
    }

    else
    {
      switch(activityType)
      {
        case 15110:
          v5 = @"kTypeKickboxing";
          goto LABEL_80;
        case 15255:
          v5 = @"kTypeGolfing";
          goto LABEL_80;
        case 15670:
          v5 = @"kTypeTaiChi";
          goto LABEL_80;
      }
    }

- (BOOL)readFrom:(id)a3
{
  return sub_10051D368((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    PBDataWriterWriteUint32Field(a3, self->_nCatherine, 2LL);
    $16169639337E07BB51B78E1150F773F4 has = self->_has;
    if ((*(_DWORD *)&has & 0x10000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x2000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }

  else if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteUint32Field(a3, self->_nVeryLowCatherine, 3LL);
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 4) = self->_activityType;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    *((_DWORD *)a3 + 12) = self->_nCatherine;
    *((_DWORD *)a3 + 26) |= 0x100u;
    $16169639337E07BB51B78E1150F773F4 has = self->_has;
    if ((*(_DWORD *)&has & 0x10000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x2000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }

  else if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)a3 + 20) = self->_nVeryLowCatherine;
  *((_DWORD *)a3 + 26) |= 0x10000u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 4) = self->_activityType;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    *((_DWORD *)result + 12) = self->_nCatherine;
    *((_DWORD *)result + 26) |= 0x100u;
    $16169639337E07BB51B78E1150F773F4 has = self->_has;
    if ((*(_DWORD *)&has & 0x10000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x2000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_27;
    }
  }

  else if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)result + 20) = self->_nVeryLowCatherine;
  *((_DWORD *)result + 26) |= 0x10000u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_5;
    }
    goto LABEL_28;
  }

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class(self)];
  if (v5)
  {
    if (self->_activityType != *((_DWORD *)a3 + 4))
    {
LABEL_112:
      LOBYTE(v5) = 0;
      return v5;
    }

    $16169639337E07BB51B78E1150F773F4 has = self->_has;
    int v7 = *((_DWORD *)a3 + 26);
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_nCatherine != *((_DWORD *)a3 + 12)) {
        goto LABEL_112;
      }
    }

    else if ((v7 & 0x100) != 0)
    {
      goto LABEL_112;
    }

    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_nVeryLowCatherine != *((_DWORD *)a3 + 20)) {
        goto LABEL_112;
      }
    }

    else if ((v7 & 0x10000) != 0)
    {
      goto LABEL_112;
    }

    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((v7 & 0x2000) == 0 || self->_nLowCatherine != *((_DWORD *)a3 + 17)) {
        goto LABEL_112;
      }
    }

    else if ((v7 & 0x2000) != 0)
    {
      goto LABEL_112;
    }

    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_nHighCatherine != *((_DWORD *)a3 + 15)) {
        goto LABEL_112;
      }
    }

    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_112;
    }

    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v7 & 0x8000) == 0 || self->_nVeryHighCatherine != *((_DWORD *)a3 + 19)) {
        goto LABEL_112;
      }
    }

    else if ((v7 & 0x8000) != 0)
    {
      goto LABEL_112;
    }

    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v7 & 0x400) == 0 || self->_nGoodCatherine != *((_DWORD *)a3 + 14)) {
        goto LABEL_112;
      }
    }

    else if ((v7 & 0x400) != 0)
    {
      goto LABEL_112;
    }

    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v7 & 0x1000) == 0 || self->_nInterpolatedCatherine != *((_DWORD *)a3 + 16)) {
        goto LABEL_112;
      }
    }

    else if ((v7 & 0x1000) != 0)
    {
      goto LABEL_112;
    }

    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v7 & 0x4000) == 0 || self->_nSampleAndHoldCatherine != *((_DWORD *)a3 + 18)) {
        goto LABEL_112;
      }
    }

    else if ((v7 & 0x4000) != 0)
    {
      goto LABEL_112;
    }

    if ((*(_BYTE *)&has & 0x80) != 0)
    {
    }

    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_112;
    }

    if ((*(_BYTE *)&has & 0x10) != 0)
    {
    }

    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_112;
    }

    if ((*(_BYTE *)&has & 0x20) != 0)
    {
    }

    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_112;
    }

    if ((*(_BYTE *)&has & 0x40) != 0)
    {
    }

    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_112;
    }

    if ((*(_BYTE *)&has & 2) != 0)
    {
    }

    else if ((v7 & 2) != 0)
    {
      goto LABEL_112;
    }

    if ((*(_BYTE *)&has & 4) != 0)
    {
    }

    else if ((v7 & 4) != 0)
    {
      goto LABEL_112;
    }

    if ((*(_BYTE *)&has & 8) != 0)
    {
    }

    else if ((v7 & 8) != 0)
    {
      goto LABEL_112;
    }

    if ((*(_DWORD *)&has & 0x100000) != 0)
    {
    }

    else if ((v7 & 0x100000) != 0)
    {
      goto LABEL_112;
    }

    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v7 & 0x200) == 0 || self->_nDropout != *((_DWORD *)a3 + 13)) {
        goto LABEL_112;
      }
    }

    else if ((v7 & 0x200) != 0)
    {
      goto LABEL_112;
    }

    if ((*(_BYTE *)&has & 1) != 0)
    {
    }

    else if ((v7 & 1) != 0)
    {
      goto LABEL_112;
    }

    if ((*(_DWORD *)&has & 0x40000) != 0)
    {
      if ((v7 & 0x40000) == 0 || self->_onsetReason != *((_DWORD *)a3 + 22)) {
        goto LABEL_112;
      }
    }

    else if ((v7 & 0x40000) != 0)
    {
      goto LABEL_112;
    }

    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
    }

    else if ((v7 & 0x20000) != 0)
    {
      goto LABEL_112;
    }

    if ((*(_DWORD *)&has & 0x200000) != 0)
    {
    }

    else if ((v7 & 0x200000) != 0)
    {
      goto LABEL_112;
    }

    LOBYTE(v5) = (v7 & 0x80000) == 0;
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
      LOBYTE(v5) = 1;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    uint64_t v82 = 2654435761LL * self->_nCatherine;
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
LABEL_3:
      uint64_t v81 = 2654435761LL * self->_nVeryLowCatherine;
      if ((*(_WORD *)&has & 0x2000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }

  else
  {
    uint64_t v82 = 0LL;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_3;
    }
  }

  uint64_t v81 = 0LL;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_4:
    uint64_t v80 = 2654435761LL * self->_nLowCatherine;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }

- (void)mergeFrom:(id)a3
{
  self->_uint64_t activityType = *((_DWORD *)a3 + 4);
  int v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 0x100) != 0)
  {
    self->_nCatherine = *((_DWORD *)a3 + 12);
    *(_DWORD *)&self->_has |= 0x100u;
    int v3 = *((_DWORD *)a3 + 26);
    if ((v3 & 0x10000) == 0)
    {
LABEL_3:
      if ((v3 & 0x2000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }

  else if ((v3 & 0x10000) == 0)
  {
    goto LABEL_3;
  }

  self->_nVeryLowCatherine = *((_DWORD *)a3 + 20);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 0x2000) == 0)
  {
LABEL_4:
    if ((v3 & 0x800) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }

- (int)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(int)a3
{
  self->_uint64_t activityType = a3;
}

- (unsigned)nCatherine
{
  return self->_nCatherine;
}

- (unsigned)nVeryLowCatherine
{
  return self->_nVeryLowCatherine;
}

- (unsigned)nLowCatherine
{
  return self->_nLowCatherine;
}

- (unsigned)nHighCatherine
{
  return self->_nHighCatherine;
}

- (unsigned)nVeryHighCatherine
{
  return self->_nVeryHighCatherine;
}

- (unsigned)nGoodCatherine
{
  return self->_nGoodCatherine;
}

- (unsigned)nInterpolatedCatherine
{
  return self->_nInterpolatedCatherine;
}

- (unsigned)nSampleAndHoldCatherine
{
  return self->_nSampleAndHoldCatherine;
}

- (float)minGoodCatherine
{
  return self->_minGoodCatherine;
}

- (float)maxGoodCatherine
{
  return self->_maxGoodCatherine;
}

- (float)meanCatherine
{
  return self->_meanCatherine;
}

- (float)meanGoodCatherine
{
  return self->_meanGoodCatherine;
}

- (float)firstCatherine
{
  return self->_firstCatherine;
}

- (float)firstCatherineStartTime
{
  return self->_firstCatherineStartTime;
}

- (float)longestDropout
{
  return self->_longestDropout;
}

- (float)totalDropoutTime
{
  return self->_totalDropoutTime;
}

- (unsigned)nDropout
{
  return self->_nDropout;
}

- (double)startTime
{
  return self->_startTime;
}

- (float)onsetCatherine
{
  return self->_onsetCatherine;
}

- (float)userMaxCatherine
{
  return self->_userMaxCatherine;
}

- (float)persistedMinHR
{
  return self->_persistedMinHR;
}

@end
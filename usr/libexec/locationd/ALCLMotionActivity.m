@interface ALCLMotionActivity
- (BOOL)hasConfidence;
- (BOOL)hasEstExitTime;
- (BOOL)hasExitState;
- (BOOL)hasIsStanding;
- (BOOL)hasIsVehicleConnected;
- (BOOL)hasMountedConfidence;
- (BOOL)hasMountedState;
- (BOOL)hasStartTime;
- (BOOL)hasTilt;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStanding;
- (BOOL)isVehicleConnected;
- (BOOL)readFrom:(id)a3;
- (double)estExitTime;
- (double)startTime;
- (double)timestamp;
- (float)tilt;
- (id)confidenceAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exitStateAsString:(int)a3;
- (id)mountedConfidenceAsString:(int)a3;
- (id)mountedStateAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsConfidence:(id)a3;
- (int)StringAsExitState:(id)a3;
- (int)StringAsMountedConfidence:(id)a3;
- (int)StringAsMountedState:(id)a3;
- (int)StringAsType:(id)a3;
- (int)confidence;
- (int)exitState;
- (int)mountedConfidence;
- (int)mountedState;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfidence:(int)a3;
- (void)setEstExitTime:(double)a3;
- (void)setExitState:(int)a3;
- (void)setHasConfidence:(BOOL)a3;
- (void)setHasEstExitTime:(BOOL)a3;
- (void)setHasExitState:(BOOL)a3;
- (void)setHasIsStanding:(BOOL)a3;
- (void)setHasIsVehicleConnected:(BOOL)a3;
- (void)setHasMountedConfidence:(BOOL)a3;
- (void)setHasMountedState:(BOOL)a3;
- (void)setHasStartTime:(BOOL)a3;
- (void)setHasTilt:(BOOL)a3;
- (void)setIsStanding:(BOOL)a3;
- (void)setIsVehicleConnected:(BOOL)a3;
- (void)setMountedConfidence:(int)a3;
- (void)setMountedState:(int)a3;
- (void)setStartTime:(double)a3;
- (void)setTilt:(float)a3;
- (void)setTimestamp:(double)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCLMotionActivity

- (id)typeAsString:(int)a3
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

- (int)StringAsType:(id)a3
{
  return 0;
}

- (int)confidence
{
  if ((*(_WORD *)&self->_has & 4) != 0) {
    return self->_confidence;
  }
  else {
    return 0;
  }
}

- (void)setConfidence:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_confidence = a3;
}

- (void)setHasConfidence:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasConfidence
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)confidenceAsString:(int)a3
{
  if (a3 >= 3) {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
  }
  else {
    return *(&off_10182CAF8 + a3);
  }
}

- (int)StringAsConfidence:(id)a3
{
  return 0;
}

- (int)mountedState
{
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    return self->_mountedState;
  }
  else {
    return 0;
  }
}

- (void)setMountedState:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_mountedState = a3;
}

- (void)setHasMountedState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasMountedState
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)mountedStateAsString:(int)a3
{
  if (!a3) {
    return @"kNotMounted";
  }
  if (a3 == 1) {
    return @"kMounted";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
}

- (int)StringAsMountedState:(id)a3
{
  else {
    return [a3 isEqualToString:@"kMounted"];
  }
}

- (int)mountedConfidence
{
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    return self->_mountedConfidence;
  }
  else {
    return 0;
  }
}

- (void)setMountedConfidence:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_mountedConfidence = a3;
}

- (void)setHasMountedConfidence:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasMountedConfidence
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)mountedConfidenceAsString:(int)a3
{
  if (a3 >= 3) {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
  }
  else {
    return *(&off_10182CAF8 + a3);
  }
}

- (int)StringAsMountedConfidence:(id)a3
{
  return 0;
}

- (void)setIsStanding:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_isStanding = a3;
}

- (void)setHasIsStanding:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasIsStanding
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setTilt:(float)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_tilt = a3;
}

- (void)setHasTilt:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTilt
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (int)exitState
{
  if ((*(_WORD *)&self->_has & 8) != 0) {
    return self->_exitState;
  }
  else {
    return 0;
  }
}

- (void)setExitState:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_exitState = a3;
}

- (void)setHasExitState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasExitState
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)exitStateAsString:(int)a3
{
  if (a3 >= 3) {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
  }
  else {
    return *(&off_10182CB10 + a3);
  }
}

- (int)StringAsExitState:(id)a3
{
  return 0;
}

- (void)setEstExitTime:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_estExitTime = a3;
}

- (void)setHasEstExitTime:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasEstExitTime
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setStartTime:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasStartTime
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setIsVehicleConnected:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isVehicleConnected = a3;
}

- (void)setHasIsVehicleConnected:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasIsVehicleConnected
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALCLMotionActivity;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[ALCLMotionActivity description](&v3, "description"),  -[ALCLMotionActivity dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  int type = self->_type;
  if (type > 2023)
  {
    if (type <= 11804)
    {
      if (type <= 2070)
      {
        if (type > 2060)
        {
          if (type == 2061)
          {
            v5 = @"kTypeCrossTraining";
            goto LABEL_80;
          }

          if (type == 2065)
          {
            v5 = @"kTypeStairClimbing";
            goto LABEL_80;
          }
        }

        else
        {
          if (type == 2024)
          {
            v5 = @"kTypeCoreTraining";
            goto LABEL_80;
          }

          if (type == 2048)
          {
            v5 = @"kTypeElliptical";
            goto LABEL_80;
          }
        }
      }

      else if (type <= 2104)
      {
        if (type == 2071)
        {
          v5 = @"kTypeRowing";
          goto LABEL_80;
        }

        if (type == 2101)
        {
          v5 = @"kTypeCoolDown";
          goto LABEL_80;
        }
      }

      else
      {
        switch(type)
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

    else if (type > 17149)
    {
      if (type <= 18239)
      {
        if (type == 17150)
        {
          v5 = @"kTypeIndoorWalking";
          goto LABEL_80;
        }

        if (type == 18200)
        {
          v5 = @"kTypeScubaDiving";
          goto LABEL_80;
        }
      }

      else
      {
        switch(type)
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

    else if (type <= 15109)
    {
      if (type == 11805)
      {
        v5 = @"kTypePushingWheelchair";
        goto LABEL_80;
      }

      if (type == 12150)
      {
        v5 = @"kTypeIndoorRunning";
        goto LABEL_80;
      }
    }

    else
    {
      switch(type)
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
  return sub_10026085C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field(a3, self->_confidence, 2LL);
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }

  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteInt32Field(a3, self->_mountedState, 3LL);
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 13) = self->_type;
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_confidence;
    *((_WORD *)a3 + 30) |= 4u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }

  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)a3 + 11) = self->_mountedState;
  *((_WORD *)a3 + 30) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 13) = self->_type;
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 8) = self->_confidence;
    *((_WORD *)result + 30) |= 4u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }

  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)result + 11) = self->_mountedState;
  *((_WORD *)result + 30) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class(self)];
  if (!v5) {
    return v5;
  }
  if (self->_type != *((_DWORD *)a3 + 13)) {
    goto LABEL_49;
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)a3 + 30);
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_confidence != *((_DWORD *)a3 + 8)) {
      goto LABEL_49;
    }
  }

  else if ((v7 & 4) != 0)
  {
    goto LABEL_49;
  }

  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_mountedState != *((_DWORD *)a3 + 11)) {
      goto LABEL_49;
    }
  }

  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_49;
  }

  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_mountedConfidence != *((_DWORD *)a3 + 10)) {
      goto LABEL_49;
    }
  }

  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_49;
  }

  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0) {
      goto LABEL_49;
    }
    if (self->_isStanding)
    {
      if (!*((_BYTE *)a3 + 56)) {
        goto LABEL_49;
      }
    }

    else if (*((_BYTE *)a3 + 56))
    {
      goto LABEL_49;
    }
  }

  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_49;
  }

  if ((has & 0x40) != 0)
  {
  }

  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_49;
  }

  if (self->_timestamp != *((double *)a3 + 3))
  {
LABEL_49:
    LOBYTE(v5) = 0;
    return v5;
  }

  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_exitState != *((_DWORD *)a3 + 9)) {
      goto LABEL_49;
    }
  }

  else if ((v7 & 8) != 0)
  {
    goto LABEL_49;
  }

  if ((has & 1) != 0)
  {
  }

  else if ((v7 & 1) != 0)
  {
    goto LABEL_49;
  }

  if ((has & 2) != 0)
  {
  }

  else if ((v7 & 2) != 0)
  {
    goto LABEL_49;
  }

  LOBYTE(v5) = (v7 & 0x100) == 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)a3 + 30) & 0x100) == 0) {
      goto LABEL_49;
    }
    if (self->_isVehicleConnected)
    {
      if (!*((_BYTE *)a3 + 57)) {
        goto LABEL_49;
      }
    }

    else if (*((_BYTE *)a3 + 57))
    {
      goto LABEL_49;
    }

    LOBYTE(v5) = 1;
  }

  return v5;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t v39 = 2654435761LL * self->_confidence;
    if ((has & 0x20) != 0) {
      goto LABEL_3;
    }
  }

  else
  {
    uint64_t v39 = 0LL;
    if ((has & 0x20) != 0)
    {
LABEL_3:
      uint64_t v38 = 2654435761LL * self->_mountedState;
      goto LABEL_6;
    }
  }

  uint64_t v38 = 0LL;
LABEL_6:
  if ((has & 0x10) != 0) {
    uint64_t v4 = 2654435761LL * self->_mountedConfidence;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if ((has & 0x80) != 0) {
    uint64_t v5 = 2654435761LL * self->_isStanding;
  }
  else {
    uint64_t v5 = 0LL;
  }
  uint64_t type = self->_type;
  if ((has & 0x40) != 0)
  {
    float tilt = self->_tilt;
    float v9 = -tilt;
    if (tilt >= 0.0) {
      float v9 = self->_tilt;
    }
    float v10 = floorf(v9 + 0.5);
    float v11 = (float)(v9 - v10) * 1.8447e19;
    float v12 = fmodf(v10, 1.8447e19);
    unint64_t v13 = 2654435761u * (unint64_t)v12;
    unint64_t v14 = v13 + (unint64_t)v11;
    if (v11 <= 0.0) {
      unint64_t v14 = 2654435761u * (unint64_t)v12;
    }
    unint64_t v15 = v13 - (unint64_t)fabsf(v11);
    if (v11 < 0.0) {
      unint64_t v7 = v15;
    }
    else {
      unint64_t v7 = v14;
    }
  }

  else
  {
    unint64_t v7 = 0LL;
  }

  double timestamp = self->_timestamp;
  double v17 = -timestamp;
  if (timestamp >= 0.0) {
    double v17 = self->_timestamp;
  }
  double v18 = floor(v17 + 0.5);
  double v19 = (v17 - v18) * 1.84467441e19;
  double v20 = fmod(v18, 1.84467441e19);
  unint64_t v21 = 2654435761u * (unint64_t)v20;
  unint64_t v22 = v21 + (unint64_t)v19;
  if (v19 <= 0.0) {
    unint64_t v22 = 2654435761u * (unint64_t)v20;
  }
  unint64_t v23 = v21 - (unint64_t)fabs(v19);
  if (v19 < 0.0) {
    unint64_t v24 = v23;
  }
  else {
    unint64_t v24 = v22;
  }
  if ((has & 8) != 0)
  {
    uint64_t v25 = 2654435761LL * self->_exitState;
    if ((has & 1) != 0) {
      goto LABEL_30;
    }
LABEL_35:
    unint64_t v30 = 0LL;
    goto LABEL_38;
  }

  uint64_t v25 = 0LL;
  if ((has & 1) == 0) {
    goto LABEL_35;
  }
LABEL_30:
  double estExitTime = self->_estExitTime;
  double v27 = -estExitTime;
  if (estExitTime >= 0.0) {
    double v27 = self->_estExitTime;
  }
  double v28 = floor(v27 + 0.5);
  double v29 = (v27 - v28) * 1.84467441e19;
  unint64_t v30 = 2654435761u * (unint64_t)fmod(v28, 1.84467441e19);
  if (v29 >= 0.0)
  {
    if (v29 > 0.0) {
      v30 += (unint64_t)v29;
    }
  }

  else
  {
    v30 -= (unint64_t)fabs(v29);
  }

- (void)mergeFrom:(id)a3
{
  self->_uint64_t type = *((_DWORD *)a3 + 13);
  __int16 v3 = *((_WORD *)a3 + 30);
  if ((v3 & 4) != 0)
  {
    self->_uint64_t confidence = *((_DWORD *)a3 + 8);
    *(_WORD *)&self->_has |= 4u;
    __int16 v3 = *((_WORD *)a3 + 30);
    if ((v3 & 0x20) == 0)
    {
LABEL_3:
      if ((v3 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }

  else if ((v3 & 0x20) == 0)
  {
    goto LABEL_3;
  }

  self->_int mountedState = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v3 = *((_WORD *)a3 + 30);
  if ((v3 & 0x10) == 0)
  {
LABEL_4:
    if ((v3 & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_uint64_t type = a3;
}

- (BOOL)isStanding
{
  return self->_isStanding;
}

- (float)tilt
{
  return self->_tilt;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_double timestamp = a3;
}

- (double)estExitTime
{
  return self->_estExitTime;
}

- (double)startTime
{
  return self->_startTime;
}

- (BOOL)isVehicleConnected
{
  return self->_isVehicleConnected;
}

@end
@interface ALCMMotionContextMotionState
- (BOOL)hasExitState;
- (BOOL)hasIsMoving;
- (BOOL)hasIsVehicular;
- (BOOL)hasMounted;
- (BOOL)hasMountedConfidence;
- (BOOL)hasStartTime;
- (BOOL)hasTurn;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMoving;
- (BOOL)isVehicular;
- (BOOL)readFrom:(id)a3;
- (id)confidenceAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exitStateAsString:(int)a3;
- (id)mountedAsString:(int)a3;
- (id)mountedConfidenceAsString:(int)a3;
- (id)turnAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsConfidence:(id)a3;
- (int)StringAsExitState:(id)a3;
- (int)StringAsMounted:(id)a3;
- (int)StringAsMountedConfidence:(id)a3;
- (int)StringAsTurn:(id)a3;
- (int)StringAsType:(id)a3;
- (int)confidence;
- (int)exitState;
- (int)mounted;
- (int)mountedConfidence;
- (int)turn;
- (int)type;
- (unint64_t)hash;
- (unint64_t)startTime;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfidence:(int)a3;
- (void)setExitState:(int)a3;
- (void)setHasExitState:(BOOL)a3;
- (void)setHasIsMoving:(BOOL)a3;
- (void)setHasIsVehicular:(BOOL)a3;
- (void)setHasMounted:(BOOL)a3;
- (void)setHasMountedConfidence:(BOOL)a3;
- (void)setHasStartTime:(BOOL)a3;
- (void)setHasTurn:(BOOL)a3;
- (void)setIsMoving:(BOOL)a3;
- (void)setIsVehicular:(BOOL)a3;
- (void)setMounted:(int)a3;
- (void)setMountedConfidence:(int)a3;
- (void)setStartTime:(unint64_t)a3;
- (void)setTurn:(int)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCMMotionContextMotionState

- (id)typeAsString:(int)a3
{
  if (a3 >= 0x4000)
  {
    if (a3 < 462848)
    {
      if (a3 < 196608)
      {
        switch(a3)
        {
          case 16384:
            return @"kTypeDrivingMounted";
          case 65664:
            return @"kTypeCyclingSeat";
          case 131200:
            return @"kTypeCyclingChassis";
        }
      }

      else if (a3 > 327807)
      {
        if (a3 == 327808) {
          return @"kTypeCyclingTorso";
        }
        if (a3 == 397312) {
          return @"kTypeDrivingSeat";
        }
      }

      else
      {
        if (a3 == 196608) {
          return @"kTypeCyclingLeg";
        }
        if (a3 == 262272) {
          return @"kTypeCyclingArm";
        }
      }
    }

    else if (a3 > 720911)
    {
      if (a3 > 851979)
      {
        if (a3 == 851980) {
          return @"kTypeSemiStationaryPocket";
        }
        if (a3 == 917516) {
          return @"kTypeSemiStationaryArm";
        }
      }

      else
      {
        if (a3 == 720912) {
          return @"kTypeWalkingLeg";
        }
        if (a3 == 786448) {
          return @"kTypeWalkingArm";
        }
      }
    }

    else if (a3 > 589887)
    {
      if (a3 == 589888) {
        return @"kTypeRunningLeg";
      }
      if (a3 == 655424) {
        return @"kTypeRunningArm";
      }
    }

    else
    {
      if (a3 == 462848) {
        return @"kTypeDrivingArm";
      }
      if (a3 == 528384) {
        return @"kTypeDrivingStowed";
      }
    }

    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
  }

  if (a3 > 127)
  {
    if (a3 <= 4095)
    {
      switch(a3)
      {
        case 128:
          return @"kTypeCycling";
        case 256:
          return @"kTypeInVehicleFrozen";
        case 512:
          return @"kTypeInVehicleStatic";
      }
    }

    else if (a3 >= 0x2000)
    {
      if (a3 == 0x2000) {
        return @"kTypeVehicularInHand";
      }
      if (a3 == 12288) {
        return @"kTypeDrivingOther";
      }
    }

    else
    {
      if (a3 == 4096) {
        return @"kTypeDriving";
      }
      if (a3 == 4128) {
        return @"kTypeDrivingOrWalkingSlow";
      }
    }

    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
  }

  if (a3 > 11)
  {
    if (a3 > 31)
    {
      if (a3 == 32) {
        return @"kTypeWalkingSlow";
      }
      if (a3 == 64) {
        return @"kTypeRunning";
      }
    }

    else
    {
      if (a3 == 12) {
        return @"kTypeSemiStationary";
      }
      if (a3 == 16) {
        return @"kTypeWalking";
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
    case 4:
      id result = @"kTypeMoving";
      break;
    default:
      return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
  }

  return result;
}

- (int)StringAsType:(id)a3
{
  unsigned __int8 v5 = [a3 isEqualToString:@"kTypeCyclingSeat"];
  int result = 65664;
  if ((v5 & 1) == 0)
  {
    if ([a3 isEqualToString:@"kTypeCyclingChassis"])
    {
      int v6 = 65664;
      return v6 + 0x10000;
    }

    if ([a3 isEqualToString:@"kTypeCyclingLeg"])
    {
      return 196608;
    }

    else if ([a3 isEqualToString:@"kTypeCyclingArm"])
    {
      return 262272;
    }

    else if ([a3 isEqualToString:@"kTypeCyclingTorso"])
    {
      return 327808;
    }

    else
    {
      unsigned __int8 v7 = [a3 isEqualToString:@"kTypeDrivingSeat"];
      int result = 397312;
      if ((v7 & 1) == 0)
      {
        if ([a3 isEqualToString:@"kTypeDrivingArm"])
        {
          int v6 = 397312;
          return v6 + 0x10000;
        }

        if ([a3 isEqualToString:@"kTypeDrivingStowed"])
        {
          return 528384;
        }

        else
        {
          unsigned __int8 v8 = [a3 isEqualToString:@"kTypeRunningLeg"];
          int result = 589888;
          if ((v8 & 1) == 0)
          {
            if ([a3 isEqualToString:@"kTypeRunningArm"])
            {
              int v6 = 589888;
              return v6 + 0x10000;
            }

            unsigned __int8 v9 = [a3 isEqualToString:@"kTypeWalkingLeg"];
            int result = 720912;
            if ((v9 & 1) == 0)
            {
              if ([a3 isEqualToString:@"kTypeWalkingArm"])
              {
                int v6 = 720912;
                return v6 + 0x10000;
              }

              unsigned __int8 v10 = [a3 isEqualToString:@"kTypeSemiStationaryPocket"];
              int result = 851980;
              if ((v10 & 1) == 0)
              {
                else {
                  return 0;
                }
              }
            }
          }
        }
      }
    }
  }

  return result;
}

- (id)confidenceAsString:(int)a3
{
  if (a3 >= 3) {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
  }
  else {
    return *(&off_10182C3F0 + a3);
  }
}

- (int)StringAsConfidence:(id)a3
{
  return 0;
}

- (int)mounted
{
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    return self->_mounted;
  }
  else {
    return 0;
  }
}

- (void)setMounted:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_mounted = a3;
}

- (void)setHasMounted:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMounted
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)mountedAsString:(int)a3
{
  if (!a3) {
    return @"kNotMounted";
  }
  if (a3 == 1) {
    return @"kMounted";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
}

- (int)StringAsMounted:(id)a3
{
  else {
    return [a3 isEqualToString:@"kMounted"];
  }
}

- (int)mountedConfidence
{
  if ((*(_BYTE *)&self->_has & 8) != 0) {
    return self->_mountedConfidence;
  }
  else {
    return 0;
  }
}

- (void)setMountedConfidence:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_mountedConfidence = a3;
}

- (void)setHasMountedConfidence:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMountedConfidence
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)mountedConfidenceAsString:(int)a3
{
  if (a3 >= 3) {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
  }
  else {
    return *(&off_10182C3F0 + a3);
  }
}

- (int)StringAsMountedConfidence:(id)a3
{
  return 0;
}

- (int)turn
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0) {
    return self->_turn;
  }
  else {
    return 0;
  }
}

- (void)setTurn:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_turn = a3;
}

- (void)setHasTurn:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTurn
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)turnAsString:(int)a3
{
  if (a3 >= 3) {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
  }
  else {
    return *(&off_10182C408 + a3);
  }
}

- (int)StringAsTurn:(id)a3
{
  return 0;
}

- (void)setIsVehicular:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_isVehicular = a3;
}

- (void)setHasIsVehicular:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasIsVehicular
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setIsMoving:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_isMoving = a3;
}

- (void)setHasIsMoving:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsMoving
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (int)exitState
{
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    return self->_exitState;
  }
  else {
    return 0;
  }
}

- (void)setExitState:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_exitState = a3;
}

- (void)setHasExitState:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasExitState
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)exitStateAsString:(int)a3
{
  if (a3 >= 3) {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
  }
  else {
    return *(&off_10182C420 + a3);
  }
}

- (int)StringAsExitState:(id)a3
{
  return 0;
}

- (void)setStartTime:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStartTime
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALCMMotionContextMotionState;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[ALCMMotionContextMotionState description](&v3, "description"),  -[ALCMMotionContextMotionState dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  int type = self->_type;
  if (type >= 0x4000)
  {
    if (type < 462848)
    {
      if (type < 196608)
      {
        switch(type)
        {
          case 16384:
            unsigned __int8 v5 = @"kTypeDrivingMounted";
            goto LABEL_70;
          case 65664:
            unsigned __int8 v5 = @"kTypeCyclingSeat";
            goto LABEL_70;
          case 131200:
            unsigned __int8 v5 = @"kTypeCyclingChassis";
            goto LABEL_70;
        }
      }

      else if (type > 327807)
      {
        if (type == 327808)
        {
          unsigned __int8 v5 = @"kTypeCyclingTorso";
          goto LABEL_70;
        }

        if (type == 397312)
        {
          unsigned __int8 v5 = @"kTypeDrivingSeat";
          goto LABEL_70;
        }
      }

      else
      {
        if (type == 196608)
        {
          unsigned __int8 v5 = @"kTypeCyclingLeg";
          goto LABEL_70;
        }

        if (type == 262272)
        {
          unsigned __int8 v5 = @"kTypeCyclingArm";
          goto LABEL_70;
        }
      }
    }

    else if (type > 720911)
    {
      if (type > 851979)
      {
        if (type == 851980)
        {
          unsigned __int8 v5 = @"kTypeSemiStationaryPocket";
          goto LABEL_70;
        }

        if (type == 917516)
        {
          unsigned __int8 v5 = @"kTypeSemiStationaryArm";
          goto LABEL_70;
        }
      }

      else
      {
        if (type == 720912)
        {
          unsigned __int8 v5 = @"kTypeWalkingLeg";
          goto LABEL_70;
        }

        if (type == 786448)
        {
          unsigned __int8 v5 = @"kTypeWalkingArm";
          goto LABEL_70;
        }
      }
    }

    else if (type > 589887)
    {
      if (type == 589888)
      {
        unsigned __int8 v5 = @"kTypeRunningLeg";
        goto LABEL_70;
      }

      if (type == 655424)
      {
        unsigned __int8 v5 = @"kTypeRunningArm";
        goto LABEL_70;
      }
    }

    else
    {
      if (type == 462848)
      {
        unsigned __int8 v5 = @"kTypeDrivingArm";
        goto LABEL_70;
      }

      if (type == 528384)
      {
        unsigned __int8 v5 = @"kTypeDrivingStowed";
        goto LABEL_70;
      }
    }

    goto LABEL_69;
  }

  if (type > 127)
  {
    if (type <= 4095)
    {
      switch(type)
      {
        case 128:
          unsigned __int8 v5 = @"kTypeCycling";
          goto LABEL_70;
        case 256:
          unsigned __int8 v5 = @"kTypeInVehicleFrozen";
          goto LABEL_70;
        case 512:
          unsigned __int8 v5 = @"kTypeInVehicleStatic";
          goto LABEL_70;
      }
    }

    else if (type >= 0x2000)
    {
      if (type == 0x2000)
      {
        unsigned __int8 v5 = @"kTypeVehicularInHand";
        goto LABEL_70;
      }

      if (type == 12288)
      {
        unsigned __int8 v5 = @"kTypeDrivingOther";
        goto LABEL_70;
      }
    }

    else
    {
      if (type == 4096)
      {
        unsigned __int8 v5 = @"kTypeDriving";
        goto LABEL_70;
      }

      if (type == 4128)
      {
        unsigned __int8 v5 = @"kTypeDrivingOrWalkingSlow";
        goto LABEL_70;
      }
    }

- (BOOL)readFrom:(id)a3
{
  return sub_100249CC4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field(a3, self->_mounted, 3LL);
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }

  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteInt32Field(a3, self->_mountedConfidence, 4LL);
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 9) = self->_type;
  *((_DWORD *)a3 + 4) = self->_confidence;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_mounted;
    *((_BYTE *)a3 + 44) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }

  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)a3 + 7) = self->_mountedConfidence;
  *((_BYTE *)a3 + 44) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 9) = self->_type;
  *((_DWORD *)result + 4) = self->_confidence;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 6) = self->_mounted;
    *((_BYTE *)result + 44) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }

  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)result + 7) = self->_mountedConfidence;
  *((_BYTE *)result + 44) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class(self)];
  if (!v5) {
    return v5;
  }
  if (self->_type != *((_DWORD *)a3 + 9) || self->_confidence != *((_DWORD *)a3 + 4)) {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)a3 + 44) & 4) == 0 || self->_mounted != *((_DWORD *)a3 + 6)) {
      goto LABEL_44;
    }
  }

  else if ((*((_BYTE *)a3 + 44) & 4) != 0)
  {
    goto LABEL_44;
  }

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)a3 + 44) & 8) == 0 || self->_mountedConfidence != *((_DWORD *)a3 + 7)) {
      goto LABEL_44;
    }
  }

  else if ((*((_BYTE *)a3 + 44) & 8) != 0)
  {
    goto LABEL_44;
  }

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)a3 + 44) & 0x10) == 0 || self->_turn != *((_DWORD *)a3 + 8)) {
      goto LABEL_44;
    }
  }

  else if ((*((_BYTE *)a3 + 44) & 0x10) != 0)
  {
    goto LABEL_44;
  }

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)a3 + 44) & 0x40) == 0) {
      goto LABEL_44;
    }
    if (self->_isVehicular)
    {
      if (!*((_BYTE *)a3 + 41)) {
        goto LABEL_44;
      }
    }

    else if (*((_BYTE *)a3 + 41))
    {
      goto LABEL_44;
    }
  }

  else if ((*((_BYTE *)a3 + 44) & 0x40) != 0)
  {
    goto LABEL_44;
  }

  if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    if ((*((_BYTE *)a3 + 44) & 0x20) != 0) {
      goto LABEL_44;
    }
    goto LABEL_35;
  }

  if ((*((_BYTE *)a3 + 44) & 0x20) == 0) {
    goto LABEL_44;
  }
  if (self->_isMoving)
  {
    if (!*((_BYTE *)a3 + 40)) {
      goto LABEL_44;
    }
    goto LABEL_35;
  }

  if (*((_BYTE *)a3 + 40))
  {
LABEL_44:
    LOBYTE(v5) = 0;
    return v5;
  }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    uint64_t v2 = 2654435761LL * self->_mounted;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761LL * self->_mountedConfidence;
      if ((*(_BYTE *)&self->_has & 0x10) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0LL;
      if ((*(_BYTE *)&self->_has & 0x40) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }

  else
  {
    uint64_t v2 = 0LL;
    if ((*(_BYTE *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }

  uint64_t v3 = 0LL;
  if ((*(_BYTE *)&self->_has & 0x10) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761LL * self->_turn;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761LL * self->_isVehicular;
    goto LABEL_10;
  }

- (void)mergeFrom:(id)a3
{
  self->_int type = *((_DWORD *)a3 + 9);
  self->_uint64_t confidence = *((_DWORD *)a3 + 4);
  char v3 = *((_BYTE *)a3 + 44);
  if ((v3 & 4) != 0)
  {
    self->_int mounted = *((_DWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 4u;
    char v3 = *((_BYTE *)a3 + 44);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }

  else if ((*((_BYTE *)a3 + 44) & 8) == 0)
  {
    goto LABEL_3;
  }

  self->_uint64_t mountedConfidence = *((_DWORD *)a3 + 7);
  *(_BYTE *)&self->_has |= 8u;
  char v3 = *((_BYTE *)a3 + 44);
  if ((v3 & 0x10) == 0)
  {
LABEL_4:
    if ((v3 & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_int type = a3;
}

- (int)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(int)a3
{
  self->_uint64_t confidence = a3;
}

- (BOOL)isVehicular
{
  return self->_isVehicular;
}

- (BOOL)isMoving
{
  return self->_isMoving;
}

- (unint64_t)startTime
{
  return self->_startTime;
}

@end
@interface ALCMWorkoutEventDeprecated
- (BOOL)hasSessionId;
- (BOOL)hasWorkoutType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)sessionId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)workoutEventAsString:(int)a3;
- (id)workoutTypeAsString:(int)a3;
- (int)StringAsWorkoutEvent:(id)a3;
- (int)StringAsWorkoutType:(id)a3;
- (int)workoutEvent;
- (int)workoutType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasWorkoutType:(BOOL)a3;
- (void)setSessionId:(id)a3;
- (void)setWorkoutEvent:(int)a3;
- (void)setWorkoutType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCMWorkoutEventDeprecated

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALCMWorkoutEventDeprecated;
  -[ALCMWorkoutEventDeprecated dealloc](&v3, "dealloc");
}

- (id)workoutEventAsString:(int)a3
{
  if (a3 >= 6) {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
  }
  else {
    return off_10187D450[a3];
  }
}

- (int)StringAsWorkoutEvent:(id)a3
{
  return 0;
}

- (int)workoutType
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    return self->_workoutType;
  }
  else {
    return 0;
  }
}

- (void)setWorkoutType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_workoutType = a3;
}

- (void)setHasWorkoutType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasWorkoutType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)workoutTypeAsString:(int)a3
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

- (int)StringAsWorkoutType:(id)a3
{
  return 0;
}

- (BOOL)hasSessionId
{
  return self->_sessionId != 0LL;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALCMWorkoutEventDeprecated;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[ALCMWorkoutEventDeprecated description](&v3, "description"),  -[ALCMWorkoutEventDeprecated dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  uint64_t workoutEvent = self->_workoutEvent;
  if (workoutEvent >= 6) {
    v5 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_workoutEvent);
  }
  else {
    v5 = off_10187D450[workoutEvent];
  }
  [v3 setObject:v5 forKey:@"workoutEvent"];
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    int workoutType = self->_workoutType;
    if (workoutType <= 2023)
    {
      if (workoutType <= 40)
      {
        v7 = @"kTypeUnknown";
        switch(workoutType)
        {
          case 0:
            goto LABEL_84;
          case 1:
            v7 = @"kTypeFrozen";
            break;
          case 2:
            v7 = @"kTypeStatic";
            break;
          case 3:
            v7 = @"kTypeMoving";
            break;
          case 4:
            v7 = @"kTypeWalking";
            break;
          case 5:
            v7 = @"kTypeDriving";
            break;
          case 6:
            v7 = @"kTypeCycling";
            break;
          case 7:
            v7 = @"kTypeSemiStationary";
            break;
          case 8:
            v7 = @"kTypeRunning";
            break;
          case 9:
            v7 = @"kTypeMovingCoarse";
            break;
          case 10:
            v7 = @"kTypeInVehicleFrozen";
            break;
          case 11:
            v7 = @"kTypeInVehicleStatic";
            break;
          default:
            goto LABEL_83;
        }

        goto LABEL_84;
      }

      if (workoutType > 99)
      {
        if (workoutType > 2019)
        {
          if (workoutType == 2020)
          {
            v7 = @"kTypeCalisthenics";
            goto LABEL_84;
          }

          if (workoutType == 2022)
          {
            v7 = @"kTypeFunctionalStrength";
            goto LABEL_84;
          }
        }

        else
        {
          if (workoutType == 100)
          {
            v7 = @"kTypeCyclingLeg";
            goto LABEL_84;
          }

          if (workoutType == 2010)
          {
            v7 = @"kTypeStationaryCycling";
            goto LABEL_84;
          }
        }
      }

      else if (workoutType > 55)
      {
        if (workoutType == 56)
        {
          v7 = @"kTypeDrivingOther";
          goto LABEL_84;
        }

        if (workoutType == 63)
        {
          v7 = @"kTypeMultiSportTransition";
          goto LABEL_84;
        }
      }

      else
      {
        if (workoutType == 41)
        {
          v7 = @"kTypeWalkingSlow";
          goto LABEL_84;
        }

        if (workoutType == 52)
        {
          v7 = @"kTypeVehicularInHand";
          goto LABEL_84;
        }
      }

- (BOOL)readFrom:(id)a3
{
  return sub_100CBFC58((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteInt32Field(a3, self->_workoutType, 2LL);
  }
  sessionId = self->_sessionId;
  if (sessionId) {
    PBDataWriterWriteDataField(a3, sessionId, 3LL);
  }
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 4) = self->_workoutEvent;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)a3 + 5) = self->_workoutType;
    *((_BYTE *)a3 + 24) |= 1u;
  }

  sessionId = self->_sessionId;
  if (sessionId) {
    [a3 setSessionId:sessionId];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  id v7 = objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "init");
  v8 = v7;
  *((_DWORD *)v7 + 4) = self->_workoutEvent;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v7 + 5) = self->_workoutType;
    *((_BYTE *)v7 + 24) |= 1u;
  }

  v8[1] = -[NSData copyWithZone:](self->_sessionId, "copyWithZone:", a3);
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  unsigned int v7 = objc_msgSend(a3, "isMemberOfClass:", v6, v5);
  if (v7)
  {
    if (self->_workoutEvent != *((_DWORD *)a3 + 4))
    {
LABEL_10:
      LOBYTE(v7) = 0;
      return v7;
    }

    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 24) & 1) == 0 || self->_workoutType != *((_DWORD *)a3 + 5)) {
        goto LABEL_10;
      }
    }

    else if ((*((_BYTE *)a3 + 24) & 1) != 0)
    {
      goto LABEL_10;
    }

    sessionId = self->_sessionId;
    else {
      LOBYTE(v7) = 1;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v2 = 2654435761LL * self->_workoutType;
  }
  else {
    uint64_t v2 = 0LL;
  }
  uint64_t v3 = 2654435761LL * self->_workoutEvent;
  return v2 ^ (unint64_t)-[NSData hash](self->_sessionId, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  self->_uint64_t workoutEvent = *((_DWORD *)a3 + 4);
  if ((*((_BYTE *)a3 + 24) & 1) != 0)
  {
    self->_int workoutType = *((_DWORD *)a3 + 5);
    *(_BYTE *)&self->_has |= 1u;
  }

  if (*((void *)a3 + 1)) {
    -[ALCMWorkoutEventDeprecated setSessionId:](self, "setSessionId:");
  }
}

- (int)workoutEvent
{
  return self->_workoutEvent;
}

- (void)setWorkoutEvent:(int)a3
{
  self->_uint64_t workoutEvent = a3;
}

- (NSData)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
}

@end
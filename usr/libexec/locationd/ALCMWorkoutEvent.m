@interface ALCMWorkoutEvent
- (BOOL)hasEndTime;
- (BOOL)hasLocationType;
- (BOOL)hasSessionId;
- (BOOL)hasWorkoutType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)sessionId;
- (double)endTime;
- (double)startTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)locationTypeAsString:(int)a3;
- (id)workoutEventAsString:(int)a3;
- (id)workoutTypeAsString:(int)a3;
- (int)StringAsLocationType:(id)a3;
- (int)StringAsWorkoutEvent:(id)a3;
- (int)StringAsWorkoutType:(id)a3;
- (int)locationType;
- (int)workoutEvent;
- (int)workoutType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setEndTime:(double)a3;
- (void)setHasEndTime:(BOOL)a3;
- (void)setHasLocationType:(BOOL)a3;
- (void)setHasWorkoutType:(BOOL)a3;
- (void)setLocationType:(int)a3;
- (void)setSessionId:(id)a3;
- (void)setStartTime:(double)a3;
- (void)setWorkoutEvent:(int)a3;
- (void)setWorkoutType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCMWorkoutEvent

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALCMWorkoutEvent;
  -[ALCMWorkoutEvent dealloc](&v3, "dealloc");
}

- (id)workoutEventAsString:(int)a3
{
  if (a3 >= 6) {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
  }
  else {
    return *(&off_1018909D8 + a3);
  }
}

- (int)StringAsWorkoutEvent:(id)a3
{
  return 0;
}

- (void)setEndTime:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_endTime = a3;
}

- (void)setHasEndTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEndTime
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)workoutType
{
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    return self->_workoutType;
  }
  else {
    return 0;
  }
}

- (void)setWorkoutType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_workoutType = a3;
}

- (void)setHasWorkoutType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasWorkoutType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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

- (int)locationType
{
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    return self->_locationType;
  }
  else {
    return 0;
  }
}

- (void)setLocationType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_locationType = a3;
}

- (void)setHasLocationType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLocationType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)locationTypeAsString:(int)a3
{
  if (a3 >= 3) {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
  }
  else {
    return *(&off_101890A08 + a3);
  }
}

- (int)StringAsLocationType:(id)a3
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
  v3.super_class = (Class)&OBJC_CLASS___ALCMWorkoutEvent;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[ALCMWorkoutEvent description](&v3, "description"),  -[ALCMWorkoutEvent dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  uint64_t workoutEvent = self->_workoutEvent;
  if (workoutEvent >= 6) {
    v5 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_workoutEvent);
  }
  else {
    v5 = (NSString *)*(&off_1018909D8 + workoutEvent);
  }
  [v3 setObject:v5 forKey:@"workoutEvent"];
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_startTime),  @"startTime");
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0) {
      goto LABEL_6;
    }
LABEL_9:
    int workoutType = self->_workoutType;
    if (workoutType > 2023)
    {
      if (workoutType <= 11804)
      {
        if (workoutType <= 2070)
        {
          if (workoutType > 2060)
          {
            if (workoutType == 2061)
            {
              v8 = @"kTypeCrossTraining";
              goto LABEL_88;
            }

            if (workoutType == 2065)
            {
              v8 = @"kTypeStairClimbing";
              goto LABEL_88;
            }
          }

          else
          {
            if (workoutType == 2024)
            {
              v8 = @"kTypeCoreTraining";
              goto LABEL_88;
            }

            if (workoutType == 2048)
            {
              v8 = @"kTypeElliptical";
              goto LABEL_88;
            }
          }
        }

        else if (workoutType <= 2104)
        {
          if (workoutType == 2071)
          {
            v8 = @"kTypeRowing";
            goto LABEL_88;
          }

          if (workoutType == 2101)
          {
            v8 = @"kTypeCoolDown";
            goto LABEL_88;
          }
        }

        else
        {
          switch(workoutType)
          {
            case 2105:
              v8 = @"kTypePilates";
              goto LABEL_88;
            case 2150:
              v8 = @"kTypeYoga";
              goto LABEL_88;
            case 3015:
              v8 = @"kTypeDancing";
              goto LABEL_88;
          }
        }
      }

      else if (workoutType > 17149)
      {
        if (workoutType <= 18239)
        {
          if (workoutType == 17150)
          {
            v8 = @"kTypeIndoorWalking";
            goto LABEL_88;
          }

          if (workoutType == 18200)
          {
            v8 = @"kTypeScubaDiving";
            goto LABEL_88;
          }
        }

        else
        {
          switch(workoutType)
          {
            case 18240:
              v8 = @"kTypeSwimming";
              goto LABEL_88;
            case 19150:
              v8 = @"kTypeSummer";
              goto LABEL_88;
            case 90603:
              v8 = @"kTypeOutdoorWheelchair";
              goto LABEL_88;
          }
        }
      }

      else if (workoutType <= 15109)
      {
        if (workoutType == 11805)
        {
          v8 = @"kTypePushingWheelchair";
          goto LABEL_88;
        }

        if (workoutType == 12150)
        {
          v8 = @"kTypeIndoorRunning";
          goto LABEL_88;
        }
      }

      else
      {
        switch(workoutType)
        {
          case 15110:
            v8 = @"kTypeKickboxing";
            goto LABEL_88;
          case 15255:
            v8 = @"kTypeGolfing";
            goto LABEL_88;
          case 15670:
            v8 = @"kTypeTaiChi";
            goto LABEL_88;
        }
      }
    }

    else
    {
      if (workoutType <= 40)
      {
        v8 = @"kTypeUnknown";
        switch(workoutType)
        {
          case 0:
            break;
          case 1:
            v8 = @"kTypeFrozen";
            break;
          case 2:
            v8 = @"kTypeStatic";
            break;
          case 3:
            v8 = @"kTypeMoving";
            break;
          case 4:
            v8 = @"kTypeWalking";
            break;
          case 5:
            v8 = @"kTypeDriving";
            break;
          case 6:
            v8 = @"kTypeCycling";
            break;
          case 7:
            v8 = @"kTypeSemiStationary";
            break;
          case 8:
            v8 = @"kTypeRunning";
            break;
          case 9:
            v8 = @"kTypeMovingCoarse";
            break;
          case 10:
            v8 = @"kTypeInVehicleFrozen";
            break;
          case 11:
            v8 = @"kTypeInVehicleStatic";
            break;
          default:
            goto LABEL_87;
        }

- (BOOL)readFrom:(id)a3
{
  return sub_100FA5A40((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField(a3, 3LL, self->_endTime);
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteInt32Field(a3, self->_workoutType, 4LL);
  if ((*(_BYTE *)&self->_has & 2) != 0) {
LABEL_4:
  }
    PBDataWriterWriteInt32Field(a3, self->_locationType, 5LL);
LABEL_5:
  sessionId = self->_sessionId;
  if (sessionId) {
    PBDataWriterWriteDataField(a3, sessionId, 6LL);
  }
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 10) = self->_workoutEvent;
  *((void *)a3 + 2) = *(void *)&self->_startTime;
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((void *)a3 + 1) = *(void *)&self->_endTime;
    *((_BYTE *)a3 + 48) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)a3 + 11) = self->_workoutType;
  *((_BYTE *)a3 + 48) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    *((_DWORD *)a3 + 6) = self->_locationType;
    *((_BYTE *)a3 + 48) |= 2u;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  id v7 = objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "init");
  v8 = v7;
  *((_DWORD *)v7 + 10) = self->_workoutEvent;
  *((void *)v7 + 2) = *(void *)&self->_startTime;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *((_DWORD *)v7 + 11) = self->_workoutType;
    *((_BYTE *)v7 + 48) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }

  *((void *)v7 + 1) = *(void *)&self->_endTime;
  *((_BYTE *)v7 + 48) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *((_DWORD *)v7 + 6) = self->_locationType;
    *((_BYTE *)v7 + 48) |= 2u;
  }

- (BOOL)isEqual:(id)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  unsigned int v7 = objc_msgSend(a3, "isMemberOfClass:", v6, v5);
  if (v7)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
    }

    else if ((*((_BYTE *)a3 + 48) & 1) != 0)
    {
LABEL_21:
      LOBYTE(v7) = 0;
      return v7;
    }

    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 4) == 0 || self->_workoutType != *((_DWORD *)a3 + 11)) {
        goto LABEL_21;
      }
    }

    else if ((*((_BYTE *)a3 + 48) & 4) != 0)
    {
      goto LABEL_21;
    }

    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 2) == 0 || self->_locationType != *((_DWORD *)a3 + 6)) {
        goto LABEL_21;
      }
    }

    else if ((*((_BYTE *)a3 + 48) & 2) != 0)
    {
      goto LABEL_21;
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
  uint64_t workoutEvent = self->_workoutEvent;
  double startTime = self->_startTime;
  double v5 = -startTime;
  if (startTime >= 0.0) {
    double v5 = self->_startTime;
  }
  double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  double v8 = fmod(v6, 1.84467441e19);
  unint64_t v9 = 2654435761u * (unint64_t)v8;
  unint64_t v10 = v9 + (unint64_t)v7;
  if (v7 <= 0.0) {
    unint64_t v10 = 2654435761u * (unint64_t)v8;
  }
  unint64_t v11 = v9 - (unint64_t)fabs(v7);
  if (v7 < 0.0) {
    unint64_t v12 = v11;
  }
  else {
    unint64_t v12 = v10;
  }
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    double endTime = self->_endTime;
    double v16 = -endTime;
    if (endTime >= 0.0) {
      double v16 = self->_endTime;
    }
    double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }

    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }

  else
  {
    unint64_t v14 = 0LL;
  }

  if ((has & 4) != 0)
  {
    uint64_t v19 = 2654435761LL * self->_workoutType;
    if ((has & 2) != 0) {
      goto LABEL_18;
    }
LABEL_20:
    uint64_t v20 = 0LL;
    return v12 ^ (2654435761LL * workoutEvent) ^ v14 ^ v19 ^ v20 ^ (unint64_t)-[NSData hash]( self->_sessionId,  "hash");
  }

  uint64_t v19 = 0LL;
  if ((has & 2) == 0) {
    goto LABEL_20;
  }
LABEL_18:
  uint64_t v20 = 2654435761LL * self->_locationType;
  return v12 ^ (2654435761LL * workoutEvent) ^ v14 ^ v19 ^ v20 ^ (unint64_t)-[NSData hash]( self->_sessionId,  "hash");
}

- (void)mergeFrom:(id)a3
{
  self->_uint64_t workoutEvent = *((_DWORD *)a3 + 10);
  self->_double startTime = *((double *)a3 + 2);
  char v3 = *((_BYTE *)a3 + 48);
  if ((v3 & 1) != 0)
  {
    self->_double endTime = *((double *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    char v3 = *((_BYTE *)a3 + 48);
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((*((_BYTE *)a3 + 48) & 4) == 0)
  {
    goto LABEL_3;
  }

  self->_int workoutType = *((_DWORD *)a3 + 11);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)a3 + 48) & 2) != 0)
  {
LABEL_4:
    self->_uint64_t locationType = *((_DWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 2u;
  }

- (int)workoutEvent
{
  return self->_workoutEvent;
}

- (void)setWorkoutEvent:(int)a3
{
  self->_uint64_t workoutEvent = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_double startTime = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (NSData)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
}

@end
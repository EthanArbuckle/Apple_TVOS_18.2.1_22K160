@interface ALCMCalorieData
- (BOOL)hasMetsFM;
- (BOOL)hasMetsHR;
- (BOOL)hasMetsWR;
- (BOOL)hasTruthMetsSource;
- (BOOL)hasUserMetsSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStanding;
- (BOOL)readFrom:(id)a3;
- (double)truthMets;
- (double)userMets;
- (float)metsFM;
- (float)metsHR;
- (float)metsWR;
- (id)activityTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)truthMetsSourceAsString:(int)a3;
- (id)userMetsSourceAsString:(int)a3;
- (int)StringAsActivityType:(id)a3;
- (int)StringAsTruthMetsSource:(id)a3;
- (int)StringAsUserMetsSource:(id)a3;
- (int)activityType;
- (int)truthMetsSource;
- (int)userMetsSource;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivityType:(int)a3;
- (void)setHasMetsFM:(BOOL)a3;
- (void)setHasMetsHR:(BOOL)a3;
- (void)setHasMetsWR:(BOOL)a3;
- (void)setHasTruthMetsSource:(BOOL)a3;
- (void)setHasUserMetsSource:(BOOL)a3;
- (void)setIsStanding:(BOOL)a3;
- (void)setMetsFM:(float)a3;
- (void)setMetsHR:(float)a3;
- (void)setMetsWR:(float)a3;
- (void)setTruthMets:(double)a3;
- (void)setTruthMetsSource:(int)a3;
- (void)setUserMets:(double)a3;
- (void)setUserMetsSource:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCMCalorieData

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

- (int)userMetsSource
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0) {
    return self->_userMetsSource;
  }
  else {
    return 0;
  }
}

- (void)setUserMetsSource:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_userMetsSource = a3;
}

- (void)setHasUserMetsSource:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasUserMetsSource
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)userMetsSourceAsString:(int)a3
{
  if (a3 >= 5) {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
  }
  else {
    return off_10183EFF0[a3];
  }
}

- (int)StringAsUserMetsSource:(id)a3
{
  return 0;
}

- (int)truthMetsSource
{
  if ((*(_BYTE *)&self->_has & 8) != 0) {
    return self->_truthMetsSource;
  }
  else {
    return 0;
  }
}

- (void)setTruthMetsSource:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_truthMetsSource = a3;
}

- (void)setHasTruthMetsSource:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTruthMetsSource
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)truthMetsSourceAsString:(int)a3
{
  if (a3 >= 5) {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
  }
  else {
    return off_10183EFF0[a3];
  }
}

- (int)StringAsTruthMetsSource:(id)a3
{
  return 0;
}

- (void)setMetsHR:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_metsHR = a3;
}

- (void)setHasMetsHR:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMetsHR
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setMetsWR:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_metsWR = a3;
}

- (void)setHasMetsWR:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMetsWR
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setMetsFM:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_metsFM = a3;
}

- (void)setHasMetsFM:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMetsFM
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALCMCalorieData;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[ALCMCalorieData description](&v3, "description"),  -[ALCMCalorieData dictionaryRepresentation](self, "dictionaryRepresentation"));
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
  return sub_10052BE84((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field(a3, self->_userMetsSource, 5LL);
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }

  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteInt32Field(a3, self->_truthMetsSource, 6LL);
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 6) = self->_activityType;
  *((_BYTE *)a3 + 48) = self->_isStanding;
  *((void *)a3 + 2) = *(void *)&self->_userMets;
  *((void *)a3 + 1) = *(void *)&self->_truthMets;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 11) = self->_userMetsSource;
    *((_BYTE *)a3 + 52) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }

  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)a3 + 10) = self->_truthMetsSource;
  *((_BYTE *)a3 + 52) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 6) = self->_activityType;
  *((_BYTE *)result + 48) = self->_isStanding;
  *((void *)result + 2) = *(void *)&self->_userMets;
  *((void *)result + 1) = *(void *)&self->_truthMets;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)result + 11) = self->_userMetsSource;
    *((_BYTE *)result + 52) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }

  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)result + 10) = self->_truthMetsSource;
  *((_BYTE *)result + 52) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class(self)];
  if (!v5) {
    return v5;
  }
  if (self->_activityType != *((_DWORD *)a3 + 6)) {
    goto LABEL_33;
  }
  if (self->_isStanding)
  {
    if (!*((_BYTE *)a3 + 48)) {
      goto LABEL_33;
    }
    goto LABEL_7;
  }

  if (*((_BYTE *)a3 + 48))
  {
LABEL_33:
    LOBYTE(v5) = 0;
    return v5;
  }

- (unint64_t)hash
{
  uint64_t activityType = self->_activityType;
  BOOL isStanding = self->_isStanding;
  double userMets = self->_userMets;
  double v5 = -userMets;
  if (userMets >= 0.0) {
    double v5 = self->_userMets;
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
  double truthMets = self->_truthMets;
  double v14 = -truthMets;
  if (truthMets >= 0.0) {
    double v14 = self->_truthMets;
  }
  double v15 = floor(v14 + 0.5);
  double v16 = (v14 - v15) * 1.84467441e19;
  double v17 = fmod(v15, 1.84467441e19);
  unint64_t v18 = 2654435761u * (unint64_t)v17;
  unint64_t v19 = v18 + (unint64_t)v16;
  if (v16 <= 0.0) {
    unint64_t v19 = 2654435761u * (unint64_t)v17;
  }
  unint64_t v20 = v18 - (unint64_t)fabs(v16);
  if (v16 < 0.0) {
    unint64_t v21 = v20;
  }
  else {
    unint64_t v21 = v19;
  }
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
    uint64_t v23 = 0LL;
    if ((*(_BYTE *)&self->_has & 8) != 0) {
      goto LABEL_17;
    }
LABEL_23:
    uint64_t v24 = 0LL;
    if ((*(_BYTE *)&self->_has & 2) != 0) {
      goto LABEL_18;
    }
LABEL_24:
    unint64_t v29 = 0LL;
    goto LABEL_27;
  }

  uint64_t v23 = 2654435761LL * self->_userMetsSource;
  if ((*(_BYTE *)&self->_has & 8) == 0) {
    goto LABEL_23;
  }
LABEL_17:
  uint64_t v24 = 2654435761LL * self->_truthMetsSource;
  if ((*(_BYTE *)&self->_has & 2) == 0) {
    goto LABEL_24;
  }
LABEL_18:
  float metsHR = self->_metsHR;
  float v26 = -metsHR;
  if (metsHR >= 0.0) {
    float v26 = self->_metsHR;
  }
  float v27 = floorf(v26 + 0.5);
  float v28 = (float)(v26 - v27) * 1.8447e19;
  unint64_t v29 = 2654435761u * (unint64_t)fmodf(v27, 1.8447e19);
  if (v28 >= 0.0)
  {
    if (v28 > 0.0) {
      v29 += (unint64_t)v28;
    }
  }

  else
  {
    v29 -= (unint64_t)fabsf(v28);
  }

- (void)mergeFrom:(id)a3
{
  self->_uint64_t activityType = *((_DWORD *)a3 + 6);
  self->_BOOL isStanding = *((_BYTE *)a3 + 48);
  self->_double userMets = *((double *)a3 + 2);
  self->_double truthMets = *((double *)a3 + 1);
  char v3 = *((_BYTE *)a3 + 52);
  if ((v3 & 0x10) != 0)
  {
    self->_uint64_t userMetsSource = *((_DWORD *)a3 + 11);
    *(_BYTE *)&self->_has |= 0x10u;
    char v3 = *((_BYTE *)a3 + 52);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }

  else if ((*((_BYTE *)a3 + 52) & 8) == 0)
  {
    goto LABEL_3;
  }

  self->_uint64_t truthMetsSource = *((_DWORD *)a3 + 10);
  *(_BYTE *)&self->_has |= 8u;
  char v3 = *((_BYTE *)a3 + 52);
  if ((v3 & 2) == 0)
  {
LABEL_4:
    if ((v3 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }

- (int)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(int)a3
{
  self->_uint64_t activityType = a3;
}

- (BOOL)isStanding
{
  return self->_isStanding;
}

- (void)setIsStanding:(BOOL)a3
{
  self->_BOOL isStanding = a3;
}

- (double)userMets
{
  return self->_userMets;
}

- (void)setUserMets:(double)a3
{
  self->_double userMets = a3;
}

- (double)truthMets
{
  return self->_truthMets;
}

- (void)setTruthMets:(double)a3
{
  self->_double truthMets = a3;
}

- (float)metsHR
{
  return self->_metsHR;
}

- (float)metsWR
{
  return self->_metsWR;
}

- (float)metsFM
{
  return self->_metsFM;
}

@end
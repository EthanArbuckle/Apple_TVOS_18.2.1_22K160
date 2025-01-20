@interface ALCMCalorieDataDeprecated
- (BOOL)hasMetsHR;
- (BOOL)hasMetsWR;
- (BOOL)hasRecordId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStanding;
- (BOOL)readFrom:(id)a3;
- (BOOL)regularEntry;
- (double)mets;
- (double)timestamp;
- (float)energyMagnitude;
- (float)meanAngleX;
- (float)metsHR;
- (float)metsWR;
- (id)activityTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)metSourceAsString:(int)a3;
- (int)StringAsActivityType:(id)a3;
- (int)StringAsMetSource:(id)a3;
- (int)activityType;
- (int)metSource;
- (int)recordId;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivityType:(int)a3;
- (void)setEnergyMagnitude:(float)a3;
- (void)setHasMetsHR:(BOOL)a3;
- (void)setHasMetsWR:(BOOL)a3;
- (void)setHasRecordId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setIsStanding:(BOOL)a3;
- (void)setMeanAngleX:(float)a3;
- (void)setMetSource:(int)a3;
- (void)setMets:(double)a3;
- (void)setMetsHR:(float)a3;
- (void)setMetsWR:(float)a3;
- (void)setRecordId:(int)a3;
- (void)setRegularEntry:(BOOL)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCMCalorieDataDeprecated

- (void)setRecordId:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_recordId = a3;
}

- (void)setHasRecordId:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRecordId
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

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

- (id)metSourceAsString:(int)a3
{
  if (a3 >= 4) {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
  }
  else {
    return *(&off_101859A98 + a3);
  }
}

- (int)StringAsMetSource:(id)a3
{
  return 0;
}

- (void)setTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
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

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALCMCalorieDataDeprecated;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[ALCMCalorieDataDeprecated description](&v3, "description"),  -[ALCMCalorieDataDeprecated dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  if ((*(_BYTE *)&self->_has & 8) != 0) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_recordId),  @"recordId");
  }
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
            goto LABEL_82;
          }

          if (activityType == 2065)
          {
            v5 = @"kTypeStairClimbing";
            goto LABEL_82;
          }
        }

        else
        {
          if (activityType == 2024)
          {
            v5 = @"kTypeCoreTraining";
            goto LABEL_82;
          }

          if (activityType == 2048)
          {
            v5 = @"kTypeElliptical";
            goto LABEL_82;
          }
        }
      }

      else if (activityType <= 2104)
      {
        if (activityType == 2071)
        {
          v5 = @"kTypeRowing";
          goto LABEL_82;
        }

        if (activityType == 2101)
        {
          v5 = @"kTypeCoolDown";
          goto LABEL_82;
        }
      }

      else
      {
        switch(activityType)
        {
          case 2105:
            v5 = @"kTypePilates";
            goto LABEL_82;
          case 2150:
            v5 = @"kTypeYoga";
            goto LABEL_82;
          case 3015:
            v5 = @"kTypeDancing";
            goto LABEL_82;
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
          goto LABEL_82;
        }

        if (activityType == 18200)
        {
          v5 = @"kTypeScubaDiving";
          goto LABEL_82;
        }
      }

      else
      {
        switch(activityType)
        {
          case 18240:
            v5 = @"kTypeSwimming";
            goto LABEL_82;
          case 19150:
            v5 = @"kTypeSummer";
            goto LABEL_82;
          case 90603:
            v5 = @"kTypeOutdoorWheelchair";
            goto LABEL_82;
        }
      }
    }

    else if (activityType <= 15109)
    {
      if (activityType == 11805)
      {
        v5 = @"kTypePushingWheelchair";
        goto LABEL_82;
      }

      if (activityType == 12150)
      {
        v5 = @"kTypeIndoorRunning";
        goto LABEL_82;
      }
    }

    else
    {
      switch(activityType)
      {
        case 15110:
          v5 = @"kTypeKickboxing";
          goto LABEL_82;
        case 15255:
          v5 = @"kTypeGolfing";
          goto LABEL_82;
        case 15670:
          v5 = @"kTypeTaiChi";
          goto LABEL_82;
      }
    }

- (BOOL)readFrom:(id)a3
{
  return sub_10082AD64((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 8) != 0) {
    PBDataWriterWriteInt32Field(a3, self->_recordId, 1LL);
  }
  PBDataWriterWriteInt32Field(a3, self->_activityType, 2LL);
  PBDataWriterWriteBOOLField(a3, self->_isStanding, 3LL);
  PBDataWriterWriteDoubleField(a3, 4LL, self->_mets);
  PBDataWriterWriteInt32Field(a3, self->_metSource, 5LL);
  PBDataWriterWriteFloatField(a3, 6LL, self->_meanAngleX);
  PBDataWriterWriteFloatField(a3, 7LL, self->_energyMagnitude);
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteDoubleField(a3, 9LL, self->_timestamp);
  }
  PBDataWriterWriteBOOLField(a3, self->_regularEntry, 10LL);
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField(a3, 11LL, self->_metsHR);
    char has = (char)self->_has;
  }

  if ((has & 4) != 0) {
    PBDataWriterWriteFloatField(a3, 12LL, self->_metsWR);
  }
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_DWORD *)a3 + 12) = self->_recordId;
    *((_BYTE *)a3 + 56) |= 8u;
  }

  *((_DWORD *)a3 + 6) = self->_activityType;
  *((_BYTE *)a3 + 52) = self->_isStanding;
  *((void *)a3 + 1) = *(void *)&self->_mets;
  *((_DWORD *)a3 + 9) = self->_metSource;
  *((_DWORD *)a3 + 8) = LODWORD(self->_meanAngleX);
  *((_DWORD *)a3 + 7) = LODWORD(self->_energyMagnitude);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((void *)a3 + 2) = *(void *)&self->_timestamp;
    *((_BYTE *)a3 + 56) |= 1u;
  }

  *((_BYTE *)a3 + 53) = self->_regularEntry;
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0) {
      return;
    }
LABEL_9:
    *((_DWORD *)a3 + 11) = LODWORD(self->_metsWR);
    *((_BYTE *)a3 + 56) |= 4u;
    return;
  }

  *((_DWORD *)a3 + 10) = LODWORD(self->_metsHR);
  *((_BYTE *)a3 + 56) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    goto LABEL_9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  id result = objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "init");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_DWORD *)result + 12) = self->_recordId;
    *((_BYTE *)result + 56) |= 8u;
  }

  *((_DWORD *)result + 6) = self->_activityType;
  *((_BYTE *)result + 52) = self->_isStanding;
  *((void *)result + 1) = *(void *)&self->_mets;
  *((_DWORD *)result + 9) = self->_metSource;
  *((_DWORD *)result + 8) = LODWORD(self->_meanAngleX);
  *((_DWORD *)result + 7) = LODWORD(self->_energyMagnitude);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((void *)result + 2) = *(void *)&self->_timestamp;
    *((_BYTE *)result + 56) |= 1u;
  }

  *((_BYTE *)result + 53) = self->_regularEntry;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 10) = LODWORD(self->_metsHR);
    *((_BYTE *)result + 56) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 11) = LODWORD(self->_metsWR);
    *((_BYTE *)result + 56) |= 4u;
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  unsigned int v7 = objc_msgSend(a3, "isMemberOfClass:", v6, v5);
  if (!v7) {
    return v7;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)a3 + 56) & 8) == 0 || self->_recordId != *((_DWORD *)a3 + 12)) {
      goto LABEL_34;
    }
  }

  else if ((*((_BYTE *)a3 + 56) & 8) != 0)
  {
    goto LABEL_34;
  }

  if (self->_activityType != *((_DWORD *)a3 + 6)) {
    goto LABEL_34;
  }
  if (self->_isStanding)
  {
    if (!*((_BYTE *)a3 + 52)) {
      goto LABEL_34;
    }
  }

  else if (*((_BYTE *)a3 + 52))
  {
    goto LABEL_34;
  }

  if (self->_mets != *((double *)a3 + 1)
    || self->_metSource != *((_DWORD *)a3 + 9)
    || self->_meanAngleX != *((float *)a3 + 8)
    || self->_energyMagnitude != *((float *)a3 + 7))
  {
    goto LABEL_34;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
  }

  else if ((*((_BYTE *)a3 + 56) & 1) != 0)
  {
    goto LABEL_34;
  }

  if (self->_regularEntry)
  {
    if (!*((_BYTE *)a3 + 53)) {
      goto LABEL_34;
    }
    goto LABEL_25;
  }

  if (*((_BYTE *)a3 + 53))
  {
LABEL_34:
    LOBYTE(v7) = 0;
    return v7;
  }

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    uint64_t v56 = 2654435761LL * self->_recordId;
  }
  else {
    uint64_t v56 = 0LL;
  }
  BOOL isStanding = self->_isStanding;
  uint64_t activityType = self->_activityType;
  double mets = self->_mets;
  double v5 = -mets;
  if (mets >= 0.0) {
    double v5 = self->_mets;
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
  uint64_t metSource = self->_metSource;
  float meanAngleX = self->_meanAngleX;
  float v15 = -meanAngleX;
  if (meanAngleX >= 0.0) {
    float v15 = self->_meanAngleX;
  }
  float v16 = floorf(v15 + 0.5);
  float v17 = (float)(v15 - v16) * 1.8447e19;
  float v18 = fmodf(v16, 1.8447e19);
  unint64_t v19 = 2654435761u * (unint64_t)v18;
  unint64_t v20 = v19 + (unint64_t)v17;
  if (v17 <= 0.0) {
    unint64_t v20 = 2654435761u * (unint64_t)v18;
  }
  unint64_t v21 = v19 - (unint64_t)fabsf(v17);
  if (v17 < 0.0) {
    unint64_t v22 = v21;
  }
  else {
    unint64_t v22 = v20;
  }
  float energyMagnitude = self->_energyMagnitude;
  float v24 = -energyMagnitude;
  if (energyMagnitude >= 0.0) {
    float v24 = self->_energyMagnitude;
  }
  float v25 = floorf(v24 + 0.5);
  float v26 = (float)(v24 - v25) * 1.8447e19;
  float v27 = fmodf(v25, 1.8447e19);
  unint64_t v28 = 2654435761u * (unint64_t)v27;
  unint64_t v29 = v28 + (unint64_t)v26;
  if (v26 <= 0.0) {
    unint64_t v29 = 2654435761u * (unint64_t)v27;
  }
  unint64_t v30 = v28 - (unint64_t)fabsf(v26);
  if (v26 < 0.0) {
    unint64_t v31 = v30;
  }
  else {
    unint64_t v31 = v29;
  }
  if ((has & 1) != 0)
  {
    double timestamp = self->_timestamp;
    double v34 = -timestamp;
    if (timestamp >= 0.0) {
      double v34 = self->_timestamp;
    }
    double v35 = floor(v34 + 0.5);
    double v36 = (v34 - v35) * 1.84467441e19;
    unint64_t v32 = 2654435761u * (unint64_t)fmod(v35, 1.84467441e19);
    if (v36 >= 0.0)
    {
      if (v36 > 0.0) {
        v32 += (unint64_t)v36;
      }
    }

    else
    {
      v32 -= (unint64_t)fabs(v36);
    }
  }

  else
  {
    unint64_t v32 = 0LL;
  }

  BOOL regularEntry = self->_regularEntry;
  if ((has & 2) != 0)
  {
    float metsHR = self->_metsHR;
    float v40 = -metsHR;
    if (metsHR >= 0.0) {
      float v40 = self->_metsHR;
    }
    float v41 = floorf(v40 + 0.5);
    float v42 = (float)(v40 - v41) * 1.8447e19;
    float v43 = fmodf(v41, 1.8447e19);
    unint64_t v44 = 2654435761u * (unint64_t)v43;
    if (v42 >= 0.0)
    {
      if (v42 > 0.0) {
        unint64_t v38 = v44 + (unint64_t)v42;
      }
      else {
        unint64_t v38 = 2654435761u * (unint64_t)v43;
      }
      if ((has & 4) == 0) {
        goto LABEL_51;
      }
    }

    else
    {
      unint64_t v38 = v44 - (unint64_t)fabsf(v42);
      if ((has & 4) == 0)
      {
LABEL_51:
        unint64_t v52 = 0LL;
        return (2654435761LL * activityType) ^ (2654435761LL * metSource) ^ v22 ^ v31 ^ v56 ^ (2654435761LL * isStanding) ^ v12 ^ v32 ^ (2654435761LL * regularEntry) ^ v38 ^ v52;
      }
    }
  }

  else
  {
    unint64_t v38 = 0LL;
    if ((has & 4) == 0) {
      goto LABEL_51;
    }
  }

  float metsWR = self->_metsWR;
  float v46 = -metsWR;
  if (metsWR >= 0.0) {
    float v46 = self->_metsWR;
  }
  float v47 = floorf(v46 + 0.5);
  float v48 = (float)(v46 - v47) * 1.8447e19;
  float v49 = fmodf(v47, 1.8447e19);
  unint64_t v50 = 2654435761u * (unint64_t)v49;
  unint64_t v51 = v50 + (unint64_t)v48;
  if (v48 <= 0.0) {
    unint64_t v51 = 2654435761u * (unint64_t)v49;
  }
  unint64_t v52 = v50 - (unint64_t)fabsf(v48);
  if (v48 >= 0.0) {
    unint64_t v52 = v51;
  }
  return (2654435761LL * activityType) ^ (2654435761LL * metSource) ^ v22 ^ v31 ^ v56 ^ (2654435761LL * isStanding) ^ v12 ^ v32 ^ (2654435761LL * regularEntry) ^ v38 ^ v52;
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 56) & 8) != 0)
  {
    self->_recordId = *((_DWORD *)a3 + 12);
    *(_BYTE *)&self->_has |= 8u;
  }

  self->_uint64_t activityType = *((_DWORD *)a3 + 6);
  self->_BOOL isStanding = *((_BYTE *)a3 + 52);
  self->_double mets = *((double *)a3 + 1);
  self->_uint64_t metSource = *((_DWORD *)a3 + 9);
  self->_float meanAngleX = *((float *)a3 + 8);
  self->_float energyMagnitude = *((float *)a3 + 7);
  if ((*((_BYTE *)a3 + 56) & 1) != 0)
  {
    self->_double timestamp = *((double *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }

  self->_BOOL regularEntry = *((_BYTE *)a3 + 53);
  if ((*((_BYTE *)a3 + 56) & 2) == 0)
  {
    if ((*((_BYTE *)a3 + 56) & 4) == 0) {
      return;
    }
LABEL_9:
    self->_float metsWR = *((float *)a3 + 11);
    *(_BYTE *)&self->_has |= 4u;
    return;
  }

  self->_float metsHR = *((float *)a3 + 10);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)a3 + 56) & 4) != 0) {
    goto LABEL_9;
  }
}

- (int)recordId
{
  return self->_recordId;
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

- (double)mets
{
  return self->_mets;
}

- (void)setMets:(double)a3
{
  self->_double mets = a3;
}

- (int)metSource
{
  return self->_metSource;
}

- (void)setMetSource:(int)a3
{
  self->_uint64_t metSource = a3;
}

- (float)meanAngleX
{
  return self->_meanAngleX;
}

- (void)setMeanAngleX:(float)a3
{
  self->_float meanAngleX = a3;
}

- (float)energyMagnitude
{
  return self->_energyMagnitude;
}

- (void)setEnergyMagnitude:(float)a3
{
  self->_float energyMagnitude = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (BOOL)regularEntry
{
  return self->_regularEntry;
}

- (void)setRegularEntry:(BOOL)a3
{
  self->_BOOL regularEntry = a3;
}

- (float)metsHR
{
  return self->_metsHR;
}

- (float)metsWR
{
  return self->_metsWR;
}

@end
@interface ALCLRowingModel
- (BOOL)hasStrokeAmp;
- (BOOL)hasStrokeFrequency;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)strokeAmp;
- (float)strokeFrequency;
- (float)strokePower;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasStrokeAmp:(BOOL)a3;
- (void)setHasStrokeFrequency:(BOOL)a3;
- (void)setStrokeAmp:(float)a3;
- (void)setStrokeFrequency:(float)a3;
- (void)setStrokePower:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCLRowingModel

- (void)setStrokeAmp:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_strokeAmp = a3;
}

- (void)setHasStrokeAmp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStrokeAmp
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setStrokeFrequency:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_strokeFrequency = a3;
}

- (void)setHasStrokeFrequency:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStrokeFrequency
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALCLRowingModel;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[ALCLRowingModel description](&v3, "description"),  -[ALCLRowingModel dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  *(float *)&double v4 = self->_strokePower;
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4),  @"strokePower");
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(float *)&double v5 = self->_strokeAmp;
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5),  @"strokeAmp");
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    *(float *)&double v5 = self->_strokeFrequency;
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5),  @"strokeFrequency");
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1006D0AF8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteFloatField(a3, 2LL, self->_strokeAmp);
    char has = (char)self->_has;
  }

  if ((has & 2) != 0) {
    PBDataWriterWriteFloatField(a3, 3LL, self->_strokeFrequency);
  }
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 4) = LODWORD(self->_strokePower);
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0) {
      return;
    }
LABEL_5:
    *((_DWORD *)a3 + 3) = LODWORD(self->_strokeFrequency);
    *((_BYTE *)a3 + 20) |= 2u;
    return;
  }

  *((_DWORD *)a3 + 2) = LODWORD(self->_strokeAmp);
  *((_BYTE *)a3 + 20) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    goto LABEL_5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 4) = LODWORD(self->_strokePower);
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)result + 2) = LODWORD(self->_strokeAmp);
    *((_BYTE *)result + 20) |= 1u;
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = LODWORD(self->_strokeFrequency);
    *((_BYTE *)result + 20) |= 2u;
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class(self)];
  if (v5)
  {
    if (self->_strokePower != *((float *)a3 + 4))
    {
LABEL_12:
      LOBYTE(v5) = 0;
      return v5;
    }

    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
    }

    else if ((*((_BYTE *)a3 + 20) & 1) != 0)
    {
      goto LABEL_12;
    }

    LOBYTE(v5) = (*((_BYTE *)a3 + 20) & 2) == 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      LOBYTE(v5) = 1;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  float strokePower = self->_strokePower;
  float v4 = -strokePower;
  if (strokePower >= 0.0) {
    float v4 = self->_strokePower;
  }
  float v5 = floorf(v4 + 0.5);
  float v6 = (float)(v4 - v5) * 1.8447e19;
  float v7 = fmodf(v5, 1.8447e19);
  unint64_t v8 = 2654435761u * (unint64_t)v7;
  unint64_t v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0) {
    unint64_t v9 = 2654435761u * (unint64_t)v7;
  }
  unint64_t v10 = v8 - (unint64_t)fabsf(v6);
  if (v6 < 0.0) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v9;
  }
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    float strokeAmp = self->_strokeAmp;
    float v15 = -strokeAmp;
    if (strokeAmp >= 0.0) {
      float v15 = self->_strokeAmp;
    }
    float v16 = floorf(v15 + 0.5);
    float v17 = (float)(v15 - v16) * 1.8447e19;
    float v18 = fmodf(v16, 1.8447e19);
    unint64_t v19 = 2654435761u * (unint64_t)v18;
    if (v17 >= 0.0)
    {
      if (v17 > 0.0) {
        unint64_t v13 = v19 + (unint64_t)v17;
      }
      else {
        unint64_t v13 = 2654435761u * (unint64_t)v18;
      }
      if ((has & 2) == 0) {
        goto LABEL_26;
      }
    }

    else
    {
      unint64_t v13 = v19 - (unint64_t)fabsf(v17);
      if ((has & 2) == 0)
      {
LABEL_26:
        unint64_t v27 = 0LL;
        return v13 ^ v11 ^ v27;
      }
    }
  }

  else
  {
    unint64_t v13 = 0LL;
    if ((*(_BYTE *)&self->_has & 2) == 0) {
      goto LABEL_26;
    }
  }

  float strokeFrequency = self->_strokeFrequency;
  float v21 = -strokeFrequency;
  if (strokeFrequency >= 0.0) {
    float v21 = self->_strokeFrequency;
  }
  float v22 = floorf(v21 + 0.5);
  float v23 = (float)(v21 - v22) * 1.8447e19;
  float v24 = fmodf(v22, 1.8447e19);
  unint64_t v25 = 2654435761u * (unint64_t)v24;
  unint64_t v26 = v25 + (unint64_t)v23;
  if (v23 <= 0.0) {
    unint64_t v26 = 2654435761u * (unint64_t)v24;
  }
  unint64_t v27 = v25 - (unint64_t)fabsf(v23);
  if (v23 >= 0.0) {
    unint64_t v27 = v26;
  }
  return v13 ^ v11 ^ v27;
}

- (void)mergeFrom:(id)a3
{
  self->_float strokePower = *((float *)a3 + 4);
  if ((*((_BYTE *)a3 + 20) & 1) == 0)
  {
    if ((*((_BYTE *)a3 + 20) & 2) == 0) {
      return;
    }
LABEL_5:
    self->_float strokeFrequency = *((float *)a3 + 3);
    *(_BYTE *)&self->_has |= 2u;
    return;
  }

  self->_float strokeAmp = *((float *)a3 + 2);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 20) & 2) != 0) {
    goto LABEL_5;
  }
}

- (float)strokePower
{
  return self->_strokePower;
}

- (void)setStrokePower:(float)a3
{
  self->_float strokePower = a3;
}

- (float)strokeAmp
{
  return self->_strokeAmp;
}

- (float)strokeFrequency
{
  return self->_strokeFrequency;
}

@end
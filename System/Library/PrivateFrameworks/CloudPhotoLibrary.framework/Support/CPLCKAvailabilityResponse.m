@interface CPLCKAvailabilityResponse
- (BOOL)allowed;
- (BOOL)hasAllowed;
- (BOOL)hasFeature;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)featureAsString:(int)a3;
- (int)StringAsFeature:(id)a3;
- (int)feature;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAllowed:(BOOL)a3;
- (void)setFeature:(int)a3;
- (void)setHasAllowed:(BOOL)a3;
- (void)setHasFeature:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CPLCKAvailabilityResponse

- (void)setFeature:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_feature = a3;
}

- (void)setHasFeature:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFeature
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)featureAsString:(int)a3
{
  return sub_100040C48(a3);
}

- (int)StringAsFeature:(id)a3
{
  return sub_100040CD8(a3);
}

- (void)setAllowed:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_allowed = a3;
}

- (void)setHasAllowed:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAllowed
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CPLCKAvailabilityResponse;
  id v3 = -[CPLCKAvailabilityResponse description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCKAvailabilityResponse dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = sub_100040C48(self->_feature);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    [v3 setObject:v6 forKey:@"feature"];

    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_allowed));
    [v3 setObject:v7 forKey:@"allowed"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CPLCKAvailabilityResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field(v4, self->_feature, 1LL);
    id v4 = v6;
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField(v6, self->_allowed, 2LL);
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[2] = self->_feature;
    *((_BYTE *)v4 + 16) |= 1u;
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    *((_BYTE *)v4 + 12) = self->_allowed;
    *((_BYTE *)v4 + 16) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_feature;
    *((_BYTE *)result + 16) |= 1u;
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    *((_BYTE *)result + 12) = self->_allowed;
    *((_BYTE *)result + 16) |= 2u;
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 1) == 0 || self->_feature != *((_DWORD *)v4 + 2)) {
      goto LABEL_9;
    }
  }

  else if ((*((_BYTE *)v4 + 16) & 1) != 0)
  {
    goto LABEL_9;
  }

  BOOL v5 = (*((_BYTE *)v4 + 16) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 2) == 0)
    {
LABEL_9:
      BOOL v5 = 0;
      goto LABEL_10;
    }

    if (self->_allowed)
    {
      if (!*((_BYTE *)v4 + 12)) {
        goto LABEL_9;
      }
    }

    else if (*((_BYTE *)v4 + 12))
    {
      goto LABEL_9;
    }

    BOOL v5 = 1;
  }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    uint64_t v2 = 2654435761LL * self->_feature;
    if ((*(_BYTE *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0LL;
    return v3 ^ v2;
  }

  uint64_t v2 = 0LL;
  if ((*(_BYTE *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761LL * self->_allowed;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((_BYTE *)v4 + 16);
  if ((v5 & 1) != 0)
  {
    self->_feature = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
    char v5 = *((_BYTE *)v4 + 16);
  }

  if ((v5 & 2) != 0)
  {
    self->_allowed = *((_BYTE *)v4 + 12);
    *(_BYTE *)&self->_has |= 2u;
  }
}

- (int)feature
{
  return self->_feature;
}

- (BOOL)allowed
{
  return self->_allowed;
}

@end
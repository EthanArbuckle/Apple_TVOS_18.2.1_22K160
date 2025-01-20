@interface UWLLiveActivityEventContent
- (BOOL)contentIsDone;
- (BOOL)hasContentBrandId;
- (BOOL)hasContentCanonicalId;
- (BOOL)hasContentExternalPlayableId;
- (BOOL)hasContentInternalLegId;
- (BOOL)hasContentIsDone;
- (BOOL)hasContentMediaLengthInMilliseconds;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)contentBrandId;
- (NSString)contentCanonicalId;
- (NSString)contentExternalPlayableId;
- (NSString)contentInternalLegId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)contentMediaLengthInMilliseconds;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContentBrandId:(id)a3;
- (void)setContentCanonicalId:(id)a3;
- (void)setContentExternalPlayableId:(id)a3;
- (void)setContentInternalLegId:(id)a3;
- (void)setContentIsDone:(BOOL)a3;
- (void)setContentMediaLengthInMilliseconds:(int64_t)a3;
- (void)setHasContentIsDone:(BOOL)a3;
- (void)setHasContentMediaLengthInMilliseconds:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation UWLLiveActivityEventContent

- (BOOL)hasContentCanonicalId
{
  return self->_contentCanonicalId != 0LL;
}

- (BOOL)hasContentBrandId
{
  return self->_contentBrandId != 0LL;
}

- (BOOL)hasContentExternalPlayableId
{
  return self->_contentExternalPlayableId != 0LL;
}

- (void)setContentMediaLengthInMilliseconds:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_contentMediaLengthInMilliseconds = a3;
}

- (void)setHasContentMediaLengthInMilliseconds:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContentMediaLengthInMilliseconds
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setContentIsDone:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_contentIsDone = a3;
}

- (void)setHasContentIsDone:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasContentIsDone
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasContentInternalLegId
{
  return self->_contentInternalLegId != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___UWLLiveActivityEventContent;
  id v3 = -[UWLLiveActivityEventContent description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UWLLiveActivityEventContent dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  contentCanonicalId = self->_contentCanonicalId;
  if (contentCanonicalId) {
    [v3 setObject:contentCanonicalId forKey:@"content_canonical_id"];
  }
  contentBrandId = self->_contentBrandId;
  if (contentBrandId) {
    [v4 setObject:contentBrandId forKey:@"content_brand_id"];
  }
  contentExternalPlayableId = self->_contentExternalPlayableId;
  if (contentExternalPlayableId) {
    [v4 setObject:contentExternalPlayableId forKey:@"content_external_playable_id"];
  }
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  self->_contentMediaLengthInMilliseconds));
    [v4 setObject:v9 forKey:@"content_media_length_in_milliseconds"];

    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_contentIsDone));
    [v4 setObject:v10 forKey:@"content_is_done"];
  }

  contentInternalLegId = self->_contentInternalLegId;
  if (contentInternalLegId) {
    [v4 setObject:contentInternalLegId forKey:@"content_internal_leg_id"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return UWLLiveActivityEventContentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  contentCanonicalId = self->_contentCanonicalId;
  id v10 = v4;
  if (contentCanonicalId)
  {
    PBDataWriterWriteStringField(v4, contentCanonicalId, 1LL);
    id v4 = v10;
  }

  contentBrandId = self->_contentBrandId;
  if (contentBrandId)
  {
    PBDataWriterWriteStringField(v10, contentBrandId, 2LL);
    id v4 = v10;
  }

  contentExternalPlayableId = self->_contentExternalPlayableId;
  if (contentExternalPlayableId)
  {
    PBDataWriterWriteStringField(v10, contentExternalPlayableId, 3LL);
    id v4 = v10;
  }

  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field(v10, self->_contentMediaLengthInMilliseconds, 4LL);
    id v4 = v10;
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField(v10, self->_contentIsDone, 5LL);
    id v4 = v10;
  }

  contentInternalLegId = self->_contentInternalLegId;
  if (contentInternalLegId)
  {
    PBDataWriterWriteStringField(v10, contentInternalLegId, 6LL);
    id v4 = v10;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_contentCanonicalId)
  {
    objc_msgSend(v4, "setContentCanonicalId:");
    id v4 = v6;
  }

  if (self->_contentBrandId)
  {
    objc_msgSend(v6, "setContentBrandId:");
    id v4 = v6;
  }

  if (self->_contentExternalPlayableId)
  {
    objc_msgSend(v6, "setContentExternalPlayableId:");
    id v4 = v6;
  }

  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((void *)v4 + 1) = self->_contentMediaLengthInMilliseconds;
    *((_BYTE *)v4 + 52) |= 1u;
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    *((_BYTE *)v4 + 48) = self->_contentIsDone;
    *((_BYTE *)v4 + 52) |= 2u;
  }

  if (self->_contentInternalLegId)
  {
    objc_msgSend(v6, "setContentInternalLegId:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_contentCanonicalId, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = -[NSString copyWithZone:](self->_contentBrandId, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = -[NSString copyWithZone:](self->_contentExternalPlayableId, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5[1] = self->_contentMediaLengthInMilliseconds;
    *((_BYTE *)v5 + 52) |= 1u;
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    *((_BYTE *)v5 + 48) = self->_contentIsDone;
    *((_BYTE *)v5 + 52) |= 2u;
  }

  id v13 = -[NSString copyWithZone:](self->_contentInternalLegId, "copyWithZone:", a3);
  v14 = (void *)v5[5];
  v5[5] = v13;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  contentCanonicalId = self->_contentCanonicalId;
  if ((unint64_t)contentCanonicalId | *((void *)v4 + 3))
  {
  }

  contentBrandId = self->_contentBrandId;
  if ((unint64_t)contentBrandId | *((void *)v4 + 2))
  {
  }

  contentExternalPlayableId = self->_contentExternalPlayableId;
  if ((unint64_t)contentExternalPlayableId | *((void *)v4 + 4))
  {
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_contentMediaLengthInMilliseconds != *((void *)v4 + 1)) {
      goto LABEL_17;
    }
  }

  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_17;
  }

  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0) {
      goto LABEL_23;
    }
LABEL_17:
    unsigned __int8 v9 = 0;
    goto LABEL_18;
  }

  if ((*((_BYTE *)v4 + 52) & 2) == 0) {
    goto LABEL_17;
  }
  if (!self->_contentIsDone)
  {
    if (!*((_BYTE *)v4 + 48)) {
      goto LABEL_23;
    }
    goto LABEL_17;
  }

  if (!*((_BYTE *)v4 + 48)) {
    goto LABEL_17;
  }
LABEL_23:
  contentInternalLegId = self->_contentInternalLegId;
  else {
    unsigned __int8 v9 = 1;
  }
LABEL_18:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_contentCanonicalId, "hash");
  NSUInteger v4 = -[NSString hash](self->_contentBrandId, "hash");
  NSUInteger v5 = -[NSString hash](self->_contentExternalPlayableId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    uint64_t v6 = 2654435761LL * self->_contentMediaLengthInMilliseconds;
    if ((*(_BYTE *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v7 = 0LL;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[NSString hash](self->_contentInternalLegId, "hash");
  }

  uint64_t v6 = 0LL;
  if ((*(_BYTE *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v7 = 2654435761LL * self->_contentIsDone;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[NSString hash](self->_contentInternalLegId, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 3))
  {
    -[UWLLiveActivityEventContent setContentCanonicalId:](self, "setContentCanonicalId:");
    id v4 = v6;
  }

  if (*((void *)v4 + 2))
  {
    -[UWLLiveActivityEventContent setContentBrandId:](self, "setContentBrandId:");
    id v4 = v6;
  }

  if (*((void *)v4 + 4))
  {
    -[UWLLiveActivityEventContent setContentExternalPlayableId:](self, "setContentExternalPlayableId:");
    id v4 = v6;
  }

  char v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 1) != 0)
  {
    self->_contentMediaLengthInMilliseconds = *((void *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    char v5 = *((_BYTE *)v4 + 52);
  }

  if ((v5 & 2) != 0)
  {
    self->_contentIsDone = *((_BYTE *)v4 + 48);
    *(_BYTE *)&self->_has |= 2u;
  }

  if (*((void *)v4 + 5))
  {
    -[UWLLiveActivityEventContent setContentInternalLegId:](self, "setContentInternalLegId:");
    id v4 = v6;
  }
}

- (NSString)contentCanonicalId
{
  return self->_contentCanonicalId;
}

- (void)setContentCanonicalId:(id)a3
{
}

- (NSString)contentBrandId
{
  return self->_contentBrandId;
}

- (void)setContentBrandId:(id)a3
{
}

- (NSString)contentExternalPlayableId
{
  return self->_contentExternalPlayableId;
}

- (void)setContentExternalPlayableId:(id)a3
{
}

- (int64_t)contentMediaLengthInMilliseconds
{
  return self->_contentMediaLengthInMilliseconds;
}

- (BOOL)contentIsDone
{
  return self->_contentIsDone;
}

- (NSString)contentInternalLegId
{
  return self->_contentInternalLegId;
}

- (void)setContentInternalLegId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
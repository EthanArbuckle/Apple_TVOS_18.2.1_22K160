@interface AMPMusicCatalogContent
+ (Class)contentFeaturesType;
- (BOOL)hasAdamId;
- (BOOL)hasCanonicalId;
- (BOOL)hasContentType;
- (BOOL)hasIsExplicit;
- (BOOL)hasReleaseDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExplicit;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)contentFeatures;
- (id)contentFeaturesAtIndex:(unint64_t)a3;
- (id)contentTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsContentType:(id)a3;
- (int)contentType;
- (int64_t)adamId;
- (int64_t)canonicalId;
- (int64_t)releaseDate;
- (unint64_t)contentFeaturesCount;
- (unint64_t)hash;
- (void)addContentFeatures:(id)a3;
- (void)clearContentFeatures;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAdamId:(int64_t)a3;
- (void)setCanonicalId:(int64_t)a3;
- (void)setContentFeatures:(id)a3;
- (void)setContentType:(int)a3;
- (void)setHasAdamId:(BOOL)a3;
- (void)setHasCanonicalId:(BOOL)a3;
- (void)setHasContentType:(BOOL)a3;
- (void)setHasIsExplicit:(BOOL)a3;
- (void)setHasReleaseDate:(BOOL)a3;
- (void)setIsExplicit:(BOOL)a3;
- (void)setReleaseDate:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AMPMusicCatalogContent

- (int)contentType
{
  if ((*(_BYTE *)&self->_has & 8) != 0) {
    return self->_contentType;
  }
  else {
    return 0;
  }
}

- (void)setContentType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_contentType = a3;
}

- (void)setHasContentType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasContentType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)contentTypeAsString:(int)a3
{
  if (a3 >= 5) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return off_1001A5538[a3];
  }
}

- (int)StringAsContentType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Album"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"Song"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"Playlist"])
  {
    int v4 = 2;
  }

  else if ([v3 isEqualToString:@"MusicVideo"])
  {
    int v4 = 3;
  }

  else if ([v3 isEqualToString:@"ArtistUploadedContent"])
  {
    int v4 = 4;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setAdamId:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_adamId = a3;
}

- (void)setHasAdamId:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAdamId
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setCanonicalId:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_canonicalId = a3;
}

- (void)setHasCanonicalId:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCanonicalId
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setReleaseDate:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_releaseDate = a3;
}

- (void)setHasReleaseDate:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasReleaseDate
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setIsExplicit:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isExplicit = a3;
}

- (void)setHasIsExplicit:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsExplicit
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)clearContentFeatures
{
}

- (void)addContentFeatures:(id)a3
{
  id v4 = a3;
  contentFeatures = self->_contentFeatures;
  id v8 = v4;
  if (!contentFeatures)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_contentFeatures;
    self->_contentFeatures = v6;

    id v4 = v8;
    contentFeatures = self->_contentFeatures;
  }

  -[NSMutableArray addObject:](contentFeatures, "addObject:", v4);
}

- (unint64_t)contentFeaturesCount
{
  return (unint64_t)-[NSMutableArray count](self->_contentFeatures, "count");
}

- (id)contentFeaturesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_contentFeatures, "objectAtIndex:", a3);
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AMPMusicCatalogContent;
  id v3 = -[AMPMusicCatalogContent description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMPMusicCatalogContent dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t contentType = self->_contentType;
    if (contentType >= 5) {
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_contentType));
    }
    else {
      v6 = off_1001A5538[contentType];
    }
    [v3 setObject:v6 forKey:@"contentType"];

    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", self->_adamId));
    [v3 setObject:v16 forKey:@"adamId"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_8:
      if ((has & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_23;
    }
  }

  else if ((has & 2) == 0)
  {
    goto LABEL_8;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", self->_canonicalId));
  [v3 setObject:v17 forKey:@"canonicalId"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

- (BOOL)readFrom:(id)a3
{
  return sub_1000CD42C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field(v4, self->_contentType, 1LL);
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }

  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteInt64Field(v5, self->_adamId, 2LL);
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[10] = self->_contentType;
    *((_BYTE *)v4 + 48) |= 8u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }

  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }

  *((void *)v4 + 1) = self->_adamId;
  *((_BYTE *)v4 + 48) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
LABEL_15:
    *((void *)v4 + 3) = self->_releaseDate;
    *((_BYTE *)v4 + 48) |= 4u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)v5 + 10) = self->_contentType;
    *((_BYTE *)v5 + 48) |= 8u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }

  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }

  *((void *)v5 + 1) = self->_adamId;
  *((_BYTE *)v5 + 48) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 8) == 0 || self->_contentType != *((_DWORD *)v4 + 10)) {
      goto LABEL_26;
    }
  }

  else if ((*((_BYTE *)v4 + 48) & 8) != 0)
  {
    goto LABEL_26;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_adamId != *((void *)v4 + 1)) {
      goto LABEL_26;
    }
  }

  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_26;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_canonicalId != *((void *)v4 + 2)) {
      goto LABEL_26;
    }
  }

  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_26;
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 4) == 0 || self->_releaseDate != *((void *)v4 + 3)) {
      goto LABEL_26;
    }
  }

  else if ((*((_BYTE *)v4 + 48) & 4) != 0)
  {
    goto LABEL_26;
  }

  if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    if ((*((_BYTE *)v4 + 48) & 0x10) == 0) {
      goto LABEL_32;
    }
LABEL_26:
    unsigned __int8 v6 = 0;
    goto LABEL_27;
  }

  if ((*((_BYTE *)v4 + 48) & 0x10) == 0) {
    goto LABEL_26;
  }
  if (!self->_isExplicit)
  {
    if (!*((_BYTE *)v4 + 44)) {
      goto LABEL_32;
    }
    goto LABEL_26;
  }

  if (!*((_BYTE *)v4 + 44)) {
    goto LABEL_26;
  }
LABEL_32:
  contentFeatures = self->_contentFeatures;
  else {
    unsigned __int8 v6 = 1;
  }
LABEL_27:

  return v6;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    uint64_t v2 = 2654435761LL * self->_contentType;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761LL * self->_adamId;
      if ((*(_BYTE *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }

  else
  {
    uint64_t v2 = 0LL;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_3;
    }
  }

  uint64_t v3 = 0LL;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761LL * self->_canonicalId;
    if ((*(_BYTE *)&self->_has & 4) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0LL;
    if ((*(_BYTE *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v6 = 0LL;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ (unint64_t)-[NSMutableArray hash](self->_contentFeatures, "hash");
  }

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  char v6 = *((_BYTE *)v4 + 48);
  if ((v6 & 8) != 0)
  {
    self->_uint64_t contentType = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 8u;
    char v6 = *((_BYTE *)v4 + 48);
    if ((v6 & 1) == 0)
    {
LABEL_3:
      if ((v6 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }

  else if ((*((_BYTE *)v4 + 48) & 1) == 0)
  {
    goto LABEL_3;
  }

  self->_adamId = *((void *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  char v6 = *((_BYTE *)v4 + 48);
  if ((v6 & 2) == 0)
  {
LABEL_4:
    if ((v6 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }

- (int64_t)adamId
{
  return self->_adamId;
}

- (int64_t)canonicalId
{
  return self->_canonicalId;
}

- (int64_t)releaseDate
{
  return self->_releaseDate;
}

- (BOOL)isExplicit
{
  return self->_isExplicit;
}

- (NSMutableArray)contentFeatures
{
  return self->_contentFeatures;
}

- (void)setContentFeatures:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (Class)contentFeaturesType
{
  return (Class)objc_opt_class(&OBJC_CLASS___AMPMusicFeature, a2);
}

@end
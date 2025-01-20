@interface TRANSITPbRegionPreloadManifest
- (BOOL)hasExpirationAgeSecs;
- (BOOL)hasGenerationTimeSecs;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)markets;
- (double)generationTimeSecs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)marketsAtIndex:(unint64_t)a3;
- (int)expirationAgeSecs;
- (int)version;
- (unint64_t)hash;
- (unint64_t)marketsCount;
- (void)addMarkets:(id)a3;
- (void)clearMarkets;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setExpirationAgeSecs:(int)a3;
- (void)setGenerationTimeSecs:(double)a3;
- (void)setHasExpirationAgeSecs:(BOOL)a3;
- (void)setHasGenerationTimeSecs:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setMarkets:(id)a3;
- (void)setVersion:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation TRANSITPbRegionPreloadManifest

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TRANSITPbRegionPreloadManifest;
  -[TRANSITPbRegionPreloadManifest dealloc](&v3, "dealloc");
}

- (void)setVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setGenerationTimeSecs:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_generationTimeSecs = a3;
}

- (void)setHasGenerationTimeSecs:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGenerationTimeSecs
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setExpirationAgeSecs:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_expirationAgeSecs = a3;
}

- (void)setHasExpirationAgeSecs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasExpirationAgeSecs
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearMarkets
{
}

- (void)addMarkets:(id)a3
{
  markets = self->_markets;
  if (!markets)
  {
    markets = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    self->_markets = markets;
  }

  -[NSMutableArray addObject:](markets, "addObject:", a3);
}

- (unint64_t)marketsCount
{
  return (unint64_t)-[NSMutableArray count](self->_markets, "count");
}

- (id)marketsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_markets, "objectAtIndex:", a3);
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TRANSITPbRegionPreloadManifest;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[TRANSITPbRegionPreloadManifest description](&v3, "description"),  -[TRANSITPbRegionPreloadManifest dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_version),  @"version");
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }

  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_generationTimeSecs),  @"generationTimeSecs");
  if ((*(_BYTE *)&self->_has & 2) != 0) {
LABEL_4:
  }
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_expirationAgeSecs),  @"expirationAgeSecs");
LABEL_5:
  if (-[NSMutableArray count](self->_markets, "count"))
  {
    v5 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_markets, "count"));
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    markets = self->_markets;
    id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( markets,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(markets);
          }
          -[NSMutableArray addObject:]( v5,  "addObject:",  [*(id *)(*((void *)&v12 + 1) + 8 * (void)i) dictionaryRepresentation]);
        }

        id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( markets,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      }

      while (v8);
    }

    [v3 setObject:v5 forKey:@"markets"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100516C80((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field(a3, self->_version, 1LL);
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteDoubleField(a3, 2LL, self->_generationTimeSecs);
  if ((*(_BYTE *)&self->_has & 2) != 0) {
LABEL_4:
  }
    PBDataWriterWriteInt32Field(a3, self->_expirationAgeSecs, 3LL);
LABEL_5:
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  markets = self->_markets;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( markets,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(markets);
        }
        PBDataWriterWriteSubmessage(a3, *(void *)(*((void *)&v11 + 1) + 8LL * (void)i), 4LL);
      }

      id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( markets,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v8);
  }

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0) {
      goto LABEL_3;
    }
LABEL_11:
    *((void *)a3 + 1) = *(void *)&self->_generationTimeSecs;
    *((_BYTE *)a3 + 36) |= 1u;
    if ((*(_BYTE *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }

  *((_DWORD *)a3 + 8) = self->_version;
  *((_BYTE *)a3 + 36) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) != 0) {
    goto LABEL_11;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *((_DWORD *)a3 + 4) = self->_expirationAgeSecs;
    *((_BYTE *)a3 + 36) |= 2u;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_version;
    *((_BYTE *)v5 + 36) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }

  *((void *)v5 + 1) = *(void *)&self->_generationTimeSecs;
  *((_BYTE *)v5 + 36) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    *((_DWORD *)v5 + 4) = self->_expirationAgeSecs;
    *((_BYTE *)v5 + 36) |= 2u;
  }

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class(self)];
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 4) == 0 || self->_version != *((_DWORD *)a3 + 8)) {
        goto LABEL_19;
      }
    }

    else if ((*((_BYTE *)a3 + 36) & 4) != 0)
    {
LABEL_19:
      LOBYTE(v5) = 0;
      return v5;
    }

    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
    }

    else if ((*((_BYTE *)a3 + 36) & 1) != 0)
    {
      goto LABEL_19;
    }

    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 2) == 0 || self->_expirationAgeSecs != *((_DWORD *)a3 + 4)) {
        goto LABEL_19;
      }
    }

    else if ((*((_BYTE *)a3 + 36) & 2) != 0)
    {
      goto LABEL_19;
    }

    markets = self->_markets;
    else {
      LOBYTE(v5) = 1;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t v4 = 2654435761LL * self->_version;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0LL;
    goto LABEL_11;
  }

  uint64_t v4 = 0LL;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double generationTimeSecs = self->_generationTimeSecs;
  double v6 = -generationTimeSecs;
  if (generationTimeSecs >= 0.0) {
    double v6 = self->_generationTimeSecs;
  }
  double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }

  else
  {
    v9 -= (unint64_t)fabs(v8);
  }

- (void)mergeFrom:(id)a3
{
  char v4 = *((_BYTE *)a3 + 36);
  if ((v4 & 4) != 0)
  {
    self->_version = *((_DWORD *)a3 + 8);
    *(_BYTE *)&self->_has |= 4u;
    char v4 = *((_BYTE *)a3 + 36);
    if ((v4 & 1) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((*((_BYTE *)a3 + 36) & 1) == 0)
  {
    goto LABEL_3;
  }

  self->_double generationTimeSecs = *((double *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 36) & 2) != 0)
  {
LABEL_4:
    self->_expirationAgeSecs = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 2u;
  }

- (int)version
{
  return self->_version;
}

- (double)generationTimeSecs
{
  return self->_generationTimeSecs;
}

- (int)expirationAgeSecs
{
  return self->_expirationAgeSecs;
}

- (NSMutableArray)markets
{
  return self->_markets;
}

- (void)setMarkets:(id)a3
{
}

@end
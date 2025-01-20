@interface TRANSITPbRegionPreloadMarket
- (BOOL)hasNorthWestLatitude;
- (BOOL)hasNorthWestLongitude;
- (BOOL)hasSouthEastLatitude;
- (BOOL)hasSouthEastLongitude;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)tiles;
- (double)northWestLatitude;
- (double)northWestLongitude;
- (double)southEastLatitude;
- (double)southEastLongitude;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)tilesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)tilesCount;
- (void)addTiles:(id)a3;
- (void)clearTiles;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasNorthWestLatitude:(BOOL)a3;
- (void)setHasNorthWestLongitude:(BOOL)a3;
- (void)setHasSouthEastLatitude:(BOOL)a3;
- (void)setHasSouthEastLongitude:(BOOL)a3;
- (void)setNorthWestLatitude:(double)a3;
- (void)setNorthWestLongitude:(double)a3;
- (void)setSouthEastLatitude:(double)a3;
- (void)setSouthEastLongitude:(double)a3;
- (void)setTiles:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TRANSITPbRegionPreloadMarket

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TRANSITPbRegionPreloadMarket;
  -[TRANSITPbRegionPreloadMarket dealloc](&v3, "dealloc");
}

- (void)setNorthWestLatitude:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_northWestLatitude = a3;
}

- (void)setHasNorthWestLatitude:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNorthWestLatitude
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setNorthWestLongitude:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_northWestLongitude = a3;
}

- (void)setHasNorthWestLongitude:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNorthWestLongitude
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSouthEastLatitude:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_southEastLatitude = a3;
}

- (void)setHasSouthEastLatitude:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSouthEastLatitude
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setSouthEastLongitude:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_southEastLongitude = a3;
}

- (void)setHasSouthEastLongitude:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSouthEastLongitude
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)clearTiles
{
}

- (void)addTiles:(id)a3
{
  tiles = self->_tiles;
  if (!tiles)
  {
    tiles = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    self->_tiles = tiles;
  }

  -[NSMutableArray addObject:](tiles, "addObject:", a3);
}

- (unint64_t)tilesCount
{
  return (unint64_t)-[NSMutableArray count](self->_tiles, "count");
}

- (id)tilesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_tiles, "objectAtIndex:", a3);
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TRANSITPbRegionPreloadMarket;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[TRANSITPbRegionPreloadMarket description](&v3, "description"),  -[TRANSITPbRegionPreloadMarket dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_northWestLatitude),  @"northWestLatitude");
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }

  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_northWestLongitude),  @"northWestLongitude");
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

- (BOOL)readFrom:(id)a3
{
  return sub_1005D3124(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField(a3, 1LL, self->_northWestLatitude);
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteDoubleField(a3, 2LL, self->_northWestLongitude);
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((void *)a3 + 1) = *(void *)&self->_northWestLatitude;
    *((_BYTE *)a3 + 48) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
LABEL_13:
      *((void *)a3 + 3) = *(void *)&self->_southEastLatitude;
      *((_BYTE *)a3 + 48) |= 4u;
      if ((*(_BYTE *)&self->_has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }

  *((void *)a3 + 2) = *(void *)&self->_northWestLongitude;
  *((_BYTE *)a3 + 48) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_13;
  }
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *((void *)a3 + 4) = *(void *)&self->_southEastLongitude;
    *((_BYTE *)a3 + 48) |= 8u;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((void *)v5 + 1) = *(void *)&self->_northWestLatitude;
    *((_BYTE *)v5 + 48) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }

  *((void *)v5 + 2) = *(void *)&self->_northWestLongitude;
  *((_BYTE *)v5 + 48) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class(self)];
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
    }

    else if ((*((_BYTE *)a3 + 48) & 1) != 0)
    {
LABEL_24:
      LOBYTE(v5) = 0;
      return v5;
    }

    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
    }

    else if ((*((_BYTE *)a3 + 48) & 2) != 0)
    {
      goto LABEL_24;
    }

    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
    }

    else if ((*((_BYTE *)a3 + 48) & 4) != 0)
    {
      goto LABEL_24;
    }

    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
    }

    else if ((*((_BYTE *)a3 + 48) & 8) != 0)
    {
      goto LABEL_24;
    }

    tiles = self->_tiles;
    else {
      LOBYTE(v5) = 1;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    double northWestLatitude = self->_northWestLatitude;
    double v6 = -northWestLatitude;
    if (northWestLatitude >= 0.0) {
      double v6 = self->_northWestLatitude;
    }
    double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }

    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }

  else
  {
    unint64_t v4 = 0LL;
  }

  if ((has & 2) != 0)
  {
    double northWestLongitude = self->_northWestLongitude;
    double v11 = -northWestLongitude;
    if (northWestLongitude >= 0.0) {
      double v11 = self->_northWestLongitude;
    }
    double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }

    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }

  else
  {
    unint64_t v9 = 0LL;
  }

  if ((has & 4) != 0)
  {
    double southEastLatitude = self->_southEastLatitude;
    double v16 = -southEastLatitude;
    if (southEastLatitude >= 0.0) {
      double v16 = self->_southEastLatitude;
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

  if ((has & 8) != 0)
  {
    double southEastLongitude = self->_southEastLongitude;
    double v21 = -southEastLongitude;
    if (southEastLongitude >= 0.0) {
      double v21 = self->_southEastLongitude;
    }
    double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }

    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }

  else
  {
    unint64_t v19 = 0LL;
  }

  return v9 ^ v4 ^ v14 ^ v19 ^ (unint64_t)-[NSMutableArray hash](self->_tiles, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v4 = *((_BYTE *)a3 + 48);
  if ((v4 & 1) != 0)
  {
    self->_double northWestLatitude = *((double *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    char v4 = *((_BYTE *)a3 + 48);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }

  else if ((*((_BYTE *)a3 + 48) & 2) == 0)
  {
    goto LABEL_3;
  }

  self->_double northWestLongitude = *((double *)a3 + 2);
  *(_BYTE *)&self->_has |= 2u;
  char v4 = *((_BYTE *)a3 + 48);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

- (double)northWestLatitude
{
  return self->_northWestLatitude;
}

- (double)northWestLongitude
{
  return self->_northWestLongitude;
}

- (double)southEastLatitude
{
  return self->_southEastLatitude;
}

- (double)southEastLongitude
{
  return self->_southEastLongitude;
}

- (NSMutableArray)tiles
{
  return self->_tiles;
}

- (void)setTiles:(id)a3
{
}

@end
@interface ALSLocationRequest
+ (Class)cdmaCellTowerType;
+ (Class)cdmaEvdoTowerType;
+ (Class)cellTowerType;
+ (Class)lteCellTowerType;
+ (Class)nr5GCellTowerType;
+ (Class)scdmaCellTowerType;
+ (Class)wirelessAPType;
- (ALSMeta)meta;
- (BOOL)hasAppBundleId;
- (BOOL)hasMeta;
- (BOOL)hasNumberOfSurroundingCdmaCells;
- (BOOL)hasNumberOfSurroundingCdmaEvdoCells;
- (BOOL)hasNumberOfSurroundingCells;
- (BOOL)hasNumberOfSurroundingLteCells;
- (BOOL)hasNumberOfSurroundingNr5GCells;
- (BOOL)hasNumberOfSurroundingScdmaCells;
- (BOOL)hasNumberOfSurroundingWifis;
- (BOOL)hasWifiAltitudeScale;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (NSMutableArray)cdmaCellTowers;
- (NSMutableArray)cdmaEvdoTowers;
- (NSMutableArray)cellTowers;
- (NSMutableArray)lteCellTowers;
- (NSMutableArray)nr5GCellTowers;
- (NSMutableArray)scdmaCellTowers;
- (NSMutableArray)wirelessAPs;
- (NSString)appBundleId;
- (id)cdmaCellTowerAtIndex:(unint64_t)a3;
- (id)cdmaEvdoTowerAtIndex:(unint64_t)a3;
- (id)cellTowerAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)lteCellTowerAtIndex:(unint64_t)a3;
- (id)nr5GCellTowerAtIndex:(unint64_t)a3;
- (id)scdmaCellTowerAtIndex:(unint64_t)a3;
- (id)surroundingWifiBandsAsString:(int)a3;
- (id)wifiAltitudeScaleAsString:(int)a3;
- (id)wirelessAPAtIndex:(unint64_t)a3;
- (int)StringAsSurroundingWifiBands:(id)a3;
- (int)StringAsWifiAltitudeScale:(id)a3;
- (int)numberOfSurroundingCdmaCells;
- (int)numberOfSurroundingCdmaEvdoCells;
- (int)numberOfSurroundingCells;
- (int)numberOfSurroundingLteCells;
- (int)numberOfSurroundingNr5GCells;
- (int)numberOfSurroundingScdmaCells;
- (int)numberOfSurroundingWifis;
- (int)surroundingWifiBands;
- (int)surroundingWifiBandsAtIndex:(unint64_t)a3;
- (int)wifiAltitudeScale;
- (unint64_t)cdmaCellTowersCount;
- (unint64_t)cdmaEvdoTowersCount;
- (unint64_t)cellTowersCount;
- (unint64_t)hash;
- (unint64_t)lteCellTowersCount;
- (unint64_t)nr5GCellTowersCount;
- (unint64_t)scdmaCellTowersCount;
- (unint64_t)surroundingWifiBandsCount;
- (unint64_t)wirelessAPsCount;
- (unsigned)requestTypeCode;
- (void)addCdmaCellTower:(id)a3;
- (void)addCdmaEvdoTower:(id)a3;
- (void)addCellTower:(id)a3;
- (void)addLteCellTower:(id)a3;
- (void)addNr5GCellTower:(id)a3;
- (void)addScdmaCellTower:(id)a3;
- (void)addSurroundingWifiBands:(int)a3;
- (void)addWirelessAP:(id)a3;
- (void)clearCdmaCellTowers;
- (void)clearCdmaEvdoTowers;
- (void)clearCellTowers;
- (void)clearLteCellTowers;
- (void)clearNr5GCellTowers;
- (void)clearScdmaCellTowers;
- (void)clearSurroundingWifiBands;
- (void)clearWirelessAPs;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAppBundleId:(id)a3;
- (void)setCdmaCellTowers:(id)a3;
- (void)setCdmaEvdoTowers:(id)a3;
- (void)setCellTowers:(id)a3;
- (void)setHasNumberOfSurroundingCdmaCells:(BOOL)a3;
- (void)setHasNumberOfSurroundingCdmaEvdoCells:(BOOL)a3;
- (void)setHasNumberOfSurroundingCells:(BOOL)a3;
- (void)setHasNumberOfSurroundingLteCells:(BOOL)a3;
- (void)setHasNumberOfSurroundingNr5GCells:(BOOL)a3;
- (void)setHasNumberOfSurroundingScdmaCells:(BOOL)a3;
- (void)setHasNumberOfSurroundingWifis:(BOOL)a3;
- (void)setHasWifiAltitudeScale:(BOOL)a3;
- (void)setLteCellTowers:(id)a3;
- (void)setMeta:(id)a3;
- (void)setNr5GCellTowers:(id)a3;
- (void)setNumberOfSurroundingCdmaCells:(int)a3;
- (void)setNumberOfSurroundingCdmaEvdoCells:(int)a3;
- (void)setNumberOfSurroundingCells:(int)a3;
- (void)setNumberOfSurroundingLteCells:(int)a3;
- (void)setNumberOfSurroundingNr5GCells:(int)a3;
- (void)setNumberOfSurroundingScdmaCells:(int)a3;
- (void)setNumberOfSurroundingWifis:(int)a3;
- (void)setScdmaCellTowers:(id)a3;
- (void)setSurroundingWifiBands:(int *)a3 count:(unint64_t)a4;
- (void)setWifiAltitudeScale:(int)a3;
- (void)setWirelessAPs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALSLocationRequest

- (void)dealloc
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ALSLocationRequest;
  -[ALSLocationRequest dealloc](&v4, "dealloc");
}

- (void)clearCellTowers
{
}

- (void)addCellTower:(id)a3
{
  cellTowers = self->_cellTowers;
  if (!cellTowers)
  {
    cellTowers = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    self->_cellTowers = cellTowers;
  }

  -[NSMutableArray addObject:](cellTowers, "addObject:", a3);
}

- (unint64_t)cellTowersCount
{
  return (unint64_t)-[NSMutableArray count](self->_cellTowers, "count");
}

- (id)cellTowerAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_cellTowers, "objectAtIndex:", a3);
}

+ (Class)cellTowerType
{
  return (Class)objc_opt_class(&OBJC_CLASS___ALSCellTower);
}

- (void)clearWirelessAPs
{
}

- (void)addWirelessAP:(id)a3
{
  wirelessAPs = self->_wirelessAPs;
  if (!wirelessAPs)
  {
    wirelessAPs = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    self->_wirelessAPs = wirelessAPs;
  }

  -[NSMutableArray addObject:](wirelessAPs, "addObject:", a3);
}

- (unint64_t)wirelessAPsCount
{
  return (unint64_t)-[NSMutableArray count](self->_wirelessAPs, "count");
}

- (id)wirelessAPAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_wirelessAPs, "objectAtIndex:", a3);
}

+ (Class)wirelessAPType
{
  return (Class)objc_opt_class(&OBJC_CLASS___ALSWirelessAP);
}

- (void)setNumberOfSurroundingCells:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_numberOfSurroundingCells = a3;
}

- (void)setHasNumberOfSurroundingCells:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumberOfSurroundingCells
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setNumberOfSurroundingWifis:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_numberOfSurroundingWifis = a3;
}

- (void)setHasNumberOfSurroundingWifis:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasNumberOfSurroundingWifis
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasAppBundleId
{
  return self->_appBundleId != 0LL;
}

- (void)clearCdmaCellTowers
{
}

- (void)addCdmaCellTower:(id)a3
{
  cdmaCellTowers = self->_cdmaCellTowers;
  if (!cdmaCellTowers)
  {
    cdmaCellTowers = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    self->_cdmaCellTowers = cdmaCellTowers;
  }

  -[NSMutableArray addObject:](cdmaCellTowers, "addObject:", a3);
}

- (unint64_t)cdmaCellTowersCount
{
  return (unint64_t)-[NSMutableArray count](self->_cdmaCellTowers, "count");
}

- (id)cdmaCellTowerAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_cdmaCellTowers, "objectAtIndex:", a3);
}

+ (Class)cdmaCellTowerType
{
  return (Class)objc_opt_class(&OBJC_CLASS___ALSCdmaCellTower);
}

- (void)clearCdmaEvdoTowers
{
}

- (void)addCdmaEvdoTower:(id)a3
{
  cdmaEvdoTowers = self->_cdmaEvdoTowers;
  if (!cdmaEvdoTowers)
  {
    cdmaEvdoTowers = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    self->_cdmaEvdoTowers = cdmaEvdoTowers;
  }

  -[NSMutableArray addObject:](cdmaEvdoTowers, "addObject:", a3);
}

- (unint64_t)cdmaEvdoTowersCount
{
  return (unint64_t)-[NSMutableArray count](self->_cdmaEvdoTowers, "count");
}

- (id)cdmaEvdoTowerAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_cdmaEvdoTowers, "objectAtIndex:", a3);
}

+ (Class)cdmaEvdoTowerType
{
  return (Class)objc_opt_class(&OBJC_CLASS___ALSCdmaEvdoTower);
}

- (void)setNumberOfSurroundingCdmaCells:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_numberOfSurroundingCdmaCells = a3;
}

- (void)setHasNumberOfSurroundingCdmaCells:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumberOfSurroundingCdmaCells
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setNumberOfSurroundingCdmaEvdoCells:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numberOfSurroundingCdmaEvdoCells = a3;
}

- (void)setHasNumberOfSurroundingCdmaEvdoCells:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumberOfSurroundingCdmaEvdoCells
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearLteCellTowers
{
}

- (void)addLteCellTower:(id)a3
{
  lteCellTowers = self->_lteCellTowers;
  if (!lteCellTowers)
  {
    lteCellTowers = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    self->_lteCellTowers = lteCellTowers;
  }

  -[NSMutableArray addObject:](lteCellTowers, "addObject:", a3);
}

- (unint64_t)lteCellTowersCount
{
  return (unint64_t)-[NSMutableArray count](self->_lteCellTowers, "count");
}

- (id)lteCellTowerAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_lteCellTowers, "objectAtIndex:", a3);
}

+ (Class)lteCellTowerType
{
  return (Class)objc_opt_class(&OBJC_CLASS___ALSLteCellTower);
}

- (void)setNumberOfSurroundingLteCells:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_numberOfSurroundingLteCells = a3;
}

- (void)setHasNumberOfSurroundingLteCells:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNumberOfSurroundingLteCells
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)clearScdmaCellTowers
{
}

- (void)addScdmaCellTower:(id)a3
{
  scdmaCellTowers = self->_scdmaCellTowers;
  if (!scdmaCellTowers)
  {
    scdmaCellTowers = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    self->_scdmaCellTowers = scdmaCellTowers;
  }

  -[NSMutableArray addObject:](scdmaCellTowers, "addObject:", a3);
}

- (unint64_t)scdmaCellTowersCount
{
  return (unint64_t)-[NSMutableArray count](self->_scdmaCellTowers, "count");
}

- (id)scdmaCellTowerAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_scdmaCellTowers, "objectAtIndex:", a3);
}

+ (Class)scdmaCellTowerType
{
  return (Class)objc_opt_class(&OBJC_CLASS___ALSScdmaCellTower);
}

- (void)setNumberOfSurroundingScdmaCells:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_numberOfSurroundingScdmaCells = a3;
}

- (void)setHasNumberOfSurroundingScdmaCells:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasNumberOfSurroundingScdmaCells
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)clearNr5GCellTowers
{
}

- (void)addNr5GCellTower:(id)a3
{
  nr5GCellTowers = self->_nr5GCellTowers;
  if (!nr5GCellTowers)
  {
    nr5GCellTowers = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    self->_nr5GCellTowers = nr5GCellTowers;
  }

  -[NSMutableArray addObject:](nr5GCellTowers, "addObject:", a3);
}

- (unint64_t)nr5GCellTowersCount
{
  return (unint64_t)-[NSMutableArray count](self->_nr5GCellTowers, "count");
}

- (id)nr5GCellTowerAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_nr5GCellTowers, "objectAtIndex:", a3);
}

+ (Class)nr5GCellTowerType
{
  return (Class)objc_opt_class(&OBJC_CLASS___ALSNr5GCellTower);
}

- (void)setNumberOfSurroundingNr5GCells:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_numberOfSurroundingNr5GCells = a3;
}

- (void)setHasNumberOfSurroundingNr5GCells:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNumberOfSurroundingNr5GCells
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (unint64_t)surroundingWifiBandsCount
{
  return self->_surroundingWifiBands.count;
}

- (int)surroundingWifiBands
{
  return self->_surroundingWifiBands.list;
}

- (void)clearSurroundingWifiBands
{
}

- (void)addSurroundingWifiBands:(int)a3
{
}

- (int)surroundingWifiBandsAtIndex:(unint64_t)a3
{
  p_surroundingWifiBands = &self->_surroundingWifiBands;
  unint64_t count = self->_surroundingWifiBands.count;
  if (count <= a3) {
    -[NSException raise]( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSRangeException,  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"idx (%lu) is out of range (%lu)",  a3,  count),  0LL),  "raise");
  }
  return p_surroundingWifiBands->list[a3];
}

- (void)setSurroundingWifiBands:(int *)a3 count:(unint64_t)a4
{
}

- (id)surroundingWifiBandsAsString:(int)a3
{
  if (a3 == 1) {
    return @"k2dot4GHZ";
  }
  if (a3 == 2) {
    return @"k5GHZ";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
}

- (int)StringAsSurroundingWifiBands:(id)a3
{
  int v4 = 1;
  if (([a3 isEqualToString:@"k2dot4GHZ"] & 1) == 0)
  {
    else {
      return 1;
    }
  }

  return v4;
}

- (int)wifiAltitudeScale
{
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0) {
    return self->_wifiAltitudeScale;
  }
  else {
    return 1;
  }
}

- (void)setWifiAltitudeScale:(int)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_wifiAltitudeScale = a3;
}

- (void)setHasWifiAltitudeScale:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasWifiAltitudeScale
{
  return *(_BYTE *)&self->_has >> 7;
}

- (id)wifiAltitudeScaleAsString:(int)a3
{
  if (a3 == 1) {
    return @"kWifiAltitudeScaleNone";
  }
  if (a3 == 2) {
    return @"kWifiAltitudeScale10toThe2";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
}

- (int)StringAsWifiAltitudeScale:(id)a3
{
  int v4 = 1;
  if (([a3 isEqualToString:@"kWifiAltitudeScaleNone"] & 1) == 0)
  {
    else {
      return 1;
    }
  }

  return v4;
}

- (BOOL)hasMeta
{
  return self->_meta != 0LL;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALSLocationRequest;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[ALSLocationRequest description](&v3, "description"),  -[ALSLocationRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  if (-[NSMutableArray count](self->_cellTowers, "count"))
  {
    int v4 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_cellTowers, "count"));
    __int128 v82 = 0u;
    __int128 v83 = 0u;
    __int128 v84 = 0u;
    __int128 v85 = 0u;
    cellTowers = self->_cellTowers;
    id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cellTowers,  "countByEnumeratingWithState:objects:count:",  &v82,  v92,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v83;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v83 != v8) {
            objc_enumerationMutation(cellTowers);
          }
          -[NSMutableArray addObject:]( v4,  "addObject:",  [*(id *)(*((void *)&v82 + 1) + 8 * (void)i) dictionaryRepresentation]);
        }

        id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cellTowers,  "countByEnumeratingWithState:objects:count:",  &v82,  v92,  16LL);
      }

      while (v7);
    }

    [v3 setObject:v4 forKey:@"cellTower"];
  }

  if (-[NSMutableArray count](self->_wirelessAPs, "count"))
  {
    v10 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_wirelessAPs, "count"));
    __int128 v78 = 0u;
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    __int128 v81 = 0u;
    wirelessAPs = self->_wirelessAPs;
    id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( wirelessAPs,  "countByEnumeratingWithState:objects:count:",  &v78,  v91,  16LL);
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v79;
      do
      {
        for (j = 0LL; j != v13; j = (char *)j + 1)
        {
          if (*(void *)v79 != v14) {
            objc_enumerationMutation(wirelessAPs);
          }
          -[NSMutableArray addObject:]( v10,  "addObject:",  [*(id *)(*((void *)&v78 + 1) + 8 * (void)j) dictionaryRepresentation]);
        }

        id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( wirelessAPs,  "countByEnumeratingWithState:objects:count:",  &v78,  v91,  16LL);
      }

      while (v13);
    }

    [v3 setObject:v10 forKey:@"wirelessAP"];
  }

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  self->_numberOfSurroundingCells),  @"numberOfSurroundingCells");
    char has = (char)self->_has;
  }

  if ((has & 0x40) != 0) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  self->_numberOfSurroundingWifis),  @"numberOfSurroundingWifis");
  }
  appBundleId = self->_appBundleId;
  if (appBundleId) {
    [v3 setObject:appBundleId forKey:@"appBundleId"];
  }
  if (-[NSMutableArray count](self->_cdmaCellTowers, "count"))
  {
    v18 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_cdmaCellTowers, "count"));
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    __int128 v76 = 0u;
    __int128 v77 = 0u;
    cdmaCellTowers = self->_cdmaCellTowers;
    id v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cdmaCellTowers,  "countByEnumeratingWithState:objects:count:",  &v74,  v90,  16LL);
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v75;
      do
      {
        for (k = 0LL; k != v21; k = (char *)k + 1)
        {
          if (*(void *)v75 != v22) {
            objc_enumerationMutation(cdmaCellTowers);
          }
          -[NSMutableArray addObject:]( v18,  "addObject:",  [*(id *)(*((void *)&v74 + 1) + 8 * (void)k) dictionaryRepresentation]);
        }

        id v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cdmaCellTowers,  "countByEnumeratingWithState:objects:count:",  &v74,  v90,  16LL);
      }

      while (v21);
    }

    [v3 setObject:v18 forKey:@"cdmaCellTower"];
  }

  if (-[NSMutableArray count](self->_cdmaEvdoTowers, "count"))
  {
    v24 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_cdmaEvdoTowers, "count"));
    __int128 v70 = 0u;
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    __int128 v73 = 0u;
    cdmaEvdoTowers = self->_cdmaEvdoTowers;
    id v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cdmaEvdoTowers,  "countByEnumeratingWithState:objects:count:",  &v70,  v89,  16LL);
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v71;
      do
      {
        for (m = 0LL; m != v27; m = (char *)m + 1)
        {
          if (*(void *)v71 != v28) {
            objc_enumerationMutation(cdmaEvdoTowers);
          }
          -[NSMutableArray addObject:]( v24,  "addObject:",  [*(id *)(*((void *)&v70 + 1) + 8 * (void)m) dictionaryRepresentation]);
        }

        id v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cdmaEvdoTowers,  "countByEnumeratingWithState:objects:count:",  &v70,  v89,  16LL);
      }

      while (v27);
    }

    [v3 setObject:v24 forKey:@"cdmaEvdoTower"];
  }

  char v30 = (char)self->_has;
  if ((v30 & 1) != 0)
  {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  self->_numberOfSurroundingCdmaCells),  @"numberOfSurroundingCdmaCells");
    char v30 = (char)self->_has;
  }

  if ((v30 & 2) != 0) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  self->_numberOfSurroundingCdmaEvdoCells),  @"numberOfSurroundingCdmaEvdoCells");
  }
  if (-[NSMutableArray count](self->_lteCellTowers, "count"))
  {
    v31 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_lteCellTowers, "count"));
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    __int128 v69 = 0u;
    lteCellTowers = self->_lteCellTowers;
    id v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( lteCellTowers,  "countByEnumeratingWithState:objects:count:",  &v66,  v88,  16LL);
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v67;
      do
      {
        for (n = 0LL; n != v34; n = (char *)n + 1)
        {
          if (*(void *)v67 != v35) {
            objc_enumerationMutation(lteCellTowers);
          }
          -[NSMutableArray addObject:]( v31,  "addObject:",  [*(id *)(*((void *)&v66 + 1) + 8 * (void)n) dictionaryRepresentation]);
        }

        id v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( lteCellTowers,  "countByEnumeratingWithState:objects:count:",  &v66,  v88,  16LL);
      }

      while (v34);
    }

    [v3 setObject:v31 forKey:@"lteCellTower"];
  }

  if ((*(_BYTE *)&self->_has & 8) != 0) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  self->_numberOfSurroundingLteCells),  @"numberOfSurroundingLteCells");
  }
  if (-[NSMutableArray count](self->_scdmaCellTowers, "count"))
  {
    v37 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_scdmaCellTowers, "count"));
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    scdmaCellTowers = self->_scdmaCellTowers;
    id v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( scdmaCellTowers,  "countByEnumeratingWithState:objects:count:",  &v62,  v87,  16LL);
    if (v39)
    {
      id v40 = v39;
      uint64_t v41 = *(void *)v63;
      do
      {
        for (ii = 0LL; ii != v40; ii = (char *)ii + 1)
        {
          if (*(void *)v63 != v41) {
            objc_enumerationMutation(scdmaCellTowers);
          }
          -[NSMutableArray addObject:]( v37,  "addObject:",  [*(id *)(*((void *)&v62 + 1) + 8 * (void)ii) dictionaryRepresentation]);
        }

        id v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( scdmaCellTowers,  "countByEnumeratingWithState:objects:count:",  &v62,  v87,  16LL);
      }

      while (v40);
    }

    [v3 setObject:v37 forKey:@"scdmaCellTower"];
  }

  if ((*(_BYTE *)&self->_has & 0x20) != 0) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  self->_numberOfSurroundingScdmaCells),  @"numberOfSurroundingScdmaCells");
  }
  if (-[NSMutableArray count](self->_nr5GCellTowers, "count"))
  {
    v43 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_nr5GCellTowers, "count"));
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    nr5GCellTowers = self->_nr5GCellTowers;
    id v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( nr5GCellTowers,  "countByEnumeratingWithState:objects:count:",  &v58,  v86,  16LL);
    if (v45)
    {
      id v46 = v45;
      uint64_t v47 = *(void *)v59;
      do
      {
        for (jj = 0LL; jj != v46; jj = (char *)jj + 1)
        {
          if (*(void *)v59 != v47) {
            objc_enumerationMutation(nr5GCellTowers);
          }
          -[NSMutableArray addObject:]( v43,  "addObject:",  [*(id *)(*((void *)&v58 + 1) + 8 * (void)jj) dictionaryRepresentation]);
        }

        id v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( nr5GCellTowers,  "countByEnumeratingWithState:objects:count:",  &v58,  v86,  16LL);
      }

      while (v46);
    }

    [v3 setObject:v43 forKey:@"nr5GCellTower"];
  }

  if ((*(_BYTE *)&self->_has & 0x10) != 0) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  self->_numberOfSurroundingNr5GCells),  @"numberOfSurroundingNr5GCells");
  }
  p_surroundingWifiBands = &self->_surroundingWifiBands;
  if (self->_surroundingWifiBands.count)
  {
    v50 = +[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:");
    if (self->_surroundingWifiBands.count)
    {
      unint64_t v51 = 0LL;
      do
      {
        int v52 = p_surroundingWifiBands->list[v51];
        if (v52 == 1)
        {
          v53 = @"k2dot4GHZ";
        }

        else if (v52 == 2)
        {
          v53 = @"k5GHZ";
        }

        else
        {
          v53 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  p_surroundingWifiBands->list[v51]);
        }

        -[NSMutableArray addObject:](v50, "addObject:", v53);
        ++v51;
      }

      while (v51 < self->_surroundingWifiBands.count);
    }

    [v3 setObject:v50 forKey:@"surroundingWifiBands"];
  }

  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    int wifiAltitudeScale = self->_wifiAltitudeScale;
    if (wifiAltitudeScale == 1)
    {
      v55 = @"kWifiAltitudeScaleNone";
    }

    else if (wifiAltitudeScale == 2)
    {
      v55 = @"kWifiAltitudeScale10toThe2";
    }

    else
    {
      v55 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_wifiAltitudeScale);
    }

    [v3 setObject:v55 forKey:@"wifiAltitudeScale"];
  }

  meta = self->_meta;
  if (meta) {
    objc_msgSend( v3,  "setObject:forKey:",  -[ALSMeta dictionaryRepresentation](meta, "dictionaryRepresentation"),  @"meta");
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100B8A64C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  cellTowers = self->_cellTowers;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cellTowers,  "countByEnumeratingWithState:objects:count:",  &v69,  v79,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v70;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v70 != v8) {
          objc_enumerationMutation(cellTowers);
        }
        PBDataWriterWriteSubmessage(a3, *(void *)(*((void *)&v69 + 1) + 8LL * (void)i), 1LL);
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cellTowers,  "countByEnumeratingWithState:objects:count:",  &v69,  v79,  16LL);
    }

    while (v7);
  }

  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  wirelessAPs = self->_wirelessAPs;
  id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( wirelessAPs,  "countByEnumeratingWithState:objects:count:",  &v65,  v78,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v66;
    do
    {
      for (j = 0LL; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v66 != v13) {
          objc_enumerationMutation(wirelessAPs);
        }
        PBDataWriterWriteSubmessage(a3, *(void *)(*((void *)&v65 + 1) + 8LL * (void)j), 2LL);
      }

      id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( wirelessAPs,  "countByEnumeratingWithState:objects:count:",  &v65,  v78,  16LL);
    }

    while (v12);
  }

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field(a3, self->_numberOfSurroundingCells, 3LL);
    char has = (char)self->_has;
  }

  if ((has & 0x40) != 0) {
    PBDataWriterWriteInt32Field(a3, self->_numberOfSurroundingWifis, 4LL);
  }
  appBundleId = self->_appBundleId;
  if (appBundleId) {
    PBDataWriterWriteStringField(a3, appBundleId, 5LL);
  }
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  cdmaCellTowers = self->_cdmaCellTowers;
  id v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cdmaCellTowers,  "countByEnumeratingWithState:objects:count:",  &v61,  v77,  16LL);
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v62;
    do
    {
      for (k = 0LL; k != v19; k = (char *)k + 1)
      {
        if (*(void *)v62 != v20) {
          objc_enumerationMutation(cdmaCellTowers);
        }
        PBDataWriterWriteSubmessage(a3, *(void *)(*((void *)&v61 + 1) + 8LL * (void)k), 21LL);
      }

      id v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cdmaCellTowers,  "countByEnumeratingWithState:objects:count:",  &v61,  v77,  16LL);
    }

    while (v19);
  }

  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  cdmaEvdoTowers = self->_cdmaEvdoTowers;
  id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cdmaEvdoTowers,  "countByEnumeratingWithState:objects:count:",  &v57,  v76,  16LL);
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v58;
    do
    {
      for (m = 0LL; m != v24; m = (char *)m + 1)
      {
        if (*(void *)v58 != v25) {
          objc_enumerationMutation(cdmaEvdoTowers);
        }
        PBDataWriterWriteSubmessage(a3, *(void *)(*((void *)&v57 + 1) + 8LL * (void)m), 22LL);
      }

      id v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cdmaEvdoTowers,  "countByEnumeratingWithState:objects:count:",  &v57,  v76,  16LL);
    }

    while (v24);
  }

  char v27 = (char)self->_has;
  if ((v27 & 1) != 0)
  {
    PBDataWriterWriteInt32Field(a3, self->_numberOfSurroundingCdmaCells, 23LL);
    char v27 = (char)self->_has;
  }

  if ((v27 & 2) != 0) {
    PBDataWriterWriteInt32Field(a3, self->_numberOfSurroundingCdmaEvdoCells, 24LL);
  }
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  lteCellTowers = self->_lteCellTowers;
  id v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( lteCellTowers,  "countByEnumeratingWithState:objects:count:",  &v53,  v75,  16LL);
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v54;
    do
    {
      for (n = 0LL; n != v30; n = (char *)n + 1)
      {
        if (*(void *)v54 != v31) {
          objc_enumerationMutation(lteCellTowers);
        }
        PBDataWriterWriteSubmessage(a3, *(void *)(*((void *)&v53 + 1) + 8LL * (void)n), 25LL);
      }

      id v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( lteCellTowers,  "countByEnumeratingWithState:objects:count:",  &v53,  v75,  16LL);
    }

    while (v30);
  }

  if ((*(_BYTE *)&self->_has & 8) != 0) {
    PBDataWriterWriteInt32Field(a3, self->_numberOfSurroundingLteCells, 26LL);
  }
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  scdmaCellTowers = self->_scdmaCellTowers;
  id v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( scdmaCellTowers,  "countByEnumeratingWithState:objects:count:",  &v49,  v74,  16LL);
  if (v34)
  {
    id v35 = v34;
    uint64_t v36 = *(void *)v50;
    do
    {
      for (ii = 0LL; ii != v35; ii = (char *)ii + 1)
      {
        if (*(void *)v50 != v36) {
          objc_enumerationMutation(scdmaCellTowers);
        }
        PBDataWriterWriteSubmessage(a3, *(void *)(*((void *)&v49 + 1) + 8LL * (void)ii), 27LL);
      }

      id v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( scdmaCellTowers,  "countByEnumeratingWithState:objects:count:",  &v49,  v74,  16LL);
    }

    while (v35);
  }

  if ((*(_BYTE *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteInt32Field(a3, self->_numberOfSurroundingScdmaCells, 28LL);
  }
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  nr5GCellTowers = self->_nr5GCellTowers;
  id v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( nr5GCellTowers,  "countByEnumeratingWithState:objects:count:",  &v45,  v73,  16LL);
  if (v39)
  {
    id v40 = v39;
    uint64_t v41 = *(void *)v46;
    do
    {
      for (jj = 0LL; jj != v40; jj = (char *)jj + 1)
      {
        if (*(void *)v46 != v41) {
          objc_enumerationMutation(nr5GCellTowers);
        }
        PBDataWriterWriteSubmessage(a3, *(void *)(*((void *)&v45 + 1) + 8LL * (void)jj), 29LL);
      }

      id v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( nr5GCellTowers,  "countByEnumeratingWithState:objects:count:",  &v45,  v73,  16LL);
    }

    while (v40);
  }

  if ((*(_BYTE *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteInt32Field(a3, self->_numberOfSurroundingNr5GCells, 30LL);
  }
  if (self->_surroundingWifiBands.count)
  {
    unint64_t v43 = 0LL;
    do
      PBDataWriterWriteInt32Field(a3, self->_surroundingWifiBands.list[v43++], 31LL);
    while (v43 < self->_surroundingWifiBands.count);
  }

  if ((*(_BYTE *)&self->_has & 0x80000000) != 0) {
    PBDataWriterWriteInt32Field(a3, self->_wifiAltitudeScale, 32LL);
  }
  meta = self->_meta;
  if (meta) {
    PBDataWriterWriteSubmessage(a3, meta, 33LL);
  }
}

- (unsigned)requestTypeCode
{
  return 1;
}

- (Class)responseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___ALSLocationResponse);
}

- (void)copyTo:(id)a3
{
  if (-[ALSLocationRequest cellTowersCount](self, "cellTowersCount"))
  {
    [a3 clearCellTowers];
    unint64_t v5 = -[ALSLocationRequest cellTowersCount](self, "cellTowersCount");
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0LL; i != v6; ++i)
        objc_msgSend(a3, "addCellTower:", -[ALSLocationRequest cellTowerAtIndex:](self, "cellTowerAtIndex:", i));
    }
  }

  if (-[ALSLocationRequest wirelessAPsCount](self, "wirelessAPsCount"))
  {
    [a3 clearWirelessAPs];
    unint64_t v8 = -[ALSLocationRequest wirelessAPsCount](self, "wirelessAPsCount");
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0LL; j != v9; ++j)
        objc_msgSend(a3, "addWirelessAP:", -[ALSLocationRequest wirelessAPAtIndex:](self, "wirelessAPAtIndex:", j));
    }
  }

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 24) = self->_numberOfSurroundingCells;
    *((_BYTE *)a3 + 144) |= 4u;
    char has = (char)self->_has;
  }

  if ((has & 0x40) != 0)
  {
    *((_DWORD *)a3 + 28) = self->_numberOfSurroundingWifis;
    *((_BYTE *)a3 + 144) |= 0x40u;
  }

  if (self->_appBundleId) {
    objc_msgSend(a3, "setAppBundleId:");
  }
  if (-[ALSLocationRequest cdmaCellTowersCount](self, "cdmaCellTowersCount"))
  {
    [a3 clearCdmaCellTowers];
    unint64_t v12 = -[ALSLocationRequest cdmaCellTowersCount](self, "cdmaCellTowersCount");
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0LL; k != v13; ++k)
        objc_msgSend( a3,  "addCdmaCellTower:",  -[ALSLocationRequest cdmaCellTowerAtIndex:](self, "cdmaCellTowerAtIndex:", k));
    }
  }

  if (-[ALSLocationRequest cdmaEvdoTowersCount](self, "cdmaEvdoTowersCount"))
  {
    [a3 clearCdmaEvdoTowers];
    unint64_t v15 = -[ALSLocationRequest cdmaEvdoTowersCount](self, "cdmaEvdoTowersCount");
    if (v15)
    {
      unint64_t v16 = v15;
      for (uint64_t m = 0LL; m != v16; ++m)
        objc_msgSend( a3,  "addCdmaEvdoTower:",  -[ALSLocationRequest cdmaEvdoTowerAtIndex:](self, "cdmaEvdoTowerAtIndex:", m));
    }
  }

  char v18 = (char)self->_has;
  if ((v18 & 1) != 0)
  {
    *((_DWORD *)a3 + 22) = self->_numberOfSurroundingCdmaCells;
    *((_BYTE *)a3 + 144) |= 1u;
    char v18 = (char)self->_has;
  }

  if ((v18 & 2) != 0)
  {
    *((_DWORD *)a3 + 23) = self->_numberOfSurroundingCdmaEvdoCells;
    *((_BYTE *)a3 + 144) |= 2u;
  }

  if (-[ALSLocationRequest lteCellTowersCount](self, "lteCellTowersCount"))
  {
    [a3 clearLteCellTowers];
    unint64_t v19 = -[ALSLocationRequest lteCellTowersCount](self, "lteCellTowersCount");
    if (v19)
    {
      unint64_t v20 = v19;
      for (uint64_t n = 0LL; n != v20; ++n)
        objc_msgSend( a3,  "addLteCellTower:",  -[ALSLocationRequest lteCellTowerAtIndex:](self, "lteCellTowerAtIndex:", n));
    }
  }

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_DWORD *)a3 + 25) = self->_numberOfSurroundingLteCells;
    *((_BYTE *)a3 + 144) |= 8u;
  }

  if (-[ALSLocationRequest scdmaCellTowersCount](self, "scdmaCellTowersCount"))
  {
    [a3 clearScdmaCellTowers];
    unint64_t v22 = -[ALSLocationRequest scdmaCellTowersCount](self, "scdmaCellTowersCount");
    if (v22)
    {
      unint64_t v23 = v22;
      for (iuint64_t i = 0LL; ii != v23; ++ii)
        objc_msgSend( a3,  "addScdmaCellTower:",  -[ALSLocationRequest scdmaCellTowerAtIndex:](self, "scdmaCellTowerAtIndex:", ii));
    }
  }

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *((_DWORD *)a3 + 27) = self->_numberOfSurroundingScdmaCells;
    *((_BYTE *)a3 + 144) |= 0x20u;
  }

  if (-[ALSLocationRequest nr5GCellTowersCount](self, "nr5GCellTowersCount"))
  {
    [a3 clearNr5GCellTowers];
    unint64_t v25 = -[ALSLocationRequest nr5GCellTowersCount](self, "nr5GCellTowersCount");
    if (v25)
    {
      unint64_t v26 = v25;
      for (juint64_t j = 0LL; jj != v26; ++jj)
        objc_msgSend( a3,  "addNr5GCellTower:",  -[ALSLocationRequest nr5GCellTowerAtIndex:](self, "nr5GCellTowerAtIndex:", jj));
    }
  }

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 26) = self->_numberOfSurroundingNr5GCells;
    *((_BYTE *)a3 + 144) |= 0x10u;
  }

  if (-[ALSLocationRequest surroundingWifiBandsCount](self, "surroundingWifiBandsCount"))
  {
    [a3 clearSurroundingWifiBands];
    unint64_t v28 = -[ALSLocationRequest surroundingWifiBandsCount](self, "surroundingWifiBandsCount");
    if (v28)
    {
      unint64_t v29 = v28;
      for (kuint64_t k = 0LL; kk != v29; ++kk)
        objc_msgSend( a3,  "addSurroundingWifiBands:",  -[ALSLocationRequest surroundingWifiBandsAtIndex:](self, "surroundingWifiBandsAtIndex:", kk));
    }
  }

  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    *((_DWORD *)a3 + 32) = self->_wifiAltitudeScale;
    *((_BYTE *)a3 + 144) |= 0x80u;
  }

  if (self->_meta) {
    objc_msgSend(a3, "setMeta:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  id v7 = (id *)objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "init");
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  cellTowers = self->_cellTowers;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cellTowers,  "countByEnumeratingWithState:objects:count:",  &v77,  v87,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v78;
    do
    {
      for (uint64_t i = 0LL; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v78 != v11) {
          objc_enumerationMutation(cellTowers);
        }
        id v13 = [*(id *)(*((void *)&v77 + 1) + 8 * (void)i) copyWithZone:a3];
        [v7 addCellTower:v13];
      }

      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cellTowers,  "countByEnumeratingWithState:objects:count:",  &v77,  v87,  16LL);
    }

    while (v10);
  }

  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  wirelessAPs = self->_wirelessAPs;
  id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( wirelessAPs,  "countByEnumeratingWithState:objects:count:",  &v73,  v86,  16LL);
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v74;
    do
    {
      for (uint64_t j = 0LL; j != v16; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v74 != v17) {
          objc_enumerationMutation(wirelessAPs);
        }
        id v19 = [*(id *)(*((void *)&v73 + 1) + 8 * (void)j) copyWithZone:a3];
        [v7 addWirelessAP:v19];
      }

      id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( wirelessAPs,  "countByEnumeratingWithState:objects:count:",  &v73,  v86,  16LL);
    }

    while (v16);
  }

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v7 + 24) = self->_numberOfSurroundingCells;
    *((_BYTE *)v7 + 144) |= 4u;
    char has = (char)self->_has;
  }

  if ((has & 0x40) != 0)
  {
    *((_DWORD *)v7 + 28) = self->_numberOfSurroundingWifis;
    *((_BYTE *)v7 + 144) |= 0x40u;
  }

  v7[4] = -[NSString copyWithZone:](self->_appBundleId, "copyWithZone:", a3);
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  cdmaCellTowers = self->_cdmaCellTowers;
  id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cdmaCellTowers,  "countByEnumeratingWithState:objects:count:",  &v69,  v85,  16LL);
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v70;
    do
    {
      for (uint64_t k = 0LL; k != v23; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v70 != v24) {
          objc_enumerationMutation(cdmaCellTowers);
        }
        id v26 = [*(id *)(*((void *)&v69 + 1) + 8 * (void)k) copyWithZone:a3];
        [v7 addCdmaCellTower:v26];
      }

      id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cdmaCellTowers,  "countByEnumeratingWithState:objects:count:",  &v69,  v85,  16LL);
    }

    while (v23);
  }

  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  cdmaEvdoTowers = self->_cdmaEvdoTowers;
  id v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cdmaEvdoTowers,  "countByEnumeratingWithState:objects:count:",  &v65,  v84,  16LL);
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v66;
    do
    {
      for (uint64_t m = 0LL; m != v29; uint64_t m = (char *)m + 1)
      {
        if (*(void *)v66 != v30) {
          objc_enumerationMutation(cdmaEvdoTowers);
        }
        id v32 = [*(id *)(*((void *)&v65 + 1) + 8 * (void)m) copyWithZone:a3];
        [v7 addCdmaEvdoTower:v32];
      }

      id v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cdmaEvdoTowers,  "countByEnumeratingWithState:objects:count:",  &v65,  v84,  16LL);
    }

    while (v29);
  }

  char v33 = (char)self->_has;
  if ((v33 & 1) != 0)
  {
    *((_DWORD *)v7 + 22) = self->_numberOfSurroundingCdmaCells;
    *((_BYTE *)v7 + 144) |= 1u;
    char v33 = (char)self->_has;
  }

  if ((v33 & 2) != 0)
  {
    *((_DWORD *)v7 + 23) = self->_numberOfSurroundingCdmaEvdoCells;
    *((_BYTE *)v7 + 144) |= 2u;
  }

  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  lteCellTowers = self->_lteCellTowers;
  id v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( lteCellTowers,  "countByEnumeratingWithState:objects:count:",  &v61,  v83,  16LL);
  if (v35)
  {
    id v36 = v35;
    uint64_t v37 = *(void *)v62;
    do
    {
      for (uint64_t n = 0LL; n != v36; uint64_t n = (char *)n + 1)
      {
        if (*(void *)v62 != v37) {
          objc_enumerationMutation(lteCellTowers);
        }
        id v39 = [*(id *)(*((void *)&v61 + 1) + 8 * (void)n) copyWithZone:a3];
        [v7 addLteCellTower:v39];
      }

      id v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( lteCellTowers,  "countByEnumeratingWithState:objects:count:",  &v61,  v83,  16LL);
    }

    while (v36);
  }

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v7 + 25) = self->_numberOfSurroundingLteCells;
    *((_BYTE *)v7 + 144) |= 8u;
  }

  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  scdmaCellTowers = self->_scdmaCellTowers;
  id v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( scdmaCellTowers,  "countByEnumeratingWithState:objects:count:",  &v57,  v82,  16LL);
  if (v41)
  {
    id v42 = v41;
    uint64_t v43 = *(void *)v58;
    do
    {
      for (iuint64_t i = 0LL; ii != v42; iuint64_t i = (char *)ii + 1)
      {
        if (*(void *)v58 != v43) {
          objc_enumerationMutation(scdmaCellTowers);
        }
        id v45 = [*(id *)(*((void *)&v57 + 1) + 8 * (void)ii) copyWithZone:a3];
        [v7 addScdmaCellTower:v45];
      }

      id v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( scdmaCellTowers,  "countByEnumeratingWithState:objects:count:",  &v57,  v82,  16LL);
    }

    while (v42);
  }

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *((_DWORD *)v7 + 27) = self->_numberOfSurroundingScdmaCells;
    *((_BYTE *)v7 + 144) |= 0x20u;
  }

  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  nr5GCellTowers = self->_nr5GCellTowers;
  id v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( nr5GCellTowers,  "countByEnumeratingWithState:objects:count:",  &v53,  v81,  16LL);
  if (v47)
  {
    id v48 = v47;
    uint64_t v49 = *(void *)v54;
    do
    {
      for (juint64_t j = 0LL; jj != v48; juint64_t j = (char *)jj + 1)
      {
        if (*(void *)v54 != v49) {
          objc_enumerationMutation(nr5GCellTowers);
        }
        id v51 = [*(id *)(*((void *)&v53 + 1) + 8 * (void)jj) copyWithZone:a3];
        [v7 addNr5GCellTower:v51];
      }

      id v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( nr5GCellTowers,  "countByEnumeratingWithState:objects:count:",  &v53,  v81,  16LL);
    }

    while (v48);
  }

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)v7 + 26) = self->_numberOfSurroundingNr5GCells;
    *((_BYTE *)v7 + 144) |= 0x10u;
  }

  PBRepeatedInt32Copy(v7 + 1, &self->_surroundingWifiBands);
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    *((_DWORD *)v7 + 32) = self->_wifiAltitudeScale;
    *((_BYTE *)v7 + 144) |= 0x80u;
  }

  v7[9] = -[ALSMeta copyWithZone:](self->_meta, "copyWithZone:", a3);
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  unsigned int IsEqual = objc_msgSend(a3, "isMemberOfClass:", v6, v5);
  if (IsEqual)
  {
    cellTowers = self->_cellTowers;
    if (!((unint64_t)cellTowers | *((void *)a3 + 7))
      || (unsigned int IsEqual = -[NSMutableArray isEqual:](cellTowers, "isEqual:")) != 0)
    {
      wirelessAPs = self->_wirelessAPs;
      if (!((unint64_t)wirelessAPs | *((void *)a3 + 17))
        || (unsigned int IsEqual = -[NSMutableArray isEqual:](wirelessAPs, "isEqual:")) != 0)
      {
        if ((*(_BYTE *)&self->_has & 4) != 0)
        {
          if ((*((_BYTE *)a3 + 144) & 4) == 0 || self->_numberOfSurroundingCells != *((_DWORD *)a3 + 24)) {
            goto LABEL_63;
          }
        }

        else if ((*((_BYTE *)a3 + 144) & 4) != 0)
        {
          goto LABEL_63;
        }

        if ((*(_BYTE *)&self->_has & 0x40) != 0)
        {
          if ((*((_BYTE *)a3 + 144) & 0x40) == 0 || self->_numberOfSurroundingWifis != *((_DWORD *)a3 + 28)) {
            goto LABEL_63;
          }
        }

        else if ((*((_BYTE *)a3 + 144) & 0x40) != 0)
        {
          goto LABEL_63;
        }

        appBundleId = self->_appBundleId;
        if (!((unint64_t)appBundleId | *((void *)a3 + 4))
          || (unsigned int IsEqual = -[NSString isEqual:](appBundleId, "isEqual:")) != 0)
        {
          cdmaCellTowers = self->_cdmaCellTowers;
          if (!((unint64_t)cdmaCellTowers | *((void *)a3 + 5))
            || (unsigned int IsEqual = -[NSMutableArray isEqual:](cdmaCellTowers, "isEqual:")) != 0)
          {
            cdmaEvdoTowers = self->_cdmaEvdoTowers;
            if (!((unint64_t)cdmaEvdoTowers | *((void *)a3 + 6))
              || (unsigned int IsEqual = -[NSMutableArray isEqual:](cdmaEvdoTowers, "isEqual:")) != 0)
            {
              char has = (char)self->_has;
              if ((has & 1) != 0)
              {
                if ((*((_BYTE *)a3 + 144) & 1) == 0 || self->_numberOfSurroundingCdmaCells != *((_DWORD *)a3 + 22)) {
                  goto LABEL_63;
                }
              }

              else if ((*((_BYTE *)a3 + 144) & 1) != 0)
              {
                goto LABEL_63;
              }

              if ((*(_BYTE *)&self->_has & 2) != 0)
              {
                if ((*((_BYTE *)a3 + 144) & 2) == 0 || self->_numberOfSurroundingCdmaEvdoCells != *((_DWORD *)a3 + 23)) {
                  goto LABEL_63;
                }
              }

              else if ((*((_BYTE *)a3 + 144) & 2) != 0)
              {
                goto LABEL_63;
              }

              lteCellTowers = self->_lteCellTowers;
              if ((unint64_t)lteCellTowers | *((void *)a3 + 8))
              {
                unsigned int IsEqual = -[NSMutableArray isEqual:](lteCellTowers, "isEqual:");
                if (!IsEqual) {
                  return IsEqual;
                }
                char has = (char)self->_has;
              }

              if ((has & 8) != 0)
              {
                if ((*((_BYTE *)a3 + 144) & 8) == 0 || self->_numberOfSurroundingLteCells != *((_DWORD *)a3 + 25)) {
                  goto LABEL_63;
                }
              }

              else if ((*((_BYTE *)a3 + 144) & 8) != 0)
              {
                goto LABEL_63;
              }

              scdmaCellTowers = self->_scdmaCellTowers;
              if ((unint64_t)scdmaCellTowers | *((void *)a3 + 15))
              {
                unsigned int IsEqual = -[NSMutableArray isEqual:](scdmaCellTowers, "isEqual:");
                if (!IsEqual) {
                  return IsEqual;
                }
                char has = (char)self->_has;
              }

              if ((has & 0x20) != 0)
              {
                if ((*((_BYTE *)a3 + 144) & 0x20) == 0 || self->_numberOfSurroundingScdmaCells != *((_DWORD *)a3 + 27)) {
                  goto LABEL_63;
                }
              }

              else if ((*((_BYTE *)a3 + 144) & 0x20) != 0)
              {
                goto LABEL_63;
              }

              nr5GCellTowers = self->_nr5GCellTowers;
              if ((unint64_t)nr5GCellTowers | *((void *)a3 + 10))
              {
                unsigned int IsEqual = -[NSMutableArray isEqual:](nr5GCellTowers, "isEqual:");
                if (!IsEqual) {
                  return IsEqual;
                }
                char has = (char)self->_has;
              }

              if ((has & 0x10) != 0)
              {
                if ((*((_BYTE *)a3 + 144) & 0x10) == 0 || self->_numberOfSurroundingNr5GCells != *((_DWORD *)a3 + 26)) {
                  goto LABEL_63;
                }
              }

              else if ((*((_BYTE *)a3 + 144) & 0x10) != 0)
              {
                goto LABEL_63;
              }

              unsigned int IsEqual = PBRepeatedInt32IsEqual(&self->_surroundingWifiBands, (char *)a3 + 8);
              if (IsEqual)
              {
                int v17 = *((char *)a3 + 144);
                if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
                {
                  if ((v17 & 0x80000000) == 0 || self->_wifiAltitudeScale != *((_DWORD *)a3 + 32)) {
                    goto LABEL_63;
                  }
                }

                else if (v17 < 0)
                {
LABEL_63:
                  LOBYTE(IsEqual) = 0;
                  return IsEqual;
                }

                meta = self->_meta;
                else {
                  LOBYTE(IsEqual) = 1;
                }
              }
            }
          }
        }
      }
    }
  }

  return IsEqual;
}

- (unint64_t)hash
{
  id v3 = -[NSMutableArray hash](self->_cellTowers, "hash");
  id v4 = -[NSMutableArray hash](self->_wirelessAPs, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    uint64_t v20 = 2654435761LL * self->_numberOfSurroundingCells;
  }
  else {
    uint64_t v20 = 0LL;
  }
  unint64_t v23 = (unint64_t)v4;
  if ((*(_BYTE *)&self->_has & 0x40) != 0) {
    uint64_t v19 = 2654435761LL * self->_numberOfSurroundingWifis;
  }
  else {
    uint64_t v19 = 0LL;
  }
  NSUInteger v5 = -[NSString hash](self->_appBundleId, "hash");
  unint64_t v6 = (unint64_t)-[NSMutableArray hash](self->_cdmaCellTowers, "hash");
  id v7 = -[NSMutableArray hash](self->_cdmaEvdoTowers, "hash");
  unint64_t v24 = (unint64_t)v3;
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v18 = 2654435761LL * self->_numberOfSurroundingCdmaCells;
  }
  else {
    uint64_t v18 = 0LL;
  }
  unint64_t v22 = (unint64_t)v7;
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    id v8 = -[NSMutableArray hash](self->_lteCellTowers, "hash", 2654435761LL * self->_numberOfSurroundingCdmaEvdoCells);
  }
  else {
    id v8 = -[NSMutableArray hash](self->_lteCellTowers, "hash", 0LL);
  }
  unint64_t v21 = (unint64_t)v8;
  if ((*(_BYTE *)&self->_has & 8) != 0) {
    uint64_t v9 = 2654435761LL * self->_numberOfSurroundingLteCells;
  }
  else {
    uint64_t v9 = 0LL;
  }
  unint64_t v10 = (unint64_t)-[NSMutableArray hash](self->_scdmaCellTowers, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0) {
    uint64_t v11 = 2654435761LL * self->_numberOfSurroundingScdmaCells;
  }
  else {
    uint64_t v11 = 0LL;
  }
  unint64_t v12 = (unint64_t)-[NSMutableArray hash](self->_nr5GCellTowers, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0) {
    uint64_t v13 = 2654435761LL * self->_numberOfSurroundingNr5GCells;
  }
  else {
    uint64_t v13 = 0LL;
  }
  uint64_t v14 = PBRepeatedInt32Hash(&self->_surroundingWifiBands);
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0) {
    uint64_t v15 = 2654435761LL * self->_wifiAltitudeScale;
  }
  else {
    uint64_t v15 = 0LL;
  }
  return v23 ^ v24 ^ v20 ^ v19 ^ v5 ^ v6 ^ v22 ^ v18 ^ v17 ^ v21 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ -[ALSMeta hash](self->_meta, "hash");
}

- (void)mergeFrom:(id)a3
{
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  NSUInteger v5 = (void *)*((void *)a3 + 7);
  id v6 = [v5 countByEnumeratingWithState:&v71 objects:v81 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v72;
    do
    {
      for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v72 != v8) {
          objc_enumerationMutation(v5);
        }
        -[ALSLocationRequest addCellTower:](self, "addCellTower:", *(void *)(*((void *)&v71 + 1) + 8LL * (void)i));
      }

      id v7 = [v5 countByEnumeratingWithState:&v71 objects:v81 count:16];
    }

    while (v7);
  }

  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  unint64_t v10 = (void *)*((void *)a3 + 17);
  id v11 = [v10 countByEnumeratingWithState:&v67 objects:v80 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v68;
    do
    {
      for (uint64_t j = 0LL; j != v12; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v68 != v13) {
          objc_enumerationMutation(v10);
        }
        -[ALSLocationRequest addWirelessAP:]( self,  "addWirelessAP:",  *(void *)(*((void *)&v67 + 1) + 8LL * (void)j));
      }

      id v12 = [v10 countByEnumeratingWithState:&v67 objects:v80 count:16];
    }

    while (v12);
  }

  char v15 = *((_BYTE *)a3 + 144);
  if ((v15 & 4) != 0)
  {
    self->_numberOfSurroundingCells = *((_DWORD *)a3 + 24);
    *(_BYTE *)&self->_has |= 4u;
    char v15 = *((_BYTE *)a3 + 144);
  }

  if ((v15 & 0x40) != 0)
  {
    self->_numberOfSurroundingWifis = *((_DWORD *)a3 + 28);
    *(_BYTE *)&self->_has |= 0x40u;
  }

  if (*((void *)a3 + 4)) {
    -[ALSLocationRequest setAppBundleId:](self, "setAppBundleId:");
  }
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  id v16 = (void *)*((void *)a3 + 5);
  id v17 = [v16 countByEnumeratingWithState:&v63 objects:v79 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v64;
    do
    {
      for (uint64_t k = 0LL; k != v18; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v64 != v19) {
          objc_enumerationMutation(v16);
        }
        -[ALSLocationRequest addCdmaCellTower:]( self,  "addCdmaCellTower:",  *(void *)(*((void *)&v63 + 1) + 8LL * (void)k));
      }

      id v18 = [v16 countByEnumeratingWithState:&v63 objects:v79 count:16];
    }

    while (v18);
  }

  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  unint64_t v21 = (void *)*((void *)a3 + 6);
  id v22 = [v21 countByEnumeratingWithState:&v59 objects:v78 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v60;
    do
    {
      for (uint64_t m = 0LL; m != v23; uint64_t m = (char *)m + 1)
      {
        if (*(void *)v60 != v24) {
          objc_enumerationMutation(v21);
        }
        -[ALSLocationRequest addCdmaEvdoTower:]( self,  "addCdmaEvdoTower:",  *(void *)(*((void *)&v59 + 1) + 8LL * (void)m));
      }

      id v23 = [v21 countByEnumeratingWithState:&v59 objects:v78 count:16];
    }

    while (v23);
  }

  char v26 = *((_BYTE *)a3 + 144);
  if ((v26 & 1) != 0)
  {
    self->_numberOfSurroundingCdmaCells = *((_DWORD *)a3 + 22);
    *(_BYTE *)&self->_has |= 1u;
    char v26 = *((_BYTE *)a3 + 144);
  }

  if ((v26 & 2) != 0)
  {
    self->_numberOfSurroundingCdmaEvdoCells = *((_DWORD *)a3 + 23);
    *(_BYTE *)&self->_has |= 2u;
  }

  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  char v27 = (void *)*((void *)a3 + 8);
  id v28 = [v27 countByEnumeratingWithState:&v55 objects:v77 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v56;
    do
    {
      for (uint64_t n = 0LL; n != v29; uint64_t n = (char *)n + 1)
      {
        if (*(void *)v56 != v30) {
          objc_enumerationMutation(v27);
        }
        -[ALSLocationRequest addLteCellTower:]( self,  "addLteCellTower:",  *(void *)(*((void *)&v55 + 1) + 8LL * (void)n));
      }

      id v29 = [v27 countByEnumeratingWithState:&v55 objects:v77 count:16];
    }

    while (v29);
  }

  if ((*((_BYTE *)a3 + 144) & 8) != 0)
  {
    self->_numberOfSurroundingLteCells = *((_DWORD *)a3 + 25);
    *(_BYTE *)&self->_has |= 8u;
  }

  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id v32 = (void *)*((void *)a3 + 15);
  id v33 = [v32 countByEnumeratingWithState:&v51 objects:v76 count:16];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v52;
    do
    {
      for (iuint64_t i = 0LL; ii != v34; iuint64_t i = (char *)ii + 1)
      {
        if (*(void *)v52 != v35) {
          objc_enumerationMutation(v32);
        }
        -[ALSLocationRequest addScdmaCellTower:]( self,  "addScdmaCellTower:",  *(void *)(*((void *)&v51 + 1) + 8LL * (void)ii));
      }

      id v34 = [v32 countByEnumeratingWithState:&v51 objects:v76 count:16];
    }

    while (v34);
  }

  if ((*((_BYTE *)a3 + 144) & 0x20) != 0)
  {
    self->_numberOfSurroundingScdmaCells = *((_DWORD *)a3 + 27);
    *(_BYTE *)&self->_has |= 0x20u;
  }

  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  uint64_t v37 = (void *)*((void *)a3 + 10);
  id v38 = [v37 countByEnumeratingWithState:&v47 objects:v75 count:16];
  if (v38)
  {
    id v39 = v38;
    uint64_t v40 = *(void *)v48;
    do
    {
      for (juint64_t j = 0LL; jj != v39; juint64_t j = (char *)jj + 1)
      {
        if (*(void *)v48 != v40) {
          objc_enumerationMutation(v37);
        }
        -[ALSLocationRequest addNr5GCellTower:]( self,  "addNr5GCellTower:",  *(void *)(*((void *)&v47 + 1) + 8LL * (void)jj));
      }

      id v39 = [v37 countByEnumeratingWithState:&v47 objects:v75 count:16];
    }

    while (v39);
  }

  if ((*((_BYTE *)a3 + 144) & 0x10) != 0)
  {
    self->_numberOfSurroundingNr5GCells = *((_DWORD *)a3 + 26);
    *(_BYTE *)&self->_has |= 0x10u;
  }

  id v42 = (char *)[a3 surroundingWifiBandsCount];
  if (v42)
  {
    uint64_t v43 = v42;
    for (kuint64_t k = 0LL; kk != v43; ++kk)
      -[ALSLocationRequest addSurroundingWifiBands:]( self,  "addSurroundingWifiBands:",  [a3 surroundingWifiBandsAtIndex:kk]);
  }

  if (*((char *)a3 + 144) < 0)
  {
    self->_int wifiAltitudeScale = *((_DWORD *)a3 + 32);
    *(_BYTE *)&self->_has |= 0x80u;
  }

  meta = self->_meta;
  uint64_t v46 = *((void *)a3 + 9);
  if (meta)
  {
    if (v46) {
      -[ALSMeta mergeFrom:](meta, "mergeFrom:");
    }
  }

  else if (v46)
  {
    -[ALSLocationRequest setMeta:](self, "setMeta:");
  }

- (NSMutableArray)cellTowers
{
  return self->_cellTowers;
}

- (void)setCellTowers:(id)a3
{
}

- (NSMutableArray)wirelessAPs
{
  return self->_wirelessAPs;
}

- (void)setWirelessAPs:(id)a3
{
}

- (int)numberOfSurroundingCells
{
  return self->_numberOfSurroundingCells;
}

- (int)numberOfSurroundingWifis
{
  return self->_numberOfSurroundingWifis;
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
}

- (NSMutableArray)cdmaCellTowers
{
  return self->_cdmaCellTowers;
}

- (void)setCdmaCellTowers:(id)a3
{
}

- (NSMutableArray)cdmaEvdoTowers
{
  return self->_cdmaEvdoTowers;
}

- (void)setCdmaEvdoTowers:(id)a3
{
}

- (int)numberOfSurroundingCdmaCells
{
  return self->_numberOfSurroundingCdmaCells;
}

- (int)numberOfSurroundingCdmaEvdoCells
{
  return self->_numberOfSurroundingCdmaEvdoCells;
}

- (NSMutableArray)lteCellTowers
{
  return self->_lteCellTowers;
}

- (void)setLteCellTowers:(id)a3
{
}

- (int)numberOfSurroundingLteCells
{
  return self->_numberOfSurroundingLteCells;
}

- (NSMutableArray)scdmaCellTowers
{
  return self->_scdmaCellTowers;
}

- (void)setScdmaCellTowers:(id)a3
{
}

- (int)numberOfSurroundingScdmaCells
{
  return self->_numberOfSurroundingScdmaCells;
}

- (NSMutableArray)nr5GCellTowers
{
  return self->_nr5GCellTowers;
}

- (void)setNr5GCellTowers:(id)a3
{
}

- (int)numberOfSurroundingNr5GCells
{
  return self->_numberOfSurroundingNr5GCells;
}

- (ALSMeta)meta
{
  return self->_meta;
}

- (void)setMeta:(id)a3
{
}

@end
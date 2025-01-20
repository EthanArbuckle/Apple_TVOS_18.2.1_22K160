@interface ALSNearbyResponse
+ (Class)cdmaCellTowerType;
+ (Class)cdmaEvdoTowerType;
+ (Class)cellTowerType;
+ (Class)lteCellTowerType;
+ (Class)nr5GCellTowerType;
+ (Class)scdmaCellTowerType;
+ (Class)wirelessAPType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)cdmaCellTowers;
- (NSMutableArray)cdmaEvdoTowers;
- (NSMutableArray)cellTowers;
- (NSMutableArray)lteCellTowers;
- (NSMutableArray)nr5GCellTowers;
- (NSMutableArray)scdmaCellTowers;
- (NSMutableArray)wirelessAPs;
- (id)cdmaCellTowerAtIndex:(unint64_t)a3;
- (id)cdmaEvdoTowerAtIndex:(unint64_t)a3;
- (id)cellTowerAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)lteCellTowerAtIndex:(unint64_t)a3;
- (id)nr5GCellTowerAtIndex:(unint64_t)a3;
- (id)scdmaCellTowerAtIndex:(unint64_t)a3;
- (id)wirelessAPAtIndex:(unint64_t)a3;
- (unint64_t)cdmaCellTowersCount;
- (unint64_t)cdmaEvdoTowersCount;
- (unint64_t)cellTowersCount;
- (unint64_t)hash;
- (unint64_t)lteCellTowersCount;
- (unint64_t)nr5GCellTowersCount;
- (unint64_t)scdmaCellTowersCount;
- (unint64_t)wirelessAPsCount;
- (void)addCdmaCellTower:(id)a3;
- (void)addCdmaEvdoTower:(id)a3;
- (void)addCellTower:(id)a3;
- (void)addLteCellTower:(id)a3;
- (void)addNr5GCellTower:(id)a3;
- (void)addScdmaCellTower:(id)a3;
- (void)addWirelessAP:(id)a3;
- (void)clearCdmaCellTowers;
- (void)clearCdmaEvdoTowers;
- (void)clearCellTowers;
- (void)clearLteCellTowers;
- (void)clearNr5GCellTowers;
- (void)clearScdmaCellTowers;
- (void)clearWirelessAPs;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCdmaCellTowers:(id)a3;
- (void)setCdmaEvdoTowers:(id)a3;
- (void)setCellTowers:(id)a3;
- (void)setLteCellTowers:(id)a3;
- (void)setNr5GCellTowers:(id)a3;
- (void)setScdmaCellTowers:(id)a3;
- (void)setWirelessAPs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALSNearbyResponse

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALSNearbyResponse;
  -[ALSNearbyResponse dealloc](&v3, "dealloc");
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

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALSNearbyResponse;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[ALSNearbyResponse description](&v3, "description"),  -[ALSNearbyResponse dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  if (-[NSMutableArray count](self->_cellTowers, "count"))
  {
    v4 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_cellTowers, "count"));
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    __int128 v73 = 0u;
    __int128 v74 = 0u;
    cellTowers = self->_cellTowers;
    id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cellTowers,  "countByEnumeratingWithState:objects:count:",  &v71,  v81,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v72;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v72 != v8) {
            objc_enumerationMutation(cellTowers);
          }
          -[NSMutableArray addObject:]( v4,  "addObject:",  [*(id *)(*((void *)&v71 + 1) + 8 * (void)i) dictionaryRepresentation]);
        }

        id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cellTowers,  "countByEnumeratingWithState:objects:count:",  &v71,  v81,  16LL);
      }

      while (v7);
    }

    [v3 setObject:v4 forKey:@"cellTower"];
  }

  if (-[NSMutableArray count](self->_wirelessAPs, "count"))
  {
    v10 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_wirelessAPs, "count"));
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    __int128 v69 = 0u;
    __int128 v70 = 0u;
    wirelessAPs = self->_wirelessAPs;
    id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( wirelessAPs,  "countByEnumeratingWithState:objects:count:",  &v67,  v80,  16LL);
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v68;
      do
      {
        for (j = 0LL; j != v13; j = (char *)j + 1)
        {
          if (*(void *)v68 != v14) {
            objc_enumerationMutation(wirelessAPs);
          }
          -[NSMutableArray addObject:]( v10,  "addObject:",  [*(id *)(*((void *)&v67 + 1) + 8 * (void)j) dictionaryRepresentation]);
        }

        id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( wirelessAPs,  "countByEnumeratingWithState:objects:count:",  &v67,  v80,  16LL);
      }

      while (v13);
    }

    [v3 setObject:v10 forKey:@"wirelessAP"];
  }

  if (-[NSMutableArray count](self->_cdmaCellTowers, "count"))
  {
    v16 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_cdmaCellTowers, "count"));
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    cdmaCellTowers = self->_cdmaCellTowers;
    id v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cdmaCellTowers,  "countByEnumeratingWithState:objects:count:",  &v63,  v79,  16LL);
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v64;
      do
      {
        for (k = 0LL; k != v19; k = (char *)k + 1)
        {
          if (*(void *)v64 != v20) {
            objc_enumerationMutation(cdmaCellTowers);
          }
          -[NSMutableArray addObject:]( v16,  "addObject:",  [*(id *)(*((void *)&v63 + 1) + 8 * (void)k) dictionaryRepresentation]);
        }

        id v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cdmaCellTowers,  "countByEnumeratingWithState:objects:count:",  &v63,  v79,  16LL);
      }

      while (v19);
    }

    [v3 setObject:v16 forKey:@"cdmaCellTower"];
  }

  if (-[NSMutableArray count](self->_cdmaEvdoTowers, "count"))
  {
    v22 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_cdmaEvdoTowers, "count"));
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    cdmaEvdoTowers = self->_cdmaEvdoTowers;
    id v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cdmaEvdoTowers,  "countByEnumeratingWithState:objects:count:",  &v59,  v78,  16LL);
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v60;
      do
      {
        for (m = 0LL; m != v25; m = (char *)m + 1)
        {
          if (*(void *)v60 != v26) {
            objc_enumerationMutation(cdmaEvdoTowers);
          }
          -[NSMutableArray addObject:]( v22,  "addObject:",  [*(id *)(*((void *)&v59 + 1) + 8 * (void)m) dictionaryRepresentation]);
        }

        id v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cdmaEvdoTowers,  "countByEnumeratingWithState:objects:count:",  &v59,  v78,  16LL);
      }

      while (v25);
    }

    [v3 setObject:v22 forKey:@"cdmaEvdoTower"];
  }

  if (-[NSMutableArray count](self->_lteCellTowers, "count"))
  {
    v28 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_lteCellTowers, "count"));
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    lteCellTowers = self->_lteCellTowers;
    id v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( lteCellTowers,  "countByEnumeratingWithState:objects:count:",  &v55,  v77,  16LL);
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v56;
      do
      {
        for (n = 0LL; n != v31; n = (char *)n + 1)
        {
          if (*(void *)v56 != v32) {
            objc_enumerationMutation(lteCellTowers);
          }
          -[NSMutableArray addObject:]( v28,  "addObject:",  [*(id *)(*((void *)&v55 + 1) + 8 * (void)n) dictionaryRepresentation]);
        }

        id v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( lteCellTowers,  "countByEnumeratingWithState:objects:count:",  &v55,  v77,  16LL);
      }

      while (v31);
    }

    [v3 setObject:v28 forKey:@"lteCellTower"];
  }

  if (-[NSMutableArray count](self->_scdmaCellTowers, "count"))
  {
    v34 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_scdmaCellTowers, "count"));
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    scdmaCellTowers = self->_scdmaCellTowers;
    id v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( scdmaCellTowers,  "countByEnumeratingWithState:objects:count:",  &v51,  v76,  16LL);
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v52;
      do
      {
        for (ii = 0LL; ii != v37; ii = (char *)ii + 1)
        {
          if (*(void *)v52 != v38) {
            objc_enumerationMutation(scdmaCellTowers);
          }
          -[NSMutableArray addObject:]( v34,  "addObject:",  [*(id *)(*((void *)&v51 + 1) + 8 * (void)ii) dictionaryRepresentation]);
        }

        id v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( scdmaCellTowers,  "countByEnumeratingWithState:objects:count:",  &v51,  v76,  16LL);
      }

      while (v37);
    }

    [v3 setObject:v34 forKey:@"scdmaCellTower"];
  }

  if (-[NSMutableArray count](self->_nr5GCellTowers, "count"))
  {
    v40 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_nr5GCellTowers, "count"));
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    nr5GCellTowers = self->_nr5GCellTowers;
    id v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( nr5GCellTowers,  "countByEnumeratingWithState:objects:count:",  &v47,  v75,  16LL);
    if (v42)
    {
      id v43 = v42;
      uint64_t v44 = *(void *)v48;
      do
      {
        for (jj = 0LL; jj != v43; jj = (char *)jj + 1)
        {
          if (*(void *)v48 != v44) {
            objc_enumerationMutation(nr5GCellTowers);
          }
          -[NSMutableArray addObject:]( v40,  "addObject:",  [*(id *)(*((void *)&v47 + 1) + 8 * (void)jj) dictionaryRepresentation]);
        }

        id v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( nr5GCellTowers,  "countByEnumeratingWithState:objects:count:",  &v47,  v75,  16LL);
      }

      while (v43);
    }

    [v3 setObject:v40 forKey:@"nr5GCellTower"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100BD0408(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  cellTowers = self->_cellTowers;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cellTowers,  "countByEnumeratingWithState:objects:count:",  &v64,  v74,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v65;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v65 != v8) {
          objc_enumerationMutation(cellTowers);
        }
        PBDataWriterWriteSubmessage(a3, *(void *)(*((void *)&v64 + 1) + 8LL * (void)i), 1LL);
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cellTowers,  "countByEnumeratingWithState:objects:count:",  &v64,  v74,  16LL);
    }

    while (v7);
  }

  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  wirelessAPs = self->_wirelessAPs;
  id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( wirelessAPs,  "countByEnumeratingWithState:objects:count:",  &v60,  v73,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v61;
    do
    {
      for (j = 0LL; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v61 != v13) {
          objc_enumerationMutation(wirelessAPs);
        }
        PBDataWriterWriteSubmessage(a3, *(void *)(*((void *)&v60 + 1) + 8LL * (void)j), 2LL);
      }

      id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( wirelessAPs,  "countByEnumeratingWithState:objects:count:",  &v60,  v73,  16LL);
    }

    while (v12);
  }

  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  cdmaCellTowers = self->_cdmaCellTowers;
  id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cdmaCellTowers,  "countByEnumeratingWithState:objects:count:",  &v56,  v72,  16LL);
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v57;
    do
    {
      for (k = 0LL; k != v17; k = (char *)k + 1)
      {
        if (*(void *)v57 != v18) {
          objc_enumerationMutation(cdmaCellTowers);
        }
        PBDataWriterWriteSubmessage(a3, *(void *)(*((void *)&v56 + 1) + 8LL * (void)k), 21LL);
      }

      id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cdmaCellTowers,  "countByEnumeratingWithState:objects:count:",  &v56,  v72,  16LL);
    }

    while (v17);
  }

  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  cdmaEvdoTowers = self->_cdmaEvdoTowers;
  id v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cdmaEvdoTowers,  "countByEnumeratingWithState:objects:count:",  &v52,  v71,  16LL);
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v53;
    do
    {
      for (m = 0LL; m != v22; m = (char *)m + 1)
      {
        if (*(void *)v53 != v23) {
          objc_enumerationMutation(cdmaEvdoTowers);
        }
        PBDataWriterWriteSubmessage(a3, *(void *)(*((void *)&v52 + 1) + 8LL * (void)m), 22LL);
      }

      id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cdmaEvdoTowers,  "countByEnumeratingWithState:objects:count:",  &v52,  v71,  16LL);
    }

    while (v22);
  }

  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  lteCellTowers = self->_lteCellTowers;
  id v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( lteCellTowers,  "countByEnumeratingWithState:objects:count:",  &v48,  v70,  16LL);
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v49;
    do
    {
      for (n = 0LL; n != v27; n = (char *)n + 1)
      {
        if (*(void *)v49 != v28) {
          objc_enumerationMutation(lteCellTowers);
        }
        PBDataWriterWriteSubmessage(a3, *(void *)(*((void *)&v48 + 1) + 8LL * (void)n), 23LL);
      }

      id v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( lteCellTowers,  "countByEnumeratingWithState:objects:count:",  &v48,  v70,  16LL);
    }

    while (v27);
  }

  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  scdmaCellTowers = self->_scdmaCellTowers;
  id v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( scdmaCellTowers,  "countByEnumeratingWithState:objects:count:",  &v44,  v69,  16LL);
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v45;
    do
    {
      for (ii = 0LL; ii != v32; ii = (char *)ii + 1)
      {
        if (*(void *)v45 != v33) {
          objc_enumerationMutation(scdmaCellTowers);
        }
        PBDataWriterWriteSubmessage(a3, *(void *)(*((void *)&v44 + 1) + 8LL * (void)ii), 24LL);
      }

      id v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( scdmaCellTowers,  "countByEnumeratingWithState:objects:count:",  &v44,  v69,  16LL);
    }

    while (v32);
  }

  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  nr5GCellTowers = self->_nr5GCellTowers;
  id v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( nr5GCellTowers,  "countByEnumeratingWithState:objects:count:",  &v40,  v68,  16LL);
  if (v36)
  {
    id v37 = v36;
    uint64_t v38 = *(void *)v41;
    do
    {
      for (jj = 0LL; jj != v37; jj = (char *)jj + 1)
      {
        if (*(void *)v41 != v38) {
          objc_enumerationMutation(nr5GCellTowers);
        }
        PBDataWriterWriteSubmessage(a3, *(void *)(*((void *)&v40 + 1) + 8LL * (void)jj), 25LL);
      }

      id v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( nr5GCellTowers,  "countByEnumeratingWithState:objects:count:",  &v40,  v68,  16LL);
    }

    while (v37);
  }

- (void)copyTo:(id)a3
{
  if (-[ALSNearbyResponse cellTowersCount](self, "cellTowersCount"))
  {
    [a3 clearCellTowers];
    unint64_t v5 = -[ALSNearbyResponse cellTowersCount](self, "cellTowersCount");
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0LL; i != v6; ++i)
        objc_msgSend(a3, "addCellTower:", -[ALSNearbyResponse cellTowerAtIndex:](self, "cellTowerAtIndex:", i));
    }
  }

  if (-[ALSNearbyResponse wirelessAPsCount](self, "wirelessAPsCount"))
  {
    [a3 clearWirelessAPs];
    unint64_t v8 = -[ALSNearbyResponse wirelessAPsCount](self, "wirelessAPsCount");
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0LL; j != v9; ++j)
        objc_msgSend(a3, "addWirelessAP:", -[ALSNearbyResponse wirelessAPAtIndex:](self, "wirelessAPAtIndex:", j));
    }
  }

  if (-[ALSNearbyResponse cdmaCellTowersCount](self, "cdmaCellTowersCount"))
  {
    [a3 clearCdmaCellTowers];
    unint64_t v11 = -[ALSNearbyResponse cdmaCellTowersCount](self, "cdmaCellTowersCount");
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t k = 0LL; k != v12; ++k)
        objc_msgSend( a3,  "addCdmaCellTower:",  -[ALSNearbyResponse cdmaCellTowerAtIndex:](self, "cdmaCellTowerAtIndex:", k));
    }
  }

  if (-[ALSNearbyResponse cdmaEvdoTowersCount](self, "cdmaEvdoTowersCount"))
  {
    [a3 clearCdmaEvdoTowers];
    unint64_t v14 = -[ALSNearbyResponse cdmaEvdoTowersCount](self, "cdmaEvdoTowersCount");
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t m = 0LL; m != v15; ++m)
        objc_msgSend( a3,  "addCdmaEvdoTower:",  -[ALSNearbyResponse cdmaEvdoTowerAtIndex:](self, "cdmaEvdoTowerAtIndex:", m));
    }
  }

  if (-[ALSNearbyResponse lteCellTowersCount](self, "lteCellTowersCount"))
  {
    [a3 clearLteCellTowers];
    unint64_t v17 = -[ALSNearbyResponse lteCellTowersCount](self, "lteCellTowersCount");
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t n = 0LL; n != v18; ++n)
        objc_msgSend(a3, "addLteCellTower:", -[ALSNearbyResponse lteCellTowerAtIndex:](self, "lteCellTowerAtIndex:", n));
    }
  }

  if (-[ALSNearbyResponse scdmaCellTowersCount](self, "scdmaCellTowersCount"))
  {
    [a3 clearScdmaCellTowers];
    unint64_t v20 = -[ALSNearbyResponse scdmaCellTowersCount](self, "scdmaCellTowersCount");
    if (v20)
    {
      unint64_t v21 = v20;
      for (iuint64_t i = 0LL; ii != v21; ++ii)
        objc_msgSend( a3,  "addScdmaCellTower:",  -[ALSNearbyResponse scdmaCellTowerAtIndex:](self, "scdmaCellTowerAtIndex:", ii));
    }
  }

  if (-[ALSNearbyResponse nr5GCellTowersCount](self, "nr5GCellTowersCount"))
  {
    [a3 clearNr5GCellTowers];
    unint64_t v23 = -[ALSNearbyResponse nr5GCellTowersCount](self, "nr5GCellTowersCount");
    if (v23)
    {
      unint64_t v24 = v23;
      for (juint64_t j = 0LL; jj != v24; ++jj)
        objc_msgSend( a3,  "addNr5GCellTower:",  -[ALSNearbyResponse nr5GCellTowerAtIndex:](self, "nr5GCellTowerAtIndex:", jj));
    }
  }

- (id)copyWithZone:(_NSZone *)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  id v7 = objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "init");
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  cellTowers = self->_cellTowers;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cellTowers,  "countByEnumeratingWithState:objects:count:",  &v75,  v85,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v76;
    do
    {
      for (uint64_t i = 0LL; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v76 != v11) {
          objc_enumerationMutation(cellTowers);
        }
        id v13 = [*(id *)(*((void *)&v75 + 1) + 8 * (void)i) copyWithZone:a3];
        [v7 addCellTower:v13];
      }

      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cellTowers,  "countByEnumeratingWithState:objects:count:",  &v75,  v85,  16LL);
    }

    while (v10);
  }

  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  wirelessAPs = self->_wirelessAPs;
  id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( wirelessAPs,  "countByEnumeratingWithState:objects:count:",  &v71,  v84,  16LL);
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v72;
    do
    {
      for (uint64_t j = 0LL; j != v16; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v72 != v17) {
          objc_enumerationMutation(wirelessAPs);
        }
        id v19 = [*(id *)(*((void *)&v71 + 1) + 8 * (void)j) copyWithZone:a3];
        [v7 addWirelessAP:v19];
      }

      id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( wirelessAPs,  "countByEnumeratingWithState:objects:count:",  &v71,  v84,  16LL);
    }

    while (v16);
  }

  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  cdmaCellTowers = self->_cdmaCellTowers;
  id v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cdmaCellTowers,  "countByEnumeratingWithState:objects:count:",  &v67,  v83,  16LL);
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v68;
    do
    {
      for (uint64_t k = 0LL; k != v22; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v68 != v23) {
          objc_enumerationMutation(cdmaCellTowers);
        }
        id v25 = [*(id *)(*((void *)&v67 + 1) + 8 * (void)k) copyWithZone:a3];
        [v7 addCdmaCellTower:v25];
      }

      id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cdmaCellTowers,  "countByEnumeratingWithState:objects:count:",  &v67,  v83,  16LL);
    }

    while (v22);
  }

  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  cdmaEvdoTowers = self->_cdmaEvdoTowers;
  id v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cdmaEvdoTowers,  "countByEnumeratingWithState:objects:count:",  &v63,  v82,  16LL);
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v64;
    do
    {
      for (uint64_t m = 0LL; m != v28; uint64_t m = (char *)m + 1)
      {
        if (*(void *)v64 != v29) {
          objc_enumerationMutation(cdmaEvdoTowers);
        }
        id v31 = [*(id *)(*((void *)&v63 + 1) + 8 * (void)m) copyWithZone:a3];
        [v7 addCdmaEvdoTower:v31];
      }

      id v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cdmaEvdoTowers,  "countByEnumeratingWithState:objects:count:",  &v63,  v82,  16LL);
    }

    while (v28);
  }

  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  lteCellTowers = self->_lteCellTowers;
  id v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( lteCellTowers,  "countByEnumeratingWithState:objects:count:",  &v59,  v81,  16LL);
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v60;
    do
    {
      for (uint64_t n = 0LL; n != v34; uint64_t n = (char *)n + 1)
      {
        if (*(void *)v60 != v35) {
          objc_enumerationMutation(lteCellTowers);
        }
        id v37 = [*(id *)(*((void *)&v59 + 1) + 8 * (void)n) copyWithZone:a3];
        [v7 addLteCellTower:v37];
      }

      id v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( lteCellTowers,  "countByEnumeratingWithState:objects:count:",  &v59,  v81,  16LL);
    }

    while (v34);
  }

  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  scdmaCellTowers = self->_scdmaCellTowers;
  id v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( scdmaCellTowers,  "countByEnumeratingWithState:objects:count:",  &v55,  v80,  16LL);
  if (v39)
  {
    id v40 = v39;
    uint64_t v41 = *(void *)v56;
    do
    {
      for (iuint64_t i = 0LL; ii != v40; iuint64_t i = (char *)ii + 1)
      {
        if (*(void *)v56 != v41) {
          objc_enumerationMutation(scdmaCellTowers);
        }
        id v43 = [*(id *)(*((void *)&v55 + 1) + 8 * (void)ii) copyWithZone:a3];
        [v7 addScdmaCellTower:v43];
      }

      id v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( scdmaCellTowers,  "countByEnumeratingWithState:objects:count:",  &v55,  v80,  16LL);
    }

    while (v40);
  }

  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  nr5GCellTowers = self->_nr5GCellTowers;
  id v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( nr5GCellTowers,  "countByEnumeratingWithState:objects:count:",  &v51,  v79,  16LL);
  if (v45)
  {
    id v46 = v45;
    uint64_t v47 = *(void *)v52;
    do
    {
      for (juint64_t j = 0LL; jj != v46; juint64_t j = (char *)jj + 1)
      {
        if (*(void *)v52 != v47) {
          objc_enumerationMutation(nr5GCellTowers);
        }
        id v49 = [*(id *)(*((void *)&v51 + 1) + 8 * (void)jj) copyWithZone:a3];
        [v7 addNr5GCellTower:v49];
      }

      id v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( nr5GCellTowers,  "countByEnumeratingWithState:objects:count:",  &v51,  v79,  16LL);
    }

    while (v46);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  unsigned int v7 = objc_msgSend(a3, "isMemberOfClass:", v6, v5);
  if (v7)
  {
    cellTowers = self->_cellTowers;
    if (!((unint64_t)cellTowers | *((void *)a3 + 3))
      || (unsigned int v7 = -[NSMutableArray isEqual:](cellTowers, "isEqual:")) != 0)
    {
      wirelessAPs = self->_wirelessAPs;
      if (!((unint64_t)wirelessAPs | *((void *)a3 + 7))
        || (unsigned int v7 = -[NSMutableArray isEqual:](wirelessAPs, "isEqual:")) != 0)
      {
        cdmaCellTowers = self->_cdmaCellTowers;
        if (!((unint64_t)cdmaCellTowers | *((void *)a3 + 1))
          || (unsigned int v7 = -[NSMutableArray isEqual:](cdmaCellTowers, "isEqual:")) != 0)
        {
          cdmaEvdoTowers = self->_cdmaEvdoTowers;
          if (!((unint64_t)cdmaEvdoTowers | *((void *)a3 + 2))
            || (unsigned int v7 = -[NSMutableArray isEqual:](cdmaEvdoTowers, "isEqual:")) != 0)
          {
            lteCellTowers = self->_lteCellTowers;
            if (!((unint64_t)lteCellTowers | *((void *)a3 + 4))
              || (unsigned int v7 = -[NSMutableArray isEqual:](lteCellTowers, "isEqual:")) != 0)
            {
              scdmaCellTowers = self->_scdmaCellTowers;
              if (!((unint64_t)scdmaCellTowers | *((void *)a3 + 6))
                || (unsigned int v7 = -[NSMutableArray isEqual:](scdmaCellTowers, "isEqual:")) != 0)
              {
                nr5GCellTowers = self->_nr5GCellTowers;
                else {
                  LOBYTE(v7) = 1;
                }
              }
            }
          }
        }
      }
    }
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)-[NSMutableArray hash](self->_cellTowers, "hash");
  unint64_t v4 = (unint64_t)-[NSMutableArray hash](self->_wirelessAPs, "hash") ^ v3;
  unint64_t v5 = (unint64_t)-[NSMutableArray hash](self->_cdmaCellTowers, "hash");
  unint64_t v6 = v4 ^ v5 ^ (unint64_t)-[NSMutableArray hash](self->_cdmaEvdoTowers, "hash");
  unint64_t v7 = (unint64_t)-[NSMutableArray hash](self->_lteCellTowers, "hash");
  unint64_t v8 = v7 ^ (unint64_t)-[NSMutableArray hash](self->_scdmaCellTowers, "hash");
  return v6 ^ v8 ^ (unint64_t)-[NSMutableArray hash](self->_nr5GCellTowers, "hash");
}

- (void)mergeFrom:(id)a3
{
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  unint64_t v5 = (void *)*((void *)a3 + 3);
  id v6 = [v5 countByEnumeratingWithState:&v64 objects:v74 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v65;
    do
    {
      for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v65 != v8) {
          objc_enumerationMutation(v5);
        }
        -[ALSNearbyResponse addCellTower:](self, "addCellTower:", *(void *)(*((void *)&v64 + 1) + 8LL * (void)i));
      }

      id v7 = [v5 countByEnumeratingWithState:&v64 objects:v74 count:16];
    }

    while (v7);
  }

  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  id v10 = (void *)*((void *)a3 + 7);
  id v11 = [v10 countByEnumeratingWithState:&v60 objects:v73 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v61;
    do
    {
      for (uint64_t j = 0LL; j != v12; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v61 != v13) {
          objc_enumerationMutation(v10);
        }
        -[ALSNearbyResponse addWirelessAP:]( self,  "addWirelessAP:",  *(void *)(*((void *)&v60 + 1) + 8LL * (void)j));
      }

      id v12 = [v10 countByEnumeratingWithState:&v60 objects:v73 count:16];
    }

    while (v12);
  }

  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  id v15 = (void *)*((void *)a3 + 1);
  id v16 = [v15 countByEnumeratingWithState:&v56 objects:v72 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v57;
    do
    {
      for (uint64_t k = 0LL; k != v17; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v57 != v18) {
          objc_enumerationMutation(v15);
        }
        -[ALSNearbyResponse addCdmaCellTower:]( self,  "addCdmaCellTower:",  *(void *)(*((void *)&v56 + 1) + 8LL * (void)k));
      }

      id v17 = [v15 countByEnumeratingWithState:&v56 objects:v72 count:16];
    }

    while (v17);
  }

  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  unint64_t v20 = (void *)*((void *)a3 + 2);
  id v21 = [v20 countByEnumeratingWithState:&v52 objects:v71 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v53;
    do
    {
      for (uint64_t m = 0LL; m != v22; uint64_t m = (char *)m + 1)
      {
        if (*(void *)v53 != v23) {
          objc_enumerationMutation(v20);
        }
        -[ALSNearbyResponse addCdmaEvdoTower:]( self,  "addCdmaEvdoTower:",  *(void *)(*((void *)&v52 + 1) + 8LL * (void)m));
      }

      id v22 = [v20 countByEnumeratingWithState:&v52 objects:v71 count:16];
    }

    while (v22);
  }

  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id v25 = (void *)*((void *)a3 + 4);
  id v26 = [v25 countByEnumeratingWithState:&v48 objects:v70 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v49;
    do
    {
      for (uint64_t n = 0LL; n != v27; uint64_t n = (char *)n + 1)
      {
        if (*(void *)v49 != v28) {
          objc_enumerationMutation(v25);
        }
        -[ALSNearbyResponse addLteCellTower:]( self,  "addLteCellTower:",  *(void *)(*((void *)&v48 + 1) + 8LL * (void)n));
      }

      id v27 = [v25 countByEnumeratingWithState:&v48 objects:v70 count:16];
    }

    while (v27);
  }

  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id v30 = (void *)*((void *)a3 + 6);
  id v31 = [v30 countByEnumeratingWithState:&v44 objects:v69 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v45;
    do
    {
      for (iuint64_t i = 0LL; ii != v32; iuint64_t i = (char *)ii + 1)
      {
        if (*(void *)v45 != v33) {
          objc_enumerationMutation(v30);
        }
        -[ALSNearbyResponse addScdmaCellTower:]( self,  "addScdmaCellTower:",  *(void *)(*((void *)&v44 + 1) + 8LL * (void)ii));
      }

      id v32 = [v30 countByEnumeratingWithState:&v44 objects:v69 count:16];
    }

    while (v32);
  }

  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  uint64_t v35 = (void *)*((void *)a3 + 5);
  id v36 = [v35 countByEnumeratingWithState:&v40 objects:v68 count:16];
  if (v36)
  {
    id v37 = v36;
    uint64_t v38 = *(void *)v41;
    do
    {
      for (juint64_t j = 0LL; jj != v37; juint64_t j = (char *)jj + 1)
      {
        if (*(void *)v41 != v38) {
          objc_enumerationMutation(v35);
        }
        -[ALSNearbyResponse addNr5GCellTower:]( self,  "addNr5GCellTower:",  *(void *)(*((void *)&v40 + 1) + 8LL * (void)jj));
      }

      id v37 = [v35 countByEnumeratingWithState:&v40 objects:v68 count:16];
    }

    while (v37);
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

- (NSMutableArray)lteCellTowers
{
  return self->_lteCellTowers;
}

- (void)setLteCellTowers:(id)a3
{
}

- (NSMutableArray)scdmaCellTowers
{
  return self->_scdmaCellTowers;
}

- (void)setScdmaCellTowers:(id)a3
{
}

- (NSMutableArray)nr5GCellTowers
{
  return self->_nr5GCellTowers;
}

- (void)setNr5GCellTowers:(id)a3
{
}

@end
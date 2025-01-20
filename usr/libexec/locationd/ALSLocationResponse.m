@interface ALSLocationResponse
+ (Class)cdmaCellTowerType;
+ (Class)cellTowerType;
+ (Class)lteCellTowerType;
+ (Class)nr5GCellTowerType;
+ (Class)scdmaCellTowerType;
+ (Class)wirelessAPType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)cdmaCellTowers;
- (NSMutableArray)cellTowers;
- (NSMutableArray)lteCellTowers;
- (NSMutableArray)nr5GCellTowers;
- (NSMutableArray)scdmaCellTowers;
- (NSMutableArray)wirelessAPs;
- (id)cdmaCellTowerAtIndex:(unint64_t)a3;
- (id)cellTowerAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)lteCellTowerAtIndex:(unint64_t)a3;
- (id)nr5GCellTowerAtIndex:(unint64_t)a3;
- (id)scdmaCellTowerAtIndex:(unint64_t)a3;
- (id)wirelessAPAtIndex:(unint64_t)a3;
- (unint64_t)cdmaCellTowersCount;
- (unint64_t)cellTowersCount;
- (unint64_t)hash;
- (unint64_t)lteCellTowersCount;
- (unint64_t)nr5GCellTowersCount;
- (unint64_t)scdmaCellTowersCount;
- (unint64_t)wirelessAPsCount;
- (void)addCdmaCellTower:(id)a3;
- (void)addCellTower:(id)a3;
- (void)addLteCellTower:(id)a3;
- (void)addNr5GCellTower:(id)a3;
- (void)addScdmaCellTower:(id)a3;
- (void)addWirelessAP:(id)a3;
- (void)clearCdmaCellTowers;
- (void)clearCellTowers;
- (void)clearLteCellTowers;
- (void)clearNr5GCellTowers;
- (void)clearScdmaCellTowers;
- (void)clearWirelessAPs;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCdmaCellTowers:(id)a3;
- (void)setCellTowers:(id)a3;
- (void)setLteCellTowers:(id)a3;
- (void)setNr5GCellTowers:(id)a3;
- (void)setScdmaCellTowers:(id)a3;
- (void)setWirelessAPs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALSLocationResponse

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALSLocationResponse;
  -[ALSLocationResponse dealloc](&v3, "dealloc");
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
  v3.super_class = (Class)&OBJC_CLASS___ALSLocationResponse;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[ALSLocationResponse description](&v3, "description"),  -[ALSLocationResponse dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  if (-[NSMutableArray count](self->_cellTowers, "count"))
  {
    v4 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_cellTowers, "count"));
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    cellTowers = self->_cellTowers;
    id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cellTowers,  "countByEnumeratingWithState:objects:count:",  &v61,  v70,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v62;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v62 != v8) {
            objc_enumerationMutation(cellTowers);
          }
          -[NSMutableArray addObject:]( v4,  "addObject:",  [*(id *)(*((void *)&v61 + 1) + 8 * (void)i) dictionaryRepresentation]);
        }

        id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cellTowers,  "countByEnumeratingWithState:objects:count:",  &v61,  v70,  16LL);
      }

      while (v7);
    }

    [v3 setObject:v4 forKey:@"cellTower"];
  }

  if (-[NSMutableArray count](self->_wirelessAPs, "count"))
  {
    v10 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_wirelessAPs, "count"));
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    wirelessAPs = self->_wirelessAPs;
    id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( wirelessAPs,  "countByEnumeratingWithState:objects:count:",  &v57,  v69,  16LL);
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v58;
      do
      {
        for (j = 0LL; j != v13; j = (char *)j + 1)
        {
          if (*(void *)v58 != v14) {
            objc_enumerationMutation(wirelessAPs);
          }
          -[NSMutableArray addObject:]( v10,  "addObject:",  [*(id *)(*((void *)&v57 + 1) + 8 * (void)j) dictionaryRepresentation]);
        }

        id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( wirelessAPs,  "countByEnumeratingWithState:objects:count:",  &v57,  v69,  16LL);
      }

      while (v13);
    }

    [v3 setObject:v10 forKey:@"wirelessAP"];
  }

  if (-[NSMutableArray count](self->_cdmaCellTowers, "count"))
  {
    v16 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_cdmaCellTowers, "count"));
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    cdmaCellTowers = self->_cdmaCellTowers;
    id v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cdmaCellTowers,  "countByEnumeratingWithState:objects:count:",  &v53,  v68,  16LL);
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v54;
      do
      {
        for (k = 0LL; k != v19; k = (char *)k + 1)
        {
          if (*(void *)v54 != v20) {
            objc_enumerationMutation(cdmaCellTowers);
          }
          -[NSMutableArray addObject:]( v16,  "addObject:",  [*(id *)(*((void *)&v53 + 1) + 8 * (void)k) dictionaryRepresentation]);
        }

        id v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cdmaCellTowers,  "countByEnumeratingWithState:objects:count:",  &v53,  v68,  16LL);
      }

      while (v19);
    }

    [v3 setObject:v16 forKey:@"cdmaCellTower"];
  }

  if (-[NSMutableArray count](self->_lteCellTowers, "count"))
  {
    v22 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_lteCellTowers, "count"));
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    lteCellTowers = self->_lteCellTowers;
    id v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( lteCellTowers,  "countByEnumeratingWithState:objects:count:",  &v49,  v67,  16LL);
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v50;
      do
      {
        for (m = 0LL; m != v25; m = (char *)m + 1)
        {
          if (*(void *)v50 != v26) {
            objc_enumerationMutation(lteCellTowers);
          }
          -[NSMutableArray addObject:]( v22,  "addObject:",  [*(id *)(*((void *)&v49 + 1) + 8 * (void)m) dictionaryRepresentation]);
        }

        id v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( lteCellTowers,  "countByEnumeratingWithState:objects:count:",  &v49,  v67,  16LL);
      }

      while (v25);
    }

    [v3 setObject:v22 forKey:@"lteCellTower"];
  }

  if (-[NSMutableArray count](self->_scdmaCellTowers, "count"))
  {
    v28 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_scdmaCellTowers, "count"));
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    scdmaCellTowers = self->_scdmaCellTowers;
    id v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( scdmaCellTowers,  "countByEnumeratingWithState:objects:count:",  &v45,  v66,  16LL);
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v46;
      do
      {
        for (n = 0LL; n != v31; n = (char *)n + 1)
        {
          if (*(void *)v46 != v32) {
            objc_enumerationMutation(scdmaCellTowers);
          }
          -[NSMutableArray addObject:]( v28,  "addObject:",  [*(id *)(*((void *)&v45 + 1) + 8 * (void)n) dictionaryRepresentation]);
        }

        id v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( scdmaCellTowers,  "countByEnumeratingWithState:objects:count:",  &v45,  v66,  16LL);
      }

      while (v31);
    }

    [v3 setObject:v28 forKey:@"scdmaCellTower"];
  }

  if (-[NSMutableArray count](self->_nr5GCellTowers, "count"))
  {
    v34 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_nr5GCellTowers, "count"));
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    nr5GCellTowers = self->_nr5GCellTowers;
    id v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( nr5GCellTowers,  "countByEnumeratingWithState:objects:count:",  &v41,  v65,  16LL);
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v42;
      do
      {
        for (ii = 0LL; ii != v37; ii = (char *)ii + 1)
        {
          if (*(void *)v42 != v38) {
            objc_enumerationMutation(nr5GCellTowers);
          }
          -[NSMutableArray addObject:]( v34,  "addObject:",  [*(id *)(*((void *)&v41 + 1) + 8 * (void)ii) dictionaryRepresentation]);
        }

        id v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( nr5GCellTowers,  "countByEnumeratingWithState:objects:count:",  &v41,  v65,  16LL);
      }

      while (v37);
    }

    [v3 setObject:v34 forKey:@"nr5GCellTower"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100B8D84C(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  cellTowers = self->_cellTowers;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cellTowers,  "countByEnumeratingWithState:objects:count:",  &v55,  v64,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v56;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v56 != v8) {
          objc_enumerationMutation(cellTowers);
        }
        PBDataWriterWriteSubmessage(a3, *(void *)(*((void *)&v55 + 1) + 8LL * (void)i), 1LL);
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cellTowers,  "countByEnumeratingWithState:objects:count:",  &v55,  v64,  16LL);
    }

    while (v7);
  }

  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  wirelessAPs = self->_wirelessAPs;
  id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( wirelessAPs,  "countByEnumeratingWithState:objects:count:",  &v51,  v63,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v52;
    do
    {
      for (j = 0LL; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v52 != v13) {
          objc_enumerationMutation(wirelessAPs);
        }
        PBDataWriterWriteSubmessage(a3, *(void *)(*((void *)&v51 + 1) + 8LL * (void)j), 2LL);
      }

      id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( wirelessAPs,  "countByEnumeratingWithState:objects:count:",  &v51,  v63,  16LL);
    }

    while (v12);
  }

  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  cdmaCellTowers = self->_cdmaCellTowers;
  id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cdmaCellTowers,  "countByEnumeratingWithState:objects:count:",  &v47,  v62,  16LL);
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v48;
    do
    {
      for (k = 0LL; k != v17; k = (char *)k + 1)
      {
        if (*(void *)v48 != v18) {
          objc_enumerationMutation(cdmaCellTowers);
        }
        PBDataWriterWriteSubmessage(a3, *(void *)(*((void *)&v47 + 1) + 8LL * (void)k), 21LL);
      }

      id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cdmaCellTowers,  "countByEnumeratingWithState:objects:count:",  &v47,  v62,  16LL);
    }

    while (v17);
  }

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  lteCellTowers = self->_lteCellTowers;
  id v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( lteCellTowers,  "countByEnumeratingWithState:objects:count:",  &v43,  v61,  16LL);
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v44;
    do
    {
      for (m = 0LL; m != v22; m = (char *)m + 1)
      {
        if (*(void *)v44 != v23) {
          objc_enumerationMutation(lteCellTowers);
        }
        PBDataWriterWriteSubmessage(a3, *(void *)(*((void *)&v43 + 1) + 8LL * (void)m), 22LL);
      }

      id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( lteCellTowers,  "countByEnumeratingWithState:objects:count:",  &v43,  v61,  16LL);
    }

    while (v22);
  }

  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  scdmaCellTowers = self->_scdmaCellTowers;
  id v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( scdmaCellTowers,  "countByEnumeratingWithState:objects:count:",  &v39,  v60,  16LL);
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v40;
    do
    {
      for (n = 0LL; n != v27; n = (char *)n + 1)
      {
        if (*(void *)v40 != v28) {
          objc_enumerationMutation(scdmaCellTowers);
        }
        PBDataWriterWriteSubmessage(a3, *(void *)(*((void *)&v39 + 1) + 8LL * (void)n), 23LL);
      }

      id v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( scdmaCellTowers,  "countByEnumeratingWithState:objects:count:",  &v39,  v60,  16LL);
    }

    while (v27);
  }

  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  nr5GCellTowers = self->_nr5GCellTowers;
  id v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( nr5GCellTowers,  "countByEnumeratingWithState:objects:count:",  &v35,  v59,  16LL);
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v36;
    do
    {
      for (ii = 0LL; ii != v32; ii = (char *)ii + 1)
      {
        if (*(void *)v36 != v33) {
          objc_enumerationMutation(nr5GCellTowers);
        }
        PBDataWriterWriteSubmessage(a3, *(void *)(*((void *)&v35 + 1) + 8LL * (void)ii), 24LL);
      }

      id v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( nr5GCellTowers,  "countByEnumeratingWithState:objects:count:",  &v35,  v59,  16LL);
    }

    while (v32);
  }

- (void)copyTo:(id)a3
{
  if (-[ALSLocationResponse cellTowersCount](self, "cellTowersCount"))
  {
    [a3 clearCellTowers];
    unint64_t v5 = -[ALSLocationResponse cellTowersCount](self, "cellTowersCount");
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0LL; i != v6; ++i)
        objc_msgSend(a3, "addCellTower:", -[ALSLocationResponse cellTowerAtIndex:](self, "cellTowerAtIndex:", i));
    }
  }

  if (-[ALSLocationResponse wirelessAPsCount](self, "wirelessAPsCount"))
  {
    [a3 clearWirelessAPs];
    unint64_t v8 = -[ALSLocationResponse wirelessAPsCount](self, "wirelessAPsCount");
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0LL; j != v9; ++j)
        objc_msgSend(a3, "addWirelessAP:", -[ALSLocationResponse wirelessAPAtIndex:](self, "wirelessAPAtIndex:", j));
    }
  }

  if (-[ALSLocationResponse cdmaCellTowersCount](self, "cdmaCellTowersCount"))
  {
    [a3 clearCdmaCellTowers];
    unint64_t v11 = -[ALSLocationResponse cdmaCellTowersCount](self, "cdmaCellTowersCount");
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t k = 0LL; k != v12; ++k)
        objc_msgSend( a3,  "addCdmaCellTower:",  -[ALSLocationResponse cdmaCellTowerAtIndex:](self, "cdmaCellTowerAtIndex:", k));
    }
  }

  if (-[ALSLocationResponse lteCellTowersCount](self, "lteCellTowersCount"))
  {
    [a3 clearLteCellTowers];
    unint64_t v14 = -[ALSLocationResponse lteCellTowersCount](self, "lteCellTowersCount");
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t m = 0LL; m != v15; ++m)
        objc_msgSend( a3,  "addLteCellTower:",  -[ALSLocationResponse lteCellTowerAtIndex:](self, "lteCellTowerAtIndex:", m));
    }
  }

  if (-[ALSLocationResponse scdmaCellTowersCount](self, "scdmaCellTowersCount"))
  {
    [a3 clearScdmaCellTowers];
    unint64_t v17 = -[ALSLocationResponse scdmaCellTowersCount](self, "scdmaCellTowersCount");
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t n = 0LL; n != v18; ++n)
        objc_msgSend( a3,  "addScdmaCellTower:",  -[ALSLocationResponse scdmaCellTowerAtIndex:](self, "scdmaCellTowerAtIndex:", n));
    }
  }

  if (-[ALSLocationResponse nr5GCellTowersCount](self, "nr5GCellTowersCount"))
  {
    [a3 clearNr5GCellTowers];
    unint64_t v20 = -[ALSLocationResponse nr5GCellTowersCount](self, "nr5GCellTowersCount");
    if (v20)
    {
      unint64_t v21 = v20;
      for (iuint64_t i = 0LL; ii != v21; ++ii)
        objc_msgSend( a3,  "addNr5GCellTower:",  -[ALSLocationResponse nr5GCellTowerAtIndex:](self, "nr5GCellTowerAtIndex:", ii));
    }
  }

- (id)copyWithZone:(_NSZone *)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  id v7 = objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "init");
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  cellTowers = self->_cellTowers;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cellTowers,  "countByEnumeratingWithState:objects:count:",  &v65,  v74,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v66;
    do
    {
      for (uint64_t i = 0LL; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v66 != v11) {
          objc_enumerationMutation(cellTowers);
        }
        id v13 = [*(id *)(*((void *)&v65 + 1) + 8 * (void)i) copyWithZone:a3];
        [v7 addCellTower:v13];
      }

      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cellTowers,  "countByEnumeratingWithState:objects:count:",  &v65,  v74,  16LL);
    }

    while (v10);
  }

  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  wirelessAPs = self->_wirelessAPs;
  id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( wirelessAPs,  "countByEnumeratingWithState:objects:count:",  &v61,  v73,  16LL);
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v62;
    do
    {
      for (uint64_t j = 0LL; j != v16; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v62 != v17) {
          objc_enumerationMutation(wirelessAPs);
        }
        id v19 = [*(id *)(*((void *)&v61 + 1) + 8 * (void)j) copyWithZone:a3];
        [v7 addWirelessAP:v19];
      }

      id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( wirelessAPs,  "countByEnumeratingWithState:objects:count:",  &v61,  v73,  16LL);
    }

    while (v16);
  }

  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  cdmaCellTowers = self->_cdmaCellTowers;
  id v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cdmaCellTowers,  "countByEnumeratingWithState:objects:count:",  &v57,  v72,  16LL);
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v58;
    do
    {
      for (uint64_t k = 0LL; k != v22; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v58 != v23) {
          objc_enumerationMutation(cdmaCellTowers);
        }
        id v25 = [*(id *)(*((void *)&v57 + 1) + 8 * (void)k) copyWithZone:a3];
        [v7 addCdmaCellTower:v25];
      }

      id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cdmaCellTowers,  "countByEnumeratingWithState:objects:count:",  &v57,  v72,  16LL);
    }

    while (v22);
  }

  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  lteCellTowers = self->_lteCellTowers;
  id v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( lteCellTowers,  "countByEnumeratingWithState:objects:count:",  &v53,  v71,  16LL);
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v54;
    do
    {
      for (uint64_t m = 0LL; m != v28; uint64_t m = (char *)m + 1)
      {
        if (*(void *)v54 != v29) {
          objc_enumerationMutation(lteCellTowers);
        }
        id v31 = [*(id *)(*((void *)&v53 + 1) + 8 * (void)m) copyWithZone:a3];
        [v7 addLteCellTower:v31];
      }

      id v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( lteCellTowers,  "countByEnumeratingWithState:objects:count:",  &v53,  v71,  16LL);
    }

    while (v28);
  }

  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  scdmaCellTowers = self->_scdmaCellTowers;
  id v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( scdmaCellTowers,  "countByEnumeratingWithState:objects:count:",  &v49,  v70,  16LL);
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v50;
    do
    {
      for (uint64_t n = 0LL; n != v34; uint64_t n = (char *)n + 1)
      {
        if (*(void *)v50 != v35) {
          objc_enumerationMutation(scdmaCellTowers);
        }
        id v37 = [*(id *)(*((void *)&v49 + 1) + 8 * (void)n) copyWithZone:a3];
        [v7 addScdmaCellTower:v37];
      }

      id v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( scdmaCellTowers,  "countByEnumeratingWithState:objects:count:",  &v49,  v70,  16LL);
    }

    while (v34);
  }

  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  nr5GCellTowers = self->_nr5GCellTowers;
  id v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( nr5GCellTowers,  "countByEnumeratingWithState:objects:count:",  &v45,  v69,  16LL);
  if (v39)
  {
    id v40 = v39;
    uint64_t v41 = *(void *)v46;
    do
    {
      for (iuint64_t i = 0LL; ii != v40; iuint64_t i = (char *)ii + 1)
      {
        if (*(void *)v46 != v41) {
          objc_enumerationMutation(nr5GCellTowers);
        }
        id v43 = [*(id *)(*((void *)&v45 + 1) + 8 * (void)ii) copyWithZone:a3];
        [v7 addNr5GCellTower:v43];
      }

      id v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( nr5GCellTowers,  "countByEnumeratingWithState:objects:count:",  &v45,  v69,  16LL);
    }

    while (v40);
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
    if (!((unint64_t)cellTowers | *((void *)a3 + 2))
      || (unsigned int v7 = -[NSMutableArray isEqual:](cellTowers, "isEqual:")) != 0)
    {
      wirelessAPs = self->_wirelessAPs;
      if (!((unint64_t)wirelessAPs | *((void *)a3 + 6))
        || (unsigned int v7 = -[NSMutableArray isEqual:](wirelessAPs, "isEqual:")) != 0)
      {
        cdmaCellTowers = self->_cdmaCellTowers;
        if (!((unint64_t)cdmaCellTowers | *((void *)a3 + 1))
          || (unsigned int v7 = -[NSMutableArray isEqual:](cdmaCellTowers, "isEqual:")) != 0)
        {
          lteCellTowers = self->_lteCellTowers;
          if (!((unint64_t)lteCellTowers | *((void *)a3 + 3))
            || (unsigned int v7 = -[NSMutableArray isEqual:](lteCellTowers, "isEqual:")) != 0)
          {
            scdmaCellTowers = self->_scdmaCellTowers;
            if (!((unint64_t)scdmaCellTowers | *((void *)a3 + 5))
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

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)-[NSMutableArray hash](self->_cellTowers, "hash");
  unint64_t v4 = (unint64_t)-[NSMutableArray hash](self->_wirelessAPs, "hash") ^ v3;
  unint64_t v5 = (unint64_t)-[NSMutableArray hash](self->_cdmaCellTowers, "hash");
  unint64_t v6 = v4 ^ v5 ^ (unint64_t)-[NSMutableArray hash](self->_lteCellTowers, "hash");
  unint64_t v7 = (unint64_t)-[NSMutableArray hash](self->_scdmaCellTowers, "hash");
  return v6 ^ v7 ^ (unint64_t)-[NSMutableArray hash](self->_nr5GCellTowers, "hash");
}

- (void)mergeFrom:(id)a3
{
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  unint64_t v5 = (void *)*((void *)a3 + 2);
  id v6 = [v5 countByEnumeratingWithState:&v55 objects:v64 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v56;
    do
    {
      for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v56 != v8) {
          objc_enumerationMutation(v5);
        }
        -[ALSLocationResponse addCellTower:]( self,  "addCellTower:",  *(void *)(*((void *)&v55 + 1) + 8LL * (void)i));
      }

      id v7 = [v5 countByEnumeratingWithState:&v55 objects:v64 count:16];
    }

    while (v7);
  }

  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id v10 = (void *)*((void *)a3 + 6);
  id v11 = [v10 countByEnumeratingWithState:&v51 objects:v63 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v52;
    do
    {
      for (uint64_t j = 0LL; j != v12; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v52 != v13) {
          objc_enumerationMutation(v10);
        }
        -[ALSLocationResponse addWirelessAP:]( self,  "addWirelessAP:",  *(void *)(*((void *)&v51 + 1) + 8LL * (void)j));
      }

      id v12 = [v10 countByEnumeratingWithState:&v51 objects:v63 count:16];
    }

    while (v12);
  }

  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id v15 = (void *)*((void *)a3 + 1);
  id v16 = [v15 countByEnumeratingWithState:&v47 objects:v62 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v48;
    do
    {
      for (uint64_t k = 0LL; k != v17; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v48 != v18) {
          objc_enumerationMutation(v15);
        }
        -[ALSLocationResponse addCdmaCellTower:]( self,  "addCdmaCellTower:",  *(void *)(*((void *)&v47 + 1) + 8LL * (void)k));
      }

      id v17 = [v15 countByEnumeratingWithState:&v47 objects:v62 count:16];
    }

    while (v17);
  }

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  unint64_t v20 = (void *)*((void *)a3 + 3);
  id v21 = [v20 countByEnumeratingWithState:&v43 objects:v61 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v44;
    do
    {
      for (uint64_t m = 0LL; m != v22; uint64_t m = (char *)m + 1)
      {
        if (*(void *)v44 != v23) {
          objc_enumerationMutation(v20);
        }
        -[ALSLocationResponse addLteCellTower:]( self,  "addLteCellTower:",  *(void *)(*((void *)&v43 + 1) + 8LL * (void)m));
      }

      id v22 = [v20 countByEnumeratingWithState:&v43 objects:v61 count:16];
    }

    while (v22);
  }

  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v25 = (void *)*((void *)a3 + 5);
  id v26 = [v25 countByEnumeratingWithState:&v39 objects:v60 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v40;
    do
    {
      for (uint64_t n = 0LL; n != v27; uint64_t n = (char *)n + 1)
      {
        if (*(void *)v40 != v28) {
          objc_enumerationMutation(v25);
        }
        -[ALSLocationResponse addScdmaCellTower:]( self,  "addScdmaCellTower:",  *(void *)(*((void *)&v39 + 1) + 8LL * (void)n));
      }

      id v27 = [v25 countByEnumeratingWithState:&v39 objects:v60 count:16];
    }

    while (v27);
  }

  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v30 = (void *)*((void *)a3 + 4);
  id v31 = [v30 countByEnumeratingWithState:&v35 objects:v59 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v36;
    do
    {
      for (iuint64_t i = 0LL; ii != v32; iuint64_t i = (char *)ii + 1)
      {
        if (*(void *)v36 != v33) {
          objc_enumerationMutation(v30);
        }
        -[ALSLocationResponse addNr5GCellTower:]( self,  "addNr5GCellTower:",  *(void *)(*((void *)&v35 + 1) + 8LL * (void)ii));
      }

      id v32 = [v30 countByEnumeratingWithState:&v35 objects:v59 count:16];
    }

    while (v32);
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
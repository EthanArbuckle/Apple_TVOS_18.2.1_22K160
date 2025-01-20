@interface MPWeighter
- (BOOL)itemAtIndex:(int64_t)a3 meetsContraints:(id)a4;
- (BOOL)itemAtIndex:(int64_t)a3 meetsContraints:(id)a4 oneMatch:(BOOL)a5;
- (MPWeighter)init;
- (id)allConstraints;
- (id)allItems;
- (id)allUsageCounts;
- (id)constraintsForItem:(id)a3;
- (id)getRandomItemMeetingNumberOfFaceLandscapes:(int64_t)a3 facePortraits:(int64_t)a4 imageLandscapes:(int64_t)a5 imagePortraits:(int64_t)a6 vPanoramas:(int64_t)a7 hPanoramas:(int64_t)a8 movies:(int64_t)a9 fitsInExtraWide:(int64_t)a10 aspectRatios:(id)a11 previousTags:(id)a12;
- (id)ignoredIndices;
- (id)imageCounts;
- (id)indicesEqualingConstraints:(id)a3;
- (id)indicesMeetingConstraints:(id)a3;
- (int64_t)count;
- (int64_t)getRandomIndex;
- (int64_t)getRandomIndexInSubset:(id)a3;
- (int64_t)getRandomIndexInSubset:(id)a3 withPreviousTags:(id)a4;
- (int64_t)getRandomIndexMeetingContraints:(id)a3;
- (int64_t)getRandomIndexMeetingContraints:(id)a3 oneMatch:(BOOL)a4;
- (int64_t)getRandomIndexWithNoPanoramasForImageCount:(int64_t)a3;
- (int64_t)numberOfItemsWithImageCount:(int64_t)a3;
- (void)addIndexToIgnore:(int64_t)a3;
- (void)addItem:(id)a3 withWeight:(int64_t)a4 andContraints:(id)a5;
- (void)clearAllItems;
- (void)clearIgnoreIndices;
- (void)dealloc;
- (void)ignoreIndex:(int64_t)a3;
- (void)ignoreIndices:(id)a3;
- (void)increaseUsageCountOfObjectAtIndex:(int64_t)a3;
- (void)setEvenlyPickByID:(BOOL)a3;
- (void)setIgnorePanoramas:(BOOL)a3;
@end

@implementation MPWeighter

- (MPWeighter)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MPWeighter;
  v2 = -[MPWeighter init](&v4, "init");
  if (v2)
  {
    v2->_weights = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v2->_items = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v2->_constraints = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v2->_usageCount = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v2->_ignoreIndices = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
    v2->_totalWeight = 0LL;
    v2->_ignorePanoramas = 0;
  }

  return v2;
}

- (void)dealloc
{
  self->_usageCount = 0LL;
  self->_constraints = 0LL;

  self->_ignoreIndices = 0LL;
  self->_weights = 0LL;

  self->_items = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPWeighter;
  -[MPWeighter dealloc](&v3, "dealloc");
}

- (void)addItem:(id)a3 withWeight:(int64_t)a4 andContraints:(id)a5
{
  self->_totalWeight += a4;
}

- (int64_t)getRandomIndexMeetingContraints:(id)a3
{
  return -[MPWeighter getRandomIndexMeetingContraints:oneMatch:]( self,  "getRandomIndexMeetingContraints:oneMatch:",  a3,  1LL);
}

- (int64_t)getRandomIndexMeetingContraints:(id)a3 oneMatch:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = -[MPWeighter count](self, "count");
  id v8 = +[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet");
  id v9 = +[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet");
  if (v7 >= 1)
  {
    for (uint64_t i = 0LL; i != v7; ++i)
    {
      if ((-[NSMutableIndexSet containsIndex:](self->_ignoreIndices, "containsIndex:", i) & 1) == 0
        && -[MPWeighter itemAtIndex:meetsContraints:oneMatch:](self, "itemAtIndex:meetsContraints:oneMatch:", i, a3, v4))
      {
        if (!self->_evenlyPickByID
          || (id v11 = +[MPUtilities idOfCombinedID:]( &OBJC_CLASS___MPUtilities,  "idOfCombinedID:",  -[NSMutableArray objectAtIndex:](self->_items, "objectAtIndex:", i)),  v12 = -[NSMutableIndexSet firstIndex](self->_ignoreIndices, "firstIndex"),  v12 == (id)0x7FFFFFFFFFFFFFFFLL)
          || (unsigned __int8 v13 = objc_msgSend( -[NSMutableArray objectAtIndex:](self->_items, "objectAtIndex:", v12),  "hasPrefix:",  v11),  v14 = v8,  (v13 & 1) == 0))
        {
          v14 = v9;
        }

        [v14 addIndex:i];
      }
    }
  }

  if (![v9 count] && objc_msgSend(v8, "count")) {
    id v9 = v8;
  }
  if ([v9 count]) {
    return -[MPWeighter getRandomIndexInSubset:](self, "getRandomIndexInSubset:", v9);
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (int64_t)getRandomIndexWithNoPanoramasForImageCount:(int64_t)a3
{
  uint64_t v5 = -[MPWeighter count](self, "count");
  id v6 = +[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet");
  id v7 = +[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet");
  if (v5 >= 1)
  {
    for (uint64_t i = 0LL; i != v5; ++i)
    {
      id v9 = -[NSMutableArray objectAtIndex:](self->_constraints, "objectAtIndex:", i);
      uint64_t v11 = v9[10];
      uint64_t v10 = v9[11];
      uint64_t v12 = v9[15];
      if ((-[NSMutableIndexSet containsIndex:](self->_ignoreIndices, "containsIndex:", i) & 1) == 0)
      {
        BOOL v13 = !*((_BYTE *)v9 + 128) || v10 + v11 == -v12;
        if (v13 && v9[1] <= a3)
        {
          if (!self->_evenlyPickByID
            || (id v14 = +[MPUtilities idOfCombinedID:]( &OBJC_CLASS___MPUtilities,  "idOfCombinedID:",  -[NSMutableArray objectAtIndex:](self->_items, "objectAtIndex:", i)),  v15 = -[NSMutableIndexSet firstIndex](self->_ignoreIndices, "firstIndex"),  v15 == (id)0x7FFFFFFFFFFFFFFFLL)
            || (unsigned __int8 v16 = objc_msgSend( -[NSMutableArray objectAtIndex:](self->_items, "objectAtIndex:", v15),  "hasPrefix:",  v14),  v17 = v6,  (v16 & 1) == 0))
          {
            v17 = v7;
          }

          [v17 addIndex:i];
        }
      }
    }
  }

  if (![v7 count] && objc_msgSend(v6, "count")) {
    id v7 = v6;
  }
  if ([v7 count]) {
    return -[MPWeighter getRandomIndexInSubset:](self, "getRandomIndexInSubset:", v7);
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (id)getRandomItemMeetingNumberOfFaceLandscapes:(int64_t)a3 facePortraits:(int64_t)a4 imageLandscapes:(int64_t)a5 imagePortraits:(int64_t)a6 vPanoramas:(int64_t)a7 hPanoramas:(int64_t)a8 movies:(int64_t)a9 fitsInExtraWide:(int64_t)a10 aspectRatios:(id)a11 previousTags:(id)a12
{
  v132 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
  __int128 v197 = 0u;
  __int128 v198 = 0u;
  __int128 v199 = 0u;
  __int128 v200 = 0u;
  v141 = self;
  obj = self->_constraints;
  id v142 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v197,  v209,  16LL);
  if (v142)
  {
    uint64_t v14 = 0LL;
    uint64_t v139 = *(void *)v198;
    int64_t v140 = a8;
    BOOL v16 = a7 > 0 || a8 > 0;
    BOOL v134 = v16;
    int64_t v133 = a8 + a7;
    int64_t v143 = a4 + a3;
    do
    {
      uint64_t v17 = 0LL;
      do
      {
        if (*(void *)v198 != v139) {
          objc_enumerationMutation(obj);
        }
        v18 = *(int64x2_t **)(*((void *)&v197 + 1) + 8 * v17);
        int64_t v146 = v18[2].i64[0];
        int v144 = v18[2].u8[8];
        int v145 = v18[2].u8[9];
        int64_t v20 = v18[3].i64[0];
        uint64_t v19 = v18[3].i64[1];
        uint64_t v21 = v18[4].i64[0];
        uint64_t v22 = v18[4].i64[1];
        int64x2_t v23 = v18[5];
        int64_t v25 = v18[6].i64[0];
        int64_t v24 = v18[6].i64[1];
        uint64_t v27 = v18[7].i64[0];
        uint64_t v26 = v18[7].i64[1];
        v28 = (void *)v18[9].i64[0];
        id v156 = (id)v18[8].i64[1];
        uint64_t v29 = v18[5].i64[1];
        uint64_t v30 = v18[5].i64[0];
        uint64_t v151 = v19;
        uint64_t v152 = v17;
        int64_t v149 = v20;
        uint64_t v150 = v22;
        uint64_t v148 = v21;
        uint64_t v153 = v26;
        if (a8 > 0
          || a7 > 0
          || (v23.i64[1] <= 0 ? (BOOL v31 = v23.i64[0] <= 0) : (BOOL v31 = 0), v31 ? (v32 = v26 < 1) : (v32 = 0), !v32))
        {
          v34.i64[0] = v26;
          v34.i64[1] = v24;
          char v35 = vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32( (int32x4_t)vceqzq_s64(v23),  (int32x4_t)vceqzq_s64(v34)))));
          BOOL v36 = v134;
          if (v27) {
            BOOL v36 = 0;
          }
          if ((v35 & 1) == 0 && !v25 && v36) {
            goto LABEL_28;
          }
          if (v26 < 1)
          {
            BOOL v33 = a7 == v29 && a8 == v30;
            BOOL v48 = v24 >= a7 && v25 >= a8;
            if (v24 > 0 || v25 >= 1) {
              BOOL v33 = v48;
            }
            if (v27 >= 1) {
              BOOL v33 = v133 <= v27;
            }
            goto LABEL_69;
          }

          if (v133 != v26 && (a7 != v29 || v26 != a8) && (a8 != v30 || v26 != a7) && (a8 <= v30 || v133 - v30 != v26))
          {
            BOOL v40 = __OFSUB__(a7, v29);
            uint64_t v41 = a7 - v29;
            if (!((v41 < 0) ^ v40 | (v41 == 0)))
            {
              uint64_t v42 = v41 + a8;
              BOOL v43 = v41 + a8 == v26;
              BOOL v44 = a8 - v30 + v41 == v26;
              if (a8 <= v30 || v42 == v26) {
                BOOL v33 = v43;
              }
              else {
                BOOL v33 = v44;
              }
              goto LABEL_69;
            }

- (int64_t)getRandomIndexInSubset:(id)a3
{
  int64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (!self->_totalWeight) {
    return v3;
  }
  id v6 = [a3 firstIndex];
  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = v6;
    uint64_t v8 = 0LL;
    do
    {
      if ((-[NSMutableIndexSet containsIndex:](self->_ignoreIndices, "containsIndex:", v7) & 1) == 0) {
        v8 += (uint64_t)objc_msgSend( -[NSMutableArray objectAtIndex:](self->_weights, "objectAtIndex:", v7),  "integerValue");
      }
      id v7 = [a3 indexGreaterThanIndex:v7];
    }

    while (v7 != (id)0x7FFFFFFFFFFFFFFFLL);
    if (v8)
    {
      uint64_t v9 = random();
      id v10 = [a3 firstIndex];
      int64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
      if (v10 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v11 = v9 % v8;
        int64_t v3 = (int64_t)v10;
        while (1)
        {
          uint64_t v12 = (uint64_t)objc_msgSend( -[NSMutableArray objectAtIndex:](self->_weights, "objectAtIndex:", v3),  "integerValue");
          BOOL v13 = v11 < v12;
          v11 -= v12;
          int64_t v3 = (int64_t)[a3 indexGreaterThanIndex:v3];
          if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
            return 0x7FFFFFFFFFFFFFFFLL;
          }
        }
      }

      return v3;
    }
  }

  return (int64_t)objc_msgSend(a3, "indexAtIndex:", random() % (unint64_t)objc_msgSend(a3, "count"));
}

- (int64_t)getRandomIndexInSubset:(id)a3 withPreviousTags:(id)a4
{
  int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (self->_totalWeight)
  {
    id v6 = a3;
    id v7 = self;
    id v8 = [a3 firstIndex];
    id v9 = [v6 mutableCopy];
    id v10 = v9;
    if (v8 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v25 = v6;
      uint64_t v26 = v7;
      id v24 = v9;
      do
      {
        if (!-[MPWeighter itemAtIndex:meetsContraints:oneMatch:]( v7,  "itemAtIndex:meetsContraints:oneMatch:",  v8,  +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  a4,  @"tags",  0LL),  0LL))
        {
          id v11 = [a4 mutableCopy];
          __int128 v31 = 0u;
          __int128 v32 = 0u;
          __int128 v33 = 0u;
          __int128 v34 = 0u;
          id v12 = [a4 countByEnumeratingWithState:&v31 objects:v36 count:16];
          if (v12)
          {
            id v13 = v12;
            uint64_t v14 = *(void *)v32;
            do
            {
              for (uint64_t i = 0LL; i != v13; uint64_t i = (char *)i + 1)
              {
                if (*(void *)v32 != v14) {
                  objc_enumerationMutation(a4);
                }
                BOOL v16 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
              }

              id v13 = [a4 countByEnumeratingWithState:&v31 objects:v36 count:16];
            }

            while (v13);
          }

          id v17 = [a4 mutableCopy];
          __int128 v27 = 0u;
          __int128 v28 = 0u;
          __int128 v29 = 0u;
          __int128 v30 = 0u;
          id v18 = [a4 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v18)
          {
            id v19 = v18;
            uint64_t v20 = *(void *)v28;
            do
            {
              for (j = 0LL; j != v19; j = (char *)j + 1)
              {
                if (*(void *)v28 != v20) {
                  objc_enumerationMutation(a4);
                }
                uint64_t v22 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)j);
              }

              id v19 = [a4 countByEnumeratingWithState:&v27 objects:v35 count:16];
            }

            while (v19);
          }

          id v6 = v25;
          id v7 = v26;
          id v10 = v24;
          if ((![v11 count]
             || !-[MPWeighter itemAtIndex:meetsContraints:oneMatch:]( v26,  "itemAtIndex:meetsContraints:oneMatch:",  v8,  +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v11,  @"tags",  0LL),  0LL))
            && (![v17 count]
             || !-[MPWeighter itemAtIndex:meetsContraints:oneMatch:]( v26,  "itemAtIndex:meetsContraints:oneMatch:",  v8,  +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v17,  @"tags",  0LL),  0LL))
            && (![v11 count]
             || !-[MPWeighter itemAtIndex:meetsContraints:oneMatch:]( v26,  "itemAtIndex:meetsContraints:oneMatch:",  v8,  +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v11,  @"tags",  0LL),  1LL))
            && (![v17 count]
             || !-[MPWeighter itemAtIndex:meetsContraints:oneMatch:]( v26,  "itemAtIndex:meetsContraints:oneMatch:",  v8,  +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v17,  @"tags",  0LL),  1LL)))
          {
LABEL_5:
            [v10 removeIndex:v8];
          }
        }

        id v8 = [v6 indexGreaterThanIndex:v8];
      }

      while (v8 != (id)0x7FFFFFFFFFFFFFFFLL);
    }

    if ([v10 count]) {
      return -[MPWeighter getRandomIndexInSubset:](v7, "getRandomIndexInSubset:", v10);
    }
    else {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  return v4;
}

- (int64_t)getRandomIndex
{
  int64_t totalWeight = self->_totalWeight;
  int64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (totalWeight)
  {
    id v5 = -[NSMutableIndexSet firstIndex](self->_ignoreIndices, "firstIndex");
    if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      for (id i = v5;
            i != (id)0x7FFFFFFFFFFFFFFFLL;
            id i = -[NSMutableIndexSet indexGreaterThanIndex:](self->_ignoreIndices, "indexGreaterThanIndex:", i))
      {
        totalWeight -= (uint64_t)objc_msgSend( -[NSMutableArray objectAtIndex:](self->_weights, "objectAtIndex:", i),  "integerValue");
      }
    }

    id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
    uint64_t v8 = random();
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    weights = self->_weights;
    id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( weights,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = 0LL;
      uint64_t v13 = v8 % totalWeight;
      uint64_t v14 = *(void *)v22;
      while (2)
      {
        for (j = 0LL; j != v11; j = (char *)j + 1)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(weights);
          }
          uint64_t v16 = (uint64_t)[*(id *)(*((void *)&v21 + 1) + 8 * (void)j) integerValue];
          BOOL v17 = v13 < v16;
          v13 -= v16;
          if (v17
            && (-[NSMutableIndexSet containsIndex:]( self->_ignoreIndices,  "containsIndex:",  (char *)j + v12) & 1) == 0)
          {
            if (!self->_evenlyPickByID
              || (v18 = +[MPUtilities idOfCombinedID:]( &OBJC_CLASS___MPUtilities,  "idOfCombinedID:",  -[NSMutableArray objectAtIndex:](self->_items, "objectAtIndex:", (char *)j + v12)),  id v19 = -[NSMutableIndexSet firstIndex](self->_ignoreIndices, "firstIndex"),  v19 == (id)0x7FFFFFFFFFFFFFFFLL)
              || !objc_msgSend( -[NSMutableArray objectAtIndex:](self->_items, "objectAtIndex:", v19),  "hasPrefix:",  v18))
            {
              int64_t v3 = (int64_t)j + v12;
              goto LABEL_23;
            }

            -[NSMutableIndexSet addIndex:](v7, "addIndex:", (char *)j + v12);
          }
        }

        id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( weights,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
        v12 += (uint64_t)j;
        if (v11) {
          continue;
        }
        break;
      }
    }

    if (-[NSMutableIndexSet count](v7, "count")) {
      int64_t v3 = (int64_t)-[NSMutableIndexSet indexAtIndex:]( v7,  "indexAtIndex:",  random() % (unint64_t)-[NSMutableIndexSet count](v7, "count"));
    }
    else {
      int64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
    }
LABEL_23:
  }

  return v3;
}

- (BOOL)itemAtIndex:(int64_t)a3 meetsContraints:(id)a4
{
  return -[MPWeighter itemAtIndex:meetsContraints:oneMatch:](self, "itemAtIndex:meetsContraints:oneMatch:", a3, a4, 1LL);
}

- (BOOL)itemAtIndex:(int64_t)a3 meetsContraints:(id)a4 oneMatch:(BOOL)a5
{
  BOOL v5 = a5;
  id v29 = -[NSMutableArray objectAtIndex:](self->_constraints, "objectAtIndex:", a3);
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v7 = [a4 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v28 = *(void *)v35;
    while (2)
    {
      for (id i = 0LL; i != v8; id i = (char *)i + 1)
      {
        if (*(void *)v35 != v28) {
          objc_enumerationMutation(a4);
        }
        uint64_t v10 = *(void *)(*((void *)&v34 + 1) + 8LL * (void)i);
        id v11 = objc_msgSend(v29, "valueForKey:", v10, v28);
        id v12 = [a4 objectForKey:v10];
        uint64_t v14 = (objc_class *)objc_opt_class(v12, v13);
        id v15 = NSStringFromClass(v14);
        if (NSStringHasSuffix(v15, "Number"))
        {
        }

        else if (NSStringHasSuffix(v15, "Boolean"))
        {
          unsigned int v17 = [v12 BOOLValue];
        }

        else
        {
          uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSArray, v16);
          if ((objc_opt_isKindOfClass(v12, v18) & 1) != 0)
          {
            if (v5)
            {
              id v20 = [v12 count];
              if (v20 != [v11 count]) {
                goto LABEL_35;
              }
            }

            __int128 v32 = 0u;
            __int128 v33 = 0u;
            __int128 v30 = 0u;
            __int128 v31 = 0u;
            id v21 = [v12 countByEnumeratingWithState:&v30 objects:v38 count:16];
            if (!v21) {
              return (char)v21;
            }
            id v22 = v21;
            char v23 = 0;
            uint64_t v24 = *(void *)v31;
            do
            {
              for (j = 0LL; j != v22; j = (char *)j + 1)
              {
                if (*(void *)v31 != v24) {
                  objc_enumerationMutation(v12);
                }
                LODWORD(v21) = [v11 containsObject:*(void *)(*((void *)&v30 + 1) + 8 * (void)j)];
                if (v5)
                {
                }

                else
                {
                  if (!(_DWORD)v21) {
                    return (char)v21;
                  }
                  char v23 = 1;
                }
              }

              id v22 = [v12 countByEnumeratingWithState:&v30 objects:v38 count:16];
            }

            while (v22);
            if ((v23 & 1) == 0)
            {
LABEL_35:
              LOBYTE(v21) = 0;
              return (char)v21;
            }
          }

          else
          {
            uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSString, v19);
            if ((objc_opt_isKindOfClass(v12, v26) & 1) != 0
              && ([v12 isEqualToString:v11] & 1) == 0)
            {
              goto LABEL_35;
            }
          }
        }

- (void)increaseUsageCountOfObjectAtIndex:(int64_t)a3
{
}

- (id)indicesMeetingConstraints:(id)a3
{
  uint64_t v5 = -[MPWeighter count](self, "count");
  id v6 = +[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet");
  if (v5 >= 1)
  {
    for (uint64_t i = 0LL; i != v5; ++i)
    {
    }
  }

  return v6;
}

- (id)indicesEqualingConstraints:(id)a3
{
  id v4 = +[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet");
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v16 = [a3 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v16)
  {
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t i = 0LL; i != v16; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(a3);
        }
        uint64_t v6 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
        __int128 v17 = 0u;
        __int128 v18 = 0u;
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        constraints = self->_constraints;
        id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( constraints,  "countByEnumeratingWithState:objects:count:",  &v17,  v25,  16LL);
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = 0LL;
          uint64_t v11 = *(void *)v18;
          do
          {
            for (j = 0LL; j != v9; j = (char *)j + 1)
            {
              if (*(void *)v18 != v11) {
                objc_enumerationMutation(constraints);
              }
              if (!objc_msgSend( objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * (void)j), "valueForKey:", v6),  "compare:",  objc_msgSend(a3, "objectForKey:", v6))) {
                [v4 addIndex:(char *)j + v10];
              }
            }

            id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( constraints,  "countByEnumeratingWithState:objects:count:",  &v17,  v25,  16LL);
            v10 += (uint64_t)j;
          }

          while (v9);
        }
      }

      id v16 = [a3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }

    while (v16);
  }

  return v4;
}

- (void)setEvenlyPickByID:(BOOL)a3
{
  self->_evenlyPickByID = a3;
}

- (int64_t)numberOfItemsWithImageCount:(int64_t)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  constraints = self->_constraints;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( constraints,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (!v5) {
    return 0LL;
  }
  id v6 = v5;
  int64_t v7 = 0LL;
  uint64_t v8 = *(void *)v12;
  do
  {
    for (uint64_t i = 0LL; i != v6; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v12 != v8) {
        objc_enumerationMutation(constraints);
      }
      if (*(void *)(*(void *)(*((void *)&v11 + 1) + 8LL * (void)i) + 8LL) == a3) {
        ++v7;
      }
    }

    id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( constraints,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  }

  while (v6);
  return v7;
}

- (id)imageCounts
{
  id v3 = +[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet");
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  constraints = self->_constraints;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( constraints,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(constraints);
        }
        [v3 addIndex:*(void *)(*(void *)(*((void *)&v10 + 1) + 8 * (void)v8) + 8)];
        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( constraints,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v6);
  }

  return v3;
}

- (void)setIgnorePanoramas:(BOOL)a3
{
  self->_ignorePanoramas = a3;
}

- (id)ignoredIndices
{
  return self->_ignoreIndices;
}

- (void)ignoreIndex:(int64_t)a3
{
}

- (void)ignoreIndices:(id)a3
{
}

- (void)clearIgnoreIndices
{
}

- (void)addIndexToIgnore:(int64_t)a3
{
}

- (id)allItems
{
  return self->_items;
}

- (id)allConstraints
{
  return self->_constraints;
}

- (id)allUsageCounts
{
  return self->_usageCount;
}

- (id)constraintsForItem:(id)a3
{
  if (-[NSMutableArray indexOfObject:](self->_items, "indexOfObject:") == (id)0x7FFFFFFFFFFFFFFFLL) {
    return 0LL;
  }
  else {
    return -[NSMutableArray objectAtIndex:]( self->_constraints,  "objectAtIndex:",  -[NSMutableArray indexOfObject:](self->_items, "indexOfObject:", a3));
  }
}

- (int64_t)count
{
  return (int64_t)-[NSMutableArray count](self->_items, "count");
}

- (void)clearAllItems
{
  self->_int64_t totalWeight = 0LL;
  self->_evenlyPickByID = 0;
}

@end
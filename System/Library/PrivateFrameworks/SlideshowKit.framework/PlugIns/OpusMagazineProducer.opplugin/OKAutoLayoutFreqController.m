@interface OKAutoLayoutFreqController
- (BOOL)_isLayout:(id)a3 usedInLast:(int64_t)a4;
- (OKAutoLayoutFreqController)init;
- (float)_freqOfUp:(id)a3;
- (id)_freqOrderFromHightToLow;
- (id)bestLayoutByFreqOfAnyUpsFromLayouts:(id)a3;
- (id)bestLayoutByFreqOfSameUpFromLayouts:(id)a3 forResolution:(id)a4;
- (void)addOnePageLayout:(id)a3;
- (void)dealloc;
@end

@implementation OKAutoLayoutFreqController

- (OKAutoLayoutFreqController)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___OKAutoLayoutFreqController;
  v2 = -[OKAutoLayoutFreqController init](&v4, "init");
  if (v2)
  {
    v2->_pageFrequency = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    v2->_pages = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    v2->_layoutsByResolution = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  }

  return v2;
}

- (void)dealloc
{
  pageFrequency = self->_pageFrequency;
  if (pageFrequency)
  {

    self->_pageFrequency = 0LL;
  }

  pages = self->_pages;
  if (pages)
  {

    self->_pages = 0LL;
  }

  layoutsByResolution = self->_layoutsByResolution;
  if (layoutsByResolution)
  {

    self->_layoutsByResolution = 0LL;
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___OKAutoLayoutFreqController;
  -[OKAutoLayoutFreqController dealloc](&v6, "dealloc");
}

- (float)_freqOfUp:(id)a3
{
  objc_super v4 = (char *)[a3 integerValue];
  LODWORD(v5) = 1.0;
  if ((unint64_t)(v4 - 1) <= 5)
  {
    uint64_t v6 = self->_counts[(void)(v4 - 1)];
    if (v6) {
      *(float *)&double v5 = (float)v6 / (float)(unint64_t)-[NSMutableArray count](self->_pageFrequency, "count", v5);
    }
    else {
      LODWORD(v5) = 0;
    }
  }

  return *(float *)&v5;
}

- (id)_freqOrderFromHightToLow
{
  if ((unint64_t)-[NSMutableArray count](self->_pageFrequency, "count") < 0x10)
  {
    BOOL v4 = 0;
  }

  else
  {
    -[OKAutoLayoutFreqController _freqOfUp:](self, "_freqOfUp:", @"6");
    BOOL v4 = v3 < 0.05;
  }

  if ((unint64_t)-[NSMutableArray count](self->_pageFrequency, "count") < 0xB)
  {
    BOOL v6 = 0;
  }

  else
  {
    -[OKAutoLayoutFreqController _freqOfUp:](self, "_freqOfUp:", @"5");
    BOOL v6 = v5 < 0.1;
  }

  id v7 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v22 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  uint64_t v8 = 0LL;
  counts = self->_counts;
  do
  {
    id v10 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    uint64_t v11 = 0LL;
    uint64_t v12 = -1LL;
    do
    {
      uint64_t v13 = v11 + 1;
      unsigned int v14 = objc_msgSend( v7,  "containsObject:",  -[NSNumber stringValue]( +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v11 + 1),  "stringValue"));
      int v15 = v11 != 4 || v6;
      int v16 = v11 != 5 || v4;
      if (v14) {
        BOOL v17 = 1;
      }
      else {
        BOOL v17 = v15 == 0;
      }
      if (!v17 && v16 != 0)
      {
        if (v12 == -1) {
          goto LABEL_25;
        }
        int64_t v19 = counts[v11];
        int64_t v20 = counts[v12];
        if (v19 > v20)
        {
          [v10 removeAllObjects];
LABEL_25:
          uint64_t v12 = v11;
LABEL_26:
          objc_msgSend( v10,  "addObject:",  -[NSNumber stringValue]( +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v11 + 1),  "stringValue"));
          goto LABEL_27;
        }

        if (v19 == v20) {
          goto LABEL_26;
        }
      }

- (BOOL)_isLayout:(id)a3 usedInLast:(int64_t)a4
{
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  layoutsByResolution = self->_layoutsByResolution;
  id v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( layoutsByResolution,  "countByEnumeratingWithState:objects:count:",  &v25,  v30,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
    while (2)
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(layoutsByResolution);
        }
        uint64_t v12 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)v11);
        if ([a3 containsString:v12])
        {
          id v8 = -[NSMutableDictionary objectForKeyedSubscript:]( self->_layoutsByResolution,  "objectForKeyedSubscript:",  v12);
          if (v8)
          {
            __int128 v23 = 0u;
            __int128 v24 = 0u;
            __int128 v21 = 0u;
            __int128 v22 = 0u;
            id v13 = objc_msgSend(v8, "reverseObjectEnumerator", 0);
            id v8 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v8)
            {
              id v14 = v8;
              int64_t v15 = 0LL;
              uint64_t v16 = *(void *)v22;
LABEL_13:
              uint64_t v17 = 0LL;
              if (v15 <= a4) {
                int64_t v18 = a4;
              }
              else {
                int64_t v18 = v15;
              }
              int64_t v19 = v18 - v15;
              v15 += (int64_t)v14;
              while (1)
              {
                if (*(void *)v22 != v16) {
                  objc_enumerationMutation(v13);
                }
                LOBYTE(v8) = [*(id *)(*((void *)&v21 + 1) + 8 * v17) isEqualToString:a3];
                if (v14 == (id)++v17)
                {
                  id v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
                  LOBYTE(v8) = 0;
                  if (v14) {
                    goto LABEL_13;
                  }
                  return (char)v8;
                }
              }
            }
          }

          return (char)v8;
        }

        uint64_t v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( layoutsByResolution,  "countByEnumeratingWithState:objects:count:",  &v25,  v30,  16LL);
      id v9 = v8;
      if (v8) {
        continue;
      }
      break;
    }
  }

  return (char)v8;
}

- (void)addOnePageLayout:(id)a3
{
  id v5 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "allValues"), "lastObject"), "substringWithRange:", 0, 1);
  BOOL v6 = (char *)[v5 integerValue];
  if ((unint64_t)(v6 - 1) <= 5)
  {
    ++self->_counts[(void)(v6 - 1)];
    -[NSMutableArray addObject:](self->_pages, "addObject:", a3);
    -[NSMutableArray addObject:](self->_pageFrequency, "addObject:", v5);
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v7 = objc_msgSend(a3, "allKeys", 0);
    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
          id v13 = -[NSMutableDictionary objectForKeyedSubscript:]( self->_layoutsByResolution,  "objectForKeyedSubscript:",  v12);
          if (!v13)
          {
            id v13 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
            -[NSMutableDictionary setObject:forKey:](self->_layoutsByResolution, "setObject:forKey:", v13, v12);
          }

          objc_msgSend(v13, "addObject:", objc_msgSend(a3, "objectForKeyedSubscript:", v12));
        }

        id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v9);
    }
  }

- (id)bestLayoutByFreqOfAnyUpsFromLayouts:(id)a3
{
  if (!a3 || ![a3 count]) {
    return 0LL;
  }
  id v5 = -[OKAutoLayoutFreqController _freqOrderFromHightToLow](self, "_freqOrderFromHightToLow");
  id v6 = [a3 sortedArrayUsingComparator:&stru_10310];
  id v7 = [v6 objectAtIndexedSubscript:0];
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id obj = [v5 reverseObjectEnumerator];
  id v21 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v21)
  {
    int64_t v19 = v7;
    uint64_t v22 = *(void *)v28;
    do
    {
      for (i = 0LL; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        id v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16, v19);
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = 0LL;
          uint64_t v13 = *(void *)v24;
LABEL_10:
          uint64_t v14 = 0LL;
          uint64_t v15 = 10LL;
          if (v12 > 10) {
            uint64_t v15 = v12;
          }
          uint64_t v16 = v15 - v12;
          v12 += (uint64_t)v11;
          while (1)
          {
            if (*(void *)v24 != v13) {
              objc_enumerationMutation(v6);
            }
            id v7 = *(id *)(*((void *)&v23 + 1) + 8 * v14);
            id v17 = objc_msgSend(objc_msgSend(v7, "objectAtIndexedSubscript:", 0), "substringWithRange:", 0, 1);
            if (v16 == v14) {
              break;
            }
            if ([v9 containsObject:v17]
              && !-[OKAutoLayoutFreqController _isLayout:usedInLast:]( self,  "_isLayout:usedInLast:",  [v7 objectAtIndexedSubscript:0],  12))
            {
              return v7;
            }

            if (v11 == (id)++v14)
            {
              id v11 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
              if (v11) {
                goto LABEL_10;
              }
              break;
            }
          }
        }
      }

      id v21 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }

    while (v21);
    return v19;
  }

  return v7;
}

- (id)bestLayoutByFreqOfSameUpFromLayouts:(id)a3 forResolution:(id)a4
{
  return 0LL;
}

@end
@interface VOTElementFetcher
- (BOOL)_wasCanceledWithCountGeneration:(unint64_t)a3;
- (BOOL)_wasCanceledWithSearchGeneration:(unint64_t)a3;
- (BOOL)shouldPerformSearchSynchronously;
- (BOOL)triggerSignpostCollection;
- (VOTElementFetchDelegateProtocol)delegate;
- (VOTElementFetcher)init;
- (id)_debugElementCache;
- (id)_handleOpaqueSearchForElementInDirection:(int64_t)a3 opaqueParent:(id)a4 searchType:(int64_t)a5 range:(_NSRange *)a6 matchBlock:(id)a7 resetContentOffsetInOpaqueParent:(BOOL *)a8 peeking:(BOOL)a9;
- (id)_hitTestedElementForOriginalElement:(id)a3 hitTestPoint:(CGPoint)a4 opaqueParent:(id)a5;
- (void)_countElementsMatchingBlock:(id)a3 generation:(id)a4;
- (void)_forceUpdate;
- (void)_informDelegateOfRetrieveElements;
- (void)_initializeThread;
- (void)_retrieveElementsWithElement:(id)a3 groupNavigationStyle:(id)a4;
- (void)_searchForElementWithParameters:(id)a3;
- (void)_searchForElementWithParameters:(id)a3 searchFromOpaqueElementsInRemoteParent:(BOOL)a4;
- (void)_updateCacheWithElement:(id)a3;
- (void)cancelPreviousCount;
- (void)cancelPreviousSearch;
- (void)countElementsMatchingBlock:(id)a3;
- (void)dealloc;
- (void)didFinishBatchPeeking;
- (void)fillCacheWithElements:(id)a3;
- (void)forceUpdate;
- (void)invalidate;
- (void)retrieveElementsWithElement:(id)a3 groupNavigationStyle:(BOOL)a4;
- (void)searchForElementInDirection:(int64_t)a3 fromElement:(id)a4 matchBlock:(id)a5 rangeMatch:(id)a6 searchType:(int64_t)a7 generation:(unint64_t)a8 startingRange:(_NSRange)a9 groupNavigationStyle:(BOOL)a10;
- (void)searchForElementInDirection:(int64_t)a3 fromElement:(id)a4 matchBlock:(id)a5 rangeMatch:(id)a6 searchType:(int64_t)a7 generation:(unint64_t)a8 startingRange:(_NSRange)a9 groupNavigationStyle:(BOOL)a10 peeking:(BOOL)a11;
- (void)searchForElementInDirection:(int64_t)a3 fromElement:(id)a4 needsForceCacheUpdate:(BOOL)a5 matchBlock:(id)a6 rangeMatch:(id)a7 searchType:(int64_t)a8 generation:(unint64_t)a9 startingRange:(_NSRange)a10 groupNavigationStyle:(BOOL)a11 peeking:(BOOL)a12;
- (void)setDelegate:(id)a3;
- (void)setShouldPerformSearchSynchronously:(BOOL)a3;
- (void)setTriggerSignpostCollection:(BOOL)a3;
- (void)updateCacheWithElement:(id)a3;
@end

@implementation VOTElementFetcher

- (VOTElementFetcher)init
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___VOTElementFetcher;
  v2 = -[VOTElementFetcher init](&v18, "init");
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_cacheSize = xmmword_100132E50;
    v4 = (SCRCThread *)[objc_allocWithZone(SCRCThread) init];
    fillerThread = v3->_fillerThread;
    v3->_fillerThread = v4;

    v6 = (SCRCThreadKey *)[objc_allocWithZone(SCRCThreadKey) initWithObject:v3];
    fillerThreadKey = v3->_fillerThreadKey;
    v3->_fillerThreadKey = v6;

    -[SCRCThread performSelector:onTarget:count:objects:]( v3->_fillerThread,  "performSelector:onTarget:count:objects:",  "_initializeThread",  v3,  0LL,  0LL);
    v8 = (NSMutableArray *)[objc_allocWithZone(NSMutableArray) initWithCapacity:v3->_cacheSize + 1];
    elementCache = v3->_elementCache;
    v3->_elementCache = v8;

    v3->_canceledSearchGeneration = 0LL;
    v3->_currentSearchGeneration = 0LL;
    dispatch_queue_t v10 = dispatch_queue_create("SearchGenerationQueue", 0LL);
    searchGenerationQueue = v3->_searchGenerationQueue;
    v3->_searchGenerationQueue = (OS_dispatch_queue *)v10;

    v3->_canceledCountGeneration = 0LL;
    v3->_currentCountGeneration = 0LL;
    dispatch_queue_t v12 = dispatch_queue_create("CountGenerationQueue", 0LL);
    countGenerationQueue = v3->_countGenerationQueue;
    v3->_countGenerationQueue = (OS_dispatch_queue *)v12;

    v14 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    opaqueElementCache = v3->_opaqueElementCache;
    v3->_opaqueElementCache = v14;

    v16 = v3;
  }

  return v3;
}

- (void)invalidate
{
  cacheLock = self->_cacheLock;
  self->_cacheLock = 0LL;
  v6 = cacheLock;

  -[NSLock unlock](v6, "unlock");
  searchGenerationQueue = self->_searchGenerationQueue;
  self->_searchGenerationQueue = 0LL;

  countGenerationQueue = self->_countGenerationQueue;
  self->_countGenerationQueue = 0LL;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VOTElementFetcher;
  -[VOTElementFetcher dealloc](&v3, "dealloc");
}

- (void)_initializeThread
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread"));
  objc_opt_class(self, v3);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v7 setName:v6];
}

- (void)_updateCacheWithElement:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    -[NSLock lock](self->_cacheLock, "lock");
    -[NSMutableArray removeAllObjects](self->_elementCache, "removeAllObjects");
    -[NSLock unlock](self->_cacheLock, "unlock");
    goto LABEL_70;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 localOpaqueParent]);

  if (!v6)
  {
    BOOL v7 = -[VOTElementFetcher triggerSignpostCollection](self, "triggerSignpostCollection");
    if (v7)
    {
      uint64_t v8 = VOTLogElement(v7);
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "FetchElements",  "",  buf,  2u);
      }
    }

    context = objc_autoreleasePoolPush();
    uint64_t v10 = VOTLogElement(context);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_1000F4CA4();
    }

    -[NSLock lock](self->_cacheLock, "lock");
    p_elementCache = &self->_elementCache;
    uint64_t v13 = (uint64_t)-[NSMutableArray count](self->_elementCache, "count");
    id v14 = -[NSMutableArray indexOfObject:](self->_elementCache, "indexOfObject:", v5);
    if (v13 < 1)
    {
      v16 = 0LL;
      v15 = 0LL;
    }

    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](*p_elementCache, "objectAtIndex:", 0LL));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](*p_elementCache, "lastObject"));
    }

    id v17 = -[NSLock unlock](self->_cacheLock, "unlock");
    if (v14 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v18 = self->_cacheSize >> 1;
      id v19 = v5;
      -[NSLock lock](self->_cacheLock, "lock");
      -[NSMutableArray removeAllObjects](self->_elementCache, "removeAllObjects");
      -[NSMutableArray addObject:](self->_elementCache, "addObject:", v19);
      id v17 = -[NSLock unlock](self->_cacheLock, "unlock");
      v20 = v19;
      goto LABEL_27;
    }

    int64_t cacheBufferEdge = self->_cacheBufferEdge;
    if ((uint64_t)v14 < cacheBufferEdge)
    {
      v22 = *p_elementCache;
      if (!-[NSMutableArray count](v22, "count")
        || (v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v22, "objectAtIndex:", 0LL)),
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null")),
            v24,
            v23,
            v23 != v24))
      {

        id v17 = v15;
        id v19 = v17;
        unint64_t v18 = (self->_cacheSize >> 1) - (void)v14;
        goto LABEL_26;
      }

      int64_t cacheBufferEdge = self->_cacheBufferEdge;
    }

    if ((uint64_t)v14 > v13 - cacheBufferEdge)
    {
      v25 = *p_elementCache;
      if (!-[NSMutableArray count](v25, "count")
        || (v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](v25, "lastObject")),
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null")),
            v27,
            v26,
            v26 != v27))
      {

        unint64_t v18 = (unint64_t)v14 + (self->_cacheSize >> 1) - v13;
        id v17 = v16;
        v20 = v17;
        id v19 = 0LL;
        goto LABEL_27;
      }
    }

    unint64_t v18 = 0LL;
    id v19 = 0LL;
LABEL_26:
    v20 = 0LL;
LABEL_27:
    uint64_t v28 = VOTLogElement(v17);
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      unint64_t v76 = v18;
      __int16 v77 = 2114;
      id v78 = v19;
      __int16 v79 = 2114;
      v80 = v20;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEBUG,  "fetch count: %lu -- startFromBehind: %{public}@, startFromAhead:%{public}@",  buf,  0x20u);
    }

    if (v20)
    {
      uint64_t v30 = objc_claimAutoreleasedReturnValue([v20 elementsInDirection:1 withCount:v18]);
      v69 = (void *)v30;
      if (v19)
      {
LABEL_31:
        uint64_t v30 = objc_claimAutoreleasedReturnValue([v19 elementsInDirection:2 withCount:v18]);
        v68 = (void *)v30;
LABEL_34:
        uint64_t v31 = VOTLogElement(v30);
        v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
          sub_1000F4C3C();
        }

        -[NSLock lock](self->_cacheLock, "lock");
        if ([v69 count])
        {
          -[NSMutableArray addObjectsFromArray:](self->_elementCache, "addObjectsFromArray:", v69);
          if ((unint64_t)-[NSMutableArray count](self->_elementCache, "count") > self->_cacheSize)
          {
            id v33 = -[NSMutableArray count](self->_elementCache, "count");
            uint64_t v34 = (uint64_t)v33 - self->_cacheSize;
            uint64_t v35 = VOTLogElement(v33);
            v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
              sub_1000F4BC0(v34, v36);
            }

            -[NSMutableArray removeObjectsInRange:](*p_elementCache, "removeObjectsInRange:", 0LL, v34);
          }
        }

        v61 = v20;
        if (v20 && v18 > (unint64_t)objc_msgSend(v69, "count", v20))
        {
          v37 = *p_elementCache;
          v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
          -[NSMutableArray addObject:](v37, "addObject:", v38);
        }

        if (objc_msgSend(v68, "count", v61))
        {
          elementCache = self->_elementCache;
          v39 = (void *)objc_claimAutoreleasedReturnValue([v68 reverseObjectEnumerator]);
          unint64_t v66 = v18;
          v40 = (void *)objc_claimAutoreleasedReturnValue([v39 allObjects]);
          p_elementCache = &self->_elementCache;
          v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexSet indexSetWithIndexesInRange:]( NSIndexSet,  "indexSetWithIndexesInRange:",  0,  [v68 count]));
          -[NSMutableArray insertObjects:atIndexes:](elementCache, "insertObjects:atIndexes:", v40, v41);

          unint64_t v18 = v66;
          if ((unint64_t)-[NSMutableArray count](self->_elementCache, "count") > self->_cacheSize)
          {
            v42 = (char *)-[NSMutableArray count](self->_elementCache, "count") - self->_cacheSize;
            uint64_t v43 = VOTLogElement( -[NSMutableArray removeObjectsInRange:]( self->_elementCache,  "removeObjectsInRange:",  (_BYTE *)-[NSMutableArray count](self->_elementCache, "count") - v42,  v42));
            v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
              sub_1000F4B30((id *)p_elementCache, (uint64_t)v42, v44);
            }
          }
        }

        v67 = v5;
        if (v19 && v18 > (unint64_t)[v68 count])
        {
          v45 = *p_elementCache;
          v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
          -[NSMutableArray insertObject:atIndex:](v45, "insertObject:atIndex:", v46, 0LL);
        }

        v64 = v15;
        __int128 v72 = 0u;
        __int128 v73 = 0u;
        __int128 v70 = 0u;
        __int128 v71 = 0u;
        v47 = *p_elementCache;
        id v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v47,  "countByEnumeratingWithState:objects:count:",  &v70,  v74,  16LL);
        if (v48)
        {
          id v50 = v48;
          v51 = 0LL;
          uint64_t v52 = *(void *)v71;
          uint64_t v53 = kAXAllowsDirectInteractionTrait;
          do
          {
            for (i = 0LL; i != v50; i = (char *)i + 1)
            {
              if (*(void *)v71 != v52) {
                objc_enumerationMutation(v47);
              }
              v55 = *(void **)(*((void *)&v70 + 1) + 8LL * (void)i);
              objc_opt_class(&OBJC_CLASS___VOTElement, v49);
              if ((objc_opt_isKindOfClass(v55, v56) & 1) != 0
                && [v55 doesHaveTraits:v53])
              {
                if (!v51) {
                  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
                }
                [v51 addObject:v55];
              }
            }

            id v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v47,  "countByEnumeratingWithState:objects:count:",  &v70,  v74,  16LL);
          }

          while (v50);
        }

        else
        {
          v51 = 0LL;
        }

        -[NSLock unlock](self->_cacheLock, "unlock");
        v57 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElementFetcher delegate](self, "delegate"));
        [v57 elementFetchFoundDirectTouchElements:v51];

        objc_autoreleasePoolPop(context);
        BOOL v58 = -[VOTElementFetcher triggerSignpostCollection](self, "triggerSignpostCollection");
        v5 = v67;
        if (v58)
        {
          uint64_t v59 = VOTLogElement(v58);
          v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
          if (os_signpost_enabled(v60))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v60,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "FetchElements",  "",  buf,  2u);
          }

          -[VOTElementFetcher setTriggerSignpostCollection:](self, "setTriggerSignpostCollection:", 0LL);
        }

        goto LABEL_70;
      }
    }

    else
    {
      v69 = 0LL;
      if (v19) {
        goto LABEL_31;
      }
    }

    v68 = 0LL;
    goto LABEL_34;
  }

- (void)updateCacheWithElement:(id)a3
{
  *(_OWORD *)&self->_cacheSize = xmmword_100132E50;
  fillerThread = self->_fillerThread;
  id v5 = [a3 copyWithCache];
  -[SCRCThread performSelector:onTarget:cancelMask:count:objects:]( fillerThread,  "performSelector:onTarget:cancelMask:count:objects:",  "_updateCacheWithElement:",  self,  1LL,  1LL,  v5);
}

- (void)_forceUpdate
{
}

- (void)forceUpdate
{
  uint64_t v3 = VOTLogElement(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000F4D04(v4);
  }

  -[SCRCThread performSelector:onTarget:cancelMask:count:objects:]( self->_fillerThread,  "performSelector:onTarget:cancelMask:count:objects:",  "_forceUpdate",  self,  0LL,  0LL,  0LL);
}

- (void)cancelPreviousCount
{
  countGenerationQueue = (dispatch_queue_s *)self->_countGenerationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000CEE84;
  block[3] = &unk_100176D38;
  block[4] = self;
  dispatch_sync(countGenerationQueue, block);
}

- (BOOL)_wasCanceledWithCountGeneration:(unint64_t)a3
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  countGenerationQueue = (dispatch_queue_s *)self->_countGenerationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000CEF28;
  block[3] = &unk_100179C78;
  void block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(countGenerationQueue, block);
  char v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)_countElementsMatchingBlock:(id)a3 generation:(id)a4
{
  v15 = (uint64_t (**)(id, void *, void))a3;
  id v6 = [a4 unsignedLongLongValue];
  if (-[VOTElementFetcher _wasCanceledWithCountGeneration:](self, "_wasCanceledWithCountGeneration:", v6)) {
    goto LABEL_23;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  -[NSLock lock](self->_cacheLock, "lock");
  if (!-[NSMutableArray count](self->_elementCache, "count"))
  {
    -[NSLock unlock](self->_cacheLock, "unlock");
    -[VOTElementFetcher _updateCacheWithElement:](self, "_updateCacheWithElement:", 0LL);
    -[NSLock lock](self->_cacheLock, "lock");
  }

  uint64_t v8 = (uint64_t)-[NSMutableArray count](self->_elementCache, "count");
  if (v8 < 1)
  {
    uint64_t v10 = 0LL;
    goto LABEL_20;
  }

  uint64_t v9 = (char *)v8;
  uint64_t v10 = 0LL;
  v11 = 0LL;
  while (1)
  {
    dispatch_queue_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_elementCache, "objectAtIndex:", v11));
    if (-[VOTElementFetcher _wasCanceledWithCountGeneration:](self, "_wasCanceledWithCountGeneration:", v6))
    {
      -[NSLock unlock](self->_cacheLock, "unlock");
      goto LABEL_22;
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));

    if (v12 != v13) {
      break;
    }
    if (v11) {
      goto LABEL_19;
    }
LABEL_15:
  }

  if (v11 == v9 - 1)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));

    if (v12 != v14)
    {
      -[NSLock unlock](self->_cacheLock, "unlock");
      -[VOTElementFetcher _updateCacheWithElement:](self, "_updateCacheWithElement:", v12);
      -[NSLock lock](self->_cacheLock, "lock");
      uint64_t v9 = (char *)-[NSMutableArray count](self->_elementCache, "count");
    }
  }

  v10 += v15[2](v15, v12, 0LL) & 1;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_19:

LABEL_20:
  -[NSLock unlock](self->_cacheLock, "unlock");
  if (!-[VOTElementFetcher _wasCanceledWithCountGeneration:](self, "_wasCanceledWithCountGeneration:", v6))
  {
    dispatch_queue_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElementFetcher delegate](self, "delegate"));
    [v12 elementsCounted:v10];
LABEL_22:
  }

- (id)_handleOpaqueSearchForElementInDirection:(int64_t)a3 opaqueParent:(id)a4 searchType:(int64_t)a5 range:(_NSRange *)a6 matchBlock:(id)a7 resetContentOffsetInOpaqueParent:(BOOL *)a8 peeking:(BOOL)a9
{
  id v14 = a4;
  v39 = (uint64_t (**)(id, void *, void))a7;
  [v14 contentOffset];
  double v16 = v15;
  double v18 = v17;
  if (a3 == 1) {
    uint64_t v19 = 1LL;
  }
  else {
    uint64_t v19 = 2LL;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_opaqueElementCache, "objectForKey:", v14));
  v21 = (void *)objc_claimAutoreleasedReturnValue( [v14 opaqueElementInDirection:v19 searchType:a5 range:a6 peeking:a9 startOpaqueElement:v20]);

  if (v21) {
    id v22 = -[NSMutableDictionary setObject:forKey:](self->_opaqueElementCache, "setObject:forKey:", v21, v14);
  }
  uint64_t v23 = VOTLogCommon(v22);
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v41 = (uint64_t)v21;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Next header in direction %@", buf, 0xCu);
  }

  if (v21)
  {
    uint64_t v26 = kAXSpacerTrait;
    while (([v21 doesHaveTraits:v26] & 1) != 0 || (v39[2](v39, v21, 0) & 1) == 0)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_opaqueElementCache, "objectForKey:", v14));
      uint64_t v28 = objc_claimAutoreleasedReturnValue( [v14 opaqueElementInDirection:v19 searchType:a5 range:a6 peeking:a9 startOpaqueElement:v27]);

      if (v28) {
        id v29 = -[NSMutableDictionary setObject:forKey:](self->_opaqueElementCache, "setObject:forKey:", v28, v14);
      }
      uint64_t v30 = VOTLogCommon(v29);
      uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v41 = v28;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Try again header search element %@",  buf,  0xCu);
      }

      v21 = (void *)v28;
      if (!v28) {
        goto LABEL_17;
      }
    }
  }

  else
  {
LABEL_17:
    uint64_t v32 = VOTLogCommon(v25);
    id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Did not find a match, reset offset", buf, 2u);
    }

    [v14 contentOffset];
    if (vabdd_f64(v16, v35) >= 0.001 || vabdd_f64(v18, v34) >= 0.001)
    {
      objc_msgSend(v14, "setContentOffset:", v16, v18);
      v21 = 0LL;
      *a8 = 1;
    }

    else
    {
      v21 = 0LL;
    }
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didSearchForOpaqueElement];

  return v21;
}

- (id)_hitTestedElementForOriginalElement:(id)a3 hitTestPoint:(CGPoint)a4 opaqueParent:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = -[VOTElement initWithPosition:](objc_alloc(&OBJC_CLASS___VOTElement), "initWithPosition:", x, y);
  if (-[VOTElement isValid](v10, "isValid")
    && !-[VOTElement isEqual:](v10, "isEqual:", v8)
    && -[VOTElement isAccessibleElement](v10, "isAccessibleElement")
    && (!v9
     || (v11 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement opaqueParent](v10, "opaqueParent")),
         unsigned int v12 = [v11 isEqual:v9],
         v11,
         v12)))
  {
    uint64_t v13 = v10;
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  return v13;
}

- (BOOL)_wasCanceledWithSearchGeneration:(unint64_t)a3
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  searchGenerationQueue = (dispatch_queue_s *)self->_searchGenerationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000CF5D8;
  block[3] = &unk_100179C78;
  void block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(searchGenerationQueue, block);
  char v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)_searchForElementWithParameters:(id)a3
{
}

- (void)_searchForElementWithParameters:(id)a3 searchFromOpaqueElementsInRemoteParent:(BOOL)a4
{
  BOOL v5 = a4;
  id v7 = a3;
  id v8 = [v7 generation];
  if (!-[VOTElementFetcher _wasCanceledWithSearchGeneration:](self, "_wasCanceledWithSearchGeneration:", v8))
  {
    BOOL v203 = v5;
    id v200 = v8;
    id v216 = (id)objc_claimAutoreleasedReturnValue([v7 element]);
    id v210 = [v7 searchType];
    id v214 = [v7 direction];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 matchBlock]);
    v207 = (void *)objc_claimAutoreleasedReturnValue([v7 rangeBlock]);
    uint64_t v246 = 0LL;
    v247 = (NSRange *)&v246;
    uint64_t v248 = 0x3010000000LL;
    v249 = "";
    id v250 = [v7 startingRange];
    uint64_t v251 = v10;
    unsigned int v209 = [v7 needsForceCacheUpdate];
    uint64_t v242 = 0LL;
    v243 = &v242;
    uint64_t v244 = 0x2020000000LL;
    char v245 = 0;
    unsigned int v206 = [v7 groupNavigationStyle];
    unsigned __int8 v202 = [v7 peeking];
    v205 = (void *)objc_claimAutoreleasedReturnValue([v216 groupedParent]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v216 opaqueParent]);
    v215 = (void *)objc_claimAutoreleasedReturnValue([v216 localOpaqueParent]);
    v211 = (void *)objc_claimAutoreleasedReturnValue([v216 outermostLocalOpaqueParent]);
    v217 = v11;
    if (v11)
    {
      id v12 = v11;
    }

    else
    {
      id v12 = (id)objc_claimAutoreleasedReturnValue([v7 fallbackOpaqueParent]);
    }

    if (v215)
    {
      id v201 = v215;
    }

    else
    {
      id v201 = (id)objc_claimAutoreleasedReturnValue([v7 fallbackLocalOpaqueParent]);
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 fallbackOpaqueParent]);
    if (v11 == v13
      || (char v4 = (void *)objc_claimAutoreleasedReturnValue([v7 fallbackOpaqueParent]),
          ([v11 isEqual:v4] & 1) != 0))
    {
      double v15 = (void *)objc_claimAutoreleasedReturnValue([v7 fallbackLocalOpaqueParent]);
      double v16 = v15;
      if (v215 == v15)
      {

        if (v11 != v13)
        {

          v11 = v13;
        }

        goto LABEL_20;
      }

      double v17 = (void *)objc_claimAutoreleasedReturnValue([v7 fallbackLocalOpaqueParent]);
      unsigned __int8 v18 = [v215 isEqual:v17];

      if (v217 == v13)
      {
      }

      else
      {
      }

      if ((v18 & 1) != 0)
      {
LABEL_21:
        v231[0] = _NSConcreteStackBlock;
        v231[1] = 3221225472LL;
        v231[2] = sub_1000D0EE4;
        v231[3] = &unk_100179CA0;
        id v237 = v214;
        id v238 = v210;
        v231[4] = self;
        v235 = &v246;
        id v204 = v9;
        id v234 = v204;
        v236 = &v242;
        unsigned __int8 v239 = v202;
        id v213 = v12;
        id v232 = v213;
        char v240 = v209;
        id v20 = v7;
        id v233 = v20;
        char v241 = v206;
        v208 = objc_retainBlock(v231);
        if (v211) {
          int v21 = 1;
        }
        else {
          int v21 = v203;
        }
        if (v213) {
          int v22 = v21;
        }
        else {
          int v22 = 0;
        }
        id v23 = v216;
        if (v22 == 1)
        {
          if (v203) {
            id v24 = v213;
          }
          else {
            id v24 = v211;
          }
          uint64_t v25 = ((uint64_t (*)(void *, id))v208[2])(v208, v24);
          id v212 = v216;
          if ((v25 & 1) != 0) {
            goto LABEL_204;
          }
          uint64_t v26 = VOTLogElement(v25);
          v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
            sub_1000F5248();
          }

          id v23 = v213;
        }

        -[NSLock lock](self->_cacheLock, "lock");
        p_elementCache = &self->_elementCache;
        elementCache = self->_elementCache;
        v229[0] = _NSConcreteStackBlock;
        v229[1] = 3221225472LL;
        v229[2] = sub_1000D1128;
        v229[3] = &unk_100179CC8;
        id v212 = v23;
        id v230 = v212;
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray indexesOfObjectsPassingTest:]( elementCache,  "indexesOfObjectsPassingTest:",  v229));
        v199 = v30;
        if (v214 == (id)1) {
          uint64_t v31 = (char *)[v30 lastIndex];
        }
        else {
          uint64_t v31 = (char *)[v30 firstIndex];
        }
        uint64_t v32 = v31;
        if (v31 == (char *)0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v33 = VOTLogElement(0x7FFFFFFFFFFFFFFFLL);
          double v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
            sub_1000F51D0();
          }

          -[NSLock unlock](self->_cacheLock, "unlock");
          -[VOTElementFetcher _updateCacheWithElement:](self, "_updateCacheWithElement:", v212);
          -[NSLock lock](self->_cacheLock, "lock");
          uint64_t v32 = (char *)-[NSMutableArray indexOfObject:](*p_elementCache, "indexOfObject:", v212);
          uint64_t v35 = VOTLogElement(v32);
          v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
            sub_1000F51A0(v36, v37, v38, v39, v40, v41, v42, v43);
          }
        }

        uint64_t v44 = VOTLogElement(v31);
        v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v56 = *p_elementCache;
          *(_DWORD *)buf = 138543874;
          id v254 = v212;
          __int16 v255 = 2048;
          v256 = v32;
          __int16 v257 = 2114;
          v258 = (char *)v56;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEBUG,  "Location of element %{public}@ in cache: %ld\nCache: %{public}@",  buf,  0x20u);
        }

        if (-[VOTElementFetcher _wasCanceledWithSearchGeneration:](self, "_wasCanceledWithSearchGeneration:", v8))
        {
          -[NSLock unlock](self->_cacheLock, "unlock");
LABEL_203:

LABEL_204:
          _Block_object_dispose(&v242, 8);
          _Block_object_dispose(&v246, 8);

          goto LABEL_205;
        }

        if (v32 == (char *)0x7FFFFFFFFFFFFFFFLL)
        {
          -[NSLock unlock](self->_cacheLock, "unlock");
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          id v47 = [v20 clientGeneration];
          id v48 = (void *)objc_claimAutoreleasedReturnValue( +[VOTElementFetchFoundData fetchFoundData:forceUpdate:direction:generation:range:searchType:]( &OBJC_CLASS___VOTElementFetchFoundData,  "fetchFoundData:forceUpdate:direction:generation:range:searchType:",  0LL,  v209,  v214,  v47,  v247[2].location,  v247[2].length,  v210));
          [WeakRetained elementFetchFound:v48];

LABEL_202:
          goto LABEL_203;
        }

        v223[0] = _NSConcreteStackBlock;
        v223[1] = 3221225472LL;
        v223[2] = sub_1000D1134;
        v223[3] = &unk_100179CF0;
        id v192 = v207;
        id v225 = v192;
        id v226 = v214;
        char v228 = v209;
        id v49 = v20;
        id v224 = v49;
        id v227 = v210;
        v197 = objc_retainBlock(v223);
        v218[0] = _NSConcreteStackBlock;
        v218[1] = 3221225472LL;
        v218[2] = sub_1000D1258;
        v218[3] = &unk_100179D18;
        id v220 = v210;
        id v221 = v214;
        char v222 = v209;
        id v194 = v49;
        id v219 = v194;
        v196 = objc_retainBlock(v218);
        uint64_t v50 = ((uint64_t (*)(void *, id, NSUInteger, NSUInteger, void))v197[2])( v197,  v212,  v247[2].location,  v247[2].length,  0LL);
        v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
        if (v51)
        {
          id v52 = objc_loadWeakRetained((id *)&self->_delegate);
          [v52 elementFetchFound:v51];
LABEL_201:

          id WeakRetained = v225;
          goto LABEL_202;
        }

        id v52 = (id)objc_claimAutoreleasedReturnValue([0 searchUUID]);
        uint64_t v53 = ((uint64_t (*)(void *, id, NSUInteger, NSUInteger, id))v196[2])( v196,  v212,  v247[2].location,  v247[2].length,  v52);
        uint64_t v54 = objc_claimAutoreleasedReturnValue(v53);
        v55 = (void *)objc_claimAutoreleasedReturnValue([(id)v54 element]);
        v195 = (void *)v54;
        LOBYTE(v54) = v55 == 0LL;

        if ((v54 & 1) == 0)
        {
          id v198 = objc_loadWeakRetained((id *)&self->_delegate);
          [v198 elementFetchFound:v195];
          v51 = 0LL;
          goto LABEL_200;
        }

        v193 = (void *)objc_claimAutoreleasedReturnValue([v195 searchUUID]);

        uint64_t v59 = (char *)-[NSMutableArray count](*p_elementCache, "count");
        if (v214 == (id)1) {
          uint64_t v60 = 1LL;
        }
        else {
          uint64_t v60 = -1LL;
        }
        uint64_t v187 = v60;
        context = v59;
        v61 = &v32[v60];
        BOOL v62 = (uint64_t)&v32[v60] < (uint64_t)v59;
        v63 = v61;
        BOOL v64 = (uint64_t)v61 >= 0;
        if (v214 != (id)1) {
          BOOL v62 = v64;
        }
        if (v62)
        {
          v191 = 0LL;
          char v184 = 0;
          uint64_t v65 = 0x7FFFFFFFLL;
          if (v214 == (id)1) {
            uint64_t v65 = 0LL;
          }
          NSUInteger v186 = v65;
          uint64_t v185 = kAXSpacerTrait;
          uint64_t v66 = -1LL;
          if (v214 != (id)1) {
            uint64_t v66 = 1LL;
          }
          uint64_t v183 = v66;
          while (1)
          {
            if (-[VOTElementFetcher _wasCanceledWithSearchGeneration:](self, "_wasCanceledWithSearchGeneration:", v200)) {
              goto LABEL_126;
            }
            id v198 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](*p_elementCache, "objectAtIndex:", v63));
            objc_opt_class(&OBJC_CLASS___VOTElement, v67);
            if ((objc_opt_isKindOfClass(v198, v68) & 1) != 0)
            {
              unsigned int v69 = [v198 pid];
              if (((v69 == [v212 pid]) & v22) == 1)
              {
                if ([v212 isAccessibilityOpaqueElementProvider])
                {
                  if ((((uint64_t (*)(void *, id))v208[2])(v208, v212) & 1) != 0)
                  {
                    id v52 = v193;
                    v51 = v191;
                    goto LABEL_200;
                  }

                  LOBYTE(v22) = 0;
                }

                else
                {
                  LOBYTE(v22) = 1;
                }
              }
            }

            __int128 v70 = v247;
            v247[2].location = v186;
            v70[2].length = 0LL;
            id v71 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
            BOOL v72 = v198 == v71;

            if (v72)
            {
              id v85 = 0LL;
LABEL_128:
              unsigned int v188 = 0;
              goto LABEL_138;
            }

            uint64_t v74 = VOTLogElement(v73);
            v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
            if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              id v254 = v198;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v75,  OS_LOG_TYPE_DEBUG,  "Checking element %{public}@",  buf,  0xCu);
            }

            unsigned __int8 v76 = [v198 doesHaveTraits:v185];
            id v77 = v214;
            if ((v76 & 1) == 0) {
              break;
            }
LABEL_106:
            BOOL v95 = v77 == (id)1;

            BOOL v96 = (uint64_t)&v63[v187] < (uint64_t)context;
            v63 += v187;
            if (!v95) {
              BOOL v96 = (uint64_t)v63 >= 0;
            }
            if (!v96) {
              goto LABEL_126;
            }
          }

          if (v206)
          {
            uint64_t v78 = objc_claimAutoreleasedReturnValue([v198 groupedParent]);
            __int16 v79 = (void *)v78;
            if (!v78 && v205)
            {
              __int16 v79 = 0LL;
LABEL_132:
              uint64_t v110 = VOTLogElement(v78);
              v111 = (os_log_s *)objc_claimAutoreleasedReturnValue(v110);
              if (os_log_type_enabled(v111, OS_LOG_TYPE_DEBUG)) {
                sub_1000F5140();
              }

              uint64_t v113 = VOTLogElement(v112);
              v114 = (os_log_s *)objc_claimAutoreleasedReturnValue(v113);
              if (os_log_type_enabled(v114, OS_LOG_TYPE_DEBUG)) {
                sub_1000F50CC();
              }

LABEL_137:
              id v85 = 0LL;
              unsigned int v188 = 1;
LABEL_138:

              goto LABEL_139;
            }

            if (v78 && !v205) {
              goto LABEL_132;
            }
            if (v78)
            {
              if (v205)
              {
                uint64_t v78 = (uint64_t)[v205 isEqual:v78];
                if ((v78 & 1) == 0) {
                  goto LABEL_132;
                }
              }
            }
          }

          id v80 = [v198 isAccessibilityOpaqueElementProvider];
          else {
            int v81 = (int)v80;
          }
          if (v81 == 1)
          {
            if (!v206 || (id v80 = [v198 isAccessibleGroup], (v80 & 1) == 0))
            {
              uint64_t v83 = VOTLogElement(v80);
              v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v83);
              if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                id v254 = v198;
                _os_log_debug_impl( (void *)&_mh_execute_header,  v84,  OS_LOG_TYPE_DEBUG,  "Try opaque element: %@",  buf,  0xCu);
              }

              LOBYTE(v181) = v202;
              id v85 = (id)objc_claimAutoreleasedReturnValue( -[VOTElementFetcher _handleOpaqueSearchForElementInDirection:opaqueParent:searchType:range:matchBlock:resetContentOffsetInOpaqueParent:peeking:]( self,  "_handleOpaqueSearchForElementInDirection:opaqueParent:searchType:range:matchBlock:resetConte ntOffsetInOpaqueParent:peeking:",  v214,  v198,  v210,  &v247[2],  v204,  v243 + 3,  v181));
              if (v85) {
                goto LABEL_128;
              }
              goto LABEL_99;
            }
          }

          if (([v198 isAccessibleElement] & 1) != 0
            || ([v198 isTouchContainer] & 1) != 0
            || v206 && [v198 isAccessibleGroup])
          {
            if (((*((uint64_t (**)(id, id, id))v204 + 2))(v204, v198, v212) & 1) != 0)
            {
              id v85 = v198;
              goto LABEL_128;
            }

            if (v82 == 1) {
              goto LABEL_137;
            }
            goto LABEL_99;
          }

          if (([v198 isAlive] & 1) == 0)
          {
            if ((v184 & 1) != 0)
            {
              char v184 = 0;
LABEL_105:
              id v77 = v214;
              goto LABEL_106;
            }

            if (v214 == (id)1 && (uint64_t)v63 >= 1)
            {
              v99 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](*p_elementCache, "objectAtIndex:", v63 - 1));
              v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
              BOOL v101 = v99 == v100;

              if (v101) {
                goto LABEL_99;
              }
              v102 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](*p_elementCache, "objectAtIndex:", v63 - 1));
              v103 = (void *)objc_claimAutoreleasedReturnValue([v102 elementsInDirection:1 withCount:1]);
              uint64_t v104 = objc_claimAutoreleasedReturnValue([v103 firstObject]);
            }

            else
            {
              if (v214 == (id)1) {
                goto LABEL_99;
              }
              v106 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](*p_elementCache, "objectAtIndex:", v63 + 1));
              v107 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
              BOOL v108 = v106 == v107;

              if (v108) {
                goto LABEL_99;
              }
              v102 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](*p_elementCache, "objectAtIndex:", v63 + 1));
              v103 = (void *)objc_claimAutoreleasedReturnValue([v102 elementsInDirection:2 withCount:1]);
              uint64_t v104 = objc_claimAutoreleasedReturnValue([v103 firstObject]);
            }

            v105 = (void *)v104;

            if (v105)
            {
              -[NSMutableArray replaceObjectAtIndex:withObject:]( *p_elementCache,  "replaceObjectAtIndex:withObject:",  v63,  v105);

              v63 += v183;
              char v184 = 1;
              goto LABEL_105;
            }
          }

- (void)cancelPreviousSearch
{
  searchGenerationQueue = (dispatch_queue_s *)self->_searchGenerationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D1500;
  block[3] = &unk_100176D38;
  block[4] = self;
  dispatch_sync(searchGenerationQueue, block);
  self->_retrievingAllElements = 0;
}

- (void)countElementsMatchingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  uint64_t v13 = 0LL;
  countGenerationQueue = (dispatch_queue_s *)self->_countGenerationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D166C;
  block[3] = &unk_100176E20;
  block[4] = self;
  void block[5] = &v10;
  dispatch_sync(countGenerationQueue, block);
  self->_cacheSize = 1000LL;
  id v6 = [v4 copy];
  fillerThread = self->_fillerThread;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v11[3]));
  -[SCRCThread performSelector:onTarget:cancelMask:count:objects:]( fillerThread,  "performSelector:onTarget:cancelMask:count:objects:",  "_countElementsMatchingBlock:generation:",  self,  1LL,  2LL,  v6,  v8);

  _Block_object_dispose(&v10, 8);
}

- (void)searchForElementInDirection:(int64_t)a3 fromElement:(id)a4 needsForceCacheUpdate:(BOOL)a5 matchBlock:(id)a6 rangeMatch:(id)a7 searchType:(int64_t)a8 generation:(unint64_t)a9 startingRange:(_NSRange)a10 groupNavigationStyle:(BOOL)a11 peeking:(BOOL)a12
{
  BOOL v15 = a5;
  id v18 = a4;
  id v74 = a6;
  id v75 = a7;
  uint64_t v77 = 0LL;
  v78[0] = &v77;
  v78[1] = 0x2020000000LL;
  v78[2] = 0LL;
  searchGenerationQueue = (dispatch_queue_s *)self->_searchGenerationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D1C60;
  block[3] = &unk_100176E20;
  block[4] = self;
  void block[5] = &v77;
  dispatch_sync(searchGenerationQueue, block);
  *(_OWORD *)&self->_cacheSize = xmmword_100132E60;
  self->_retrievingAllElements = 0;
  uint64_t v21 = VOTLogElement(v20);
  int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    sub_1000F550C((uint64_t)v78, (uint64_t)v18, v22);
  }

  id v23 = v18;
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 opaqueParent]);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v23 localOpaqueParent]);
  [v23 centerPoint];
  double MidX = v26;
  double MidY = v28;
  [v23 frame];
  CGFloat x = v90.origin.x;
  CGFloat y = v90.origin.y;
  CGFloat width = v90.size.width;
  CGFloat height = v90.size.height;
  v95.origin.CGFloat x = CGRectZero.origin.x;
  v95.origin.CGFloat y = CGRectZero.origin.y;
  v95.size.CGFloat width = CGRectZero.size.width;
  v95.size.CGFloat height = CGRectZero.size.height;
  if (!CGRectEqualToRect(v90, v95))
  {
    v91.origin.CGFloat x = x;
    v91.origin.CGFloat y = y;
    v91.size.CGFloat width = width;
    v91.size.CGFloat height = height;
    v89.CGFloat x = MidX;
    v89.CGFloat y = MidY;
    BOOL v34 = CGRectContainsPoint(v91, v89);
    if (!v34)
    {
      uint64_t v35 = VOTLogElement(v34);
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        v92.origin.CGFloat x = x;
        v92.origin.CGFloat y = y;
        v92.size.CGFloat width = width;
        v92.size.CGFloat height = height;
        uint64_t v37 = NSStringFromCGRect(v92);
        uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
        sub_1000F54C0(v38, (uint64_t)v85, v36);
      }

      v93.origin.CGFloat x = x;
      v93.origin.CGFloat y = y;
      v93.size.CGFloat width = width;
      v93.size.CGFloat height = height;
      double MidX = CGRectGetMidX(v93);
      v94.origin.CGFloat x = x;
      v94.origin.CGFloat y = y;
      v94.size.CGFloat width = width;
      v94.size.CGFloat height = height;
      double MidY = CGRectGetMidY(v94);
    }
  }

  unsigned int v39 = [v23 windowContextId];
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
  objc_msgSend(v40, "convertPoint:fromContextId:", objc_msgSend(v23, "windowContextId"), MidX, MidY);
  double v42 = v41;
  double v44 = v43;

  uint64_t v46 = VOTLogElement(v45);
  id v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
  {
    v87.CGFloat x = v42;
    v87.CGFloat y = v44;
    unsigned int v69 = NSStringFromCGPoint(v87);
    id v70 = (id)objc_claimAutoreleasedReturnValue(v69);
    v88.CGFloat x = MidX;
    v88.CGFloat y = MidY;
    id v71 = NSStringFromCGPoint(v88);
    uint64_t v72 = objc_claimAutoreleasedReturnValue(v71);
    *(_DWORD *)buf = 138543874;
    id v80 = v70;
    __int16 v81 = 1024;
    unsigned int v82 = v39;
    __int16 v83 = 2114;
    uint64_t v73 = (void *)v72;
    uint64_t v84 = v72;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEBUG,  "Hit test point is %{public}@ with window context id %u and original center point %{public}@",  buf,  0x1Cu);
  }

  id v49 = v23;
  if (!v23)
  {
    id v49 = 0LL;
    if (v24)
    {
      uint64_t v50 = VOTLogElement(v48);
      v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
      {
        v86.CGFloat x = v42;
        v86.CGFloat y = v44;
        id v52 = NSStringFromCGPoint(v86);
        uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
        sub_1000F5464((uint64_t)v24, v53, (uint64_t)buf, v51);
      }

      uint64_t v54 = objc_claimAutoreleasedReturnValue( -[VOTElementFetcher _hitTestedElementForOriginalElement:hitTestPoint:opaqueParent:]( self,  "_hitTestedElementForOriginalElement:hitTestPoint:opaqueParent:",  0LL,  v24,  v42,  v44));
      id v49 = (void *)v54;
      if (v54)
      {
        uint64_t v55 = VOTLogElement(v54);
        uint64_t v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
          sub_1000F5404();
        }

        id v57 = v49;
      }
    }
  }

  if (v49 || !v24)
  {
    id WeakRetained = objc_alloc_init(&OBJC_CLASS___VOTElementFetcherSearchParameters);
    -[VOTElementFetcherSearchParameters setDirection:](WeakRetained, "setDirection:", a3);
    -[VOTElementFetcherSearchParameters setElement:](WeakRetained, "setElement:", v49);
    -[VOTElementFetcherSearchParameters setNeedsForceCacheUpdate:](WeakRetained, "setNeedsForceCacheUpdate:", v15);
    -[VOTElementFetcherSearchParameters setMatchBlock:](WeakRetained, "setMatchBlock:", v74);
    -[VOTElementFetcherSearchParameters setRangeBlock:](WeakRetained, "setRangeBlock:", v75);
    -[VOTElementFetcherSearchParameters setSearchType:](WeakRetained, "setSearchType:", a8);
    -[VOTElementFetcherSearchParameters setStartingRange:](WeakRetained, "setStartingRange:", a10.location, a10.length);
    -[VOTElementFetcherSearchParameters setFallbackOpaqueParent:](WeakRetained, "setFallbackOpaqueParent:", v24);
    -[VOTElementFetcherSearchParameters setFallbackLocalOpaqueParent:]( WeakRetained,  "setFallbackLocalOpaqueParent:",  v25);
    -[VOTElementFetcherSearchParameters setHitTestPoint:](WeakRetained, "setHitTestPoint:", v42, v44);
    -[VOTElementFetcherSearchParameters setGeneration:](WeakRetained, "setGeneration:", *(void *)(v78[0] + 24LL));
    -[VOTElementFetcherSearchParameters setClientGeneration:](WeakRetained, "setClientGeneration:", a9);
    -[VOTElementFetcherSearchParameters setGroupNavigationStyle:](WeakRetained, "setGroupNavigationStyle:", a11);
    -[VOTElementFetcherSearchParameters setPeeking:](WeakRetained, "setPeeking:", a12);
    if (-[VOTElementFetcher shouldPerformSearchSynchronously](self, "shouldPerformSearchSynchronously")) {
      -[VOTElementFetcher _searchForElementWithParameters:](self, "_searchForElementWithParameters:", WeakRetained);
    }
    else {
      -[SCRCThread performSelector:onTarget:cancelMask:count:objects:]( self->_fillerThread,  "performSelector:onTarget:cancelMask:count:objects:",  "_searchForElementWithParameters:",  self,  1LL,  1LL,  WeakRetained);
    }
  }

  else
  {
    uint64_t v58 = VOTLogElement(v48);
    uint64_t v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG)) {
      sub_1000F53D4(v59, v60, v61, v62, v63, v64, v65, v66);
    }

    id WeakRetained = (VOTElementFetcherSearchParameters *)objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue( +[VOTElementFetchFoundData fetchFoundData:forceUpdate:direction:generation:range:searchType:]( &OBJC_CLASS___VOTElementFetchFoundData,  "fetchFoundData:forceUpdate:direction:generation:range:searchType:",  0LL,  v15,  a3,  a9,  0x7FFFFFFFLL,  0LL,  a8));
    -[VOTElementFetcherSearchParameters elementFetchFound:](WeakRetained, "elementFetchFound:", v68);
  }

  _Block_object_dispose(&v77, 8);
}

- (void)searchForElementInDirection:(int64_t)a3 fromElement:(id)a4 matchBlock:(id)a5 rangeMatch:(id)a6 searchType:(int64_t)a7 generation:(unint64_t)a8 startingRange:(_NSRange)a9 groupNavigationStyle:(BOOL)a10 peeking:(BOOL)a11
{
  LOWORD(v11) = __PAIR16__(a11, a10);
  -[VOTElementFetcher searchForElementInDirection:fromElement:needsForceCacheUpdate:matchBlock:rangeMatch:searchType:generation:startingRange:groupNavigationStyle:peeking:]( self,  "searchForElementInDirection:fromElement:needsForceCacheUpdate:matchBlock:rangeMatch:searchType:generation:startingRa nge:groupNavigationStyle:peeking:",  a3,  a4,  0LL,  a5,  a6,  a7,  a8,  a9.location,  a9.length,  v11);
}

- (void)searchForElementInDirection:(int64_t)a3 fromElement:(id)a4 matchBlock:(id)a5 rangeMatch:(id)a6 searchType:(int64_t)a7 generation:(unint64_t)a8 startingRange:(_NSRange)a9 groupNavigationStyle:(BOOL)a10
{
  LOWORD(v10) = a10;
  -[VOTElementFetcher searchForElementInDirection:fromElement:needsForceCacheUpdate:matchBlock:rangeMatch:searchType:generation:startingRange:groupNavigationStyle:peeking:]( self,  "searchForElementInDirection:fromElement:needsForceCacheUpdate:matchBlock:rangeMatch:searchType:generation:startingRa nge:groupNavigationStyle:peeking:",  a3,  a4,  0LL,  a5,  a6,  a7,  a8,  a9.location,  a9.length,  v10);
}

- (void)didFinishBatchPeeking
{
  uint64_t v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  opaqueElementCache = self->_opaqueElementCache;
  self->_opaqueElementCache = v3;
}

- (void)_informDelegateOfRetrieveElements
{
  id v3 = -[NSMutableArray copyWithZone:](self->_elementCache, "copyWithZone:", 0LL);
  uint64_t v4 = VOTLogElement(-[NSLock unlock](self->_cacheLock, "unlock"));
  BOOL v5 = (char *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000F558C(v3, v5);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained elementsRetrieved:v3 finished:!self->_retrievingAllElements];
}

- (void)_retrieveElementsWithElement:(id)a3 groupNavigationStyle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_retrievingAllElements) {
    goto LABEL_49;
  }
  id v8 = -[NSMutableArray count](self->_elementCache, "count");
  self->_retrievingAllElements = 1;
  self->_cacheSize = 1000LL;
  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_elementCache, "objectAtIndex:", 0LL));
    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_elementCache, "lastObject"));
    id v11 = (id)v10;
  }

  else
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 opaqueParent]);
    uint64_t v13 = v12;
    if (v12)
    {
      id v14 = v12;

      id v6 = v14;
    }

    id v11 = v6;
    if (v11) {
      -[NSMutableArray addObject:](self->_elementCache, "addObject:", v11);
    }

    uint64_t v9 = v11;
    id v6 = v11;
  }

  id v54 = v6;
  uint64_t v15 = VOTLogElement(v10);
  double v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_1000F574C();
  }

  id v17 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  BOOL v18 = 1;
  if (v11 != v17)
  {
    id v19 = (id)objc_claimAutoreleasedReturnValue([v11 elementsInDirection:1 withCount:300]);
    uint64_t v20 = v19;
    if (v19)
    {
      -[NSLock lock](self->_cacheLock, "lock");
      -[NSMutableArray addObjectsFromArray:](self->_elementCache, "addObjectsFromArray:", v20);
      id v21 = [v20 count];
      BOOL v18 = (unint64_t)v21 < 0x12C;
      if ((unint64_t)v21 <= 0x12B)
      {
        elementCache = self->_elementCache;
        id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
        -[NSMutableArray addObject:](elementCache, "addObject:", v23);
      }

      id v19 = -[NSLock unlock](self->_cacheLock, "unlock");
    }

    uint64_t v24 = VOTLogElement(v19);
    uint64_t v25 = (char *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEBUG)) {
      sub_1000F56DC(v20, v25);
    }

    -[VOTElementFetcher _informDelegateOfRetrieveElements](self, "_informDelegateOfRetrieveElements");
  }

  double v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));

  id v52 = v9;
  uint64_t v53 = v11;
  if (v9 == v26)
  {
    if (v18)
    {
LABEL_30:
      self->_retrievingAllElements = 0;
      int v51 = 1;
      goto LABEL_31;
    }
  }

  else
  {
    uint64_t v27 = objc_claimAutoreleasedReturnValue([v9 elementsInDirection:2 withCount:300]);
    if (v27)
    {
      double v28 = (void *)v27;
      -[NSLock lock](self->_cacheLock, "lock");
      id v29 = self->_elementCache;
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v28 reverseObjectEnumerator]);
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 allObjects]);
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexSet indexSetWithIndexesInRange:]( NSIndexSet,  "indexSetWithIndexesInRange:",  0,  [v28 count]));
      -[NSMutableArray insertObjects:atIndexes:](v29, "insertObjects:atIndexes:", v31, v32);

      id v33 = [v28 count];
      if ((unint64_t)v33 > 0x12B)
      {
        LOBYTE(v18) = 0;
      }

      else
      {
        BOOL v34 = self->_elementCache;
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
        -[NSMutableArray insertObject:atIndex:](v34, "insertObject:atIndex:", v35, 0LL);
      }

      uint64_t v36 = VOTLogElement(v33);
      uint64_t v37 = (char *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_DEBUG)) {
        sub_1000F566C(v28, v37);
      }

      -[NSLock unlock](self->_cacheLock, "unlock");
    }

    if (v18) {
      goto LABEL_30;
    }
  }

  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472LL;
  v59[2] = sub_1000D22FC;
  v59[3] = &unk_100176DA8;
  v59[4] = self;
  id v60 = v7;
  -[VOTElementFetcher performAsyncBlock:forThreadKey:]( self,  "performAsyncBlock:forThreadKey:",  v59,  self->_fillerThreadKey);

  int v51 = 0;
LABEL_31:
  -[NSLock lock](self->_cacheLock, "lock");
  id v38 = -[NSMutableArray mutableCopy](self->_elementCache, "mutableCopy");
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  id v39 = v38;
  id v40 = [v39 countByEnumeratingWithState:&v55 objects:v61 count:16];
  if (v40)
  {
    id v42 = v40;
    uint64_t v43 = *(void *)v56;
    do
    {
      for (i = 0LL; i != v42; i = (char *)i + 1)
      {
        if (*(void *)v56 != v43) {
          objc_enumerationMutation(v39);
        }
        uint64_t v45 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)i);
        objc_opt_class(&OBJC_CLASS___VOTElement, v41);
        if ((objc_opt_isKindOfClass(v45, v46) & 1) != 0
          && [v45 isAccessibilityOpaqueElementProvider]
          && (!v7 || ([v45 isAccessibleGroup] & 1) == 0))
        {
          id v47 = (void *)objc_claimAutoreleasedReturnValue([v45 visibleOpaqueElements]);
          if ([v47 count])
          {
            id v48 = -[NSMutableArray indexOfObject:](self->_elementCache, "indexOfObject:", v45);
            if (v48 != (id)0x7FFFFFFFFFFFFFFFLL) {
              -[NSMutableArray replaceObjectsInRange:withObjectsFromArray:]( self->_elementCache,  "replaceObjectsInRange:withObjectsFromArray:",  v48,  1LL,  v47);
            }
          }
        }
      }

      id v42 = [v39 countByEnumeratingWithState:&v55 objects:v61 count:16];
    }

    while (v42);
  }

  uint64_t v49 = VOTLogElement(-[NSLock unlock](self->_cacheLock, "unlock"));
  uint64_t v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
    sub_1000F55FC(v51, v50);
  }

  -[VOTElementFetcher _informDelegateOfRetrieveElements](self, "_informDelegateOfRetrieveElements");
  id v6 = v54;
LABEL_49:
}

- (void)retrieveElementsWithElement:(id)a3 groupNavigationStyle:(BOOL)a4
{
  if (!self->_retrievingAllElements)
  {
    BOOL v4 = a4;
    self->_retrievingAllElements = 1;
    id v6 = a3;
    -[VOTElementFetcher _informDelegateOfRetrieveElements](self, "_informDelegateOfRetrieveElements");
    fillerThread = self->_fillerThread;
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
    -[SCRCThread performSelector:onTarget:cancelMask:count:objects:]( fillerThread,  "performSelector:onTarget:cancelMask:count:objects:",  "_retrieveElementsWithElement:groupNavigationStyle:",  self,  1LL,  2LL,  v6,  v8);
  }

- (id)_debugElementCache
{
  id v3 = -[NSMutableArray copy](self->_elementCache, "copy");
  -[NSLock unlock](self->_cacheLock, "unlock");
  return v3;
}

- (void)fillCacheWithElements:(id)a3
{
  cacheLock = self->_cacheLock;
  id v5 = a3;
  -[NSLock lock](cacheLock, "lock");
  -[NSMutableArray removeAllObjects](self->_elementCache, "removeAllObjects");
  elementCache = self->_elementCache;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  -[NSMutableArray addObject:](elementCache, "addObject:", v7);

  -[NSMutableArray addObjectsFromArray:](self->_elementCache, "addObjectsFromArray:", v5);
  id v8 = self->_elementCache;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  -[NSMutableArray addObject:](v8, "addObject:", v9);

  -[NSLock unlock](self->_cacheLock, "unlock");
  -[VOTElementFetcher setShouldPerformSearchSynchronously:](self, "setShouldPerformSearchSynchronously:", 1LL);
}

- (VOTElementFetchDelegateProtocol)delegate
{
  return (VOTElementFetchDelegateProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldPerformSearchSynchronously
{
  return self->_shouldPerformSearchSynchronously;
}

- (void)setShouldPerformSearchSynchronously:(BOOL)a3
{
  self->_shouldPerformSearchSynchronouslCGFloat y = a3;
}

- (BOOL)triggerSignpostCollection
{
  return self->_triggerSignpostCollection;
}

- (void)setTriggerSignpostCollection:(BOOL)a3
{
  self->_triggerSignpostCollection = a3;
}

- (void).cxx_destruct
{
}

  ;
}

  ;
}

@end
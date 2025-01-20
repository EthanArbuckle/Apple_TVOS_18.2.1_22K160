@interface _VOTElementExplorer
- (_VOTElementExplorer)initWithElementManager:(id)a3 MatchBlock:(id)a4;
- (void)_proceed;
- (void)_wrapup;
- (void)elementFetchFound:(id)a3;
- (void)fetchElementsFrom:(id)a3 inDirection:(int64_t)a4 count:(unint64_t)a5 scroll:(BOOL)a6 block:(id)a7;
@end

@implementation _VOTElementExplorer

- (_VOTElementExplorer)initWithElementManager:(id)a3 MatchBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS____VOTElementExplorer;
  v9 = -[_VOTElementExplorer init](&v15, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_manager, a3);
    id v11 = objc_retainBlock(v8);
    id matchBlock = v10->_matchBlock;
    v10->_id matchBlock = v11;

    v13 = v10;
  }

  return v10;
}

- (void)fetchElementsFrom:(id)a3 inDirection:(int64_t)a4 count:(unint64_t)a5 scroll:(BOOL)a6 block:(id)a7
{
  id v20 = a3;
  id v13 = a7;
  if (v20 && (unint64_t)(a4 - 3) >= 0xFFFFFFFFFFFFFFFELL && v13)
  {
    if (!self->_fetcher)
    {
      v14 = objc_opt_new(&OBJC_CLASS___VOTElementFetcher);
      fetcher = self->_fetcher;
      self->_fetcher = v14;

      -[VOTElementFetcher setDelegate:](self->_fetcher, "setDelegate:", self);
    }

    id v16 = objc_retainBlock(v13);
    id foundBlock = self->_foundBlock;
    self->_id foundBlock = v16;

    self->_direction = a4;
    self->_count = a5;
    self->_remainingCount = a5;
    objc_storeStrong((id *)&self->_baseElement, a3);
    objc_storeStrong((id *)&self->_currentElement, a3);
    v18 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    foundElements = self->_foundElements;
    self->_foundElements = v18;

    self->_peeking = !a6;
    -[_VOTElementExplorer _proceed](self, "_proceed");
  }
}

- (void)_proceed
{
  if (self->_remainingCount)
  {
    int64_t direction = self->_direction;
    currentElement = self->_currentElement;
    fetcher = self->_fetcher;
    id matchBlock = self->_matchBlock;
    id v7 = -[VOTElement selectedTextRange](currentElement, "selectedTextRange");
    uint64_t v9 = v8;
    unsigned __int8 v10 = [(id)VOTSharedWorkspace navigationStyleHonorsGroups];
    BYTE1(v11) = self->_peeking;
    LOBYTE(v11) = v10;
    -[VOTElementFetcher searchForElementInDirection:fromElement:matchBlock:rangeMatch:searchType:generation:startingRange:groupNavigationStyle:peeking:]( fetcher,  "searchForElementInDirection:fromElement:matchBlock:rangeMatch:searchType:generation:startingRange:groupNavigationStyle:peeking:",  direction,  currentElement,  matchBlock,  0LL,  0LL,  0LL,  v7,  v9,  v11);
  }

  else
  {
    -[_VOTElementExplorer _wrapup](self, "_wrapup");
  }

- (void)_wrapup
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  v4 = self->_foundElements;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v20,  v32,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "label", (void)v20));
        if (v10)
        {
          -[NSMutableArray addObject:](v3, "addObject:", v10);
        }

        else
        {
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 description]);
          -[NSMutableArray addObject:](v3, "addObject:", v11);
        }
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v20,  v32,  16LL);
    }

    while (v6);
  }

  uint64_t v13 = VOTLogElement(v12);
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_count));
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_direction == 1));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement label](self->_baseElement, "label"));
    *(_DWORD *)buf = 138413058;
    v25 = v15;
    __int16 v26 = 2112;
    v27 = v16;
    __int16 v28 = 2112;
    v29 = v17;
    __int16 v30 = 2112;
    v31 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "_VOTElementExplorer found elements: count(%@) forward(%@) base(%@) result = %@",  buf,  0x2Au);
  }

  -[VOTElementFetcher didFinishBatchPeeking](self->_fetcher, "didFinishBatchPeeking");
  v18 = self->_foundElements;
  id foundBlock = (void (**)(id, NSMutableArray *))self->_foundBlock;
  if (foundBlock) {
    foundBlock[2](foundBlock, v18);
  }
  -[VOTElementFetcher invalidate](self->_fetcher, "invalidate", (void)v20);
  -[VOTElementManager removeElementExplorer:](self->_manager, "removeElementExplorer:", self);
}

- (void)elementFetchFound:(id)a3
{
  id obj = (id)objc_claimAutoreleasedReturnValue([a3 element]);
  if (obj && !-[NSMutableArray containsObject:](self->_foundElements, "containsObject:", obj))
  {
    if (self->_remainingCount)
    {
      foundElements = self->_foundElements;
      if (self->_direction == 2) {
        -[NSMutableArray insertObject:atIndex:](foundElements, "insertObject:atIndex:", obj, 0LL);
      }
      else {
        -[NSMutableArray addObject:](foundElements, "addObject:", obj);
      }
      --self->_remainingCount;
      objc_storeStrong((id *)&self->_currentElement, obj);
    }

    -[_VOTElementExplorer _proceed](self, "_proceed");
  }

  else
  {
    -[_VOTElementExplorer _wrapup](self, "_wrapup");
  }
}

- (void).cxx_destruct
{
}

  ;
}

@end
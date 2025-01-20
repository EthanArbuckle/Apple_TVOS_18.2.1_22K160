@interface VOTNameSearcherElementSource
- (VOTElement)baseElement;
- (VOTElementFetcher)elementFetcher;
- (VOTNameSearcherElementSource)initWithElement:(id)a3;
- (VOTNameSearcherItemSourceDelegate)delegate;
- (double)selectSpeechDelay;
- (id)messageForMatchingItemsCount:(int64_t)a3;
- (id)messageForNoMatchingItems;
- (id)messageForSelectingItem:(id)a3;
- (void)elementsRetrieved:(id)a3 finished:(BOOL)a4;
- (void)retrieveAllEntries:(id)a3;
- (void)setBaseElement:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setElementFetcher:(id)a3;
@end

@implementation VOTNameSearcherElementSource

- (VOTNameSearcherElementSource)initWithElement:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___VOTNameSearcherElementSource;
  v5 = -[VOTNameSearcherElementSource init](&v11, "init");
  v6 = v5;
  if (v5)
  {
    -[VOTNameSearcherElementSource setBaseElement:](v5, "setBaseElement:", v4);
    v7 = objc_opt_new(&OBJC_CLASS___VOTElementFetcher);
    -[VOTNameSearcherElementSource setElementFetcher:](v6, "setElementFetcher:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTNameSearcherElementSource elementFetcher](v6, "elementFetcher"));
    [v8 setDelegate:v6];

    v9 = v6;
  }

  return v6;
}

- (void)retrieveAllEntries:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[VOTNameSearcherElementSource elementFetcher](self, "elementFetcher"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace currentElement]);
  objc_msgSend( v5,  "retrieveElementsWithElement:groupNavigationStyle:",  v4,  objc_msgSend((id)VOTSharedWorkspace, "navigationStyleHonorsGroups"));
}

- (id)messageForMatchingItemsCount:(int64_t)a3
{
  id v4 = sub_10004A988(off_1001AC148, @"handwrite.num.matching.items.count", 0LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v5, a3));

  return v6;
}

- (id)messageForNoMatchingItems
{
  return sub_10004A988(off_1001AC148, @"handwrite.no.items", 0LL);
}

- (id)messageForSelectingItem:(id)a3
{
  v3 = off_1001AC148;
  id v4 = a3;
  id v5 = sub_10004A988(v3, @"handwrite.choose.item", 0LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v6, v4));

  return v7;
}

- (void)elementsRetrieved:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = v6;
  if (v4 && (unint64_t)[v6 count] <= 0x3E8)
  {
    id v8 = sub_10004CBA4(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v9 count]);
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        v15 = 0LL;
        do
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)v15);
          v17 = objc_alloc(&OBJC_CLASS___VOTNameSearcherElementEntry);
          v18 = -[VOTNameSearcherElementEntry initWithElement:](v17, "initWithElement:", v16, (void)v20);
          -[NSMutableArray addObject:](v10, "addObject:", v18);

          v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }

      while (v13);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[VOTNameSearcherElementSource delegate](self, "delegate"));
    [v19 didRetrieveAllEntries:v10];
  }
}

- (double)selectSpeechDelay
{
  return 0.0;
}

- (VOTElement)baseElement
{
  return self->_baseElement;
}

- (void)setBaseElement:(id)a3
{
}

- (VOTElementFetcher)elementFetcher
{
  return self->_elementFetcher;
}

- (void)setElementFetcher:(id)a3
{
}

- (VOTNameSearcherItemSourceDelegate)delegate
{
  return (VOTNameSearcherItemSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
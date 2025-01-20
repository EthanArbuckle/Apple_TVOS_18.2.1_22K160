@interface VOTNameSearcher
- (BOOL)itemsLoaded;
- (BOOL)searchPending;
- (NSArray)allEntries;
- (NSArray)filteredEntries;
- (VOTNameSearcher)initWithDelegate:(id)a3 itemSource:(id)a4 filter:(id)a5;
- (VOTNameSearcherDelegate)delegate;
- (VOTNameSearcherEntry)focusedEntry;
- (VOTNameSearcherFilter)filter;
- (VOTNameSearcherItemSource)itemSource;
- (void)_focusOnItemAtIndexInFilteredItems:(int64_t)a3;
- (void)_updateFilteredItemsWithSearchText;
- (void)didRetrieveAllEntries:(id)a3;
- (void)focusOnFirstMatchingItem;
- (void)focusOnLastMatchingItem;
- (void)focusOnNextMatchingItem;
- (void)focusOnPreviousMatchingItem;
- (void)selectFocusedItem;
- (void)setAllEntries:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFilter:(id)a3;
- (void)setFilteredEntries:(id)a3;
- (void)setFocusedEntry:(id)a3;
- (void)setItemSource:(id)a3;
- (void)setSearchPending:(BOOL)a3;
- (void)updateMatchingItems;
@end

@implementation VOTNameSearcher

- (VOTNameSearcher)initWithDelegate:(id)a3 itemSource:(id)a4 filter:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___VOTNameSearcher;
  v11 = -[VOTNameSearcher init](&v16, "init");
  v12 = v11;
  if (v11)
  {
    -[VOTNameSearcher setDelegate:](v11, "setDelegate:", v8);
    -[VOTNameSearcher setItemSource:](v12, "setItemSource:", v9);
    -[VOTNameSearcher setFilter:](v12, "setFilter:", v10);
    -[VOTNameSearcher setSearchPending:](v12, "setSearchPending:", 0LL);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[VOTNameSearcher itemSource](v12, "itemSource"));
    [v13 retrieveAllEntries:v12];

    v14 = v12;
  }

  return v12;
}

- (void)setFocusedEntry:(id)a3
{
  id v6 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[VOTNameSearcher focusedEntry](self, "focusedEntry"));

  if (v5 != v6)
  {
    objc_storeStrong((id *)&self->_focusedEntry, a3);
    if (v6) {
      [v6 focus];
    }
  }
}

- (BOOL)itemsLoaded
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTNameSearcher filteredEntries](self, "filteredEntries"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (void)updateMatchingItems
{
  if (-[VOTNameSearcher itemsLoaded](self, "itemsLoaded")) {
    -[VOTNameSearcher _updateFilteredItemsWithSearchText](self, "_updateFilteredItemsWithSearchText");
  }
  else {
    -[VOTNameSearcher setSearchPending:](self, "setSearchPending:", 1LL);
  }
}

- (void)focusOnPreviousMatchingItem
{
  if (-[VOTNameSearcher itemsLoaded](self, "itemsLoaded"))
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTNameSearcher filteredEntries](self, "filteredEntries"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTNameSearcher focusedEntry](self, "focusedEntry"));
    id v5 = (char *)[v3 indexOfObject:v4];

    unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    if (v5 != (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v7 = (unint64_t)(v5 + 1);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTNameSearcher filteredEntries](self, "filteredEntries"));
      unint64_t v6 = v7 % (unint64_t)[v8 count];
    }

    -[VOTNameSearcher _focusOnItemAtIndexInFilteredItems:](self, "_focusOnItemAtIndexInFilteredItems:", v6);
  }

- (void)focusOnNextMatchingItem
{
  if (-[VOTNameSearcher itemsLoaded](self, "itemsLoaded"))
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTNameSearcher filteredEntries](self, "filteredEntries"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTNameSearcher focusedEntry](self, "focusedEntry"));
    id v5 = (char *)[v3 indexOfObject:v4];

    if (v5)
    {
    }

    else
    {
      unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTNameSearcher filteredEntries](self, "filteredEntries"));
      id v5 = (char *)[v6 count] - 1;
    }

    -[VOTNameSearcher _focusOnItemAtIndexInFilteredItems:](self, "_focusOnItemAtIndexInFilteredItems:", v5);
  }

- (void)focusOnFirstMatchingItem
{
  if (-[VOTNameSearcher itemsLoaded](self, "itemsLoaded")) {
    -[VOTNameSearcher _focusOnItemAtIndexInFilteredItems:](self, "_focusOnItemAtIndexInFilteredItems:", 0LL);
  }
}

- (void)focusOnLastMatchingItem
{
  if (-[VOTNameSearcher itemsLoaded](self, "itemsLoaded"))
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue(-[VOTNameSearcher filteredEntries](self, "filteredEntries"));
    -[VOTNameSearcher _focusOnItemAtIndexInFilteredItems:]( self,  "_focusOnItemAtIndexInFilteredItems:",  (char *)[v3 count] - 1);
  }

- (void)selectFocusedItem
{
  if (-[VOTNameSearcher itemsLoaded](self, "itemsLoaded"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTNameSearcher focusedEntry](self, "focusedEntry"));

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTNameSearcher focusedEntry](self, "focusedEntry"));
      [v4 select];
    }

    id v8 = (id)objc_claimAutoreleasedReturnValue(-[VOTNameSearcher delegate](self, "delegate"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTNameSearcher itemSource](self, "itemSource"));
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTNameSearcher focusedEntry](self, "focusedEntry"));
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
    [v8 itemSource:v5 didSelect:v7];
  }

- (void)didRetrieveAllEntries:(id)a3
{
  id v4 = a3;
  -[VOTNameSearcher setAllEntries:](self, "setAllEntries:", v4);
  -[VOTNameSearcher setFilteredEntries:](self, "setFilteredEntries:", v4);

  if (-[VOTNameSearcher searchPending](self, "searchPending"))
  {
    -[VOTNameSearcher updateMatchingItems](self, "updateMatchingItems");
    -[VOTNameSearcher setSearchPending:](self, "setSearchPending:", 0LL);
  }

- (void)_updateFilteredItemsWithSearchText
{
  id v21 = (id)objc_claimAutoreleasedReturnValue(-[VOTNameSearcher filteredEntries](self, "filteredEntries"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTNameSearcher focusedEntry](self, "focusedEntry"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTNameSearcher filter](self, "filter"));
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTNameSearcher allEntries](self, "allEntries"));
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 nameSearcherEntriesPassingSearchFrom:v6]);
  -[VOTNameSearcher setFilteredEntries:](self, "setFilteredEntries:", v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTNameSearcher filteredEntries](self, "filteredEntries"));
  id v9 = [v8 count];

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTNameSearcher filteredEntries](self, "filteredEntries"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);
    -[VOTNameSearcher setFocusedEntry:](self, "setFocusedEntry:", v11);
  }

  else
  {
    -[VOTNameSearcher setFocusedEntry:](self, "setFocusedEntry:", 0LL);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTNameSearcher filteredEntries](self, "filteredEntries"));
  unsigned __int8 v13 = [v21 isEqualToArray:v12];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[VOTNameSearcher focusedEntry](self, "focusedEntry"));
  unsigned int v15 = [v4 isEqual:v14];

  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(-[VOTNameSearcher delegate](self, "delegate"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[VOTNameSearcher itemSource](self, "itemSource"));
  if ((v13 & 1) != 0)
  {
    v18 = 0LL;
    if (!v15) {
      goto LABEL_6;
    }
  }

  else
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTNameSearcher filteredEntries](self, "filteredEntries"));
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v2 count]));
    if (!v15)
    {
LABEL_6:
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[VOTNameSearcher focusedEntry](self, "focusedEntry"));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 name]);
      [v16 itemSource:v17 didFilter:v18 didSwitchFocus:v20];

      if ((v13 & 1) != 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }

  [v16 itemSource:v17 didFilter:v18 didSwitchFocus:0];
  if ((v13 & 1) == 0)
  {
LABEL_10:
  }

- (void)_focusOnItemAtIndexInFilteredItems:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTNameSearcher filteredEntries](self, "filteredEntries"));
  unint64_t v6 = v5;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (![v5 count])
    {
      -[VOTNameSearcher setFocusedEntry:](self, "setFocusedEntry:", 0LL);
      goto LABEL_7;
    }

    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTNameSearcher filteredEntries](self, "filteredEntries"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);
    -[VOTNameSearcher setFocusedEntry:](self, "setFocusedEntry:", v8);
  }

  else
  {
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:a3]);
    -[VOTNameSearcher setFocusedEntry:](self, "setFocusedEntry:", v7);
  }

LABEL_7:
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[VOTNameSearcher delegate](self, "delegate"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTNameSearcher itemSource](self, "itemSource"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTNameSearcher focusedEntry](self, "focusedEntry"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
  [v12 itemSource:v9 didFilter:0 didSwitchFocus:v11];
}

- (VOTNameSearcherDelegate)delegate
{
  return (VOTNameSearcherDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (VOTNameSearcherItemSource)itemSource
{
  return self->_itemSource;
}

- (void)setItemSource:(id)a3
{
}

- (VOTNameSearcherFilter)filter
{
  return (VOTNameSearcherFilter *)objc_loadWeakRetained((id *)&self->_filter);
}

- (void)setFilter:(id)a3
{
}

- (NSArray)allEntries
{
  return self->_allEntries;
}

- (void)setAllEntries:(id)a3
{
}

- (NSArray)filteredEntries
{
  return self->_filteredEntries;
}

- (void)setFilteredEntries:(id)a3
{
}

- (VOTNameSearcherEntry)focusedEntry
{
  return self->_focusedEntry;
}

- (BOOL)searchPending
{
  return self->_searchPending;
}

- (void)setSearchPending:(BOOL)a3
{
  self->_searchPending = a3;
}

- (void).cxx_destruct
{
}

@end
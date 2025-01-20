@interface PBOverlayLayoutElementMap
- (BOOL)_lock_removeFixedElementForIdentifier:(id)a3;
- (CGRect)bounds;
- (NSMutableArray)fixedElements;
- (NSMutableArray)flexibleElements;
- (NSMutableSet)fixedElementIdentifiers;
- (NSMutableSet)flexibleElementIdentifiers;
- (NSMutableSet)hiddenElementIdentifiers;
- (PBOverlayLayoutElementMap)initWithBounds:(CGRect)a3;
- (PBOverlayLayoutRectMap)fixedRectMap;
- (PBOverlayLayoutRectMapSnapshot)baseSnapshot;
- (PBOverlayLayoutRectMapSnapshot)currentStateSnapshot;
- (id)_lock_addFixedElement:(id)a3;
- (id)_lock_addFlexibleElement:(id)a3;
- (id)_lock_flexibleElementChangeSetForUpdatedIndexSet:(id)a3;
- (id)_lock_removeElementFilter;
- (id)_lock_removeElementWithIdentifier:(id)a3;
- (id)_lock_removeElementsPassingTest:(id)a3;
- (id)_lock_removeLayoutElementsWithIdentifiers:(id)a3 addLayoutElements:(id)a4;
- (id)_lock_repositionFlexibleElementsFromIndex:(unint64_t)a3;
- (id)_lock_setElementFilter:(id)a3;
- (id)_lock_updateElementFilter:(id)a3;
- (id)elementFilter;
- (id)removeLayoutElementsPassingTest:(id)a3;
- (id)removeLayoutElementsWithIdentifiers:(id)a3 addLayoutElements:(id)a4;
- (id)setBaseSnapshot:(id)a3;
- (id)setElementFilter:(id)a3;
- (id)stateDumpBuilder;
- (os_unfair_lock_s)lock;
- (unint64_t)_lock_removeFlexibleElementForIdentifier:(id)a3;
- (unint64_t)count;
@end

@implementation PBOverlayLayoutElementMap

- (PBOverlayLayoutElementMap)initWithBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___PBOverlayLayoutElementMap;
  v7 = -[PBOverlayLayoutElementMap init](&v24, "init");
  v8 = v7;
  if (v7)
  {
    v7->_lock._os_unfair_lock_opaque = 0;
    v9 = -[PBOverlayLayoutRectMap initWithBounds:]( objc_alloc(&OBJC_CLASS___PBOverlayLayoutRectMap),  "initWithBounds:",  x,  y,  width,  height);
    fixedRectMap = v8->_fixedRectMap;
    v8->_fixedRectMap = v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue(-[PBOverlayLayoutRectMap captureSnapshot](v8->_fixedRectMap, "captureSnapshot"));
    currentStateSnapshot = v8->_currentStateSnapshot;
    v8->_currentStateSnapshot = (PBOverlayLayoutRectMapSnapshot *)v11;

    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    fixedElementIdentifiers = v8->_fixedElementIdentifiers;
    v8->_fixedElementIdentifiers = v13;

    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    flexibleElementIdentifiers = v8->_flexibleElementIdentifiers;
    v8->_flexibleElementIdentifiers = v15;

    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    fixedElements = v8->_fixedElements;
    v8->_fixedElements = v17;

    v19 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    flexibleElements = v8->_flexibleElements;
    v8->_flexibleElements = v19;

    v21 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    lock_hiddenElementIdentifiers = v8->_lock_hiddenElementIdentifiers;
    v8->_lock_hiddenElementIdentifiers = v21;
  }

  return v8;
}

- (CGRect)bounds
{
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (unint64_t)count
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = -[NSMutableArray count](self->_fixedElements, "count");
  id v5 = -[NSMutableArray count](self->_flexibleElements, "count");
  os_unfair_lock_unlock(p_lock);
  return (unint64_t)v4 + (void)v5;
}

- (PBOverlayLayoutRectMapSnapshot)baseSnapshot
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_lock_baseSnapshot;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)setBaseSnapshot:(id)a3
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[PBOverlayLayoutElementChangeSet emptyChangeSet]( &OBJC_CLASS___PBOverlayLayoutElementChangeSet,  "emptyChangeSet"));
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!-[PBOverlayLayoutRectMapSnapshot isEqual:](self->_lock_baseSnapshot, "isEqual:", v5))
  {
    objc_storeStrong((id *)&self->_lock_baseSnapshot, a3);
    -[PBOverlayLayoutRectMap setBaseSnapshot:](self->_fixedRectMap, "setBaseSnapshot:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutElementMap _lock_repositionFlexibleElementsFromIndex:]( self,  "_lock_repositionFlexibleElementsFromIndex:",  0LL));
    uint64_t v9 = objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutElementMap _lock_flexibleElementChangeSetForUpdatedIndexSet:]( self,  "_lock_flexibleElementChangeSetForUpdatedIndexSet:",  v8));

    v6 = (void *)v9;
  }

  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (id)elementFilter
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = objc_retainBlock(self->_lock_elementFilter);
  os_unfair_lock_unlock(p_lock);
  id v5 = objc_retainBlock(v4);

  return v5;
}

- (id)setElementFilter:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBOverlayLayoutElementMap _lock_setElementFilter:](self, "_lock_setElementFilter:", v5));

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)removeLayoutElementsWithIdentifiers:(id)a3 addLayoutElements:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count] || objc_msgSend(v7, "count"))
  {
    if ([v7 count]) {
      v8 = -[NSArray initWithArray:copyItems:](objc_alloc(&OBJC_CLASS___NSArray), "initWithArray:copyItems:", v7, 1LL);
    }
    else {
      v8 = (NSArray *)v7;
    }
    uint64_t v9 = v8;
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutElementMap _lock_removeLayoutElementsWithIdentifiers:addLayoutElements:]( self,  "_lock_removeLayoutElementsWithIdentifiers:addLayoutElements:",  v6,  v9));
    os_unfair_lock_unlock(p_lock);
  }

  else
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[PBOverlayLayoutElementChangeSet emptyChangeSet]( &OBJC_CLASS___PBOverlayLayoutElementChangeSet,  "emptyChangeSet"));
  }

  return v11;
}

- (id)removeLayoutElementsPassingTest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutElementMap _lock_removeElementsPassingTest:]( self,  "_lock_removeElementsPassingTest:",  v4));
    os_unfair_lock_unlock(p_lock);
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[PBOverlayLayoutElementChangeSet emptyChangeSet]( &OBJC_CLASS___PBOverlayLayoutElementChangeSet,  "emptyChangeSet"));
  }

  return v6;
}

- (id)stateDumpBuilder
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  id v4 = objc_alloc_init(&OBJC_CLASS___TVSStateDumpBuilder);
  os_unfair_lock_lock(p_lock);
  id v5 = [v4 appendArray:self->_fixedElements withKey:@"fixedElements" skipIfEmpty:1];
  id v6 = [v4 appendArray:self->_flexibleElements withKey:@"flexibleElements" skipIfEmpty:1];
  id v7 = [v4 appendObject:self->_fixedRectMap withKey:@"fixedRectMap"];
  id v8 = [v4 appendPointer:self->_lock_elementFilter withKey:@"elementFilter"];
  id v9 =  [v4 appendCollection:self->_lock_hiddenElementIdentifiers withKey:@"hiddenElementIdentifiers" skipIfEmpty:1 objectTransformer:&stru_1003D7F60];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)_lock_removeLayoutElementsWithIdentifiers:(id)a3 addLayoutElements:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  unint64_t v8 = (unint64_t)[v6 count];
  unint64_t v9 = (unint64_t)[v7 count];
  if (!(v8 | v9))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[PBOverlayLayoutElementChangeSet emptyChangeSet]( &OBJC_CLASS___PBOverlayLayoutElementChangeSet,  "emptyChangeSet"));
    goto LABEL_59;
  }

  if (v8 == 1 && !v9)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 lastObject]);
    uint64_t v12 = objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutElementMap _lock_removeElementWithIdentifier:]( self,  "_lock_removeElementWithIdentifier:",  v11));
LABEL_47:
    v10 = (void *)v12;

    goto LABEL_59;
  }

  if (!v8 && v9 == 1)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 lastObject]);
    else {
      uint64_t v12 = objc_claimAutoreleasedReturnValue(-[PBOverlayLayoutElementMap _lock_addFlexibleElement:](self, "_lock_addFlexibleElement:", v11));
    }
    goto LABEL_47;
  }

  id v54 = v7;
  id v13 = v7;
  id v55 = v6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v6));
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  id v15 = v13;
  id v16 = [v15 countByEnumeratingWithState:&v70 objects:v76 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v71;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v71 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v70 + 1) + 8 * (void)i) identifier]);
        [v14 addObject:v20];
      }

      id v17 = [v15 countByEnumeratingWithState:&v70 objects:v76 count:16];
    }

    while (v17);
  }

  fixedElements = self->_fixedElements;
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472LL;
  v68[2] = sub_100113BFC;
  v68[3] = &unk_1003D7F88;
  id v22 = v14;
  id v69 = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray indexesOfObjectsPassingTest:](fixedElements, "indexesOfObjectsPassingTest:", v68));
  flexibleElements = self->_flexibleElements;
  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472LL;
  v66[2] = sub_100113C40;
  v66[3] = &unk_1003D7F88;
  id v25 = v22;
  id v67 = v25;
  uint64_t v26 = objc_claimAutoreleasedReturnValue(-[NSMutableArray indexesOfObjectsPassingTest:](flexibleElements, "indexesOfObjectsPassingTest:", v66));
  -[NSMutableSet minusSet:](self->_fixedElementIdentifiers, "minusSet:", v25);
  -[NSMutableSet minusSet:](self->_flexibleElementIdentifiers, "minusSet:", v25);
  -[NSMutableArray removeObjectsAtIndexes:](self->_fixedElements, "removeObjectsAtIndexes:", v23);
  v51 = (void *)v26;
  -[NSMutableArray removeObjectsAtIndexes:](self->_flexibleElements, "removeObjectsAtIndexes:", v26);
  v53 = v23;
  if ([v23 count])
  {
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    id v27 = v25;
    id v28 = [v27 countByEnumeratingWithState:&v62 objects:v75 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v63;
      do
      {
        for (j = 0LL; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v63 != v30) {
            objc_enumerationMutation(v27);
          }
          -[PBOverlayLayoutRectMap removeRectForKey:]( self->_fixedRectMap,  "removeRectForKey:",  *(void *)(*((void *)&v62 + 1) + 8LL * (void)j));
        }

        id v29 = [v27 countByEnumeratingWithState:&v62 objects:v75 count:16];
      }

      while (v29);
    }
  }

  v52 = v25;
  v32 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  id obj = v15;
  id v33 = [obj countByEnumeratingWithState:&v58 objects:v74 count:16];
  if (v33)
  {
    id v34 = v33;
    char v56 = 0;
    uint64_t v35 = *(void *)v59;
    do
    {
      for (k = 0LL; k != v34; k = (char *)k + 1)
      {
        if (*(void *)v59 != v35) {
          objc_enumerationMutation(obj);
        }
        v37 = *(void **)(*((void *)&v58 + 1) + 8LL * (void)k);
        v38 = (void *)objc_claimAutoreleasedReturnValue([v37 identifier]);
        id v39 = self->_lock_elementFilter;
        if (v39
          && (v40 = v39, int v41 = (*((uint64_t (**)(id, void *))v39 + 2))(v39, v37), v40, !v41))
        {
          -[NSMutableSet addObject:](self->_lock_hiddenElementIdentifiers, "addObject:", v38);
        }

        else
        {
          -[NSMutableSet removeObject:](self->_lock_hiddenElementIdentifiers, "removeObject:", v38);
          int v41 = 1;
        }

        if ([v37 isFixed])
        {
          -[NSMutableSet addObject:](self->_fixedElementIdentifiers, "addObject:", v38);
          -[NSMutableArray addObject:](self->_fixedElements, "addObject:", v37);
          if (v41)
          {
            fixedRectMap = self->_fixedRectMap;
            [v37 paddedFrame];
            -[PBOverlayLayoutRectMap addRect:forKey:](fixedRectMap, "addRect:forKey:", v38);
            char v56 = 1;
          }
        }

        else
        {
          id v43 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:]( self->_flexibleElements,  "indexOfObject:inSortedRange:options:usingComparator:",  v37,  0LL,  -[NSMutableArray count](self->_flexibleElements, "count"),  1536LL,  &stru_1003DA2B0);
          -[NSMutableArray insertObject:atIndex:](self->_flexibleElements, "insertObject:atIndex:", v37, v43);
          -[NSMutableSet addObject:](self->_flexibleElementIdentifiers, "addObject:", v38);
          if (-[NSMutableIndexSet count](v32, "count") && v43 < -[NSMutableIndexSet firstIndex](v32, "firstIndex")) {
            -[NSMutableIndexSet shiftIndexesStartingAtIndex:by:](v32, "shiftIndexesStartingAtIndex:by:", v43, 1LL);
          }
          if ((v41 & 1) == 0) {
            -[NSMutableIndexSet addIndex:](v32, "addIndex:", v43);
          }
        }
      }

      id v34 = [obj countByEnumeratingWithState:&v58 objects:v74 count:16];
    }

    while (v34);
  }

  else
  {
    char v56 = 0;
  }

  id v44 = [v53 count];
  id v45 = 0LL;
  if (v44)
  {
    v46 = v51;
  }

  else
  {
    v46 = v51;
    if ((v56 & 1) == 0)
    {
      if (objc_msgSend(v51, "firstIndex", 0) == (id)0x7FFFFFFFFFFFFFFFLL
        && -[NSMutableIndexSet firstIndex](v32, "firstIndex") == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        id v45 = 0LL;
      }

      else
      {
        id v47 = [v51 firstIndex];
        id v48 = -[NSMutableIndexSet firstIndex](v32, "firstIndex");
        if (v47 >= v48) {
          id v45 = v48;
        }
        else {
          id v45 = v47;
        }
      }
    }
  }

  v49 = (void *)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutElementMap _lock_repositionFlexibleElementsFromIndex:]( self,  "_lock_repositionFlexibleElementsFromIndex:",  v45));
  v10 = (void *)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutElementMap _lock_flexibleElementChangeSetForUpdatedIndexSet:]( self,  "_lock_flexibleElementChangeSetForUpdatedIndexSet:",  v49));

  id v7 = v54;
  id v6 = v55;
LABEL_59:

  return v10;
}

- (id)_lock_addFixedElement:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  -[PBOverlayLayoutElementMap _lock_removeFlexibleElementForIdentifier:]( self,  "_lock_removeFlexibleElementForIdentifier:",  v5);
  if (-[NSMutableSet containsObject:](self->_fixedElementIdentifiers, "containsObject:", v5))
  {
    fixedElements = self->_fixedElements;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100113E1C;
    v16[3] = &unk_1003D7F88;
    id v17 = v5;
    id v7 = -[NSMutableArray indexOfObjectPassingTest:](fixedElements, "indexOfObjectPassingTest:", v16);
    unint64_t v8 = self->_fixedElements;
    if (v7 == (id)0x7FFFFFFFFFFFFFFFLL) {
      -[NSMutableArray addObject:](v8, "addObject:", v4);
    }
    else {
      -[NSMutableArray replaceObjectAtIndex:withObject:](v8, "replaceObjectAtIndex:withObject:", v7, v4);
    }
  }

  else
  {
    -[NSMutableSet addObject:](self->_fixedElementIdentifiers, "addObject:", v5);
    -[NSMutableArray addObject:](self->_fixedElements, "addObject:", v4);
  }

  id v9 = self->_lock_elementFilter;
  if (v9 && (v10 = v9, int v11 = (*((uint64_t (**)(id, id))v9 + 2))(v9, v4), v10, !v11))
  {
    -[NSMutableSet addObject:](self->_lock_hiddenElementIdentifiers, "addObject:", v5);
  }

  else
  {
    -[NSMutableSet removeObject:](self->_lock_hiddenElementIdentifiers, "removeObject:", v5);
    fixedRectMap = self->_fixedRectMap;
    [v4 paddedFrame];
    -[PBOverlayLayoutRectMap addRect:forKey:](fixedRectMap, "addRect:forKey:", v5);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutElementMap _lock_repositionFlexibleElementsFromIndex:]( self,  "_lock_repositionFlexibleElementsFromIndex:",  0LL));
  v14 = (void *)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutElementMap _lock_flexibleElementChangeSetForUpdatedIndexSet:]( self,  "_lock_flexibleElementChangeSetForUpdatedIndexSet:",  v13));

  return v14;
}

- (id)_lock_addFlexibleElement:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  unsigned int v6 = -[PBOverlayLayoutElementMap _lock_removeFixedElementForIdentifier:]( self,  "_lock_removeFixedElementForIdentifier:",  v5);
  unint64_t v7 = -[PBOverlayLayoutElementMap _lock_removeFlexibleElementForIdentifier:]( self,  "_lock_removeFlexibleElementForIdentifier:",  v5);
  id v8 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:]( self->_flexibleElements,  "indexOfObject:inSortedRange:options:usingComparator:",  v4,  0LL,  -[NSMutableArray count](self->_flexibleElements, "count"),  1536LL,  &stru_1003DA2B0);
  -[NSMutableArray insertObject:atIndex:](self->_flexibleElements, "insertObject:atIndex:", v4, v8);
  -[NSMutableSet addObject:](self->_flexibleElementIdentifiers, "addObject:", v5);
  id v9 = self->_lock_elementFilter;
  else {
    -[NSMutableSet removeObject:](self->_lock_hiddenElementIdentifiers, "removeObject:", v5);
  }
  else {
    unint64_t v12 = (unint64_t)v8;
  }
  if (v6) {
    id v13 = 0LL;
  }
  else {
    id v13 = (id)v12;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutElementMap _lock_repositionFlexibleElementsFromIndex:]( self,  "_lock_repositionFlexibleElementsFromIndex:",  v13));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutElementMap _lock_flexibleElementChangeSetForUpdatedIndexSet:]( self,  "_lock_flexibleElementChangeSetForUpdatedIndexSet:",  v14));

  return v15;
}

- (id)_lock_removeElementWithIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSet](&OBJC_CLASS___NSIndexSet, "indexSet"));
  if (-[NSMutableSet containsObject:](self->_fixedElementIdentifiers, "containsObject:", v4))
  {
    -[PBOverlayLayoutElementMap _lock_removeFixedElementForIdentifier:]( self,  "_lock_removeFixedElementForIdentifier:",  v4);
    unsigned int v6 = self;
    unint64_t v7 = 0LL;
LABEL_5:
    id v8 = v5;
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutElementMap _lock_repositionFlexibleElementsFromIndex:]( v6,  "_lock_repositionFlexibleElementsFromIndex:",  v7));
    goto LABEL_8;
  }

  if (-[NSMutableSet containsObject:](self->_flexibleElementIdentifiers, "containsObject:", v4))
  {
    unint64_t v7 = -[PBOverlayLayoutElementMap _lock_removeFlexibleElementForIdentifier:]( self,  "_lock_removeFlexibleElementForIdentifier:",  v4);
    unsigned int v6 = self;
    goto LABEL_5;
  }

  id v9 = sub_10008321C();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_1002828E4((uint64_t)self, (uint64_t)v4, v8);
  }
LABEL_8:

  v10 = (void *)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutElementMap _lock_flexibleElementChangeSetForUpdatedIndexSet:]( self,  "_lock_flexibleElementChangeSetForUpdatedIndexSet:",  v5));
  return v10;
}

- (id)_lock_removeElementsPassingTest:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  id v5 = -[NSMutableSet initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableSet),  "initWithCapacity:",  -[NSMutableSet count](self->_fixedElementIdentifiers, "count"));
  fixedElements = self->_fixedElements;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100114384;
  v31[3] = &unk_1003D7FB0;
  id v7 = v4;
  id v33 = v7;
  id v8 = v5;
  v32 = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray indexesOfObjectsPassingTest:](fixedElements, "indexesOfObjectsPassingTest:", v31));
  v10 = -[NSMutableSet initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableSet),  "initWithCapacity:",  -[NSMutableSet count](self->_flexibleElementIdentifiers, "count"));
  flexibleElements = self->_flexibleElements;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_1001143F4;
  v28[3] = &unk_1003D7FB0;
  id v12 = v7;
  id v30 = v12;
  id v13 = v10;
  id v29 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray indexesOfObjectsPassingTest:](flexibleElements, "indexesOfObjectsPassingTest:", v28));
  -[NSMutableSet minusSet:](self->_fixedElementIdentifiers, "minusSet:", v8);
  -[NSMutableArray removeObjectsAtIndexes:](self->_fixedElements, "removeObjectsAtIndexes:", v9);
  -[NSMutableSet minusSet:](self->_flexibleElementIdentifiers, "minusSet:", v13);
  -[NSMutableArray removeObjectsAtIndexes:](self->_flexibleElements, "removeObjectsAtIndexes:", v14);
  -[NSMutableSet minusSet:](self->_lock_hiddenElementIdentifiers, "minusSet:", v8);
  -[NSMutableSet minusSet:](self->_lock_hiddenElementIdentifiers, "minusSet:", v13);
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v15 = v8;
  id v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v24,  v34,  16LL);
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v15);
        }
        -[PBOverlayLayoutRectMap removeRectForKey:]( self->_fixedRectMap,  "removeRectForKey:",  *(void *)(*((void *)&v24 + 1) + 8LL * (void)i),  (void)v24);
      }

      id v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v24,  v34,  16LL);
    }

    while (v17);
  }

  if ([v9 count] || objc_msgSend(v14, "firstIndex") == (id)0x7FFFFFFFFFFFFFFFLL) {
    id v20 = 0LL;
  }
  else {
    id v20 = [v14 firstIndex];
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutElementMap _lock_repositionFlexibleElementsFromIndex:]( self,  "_lock_repositionFlexibleElementsFromIndex:",  v20,  (void)v24));
  id v22 = (void *)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutElementMap _lock_flexibleElementChangeSetForUpdatedIndexSet:]( self,  "_lock_flexibleElementChangeSetForUpdatedIndexSet:",  v21));

  return v22;
}

- (BOOL)_lock_removeFixedElementForIdentifier:(id)a3
{
  lock_hiddenElementIdentifiers = self->_lock_hiddenElementIdentifiers;
  id v5 = a3;
  -[NSMutableSet removeObject:](lock_hiddenElementIdentifiers, "removeObject:", v5);
  uint64_t v6 = sub_1001144D0(self->_fixedElementIdentifiers, self->_fixedElements, v5);
  -[PBOverlayLayoutRectMap removeRectForKey:](self->_fixedRectMap, "removeRectForKey:", v5);

  return v6 != 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)_lock_removeFlexibleElementForIdentifier:(id)a3
{
  lock_hiddenElementIdentifiers = self->_lock_hiddenElementIdentifiers;
  id v5 = a3;
  -[NSMutableSet removeObject:](lock_hiddenElementIdentifiers, "removeObject:", v5);
  unint64_t v6 = sub_1001144D0(self->_flexibleElementIdentifiers, self->_flexibleElements, v5);

  return v6;
}

- (id)_lock_repositionFlexibleElementsFromIndex:(unint64_t)a3
{
  if (-[NSMutableArray count](self->_flexibleElements, "count"))
  {
    else {
      unint64_t v5 = a3;
    }
    unint64_t v6 = -[PBOverlayLayoutRectMap initWithMap:]( objc_alloc(&OBJC_CLASS___PBOverlayLayoutRectMap),  "initWithMap:",  self->_fixedRectMap);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexSet indexSetWithIndexesInRange:]( &OBJC_CLASS___NSIndexSet,  "indexSetWithIndexesInRange:",  0LL,  v5));
    flexibleElements = self->_flexibleElements;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_100114898;
    v27[3] = &unk_1003D7FD8;
    v27[4] = self;
    id v9 = v6;
    id v28 = v9;
    -[NSMutableArray enumerateObjectsAtIndexes:options:usingBlock:]( flexibleElements,  "enumerateObjectsAtIndexes:options:usingBlock:",  v7,  0LL,  v27);
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
    int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexSet indexSetWithIndexesInRange:]( &OBJC_CLASS___NSIndexSet,  "indexSetWithIndexesInRange:",  v5,  (char *)-[NSMutableArray count](self->_flexibleElements, "count") - v5));
    id v12 = self->_flexibleElements;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100114904;
    v24[3] = &unk_1003D8000;
    v24[4] = self;
    id v13 = v9;
    __int128 v25 = v13;
    v14 = v10;
    __int128 v26 = v14;
    -[NSMutableArray enumerateObjectsAtIndexes:options:usingBlock:]( v12,  "enumerateObjectsAtIndexes:options:usingBlock:",  v11,  0LL,  v24);
    id v15 = (PBOverlayLayoutRectMapSnapshot *)objc_claimAutoreleasedReturnValue(-[PBOverlayLayoutRectMap captureSnapshot](v13, "captureSnapshot"));
    currentStateSnapshot = self->_currentStateSnapshot;
    self->_currentStateSnapshot = v15;

    id v17 = sub_10008321C();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      id v30 = self;
      __int16 v31 = 2048;
      unint64_t v32 = a3;
      __int16 v33 = 2114;
      id v34 = v14;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "Finished layout {map=%p, fromIndex=%lu, updates=%{public}@}",  buf,  0x20u);
    }

    v19 = v26;
    id v20 = v14;
  }

  else
  {
    v21 = (PBOverlayLayoutRectMapSnapshot *)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutRectMap captureSnapshot]( self->_fixedRectMap,  "captureSnapshot"));
    id v22 = self->_currentStateSnapshot;
    self->_currentStateSnapshot = v21;

    id v20 = (NSMutableIndexSet *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSet](&OBJC_CLASS___NSIndexSet, "indexSet"));
  }

  return v20;
}

- (id)_lock_flexibleElementChangeSetForUpdatedIndexSet:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    os_unfair_lock_assert_owner(&self->_lock);
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectsAtIndexes:](self->_flexibleElements, "objectsAtIndexes:", v4));
    unint64_t v6 = -[PBOverlayLayoutElementChangeSet initWithUpdatedElements:]( objc_alloc(&OBJC_CLASS___PBOverlayLayoutElementChangeSet),  "initWithUpdatedElements:",  v5);
  }

  else
  {
    unint64_t v6 = (PBOverlayLayoutElementChangeSet *)objc_claimAutoreleasedReturnValue( +[PBOverlayLayoutElementChangeSet emptyChangeSet]( &OBJC_CLASS___PBOverlayLayoutElementChangeSet,  "emptyChangeSet"));
  }

  return v6;
}

- (id)_lock_setElementFilter:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_lock_elementFilter == v4)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[PBOverlayLayoutElementChangeSet emptyChangeSet]( &OBJC_CLASS___PBOverlayLayoutElementChangeSet,  "emptyChangeSet"));
  }

  else if (v4)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[PBOverlayLayoutElementMap _lock_updateElementFilter:](self, "_lock_updateElementFilter:", v4));
  }

  else
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[PBOverlayLayoutElementMap _lock_removeElementFilter](self, "_lock_removeElementFilter"));
  }

  unint64_t v6 = (void *)v5;

  return v6;
}

- (id)_lock_removeElementFilter
{
  id lock_elementFilter = self->_lock_elementFilter;
  self->_id lock_elementFilter = 0LL;

  id v4 = self->_lock_hiddenElementIdentifiers;
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  lock_hiddenElementIdentifiers = self->_lock_hiddenElementIdentifiers;
  self->_lock_hiddenElementIdentifiers = v5;

  if (-[NSMutableSet count](v4, "count"))
  {
    uint64_t v25 = 0LL;
    __int128 v26 = &v25;
    uint64_t v27 = 0x2020000000LL;
    char v28 = 0;
    fixedElements = self->_fixedElements;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100114D84;
    v21[3] = &unk_1003D8028;
    id v8 = v4;
    id v22 = v8;
    v23 = self;
    __int128 v24 = &v25;
    -[NSMutableArray enumerateObjectsUsingBlock:](fixedElements, "enumerateObjectsUsingBlock:", v21);
    flexibleElements = self->_flexibleElements;
    id v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472LL;
    uint64_t v18 = sub_100114E0C;
    v19 = &unk_1003D7F88;
    id v20 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray indexesOfObjectsPassingTest:]( flexibleElements,  "indexesOfObjectsPassingTest:",  &v16));
    int v11 = v10;
    if (*((_BYTE *)v26 + 24) || objc_msgSend(v10, "firstIndex", v16, v17, v18, v19) == (id)0x7FFFFFFFFFFFFFFFLL) {
      id v12 = 0LL;
    }
    else {
      id v12 = [v11 firstIndex];
    }
    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutElementMap _lock_repositionFlexibleElementsFromIndex:]( self,  "_lock_repositionFlexibleElementsFromIndex:",  v12,  v16,  v17,  v18,  v19));
    v14 = (void *)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutElementMap _lock_flexibleElementChangeSetForUpdatedIndexSet:]( self,  "_lock_flexibleElementChangeSetForUpdatedIndexSet:",  v13));

    _Block_object_dispose(&v25, 8);
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[PBOverlayLayoutElementChangeSet emptyChangeSet]( &OBJC_CLASS___PBOverlayLayoutElementChangeSet,  "emptyChangeSet"));
  }

  return v14;
}

- (id)_lock_updateElementFilter:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    unint64_t v6 = v5;
    id v7 = objc_retainBlock(v5);
    id lock_elementFilter = self->_lock_elementFilter;
    self->_id lock_elementFilter = v7;

    SEL v26 = a2;
    id v9 = self->_lock_hiddenElementIdentifiers;
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_100115118;
    v32[3] = &unk_1003D8050;
    int v11 = v9;
    __int16 v33 = v11;
    id v12 = v6;
    id v35 = v12;
    id v13 = v10;
    id v34 = v13;
    v14 = objc_retainBlock(v32);
    id v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray indexesOfObjectsPassingTest:]( self->_fixedElements,  "indexesOfObjectsPassingTest:",  v14));
    id v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray indexesOfObjectsPassingTest:]( self->_flexibleElements,  "indexesOfObjectsPassingTest:",  v14));
    objc_storeStrong((id *)&self->_lock_hiddenElementIdentifiers, v10);
    fixedElements = self->_fixedElements;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_1001151BC;
    v27[3] = &unk_1003D8078;
    uint64_t v18 = v11;
    char v28 = v18;
    v19 = v13;
    id v29 = v19;
    id v30 = self;
    SEL v31 = v26;
    -[NSMutableArray enumerateObjectsAtIndexes:options:usingBlock:]( fixedElements,  "enumerateObjectsAtIndexes:options:usingBlock:",  v15,  0LL,  v27);
    id v20 = [v15 count];
    id v21 = 0LL;
    if (!v20)
    {
      if (!objc_msgSend(v16, "count", 0))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue( +[PBOverlayLayoutElementChangeSet emptyChangeSet]( &OBJC_CLASS___PBOverlayLayoutElementChangeSet,  "emptyChangeSet"));
        goto LABEL_4;
      }

      if ([v16 firstIndex] == (id)0x7FFFFFFFFFFFFFFFLL) {
        id v21 = 0LL;
      }
      else {
        id v21 = [v16 firstIndex];
      }
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutElementMap _lock_repositionFlexibleElementsFromIndex:]( self,  "_lock_repositionFlexibleElementsFromIndex:",  v21));
    v23 = (void *)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutElementMap _lock_flexibleElementChangeSetForUpdatedIndexSet:]( self,  "_lock_flexibleElementChangeSetForUpdatedIndexSet:",  v22));

LABEL_4:
    return v23;
  }

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"elementFilter != ((void *)0)"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1002829AC(a2, (uint64_t)self);
  }
  id result = (id) _bs_set_crash_log_message([v25 UTF8String]);
  __break(0);
  return result;
}

- (NSMutableSet)hiddenElementIdentifiers
{
  return self->_lock_hiddenElementIdentifiers;
}

- (PBOverlayLayoutRectMapSnapshot)currentStateSnapshot
{
  return self->_currentStateSnapshot;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (PBOverlayLayoutRectMap)fixedRectMap
{
  return self->_fixedRectMap;
}

- (NSMutableSet)fixedElementIdentifiers
{
  return self->_fixedElementIdentifiers;
}

- (NSMutableSet)flexibleElementIdentifiers
{
  return self->_flexibleElementIdentifiers;
}

- (NSMutableArray)fixedElements
{
  return self->_fixedElements;
}

- (NSMutableArray)flexibleElements
{
  return self->_flexibleElements;
}

- (void).cxx_destruct
{
}

@end
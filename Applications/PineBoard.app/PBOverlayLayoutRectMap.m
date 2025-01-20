@interface PBOverlayLayoutRectMap
- (BOOL)intersectsRect:(CGRect)a3;
- (CGRect)bounds;
- (NSArray)_combinedNodes;
- (NSMutableArray)nodes;
- (PBOverlayLayoutRectMap)init;
- (PBOverlayLayoutRectMap)initWithBounds:(CGRect)a3;
- (PBOverlayLayoutRectMap)initWithMap:(id)a3;
- (PBOverlayLayoutRectMapSnapshot)baseSnapshot;
- (id)captureSnapshot;
- (id)copyWithZone:(_NSZone *)a3;
- (id)layoutSuggestionForFittingRect:(CGRect)a3 withStickiness:(CGVector)a4;
- (id)layoutSuggestionsForFittingRect:(CGRect)a3 withStickiness:(CGVector)a4;
- (id)stateDumpBuilder;
- (int64_t)calculateLayoutSuggestionsForFittingRect:(CGRect)a3 withStickiness:(CGVector)a4 suggestionSet:(id *)a5 validSuggestionIndexSet:(id *)a6;
- (void)_resetCombinedNodes;
- (void)addRect:(CGRect)a3 forKey:(id)a4;
- (void)removeRectForKey:(id)a3;
- (void)setBaseSnapshot:(id)a3;
@end

@implementation PBOverlayLayoutRectMap

- (PBOverlayLayoutRectMap)init
{
  return -[PBOverlayLayoutRectMap initWithBounds:]( self,  "initWithBounds:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
}

- (PBOverlayLayoutRectMap)initWithBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PBOverlayLayoutRectMap;
  v7 = -[PBOverlayLayoutRectMap init](&v12, "init");
  v8 = v7;
  if (v7)
  {
    v7->_bounds.origin.CGFloat x = x;
    v7->_bounds.origin.CGFloat y = y;
    v7->_bounds.size.CGFloat width = width;
    v7->_bounds.size.CGFloat height = height;
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    nodes = v8->_nodes;
    v8->_nodes = v9;
  }

  return v8;
}

- (PBOverlayLayoutRectMap)initWithMap:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  v5 = -[PBOverlayLayoutRectMap initWithBounds:](self, "initWithBounds:");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 baseSnapshot]);
    baseSnapshot = v5->_baseSnapshot;
    v5->_baseSnapshot = (PBOverlayLayoutRectMapSnapshot *)v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 nodes]);
    if (v8)
    {
      v9 = objc_alloc(&OBJC_CLASS___NSMutableArray);
      v10 = (void *)objc_claimAutoreleasedReturnValue([v4 nodes]);
      v11 = -[NSMutableArray initWithArray:](v9, "initWithArray:", v10);
      nodes = v5->_nodes;
      v5->_nodes = v11;
    }
  }

  return v5;
}

- (void)setBaseSnapshot:(id)a3
{
  v5 = (PBOverlayLayoutRectMapSnapshot *)a3;
  if (self->_baseSnapshot != v5)
  {
    objc_storeStrong((id *)&self->_baseSnapshot, a3);
    -[PBOverlayLayoutRectMap _resetCombinedNodes](self, "_resetCombinedNodes");
  }
}

- (void)addRect:(CGRect)a3 forKey:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  -[PBOverlayLayoutRectMap removeRectForKey:](self, "removeRectForKey:", v9);
  v10 = -[PBOverlayLayoutRectNode initWithKey:bounds:subtracting:]( objc_alloc(&OBJC_CLASS___PBOverlayLayoutRectNode),  "initWithKey:bounds:subtracting:",  v9,  self->_bounds.origin.x,  self->_bounds.origin.y,  self->_bounds.size.width,  self->_bounds.size.height,  x,  y,  width,  height);

  -[NSMutableArray addObject:](self->_nodes, "addObject:", v10);
  -[PBOverlayLayoutRectMap _resetCombinedNodes](self, "_resetCombinedNodes");
}

- (void)removeRectForKey:(id)a3
{
  id v4 = a3;
  nodes = self->_nodes;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100107B80;
  v8[3] = &unk_1003D78A0;
  id v6 = v4;
  id v9 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray indexesOfObjectsPassingTest:](nodes, "indexesOfObjectsPassingTest:", v8));
  if ([v7 count])
  {
    -[NSMutableArray removeObjectsAtIndexes:](self->_nodes, "removeObjectsAtIndexes:", v7);
    -[PBOverlayLayoutRectMap _resetCombinedNodes](self, "_resetCombinedNodes");
  }
}

- (BOOL)intersectsRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBOverlayLayoutRectMap _combinedNodes](self, "_combinedNodes", 0LL));
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        if (objc_msgSend( *(id *)(*((void *)&v12 + 1) + 8 * (void)i),  "intersectsRect:",  x,  y,  width,  height))
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }

      id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

- (id)layoutSuggestionsForFittingRect:(CGRect)a3 withStickiness:(CGVector)a4
{
  id v10 = 0LL;
  id v11 = 0LL;
  int64_t v4 = -[PBOverlayLayoutRectMap calculateLayoutSuggestionsForFittingRect:withStickiness:suggestionSet:validSuggestionIndexSet:]( self,  "calculateLayoutSuggestionsForFittingRect:withStickiness:suggestionSet:validSuggestionIndexSet:",  &v11,  &v10,  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height,  a4.dx,  a4.dy);
  id v5 = v11;
  id v6 = v10;
  if (v4)
  {
    v7 = 0LL;
    if (v4 == 1)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[PBOverlayLayoutSuggestion suggestionWithZeroOffset]( &OBJC_CLASS___PBOverlayLayoutSuggestion,  "suggestionWithZeroOffset"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v8));
    }
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 layoutSuggestionsAtIndexes:v6]);
  }

  return v7;
}

- (id)layoutSuggestionForFittingRect:(CGRect)a3 withStickiness:(CGVector)a4
{
  ddouble y = a4.dy;
  ddouble x = a4.dx;
  id v12 = 0LL;
  id v13 = 0LL;
  int64_t v6 = -[PBOverlayLayoutRectMap calculateLayoutSuggestionsForFittingRect:withStickiness:suggestionSet:validSuggestionIndexSet:]( self,  "calculateLayoutSuggestionsForFittingRect:withStickiness:suggestionSet:validSuggestionIndexSet:",  &v13,  &v12,  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  id v7 = v13;
  id v8 = v12;
  if (!v6)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bestLayoutSuggestionAtIndexes:withStickiness:", v8, dx, dy));
    goto LABEL_5;
  }

  uint64_t v9 = 0LL;
  if (v6 == 1)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[PBOverlayLayoutSuggestion suggestionWithZeroOffset]( &OBJC_CLASS___PBOverlayLayoutSuggestion,  "suggestionWithZeroOffset"));
LABEL_5:
    uint64_t v9 = (void *)v10;
  }

  return v9;
}

- (id)captureSnapshot
{
  v3 = objc_alloc(&OBJC_CLASS___PBOverlayLayoutRectMapSnapshot);
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBOverlayLayoutRectMap _combinedNodes](self, "_combinedNodes"));
  id v5 = -[PBOverlayLayoutRectMapSnapshot initWithBounds:nodes:]( v3,  "initWithBounds:nodes:",  v4,  self->_bounds.origin.x,  self->_bounds.origin.y,  self->_bounds.size.width,  self->_bounds.size.height);

  return v5;
}

- (id)stateDumpBuilder
{
  id v3 = objc_alloc_init(&OBJC_CLASS___TVSStateDumpBuilder);
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBOverlayLayoutRectMapSnapshot nodes](self->_baseSnapshot, "nodes"));
  id v5 =  [v3 appendCollection:v4 withKey:@"baseSnapshot" skipIfEmpty:1 objectTransformer:&stru_1003D78E0];

  id v6 =  [v3 appendArray:self->_nodes withKey:@"nodes" skipIfEmpty:0 objectTransformer:&stru_1003D78E0];
  return v3;
}

- (int64_t)calculateLayoutSuggestionsForFittingRect:(CGRect)a3 withStickiness:(CGVector)a4 suggestionSet:(id *)a5 validSuggestionIndexSet:(id *)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CGVector v37 = a4;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBOverlayLayoutRectMap _combinedNodes](self, "_combinedNodes"));
  if ([v12 count])
  {
    unint64_t v13 = sub_100169C50((unint64_t)&v37);
    v39.origin.double x = x;
    v39.origin.double y = y;
    v39.size.double width = width;
    v39.size.double height = height;
    int64_t v14 = -1LL;
    if (!CGRectIsEmpty(v39) && v13)
    {
      __int128 v15 = -[PBOverlayLayoutSuggestionSet initWithNodeCount:]( [PBOverlayLayoutSuggestionSet alloc],  "initWithNodeCount:",  [v12 count]);
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      v16 = v12;
      id v17 = -[NSMutableIndexSet countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v33,  v38,  16LL);
      if (v17)
      {
        id v18 = v17;
        v25 = a6;
        uint64_t v19 = *(void *)v34;
        char v20 = 1;
        do
        {
          for (i = 0LL; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v34 != v19) {
              objc_enumerationMutation(v16);
            }
            v22 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
            if ((v20 & 1) != 0) {
              char v20 = objc_msgSend( *(id *)(*((void *)&v33 + 1) + 8 * (void)i),  "intersectsRect:",  x,  y,  width,  height) ^ 1;
            }
            else {
              char v20 = 0;
            }
            objc_msgSend(v22, "addPossibleOffsetsForContainingRect:along:toSet:", v13, v15, x, y, width, height);
          }

          id v18 = -[NSMutableIndexSet countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v33,  v38,  16LL);
        }

        while (v18);

        if ((v20 & 1) != 0)
        {
          int64_t v14 = 1LL;
LABEL_26:

          goto LABEL_27;
        }

        v23 = -[NSMutableIndexSet initWithIndexesInRange:]( objc_alloc(&OBJC_CLASS___NSMutableIndexSet),  "initWithIndexesInRange:",  0LL,  -[PBOverlayLayoutSuggestionSet count](v15, "count"));
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472LL;
        v26[2] = sub_100108260;
        v26[3] = &unk_1003D7908;
        double v29 = x;
        double v30 = y;
        double v31 = width;
        double v32 = height;
        v27 = v16;
        v16 = v23;
        v28 = v16;
        -[PBOverlayLayoutSuggestionSet enumerateSuggestionsUsingBlock:](v15, "enumerateSuggestionsUsingBlock:", v26);
        if (-[NSMutableIndexSet count](v16, "count"))
        {
          if (a5) {
            *a5 = v15;
          }
          int64_t v14 = 0LL;
          if (v25) {
            id *v25 = v16;
          }
        }

        else
        {
          int64_t v14 = -1LL;
        }
      }

      else
      {
        int64_t v14 = 1LL;
      }

      goto LABEL_26;
    }
  }

  else
  {
    int64_t v14 = 1LL;
  }

- (NSArray)_combinedNodes
{
  combinedNodes = self->_combinedNodes;
  if (!combinedNodes)
  {
    int64_t v4 = self->_baseSnapshot;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBOverlayLayoutRectMapSnapshot nodes](v4, "nodes"));
    id v6 = [v5 count];

    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBOverlayLayoutRectMapSnapshot nodes](v4, "nodes"));
      id v8 = (NSArray *)objc_claimAutoreleasedReturnValue([v7 allObjects]);

      uint64_t v9 = (NSArray *)objc_claimAutoreleasedReturnValue( -[NSMutableArray arrayByAddingObjectsFromArray:]( self->_nodes,  "arrayByAddingObjectsFromArray:",  v8));
      uint64_t v10 = self->_combinedNodes;
      self->_combinedNodes = v9;
    }

    else
    {
      id v11 = self->_nodes;
      id v8 = self->_combinedNodes;
      self->_combinedNodes = &v11->super;
    }

    combinedNodes = self->_combinedNodes;
  }

  return combinedNodes;
}

- (void)_resetCombinedNodes
{
  combinedNodes = self->_combinedNodes;
  self->_combinedNodes = 0LL;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PBOverlayLayoutRectMap initWithMap:]( +[PBOverlayLayoutRectMap allocWithZone:](&OBJC_CLASS___PBOverlayLayoutRectMap, "allocWithZone:", a3),  "initWithMap:",  self);
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (PBOverlayLayoutRectMapSnapshot)baseSnapshot
{
  return self->_baseSnapshot;
}

- (NSMutableArray)nodes
{
  return self->_nodes;
}

- (void).cxx_destruct
{
}

@end
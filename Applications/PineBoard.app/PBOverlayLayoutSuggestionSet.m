@interface PBOverlayLayoutSuggestionSet
- (PBOverlayLayoutOffsetList)hOffsets;
- (PBOverlayLayoutOffsetList)vOffsets;
- (PBOverlayLayoutSuggestionSet)initWithCapacity:(unint64_t)a3;
- (PBOverlayLayoutSuggestionSet)initWithNodeCount:(unint64_t)a3;
- (id)bestLayoutSuggestionAtIndexes:(id)a3 withStickiness:(CGVector)a4;
- (id)layoutSuggestionsAtIndexes:(id)a3;
- (unint64_t)count;
- (void)addOffset:(double)a3 forAxis:(unint64_t)a4;
- (void)enumerateSuggestionsAtIndexes:(id)a3 usingBlock:(id)a4;
- (void)enumerateSuggestionsUsingBlock:(id)a3;
@end

@implementation PBOverlayLayoutSuggestionSet

- (PBOverlayLayoutSuggestionSet)initWithCapacity:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PBOverlayLayoutSuggestionSet;
  v4 = -[PBOverlayLayoutSuggestionSet init](&v11, "init");
  if (v4)
  {
    unint64_t v5 = a3 + 1;
    v6 = -[PBOverlayLayoutOffsetList initWithCapacity:]( objc_alloc(&OBJC_CLASS___PBOverlayLayoutOffsetList),  "initWithCapacity:",  v5);
    hOffsets = v4->_hOffsets;
    v4->_hOffsets = v6;

    v8 = -[PBOverlayLayoutOffsetList initWithCapacity:]( objc_alloc(&OBJC_CLASS___PBOverlayLayoutOffsetList),  "initWithCapacity:",  v5);
    vOffsets = v4->_vOffsets;
    v4->_vOffsets = v8;

    -[PBOverlayLayoutOffsetList addValue:](v4->_hOffsets, "addValue:", 0.0);
    -[PBOverlayLayoutOffsetList addValue:](v4->_vOffsets, "addValue:", 0.0);
  }

  return v4;
}

- (PBOverlayLayoutSuggestionSet)initWithNodeCount:(unint64_t)a3
{
  return -[PBOverlayLayoutSuggestionSet initWithCapacity:](self, "initWithCapacity:", 2 * a3);
}

- (unint64_t)count
{
  unint64_t v3 = -[PBOverlayLayoutOffsetList count](self->_hOffsets, "count");
  return -[PBOverlayLayoutOffsetList count](self->_vOffsets, "count") * v3;
}

- (void)addOffset:(double)a3 forAxis:(unint64_t)a4
{
  if (a4 == 1)
  {
    uint64_t v4 = 1LL;
    goto LABEL_5;
  }

  if (a4 == 2)
  {
    uint64_t v4 = 2LL;
LABEL_5:
    -[objc_class addValue:]((&self->super.isa)[v4], "addValue:", a3);
    return;
  }

  id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  @"axis must be either UIAxisHorizontal or UIAxisVertical",  0LL,  a3));
  objc_exception_throw(v5);
  -[PBOverlayLayoutSuggestionSet enumerateSuggestionsAtIndexes:usingBlock:](v6, v7, v8, v9);
}

- (void)enumerateSuggestionsAtIndexes:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  SEL v7 = (void (**)(id, void *, void))a4;
  if (v7)
  {
    v22 = objc_autoreleasePoolPush();
    unint64_t v8 = -[PBOverlayLayoutOffsetList count](self->_hOffsets, "count");
    uint64_t v21 = (uint64_t)&v21;
    __chkstk_darwin(v8);
    hOffsets = self->_hOffsets;
    v24 = (char *)&v21 - v10;
    -[PBOverlayLayoutOffsetList getValues:range:](hOffsets, "getValues:range:");
    unint64_t v11 = -[PBOverlayLayoutOffsetList count](self->_vOffsets, "count");
    __chkstk_darwin(v11);
    vOffsets = self->_vOffsets;
    v23 = (double *)((char *)&v21 - v13);
    -[PBOverlayLayoutOffsetList getValues:range:](vOffsets, "getValues:range:");
    unint64_t v25 = v8;
    if (v8)
    {
      uint64_t v14 = 0LL;
      uint64_t v15 = 0LL;
      do
      {
        if (v11)
        {
          v16 = v23;
          double v17 = *(double *)&v24[8 * v15];
          uint64_t v18 = v14;
          unint64_t v19 = v11;
          do
          {
            if (!v6 || [v6 containsIndex:v18])
            {
              v20 = (void *)objc_claimAutoreleasedReturnValue( +[PBOverlayLayoutSuggestion suggestionWithOffset:]( &OBJC_CLASS___PBOverlayLayoutSuggestion,  "suggestionWithOffset:",  v17,  *v16));
              v7[2](v7, v20, v18);
            }

            ++v16;
            ++v18;
            --v19;
          }

          while (v19);
        }

        ++v15;
        v14 += v11;
      }

      while (v15 != v25);
    }

    objc_autoreleasePoolPop(v22);
  }
}

- (void)enumerateSuggestionsUsingBlock:(id)a3
{
}

- (id)layoutSuggestionsAtIndexes:(id)a3
{
  id v4 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10009C538;
  v8[3] = &unk_1003D4880;
  id v9 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v4 count]);
  id v5 = v9;
  -[PBOverlayLayoutSuggestionSet enumerateSuggestionsAtIndexes:usingBlock:]( self,  "enumerateSuggestionsAtIndexes:usingBlock:",  v4,  v8);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v5));
  return v6;
}

- (id)bestLayoutSuggestionAtIndexes:(id)a3 withStickiness:(CGVector)a4
{
  id v5 = a3;
  if ([v5 count])
  {
    uint64_t v10 = 0LL;
    unint64_t v11 = &v10;
    uint64_t v12 = 0x3032000000LL;
    uint64_t v13 = sub_10009C6C8;
    uint64_t v14 = sub_10009C6D8;
    id v15 = 0LL;
    v9[0] = 0LL;
    v9[1] = v9;
    v9[2] = 0x2020000000LL;
    v9[3] = 0x7FEFFFFFFFFFFFFFLL;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10009C6F0;
    v8[3] = &unk_1003D48A8;
    void v8[4] = v9;
    v8[5] = &v10;
    -[PBOverlayLayoutSuggestionSet enumerateSuggestionsAtIndexes:usingBlock:]( self,  "enumerateSuggestionsAtIndexes:usingBlock:",  v5,  v8);
    id v6 = (id)v11[5];
    _Block_object_dispose(v9, 8);
    _Block_object_dispose(&v10, 8);
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (PBOverlayLayoutOffsetList)hOffsets
{
  return self->_hOffsets;
}

- (PBOverlayLayoutOffsetList)vOffsets
{
  return self->_vOffsets;
}

- (void).cxx_destruct
{
}

@end
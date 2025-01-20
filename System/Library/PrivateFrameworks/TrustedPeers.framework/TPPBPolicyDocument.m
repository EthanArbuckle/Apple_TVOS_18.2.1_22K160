@interface TPPBPolicyDocument
+ (Class)categoriesByViewType;
+ (Class)inheritedExcludedViewsType;
+ (Class)introducersByCategoryType;
+ (Class)keyViewMappingType;
+ (Class)modelToCategoryType;
+ (Class)piggybackViewsType;
+ (Class)priorityViewsType;
+ (Class)redactionsType;
+ (Class)userControllableViewsType;
- (BOOL)hasPolicyVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)categoriesByViews;
- (NSMutableArray)inheritedExcludedViews;
- (NSMutableArray)introducersByCategorys;
- (NSMutableArray)keyViewMappings;
- (NSMutableArray)modelToCategorys;
- (NSMutableArray)piggybackViews;
- (NSMutableArray)priorityViews;
- (NSMutableArray)redactions;
- (NSMutableArray)userControllableViews;
- (id)categoriesByViewAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)inheritedExcludedViewsAtIndex:(unint64_t)a3;
- (id)introducersByCategoryAtIndex:(unint64_t)a3;
- (id)keyViewMappingAtIndex:(unint64_t)a3;
- (id)modelToCategoryAtIndex:(unint64_t)a3;
- (id)piggybackViewsAtIndex:(unint64_t)a3;
- (id)priorityViewsAtIndex:(unint64_t)a3;
- (id)redactionsAtIndex:(unint64_t)a3;
- (id)userControllableViewsAtIndex:(unint64_t)a3;
- (unint64_t)categoriesByViewsCount;
- (unint64_t)hash;
- (unint64_t)inheritedExcludedViewsCount;
- (unint64_t)introducersByCategorysCount;
- (unint64_t)keyViewMappingsCount;
- (unint64_t)modelToCategorysCount;
- (unint64_t)piggybackViewsCount;
- (unint64_t)policyVersion;
- (unint64_t)priorityViewsCount;
- (unint64_t)redactionsCount;
- (unint64_t)userControllableViewsCount;
- (void)addCategoriesByView:(id)a3;
- (void)addInheritedExcludedViews:(id)a3;
- (void)addIntroducersByCategory:(id)a3;
- (void)addKeyViewMapping:(id)a3;
- (void)addModelToCategory:(id)a3;
- (void)addPiggybackViews:(id)a3;
- (void)addPriorityViews:(id)a3;
- (void)addRedactions:(id)a3;
- (void)addUserControllableViews:(id)a3;
- (void)clearCategoriesByViews;
- (void)clearInheritedExcludedViews;
- (void)clearIntroducersByCategorys;
- (void)clearKeyViewMappings;
- (void)clearModelToCategorys;
- (void)clearPiggybackViews;
- (void)clearPriorityViews;
- (void)clearRedactions;
- (void)clearUserControllableViews;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCategoriesByViews:(id)a3;
- (void)setHasPolicyVersion:(BOOL)a3;
- (void)setInheritedExcludedViews:(id)a3;
- (void)setIntroducersByCategorys:(id)a3;
- (void)setKeyViewMappings:(id)a3;
- (void)setModelToCategorys:(id)a3;
- (void)setPiggybackViews:(id)a3;
- (void)setPolicyVersion:(unint64_t)a3;
- (void)setPriorityViews:(id)a3;
- (void)setRedactions:(id)a3;
- (void)setUserControllableViews:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TPPBPolicyDocument

- (void)setPolicyVersion:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_policyVersion = a3;
}

- (void)setHasPolicyVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPolicyVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearModelToCategorys
{
}

- (void)addModelToCategory:(id)a3
{
  id v4 = a3;
  modelToCategorys = self->_modelToCategorys;
  id v8 = v4;
  if (!modelToCategorys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v7 = self->_modelToCategorys;
    self->_modelToCategorys = v6;

    id v4 = v8;
    modelToCategorys = self->_modelToCategorys;
  }

  -[NSMutableArray addObject:](modelToCategorys, "addObject:", v4);
}

- (unint64_t)modelToCategorysCount
{
  return -[NSMutableArray count](self->_modelToCategorys, "count");
}

- (id)modelToCategoryAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_modelToCategorys, "objectAtIndex:", a3);
}

- (void)clearCategoriesByViews
{
}

- (void)addCategoriesByView:(id)a3
{
  id v4 = a3;
  categoriesByViews = self->_categoriesByViews;
  id v8 = v4;
  if (!categoriesByViews)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v7 = self->_categoriesByViews;
    self->_categoriesByViews = v6;

    id v4 = v8;
    categoriesByViews = self->_categoriesByViews;
  }

  -[NSMutableArray addObject:](categoriesByViews, "addObject:", v4);
}

- (unint64_t)categoriesByViewsCount
{
  return -[NSMutableArray count](self->_categoriesByViews, "count");
}

- (id)categoriesByViewAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_categoriesByViews, "objectAtIndex:", a3);
}

- (void)clearIntroducersByCategorys
{
}

- (void)addIntroducersByCategory:(id)a3
{
  id v4 = a3;
  introducersByCategorys = self->_introducersByCategorys;
  id v8 = v4;
  if (!introducersByCategorys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v7 = self->_introducersByCategorys;
    self->_introducersByCategorys = v6;

    id v4 = v8;
    introducersByCategorys = self->_introducersByCategorys;
  }

  -[NSMutableArray addObject:](introducersByCategorys, "addObject:", v4);
}

- (unint64_t)introducersByCategorysCount
{
  return -[NSMutableArray count](self->_introducersByCategorys, "count");
}

- (id)introducersByCategoryAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_introducersByCategorys, "objectAtIndex:", a3);
}

- (void)clearRedactions
{
}

- (void)addRedactions:(id)a3
{
  id v4 = a3;
  redactions = self->_redactions;
  id v8 = v4;
  if (!redactions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v7 = self->_redactions;
    self->_redactions = v6;

    id v4 = v8;
    redactions = self->_redactions;
  }

  -[NSMutableArray addObject:](redactions, "addObject:", v4);
}

- (unint64_t)redactionsCount
{
  return -[NSMutableArray count](self->_redactions, "count");
}

- (id)redactionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_redactions, "objectAtIndex:", a3);
}

- (void)clearKeyViewMappings
{
}

- (void)addKeyViewMapping:(id)a3
{
  id v4 = a3;
  keyViewMappings = self->_keyViewMappings;
  id v8 = v4;
  if (!keyViewMappings)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v7 = self->_keyViewMappings;
    self->_keyViewMappings = v6;

    id v4 = v8;
    keyViewMappings = self->_keyViewMappings;
  }

  -[NSMutableArray addObject:](keyViewMappings, "addObject:", v4);
}

- (unint64_t)keyViewMappingsCount
{
  return -[NSMutableArray count](self->_keyViewMappings, "count");
}

- (id)keyViewMappingAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_keyViewMappings, "objectAtIndex:", a3);
}

- (void)clearUserControllableViews
{
}

- (void)addUserControllableViews:(id)a3
{
  id v4 = a3;
  userControllableViews = self->_userControllableViews;
  id v8 = v4;
  if (!userControllableViews)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v7 = self->_userControllableViews;
    self->_userControllableViews = v6;

    id v4 = v8;
    userControllableViews = self->_userControllableViews;
  }

  -[NSMutableArray addObject:](userControllableViews, "addObject:", v4);
}

- (unint64_t)userControllableViewsCount
{
  return -[NSMutableArray count](self->_userControllableViews, "count");
}

- (id)userControllableViewsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_userControllableViews, "objectAtIndex:", a3);
}

- (void)clearPiggybackViews
{
}

- (void)addPiggybackViews:(id)a3
{
  id v4 = a3;
  piggybackViews = self->_piggybackViews;
  id v8 = v4;
  if (!piggybackViews)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v7 = self->_piggybackViews;
    self->_piggybackViews = v6;

    id v4 = v8;
    piggybackViews = self->_piggybackViews;
  }

  -[NSMutableArray addObject:](piggybackViews, "addObject:", v4);
}

- (unint64_t)piggybackViewsCount
{
  return -[NSMutableArray count](self->_piggybackViews, "count");
}

- (id)piggybackViewsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_piggybackViews, "objectAtIndex:", a3);
}

- (void)clearPriorityViews
{
}

- (void)addPriorityViews:(id)a3
{
  id v4 = a3;
  priorityViews = self->_priorityViews;
  id v8 = v4;
  if (!priorityViews)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v7 = self->_priorityViews;
    self->_priorityViews = v6;

    id v4 = v8;
    priorityViews = self->_priorityViews;
  }

  -[NSMutableArray addObject:](priorityViews, "addObject:", v4);
}

- (unint64_t)priorityViewsCount
{
  return -[NSMutableArray count](self->_priorityViews, "count");
}

- (id)priorityViewsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_priorityViews, "objectAtIndex:", a3);
}

- (void)clearInheritedExcludedViews
{
}

- (void)addInheritedExcludedViews:(id)a3
{
  id v4 = a3;
  inheritedExcludedViews = self->_inheritedExcludedViews;
  id v8 = v4;
  if (!inheritedExcludedViews)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v7 = self->_inheritedExcludedViews;
    self->_inheritedExcludedViews = v6;

    id v4 = v8;
    inheritedExcludedViews = self->_inheritedExcludedViews;
  }

  -[NSMutableArray addObject:](inheritedExcludedViews, "addObject:", v4);
}

- (unint64_t)inheritedExcludedViewsCount
{
  return -[NSMutableArray count](self->_inheritedExcludedViews, "count");
}

- (id)inheritedExcludedViewsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_inheritedExcludedViews, "objectAtIndex:", a3);
}

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TPPBPolicyDocument;
  -[TPPBPolicyDocument description](&v8, sel_description);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TPPBPolicyDocument dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v70 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FC8] dictionary];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_policyVersion];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v4 forKey:@"policyVersion"];
  }

  if (-[NSMutableArray count](self->_modelToCategorys, "count"))
  {
    v5 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  -[NSMutableArray count](self->_modelToCategorys, "count"));
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    v6 = self->_modelToCategorys;
    uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v61,  v69,  16LL);
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v62;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v62 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v61 + 1) + 8 * i) dictionaryRepresentation];
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          [v5 addObject:v11];
        }

        uint64_t v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v61,  v69,  16LL);
      }

      while (v8);
    }

    [v3 setObject:v5 forKey:@"modelToCategory"];
  }

  if (-[NSMutableArray count](self->_categoriesByViews, "count"))
  {
    v12 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  -[NSMutableArray count](self->_categoriesByViews, "count"));
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    v13 = self->_categoriesByViews;
    uint64_t v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v57,  v68,  16LL);
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v58;
      do
      {
        for (uint64_t j = 0LL; j != v15; ++j)
        {
          if (*(void *)v58 != v16) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v57 + 1) + 8 * j) dictionaryRepresentation];
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          [v12 addObject:v18];
        }

        uint64_t v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v57,  v68,  16LL);
      }

      while (v15);
    }

    [v3 setObject:v12 forKey:@"categoriesByView"];
  }

  if (-[NSMutableArray count](self->_introducersByCategorys, "count"))
  {
    v19 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  -[NSMutableArray count](self->_introducersByCategorys, "count"));
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    v20 = self->_introducersByCategorys;
    uint64_t v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v53,  v67,  16LL);
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v54;
      do
      {
        for (uint64_t k = 0LL; k != v22; ++k)
        {
          if (*(void *)v54 != v23) {
            objc_enumerationMutation(v20);
          }
          [*(id *)(*((void *)&v53 + 1) + 8 * k) dictionaryRepresentation];
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          [v19 addObject:v25];
        }

        uint64_t v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v53,  v67,  16LL);
      }

      while (v22);
    }

    [v3 setObject:v19 forKey:@"introducersByCategory"];
  }

  if (-[NSMutableArray count](self->_redactions, "count"))
  {
    v26 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  -[NSMutableArray count](self->_redactions, "count"));
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    v27 = self->_redactions;
    uint64_t v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v27,  "countByEnumeratingWithState:objects:count:",  &v49,  v66,  16LL);
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v50;
      do
      {
        for (uint64_t m = 0LL; m != v29; ++m)
        {
          if (*(void *)v50 != v30) {
            objc_enumerationMutation(v27);
          }
          [*(id *)(*((void *)&v49 + 1) + 8 * m) dictionaryRepresentation];
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          [v26 addObject:v32];
        }

        uint64_t v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v27,  "countByEnumeratingWithState:objects:count:",  &v49,  v66,  16LL);
      }

      while (v29);
    }

    [v3 setObject:v26 forKey:@"redactions"];
  }

  if (-[NSMutableArray count](self->_keyViewMappings, "count"))
  {
    v33 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  -[NSMutableArray count](self->_keyViewMappings, "count"));
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    v34 = self->_keyViewMappings;
    uint64_t v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v34,  "countByEnumeratingWithState:objects:count:",  &v45,  v65,  16LL);
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v46;
      do
      {
        for (uint64_t n = 0LL; n != v36; ++n)
        {
          if (*(void *)v46 != v37) {
            objc_enumerationMutation(v34);
          }
          objc_msgSend(*(id *)(*((void *)&v45 + 1) + 8 * n), "dictionaryRepresentation", (void)v45);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          [v33 addObject:v39];
        }

        uint64_t v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v34,  "countByEnumeratingWithState:objects:count:",  &v45,  v65,  16LL);
      }

      while (v36);
    }

    [v3 setObject:v33 forKey:@"keyViewMapping"];
  }

  userControllableViews = self->_userControllableViews;
  if (userControllableViews) {
    [v3 setObject:userControllableViews forKey:@"user_controllable_views"];
  }
  piggybackViews = self->_piggybackViews;
  if (piggybackViews) {
    [v3 setObject:piggybackViews forKey:@"piggyback_views"];
  }
  priorityViews = self->_priorityViews;
  if (priorityViews) {
    [v3 setObject:priorityViews forKey:@"priority_views"];
  }
  inheritedExcludedViews = self->_inheritedExcludedViews;
  if (inheritedExcludedViews) {
    [v3 setObject:inheritedExcludedViews forKey:@"inherited_excluded_views"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TPPBPolicyDocumentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v95 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteUint64Field();
  }
  __int128 v84 = 0u;
  __int128 v85 = 0u;
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  v5 = self->_modelToCategorys;
  uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v82,  v94,  16LL);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v83;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v83 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }

      while (v7 != v9);
      uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v82,  v94,  16LL);
    }

    while (v7);
  }

  __int128 v80 = 0u;
  __int128 v81 = 0u;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  v10 = self->_categoriesByViews;
  uint64_t v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v78,  v93,  16LL);
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v79;
    do
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v79 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }

      while (v12 != v14);
      uint64_t v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v78,  v93,  16LL);
    }

    while (v12);
  }

  __int128 v76 = 0u;
  __int128 v77 = 0u;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  uint64_t v15 = self->_introducersByCategorys;
  uint64_t v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v74,  v92,  16LL);
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v75;
    do
    {
      uint64_t v19 = 0LL;
      do
      {
        if (*(void *)v75 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }

      while (v17 != v19);
      uint64_t v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v74,  v92,  16LL);
    }

    while (v17);
  }

  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  v20 = self->_redactions;
  uint64_t v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v70,  v91,  16LL);
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v71;
    do
    {
      uint64_t v24 = 0LL;
      do
      {
        if (*(void *)v71 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
        ++v24;
      }

      while (v22 != v24);
      uint64_t v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v70,  v91,  16LL);
    }

    while (v22);
  }

  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  v25 = self->_keyViewMappings;
  uint64_t v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v66,  v90,  16LL);
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v67;
    do
    {
      uint64_t v29 = 0LL;
      do
      {
        if (*(void *)v67 != v28) {
          objc_enumerationMutation(v25);
        }
        PBDataWriterWriteSubmessage();
        ++v29;
      }

      while (v27 != v29);
      uint64_t v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v66,  v90,  16LL);
    }

    while (v27);
  }

  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  uint64_t v30 = self->_userControllableViews;
  uint64_t v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v30,  "countByEnumeratingWithState:objects:count:",  &v62,  v89,  16LL);
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v63;
    do
    {
      uint64_t v34 = 0LL;
      do
      {
        if (*(void *)v63 != v33) {
          objc_enumerationMutation(v30);
        }
        PBDataWriterWriteStringField();
        ++v34;
      }

      while (v32 != v34);
      uint64_t v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v30,  "countByEnumeratingWithState:objects:count:",  &v62,  v89,  16LL);
    }

    while (v32);
  }

  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  uint64_t v35 = self->_piggybackViews;
  uint64_t v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v35,  "countByEnumeratingWithState:objects:count:",  &v58,  v88,  16LL);
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v59;
    do
    {
      uint64_t v39 = 0LL;
      do
      {
        if (*(void *)v59 != v38) {
          objc_enumerationMutation(v35);
        }
        PBDataWriterWriteStringField();
        ++v39;
      }

      while (v37 != v39);
      uint64_t v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v35,  "countByEnumeratingWithState:objects:count:",  &v58,  v88,  16LL);
    }

    while (v37);
  }

  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  v40 = self->_priorityViews;
  uint64_t v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v40,  "countByEnumeratingWithState:objects:count:",  &v54,  v87,  16LL);
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v55;
    do
    {
      uint64_t v44 = 0LL;
      do
      {
        if (*(void *)v55 != v43) {
          objc_enumerationMutation(v40);
        }
        PBDataWriterWriteStringField();
        ++v44;
      }

      while (v42 != v44);
      uint64_t v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v40,  "countByEnumeratingWithState:objects:count:",  &v54,  v87,  16LL);
    }

    while (v42);
  }

  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v45 = self->_inheritedExcludedViews;
  uint64_t v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v45,  "countByEnumeratingWithState:objects:count:",  &v50,  v86,  16LL);
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v51;
    do
    {
      uint64_t v49 = 0LL;
      do
      {
        if (*(void *)v51 != v48) {
          objc_enumerationMutation(v45);
        }
        PBDataWriterWriteStringField();
        ++v49;
      }

      while (v47 != v49);
      uint64_t v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v45,  "countByEnumeratingWithState:objects:count:",  &v50,  v86,  16LL);
    }

    while (v47);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_policyVersion;
    *((_BYTE *)v4 + 88) |= 1u;
  }

  id v41 = v4;
  if (-[TPPBPolicyDocument modelToCategorysCount](self, "modelToCategorysCount"))
  {
    [v41 clearModelToCategorys];
    unint64_t v5 = -[TPPBPolicyDocument modelToCategorysCount](self, "modelToCategorysCount");
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        -[TPPBPolicyDocument modelToCategoryAtIndex:](self, "modelToCategoryAtIndex:", i);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        [v41 addModelToCategory:v8];
      }
    }
  }

  if (-[TPPBPolicyDocument categoriesByViewsCount](self, "categoriesByViewsCount"))
  {
    [v41 clearCategoriesByViews];
    unint64_t v9 = -[TPPBPolicyDocument categoriesByViewsCount](self, "categoriesByViewsCount");
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0LL; j != v10; ++j)
      {
        -[TPPBPolicyDocument categoriesByViewAtIndex:](self, "categoriesByViewAtIndex:", j);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v41 addCategoriesByView:v12];
      }
    }
  }

  if (-[TPPBPolicyDocument introducersByCategorysCount](self, "introducersByCategorysCount"))
  {
    [v41 clearIntroducersByCategorys];
    unint64_t v13 = -[TPPBPolicyDocument introducersByCategorysCount](self, "introducersByCategorysCount");
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0LL; k != v14; ++k)
      {
        -[TPPBPolicyDocument introducersByCategoryAtIndex:](self, "introducersByCategoryAtIndex:", k);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v41 addIntroducersByCategory:v16];
      }
    }
  }

  if (-[TPPBPolicyDocument redactionsCount](self, "redactionsCount"))
  {
    [v41 clearRedactions];
    unint64_t v17 = -[TPPBPolicyDocument redactionsCount](self, "redactionsCount");
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0LL; m != v18; ++m)
      {
        v20 = -[TPPBPolicyDocument redactionsAtIndex:](self, "redactionsAtIndex:", m);
        [v41 addRedactions:v20];
      }
    }
  }

  if (-[TPPBPolicyDocument keyViewMappingsCount](self, "keyViewMappingsCount"))
  {
    [v41 clearKeyViewMappings];
    unint64_t v21 = -[TPPBPolicyDocument keyViewMappingsCount](self, "keyViewMappingsCount");
    if (v21)
    {
      unint64_t v22 = v21;
      for (uint64_t n = 0LL; n != v22; ++n)
      {
        -[TPPBPolicyDocument keyViewMappingAtIndex:](self, "keyViewMappingAtIndex:", n);
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
        [v41 addKeyViewMapping:v24];
      }
    }
  }

  if (-[TPPBPolicyDocument userControllableViewsCount](self, "userControllableViewsCount"))
  {
    [v41 clearUserControllableViews];
    unint64_t v25 = -[TPPBPolicyDocument userControllableViewsCount](self, "userControllableViewsCount");
    if (v25)
    {
      unint64_t v26 = v25;
      for (iuint64_t i = 0LL; ii != v26; ++ii)
      {
        -[TPPBPolicyDocument userControllableViewsAtIndex:](self, "userControllableViewsAtIndex:", ii);
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
        [v41 addUserControllableViews:v28];
      }
    }
  }

  if (-[TPPBPolicyDocument piggybackViewsCount](self, "piggybackViewsCount"))
  {
    [v41 clearPiggybackViews];
    unint64_t v29 = -[TPPBPolicyDocument piggybackViewsCount](self, "piggybackViewsCount");
    if (v29)
    {
      unint64_t v30 = v29;
      for (juint64_t j = 0LL; jj != v30; ++jj)
      {
        -[TPPBPolicyDocument piggybackViewsAtIndex:](self, "piggybackViewsAtIndex:", jj);
        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
        [v41 addPiggybackViews:v32];
      }
    }
  }

  if (-[TPPBPolicyDocument priorityViewsCount](self, "priorityViewsCount"))
  {
    [v41 clearPriorityViews];
    unint64_t v33 = -[TPPBPolicyDocument priorityViewsCount](self, "priorityViewsCount");
    if (v33)
    {
      unint64_t v34 = v33;
      for (kuint64_t k = 0LL; kk != v34; ++kk)
      {
        -[TPPBPolicyDocument priorityViewsAtIndex:](self, "priorityViewsAtIndex:", kk);
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
        [v41 addPriorityViews:v36];
      }
    }
  }

  if (-[TPPBPolicyDocument inheritedExcludedViewsCount](self, "inheritedExcludedViewsCount"))
  {
    [v41 clearInheritedExcludedViews];
    unint64_t v37 = -[TPPBPolicyDocument inheritedExcludedViewsCount](self, "inheritedExcludedViewsCount");
    if (v37)
    {
      unint64_t v38 = v37;
      for (muint64_t m = 0LL; mm != v38; ++mm)
      {
        v40 = -[TPPBPolicyDocument inheritedExcludedViewsAtIndex:](self, "inheritedExcludedViewsAtIndex:", mm);
        [v41 addInheritedExcludedViews:v40];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v107 = *MEMORY[0x1895F89C0];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(void *)(v5 + 8) = self->_policyVersion;
    *(_BYTE *)(v5 + 88) |= 1u;
  }

  __int128 v96 = 0u;
  __int128 v97 = 0u;
  __int128 v94 = 0u;
  __int128 v95 = 0u;
  uint64_t v7 = self->_modelToCategorys;
  uint64_t v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v94,  v106,  16LL);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v95;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v95 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v94 + 1) + 8 * v11) copyWithZone:a3];
        [v6 addModelToCategory:v12];

        ++v11;
      }

      while (v9 != v11);
      uint64_t v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v94,  v106,  16LL);
    }

    while (v9);
  }

  __int128 v92 = 0u;
  __int128 v93 = 0u;
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  unint64_t v13 = self->_categoriesByViews;
  uint64_t v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v90,  v105,  16LL);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v91;
    do
    {
      uint64_t v17 = 0LL;
      do
      {
        if (*(void *)v91 != v16) {
          objc_enumerationMutation(v13);
        }
        unint64_t v18 = (void *)[*(id *)(*((void *)&v90 + 1) + 8 * v17) copyWithZone:a3];
        [v6 addCategoriesByView:v18];

        ++v17;
      }

      while (v15 != v17);
      uint64_t v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v90,  v105,  16LL);
    }

    while (v15);
  }

  __int128 v88 = 0u;
  __int128 v89 = 0u;
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  uint64_t v19 = self->_introducersByCategorys;
  uint64_t v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v86,  v104,  16LL);
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v87;
    do
    {
      uint64_t v23 = 0LL;
      do
      {
        if (*(void *)v87 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = (void *)[*(id *)(*((void *)&v86 + 1) + 8 * v23) copyWithZone:a3];
        [v6 addIntroducersByCategory:v24];

        ++v23;
      }

      while (v21 != v23);
      uint64_t v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v86,  v104,  16LL);
    }

    while (v21);
  }

  __int128 v84 = 0u;
  __int128 v85 = 0u;
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  unint64_t v25 = self->_redactions;
  uint64_t v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v82,  v103,  16LL);
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v83;
    do
    {
      uint64_t v29 = 0LL;
      do
      {
        if (*(void *)v83 != v28) {
          objc_enumerationMutation(v25);
        }
        unint64_t v30 = (void *)[*(id *)(*((void *)&v82 + 1) + 8 * v29) copyWithZone:a3];
        [v6 addRedactions:v30];

        ++v29;
      }

      while (v27 != v29);
      uint64_t v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v82,  v103,  16LL);
    }

    while (v27);
  }

  __int128 v80 = 0u;
  __int128 v81 = 0u;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  uint64_t v31 = self->_keyViewMappings;
  uint64_t v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v31,  "countByEnumeratingWithState:objects:count:",  &v78,  v102,  16LL);
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v79;
    do
    {
      uint64_t v35 = 0LL;
      do
      {
        if (*(void *)v79 != v34) {
          objc_enumerationMutation(v31);
        }
        uint64_t v36 = (void *)[*(id *)(*((void *)&v78 + 1) + 8 * v35) copyWithZone:a3];
        [v6 addKeyViewMapping:v36];

        ++v35;
      }

      while (v33 != v35);
      uint64_t v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v31,  "countByEnumeratingWithState:objects:count:",  &v78,  v102,  16LL);
    }

    while (v33);
  }

  __int128 v76 = 0u;
  __int128 v77 = 0u;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  unint64_t v37 = self->_userControllableViews;
  uint64_t v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v37,  "countByEnumeratingWithState:objects:count:",  &v74,  v101,  16LL);
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v75;
    do
    {
      uint64_t v41 = 0LL;
      do
      {
        if (*(void *)v75 != v40) {
          objc_enumerationMutation(v37);
        }
        uint64_t v42 = (void *)[*(id *)(*((void *)&v74 + 1) + 8 * v41) copyWithZone:a3];
        [v6 addUserControllableViews:v42];

        ++v41;
      }

      while (v39 != v41);
      uint64_t v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v37,  "countByEnumeratingWithState:objects:count:",  &v74,  v101,  16LL);
    }

    while (v39);
  }

  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  uint64_t v43 = self->_piggybackViews;
  uint64_t v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v43,  "countByEnumeratingWithState:objects:count:",  &v70,  v100,  16LL);
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v71;
    do
    {
      uint64_t v47 = 0LL;
      do
      {
        if (*(void *)v71 != v46) {
          objc_enumerationMutation(v43);
        }
        uint64_t v48 = (void *)[*(id *)(*((void *)&v70 + 1) + 8 * v47) copyWithZone:a3];
        [v6 addPiggybackViews:v48];

        ++v47;
      }

      while (v45 != v47);
      uint64_t v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v43,  "countByEnumeratingWithState:objects:count:",  &v70,  v100,  16LL);
    }

    while (v45);
  }

  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  uint64_t v49 = self->_priorityViews;
  uint64_t v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v49,  "countByEnumeratingWithState:objects:count:",  &v66,  v99,  16LL);
  if (v50)
  {
    uint64_t v51 = v50;
    uint64_t v52 = *(void *)v67;
    do
    {
      uint64_t v53 = 0LL;
      do
      {
        if (*(void *)v67 != v52) {
          objc_enumerationMutation(v49);
        }
        __int128 v54 = (void *)[*(id *)(*((void *)&v66 + 1) + 8 * v53) copyWithZone:a3];
        [v6 addPriorityViews:v54];

        ++v53;
      }

      while (v51 != v53);
      uint64_t v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v49,  "countByEnumeratingWithState:objects:count:",  &v66,  v99,  16LL);
    }

    while (v51);
  }

  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v55 = self->_inheritedExcludedViews;
  uint64_t v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v55,  "countByEnumeratingWithState:objects:count:",  &v62,  v98,  16LL);
  if (v56)
  {
    uint64_t v57 = v56;
    uint64_t v58 = *(void *)v63;
    do
    {
      uint64_t v59 = 0LL;
      do
      {
        if (*(void *)v63 != v58) {
          objc_enumerationMutation(v55);
        }
        __int128 v60 = (void *)objc_msgSend(*(id *)(*((void *)&v62 + 1) + 8 * v59), "copyWithZone:", a3, (void)v62);
        [v6 addInheritedExcludedViews:v60];

        ++v59;
      }

      while (v57 != v59);
      uint64_t v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v55,  "countByEnumeratingWithState:objects:count:",  &v62,  v98,  16LL);
    }

    while (v57);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 1) == 0 || self->_policyVersion != *((void *)v4 + 1)) {
      goto LABEL_25;
    }
  }

  else if ((*((_BYTE *)v4 + 88) & 1) != 0)
  {
LABEL_25:
    char v14 = 0;
    goto LABEL_26;
  }

  modelToCategorys = self->_modelToCategorys;
  if ((unint64_t)modelToCategorys | *((void *)v4 + 6)
    && !-[NSMutableArray isEqual:](modelToCategorys, "isEqual:"))
  {
    goto LABEL_25;
  }

  categoriesByViews = self->_categoriesByViews;
  if ((unint64_t)categoriesByViews | *((void *)v4 + 2))
  {
  }

  introducersByCategorys = self->_introducersByCategorys;
  if ((unint64_t)introducersByCategorys | *((void *)v4 + 4))
  {
  }

  redactions = self->_redactions;
  if ((unint64_t)redactions | *((void *)v4 + 9))
  {
  }

  keyViewMappings = self->_keyViewMappings;
  if ((unint64_t)keyViewMappings | *((void *)v4 + 5))
  {
  }

  userControllableViews = self->_userControllableViews;
  if ((unint64_t)userControllableViews | *((void *)v4 + 10))
  {
  }

  piggybackViews = self->_piggybackViews;
  if ((unint64_t)piggybackViews | *((void *)v4 + 7))
  {
  }

  priorityViews = self->_priorityViews;
  if ((unint64_t)priorityViews | *((void *)v4 + 8))
  {
  }

  inheritedExcludedViews = self->_inheritedExcludedViews;
  else {
    char v14 = 1;
  }
LABEL_26:

  return v14;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    unint64_t v3 = 2654435761u * self->_policyVersion;
  }
  else {
    unint64_t v3 = 0LL;
  }
  uint64_t v4 = -[NSMutableArray hash](self->_modelToCategorys, "hash") ^ v3;
  uint64_t v5 = -[NSMutableArray hash](self->_categoriesByViews, "hash");
  uint64_t v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_introducersByCategorys, "hash");
  uint64_t v7 = -[NSMutableArray hash](self->_redactions, "hash");
  uint64_t v8 = v7 ^ -[NSMutableArray hash](self->_keyViewMappings, "hash");
  uint64_t v9 = v6 ^ v8 ^ -[NSMutableArray hash](self->_userControllableViews, "hash");
  uint64_t v10 = -[NSMutableArray hash](self->_piggybackViews, "hash");
  uint64_t v11 = v10 ^ -[NSMutableArray hash](self->_priorityViews, "hash");
  return v9 ^ v11 ^ -[NSMutableArray hash](self->_inheritedExcludedViews, "hash");
}

- (void)mergeFrom:(id)a3
{
  uint64_t v96 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v5 = (id *)v4;
  if ((*((_BYTE *)v4 + 88) & 1) != 0)
  {
    self->_policyVersiouint64_t n = *((void *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

  __int128 v85 = 0u;
  __int128 v86 = 0u;
  __int128 v83 = 0u;
  __int128 v84 = 0u;
  id v6 = *((id *)v4 + 6);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v83 objects:v95 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v84;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v84 != v9) {
          objc_enumerationMutation(v6);
        }
        -[TPPBPolicyDocument addModelToCategory:]( self,  "addModelToCategory:",  *(void *)(*((void *)&v83 + 1) + 8 * v10++));
      }

      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v83 objects:v95 count:16];
    }

    while (v8);
  }

  __int128 v81 = 0u;
  __int128 v82 = 0u;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  id v11 = v5[2];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v79 objects:v94 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v80;
    do
    {
      uint64_t v15 = 0LL;
      do
      {
        if (*(void *)v80 != v14) {
          objc_enumerationMutation(v11);
        }
        -[TPPBPolicyDocument addCategoriesByView:]( self,  "addCategoriesByView:",  *(void *)(*((void *)&v79 + 1) + 8 * v15++));
      }

      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v79 objects:v94 count:16];
    }

    while (v13);
  }

  __int128 v77 = 0u;
  __int128 v78 = 0u;
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  id v16 = v5[4];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v75 objects:v93 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v76;
    do
    {
      uint64_t v20 = 0LL;
      do
      {
        if (*(void *)v76 != v19) {
          objc_enumerationMutation(v16);
        }
        -[TPPBPolicyDocument addIntroducersByCategory:]( self,  "addIntroducersByCategory:",  *(void *)(*((void *)&v75 + 1) + 8 * v20++));
      }

      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v75 objects:v93 count:16];
    }

    while (v18);
  }

  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  id v21 = v5[9];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v71 objects:v92 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v72;
    do
    {
      uint64_t v25 = 0LL;
      do
      {
        if (*(void *)v72 != v24) {
          objc_enumerationMutation(v21);
        }
        -[TPPBPolicyDocument addRedactions:](self, "addRedactions:", *(void *)(*((void *)&v71 + 1) + 8 * v25++));
      }

      while (v23 != v25);
      uint64_t v23 = [v21 countByEnumeratingWithState:&v71 objects:v92 count:16];
    }

    while (v23);
  }

  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  id v26 = v5[5];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v67 objects:v91 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v68;
    do
    {
      uint64_t v30 = 0LL;
      do
      {
        if (*(void *)v68 != v29) {
          objc_enumerationMutation(v26);
        }
        -[TPPBPolicyDocument addKeyViewMapping:]( self,  "addKeyViewMapping:",  *(void *)(*((void *)&v67 + 1) + 8 * v30++));
      }

      while (v28 != v30);
      uint64_t v28 = [v26 countByEnumeratingWithState:&v67 objects:v91 count:16];
    }

    while (v28);
  }

  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  id v31 = v5[10];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v63 objects:v90 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v64;
    do
    {
      uint64_t v35 = 0LL;
      do
      {
        if (*(void *)v64 != v34) {
          objc_enumerationMutation(v31);
        }
        -[TPPBPolicyDocument addUserControllableViews:]( self,  "addUserControllableViews:",  *(void *)(*((void *)&v63 + 1) + 8 * v35++));
      }

      while (v33 != v35);
      uint64_t v33 = [v31 countByEnumeratingWithState:&v63 objects:v90 count:16];
    }

    while (v33);
  }

  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  id v36 = v5[7];
  uint64_t v37 = [v36 countByEnumeratingWithState:&v59 objects:v89 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v60;
    do
    {
      uint64_t v40 = 0LL;
      do
      {
        if (*(void *)v60 != v39) {
          objc_enumerationMutation(v36);
        }
        -[TPPBPolicyDocument addPiggybackViews:]( self,  "addPiggybackViews:",  *(void *)(*((void *)&v59 + 1) + 8 * v40++));
      }

      while (v38 != v40);
      uint64_t v38 = [v36 countByEnumeratingWithState:&v59 objects:v89 count:16];
    }

    while (v38);
  }

  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  id v41 = v5[8];
  uint64_t v42 = [v41 countByEnumeratingWithState:&v55 objects:v88 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v56;
    do
    {
      uint64_t v45 = 0LL;
      do
      {
        if (*(void *)v56 != v44) {
          objc_enumerationMutation(v41);
        }
        -[TPPBPolicyDocument addPriorityViews:]( self,  "addPriorityViews:",  *(void *)(*((void *)&v55 + 1) + 8 * v45++));
      }

      while (v43 != v45);
      uint64_t v43 = [v41 countByEnumeratingWithState:&v55 objects:v88 count:16];
    }

    while (v43);
  }

  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id v46 = v5[3];
  uint64_t v47 = [v46 countByEnumeratingWithState:&v51 objects:v87 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v52;
    do
    {
      uint64_t v50 = 0LL;
      do
      {
        if (*(void *)v52 != v49) {
          objc_enumerationMutation(v46);
        }
        -[TPPBPolicyDocument addInheritedExcludedViews:]( self,  "addInheritedExcludedViews:",  *(void *)(*((void *)&v51 + 1) + 8 * v50++),  (void)v51);
      }

      while (v48 != v50);
      uint64_t v48 = [v46 countByEnumeratingWithState:&v51 objects:v87 count:16];
    }

    while (v48);
  }
}

- (unint64_t)policyVersion
{
  return self->_policyVersion;
}

- (NSMutableArray)modelToCategorys
{
  return self->_modelToCategorys;
}

- (void)setModelToCategorys:(id)a3
{
}

- (NSMutableArray)categoriesByViews
{
  return self->_categoriesByViews;
}

- (void)setCategoriesByViews:(id)a3
{
}

- (NSMutableArray)introducersByCategorys
{
  return self->_introducersByCategorys;
}

- (void)setIntroducersByCategorys:(id)a3
{
}

- (NSMutableArray)redactions
{
  return self->_redactions;
}

- (void)setRedactions:(id)a3
{
}

- (NSMutableArray)keyViewMappings
{
  return self->_keyViewMappings;
}

- (void)setKeyViewMappings:(id)a3
{
}

- (NSMutableArray)userControllableViews
{
  return self->_userControllableViews;
}

- (void)setUserControllableViews:(id)a3
{
}

- (NSMutableArray)piggybackViews
{
  return self->_piggybackViews;
}

- (void)setPiggybackViews:(id)a3
{
}

- (NSMutableArray)priorityViews
{
  return self->_priorityViews;
}

- (void)setPriorityViews:(id)a3
{
}

- (NSMutableArray)inheritedExcludedViews
{
  return self->_inheritedExcludedViews;
}

- (void)setInheritedExcludedViews:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (Class)modelToCategoryType
{
  return (Class)objc_opt_class();
}

+ (Class)categoriesByViewType
{
  return (Class)objc_opt_class();
}

+ (Class)introducersByCategoryType
{
  return (Class)objc_opt_class();
}

+ (Class)redactionsType
{
  return (Class)objc_opt_class();
}

+ (Class)keyViewMappingType
{
  return (Class)objc_opt_class();
}

+ (Class)userControllableViewsType
{
  return (Class)objc_opt_class();
}

+ (Class)piggybackViewsType
{
  return (Class)objc_opt_class();
}

+ (Class)priorityViewsType
{
  return (Class)objc_opt_class();
}

+ (Class)inheritedExcludedViewsType
{
  return (Class)objc_opt_class();
}

@end
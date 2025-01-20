@interface TPPBPolicyCategoriesByView
+ (Class)categoriesType;
+ (id)TPPBPolicyCategoriesByViewWithView:(id)a3 categories:(id)a4;
- (BOOL)hasView;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)categories;
- (NSString)view;
- (id)categoriesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)categoriesCount;
- (unint64_t)hash;
- (void)addCategories:(id)a3;
- (void)clearCategories;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCategories:(id)a3;
- (void)setView:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TPPBPolicyCategoriesByView

- (BOOL)hasView
{
  return self->_view != 0LL;
}

- (void)clearCategories
{
}

- (void)addCategories:(id)a3
{
  id v4 = a3;
  categories = self->_categories;
  id v8 = v4;
  if (!categories)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v7 = self->_categories;
    self->_categories = v6;

    id v4 = v8;
    categories = self->_categories;
  }

  -[NSMutableArray addObject:](categories, "addObject:", v4);
}

- (unint64_t)categoriesCount
{
  return -[NSMutableArray count](self->_categories, "count");
}

- (id)categoriesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_categories, "objectAtIndex:", a3);
}

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TPPBPolicyCategoriesByView;
  -[TPPBPolicyCategoriesByView description](&v8, sel_description);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TPPBPolicyCategoriesByView dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  view = self->_view;
  if (view) {
    [v3 setObject:view forKey:@"view"];
  }
  categories = self->_categories;
  if (categories) {
    [v4 setObject:categories forKey:@"categories"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TPPBPolicyCategoriesByViewReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (self->_view) {
    PBDataWriterWriteStringField();
  }
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v5 = self->_categories;
  uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }

      while (v7 != v9);
      uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_view) {
    objc_msgSend(v8, "setView:");
  }
  if (-[TPPBPolicyCategoriesByView categoriesCount](self, "categoriesCount"))
  {
    [v8 clearCategories];
    unint64_t v4 = -[TPPBPolicyCategoriesByView categoriesCount](self, "categoriesCount");
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        -[TPPBPolicyCategoriesByView categoriesAtIndex:](self, "categoriesAtIndex:", i);
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 addCategories:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  unint64_t v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = -[NSString copyWithZone:](self->_view, "copyWithZone:", a3);
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v8 = self->_categories;
  uint64_t v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        __int128 v13 = (void *)objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (void)v15);
        [v5 addCategories:v13];

        ++v12;
      }

      while (v10 != v12);
      uint64_t v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v10);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((view = self->_view, !((unint64_t)view | v4[2])) || -[NSString isEqual:](view, "isEqual:")))
  {
    categories = self->_categories;
    else {
      char v7 = 1;
    }
  }

  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_view, "hash");
  return -[NSMutableArray hash](self->_categories, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[TPPBPolicyCategoriesByView setView:](self, "setView:");
  }
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v5 = *((id *)v4 + 1);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[TPPBPolicyCategoriesByView addCategories:]( self,  "addCategories:",  *(void *)(*((void *)&v10 + 1) + 8 * i),  (void)v10);
      }

      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }
}

- (NSString)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
}

- (NSMutableArray)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (Class)categoriesType
{
  return (Class)objc_opt_class();
}

+ (id)TPPBPolicyCategoriesByViewWithView:(id)a3 categories:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___TPPBPolicyCategoriesByView);
  -[TPPBPolicyCategoriesByView setView:](v7, "setView:", v6);

  uint64_t v8 = (void *)[v5 mutableCopy];
  -[TPPBPolicyCategoriesByView setCategories:](v7, "setCategories:", v8);

  return v7;
}

@end
@interface NSMetadataItem
- (NSArray)attributes;
- (NSDictionary)valuesForAttributes:(NSArray *)keys;
- (id)_init:(id)a3;
- (id)_item;
- (id)valueForAttribute:(NSString *)key;
- (id)valueForKey:(id)a3;
- (void)_setQuery:(id)a3;
- (void)dealloc;
@end

@implementation NSMetadataItem

- (id)_init:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSMetadataItem;
  v4 = -[NSMetadataItem init](&v6, sel_init);
  v4->_item = a3;
  v4->_reserved = objc_alloc_init(&OBJC_CLASS____NSMetadataItemPrivateIvars);
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSMetadataItem;
  -[NSMetadataItem dealloc](&v3, sel_dealloc);
}

- (id)_item
{
  return self->_item;
}

- (void)_setQuery:(id)a3
{
  *((void *)self->_reserved + 1) = a3;
}

- (id)valueForKey:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    if ([a3 isEqualToString:@"attributes"])
    {
      return -[NSMetadataItem attributes](self, "attributes");
    }

    else
    {
      objc_super v6 = (void *)*((void *)self->_reserved + 1);
      if ([v6 _isMDQuery])
      {
        if (objc_msgSend((id)objc_msgSend(v6, "_allAttributes"), "containsObject:", a3)) {
          return -[NSMetadataItem valueForAttribute:](self, "valueForAttribute:", a3);
        }
      }

      if (-[NSArray containsObject:](-[NSMetadataItem attributes](self, "attributes"), "containsObject:", a3))
      {
        return -[NSMetadataItem valueForAttribute:](self, "valueForAttribute:", a3);
      }

      else
      {
        v7.receiver = self;
        v7.super_class = (Class)&OBJC_CLASS___NSMetadataItem;
        return -[NSMetadataItem valueForKey:](&v7, sel_valueForKey_);
      }
    }
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___NSMetadataItem;
    return -[NSMetadataItem valueForKey:](&v8, sel_valueForKey_);
  }

- (id)valueForAttribute:(NSString *)key
{
  v5 = (void *)*((void *)self->_reserved + 1);
  uint64_t v6 = [v5 indexOfResult:self];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0LL;
  }
  id result = (id)[v5 valueOfAttribute:key forResultAtIndex:v6];
  if (!result) {
    return 0LL;
  }
  return result;
}

- (NSDictionary)valuesForAttributes:(NSArray *)keys
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  v5 = (void *)*((void *)self->_reserved + 1);
  uint64_t v6 = (void *)[v5 _allAttributes];
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  uint64_t v7 = -[NSArray countByEnumeratingWithState:objects:count:]( keys,  "countByEnumeratingWithState:objects:count:",  &v25,  v24,  16LL);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
LABEL_4:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v26 != v9) {
        objc_enumerationMutation(keys);
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = -[NSArray countByEnumeratingWithState:objects:count:]( keys,  "countByEnumeratingWithState:objects:count:",  &v25,  v24,  16LL);
        if (v8) {
          goto LABEL_4;
        }
        break;
      }
    }
  }

  uint64_t v11 = [v5 indexOfResult:self];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
    return (NSDictionary *)0LL;
  }
  uint64_t v12 = v11;
  v13 = (NSDictionary *)[MEMORY[0x189603FC8] dictionary];
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  uint64_t v14 = -[NSArray countByEnumeratingWithState:objects:count:]( keys,  "countByEnumeratingWithState:objects:count:",  &v20,  v19,  16LL);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t i = 0LL; i != v15; ++i)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(keys);
        }
        -[NSDictionary setObject:forKey:]( v13,  "setObject:forKey:",  [v5 valueOfAttribute:*(void *)(*((void *)&v20 + 1) + 8 * i) forResultAtIndex:v12],  *(void *)(*((void *)&v20 + 1) + 8 * i));
      }

      uint64_t v15 = -[NSArray countByEnumeratingWithState:objects:count:]( keys,  "countByEnumeratingWithState:objects:count:",  &v20,  v19,  16LL);
    }

    while (v15);
  }

  if (!v13) {
    return (NSDictionary *)0LL;
  }
  return v13;
}

- (NSArray)attributes
{
  id result = (NSArray *)0LL;
  if (!result) {
    return (NSArray *)MEMORY[0x189604A58];
  }
  return result;
}

@end
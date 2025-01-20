@interface __NSVariableWidthString
- (__NSVariableWidthString)initWithString:(id)a3 widthVariants:(id)a4;
- (__NSVariableWidthString)initWithWidthVariants:(id)a3;
- (id)_widthVariants;
- (id)formatConfiguration;
- (id)variantFittingPresentationWidth:(int64_t)a3;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)dealloc;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
@end

@implementation __NSVariableWidthString

- (__NSVariableWidthString)initWithString:(id)a3 widthVariants:(id)a4
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS_____NSVariableWidthString;
  v6 = -[NSString init](&v8, sel_init);
  if (v6)
  {
    v6->_variants = (NSDictionary *)[a4 copy];
    v6->_defaultString = (NSString *)[a3 copy];
  }

  return v6;
}

- (__NSVariableWidthString)initWithWidthVariants:(id)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (!a3) {
    goto LABEL_19;
  }
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  v5 = (void *)[a3 allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v18 count:16];
  if (!v6) {
    goto LABEL_19;
  }
  uint64_t v7 = v6;
  uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  uint64_t v10 = *(void *)v20;
  do
  {
    for (uint64_t i = 0LL; i != v7; ++i)
    {
      if (*(void *)v20 != v10) {
        objc_enumerationMutation(v5);
      }
      v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      uint64_t v13 = [v12 integerValue];
      if (v9) {
        BOOL v14 = v13 < v8;
      }
      else {
        BOOL v14 = 1;
      }
      if (v14)
      {
        uint64_t v8 = v13;
        uint64_t v9 = v12;
      }
    }

    uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v18 count:16];
  }

  while (v7);
  if (v9) {
    v16 = (const __CFString *)[a3 objectForKey:v9];
  }
  else {
LABEL_19:
  }
    v16 = &stru_189CA6A28;
  return -[__NSVariableWidthString initWithString:widthVariants:](self, "initWithString:widthVariants:", v16, a3);
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS_____NSVariableWidthString;
  -[__NSVariableWidthString dealloc](&v3, sel_dealloc);
}

- (id)variantFittingPresentationWidth:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (!self->_variants) {
    goto LABEL_15;
  }
  v5 = -[NSDictionary objectForKey:]( self->_variants,  "objectForKey:",  +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", a3));
  if (!v5)
  {
    if (!-[NSDictionary count](self->_variants, "count")) {
      goto LABEL_15;
    }
    uint64_t v7 = -[NSArray sortedArrayUsingComparator:]( -[NSDictionary allKeys](self->_variants, "allKeys"),  "sortedArrayUsingComparator:",  &__block_literal_global_3);
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    uint64_t v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v15,  v14,  16LL);
    if (!v8) {
      goto LABEL_15;
    }
    uint64_t v9 = v8;
    v5 = 0LL;
    uint64_t v10 = *(void *)v16;
LABEL_8:
    uint64_t v11 = 0LL;
    while (1)
    {
      if (*(void *)v16 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
      v5 = -[NSDictionary objectForKey:](self->_variants, "objectForKey:", v12);
      if (v9 == ++v11)
      {
        uint64_t v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v15,  v14,  16LL);
        if (v9) {
          goto LABEL_8;
        }
        break;
      }
    }

    if (!v5) {
      goto LABEL_15;
    }
  }

  if (v5 != self->_defaultString) {
    uint64_t v6 = -[__NSVariableWidthString initWithString:widthVariants:]( objc_alloc(&OBJC_CLASS_____NSVariableWidthString),  "initWithString:widthVariants:",  v5,  self->_variants);
  }
  else {
LABEL_15:
  }
    uint64_t v6 = self;
  return v6;
}

- (id)formatConfiguration
{
  if (self->_defaultString && (objc_opt_respondsToSelector() & 1) != 0) {
    return (id)-[NSString performSelector:](self->_defaultString, "performSelector:", sel_formatConfiguration);
  }
  else {
    return 0LL;
  }
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return -[NSString characterAtIndex:](self->_defaultString, "characterAtIndex:", a3);
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
}

- (unint64_t)length
{
  return -[NSString length](self->_defaultString, "length");
}

- (id)_widthVariants
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc_init(MEMORY[0x189603FA8]);
  if (-[NSDictionary count](self->_variants, "count"))
  {
    uint64_t v4 = -[NSArray sortedArrayUsingComparator:]( -[NSDictionary allKeys](self->_variants, "allKeys"),  "sortedArrayUsingComparator:",  &__block_literal_global_3);
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    uint64_t v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v10,  16LL);
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0LL; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend( v3,  "addObject:",  -[NSDictionary objectForKeyedSubscript:]( self->_variants,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v11 + 1) + 8 * i)));
        }

        uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v10,  16LL);
      }

      while (v6);
    }
  }

  else
  {
    [v3 addObject:self];
  }

  return v3;
}

@end
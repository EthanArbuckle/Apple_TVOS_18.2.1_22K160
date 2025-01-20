@interface PKEnumerator
+ (id)defaultFilter;
- (NSEnumerator)underlyingEnumerator;
- (PKEnumerator)init;
- (PKEnumerator)initWithNSEnumerator:(id)a3;
- (id)filter;
- (id)nextObject;
- (void)setFilter:(id)a3;
@end

@implementation PKEnumerator

+ (id)defaultFilter
{
  return &unk_189F210B8;
}

- (PKEnumerator)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PKEnumerator;
  v2 = -[PKEnumerator init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    underlyingEnumerator = v2->_underlyingEnumerator;
    v2->_underlyingEnumerator = 0LL;

    uint64_t v9 = objc_msgSend_defaultFilter(PKEnumerator, v5, v6, v7, v8);
    id filter = v3->_filter;
    v3->_id filter = (id)v9;
  }

  return v3;
}

- (PKEnumerator)initWithNSEnumerator:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PKEnumerator;
  uint64_t v6 = -[PKEnumerator init](&v15, sel_init);
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlyingEnumerator, a3);
    uint64_t v12 = objc_msgSend_defaultFilter(PKEnumerator, v8, v9, v10, v11);
    id filter = v7->_filter;
    v7->_id filter = (id)v12;
  }

  return v7;
}

- (void)setFilter:(id)a3
{
  id v8 = a3;
  id v12 = v8;
  if (!v8)
  {
    objc_msgSend_defaultFilter(PKEnumerator, v4, v5, v6, v7);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v9 = (void *)MEMORY[0x186E4154C](v8);
  id filter = self->_filter;
  self->_id filter = v9;

  uint64_t v11 = v12;
  if (!v12)
  {

    uint64_t v11 = 0LL;
  }
}

- (id)nextObject
{
  uint64_t v6 = 0LL;
  while (1)
  {
    uint64_t v7 = v6;
    objc_msgSend_underlyingEnumerator(self, a2, v2, v3, v4);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_nextObject(v8, v9, v10, v11, v12);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6) {
      break;
    }
    objc_msgSend_filter(self, v13, v14, v15, v16);
    v17 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue();
    int v18 = ((uint64_t (**)(void, void *))v17)[2](v17, v6);

    if (v18)
    {
      id v19 = v6;
      goto LABEL_6;
    }
  }

  id v19 = 0LL;
LABEL_6:

  return v19;
}

- (id)filter
{
  return self->_filter;
}

- (NSEnumerator)underlyingEnumerator
{
  return self->_underlyingEnumerator;
}

- (void).cxx_destruct
{
}

@end
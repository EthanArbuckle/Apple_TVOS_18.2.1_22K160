@interface LACCacheSync
- (LACCacheSync)initWithTimeout:(double)a3 block:(id)a4;
- (id)valueWithParameter:(id)a3 error:(id *)a4;
@end

@implementation LACCacheSync

- (LACCacheSync)initWithTimeout:(double)a3 block:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___LACCacheSync;
  v7 = -[LACCache initWithTimeout:](&v11, sel_initWithTimeout_, a3);
  if (v7)
  {
    v8 = _Block_copy(v6);
    id block = v7->_block;
    v7->_id block = v8;
  }

  return v7;
}

- (id)valueWithParameter:(id)a3 error:(id *)a4
{
  id v5 = a3;
  -[LACCache cachedValueWithParameter:](self, "cachedValueWithParameter:", v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    (*((void (**)(void))self->_block + 2))();
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LACCache setCachedValue:withParameter:](self, "setCachedValue:withParameter:", v6, v5);
  }

  id v7 = v6;

  return v7;
}

- (void).cxx_destruct
{
}

@end
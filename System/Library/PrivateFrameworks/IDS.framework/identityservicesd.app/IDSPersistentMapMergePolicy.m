@interface IDSPersistentMapMergePolicy
+ (id)ditchMemoryPolicy;
+ (id)prioritizeMemoryPolicy;
- (IDSPersistentMapMergePolicy)initWithPolicyBlock:(id)a3;
- (IDSPersistentMapMergePolicy)initWithStandardPolicy:(unint64_t)a3;
- (id)block;
- (id)processedDictionaryForDisk:(id)a3 andMemory:(id)a4;
- (unint64_t)policy;
- (void)setBlock:(id)a3;
- (void)setPolicy:(unint64_t)a3;
@end

@implementation IDSPersistentMapMergePolicy

+ (id)ditchMemoryPolicy
{
  return [objc_alloc((Class)a1) initWithStandardPolicy:0];
}

+ (id)prioritizeMemoryPolicy
{
  return [objc_alloc((Class)a1) initWithStandardPolicy:1];
}

- (IDSPersistentMapMergePolicy)initWithStandardPolicy:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IDSPersistentMapMergePolicy;
  result = -[IDSPersistentMapMergePolicy init](&v5, "init");
  if (result) {
    result->_policy = a3;
  }
  return result;
}

- (IDSPersistentMapMergePolicy)initWithPolicyBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = -[IDSPersistentMapMergePolicy initWithStandardPolicy:](self, "initWithStandardPolicy:", 2LL);
    if (v5)
    {
      id v6 = objc_retainBlock(v4);
      id block = v5->_block;
      v5->_id block = v6;
    }

    self = v5;
    v8 = self;
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (id)processedDictionaryForDisk:(id)a3 andMemory:(id)a4
{
  id block = (uint64_t (**)(id, id, id))self->_block;
  if (block)
  {
    uint64_t v6 = block[2](block, a3, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary, v8);
    if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
    {
      id v10 = v7;
      v7 = v10;
    }

    else
    {
      id v10 = [v7 mutableCopy];
    }

    v12 = v10;
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler", a3, a4));
    v12 = 0LL;
  }

  return v12;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (unint64_t)policy
{
  return self->_policy;
}

- (void)setPolicy:(unint64_t)a3
{
  self->_policy = a3;
}

- (void).cxx_destruct
{
}

@end
@interface SACallTree
- (NSArray)rootFrames;
- (NSArray)rootObjects;
- (SACallTree)initWithRootObjects:(id)a3;
- (void)enumerateCallTreeFrames:(id)a3;
@end

@implementation SACallTree

- (SACallTree)initWithRootObjects:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SACallTree;
  v5 = -[SACallTree init](&v9, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    rootObjects = v5->_rootObjects;
    v5->_rootObjects = (NSArray *)v6;
  }

  return v5;
}

- (NSArray)rootFrames
{
  return (NSArray *)FilterArrayToCallTreeFrames(self->_rootObjects);
}

- (void)enumerateCallTreeFrames:(id)a3
{
  id v4 = a3;
  rootObjects = self->_rootObjects;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __38__SACallTree_enumerateCallTreeFrames___block_invoke;
  v7[3] = &unk_189F634F0;
  id v8 = v4;
  id v6 = v4;
  +[SACallTreeFrame enumerateTree:block:]((uint64_t)&OBJC_CLASS___SACallTreeFrame, rootObjects, v7);
}

void __38__SACallTree_enumerateCallTreeFrames___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([v3 isTruncatedLeafCallstack] & 1) == 0) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

- (NSArray)rootObjects
{
  return (NSArray *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

@end
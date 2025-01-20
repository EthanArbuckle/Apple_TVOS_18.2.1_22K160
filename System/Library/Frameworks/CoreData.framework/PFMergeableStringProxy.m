@interface PFMergeableStringProxy
+ (BOOL)supportsMergeableTransformable;
- (PFMergeableStringProxy)init;
- (PFMergeableStringProxy)initWithContainer:(id)a3 key:(id)a4 mergeableString:(id)a5;
- (id)computedValue;
- (uint64_t)performOperation:(uint64_t)result;
- (void)appendString:(id)a3;
- (void)dealloc;
- (void)insertString:(id)a3 atIndex:(unint64_t)a4;
- (void)merge:(id)a3;
- (void)removeSubrange:(_NSRange)a3;
- (void)replaceSubrange:(_NSRange)a3 withString:(id)a4;
- (void)setString:(id)a3;
@end

@implementation PFMergeableStringProxy

- (PFMergeableStringProxy)init
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], objc_msgSend( NSString, "stringWithFormat:", @"-init is unsupported. Use %@", NSStringFromSelector(sel_initWithContainer_key_mergeableString_)), 0 reason userInfo];
  objc_exception_throw(v2);
  return -[PFMergeableStringProxy initWithContainer:key:mergeableString:](v3, v4, v5, v6, v7);
}

- (PFMergeableStringProxy)initWithContainer:(id)a3 key:(id)a4 mergeableString:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PFMergeableStringProxy;
  v8 = -[PFMergeableStringProxy init](&v10, sel_init);
  if (v8)
  {
    v8->_container = (NSManagedObject *)a3;
    v8->_key = (NSString *)[a4 copy];
    v8->_mergeableString = (NSMergeableTransformableStringAttributeValue *)a5;
  }

  return v8;
}

- (void)dealloc
{
  self->_container = 0LL;
  self->_key = 0LL;

  self->_mergeableString = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PFMergeableStringProxy;
  -[PFMergeableStringProxy dealloc](&v3, sel_dealloc);
}

- (uint64_t)performOperation:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    [*(id *)(result + 8) willChangeValueForKey:*(void *)(result + 16)];
    SEL v4 = (void *)[*(id *)(v3 + 24) copy];

    *(void *)(v3 + 24) = 0LL;
    *(void *)(v3 + 24) = v4;

    if (a2) {
      (*(void (**)(uint64_t))(a2 + 16))(a2);
    }
    [*(id *)(v3 + 8) setPrimitiveValue:*(void *)(v3 + 24) forKey:*(void *)(v3 + 16)];
    return [*(id *)(v3 + 8) didChangeValueForKey:*(void *)(v3 + 16)];
  }

  return result;
}

- (void)appendString:(id)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __39__PFMergeableStringProxy_appendString___block_invoke;
  v3[3] = &unk_189EA7648;
  v3[4] = self;
  v3[5] = a3;
  -[PFMergeableStringProxy performOperation:]((uint64_t)self, (uint64_t)v3);
}

uint64_t __39__PFMergeableStringProxy_appendString___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) appendString:*(void *)(a1 + 40)];
}

- (void)insertString:(id)a3 atIndex:(unint64_t)a4
{
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __47__PFMergeableStringProxy_insertString_atIndex___block_invoke;
  v4[3] = &unk_189EA7B70;
  v4[4] = self;
  v4[5] = a3;
  v4[6] = a4;
  -[PFMergeableStringProxy performOperation:]((uint64_t)self, (uint64_t)v4);
}

uint64_t __47__PFMergeableStringProxy_insertString_atIndex___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 24) insertString:a1[5] atIndex:a1[6]];
}

- (void)removeSubrange:(_NSRange)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __41__PFMergeableStringProxy_removeSubrange___block_invoke;
  v3[3] = &unk_189EA7B98;
  v3[4] = self;
  _NSRange v4 = a3;
  -[PFMergeableStringProxy performOperation:]((uint64_t)self, (uint64_t)v3);
}

uint64_t __41__PFMergeableStringProxy_removeSubrange___block_invoke(void *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "removeSubrange:", a1[5], a1[6]);
}

- (void)replaceSubrange:(_NSRange)a3 withString:(id)a4
{
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __53__PFMergeableStringProxy_replaceSubrange_withString___block_invoke;
  v4[3] = &unk_189EA7BC0;
  _NSRange v5 = a3;
  v4[4] = self;
  v4[5] = a4;
  -[PFMergeableStringProxy performOperation:]((uint64_t)self, (uint64_t)v4);
}

uint64_t __53__PFMergeableStringProxy_replaceSubrange_withString___block_invoke(void *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "replaceSubrange:withString:", a1[6], a1[7], a1[5]);
}

- (void)setString:(id)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __36__PFMergeableStringProxy_setString___block_invoke;
  v3[3] = &unk_189EA7648;
  v3[4] = self;
  void v3[5] = a3;
  -[PFMergeableStringProxy performOperation:]((uint64_t)self, (uint64_t)v3);
}

uint64_t __36__PFMergeableStringProxy_setString___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) setString:*(void *)(a1 + 40)];
}

- (id)computedValue
{
  return (id)-[NSMergeableTransformableStringAttributeValue computedValue](self->_mergeableString, "computedValue");
}

- (void)merge:(id)a3
{
}

+ (BOOL)supportsMergeableTransformable
{
  return 1;
}

@end
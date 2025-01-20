@interface NSBlockPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4;
- (NSBlockPredicate)initWithBlock:(id)a3;
- (NSBlockPredicate)initWithCoder:(id)a3;
- (NSBlockPredicate)predicateWithSubstitutionVariables:(id)a3;
- (id)_predicateBlock;
- (id)copyWithZone:(_NSZone *)a3;
- (id)predicateFormat;
- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSBlockPredicate

- (NSBlockPredicate)initWithBlock:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSBlockPredicate;
  v4 = -[NSBlockPredicate init](&v6, sel_init);
  if (v4) {
    v4->_block = (id)[a3 copy];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSBlockPredicate)initWithCoder:(id)a3
{
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSBlockPredicate cannot be encoded or decoded" userInfo:0]);
  return (NSBlockPredicate *)-[NSBlockPredicate copyWithZone:](v3, v4, v5);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithBlock:self->_block];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  self->_block = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSBlockPredicate;
  -[NSBlockPredicate dealloc](&v3, sel_dealloc);
}

- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (!-[NSPredicate _allowsEvaluation](self, "_allowsEvaluation")) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"This predicate has evaluation disabled" userInfo:0]);
  }
  uint64_t v7 = (void *)MEMORY[0x186E1FF60]();
  if (!a4 || (v13 = (id *)a4, object_getClass(a4) != (Class)&OBJC_CLASS____NSNestedDictionary))
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    v14 = (objc_class *)objc_opt_class();
    v13 = (id *)&v17;
    object_setClass(&v17, v14);
    *(void *)&__int128 v18 = a4;
  }

  char v15 = (*((uint64_t (**)(id, id, id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void))self->_block
         + 2))( self->_block,  a3,  a4,  v8,  v9,  v10,  v11,  v12,  v17,  *((void *)&v17 + 1),  v18,  *((void *)&v18 + 1));
  if (v13 != a4) {

  }
  objc_autoreleasePoolPop(v7);
  return v15;
}

- (id)predicateFormat
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"BLOCKPREDICATE(%p)",  self->_block);
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
}

- (NSBlockPredicate)predicateWithSubstitutionVariables:(id)a3
{
  return (NSBlockPredicate *)(id)-[NSBlockPredicate copy](self, "copy", a3);
}

- (id)_predicateBlock
{
  return self->_block;
}

@end
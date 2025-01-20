@interface NSSortDescriptor
+ (BOOL)supportsSecureCoding;
+ (NSSortDescriptor)sortDescriptorWithKey:(NSString *)key ascending:(BOOL)ascending;
+ (NSSortDescriptor)sortDescriptorWithKey:(NSString *)key ascending:(BOOL)ascending comparator:(NSComparator)cmptr;
+ (NSSortDescriptor)sortDescriptorWithKey:(NSString *)key ascending:(BOOL)ascending selector:(SEL)selector;
+ (NSSortDescriptor)sortDescriptorWithKey:(id)a3;
+ (NSSortDescriptor)sortDescriptorWithKey:(id)a3 ascending:(BOOL)a4 reverseNullOrder:(BOOL)a5;
+ (id)_defaultSelectorName;
+ (void)initialize;
- (BOOL)_isEqualToSortDescriptor:(id)a3;
- (BOOL)ascending;
- (BOOL)isEqual:(id)a3;
- (BOOL)reverseNullOrder;
- (NSComparator)comparator;
- (NSComparisonResult)compareObject:(id)object1 toObject:(id)object2;
- (NSSortDescriptor)initWithCoder:(NSCoder *)coder;
- (NSSortDescriptor)initWithKey:(NSString *)key ascending:(BOOL)ascending;
- (NSSortDescriptor)initWithKey:(NSString *)key ascending:(BOOL)ascending comparator:(NSComparator)cmptr;
- (NSSortDescriptor)initWithKey:(NSString *)key ascending:(BOOL)ascending selector:(SEL)selector;
- (NSSortDescriptor)initWithKey:(id)a3;
- (NSSortDescriptor)initWithKey:(id)a3 ascending:(BOOL)a4 reverseNullOrder:(BOOL)a5;
- (NSSortDescriptor)initWithKey:(id)a3 ascending:(BOOL)a4 reverseNullOrder:(BOOL)a5 selector:(SEL)a6;
- (NSString)key;
- (SEL)selector;
- (id)_selectorName;
- (id)description;
- (id)replacementObjectForPortCoder:(id)a3;
- (id)reversedSortDescriptor;
- (void)_disallowEvaluation;
- (void)_setAscending:(BOOL)a3;
- (void)_setKey:(id)a3;
- (void)_setSelectorName:(id)a3;
- (void)allowEvaluation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setReverseNullOrder:(BOOL)a3;
@end

@implementation NSSortDescriptor

+ (void)initialize
{
  if (&OBJC_CLASS___NSSortDescriptor == a1) {
    _NSInternalCompareObject = (uint64_t)class_getMethodImplementation((Class)a1, sel_compareObject_toObject_);
  }
}

+ (NSSortDescriptor)sortDescriptorWithKey:(NSString *)key ascending:(BOOL)ascending
{
  return (NSSortDescriptor *)[a1 sortDescriptorWithKey:key ascending:ascending selector:sel_compare_];
}

+ (NSSortDescriptor)sortDescriptorWithKey:(NSString *)key ascending:(BOOL)ascending selector:(SEL)selector
{
  return (NSSortDescriptor *)(id)[objc_alloc((Class)a1) initWithKey:key ascending:ascending selector:selector];
}

+ (NSSortDescriptor)sortDescriptorWithKey:(id)a3
{
  return (NSSortDescriptor *)[a1 sortDescriptorWithKey:a3 ascending:1];
}

+ (NSSortDescriptor)sortDescriptorWithKey:(id)a3 ascending:(BOOL)a4 reverseNullOrder:(BOOL)a5
{
  return (NSSortDescriptor *)(id)[objc_alloc((Class)a1) initWithKey:a3 ascending:a4 reverseNullOrder:a5];
}

+ (NSSortDescriptor)sortDescriptorWithKey:(NSString *)key ascending:(BOOL)ascending comparator:(NSComparator)cmptr
{
  return (NSSortDescriptor *)(id)[objc_alloc((Class)a1) initWithKey:key ascending:ascending comparator:cmptr];
}

+ (id)_defaultSelectorName
{
  return @"compare:";
}

- (NSSortDescriptor)initWithKey:(NSString *)key ascending:(BOOL)ascending
{
  return -[NSSortDescriptor initWithKey:ascending:selector:]( self,  "initWithKey:ascending:selector:",  key,  ascending,  sel_compare_);
}

- (NSSortDescriptor)initWithKey:(id)a3
{
  return -[NSSortDescriptor initWithKey:ascending:](self, "initWithKey:ascending:", a3, 1LL);
}

- (NSSortDescriptor)initWithKey:(NSString *)key ascending:(BOOL)ascending selector:(SEL)selector
{
  return -[NSSortDescriptor initWithKey:ascending:reverseNullOrder:selector:]( self,  "initWithKey:ascending:reverseNullOrder:selector:",  key,  ascending,  0LL,  selector);
}

- (NSSortDescriptor)initWithKey:(id)a3 ascending:(BOOL)a4 reverseNullOrder:(BOOL)a5
{
  return -[NSSortDescriptor initWithKey:ascending:reverseNullOrder:selector:]( self,  "initWithKey:ascending:reverseNullOrder:selector:",  a3,  a4,  a5,  0LL);
}

- (NSSortDescriptor)initWithKey:(id)a3 ascending:(BOOL)a4 reverseNullOrder:(BOOL)a5 selector:(SEL)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v16 = *MEMORY[0x1895F89C0];
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___NSSortDescriptor;
  v10 = -[NSSortDescriptor init](&v15, sel_init);
  if (v10)
  {
    uint64_t v11 = [a3 length];
    if (v11) {
      uint64_t v11 = [a3 copy];
    }
    uint64_t v12 = 8LL;
    if (!v7) {
      uint64_t v12 = 0LL;
    }
    v10->_sortDescriptorFlags |= v12 | v8;
    v10->_key = (NSString *)v11;
    SEL v13 = sel_compare_;
    if (a6) {
      SEL v13 = a6;
    }
    v10->_selector = v13;
    v10->_selectorOrBlock = 0LL;
  }

  return v10;
}

- (NSSortDescriptor)initWithKey:(NSString *)key ascending:(BOOL)ascending comparator:(NSComparator)cmptr
{
  BOOL v6 = ascending;
  uint64_t v12 = *MEMORY[0x1895F89C0];
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NSSortDescriptor;
  BOOL v8 = -[NSSortDescriptor init](&v11, sel_init);
  if (v8)
  {
    uint64_t v9 = -[NSString length](key, "length");
    if (v9) {
      uint64_t v9 = -[NSString copy](key, "copy");
    }
    v8->_sortDescriptorFlags |= v6 | 2LL;
    v8->_key = (NSString *)v9;
    v8->_selector = 0LL;
    v8->_selectorOrBlock = (id)[cmptr copy];
  }

  return v8;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSortDescriptor;
  -[NSSortDescriptor dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if ((self->_sortDescriptorFlags & 2) != 0) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSSortDescriptor using Blocks cannot be encoded." userInfo:0]);
  }
  BOOL v5 = -[NSSortDescriptor ascending](self, "ascending");
  BOOL v11 = v5;
  BOOL v6 = -[NSSortDescriptor reverseNullOrder](self, "reverseNullOrder");
  id v7 = -[NSSortDescriptor _selectorName](self, "_selectorName");
  int v8 = [a3 allowsKeyedCoding];
  key = self->_key;
  if (v8)
  {
    if (key) {
      [a3 encodeObject:key forKey:@"NSKey"];
    }
    [a3 encodeBool:v5 forKey:@"NSAscending"];
    if (v7) {
      [a3 encodeObject:v7 forKey:@"NSSelector"];
    }
    [a3 encodeBool:v6 forKey:@"NSReverseNullOrder"];
  }

  else
  {
    [a3 encodeObject:key];
    objc_msgSend(a3, "encodeValuesOfObjCTypes:", "c", &v11);
    if (v6)
    {
      v10 = (os_log_s *)_NSOSLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( &dword_182EB1000,  v10,  OS_LOG_TYPE_ERROR,  "NSCoding is deprecated, and does not support NSSortDescriptor's reverseNullOrder property.  Please use keyed a rchiving instead.",  buf,  2u);
      }
    }

    [a3 encodeObject:v7];
  }

- (void)allowEvaluation
{
  self->_sortDescriptorFlags &= ~4uLL;
}

- (void)_disallowEvaluation
{
  self->_sortDescriptorFlags |= 4uLL;
}

- (NSSortDescriptor)initWithCoder:(NSCoder *)coder
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  BOOL v14 = 0;
  if (!-[NSCoder allowsKeyedCoding](coder, "allowsKeyedCoding"))
  {
    id v5 = -[NSCoder decodeObject](coder, "decodeObject");
    -[NSCoder decodeValuesOfObjCTypes:](coder, "decodeValuesOfObjCTypes:", "c", &v14);
    id v8 = -[NSCoder decodeObject](coder, "decodeObject");
    BOOL v7 = 0;
    BOOL v9 = 0;
    BOOL v6 = v14;
    goto LABEL_8;
  }

  id v5 = -[NSCoder decodeObjectOfClass:forKey:](coder, "decodeObjectOfClass:forKey:", objc_opt_class(), @"NSKey");
  if (v5)
  {
    if ((_NSIsNSString() & 1) != 0) {
      goto LABEL_4;
    }
LABEL_15:

    uint64_t v12 = @"Sort descriptor key is not a string";
LABEL_18:
    -[NSCoder failWithError:]( coder,  "failWithError:",  +[NSError _readCorruptErrorWithFormat:](&OBJC_CLASS___NSError, "_readCorruptErrorWithFormat:", v12));
    return 0LL;
  }

  if (-[NSCoder error](coder, "error")) {
    goto LABEL_15;
  }
LABEL_4:
  BOOL v6 = -[NSCoder decodeBoolForKey:](coder, "decodeBoolForKey:", @"NSAscending");
  BOOL v14 = v6;
  BOOL v7 = -[NSCoder decodeBoolForKey:](coder, "decodeBoolForKey:", @"NSReverseNullOrder");
  id v8 = -[NSCoder decodeObjectOfClass:forKey:]( coder,  "decodeObjectOfClass:forKey:",  objc_opt_class(),  @"NSSelector");
  if (!v8)
  {
    if (!-[NSCoder error](coder, "error")) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }

  if ((_NSIsNSString() & 1) == 0)
  {
LABEL_17:

    uint64_t v12 = @"Sort descriptor selector name is not a string";
    goto LABEL_18;
  }

- (void)_setKey:(id)a3
{
  key = self->_key;
  if (key != a3)
  {

    self->_key = (NSString *)[a3 copy];
  }

- (NSString)key
{
  return self->_key;
}

- (void)_setAscending:(BOOL)a3
{
  self->_sortDescriptorFlags |= a3;
}

- (BOOL)ascending
{
  return self->_sortDescriptorFlags & 1;
}

- (void)setReverseNullOrder:(BOOL)a3
{
  uint64_t v3 = 8LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_sortDescriptorFlags |= v3;
}

- (BOOL)reverseNullOrder
{
  return (LOBYTE(self->_sortDescriptorFlags) >> 3) & 1;
}

- (SEL)selector
{
  if ((self->_sortDescriptorFlags & 2) != 0) {
    return 0LL;
  }
  SEL result = self->_selector;
  if (!result)
  {
    SEL result = (SEL)self->_selectorOrBlock;
    if (result)
    {
      SEL result = NSSelectorFromString((NSString *)result);
      self->_selector = result;
    }
  }

  return result;
}

- (NSComparator)comparator
{
  if ((self->_sortDescriptorFlags & 2) != 0) {
    return self->_selectorOrBlock;
  }
  else {
    return 0LL;
  }
}

- (void)_setSelectorName:(id)a3
{
  if ((self->_sortDescriptorFlags & 2) == 0)
  {
    id selectorOrBlock = self->_selectorOrBlock;
    if (selectorOrBlock != a3)
    {

      BOOL v6 = (void *)[a3 copy];
      self->_selector = 0LL;
      self->_id selectorOrBlock = v6;
    }
  }

- (id)_selectorName
{
  if ((self->_sortDescriptorFlags & 2) != 0) {
    return 0LL;
  }
  if (self->_selector) {
    return NSStringFromSelector(self->_selector);
  }
  return self->_selectorOrBlock;
}

- (id)description
{
  unint64_t sortDescriptorFlags = self->_sortDescriptorFlags;
  if (self->_key) {
    key = self->_key;
  }
  else {
    key = (NSString *)&stru_189CA6A28;
  }
  if (-[NSSortDescriptor ascending](self, "ascending")) {
    id v5 = @"ascending";
  }
  else {
    id v5 = @"descending";
  }
  BOOL v6 = -[NSSortDescriptor reverseNullOrder](self, "reverseNullOrder");
  if ((sortDescriptorFlags & 2) != 0)
  {
    if (v6)
    {
      BOOL v8 = -[NSSortDescriptor ascending](self, "ascending");
      BOOL v9 = @"NULLS FIRST";
      if (v8) {
        BOOL v9 = @"NULLS LAST";
      }
    }

    else
    {
      BOOL v9 = @"NO";
    }

    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(%@, %@, %@, BLOCK(%p))",  key,  v5,  v9,  self->_selectorOrBlock);
  }

  else
  {
    if (v6)
    {
      if (-[NSSortDescriptor ascending](self, "ascending")) {
        BOOL v7 = @"NULLS LAST";
      }
      else {
        BOOL v7 = @"NULLS FIRST";
      }
    }

    else
    {
      BOOL v7 = @"NO";
    }

    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(%@, %@, %@, %@)",  key,  v5,  v7,  -[NSSortDescriptor _selectorName](self, "_selectorName"));
  }

- (NSComparisonResult)compareObject:(id)object1 toObject:(id)object2
{
  if ((self->_sortDescriptorFlags & 4) != 0)
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Sort descriptor was decoded from a secure archive and local evaluation is not enabled." userInfo:0]);
    return _NSNullCompare(v12, v13, v14);
  }

  else
  {
    BOOL v7 = -[NSSortDescriptor selector](self, "selector");
    id v8 = (id)[MEMORY[0x189603FE8] null];
    if (self->_key)
    {
      object1 = (id)objc_msgSend(object1, "valueForKeyPath:");
      if (self->_key) {
        object2 = (id)objc_msgSend(object2, "valueForKeyPath:");
      }
    }

    if (object1 == v8) {
      object1 = 0LL;
    }
    if (object1)
    {
      if ((self->_sortDescriptorFlags & 2) != 0)
      {
        BOOL v7 = 0LL;
        id selectorOrBlock = self->_selectorOrBlock;
      }

      else
      {
        BOOL v9 = (objc_class *)objc_opt_class();
        id selectorOrBlock = class_getMethodImplementation(v9, v7);
      }
    }

    else
    {
      BOOL v7 = sel_compare_;
      id selectorOrBlock = _NSNullCompare;
    }

    if (object2 == v8) {
      object2 = 0LL;
    }
    return _NSCompareObject( (uint64_t)object1,  (uint64_t)object2,  (uint64_t)selectorOrBlock,  (uint64_t)v7,  -[NSSortDescriptor ascending](self, "ascending"),  -[NSSortDescriptor reverseNullOrder](self, "reverseNullOrder"));
  }

- (id)reversedSortDescriptor
{
  unint64_t sortDescriptorFlags = self->_sortDescriptorFlags;
  uint64_t v4 = (void *)objc_opt_class();
  id v5 = -[NSSortDescriptor key](self, "key");
  uint64_t v6 = -[NSSortDescriptor ascending](self, "ascending") ^ 1;
  if ((sortDescriptorFlags & 2) != 0) {
    return (id)objc_msgSend( v4,  "sortDescriptorWithKey:ascending:comparator:",  v5,  v6,  -[NSSortDescriptor comparator](self, "comparator"));
  }
  else {
    return (id)objc_msgSend( v4,  "sortDescriptorWithKey:ascending:selector:",  v5,  v6,  -[NSSortDescriptor selector](self, "selector"));
  }
}

- (BOOL)_isEqualToSortDescriptor:(id)a3
{
  int v5 = -[NSSortDescriptor ascending](self, "ascending");
  if (v5 == [a3 ascending]
    && (int v6 = -[NSSortDescriptor reverseNullOrder](self, "reverseNullOrder"),
        v6 == [a3 reverseNullOrder]))
  {
    v10 = -[NSSortDescriptor key](self, "key");
    BOOL v7 = v10 == (NSString *)[a3 key]
      || -[NSString isEqualToString:](-[NSSortDescriptor key](self, "key"), "isEqualToString:", [a3 key]);
  }

  else
  {
    BOOL v7 = 0;
  }

  if ((self->_sortDescriptorFlags & 2) != 0) {
    char v8 = self->_selectorOrBlock == (id)*((void *)a3 + 4);
  }
  else {
    char v8 = objc_msgSend( -[NSSortDescriptor _selectorName](self, "_selectorName"),  "isEqualToString:",  objc_msgSend(a3, "_selectorName"));
  }
  return v7 & v8;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (a3 && (objc_opt_isKindOfClass() & 1) != 0) {
    return -[NSSortDescriptor _isEqualToSortDescriptor:](self, "_isEqualToSortDescriptor:", a3);
  }
  return 0;
}

- (id)replacementObjectForPortCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if ([a3 isByref])
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___NSSortDescriptor;
    return -[NSSortDescriptor replacementObjectForPortCoder:](&v6, sel_replacementObjectForPortCoder_, a3);
  }

  return self;
}

@end
@interface NSCompoundPredicate
+ (BOOL)supportsSecureCoding;
+ (NSCompoundPredicate)andPredicateWithSubpredicates:(NSArray *)subpredicates;
+ (NSCompoundPredicate)notPredicateWithSubpredicate:(NSPredicate *)predicate;
+ (NSCompoundPredicate)orPredicateWithSubpredicates:(NSArray *)subpredicates;
+ (id)_operatorForType:(unint64_t)a3;
- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)subpredicates;
- (NSCompoundPredicate)initWithCoder:(NSCoder *)coder;
- (NSCompoundPredicate)initWithType:(NSCompoundPredicateType)type subpredicates:(NSArray *)subpredicates;
- (NSCompoundPredicate)predicateWithSubstitutionVariables:(id)a3;
- (NSCompoundPredicateType)compoundPredicateType;
- (id)_copySubpredicateDescription:(id)a3;
- (id)_predicateOperator;
- (id)copyWithZone:(_NSZone *)a3;
- (id)generateMetadataDescription;
- (id)predicateFormat;
- (unint64_t)hash;
- (void)_acceptSubpredicates:(id)a3 flags:(unint64_t)a4;
- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4;
- (void)allowEvaluation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSCompoundPredicate

+ (NSCompoundPredicate)andPredicateWithSubpredicates:(NSArray *)subpredicates
{
  return (NSCompoundPredicate *)(id)[objc_alloc((Class)a1) initWithType:1 subpredicates:subpredicates];
}

+ (NSCompoundPredicate)orPredicateWithSubpredicates:(NSArray *)subpredicates
{
  return (NSCompoundPredicate *)(id)[objc_alloc((Class)a1) initWithType:2 subpredicates:subpredicates];
}

+ (NSCompoundPredicate)notPredicateWithSubpredicate:(NSPredicate *)predicate
{
  id v4 = objc_alloc((Class)a1);
  return (NSCompoundPredicate *)(id)objc_msgSend( v4,  "initWithType:subpredicates:",  0,  objc_msgSend(MEMORY[0x189603FA8], "arrayWithObject:", predicate));
}

+ (id)_operatorForType:(unint64_t)a3
{
  if (a3 == 2) {
    return +[NSCompoundPredicateOperator orPredicateOperator]( &OBJC_CLASS___NSCompoundPredicateOperator,  "orPredicateOperator");
  }
  if (a3 == 1) {
    return +[NSCompoundPredicateOperator andPredicateOperator]( &OBJC_CLASS___NSCompoundPredicateOperator,  "andPredicateOperator");
  }
  if (a3) {
    return 0LL;
  }
  return +[NSCompoundPredicateOperator notPredicateOperator]( &OBJC_CLASS___NSCompoundPredicateOperator,  "notPredicateOperator");
}

- (NSCompoundPredicate)initWithType:(NSCompoundPredicateType)type subpredicates:(NSArray *)subpredicates
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (type || subpredicates && -[NSArray count](subpredicates, "count"))
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___NSCompoundPredicate;
    v7 = -[NSCompoundPredicate init](&v12, sel_init);
    v8 = v7;
    if (v7)
    {
      v7->_type = type;
      v7->_subpredicates = (NSArray *)-[NSArray copy](subpredicates, "copy");
    }

    return v8;
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"Tried to construct NSCompoundPredicate for NSNotPredicateType with %@", subpredicates), 0 reason userInfo]);
    return (NSCompoundPredicate *)+[NSCompoundPredicate supportsSecureCoding](v10, v11);
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)allowEvaluation
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  subpredicates = self->_subpredicates;
  uint64_t v4 = -[NSArray countByEnumeratingWithState:objects:count:]( subpredicates,  "countByEnumeratingWithState:objects:count:",  &v10,  v9,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(subpredicates);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) allowEvaluation];
      }

      uint64_t v5 = -[NSArray countByEnumeratingWithState:objects:count:]( subpredicates,  "countByEnumeratingWithState:objects:count:",  &v10,  v9,  16LL);
    }

    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSCompoundPredicate;
  -[NSPredicate allowEvaluation](&v8, sel_allowEvaluation);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPredicates and NSExpressions cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSCompoundPredicate;
  -[NSPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
  objc_msgSend( a3,  "encodeObject:forKey:",  -[NSCompoundPredicate subpredicates](self, "subpredicates"),  @"NSSubpredicates");
  objc_msgSend( a3,  "encodeInteger:forKey:",  -[NSCompoundPredicate compoundPredicateType](self, "compoundPredicateType"),  @"NSCompoundPredicateType");
}

- (NSCompoundPredicate)initWithCoder:(NSCoder *)coder
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if (!-[NSCoder allowsKeyedCoding](coder, "allowsKeyedCoding"))
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers" userInfo:0]);
  }

  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___NSCompoundPredicate;
  objc_super v5 = -[NSPredicate initWithCoder:](&v19, sel_initWithCoder_, coder);
  if (!v5) {
    return v5;
  }
  uint64_t v6 = -[NSCoder allowedClasses](coder, "allowedClasses");
  uint64_t v7 = -[NSSet count](v6, "count");
  if (v7)
  {
    id v8 = (id)-[NSSet mutableCopy](v6, "mutableCopy");
    objc_msgSend( v8,  "unionSet:",  +[_NSPredicateUtilities _compoundPredicateClassesForSecureCoding]( _NSPredicateUtilities,  "_compoundPredicateClassesForSecureCoding"));
  }

  else
  {
    id v8 = +[_NSPredicateUtilities _compoundPredicateClassesForSecureCoding]( &OBJC_CLASS____NSPredicateUtilities,  "_compoundPredicateClassesForSecureCoding");
  }

  v5->_type = -[NSCoder decodeIntegerForKey:](coder, "decodeIntegerForKey:", @"NSCompoundPredicateType");
  v5->_subpredicates = (NSArray *) -[NSCoder decodeObjectOfClasses:forKey:]( coder,  "decodeObjectOfClasses:forKey:",  v8,  @"NSSubpredicates");
  if ((_NSIsNSSet() & 1) == 0 && (_NSIsNSArray() & 1) == 0 && (_NSIsNSOrderedSet() & 1) == 0)
  {
    v9 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidUnarchiveOperationException" reason:@"Malformed set expression (bad subpredicatees)" userInfo:0];
    if (v9) {
      goto LABEL_19;
    }
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  subpredicates = v5->_subpredicates;
  uint64_t v11 = -[NSArray countByEnumeratingWithState:objects:count:]( subpredicates,  "countByEnumeratingWithState:objects:count:",  &v21,  v20,  16LL);
  if (!v11)
  {
LABEL_18:
    v9 = 0LL;
LABEL_19:
    if (v7) {
LABEL_20:
    }

    goto LABEL_21;
  }

  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v22;
LABEL_12:
  uint64_t v14 = 0LL;
  while (1)
  {
    if (*(void *)v22 != v13) {
      objc_enumerationMutation(subpredicates);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    if (v12 == ++v14)
    {
      uint64_t v12 = -[NSArray countByEnumeratingWithState:objects:count:]( subpredicates,  "countByEnumeratingWithState:objects:count:",  &v21,  v20,  16LL);
      if (v12) {
        goto LABEL_12;
      }
      goto LABEL_18;
    }
  }

  v9 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidUnarchiveOperationException" reason:@"Malformed set expression (bad subpredicate)" userInfo:0];
  if (v7) {
    goto LABEL_20;
  }
LABEL_21:
  if (!v9) {
    return v5;
  }

  objc_exception_throw(v9);
  return (NSCompoundPredicate *)-[NSCompoundPredicate copyWithZone:](v16, v17, v18);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v4 = -[NSCompoundPredicate subpredicates](self, "subpredicates", a3);
  objc_super v5 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:0];
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v14,  v13,  16LL);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        __int128 v10 = (void *)[*(id *)(*((void *)&v14 + 1) + 8 * v9) copy];
        [v5 addObject:v10];

        ++v9;
      }

      while (v7 != v9);
      uint64_t v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v14,  v13,  16LL);
    }

    while (v7);
  }

  uint64_t v11 = (void *)objc_msgSend( objc_alloc((Class)objc_opt_class()),  "initWithType:subpredicates:",  -[NSCompoundPredicate compoundPredicateType](self, "compoundPredicateType"),  v5);

  return v11;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  self->_subpredicates = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSCompoundPredicate;
  -[NSCompoundPredicate dealloc](&v3, sel_dealloc);
}

- (NSCompoundPredicateType)compoundPredicateType
{
  return self->_type;
}

- (id)_predicateOperator
{
  return (id)objc_msgSend( (id)objc_opt_class(),  "_operatorForType:",  -[NSCompoundPredicate compoundPredicateType](self, "compoundPredicateType"));
}

- (NSArray)subpredicates
{
  return self->_subpredicates;
}

- (id)_copySubpredicateDescription:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    return -[NSString initWithFormat:]( [NSString alloc],  "initWithFormat:",  @"(%@)",  [a3 description]);
  }
  else {
    return (id)[a3 description];
  }
}

- (id)predicateFormat
{
  objc_super v3 = (void *)MEMORY[0x186E1FF60](self, a2);
  uint64_t v4 = objc_msgSend(-[NSCompoundPredicate _predicateOperator](self, "_predicateOperator"), "description");
  objc_super v5 = -[NSCompoundPredicate subpredicates](self, "subpredicates");
  uint64_t v6 = -[NSArray count](v5, "count");
  NSCompoundPredicateType v7 = -[NSCompoundPredicate compoundPredicateType](self, "compoundPredicateType");
  NSCompoundPredicateType v8 = v7;
  if (v6 == 1)
  {
    __int128 v10 = -[NSArray objectAtIndex:](v5, "objectAtIndex:", 0LL);
    uint64_t v11 = v10;
    if (v8 == NSNotPredicateType)
    {
      id v21 = -[NSCompoundPredicate _copySubpredicateDescription:](self, "_copySubpredicateDescription:", v10);
      v20 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@ %@", v4, v21);

      goto LABEL_18;
    }

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (NSCompoundPredicateType v5 = -[NSCompoundPredicate compoundPredicateType](self, "compoundPredicateType"),
        v5 == [a3 compoundPredicateType]))
  {
    return -[NSArray isEqual:]( -[NSCompoundPredicate subpredicates](self, "subpredicates"),  "isEqual:",  [a3 subpredicates]);
  }

  else
  {
    return 0;
  }

- (unint64_t)hash
{
  return -[NSArray hash](-[NSCompoundPredicate subpredicates](self, "subpredicates"), "hash");
}

- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (!-[NSPredicate _allowsEvaluation](self, "_allowsEvaluation")) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"This predicate has evaluation disabled" userInfo:0]);
  }
  NSCompoundPredicateType v7 = (void *)MEMORY[0x186E1FF60]();
  if (!a4 || (NSCompoundPredicateType v8 = (id *)a4, object_getClass(a4) != (Class)&OBJC_CLASS____NSNestedDictionary))
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    uint64_t v9 = (objc_class *)objc_opt_class();
    NSCompoundPredicateType v8 = (id *)&v14;
    object_setClass(&v14, v9);
    *(void *)&__int128 v15 = a4;
  }

  id v10 = -[NSCompoundPredicate _predicateOperator](self, "_predicateOperator", v14, v15, v16, v17, v18, v19);
  uint64_t v11 = -[NSCompoundPredicate subpredicates](self, "subpredicates");
  char v12 = 0;
  if (v10 && v11) {
    char v12 = [v10 evaluatePredicates:v11 withObject:a3 substitutionVariables:v8];
  }
  if (v8 != a4) {

  }
  objc_autoreleasePoolPop(v7);
  return v12;
}

- (void)_acceptSubpredicates:(id)a3 flags:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v6 = -[NSCompoundPredicate subpredicates](self, "subpredicates");
  uint64_t v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v12,  v11,  16LL);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v10++) acceptVisitor:a3 flags:a4];
      }

      while (v8 != v10);
      uint64_t v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v12,  v11,  16LL);
    }

    while (v8);
  }

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  uint64_t v7 = (void *)MEMORY[0x186E1FF60](self, a2);
  if ((a4 & 4) != 0)
  {
    [a3 visitPredicate:self];
    -[NSCompoundPredicate _acceptSubpredicates:flags:](self, "_acceptSubpredicates:flags:", a3, a4);
  }

  else
  {
    -[NSCompoundPredicate _acceptSubpredicates:flags:](self, "_acceptSubpredicates:flags:", a3, a4);
    [a3 visitPredicate:self];
  }

  objc_autoreleasePoolPop(v7);
}

- (NSCompoundPredicate)predicateWithSubstitutionVariables:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (!a3) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Cannot substitute a nil substitution dictionary." userInfo:0]);
  }
  id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
  uint64_t v6 = (void *)MEMORY[0x186E1FF60]();
  uint64_t v7 = -[NSCompoundPredicate subpredicates](self, "subpredicates");
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v15,  v14,  16LL);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend( v5,  "addObject:",  objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v11++), "predicateWithSubstitutionVariables:", a3));
      }

      while (v9 != v11);
      uint64_t v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v15,  v14,  16LL);
    }

    while (v9);
  }

  objc_autoreleasePoolPop(v6);
  __int128 v12 = (NSCompoundPredicate *)(id)objc_msgSend( objc_alloc((Class)objc_opt_class()),  "initWithType:subpredicates:",  -[NSCompoundPredicate compoundPredicateType]( self,  "compoundPredicateType"),  v5);

  return v12;
}

- (id)generateMetadataDescription
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  NSCompoundPredicateType v3 = -[NSCompoundPredicate compoundPredicateType](self, "compoundPredicateType");
  uint64_t v4 = -[NSCompoundPredicate subpredicates](self, "subpredicates");
  id v5 = v4;
  if (v3 == NSOrPredicateType)
  {
    if (-[NSArray count](v4, "count") > 1)
    {
      id v7 = (id)objc_opt_new();
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      uint64_t v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v25,  v24,  16LL);
      if (v8)
      {
        uint64_t v9 = v8;
        char v10 = 0;
        uint64_t v11 = *(void *)v26;
        do
        {
          for (uint64_t i = 0LL; i != v9; ++i)
          {
            if (*(void *)v26 != v11) {
              objc_enumerationMutation(v5);
            }
            __int128 v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            if ((v10 & 1) != 0) {
              [v7 appendString:@" || "];
            }
            [v7 appendFormat:@"(%@)", objc_msgSend(v13, "generateMetadataDescription")];
            char v10 = 1;
          }

          uint64_t v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v25,  v24,  16LL);
        }

        while (v9);
      }

      return +[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v7);
    }

    uint64_t v20 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSOrPredicateType NSCompoundPredicate with wrong number (%ld) of subpredicates given to NSMetadataQuery (%@)",  -[NSArray count](v5, "count"),  self);
  }

  else
  {
    if (v3 != NSAndPredicateType)
    {
      if (v3)
      {
        uint64_t v20 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown type of NSCompoundPredicate given to NSMetadataQuery (%@)",  self,  v23);
      }

      else
      {
        if (-[NSArray count](v4, "count") == 1) {
          return +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"! (%@)",  objc_msgSend(-[NSArray objectAtIndex:](v5, "objectAtIndex:", 0), "generateMetadataDescription"));
        }
        uint64_t v20 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSNotPredicateType NSCompoundPredicate with wrong number (%ld) of subpredicates given to NSMetadataQuery (%@)",  -[NSArray count](v5, "count"),  self);
      }

      goto LABEL_32;
    }

    if (-[NSArray count](v4, "count") > 1)
    {
      id v7 = (id)objc_opt_new();
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      uint64_t v14 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v30,  v29,  16LL);
      if (v14)
      {
        uint64_t v15 = v14;
        char v16 = 0;
        uint64_t v17 = *(void *)v31;
        do
        {
          for (uint64_t j = 0LL; j != v15; ++j)
          {
            if (*(void *)v31 != v17) {
              objc_enumerationMutation(v5);
            }
            uint64_t v19 = *(void **)(*((void *)&v30 + 1) + 8 * j);
            if ((v16 & 1) != 0) {
              [v7 appendString:@" && "];
            }
            [v7 appendFormat:@"(%@)", objc_msgSend(v19, "generateMetadataDescription")];
            char v16 = 1;
          }

          uint64_t v15 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v30,  v29,  16LL);
        }

        while (v15);
      }

      return +[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v7);
    }

    uint64_t v20 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSAndPredicateType NSCompoundPredicate with wrong number (%ld) of subpredicates given to NSMetadataQuery (%@)",  -[NSArray count](v5, "count"),  self);
  }

@end
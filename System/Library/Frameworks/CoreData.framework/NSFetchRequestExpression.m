@interface NSFetchRequestExpression
+ (BOOL)supportsSecureCoding;
+ (NSExpression)expressionForFetch:(NSExpression *)fetch context:(NSExpression *)context countOnly:(BOOL)countFlag;
- (BOOL)isCountOnlyRequest;
- (BOOL)isEqual:(id)a3;
- (NSExpression)contextExpression;
- (NSExpression)requestExpression;
- (NSFetchRequestExpression)initWithCoder:(id)a3;
- (id)_expressionWithSubstitutionVariables:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)expressionValueWithObject:(id)a3 context:(id)a4;
- (id)initForFetch:(id)a3 context:(id)a4 countOnly:(BOOL)a5;
- (unint64_t)expressionType;
- (unint64_t)hash;
- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4;
- (void)allowEvaluation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSFetchRequestExpression

- (id)initForFetch:(id)a3 context:(id)a4 countOnly:(BOOL)a5
{
  BOOL v5 = a5;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSFetchRequestExpression;
  v8 = -[NSFetchRequestExpression initWithExpressionType:](&v10, sel_initWithExpressionType_, 50LL);
  if (v8)
  {
    v8->_fetchRequest = (NSExpression *)a3;
    v8->_managedObjectContext = (NSExpression *)a4;
    v8->_flags = (_fetchExpressionFlags)(*(_DWORD *)&v8->_flags & 0xFFFFFFFE | v5);
  }

  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFetchRequestExpression;
  -[NSFetchRequestExpression dealloc](&v3, sel_dealloc);
}

+ (NSExpression)expressionForFetch:(NSExpression *)fetch context:(NSExpression *)context countOnly:(BOOL)countFlag
{
  return (NSExpression *) -[NSFetchRequestExpression initForFetch:context:countOnly:]( objc_alloc(&OBJC_CLASS___NSFetchRequestExpression),  "initForFetch:context:countOnly:",  fetch,  context,  countFlag);
}

- (NSExpression)requestExpression
{
  return self->_fetchRequest;
}

- (NSExpression)contextExpression
{
  return self->_managedObjectContext;
}

- (BOOL)isCountOnlyRequest
{
  return *(_DWORD *)&self->_flags & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)allowEvaluation
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFetchRequestExpression;
  -[NSFetchRequestExpression allowEvaluation](&v3, sel_allowEvaluation);
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSFetchRequestExpression;
  -[NSFetchRequestExpression encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeObject:self->_fetchRequest forKey:@"NSFRExpression"];
  [a3 encodeObject:self->_managedObjectContext forKey:@"NSMOCExpression"];
  [a3 encodeBool:*(_DWORD *)&self->_flags & 1 forKey:@"NSCountOnlyFlag"];
}

- (NSFetchRequestExpression)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSFetchRequestExpression;
  v4 = -[NSFetchRequestExpression initWithCoder:](&v8, sel_initWithCoder_);
  if (v4)
  {
    v4->_fetchRequest = (NSExpression *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSFRExpression"];
    objc_super v5 = (void *)MEMORY[0x189604010];
    uint64_t v6 = objc_opt_class();
    v4->_managedObjectContext = (NSExpression *)(id)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend( v5,  "setWithObjects:",  v6,  objc_opt_class(),  0),  @"NSMOCExpression");
    v4->_flags = (_fetchExpressionFlags)(*(_DWORD *)&v4->_flags & 0xFFFFFFFE | [a3 decodeBoolForKey:@"NSCountOnlyFlag"]);
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NSFetchRequestExpression initForFetch:context:countOnly:]( objc_alloc(&OBJC_CLASS___NSFetchRequestExpression),  "initForFetch:context:countOnly:",  self->_fetchRequest,  self->_managedObjectContext,  *(_DWORD *)&self->_flags & 1);
}

- (id)expressionValueWithObject:(id)a3 context:(id)a4
{
  uint64_t v6 = self;
  if ((-[NSFetchRequestExpression _allowsEvaluation](self, "_allowsEvaluation") & 1) != 0)
  {
    id v7 =  -[NSExpression expressionValueWithObject:context:]( v6->_fetchRequest,  "expressionValueWithObject:context:",  a3,  a4);
    id v8 = -[NSExpression expressionValueWithObject:context:]( v6->_managedObjectContext,  "expressionValueWithObject:context:",  a3,  a4);
    if (v7) {
      BOOL v9 = v8 == 0LL;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      int v10 = 1;
    }

    else
    {
      uint64_t v15 = 0LL;
      if ((*(_BYTE *)&v6->_flags & 1) != 0)
      {
        uint64_t v12 = [v8 countForFetchRequest:v7 error:&v15];
        if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v13 = 0LL;
        }
        else {
          uint64_t v13 = v12;
        }
        uint64_t v6 = (NSFetchRequestExpression *)[MEMORY[0x189607968] numberWithUnsignedLong:v13];
      }

      else
      {
        uint64_t v11 = [v8 executeFetchRequest:v7 error:&v15];
        if (v11) {
          uint64_t v6 = (NSFetchRequestExpression *)v11;
        }
        else {
          uint64_t v6 = (NSFetchRequestExpression *)NSArray_EmptyArray;
        }
      }

      int v10 = 0;
    }

    if (v10)
    {
      [MEMORY[0x189603F70] raise:*MEMORY[0x189603A58] format:@"NSFetchRequestExpression could not evaluate its request or context."];
      return 0LL;
    }

    return v6;
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"This expression has evaluation disabled" userInfo:0]);
    objc_exception_rethrow();
    __break(1u);
  }

  return result;
}

- (id)description
{
  if (self)
  {
    if ((*((_DWORD *)self + 18) & 1) != 0) {
      v2 = @"YES";
    }
    else {
      v2 = @"NO";
    }
    return (id)[NSString stringWithFormat:@"FETCH(%@, %@, %@)", *((void *)self + 7), *((void *)self + 8), v2];
  }

  return self;
}

- (unint64_t)expressionType
{
  return 50LL;
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (int v5 = -[NSFetchRequestExpression isCountOnlyRequest](self, "isCountOnlyRequest"),
        v5 == [a3 isCountOnlyRequest])
    && -[NSExpression isEqual:]( -[NSFetchRequestExpression requestExpression](self, "requestExpression"),  "isEqual:",  [a3 requestExpression]))
  {
    return -[NSExpression isEqual:]( -[NSFetchRequestExpression contextExpression](self, "contextExpression"),  "isEqual:",  [a3 contextExpression]);
  }

  else
  {
    return 0;
  }

- (unint64_t)hash
{
  uint64_t v3 = -[NSExpression hash](-[NSFetchRequestExpression requestExpression](self, "requestExpression"), "hash");
  return -[NSExpression hash](-[NSFetchRequestExpression contextExpression](self, "contextExpression"), "hash") ^ v3;
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  if ((a4 & 1) != 0)
  {
    if ((a4 & 4) != 0)
    {
      [a3 visitPredicateExpression:self];
      -[NSExpression acceptVisitor:flags:]( -[NSFetchRequestExpression requestExpression](self, "requestExpression"),  "acceptVisitor:flags:",  a3,  a4);
      -[NSExpression acceptVisitor:flags:]( -[NSFetchRequestExpression contextExpression](self, "contextExpression"),  "acceptVisitor:flags:",  a3,  a4);
    }

    else
    {
      -[NSExpression acceptVisitor:flags:]( -[NSFetchRequestExpression requestExpression](self, "requestExpression"),  "acceptVisitor:flags:",  a3,  a4);
      -[NSExpression acceptVisitor:flags:]( -[NSFetchRequestExpression contextExpression](self, "contextExpression"),  "acceptVisitor:flags:",  a3,  a4);
      [a3 visitPredicateExpression:self];
    }
  }

- (id)_expressionWithSubstitutionVariables:(id)a3
{
  if (a3) {
    return  -[NSFetchRequestExpression initForFetch:context:countOnly:]( objc_alloc(&OBJC_CLASS___NSFetchRequestExpression),  "initForFetch:context:countOnly:",  -[NSExpression _expressionWithSubstitutionVariables:]( -[NSFetchRequestExpression requestExpression](self, "requestExpression"),  "_expressionWithSubstitutionVariables:",  a3),  -[NSExpression _expressionWithSubstitutionVariables:]( -[NSFetchRequestExpression contextExpression](self, "contextExpression"),  "_expressionWithSubstitutionVariables:",  a3),  *(_DWORD *)&self->_flags & 1);
  }
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Cannot substitute a nil substitution dictionary." userInfo:0]);
  return (id)+[NSJoin joinWithSourceAttributeName:destinationAttributeName:]();
}

@end
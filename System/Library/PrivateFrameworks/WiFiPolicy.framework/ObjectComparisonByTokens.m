@interface ObjectComparisonByTokens
+ (BOOL)addComparison:(id)a3 to:(id)a4 ifMinOverlap:(unint64_t)a5;
- (ObjectComparisonByTokens)initWithObj1:(id)a3 obj2:(id)a4 reference:(id)a5;
- (id)description;
- (id)obj1;
- (id)obj2;
- (id)reference;
- (unint64_t)diffTokensCount;
- (unint64_t)distance;
- (unint64_t)sameTokensCount;
- (void)accountForadditionalLength;
- (void)incrementDistanceWith:(unint64_t)a3;
- (void)incrementTokensWith:(BOOL)a3;
- (void)setDiffTokensCount:(unint64_t)a3;
- (void)setDistance:(unint64_t)a3;
- (void)setObj1:(id)a3;
- (void)setObj2:(id)a3;
- (void)setReference:(id)a3;
- (void)setSameTokensCount:(unint64_t)a3;
@end

@implementation ObjectComparisonByTokens

+ (BOOL)addComparison:(id)a3 to:(id)a4 ifMinOverlap:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if (v7 && [v7 sameTokensCount] >= a5)
  {
    [v8 addObject:v7];
    BOOL v9 = 1;
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (ObjectComparisonByTokens)initWithObj1:(id)a3 obj2:(id)a4 reference:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ObjectComparisonByTokens;
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = -[ObjectComparisonByTokens init](&v12, sel_init);
  -[ObjectComparisonByTokens setObj1:](v10, "setObj1:", v9, v12.receiver, v12.super_class);

  -[ObjectComparisonByTokens setObj2:](v10, "setObj2:", v8);
  -[ObjectComparisonByTokens setReference:](v10, "setReference:", v7);

  -[ObjectComparisonByTokens setSameTokensCount:](v10, "setSameTokensCount:", 0LL);
  -[ObjectComparisonByTokens setDiffTokensCount:](v10, "setDiffTokensCount:", 0LL);
  -[ObjectComparisonByTokens setDistance:](v10, "setDistance:", 0LL);
  return v10;
}

- (void)incrementTokensWith:(BOOL)a3
{
  uint64_t v3 = 2LL;
  if (a3) {
    uint64_t v3 = 1LL;
  }
  ++(&self->super.isa)[v3];
}

- (void)incrementDistanceWith:(unint64_t)a3
{
  self->_distance += a3;
}

- (void)accountForadditionalLength
{
  unint64_t v3 = [self->_obj1 length];
  unint64_t v4 = [self->_obj2 length];
  if (v3 <= v4) {
    uint64_t v5 = 5LL;
  }
  else {
    uint64_t v5 = 4LL;
  }
  if (v3 <= v4) {
    uint64_t v6 = 4LL;
  }
  else {
    uint64_t v6 = 5LL;
  }
  uint64_t v7 = -[objc_class length]((&self->super.isa)[v5], "length");
  self->_diffTokensCount += v7 - -[objc_class length]((&self->super.isa)[v6], "length");
}

- (id)description
{
  unint64_t v3 = (void *)NSString;
  id reference = self->_reference;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0) {
    uint64_t v6 = (__CFString *)[objc_alloc(NSString) initWithData:self->_reference encoding:4];
  }
  else {
    uint64_t v6 = &stru_18A170410;
  }
  [v3 stringWithFormat:@"[%@ %@] %@ <> %@ overlap:%lu diff:%lu distance:%lu", reference, v6, self->_obj1, self->_obj2, self->_sameTokensCount, self->_diffTokensCount, self->_distance];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) != 0) {

  }
  return v7;
}

- (unint64_t)sameTokensCount
{
  return self->_sameTokensCount;
}

- (void)setSameTokensCount:(unint64_t)a3
{
  self->_sameTokensCount = a3;
}

- (unint64_t)diffTokensCount
{
  return self->_diffTokensCount;
}

- (void)setDiffTokensCount:(unint64_t)a3
{
  self->_diffTokensCount = a3;
}

- (unint64_t)distance
{
  return self->_distance;
}

- (void)setDistance:(unint64_t)a3
{
  self->_distance = a3;
}

- (id)obj1
{
  return self->_obj1;
}

- (void)setObj1:(id)a3
{
}

- (id)obj2
{
  return self->_obj2;
}

- (void)setObj2:(id)a3
{
}

- (id)reference
{
  return self->_reference;
}

- (void)setReference:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
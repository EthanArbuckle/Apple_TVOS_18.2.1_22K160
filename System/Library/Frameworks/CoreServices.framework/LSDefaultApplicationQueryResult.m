@interface LSDefaultApplicationQueryResult
+ (BOOL)supportsSecureCoding;
+ (id)queryResultForCategory:(unint64_t)a3 error:(id *)a4;
- (BOOL)didRefresh;
- (BOOL)isDefaultForCategory;
- (LSDefaultApplicationQueryResult)initWithCoder:(id)a3;
- (LSDefaultApplicationQueryResult)initWithReferenceDate:(id)a3 didRefresh:(BOOL)a4 refreshAfter:(id)a5 defaultForCategory:(BOOL)a6;
- (NSDate)referenceDate;
- (NSDate)refreshAfter;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LSDefaultApplicationQueryResult

- (LSDefaultApplicationQueryResult)initWithReferenceDate:(id)a3 didRefresh:(BOOL)a4 refreshAfter:(id)a5 defaultForCategory:(BOOL)a6
{
  id v11 = a3;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___LSDefaultApplicationQueryResult;
  v13 = -[LSDefaultApplicationQueryResult init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_referenceDate, a3);
    v14->_didRefresh = a4;
    objc_storeStrong((id *)&v14->_refreshAfter, a5);
    v14->_defaultForCategory = a6;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LSDefaultApplicationQueryResult)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"referenceDate"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v4 decodeBoolForKey:@"didRefresh"];
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"refreshAfter"];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v4 decodeBoolForKey:@"defaultForCategory"];

  if (v5) {
    self = -[LSDefaultApplicationQueryResult initWithReferenceDate:didRefresh:refreshAfter:defaultForCategory:]( self,  "initWithReferenceDate:didRefresh:refreshAfter:defaultForCategory:",  v5,  v6,  v7,  v8);
  }

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  referenceDate = self->_referenceDate;
  id v5 = a3;
  [v5 encodeObject:referenceDate forKey:@"referenceDate"];
  [v5 encodeBool:self->_didRefresh forKey:@"didRefresh"];
  [v5 encodeObject:self->_refreshAfter forKey:@"refreshAfter"];
  [v5 encodeBool:self->_defaultForCategory forKey:@"defaultForCategory"];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@@%p: referenceDate %@ didRefresh %d refreshAfter %@ defaultForCategory %d>", objc_opt_class(), self, self->_referenceDate, self->_didRefresh, self->_refreshAfter, self->_defaultForCategory];
}

+ (id)queryResultForCategory:(unint64_t)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = v5;
  if (a4) {
    *a4 = v5;
  }

  return 0LL;
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (BOOL)didRefresh
{
  return self->_didRefresh;
}

- (NSDate)refreshAfter
{
  return self->_refreshAfter;
}

- (BOOL)isDefaultForCategory
{
  return self->_defaultForCategory;
}

- (void).cxx_destruct
{
}

@end
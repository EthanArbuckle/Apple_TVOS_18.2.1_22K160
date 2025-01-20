@interface TBLocationFetchRequest
+ (id)fetchRequestWithDescriptor:(id)a3 sourcePolicy:(unint64_t)a4;
+ (id)fetchRequestWithDescriptor:(id)a3 sourcePolicy:(unint64_t)a4 cacheable:(BOOL)a5;
- (BOOL)cacheable;
- (NSDictionary)userInfo;
- (TBLocationFetchRequest)initWithDescriptor:(id)a3 sourcePolicy:(unint64_t)a4 cacheable:(BOOL)a5;
- (TBLocationFetchRequestDescriptor)descriptor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)preferLocalHandler;
- (id)resultsHandler;
- (unint64_t)sourcePolicy;
- (void)handlePreferLocalResponse:(id)a3;
- (void)handleResponse:(id)a3;
- (void)setCacheable:(BOOL)a3;
- (void)setDescriptor:(id)a3;
- (void)setPreferLocalHandler:(id)a3;
- (void)setResultsHandler:(id)a3;
- (void)setSourcePolicy:(unint64_t)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation TBLocationFetchRequest

+ (id)fetchRequestWithDescriptor:(id)a3 sourcePolicy:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v6 sourcePolicy:a4 cacheable:0];

  return v7;
}

+ (id)fetchRequestWithDescriptor:(id)a3 sourcePolicy:(unint64_t)a4 cacheable:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v9 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v8 sourcePolicy:a4 cacheable:v5];

  return v9;
}

- (TBLocationFetchRequest)initWithDescriptor:(id)a3 sourcePolicy:(unint64_t)a4 cacheable:(BOOL)a5
{
  id v8 = (TBLocationFetchRequestDescriptor *)a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TBLocationFetchRequest;
  v9 = -[TBLocationFetchRequest init](&v12, sel_init);
  descriptor = v9->_descriptor;
  v9->_descriptor = v8;

  v9->_sourcePolicy = a4;
  v9->_cacheable = a5;
  return v9;
}

- (void)handleResponse:(id)a3
{
  id v4 = a3;
  -[TBLocationFetchRequest resultsHandler](self, "resultsHandler");
  BOOL v5 = (void (**)(id, id, void, uint64_t))objc_claimAutoreleasedReturnValue();
  v5[2](v5, v4, 0LL, 1LL);
}

- (void)handlePreferLocalResponse:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [v13 count];
  BOOL v5 = v13;
  if (v4)
  {
    [v13 objectAtIndexedSubscript:0];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      [v6 created];
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 timeIntervalSinceNow];
      double v9 = v8;

      if (self->userInfo)
      {
        v10 = -[TBLocationFetchRequest userInfo](self, "userInfo");
        v11 = (void *)[v10 mutableCopy];

        [MEMORY[0x189607968] numberWithUnsignedInteger:(unint64_t)-v9];
        objc_super v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 setObject:v12 forKey:@"staleness"];

        -[TBLocationFetchRequest setUserInfo:](self, "setUserInfo:", v11);
      }
    }

    BOOL v5 = v13;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class());
  -[TBLocationFetchRequest descriptor](self, "descriptor");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setDescriptor:v7];

  objc_msgSend(v5, "setSourcePolicy:", -[TBLocationFetchRequest sourcePolicy](self, "sourcePolicy"));
  objc_msgSend(v5, "setCacheable:", -[TBLocationFetchRequest cacheable](self, "cacheable"));
  -[TBLocationFetchRequest resultsHandler](self, "resultsHandler");
  double v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[TBLocationFetchRequest resultsHandler](self, "resultsHandler");
    double v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setResultsHandler:v9];
  }
  v10 = -[TBLocationFetchRequest userInfo](self, "userInfo");
  if (v10)
  {
    v11 = -[TBLocationFetchRequest userInfo](self, "userInfo");
    objc_super v12 = (void *)[v11 copyWithZone:a3];
    [v5 setUserInfo:v12];
  }

  return v5;
}

- (unint64_t)sourcePolicy
{
  return self->_sourcePolicy;
}

- (void)setSourcePolicy:(unint64_t)a3
{
  self->_sourcePolicy = a3;
}

- (BOOL)cacheable
{
  return self->_cacheable;
}

- (void)setCacheable:(BOOL)a3
{
  self->_cacheable = a3;
}

- (NSDictionary)userInfo
{
  return self->userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (id)resultsHandler
{
  return self->resultsHandler;
}

- (void)setResultsHandler:(id)a3
{
}

- (id)preferLocalHandler
{
  return self->preferLocalHandler;
}

- (void)setPreferLocalHandler:(id)a3
{
}

- (TBLocationFetchRequestDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface _PBSceneShroudAssertionContext
+ (id)contextWithStyle:(int64_t)a3 predicate:(id)a4;
- (_PBSceneShroudAssertionContext)initWithStyle:(int64_t)a3 predicate:(id)a4;
- (id)completionBlock;
- (id)predicate;
- (int64_t)style;
- (void)setCompletionBlock:(id)a3;
@end

@implementation _PBSceneShroudAssertionContext

+ (id)contextWithStyle:(int64_t)a3 predicate:(id)a4
{
  id v6 = a4;
  id v7 = [objc_alloc((Class)a1) initWithStyle:a3 predicate:v6];

  return v7;
}

- (_PBSceneShroudAssertionContext)initWithStyle:(int64_t)a3 predicate:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS____PBSceneShroudAssertionContext;
  id v7 = -[_PBSceneShroudAssertionContext init](&v12, "init");
  v8 = v7;
  if (v7)
  {
    v7->_style = a3;
    id v9 = [v6 copy];
    id predicate = v8->_predicate;
    v8->_id predicate = v9;
  }

  return v8;
}

- (int64_t)style
{
  return self->_style;
}

- (id)predicate
{
  return self->_predicate;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
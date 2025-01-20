@interface _DASRateLimitEvaluationResults
+ (id)evaluationResultsWithMaxedRateLimits:(id)a3 withNextEvaluationDate:(id)a4;
- (NSDate)nextEvaluationDate;
- (NSMutableArray)maxedRateLimits;
- (_DASRateLimitEvaluationResults)initWithMaxedRateLimits:(id)a3 withNextEvaluationDate:(id)a4;
- (void)setMaxedRateLimits:(id)a3;
- (void)setNextEvaluationDate:(id)a3;
@end

@implementation _DASRateLimitEvaluationResults

- (_DASRateLimitEvaluationResults)initWithMaxedRateLimits:(id)a3 withNextEvaluationDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS____DASRateLimitEvaluationResults;
  v9 = -[_DASRateLimitEvaluationResults init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_maxedRateLimits, a3);
    objc_storeStrong((id *)&v10->_nextEvaluationDate, a4);
  }

  return v10;
}

+ (id)evaluationResultsWithMaxedRateLimits:(id)a3 withNextEvaluationDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)objc_opt_class(a1)) initWithMaxedRateLimits:v7 withNextEvaluationDate:v6];

  return v8;
}

- (NSDate)nextEvaluationDate
{
  return self->_nextEvaluationDate;
}

- (void)setNextEvaluationDate:(id)a3
{
}

- (NSMutableArray)maxedRateLimits
{
  return self->_maxedRateLimits;
}

- (void)setMaxedRateLimits:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface _DASPolicyCriterion
+ (id)criterionWithFormat:(id)a3;
+ (id)criterionWithPredicate:(id)a3;
+ (id)policyCriteriaWithPredicates:(id)a3;
@end

@implementation _DASPolicyCriterion

+ (id)criterionWithFormat:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:arguments:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:arguments:",  a3,  &v4));
}

+ (id)criterionWithPredicate:(id)a3
{
  return a3;
}

+ (id)policyCriteriaWithPredicates:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (char *)[v3 count];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", v4));
  if (v4)
  {
    for (i = 0LL; i != v4; ++i)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:i]);
      [v5 addObject:v7];
    }
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v5));

  return v8;
}

@end
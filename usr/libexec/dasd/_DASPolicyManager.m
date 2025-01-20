@interface _DASPolicyManager
+ (id)allPoliciesForPlatform;
+ (id)allPredictingPoliciesForPlatform;
+ (id)policyForBitIndex:(unint64_t)a3;
+ (unint64_t)bitmaskForPolicy:(id)a3;
+ (void)initializeAllPolicies;
@end

@implementation _DASPolicyManager

+ (void)initializeAllPolicies
{
  if (qword_100157A80 != -1) {
    dispatch_once(&qword_100157A80, &stru_1001161D0);
  }
}

+ (id)allPoliciesForPlatform
{
  return (id)qword_100157A88;
}

+ (id)allPredictingPoliciesForPlatform
{
  return (id)qword_100157AA0;
}

+ (unint64_t)bitmaskForPolicy:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100157A98 objectForKeyedSubscript:a3]);
  unsigned __int8 v4 = [v3 unsignedIntegerValue];

  return 1LL << v4;
}

+ (id)policyForBitIndex:(unint64_t)a3
{
  v3 = (void *)qword_100157A90;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v4]);

  return v5;
}

@end
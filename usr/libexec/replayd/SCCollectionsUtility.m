@interface SCCollectionsUtility
+ (id)getDifferenceBetween:(id)a3 andArray:(id)a4;
@end

@implementation SCCollectionsUtility

+ (id)getDifferenceBetween:(id)a3 andArray:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));

  [v6 minusSet:v7];
  return v6;
}

@end
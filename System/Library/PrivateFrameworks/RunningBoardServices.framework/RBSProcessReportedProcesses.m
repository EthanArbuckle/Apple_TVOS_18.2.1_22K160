@interface RBSProcessReportedProcesses
+ (id)reportedPredicate;
- (BOOL)matchesProcess:(id)a3;
@end

@implementation RBSProcessReportedProcesses

+ (id)reportedPredicate
{
  v2 = objc_alloc_init(&OBJC_CLASS___RBSProcessReportedProcesses);
  v3 = +[RBSProcessPredicate predicateMatching:](&OBJC_CLASS___RBSProcessPredicate, "predicateMatching:", v2);
  return v3;
}

- (BOOL)matchesProcess:(id)a3
{
  return [a3 isReported];
}

@end
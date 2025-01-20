@interface NSNumber(RBSProcessIdentifier)
- (BOOL)matchesProcess:()RBSProcessIdentifier;
- (id)processPredicate;
- (uint64_t)rbs_pid;
@end

@implementation NSNumber(RBSProcessIdentifier)

- (uint64_t)rbs_pid
{
  LODWORD(result) = [a1 intValue];
  else {
    return result;
  }
}

- (BOOL)matchesProcess:()RBSProcessIdentifier
{
  id v4 = a3;
  LODWORD(a1) = objc_msgSend(a1, "rbs_pid");
  int v5 = objc_msgSend(v4, "rbs_pid");

  return (_DWORD)a1 == v5;
}

- (id)processPredicate
{
  return +[RBSProcessPredicate predicateMatchingIdentifier:]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingIdentifier:",  a1);
}

@end
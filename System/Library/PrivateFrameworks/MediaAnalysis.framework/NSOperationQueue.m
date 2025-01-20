@interface NSOperationQueue
+ (id)vcp_sharedAnalysisQueue;
@end

@implementation NSOperationQueue

+ (id)vcp_sharedAnalysisQueue
{
  if (qword_1001E6350 != -1) {
    dispatch_once(&qword_1001E6350, &stru_1001B9CC8);
  }
  return (id)qword_1001E6358;
}

@end
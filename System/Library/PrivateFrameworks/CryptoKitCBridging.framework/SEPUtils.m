@interface SEPUtils
+ (id)dataFromACL:(__SecAccessControl *)a3;
@end

@implementation SEPUtils

+ (id)dataFromACL:(__SecAccessControl *)a3
{
  return (id)SecAccessControlCopyData();
}

@end
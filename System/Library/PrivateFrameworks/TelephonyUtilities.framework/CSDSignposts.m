@interface CSDSignposts
+ (BOOL)shouldTraceSingposts;
+ (void)trace:(unint64_t)a3;
@end

@implementation CSDSignposts

+ (BOOL)shouldTraceSingposts
{
  if (qword_10044D0B0 != -1) {
    dispatch_once(&qword_10044D0B0, &stru_1003DB618);
  }
  return byte_10044D0A8;
}

+ (void)trace:(unint64_t)a3
{
  __int16 v3 = a3;
}

@end
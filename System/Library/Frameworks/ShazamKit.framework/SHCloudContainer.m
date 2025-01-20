@interface SHCloudContainer
+ (CKContainer)sharedContainer;
@end

@implementation SHCloudContainer

+ (CKContainer)sharedContainer
{
  if (qword_100088978 != -1) {
    dispatch_once(&qword_100088978, &stru_10006D068);
  }
  return (CKContainer *)(id)qword_100088970;
}

@end
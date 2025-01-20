@interface TVPApplication
+ (id)sharedApplication;
- (PHPhotoLibrary)px_photoLibrary;
- (TVPApplication)init;
@end

@implementation TVPApplication

+ (id)sharedApplication
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___TVPApplication;
  id v2 = objc_msgSendSuper2(&v4, "sharedApplication");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (TVPApplication)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVPApplication;
  id v2 = -[TVPApplication init](&v4, "init");
  if (v2) {
    +[TVSNetworkUtilities setupNetworkMonitoring](&OBJC_CLASS___TVSNetworkUtilities, "setupNetworkMonitoring");
  }
  return v2;
}

- (PHPhotoLibrary)px_photoLibrary
{
  return (PHPhotoLibrary *)+[TVPPhotoUtilities tvPhotoLibrary](&OBJC_CLASS___TVPPhotoUtilities, "tvPhotoLibrary");
}

@end
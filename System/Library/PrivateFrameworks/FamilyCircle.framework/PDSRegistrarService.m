@interface PDSRegistrarService
+ (PDSRegistrarService)sharedInstance;
- (PDSRegistrarService)init;
- (void)registerToPDS:(char)a3;
- (void)removeRegistrationFromPDS;
@end

@implementation PDSRegistrarService

+ (PDSRegistrarService)sharedInstance
{
  if (qword_100051CC0 != -1) {
    swift_once(&qword_100051CC0, sub_1000231F0);
  }
  return (PDSRegistrarService *)(id)static PDSRegistrarService.sharedInstance;
}

- (PDSRegistrarService)init
{
  return (PDSRegistrarService *)sub_1000232DC();
}

- (void)registerToPDS:(char)a3
{
  v4 = self;
  PDSRegistrarService.registerToPDS(_:)(a3);
}

- (void)removeRegistrationFromPDS
{
  v2 = self;
  PDSRegistrarService.removeRegistrationFromPDS()();
}

- (void).cxx_destruct
{
}

@end
@interface IMAccount
+ (id)tvs_accountWithFaceTimeService;
@end

@implementation IMAccount

+ (id)tvs_accountWithFaceTimeService
{
  id v2 = objc_alloc(&OBJC_CLASS___IMAccount);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMServiceImpl tvs_faceTimeService](&OBJC_CLASS___IMServiceImpl, "tvs_faceTimeService"));
  id v4 = [v2 initWithService:v3];

  return v4;
}

@end
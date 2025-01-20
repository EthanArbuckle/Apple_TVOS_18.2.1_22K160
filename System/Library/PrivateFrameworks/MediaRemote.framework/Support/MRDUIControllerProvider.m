@interface MRDUIControllerProvider
+ (id)bannerUIControllerWithDelegate:(id)a3;
+ (id)groupSessionUIControllerWithDelegate:(id)a3;
+ (id)lockScreenUIControllerWithDelegate:(id)a3;
@end

@implementation MRDUIControllerProvider

+ (id)lockScreenUIControllerWithDelegate:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRSharedSettings currentSettings](&OBJC_CLASS___MRSharedSettings, "currentSettings"));
  else {
    v5 = 0LL;
  }

  return v5;
}

+ (id)bannerUIControllerWithDelegate:(id)a3
{
  id v3 = a3;
  v4 = -[MRDUIController initWithDelegate:](objc_alloc(&OBJC_CLASS___MRDUIController), "initWithDelegate:", v3);

  return v4;
}

+ (id)groupSessionUIControllerWithDelegate:(id)a3
{
  id v3 = a3;
  v4 = -[MRDXPCUIController initWithDelegate:](objc_alloc(&OBJC_CLASS___MRDXPCUIController), "initWithDelegate:", v3);

  return v4;
}

@end
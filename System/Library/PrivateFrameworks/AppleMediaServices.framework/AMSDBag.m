@interface AMSDBag
+ (AMSBag)defaultBag;
+ (id)bagForMediaType:(id)a3;
@end

@implementation AMSDBag

+ (id)bagForMediaType:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AMSProcessInfo currentProcess](&OBJC_CLASS___AMSProcessInfo, "currentProcess"));
  [v4 setAccountMediaType:v3];

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[AMSBag bagForProfile:profileVersion:processInfo:]( &OBJC_CLASS___AMSBag,  "bagForProfile:profileVersion:processInfo:",  @"Accounts",  @"1",  v4));
  return v5;
}

+ (AMSBag)defaultBag
{
  return (AMSBag *)+[AMSBag bagForProfile:profileVersion:]( &OBJC_CLASS___AMSBag,  "bagForProfile:profileVersion:",  @"Accounts",  @"1");
}

@end
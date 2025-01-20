@interface SulfurDomain
+ (BOOL)supportsSecureCoding;
- (BOOL)computeWithError:(id *)a3;
- (BOOL)shouldSaveToDisk;
- (SulfurDomain)init;
- (SulfurDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (id)status;
- (unint64_t)domain;
@end

@implementation SulfurDomain

- (unint64_t)domain
{
  return 17LL;
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.sulfur";
}

- (BOOL)shouldSaveToDisk
{
  return 1;
}

- (SulfurDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SulfurDomain;
  v2 = -[EligibilityDomain init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[SulfurDomain _internal_doInit](v2, "_internal_doInit");
  }
  return v3;
}

- (SulfurDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SulfurDomain;
  v3 = -[EligibilityDomain initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3) {
    -[SulfurDomain _internal_doInit](v3, "_internal_doInit");
  }
  return v4;
}

- (id)status
{
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MobileAssetManager sharedInstance](&OBJC_CLASS___MobileAssetManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v17 sulfurAsset]);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue([v3 policies]);
  id v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    v7 = 0LL;
    uint64_t v8 = *(void *)v22;
    v9 = &selRef_initRequiringSecureCoding_;
    while (2)
    {
      v10 = 0LL;
      v11 = v9[199];
      v12 = v7;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v4);
        }
        v13 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)v10);
        -[EligibilityDomain resetInputsOfInterest](self, "resetInputsOfInterest");
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472LL;
        v19[2] = sub_100004A0C;
        v19[3] = &unk_1000349D8;
        v19[4] = self;
        id v20 = v3;
        [v13 enumerateKeysAndObjectsUsingBlock:v19];
        v18.receiver = self;
        v18.super_class = (Class)&OBJC_CLASS___SulfurDomain;
        id v14 = objc_msgSendSuper2(&v18, v11);
        v7 = (void *)objc_claimAutoreleasedReturnValue(v14);

        if ((id)-[EligibilityDomain computeAnswerFromStatus:](self, "computeAnswerFromStatus:", v7) == (id)4)
        {
          id v15 = v7;

          goto LABEL_13;
        }

        v10 = (char *)v10 + 1;
        v12 = v7;
      }

      while (v6 != v10);
      id v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
      v9 = &selRef_initRequiringSecureCoding_;
      if (v6) {
        continue;
      }
      break;
    }
  }

  else
  {
    v7 = 0LL;
  }

  id v15 = v7;
LABEL_13:

  return v15;
}

- (BOOL)computeWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[InputManager sharedInstance](&OBJC_CLASS___InputManager, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForInputValue:2]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 countryCode]);
  -[EligibilityDomain addContextForKey:value:]( self,  "addContextForKey:value:",  @"OS_ELIGIBILITY_CONTEXT_COUNTRY_BILLING",  v7);

  LOBYTE(a3) = -[EligibilityDomain computeAnswerFromStatusWithError:](self, "computeAnswerFromStatusWithError:", a3);
  return (char)a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
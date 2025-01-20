@interface DMFOSUpdate
+ (id)_productKeyFromBuild:(id)a3;
- (id)initWithDescriptor:(id)a3;
@end

@implementation DMFOSUpdate

+ (id)_productKeyFromBuild:(id)a3
{
  v3 = &stru_10009F768;
  if (a3) {
    v3 = (const __CFString *)a3;
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  @"tvOSUpdate",  v3);
}

- (id)initWithDescriptor:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 productBuildVersion]);
  if (v5)
  {
    id v6 = [(id)objc_opt_class(self) _productKeyFromBuild:v5];
    id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  }

  else
  {
    id v7 = [@"tvOSUpdate" copy];
  }

  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 humanReadableUpdateName]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 productSystemName]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 productVersion]);
  id v12 = [v4 downloadSize];
  id v13 = [v4 installationSize];

  LODWORD(v16) = 256;
  v14 = -[DMFOSUpdate initWithProductKey:humanReadableName:productName:version:build:downloadSize:installSize:isCritical:restartRequired:allowsInstallLater:isSplat:supplementalBuild:supplementalVersionExtra:]( self,  "initWithProductKey:humanReadableName:productName:version:build:downloadSize:installSize:isCritical:restartRequ ired:allowsInstallLater:isSplat:supplementalBuild:supplementalVersionExtra:",  v8,  v9,  v10,  v11,  v5,  v12,  v13,  v16,  v5,  0LL);

  return v14;
}

@end
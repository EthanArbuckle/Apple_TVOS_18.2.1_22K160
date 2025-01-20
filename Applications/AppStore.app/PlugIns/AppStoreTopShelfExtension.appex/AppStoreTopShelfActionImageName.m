@interface AppStoreTopShelfActionImageName
+ (id)internalNameTranslatedFromName:(id)a3;
@end

@implementation AppStoreTopShelfActionImageName

+ (id)internalNameTranslatedFromName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"default"])
  {
    v4 = (id *)&TVTopShelfActionImageNameDefault;
  }

  else if ([v3 isEqualToString:@"play"])
  {
    v4 = (id *)&TVTopShelfActionImageNamePlay;
  }

  else
  {
    if (![v3 isEqualToString:@"cloudDownload"])
    {
      id v5 = 0LL;
      goto LABEL_8;
    }

    v4 = (id *)&TVTopShelfActionImageNameCloudDownload;
  }

  id v5 = *v4;
LABEL_8:

  return v5;
}

@end
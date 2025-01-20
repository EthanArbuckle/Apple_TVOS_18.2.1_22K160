@interface CDAuthInfoProvider
+ (id)createWithRequest:(id)a3 client:(id)a4 error:(id *)a5;
@end

@implementation CDAuthInfoProvider

+ (id)createWithRequest:(id)a3 client:(id)a4 error:(id *)a5
{
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([a3 overrideBundleIdentifier]);
  v9 = v8;
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = (id)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
  }
  v11 = v10;

  if (![v11 length])
  {
    uint64_t v16 = NSErrorF(CPSErrorDomain, 4294960591LL, "Missing bundle identifier");
    id v17 = (id)objc_claimAutoreleasedReturnValue(v16);
    v14 = 0LL;
    if (!v17)
    {
LABEL_12:
      v12 = 0LL;
      v15 = 0LL;
      goto LABEL_13;
    }

@end
@interface URLParserHelper
+ (id)urlTypeForURL:(id)a3 bag:(id)a4 error:(id *)a5;
@end

@implementation URLParserHelper

+ (id)urlTypeForURL:(id)a3 bag:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [[AMSURLParser alloc] initWithBag:v7];

  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 typeForURL:v8]);
  id v15 = 0LL;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 resultWithError:&v15]);
  id v12 = v15;
  v13 = v12;
  if (a5) {
    *a5 = v12;
  }

  return v11;
}

@end
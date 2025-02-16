@interface LACDomainStateDecorator
+ (id)_hashData:(id)a3;
+ (id)saltHash:(id)a3 withBundleID:(id)a4;
@end

@implementation LACDomainStateDecorator

+ (id)saltHash:(id)a3 withBundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    v8 = (void *)[v6 mutableCopy];
    [v7 dataUsingEncoding:4];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 appendData:v9];

    [a1 _hashData:v8];
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v10 = v6;
  }

  return v10;
}

+ (id)_hashData:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    [MEMORY[0x189603FB8] dataWithLength:32];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ccsha256_di();
    [v3 length];
    [v3 bytes];
    id v5 = v4;
    [v5 mutableBytes];
    ccdigest();
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

@end
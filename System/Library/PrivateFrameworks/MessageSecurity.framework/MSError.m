@interface MSError
+ (id)MSErrorWithDomain:(id)a3 code:(int64_t)a4 errorLevel:(unint64_t)a5 underlyingError:(id)a6 description:(id)a7;
+ (id)MSErrorWithDomain:(id)a3 code:(int64_t)a4 errorLevel:(unint64_t)a5 underlyingError:(id)a6 description:(id)a7 arguments:(char *)a8;
+ (id)MSErrorWithDomain:(id)a3 code:(int64_t)a4 underlyingError:(id)a5 description:(id)a6;
@end

@implementation MSError

+ (id)MSErrorWithDomain:(id)a3 code:(int64_t)a4 errorLevel:(unint64_t)a5 underlyingError:(id)a6 description:(id)a7 arguments:(char *)a8
{
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  id v16 = objc_alloc_init(MEMORY[0x189603FC8]);
  v17 = v16;
  if (v14) {
    [v16 setObject:v14 forKey:*MEMORY[0x189607798]];
  }
  if (!v15)
  {
    v18 = 0LL;
    if (!a5) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  v18 = (void *)[objc_alloc(NSString) initWithFormat:v15 arguments:a8];
  [v17 setObject:v18 forKey:*MEMORY[0x1896075E0]];
  if (a5) {
LABEL_5:
  }
    _MSLog(a5, v18);
LABEL_6:
  [MEMORY[0x189607870] errorWithDomain:v13 code:a4 userInfo:v17];
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)MSErrorWithDomain:(id)a3 code:(int64_t)a4 errorLevel:(unint64_t)a5 underlyingError:(id)a6 description:(id)a7
{
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)MSErrorWithDomain:(id)a3 code:(int64_t)a4 underlyingError:(id)a5 description:(id)a6
{
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
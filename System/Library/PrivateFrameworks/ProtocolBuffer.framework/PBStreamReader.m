@interface PBStreamReader
+ (id)readProtoBuffersOfClass:(Class)a3 fromFile:(id)a4 error:(id *)a5;
@end

@implementation PBStreamReader

+ (id)readProtoBuffersOfClass:(Class)a3 fromFile:(id)a4 error:(id *)a5
{
  id v7 = a4;
  [MEMORY[0x1896078A8] defaultManager];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v8 fileExistsAtPath:v7])
  {
    [MEMORY[0x189603FA8] array];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x186E22E88]();
    v11 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithContentsOfFile:v7 options:0 error:a5];
    v12 = v11;
    if (*a5)
    {

      objc_autoreleasePoolPop(v10);
      id v13 = 0LL;
    }

    else
    {
      context = v10;
      v14 = -[PBDataReader initWithData:](objc_alloc(&OBJC_CLASS___PBDataReader), "initWithData:", v11);
      if (-[PBDataReader hasMoreData](v14, "hasMoreData"))
      {
        do
        {
          v15 = (void *)MEMORY[0x186E22E88]();
          v16 = -[PBDataReader readProtoBuffer](v14, "readProtoBuffer");
          if (v16)
          {
            v17 = (void *)[[a3 alloc] initWithData:v16];
            if (v17) {
              [v9 addObject:v17];
            }
          }

          objc_autoreleasePoolPop(v15);
        }

        while (-[PBDataReader hasMoreData](v14, "hasMoreData"));
      }

      if (-[PBDataReader hasError](v14, "hasError"))
      {
        [MEMORY[0x189607870] errorWithDomain:@"PBRequesterErrorDomain" code:6005 userInfo:0];
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

      objc_autoreleasePoolPop(context);
      id v13 = v9;
    }
  }

  else
  {
    id v13 = 0LL;
  }

  return v13;
}

@end
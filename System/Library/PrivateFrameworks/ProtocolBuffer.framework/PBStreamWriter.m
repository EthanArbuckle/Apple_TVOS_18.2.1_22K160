@interface PBStreamWriter
+ (id)writeProtoBuffers:(id)a3 toFile:(id)a4;
@end

@implementation PBStreamWriter

+ (id)writeProtoBuffers:(id)a3 toFile:(id)a4
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  [MEMORY[0x1896078A8] defaultManager];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v5 count])
  {
    v23 = v7;
    id v24 = v6;
    context = (void *)MEMORY[0x186E22E88]();
    v8 = objc_alloc_init(&OBJC_CLASS___PBDataWriter);
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v27;
      do
      {
        uint64_t v13 = 0LL;
        do
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v26 + 1) + 8 * v13);
          v15 = (void *)MEMORY[0x186E22E88](v10);
          v16 = objc_alloc_init(&OBJC_CLASS___PBDataWriter);
          objc_msgSend(v14, "writeTo:", v16, context);
          v17 = -[PBDataWriter immutableData](v16, "immutableData");
          -[PBDataWriter writeProtoBuffer:](v8, "writeProtoBuffer:", v17);

          objc_autoreleasePoolPop(v15);
          ++v13;
        }

        while (v11 != v13);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
        uint64_t v11 = v10;
      }

      while (v10);
    }
    v18 = -[PBDataWriter immutableData](v8, "immutableData");
    id v25 = 0LL;
    id v6 = v24;
    [v18 writeToFile:v24 options:0 error:&v25];
    id v19 = v25;

    objc_autoreleasePoolPop(context);
    v7 = v23;
    if (v19) {
      [v23 removeItemAtPath:v24 error:0];
    }
  }

  else
  {
    id v30 = 0LL;
    [v7 removeItemAtPath:v6 error:&v30];
    id v19 = v30;
  }

  id v20 = v19;

  return v20;
}

@end
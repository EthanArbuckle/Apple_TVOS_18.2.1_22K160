@interface NSMutableArray(OSABinaryImageListExtension)
- (void)addImage:()OSABinaryImageListExtension address:size:;
- (void)addImageLegacy:()OSABinaryImageListExtension address:size:name:path:arch:;
- (void)sortByAddressAndSetInferredSizes;
@end

@implementation NSMutableArray(OSABinaryImageListExtension)

- (void)addImage:()OSABinaryImageListExtension address:size:
{
  v6 = -[OSABinaryImageSegment initWithAddress:size:for:]( objc_alloc(&OBJC_CLASS___OSABinaryImageSegment),  "initWithAddress:size:for:",  a4,  a5,  a3);
  [a1 addObject:v6];
}

- (void)addImageLegacy:()OSABinaryImageListExtension address:size:name:path:arch:
{
  v21 = -[OSABinaryImageSegment initWithAddress:size:for:]( objc_alloc(&OBJC_CLASS___OSABinaryImageSegment),  "initWithAddress:size:for:",  a4,  a5,  a3);
  if (a6)
  {
    [NSString stringWithUTF8String:a6];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[OSABinaryImageSegment symbolInfo](v21, "symbolInfo");
    [v13 setName:v12];
  }

  if (a7)
  {
    v14 = -[OSABinaryImageSegment symbolInfo](v21, "symbolInfo");
    [NSString stringWithUTF8String:a7];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 setPath:v15];
  }

  if (a8)
  {
    uint64_t v16 = [NSString stringWithUTF8String:a8];
    v17 = -[OSABinaryImageSegment symbolInfo](v21, "symbolInfo");
    v18 = (void *)v17[3];
    v17[3] = v16;

    [NSString stringWithUTF8String:a8];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[OSABinaryImageSegment symbolInfo](v21, "symbolInfo");
    [v20 setCpuArch:v19];
  }

  [a1 addObject:v21];
}

- (void)sortByAddressAndSetInferredSizes
{
  uint64_t v2 = [a1 count];
  if (v2)
  {
    uint64_t v3 = v2;
    [a1 sortUsingComparator:&__block_literal_global_7];
    [a1 firstObject];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3 == 1)
    {
      id v18 = v4;
      [v4 symbolInfo];
    }

    else
    {
      for (uint64_t i = 1LL; i != v3; ++i)
      {
        [a1 objectAtIndexedSubscript:i];
        id v18 = (id)objc_claimAutoreleasedReturnValue();
        [v5 symbolInfo];
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v8 = [v7 size];

        if (!v8)
        {
          [v18 symbolInfo];
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v10 = [v9 start];
          [v5 symbolInfo];
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          unint64_t v12 = v10 - [v11 start];

          if (v12 >= 0x40000000) {
            uint64_t v13 = 0x40000000LL;
          }
          else {
            uint64_t v13 = v12;
          }
          [v5 symbolInfo];
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          [v14 setSize:v13];
        }

        v5 = v18;
      }

      [v18 symbolInfo];
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [v15 size];

    if (!v16)
    {
      [v18 symbolInfo];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 setSize:0x40000000];
    }
  }

@end
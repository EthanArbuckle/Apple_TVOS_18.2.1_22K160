@interface UARPDyanamicAssetLogManager
- (BOOL)newLog:(id)a3 error:(id *)a4;
- (NSURL)baseURL;
- (UARPDyanamicAssetLogManager)init;
- (UARPDyanamicAssetLogManager)initWithBaseURL:(id)a3;
@end

@implementation UARPDyanamicAssetLogManager

- (UARPDyanamicAssetLogManager)init
{
  return 0LL;
}

- (UARPDyanamicAssetLogManager)initWithBaseURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___UARPDyanamicAssetLogManager;
  v5 = -[UARPDyanamicAssetLogManager init](&v9, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    baseURL = v5->_baseURL;
    v5->_baseURL = (NSURL *)v6;
  }

  return v5;
}

- (BOOL)newLog:(id)a3 error:(id *)a4
{
  uint64_t v59 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  if (self->_baseURL)
  {
    [MEMORY[0x189603F50] date];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = objc_alloc(MEMORY[0x189603F38]);
    v51 = (void *)[v8 initWithCalendarIdentifier:*MEMORY[0x1896039C8]];
    [v51 components:252 fromDate:v7];
    v53 = a4;
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( NSString,  "stringWithFormat:",  @"%.04d-%.02d-%.02d-%.02d%.02d%.02d",  objc_msgSend(v50, "year"),  objc_msgSend(v50, "month"),  objc_msgSend(v50, "day"),  objc_msgSend(v50, "hour"),  objc_msgSend(v50, "minute"),  objc_msgSend(v50, "second"));
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[UARPSuperBinaryAsset initWithURL:](objc_alloc(&OBJC_CLASS___UARPSuperBinaryAsset), "initWithURL:", v6);
    if (-[UARPSuperBinaryAsset expandHeadersAndTLVs:](v10, "expandHeadersAndTLVs:", v53))
    {
      v42 = v7;
      id v52 = v6;
      v11 = -[UARPSuperBinaryAsset tlvs](v10, "tlvs");
      v12 = +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  272691969LL,  v11);
      v41 = v12;
      if (v12)
      {
        [v12 valueAsString];
        v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        v44 = @"UnknownAppleModelNumber";
      }
      v14 = -[UARPSuperBinaryAsset tlvs](v10, "tlvs");
      v15 = +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  272691970LL,  v14);
      v40 = v15;
      if (v15)
      {
        [v15 valueAsString];
        v16 = (const __CFString *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        v16 = @"UnknownSerialNumber";
      }

      [MEMORY[0x189604030] fileURLWithPath:v44 isDirectory:1 relativeToURL:self->_baseURL];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (__CFString *)v16;
      if (v17)
      {
        v38 = v17;
        [MEMORY[0x189604030] fileURLWithPath:v16 isDirectory:1 relativeToURL:v17];
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18
          && ([MEMORY[0x1896078A8] defaultManager],
              v19 = (void *)objc_claimAutoreleasedReturnValue(),
              int v20 = [v19 createDirectoryAtURL:v18 withIntermediateDirectories:1 attributes:0 error:v53],  v19,  v20))
        {
          __int128 v56 = 0u;
          __int128 v57 = 0u;
          __int128 v54 = 0u;
          __int128 v55 = 0u;
          -[UARPSuperBinaryAsset payloads](v10, "payloads");
          id obj = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v49 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
          if (v49)
          {
            v45 = v10;
            uint64_t v46 = *(void *)v55;
            v47 = v18;
            v48 = v9;
            while (2)
            {
              for (uint64_t i = 0LL; i != v49; ++i)
              {
                if (*(void *)v55 != v46) {
                  objc_enumerationMutation(obj);
                }
                v22 = *(void **)(*((void *)&v54 + 1) + 8 * i);
                v23 = (void *)NSString;
                [v22 payloadTag];
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                int v25 = [v24 char1];
                [v22 payloadTag];
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                int v27 = [v26 char2];
                [v22 payloadTag];
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                int v29 = [v28 char3];
                [v22 payloadTag];
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v37 = v25;
                objc_super v9 = v48;
                [v23 stringWithFormat:@"%@-%c%c%c%c.uarplog", v48, v37, v27, v29, (int)objc_msgSend(v30, "char4")];
                v31 = (void *)objc_claimAutoreleasedReturnValue();

                uint64_t v32 = [v22 rangePayload];
                uint64_t v34 = v33;
                [MEMORY[0x189607898] fileHandleForReadingFromURL:v52 error:v53];
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = v47;
                LODWORD(v32) = [v22 expandPayloadToURL:v47 payloadFilename:v31 superbinary:v35 offset:v32 length:v34 error:v53];

                if (!(_DWORD)v32)
                {
                  BOOL v13 = 0;
                  v7 = v42;
                  v10 = v45;
                  goto LABEL_27;
                }

                v10 = v45;
              }

              uint64_t v49 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
              if (v49) {
                continue;
              }
              break;
            }

            BOOL v13 = 1;
            v7 = v42;
          }

          else
          {
            BOOL v13 = 1;
          }

- (NSURL)baseURL
{
  return (NSURL *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

@end
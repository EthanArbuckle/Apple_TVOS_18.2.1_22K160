@interface CSAdBlockerAssetDecoderV1
+ (id)decodeAssetWithData:(id)a3;
@end

@implementation CSAdBlockerAssetDecoderV1

+ (id)decodeAssetWithData:(id)a3
{
  id v3 = a3;
  +[CSConfig defaultContinuousFingerprintBufferDuration]( &OBJC_CLASS___CSConfig,  "defaultContinuousFingerprintBufferDuration");
  double v5 = v4;
  v6 = objc_alloc_init(&OBJC_CLASS___SHCustomCatalog);
  id v7 = v3;
  v8 = [v7 bytes];
  int v9 = v8[1];
  if (v9)
  {
    float v10 = v5;
    v32 = v6;
    if (v9 >= 1)
    {
      v11 = v8;
      int v12 = 2;
      v31 = v8;
      do
      {
        int v13 = v11[v12];
        int v14 = v12 + 1;
        int v15 = (-v13 & 3) + v13;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subdataWithRange:", 4 * v14, v15));
        v17 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v16, 4LL);
        int v18 = v14 + (v15 >> 2);
        int v19 = v18 + 1;
        int v20 = (-v11[v18] & 3) + v11[v18];
        id v21 = v7;
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subdataWithRange:", 4 * (v18 + 1), v20));
        v23 = (void *)objc_claimAutoreleasedReturnValue( +[SHSignature signatureWithDataRepresentation:error:]( &OBJC_CLASS___SHSignature,  "signatureWithDataRepresentation:error:",  v22,  0LL));
        SHMediaItemProperty v34 = SHMediaItemTitle;
        v35 = v17;
        v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v34,  1LL));
        v25 = (void *)objc_claimAutoreleasedReturnValue( +[SHMediaItem mediaItemWithProperties:]( &OBJC_CLASS___SHMediaItem,  "mediaItemWithProperties:",  v24));

        v33 = v25;
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v33, 1LL));
        -[SHCustomCatalog addReferenceSignature:representingMediaItems:error:]( v32,  "addReferenceSignature:representingMediaItems:error:",  v23,  v26,  0LL);

        int v12 = v19 + (v20 >> 2);
        id v7 = v21;
        v11 = v31;

        --v9;
      }

      while (v9);
    }

    v27 = objc_alloc(&OBJC_CLASS___CSAdBlockerConfig);
    v6 = v32;
    *(float *)&double v28 = v10;
    v29 = -[CSAdBlockerConfig initWithCatalog:withMaxFingerprintBufferSize:shouldResetAdsDic:withAssetVersion:]( v27,  "initWithCatalog:withMaxFingerprintBufferSize:shouldResetAdsDic:withAssetVersion:",  v32,  0LL,  0LL,  v28);
  }

  else
  {
    v29 = 0LL;
  }

  return v29;
}

@end
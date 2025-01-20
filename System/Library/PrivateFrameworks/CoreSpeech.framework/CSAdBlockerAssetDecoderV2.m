@interface CSAdBlockerAssetDecoderV2
+ (id)decodeAssetWithData:(id)a3;
@end

@implementation CSAdBlockerAssetDecoderV2

+ (id)decodeAssetWithData:(id)a3
{
  id v3 = a3;
  +[CSConfig defaultContinuousFingerprintBufferDuration]( &OBJC_CLASS___CSConfig,  "defaultContinuousFingerprintBufferDuration");
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v5 = objc_alloc_init(&OBJC_CLASS___SHCustomCatalog);
  id v6 = v3;
  v7 = [v6 bytes];
  int v8 = v7[2];
  if (v8)
  {
    v9 = v7;
    v35 = v5;
    int v10 = v7[1];
    if (v8 >= 1)
    {
      int v11 = 3;
      SHMediaItemProperty v33 = SHMediaItemTitle;
      v34 = v4;
      do
      {
        int v12 = v9[v11];
        int v13 = v11 + 1;
        int v14 = (-v12 & 3) + v12;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subdataWithRange:", 4 * v13, v14, v33));
        v16 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v15, 4LL);
        int v17 = v13 + (v14 >> 2);
        uint64_t v18 = v17;
        if (v16)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v9[v17] != 0));
          -[NSMutableDictionary setValue:forKey:](v4, "setValue:forKey:", v19, v16);
        }

        int v20 = v18 + 2;
        int v21 = (-v9[v18 + 1] & 3) + v9[v18 + 1];
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subdataWithRange:", 4 * v20, v21));
        v23 = (void *)objc_claimAutoreleasedReturnValue( +[SHSignature signatureWithDataRepresentation:error:]( &OBJC_CLASS___SHSignature,  "signatureWithDataRepresentation:error:",  v22,  0LL));
        if (v16)
        {
          SHMediaItemProperty v38 = v33;
          v39 = v16;
          v36 = v15;
          v24 = v9;
          id v25 = v6;
          v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v39,  &v38,  1LL));
          v27 = (void *)objc_claimAutoreleasedReturnValue( +[SHMediaItem mediaItemWithProperties:]( &OBJC_CLASS___SHMediaItem,  "mediaItemWithProperties:",  v26));

          v37 = v27;
          v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v37,  1LL));
          -[SHCustomCatalog addReferenceSignature:representingMediaItems:error:]( v35,  "addReferenceSignature:representingMediaItems:error:",  v23,  v28,  0LL);

          id v6 = v25;
          v9 = v24;
          v15 = v36;

          v4 = v34;
        }

        int v11 = v20 + (v21 >> 2);

        --v8;
      }

      while (v8);
    }

    v29 = objc_alloc(&OBJC_CLASS___CSAdBlockerConfig);
    v5 = v35;
    LODWORD(v30) = v10;
    v31 = -[CSAdBlockerConfig initWithCatalog:withMaxFingerprintBufferSize:shouldResetAdsDic:withAssetVersion:]( v29,  "initWithCatalog:withMaxFingerprintBufferSize:shouldResetAdsDic:withAssetVersion:",  v35,  v4,  0LL,  v30);
  }

  else
  {
    v31 = 0LL;
  }

  return v31;
}

@end
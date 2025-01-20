@interface CSAdBlockerAssetDecoderV3
+ (id)decodeAssetWithData:(id)a3;
@end

@implementation CSAdBlockerAssetDecoderV3

+ (id)decodeAssetWithData:(id)a3
{
  id v3 = a3;
  +[CSConfig defaultContinuousFingerprintBufferDuration]( &OBJC_CLASS___CSConfig,  "defaultContinuousFingerprintBufferDuration");
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v5 = objc_alloc_init(&OBJC_CLASS___SHCustomCatalog);
  id v6 = v3;
  v7 = [v6 bytes];
  int v8 = v7[1];
  int v9 = (-v7[2] & 3) + v7[2];
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subdataWithRange:", 12, v9));
  v11 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v10, 4LL);
  v12 = v11;
  int v13 = v7[(v9 >> 2) + 3];
  if (v13)
  {
    v46 = v11;
    v47 = v10;
    v48 = v5;
    v49 = v4;
    if (v13 >= 1)
    {
      int v14 = (v9 >> 2) + 4;
      v50 = v7;
      id v51 = v6;
      do
      {
        context = objc_autoreleasePoolPush();
        int v15 = v7[v14];
        int v16 = v14 + 1;
        int v17 = (-v15 & 3) + v15;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subdataWithRange:", 4 * v16, v17));
        v19 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v18, 4LL);
        int v20 = v16 + (v17 >> 2);
        uint64_t v21 = v20;
        if (v19)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v7[v20] != 0));
          -[NSMutableDictionary setValue:forKey:](v49, "setValue:forKey:", v22, v19);
        }

        int v23 = v7[v21 + 1];
        int v24 = v21 + 2;
        int v25 = (-v23 & 3) + v23;
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subdataWithRange:", 4 * ((int)v21 + 2), v25));
        id v54 = 0LL;
        v27 = (void *)objc_claimAutoreleasedReturnValue( +[SHSignature signatureWithDataRepresentation:error:]( &OBJC_CLASS___SHSignature,  "signatureWithDataRepresentation:error:",  v26,  &v54));
        id v28 = v54;
        id v29 = v28;
        if (v27) {
          BOOL v30 = v28 == 0LL;
        }
        else {
          BOOL v30 = 0;
        }
        if (!v30)
        {
          v31 = (void *)CSLogCategoryAdBlocker;
          if (os_log_type_enabled(CSLogCategoryAdBlocker, OS_LOG_TYPE_ERROR))
          {
            v38 = v31;
            v39 = (void *)objc_claimAutoreleasedReturnValue([v29 description]);
            *(_DWORD *)buf = 136315394;
            v59 = "+[CSAdBlockerAssetDecoderV3 decodeAssetWithData:]";
            __int16 v60 = 2112;
            v61 = v39;
            _os_log_error_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "%s signature creation is failing with error: %@",  buf,  0x16u);
          }
        }

        if (v19) {
          BOOL v32 = v27 == 0LL;
        }
        else {
          BOOL v32 = 1;
        }
        if (!v32 && v29 == 0LL)
        {
          SHMediaItemProperty v56 = SHMediaItemTitle;
          v57 = v19;
          v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v57,  &v56,  1LL));
          v34 = (void *)objc_claimAutoreleasedReturnValue( +[SHMediaItem mediaItemWithProperties:]( &OBJC_CLASS___SHMediaItem,  "mediaItemWithProperties:",  v35));

          v55 = v34;
          v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v55,  1LL));
          id v53 = 0LL;
          -[SHCustomCatalog addReferenceSignature:representingMediaItems:error:]( v48,  "addReferenceSignature:representingMediaItems:error:",  v27,  v36,  &v53);
          id v29 = v53;

          if (v29)
          {
            v37 = (void *)CSLogCategoryAdBlocker;
            if (os_log_type_enabled(CSLogCategoryAdBlocker, OS_LOG_TYPE_ERROR))
            {
              v40 = v37;
              v45 = (void *)objc_claimAutoreleasedReturnValue([v29 description]);
              *(_DWORD *)buf = 136315394;
              v59 = "+[CSAdBlockerAssetDecoderV3 decodeAssetWithData:]";
              __int16 v60 = 2112;
              v61 = v45;
              _os_log_error_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "%s adding signature to catalog is failing with error: %@",  buf,  0x16u);
            }
          }
        }

        else
        {
          v34 = 0LL;
        }

        int v14 = v24 + (v25 >> 2);

        objc_autoreleasePoolPop(context);
        --v13;
        v7 = v50;
        id v6 = v51;
      }

      while (v13);
    }

    v41 = objc_alloc(&OBJC_CLASS___CSAdBlockerConfig);
    v5 = v48;
    v4 = v49;
    LODWORD(v42) = v8;
    v12 = v46;
    v43 = -[CSAdBlockerConfig initWithCatalog:withMaxFingerprintBufferSize:shouldResetAdsDic:withAssetVersion:]( v41,  "initWithCatalog:withMaxFingerprintBufferSize:shouldResetAdsDic:withAssetVersion:",  v48,  v49,  v46,  v42);
    v10 = v47;
  }

  else
  {
    v43 = 0LL;
  }

  return v43;
}

@end
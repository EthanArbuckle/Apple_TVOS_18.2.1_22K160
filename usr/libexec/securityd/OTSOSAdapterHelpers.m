@interface OTSOSAdapterHelpers
+ (id)peerPublicSigningKeySPKIs:(id)a3;
+ (id)peerPublicSigningKeySPKIsForCircle:(id)a3 error:(id *)a4;
@end

@implementation OTSOSAdapterHelpers

+ (id)peerPublicSigningKeySPKIs:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v20;
    *(void *)&__int128 v7 = 138412290LL;
    __int128 v18 = v7;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "publicSigningKey", v18, (void)v19));
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 encodeSubjectPublicKeyInfo]);

        v14 = sub_10001267C("SecError");
        v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
        if (v13)
        {
          if (v16)
          {
            *(_DWORD *)buf = v18;
            v24 = v11;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "octagon-sos: Created SPKI for peer: %@",  buf,  0xCu);
          }

          [v4 addObject:v13];
        }

        else
        {
          if (v16)
          {
            *(_DWORD *)buf = v18;
            v24 = v11;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "octagon-sos: Can't create SPKI for peer: %@",  buf,  0xCu);
          }
        }
      }

      id v8 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }

    while (v8);
  }

  return v4;
}

+ (id)peerPublicSigningKeySPKIsForCircle:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v21 = 0LL;
  unsigned int v7 = [v6 circleStatus:&v21];
  id v8 = v21;
  uint64_t v9 = v8;
  if (v7 || v8)
  {
    v14 = sub_10001267C("SecError");
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if (v7 + 1 > 4) {
        BOOL v16 = @"kSOSCCError";
      }
      else {
        BOOL v16 = off_100291C60[v7 + 1];
      }
      *(_DWORD *)buf = 138412546;
      v23 = v16;
      __int16 v24 = 2112;
      v25 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "octagon-sos: Not in circle; not preapproving keys: %@ (%@)",
        buf,
        0x16u);
    }

    v13 = 0LL;
    if (a4) {
      *a4 = v9;
    }
  }

  else
  {
    id v20 = 0LL;
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 fetchTrustedPeers:&v20]);
    v11 = (__CFString *)v20;
    v12 = v11;
    if (!v10 || v11)
    {
      v17 = sub_10001267C("SecError");
      __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "octagon-sos: Can't fetch trusted peer SPKIs: %@",  buf,  0xCu);
      }

      v13 = 0LL;
      if (a4) {
        *a4 = v12;
      }
    }

    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([a1 peerPublicSigningKeySPKIs:v10]);
    }
  }

  return v13;
}

@end
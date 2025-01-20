@interface NSPPrivacyTokenManager
+ (id)sharedTokenManager;
- (BOOL)updateTokenFetchURL:(id)a3 accessTokenURL:(id)a4 accessTokenTypes:(id)a5 accessTokenBlockedIssuers:(id)a6 authenticationType:(int)a7 ignoreInvalidCerts:(BOOL)a8;
- (id)description;
- (id)tokenFetchURL;
- (void)copyTokenInfo:(id)a3;
- (void)fetchPairedPrivateAccessTokensForChallenge:(id)a3 overrideAttester:(id)a4 tokenKey:(id)a5 originNameKey:(id)a6 selectedOrigin:(id)a7 pairedChallenge:(id)a8 overridePairedAttester:(id)a9 pairedTokenKey:(id)a10 auditToken:(id)a11 bundleID:(id)a12 allowTools:(BOOL)a13 systemTokenClient:(BOOL)a14 accessToken:(id)a15 completionHandler:(id)a16;
- (void)fetchPrivacyTokensOnInterface:(id)a3 tierType:(id)a4 proxyURL:(id)a5 tokenVendor:(id)a6 tokenIssuancePublicKey:(id)a7 tokenChallenge:(id)a8 tokenCount:(unint64_t)a9 accessToken:(id)a10 retryAttempt:(unint64_t)a11 completionHandler:(id)a12;
- (void)fetchPrivateAccessTokenForChallenge:(id)a3 overrideAttester:(id)a4 customAttester:(id)a5 customAttesterHeaders:(id)a6 tokenKey:(id)a7 originNameKey:(id)a8 selectedOrigin:(id)a9 auxiliaryAuthInfoCacheKey:(id)a10 auditToken:(id)a11 bundleID:(id)a12 allowTools:(BOOL)a13 systemTokenClient:(BOOL)a14 accessToken:(id)a15 completionHandler:(id)a16;
- (void)getTokenServerIPWithInterface:(id)a3 completionHandler:(id)a4;
@end

@implementation NSPPrivacyTokenManager

+ (id)sharedTokenManager
{
  if (qword_100117208 != -1) {
    dispatch_once(&qword_100117208, &stru_1000FAB48);
  }
  return (id)qword_100117200;
}

- (id)description
{
  return @"Privacy Token Manager";
}

- (id)tokenFetchURL
{
  return self->_tokenFetchURL;
}

- (BOOL)updateTokenFetchURL:(id)a3 accessTokenURL:(id)a4 accessTokenTypes:(id)a5 accessTokenBlockedIssuers:(id)a6 authenticationType:(int)a7 ignoreInvalidCerts:(BOOL)a8
{
  uint64_t v9 = *(void *)&a7;
  v15 = (char *)a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  v38 = v18;
  if (!v15)
  {
    uint64_t v34 = nplog_obj(v18, v19, v20);
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v40 = "-[NSPPrivacyTokenManager updateTokenFetchURL:accessTokenURL:accessTokenTypes:accessTokenBlockedIssuers:authe"
            "nticationType:ignoreInvalidCerts:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_FAULT,  "%s called with null tokenFetchURL",  buf,  0xCu);
    }

    goto LABEL_26;
  }

  BOOL v37 = a8;
  uint64_t v21 = nplog_obj(v18, v19, v20);
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  v23 = v22;
  if (!(_DWORD)v9)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v40 = "-[NSPPrivacyTokenManager updateTokenFetchURL:accessTokenURL:accessTokenTypes:accessTokenBlockedIssuers:authe"
            "nticationType:ignoreInvalidCerts:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_FAULT,  "%s called with null (authenticationType != NSPPrivacyProxyAuthenticationInfo_AuthenticationType_UNKNOWN)",  buf,  0xCu);
    }

LABEL_26:
    BOOL v31 = 0;
    goto LABEL_19;
  }

  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    id v36 = v16;
    if (v9 >= 5) {
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  v9));
    }
    else {
      v24 = off_1000FAE08[(int)v9 - 1];
    }
    *(_DWORD *)buf = 138412802;
    v40 = v15;
    __int16 v41 = 2112;
    id v42 = v36;
    __int16 v43 = 2112;
    v44 = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "updating token fetch url %@ access token url %@ authentication type %@",  buf,  0x20u);

    id v16 = v36;
  }

  objc_storeStrong((id *)&self->_tokenFetchURL, a3);
  objc_storeStrong((id *)&self->_accessTokenURL, a4);
  objc_storeStrong((id *)&self->_accessTokenTypes, a5);
  objc_storeStrong((id *)&self->_accessTokenBlockedIssuers, a6);
  self->_ignoreInvalidCerts = v37;
  switch((_DWORD)v9)
  {
    case 3:
      if (!sub_10004C498())
      {
        v32 = &OBJC_CLASS___NSPBAA_Anisette;
        goto LABEL_18;
      }

      goto LABEL_15;
    case 2:
      v32 = &OBJC_CLASS___NSPAnisette;
      goto LABEL_18;
    case 1:
LABEL_15:
      v32 = &OBJC_CLASS___NSPBAA;
LABEL_18:
      self->_authenticationClass = (Class)objc_opt_class(v32);
      BOOL v31 = 1;
      goto LABEL_19;
  }

  id v28 = v16;
  uint64_t v29 = nplog_obj(v25, v26, v27);
  v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v40) = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "invalid authentication type %d", buf, 8u);
  }

  BOOL v31 = 0;
  id v16 = v28;
LABEL_19:

  return v31;
}

- (void)fetchPrivacyTokensOnInterface:(id)a3 tierType:(id)a4 proxyURL:(id)a5 tokenVendor:(id)a6 tokenIssuancePublicKey:(id)a7 tokenChallenge:(id)a8 tokenCount:(unint64_t)a9 accessToken:(id)a10 retryAttempt:(unint64_t)a11 completionHandler:(id)a12
{
  id v126 = a3;
  id v129 = a4;
  id v132 = a5;
  id v128 = a6;
  id v137 = a7;
  id v130 = a8;
  id v127 = a10;
  id v131 = a12;
  uint64_t v17 = NPGetInternalQueue(v131);
  id v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v17);
  dispatch_assert_queue_V2(v18);

  if (!v132)
  {
    uint64_t v110 = nplog_obj(v19, v20, v21);
    v111 = (os_log_s *)objc_claimAutoreleasedReturnValue(v110);
    if (os_log_type_enabled(v111, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v163 = "-[NSPPrivacyTokenManager fetchPrivacyTokensOnInterface:tierType:proxyURL:tokenVendor:tokenIssuancePublicKey"
             ":tokenChallenge:tokenCount:accessToken:retryAttempt:completionHandler:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v111,  OS_LOG_TYPE_FAULT,  "%s called with null proxyURL",  buf,  0xCu);
    }

    goto LABEL_102;
  }

  if (!a9)
  {
    uint64_t v112 = nplog_obj(v19, v20, v21);
    v111 = (os_log_s *)objc_claimAutoreleasedReturnValue(v112);
    if (os_log_type_enabled(v111, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v163 = "-[NSPPrivacyTokenManager fetchPrivacyTokensOnInterface:tierType:proxyURL:tokenVendor:tokenIssuancePublicKey"
             ":tokenChallenge:tokenCount:accessToken:retryAttempt:completionHandler:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v111,  OS_LOG_TYPE_FAULT,  "%s called with null (tokenCount > 0)",  buf,  0xCu);
    }

    goto LABEL_102;
  }

  if (!v137)
  {
    uint64_t v113 = nplog_obj(v19, v20, v21);
    v111 = (os_log_s *)objc_claimAutoreleasedReturnValue(v113);
    if (os_log_type_enabled(v111, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v163 = "-[NSPPrivacyTokenManager fetchPrivacyTokensOnInterface:tierType:proxyURL:tokenVendor:tokenIssuancePublicKey"
             ":tokenChallenge:tokenCount:accessToken:retryAttempt:completionHandler:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v111,  OS_LOG_TYPE_FAULT,  "%s called with null tokenIssuancePublicKey",  buf,  0xCu);
    }

- (void)fetchPrivateAccessTokenForChallenge:(id)a3 overrideAttester:(id)a4 customAttester:(id)a5 customAttesterHeaders:(id)a6 tokenKey:(id)a7 originNameKey:(id)a8 selectedOrigin:(id)a9 auxiliaryAuthInfoCacheKey:(id)a10 auditToken:(id)a11 bundleID:(id)a12 allowTools:(BOOL)a13 systemTokenClient:(BOOL)a14 accessToken:(id)a15 completionHandler:(id)a16
{
  id v21 = a3;
  unint64_t v111 = (unint64_t)a4;
  id v110 = a5;
  id v104 = a6;
  id v107 = a7;
  id v105 = a8;
  id v109 = a9;
  id v106 = a10;
  id v103 = a11;
  id v108 = a12;
  id v113 = a15;
  id v22 = a16;
  uint64_t v23 = NPGetInternalQueue(v22);
  v24 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v23);
  dispatch_assert_queue_V2(v24);

  if (!v21)
  {
    uint64_t v99 = nplog_obj(v25, v26, v27);
    v100 = (os_log_s *)objc_claimAutoreleasedReturnValue(v99);
    if (os_log_type_enabled(v100, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[NSPPrivacyTokenManager fetchPrivateAccessTokenForChallenge:overrideAttester:cust"
                                      "omAttester:customAttesterHeaders:tokenKey:originNameKey:selectedOrigin:auxiliaryAu"
                                      "thInfoCacheKey:auditToken:bundleID:allowTools:systemTokenClient:accessToken:completionHandler:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v100,  OS_LOG_TYPE_FAULT,  "%s called with null challenge",  (uint8_t *)&buf,  0xCu);
    }

    (*((void (**)(id, void, uint64_t, void))v22 + 2))(v22, 0LL, 1004LL, 0LL);
    goto LABEL_83;
  }

  if (!v22)
  {
    uint64_t v101 = nplog_obj(v25, v26, v27);
    v102 = (os_log_s *)objc_claimAutoreleasedReturnValue(v101);
    if (os_log_type_enabled(v102, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[NSPPrivacyTokenManager fetchPrivateAccessTokenForChallenge:overrideAttester:cust"
                                      "omAttester:customAttesterHeaders:tokenKey:originNameKey:selectedOrigin:auxiliaryAu"
                                      "thInfoCacheKey:auditToken:bundleID:allowTools:systemTokenClient:accessToken:completionHandler:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v102,  OS_LOG_TYPE_FAULT,  "%s called with null completionHandler",  (uint8_t *)&buf,  0xCu);
    }

    MEMORY[0x10](0LL, 0LL, 1004LL, 0LL);
    goto LABEL_83;
  }

  if (self) {
    unint64_t v28 = self->_accessTokenURL;
  }
  else {
    unint64_t v28 = 0LL;
  }
  if (v111 | v28)
  {
  }

  else if (!v110)
  {
    uint64_t v29 = nplog_obj(v28, v26, v27);
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "Cannot fetch private access token, no attester URL",  (uint8_t *)&buf,  2u);
    }

    (*((void (**)(id, void, uint64_t, void))v22 + 2))(v22, 0LL, 1005LL, 0LL);
    goto LABEL_83;
  }

  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v21 issuerName]);
  if ([v31 hasSuffix:@"corp.apple.com"])
  {
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v21 issuerName]);
    unsigned int v33 = [v32 containsString:@"idms"];

    if (v113 || (v33 & 1) != 0 || a14)
    {
      if (v33)
      {
        id v37 = v109;
        if (!v37) {
          id v37 = (id)objc_claimAutoreleasedReturnValue([v21 originName]);
        }
        if (([v37 hasSuffix:@".apple.com"] & 1) == 0)
        {
          id v38 = [v37 hasSuffix:@".apple"];
          if ((v38 & 1) == 0)
          {
            uint64_t v97 = nplog_obj(v38, v39, v40);
            v98 = (os_log_s *)objc_claimAutoreleasedReturnValue(v97);
            if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
            {
              LOWORD(buf) = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v98,  OS_LOG_TYPE_INFO,  "Bad origin name for IDMS issuer",  (uint8_t *)&buf,  2u);
            }

            (*((void (**)(id, void, uint64_t, void))v22 + 2))(v22, 0LL, 1001LL, 0LL);
            goto LABEL_83;
          }
        }
      }

      goto LABEL_26;
    }

- (void)fetchPairedPrivateAccessTokensForChallenge:(id)a3 overrideAttester:(id)a4 tokenKey:(id)a5 originNameKey:(id)a6 selectedOrigin:(id)a7 pairedChallenge:(id)a8 overridePairedAttester:(id)a9 pairedTokenKey:(id)a10 auditToken:(id)a11 bundleID:(id)a12 allowTools:(BOOL)a13 systemTokenClient:(BOOL)a14 accessToken:(id)a15 completionHandler:(id)a16
{
  id v21 = a3;
  id v100 = a4;
  id v96 = a5;
  id v92 = a6;
  id v98 = a7;
  id v22 = a8;
  id v99 = a9;
  id v95 = a10;
  id v97 = a11;
  id v94 = a12;
  id v93 = a15;
  id v23 = a16;
  uint64_t v24 = NPGetInternalQueue(v23);
  uint64_t v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v24);
  dispatch_assert_queue_V2(v25);

  if (!v21)
  {
    uint64_t v86 = nplog_obj(v26, v27, v28);
    uint64_t v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[NSPPrivacyTokenManager fetchPairedPrivateAccessTokensForChallenge:overrideAttest"
                                      "er:tokenKey:originNameKey:selectedOrigin:pairedChallenge:overridePairedAttester:pa"
                                      "iredTokenKey:auditToken:bundleID:allowTools:systemTokenClient:accessToken:completionHandler:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_FAULT,  "%s called with null longLivedTokenChallenge",  (uint8_t *)&buf,  0xCu);
    }

    goto LABEL_58;
  }

  if (!v22)
  {
    uint64_t v87 = nplog_obj(v26, v27, v28);
    uint64_t v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[NSPPrivacyTokenManager fetchPairedPrivateAccessTokensForChallenge:overrideAttest"
                                      "er:tokenKey:originNameKey:selectedOrigin:pairedChallenge:overridePairedAttester:pa"
                                      "iredTokenKey:auditToken:bundleID:allowTools:systemTokenClient:accessToken:completionHandler:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_FAULT,  "%s called with null oneTimeTokenChallenge",  (uint8_t *)&buf,  0xCu);
    }

    goto LABEL_58;
  }

  if (v23)
  {
    if (v100 && v99)
    {
      if (a14)
      {
LABEL_7:
        BOOL v29 = sub_1000AB4CC(v21, a14);
        if (v29)
        {
          *(void *)&__int128 buf = 0LL;
          *((void *)&buf + 1) = &buf;
          uint64_t v167 = 0x3032000000LL;
          v168 = sub_1000A47BC;
          v169 = sub_1000A47CC;
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v96 key]);
          id v170 = sub_10004172C((uint64_t)&OBJC_CLASS___NSPPrivateAccessTokenCache, v21, v32);

          uint64_t v33 = *(void *)(*((void *)&buf + 1) + 40LL);
          if (v33)
          {
            LODWORD(v161) = 0;
            uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v95 key]);
            uint64_t v35 = *(void **)(*((void *)&buf + 1) + 40LL);
            id v144 = 0LL;
            id v36 = sub_100041C4C((uint64_t)&OBJC_CLASS___NSPPrivateAccessTokenCache, v22, v34, v21, v35, &v161, &v144);
            id v37 = v144;

            BOOL v91 = v36 == 0LL;
            if (v36)
            {
              (*((void (**)(id, void, id, id, void, void))v23 + 2))( v23,  *(void *)(*((void *)&buf + 1) + 40LL),  v36,  v37,  0LL,  0LL);
              BOOL v38 = v161 >= 0xD;
            }

            else
            {
              BOOL v38 = 0;
            }

            int v39 = !v38;

            if (!v39)
            {
              int v40 = 0;
              BOOL v91 = 0;
              uint64_t v41 = 0LL;
              goto LABEL_48;
            }
          }

          else
          {
            uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue([v21 issuerName]);
            uint64_t v57 = (dispatch_queue_s *)sub_1000A1038((uint64_t)self, v56);

            if (v57)
            {
              uint64_t v61 = nplog_obj(v58, v59, v60);
              uint64_t v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
              if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
              {
                uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue([v21 issuerName]);
                LODWORD(v161) = 138412290;
                *(void *)((char *)&v161 + 4) = v63;
                _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_INFO,  "Waiting for ongoing call to fetch long-lived token for %@",  (uint8_t *)&v161,  0xCu);
              }

              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472LL;
              block[2] = sub_1000A5AC0;
              block[3] = &unk_1000FACB0;
              id v146 = v21;
              id v147 = self;
              id v148 = v100;
              id v149 = v96;
              id v150 = v92;
              id v151 = v98;
              id v152 = v22;
              id v153 = v99;
              id v154 = v95;
              id v155 = v97;
              id v156 = v94;
              BOOL v159 = a13;
              BOOL v160 = a14;
              id v157 = v93;
              id v158 = v23;
              dispatch_async(v57, block);

              goto LABEL_51;
            }

            sub_100042878((uint64_t)&OBJC_CLASS___NSPPrivateAccessTokenCache, v22);
            BOOL v91 = 1;
          }

          uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue([v22 issuerName]);
          uint64_t v65 = (dispatch_queue_s *)sub_1000A1038((uint64_t)self, v64);

          if (v65)
          {
            if (v91)
            {
              uint64_t v69 = nplog_obj(v66, v67, v68);
              BOOL v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
              if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
              {
                BOOL v71 = (void *)objc_claimAutoreleasedReturnValue([v22 issuerName]);
                LODWORD(v161) = 138412290;
                *(void *)((char *)&v161 + 4) = v71;
                _os_log_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_INFO,  "Waiting for ongoing call to fetch one-time token for %@",  (uint8_t *)&v161,  0xCu);
              }

              v128[0] = _NSConcreteStackBlock;
              v128[1] = 3221225472LL;
              v128[2] = sub_1000A5BB0;
              v128[3] = &unk_1000FACB0;
              __int128 v129 = (os_log_s *)v22;
              __int128 v130 = self;
              id v131 = v21;
              id v132 = v100;
              id v133 = v96;
              id v134 = v92;
              id v135 = v98;
              id v136 = v99;
              id v137 = v95;
              id v138 = v97;
              id v139 = v94;
              BOOL v142 = a13;
              BOOL v143 = a14;
              id v140 = v93;
              id v141 = v23;
              dispatch_async(v65, v128);

              int v72 = v129;
            }

            else
            {
              uint64_t v77 = nplog_obj(v66, v67, v68);
              int v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
              if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
              {
                uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue([v22 issuerName]);
                LODWORD(v161) = 138412290;
                *(void *)((char *)&v161 + 4) = v78;
                _os_log_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_INFO,  "Not waiting for ongoing call to fetch one-time token for %@, returned from cache",  (uint8_t *)&v161,  0xCu);
              }
            }

            goto LABEL_51;
          }

          dispatch_group_t v73 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration ephemeralSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "ephemeralSessionConfiguration"));
          v74 = (void *)objc_claimAutoreleasedReturnValue([v73 _socketStreamProperties]);
          if (v74)
          {
            unsigned int v75 = (void *)objc_claimAutoreleasedReturnValue([v73 _socketStreamProperties]);
            uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v75));
          }

          else
          {
            uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
          }

          [v76 setObject:&__kCFBooleanTrue forKeyedSubscript:_kCFStreamPropertyPrefersNoProxy];
          objc_msgSend(v73, "set_socketStreamProperties:", v76);
          [v73 setTimeoutIntervalForRequest:60.0];
          objc_msgSend(v73, "set_sourceApplicationAuditTokenData:", v97);
          objc_msgSend(v73, "set_sourceApplicationBundleIdentifier:", v94);
          objc_msgSend(v73, "set_usesNWLoader:", 1);
          uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:",  v73));
          [v41 setSessionDescription:@"PrivateAccessTokenFetch"];

          int v40 = 50;
LABEL_48:
          *(void *)&__int128 v161 = 0LL;
          *((void *)&v161 + 1) = &v161;
          uint64_t v162 = 0x3032000000LL;
          v163 = sub_1000A47BC;
          __int16 v164 = sub_1000A47CC;
          id v165 = (id)os_transaction_create("com.apple.networkserviceproxy.pairedtokens");
          uint64_t v79 = dispatch_group_create();
          uint64_t v80 = objc_claimAutoreleasedReturnValue([v21 issuerName]);
          uint64_t v81 = (void *)v80;
          if (!v33)
          {
            dispatch_group_enter(v79);
            sub_1000A0DB8((uint64_t)self, v81);
            v115[0] = _NSConcreteStackBlock;
            v115[1] = 3221225472LL;
            v115[2] = sub_1000A5CA0;
            v115[3] = &unk_1000FAD00;
            id v126 = v23;
            v116 = v79;
            uint64_t v117 = self;
            id v118 = v21;
            id v119 = v100;
            id v120 = v96;
            id v121 = v92;
            id v122 = v98;
            id v123 = v94;
            id v124 = v93;
            id v125 = v41;
            p___int128 buf = &buf;
            sub_1000A047C((uint64_t)self, v120, v119, v115);
          }

          uint64_t v82 = NPGetInternalQueue(v80);
          uint64_t v83 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v82);
          v101[0] = _NSConcreteStackBlock;
          v101[1] = 3221225472LL;
          v101[2] = sub_1000A5EDC;
          v101[3] = &unk_1000FADA0;
          v101[4] = self;
          id v102 = v81;
          id v103 = v22;
          unint64_t v111 = &buf;
          BOOL v114 = v91;
          int v113 = v40;
          id v104 = v95;
          id v105 = v99;
          id v110 = v23;
          id v106 = v94;
          id v107 = v93;
          id v108 = v41;
          id v109 = v21;
          uint64_t v112 = &v161;
          id v84 = v41;
          id v85 = v81;
          dispatch_group_notify(v79, v83, v101);

          _Block_object_dispose(&v161, 8);
LABEL_51:
          _Block_object_dispose(&buf, 8);

          goto LABEL_52;
        }

        uint64_t v52 = nplog_obj(v29, v30, v31);
        uint64_t v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_INFO,  "Long-lived token must be cacheable",  (uint8_t *)&buf,  2u);
        }

- (void)copyTokenInfo:(id)a3
{
  id v4 = a3;
  v7 = v4;
  if (v4)
  {
    [v4 setDeviceIdentityValidationCount:dword_100117254];
    [v7 setAnisetteValidationCount:dword_100117250];
    if (self)
    {
      [v7 setRequestedTokenCount:self->_totalRequestedTokenCount];
      [v7 setUnactivatedTokenCount:self->_totalUnactivatedTokenCount];
      unint64_t totalActivatedTokenCount = self->_totalActivatedTokenCount;
    }

    else
    {
      [v7 setRequestedTokenCount:0];
      [v7 setUnactivatedTokenCount:0];
      unint64_t totalActivatedTokenCount = 0LL;
    }

    [v7 setActivatedTokenCount:totalActivatedTokenCount];
  }

  else
  {
    uint64_t v9 = nplog_obj(0LL, v5, v6);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      int v11 = 136315138;
      v12 = "-[NSPPrivacyTokenManager copyTokenInfo:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_FAULT,  "%s called with null proxyInfo",  (uint8_t *)&v11,  0xCu);
    }
  }
}

- (void)getTokenServerIPWithInterface:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10 = (void (**)(void, void))v7;
  if (v6)
  {
    if (self && self->_tokenEndpointResolver)
    {
      (*((void (**)(id, void))v7 + 2))(v7, 0LL);
    }

    else
    {
      int v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyTokenManager tokenFetchURL](self, "tokenFetchURL"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v11));

      if (v12)
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 host]);
        nw_endpoint_t host = nw_endpoint_create_host((const char *)[v16 UTF8String], "443");
        id v18 = nw_parameters_create();
        uint64_t v19 = (nw_interface *)objc_claimAutoreleasedReturnValue([v6 cInterface]);
        nw_parameters_require_interface(v18, v19);

        uint64_t v20 = (void *)nw_resolver_create_with_endpoint(host, v18);
        id v21 = v20;
        if (self)
        {
          objc_storeStrong((id *)&self->_tokenEndpointResolver, v20);

          objc_initWeak((id *)location, self);
          tokenEndpointResolver = self->_tokenEndpointResolver;
        }

        else
        {

          tokenEndpointResolver = 0LL;
          *(void *)location = 0LL;
        }

        id v23 = tokenEndpointResolver;
        uint64_t v24 = NPGetInternalQueue(v23);
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472LL;
        v30[2] = sub_1000A6930;
        v30[3] = &unk_1000FADC8;
        objc_copyWeak(&v32, (id *)location);
        uint64_t v31 = v10;
        nw_resolver_set_update_handler(v23, v25, v30);

        objc_destroyWeak(&v32);
        objc_destroyWeak((id *)location);
      }

      else
      {
        uint64_t v28 = nplog_obj(v13, v14, v15);
        BOOL v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)location = 136315138;
          *(void *)&location[4] = "-[NSPPrivacyTokenManager getTokenServerIPWithInterface:completionHandler:]";
          _os_log_fault_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_FAULT,  "%s called with null url",  location,  0xCu);
        }

        v10[2](v10, 0LL);
      }
    }
  }

  else
  {
    uint64_t v26 = nplog_obj(v7, v8, v9);
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)location = 136315138;
      *(void *)&location[4] = "-[NSPPrivacyTokenManager getTokenServerIPWithInterface:completionHandler:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_FAULT,  "%s called with null interface",  location,  0xCu);
    }

    v10[2](v10, 0LL);
  }
}

- (void).cxx_destruct
{
}

@end
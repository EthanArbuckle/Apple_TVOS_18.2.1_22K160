@interface OnlineAuthAgentURLSessionDelegate
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
@end

@implementation OnlineAuthAgentURLSessionDelegate

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!sub_100007B38()
    || (v10 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.mis"),  unsigned int v11 = -[NSUserDefaults BOOLForKey:](v10, "BOOLForKey:", @"disableServerPinning"),  v10,  !v11))
  {
    uint64_t v81 = 0LL;
    v82 = &v81;
    uint64_t v83 = 0x2020000000LL;
    uint64_t v84 = 0LL;
    uint64_t v77 = 0LL;
    v78 = (SecTrustRef *)&v77;
    uint64_t v79 = 0x2020000000LL;
    uint64_t v80 = 0LL;
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472LL;
    v76[2] = sub_10000A534;
    v76[3] = &unk_1000456D0;
    v76[4] = &v77;
    v76[5] = &v81;
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472LL;
    v73[2] = sub_10000A580;
    v73[3] = &unk_1000456F8;
    v12 = objc_retainBlock(v76);
    id v74 = v12;
    id v13 = v9;
    id v75 = v13;
    v14 = objc_retainBlock(v73);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v8 protectionSpace]);
    v16 = (__SecTrust *)[v15 serverTrust];

    if (!v16)
    {
      id v30 = sub_10000A08C();
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        sub_1000341C4(v31, v32, v33, v34, v35, v36, v37, v38);
      }

      ((void (*)(void *))v14[2])(v14);
      goto LABEL_30;
    }

    CFIndex CertificateCount = SecTrustGetCertificateCount(v16);
    v18 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  CertificateCount);
    if (CertificateCount)
    {
      for (CFIndex i = 0LL; i != CertificateCount; ++i)
        -[NSMutableArray addObject:](v18, "addObject:", SecTrustGetCertificateAtIndex(v16, i));
    }

    ApplePPQService = (const void *)SecPolicyCreateApplePPQService(@"ppq.apple.com", 0LL);
    v82[3] = (uint64_t)ApplePPQService;
    if (ApplePPQService)
    {
      uint64_t v21 = SecTrustCreateWithCertificates(v18, ApplePPQService, v78 + 3);
      if ((_DWORD)v21)
      {
        id v22 = sub_10000A08C();
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          sub_100034320(v21, v23, v24, v25, v26, v27, v28, v29);
        }
      }

      else
      {
        v47 = v78[3];
        if (v47)
        {
          SecTrustResultType result = kSecTrustResultDeny;
          uint64_t v48 = SecTrustEvaluate(v47, &result);
          if ((_DWORD)v48)
          {
            id v49 = sub_10000A08C();
            v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
              sub_1000342BC(v48, v50, v51, v52, v53, v54, v55, v56);
            }
          }

          else
          {
            if (result == kSecTrustResultProceed || result == kSecTrustResultUnspecified)
            {
              ((void (*)(void *))v12[2])(v12);
              (*((void (**)(id, uint64_t, void))v13 + 2))(v13, 1LL, 0LL);
              goto LABEL_29;
            }

            id v65 = sub_10000A08C();
            v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
              sub_100034254((uint64_t)&result, v50, v66, v67, v68, v69, v70, v71);
            }
          }

          ((void (*)(void *))v14[2])(v14);
LABEL_29:

LABEL_30:
          _Block_object_dispose(&v77, 8);
          _Block_object_dispose(&v81, 8);
          goto LABEL_31;
        }

        id v57 = sub_10000A08C();
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          sub_100034224(v23, v58, v59, v60, v61, v62, v63, v64);
        }
      }
    }

    else
    {
      id v39 = sub_10000A08C();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_1000341F4(v23, v40, v41, v42, v43, v44, v45, v46);
      }
    }

    ((void (*)(void *))v14[2])(v14);
    goto LABEL_29;
  }

  (*((void (**)(id, uint64_t, void))v9 + 2))(v9, 1LL, 0LL);
LABEL_31:
}

@end
@interface CAIssuerDelegate
- (BOOL)fetchNext:(id)a3 context:(id)a4;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
@end

@implementation CAIssuerDelegate

- (BOOL)fetchNext:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 context];
  if (v8) {
    uint64_t v9 = v8[34];
  }
  else {
    uint64_t v9 = 0LL;
  }
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CAIssuerDelegate;
  BOOL v10 = -[TrustURLSessionDelegate fetchNext:context:](&v12, "fetchNext:context:", v7, v6);

  if (!v10 && v9) {
    ++*(_DWORD *)(v9 + 24);
  }
  return v10;
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v65.receiver = self;
  v65.super_class = (Class)&OBJC_CLASS___CAIssuerDelegate;
  -[TrustURLSessionDelegate URLSession:task:didCompleteWithError:]( &v65,  "URLSession:task:didCompleteWithError:",  v8,  v9,  v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 originalRequest]);
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v11 taskId]);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionDelegate contextForTask:](self, "contextForTask:", v12));
  v14 = v13;
  if (v13)
  {
    uint64_t v61 = 0LL;
    v62 = &v61;
    uint64_t v63 = 0x2020000000LL;
    id v64 = (id)0xAAAAAAAAAAAAAAAALL;
    id v64 = [v13 context];
    uint64_t v15 = v62[3];
    if (!v15)
    {
      -[TrustURLSessionDelegate removeTask:](self, "removeTask:", v12);
LABEL_37:
      _Block_object_dispose(&v61, 8);
      goto LABEL_38;
    }

    double v41 = *(double *)(v15 + 272);
    uint64_t v55 = 0LL;
    v56 = &v55;
    uint64_t v57 = 0x3032000000LL;
    v58 = sub_10001D808;
    v59 = sub_10001D818;
    id v60 = 0LL;
    if (v10)
    {
      v16 = sub_10000856C("caissuer");
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue([v9 originalRequest]);
        v19 = (void *)objc_claimAutoreleasedReturnValue([v18 URL]);
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v19;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Failed to download issuer %@, with error %@",  buf,  0x16u);
      }

      if (v41 != 0.0) {
        ++*(_DWORD *)(*(void *)&v41 + 40LL);
      }
      goto LABEL_23;
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue([v14 response]);

    if (!v22) {
      goto LABEL_23;
    }
    v23 = (const __CFData *)(id)objc_claimAutoreleasedReturnValue([v14 response]);
    SecCertificateRef v24 = SecCertificateCreateWithData(0LL, v23);
    SecCertificateRef v25 = v24;
    if (v24) {
      goto LABEL_14;
    }
    uint64_t v26 = SecCMSCertificatesOnlyMessageCopyCertificates(v23);
    if (!v26)
    {
      SecCertificateRef v24 = (SecCertificateRef)SecCertificateCreateWithPEM(0LL, v23);
      SecCertificateRef v25 = v24;
      if (v24)
      {
LABEL_14:
        *(void *)buf = v24;
        uint64_t v26 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", buf, 1LL));
        CFRelease(v25);
        goto LABEL_18;
      }

      uint64_t v26 = 0LL;
    }

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v7 = a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a4 originalRequest]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 taskId]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionDelegate contextForTask:](self, "contextForTask:", v9));
  v11 = v10;
  if (!v10)
  {
    v16 = sub_10000856C("http");
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      v18 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "failed to find context for %@",  (uint8_t *)&v17,  0xCu);
    }

    goto LABEL_7;
  }

  objc_super v12 = [v10 context];
  if (v12)
  {
    uint64_t v13 = v12[34];
    if (v13)
    {
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 taskInterval]);
      -[os_log_s duration](v14, "duration");
      *(void *)(v13 + 32) += (unint64_t)(v15 * 1000000000.0);
LABEL_7:
    }
  }
}

@end
@interface NWURLSessionDelegateWrapper
- (_BYTE)delegateFor__schemeUpgraded;
- (_BYTE)delegateFor_betterRouteDiscovered;
- (_BYTE)delegateFor_didBecomeDownloadTask;
- (_BYTE)delegateFor_didBecomeStreamTask;
- (_BYTE)delegateFor_didCloseWithCode;
- (_BYTE)delegateFor_didCompleteWithError;
- (_BYTE)delegateFor_didCreateTask;
- (_BYTE)delegateFor_didFinishCollectingMetrics;
- (_BYTE)delegateFor_didFinishDownloadingToURL;
- (_BYTE)delegateFor_didOpenWithProtocol;
- (_BYTE)delegateFor_didReceiveData_withCB;
- (_BYTE)delegateFor_didReceiveData_withoutCB;
- (_BYTE)delegateFor_didReceiveInformationalResponse;
- (_BYTE)delegateFor_didSendBodyData;
- (_BYTE)delegateFor_didWriteData;
- (_BYTE)delegateFor_isWaitingForConnectivity;
- (_BYTE)delegateFor_needNewBodyStream;
- (_BYTE)delegateFor_needNewBodyStreamFromOffset;
- (_BYTE)delegateFor_readClosed;
- (_BYTE)delegateFor_sessionDidBecomeInvalidWithError;
- (_BYTE)delegateFor_sessionDidReceiveChallenge;
- (_BYTE)delegateFor_willCacheResponse;
- (_BYTE)delegateFor_willPerformHTTPRedirection;
- (_BYTE)delegateFor_writeClosed;
- (char)delegateFor_didReceiveChallenge;
- (char)delegateFor_didReceiveResponse;
- (char)delegateFor_didResumeAtOffset;
- (id)initWithFallbackDelegateWrapper:(id *)a1;
- (void)dataTask:(void *)a3 didBecomeDownloadTask:(void *)a4 completionHandler:;
- (void)dataTask:(void *)a3 didBecomeStreamTask:(void *)a4 completionHandler:;
- (void)downloadTask:(uint64_t)a3 didResumeAtOffset:(uint64_t)a4 expectedTotalBytes:;
- (void)readClosedForStreamTask:(uint64_t)a1;
- (void)runCompletionHandler:(int)a3 noAsync:(void *)a4 task:(void *)a5 metrics:(void *)a6 cachedResponse:(void *)a7 cache:;
- (void)runDelegateBlock:(uint64_t)a1;
- (void)saveCachedResponseOnDelegateQueue:(void *)a3 cache:(void *)a4 dataTask:(void *)a5 delegateForCache:;
- (void)task:(void *)a3 didCompleteWithError:(void *)a4 metrics:;
- (void)task:(void *)a3 didReceiveChallenge:(void *)a4 completionHandler:;
- (void)task:(void *)a3 didReceiveInformationalResponse:;
- (void)task:(void *)a3 willPerformHTTPRedirection:(void *)a4 newRequest:(void *)a5 completionHandler:;
@end

@implementation NWURLSessionDelegateWrapper

- (void).cxx_destruct
{
}

- (id)initWithFallbackDelegateWrapper:(id *)a1
{
  v4 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_CLASS___NWURLSessionDelegateWrapper;
    v5 = (id *)objc_msgSendSuper2(&v9, sel_init);
    a1 = v5;
    if (v5)
    {
      if (v4)
      {
        v5[4] = (id)v4[4];
        v6 = (void *)v4[5];
      }

      else
      {
        v6 = 0LL;
        v5[4] = 0LL;
      }

      objc_storeStrong(v5 + 5, v6);
      if (v4) {
        v7 = (void *)v4[6];
      }
      else {
        v7 = 0LL;
      }
      objc_storeStrong(a1 + 6, v7);
      objc_storeStrong(a1 + 3, a2);
    }
  }

  return a1;
}

- (_BYTE)delegateFor_sessionDidBecomeInvalidWithError
{
  if (a1)
  {
    v2 = a1;
    if ((a1[8] & 1) != 0)
    {
      if ((a1[11] & 0x40) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v2, a2, 16LL, 1);
        return a1;
      }
    }

    else
    {
      objc_getProperty(a1, a2, 16LL, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v3 = 64;
      }
      else {
        int v3 = 0;
      }
      v2[11] = v2[11] & 0xBF | v3;
      v2[8] |= 1u;
      if (v3) {
        goto LABEL_4;
      }
    }

    -[NWURLSessionDelegateWrapper delegateFor_sessionDidBecomeInvalidWithError](*((void *)v2 + 3));
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (_BYTE)delegateFor_sessionDidReceiveChallenge
{
  if (a1)
  {
    v2 = a1;
    if ((a1[8] & 2) != 0)
    {
      if ((a1[11] & 0x80) == 0)
      {
LABEL_4:
        -[NWURLSessionDelegateWrapper delegateFor_sessionDidReceiveChallenge](*((void *)v2 + 3));
        a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
        return a1;
      }
    }

    else
    {
      objc_getProperty(a1, a2, 16LL, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        char v3 = 0x80;
      }
      else {
        char v3 = 0;
      }
      char v4 = v3 & 0x80 | v2[11] & 0x7F;
      v2[11] = v4;
      v2[8] |= 2u;
      if ((v4 & 0x80) == 0) {
        goto LABEL_4;
      }
    }

    a1 = objc_getProperty(v2, a2, 16LL, 1);
  }

  return a1;
}

- (_BYTE)delegateFor_didCreateTask
{
  if (a1)
  {
    v2 = a1;
    if ((a1[8] & 8) != 0)
    {
      if ((a1[12] & 2) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v2, a2, 16LL, 1);
        return a1;
      }
    }

    else
    {
      objc_getProperty(a1, a2, 16LL, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v3 = 2;
      }
      else {
        int v3 = 0;
      }
      v2[12] = v2[12] & 0xFD | v3;
      v2[8] |= 8u;
      if (v3) {
        goto LABEL_4;
      }
    }

    -[NWURLSessionDelegateWrapper delegateFor_didCreateTask](*((void *)v2 + 3));
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (_BYTE)delegateFor_isWaitingForConnectivity
{
  if (a1)
  {
    v2 = a1;
    if ((a1[8] & 0x20) != 0)
    {
      if ((a1[12] & 8) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v2, a2, 16LL, 1);
        return a1;
      }
    }

    else
    {
      objc_getProperty(a1, a2, 16LL, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v3 = 8;
      }
      else {
        int v3 = 0;
      }
      v2[12] = v2[12] & 0xF7 | v3;
      v2[8] |= 0x20u;
      if (v3) {
        goto LABEL_4;
      }
    }

    -[NWURLSessionDelegateWrapper delegateFor_isWaitingForConnectivity](*((void *)v2 + 3));
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (_BYTE)delegateFor_willPerformHTTPRedirection
{
  if (a1)
  {
    v2 = a1;
    if ((a1[8] & 0x40) != 0)
    {
      if ((a1[12] & 0x10) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v2, a2, 16LL, 1);
        return a1;
      }
    }

    else
    {
      objc_getProperty(a1, a2, 16LL, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v3 = 16;
      }
      else {
        int v3 = 0;
      }
      v2[12] = v2[12] & 0xEF | v3;
      v2[8] |= 0x40u;
      if (v3) {
        goto LABEL_4;
      }
    }

    -[NWURLSessionDelegateWrapper delegateFor_willPerformHTTPRedirection](*((void *)v2 + 3));
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (char)delegateFor_didReceiveChallenge
{
  if (a1)
  {
    v2 = a1;
    if (a1[8] < 0)
    {
      if ((a1[12] & 0x20) != 0)
      {
LABEL_4:
        a1 = (char *)objc_getProperty(v2, a2, 16LL, 1);
        return a1;
      }
    }

    else
    {
      objc_getProperty(a1, a2, 16LL, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v3 = 32;
      }
      else {
        int v3 = 0;
      }
      v2[12] = v2[12] & 0xDF | v3;
      v2[8] |= 0x80u;
      if (v3) {
        goto LABEL_4;
      }
    }

    -[NWURLSessionDelegateWrapper delegateFor_didReceiveChallenge](*((void *)v2 + 3));
    a1 = (char *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (_BYTE)delegateFor_needNewBodyStream
{
  if (a1)
  {
    v2 = a1;
    if ((a1[9] & 1) != 0)
    {
      if ((a1[12] & 0x40) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v2, a2, 16LL, 1);
        return a1;
      }
    }

    else
    {
      objc_getProperty(a1, a2, 16LL, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v3 = 64;
      }
      else {
        int v3 = 0;
      }
      v2[12] = v2[12] & 0xBF | v3;
      v2[9] |= 1u;
      if (v3) {
        goto LABEL_4;
      }
    }

    -[NWURLSessionDelegateWrapper delegateFor_needNewBodyStream](*((void *)v2 + 3));
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (_BYTE)delegateFor_needNewBodyStreamFromOffset
{
  if (a1)
  {
    v2 = a1;
    if ((a1[9] & 2) != 0)
    {
      if ((a1[12] & 0x80) == 0)
      {
LABEL_4:
        -[NWURLSessionDelegateWrapper delegateFor_needNewBodyStreamFromOffset](*((void *)v2 + 3));
        a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
        return a1;
      }
    }

    else
    {
      objc_getProperty(a1, a2, 16LL, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        char v3 = 0x80;
      }
      else {
        char v3 = 0;
      }
      char v4 = v3 & 0x80 | v2[12] & 0x7F;
      v2[12] = v4;
      v2[9] |= 2u;
      if ((v4 & 0x80) == 0) {
        goto LABEL_4;
      }
    }

    a1 = objc_getProperty(v2, a2, 16LL, 1);
  }

  return a1;
}

- (_BYTE)delegateFor_didSendBodyData
{
  if (a1)
  {
    v2 = a1;
    if ((a1[9] & 4) != 0)
    {
      if ((a1[13] & 1) == 0)
      {
LABEL_4:
        -[NWURLSessionDelegateWrapper delegateFor_didSendBodyData](*((void *)v2 + 3));
        a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
        return a1;
      }
    }

    else
    {
      objc_getProperty(a1, a2, 16LL, 1);
      char v3 = v2[13] & 0xFE | objc_opt_respondsToSelector() & 1;
      v2[13] = v3;
      v2[9] |= 4u;
      if ((v3 & 1) == 0) {
        goto LABEL_4;
      }
    }

    a1 = objc_getProperty(v2, a2, 16LL, 1);
  }

  return a1;
}

- (_BYTE)delegateFor_didFinishCollectingMetrics
{
  if (a1)
  {
    v2 = a1;
    if ((a1[9] & 8) != 0)
    {
      if ((a1[13] & 2) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v2, a2, 16LL, 1);
        return a1;
      }
    }

    else
    {
      objc_getProperty(a1, a2, 16LL, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v3 = 2;
      }
      else {
        int v3 = 0;
      }
      v2[13] = v2[13] & 0xFD | v3;
      v2[9] |= 8u;
      if (v3) {
        goto LABEL_4;
      }
    }

    -[NWURLSessionDelegateWrapper delegateFor_didFinishCollectingMetrics](*((void *)v2 + 3));
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (_BYTE)delegateFor_didCompleteWithError
{
  if (a1)
  {
    v2 = a1;
    if ((a1[9] & 0x10) != 0)
    {
      if ((a1[13] & 4) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v2, a2, 16LL, 1);
        return a1;
      }
    }

    else
    {
      objc_getProperty(a1, a2, 16LL, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v3 = 4;
      }
      else {
        int v3 = 0;
      }
      v2[13] = v2[13] & 0xFB | v3;
      v2[9] |= 0x10u;
      if (v3) {
        goto LABEL_4;
      }
    }

    -[NWURLSessionDelegateWrapper delegateFor_didCompleteWithError](*((void *)v2 + 3));
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (_BYTE)delegateFor__schemeUpgraded
{
  if (a1)
  {
    v2 = a1;
    if ((a1[9] & 0x20) != 0)
    {
      if ((a1[13] & 8) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v2, a2, 16LL, 1);
        return a1;
      }
    }

    else
    {
      objc_getProperty(a1, a2, 16LL, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v3 = 8;
      }
      else {
        int v3 = 0;
      }
      v2[13] = v2[13] & 0xF7 | v3;
      v2[9] |= 0x20u;
      if (v3) {
        goto LABEL_4;
      }
    }

    -[NWURLSessionDelegateWrapper delegateFor__schemeUpgraded](*((void *)v2 + 3));
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (_BYTE)delegateFor_didReceiveInformationalResponse
{
  if (a1)
  {
    v2 = a1;
    if ((a1[9] & 0x40) != 0)
    {
      if ((a1[13] & 0x10) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v2, a2, 16LL, 1);
        return a1;
      }
    }

    else
    {
      objc_getProperty(a1, a2, 16LL, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v3 = 16;
      }
      else {
        int v3 = 0;
      }
      v2[13] = v2[13] & 0xEF | v3;
      v2[9] |= 0x40u;
      if (v3) {
        goto LABEL_4;
      }
    }

    -[NWURLSessionDelegateWrapper delegateFor_didReceiveInformationalResponse](*((void *)v2 + 3));
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (char)delegateFor_didReceiveResponse
{
  if (a1)
  {
    v2 = a1;
    if (a1[9] < 0)
    {
      if ((a1[13] & 0x20) != 0)
      {
LABEL_4:
        a1 = (char *)objc_getProperty(v2, a2, 16LL, 1);
        return a1;
      }
    }

    else
    {
      objc_getProperty(a1, a2, 16LL, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v3 = 32;
      }
      else {
        int v3 = 0;
      }
      v2[13] = v2[13] & 0xDF | v3;
      v2[9] |= 0x80u;
      if (v3) {
        goto LABEL_4;
      }
    }

    -[NWURLSessionDelegateWrapper delegateFor_didReceiveResponse](*((void *)v2 + 3));
    a1 = (char *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (_BYTE)delegateFor_didBecomeDownloadTask
{
  if (a1)
  {
    v2 = a1;
    if ((a1[10] & 1) != 0)
    {
      if ((a1[13] & 0x40) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v2, a2, 16LL, 1);
        return a1;
      }
    }

    else
    {
      objc_getProperty(a1, a2, 16LL, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v3 = 64;
      }
      else {
        int v3 = 0;
      }
      v2[13] = v2[13] & 0xBF | v3;
      v2[10] |= 1u;
      if (v3) {
        goto LABEL_4;
      }
    }

    -[NWURLSessionDelegateWrapper delegateFor_didBecomeDownloadTask](*((void *)v2 + 3));
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (_BYTE)delegateFor_didBecomeStreamTask
{
  if (a1)
  {
    v2 = a1;
    if ((a1[10] & 2) != 0)
    {
      if ((a1[13] & 0x80) == 0)
      {
LABEL_4:
        -[NWURLSessionDelegateWrapper delegateFor_didBecomeStreamTask](*((void *)v2 + 3));
        a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
        return a1;
      }
    }

    else
    {
      objc_getProperty(a1, a2, 16LL, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        char v3 = 0x80;
      }
      else {
        char v3 = 0;
      }
      char v4 = v3 & 0x80 | v2[13] & 0x7F;
      v2[13] = v4;
      v2[10] |= 2u;
      if ((v4 & 0x80) == 0) {
        goto LABEL_4;
      }
    }

    a1 = objc_getProperty(v2, a2, 16LL, 1);
  }

  return a1;
}

- (_BYTE)delegateFor_didReceiveData_withoutCB
{
  if (a1)
  {
    v2 = a1;
    if ((a1[10] & 4) != 0)
    {
      if ((a1[14] & 1) == 0)
      {
LABEL_4:
        -[NWURLSessionDelegateWrapper delegateFor_didReceiveData_withoutCB](*((void *)v2 + 3));
        a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
        return a1;
      }
    }

    else
    {
      objc_getProperty(a1, a2, 16LL, 1);
      char v3 = v2[14] & 0xFE | objc_opt_respondsToSelector() & 1;
      v2[14] = v3;
      v2[10] |= 4u;
      if ((v3 & 1) == 0) {
        goto LABEL_4;
      }
    }

    a1 = objc_getProperty(v2, a2, 16LL, 1);
  }

  return a1;
}

- (_BYTE)delegateFor_didReceiveData_withCB
{
  if (a1)
  {
    v2 = a1;
    if ((a1[10] & 8) != 0)
    {
      if ((a1[14] & 2) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v2, a2, 16LL, 1);
        return a1;
      }
    }

    else
    {
      objc_getProperty(a1, a2, 16LL, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v3 = 2;
      }
      else {
        int v3 = 0;
      }
      v2[14] = v2[14] & 0xFD | v3;
      v2[10] |= 8u;
      if (v3) {
        goto LABEL_4;
      }
    }

    -[NWURLSessionDelegateWrapper delegateFor_didReceiveData_withCB](*((void *)v2 + 3));
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (_BYTE)delegateFor_willCacheResponse
{
  if (a1)
  {
    v2 = a1;
    if ((a1[10] & 0x10) != 0)
    {
      if ((a1[14] & 4) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v2, a2, 16LL, 1);
        return a1;
      }
    }

    else
    {
      objc_getProperty(a1, a2, 16LL, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v3 = 4;
      }
      else {
        int v3 = 0;
      }
      v2[14] = v2[14] & 0xFB | v3;
      v2[10] |= 0x10u;
      if (v3) {
        goto LABEL_4;
      }
    }

    -[NWURLSessionDelegateWrapper delegateFor_willCacheResponse](*((void *)v2 + 3));
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (_BYTE)delegateFor_didFinishDownloadingToURL
{
  if (a1)
  {
    v2 = a1;
    if ((a1[10] & 0x20) != 0)
    {
      if ((a1[14] & 8) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v2, a2, 16LL, 1);
        return a1;
      }
    }

    else
    {
      objc_getProperty(a1, a2, 16LL, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v3 = 8;
      }
      else {
        int v3 = 0;
      }
      v2[14] = v2[14] & 0xF7 | v3;
      v2[10] |= 0x20u;
      if (v3) {
        goto LABEL_4;
      }
    }

    -[NWURLSessionDelegateWrapper delegateFor_didFinishDownloadingToURL](*((void *)v2 + 3));
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (_BYTE)delegateFor_didWriteData
{
  if (a1)
  {
    v2 = a1;
    if ((a1[10] & 0x40) != 0)
    {
      if ((a1[14] & 0x10) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v2, a2, 16LL, 1);
        return a1;
      }
    }

    else
    {
      objc_getProperty(a1, a2, 16LL, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v3 = 16;
      }
      else {
        int v3 = 0;
      }
      v2[14] = v2[14] & 0xEF | v3;
      v2[10] |= 0x40u;
      if (v3) {
        goto LABEL_4;
      }
    }

    -[NWURLSessionDelegateWrapper delegateFor_didWriteData](*((void *)v2 + 3));
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (char)delegateFor_didResumeAtOffset
{
  if (a1)
  {
    v2 = a1;
    if (a1[10] < 0)
    {
      if ((a1[14] & 0x20) != 0)
      {
LABEL_4:
        a1 = (char *)objc_getProperty(v2, a2, 16LL, 1);
        return a1;
      }
    }

    else
    {
      objc_getProperty(a1, a2, 16LL, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v3 = 32;
      }
      else {
        int v3 = 0;
      }
      v2[14] = v2[14] & 0xDF | v3;
      v2[10] |= 0x80u;
      if (v3) {
        goto LABEL_4;
      }
    }

    -[NWURLSessionDelegateWrapper delegateFor_didResumeAtOffset](*((void *)v2 + 3));
    a1 = (char *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (_BYTE)delegateFor_readClosed
{
  if (a1)
  {
    v2 = a1;
    if ((a1[11] & 1) != 0)
    {
      if ((a1[14] & 0x40) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v2, a2, 16LL, 1);
        return a1;
      }
    }

    else
    {
      objc_getProperty(a1, a2, 16LL, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v3 = 64;
      }
      else {
        int v3 = 0;
      }
      v2[14] = v2[14] & 0xBF | v3;
      v2[11] |= 1u;
      if (v3) {
        goto LABEL_4;
      }
    }

    -[NWURLSessionDelegateWrapper delegateFor_readClosed](*((void *)v2 + 3));
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (_BYTE)delegateFor_writeClosed
{
  if (a1)
  {
    v2 = a1;
    if ((a1[11] & 2) != 0)
    {
      if ((a1[14] & 0x80) == 0)
      {
LABEL_4:
        -[NWURLSessionDelegateWrapper delegateFor_writeClosed](*((void *)v2 + 3));
        a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
        return a1;
      }
    }

    else
    {
      objc_getProperty(a1, a2, 16LL, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        char v3 = 0x80;
      }
      else {
        char v3 = 0;
      }
      char v4 = v3 & 0x80 | v2[14] & 0x7F;
      v2[14] = v4;
      v2[11] |= 2u;
      if ((v4 & 0x80) == 0) {
        goto LABEL_4;
      }
    }

    a1 = objc_getProperty(v2, a2, 16LL, 1);
  }

  return a1;
}

- (_BYTE)delegateFor_betterRouteDiscovered
{
  if (a1)
  {
    v2 = a1;
    if ((a1[11] & 4) != 0)
    {
      if ((a1[15] & 1) == 0)
      {
LABEL_4:
        -[NWURLSessionDelegateWrapper delegateFor_betterRouteDiscovered](*((void *)v2 + 3));
        a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
        return a1;
      }
    }

    else
    {
      objc_getProperty(a1, a2, 16LL, 1);
      char v3 = v2[15] & 0xFE | objc_opt_respondsToSelector() & 1;
      v2[15] = v3;
      v2[11] |= 4u;
      if ((v3 & 1) == 0) {
        goto LABEL_4;
      }
    }

    a1 = objc_getProperty(v2, a2, 16LL, 1);
  }

  return a1;
}

- (_BYTE)delegateFor_didOpenWithProtocol
{
  if (a1)
  {
    v2 = a1;
    if ((a1[11] & 0x10) != 0)
    {
      if ((a1[15] & 4) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v2, a2, 16LL, 1);
        return a1;
      }
    }

    else
    {
      objc_getProperty(a1, a2, 16LL, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v3 = 4;
      }
      else {
        int v3 = 0;
      }
      v2[15] = v2[15] & 0xFB | v3;
      v2[11] |= 0x10u;
      if (v3) {
        goto LABEL_4;
      }
    }

    -[NWURLSessionDelegateWrapper delegateFor_didOpenWithProtocol](*((void *)v2 + 3));
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (_BYTE)delegateFor_didCloseWithCode
{
  if (a1)
  {
    v2 = a1;
    if ((a1[11] & 0x20) != 0)
    {
      if ((a1[15] & 8) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v2, a2, 16LL, 1);
        return a1;
      }
    }

    else
    {
      objc_getProperty(a1, a2, 16LL, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v3 = 8;
      }
      else {
        int v3 = 0;
      }
      v2[15] = v2[15] & 0xF7 | v3;
      v2[11] |= 0x20u;
      if (v3) {
        goto LABEL_4;
      }
    }

    -[NWURLSessionDelegateWrapper delegateFor_didCloseWithCode](*((void *)v2 + 3));
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (void)runDelegateBlock:(uint64_t)a1
{
  if (a1) {
    -[NWURLSessionDelegateQueue runDelegateBlock:](*(void **)(a1 + 48), a2);
  }
}

- (void)runCompletionHandler:(int)a3 noAsync:(void *)a4 task:(void *)a5 metrics:(void *)a6 cachedResponse:(void *)a7 cache:
{
  v13 = a2;
  v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v18 = a7;
  if (a1)
  {
    v20 = -[NWURLSessionDelegateWrapper delegateFor_willCacheResponse]((_BYTE *)a1, v17);
    if (v15)
    {
      v21 = -[NWURLSessionDelegateWrapper delegateFor_didFinishCollectingMetrics]((_BYTE *)a1, v19);
      if (!a3) {
        goto LABEL_12;
      }
    }

    else
    {
      v21 = 0LL;
      if (!a3) {
        goto LABEL_12;
      }
    }

    if (!v20 && !v21)
    {
      v13[2](v13);
      if (v14)
      {
        v23 = (void *)v14[30];
        if (v23) {
          objc_setProperty_atomic(v23, v22, 0LL, 16LL);
        }
        v24 = (void *)v14[31];
        v14[31] = 0LL;
      }

      goto LABEL_13;
    }

void __94__NWURLSessionDelegateWrapper_runCompletionHandler_noAsync_task_metrics_cachedResponse_cache___block_invoke( uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3)
  {
    char v4 = *(void **)(v3 + 240);
    if (v4) {
      objc_setProperty_atomic(v4, v2, 0LL, 16LL);
    }
    v5 = *(void **)(v3 + 248);
    *(void *)(v3 + 248) = 0LL;
  }

- (void)saveCachedResponseOnDelegateQueue:(void *)a3 cache:(void *)a4 dataTask:(void *)a5 delegateForCache:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (a1 && v9)
  {
    if (v12)
    {
      v14 = objc_alloc(&OBJC_CLASS___NWURLSessionDelegateDeallocBomb);
      id v15 = v13;
      if (v14)
      {
        v24.receiver = v14;
        v24.super_class = (Class)&OBJC_CLASS___NWURLSessionDelegateDeallocBomb;
        id v16 = (NWURLSessionDelegateDeallocBomb *)objc_msgSendSuper2(&v24, sel_init);
        v14 = v16;
        if (v16)
        {
          objc_storeStrong((id *)&v16->__object, a5);
          v14->__method = sel_URLSession_dataTask_willCacheResponse_completionHandler_;
        }
      }

      uint64_t v17 = *(void *)(a1 + 32);
      v19[0] = MEMORY[0x1895F87A8];
      v19[1] = 3221225472LL;
      v19[2] = __97__NWURLSessionDelegateWrapper_saveCachedResponseOnDelegateQueue_cache_dataTask_delegateForCache___block_invoke;
      v19[3] = &unk_189BC6E88;
      v20 = v14;
      uint64_t v21 = a1;
      id v22 = v10;
      id v23 = v11;
      id v18 = v14;
      [v15 URLSession:v17 dataTask:v23 willCacheResponse:v9 completionHandler:v19];
    }

    else
    {
      [v10 storeCachedResponse:v9 forDataTask:v11];
    }
  }
}

void __97__NWURLSessionDelegateWrapper_saveCachedResponseOnDelegateQueue_cache_dataTask_delegateForCache___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  -[NWURLSessionDelegateDeallocBomb disarm](*(void *)(a1 + 32));
  if (v3)
  {
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __97__NWURLSessionDelegateWrapper_saveCachedResponseOnDelegateQueue_cache_dataTask_delegateForCache___block_invoke_2;
    v6[3] = &unk_189BC6E60;
    uint64_t v4 = *(void *)(a1 + 40);
    id v7 = *(id *)(a1 + 48);
    id v8 = v3;
    id v5 = *(id *)(a1 + 56);
    id v9 = v5;
    if (v4)
    {
      -[NWURLSessionDelegateQueue runDelegateBlock:](*(void **)(v4 + 48), v6);
      id v5 = v9;
    }
  }
}

uint64_t __97__NWURLSessionDelegateWrapper_saveCachedResponseOnDelegateQueue_cache_dataTask_delegateForCache___block_invoke_2( uint64_t a1)
{
  return [*(id *)(a1 + 32) storeCachedResponse:*(void *)(a1 + 40) forDataTask:*(void *)(a1 + 48)];
}

void __57__NWURLSessionDelegateWrapper_didBecomeInvalidWithError___block_invoke(uint64_t a1)
{
  id v3 = *(void **)(a1 + 56);
  if (v3) {
    objc_setProperty_atomic(v3, v2, 0LL, 16LL);
  }
}

uint64_t __60__NWURLSessionDelegateWrapper_taskIsWaitingForConnectivity___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) taskIsWaitingForConnectivity:*(void *)(a1 + 48)];
}

- (void)task:(void *)a3 willPerformHTTPRedirection:(void *)a4 newRequest:(void *)a5 completionHandler:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v13 = a5;
  if (a1)
  {
    v14 = -[NWURLSessionDelegateWrapper delegateFor_willPerformHTTPRedirection]((_BYTE *)a1, v12);
    if (v14)
    {
      id v15 = *(id *)(a1 + 32);
      id v16 = *(id *)(a1 + 40);
      uint64_t v17 = objc_alloc(&OBJC_CLASS___NWURLSessionDelegateDeallocBomb);
      id v18 = v14;
      if (v17)
      {
        v33.receiver = v17;
        v33.super_class = (Class)&OBJC_CLASS___NWURLSessionDelegateDeallocBomb;
        v19 = (NWURLSessionDelegateDeallocBomb *)objc_msgSendSuper2(&v33, sel_init);
        uint64_t v17 = v19;
        if (v19)
        {
          objc_storeStrong((id *)&v19->__object, v14);
          v17->__method = sel_task_willPerformHTTPRedirection_newRequest_completionHandler_;
        }
      }

      v24[0] = MEMORY[0x1895F87A8];
      v24[1] = 3221225472LL;
      v24[2] = __92__NWURLSessionDelegateWrapper_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke;
      v24[3] = &unk_189BC6F28;
      id v25 = v18;
      id v26 = v15;
      id v27 = v9;
      id v28 = v10;
      id v29 = v11;
      id v30 = v17;
      id v31 = v16;
      id v32 = v13;
      v20 = *(void **)(a1 + 48);
      id v21 = v16;
      id v22 = v17;
      id v23 = v15;
      -[NWURLSessionDelegateQueue runDelegateBlock:](v20, v24);
    }

    else
    {
      (*((void (**)(id, id))v13 + 2))(v13, v11);
    }
  }
}

void __92__NWURLSessionDelegateWrapper_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke( uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __92__NWURLSessionDelegateWrapper_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2;
  v7[3] = &unk_189BC6F00;
  uint64_t v6 = *(void *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  id v9 = *(id *)(a1 + 80);
  id v10 = *(id *)(a1 + 88);
  [v2 URLSession:v3 task:v4 willPerformHTTPRedirection:v5 newRequest:v6 completionHandler:v7];
}

void __92__NWURLSessionDelegateWrapper_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2( uint64_t a1,  void *a2)
{
  id v3 = a2;
  -[NWURLSessionDelegateDeallocBomb disarm](*(void *)(a1 + 32));
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __92__NWURLSessionDelegateWrapper_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_3;
  v7[3] = &unk_189BC91E8;
  uint64_t v4 = *(dispatch_queue_s **)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __92__NWURLSessionDelegateWrapper_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_3( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

- (void)task:(void *)a3 didReceiveChallenge:(void *)a4 completionHandler:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    [v8 protectionSpace];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 authenticationMethod];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (([v11 isEqualToString:*MEMORY[0x189601E58]] & 1) != 0
      || ([v11 isEqualToString:*MEMORY[0x189601E40]] & 1) != 0
      || [v11 isEqualToString:*MEMORY[0x189601E50]])
    {
    }

    else
    {
      int v25 = [v11 isEqualToString:*MEMORY[0x189601E48]];

      if (!v25) {
        goto LABEL_12;
      }
    }

    uint64_t v13 = -[NWURLSessionDelegateWrapper delegateFor_sessionDidReceiveChallenge]((_BYTE *)a1, v12);
    if (v13)
    {
      v14 = (void *)v13;
      id v15 = *(id *)(a1 + 32);
      id v16 = *(id *)(a1 + 40);
      uint64_t v17 = objc_alloc(&OBJC_CLASS___NWURLSessionDelegateDeallocBomb);
      id v18 = v14;
      if (v17)
      {
        v52.receiver = v17;
        v52.super_class = (Class)&OBJC_CLASS___NWURLSessionDelegateDeallocBomb;
        v19 = (NWURLSessionDelegateDeallocBomb *)objc_msgSendSuper2(&v52, sel_init);
        uint64_t v17 = v19;
        if (v19)
        {
          objc_storeStrong((id *)&v19->__object, v14);
          v17->__method = sel_task_didReceiveChallenge_completionHandler_;
        }
      }

      v45[0] = MEMORY[0x1895F87A8];
      v45[1] = 3221225472LL;
      v45[2] = __74__NWURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke;
      v45[3] = &unk_189BC6F78;
      id v46 = v18;
      id v47 = v15;
      id v48 = v8;
      v49 = v17;
      id v50 = v16;
      id v51 = v9;
      v20 = *(void **)(a1 + 48);
      id v21 = v16;
      id v22 = v17;
      id v23 = v15;
      id v24 = v18;
      -[NWURLSessionDelegateQueue runDelegateBlock:](v20, v45);

LABEL_18:
      goto LABEL_19;
    }

void __74__NWURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __74__NWURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke_2;
  v5[3] = &unk_189BC6F50;
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  [v2 URLSession:v3 didReceiveChallenge:v4 completionHandler:v5];
}

void __74__NWURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke_4( uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __74__NWURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke_5;
  v6[3] = &unk_189BC6F50;
  id v7 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  id v9 = *(id *)(a1 + 80);
  [v2 URLSession:v3 task:v4 didReceiveChallenge:v5 completionHandler:v6];
}

void __74__NWURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke_5( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v5 = a3;
  -[NWURLSessionDelegateDeallocBomb disarm](*(void *)(a1 + 32));
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __74__NWURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke_6;
  block[3] = &unk_189BC6EB0;
  id v6 = *(dispatch_queue_s **)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  uint64_t v11 = a2;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __74__NWURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke_6( void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16LL))(a1[5], a1[6], a1[4]);
}

void __74__NWURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v5 = a3;
  -[NWURLSessionDelegateDeallocBomb disarm](*(void *)(a1 + 32));
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __74__NWURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke_3;
  block[3] = &unk_189BC6EB0;
  id v6 = *(dispatch_queue_s **)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  uint64_t v11 = a2;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __74__NWURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke_3( void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16LL))(a1[5], a1[6], a1[4]);
}

void __82__NWURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke( uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 80);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __82__NWURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke_2;
  v6[3] = &unk_189BC6FA0;
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  id v9 = *(id *)(a1 + 72);
  [v2 URLSession:v3 task:v5 needNewBodyStreamFromOffset:v4 completionHandler:v6];
}

void __82__NWURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke_4( uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __82__NWURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke_5;
  v5[3] = &unk_189BC6FA0;
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  [v2 URLSession:v3 task:v4 needNewBodyStream:v5];
}

void __82__NWURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke_5( uint64_t a1,  void *a2)
{
  id v3 = a2;
  -[NWURLSessionDelegateDeallocBomb disarm](*(void *)(a1 + 32));
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __82__NWURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke_6;
  v7[3] = &unk_189BC91E8;
  uint64_t v4 = *(dispatch_queue_s **)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __82__NWURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke_6( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void __82__NWURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke_2( uint64_t a1,  void *a2)
{
  id v3 = a2;
  -[NWURLSessionDelegateDeallocBomb disarm](*(void *)(a1 + 32));
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __82__NWURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke_3;
  v7[3] = &unk_189BC91E8;
  uint64_t v4 = *(dispatch_queue_s **)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __82__NWURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke_3( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void __110__NWURLSessionDelegateWrapper_task_didSendBodyData_totalBytesSent_totalBytesExpectedToSend_completionHandler___block_invoke( uint64_t a1)
{
}

- (void)task:(void *)a3 didCompleteWithError:(void *)a4 metrics:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v11 = v9;
  if (a1)
  {
    if (v9)
    {
      uint64_t v12 = -[NWURLSessionDelegateWrapper delegateFor_didFinishCollectingMetrics]((_BYTE *)a1, v10);
    }

    else
    {
      uint64_t v12 = 0LL;
    }

    uint64_t v13 = -[NWURLSessionDelegateWrapper delegateFor_didCompleteWithError]((_BYTE *)a1, v10);
    if (v12 | v13)
    {
      id v14 = *(id *)(a1 + 32);
      v17[0] = MEMORY[0x1895F87A8];
      v17[1] = 3221225472LL;
      v17[2] = __65__NWURLSessionDelegateWrapper_task_didCompleteWithError_metrics___block_invoke;
      v17[3] = &unk_189BC7018;
      id v18 = (id)v12;
      id v19 = v14;
      id v20 = v7;
      id v21 = v11;
      id v22 = (id)v13;
      id v23 = v8;
      id v15 = *(void **)(a1 + 48);
      id v16 = v14;
      -[NWURLSessionDelegateQueue runDelegateBlock:](v15, v17);
    }
  }
}

void __65__NWURLSessionDelegateWrapper_task_didCompleteWithError_metrics___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    uint64_t v4 = *(void **)(v3 + 240);
    if (v4) {
      objc_setProperty_atomic(v4, v2, 0LL, 16LL);
    }
    id v5 = *(void **)(v3 + 248);
    *(void *)(v3 + 248) = 0LL;
  }

void __70__NWURLSessionDelegateWrapper_task__schemeUpgraded_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __70__NWURLSessionDelegateWrapper_task__schemeUpgraded_completionHandler___block_invoke_2;
  v6[3] = &unk_189BC6F00;
  id v7 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  id v9 = *(id *)(a1 + 80);
  objc_msgSend(v2, "URLSession:task:_schemeUpgraded:completionHandler:", v3, v4, v5, v6);
}

void __70__NWURLSessionDelegateWrapper_task__schemeUpgraded_completionHandler___block_invoke_2( uint64_t a1,  void *a2)
{
  id v3 = a2;
  -[NWURLSessionDelegateDeallocBomb disarm](*(void *)(a1 + 32));
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __70__NWURLSessionDelegateWrapper_task__schemeUpgraded_completionHandler___block_invoke_3;
  v7[3] = &unk_189BC91E8;
  uint64_t v4 = *(dispatch_queue_s **)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __70__NWURLSessionDelegateWrapper_task__schemeUpgraded_completionHandler___block_invoke_3( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

- (void)task:(void *)a3 didReceiveInformationalResponse:
{
  id v5 = a2;
  id v7 = a3;
  if (a1)
  {
    -[NWURLSessionDelegateWrapper delegateFor_didReceiveInformationalResponse]((_BYTE *)a1, v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      id v9 = *(id *)(a1 + 32);
      v12[0] = MEMORY[0x1895F87A8];
      v12[1] = 3221225472LL;
      v12[2] = __68__NWURLSessionDelegateWrapper_task_didReceiveInformationalResponse___block_invoke;
      v12[3] = &unk_189BC7848;
      id v13 = v8;
      id v14 = v9;
      id v15 = v5;
      id v16 = v7;
      id v10 = *(void **)(a1 + 48);
      id v11 = v9;
      -[NWURLSessionDelegateQueue runDelegateBlock:](v10, v12);
    }
  }
}

uint64_t __68__NWURLSessionDelegateWrapper_task_didReceiveInformationalResponse___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) task:*(void *)(a1 + 48) didReceiveInformationalResponse:*(void *)(a1 + 56)];
}

void __77__NWURLSessionDelegateWrapper_dataTask_didReceiveResponse_completionHandler___block_invoke( uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __77__NWURLSessionDelegateWrapper_dataTask_didReceiveResponse_completionHandler___block_invoke_2;
  v6[3] = &unk_189BC7040;
  id v7 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  id v9 = *(id *)(a1 + 80);
  [v2 URLSession:v3 dataTask:v4 didReceiveResponse:v5 completionHandler:v6];
}

void __77__NWURLSessionDelegateWrapper_dataTask_didReceiveResponse_completionHandler___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __77__NWURLSessionDelegateWrapper_dataTask_didReceiveResponse_completionHandler___block_invoke_3;
  v5[3] = &unk_189BC73D0;
  uint64_t v4 = *(dispatch_queue_s **)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = a2;
  dispatch_async(v4, v5);
}

uint64_t __77__NWURLSessionDelegateWrapper_dataTask_didReceiveResponse_completionHandler___block_invoke_3( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(void *)(a1 + 40));
}

- (void)dataTask:(void *)a3 didBecomeDownloadTask:(void *)a4 completionHandler:
{
  id v7 = a2;
  id v8 = a3;
  id v10 = a4;
  if (a1)
  {
    -[NWURLSessionDelegateWrapper delegateFor_didBecomeDownloadTask]((_BYTE *)a1, v9);
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      id v12 = *(id *)(a1 + 32);
      id v13 = *(id *)(a1 + 40);
      v17[0] = MEMORY[0x1895F87A8];
      v17[1] = 3221225472LL;
      v17[2] = __80__NWURLSessionDelegateWrapper_dataTask_didBecomeDownloadTask_completionHandler___block_invoke;
      v17[3] = &unk_189BC6F78;
      id v18 = v11;
      id v19 = v12;
      id v20 = v7;
      id v21 = v8;
      id v22 = v13;
      id v23 = v10;
      id v14 = *(void **)(a1 + 48);
      id v15 = v13;
      id v16 = v12;
      -[NWURLSessionDelegateQueue runDelegateBlock:](v14, v17);
    }

    else
    {
      v10[2](v10);
    }
  }
}

void __80__NWURLSessionDelegateWrapper_dataTask_didBecomeDownloadTask_completionHandler___block_invoke( uint64_t a1)
{
}

- (void)dataTask:(void *)a3 didBecomeStreamTask:(void *)a4 completionHandler:
{
  id v7 = a2;
  id v8 = a3;
  id v10 = a4;
  if (a1)
  {
    -[NWURLSessionDelegateWrapper delegateFor_didBecomeStreamTask]((_BYTE *)a1, v9);
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      id v12 = *(id *)(a1 + 32);
      id v13 = *(id *)(a1 + 40);
      v17[0] = MEMORY[0x1895F87A8];
      v17[1] = 3221225472LL;
      v17[2] = __78__NWURLSessionDelegateWrapper_dataTask_didBecomeStreamTask_completionHandler___block_invoke;
      v17[3] = &unk_189BC6F78;
      id v18 = v11;
      id v19 = v12;
      id v20 = v7;
      id v21 = v8;
      id v22 = v13;
      id v23 = v10;
      id v14 = *(void **)(a1 + 48);
      id v15 = v13;
      id v16 = v12;
      -[NWURLSessionDelegateQueue runDelegateBlock:](v14, v17);
    }

    else
    {
      v10[2](v10);
    }
  }
}

void __78__NWURLSessionDelegateWrapper_dataTask_didBecomeStreamTask_completionHandler___block_invoke( uint64_t a1)
{
}

void __117__NWURLSessionDelegateWrapper_dataTask_didReceiveData_complete_error_metrics_cachedResponse_cache_completionHandler___block_invoke( uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __117__NWURLSessionDelegateWrapper_dataTask_didReceiveData_complete_error_metrics_cachedResponse_cache_completionHandler___block_invoke_2;
    v14[3] = &unk_189BC91E8;
    uint64_t v5 = &v15;
    uint64_t v6 = *(void *)(a1 + 56);
    id v15 = *(id *)(a1 + 64);
    id v16 = *(id *)(a1 + 144);
    objc_msgSend(v2, "URLSession:dataTask:_didReceiveData:completionHandler:", v3, v4, v6, v14);
  }

  else
  {
    [*(id *)(a1 + 72) URLSession:*(void *)(a1 + 40) dataTask:*(void *)(a1 + 48) didReceiveData:*(void *)(a1 + 56)];
    id v7 = *(dispatch_queue_s **)(a1 + 64);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __117__NWURLSessionDelegateWrapper_dataTask_didReceiveData_complete_error_metrics_cachedResponse_cache_completionHandler___block_invoke_4;
    block[3] = &unk_189BC8740;
    uint64_t v5 = &v13;
    id v13 = *(id *)(a1 + 144);
    dispatch_async(v7, block);
  }

  if (*(_BYTE *)(a1 + 152))
  {
    -[NWURLSessionDelegateWrapper saveCachedResponseOnDelegateQueue:cache:dataTask:delegateForCache:]( *(void *)(a1 + 80),  *(void **)(a1 + 88),  *(void **)(a1 + 96),  *(void **)(a1 + 48),  *(void **)(a1 + 104));
    [*(id *)(a1 + 112) URLSession:*(void *)(a1 + 40) task:*(void *)(a1 + 48) didFinishCollectingMetrics:*(void *)(a1 + 120)];
    [*(id *)(a1 + 128) URLSession:*(void *)(a1 + 40) task:*(void *)(a1 + 48) didCompleteWithError:*(void *)(a1 + 136)];
    uint64_t v9 = *(void *)(a1 + 48);
    if (v9)
    {
      id v10 = *(void **)(v9 + 240);
      if (v10) {
        objc_setProperty_atomic(v10, v8, 0LL, 16LL);
      }
      id v11 = *(void **)(v9 + 248);
      *(void *)(v9 + 248) = 0LL;
    }
  }

void __117__NWURLSessionDelegateWrapper_dataTask_didReceiveData_complete_error_metrics_cachedResponse_cache_completionHandler___block_invoke_2( uint64_t a1)
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __117__NWURLSessionDelegateWrapper_dataTask_didReceiveData_complete_error_metrics_cachedResponse_cache_completionHandler___block_invoke_3;
  block[3] = &unk_189BC8740;
  v1 = *(dispatch_queue_s **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t __117__NWURLSessionDelegateWrapper_dataTask_didReceiveData_complete_error_metrics_cachedResponse_cache_completionHandler___block_invoke_4( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __117__NWURLSessionDelegateWrapper_dataTask_didReceiveData_complete_error_metrics_cachedResponse_cache_completionHandler___block_invoke_3( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __102__NWURLSessionDelegateWrapper_downloadTask_didFinishDownloadingToURL_error_metrics_completionHandler___block_invoke( uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    uint64_t v4 = *(void **)(v3 + 240);
    if (v4) {
      objc_setProperty_atomic(v4, v2, 0LL, 16LL);
    }
    uint64_t v5 = *(void **)(v3 + 248);
    *(void *)(v3 + 248) = 0LL;
  }

  dispatch_async(*(dispatch_queue_t *)(a1 + 96), *(dispatch_block_t *)(a1 + 104));
}

void __119__NWURLSessionDelegateWrapper_downloadTask_didWriteData_totalBytesWritten_totalBytesExpectedToWrite_completionHandler___block_invoke( uint64_t a1)
{
}

- (void)downloadTask:(uint64_t)a3 didResumeAtOffset:(uint64_t)a4 expectedTotalBytes:
{
  id v8 = a2;
  if (a1)
  {
    -[NWURLSessionDelegateWrapper delegateFor_didResumeAtOffset]((char *)a1, v7);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      id v10 = *(id *)(a1 + 32);
      v13[0] = MEMORY[0x1895F87A8];
      v13[1] = 3221225472LL;
      v13[2] = __81__NWURLSessionDelegateWrapper_downloadTask_didResumeAtOffset_expectedTotalBytes___block_invoke;
      v13[3] = &unk_189BC70B8;
      id v14 = v9;
      id v15 = v10;
      id v16 = v8;
      uint64_t v17 = a3;
      uint64_t v18 = a4;
      id v11 = *(void **)(a1 + 48);
      id v12 = v10;
      -[NWURLSessionDelegateQueue runDelegateBlock:](v11, v13);
    }
  }
}

uint64_t __81__NWURLSessionDelegateWrapper_downloadTask_didResumeAtOffset_expectedTotalBytes___block_invoke( uint64_t a1)
{
  return [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) downloadTask:*(void *)(a1 + 48) didResumeAtOffset:*(void *)(a1 + 56) expectedTotalBytes:*(void *)(a1 + 64)];
}

- (void)readClosedForStreamTask:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    -[NWURLSessionDelegateWrapper delegateFor_readClosed]((_BYTE *)a1, v3);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      id v6 = *(id *)(a1 + 32);
      v9[0] = MEMORY[0x1895F87A8];
      v9[1] = 3221225472LL;
      v9[2] = __55__NWURLSessionDelegateWrapper_readClosedForStreamTask___block_invoke;
      v9[3] = &unk_189BC6E60;
      id v10 = v5;
      id v11 = v6;
      id v12 = v4;
      id v7 = *(void **)(a1 + 48);
      id v8 = v6;
      -[NWURLSessionDelegateQueue runDelegateBlock:](v7, v9);
    }
  }
}

uint64_t __55__NWURLSessionDelegateWrapper_readClosedForStreamTask___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) readClosedForStreamTask:*(void *)(a1 + 48)];
}

uint64_t __56__NWURLSessionDelegateWrapper_writeClosedForStreamTask___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) writeClosedForStreamTask:*(void *)(a1 + 48)];
}

uint64_t __66__NWURLSessionDelegateWrapper_betterRouteDiscoveredForStreamTask___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) betterRouteDiscoveredForStreamTask:*(void *)(a1 + 48)];
}

uint64_t __65__NWURLSessionDelegateWrapper_webSocketTask_didOpenWithProtocol___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) webSocketTask:*(void *)(a1 + 48) didOpenWithProtocol:*(void *)(a1 + 56)];
}

uint64_t __69__NWURLSessionDelegateWrapper_webSocketTask_didCloseWithCode_reason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) webSocketTask:*(void *)(a1 + 48) didCloseWithCode:*(void *)(a1 + 64) reason:*(void *)(a1 + 56)];
}

@end
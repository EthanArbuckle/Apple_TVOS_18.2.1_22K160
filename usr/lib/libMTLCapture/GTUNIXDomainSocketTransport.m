@interface GTUNIXDomainSocketTransport
@end

@implementation GTUNIXDomainSocketTransport

id __38__GTUNIXDomainSocketTransport_connect__block_invoke(uint64_t a1)
{
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[52])
  {
    uint64_t v3 = 32LL;
LABEL_3:
    objc_msgSend( *(id *)(a1 + 40),  "setError:",  +[GTError_capture errorWithDomain:code:userInfo:]( GTError_capture,  "errorWithDomain:code:userInfo:",  @"DYErrorDomain",  v3,  0));
    uint64_t v4 = 0LL;
    return objc_msgSend( *(id *)(a1 + 40),  "setResult:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
  }

  if ([v2 connected])
  {
    uint64_t v4 = 1LL;
    return objc_msgSend( *(id *)(a1 + 40),  "setResult:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
  }

  id v6 = [*(id *)(*(void *)(a1 + 32) + 8) filePathURL];
  if (*(void *)(*(void *)(a1 + 32) + 8LL)) {
    BOOL v7 = v6 == 0LL;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    uint64_t v3 = 257LL;
    goto LABEL_3;
  }

  id v8 = [v6 path];
  v9 = *(_DWORD **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  if (v9[65] == 2) {
    return [v9 _connectServer:v8 future:v10];
  }
  else {
    return [v9 _connectClient:v8 future:v10];
  }
}

_BYTE *__53__GTUNIXDomainSocketTransport__connectServer_future___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 264LL) = 0LL;
  result = *(_BYTE **)(a1 + 32);
  if (result[52])
  {
    objc_msgSend(*(id *)(a1 + 40), "setError:", objc_msgSend(result, "error"));
    return objc_msgSend( *(id *)(a1 + 40),  "setResult:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
  }

  return result;
}

id __53__GTUNIXDomainSocketTransport__connectServer_future___block_invoke_2(uint64_t a1)
{
  id result = (id)dispatch_source_testcancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 264LL));
  if (!result)
  {
    socklen_t v9 = 106;
    uint64_t v3 = accept(*(_DWORD *)(a1 + 48), &v10, &v9);
    if ((_DWORD)v3 == -1)
    {
      BOOL v7 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  *__error(),  0LL);
      id v8 = *(void **)(a1 + 40);
      id v6 = (id *)(a1 + 40);
      [v8 setError:v7];
      v5 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL);
    }

    else
    {
      uint64_t v4 = v3;
      dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 264LL));
      [*(id *)(a1 + 32) runWithSocket:v4];
      v5 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL);
      id v6 = (id *)(a1 + 40);
    }

    return [*v6 setResult:v5];
  }

  return result;
}

void *__38__GTUNIXDomainSocketTransport_setUrl___block_invoke(void *result)
{
  v1 = *(void **)(result[5] + 8LL);
  if ((void *)result[4] != v1)
  {
    v2 = result;

    id result = (id)v2[4];
    *(void *)(v2[5] + 8LL) = result;
  }

  return result;
}

@end
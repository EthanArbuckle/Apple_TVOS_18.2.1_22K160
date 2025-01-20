@interface NSCFBackgroundSessionTask
@end

@implementation NSCFBackgroundSessionTask

void *__70____NSCFBackgroundSessionTask_set_TLSMaximumSupportedProtocolVersion___block_invoke(uint64_t a1)
{
  result = (void *)-[__NSURLBackgroundSession ensureRemoteSession]([*(id *)(a1 + 32) session]);
  if (result) {
    return (void *)objc_msgSend( result,  "setTLSMaximumSupportedProtocolVersion:forTaskWithIdentifier:",  *(unsigned __int16 *)(a1 + 40),  objc_msgSend(*(id *)(a1 + 32), "taskIdentifier"));
  }
  return result;
}

void *__70____NSCFBackgroundSessionTask_set_TLSMinimumSupportedProtocolVersion___block_invoke(uint64_t a1)
{
  result = (void *)-[__NSURLBackgroundSession ensureRemoteSession]([*(id *)(a1 + 32) session]);
  if (result) {
    return (void *)objc_msgSend( result,  "setTLSMinimumSupportedProtocolVersion:forTaskWithIdentifier:",  *(unsigned __int16 *)(a1 + 40),  objc_msgSend(*(id *)(a1 + 32), "taskIdentifier"));
  }
  return result;
}

void *__57____NSCFBackgroundSessionTask_set_discretionaryOverride___block_invoke(uint64_t a1)
{
  result = (void *)-[__NSURLBackgroundSession ensureRemoteSession]([*(id *)(a1 + 32) session]);
  if (result) {
    return (void *)objc_msgSend( result,  "setDiscretionaryOverride:forTaskWithIdentifier:",  *(void *)(a1 + 40),  objc_msgSend(*(id *)(a1 + 32), "taskIdentifier"));
  }
  return result;
}

void *__50____NSCFBackgroundSessionTask_setTaskDescription___block_invoke(uint64_t a1)
{
  result = (void *)-[__NSURLBackgroundSession ensureRemoteSession]([*(id *)(a1 + 32) session]);
  if (result) {
    return (void *)objc_msgSend( result,  "setDescription:forTask:",  *(void *)(a1 + 40),  objc_msgSend(*(id *)(a1 + 32), "taskIdentifier"));
  }
  return result;
}

uint64_t __95____NSCFBackgroundSessionTask__onqueue_willSendRequestForEstablishedConnection_withCompletion___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

NSDictionary *__49____NSCFBackgroundSessionTask_cookiesForRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  result = +[NSHTTPCookie requestHeaderFieldsWithCookies:]( &OBJC_CLASS___NSHTTPCookie,  "requestHeaderFieldsWithCookies:",  a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) = result;
  return result;
}

@end
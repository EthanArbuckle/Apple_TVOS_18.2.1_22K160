@interface NSPCandidateFallbackProxyPath
- (BOOL)proxyPathIsValid:(id)a3 proxyPathList:(id)a4;
@end

@implementation NSPCandidateFallbackProxyPath

- (BOOL)proxyPathIsValid:(id)a3 proxyPathList:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath ingressProxy](self, "ingressProxy"));
  v9 = (void *)v8;
  if (v8) {
    v10 = *(void **)(v8 + 24);
  }
  else {
    v10 = 0LL;
  }
  id v11 = v10;
  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath egressProxy](self, "egressProxy"));
  v13 = (void *)v12;
  if (v12) {
    v14 = *(void **)(v12 + 24);
  }
  else {
    v14 = 0LL;
  }
  id v15 = v14;
  BOOL v16 = +[NSPPrivacyProxyAgentManager proxiesMatch:proxyPathList:ingressProxy:egressProxy:pathWeight:supportsFallback:]( &OBJC_CLASS___NSPPrivacyProxyAgentManager,  "proxiesMatch:proxyPathList:ingressProxy:egressProxy:pathWeight:supportsFallback:",  v7,  v6,  v11,  v15,  -[NSPCandidateProxyPath proxyPathWeight](self, "proxyPathWeight"),  1LL);

  return v16;
}

@end
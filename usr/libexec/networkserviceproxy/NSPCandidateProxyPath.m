@interface NSPCandidateProxyPath
+ (BOOL)supportsSecureCoding;
- (BOOL)matchEgress:(id)a3;
- (BOOL)matchIngress:(id)a3;
- (BOOL)proxyPathReady;
- (NSArray)preferredPathPatterns;
- (NSData)domainFilter;
- (NSPCandidateProxyPath)initWithCoder:(id)a3;
- (NSPCandidateProxyPath)initWithIngressProxy:(id)a3 egressProxy:(id)a4 proxyPathWeight:(unint64_t)a5 preferredPathConfigURI:(id)a6 preferredPathPatterns:(id)a7;
- (NSPProxyTokenInfo)egressProxy;
- (NSPProxyTokenInfo)ingressProxy;
- (NSString)preferredPathConfigURI;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)proxyPathWeight;
- (void)encodeWithCoder:(id)a3;
- (void)fetchDomainFilter:(id)a3;
- (void)setDomainFilter:(id)a3;
- (void)setEgressProxy:(id)a3;
- (void)setIngressProxy:(id)a3;
- (void)setPreferredPathConfigURI:(id)a3;
- (void)setPreferredPathPatterns:(id)a3;
- (void)setProxyPathWeight:(unint64_t)a3;
@end

@implementation NSPCandidateProxyPath

- (NSPCandidateProxyPath)initWithIngressProxy:(id)a3 egressProxy:(id)a4 proxyPathWeight:(unint64_t)a5 preferredPathConfigURI:(id)a6 preferredPathPatterns:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v20 = v16;
  if (!v13)
  {
    uint64_t v26 = nplog_obj(v16, v17, v18, v19);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    if (!os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_FAULT))
    {
LABEL_10:

      v24 = 0LL;
      goto LABEL_6;
    }

    *(_DWORD *)buf = 136315138;
    v32 = "-[NSPCandidateProxyPath initWithIngressProxy:egressProxy:proxyPathWeight:preferredPathConfigURI:preferredPathPatterns:]";
    v28 = "%s called with null ingressProxy";
LABEL_12:
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)v27, OS_LOG_TYPE_FAULT, v28, buf, 0xCu);
    goto LABEL_10;
  }

  if (!v14)
  {
    uint64_t v29 = nplog_obj(v16, v17, v18, v19);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v29);
    if (!os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    *(_DWORD *)buf = 136315138;
    v32 = "-[NSPCandidateProxyPath initWithIngressProxy:egressProxy:proxyPathWeight:preferredPathConfigURI:preferredPathPatterns:]";
    v28 = "%s called with null egressProxy";
    goto LABEL_12;
  }

  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___NSPCandidateProxyPath;
  v21 = -[NSPCandidateProxyPath init](&v30, "init");
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_ingressProxy, a3);
    objc_storeStrong((id *)&v22->_egressProxy, a4);
    v22->_proxyPathWeight = a5;
    objc_storeStrong((id *)&v22->_preferredPathConfigURI, a6);
    objc_storeStrong((id *)&v22->_preferredPathPatterns, a7);
    domainFilter = v22->_domainFilter;
    v22->_domainFilter = 0LL;
  }

  self = v22;
  v24 = self;
LABEL_6:

  return v24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPCandidateProxyPath)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___NSPCandidateProxyPath;
  v5 = -[NSPCandidateProxyPath init](&v21, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSPProxyTokenInfo) forKey:@"candidateProxyPathIngressProxy"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    ingressProxy = v5->_ingressProxy;
    v5->_ingressProxy = (NSPProxyTokenInfo *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSPProxyTokenInfo) forKey:@"candidateProxyPathEgressProxy"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    egressProxy = v5->_egressProxy;
    v5->_egressProxy = (NSPProxyTokenInfo *)v10;

    v5->_proxyPathWeight = (unint64_t)[v4 decodeIntegerForKey:@"candidateProxyPathWeight"];
    id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"candidateProxyPreferredPathConfigURI"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    preferredPathConfigURI = v5->_preferredPathConfigURI;
    v5->_preferredPathConfigURI = (NSString *)v13;

    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSArray);
    id v16 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v15,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    uint64_t v18 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v17 forKey:@"candidateProxyPreferredPathPatterns"]);
    preferredPathPatterns = v5->_preferredPathPatterns;
    v5->_preferredPathPatterns = (NSArray *)v18;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath ingressProxy](self, "ingressProxy"));
  [v4 encodeObject:v5 forKey:@"candidateProxyPathIngressProxy"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath egressProxy](self, "egressProxy"));
  [v4 encodeObject:v6 forKey:@"candidateProxyPathEgressProxy"];

  objc_msgSend( v4,  "encodeInteger:forKey:",  -[NSPCandidateProxyPath proxyPathWeight](self, "proxyPathWeight"),  @"candidateProxyPathWeight");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath preferredPathConfigURI](self, "preferredPathConfigURI"));
  [v4 encodeObject:v7 forKey:@"candidateProxyPreferredPathConfigURI"];

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath preferredPathPatterns](self, "preferredPathPatterns"));
  [v4 encodeObject:v8 forKey:@"candidateProxyPreferredPathPatterns"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = -[NSPCandidateProxyPath init]( +[NSPCandidateProxyPath allocWithZone:](&OBJC_CLASS___NSPCandidateProxyPath, "allocWithZone:", a3),  "init");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath ingressProxy](self, "ingressProxy"));
  -[NSPCandidateProxyPath setIngressProxy:](v4, "setIngressProxy:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath egressProxy](self, "egressProxy"));
  -[NSPCandidateProxyPath setEgressProxy:](v4, "setEgressProxy:", v6);

  -[NSPCandidateProxyPath setProxyPathWeight:]( v4,  "setProxyPathWeight:",  -[NSPCandidateProxyPath proxyPathWeight](self, "proxyPathWeight"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath preferredPathConfigURI](self, "preferredPathConfigURI"));
  -[NSPCandidateProxyPath setPreferredPathConfigURI:](v4, "setPreferredPathConfigURI:", v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath preferredPathPatterns](self, "preferredPathPatterns"));
  -[NSPCandidateProxyPath setPreferredPathPatterns:](v4, "setPreferredPathPatterns:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath domainFilter](self, "domainFilter"));
  -[NSPCandidateProxyPath setDomainFilter:](v4, "setDomainFilter:", v9);

  return v4;
}

- (BOOL)proxyPathReady
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath preferredPathConfigURI](self, "preferredPathConfigURI"));
  if (v3)
  {
    id v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath domainFilter](self, "domainFilter"));

    if (!v5)
    {
      uint64_t v52 = nplog_obj(v6, v7, v8);
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        LOWORD(v54) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "proxy path is not ready due to absent domain filter",  (uint8_t *)&v54,  2u);
      }

      goto LABEL_26;
    }
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath ingressProxy](self, "ingressProxy"));
  if (sub_10000C67C((uint64_t)v9))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath ingressProxy](self, "ingressProxy"));
    unint64_t v11 = sub_10000E688((uint64_t)v10);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath ingressProxy](self, "ingressProxy"));
    unint64_t v13 = sub_10000F2E8((uint64_t)v12);

    if (v11 <= v13)
    {
      uint64_t v17 = nplog_obj(v14, v15, v16);
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath ingressProxy](self, "ingressProxy"));
        uint64_t v20 = sub_10000E688((uint64_t)v19);
        uint64_t v21 = objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath ingressProxy](self, "ingressProxy"));
        v22 = (void *)v21;
        if (v21) {
          v23 = *(void **)(v21 + 24);
        }
        else {
          v23 = 0LL;
        }
        id v24 = v23;
        v25 = (void *)objc_claimAutoreleasedReturnValue([v24 vendor]);
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath ingressProxy](self, "ingressProxy"));
        int v54 = 134218498;
        uint64_t v55 = v20;
        __int16 v56 = 2112;
        v57 = v25;
        __int16 v58 = 2048;
        uint64_t v59 = sub_10000F2E8((uint64_t)v26);
        v27 = "proxy path is not ready due to insufficient ingress proxy tokens (cache+agent: %lu) for [%@], (ingress pro"
              "xy low-water mark: %lu)";
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, v27, (uint8_t *)&v54, 0x20u);

        goto LABEL_26;
      }

      goto LABEL_26;
    }
  }

  else
  {
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath egressProxy](self, "egressProxy"));
  if (sub_10000C67C((uint64_t)v28))
  {
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath egressProxy](self, "egressProxy"));
    unint64_t v30 = sub_10000E688((uint64_t)v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath egressProxy](self, "egressProxy"));
    unint64_t v32 = sub_10000F2E8((uint64_t)v31);

    if (v30 <= v32)
    {
      uint64_t v36 = nplog_obj(v33, v34, v35);
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath egressProxy](self, "egressProxy"));
        uint64_t v37 = sub_10000E688((uint64_t)v19);
        uint64_t v38 = objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath egressProxy](self, "egressProxy"));
        v22 = (void *)v38;
        if (v38) {
          v39 = *(void **)(v38 + 24);
        }
        else {
          v39 = 0LL;
        }
        id v24 = v39;
        v25 = (void *)objc_claimAutoreleasedReturnValue([v24 vendor]);
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath egressProxy](self, "egressProxy"));
        int v54 = 134218498;
        uint64_t v55 = v37;
        __int16 v56 = 2112;
        v57 = v25;
        __int16 v58 = 2048;
        uint64_t v59 = sub_10000F2E8((uint64_t)v26);
        v27 = "proxy path is not ready due to insufficient egress proxy tokens (cache+agent: %lu) for [%@], (egress proxy"
              " low-water mark: %lu)";
        goto LABEL_16;
      }

- (BOOL)matchIngress:(id)a3
{
  uint64_t v6 = (id *)a3;
  if (!v6)
  {
    uint64_t v19 = nplog_obj(0LL, v4, v5);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if (!os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_FAULT))
    {
LABEL_10:

      unsigned __int8 v17 = 0;
      goto LABEL_6;
    }

    int v23 = 136315138;
    id v24 = "-[NSPCandidateProxyPath matchIngress:]";
    uint64_t v21 = "%s called with null proxyTokenInfo";
LABEL_12:
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)v20, OS_LOG_TYPE_FAULT, v21, (uint8_t *)&v23, 0xCu);
    goto LABEL_10;
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath ingressProxy](self, "ingressProxy"));

  if (!v7)
  {
    uint64_t v22 = nplog_obj(v8, v9, v10);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    int v23 = 136315138;
    id v24 = "-[NSPCandidateProxyPath matchIngress:]";
    uint64_t v21 = "%s called with null self.ingressProxy";
    goto LABEL_12;
  }

  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath ingressProxy](self, "ingressProxy"));
  id v12 = (void *)v11;
  if (v11) {
    unint64_t v13 = *(void **)(v11 + 24);
  }
  else {
    unint64_t v13 = 0LL;
  }
  id v14 = v13;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 proxyURL]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6[3] proxyURL]);
  unsigned __int8 v17 = [v15 isEqualToString:v16];

LABEL_6:
  return v17;
}

- (BOOL)matchEgress:(id)a3
{
  uint64_t v6 = (id *)a3;
  if (!v6)
  {
    uint64_t v19 = nplog_obj(0LL, v4, v5);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if (!os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_FAULT))
    {
LABEL_10:

      unsigned __int8 v17 = 0;
      goto LABEL_6;
    }

    int v23 = 136315138;
    id v24 = "-[NSPCandidateProxyPath matchEgress:]";
    uint64_t v21 = "%s called with null proxyTokenInfo";
LABEL_12:
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)v20, OS_LOG_TYPE_FAULT, v21, (uint8_t *)&v23, 0xCu);
    goto LABEL_10;
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath egressProxy](self, "egressProxy"));

  if (!v7)
  {
    uint64_t v22 = nplog_obj(v8, v9, v10);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    int v23 = 136315138;
    id v24 = "-[NSPCandidateProxyPath matchEgress:]";
    uint64_t v21 = "%s called with null self.egressProxy";
    goto LABEL_12;
  }

  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath egressProxy](self, "egressProxy"));
  id v12 = (void *)v11;
  if (v11) {
    unint64_t v13 = *(void **)(v11 + 24);
  }
  else {
    unint64_t v13 = 0LL;
  }
  id v14 = v13;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 proxyURL]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6[3] proxyURL]);
  unsigned __int8 v17 = [v15 isEqualToString:v16];

LABEL_6:
  return v17;
}

- (void)fetchDomainFilter:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath preferredPathConfigURI](self, "preferredPathConfigURI"));
  if (v5
    && (uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath domainFilter](self, "domainFilter")),
        v6,
        v5,
        !v6))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath preferredPathConfigURI](self, "preferredPathConfigURI"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v7));

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](&OBJC_CLASS___NSMutableURLRequest, "requestWithURL:", v8));
    if (v11)
    {
      int has_internal_diagnostics = os_variant_has_internal_diagnostics("com.apple.networkserviceproxy");
      uint64_t v13 = copyProductTypeString();
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      uint64_t v15 = copyOSNameString();
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      uint64_t v17 = copyOSVersionString();
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      uint64_t v19 = copyOSBuildString();
      uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
      uint64_t v21 = (void *)v20;
      else {
        uint64_t v22 = @"<%@> <%@;%@;%@>";
      }
      int v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  v22,  v14,  v16,  v18,  v20));

      if (v23) {
        [v11 setValue:v23 forHTTPHeaderField:@"X-Mask-Client-Info"];
      }
      *(void *)&__int128 v49 = 0LL;
      *((void *)&v49 + 1) = &v49;
      uint64_t v50 = 0x3032000000LL;
      v51 = sub_10000CED4;
      uint64_t v52 = sub_10000CEE4;
      id v53 = (id)os_transaction_create("com.apple.networkserviceproxy.fetchDomainFilter");
      id inited = objc_initWeak(&location, self);
      uint64_t v40 = 0LL;
      BOOL v41 = (id *)&v40;
      uint64_t v42 = 0x3032000000LL;
      v43 = sub_10000CED4;
      v44 = sub_10000CEE4;
      id v45 = 0LL;
      uint64_t v27 = nplog_obj(inited, v25, v26);
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v48 = v8;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Sending request for %@", buf, 0xCu);
      }

      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[NPUtilities sharedEmphemeralSession](&OBJC_CLASS___NPUtilities, "sharedEmphemeralSession"));
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      v34[2] = sub_10001ECD0;
      v34[3] = &unk_1000F9A30;
      uint64_t v37 = &v40;
      objc_copyWeak(&v39, &location);
      id v35 = v8;
      id v36 = v4;
      uint64_t v38 = &v49;
      unint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 dataTaskWithRequest:v11 completionHandler:v34]);

      objc_storeStrong(v41 + 5, v30);
      [v41[5] resume];

      objc_destroyWeak(&v39);
      _Block_object_dispose(&v40, 8);

      objc_destroyWeak(&location);
      _Block_object_dispose(&v49, 8);
    }

    else
    {
      uint64_t v31 = nplog_obj(0LL, v9, v10);
      unint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCandidateProxyPath preferredPathConfigURI](self, "preferredPathConfigURI"));
        LODWORD(v49) = 138412290;
        *(void *)((char *)&v49 + 4) = v33;
        _os_log_error_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "Failed to create request for preferred path URL %@",  (uint8_t *)&v49,  0xCu);
      }

      if (v4) {
        (*((void (**)(id, void))v4 + 2))(v4, 0LL);
      }
    }
  }

  else if (v4)
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1LL);
  }
}

- (NSPProxyTokenInfo)ingressProxy
{
  return self->_ingressProxy;
}

- (void)setIngressProxy:(id)a3
{
}

- (NSPProxyTokenInfo)egressProxy
{
  return self->_egressProxy;
}

- (void)setEgressProxy:(id)a3
{
}

- (unint64_t)proxyPathWeight
{
  return self->_proxyPathWeight;
}

- (void)setProxyPathWeight:(unint64_t)a3
{
  self->_proxyPathWeight = a3;
}

- (NSString)preferredPathConfigURI
{
  return self->_preferredPathConfigURI;
}

- (void)setPreferredPathConfigURI:(id)a3
{
}

- (NSArray)preferredPathPatterns
{
  return self->_preferredPathPatterns;
}

- (void)setPreferredPathPatterns:(id)a3
{
}

- (NSData)domainFilter
{
  return self->_domainFilter;
}

- (void)setDomainFilter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
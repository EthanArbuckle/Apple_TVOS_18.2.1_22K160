@interface TCCDAttributionChain
- (BOOL)accessingProcessIsValid;
- (BOOL)accessingProcessSpecified;
- (BOOL)responsibleProcessIsDistinct;
- (BOOL)responsibleProcessIsValid;
- (TCCDAttributionChain)initWithMessage:(id)a3;
- (TCCDAttributionChain)initWithMessage:(id)a3 evaluateResponsibility:(BOOL)a4;
- (TCCDAttributionChain)initWithMessage:(id)a3 evaluateResponsibility:(BOOL)a4 processInfo:(id)a5;
- (TCCDProcess)accessingProcess;
- (TCCDProcess)requestingProcess;
- (TCCDProcess)responsibleProcess;
- (id)attributedBundleUsingOutermostBundle:(BOOL)a3 computedStaticCodeRef:(const void *)a4 computedNonIdentifiableBundleURL:(id *)a5;
- (id)createProcessFromAuditToken:(id *)a3 processInfo:(id)a4;
- (id)description;
- (void)getAuditToken:(id *)a3 fromMessage:(id)a4;
- (void)setAccessingProcessIsValid:(BOOL)a3;
- (void)setAccessingProcessSpecified:(BOOL)a3;
- (void)setRequestingProcess:(id)a3;
- (void)setResponsibleProcessIsDistinct:(BOOL)a3;
@end

@implementation TCCDAttributionChain

- (TCCDAttributionChain)initWithMessage:(id)a3
{
  return -[TCCDAttributionChain initWithMessage:evaluateResponsibility:]( self,  "initWithMessage:evaluateResponsibility:",  a3,  1LL);
}

- (TCCDAttributionChain)initWithMessage:(id)a3 evaluateResponsibility:(BOOL)a4
{
  return -[TCCDAttributionChain initWithMessage:evaluateResponsibility:processInfo:]( self,  "initWithMessage:evaluateResponsibility:processInfo:",  a3,  a4,  0LL);
}

- (void)getAuditToken:(id *)a3 fromMessage:(id)a4
{
}

- (id)createProcessFromAuditToken:(id *)a3 processInfo:(id)a4
{
  v5 = objc_alloc(&OBJC_CLASS___TCCDProcess);
  __int128 v6 = *(_OWORD *)&a3->var0[4];
  v8[0] = *(_OWORD *)a3->var0;
  v8[1] = v6;
  return  -[TCCDProcess initWithAuditToken:responsibleIdentity:]( v5,  "initWithAuditToken:responsibleIdentity:",  v8,  0LL);
}

- (TCCDAttributionChain)initWithMessage:(id)a3 evaluateResponsibility:(BOOL)a4 processInfo:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___TCCDAttributionChain;
  v9 = -[TCCDAttributionChain init](&v39, "init");
  v10 = v9;
  if (!v9) {
    goto LABEL_13;
  }
  -[TCCDAttributionChain getAuditToken:fromMessage:](v9, "getAuditToken:fromMessage:", buf, v7);
  __int128 v37 = *(_OWORD *)buf;
  __int128 v38 = v41;
  v11 = (void *)objc_claimAutoreleasedReturnValue( -[TCCDAttributionChain createProcessFromAuditToken:processInfo:]( v10,  "createProcessFromAuditToken:processInfo:",  &v37,  v8));
  -[TCCDAttributionChain setRequestingProcess:](v10, "setRequestingProcess:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAttributionChain requestingProcess](v10, "requestingProcess"));
  if (!v12) {
    goto LABEL_19;
  }
  -[TCCDAttributionChain setAccessingProcessSpecified:](v10, "setAccessingProcessSpecified:", 0LL);
  size_t length = 0LL;
  v13 = "target_token";
  data = (__int128 *)xpc_dictionary_get_data(v7, "target_token", &length);
  if (data
    || (v13 = "indirect_object_token",
        (data = (__int128 *)xpc_dictionary_get_data(v7, "indirect_object_token", &length)) != 0LL))
  {
    v15 = data;
LABEL_6:
    -[TCCDAttributionChain setAccessingProcessSpecified:](v10, "setAccessingProcessSpecified:", 1LL);
    -[TCCDAttributionChain setAccessingProcessIsValid:](v10, "setAccessingProcessIsValid:", 0LL);
    if (length != 32)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 server]);
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 logHandle]);

      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_10003B9A0((uint64_t)v13, v10);
      }

      goto LABEL_12;
    }

    __int128 v16 = v15[1];
    __int128 v37 = *v15;
    __int128 v38 = v16;
    uint64_t v17 = objc_claimAutoreleasedReturnValue( -[TCCDAttributionChain createProcessFromAuditToken:processInfo:]( v10,  "createProcessFromAuditToken:processInfo:",  &v37,  v8));
    accessingProcess = v10->_accessingProcess;
    v10->_accessingProcess = (TCCDProcess *)v17;

    if (v10->_accessingProcess)
    {
      -[TCCDAttributionChain setAccessingProcessIsValid:](v10, "setAccessingProcessIsValid:", 1LL);
      goto LABEL_12;
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 server]);
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v28 logHandle]);

    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_10003B90C((uint64_t)v13, v10);
    }

LABEL_19:
    v10 = 0LL;
    goto LABEL_20;
  }

  xpc_object_t value = xpc_dictionary_get_value(v7, "TCC_MSG_REQUEST_AUTHORIZATION_SUBJECT_CREDENTIAL_DICTIONARY_KEY");
  v32 = (void *)objc_claimAutoreleasedReturnValue(value);

  if (v32)
  {
    xpc_object_t v33 = xpc_dictionary_get_value(v7, "TCC_MSG_REQUEST_AUTHORIZATION_SUBJECT_CREDENTIAL_DICTIONARY_KEY");
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v35 = v34;
    if (!v34 || xpc_dictionary_get_uint64(v34, "TCCD_MSG_CREDENTIAL_AUTHENTICATOR_TYPE_KEY") != 1)
    {

      goto LABEL_12;
    }

    v15 = (__int128 *)xpc_dictionary_get_data(v35, "TCCD_MSG_CREDENTIAL_AUTHENTICATOR_AUDIT_TOKEN_KEY", &length);

    if (v15)
    {
      v13 = "indirect_object_token";
      goto LABEL_6;
    }
  }

- (id)description
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableString);
  v4 = v3;
  if (self->_responsibleProcessIsValid)
  {
    responsibleProcess = self->_responsibleProcess;
    if (responsibleProcess)
    {
      __int128 v6 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDProcess description](responsibleProcess, "description"));
      -[NSMutableString appendFormat:](v4, "appendFormat:", @"responsible={%@}, ", v6);
    }
  }

  else
  {
    -[NSMutableString appendString:](v3, "appendString:", @"Invalid Responsible Process, ");
  }

  if (self->_accessingProcessSpecified)
  {
    if (self->_accessingProcessIsValid)
    {
      accessingProcess = self->_accessingProcess;
      if (accessingProcess)
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDProcess description](accessingProcess, "description"));
        -[NSMutableString appendFormat:](v4, "appendFormat:", @"accessing={%@}, ", v8);
      }
    }

    else
    {
      -[NSMutableString appendString:](v4, "appendString:", @"Invalid Accessing Process, ");
    }
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAttributionChain requestingProcess](self, "requestingProcess"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAttributionChain requestingProcess](self, "requestingProcess"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 description]);
    -[NSMutableString appendFormat:](v4, "appendFormat:", @"requesting={%@}, ", v11);
  }

  return v4;
}

- (TCCDProcess)accessingProcess
{
  accessingProcess = self->_accessingProcess;
  if (accessingProcess) {
    return accessingProcess;
  }
  else {
    return (TCCDProcess *)(id)objc_claimAutoreleasedReturnValue( -[TCCDAttributionChain requestingProcess]( self,  "requestingProcess"));
  }
}

- (TCCDProcess)responsibleProcess
{
  responsibleProcess = self->_responsibleProcess;
  if (responsibleProcess) {
    return responsibleProcess;
  }
  else {
    return (TCCDProcess *)(id)objc_claimAutoreleasedReturnValue( -[TCCDAttributionChain accessingProcess]( self,  "accessingProcess"));
  }
}

- (id)attributedBundleUsingOutermostBundle:(BOOL)a3 computedStaticCodeRef:(const void *)a4 computedNonIdentifiableBundleURL:(id *)a5
{
  BOOL v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAttributionChain responsibleProcess](self, "responsibleProcess", a3, a4));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 responsiblePath]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v8));

  if (a5) {
    *a5 = 0LL;
  }
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
    v11 = v10;
    if (v6) {
      uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 appBundleURLContainingExecutableURL:v9]);
    }
    else {
      uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 bundleURLContainingExecutableURL:v9]);
    }
    v14 = (void *)v12;

    if (v14)
    {
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TCCDBundle bundleWithURL:](&OBJC_CLASS___TCCDBundle, "bundleWithURL:", v14));
      if (v15)
      {
        v13 = v15;
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s bundleIdentifier](v15, "bundleIdentifier"));

        if (v16)
        {
LABEL_19:

          goto LABEL_20;
        }

        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
        v18 = (void *)objc_claimAutoreleasedReturnValue([v17 server]);
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 logHandle]);

        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v23 = 138543362;
          v24 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "BUNDLE_ATTRIBUTION: attributed bundle %{public}@ has no identifier and is not valid.",  (uint8_t *)&v23,  0xCu);
        }

        if (a5) {
          *a5 = v14;
        }
      }

      else
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
        v21 = (void *)objc_claimAutoreleasedReturnValue([v20 server]);
        v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 logHandle]);

        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_10003BA34((uint64_t)v14, v13);
        }
      }
    }

    v13 = 0LL;
    goto LABEL_19;
  }

  v13 = 0LL;
LABEL_20:

  return v13;
}

- (TCCDProcess)requestingProcess
{
  return (TCCDProcess *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setRequestingProcess:(id)a3
{
}

- (BOOL)accessingProcessSpecified
{
  return self->_accessingProcessSpecified;
}

- (void)setAccessingProcessSpecified:(BOOL)a3
{
  self->_accessingProcessSpecified = a3;
}

- (BOOL)accessingProcessIsValid
{
  return self->_accessingProcessIsValid;
}

- (void)setAccessingProcessIsValid:(BOOL)a3
{
  self->_accessingProcessIsValid = a3;
}

- (BOOL)responsibleProcessIsValid
{
  return self->_responsibleProcessIsValid;
}

- (BOOL)responsibleProcessIsDistinct
{
  return self->_responsibleProcessIsDistinct;
}

- (void)setResponsibleProcessIsDistinct:(BOOL)a3
{
  self->_responsibleProcessIsDistinct = a3;
}

- (void).cxx_destruct
{
}

  ;
}

@end
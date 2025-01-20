@interface MCLoggingPayloadHandler
- (BOOL)_installAndReturnError:(id *)a3;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (void)_remove;
- (void)remove;
- (void)unsetAside;
@end

@implementation MCLoggingPayloadHandler

- (BOOL)_installAndReturnError:(id *)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 loggingPayload]);
  LOBYTE(a3) = MCOSLogInstallProfilePayload(v5, a3);

  return (char)a3;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v17 = 0LL;
  BOOL v8 = -[MCLoggingPayloadHandler _installAndReturnError:](self, "_installAndReturnError:", &v17, a4, a5);
  id v9 = v17;
  if (!v8)
  {
    uint64_t v10 = MCInstallationErrorDomain;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 friendlyName]);
    uint64_t v13 = MCErrorArray(@"ERROR_PAYLOAD_FAILED_P_ID");
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  v10,  4001LL,  v14,  v9,  MCErrorTypeFatal,  v12,  0LL));

    if (a6) {
      *a6 = v15;
    }
  }

  return v8;
}

- (void)_remove
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v2 = (void *)objc_claimAutoreleasedReturnValue([v3 loggingPayload]);
  MCOSLogRemoveProfilePayload(v2, 0LL);
}

- (void)remove
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  unsigned __int8 v4 = [v3 isSetAside];

  if ((v4 & 1) == 0) {
    -[MCLoggingPayloadHandler _remove](self, "_remove");
  }
}

- (void)unsetAside
{
}

@end
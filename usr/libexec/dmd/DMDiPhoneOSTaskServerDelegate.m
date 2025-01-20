@interface DMDiPhoneOSTaskServerDelegate
- (id)operationForRequest:(id)a3 targetUID:(unsigned int)a4 appleID:(id)a5 transport:(id)a6 error:(id *)a7;
@end

@implementation DMDiPhoneOSTaskServerDelegate

- (id)operationForRequest:(id)a3 targetUID:(unsigned int)a4 appleID:(id)a5 transport:(id)a6 error:(id *)a7
{
  uint64_t v9 = *(void *)&a4;
  id v12 = a5;
  id v13 = a6;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___DMDiPhoneOSTaskServerDelegate;
  id v33 = 0LL;
  id v14 = -[DMDTaskServerDelegate operationForRequest:targetUID:appleID:transport:error:]( &v32,  "operationForRequest:targetUID:appleID:transport:error:",  a3,  v9,  v12,  v13,  &v33);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = v33;
  uint64_t v17 = objc_opt_class(&OBJC_CLASS___CATXPCTransport);
  if ((objc_opt_isKindOfClass(v13, v17) & 1) == 0) {
    goto LABEL_28;
  }
  unsigned int v18 = [v13 effectiveUserIdentifier];
  uid_t v19 = getuid();
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAccountUtilities primaryAppleID](&OBJC_CLASS___DMDAccountUtilities, "primaryAppleID"));
  unsigned __int8 v21 = [v12 isEqualToString:v20];

  if (v18 && v18 != (_DWORD)v9)
  {
    if (!(_DWORD)v9 && !v12)
    {
      BOOL v22 = 0;
      goto LABEL_24;
    }

    if (!v12) {
      goto LABEL_20;
    }
    if ((v21 & 1) != 0)
    {
      if (v18 == v19)
      {
        BOOL v22 = 1;
        if (!(_DWORD)v9) {
          goto LABEL_24;
        }
        goto LABEL_12;
      }

@end
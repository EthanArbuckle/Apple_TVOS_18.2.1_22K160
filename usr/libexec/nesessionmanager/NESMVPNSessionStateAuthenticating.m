@interface NESMVPNSessionStateAuthenticating
- (NESMVPNSessionStateAuthenticating)init;
- (void)enterWithSession:(id)a3;
- (void)handlePlugin:(id)a3 authenticationCompleteWithResults:(id)a4 status:(int)a5 andError:(id)a6;
- (void)handlePlugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5;
- (void)handleTimeout;
@end

@implementation NESMVPNSessionStateAuthenticating

- (NESMVPNSessionStateAuthenticating)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateAuthenticating;
  return -[NESMVPNSessionState initWithType:andTimeout:](&v3, "initWithType:andTimeout:", 7LL, 120LL);
}

- (void)enterWithSession:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateAuthenticating;
  -[NESMVPNSessionState enterWithSession:](&v15, "enterWithSession:", a3);
  if (self)
  {
    if (!objc_msgSend(objc_getProperty(self, v4, 16, 1), "prepareConfigurationForStart"))
    {
LABEL_8:
      objc_msgSend(objc_getProperty(self, v5, 16, 1), "setLastStopReason:", 7);
      id Property = objc_getProperty(self, v12, 16LL, 1);
LABEL_9:
      [Property setState:5];
      return;
    }

    id v6 = objc_getProperty(self, v5, 16LL, 1);
  }

  else
  {
    unsigned __int8 v14 = [0 prepareConfigurationForStart];
    id v6 = 0LL;
    if ((v14 & 1) == 0) {
      goto LABEL_12;
    }
  }

  v8 = (_BYTE *)objc_claimAutoreleasedReturnValue([v6 authenticationPlugin]);
  if (self) {
    id v9 = objc_getProperty(self, v7, 16LL, 1);
  }
  else {
    id v9 = 0LL;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 configuration]);
  BOOL v11 = sub_100014E78(v8, v10);

  if (!v11)
  {
    if (self) {
      goto LABEL_8;
    }
LABEL_12:
    [0 setLastStopReason:7];
    id Property = 0LL;
    goto LABEL_9;
  }

- (void)handlePlugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateAuthenticating;
  id v9 = a3;
  -[NESMVPNSessionState handlePlugin:didStartWithPID:error:](&v28, "handlePlugin:didStartWithPID:error:", v9, v5, v8);
  if (self) {
    id Property = objc_getProperty(self, v10, 16LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "authenticationPlugin", v28.receiver, v28.super_class));

  if (v12 != v9) {
    goto LABEL_25;
  }
  if ((int)v5 <= 0)
  {
    if (v8)
    {
      unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
      if ([v14 isEqualToString:@"NEAgentErrorDomain"])
      {
        id v15 = [v8 code];

        if (v15 == (id)2)
        {
          if (self) {
            id v16 = objc_getProperty(self, v13, 16LL, 1);
          }
          else {
            id v16 = 0LL;
          }
          uint64_t v17 = 6LL;
LABEL_15:
          [v16 setLastStopReason:v17];
          if (self) {
            id v19 = objc_getProperty(self, v18, 16LL, 1);
          }
          else {
            id v19 = 0LL;
          }
          [v19 setState:5];
          goto LABEL_18;
        }
      }

      else
      {
      }
    }

    if (self) {
      id v16 = objc_getProperty(self, v13, 16LL, 1);
    }
    else {
      id v16 = 0LL;
    }
    uint64_t v17 = 7LL;
    goto LABEL_15;
  }

- (void)handlePlugin:(id)a3 authenticationCompleteWithResults:(id)a4 status:(int)a5 andError:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a4;
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateAuthenticating;
  BOOL v11 = a3;
  -[NESMVPNSessionState handlePlugin:authenticationCompleteWithResults:status:andError:]( &v40,  "handlePlugin:authenticationCompleteWithResults:status:andError:",  v11,  v10,  v7,  a6);
  sub_100015E44(v11, v12);

  if ((_DWORD)v7 && !a6)
  {
    if (!v10)
    {
      if ((_DWORD)v7 == 2)
      {
        if (self)
        {
          id Property = objc_getProperty(self, v13, 16LL, 1);
          objc_msgSend(Property, "setLastStopReason:", 8, v40.receiver, v40.super_class);
          objc_msgSend(objc_getProperty(self, v27, 16, 1), "setState:", 5);
          id v29 = objc_getProperty(self, v28, 16LL, 1);
        }

        else
        {
          objc_msgSend(0, "setLastStopReason:", 8, v40.receiver, v40.super_class);
          [0 setState:5];
          id v29 = 0LL;
        }

        sub_10007C56C(v29, (id)2);
      }

      goto LABEL_27;
    }

    if (self) {
      id v14 = objc_getProperty(self, v13, 16LL, 1);
    }
    else {
      id v14 = 0LL;
    }
    id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "extensibleSSOProvider", v40.receiver, v40.super_class));

    if (v15)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"extensible-sso-credential-certificate"]);
      int v17 = isa_nsdata();

      if (!v17)
      {
LABEL_27:
        if (self) {
          id v24 = objc_getProperty(self, v13, 16LL, 1);
        }
        else {
          id v24 = 0LL;
        }
        uint64_t v25 = 3LL;
        goto LABEL_30;
      }

      id v19 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"extensible-sso-credential-certificate"]);
      if (self) {
        id v20 = objc_getProperty(self, v18, 16LL, 1);
      }
      else {
        id v20 = 0LL;
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue([v20 protocol]);
      [v21 setIdentityReferenceInternal:v19];
    }

    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"AuthName"]);
      int v31 = isa_nsstring(v30);

      if (v31)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"AuthName"]);
        if (self) {
          id v34 = objc_getProperty(self, v32, 16LL, 1);
        }
        else {
          id v34 = 0LL;
        }
        v35 = (void *)objc_claimAutoreleasedReturnValue([v34 connectParameters]);
        [v35 setObject:v33 forKeyedSubscript:@"AccountName"];
      }

      v36 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"AuthCredentialPassword"]);
      int v37 = isa_nsstring(v36);

      if (!v37) {
        goto LABEL_27;
      }
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"AuthCredentialPassword"]);
      if (self) {
        id v39 = objc_getProperty(self, v38, 16LL, 1);
      }
      else {
        id v39 = 0LL;
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue([v39 connectParameters]);
      [v21 setObject:v19 forKeyedSubscript:@"Password"];
    }

    goto LABEL_27;
  }

  if (self)
  {
    id v22 = objc_getProperty(self, v13, 16LL, 1);
    objc_msgSend(v22, "setLastStopReason:", 7, v40.receiver, v40.super_class);
    id v24 = objc_getProperty(self, v23, 16LL, 1);
  }

  else
  {
    objc_msgSend(0, "setLastStopReason:", 7, v40.receiver, v40.super_class);
    id v24 = 0LL;
  }

  uint64_t v25 = 5LL;
LABEL_30:
  objc_msgSend(v24, "setState:", v25, v40.receiver, v40.super_class);
}

- (void)handleTimeout
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateAuthenticating;
  -[NESMVPNSessionState handleTimeout](&v12, "handleTimeout");
  if (self)
  {
    id v4 = objc_msgSend(objc_getProperty(self, v3, 16, 1), "authenticationPlugin");
    uint64_t v5 = (_BYTE *)objc_claimAutoreleasedReturnValue(v4);
    sub_100015E44(v5, v6);

    objc_msgSend(objc_getProperty(self, v7, 16, 1), "setLastStopReason:", 11);
    id Property = objc_getProperty(self, v8, 16LL, 1);
  }

  else
  {
    id v10 = (_BYTE *)objc_claimAutoreleasedReturnValue([0 authenticationPlugin]);
    sub_100015E44(v10, v11);

    [0 setLastStopReason:11];
    id Property = 0LL;
  }

  [Property setState:5];
}

@end
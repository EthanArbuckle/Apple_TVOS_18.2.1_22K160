@interface CEMManagementTestDeclaration
- (id)dmf_installRequestWithContext:(id)a3 error:(id *)a4;
- (id)dmf_removeRequestWithContext:(id)a3 error:(id *)a4;
- (id)dmf_statusForResult:(id)a3 context:(id)a4;
@end

@implementation CEMManagementTestDeclaration

- (id)dmf_installRequestWithContext:(id)a3 error:(id *)a4
{
  v5 = (void *)objc_opt_new(&OBJC_CLASS___DMFEchoRequest);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CEMManagementTestDeclaration payloadEcho](self, "payloadEcho"));
  [v5 setEcho:v6];

  v13[0] = @"Installed";
  v13[1] = @"Failed";
  v14[0] = DMFRMEchoStatusOK;
  v14[1] = DMFRMEchoStatusFail;
  v13[2] = @"Pending";
  v14[2] = DMFRMEchoStatusPending;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  3LL));
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[CEMManagementTestDeclaration payloadReturnStatus](self, "payloadReturnStatus"));
  v9 = (void *)v8;
  if (v8) {
    v10 = (const __CFString *)v8;
  }
  else {
    v10 = @"Installed";
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v10]);
  [v5 setResultStatus:v11];

  return v5;
}

- (id)dmf_removeRequestWithContext:(id)a3 error:(id *)a4
{
  v5 = (void *)objc_opt_new(&OBJC_CLASS___DMFEchoRequest);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CEMManagementTestDeclaration payloadEcho](self, "payloadEcho"));
  [v5 setEcho:v6];

  v13[0] = @"Installed";
  v13[1] = @"Failed";
  v14[0] = DMFRMEchoStatusOK;
  v14[1] = DMFRMEchoStatusFail;
  v13[2] = @"Pending";
  v14[2] = DMFRMEchoStatusPending;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  3LL));
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[CEMManagementTestDeclaration payloadReturnStatus](self, "payloadReturnStatus"));
  v9 = (void *)v8;
  if (v8) {
    v10 = (const __CFString *)v8;
  }
  else {
    v10 = @"Installed";
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v10]);
  [v5 setResultStatus:v11];

  return v5;
}

- (id)dmf_statusForResult:(id)a3 context:(id)a4
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___DMFEchoResultObject);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v9 = @"Echo";
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 echo]);
    v10 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

@end
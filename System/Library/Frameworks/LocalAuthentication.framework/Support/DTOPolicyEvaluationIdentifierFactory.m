@interface DTOPolicyEvaluationIdentifierFactory
- (id)_callerIDForClient:(id)a3;
- (id)evaluationIdentifierForClient:(id)a3 ratchetIdentifier:(id)a4;
@end

@implementation DTOPolicyEvaluationIdentifierFactory

- (id)evaluationIdentifierForClient:(id)a3 ratchetIdentifier:(id)a4
{
  id v6 = a4;
  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[DTOPolicyEvaluationIdentifierFactory _callerIDForClient:](self, "_callerIDForClient:", a3));
  v8 = (void *)v7;
  v9 = @"<UNKNOWN>";
  if (v7) {
    v9 = (__CFString *)v7;
  }
  v10 = v9;

  if (v6)
  {
    id v11 = v6;
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v11 = (id)objc_claimAutoreleasedReturnValue([v12 UUIDString]);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@:%@", v10, v11));

  return v13;
}

- (id)_callerIDForClient:(id)a3
{
  id v3 = a3;
  id v4 = [v3 processId];
  if (v3) {
    [v3 auditToken];
  }
  else {
    memset(v7, 0, sizeof(v7));
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[DaemonUtils callerIdWithPid:auditToken:]( &OBJC_CLASS___DaemonUtils,  "callerIdWithPid:auditToken:",  v4,  v7));

  return v5;
}

@end
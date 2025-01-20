@interface DMDiagnostics
+ (id)sharedInstance;
- (void)captureDiagnosticsForIncident:(id)a3 async:(BOOL)a4;
@end

@implementation DMDiagnostics

+ (id)sharedInstance
{
  if (qword_10002CBD8 != -1) {
    dispatch_once(&qword_10002CBD8, &stru_1000209F0);
  }
  return (id)qword_10002CBD0;
}

- (void)captureDiagnosticsForIncident:(id)a3 async:(BOOL)a4
{
  BOOL v5 = a4;
  id v6 = a3;
  id v15 = v6;
  if (qword_10002CBF0 != -1)
  {
    dispatch_once(&qword_10002CBF0, &stru_100020A10);
    id v6 = v15;
    if (v5) {
      goto LABEL_3;
    }
LABEL_8:
    v11 = (uint64_t (*)(void *, uint64_t, uint64_t))off_10002CBE8;
    if (!off_10002CBE8) {
      goto LABEL_10;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue([v6 diagnosticMessage]);
    uint64_t v13 = getpid();
    char v14 = v11(v12, 3135167405LL, v13);

    if ((v14 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_11;
  }

  if (!v5) {
    goto LABEL_8;
  }
LABEL_3:
  v7 = (uint64_t (*)(void *, uint64_t, uint64_t))off_10002CBE0;
  if (!off_10002CBE0
    || (v8 = (void *)objc_claimAutoreleasedReturnValue([v6 diagnosticMessage]),
        uint64_t v9 = getpid(),
        char v10 = v7(v8, 3135167405LL, v9),
        v8,
        (v10 & 1) == 0))
  {
LABEL_10:
    _DMLogFunc(v4, 3LL);
  }

@end
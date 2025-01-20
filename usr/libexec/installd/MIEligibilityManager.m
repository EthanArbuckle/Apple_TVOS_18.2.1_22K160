@interface MIEligibilityManager
+ (MIEligibilityManager)sharedInstance;
- (BOOL)getEligibilityForDomain:(unint64_t)a3 answer:(unint64_t *)a4 source:(unint64_t *)a5 status:(id *)a6 context:(id *)a7 error:(id *)a8;
- (BOOL)testOverridesEnabled;
- (NSDictionary)testOverrides;
- (void)setTestOverrides:(id)a3;
@end

@implementation MIEligibilityManager

+ (MIEligibilityManager)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004C1E8;
  block[3] = &unk_100080BC0;
  block[4] = a1;
  if (qword_100095BE0 != -1) {
    dispatch_once(&qword_100095BE0, block);
  }
  return (MIEligibilityManager *)(id)qword_100095BD8;
}

- (BOOL)testOverridesEnabled
{
  char v7 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  BOOL v3 = 0;
  if ([v2 allowsInternalSecurityPolicy])
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MITestManager sharedInstance](&OBJC_CLASS___MITestManager, "sharedInstance"));
    unsigned __int8 v5 = [v4 isRunningInTestMode:&v7 outError:0];
    if (v7) {
      BOOL v3 = v5;
    }
    else {
      BOOL v3 = 0;
    }
  }

  return v3;
}

- (void)setTestOverrides:(id)a3
{
  id v7 = a3;
  if (-[MIEligibilityManager testOverridesEnabled](self, "testOverridesEnabled"))
  {
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
    {
      id v6 = v7;
      MOLogWrite(qword_100095BF8);
    }

    v4 = (NSDictionary *)objc_msgSend(v7, "copy", v6);
    testOverrides = self->_testOverrides;
    self->_testOverrides = v4;
  }
}

- (BOOL)getEligibilityForDomain:(unint64_t)a3 answer:(unint64_t *)a4 source:(unint64_t *)a5 status:(id *)a6 context:(id *)a7 error:(id *)a8
{
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MIEligibilityManager testOverrides](self, "testOverrides"));
  if (v15 && -[MIEligibilityManager testOverridesEnabled](self, "testOverridesEnabled"))
  {
    id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v16]);
    BOOL v19 = v18 != 0LL;
    if (v18)
    {
      if (a4) {
        *a4 = (unint64_t)[v18 unsignedLongLongValue];
      }
      if (a5) {
        *a5 = 2LL;
      }
      if (a6)
      {
        id v20 = *a6;
        *a6 = 0LL;
      }

      if (!a7) {
        goto LABEL_23;
      }
      id v21 = *a7;
      *a7 = 0LL;
    }

    else
    {
      id v29 = sub_1000130F4( (uint64_t)"-[MIEligibilityManager getEligibilityForDomain:answer:source:status:context:error:]",  81LL,  MIInstallerErrorDomain,  219LL,  0LL,  0LL,  @"Test mode: no override set for domain %llu; failing",
              v17,
              a3);
      id v21 = (id)objc_claimAutoreleasedReturnValue(v29);
      if (a8)
      {
        id v21 = v21;
        *a8 = v21;
      }
    }

LABEL_23:
LABEL_24:

    goto LABEL_25;
  }

  int domain_answer = os_eligibility_get_domain_answer(a3, a4, a5, a6, a7);
  if (domain_answer)
  {
    v24 = (void *)MIInstallerErrorDomain;
    id v25 = sub_1000130C8( (uint64_t)"-[MIEligibilityManager getEligibilityForDomain:answer:source:status:context:error:]",  91LL,  NSPOSIXErrorDomain,  domain_answer,  0LL,  0LL,  @"os_eligibility_get_domain_answer failed",  v23,  v31);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    id v28 = sub_1000130C8( (uint64_t)"-[MIEligibilityManager getEligibilityForDomain:answer:source:status:context:error:]",  91LL,  v24,  4LL,  v26,  0LL,  @"Failed to check eligibility for domain %llu",  v27,  a3);
    id v16 = (id)objc_claimAutoreleasedReturnValue(v28);

    if (a8)
    {
      id v16 = v16;
      BOOL v19 = 0;
      *a8 = v16;
    }

    else
    {
      BOOL v19 = 0;
    }

    goto LABEL_24;
  }

  BOOL v19 = 1;
LABEL_25:

  return v19;
}

- (NSDictionary)testOverrides
{
  return self->_testOverrides;
}

- (void).cxx_destruct
{
}

@end
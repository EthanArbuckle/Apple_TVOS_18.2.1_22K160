@interface GKClientAppSigningStatus
+ (BOOL)appIsDevSigned:(int)a3 auditToken:(id *)a4;
+ (BOOL)appIsDevSigned:(int)a3 auditToken:(id *)a4 csopsFnValidCat:(void *)a5 csopsFnStatus:(void *)a6;
+ (id)hashForAuditToken:(id *)a3;
+ (id)headerValueForSignatureType:(int64_t)a3;
+ (id)opsValidationCategoryAndStatus:(int)a3 auditToken:(id *)a4 csopsFnValidCat:(void *)a5 csopsFnStatus:(void *)a6;
+ (int64_t)appSignatureType:(int)a3 auditToken:(id *)a4;
+ (int64_t)appSignatureType:(int)a3 auditToken:(id *)a4 csopsFnValidCat:(void *)a5 csopsFnStatus:(void *)a6;
@end

@implementation GKClientAppSigningStatus

+ (id)hashForAuditToken:(id *)a3
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d%d%d%d%d%d%d%d",  a3->var0[0],  a3->var0[1],  a3->var0[2],  a3->var0[3],  a3->var0[4],  a3->var0[5],  a3->var0[6],  a3->var0[7]);
}

+ (BOOL)appIsDevSigned:(int)a3 auditToken:(id *)a4
{
  __int128 v4 = *(_OWORD *)&a4->var0[4];
  v6[0] = *(_OWORD *)a4->var0;
  v6[1] = v4;
  return +[GKClientAppSigningStatus appIsDevSigned:auditToken:csopsFnValidCat:csopsFnStatus:]( &OBJC_CLASS___GKClientAppSigningStatus,  "appIsDevSigned:auditToken:csopsFnValidCat:csopsFnStatus:",  *(void *)&a3,  v6,  &csops_audittoken,  &csops_audittoken);
}

+ (int64_t)appSignatureType:(int)a3 auditToken:(id *)a4
{
  __int128 v4 = *(_OWORD *)&a4->var0[4];
  v6[0] = *(_OWORD *)a4->var0;
  v6[1] = v4;
  return +[GKClientAppSigningStatus appSignatureType:auditToken:csopsFnValidCat:csopsFnStatus:]( &OBJC_CLASS___GKClientAppSigningStatus,  "appSignatureType:auditToken:csopsFnValidCat:csopsFnStatus:",  *(void *)&a3,  v6,  &csops_audittoken,  &csops_audittoken);
}

+ (BOOL)appIsDevSigned:(int)a3 auditToken:(id *)a4 csopsFnValidCat:(void *)a5 csopsFnStatus:(void *)a6
{
  __int128 v6 = *(_OWORD *)&a4->var0[4];
  v12[0] = *(_OWORD *)a4->var0;
  v12[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[GKClientAppSigningStatus opsValidationCategoryAndStatus:auditToken:csopsFnValidCat:csopsFnStatus:]( &OBJC_CLASS___GKClientAppSigningStatus,  "opsValidationCategoryAndStatus:auditToken:csopsFnValidCat:csopsFnStatus:",  *(void *)&a3,  v12,  a5,  a6));
  if ([v7 category] && objc_msgSend(v7, "status"))
  {
    if ([v7 category] == 3)
    {
      LOBYTE(v8) = 1;
    }

    else
    {
      BOOL v9 = [v7 category] == 10 || objc_msgSend(v7, "category") == 1;
      unint64_t v10 = (unint64_t)[v7 status] & 4;
      [v7 setStatus:v10];
      unsigned int v8 = v9 & (v10 >> 2);
    }
  }

  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

+ (int64_t)appSignatureType:(int)a3 auditToken:(id *)a4 csopsFnValidCat:(void *)a5 csopsFnStatus:(void *)a6
{
  __int128 v6 = *(_OWORD *)&a4->var0[4];
  v11[0] = *(_OWORD *)a4->var0;
  v11[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[GKClientAppSigningStatus opsValidationCategoryAndStatus:auditToken:csopsFnValidCat:csopsFnStatus:]( &OBJC_CLASS___GKClientAppSigningStatus,  "opsValidationCategoryAndStatus:auditToken:csopsFnValidCat:csopsFnStatus:",  *(void *)&a3,  v11,  a5,  a6));
  unsigned int v8 = [v7 category] - 2;
  if (v8 > 8) {
    int64_t v9 = 0LL;
  }
  else {
    int64_t v9 = qword_1001F2FD0[v8];
  }

  return v9;
}

+ (id)opsValidationCategoryAndStatus:(int)a3 auditToken:(id *)a4 csopsFnValidCat:(void *)a5 csopsFnStatus:(void *)a6
{
  uint64_t v9 = *(void *)&a3;
  __int128 v10 = *(_OWORD *)&a4->var0[4];
  v27[0] = *(_OWORD *)a4->var0;
  v27[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[GKClientAppSigningStatus hashForAuditToken:]( &OBJC_CLASS___GKClientAppSigningStatus,  "hashForAuditToken:",  v27));
  uint64_t v12 = objc_claimAutoreleasedReturnValue(+[SigningStatusCache getValue:](&OBJC_CLASS___SigningStatusCache, "getValue:", v11));
  if (v12)
  {
    v13 = (void *)v12;
    if (!os_log_GKGeneral) {
      id v14 = (id)GKOSLoggers(v12);
    }
    if (os_log_type_enabled(os_log_GKLRUCache, OS_LOG_TYPE_DEBUG)) {
      sub_1001036E8();
    }
    v15 = v13;
  }

  else
  {
    if (!os_log_GKGeneral) {
      id v16 = (id)GKOSLoggers(0LL);
    }
    if (os_log_type_enabled(os_log_GKLRUCache, OS_LOG_TYPE_DEBUG)) {
      sub_100103688();
    }
    LODWORD(v27[0]) = 0;
    uint64_t v17 = ((uint64_t (*)(uint64_t, uint64_t, _OWORD *, uint64_t, $115C4C562B26FF47E01F9F4EA65B5887 *))a5)( v9,  17LL,  v27,  4LL,  a4);
    if ((_DWORD)v17)
    {
      if (!os_log_GKGeneral) {
        id v18 = (id)GKOSLoggers(v17);
      }
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
        sub_100103628();
      }
      LODWORD(v27[0]) = 0;
    }

    unsigned int v26 = 0;
    uint64_t v19 = ((uint64_t (*)(uint64_t, void, unsigned int *, uint64_t, $115C4C562B26FF47E01F9F4EA65B5887 *))a6)( v9,  0LL,  &v26,  4LL,  a4);
    if ((_DWORD)v19)
    {
      if (!os_log_GKGeneral) {
        id v20 = (id)GKOSLoggers(v19);
      }
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
        sub_1001035C8();
      }
      unsigned int v26 = 0;
    }

    v21 = objc_alloc(&OBJC_CLASS___OpsValidationCategoryAndStatus);
    v22 = -[OpsValidationCategoryAndStatus initWithOpsValidationCategory:status:]( v21,  "initWithOpsValidationCategory:status:",  LODWORD(v27[0]),  v26);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[SigningStatusCache sharedInstance](&OBJC_CLASS___SigningStatusCache, "sharedInstance"));
    [v23 insertValue:v22 forKey:v11];

    v15 = v22;
  }

  v24 = v15;

  return v24;
}

+ (id)headerValueForSignatureType:(int64_t)a3
{
  else {
    return *(&off_100272F40 + a3 - 1);
  }
}

@end
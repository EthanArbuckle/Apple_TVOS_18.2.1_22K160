@interface TransparencyECVRFVerifier
+ (BOOL)verifyMessage:(id)a3 output:(id)a4 proof:(id)a5 key:(id)a6 error:(id *)a7;
+ (BOOL)verifyMessage:(id)a3 salt:(id)a4 output:(id)a5 proof:(id)a6 key:(id)a7 error:(id *)a8;
- (BOOL)verifyMessage:(id)a3 output:(id)a4 proof:(id)a5 error:(id *)a6;
- (BOOL)verifyMessage:(id)a3 salt:(id)a4 output:(id)a5 proof:(id)a6 error:(id *)a7;
- (TransparencyECVRFVerifier)initWithKey:(id)a3;
- (int)vrfType;
@end

@implementation TransparencyECVRFVerifier

- (TransparencyECVRFVerifier)initWithKey:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TransparencyECVRFVerifier;
  v5 = -[TransparencyVRFVerifier initWithKey:](&v12, "initWithKey:", v4);
  v6 = v5;
  if (v5
    && (ccvrf_factory_irtfdraft03_default(&v5->vrf),
        uint64_t v7 = ccvrf_sizeof_public_key(&v6->vrf),
        v8 = (void *)objc_claimAutoreleasedReturnValue([v4 vrfKey]),
        id v9 = [v8 length],
        v8,
        (id)v7 != v9))
  {
    v10 = 0LL;
  }

  else
  {
    v10 = v6;
  }

  return v10;
}

- (int)vrfType
{
  return 3;
}

- (BOOL)verifyMessage:(id)a3 output:(id)a4 proof:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyVRFVerifier key](self, "key"));
  LOBYTE(a6) = +[TransparencyECVRFVerifier verifyMessage:salt:output:proof:key:error:]( &OBJC_CLASS___TransparencyECVRFVerifier,  "verifyMessage:salt:output:proof:key:error:",  v12,  0LL,  v11,  v10,  v13,  a6);

  return (char)a6;
}

+ (BOOL)verifyMessage:(id)a3 output:(id)a4 proof:(id)a5 key:(id)a6 error:(id *)a7
{
  return +[TransparencyECVRFVerifier verifyMessage:salt:output:proof:key:error:]( &OBJC_CLASS___TransparencyECVRFVerifier,  "verifyMessage:salt:output:proof:key:error:",  a3,  0LL,  a4,  a5,  a6,  a7);
}

- (BOOL)verifyMessage:(id)a3 salt:(id)a4 output:(id)a5 proof:(id)a6 error:(id *)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyVRFVerifier key](self, "key"));
  LOBYTE(a7) = +[TransparencyECVRFVerifier verifyMessage:salt:output:proof:key:error:]( &OBJC_CLASS___TransparencyECVRFVerifier,  "verifyMessage:salt:output:proof:key:error:",  v15,  v14,  v13,  v12,  v16,  a7);

  return (char)a7;
}

+ (BOOL)verifyMessage:(id)a3 salt:(id)a4 output:(id)a5 proof:(id)a6 key:(id)a7 error:(id *)a8
{
  id v11 = a7;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyVRFVerifier saltMessage:salt:]( &OBJC_CLASS___TransparencyVRFVerifier,  "saltMessage:salt:",  a3,  a4));
  uint64_t v30 = 0LL;
  memset(v29, 0, sizeof(v29));
  ccvrf_factory_irtfdraft03_default(v29);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 vrfKey]);
  id v15 = [v14 length];
  v16 = (void *)objc_claimAutoreleasedReturnValue([v11 vrfKey]);

  id v17 = v16;
  id v18 = [v17 bytes];
  id v19 = [v13 length];
  id v20 = v13;
  id v21 = [v20 bytes];
  id v22 = [v12 length];
  id v23 = v12;
  id v24 = [v23 bytes];

  uint64_t v25 = ccvrf_verify(v29, v15, v18, v19, v21, v22, v24);
  if ((_DWORD)v25)
  {
    if (a8) {
      *a8 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  @"TransparencyErrorVerify",  -2LL,  @"ECVRF verification failed with result %d",  v25));
    }
    if (qword_1002EEE40 != -1) {
      dispatch_once(&qword_1002EEE40, &stru_1002891B0);
    }
    v26 = (os_log_s *)qword_1002EEE48;
    if (os_log_type_enabled((os_log_t)qword_1002EEE48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v32 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "VRF verification failed with result %d",  buf,  8u);
    }
  }

  return (_DWORD)v25 == 0;
}

@end
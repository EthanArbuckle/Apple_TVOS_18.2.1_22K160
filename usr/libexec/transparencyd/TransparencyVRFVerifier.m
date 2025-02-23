@interface TransparencyVRFVerifier
+ (BOOL)verifyMessage:(id)a3 output:(id)a4 proof:(id)a5 key:(id)a6 error:(id *)a7;
+ (BOOL)verifyMessage:(id)a3 salt:(id)a4 output:(id)a5 proof:(id)a6 key:(id)a7 error:(id *)a8;
+ (id)saltMessage:(id)a3 salt:(id)a4;
+ (id)verifierOfType:(int)a3 key:(id)a4;
- (BOOL)verifyMessage:(id)a3 output:(id)a4 proof:(id)a5 error:(id *)a6;
- (BOOL)verifyMessage:(id)a3 salt:(id)a4 output:(id)a5 proof:(id)a6 error:(id *)a7;
- (TransparencyVRFVerifier)initWithKey:(id)a3;
- (VRFPublicKey)key;
- (int)vrfType;
- (void)setKey:(id)a3;
@end

@implementation TransparencyVRFVerifier

+ (id)verifierOfType:(int)a3 key:(id)a4
{
  id v5 = a4;
  if (a3 == 3)
  {
    v6 = -[TransparencyECVRFVerifier initWithKey:]( objc_alloc(&OBJC_CLASS___TransparencyECVRFVerifier),  "initWithKey:",  v5);
    if (v6) {
      goto LABEL_12;
    }
    if (qword_1002EEE40 != -1) {
      dispatch_once(&qword_1002EEE40, &stru_100289170);
    }
    v7 = (os_log_s *)qword_1002EEE48;
    if (os_log_type_enabled((os_log_t)qword_1002EEE48, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Failed to create ECVRF_ED25519_SHA512_Elligator2 verifier, falling back to unknown algorithm",  (uint8_t *)v10,  2u);
    }
  }

  if (qword_1002EEE40 != -1) {
    dispatch_once(&qword_1002EEE40, &stru_100289190);
  }
  v8 = (os_log_s *)qword_1002EEE48;
  if (os_log_type_enabled((os_log_t)qword_1002EEE48, OS_LOG_TYPE_ERROR))
  {
    v10[0] = 67109120;
    v10[1] = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Unknown VRF algorithm: %d", (uint8_t *)v10, 8u);
  }

  v6 = -[TransparencyVRFVerifier initWithKey:](objc_alloc(&OBJC_CLASS___TransparencyVRFVerifier), "initWithKey:", v5);
LABEL_12:

  return v6;
}

- (TransparencyVRFVerifier)initWithKey:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TransparencyVRFVerifier;
  id v5 = -[TransparencyVRFVerifier init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[TransparencyVRFVerifier setKey:](v5, "setKey:", v4);
  }

  return v6;
}

- (int)vrfType
{
  return 0;
}

- (BOOL)verifyMessage:(id)a3 output:(id)a4 proof:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyVRFVerifier key](self, "key"));
  LOBYTE(a6) = +[TransparencyVRFVerifier verifyMessage:salt:output:proof:key:error:]( &OBJC_CLASS___TransparencyVRFVerifier,  "verifyMessage:salt:output:proof:key:error:",  v12,  0LL,  v11,  v10,  v13,  a6);

  return (char)a6;
}

+ (BOOL)verifyMessage:(id)a3 output:(id)a4 proof:(id)a5 key:(id)a6 error:(id *)a7
{
  return +[TransparencyVRFVerifier verifyMessage:salt:output:proof:key:error:]( &OBJC_CLASS___TransparencyVRFVerifier,  "verifyMessage:salt:output:proof:key:error:",  a3,  0LL,  a4,  a5,  a6,  a7);
}

- (BOOL)verifyMessage:(id)a3 salt:(id)a4 output:(id)a5 proof:(id)a6 error:(id *)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyVRFVerifier key](self, "key"));
  LOBYTE(a7) = +[TransparencyVRFVerifier verifyMessage:salt:output:proof:key:error:]( &OBJC_CLASS___TransparencyVRFVerifier,  "verifyMessage:salt:output:proof:key:error:",  v15,  v14,  v13,  v12,  v16,  a7);

  return (char)a7;
}

+ (BOOL)verifyMessage:(id)a3 salt:(id)a4 output:(id)a5 proof:(id)a6 key:(id)a7 error:(id *)a8
{
  if (a8) {
    *a8 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  @"TransparencyErrorVerify",  -135LL,  @"unknown VRF algorithm",  a6,  a7));
  }
  return 0;
}

+ (id)saltMessage:(id)a3 salt:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
  if (v6)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSData kt_dataWithUint64:length:]( NSData,  "kt_dataWithUint64:length:",  [v6 length],  8));
    [v7 appendData:v8];

    [v7 appendData:v6];
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSData kt_dataWithUint64:length:]( NSData,  "kt_dataWithUint64:length:",  [v5 length],  8));
    [v7 appendData:v9];
  }

  [v7 appendData:v5];

  return v7;
}

- (VRFPublicKey)key
{
  return (VRFPublicKey *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
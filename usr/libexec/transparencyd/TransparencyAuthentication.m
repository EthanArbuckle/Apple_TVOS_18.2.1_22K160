@interface TransparencyAuthentication
+ (BOOL)isVirtualMachine;
- (BOOL)isSupported;
- (BOOL)ready;
- (KTBAAKey)baaKey;
- (KTBAAOperationProtocol)certFetcher;
- (NSDate)lastLocalFetchTime;
- (TransparencyAuthentication)initWithWorkloop:(id)a3;
- (void)issueCert:(BOOL)a3 completionHandler:(id)a4;
- (void)setBaaKey:(id)a3;
- (void)setCertFetcher:(id)a3;
- (void)setIsSupported:(BOOL)a3;
- (void)setLastLocalFetchTime:(id)a3;
- (void)signData:(id)a3 fetchNow:(BOOL)a4 completionHandler:(id)a5;
- (void)signData:(id)a3 key:(__SecKey *)a4 certs:(id)a5 completionHandler:(id)a6;
- (void)signDataWithTimestamp:(id)a3 fetchNow:(BOOL)a4 completionHandler:(id)a5;
- (void)signDataWithTimestamp:(id)a3 fetchNow:(BOOL)a4 timeShift:(double)a5 completionHandler:(id)a6;
@end

@implementation TransparencyAuthentication

+ (BOOL)isVirtualMachine
{
  if (qword_1002EEF10 != -1) {
    dispatch_once(&qword_1002EEF10, &stru_100289ED0);
  }
  return byte_1002EEF18;
}

- (void)issueCert:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  v6 = (void (**)(id, KTBAAKey *))a4;
  if (+[TransparencyAuthentication isVirtualMachine](&OBJC_CLASS___TransparencyAuthentication, "isVirtualMachine"))
  {
    -[TransparencyAuthentication setIsSupported:](self, "setIsSupported:", 0LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorInterface,  -132LL,  @"Device auth not supported for simulators"));
    v8 = -[KTBAAKey initWithKey:certificates:failure:]( objc_alloc(&OBJC_CLASS___KTBAAKey),  "initWithKey:certificates:failure:",  0LL,  0LL,  v7);
    v6[2](v6, v8);
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyAuthentication certFetcher](self, "certFetcher"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1001C9998;
    v10[3] = &unk_100289F58;
    v10[4] = self;
    v11 = v6;
    [v9 getDeviceCertWithForcedFetch:v4 completionHandler:v10];
  }
}

- (TransparencyAuthentication)initWithWorkloop:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TransparencyAuthentication;
  id v3 = a3;
  BOOL v4 = -[TransparencyAuthentication init](&v8, "init");
  v5 = v4;
  if (v4) {
    -[TransparencyAuthentication setIsSupported:](v4, "setIsSupported:", 1LL, v8.receiver, v8.super_class);
  }
  v6 = -[TransparencyBAACertFetcher initWithWorkloop:]( objc_alloc(&OBJC_CLASS___TransparencyBAACertFetcher),  "initWithWorkloop:",  v3);

  -[TransparencyAuthentication setCertFetcher:](v5, "setCertFetcher:", v6);
  return v5;
}

- (BOOL)ready
{
  return 1;
}

- (void)signData:(id)a3 key:(__SecKey *)a4 certs:(id)a5 completionHandler:(id)a6
{
  id v9 = a5;
  v10 = (void (**)(id, CFDataRef, id, void))a6;
  CFErrorRef error = 0LL;
  CFDataRef v11 = SecKeyCreateSignature(a4, kSecKeyAlgorithmECDSASignatureMessageX962SHA256, (CFDataRef)a3, &error);
  if (v11) {
    BOOL v12 = error == 0LL;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    CFErrorRef v14 = v11;
    v10[2](v10, v11, v9, 0LL);
  }

  else
  {
    if (qword_1002EEF20 != -1) {
      dispatch_once(&qword_1002EEF20, &stru_100289F78);
    }
    v13 = (os_log_s *)qword_1002EEF28;
    if (os_log_type_enabled((os_log_t)qword_1002EEF28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFErrorRef v17 = error;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to create signature: %@", buf, 0xCu);
    }

    CFErrorRef v14 = error;
    ((void (**)(id, CFDataRef, id, CFErrorRef))v10)[2](v10, 0LL, 0LL, error);
  }
}

- (void)signData:(id)a3 fetchNow:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  if (v6) {
    goto LABEL_6;
  }
  CFDataRef v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyAuthentication baaKey](v10, "baaKey"));
  if (([v11 validBAAKey] & 1) == 0)
  {

    goto LABEL_6;
  }

  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyAuthentication lastLocalFetchTime](v10, "lastLocalFetchTime"));
  [v12 timeIntervalSinceNow];
  double v14 = v13;
  double v15 = (double)(uint64_t)-kKTAuthenticationLifetime;

  if (v14 <= v15)
  {
LABEL_6:
    objc_sync_exit(v10);

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1001CA114;
    v20[3] = &unk_100289FA0;
    v20[4] = v10;
    id v21 = v8;
    id v22 = v9;
    -[TransparencyAuthentication issueCert:completionHandler:](v10, "issueCert:completionHandler:", v6, v20);

    goto LABEL_7;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyAuthentication baaKey](v10, "baaKey"));
  id v17 = [v16 referenceKey];
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyAuthentication baaKey](v10, "baaKey"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 certificates]);
  -[TransparencyAuthentication signData:key:certs:completionHandler:]( v10,  "signData:key:certs:completionHandler:",  v8,  v17,  v19,  v9);

  objc_sync_exit(v10);
LABEL_7:
}

- (void)signDataWithTimestamp:(id)a3 fetchNow:(BOOL)a4 timeShift:(double)a5 completionHandler:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a3;
  +[NSDate kt_currentTimeMs](&OBJC_CLASS___NSDate, "kt_currentTimeMs");
  double v13 = v12;
  if (a5 > 1.0 || a5 < -1.0)
  {
    double v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v15 timeIntervalSince1970];
    double v13 = (v16 + a5) * 1000.0;
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%llu",  (unint64_t)v13));
  unint64_t v24 = bswap64((unint64_t)v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithData:](&OBJC_CLASS___NSMutableData, "dataWithData:", v11));

  [v18 appendBytes:&v24 length:8];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1001CA338;
  v21[3] = &unk_100289FC8;
  id v22 = v17;
  id v23 = v10;
  id v19 = v17;
  id v20 = v10;
  -[TransparencyAuthentication signData:fetchNow:completionHandler:]( self,  "signData:fetchNow:completionHandler:",  v18,  v7,  v21);
}

- (void)signDataWithTimestamp:(id)a3 fetchNow:(BOOL)a4 completionHandler:(id)a5
{
}

- (BOOL)isSupported
{
  return self->_isSupported;
}

- (void)setIsSupported:(BOOL)a3
{
  self->_isSupported = a3;
}

- (NSDate)lastLocalFetchTime
{
  return (NSDate *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setLastLocalFetchTime:(id)a3
{
}

- (KTBAAKey)baaKey
{
  return (KTBAAKey *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setBaaKey:(id)a3
{
}

- (KTBAAOperationProtocol)certFetcher
{
  return (KTBAAOperationProtocol *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setCertFetcher:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
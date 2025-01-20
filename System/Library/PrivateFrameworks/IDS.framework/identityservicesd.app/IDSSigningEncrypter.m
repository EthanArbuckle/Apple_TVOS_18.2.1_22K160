@interface IDSSigningEncrypter
- (IDSDServiceController)serviceController;
- (IDSMPFullDeviceIdentitySigner)fullDeviceIdentitySigner;
- (IDSSigningEncrypter)initWithKeyType:(unsigned int)a3 keyDiversifier:(id)a4 service:(id)a5 serviceController:(id)a6 fullDeviceIdentitySigner:(id)a7;
- (IDSSigningKeyDiversifier)keyDiversifier;
- (NSString)service;
- (id)_signData:(id)a3 withType:(int64_t)a4 error:(id *)a5;
- (id)batchSignDatas:(id)a3 withType:(int64_t)a4 onQueue:(id)a5 error:(id *)a6;
- (id)signData:(id)a3 withType:(int64_t)a4 onQueue:(id)a5 error:(id *)a6;
- (unsigned)_retrieveKeyIndex;
- (unsigned)keyIndex;
- (unsigned)keyType;
- (void)batchSignDatas:(id)a3 withType:(int64_t)a4 onQueue:(id)a5 withCompletion:(id)a6;
- (void)signData:(id)a3 withType:(int64_t)a4 onQueue:(id)a5 withCompletion:(id)a6;
@end

@implementation IDSSigningEncrypter

- (IDSSigningEncrypter)initWithKeyType:(unsigned int)a3 keyDiversifier:(id)a4 service:(id)a5 serviceController:(id)a6 fullDeviceIdentitySigner:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___IDSSigningEncrypter;
  v17 = -[IDSSigningEncrypter init](&v20, "init");
  v18 = v17;
  if (v17)
  {
    v17->_keyType = a3;
    objc_storeStrong((id *)&v17->_keyDiversifier, a4);
    objc_storeStrong((id *)&v18->_service, a5);
    objc_storeStrong((id *)&v18->_serviceController, a6);
    v18->_keyIndex = -[IDSSigningEncrypter _retrieveKeyIndex](v18, "_retrieveKeyIndex");
    objc_storeStrong((id *)&v18->_fullDeviceIdentitySigner, a7);
  }

  return v18;
}

- (void)batchSignDatas:(id)a3 withType:(int64_t)a4 onQueue:(id)a5 withCompletion:(id)a6
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000BFAC8;
  v11[3] = &unk_1008F9300;
  v11[4] = self;
  id v12 = a3;
  id v13 = a6;
  int64_t v14 = a4;
  id v9 = v13;
  id v10 = v12;
  [a5 performAsyncBlock:v11];
}

- (void)signData:(id)a3 withType:(int64_t)a4 onQueue:(id)a5 withCompletion:(id)a6
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000BFC80;
  v11[3] = &unk_1008F9300;
  v11[4] = self;
  id v12 = a3;
  id v13 = a6;
  int64_t v14 = a4;
  id v9 = v13;
  id v10 = v12;
  [a5 performAsyncBlock:v11];
}

- (id)batchSignDatas:(id)a3 withType:(int64_t)a4 onQueue:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  v23 = sub_1000BFE90;
  v24 = sub_1000BFEA0;
  id v25 = 0LL;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000BFEA8;
  v15[3] = &unk_1008F9328;
  v17 = &v20;
  v15[4] = self;
  id v12 = v10;
  id v16 = v12;
  int64_t v18 = a4;
  v19 = a6;
  [v11 performSyncBlock:v15];
  id v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

- (id)signData:(id)a3 withType:(int64_t)a4 onQueue:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v27 = 0LL;
  v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  v30 = sub_1000BFE90;
  v31 = sub_1000BFEA0;
  id v32 = 0LL;
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  v24 = sub_1000BFE90;
  id v25 = sub_1000BFEA0;
  id v26 = 0LL;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000C006C;
  v16[3] = &unk_1008F9350;
  int64_t v18 = &v27;
  v16[4] = self;
  id v12 = v10;
  v19 = &v21;
  int64_t v20 = a4;
  id v17 = v12;
  [v11 performSyncBlock:v16];
  if (a6)
  {
    id v13 = (void *)v22[5];
    if (v13) {
      *a6 = v13;
    }
  }

  id v14 = (id)v28[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

- (unsigned)_retrieveKeyIndex
{
  if (-[IDSSigningEncrypter keyType](self, "keyType") != 1) {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSigningEncrypter serviceController](self, "serviceController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSigningEncrypter service](self, "service"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 serviceWithIdentifier:v4]);
  unsigned __int16 v6 = (unsigned __int16)[v5 applicationKeyIndex];

  return v6;
}

- (id)_signData:(id)a3 withType:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  unsigned int v9 = -[IDSSigningEncrypter keyType](self, "keyType");
  if (v9 == 1)
  {
    if (-[IDSSigningEncrypter keyIndex](self, "keyIndex"))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSigningEncrypter fullDeviceIdentitySigner](self, "fullDeviceIdentitySigner"));
      uint64_t v13 = -[IDSSigningEncrypter keyIndex](self, "keyIndex");
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSigningEncrypter keyDiversifier](self, "keyDiversifier"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v12 signData:v8 usingApplicationKeyIndex:v13 diversifier:v14 error:a5]);

      goto LABEL_9;
    }

    if (a5)
    {
      id v11 = 0LL;
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSSigningErrorDomain,  5LL,  0LL));
      goto LABEL_9;
    }

- (unsigned)keyType
{
  return self->_keyType;
}

- (IDSSigningKeyDiversifier)keyDiversifier
{
  return self->_keyDiversifier;
}

- (NSString)service
{
  return self->_service;
}

- (IDSDServiceController)serviceController
{
  return self->_serviceController;
}

- (unsigned)keyIndex
{
  return self->_keyIndex;
}

- (IDSMPFullDeviceIdentitySigner)fullDeviceIdentitySigner
{
  return self->_fullDeviceIdentitySigner;
}

- (void).cxx_destruct
{
}

@end
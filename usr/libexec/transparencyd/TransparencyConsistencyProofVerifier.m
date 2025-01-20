@interface TransparencyConsistencyProofVerifier
- (BOOL)verifyConsistencyProof:(id)a3 startHash:(id)a4 startSize:(unint64_t)a5 endHash:(id)a6 endSize:(unint64_t)a7 error:(id *)a8;
- (TransparencyConsistencyProofVerifier)initWithTrustedKeyStore:(id)a3;
- (TransparencyTrustedKeyStore)trustedKeyStore;
- (unint64_t)verifyConsistencyProof:(id)a3 startLogHead:(id)a4 endLogHead:(id)a5 error:(id *)a6;
- (void)setTrustedKeyStore:(id)a3;
@end

@implementation TransparencyConsistencyProofVerifier

- (TransparencyConsistencyProofVerifier)initWithTrustedKeyStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TransparencyConsistencyProofVerifier;
  v6 = -[TransparencyConsistencyProofVerifier init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_trustedKeyStore, a3);
  }

  return v7;
}

- (BOOL)verifyConsistencyProof:(id)a3 startHash:(id)a4 startSize:(unint64_t)a5 endHash:(id)a6 endSize:(unint64_t)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  if (!a5 || a7 <= a5)
  {
    if (a8) {
      *a8 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  @"TransparencyErrorVerify",  -180LL,  @"first size (%llu) is <= 0 or second size (%llu) is <= first",  a5,  a7));
    }
    if (qword_1002EEDF0 != -1) {
      dispatch_once(&qword_1002EEDF0, &stru_100288F00);
    }
    v39 = (os_log_s *)qword_1002EEDF8;
    if (os_log_type_enabled((os_log_t)qword_1002EEDF8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v63 = a5;
      __int16 v64 = 2048;
      unint64_t v65 = a7;
      _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "first size (%llu) is <= 0 or second size (%llu) is <= first",  buf,  0x16u);
    }

    goto LABEL_43;
  }

  context = objc_autoreleasePoolPush();
  id v16 = [v13 mutableCopy];
  v17 = v16;
  unint64_t v18 = a5 - 1;
  if ((a5 & (a5 - 1)) == 0) {
    [v16 insertObject:v14 atIndex:0];
  }
  unint64_t v19 = a7 - 1;
  id v52 = v14;
  id v53 = v13;
  id v51 = v15;
  v49 = a8;
  if ((v18 & 1) != 0)
  {
    do
    {
      unint64_t v20 = v18 >> 1;
      v19 >>= 1;
      char v21 = v18;
      v18 >>= 1;
    }

    while ((v21 & 2) != 0);
  }

  else
  {
    unint64_t v20 = a5 - 1;
  }

  v56 = (void *)objc_claimAutoreleasedReturnValue([v17 objectAtIndexedSubscript:0]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v17 objectAtIndexedSubscript:0]);
  [v17 removeObjectAtIndex:0];
  buf[0] = 1;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", buf, 1LL));
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  id obj = v17;
  id v24 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v58;
    v54 = v23;
    while (2)
    {
      for (i = 0LL; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v58 != v26) {
          objc_enumerationMutation(obj);
        }
        if (!v19)
        {

          id v15 = v51;
          id v14 = v52;
          v38 = v56;
          goto LABEL_33;
        }

        uint64_t v28 = *(void *)(*((void *)&v57 + 1) + 8LL * (void)i);
        id v29 = [v23 mutableCopy];
        id v30 = [v23 mutableCopy];
        v31 = v30;
        if ((v20 & 1) != 0 || v20 == v19)
        {
          id v33 = v25;
          uint64_t v34 = v26;
          [v29 appendData:v28];
          [v29 appendData:v56];
          [v31 appendData:v28];
          [v31 appendData:v22];
          uint64_t v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "kt_sha256"));

          uint64_t v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "kt_sha256"));
          if (v20 && (v20 & 1) == 0)
          {
            do
            {
              unint64_t v37 = v20;
              v20 >>= 1;
              v19 >>= 1;
            }

            while (v37 >= 2 && (v37 & 2) == 0);
          }

          v56 = (void *)v35;
          v22 = (void *)v36;
          uint64_t v26 = v34;
          id v25 = v33;
          v23 = v54;
        }

        else
        {
          [v30 appendData:v22];
          [v31 appendData:v28];
          uint64_t v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "kt_sha256"));

          v22 = (void *)v32;
        }

        v20 >>= 1;
        v19 >>= 1;
      }

      id v25 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
      if (v25) {
        continue;
      }
      break;
    }
  }

  id v15 = v51;
  id v14 = v52;
  v38 = v56;
  if (v19) {
    goto LABEL_36;
  }
LABEL_33:
  if (![v38 isEqualToData:v14])
  {
LABEL_36:

    objc_autoreleasePoolPop(context);
    goto LABEL_37;
  }

  unsigned __int8 v40 = [v22 isEqualToData:v15];

  objc_autoreleasePoolPop(context);
  if ((v40 & 1) == 0)
  {
LABEL_37:
    id v13 = v53;
    if (v49)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "kt_hexString"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "kt_hexString"));
      id *v49 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  @"TransparencyErrorVerify",  -179LL,  @"failed to verify consistency proof from head %@ to head %@",  v42,  v43));
    }

    if (qword_1002EEDF0 != -1) {
      dispatch_once(&qword_1002EEDF0, &stru_100288F20);
    }
    v44 = (void *)qword_1002EEDF8;
    if (os_log_type_enabled((os_log_t)qword_1002EEDF8, OS_LOG_TYPE_ERROR))
    {
      v45 = v44;
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "kt_hexString"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "kt_hexString"));
      *(_DWORD *)buf = 138412546;
      unint64_t v63 = (unint64_t)v46;
      __int16 v64 = 2112;
      unint64_t v65 = (unint64_t)v47;
      _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_ERROR,  "failed to verify consistency proof from head %@ to head %@",  buf,  0x16u);
    }

- (unint64_t)verifyConsistencyProof:(id)a3 startLogHead:(id)a4 endLogHead:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unint64_t v13 = (unint64_t)[v11 verifyWithError:a6];
  if (v13 == 1 && (unint64_t v13 = (unint64_t)[v12 verifyWithError:a6], v13 == 1))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue([v11 parsedLogHead]);
    id v24 = v10;
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v23 logHeadHash]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 parsedLogHead]);
    id v16 = [v15 logSize];
    v17 = (void *)objc_claimAutoreleasedReturnValue([v12 parsedLogHead]);
    unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 logHeadHash]);
    unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v12 parsedLogHead]);
    unsigned int v20 = -[TransparencyConsistencyProofVerifier verifyConsistencyProof:startHash:startSize:endHash:endSize:error:]( self,  "verifyConsistencyProof:startHash:startSize:endHash:endSize:error:",  v24,  v14,  v16,  v18,  [v19 logSize],  a6);

    id v10 = v24;
    unint64_t v13 = v20;
  }

  else
  {
    if (a6) {
      *a6 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  @"TransparencyErrorVerify",  -188LL,  *a6,  @"SLH in consistency proof failed signature verification"));
    }
    if (qword_1002EEDF0 != -1) {
      dispatch_once(&qword_1002EEDF0, &stru_100288F40);
    }
    char v21 = (os_log_s *)qword_1002EEDF8;
    if (os_log_type_enabled((os_log_t)qword_1002EEDF8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "SLH in consistency proof failed signature verification",  buf,  2u);
    }
  }

  return v13;
}

- (TransparencyTrustedKeyStore)trustedKeyStore
{
  return (TransparencyTrustedKeyStore *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setTrustedKeyStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
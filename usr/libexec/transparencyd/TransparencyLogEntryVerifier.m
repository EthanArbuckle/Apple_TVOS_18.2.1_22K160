@interface TransparencyLogEntryVerifier
- (BOOL)verifyInclusionOfLogLeaf:(id)a3 position:(unint64_t)a4 treeSize:(unint64_t)a5 treeHead:(id)a6 hashPath:(id)a7 error:(id *)a8;
- (TransparencyLogEntryVerifier)initWithTrustedKeyStore:(id)a3;
- (TransparencyTrustedKeyStore)trustedKeyStore;
- (unint64_t)verifyLogEntryWithLogLeaf:(id)a3 position:(unint64_t)a4 hashesToRoot:(id)a5 signedLogHead:(id)a6 error:(id *)a7;
- (void)setTrustedKeyStore:(id)a3;
@end

@implementation TransparencyLogEntryVerifier

- (TransparencyLogEntryVerifier)initWithTrustedKeyStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TransparencyLogEntryVerifier;
  v6 = -[TransparencyLogEntryVerifier init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_trustedKeyStore, a3);
  }

  return v7;
}

- (BOOL)verifyInclusionOfLogLeaf:(id)a3 position:(unint64_t)a4 treeSize:(unint64_t)a5 treeHead:(id)a6 hashPath:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  if (a4 >= a5)
  {
    if (a8) {
      *a8 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  @"TransparencyErrorVerify",  -49LL,  @"leaf index is too big for tree size"));
    }
    if (qword_1002EEE10 != -1) {
      dispatch_once(&qword_1002EEE10, &stru_100288FE8);
    }
    v30 = (os_log_s *)qword_1002EEE18;
    if (os_log_type_enabled((os_log_t)qword_1002EEE18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "leaf index is too big for tree size", buf, 2u);
    }

    goto LABEL_34;
  }

  v43 = a8;
  context = objc_autoreleasePoolPush();
  buf[0] = 0;
  char v50 = 1;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](&OBJC_CLASS___NSMutableData, "dataWithBytes:length:", buf, 1LL));
  id v45 = v13;
  [v16 appendData:v13];
  v41 = v16;
  unint64_t v17 = a5 - 1;
  v40 = (void *)SecSHA256DigestCreateFromData(0LL, v16);
  id v18 = [v40 copy];
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id v44 = v15;
  id v19 = v15;
  id v20 = [v19 countByEnumeratingWithState:&v46 objects:v55 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v47;
    while (2)
    {
      for (i = 0LL; i != v21; i = (char *)i + 1)
      {
        v24 = v18;
        if (*(void *)v47 != v22) {
          objc_enumerationMutation(v19);
        }
        if (!v17)
        {

          goto LABEL_26;
        }

        uint64_t v25 = *(void *)(*((void *)&v46 + 1) + 8LL * (void)i);
        v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableData dataWithBytes:length:]( &OBJC_CLASS___NSMutableData,  "dataWithBytes:length:",  &v50,  1LL));
        v27 = v26;
        if ((a4 & 1) != 0 || a4 == v17)
        {
          [v26 appendData:v25];
          [v27 appendData:v24];
          id v18 = (id)SecSHA256DigestCreateFromData(0LL, v27);
          if (a4 && (a4 & 1) == 0)
          {
            do
            {
              unint64_t v28 = a4;
              a4 >>= 1;
              v17 >>= 1;
            }

            while (v28 >= 2 && (v28 & 2) == 0);
          }
        }

        else
        {
          [v26 appendData:v24];
          [v27 appendData:v25];
          id v18 = (id)SecSHA256DigestCreateFromData(0LL, v27);
        }

        a4 >>= 1;
        v17 >>= 1;
      }

      id v21 = [v19 countByEnumeratingWithState:&v46 objects:v55 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }

  if (v17)
  {

    objc_autoreleasePoolPop(context);
    id v13 = v45;
    v29 = v43;
LABEL_28:
    if (v29)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "kt_hexString"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "kt_hexString"));
      id *v29 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  @"TransparencyErrorVerify",  -45LL,  @"failed to verify inclusion proof for leaf (%@) in head (%@)",  v33,  v34));
    }

    if (qword_1002EEE10 != -1) {
      dispatch_once(&qword_1002EEE10, &stru_100289008);
    }
    id v15 = v44;
    v35 = (void *)qword_1002EEE18;
    if (os_log_type_enabled((os_log_t)qword_1002EEE18, OS_LOG_TYPE_ERROR))
    {
      v36 = v35;
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "kt_hexString"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "kt_hexString"));
      *(_DWORD *)buf = 138412546;
      v52 = v37;
      __int16 v53 = 2112;
      v54 = v38;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "failed to verify inclusion proof for leaf (%@) in head (%@)",  buf,  0x16u);
    }

- (unint64_t)verifyLogEntryWithLogLeaf:(id)a3 position:(unint64_t)a4 hashesToRoot:(id)a5 signedLogHead:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  unint64_t v15 = (unint64_t)[v14 verifyWithError:a7];
  if (v15 == 1)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue([v14 parsedLogHead]);
    id v17 = [v16 logSize];
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v14 parsedLogHead]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 logHeadHash]);
    unsigned __int8 v20 = -[TransparencyLogEntryVerifier verifyInclusionOfLogLeaf:position:treeSize:treeHead:hashPath:error:]( self,  "verifyInclusionOfLogLeaf:position:treeSize:treeHead:hashPath:error:",  v12,  a4,  v17,  v19,  v13,  a7);

    if ((v20 & 1) != 0)
    {
      unint64_t v15 = 1LL;
    }

    else
    {
      if (a7) {
        *a7 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  @"TransparencyErrorVerify",  -44LL,  *a7,  @"failed to verify inclusion proof for log leaf in log head"));
      }
      if (qword_1002EEE10 != -1) {
        dispatch_once(&qword_1002EEE10, &stru_100289028);
      }
      id v21 = (os_log_s *)qword_1002EEE18;
      if (os_log_type_enabled((os_log_t)qword_1002EEE18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "failed to verify inclusion proof for log leaf in log head",  v23,  2u);
      }

      unint64_t v15 = 0LL;
    }
  }

  return v15;
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
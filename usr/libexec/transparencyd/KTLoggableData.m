@interface KTLoggableData
- (BOOL)verifySignatureWithAccountKey:(id)a3 error:(id *)a4;
- (void)computeHashesForSalt:(id)a3;
@end

@implementation KTLoggableData

- (void)computeHashesForSalt:(id)a3
{
  id v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTLoggableData deviceID](self, "deviceID"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTLoggableData deviceID](self, "deviceID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "kt_sha256WithSalt:", v9));
    -[KTLoggableData setDeviceIdHash:](self, "setDeviceIdHash:", v6);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTLoggableData clientData](self, "clientData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "kt_sha256WithSalt:", v9));
  -[KTLoggableData setClientDataHash:](self, "setClientDataHash:", v8);
}

- (BOOL)verifySignatureWithAccountKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[KTLoggableData clientData](self, "clientData"));
  if (v7
    && (v8 = (void *)v7,
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTLoggableData signature](self, "signature")),
        v9,
        v8,
        v9))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTLoggableData clientData](self, "clientData"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTLoggableData signature](self, "signature"));
    id v43 = 0LL;
    unsigned __int8 v12 = +[KTAccountKeyServer verifyData:signature:accountPublicKeyInfo:error:]( &OBJC_CLASS___KTAccountKeyServer,  "verifyData:signature:accountPublicKeyInfo:error:",  v10,  v11,  v6,  &v43);
    id v13 = v43;

    if ((v12 & 1) != 0)
    {
      BOOL v14 = 1;
    }

    else
    {
      if (qword_1002EEB88 != -1) {
        dispatch_once(&qword_1002EEB88, &stru_100285FB0);
      }
      v31 = (void *)qword_1002EEB90;
      if (os_log_type_enabled((os_log_t)qword_1002EEB90, OS_LOG_TYPE_ERROR))
      {
        log = v31;
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[KTLoggableData deviceID](self, "deviceID"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "kt_hexString"));
        unsigned int v32 = -[KTLoggableData ktCapable](self, "ktCapable");
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[KTLoggableData clientData](self, "clientData"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "kt_hexString"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "kt_hexString"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[KTLoggableData signature](self, "signature"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "kt_hexString"));
        *(_DWORD *)buf = 138413314;
        v45 = v40;
        __int16 v46 = 1024;
        unsigned int v47 = v32;
        __int16 v48 = 2112;
        v49 = v34;
        __int16 v50 = 2112;
        v51 = v35;
        __int16 v52 = 2112;
        v53 = v37;
        _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "failed to verify signature for deviceID %@, ktCapable %d, client data %@ key: %@ signature: %@",  buf,  0x30u);
      }

      v38 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  @"TransparencyErrorVerify",  -272LL,  v13,  @"failed to validate loggable data signature"));

      if (qword_1002EEB88 != -1) {
        dispatch_once(&qword_1002EEB88, &stru_100285FD0);
      }
      v39 = (os_log_s *)qword_1002EEB90;
      if (os_log_type_enabled((os_log_t)qword_1002EEB90, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v38;
        _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "failed to validate loggable data signatures: %@",  buf,  0xCu);
      }

      BOOL v14 = 0;
      if (a4 && v38)
      {
        id v13 = v38;
        BOOL v14 = 0;
        *a4 = v13;
      }

      else
      {
        id v13 = v38;
      }
    }
  }

  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTLoggableData deviceID](self, "deviceID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "kt_hexString"));
    [v15 setObject:v17 forKeyedSubscript:@"deviceID"];

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTLoggableData product](self, "product"));
    [v15 setObject:v18 forKeyedSubscript:@"product"];

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTLoggableData build](self, "build"));
    [v15 setObject:v19 forKeyedSubscript:@"build"];

    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[KTLoggableData ktCapable](self, "ktCapable")));
    [v15 setObject:v20 forKeyedSubscript:@"ktCapable"];

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTLoggableData clientData](self, "clientData"));
    if (v21) {
      uint64_t v22 = -286LL;
    }
    else {
      uint64_t v22 = -362LL;
    }
    id v13 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:errorLevel:underlyingError:userinfo:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:errorLevel:underlyingError:userinfo:description:",  @"TransparencyErrorVerify",  v22,  4LL,  0LL,  v15,  @"no signature for client data"));
    if (qword_1002EEB88 != -1) {
      dispatch_once(&qword_1002EEB88, &stru_100285F90);
    }
    v23 = (void *)qword_1002EEB90;
    if (os_log_type_enabled((os_log_t)qword_1002EEB90, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v23;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTLoggableData deviceID](self, "deviceID"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "kt_hexString"));
      unsigned int v27 = -[KTLoggableData ktCapable](self, "ktCapable");
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[KTLoggableData clientData](self, "clientData"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "kt_hexString"));
      *(_DWORD *)buf = 138412802;
      v45 = v26;
      __int16 v46 = 1024;
      unsigned int v47 = v27;
      __int16 v48 = 2112;
      v49 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "no signature for deviceId %@, ktCapable %d, client data %@",  buf,  0x1Cu);
    }

    if (a4 && v13) {
      *a4 = v13;
    }

    BOOL v14 = 0;
  }

  return v14;
}

@end
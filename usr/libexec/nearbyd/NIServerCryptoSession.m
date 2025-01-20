@interface NIServerCryptoSession
- (NIServerCryptoSession)initWithKeyDerivationKey:(id)a3 sessionIdentifier:(id)a4 encrypt:(BOOL)a5;
- (NSData)keyDerivationKey;
- (NSData)sessionIdentifier;
- (id)_deriveSessionKeyFromKeyDerivationKey:(id)a3 sessionIdentifier:(id)a4;
- (id)decrypt:(id)a3;
- (id)encrypt:(id)a3;
@end

@implementation NIServerCryptoSession

- (NIServerCryptoSession)initWithKeyDerivationKey:(id)a3 sessionIdentifier:(id)a4 encrypt:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v48.receiver = self;
  v48.super_class = (Class)&OBJC_CLASS___NIServerCryptoSession;
  v11 = -[NIServerCryptoSession init](&v48, "init");
  if (!v11) {
    goto LABEL_18;
  }
  if ([v9 length])
  {
    if ([v10 length])
    {
      objc_storeStrong((id *)&v11->_keyDerivationKey, a3);
      objc_storeStrong((id *)&v11->_sessionIdentifier, a4);
      uint64_t v13 = CUPrintNSObjectMasked(v11->_sessionIdentifier, v12);
      uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
      logIdentifier = v11->_logIdentifier;
      v11->_logIdentifier = (NSString *)v14;

      v11->_encrypt = v5;
      uint64_t v16 = objc_claimAutoreleasedReturnValue( -[NIServerCryptoSession _deriveSessionKeyFromKeyDerivationKey:sessionIdentifier:]( v11,  "_deriveSessionKeyFromKeyDerivationKey:sessionIdentifier:",  v9,  v10));
      sessionKey = v11->_sessionKey;
      v11->_sessionKey = (NSData *)v16;

      if (v11->_sessionKey)
      {
        if (v5)
        {
          v11->_nonce = arc4random_uniform(0xFFFF0000);
          v18 = (os_log_s *)qword_1008000A0;
          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
          {
            v19 = v11->_logIdentifier;
            *(_DWORD *)buf = 138477827;
            v50 = v19;
            v20 = "#crypto,[%{private}@][Encryptor] initialized";
LABEL_17:
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
          }
        }

        else
        {
          v11->_nonce = 0LL;
          v18 = (os_log_s *)qword_1008000A0;
          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
          {
            v46 = v11->_logIdentifier;
            *(_DWORD *)buf = 138477827;
            v50 = v46;
            v20 = "#crypto,[%{private}@][Decryptor] initialized";
            goto LABEL_17;
          }
        }

- (id)encrypt:(id)a3
{
  id v4 = a3;
  if (!self->_encrypt)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_1003991E8();
    }
    goto LABEL_23;
  }

  unint64_t nonce = self->_nonce;
  if (nonce >= 0xFFFFFFFF)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_100399248();
    }
    goto LABEL_23;
  }

  unint64_t v6 = nonce + 1;
  self->_unint64_t nonce = v6;
  int v29 = v6;
  CCCryptorRef cryptorRef = 0LL;
  CCCryptorStatus v7 = CCCryptorCreateWithMode( 0,  0xCu,  0,  0x3E8u,  0LL,  -[NSData bytes](self->_sessionKey, "bytes"),  -[NSData length](self->_sessionKey, "length"),  0LL,  0LL,  0,  0,  &cryptorRef);
  if (v7 || !cryptorRef)
  {
    v8 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
    {
      logIdentifier = self->_logIdentifier;
      *(_DWORD *)buf = 138478339;
      *(void *)&uint8_t buf[4] = logIdentifier;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v7;
      __int16 v34 = 1024;
      BOOL v35 = cryptorRef != 0LL;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "#crypto,[%{private}@][Encryptor] create failed %d. Cryptor needs release: %d",  buf,  0x18u);
    }

    if (!cryptorRef) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }

  if (CCCryptorAddParameter(cryptorRef, 3, 0, [v4 length]))
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_100399488();
    }
LABEL_22:
    CCCryptorRelease(cryptorRef);
LABEL_23:
    id v9 = 0LL;
    goto LABEL_24;
  }

  if (CCCryptorAddParameter(cryptorRef, 2LL, 0LL, 6LL))
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_100399428();
    }
    goto LABEL_22;
  }

  if (CCCryptorAddParameter(cryptorRef, 0LL, &self->_nonce, 8LL))
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_1003993C8();
    }
    goto LABEL_22;
  }

  char v27 = 1;
  LOBYTE(v25) = 0;
  sub_10016C2CC(buf, 5uLL, &v25);
  **(_BYTE **)buf = v27;
  *(_DWORD *)(*(void *)buf + 1LL) = v29;
  if (CCCryptorAddParameter(cryptorRef, 1LL, *(void *)buf, *(void *)&buf[8] - *(void *)buf))
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_100399368();
    }
    CCCryptorRelease(cryptorRef);
    id v9 = 0LL;
  }

  else
  {
    size_t OutputLength = CCCryptorGetOutputLength(cryptorRef, (size_t)[v4 length], 0);
    LOBYTE(__p) = 0;
    sub_10016C2CC(&v25, OutputLength, &__p);
    size_t dataOutMoved = 0LL;
    uint64_t v13 = cryptorRef;
    id v14 = v4;
    id v15 = [v14 bytes];
    id v16 = [v14 length];
    if (CCCryptorUpdate(v13, v15, (size_t)v16, v25, v26 - (_BYTE *)v25, &dataOutMoved))
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_100399308();
      }
      CCCryptorRelease(cryptorRef);
      id v9 = 0LL;
    }

    else
    {
      if (dataOutMoved < v26 - (_BYTE *)v25) {
        sub_1001C8FA8((unint64_t *)&v25, dataOutMoved);
      }
      v30[0] = 0;
      sub_10016C2CC(&__p, 0x10uLL, v30);
      size_t v21 = 0LL;
      CCCryptorStatus v17 = CCCryptorFinal(cryptorRef, __p, v23 - (_BYTE *)__p, &v21);
      if (v17 || v21)
      {
        v18 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
        {
          v19 = self->_logIdentifier;
          *(_DWORD *)uint64_t v30 = 138478339;
          *(void *)&v30[4] = v19;
          *(_WORD *)&v30[12] = 1024;
          *(_DWORD *)&v30[14] = v17;
          __int16 v31 = 1024;
          int v32 = v21;
          _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "#crypto,[%{private}@][Encryptor] cryptor-final failed %d. Leftover: %d",  v30,  0x18u);
        }

        CCCryptorRelease(cryptorRef);
        id v9 = 0LL;
      }

      else
      {
        LOBYTE(v20) = 0;
        sub_10016C2CC(v30, 6uLL, &v20);
        uint64_t v20 = *(void *)&v30[8] - *(void *)v30;
        if (CCCryptorGetParameter(cryptorRef, 4LL))
        {
          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
            sub_1003992A8();
          }
          CCCryptorRelease(cryptorRef);
          id v9 = 0LL;
        }

        else
        {
          CCCryptorRelease(cryptorRef);
          id v9 = objc_opt_new(&OBJC_CLASS___NSMutableData);
          -[NSMutableData appendBytes:length:](v9, "appendBytes:length:", &v27, 1LL);
          -[NSMutableData appendBytes:length:](v9, "appendBytes:length:", &v29, 4LL);
          -[NSMutableData appendBytes:length:]( v9,  "appendBytes:length:",  *(void *)v30,  *(void *)&v30[8] - *(void *)v30);
          -[NSMutableData appendBytes:length:](v9, "appendBytes:length:", v25, v26 - (_BYTE *)v25);
        }

        if (*(void *)v30)
        {
          *(void *)&v30[8] = *(void *)v30;
          operator delete(*(void **)v30);
        }
      }

      if (__p)
      {
        uint64_t v23 = __p;
        operator delete(__p);
      }
    }

    if (v25)
    {
      uint64_t v26 = v25;
      operator delete(v25);
    }
  }

  if (*(void *)buf)
  {
    *(void *)&buf[8] = *(void *)buf;
    operator delete(*(void **)buf);
  }

- (id)decrypt:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (self->_encrypt)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_100399908();
    }
LABEL_15:
    v8 = 0LL;
    goto LABEL_16;
  }

  char v32 = 0;
  if (![v4 length])
  {
    CCCryptorStatus v7 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1003994E8((uint64_t)self->_logIdentifier, (int)[v5 length], (uint64_t)&v42);
    }

    goto LABEL_15;
  }

  objc_msgSend(v5, "getBytes:range:", &v32, 0, 1);
  if (v32 != 1)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_1003998A8();
    }
    goto LABEL_15;
  }

  unsigned int v31 = 0;
  if ((unint64_t)[v5 length] <= 4)
  {
    unint64_t v6 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100399528((uint64_t)self->_logIdentifier, (int)[v5 length], (uint64_t)&v42);
    }

    goto LABEL_15;
  }

  objc_msgSend(v5, "getBytes:range:", &v31, 1, 4);
  uint64_t v30 = v31;
  LOBYTE(v39) = 0;
  sub_10016C2CC(&v42, 6uLL, &v39);
  if ((unint64_t)[v5 length] > 0xA)
  {
    objc_msgSend(v5, "getBytes:range:", v42, 5, 6);
    uint64_t v39 = 0LL;
    uint64_t v40 = 0LL;
    uint64_t v41 = 0LL;
    id v11 = [v5 length];
    unint64_t v12 = (unint64_t)v11 - 11;
    if (v11 == (id)11)
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_1003995A8();
      }
      goto LABEL_41;
    }

    buf[0] = 0;
    sub_1001C98F4(&v39, v12, buf);
    objc_msgSend(v5, "getBytes:range:", v39, 11, v12);
    if (v11 != [v5 length]) {
      __assert_rtn( "-[NIServerCryptoSession decrypt:]",  "NIServerCryptoSession.mm",  306,  "byteOffset == ciphertext.length");
    }
    CCCryptorRef cryptorRef = 0LL;
    CCCryptorStatus v13 = CCCryptorCreateWithMode( 1u,  0xCu,  0,  0x3E8u,  0LL,  -[NSData bytes](self->_sessionKey, "bytes"),  -[NSData length](self->_sessionKey, "length"),  0LL,  0LL,  0,  0,  &cryptorRef);
    if (v13 || !cryptorRef)
    {
      id v14 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
      {
        logIdentifier = self->_logIdentifier;
        *(_DWORD *)buf = 138478339;
        *(void *)&uint8_t buf[4] = logIdentifier;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v13;
        __int16 v37 = 1024;
        BOOL v38 = cryptorRef != 0LL;
        _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "#crypto,[%{private}@][Decryptor] create failed %d. Cryptor needs release: %d",  buf,  0x18u);
      }

      if (!cryptorRef) {
        goto LABEL_41;
      }
    }

    else if (CCCryptorAddParameter(cryptorRef, 3LL, 0LL, v40 - v39))
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_100399848();
      }
    }

    else if (CCCryptorAddParameter(cryptorRef, 2LL, 0LL, 6LL))
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_1003997E8();
      }
    }

    else
    {
      if (!CCCryptorAddParameter(cryptorRef, 0LL, &v30, 8LL))
      {
        LOBYTE(v27) = 0;
        sub_10016C2CC(buf, 5uLL, &v27);
        **(_BYTE **)buf = v32;
        *(_DWORD *)(*(void *)buf + 1LL) = v31;
        if (CCCryptorAddParameter(cryptorRef, 1LL, *(void *)buf, *(void *)&buf[8] - *(void *)buf))
        {
          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
            sub_100399728();
          }
          CCCryptorRelease(cryptorRef);
          v8 = 0LL;
        }

        else
        {
          size_t OutputLength = CCCryptorGetOutputLength(cryptorRef, v40 - v39, 0);
          LOBYTE(v24) = 0;
          sub_10016C2CC(&v27, OutputLength, &v24);
          size_t dataOutMoved = 0LL;
          if (CCCryptorUpdate(cryptorRef, v39, v40 - v39, v27, v28 - (_BYTE *)v27, &dataOutMoved))
          {
            if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
              sub_1003996C8();
            }
            CCCryptorRelease(cryptorRef);
            v8 = 0LL;
          }

          else
          {
            if (dataOutMoved < v28 - (_BYTE *)v27) {
              sub_1001C8FA8((unint64_t *)&v27, dataOutMoved);
            }
            __p[0] = 0;
            sub_10016C2CC(&v24, 0x10uLL, __p);
            size_t v23 = 0LL;
            CCCryptorStatus v17 = CCCryptorFinal(cryptorRef, v24, v25 - (_BYTE *)v24, &v23);
            if (v17 || v23)
            {
              v18 = (os_log_s *)qword_1008000A0;
              if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
              {
                size_t v21 = self->_logIdentifier;
                *(_DWORD *)__p = 138478339;
                *(void *)&__p[4] = v21;
                *(_WORD *)&__p[12] = 1024;
                *(_DWORD *)&__p[14] = v17;
                __int16 v34 = 1024;
                int v35 = v23;
                _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "#crypto,[%{private}@][Decryptor] cryptor-final failed %d. Leftover: %d",  __p,  0x18u);
              }

              CCCryptorRelease(cryptorRef);
              v8 = 0LL;
            }

            else
            {
              LOBYTE(v22) = 0;
              sub_10016C2CC(__p, 6uLL, &v22);
              uint64_t v22 = *(void *)&__p[8] - *(void *)__p;
              if (CCCryptorGetParameter(cryptorRef, 4LL))
              {
                if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
                  sub_100399668();
                }
                CCCryptorRelease(cryptorRef);
                v8 = 0LL;
              }

              else
              {
                CCCryptorRelease(cryptorRef);
                v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v42,  v43 - v42));
                uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  *(void *)__p,  *(void *)&__p[8] - *(void *)__p));
                if ([v19 isEqualToData:v20])
                {
                  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v27,  v28 - (_BYTE *)v27));
                }

                else
                {
                  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
                    sub_100399608();
                  }
                  v8 = 0LL;
                }
              }

              if (*(void *)__p)
              {
                *(void *)&__p[8] = *(void *)__p;
                operator delete(*(void **)__p);
              }
            }

            if (v24)
            {
              uint64_t v25 = v24;
              operator delete(v24);
            }
          }

          if (v27)
          {
            uint64_t v28 = v27;
            operator delete(v27);
          }
        }

        if (*(void *)buf)
        {
          *(void *)&buf[8] = *(void *)buf;
          operator delete(*(void **)buf);
        }

        goto LABEL_42;
      }

      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_100399788();
      }
    }

    CCCryptorRelease(cryptorRef);
LABEL_41:
    v8 = 0LL;
LABEL_42:
    if (v39)
    {
      uint64_t v40 = v39;
      operator delete(v39);
    }

    goto LABEL_44;
  }

  id v10 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_100399568((uint64_t)self->_logIdentifier, (int)[v5 length], (uint64_t)&v39);
  }

  v8 = 0LL;
LABEL_44:
  if (v42)
  {
    uint64_t v43 = v42;
    operator delete(v42);
  }

- (id)_deriveSessionKeyFromKeyDerivationKey:(id)a3 sessionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = CCKDFParametersCreateHkdf(&v18, 0, 0, [v7 bytes], objc_msgSend(v7, "length"));
  if (v8 || !v18)
  {
    id v14 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
    {
      logIdentifier = self->_logIdentifier;
      *(_DWORD *)__p = 138478339;
      *(void *)&__p[4] = logIdentifier;
      *(_WORD *)&__p[12] = 1024;
      *(_DWORD *)&__p[14] = v8;
      __int16 v20 = 1024;
      BOOL v21 = v18 != 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "#crypto,[%{private}@][KDF] create parameters failed %d. Parameters need release: %d",  __p,  0x18u);
    }

    if (v18) {
      ((void (*)(void))CCKDFParametersDestroy)();
    }
    CCCryptorStatus v13 = 0LL;
  }

  else
  {
    char v17 = 0;
    sub_10016C2CC(__p, 0x20uLL, &v17);
    uint64_t v9 = v18;
    id v10 = v6;
    id v11 = [v10 bytes];
    id v12 = [v10 length];
    if (CCDeriveKey(v9, 10LL, v11, v12, *(void *)__p, *(void *)&__p[8] - *(void *)__p))
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_100399968();
      }
      CCKDFParametersDestroy(v18);
      CCCryptorStatus v13 = 0LL;
    }

    else
    {
      CCKDFParametersDestroy(v18);
      CCCryptorStatus v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  *(void *)__p,  *(void *)&__p[8] - *(void *)__p));
    }

    if (*(void *)__p)
    {
      *(void *)&__p[8] = *(void *)__p;
      operator delete(*(void **)__p);
    }
  }

  return v13;
}

- (NSData)keyDerivationKey
{
  return (NSData *)objc_getProperty(self, a2, 40LL, 1);
}

- (NSData)sessionIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 48LL, 1);
}

- (void).cxx_destruct
{
}

@end
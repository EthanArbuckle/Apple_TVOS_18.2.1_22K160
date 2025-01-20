@interface CoreFileHandlerV2
- (BOOL)getCorefileLogInfo:(unint64_t *)a3 :(unint64_t *)a4 :(unsigned int *)a5;
- (BOOL)isZeroes:(id)a3;
- (CoreFileHandlerV2)initWithCoreFilePath:(char *)a3 :(BOOL)a4 :(id)a5;
- (const)getCoreDumpNameWithIndex:(unint64_t)a3;
- (id)getCoreDumpEncryptionKey:(unint64_t)a3;
- (id)getCorefileLogEncryptionKey;
- (id)getCorefileZeroRanges;
- (unint64_t)getNumCoreDumps;
- (void)getCoreDumpInfoWithIndex:(unint64_t)a3 :(unint64_t *)a4 :(unint64_t *)a5 :(unsigned int *)a6;
@end

@implementation CoreFileHandlerV2

- (BOOL)isZeroes:(id)a3
{
  id v3 = a3;
  v4 = [v3 bytes];
  if ([v3 length])
  {
    uint64_t v5 = 0LL;
    while (1)
    {
      BOOL v6 = v4[v5] == 0;
      if (v4[v5]) {
        break;
      }
    }
  }

  else
  {
LABEL_5:
    BOOL v6 = 1;
  }

  return v6;
}

- (CoreFileHandlerV2)initWithCoreFilePath:(char *)a3 :(BOOL)a4 :(id)a5
{
  uint64_t v5 = -[CoreFileHandler initWithCoreFilePath::::::]( self,  "initWithCoreFilePath::::::",  a3,  a4,  a5,  0x63614D2073736F42LL,  &v50,  64LL);
  if (!v5) {
    goto LABEL_39;
  }
  BOOL v6 = (os_log_s *)qword_100036538;
  if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v57 = v55;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "opened corefile, header indicates %llu files present",  buf,  0xCu);
  }

  unint64_t v7 = v51;
  int v8 = v52;
  if (__CFADD__(v51, v52) || (unint64_t v9 = v5->super._corefileSize, v51 + v52 > v9))
  {
    uint64_t v10 = qword_100036538;
    if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
    {
      unint64_t corefileSize = v5->super._corefileSize;
      *(_DWORD *)buf = 134218496;
      unint64_t v57 = v7;
      __int16 v58 = 1024;
      *(_DWORD *)v59 = v8;
      *(_WORD *)&v59[4] = 2048;
      *(void *)&v59[6] = corefileSize;
      v37 = "Corefile corrupted. Public key (offset %llu, length %hu) extends past end of file (length %zu).";
      v38 = (os_log_s *)v10;
      uint32_t v39 = 28;
      goto LABEL_36;
    }

    goto LABEL_7;
  }

  unint64_t v13 = v53;
  uint64_t v12 = v54;
  if (__CFADD__(v53, v54) || v53 + v54 > v9)
  {
    uint64_t v36 = qword_100036538;
    if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      unint64_t v57 = v13;
      __int16 v58 = 2048;
      *(void *)v59 = v12;
      *(_WORD *)&v59[8] = 2048;
      *(void *)&v59[10] = v9;
      v37 = "Corefile corrupted. Log (offset %llu, length %llu) extends past end of file (length %zu).";
      v38 = (os_log_s *)v36;
      uint32_t v39 = 32;
      goto LABEL_36;
    }

    goto LABEL_7;
  }

  unint64_t v14 = v55;
  unint64_t v15 = 40 * v55 + 64;
  if (!is_mul_ok(v55, 0x28uLL) || 40 * v55 >= 0xFFFFFFFFFFFFFFC0LL || v15 > v9)
  {
    uint64_t v40 = qword_100036538;
    if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218752;
      unint64_t v57 = 64LL;
      __int16 v58 = 2048;
      *(void *)v59 = v14;
      *(_WORD *)&v59[8] = 2048;
      *(void *)&v59[10] = 40LL;
      __int16 v60 = 2048;
      unint64_t v61 = v9;
      v37 = "Corefile corrupted. Header (size %zu) and %llu file headers (each of size %zu) extend past end of file (length %zu).";
      v38 = (os_log_s *)v40;
      uint32_t v39 = 42;
      goto LABEL_36;
    }

    goto LABEL_7;
  }

  uint64_t v16 = objc_claimAutoreleasedReturnValue( -[CoreFileHandler getCoreDumpContentsWithOffset:AndLength:]( v5,  "getCoreDumpContentsWithOffset:AndLength:",  0LL,  40 * v55 + 64));
  headerData = v5->_headerData;
  v5->_headerData = (NSData *)v16;

  corefileHeader = -[NSData bytes](v5->_headerData, "bytes");
  v5->_corefileHeader = corefileHeader;
  v19 = (os_log_s *)qword_100036538;
  if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v57 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Successfully read %llu bytes for the corefile headers",  buf,  0xCu);
    corefileHeader = v5->_corefileHeader;
  }

  if (!corefileHeader->num_files)
  {
LABEL_22:
    uint64_t pub_key_offset = corefileHeader->pub_key_offset;
    if (pub_key_offset && (unsigned int pub_key_length = corefileHeader->pub_key_length) != 0)
    {
      v28 = (os_log_s *)qword_100036538;
      if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Reading public encryption key from corefile",  buf,  2u);
        v29 = v5->_corefileHeader;
        uint64_t pub_key_offset = v29->pub_key_offset;
        unsigned int pub_key_length = v29->pub_key_length;
      }

      uint64_t v30 = objc_claimAutoreleasedReturnValue( -[CoreFileHandler getCoreDumpContentsWithOffset:AndLength:]( v5,  "getCoreDumpContentsWithOffset:AndLength:",  pub_key_offset,  pub_key_length));
      p_encryptionPublicKey = &v5->_encryptionPublicKey;
      encryptionPublicKey = v5->_encryptionPublicKey;
      v5->_encryptionPublicKey = (NSData *)v30;

      v33 = (os_log_s *)qword_100036538;
      if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_DEFAULT))
      {
        int v34 = v5->_corefileHeader->pub_key_length;
        *(_DWORD *)buf = 67109120;
        LODWORD(v57) = v34;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Successfully read %hu bytes for the public encryption key",  buf,  8u);
      }

      if (!-[CoreFileHandlerV2 isZeroes:](v5, "isZeroes:", *p_encryptionPublicKey))
      {
        uint64_t flags = v5->_corefileHeader->flags;
        if ((flags & 0x100) == 0)
        {
          v49 = (os_log_s *)qword_100036538;
          if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            unint64_t v57 = flags;
            _os_log_error_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_ERROR,  "Unsupported encryption key format in corefile flags: %llu",  buf,  0xCu);
          }

          v11 = 0LL;
          v5->super._zero_on_close = 0;
          goto LABEL_40;
        }

- (id)getCorefileZeroRanges
{
  return &off_100033A00;
}

- (unint64_t)getNumCoreDumps
{
  return self->_corefileHeader->num_files;
}

- (const)getCoreDumpNameWithIndex:(unint64_t)a3
{
  corefileHeader = self->_corefileHeader;
  if (corefileHeader->num_files > a3) {
    return (const char *)(&corefileHeader[1].pub_key_offset + 5 * a3);
  }
  uint64_t v5 = _os_assert_log(0LL, a2);
  result = (const char *)_os_crash(v5);
  __break(1u);
  return result;
}

- (void)getCoreDumpInfoWithIndex:(unint64_t)a3 :(unint64_t *)a4 :(unint64_t *)a5 :(unsigned int *)a6
{
  corefileHeader = self->_corefileHeader;
  if (corefileHeader->num_files <= a3)
  {
    uint64_t v12 = _os_assert_log(0LL, a2);
    _os_crash(v12);
    __break(1u);
    goto LABEL_16;
  }

  if (!a4)
  {
LABEL_16:
    uint64_t v13 = _os_assert_log(0LL, a2);
    _os_crash(v13);
    __break(1u);
    goto LABEL_17;
  }

  if (!a5)
  {
LABEL_17:
    uint64_t v14 = _os_assert_log(0LL, a2);
    _os_crash(v14);
    __break(1u);
LABEL_18:
    uint64_t v15 = _os_assert_log(0LL, a2);
    _os_crash(v15);
    __break(1u);
  }

  if (!a6) {
    goto LABEL_18;
  }
  unint64_t v7 = &corefileHeader->signature + 5 * a3;
  uint64_t v8 = v7[8];
  *a4 = v7[9];
  *a5 = v7[10];
  *a6 = 0;
  if ((v8 & 0x100) != 0)
  {
    unsigned int v9 = 5;
    unsigned int v10 = 1;
    goto LABEL_11;
  }

  if ((v8 & 0x200) != 0)
  {
    unsigned int v9 = 6;
    unsigned int v10 = 2;
LABEL_11:
    *a6 = v10;
    if ((v8 & 1) == 0) {
      return;
    }
    goto LABEL_12;
  }

  unsigned int v9 = 4;
  if ((v8 & 1) == 0) {
    return;
  }
LABEL_12:
  uint64_t flags = corefileHeader->flags;
  if ((flags & 0x100) != 0)
  {
    *a6 = v9;
  }

  else
  {
    uint64_t v16 = (os_log_s *)qword_100036538;
    if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v25 = flags;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Unsupported encryption key format in corefile flags: %llu",  buf,  0xCu);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s must be implemented",  "Encryption key format"));
    id v18 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  v17,  0LL));

    objc_exception_throw(v18);
    -[CoreFileHandlerV2 getCorefileLogInfo:::](v19, v20, v21, v22, v23);
  }

- (BOOL)getCorefileLogInfo:(unint64_t *)a3 :(unint64_t *)a4 :(unsigned int *)a5
{
  if (!a3)
  {
    uint64_t v9 = _os_assert_log(0LL, a2);
    _os_crash(v9);
    __break(1u);
LABEL_9:
    uint64_t v10 = _os_assert_log(0LL, a2);
    _os_crash(v10);
    __break(1u);
  }

  if (!a4) {
    goto LABEL_9;
  }
  corefileHeader = self->_corefileHeader;
  *a4 = corefileHeader->log_length;
  uint64_t log_length = corefileHeader->log_length;
  if (!log_length) {
    return log_length != 0;
  }
  *a3 = corefileHeader->log_offset;
  *a5 = 0;
  uint64_t flags = corefileHeader->flags;
  if ((flags & 1) == 0) {
    return log_length != 0;
  }
  if ((flags & 0x100) != 0)
  {
    *a5 = 4;
    return log_length != 0;
  }

  v11 = (os_log_s *)qword_100036538;
  if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v18 = flags;
    _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Unsupported encryption key format in corefile flags: %llu",  buf,  0xCu);
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s must be implemented",  "Encryption key format"));
  id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  v12,  0LL));

  objc_exception_throw(v13);
  return -[CoreFileHandlerV2 getCoreDumpEncryptionKey:](v14, v15, v16);
}

- (id)getCoreDumpEncryptionKey:(unint64_t)a3
{
  if (self->_corefileHeader->num_files > a3) {
    return self->_encryptionPublicKey;
  }
  uint64_t v4 = _os_assert_log(0LL, a2);
  id result = (id)_os_crash(v4);
  __break(1u);
  return result;
}

- (id)getCorefileLogEncryptionKey
{
  return self->_encryptionPublicKey;
}

- (void).cxx_destruct
{
}

@end
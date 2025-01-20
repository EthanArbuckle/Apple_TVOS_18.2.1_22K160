@interface DigestVerifier
- (BOOL)_validateAndResetDigestError:(id *)a3;
- (BOOL)verifyBuffer:(const char *)a3 length:(unint64_t)a4 error:(id *)a5;
- (BOOL)verifyData:(id)a3 error:(id *)a4;
- (DigestVerifier)initWithChunkedDigest:(id)a3 resumptionOffset:(unint64_t)a4;
- (DigestVerifier)initWithDigest:(id)a3 type:(int64_t)a4;
- (unint64_t)bytesProcessed;
- (unint64_t)bytesValidated;
- (void)_hashBuffer:(const char *)a3 length:(unint64_t)a4;
- (void)_hashData:(id)a3;
@end

@implementation DigestVerifier

- (DigestVerifier)initWithChunkedDigest:(id)a3 resumptionOffset:(unint64_t)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___DigestVerifier;
  v7 = -[DigestVerifier init](&v14, "init");
  if (v7)
  {
    v8 = (ChunkedDigest *)[v6 copy];
    digest = v7->_digest;
    v7->_digest = v8;

    v7->_bytesProcessed = a4;
    v7->_bytesValidated = a4;
    unsigned int v10 = -[ChunkedDigest chunkSize](v7->_digest, "chunkSize");
    if (v10)
    {
      v7->_index = a4 / v10;
      if (a4 % v10)
      {
LABEL_7:
        v7->_valid = 1;
        goto LABEL_8;
      }
    }

    else
    {
      v7->_index = 0LL;
    }

    v11 = -[HashDigest initWithDigestType:]( objc_alloc(&OBJC_CLASS___HashDigest),  "initWithDigestType:",  -[ChunkedDigest chunkType](v7->_digest, "chunkType"));
    hashDigest = v7->_hashDigest;
    v7->_hashDigest = v11;

    goto LABEL_7;
  }

- (DigestVerifier)initWithDigest:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  v7 = objc_alloc_init(&OBJC_CLASS___ChunkedDigest);
  -[ChunkedDigest setChunkType:](v7, "setChunkType:", a4);
  -[ChunkedDigest setChunkSize:](v7, "setChunkSize:", 0LL);
  id v11 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));

  -[ChunkedDigest setChunkDigests:](v7, "setChunkDigests:", v8);
  v9 = -[DigestVerifier initWithChunkedDigest:resumptionOffset:]( self,  "initWithChunkedDigest:resumptionOffset:",  v7,  0LL);

  return v9;
}

- (BOOL)verifyBuffer:(const char *)a3 length:(unint64_t)a4 error:(id *)a5
{
  if (self->_valid)
  {
    if (-[ChunkedDigest chunkSize](self->_digest, "chunkSize")
      && (unsigned int v9 = -[ChunkedDigest chunkSize](self->_digest, "chunkSize"),
          unint64_t bytesProcessed = self->_bytesProcessed,
          unsigned int v11 = -[ChunkedDigest chunkSize](self->_digest, "chunkSize"),
          int v12 = bytesProcessed / v11 * v11 - bytesProcessed,
          unint64_t v13 = v9 + v12,
          a4 >= v13))
    {
      -[DigestVerifier _hashBuffer:length:](self, "_hashBuffer:length:", a3, v9 + v12);
      BOOL v17 = -[DigestVerifier _validateAndResetDigestError:](self, "_validateAndResetDigestError:", a5);
      if (!v17) {
        return v17;
      }
      v15 = &a3[v13];
      objc_super v14 = self;
      unint64_t v16 = a4 - v13;
    }

    else
    {
      objc_super v14 = self;
      v15 = a3;
      unint64_t v16 = a4;
    }

    -[DigestVerifier _hashBuffer:length:](v14, "_hashBuffer:length:", v15, v16);
    LOBYTE(v17) = self->_valid;
  }

  else
  {
    LOBYTE(v17) = 0;
  }

  return v17;
}

- (BOOL)verifyData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!self->_valid) {
    goto LABEL_8;
  }
  if (-[ChunkedDigest chunkSize](self->_digest, "chunkSize"))
  {
    unsigned int v7 = -[ChunkedDigest chunkSize](self->_digest, "chunkSize");
    unint64_t bytesProcessed = self->_bytesProcessed;
    unsigned int v9 = -[ChunkedDigest chunkSize](self->_digest, "chunkSize");
    unint64_t v10 = v7 + (bytesProcessed / v9) * v9 - (_DWORD)bytesProcessed;
    if ((unint64_t)[v6 length] >= v10)
    {
      int v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subdataWithRange:", 0, v10));
      -[DigestVerifier _hashData:](self, "_hashData:", v12);

      if (-[DigestVerifier _validateAndResetDigestError:](self, "_validateAndResetDigestError:", a4))
      {
        unsigned int v13 = -[ChunkedDigest chunkSize](self->_digest, "chunkSize");
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472LL;
        v15[2] = sub_100060468;
        v15[3] = &unk_1002E9898;
        v15[4] = self;
        v15[5] = a4;
        objc_msgSend(v6, "lib_enumerateSubdataWithOffset:length:usingBlock:", v10, v13, v15);
        goto LABEL_5;
      }

- (void)_hashBuffer:(const char *)a3 length:(unint64_t)a4
{
  self->_bytesProcessed += a4;
  -[HashDigest updateWithBuffer:length:](self->_hashDigest, "updateWithBuffer:length:", a3);
}

- (void)_hashData:(id)a3
{
  id v4 = a3;
  self->_bytesProcessed += (unint64_t)[v4 length];
  -[HashDigest updateWithData:](self->_hashDigest, "updateWithData:", v4);
}

- (BOOL)_validateAndResetDigestError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HashDigest finalAndCompute](self->_hashDigest, "finalAndCompute"));
  unint64_t index = self->_index;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[ChunkedDigest chunkDigests](self->_digest, "chunkDigests"));
  id v8 = [v7 count];

  if (index >= (unint64_t)v8)
  {
    id v16 = (id)self->_index;
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue(-[ChunkedDigest chunkDigests](self->_digest, "chunkDigests"));
    if (v16 == [v17 count])
    {
      unint64_t bytesProcessed = self->_bytesProcessed;
      unint64_t bytesValidated = self->_bytesValidated;

      if (bytesValidated == bytesProcessed) {
        goto LABEL_22;
      }
      if (!a3) {
        goto LABEL_13;
      }
    }

    else
    {

      if (!a3) {
        goto LABEL_13;
      }
    }

    uint64_t v20 = ASDErrorWithDescription( ASDErrorDomain,  710LL,  @"More data was received than there are hashes to verify");
    *a3 = (id)objc_claimAutoreleasedReturnValue(v20);
LABEL_13:
    self->_BOOL valid = 0;
    goto LABEL_22;
  }

  if (!v5)
  {
    if (qword_10032EB18 != -1) {
      dispatch_once(&qword_10032EB18, &stru_1002E98B8);
    }
    v21 = (os_log_s *)off_100328808;
    if (os_log_type_enabled((os_log_t)off_100328808, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v22 = self->_index;
      *(_DWORD *)buf = 134217984;
      unint64_t v32 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Skipped chunk digest at index %lu",  buf,  0xCu);
    }

    self->_BOOL valid = 1;
    goto LABEL_21;
  }

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[ChunkedDigest chunkDigests](self->_digest, "chunkDigests"));
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:self->_index]);
  self->_BOOL valid = [v5 isEqualToString:v10];

  if (self->_valid)
  {
LABEL_21:
    self->_unint64_t bytesValidated = self->_bytesProcessed;
    ++self->_index;
    goto LABEL_22;
  }

  if (qword_10032EB18 != -1) {
    dispatch_once(&qword_10032EB18, &stru_1002E98B8);
  }
  unsigned int v11 = off_100328808;
  if (!os_log_type_enabled((os_log_t)off_100328808, OS_LOG_TYPE_ERROR))
  {
    if (!a3) {
      goto LABEL_22;
    }
    goto LABEL_8;
  }

  digest = self->_digest;
  v28 = v11;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[ChunkedDigest chunkDigests](digest, "chunkDigests"));
  v30 = (void *)objc_claimAutoreleasedReturnValue([v29 objectAtIndexedSubscript:self->_index]);
  *(_DWORD *)buf = 138412546;
  unint64_t v32 = (unint64_t)v5;
  __int16 v33 = 2112;
  v34 = v30;
  _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Invalid hash '%@' expected '%@'", buf, 0x16u);

  if (a3)
  {
LABEL_8:
    int v12 = (void *)objc_claimAutoreleasedReturnValue(-[ChunkedDigest chunkDigests](self->_digest, "chunkDigests"));
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:self->_index]);
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid hash '%@' expected '%@'",  v5,  v13));

    uint64_t v15 = ASDErrorWithDescription(ASDErrorDomain, 710LL, v14);
    *a3 = (id)objc_claimAutoreleasedReturnValue(v15);
  }

- (unint64_t)bytesProcessed
{
  return self->_bytesProcessed;
}

- (unint64_t)bytesValidated
{
  return self->_bytesValidated;
}

- (void).cxx_destruct
{
}

@end
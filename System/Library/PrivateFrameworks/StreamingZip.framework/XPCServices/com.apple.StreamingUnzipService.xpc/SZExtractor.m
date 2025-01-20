@interface SZExtractor
+ (BOOL)supportsSecureCoding;
+ (int)servicePIDWithError:(id *)a3;
- (BOOL)_isValidObject;
- (BOOL)_synchronouslyPrepareForExtractionAtOffset:(unint64_t *)a3;
- (BOOL)doesConsumeExtractedData;
- (BOOL)hasHadPostSetupMethodsCalled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocalExtractor;
- (BOOL)needsPreparation;
- (BOOL)privileged;
- (NSDictionary)options;
- (NSError)error;
- (NSString)description;
- (NSString)extractionPath;
- (NSXPCConnection)unzipServiceConnection;
- (OS_dispatch_queue)serialQueue;
- (SZExtractor)init;
- (SZExtractor)initWithCoder:(id)a3;
- (SZExtractor)initWithOptions:(id)a3;
- (SZExtractor)initWithPath:(id)a3 md5Hashes:(id)a4 hashedChunkSize:(unint64_t)a5 resumptionOffset:(unint64_t *)a6;
- (SZExtractor)initWithPath:(id)a3 options:(id)a4;
- (SZExtractor)initWithPath:(id)a3 options:(id)a4 resumptionOffset:(unint64_t *)a5;
- (SZExtractor)initWithPath:(id)a3 resumptionOffset:(unint64_t *)a4;
- (SZExtractorDelegate)delegate;
- (SZExtractorDelegate)extractorDelegate;
- (SZExtractorInternalDelegate)internalExtractorDelegate;
- (StreamingUnzipper)inProcessUnzipper;
- (id)_serviceConnectionWithError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initForLocalExtractionWithPath:(id)a3 options:(id)a4 resumptionOffset:(unint64_t *)a5;
- (id)initForRemoteExtractionWithPath:(id)a3 options:(id)a4 resumptionOffset:(unint64_t *)a5;
- (unint64_t)hash;
- (unint64_t)lastResumptionOffset;
- (void)_invalidateObject;
- (void)_prepareForExtractionSynchronously:(BOOL)a3 withCompletionBlock:(id)a4;
- (void)_prepareForLocalExtraction:(id)a3;
- (void)_prepareForRemoteExtractionSynchronously:(BOOL)a3 withCompletionBlock:(id)a4;
- (void)_setUpWithPath:(id)a3 options:(id)a4;
- (void)_suspendStreamWithCompletionBlockSynchronously:(BOOL)a3 completion:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)finishStreamWithCompletionBlock:(id)a3;
- (void)prepareForExtraction:(id)a3;
- (void)prepareForExtractionToPath:(id)a3 completionBlock:(id)a4;
- (void)setActiveExtractorDelegateMethods:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setError:(id)a3;
- (void)setExtractionPath:(id)a3;
- (void)setExtractorDelegate:(id)a3;
- (void)setHasHadPostSetupMethodsCalled:(BOOL)a3;
- (void)setLastResumptionOffset:(unint64_t)a3;
- (void)setNeedsPreparation:(BOOL)a3;
- (void)setPrivileged:(BOOL)a3;
- (void)supplyBytes:(id)a3 withCompletionBlock:(id)a4;
- (void)suspendStreamWithCompletionBlock:(id)a3;
- (void)terminateStreamWithError:(id)a3 completionBlock:(id)a4;
@end

@implementation SZExtractor

- (SZExtractor)init
{
  uint64_t v8 = 0LL;
  memset(v7, 0, sizeof(v7));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    uint64_t v2 = 3LL;
  }
  else {
    uint64_t v2 = 2LL;
  }
  int v5 = 136315138;
  v6 = "-[SZExtractor init]";
  uint64_t v3 = _os_log_send_and_compose_impl( v2,  &v8,  v7,  80LL,  &_mh_execute_header,  &_os_log_default,  16LL,  "%s not available.",  (const char *)&v5);
  result = (SZExtractor *)_os_crash_msg(v8, v3);
  __break(1u);
  return result;
}

- (SZExtractor)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SZExtractor;
  int v5 = -[SZExtractor init](&v18, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 decodePropertyListForKey:@"options"]);
    options = v5->_options;
    v5->_options = (NSDictionary *)v6;

    id v8 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"extractionPath"];
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    extractionPath = v5->_extractionPath;
    v5->_extractionPath = (NSString *)v9;

    v5->_isLocalExtractor = [v4 decodeBoolForKey:@"isLocalExtractor"];
    v5->_privileged = [v4 decodeBoolForKey:@"privileged"];
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSXPCCoder);
    if ((objc_opt_isKindOfClass(v4, v11) & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v4 connection]);
      v5->_isLocalExtractor = 0;
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 valueForEntitlement:@"com.apple.private.SZExtractor.privileged"]);
      unsigned __int8 v14 = [v13 BOOLValue];

      if ((v14 & 1) == 0) {
        v5->_privileged = 0;
      }
    }

    v15 = sub_100004680();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@: deserialized", buf, 0xCu);
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (!-[SZExtractor needsPreparation](self, "needsPreparation")
    && -[SZExtractor _isValidObject](self, "_isValidObject"))
  {
    int v5 = sub_100004680();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@: suspending stream in preparation for serializing ourselves",  buf,  0xCu);
    }

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100019F8C;
    v10[3] = &unk_100028730;
    v10[4] = self;
    -[SZExtractor _suspendStreamWithCompletionBlockSynchronously:completion:]( self,  "_suspendStreamWithCompletionBlockSynchronously:completion:",  1LL,  v10);
  }

  [v4 encodeObject:self->_options forKey:@"options"];
  extractionPath = self->_extractionPath;
  if (extractionPath) {
    [v4 encodeObject:extractionPath forKey:@"extractionPath"];
  }
  [v4 encodeBool:self->_isLocalExtractor forKey:@"isLocalExtractor"];
  [v4 encodeBool:self->_privileged forKey:@"privileged"];
  id v8 = sub_100004680();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: serialized", buf, 0xCu);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 options]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SZExtractor options](self, "options"));
    unsigned int v9 = [v7 isEqual:v8];

    if (!v9) {
      goto LABEL_13;
    }
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v6 extractionPath]);
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SZExtractor extractionPath](self, "extractionPath"));

      if (!v12) {
        goto LABEL_13;
      }
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue([v6 extractionPath]);
    if (v13)
    {
    }

    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[SZExtractor extractionPath](self, "extractionPath"));

      if (v22) {
        goto LABEL_13;
      }
    }

    uint64_t v14 = objc_claimAutoreleasedReturnValue([v6 extractionPath]);
    if (v14)
    {
      v15 = (void *)v14;
      uint64_t v16 = objc_claimAutoreleasedReturnValue(-[SZExtractor extractionPath](self, "extractionPath"));
      if (v16)
      {
        v17 = (void *)v16;
        objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v6 extractionPath]);
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[SZExtractor extractionPath](self, "extractionPath"));
        unsigned int v20 = [v18 isEqual:v19];

        if (v20) {
          goto LABEL_15;
        }
LABEL_13:
        LOBYTE(v21) = 0;
LABEL_16:

        goto LABEL_17;
      }
    }

- (unint64_t)hash
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SZExtractor extractionPath](self, "extractionPath"));

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SZExtractor options](self, "options"));
  unint64_t v5 = (unint64_t)[v4 hash];
  if (v3)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SZExtractor extractionPath](self, "extractionPath"));
    v5 ^= (unint64_t)[v6 hash];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class(self) allocWithZone:a3];
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SZExtractor extractionPath](self, "extractionPath"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SZExtractor options](self, "options"));
  v7 = [v4 initWithPath:v5 options:v6];

  if (self->_isLocalExtractor) {
    v7[9] = 1;
  }
  if (self->_privileged) {
    v7[8] = 1;
  }
  return v7;
}

- (void)_setUpWithPath:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"SZExtractorOptionsHashesArray"]);
  if (v8)
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    {
      id v10 = v8;
      if ((unint64_t)[v10 count] < 2
        || (uint64_t v11 = objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"SZExtractorOptionsHashedChunkSize"])) != 0
        && (v12 = (void *)v11,
            v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"SZExtractorOptionsHashedChunkSize"]),
            uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSNumber),
            char isKindOfClass = objc_opt_isKindOfClass(v13, v14),
            v13,
            v12,
            (isKindOfClass & 1) != 0))
      {

        goto LABEL_7;
      }

      NSExceptionName v26 = NSInvalidArgumentException;
      v27 = @"SZExtractor requires SZExtractorOptionsHashedChunkSize if passing multiple hashes in SZExtractorOptionsHashesArray";
    }

    else
    {
      v22 = (objc_class *)objc_opt_class(v8);
      unsigned int v23 = NSStringFromClass(v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      uint64_t v25 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SZExtractorOptionsHashesArray must be an array, but is a %@",  v24));

      NSExceptionName v26 = NSInvalidArgumentException;
      v27 = (const __CFString *)v25;
    }

    id v28 = objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException, "exceptionWithName:reason:userInfo:", v26, v27, 0LL));
    objc_exception_throw(v28);
    -[SZExtractor initWithPath:options:](v29, v30, v31, v32);
    return;
  }

- (SZExtractor)initWithPath:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SZExtractor;
  id v8 = -[SZExtractor init](&v11, "init");
  uint64_t v9 = v8;
  if (v8) {
    -[SZExtractor _setUpWithPath:options:](v8, "_setUpWithPath:options:", v6, v7);
  }

  return v9;
}

- (SZExtractor)initWithOptions:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SZExtractor;
  unint64_t v5 = -[SZExtractor init](&v8, "init");
  id v6 = v5;
  if (v5) {
    -[SZExtractor _setUpWithPath:options:](v5, "_setUpWithPath:options:", 0LL, v4);
  }

  return v6;
}

- (SZExtractor)initWithPath:(id)a3 resumptionOffset:(unint64_t *)a4
{
  return -[SZExtractor initWithPath:options:resumptionOffset:]( self,  "initWithPath:options:resumptionOffset:",  a3,  0LL,  a4);
}

- (SZExtractor)initWithPath:(id)a3 options:(id)a4 resumptionOffset:(unint64_t *)a5
{
  id v6 = -[SZExtractor initWithPath:options:](self, "initWithPath:options:", a3, a4);
  id v7 = v6;
  if (v6
    && !-[SZExtractor _synchronouslyPrepareForExtractionAtOffset:]( v6,  "_synchronouslyPrepareForExtractionAtOffset:",  a5))
  {
    objc_super v8 = 0LL;
  }

  else
  {
    objc_super v8 = v7;
  }

  return v8;
}

- (SZExtractor)initWithPath:(id)a3 md5Hashes:(id)a4 hashedChunkSize:(unint64_t)a5 resumptionOffset:(unint64_t *)a6
{
  id v10 = a4;
  id v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a5));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  @"SZExtractorHashTypeMD5",  @"SZExtractorOptionsHashType",  v10,  @"SZExtractorOptionsHashesArray",  v12,  @"SZExtractorOptionsHashedChunkSize",  0LL));

  uint64_t v14 = -[SZExtractor initWithPath:options:resumptionOffset:]( self,  "initWithPath:options:resumptionOffset:",  v11,  v13,  a6);
  return v14;
}

- (id)initForRemoteExtractionWithPath:(id)a3 options:(id)a4 resumptionOffset:(unint64_t *)a5
{
  id v6 = -[SZExtractor initWithPath:options:](self, "initWithPath:options:", a3, a4);
  id v7 = v6;
  if (v6
    && (v6->_isLocalExtractor = 0,
        !-[SZExtractor _synchronouslyPrepareForExtractionAtOffset:]( v6,  "_synchronouslyPrepareForExtractionAtOffset:",  a5)))
  {
    objc_super v8 = 0LL;
  }

  else
  {
    objc_super v8 = v7;
  }

  return v8;
}

- (id)initForLocalExtractionWithPath:(id)a3 options:(id)a4 resumptionOffset:(unint64_t *)a5
{
  id v6 = -[SZExtractor initWithPath:options:](self, "initWithPath:options:", a3, a4);
  id v7 = v6;
  if (v6
    && (v6->_isLocalExtractor = 1,
        !-[SZExtractor _synchronouslyPrepareForExtractionAtOffset:]( v6,  "_synchronouslyPrepareForExtractionAtOffset:",  a5)))
  {
    objc_super v8 = 0LL;
  }

  else
  {
    objc_super v8 = v7;
  }

  return v8;
}

- (BOOL)_synchronouslyPrepareForExtractionAtOffset:(unint64_t *)a3
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 1;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100019EA4;
  v5[3] = &unk_100028758;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a3;
  -[SZExtractor _prepareForExtractionSynchronously:withCompletionBlock:]( self,  "_prepareForExtractionSynchronously:withCompletionBlock:",  1LL,  v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)_serviceConnectionWithError:(id *)a3
{
  if (-[SZExtractor privileged](self, "privileged")) {
    id v4 = @"com.apple.StreamingUnzipService.privileged";
  }
  else {
    id v4 = @"com.apple.StreamingUnzipService";
  }
  unint64_t v5 = -[NSXPCConnection initWithServiceName:](objc_alloc(&OBJC_CLASS___NSXPCConnection), "initWithServiceName:", v4);
  if (v5)
  {
    id v6 = sub_100019E30();
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[NSXPCConnection setRemoteObjectInterface:](v5, "setRemoteObjectInterface:", v7);

    id v8 = 0LL;
  }

  else
  {
    char v9 = sub_100004680();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Failed to create NSXPCConnection",  (uint8_t *)&v14,  2u);
    }

    id v12 = sub_100007A7C( (uint64_t)"-[SZExtractor _serviceConnectionWithError:]",  447LL,  @"SZExtractorErrorDomain",  1LL,  0LL,  0LL,  @"Failed to create NSXPCConnection",  v11,  v14);
    id v8 = (id)objc_claimAutoreleasedReturnValue(v12);
    if (a3)
    {
      id v8 = v8;
      *a3 = v8;
    }
  }

  return v5;
}

- (void)_prepareForRemoteExtractionSynchronously:(BOOL)a3 withCompletionBlock:(id)a4
{
  id v6 = a4;
  dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
  char v9 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.StreamingZip.SZExtractorBufferSubmissionQueue", v8);
  serialQueue = self->_serialQueue;
  self->_serialQueue = v9;

  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SZExtractor serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001912C;
  block[3] = &unk_1000287F8;
  block[4] = self;
  id v14 = v6;
  BOOL v15 = a3;
  id v12 = v6;
  dispatch_sync(v11, block);
}

- (void)_prepareForLocalExtraction:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
  dispatch_queue_attr_t v7 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.StreamingZip.SZExtractor_in_process", v6);
  serialQueue = self->_serialQueue;
  self->_serialQueue = v7;

  char v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SZExtractor serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100009348;
  block[3] = &unk_100028848;
  block[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_sync(v9, block);
}

- (void)_prepareForExtractionSynchronously:(BOOL)a3 withCompletionBlock:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, void, uint64_t))a4;
  dispatch_queue_attr_t v7 = sub_100004680();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: preparing", buf, 0xCu);
  }

  char v9 = (void *)objc_claimAutoreleasedReturnValue(-[SZExtractor extractionPath](self, "extractionPath"));
  if (!v9)
  {
    id v14 = sub_100004680();
    BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "extractionPath was nil. Did you mean to call -prepareForExtractionToPath:completionBlock: instead?",  buf,  2u);
    }

    id v13 = sub_100007A7C( (uint64_t)"-[SZExtractor _prepareForExtractionSynchronously:withCompletionBlock:]",  622LL,  @"SZExtractorErrorDomain",  3LL,  0LL,  0LL,  @"extractionPath was nil. Did you mean to call -prepareForExtractionToPath:completionBlock: instead?",  v16,  v25);
    goto LABEL_11;
  }

  if (-[SZExtractor hasHadPostSetupMethodsCalled](self, "hasHadPostSetupMethodsCalled"))
  {
    id v10 = sub_100004680();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v27 = (SZExtractor *)"-[SZExtractor _prepareForExtractionSynchronously:withCompletionBlock:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Calling %s after any calls to other non-init methods on this instance is an error.",  buf,  0xCu);
    }

    id v13 = sub_100007A7C( (uint64_t)"-[SZExtractor _prepareForExtractionSynchronously:withCompletionBlock:]",  628LL,  @"SZExtractorErrorDomain",  3LL,  0LL,  0LL,  @"Calling %s after any calls to other non-init methods on this instance is an error.",  v12,  (uint64_t)"-[SZExtractor _prepareForExtractionSynchronously:withCompletionBlock:]");
LABEL_11:
    uint64_t v17 = objc_claimAutoreleasedReturnValue(v13);
LABEL_12:
    objc_super v18 = (void *)v17;
    v6[2](v6, 0LL, v17);

    goto LABEL_13;
  }

  if (-[SZExtractor needsPreparation](self, "needsPreparation"))
  {
    if (-[SZExtractor isLocalExtractor](self, "isLocalExtractor")) {
      -[SZExtractor _prepareForLocalExtraction:](self, "_prepareForLocalExtraction:", v6);
    }
    else {
      -[SZExtractor _prepareForRemoteExtractionSynchronously:withCompletionBlock:]( self,  "_prepareForRemoteExtractionSynchronously:withCompletionBlock:",  v4,  v6);
    }
  }

  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SZExtractor error](self, "error"));

    unsigned int v20 = sub_100004680();
    unsigned int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v19)
    {
      if (v22)
      {
        unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue(-[SZExtractor error](self, "error"));
        *(_DWORD *)buf = 138412546;
        v27 = self;
        __int16 v28 = 2112;
        unint64_t v29 = (unint64_t)v23;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%@: prepare called on extractor that had already returned error %@",  buf,  0x16u);
      }

      uint64_t v17 = objc_claimAutoreleasedReturnValue(-[SZExtractor error](self, "error"));
      goto LABEL_12;
    }

    if (v22)
    {
      unint64_t v24 = -[SZExtractor lastResumptionOffset](self, "lastResumptionOffset");
      *(_DWORD *)buf = 138412546;
      v27 = self;
      __int16 v28 = 2048;
      unint64_t v29 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%@: prepare called on object that was already prepared; returning resumption offset %llu",
        buf,
        0x16u);
    }

    v6[2](v6, -[SZExtractor lastResumptionOffset](self, "lastResumptionOffset"), 0LL);
  }

- (void)prepareForExtraction:(id)a3
{
}

- (void)prepareForExtractionToPath:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100004680();
  char v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    uint64_t v11 = self;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@: preparing for extraction to path %@",  (uint8_t *)&v10,  0x16u);
  }

  -[SZExtractor setExtractionPath:](self, "setExtractionPath:", v6);
  -[SZExtractor prepareForExtraction:](self, "prepareForExtraction:", v7);
}

- (void)_invalidateObject
{
  if (-[SZExtractor _isValidObject](self, "_isValidObject"))
  {
    char v3 = sub_100004680();
    BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      char v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@: invalidating", (uint8_t *)&v8, 0xCu);
    }

    dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SZExtractor unzipServiceConnection](self, "unzipServiceConnection"));
    [v5 invalidate];

    unzipServiceConnection = self->_unzipServiceConnection;
    self->_unzipServiceConnection = 0LL;

    inProcessUnzipper = self->_inProcessUnzipper;
    self->_inProcessUnzipper = 0LL;
  }

- (BOOL)_isValidObject
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue(-[SZExtractor unzipServiceConnection](self, "unzipServiceConnection"));
  if (v3)
  {
    BOOL v4 = 1;
  }

  else
  {
    dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SZExtractor inProcessUnzipper](self, "inProcessUnzipper"));
    BOOL v4 = v5 != 0LL;
  }

  return v4;
}

- (BOOL)needsPreparation
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[SZExtractor serialQueue](self, "serialQueue"));
  BOOL v3 = v2 == 0LL;

  return v3;
}

- (void)supplyBytes:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 length];
  char v9 = sub_100004700();
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v8;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "SUPPLY_BYTES",  "%@: Supply bytes with length %lu began",  buf,  0x16u);
  }

  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472LL;
  v56[2] = sub_100007FBC;
  v56[3] = &unk_100028870;
  id v58 = v8;
  id v11 = v7;
  id v57 = v11;
  __int16 v12 = objc_retainBlock(v56);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SZExtractor error](self, "error"));

  if (v13)
  {
    id v14 = sub_100004680();
    BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      unint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[SZExtractor error](self, "error"));
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v29;
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%@: supply called on extractor that had already returned error %@",  buf,  0x16u);
    }

    id v16 = (id)objc_claimAutoreleasedReturnValue(-[SZExtractor error](self, "error"));
    ((void (*)(void *, id, uint64_t))v12[2])(v12, v16, 1LL);
  }

  else if (-[SZExtractor needsPreparation](self, "needsPreparation"))
  {
    uint64_t v17 = sub_100004680();
    objc_super v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SZExtractor supplyBytes:withCompletionBlock:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = self;
      _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%s called before -[SZExtractor prepareForExtraction:] on %@",  buf,  0x16u);
    }

    id v20 = sub_100007A7C( (uint64_t)"-[SZExtractor supplyBytes:withCompletionBlock:]",  704LL,  @"SZExtractorErrorDomain",  3LL,  0LL,  0LL,  @"%s called before -[SZExtractor prepareForExtraction:] on %@",  v19,  (uint64_t)"-[SZExtractor supplyBytes:withCompletionBlock:]");
    id v16 = (id)objc_claimAutoreleasedReturnValue(v20);
    ((void (*)(void *, id, uint64_t))v12[2])(v12, v16, 1LL);
  }

  else if (-[SZExtractor _isValidObject](self, "_isValidObject"))
  {
    -[SZExtractor setHasHadPostSetupMethodsCalled:](self, "setHasHadPostSetupMethodsCalled:", 1LL);
    id v16 = [v6 copy];
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472LL;
    v54[2] = sub_1000080B8;
    v54[3] = &unk_100028898;
    v54[4] = self;
    v55 = v12;
    unsigned int v21 = objc_retainBlock(v54);
    BOOL v22 = (void *)objc_claimAutoreleasedReturnValue(-[SZExtractor inProcessUnzipper](self, "inProcessUnzipper"));

    if (v22)
    {
      unsigned int v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SZExtractor serialQueue](self, "serialQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100008230;
      block[3] = &unk_1000288C0;
      block[4] = self;
      id v52 = v16;
      id v53 = v21;
      unint64_t v24 = v21;
      dispatch_async(v23, block);
    }

    else
    {
      dispatch_group_t v30 = dispatch_group_create();
      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000LL;
      v60 = sub_100008270;
      v61 = sub_100008280;
      id v62 = 0LL;
      v49[0] = 0LL;
      v49[1] = v49;
      v49[2] = 0x2020000000LL;
      char v50 = 0;
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472LL;
      v45[2] = sub_100008288;
      v45[3] = &unk_1000288E8;
      v47 = buf;
      v48 = v49;
      id v31 = v30;
      v46 = v31;
      id v32 = objc_retainBlock(v45);
      v33 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SZExtractor serialQueue](self, "serialQueue"));
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472LL;
      v37[2] = sub_10000832C;
      v37[3] = &unk_1000289D8;
      id v38 = v16;
      v39 = v31;
      v40 = self;
      id v41 = v32;
      id v42 = v21;
      v43 = buf;
      v44 = v49;
      v34 = v21;
      __int16 v35 = v32;
      id v36 = v31;
      dispatch_async(v33, v37);

      _Block_object_dispose(v49, 8);
      _Block_object_dispose(buf, 8);
    }
  }

  else
  {
    uint64_t v25 = sub_100004680();
    NSExceptionName v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SZExtractor supplyBytes:withCompletionBlock:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = self;
      _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "%s called on an invalidated object: %@",  buf,  0x16u);
    }

    id v28 = sub_100007A7C( (uint64_t)"-[SZExtractor supplyBytes:withCompletionBlock:]",  710LL,  @"SZExtractorErrorDomain",  3LL,  0LL,  0LL,  @"%s called on an invalidated object: %@",  v27,  (uint64_t)"-[SZExtractor supplyBytes:withCompletionBlock:]");
    id v16 = (id)objc_claimAutoreleasedReturnValue(v28);
    ((void (*)(void *, id, uint64_t))v12[2])(v12, v16, 1LL);
  }
}

- (void)_suspendStreamWithCompletionBlockSynchronously:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, void, uint64_t))a4;
  id v7 = sub_100004680();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v38 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: suspending stream", buf, 0xCu);
  }

  char v9 = (void *)objc_claimAutoreleasedReturnValue(-[SZExtractor error](self, "error"));
  if (v9)
  {
    int v10 = sub_100004680();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = (SZExtractor *)objc_claimAutoreleasedReturnValue(-[SZExtractor error](self, "error"));
      *(_DWORD *)buf = 138412546;
      id v38 = self;
      __int16 v39 = 2112;
      v40 = v25;
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%@: suspend called on extractor that had already returned error %@",  buf,  0x16u);
    }

    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[SZExtractor error](self, "error"));
    goto LABEL_18;
  }

  if (-[SZExtractor needsPreparation](self, "needsPreparation"))
  {
    id v13 = sub_100004680();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v38 = (SZExtractor *)"-[SZExtractor _suspendStreamWithCompletionBlockSynchronously:completion:]";
      __int16 v39 = 2112;
      v40 = self;
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s called before -[SZExtractor prepareForExtraction:] on %@",  buf,  0x16u);
    }

    id v16 = sub_100007A7C( (uint64_t)"-[SZExtractor _suspendStreamWithCompletionBlockSynchronously:completion:]",  891LL,  @"SZExtractorErrorDomain",  3LL,  0LL,  0LL,  @"%s called before -[SZExtractor prepareForExtraction:] on %@",  v15,  (uint64_t)"-[SZExtractor _suspendStreamWithCompletionBlockSynchronously:completion:]");
LABEL_17:
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v16);
LABEL_18:
    unint64_t v24 = (void *)v12;
    v6[2](v6, 0LL, v12);

    goto LABEL_19;
  }

  if (!-[SZExtractor _isValidObject](self, "_isValidObject"))
  {
    unsigned int v21 = sub_100004680();
    BOOL v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v38 = (SZExtractor *)"-[SZExtractor _suspendStreamWithCompletionBlockSynchronously:completion:]";
      __int16 v39 = 2112;
      v40 = self;
      _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%s called on an invalidated object: %@",  buf,  0x16u);
    }

    id v16 = sub_100007A7C( (uint64_t)"-[SZExtractor _suspendStreamWithCompletionBlockSynchronously:completion:]",  897LL,  @"SZExtractorErrorDomain",  3LL,  0LL,  0LL,  @"%s called on an invalidated object: %@",  v23,  (uint64_t)"-[SZExtractor _suspendStreamWithCompletionBlockSynchronously:completion:]");
    goto LABEL_17;
  }

  -[SZExtractor setHasHadPostSetupMethodsCalled:](self, "setHasHadPostSetupMethodsCalled:", 1LL);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_100007E68;
  v35[3] = &unk_100028A00;
  v35[4] = self;
  id v36 = v6;
  uint64_t v17 = objc_retainBlock(v35);
  objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(-[SZExtractor inProcessUnzipper](self, "inProcessUnzipper"));

  if (v18)
  {
    uint64_t v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SZExtractor serialQueue](self, "serialQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100007F68;
    block[3] = &unk_100028848;
    block[4] = self;
    id v34 = v17;
    id v20 = v17;
    dispatch_async(v19, block);
  }

  else
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_100007FA8;
    v31[3] = &unk_100028A28;
    id v32 = v17;
    NSExceptionName v26 = v17;
    uint64_t v27 = objc_retainBlock(v31);
    id v28 = (void *)objc_claimAutoreleasedReturnValue(-[SZExtractor unzipServiceConnection](self, "unzipServiceConnection"));
    unint64_t v29 = v28;
    if (v4) {
      uint64_t v30 = objc_claimAutoreleasedReturnValue([v28 synchronousRemoteObjectProxyWithErrorHandler:v27]);
    }
    else {
      uint64_t v30 = objc_claimAutoreleasedReturnValue([v28 remoteObjectProxyWithErrorHandler:v27]);
    }
    id v20 = (void *)v30;

    [v20 suspendStreamWithReply:v26];
  }

LABEL_19:
}

- (void)suspendStreamWithCompletionBlock:(id)a3
{
}

- (void)finishStreamWithCompletionBlock:(id)a3
{
  BOOL v4 = (void (**)(id, uint64_t))a3;
  dispatch_queue_attr_t v5 = sub_100004680();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v35 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: finishing stream", buf, 0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SZExtractor error](self, "error"));
  if (v7)
  {
    id v8 = sub_100004680();
    char v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      unint64_t v24 = (SZExtractor *)objc_claimAutoreleasedReturnValue(-[SZExtractor error](self, "error"));
      *(_DWORD *)buf = 138412546;
      __int16 v35 = self;
      __int16 v36 = 2112;
      __int16 v37 = v24;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%@: finish called on extractor that had already returned error %@",  buf,  0x16u);
    }

    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[SZExtractor error](self, "error"));
    goto LABEL_18;
  }

  if (-[SZExtractor needsPreparation](self, "needsPreparation"))
  {
    id v11 = sub_100004680();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v35 = (SZExtractor *)"-[SZExtractor finishStreamWithCompletionBlock:]";
      __int16 v36 = 2112;
      __int16 v37 = self;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s called before -[SZExtractor prepareForExtraction:] on %@",  buf,  0x16u);
    }

    id v14 = sub_100007A7C( (uint64_t)"-[SZExtractor finishStreamWithCompletionBlock:]",  949LL,  @"SZExtractorErrorDomain",  3LL,  0LL,  0LL,  @"%s called before -[SZExtractor prepareForExtraction:] on %@",  v13,  (uint64_t)"-[SZExtractor finishStreamWithCompletionBlock:]");
LABEL_17:
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v14);
LABEL_18:
    uint64_t v23 = (void *)v10;
    v4[2](v4, v10);

    goto LABEL_19;
  }

  if (!-[SZExtractor _isValidObject](self, "_isValidObject"))
  {
    id v20 = sub_100004680();
    unsigned int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v35 = (SZExtractor *)"-[SZExtractor finishStreamWithCompletionBlock:]";
      __int16 v36 = 2112;
      __int16 v37 = self;
      _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%s called on an invalidated object: %@",  buf,  0x16u);
    }

    id v14 = sub_100007A7C( (uint64_t)"-[SZExtractor finishStreamWithCompletionBlock:]",  955LL,  @"SZExtractorErrorDomain",  3LL,  0LL,  0LL,  @"%s called on an invalidated object: %@",  v22,  (uint64_t)"-[SZExtractor finishStreamWithCompletionBlock:]");
    goto LABEL_17;
  }

  -[SZExtractor setHasHadPostSetupMethodsCalled:](self, "setHasHadPostSetupMethodsCalled:", 1LL);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_100007D30;
  v32[3] = &unk_1000287A8;
  v32[4] = self;
  v33 = v4;
  uint64_t v15 = objc_retainBlock(v32);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[SZExtractor inProcessUnzipper](self, "inProcessUnzipper"));

  if (v16)
  {
    uint64_t v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SZExtractor serialQueue](self, "serialQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100007E1C;
    block[3] = &unk_100028848;
    block[4] = self;
    id v31 = v15;
    objc_super v18 = v15;
    dispatch_async(v17, block);

    uint64_t v19 = v31;
  }

  else
  {
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[SZExtractor unzipServiceConnection](self, "unzipServiceConnection"));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_100007E5C;
    v28[3] = &unk_100028A28;
    unint64_t v29 = v15;
    NSExceptionName v26 = v15;
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v25 remoteObjectProxyWithErrorHandler:v28]);
    [v27 finishStreamWithReply:v26];

    uint64_t v19 = v29;
  }

LABEL_19:
}

- (void)terminateStreamWithError:(id)a3 completionBlock:(id)a4
{
  id v6 = (SZExtractor *)a3;
  id v7 = (void (**)(id, uint64_t))a4;
  id v8 = sub_100004680();
  char v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v38 = self;
    __int16 v39 = 2112;
    v40 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@: terminating stream with error %@",  buf,  0x16u);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SZExtractor error](self, "error"));
  if (v10)
  {
    id v11 = sub_100004680();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = (SZExtractor *)objc_claimAutoreleasedReturnValue(-[SZExtractor error](self, "error"));
      *(_DWORD *)buf = 138412546;
      id v38 = self;
      __int16 v39 = 2112;
      v40 = v27;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%@: terminate called on extractor that had already returned error %@",  buf,  0x16u);
    }

    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[SZExtractor error](self, "error"));
    goto LABEL_18;
  }

  if (-[SZExtractor needsPreparation](self, "needsPreparation"))
  {
    id v14 = sub_100004680();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v38 = (SZExtractor *)"-[SZExtractor terminateStreamWithError:completionBlock:]";
      __int16 v39 = 2112;
      v40 = self;
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s called before -[SZExtractor prepareForExtraction:] on %@",  buf,  0x16u);
    }

    id v17 = sub_100007A7C( (uint64_t)"-[SZExtractor terminateStreamWithError:completionBlock:]",  993LL,  @"SZExtractorErrorDomain",  3LL,  0LL,  0LL,  @"%s called before -[SZExtractor prepareForExtraction:] on %@",  v16,  (uint64_t)"-[SZExtractor terminateStreamWithError:completionBlock:]");
LABEL_17:
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v17);
LABEL_18:
    NSExceptionName v26 = (void *)v13;
    v7[2](v7, v13);

    goto LABEL_19;
  }

  if (!-[SZExtractor _isValidObject](self, "_isValidObject"))
  {
    uint64_t v23 = sub_100004680();
    unint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v38 = (SZExtractor *)"-[SZExtractor terminateStreamWithError:completionBlock:]";
      __int16 v39 = 2112;
      v40 = self;
      _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s called on an invalidated object: %@",  buf,  0x16u);
    }

    id v17 = sub_100007A7C( (uint64_t)"-[SZExtractor terminateStreamWithError:completionBlock:]",  999LL,  @"SZExtractorErrorDomain",  3LL,  0LL,  0LL,  @"%s called on an invalidated object: %@",  v25,  (uint64_t)"-[SZExtractor terminateStreamWithError:completionBlock:]");
    goto LABEL_17;
  }

  -[SZExtractor setHasHadPostSetupMethodsCalled:](self, "setHasHadPostSetupMethodsCalled:", 1LL);
  -[SZExtractor setError:](self, "setError:", v6);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_100007C08;
  v35[3] = &unk_1000287A8;
  v35[4] = self;
  __int16 v36 = v7;
  objc_super v18 = objc_retainBlock(v35);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[SZExtractor inProcessUnzipper](self, "inProcessUnzipper"));

  if (v19)
  {
    id v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SZExtractor serialQueue](self, "serialQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100007CE4;
    block[3] = &unk_100028848;
    block[4] = self;
    id v34 = v18;
    unsigned int v21 = v18;
    dispatch_async(v20, block);

    uint64_t v22 = v34;
  }

  else
  {
    id v28 = (void *)objc_claimAutoreleasedReturnValue(-[SZExtractor unzipServiceConnection](self, "unzipServiceConnection"));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_100007D24;
    v31[3] = &unk_100028A28;
    id v32 = v18;
    unint64_t v29 = v18;
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v28 remoteObjectProxyWithErrorHandler:v31]);
    [v30 terminateStreamWithReply:v29];

    uint64_t v22 = v32;
  }

LABEL_19:
}

- (BOOL)doesConsumeExtractedData
{
  return 0;
}

- (void)setExtractorDelegate:(id)a3
{
  BOOL v4 = (char *)a3;
  if (-[SZExtractor needsPreparation](self, "needsPreparation"))
  {
    dispatch_queue_attr_t v5 = sub_100004680();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412546;
      uint64_t v16 = self;
      __int16 v17 = 2080;
      objc_super v18 = "-[SZExtractor setExtractorDelegate:]";
      id v7 = "%@: %s was called before -[SZExtractor prepareForExtraction:]; this doesn't do anything";
LABEL_20:
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v15, 0x16u);
      goto LABEL_17;
    }

    goto LABEL_17;
  }

  unsigned __int8 v8 = -[SZExtractor _isValidObject](self, "_isValidObject");
  char v9 = sub_100004680();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  id v6 = v10;
  if ((v8 & 1) == 0)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412546;
      uint64_t v16 = self;
      __int16 v17 = 2080;
      objc_super v18 = "-[SZExtractor setExtractorDelegate:]";
      id v7 = "%@: %s was called on an invalidated object";
      goto LABEL_20;
    }

- (void)setDelegate:(id)a3
{
}

- (SZExtractorDelegate)delegate
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(-[SZExtractor internalExtractorDelegate](self, "internalExtractorDelegate"));
  BOOL v3 = (void *)v2;
  if (v2) {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 8));
  }
  else {
    id WeakRetained = 0LL;
  }

  return (SZExtractorDelegate *)WeakRetained;
}

- (SZExtractorDelegate)extractorDelegate
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(-[SZExtractor internalExtractorDelegate](self, "internalExtractorDelegate"));
  BOOL v3 = (void *)v2;
  if (v2) {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 8));
  }
  else {
    id WeakRetained = 0LL;
  }

  return (SZExtractorDelegate *)WeakRetained;
}

- (void)setActiveExtractorDelegateMethods:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_queue_attr_t v5 = sub_100004680();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = self;
    __int16 v15 = 1024;
    int v16 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@: setting active extractor delegate methods to 0x%x",  buf,  0x12u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SZExtractor inProcessUnzipper](self, "inProcessUnzipper"));
  if (v7)
  {
    unsigned __int8 v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SZExtractor serialQueue](self, "serialQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100007974;
    block[3] = &unk_100028A50;
    block[4] = self;
    int v12 = v3;
    dispatch_async(v8, block);
  }

  else
  {
    unsigned __int8 v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SZExtractor unzipServiceConnection](self, "unzipServiceConnection"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000079B4;
    v10[3] = &unk_100028A78;
    v10[4] = self;
    char v9 = (void *)objc_claimAutoreleasedReturnValue(-[dispatch_queue_s remoteObjectProxyWithErrorHandler:](v8, "remoteObjectProxyWithErrorHandler:", v10));
    [v9 setActiveDelegateMethods:v3];
  }
}

- (NSString)description
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SZExtractor extractionPath](self, "extractionPath"));

  if (v3)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[SZExtractor extractionPath](self, "extractionPath"));
    dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lastPathComponent]);

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SZExtractor extractionPath](self, "extractionPath"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByDeletingLastPathComponent]);
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);

    char v9 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"pathEnding:%@/%@",  v8,  v5));
  }

  else
  {
    char v9 = @"path:nil";
  }

  uint64_t v10 = (objc_class *)objc_opt_class(self);
  char v11 = NSStringFromClass(v10);
  int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  unsigned int v13 = -[SZExtractor needsPreparation](self, "needsPreparation");
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SZExtractor unzipServiceConnection](self, "unzipServiceConnection"));
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(-[SZExtractor error](self, "error"));
  uint64_t v16 = 89LL;
  if (v14) {
    uint64_t v17 = 89LL;
  }
  else {
    uint64_t v17 = 78LL;
  }
  if (v13) {
    uint64_t v16 = 78LL;
  }
  objc_super v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@<%p> prepared:%c valid:%c %@ error:%@>",  v12,  self,  v16,  v17,  v9,  v15));

  return (NSString *)v18;
}

- (NSString)extractionPath
{
  return self->_extractionPath;
}

- (void)setExtractionPath:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (BOOL)privileged
{
  return self->_privileged;
}

- (void)setPrivileged:(BOOL)a3
{
  self->_privileged = a3;
}

- (unint64_t)lastResumptionOffset
{
  return self->_lastResumptionOffset;
}

- (void)setLastResumptionOffset:(unint64_t)a3
{
  self->_lastResumptionOffset = a3;
}

- (NSXPCConnection)unzipServiceConnection
{
  return self->_unzipServiceConnection;
}

- (StreamingUnzipper)inProcessUnzipper
{
  return self->_inProcessUnzipper;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (SZExtractorInternalDelegate)internalExtractorDelegate
{
  return self->_internalExtractorDelegate;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BOOL)isLocalExtractor
{
  return self->_isLocalExtractor;
}

- (void)setNeedsPreparation:(BOOL)a3
{
  self->_needsPreparation = a3;
}

- (BOOL)hasHadPostSetupMethodsCalled
{
  return self->_hasHadPostSetupMethodsCalled;
}

- (void)setHasHadPostSetupMethodsCalled:(BOOL)a3
{
  self->_hasHadPostSetupMethodsCalled = a3;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int)servicePIDWithError:(id *)a3
{
  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = sub_100008270;
  uint64_t v23 = sub_100008280;
  id v24 = 0LL;
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  int v18 = -1;
  BOOL v4 = -[SZExtractor initWithOptions:]( objc_alloc(&OBJC_CLASS___SZExtractor),  "initWithOptions:",  &__NSDictionary0__struct);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10001A2AC;
  v14[3] = &unk_100028AA0;
  v14[4] = &v19;
  dispatch_queue_attr_t v5 = objc_retainBlock(v14);
  id v6 = (id *)(v20 + 5);
  id obj = (id)v20[5];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SZExtractor _serviceConnectionWithError:](v4, "_serviceConnectionWithError:", &obj));
  objc_storeStrong(v6, obj);
  if (!v7)
  {
    char v9 = 0LL;
    if (!a3) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }

  [v7 resume];
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 synchronousRemoteObjectProxyWithErrorHandler:v5]);
  char v9 = v8;
  if (v8)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10001A374;
    v12[3] = &unk_100028AC8;
    v12[4] = &v19;
    v12[5] = &v15;
    [v8 getPidForTestingWithReply:v12];
  }

  if (a3)
  {
LABEL_7:
    if (*((_DWORD *)v16 + 6) == -1) {
      *a3 = (id) v20[5];
    }
  }

@end
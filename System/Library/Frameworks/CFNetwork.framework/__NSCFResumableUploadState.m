@interface __NSCFResumableUploadState
+ (BOOL)supportsSecureCoding;
+ (__NSCFResumableUploadState)rusWithResumeData:(uint64_t)a1;
+ (id)rusWithResumeData:(id)a3 originalRequest:(id)a4;
- (BOOL)isResumable;
- (NSURL)uploadFile;
- (__CFString)resumeURLFromResponse:(void *)a1;
- (__NSCFResumableUploadState)initWithCoder:(id)a3;
- (id)createResumeData:(void *)a1;
- (id)createResumeDataForTaskInfo;
- (id)createResumeDataForTaskInfo:(void *)a3 error:;
- (id)initWithResumeData:(void *)a3 originalRequest:;
- (uint64_t)processResponse:(uint64_t)a1;
- (uint64_t)uploadOffsetFromResponse:(uint64_t)a1;
- (void)encodeWithCoder:(id)a3;
- (void)setUploadFile:(id)a3;
@end

@implementation __NSCFResumableUploadState

- (BOOL)isResumable
{
  if (self) {
    LOBYTE(self) = (self->_state - 1) <= 2 && self->_bodyType != -1 && self->_retryCounter < 4;
  }
  return (char)self;
}

- (void).cxx_destruct
{
}

- (id)createResumeDataForTaskInfo
{
  if (self && self->_bodyType && !objc_getProperty(self, a2, 40LL, 1))
  {
    -[__NSCFResumableUploadState createResumeDataForTaskInfo:error:]((uint64_t)self, 1, 0LL);
    return (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    v3 = (os_log_s *)(id)CFNLog::logger;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl( &dword_18298D000,  v3,  OS_LOG_TYPE_ERROR,  "ResumableUploadState: cannot create resume data for task info with body data type",  v5,  2u);
    }

    return 0LL;
  }

- (void)encodeWithCoder:(id)a3
{
  id v18 = a3;
  if (self) {
    uint64_t state = self->_state;
  }
  else {
    uint64_t state = 0LL;
  }
  [v18 encodeInt:state forKey:@"state"];
  if (self) {
    id Property = objc_getProperty(self, v5, 56LL, 1);
  }
  else {
    id Property = 0LL;
  }
  [v18 encodeObject:Property forKey:@"draftVersion"];
  if (self) {
    id v8 = objc_getProperty(self, v7, 32LL, 1);
  }
  else {
    id v8 = 0LL;
  }
  [v18 encodeObject:v8 forKey:@"originalRequest"];
  if (self) {
    id v10 = objc_getProperty(self, v9, 48LL, 1);
  }
  else {
    id v10 = 0LL;
  }
  [v18 encodeObject:v10 forKey:@"resumeURL"];
  if (self) {
    uint64_t bodyType = self->_bodyType;
  }
  else {
    uint64_t bodyType = 0LL;
  }
  [v18 encodeInt:bodyType forKey:@"bodyType"];
  if (self) {
    id v13 = objc_getProperty(self, v12, 40LL, 1);
  }
  else {
    id v13 = 0LL;
  }
  [v18 encodeObject:v13 forKey:@"uploadData"];
  v14 = -[__NSCFResumableUploadState uploadFile](self, "uploadFile");
  [v18 encodeObject:v14 forKey:@"uploadFile"];

  if (self) {
    int64_t offset = self->_offset;
  }
  else {
    int64_t offset = 0LL;
  }
  [v18 encodeInt64:offset forKey:@"offset"];
  if (self) {
    int64_t streamLength = self->_streamLength;
  }
  else {
    int64_t streamLength = 0LL;
  }
  [v18 encodeInt64:streamLength forKey:@"streamLength"];
  if (self) {
    BOOL userOverride = self->_userOverride;
  }
  else {
    BOOL userOverride = 0LL;
  }
  [v18 encodeBool:userOverride forKey:@"userOverride"];
}

- (__NSCFResumableUploadState)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS_____NSCFResumableUploadState;
  v5 = -[__NSCFResumableUploadState init](&v16, sel_init);
  if (v5)
  {
    v5->_uint64_t state = [v4 decodeIntForKey:@"state"];
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"draftVersion"];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic(v5, v7, v6, 56LL);

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originalRequest"];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic_copy(v5, v9, v8, 32LL);

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resumeURL"];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic(v5, v11, v10, 48LL);

    v5->_uint64_t bodyType = [v4 decodeIntForKey:@"bodyType"];
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uploadData"];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic(v5, v13, v12, 40LL);

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uploadFile"];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[__NSCFResumableUploadState setUploadFile:](v5, "setUploadFile:", v14);

    v5->_int64_t offset = [v4 decodeInt64ForKey:@"offset"];
    v5->_int64_t streamLength = [v4 decodeInt64ForKey:@"streamLength"];
    v5->_BOOL userOverride = [v4 decodeBoolForKey:@"userOverride"];
  }

  return v5;
}

- (NSURL)uploadFile
{
  return (NSURL *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setUploadFile:(id)a3
{
}

- (id)createResumeDataForTaskInfo:(void *)a3 error:
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  if ([(id)a1 isResumable])
  {
    [MEMORY[0x189603FC8] dictionary];
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_getProperty((id)a1, v7, 56, 1), @"draftVersion");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_getProperty((id)a1, v8, 48, 1), @"resumeURL");
    if ((a2 & 1) == 0) {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_getProperty((id)a1, v9, 32, 1), @"originalRequest");
    }
    [MEMORY[0x189607968] numberWithInt:*(unsigned int *)(a1 + 16)];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v10 forKeyedSubscript:@"bodyType"];

    objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_getProperty((id)a1, v11, 40, 1), @"uploadData");
    [(id)a1 uploadFile];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v12 forKeyedSubscript:@"uploadFile"];

    if ((*(void *)(a1 + 64) & 0x8000000000000000LL) == 0)
    {
      objc_msgSend(MEMORY[0x189607968], "numberWithLongLong:");
      SEL v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 setObject:v13 forKeyedSubscript:@"streamLength"];
    }

    id v24 = 0LL;
    [MEMORY[0x1896078F8] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v24];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    id v15 = v24;
    objc_super v16 = (void *)[v14 mutableCopy];

    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = [v17 mutableBytes];
      for (unint64_t i = 0LL; i != 8; ++i)
      {
        if (i >= [v17 length]) {
          break;
        }
        *(_BYTE *)(v18 + i) ^= kResumeDataMagicBytes[i];
      }

      [MEMORY[0x189603F48] dataWithData:v17];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      v21 = (os_log_s *)(id)CFNLog::logger;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( &dword_18298D000,  v21,  OS_LOG_TYPE_ERROR,  "ResumableUploadState: createResumeData archiver returned nil",  buf,  2u);
      }

      if (!v15) {
        goto LABEL_27;
      }
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      v22 = (os_log_s *)(id)CFNLog::logger;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v15;
        _os_log_error_impl( &dword_18298D000,  v22,  OS_LOG_TYPE_ERROR,  "ResumableUploadState: createResumeData archiver error: %@",  buf,  0xCu);
      }

      if (a3)
      {
        v20 = 0LL;
        *a3 = v15;
      }

      else
      {
LABEL_27:
        v20 = 0LL;
      }
    }
  }

  else
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    id v6 = (id)CFNLog::logger;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl( &dword_18298D000,  (os_log_t)v6,  OS_LOG_TYPE_DEBUG,  "ResumableUploadState: createResumeData returning nil because we are not resumable",  buf,  2u);
    }

    v20 = 0LL;
  }

  return v20;
}

+ (id)rusWithResumeData:(id)a3 originalRequest:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = -[__NSCFResumableUploadState initWithResumeData:originalRequest:]( objc_alloc(&OBJC_CLASS_____NSCFResumableUploadState),  v5,  v6);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)initWithResumeData:(void *)a3 originalRequest:
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  if (!a1) {
    goto LABEL_65;
  }
  if (!v5)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    id v26 = (os_log_s *)(id)CFNLog::logger;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_18298D000,  v26,  OS_LOG_TYPE_ERROR,  "ResumableUploadState: cannot initWithResumeData with nil resume data",  buf,  2u);
    }

    goto LABEL_65;
  }

  v54.receiver = a1;
  v54.super_class = (Class)&OBJC_CLASS_____NSCFResumableUploadState;
  a1 = objc_msgSendSuper2(&v54, sel_init);
  if (!a1)
  {
LABEL_66:
    a1 = a1;
    id v44 = a1;
    goto LABEL_67;
  }

  id v7 = [v5 mutableCopy];
  uint64_t v8 = [v7 mutableBytes];
  for (unint64_t i = 0LL; i != 8; ++i)
  {
    if (i >= [v7 length]) {
      break;
    }
    *(_BYTE *)(v8 + i) ^= kResumeDataMagicBytes[i];
  }

  id v10 = (void *)MEMORY[0x189607908];
  id v11 = (id)resumeDataClasses(void)::resumeDataClasses;
  id v53 = 0LL;
  [v10 unarchivedObjectOfClasses:v11 fromData:v7 error:&v53];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v13 = v53;

  if (!v12)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    uint64_t v27 = (os_log_s *)(id)CFNLog::logger;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_18298D000,  v27,  OS_LOG_TYPE_ERROR,  "ResumableUploadState: initWithResumeData unarchiver returned nil",  buf,  2u);
    }

    if (!v13)
    {
      int v34 = 1;
      goto LABEL_64;
    }

    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    v28 = (os_log_s *)(id)CFNLog::logger;
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_62;
    }
    *(_DWORD *)buf = 138412290;
    id v56 = v13;
    v29 = "ResumableUploadState: initWithResumeData unarchiver error: %@";
LABEL_40:
    v30 = v28;
    uint32_t v31 = 12;
    goto LABEL_41;
  }

  *((_DWORD *)a1 + 3) = 2;
  [v12 objectForKeyedSubscript:@"draftVersion"];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    v28 = (os_log_s *)(id)CFNLog::logger;
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_62;
    }
    *(_WORD *)buf = 0;
    v29 = "ResumableUploadState: cannot initWithResumeData with nil draft version";
    goto LABEL_35;
  }

  [v12 objectForKeyedSubscript:@"draftVersion"];
  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setProperty_atomic(a1, v17, v16, 56LL);

  id v18 = (id)supportedDraftVersions(void)::supportedDraftVersions;
  char v20 = objc_msgSend(v18, "containsObject:", objc_getProperty(a1, v19, 56, 1));

  if ((v20 & 1) == 0)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    v28 = (os_log_s *)(id)CFNLog::logger;
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_62;
    }
    id Property = objc_getProperty(a1, v32, 56LL, 1);
    *(_DWORD *)buf = 138412290;
    id v56 = Property;
    v29 = "ResumableUploadState: cannot initWithResumeData with unsupported draft version: %@";
    goto LABEL_40;
  }

  [v12 objectForKeyedSubscript:@"resumeURL"];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  char v22 = objc_opt_isKindOfClass();

  if ((v22 & 1) == 0)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    v28 = (os_log_s *)(id)CFNLog::logger;
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_62;
    }
    *(_WORD *)buf = 0;
    v29 = "ResumableUploadState: cannot initWithResumeData with nil resume URL";
    goto LABEL_35;
  }

  [v12 objectForKeyedSubscript:@"resumeURL"];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setProperty_atomic(a1, v24, v23, 48LL);

  if (v6)
  {
    objc_setProperty_atomic_copy(a1, v25, v6, 32LL);
  }

  else
  {
    [v12 objectForKeyedSubscript:@"originalRequest"];
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    char v36 = objc_opt_isKindOfClass();

    if ((v36 & 1) == 0)
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      v28 = (os_log_s *)(id)CFNLog::logger;
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        goto LABEL_62;
      }
      *(_WORD *)buf = 0;
      v29 = "ResumableUploadState: cannot initWithResumeData with nil request";
      goto LABEL_35;
    }

    [v12 objectForKeyedSubscript:@"originalRequest"];
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic_copy(a1, v38, v37, 32LL);
  }

  [v12 objectForKeyedSubscript:@"bodyType"];
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  char v40 = objc_opt_isKindOfClass();

  if ((v40 & 1) != 0)
  {
    [v12 objectForKeyedSubscript:@"bodyType"];
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int v41 = -[os_log_s intValue](v28, "intValue");
    *((_DWORD *)a1 + 4) = v41;
    switch(v41)
    {
      case -1:
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
        }
        v42 = (os_log_s *)(id)CFNLog::logger;
        if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          goto LABEL_89;
        }
        *(_WORD *)buf = 0;
        v43 = "ResumableUploadState: cannot initWithResumeData with unknown body type";
        goto LABEL_88;
      case 0:
        [v12 objectForKeyedSubscript:@"uploadData"];
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        char v51 = objc_opt_isKindOfClass();

        if ((v51 & 1) != 0)
        {
          [v12 objectForKeyedSubscript:@"uploadData"];
          v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          objc_setProperty_atomic(a1, v52, v42, 40LL);
          goto LABEL_78;
        }

        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
        }
        v42 = (os_log_s *)(id)CFNLog::logger;
        if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          goto LABEL_89;
        }
        *(_WORD *)buf = 0;
        v43 = "ResumableUploadState: cannot initWithResumeData with nil upload data";
        goto LABEL_88;
      case 1:
        [v12 objectForKeyedSubscript:@"uploadFile"];
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        char v47 = objc_opt_isKindOfClass();

        if ((v47 & 1) != 0)
        {
          [v12 objectForKeyedSubscript:@"uploadFile"];
          v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          [a1 setUploadFile:v42];
LABEL_78:
          int v34 = 0;
        }

        else
        {
          if (CFNLog::onceToken != -1) {
            dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
          }
          v42 = (os_log_s *)(id)CFNLog::logger;
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v43 = "ResumableUploadState: cannot initWithResumeData with nil upload file";
LABEL_88:
            _os_log_error_impl(&dword_18298D000, v42, OS_LOG_TYPE_ERROR, v43, buf, 2u);
          }

+ (__NSCFResumableUploadState)rusWithResumeData:(uint64_t)a1
{
  id v2 = a2;
  objc_opt_self();
  v3 = objc_alloc(&OBJC_CLASS_____NSCFResumableUploadState);
  id v4 = v2;
  if (v3) {
    v3 = (__NSCFResumableUploadState *)-[__NSCFResumableUploadState initWithResumeData:originalRequest:](v3, v4, 0LL);
  }

  return v3;
}

- (id)createResumeData:(void *)a1
{
  if (a1)
  {
    a1 = -[__NSCFResumableUploadState createResumeDataForTaskInfo:error:]((uint64_t)a1, 0, a2);
  }

  return a1;
}

- (uint64_t)uploadOffsetFromResponse:(uint64_t)a1
{
  uint64_t v1 = a1;
  if (a1)
  {
    if (*(_BYTE *)(v1 + 40)) {
      v1 += 16LL;
    }
    else {
      uint64_t v1 = 0LL;
    }
  }

  HTTPHeaderKeyMixedValue::HTTPHeaderKeyMixedValue(&v6, 0x14D1B41Au);
  uint64_t v2 = HTTPMessage::headers((os_unfair_lock_s *)v1);
  v3 = (__CFString *)HTTPHeaderDict::copyStringValue(v2, (const __CFAllocator *)*MEMORY[0x189604DB0], (uint64_t)&v6);
  id v6 = off_189C16E38;
  if (cf) {
    CFRelease(cf);
  }
  uint64_t v4 = -[__CFString longLongValue](v3, "longLongValue", v6);

  return v4;
}

- (__CFString)resumeURLFromResponse:(void *)a1
{
  if (a2)
  {
    if (*(_BYTE *)(a2 + 40)) {
      uint64_t v4 = (HTTPMessage *)(a2 + 16);
    }
    else {
      uint64_t v4 = 0LL;
    }
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  HeaderFieldValue = HTTPMessage::copyLastHeaderFieldValue(v4, 0x13011336u);
  if (!HeaderFieldValue) {
    return (__CFString *)0LL;
  }
  id v6 = HeaderFieldValue;
  if (!CFStringGetLength(HeaderFieldValue)) {
    return (__CFString *)0LL;
  }
  id v7 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  uint64_t v8 = (__CFString *)CFURLCreateStringByAddingPercentEscapes( (CFAllocatorRef)*MEMORY[0x189604DB0],  v6,  @"%#?:;/@=&[]",
                       0LL,
                       0x201u);
  CFRelease(v6);
  objc_msgSend(objc_getProperty(a1, v9, 32, 1), "URL");
  id v10 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    CFURLRef v11 = CFURLCreateWithString(v7, v8, v10);
    -[__CFURL absoluteURL](v11, "absoluteURL");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

    CFRelease(v8);
    if (!v12
      || (-[__CFString scheme](v12, "scheme"), (id v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL)
      && (-[__CFString scheme](v12, "scheme"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          uint64_t v15 = [v14 caseInsensitiveCompare:@"file"],
          v14,
          v13,
          !v15))
    {
LABEL_27:
      uint64_t v8 = 0LL;
      goto LABEL_28;
    }

    -[__CFString scheme](v12, "scheme");
    objc_super v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[__CFString scheme](v12, "scheme");
      SEL v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v17 caseInsensitiveCompare:@"http"]
        || (-[__CFURL scheme](v10, "scheme"), (SEL v19 = (void *)objc_claimAutoreleasedReturnValue()) == 0LL))
      {
      }

      else
      {
        -[__CFURL scheme](v10, "scheme");
        char v20 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v21 = [v20 caseInsensitiveCompare:@"https"];

        if (!v21)
        {
          if (CFNLog::onceToken != -1) {
            dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
          }
          char v22 = (os_log_s *)(id)CFNLog::logger;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v23 = 0;
            _os_log_error_impl( &dword_18298D000,  v22,  OS_LOG_TYPE_ERROR,  "ResumableUploadState: not allowing HTTP resumeURL to downgrade from HTTPS",  v23,  2u);
          }

          goto LABEL_27;
        }
      }
    }

    v12 = v12;
    uint64_t v8 = v12;
  }

  else
  {
    v12 = 0LL;
  }

- (uint64_t)processResponse:(uint64_t)a1
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  if ((*(_BYTE *)(a1 + 10) & 1) != 0)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    id v7 = (os_log_s *)(id)CFNLog::logger;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v28 = 0;
      _os_log_debug_impl( &dword_18298D000,  v7,  OS_LOG_TYPE_DEBUG,  "ResumableUploadState: userOverride is true, not processing response",  v28,  2u);
    }

    return 1LL;
  }

  CFIndex ResponseStatusCode = CFHTTPMessageGetResponseStatusCode(response);
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  id v5 = (os_log_s *)(id)CFNLog::logger;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v17 = *(_DWORD *)(a1 + 12) + 1;
    if (v17 > 5) {
      id v18 = @"unknown";
    }
    else {
      id v18 = off_189C03438[v17];
    }
    *(_DWORD *)v28 = 138412546;
    *(void *)&v28[4] = v18;
    *(_WORD *)&v28[12] = 2048;
    *(void *)&v28[14] = ResponseStatusCode;
    _os_log_debug_impl( &dword_18298D000,  v5,  OS_LOG_TYPE_DEBUG,  "ResumableUploadState: processResponse with state: %@, statusCode: %ld",  v28,  0x16u);
  }

  if ((unint64_t)(ResponseStatusCode - 400) <= 0xC7)
  {
    int v6 = -1;
    goto LABEL_8;
  }

  *(_WORD *)(a1 + 8) = 0;
  int v10 = *(_DWORD *)(a1 + 12);
  if (v10 == 3)
  {
    v12 = (__CFString *)CFHTTPMessageCopyHeaderFieldValue(response, @"Upload-Complete");
    id v13 = v12;
    if (v12)
    {
      char v14 = -[__CFString isEqualToString:](v12, "isEqualToString:", @"?1");
      if ((ResponseStatusCode & 0xFFFFFFFFFFFFFFFBLL) == 0xC8) {
        char v15 = v14;
      }
      else {
        char v15 = 1;
      }
      if ((v15 & 1) != 0)
      {
        else {
          int v16 = 4;
        }
        uint64_t v8 = 1LL;
      }

      else
      {
        uint64_t v19 = -[__NSCFResumableUploadState uploadOffsetFromResponse:]((uint64_t)response);
        uint64_t v8 = 0LL;
        *(void *)(a1 + 24) = v19;
        int v16 = 1;
      }
    }

    else
    {
      uint64_t v8 = 1LL;
      int v16 = -1;
    }

    *(_DWORD *)(a1 + 12) = v16;
  }

  else
  {
    if (v10 == 1)
    {
      int v6 = 4;
LABEL_8:
      *(_DWORD *)(a1 + 12) = v6;
      return 1LL;
    }

    if (v10 || ResponseStatusCode != 104) {
      return 1LL;
    }
    if (response)
    {
      CFURLRef v11 = *((_BYTE *)response + 40) ? (os_unfair_lock_s *)((char *)response + 16) : 0LL;
    }

    else
    {
      CFURLRef v11 = 0LL;
    }

    HTTPHeaderKeyMixedValue::HTTPHeaderKeyMixedValue(v28, 0x14B39402u);
    uint64_t v20 = HTTPMessage::headers(v11);
    char v22 = (__CFString *)HTTPHeaderDict::copyStringValue(v20, (const __CFAllocator *)*MEMORY[0x189604DB0], (uint64_t)v28);
    *(void *)v28 = off_189C16E38;
    if (*(void *)&v28[8]) {
      CFRelease(*(CFTypeRef *)&v28[8]);
    }
    if (!v22) {
      return 1LL;
    }
    id Property = objc_getProperty((id)a1, v21, 56LL, 1);
    int v24 = -[__CFString isEqualToString:](v22, "isEqualToString:", Property, *(void *)v28);

    if (!v24) {
      return 1LL;
    }
    v25 = -[__NSCFResumableUploadState resumeURLFromResponse:]((void *)a1, (uint64_t)response);
    objc_setProperty_atomic((id)a1, v26, v25, 48LL);

    uint64_t v8 = 1LL;
    if (objc_getProperty((id)a1, v27, 48LL, 1)) {
      *(_DWORD *)(a1 + 12) = 1;
    }
  }

  return v8;
}

@end
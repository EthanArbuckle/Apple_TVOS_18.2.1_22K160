@interface NWURLSessionDownloadResumeInfo
+ (BOOL)supportsSecureCoding;
+ (NWURLSessionDownloadResumeInfo)infoWithTask:(uint64_t)a1;
+ (void)infoWithResumeData:(uint64_t)a1;
- (NWURLSessionDownloadResumeInfo)initWithCoder:(id)a3;
- (id)serialize;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NWURLSessionDownloadResumeInfo

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  if (self)
  {
    [v7 encodeObject:self->_originalRequest forKey:@"originalRequest"];
    [v7 encodeObject:self->_currentRequest forKey:@"currentRequest"];
    [v7 encodeObject:self->_response forKey:@"response"];
    [v7 encodeObject:self->_earliestBeginDate forKey:@"earliestBeginDate"];
    [v7 encodeInt64:self->_countOfBytesClientExpectsToSend forKey:@"countOfBytesClientExpectsToSend"];
    [v7 encodeInt64:self->_countOfBytesClientExpectsToReceive forKey:@"countOfBytesClientExpectsToReceive"];
    [v7 encodeObject:self->_taskDescription forKey:@"taskDescription"];
    *(float *)&double v4 = self->_priority;
    [v7 encodeFloat:@"priority" forKey:v4];
    [v7 encodeBool:self->_prefersIncrementalDelivery forKey:@"prefersIncrementalDelivery"];
    [v7 encodeBool:self->__keepDownloadTaskFile forKey:@"_keepDownloadTaskFile"];
    responseConsumerResumeInfo = self->_responseConsumerResumeInfo;
  }

  else
  {
    [v7 encodeObject:0 forKey:@"originalRequest"];
    [v7 encodeObject:0 forKey:@"currentRequest"];
    [v7 encodeObject:0 forKey:@"response"];
    [v7 encodeObject:0 forKey:@"earliestBeginDate"];
    [v7 encodeInt64:0 forKey:@"countOfBytesClientExpectsToSend"];
    [v7 encodeInt64:0 forKey:@"countOfBytesClientExpectsToReceive"];
    [v7 encodeObject:0 forKey:@"taskDescription"];
    LODWORD(v6) = 0;
    [v7 encodeFloat:@"priority" forKey:v6];
    [v7 encodeBool:0 forKey:@"prefersIncrementalDelivery"];
    [v7 encodeBool:0 forKey:@"_keepDownloadTaskFile"];
    responseConsumerResumeInfo = 0LL;
  }

  [v7 encodeObject:responseConsumerResumeInfo forKey:@"responseConsumerResumeInfo"];
}

- (NWURLSessionDownloadResumeInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___NWURLSessionDownloadResumeInfo;
  v5 = -[NWURLSessionDownloadResumeInfo init](&v24, sel_init);
  if (!v5) {
    goto LABEL_5;
  }
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originalRequest"];
  double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (__nwlog_url_log::onceToken != -1) {
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
    }
    id v7 = (os_log_s *)(id)gurlLogObj;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl( &dword_181A5C000,  v7,  OS_LOG_TYPE_ERROR,  "Cannot init download resume info without original request",  v23,  2u);
    }

    goto LABEL_15;
  }

  id v7 = v6;
  objc_storeStrong((id *)&v5->_originalRequest, v6);
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentRequest"];
  v8 = (NSURLRequest *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (__nwlog_url_log::onceToken != -1) {
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
    }
    v21 = (os_log_s *)(id)gurlLogObj;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl( &dword_181A5C000,  v21,  OS_LOG_TYPE_ERROR,  "Cannot init download resume info without current request",  v23,  2u);
    }

LABEL_15:
    v20 = 0LL;
    goto LABEL_16;
  }

  currentRequest = v5->_currentRequest;
  v5->_currentRequest = v8;
  v10 = v8;

  uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"response"];
  response = v5->_response;
  v5->_response = (NSHTTPURLResponse *)v11;

  uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"earliestBeginDate"];
  earliestBeginDate = v5->_earliestBeginDate;
  v5->_earliestBeginDate = (NSDate *)v13;

  v5->_countOfBytesClientExpectsToSend = [v4 decodeInt64ForKey:@"countOfBytesClientExpectsToSend"];
  v5->_countOfBytesClientExpectsToReceive = [v4 decodeInt64ForKey:@"countOfBytesClientExpectsToReceive"];
  uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"taskDescription"];
  taskDescription = v5->_taskDescription;
  v5->_taskDescription = (NSString *)v15;

  [v4 decodeFloatForKey:@"priority"];
  v5->_priority = v17;
  v5->_prefersIncrementalDelivery = [v4 decodeBoolForKey:@"prefersIncrementalDelivery"];
  v5->__keepDownloadTaskFile = [v4 decodeBoolForKey:@"_keepDownloadTaskFile"];
  uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"responseConsumerResumeInfo"];
  responseConsumerResumeInfo = v5->_responseConsumerResumeInfo;
  v5->_responseConsumerResumeInfo = (NWURLSessionResponseConsumerResumeInfo *)v18;

LABEL_5:
  v20 = v5;
LABEL_16:

  return v20;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NWURLSessionDownloadResumeInfo)infoWithTask:(uint64_t)a1
{
  v2 = a2;
  objc_opt_self();
  v3 = objc_alloc_init(&OBJC_CLASS___NWURLSessionDownloadResumeInfo);
  [v2 originalRequest];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3) {
    objc_storeStrong((id *)&v3->_originalRequest, v4);
  }

  [v2 currentRequest];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3) {
    objc_storeStrong((id *)&v3->_currentRequest, v5);
  }

  [v2 response];
  double v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    [v2 response];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3) {
      objc_storeStrong((id *)&v3->_response, v8);
    }
  }

  [v2 earliestBeginDate];
  v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    earliestBeginDate = v3->_earliestBeginDate;
    v3->_earliestBeginDate = v9;

    v3->_countOfBytesClientExpectsToSend = [v2 countOfBytesClientExpectsToSend];
    v3->_countOfBytesClientExpectsToReceive = [v2 countOfBytesExpectedToReceive];
    uint64_t v11 = [v2 taskDescription];
    taskDescription = v3->_taskDescription;
    v3->_taskDescription = (NSString *)v11;

    [v2 priority];
    v3->_priority = v13;
    v3->_prefersIncrementalDelivery = [v2 prefersIncrementalDelivery];
    v3->__keepDownloadTaskFile = [v2 _keepDownloadTaskFile];
  }

  else
  {

    [v2 countOfBytesClientExpectsToSend];
    [v2 countOfBytesExpectedToReceive];
    [v2 taskDescription];

    [v2 priority];
    [v2 prefersIncrementalDelivery];
    [v2 _keepDownloadTaskFile];
  }

  id v14 = v2[53];
  [v14 createResumeInfo];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3) {
    objc_storeStrong((id *)&v3->_responseConsumerResumeInfo, v15);
  }

  return v3;
}

+ (void)infoWithResumeData:(uint64_t)a1
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  objc_opt_self();
  if (v2)
  {
    if (isWebKitNetworking_onceToken[0] != -1) {
      dispatch_once(isWebKitNetworking_onceToken, &__block_literal_global_180);
    }
    if (isWebKitNetworking_result != 1)
    {
      double v6 = 0LL;
      goto LABEL_15;
    }

    id v28 = 0LL;
    [MEMORY[0x1896079E8] propertyListWithData:v2 options:0 format:0 error:&v28];
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    id v4 = v28;
    [v3 objectForKeyedSubscript:@"$archiver"];
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      [v3 objectForKeyedSubscript:@"NSURLSessionResumeInfoLocalPath"];
      double v6 = (void *)objc_claimAutoreleasedReturnValue();
      id v27 = v4;
      id v7 = (void *)[objc_alloc(MEMORY[0x189607908]) initForReadingFromData:v2 error:&v27];
      id v8 = v27;

      v9 = (void *)MEMORY[0x189604010];
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = objc_opt_class();
      objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = [v7 decodeObjectOfClasses:v12 forKey:@"NSKeyedArchiveRootObjectKey"];

      [v7 finishDecoding];
      if (v13)
      {
        id v3 = (id)v13;
        if (v6) {
          goto LABEL_41;
        }
        goto LABEL_40;
      }

      id v4 = v8;
    }

    else
    {
      if (v3)
      {
        id v8 = v4;
LABEL_40:
        [v3 objectForKeyedSubscript:@"NSURLSessionResumeInfoLocalPath"];
        double v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v6)
        {
LABEL_42:
          uint64_t v22 = [v3 objectForKeyedSubscript:@"data"];

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (__nwlog_url_log::onceToken != -1) {
              dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
            }
            objc_super v24 = (os_log_s *)(id)gurlLogObj;
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( &dword_181A5C000,  v24,  OS_LOG_TYPE_ERROR,  "URLSessionDownloadTask: resume data has no data",  buf,  2u);
            }

            id v14 = 0LL;
            id v2 = (id)v22;
            goto LABEL_61;
          }

          id v2 = (id)v22;
LABEL_15:
          id v8 = (id)[v2 mutableCopy];
          uint64_t v15 = (_BYTE *)[v8 mutableBytes];
          if ([v8 length])
          {
            *v15 ^= 0x54u;
            if ((unint64_t)[v8 length] >= 2)
            {
              v15[1] ^= 0x65u;
              if ((unint64_t)[v8 length] >= 3)
              {
                v15[2] ^= 0x64u;
                if ((unint64_t)[v8 length] >= 4)
                {
                  v15[3] ^= 0x4Cu;
                  if ((unint64_t)[v8 length] >= 5)
                  {
                    v15[4] ^= 0x61u;
                    if ((unint64_t)[v8 length] >= 6)
                    {
                      v15[5] ^= 0x73u;
                      if ((unint64_t)[v8 length] >= 7)
                      {
                        v15[6] ^= 0x73u;
                      }
                    }
                  }
                }
              }
            }
          }

          id v26 = 0LL;
          [MEMORY[0x189607908] unarchivedObjectOfClass:objc_opt_class() fromData:v8 error:&v26];
          id v14 = (void *)objc_claimAutoreleasedReturnValue();
          id v3 = v26;
          if (v14)
          {
            if (v6)
            {
              [MEMORY[0x189604030] fileURLWithPath:v6];
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v17 = v14[9];
              if (v17) {
                objc_storeStrong((id *)(v17 + 8), v16);
              }

              uint64_t v18 = v14[9];
              if (v18)
              {
                v19 = *(void **)(v18 + 16);
                *(void *)(v18 + 16) = 0LL;
              }
            }

            v20 = v14;
          }

          else
          {
            if (__nwlog_url_log::onceToken != -1) {
              dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
            }
            v21 = (os_log_s *)(id)gurlLogObj;
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v30 = v3;
              _os_log_impl( &dword_181A5C000,  v21,  OS_LOG_TYPE_ERROR,  "URLSessionDownloadTask: resume data unarchiver returned nil, error: %@",  buf,  0xCu);
            }
          }

LABEL_61:
          goto LABEL_62;
        }

- (id)serialize
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    id v16 = 0LL;
    [MEMORY[0x1896078F8] archivedDataWithRootObject:a1 requiringSecureCoding:1 error:&v16];
    id v2 = (void *)objc_claimAutoreleasedReturnValue();
    id v3 = v16;
    id v4 = (void *)[v2 mutableCopy];

    if (v4)
    {
      v5 = (_BYTE *)[v4 mutableBytes];
      if ([v4 length])
      {
        *v5 ^= 0x54u;
        if ((unint64_t)[v4 length] >= 2)
        {
          v5[1] ^= 0x65u;
          if ((unint64_t)[v4 length] >= 3)
          {
            v5[2] ^= 0x64u;
            if ((unint64_t)[v4 length] >= 4)
            {
              v5[3] ^= 0x4Cu;
              if ((unint64_t)[v4 length] >= 5)
              {
                v5[4] ^= 0x61u;
                if ((unint64_t)[v4 length] >= 6)
                {
                  v5[5] ^= 0x73u;
                  if ((unint64_t)[v4 length] >= 7)
                  {
                    v5[6] ^= 0x73u;
                  }
                }
              }
            }
          }
        }
      }

      double v6 = (void *)[v4 copy];
      if (isWebKitNetworking_onceToken[0] != -1) {
        dispatch_once(isWebKitNetworking_onceToken, &__block_literal_global_180);
      }
      if ((isWebKitNetworking_result & 1) == 0) {
        goto LABEL_24;
      }
      id v7 = (void *)MEMORY[0x189603F68];
      id v8 = *(void **)(a1 + 72);
      if (v8) {
        v9 = (void *)v8[1];
      }
      else {
        v9 = 0LL;
      }
      uint64_t v10 = v8;
      [v9 path];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend( v7,  "dictionaryWithObjectsAndKeys:",  v6,  @"data",  v11,  @"NSURLSessionResumeInfoLocalPath",  0);
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1896078F8]) initRequiringSecureCoding:1];
      [v13 encodeObject:v12 forKey:@"NSKeyedArchiveRootObjectKey"];
      uint64_t v14 = [v13 encodedData];

      double v6 = (void *)v14;
    }

    else
    {
      if (__nwlog_url_log::onceToken != -1) {
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
      }
      v12 = (os_log_s *)(id)gurlLogObj;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v3;
        _os_log_impl( &dword_181A5C000,  v12,  OS_LOG_TYPE_ERROR,  "URLSessionDownloadTask: resume data archiver returned nil, error: %@",  buf,  0xCu);
      }

      double v6 = 0LL;
    }

LABEL_24:
    return v6;
  }

  return 0LL;
}

@end
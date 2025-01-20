@interface DIConvertParams
+ (BOOL)isUDIFWithFormat:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
- (BOOL)convertWithError:(id *)a3;
- (BOOL)inPlaceConversion;
- (BOOL)passphrase;
- (BOOL)prepareParamsForSquashWithError:(id *)a3;
- (BOOL)prepareParamsWithError:(id *)a3;
- (BOOL)shouldPerformInplaceSquash;
- (BOOL)shouldValidateShadows;
- (BOOL)useFormatMappingInfo;
- (BOOL)validateDeserializationWithError:(id *)a3;
- (BOOL)validateFileWithURL:(id)a3 error:(id *)a4;
- (BOOL)validateSquashFormats;
- (DIBaseParams)outputParams;
- (DIConvertParams)initWithCoder:(id)a3;
- (DIConvertParams)initWithInputURL:(id)a3 outputURL:(id)a4 error:(id *)a5;
- (DIConvertParams)initWithInputURL:(id)a3 outputURL:(id)a4 shadowURLs:(id)a5 error:(id *)a6;
- (DIURL)outputURL;
- (NSArray)shadowURLs;
- (NSString)certificate;
- (NSString)publicKey;
- (id)copyUpdatedOutputURLWithError:(id *)a3;
- (id)initForInplaceWithExistingParams:(id)a3 error:(id *)a4;
- (id)initForInplaceWithURL:(id)a3 error:(id *)a4;
- (int64_t)outputFormat;
- (unint64_t)conversionMethod;
- (unint64_t)encryptionMethod;
- (unint64_t)maxRawUDIFRunSize;
- (unint64_t)sparseBundleBandSize;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)setCertificate:(id)a3;
- (void)setConversionMethod:(unint64_t)a3;
- (void)setEncryptionMethod:(unint64_t)a3;
- (void)setMaxRawUDIFRunSize:(unint64_t)a3;
- (void)setOutputFormat:(int64_t)a3;
- (void)setOutputParams:(id)a3;
- (void)setOutputURL:(id)a3;
- (void)setPassphrase:(BOOL)a3;
- (void)setPublicKey:(id)a3;
- (void)setShouldValidateShadows:(BOOL)a3;
- (void)setSparseBundleBandSize:(unint64_t)a3;
- (void)setUseFormatMappingInfo:(BOOL)a3;
@end

@implementation DIConvertParams

- (BOOL)validateFileWithURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  BOOL v7 = [v5 isFileURL]
    && (stat((const char *)[v5 fileSystemRepresentation], &v9)
     || !FileDescriptor::is_device((FileDescriptor *)&v9, v6))
    || +[DIError failWithPOSIXCode:description:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:description:error:",  22LL,  @"Output of disk image conversion must be a file",  a4);

  return v7;
}

- (DIConvertParams)initWithInputURL:(id)a3 outputURL:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  [MEMORY[0x189603F18] array];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[DIConvertParams initWithInputURL:outputURL:shadowURLs:error:]( self,  "initWithInputURL:outputURL:shadowURLs:error:",  v8,  v9,  v10,  a5);

  return v11;
}

- (DIConvertParams)initWithInputURL:(id)a3 outputURL:(id)a4 shadowURLs:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = -[DIBaseParams initWithURL:error:](self, "initWithURL:error:", v10, a6);
  v14 = v13;
  if (v13)
  {
    if (!-[DIConvertParams validateFileWithURL:error:](v13, "validateFileWithURL:error:", v11, a6))
    {
      v17 = 0LL;
      goto LABEL_6;
    }

    objc_storeStrong((id *)&v14->_shadowURLs, a5);
    v15 = +[DIURL newDIURLWithNSURL:](&OBJC_CLASS___DIURL, "newDIURLWithNSURL:", v11);
    outputURL = v14->_outputURL;
    v14->_outputURL = v15;

    v14->_sparseBundleBandSize = 0x4000000LL;
  }

  v17 = v14;
LABEL_6:

  return v17;
}

- (id)initForInplaceWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = -[DIBaseParams initWithURL:error:](self, "initWithURL:error:", v6, a4);
  id v8 = v7;
  if (v7)
  {
    if (!-[DIConvertParams validateFileWithURL:error:](v7, "validateFileWithURL:error:", v6, a4))
    {
      id v9 = 0LL;
      goto LABEL_6;
    }

    -[DIConvertParams setConversionMethod:](v8, "setConversionMethod:", 1LL);
  }

  id v9 = v8;
LABEL_6:

  return v9;
}

- (id)initForInplaceWithExistingParams:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [v6 inputURL];
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___DIConvertParams;
  id v8 = -[DIBaseParams initWithURL:error:](&v14, sel_initWithURL_error_, v7, a4);

  if (v8)
  {
    [v6 inputURL];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v10 = -[DIConvertParams validateFileWithURL:error:](v8, "validateFileWithURL:error:", v9, a4);

    if (!v10)
    {
      id v12 = 0LL;
      goto LABEL_6;
    }

    [v6 diskImageParamsXPC];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DIBaseParams setDiskImageParamsXPC:](v8, "setDiskImageParamsXPC:", v11);

    -[DIConvertParams setConversionMethod:](v8, "setConversionMethod:", 1LL);
  }

  id v12 = v8;
LABEL_6:

  return v12;
}

- (BOOL)inPlaceConversion
{
  return -[DIConvertParams conversionMethod](self, "conversionMethod") == 1;
}

- (BOOL)validateSquashFormats
{
  int64_t v3 = -[DIConvertParams outputFormat](self, "outputFormat");
  if (v3 == 8 || v3 == 1)
  {
    v4 = -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)shouldPerformInplaceSquash
{
  v41[131] = *MEMORY[0x1895F89C0];
  if (!-[DIConvertParams validateSquashFormats](self, "validateSquashFormats")) {
    return 0;
  }
  -[DIConvertParams outputURL](self, "outputURL");
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 URLByDeletingLastPathComponent];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  id v5 = v4;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v5 fileSystemRepresentation]);
  int v6 = FileDescriptorWrapper::open_file((uint64_t)&__p, 0);
  FileLocal::FileLocal((FileLocal *)v36, v6, 0, 0);
  if (v35 < 0) {
    operator delete(__p);
  }
  -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 backendXPC];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v8;
  if (v8)
  {
    [v8 backend];
  }

  else
  {
    uint64_t v29 = 0LL;
    v30 = 0LL;
  }

  get_sink_backend((uint64_t)&v29, &lpsrc);
  if (lpsrc
  {
    __p = v11;
    v34 = v32;
    p_lpsrc = &lpsrc;
  }

  else
  {
    p_lpsrc = &__p;
  }

  *p_lpsrc = 0LL;
  p_lpsrc[1] = 0LL;
  v13 = v32;
  if (v32)
  {
    p_shared_owners = (unint64_t *)&v32->__shared_owners_;
    do
      unint64_t v15 = __ldaxr(p_shared_owners);
    while (__stlxr(v15 - 1, p_shared_owners));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }

  v16 = v30;
  if (v30)
  {
    v17 = (unint64_t *)&v30->__shared_owners_;
    do
      unint64_t v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }

  if (__p && FileLocal::mounted_on_same_fs((FileDescriptor **)__p, v36, v19))
  {
    v20 = -[DIConvertParams shadowURLs](self, "shadowURLs");
    if ([v20 count])
    {
      v21 = -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
      char v10 = [v21 mountedOnAPFS];
    }

    else
    {
      char v10 = 0;
    }
  }

  else
  {
    char v10 = 0;
  }

  v22 = v34;
  if (v34)
  {
    v23 = (unint64_t *)&v34->__shared_owners_;
    do
      unint64_t v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }

  v36[0] = (const FileDescriptor *)off_18A1EBA08;
  v38 = &unk_18A1EBAE8;
  v39 = &unk_18A1EBB20;
  boost::container::vector<FileLocal::promise_io_t,boost::container::small_vector_allocator<FileLocal::promise_io_t,boost::container::new_allocator<void>,void>,void>::~vector((uint64_t)v41);
  v25 = v40;
  if (v40)
  {
    v26 = (unint64_t *)&v40->__shared_owners_;
    do
      unint64_t v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }

  if (v37) {
    std::__shared_weak_count::__release_weak(v37);
  }

  return v10;
}

- (BOOL)prepareParamsForSquashWithError:(id *)a3
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  int v5 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    int v37 = 51;
    __int16 v38 = 2080;
    v39 = "-[DIConvertParams prepareParamsForSquashWithError:]";
    LODWORD(v35) = 18;
    v34 = buf;
    BOOL v7 = (char *)_os_log_send_and_compose_impl();

    if (v7)
    {
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v7);
      free(v7);
    }
  }

  else
  {
    getDIOSLog();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      int v37 = 51;
      __int16 v38 = 2080;
      v39 = "-[DIConvertParams prepareParamsForSquashWithError:]";
      _os_log_impl( &dword_188046000,  v8,  OS_LOG_TYPE_DEFAULT,  "%.*s: Performing in-place squash optimization",  buf,  0x12u);
    }
  }

  *__error() = v5;
  id v9 = -[DIConvertParams copyUpdatedOutputURLWithError:](self, "copyUpdatedOutputURLWithError:", a3);
  if (!v9) {
    goto LABEL_15;
  }
  if (!+[DICreateParams eraseIfExistingWithURL:error:]( &OBJC_CLASS___DICreateParams,  "eraseIfExistingWithURL:error:",  v9,  a3))
  {
    int v27 = *__error();
    if (!DIForwardLogs())
    {
      getDIOSLog();
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68157954;
        int v37 = 51;
        __int16 v38 = 2080;
        v39 = "-[DIConvertParams prepareParamsForSquashWithError:]";
        _os_log_impl(&dword_188046000, v30, OS_LOG_TYPE_ERROR, "%.*s: Failed to erase output URL", buf, 0x12u);
      }

      goto LABEL_29;
    }

    getDIOSLog();
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    *(_DWORD *)buf = 68157954;
    int v37 = 51;
    __int16 v38 = 2080;
    v39 = "-[DIConvertParams prepareParamsForSquashWithError:]";
    uint64_t v29 = (char *)_os_log_send_and_compose_impl();

    if (v29)
    {
LABEL_25:
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v29);
      free(v29);
    }

- (BOOL)prepareParamsWithError:(id *)a3
{
  if (-[DIConvertParams inPlaceConversion](self, "inPlaceConversion")) {
    return -[DIBaseParams openExistingImageWithFlags:error:](self, "openExistingImageWithFlags:error:", 2LL, a3);
  }
  char v6 = 0;
  if (-[DIBaseParams openExistingImageWithFlags:error:](self, "openExistingImageWithFlags:error:", 0LL, a3))
  {
    if (-[DIConvertParams shouldPerformInplaceSquash](self, "shouldPerformInplaceSquash"))
    {
      -[DIConvertParams setConversionMethod:](self, "setConversionMethod:", 2LL);
      return -[DIConvertParams prepareParamsForSquashWithError:](self, "prepareParamsForSquashWithError:", a3);
    }

    -[DIConvertParams setConversionMethod:](self, "setConversionMethod:", 0LL);
    -[DIBaseParams shadowChain](self, "shadowChain");
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
    char v6 = [v7 addShadowURLs:self->_shadowURLs error:a3];
  }

  return v6;
}

- (DIConvertParams)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DIConvertParams;
  int v5 = -[DIBaseParams initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_conversionMethod = [v4 decodeIntegerForKey:@"conversionMethod"];
    v5->_outputFormat = [v4 decodeIntegerForKey:@"outputFormat"];
    v5->_maxRawUDIFRunSize = [v4 decodeIntegerForKey:@"maxRawUDIFRunSize"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"outputParams"];
    outputParams = v5->_outputParams;
    v5->_outputParams = (DIBaseParams *)v6;

    v5->_useFormatMappingInfo = [v4 decodeBoolForKey:@"useFormatMappingInfo"];
  }

  return v5;
}

- (BOOL)shouldValidateShadows
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 shouldValidate];

  return v3;
}

- (void)setShouldValidateShadows:(BOOL)a3
{
  BOOL v3 = a3;
  -[DIBaseParams shadowChain](self, "shadowChain");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setShouldValidate:v3];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DIConvertParams;
  -[DIBaseParams encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[DIConvertParams conversionMethod](self, "conversionMethod"),  @"conversionMethod");
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[DIConvertParams outputFormat](self, "outputFormat"),  @"outputFormat");
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[DIConvertParams maxRawUDIFRunSize](self, "maxRawUDIFRunSize"),  @"maxRawUDIFRunSize");
  -[DIConvertParams outputParams](self, "outputParams");
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"outputParams"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[DIConvertParams useFormatMappingInfo](self, "useFormatMappingInfo"),  @"useFormatMappingInfo");
}

- (BOOL)validateDeserializationWithError:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___DIConvertParams;
  if (!-[DIBaseParams validateDeserializationWithError:](&v10, sel_validateDeserializationWithError_)) {
    return 0;
  }
  uint64_t v5 = -[DIConvertParams outputParams](self, "outputParams");
  if (!v5) {
    return 1;
  }
  objc_super v6 = (void *)v5;
  -[DIConvertParams outputParams](self, "outputParams");
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  char v8 = [v7 validateDeserializationWithError:a3];

  return v8;
}

- (id)copyUpdatedOutputURLWithError:(id *)a3
{
  v36[131] = *MEMORY[0x1895F89C0];
  -[DIBaseParams inputURL](self, "inputURL");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (([v4 isFileURL] & 1) == 0)
  {

LABEL_21:
    -[DIConvertParams outputURL](self, "outputURL", v24, v25);
    return (id)objc_claimAutoreleasedReturnValue();
  }

  id v5 = -[DIConvertParams outputURL](self, "outputURL");
  int v6 = access((const char *)[v5 fileSystemRepresentation], 0);

  if (v6) {
    goto LABEL_21;
  }
  id v7 = -[DIConvertParams outputURL](self, "outputURL");
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v7 fileSystemRepresentation]);
  int v8 = FileDescriptorWrapper::open_file((uint64_t)__p, 0);
  FileLocal::FileLocal((FileLocal *)&v30, v8, 0, 0);
  if (v29 < 0) {
    operator delete(*(void **)__p);
  }

  *(_OWORD *)__p = *(_OWORD *)(v34 + 32);
  -[DIBaseParams backend](self, "backend");
  BOOL v11 = *(void *)__p != (*(uint64_t (**)())(*(void *)v26 + 160LL))() || *(void *)&__p[8] != v9;
  char v12 = v27;
  if (v27)
  {
    p_shared_owners = (unint64_t *)&v27->__shared_owners_;
    do
      unint64_t v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)())v27->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v27);
    }
  }

  if (!v11)
  {
    int v15 = *__error();
    if (DIForwardLogs())
    {
      getDIOSLog();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      *(void *)__p = 0x3104100202LL;
      *(_WORD *)&__p[8] = 2080;
      *(void *)&__p[10] = "-[DIConvertParams copyUpdatedOutputURLWithError:]";
      LODWORD(v25) = 18;
      unint64_t v24 = __p;
      id v17 = (char *)_os_log_send_and_compose_impl();

      if (v17)
      {
        fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v17);
        free(v17);
      }
    }

    else
    {
      getDIOSLog();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(void *)__p = 0x3104100202LL;
        *(_WORD *)&__p[8] = 2080;
        *(void *)&__p[10] = "-[DIConvertParams copyUpdatedOutputURLWithError:]";
        _os_log_impl( &dword_188046000,  v19,  OS_LOG_TYPE_DEFAULT,  "%.*s: Input and output files are the same, using a temporary output file",  __p,  0x12u);
      }
    }

    *__error() = v15;
    v20 = -[DIConvertParams outputURL](self, "outputURL");
    [v20 URLByAppendingPathExtension:@"tmp_convert"];
    char v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v30 = off_18A1EBA08;
  v32 = &unk_18A1EBAE8;
  v33 = &unk_18A1EBB20;
  boost::container::vector<FileLocal::promise_io_t,boost::container::small_vector_allocator<FileLocal::promise_io_t,boost::container::new_allocator<void>,void>,void>::~vector((uint64_t)v36);
  v21 = v35;
  if (v35)
  {
    v22 = (unint64_t *)&v35->__shared_owners_;
    do
      unint64_t v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }

  if (v31) {
    std::__shared_weak_count::__release_weak(v31);
  }
  if (v11) {
    goto LABEL_21;
  }
  return v12;
}

- (BOOL)convertWithError:(id *)a3
{
  uint64_t v81 = *MEMORY[0x1895F89C0];
  if (!-[DIConvertParams prepareParamsWithError:](self, "prepareParamsWithError:")) {
    return 0;
  }
  if (-[DIConvertParams outputFormat](self, "outputFormat") >= 1
    && -[DIConvertParams outputFormat](self, "outputFormat") <= 12)
  {
    if (-[DIConvertParams maxRawUDIFRunSize](self, "maxRawUDIFRunSize")
      && -[DIConvertParams maxRawUDIFRunSize](self, "maxRawUDIFRunSize") < 0x100000)
    {
      id v5 = @"Invalid raw UDIF run size limit";
      return +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  v5,  a3);
    }

    if (-[DIConvertParams inPlaceConversion](self, "inPlaceConversion")
      && -[DIConvertParams encryptionMethod](self, "encryptionMethod"))
    {
      id v5 = @"In-place conversion maintains the encryption passphrase and method. It's not allowed to specify encryption arguments";
      return +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  v5,  a3);
    }

    uint64_t v67 = 0LL;
    v68 = &v67;
    uint64_t v69 = 0x3032000000LL;
    v70 = __Block_byref_object_copy__5;
    v71 = __Block_byref_object_dispose__5;
    v72 = objc_alloc_init(&OBJC_CLASS___DIClient2Controller_XPCHandler);
    int v8 = *__error();
    if (DIForwardLogs())
    {
      uint64_t v66 = 0LL;
      getDIOSLog();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68158210;
      int v74 = 36;
      __int16 v75 = 2080;
      v76 = "-[DIConvertParams convertWithError:]";
      __int16 v77 = 2114;
      v78 = self;
      LODWORD(v64) = 28;
      v63 = buf;
      objc_super v10 = (char *)_os_log_send_and_compose_impl();

      if (v10)
      {
        fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v10);
        free(v10);
      }
    }

    else
    {
      getDIOSLog();
      BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68158210;
        int v74 = 36;
        __int16 v75 = 2080;
        v76 = "-[DIConvertParams convertWithError:]";
        __int16 v77 = 2114;
        v78 = self;
        _os_log_impl(&dword_188046000, v11, OS_LOG_TYPE_DEFAULT, "%.*s: entry: %{public}@", buf, 0x1Cu);
      }
    }

    *__error() = v8;
    if (([(id)v68[5] connectWithError:a3] & 1) == 0
      || !-[DIBaseParams prepareImageWithXpcHandler:fileMode:error:]( self,  "prepareImageWithXpcHandler:fileMode:error:",  v68[5],  2LL,  a3))
    {
      goto LABEL_56;
    }

    if (-[DIConvertParams conversionMethod](self, "conversionMethod")) {
      goto LABEL_23;
    }
    id v19 = -[DIConvertParams copyUpdatedOutputURLWithError:](self, "copyUpdatedOutputURLWithError:", a3);
    if (!v19) {
      goto LABEL_56;
    }
    if (-[DIConvertParams outputFormat](self, "outputFormat") == 7)
    {
      v20 = -[DICreateParams initWithURL:error:]( objc_alloc(&OBJC_CLASS___DICreateUDSBParams),  "initWithURL:error:",  v19,  a3);
      if (!v20) {
        goto LABEL_40;
      }
      -[DICreateUDSBParams setSparseBundleBandSize:]( v20,  "setSparseBundleBandSize:",  -[DIConvertParams sparseBundleBandSize](self, "sparseBundleBandSize"));
    }

    else
    {
      v20 = -[DICreateParams initWithURL:error:]( objc_alloc(&OBJC_CLASS___DICreateRAWParams),  "initWithURL:error:",  v19,  a3);
      if (!v20) {
        goto LABEL_40;
      }
    }

    -[DICreateParams setEncryptionMethod:]( v20,  "setEncryptionMethod:",  -[DIConvertParams encryptionMethod](self, "encryptionMethod", v63, v64));
    -[DIBaseParams setReadPassphraseFlags:]( v20,  "setReadPassphraseFlags:",  -[DIBaseParams readPassphraseFlags](self, "readPassphraseFlags"));
    BOOL v26 = -[DIConvertParams shouldValidateShadows](self, "shouldValidateShadows");
    -[DIBaseParams shadowChain](v20, "shadowChain");
    int v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v27 setShouldValidate:v26];

    -[DICreateParams setPassphrase:](v20, "setPassphrase:", -[DIConvertParams passphrase](self, "passphrase"));
    v28 = -[DIConvertParams publicKey](self, "publicKey");
    -[DICreateParams setPublicKey:](v20, "setPublicKey:", v28);

    -[DIConvertParams certificate](self, "certificate");
    char v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[DICreateParams setCertificate:](v20, "setCertificate:", v29);

    if (-[DICreateParams createDiskImageParamsWithError:](v20, "createDiskImageParamsWithError:", a3)
      && -[DICreateParams createEncryptionWithXPCHandler:error:]( v20,  "createEncryptionWithXPCHandler:error:",  v68[5],  a3))
    {
      -[DIConvertParams setOutputParams:](self, "setOutputParams:", v20);

LABEL_23:
      objc_msgSend((id)v68[5], "remoteProxy", v63);
      char v12 = (void *)objc_claimAutoreleasedReturnValue();
      v65[0] = MEMORY[0x1895F87A8];
      v65[1] = 3221225472LL;
      v65[2] = __36__DIConvertParams_convertWithError___block_invoke;
      v65[3] = &unk_18A1CC610;
      v65[4] = &v67;
      [v12 convertWithParams:self reply:v65];

      if ([(id)v68[5] completeCommandWithError:a3])
      {
        if (-[DIConvertParams inPlaceConversion](self, "inPlaceConversion")) {
          goto LABEL_27;
        }
        v13 = -[DIConvertParams outputParams](self, "outputParams");
        BOOL v14 = v13 == 0LL;

        if (v14) {
          goto LABEL_27;
        }
        -[DIConvertParams outputURL](self, "outputURL");
        int v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[DIConvertParams outputParams](self, "outputParams");
        [v16 inputURL];
        id v17 = (void *)objc_claimAutoreleasedReturnValue();
        char v18 = [v15 isEqual:v17];

        if ((v18 & 1) != 0) {
          goto LABEL_27;
        }
        int v41 = *__error();
        if (DIForwardLogs())
        {
          uint64_t v66 = 0LL;
          getDIOSLog();
          v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
          v43 = -[DIConvertParams outputParams](self, "outputParams");
          [v43 inputURL];
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          [v44 path];
          v45 = (DIConvertParams *)objc_claimAutoreleasedReturnValue();
          v46 = -[DIConvertParams outputURL](self, "outputURL");
          [v46 path];
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 68158467;
          int v74 = 36;
          __int16 v75 = 2080;
          v76 = "-[DIConvertParams convertWithError:]";
          __int16 v77 = 2113;
          v78 = v45;
          __int16 v79 = 2113;
          v80 = v47;
          v48 = (char *)_os_log_send_and_compose_impl();

          if (v48)
          {
            fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v48);
            free(v48);
          }
        }

        else
        {
          getDIOSLog();
          v49 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            v50 = -[DIConvertParams outputParams](self, "outputParams");
            [v50 inputURL];
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            [v51 path];
            v52 = (DIConvertParams *)objc_claimAutoreleasedReturnValue();
            v53 = -[DIConvertParams outputURL](self, "outputURL");
            [v53 path];
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 68158467;
            int v74 = 36;
            __int16 v75 = 2080;
            v76 = "-[DIConvertParams convertWithError:]";
            __int16 v77 = 2113;
            v78 = v52;
            __int16 v79 = 2113;
            v80 = v54;
            _os_log_impl( &dword_188046000,  v49,  OS_LOG_TYPE_DEFAULT,  "%.*s: Moving %{private}@ to %{private}@",  buf,  0x26u);
          }
        }

        *__error() = v41;
        [MEMORY[0x1896078A8] defaultManager];
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = -[DIConvertParams outputURL](self, "outputURL");
        char v57 = [v55 removeItemAtURL:v56 error:a3];

        if ((v57 & 1) != 0)
        {
          [MEMORY[0x1896078A8] defaultManager];
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = -[DIConvertParams outputParams](self, "outputParams");
          [v59 inputURL];
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = -[DIConvertParams outputURL](self, "outputURL");
          char v62 = [v58 moveItemAtURL:v60 toURL:v61 error:a3];

          if ((v62 & 1) != 0)
          {
LABEL_27:
            BOOL v6 = 1;
LABEL_57:
            _Block_object_dispose(&v67, 8);

            return v6;
          }
        }
      }

      else
      {
        v21 = -[DIConvertParams outputParams](self, "outputParams");
        BOOL v22 = v21 == 0LL;

        if (!v22)
        {
          int v23 = *__error();
          if (DIForwardLogs())
          {
            uint64_t v66 = 0LL;
            getDIOSLog();
            unint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
            *(_DWORD *)buf = 68157954;
            int v74 = 36;
            __int16 v75 = 2080;
            v76 = "-[DIConvertParams convertWithError:]";
            uint64_t v25 = (char *)_os_log_send_and_compose_impl();

            if (v25)
            {
              fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v25);
              free(v25);
            }
          }

          else
          {
            getDIOSLog();
            v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 68157954;
              int v74 = 36;
              __int16 v75 = 2080;
              v76 = "-[DIConvertParams convertWithError:]";
              _os_log_impl( &dword_188046000,  v30,  OS_LOG_TYPE_ERROR,  "%.*s: Due to the conversion error, erasing the output file",  buf,  0x12u);
            }
          }

          *__error() = v23;
          v31 = -[DIConvertParams outputParams](self, "outputParams");
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            v33 = -[DIConvertParams outputParams](self, "outputParams");
            [v33 onErrorCleanup];
          }

          else
          {
            -[DIConvertParams outputURL](self, "outputURL");
            uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[DIConvertParams outputParams](self, "outputParams");
            uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
            [v35 inputURL];
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            char v37 = [v34 isEqual:v36];

            if ((v37 & 1) == 0)
            {
              [MEMORY[0x1896078A8] defaultManager];
              __int16 v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = -[DIConvertParams outputParams](self, "outputParams");
              [v39 inputURL];
              uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
              [v38 removeItemAtURL:v40 error:0];
            }
          }
        }
      }

uint64_t __36__DIConvertParams_convertWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) signalCommandCompletedWithXpcError:a2];
}

- (void)invalidate
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DIConvertParams;
  -[DIBaseParams invalidate](&v5, sel_invalidate);
  -[DIConvertParams outputParams](self, "outputParams");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[DIConvertParams outputParams](self, "outputParams");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 invalidate];
  }

+ (BOOL)isUDIFWithFormat:(int64_t)a3
{
  return (unint64_t)(a3 - 2) < 5;
}

- (int64_t)outputFormat
{
  return self->_outputFormat;
}

- (void)setOutputFormat:(int64_t)a3
{
  self->_outputFormat = a3;
}

- (BOOL)passphrase
{
  return self->_passphrase;
}

- (void)setPassphrase:(BOOL)a3
{
  self->_passphrase = a3;
}

- (NSString)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
}

- (NSString)certificate
{
  return self->_certificate;
}

- (void)setCertificate:(id)a3
{
}

- (unint64_t)encryptionMethod
{
  return self->_encryptionMethod;
}

- (void)setEncryptionMethod:(unint64_t)a3
{
  self->_encryptionMethod = a3;
}

- (unint64_t)maxRawUDIFRunSize
{
  return self->_maxRawUDIFRunSize;
}

- (void)setMaxRawUDIFRunSize:(unint64_t)a3
{
  self->_maxRawUDIFRunSize = a3;
}

- (unint64_t)sparseBundleBandSize
{
  return self->_sparseBundleBandSize;
}

- (void)setSparseBundleBandSize:(unint64_t)a3
{
  self->_sparseBundleBandSize = a3;
}

- (BOOL)useFormatMappingInfo
{
  return self->_useFormatMappingInfo;
}

- (void)setUseFormatMappingInfo:(BOOL)a3
{
  self->_useFormatMappingInfo = a3;
}

- (DIURL)outputURL
{
  return self->_outputURL;
}

- (void)setOutputURL:(id)a3
{
}

- (DIBaseParams)outputParams
{
  return self->_outputParams;
}

- (void)setOutputParams:(id)a3
{
}

- (unint64_t)conversionMethod
{
  return self->_conversionMethod;
}

- (void)setConversionMethod:(unint64_t)a3
{
  self->_conversionMethod = a3;
}

- (NSArray)shadowURLs
{
  return self->_shadowURLs;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)validateFileWithURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([v5 isFileURL]
    && (stat((const char *)[v5 fileSystemRepresentation], &v8)
     || !sub_1000FB214((uint64_t)&v8)))
  {
    BOOL v6 = 1;
  }

  else
  {
    BOOL v6 = +[DIError failWithPOSIXCode:description:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:description:error:",  22LL,  @"Output of disk image conversion must be a file",  a4);
  }

  return v6;
}

- (DIConvertParams)initWithInputURL:(id)a3 outputURL:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
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
  v7 = -[DIBaseParams initWithURL:error:](self, "initWithURL:error:", v6, a4);
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
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 inputURL]);
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___DIConvertParams;
  id v8 = -[DIBaseParams initWithURL:error:](&v14, "initWithURL:error:", v7, a4);

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 inputURL]);
    unsigned __int8 v10 = -[DIConvertParams validateFileWithURL:error:](v8, "validateFileWithURL:error:", v9, a4);

    if ((v10 & 1) == 0)
    {
      id v12 = 0LL;
      goto LABEL_6;
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 diskImageParamsXPC]);
    -[DIBaseParams setDiskImageParamsXPC:](v8, "setDiskImageParamsXPC:", v11);

    -[DIConvertParams setConversionMethod:](v8, "setConversionMethod:", 1LL);
  }

  id v12 = v8;
LABEL_6:

  return v12;
}

- (BOOL)inPlaceConversion
{
  return (id)-[DIConvertParams conversionMethod](self, "conversionMethod") == (id)1;
}

- (BOOL)validateSquashFormats
{
  int64_t v3 = -[DIConvertParams outputFormat](self, "outputFormat");
  if (v3 == 8)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___DiskImageParamsASIF_XPC, v8);
    char isKindOfClass = objc_opt_isKindOfClass(v4, v9);
  }

  else
  {
    if (v3 != 1)
    {
      char v10 = 0;
      return v10 & 1;
    }

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___DiskImageParamsRaw_XPC, v5);
    char isKindOfClass = objc_opt_isKindOfClass(v4, v6);
  }

  char v10 = isKindOfClass;

  return v10 & 1;
}

- (BOOL)shouldPerformInplaceSquash
{
  if (!-[DIConvertParams validateSquashFormats](self, "validateSquashFormats")) {
    return 0;
  }
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputURL](self, "outputURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 URLByDeletingLastPathComponent]);

  id v5 = v4;
  sub_100004CB0(&__p, (char *)[v5 fileSystemRepresentation]);
  uint64_t v6 = sub_1000FA260((uint64_t)&__p, 0LL);
  sub_100045554((uint64_t)v35, v6, 0LL, 0);
  if (v34 < 0) {
    operator delete(__p);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 backendXPC]);
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 backend];
  }

  else
  {
    uint64_t v28 = 0LL;
    v29 = 0LL;
  }

  sub_100116E98((uint64_t)&v28, &lpsrc);
  if (lpsrc
  {
    __p = v11;
    v33 = v31;
    p_lpsrc = &lpsrc;
  }

  else
  {
    p_lpsrc = &__p;
  }

  *p_lpsrc = 0LL;
  p_lpsrc[1] = 0LL;
  v13 = v31;
  if (v31)
  {
    p_shared_owners = (unint64_t *)&v31->__shared_owners_;
    do
      unint64_t v15 = __ldaxr(p_shared_owners);
    while (__stlxr(v15 - 1, p_shared_owners));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }

  v16 = v29;
  if (v29)
  {
    v17 = (unint64_t *)&v29->__shared_owners_;
    do
      unint64_t v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }

  if (__p && sub_1000FDAC0((uint64_t)__p, (uint64_t)v35))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams shadowURLs](self, "shadowURLs"));
    if ([v19 count])
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
      unsigned __int8 v10 = [v20 mountedOnAPFS];
    }

    else
    {
      unsigned __int8 v10 = 0;
    }
  }

  else
  {
    unsigned __int8 v10 = 0;
  }

  v21 = v33;
  if (v33)
  {
    v22 = (unint64_t *)&v33->__shared_owners_;
    do
      unint64_t v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }

  v35[0] = off_100184F88;
  v37 = off_100185068;
  v38 = off_1001850A0;
  sub_1000458AC((uint64_t)&v40);
  v24 = v39;
  if (v39)
  {
    v25 = (unint64_t *)&v39->__shared_owners_;
    do
      unint64_t v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }

  if (v36) {
    std::__shared_weak_count::__release_weak(v36);
  }

  return v10;
}

- (BOOL)prepareParamsForSquashWithError:(id *)a3
{
  int v5 = *__error();
  if (sub_1000B8654())
  {
    uint64_t v44 = 0LL;
    uint64_t v6 = sub_1000B85DC();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    *(_DWORD *)buf = 68157954;
    int v46 = 51;
    __int16 v47 = 2080;
    v48 = "-[DIConvertParams prepareParamsForSquashWithError:]";
    LODWORD(v43) = 18;
    uint64_t v9 = (char *)_os_log_send_and_compose_impl( v8,  &v44,  0LL,  0LL,  &_mh_execute_header,  v7,  0LL,  "%.*s: Performing in-place squash optimization",  (int)buf,  v43);

    if (v9)
    {
      fprintf(__stderrp, "%s\n", v9);
      free(v9);
    }
  }

  else
  {
    uint64_t v10 = sub_1000B85DC();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      int v46 = 51;
      __int16 v47 = 2080;
      v48 = "-[DIConvertParams prepareParamsForSquashWithError:]";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%.*s: Performing in-place squash optimization",  buf,  0x12u);
    }
  }

  *__error() = v5;
  id v12 = -[DIConvertParams copyUpdatedOutputURLWithError:](self, "copyUpdatedOutputURLWithError:", a3);
  if (!v12) {
    goto LABEL_18;
  }
  if (!+[DICreateParams eraseIfExistingWithURL:error:]( &OBJC_CLASS___DICreateParams,  "eraseIfExistingWithURL:error:",  v12,  a3))
  {
    int v30 = *__error();
    if (!sub_1000B8654())
    {
      uint64_t v35 = sub_1000B85DC();
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68157954;
        int v46 = 51;
        __int16 v47 = 2080;
        v48 = "-[DIConvertParams prepareParamsForSquashWithError:]";
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "%.*s: Failed to erase output URL",  buf,  0x12u);
      }

      goto LABEL_38;
    }

    uint64_t v44 = 0LL;
    uint64_t v31 = sub_1000B85DC();
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      uint64_t v33 = 3LL;
    }
    else {
      uint64_t v33 = 2LL;
    }
    *(_DWORD *)buf = 68157954;
    int v46 = 51;
    __int16 v47 = 2080;
    v48 = "-[DIConvertParams prepareParamsForSquashWithError:]";
    LODWORD(v43) = 18;
    char v34 = (char *)_os_log_send_and_compose_impl( v33,  &v44,  0LL,  0LL,  &_mh_execute_header,  v32,  16LL,  "%.*s: Failed to erase output URL",  (int)buf,  v43);

    if (v34)
    {
LABEL_34:
      fprintf(__stderrp, "%s\n", v34);
      free(v34);
    }

- (BOOL)prepareParamsWithError:(id *)a3
{
  if (-[DIConvertParams inPlaceConversion](self, "inPlaceConversion")) {
    return -[DIBaseParams openExistingImageWithFlags:error:](self, "openExistingImageWithFlags:error:", 2LL, a3);
  }
  unsigned __int8 v6 = 0;
  if (-[DIBaseParams openExistingImageWithFlags:error:](self, "openExistingImageWithFlags:error:", 0LL, a3))
  {
    if (-[DIConvertParams shouldPerformInplaceSquash](self, "shouldPerformInplaceSquash"))
    {
      -[DIConvertParams setConversionMethod:](self, "setConversionMethod:", 2LL);
      return -[DIConvertParams prepareParamsForSquashWithError:](self, "prepareParamsForSquashWithError:", a3);
    }

    -[DIConvertParams setConversionMethod:](self, "setConversionMethod:", 0LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
    unsigned __int8 v6 = [v7 addShadowURLs:self->_shadowURLs error:a3];
  }

  return v6;
}

- (DIConvertParams)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___DIConvertParams;
  int v5 = -[DIBaseParams initWithCoder:](&v11, "initWithCoder:", v4);
  if (v5)
  {
    v5->_conversionMethod = (unint64_t)[v4 decodeIntegerForKey:@"conversionMethod"];
    v5->_outputFormat = (int64_t)[v4 decodeIntegerForKey:@"outputFormat"];
    v5->_maxRawUDIFRunSize = (unint64_t)[v4 decodeIntegerForKey:@"maxRawUDIFRunSize"];
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(DIBaseParams, v6),  @"outputParams");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    outputParams = v5->_outputParams;
    v5->_outputParams = (DIBaseParams *)v8;

    v5->_useFormatMappingInfo = [v4 decodeBoolForKey:@"useFormatMappingInfo"];
  }

  return v5;
}

- (BOOL)shouldValidateShadows
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
  unsigned __int8 v3 = [v2 shouldValidate];

  return v3;
}

- (void)setShouldValidateShadows:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
  [v4 setShouldValidate:v3];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DIConvertParams;
  -[DIBaseParams encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[DIConvertParams conversionMethod](self, "conversionMethod"),  @"conversionMethod");
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[DIConvertParams outputFormat](self, "outputFormat"),  @"outputFormat");
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[DIConvertParams maxRawUDIFRunSize](self, "maxRawUDIFRunSize"),  @"maxRawUDIFRunSize");
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputParams](self, "outputParams"));
  [v4 encodeObject:v5 forKey:@"outputParams"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[DIConvertParams useFormatMappingInfo](self, "useFormatMappingInfo"),  @"useFormatMappingInfo");
}

- (BOOL)validateDeserializationWithError:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___DIConvertParams;
  if (!-[DIBaseParams validateDeserializationWithError:](&v10, "validateDeserializationWithError:")) {
    return 0;
  }
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[DIConvertParams outputParams](self, "outputParams"));
  if (!v5) {
    return 1;
  }
  objc_super v6 = (void *)v5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputParams](self, "outputParams"));
  unsigned __int8 v8 = [v7 validateDeserializationWithError:a3];

  return v8;
}

- (id)copyUpdatedOutputURLWithError:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
  if (([v4 isFileURL] & 1) == 0)
  {

    return (id)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputURL](self, "outputURL"));
  }

  id v5 = objc_claimAutoreleasedReturnValue(-[DIConvertParams outputURL](self, "outputURL"));
  int v6 = access((const char *)[v5 fileSystemRepresentation], 0);

  if (v6) {
    return (id)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputURL](self, "outputURL"));
  }
  id v7 = objc_claimAutoreleasedReturnValue(-[DIConvertParams outputURL](self, "outputURL"));
  sub_100004CB0(__p, (char *)[v7 fileSystemRepresentation]);
  uint64_t v8 = sub_1000FA260((uint64_t)__p, 0LL);
  sub_100045554((uint64_t)&v33, v8, 0LL, 0);
  if (v32 < 0) {
    operator delete(*(void **)__p);
  }

  *(_OWORD *)__p = *(_OWORD *)(v37 + 32);
  -[DIBaseParams backend](self, "backend");
  v30[0] = (*(uint64_t (**)())(*(void *)v28 + 160LL))();
  v30[1] = v9;
  BOOL v11 = *(void *)__p != v30[0] || *(void *)&__p[8] != v9;
  id v12 = v29;
  if (v29)
  {
    p_shared_owners = (unint64_t *)&v29->__shared_owners_;
    do
      unint64_t v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)())v29->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v29);
    }
  }

  if (!v11)
  {
    int v15 = *__error();
    if (sub_1000B8654())
    {
      v30[0] = 0LL;
      uint64_t v16 = sub_1000B85DC();
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v18 = 3LL;
      }
      else {
        uint64_t v18 = 2LL;
      }
      *(void *)__p = 0x3104100202LL;
      *(_WORD *)&__p[8] = 2080;
      *(void *)&__p[10] = "-[DIConvertParams copyUpdatedOutputURLWithError:]";
      LODWORD(v27) = 18;
      v19 = (char *)_os_log_send_and_compose_impl( v18,  v30,  0LL,  0LL,  &_mh_execute_header,  v17,  0LL,  "%.*s: Input and output files are the same, using a temporary output file",  (int)__p,  v27);

      if (v19)
      {
        fprintf(__stderrp, "%s\n", v19);
        free(v19);
      }
    }

    else
    {
      uint64_t v21 = sub_1000B85DC();
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(void *)__p = 0x3104100202LL;
        *(_WORD *)&__p[8] = 2080;
        *(void *)&__p[10] = "-[DIConvertParams copyUpdatedOutputURLWithError:]";
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%.*s: Input and output files are the same, using a temporary output file",  __p,  0x12u);
      }
    }

    *__error() = v15;
    unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputURL](self, "outputURL"));
    id v12 = (std::__shared_weak_count *)objc_claimAutoreleasedReturnValue([v23 URLByAppendingPathExtension:@"tmp_convert"]);
  }

  uint64_t v33 = off_100184F88;
  uint64_t v35 = off_100185068;
  v36 = off_1001850A0;
  sub_1000458AC((uint64_t)&v39);
  v24 = v38;
  if (v38)
  {
    BOOL v25 = (unint64_t *)&v38->__shared_owners_;
    do
      unint64_t v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }

  if (v34) {
    std::__shared_weak_count::__release_weak(v34);
  }
  if (v11) {
    return (id)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputURL](self, "outputURL"));
  }
  return v12;
}

- (BOOL)convertWithError:(id *)a3
{
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

    uint64_t v77 = 0LL;
    v78 = &v77;
    uint64_t v79 = 0x3032000000LL;
    v80 = sub_1000452B4;
    v81 = sub_1000452C4;
    v82 = objc_alloc_init(&OBJC_CLASS___DIClient2Controller_XPCHandler);
    int v8 = *__error();
    if (sub_1000B8654())
    {
      uint64_t v76 = 0LL;
      uint64_t v9 = sub_1000B85DC();
      objc_super v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v11 = 3LL;
      }
      else {
        uint64_t v11 = 2LL;
      }
      *(_DWORD *)buf = 68158210;
      int v84 = 36;
      __int16 v85 = 2080;
      v86 = "-[DIConvertParams convertWithError:]";
      __int16 v87 = 2114;
      v88 = self;
      id v12 = (char *)_os_log_send_and_compose_impl( v11,  &v76,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "%.*s: entry: %{public}@",  buf,  28);

      if (v12)
      {
        fprintf(__stderrp, "%s\n", v12);
        free(v12);
      }
    }

    else
    {
      uint64_t v13 = sub_1000B85DC();
      unint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68158210;
        int v84 = 36;
        __int16 v85 = 2080;
        v86 = "-[DIConvertParams convertWithError:]";
        __int16 v87 = 2114;
        v88 = self;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%.*s: entry: %{public}@", buf, 0x1Cu);
      }
    }

    *__error() = v8;
    if (([(id)v78[5] connectWithError:a3] & 1) == 0
      || !-[DIBaseParams prepareImageWithXpcHandler:fileMode:error:]( self,  "prepareImageWithXpcHandler:fileMode:error:",  v78[5],  2LL,  a3))
    {
      goto LABEL_65;
    }

    if (-[DIConvertParams conversionMethod](self, "conversionMethod")) {
      goto LABEL_26;
    }
    id v22 = -[DIConvertParams copyUpdatedOutputURLWithError:](self, "copyUpdatedOutputURLWithError:", a3);
    if (!v22) {
      goto LABEL_65;
    }
    if ((id)-[DIConvertParams outputFormat](self, "outputFormat") == (id)7)
    {
      unint64_t v23 = -[DICreateParams initWithURL:error:]( objc_alloc(&OBJC_CLASS___DICreateUDSBParams),  "initWithURL:error:",  v22,  a3);
      if (!v23) {
        goto LABEL_46;
      }
      -[DICreateUDSBParams setSparseBundleBandSize:]( v23,  "setSparseBundleBandSize:",  -[DIConvertParams sparseBundleBandSize](self, "sparseBundleBandSize"));
    }

    else
    {
      unint64_t v23 = -[DICreateParams initWithURL:error:]( objc_alloc(&OBJC_CLASS___DICreateRAWParams),  "initWithURL:error:",  v22,  a3);
      if (!v23) {
        goto LABEL_46;
      }
    }

    -[DICreateParams setEncryptionMethod:]( v23,  "setEncryptionMethod:",  -[DIConvertParams encryptionMethod](self, "encryptionMethod"));
    -[DIBaseParams setReadPassphraseFlags:]( v23,  "setReadPassphraseFlags:",  -[DIBaseParams readPassphraseFlags](self, "readPassphraseFlags"));
    BOOL v31 = -[DIConvertParams shouldValidateShadows](self, "shouldValidateShadows");
    char v32 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](v23, "shadowChain"));
    [v32 setShouldValidate:v31];

    -[DICreateParams setPassphrase:](v23, "setPassphrase:", -[DIConvertParams passphrase](self, "passphrase"));
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams publicKey](self, "publicKey"));
    -[DICreateParams setPublicKey:](v23, "setPublicKey:", v33);

    char v34 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams certificate](self, "certificate"));
    -[DICreateParams setCertificate:](v23, "setCertificate:", v34);

    if (-[DICreateParams createDiskImageParamsWithError:](v23, "createDiskImageParamsWithError:", a3)
      && -[DICreateParams createEncryptionWithXPCHandler:error:]( v23,  "createEncryptionWithXPCHandler:error:",  v78[5],  a3))
    {
      -[DIConvertParams setOutputParams:](self, "setOutputParams:", v23);

LABEL_26:
      int v15 = (void *)objc_claimAutoreleasedReturnValue([(id)v78[5] remoteProxy]);
      v75[0] = _NSConcreteStackBlock;
      v75[1] = 3221225472LL;
      v75[2] = sub_1000452CC;
      v75[3] = &unk_10016C0D0;
      v75[4] = &v77;
      [v15 convertWithParams:self reply:v75];

      if ([(id)v78[5] completeCommandWithError:a3])
      {
        if (-[DIConvertParams inPlaceConversion](self, "inPlaceConversion")) {
          goto LABEL_30;
        }
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputParams](self, "outputParams"));
        BOOL v17 = v16 == 0LL;

        if (v17) {
          goto LABEL_30;
        }
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputURL](self, "outputURL"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputParams](self, "outputParams"));
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 inputURL]);
        unsigned __int8 v21 = [v18 isEqual:v20];

        if ((v21 & 1) != 0) {
          goto LABEL_30;
        }
        int v49 = *__error();
        if (sub_1000B8654())
        {
          uint64_t v76 = 0LL;
          uint64_t v50 = sub_1000B85DC();
          v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
          uint64_t v52 = os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT) ? 3LL : 2LL;
          v53 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputParams](self, "outputParams"));
          v54 = (void *)objc_claimAutoreleasedReturnValue([v53 inputURL]);
          v55 = (DIConvertParams *)objc_claimAutoreleasedReturnValue([v54 path]);
          v56 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputURL](self, "outputURL"));
          v57 = (void *)objc_claimAutoreleasedReturnValue([v56 path]);
          *(_DWORD *)buf = 68158467;
          int v84 = 36;
          __int16 v85 = 2080;
          v86 = "-[DIConvertParams convertWithError:]";
          __int16 v87 = 2113;
          v88 = v55;
          __int16 v89 = 2113;
          v90 = v57;
          LODWORD(v74) = 38;
          v58 = (char *)_os_log_send_and_compose_impl( v52,  &v76,  0LL,  0LL,  &_mh_execute_header,  v51,  0LL,  "%.*s: Moving %{private}@ to %{private}@",  buf,  v74);

          if (v58)
          {
            fprintf(__stderrp, "%s\n", v58);
            free(v58);
          }
        }

        else
        {
          uint64_t v59 = sub_1000B85DC();
          v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            v61 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputParams](self, "outputParams"));
            v62 = (void *)objc_claimAutoreleasedReturnValue([v61 inputURL]);
            v63 = (DIConvertParams *)objc_claimAutoreleasedReturnValue([v62 path]);
            v64 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputURL](self, "outputURL"));
            v65 = (void *)objc_claimAutoreleasedReturnValue([v64 path]);
            *(_DWORD *)buf = 68158467;
            int v84 = 36;
            __int16 v85 = 2080;
            v86 = "-[DIConvertParams convertWithError:]";
            __int16 v87 = 2113;
            v88 = v63;
            __int16 v89 = 2113;
            v90 = v65;
            _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_DEFAULT,  "%.*s: Moving %{private}@ to %{private}@",  buf,  0x26u);
          }
        }

        *__error() = v49;
        v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        v67 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputURL](self, "outputURL"));
        unsigned __int8 v68 = [v66 removeItemAtURL:v67 error:a3];

        if ((v68 & 1) != 0)
        {
          v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          v70 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputParams](self, "outputParams"));
          v71 = (void *)objc_claimAutoreleasedReturnValue([v70 inputURL]);
          v72 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputURL](self, "outputURL"));
          unsigned __int8 v73 = [v69 moveItemAtURL:v71 toURL:v72 error:a3];

          if ((v73 & 1) != 0)
          {
LABEL_30:
            BOOL v6 = 1;
LABEL_66:
            _Block_object_dispose(&v77, 8);

            return v6;
          }
        }
      }

      else
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputParams](self, "outputParams"));
        BOOL v25 = v24 == 0LL;

        if (!v25)
        {
          int v26 = *__error();
          if (sub_1000B8654())
          {
            uint64_t v76 = 0LL;
            uint64_t v27 = sub_1000B85DC();
            uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
              uint64_t v29 = 3LL;
            }
            else {
              uint64_t v29 = 2LL;
            }
            *(_DWORD *)buf = 68157954;
            int v84 = 36;
            __int16 v85 = 2080;
            v86 = "-[DIConvertParams convertWithError:]";
            LODWORD(v74) = 18;
            int v30 = (char *)_os_log_send_and_compose_impl( v29,  &v76,  0LL,  0LL,  &_mh_execute_header,  v28,  16LL,  "%.*s: Due to the conversion error, erasing the output file",  (int)buf,  v74);

            if (v30)
            {
              fprintf(__stderrp, "%s\n", v30);
              free(v30);
            }
          }

          else
          {
            uint64_t v35 = sub_1000B85DC();
            v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 68157954;
              int v84 = 36;
              __int16 v85 = 2080;
              v86 = "-[DIConvertParams convertWithError:]";
              _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "%.*s: Due to the conversion error, erasing the output file",  buf,  0x12u);
            }
          }

          *__error() = v26;
          uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputParams](self, "outputParams"));
          uint64_t v39 = objc_opt_class(&OBJC_CLASS___DICreateParams, v38);
          char isKindOfClass = objc_opt_isKindOfClass(v37, v39);

          if ((isKindOfClass & 1) != 0)
          {
            v41 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputParams](self, "outputParams"));
            [v41 onErrorCleanup];
          }

          else
          {
            v42 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputURL](self, "outputURL"));
            v43 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputParams](self, "outputParams"));
            uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v43 inputURL]);
            unsigned __int8 v45 = [v42 isEqual:v44];

            if ((v45 & 1) == 0)
            {
              int v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
              __int16 v47 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputParams](self, "outputParams"));
              v48 = (void *)objc_claimAutoreleasedReturnValue([v47 inputURL]);
              [v46 removeItemAtURL:v48 error:0];
            }
          }
        }
      }

- (void)invalidate
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DIConvertParams;
  -[DIBaseParams invalidate](&v5, "invalidate");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputParams](self, "outputParams"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputParams](self, "outputParams"));
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

@end
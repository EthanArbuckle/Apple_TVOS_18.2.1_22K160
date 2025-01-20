@interface STAEAExtractor
- (NSData)archiveID;
- (NSData)asymmetricDecryptionKey;
- (NSData)signingPublicKey;
- (NSData)symmetricDecryptionKey;
- (NSDictionary)options;
- (NSError)error;
- (NSString)sourceDirectory;
- (NSString)sourceDirectorySandboxExtension;
- (STAEAExtractor)initWithOptions:(id)a3 delegate:(id)a4;
- (STExtractionPluginDelegate)delegate;
- (int)aeaContextCallback:(AEAContext_impl *)a3;
- (int)extractionProgress:(float)a3;
- (int)processEntryMessage:(unsigned int)a3 path:(const char *)a4 data:(void *)a5;
- (unint64_t)extractionMemoryFootprint;
- (unint64_t)sandboxToken;
- (unsigned)isComplete;
- (void)dealloc;
- (void)finishStreamWithCompletionBlock:(id)a3;
- (void)invalidate;
- (void)prepareForExtractionToPath:(id)a3 withCompletionBlock:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setError:(id)a3;
- (void)setIsComplete:(unsigned __int8)a3;
- (void)setSandboxToken:(unint64_t)a3;
- (void)supplyBytes:(id)a3 withCompletionBlock:(id)a4;
- (void)suspendStreamWithCompletionBlock:(id)a3;
- (void)terminateStreamWithError:(id)a3 completionBlock:(id)a4;
@end

@implementation STAEAExtractor

- (STAEAExtractor)initWithOptions:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_23DC();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v56 = "-[STAEAExtractor initWithOptions:delegate:]";
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%{public}s: Initializing extractor", buf, 0xCu);
  }

  self->_extractor = 0LL;
  self->_offset = 0LL;
  path = self->_path;
  self->_path = 0LL;

  session = self->_session;
  self->_session = 0LL;

  v54.receiver = self;
  v54.super_class = (Class)&OBJC_CLASS___STAEAExtractor;
  v12 = -[STAEAExtractor init](&v54, "init");
  if (v12)
  {
    v13 = (NSDictionary *)[v6 copy];
    options = v12->_options;
    v12->_options = v13;

    if ((objc_opt_respondsToSelector(v7, "sessionID") & 1) != 0)
    {
      uint64_t v15 = objc_claimAutoreleasedReturnValue([v7 sessionID]);
      v16 = v12->_session;
      v12->_session = (NSString *)v15;
    }

    else
    {
      v16 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      uint64_t v17 = objc_claimAutoreleasedReturnValue(-[NSString UUIDString](v16, "UUIDString"));
      v18 = v12->_session;
      v12->_session = (NSString *)v17;
    }

    v19 = sub_23DC();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = v12->_session;
      *(_DWORD *)buf = 138412546;
      v56 = (const char *)v21;
      __int16 v57 = 2082;
      v58 = "-[STAEAExtractor initWithOptions:delegate:]";
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "[%@] %{public}s: new AEA extractor", buf, 0x16u);
    }

    uint64_t v22 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"STAEAExtractorSymmetricEncryptionKey<Private>"]);
    symmetricDecryptionKey = v12->_symmetricDecryptionKey;
    v12->_symmetricDecryptionKey = (NSData *)v22;

    v24 = v12->_symmetricDecryptionKey;
    if (v24 && (uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSData), (objc_opt_isKindOfClass(v24, v25) & 1) == 0))
    {
      v47 = sub_23DC();
      v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        sub_4CB8();
      }
    }

    else
    {
      uint64_t v26 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"STAEAExtractorAsymmetricDecryptionKey<Private>"]);
      asymmetricDecryptionKey = v12->_asymmetricDecryptionKey;
      v12->_asymmetricDecryptionKey = (NSData *)v26;

      v28 = v12->_asymmetricDecryptionKey;
      if (v28 && (uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSData), (objc_opt_isKindOfClass(v28, v29) & 1) == 0))
      {
        v49 = sub_23DC();
        v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
          sub_4C1C();
        }
      }

      else
      {
        uint64_t v30 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"STAEAExtractorSigningPublicKey<Private>"]);
        signingPublicKey = v12->_signingPublicKey;
        v12->_signingPublicKey = (NSData *)v30;

        v32 = v12->_signingPublicKey;
        if (v32 && (uint64_t v33 = objc_opt_class(&OBJC_CLASS___NSData), (objc_opt_isKindOfClass(v32, v33) & 1) == 0))
        {
          v50 = sub_23DC();
          v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
            sub_4B80();
          }
        }

        else
        {
          uint64_t v34 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"STAEAExtractorSourceDirectory"]);
          sourceDirectory = v12->_sourceDirectory;
          v12->_sourceDirectory = (NSString *)v34;

          v36 = v12->_sourceDirectory;
          if (v36 && (uint64_t v37 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v36, v37) & 1) == 0))
          {
            v51 = sub_23DC();
            v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
              sub_4AE4();
            }
          }

          else
          {
            uint64_t v38 = objc_claimAutoreleasedReturnValue( [v6 objectForKeyedSubscript:@"STAEAExtractorSourceDirectorySandboxExtension<Private>"]);
            sourceDirectorySandboxExtension = v12->_sourceDirectorySandboxExtension;
            v12->_sourceDirectorySandboxExtension = (NSString *)v38;

            v40 = v12->_sourceDirectorySandboxExtension;
            if (v40 && (uint64_t v41 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v40, v41) & 1) == 0))
            {
              v52 = sub_23DC();
              v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
              if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
                sub_4A48();
              }
            }

            else
            {
              uint64_t v42 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"STAEAExtractorArchiveID"]);
              archiveID = v12->_archiveID;
              v12->_archiveID = (NSData *)v42;

              v44 = v12->_archiveID;
              if (!v44 || (uint64_t v45 = objc_opt_class(&OBJC_CLASS___NSData), (objc_opt_isKindOfClass(v44, v45) & 1) != 0))
              {
                -[STAEAExtractor setDelegate:](v12, "setDelegate:", v7);
                -[STAEAExtractor setIsComplete:](v12, "setIsComplete:", 0LL);
                -[STAEAExtractor setSandboxToken:](v12, "setSandboxToken:", -1LL);
                goto LABEL_22;
              }

              v53 = sub_23DC();
              v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
              if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
                sub_49AC();
              }
            }
          }
        }
      }
    }

    v12 = 0LL;
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___STAEAExtractor;
  -[STAEAExtractor dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  p_extractor = &self->_extractor;
  extractor = self->_extractor;
  if (extractor)
  {
    AAAssetExtractorDestroy(extractor, 0LL);
    *p_extractor = 0LL;
    p_extractor[1] = 0LL;
  }

  if (-[STAEAExtractor sandboxToken](self, "sandboxToken") != -1LL)
  {
    sandbox_extension_release(-[STAEAExtractor sandboxToken](self, "sandboxToken"));
    -[STAEAExtractor setSandboxToken:](self, "setSandboxToken:", -1LL);
  }

- (unint64_t)extractionMemoryFootprint
{
  return 20971520LL;
}

- (int)extractionProgress:(float)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STAEAExtractor delegate](self, "delegate"));

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[STAEAExtractor delegate](self, "delegate"));
    [v6 setExtractionProgress:a3];
  }

  return 0;
}

- (int)aeaContextCallback:(AEAContext_impl *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STAEAExtractor archiveID](self, "archiveID"));

  if (v5)
  {
    size_t buf_size = 0LL;
    if (!a3)
    {
      v49 = sub_23DC();
      v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
        sub_50FC();
      }

      v51 = STExtractorErrorDomain;
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No AEA context and archiveID is required. Likely an incorrectly formatted archive."));
      v36 = v51;
      uint64_t v37 = v6;
      uint64_t v38 = 207LL;
      goto LABEL_24;
    }

    if (AEAContextGetFieldBlob(a3, 0x12u, 0, 0x20uLL, buf, &buf_size))
    {
      v52 = sub_23DC();
      v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
        sub_5234();
      }

      objc_super v54 = STExtractorErrorDomain;
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to get archive identifier from extractor context - identifier is required"));
      v36 = v54;
      uint64_t v37 = v6;
      uint64_t v38 = 210LL;
      goto LABEL_24;
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  buf,  buf_size,  0LL));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[STAEAExtractor archiveID](self, "archiveID"));
    unsigned __int8 v8 = [v7 isEqualToData:v6];

    if ((v8 & 1) == 0)
    {
      v55 = sub_23DC();
      v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        sub_5198();
      }

      __int16 v57 = STExtractorErrorDomain;
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[STAEAExtractor archiveID](self, "archiveID"));
      v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Archive identifier mismatch.  Archive: %@ - Expected: %@",  v6,  v40));
      id v59 = sub_23C8( v57,  6LL,  v58,  0LL,  (uint64_t)"-[STAEAExtractor aeaContextCallback:]",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/AEAExtractionPlugin/STAEAExtractorPlugin.m",  213LL);
      v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
      -[STAEAExtractor setError:](self, "setError:", v60);

      goto LABEL_25;
    }
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[STAEAExtractor asymmetricDecryptionKey](self, "asymmetricDecryptionKey"));

  if (v9)
  {
    v10 = sub_23DC();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    v12 = v11;
    if (!a3)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_5060();
      }

      v61 = STExtractorErrorDomain;
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No AEA context and decryption key was provided. Archive is not encrypted."));
      v36 = v61;
      uint64_t v37 = v6;
      uint64_t v38 = 218LL;
      goto LABEL_24;
    }

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      session = self->_session;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[STAEAExtractor asymmetricDecryptionKey](self, "asymmetricDecryptionKey"));
      id v15 = [v14 length];
      *(_DWORD *)buf = 138412802;
      v71 = session;
      __int16 v72 = 2082;
      v73 = "-[STAEAExtractor aeaContextCallback:]";
      __int16 v74 = 2048;
      id v75 = v15;
      _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_DEFAULT,  "[%@] %{public}s: Setting asymmetric key on AEA context (%lu bytes)",  buf,  0x20u);
    }

    id v16 = objc_claimAutoreleasedReturnValue(-[STAEAExtractor asymmetricDecryptionKey](self, "asymmetricDecryptionKey"));
    uint64_t v17 = (const uint8_t *)[v16 bytes];
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[STAEAExtractor asymmetricDecryptionKey](self, "asymmetricDecryptionKey"));
    id v19 = [v18 length];
    v20 = a3;
    AEAContextField v21 = 11;
    AEAContextFieldRepresentation v22 = 1;
  }

  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[STAEAExtractor symmetricDecryptionKey](self, "symmetricDecryptionKey"));

    if (!v23) {
      goto LABEL_17;
    }
    v24 = sub_23DC();
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    uint64_t v26 = v25;
    if (!a3)
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_4F28();
      }

      v65 = STExtractorErrorDomain;
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No AEA context and decryption key was provided. Archive is not encrypted."));
      v36 = v65;
      uint64_t v37 = v6;
      uint64_t v38 = 223LL;
      goto LABEL_24;
    }

    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v27 = self->_session;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[STAEAExtractor asymmetricDecryptionKey](self, "asymmetricDecryptionKey"));
      id v29 = [v28 length];
      *(_DWORD *)buf = 138412802;
      v71 = v27;
      __int16 v72 = 2082;
      v73 = "-[STAEAExtractor aeaContextCallback:]";
      __int16 v74 = 2048;
      id v75 = v29;
      _os_log_impl( &dword_0,  v26,  OS_LOG_TYPE_DEFAULT,  "[%@] %{public}s: Setting symmetric key on AEA context (%lu bytes)",  buf,  0x20u);
    }

    id v16 = objc_claimAutoreleasedReturnValue(-[STAEAExtractor symmetricDecryptionKey](self, "symmetricDecryptionKey"));
    uint64_t v17 = (const uint8_t *)[v16 bytes];
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[STAEAExtractor symmetricDecryptionKey](self, "symmetricDecryptionKey"));
    id v19 = [v18 length];
    v20 = a3;
    AEAContextField v21 = 9;
    AEAContextFieldRepresentation v22 = 0;
  }

  int v30 = AEAContextSetFieldBlob(v20, v21, v22, v17, (size_t)v19);

  if (v30 == -1)
  {
    v46 = sub_23DC();
    v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      sub_4FC4();
    }

    v48 = STExtractorErrorDomain;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to set encryption key on extractor context"));
    v36 = v48;
    uint64_t v37 = v6;
    uint64_t v38 = 228LL;
    goto LABEL_24;
  }

- (int)processEntryMessage:(unsigned int)a3 path:(const char *)a4 data:(void *)a5
{
  if (a3 == 92 && !-[STAEAExtractor isComplete](self, "isComplete", *(void *)&a3, a4, a5))
  {
    -[STAEAExtractor setIsComplete:](self, "setIsComplete:", 1LL);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[STAEAExtractor delegate](self, "delegate"));
    [v6 extractionCompleteAtArchivePath:self->_path];
  }

  return 0;
}

- (void)prepareForExtractionToPath:(id)a3 withCompletionBlock:(id)a4
{
  id v7 = a3;
  unsigned __int8 v8 = (void (**)(id, void, void *))a4;
  v9 = sub_23DC();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    session = self->_session;
    *(_DWORD *)buf = 138412802;
    v61 = session;
    __int16 v62 = 2082;
    v63 = "-[STAEAExtractor prepareForExtractionToPath:withCompletionBlock:]";
    __int16 v64 = 2112;
    int64_t v65 = (int64_t)v7;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "[%@] %{public}s: Preparing to extract to %@", buf, 0x20u);
  }

  objc_storeStrong((id *)&self->_path, a3);
  AAThreadErrorContextEnter();
  id v12 = v7;
  p_int64_t offset = &self->_offset;
  v14 = (AAAssetExtractor_impl *)AAAssetExtractorCreate([v12 UTF8String], &self->_offset, 2);
  self->_extractor = v14;
  id v15 = sub_23DC();
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  uint64_t v17 = v16;
  if (!v14)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_52D0();
    }

    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Couldn't create extractor"));
    v32 = v31;
    uint64_t v33 = 331LL;
    goto LABEL_31;
  }

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v18 = self->_session;
    int64_t offset = self->_offset;
    *(_DWORD *)buf = 138412802;
    v61 = v18;
    __int16 v62 = 2082;
    v63 = "-[STAEAExtractor prepareForExtractionToPath:withCompletionBlock:]";
    __int16 v64 = 2048;
    int64_t v65 = offset;
    _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "[%@] %{public}s: starting extraction offset: %llu", buf, 0x20u);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[STAEAExtractor sourceDirectory](self, "sourceDirectory"));
  if (!v20)
  {
LABEL_10:
    uint64_t v26 = AAAssetExtractorSetParameterCallback(self->_extractor, 102LL, sub_3988);
    if ((_DWORD)v26)
    {
      uint64_t v34 = v26;
      v35 = sub_23DC();
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        sub_5540();
      }

      v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Couldn't set extractor context callback, returned %d",  v34));
      v32 = v31;
      uint64_t v33 = 346LL;
    }

    else
    {
      uint64_t v27 = AAAssetExtractorSetParameterCallback(self->_extractor, 103LL, STAEAProgressCallback);
      if ((_DWORD)v27)
      {
        uint64_t v37 = v27;
        uint64_t v38 = sub_23DC();
        id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          sub_54A4();
        }

        v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Couldn't set extractor progress callback, returned %d",  v37));
        v32 = v31;
        uint64_t v33 = 349LL;
      }

      else
      {
        uint64_t v28 = AAAssetExtractorSetParameterCallback(self->_extractor, 104LL, STAEAEntryMessageCallback);
        if ((_DWORD)v28)
        {
          uint64_t v40 = v28;
          uint64_t v41 = sub_23DC();
          id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
            sub_5408();
          }

          v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Couldn't set extractor entry message callback, returned %d",  v40));
          v32 = v31;
          uint64_t v33 = 352LL;
        }

        else
        {
          uint64_t v29 = AAAssetExtractorSetParameterPtr(self->_extractor, 101LL, self);
          if (!(_DWORD)v29)
          {
            AAThreadErrorContextLeave(0LL);
            int v30 = 0LL;
            goto LABEL_15;
          }

          uint64_t v43 = v29;
          v44 = sub_23DC();
          int v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
            sub_536C();
          }

          v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Couldn't set extractor progress arg, returned %d",  v43));
          v32 = v31;
          uint64_t v33 = 355LL;
        }
      }
    }

- (void)supplyBytes:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, BOOL))a4;
  uint64_t v35 = 0LL;
  v36 = &v35;
  uint64_t v37 = 0x3032000000LL;
  uint64_t v38 = sub_3D6C;
  id v39 = sub_3D7C;
  id v40 = 0LL;
  id v8 = [v6 length];
  uint64_t v31 = 0LL;
  v32 = &v31;
  uint64_t v33 = 0x2020000000LL;
  char v34 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[STAEAExtractor error](self, "error"));
  BOOL v10 = v9 == 0LL;

  if (v10)
  {
    if (self->_extractor)
    {
      v11 = sub_23DC();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        session = self->_session;
        int64_t offset = self->_offset;
        *(_DWORD *)buf = 138413058;
        id v42 = session;
        __int16 v43 = 2082;
        v44 = "-[STAEAExtractor supplyBytes:withCompletionBlock:]";
        __int16 v45 = 2048;
        id v46 = v8;
        __int16 v47 = 2048;
        int64_t v48 = offset;
        _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_DEFAULT,  "[%@] %{public}s: Received %zu bytes for extraction, offset %lld",  buf,  0x2Au);
      }

      AAThreadErrorContextEnter();
      *((_BYTE *)v32 + 24) = 1;
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = sub_3D84;
      v30[3] = &unk_8270;
      v30[4] = self;
      v30[5] = &v35;
      v30[6] = &v31;
      v30[7] = v8;
      [v6 enumerateByteRangesUsingBlock:v30];
    }

    else
    {
      v23 = sub_23DC();
      id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_57B0();
      }

      uint64_t v25 = STExtractorErrorDomain;
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Extractor is NULL"));
      id v27 = sub_23C8( v25,  1LL,  v26,  0LL,  (uint64_t)"-[STAEAExtractor supplyBytes:withCompletionBlock:]",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/AEAExtractionPlugin/STAEAExtractorPlugin.m",  376LL);
      uint64_t v28 = objc_claimAutoreleasedReturnValue(v27);
      uint64_t v29 = (void *)v36[5];
      v36[5] = v28;
    }
  }

  else
  {
    AEAContextField v21 = sub_23DC();
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_584C();
    }
  }

  if (*((_BYTE *)v32 + 24)) {
    AAThreadErrorContextLeave(0LL);
  }
  if (v36[5])
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[STAEAExtractor error](self, "error"));
    BOOL v16 = v15 == 0LL;

    if (v16) {
      -[STAEAExtractor setError:](self, "setError:", v36[5]);
    }
  }

  else
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[STAEAExtractor error](self, "error"));
    BOOL v18 = v17 == 0LL;

    if (!v18)
    {
      uint64_t v19 = objc_claimAutoreleasedReturnValue(-[STAEAExtractor error](self, "error"));
      v20 = (void *)v36[5];
      v36[5] = v19;
    }
  }

  v7[2](v7, v36[5], -[STAEAExtractor isComplete](self, "isComplete") != 0);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
}

- (void)suspendStreamWithCompletionBlock:(id)a3
{
  v4 = (void (**)(id, int64_t, void *))a3;
  v5 = sub_23DC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    session = self->_session;
    *(_DWORD *)buf = 138412546;
    uint64_t v33 = session;
    __int16 v34 = 2082;
    uint64_t v35 = "-[STAEAExtractor suspendStreamWithCompletionBlock:]";
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "[%@] %{public}s: Suspending extraction", buf, 0x16u);
  }

  if (!self->_extractor)
  {
    uint64_t v17 = sub_23DC();
    BOOL v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_59D0();
    }

    uint64_t v19 = STExtractorErrorDomain;
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No extractor to suspend"));
    id v21 = sub_23C8( v19,  7LL,  v20,  0LL,  (uint64_t)"-[STAEAExtractor suspendStreamWithCompletionBlock:]",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/AEAExtractionPlugin/STAEAExtractorPlugin.m",  461LL);
    uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
    goto LABEL_14;
  }

  AAThreadErrorContextEnter();
  id v8 = sub_23DC();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v10 = self->_session;
    *(_DWORD *)buf = 138412546;
    uint64_t v33 = v10;
    __int16 v34 = 2082;
    uint64_t v35 = "-[STAEAExtractor suspendStreamWithCompletionBlock:]";
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "[%@] %{public}s: Calling AAAssetExtractorDestroy()", buf, 0x16u);
  }

  uint64_t v11 = AAAssetExtractorDestroy(self->_extractor, &self->_offset);
  self->_extractor = 0LL;
  if (v11 >= 2)
  {
    uint64_t v29 = sub_23DC();
    int v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_5A4C();
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"failed to suspend stream: %d",  v11));
    id v31 = STCreateAEAError( v20,  (uint64_t)"-[STAEAExtractor suspendStreamWithCompletionBlock:]",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/AEAExtractionPlugin/STAEAExtractorPlugin.m",  449LL);
    uint64_t v22 = objc_claimAutoreleasedReturnValue(v31);
LABEL_14:
    v23 = (void *)v22;

    goto LABEL_19;
  }

  id v12 = sub_23DC();
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v11 == 1)
  {
    if (v14)
    {
      id v15 = self->_session;
      int64_t offset = self->_offset;
      *(_DWORD *)buf = 138412802;
      uint64_t v33 = v15;
      __int16 v34 = 2082;
      uint64_t v35 = "-[STAEAExtractor suspendStreamWithCompletionBlock:]";
      __int16 v36 = 2048;
      int64_t v37 = offset;
      _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_DEFAULT,  "[%@] %{public}s: successfully suspended stream with offset: %llu",  buf,  0x20u);
    }
  }

  else
  {
    if (v14)
    {
      id v24 = self->_session;
      int64_t v25 = self->_offset;
      *(_DWORD *)buf = 138412802;
      uint64_t v33 = v24;
      __int16 v34 = 2082;
      uint64_t v35 = "-[STAEAExtractor suspendStreamWithCompletionBlock:]";
      __int16 v36 = 2048;
      int64_t v37 = v25;
      _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_DEFAULT,  "[%@] %{public}s: AAAssetExtractorDestroy() was successful but stream was not suspended (offset: %llu) - stream w as already complete",  buf,  0x20u);
    }

    self->_int64_t offset = 0LL;
  }

  AAThreadErrorContextLeave(0LL);
  v23 = 0LL;
LABEL_19:
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[STAEAExtractor error](self, "error"));

  if (!v26 && v23) {
    -[STAEAExtractor setError:](self, "setError:", v23);
  }
  int64_t v27 = self->_offset;
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[STAEAExtractor error](self, "error"));
  v4[2](v4, v27, v28);
}

- (void)finishStreamWithCompletionBlock:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = sub_23DC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    session = self->_session;
    *(_DWORD *)buf = 138412546;
    uint64_t v22 = session;
    __int16 v23 = 2082;
    id v24 = "-[STAEAExtractor finishStreamWithCompletionBlock:]";
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "[%@] %{public}s: Finishing extraction", buf, 0x16u);
  }

  p_extractor = &self->_extractor;
  if (!self->_extractor) {
    goto LABEL_12;
  }
  AAThreadErrorContextEnter();
  v9 = sub_23DC();
  BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = self->_session;
    *(_DWORD *)buf = 138412546;
    uint64_t v22 = v11;
    __int16 v23 = 2082;
    id v24 = "-[STAEAExtractor finishStreamWithCompletionBlock:]";
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "[%@] %{public}s: Calling AAAssetExtractorDestroy()", buf, 0x16u);
  }

  uint64_t v12 = AAAssetExtractorDestroy(*p_extractor, 0LL);
  *p_extractor = 0LL;
  self->_int64_t offset = 0LL;
  if (!(_DWORD)v12)
  {
    AAThreadErrorContextLeave(0LL);
LABEL_12:
    uint64_t v19 = 0LL;
    goto LABEL_15;
  }

  uint64_t v13 = v12;
  BOOL v14 = sub_23DC();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_5AE8();
  }

  if ((int)v13 < 1)
  {
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Couldn't destroy extractor (%d)",  v13));
    uint64_t v17 = v16;
    uint64_t v18 = 498LL;
  }

  else
  {
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Extraction not complete (%d)",  v13));
    uint64_t v17 = v16;
    uint64_t v18 = 496LL;
  }

  id v20 = STCreateAEAError( v16,  (uint64_t)"-[STAEAExtractor finishStreamWithCompletionBlock:]",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/AEAExtractionPlugin/STAEAExtractorPlugin.m",  v18);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v20);

LABEL_15:
  v4[2](v4, v19);
}

- (void)terminateStreamWithError:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v8 = sub_23DC();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_5BC0();
  }

  p_extractor = &self->_extractor;
  if (self->_extractor)
  {
    uint64_t v11 = sub_23DC();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      session = self->_session;
      int v17 = 138412546;
      uint64_t v18 = session;
      __int16 v19 = 2082;
      id v20 = "-[STAEAExtractor terminateStreamWithError:completionBlock:]";
      _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_DEFAULT,  "[%@] %{public}s: Calling AAAssetExtractorDestroy",  (uint8_t *)&v17,  0x16u);
    }

    int v14 = AAAssetExtractorDestroy(*p_extractor, 0LL);
    *p_extractor = 0LL;
    self->_int64_t offset = 0LL;
    if (v14)
    {
      id v15 = sub_23DC();
      BOOL v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_5B54();
      }
    }
  }

  v7[2](v7, v6);
}

- (NSDictionary)options
{
  return self->_options;
}

- (STExtractionPluginDelegate)delegate
{
  return (STExtractionPluginDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (unsigned)isComplete
{
  return self->_isComplete;
}

- (void)setIsComplete:(unsigned __int8)a3
{
  self->_isComplete = a3;
}

- (NSData)symmetricDecryptionKey
{
  return self->_symmetricDecryptionKey;
}

- (NSData)asymmetricDecryptionKey
{
  return self->_asymmetricDecryptionKey;
}

- (NSData)signingPublicKey
{
  return self->_signingPublicKey;
}

- (NSString)sourceDirectory
{
  return self->_sourceDirectory;
}

- (NSString)sourceDirectorySandboxExtension
{
  return self->_sourceDirectorySandboxExtension;
}

- (unint64_t)sandboxToken
{
  return self->_sandboxToken;
}

- (void)setSandboxToken:(unint64_t)a3
{
  self->_sandboxToken = a3;
}

- (NSData)archiveID
{
  return self->_archiveID;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end
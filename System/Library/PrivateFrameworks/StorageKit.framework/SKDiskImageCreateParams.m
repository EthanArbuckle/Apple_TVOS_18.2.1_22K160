@interface SKDiskImageCreateParams
- (BOOL)stdinPassPhrase;
- (NSString)volumeName;
- (NSURL)source;
- (SKDiskImageCreateParams)initWithDisk:(id)a3;
- (SKDiskImageCreateParams)initWithDisk:(id)a3 format:(int64_t)a4;
- (SKDiskImageCreateParams)initWithDiskImage:(id)a3;
- (SKDiskImageCreateParams)initWithDiskImage:(id)a3 format:(int64_t)a4;
- (SKDiskImageCreateParams)initWithFormat:(int64_t)a3 sourceURL:(id)a4;
- (SKDiskImageCreateParams)initWithNumBlocks:(unint64_t)a3 volumeName:(id)a4;
- (SKDiskImageCreateParams)initWithNumBlocks:(unint64_t)a3 volumeName:(id)a4 format:(int64_t)a5;
- (id)description;
- (id)diConvertParamsWithOutputURL:(id)a3 error:(id *)a4;
- (id)diCreateParamsWithURL:(id)a3 error:(id *)a4;
- (id)redactedDescription;
- (int64_t)encryption;
- (int64_t)format;
- (unint64_t)numBlocks;
- (void)setEncryption:(int64_t)a3;
- (void)setFormat:(int64_t)a3;
- (void)setNumBlocks:(unint64_t)a3;
- (void)setSource:(id)a3;
- (void)setStdinPassPhrase:(BOOL)a3;
- (void)setVolumeName:(id)a3;
@end

@implementation SKDiskImageCreateParams

- (SKDiskImageCreateParams)initWithNumBlocks:(unint64_t)a3 volumeName:(id)a4
{
  return -[SKDiskImageCreateParams initWithNumBlocks:volumeName:format:]( self,  "initWithNumBlocks:volumeName:format:",  a3,  a4,  1LL);
}

- (SKDiskImageCreateParams)initWithNumBlocks:(unint64_t)a3 volumeName:(id)a4 format:(int64_t)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SKDiskImageCreateParams;
  v10 = -[SKDiskImageCreateParams init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_format = a5;
    v10->_numBlocks = a3;
    objc_storeStrong((id *)&v10->_volumeName, a4);
    v11->_stdinPassPhrase = 0;
    v11->_encryption = 0LL;
  }

  return v11;
}

- (SKDiskImageCreateParams)initWithFormat:(int64_t)a3 sourceURL:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SKDiskImageCreateParams;
  v8 = -[SKDiskImageCreateParams init](&v12, sel_init);
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_source, a4);
    v9->_format = a3;
    v9->_numBlocks = 0LL;
    volumeName = v9->_volumeName;
    v9->_volumeName = 0LL;

    v9->_stdinPassPhrase = 0;
    v9->_encryption = 0LL;
  }

  return v9;
}

- (SKDiskImageCreateParams)initWithDisk:(id)a3
{
  return -[SKDiskImageCreateParams initWithDisk:format:](self, "initWithDisk:format:", a3, 4LL);
}

- (SKDiskImageCreateParams)initWithDisk:(id)a3 format:(int64_t)a4
{
  v6 = (void *)MEMORY[0x189604030];
  id v7 = (void *)NSString;
  [a3 diskIdentifier];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 stringWithFormat:@"/dev/%@", v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 fileURLWithPath:v9];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SKDiskImageCreateParams initWithFormat:sourceURL:](self, "initWithFormat:sourceURL:", a4, v10);

  return v11;
}

- (SKDiskImageCreateParams)initWithDiskImage:(id)a3
{
  return -[SKDiskImageCreateParams initWithDiskImage:format:](self, "initWithDiskImage:format:", a3, 4LL);
}

- (SKDiskImageCreateParams)initWithDiskImage:(id)a3 format:(int64_t)a4
{
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = -[SKDiskImageCreateParams initWithFormat:sourceURL:](self, "initWithFormat:sourceURL:", a4, v6);

  return v7;
}

- (id)redactedDescription
{
  v3 = (void *)NSString;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@: { source: %@, format: %d, numBlocks: %lld }>", v5, self->_source, self->_format, self->_numBlocks];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)description
{
  v3 = (void *)NSString;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@: { source: %@, format: %d, numBlocks: %lld, volumeName: %@ }>", v5, self->_source, self->_format, self->_numBlocks, self->_volumeName];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)diCreateParamsWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = -[SKDiskImageCreateParams format](self, "format");
  if (v7 == 1)
  {
    v8 = (Class *)0x18960F210LL;
  }

  else
  {
    if (v7 != 6)
    {
      +[SKError nilWithSKErrorCode:error:](&OBJC_CLASS___SKError, "nilWithSKErrorCode:error:", 250LL, a4);
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }

    v8 = (Class *)0x18960F218LL;
  }

  id v9 = (void *)objc_msgSend( objc_alloc(*v8),  "initWithURL:numBlocks:error:",  v6,  -[SKDiskImageCreateParams numBlocks](self, "numBlocks"),  a4);
  BOOL v10 = -[SKDiskImageCreateParams stdinPassPhrase](self, "stdinPassPhrase");
  uint64_t v11 = [v9 readPassphraseFlags];
  if (v10) {
    uint64_t v12 = v11 | 8;
  }
  else {
    uint64_t v12 = v11;
  }
  [v9 setReadPassphraseFlags:v12];
  int64_t v13 = -[SKDiskImageCreateParams encryption](self, "encryption");
  if (v13 == 2) {
    uint64_t v14 = 2LL;
  }
  else {
    uint64_t v14 = v13 == 1;
  }
  [v9 setEncryptionMethod:v14];
LABEL_13:

  return v9;
}

- (id)diConvertParamsWithOutputURL:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  [v6 URLByResolvingSymlinksInPath];
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 absoluteString];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKDiskImageCreateParams source](self, "source");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 URLByResolvingSymlinksInPath];
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 absoluteString];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  int v12 = [v8 isEqualToString:v11];

  if (v12)
  {
    SKGetOSLog();
    int64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[SKDiskImageCreateParams source](self, "source");
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      int v29 = 136315394;
      v30 = "-[SKDiskImageCreateParams diConvertParamsWithOutputURL:error:]";
      __int16 v31 = 2112;
      v32 = v14;
      _os_log_impl(&dword_188F75000, v13, OS_LOG_TYPE_DEFAULT, "%s: Creating image in place %@", (uint8_t *)&v29, 0x16u);
    }

    id v15 = objc_alloc(MEMORY[0x18960F208]);
    v16 = -[SKDiskImageCreateParams source](self, "source");
    uint64_t v17 = [v15 initForInplaceWithURL:v16 error:a4];
  }

  else
  {
    id v18 = objc_alloc(MEMORY[0x18960F208]);
    v16 = -[SKDiskImageCreateParams source](self, "source");
    uint64_t v17 = [v18 initWithInputURL:v16 outputURL:v6 error:a4];
  }

  v19 = (void *)v17;

  if (v19)
  {
    unint64_t v20 = -[SKDiskImageCreateParams format](self, "format") - 1;
    if (v20 >= 6)
    {
      +[SKError nilWithSKErrorCode:error:](&OBJC_CLASS___SKError, "nilWithSKErrorCode:error:", 250LL, a4);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      [v19 setOutputFormat:qword_188FA2758[v20]];
      BOOL v21 = -[SKDiskImageCreateParams stdinPassPhrase](self, "stdinPassPhrase");
      uint64_t v22 = [v19 readPassphraseFlags];
      if (v21) {
        uint64_t v23 = v22 | 8;
      }
      else {
        uint64_t v23 = v22;
      }
      [v19 setReadPassphraseFlags:v23];
      int64_t v24 = -[SKDiskImageCreateParams encryption](self, "encryption");
      if (v24 == 2) {
        uint64_t v25 = 2LL;
      }
      else {
        uint64_t v25 = v24 == 1;
      }
      [v19 setEncryptionMethod:v25];
      id v26 = v19;
    }

    v27 = v26;
  }

  else
  {
    v27 = 0LL;
  }

  return v27;
}

- (int64_t)encryption
{
  return self->_encryption;
}

- (void)setEncryption:(int64_t)a3
{
  self->_encryption = a3;
}

- (BOOL)stdinPassPhrase
{
  return self->_stdinPassPhrase;
}

- (void)setStdinPassPhrase:(BOOL)a3
{
  self->_stdinPassPhrase = a3;
}

- (int64_t)format
{
  return self->_format;
}

- (void)setFormat:(int64_t)a3
{
  self->_format = a3;
}

- (unint64_t)numBlocks
{
  return self->_numBlocks;
}

- (void)setNumBlocks:(unint64_t)a3
{
  self->_numBlocks = a3;
}

- (NSString)volumeName
{
  return self->_volumeName;
}

- (void)setVolumeName:(id)a3
{
}

- (NSURL)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
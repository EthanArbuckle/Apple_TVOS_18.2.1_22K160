@interface SUCoreUpdateDownloaderParam
- (NSError)error;
- (NSString)note;
- (SUCoreProgress)progress;
- (SUCoreUpdateDownloaderParam)init;
- (SUCoreUpdateDownloaderParam)initWithError:(id)a3;
- (SUCoreUpdateDownloaderParam)initWithNote:(id)a3;
- (SUCoreUpdateDownloaderParam)initWithProgress:(id)a3;
- (id)description;
@end

@implementation SUCoreUpdateDownloaderParam

- (SUCoreUpdateDownloaderParam)initWithProgress:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SUCoreUpdateDownloaderParam;
  v6 = -[SUCoreUpdateDownloaderParam init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_progress, a3);
    v7->_type = 1;
  }

  return v7;
}

- (SUCoreUpdateDownloaderParam)initWithError:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SUCoreUpdateDownloaderParam;
  v6 = -[SUCoreUpdateDownloaderParam init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_error, a3);
    v7->_type = 2;
  }

  return v7;
}

- (SUCoreUpdateDownloaderParam)initWithNote:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SUCoreUpdateDownloaderParam;
  v6 = -[SUCoreUpdateDownloaderParam init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_note, a3);
    v7->_type = 3;
  }

  return v7;
}

- (SUCoreUpdateDownloaderParam)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SUCoreUpdateDownloaderParam;
  result = -[SUCoreUpdateDownloaderParam init](&v3, sel_init);
  if (result) {
    result->_type = 0;
  }
  return result;
}

- (id)description
{
  uint64_t type = self->_type;
  if ((_DWORD)type == 3)
  {
    v7 = (void *)NSString;
    v4 = -[SUCoreUpdateDownloaderParam note](self, "note");
    [v7 stringWithFormat:@"\n[>>>\n    note: %@\n<<<]", v4];
LABEL_7:
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }

  if ((_DWORD)type == 2)
  {
    v8 = (void *)NSString;
    v4 = -[SUCoreUpdateDownloaderParam error](self, "error");
    [v8 stringWithFormat:@"\n[>>>\n    error: %@\n<<<]", v4];
    goto LABEL_7;
  }

  if ((_DWORD)type != 1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"NO_INFO[%d]", type);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    return v6;
  }

  objc_super v3 = (void *)NSString;
  v4 = -[SUCoreUpdateDownloaderParam progress](self, "progress");
  [v4 summary];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"\n[>>>\n    progress: %@\n<<<]", v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v6;
}

- (SUCoreProgress)progress
{
  return self->_progress;
}

- (NSError)error
{
  return self->_error;
}

- (NSString)note
{
  return self->_note;
}

- (void).cxx_destruct
{
}

@end
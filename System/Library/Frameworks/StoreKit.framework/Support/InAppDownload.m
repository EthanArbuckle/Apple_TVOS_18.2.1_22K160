@interface InAppDownload
- (InAppDownload)initWithIdentifier:(id)a3 transactionIdentifier:(id)a4 info:(id)a5;
- (InAppDownloadTask)task;
- (NSDictionary)info;
- (NSNumber)identifier;
- (NSString)transactionIdentifier;
- (void)setTask:(id)a3;
@end

@implementation InAppDownload

- (InAppDownload)initWithIdentifier:(id)a3 transactionIdentifier:(id)a4 info:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___InAppDownload;
  v12 = -[InAppDownload init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_info, a5);
    objc_storeStrong((id *)&v13->_transactionIdentifier, a4);
  }

  return v13;
}

- (NSNumber)identifier
{
  return self->_identifier;
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (NSDictionary)info
{
  return self->_info;
}

- (InAppDownloadTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
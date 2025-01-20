@interface MCMAMFIEncodedQuery
- (MCMAMFIEncodedQuery)initWithLoggingName:(id)a3 encodedQuery:(id)a4;
- (NSData)encodedQuery;
- (NSString)loggingName;
@end

@implementation MCMAMFIEncodedQuery

- (MCMAMFIEncodedQuery)initWithLoggingName:(id)a3 encodedQuery:(id)a4
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MCMAMFIEncodedQuery;
  v9 = -[MCMAMFIEncodedQuery init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_loggingName, a3);
    objc_storeStrong((id *)&v10->_encodedQuery, a4);
  }

  return v10;
}

- (NSString)loggingName
{
  return self->_loggingName;
}

- (NSData)encodedQuery
{
  return self->_encodedQuery;
}

- (void).cxx_destruct
{
}

@end
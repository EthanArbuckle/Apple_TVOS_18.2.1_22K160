@interface SAOutputStream
- (int)appendData:(id)a3;
- (int)appendString:(id)a3;
- (int)printWithFormat:(id)a3;
@end

@implementation SAOutputStream

- (int)printWithFormat:(id)a3
{
  v4 = (objc_class *)NSString;
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v8];

  LODWORD(self) = -[SAOutputStream appendString:](self, "appendString:", v6);
  return (int)self;
}

- (int)appendString:(id)a3
{
  id v4 = a3;
  size_t v5 = [v4 lengthOfBytesUsingEncoding:4];
  if (v5)
  {
    size_t v6 = v5;
    v7 = malloc(v5);
    if ([v4 getCString:v7 maxLength:v6 encoding:4])
    {
      int v8 = -[SAOutputStream write:maxLength:](self, "write:maxLength:", v7, v6);
    }

    else
    {
      v9 = (void *)MEMORY[0x186E47ACC]();
      [v4 dataUsingEncoding:4 allowLossyConversion:1];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10) {
        int v8 = -[SAOutputStream appendData:](self, "appendData:", v10);
      }
      else {
        int v8 = 0;
      }

      objc_autoreleasePoolPop(v9);
    }

    free(v7);
  }

  else
  {
    int v8 = 0;
  }

  return v8;
}

- (int)appendData:(id)a3
{
  id v3 = a3;
  int v4 = *__error();
  _sa_logt();
  size_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)int v8 = 0;
    _os_log_error_impl( &dword_186C92000,  v5,  OS_LOG_TYPE_ERROR,  "Called appendData: on the superclass. Subclasses implement this.",  v8,  2u);
  }

  *__error() = v4;
  [MEMORY[0x189603F70] exceptionWithName:@"SAOutputStream implementation error" reason:@"subclass must implement appendData" userInfo:0];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
  return -[SAFileOutputStream initWithFileStream:]();
}

@end
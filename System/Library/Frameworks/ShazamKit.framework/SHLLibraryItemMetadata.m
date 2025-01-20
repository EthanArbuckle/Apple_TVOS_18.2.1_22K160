@interface SHLLibraryItemMetadata
- (BOOL)validEncodedSystemData:(id)a3;
- (NSData)encodedSystemData;
- (SHLLibraryItemMetadata)initWithEncodedSystemData:(id)a3;
- (SHLLibraryItemMetadata)initWithMetadata:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation SHLLibraryItemMetadata

- (SHLLibraryItemMetadata)initWithEncodedSystemData:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SHLLibraryItemMetadata;
  v6 = -[SHLLibraryItemMetadata init](&v13, "init");
  v7 = v6;
  if (!v6) {
    goto LABEL_4;
  }
  if (-[SHLLibraryItemMetadata validEncodedSystemData:](v6, "validEncodedSystemData:", v5))
  {
    objc_storeStrong((id *)&v7->_encodedSystemData, a3);
LABEL_4:

    return v7;
  }

  id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSException shl_exceptionWithName:reason:]( &OBJC_CLASS___NSException,  "shl_exceptionWithName:reason:",  NSInvalidArgumentException,  @"You must provide a valid encoded data."));
  objc_exception_throw(v9);
  return -[SHLLibraryItemMetadata initWithMetadata:](v10, v11, v12);
}

- (SHLLibraryItemMetadata)initWithMetadata:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SHLLibraryItemMetadata;
  id v5 = -[SHLLibraryItemMetadata init](&v10, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 encodedSystemData]);
    v7 = (NSData *)[v6 copy];
    encodedSystemData = v5->_encodedSystemData;
    v5->_encodedSystemData = v7;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SHLLibraryItemMetadata initWithMetadata:]( +[SHLLibraryItemMetadata allocWithZone:](&OBJC_CLASS___SHLLibraryItemMetadata, "allocWithZone:", a3),  "initWithMetadata:",  self);
}

- (BOOL)validEncodedSystemData:(id)a3
{
  return [a3 length] != 0;
}

- (NSData)encodedSystemData
{
  return self->_encodedSystemData;
}

- (void).cxx_destruct
{
}

@end
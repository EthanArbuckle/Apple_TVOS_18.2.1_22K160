@interface _LSSynthesizedExtensionPointRecord
+ (BOOL)supportsSecureCoding;
- (_LSSynthesizedExtensionPointRecord)initWithCoder:(id)a3;
- (_LSSynthesizedExtensionPointRecord)initWithIdentifier:(id)a3;
- (id)_initWithContext:(LSContext *)a3 persistentIdentifierData:(const LSPersistentIdentifierData *)a4 length:(unint64_t)a5;
- (id)_persistentIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)identifier;
- (id)parentAppRecord;
- (id)version;
- (unsigned)TCCPolicy;
- (unsigned)extensionPointType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _LSSynthesizedExtensionPointRecord

- (_LSSynthesizedExtensionPointRecord)initWithIdentifier:(id)a3
{
  v4 = self;
  CurrentContext = (void **)_LSDatabaseContextGetCurrentContext((LaunchServices::DatabaseContext *)self);
  id v15 = 0LL;
  char v16 = 0;
  id v17 = 0LL;
  +[_LSDServiceDomain defaultServiceDomain]();
  v5 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v5, 0LL);

  if (!v6) {
    goto LABEL_4;
  }
  uint64_t v7 = *(unsigned int *)(*v6 + 1608LL);
  v13.receiver = v4;
  v13.super_class = (Class)&OBJC_CLASS____LSSynthesizedExtensionPointRecord;
  v6 = -[LSRecord _initWithContext:tableID:unitID:](&v13, sel__initWithContext_tableID_unitID_, v6, v7, 0LL);
  if (v6)
  {
    uint64_t v8 = [a3 copy];
    v4 = (_LSSynthesizedExtensionPointRecord *)v6[4];
    v6[4] = v8;
LABEL_4:
  }

  v9 = v6;
  if (CurrentContext && v16) {
    _LSContextDestroy(CurrentContext);
  }
  id v10 = v15;
  CurrentContext = 0LL;
  id v15 = 0LL;

  char v16 = 0;
  id v11 = v17;
  id v17 = 0LL;

  return v9;
}

- (id)_initWithContext:(LSContext *)a3 persistentIdentifierData:(const LSPersistentIdentifierData *)a4 length:(unint64_t)a5
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS____LSSynthesizedExtensionPointRecord;
  uint64_t v7 = -[LSRecord _initWithContext:persistentIdentifierData:length:]( &v10,  sel__initWithContext_persistentIdentifierData_length_,  a3);
  if (v7)
  {
    uint64_t v8 = (void *)[objc_alloc(NSString) initWithBytesNoCopy:a4->var5 length:a5 - 28 encoding:4 freeWhenDone:0];
    if (v8) {
      objc_storeStrong(v7 + 4, v8);
    }
  }

  return v7;
}

- (id)version
{
  return @"1.0";
}

- (id)parentAppRecord
{
  return 0LL;
}

- (unsigned)extensionPointType
{
  return 2;
}

- (unsigned)TCCPolicy
{
  return 1;
}

- (id)_persistentIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS____LSSynthesizedExtensionPointRecord;
  -[LSRecord _persistentIdentifierWithContext:tableID:unitID:unitBytes:]( &v12,  sel__persistentIdentifierWithContext_tableID_unitID_unitBytes_,  a3,  *(void *)&a4,  *(void *)&a5,  a6);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = (void *)[v7 mutableCopy];
  v9 = -[NSString dataUsingEncoding:](self->_identifier, "dataUsingEncoding:", 4LL);
  if (v9) {
    [v8 appendData:v9];
  }

  objc_super v10 = (void *)[v8 copy];
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____LSSynthesizedExtensionPointRecord;
  -[LSRecord encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeObject:self->_identifier forKey:@"identifier"];
}

- (_LSSynthesizedExtensionPointRecord)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____LSSynthesizedExtensionPointRecord;
  v4 = -[LSRecord initWithCoder:](&v8, sel_initWithCoder_);
  if (v4)
  {
    uint64_t v5 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"identifier");
    identifier = v4->_identifier;
    v4->_identifier = (NSString *)v5;
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS____LSSynthesizedExtensionPointRecord;
  v4 = -[LSRecord copyWithZone:](&v7, sel_copyWithZone_, a3);
  uint64_t v5 = v4;
  if (v4) {
    objc_storeStrong(v4 + 4, self->_identifier);
  }
  return v5;
}

- (id)identifier
{
  return objc_getProperty(self, a2, 32LL, 1);
}

- (void).cxx_destruct
{
}

@end
@interface CUFileItem
- (CUFileItem)initWithDictionary:(id)a3 error:(id *)a4;
- (NSString)name;
- (id)description;
- (int)type;
- (int64_t)size;
- (unsigned)flags;
- (void)encodeWithDictionary:(id)a3;
- (void)setName:(id)a3;
- (void)setSize:(int64_t)a3;
- (void)setType:(int)a3;
@end

@implementation CUFileItem

- (CUFileItem)initWithDictionary:(id)a3 error:(id *)a4
{
  v6 = (const __CFDictionary *)a3;
  v7 = -[CUFileItem init](self, "init");
  if (v7)
  {
    unsigned int Int64Ranged = CFDictionaryGetInt64Ranged(v6, &unk_189F523B0, 0LL, 0xFFFFFFFFLL, &v15);
    if (!v15) {
      v7->_flags = Int64Ranged;
    }
    CFTypeID TypeID = CFStringGetTypeID();
    CFDictionaryGetTypedValue(v6, &unk_189F523C8, TypeID, 0LL);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10) {
      objc_storeStrong((id *)&v7->_name, v10);
    }

    unint64_t Int64 = CFDictionaryGetInt64(v6, &unk_189F523E0, &v15);
    if (!v15) {
      v7->_size = Int64;
    }
    int v12 = CFDictionaryGetInt64Ranged(v6, &unk_189F523F8, 0xFFFFFFFF80000000LL, 0x7FFFFFFFLL, &v15);
    if (!v15) {
      v7->_type = v12;
    }
    v13 = v7;
  }

  else if (a4)
  {
    NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFFE5D4LL);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)encodeWithDictionary:(id)a3
{
  id v8 = a3;
  if (self->_flags)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setObject:v4 forKeyedSubscript:&unk_189F523B0];
  }

  name = self->_name;
  if (name) {
    [v8 setObject:name forKeyedSubscript:&unk_189F523C8];
  }
  if (self->_size)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithLongLong:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setObject:v6 forKeyedSubscript:&unk_189F523E0];
  }

  if (self->_type)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithInt:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setObject:v7 forKeyedSubscript:&unk_189F523F8];
  }
}

- (id)description
{
  return NSPrintF();
}

- (unsigned)flags
{
  return self->_flags;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int64_t)size
{
  return self->_size;
}

- (void)setSize:(int64_t)a3
{
  self->_size = a3;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
}

@end
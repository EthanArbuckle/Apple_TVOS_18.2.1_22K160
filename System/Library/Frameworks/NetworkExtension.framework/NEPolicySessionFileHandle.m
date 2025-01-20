@interface NEPolicySessionFileHandle
- (NEPolicySessionFileHandle)initWithPolicySession:(id)a3;
- (NEPolicySessionFileHandle)initWithPolicySession:(id)a3 name:(id)a4;
- (NSString)name;
- (id)description;
- (id)dictionary;
- (id)initFromDictionary:(id)a3;
- (unint64_t)type;
@end

@implementation NEPolicySessionFileHandle

- (NEPolicySessionFileHandle)initWithPolicySession:(id)a3
{
  return -[NEPolicySessionFileHandle initWithPolicySession:name:]( self,  "initWithPolicySession:name:",  a3,  @"default");
}

- (NEPolicySessionFileHandle)initWithPolicySession:(id)a3 name:(id)a4
{
  id v7 = a4;
  uint64_t v8 = [a3 dupSocket];
  if ((v8 & 0x80000000) != 0)
  {
    v11 = 0LL;
  }

  else
  {
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___NEPolicySessionFileHandle;
    v9 = -[NEFileHandle initWithFileDescriptor:launchOwnerWhenReadable:]( &v13,  sel_initWithFileDescriptor_launchOwnerWhenReadable_,  v8,  0LL);
    v10 = v9;
    if (v9) {
      objc_storeStrong((id *)&v9->_name, a4);
    }
    self = v10;
    v11 = self;
  }

  return v11;
}

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NEPolicySessionFileHandle;
  v5 = -[NEFileHandle initFromDictionary:](&v10, sel_initFromDictionary_, v4);
  if (v5)
  {
    string = xpc_dictionary_get_string(v4, "session-name");
    if (string)
    {
      uint64_t v7 = [objc_alloc(NSString) initWithCString:string encoding:4];
      uint64_t v8 = (void *)v5[3];
      v5[3] = v7;
    }
  }

  return v5;
}

- (id)dictionary
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NEPolicySessionFileHandle;
  v3 = -[NEFileHandle dictionary](&v6, sel_dictionary);
  if (v3)
  {
    name = self->_name;
    if (name) {
      xpc_dictionary_set_string(v3, "session-name", -[NSString UTF8String](name, "UTF8String"));
    }
  }

  return v3;
}

- (id)description
{
  v3 = (void *)NSString;
  -[NEPolicySessionFileHandle name](self, "name");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NEFileHandle handle](self, "handle");
  [v3 stringWithFormat:@"Policy Session %@ socket (%d)", v4, objc_msgSend(v5, "fileDescriptor")];
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)type
{
  return 1LL;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void).cxx_destruct
{
}

@end
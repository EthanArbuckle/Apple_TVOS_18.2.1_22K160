@interface MCMXPCMessageSetCodeSignMapping
- (MCMXPCMessageSetCodeSignMapping)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (id)info;
- (id)options;
@end

@implementation MCMXPCMessageSetCodeSignMapping

- (MCMXPCMessageSetCodeSignMapping)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___MCMXPCMessageSetCodeSignMapping;
  v9 = -[MCMXPCMessageWithIdentifierBase initWithXPCObject:context:error:]( &v21,  sel_initWithXPCObject_context_error_,  v8,  a4,  a5);
  v10 = v9;
  if (!v9) {
    goto LABEL_12;
  }
  uint64_t v20 = 1LL;
  uint64_t v11 = -[MCMXPCMessageBase nsObjectFromXPCObject:key:error:]( v9,  "nsObjectFromXPCObject:key:error:",  v8,  "CodeSigningInfo",  &v20);
  id info = v10->_info;
  v10->_id info = (id)v11;

  unint64_t v13 = v20;
  if (!v10->_info && v20 != 1) {
    goto LABEL_13;
  }
  uint64_t v20 = 1LL;
  uint64_t v15 = -[MCMXPCMessageBase nsObjectFromXPCObject:key:error:]( v10,  "nsObjectFromXPCObject:key:error:",  v8,  "OptionsDictionary",  &v20);
  id options = v10->_options;
  v10->_id options = (id)v15;

  unint64_t v13 = v20;
  if (v10->_options || v20 == 1)
  {
LABEL_12:
    v18 = v10;
  }

  else
  {
LABEL_13:
    if (a5) {
      *a5 = v13;
    }
    v18 = 0LL;
  }

  return v18;
}

- (id)info
{
  return self->_info;
}

- (id)options
{
  return self->_options;
}

- (void).cxx_destruct
{
}

@end
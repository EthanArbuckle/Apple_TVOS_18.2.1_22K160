@interface NSXPCEncoder
- (BOOL)allowsKeyedCoding;
- (NSXPCEncoder)init;
- (NSXPCEncoder)initWithStackSpace:(char *)a3 size:(unint64_t)a4;
- (NSXPCEncoderDelegate)delegate;
- (id)_newRootXPCObject;
- (id)_replaceObject:(id)a3;
- (id)connection;
- (id)debugDescription;
- (id)finishEncoding;
- (unint64_t)_addOOLXPCObject:(id)a3;
- (void)_checkObject:(id)a3;
- (void)_encodeArrayOfObjects:(id)a3 forKey:(id)a4;
- (void)_encodeCString:(const char *)a3 length:(unint64_t)a4 forKey:(id)a5;
- (void)_encodeInvocation:(id)a3 isReply:(BOOL)a4 into:(id)a5;
- (void)_encodeInvocationObjectArgumentsOnly:(id *)a3 count:(unint64_t)a4 typeString:(const char *)a5 selector:(SEL)a6 isReply:(BOOL)a7 into:(id)a8;
- (void)_encodeObject:(id)a3;
- (void)_encodeUnkeyedObject:(id)a3;
- (void)_setConnection:(id)a3;
- (void)beginEncoding;
- (void)dealloc;
- (void)encodeBool:(BOOL)a3 forKey:(id)a4;
- (void)encodeBytes:(const char *)a3 length:(unint64_t)a4 forKey:(id)a5;
- (void)encodeConditionalObject:(id)a3 forKey:(id)a4;
- (void)encodeDouble:(double)a3 forKey:(id)a4;
- (void)encodeFloat:(float)a3 forKey:(id)a4;
- (void)encodeInt32:(int)a3 forKey:(id)a4;
- (void)encodeInt64:(int64_t)a3 forKey:(id)a4;
- (void)encodeInt:(int)a3 forKey:(id)a4;
- (void)encodeInteger:(int64_t)a3 forKey:(id)a4;
- (void)encodeObject:(id)a3;
- (void)encodeObject:(id)a3 forKey:(id)a4;
- (void)encodeValueOfObjCType:(const char *)a3 at:(const void *)a4;
- (void)encodeXPCObject:(id)a3 forKey:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation NSXPCEncoder

- (NSXPCEncoder)initWithStackSpace:(char *)a3 size:(unint64_t)a4
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSXPCEncoder;
  v6 = -[NSXPCCoder init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    _NSXPCSerializationStartWrite((uint64_t)&v6->_encoder, (uint64_t)a3, a4);
  }
  return v7;
}

- (void)setDelegate:(id)a3
{
}

- (void)_encodeInvocation:(id)a3 isReply:(BOOL)a4 into:(id)a5
{
  BOOL v6 = a4;
  unint64_t genericIndex = self->_genericIndex;
  self->_unint64_t genericIndex = 0LL;
  p_encoder = &self->_encoder;
  _NSXPCSerializationStartArrayWrite(self->_encoder.collectionSizeOffset);
  if (v6)
  {
    _NSXPCSerializationAddNull((uint64_t)p_encoder);
    int v11 = 1;
  }

  else
  {
    Name = (char *)sel_getName((SEL)[a3 selector]);
    size_t v13 = strlen(Name);
    _NSXPCSerializationAddASCIIString((uint64_t)p_encoder, Name, v13, 0);
    int v11 = 2;
  }

  v14 = (void *)[a3 methodSignature];
  v15 = (char *)[v14 _cTypeString];
  size_t v16 = strlen(v15);
  _NSXPCSerializationAddASCIIString((uint64_t)p_encoder, v15, v16, 0);
  self->_askForReplacement = 1;
  _NSXPCSerializationAddInvocationArgumentsArray(a3, v14, self, p_encoder, v11);
  self->_askForReplacement = 0;
  _NSXPCSerializationEndArrayWrite(p_encoder);
  self->_unint64_t genericIndex = genericIndex;
  xpc_object_t v17 = _NSXPCSerializationCreateWriteData((uint64_t)p_encoder);
  if (v17)
  {
    v18 = v17;
    self->_finished = 1;
    xpc_dictionary_set_value(a5, "root", v17);
    xpc_release(v18);
    oolObjects = self->_oolObjects;
    if (oolObjects) {
      xpc_dictionary_set_value(a5, "ool", oolObjects);
    }
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSCoder is unable to serialize objects to be sent" userInfo:0]);
    _NSXPCSerializationStartArrayWrite(v20);
  }

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  oolObjects = self->_oolObjects;
  if (oolObjects) {
    xpc_release(oolObjects);
  }
  replacedByDelegateObjects = self->_replacedByDelegateObjects;
  if (replacedByDelegateObjects) {
    CFRelease(replacedByDelegateObjects);
  }
  if (!self->_finished)
  {
    xpc_object_t v5 = _NSXPCSerializationCreateWriteData((uint64_t)&self->_encoder);
    xpc_release(v5);
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSXPCEncoder;
  -[NSXPCCoder dealloc](&v6, sel_dealloc);
}

- (id)connection
{
  return self->_connection;
}

- (void)_setConnection:(id)a3
{
  connection = self->_connection;
  if (connection != a3)
  {

    self->_connection = (NSXPCConnection *)a3;
  }

- (NSXPCEncoder)init
{
  return -[NSXPCEncoder initWithStackSpace:size:](self, "initWithStackSpace:size:", 0LL, 0LL);
}

- (id)debugDescription
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSXPCEncoder;
  return -[NSXPCEncoder debugDescription](&v3, sel_debugDescription);
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (void)encodeValueOfObjCType:(const char *)a3 at:(const void *)a4
{
  p_encoder = &self->_encoder;
  _NSXPCSerializationAddNull((uint64_t)&self->_encoder);
  _NSXPCSerializationStartArrayWrite(p_encoder);
  _NSXPCSerializationAddTypedObjCValuesToArray(self, (uint64_t)p_encoder, a3, (SEL *)a4);
  _NSXPCSerializationEndArrayWrite(p_encoder);
}

- (void)encodeObject:(id)a3
{
}

- (id)_replaceObject:(id)a3
{
  id v3 = a3;
  value[1] = *(void **)MEMORY[0x1895F89C0];
  value[0] = a3;
  if (!self->_askForReplacement) {
    return v3;
  }
  if (!a3) {
    return v3;
  }
  id v6 = (id)[a3 replacementObjectForCoder:self];
  if (v6 != v3)
  {
    value[0] = v6;
    id v3 = v6;
    if (!v6) {
      return v3;
    }
  }

  if (!objc_loadWeak((id *)&self->_delegate)) {
    return v3;
  }
  replacedByDelegateObjects = self->_replacedByDelegateObjects;
  id Weak = objc_loadWeak((id *)&self->_delegate);
  objc_super v9 = (void *)[Weak replacementObjectForEncoder:self object:value[0]];
  if (v9)
  {
    id v3 = v9;
    uint64_t v10 = value[0];
    if (v9 != value[0])
    {
      Mutable = self->_replacedByDelegateObjects;
      if (!Mutable)
      {
        Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DD0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
        self->_replacedByDelegateObjects = Mutable;
        uint64_t v10 = value[0];
      }

      CFDictionarySetValue(Mutable, v10, v3);
    }

    return v3;
  }

  size_t v13 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: The replacement object must not be nil.", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
  objc_exception_throw(v13);
  -[NSXPCEncoder _checkObject:](v14, v15, v16);
  return result;
}

- (void)_checkObject:(id)a3
{
  if (a3)
  {
    uint64_t v6 = objc_opt_class();
    if (!v6)
    {
      uint64_t v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: An object had no class.",  _NSMethodExceptionProem((objc_class *)self, a2),  v12);
      goto LABEL_12;
    }

    uint64_t v7 = v6;
    connection = self->_connection;
    if (!connection
      || (-[_NSXPCConnectionClassCache containsClass:]((os_unfair_lock_s *)connection->_eCache, v6) & 1) == 0)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0
        && ([a3 conformsToProtocol:&unk_18C650CC8] & 1) == 0
        && (objc_opt_isKindOfClass() & 1) == 0)
      {
        while (1)
        {
          a2 = (SEL)_NSMethodExceptionProem((objc_class *)self, a2);
          int v11 = (objc_class *)objc_opt_class();
          uint64_t v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: This coder only encodes objects that adopt NSSecureCoding (object is of class '%s').",  a2,  class_getName(v11));
LABEL_12:
          objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v10 userInfo:0]);
        }
      }

      objc_super v9 = self->_connection;
      if (v9) {
        -[_NSXPCConnectionClassCache addClass:]((uint64_t)v9->_eCache, v7);
      }
    }
  }

- (void)_encodeObject:(id)a3
{
  p_encoder = &self->_encoder;
  if (!a3)
  {
    _NSXPCSerializationAddNull((uint64_t)&self->_encoder);
    return;
  }

  objectReferences = self->_encoder._objectReferences;
  if (objectReferences)
  {
    Value = CFDictionaryGetValue(objectReferences, a3);
    if (Value)
    {
      _NSXPCSerializationAddReference((uint64_t)p_encoder, (unint64_t)Value);
      return;
    }
  }

  if ([a3 _allowsDirectEncoding])
  {
    if (_NSIsNSString())
    {
      _NSXPCSerializationAddString((uint64_t)p_encoder, (CFStringRef)a3, 0);
      return;
    }

    if (_NSIsNSNumber())
    {
      _NSXPCSerializationAddNumber((uint64_t)p_encoder, (CFNumberRef)a3);
      return;
    }

    if (_NSIsNSData())
    {
      _NSXPCSerializationAddData((uint64_t)p_encoder, (CFDataRef)a3);
      return;
    }
  }

  else
  {
    _NSXPCSerializationAddObjectRef((uint64_t)p_encoder, a3);
  }

  unint64_t genericIndex = self->_genericIndex;
  self->_unint64_t genericIndex = 0LL;
  _NSXPCSerializationStartDictionaryWrite(p_encoder);
  BOOL askForReplacement = self->_askForReplacement;
  self->_BOOL askForReplacement = 0;
  Class = object_getClass(a3);
  if (class_isMetaClass(Class))
  {
    SEL v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: Class objects may not be encoded at this time.",  _NSMethodExceptionProem((objc_class *)self, a2));
LABEL_22:
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v15 userInfo:0]);
    -[NSXPCEncoder encodeObject:forKey:](v16, v17, v18, v19);
    return;
  }

  uint64_t v12 = (objc_class *)[a3 classForCoder];
  if (!v12)
  {
    SEL v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: Unable to determine what Class the encoded object should encode (classForCoder returned nil)",  _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_22;
  }

  Name = (char *)class_getName(v12);
  _NSXPCSerializationAddASCIIString((uint64_t)p_encoder, "$class", 6LL, 1);
  size_t v14 = strlen(Name);
  _NSXPCSerializationAddASCIIString((uint64_t)p_encoder, Name, v14, 1);
  self->_BOOL askForReplacement = askForReplacement;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    _NSXPCSerializationAddASCIIString((uint64_t)p_encoder, "$xpc", 4LL, 1);
    _NSXPCSerializationAddInteger((uint64_t)p_encoder, -[NSXPCEncoder _addOOLXPCObject:](self, "_addOOLXPCObject:", a3));
  }

  else
  {
    [a3 encodeWithCoder:self];
  }

  _NSXPCSerializationEndArrayWrite(p_encoder);
  self->_unint64_t genericIndex = genericIndex;
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  id v6 = -[NSXPCEncoder _replaceObject:](self, "_replaceObject:", a3);
  -[NSXPCEncoder _checkObject:](self, "_checkObject:", v6);
  p_encoder = &self->_encoder;
  if (a4) {
    _NSXPCSerializationAddString((uint64_t)p_encoder, (CFStringRef)a4, 1);
  }
  else {
    _NSXPCSerializationAddNull((uint64_t)p_encoder);
  }
  -[NSXPCEncoder _encodeObject:](self, "_encodeObject:", v6);
}

- (void)_encodeUnkeyedObject:(id)a3
{
  id v4 = -[NSXPCEncoder _replaceObject:](self, "_replaceObject:", a3);
  -[NSXPCEncoder _checkObject:](self, "_checkObject:", v4);
  -[NSXPCEncoder _encodeObject:](self, "_encodeObject:", v4);
}

- (void)beginEncoding
{
  self->_topLevelDictionary = 1;
  _NSXPCSerializationStartDictionaryWrite(self->_encoder.collectionSizeOffset);
}

- (id)finishEncoding
{
  return -[NSXPCEncoder _newRootXPCObject](self, "_newRootXPCObject");
}

- (id)_newRootXPCObject
{
  if (self->_topLevelDictionary) {
    _NSXPCSerializationEndArrayWrite(self->_encoder.collectionSizeOffset);
  }
  xpc_object_t v3 = _NSXPCSerializationCreateWriteData((uint64_t)&self->_encoder);
  if (v3)
  {
    id v4 = v3;
    self->_finished = 1;
    xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_value(v5, "root", v4);
    xpc_release(v4);
    oolObjects = self->_oolObjects;
    if (oolObjects) {
      xpc_dictionary_set_value(v5, "ool", oolObjects);
    }
    return v5;
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSCoder is unable to serialize objects to be sent" userInfo:0]);
    -[NSXPCEncoder _encodeInvocationObjectArgumentsOnly:count:typeString:selector:isReply:into:]( v8,  v9,  v10,  v11,  v12,  v13,  v14,  v15);
  }

  return result;
}

- (void)_encodeInvocationObjectArgumentsOnly:(id *)a3 count:(unint64_t)a4 typeString:(const char *)a5 selector:(SEL)a6 isReply:(BOOL)a7 into:(id)a8
{
  BOOL v9 = a7;
  unint64_t genericIndex = self->_genericIndex;
  self->_unint64_t genericIndex = 0LL;
  p_encoder = &self->_encoder;
  _NSXPCSerializationStartArrayWrite(self->_encoder.collectionSizeOffset);
  if (v9)
  {
    _NSXPCSerializationAddNull((uint64_t)p_encoder);
  }

  else
  {
    Name = (char *)sel_getName(a6);
    size_t v18 = strlen(Name);
    _NSXPCSerializationAddASCIIString((uint64_t)p_encoder, Name, v18, 0);
  }

  size_t v19 = strlen(a5);
  _NSXPCSerializationAddASCIIString((uint64_t)p_encoder, (void *)a5, v19, 0);
  self->_BOOL askForReplacement = 1;
  _NSXPCSerializationAddInvocationWithOnlyObjectArgumentsArray((SEL *)a3, a4, self, p_encoder);
  self->_BOOL askForReplacement = 0;
  _NSXPCSerializationEndArrayWrite(p_encoder);
  self->_unint64_t genericIndex = genericIndex;
  xpc_object_t v20 = _NSXPCSerializationCreateWriteData((uint64_t)p_encoder);
  if (v20)
  {
    v21 = v20;
    self->_finished = 1;
    xpc_dictionary_set_value(a8, "root", v20);
    xpc_release(v21);
    oolObjects = self->_oolObjects;
    if (oolObjects) {
      xpc_dictionary_set_value(a8, "ool", oolObjects);
    }
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSCoder is unable to serialize objects to be sent" userInfo:0]);
    -[NSXPCEncoder _encodeArrayOfObjects:forKey:](v23, v24, v25, v26);
  }

- (void)_encodeArrayOfObjects:(id)a3 forKey:(id)a4
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  p_encoder = &self->_encoder;
  _NSXPCSerializationAddString((uint64_t)&self->_encoder, (CFStringRef)a4, 1);
  _NSXPCSerializationStartArrayWrite(p_encoder);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(a3);
        }
        -[NSXPCEncoder _encodeUnkeyedObject:]( self,  "_encodeUnkeyedObject:",  *(void *)(*((void *)&v12 + 1) + 8 * v10++));
      }

      while (v8 != v10);
      uint64_t v8 = [a3 countByEnumeratingWithState:&v12 objects:v11 count:16];
    }

    while (v8);
  }

  _NSXPCSerializationEndArrayWrite(p_encoder);
}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  p_encoder = &self->_encoder;
  _NSXPCSerializationAddString((uint64_t)&self->_encoder, (CFStringRef)a4, 1);
  _NSXPCSerializationAddBool((uint64_t)p_encoder, v4);
}

- (void)encodeInt:(int)a3 forKey:(id)a4
{
  p_encoder = &self->_encoder;
  _NSXPCSerializationAddString((uint64_t)&self->_encoder, (CFStringRef)a4, 1);
  _NSXPCSerializationAddInteger((uint64_t)p_encoder, a3);
}

- (void)encodeInt32:(int)a3 forKey:(id)a4
{
  p_encoder = &self->_encoder;
  _NSXPCSerializationAddString((uint64_t)&self->_encoder, (CFStringRef)a4, 1);
  _NSXPCSerializationAddInteger((uint64_t)p_encoder, a3);
}

- (void)encodeInt64:(int64_t)a3 forKey:(id)a4
{
  p_encoder = &self->_encoder;
  _NSXPCSerializationAddString((uint64_t)&self->_encoder, (CFStringRef)a4, 1);
  _NSXPCSerializationAddInteger((uint64_t)p_encoder, a3);
}

- (void)encodeFloat:(float)a3 forKey:(id)a4
{
  p_encoder = &self->_encoder;
  _NSXPCSerializationAddString((uint64_t)&self->_encoder, (CFStringRef)a4, 1);
  _NSXPCSerializationAddFloat((uint64_t)p_encoder, a3);
}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  p_encoder = &self->_encoder;
  _NSXPCSerializationAddString((uint64_t)&self->_encoder, (CFStringRef)a4, 1);
  _NSXPCSerializationAddDouble((uint64_t)p_encoder, a3);
}

- (void)encodeInteger:(int64_t)a3 forKey:(id)a4
{
  p_encoder = &self->_encoder;
  _NSXPCSerializationAddString((uint64_t)&self->_encoder, (CFStringRef)a4, 1);
  _NSXPCSerializationAddInteger((uint64_t)p_encoder, a3);
}

- (void)encodeBytes:(const char *)a3 length:(unint64_t)a4 forKey:(id)a5
{
  if (!a3 && a4)
  {
    uint64_t v7 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: argument inconsistency: bytes pointer is null but length (%ld) is not zero", _NSMethodExceptionProem((objc_class *)self, a2), a4), 0 reason userInfo];
    objc_exception_throw(v7);
    -[NSXPCEncoder _encodeCString:length:forKey:](v8, v9, v10, v11, v12);
  }

  else
  {
    __int128 v13 = (const __CFData *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:a3 length:a4];
    _NSXPCSerializationAddString((uint64_t)&self->_encoder, (CFStringRef)a5, 1);
    _NSXPCSerializationAddData((uint64_t)&self->_encoder, v13);
  }

- (void)_encodeCString:(const char *)a3 length:(unint64_t)a4 forKey:(id)a5
{
  p_encoder = &self->_encoder;
  _NSXPCSerializationAddString((uint64_t)&self->_encoder, (CFStringRef)a5, 1);
  _NSXPCSerializationAddASCIIString((uint64_t)p_encoder, (void *)a3, a4, 1);
}

- (unint64_t)_addOOLXPCObject:(id)a3
{
  v8[1] = *(xpc_object_t *)MEMORY[0x1895F89C0];
  v8[0] = a3;
  oolObjects = self->_oolObjects;
  if (oolObjects)
  {
    size_t count = xpc_array_get_count(oolObjects);
    xpc_array_append_value(self->_oolObjects, a3);
    return count;
  }

  else
  {
    self->_oolObjects = (OS_xpc_object *)xpc_array_create(v8, 1uLL);
    return 0LL;
  }

- (void)encodeXPCObject:(id)a3 forKey:(id)a4
{
  p_encoder = &self->_encoder;
  _NSXPCSerializationAddString((uint64_t)&self->_encoder, (CFStringRef)a4, 1);
  _NSXPCSerializationAddInteger((uint64_t)p_encoder, -[NSXPCEncoder _addOOLXPCObject:](self, "_addOOLXPCObject:", a3));
}

- (void)encodeConditionalObject:(id)a3 forKey:(id)a4
{
  BOOL v4 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: This coder subclass does not support this method.", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
  objc_exception_throw(v4);
  -[NSXPCEncoder delegate](v5, v6);
}

- (NSXPCEncoderDelegate)delegate
{
  return (NSXPCEncoderDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void).cxx_destruct
{
}

@end
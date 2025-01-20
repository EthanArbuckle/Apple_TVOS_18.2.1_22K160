@interface _PFResultObject
+ (Class)classForKeyedUnarchiver;
- (CFStringRef)stringFromPtr:(void *)a1;
- (CFStringRef)taggedStringFromPtr:(CFStringRef)result withLength:(char *)__s;
- (Class)classForCoder;
- (_PFResultObject)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5;
- (_PFResultObject)retain;
- (id)keyEnumerator;
- (id)objectForKey:(id)a3;
- (id)valueAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)retainCount;
- (void)_setParentBuffer:(id)a3;
- (void)dataFromPtr:(uint64_t)a1;
- (void)release;
@end

@implementation _PFResultObject

- (_PFResultObject)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  return 0LL;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

- (id)valueAtIndex:(unint64_t)a3
{
  uint64_t v117 = *MEMORY[0x1895F89C0];
  v5 = (void *)MEMORY[0x186E3E5D8]();
  parent_buffer = self->_parent_buffer;
  if (parent_buffer) {
    resultSet = parent_buffer->_resultSet;
  }
  else {
    resultSet = 0LL;
  }
  $832F591C28F8B7CE1ACC7DCBC97655CC var7 = resultSet->var7;
  if ((*(_BYTE *)&var7 & 0x10) != 0)
  {
    if ((*(_BYTE *)&var7 & 0x40) != 0)
    {
      v42 = @"%@: backing buffer has been purged";
    }

    else
    {
      if ((*(_BYTE *)&var7 & 0x20) == 0) {
        goto LABEL_4;
      }
      v42 = @"%@: backing buffer can be purged";
    }

    objc_msgSend(MEMORY[0x189603F70], "raise:format:", *MEMORY[0x189603A60], v42, _NSMethodExceptionProem());
    goto LABEL_29;
  }

- (CFStringRef)taggedStringFromPtr:(CFStringRef)result withLength:(char *)__s
{
  if (!result) {
    return result;
  }
  v2 = (__CFString *)result;
  result = *(CFStringRef *)__s;
  if (*(void *)__s == -1LL)
  {
    result = -[_PFResultObject stringFromPtr:](v2, __s);
    if (result) {
      return result;
    }
    goto LABEL_11;
  }

  if ((*(_BYTE *)(*(void *)(v2->info + 24) + 40LL) & 2) != 0)
  {
    int64_t v3 = strlen(__s);
    if (v3 > 7)
    {
      unint64_t v5 = 0LL;
    }

    else
    {
      int64_t v4 = v3;
      uint64_t v16 = 0LL;
      __memmove_chk();
      unint64_t v5 = (8 * v4) | (v16 << 7) | 0x8000000000000002LL;
      unint64_t v14 = *MEMORY[0x189616658] ^ v5;
      if ((~v14 & 0xC000000000000007LL) != 0) {
        unint64_t v5 = v14 & 0xFFFFFFFFFFFFFFF8LL | *(unsigned __int8 *)(MEMORY[0x189616648] + (v14 & 7));
      }
    }

    result = (CFStringRef)(id)v5;
  }

  if (!result)
  {
LABEL_11:
    uint64_t v6 = [NSString stringWithUTF8String:"Unexpected tagged string result"];
    _NSCoreDataLog(17LL, v6, v7, v8, v9, v10, v11, v12, v15);
    uint64_t v13 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v15) = 0;
      _os_log_fault_impl( &dword_186681000,  v13,  OS_LOG_TYPE_FAULT,  "CoreData: Unexpected tagged string result",  (uint8_t *)&v15,  2u);
    }

    return 0LL;
  }

  return result;
}

- (CFStringRef)stringFromPtr:(void *)a1
{
  if (!a1) {
    return 0LL;
  }
  v2 = a2;
  if (*a2 != -1LL)
  {
    if (!*a2)
    {
      int64_t v4 = (objc_class *)objc_opt_class();
      object_setClass(v2, v4);
    }

    v2[1] = a1;
    return (CFStringRef)v2;
  }

  uint64_t v6 = (const UInt8 *)a2 + +[_PFResultUniString bufferOffset](&OBJC_CLASS____PFResultUniString, "bufferOffset");
  CFIndex v7 = *((unsigned int *)v2 + 4);
  v2[1] = a1;
  id v8 = a1;
  return (id)CFStringCreateWithBytesNoCopy( 0LL,  v6,  v7,  0x8000100u,  0,  +[_PFResultUniString cfDeallocator](&OBJC_CLASS____PFResultUniString, "cfDeallocator"));
}

- (void)dataFromPtr:(uint64_t)a1
{
  if (!a1) {
    return 0LL;
  }
  v2 = a2;
  if (!*a2)
  {
    int64_t v4 = (objc_class *)objc_opt_class();
    object_setClass(v2, v4);
  }

  [v2 setParentObject:a1];
  return v2;
}

- (id)objectForKey:(id)a3
{
  parent_buffer = self->_parent_buffer;
  if (parent_buffer) {
    metadata = parent_buffer->_metadata;
  }
  else {
    metadata = 0LL;
  }
  return -[_PFResultObject valueAtIndex:]( self,  "valueAtIndex:",  -[NSKnownKeysMappingStrategy indexForKey:]( -[NSKnownKeysDictionary mapping](metadata, "mapping"),  "indexForKey:",  a3));
}

- (unint64_t)count
{
  return self->_count;
}

- (void)_setParentBuffer:(id)a3
{
  self->_parent_buffer = (_PFResultArray *)a3;
}

- (_PFResultObject)retain
{
  int64_t v3 = self->_parent_buffer;
  return self;
}

- (void)release
{
}

- (unint64_t)retainCount
{
  return -[_PFResultArray retainCount](self->_parent_buffer, "retainCount");
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (self)
  {
    unint64_t v8 = self;
    if (!a3->var0) {
      a3->var2 = (unint64_t *)self;
    }
    a3->var1 = a4;
    uint64_t v9 = *(void *)(self + 8);
    if (v9) {
      uint64_t v10 = *(void **)(v9 + 40);
    }
    else {
      uint64_t v10 = 0LL;
    }
    uint64_t v11 = (void *)[v10 mapping];
    unint64_t v12 = [v11 length];
    uint64_t v13 = [v11 keys];
    self = 0LL;
    unint64_t var0 = a3->var0;
    if (a5 && var0 < v12)
    {
      self = 0LL;
      do
      {
        if (*(void *)(v8 + 40 + 8 * var0)) {
          a4[self++] = *(id *)(v13 + 8 * var0);
        }
        ++var0;
      }

      while (var0 < v12 && self < a5);
    }

    a3->unint64_t var0 = var0;
  }

  return self;
}

- (id)keyEnumerator
{
  int64_t v3 = objc_alloc(&OBJC_CLASS____PFResultObjectKeyEnumerator);
  parent_buffer = self->_parent_buffer;
  if (parent_buffer) {
    metadata = parent_buffer->_metadata;
  }
  else {
    metadata = 0LL;
  }
  uint64_t v6 = -[NSKnownKeysMappingStrategy keys](-[NSKnownKeysDictionary mapping](metadata, "mapping"), "keys");
  CFIndex v7 = self->_parent_buffer;
  if (v7) {
    unint64_t v8 = v7->_metadata;
  }
  else {
    unint64_t v8 = 0LL;
  }
  return  -[_PFResultObjectKeyEnumerator initWithArray:forTarget:withReferenceValues:andRange:]( v3,  "initWithArray:forTarget:withReferenceValues:andRange:",  v6,  self,  &self[1],  0LL,  -[NSKnownKeysMappingStrategy length](-[NSKnownKeysDictionary mapping](v8, "mapping"), "length"));
}

@end
@interface NSAKSerializerStream
- (BOOL)writeToPath:(id)a3 safely:(BOOL)a4;
- (unint64_t)writeAlignedDataSize:(unint64_t)a3;
- (unint64_t)writeData:(const void *)a3 length:(unint64_t)a4;
- (unint64_t)writeInt:(unint64_t)a3;
- (unint64_t)writeRoomForInt:(int *)a3;
- (void)copySerializationInto:(void *)a3;
- (void)dealloc;
- (void)writeDelayedInt:(unint64_t)a3 for:(int)a4;
@end

@implementation NSAKSerializerStream

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  roomForIntLocations = self->roomForIntLocations;
  if (roomForIntLocations) {
    CFRelease(roomForIntLocations);
  }
  unallocate((mach_vm_address_t)self->memory, self->max);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSAKSerializerStream;
  -[NSAKSerializerStream dealloc](&v4, sel_dealloc);
}

- (unint64_t)writeInt:(unint64_t)a3
{
  if (a3 >= 0x80000001)
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:@"NSOtherSerializationException" reason:@"can't write int larger than INT_MAX" userInfo:0]);
    return extendStreamFor(v6, v7);
  }

  else
  {
    int v3 = a3;
    extendStreamFor((vm_address_t)self, 4LL);
    *(_DWORD *)((char *)self->memory + self->current) = v3;
    self->current += 4LL;
    return 4LL;
  }

- (unint64_t)writeAlignedDataSize:(unint64_t)a3
{
  uint64_t v5 = *MEMORY[0x1895FD590];
  if (*MEMORY[0x1895FD590] > a3) {
    return -[NSAKSerializerStream writeInt:](self, "writeInt:", a3);
  }
  unint64_t current = self->current;
  if (((current + 4) & (v5 - 1)) == 0) {
    return -[NSAKSerializerStream writeInt:](self, "writeInt:", a3);
  }
  size_t v7 = v5 - ((current + 12) & (v5 - 1));
  extendStreamFor((vm_address_t)self, v7 + 12);
  -[NSAKSerializerStream writeInt:](self, "writeInt:", 0x80000000LL);
  -[NSAKSerializerStream writeInt:](self, "writeInt:", a3);
  -[NSAKSerializerStream writeInt:](self, "writeInt:", v7);
  bzero((char *)self->memory + self->current, v7);
  self->current += v7;
  return v7 + 12;
}

- (unint64_t)writeData:(const void *)a3 length:(unint64_t)a4
{
  unint64_t v7 = (unint64_t)self->memory + self->current;
  if (a4 >= 0x80000)
  {
    v8 = (void *)MEMORY[0x1895FD590];
    if (((*MEMORY[0x1895FD590] - 1LL) & (v7 | (unint64_t)a3)) != 0
      || (malloc_default_zone(), malloc_zone_claimed_address()))
    {
      size_t v9 = a4;
    }

    else
    {
      NSUInteger v11 = -*v8 & a4;
      NSCopyMemoryPages(a3, (void *)v7, v11);
      a3 = (char *)a3 + v11;
      v7 += v11;
      size_t v9 = a4 - v11;
      if (a4 == v11) {
        goto LABEL_7;
      }
    }

    goto LABEL_6;
  }

  size_t v9 = a4;
  if (a4) {
LABEL_6:
  }
    memmove((void *)v7, a3, v9);
LABEL_7:
  self->current += a4;
  return a4;
}

- (unint64_t)writeRoomForInt:(int *)a3
{
  if (!self->roomForIntLocations) {
    self->roomForIntLocations = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x189604DD0], 0LL, 0LL, 0LL);
  }
  do
    int v5 = __ldaxr((unsigned int *)&writeRoomForInt__globalSequence);
  while (__stlxr(v5 + 1, (unsigned int *)&writeRoomForInt__globalSequence));
  *a3 = v5;
  CFDictionarySetValue(self->roomForIntLocations, (const void *)v5, (const void *)self->current);
  return -[NSAKSerializerStream writeInt:](self, "writeInt:", 0LL);
}

- (void)writeDelayedInt:(unint64_t)a3 for:(int)a4
{
  v11[1] = *(const void **)MEMORY[0x1895F89C0];
  if (a3 >= 0x80000001)
  {
    v8 = (void *)MEMORY[0x189603F70];
    size_t v9 = @"NSOtherSerializationException";
    v10 = @"can't write int larger than INT_MAX";
LABEL_7:
    objc_exception_throw((id)[v8 exceptionWithName:v9 reason:v10 userInfo:0]);
  }

  roomForIntLocations = self->roomForIntLocations;
  if (!roomForIntLocations
    || (int v6 = a3, v7 = (const void *)a4, !CFDictionaryGetValueIfPresent(roomForIntLocations, (const void *)a4, v11)))
  {
    v8 = (void *)MEMORY[0x189603F70];
    size_t v9 = @"NSSerializeException";
    v10 = @"writeDelayedInt:for:";
    goto LABEL_7;
  }

  CFDictionaryRemoveValue(self->roomForIntLocations, v7);
  *(_DWORD *)((char *)self->memory + (unint64_t)v11[0]) = v6;
}

- (BOOL)writeToPath:(id)a3 safely:(BOOL)a4
{
  BOOL v4 = a4;
  if ([a3 isEqualToString:&stru_189CA6A28]) {
    return 0;
  }
  roomForIntLocations = self->roomForIntLocations;
  if (roomForIntLocations && CFDictionaryGetCount(roomForIntLocations))
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:@"NSSerializeException" reason:@"missing writeDelayedInt:for:" userInfo:0]);
    -[NSAKSerializerStream copySerializationInto:](v11, v12, v13);
  }

  else
  {
    size_t v9 = (void *)[objc_allocWithZone(MEMORY[0x189603F48]) initWithBytes:self->memory length:self->current];
    char v10 = [v9 writeToFile:a3 atomically:v4];

    return v10;
  }

  return result;
}

- (void)copySerializationInto:(void *)a3
{
  roomForIntLocations = self->roomForIntLocations;
  if (roomForIntLocations && CFDictionaryGetCount(roomForIntLocations))
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:@"NSSerializeException" reason:@"missing writeDelayedInt:for:" userInfo:0]);
    -[NSAKDeserializerStream initFromMemoryNoCopy:length:freeWhenDone:](v10, v11, v12, v13, v14);
  }

  else
  {
    unint64_t memory = (unint64_t)self->memory;
    size_t current = self->current;
    if (current >= 0x80000)
    {
      v8 = (void *)MEMORY[0x1895FD590];
      malloc_default_zone();
      NSUInteger v9 = current & -*v8;
      NSCopyMemoryPages((const void *)memory, a3, v9);
      memory += v9;
      a3 = (char *)a3 + v9;
      current -= v9;
    }

    if (current) {
LABEL_8:
    }
      memmove(a3, (const void *)memory, current);
  }

@end
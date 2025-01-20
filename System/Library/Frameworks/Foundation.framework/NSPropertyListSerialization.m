@interface NSPropertyListSerialization
+ (BOOL)propertyList:(id)plist isValidForFormat:(NSPropertyListFormat)format;
+ (NSData)dataFromPropertyList:(id)plist format:(NSPropertyListFormat)format errorDescription:(NSString *)errorString;
+ (NSData)dataWithPropertyList:(id)plist format:(NSPropertyListFormat)format options:(NSPropertyListWriteOptions)opt error:(NSError *)error;
+ (NSInteger)writePropertyList:(id)plist toStream:(NSOutputStream *)stream format:(NSPropertyListFormat)format options:(NSPropertyListWriteOptions)opt error:(NSError *)error;
+ (NSPropertyListSerialization)allocWithZone:(_NSZone *)a3;
+ (id)propertyListFromData:(NSData *)data mutabilityOption:(NSPropertyListMutabilityOptions)opt format:(NSPropertyListFormat *)format errorDescription:(NSString *)errorString;
+ (id)propertyListWithData:(NSData *)data options:(NSPropertyListReadOptions)opt format:(NSPropertyListFormat *)format error:(NSError *)error;
+ (id)propertyListWithStream:(NSInputStream *)stream options:(NSPropertyListReadOptions)opt format:(NSPropertyListFormat *)format error:(NSError *)error;
- (NSPropertyListSerialization)init;
@end

@implementation NSPropertyListSerialization

+ (id)propertyListWithData:(NSData *)data options:(NSPropertyListReadOptions)opt format:(NSPropertyListFormat *)format error:(NSError *)error
{
  if (data)
  {
    CFPropertyListRef v7 = CFPropertyListCreateWithData( (CFAllocatorRef)*MEMORY[0x189604DD0],  (CFDataRef)data,  opt,  (CFPropertyListFormat *)format,  (CFErrorRef *)error);
    v8 = (void *)v7;
    if (error && !v7)
    {
      if (*error) {
        v9 = *error;
      }
    }

    return v8;
  }

  else
  {
    objc_exception_throw((id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603A60],  @"data parameter is nil",  0,  error));
    return (id)-[NSConcreteData length](v11, v12);
  }

+ (NSData)dataWithPropertyList:(id)plist format:(NSPropertyListFormat)format options:(NSPropertyListWriteOptions)opt error:(NSError *)error
{
  CFDataRef Data = CFPropertyListCreateData( (CFAllocatorRef)*MEMORY[0x189604DB0],  plist,  (CFPropertyListFormat)format,  opt,  (CFErrorRef *)error);
  CFDataRef v8 = Data;
  if (error && !Data && *error) {
    v9 = *error;
  }
  return (NSData *)v8;
}

+ (BOOL)propertyList:(id)plist isValidForFormat:(NSPropertyListFormat)format
{
  return CFPropertyListIsValid(plist, (CFPropertyListFormat)format) != 0;
}

+ (NSData)dataFromPropertyList:(id)plist format:(NSPropertyListFormat)format errorDescription:(NSString *)errorString
{
  CFDataRef v8 = CFWriteStreamCreateWithAllocatedBuffers( (CFAllocatorRef)*MEMORY[0x189604DB0],  (CFAllocatorRef)*MEMORY[0x189604DB0]);
  CFWriteStreamOpen(v8);
  if (CFPropertyListWriteToStream(plist, v8, (CFPropertyListFormat)format, (CFStringRef *)errorString) < 1) {
    v9 = 0LL;
  }
  else {
    v9 = (void *)CFWriteStreamCopyProperty(v8, (CFStreamPropertyKey)*MEMORY[0x1896051D0]);
  }
  CFWriteStreamClose(v8);
  CFRelease(v8);
  return (NSData *)v9;
}

+ (id)propertyListFromData:(NSData *)data mutabilityOption:(NSPropertyListMutabilityOptions)opt format:(NSPropertyListFormat *)format errorDescription:(NSString *)errorString
{
  if (data) {
    return (id)_CFPropertyListCreateFromXMLData();
  }
  if (errorString) {
    *errorString = (NSString *)@"stream had too few bytes";
  }
  return 0LL;
}

+ (NSPropertyListSerialization)allocWithZone:(_NSZone *)a3
{
  v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Do not create instances of NSPropertyListSerialization in this release", _NSMethodExceptionProem((objc_class *)a1, a2)), 0 reason userInfo];
  objc_exception_throw(v3);
  return -[NSPropertyListSerialization init](v4, v5);
}

- (NSPropertyListSerialization)init
{
  v3 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: Do not create instances of NSPropertyListSerialization in this release",  _NSMethodExceptionProem((objc_class *)self, a2));

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v3 userInfo:0]);
  return (NSPropertyListSerialization *)+[NSPropertyListSerialization writePropertyList:toStream:format:options:error:]( v4,  v5,  v6,  v7,  v8,  v9,  v10);
}

+ (NSInteger)writePropertyList:(id)plist toStream:(NSOutputStream *)stream format:(NSPropertyListFormat)format options:(NSPropertyListWriteOptions)opt error:(NSError *)error
{
  if (!plist)
  {
    SEL v12 = (void *)MEMORY[0x189603F70];
    uint64_t v13 = *MEMORY[0x189603A60];
    v14 = @"plist parameter is nil";
LABEL_13:
    objc_exception_throw((id)objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, v14, 0, opt, error));
    return (NSInteger)+[NSPropertyListSerialization propertyListWithStream:options:format:error:]( v15,  v16,  v17,  v18,  v19,  v20);
  }

  if (!stream)
  {
    SEL v12 = (void *)MEMORY[0x189603F70];
    uint64_t v13 = *MEMORY[0x189603A60];
    v14 = @"stream parameter is nil";
    goto LABEL_13;
  }

  if (format != NSPropertyListXMLFormat_v1_0 && format != NSPropertyListBinaryFormat_v1_0)
  {
    SEL v12 = (void *)MEMORY[0x189603F70];
    uint64_t v13 = *MEMORY[0x189603A60];
    v14 = @"Invalid property list format";
    goto LABEL_13;
  }

  CFIndex v8 = CFPropertyListWrite(plist, (CFWriteStreamRef)stream, (CFPropertyListFormat)format, opt, (CFErrorRef *)error);
  NSInteger v9 = v8;
  if (error && !v8)
  {
    if (*error) {
      v10 = *error;
    }
  }

  return v9;
}

+ (id)propertyListWithStream:(NSInputStream *)stream options:(NSPropertyListReadOptions)opt format:(NSPropertyListFormat *)format error:(NSError *)error
{
  if (stream)
  {
    CFPropertyListRef v7 = CFPropertyListCreateWithStream( (CFAllocatorRef)*MEMORY[0x189604DD0],  (CFReadStreamRef)stream,  0LL,  opt,  (CFPropertyListFormat *)format,  (CFErrorRef *)error);
    CFIndex v8 = (void *)v7;
    if (error && !v7)
    {
      if (*error) {
        NSInteger v9 = *error;
      }
    }

    return v8;
  }

  else
  {
    objc_exception_throw((id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603A60],  @"stream parameter is nil",  0,  error));
    return (id)__NSPropertyListClasses_ForArchival_ErrorAndException();
  }

@end
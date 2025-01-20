@interface NSJSONSerialization
+ (BOOL)isValidJSONObject:(id)obj;
+ (NSData)dataWithJSONObject:(id)obj options:(NSJSONWritingOptions)opt error:(NSError *)error;
+ (NSInteger)writeJSONObject:(id)obj toStream:(NSOutputStream *)stream options:(NSJSONWritingOptions)opt error:(NSError *)error;
+ (NSJSONSerialization)allocWithZone:(_NSZone *)a3;
+ (id)JSONObjectWithData:(NSData *)data options:(NSJSONReadingOptions)opt error:(NSError *)error;
+ (id)JSONObjectWithStream:(NSInputStream *)stream options:(NSJSONReadingOptions)opt error:(NSError *)error;
- (NSJSONSerialization)init;
@end

@implementation NSJSONSerialization

+ (id)JSONObjectWithData:(NSData *)data options:(NSJSONReadingOptions)opt error:(NSError *)error
{
  if (data)
  {
    if ((~(_BYTE)opt & 0x14) != 0) {
      return -[_NSJSONReader parseData:options:error:]( objc_alloc_init(&OBJC_CLASS____NSJSONReader),  "parseData:options:error:",  data,  opt,  error);
    }
    v6 = (void *)MEMORY[0x189603F70];
    uint64_t v7 = *MEMORY[0x189603A60];
    v8 = @"NSJSONReadingAssumeTopLevelDictionary and NSJSONReadingAllowFragments cannot be set at the same time";
  }

  else
  {
    v6 = (void *)MEMORY[0x189603F70];
    uint64_t v7 = *MEMORY[0x189603A60];
    v8 = @"data parameter is nil";
  }

  objc_exception_throw((id)[v6 exceptionWithName:v7 reason:v8 userInfo:0]);
  return -[_NSJSONReader parseData:options:error:](v9, v10, v11, v12, v13);
}

+ (BOOL)isValidJSONObject:(id)obj
{
  return +[_NSJSONReader validForJSON:depth:allowFragments:]( &OBJC_CLASS____NSJSONReader,  "validForJSON:depth:allowFragments:",  obj,  0LL,  0LL);
}

+ (NSData)dataWithJSONObject:(id)obj options:(NSJSONWritingOptions)opt error:(NSError *)error
{
  if (!obj)
  {
    v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: value parameter is nil",  _NSMethodExceptionProem((objc_class *)a1, a2));
LABEL_11:
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v14 userInfo:0]);
    return (NSData *)-[_NSJSONWriter init](v15, v16);
  }

  if ((opt & 4) == 0 && (_NSIsNSArray() & 1) == 0 && (_NSIsNSDictionary() & 1) == 0)
  {
    v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: Invalid top-level type in JSON write",  _NSMethodExceptionProem((objc_class *)a1, a2));
    goto LABEL_11;
  }

  SEL v10 = objc_alloc_init(&OBJC_CLASS____NSJSONWriter);
  uint64_t v11 = -[_NSJSONWriter dataWithRootObject:options:](v10, "dataWithRootObject:options:", obj, opt);
  unint64_t v12 = (NSData *)v11;
  if (error)
  {
    if (!v11) {
      *error = -[_NSJSONWriter failure](v10, "failure");
    }
  }

  return v12;
}

+ (NSJSONSerialization)allocWithZone:(_NSZone *)a3
{
  v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Do not create instances of NSJSONSerialization in this release", _NSMethodExceptionProem((objc_class *)a1, a2)), 0 reason userInfo];
  objc_exception_throw(v3);
  return -[NSJSONSerialization init](v4, v5);
}

- (NSJSONSerialization)init
{
  v3 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: Do not create instances of NSJSONSerialization in this release",  _NSMethodExceptionProem((objc_class *)self, a2));

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v3 userInfo:0]);
  return (NSJSONSerialization *)+[NSJSONSerialization writeJSONObject:toStream:options:error:](v4, v5, v6, v7, v8, v9);
}

+ (NSInteger)writeJSONObject:(id)obj toStream:(NSOutputStream *)stream options:(NSJSONWritingOptions)opt error:(NSError *)error
{
  if (!obj)
  {
    SEL v16 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: value parameter is nil",  _NSMethodExceptionProem((objc_class *)a1, a2));
    goto LABEL_14;
  }

  if (!stream || !-[NSOutputStream streamStatus](stream, "streamStatus"))
  {
    SEL v16 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: stream is not open for writing",  _NSMethodExceptionProem((objc_class *)a1, a2));
LABEL_14:
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v16 userInfo:0]);
    return (NSInteger)+[NSJSONSerialization JSONObjectWithStream:options:error:](v17, v18, v19, v20, v21);
  }

  if ((opt & 4) == 0 && (_NSIsNSArray() & 1) == 0 && (_NSIsNSDictionary() & 1) == 0)
  {
    SEL v16 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: Invalid top-level type in JSON write",  _NSMethodExceptionProem((objc_class *)a1, a2));
    goto LABEL_14;
  }

  unint64_t v12 = objc_alloc_init(&OBJC_CLASS____NSJSONWriter);
  uint64_t v13 = -[_NSJSONWriter writeRootObject:toStream:options:](v12, "writeRootObject:toStream:options:", obj, stream, opt);
  NSInteger v14 = v13;
  if (error)
  {
    if (v13 == -1) {
      *error = -[_NSJSONWriter failure](v12, "failure");
    }
  }

  return v14;
}

+ (id)JSONObjectWithStream:(NSInputStream *)stream options:(NSJSONReadingOptions)opt error:(NSError *)error
{
  if (!stream)
  {
    uint64_t v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: stream parameter is nil",  _NSMethodExceptionProem((objc_class *)a1, a2));
LABEL_7:
    unint64_t v12 = (const __CFString *)v11;
    uint64_t v13 = (void *)MEMORY[0x189603F70];
    uint64_t v14 = *MEMORY[0x189603A60];
    goto LABEL_9;
  }

  if (!-[NSInputStream streamStatus](stream, "streamStatus"))
  {
    uint64_t v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: stream is not open for reading",  _NSMethodExceptionProem((objc_class *)a1, a2));
    goto LABEL_7;
  }

  if ((~(_BYTE)opt & 0x14) != 0) {
    return -[_NSJSONReader parseStream:options:error:]( objc_alloc_init(&OBJC_CLASS____NSJSONReader),  "parseStream:options:error:",  stream,  opt,  error);
  }
  uint64_t v13 = (void *)MEMORY[0x189603F70];
  uint64_t v14 = *MEMORY[0x189603A60];
  unint64_t v12 = @"NSJSONReadingAssumeTopLevelDictionary and NSJSONReadingAllowFragments cannot be set at the same time";
LABEL_9:
  objc_exception_throw((id)[v13 exceptionWithName:v14 reason:v12 userInfo:0]);
  return (id)___writeJSONObject_block_invoke_2(v15, v16, v17);
}

@end
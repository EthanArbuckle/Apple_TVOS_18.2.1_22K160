@interface NSFormatter
- (BOOL)_mayDecorateAttributedStringForObjectValue:(id)a3;
- (BOOL)_tracksCacheGenerationCount;
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 range:(_NSRange *)a5 error:(id *)a6;
- (BOOL)getObjectValue:(id *)obj forString:(NSString *)string errorDescription:(NSString *)error;
- (BOOL)isPartialStringValid:(NSString *)partialString newEditingString:(NSString *)newString errorDescription:(NSString *)error;
- (BOOL)isPartialStringValid:(NSString *)partialStringPtr proposedSelectedRange:(NSRangePointer)proposedSelRangePtr originalString:(NSString *)origString originalSelectedRange:(NSRange)origSelRange errorDescription:(NSString *)error;
- (NSAttributedString)attributedStringForObjectValue:(id)obj withDefaultAttributes:(NSDictionary *)attrs;
- (NSString)stringForObjectValue:(id)obj;
- (int64_t)_cacheGenerationCount;
@end

@implementation NSFormatter

- (BOOL)_mayDecorateAttributedStringForObjectValue:(id)a3
{
  return 1;
}

- (int64_t)_cacheGenerationCount
{
  return -1LL;
}

- (BOOL)_tracksCacheGenerationCount
{
  return 0;
}

- (NSString)stringForObjectValue:(id)obj
{
  v5 = NSClassFromString((NSString *)@"NSFormatter");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSAttributedString)attributedStringForObjectValue:(id)obj withDefaultAttributes:(NSDictionary *)attrs
{
  return 0LL;
}

- (BOOL)getObjectValue:(id *)obj forString:(NSString *)string errorDescription:(NSString *)error
{
  v7 = NSClassFromString((NSString *)@"NSFormatter");
  NSRequestConcreteImplementation((uint64_t)self, a2, v7);
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 range:(_NSRange *)a5 error:(id *)a6
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  uint64_t v14 = 0LL;
  if (a5) {
    a4 = (id)objc_msgSend(a4, "substringWithRange:", a5->location, a5->length);
  }
  if (a6) {
    v9 = &v14;
  }
  else {
    v9 = 0LL;
  }
  BOOL v10 = -[NSFormatter getObjectValue:forString:errorDescription:]( self,  "getObjectValue:forString:errorDescription:",  a3,  a4,  v9,  v14,  v15);
  BOOL v11 = v10;
  if (a6 && !v10)
  {
    if (v14) {
      uint64_t v12 = [MEMORY[0x189603F68] dictionaryWithObject:v14 forKey:@"NSLocalizedDescription"];
    }
    else {
      uint64_t v12 = 0LL;
    }
    *a6 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  2048LL,  v12);
  }

  return v11;
}

- (BOOL)isPartialStringValid:(NSString *)partialString newEditingString:(NSString *)newString errorDescription:(NSString *)error
{
  return 1;
}

- (BOOL)isPartialStringValid:(NSString *)partialStringPtr proposedSelectedRange:(NSRangePointer)proposedSelRangePtr originalString:(NSString *)origString originalSelectedRange:(NSRange)origSelRange errorDescription:(NSString *)error
{
  v12[1] = *MEMORY[0x1895F89C0];
  v12[0] = 0LL;
  BOOL v9 = -[NSFormatter isPartialStringValid:newEditingString:errorDescription:]( self,  "isPartialStringValid:newEditingString:errorDescription:",  *partialStringPtr,  v12,  error,  origSelRange.location,  origSelRange.length);
  if (!v9)
  {
    BOOL v10 = (void *)v12[0];
    if (v12[0])
    {
      *partialStringPtr = (NSString *)v12[0];
      if (proposedSelRangePtr)
      {
        proposedSelRangePtr->location = [v10 length];
        proposedSelRangePtr->length = 0LL;
      }
    }
  }

  return v9;
}

@end
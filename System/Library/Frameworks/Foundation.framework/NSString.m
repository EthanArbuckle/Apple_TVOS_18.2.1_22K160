@interface NSString
+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded;
+ (BOOL)supportsSecureCoding;
+ (NSArray)readableTypeIdentifiersForItemProvider;
+ (NSArray)writableTypeIdentifiersForItemProvider;
+ (NSString)allocWithZone:(_NSZone *)a3;
+ (NSString)localizedNameOfStringEncoding:(NSStringEncoding)encoding;
+ (NSString)localizedStringWithFormat:(NSString *)format;
+ (NSString)localizedStringWithValidatedFormat:(NSString *)format validFormatSpecifiers:(NSString *)validFormatSpecifiers error:(NSError *)error;
+ (NSString)pathWithComponents:(NSArray *)components;
+ (NSString)string;
+ (NSString)stringWithBytes:(const void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5;
+ (NSString)stringWithCString:(const char *)cString encoding:(NSStringEncoding)enc;
+ (NSString)stringWithCharacters:(const unichar *)characters length:(NSUInteger)length;
+ (NSString)stringWithContentsOfFile:(NSString *)path encoding:(NSStringEncoding)enc error:(NSError *)error;
+ (NSString)stringWithContentsOfFile:(NSString *)path usedEncoding:(NSStringEncoding *)enc error:(NSError *)error;
+ (NSString)stringWithContentsOfURL:(NSURL *)url encoding:(NSStringEncoding)enc error:(NSError *)error;
+ (NSString)stringWithContentsOfURL:(NSURL *)url usedEncoding:(NSStringEncoding *)enc error:(NSError *)error;
+ (NSString)stringWithFormat:(NSString *)format;
+ (NSString)stringWithFormat:(id)a3 locale:(id)a4;
+ (NSString)stringWithString:(NSString *)string;
+ (NSString)stringWithUTF8String:(const char *)nullTerminatedCString;
+ (NSString)stringWithValidatedFormat:(NSString *)format validFormatSpecifiers:(NSString *)validFormatSpecifiers error:(NSError *)error;
+ (NSStringEncoding)defaultCStringEncoding;
+ (NSStringEncoding)stringEncodingForData:(NSData *)data encodingOptions:(NSDictionary *)opts convertedString:(NSString *)string usedLossyConversion:(BOOL *)usedLossyConversion;
+ (const)availableStringEncodings;
+ (id)_newStringFromUTF16InternalData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
+ (id)_newZStringWithCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4;
+ (id)_newZStringWithString:(id)a3;
+ (id)_newZStringWithUTF8String:(const char *)a3;
+ (id)_stringWithFormat:(id)a3 locale:(id)a4 options:(id)a5 arguments:(char *)a6;
+ (id)_web_stringRepresentationForBytes:(int64_t)a3;
+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
+ (id)stringWithCString:(const char *)bytes;
+ (id)stringWithCString:(const char *)bytes length:(NSUInteger)length;
+ (id)stringWithContentsOfFile:(NSString *)path;
+ (id)stringWithContentsOfURL:(NSURL *)url;
+ (void)initialize;
- ($2F068FC02377E22BA03580A8162C781E)decimalValue;
- (BOOL)BOOLValue;
- (BOOL)__swiftFillFileSystemRepresentationWithPointer:(char *)a3 maxLength:(int64_t)a4;
- (BOOL)_allowsDirectEncoding;
- (BOOL)_getCString:(char *)a3 maxLength:(unint64_t)a4 encoding:(unsigned int)a5;
- (BOOL)_isCString;
- (BOOL)_web_domainMatches:(id)a3;
- (BOOL)_web_hasCaseInsensitivePrefix:(id)a3;
- (BOOL)_web_hasCountryCodeTLD;
- (BOOL)_web_isCaseInsensitiveEqualToString:(id)a3;
- (BOOL)_web_isFileURL;
- (BOOL)_web_isJavaScriptURL;
- (BOOL)_web_looksLikeAbsoluteURL;
- (BOOL)_web_looksLikeIPAddress;
- (BOOL)canBeConvertedToEncoding:(NSStringEncoding)encoding;
- (BOOL)containsString:(NSString *)str;
- (BOOL)getBytes:(char *)a3 maxLength:(unint64_t)a4 filledLength:(unint64_t *)a5 encoding:(unint64_t)a6 allowLossyConversion:(BOOL)a7 range:(_NSRange)a8 remainingRange:(_NSRange *)a9;
- (BOOL)getBytes:(void *)buffer maxLength:(NSUInteger)maxBufferCount usedLength:(NSUInteger *)usedBufferCount encoding:(NSStringEncoding)encoding options:(NSStringEncodingConversionOptions)options range:(NSRange)range remainingRange:(NSRangePointer)leftover;
- (BOOL)getCString:(char *)buffer maxLength:(NSUInteger)maxBufferCount encoding:(NSStringEncoding)encoding;
- (BOOL)getExternalRepresentation:(id *)a3 extendedAttributes:(id *)a4 forWritingToURLOrPath:(id)a5 usingEncoding:(unint64_t)a6 error:(id *)a7;
- (BOOL)getFileSystemRepresentation:(char *)cname maxLength:(NSUInteger)max;
- (BOOL)hasPrefix:(NSString *)str;
- (BOOL)hasSuffix:(NSString *)str;
- (BOOL)isAbsolutePath;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToString:(NSString *)aString;
- (BOOL)isNSString__;
- (BOOL)localizedCaseInsensitiveContainsString:(NSString *)str;
- (BOOL)localizedHasPrefix:(id)a3;
- (BOOL)localizedHasSuffix:(id)a3;
- (BOOL)localizedStandardContainsString:(NSString *)str;
- (BOOL)writeToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile;
- (BOOL)writeToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile encoding:(NSStringEncoding)enc error:(NSError *)error;
- (BOOL)writeToURL:(NSURL *)url atomically:(BOOL)atomically;
- (BOOL)writeToURL:(NSURL *)url atomically:(BOOL)useAuxiliaryFile encoding:(NSStringEncoding)enc error:(NSError *)error;
- (Class)classForCoder;
- (NSArray)componentsSeparatedByCharactersInSet:(NSCharacterSet *)separator;
- (NSArray)componentsSeparatedByString:(NSString *)separator;
- (NSArray)linguisticTagsInRange:(NSRange)range scheme:(NSLinguisticTagScheme)scheme options:(NSLinguisticTaggerOptions)options orthography:(NSOrthography *)orthography tokenRanges:(NSArray *)tokenRanges;
- (NSArray)pathComponents;
- (NSArray)stringsByAppendingPaths:(NSArray *)paths;
- (NSArray)writableTypeIdentifiersForItemProvider;
- (NSAttributedString)__baseAttributedString;
- (NSComparisonResult)caseInsensitiveCompare:(NSString *)string;
- (NSComparisonResult)compare:(NSString *)string;
- (NSComparisonResult)compare:(NSString *)string options:(NSStringCompareOptions)mask;
- (NSComparisonResult)compare:(NSString *)string options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToCompare;
- (NSComparisonResult)compare:(NSString *)string options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToCompare locale:(id)locale;
- (NSComparisonResult)localizedCaseInsensitiveCompare:(NSString *)string;
- (NSComparisonResult)localizedCompare:(NSString *)string;
- (NSComparisonResult)localizedStandardCompare:(NSString *)string;
- (NSData)dataUsingEncoding:(NSStringEncoding)encoding;
- (NSData)dataUsingEncoding:(NSStringEncoding)encoding allowLossyConversion:(BOOL)lossy;
- (NSDictionary)propertyListFromStringsFileFormat;
- (NSRange)lineRangeForRange:(NSRange)range;
- (NSRange)localizedStandardRangeOfString:(NSString *)str;
- (NSRange)paragraphRangeForRange:(NSRange)range;
- (NSRange)rangeOfCharacterFromSet:(NSCharacterSet *)searchSet;
- (NSRange)rangeOfCharacterFromSet:(NSCharacterSet *)searchSet options:(NSStringCompareOptions)mask;
- (NSRange)rangeOfCharacterFromSet:(NSCharacterSet *)searchSet options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToSearch;
- (NSRange)rangeOfComposedCharacterSequenceAtIndex:(NSUInteger)index;
- (NSRange)rangeOfComposedCharacterSequencesForRange:(NSRange)range;
- (NSRange)rangeOfString:(NSString *)searchString;
- (NSRange)rangeOfString:(NSString *)searchString options:(NSStringCompareOptions)mask;
- (NSRange)rangeOfString:(NSString *)searchString options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToSearch;
- (NSRange)rangeOfString:(NSString *)searchString options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToSearch locale:(NSLocale *)locale;
- (NSString)capitalizedString;
- (NSString)capitalizedStringWithLocale:(NSLocale *)locale;
- (NSString)commonPrefixWithString:(NSString *)str options:(NSStringCompareOptions)mask;
- (NSString)decomposedStringWithCanonicalMapping;
- (NSString)decomposedStringWithCompatibilityMapping;
- (NSString)initWithBytesNoCopy:(void *)bytes length:(NSUInteger)len encoding:(NSStringEncoding)encoding deallocator:(void *)deallocator;
- (NSString)initWithBytesNoCopy:(void *)bytes length:(NSUInteger)len encoding:(NSStringEncoding)encoding freeWhenDone:(BOOL)freeBuffer;
- (NSString)initWithCString:(const char *)nullTerminatedCString encoding:(NSStringEncoding)encoding;
- (NSString)initWithCharacters:(const unichar *)characters length:(NSUInteger)length;
- (NSString)initWithCharactersNoCopy:(unichar *)characters length:(NSUInteger)length freeWhenDone:(BOOL)freeBuffer;
- (NSString)initWithCharactersNoCopy:(unichar *)chars length:(NSUInteger)len deallocator:(void *)deallocator;
- (NSString)initWithCoder:(NSCoder *)aDecoder;
- (NSString)initWithContentsOfFile:(NSString *)path encoding:(NSStringEncoding)enc error:(NSError *)error;
- (NSString)initWithContentsOfFile:(NSString *)path usedEncoding:(NSStringEncoding *)enc error:(NSError *)error;
- (NSString)initWithContentsOfURL:(NSURL *)url encoding:(NSStringEncoding)enc error:(NSError *)error;
- (NSString)initWithContentsOfURL:(NSURL *)url usedEncoding:(NSStringEncoding *)enc error:(NSError *)error;
- (NSString)initWithData:(NSData *)data encoding:(NSStringEncoding)encoding;
- (NSString)initWithData:(id)a3 usedEncoding:(unint64_t *)a4;
- (NSString)initWithFormat:(NSString *)format;
- (NSString)initWithFormat:(NSString *)format arguments:(va_list)argList;
- (NSString)initWithFormat:(NSString *)format locale:(id)locale;
- (NSString)initWithFormat:(NSString *)format locale:(id)locale arguments:(va_list)argList;
- (NSString)initWithString:(NSString *)aString;
- (NSString)initWithUTF8String:(const char *)nullTerminatedCString;
- (NSString)initWithValidatedFormat:(NSString *)format validFormatSpecifiers:(NSString *)validFormatSpecifiers arguments:(va_list)argList error:(NSError *)error;
- (NSString)initWithValidatedFormat:(NSString *)format validFormatSpecifiers:(NSString *)validFormatSpecifiers error:(NSError *)error;
- (NSString)initWithValidatedFormat:(NSString *)format validFormatSpecifiers:(NSString *)validFormatSpecifiers locale:(id)locale arguments:(va_list)argList error:(NSError *)error;
- (NSString)initWithValidatedFormat:(NSString *)format validFormatSpecifiers:(NSString *)validFormatSpecifiers locale:(id)locale error:(NSError *)error;
- (NSString)lastPathComponent;
- (NSString)localizedCapitalizedString;
- (NSString)localizedLowercaseString;
- (NSString)localizedUppercaseString;
- (NSString)lowercaseString;
- (NSString)lowercaseStringWithLocale:(NSLocale *)locale;
- (NSString)pathExtension;
- (NSString)precomposedStringWithCanonicalMapping;
- (NSString)precomposedStringWithCompatibilityMapping;
- (NSString)stringByAbbreviatingWithTildeInPath;
- (NSString)stringByAddingPercentEncodingWithAllowedCharacters:(NSCharacterSet *)allowedCharacters;
- (NSString)stringByAddingPercentEscapesUsingEncoding:(NSStringEncoding)enc;
- (NSString)stringByAppendingFormat:(NSString *)format;
- (NSString)stringByAppendingPathComponent:(NSString *)str;
- (NSString)stringByAppendingPathExtension:(NSString *)str;
- (NSString)stringByAppendingString:(NSString *)aString;
- (NSString)stringByApplyingTransform:(NSStringTransform)transform reverse:(BOOL)reverse;
- (NSString)stringByDeletingLastPathComponent;
- (NSString)stringByDeletingPathExtension;
- (NSString)stringByExpandingTildeInPath;
- (NSString)stringByFoldingWithOptions:(NSStringCompareOptions)options locale:(NSLocale *)locale;
- (NSString)stringByPaddingToLength:(NSUInteger)newLength withString:(NSString *)padString startingAtIndex:(NSUInteger)padIndex;
- (NSString)stringByRemovingPercentEncoding;
- (NSString)stringByReplacingCharactersInRange:(NSRange)range withString:(NSString *)replacement;
- (NSString)stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement;
- (NSString)stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange;
- (NSString)stringByReplacingPercentEscapesUsingEncoding:(NSStringEncoding)enc;
- (NSString)stringByResolvingSymlinksInPath;
- (NSString)stringByStandardizingPath;
- (NSString)stringByTrimmingCharactersInSet:(NSCharacterSet *)set;
- (NSString)substringFromIndex:(NSUInteger)from;
- (NSString)substringToIndex:(NSUInteger)to;
- (NSString)substringWithRange:(NSRange)range;
- (NSString)uppercaseString;
- (NSString)uppercaseStringWithLocale:(NSLocale *)locale;
- (NSString)variantFittingPresentationWidth:(NSInteger)width;
- (NSStringEncoding)fastestEncoding;
- (NSStringEncoding)smallestEncoding;
- (NSUInteger)cStringLength;
- (NSUInteger)completePathIntoString:(NSString *)outputName caseSensitive:(BOOL)flag matchesIntoArray:(NSArray *)outputArray filterTypes:(NSArray *)filterTypes;
- (NSUInteger)length;
- (NSUInteger)lengthOfBytesUsingEncoding:(NSStringEncoding)enc;
- (NSUInteger)maximumLengthOfBytesUsingEncoding:(NSStringEncoding)enc;
- (_NSRange)_rangeOfRegularExpressionPattern:(id)a3 options:(unint64_t)a4 range:(_NSRange)a5 locale:(id)a6;
- (_NSRange)_web_rangeOfURLHost;
- (_NSRange)_web_rangeOfURLResourceSpecifier_nowarn;
- (_NSRange)_web_rangeOfURLScheme_nowarn;
- (_NSRange)_web_rangeOfURLUserPasswordHostPort;
- (_NSRange)significantText;
- (const)UTF8String;
- (const)_fastCStringContents:(BOOL)a3;
- (const)_fastCharacterContents;
- (const)cString;
- (const)cStringUsingEncoding:(NSStringEncoding)encoding;
- (const)lossyCString;
- (double)doubleValue;
- (float)floatValue;
- (id)__escapeString5991;
- (id)_copyFormatStringWithConfiguration:(id)a3;
- (id)_createSubstringWithRange:(_NSRange)a3;
- (id)_initWithBytesOfUnknownEncoding:(char *)a3 length:(unint64_t)a4 copy:(BOOL)a5 usedEncoding:(unint64_t *)a6;
- (id)_initWithDataOfUnknownEncoding:(id)a3;
- (id)_initWithFormat:(id)a3 locale:(id)a4 options:(id)a5;
- (id)_initWithFormat:(id)a3 locale:(id)a4 options:(id)a5 arguments:(char *)a6;
- (id)_initWithFormat:(id)a3 options:(id)a4;
- (id)_initWithFormat:(id)a3 options:(id)a4 arguments:(char *)a5;
- (id)_initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 locale:(id)a5 options:(id)a6 error:(id *)a7;
- (id)_initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 locale:(id)a5 options:(id)a6 error:(id *)a7 arguments:(char *)a8;
- (id)_initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 options:(id)a5 error:(id *)a6;
- (id)_initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 options:(id)a5 error:(id *)a6 arguments:(char *)a7;
- (id)_newSubstringWithRange:(_NSRange)a3 zone:(_NSZone *)a4;
- (id)_stringByReplacingOccurrencesOfRegularExpressionPattern:(id)a3 withTemplate:(id)a4 options:(unint64_t)a5 range:(_NSRange)a6;
- (id)_stringByResolvingSymlinksInPathUsingCache:(BOOL)a3;
- (id)_stringByStandardizingPathUsingCache:(BOOL)a3;
- (id)_stringRepresentation;
- (id)_urlStringByInsertingPathResolveFlags:(unsigned int)a3;
- (id)_urlStringByInsertingQueryResolveFlags:(unsigned int)a3;
- (id)_urlStringByRemovingResolveFlags;
- (id)_web_HTTPStyleLanguageCode;
- (id)_web_HTTPStyleLanguageCodeWithoutRegion;
- (id)_web_URLFragment;
- (id)_web_characterSetFromContentTypeHeader_nowarn;
- (id)_web_domainFromHost;
- (id)_web_fileNameFromContentDispositionHeader_nowarn;
- (id)_web_filenameByFixingIllegalCharacters;
- (id)_web_fixedCarbonPOSIXPath;
- (id)_web_mimeTypeFromContentTypeHeader_nowarn;
- (id)_web_parseAsKeyValuePairHandleQuotes_nowarn:(BOOL)a3;
- (id)_web_parseAsKeyValuePair_nowarn;
- (id)_web_splitAtNonDateCommas_nowarn;
- (id)_web_stringByCollapsingNonPrintingCharacters;
- (id)_web_stringByExpandingTildeInPath;
- (id)_web_stringByReplacingValidPercentEscapes_nowarn;
- (id)_web_stringByTrimmingWhitespace;
- (id)_widthVariants;
- (id)copyWithZone:(_NSZone *)a3;
- (id)displayableString;
- (id)formatConfiguration;
- (id)initWithCString:(const char *)bytes;
- (id)initWithCString:(const char *)bytes length:(NSUInteger)length;
- (id)initWithCStringNoCopy:(char *)bytes length:(NSUInteger)length freeWhenDone:(BOOL)freeBuffer;
- (id)initWithContentsOfFile:(NSString *)path;
- (id)initWithContentsOfURL:(NSURL *)url;
- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)propertyList;
- (id)quotedStringRepresentation;
- (id)standardizedURLPath;
- (id)stringByAddingPercentEscapes;
- (id)stringByConvertingPathToURL;
- (id)stringByConvertingURLToPath;
- (id)stringByRemovingPercentEscapes;
- (int)intValue;
- (int64_t)_web_countOfString:(id)a3;
- (uint64_t)longLongValue;
- (unichar)characterAtIndex:(NSUInteger)index;
- (unsigned)_encodingCantBeStoredInEightBitCFString;
- (unsigned)_fastestEncodingInCFStringEncoding;
- (unsigned)_pathResolveFlags;
- (unsigned)_queryResolveFlags;
- (unsigned)_smallestEncodingInCFStringEncoding;
- (unsigned)_web_extractFourCharCode;
- (void)__graphemeCount;
- (void)_flushRegularExpressionCaches;
- (void)_getBlockStart:(unint64_t *)a3 end:(unint64_t *)a4 contentsEnd:(unint64_t *)a5 forRange:(_NSRange)a6 stopAtLineSeparators:(BOOL)a7;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateLinesUsingBlock:(void *)block;
- (void)enumerateLinguisticTagsInRange:(NSRange)range scheme:(NSLinguisticTagScheme)scheme options:(NSLinguisticTaggerOptions)options orthography:(NSOrthography *)orthography usingBlock:(void *)block;
- (void)enumerateSubstringsInRange:(NSRange)range options:(NSStringEnumerationOptions)opts usingBlock:(void *)block;
- (void)getCString:(char *)bytes;
- (void)getCString:(char *)bytes maxLength:(NSUInteger)maxLength;
- (void)getCString:(char *)bytes maxLength:(NSUInteger)maxLength range:(NSRange)aRange remainingRange:(NSRangePointer)leftoverRange;
- (void)getCharacters:(unichar *)buffer;
- (void)getCharacters:(unichar *)buffer range:(NSRange)range;
- (void)getLineStart:(NSUInteger *)startPtr end:(NSUInteger *)lineEndPtr contentsEnd:(NSUInteger *)contentsEndPtr forRange:(NSRange)range;
- (void)getParagraphStart:(NSUInteger *)startPtr end:(NSUInteger *)parEndPtr contentsEnd:(NSUInteger *)contentsEndPtr forRange:(NSRange)range;
@end

@implementation NSString

+ (NSString)allocWithZone:(_NSZone *)a3
{
  if ((id)__NSStringClass == a1) {
    return (NSString *)&__placeholder;
  }
  else {
    return (NSString *)NSAllocateObject((Class)a1, 0LL, a3);
  }
}

- (NSString)initWithFormat:(NSString *)format
{
  return -[NSString initWithFormat:locale:arguments:](self, "initWithFormat:locale:arguments:", format, 0LL, va, va);
}

- (NSAttributedString)__baseAttributedString
{
  return 0LL;
}

- (id)formatConfiguration
{
  return 0LL;
}

- (NSString)initWithFormat:(NSString *)format locale:(id)locale
{
  return -[NSString initWithFormat:locale:arguments:](self, "initWithFormat:locale:arguments:", format, locale, va, va);
}

- (unsigned)_encodingCantBeStoredInEightBitCFString
{
  NSStringEncoding v2 = -[NSString fastestEncoding](self, "fastestEncoding");
  v3 = (CFStringEncoding *)MEMORY[0x189604970];
  CFStringEncoding v4 = *MEMORY[0x189604970];
  if (*MEMORY[0x189604970] == -1)
  {
    __CFStringComputeEightBitStringEncoding();
    CFStringEncoding v4 = *v3;
  }

  return v2 != CFStringConvertEncodingToNSStringEncoding(v4);
}

- (NSComparisonResult)compare:(NSString *)string
{
  if (self == string) {
    return 0LL;
  }
  else {
    return -[NSString compare:options:range:]( self,  "compare:options:range:",  string,  0LL,  0LL,  -[NSString length](self, "length"));
  }
}

- (NSComparisonResult)compare:(NSString *)string options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToCompare
{
  if (self == string) {
    return 0LL;
  }
  else {
    return -[NSString compare:options:range:locale:](self, "compare:options:range:locale:");
  }
}

- (NSComparisonResult)compare:(NSString *)string options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToCompare locale:(id)locale
{
  if (self == string) {
    return 0LL;
  }
  if (!string) {
    return 1LL;
  }
  CFIndex length = rangeOfReceiverToCompare.length;
  CFIndex location = rangeOfReceiverToCompare.location;
  if (locale)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0) {
      v13 = (const __CFLocale *)locale;
    }
    else {
      v13 = 0LL;
    }
    if ((isKindOfClass & 1) == 0) {
      mask |= 0x20uLL;
    }
  }

  else
  {
    v13 = 0LL;
  }

  v15.CFIndex location = location;
  v15.CFIndex length = length;
  return CFStringCompareWithOptionsAndLocale( (CFStringRef)self,  (CFStringRef)string,  v15,  ~(8 * (_BYTE)mask) & 0x10 | mask,  v13);
}

- (id)_stringRepresentation
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  NSUInteger v3 = -[NSString length](self, "length");
  if (!v3) {
    return @"\"\"";
  }
  NSUInteger v18 = v3;
  uint64_t v19 = 0LL;
  if (v3 >= 0x20) {
    uint64_t v4 = 32LL;
  }
  else {
    uint64_t v4 = v3;
  }
  v17 = self;
  unint64_t v15 = v4;
  objc_msgSend(self, sel_getUid("getCharacters:range:"), v20, 0, v4);
  int v5 = v20[0];
  __int16 v21 = v20[0];
  uint64_t v16 = 1LL;
  unint64_t v6 = 1LL;
  while (v6 - 1 < v15)
  {
    unsigned int v7 = (v5 & 0xFFDF) - 65;
    unsigned int v8 = v5 - 48;
    BOOL v10 = v7 < 0x1A || v8 < 0xA;
    if (v6 >= v15)
    {
      uint64_t v12 = v19 + v15;
      if (v18 <= v19 + v15)
      {
        unint64_t v6 = v15 + 1;
        uint64_t v16 = v15 + 1;
        int v5 = 0xFFFF;
        goto LABEL_22;
      }

      if (v18 - (v19 + v15) >= 0x20) {
        uint64_t v13 = 32LL;
      }
      else {
        uint64_t v13 = v18 - (v19 + v15);
      }
      v19 += v15;
      unint64_t v15 = v13;
      objc_msgSend(v17, sel_getUid("getCharacters:range:"), v20, v12, v13);
      int v5 = v20[0];
      __int16 v21 = v20[0];
      uint64_t v16 = 1LL;
      unint64_t v6 = 1LL;
      if (!v10) {
        return -[NSString quotedStringRepresentation](self, "quotedStringRepresentation");
      }
    }

    else
    {
      v11 = (char *)&v15 + 2 * v6++;
      uint64_t v16 = v6;
      int v5 = *((unsigned __int16 *)v11 + 20);
LABEL_22:
      __int16 v21 = v5;
      if (!v10) {
        return -[NSString quotedStringRepresentation](self, "quotedStringRepresentation");
      }
    }
  }

  return -[NSString copyWithZone:](self, "copyWithZone:", 0LL);
}

- (id)quotedStringRepresentation
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  NSUInteger v3 = -[NSString length](self, "length");
  if (!v3) {
    return @"\"\"";
  }
  unint64_t v4 = v3;
  if (6 * v3 + 3 <= 0x186A0) {
    unint64_t v5 = 6 * v3 + 3;
  }
  else {
    unint64_t v5 = v3 + 9;
  }
  id result = (id)MEMORY[0x186E1D20C](0LL, v5, 0LL);
  if (result)
  {
    unsigned int v7 = result;
    *(_BYTE *)id result = 34;
    uint64_t v24 = 0LL;
    if (v4 >= 0x20) {
      uint64_t v8 = 32LL;
    }
    else {
      uint64_t v8 = v4;
    }
    v23 = self;
    unint64_t v21 = v8;
    objc_msgSend(self, sel_getUid("getCharacters:range:"));
    unsigned __int16 v9 = v25[0];
    unsigned __int16 v26 = v25[0];
    unint64_t v22 = 1LL;
    uint64_t v10 = 1LL;
    unint64_t v11 = 1LL;
    while (1)
    {
      if (v11 > v5 - 8)
      {
        unint64_t v12 = 6 * (v4 + 1 - v10 - v24) + 2;
        if (v5 < v12) {
          unint64_t v12 = v5;
        }
        v5 += v12;
        id result = (id)__CFSafelyReallocateWithAllocator();
        if (!result) {
          return result;
        }
        unsigned int v7 = result;
        unsigned __int16 v9 = v26;
      }

      switch(v9)
      {
        case 7u:
          LOBYTE(v9) = 97;
          goto LABEL_27;
        case 8u:
          LOBYTE(v9) = 98;
          goto LABEL_27;
        case 9u:
          LOBYTE(v9) = 116;
          goto LABEL_27;
        case 0xAu:
          LOBYTE(v9) = 110;
          goto LABEL_27;
        case 0xBu:
          LOBYTE(v9) = 118;
          goto LABEL_27;
        case 0xCu:
          LOBYTE(v9) = 102;
          goto LABEL_27;
        default:
          if (v9 == 92)
          {
            LOBYTE(v9) = 92;
            goto LABEL_27;
          }

          if (v9 == 34)
          {
            LOBYTE(v9) = 34;
LABEL_27:
            unint64_t v13 = v11 + 1;
            v7[v11] = 92;
            uint64_t v14 = 2LL;
LABEL_28:
            v11 += v14;
            v7[v13] = v9;
            goto LABEL_29;
          }

          if (v9 >= 0x80u)
          {
            uint64_t v19 = &v7[v11];
            *(_WORD *)uint64_t v19 = 21852;
            v19[2] = a0123456789abcd[(unint64_t)v9 >> 12];
            v19[3] = a0123456789abcd[((unint64_t)v9 >> 8) & 0xF];
            unint64_t v13 = v11 + 5;
            v19[4] = a0123456789abcd[v9 >> 4];
            LOBYTE(v9) = a0123456789abcd[v9 & 0xF];
            uint64_t v14 = 6LL;
            goto LABEL_28;
          }

          if ((_BYTE)v9)
          {
            uint64_t v14 = 1LL;
            unint64_t v13 = v11;
            goto LABEL_28;
          }

+ (NSString)stringWithFormat:(NSString *)format
{
  NSUInteger v3 = (NSString *)[objc_allocWithZone((Class)a1) initWithFormat:format locale:0 arguments:va];
  unint64_t v4 = v3;
  return v3;
}

- (BOOL)getBytes:(void *)buffer maxLength:(NSUInteger)maxBufferCount usedLength:(NSUInteger *)usedBufferCount encoding:(NSStringEncoding)encoding options:(NSStringEncodingConversionOptions)options range:(NSRange)range remainingRange:(NSRangePointer)leftover
{
  char v9 = options;
  CFStringEncoding v13 = CFStringConvertNSStringEncodingToEncoding(encoding);
  if (v13 == -1)
  {
    if (encoding != 134217984 && encoding)
    {
      CFStringEncoding v13 = -1;
    }

    else
    {
      if (_CFExecutableLinkedOnOrAfter()) {
        NSLog( (NSString *)@"Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future.",  encoding);
      }
      CFStringEncoding v13 = 1536;
    }
  }

  NSUInteger v14 = -[NSString length](self, "length");
  if (!v14) {
    goto LABEL_13;
  }
  if (!CFStringIsEncodingAvailable(v13))
  {
    BOOL v15 = 0;
    NSUInteger v14 = 0LL;
    if (!usedBufferCount) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }

  NSUInteger v14 = __CFStringEncodeByteStream();
  if ((v9 & 4) == 0 || v14 >= range.length)
  {
    if (v14)
    {
LABEL_13:
      BOOL v15 = 1;
      if (!usedBufferCount) {
        goto LABEL_17;
      }
LABEL_16:
      *usedBufferCount = 0LL;
      goto LABEL_17;
    }
  }

  BOOL v15 = 0;
  if (usedBufferCount) {
    goto LABEL_16;
  }
LABEL_17:
  if (leftover)
  {
    leftover->CFIndex location = v14 + range.location;
    leftover->CFIndex length = range.length - v14;
  }

  return v15;
}

+ (NSString)stringWithCString:(const char *)cString encoding:(NSStringEncoding)enc
{
  if (cString) {
    return (NSString *)(id)[objc_allocWithZone((Class)a1) initWithBytes:cString length:strlen(cString) encoding:enc];
  }
  unint64_t v5 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: NULL cString", _NSMethodExceptionProem((objc_class *)a1, a2)), 0 reason userInfo];
  objc_exception_throw(v5);
  return -[NSString lastPathComponent](v6, v7);
}

- (NSString)lastPathComponent
{
  v15[1] = *MEMORY[0x1895F89C0];
  NSUInteger v3 = -[NSString length](self, "length");
  v15[0] = v3;
  unint64_t v4 = MEMORY[0x1895F8858](v3);
  SEL v7 = (_WORD *)((char *)v15 - v6);
  if (v4 > 0x100) {
    SEL v7 = malloc(2 * v5);
  }
  else {
    bzero((char *)v15 - v6, 2 * v5);
  }
  -[NSString getCharacters:range:](self, "getCharacters:range:", v7, 0LL, v3, v15[0]);
  _NSTransmutePathSlashes(v7, v15);
  uint64_t v8 = v15[0];
  if (v15[0] >= 2)
  {
    if (v7[v15[0] - 1] != 47)
    {
LABEL_10:
      uint64_t v11 = v8;
      do
      {
        uint64_t v10 = v11 - 1;
        if (v11 == 1) {
          break;
        }
        int v12 = (unsigned __int16)v7[v11-- - 2];
      }

      while (v12 != 47);
      goto LABEL_15;
    }

    do
    {
      if ((unint64_t)v8 <= 2)
      {
        uint64_t v10 = 0LL;
        uint64_t v8 = 1LL;
        v15[0] = 1LL;
        goto LABEL_15;
      }

      int v9 = (unsigned __int16)v7[v8-- - 2];
    }

    while (v9 == 47);
    v15[0] = v8;
    if (v8 >= 2) {
      goto LABEL_10;
    }
  }

  uint64_t v10 = 0LL;
LABEL_15:
  CFStringEncoding v13 = +[NSPathStore2 pathStoreWithCharacters:length:]( &OBJC_CLASS___NSPathStore2,  "pathStoreWithCharacters:length:",  &v7[v10],  v8 - v10,  v15[0]);
  if (v3 >= 0x101) {
    free(v7);
  }
  return v13;
}

- (NSStringEncoding)fastestEncoding
{
  return 10LL;
}

- (const)UTF8String
{
  return (const char *)bytesInEncoding(self, 4LL, 0, 0, 0);
}

- (BOOL)getCString:(char *)buffer maxLength:(NSUInteger)maxBufferCount encoding:(NSStringEncoding)encoding
{
  v8[1] = *MEMORY[0x1895F89C0];
  if (maxBufferCount > 1)
  {
    BOOL v6 = -[NSString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:]( self,  "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:",  buffer,  maxBufferCount - 1,  v8,  encoding,  4LL,  0LL,  -[NSString length](self, "length"),  0LL);
    if (v6)
    {
      buffer[v8[0]] = 0;
      LOBYTE(v6) = 1;
    }

    else
    {
      *buffer = 0;
    }
  }

  else
  {
    if (maxBufferCount == 1) {
      *buffer = 0;
    }
    LOBYTE(v6) = -[NSString length](self, "length") == 0;
  }

  return v6;
}

- (Class)classForCoder
{
  return (Class)__NSStringClass;
}

- (BOOL)isNSString__
{
  return 1;
}

- (const)_fastCharacterContents
{
  return 0LL;
}

+ (NSString)stringWithString:(NSString *)string
{
  return (NSString *)(id)[objc_allocWithZone((Class)a1) initWithString:string];
}

- (uint64_t)longLongValue
{
  v4[1] = *MEMORY[0x1895F89C0];
  unint64_t v3 = 0LL;
  if (_NSScanLongLongFromString( self,  +[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"),  v4,  &v3)) {
    return v4[0];
  }
  else {
    return 0LL;
  }
}

- (NSData)dataUsingEncoding:(NSStringEncoding)encoding
{
  return -[NSString dataUsingEncoding:allowLossyConversion:]( self,  "dataUsingEncoding:allowLossyConversion:",  encoding,  0LL);
}

- (NSData)dataUsingEncoding:(NSStringEncoding)encoding allowLossyConversion:(BOOL)lossy
{
  v15[1] = *MEMORY[0x1895F89C0];
  NSUInteger v7 = -[NSString length](self, "length");
  CFStringEncoding v8 = CFStringConvertNSStringEncodingToEncoding(encoding);
  if (v8 == -1)
  {
    if (encoding != 134217984 && encoding)
    {
      CFStringEncoding v8 = -1;
    }

    else
    {
      if (_CFExecutableLinkedOnOrAfter()) {
        NSLog( (NSString *)@"Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future.",  encoding);
      }
      CFStringEncoding v8 = 1536;
    }
  }

  if (CFStringIsEncodingAvailable(v8))
  {
    uint64_t v9 = __CFStringEncodeByteStream();
    id result = 0LL;
    if (v9 == v7)
    {
      id v11 = objc_allocWithZone(MEMORY[0x189603FB8]);
      int v12 = (void *)objc_msgSend(v11, "initWithLength:", v15[0], v15);
      CFStringEncoding v13 = v12;
      if (!v15[0]) {
        return (NSData *)v13;
      }
      [v12 mutableBytes];
      if (__CFStringEncodeByteStream() == v7)
      {
        objc_msgSend(v13, "setLength:", v15[0], v15);
        return (NSData *)v13;
      }

      NSUInteger v14 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: didn't convert all characters", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
      objc_exception_throw(v14);
      return (NSData *)+[NSMutableData(NSMutableData) allocWithZone:]();
    }
  }

  else
  {
    NSLog((NSString *)@"Unknown encoding %ld", encoding);
    return 0LL;
  }

  return result;
}

- (NSComparisonResult)caseInsensitiveCompare:(NSString *)string
{
  return -[NSString compare:options:range:]( self,  "compare:options:range:",  string,  1LL,  0LL,  -[NSString length](self, "length"));
}

+ (NSString)string
{
  return (NSString *)(id)[objc_allocWithZone((Class)a1) init];
}

- (NSString)stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement
{
  return -[NSString stringByReplacingOccurrencesOfString:withString:options:range:]( self,  "stringByReplacingOccurrencesOfString:withString:options:range:",  target,  replacement,  0LL,  0LL,  -[NSString length](self, "length"));
}

- (NSString)stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange
{
  if (replacement)
  {
    NSUInteger length = searchRange.length;
    NSUInteger location = searchRange.location;
    if ((options & 0x400) != 0)
    {
      return (NSString *)-[NSString _stringByReplacingOccurrencesOfRegularExpressionPattern:withTemplate:options:range:]( self,  "_stringByReplacingOccurrencesOfRegularExpressionPattern:withTemplate:options:range:",  target,  replacement,  options,  searchRange.location,  searchRange.length);
    }

    else
    {
      int v12 = (NSString *)-[NSString mutableCopy](self, "mutableCopy");
      if (-[NSString replaceOccurrencesOfString:withString:options:range:]( v12,  "replaceOccurrencesOfString:withString:options:range:",  target,  replacement,  options,  location,  length))
      {
        CFStringEncoding v13 = v12;
      }

      else
      {

        CFStringEncoding v13 = self;
      }

      return v13;
    }
  }

  else
  {
    BOOL v15 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v15);
    -[NSNotificationCenter addObserver:selector:name:object:](v16, v17, v18, v19, v20, v21);
  }

  return result;
}

- (NSString)stringByAppendingString:(NSString *)aString
{
  if (aString)
  {
    if (-[NSString length](self, "length"))
    {
      if (-[NSString length](aString, "length"))
      {
        uint64_t v5 = (malloc_zone_t *)-[NSString zone](self, "zone");
        CFStringEncoding v13 = _NSNewStringByAppendingStrings(v5, v6, v7, v8, v9, v10, v11, v12, (size_t)self, (uint64_t)aString);
        return v13;
      }

      NSUInteger v14 = self;
    }

    else
    {
      NSUInteger v14 = aString;
    }

    CFStringEncoding v13 = -[NSString copyWithZone:](v14, "copyWithZone:", 0LL);
    return v13;
  }

  unint64_t v16 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
  objc_exception_throw(v16);
  return _NSNewStringByAppendingStrings(v17, v18, v19, v20, v21, v22, v23, v24, v25, v26);
}

- (NSString)stringByReplacingCharactersInRange:(NSRange)range withString:(NSString *)replacement
{
  if (replacement)
  {
    NSUInteger length = range.length;
    NSUInteger location = range.location;
    uint64_t v7 = (void *)-[NSString mutableCopy](self, "mutableCopy");
    objc_msgSend(v7, "replaceCharactersInRange:withString:", location, length, replacement);
    return (NSString *)v7;
  }

  else
  {
    uint64_t v9 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
    return (NSString *)-[NSUserDefaults(NSUserDefaults) release]();
  }

- (NSString)initWithFormat:(NSString *)format arguments:(va_list)argList
{
  return -[NSString initWithFormat:locale:arguments:](self, "initWithFormat:locale:arguments:", format, 0LL, argList);
}

- (id)_newSubstringWithRange:(_NSRange)a3 zone:(_NSZone *)a4
{
  CFIndex length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger v8 = -[NSString length](self, "length");
  if (!length) {
    return &stru_189CA6A28;
  }
  if (!location && length == v8) {
    return -[NSString copyWithZone:](self, "copyWithZone:", a4);
  }
  uint64_t v10 = -[NSString _fastCStringContents:](self, "_fastCStringContents:", 0LL);
  if (v10)
  {
    uint64_t v11 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    uint64_t v12 = (const UInt8 *)&v10[location];
    CFStringEncoding v13 = (CFStringEncoding *)MEMORY[0x189604970];
    CFStringEncoding v14 = *MEMORY[0x189604970];
    if (*MEMORY[0x189604970] == -1)
    {
      __CFStringComputeEightBitStringEncoding();
      CFStringEncoding v14 = *v13;
    }

    return (id)CFStringCreateWithBytes(v11, v12, length, v14, 0);
  }

  else
  {
    BOOL v15 = (malloc_zone_t *)a4;
    if (!a4) {
      BOOL v15 = malloc_default_zone();
    }
    unint64_t v16 = malloc_zone_malloc(v15, 2 * length);
    -[NSString getCharacters:range:](self, "getCharacters:range:", v16, location, length);
    return -[NSString initWithCharactersNoCopy:length:freeWhenDone:]( +[NSString allocWithZone:](&OBJC_CLASS___NSString, "allocWithZone:", a4),  "initWithCharactersNoCopy:length:freeWhenDone:",  v16,  length,  1LL);
  }

- (NSString)initWithUTF8String:(const char *)nullTerminatedCString
{
  if (nullTerminatedCString)
  {
    if (self == (NSString *)&__placeholder || _CFExecutableLinkedOnOrAfter()) {
      return (NSString *)CFStringCreateWithCString( (CFAllocatorRef)*MEMORY[0x189604DB0],  nullTerminatedCString,  0x8000100u);
    }
    else {
      return -[NSString initWithBytes:length:encoding:]( self,  "initWithBytes:length:encoding:",  nullTerminatedCString,  strlen(nullTerminatedCString),  4LL);
    }
  }

  else
  {
    uint64_t v6 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: NULL cString", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v6);
    return (NSString *)type metadata accessor for String.Encoding();
  }

- (BOOL)hasPrefix:(NSString *)str
{
  return -[NSString rangeOfString:options:range:]( self,  "rangeOfString:options:range:",  str,  8LL,  0LL,  -[NSString length](self, "length")) != 0x7FFFFFFFFFFFFFFFLL;
}

- (NSRange)rangeOfString:(NSString *)searchString options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToSearch
{
  NSUInteger v5 = -[NSString rangeOfString:options:range:locale:]( self,  "rangeOfString:options:range:locale:",  searchString,  mask,  rangeOfReceiverToSearch.location,  rangeOfReceiverToSearch.length,  0LL);
  result.CFIndex length = v6;
  result.NSUInteger location = v5;
  return result;
}

- (NSRange)rangeOfString:(NSString *)searchString options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToSearch locale:(NSLocale *)locale
{
  NSUInteger length = rangeOfReceiverToSearch.length;
  NSUInteger location = rangeOfReceiverToSearch.location;
  uint64_t v26 = *MEMORY[0x1895F89C0];
  NSUInteger v13 = -[NSString length](searchString, "length");
  NSUInteger v14 = -[NSString length](self, "length");
  if (v14 < length || location > v14 - length)
  {
    if (_CFExecutableLinkedOnOrAfter())
    {
      uint64_t v19 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: Range {%lu, %lu} out of bounds; string length %lu",
              _NSMethodExceptionProem((objc_class *)self, a2),
              location,
              length,
              v14);
      uint64_t v20 = (void *)MEMORY[0x189603F70];
      uint64_t v21 = (void *)MEMORY[0x189603B40];
      goto LABEL_17;
    }

    if ((rangeOfString_options_range_locale__warnonce & 1) == 0)
    {
      rangeOfString_options_range_locale__warnonce = 1;
      BOOL v15 = _NSMethodExceptionProem((objc_class *)self, a2);
      v27.NSUInteger location = location;
      v27.NSUInteger length = length;
      unint64_t v16 = NSStringFromRange(v27);
      NSLog( (NSString *)@"*** %@: Invalid range %@; this will become an exception for apps linked on SnowLeopard. Warning shown once per app execution.",
        v15,
        v16);
    }
  }

  if (!searchString)
  {
    uint64_t v19 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: nil argument",  _NSMethodExceptionProem((objc_class *)self, a2));
    uint64_t v20 = (void *)MEMORY[0x189603F70];
    uint64_t v21 = (void *)MEMORY[0x189603A60];
LABEL_17:
    objc_exception_throw((id)[v20 exceptionWithName:*v21 reason:v19 userInfo:0]);
    NSUInteger v18 = (NSUInteger)-[NSString componentsSeparatedByString:](v22, v23, v24);
    goto LABEL_18;
  }

  if ((mask & 0x400) != 0)
  {
    NSUInteger v18 = -[NSString _rangeOfRegularExpressionPattern:options:range:locale:]( self,  "_rangeOfRegularExpressionPattern:options:range:locale:",  searchString,  mask,  location,  length,  locale);
  }

  else
  {
    CFIndex v17 = 0LL;
    NSUInteger v18 = 0x7FFFFFFFFFFFFFFFLL;
    if (length && v13)
    {
      v29.NSUInteger location = location;
      v29.NSUInteger length = length;
      if (CFStringFindWithOptionsAndLocale( (CFStringRef)self,  (CFStringRef)searchString,  v29,  ~(8 * (_BYTE)mask) & 0x10 | mask,  (CFLocaleRef)locale,  &result))
      {
        NSUInteger v18 = result.location;
        CFIndex v17 = result.length;
      }

      else
      {
        CFIndex v17 = 0LL;
        NSUInteger v18 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
  }

- (NSArray)componentsSeparatedByString:(NSString *)separator
{
  uint64_t v5 = -[NSString rangeOfString:options:range:]( self,  "rangeOfString:options:range:",  separator,  0LL,  0LL,  -[NSString length](self, "length"));
  if (v6)
  {
    uint64_t v7 = v5;
    uint64_t v8 = v6;
    NSUInteger v9 = -[NSString length](self, "length");
    uint64_t v10 = (NSArray *)[MEMORY[0x189603FA8] array];
    uint64_t v11 = -[NSString zone](self, "zone");
    uint64_t v12 = 0LL;
    do
    {
      id v13 = -[NSString _newSubstringWithRange:zone:](self, "_newSubstringWithRange:zone:", v12, v7 - v12, v11);
      -[NSArray addObject:](v10, "addObject:", v13);

      uint64_t v12 = v7 + v8;
      NSUInteger v14 = v9 - (v7 + v8);
      uint64_t v7 = -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", separator, 0LL, v7 + v8, v14);
      uint64_t v8 = v15;
    }

    while (v15);
    id v16 = -[NSString _newSubstringWithRange:zone:](self, "_newSubstringWithRange:zone:", v12, v14, v11);
    -[NSArray addObject:](v10, "addObject:", v16);
  }

  else
  {
    id v16 = (id)-[NSString copy](self, "copy");
    uint64_t v10 = (NSArray *)[MEMORY[0x189603F18] arrayWithObject:v16];
  }

  return v10;
}

- (NSString)substringToIndex:(NSUInteger)to
{
  NSUInteger v6 = -[NSString length](self, "length");
  if (v6 >= to) {
    return -[NSString substringWithRange:](self, "substringWithRange:", 0LL, to);
  }
  uint64_t v8 = (void *)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603B40],  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@: Index %lu out of bounds; string length %lu",
                   _NSMethodExceptionProem((objc_class *)self, a2),
                   to,
                   v6),
                 0LL);
  objc_exception_throw(v8);
  return (NSString *)+[NSCharacterSet letterCharacterSet](v9, v10);
}

- (NSString)stringByTrimmingCharactersInSet:(NSCharacterSet *)set
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  if (!set)
  {
    NSRange v28 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v28);
  }

  NSUInteger v5 = -[NSString length](self, "length");
  NSUInteger v6 = v5;
  unint64_t v31 = v5;
  unint64_t v32 = 0LL;
  v30 = self;
  if (!v5)
  {
    __int128 v29 = xmmword_183723F60;
    __int16 v34 = -1;
    uint64_t v12 = 1LL;
    goto LABEL_21;
  }

  if (v5 >= 0x20) {
    uint64_t v7 = 32LL;
  }
  else {
    uint64_t v7 = v5;
  }
  *(void *)&__int128 v29 = v7;
  objc_msgSend(self, sel_getUid("getCharacters:range:"), v33, 0, v7);
  unsigned __int16 v8 = v33[0];
  *((void *)&v29 + 1) = 1LL;
  __int16 v34 = v33[0];
  while (1)
  {
    BOOL v9 = -[NSCharacterSet characterIsMember:](set, "characterIsMember:", v8);
    uint64_t v10 = *((void *)&v29 + 1);
    if (!v9) {
      break;
    }
    unint64_t v11 = v29;
    if (*((void *)&v29 + 1) >= (unint64_t)v29)
    {
      uint64_t v13 = v32 + v29;
      if (v31 > v32 + (unint64_t)v29)
      {
        if (v31 - (v32 + (void)v29) >= 0x20) {
          uint64_t v14 = 32LL;
        }
        else {
          uint64_t v14 = v31 - (v32 + v29);
        }
        v32 += v29;
        *(void *)&__int128 v29 = v14;
        objc_msgSend(v30, sel_getUid("getCharacters:range:"), v33, v13, v14);
        unsigned __int16 v8 = v33[0];
        __int16 v34 = v33[0];
        *((void *)&v29 + 1) = 1LL;
        unint64_t v11 = v29;
        uint64_t v12 = 1LL;
        goto LABEL_17;
      }

      uint64_t v12 = v29 + 1;
      *((void *)&v29 + 1) = v29 + 1;
      unsigned __int16 v8 = -1;
    }

    else
    {
      uint64_t v12 = ++*((void *)&v29 + 1);
      unsigned __int16 v8 = v33[v10];
    }

    __int16 v34 = v8;
LABEL_17:
    if (v12 - 1 >= v11) {
      goto LABEL_21;
    }
  }

  uint64_t v12 = *((void *)&v29 + 1);
LABEL_21:
  unint64_t v15 = v32;
  unint64_t v16 = v12 + v32 - 1;
  if (v16 == v6) {
    return (NSString *)&stru_189CA6A28;
  }
  unint64_t v18 = v6 - 1;
  if (v16 >= v6 - 1)
  {
    uint64_t v21 = 1LL;
  }

  else
  {
    if (v32 > v18 || (unint64_t)v29 + v32 <= v18)
    {
      if (v18 > 0xF)
      {
        unint64_t v20 = v31;
        if (v31 - 16 >= v18)
        {
          unint64_t v19 = v6 - 17;
        }

        else if (v31 >= 0x20)
        {
          unint64_t v19 = v31 - 32;
        }

        else
        {
          unint64_t v19 = 0LL;
        }

        unint64_t v32 = v19;
      }

      else
      {
        unint64_t v19 = 0LL;
        unint64_t v32 = 0LL;
        unint64_t v20 = v31;
      }

      unint64_t v22 = v20 - v19;
      if (v22 >= 0x20) {
        uint64_t v23 = 32LL;
      }
      else {
        uint64_t v23 = v22;
      }
      *(void *)&__int128 v29 = v23;
      objc_msgSend(v30, sel_getUid("getCharacters:range:"), v33, v19, v23);
      __int16 v34 = v33[0];
      unint64_t v15 = v32;
    }

    unint64_t v24 = v18 - v15;
    *((void *)&v29 + 1) = v24 + 1;
    __int16 v34 = v33[v24];
    if (-[NSCharacterSet characterIsMember:](set, "characterIsMember:"))
    {
      do
      {
        uint64_t v25 = *((void *)&v29 + 1);
        if (*((void *)&v29 + 1) - 1LL + v32 < v16) {
          break;
        }
        if (*((void *)&v29 + 1) < 2uLL)
        {
          if (v32)
          {
            uint64_t v27 = v32 >= 0x20 ? 32LL : v32;
            *(void *)&__int128 v29 = v27;
            *((void *)&v29 + 1) = v27;
            v32 -= v27;
            objc_msgSend(v30, sel_getUid("getCharacters:range:"), v33, v32, v27);
            __int16 v26 = v33[*((void *)&v29 + 1) - 1];
          }

          else
          {
            *((void *)&v29 + 1) = 0LL;
            __int16 v26 = -1;
          }
        }

        else
        {
          --*((void *)&v29 + 1);
          __int16 v26 = v33[v25 - 2];
        }

        __int16 v34 = v26;
      }

      while (-[NSCharacterSet characterIsMember:](set, "characterIsMember:"));
    }

    uint64_t v21 = v32 - v16 + *((void *)&v29 + 1);
  }

  return -[NSString substringWithRange:](self, "substringWithRange:", v16, v21);
}

- (unsigned)_pathResolveFlags
{
  id v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(self);
  unint64_t v5 = v4;
  NSUInteger v6 = self;
  unint64_t v7 = String._pathResolveFlags(prefixLength:)(&v9, (unint64_t)v3, v5);

  swift_bridgeObjectRelease();
  if ((v7 & 0x100000000LL) != 0) {
    return 0;
  }
  else {
    return v7;
  }
}

- (unsigned)_queryResolveFlags
{
  id v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(self);
  unint64_t v5 = v4;
  NSUInteger v6 = self;
  LODWORD(v3) = String._queryResolveFlags()((uint64_t)v3, v5);

  swift_bridgeObjectRelease();
  return v3;
}

- (id)_urlStringByInsertingPathResolveFlags:(unsigned int)a3
{
  return @objc NSString._urlStringByInsertingPathResolveFlags(_:)( self,  (uint64_t)a2,  *(uint64_t *)&a3,  (void (*)(uint64_t))NSString._urlStringByInsertingPathResolveFlags(_:));
}

- (id)_urlStringByInsertingQueryResolveFlags:(unsigned int)a3
{
  return @objc NSString._urlStringByInsertingPathResolveFlags(_:)( self,  (uint64_t)a2,  *(uint64_t *)&a3,  (void (*)(uint64_t))NSString._urlStringByInsertingQueryResolveFlags(_:));
}

- (id)_urlStringByRemovingResolveFlags
{
  NSStringEncoding v2 = self;
  NSString._urlStringByRemovingResolveFlags()();

  id v3 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();
  return v3;
}

- (BOOL)__swiftFillFileSystemRepresentationWithPointer:(char *)a3 maxLength:(int64_t)a4
{
  NSUInteger v6 = self;
  LOBYTE(a4) = NSString.__swiftFillFileSystemRepresentation(pointer:maxLength:)(a3, a4);

  return a4 & 1;
}

- (NSString)variantFittingPresentationWidth:(NSInteger)width
{
  return self;
}

- (id)_widthVariants
{
  v3[1] = *MEMORY[0x1895F89C0];
  v3[0] = self;
  return (id)[MEMORY[0x189603F18] arrayWithObjects:v3 count:1];
}

- (id)_createSubstringWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (!_createSubstringWithRange__baseImp)
  {
    unint64_t v7 = (objc_class *)objc_opt_class();
    _createSubstringWithRange__baseImp = (uint64_t)class_getMethodImplementation(v7, sel_substringWithRange_);
  }

  unsigned __int16 v8 = (objc_class *)objc_opt_class();
  if ((IMP)_createSubstringWithRange__baseImp != class_getMethodImplementation(v8, sel_substringWithRange_)) {
    return -[NSString substringWithRange:](self, "substringWithRange:", location, length);
  }
  NSUInteger v10 = -[NSString length](self, "length");
  if (v10 >= length && location <= v10 - length) {
    return -[NSString _newSubstringWithRange:zone:]( self,  "_newSubstringWithRange:zone:",  location,  length,  -[NSString zone](self, "zone"));
  }
  unint64_t v11 = (void *)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603B40],  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@: Range {%lu, %lu} out of bounds; string length %lu",
                    _NSMethodExceptionProem((objc_class *)self, a2),
                    location,
                    length,
                    v10),
                  0LL);
  objc_exception_throw(v11);
  return (id)-[NSString _smallestEncodingInCFStringEncoding](v12, v13);
}

- (unsigned)_smallestEncodingInCFStringEncoding
{
  return CFStringConvertNSStringEncodingToEncoding(-[NSString smallestEncoding](self, "smallestEncoding"));
}

- (unsigned)_fastestEncodingInCFStringEncoding
{
  return CFStringConvertNSStringEncodingToEncoding(-[NSString fastestEncoding](self, "fastestEncoding"));
}

- (BOOL)_getCString:(char *)a3 maxLength:(unint64_t)a4 encoding:(unsigned int)a5
{
  v10[1] = *MEMORY[0x1895F89C0];
  unint64_t v8 = CFStringConvertEncodingToNSStringEncoding(a5);
  if (v8 == 0xFFFFFFFF
    || !-[NSString getBytes:maxLength:filledLength:encoding:allowLossyConversion:range:remainingRange:]( self,  "getBytes:maxLength:filledLength:encoding:allowLossyConversion:range:remainingRange:",  a3,  a4,  v10,  v8,  0LL,  0LL,  -[NSString length](self, "length"),  0LL))
  {
    BOOL result = 0;
  }

  else
  {
    a3 += v10[0];
    BOOL result = 1;
  }

  *a3 = 0;
  return result;
}

- ($2F068FC02377E22BA03580A8162C781E)decimalValue
{
  unint64_t v5 = +[NSScanner scannerWithString:](&OBJC_CLASS___NSScanner, "scannerWithString:", self);
  *(void *)retstr = 0LL;
  *(void *)&retstr->var5[2] = 0LL;
  *(_DWORD *)&retstr->var5[6] = 0;
  if (!-[NSScanner scanDecimal:](v5, "scanDecimal:", retstr))
  {
    NSUInteger v6 = +[NSDecimalNumber notANumber](&OBJC_CLASS___NSDecimalNumber, "notANumber");
    if (v6)
    {
      -[NSDecimalNumber decimalValue](v6, "decimalValue");
    }

    else
    {
      __int128 v8 = 0uLL;
      int v9 = 0;
    }

    *(_OWORD *)retstr = v8;
    *(_DWORD *)&retstr->var5[6] = v9;
  }

  return ($2F068FC02377E22BA03580A8162C781E *)_CFAutoreleasePoolPop();
}

- (id)__escapeString5991
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v3 = -[NSString length](self, "length");
  unint64_t v4 = (__CFString *)objc_opt_new();
  if (v3 >= 1)
  {
    for (uint64_t i = 0LL; i != v3; ++i)
    {
      int v6 = -[NSString characterAtIndex:](self, "characterAtIndex:", i);
      UniChar chars = 92;
      __int16 v11 = v6;
      if ((v6 - 34) <= 0x3B && ((1LL << (v6 - 34)) & 0xA00000020000121LL) != 0)
      {
        p_UniChar chars = &chars;
        CFIndex v8 = 2LL;
      }

      else
      {
        p_UniChar chars = (UniChar *)&v11;
        CFIndex v8 = 1LL;
      }

      CFStringAppendCharacters(v4, p_chars, v8);
    }
  }

  return v4;
}

+ (NSString)pathWithComponents:(NSArray *)components
{
  return (NSString *)+[NSPathStore2 pathWithComponents:](&OBJC_CLASS___NSPathStore2, "pathWithComponents:", components);
}

- (NSArray)pathComponents
{
  v10[1] = *MEMORY[0x1895F89C0];
  unint64_t v3 = -[NSString length](self, "length");
  MEMORY[0x1895F8858](v3);
  int v6 = (_WORD *)((char *)v10 - v5);
  if (v7 > 0x100) {
    int v6 = malloc(2 * v4);
  }
  else {
    bzero((char *)v10 - v5, 2 * v4);
  }
  -[NSString getCharacters:range:](self, "getCharacters:range:", v6, 0LL, v3);
  CFIndex v8 = (NSArray *)_NSPathComponents(v6, v3);
  if (v3 >= 0x101) {
    free(v6);
  }
  return v8;
}

- (BOOL)isAbsolutePath
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if ((int64_t)-[NSString length](self, "length") >= 3)
  {
    -[NSString getCharacters:range:](self, "getCharacters:range:", v6, 0LL, 3LL);
  }

  else
  {
    uint64_t v3 = -[NSString length](self, "length");
    -[NSString getCharacters:range:](self, "getCharacters:range:", v6, 0LL, v3);
    if (v3 < 1) {
      return 0;
    }
  }

  return v6[0] == 126 || v6[0] == 47;
}

- (NSString)stringByDeletingLastPathComponent
{
  v15[1] = *MEMORY[0x1895F89C0];
  NSUInteger v3 = -[NSString length](self, "length");
  v15[0] = v3;
  MEMORY[0x1895F8858](v3);
  int v6 = (_WORD *)((char *)v15 - v5);
  if (v7 > 0x100) {
    int v6 = malloc(2 * v4);
  }
  else {
    bzero((char *)v15 - v5, 2 * v4);
  }
  -[NSString getCharacters:range:](self, "getCharacters:range:", v6, 0LL, v3, v15[0]);
  _NSTransmutePathSlashes(v6, v15);
  uint64_t v8 = v15[0];
  if (v15[0] >= 2)
  {
    if (v6[v15[0] - 1] != 47) {
      goto LABEL_12;
    }
    while ((unint64_t)v8 > 2)
    {
      int v9 = (unsigned __int16)v6[v8-- - 2];
      if (v9 != 47) {
        goto LABEL_8;
      }
    }

    goto LABEL_9;
  }

- (NSString)stringByAppendingPathComponent:(NSString *)str
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  unint64_t v6 = -[NSString length](str, "length");
  MEMORY[0x1895F8858](v6);
  int v9 = (char *)&v26 - v8;
  if (v10 > 0x100) {
    int v9 = (char *)malloc(2 * v7);
  }
  else {
    bzero((char *)&v26 - v8, 2 * v7);
  }
  -[NSString getCharacters:range:](str, "getCharacters:range:", v9, 0LL, v6);
  NSUInteger v11 = -[NSString length](self, "length");
  uint64_t v27 = v11;
  unint64_t v12 = v6 + v11 + 1;
  MEMORY[0x1895F8858](v11);
  unint64_t v15 = (unsigned __int16 *)((char *)&v26 - v14);
  if (v12 > 0x100) {
    unint64_t v15 = (unsigned __int16 *)malloc(2 * v13);
  }
  else {
    bzero((char *)&v26 - v14, 2 * v13);
  }
  -[NSString getCharacters:range:](self, "getCharacters:range:", v15, 0LL, v11);
  if ((_NSAppendPathComponent(v15, &v27, v12, v9, v6) & 1) == 0)
  {
    unint64_t v19 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)@"%@: cannot append path '%@' to path '%@'", v19, str, self);
    return 0LL;
  }

  _NSTransmutePathSlashes(v15, &v27);
  uint64_t v16 = v27;
  if (v27 < 2) {
    goto LABEL_16;
  }
  if (v15[v27 - 1] == 47)
  {
    do
    {
      if ((unint64_t)v16 <= 2)
      {
        uint64_t v18 = 0LL;
        uint64_t v16 = 1LL;
        goto LABEL_23;
      }

      int v17 = v15[v16-- - 2];
    }

    while (v17 == 47);
    if (v16 < 2) {
      goto LABEL_16;
    }
  }

  if (*v15 == 92) {
    uint64_t v18 = 2LL * (v15[1] == 92);
  }
  else {
LABEL_16:
  }
    uint64_t v18 = 0LL;
  if (v18 >= v16) {
    goto LABEL_18;
  }
LABEL_23:
  if (!v15[v18])
  {
LABEL_27:
    unint64_t v22 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      NSUInteger v24 = -[NSString length](str, "length");
      NSUInteger v25 = -[NSString length](self, "length");
      *(_DWORD *)buf = 138478595;
      __int128 v29 = str;
      __int16 v30 = 2048;
      NSUInteger v31 = v24;
      __int16 v32 = 2113;
      v33 = self;
      __int16 v34 = 2048;
      NSUInteger v35 = v25;
      _os_log_fault_impl( &dword_182EB1000,  v22,  OS_LOG_TYPE_FAULT,  "Appending path component %{private}@ (length: %lu) to string %{private}@ (length: %lu) resulted in an embedded NUL character",  buf,  0x2Au);
    }

    return 0LL;
  }

  while (v16 - 1 != v18)
  {
    if (!v15[++v18])
    {
      if (v18 >= v16) {
        break;
      }
      goto LABEL_27;
    }
  }

- (NSString)pathExtension
{
  v13[1] = *MEMORY[0x1895F89C0];
  NSUInteger v3 = -[NSString length](self, "length");
  v13[0] = v3;
  MEMORY[0x1895F8858](v3);
  unint64_t v6 = (_WORD *)((char *)v13 - v5);
  if (v7 > 0x100) {
    unint64_t v6 = malloc(2 * v4);
  }
  else {
    bzero((char *)v13 - v5, 2 * v4);
  }
  -[NSString getCharacters:range:](self, "getCharacters:range:", v6, 0LL, v3, v13[0]);
  _NSTransmutePathSlashes(v6, v13);
  unint64_t v8 = v13[0];
  if (v13[0] > 1)
  {
    if (v6[v13[0] - 1] == 47)
    {
      while (v8 > 2)
      {
        int v9 = (unsigned __int16)v6[v8-- - 2];
        if (v9 != 47) {
          goto LABEL_10;
        }
      }

      unint64_t v8 = 1LL;
    }

- (NSString)stringByDeletingPathExtension
{
  v14[1] = *MEMORY[0x1895F89C0];
  NSUInteger v3 = -[NSString length](self, "length");
  v14[0] = v3;
  MEMORY[0x1895F8858](v3);
  unint64_t v6 = (_WORD *)((char *)v14 - v5);
  if (v7 > 0x100) {
    unint64_t v6 = malloc(2 * v4);
  }
  else {
    bzero((char *)v14 - v5, 2 * v4);
  }
  -[NSString getCharacters:range:](self, "getCharacters:range:", v6, 0LL, v3, v14[0]);
  _NSTransmutePathSlashes(v6, v14);
  unint64_t v8 = v14[0];
  if (v14[0] >= 2 && v6[v14[0] - 1] == 47)
  {
    while (v8 > 2)
    {
      int v9 = (unsigned __int16)v6[v8-- - 2];
      if (v9 != 47) {
        goto LABEL_10;
      }
    }

    unint64_t v8 = 1LL;
  }

- (NSString)stringByAppendingPathExtension:(NSString *)str
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (!str)
  {
    uint64_t v21 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v21);
  }

  unint64_t v6 = -[NSString length](str, "length");
  NSUInteger v7 = -[NSString length](self, "length");
  uint64_t v22 = v7;
  if (!v6) {
    return (NSString *)(id)-[NSString copy](self, "copy");
  }
  NSUInteger v8 = v7;
  MEMORY[0x1895F8858](v7);
  uint64_t v10 = (_WORD *)((char *)&v22 - v9);
  if (v6 > 0x100)
  {
    unint64_t v11 = malloc(2 * v6);
    uint64_t v10 = v11;
  }

  else
  {
    bzero((char *)&v22 - v9, 2 * v6);
  }

  unint64_t v13 = v6 + v8 + 1;
  MEMORY[0x1895F8858](v11);
  uint64_t v16 = (unsigned __int16 *)((char *)&v22 - v15);
  if (v13 > 0x100) {
    uint64_t v16 = (unsigned __int16 *)malloc(2 * v14);
  }
  else {
    bzero((char *)&v22 - v15, 2 * v14);
  }
  -[NSString getCharacters:range:](self, "getCharacters:range:", v16, 0LL, v8, v22, v23);
  -[NSString getCharacters:range:](str, "getCharacters:range:", v10, 0LL, v6);
  if ((_NSAppendPathExtension(v16, &v22, v6 + v8 + 1, v10, v6) & 1) != 0)
  {
    _NSTransmutePathSlashes(v16, &v22);
    unint64_t v17 = v22;
    if (v22 >= 2 && v16[v22 - 1] == 47)
    {
      while (v17 > 2)
      {
        int v18 = v16[v17-- - 2];
        if (v18 != 47) {
          goto LABEL_18;
        }
      }

      unint64_t v17 = 1LL;
    }

- (NSString)stringByAbbreviatingWithTildeInPath
{
  v12[1] = *MEMORY[0x1895F89C0];
  uint64_t v3 = -[NSString length](self, "length");
  if (v3 > 1023)
  {
    unint64_t v4 = 1024LL;
  }

  else
  {
    uint64_t v3 = -[NSString length](self, "length");
    unint64_t v4 = v3;
  }

  v12[0] = v4;
  MEMORY[0x1895F8858](v3);
  NSUInteger v7 = (unsigned __int16 *)((char *)v12 - v6);
  if (v4 > 0x100) {
    NSUInteger v7 = (unsigned __int16 *)malloc(2 * v5);
  }
  else {
    bzero((char *)v12 - v6, 2 * v5);
  }
  -[NSString getCharacters:range:](self, "getCharacters:range:", v7, 0LL, v4, v12[0]);
  _NSTransmutePathSlashes(v7, v12);
  unint64_t v8 = v12[0];
  if (v12[0] >= 2)
  {
    if (v7[v12[0] - 1] == 47)
    {
      while (v8 > 2)
      {
        int v9 = v7[v8-- - 2];
        if (v9 != 47) {
          goto LABEL_13;
        }
      }

      unint64_t v8 = 1LL;
    }

- (NSString)stringByExpandingTildeInPath
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  else {
    NSUInteger v3 = -[NSString length](self, "length");
  }
  -[NSString getCharacters:range:](self, "getCharacters:range:", v8, 0LL, v3);
  _NSExpandTildeInPath((uint64_t)v8, (unint64_t *)&v7);
  _NSTransmutePathSlashes(v8, &v7);
  unint64_t v4 = v7;
  if (v7 >= 2 && v8[v7 - 1] == 47)
  {
    while (v4 > 2)
    {
      int v5 = (unsigned __int16)v8[v4-- - 2];
      if (v5 != 47) {
        return (NSString *)+[NSPathStore2 pathStoreWithCharacters:length:]( &OBJC_CLASS___NSPathStore2,  "pathStoreWithCharacters:length:",  v8,  v4);
      }
    }

    unint64_t v4 = 1LL;
  }

  return (NSString *)+[NSPathStore2 pathStoreWithCharacters:length:]( &OBJC_CLASS___NSPathStore2,  "pathStoreWithCharacters:length:",  v8,  v4);
}

- (id)_stringByStandardizingPathUsingCache:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1895F89C0];
  else {
    NSUInteger v5 = -[NSString length](self, "length");
  }
  -[NSString getCharacters:range:](self, "getCharacters:range:", v8, 0LL, v5);
  _NSExpandTildeInPath((uint64_t)v8, (unint64_t *)&v7);
  _NSStandardizePathUsingCache(v8, &v7, v3);
  return +[NSPathStore2 pathStoreWithCharacters:length:]( &OBJC_CLASS___NSPathStore2,  "pathStoreWithCharacters:length:",  v8,  v7);
}

- (NSString)stringByStandardizingPath
{
  return (NSString *)-[NSString _stringByStandardizingPathUsingCache:]( self,  "_stringByStandardizingPathUsingCache:",  0LL);
}

- (id)_stringByResolvingSymlinksInPathUsingCache:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1895F89C0];
  else {
    NSUInteger v5 = -[NSString length](self, "length");
  }
  -[NSString getCharacters:range:](self, "getCharacters:range:", v8, 0LL, v5);
  _NSExpandTildeInPath((uint64_t)v8, (unint64_t *)&v7);
  _NSResolveSymlinksInPathUsingCache(v8, &v7, v3);
  _NSStandardizePathUsingCache(v8, &v7, v3);
  return +[NSPathStore2 pathStoreWithCharacters:length:]( &OBJC_CLASS___NSPathStore2,  "pathStoreWithCharacters:length:",  v8,  v7);
}

- (NSString)stringByResolvingSymlinksInPath
{
  return (NSString *)-[NSString _stringByResolvingSymlinksInPathUsingCache:]( self,  "_stringByResolvingSymlinksInPathUsingCache:",  0LL);
}

- (NSArray)stringsByAppendingPaths:(NSArray *)paths
{
  if (paths && (_NSIsNSArray() & 1) != 0)
  {
    if (-[NSString isEqual:](self, "isEqual:", &stru_189CA6A28))
    {
      return (NSArray *)(id)-[NSArray copyWithZone:]( paths,  "copyWithZone:",  -[NSString zone](self, "zone"));
    }

    else
    {
      uint64_t v7 = -[NSArray count](paths, "count");
      unint64_t v8 = (NSArray *)[MEMORY[0x189603FA8] array];
      if (v7 >= 1)
      {
        for (uint64_t i = 0LL; i != v7; ++i)
          -[NSArray addObject:]( v8,  "addObject:",  -[NSString stringByAppendingPathComponent:]( self,  "stringByAppendingPathComponent:",  -[NSArray objectAtIndex:](paths, "objectAtIndex:", i)));
      }

      return v8;
    }
  }

  else
  {
    uint64_t v10 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: paths argument is not an array", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v10);
    return (NSArray *)-[NSString fileSystemRepresentation](v11, v12);
  }

- (BOOL)getFileSystemRepresentation:(char *)cname maxLength:(NSUInteger)max
{
  return _NSGetFileSystemRepresentation(cname, max, self);
}

- (NSUInteger)completePathIntoString:(NSString *)outputName caseSensitive:(BOOL)flag matchesIntoArray:(NSArray *)outputArray filterTypes:(NSArray *)filterTypes
{
  BOOL v84 = flag;
  uint64_t v124 = *MEMORY[0x1895F89C0];
  v83 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  if (-[NSString isEqual:](self, "isEqual:", &stru_189CA6A28)) {
    return 0LL;
  }
  if (-[NSString hasPrefix:](self, "hasPrefix:", @"~")
    && -[NSString rangeOfString:options:range:]( self,  "rangeOfString:options:range:",  @"/",  0LL,  0LL,  -[NSString length](self, "length")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = (void *)[objc_allocWithZone(MEMORY[0x189603FE0]) initWithCapacity:32];
    unint64_t v11 = -[NSString substringWithRange:](self, "substringWithRange:", 1LL, -[NSString length](self, "length") - 1);
    BOOL v12 = -[NSString isEqual:](v11, "isEqual:", &stru_189CA6A28);
    setpwent();
    for (uint64_t i = getpwent(); i; uint64_t i = getpwent())
    {
      uint64_t v14 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", i->pw_name);
      uint64_t v15 = v14;
      if (v12 || -[NSString hasPrefix:](v14, "hasPrefix:", v11)) {
        objc_msgSend(v10, "addObject:", objc_msgSend(@"~", "stringByAppendingString:", v15));
      }
    }

    endpwent();
    uint64_t v16 = (NSArray *)[v10 allObjects];

    if (outputName) {
      *outputName = (NSString *)_NSFindCommonPrefixInStringArray(v16, v84);
    }
    if (outputArray) {
      *outputArray = v16;
    }
    return -[NSArray count](v16, "count");
  }

  if (-[NSString hasSuffix:](self, "hasSuffix:", @"/") || -[NSString hasSuffix:](self, "hasSuffix:", @"\\""))
  {
    unint64_t v17 = (NSString *)&stru_189CA6A28;
  }

  else
  {
    unint64_t v17 = -[NSString lastPathComponent](self, "lastPathComponent");
    self = -[NSString stringByDeletingLastPathComponent](self, "stringByDeletingLastPathComponent");
  }

  if (v84)
  {
    int v18 = (void *)[MEMORY[0x189603F18] arrayWithObject:self];
    uint64_t v19 = 8LL;
  }

  else
  {
    if (-[NSString isEqual:](self, "isEqual:", &stru_189CA6A28))
    {
      id v20 = (id)[MEMORY[0x189603F18] arrayWithObject:&stru_189CA6A28];
      if (!v20) {
        return 0LL;
      }
    }

    else
    {
      v87 = v17;
      v77 = filterTypes;
      uint64_t v21 = -[NSString pathComponents](self, "pathComponents");
      id v22 = objc_alloc_init(MEMORY[0x189603FA8]);
      id v23 = objc_alloc_init(MEMORY[0x189603FA8]);
      __int128 v119 = 0u;
      __int128 v120 = 0u;
      __int128 v121 = 0u;
      __int128 v122 = 0u;
      obuint64_t j = v21;
      uint64_t v24 = -[NSArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v119,  v123,  16LL);
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v120;
        uint64_t v81 = *(void *)v120;
        do
        {
          uint64_t v27 = 0LL;
          uint64_t v79 = v25;
          do
          {
            if (*(void *)v120 != v26) {
              objc_enumerationMutation(obj);
            }
            NSRange v28 = *(void **)(*((void *)&v119 + 1) + 8 * v27);
            if ([v28 isEqual:@"/"])
            {
              [v23 addObject:v28];
            }

            else if ([v23 count])
            {
              uint64_t v89 = v27;
              id v92 = v23;
              __int128 v109 = 0u;
              __int128 v110 = 0u;
              __int128 v107 = 0u;
              __int128 v108 = 0u;
              uint64_t v29 = [v23 countByEnumeratingWithState:&v107 objects:v106 count:16];
              if (v29)
              {
                uint64_t v30 = v29;
                uint64_t v94 = *(void *)v108;
                do
                {
                  for (uint64_t j = 0LL; j != v30; ++j)
                  {
                    if (*(void *)v108 != v94) {
                      objc_enumerationMutation(v92);
                    }
                    __int16 v32 = *(void **)(*((void *)&v107 + 1) + 8 * j);
                    v33 = -[NSFileManager contentsOfDirectoryAtPath:error:]( v83,  "contentsOfDirectoryAtPath:error:",  v32,  0LL);
                    __int128 v102 = 0u;
                    __int128 v103 = 0u;
                    __int128 v104 = 0u;
                    __int128 v105 = 0u;
                    uint64_t v34 = -[NSArray countByEnumeratingWithState:objects:count:]( v33,  "countByEnumeratingWithState:objects:count:",  &v102,  v101,  16LL);
                    if (v34)
                    {
                      uint64_t v35 = v34;
                      uint64_t v36 = *(void *)v103;
                      do
                      {
                        for (uint64_t k = 0LL; k != v35; ++k)
                        {
                          if (*(void *)v103 != v36) {
                            objc_enumerationMutation(v33);
                          }
                          v38 = *(void **)(*((void *)&v102 + 1) + 8 * k);
                          if (![v38 caseInsensitiveCompare:v28]) {
                            objc_msgSend(v22, "addObject:", objc_msgSend(v32, "stringByAppendingPathComponent:", v38));
                          }
                        }

                        uint64_t v35 = -[NSArray countByEnumeratingWithState:objects:count:]( v33,  "countByEnumeratingWithState:objects:count:",  &v102,  v101,  16LL);
                      }

                      while (v35);
                    }
                  }

                  uint64_t v30 = [v92 countByEnumeratingWithState:&v107 objects:v106 count:16];
                }

                while (v30);
              }

              if (![v22 count])
              {

                return 0LL;
              }

              [v92 removeAllObjects];
              id v23 = v22;
              id v22 = v92;
              uint64_t v25 = v79;
              uint64_t v26 = v81;
              uint64_t v27 = v89;
            }

            else
            {
              v39 = -[NSFileManager contentsOfDirectoryAtPath:error:]( v83,  "contentsOfDirectoryAtPath:error:",  -[NSFileManager currentDirectoryPath](v83, "currentDirectoryPath"),  0LL);
              __int128 v115 = 0u;
              __int128 v116 = 0u;
              __int128 v117 = 0u;
              __int128 v118 = 0u;
              uint64_t v40 = -[NSArray countByEnumeratingWithState:objects:count:]( v39,  "countByEnumeratingWithState:objects:count:",  &v115,  &v111,  16LL);
              if (v40)
              {
                uint64_t v41 = v40;
                v42 = v23;
                uint64_t v90 = v27;
                uint64_t v43 = *(void *)v116;
                do
                {
                  for (uint64_t m = 0LL; m != v41; ++m)
                  {
                    if (*(void *)v116 != v43) {
                      objc_enumerationMutation(v39);
                    }
                    v45 = *(void **)(*((void *)&v115 + 1) + 8 * m);
                    if (![v45 caseInsensitiveCompare:v28]) {
                      [v42 addObject:v45];
                    }
                  }

                  uint64_t v41 = -[NSArray countByEnumeratingWithState:objects:count:]( v39,  "countByEnumeratingWithState:objects:count:",  &v115,  &v111,  16LL);
                }

                while (v41);
                id v23 = v42;
                uint64_t v27 = v90;
                uint64_t v26 = v81;
              }
            }

            ++v27;
          }

          while (v27 != v25);
          uint64_t v25 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v119,  v123,  16LL);
        }

        while (v25);
      }

      id v20 = v23;
      filterTypes = v77;
      unint64_t v17 = v87;
      if (!v20) {
        return 0LL;
      }
    }

    int v18 = v20;
    uint64_t v19 = 9LL;
  }

  id obja = (id)v19;
  v46 = (NSArray *)[MEMORY[0x189603FA8] array];
  v74 = 0LL;
  v75 = v46;
  while (1)
  {
    __int128 v99 = 0u;
    __int128 v100 = 0u;
    __int128 v97 = 0u;
    __int128 v98 = 0u;
    id v76 = v18;
    uint64_t v80 = [v18 countByEnumeratingWithState:&v97 objects:v96 count:16];
    if (v80)
    {
      uint64_t v78 = *(void *)v98;
      v88 = v17;
      do
      {
        for (uint64_t n = 0LL; n != v80; ++n)
        {
          if (*(void *)v98 != v78) {
            objc_enumerationMutation(v76);
          }
          v48 = *(NSString **)(*((void *)&v97 + 1) + 8 * n);
          v93 = v48;
          if (!-[NSString length](v48, "length")) {
            v48 = -[NSFileManager currentDirectoryPath](v83, "currentDirectoryPath");
          }
          v49 = -[NSFileManager contentsOfDirectoryAtPath:error:](v83, "contentsOfDirectoryAtPath:error:", v48, 0LL);
          if (!v49)
          {
            uint64_t v54 = [MEMORY[0x189603F18] array];
            goto LABEL_105;
          }

          v50 = v49;
          uint64_t v82 = n;
          uint64_t v51 = -[NSArray count](v49, "count");
          uint64_t v91 = [MEMORY[0x189603FA8] array];
          if (v17)
          {
            char v52 = -[NSString isEqual:](v17, "isEqual:", &stru_189CA6A28);
            if (!filterTypes) {
              goto LABEL_79;
            }
          }

          else
          {
            char v52 = 1;
            if (!filterTypes)
            {
LABEL_79:
              BOOL v53 = 1;
              goto LABEL_80;
            }
          }

          BOOL v53 = -[NSArray count](filterTypes, "count") == 0;
LABEL_80:
          BOOL v95 = v53;
          if (v51 < 1) {
            goto LABEL_104;
          }
          v55 = filterTypes;
          for (iuint64_t i = 0LL; ii != v51; ++ii)
          {
            id v57 = -[NSArray objectAtIndex:](v50, "objectAtIndex:", ii);
            v58 = v57;
            if ((v52 & 1) != 0 || [v57 rangeOfString:v88 options:obja] != 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v59 = [v58 pathExtension];
              if (v95) {
                goto LABEL_85;
              }
              v62 = (void *)v59;
              if (v84)
              {
                if (-[NSArray containsObject:](v55, "containsObject:", v59)) {
                  goto LABEL_85;
                }
              }

              else
              {
                __int128 v113 = 0u;
                __int128 v114 = 0u;
                __int128 v111 = 0u;
                __int128 v112 = 0u;
                uint64_t v63 = -[NSArray countByEnumeratingWithState:objects:count:]( v55,  "countByEnumeratingWithState:objects:count:",  &v111,  v123,  16LL);
                if (v63)
                {
                  uint64_t v64 = v63;
                  uint64_t v65 = *(void *)v112;
LABEL_94:
                  uint64_t v66 = 0LL;
                  while (1)
                  {
                    if (*(void *)v112 != v65) {
                      objc_enumerationMutation(v55);
                    }
                    if (![*(id *)(*((void *)&v111 + 1) + 8 * v66) caseInsensitiveCompare:v62]) {
                      break;
                    }
                    if (v64 == ++v66)
                    {
                      uint64_t v64 = -[NSArray countByEnumeratingWithState:objects:count:]( v55,  "countByEnumeratingWithState:objects:count:",  &v111,  v123,  16LL);
                      if (v64) {
                        goto LABEL_94;
                      }
                      goto LABEL_100;
                    }
                  }

- (id)stringByConvertingPathToURL
{
  return (id)objc_msgSend( @"file://localhost",  "stringByAppendingString:",  -[NSString stringByStandardizingPath](self, "stringByStandardizingPath"));
}

- (id)stringByConvertingURLToPath
{
  NSStringEncoding v2 = self;
  if (!-[NSString hasPrefix:](self, "hasPrefix:", @"file:"))
  {
    if (-[NSString rangeOfString:](v2, "rangeOfString:", @":") != 0x7FFFFFFFFFFFFFFFLL) {
      return 0LL;
    }
    goto LABEL_8;
  }

  if (-[NSString hasPrefix:]( -[NSString substringFromIndex:](v2, "substringFromIndex:", 5LL),  "hasPrefix:",  @"//"))
  {
    BOOL v3 = -[NSString substringFromIndex:](v2, "substringFromIndex:", 2LL);
    if (v3)
    {
      unint64_t v4 = v3;
      if (-[NSString hasPrefix:](v4, "hasPrefix:", @"localhost"))
      {
        NSStringEncoding v2 = -[NSString substringFromIndex:](v2, "substringFromIndex:", 9LL);
LABEL_8:
        unint64_t v4 = v2;
        if (v2) {
          return -[NSString stringByStandardizingPath](v4, "stringByStandardizingPath");
        }
      }
    }
  }

  return 0LL;
}

+ (id)_newZStringWithCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4
{
  return -[_NSClStr initWithCharacters:length:]( objc_alloc(&OBJC_CLASS____NSClStr),  "initWithCharacters:length:",  a3,  a4);
}

+ (id)_newZStringWithString:(id)a3
{
  return -[_NSClStr initWithString:](objc_alloc(&OBJC_CLASS____NSClStr), "initWithString:", a3);
}

+ (id)_newZStringWithUTF8String:(const char *)a3
{
  return -[_NSClStr initWithUTF8String:](objc_alloc(&OBJC_CLASS____NSClStr), "initWithUTF8String:", a3);
}

+ (NSStringEncoding)stringEncodingForData:(NSData *)data encodingOptions:(NSDictionary *)opts convertedString:(NSString *)string usedLossyConversion:(BOOL *)usedLossyConversion
{
  uint64_t v308 = *MEMORY[0x1895F89C0];
  if (!opts)
  {
    unint64_t v255 = 0LL;
    id v13 = 0LL;
    uint64_t v14 = 0LL;
    v243 = 0LL;
    unsigned int v259 = 0;
    BOOL v245 = 0;
    int v247 = 0;
    int v249 = 1;
    BOOL v250 = 0;
    unint64_t v11 = @"\uFFFD";
    goto LABEL_29;
  }

  uint64_t v10 = -[NSDictionary objectForKey:](opts, "objectForKey:", @"NSStringEncodingDetectionLossySubstitutionKey");
  if (v10)
  {
    unint64_t v11 = v10;
    if ((_NSIsNSString() & 1) == 0)
    {
      BOOL v12 = @"[NSString stringEncodingForData:encodingOptions:lossyDone:]: The value for NSStringEncodingDetectionLossySubstitutionKey must be an object of NSString.";
LABEL_459:
      v229 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v12);
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v229 userInfo:0]);
      return generateStringWithEncoding(v230, v231, v232, v233, v234, v235, v236);
    }
  }

  else
  {
    unint64_t v11 = @"\uFFFD";
  }

  id v15 = -[NSDictionary objectForKey:](opts, "objectForKey:", @"NSStringEncodingDetectionAllowLossyKey");
  if (v15)
  {
    uint64_t v16 = v15;
    if ((_NSIsNSNumber() & 1) == 0)
    {
      BOOL v12 = @"[NSString stringEncodingForData:encodingOptions:lossyDone:]: The value for NSStringEncodingDetectionAllowLossyKey must be an object of NSNumber.";
      goto LABEL_459;
    }

    int v17 = [v16 BOOLValue];
  }

  else
  {
    int v17 = 1;
  }

  id v18 = -[NSDictionary objectForKey:](opts, "objectForKey:", @"NSStringEncodingDetectionSuggestedEncodingsKey");
  if (v18)
  {
    if ((_NSIsNSArray() & 1) == 0)
    {
      BOOL v12 = @"[NSString stringEncodingForData:encodingOptions:lossyDone:]: The value for NSStringEncodingDetectionSuggestedEncodingsKey must be an object of NSArray.";
      goto LABEL_459;
    }

    uint64_t v19 = v18;
    unint64_t v255 = [v18 count];
    BOOL v250 = v255 != 0;
  }

  else
  {
    uint64_t v19 = 0LL;
    BOOL v250 = 0;
    unint64_t v255 = 0LL;
  }

  id v20 = -[NSDictionary objectForKey:]( opts,  "objectForKey:",  @"NSStringEncodingDetectionUseOnlySuggestedEncodingsKey");
  int v249 = v17;
  if (!v20) {
    goto LABEL_20;
  }
  uint64_t v21 = v20;
  if ((_NSIsNSNumber() & 1) == 0)
  {
    BOOL v12 = @"[NSString stringEncodingForData:encodingOptions:lossyDone:]: The value for NSStringEncodingDetectionUseOnlySuggestedEncodingsKey must be an object of NSNumber.";
    goto LABEL_459;
  }

  if ([v21 BOOLValue])
  {
    uint64_t v14 = v19;
    unsigned int v259 = 1;
    if ((unint64_t)[v19 count] < 2)
    {
      id v13 = 0LL;
      v243 = 0LL;
      BOOL v245 = 0;
      int v247 = 0;
      goto LABEL_29;
    }
  }

  else
  {
LABEL_20:
    unsigned int v259 = 0;
    uint64_t v14 = v19;
  }

  id v22 = -[NSDictionary objectForKey:](opts, "objectForKey:", @"NSStringEncodingDetectionFromWindowsKey");
  BOOL v23 = v22 != 0LL;
  if (v22)
  {
    uint64_t v24 = v22;
    if ((_NSIsNSNumber() & 1) == 0)
    {
      BOOL v12 = @"[NSString stringEncodingForData:encodingOptions:lossyDone:]: The value for NSStringEncodingDetectionFromWindowsKey must be an object of NSNumber.";
      goto LABEL_459;
    }

    int v247 = [v24 BOOLValue];
  }

  else
  {
    int v247 = 0;
  }

  BOOL v245 = v23;
  id v25 = -[NSDictionary objectForKey:](opts, "objectForKey:", @"NSStringEncodingDetectionLikelyLanguageKey");
  if (v25 && (_NSIsNSString() & 1) == 0)
  {
    BOOL v12 = @"[NSString stringEncodingForData:encodingOptions:lossyDone:]: The value for NSStringEncodingDetectionLikelyLanguageKey must be an object of NSString.";
    goto LABEL_459;
  }

  v243 = v25;
  id v13 = -[NSDictionary objectForKey:](opts, "objectForKey:", @"NSStringEncodingDetectionDisallowedEncodingsKey");
  if (v13 && (_NSIsNSArray() & 1) == 0)
  {
    BOOL v12 = @"[NSString stringEncodingForData:encodingOptions:lossyDone:]: The value for NSStringEncodingDetectionDisallowedEncodingsKey must be an object of NSArray.";
    goto LABEL_459;
  }

uint64_t __113__NSString_NSStringEncodingDetection__stringEncodingForData_encodingOptions_convertedString_usedLossyConversion___block_invoke( void *a1,  uint64_t a2)
{
  return [*(id *)(a1[4] + 8 * a2) recognizeString:a1[5] withDataLength:a1[6] intoBuffer:0];
}

uint64_t __113__NSString_NSStringEncodingDetection__stringEncodingForData_encodingOptions_convertedString_usedLossyConversion___block_invoke_2( void *a1,  uint64_t a2)
{
  return [*(id *)(a1[4] + 8 * a2) recognizeString:a1[5] withDataLength:a1[6] intoBuffer:0];
}

uint64_t __113__NSString_NSStringEncodingDetection__stringEncodingForData_encodingOptions_convertedString_usedLossyConversion___block_invoke_3( void *a1,  uint64_t a2)
{
  return [*(id *)(a1[4] + 8 * a2) recognizeString:a1[5] withDataLength:a1[6] intoBuffer:0];
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  v3[5] = *MEMORY[0x1895F89C0];
  v3[0] = _MergedGlobals_86[0]();
  v3[1] = off_18C4917E8[0]();
  void v3[2] = off_18C4917F0[0]();
  v3[3] = off_18C4917F8[0]();
  v3[4] = off_18C491800[0]();
  return (NSArray *)[MEMORY[0x189603F18] arrayWithObjects:v3 count:5];
}

+ (id)_newStringFromUTF16InternalData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  if (![a3 length]) {
    return &stru_189CA6A28;
  }
  if ((unint64_t)[a3 length] < 2)
  {
    id result = 0LL;
  }

  else
  {
    id result = (id)objc_msgSend((id)objc_msgSend(a3, "subdataWithRange:", 0, 2), "bytes");
    if (result)
    {
      int v14 = *(unsigned __int16 *)result;
      if (v14 == 65534 || v14 == 65279)
      {
        id v15 = objc_alloc((Class)a1);
        uint64_t v16 = 10LL;
      }

      else
      {
        id v15 = objc_alloc((Class)a1);
        uint64_t v16 = 2483028224LL;
      }

      id result = (id)[v15 initWithData:a3 encoding:v16];
    }
  }

  if (a5)
  {
    if (!result)
    {
      int v17 = _NSIPCocoaErrorWithCode( 4864LL,  0LL,  0LL,  (uint64_t)@"The string representation of type “%@” contains invalid data.",  v9,  v10,  v11,  v12,  (uint64_t)a4);
      id result = 0LL;
      *a5 = v17;
    }
  }

  return result;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  v26[1] = *MEMORY[0x1895F89C0];
  v26[0] = 0LL;
  uint64_t v9 = _MergedGlobals_86[0]();
  uint64_t v12 = off_18C4917E8[0]();
  if (((unsigned int (*)(uint64_t, uint64_t))off_18C491810[0])((uint64_t)a4, v12))
  {
    id v10 = objc_alloc((Class)a1);
    uint64_t v11 = 10LL;
    goto LABEL_5;
  }

  uint64_t v21 = off_18C4917F0[0]();
  if (((unsigned int (*)(uint64_t, uint64_t))off_18C491810[0])((uint64_t)a4, v21))
  {
    uint64_t v13 = [a1 _newStringFromUTF16InternalData:a3 typeIdentifier:a4 error:v26];
    goto LABEL_6;
  }

  uint64_t v22 = off_18C4917F8[0]();
  if (((unsigned int (*)(uint64_t, uint64_t))off_18C491810[0])((uint64_t)a4, v22))
  {
LABEL_2:
    id v10 = objc_alloc((Class)a1);
    uint64_t v11 = 4LL;
LABEL_5:
    uint64_t v13 = [v10 initWithData:a3 encoding:v11];
LABEL_6:
    uint64_t v18 = v13;
    goto LABEL_7;
  }

  uint64_t v23 = off_18C491800[0]();
  if (((unsigned int (*)(uint64_t, uint64_t))off_18C491810[0])((uint64_t)a4, v23))
  {
    id v24 = (id)[MEMORY[0x189604030] objectWithItemProviderData:a3 typeIdentifier:a4 error:v26];
    if (v26[0]) {
      uint64_t v18 = 0LL;
    }
    else {
      uint64_t v18 = objc_msgSend(objc_alloc((Class)a1), "initWithString:", objc_msgSend(v24, "absoluteString"));
    }
  }

  else
  {
    uint64_t v18 = 0LL;
  }

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  v3[1] = *MEMORY[0x1895F89C0];
  v3[0] = _MergedGlobals_86[0]();
  return (NSArray *)[MEMORY[0x189603F18] arrayWithObjects:v3 count:1];
}

- (NSArray)writableTypeIdentifiersForItemProvider
{
  v8[1] = *MEMORY[0x1895F89C0];
  v8[0] = _MergedGlobals_86[0]();
  BOOL v3 = (NSArray *)[MEMORY[0x189603F18] arrayWithObjects:v8 count:1];
  unint64_t v4 = (void *)[MEMORY[0x189604030] URLWithString:self];
  if (objc_msgSend((id)objc_msgSend(v4, "scheme"), "length"))
  {
    int v5 = [v4 isFileURL];
    uint64_t v6 = 4LL;
    if (v5) {
      uint64_t v6 = 5LL;
    }
    return -[NSArray arrayByAddingObject:](v3, "arrayByAddingObject:", _MergedGlobals_86[v6]());
  }

  return v3;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  if ([a3 isEqualToString:_MergedGlobals_86[0]()])
  {
    (*((void (**)(id, NSData *, void))a4 + 2))( a4,  -[NSString dataUsingEncoding:](self, "dataUsingEncoding:", 4LL),  0LL);
  }

  else
  {
    if (([a3 isEqualToString:off_18C491800[0]()] & 1) != 0
      || [a3 isEqualToString:off_18C491808[0]()])
    {
      return (id)objc_msgSend( (id)objc_msgSend(MEMORY[0x189604030], "URLWithString:", self),  "loadDataWithTypeIdentifier:forItemProviderCompletionHandler:",  a3,  a4);
    }

    (*((void (**)(id, void, void))a4 + 2))(a4, 0LL, 0LL);
  }

  return 0LL;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    if (!__NSDefaultStringEncodingFullyInited) {
      _NSDefaultCStringEncoding();
    }
    Class v3 = objc_lookUpClass("NSTaggedPointerString");
    if (v3)
    {
      unint64_t v4 = v3;
      if (dyld_program_sdk_at_least())
      {
        if (!getenv("NSStringDisableTagged")) {
          goto LABEL_10;
        }
      }

      else if (getenv("NSStringEnableTagged"))
      {
LABEL_10:
        class_setSuperclass(v4, (Class)a1);
        -[objc_class _setAsTaggedStringClass](v4, "_setAsTaggedStringClass");
      }
    }
  }

- (NSUInteger)length
{
}

- (unichar)characterAtIndex:(NSUInteger)index
{
}

+ (NSString)stringWithCharacters:(const unichar *)characters length:(NSUInteger)length
{
  return (NSString *)(id)[objc_allocWithZone((Class)a1) initWithCharacters:characters length:length];
}

+ (id)stringWithCString:(const char *)bytes
{
  if (bytes) {
    return (id)[objc_allocWithZone((Class)a1) initWithCString:bytes];
  }
  unint64_t v4 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: NULL cString", _NSMethodExceptionProem((objc_class *)a1, a2)), 0 reason userInfo];
  objc_exception_throw(v4);
  return +[NSString stringWithCString:length:](v5, v6, v7, v8);
}

+ (id)stringWithCString:(const char *)bytes length:(NSUInteger)length
{
  return (id)[objc_allocWithZone((Class)a1) initWithCString:bytes length:length];
}

+ (NSString)stringWithUTF8String:(const char *)nullTerminatedCString
{
  if (nullTerminatedCString) {
    return (NSString *)(id)[objc_allocWithZone((Class)a1) initWithBytes:nullTerminatedCString length:strlen(nullTerminatedCString) encoding:4];
  }
  unint64_t v4 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: NULL cString", _NSMethodExceptionProem((objc_class *)a1, a2)), 0 reason userInfo];
  objc_exception_throw(v4);
  return +[NSString stringWithBytes:length:encoding:](v5, v6, v7, v8, v9);
}

+ (NSString)stringWithBytes:(const void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5
{
  if (a3) {
    return (NSString *)(id)[objc_allocWithZone((Class)a1) initWithBytes:a3 length:a4 encoding:a5];
  }
  SEL v6 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: NULL cString", _NSMethodExceptionProem((objc_class *)a1, a2)), 0 reason userInfo];
  objc_exception_throw(v6);
  return +[NSString localizedStringWithValidatedFormat:validFormatSpecifiers:error:](v7, v8, v9, v10, v11);
}

+ (NSString)localizedStringWithValidatedFormat:(NSString *)format validFormatSpecifiers:(NSString *)validFormatSpecifiers error:(NSError *)error
{
  id v8 = objc_alloc((Class)a1);
  return (NSString *)(id)objc_msgSend( v8,  "initWithValidatedFormat:validFormatSpecifiers:locale:arguments:error:",  format,  validFormatSpecifiers,  objc_msgSend(MEMORY[0x189603F90], "currentLocale"),  va,  error);
}

+ (NSString)localizedStringWithFormat:(NSString *)format
{
  id v4 = objc_allocWithZone((Class)a1);
  return (NSString *)(id)objc_msgSend( v4,  "initWithFormat:locale:arguments:",  format,  objc_msgSend(MEMORY[0x189603F90], "currentLocale"),  va);
}

+ (NSString)stringWithValidatedFormat:(NSString *)format validFormatSpecifiers:(NSString *)validFormatSpecifiers error:(NSError *)error
{
  return (NSString *)(id)[objc_allocWithZone((Class)a1) initWithValidatedFormat:format validFormatSpecifiers:validFormatSpecifiers locale:0 arguments:va error:error];
}

+ (NSString)stringWithFormat:(id)a3 locale:(id)a4
{
  return (NSString *) -[NSPlaceholderString initWithFormat:locale:arguments:]( &__placeholder,  "initWithFormat:locale:arguments:",  a3,  a4,  &v5,  &v5);
}

+ (id)_stringWithFormat:(id)a3 locale:(id)a4 options:(id)a5 arguments:(char *)a6
{
  return (id)[objc_alloc((Class)a1) _initWithFormat:a3 locale:a4 options:a5 arguments:a6];
}

+ (id)stringWithContentsOfFile:(NSString *)path
{
  return (id)[objc_allocWithZone((Class)a1) initWithContentsOfFile:path];
}

+ (id)stringWithContentsOfURL:(NSURL *)url
{
  return (id)[objc_allocWithZone((Class)a1) initWithContentsOfURL:url];
}

+ (NSString)stringWithContentsOfURL:(NSURL *)url encoding:(NSStringEncoding)enc error:(NSError *)error
{
  return (NSString *)(id)[objc_allocWithZone((Class)a1) initWithContentsOfURL:url encoding:enc error:error];
}

+ (NSString)stringWithContentsOfURL:(NSURL *)url usedEncoding:(NSStringEncoding *)enc error:(NSError *)error
{
  return (NSString *)(id)[objc_allocWithZone((Class)a1) initWithContentsOfURL:url usedEncoding:enc error:error];
}

+ (NSString)stringWithContentsOfFile:(NSString *)path encoding:(NSStringEncoding)enc error:(NSError *)error
{
  return (NSString *)(id)[objc_allocWithZone((Class)a1) initWithContentsOfFile:path encoding:enc error:error];
}

+ (NSString)stringWithContentsOfFile:(NSString *)path usedEncoding:(NSStringEncoding *)enc error:(NSError *)error
{
  return (NSString *)(id)[objc_allocWithZone((Class)a1) initWithContentsOfFile:path usedEncoding:enc error:error];
}

- (const)_fastCStringContents:(BOOL)a3
{
  return 0LL;
}

- (BOOL)_isCString
{
  return -[NSString _fastCStringContents:](self, "_fastCStringContents:", 0LL) != 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NSString initWithString:]( +[NSString allocWithZone:](&OBJC_CLASS___NSString, "allocWithZone:", a3),  "initWithString:",  self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[NSString initWithString:]( +[NSMutableString allocWithZone:](&OBJC_CLASS___NSMutableString, "allocWithZone:", a3),  "initWithString:",  self);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }

  else
  {
    int v5 = _NSIsNSString();
    if (v5) {
      LOBYTE(v5) = -[NSString isEqualToString:](self, "isEqualToString:", a3);
    }
  }

  return v5;
}

- (BOOL)isEqualToString:(NSString *)aString
{
  return self == aString
      || -[NSString compare:options:range:]( self,  "compare:options:range:",  aString,  2LL,  0LL,  -[NSString length](self, "length")) == NSOrderedSame;
}

- (NSComparisonResult)compare:(NSString *)string options:(NSStringCompareOptions)mask
{
  if (self == string) {
    return 0LL;
  }
  else {
    return -[NSString compare:options:range:]( self,  "compare:options:range:",  string,  mask,  0LL,  -[NSString length](self, "length"));
  }
}

- (NSComparisonResult)localizedCompare:(NSString *)string
{
  NSUInteger v5 = -[NSString length](self, "length");
  return -[NSString compare:options:range:locale:]( self,  "compare:options:range:locale:",  string,  0,  0,  v5,  [MEMORY[0x189603F90] currentLocale]);
}

- (NSComparisonResult)localizedCaseInsensitiveCompare:(NSString *)string
{
  NSUInteger v5 = -[NSString length](self, "length");
  return -[NSString compare:options:range:locale:]( self,  "compare:options:range:locale:",  string,  1,  0,  v5,  [MEMORY[0x189603F90] currentLocale]);
}

- (NSComparisonResult)localizedStandardCompare:(NSString *)string
{
  NSUInteger v5 = -[NSString length](self, "length");
  return -[NSString compare:options:range:locale:]( self,  "compare:options:range:locale:",  string,  833,  0,  v5,  [MEMORY[0x189603F90] currentLocale]);
}

- (NSRange)rangeOfComposedCharacterSequenceAtIndex:(NSUInteger)index
{
  if (-[NSString length](self, "length") <= index)
  {
    SEL v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"The index %ld is invalid",  index);
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v6 userInfo:0]);
    NSRange v9 = -[NSString rangeOfComposedCharacterSequencesForRange:](v7, v8, v11);
    NSUInteger length = v9.length;
    NSUInteger location = v9.location;
  }

  else
  {
    NSUInteger location = CFStringGetRangeOfCharacterClusterAtIndex();
  }

  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSRange)rangeOfComposedCharacterSequencesForRange:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  NSUInteger v6 = -[NSString length](self, "length");
  if (location == v6) {
    uint64_t v7 = location;
  }
  else {
    uint64_t v7 = -[NSString rangeOfComposedCharacterSequenceAtIndex:]( self,  "rangeOfComposedCharacterSequenceAtIndex:",  location);
  }
  if (location + length != v6)
  {
    if (length) {
      uint64_t v8 = location + length - 1;
    }
    else {
      uint64_t v8 = location;
    }
    uint64_t v9 = -[NSString rangeOfComposedCharacterSequenceAtIndex:](self, "rangeOfComposedCharacterSequenceAtIndex:", v8);
    NSUInteger v6 = v9 + v10;
  }

  NSUInteger v11 = v6 - v7;
  NSUInteger v12 = v7;
  result.NSUInteger length = v11;
  result.NSUInteger location = v12;
  return result;
}

- (NSRange)rangeOfString:(NSString *)searchString options:(NSStringCompareOptions)mask
{
  NSUInteger v4 = -[NSString rangeOfString:options:range:locale:]( self,  "rangeOfString:options:range:locale:",  searchString,  mask,  0LL,  -[NSString length](self, "length"),  0LL);
  result.NSUInteger length = v5;
  result.NSUInteger location = v4;
  return result;
}

- (NSRange)rangeOfString:(NSString *)searchString
{
  NSUInteger v3 = -[NSString rangeOfString:options:range:locale:]( self,  "rangeOfString:options:range:locale:",  searchString,  0LL,  0LL,  -[NSString length](self, "length"),  0LL);
  result.NSUInteger length = v4;
  result.NSUInteger location = v3;
  return result;
}

- (NSRange)rangeOfCharacterFromSet:(NSCharacterSet *)searchSet options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToSearch
{
  NSUInteger length = rangeOfReceiverToSearch.length;
  NSUInteger location = rangeOfReceiverToSearch.location;
  uint64_t v27 = *MEMORY[0x1895F89C0];
  NSUInteger v11 = -[NSString length](self, "length");
  if (v11 < length || location > v11 - length)
  {
    if (_CFExecutableLinkedOnOrAfter())
    {
      uint64_t v18 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: Range {%lu, %lu} out of bounds; string length %lu",
              _NSMethodExceptionProem((objc_class *)self, a2),
              location,
              length,
              v11);
      uint64_t v19 = (void *)MEMORY[0x189603F70];
      id v20 = (void *)MEMORY[0x189603B40];
      goto LABEL_16;
    }

    if ((rangeOfCharacterFromSet_options_range__warnonce & 1) == 0)
    {
      rangeOfCharacterFromSet_options_range__warnonce = 1;
      NSUInteger v12 = _NSMethodExceptionProem((objc_class *)self, a2);
      v28.NSUInteger location = location;
      v28.NSUInteger length = length;
      uint64_t v13 = NSStringFromRange(v28);
      NSLog( (NSString *)@"*** %@: Invalid range %@; this will become an exception for apps linked on SnowLeopard. Warning shown once per app execution.",
        v12,
        v13);
    }
  }

  if (!searchSet)
  {
    uint64_t v18 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: nil argument",  _NSMethodExceptionProem((objc_class *)self, a2));
    uint64_t v19 = (void *)MEMORY[0x189603F70];
    id v20 = (void *)MEMORY[0x189603A60];
LABEL_16:
    objc_exception_throw((id)[v19 exceptionWithName:*v20 reason:v18 userInfo:0]);
    NSRange v25 = -[NSString rangeOfCharacterFromSet:options:](v21, v22, v23, v24);
    NSUInteger v17 = v25.length;
    NSUInteger v16 = v25.location;
    goto LABEL_17;
  }

  v30.NSUInteger location = location;
  v30.NSUInteger length = length;
  int CharacterFromSet = CFStringFindCharacterFromSet((CFStringRef)self, (CFCharacterSetRef)searchSet, v30, mask, &result);
  BOOL v15 = CharacterFromSet == 0;
  if (CharacterFromSet) {
    NSUInteger v16 = result.location;
  }
  else {
    NSUInteger v16 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v15) {
    NSUInteger v17 = 0LL;
  }
  else {
    NSUInteger v17 = result.length;
  }
LABEL_17:
  v29.NSUInteger length = v17;
  v29.NSUInteger location = v16;
  return v29;
}

- (NSRange)rangeOfCharacterFromSet:(NSCharacterSet *)searchSet options:(NSStringCompareOptions)mask
{
  NSUInteger v4 = -[NSString rangeOfCharacterFromSet:options:range:]( self,  "rangeOfCharacterFromSet:options:range:",  searchSet,  mask,  0LL,  -[NSString length](self, "length"));
  result.NSUInteger length = v5;
  result.NSUInteger location = v4;
  return result;
}

- (NSRange)rangeOfCharacterFromSet:(NSCharacterSet *)searchSet
{
  NSUInteger v3 = -[NSString rangeOfCharacterFromSet:options:range:]( self,  "rangeOfCharacterFromSet:options:range:",  searchSet,  0LL,  0LL,  -[NSString length](self, "length"));
  result.NSUInteger length = v4;
  result.NSUInteger location = v3;
  return result;
}

- (NSArray)componentsSeparatedByCharactersInSet:(NSCharacterSet *)separator
{
  uint64_t v5 = -[NSString rangeOfCharacterFromSet:options:range:]( self,  "rangeOfCharacterFromSet:options:range:",  separator,  0LL,  0LL,  -[NSString length](self, "length"));
  if (v6)
  {
    uint64_t v7 = v5;
    uint64_t v8 = v6;
    NSUInteger v9 = -[NSString length](self, "length");
    uint64_t v10 = (NSArray *)[MEMORY[0x189603FA8] array];
    uint64_t v11 = -[NSString zone](self, "zone");
    uint64_t v12 = 0LL;
    do
    {
      id v13 = -[NSString _newSubstringWithRange:zone:](self, "_newSubstringWithRange:zone:", v12, v7 - v12, v11);
      -[NSArray addObject:](v10, "addObject:", v13);

      uint64_t v12 = v7 + v8;
      NSUInteger v14 = v9 - (v7 + v8);
      uint64_t v7 = -[NSString rangeOfCharacterFromSet:options:range:]( self,  "rangeOfCharacterFromSet:options:range:",  separator,  0LL,  v7 + v8,  v14);
      uint64_t v8 = v15;
    }

    while (v15);
    id v16 = -[NSString _newSubstringWithRange:zone:](self, "_newSubstringWithRange:zone:", v12, v14, v11);
    -[NSArray addObject:](v10, "addObject:", v16);
  }

  else
  {
    id v16 = (id)-[NSString copy](self, "copy");
    uint64_t v10 = (NSArray *)[MEMORY[0x189603F18] arrayWithObject:v16];
  }

  return v10;
}

- (NSString)commonPrefixWithString:(NSString *)str options:(NSStringCompareOptions)mask
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  uint64_t v5 = -[NSString length](self, "length");
  NSRange v25 = str;
  int64_t v6 = -[NSString length](str, "length");
  NSRange result = (NSString *)&stru_189CA6A28;
  if (v5 && v6)
  {
    uint64_t v8 = -[NSString _fastCharacterContents](self, "_fastCharacterContents");
    if (v8)
    {
      NSUInteger v9 = (UniChar *)v8;
      int v23 = 0;
      unint64_t v10 = v5;
    }

    else if (v5 < 101)
    {
      unint64_t v10 = 0LL;
      int v23 = 0;
      NSUInteger v9 = (UniChar *)&v28;
    }

    else
    {
      uint64_t v11 = malloc_default_zone();
      NSUInteger v9 = (UniChar *)malloc_zone_malloc(v11, 2 * v5);
      unint64_t v10 = 0LL;
      int v23 = 1;
    }

    uint64_t v12 = 0LL;
    unint64_t v13 = 0LL;
    MutableWithExternalCharactersNoCopy = 0LL;
    if (v5 >= 0) {
      uint64_t v15 = v5;
    }
    else {
      uint64_t v15 = v5 + 1;
    }
    uint64_t v16 = v15 >> 1;
    if (v16 >= v6) {
      uint64_t v17 = v6;
    }
    else {
      uint64_t v17 = v16;
    }
    externalCharactersAllocator = (const __CFAllocator *)*MEMORY[0x189604DC8];
    while (1)
    {
      if ((mask & 2) != 0)
      {
        unint64_t v20 = v17 + 1;
      }

      else
      {
        uint64_t v18 = -[NSString rangeOfComposedCharacterSequenceAtIndex:]( self,  "rangeOfComposedCharacterSequenceAtIndex:",  v17);
        unint64_t v20 = v18 + v19;
      }

      if (v20 > v10)
      {
        -[NSString getCharacters:range:](self, "getCharacters:range:", &v9[v10], v10, v20 - v10);
        unint64_t v10 = v20;
      }

      if (MutableWithExternalCharactersNoCopy) {
        CFStringSetExternalCharactersNoCopy(MutableWithExternalCharactersNoCopy, v9, v20, v20);
      }
      else {
        MutableWithExternalCharactersNoCopy = CFStringCreateMutableWithExternalCharactersNoCopy( 0LL,  v9,  v20,  v20,  externalCharactersAllocator);
      }
      -[NSString rangeOfString:options:range:]( v25,  "rangeOfString:options:range:",  MutableWithExternalCharactersNoCopy,  mask | 8,  0LL,  v6);
      if (v21) {
        uint64_t v12 = v17 + 1;
      }
      else {
        uint64_t v5 = v17;
      }
      if (v21) {
        unint64_t v13 = v20;
      }
      if (v12 >= v5) {
        break;
      }
      uint64_t v22 = v12 + v5;
      if (v12 + v5 < 0 != __OFADD__(v12, v5)) {
        ++v22;
      }
      uint64_t v17 = v22 >> 1;
    }

    CFRelease(MutableWithExternalCharactersNoCopy);
    if (v23) {
      free(v9);
    }
    if (v13) {
      return -[NSString substringWithRange:](self, "substringWithRange:", 0LL, v13);
    }
    else {
      return (NSString *)&stru_189CA6A28;
    }
  }

  return result;
}

- (BOOL)hasSuffix:(NSString *)str
{
  return -[NSString rangeOfString:options:range:]( self,  "rangeOfString:options:range:",  str,  12LL,  0LL,  -[NSString length](self, "length")) != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)localizedHasPrefix:(id)a3
{
  NSUInteger v5 = -[NSString length](self, "length");
  return -[NSString rangeOfString:options:range:locale:]( self,  "rangeOfString:options:range:locale:",  a3,  8,  0,  v5,  [MEMORY[0x189603F90] currentLocale]) != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)localizedHasSuffix:(id)a3
{
  NSUInteger v5 = -[NSString length](self, "length");
  return -[NSString rangeOfString:options:range:locale:]( self,  "rangeOfString:options:range:locale:",  a3,  12,  0,  v5,  [MEMORY[0x189603F90] currentLocale]) != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)containsString:(NSString *)str
{
  return -[NSString rangeOfString:options:range:locale:]( self,  "rangeOfString:options:range:locale:",  str,  0LL,  0LL,  -[NSString length](self, "length"),  0LL) != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)localizedCaseInsensitiveContainsString:(NSString *)str
{
  NSUInteger v5 = -[NSString length](self, "length");
  return -[NSString rangeOfString:options:range:locale:]( self,  "rangeOfString:options:range:locale:",  str,  1,  0,  v5,  [MEMORY[0x189603F90] currentLocale]) != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)localizedStandardContainsString:(NSString *)str
{
  NSUInteger v5 = -[NSString length](self, "length");
  return -[NSString rangeOfString:options:range:locale:]( self,  "rangeOfString:options:range:locale:",  str,  129,  0,  v5,  [MEMORY[0x189603F90] currentLocale]) != 0x7FFFFFFFFFFFFFFFLL;
}

- (NSRange)localizedStandardRangeOfString:(NSString *)str
{
  NSUInteger v5 = -[NSString length](self, "length");
  NSUInteger v6 = -[NSString rangeOfString:options:range:locale:]( self,  "rangeOfString:options:range:locale:",  str,  129,  0,  v5,  [MEMORY[0x189603F90] currentLocale]);
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (NSString)stringByPaddingToLength:(NSUInteger)newLength withString:(NSString *)padString startingAtIndex:(NSUInteger)padIndex
{
  NSUInteger v10 = -[NSString length](self, "length");
  if (v10 >= newLength)
  {
    if (v10 != newLength) {
      return -[NSString substringWithRange:](self, "substringWithRange:", 0LL, newLength);
    }
    unint64_t v13 = -[NSString copyWithZone:](self, "copyWithZone:", -[NSString zone](self, "zone"));
    return (NSString *)v13;
  }

  NSUInteger v11 = -[NSString length](padString, "length");
  if (v11)
  {
    if (v11 > padIndex)
    {
      MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, (CFStringRef)self);
      CFStringPad(MutableCopy, (CFStringRef)padString, newLength, padIndex);
      unint64_t v13 = MutableCopy;
      return (NSString *)v13;
    }

    uint64_t v15 = _NSMethodExceptionProem((objc_class *)self, a2);
    uint64_t v16 = "out of range padIndex";
  }

  else
  {
    uint64_t v15 = _NSMethodExceptionProem((objc_class *)self, a2);
    uint64_t v16 = "nil or empty padString";
  }

  uint64_t v17 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@: %s", v15, v16);
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v17 userInfo:0]);
  -[NSString getCharacters:range:](v18, v19, v20, v21);
  return result;
}

- (void)getCharacters:(unichar *)buffer range:(NSRange)range
{
  if (range.length)
  {
    NSUInteger length = range.length;
    NSUInteger location = range.location;
    do
    {
      *buffer++ = -[NSString characterAtIndex:](self, "characterAtIndex:", location++);
      --length;
    }

    while (length);
  }

- (void)getCharacters:(unichar *)buffer
{
}

- (NSString)substringWithRange:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  NSUInteger v7 = -[NSString length](self, "length");
  if (v7 >= length && location <= v7 - length) {
    return (NSString *) -[NSString _newSubstringWithRange:zone:]( self,  "_newSubstringWithRange:zone:",  location,  length,  -[NSString zone](self, "zone"));
  }
  NSUInteger v9 = (void *)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603B40],  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@: Range {%lu, %lu} out of bounds; string length %lu",
                   _NSMethodExceptionProem((objc_class *)self, a2),
                   location,
                   length,
                   v7),
                 0LL);
  objc_exception_throw(v9);
  return -[NSString substringFromIndex:](v10, v11, v12);
}

- (NSString)substringFromIndex:(NSUInteger)from
{
  NSUInteger v6 = -[NSString length](self, "length");
  if (v6 >= from) {
    return -[NSString substringWithRange:](self, "substringWithRange:", from, v6 - from);
  }
  uint64_t v8 = (void *)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603B40],  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@: Index %lu out of bounds; string length %lu",
                   _NSMethodExceptionProem((objc_class *)self, a2),
                   from,
                   v6),
                 0LL);
  objc_exception_throw(v8);
  return -[NSString stringByAppendingFormat:](v9, v10, v11);
}

- (NSString)stringByAppendingFormat:(NSString *)format
{
  NSUInteger v4 = -[NSString initWithFormat:arguments:](&__placeholder, "initWithFormat:arguments:", format, va);
  NSUInteger v5 = (malloc_zone_t *)-[NSString zone](self, "zone");
  unint64_t v13 = _NSNewStringByAppendingStrings(v5, v6, v7, v8, v9, v10, v11, v12, (size_t)self, (uint64_t)v4);

  return v13;
}

- (double)doubleValue
{
  v5[1] = *(double *)MEMORY[0x1895F89C0];
  unint64_t v4 = 0LL;
  int v2 = _NSScanDoubleFromString( self,  +[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"),  v5,  &v4,  0LL);
  double result = v5[0];
  if (!v2) {
    return 0.0;
  }
  return result;
}

- (float)floatValue
{
  v5[1] = *(double *)MEMORY[0x1895F89C0];
  unint64_t v4 = 0LL;
  int v2 = _NSScanDoubleFromString( self,  +[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"),  v5,  &v4,  0LL);
  float result = v5[0];
  if (!v2) {
    return 0.0;
  }
  return result;
}

- (int)intValue
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  unint64_t v3 = 0LL;
  if (_NSScanIntFromString( self,  +[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"),  &v4,  &v3)) {
    return v4;
  }
  else {
    return 0;
  }
}

- (BOOL)BOOLValue
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  unint64_t v3 = +[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet");
  NSUInteger v4 = -[NSString length](self, "length");
  NSUInteger v23 = v4;
  uint64_t v24 = 0LL;
  uint64_t v22 = self;
  if (v4)
  {
    if (v4 >= 0x20) {
      uint64_t v5 = 32LL;
    }
    else {
      uint64_t v5 = v4;
    }
    unint64_t v20 = v5;
    objc_msgSend(self, sel_getUid("getCharacters:range:"), v25, 0, v5);
    __int16 v6 = v25[0];
  }

  else
  {
    unint64_t v20 = 0LL;
    __int16 v6 = -1;
  }

  unint64_t v21 = 1LL;
  unsigned __int16 v26 = v6;
  if (-[NSCharacterSet characterIsMember:](v3, "characterIsMember:"))
  {
    do
    {
      unint64_t v7 = v21;
      if (v21 >= v20)
      {
        uint64_t v9 = v24 + v20;
        if (v23 > v24 + v20)
        {
          if (v23 - (v24 + v20) >= 0x20) {
            uint64_t v10 = 32LL;
          }
          else {
            uint64_t v10 = v23 - (v24 + v20);
          }
          v24 += v20;
          unint64_t v20 = v10;
          objc_msgSend(v22, sel_getUid("getCharacters:range:"), v25, v9, v10);
          unsigned __int16 v26 = v25[0];
          unint64_t v21 = 1LL;
          continue;
        }

        unint64_t v21 = v20 + 1;
        __int16 v8 = -1;
      }

      else
      {
        ++v21;
        __int16 v8 = v25[v7];
      }

      unsigned __int16 v26 = v8;
    }

    while (-[NSCharacterSet characterIsMember:](v3, "characterIsMember:"));
  }

  int v11 = v26;
  BOOL result = 1;
  if (v26 <= 0x58u)
  {
    if (v26 == 43 || v26 == 45)
    {
      unint64_t v13 = v21;
      if (v21 >= v20)
      {
        uint64_t v14 = v24 + v20;
        if (v23 <= v24 + v20)
        {
LABEL_45:
          int v11 = 0xFFFF;
          return (v11 - 49) < 9;
        }

        if (v23 - (v24 + v20) >= 0x20) {
          uint64_t v15 = 32LL;
        }
        else {
          uint64_t v15 = v23 - (v24 + v20);
        }
        v24 += v20;
        unint64_t v20 = v15;
        objc_msgSend(v22, sel_getUid("getCharacters:range:"), v25, v14, v15);
        int v11 = v25[0];
        unsigned __int16 v26 = v25[0];
        unint64_t v21 = 1LL;
      }

      else
      {
        ++v21;
        int v11 = (unsigned __int16)v25[v13];
        unsigned __int16 v26 = v11;
      }
    }

    else if (v26 == 84)
    {
      return result;
    }

- (NSString)uppercaseString
{
  return -[NSString uppercaseStringWithLocale:](self, "uppercaseStringWithLocale:", 0LL);
}

- (NSString)lowercaseString
{
  return -[NSString lowercaseStringWithLocale:](self, "lowercaseStringWithLocale:", 0LL);
}

- (NSString)capitalizedString
{
  return -[NSString capitalizedStringWithLocale:](self, "capitalizedStringWithLocale:", 0LL);
}

- (NSString)localizedUppercaseString
{
  return -[NSString uppercaseStringWithLocale:]( self,  "uppercaseStringWithLocale:",  [MEMORY[0x189603F90] currentLocale]);
}

- (NSString)localizedLowercaseString
{
  return -[NSString lowercaseStringWithLocale:]( self,  "lowercaseStringWithLocale:",  [MEMORY[0x189603F90] currentLocale]);
}

- (NSString)localizedCapitalizedString
{
  return -[NSString capitalizedStringWithLocale:]( self,  "capitalizedStringWithLocale:",  [MEMORY[0x189603F90] currentLocale]);
}

- (NSString)uppercaseStringWithLocale:(NSLocale *)locale
{
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
  CFStringReplaceAll(Mutable, (CFStringRef)self);
  CFStringUppercase(Mutable, (CFLocaleRef)locale);
  return (NSString *)Mutable;
}

- (NSString)lowercaseStringWithLocale:(NSLocale *)locale
{
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
  CFStringReplaceAll(Mutable, (CFStringRef)self);
  CFStringLowercase(Mutable, (CFLocaleRef)locale);
  return (NSString *)Mutable;
}

- (NSString)capitalizedStringWithLocale:(NSLocale *)locale
{
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
  CFStringReplaceAll(Mutable, (CFStringRef)self);
  CFStringCapitalize(Mutable, (CFLocaleRef)locale);
  return (NSString *)Mutable;
}

- (NSString)decomposedStringWithCanonicalMapping
{
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
  CFStringReplaceAll(Mutable, (CFStringRef)self);
  CFStringNormalize(Mutable, kCFStringNormalizationFormD);
  return (NSString *)Mutable;
}

- (NSString)precomposedStringWithCanonicalMapping
{
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
  CFStringReplaceAll(Mutable, (CFStringRef)self);
  CFStringNormalize(Mutable, kCFStringNormalizationFormC);
  return (NSString *)Mutable;
}

- (NSString)decomposedStringWithCompatibilityMapping
{
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
  CFStringReplaceAll(Mutable, (CFStringRef)self);
  CFStringNormalize(Mutable, kCFStringNormalizationFormKD);
  return (NSString *)Mutable;
}

- (NSString)precomposedStringWithCompatibilityMapping
{
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
  CFStringReplaceAll(Mutable, (CFStringRef)self);
  CFStringNormalize(Mutable, kCFStringNormalizationFormKC);
  return (NSString *)Mutable;
}

- (NSString)stringByFoldingWithOptions:(NSStringCompareOptions)options locale:(NSLocale *)locale
{
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
  CFStringReplaceAll(Mutable, (CFStringRef)self);
  CFStringFold(Mutable, options, (CFLocaleRef)locale);
  return (NSString *)Mutable;
}

- (NSString)stringByApplyingTransform:(NSStringTransform)transform reverse:(BOOL)reverse
{
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
  CFStringReplaceAll(Mutable, (CFStringRef)self);
  if (CFStringTransform(Mutable, 0LL, (CFStringRef)transform, reverse)) {
    return (NSString *)Mutable;
  }

  return 0LL;
}

- (void)_getBlockStart:(unint64_t *)a3 end:(unint64_t *)a4 contentsEnd:(unint64_t *)a5 forRange:(_NSRange)a6 stopAtLineSeparators:(BOOL)a7
{
  BOOL v7 = a7;
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  unint64_t v13 = (objc_class *)self;
  uint64_t v56 = *MEMORY[0x1895F89C0];
  unint64_t v14 = -[NSString length](self, "length");
  if (v14 < length || location > v14 - length)
  {
    if (_CFExecutableLinkedOnOrAfter())
    {
      uint64_t v41 = (void *)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603B40],  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@: Range {%lu, %lu} out of bounds; string length %lu",
                        _NSMethodExceptionProem(v13, a2),
                        location,
                        length,
                        v14),
                      0LL);
      objc_exception_throw(v41);
      -[NSString getLineStart:end:contentsEnd:forRange:](v42, v43, v44, v45, v46, v58);
      return;
    }

    if ((_getBlockStart_end_contentsEnd_forRange_stopAtLineSeparators__warnonce & 1) == 0)
    {
      _getBlockStart_end_contentsEnd_forRange_stopAtLineSeparators__warnonce = 1;
      uint64_t v15 = _NSMethodExceptionProem(v13, a2);
      v57.NSUInteger location = location;
      v57.NSUInteger length = length;
      unint64_t v16 = NSStringFromRange(v57);
      NSLog( (NSString *)@"*** %@: Invalid range %@; this will become an exception for apps linked on SnowLeopard. Warning shown once per app execution.",
        v15,
        v16);
    }
  }

  if (location)
  {
    if (a3)
    {
      v47 = a4;
      v48 = v13;
      unint64_t v52 = v14;
      unint64_t v53 = location;
      uint64_t v51 = v13;
      if (v14 <= location)
      {
        int v18 = 0xFFFF;
        __int16 v55 = -1;
        unint64_t v19 = location;
      }

      else
      {
        if (v14 - location >= 0x20) {
          uint64_t v17 = 32LL;
        }
        else {
          uint64_t v17 = v14 - location;
        }
        *(void *)&__int128 v50 = v17;
        objc_msgSend(v13, sel_getUid("getCharacters:range:"), v54, location, v17);
        int v18 = v54[0];
        unint64_t v19 = v53;
        __int16 v55 = v54[0];
        unint64_t v13 = v51;
      }

      if (v19 >= 0x20) {
        uint64_t v21 = 32LL;
      }
      else {
        uint64_t v21 = v19;
      }
      *(void *)&__int128 v50 = v21;
      *((void *)&v50 + 1) = v21;
      unint64_t v53 = v19 - v21;
      objc_msgSend(v13, sel_getUid("getCharacters:range:"), v54, v19 - v21, v21);
      unint64_t v22 = v21;
      int v23 = (unsigned __int16)v54[v21 - 1];
      __int16 v55 = v54[v21 - 1];
      if (v18 == 10)
      {
        unint64_t v13 = v48;
        if (v23 == 13)
        {
          if (*((void *)&v50 + 1) < 2uLL)
          {
            unint64_t v22 = v53;
            if (v53)
            {
              if (v53 >= 0x20) {
                uint64_t v25 = 32LL;
              }
              else {
                uint64_t v25 = v53;
              }
              *(void *)&__int128 v50 = v25;
              v53 -= v25;
              unint64_t v13 = v48;
              objc_msgSend(v51, sel_getUid("getCharacters:range:"), v54, v53, v25);
              unint64_t v22 = v25;
              LOWORD(v23) = v54[v25 - 1];
            }

            else
            {
              *((void *)&v50 + 1) = 0LL;
              LOWORD(v23) = -1;
            }
          }

          else
          {
            --*((void *)&v50 + 1);
            LOWORD(v23) = v54[v21 - 2];
            unint64_t v22 = v21 - 1;
          }

          __int16 v55 = v23;
        }
      }

      else
      {
        unint64_t v13 = v48;
      }

      while (1)
      {
        if (v7)
        {
          if ((unsigned __int16)(v23 - 14) >= 0x77u)
          {
            if ((unsigned __int16)v23 > 0x2027u)
            {
            }

            else if ((unsigned __int16)v23 == 10 || (unsigned __int16)v23 == 13 || (unsigned __int16)v23 == 133)
            {
              goto LABEL_60;
            }
          }
        }

        else if ((unsigned __int16)(v23 - 14) >= 0x201Bu {
               && ((unsigned __int16)v23 == 10 || (unsigned __int16)v23 == 8233 || (unsigned __int16)v23 == 13))
        }
        {
LABEL_60:
          unint64_t v24 = v53 + v22;
          goto LABEL_62;
        }

        if (v22 < 2)
        {
          if (v53)
          {
            if (v53 >= 0x20) {
              uint64_t v26 = 32LL;
            }
            else {
              uint64_t v26 = v53;
            }
            *(void *)&__int128 v50 = v26;
            v53 -= v26;
            unint64_t v13 = v48;
            objc_msgSend(v51, sel_getUid("getCharacters:range:"), v54, v53, v26);
            unint64_t v22 = v26;
            LOWORD(v23) = v54[v26 - 1];
          }

          else
          {
            unint64_t v22 = 0LL;
            *((void *)&v50 + 1) = 0LL;
            LOWORD(v23) = -1;
          }
        }

        else
        {
          *((void *)&v50 + 1) = v22 - 1;
          LOWORD(v23) = v54[v22-- - 2];
        }

        __int16 v55 = v23;
      }

      unint64_t v24 = 0LL;
LABEL_62:
      a4 = v47;
      unint64_t v20 = a3;
      goto LABEL_63;
    }
  }

  else
  {
    unint64_t v20 = a3;
    if (!a5 && v14 == length)
    {
      if (a3) {
        *a3 = 0LL;
      }
      if (a4) {
        goto LABEL_120;
      }
      return;
    }

    if (a3)
    {
      unint64_t v24 = 0LL;
LABEL_63:
      unint64_t *v20 = v24;
    }
  }

  if ((unint64_t)a4 | (unint64_t)a5)
  {
    unint64_t v27 = location + length - (length != 0);
    unint64_t v52 = v14;
    unint64_t v53 = v27;
    uint64_t v51 = v13;
    if (v14 <= v27)
    {
      unsigned __int16 v32 = -1;
      __int16 v55 = -1;
      __int128 v50 = xmmword_183723F60;
LABEL_78:
      unint64_t v33 = 1LL;
      while (1)
      {
        if (v7)
        {
          if ((unsigned __int16)(v32 - 14) >= 0x77u)
          {
            if (v32 > 0x2027u)
            {
            }

            else if (v32 == 10 || v32 == 13 || v32 == 133)
            {
              goto LABEL_101;
            }
          }
        }

        else if ((unsigned __int16)(v32 - 14) >= 0x201Bu && (v32 == 10 || v32 == 8233 || v32 == 13))
        {
LABEL_101:
          unint64_t v14 = v33 + v53 - 1;
          if (v33 >= (unint64_t)v50)
          {
            uint64_t v38 = v50 + v53;
            if (v52 <= (unint64_t)v50 + v53)
            {
              *((void *)&v50 + 1) = v50 + 1;
              int v37 = 0xFFFF;
              __int16 v55 = -1;
            }

            else
            {
              if (v52 - ((void)v50 + v53) >= 0x20) {
                uint64_t v39 = 32LL;
              }
              else {
                uint64_t v39 = v52 - (v50 + v53);
              }
              v53 += v50;
              *(void *)&__int128 v50 = v39;
              objc_msgSend(v51, sel_getUid("getCharacters:range:"), v54, v38, v39);
              int v37 = v54[0];
              __int16 v55 = v54[0];
              *((void *)&v50 + 1) = 1LL;
            }
          }

          else
          {
            *((void *)&v50 + 1) = v33 + 1;
            int v37 = (unsigned __int16)v54[v33];
            __int16 v55 = v37;
          }

          if (v32 == 13)
          {
            BOOL v40 = v37 == 10;
            uint64_t v31 = 1LL;
            if (v40) {
              uint64_t v31 = 2LL;
            }
            goto LABEL_116;
          }

- (void)getLineStart:(NSUInteger *)startPtr end:(NSUInteger *)lineEndPtr contentsEnd:(NSUInteger *)contentsEndPtr forRange:(NSRange)range
{
}

- (void)getParagraphStart:(NSUInteger *)startPtr end:(NSUInteger *)parEndPtr contentsEnd:(NSUInteger *)contentsEndPtr forRange:(NSRange)range
{
}

- (NSRange)lineRangeForRange:(NSRange)range
{
  v6[1] = *MEMORY[0x1895F89C0];
  -[NSString getLineStart:end:contentsEnd:forRange:]( self,  "getLineStart:end:contentsEnd:forRange:",  v6,  &v5,  0LL,  range.location,  range.length);
  NSUInteger v3 = v6[0];
  NSUInteger v4 = v5 - v6[0];
  result.NSUInteger length = v4;
  result.NSUInteger location = v3;
  return result;
}

- (NSRange)paragraphRangeForRange:(NSRange)range
{
  v6[1] = *MEMORY[0x1895F89C0];
  -[NSString getParagraphStart:end:contentsEnd:forRange:]( self,  "getParagraphStart:end:contentsEnd:forRange:",  v6,  &v5,  0LL,  range.location,  range.length);
  NSUInteger v3 = v6[0];
  NSUInteger v4 = v5 - v6[0];
  result.NSUInteger length = v4;
  result.NSUInteger location = v3;
  return result;
}

- (void)enumerateSubstringsInRange:(NSRange)range options:(NSStringEnumerationOptions)opts usingBlock:(void *)block
{
  unint64_t length = range.length;
  unint64_t location = range.location;
  uint64_t v80 = *MEMORY[0x1895F89C0];
  BOOL v9 = (opts & 0x800) == 0;
  unint64_t v10 = range.location + range.length;
  if ((opts & 0x100) != 0) {
    NSUInteger v11 = range.location + range.length - 1;
  }
  else {
    NSUInteger v11 = range.location;
  }
  char v79 = 0;
  unint64_t v12 = -[NSString length](self, "length");
  if (v12 < length || location > v12 - length)
  {
    __int16 v55 = (void *)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603B40],  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@: Range {%lu, %lu} out of bounds; string length %lu",
                      _NSMethodExceptionProem((objc_class *)self, a2),
                      location,
                      length,
                      v12),
                    0LL);
    objc_exception_throw(v55);
  }

  if (!length) {
    return;
  }
  double v77 = 0LL;
  double v78 = 0LL;
  if ((unint64_t)opts - 3 > 1)
  {
    uint64_t v58 = 0LL;
    uint64_t v57 = 0LL;
    CFIndex v59 = 0LL;
    unint64_t v60 = 0LL;
    cf = 0LL;
  }

  else
  {
    if ((opts & 0x100) == 0)
    {
      else {
        CFOptionFlags v13 = 4LL;
      }
      unint64_t v14 = (uint64_t (**)(void *, __CFStringTokenizer *))&__block_literal_global_49;
      uint64_t v56 = v14;
      if ((opts & 0x400) != 0) {
        Systeuint64_t m = 0LL;
      }
      else {
        Systeuint64_t m = CFLocaleGetSystem();
      }
      if ((opts & 0x800) != 0)
      {
        v82.unint64_t location = 0LL;
        v82.unint64_t length = v12;
        unint64_t v19 = CFStringTokenizerCreate(0LL, (CFStringRef)self, v82, v13, System);
        if (CFStringTokenizerGoToTokenAtIndex(v19, location))
        {
LABEL_32:
          cf = v19;
          CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v19);
          CFIndex v59 = CurrentTokenRange.length;
          unint64_t v60 = CurrentTokenRange.location;
          uint64_t v58 = 0LL;
          uint64_t v57 = 0LL;
          if (CurrentTokenRange.location == -1)
          {
            char v79 = 1;
            unint64_t v60 = -1LL;
          }

          goto LABEL_35;
        }
      }

      else
      {
        v81.unint64_t location = location;
        v81.unint64_t length = length;
        unint64_t v19 = CFStringTokenizerCreate(0LL, (CFStringRef)self, v81, v13, System);
      }

      unint64_t v20 = __58__NSString_enumerateSubstringsInRange_options_usingBlock___block_invoke;
      v20((int)v56, v19);
      goto LABEL_32;
    }

    v67[0] = MEMORY[0x1895F87A8];
    if (length >= 0x186A0) {
      unint64_t v16 = 100000LL;
    }
    else {
      unint64_t v16 = length;
    }
    v67[1] = 3221225472LL;
    unint64_t v68 = __58__NSString_enumerateSubstringsInRange_options_usingBlock___block_invoke_3;
    v69 = &unk_189CA0F80;
    if (length <= 0x186A0) {
      uint64_t v17 = location;
    }
    else {
      uint64_t v17 = v10 - 100000;
    }
    BOOL v76 = v9;
    NSStringEnumerationOptions v72 = opts;
    unint64_t v73 = location;
    unint64_t v74 = length;
    unint64_t v75 = v10;
    uint64_t v70 = self;
    uint64_t v71 = opts;
    uint64_t v57 = v17;
    uint64_t v18 = __58__NSString_enumerateSubstringsInRange_options_usingBlock___block_invoke_3( (uint64_t)v67,  (void **)&v78,  (void **)&v77,  v17,  v16);
    if (v18)
    {
      CFIndex v59 = 0LL;
      unint64_t v60 = 0LL;
      cf = 0LL;
      uint64_t v58 = v18 - 1;
    }

    else
    {
      uint64_t v58 = 0LL;
      CFIndex v59 = 0LL;
      unint64_t v60 = 0LL;
      cf = 0LL;
      char v79 = 1;
    }
  }

CFStringTokenizerTokenType __58__NSString_enumerateSubstringsInRange_options_usingBlock___block_invoke( int a1,  CFStringTokenizerRef tokenizer)
{
  do
  {
    while (1)
    {
      Tokeuint64_t n = CFStringTokenizerAdvanceToNextToken(tokenizer);
      CFStringTokenizerTokenType v4 = Token;
      if (!Token) {
        break;
      }
      if ((Token & 0x10) == 0) {
        return v4;
      }
    }
  }

  while (CFStringTokenizerGetCurrentTokenRange(tokenizer).location != -1);
  return v4;
}

CFStringTokenizerTokenType __58__NSString_enumerateSubstringsInRange_options_usingBlock___block_invoke_2( int a1,  CFStringTokenizerRef tokenizer)
{
  do
    Tokeuint64_t n = CFStringTokenizerAdvanceToNextToken(tokenizer);
  while (!Token && CFStringTokenizerGetCurrentTokenRange(tokenizer).location != -1);
  return Token;
}

uint64_t __58__NSString_enumerateSubstringsInRange_options_usingBlock___block_invoke_3( uint64_t a1,  void **a2,  void **a3,  uint64_t a4,  unint64_t a5)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  uint64_t v21 = 0LL;
  unint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  double v10 = 64.0;
  if (*(void *)(a1 + 40) == 3LL) {
    double v10 = 4.0;
  }
  unint64_t v24 = vcvtpd_u64_f64((double)a5 / v10);
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  uint64_t v20 = 0LL;
  if (*a2) {
    free(*a2);
  }
  if (*a3) {
    free(*a3);
  }
  size_t v11 = 16 * v22[3];
  *a2 = malloc(v11);
  *a3 = malloc(v11);
  unint64_t v12 = *(void *)(a1 + 48) & 0xFFFFFFFFFFFFFCFFLL | 0x200;
  if (!*(_BYTE *)(a1 + 80) && a4 != *(void *)(a1 + 56) && a4 + a5 != *(void *)(a1 + 72)) {
    unint64_t v12 = *(void *)(a1 + 48) & 0xFFFFFFFFFFFFF4FFLL | 0x200;
  }
  CFOptionFlags v13 = *(void **)(a1 + 32);
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __58__NSString_enumerateSubstringsInRange_options_usingBlock___block_invoke_4;
  v16[3] = &unk_189CA0F58;
  v16[4] = &v17;
  v16[5] = &v21;
  v16[6] = a2;
  v16[7] = a3;
  objc_msgSend(v13, "enumerateSubstringsInRange:options:usingBlock:", a4, a5, v12, v16);
  uint64_t v14 = v18[3];
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return v14;
}

uint64_t __58__NSString_enumerateSubstringsInRange_options_usingBlock___block_invoke_4( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6)
{
  uint64_t v10 = result;
  uint64_t v11 = *(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL);
  uint64_t v12 = *(void *)(*(void *)(result + 40) + 8LL);
  if (v11 == *(void *)(v12 + 24))
  {
    *(void *)(v12 + 24) = 2 * v11;
    **(void **)(result + 48) = __CFSafelyReallocate();
    NSRange result = __CFSafelyReallocate();
    **(void **)(v10 + 56) = result;
    uint64_t v11 = *(void *)(*(void *)(*(void *)(v10 + 32) + 8LL) + 24LL);
  }

  CFOptionFlags v13 = *(void **)(v10 + 56);
  uint64_t v14 = (void *)(**(void **)(v10 + 48) + 16 * v11);
  *uint64_t v14 = a3;
  v14[1] = a4;
  uint64_t v15 = (void *)(*v13 + 16LL * *(void *)(*(void *)(*(void *)(v10 + 32) + 8LL) + 24LL));
  *uint64_t v15 = a5;
  v15[1] = a6;
  ++*(void *)(*(void *)(*(void *)(v10 + 32) + 8LL) + 24LL);
  return result;
}

- (void)enumerateLinesUsingBlock:(void *)block
{
  v6[5] = *MEMORY[0x1895F89C0];
  NSUInteger v5 = -[NSString length](self, "length");
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  void v6[2] = __37__NSString_enumerateLinesUsingBlock___block_invoke;
  _WORD v6[3] = &unk_189C9DF90;
  v6[4] = block;
  -[NSString enumerateSubstringsInRange:options:usingBlock:]( self,  "enumerateSubstringsInRange:options:usingBlock:",  0LL,  v5,  0LL,  v6);
}

uint64_t __37__NSString_enumerateLinesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (id)displayableString
{
  int v2 = self;
  uint64_t v34 = *MEMORY[0x1895F89C0];
  NSUInteger v3 = -[NSString length](self, "length");
  unint64_t v4 = v3;
  NSUInteger v30 = v3;
  uint64_t v31 = 0LL;
  uint64_t __size = 6 * v3;
  unint64_t v29 = v2;
  if (v3)
  {
    if (v3 >= 0x20) {
      uint64_t v5 = 32LL;
    }
    else {
      uint64_t v5 = v3;
    }
    *(void *)&__int128 v28 = v5;
    objc_msgSend(v2, sel_getUid("getCharacters:range:"), v32, 0, v5, __size);
    __int16 v6 = v32[0];
  }

  else
  {
    *(void *)&__int128 v28 = 0LL;
    __int16 v6 = -1;
  }

  *((void *)&v28 + 1) = 1LL;
  __int16 v33 = v6;
  unint64_t v7 = 1LL;
  do
  {
    while (1)
    {
      unsigned int v8 = (unsigned __int16)(v6 - 32);
      int v9 = v6;
      unsigned __int16 v10 = v6 - 9;
      unsigned int v11 = v10;
      unint64_t v12 = (0xD00000A09uLL >> (8 * v10)) & 0xF;
      if (v11 >= 5) {
        LODWORD(v12) = 0;
      }
      int v13 = v8 >= 0x5F ? v12 : v9;
      uint64_t v14 = (char *)&v28 + 2 * v7++;
      *((void *)&v28 + 1) = v7;
      __int16 v6 = *((_WORD *)v14 + 20);
LABEL_23:
      __int16 v33 = v6;
      if (!v13) {
        goto LABEL_24;
      }
    }

    uint64_t v15 = v31 + v28;
    if (v30 <= v31 + (uint64_t)v28)
    {
      unint64_t v7 = v28 + 1;
      *((void *)&v28 + 1) = v28 + 1;
      __int16 v6 = -1;
      goto LABEL_23;
    }

    if (v30 - (v31 + (void)v28) >= 0x20) {
      uint64_t v16 = 32LL;
    }
    else {
      uint64_t v16 = v30 - (v31 + v28);
    }
    v31 += v28;
    *(void *)&__int128 v28 = v16;
    objc_msgSend(v29, sel_getUid("getCharacters:range:"), v32, v15, v16);
    __int16 v6 = v32[0];
    __int16 v33 = v32[0];
    *((void *)&v28 + 1) = 1LL;
    unint64_t v7 = 1LL;
  }

  while (v13);
LABEL_24:
  uint64_t v17 = malloc(__size);
  NSUInteger v30 = v4;
  uint64_t v31 = 0LL;
  unint64_t v29 = v2;
  if (v4)
  {
    if (v4 >= 0x20) {
      unint64_t v4 = 32LL;
    }
    *(void *)&__int128 v28 = v4;
    objc_msgSend(v2, sel_getUid("getCharacters:range:"), v32, 0, v4);
    unint64_t v18 = v32[0];
    unint64_t v19 = v28;
    *((void *)&v28 + 1) = 1LL;
    __int16 v33 = v32[0];
    uint64_t v20 = 0LL;
    if ((void)v28)
    {
      unint64_t v21 = 1LL;
      do
      {
        if ((v18 - 32) < 0x5F || v18 <= 0xD && ((1 << v18) & 0x2600) != 0)
        {
          v17[v20++] = v18;
        }

        else
        {
          uint64_t v25 = &v17[v20];
          if (v18 > 0x7F)
          {
            *(_WORD *)uint64_t v25 = 21852;
            v25[2] = a0123456789abcd[(unint64_t)v18 >> 12];
            v25[3] = a0123456789abcd[(v18 >> 8) & 0xF];
            v25[4] = a0123456789abcd[v18 >> 4];
            v20 += 6LL;
            v25[5] = a0123456789abcd[v18 & 0xF];
          }

          else
          {
            *uint64_t v25 = 92;
            v25[1] = (v18 >> 6) | 0x30;
            v25[2] = (v18 >> 3) & 7 | 0x30;
            v20 += 4LL;
            v25[3] = v18 & 7 | 0x30;
          }
        }

        if (v21 >= v19)
        {
          uint64_t v23 = v31 + v19;
          if (v30 > v31 + v19)
          {
            if (v30 - (v31 + v19) >= 0x20) {
              uint64_t v24 = 32LL;
            }
            else {
              uint64_t v24 = v30 - (v31 + v19);
            }
            v31 += v19;
            *(void *)&__int128 v28 = v24;
            objc_msgSend(v29, sel_getUid("getCharacters:range:"), v32, v23, v24);
            unint64_t v18 = v32[0];
            __int16 v33 = v32[0];
            *((void *)&v28 + 1) = 1LL;
            unint64_t v19 = v28;
            unint64_t v21 = 1LL;
            continue;
          }

          unint64_t v21 = v19 + 1;
          *((void *)&v28 + 1) = v19 + 1;
          unint64_t v18 = 0xFFFFLL;
        }

        else
        {
          unint64_t v22 = (char *)&v28 + 2 * v21++;
          *((void *)&v28 + 1) = v21;
          unint64_t v18 = *((unsigned __int16 *)v22 + 20);
        }

        __int16 v33 = v18;
      }

      while (v21 - 1 < v19);
    }
  }

  else
  {
    uint64_t v20 = 0LL;
    __int128 v28 = xmmword_183723F60;
    __int16 v33 = -1;
  }

  return (id)[objc_allocWithZone((Class)NSString) initWithCStringNoCopy:__CFSafelyReallocate() length:v20 freeWhenDone:1];
}

- (BOOL)getExternalRepresentation:(id *)a3 extendedAttributes:(id *)a4 forWritingToURLOrPath:(id)a5 usingEncoding:(unint64_t)a6 error:(id *)a7
{
  v22[1] = *MEMORY[0x1895F89C0];
  if (a4)
  {
    uint64_t v13 = _NSEncodingToNewDataForExtendedAttribute(a6);
    if (!v13)
    {
      if (a7)
      {
        uint64_t v20 = _NSErrorWithFilePathAndEncoding(517LL, (uint64_t)a5, a6);
        BOOL result = 0;
        *a7 = v20;
        return result;
      }

      return 0;
    }

    uint64_t v14 = (void *)v13;
    *a4 = (id)objc_msgSend( objc_alloc(MEMORY[0x189603F68]),  "initWithObjectsAndKeys:",  v13,  @"com.apple.TextEncoding",  0);
  }

  if (!a3) {
    return 1;
  }
  NSUInteger v15 = -[NSString length](self, "length");
  if (-[NSString getBytes:maxLength:filledLength:encoding:allowLossyConversion:range:remainingRange:]( self,  "getBytes:maxLength:filledLength:encoding:allowLossyConversion:range:remainingRange:",  0LL,  0x7FFFFFFFFFFFFFFELL,  v22,  a6,  0LL,  0LL,  v15,  0LL))
  {
    uint64_t v16 = (void *)[MEMORY[0x189603FB8] dataWithLength:v22[0]];
    uint64_t v17 = [v16 mutableBytes];
    if (-[NSString getBytes:maxLength:filledLength:encoding:allowLossyConversion:range:remainingRange:]( self,  "getBytes:maxLength:filledLength:encoding:allowLossyConversion:range:remainingRange:",  v17,  v22[0],  v21,  a6,  0LL,  0LL,  v15,  0LL))
    {
      *a3 = v16;
      return 1;
    }

    if (!a7) {
      return 0;
    }
    unint64_t v19 = _NSErrorWithFilePath(512LL, (uint64_t)a5);
    goto LABEL_15;
  }

  if (a7)
  {
    unint64_t v19 = _NSErrorWithFilePathAndEncoding(517LL, (uint64_t)a5, a6);
LABEL_15:
    *a7 = v19;
  }

  return 0;
}

- (BOOL)writeToURL:(NSURL *)url atomically:(BOOL)useAuxiliaryFile encoding:(NSStringEncoding)enc error:(NSError *)error
{
  return writeStringToURLOrPath(self, url, useAuxiliaryFile, enc, error);
}

- (BOOL)writeToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile encoding:(NSStringEncoding)enc error:(NSError *)error
{
  return writeStringToURLOrPath(self, path, useAuxiliaryFile, enc, error);
}

- (BOOL)writeToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile
{
  return -[NSString writeToURL:atomically:]( self,  "writeToURL:atomically:",  [MEMORY[0x189604030] fileURLWithPath:path],  useAuxiliaryFile);
}

- (BOOL)writeToURL:(NSURL *)url atomically:(BOOL)atomically
{
  BOOL v4 = atomically;
  v9[1] = *(NSError **)MEMORY[0x1895F89C0];
  if (__NSDefaultStringEncodingFullyInited) {
    uint64_t v7 = _NSDefaultStringEncoding;
  }
  else {
    uint64_t v7 = _NSDefaultCStringEncoding();
  }
  if ((writeStringToURLOrPath(self, url, v4, v7, v9) & 1) != 0) {
    return 1;
  }
  if (-[NSError code](v9[0], "code") == 517) {
    return writeStringToURLOrPath(self, url, v4, 10LL, 0LL);
  }
  return 0;
}

- (id)initWithCString:(const char *)bytes length:(NSUInteger)length
{
  if (__NSDefaultStringEncodingFullyInited) {
    uint64_t v7 = _NSDefaultStringEncoding;
  }
  else {
    uint64_t v7 = _NSDefaultCStringEncoding();
  }
  return -[NSString initWithBytes:length:encoding:](self, "initWithBytes:length:encoding:", bytes, length, v7);
}

- (id)initWithCString:(const char *)bytes
{
  if (bytes)
  {
    size_t v5 = strlen(bytes);
    if (__NSDefaultStringEncodingFullyInited) {
      uint64_t v6 = _NSDefaultStringEncoding;
    }
    else {
      uint64_t v6 = _NSDefaultCStringEncoding();
    }
    return -[NSString initWithBytes:length:encoding:](self, "initWithBytes:length:encoding:", bytes, v5, v6);
  }

  else
  {
    unsigned int v8 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: NULL cString", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v8);
    return -[NSString initWithCString:encoding:](v9, v10, v11, v12);
  }

- (NSString)initWithCString:(const char *)nullTerminatedCString encoding:(NSStringEncoding)encoding
{
  if (nullTerminatedCString) {
    return -[NSString initWithBytes:length:encoding:]( self,  "initWithBytes:length:encoding:",  nullTerminatedCString,  strlen(nullTerminatedCString),  encoding);
  }
  size_t v5 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: NULL cString", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
  objc_exception_throw(v5);
  return -[NSString initWithCharacters:length:](v6, v7, v8, v9);
}

- (NSString)initWithCharacters:(const unichar *)characters length:(NSUInteger)length
{
  BOOL v4 = self;
  if (length)
  {
    NSUInteger v5 = length;
    SEL v7 = (malloc_zone_t *)-[NSString zone](self, "zone");
    if (!v7) {
      SEL v7 = malloc_default_zone();
    }
    unsigned int v8 = malloc_zone_malloc(v7, 2 * v5);
    memmove(v8, characters, 2 * v5);
    self = v4;
    NSUInteger v9 = v8;
    unint64_t length = v5;
    uint64_t v10 = 1LL;
  }

  else
  {
    NSUInteger v9 = 0LL;
    uint64_t v10 = 0LL;
  }

  return -[NSString initWithCharactersNoCopy:length:freeWhenDone:]( self,  "initWithCharactersNoCopy:length:freeWhenDone:",  v9,  length,  v10);
}

- (NSString)initWithString:(NSString *)aString
{
  NSUInteger v5 = -[NSString length](aString, "length");
  if (!v5)
  {
    uint64_t v10 = self;
    unsigned int v11 = 0LL;
    NSUInteger v12 = 0LL;
    uint64_t v13 = 0LL;
    return -[NSString initWithCharactersNoCopy:length:freeWhenDone:]( v10,  "initWithCharactersNoCopy:length:freeWhenDone:",  v11,  v12,  v13);
  }

  NSUInteger v6 = v5;
  SEL v7 = (malloc_zone_t *)-[NSString zone](self, "zone");
  if (!v7) {
    SEL v7 = malloc_default_zone();
  }
  unsigned int v8 = malloc_zone_malloc(v7, 2 * v6);
  if (v8)
  {
    NSUInteger v9 = v8;
    -[NSString getCharacters:range:](aString, "getCharacters:range:", v8, 0LL, v6);
    uint64_t v10 = self;
    unsigned int v11 = v9;
    NSUInteger v12 = v6;
    uint64_t v13 = 1LL;
    return -[NSString initWithCharactersNoCopy:length:freeWhenDone:]( v10,  "initWithCharactersNoCopy:length:freeWhenDone:",  v11,  v12,  v13);
  }

  -[NSString dealloc](self, "dealloc");
  return 0LL;
}

- (NSString)initWithData:(NSData *)data encoding:(NSStringEncoding)encoding
{
  return -[NSString initWithBytes:length:encoding:]( self,  "initWithBytes:length:encoding:",  -[NSData bytes](data, "bytes"),  -[NSData length](data, "length"),  encoding);
}

- (id)_initWithBytesOfUnknownEncoding:(char *)a3 length:(unint64_t)a4 copy:(BOOL)a5 usedEncoding:(unint64_t *)a6
{
  if (!a3) {
    return 0LL;
  }
  if (a4 < 2 || (a4 & 1) != 0)
  {
LABEL_7:
    unint64_t v9 = 4LL;
    if (a5) {
      goto LABEL_8;
    }
    goto LABEL_13;
  }

  int v8 = *a3;
  if (v8 == 255)
  {
  }

  else if (v8 != 254 || a3[1] != 255)
  {
    goto LABEL_7;
  }

  unint64_t v9 = 10LL;
  if (a5)
  {
LABEL_8:
    id result = -[NSString initWithBytes:length:encoding:](self, "initWithBytes:length:encoding:", a3);
    if (!result) {
      return result;
    }
    goto LABEL_14;
  }

- (id)_initWithDataOfUnknownEncoding:(id)a3
{
  unint64_t v5 = [a3 length];
  NSUInteger v6 = (unsigned __int8 *)[a3 bytes];
  if (!a3) {
    return 0LL;
  }
  if (v5 < 2) {
    goto LABEL_12;
  }
  if ((v5 & 1) != 0) {
    goto LABEL_7;
  }
  int v7 = *v6;
  if (v7 == 255)
  {
    if (v6[1] != 254) {
      goto LABEL_7;
    }
LABEL_18:
    uint64_t v8 = 10LL;
    return -[NSString initWithData:encoding:](self, "initWithData:encoding:", a3, v8);
  }

  if (v7 == 254 && v6[1] == 255) {
    goto LABEL_18;
  }
LABEL_7:
  if (v5 < 3 || *v6 != 239 || v6[1] != 187 || v6[2] != 191)
  {
LABEL_12:
    if (__NSDefaultStringEncodingFullyInited) {
      uint64_t v8 = _NSDefaultStringEncoding;
    }
    else {
      uint64_t v8 = _NSDefaultCStringEncoding();
    }
    return -[NSString initWithData:encoding:](self, "initWithData:encoding:", a3, v8);
  }

  uint64_t v8 = 4LL;
  return -[NSString initWithData:encoding:](self, "initWithData:encoding:", a3, v8);
}

- (id)initWithContentsOfFile:(NSString *)path
{
  BOOL v4 = (void *)[objc_allocWithZone(MEMORY[0x189603F48]) initWithContentsOfMappedFile:path];
  id v5 = -[NSString _initWithDataOfUnknownEncoding:](self, "_initWithDataOfUnknownEncoding:", v4);

  return v5;
}

- (id)initWithContentsOfURL:(NSURL *)url
{
  BOOL v4 = (void *)[objc_allocWithZone(MEMORY[0x189603F48]) initWithContentsOfURL:url];
  id v5 = -[NSString _initWithDataOfUnknownEncoding:](self, "_initWithDataOfUnknownEncoding:", v4);

  return v5;
}

- (NSString)initWithContentsOfURL:(NSURL *)url encoding:(NSStringEncoding)enc error:(NSError *)error
{
  v15[1] = *(id *)MEMORY[0x1895F89C0];
  if (-[NSURL isFileURL](url, "isFileURL"))
  {
    id v9 = -[NSURL _securePath](url, "_securePath");
    if (v9) {
      return -[NSString initWithContentsOfFile:encoding:error:]( self,  "initWithContentsOfFile:encoding:error:",  v9,  enc,  error);
    }
    if (!error) {
      goto LABEL_18;
    }
    uint64_t v13 = 260LL;
LABEL_16:
    uint64_t v14 = _NSErrorWithFilePath(v13, (uint64_t)url);
    goto LABEL_17;
  }

  unsigned int v11 = (void *)[objc_alloc(MEMORY[0x189601EE8]) initWithURL:url cachePolicy:1 timeoutInterval:60.0];
  v15[0] = 0LL;
  NSUInteger v12 = (void *)[MEMORY[0x189601EC0] sendSynchronousRequest:v11 returningResponse:v15 error:0];

  if (v15[0] && v12)
  {
    objc_opt_self();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(MEMORY[0x189601EA0], "isErrorStatusCode:", objc_msgSend(v15[0], "statusCode")) & 1) != 0)
    {
      goto LABEL_8;
    }
  }

  else if (!v12)
  {
LABEL_8:
    if (!error)
    {
LABEL_18:

      return 0LL;
    }

    uint64_t v13 = 256LL;
    goto LABEL_16;
  }

  id result = -[NSString initWithBytes:length:encoding:]( self,  "initWithBytes:length:encoding:",  [v12 bytes],  objc_msgSend(v12, "length"),  enc);
  if (error && !result)
  {
    uint64_t v14 = _NSErrorWithFilePathAndEncoding(261LL, (uint64_t)url, enc);
LABEL_17:
    *error = v14;
    goto LABEL_18;
  }

  if (!result) {
    goto LABEL_18;
  }
  return result;
}

- (NSString)initWithContentsOfFile:(NSString *)path encoding:(NSStringEncoding)enc error:(NSError *)error
{
  v13[1] = *(void **)MEMORY[0x1895F89C0];
  if (_NSIsNSURL()) {
    return -[NSString initWithContentsOfURL:encoding:error:]( self,  "initWithContentsOfURL:encoding:error:",  path,  enc,  error);
  }
  uint64_t v12 = 0LL;
  v13[0] = 0LL;
  char v11 = 0;
  LOBYTE(v10) = 0;
  if ([MEMORY[0x189603F48] _readBytesFromPath:path maxLength:0x7FFFFFFFFFFFFFFFLL bytes:v13 length:&v12 didMap:&v11 options:0 reportProgress:v10 error:error])
  {
    if (v12 || v13[0])
    {
      id result = -[NSString initWithBytesNoCopy:length:encoding:freeWhenDone:]( self,  "initWithBytesNoCopy:length:encoding:freeWhenDone:",  v13[0]);
      if (result) {
        return result;
      }
      free(v13[0]);
      if (error) {
        *error = _NSErrorWithFilePathAndEncoding(261LL, (uint64_t)path, enc);
      }
    }

    else
    {
      id result = -[NSString init](self, "init");
      if (result) {
        return result;
      }
    }
  }

  return 0LL;
}

- (NSString)initWithContentsOfURL:(NSURL *)url usedEncoding:(NSStringEncoding *)enc error:(NSError *)error
{
  v14[1] = *(id *)MEMORY[0x1895F89C0];
  if (-[NSURL isFileURL](url, "isFileURL"))
  {
    id v9 = -[NSURL _securePath](url, "_securePath");
    if (v9) {
      return -[NSString initWithContentsOfFile:usedEncoding:error:]( self,  "initWithContentsOfFile:usedEncoding:error:",  v9,  enc,  error);
    }
    if (!error) {
      goto LABEL_17;
    }
    uint64_t v13 = 260LL;
    goto LABEL_16;
  }

  char v11 = (void *)[objc_alloc(MEMORY[0x189601EE8]) initWithURL:url cachePolicy:1 timeoutInterval:60.0];
  v14[0] = 0LL;
  uint64_t v12 = (void *)[MEMORY[0x189601EC0] sendSynchronousRequest:v11 returningResponse:v14 error:0];

  if (v14[0] && v12)
  {
    objc_opt_self();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(MEMORY[0x189601EA0], "isErrorStatusCode:", objc_msgSend(v14[0], "statusCode")) & 1) != 0)
    {
      goto LABEL_8;
    }
  }

  else if (!v12)
  {
LABEL_8:
    if (!error)
    {
LABEL_17:

      return 0LL;
    }

    uint64_t v13 = 256LL;
LABEL_16:
    *error = _NSErrorWithFilePath(v13, (uint64_t)url);
    goto LABEL_17;
  }

  id result = -[NSString _initWithBytesOfUnknownEncoding:length:copy:usedEncoding:]( self,  "_initWithBytesOfUnknownEncoding:length:copy:usedEncoding:",  [v12 bytes],  objc_msgSend(v12, "length"),  1,  enc);
  if (error && !result)
  {
    uint64_t v13 = 264LL;
    goto LABEL_16;
  }

  if (!result) {
    goto LABEL_17;
  }
  return result;
}

- (NSString)initWithContentsOfFile:(NSString *)path usedEncoding:(NSStringEncoding *)enc error:(NSError *)error
{
  v18[1] = *MEMORY[0x1895F89C0];
  NSStringEncoding v16 = 0xFFFFFFFFLL;
  LOBYTE(v14) = 0;
  if (([MEMORY[0x189603F48] _readBytesAndEncodingFromPath:path maxLength:0x7FFFFFFFFFFFFFFFLL encoding:&v16 bytes:v18 length:&v17 didMap:&v15 options:0 reportProgress:v14 error:error] & 1) == 0)
  {
LABEL_24:

    return 0LL;
  }

  uint64_t v9 = v17;
  uint64_t v10 = v18[0];
  if (v16 == 0xFFFFFFFF || v18[0] == 0LL || v17 == 0)
  {
    if (v17) {
      goto LABEL_19;
    }
    goto LABEL_11;
  }

  id result = -[NSString initWithBytesNoCopy:length:encoding:freeWhenDone:]( self,  "initWithBytesNoCopy:length:encoding:freeWhenDone:");
  if (enc && result)
  {
    *enc = v16;
    return result;
  }

  if (!result)
  {
    uint64_t v9 = v17;
    uint64_t v10 = v18[0];
    if (v17) {
      goto LABEL_19;
    }
LABEL_11:
    if (!v10)
    {
      id result = -[NSString init](self, "init", 0LL, v9);
      if (enc) {
        *enc = 4LL;
      }
LABEL_20:
      if (!error || result)
      {
        if (result) {
          return result;
        }
      }

      else
      {
        *error = _NSErrorWithFilePath(264LL, (uint64_t)path);
      }

      goto LABEL_24;
    }

- (NSString)initWithData:(id)a3 usedEncoding:(unint64_t *)a4
{
  return (NSString *)-[NSString _initWithBytesOfUnknownEncoding:length:copy:usedEncoding:]( self,  "_initWithBytesOfUnknownEncoding:length:copy:usedEncoding:",  [a3 bytes],  objc_msgSend(a3, "length"),  1,  a4);
}

- (id)_initWithFormat:(id)a3 options:(id)a4
{
  return -[NSString _initWithFormat:locale:options:arguments:]( self,  "_initWithFormat:locale:options:arguments:",  a3,  0LL,  a4,  &v5,  &v5);
}

- (id)_initWithFormat:(id)a3 locale:(id)a4 options:(id)a5
{
  return -[NSString _initWithFormat:locale:options:arguments:]( self,  "_initWithFormat:locale:options:arguments:",  a3,  a4,  a5,  &v6,  &v6);
}

- (id)_initWithFormat:(id)a3 options:(id)a4 arguments:(char *)a5
{
  return -[NSString _initWithFormat:locale:options:arguments:]( self,  "_initWithFormat:locale:options:arguments:",  a3,  0LL,  a4,  a5);
}

- (id)_initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 options:(id)a5 error:(id *)a6
{
  return -[NSString _initWithValidatedFormat:validFormatSpecifiers:locale:options:error:arguments:]( self,  "_initWithValidatedFormat:validFormatSpecifiers:locale:options:error:arguments:",  a3,  a4,  0LL,  a5,  a6,  &v7,  &v7);
}

- (id)_initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 locale:(id)a5 options:(id)a6 error:(id *)a7
{
  return -[NSString _initWithValidatedFormat:validFormatSpecifiers:locale:options:error:arguments:]( self,  "_initWithValidatedFormat:validFormatSpecifiers:locale:options:error:arguments:",  a3,  a4,  a5,  a6,  a7,  &v8,  &v8);
}

- (id)_initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 options:(id)a5 error:(id *)a6 arguments:(char *)a7
{
  return -[NSString _initWithValidatedFormat:validFormatSpecifiers:locale:options:error:arguments:]( self,  "_initWithValidatedFormat:validFormatSpecifiers:locale:options:error:arguments:",  a3,  a4,  0LL,  a5,  a6,  a7);
}

- (NSString)initWithCharactersNoCopy:(unichar *)characters length:(NSUInteger)length freeWhenDone:(BOOL)freeBuffer
{
}

- (NSString)initWithCharactersNoCopy:(unichar *)chars length:(NSUInteger)len deallocator:(void *)deallocator
{
}

- (id)initWithCStringNoCopy:(char *)bytes length:(NSUInteger)length freeWhenDone:(BOOL)freeBuffer
{
}

- (NSString)initWithBytesNoCopy:(void *)bytes length:(NSUInteger)len encoding:(NSStringEncoding)encoding freeWhenDone:(BOOL)freeBuffer
{
}

- (NSString)initWithBytesNoCopy:(void *)bytes length:(NSUInteger)len encoding:(NSStringEncoding)encoding deallocator:(void *)deallocator
{
}

- (NSString)initWithFormat:(NSString *)format locale:(id)locale arguments:(va_list)argList
{
}

- (NSString)initWithValidatedFormat:(NSString *)format validFormatSpecifiers:(NSString *)validFormatSpecifiers error:(NSError *)error
{
  return -[NSString initWithValidatedFormat:validFormatSpecifiers:locale:arguments:error:]( self,  "initWithValidatedFormat:validFormatSpecifiers:locale:arguments:error:",  format,  validFormatSpecifiers,  0LL,  va,  error,  va);
}

- (NSString)initWithValidatedFormat:(NSString *)format validFormatSpecifiers:(NSString *)validFormatSpecifiers locale:(id)locale error:(NSError *)error
{
  return -[NSString initWithValidatedFormat:validFormatSpecifiers:locale:arguments:error:]( self,  "initWithValidatedFormat:validFormatSpecifiers:locale:arguments:error:",  format,  validFormatSpecifiers,  locale,  va,  error,  va);
}

- (NSString)initWithValidatedFormat:(NSString *)format validFormatSpecifiers:(NSString *)validFormatSpecifiers arguments:(va_list)argList error:(NSError *)error
{
  return -[NSString initWithValidatedFormat:validFormatSpecifiers:locale:arguments:error:]( self,  "initWithValidatedFormat:validFormatSpecifiers:locale:arguments:error:",  format,  validFormatSpecifiers,  0LL,  argList,  error);
}

- (NSString)initWithValidatedFormat:(NSString *)format validFormatSpecifiers:(NSString *)validFormatSpecifiers locale:(id)locale arguments:(va_list)argList error:(NSError *)error
{
}

- (id)_initWithFormat:(id)a3 locale:(id)a4 options:(id)a5 arguments:(char *)a6
{
}

- (id)_initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 locale:(id)a5 options:(id)a6 error:(id *)a7 arguments:(char *)a8
{
}

- (BOOL)_allowsDirectEncoding
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    NSUInteger v9 = -[NSString length](self, "length");
    NSUInteger v10 = v9;
    NSUInteger v16 = v9;
    uint64_t v11 = 6 * v9;
    if (6 * v9 < 0x65) {
      uint64_t v8 = v17;
    }
    else {
      uint64_t v8 = malloc(6 * v9);
    }
    if (-[NSString getBytes:maxLength:filledLength:encoding:allowLossyConversion:range:remainingRange:]( self,  "getBytes:maxLength:filledLength:encoding:allowLossyConversion:range:remainingRange:",  v8,  v11,  &v16,  4LL,  0LL,  0LL,  v10,  0LL))
    {
      [a3 encodeBytes:v8 length:v16];
      goto LABEL_14;
    }

- (NSString)initWithCoder:(NSCoder *)aDecoder
{
  v12[1] = *MEMORY[0x1895F89C0];
  if (!-[NSCoder allowsKeyedCoding](aDecoder, "allowsKeyedCoding"))
  {
    NSInteger v7 = -[NSCoder versionForClassName:](aDecoder, "versionForClassName:", @"NSString");
    if (v7 != 1)
    {
      NSUInteger v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSString cannot decode class version %lu",  v7);

      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:v9 userInfo:0]);
      return (NSString *)+[NSString _subclassesMustBeExplicitlyMentionedWhenDecoded](v10, v11);
    }

    uint64_t v8 = -[NSCoder decodeBytesWithReturnedLength:](aDecoder, "decodeBytesWithReturnedLength:", v12);
    return -[NSString initWithBytes:length:encoding:](self, "initWithBytes:length:encoding:", v8, v12[0], 4LL);
  }

  if (!-[NSCoder containsValueForKey:](aDecoder, "containsValueForKey:", @"NS.string"))
  {
    uint64_t v8 = -[NSCoder decodeBytesForKey:returnedLength:]( aDecoder,  "decodeBytesForKey:returnedLength:",  @"NS.bytes",  v12);
    return -[NSString initWithBytes:length:encoding:](self, "initWithBytes:length:encoding:", v8, v12[0], 4LL);
  }

  uint64_t v5 = -[NSCoder _decodePropertyListForKey:](aDecoder, "_decodePropertyListForKey:", @"NS.string");
  if ((_NSIsNSString() & 1) != 0) {
    return -[NSString initWithString:](self, "initWithString:", v5);
  }
  -[NSCoder failWithError:]( aDecoder,  "failWithError:",  +[NSError _readCorruptErrorWithFormat:]( &OBJC_CLASS___NSError,  "_readCorruptErrorWithFormat:",  @"Decoded object is not a string"));

  return 0LL;
}

+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 1;
}

- (id)propertyList
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  id v3 = 0LL;
  return (id)_CFPropertyListCreateFromXMLString();
}

- (NSDictionary)propertyListFromStringsFileFormat
{
  int v2 = -[NSString propertyList](self, "propertyList");
  else {
    return 0LL;
  }
}

- (id)_copyFormatStringWithConfiguration:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    self = (NSString *)-[NSString baseString](self, "baseString");
  }
  return -[__NSLocalizedString initWithString:withFormatConfiguration:]( objc_alloc(&OBJC_CLASS_____NSLocalizedString),  "initWithString:withFormatConfiguration:",  self,  a3);
}

+ (NSStringEncoding)defaultCStringEncoding
{
  if (__NSDefaultStringEncodingFullyInited) {
    return _NSDefaultStringEncoding;
  }
  else {
    return _NSDefaultCStringEncoding();
  }
}

- (void)getCString:(char *)bytes maxLength:(NSUInteger)maxLength range:(NSRange)aRange remainingRange:(NSRangePointer)leftoverRange
{
  NSUInteger length = aRange.length;
  NSUInteger location = aRange.location;
  v17[1] = *MEMORY[0x1895F89C0];
  if (__NSDefaultStringEncodingFullyInited) {
    uint64_t v12 = _NSDefaultStringEncoding;
  }
  else {
    uint64_t v12 = _NSDefaultCStringEncoding();
  }
  if (!-[NSString getBytes:maxLength:filledLength:encoding:allowLossyConversion:range:remainingRange:]( self,  "getBytes:maxLength:filledLength:encoding:allowLossyConversion:range:remainingRange:",  bytes,  maxLength,  v17,  v12,  0LL,  location,  length,  leftoverRange))
  {
    NSUInteger v13 = -[NSString length](self, "length");
    SEL v14 = self;
    if (v13 >= 0x18) {
      SEL v14 = -[NSString stringByAppendingString:]( -[NSString substringWithRange:](self, "substringWithRange:", 0LL, 20LL),  "stringByAppendingString:",  @"...");
    }
    char v15 = (void *)MEMORY[0x189603F70];
    NSUInteger v16 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Conversion to cString failed for string \"%@\"",  v14);
    objc_exception_throw((id)objc_msgSend( v15,  "exceptionWithName:reason:userInfo:",  @"NSCharacterConversionException",  v16,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  self,  @"_NSString",  0)));
  }

  bytes[v17[0]] = 0;
}

- (void)getCString:(char *)bytes maxLength:(NSUInteger)maxLength
{
}

- (void)getCString:(char *)bytes
{
  unint64_t v3 = 0x8000000000000000LL;
  -[NSString getCString:maxLength:range:remainingRange:]( self,  "getCString:maxLength:range:remainingRange:",  bytes,  ~v3,  0LL,  -[NSString length](self, "length"),  0LL);
}

- (const)cString
{
  if (__NSDefaultStringEncodingFullyInited) {
    uint64_t v3 = _NSDefaultStringEncoding;
  }
  else {
    uint64_t v3 = _NSDefaultCStringEncoding();
  }
  return (const char *)bytesInEncoding(self, v3, 1, 1, 0);
}

- (NSUInteger)cStringLength
{
  v5[1] = *MEMORY[0x1895F89C0];
  if (__NSDefaultStringEncodingFullyInited) {
    uint64_t v3 = _NSDefaultStringEncoding;
  }
  else {
    uint64_t v3 = _NSDefaultCStringEncoding();
  }
  if (-[NSString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:]( self,  "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:",  0LL,  0x7FFFFFFFFFFFFFFELL,  v5,  v3,  6LL,  0LL,  -[NSString length](self, "length"),  0LL))
  {
    return v5[0];
  }

  else
  {
    return 0LL;
  }

- (const)lossyCString
{
  if (__NSDefaultStringEncodingFullyInited) {
    uint64_t v3 = _NSDefaultStringEncoding;
  }
  else {
    uint64_t v3 = _NSDefaultCStringEncoding();
  }
  return (const char *)bytesInEncoding(self, v3, 0, 0, 1u);
}

- (NSStringEncoding)smallestEncoding
{
  NSStringEncoding v3 = 1LL;
  if (!-[NSString canBeConvertedToEncoding:](self, "canBeConvertedToEncoding:", 1LL))
  {
    if (__NSDefaultStringEncodingFullyInited) {
      uint64_t v4 = _NSDefaultStringEncoding;
    }
    else {
      uint64_t v4 = _NSDefaultCStringEncoding();
    }
    if (-[NSString canBeConvertedToEncoding:](self, "canBeConvertedToEncoding:", v4)) {
      return _NSDefaultStringEncoding;
    }
    else {
      return 10LL;
    }
  }

  return v3;
}

- (BOOL)canBeConvertedToEncoding:(NSStringEncoding)encoding
{
  if (encoding < 0xB && ((0x491u >> encoding) & 1) != 0) {
    return 1;
  }
  if (CFStringConvertNSStringEncodingToEncoding(encoding) != -1)
  {
LABEL_7:
    -[NSString length](self, "length");
    uint64_t v5 = __CFStringEncodeByteStream();
    return v5 == -[NSString length](self, "length", 0LL);
  }

  if (encoding == 134217984)
  {
    if (_CFExecutableLinkedOnOrAfter()) {
      NSLog( (NSString *)@"Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future.",  134217984LL);
    }
    goto LABEL_7;
  }

  return 0;
}

- (const)cStringUsingEncoding:(NSStringEncoding)encoding
{
  return (const char *)bytesInEncoding(self, encoding, 0, 0, 0);
}

- (NSUInteger)maximumLengthOfBytesUsingEncoding:(NSStringEncoding)enc
{
  CFStringEncoding v5 = CFStringConvertNSStringEncodingToEncoding(enc);
  if (v5 == -1)
  {
    if (enc != 134217984 && enc) {
      return 0LL;
    }
    if (_CFExecutableLinkedOnOrAfter()) {
      NSLog( (NSString *)@"Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future.",  enc);
    }
    CFStringEncoding v5 = 1536;
  }

  NSUInteger result = CFStringGetMaximumSizeForEncoding(-[NSString length](self, "length"), v5);
  if (result == -1LL) {
    return 0LL;
  }
  return result;
}

- (NSUInteger)lengthOfBytesUsingEncoding:(NSStringEncoding)enc
{
  NSUInteger v4 = -[NSString length](self, "length");
  if (CFStringConvertNSStringEncodingToEncoding(enc) == -1)
  {
    if (enc != 134217984 && enc) {
      return 0LL;
    }
    if (_CFExecutableLinkedOnOrAfter()) {
      NSLog( (NSString *)@"Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future.",  enc);
    }
  }

  if (__CFStringEncodeByteStream() == v4) {
    return v6;
  }
  else {
    return 0LL;
  }
}

- (BOOL)getBytes:(char *)a3 maxLength:(unint64_t)a4 filledLength:(unint64_t *)a5 encoding:(unint64_t)a6 allowLossyConversion:(BOOL)a7 range:(_NSRange)a8 remainingRange:(_NSRange *)a9
{
  return -[NSString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:]( self,  "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:",  a3,  a4,  a5,  a6,  a7 | 6LL);
}

+ (const)availableStringEncodings
{
  int v2 = (const NSStringEncoding *)availableStringEncodings_encodings;
  if (!availableStringEncodings_encodings)
  {
    NSStringEncoding v3 = (_DWORD *)MEMORY[0x186E1E0B8](a1, a2);
    if (*v3 == -1)
    {
      uint64_t v5 = 0LL;
    }

    else
    {
      uint64_t v4 = 0LL;
      do
      {
        uint64_t v5 = v4 + 1;
        int v6 = v3[++v4];
      }

      while (v6 != -1);
    }

    uint64_t v7 = MEMORY[0x186E1E0B8]();
    int v2 = (const NSStringEncoding *)malloc(8 * v5 + 8);
    v2[v5] = 0LL;
    BOOL v8 = v5 < 1;
    uint64_t v9 = v5 - 1;
    if (!v8)
    {
      do
      {
        v2[v9] = CFStringConvertEncodingToNSStringEncoding(*(_DWORD *)(v7 + 4 * v9));
        unint64_t v10 = v9-- + 1;
      }

      while (v10 > 1);
    }

    availableStringEncodings_encodings = (uint64_t)v2;
  }

  return v2;
}

+ (NSString)localizedNameOfStringEncoding:(NSStringEncoding)encoding
{
  CFStringEncoding v4 = CFStringConvertNSStringEncodingToEncoding(encoding);
  if (v4 == -1)
  {
    if (encoding != 134217984 && encoding)
    {
      CFStringEncoding v4 = -1;
    }

    else
    {
      if (_CFExecutableLinkedOnOrAfter()) {
        NSLog( (NSString *)@"Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future.",  encoding);
      }
      CFStringEncoding v4 = 1536;
    }
  }

  CFStringRef NameOfEncoding = CFStringGetNameOfEncoding(v4);
  if (NameOfEncoding) {
    return (NSString *)[(id)_NSFoundationBundle() localizedStringForKey:NameOfEncoding value:&stru_189CA6A28 table:@"EncodingNames"];
  }
  else {
    return (NSString *)&stru_189CA6A28;
  }
}

- (BOOL)_web_isCaseInsensitiveEqualToString:(id)a3
{
  return -[NSString compare:options:](self, "compare:options:", a3, 3LL) == NSOrderedSame;
}

- (BOOL)_web_hasCaseInsensitivePrefix:(id)a3
{
  return -[NSString rangeOfString:options:](self, "rangeOfString:options:", a3, 9LL) != 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)_web_countOfString:(id)a3
{
  NSUInteger v5 = -[NSString length](self, "length");
  int64_t v6 = 0LL;
  uint64_t v7 = 0LL;
  NSUInteger v8 = v5;
  do
  {
    uint64_t v9 = -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", a3, 2LL, v7, v8);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    ++v6;
    uint64_t v7 = v9 + v10;
    NSUInteger v8 = v5 - (v9 + v10);
  }

  while (v9 + v10 < v5);
  return v6;
}

- (BOOL)_web_looksLikeIPAddress
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (!-[NSString length](self, "length")) {
    return 0;
  }
  unsigned int v3 = -[NSString characterAtIndex:](self, "characterAtIndex:", 0LL);
  if (v3 != 58 && (v3 > 0xFF || (*(_DWORD *)(MEMORY[0x1895F8770] + 4LL * v3 + 60) & 0x10000) == 0)) {
    return 0;
  }
  if (-[NSString isEqualToString:](self, "isEqualToString:", @".")) {
    return 0;
  }
  if (!-[NSString canBeConvertedToEncoding:](self, "canBeConvertedToEncoding:", 1LL)) {
    return 0;
  }
  CFStringEncoding v4 = -[NSString cStringUsingEncoding:](self, "cStringUsingEncoding:", 1LL);
  BOOL v5 = v4 != 0LL;
  if (v4)
  {
    int64_t v6 = v4;
    if (inet_pton(2, v4, v8) != 1 && inet_pton(30, v6, v8) != 1) {
      return 0;
    }
  }

  return v5;
}

- (BOOL)_web_hasCountryCodeTLD
{
  if (-[NSString _web_looksLikeIPAddress](self, "_web_looksLikeIPAddress")) {
    return 0;
  }
  uint64_t v4 = -[NSString rangeOfString:options:](self, "rangeOfString:options:", @".", 4LL);
  return v4 == -[NSString length](self, "length") - 3;
}

- (BOOL)_web_domainMatches:(id)a3
{
  if (-[NSString _web_isCaseInsensitiveEqualToString:](self, "_web_isCaseInsensitiveEqualToString:"))
  {
    LOBYTE(v5) = 1;
  }

  else
  {
    uint64_t v5 = [a3 length];
    if (v5)
    {
      if ([a3 characterAtIndex:0] == 46
        && !-[NSString _web_looksLikeIPAddress](self, "_web_looksLikeIPAddress"))
      {
        unint64_t v6 = -[NSString length](self, "length");
        if (v6 >= [a3 length])
        {
          uint64_t v7 = self;
          NSUInteger v8 = a3;
        }

        else
        {
          uint64_t v7 = a3;
          NSUInteger v8 = self;
        }

        LOBYTE(v5) = [v7 rangeOfString:v8 options:13] != 0x7FFFFFFFFFFFFFFFLL;
      }

      else
      {
        LOBYTE(v5) = 0;
      }
    }
  }

  return v5;
}

- (id)_web_domainFromHost
{
  if (-[NSString _web_looksLikeIPAddress](self, "_web_looksLikeIPAddress")) {
    return self;
  }
  BOOL v4 = -[NSString _web_hasCountryCodeTLD](self, "_web_hasCountryCodeTLD");
  uint64_t v5 = -[NSString _web_countOfString:](self, "_web_countOfString:", @".");
  if (!v4)
  {
    if (v5 > 1)
    {
      uint64_t v6 = -[NSString rangeOfString:options:](self, "rangeOfString:options:", @".", 4LL);
      return -[NSString substringFromIndex:]( self,  "substringFromIndex:",  -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", @".", 4LL, 0LL, v6));
    }

    return (id)[@"." stringByAppendingString:self];
  }

  if (v5 <= 2) {
    return (id)[@"." stringByAppendingString:self];
  }
  uint64_t v6 = -[NSString rangeOfString:options:range:]( self,  "rangeOfString:options:range:",  @".",  4LL,  0LL,  -[NSString rangeOfString:options:](self, "rangeOfString:options:", @".", 4LL));
  return -[NSString substringFromIndex:]( self,  "substringFromIndex:",  -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", @".", 4LL, 0LL, v6));
}

- (id)_web_stringByTrimmingWhitespace
{
  NSUInteger v3 = -[NSString length](self, "length");
  if (!v3) {
    return self;
  }
  NSUInteger v4 = v3;
  Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespace);
  NSUInteger v6 = v4 + 1;
  do
  {
    NSUInteger v7 = v6 - 1;
    if (v6 == 1)
    {
      uint64_t v9 = 0LL;
      goto LABEL_10;
    }

    int IsCharacterMember = CFCharacterSetIsCharacterMember( Predefined,  -[NSString characterAtIndex:](self, "characterAtIndex:", v6 - 2));
    NSUInteger v6 = v7;
  }

  while (IsCharacterMember);
  uint64_t v9 = 0LL;
  do
  {
    ++v9;
    --v7;
  }

  while (v7);
LABEL_10:
  if (v4 != v7) {
    return -[NSString substringWithRange:](self, "substringWithRange:", v9, v7);
  }
  else {
    return self;
  }
}

- (id)_web_stringByExpandingTildeInPath
{
  NSUInteger v3 = -[NSString stringByExpandingTildeInPath](self, "stringByExpandingTildeInPath");
  if (-[NSString hasSuffix:](self, "hasSuffix:", @"/") && !-[NSString hasSuffix:](v3, "hasSuffix:", @"/")) {
    return -[NSString stringByAppendingString:](v3, "stringByAppendingString:", @"/");
  }
  else {
    return v3;
  }
}

- (id)_web_fixedCarbonPOSIXPath
{
  NSUInteger v3 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  if (!-[NSFileManager fileExistsAtPath:](v3, "fileExistsAtPath:", self))
  {
    id v4 = (id)-[NSArray mutableCopy](-[NSString pathComponents](self, "pathComponents"), "mutableCopy");
    uint64_t v5 = (void *)[v4 objectAtIndex:1];
    if ([v5 isEqualToString:@"Volumes"])
    {
      uint64_t v5 = (void *)[v4 objectAtIndex:2];
      [v4 removeObjectAtIndex:1];
    }

    if (v5)
    {
      if (objc_msgSend( -[NSFileManager _web_startupVolumeName_nowarn](v3, "_web_startupVolumeName_nowarn"),  "isEqualToString:",  v5))
      {
        [v4 removeObjectAtIndex:1];
      }

      else
      {
        if (!-[NSArray containsObject:]( -[NSFileManager contentsOfDirectoryAtPath:error:]( v3,  "contentsOfDirectoryAtPath:error:",  @"/Volumes",  0LL),  "containsObject:",  v5)) {
          return self;
        }
        [v4 insertObject:@"Volumes" atIndex:1];
      }

      NSUInteger v6 = +[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v4);
      if (-[NSFileManager fileExistsAtPath:](v3, "fileExistsAtPath:", v6)) {
        return v6;
      }
    }
  }

  return self;
}

- (_NSRange)_web_rangeOfURLUserPasswordHostPort
{
  uint64_t v3 = -[NSString _web_rangeOfURLResourceSpecifier_nowarn](self, "_web_rangeOfURLResourceSpecifier_nowarn");
  uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v3 == 0x7FFFFFFFFFFFFFFFLL
    || (uint64_t v6 = v3,
        uint64_t v7 = v4,
        -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", @"//", 8LL, v3, v4) == 0x7FFFFFFFFFFFFFFFLL))
  {
    NSUInteger v8 = 0LL;
  }

  else
  {
    uint64_t v5 = v6 + 2;
    NSUInteger v9 = v7 - 2;
    uint64_t v10 = -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", @"/", 0LL, v6 + 2, v9);
    if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
      NSUInteger v8 = v9;
    }
    else {
      NSUInteger v8 = v10 - v5;
    }
  }

  NSUInteger v11 = v5;
  result.NSUInteger length = v8;
  result.NSUInteger location = v11;
  return result;
}

- (_NSRange)_web_rangeOfURLHost
{
  uint64_t v3 = -[NSString _web_rangeOfURLUserPasswordHostPort](self, "_web_rangeOfURLUserPasswordHostPort");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_4;
  }
  uint64_t v5 = v3;
  NSUInteger v6 = v4;
  uint64_t v7 = -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", @"@", 0LL, v3, v4);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v7 == 0x7FFFFFFFFFFFFFFELL)
    {
LABEL_4:
      NSUInteger v8 = 0LL;
      uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_9;
    }

    v6 += v5 + ~v7;
    uint64_t v5 = v7 + 1;
  }

  uint64_t v9 = -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", @":", 0LL, v5, v6);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
    NSUInteger v8 = v6;
  }
  else {
    NSUInteger v8 = v9 - v5;
  }
LABEL_9:
  NSUInteger v10 = v5;
  result.NSUInteger length = v8;
  result.NSUInteger location = v10;
  return result;
}

- (BOOL)_web_looksLikeAbsoluteURL
{
  return objc_msgSend( -[NSString _web_stringByTrimmingWhitespace](self, "_web_stringByTrimmingWhitespace"),  "_web_rangeOfURLScheme_nowarn") != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_web_isFileURL
{
  return -[NSString _web_hasCaseInsensitivePrefix:](self, "_web_hasCaseInsensitivePrefix:", @"file:");
}

- (id)_web_URLFragment
{
  uint64_t v3 = -[NSString rangeOfString:options:](self, "rangeOfString:options:", @"#", 2LL);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0LL;
  }
  else {
    return -[NSString substringFromIndex:](self, "substringFromIndex:", v3);
  }
}

+ (id)_web_stringRepresentationForBytes:(int64_t)a3
{
  if (a3 >= 0) {
    double v4 = (double)a3;
  }
  else {
    double v4 = -(double)a3;
  }
  if (v4 == 0.0)
  {
    uint64_t v5 = "0 bytes";
LABEL_8:
    id result = (id)NSURLLocalizedString(v5);
    goto LABEL_9;
  }

  if (v4 == 1.0)
  {
    uint64_t v5 = "1 byte";
    goto LABEL_8;
  }

  if (v4 >= 100.0)
  {
    double v7 = v4 * 0.0009765625;
    if (v4 >= 1000.0)
    {
      if (v7 >= 9.95)
      {
        if (v7 >= 99.95)
        {
          if (v7 >= 999.5)
          {
            double v7 = v7 * 0.0009765625;
            if (v7 >= 9.95)
            {
              if (v7 >= 99.95)
              {
                if (v7 >= 999.5)
                {
                  double v7 = v7 * 0.0009765625;
                  if (v7 >= 9.95)
                  {
                    if (v7 >= 99.95) {
                      NSUInteger v8 = "%.0f GB";
                    }
                    else {
                      NSUInteger v8 = "%.1f GB (10.0)";
                    }
                  }

                  else
                  {
                    NSUInteger v8 = "%.1f GB (1.0)";
                  }
                }

                else
                {
                  NSUInteger v8 = "%.0f MB";
                }
              }

              else
              {
                NSUInteger v8 = "%.1f MB (10.0)";
              }
            }

            else
            {
              NSUInteger v8 = "%.1f MB (1.0)";
            }
          }

          else
          {
            NSUInteger v8 = "%.0f KB";
          }
        }

        else
        {
          NSUInteger v8 = "%.1f KB (10.0)";
        }
      }

      else
      {
        NSUInteger v8 = "%.1f KB (1.0)";
      }
    }

    else
    {
      NSUInteger v8 = "%.1f KB (0.1)";
    }

    id result = +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  NSURLLocalizedString(v8),  *(void *)&v7);
  }

  else
  {
    id result = +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  NSURLLocalizedString("%.0f bytes"),  *(void *)&v4);
  }

- (id)_web_stringByCollapsingNonPrintingCharacters
{
  uint64_t v3 = +[NSString string](&OBJC_CLASS___NSMutableString, "string");
  if (!_MergedGlobals_121)
  {
    double v4 = objc_alloc_init(&OBJC_CLASS___NSMutableCharacterSet);
    -[NSMutableCharacterSet addCharactersInRange:](v4, "addCharactersInRange:", 0LL, 33LL);
    -[NSMutableCharacterSet addCharactersInRange:](v4, "addCharactersInRange:", 127LL, 1LL);
    _MergedGlobals_121 = -[NSMutableCharacterSet copy](v4, "copy");

    qword_18C496C20 = (uint64_t)(id)[(id)_MergedGlobals_121 invertedSet];
  }

  NSUInteger v5 = -[NSString length](self, "length");
  if (v5)
  {
    NSUInteger v6 = v5;
    unint64_t v7 = 0LL;
    do
    {
      uint64_t v8 = -[NSString rangeOfCharacterFromSet:options:range:]( self,  "rangeOfCharacterFromSet:options:range:",  qword_18C496C20,  0LL,  v7,  v6 - v7);
      if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      unint64_t v9 = v8;
      uint64_t v10 = -[NSString rangeOfCharacterFromSet:options:range:]( self,  "rangeOfCharacterFromSet:options:range:",  _MergedGlobals_121,  0LL,  v8,  v6 - v8);
      if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v11 = v6;
      }
      else {
        unint64_t v11 = v10;
      }
      if (v11 > v9)
      {
        if (v7) {
          -[NSString appendString:](v3, "appendString:", @" ");
        }
        -[NSString appendString:]( v3,  "appendString:",  -[NSString substringWithRange:](self, "substringWithRange:", v9, v11 - v9));
      }

      unint64_t v7 = v11;
    }

    while (v11 != v6);
  }

  return v3;
}

- (id)_web_filenameByFixingIllegalCharacters
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  id v2 = (id)-[NSString mutableCopy](self, "mutableCopy");
  __int16 v4 = 0;
  objc_msgSend( v2,  "replaceOccurrencesOfString:withString:options:range:",  +[NSString stringWithCharacters:length:](NSString, "stringWithCharacters:length:", &v4, 1),  &stru_189CA6A28,  0,  0,  objc_msgSend(v2, "length"));
  objc_msgSend( v2,  "replaceOccurrencesOfString:withString:options:range:",  @"/",  @"-",  0,  0,  objc_msgSend(v2, "length"));
  objc_msgSend( v2,  "replaceOccurrencesOfString:withString:options:range:",  @":",  @"-",  0,  0,  objc_msgSend(v2, "length"));
  if ([v2 hasPrefix:@"."])
  {
    do
      objc_msgSend(v2, "deleteCharactersInRange:", 0, 1);
    while (([v2 hasPrefix:@"."] & 1) != 0);
  }

  return v2;
}

- (unsigned)_web_extractFourCharCode
{
  id v2 = -[NSString dataUsingEncoding:](self, "dataUsingEncoding:", 30LL);
  uint64_t v3 = -[NSData length](v2, "length");
  if (v3)
  {
    -[NSData bytes](v2, "bytes");
    __memcpy_chk();
    LODWORD(v3) = bswap32(0);
  }

  return v3;
}

- (id)_web_splitAtNonDateCommas_nowarn
{
  uint64_t v3 = (void *)[MEMORY[0x189603FA8] arrayWithCapacity:1];
  uint64_t v4 = -[NSString rangeOfString:](self, "rangeOfString:", @", ");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v6 = v4;
    unint64_t v7 = 0LL;
    unint64_t v5 = 0LL;
    while (1)
    {
      uint64_t v8 = -[NSString rangeOfString:options:range:]( self,  "rangeOfString:options:range:",  @"expires=",  1LL,  v7,  v6 - v7);
      unint64_t v7 = v6 + 1;
      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v10 = v8;
        uint64_t v11 = v9;
        uint64_t v12 = v8 - 1;
        unsigned int v13 = -[NSString characterAtIndex:](self, "characterAtIndex:", v8 - 1);
        if (v13 > 0x7F)
        {
          if (__maskrune(v13, 0x4000uLL)) {
            goto LABEL_12;
          }
        }

        else if ((*(_DWORD *)(MEMORY[0x1895F8770] + 4LL * v13 + 60) & 0x4000) != 0)
        {
          goto LABEL_12;
        }

        if (-[NSString characterAtIndex:](self, "characterAtIndex:", v12) == 59
          || -[NSString characterAtIndex:](self, "characterAtIndex:", v12) == 44)
        {
LABEL_12:
          if (v10 + v11 != v6 && v6 < v10 + v11 + 16) {
            goto LABEL_14;
          }
        }
      }

      objc_msgSend(v3, "addObject:", -[NSString substringWithRange:](self, "substringWithRange:", v5, v6 - v5));
      unint64_t v5 = v6 + 1;
LABEL_14:
      unint64_t v6 = -[NSString rangeOfString:options:range:]( self,  "rangeOfString:options:range:",  @", ",  2LL,  v6 + 1,  -[NSString length](self, "length") + ~v6);
      if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_15;
      }
    }
  }

  unint64_t v5 = 0LL;
LABEL_15:
  objc_msgSend( v3,  "addObject:",  -[NSString substringWithRange:](self, "substringWithRange:", v5, -[NSString length](self, "length") - v5));
  return v3;
}

- (id)_web_parseAsKeyValuePair_nowarn
{
  return -[NSString _web_parseAsKeyValuePairHandleQuotes_nowarn:]( self,  "_web_parseAsKeyValuePairHandleQuotes_nowarn:",  0LL);
}

- (id)_web_parseAsKeyValuePairHandleQuotes_nowarn:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = -[NSString rangeOfString:](self, "rangeOfString:", @"=");
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v6 = -[NSString _web_stringByTrimmingWhitespace](self, "_web_stringByTrimmingWhitespace");
    unint64_t v7 = 0LL;
    return +[NSURLKeyValuePair pairWithKey:value:](&OBJC_CLASS___NSURLKeyValuePair, "pairWithKey:value:", v6, v7);
  }

  uint64_t v8 = v5;
  Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespace);
  if (v8)
  {
    uint64_t v10 = v8;
    while (1)
    {
      uint64_t v11 = v10 - 1;
      if (!CFCharacterSetIsCharacterMember( Predefined,  -[NSString characterAtIndex:](self, "characterAtIndex:", v10 - 1))) {
        break;
      }
      --v10;
      if (!v11) {
        goto LABEL_15;
      }
    }

    if (v10)
    {
      uint64_t v12 = 0LL;
      uint64_t v11 = v10;
      while (CFCharacterSetIsCharacterMember(Predefined, -[NSString characterAtIndex:](self, "characterAtIndex:", v12)))
      {
        ++v12;
        if (!--v11) {
          goto LABEL_15;
        }
      }

      uint64_t v10 = v12;
      goto LABEL_15;
    }
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  uint64_t v11 = 0LL;
LABEL_15:
  unint64_t v6 = -[NSString substringWithRange:](self, "substringWithRange:", v10, v11);
  uint64_t v13 = v8 + 1;
  NSUInteger v14 = -[NSString length](self, "length");
  NSUInteger v15 = v14 - (v8 + 1);
  if (v14 == v8 + 1)
  {
LABEL_19:
    NSUInteger v17 = 0LL;
  }

  else
  {
    NSUInteger v16 = v14 - 1;
    while (CFCharacterSetIsCharacterMember(Predefined, -[NSString characterAtIndex:](self, "characterAtIndex:", v16)))
    {
      --v16;
      if (!--v15) {
        goto LABEL_19;
      }
    }

    uint64_t v19 = 0LL;
    NSUInteger v20 = v15 - 2;
    while (1)
    {
      uint64_t v13 = v8 + v19 + 1;
      ++v19;
      --v20;
      if (v15 == v19)
      {
        NSUInteger v17 = 0LL;
        uint64_t v13 = v8 + v19 + 1;
        goto LABEL_20;
      }
    }

    NSUInteger v17 = v15 - v19;
    if (v15 - v19 >= 2 && v3)
    {
      int v21 = -[NSString characterAtIndex:](self, "characterAtIndex:", v8 + v19 + 1);
      if (v21 == 34) {
        uint64_t v13 = v8 + v19 + 2;
      }
      else {
        uint64_t v13 = v8 + v19 + 1;
      }
      if (v21 == 34) {
        NSUInteger v17 = v20;
      }
    }
  }

- (_NSRange)_web_rangeOfURLScheme_nowarn
{
  uint64_t v3 = -[NSString rangeOfString:](self, "rangeOfString:", @":");
  if (v3) {
    BOOL v4 = v3 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    goto LABEL_6;
  }
  NSUInteger v5 = v3;
  if (!_web_rangeOfURLScheme_nowarn_InverseSchemeCharacterSet) {
    _web_rangeOfURLScheme_nowarn_InverseSchemeCharacterSet =  -[NSCharacterSet invertedSet]( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+.-"),  "invertedSet");
  }
  uint64_t v8 = -[NSString rangeOfCharacterFromSet:options:range:](self, "rangeOfCharacterFromSet:options:range:");
  NSUInteger v6 = 0LL;
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_6:
    NSUInteger v5 = 0LL;
    NSUInteger v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v7 = v5;
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (_NSRange)_web_rangeOfURLResourceSpecifier_nowarn
{
  uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (-[NSString _web_rangeOfURLScheme_nowarn](self, "_web_rangeOfURLScheme_nowarn") == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v5 = 0LL;
  }

  else
  {
    uint64_t v4 = v3 + 1;
    NSUInteger v5 = -[NSString length](self, "length") - (v3 + 1);
  }

  NSUInteger v6 = v4;
  result.NSUInteger length = v5;
  result.NSUInteger location = v6;
  return result;
}

- (id)_web_mimeTypeFromContentTypeHeader_nowarn
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v2 = -[NSString componentsSeparatedByString:](self, "componentsSeparatedByString:", @",");
  uint64_t v3 = -[NSArray count](v2, "count");
  if (!v3) {
    return 0LL;
  }
  if (v3 == 1) {
    return (id)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend( -[NSArray objectAtIndex:](v2, "objectAtIndex:", 0),  "componentsSeparatedByString:",  @";"),
  }
                             "objectAtIndex:",
                             0LL),
                       "_web_stringByTrimmingWhitespace"),
                 "lowercaseString");
  id v6 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  uint64_t v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v21,  v20,  16LL);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend( v6,  "addObject:",  objc_msgSend( (id)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend( *(id *)(*((void *)&v21 + 1) + 8 * i),  "componentsSeparatedByString:",  @";"),
                        "objectAtIndex:",
                        0LL),
                  "_web_stringByTrimmingWhitespace"),
            "lowercaseString"));
      }

      uint64_t v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v21,  v20,  16LL);
    }

    while (v8);
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v11 = [v6 countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
LABEL_14:
    uint64_t v14 = 0LL;
    while (1)
    {
      if (*(void *)v17 != v13) {
        objc_enumerationMutation(v6);
      }
      NSUInteger v5 = *(void **)(*((void *)&v16 + 1) + 8 * v14);
      if ((objc_msgSend(v5, "_web_hasCaseInsensitivePrefix:", @"text/") & 1) == 0
        && (objc_msgSend(v5, "_web_hasCaseInsensitivePrefix:", @"application/") & 1) == 0
        && [v5 rangeOfString:@"/"] != 0x7FFFFFFFFFFFFFFFLL)
      {
        break;
      }

      if (v12 == ++v14)
      {
        uint64_t v12 = [v6 countByEnumeratingWithState:&v16 objects:v15 count:16];
        if (v12) {
          goto LABEL_14;
        }
        goto LABEL_24;
      }
    }

    if (v5) {
      goto LABEL_25;
    }
  }

- (id)_web_characterSetFromContentTypeHeader_nowarn
{
  uint64_t v3 = -[NSString rangeOfString:options:](self, "rangeOfString:options:", @"charset=", 1LL);
  if (v4) {
    return (id)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend( -[NSArray objectAtIndex:]( -[NSString componentsSeparatedByString:]( -[NSString substringFromIndex:](self, "substringFromIndex:", v3 + v4),  "componentsSeparatedByString:",  @","),  "objectAtIndex:",  0),  "componentsSeparatedByString:",  @";"),
  }
                             "objectAtIndex:",
                             0LL),
                       "_web_stringByTrimmingWhitespace"),
                 "lowercaseString");
  else {
    return 0LL;
  }
}

- (id)_web_fileNameFromContentDispositionHeader_nowarn
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v2 = -[NSString componentsSeparatedByString:](self, "componentsSeparatedByString:", @";");
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id result = (id)-[NSArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v9,  v8,  16LL);
  if (result)
  {
    id v4 = result;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = (void *)objc_msgSend( *(id *)(*((void *)&v9 + 1) + 8 * (void)v6),  "_web_parseAsKeyValuePairHandleQuotes_nowarn:",  1);
        if (objc_msgSend( (id)objc_msgSend(v7, "key"),  "_web_isCaseInsensitiveEqualToString:",  @"filename")) {
          return (id)[v7 value];
        }
        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id result = (id)-[NSArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v9,  v8,  16LL);
      id v4 = result;
      if (result) {
        continue;
      }
      break;
    }
  }

  return result;
}

- (id)_web_stringByReplacingValidPercentEscapes_nowarn
{
  uint64_t v3 = -[NSString dataUsingEncoding:](self, "dataUsingEncoding:", 4LL);
  id v4 = -[NSData bytes](v3, "bytes");
  uint64_t v5 = malloc(-[NSData length](v3, "length"));
  uint64_t v6 = -[NSData length](v3, "length");
  uint64_t v7 = v5;
  if (v6)
  {
    unint64_t v8 = (unint64_t)&v4[v6];
    uint64_t v7 = v5;
    do
    {
      int v9 = *v4;
      BOOL v10 = v9 != 37 || (unint64_t)(v4 + 3) > v8;
      if (v10
        || (v11 = v4[1], unsigned __int8 v12 = v11 - 48, (v11 - 48) >= 0xAu)
        && (v4[1] - 65 <= 0x25 ? (BOOL v13 = ((1LL << (v11 - 65)) & 0x3F0000003FLL) == 0) : (BOOL v13 = 1), v13)
        || (v14 = v4[2], char v15 = v14 - 48, v16 = (v14 - 48), v16 >= 0xA)
        && (v4[2] - 65 <= 0x25 ? (BOOL v17 = ((1LL << (v14 - 65)) & 0x3F0000003FLL) == 0) : (BOOL v17 = 1), v17))
      {
        ++v4;
      }

      else
      {
        unsigned __int8 v18 = v14 - 65;
        unsigned int v19 = (v11 - 65);
        else {
          unsigned __int8 v20 = v11 - 87;
        }
        unsigned __int8 v21 = v11 - 55;
        if (v19 <= 5) {
          unsigned __int8 v22 = v21;
        }
        else {
          unsigned __int8 v22 = v20;
        }
        if (v12 < 0xAu) {
          unsigned __int8 v22 = v12;
        }
        char v23 = 16 * v22;
        else {
          char v24 = v14 - 87;
        }
        char v25 = v14 - 55;
        if (v18 <= 5u) {
          char v26 = v25;
        }
        else {
          char v26 = v24;
        }
        if (v16 < 0xA) {
          char v26 = v15;
        }
        LOBYTE(v9) = v26 | v23;
        v4 += 3;
      }

      *v7++ = v9;
    }

    while (v4 != (unsigned __int8 *)v8);
  }

  unint64_t v27 =  -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  v5,  v7 - v5,  4LL);
  free(v5);
  if (v27) {
    return v27;
  }
  else {
    return self;
  }
}

- (BOOL)_web_isJavaScriptURL
{
  return -[NSString rangeOfString:options:](self, "rangeOfString:options:", @"javascript:", 9LL) != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)standardizedURLPath
{
  uint64_t v3 = -[NSString pathComponents](self, "pathComponents");
  if (!-[NSArray count](v3, "count") || !-[NSString length](self, "length")) {
    return &stru_189CA6A28;
  }
  if (-[NSArray count](v3, "count") != 1
    || (id v4 = @"/",
        (objc_msgSend(-[NSArray objectAtIndex:](v3, "objectAtIndex:", 0), "isEqualToString:", @"/") & 1) == 0))
  {
    id v5 = -[NSArray objectAtIndex:](v3, "objectAtIndex:", 0LL);
    if (([v5 isEqual:@"/"] & 1) != 0 || objc_msgSend(v5, "isEqual:", @"\\""))
    {
      uint64_t v6 = (void *)[objc_allocWithZone(MEMORY[0x189603FA8]) initWithArray:v3];
      [v6 replaceObjectAtIndex:0 withObject:&stru_189CA6A28];
      uint64_t v7 = 1LL;
    }

    else
    {
      uint64_t v7 = 0LL;
      uint64_t v6 = 0LL;
    }

    if (-[NSString characterAtIndex:](self, "characterAtIndex:", -[NSString length](self, "length") - 1) == 47)
    {
      if (!v6) {
        uint64_t v6 = (void *)[objc_allocWithZone(MEMORY[0x189603FA8]) initWithArray:v3];
      }
      [v6 addObject:&stru_189CA6A28];
    }

    uint64_t v8 = -[NSArray count](v3, "count");
    if (v7 >= v8)
    {
LABEL_22:
      id v4 = (const __CFString *)self;
      if (!v6) {
        return (id)v4;
      }
      if ([v6 count])
      {
        if (objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", 0), "isEqual:", &stru_189CA6A28))
        {
          [v6 removeObjectAtIndex:0];
          if (objc_msgSend((id)objc_msgSend(v6, "lastObject"), "isEqual:", &stru_189CA6A28))
          {
            [v6 removeLastObject];
            BOOL v13 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"/%@/",  [v6 componentsJoinedByString:@"/"]);
          }

          else
          {
            BOOL v13 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"/%@",  [v6 componentsJoinedByString:@"/"]);
          }
        }

        else if (objc_msgSend((id)objc_msgSend(v6, "lastObject"), "isEqual:", &stru_189CA6A28))
        {
          [v6 removeLastObject];
          BOOL v13 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@/",  [v6 componentsJoinedByString:@"/"]);
        }

        else
        {
          BOOL v13 = (NSString *)[v6 componentsJoinedByString:@"/"];
        }

        id v4 = (const __CFString *)v13;
      }

      else
      {
        id v4 = &stru_189CA6A28;
      }
    }

    else
    {
      uint64_t v9 = v8;
      while (1)
      {
        id v10 = -[NSArray objectAtIndex:](v3, "objectAtIndex:", v7);
        uint64_t v11 = [v10 stringByAddingPercentEscapes];
        if (!v11) {
          break;
        }
        uint64_t v12 = v11;
        if ((id)v11 != v10)
        {
          if (!v6) {
            uint64_t v6 = (void *)[objc_allocWithZone(MEMORY[0x189603FA8]) initWithArray:v3];
          }
          [v6 replaceObjectAtIndex:v7 withObject:v12];
        }

        if (v9 == ++v7) {
          goto LABEL_22;
        }
      }

      id v4 = 0LL;
      if (!v6) {
        return (id)v4;
      }
    }
  }

  return (id)v4;
}

- (id)stringByRemovingPercentEscapes
{
  return (id)(id)CFURLCreateStringByReplacingPercentEscapes(0LL, (CFStringRef)self, &stru_189CA6A28);
}

- (id)stringByAddingPercentEscapes
{
  return (id)(id)CFURLCreateStringByAddingPercentEscapes(0LL, (CFStringRef)self, 0LL, 0LL, 0x8000100u);
}

- (NSString)stringByAddingPercentEncodingWithAllowedCharacters:(NSCharacterSet *)allowedCharacters
{
  return (NSString *)(id)_CFStringCreateByAddingPercentEncodingWithAllowedCharacters();
}

- (NSString)stringByRemovingPercentEncoding
{
  return (NSString *)(id)_CFStringCreateByRemovingPercentEncoding();
}

- (NSString)stringByAddingPercentEscapesUsingEncoding:(NSStringEncoding)enc
{
  CFStringEncoding v5 = CFStringConvertNSStringEncodingToEncoding(enc);
  if (v5 == -1)
  {
    if (enc != 134217984 && enc)
    {
      CFStringEncoding v5 = -1;
    }

    else
    {
      if (_CFExecutableLinkedOnOrAfter()) {
        NSLog( (NSString *)@"Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future.",  enc);
      }
      CFStringEncoding v5 = 1536;
    }
  }

  return (NSString *)(id)CFURLCreateStringByAddingPercentEscapes(0LL, (CFStringRef)self, 0LL, 0LL, v5);
}

- (NSString)stringByReplacingPercentEscapesUsingEncoding:(NSStringEncoding)enc
{
  CFStringEncoding v5 = CFStringConvertNSStringEncodingToEncoding(enc);
  if (v5 == -1)
  {
    if (enc != 134217984 && enc)
    {
      CFStringEncoding v5 = -1;
    }

    else
    {
      if (_CFExecutableLinkedOnOrAfter()) {
        NSLog( (NSString *)@"Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future.",  enc);
      }
      CFStringEncoding v5 = 1536;
    }
  }

  return (NSString *)(id)CFURLCreateStringByReplacingPercentEscapesUsingEncoding( 0LL,  (CFStringRef)self,  &stru_189CA6A28,  v5);
}

- (id)_web_HTTPStyleLanguageCode
{
  if (CFBundleGetLocalizationInfoForLocalization())
  {
    uint64_t v3 = (void *)CFBundleCopyLocalizationForLocalizationInfo();
    if (v3) {
      self = v3;
    }
  }

  id v4 = -[NSString lowercaseString](self, "lowercaseString");
  if (-[NSString length](v4, "length") >= 3 && -[NSString characterAtIndex:](v4, "characterAtIndex:", 2LL) == 95)
  {
    CFStringEncoding v5 = (void *)-[NSString mutableCopy](v4, "mutableCopy");
    objc_msgSend(v5, "replaceCharactersInRange:withString:", 2, 1, @"-");
    return v5;
  }

  return v4;
}

- (id)_web_HTTPStyleLanguageCodeWithoutRegion
{
  else {
    return 0LL;
  }
}

- (NSArray)linguisticTagsInRange:(NSRange)range scheme:(NSLinguisticTagScheme)scheme options:(NSLinguisticTaggerOptions)options orthography:(NSOrthography *)orthography tokenRanges:(NSArray *)tokenRanges
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  unsigned __int8 v14 = objc_alloc(&OBJC_CLASS___NSLinguisticTagger);
  char v15 =  -[NSLinguisticTagger initWithTagSchemes:options:]( v14,  "initWithTagSchemes:options:",  [MEMORY[0x189603F18] arrayWithObject:scheme],  options);
  -[NSLinguisticTagger setString:](v15, "setString:", self);
  if (orthography) {
    -[NSLinguisticTagger setOrthography:range:]( v15,  "setOrthography:range:",  orthography,  0LL,  -[NSString length](self, "length"));
  }
  return -[NSLinguisticTagger tagsInRange:scheme:options:tokenRanges:]( v15,  "tagsInRange:scheme:options:tokenRanges:",  location,  length,  scheme,  options,  tokenRanges);
}

- (void)enumerateLinguisticTagsInRange:(NSRange)range scheme:(NSLinguisticTagScheme)scheme options:(NSLinguisticTaggerOptions)options orthography:(NSOrthography *)orthography usingBlock:(void *)block
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  unsigned __int8 v14 = objc_alloc(&OBJC_CLASS___NSLinguisticTagger);
  char v15 = -[NSLinguisticTagger initWithTagSchemes:options:]( v14,  "initWithTagSchemes:options:",  [MEMORY[0x189603F18] arrayWithObject:scheme],  options);
  -[NSLinguisticTagger setString:](v15, "setString:", self);
  if (orthography) {
    -[NSLinguisticTagger setOrthography:range:]( v15,  "setOrthography:range:",  orthography,  0LL,  -[NSString length](self, "length"));
  }
  -[NSLinguisticTagger enumerateTagsInRange:scheme:options:usingBlock:]( v15,  "enumerateTagsInRange:scheme:options:usingBlock:",  location,  length,  scheme,  options,  block);
}

- (_NSRange)_rangeOfRegularExpressionPattern:(id)a3 options:(unint64_t)a4 range:(_NSRange)a5 locale:(id)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  unint64_t v11 = a4 & 1;
  if (_MergedGlobals_144 != -1) {
    dispatch_once(&_MergedGlobals_144, &__block_literal_global_69);
  }
  uint64_t v12 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%lx:%@", v11, a3);
  BOOL v13 = (NSRegularExpression *)(id)[(id)qword_18C497068 objectForKey:v12];
  if (!v13)
  {
    unsigned __int8 v14 = -[NSRegularExpression initWithPattern:options:error:]( objc_alloc(&OBJC_CLASS___NSRegularExpression),  "initWithPattern:options:error:",  a3,  v11,  0LL);
    if (!v14)
    {
      NSUInteger v18 = 0x7FFFFFFFFFFFFFFFLL;
      NSUInteger v19 = 0LL;
      goto LABEL_8;
    }

    BOOL v13 = v14;
    [(id)qword_18C497068 setObject:v14 forKey:v12];
  }

  uint64_t v15 = -[NSRegularExpression rangeOfFirstMatchInString:options:range:]( v13,  "rangeOfFirstMatchInString:options:range:",  self,  (a4 >> 1) & 4,  location,  length);
  NSUInteger v17 = v16;

  NSUInteger v18 = v15;
  NSUInteger v19 = v17;
LABEL_8:
  result.NSUInteger length = v19;
  result.NSUInteger location = v18;
  return result;
}

- (id)_stringByReplacingOccurrencesOfRegularExpressionPattern:(id)a3 withTemplate:(id)a4 options:(unint64_t)a5 range:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  unint64_t v12 = a5 & 1;
  if (_MergedGlobals_144 != -1) {
    dispatch_once(&_MergedGlobals_144, &__block_literal_global_69);
  }
  BOOL v13 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%lx:%@", v12, a3);
  unsigned __int8 v14 = (NSRegularExpression *)(id)[(id)qword_18C497068 objectForKey:v13];
  if (v14) {
    goto LABEL_6;
  }
  uint64_t v15 = -[NSRegularExpression initWithPattern:options:error:]( objc_alloc(&OBJC_CLASS___NSRegularExpression),  "initWithPattern:options:error:",  a3,  v12,  0LL);
  if (v15)
  {
    unsigned __int8 v14 = v15;
    [(id)qword_18C497068 setObject:v15 forKey:v13];
LABEL_6:
    NSUInteger v16 = -[NSRegularExpression stringByReplacingMatchesInString:options:range:withTemplate:]( v14,  "stringByReplacingMatchesInString:options:range:withTemplate:",  self,  (a5 >> 1) & 4,  location,  length,  a4);

    return v16;
  }

  return self;
}

- (void)_flushRegularExpressionCaches
{
}

- (_NSRange)significantText
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  NSUInteger v3 = -[NSString length](self, "length");
  if (v3 <= 0x400)
  {
    -[NSString getCharacters:](self, "getCharacters:", v10);
    NSUInteger v5 = 0LL;
    if (v3)
    {
      while (1)
      {
        int v6 = (unsigned __int16)v10[v5];
        if (v3 == ++v5)
        {
          NSUInteger v5 = v3;
          break;
        }
      }
    }

    else
    {
      int v6 = 0;
    }

    NSUInteger v7 = v3 - 1;
    if (v6 == 95) {
      NSUInteger v8 = v5 + 1;
    }
    else {
      NSUInteger v8 = v5;
    }
    if (v5 < v7) {
      NSUInteger v4 = v8;
    }
    else {
      NSUInteger v4 = 0LL;
    }
    if (v5 < v7) {
      v3 -= v8;
    }
  }

  else
  {
    NSUInteger v4 = 0LL;
  }

  NSUInteger v9 = v3;
  result.NSUInteger length = v9;
  result.NSUInteger location = v4;
  return result;
}

- (void)__graphemeCount
{
  v1 = a1;
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v5 = 0LL;
    int v6 = &v5;
    uint64_t v7 = 0x2020000000LL;
    uint64_t v8 = 0LL;
    uint64_t v2 = [a1 length];
    v4[0] = MEMORY[0x1895F87A8];
    v4[1] = 3221225472LL;
    uint64_t v4[2] = __60__NSString_NSPersonNameComponentsFormatter____graphemeCount__block_invoke;
    v4[3] = &unk_189CA1A30;
    v4[4] = &v5;
    objc_msgSend(v1, "enumerateSubstringsInRange:options:usingBlock:", 0, v2, 2, v4);
    v1 = (void *)v6[3];
    _Block_object_dispose(&v5, 8);
  }

  return v1;
}

uint64_t __60__NSString_NSPersonNameComponentsFormatter____graphemeCount__block_invoke(uint64_t result)
{
  return result;
}

@end
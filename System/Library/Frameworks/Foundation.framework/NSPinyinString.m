@interface NSPinyinString
+ (id)alternativesForInputString:(id)a3;
+ (id)prefixesForInputString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)lastSyllableIsPartial;
- (Class)classForCoder;
- (NSPinyinString)initWithCoder:(id)a3;
- (NSPinyinString)initWithString:(id)a3 syllableCount:(unint64_t)a4 lastSyllableIsPartial:(BOOL)a5 score:(unint64_t)a6 replacementCount:(unint64_t)a7 transpositionCount:(unint64_t)a8 insertionCount:(unint64_t)a9 deletionCount:(unint64_t)a10 indexOfFirstModification:(unint64_t)a11 rangeCount:(unint64_t)a12 ranges:(_NSRange *)a13;
- (NSPinyinString)initWithString:(id)a3 syllableCount:(unint64_t)a4 lastSyllableIsPartial:(BOOL)a5 score:(unint64_t)a6 replacementCount:(unint64_t)a7 transpositionCount:(unint64_t)a8 insertionCount:(unint64_t)a9 deletionCount:(unint64_t)a10 rangeCount:(unint64_t)a11 ranges:(_NSRange *)a12;
- (_NSRange)nonPinyinRangeAtIndex:(unint64_t)a3;
- (id)description;
- (id)nonPinyinIndexSet;
- (id)string;
- (unint64_t)hash;
- (unint64_t)indexOfFirstModification;
- (unint64_t)length;
- (unint64_t)numberOfDeletions;
- (unint64_t)numberOfInsertions;
- (unint64_t)numberOfNonPinyinRanges;
- (unint64_t)numberOfReplacements;
- (unint64_t)numberOfTranspositions;
- (unint64_t)score;
- (unint64_t)syllableCount;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSPinyinString

- (unint64_t)length
{
  return -[NSString length](self->_string, "length");
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return -[NSString characterAtIndex:](self->_string, "characterAtIndex:", a3);
}

- (NSPinyinString)initWithString:(id)a3 syllableCount:(unint64_t)a4 lastSyllableIsPartial:(BOOL)a5 score:(unint64_t)a6 replacementCount:(unint64_t)a7 transpositionCount:(unint64_t)a8 insertionCount:(unint64_t)a9 deletionCount:(unint64_t)a10 indexOfFirstModification:(unint64_t)a11 rangeCount:(unint64_t)a12 ranges:(_NSRange *)a13
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___NSPinyinString;
  v19 = -[NSString init](&v22, sel_init);
  v19->_string = (NSString *)[a3 copy];
  v19->_syllableCount = a4;
  v19->_lastSyllableIsPartial = a5;
  v19->_score = a6;
  v19->_replacementCount = a7;
  v19->_transpositionCount = a8;
  v19->_insertionCount = a9;
  v19->_deletionCount = a10;
  v19->_firstModificationIndex = a11;
  v19->_rangeCount = a12;
  if (a12)
  {
    v20 = (_NSRange *)malloc(16 * a12);
    v19->_ranges = v20;
    memmove(v20, a13, 16 * a12);
  }

  return v19;
}

- (NSPinyinString)initWithString:(id)a3 syllableCount:(unint64_t)a4 lastSyllableIsPartial:(BOOL)a5 score:(unint64_t)a6 replacementCount:(unint64_t)a7 transpositionCount:(unint64_t)a8 insertionCount:(unint64_t)a9 deletionCount:(unint64_t)a10 rangeCount:(unint64_t)a11 ranges:(_NSRange *)a12
{
  return -[NSPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:replacementCount:transpositionCount:insertionCount:deletionCount:indexOfFirstModification:rangeCount:ranges:]( self,  "initWithString:syllableCount:lastSyllableIsPartial:score:replacementCount:transpositionCount:insertionCount:d eletionCount:indexOfFirstModification:rangeCount:ranges:",  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  0LL,  a11,  a12);
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];

  ranges = self->_ranges;
  if (ranges) {
    free(ranges);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSPinyinString;
  -[NSPinyinString dealloc](&v4, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v13) = 1;
  }

  else
  {
    uint64_t v30 = v8;
    uint64_t v31 = v7;
    uint64_t v32 = v6;
    uint64_t v33 = v5;
    uint64_t v34 = v4;
    uint64_t v35 = v3;
    uint64_t v36 = v9;
    uint64_t v37 = v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_25;
    }
    BOOL v13 = -[NSString isEqualToString:](self->_string, "isEqualToString:", [a3 string]);
    if (!v13) {
      return v13;
    }
    unint64_t syllableCount = self->_syllableCount;
    if (syllableCount != [a3 syllableCount]) {
      goto LABEL_25;
    }
    int lastSyllableIsPartial = self->_lastSyllableIsPartial;
    if (lastSyllableIsPartial != [a3 lastSyllableIsPartial]
      || (unint64_t score = self->_score, score != [a3 score])
      || (unint64_t rangeCount = self->_rangeCount, rangeCount != [a3 numberOfNonPinyinRanges])
      || (unint64_t replacementCount = self->_replacementCount, replacementCount != [a3 numberOfReplacements])
      || (unint64_t transpositionCount = self->_transpositionCount,
          transpositionCount != [a3 numberOfTranspositions])
      || (unint64_t insertionCount = self->_insertionCount, insertionCount != [a3 numberOfInsertions])
      || (unint64_t deletionCount = self->_deletionCount, deletionCount != [a3 numberOfDeletions])
      || (unint64_t firstModificationIndex = self->_firstModificationIndex,
          firstModificationIndex != [a3 indexOfFirstModification]))
    {
LABEL_25:
      LOBYTE(v13) = 0;
      return v13;
    }

    if (self->_rangeCount)
    {
      unint64_t v23 = 0LL;
      do
      {
        uint64_t v24 = -[NSPinyinString nonPinyinRangeAtIndex:]( self,  "nonPinyinRangeAtIndex:",  v23,  v30,  v31,  v32,  v33,  v34,  v35,  v36,  v37);
        uint64_t v26 = v25;
        BOOL v28 = v24 == [a3 nonPinyinRangeAtIndex:v23] && v26 == v27;
        LOBYTE(v13) = v28;
        if (!v28) {
          break;
        }
        ++v23;
      }

      while (v23 < self->_rangeCount);
    }

    else
    {
      LOBYTE(v13) = 1;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  return self->_syllableCount ^ self->_score ^ -[NSString hash](self->_string, "hash") ^ self->_rangeCount;
}

- (id)nonPinyinIndexSet
{
  uint64_t v3 = +[NSIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet");
  unint64_t v4 = -[NSPinyinString numberOfNonPinyinRanges](self, "numberOfNonPinyinRanges");
  if (v4)
  {
    unint64_t v5 = v4;
    for (uint64_t i = 0LL; i != v5; ++i)
    {
      uint64_t v7 = -[NSPinyinString nonPinyinRangeAtIndex:](self, "nonPinyinRangeAtIndex:", i);
      -[NSIndexSet addIndexesInRange:](v3, "addIndexesInRange:", v7, v8);
    }
  }

  return v3;
}

- (id)description
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v3 = +[NSString string](&OBJC_CLASS___NSMutableString, "string");
  id v4 = -[NSPinyinString nonPinyinIndexSet](self, "nonPinyinIndexSet");
  unint64_t v5 = -[NSPinyinString length](self, "length");
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  uint64_t v12 = 0LL;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __29__NSPinyinString_description__block_invoke;
  v8[3] = &unk_189CA1BC0;
  v8[5] = self;
  v8[6] = &v9;
  v8[4] = v3;
  [v4 enumerateRangesUsingBlock:v8];
  if (v5 > v10[3]) {
    -[NSString appendString:](v3, "appendString:", -[NSString substringWithRange:](self, "substringWithRange:"));
  }
  uint64_t v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@> syllables %lu last partial %d repls %lu trans %lu inserts %lu deletes %lu fmi %lu score %lu ranges %lu",  v3,  -[NSPinyinString syllableCount](self, "syllableCount"),  -[NSPinyinString lastSyllableIsPartial](self, "lastSyllableIsPartial"),  -[NSPinyinString numberOfReplacements](self, "numberOfReplacements"),  -[NSPinyinString numberOfTranspositions](self, "numberOfTranspositions"),  -[NSPinyinString numberOfInsertions](self, "numberOfInsertions"),  -[NSPinyinString numberOfDeletions](self, "numberOfDeletions"),  -[NSPinyinString indexOfFirstModification](self, "indexOfFirstModification"),  -[NSPinyinString score](self, "score"),  -[NSPinyinString numberOfNonPinyinRanges](self, "numberOfNonPinyinRanges"));
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __29__NSPinyinString_description__block_invoke(uint64_t result, unint64_t a2, uint64_t a3)
{
  uint64_t v5 = result;
  if (a2 > *(void *)(*(void *)(*(void *)(result + 48) + 8LL) + 24LL)) {
    result = objc_msgSend( *(id *)(result + 32),  "appendString:",  objc_msgSend(*(id *)(result + 40), "substringWithRange:"));
  }
  if (a3) {
    result = [*(id *)(v5 + 32) appendFormat:@"[%@]", objc_msgSend(*(id *)(v5 + 40), "substringWithRange:", a2, a3)];
  }
  *(void *)(*(void *)(*(void *)(v5 + 48) + 8LL) + 24LL) = a2 + a3;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    unint64_t v5 = -[NSPinyinString numberOfNonPinyinRanges](self, "numberOfNonPinyinRanges");
    objc_msgSend(a3, "encodeObject:forKey:", -[NSPinyinString string](self, "string"), @"NSString");
    objc_msgSend( a3,  "encodeInt32:forKey:",  -[NSPinyinString syllableCount](self, "syllableCount"),  @"NSSyllableCount");
    objc_msgSend( a3,  "encodeBool:forKey:",  -[NSPinyinString lastSyllableIsPartial](self, "lastSyllableIsPartial"),  @"NSLastSyllableIsPartial");
    [a3 encodeInt32:v5 forKey:@"NSRangeCount"];
    objc_msgSend(a3, "encodeInt32:forKey:", -[NSPinyinString score](self, "score"), @"NSScore");
    objc_msgSend( a3,  "encodeInt32:forKey:",  -[NSPinyinString numberOfReplacements](self, "numberOfReplacements"),  @"NSReplacementCount");
    objc_msgSend( a3,  "encodeInt32:forKey:",  -[NSPinyinString numberOfTranspositions](self, "numberOfTranspositions"),  @"NSTranspositionCount");
    objc_msgSend( a3,  "encodeInt32:forKey:",  -[NSPinyinString numberOfInsertions](self, "numberOfInsertions"),  @"NSInsertionCount");
    objc_msgSend( a3,  "encodeInt32:forKey:",  -[NSPinyinString numberOfDeletions](self, "numberOfDeletions"),  @"NSDeletionCount");
    objc_msgSend( a3,  "encodeInt32:forKey:",  -[NSPinyinString indexOfFirstModification](self, "indexOfFirstModification"),  @"NSModificationIndex");
    if (v5)
    {
      uint64_t v6 = (void *)[MEMORY[0x189603FA8] array];
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        uint64_t v8 = -[NSPinyinString nonPinyinRangeAtIndex:](self, "nonPinyinRangeAtIndex:", i);
        objc_msgSend(v6, "addObject:", +[NSValue valueWithRange:](NSValue, "valueWithRange:", v8, v9));
      }

      [a3 encodeObject:v6 forKey:@"NSRanges"];
    }
  }

  else
  {
    uint64_t v10 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@ requires keyed coding", objc_opt_class()), 0 reason userInfo];
    objc_exception_throw(v10);
    -[NSPinyinString initWithCoder:](v11, v12, v13);
  }

- (NSPinyinString)initWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    uint64_t v4 = [a3 decodeObjectForKey:@"NSString"];
    uint64_t v5 = (int)[a3 decodeInt32ForKey:@"NSSyllableCount"];
    uint64_t v6 = [a3 decodeBoolForKey:@"NSLastSyllableIsPartial"];
    int v7 = [a3 decodeInt32ForKey:@"NSRangeCount"];
    uint64_t v8 = (int)[a3 decodeInt32ForKey:@"NSScore"];
    uint64_t v9 = (int)[a3 decodeInt32ForKey:@"NSReplacementCount"];
    uint64_t v10 = (int)[a3 decodeInt32ForKey:@"NSTranspositionCount"];
    uint64_t v11 = (int)[a3 decodeInt32ForKey:@"NSInsertionCount"];
    uint64_t v12 = (int)[a3 decodeInt32ForKey:@"NSDeletionCount"];
    int v13 = [a3 decodeInt32ForKey:@"NSModificationIndex"];
    if (v7)
    {
      uint64_t v31 = v13;
      uint64_t v32 = v12;
      uint64_t v14 = v4;
      uint64_t v15 = v5;
      uint64_t v16 = v14;
      uint64_t v33 = v8;
      unsigned int v34 = v6;
      unint64_t v17 = v7;
      v18 = (void *)[a3 decodeObjectForKey:@"NSRanges"];
      if ([v18 count] == v17 && (v19 = malloc(16 * v17)) != 0)
      {
        v20 = v19;
        uint64_t v30 = v16;
        uint64_t v21 = 0LL;
        if (v17 <= 1) {
          uint64_t v22 = 1LL;
        }
        else {
          uint64_t v22 = v17;
        }
        unint64_t v23 = v19 + 1;
        do
        {
          *(v23 - 1) = objc_msgSend((id)objc_msgSend(v18, "objectAtIndex:", v21), "rangeValue");
          *unint64_t v23 = v24;
          ++v21;
          v23 += 2;
        }

        while (v22 != v21);
        uint64_t v25 = -[NSPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:replacementCount:transpositionCount:insertionCount:deletionCount:indexOfFirstModification:rangeCount:ranges:]( self,  "initWithString:syllableCount:lastSyllableIsPartial:score:replacementCount:transpositionCount:insertionCo unt:deletionCount:indexOfFirstModification:rangeCount:ranges:",  v30,  v15,  v34,  v33,  v9,  v10,  v11,  v32,  v31,  v17,  v20);
        free(v20);
        return v25;
      }

      else
      {
        return -[NSPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:replacementCount:transpositionCount:insertionCount:deletionCount:indexOfFirstModification:rangeCount:ranges:]( self,  "initWithString:syllableCount:lastSyllableIsPartial:score:replacementCount:transpositionCount:insertionC ount:deletionCount:indexOfFirstModification:rangeCount:ranges:",  v16,  v15,  v34,  v8,  v9,  v10,  v11,  v12,  v31,  0LL,  0LL);
      }
    }

    else
    {
      return -[NSPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:replacementCount:transpositionCount:insertionCount:deletionCount:indexOfFirstModification:rangeCount:ranges:]( self,  "initWithString:syllableCount:lastSyllableIsPartial:score:replacementCount:transpositionCount:insertionCou nt:deletionCount:indexOfFirstModification:rangeCount:ranges:",  v4,  v5,  v6,  v8,  v9,  v10,  v11,  v12,  v13,  0LL,  0LL);
    }
  }

  else
  {
    uint64_t v27 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@ requires keyed coding", objc_opt_class()), 0 reason userInfo];
    objc_exception_throw(v27);
    return (NSPinyinString *)-[NSPinyinString classForCoder](v28, v29);
  }

- (Class)classForCoder
{
  return (Class)objc_opt_self();
}

- (id)string
{
  return self->_string;
}

- (unint64_t)syllableCount
{
  return self->_syllableCount;
}

- (BOOL)lastSyllableIsPartial
{
  return self->_lastSyllableIsPartial;
}

- (unint64_t)score
{
  return self->_score;
}

- (unint64_t)numberOfNonPinyinRanges
{
  return self->_rangeCount;
}

- (unint64_t)numberOfReplacements
{
  return self->_replacementCount;
}

- (unint64_t)numberOfTranspositions
{
  return self->_transpositionCount;
}

- (unint64_t)numberOfInsertions
{
  return self->_insertionCount;
}

- (unint64_t)numberOfDeletions
{
  return self->_deletionCount;
}

- (unint64_t)indexOfFirstModification
{
  return self->_firstModificationIndex;
}

- (_NSRange)nonPinyinRangeAtIndex:(unint64_t)a3
{
  unint64_t rangeCount = self->_rangeCount;
  if (rangeCount <= a3)
  {
    int v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"index %lu count %lu",  a3,  rangeCount);
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v7 userInfo:0]);
    NSUInteger location = (NSUInteger)+[NSPinyinString alternativesForInputString:](v8, v9, v10);
  }

  else
  {
    uint64_t v4 = &self->_ranges[a3];
    NSUInteger location = v4->location;
    NSUInteger length = v4->length;
  }

  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

+ (id)alternativesForInputString:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    return (id)[a1 _alternativesForInputString:a3];
  }
  else {
    return 0LL;
  }
}

+ (id)prefixesForInputString:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    return (id)[a1 _prefixesForInputString:a3];
  }
  else {
    return 0LL;
  }
}

@end
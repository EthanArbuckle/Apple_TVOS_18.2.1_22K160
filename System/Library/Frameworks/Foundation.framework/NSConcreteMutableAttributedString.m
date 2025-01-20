@interface NSConcreteMutableAttributedString
+ (BOOL)supportsSecureCoding;
+ (Class)_mutableStringClass;
- (BOOL)_mayRequireIntentResolution;
- (NSConcreteMutableAttributedString)init;
- (NSConcreteMutableAttributedString)initWithAttributedString:(id)a3;
- (NSConcreteMutableAttributedString)initWithCoder:(id)a3;
- (NSConcreteMutableAttributedString)initWithString:(id)a3;
- (NSConcreteMutableAttributedString)initWithString:(id)a3 attributes:(id)a4;
- (id)_runArrayHoldingAttributes;
- (id)attribute:(id)a3 atIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5;
- (id)attribute:(id)a3 atIndex:(unint64_t)a4 longestEffectiveRange:(_NSRange *)a5 inRange:(_NSRange)a6;
- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)string;
- (unint64_t)length;
- (void)_markIntentsResolved;
- (void)_markRequiringIntentResolution;
- (void)addAttribute:(id)a3 value:(id)a4 range:(_NSRange)a5;
- (void)dealloc;
- (void)replaceCharactersInRange:(_NSRange)a3 withAttributedString:(id)a4;
- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4;
- (void)setAttributes:(id)a3 range:(_NSRange)a4;
@end

@implementation NSConcreteMutableAttributedString

+ (Class)_mutableStringClass
{
  return (Class)__NSMutableStringClass;
}

- (NSConcreteMutableAttributedString)initWithAttributedString:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___NSConcreteMutableAttributedString;
  v4 = -[NSConcreteMutableAttributedString init](&v18, sel_init);
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = -[NSConcreteMutableAttributedString zone](v4, "zone");
    v7 = (void *)[(id)objc_opt_class() _mutableStringClass];
    if (a3)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v8 = (void *)[a3 _runArrayHoldingAttributes];
        if (v8) {
          v5->mutableAttributes = (NSMutableRLEArray *)[v8 mutableCopyWithZone:v6];
        }
      }

      if (!v5->mutableAttributes)
      {
        unint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "string"), "length");
        v5->mutableAttributes = -[NSRLEArray init]( +[NSMutableRLEArray allocWithZone:]( &OBJC_CLASS___NSMutableRLEArray,  "allocWithZone:",  v6),  "init");
        if (v9)
        {
          for (unint64_t i = 0LL; i < v9; i += v17)
          {
            v11 = (void *)objc_msgSend( (id)_NSAttributeDictionaryClass(),  "newWithDictionary:",  objc_msgSend(a3, "attributesAtIndex:effectiveRange:", i, &v16));
            if (v17 + v16 <= v9) {
              unint64_t v12 = v16 - i + v17;
            }
            else {
              unint64_t v12 = v9 - i;
            }
            if (v16 != i || v17 + v16 > v9) {
              unint64_t v17 = v12;
            }
            -[NSMutableRLEArray insertObject:range:](v5->mutableAttributes, "insertObject:range:", v11, i, v12);
          }
        }
      }

      else {
        uint64_t v14 = objc_msgSend((id)objc_msgSend(v7, "allocWithZone:", v6), "initWithString:", objc_msgSend(a3, "string"));
      }
      v5->mutableString = (NSMutableString *)v14;
    }

    else
    {
      v5->mutableAttributes = -[NSRLEArray init]( +[NSMutableRLEArray allocWithZone:]( &OBJC_CLASS___NSMutableRLEArray,  "allocWithZone:",  v6),  "init");
      v5->mutableString = (NSMutableString *)objc_msgSend((id)objc_msgSend(v7, "allocWithZone:", v6), "init");
    }
  }

  return v5;
}

- (NSConcreteMutableAttributedString)initWithString:(id)a3 attributes:(id)a4
{
  if (!a3)
  {
    if (_CFExecutableLinkedOnOrAfter())
    {
      v15 = (objc_class *)objc_opt_class();
      uint64_t v16 = _NSNameOfClass(v15);
      unint64_t v17 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%s %s: nil value", v16, sel_getName(a2)), 0 reason userInfo];
      objc_exception_throw(v17);
      return -[NSConcreteMutableAttributedString initWithString:](v18, v19, v20);
    }

    if ((initWithString_attributes__warned & 1) == 0)
    {
      uint64_t v8 = objc_opt_class();
      unint64_t v9 = NSStringFromSelector(a2);
      NSLog( (NSString *)@"-[%@ %@] called with nil string argument. This has undefined behavior and will raise an exception in post-Leopard linked apps. This warning is displayed only once.",  v8,  v9);
      initWithString_attributes__warned = 1;
    }
  }

  v10 = -[NSConcreteMutableAttributedString initWithAttributedString:](self, "initWithAttributedString:", 0LL);
  v11 = v10;
  if (v10)
  {
    -[NSConcreteMutableAttributedString replaceCharactersInRange:withString:]( v10,  "replaceCharactersInRange:withString:",  0LL,  0LL,  a3);
    unint64_t v12 = (void *)[(id)_NSAttributeDictionaryClass() newWithDictionary:a4];
    uint64_t v13 = -[NSConcreteMutableAttributedString length](v11, "length");
    -[NSMutableRLEArray replaceObjectsInRange:withObject:length:]( v11->mutableAttributes,  "replaceObjectsInRange:withObject:length:",  0LL,  v13,  v12,  v13);
    if (-[NSAttributedString _willRequireIntentResolutionWhenContainingAttributes:]( v11,  "_willRequireIntentResolutionWhenContainingAttributes:",  v12))
    {
      -[NSConcreteMutableAttributedString _markRequiringIntentResolution](v11, "_markRequiringIntentResolution");
    }
  }

  return v11;
}

- (NSConcreteMutableAttributedString)initWithString:(id)a3
{
  if (!a3)
  {
    if (_CFExecutableLinkedOnOrAfter())
    {
      v11 = (objc_class *)objc_opt_class();
      unint64_t v12 = _NSNameOfClass(v11);
      uint64_t v13 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%s %s: nil value", v12, sel_getName(a2)), 0 reason userInfo];
      objc_exception_throw(v13);
      return -[NSConcreteMutableAttributedString init](v14, v15);
    }

    if ((initWithString__warned_120 & 1) == 0)
    {
      uint64_t v6 = objc_opt_class();
      v7 = NSStringFromSelector(a2);
      NSLog( (NSString *)@"-[%@ %@] called with nil string argument. This has undefined behavior and will raise an exception in post-Leopard linked apps. This warning is displayed only once.",  v6,  v7);
      initWithString__warned_120 = 1;
    }
  }

  uint64_t v8 = -[NSConcreteMutableAttributedString initWithAttributedString:](self, "initWithAttributedString:", 0LL);
  unint64_t v9 = v8;
  if (v8) {
    -[NSConcreteMutableAttributedString replaceCharactersInRange:withString:]( v8,  "replaceCharactersInRange:withString:",  0LL,  0LL,  a3);
  }
  return v9;
}

- (NSConcreteMutableAttributedString)init
{
  return -[NSConcreteMutableAttributedString initWithString:](self, "initWithString:", &stru_189CA6A28);
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSConcreteMutableAttributedString;
  -[NSConcreteMutableAttributedString dealloc](&v3, sel_dealloc);
}

- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  return -[NSRLEArray objectAtIndex:effectiveRange:](self->mutableAttributes, "objectAtIndex:effectiveRange:", a3, a4);
}

- (id)attribute:(id)a3 atIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5
{
  return (id)objc_msgSend( -[NSRLEArray objectAtIndex:effectiveRange:]( self->mutableAttributes,  "objectAtIndex:effectiveRange:",  a4,  a5),  "objectForKey:",  a3);
}

- (unint64_t)length
{
  return -[NSString length](self->mutableString, "length");
}

- (id)string
{
  return self->mutableString;
}

- (id)_runArrayHoldingAttributes
{
  return self->mutableAttributes;
}

- (void)replaceCharactersInRange:(_NSRange)a3 withAttributedString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v8 = (void *)[a4 string];
  unint64_t v9 = [v8 length];
  if (v9)
  {
    unint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    do
    {
      v10 = (void *)objc_msgSend( (id)_NSAttributeDictionaryClass(),  "newWithDictionary:",  objc_msgSend(a4, "attributesAtIndex:effectiveRange:", v11, &v11));
      -[NSMutableRLEArray insertObject:range:](self->mutableAttributes, "insertObject:range:", v10, v11 + location, v12);

      v11 += v12;
    }

    while (v11 < v9);
  }

  if (length) {
    -[NSMutableRLEArray deleteObjectsInRange:](self->mutableAttributes, "deleteObjectsInRange:", v9 + location, length);
  }
  -[NSMutableString replaceCharactersInRange:withString:]( self->mutableString,  "replaceCharactersInRange:withString:",  location,  length,  v8);
  -[NSConcreteMutableAttributedString edited:range:changeInLength:]( self,  "edited:range:changeInLength:",  3LL,  location,  length,  v9 - length);
}

- (void)addAttribute:(id)a3 value:(id)a4 range:(_NSRange)a5
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  if (a5.length)
  {
    if (a4)
    {
      NSUInteger length = a5.length;
      NSUInteger location = a5.location;
      NSUInteger v10 = a5.length;
      NSUInteger v11 = a5.location;
      do
      {
        id v12 = -[NSRLEArray objectAtIndex:effectiveRange:]( self->mutableAttributes,  "objectAtIndex:effectiveRange:",  v11,  &v32);
        id v13 = v12;
        NSUInteger v14 = v32;
        if (v33 + v32 >= v11 + v10) {
          NSUInteger v15 = v11 + v10;
        }
        else {
          NSUInteger v15 = v33 + v32;
        }
        NSUInteger v16 = v15 - v11;
        BOOL v17 = v32 > v11 || v11 >= v33 + v32;
        if (v17) {
          NSUInteger v18 = 0LL;
        }
        else {
          NSUInteger v18 = v11;
        }
        if (v17) {
          NSUInteger v16 = 0LL;
        }
        NSUInteger v19 = v15 - v32;
        if (v11 > v32 || v32 >= v11 + v10)
        {
          NSUInteger v14 = v18;
          NSUInteger v21 = v16;
        }

        else
        {
          NSUInteger v21 = v19;
        }

        NSUInteger v32 = v14;
        uint64_t v33 = v21;
        id v22 = (id)[v12 newWithKey:a3 object:a4];
        if (v22 != v13) {
          -[NSMutableRLEArray replaceObjectsInRange:withObject:length:]( self->mutableAttributes,  "replaceObjectsInRange:withObject:length:",  v32,  v33,  v22,  v33);
        }

        v11 += v33;
        v10 -= v33;
      }

      while (v10);
      if (-[NSAttributedString _willRequireIntentResolutionWhenContainingAttribute:value:]( self,  "_willRequireIntentResolutionWhenContainingAttribute:value:",  a3,  a4))
      {
        -[NSConcreteMutableAttributedString _markRequiringIntentResolution](self, "_markRequiringIntentResolution");
      }

      -[NSConcreteMutableAttributedString edited:range:changeInLength:]( self,  "edited:range:changeInLength:",  1LL,  location,  length,  0LL);
    }

    else
    {
      v24 = (objc_class *)objc_opt_class();
      v25 = _NSNameOfClass(v24);
      v26 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%s %s: nil value", v25, sel_getName(a2)), 0 reason userInfo];
      objc_exception_throw(v26);
      -[NSConcreteMutableAttributedString attribute:atIndex:longestEffectiveRange:inRange:]( v27,  v28,  v29,  v30,  v31,  v35);
    }
  }

- (id)attribute:(id)a3 atIndex:(unint64_t)a4 longestEffectiveRange:(_NSRange *)a5 inRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  v35[1] = *MEMORY[0x1895F89C0];
  NSUInteger v11 = (void *)objc_msgSend( -[NSRLEArray objectAtIndex:effectiveRange:runIndex:]( self->mutableAttributes,  "objectAtIndex:effectiveRange:runIndex:",  a4,  v34,  v35),  "objectForKey:",  a3);
  if (a5)
  {
    unint64_t v30 = a5;
    NSUInteger v12 = v34[0];
    NSUInteger v13 = v34[1] + v34[0];
    NSUInteger v31 = location + length;
    NSUInteger v14 = (objc_class *)objc_opt_class();
    IMP MethodImplementation = class_getMethodImplementation(v14, sel_objectAtRunIndex_length_);
    if (v11)
    {
      NSUInteger v16 = (objc_class *)objc_opt_class();
      IMP v32 = class_getMethodImplementation(v16, sel_isEqual_);
    }

    else
    {
      IMP v32 = 0LL;
    }

    uint64_t v17 = v35[0];
    if (v13 < v31)
    {
      NSUInteger v18 = location;
      uint64_t v19 = v35[0] + 1LL;
      do
      {
        id v20 = MethodImplementation(self->mutableAttributes, sel_objectAtRunIndex_length_, v19, &v33);
        if (!v20) {
          break;
        }
        uint64_t v21 = [v20 objectForKey:a3];
        v13 += v33;
        ++v19;
      }

      while (v13 < v31);
      uint64_t v17 = v35[0];
      NSUInteger location = v18;
    }

    NSUInteger v22 = location;
    if (v12 > location)
    {
      uint64_t v23 = v17 - 1;
      do
      {
        uint64_t v24 = objc_msgSend( MethodImplementation(self->mutableAttributes, sel_objectAtRunIndex_length_, v23, &v33),  "objectForKey:",  a3);
        v12 -= v33;
        --v23;
      }

      while (v12 > v22);
    }

    NSUInteger v25 = v31;
    if (v31 >= v13) {
      NSUInteger v25 = v13;
    }
    if (v12 > v22 || v22 >= v13)
    {
      NSUInteger v26 = v25 - v12;
      if (v12 < v31) {
        NSUInteger v27 = v12;
      }
      else {
        NSUInteger v27 = 0LL;
      }
      if (v12 >= v31) {
        NSUInteger v26 = 0LL;
      }
      BOOL v28 = v22 > v12;
      if (v22 <= v12) {
        NSUInteger v22 = v27;
      }
      else {
        NSUInteger v22 = 0LL;
      }
      if (v28) {
        NSUInteger v26 = 0LL;
      }
    }

    else
    {
      NSUInteger v26 = v25 - v22;
    }

    v30->NSUInteger location = v22;
    v30->NSUInteger length = v26;
  }

  return v11;
}

- (void)setAttributes:(id)a3 range:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    v7 = (void *)[(id)_NSAttributeDictionaryClass() newWithDictionary:a3];
    -[NSMutableRLEArray replaceObjectsInRange:withObject:length:]( self->mutableAttributes,  "replaceObjectsInRange:withObject:length:",  location,  length,  v7,  length);
    if (-[NSAttributedString _willRequireIntentResolutionWhenContainingAttributes:]( self,  "_willRequireIntentResolutionWhenContainingAttributes:",  v7))
    {
      -[NSConcreteMutableAttributedString _markRequiringIntentResolution](self, "_markRequiringIntentResolution");
    }

    -[NSConcreteMutableAttributedString edited:range:changeInLength:]( self,  "edited:range:changeInLength:",  1LL,  location,  length,  0LL);
  }

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v8 = [a4 length];
  if (v8)
  {
    if (length)
    {
      id v9 = -[NSRLEArray objectAtIndex:effectiveRange:]( self->mutableAttributes,  "objectAtIndex:effectiveRange:",  location,  0LL);
      id v10 = v9;
      goto LABEL_6;
    }

    if (location)
    {
      mutableAttributes = self->mutableAttributes;
      NSUInteger v12 = location - 1;
    }

    else
    {
      if (!-[NSString length](self->mutableString, "length"))
      {
        id v13 = (id)[(id)_NSAttributeDictionaryClass() emptyAttributeDictionary];
LABEL_14:
        id v9 = v13;
        id v14 = v13;
        -[NSMutableRLEArray insertObject:range:](self->mutableAttributes, "insertObject:range:", v9, location, v8);
        if (!v9) {
          goto LABEL_8;
        }
        goto LABEL_7;
      }

      mutableAttributes = self->mutableAttributes;
      NSUInteger v12 = 0LL;
    }

    id v13 = -[NSRLEArray objectAtIndex:effectiveRange:](mutableAttributes, "objectAtIndex:effectiveRange:", v12, 0LL);
    goto LABEL_14;
  }

  if (!length) {
    goto LABEL_8;
  }
  id v9 = 0LL;
LABEL_6:
  -[NSMutableRLEArray replaceObjectsInRange:withObject:length:]( self->mutableAttributes,  "replaceObjectsInRange:withObject:length:",  location,  length,  v9,  v8);
  if (v9) {
LABEL_7:
  }

LABEL_8:
  -[NSMutableString replaceCharactersInRange:withString:]( self->mutableString,  "replaceCharactersInRange:withString:",  location,  length,  a4);
  -[NSConcreteMutableAttributedString edited:range:changeInLength:]( self,  "edited:range:changeInLength:",  2LL,  location,  length,  v8 - length);
}

- (NSConcreteMutableAttributedString)initWithCoder:(id)a3
{
  uint64_t v4 = -[NSConcreteMutableAttributedString init](self, "init");
  if ((_NSReadMutableAttributedStringWithCoder(a3, v4) & 1) == 0)
  {

    return 0LL;
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_mayRequireIntentResolution
{
  return *((_BYTE *)&self->fields + 1) != 0;
}

- (void)_markRequiringIntentResolution
{
  *((_BYTE *)&self->fields + 1) = 1;
}

- (void)_markIntentsResolved
{
  *(_DWORD *)&self->fields &= 0xFFFF00FF;
}

@end
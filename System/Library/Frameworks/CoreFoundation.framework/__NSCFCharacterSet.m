@interface __NSCFCharacterSet
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (BOOL)characterIsMember:(unsigned __int16)a3;
- (BOOL)hasMemberInPlane:(unsigned __int8)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSupersetOfSet:(id)a3;
- (BOOL)longCharacterIsMember:(unsigned int)a3;
- (Class)classForCoder;
- (__NSCFCharacterSet)initWithCoder:(id)a3;
- (id)bitmapRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)invertedSet;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)addCharactersInRange:(_NSRange)a3;
- (void)addCharactersInString:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)formIntersectionWithCharacterSet:(id)a3;
- (void)formUnionWithCharacterSet:(id)a3;
- (void)removeCharactersInRange:(_NSRange)a3;
- (void)removeCharactersInString:(id)a3;
@end

@implementation __NSCFCharacterSet

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (self == a3) {
    return 1;
  }
  return _CFNonObjCEqual((unint64_t *)self, (unint64_t *)a3) != 0;
}

- (BOOL)_tryRetain
{
  return _CFTryRetain((unint64_t *)self) != 0LL;
}

- (BOOL)_isDeallocating
{
  return _CFIsDeallocating((uint64_t)self) != 0;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0LL;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return CFCharacterSetCreateCopy(0LL, (CFCharacterSetRef)self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return CFCharacterSetCreateMutableCopy(0LL, (CFCharacterSetRef)self);
}

- (BOOL)characterIsMember:(unsigned __int16)a3
{
  return CFCharacterSetIsCharacterMember((CFCharacterSetRef)self, a3) != 0;
}

- (BOOL)longCharacterIsMember:(unsigned int)a3
{
  return CFCharacterSetIsLongCharacterMember((CFCharacterSetRef)self, a3) != 0;
}

- (BOOL)isSupersetOfSet:(id)a3
{
  return CFCharacterSetIsSupersetOfSet((CFCharacterSetRef)self, (CFCharacterSetRef)a3) != 0;
}

- (BOOL)hasMemberInPlane:(unsigned __int8)a3
{
  return CFCharacterSetHasMemberInPlane((CFCharacterSetRef)self, a3) != 0;
}

- (id)bitmapRepresentation
{
  return CFCharacterSetCreateBitmapRepresentation(0LL, (CFCharacterSetRef)self);
}

- (id)invertedSet
{
  return CFCharacterSetCreateInvertedSet(0LL, (CFCharacterSetRef)self);
}

- (void)addCharactersInRange:(_NSRange)a3
{
}

- (void)removeCharactersInRange:(_NSRange)a3
{
}

- (void)addCharactersInString:(id)a3
{
}

- (void)removeCharactersInString:(id)a3
{
}

- (void)formUnionWithCharacterSet:(id)a3
{
}

- (void)formIntersectionWithCharacterSet:(id)a3
{
}

- (Class)classForCoder
{
  else {
    return objc_lookUpClass("NSCharacterSet");
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (__NSCFCharacterSet)initWithCoder:(id)a3
{
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    int IsInverted = _CFCharacterSetIsInverted((uint64_t)self);
    switch(_CFCharacterSetGetKeyedCodingType((uint64_t)self))
    {
      case 2LL:
        [a3 encodeInteger:_CFCharacterSetGetKeyedCodingBuiltinType((uint64_t)self) forKey:@"NSBuiltinID"];
        if (IsInverted) {
          goto LABEL_16;
        }
        break;
      case 3LL:
        uint64_t KeyedCodingRange = _CFCharacterSetGetKeyedCodingRange((uint64_t)self);
        [a3 encodeInt64:v7 | (KeyedCodingRange << 32) forKey:@"NSRange"];
        if (IsInverted) {
          goto LABEL_16;
        }
        break;
      case 4LL:
        CFStringRef KeyedCodingString = _CFCharacterSetCreateKeyedCodingString((uint64_t)self);
        v9 = (objc_class *)objc_opt_class();
        if (v9 == objc_lookUpClass("NSKeyedArchiver")) {
          [a3 _encodePropertyList:KeyedCodingString forKey:@"NSString"];
        }
        else {
          [a3 encodeObject:KeyedCodingString forKey:@"NSStringObject"];
        }
        CFRelease(KeyedCodingString);
        if (IsInverted) {
LABEL_16:
        }
          [a3 encodeBool:1 forKey:@"NSIsInverted"];
        break;
      case 5LL:
        [a3 encodeInteger:_CFCharacterSetGetKeyedCodingBuiltinType((uint64_t)self) forKey:@"NSBuiltinID2"];
        if (IsInverted) {
          [a3 encodeBool:1 forKey:@"NSIsInverted2"];
        }
        goto LABEL_11;
      default:
LABEL_11:
        uint64_t v10 = objc_opt_class();
        Class v11 = objc_lookUpClass("NSKeyedArchiver");
        id v12 = -[__NSCFCharacterSet bitmapRepresentation](self, "bitmapRepresentation");
        if ((Class)v10 == v11) {
          [a3 _encodePropertyList:v12 forKey:@"NSBitmap"];
        }
        else {
          [a3 encodeObject:v12 forKey:@"NSBitmapObject"];
        }
        break;
    }
  }

@end
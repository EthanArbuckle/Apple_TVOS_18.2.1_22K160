@interface _NSPlaceholderCharacterSet
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (BOOL)hasMemberInPlane:(unsigned __int8)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSupersetOfSet:(id)a3;
- (BOOL)longCharacterIsMember:(unsigned int)a3;
- (_NSPlaceholderCharacterSet)autorelease;
- (_NSPlaceholderCharacterSet)initWithSet:(id)a3 options:(unint64_t)a4;
- (_NSPlaceholderCharacterSet)retain;
- (__CFCharacterSet)_expandedCFCharacterSet;
- (id)bitmapRepresentation;
- (id)invertedSet;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)replacementObjectForCoder:(id)a3;
- (id)replacementObjectForKeyedArchiver:(id)a3;
- (unint64_t)retainCount;
- (void)_expandInverted;
- (void)dealloc;
- (void)release;
@end

@implementation _NSPlaceholderCharacterSet

- (_NSPlaceholderCharacterSet)initWithSet:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  uint64_t v12 = *MEMORY[0x1895F89C0];
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS____NSPlaceholderCharacterSet;
  id v6 = -[NSCharacterSet init](&v11, sel_init);
  unsigned int v7 = *((_DWORD *)v6 + 6) & 0xFFFFFFFC | v4 & 3;
  *((_DWORD *)v6 + 6) = v7;
  if ((v4 & 1) != 0)
  {
    int v8 = 0;
  }

  else
  {
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      int v8 = 4;
    }
    else {
      int v8 = 0;
    }
    unsigned int v7 = *((_DWORD *)v6 + 6);
  }

  *((_DWORD *)v6 + 6) = v7 & 0xFFFFFFFB | v8;
  if ((v7 & 1) != 0 && [a3 isMutable])
  {
    v9 = (_NSPlaceholderCharacterSet *)[a3 mutableCopyWithZone:0];
    -[_NSPlaceholderCharacterSet invert](v9, "invert");
    -[NSCharacterSet makeImmutable](v9, "makeImmutable");

    return v9;
  }

  else
  {
    *((void *)v6 + 1) = a3;
  }

  return (_NSPlaceholderCharacterSet *)v6;
}

- (__CFCharacterSet)_expandedCFCharacterSet
{
  if ((*(_BYTE *)&self->_flags & 4) != 0) {
    return (__CFCharacterSet *)self->_original;
  }
  else {
    return 0LL;
  }
}

- (void)_expandInverted
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    p_invertedSet = (unint64_t *)&self->_invertedSet;
    if (!self->_invertedSet)
    {
      id v4 = -[NSCharacterSet mutableCopyWithZone:](self->_original, "mutableCopyWithZone:", 0LL);
      [v4 invert];
      while (!__ldaxr(p_invertedSet))
      {
      }

      __clrex();
    }
  }

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  invertedSet = self->_invertedSet;
  if (invertedSet) {
    return -[NSCharacterSet mutableCopyWithZone:](invertedSet, "mutableCopyWithZone:", 0LL);
  }
  id v6 = -[NSCharacterSet mutableCopyWithZone:](self->_original, "mutableCopyWithZone:", 0LL);
  unsigned int v7 = v6;
  if ((*(_BYTE *)&self->_flags & 1) != 0) {
    [v6 invert];
  }
  return v7;
}

- (BOOL)longCharacterIsMember:(unsigned int)a3
{
  return ((CFCharacterSetIsLongCharacterMember((CFCharacterSetRef)self->_original, a3) != 0) ^ *(_BYTE *)&self->_flags) & 1;
}

- (BOOL)isSupersetOfSet:(id)a3
{
  invertedSet = self->_invertedSet;
  if (invertedSet) {
    return CFCharacterSetIsSupersetOfSet((CFCharacterSetRef)invertedSet, (CFCharacterSetRef)a3) != 0;
  }
  int IsSupersetOfSet = CFCharacterSetIsSupersetOfSet((CFCharacterSetRef)self->_original, (CFCharacterSetRef)a3);
  int v7 = IsSupersetOfSet;
  $37465DDE4F5514DE4D52F8519CE55D34 flags = self->_flags;
  BOOL result = (*(_BYTE *)&flags & 1) == 0 && IsSupersetOfSet != 0;
  if ((*(_BYTE *)&flags & 1) != 0 && !v7)
  {
    -[_NSPlaceholderCharacterSet _expandInverted](self, "_expandInverted");
    invertedSet = self->_invertedSet;
    return CFCharacterSetIsSupersetOfSet((CFCharacterSetRef)invertedSet, (CFCharacterSetRef)a3) != 0;
  }

  return result;
}

- (BOOL)hasMemberInPlane:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  v5 = &OBJC_IVAR____NSPlaceholderCharacterSet__original;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    -[_NSPlaceholderCharacterSet _expandInverted](self, "_expandInverted");
    v5 = &OBJC_IVAR____NSPlaceholderCharacterSet__invertedSet;
  }

  return CFCharacterSetHasMemberInPlane(*(CFCharacterSetRef *)((char *)&self->super.super.isa + *v5), v3) != 0;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  original = self->_original;
  $37465DDE4F5514DE4D52F8519CE55D34 flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if (original == (NSCharacterSet *)[a3 _expandedCFCharacterSet]) {
      return 1;
    }
    $37465DDE4F5514DE4D52F8519CE55D34 flags = self->_flags;
  }

  if ((*(_BYTE *)&flags & 1) != 0)
  {
    -[_NSPlaceholderCharacterSet _expandInverted](self, "_expandInverted");
    original = self->_invertedSet;
  }

  return CFEqual(original, a3) != 0;
}

- (id)bitmapRepresentation
{
  unsigned int v3 = &OBJC_IVAR____NSPlaceholderCharacterSet__original;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    -[_NSPlaceholderCharacterSet _expandInverted](self, "_expandInverted");
    unsigned int v3 = &OBJC_IVAR____NSPlaceholderCharacterSet__invertedSet;
  }

  return objc_autorelease(CFCharacterSetCreateBitmapRepresentation(0LL, *(CFCharacterSetRef *)((char *)&self->super.super.isa
                                                                                             + *v3)));
}

- (BOOL)isEmpty
{
  if ((*(_BYTE *)&self->_flags & 1) == 0 || -[NSCharacterSet isEmpty](self->_original, "isEmpty")) {
    return 0;
  }
  -[_NSPlaceholderCharacterSet _expandInverted](self, "_expandInverted");
  return -[NSCharacterSet isEmpty](self->_invertedSet, "isEmpty");
}

- (id)invertedSet
{
  id result = self->_original;
  if ((*(_BYTE *)&self->_flags & 1) == 0) {
    return (id)[result invertedSet];
  }
  return result;
}

- (_NSPlaceholderCharacterSet)autorelease
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    v2.receiver = self;
    v2.super_class = (Class)&OBJC_CLASS____NSPlaceholderCharacterSet;
    return -[_NSPlaceholderCharacterSet autorelease](&v2, sel_autorelease);
  }

  return self;
}

- (_NSPlaceholderCharacterSet)retain
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    v2.receiver = self;
    v2.super_class = (Class)&OBJC_CLASS____NSPlaceholderCharacterSet;
    return -[_NSPlaceholderCharacterSet retain](&v2, sel_retain);
  }

  return self;
}

- (unint64_t)retainCount
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  if ((*(_BYTE *)&self->_flags & 2) != 0) {
    return -1LL;
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSPlaceholderCharacterSet;
  return -[_NSPlaceholderCharacterSet retainCount](&v3, sel_retainCount);
}

- (void)release
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    v2.receiver = self;
    v2.super_class = (Class)&OBJC_CLASS____NSPlaceholderCharacterSet;
    -[_NSPlaceholderCharacterSet release](&v2, sel_release);
  }

- (BOOL)_isDeallocating
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  if ((*(_BYTE *)&self->_flags & 2) != 0) {
    return 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSPlaceholderCharacterSet;
  return -[_NSPlaceholderCharacterSet _isDeallocating](&v3, sel__isDeallocating);
}

- (BOOL)_tryRetain
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  if ((*(_BYTE *)&self->_flags & 2) != 0) {
    return 1;
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSPlaceholderCharacterSet;
  return -[_NSPlaceholderCharacterSet _tryRetain](&v3, sel__tryRetain);
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {

    v3.receiver = self;
    v3.super_class = (Class)&OBJC_CLASS____NSPlaceholderCharacterSet;
    -[_NSPlaceholderCharacterSet dealloc](&v3, sel_dealloc);
  }

- (id)replacementObjectForKeyedArchiver:(id)a3
{
  uint64_t v4 = &OBJC_IVAR____NSPlaceholderCharacterSet__original;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    -[_NSPlaceholderCharacterSet _expandInverted](self, "_expandInverted", a3);
    uint64_t v4 = &OBJC_IVAR____NSPlaceholderCharacterSet__invertedSet;
  }

  return *(Class *)((char *)&self->super.super.isa + *v4);
}

- (id)replacementObjectForCoder:(id)a3
{
  uint64_t v4 = &OBJC_IVAR____NSPlaceholderCharacterSet__original;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    -[_NSPlaceholderCharacterSet _expandInverted](self, "_expandInverted", a3);
    uint64_t v4 = &OBJC_IVAR____NSPlaceholderCharacterSet__invertedSet;
  }

  return *(Class *)((char *)&self->super.super.isa + *v4);
}

@end
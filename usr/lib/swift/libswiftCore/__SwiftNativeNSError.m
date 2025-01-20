@interface __SwiftNativeNSError
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)isEqual:(id)a3;
- (Class)classForCoder;
- (id)description;
- (id)domain;
- (id)userInfo;
- (int64_t)code;
- (void)dealloc;
@end

@implementation __SwiftNativeNSError

+ (id)allocWithZone:(_NSZone *)a3
{
  qword_18C565C20 = (uint64_t)"__SwiftNativeNSError cannot be instantiated";
  __break(1u);
  return result;
}

- (void)dealloc
{
  Class Class = swift::_swift_getClass((unint64_t)self, a2);
  if (qword_18C486F48 != -1) {
    dispatch_once_f( &qword_18C486F48,  &getSwiftNativeNSErrorClass(void)::$_0::operator() const(void)::TheLazy,  (dispatch_function_t)getSwiftNativeNSErrorClass(void)::$_0::operator() const(void)::{lambda(void *)#1}::__invoke);
  }
  if (Class == (Class)getSwiftNativeNSErrorClass(void)::$_0::operator() const(void)::TheLazy)
  {
    Class isa = self[1].super.super.isa;
    unint64_t ObjCClassMetadata = (unint64_t)isa;
  }

  else
  {
    unint64_t v4 = objc_opt_class();
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata(v4);
    Class isa = self[1].super.super.isa;
  }

  uint64_t isa_low = LOBYTE(isa[-1].isa[10].isa);
  (*(void (**)(unint64_t))(*(void *)(ObjCClassMetadata - 8) + 8LL))(((unint64_t)&self[1].super._userInfo
                                                                                       + isa_low) & ~isa_low);
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS_____SwiftNativeNSError;
  -[__SwiftNativeNSError dealloc](&v8, sel_dealloc);
}

- (id)domain
{
  return self->super._domain;
}

- (id)description
{
  Class isa = (swift *)self[1].super.super.isa;
  uint64_t v4 = *(unsigned __int8 *)(*((void *)isa - 1) + 80LL);
  unint64_t v5 = ((unint64_t)&self[1].super._userInfo + v4) & ~v4;
  BufferIn = swift::TargetMetadata<swift::InProcess>::allocateBufferIn((uint64_t)isa, v9);
  ((void (*)(void *, unint64_t))self[1].super.super.isa[-1].isa[2].isa)(BufferIn, v5);
  id Description = swift::getDescription((uint64_t)BufferIn, isa);
  swift::TargetMetadata<swift::InProcess>::deallocateBufferIn((uint64_t)isa, v9);
  return Description;
}

- (int64_t)code
{
  return self->super._code;
}

- (id)userInfo
{
  return self->super._userInfo;
}

- (Class)classForCoder
{
  if (qword_18C486F38 != -1) {
    dispatch_once_f( &qword_18C486F38,  &swift::getNSErrorClass(void)::$_0::operator() const(void)::TheLazy,  (dispatch_function_t)swift::getNSErrorClass(void)::$_0::operator() const(void)::{lambda(void *)#1}::__invoke);
  }
  return (Class)swift::getNSErrorClass(void)::$_0::operator() const(void)::TheLazy;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  uint64_t v23 = v3;
  uint64_t v24 = v4;
  if (a3)
  {
    Class Class = swift::_swift_getClass((unint64_t)a3, a2);
    if (qword_18C486F48 != -1) {
      dispatch_once_f( &qword_18C486F48,  &getSwiftNativeNSErrorClass(void)::$_0::operator() const(void)::TheLazy,  (dispatch_function_t)getSwiftNativeNSErrorClass(void)::$_0::operator() const(void)::{lambda(void *)#1}::__invoke);
    }
    if (Class == (Class)getSwiftNativeNSErrorClass(void)::$_0::operator() const(void)::TheLazy)
    {
      unint64_t HashableBaseType = swift::SwiftError::getHashableBaseType((swift::SwiftError *)self, v7);
      if (HashableBaseType
        && (uint64_t v13 = HashableBaseType,
            swift::SwiftError::getHashableBaseType((swift::SwiftError *)a3, v12) == HashableBaseType))
      {
        uint64_t HashableConformance = swift::SwiftError::getHashableConformance((swift::SwiftError *)self, v14);
        if (HashableConformance)
        {
          uint64_t v16 = HashableConformance;
          uint64_t isa_low = LOBYTE(self[1].super.super.isa[-1].isa[10].isa);
          unint64_t v18 = ((unint64_t)&self[1].super._userInfo + isa_low) & ~isa_low;
          uint64_t v19 = *(unsigned __int8 *)(*(void *)(*((void *)a3 + 5) - 8LL) + 80LL);
          unsigned __int8 isEqual_indirect = _swift_stdlib_Hashable_isEqual_indirect( v18,  ((unint64_t)a3 + v19 + 72) & ~v19,  v13,  v16);
        }

        else
        {
          unsigned __int8 isEqual_indirect = -[__SwiftNativeNSError isEqual:]( &v20,  sel_isEqual_,  a3,  self,  &OBJC_CLASS_____SwiftNativeNSError,  v21.receiver,  v21.super_class,  v22.receiver,  v22.super_class);
        }
      }

      else
      {
        unsigned __int8 isEqual_indirect = -[__SwiftNativeNSError isEqual:]( &v21,  sel_isEqual_,  a3,  v20.receiver,  v20.super_class,  self,  &OBJC_CLASS_____SwiftNativeNSError,  v22.receiver,  v22.super_class);
      }
    }

    else
    {
      unsigned __int8 isEqual_indirect = -[__SwiftNativeNSError isEqual:]( &v22,  sel_isEqual_,  a3,  v20.receiver,  v20.super_class,  v21.receiver,  v21.super_class,  self,  &OBJC_CLASS_____SwiftNativeNSError);
    }
  }

  else
  {
    unsigned __int8 isEqual_indirect = 0;
  }

  return isEqual_indirect & 1;
}

@end
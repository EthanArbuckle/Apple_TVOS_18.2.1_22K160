@interface Protocol
- (BOOL)conformsTo:(id)a3;
- (BOOL)isEqual:(id)a3;
- (const)name;
- (objc_method_description)descriptionForClassMethod:(SEL)a3;
- (objc_method_description)descriptionForInstanceMethod:(SEL)a3;
- (unint64_t)hash;
@end

@implementation Protocol

- (BOOL)conformsTo:(id)a3
{
  return protocol_conformsToProtocol(self, (Protocol *)a3);
}

- (objc_method_description)descriptionForInstanceMethod:(SEL)a3
{
  Method = (objc_method *)protocol_getMethod((protocol_t *)self, (objc_selector *)a3, (const char *)1, (char *)1, v3);
  return method_getDescription(Method);
}

- (objc_method_description)descriptionForClassMethod:(SEL)a3
{
  Method = (objc_method *)protocol_getMethod((protocol_t *)self, (objc_selector *)a3, (const char *)1, 0LL, v3);
  return method_getDescription(Method);
}

- (const)name
{
  if (self) {
    return (const char *)protocol_t::demangledName((char **)self);
  }
  else {
    return "nil";
  }
}

- (BOOL)isEqual:(id)a3
{
  v5 = look_up_class("Protocol");
  if (!a3) {
    return 0;
  }
  if (((unint64_t)a3 & 0x8000000000000000LL) != 0)
  {
    v6 = (__objc2_class *)objc_debug_taggedpointer_classes[a3 & 7];
  }

  else
  {
    v6 = (__objc2_class *)(*(void *)a3 & 0xFFFFFFFF8LL);
  }

  while (v6 && v6 != (__objc2_class *)v5)
    v6 = v6->superclass;
  return v6 && protocol_isEqual(self, (Protocol *)a3);
}

- (unint64_t)hash
{
  return 23LL;
}

@end
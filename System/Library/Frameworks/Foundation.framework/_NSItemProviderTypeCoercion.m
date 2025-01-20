@interface _NSItemProviderTypeCoercion
+ (id)typeCoercionForValue:(id)a3 targetClass:(Class)a4;
- (BOOL)shouldCoerceForCoding;
- (Class)targetClass;
- (id)_NSItemProviderTypeCoercion_coercedNSDataValueFromNSURLValue:(id)a3 error:(id *)a4;
- (id)_NSItemProviderTypeCoercion_coercedNSFileWrapperValueFromNSDataValue:(id)a3 error:(id *)a4;
- (id)_NSItemProviderTypeCoercion_coercedNSFileWrapperValueFromNSURLValue:(id)a3 error:(id *)a4;
- (id)coerceValueError:(id *)a3;
- (id)value;
- (void)dealloc;
- (void)setTargetClass:(Class)a3;
- (void)setValue:(id)a3;
@end

@implementation _NSItemProviderTypeCoercion

+ (id)typeCoercionForValue:(id)a3 targetClass:(Class)a4
{
  id v7 = objc_alloc_init((Class)a1);
  [v7 setValue:a3];
  [v7 setTargetClass:a4];
  return v7;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSItemProviderTypeCoercion;
  -[_NSItemProviderTypeCoercion dealloc](&v3, sel_dealloc);
}

- (BOOL)shouldCoerceForCoding
{
  uint64_t v3 = objc_opt_class();
  -[_NSItemProviderTypeCoercion value](self, "value");
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    return 0;
  }
  if ((-[objc_class isSubclassOfClass:]( -[_NSItemProviderTypeCoercion targetClass](self, "targetClass"),  "isSubclassOfClass:",  v3) & 1) != 0) {
    return 1;
  }
  v5 = -[_NSItemProviderTypeCoercion targetClass](self, "targetClass");
  return -[objc_class isSubclassOfClass:](v5, "isSubclassOfClass:", MEMORY[0x189603F48]);
}

- (id)coerceValueError:(id *)a3
{
  v9[1] = *MEMORY[0x1895F89C0];
  v9[0] = a3;
  id v8 = -[_NSItemProviderTypeCoercion value](self, "value");
  SEL v4 = _selectorForCoercion((uint64_t)v8, -[_NSItemProviderTypeCoercion targetClass](self, "targetClass"));
  v5 = (void *)objc_msgSend( MEMORY[0x189603F88],  "invocationWithMethodSignature:",  -[_NSItemProviderTypeCoercion methodSignatureForSelector:](self, "methodSignatureForSelector:", v4));
  [v5 setSelector:v4];
  [v5 setArgument:&v8 atIndex:2];
  [v5 setArgument:v9 atIndex:3];
  [v5 invokeWithTarget:self];
  id v7 = 0LL;
  [v5 getReturnValue:&v7];
  return v7;
}

- (id)_NSItemProviderTypeCoercion_coercedNSDataValueFromNSURLValue:(id)a3 error:(id *)a4
{
  return (id)[MEMORY[0x189603F48] dataWithContentsOfURL:a3 options:1 error:a4];
}

- (id)_NSItemProviderTypeCoercion_coercedNSFileWrapperValueFromNSURLValue:(id)a3 error:(id *)a4
{
  return  -[NSFileWrapper initWithURL:options:error:]( objc_alloc(&OBJC_CLASS___NSFileWrapper),  "initWithURL:options:error:",  a3,  0LL,  a4);
}

- (id)_NSItemProviderTypeCoercion_coercedNSFileWrapperValueFromNSDataValue:(id)a3 error:(id *)a4
{
  return  -[NSFileWrapper initRegularFileWithContents:]( objc_alloc(&OBJC_CLASS___NSFileWrapper),  "initRegularFileWithContents:",  a3);
}

- (id)value
{
  return objc_getProperty(self, a2, 8LL, 1);
}

- (void)setValue:(id)a3
{
}

- (Class)targetClass
{
  return (Class)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setTargetClass:(Class)a3
{
}

@end
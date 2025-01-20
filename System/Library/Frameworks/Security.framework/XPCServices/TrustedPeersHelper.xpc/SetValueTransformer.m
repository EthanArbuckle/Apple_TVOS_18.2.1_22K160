@interface SetValueTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (SetValueTransformer)init;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation SetValueTransformer

+ (Class)transformedValueClass
{
  uint64_t v2 = sub_100007620(0LL, &qword_1002511C8, &OBJC_CLASS___NSData_ptr);
  return (Class)swift_getObjCClassFromMetadata(v2);
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

- (id)transformedValue:(id)a3
{
  return sub_1000082EC( self,  (uint64_t)a2,  (uint64_t)a3,  (void (*)(void *__return_ptr, _OWORD *))sub_100007CB4);
}

- (id)reverseTransformedValue:(id)a3
{
  return sub_1000082EC( self,  (uint64_t)a2,  (uint64_t)a3,  (void (*)(void *__return_ptr, _OWORD *))sub_100007FB4);
}

- (SetValueTransformer)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SetValueTransformer();
  return -[SetValueTransformer init](&v3, "init");
}

@end
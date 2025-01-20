@interface CKOperation
+ (id)cplOperationClassDescription;
- (id)cplOperationClassDescription;
- (id)cpl_task;
- (void)cpl_setTask:(id)a3;
@end

@implementation CKOperation

- (id)cpl_task
{
  return objc_getAssociatedObject(self, &off_1002406D8);
}

- (void)cpl_setTask:(id)a3
{
}

+ (id)cplOperationClassDescription
{
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata(a1);
  uint64_t v2 = sub_1000BED3C(&qword_100291E60);
  String.init<A>(describing:)(&ObjCClassMetadata, v2);
  uint64_t v4 = v3;
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return v5;
}

- (id)cplOperationClassDescription
{
  uint64_t ObjectType = swift_getObjectType(self);
  uint64_t v2 = sub_1000BED3C(&qword_100291E60);
  String.init<A>(describing:)(&ObjectType, v2);
  uint64_t v4 = v3;
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return v5;
}

@end
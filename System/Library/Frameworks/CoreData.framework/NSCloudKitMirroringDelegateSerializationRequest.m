@interface NSCloudKitMirroringDelegateSerializationRequest
+ (const)stringForResultType:(uint64_t)a1;
- (NSCloudKitMirroringDelegateSerializationRequest)initWithOptions:(id)a3 completionBlock:(id)a4;
- (NSSet)objectIDsToSerialize;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)resultType;
- (void)dealloc;
- (void)setObjectIDsToSerialize:(id)a3;
- (void)setResultType:(unint64_t)a3;
@end

@implementation NSCloudKitMirroringDelegateSerializationRequest

- (NSCloudKitMirroringDelegateSerializationRequest)initWithOptions:(id)a3 completionBlock:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSCloudKitMirroringDelegateSerializationRequest;
  v4 = -[NSCloudKitMirroringRequest initWithOptions:completionBlock:](&v7, sel_initWithOptions_completionBlock_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_resultType = 0LL;
    v4->_objectIDsToSerialize = (NSSet *)(id)NSSet_EmptySet;
  }

  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSCloudKitMirroringDelegateSerializationRequest;
  -[NSCloudKitMirroringRequest dealloc](&v3, sel_dealloc);
}

- (id)description
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSCloudKitMirroringDelegateSerializationRequest;
  objc_super v3 = (void *)objc_msgSend( MEMORY[0x189607940],  "stringWithString:",  -[NSCloudKitMirroringRequest description](&v5, sel_description));
  [v3 appendFormat:@" resultType: %@", +[NSCloudKitMirroringDelegateSerializationRequest stringForResultType:]( (uint64_t)NSCloudKitMirroringDelegateSerializationRequest, self->_resultType)];
  [v3 appendFormat:@" resultType: %@", +[NSCloudKitMirroringDelegateSerializationRequest stringForResultType:]( (uint64_t)NSCloudKitMirroringDelegateSerializationRequest, self->_resultType)];
  [v3 appendFormat:@"\nobjectIDsToSerialize:\n%@", self->_objectIDsToSerialize];
  return v3;
}

+ (const)stringForResultType:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  if (a2 == 1) {
    return @"Records";
  }
  if (!a2) {
    return @"RecordIDs";
  }
  uint64_t v4 = [NSString stringWithUTF8String:"Unknown result type: %lu"];
  _NSCoreDataLog(17LL, v4, v5, v6, v7, v8, v9, v10, a2);
  v11 = (os_log_s *)__pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v13 = a2;
    _os_log_fault_impl(&dword_186681000, v11, OS_LOG_TYPE_FAULT, "CoreData: Unknown result type: %lu", buf, 0xCu);
  }

  return 0LL;
}

- (void)setObjectIDsToSerialize:(id)a3
{
  objectIDsToSerialize = self->_objectIDsToSerialize;
  if (objectIDsToSerialize != a3)
  {

    if (a3) {
      uint64_t v6 = (NSSet *)a3;
    }
    else {
      uint64_t v6 = (NSSet *)(id)NSSet_EmptySet;
    }
    self->_objectIDsToSerialize = v6;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSCloudKitMirroringDelegateSerializationRequest;
  uint64_t v4 = -[NSCloudKitMirroringRequest copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[10] = self->_resultType;
  v4[11] = self->_objectIDsToSerialize;
  return v4;
}

- (unint64_t)resultType
{
  return self->_resultType;
}

- (void)setResultType:(unint64_t)a3
{
  self->_resultType = a3;
}

- (NSSet)objectIDsToSerialize
{
  return self->_objectIDsToSerialize;
}

@end
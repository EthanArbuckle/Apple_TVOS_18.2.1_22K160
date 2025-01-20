@interface _NSCoreDataOptimisticLockingException
- (_NSCoreDataOptimisticLockingException)initWithName:(id)a3 reason:(id)a4 userInfo:(id)a5;
- (id)errorObjectWithUserInfo:(id)a3;
@end

@implementation _NSCoreDataOptimisticLockingException

- (_NSCoreDataOptimisticLockingException)initWithName:(id)a3 reason:(id)a4 userInfo:(id)a5
{
  if ([a5 count])
  {
    v9 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithDictionary:a5];
    [v9 setObject:MEMORY[0x189604A88] forKey:@"NSExceptionOmitCallstacks"];
    v10 = (void *)[v9 copy];
  }

  else
  {
    id v11 = objc_alloc(MEMORY[0x189603F68]);
    v10 = (void *)objc_msgSend( v11,  "initWithObjectsAndKeys:",  MEMORY[0x189604A88],  @"NSExceptionOmitCallstacks",  0);
  }

  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS____NSCoreDataOptimisticLockingException;
  v12 = -[_NSCoreDataOptimisticLockingException initWithName:reason:userInfo:]( &v14,  sel_initWithName_reason_userInfo_,  a3,  a4,  v10);

  return v12;
}

- (id)errorObjectWithUserInfo:(id)a3
{
  v4 = (void *)-[_NSCoreDataOptimisticLockingException userInfo](self, "userInfo");
  if (a3)
  {
    v5 = (void *)[v4 mutableCopy];
    [v5 addEntriesFromDictionary:a3];
    id v6 = (id)[v5 copy];
  }

  else
  {
    id v6 = v4;
  }

  v7 = (void *)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134050 userInfo:v6];

  return v7;
}

@end
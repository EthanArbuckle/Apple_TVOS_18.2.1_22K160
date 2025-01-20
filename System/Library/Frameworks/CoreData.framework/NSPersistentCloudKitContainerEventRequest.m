@interface NSPersistentCloudKitContainerEventRequest
+ (NSFetchRequest)fetchRequestForEvents;
+ (NSPersistentCloudKitContainerEventRequest)fetchEventsAfterDate:(NSDate *)date;
+ (NSPersistentCloudKitContainerEventRequest)fetchEventsAfterEvent:(NSPersistentCloudKitContainerEvent *)event;
+ (NSPersistentCloudKitContainerEventRequest)fetchEventsMatchingFetchRequest:(NSFetchRequest *)fetchRequest;
+ (const)ckEventKeyForKey:(uint64_t)a1;
+ (id)translateExpression:(uint64_t *)a3 orReturnFailureReason:;
+ (uint64_t)translatePredicate:(uint64_t *)a3 orReturnFailureReason:;
- (NSPersistentCloudKitContainerEventRequest)initWithCKEventFetchRequest:(id)a3;
- (NSPersistentCloudKitContainerEventResultType)resultType;
- (unint64_t)requestType;
- (void)dealloc;
- (void)setResultType:(NSPersistentCloudKitContainerEventResultType)resultType;
@end

@implementation NSPersistentCloudKitContainerEventRequest

+ (NSPersistentCloudKitContainerEventRequest)fetchEventsAfterDate:(NSDate *)date
{
  v5 = -[NSFetchRequest initWithEntityName:]( objc_alloc(&OBJC_CLASS___NSFetchRequest),  "initWithEntityName:",  +[NSCKEvent entityPath](&OBJC_CLASS___NSCKEvent, "entityPath"));
  -[NSFetchRequest setPredicate:]( v5,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"startedAt > %@", date]);
  v6 = (void *)[objc_alloc((Class)a1) initWithCKEventFetchRequest:v5];

  return (NSPersistentCloudKitContainerEventRequest *)v6;
}

+ (NSPersistentCloudKitContainerEventRequest)fetchEventsAfterEvent:(NSPersistentCloudKitContainerEvent *)event
{
  v5 = -[NSFetchRequest initWithEntityName:]( objc_alloc(&OBJC_CLASS___NSFetchRequest),  "initWithEntityName:",  +[NSCKEvent entityPath](&OBJC_CLASS___NSCKEvent, "entityPath"));
  if (event) {
    -[NSFetchRequest setPredicate:]( v5,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"SELF > %@", event->_ckEventObjectID]);
  }
  v6 = (void *)[objc_alloc((Class)a1) initWithCKEventFetchRequest:v5];

  return (NSPersistentCloudKitContainerEventRequest *)v6;
}

+ (NSPersistentCloudKitContainerEventRequest)fetchEventsMatchingFetchRequest:(NSFetchRequest *)fetchRequest
{
  uint64_t v72 = *MEMORY[0x1895F89C0];
  v5 = &off_189EA5000;
  objc_opt_self();
  uint64_t v70 = 0LL;
  v6 = -[NSFetchRequest entityName](fetchRequest, "entityName");
  v7 = (objc_class *)objc_opt_class();
  if (-[NSString isEqualToString:](v6, "isEqualToString:", NSStringFromClass(v7)))
  {
    v8 = -[NSFetchRequest initWithEntityName:]( objc_alloc(&OBJC_CLASS___NSFetchRequest),  "initWithEntityName:",  +[NSCKEvent entityPath](&OBJC_CLASS___NSCKEvent, "entityPath"));
    -[NSFetchRequest setAffectedStores:]( v8,  "setAffectedStores:",  -[NSFetchRequest affectedStores](fetchRequest, "affectedStores"));
    v62 = v8;
    if ((-[NSFetchRequest resultType](fetchRequest, "resultType") | 4) == 4)
    {
      -[NSFetchRequest setResultType:](v8, "setResultType:", -[NSFetchRequest resultType](fetchRequest, "resultType"));
    }

    else
    {
      v9 = (void *)NSString;
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      +[NSFetchRequest _stringForFetchRequestResultType:]( &OBJC_CLASS___NSFetchRequest,  "_stringForFetchRequestResultType:",  0LL);
      +[NSFetchRequest _stringForFetchRequestResultType:]( &OBJC_CLASS___NSFetchRequest,  "_stringForFetchRequestResultType:",  4LL);
      v5 = &off_189EA5000;
      uint64_t v56 = (uint64_t)v11;
      uint64_t v70 = [v9 stringWithFormat:@"'%@' only supports fetch requests with the following result types: %@, %@"];
      if (v70) {
        goto LABEL_32;
      }
    }

    v60 = (objc_class *)a1;
    v12 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  -[NSArray count](-[NSFetchRequest sortDescriptors](fetchRequest, "sortDescriptors"), "count"));
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    __int128 v69 = 0u;
    v61 = fetchRequest;
    obj = -[NSFetchRequest sortDescriptors](fetchRequest, "sortDescriptors");
    uint64_t v13 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v66,  v71,  16LL);
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = 0LL;
      uint64_t v16 = *(void *)v67;
      while (2)
      {
        for (uint64_t i = 0LL; i != v14; ++i)
        {
          if (*(void *)v67 != v16) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v66 + 1) + 8 * i);
          v19 = +[NSPersistentCloudKitContainerEventRequest ckEventKeyForKey:]( (uint64_t)v5[145],  (void *)[v18 key]);
          if (v19)
          {
            objc_msgSend( v12,  "addObject:",  objc_msgSend(MEMORY[0x189607A20], "sortDescriptorWithKey:ascending:", v19, objc_msgSend(v18, "ascending")));
          }

          else
          {
            uint64_t v20 = v14;
            if (objc_msgSend((id)objc_msgSend(v18, "key"), "isEqualToString:", @"storeIdentifier"))
            {
              v63 = (void *)NSString;
              uint64_t v21 = [v18 key];
              v22 = (objc_class *)objc_opt_class();
              v23 = NSStringFromClass(v22);
              v24 = (objc_class *)objc_opt_class();
              v25 = NSStringFromClass(v24);
              v26 = NSStringFromSelector(sel_affectedStores);
              v27 = (objc_class *)objc_opt_class();
              v58 = NSStringFromClass(v27);
              v5 = &off_189EA5000;
              uint64_t v28 = [v63 stringWithFormat:@"Cannot sort events by '%@', it is not a persisted property of '%@'. Use '%@.%@' or '%@.%@' instead.", v21, v23, v25, v26, v58, NSStringFromSelector(sel_affectedStores)];
            }

            else
            {
              int v29 = objc_msgSend((id)objc_msgSend(v18, "key"), "isEqualToString:", @"error");
              v30 = (void *)NSString;
              uint64_t v31 = [v18 key];
              v32 = (objc_class *)objc_opt_class();
              v33 = NSStringFromClass(v32);
              if (!v29)
              {
                uint64_t v56 = v31;
                uint64_t v15 = [v30 stringWithFormat:@"Cannot sort events by '%@', it is not an attribute of '%@'."];
                uint64_t v70 = v15;
                goto LABEL_22;
              }

              v34 = NSStringFromSelector(sel_domain);
            }

            uint64_t v15 = v28;
            uint64_t v70 = v28;
            uint64_t v14 = v20;
          }
        }

        uint64_t v14 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v66,  v71,  16LL);
        if (v14) {
          continue;
        }
        break;
      }
    }

    else
    {
      uint64_t v15 = 0LL;
    }

+ (NSFetchRequest)fetchRequestForEvents
{
  v2 = (objc_class *)objc_opt_class();
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  NSStringFromClass(v2));
}

- (NSPersistentCloudKitContainerEventRequest)initWithCKEventFetchRequest:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSPersistentCloudKitContainerEventRequest;
  v4 = -[NSPersistentCloudKitContainerEventRequest init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_resultType = 0LL;
    v6 = (NSFetchRequest *)a3;
    v5->_ckEventFetchRequest = v6;
    if (-[NSArray count](-[NSFetchRequest affectedStores](v6, "affectedStores"), "count")) {
      -[NSPersistentStoreRequest setAffectedStores:]( v5,  "setAffectedStores:",  -[NSFetchRequest affectedStores](v5->_ckEventFetchRequest, "affectedStores"));
    }
  }

  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSPersistentCloudKitContainerEventRequest;
  -[NSPersistentStoreRequest dealloc](&v3, sel_dealloc);
}

- (unint64_t)requestType
{
  return 11LL;
}

+ (const)ckEventKeyForKey:(uint64_t)a1
{
  if ([a2 isEqualToString:@"identifier"]) {
    return @"eventIdentifier";
  }
  if ([a2 isEqualToString:@"type"]) {
    return @"cloudKitEventType";
  }
  if ([a2 isEqualToString:@"startDate"]) {
    return @"startedAt";
  }
  if ([a2 isEqualToString:@"endDate"]) {
    return @"endedAt";
  }
  if (([a2 isEqualToString:@"succeeded"] & 1) == 0)
  {
    if ([a2 isEqualToString:@"error.domain"])
    {
      return @"errorDomain";
    }

    else if ([a2 isEqualToString:@"error.code"])
    {
      return @"errorCode";
    }

    else
    {
      return 0LL;
    }
  }

  return (const __CFString *)a2;
}

+ (uint64_t)translatePredicate:(uint64_t *)a3 orReturnFailureReason:
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = (id)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  objc_msgSend((id)objc_msgSend(a2, "subpredicates"), "count"));
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    v6 = (void *)[a2 subpredicates];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (!v7)
    {
LABEL_10:
      uint64_t v13 = objc_msgSend( objc_alloc(MEMORY[0x189607820]),  "initWithType:subpredicates:",  objc_msgSend(a2, "compoundPredicateType"),  v5);
      goto LABEL_20;
    }

    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
LABEL_4:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v32 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = +[NSPersistentCloudKitContainerEventRequest translatePredicate:orReturnFailureReason:]( &OBJC_CLASS___NSPersistentCloudKitContainerEventRequest,  *(void *)(*((void *)&v31 + 1) + 8 * v10),  a3);
      if (!v11) {
        goto LABEL_19;
      }
      v12 = (void *)v11;
      [v5 addObject:v11];

      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v37 count:16];
        if (v8) {
          goto LABEL_4;
        }
        goto LABEL_10;
      }
    }
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = (void *)NSString;
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    uint64_t v20 = (objc_class *)objc_opt_class();
    uint64_t v16 = [v17 stringWithFormat:@"'%@' does not support predicates of type '%@'.", v19, NSStringFromClass(v20)];
    goto LABEL_15;
  }

  if ([a2 predicateOperatorType] == 11)
  {
    uint64_t v14 = (void *)NSString;
    uint64_t v15 = (objc_class *)objc_opt_class();
    uint64_t v16 = [v14 stringWithFormat:@"'%@' does not support predicates with custom selectors: %@", NSStringFromClass(v15), a2];
LABEL_15:
    uint64_t v13 = 0LL;
    *a3 = v16;
    return v13;
  }

  id v5 = +[NSPersistentCloudKitContainerEventRequest translateExpression:orReturnFailureReason:]( (uint64_t)NSPersistentCloudKitContainerEventRequest,  (void *)[a2 leftExpression],  a3);
  if (!v5)
  {
LABEL_19:
    uint64_t v13 = 0LL;
    goto LABEL_20;
  }

  id v21 = +[NSPersistentCloudKitContainerEventRequest translateExpression:orReturnFailureReason:]( (uint64_t)NSPersistentCloudKitContainerEventRequest,  (void *)[a2 rightExpression],  a3);
  if (v21) {
    uint64_t v13 = objc_msgSend( objc_alloc(MEMORY[0x189607818]),  "initWithLeftExpression:rightExpression:modifier:type:options:",  v5,  v21,  objc_msgSend(a2, "comparisonPredicateModifier"),  objc_msgSend(a2, "predicateOperatorType"),  objc_msgSend(a2, "options"));
  }
  else {
    uint64_t v13 = 0LL;
  }

LABEL_20:
  if (!((unint64_t)a3 | v13))
  {
    uint64_t v22 = [NSString stringWithUTF8String:"NSPersistentCloudKitContainerEventRequest predicate translation failed but did not return a failure reason: %@"];
    _NSCoreDataLog(17LL, v22, v23, v24, v25, v26, v27, v28, (uint64_t)a2);
    int v29 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = a2;
      _os_log_fault_impl( &dword_186681000,  v29,  OS_LOG_TYPE_FAULT,  "CoreData: NSPersistentCloudKitContainerEventRequest predicate translation failed but did not return a failure reason: %@",  buf,  0xCu);
    }

    return 0LL;
  }

  return v13;
}

+ (id)translateExpression:(uint64_t *)a3 orReturnFailureReason:
{
  if ([a2 expressionType] == 3)
  {
    v4 = (void *)[a2 keyPath];
    id v5 = +[NSPersistentCloudKitContainerEventRequest ckEventKeyForKey:]( (uint64_t)&OBJC_CLASS___NSPersistentCloudKitContainerEventRequest,  v4);
    if (v5)
    {
      v6 = (void *)[MEMORY[0x189607878] expressionForKeyPath:v5];
      return v6;
    }

    if ([v4 isEqualToString:@"storeIdentifier"])
    {
      uint64_t v10 = (void *)NSString;
      uint64_t v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      uint64_t v13 = (objc_class *)objc_opt_class();
      uint64_t v14 = NSStringFromClass(v13);
      uint64_t v15 = NSStringFromSelector(sel_affectedStores);
      uint64_t v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      uint64_t v18 = [v10 stringWithFormat:@"Cannot query events by '%@', it is not a persisted property of '%@'. Use '%@.%@' or '%@.%@' instead.", v4, v12, v14, v15, v17, NSStringFromSelector(sel_affectedStores)];
    }

    else
    {
      int v19 = [v4 isEqualToString:@"error"];
      uint64_t v20 = (void *)NSString;
      id v21 = (objc_class *)objc_opt_class();
      uint64_t v22 = NSStringFromClass(v21);
      uint64_t v23 = v22;
      if (v19)
      {
        uint64_t v24 = NSStringFromSelector(sel_domain);
      }

      else
      {
        uint64_t v18 = [v20 stringWithFormat:@"Cannot query events by '%@', it is not an attribute of '%@'.", v4, v22, v25, v26, v27, v28];
      }
    }

    uint64_t v8 = 0LL;
    *a3 = v18;
  }

  else
  {
    if ([a2 expressionType] != 13)
    {
      v6 = a2;
      return v6;
    }

    uint64_t v7 = (void *)+[NSPersistentCloudKitContainerEventRequest translatePredicate:orReturnFailureReason:]( NSPersistentCloudKitContainerEventRequest,  [a2 predicate],  a3);
    if (v7) {
      uint64_t v8 = objc_msgSend( objc_alloc(MEMORY[0x189607A30]),  "initWithExpression:usingIteratorExpression:predicate:",  objc_msgSend(a2, "collection"),  objc_msgSend(a2, "variableExpression"),  v7);
    }
    else {
      uint64_t v8 = 0LL;
    }
  }

  return (id)v8;
}

- (NSPersistentCloudKitContainerEventResultType)resultType
{
  return self->_resultType;
}

- (void)setResultType:(NSPersistentCloudKitContainerEventResultType)resultType
{
  self->_resultType = resultType;
}

@end
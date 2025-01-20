@interface UPRemoveProfileRequest
+ (id)pb_removeProfileRequestWithIdentifier:(id)a3 error:(id *)a4;
@end

@implementation UPRemoveProfileRequest

+ (id)pb_removeProfileRequestWithIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  Class v6 = NSClassFromString(@"NSString");
  if (!v5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100293B54(a2);
    }
LABEL_9:
    _bs_set_crash_log_message([v10 UTF8String]);
    __break(0);
    JUMPOUT(0x10020F6ECLL);
  }

  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:NSStringClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100293B54(a2);
    }
    goto LABEL_9;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[UPProfilePredicate predicateForSystemAppUserIdentifier:]( &OBJC_CLASS___UPProfilePredicate,  "predicateForSystemAppUserIdentifier:",  v5));
  v8 = -[UPRemoveProfileRequest initWithPredicate:]( objc_alloc(&OBJC_CLASS___UPRemoveProfileRequest),  "initWithPredicate:",  v7);

  return v8;
}

  ;
}

@end
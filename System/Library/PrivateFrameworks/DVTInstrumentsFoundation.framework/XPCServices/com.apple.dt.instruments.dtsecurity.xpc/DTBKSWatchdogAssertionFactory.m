@interface DTBKSWatchdogAssertionFactory
- (id)assertionForPid:(int)a3;
@end

@implementation DTBKSWatchdogAssertionFactory

- (id)assertionForPid:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = sub_10000CA34();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v24 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "acquiring assertion for pid %d", buf, 8u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[RBSDomainAttribute attributeWithDomain:name:]( &OBJC_CLASS___RBSDomainAttribute,  "attributeWithDomain:name:",  @"com.apple.DTServiceHub",  @"DeveloperToolsDebugging"));
  v22 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));

  id v8 = objc_alloc(&OBJC_CLASS___RBSAssertion);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[RBSTarget targetWithPid:](&OBJC_CLASS___RBSTarget, "targetWithPid:", v3));
  id v10 = [v8 initWithExplanation:@"Target is being analyzed by developer tools" target:v9 attributes:v7];

  id v21 = 0LL;
  unsigned __int8 v11 = [v10 acquireWithError:&v21];
  id v12 = v21;
  if ((v11 & 1) != 0)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10000CA74;
    v18[3] = &unk_100015118;
    int v20 = v3;
    v19 = (os_log_s *)v10;
    v13 = objc_retainBlock(v18);
    v14 = objc_retainBlock(v13);

    v15 = v19;
  }

  else
  {
    id v16 = sub_10000CA34();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10000E4C4((uint64_t)v12, v3, v15);
    }
    v14 = 0LL;
  }

  return v14;
}

@end
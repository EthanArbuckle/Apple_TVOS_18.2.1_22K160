@interface HMDAccountHandleFormatter
+ (id)defaultFormatter;
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5;
- (id)accountHandleFromString:(id)a3;
- (id)privateStringForObjectValue:(id)a3;
- (id)stringForObjectValue:(id)a3;
@end

@implementation HMDAccountHandleFormatter

+ (id)defaultFormatter
{
  return objc_alloc_init((Class)objc_opt_class(a1, a2));
}

- (id)stringForObjectValue:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___HMDAccountHandle, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
    v7 = v4;
  }
  else {
    v7 = 0LL;
  }
  v8 = v4;
  if (v7
    || ((id v9 = v4,
         uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString, v10),
         (objc_opt_isKindOfClass(v9, v11) & 1) == 0)
      ? (v12 = 0LL)
      : (v12 = v9),
        id v13 = v12,
        v9,
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[HMDAccountHandleFormatter accountHandleFromString:](self, "accountHandleFromString:", v13)),
        v13,
        v8))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v8 URI]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 unprefixedURI]);
  }

  else
  {
    v15 = 0LL;
  }

  return v15;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  v7 = (void *)IDSCopyAddressDestinationForDestination(a4);
  if (([v7 _appearsToBeEmail] & 1) != 0
    || [v7 hasPrefix:@"mailto:"])
  {
    v8 = objc_alloc(&OBJC_CLASS___IDSURI);
    uint64_t v9 = IDSCopyIDForEmailAddress(v7);
LABEL_7:
    uint64_t v10 = (void *)v9;
    uint64_t v11 = -[IDSURI initWithPrefixedURI:](v8, "initWithPrefixedURI:", v9);

    if (a3) {
      *a3 = -[HMDAccountHandle initWithURI:](objc_alloc(&OBJC_CLASS___HMDAccountHandle), "initWithURI:", v11);
    }
    BOOL v12 = 1;
    goto LABEL_10;
  }

  if (([v7 _appearsToBePhoneNumber] & 1) != 0
    || [v7 hasPrefix:@"tel:"])
  {
    v8 = objc_alloc(&OBJC_CLASS___IDSURI);
    uint64_t v9 = IDSCopyIDForPhoneNumber(v7);
    goto LABEL_7;
  }

  BOOL v12 = 0;
  uint64_t v11 = 0LL;
  if (a5) {
    *a5 = @"String does not appear to be valid handle type";
  }
LABEL_10:

  return v12;
}

- (id)accountHandleFromString:(id)a3
{
  id v8 = 0LL;
  unsigned int v3 = -[HMDAccountHandleFormatter getObjectValue:forString:errorDescription:]( self,  "getObjectValue:forString:errorDescription:",  &v8,  a3,  0LL);
  id v4 = v8;
  uint64_t v5 = v4;
  id v6 = 0LL;
  if (v3) {
    id v6 = v4;
  }

  return v6;
}

- (id)privateStringForObjectValue:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___HMDAccountHandle, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
    v7 = v4;
  }
  else {
    v7 = 0LL;
  }
  id v8 = v7;

  uint64_t v9 = v4;
  if (!v8)
  {
    id v10 = v4;
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString, v11);
    id v13 = (objc_opt_isKindOfClass(v10, v12) & 1) != 0 ? v10 : 0LL;
    id v14 = v13;

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[HMDAccountHandleFormatter accountHandleFromString:](self, "accountHandleFromString:", v14));
    if (!v9) {
      goto LABEL_14;
    }
  }

  id v15 = [v9 type];
  if (v15 == (id)2)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue([v9 URI]);
    v29 = (void *)objc_claimAutoreleasedReturnValue([v16 unprefixedURI]);
    v18 = self;
    id v19 = v29;
    v30 = objc_autoreleasePoolPush();
    v31 = (char *)[v19 length];
    BOOL v32 = [v19 characterAtIndex:0] == 43;
    BOOL v33 = (unint64_t)&v31[-v32] >= 4;
    uint64_t v34 = (uint64_t)&v31[-v32 - 4];
    if (v34 != 0 && v33)
    {
      v69 = v18;
      v47 = v30;
      v48 = v16;
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
      if (v34 >= 1)
      {
        uint64_t v50 = v34;
        do
        {
          [v49 appendString:@"."];
          --v50;
        }

        while (v50);
      }

      v41 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByReplacingCharactersInRange:withString:", v32, v34, v49));

      v16 = v48;
      v30 = v47;
      v18 = v69;
    }

    else
    {
      v35 = objc_autoreleasePoolPush();
      v36 = v18;
      uint64_t v37 = HMFGetOSLogHandle(v36);
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v39 = HMFGetLogIdentifier(v36);
        v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
        *(_DWORD *)buf = 138543362;
        v76 = v40;
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEBUG,  "%{public}@Phone number is too short to partially redact",  buf,  0xCu);
      }

      objc_autoreleasePoolPop(v35);
      v41 = 0LL;
    }

    v46 = v30;
    goto LABEL_31;
  }

  if (v15 != (id)1)
  {
LABEL_14:
    v28 = 0LL;
    goto LABEL_34;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v9 URI]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 unprefixedURI]);
  v18 = self;
  id v19 = v17;
  v20 = objc_autoreleasePoolPush();
  if ((unint64_t)[v19 length] > 4)
  {
    v42 = (char *)[v19 rangeOfString:@"@"];
    if (v42 != (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      v43 = v42;
      if (v42)
      {
        v67 = v20;
        v68 = v18;
        v70 = v16;
        v53 = (void *)objc_claimAutoreleasedReturnValue([v19 substringToIndex:v42]);
        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "stringByReplacingCharactersInRange:withString:", 1, v43 - 1, @"***"));

        v54 = (void *)objc_claimAutoreleasedReturnValue([v19 substringFromIndex:v43 + 1]);
        v55 = (void *)objc_claimAutoreleasedReturnValue([v54 componentsSeparatedByString:@"."]);

        v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v55 count]));
        __int128 v71 = 0u;
        __int128 v72 = 0u;
        __int128 v73 = 0u;
        __int128 v74 = 0u;
        id v57 = v55;
        id v58 = [v57 countByEnumeratingWithState:&v71 objects:buf count:16];
        if (v58)
        {
          id v59 = v58;
          uint64_t v60 = *(void *)v72;
          do
          {
            for (i = 0LL; i != v59; i = (char *)i + 1)
            {
              if (*(void *)v72 != v60) {
                objc_enumerationMutation(v57);
              }
              v62 = *(void **)(*((void *)&v71 + 1) + 8LL * (void)i);
              if ([v62 length])
              {
                v63 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v62,  "stringByReplacingCharactersInRange:withString:",  1,  (char *)objc_msgSend(v62, "length") - 1,  @"***"));
                [v56 addObject:v63];
              }
            }

            id v59 = [v57 countByEnumeratingWithState:&v71 objects:buf count:16];
          }

          while (v59);
        }

        v64 = (void *)objc_claimAutoreleasedReturnValue([v56 componentsJoinedByString:@"."]);
        v65 = (void *)objc_claimAutoreleasedReturnValue([v64 lowercaseString]);
        v41 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@@%@",  v66,  v65));

        v18 = v68;
        v16 = v70;
        v20 = v67;
        goto LABEL_25;
      }
    }

    v21 = objc_autoreleasePoolPush();
    v22 = v18;
    uint64_t v44 = HMFGetOSLogHandle(v22);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v45 = HMFGetLogIdentifier(v22);
      v26 = (void *)objc_claimAutoreleasedReturnValue(v45);
      *(_DWORD *)buf = 138543362;
      v76 = v26;
      v27 = "%{public}@Failed to determine '@' range";
      goto LABEL_23;
    }
  }

  else
  {
    v21 = objc_autoreleasePoolPush();
    v22 = v18;
    uint64_t v23 = HMFGetOSLogHandle(v22);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v25 = HMFGetLogIdentifier(v22);
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      *(_DWORD *)buf = 138543362;
      v76 = v26;
      v27 = "%{public}@Invalid email address length";
LABEL_23:
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, v27, buf, 0xCu);
    }
  }

  objc_autoreleasePoolPop(v21);
  v41 = 0LL;
LABEL_25:
  v46 = v20;
LABEL_31:
  objc_autoreleasePoolPop(v46);
  v51 = @"<redacted>";
  if (v41) {
    v51 = v41;
  }
  v28 = v51;

LABEL_34:
  return v28;
}

@end
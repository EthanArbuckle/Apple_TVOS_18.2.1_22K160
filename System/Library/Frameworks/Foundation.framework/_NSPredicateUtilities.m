@interface _NSPredicateUtilities
+ (BOOL)_isReservedWordInParser:(id)a3;
+ (NSNumber)_convertStringToNumber:(uint64_t)a1;
+ (NSString)_parserableCollectionDescription:(uint64_t)a1;
+ (NSString)_parserableDateDescription:(uint64_t)a1;
+ (NSString)_parserableStringDescription:(uint64_t)a1;
+ (id)_compoundPredicateClassesForSecureCoding;
+ (id)_constantValueClassesForSecureCoding;
+ (id)_expressionClassesForSecureCoding;
+ (id)_extendedExpressionClassesForSecureCoding;
+ (id)_operatorClassesForSecureCoding;
+ (id)_predicateClassesForSecureCoding;
+ (id)abs:(id)a3;
+ (id)add:(id)a3 to:(id)a4;
+ (id)average:(id)a3;
+ (id)bitwiseAnd:(id)a3 with:(id)a4;
+ (id)bitwiseOr:(id)a3 with:(id)a4;
+ (id)bitwiseXor:(id)a3 with:(id)a4;
+ (id)canonical:(id)a3;
+ (id)castObject:(id)a3 toType:(id)a4;
+ (id)ceiling:(id)a3;
+ (id)count:(id)a3;
+ (id)distanceToLocation:(id)a3 fromLocation:(id)a4;
+ (id)distinct:(id)a3;
+ (id)divide:(id)a3 by:(id)a4;
+ (id)exp:(id)a3;
+ (id)floor:(id)a3;
+ (id)from:(id)a3 subtract:(id)a4;
+ (id)indexed:(id)a3 by:(id)a4;
+ (id)inverseOrderKey:(id)a3;
+ (id)leftshift:(id)a3 by:(id)a4;
+ (id)length:(id)a3;
+ (id)ln:(id)a3;
+ (id)log:(id)a3;
+ (id)lowercase:(id)a3;
+ (id)max:(id)a3;
+ (id)median:(id)a3;
+ (id)min:(id)a3;
+ (id)mode:(id)a3;
+ (id)modulus:(id)a3 by:(id)a4;
+ (id)multiply:(id)a3 by:(id)a4;
+ (id)noindex:(id)a3;
+ (id)now;
+ (id)objectFrom:(id)a3 withIndex:(id)a4;
+ (id)onesComplement:(id)a3;
+ (id)raise:(id)a3 toPower:(id)a4;
+ (id)random;
+ (id)randomn:(id)a3;
+ (id)rightshift:(id)a3 by:(id)a4;
+ (id)sqrt:(id)a3;
+ (id)stddev:(id)a3;
+ (id)sum:(id)a3;
+ (id)tokenize:(id)a3 using:(id)a4;
+ (id)trunc:(id)a3;
+ (id)uppercase:(id)a3;
+ (uint64_t)_getCommonTypeFor:(uint64_t)a1;
+ (uint64_t)_getITypeFor:(uint64_t)a1;
+ (uint64_t)_predicateEnforceRestrictionsOnKeyPath:(uint64_t)a3 withOperand:(uint64_t)a4 forComponentName:;
+ (uint64_t)_predicateEnforceRestrictionsOnSelector:(uint64_t)a3 withOperand:(BOOL *)a4 isKVC:(uint64_t)a5 forComponentName:;
+ (uint64_t)_predicateEnforceRestrictionsOnTarget:(uint64_t)a3 forComponentName:;
+ (uint64_t)_predicateSecurityAction;
+ (void)_collapseAndTokenize:(uint64_t)a3 flags:(void *)a4 locale:;
+ (void)_doTokenization:(const __CFLocale *)a3 locale:;
+ (void)_processAndTokenize:(uint64_t)a3 flags:(const __CFLocale *)a4 locale:;
+ (void)initialize;
- (double)distanceFromLocation:(id)a3;
@end

@implementation _NSPredicateUtilities

- (double)distanceFromLocation:(id)a3
{
  return 0.0;
}

+ (uint64_t)_predicateSecurityAction
{
  uint64_t result = _CFPredicatePolicyData_getFlags();
  if ((result & 8) != 0 || (uint64_t result = dyld_program_sdk_at_least(), (_DWORD)result)) {
    __break(1u);
  }
  return result;
}

+ (uint64_t)_predicateEnforceRestrictionsOnTarget:(uint64_t)a3 forComponentName:
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  if (!a2) {
    return 0LL;
  }
  if (object_isClass(a2))
  {
    v5 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", class_getName(a2));
    v6 = a2;
    goto LABEL_7;
  }

  Class Class = object_getClass(a2);
  if (object_isClass(Class))
  {
    v5 = -[NSString initWithUTF8String:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithUTF8String:",  object_getClassName(a2));
    v6 = object_getClass(a2);
LABEL_7:
    Superclass = (NSString *)class_getSuperclass(v6);
    if (Superclass) {
      Superclass = -[NSString initWithUTF8String:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithUTF8String:",  class_getName((Class)Superclass));
    }
    objc_opt_self();
    if ([(id)_CFPredicatePolicyRestrictedClasses() objectForKey:v5])
    {
      objc_opt_self();
      if (![*(id *)(_CFPredicatePolicyData() + 8) objectForKey:v5])
      {
LABEL_17:
        objc_opt_self();
        v12 = (os_log_s *)_NSOSLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          int v14 = 138412546;
          uint64_t v15 = a3;
          __int16 v16 = 2114;
          v17 = v5;
          _os_log_fault_impl( &dword_182EB1000,  v12,  OS_LOG_TYPE_FAULT,  "NSPredicate: Use of %@ with instance of '%{public}@' is forbidden.",  (uint8_t *)&v14,  0x16u);
        }

        uint64_t v7 = 1LL;
        goto LABEL_25;
      }

      objc_opt_self();
      unint64_t Flags = _CFPredicatePolicyData_getFlags();
      uint64_t v11 = (Flags >> 3) & 1;
      if (((Flags >> 3) & 1) != 0) {
        goto LABEL_16;
      }
    }

    else
    {
      LODWORD(v11) = 0;
    }

    if (Superclass)
    {
      objc_opt_self();
      if (![*(id *)(_CFPredicatePolicyData() + 16) objectForKey:v5])
      {
        objc_opt_self();
        if ([(id)_CFPredicatePolicyRestrictedClasses() objectForKey:Superclass])
        {
          objc_opt_self();
          if (![*(id *)(_CFPredicatePolicyData() + 8) objectForKey:Superclass]) {
            goto LABEL_17;
          }
          objc_opt_self();
          if ((_CFPredicatePolicyData_getFlags() & 8) != 0) {
            goto LABEL_17;
          }
        }

        goto LABEL_24;
      }
    }

+ (uint64_t)_predicateEnforceRestrictionsOnSelector:(uint64_t)a3 withOperand:(BOOL *)a4 isKVC:(uint64_t)a5 forComponentName:
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  v9 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", sel_getName(a2));
  objc_opt_self();
  uint64_t v10 = [*(id *)(_CFPredicatePolicyData() + 32) objectForKey:v9];
  if (v10
    || (objc_opt_self(), ![(id)_CFPredicatePolicyRestrictedSelectors() objectForKey:v9])
    && ((objc_opt_self(), (_CFPredicatePolicyData_getFlags() & 8) == 0)
     || (objc_opt_class(), (objc_opt_respondsToSelector() & 1) == 0)
     || (objc_opt_self(), [*(id *)(_CFPredicatePolicyData() + 24) objectForKey:v9]))
    || (objc_opt_self(), [*(id *)(_CFPredicatePolicyData() + 40) objectForKey:v9])
    && (objc_opt_self(), (_CFPredicatePolicyData_getFlags() & 8) == 0)
    || (BOOL v13 = -[NSString isEqualToString:](v9, "isEqualToString:", @"class"), a3)
    && v13
    && (objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v11 = 0LL;
  }

  else
  {
    objc_opt_self();
    int v14 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      int v15 = 138412546;
      uint64_t v16 = a5;
      __int16 v17 = 2114;
      uint64_t v18 = v9;
      _os_log_fault_impl( &dword_182EB1000,  v14,  OS_LOG_TYPE_FAULT,  "NSPredicate: %@ with selector '%{public}@' is forbidden.",  (uint8_t *)&v15,  0x16u);
    }

    uint64_t v11 = 1LL;
  }

  if (a4) {
    *a4 = v10 != 0;
  }
  return v11;
}

+ (uint64_t)_predicateEnforceRestrictionsOnKeyPath:(uint64_t)a3 withOperand:(uint64_t)a4 forComponentName:
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  uint64_t v7 = objc_opt_self();
  v8 = (void *)MEMORY[0x186E1FF60](v7);
  if (a3) {
    int v9 = objc_opt_isKindOfClass() ^ 1;
  }
  else {
    int v9 = 1;
  }
  uint64_t v10 = (void *)[a2 componentsSeparatedByString:@"."];
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    context = v8;
    int v13 = 0;
    uint64_t v14 = *(void *)v28;
    while (2)
    {
      uint64_t v15 = 0LL;
      int v16 = -v13;
      int v25 = v13 + v12;
      do
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v10);
        }
        __int16 v17 = *(NSString **)(*((void *)&v27 + 1) + 8 * v15);
        uint64_t v18 = NSSelectorFromString(v17);
        if (v18)
        {
          int v19 = +[_NSPredicateUtilities _predicateEnforceRestrictionsOnSelector:withOperand:isKVC:forComponentName:]( (uint64_t)&OBJC_CLASS____NSPredicateUtilities,  v18,  a3,  0LL,  a4);
          char v20 = v19;
          if (v16 == (_DWORD)v15) {
            int v21 = 1;
          }
          else {
            int v21 = v19;
          }
          if (((v21 | v9) & 1) != 0 || !-[NSString isEqualToString:](v17, "isEqualToString:", @"class"))
          {
            if ((v20 & 1) != 0)
            {
LABEL_21:
              uint64_t v22 = 1LL;
              goto LABEL_22;
            }
          }

          else
          {
            objc_opt_self();
            if ((_CFPredicatePolicyData_getFlags() & 8) != 0) {
              goto LABEL_21;
            }
          }
        }

        ++v15;
      }

      while (v12 != v15);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v26 count:16];
      int v13 = v25;
      if (v12) {
        continue;
      }
      break;
    }

    uint64_t v22 = 0LL;
LABEL_22:
    v8 = context;
  }

  else
  {
    uint64_t v22 = 0LL;
  }

  objc_autoreleasePoolPop(v8);
  return v22;
}

+ (void)initialize
{
  if (&OBJC_CLASS____NSPredicateUtilities == a1 && _NSCoderGetTrustRestrictions() != 2)
  {
    _CFPredicatePolicyData_getFlags();
    _CFPredicatePolicyData_setFlags();
  }

+ (uint64_t)_getITypeFor:(uint64_t)a1
{
  if (!a2) {
    goto LABEL_13;
  }
  uint64_t v3 = (char)*a2;
  if (v3 <= 99)
  {
    if (v3 > 80)
    {
      if (v3 == 81) {
        return 1LL;
      }
      if (v3 != 83)
      {
LABEL_13:
        objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Unknown number type or nil passed to arithmetic function expression." userInfo:0]);
        return 1LL;
      }
    }

    else if (v3 != 73 && v3 != 76)
    {
      goto LABEL_13;
    }

    return 2LL;
  }

  uint64_t result = 0LL;
  switch(*a2)
  {
    case 'd':
    case 'f':
      return result;
    case 'e':
    case 'g':
    case 'h':
    case 'j':
    case 'k':
      goto LABEL_13;
    case 'i':
    case 'l':
      return 2LL;
    default:
      if (v3 == 113 || v3 == 115) {
        return 2LL;
      }
      goto LABEL_13;
  }

  return result;
}

+ (uint64_t)_getCommonTypeFor:(uint64_t)a1
{
  v25[1] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  if (!a2)
  {
    uint64_t v13 = 0LL;
    goto LABEL_23;
  }

  if (![a2 count]
    || (_NSIsNSArray() & 1) == 0 && (_NSIsNSSet() & 1) == 0 && (_NSIsNSOrderedSet() & 1) == 0)
  {
    goto LABEL_21;
  }

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  uint64_t v3 = [a2 countByEnumeratingWithState:&v20 objects:v19 count:16];
  if (!v3) {
    return 3LL;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)v21;
  unint64_t v6 = 3LL;
  do
  {
    for (uint64_t i = 0LL; i != v4; ++i)
    {
      if (*(void *)v21 != v5) {
        objc_enumerationMutation(a2);
      }
      v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
      if ((_NSIsNSNumber() & 1) == 0)
      {
        uint64_t v11 = (void *)MEMORY[0x189603F70];
        uint64_t v12 = *MEMORY[0x189603A60];
        __int16 v17 = @"collection";
        uint64_t v18 = a2;
        uint64_t v13 = [MEMORY[0x189603F68] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
        uint64_t v14 = @"Invoked mathematical function with non-numeric object(s) in collection.";
        uint64_t v15 = v11;
        uint64_t v16 = v12;
        while (1)
        {
          objc_exception_throw((id)[v15 exceptionWithName:v16 reason:v14 userInfo:v13]);
LABEL_21:
          v24 = @"collection";
          v25[0] = a2;
          uint64_t v13 = [MEMORY[0x189603F68] dictionaryWithObjects:v25 forKeys:&v24 count:1];
LABEL_23:
          uint64_t v15 = (void *)MEMORY[0x189603F70];
          uint64_t v16 = *MEMORY[0x189603A60];
          uint64_t v14 = @"Invoked mathematical function with bad collection parameter.";
        }
      }

      unint64_t v9 = +[_NSPredicateUtilities _getITypeFor:]( (uint64_t)_NSPredicateUtilities,  (_BYTE *)[v8 objCType]);
      if (v9 < v6) {
        unint64_t v6 = v9;
      }
    }

    uint64_t v4 = [a2 countByEnumeratingWithState:&v20 objects:v19 count:16];
  }

  while (v4);
  return v6;
}

+ (id)sum:(id)a3
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  if (((_NSIsNSArray() & 1) != 0 || (_NSIsNSSet() & 1) != 0 || _NSIsNSOrderedSet())
    && ![a3 count])
  {
    return +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL);
  }

  uint64_t v4 = +[_NSPredicateUtilities _getCommonTypeFor:]((uint64_t)&OBJC_CLASS____NSPredicateUtilities, a3);
  if (v4 == 1)
  {
    __int128 v30 = 0uLL;
    __int128 v31 = 0uLL;
    __int128 v28 = 0uLL;
    __int128 v29 = 0uLL;
    uint64_t v12 = [a3 countByEnumeratingWithState:&v28 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = 0LL;
      uint64_t v15 = *(void *)v29;
      do
      {
        for (uint64_t i = 0LL; i != v13; ++i)
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(a3);
          }
          v14 += [*(id *)(*((void *)&v28 + 1) + 8 * i) unsignedLongLongValue];
        }

        uint64_t v13 = [a3 countByEnumeratingWithState:&v28 objects:v27 count:16];
      }

      while (v13);
    }

    else
    {
      uint64_t v14 = 0LL;
    }

    return +[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v14);
  }

  else if (v4)
  {
    __int128 v25 = 0uLL;
    __int128 v26 = 0uLL;
    __int128 v23 = 0uLL;
    __int128 v24 = 0uLL;
    uint64_t v17 = [a3 countByEnumeratingWithState:&v23 objects:v22 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = 0LL;
      uint64_t v20 = *(void *)v24;
      do
      {
        for (uint64_t j = 0LL; j != v18; ++j)
        {
          if (*(void *)v24 != v20) {
            objc_enumerationMutation(a3);
          }
          v19 += [*(id *)(*((void *)&v23 + 1) + 8 * j) longLongValue];
        }

        uint64_t v18 = [a3 countByEnumeratingWithState:&v23 objects:v22 count:16];
      }

      while (v18);
    }

    else
    {
      uint64_t v19 = 0LL;
    }

    return +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v19);
  }

  else
  {
    __int128 v35 = 0uLL;
    __int128 v36 = 0uLL;
    __int128 v33 = 0uLL;
    __int128 v34 = 0uLL;
    uint64_t v5 = [a3 countByEnumeratingWithState:&v33 objects:v32 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v34;
      double v8 = 0.0;
      do
      {
        for (uint64_t k = 0LL; k != v6; ++k)
        {
          if (*(void *)v34 != v7) {
            objc_enumerationMutation(a3);
          }
          [*(id *)(*((void *)&v33 + 1) + 8 * k) doubleValue];
          double v8 = v8 + v10;
        }

        uint64_t v6 = [a3 countByEnumeratingWithState:&v33 objects:v32 count:16];
      }

      while (v6);
    }

    else
    {
      double v8 = 0.0;
    }

    return +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v8);
  }

+ (id)count:(id)a3
{
  if ((_NSIsNSArray() & 1) != 0 || (_NSIsNSSet() & 1) != 0 || (_NSIsNSOrderedSet() & 1) != 0) {
    return +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [a3 count]);
  }
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Invoked count with non-collection parameter." userInfo:0]);
  return +[_NSPredicateUtilities min:](v5, v6, v7);
}

+ (id)min:(id)a3
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  if (![a3 count]) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Invoked min with empty collection." userInfo:0]);
  }
  uint64_t v4 = +[_NSPredicateUtilities _getCommonTypeFor:]((uint64_t)&OBJC_CLASS____NSPredicateUtilities, a3);
  else {
    id v5 = (void *)[a3 anyObject];
  }
  if (v4 == 1)
  {
    unint64_t v16 = [v5 unsignedLongLongValue];
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    uint64_t v17 = [a3 countByEnumeratingWithState:&v34 objects:v33 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v35;
      do
      {
        for (uint64_t i = 0LL; i != v18; ++i)
        {
          if (*(void *)v35 != v19) {
            objc_enumerationMutation(a3);
          }
          __int128 v21 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          if ([v21 unsignedLongLongValue] < v16) {
            unint64_t v16 = [v21 unsignedLongLongValue];
          }
        }

        uint64_t v18 = [a3 countByEnumeratingWithState:&v34 objects:v33 count:16];
      }

      while (v18);
    }

    return +[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v16);
  }

  else if (v4)
  {
    uint64_t v22 = [v5 longLongValue];
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    uint64_t v23 = [a3 countByEnumeratingWithState:&v29 objects:v28 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v30;
      do
      {
        for (uint64_t j = 0LL; j != v24; ++j)
        {
          if (*(void *)v30 != v25) {
            objc_enumerationMutation(a3);
          }
          __int128 v27 = *(void **)(*((void *)&v29 + 1) + 8 * j);
          if ([v27 longLongValue] < v22) {
            uint64_t v22 = [v27 longLongValue];
          }
        }

        uint64_t v24 = [a3 countByEnumeratingWithState:&v29 objects:v28 count:16];
      }

      while (v24);
    }

    return +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v22);
  }

  else
  {
    [v5 doubleValue];
    double v7 = v6;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    uint64_t v8 = [a3 countByEnumeratingWithState:&v39 objects:v38 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v40;
      do
      {
        for (uint64_t k = 0LL; k != v9; ++k)
        {
          if (*(void *)v40 != v10) {
            objc_enumerationMutation(a3);
          }
          uint64_t v12 = *(void **)(*((void *)&v39 + 1) + 8 * k);
          [v12 doubleValue];
          if (v13 < v7)
          {
            [v12 doubleValue];
            double v7 = v14;
          }
        }

        uint64_t v9 = [a3 countByEnumeratingWithState:&v39 objects:v38 count:16];
      }

      while (v9);
    }

    return +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v7);
  }

+ (id)max:(id)a3
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  if (![a3 count]) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Invoked max with empty collection." userInfo:0]);
  }
  uint64_t v4 = +[_NSPredicateUtilities _getCommonTypeFor:]((uint64_t)&OBJC_CLASS____NSPredicateUtilities, a3);
  else {
    id v5 = (void *)[a3 anyObject];
  }
  if (v4 == 1)
  {
    unint64_t v16 = [v5 unsignedLongLongValue];
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    uint64_t v17 = [a3 countByEnumeratingWithState:&v34 objects:v33 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v35;
      do
      {
        for (uint64_t i = 0LL; i != v18; ++i)
        {
          if (*(void *)v35 != v19) {
            objc_enumerationMutation(a3);
          }
          __int128 v21 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          if ([v21 unsignedLongLongValue] > v16) {
            unint64_t v16 = [v21 unsignedLongLongValue];
          }
        }

        uint64_t v18 = [a3 countByEnumeratingWithState:&v34 objects:v33 count:16];
      }

      while (v18);
    }

    return +[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v16);
  }

  else if (v4)
  {
    uint64_t v22 = [v5 longLongValue];
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    uint64_t v23 = [a3 countByEnumeratingWithState:&v29 objects:v28 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v30;
      do
      {
        for (uint64_t j = 0LL; j != v24; ++j)
        {
          if (*(void *)v30 != v25) {
            objc_enumerationMutation(a3);
          }
          __int128 v27 = *(void **)(*((void *)&v29 + 1) + 8 * j);
          if ([v27 longLongValue] > v22) {
            uint64_t v22 = [v27 longLongValue];
          }
        }

        uint64_t v24 = [a3 countByEnumeratingWithState:&v29 objects:v28 count:16];
      }

      while (v24);
    }

    return +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v22);
  }

  else
  {
    [v5 doubleValue];
    double v7 = v6;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    uint64_t v8 = [a3 countByEnumeratingWithState:&v39 objects:v38 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v40;
      do
      {
        for (uint64_t k = 0LL; k != v9; ++k)
        {
          if (*(void *)v40 != v10) {
            objc_enumerationMutation(a3);
          }
          uint64_t v12 = *(void **)(*((void *)&v39 + 1) + 8 * k);
          [v12 doubleValue];
          if (v13 > v7)
          {
            [v12 doubleValue];
            double v7 = v14;
          }
        }

        uint64_t v9 = [a3 countByEnumeratingWithState:&v39 objects:v38 count:16];
      }

      while (v9);
    }

    return +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v7);
  }

+ (id)average:(id)a3
{
  uint64_t v4 = (void *)objc_msgSend(a1, "sum:");
  uint64_t v5 = +[_NSPredicateUtilities _getCommonTypeFor:]((uint64_t)&OBJC_CLASS____NSPredicateUtilities, a3);
  if (v5 == 1)
  {
    double v7 = (double)(unint64_t)[v4 unsignedLongLongValue];
  }

  else if (v5)
  {
    double v7 = (double)[v4 longLongValue];
  }

  else
  {
    [v4 doubleValue];
    double v7 = v6;
  }

  return +[NSNumber numberWithDouble:]( NSNumber,  "numberWithDouble:",  v7 / (double)(unint64_t)[a3 count]);
}

+ (id)median:(id)a3
{
  uint64_t v3 = (void *)[a3 sortedArrayUsingSelector:sel_compare_];
  char v4 = [v3 count];
  unint64_t v5 = (unint64_t)[v3 count] >> 1;
  if ((v4 & 1) != 0) {
    return (id)[v3 objectAtIndex:v5];
  }
  double v6 = (void *)[v3 objectAtIndex:v5 - 1];
  double v7 = (void *)objc_msgSend(v3, "objectAtIndex:", (unint64_t)objc_msgSend(v3, "count") >> 1);
  unint64_t v8 = +[_NSPredicateUtilities _getITypeFor:]( (uint64_t)_NSPredicateUtilities,  (_BYTE *)[v6 objCType]);
  unint64_t v9 = +[_NSPredicateUtilities _getITypeFor:]( (uint64_t)_NSPredicateUtilities,  (_BYTE *)[v7 objCType]);
  if (v9 <= v8) {
    unint64_t v10 = v8;
  }
  else {
    unint64_t v10 = v9;
  }
  if (v10 == 1) {
    return +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  (unint64_t)([v7 unsignedLongLongValue] + objc_msgSend(v6, "unsignedLongLongValue")) >> 1);
  }
  if (v10)
  {
    uint64_t v15 = [v6 longLongValue];
    uint64_t v16 = [v7 longLongValue];
    uint64_t v17 = v16 + v15;
    if (v16 + v15 < 0 != __OFADD__(v16, v15)) {
      ++v17;
    }
    return +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v17 >> 1);
  }

  else
  {
    [v6 doubleValue];
    double v12 = v11;
    [v7 doubleValue];
    return +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (v12 + v13) * 0.5);
  }

+ (id)mode:(id)a3
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  uint64_t v4 = +[_NSPredicateUtilities _getCommonTypeFor:]((uint64_t)&OBJC_CLASS____NSPredicateUtilities, a3);
  unint64_t v5 = (void *)[a3 sortedArrayUsingSelector:sel_compare_];
  double v6 = (void *)[MEMORY[0x189603FA8] array];
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unint64_t v9 = 0LL;
    uint64_t v10 = 0LL;
    unint64_t v11 = 0LL;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        double v14 = v9;
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v5);
        }
        unint64_t v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (![v6 count])
        {
          ++v10;
          [v6 addObject:v9];
          continue;
        }

        if (v4 == 1)
        {
          uint64_t v18 = [v14 unsignedLongLongValue];
          uint64_t v19 = [v9 unsignedLongLongValue];
        }

        else
        {
          if (!v4)
          {
            [v14 doubleValue];
            double v16 = v15;
            [v9 doubleValue];
            if (v16 != v17) {
              goto LABEL_16;
            }
            goto LABEL_10;
          }

          uint64_t v18 = [v14 longLongValue];
          uint64_t v19 = [v9 longLongValue];
        }

        if (v18 != v19)
        {
LABEL_16:
          uint64_t v10 = 1LL;
          continue;
        }

+ (id)stddev:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  objc_msgSend((id)objc_msgSend(a1, "average:"), "doubleValue");
  double v5 = v4;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(a3);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * i) doubleValue];
        double v9 = v9 + (v5 - v11) * (v5 - v11);
      }

      uint64_t v7 = [a3 countByEnumeratingWithState:&v14 objects:v13 count:16];
    }

    while (v7);
  }

  else
  {
    double v9 = 0.0;
  }

  return +[NSNumber numberWithDouble:]( NSNumber,  "numberWithDouble:",  sqrt(v9 / (double)(unint64_t)[a3 count]));
}

+ (id)add:(id)a3 to:(id)a4
{
  v30[1] = *MEMORY[0x1895F89C0];
  int v6 = _NSIsNSDate();
  int v7 = _NSIsNSNumber();
  int v8 = _NSIsNSDate();
  int v9 = _NSIsNSNumber();
  if (!v7 || !v9)
  {
    if ((v6 & v9) == 1)
    {
      __int128 v17 = (void *)MEMORY[0x189603F50];
      [a3 timeIntervalSinceReferenceDate];
      double v19 = v18;
      [a4 doubleValue];
    }

    else
    {
      if ((v7 & v8) != 1)
      {
        __int128 v22 = (void *)MEMORY[0x189603F70];
        uint64_t v23 = *MEMORY[0x189603A60];
        v28[1] = a3;
        __int128 v29 = @"Parameters";
        v28[0] = a4;
        v30[0] = [MEMORY[0x189603F18] arrayWithObjects:v28 count:2];
        objc_exception_throw((id)objc_msgSend( v22,  "exceptionWithName:reason:userInfo:",  v23,  @"incompatible parameters passed to mathematical function",  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjects:forKeys:count:",  v30,  &v29,  1)));
        return +[_NSPredicateUtilities from:subtract:](v24, v25, v26, v27);
      }

      __int128 v17 = (void *)MEMORY[0x189603F50];
      [a3 doubleValue];
      double v19 = v21;
      [a4 timeIntervalSinceReferenceDate];
    }

    return (id)[v17 dateWithTimeIntervalSinceReferenceDate:v19 + v20];
  }

  unint64_t v10 = +[_NSPredicateUtilities _getITypeFor:]( (uint64_t)_NSPredicateUtilities,  (_BYTE *)[a3 objCType]);
  unint64_t v11 = +[_NSPredicateUtilities _getITypeFor:]( (uint64_t)_NSPredicateUtilities,  (_BYTE *)[a4 objCType]);
  if (v10 >= v11) {
    unint64_t v12 = v11;
  }
  else {
    unint64_t v12 = v10;
  }
  if (v12 == 1) {
    return +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [a4 unsignedLongLongValue] + objc_msgSend(a3, "unsignedLongLongValue"));
  }
  if (v12) {
    return +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [a4 longLongValue] + objc_msgSend(a3, "longLongValue"));
  }
  [a3 doubleValue];
  double v14 = v13;
  [a4 doubleValue];
  return +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v14 + v15);
}

+ (id)from:(id)a3 subtract:(id)a4
{
  v30[1] = *MEMORY[0x1895F89C0];
  int v6 = _NSIsNSDate();
  int v7 = _NSIsNSNumber();
  int v8 = _NSIsNSDate();
  int v9 = _NSIsNSNumber();
  if (v7 && v9)
  {
    unint64_t v10 = +[_NSPredicateUtilities _getITypeFor:]( (uint64_t)_NSPredicateUtilities,  (_BYTE *)[a3 objCType]);
    unint64_t v11 = +[_NSPredicateUtilities _getITypeFor:]( (uint64_t)_NSPredicateUtilities,  (_BYTE *)[a4 objCType]);
    if (v10 >= v11) {
      unint64_t v12 = v11;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12 == 1)
    {
      return +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [a3 unsignedLongLongValue] - objc_msgSend(a4, "unsignedLongLongValue"));
    }

    else
    {
      if (!v12)
      {
        [a3 doubleValue];
        double v14 = v13;
        [a4 doubleValue];
        return +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v14 - v15);
      }

      return +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [a3 longLongValue] - objc_msgSend(a4, "longLongValue"));
    }
  }

  else
  {
    if ((v6 & v8) == 1)
    {
      [a3 timeIntervalSinceReferenceDate];
      double v14 = v16;
      [a4 timeIntervalSinceReferenceDate];
      return +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v14 - v15);
    }

    if ((v6 & v9) == 1)
    {
      double v18 = (void *)MEMORY[0x189603F50];
      [a3 timeIntervalSinceReferenceDate];
      double v20 = v19;
      [a4 doubleValue];
      return (id)[v18 dateWithTimeIntervalSinceReferenceDate:v20 - v21];
    }

    else
    {
      __int128 v22 = (void *)MEMORY[0x189603F70];
      uint64_t v23 = *MEMORY[0x189603A60];
      v28[1] = a3;
      __int128 v29 = @"Parameters";
      v28[0] = a4;
      v30[0] = [MEMORY[0x189603F18] arrayWithObjects:v28 count:2];
      objc_exception_throw((id)objc_msgSend( v22,  "exceptionWithName:reason:userInfo:",  v23,  @"incompatible parameters passed to mathematical function",  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjects:forKeys:count:",  v30,  &v29,  1)));
      return +[_NSPredicateUtilities multiply:by:](v24, v25, v26, v27);
    }
  }

+ (id)multiply:(id)a3 by:(id)a4
{
  v17[1] = *MEMORY[0x1895F89C0];
  if (!_NSIsNSNumber() || (_NSIsNSNumber() & 1) == 0)
  {
    double v13 = (void *)MEMORY[0x189603F70];
    uint64_t v14 = *MEMORY[0x189603A60];
    v15[1] = a4;
    double v16 = @"Parameters";
    v15[0] = a3;
    v17[0] = [MEMORY[0x189603F18] arrayWithObjects:v15 count:2];
    objc_exception_throw((id)objc_msgSend( v13,  "exceptionWithName:reason:userInfo:",  v14,  @"mathematical functions require NSNumber parameters",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1)));
  }

  unint64_t v6 = +[_NSPredicateUtilities _getITypeFor:]( (uint64_t)_NSPredicateUtilities,  (_BYTE *)[a3 objCType]);
  unint64_t v7 = +[_NSPredicateUtilities _getITypeFor:]( (uint64_t)_NSPredicateUtilities,  (_BYTE *)[a4 objCType]);
  if (v6 >= v7) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = v6;
  }
  if (v8 == 1) {
    return +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [a4 unsignedLongLongValue] * objc_msgSend(a3, "unsignedLongLongValue"));
  }
  if (v8) {
    return +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [a4 longLongValue] * objc_msgSend(a3, "longLongValue"));
  }
  [a3 doubleValue];
  double v10 = v9;
  [a4 doubleValue];
  return +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v10 * v11);
}

+ (id)divide:(id)a3 by:(id)a4
{
  v23[1] = *MEMORY[0x1895F89C0];
  if (!_NSIsNSNumber() || (_NSIsNSNumber() & 1) == 0)
  {
    double v19 = (void *)MEMORY[0x189603F70];
    uint64_t v20 = *MEMORY[0x189603A60];
    v21[1] = a4;
    __int128 v22 = @"Parameters";
    v21[0] = a3;
    v23[0] = [MEMORY[0x189603F18] arrayWithObjects:v21 count:2];
    objc_exception_throw((id)objc_msgSend( v19,  "exceptionWithName:reason:userInfo:",  v20,  @"mathematical functions require NSNumber parameters",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1)));
  }

  unint64_t v6 = +[_NSPredicateUtilities _getITypeFor:]( (uint64_t)_NSPredicateUtilities,  (_BYTE *)[a3 objCType]);
  unint64_t v7 = +[_NSPredicateUtilities _getITypeFor:]( (uint64_t)_NSPredicateUtilities,  (_BYTE *)[a4 objCType]);
  if (v6 >= v7) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = v6;
  }
  if (v8 == 1)
  {
    unint64_t v13 = [a3 unsignedLongLongValue];
    unint64_t v14 = [a4 unsignedLongLongValue];
    if (v14) {
      unint64_t v15 = v13 / v14;
    }
    else {
      unint64_t v15 = 0LL;
    }
    return +[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v15);
  }

  else if (v8)
  {
    uint64_t v16 = [a3 longLongValue];
    uint64_t v17 = [a4 longLongValue];
    if (v17) {
      uint64_t v18 = v16 / v17;
    }
    else {
      uint64_t v18 = 0LL;
    }
    return +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v18);
  }

  else
  {
    [a3 doubleValue];
    double v10 = v9;
    [a4 doubleValue];
    return +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v10 / v11);
  }

+ (id)modulus:(id)a3 by:(id)a4
{
  v23[1] = *MEMORY[0x1895F89C0];
  if (!_NSIsNSNumber() || (_NSIsNSNumber() & 1) == 0)
  {
    double v19 = (void *)MEMORY[0x189603F70];
    uint64_t v20 = *MEMORY[0x189603A60];
    v21[1] = a4;
    __int128 v22 = @"Parameters";
    v21[0] = a3;
    v23[0] = [MEMORY[0x189603F18] arrayWithObjects:v21 count:2];
    objc_exception_throw((id)objc_msgSend( v19,  "exceptionWithName:reason:userInfo:",  v20,  @"mathematical functions require NSNumber parameters",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1)));
  }

  unint64_t v6 = +[_NSPredicateUtilities _getITypeFor:]( (uint64_t)_NSPredicateUtilities,  (_BYTE *)[a3 objCType]);
  unint64_t v7 = +[_NSPredicateUtilities _getITypeFor:]( (uint64_t)_NSPredicateUtilities,  (_BYTE *)[a4 objCType]);
  if (v6 >= v7) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = v6;
  }
  if (v8 == 1)
  {
    unint64_t v13 = [a3 unsignedLongLongValue];
    unint64_t v14 = [a4 unsignedLongLongValue];
    if (v14) {
      unint64_t v15 = v13 % v14;
    }
    else {
      unint64_t v15 = 0LL;
    }
    return +[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v15);
  }

  else if (v8)
  {
    uint64_t v16 = [a3 longLongValue];
    uint64_t v17 = [a4 longLongValue];
    if (v17) {
      uint64_t v18 = v16 % v17;
    }
    else {
      uint64_t v18 = 0LL;
    }
    return +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v18);
  }

  else
  {
    [a3 doubleValue];
    double v10 = v9;
    [a4 doubleValue];
    return +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", fmod(v10, v11));
  }

+ (id)sqrt:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  if ((_NSIsNSNumber() & 1) == 0)
  {
    unint64_t v6 = (void *)MEMORY[0x189603F70];
    uint64_t v7 = *MEMORY[0x189603A60];
    id v8 = a3;
    double v9 = @"Parameters";
    v10[0] = [MEMORY[0x189603F18] arrayWithObjects:&v8 count:1];
    objc_exception_throw((id)objc_msgSend( v6,  "exceptionWithName:reason:userInfo:",  v7,  @"mathematical functions require NSNumber parameters",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1)));
  }

  [a3 doubleValue];
  return +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", sqrt(v4));
}

+ (id)log:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  if ((_NSIsNSNumber() & 1) == 0)
  {
    unint64_t v6 = (void *)MEMORY[0x189603F70];
    uint64_t v7 = *MEMORY[0x189603A60];
    id v8 = a3;
    double v9 = @"Parameters";
    v10[0] = [MEMORY[0x189603F18] arrayWithObjects:&v8 count:1];
    objc_exception_throw((id)objc_msgSend( v6,  "exceptionWithName:reason:userInfo:",  v7,  @"mathematical functions require NSNumber parameters",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1)));
  }

  [a3 doubleValue];
  return +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", log10(v4));
}

+ (id)ln:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  if ((_NSIsNSNumber() & 1) == 0)
  {
    unint64_t v6 = (void *)MEMORY[0x189603F70];
    uint64_t v7 = *MEMORY[0x189603A60];
    id v8 = a3;
    double v9 = @"Parameters";
    v10[0] = [MEMORY[0x189603F18] arrayWithObjects:&v8 count:1];
    objc_exception_throw((id)objc_msgSend( v6,  "exceptionWithName:reason:userInfo:",  v7,  @"mathematical functions require NSNumber parameters",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1)));
  }

  [a3 doubleValue];
  return +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", log(v4));
}

+ (id)raise:(id)a3 toPower:(id)a4
{
  v14[1] = *MEMORY[0x1895F89C0];
  if ((_NSIsNSNumber() & 1) == 0)
  {
    double v10 = (void *)MEMORY[0x189603F70];
    uint64_t v11 = *MEMORY[0x189603A60];
    id v12 = a3;
    unint64_t v13 = @"Parameters";
    v14[0] = [MEMORY[0x189603F18] arrayWithObjects:&v12 count:1];
    objc_exception_throw((id)objc_msgSend( v10,  "exceptionWithName:reason:userInfo:",  v11,  @"mathematical functions require NSNumber parameters",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1)));
  }

  [a3 doubleValue];
  double v7 = v6;
  [a4 doubleValue];
  return +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", pow(v7, v8));
}

+ (id)exp:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  if ((_NSIsNSNumber() & 1) == 0)
  {
    double v6 = (void *)MEMORY[0x189603F70];
    uint64_t v7 = *MEMORY[0x189603A60];
    id v8 = a3;
    double v9 = @"Parameters";
    v10[0] = [MEMORY[0x189603F18] arrayWithObjects:&v8 count:1];
    objc_exception_throw((id)objc_msgSend( v6,  "exceptionWithName:reason:userInfo:",  v7,  @"mathematical functions require NSNumber parameters",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1)));
  }

  [a3 doubleValue];
  return +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", exp(v4));
}

+ (id)floor:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  if ((_NSIsNSNumber() & 1) == 0)
  {
    double v6 = (void *)MEMORY[0x189603F70];
    uint64_t v7 = *MEMORY[0x189603A60];
    id v8 = a3;
    double v9 = @"Parameters";
    v10[0] = [MEMORY[0x189603F18] arrayWithObjects:&v8 count:1];
    objc_exception_throw((id)objc_msgSend( v6,  "exceptionWithName:reason:userInfo:",  v7,  @"mathematical functions require NSNumber parameters",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1)));
  }

  [a3 doubleValue];
  return +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", floor(v4));
}

+ (id)ceiling:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  if ((_NSIsNSNumber() & 1) == 0)
  {
    double v6 = (void *)MEMORY[0x189603F70];
    uint64_t v7 = *MEMORY[0x189603A60];
    id v8 = a3;
    double v9 = @"Parameters";
    v10[0] = [MEMORY[0x189603F18] arrayWithObjects:&v8 count:1];
    objc_exception_throw((id)objc_msgSend( v6,  "exceptionWithName:reason:userInfo:",  v7,  @"mathematical functions require NSNumber parameters",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1)));
  }

  [a3 doubleValue];
  return +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", ceil(v4));
}

+ (id)abs:(id)a3
{
  v12[1] = *MEMORY[0x1895F89C0];
  if ((_NSIsNSNumber() & 1) == 0)
  {
    id v8 = (void *)MEMORY[0x189603F70];
    uint64_t v9 = *MEMORY[0x189603A60];
    id v10 = a3;
    uint64_t v11 = @"Parameters";
    v12[0] = [MEMORY[0x189603F18] arrayWithObjects:&v10 count:1];
    objc_exception_throw((id)objc_msgSend( v8,  "exceptionWithName:reason:userInfo:",  v9,  @"mathematical functions require NSNumber parameters",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1)));
  }

  uint64_t v4 = +[_NSPredicateUtilities _getITypeFor:]( (uint64_t)_NSPredicateUtilities,  (_BYTE *)[a3 objCType]);
  if (v4 == 1) {
    return a3;
  }
  if (v4 == 2)
  {
    uint64_t v5 = [a3 longLongValue];
    if ((v5 & 0x8000000000000000LL) == 0) {
      return a3;
    }
    return +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", -v5);
  }

  else
  {
    [a3 doubleValue];
    return +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", fabs(v7));
  }

+ (id)trunc:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  if ((_NSIsNSNumber() & 1) == 0)
  {
    double v6 = (void *)MEMORY[0x189603F70];
    uint64_t v7 = *MEMORY[0x189603A60];
    id v8 = a3;
    uint64_t v9 = @"Parameters";
    v10[0] = [MEMORY[0x189603F18] arrayWithObjects:&v8 count:1];
    objc_exception_throw((id)objc_msgSend( v6,  "exceptionWithName:reason:userInfo:",  v7,  @"mathematical functions require NSNumber parameters",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1)));
  }

  [a3 doubleValue];
  return +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", trunc(v4));
}

+ (void)_doTokenization:(const __CFLocale *)a3 locale:
{
  BOOL v5 = a3 == 0LL;
  uint64_t v15 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  v16.length = -[__CFString length](a2, "length");
  v16.location = 0LL;
  double v6 = CFStringTokenizerCreate((CFAllocatorRef)*MEMORY[0x189604DB0], a2, v16, 4LL * v5, a3);
  CFStringTokenizerTokenType Token = CFStringTokenizerAdvanceToNextToken(v6);
  id v8 = (void *)[MEMORY[0x189603FE0] set];
  uint64_t v9 = +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet");
  if (Token)
  {
    id v10 = v9;
    do
    {
      CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v6);
      if (CurrentTokenRange.location != -1)
      {
        id v12 = (void *)-[__CFString substringWithRange:]( a2,  "substringWithRange:",  CurrentTokenRange.location,  CurrentTokenRange.length);
        unsigned __int16 v14 = 0;
        objc_msgSend(v12, "getCharacters:range:", &v14, 0, 1);
      }
    }

    while (CFStringTokenizerAdvanceToNextToken(v6));
  }

  CFRelease(v6);
  return v8;
}

+ (void)_processAndTokenize:(uint64_t)a3 flags:(const __CFLocale *)a4 locale:
{
  if (!a3) {
    return +[_NSPredicateUtilities _doTokenization:locale:]((uint64_t)&OBJC_CLASS____NSPredicateUtilities, a2, a4);
  }
  uint64_t v7 = +[_NSPredicateOperatorUtilities newStringFrom:usingUnicodeTransforms:]( &OBJC_CLASS____NSPredicateOperatorUtilities,  "newStringFrom:usingUnicodeTransforms:",  a2,  a3);
  id v8 = +[_NSPredicateUtilities _doTokenization:locale:]((uint64_t)&OBJC_CLASS____NSPredicateUtilities, v7, a4);

  return v8;
}

+ (void)_collapseAndTokenize:(uint64_t)a3 flags:(void *)a4 locale:
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  uint64_t v7 = [a2 countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (!v7) {
    return 0LL;
  }
  uint64_t v8 = v7;
  uint64_t v9 = 0LL;
  uint64_t v10 = *(void *)v17;
  do
  {
    for (uint64_t i = 0LL; i != v8; ++i)
    {
      if (*(void *)v17 != v10) {
        objc_enumerationMutation(a2);
      }
      id v12 = *(__CFString **)(*((void *)&v16 + 1) + 8 * i);
      if (!_NSIsNSString())
      {

        objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"Unable to tokenize : %@", v12), 0 reason userInfo]);
      }

      unint64_t v13 = +[_NSPredicateUtilities _processAndTokenize:flags:locale:]( (uint64_t)&OBJC_CLASS____NSPredicateUtilities,  v12,  a3,  (const __CFLocale *)a4);
      if (v9) {
        [v9 unionSet:v13];
      }
      else {
        uint64_t v9 = v13;
      }
    }

    uint64_t v8 = [a2 countByEnumeratingWithState:&v16 objects:v15 count:16];
  }

  while (v8);
  return v9;
}

+ (id)tokenize:(id)a3 using:(id)a4
{
  if ([a4 rangeOfString:@"n"] != 0x7FFFFFFFFFFFFFFFLL
    || [a4 rangeOfString:@"N"] != 0x7FFFFFFFFFFFFFFFLL)
  {
    goto LABEL_9;
  }

  if ([a4 rangeOfString:@"c"] == 0x7FFFFFFFFFFFFFFFLL
    && [a4 rangeOfString:@"C"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([a4 rangeOfString:@"d"] == 0x7FFFFFFFFFFFFFFFLL
      && [a4 rangeOfString:@"D"] == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([a4 rangeOfString:@"l"] != 0x7FFFFFFFFFFFFFFFLL
        || [a4 rangeOfString:@"L"] != 0x7FFFFFFFFFFFFFFFLL)
      {
        double v6 = +[_NSPredicateOperatorUtilities retainedLocale]( &OBJC_CLASS____NSPredicateOperatorUtilities,  "retainedLocale");
        goto LABEL_10;
      }

+ (id)uppercase:(id)a3
{
  if ((_NSIsNSString() & 1) != 0) {
    return (id)[a3 uppercaseString];
  }
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Can't uppercase non-string" userInfo:0]);
  return +[_NSPredicateUtilities lowercase:](v5, v6, v7);
}

+ (id)lowercase:(id)a3
{
  if ((_NSIsNSString() & 1) != 0) {
    return (id)[a3 lowercaseString];
  }
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Can't lowercase non-string" userInfo:0]);
  return +[_NSPredicateUtilities length:](v5, v6, v7);
}

+ (id)length:(id)a3
{
  if ((_NSIsNSString() & 1) != 0) {
    return +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [a3 length]);
  }
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Can't apply length: to a non-string" userInfo:0]);
  return (id)+[_NSPredicateUtilities _convertStringToNumber:]();
}

+ (NSNumber)_convertStringToNumber:(uint64_t)a1
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  uint64_t v3 = (const char *)[a2 UTF8String];
  uint64_t v8 = 0LL;
  if (strchr(v3, 46))
  {
    double v4 = strtod_l(v3, &v8, 0LL);
    if (!v8
      || v8 == v3
      || *v8
      || (uint64_t result = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v4)) == 0LL)
    {
LABEL_10:
      id v7 = +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  a2,  v4,  v8,  v9);
      if (-[NSDecimalNumber isEqual:]( v7,  "isEqual:",  +[NSDecimalNumber notANumber](&OBJC_CLASS___NSDecimalNumber, "notANumber")))
      {
        return 0LL;
      }

      else
      {
        return (NSNumber *)v7;
      }
    }
  }

  else
  {
    uint64_t v6 = strtoll_l(v3, &v8, 0, 0LL);
    if (!v8) {
      goto LABEL_10;
    }
    if (v8 == v3) {
      goto LABEL_10;
    }
    if (*v8) {
      goto LABEL_10;
    }
    uint64_t result = +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v6);
    if (!result) {
      goto LABEL_10;
    }
  }

  return result;
}

+ (id)castObject:(id)a3 toType:(id)a4
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  if (!a4) {
    return a3;
  }
  if ([@"Class" isEqualToString:a4])
  {
    objc_opt_self();
    uint64_t v6 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v33 = a3;
      _os_log_fault_impl( &dword_182EB1000,  v6,  OS_LOG_TYPE_FAULT,  "NSPredicate: Using NSExpression CAST(x,'Class') is deprecated and will be removed in a future release.  '%{publi c}@' should not be cast into a Class object",  buf,  0xCu);
    }

    objc_opt_self();
    if ((_CFPredicatePolicyData_getFlags() & 8) != 0) {
      +[_NSPredicateUtilities _predicateSecurityAction]();
    }
    if ([a3 isNSString])
    {
      objc_opt_self();
      if (![(id)_CFPredicatePolicyRestrictedClasses() objectForKey:a3])
      {
        id v7 = NSClassFromString((NSString *)a3);
        if (v7)
        {
          objc_opt_self();
          if (![*(id *)(_CFPredicatePolicyData() + 16) objectForKey:a3])
          {
            Superclass = class_getSuperclass(v7);
            if (Superclass)
            {
              uint64_t v9 = -[NSString initWithUTF8String:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithUTF8String:",  class_getName(Superclass));
              objc_opt_self();
              uint64_t v10 = [(id)_CFPredicatePolicyRestrictedClasses() objectForKey:v9];

              if (v10) {
                +[_NSPredicateUtilities _predicateSecurityAction]();
              }
            }
          }
        }

        return v7;
      }

      +[_NSPredicateUtilities _predicateSecurityAction]();
    }

    id v26 = (void *)MEMORY[0x189603F70];
    uint64_t v27 = *MEMORY[0x189603A58];
    uint64_t v23 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot cast non string value \"%@\"",  a3);
    id v24 = v26;
    goto LABEL_57;
  }

  if (([a4 isNSString] & 1) == 0)
  {
    __int128 v28 = (void *)MEMORY[0x189603F70];
    uint64_t v27 = *MEMORY[0x189603A58];
    __int128 v29 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot cast to unknown class \"%@\"",  a4);
LABEL_56:
    uint64_t v23 = v29;
    id v24 = v28;
LABEL_57:
    uint64_t v25 = v27;
    goto LABEL_58;
  }

  id v11 = (NSString *)[a4 description];
  objc_opt_self();
  if (![*(id *)(_CFPredicatePolicyData() + 16) objectForKey:v11])
  {
    objc_opt_self();
    SEL v12 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v33 = a4;
      __int16 v34 = 2114;
      id v35 = a3;
      __int16 v36 = 2114;
      id v37 = a4;
      _os_log_fault_impl( &dword_182EB1000,  v12,  OS_LOG_TYPE_FAULT,  "NSPredicate: Using NSExpression CAST(x,'%{public}@') is deprecated and will be removed in a future release.  '%{ public}@' should not be cast into the unknown type '%{public}@'",  buf,  0x20u);
    }

    objc_opt_self();
    if ((_CFPredicatePolicyData_getFlags() & 8) != 0) {
      +[_NSPredicateUtilities _predicateSecurityAction]();
    }
  }

  Class v13 = NSClassFromString(v11);
  if (!v13)
  {
    __int128 v28 = (void *)MEMORY[0x189603F70];
    uint64_t v27 = *MEMORY[0x189603A58];
    __int128 v29 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot cast to class %@ which does not exist",  a4);
    goto LABEL_56;
  }

  unsigned __int16 v14 = v13;
  if (-[objc_class isSubclassOfClass:](v14, "isSubclassOfClass:", objc_opt_self()))
  {
    if (_NSIsNSNumber())
    {
      __int128 v16 = (void *)MEMORY[0x189603F50];
      [a3 doubleValue];
      return (id)objc_msgSend(v16, "dateWithTimeIntervalSinceReferenceDate:");
    }

    if ((_NSIsNSDate() & 1) != 0) {
      return a3;
    }
  }

  else if (-[objc_class isSubclassOfClass:](v14, "isSubclassOfClass:", objc_opt_self()))
  {
    id v7 = +[NSDecimalNumber decimalNumberWithString:]( NSDecimalNumber,  "decimalNumberWithString:",  [a3 description]);
    if ((-[objc_class isEqual:]( v7,  "isEqual:",  +[NSDecimalNumber notANumber](&OBJC_CLASS___NSDecimalNumber, "notANumber")) & 1) == 0) {
      return v7;
    }
  }

  else
  {
    if (!-[objc_class isSubclassOfClass:](v14, "isSubclassOfClass:", objc_opt_self()))
    {
      if (-[objc_class isSubclassOfClass:](v14, "isSubclassOfClass:", objc_opt_self()))
      {
        __int128 v18 = -[NSSymbolicExpression initWithString:]( [NSSymbolicExpression alloc],  "initWithString:",  [a3 description]);
      }

      else
      {
        if (!class_respondsToSelector(v14, sel_initWithString_)) {
          goto LABEL_51;
        }
        objc_opt_self();
        __int128 v19 = (os_log_s *)_NSOSLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543874;
          id v33 = a4;
          __int16 v34 = 2114;
          id v35 = a3;
          __int16 v36 = 2114;
          id v37 = a4;
          _os_log_fault_impl( &dword_182EB1000,  v19,  OS_LOG_TYPE_FAULT,  "NSPredicate: Using NSExpression CAST(x,'%{public}@') is deprecated and will be removed in a future release. '%{public}@' should not be cast into type '%{public}@' through initWithString",  buf,  0x20u);
        }

        objc_opt_self();
        if ((_CFPredicatePolicyData_getFlags() & 8) != 0) {
          +[_NSPredicateUtilities _predicateSecurityAction]();
        }
        uint64_t v20 = (NSSymbolicExpression *)NSAllocateObject(v14, 0LL, 0LL);
        -[NSSymbolicExpression initWithString:](v20, "initWithString:", [a3 description]);
        __int128 v18 = v20;
      }

      return v18;
    }

    if (_NSIsNSDate())
    {
      [a3 timeIntervalSinceReferenceDate];
      return +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
    }

    if (_NSIsNSString())
    {
      id v7 = (objc_class *)+[_NSPredicateUtilities _convertStringToNumber:]( (uint64_t)&OBJC_CLASS____NSPredicateUtilities,  a3);
      if (v7) {
        return v7;
      }
    }

    else if ((_NSIsNSNumber() & 1) != 0)
    {
      return a3;
    }
  }

+ (id)random
{
  if ((_nspredicaterandomnumberseeded & 1) == 0)
  {
    srandomdev();
    _nspredicaterandomnumberseeded = 1;
  }

  return +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)random() * 4.65661287e-10);
}

+ (id)randomn:(id)a3
{
  if ((_nspredicaterandomnumberseeded & 1) == 0)
  {
    srandomdev();
    _nspredicaterandomnumberseeded = 1;
  }

  return +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  random() % [a3 longValue]);
}

+ (id)objectFrom:(id)a3 withIndex:(id)a4
{
  if ((_NSIsNSArray() & 1) != 0 || _NSIsNSOrderedSet())
  {
    if (_NSIsNSNumber())
    {
      uint64_t v6 = [a4 integerValue];
      id v7 = a3;
      return (id)[v7 objectAtIndex:v6];
    }

    objc_opt_self();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v9 = [a4 constantValue];
      if (![@"FIRST" caseInsensitiveCompare:v9])
      {
        if ([a3 count])
        {
          id v7 = a3;
          uint64_t v6 = 0LL;
          return (id)[v7 objectAtIndex:v6];
        }

        return 0LL;
      }

      if (![@"LAST" caseInsensitiveCompare:v9]) {
        return (id)[a3 lastObject];
      }
LABEL_14:
      uint64_t v10 = v9;
LABEL_15:
      if (![@"SIZE" caseInsensitiveCompare:v10]) {
        return +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", [a3 count]);
      }
      id v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"The index %@ is NOT appropriate for a collection of type: %@",  a4,  objc_opt_class());
      goto LABEL_27;
    }

    id v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"The symbolic index %@ is unknown.",  a4,  v21);
  }

  else
  {
    if (_NSIsNSSet())
    {
      objc_opt_self();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        return (id)[a3 member:a4];
      }
      uint64_t v9 = [a4 constantValue];
      if (![@"FIRST" caseInsensitiveCompare:v9]
        || ![@"LAST" caseInsensitiveCompare:v9])
      {
        return (id)[a3 anyObject];
      }

      goto LABEL_14;
    }

    if (_NSIsNSDictionary())
    {
      objc_opt_self();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v12 = [a4 constantValue];
        Class v13 = (void *)[a3 allKeys];
        if ([@"FIRST" caseInsensitiveCompare:v12])
        {
          if ([@"LAST" caseInsensitiveCompare:v12])
          {
            uint64_t v10 = v12;
            goto LABEL_15;
          }

          uint64_t v16 = [v13 lastObject];
        }

        else
        {
          if (![v13 count]) {
            return 0LL;
          }
          uint64_t v16 = [v13 objectAtIndex:0];
        }

        id v15 = (id)v16;
        id v14 = a3;
      }

      else
      {
        id v14 = a3;
        id v15 = a4;
      }

      return (id)[v14 objectForKey:v15];
    }

    id v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"The object %@ is NOT a collection.  Cannot retrieve item at index: %@",  a3,  a4);
  }

+ (id)now
{
  return (id)[MEMORY[0x189603F50] date];
}

+ (id)distanceToLocation:(id)a3 fromLocation:(id)a4
{
  if (objc_lookUpClass("CLLocation"))
  {
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass() & 1) != 0)
    {
      [a3 distanceFromLocation:a4];
      return +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
    }

    id v7 = (void *)MEMORY[0x189603F70];
    uint64_t v8 = *MEMORY[0x189603A60];
    uint64_t v9 = @"Can't calculate distance between non-locations";
  }

  else
  {
    id v7 = (void *)MEMORY[0x189603F70];
    uint64_t v8 = *MEMORY[0x189603A58];
    uint64_t v9 = @"Can't calculate distance unless CLLocation is linked.";
  }

  objc_exception_throw((id)[v7 exceptionWithName:v8 reason:v9 userInfo:0]);
  return +[_NSPredicateUtilities canonical:](v10, v11, v12);
}

+ (id)canonical:(id)a3
{
  if ((_NSIsNSString() & 1) != 0) {
    return  +[_NSPredicateOperatorUtilities newStringFrom:usingUnicodeTransforms:]( &OBJC_CLASS____NSPredicateOperatorUtilities,  "newStringFrom:usingUnicodeTransforms:",  a3,  387LL);
  }
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Can't canonicalize non-strings" userInfo:0]);
  return +[_NSPredicateUtilities bitwiseAnd:with:](v5, v6, v7, v8);
}

+ (id)bitwiseAnd:(id)a3 with:(id)a4
{
  if (_NSIsNSNumber() && (_NSIsNSNumber() & 1) != 0) {
    return +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [a4 integerValue] & objc_msgSend(a3, "integerValue"));
  }
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Can't do bit operators on non-numbers" userInfo:0]);
  return +[_NSPredicateUtilities bitwiseOr:with:](v7, v8, v9, v10);
}

+ (id)bitwiseOr:(id)a3 with:(id)a4
{
  if (_NSIsNSNumber() && (_NSIsNSNumber() & 1) != 0) {
    return +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [a4 integerValue] | objc_msgSend(a3, "integerValue"));
  }
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Can't do bit operators on non-numbers" userInfo:0]);
  return +[_NSPredicateUtilities bitwiseXor:with:](v7, v8, v9, v10);
}

+ (id)bitwiseXor:(id)a3 with:(id)a4
{
  if (_NSIsNSNumber() && (_NSIsNSNumber() & 1) != 0) {
    return +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [a4 integerValue] ^ objc_msgSend(a3, "integerValue"));
  }
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Can't do bit operators on non-numbers" userInfo:0]);
  return +[_NSPredicateUtilities leftshift:by:](v7, v8, v9, v10);
}

+ (id)leftshift:(id)a3 by:(id)a4
{
  if (_NSIsNSNumber() && (_NSIsNSNumber() & 1) != 0) {
    return +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [a3 integerValue] << objc_msgSend(a4, "integerValue"));
  }
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Can't do bit operators on non-numbers" userInfo:0]);
  return +[_NSPredicateUtilities rightshift:by:](v7, v8, v9, v10);
}

+ (id)rightshift:(id)a3 by:(id)a4
{
  if (_NSIsNSNumber() && (_NSIsNSNumber() & 1) != 0) {
    return +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [a3 integerValue] >> objc_msgSend(a4, "integerValue"));
  }
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Can't do bit operators on non-numbers" userInfo:0]);
  return +[_NSPredicateUtilities onesComplement:](v7, v8, v9);
}

+ (id)onesComplement:(id)a3
{
  if ((_NSIsNSNumber() & 1) != 0) {
    return +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  ~[a3 integerValue]);
  }
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Can't do bit operators on non-numbers" userInfo:0]);
  return +[_NSPredicateUtilities noindex:](v5, v6, v7);
}

+ (id)noindex:(id)a3
{
  return a3;
}

+ (id)indexed:(id)a3 by:(id)a4
{
  return a3;
}

+ (id)distinct:(id)a3
{
  return +[_NSPredicateUtilities inverseOrderKey:](v3, v4, v5);
}

+ (id)inverseOrderKey:(id)a3
{
  return (id)+[_NSPredicateUtilities _isReservedWordInParser:](v3, v4, v5);
}

+ (BOOL)_isReservedWordInParser:(id)a3
{
  if ((_qfqp2_InitializedGlobals & 1) == 0) {
    _qfqp2_InitializedGlobalData();
  }
  return objc_msgSend((id)_qfqp2_ReservedWords, "containsObject:", objc_msgSend(a3, "uppercaseString"));
}

+ (NSString)_parserableStringDescription:(uint64_t)a1
{
  id v3 = +[NSString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", a2);
  -[NSMutableString replaceOccurrencesOfString:withString:options:range:]( v3,  "replaceOccurrencesOfString:withString:options:range:",  @"\,  @"\\\,  2LL,  0LL,  -[NSString length](v3, "length"));
  -[NSMutableString replaceOccurrencesOfString:withString:options:range:]( v3,  "replaceOccurrencesOfString:withString:options:range:",  @",  @"\\,  2LL,  0LL,  -[NSString length](v3, "length"));
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"\"%@\"", v3);
}

+ (NSString)_parserableDateDescription:(uint64_t)a1
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"CAST(%f, NSDate)", v3);
}

+ (NSString)_parserableCollectionDescription:(uint64_t)a1
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  if (!a2) {
    return (NSString *)@"nil";
  }
  if (_NSIsNSString()) {
    return +[_NSPredicateUtilities _parserableStringDescription:]( (uint64_t)&OBJC_CLASS____NSPredicateUtilities,  (uint64_t)a2);
  }
  if (_NSIsNSDictionary())
  {
    id v5 = a2;
    uint64_t v6 = [a2 allKeys];
    a2 = (void *)v6;
LABEL_11:
    SEL v4 = +[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 50LL);
    -[NSMutableString appendString:](v4, "appendString:", @"{");
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    uint64_t v7 = [a2 countByEnumeratingWithState:&v14 objects:v13 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      char v9 = 0;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(a2);
          }
          uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * v11);
          if ((v9 & 1) != 0) {
            -[NSMutableString appendString:](v4, "appendString:", @", ");
          }
          -[NSMutableString appendString:]( v4,  "appendString:",  +[_NSPredicateUtilities _parserableCollectionDescription:](&OBJC_CLASS____NSPredicateUtilities, v12));
          if (v6)
          {
            -[NSMutableString appendString:](v4, "appendString:", @" = ");
            -[NSMutableString appendString:]( v4,  "appendString:",  +[_NSPredicateUtilities _parserableCollectionDescription:]( _NSPredicateUtilities,  [v5 objectForKey:v12]));
          }

          ++v11;
          char v9 = 1;
        }

        while (v8 != v11);
        uint64_t v8 = [a2 countByEnumeratingWithState:&v14 objects:v13 count:16];
      }

      while (v8);
    }

    -[NSMutableString appendString:](v4, "appendString:", @"}");
    return (NSString *)v4;
  }

  if ((_NSIsNSArray() & 1) != 0)
  {
    uint64_t v6 = 0LL;
    id v5 = a2;
    goto LABEL_11;
  }

  if (_NSIsNSSet())
  {
    id v5 = a2;
    a2 = (void *)[a2 allObjects];
    uint64_t v6 = 0LL;
    goto LABEL_11;
  }

  return (NSString *)[a2 description];
}

+ (id)_predicateClassesForSecureCoding
{
  if (qword_18C496D30 != -1) {
    dispatch_once(&qword_18C496D30, &__block_literal_global_59);
  }
  return (id)_MergedGlobals_133;
}

+ (id)_compoundPredicateClassesForSecureCoding
{
  if (qword_18C496D40 != -1) {
    dispatch_once(&qword_18C496D40, &__block_literal_global_138_0);
  }
  return (id)qword_18C496D38;
}

+ (id)_expressionClassesForSecureCoding
{
  if (qword_18C496D50 != -1) {
    dispatch_once(&qword_18C496D50, &__block_literal_global_139);
  }
  return (id)qword_18C496D48;
}

+ (id)_extendedExpressionClassesForSecureCoding
{
  if (qword_18C496D60 != -1) {
    dispatch_once(&qword_18C496D60, &__block_literal_global_153);
  }
  return (id)qword_18C496D58;
}

+ (id)_operatorClassesForSecureCoding
{
  if (qword_18C496D70 != -1) {
    dispatch_once(&qword_18C496D70, &__block_literal_global_154);
  }
  return (id)qword_18C496D68;
}

+ (id)_constantValueClassesForSecureCoding
{
  if (qword_18C496D80 != -1) {
    dispatch_once(&qword_18C496D80, &__block_literal_global_166);
  }
  return (id)qword_18C496D78;
}

@end
@interface _CSVisualizerPredicate
+ (BOOL)operatorIsNumeric:(unint64_t)a3;
+ (id)constantValueForExpression:(id)a3;
+ (id)predicateWithFormatString:(id)a3 error:(id *)a4;
+ (id)translateNSPredicate:(id)a3 error:(id *)a4;
+ (void)getRanges:(void *)a3 matchingPredicate:(id)a4 inDescription:(id)a5;
- (BOOL)evaluateNumerically:(id)a3;
- (BOOL)evaluateWithObject:(id)a3;
- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4;
- (BOOL)getRanges:(void *)a3 inDescription:(id)a4 options:(unint64_t)a5 limit:(unint64_t)a6 searchedInRange:(_NSRange *)a7;
- (_CSVisualizerPredicate)initWithExpression:(id)a3;
- (_CSVisualizerPredicate)initWithSearchString:(id)a3 forTitle:(id)a4 operator:(unint64_t)a5 error:(id *)a6;
- (_CSVisualizerPredicate)initWithSearchString:(id)a3 operator:(unint64_t)a4 error:(id *)a5;
- (id)debugDescription;
- (id)predicateFormat;
@end

@implementation _CSVisualizerPredicate

- (_CSVisualizerPredicate)initWithExpression:(id)a3
{
  id v4 = a3;
  [(id)objc_opt_class() constantValueForExpression:v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[_CSVisualizerPredicate initWithSearchString:operator:error:]( self,  "initWithSearchString:operator:error:",  v5,  99LL,  0LL);
  }

  else
  {

    v6 = 0LL;
  }

  return v6;
}

- (_CSVisualizerPredicate)initWithSearchString:(id)a3 operator:(unint64_t)a4 error:(id *)a5
{
  return -[_CSVisualizerPredicate initWithSearchString:forTitle:operator:error:]( self,  "initWithSearchString:forTitle:operator:error:",  a3,  0LL,  a4,  a5);
}

- (_CSVisualizerPredicate)initWithSearchString:(id)a3 forTitle:(id)a4 operator:(unint64_t)a5 error:(id *)a6
{
  v40[6] = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS____CSVisualizerPredicate;
  v12 = -[_CSVisualizerPredicate init](&v34, sel_init);
  if (!v12)
  {
    v24 = (void *)MEMORY[0x189607870];
    v35[0] = *MEMORY[0x189607490];
    v35[1] = @"Line";
    v36[0] = @"mFulErr";
    v36[1] = &unk_189D69BB0;
    uint64_t v25 = *MEMORY[0x1896075F0];
    v36[2] = @"Failed to allocate NSPredicate instance.";
    v35[2] = v25;
    v35[3] = @"Operator";
    [MEMORY[0x189607968] numberWithUnsignedInteger:a5];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v36[3] = v26;
    v36[4] = v10;
    v35[4] = @"SearchString";
    v35[5] = @"Title";
    v36[5] = v11;
    [MEMORY[0x189603F68] dictionaryWithObjects:v36 forKeys:v35 count:6];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v28 = [v24 errorWithDomain:*MEMORY[0x189607670] code:-41 userInfo:v27];
LABEL_8:
    id v17 = (id)v28;

    if (a6)
    {
      id v17 = v17;
      v12 = 0LL;
      *a6 = v17;
    }

    else
    {
      v12 = 0LL;
    }

    goto LABEL_11;
  }

  uint64_t v13 = [v10 copy];
  searchString = v12->_searchString;
  v12->_searchString = (NSString *)v13;

  uint64_t v15 = [v11 copy];
  title = v12->_title;
  v12->_title = (NSString *)v15;

  id v17 = 0LL;
  v12->_operator = a5;
  if (a5 - 4 >= 6 && a5 != 99)
  {
    if (v11)
    {
      if ([(id)objc_opt_class() operatorIsNumeric:a5])
      {
        [MEMORY[0x189607858] decimalNumberWithString:v10];
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        id v19 = objc_alloc(MEMORY[0x189607818]);
        [MEMORY[0x189607878] expressionForVariable:@"HAYSTACK"];
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        [MEMORY[0x189607878] expressionForConstantValue:v18];
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v22 = [v19 initWithLeftExpression:v20 rightExpression:v21 modifier:0 type:a5 options:0];
        numericPredicate = v12->_numericPredicate;
        v12->_numericPredicate = (NSPredicate *)v22;

        id v17 = 0LL;
        goto LABEL_11;
      }

      v32 = (void *)MEMORY[0x189607870];
      v39[0] = *MEMORY[0x189607490];
      v39[1] = @"Line";
      v40[0] = @"kCSStorePredicateErr";
      v40[1] = &unk_189D69B80;
      uint64_t v33 = *MEMORY[0x1896075F0];
      v40[2] = @"Unsupported operator type.";
      v39[2] = v33;
      v39[3] = @"Operator";
      [MEMORY[0x189607968] numberWithUnsignedInteger:a5];
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v40[3] = v26;
      v40[4] = v10;
      v39[4] = @"SearchString";
      v39[5] = @"Title";
      v40[5] = v11;
      [MEMORY[0x189603F68] dictionaryWithObjects:v40 forKeys:v39 count:6];
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v28 = [v32 errorWithDomain:*MEMORY[0x189607670] code:-9495 userInfo:v27];
    }

    else
    {

      v30 = (void *)MEMORY[0x189607870];
      v37[0] = *MEMORY[0x189607490];
      v37[1] = @"Line";
      v38[0] = @"kCSStorePredicateErr";
      v38[1] = &unk_189D69B98;
      uint64_t v31 = *MEMORY[0x1896075F0];
      v38[2] = @"Unsupported operator type.";
      v37[2] = v31;
      v37[3] = @"Operator";
      [MEMORY[0x189607968] numberWithUnsignedInteger:a5];
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v37[4] = @"SearchString";
      v38[3] = v26;
      v38[4] = v10;
      [MEMORY[0x189603F68] dictionaryWithObjects:v38 forKeys:v37 count:5];
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v28 = [v30 errorWithDomain:*MEMORY[0x189607670] code:-9495 userInfo:v27];
    }

    goto LABEL_8;
  }

- (BOOL)evaluateNumerically:(id)a3
{
  v25[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = v4;
  title = self->_title;
  if (title)
  {
    uint64_t v8 = +[_CSVisualizer rangeOfValueForTitle:inDescription:]( &OBJC_CLASS____CSVisualizer,  "rangeOfValueForTitle:inDescription:",  title,  v4);
  }

  else
  {
    uint64_t v7 = [v4 length];
    uint64_t v8 = 0LL;
  }

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v5, "attributedSubstringFromRange:", v8, v7);
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 attribute:@"_CSVNum" atIndex:0 effectiveRange:0];
    if (!v11)
    {
      id v16 = objc_alloc(MEMORY[0x189607A08]);
      [v10 string];
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)[v16 initWithString:v17];

      [v14 setCaseSensitive:0];
      uint64_t v23 = 0LL;
      __int128 v21 = 0uLL;
      int v22 = 0;
      if ([v14 scanString:@"0x" intoString:0]
        && [v14 scanHexLongLong:&v23])
      {
        uint64_t v18 = [MEMORY[0x189607968] numberWithUnsignedLongLong:v23];
      }

      else
      {
        if (([v14 scanDecimal:&v21] & 1) == 0)
        {
          BOOL v9 = 0;
          goto LABEL_8;
        }

        __int128 v19 = v21;
        int v20 = v22;
        uint64_t v18 = [MEMORY[0x189607858] decimalNumberWithDecimal:&v19];
      }

      uint64_t v11 = v18;

      if (!v11)
      {
        BOOL v9 = 0;
        goto LABEL_9;
      }
    }

    numericPredicate = self->_numericPredicate;
    v24 = @"HAYSTACK";
    v25[0] = v11;
    [MEMORY[0x189603F68] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v9 = -[NSPredicate evaluateWithObject:substitutionVariables:]( numericPredicate,  "evaluateWithObject:substitutionVariables:",  0LL,  v13);

    v14 = (void *)v11;
LABEL_8:

LABEL_9:
    goto LABEL_10;
  }

  BOOL v9 = 0;
LABEL_10:

  return v9;
}

- (BOOL)getRanges:(void *)a3 inDescription:(id)a4 options:(unint64_t)a5 limit:(unint64_t)a6 searchedInRange:(_NSRange *)a7
{
  v69[2] = *MEMORY[0x1895F89C0];
  id v12 = a4;
  context = (void *)MEMORY[0x186E27B50]();
  uint64_t v13 = self->_searchString;
  [v12 string];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = v14;
  title = self->_title;
  if (title)
  {
    NSUInteger v17 = +[_CSVisualizer rangeOfValueForTitle:inDescription:]( &OBJC_CLASS____CSVisualizer,  "rangeOfValueForTitle:inDescription:",  title,  v12);
    NSUInteger v19 = v18;
    BOOL v20 = v17 != 0x7FFFFFFFFFFFFFFFLL;
  }

  else
  {
    NSUInteger v19 = [v14 length];
    NSUInteger v17 = 0LL;
    BOOL v20 = 1;
  }

  BOOL v66 = v20;
  if (a7)
  {
    a7->location = v17;
    a7->length = v19;
  }

  if (v15 && v17 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_numericPredicate)
    {
      if (-[_CSVisualizerPredicate evaluateNumerically:](self, "evaluateNumerically:", v12))
      {
        int v22 = (NSUInteger *)*((void *)a3 + 1);
        unint64_t v21 = *((void *)a3 + 2);
        if ((unint64_t)v22 >= v21)
        {
          v49 = *(NSUInteger **)a3;
          uint64_t v50 = ((uint64_t)v22 - *(void *)a3) >> 4;
          unint64_t v51 = v50 + 1;
          uint64_t v52 = v21 - (void)v49;
          if (v52 >> 3 > v51) {
            unint64_t v51 = v52 >> 3;
          }
          BOOL v44 = (unint64_t)v52 >= 0x7FFFFFFFFFFFFFF0LL;
          unint64_t v53 = 0xFFFFFFFFFFFFFFFLL;
          if (!v44) {
            unint64_t v53 = v51;
          }
          if (v53)
          {
            unint64_t v53 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<NSString *,objc_object *>>>(v53);
            v49 = *(NSUInteger **)a3;
            int v22 = (NSUInteger *)*((void *)a3 + 1);
          }

          else
          {
            uint64_t v54 = 0LL;
          }

          v55 = (NSUInteger *)(v53 + 16 * v50);
          unint64_t v56 = v53 + 16 * v54;
          NSUInteger *v55 = v17;
          v55[1] = v19;
          uint64_t v23 = v55 + 2;
          if (v22 != v49)
          {
            do
            {
              *((_OWORD *)v55 - 1) = *((_OWORD *)v22 - 1);
              v55 -= 2;
              v22 -= 2;
            }

            while (v22 != v49);
            v49 = *(NSUInteger **)a3;
          }

          *(void *)a3 = v55;
          *((void *)a3 + 1) = v23;
          *((void *)a3 + 2) = v56;
          if (v49) {
            operator delete(v49);
          }
        }

        else
        {
          *int v22 = v17;
          v22[1] = v19;
          uint64_t v23 = v22 + 2;
        }

        *((void *)a3 + 1) = v23;
      }
    }

    else if ((self->_operator & 0xFFFFFFFFFFFFFFFELL) == 6)
    {
      if (-[_CSVisualizerPredicate getRanges:inDescription:options:limit:searchedInRange:]::once != -1) {
        dispatch_once( &-[_CSVisualizerPredicate getRanges:inDescription:options:limit:searchedInRange:]::once,  &__block_literal_global_205);
      }
      if (self->_operator == 7) {
        v24 = &-[_CSVisualizerPredicate getRanges:inDescription:options:limit:searchedInRange:]::likePredicate;
      }
      else {
        v24 = &-[_CSVisualizerPredicate getRanges:inDescription:options:limit:searchedInRange:]::matchesPredicate;
      }
      id v25 = (id)*v24;
      v68[0] = @"HAYSTACK";
      objc_msgSend(v15, "substringWithRange:", v17, v19);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v68[1] = @"NEEDLE";
      v69[0] = v26;
      v69[1] = v13;
      [MEMORY[0x189603F68] dictionaryWithObjects:v69 forKeys:v68 count:2];
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if ([v25 evaluateWithObject:0 substitutionVariables:v27])
      {
        v29 = (NSUInteger *)*((void *)a3 + 1);
        unint64_t v28 = *((void *)a3 + 2);
        if ((unint64_t)v29 >= v28)
        {
          v57 = *(NSUInteger **)a3;
          uint64_t v58 = ((uint64_t)v29 - *(void *)a3) >> 4;
          unint64_t v59 = v58 + 1;
          uint64_t v60 = v28 - (void)v57;
          if (v60 >> 3 > v59) {
            unint64_t v59 = v60 >> 3;
          }
          BOOL v44 = (unint64_t)v60 >= 0x7FFFFFFFFFFFFFF0LL;
          unint64_t v61 = 0xFFFFFFFFFFFFFFFLL;
          if (!v44) {
            unint64_t v61 = v59;
          }
          if (v61)
          {
            unint64_t v61 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<NSString *,objc_object *>>>(v61);
            v57 = *(NSUInteger **)a3;
            v29 = (NSUInteger *)*((void *)a3 + 1);
          }

          else
          {
            uint64_t v62 = 0LL;
          }

          v63 = (NSUInteger *)(v61 + 16 * v58);
          unint64_t v64 = v61 + 16 * v62;
          NSUInteger *v63 = v17;
          v63[1] = v19;
          v30 = v63 + 2;
          if (v29 != v57)
          {
            do
            {
              *((_OWORD *)v63 - 1) = *((_OWORD *)v29 - 1);
              v63 -= 2;
              v29 -= 2;
            }

            while (v29 != v57);
            v57 = *(NSUInteger **)a3;
          }

          *(void *)a3 = v63;
          *((void *)a3 + 1) = v30;
          *((void *)a3 + 2) = v64;
          if (v57) {
            operator delete(v57);
          }
        }

        else
        {
          NSUInteger *v29 = v17;
          v29[1] = v19;
          v30 = v29 + 2;
        }

        *((void *)a3 + 1) = v30;
      }
    }

    else if (v19)
    {
      unint64_t v31 = a5 | 1;
      NSUInteger v32 = v19 + v17;
      uint64_t v33 = (void *)*((void *)a3 + 1);
      do
      {
        uint64_t v34 = objc_msgSend(v15, "rangeOfString:options:range:", v13, v31, v17, v19);
        uint64_t v36 = v34;
        if (v34 == 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        uint64_t v37 = v35;
        v39 = (uint64_t *)*((void *)a3 + 1);
        unint64_t v38 = *((void *)a3 + 2);
        if ((unint64_t)v39 >= v38)
        {
          v40 = *(uint64_t **)a3;
          uint64_t v41 = ((uint64_t)v39 - *(void *)a3) >> 4;
          unint64_t v42 = v41 + 1;
          uint64_t v43 = v38 - (void)v40;
          if (v43 >> 3 > v42) {
            unint64_t v42 = v43 >> 3;
          }
          BOOL v44 = (unint64_t)v43 >= 0x7FFFFFFFFFFFFFF0LL;
          unint64_t v45 = 0xFFFFFFFFFFFFFFFLL;
          if (!v44) {
            unint64_t v45 = v42;
          }
          if (v45)
          {
            unint64_t v45 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<NSString *,objc_object *>>>(v45);
            v40 = *(uint64_t **)a3;
            v39 = (uint64_t *)*((void *)a3 + 1);
          }

          else
          {
            uint64_t v46 = 0LL;
          }

          v47 = (uint64_t *)(v45 + 16 * v41);
          uint64_t *v47 = v36;
          v47[1] = v37;
          v48 = v47;
          if (v39 != v40)
          {
            do
            {
              *((_OWORD *)v48 - 1) = *((_OWORD *)v39 - 1);
              v48 -= 2;
              v39 -= 2;
            }

            while (v39 != v40);
            v40 = *(uint64_t **)a3;
          }

          uint64_t v33 = v47 + 2;
          *(void *)a3 = v48;
          *((void *)a3 + 1) = v47 + 2;
          *((void *)a3 + 2) = v45 + 16 * v46;
          if (v40) {
            operator delete(v40);
          }
        }

        else
        {
          uint64_t *v39 = v34;
          v39[1] = v35;
          uint64_t v33 = v39 + 2;
        }

        *((void *)a3 + 1) = v33;
        NSUInteger v17 = v36 + v37;
        if (v17 == 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        NSUInteger v19 = v32 - v17;
      }

      while (v32 != v17);
    }
  }

  objc_autoreleasePoolPop(context);
  return v66;
}

- (BOOL)evaluateWithObject:(id)a3
{
  return -[_CSVisualizerPredicate evaluateWithObject:substitutionVariables:]( self,  "evaluateWithObject:substitutionVariables:",  a3,  0LL);
}

- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    __p = operator new(0x10uLL);
    BOOL v20 = __p;
    unint64_t v21 = (char *)__p + 16;
    BOOL v6 = self->_operator == 9;
    __int128 v18 = xmmword_183E2D5D0;
    uint64_t v7 = (CSStore2 *)-[_CSVisualizerPredicate getRanges:inDescription:options:limit:searchedInRange:]( self,  "getRanges:inDescription:options:limit:searchedInRange:",  &__p,  v5,  4LL * v6,  1LL,  &v18);
    if ((_DWORD)v7)
    {
      unint64_t operator = self->_operator;
      switch(operator)
      {
        case 4uLL:
          BOOL v9 = __p;
          if (__p == v20) {
            goto LABEL_22;
          }
          BOOL v10 = *(void *)__p == (void)v18 && *((void *)__p + 1) == *((void *)&v18 + 1);
          goto LABEL_19;
        case 5uLL:
          BOOL v9 = __p;
          if (__p != v20)
          {
            BOOL v11 = 1;
            goto LABEL_28;
          }

          BOOL v11 = *(void *)__p != (void)v18 || *((void *)__p + 1) != *((void *)&v18 + 1);
          goto LABEL_27;
        case 6uLL:
        case 7uLL:
          goto LABEL_11;
        case 8uLL:
          BOOL v9 = __p;
          if (__p == v20) {
            goto LABEL_22;
          }
          uint64_t v12 = *(void *)__p;
          uint64_t v13 = v18;
          goto LABEL_18;
        case 9uLL:
          BOOL v9 = __p;
          if (__p == v20)
          {
LABEL_22:
            BOOL v11 = 0;
            goto LABEL_28;
          }

          uint64_t v12 = *(v20 - 1) + *(v20 - 2);
          uint64_t v13 = *((void *)&v18 + 1) + v18;
LABEL_18:
          BOOL v10 = v12 == v13;
LABEL_19:
          BOOL v11 = v10;
          goto LABEL_27;
        default:
          if (operator == 99 || self->_numericPredicate)
          {
LABEL_11:
            BOOL v9 = __p;
            BOOL v11 = __p != v20;
            goto LABEL_28;
          }

          CSStore2::GetLog(v7);
          v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            unint64_t v17 = self->_operator;
            *(_DWORD *)buf = 67109120;
            int v23 = v17;
            _os_log_error_impl(&dword_183DFE000, v14, OS_LOG_TYPE_ERROR, "Unexpected predicate operator '%u'!", buf, 8u);
          }

          break;
      }
    }

    BOOL v11 = 0;
LABEL_27:
    BOOL v9 = __p;
LABEL_28:
    if (v9)
    {
      BOOL v20 = v9;
      operator delete(v9);
    }
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)predicateFormat
{
  v3 = (void *)MEMORY[0x186E27B50](self, a2);
  if (self->_title) {
    title = (const __CFString *)self->_title;
  }
  else {
    title = @"*";
  }
  [MEMORY[0x189607878] expressionForConstantValue:title];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607878] expressionForConstantValue:self->_searchString];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x189607818]) initWithLeftExpression:v5 rightExpression:v6 modifier:0 type:self->_operator options:0];
  [v7 predicateFormat];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v8;
}

- (id)debugDescription
{
  v3 = (void *)NSString;
  uint64_t v4 = objc_opt_class();
  -[_CSVisualizerPredicate predicateFormat](self, "predicateFormat");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@ %p> { %@ }", v4, self, v5];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
}

+ (id)constantValueForExpression:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (!v3) {
    goto LABEL_5;
  }
  if ([v3 expressionType])
  {
    if ([v4 expressionType] == 3)
    {
      uint64_t v5 = [v4 keyPath];
      goto LABEL_7;
    }

+ (BOOL)operatorIsNumeric:(unint64_t)a3
{
  return a3 < 6 || a3 == 100;
}

+ (id)translateNSPredicate:(id)a3 error:(id *)a4
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  id v39 = a3;
  [MEMORY[0x1896079C8] predicateWithValue:1];
  unint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x1896079C8] predicateWithValue:0];
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v35 = v39;
    [v35 subpredicates];
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v11 count] == 1)
    {
      uint64_t v12 = [v35 compoundPredicateType];

      if (v12)
      {
        [v35 subpredicates];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 objectAtIndexedSubscript:0];
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        id v47 = 0LL;
        [a1 translateNSPredicate:v14 error:&v47];
        id v5 = (id)objc_claimAutoreleasedReturnValue();
        id v6 = v47;
LABEL_33:

        v14 = v13;
        goto LABEL_34;
      }
    }

    else
    {
    }

    [MEMORY[0x189603FA8] array];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    [v35 subpredicates];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v6 = 0LL;
    uint64_t v24 = [v13 countByEnumeratingWithState:&v43 objects:v56 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v44;
      while (2)
      {
        uint64_t v26 = 0LL;
        v27 = v6;
        do
        {
          if (*(void *)v44 != v25) {
            objc_enumerationMutation(v13);
          }
          id v28 = *(id *)(*((void *)&v43 + 1) + 8 * v26);
          id v42 = v27;
          [a1 translateNSPredicate:v28 error:&v42];
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          id v6 = v42;

          if (!v29)
          {
            id v5 = 0LL;
            goto LABEL_33;
          }

          [v14 addObject:v29];

          ++v26;
          v27 = v6;
        }

        while (v24 != v26);
        uint64_t v24 = [v13 countByEnumeratingWithState:&v43 objects:v56 count:16];
        if (v24) {
          continue;
        }
        break;
      }
    }

    if (!v14)
    {
      id v5 = 0LL;
      goto LABEL_35;
    }

    id v5 = (id)objc_msgSend( objc_alloc(MEMORY[0x189607820]),  "initWithType:subpredicates:",  objc_msgSend(v35, "compoundPredicateType"),  v14);
LABEL_34:

LABEL_35:
    goto LABEL_4;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v15 = v39;
    [v15 leftExpression];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    [a1 constantValueForExpression:v16];
    unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v18 = [v15 predicateOperatorType];
    [v15 rightExpression];
    NSUInteger v19 = (void *)objc_claimAutoreleasedReturnValue();
    [a1 constantValueForExpression:v19];
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      if (v20)
      {
        if (![v15 comparisonPredicateModifier])
        {
          id v22 = v17;
          id v32 = v20;
          if ([v22 isEqualToString:@"*"])
          {
            uint64_t v41 = 0LL;
            uint64_t v33 = (id *)&v41;
            uint64_t v34 = -[_CSVisualizerPredicate initWithSearchString:operator:error:]( objc_alloc(&OBJC_CLASS____CSVisualizerPredicate),  "initWithSearchString:operator:error:",  v32,  v18,  &v41);
          }

          else
          {
            uint64_t v40 = 0LL;
            uint64_t v33 = (id *)&v40;
            uint64_t v34 = -[_CSVisualizerPredicate initWithSearchString:forTitle:operator:error:]( objc_alloc(&OBJC_CLASS____CSVisualizerPredicate),  "initWithSearchString:forTitle:operator:error:",  v32,  v22,  v18,  &v40);
          }

          id v5 = v34;
          id v6 = *v33;

          goto LABEL_39;
        }

        unint64_t v21 = (void *)MEMORY[0x189607870];
        v50[0] = *MEMORY[0x189607490];
        v50[1] = @"Line";
        v51[0] = @"kCSStorePredicateErr";
        v51[1] = &unk_189D69B08;
        v50[2] = *MEMORY[0x1896075F0];
        v50[3] = @"Predicate";
        v51[2] = @"Aggregate operations (ANY, ALL, etc.) are not supported.";
        v51[3] = v15;
        [MEMORY[0x189603F68] dictionaryWithObjects:v51 forKeys:v50 count:4];
        id v22 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v23 = [v21 errorWithDomain:*MEMORY[0x189607670] code:-9495 userInfo:v22];
      }

      else
      {
        unint64_t v31 = (void *)MEMORY[0x189607870];
        v52[0] = *MEMORY[0x189607490];
        v52[1] = @"Line";
        v53[0] = @"kCSStorePredicateErr";
        v53[1] = &unk_189D69AF0;
        v52[2] = *MEMORY[0x1896075F0];
        v52[3] = @"Predicate";
        v53[2] = @"Unsupported expression type (right-hand side).";
        v53[3] = v15;
        [MEMORY[0x189603F68] dictionaryWithObjects:v53 forKeys:v52 count:4];
        id v22 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v23 = [v31 errorWithDomain:*MEMORY[0x189607670] code:-9495 userInfo:v22];
      }
    }

    else
    {
      v30 = (void *)MEMORY[0x189607870];
      v54[0] = *MEMORY[0x189607490];
      v54[1] = @"Line";
      v55[0] = @"kCSStorePredicateErr";
      v55[1] = &unk_189D69AD8;
      v54[2] = *MEMORY[0x1896075F0];
      v54[3] = @"Predicate";
      v55[2] = @"Unsupported expression type (left-hand side).";
      v55[3] = v15;
      [MEMORY[0x189603F68] dictionaryWithObjects:v55 forKeys:v54 count:4];
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v23 = [v30 errorWithDomain:*MEMORY[0x189607670] code:-9495 userInfo:v22];
    }

    id v6 = (id)v23;
    id v5 = 0LL;
LABEL_39:

    goto LABEL_4;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = 0LL;
    id v5 = 0LL;
    goto LABEL_4;
  }

+ (id)predicateWithFormatString:(id)a3 error:(id *)a4
{
  v18[15] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x186E27B50]();
  [MEMORY[0x1896079C8] predicateWithFormat:v6 argumentArray:MEMORY[0x189604A58]];
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v16[0] = 0LL;
    [a1 translateNSPredicate:v8 error:v16];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v10 = v16[0];

    if (v9) {
      goto LABEL_10;
    }
  }

  else
  {
    id v10 = 0LL;
  }

  [MEMORY[0x189607878] expressionWithFormat:v6 argumentArray:MEMORY[0x189604A58]];
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    id v9 = (void *)[objc_alloc((Class)a1) initWithExpression:v11];
    if (!v9)
    {
      uint64_t v12 = (void *)MEMORY[0x189607870];
      v17[0] = *MEMORY[0x189607490];
      v17[1] = @"Line";
      v18[0] = @"kCSStorePredicateErr";
      v18[1] = &unk_189D69B50;
      v17[2] = *MEMORY[0x1896075F0];
      v17[3] = @"Expression";
      v18[2] = @"Could not translate generated expression to a form usable by CoreServicesStore.";
      v18[3] = v11;
      [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:v17 count:4];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = [v12 errorWithDomain:*MEMORY[0x189607670] code:-9495 userInfo:v13];

      id v9 = 0LL;
      id v10 = (id)v14;
    }
  }

  else
  {
    id v9 = 0LL;
  }

LABEL_10:
  objc_autoreleasePoolPop(v7);
  if (a4 && !v9) {
    *a4 = v10;
  }

  return v9;
}

+ (void)getRanges:(void *)a3 matchingPredicate:(id)a4 inDescription:(id)a5
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    NSUInteger v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 handleFailureInMethod:a2, a1, @"CSPredicate.mm", 373, @"Invalid parameter not satisfying: %@", @"predicate != nil" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }

  [MEMORY[0x1896077D8] currentHandler];
  BOOL v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 handleFailureInMethod:a2, a1, @"CSPredicate.mm", 374, @"Invalid parameter not satisfying: %@", @"description != nil" object file lineNumber description];

LABEL_3:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v12 = v9;
    uint64_t v13 = v12;
    if (v12[4] != 5LL) {
      [v12 getRanges:a3 inDescription:v11 options:0 limit:-1 searchedInRange:0];
    }
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v14 = v9;
      if ([v14 compoundPredicateType])
      {
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        [v14 subpredicates];
        id v15 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v22;
          do
          {
            uint64_t v18 = 0LL;
            do
            {
              if (*(void *)v22 != v17) {
                objc_enumerationMutation(v15);
              }
              [a1 getRanges:a3 matchingPredicate:*(void *)(*((void *)&v21 + 1) + 8 * v18++) inDescription:v11];
            }

            while (v16 != v18);
            uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
          }

          while (v16);
        }
      }
    }
  }
}

@end
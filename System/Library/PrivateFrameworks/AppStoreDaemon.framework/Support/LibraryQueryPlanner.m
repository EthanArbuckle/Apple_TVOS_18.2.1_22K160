@interface LibraryQueryPlanner
- (void)visitPredicate:(id)a3;
@end

@implementation LibraryQueryPlanner

- (void)visitPredicate:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSCompoundPredicate, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 subpredicates]);
    id v9 = [v8 count];

    if (v9)
    {
      id v10 = sub_100206D38(self->_stack, (uint64_t)v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      if ([v7 compoundPredicateType] == (id)1)
      {
        v12 = objc_alloc(&OBJC_CLASS___LibraryLazyResultsEnumerator);
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472LL;
        v29[2] = sub_100298338;
        v29[3] = &unk_1003F0410;
        id v30 = v11;
        id v32 = v9;
        id v31 = v7;
        v13 = sub_1001F5724(v12, 1LL, v29);
        stack = self->_stack;
        if (stack) {
          -[NSMutableArray addObject:](stack, "addObject:", v13);
        }

        id v15 = v30;
      }

      else if ([v7 compoundPredicateType] == (id)2)
      {
        v18 = objc_alloc(&OBJC_CLASS___LibraryLazyResultsEnumerator);
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472LL;
        v27[2] = sub_1002984D4;
        v27[3] = &unk_1003F0438;
        id v28 = v11;
        v19 = sub_1001F5724(v18, 2LL, v27);
        v20 = self->_stack;
        if (v20) {
          -[NSMutableArray addObject:](v20, "addObject:", v19);
        }

        id v15 = v28;
      }

      else
      {
        classifier = self->_classifier;
        id v26 = 0LL;
        id v22 = sub_1001BE8DC((uint64_t)classifier, v7, (uint64_t)&v26);
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        id v15 = v26;
        v24 = self->_stack;
        if (v23)
        {
          if (v24) {
            -[NSMutableArray addObject:](v24, "addObject:", v23);
          }
        }

        else
        {
          v25 = sub_1001BF110((id *)objc_alloc(&OBJC_CLASS___LibraryErrorResultEnumerator), v15);
          if (v24) {
            -[NSMutableArray addObject:](v24, "addObject:", v25);
          }
        }
      }
    }
  }

  else
  {
    id v16 = sub_1001BE8DC((uint64_t)self->_classifier, v4, 0LL);
    id v7 = (id)objc_claimAutoreleasedReturnValue(v16);
    if (v7)
    {
      v17 = self->_stack;
      if (v17) {
        -[NSMutableArray addObject:](v17, "addObject:", v7);
      }
    }
  }
}

- (void).cxx_destruct
{
}

@end
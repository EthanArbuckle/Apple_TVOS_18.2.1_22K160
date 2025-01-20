@interface TVSSCyclingMenuItemsDataSource
- (TVSSCyclingMenuItemsDataSource)init;
- (TVSSMenuItem)currentMenuItem;
- (TVSSMenuItem)nextMenuItem;
- (id)description;
- (unint64_t)_nextMenuItemIndex;
- (unint64_t)updateWithMenuItems:(id)a3;
- (void)_updateCyclingMenuItems:(id)a3;
- (void)_updateCyclingMenuItems:(id)a3 atIndex:(unint64_t)a4;
- (void)finishedWithCurrentMenuItem;
@end

@implementation TVSSCyclingMenuItemsDataSource

- (TVSSCyclingMenuItemsDataSource)init
{
  SEL v5 = a2;
  v6 = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSSCyclingMenuItemsDataSource;
  v6 = -[TVSSCyclingMenuItemsDataSource init](&v4, "init");
  objc_storeStrong((id *)&v6, v6);
  if (v6) {
    v6->_currentMenuItemIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  v3 = v6;
  objc_storeStrong((id *)&v6, 0LL);
  return v3;
}

- (TVSSMenuItem)currentMenuItem
{
  v7 = self;
  v6[1] = (id)a2;
  v6[0] = 0LL;
  if (self->_currentMenuItemIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v2 = -[NSArray objectAtIndex:](v7->_cyclingMenuItems, "objectAtIndex:", v7->_currentMenuItemIndex);
    id v3 = v6[0];
    v6[0] = v2;
  }

  id v5 = v6[0];
  objc_storeStrong(v6, 0LL);
  return (TVSSMenuItem *)v5;
}

- (TVSSMenuItem)nextMenuItem
{
  v8 = self;
  v7[1] = (id)a2;
  v7[0] = 0LL;
  unint64_t v6 = -[TVSSCyclingMenuItemsDataSource _nextMenuItemIndex](self, "_nextMenuItemIndex");
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v2 = -[NSArray objectAtIndex:](v8->_cyclingMenuItems, "objectAtIndex:", v6);
    id v3 = v7[0];
    v7[0] = v2;
  }

  id v5 = v7[0];
  objc_storeStrong(v7, 0LL);
  return (TVSSMenuItem *)v5;
}

- (void)finishedWithCurrentMenuItem
{
  if (-[TVSSCyclingMenuItemsDataSource _nextMenuItemIndex](self, "_nextMenuItemIndex") != 0x7FFFFFFFFFFFFFFFLL) {
    ++self->_currentMenuItemIndex;
  }
}

- (unint64_t)updateWithMenuItems:(id)a3
{
  v76 = self;
  SEL v75 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  uint64_t v73 = 0LL;
  if (v76->_menuItems)
  {
    id v72 = [location differenceFromOrderedSet:v76->_menuItems];
    if ([v72 hasChanges])
    {
      id v3 = (NSOrderedSet *)[location copy];
      menuItems = v76->_menuItems;
      v76->_menuItems = v3;

      id v71 = -[NSOrderedSet array](v76->_menuItems, "array");
      id v36 = [v72 insertions];
      id v70 = [v36 lastObject];

      id v69 = [v70 object];
      if (v69)
      {
        id v68 = [v71 mutableCopy];
        id v67 = [v71 lastObject];
        if (v69 != v67) {
          objc_msgSend(v68, "removeObjectAtIndex:", objc_msgSend(v70, "index"));
        }
        [v68 insertObject:v69 atIndex:0];
        id v5 = [v68 copy];
        id v6 = v71;
        id v71 = v5;

        -[TVSSCyclingMenuItemsDataSource _updateCyclingMenuItems:](v76, "_updateCyclingMenuItems:", v71);
        uint64_t v73 = 1LL;
        objc_storeStrong(&v67, 0LL);
        objc_storeStrong(&v68, 0LL);
      }

      else
      {
        if (v76->_currentMenuItemIndex == 0x7FFFFFFFFFFFFFFFLL)
        {
          v66 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_currentMenuItemIndex != NSNotFound");
          id v65 = &_os_log_default;
          os_log_type_t type = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled((os_log_t)v65, OS_LOG_TYPE_ERROR))
          {
            log = (os_log_s *)v65;
            os_log_type_t v33 = type;
            v35 = NSStringFromSelector(v75);
            v31 = v35;
            v63 = v31;
            v7 = (objc_class *)objc_opt_class(v76);
            v34 = NSStringFromClass(v7);
            v62 = v34;
            sub_10000583C( (uint64_t)v79,  (uint64_t)v31,  (uint64_t)v62,  (uint64_t)v76,  (uint64_t)@"TVSSCyclingMenuItemsDataSource.m",  132,  (uint64_t)v66);
            _os_log_error_impl( (void *)&_mh_execute_header,  log,  v33,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v79,  0x3Au);

            objc_storeStrong((id *)&v62, 0LL);
            objc_storeStrong((id *)&v63, 0LL);
          }

          objc_storeStrong(&v65, 0LL);
          _bs_set_crash_log_message(-[NSString UTF8String](v66, "UTF8String"));
          __break(0);
          JUMPOUT(0x10007A4CCLL);
        }

        id v61 = -[TVSSCyclingMenuItemsDataSource currentMenuItem](v76, "currentMenuItem");
        if (!v61)
        {
          v60 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"currentMenuItem");
          id v59 = &_os_log_default;
          os_log_type_t v58 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled((os_log_t)v59, OS_LOG_TYPE_ERROR))
          {
            v27 = (os_log_s *)v59;
            os_log_type_t v28 = v58;
            v30 = NSStringFromSelector(v75);
            v26 = v30;
            v57 = v26;
            v8 = (objc_class *)objc_opt_class(v76);
            v29 = NSStringFromClass(v8);
            v56 = v29;
            sub_10000583C( (uint64_t)v78,  (uint64_t)v26,  (uint64_t)v56,  (uint64_t)v76,  (uint64_t)@"TVSSCyclingMenuItemsDataSource.m",  146,  (uint64_t)v60);
            _os_log_error_impl( (void *)&_mh_execute_header,  v27,  v28,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v78,  0x3Au);

            objc_storeStrong((id *)&v56, 0LL);
            objc_storeStrong((id *)&v57, 0LL);
          }

          objc_storeStrong(&v59, 0LL);
          _bs_set_crash_log_message(-[NSString UTF8String](v60, "UTF8String"));
          __break(0);
          JUMPOUT(0x10007A6BCLL);
        }

        id v55 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
        for (unint64_t i = 0LL; i < v76->_currentMenuItemIndex; ++i)
        {
          id v53 = -[NSArray objectAtIndex:](v76->_cyclingMenuItems, "objectAtIndex:", i);
          id v52 = [v53 identifier];
          [v55 addObject:v52];
          objc_storeStrong(&v52, 0LL);
          objc_storeStrong(&v53, 0LL);
        }

        id v51 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
        memset(__b, 0, sizeof(__b));
        id v24 = [v72 removals];
        id v25 = [v24 countByEnumeratingWithState:__b objects:v77 count:16];
        if (v25)
        {
          uint64_t v21 = *(void *)__b[2];
          uint64_t v22 = 0LL;
          id v23 = v25;
          while (1)
          {
            uint64_t v20 = v22;
            if (*(void *)__b[2] != v21) {
              objc_enumerationMutation(v24);
            }
            id v50 = *(id *)(__b[1] + 8 * v22);
            id v17 = v51;
            id v19 = [v50 object];
            id v18 = [v19 identifier];
            objc_msgSend(v17, "addObject:");

            ++v22;
            if (v20 + 1 >= (unint64_t)v23)
            {
              uint64_t v22 = 0LL;
              id v23 = [v24 countByEnumeratingWithState:__b objects:v77 count:16];
              if (!v23) {
                break;
              }
            }
          }
        }

        cyclingMenuItems = v76->_cyclingMenuItems;
        v42 = _NSConcreteStackBlock;
        int v43 = -1073741824;
        int v44 = 0;
        v45 = sub_10007ACFC;
        v46 = &unk_1001B8CF8;
        id v47 = v51;
        id v48 = -[NSArray bs_filter:](cyclingMenuItems, "bs_filter:", &v42);
        if ([v48 count])
        {
          v76->_currentMenuItemIndex = (unint64_t)[v48 indexOfObjectIdenticalTo:v61];
          if (v76->_currentMenuItemIndex == 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v41 = 0x7FFFFFFFFFFFFFFFLL;
            for (unint64_t j = 0LL; ; ++j)
            {
              unint64_t v15 = j;
              id v39 = [v48 objectAtIndex:j];
              id v38 = [v39 identifier];
              if ([v55 containsObject:v38])
              {
                int v37 = 0;
              }

              else
              {
                uint64_t v41 = j;
                int v37 = 15;
              }

              objc_storeStrong(&v38, 0LL);
              objc_storeStrong(&v39, 0LL);
              if (v37) {
                break;
              }
            }

            if (v41 == 0x7FFFFFFFFFFFFFFFLL) {
              uint64_t v41 = (uint64_t)[location count] - 1;
            }
            -[TVSSCyclingMenuItemsDataSource _updateCyclingMenuItems:atIndex:]( v76,  "_updateCyclingMenuItems:atIndex:",  v48,  v41);
            uint64_t v73 = 1LL;
          }

          else
          {
            -[TVSSCyclingMenuItemsDataSource _updateCyclingMenuItems:atIndex:]( v76,  "_updateCyclingMenuItems:atIndex:",  v48,  v76->_currentMenuItemIndex);
            uint64_t v73 = 0LL;
          }
        }

        else
        {
          -[TVSSCyclingMenuItemsDataSource _updateCyclingMenuItems:](v76, "_updateCyclingMenuItems:", 0LL);
          uint64_t v73 = 2LL;
        }

        objc_storeStrong(&v48, 0LL);
        objc_storeStrong(&v47, 0LL);
        objc_storeStrong(&v51, 0LL);
        objc_storeStrong(&v55, 0LL);
        objc_storeStrong(&v61, 0LL);
      }

      objc_storeStrong(&v69, 0LL);
      objc_storeStrong(&v70, 0LL);
      objc_storeStrong(&v71, 0LL);
    }

    objc_storeStrong(&v72, 0LL);
  }

  else
  {
    v9 = (NSOrderedSet *)[location copy];
    v10 = v76->_menuItems;
    v76->_menuItems = v9;

    v13 = v76;
    id v14 = [location array];
    -[TVSSCyclingMenuItemsDataSource _updateCyclingMenuItems:](v13, "_updateCyclingMenuItems:");

    uint64_t v73 = 1LL;
  }

  unint64_t v12 = v73;
  objc_storeStrong(&location, 0LL);
  return v12;
}

- (id)description
{
  v11 = self;
  v10[1] = (id)a2;
  v10[0] = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
  id v5 = v10[0];
  id v6 = -[TVSSCyclingMenuItemsDataSource currentMenuItem](v11, "currentMenuItem");
  id v2 = objc_msgSend(v5, "appendObject:withName:");

  id v7 = v10[0];
  v8 = -[TVSSCyclingMenuItemsDataSource nextMenuItem](v11, "nextMenuItem");
  id v3 = objc_msgSend(v7, "appendObject:withName:");

  id v9 = [v10[0] build];
  objc_storeStrong(v10, 0LL);
  return v9;
}

- (unint64_t)_nextMenuItemIndex
{
  unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (self->_currentMenuItemIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    currentMenuItemIndex = (char *)self->_currentMenuItemIndex;
  }

  return v4;
}

- (void)_updateCyclingMenuItems:(id)a3
{
  unint64_t v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSCyclingMenuItemsDataSource _updateCyclingMenuItems:atIndex:]( v4,  "_updateCyclingMenuItems:atIndex:",  location[0],  0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_updateCyclingMenuItems:(id)a3 atIndex:(unint64_t)a4
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v7->_cyclingMenuItems, location[0]);
  if (a4 >= -[NSArray count](v7->_cyclingMenuItems, "count")) {
    unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v4 = a4;
  }
  v7->_currentMenuItemIndex = v4;
  objc_storeStrong(location, 0LL);
}

- (void).cxx_destruct
{
}

@end
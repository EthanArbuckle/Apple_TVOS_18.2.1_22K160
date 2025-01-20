@interface _DASSharedMemoryBudgetPersistence
+ (id)log;
+ (id)persistence;
+ (void)initialize;
- (NSMutableDictionary)budgetToIndex;
- (_DASSharedMemoryBudgetPersistence)init;
- (id)lastModulationDate;
- (id)loadBudgetsWithExpectedNames:(id)a3;
- (id)validatedStringFromStoredValue:(char *)a3 withAllowedNames:(id)a4;
- (void)saveBudgets:(id)a3;
- (void)saveModulationDate:(id)a3;
- (void)setBudgetToIndex:(id)a3;
- (void)updateBudget:(id)a3;
@end

@implementation _DASSharedMemoryBudgetPersistence

+ (id)log
{
  if (qword_100157540 != -1) {
    dispatch_once(&qword_100157540, &stru_100115260);
  }
  return (id)qword_100157548;
}

+ (void)initialize
{
  v12[0] = 0LL;
  v12[1] = v12;
  v12[2] = 0x2020000000LL;
  v12[3] = 0LL;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_DASSharedMemoryBudgetPersistence log](&OBJC_CLASS____DASSharedMemoryBudgetPersistence, "log"));
  dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.dasd.shmemQueue", v4);
  v6 = (void *)qword_100157538;
  qword_100157538 = (uint64_t)v5;

  v7 = (dispatch_queue_s *)qword_100157538;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100014C34;
  v9[3] = &unk_100115288;
  id v10 = v2;
  v11 = v12;
  id v8 = v2;
  dispatch_sync(v7, v9);

  _Block_object_dispose(v12, 8);
}

- (_DASSharedMemoryBudgetPersistence)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____DASSharedMemoryBudgetPersistence;
  v2 = -[_DASSharedMemoryBudgetPersistence init](&v9, "init");
  if (!v2) {
    goto LABEL_4;
  }
  if (qword_100157550)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    budgetToIndex = v2->_budgetToIndex;
    v2->_budgetToIndex = (NSMutableDictionary *)v3;

LABEL_4:
    dispatch_queue_t v5 = v2;
    goto LABEL_8;
  }

  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASSharedMemoryBudgetPersistence log](&OBJC_CLASS____DASSharedMemoryBudgetPersistence, "log"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Unable to obtain Shared Memory! Return nil as we won't be able to persist anything.",  v8,  2u);
  }

  dispatch_queue_t v5 = 0LL;
LABEL_8:

  return v5;
}

+ (id)persistence
{
  uint64_t v5 = 0LL;
  v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  id v8 = sub_100014F44;
  objc_super v9 = sub_100014F54;
  id v10 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100014F5C;
  v4[3] = &unk_1001152B0;
  v4[4] = &v5;
  v4[5] = a1;
  if (qword_100157558 != -1) {
    dispatch_once(&qword_100157558, v4);
  }
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)updateBudget:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASSharedMemoryBudgetPersistence log](&OBJC_CLASS____DASSharedMemoryBudgetPersistence, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating budget: %@", buf, 0xCu);
  }

  v6 = (dispatch_queue_s *)qword_100157538;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000150A0;
  v8[3] = &unk_100115148;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

- (void)saveBudgets:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)qword_100157538;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100015230;
  block[3] = &unk_100115148;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (id)validatedStringFromStoredValue:(char *)a3 withAllowedNames:(id)a4
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = a4;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v13 + 1) + 8LL * (void)v9);
        if (!strncmp( a3,  (const char *)objc_msgSend(v10, "UTF8String", (void)v13),  (size_t)objc_msgSend(v10, "length") + 1))
        {
          id v11 = v10;
          goto LABEL_11;
        }

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v11 = 0LL;
LABEL_11:

  return v11;
}

- (id)loadBudgetsWithExpectedNames:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  __int128 v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  __int128 v15 = sub_100014F44;
  __int128 v16 = sub_100014F54;
  id v17 = &__NSArray0__struct;
  id v5 = (dispatch_queue_s *)qword_100157538;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001576C;
  block[3] = &unk_1001152D8;
  void block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)saveModulationDate:(id)a3
{
  id v3 = a3;
  id v4 = (dispatch_queue_s *)qword_100157538;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100015B08;
  block[3] = &unk_1001150D0;
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(v4, block);
}

- (id)lastModulationDate
{
  uint64_t v6 = 0LL;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000LL;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100015D40;
  block[3] = &unk_100115300;
  void block[4] = &v6;
  dispatch_sync((dispatch_queue_t)qword_100157538, block);
  id v2 = 0LL;
  if (v7[3] >= 0.0001) {
    id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
  }
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASSharedMemoryBudgetPersistence log](&OBJC_CLASS____DASSharedMemoryBudgetPersistence, "log"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Loaded modulation date: %@", buf, 0xCu);
  }

  _Block_object_dispose(&v6, 8);
  return v2;
}

- (NSMutableDictionary)budgetToIndex
{
  return self->_budgetToIndex;
}

- (void)setBudgetToIndex:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
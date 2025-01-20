@interface PLDuplicatePersonUUIDMaintenanceTask
- (BOOL)runTaskWithTransaction:(id)a3;
@end

@implementation PLDuplicatePersonUUIDMaintenanceTask

- (BOOL)runTaskWithTransaction:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000083C8;
  v8[3] = &unk_1000212F0;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary"));
  id v9 = v5;
  v10 = &v11;
  [v5 performBlockAndWait:v8];
  char v6 = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

@end
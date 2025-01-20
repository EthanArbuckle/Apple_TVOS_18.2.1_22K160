@interface _ASDSystemAlertDialogTask
- (__CFDictionary)_createNoteDictionaryWithKeys:(ButtonKey *)a3 buttonActions:(id)a4 outOptions:(unint64_t *)a5;
- (id)_reorderButtonActions;
@end

@implementation _ASDSystemAlertDialogTask

- (__CFDictionary)_createNoteDictionaryWithKeys:(ButtonKey *)a3 buttonActions:(id)a4 outOptions:(unint64_t *)a5
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS____ASDSystemAlertDialogTask;
  id v7 = a4;
  v8 = -[_ASDSystemAlertDialogTask _createNoteDictionaryWithKeys:buttonActions:outOptions:]( &v11,  "_createNoteDictionaryWithKeys:buttonActions:outOptions:",  a3,  v7,  a5);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1002DBBF0;
  v10[3] = &unk_1003F1EC0;
  v10[4] = v8;
  [v7 enumerateObjectsUsingBlock:v10];

  return v8;
}

- (id)_reorderButtonActions
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_ASDSystemAlertDialogTask request](self, "request"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 buttonActions]);

  return v3;
}

@end
@interface InstallEnterpriseAppsTask
- (void)main;
@end

@implementation InstallEnterpriseAppsTask

- (void)main
{
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  v16 = sub_1002EA004;
  v17 = sub_1002EA014;
  id v18 = 0LL;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v4 = *(void **)&self->super._success;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1002EA01C;
  v9[3] = &unk_1003F2348;
  id v5 = v3;
  id v10 = v5;
  v11 = self;
  v12 = &v13;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];
  if ((unint64_t)[*(id *)&self->super._success count] > 1
    || LOBYTE(self->super._error)
    || !v14[5])
  {
    id v6 = v5;
    -[Task lock](self, "lock");
    id v7 = [v6 copy];

    v8 = *(void **)&self->_isXDCRequest;
    *(void *)&self->_isXDCRequest = v7;

    -[Task unlock](self, "unlock");
    -[Task completeWithSuccess](self, "completeWithSuccess");
  }

  else
  {
    -[Task completeWithError:](self, "completeWithError:");
  }

  _Block_object_dispose(&v13, 8);
}

- (void).cxx_destruct
{
}

@end
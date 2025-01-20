@interface ODRApplication
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation ODRApplication

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = sub_1002D941C(+[ODRApplication allocWithZone:](&OBJC_CLASS___ODRApplication, "allocWithZone:"), self->_bundleID);
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002DAFB0;
  block[3] = &unk_1003EC880;
  block[4] = self;
  v7 = v5;
  id v12 = v7;
  v13 = a3;
  dispatch_sync(dispatchQueue, block);
  v8 = v12;
  v9 = v7;

  return v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v5 = sub_1002D941C( +[ODRMutableApplication allocWithZone:](&OBJC_CLASS___ODRMutableApplication, "allocWithZone:"),  self->_bundleID);
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002DB174;
  block[3] = &unk_1003EC880;
  block[4] = self;
  v7 = v5;
  id v12 = v7;
  v13 = a3;
  dispatch_sync(dispatchQueue, block);
  v8 = v12;
  v9 = v7;

  return v9;
}

- (id)description
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_1002D9C24;
  v10 = sub_1002D9C34;
  id v11 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1002DB238;
  v5[3] = &unk_1003EC4F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (unint64_t)hash
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1002DB370;
  v5[3] = &unk_1003E9BE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (ODRApplication *)a3;
  if (self == v5)
  {
    LOBYTE(self) = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(self, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      uint64_t v8 = v7;
      if (self)
      {
        uint64_t v14 = 0LL;
        v15 = &v14;
        uint64_t v16 = 0x2020000000LL;
        char v17 = 0;
        dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1002D9F28;
        block[3] = &unk_1003E9780;
        v13 = &v14;
        block[4] = self;
        id v12 = v7;
        dispatch_sync(dispatchQueue, block);
        LOBYTE(self) = *((_BYTE *)v15 + 24) != 0;

        _Block_object_dispose(&v14, 8);
      }
    }

    else
    {
      LOBYTE(self) = 0;
    }
  }

  return (char)self;
}

- (void).cxx_destruct
{
}

@end
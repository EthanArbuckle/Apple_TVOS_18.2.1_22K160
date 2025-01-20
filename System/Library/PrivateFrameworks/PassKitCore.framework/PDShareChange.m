@interface PDShareChange
- (NSString)sender;
- (PKPassShare)oldShare;
- (PKPassShare)updatedShare;
- (unint64_t)_sharedEntitlementsChangeType;
- (unint64_t)type;
- (void)setOldShare:(id)a3;
- (void)setSender:(id)a3;
- (void)setUpdatedShare:(id)a3;
@end

@implementation PDShareChange

- (unint64_t)type
{
  updatedShare = self->_updatedShare;
  oldShare = self->_oldShare;
  if (updatedShare)
  {
    if (oldShare)
    {
      id v5 = -[PKPassShare status](updatedShare, "status");
      if (v5 == -[PKPassShare status](self->_oldShare, "status")) {
        return -[PDShareChange _sharedEntitlementsChangeType](self, "_sharedEntitlementsChangeType");
      }
      else {
        return 1LL;
      }
    }

    else
    {
      return 0LL;
    }
  }

  else if (oldShare)
  {
    return 3LL;
  }

  else
  {
    return 0LL;
  }

- (unint64_t)_sharedEntitlementsChangeType
{
  oldShare = self->_oldShare;
  if (!oldShare || !self->_updatedShare) {
    return 4LL;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKPassShare sharedEntitlements](oldShare, "sharedEntitlements"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pk_indexDictionaryByApplyingBlock:", &stru_100650FD8));
  id v6 = [v5 mutableCopy];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKPassShare sharedEntitlements](self->_updatedShare, "sharedEntitlements"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pk_indexDictionaryByApplyingBlock:", &stru_100650FF8));

  uint64_t v21 = 0LL;
  v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = 0;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 0;
  id v9 = [v6 count];
  if (v9 == [v8 count])
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1002780FC;
    v13[3] = &unk_100651020;
    id v10 = v6;
    id v14 = v10;
    v15 = &v21;
    v16 = &v17;
    [v8 enumerateKeysAndObjectsUsingBlock:v13];
    if ([v10 count]) {
      *((_BYTE *)v22 + 24) = 1;
    }

    if (*((_BYTE *)v22 + 24))
    {
      unint64_t v11 = 1LL;
    }

    else if (*((_BYTE *)v18 + 24))
    {
      unint64_t v11 = 2LL;
    }

    else
    {
      unint64_t v11 = 4LL;
    }
  }

  else
  {
    unint64_t v11 = 1LL;
    *((_BYTE *)v22 + 24) = 1;
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v11;
}

- (PKPassShare)updatedShare
{
  return self->_updatedShare;
}

- (void)setUpdatedShare:(id)a3
{
}

- (PKPassShare)oldShare
{
  return self->_oldShare;
}

- (void)setOldShare:(id)a3
{
}

- (NSString)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
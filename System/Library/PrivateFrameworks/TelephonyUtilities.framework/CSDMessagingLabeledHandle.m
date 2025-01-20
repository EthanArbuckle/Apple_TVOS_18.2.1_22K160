@interface CSDMessagingLabeledHandle
+ (id)handleWithTULabeledHandle:(id)a3;
- (BOOL)hasHandle;
- (BOOL)hasLabel;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CSDMessagingHandle)handle;
- (NSString)label;
- (TULabeledHandle)tuLabeledHandle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHandle:(id)a3;
- (void)setLabel:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingLabeledHandle

+ (id)handleWithTULabeledHandle:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 handle]);
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingHandle handleWithTUHandle:]( &OBJC_CLASS___CSDMessagingHandle,  "handleWithTUHandle:",  v5));

    if (v6)
    {
      v7 = objc_alloc_init(&OBJC_CLASS___CSDMessagingLabeledHandle);
      v8 = (void *)objc_claimAutoreleasedReturnValue([v4 label]);
      -[CSDMessagingLabeledHandle setLabel:](v7, "setLabel:", v8);

      -[CSDMessagingLabeledHandle setHandle:](v7, "setHandle:", v6);
    }

    else
    {
      v7 = 0LL;
    }
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

- (TULabeledHandle)tuLabeledHandle
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingLabeledHandle handle](self, "handle"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingLabeledHandle handle](self, "handle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 tuHandle]);

    v6 = objc_alloc(&OBJC_CLASS___TULabeledHandle);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingLabeledHandle label](self, "label"));
    v8 = -[TULabeledHandle initWithHandle:label:isSuggested:](v6, "initWithHandle:label:isSuggested:", v5, v7, 0LL);
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (BOOL)hasHandle
{
  return self->_handle != 0LL;
}

- (BOOL)hasLabel
{
  return self->_label != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSDMessagingLabeledHandle;
  id v3 = -[CSDMessagingLabeledHandle description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingLabeledHandle dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  handle = self->_handle;
  if (handle)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingHandle dictionaryRepresentation](handle, "dictionaryRepresentation"));
    [v3 setObject:v5 forKey:@"handle"];
  }

  label = self->_label;
  if (label) {
    [v3 setObject:label forKey:@"label"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10013A078((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  handle = self->_handle;
  id v7 = v4;
  if (handle)
  {
    PBDataWriterWriteSubmessage(v4, handle, 1LL);
    id v4 = v7;
  }

  label = self->_label;
  if (label)
  {
    PBDataWriterWriteStringField(v7, label, 2LL);
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_handle)
  {
    objc_msgSend(v4, "setHandle:");
    id v4 = v5;
  }

  if (self->_label)
  {
    objc_msgSend(v5, "setLabel:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[CSDMessagingHandle copyWithZone:](self->_handle, "copyWithZone:", a3);
  id v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = -[NSString copyWithZone:](self->_label, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5))
    && ((handle = self->_handle, !((unint64_t)handle | v4[1]))
     || -[CSDMessagingHandle isEqual:](handle, "isEqual:")))
  {
    label = self->_label;
    else {
      unsigned __int8 v8 = 1;
    }
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = -[CSDMessagingHandle hash](self->_handle, "hash");
  return -[NSString hash](self->_label, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  handle = self->_handle;
  uint64_t v6 = v4[1];
  id v7 = v4;
  if (handle)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[CSDMessagingHandle mergeFrom:](handle, "mergeFrom:");
  }

  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[CSDMessagingLabeledHandle setHandle:](self, "setHandle:");
  }

  id v4 = v7;
LABEL_7:
  if (v4[2])
  {
    -[CSDMessagingLabeledHandle setLabel:](self, "setLabel:");
    id v4 = v7;
  }
}

- (CSDMessagingHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
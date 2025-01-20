@interface BMSyncAtomValue
+ (BOOL)supportsSecureCoding;
+ (id)atomValueFromData:(id)a3 version:(int64_t)a4;
- (BMStoreEventAtomValue)value;
- (BMSyncAtomValue)initWithAtomType:(unint64_t)a3 value:(id)a4 version:(int64_t)a5;
- (BMSyncAtomValue)initWithCoder:(id)a3;
- (BMSyncAtomValue)initWithProto:(id)a3;
- (BMSyncAtomValue)initWithProtoData:(id)a3;
- (id)encodeAsProto;
- (id)proto;
- (id)serialize;
- (id)serializeProto;
- (int64_t)version;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BMSyncAtomValue

- (BMSyncAtomValue)initWithAtomType:(unint64_t)a3 value:(id)a4 version:(int64_t)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___BMSyncAtomValue;
  v10 = -[BMSyncAtomValue init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    objc_storeStrong((id *)&v10->_value, a4);
    v11->_version = a5;
  }

  return v11;
}

- (id)serializeProto
{
  return -[BMSyncAtomValue encodeAsProto](self, "encodeAsProto");
}

- (id)encodeAsProto
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncAtomValue proto](self, "proto"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 data]);

  return v3;
}

- (BMSyncAtomValue)initWithProto:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___BMPBSyncAtomValue, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      id v7 = v5;
      if (sub_100017174((uint64_t)v7) && sub_1000172B0((BOOL)v7))
      {
        v8 = objc_alloc(&OBJC_CLASS___BMStoreEventAtomValue);
        uint64_t v9 = sub_100017A08((uint64_t)v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        v11 = -[BMStoreEventAtomValue initWithProto:](v8, "initWithProto:", v10);

        self =  -[BMSyncAtomValue initWithAtomType:value:version:]( self,  "initWithAtomType:value:version:",  (int)sub_100017100((uint64_t)v7),  v11,  1LL);
        v12 = self;
LABEL_13:

        goto LABEL_14;
      }

      uint64_t v16 = __biome_log_for_category(4LL);
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        sub_100041F88((uint64_t)self, (uint64_t)v17, v18, v19);
      }
    }

    else
    {
      uint64_t v13 = __biome_log_for_category(4LL);
      id v7 = (id)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_FAULT)) {
        sub_100042000((uint64_t)self, (uint64_t)v7, v14, v15);
      }
    }

    v12 = 0LL;
    goto LABEL_13;
  }

  v12 = 0LL;
LABEL_14:

  return v12;
}

- (BMSyncAtomValue)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = -[BMPBSyncAtomValue initWithData:](objc_alloc(&OBJC_CLASS___BMPBSyncAtomValue), "initWithData:", v4);

    self = -[BMSyncAtomValue initWithProto:](self, "initWithProto:", v5);
    uint64_t v6 = self;
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  return v6;
}

- (id)proto
{
  v3 = objc_opt_new(&OBJC_CLASS___BMPBSyncAtomValue);
  sub_10001712C((uint64_t)v3, (int)-[BMSyncAtomValue type](self, "type"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncAtomValue value](self, "value"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 proto]);

  sub_1000177B8((uint64_t)v3, v5);
  return v3;
}

+ (id)atomValueFromData:(id)a3 version:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    id v7 = [objc_alloc((Class)a1) initWithProtoData:v6];
  }

  else if (a4)
  {
    uint64_t v12 = __biome_log_for_category(11LL);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100042078();
    }

    id v7 = 0LL;
  }

  else
  {
    id v16 = 0LL;
    id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  a1,  v6,  &v16));
    id v8 = v16;
    if (v8)
    {
      uint64_t v9 = __biome_log_for_category(11LL);
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      *(void *)&__int128 buf = 0LL;
      *((void *)&buf + 1) = &buf;
      uint64_t v18 = 0x2020000000LL;
      char v19 = 16;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_1000237B8;
      v15[3] = &unk_100068AD8;
      v15[4] = &buf;
      if (qword_10007C360 != -1) {
        dispatch_once(&qword_10007C360, v15);
      }
      os_log_type_t v11 = *(_BYTE *)(*((void *)&buf + 1) + 24LL);
      _Block_object_dispose(&buf, 8);
      if (os_log_type_enabled(v10, v11))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  v11,  "failed to deserialize BMSyncAtomValue with error %@",  (uint8_t *)&buf,  0xCu);
      }
    }
  }

  return v7;
}

- (id)serialize
{
  int64_t version = self->_version;
  if (version == 1) {
    return (id)objc_claimAutoreleasedReturnValue(-[BMSyncAtomValue serializeProto](self, "serializeProto"));
  }
  if (version)
  {
    uint64_t v10 = __biome_log_for_category(11LL);
    os_log_type_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v18 = 0x2020000000LL;
    char v19 = 16;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100023A5C;
    block[3] = &unk_100068AD8;
    block[4] = &buf;
    if (qword_10007C370 != -1) {
      dispatch_once(&qword_10007C370, block);
    }
    os_log_type_t v12 = *(_BYTE *)(*((void *)&buf + 1) + 24LL);
    _Block_object_dispose(&buf, 8);
    if (os_log_type_enabled(v11, v12))
    {
      int64_t v13 = self->_version;
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  v12,  "cannot serialize atom value with version %lu",  (uint8_t *)&buf,  0xCu);
    }

    id v4 = 0LL;
  }

  else
  {
    id v16 = 0LL;
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  self,  1LL,  &v16));
    id v5 = v16;
    if (v5)
    {
      uint64_t v6 = __biome_log_for_category(11LL);
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      *(void *)&__int128 buf = 0LL;
      *((void *)&buf + 1) = &buf;
      uint64_t v18 = 0x2020000000LL;
      char v19 = 16;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_100023A48;
      v15[3] = &unk_100068AD8;
      v15[4] = &buf;
      if (qword_10007C368 != -1) {
        dispatch_once(&qword_10007C368, v15);
      }
      os_log_type_t v8 = *(_BYTE *)(*((void *)&buf + 1) + 24LL);
      _Block_object_dispose(&buf, 8);
      if (os_log_type_enabled(v7, v8))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  v8,  "failed to serialize BMSyncAtomValue with error %@",  (uint8_t *)&buf,  0xCu);
      }
    }
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type = self->_type;
  id v6 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", type));
  [v6 encodeObject:v5 forKey:@"atomType"];

  [v6 encodeObject:self->_value forKey:@"atomValue"];
}

- (BMSyncAtomValue)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v5), @"atomType");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = [v7 unsignedIntegerValue];

  id v10 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(BMStoreEventAtomValue, v9),  @"atomValue");
  os_log_type_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  os_log_type_t v12 = -[BMSyncAtomValue initWithAtomType:value:version:](self, "initWithAtomType:value:version:", v8, v11, 0LL);
  return v12;
}

- (unint64_t)type
{
  return self->_type;
}

- (BMStoreEventAtomValue)value
{
  return self->_value;
}

- (int64_t)version
{
  return self->_version;
}

- (void).cxx_destruct
{
}

@end
@interface NEDNSResourceRecord
- (NSString)name;
- (NSString)resourceString;
- (int64_t)recordClass;
- (int64_t)type;
- (unint64_t)dataLength;
- (unint64_t)timeToLive;
- (void)initFromByteParser:(void *)a1;
@end

@implementation NEDNSResourceRecord

- (int64_t)type
{
  return self->_type;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (int64_t)recordClass
{
  return self->_recordClass;
}

- (unint64_t)timeToLive
{
  return self->_timeToLive;
}

- (unint64_t)dataLength
{
  return self->_dataLength;
}

- (NSString)resourceString
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void).cxx_destruct
{
}

- (void)initFromByteParser:(void *)a1
{
  v3 = a2;
  if (!a1)
  {
    v14 = 0LL;
    goto LABEL_27;
  }

  unsigned __int8 v46 = 1;
  v45.receiver = a1;
  v45.super_class = (Class)&OBJC_CLASS___NEDNSResourceRecord;
  v5 = objc_msgSendSuper2(&v45, sel_init);
  if (!v5) {
    goto LABEL_25;
  }
  uint64_t v6 = -[NEByteParser parseDomainName](v3, v4);
  v7 = (void *)v5[2];
  v5[2] = v6;

  if (!v5[2])
  {
    ne_log_obj();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    *(_WORD *)buf = 0;
    v13 = "Failed to parse RR name";
LABEL_23:
    _os_log_error_impl(&dword_1876B1000, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
    goto LABEL_24;
  }

  v5[1] = -[NEByteParser parse16Bits:]((uint64_t)v3, &v46);
  if (!v46)
  {
    ne_log_obj();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    *(_WORD *)buf = 0;
    v13 = "Failed to parse RR type";
    goto LABEL_23;
  }

  v5[3] = -[NEByteParser parse16Bits:]((uint64_t)v3, &v46);
  if (!v46)
  {
    ne_log_obj();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    *(_WORD *)buf = 0;
    v13 = "Failed to parse RR class";
    goto LABEL_23;
  }

  v5[4] = -[NEByteParser parse32Bits:]((uint64_t)v3, &v46);
  if (v46)
  {
    v8 = (const char *)-[NEByteParser parse16Bits:]((uint64_t)v3, &v46);
    v5[5] = v8;
    if (v46)
    {
      uint64_t v9 = v5[1];
      switch(v9)
      {
        case 1LL:
          if ((_DWORD)v8 != 4) {
            goto LABEL_25;
          }
          uint64_t v10 = -[NEByteParser parseAddressWithFamily:]((uint64_t)v3, 2);
          v11 = (void *)v5[6];
          v5[6] = v10;

          if (v5[6]) {
            goto LABEL_72;
          }
          ne_log_obj();
          v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            goto LABEL_24;
          }
          *(_WORD *)buf = 0;
          v13 = "Failed to parse RR A address";
          goto LABEL_23;
        case 2LL:
          uint64_t v18 = -[NEByteParser parseDomainName](v3, v8);
          v19 = (void *)v5[6];
          v5[6] = v18;

          if (v5[6]) {
            goto LABEL_72;
          }
          ne_log_obj();
          v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            goto LABEL_24;
          }
          *(_WORD *)buf = 0;
          v13 = "Failed to parse RR NS";
          goto LABEL_23;
        case 3LL:
        case 4LL:
        case 7LL:
        case 8LL:
        case 9LL:
        case 10LL:
        case 11LL:
          goto LABEL_72;
        case 5LL:
          uint64_t v20 = -[NEByteParser parseDomainName](v3, v8);
          v21 = (void *)v5[6];
          v5[6] = v20;

          if (v5[6]) {
            goto LABEL_72;
          }
          ne_log_obj();
          v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            goto LABEL_24;
          }
          *(_WORD *)buf = 0;
          v13 = "Failed to parse RR CNAME";
          goto LABEL_23;
        case 6LL:
          uint64_t v22 = -[NEByteParser parseDomainName](v3, v8);
          if (!v22)
          {
            ne_log_obj();
            v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
              goto LABEL_24;
            }
            *(_WORD *)buf = 0;
            v13 = "Failed to parse RR SOA main name";
            goto LABEL_23;
          }

          v24 = (void *)v22;
          v25 = -[NEByteParser parseDomainName](v3, v23);
          if (!v25)
          {
            ne_log_obj();
            v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
              goto LABEL_70;
            }
            *(_WORD *)buf = 0;
            v43 = "Failed to parse RR SOA responsible name";
            goto LABEL_69;
          }

          uint64_t v26 = -[NEByteParser parse32Bits:]((uint64_t)v3, &v46);
          if (!v46)
          {
            ne_log_obj();
            v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
              goto LABEL_70;
            }
            *(_WORD *)buf = 0;
            v43 = "Failed to parse RR SOA serial number";
            goto LABEL_69;
          }

          uint64_t v27 = v26;
          uint64_t v28 = -[NEByteParser parse32Bits:]((uint64_t)v3, &v46);
          if (!v46)
          {
            ne_log_obj();
            v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
              goto LABEL_70;
            }
            *(_WORD *)buf = 0;
            v43 = "Failed to parse RR SOA refresh interval";
            goto LABEL_69;
          }

          uint64_t v29 = v28;
          uint64_t v30 = -[NEByteParser parse32Bits:]((uint64_t)v3, &v46);
          if (!v46)
          {
            ne_log_obj();
            v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
              goto LABEL_70;
            }
            *(_WORD *)buf = 0;
            v43 = "Failed to parse RR SOA retry interval";
            goto LABEL_69;
          }

          uint64_t v31 = v30;
          uint64_t v32 = -[NEByteParser parse32Bits:]((uint64_t)v3, &v46);
          if (!v46)
          {
            ne_log_obj();
            v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
              goto LABEL_70;
            }
            *(_WORD *)buf = 0;
            v43 = "Failed to parse RR SOA expire interval";
            goto LABEL_69;
          }

          uint64_t v33 = v32;
          uint64_t v34 = -[NEByteParser parse32Bits:]((uint64_t)v3, &v46);
          int v35 = v46;
          if (v46)
          {
            uint64_t v36 = [objc_alloc(NSString) initWithFormat:@"%@ %@ %u %u %u %u %u", v24, v25, v27, v29, v31, v33, v34];
            v37 = (os_log_s *)v5[6];
            v5[6] = v36;
            goto LABEL_71;
          }

          ne_log_obj();
          v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v43 = "Failed to parse RR SOA minimum TTL";
LABEL_69:
            _os_log_error_impl(&dword_1876B1000, v37, OS_LOG_TYPE_ERROR, v43, buf, 2u);
          }

@end
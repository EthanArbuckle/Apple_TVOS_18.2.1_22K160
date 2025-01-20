@interface _ICDBackgroundTask
+ (BOOL)supportsSecureCoding;
+ (id)taskWithType:(int64_t)a3 configuration:(id)a4;
- (BOOL)isEqual:(id)a3;
- (ICConnectionConfiguration)configuration;
- (NSString)name;
- (_ICDBackgroundTask)initWithCoder:(id)a3;
- (id)description;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _ICDBackgroundTask

- (BOOL)isEqual:(id)a3
{
  v5 = (_ICDBackgroundTask *)a3;
  if (self == v5)
  {
    unsigned __int8 v9 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS____ICDBackgroundTask, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[_ICDBackgroundTask name](v5, "name"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[_ICDBackgroundTask name](self, "name"));
      unsigned __int8 v9 = [v7 isEqualToString:v8];
    }

    else
    {
      unsigned __int8 v9 = 0;
    }
  }

  return v9;
}

- (id)description
{
  return self->_name;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[_ICDBackgroundTask type](self, "type"), @"type");
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[_ICDBackgroundTask configuration](self, "configuration"));
  [v4 encodeObject:v5 forKey:@"config"];
}

- (_ICDBackgroundTask)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeIntegerForKey:@"type"];
  id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(ICConnectionConfiguration, v6),  @"config");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  unsigned __int8 v9 = (_ICDBackgroundTask *)objc_claimAutoreleasedReturnValue( +[_ICDBackgroundTask taskWithType:configuration:]( &OBJC_CLASS____ICDBackgroundTask,  "taskWithType:configuration:",  v5,  v8));
  return v9;
}

- (NSString)name
{
  return self->_name;
}

- (ICConnectionConfiguration)configuration
{
  return self->_configuration;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

+ (id)taskWithType:(int64_t)a3 configuration:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_alloc_init(&OBJC_CLASS____ICDBackgroundTask);
  v6->_type = a3;
  id v7 = (ICConnectionConfiguration *)[v5 copy];
  configuration = v6->_configuration;
  v6->_configuration = v7;

  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v5 userIdentity]);
  id v10 = (id)objc_claimAutoreleasedReturnValue([v9 accountDSID]);
  __int128 v73 = 0u;
  __int128 v72 = 0u;
  __int128 v71 = 0u;
  __int128 v70 = 0u;
  __int128 v69 = 0u;
  __int128 v68 = 0u;
  __int128 v67 = 0u;
  memset(&v66, 0, sizeof(v66));
  CC_SHA1_Init(&v66);
  id v11 = v10;
  CC_SHA1_Update(&v66, [v11 UTF8String], (CC_LONG)objc_msgSend(v11, "length"));

  memset(&v74[8], 0, 64);
  *(void *)v74 = 4001LL;
  CC_SHA1_Final(&v74[8], &v66);
  v75[0] = *(_OWORD *)v74;
  v75[1] = *(_OWORD *)&v74[16];
  v75[2] = *(_OWORD *)&v74[32];
  v75[3] = *(_OWORD *)&v74[48];
  uint64_t v76 = *(void *)&v74[64];
  if (*(uint64_t *)v74 > 3999)
  {
    if (*(uint64_t *)v74 > 4255)
    {
      if (*(void *)v74 == 4256LL)
      {
        v53 = (unsigned __int8 *)v75 + 8;
        v54 = (char *)calloc(0x40uLL, 1uLL);
        v55 = v54;
        for (uint64_t i = 0LL; i != 64; i += 2LL)
        {
          unsigned int v57 = *v53++;
          v58 = &v54[i];
          char *v58 = a0123456789abcd[(unint64_t)v57 >> 4];
          v58[1] = a0123456789abcd[v57 & 0xF];
        }

        v24 = objc_alloc(&OBJC_CLASS___NSString);
        v25 = v55;
        uint64_t v26 = 64LL;
      }

      else
      {
        if (*(void *)v74 != 4512LL) {
          goto LABEL_50;
        }
        v31 = (unsigned __int8 *)v75 + 8;
        v32 = (char *)calloc(0x80uLL, 1uLL);
        v33 = v32;
        for (uint64_t j = 0LL; j != 128; j += 2LL)
        {
          unsigned int v35 = *v31++;
          v36 = &v32[j];
          char *v36 = a0123456789abcd[(unint64_t)v35 >> 4];
          v36[1] = a0123456789abcd[v35 & 0xF];
        }

        v24 = objc_alloc(&OBJC_CLASS___NSString);
        v25 = v33;
        uint64_t v26 = 128LL;
      }
    }

    else if (*(void *)v74 == 4000LL)
    {
      v43 = (unsigned __int8 *)v75 + 8;
      v44 = (char *)calloc(0x20uLL, 1uLL);
      v45 = v44;
      for (uint64_t k = 0LL; k != 32; k += 2LL)
      {
        unsigned int v47 = *v43++;
        v48 = &v44[k];
        char *v48 = a0123456789abcd[(unint64_t)v47 >> 4];
        v48[1] = a0123456789abcd[v47 & 0xF];
      }

      v24 = objc_alloc(&OBJC_CLASS___NSString);
      v25 = v45;
      uint64_t v26 = 32LL;
    }

    else
    {
      if (*(void *)v74 != 4001LL) {
        goto LABEL_50;
      }
      v18 = (unsigned __int8 *)v75 + 8;
      v19 = (char *)calloc(0x28uLL, 1uLL);
      v20 = v19;
      for (uint64_t m = 0LL; m != 40; m += 2LL)
      {
        unsigned int v22 = *v18++;
        v23 = &v19[m];
        char *v23 = a0123456789abcd[(unint64_t)v22 >> 4];
        v23[1] = a0123456789abcd[v22 & 0xF];
      }

      v24 = objc_alloc(&OBJC_CLASS___NSString);
      v25 = v20;
      uint64_t v26 = 40LL;
    }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
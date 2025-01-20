@interface WAProtobufMessageSubmitter
- (basic_string<char,)_fieldNameFromKey:(std::allocator<char>> *__return_ptr)retstr;
- (id)_generateSetterInvocationFromInstance:(id)a3 andFieldKey:(id)a4 isRepeatable:(BOOL)a5;
- (id)instantiateAWDProtobufAndPopulateValues:(id)a3;
@end

@implementation WAProtobufMessageSubmitter

- (id)instantiateAWDProtobufAndPopulateValues:(id)a3
{
  id v4 = a3;
  v65 = v4;
  v5 = (NSString *)objc_claimAutoreleasedReturnValue([v4 originalClassName]);
  id v6 = objc_alloc_init(NSClassFromString(v5));

  if (v4)
  {
    if (v6)
    {
      __int128 v69 = 0u;
      __int128 v70 = 0u;
      __int128 v67 = 0u;
      __int128 v68 = 0u;
      obj = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 mutableFields]);
      id v7 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v67,  v66,  16LL);
      if (v7)
      {
        v8 = 0LL;
        uint64_t v61 = *(void *)v68;
        while (1)
        {
          uint64_t v9 = 0LL;
          id v62 = v7;
          do
          {
            if (*(void *)v68 != v61) {
              objc_enumerationMutation(obj);
            }
            uint64_t v64 = v9;
            uint64_t v10 = *(void *)(*((void *)&v67 + 1) + 8 * v9);
            context = objc_autoreleasePoolPush();
            v11 = (void *)objc_claimAutoreleasedReturnValue([v65 mutableFields]);
            v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v10]);

            unint64_t v13 = 0LL;
            while ([v12 isRepeatable])
            {
              v14 = (void *)objc_claimAutoreleasedReturnValue([v12 repeatableValues]);
              BOOL v15 = v13 < (unint64_t)[v14 count];

              if (!v15) {
                goto LABEL_66;
              }
LABEL_13:
              v16 = (void *)objc_claimAutoreleasedReturnValue([v12 key]);
              v17 = (void *)objc_claimAutoreleasedReturnValue( -[WAProtobufMessageSubmitter _generateSetterInvocationFromInstance:andFieldKey:isRepeatable:]( self,  "_generateSetterInvocationFromInstance:andFieldKey:isRepeatable:",  v6,  v16,  [v12 isRepeatable]));

              v8 = v17;
              if ((objc_opt_respondsToSelector(v6, [v17 selector]) & 1) == 0)
              {
                id v18 = WALogCategoryDefaultHandle();
                v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                {
                  v20 = NSStringFromSelector((SEL)[v8 selector]);
                  id v21 = (id)objc_claimAutoreleasedReturnValue(v20);
                  v22 = (void *)objc_claimAutoreleasedReturnValue([v65 key]);
                  v23 = (void *)objc_claimAutoreleasedReturnValue([v12 key]);
                  *(_DWORD *)buf = 136447234;
                  *(void *)&buf[4] = "-[WAProtobufMessageSubmitter instantiateAWDProtobufAndPopulateValues:]";
                  __int16 v72 = 1024;
                  int v73 = 31;
                  __int16 v74 = 2112;
                  id v75 = v21;
                  __int16 v76 = 2112;
                  v77 = v22;
                  __int16 v78 = 2112;
                  id v79 = v23;
                  _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Instantiated metric class doesn't respond to expected selector for setting! Selector: %@ on a class with key: %@ for field with key: %@",  buf,  0x30u);
                }
              }

              switch((unint64_t)[v12 type])
              {
                case 1uLL:
                  if ([v12 isRepeatable])
                  {
                    v35 = (void *)objc_claimAutoreleasedReturnValue([v12 repeatableValues]);
                    v36 = (void *)objc_claimAutoreleasedReturnValue([v35 objectAtIndexedSubscript:v13]);
                    [v36 doubleValue];
                    uint64_t v38 = v37;
                  }

                  else
                  {
                    [v12 doubleValue];
                    uint64_t v38 = v51;
                  }

                  *(void *)buf = v38;
                  [v8 setArgument:buf atIndex:2];
                  break;
                case 2uLL:
                  if ([v12 isRepeatable])
                  {
                    v39 = (void *)objc_claimAutoreleasedReturnValue([v12 repeatableValues]);
                    v40 = (void *)objc_claimAutoreleasedReturnValue([v39 objectAtIndexedSubscript:v13]);
                    [v40 floatValue];
                    int v42 = v41;
                  }

                  else
                  {
                    [v12 floatValue];
                    int v42 = v52;
                  }

                  *(_DWORD *)buf = v42;
                  [v8 setArgument:buf atIndex:2];
                  break;
                case 3uLL:
                  if ([v12 isRepeatable])
                  {
                    v30 = (void *)objc_claimAutoreleasedReturnValue([v12 repeatableValues]);
                    v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectAtIndexedSubscript:v13]);
                    unsigned int v27 = [v31 intValue];
                  }

                  else
                  {
                    unsigned int v27 = [v12 int32Value];
                  }

                  goto LABEL_42;
                case 4uLL:
                  if ([v12 isRepeatable])
                  {
                    v32 = (void *)objc_claimAutoreleasedReturnValue([v12 repeatableValues]);
                    v33 = (void *)objc_claimAutoreleasedReturnValue([v32 objectAtIndexedSubscript:v13]);
                    id v34 = [v33 longLongValue];
                  }

                  else
                  {
                    id v34 = [v12 int64Value];
                  }

                  goto LABEL_47;
                case 5uLL:
                  if ([v12 isRepeatable])
                  {
                    v25 = (void *)objc_claimAutoreleasedReturnValue([v12 repeatableValues]);
                    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectAtIndexedSubscript:v13]);
                    unsigned int v27 = [v26 unsignedIntValue];
                  }

                  else
                  {
                    unsigned int v27 = [v12 uint32Value];
                  }

- (id)_generateSetterInvocationFromInstance:(id)a3 andFieldKey:(id)a4 isRepeatable:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [v9 UTF8String];
  unint64_t v11 = (unint64_t)[v9 lengthOfBytesUsingEncoding:4];
  v12 = (void *)v11;
  if (v11 >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_10002B8A8();
  }
  if (v11 >= 0x17)
  {
    uint64_t v14 = (v11 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((v11 | 7) != 0x17) {
      uint64_t v14 = v11 | 7;
    }
    uint64_t v15 = v14 + 1;
    unint64_t v13 = (void **)operator new(v14 + 1);
    __dst[1] = v12;
    unint64_t v41 = v15 | 0x8000000000000000LL;
    __dst[0] = v13;
    goto LABEL_8;
  }

  HIBYTE(v41) = v11;
  unint64_t v13 = __dst;
  if (v11) {
LABEL_8:
  }
    memmove(v13, v10, (size_t)v12);
  *((_BYTE *)v12 + (void)v13) = 0;
  -[WAProtobufMessageSubmitter _fieldNameFromKey:](self, "_fieldNameFromKey:", __dst);
  if (SHIBYTE(v41) < 0) {
    operator delete(__dst[0]);
  }
  if (v5) {
    v16 = "add";
  }
  else {
    v16 = "set";
  }
  std::operator+<char>(v38, v16, &v42);
  if (v39 >= 0) {
    size_t v17 = HIBYTE(v39);
  }
  else {
    size_t v17 = (size_t)v38[1];
  }
  id v18 = __p;
  sub_10002B928((uint64_t)__p, v17 + 1);
  if (__p[23] < 0) {
    id v18 = *(_BYTE **)__p;
  }
  if (v17)
  {
    if (v39 >= 0) {
      v19 = v38;
    }
    else {
      v19 = (void **)v38[0];
    }
    memmove(v18, v19, v17);
  }

  *(_WORD *)&v18[v17] = 58;
  if (__p[23] >= 0) {
    v20 = __p;
  }
  else {
    v20 = *(const char **)__p;
  }
  SEL v21 = sel_registerName(v20);
  if ((__p[23] & 0x80000000) != 0) {
    operator delete(*(void **)__p);
  }
  id v22 = [(id)objc_opt_class(v8) instanceMethodSignatureForSelector:v21];
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  if (v23) {
    goto LABEL_55;
  }
  if ((char)v42.__r_.__value_.__s.__size_ < 0)
  {
    v25 = (std::string *)v42.__r_.__value_.__r.__words[0];
    if (*(_BYTE *)(v42.__r_.__value_.__r.__words[0] + v42.__r_.__value_.__l.__size_ - 1) == 115)
    {
      uint64_t v24 = --v42.__r_.__value_.__l.__size_;
      goto LABEL_35;
    }
  }

  else if (v42.__r_.__value_.__s.__data_[v42.__r_.__value_.__s.__size_ - 1] == 115)
  {
    uint64_t v24 = v42.__r_.__value_.__s.__size_ - 1LL;
    v42.__r_.__value_.__s.__size_ = (v42.__r_.__value_.__s.__size_ - 1) & 0x7F;
    v25 = &v42;
LABEL_35:
    v25->__r_.__value_.__s.__data_[v24] = 0;
    goto LABEL_37;
  }

  std::string::append(&v42, "s");
LABEL_37:
  std::operator+<char>(__p, v16, &v42);
  if (SHIBYTE(v39) < 0) {
    operator delete(v38[0]);
  }
  uint64_t v39 = *(void *)&__p[16];
  *(_OWORD *)uint64_t v38 = *(_OWORD *)__p;
  if (__p[23] >= 0) {
    size_t v26 = HIBYTE(*(void *)&__p[16]);
  }
  else {
    size_t v26 = *(void *)&__p[8];
  }
  unsigned int v27 = __p;
  sub_10002B928((uint64_t)__p, v26 + 1);
  if (__p[23] < 0) {
    unsigned int v27 = *(_BYTE **)__p;
  }
  if (v26)
  {
    if (v39 >= 0) {
      v28 = v38;
    }
    else {
      v28 = (void **)v38[0];
    }
    memmove(v27, v28, v26);
  }

  *(_WORD *)&v27[v26] = 58;
  if (__p[23] >= 0) {
    v29 = __p;
  }
  else {
    v29 = *(const char **)__p;
  }
  SEL v21 = sel_registerName(v29);
  if ((__p[23] & 0x80000000) != 0) {
    operator delete(*(void **)__p);
  }
  id v30 = [(id)objc_opt_class(v8) instanceMethodSignatureForSelector:v21];
  v23 = (void *)objc_claimAutoreleasedReturnValue(v30);
  if (v23)
  {
LABEL_55:
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSInvocation invocationWithMethodSignature:]( &OBJC_CLASS___NSInvocation,  "invocationWithMethodSignature:",  v23,  v38[0],  v38[1],  v39));
    [v31 setTarget:v8];
    [v31 setSelector:v21];
    goto LABEL_56;
  }

  id v34 = WALogCategoryDefaultHandle();
  v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    v36 = &v42;
    if ((v42.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      v36 = (std::string *)v42.__r_.__value_.__r.__words[0];
    }
    uint64_t v37 = v38;
    if (v39 < 0) {
      uint64_t v37 = (void **)v38[0];
    }
    *(_DWORD *)__p = 136447234;
    *(void *)&__p[4] = "-[WAProtobufMessageSubmitter _generateSetterInvocationFromInstance:andFieldKey:isRepeatable:]";
    *(_WORD *)&__p[12] = 1024;
    *(_DWORD *)&__p[14] = 132;
    *(_WORD *)&__p[18] = 2112;
    *(void *)&__p[20] = v9;
    __int16 v44 = 2080;
    v45 = v36;
    __int16 v46 = 2080;
    unsigned __int8 v47 = v37;
    _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:PARSER: Failed to generate method signature from fieldKey: %@ which resulted in AWD container field name: %s andSelectorString:%s",  __p,  0x30u);
  }

  v23 = 0LL;
  v31 = 0LL;
LABEL_56:
  id v32 = v31;
  if (SHIBYTE(v39) < 0) {
    operator delete(v38[0]);
  }

  return v32;
}

- (basic_string<char,)_fieldNameFromKey:(std::allocator<char>> *__return_ptr)retstr
{
  v2 = v1;
  v3 = (std::string *)retstr;
  *(_OWORD *)retstr->var0.var0.var0.var0.var0 = 0uLL;
  *((void *)&retstr->var0.var0.var0.var1 + 2) = 0LL;
  std::string::size_type size = v1->__r_.__value_.__s.__size_;
  if ((char)v1->__r_.__value_.__s.__size_ < 0)
  {
    std::string::size_type v5 = v1->__r_.__value_.__r.__words[0];
    std::string::size_type v6 = v1->__r_.__value_.__l.__size_;
  }

  else
  {
    std::string::size_type v5 = (std::string::size_type)v1;
    std::string::size_type v6 = v1->__r_.__value_.__s.__size_;
  }

  id v7 = (unsigned __int8 *)(v5 + v6);
  if (v6)
  {
    id v8 = (unsigned __int8 *)v5;
    id v9 = (unsigned __int8 *)(v5 + v6);
    do
    {
      id v10 = v8;
      unint64_t v11 = v8;
      while (1)
      {
        int v12 = *v11++;
        if (v12 == 95) {
          break;
        }
        id v10 = v11;
        if (v11 == v7)
        {
          id v10 = v9;
          goto LABEL_13;
        }
      }

      id v8 = v10 + 1;
      id v9 = v10;
    }

    while (v11 != v7);
  }

  else
  {
    id v10 = (unsigned __int8 *)v5;
  }

@end
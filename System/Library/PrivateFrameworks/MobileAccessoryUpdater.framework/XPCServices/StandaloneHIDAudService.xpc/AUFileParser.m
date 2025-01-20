@interface AUFileParser
+ (id)auTypeString:(unsigned __int8)a3;
+ (id)loadParsersFromFWDirectory:(id)a3 logHandle:(id)a4 productID:(id)a5 equivalentPIDs:(id)a6 errorDomain:(id)a7 STFWFirst:(id)a8 parsers:(id)a9;
- (AUFileParser)initWithFilePath:(id)a3 productID:(id)a4 equivalentPIDs:(id)a5 logHandle:(id)a6 errorDomain:(id)a7 error:(id *)a8;
- (BOOL)personalizationRequired;
- (NSData)payload;
- (NSNumber)headerSignature;
- (NSString)filePath;
- (OS_os_log)logHandle;
- (id)createAFUManifest:(id)a3;
- (id)description;
- (id)getAppleUpdateHeaderField:(unint64_t)a3;
- (id)getFTABDigests;
- (id)getFirmwareType;
- (id)getFirmwareVersion;
- (id)getHardwareRevisionID;
- (id)getPID;
- (void)setFilePath:(id)a3;
@end

@implementation AUFileParser

- (AUFileParser)initWithFilePath:(id)a3 productID:(id)a4 equivalentPIDs:(id)a5 logHandle:(id)a6 errorDomain:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v74.receiver = self;
  v74.super_class = (Class)&OBJC_CLASS___AUFileParser;
  v19 = -[AUFileParser init](&v74, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_logHandle, a6);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    char v73 = 0;
    if (![v21 fileExistsAtPath:v14 isDirectory:&v73] || v73)
    {

      v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid AU file %@",  v14));
      if (a8)
      {
        v32 = objc_alloc(&OBJC_CLASS___NSError);
        NSErrorUserInfoKey v84 = NSLocalizedDescriptionKey;
        v85 = v31;
        v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v85,  &v84,  1LL));
        *a8 = -[NSError initWithDomain:code:userInfo:](v32, "initWithDomain:code:userInfo:", v18, 47LL, v33);
      }

      goto LABEL_17;
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 attributesOfItemAtPath:v14 error:0]);
    v23 = v22;
    if (!v22)
    {

      v20 = (AUFileParser *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No file attributes for %@",  v14));
      if (a8)
      {
        v68 = a8;
        v34 = objc_alloc(&OBJC_CLASS___NSError);
        NSErrorUserInfoKey v82 = NSLocalizedDescriptionKey;
        v83 = v20;
        v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v83,  &v82,  1LL));
        v28 = v34;
        id v29 = v18;
        uint64_t v30 = 47LL;
        goto LABEL_13;
      }

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AUFileParser getFirmwareType](self, "getFirmwareType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[AUFileParser auTypeString:]( AUFileParser,  "auTypeString:",  [v3 unsignedIntValue]));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AUFileParser getFirmwareVersion](self, "getFirmwareVersion"));
  id v6 = [v5 unsignedIntValue];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AUFileParser getHardwareRevisionID](self, "getHardwareRevisionID"));
  id v8 = [v7 unsignedIntValue];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AUFileParser getPID](self, "getPID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ version 0x%X HW revision ID 0x%X product ID 0x%X",  v4,  v6,  v8,  [v9 unsignedIntValue]));

  return v10;
}

- (id)getAppleUpdateHeaderField:(unint64_t)a3
{
  unsigned __int16 v6 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AUFileParser payload](self, "payload"));
  objc_msgSend(v4, "getBytes:range:", &v6, a3, 2);

  return (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  v6));
}

- (NSNumber)headerSignature
{
  return (NSNumber *)-[AUFileParser getAppleUpdateHeaderField:](self, "getAppleUpdateHeaderField:", 0LL);
}

- (id)getPID
{
  return -[AUFileParser getAppleUpdateHeaderField:](self, "getAppleUpdateHeaderField:", 16LL);
}

- (id)getFirmwareType
{
  return -[AUFileParser getAppleUpdateHeaderField:](self, "getAppleUpdateHeaderField:", 4LL);
}

- (id)getFirmwareVersion
{
  return -[AUFileParser getAppleUpdateHeaderField:](self, "getAppleUpdateHeaderField:", 6LL);
}

- (id)getHardwareRevisionID
{
  v2 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[AUFileParser getAppleUpdateHeaderField:](self, "getAppleUpdateHeaderField:", 18LL));
  if (![v2 intValue])
  {

    v2 = &off_100026A68;
  }

  return v2;
}

- (BOOL)personalizationRequired
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AUFileParser getFirmwareType](self, "getFirmwareType"));
  BOOL v3 = [v2 unsignedIntValue] == 112;

  return v3;
}

- (id)getFTABDigests
{
  BOOL v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AUFileParser payload](self, "payload"));
  id v5 = [v4 length];

  if ((unint64_t)v5 > 0xC0)
  {
    unint64_t v7 = (unint64_t)v5 - 128;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AUFileParser payload](self, "payload"));
    id v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subdataWithRange:", 128, v7));
    v10 = (unsigned int *)[v9 bytes];

    unint64_t v11 = v10[10];
    if (v7 >= 16 * v11 + 64 && (unint64_t)[&off_100026BC0 count] <= v11)
    {
      if (![&off_100026BC0 count]) {
        return v3;
      }
      uint64_t v13 = 0LL;
      for (i = v10 + 14; v7 >= (*i + *(i - 1)); i += 4)
      {
        ccdigest(&ccsha384_ltc_di);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v17, 48LL));
        id v16 = (void *)objc_claimAutoreleasedReturnValue([&off_100026BC0 objectAtIndexedSubscript:v13]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v15, v16);
      }

      unsigned __int16 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[AUFileParser logHandle](self, "logHandle"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_100017388(v6);
      }
    }

    else
    {
      unsigned __int16 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[AUFileParser logHandle](self, "logHandle"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_100017314(v11, v6);
      }
    }
  }

  else
  {
    unsigned __int16 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[AUFileParser logHandle](self, "logHandle"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000172A0((uint64_t)v5, v6);
    }
  }

  return v3;
}

- (id)createAFUManifest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AUFileParser payload](self, "payload"));
  objc_msgSend(v5, "getBytes:range:", v11, 0, 20);

  __int16 v12 = 113;
  unsigned int v13 = [v4 length];
  id v6 = v4;
  int v14 = crc32(0, (const Bytef *)[v6 bytes], (uInt)objc_msgSend(v6, "length"));
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](&OBJC_CLASS___NSMutableData, "dataWithLength:", 124LL));
  objc_msgSend(v7, "replaceBytesInRange:withBytes:", 0, 20, v11);
  id v8 = v7;
  int v10 = crc32(0, (const Bytef *)[v8 bytes], (uInt)objc_msgSend(v8, "length"));
  [v8 appendBytes:&v10 length:4];
  [v8 appendData:v6];

  return v8;
}

+ (id)auTypeString:(unsigned __int8)a3
{
  if ((int)a3 <= 111)
  {
    if ((int)a3 > 63)
    {
      if ((int)a3 <= 79)
      {
        if (a3 == 64) {
          return @"kAUTypeAudioFW";
        }
        if (a3 == 65) {
          return @"kAUTypeAudioCalFW";
        }
      }

      else
      {
        switch(a3)
        {
          case 'P':
            return @"kAUTypeChargerFW";
          case 'X':
            return @"kAUTypePowerFW";
            return @"kAUTypeAccelAlgs";
        }
      }
    }

    else if ((int)a3 <= 31)
    {
      if (!a3) {
        return @"kAUTypeUnknown";
      }
      if (a3 == 1) {
        return @"kAUTypeSTFW";
      }
    }

    else
    {
      switch(a3)
      {
        case ' ':
          return @"kAUTypeMTFW";
        case '0':
          return @"kAUTypeRadioFW";
        case '1':
          BOOL v3 = @"kAUTypeRadioDiags";
          return v3;
      }
    }

+ (id)loadParsersFromFWDirectory:(id)a3 logHandle:(id)a4 productID:(id)a5 equivalentPIDs:(id)a6 errorDomain:(id)a7 STFWFirst:(id)a8 parsers:(id)a9
{
  id v63 = a3;
  int v14 = (os_log_s *)a4;
  id v65 = a5;
  id v64 = a6;
  id v66 = a7;
  id v70 = a8;
  id v69 = a9;
  oslog = v14;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_1000173C8((uint64_t)v63, v14);
  }
  uint64_t v106 = 0LL;
  v107 = (id *)&v106;
  uint64_t v108 = 0x3032000000LL;
  v109 = sub_10000DDCC;
  v110 = sub_10000DDDC;
  id v111 = 0LL;
  v105[0] = _NSConcreteStackBlock;
  v105[1] = 3221225472LL;
  v105[2] = sub_10000DDE4;
  v105[3] = &unk_1000247A8;
  v105[4] = &v106;
  v62 = objc_retainBlock(v105);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  NSURLResourceKey v16 = NSURLIsDirectoryKey;
  v121[0] = NSURLNameKey;
  v121[1] = NSURLIsDirectoryKey;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v121, 2LL));
  id v18 = (void *)objc_claimAutoreleasedReturnValue( [v15 enumeratorAtURL:v63 includingPropertiesForKeys:v17 options:4 errorHandler:v62]);

  v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  char v73 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  __int128 v101 = 0u;
  __int128 v102 = 0u;
  id obj = v18;
  id v20 = [obj countByEnumeratingWithState:&v101 objects:v120 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v102;
    while (2)
    {
      v22 = 0LL;
      id v75 = v20;
      do
      {
        if (*(void *)v102 != v21) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v101 + 1) + 8LL * (void)v22);
        id v99 = 0LL;
        id v100 = 0LL;
        v24 = v107;
        [v23 getResourceValue:&v100 forKey:v16 error:&v99];
        id v25 = v100;
        objc_storeStrong(v24 + 5, v99);
        if (v107[5]) {
          goto LABEL_25;
        }
        if (([v25 BOOLValue] & 1) == 0)
        {
          id v97 = 0LL;
          id v98 = 0LL;
          v26 = v107;
          [v23 getResourceValue:&v98 forKey:NSURLNameKey error:&v97];
          id v27 = v98;
          objc_storeStrong(v26 + 5, v97);
          if (v107[5]) {
            goto LABEL_24;
          }
          uint64_t v28 = v21;
          id v29 = v16;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v119 = v27;
            _os_log_debug_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEBUG,  "loading firmware file %@",  buf,  0xCu);
          }

          uint64_t v30 = objc_alloc(&OBJC_CLASS___AUFileParser);
          v31 = (void *)objc_claimAutoreleasedReturnValue([v23 path]);
          v32 = v107 + 5;
          id v96 = v107[5];
          v33 = -[AUFileParser initWithFilePath:productID:equivalentPIDs:logHandle:errorDomain:error:]( v30,  "initWithFilePath:productID:equivalentPIDs:logHandle:errorDomain:error:",  v31,  v65,  v64,  oslog,  v66,  &v96);
          objc_storeStrong(v32, v96);
          NSURLResourceKey v16 = v29;
          uint64_t v21 = v28;
          id v20 = v75;

          if (v107[5])
          {

LABEL_24:
LABEL_25:

            goto LABEL_26;
          }

          v34 = (void *)objc_claimAutoreleasedReturnValue(-[AUFileParser getHardwareRevisionID](v33, "getHardwareRevisionID"));
          if ([v34 isEqualToNumber:&off_100026A68])
          {
            -[NSMutableArray addObject:](v73, "addObject:", v33);
          }

          else
          {
            uint64_t v35 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v19,  "objectForKeyedSubscript:",  v34));
            if (!v35)
            {
              uint64_t v35 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
              -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v35, v34);
            }

            -[NSMutableArray addObject:](v35, "addObject:", v33);
          }
        }

        v22 = (char *)v22 + 1;
      }

      while (v20 != v22);
      id v20 = [obj countByEnumeratingWithState:&v101 objects:v120 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
}

- (NSData)payload
{
  return self->_payload;
}

- (OS_os_log)logHandle
{
  return self->_logHandle;
}

- (void).cxx_destruct
{
}

@end
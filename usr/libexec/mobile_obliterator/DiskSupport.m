@interface DiskSupport
+ (id)sharedInstance;
- (BOOL)dryRunOnly;
- (BOOL)removeFSItem:(id)a3 error:(id *)a4;
- (BOOL)traverseFolderAndRemoveItems:(id)a3 exceptions:(id)a4;
- (DiskSupport)init;
- (void)setDryRunOnly:(BOOL)a3;
@end

@implementation DiskSupport

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000756C;
  block[3] = &unk_100024B98;
  block[4] = a1;
  if (qword_100028D28 != -1) {
    dispatch_once(&qword_100028D28, block);
  }
  return (id)qword_100028D20;
}

- (DiskSupport)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DiskSupport;
  result = -[DiskSupport init](&v3, "init");
  if (result) {
    result->_dryRunOnly = 0;
  }
  return result;
}

- (BOOL)traverseFolderAndRemoveItems:(id)a3 exceptions:(id)a4
{
  unsigned int v6 = objc_msgSend( objc_msgSend(a4, "objectForKeyedSubscript:", off_1000286C8),  "isEqualToString:",  @"remove");
  obj = -[NSFileManager contentsOfDirectoryAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "contentsOfDirectoryAtPath:error:",  a3,  0LL);
  v7 = &AKSIdentityCreateFirst_ptr;
  v8 = "Keeping";
  unsigned int v157 = v6;
  if (v6) {
    v8 = "Removing";
  }
  v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s the contents of '%@' (exceptionList: %@)",  v8,  a3,  a4);
  v10 = CFStringCreateWithFormat(0LL, 0LL, @"%@", v9);
  if (v10)
  {
    v11 = v10;
    CStringPtr = CFStringGetCStringPtr(v10, 0x8000100u);
    if (CStringPtr) {
      v13 = CStringPtr;
    }
    else {
      v13 = "<error getting string>";
    }
    sub_10000444C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", v13);
    CFRelease(v11);
  }

  else
  {
    sub_10000444C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", "<error getting string>");
  }

  free(v9);
  __int128 v201 = 0u;
  __int128 v202 = 0u;
  __int128 v199 = 0u;
  __int128 v200 = 0u;
  id v163 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v199,  v212,  16LL);
  if (!v163) {
    return 1;
  }
  v14 = &AKSIdentityCreateFirst_ptr;
  uint64_t v162 = *(void *)v200;
  id v167 = a3;
  while (2)
  {
    uint64_t v15 = 0LL;
    do
    {
      if (*(void *)v200 != v162) {
        objc_enumerationMutation(obj);
      }
      uint64_t v168 = v15;
      v16 = *(void **)(*((void *)&v199 + 1) + 8 * v15);
      id v169 = objc_msgSend(v7[144], "pathWithComponents:", objc_msgSend(v14[140], "arrayWithObjects:", a3, v16, 0));
      v17 = (__CFString *)[a4 objectForKeyedSubscript:v16];
      if (v17)
      {
LABEL_42:
        id v37 = [v7[144] stringWithFormat:@"Found exception '%@' for '%@'", v17, v16, v156];
      }

      else
      {
        __int128 v197 = 0u;
        __int128 v198 = 0u;
        __int128 v195 = 0u;
        __int128 v196 = 0u;
        id v18 = [a4 countByEnumeratingWithState:&v195 objects:v211 count:16];
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = *(void *)v196;
          while (2)
          {
            for (i = 0LL; i != v19; i = (char *)i + 1)
            {
              if (*(void *)v196 != v20) {
                objc_enumerationMutation(a4);
              }
              v22 = *(void **)(*((void *)&v195 + 1) + 8LL * (void)i);
              if (![v22 rangeOfString:objc_msgSend(v7[144], "stringWithFormat:", @"%@/", v16)])
              {
                id v31 = [v7[144] stringWithFormat:@"==> auto-traverse due to '%@'", objc_msgSend(v22, "substringWithRange:", v23, (char *)objc_msgSend(v22, "length") - v23)];
                v32 = CFStringCreateWithFormat(0LL, 0LL, @"%@", v31);
                if (v32)
                {
                  v33 = v32;
                  v34 = CFStringGetCStringPtr(v32, 0x8000100u);
                  v35 = "<error getting string>";
                  if (v34) {
                    v35 = v34;
                  }
                  sub_10000444C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", v35);
                  CFRelease(v33);
                }

                else
                {
                  sub_10000444C( 1,  "%s: %s",  "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]",  "<error getting string>");
                }

                free(v31);
                v17 = @"traverse";
                goto LABEL_42;
              }
            }

            id v19 = [a4 countByEnumeratingWithState:&v195 objects:v211 count:16];
            if (v19) {
              continue;
            }
            break;
          }
        }

        __int128 v193 = 0u;
        __int128 v194 = 0u;
        __int128 v191 = 0u;
        __int128 v192 = 0u;
        id v24 = [a4 countByEnumeratingWithState:&v191 objects:v210 count:16];
        if (!v24)
        {
LABEL_31:
          a3 = v167;
          v14 = &AKSIdentityCreateFirst_ptr;
          id v30 = v169;
          if ((v157 & 1) == 0) {
            goto LABEL_69;
          }
          goto LABEL_68;
        }

        id v25 = v24;
        uint64_t v26 = *(void *)v192;
LABEL_25:
        uint64_t v27 = 0LL;
        while (1)
        {
          if (*(void *)v192 != v26) {
            objc_enumerationMutation(a4);
          }
          uint64_t v28 = *(void *)(*((void *)&v191 + 1) + 8 * v27);
          -[NSRegularExpression rangeOfFirstMatchInString:options:range:]( +[NSRegularExpression regularExpressionWithPattern:options:error:]( NSRegularExpression,  "regularExpressionWithPattern:options:error:",  v28,  0,  0),  "rangeOfFirstMatchInString:options:range:",  v16,  0,  0,  [v16 length]);
          if (v29 == [v16 length]) {
            break;
          }
          if (v25 == (id)++v27)
          {
            id v25 = [a4 countByEnumeratingWithState:&v191 objects:v210 count:16];
            if (v25) {
              goto LABEL_25;
            }
            goto LABEL_31;
          }
        }

        v36 = (__CFString *)[a4 objectForKeyedSubscript:v28];
        if (!v36)
        {
          a3 = v167;
          v14 = &AKSIdentityCreateFirst_ptr;
          id v30 = v169;
          if (v157) {
            goto LABEL_68;
          }
          goto LABEL_69;
        }

        v17 = v36;
        if (!v28) {
          goto LABEL_42;
        }
        id v37 = [v7[144] stringWithFormat:@"Found regexp-exception '%@' for '%@', regexp '%@'", v36, v16, v28];
      }

      v38 = v37;
      v39 = CFStringCreateWithFormat(0LL, 0LL, @"%@", v37);
      if (v39)
      {
        v40 = v39;
        v41 = CFStringGetCStringPtr(v39, 0x8000100u);
        v42 = "<error getting string>";
        if (v41) {
          v42 = v41;
        }
        sub_10000444C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", v42);
        CFRelease(v40);
      }

      else
      {
        sub_10000444C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", "<error getting string>");
      }

      free(v38);
      unsigned __int8 v43 = -[__CFString isEqualToString:](v17, "isEqualToString:", @"remove");
      v44 = "removed";
      if ((v43 & 1) != 0) {
        goto LABEL_61;
      }
      unsigned __int8 v45 = -[__CFString isEqualToString:](v17, "isEqualToString:", @"keep");
      v44 = "kept";
      if ((v45 & 1) != 0) {
        goto LABEL_61;
      }
      if (-[__CFString isEqualToString:](v17, "isEqualToString:", @"traverse"))
      {
        unsigned __int8 v164 = v43;
        v46 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        id v47 = [a4 objectForKeyedSubscript:off_1000286C8];
        -[NSMutableDictionary setObject:forKey:](v46, "setObject:forKey:", v47, off_1000286C8);
        __int128 v189 = 0u;
        __int128 v190 = 0u;
        __int128 v187 = 0u;
        __int128 v188 = 0u;
        id v48 = [a4 countByEnumeratingWithState:&v187 objects:v209 count:16];
        if (v48)
        {
          id v49 = v48;
          uint64_t v50 = *(void *)v188;
          do
          {
            for (j = 0LL; j != v49; j = (char *)j + 1)
            {
              if (*(void *)v188 != v50) {
                objc_enumerationMutation(a4);
              }
              v52 = *(void **)(*((void *)&v187 + 1) + 8LL * (void)j);
              if (!objc_msgSend(v52, "rangeOfString:", objc_msgSend(v16, "stringByAppendingString:", @"/"))) {
                -[NSMutableDictionary setObject:forKey:]( v46,  "setObject:forKey:",  [a4 objectForKeyedSubscript:v52],  objc_msgSend(v52, "substringWithRange:", v53, (char *)objc_msgSend(v52, "length") - v53));
              }
            }

            id v49 = [a4 countByEnumeratingWithState:&v187 objects:v209 count:16];
          }

          while (v49);
        }

        -[DiskSupport traverseFolderAndRemoveItems:exceptions:]( +[DiskSupport sharedInstance](&OBJC_CLASS___DiskSupport, "sharedInstance"),  "traverseFolderAndRemoveItems:exceptions:",  v169,  v46);
        v44 = "kept";
        v7 = &AKSIdentityCreateFirst_ptr;
        unsigned __int8 v43 = v164;
LABEL_61:
        id v54 = [v7[144] stringWithFormat:@"According to rules, '%@' will be %s", v16, v44];
        v55 = CFStringCreateWithFormat(0LL, 0LL, @"%@", v54);
        id v30 = v169;
        if (v55)
        {
          v56 = v55;
          v57 = CFStringGetCStringPtr(v55, 0x8000100u);
          if (v57) {
            v58 = v57;
          }
          else {
            v58 = "<error getting string>";
          }
          sub_10000444C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", v58);
          CFRelease(v56);
        }

        else
        {
          sub_10000444C( 1,  "%s: %s",  "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]",  "<error getting string>");
        }

        a3 = v167;
        v14 = &AKSIdentityCreateFirst_ptr;
        free(v54);
        if ((v43 & 1) == 0) {
          goto LABEL_69;
        }
LABEL_68:
        uint64_t v170 = 0LL;
        if (!-[DiskSupport removeFSItem:error:](self, "removeFSItem:error:", v30, &v170))
        {
          id v143 = [v7[144] stringWithFormat:@"Error: Failed to delete '%@' with error %@!", v30, v170];
          v144 = CFStringCreateWithFormat(0LL, 0LL, @"%@", v143);
          if (!v144) {
            goto LABEL_160;
          }
          v145 = v144;
          v146 = CFStringGetCStringPtr(v144, 0x8000100u);
          if (v146) {
            v147 = v146;
          }
          else {
            v147 = "<error getting string>";
          }
LABEL_152:
          sub_10000444C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", v147);
LABEL_159:
          CFRelease(v145);
          goto LABEL_161;
        }

        goto LABEL_69;
      }

      if (-[__CFString hasPrefix:](v17, "hasPrefix:", @"removeExcept /"))
      {
        v59 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        v60 = +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"/([^/]+)/[ \t]*([^ \t/]*)",  0LL,  0LL);
        id v61 = -[__CFString substringFromIndex:]( v17,  "substringFromIndex:",  [@"removeExcept " length]);
        v62 = v59;
        -[NSMutableDictionary setObject:forKey:](v59, "setObject:forKey:", @"remove", off_1000286C8);
        __int128 v185 = 0u;
        __int128 v186 = 0u;
        __int128 v183 = 0u;
        __int128 v184 = 0u;
        v63 = v61;
        v159 = -[NSRegularExpression matchesInString:options:range:]( v60,  "matchesInString:options:range:",  v61,  0,  0,  [v61 length]);
        id v64 = -[NSArray countByEnumeratingWithState:objects:count:]( v159,  "countByEnumeratingWithState:objects:count:",  &v183,  v208,  16LL);
        if (v64)
        {
          id v65 = v64;
          uint64_t v165 = *(void *)v184;
          while (2)
          {
            for (k = 0LL; k != v65; k = (char *)k + 1)
            {
              if (*(void *)v184 != v165) {
                objc_enumerationMutation(v159);
              }
              v67 = *(void **)(*((void *)&v183 + 1) + 8LL * (void)k);
              [v67 rangeAtIndex:2];
              if (v68)
              {
                v139 = v7[144];
                id v140 = [v67 rangeAtIndex:2];
                id v142 = [v139 stringWithFormat:@"Exception '%@' for '%@' is ill-formatted - found extra string '%@' or missing '/'!", v63, v16, objc_msgSend(v63, "substringWithRange:", v140, v141)];
                goto LABEL_154;
              }

              id v69 = [v67 rangeAtIndex:1];
              id v71 = objc_msgSend(v63, "substringWithRange:", v69, v70);
              v72 = (const __CFString *)[a4 objectForKeyedSubscript:objc_msgSend(v7[144], "stringWithFormat:", @"%@/%@", v16, v71)];
              if (v72)
              {
                v73 = v72;
                v156 = v72;
                id v74 = [v7[144] stringWithFormat:@"==> removeExcept for '%@/%@' has rule '%@', using it instead of 'keep'", v16, v71];
                v75 = CFStringCreateWithFormat(0LL, 0LL, @"%@", v74);
                if (v75)
                {
                  v76 = v75;
                  v77 = CFStringGetCStringPtr(v75, 0x8000100u);
                  if (v77) {
                    v78 = v77;
                  }
                  else {
                    v78 = "<error getting string>";
                  }
                  sub_10000444C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", v78);
                  CFRelease(v76);
                }

                else
                {
                  sub_10000444C( 1,  "%s: %s",  "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]",  "<error getting string>");
                }

                free(v74);
                v7 = &AKSIdentityCreateFirst_ptr;
              }

              else
              {
                v73 = @"keep";
              }

              -[NSMutableDictionary setObject:forKey:](v62, "setObject:forKey:", v73, v71);
            }

            id v65 = -[NSArray countByEnumeratingWithState:objects:count:]( v159,  "countByEnumeratingWithState:objects:count:",  &v183,  v208,  16LL);
            if (v65) {
              continue;
            }
            break;
          }
        }

        __int128 v181 = 0u;
        __int128 v182 = 0u;
        __int128 v179 = 0u;
        __int128 v180 = 0u;
        id v79 = [a4 countByEnumeratingWithState:&v179 objects:v207 count:16];
        if (v79)
        {
          id v80 = v79;
          uint64_t v81 = *(void *)v180;
          do
          {
            for (m = 0LL; m != v80; m = (char *)m + 1)
            {
              if (*(void *)v180 != v81) {
                objc_enumerationMutation(a4);
              }
              v83 = *(void **)(*((void *)&v179 + 1) + 8LL * (void)m);
              if (![v83 rangeOfString:objc_msgSend(v7[144], "stringWithFormat:", @"%@/", v16)])
              {
                uint64_t v85 = v84;
                v86 = (char *)[v83 length] - v84;
                id v87 = [a4 objectForKeyedSubscript:v83];
                v88 = v86;
                v7 = &AKSIdentityCreateFirst_ptr;
                -[NSMutableDictionary setObject:forKey:]( v62,  "setObject:forKey:",  v87,  objc_msgSend(v83, "substringWithRange:", v85, v88));
              }
            }

            id v80 = [a4 countByEnumeratingWithState:&v179 objects:v207 count:16];
          }

          while (v80);
        }

- (BOOL)removeFSItem:(id)a3 error:(id *)a4
{
  v7 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Deleting FS item '%@'", a3);
  v8 = CFStringCreateWithFormat(0LL, 0LL, @"%@", v7);
  if (v8)
  {
    v9 = v8;
    CStringPtr = CFStringGetCStringPtr(v8, 0x8000100u);
    v11 = "<error getting string>";
    if (CStringPtr) {
      v11 = CStringPtr;
    }
    sub_10000444C(1, "%s: %s", "-[DiskSupport removeFSItem:error:]", v11);
    CFRelease(v9);
  }

  else
  {
    sub_10000444C(1, "%s: %s", "-[DiskSupport removeFSItem:error:]", "<error getting string>");
  }

  free(v7);
  if (-[DiskSupport dryRunOnly](self, "dryRunOnly")) {
    return 1;
  }
  else {
    return -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  a3,  a4);
  }
}

- (BOOL)dryRunOnly
{
  return self->_dryRunOnly;
}

- (void)setDryRunOnly:(BOOL)a3
{
  self->_dryRunOnly = a3;
}

@end
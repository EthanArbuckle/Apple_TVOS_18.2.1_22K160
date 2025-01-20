@interface NSMetaphone
- (NSMetaphone)init;
- (id)_translateWord:(id)a3;
- (id)translate:(id)a3;
- (void)_append:(id)a3;
- (void)_append:(id)a3 alt:(id)a4;
- (void)reset;
@end

@implementation NSMetaphone

- (NSMetaphone)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSMetaphone;
  v2 = -[NSMetaphone init](&v9, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
    primary = v2->_primary;
    v2->_primary = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
    secondary = v2->_secondary;
    v2->_secondary = v5;

    v2->_isAlternate = 0;
    v7 = v2;
  }

  return v2;
}

- (void)reset
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  primary = self->_primary;
  self->_primary = v3;

  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  secondary = self->_secondary;
  self->_secondary = v5;

  self->_isAlternate = 0;
}

- (void)_append:(id)a3
{
  primary = self->_primary;
  id v5 = a3;
  -[NSMutableString appendString:](primary, "appendString:", v5);
  -[NSMutableString appendString:](self->_secondary, "appendString:", v5);
}

- (void)_append:(id)a3 alt:(id)a4
{
  primary = self->_primary;
  id v7 = a4;
  -[NSMutableString appendString:](primary, "appendString:", a3);
  -[NSMutableString appendString:](self->_secondary, "appendString:", v7);
}

- (id)_translateWord:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet punctuationCharacterSet](&OBJC_CLASS___NSCharacterSet, "punctuationCharacterSet"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 componentsSeparatedByCharactersInSet:v5]);
  id v7 = (objc_class *)&stru_835B0;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 componentsJoinedByString:&stru_835B0]);

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 uppercaseString]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([&stru_835B0 stringByAppendingFormat:@" %@ ", v9]);

  unsigned __int16 v91 = (unsigned __int16)[v10 length];
  if (v91)
  {
    v89 = v8;
    id v90 = v4;
    unsigned int v11 = sub_53F4(v10, 0, 2, &off_85170);
    id v12 = sub_5528(v10, 0, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    unsigned int v14 = [v13 isEqualToString:@"X"];

    if (v14)
    {
      -[NSMetaphone _append:](self, "_append:", @"S");
      if (v11) {
        unsigned int v11 = 2;
      }
      else {
        unsigned int v11 = 1;
      }
    }

    if (v91 > (unsigned __int16)v11)
    {
      int v15 = (unsigned __int16)v11;
      while (2)
      {
        unsigned int v16 = sub_5594(v10, (unsigned __int16)v11);
        switch(v16)
        {
          case ' ':
            v17 = self;
            v18 = @" ";
            goto LABEL_103;
          case '!':
          case '""':
          case '#':
          case '$':
          case '%':
          case '&':
          case '\'':
          case '(':
          case ')':
          case '*':
          case '+':
          case ',':
          case '-':
          case '.':
          case '/':
          case '0':
          case '1':
          case '2':
          case '3':
          case '4':
          case '5':
          case '6':
          case '7':
          case '8':
          case '9':
          case ':':
          case ';':
          case '<':
          case '=':
          case '>':
          case '?':
          case '@':
            goto LABEL_104;
          case 'A':
          case 'E':
          case 'I':
          case 'O':
          case 'U':
          case 'Y':
            v17 = self;
            v18 = @"A";
            goto LABEL_103;
          case 'B':
            -[NSMetaphone _append:](self, "_append:", @"P");
            unsigned int v20 = sub_5594(v10, (unsigned __int16)(v11 + 1));
            int v21 = v11 + 2;
            BOOL v22 = v20 == 66;
            goto LABEL_74;
          case 'C':
            if ((unsigned __int16)v11 < 2u)
            {
              if ((unsigned __int16)v11 == 1)
              {
                int v56 = 1;
                id v57 = sub_5528(v10, 1, 6);
                v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
                unsigned int v59 = [v58 isEqualToString:@"CAESAR"];

                if (v59)
                {
                  v32 = self;
                  v33 = @"S";
                  goto LABEL_249;
                }

                goto LABEL_159;
              }
            }

            else if ((sub_53F4(v10, (__int16)(v11 - 2), 1, &off_859F8) & 1) == 0)
            {
              id v23 = sub_5528(v10, (__int16)(v11 - 1), 3);
              v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
              if ([v24 isEqualToString:@"ACH"])
              {
                int v19 = v11 + 2;
                if (sub_5594(v10, (unsigned __int16)(v11 + 2)) != 73
                  && sub_5594(v10, (unsigned __int16)(v11 + 2)) != 69)
                {

LABEL_67:
                  v42 = self;
                  v43 = @"K";
LABEL_236:
                  -[NSMetaphone _append:](v42, "_append:", v43);
                  goto LABEL_237;
                }

                unsigned int v25 = sub_53F4(v10, (__int16)(v11 - 2), 6, &off_85188);

                if (v25) {
                  goto LABEL_67;
                }
              }

              else
              {
              }
            }

            int v56 = 0;
LABEL_159:
            id v67 = sub_5528(v10, (__int16)v11, 4);
            v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
            unsigned int v69 = [v68 isEqualToString:@"CHIA"];

            if (v69) {
              goto LABEL_160;
            }
            id v70 = sub_5528(v10, (__int16)v11, 2);
            v71 = (void *)objc_claimAutoreleasedReturnValue(v70);
            unsigned int v72 = [v71 isEqualToString:@"CH"];

            if (v72)
            {
              if ((_WORD)v11)
              {
                id v73 = sub_5528(v10, (__int16)v11, 4);
                v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
                unsigned int v75 = [v74 isEqualToString:@"CHAE"];

                if (v75)
                {
                  v39 = self;
                  v40 = @"K";
LABEL_230:
                  v41 = @"X";
                  goto LABEL_241;
                }
              }

              if (!v56
                || (sub_53F4(v10, 2, 5, &off_851A0) & 1) == 0
                && !sub_53F4(v10, 2, 3, &off_851B8)
                || (id v76 = sub_5528(v10, (__int16)v11, 5),
                    v77 = (void *)objc_claimAutoreleasedReturnValue(v76),
                    unsigned __int8 v78 = [v77 isEqualToString:@"CHORE"],
                    v77,
                    (v78 & 1) != 0))
              {
                if ((sub_53F4(v10, 0, 4, &off_851D0) & 1) == 0
                  && (sub_53F4(v10, 0, 3, &off_851E8) & 1) == 0
                  && (sub_53F4(v10, (__int16)(v11 - 2), 6, &off_85200) & 1) == 0)
                {
                  int v19 = v11 + 2;
                  if ((sub_53F4(v10, (__int16)(v11 + 2), 1, &off_85218) & 1) == 0
                    && ((v56 | sub_53F4(v10, (__int16)(v11 - 1), 1, &off_85230)) != 1
                     || !sub_53F4(v10, (__int16)(v11 + 2), 1, &off_85248)))
                  {
                    if (!(_WORD)v11)
                    {
                      -[NSMetaphone _append:](self, "_append:", @"X");
                      int v19 = 2;
                      goto LABEL_237;
                    }

                    v49 = self;
                    v50 = @"X";
                    v51 = @"K";
                    goto LABEL_267;
                  }
                }
              }

              goto LABEL_160;
            }

            if (sub_53F4(v10, (__int16)v11, 2, &off_85278)
              && (sub_53F4(v10, (__int16)(v11 - 2), 4, &off_85290) & 1) == 0)
            {
LABEL_229:
              v39 = self;
              v40 = @"S";
              goto LABEL_230;
            }

            int v19 = v11 + 1;
            if (sub_53F4(v10, (__int16)(v11 + 1), 3, &off_852A8))
            {
LABEL_170:
              v26 = self;
              v27 = @"X";
              goto LABEL_171;
            }

            if (sub_53F4(v10, (__int16)v11, 2, &off_852C0)
              && ((unsigned __int16)v11 != 2 || sub_5594(v10, 0) != 77))
            {
              int v19 = v11 + 2;
              if (!sub_53F4(v10, (__int16)(v11 + 2), 1, &off_852D8)
                || (sub_53F4(v10, (__int16)(v11 + 2), 2, &off_852F0) & 1) != 0)
              {
                goto LABEL_67;
              }

              if ((unsigned __int16)v11 != 2 || (unsigned int v86 = sub_5594(v10, 1u), v27 = @"KS", v86 != 65))
              {
                else {
                  v27 = @"X";
                }
              }

              v26 = self;
LABEL_171:
              -[NSMetaphone _append:](v26, "_append:", v27);
              goto LABEL_172;
            }

            if (!sub_53F4(v10, (__int16)v11, 2, &off_85338))
            {
              -[NSMetaphone _append:](self, "_append:", @"K");
              if (!sub_53F4(v10, (__int16)(v11 + 1), 2, &off_85368))
              {
                if (sub_53F4(v10, (__int16)(v11 + 1), 1, &off_85380)
                  && !sub_53F4(v10, (__int16)(v11 + 1), 2, &off_85398))
                {
                  int v19 = v11 + 2;
                }

                goto LABEL_237;
              }

- (id)translate:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  id v6 = [v4 length];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_5738;
  v10[3] = &unk_7E348;
  id v7 = v5;
  unsigned int v11 = v7;
  id v12 = self;
  objc_msgSend(v4, "enumerateSubstringsInRange:options:usingBlock:", 0, v6, 3, v10);

  v8 = v7;
  return v8;
}

- (void).cxx_destruct
{
}

@end
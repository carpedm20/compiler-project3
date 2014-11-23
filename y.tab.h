#ifndef YYERRCODE
#define YYERRCODE 256
#endif

#define RETURN 257
#define CONST 258
#define CONSTANT 259
#define EXTERN 260
#define STATIC 261
#define VOLATILE 262
#define CONTINUE 263
#define BREAK 264
#define IF 265
#define THEN 266
#define ELSE 267
#define ENDIF 268
#define FOR 269
#define ENDFOR 270
#define WHILE 271
#define ENDWHILE 272
#define SIZEOF 273
#define UNSIGNED 274
#define SIGNED 275
#define CHAR 276
#define HALF 277
#define INT 278
#define LONG 279
#define DOUBLE 280
#define FLOAT 281
#define VOID 282
#define BOOL 283
#define IDENTIFIER 284
#define ADD_ASSIGN 285
#define SUB_ASSIGN 286
#define MUL_ASSIGN 287
#define DIV_ASSIGN 288
#define MOD_ASSIGN 289
#define AND_ASSIGN 290
#define XOR_ASSIGN 291
#define OR_ASSIGN 292
#define RIGHT_ASSIGN 293
#define LEFT_ASSIGN 294
#define RIGHT_OP 295
#define LEFT_OP 296
#define PTR_OP 297
#define LE_OP 298
#define GE_OP 299
#define EQ_OP 300
#define NE_OP 301
#define INC_OP 302
#define DEC_OP 303
#define AND_OP 304
#define OR_OP 305
#define WS 306
#define STRING_LITERAL 307
#define ENUMERATION_CONSTANT 308
#define TYPEDEF_NAME 309
typedef union 
{
        int number;
        char *string;
} YYSTYPE;
extern YYSTYPE yylval;
